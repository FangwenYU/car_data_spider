import os, json

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
PROJ_DIR = os.path.dirname(CURR_DIR)


class CarModel(object):

    def __init__(self, make_id, make_name, make_nicename, model_id,
                model_name, model_nicename,
                year_id, year, style_id, style_name, style_trim,
                submodel_body, submodel_name, submodel_nicename):
        self.make_id = make_id
        self.make_name = make_name
        self.make_nicename = make_nicename
        self.model_id = model_id
        self.model_name = model_name
        self.model_nicename = model_nicename
        self.year_id = year_id
        self.year = year
        self.style_id = style_id
        self.style_name = style_name
        self.style_trim = style_trim
        self.submodel_body = submodel_body
        self.submodel_name = submodel_name
        self.submodel_nicename = submodel_nicename

    def to_csv(self):
        return '"{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}","{}"\n'.format(
            self.make_id,
            self.make_name,
            self.make_nicename,
            self.model_id,
            self.model_name,
            self.model_nicename,
            self.year_id,
            self.year,
            self.style_id,
            self.style_name,
            self.style_trim,
            self.submodel_body,
            self.submodel_name,
            self.submodel_nicename
        )


def car_make():
    for line in open(os.path.join(PROJ_DIR, 'carmake.txt')):
        token = line.split(',')
        if len(token) > 0 :
            make = token[0].strip()
            if make:
                yield make


def save_car_make(make, content):
    with open(os.path.join(PROJ_DIR, 'carmake', '{}.txt'.format(make)), 'w') as f:
        f.write(content)


def save_autohome(car_type_id, autohome_car):
    with open(os.path.join(PROJ_DIR, 'autohome', 'rawdata', '{}.txt'.format(car_type_id)), 'w') as f:
        f.write(autohome_car.encode('utf-8'))


def save_autohome_carid(carid_list):
    with open(os.path.join(PROJ_DIR, 'autohome', 'rawdata', 'carid.txt'), 'a') as f:
        for car_id in carid_list:
            f.write(car_id)
            f.write('\n')

def get_autohome_carid_list():
    carid_list = []
    for line in open(os.path.join(PROJ_DIR, 'autohome', 'rawdata', 'carid.txt'), 'r'):
        carid_list.append(line.strip())
    return set(carid_list)


def init_autohome_carid_file():
    """
    purge file conent
    """
    with open(os.path.join(PROJ_DIR, 'autohome', 'rawdata', 'carid.txt'), 'w') as f:
        f.write('')



def parse_car_model(make):
    data = json.load(open(os.path.join(PROJ_DIR, 'carmake', '{}.txt'.format(make))))
    for model in data['models']:
        make_id = model['make']['id']
        make_name = model['make']['name']
        make_nicename = model['make']['niceName']
        model_id = model['id']
        model_name = model['name']
        model_nicename = model['niceName']
        for year in model['years']:
            year_id = year['id']
            year_year = year['year']
            for style in year['styles']:
                print "--Style Id:{}".format(style['id'])
                style_id = style['id']
                style_name = style['name']
                style_trim = style['trim']
                if style['submodel'].get('body'):
                    style_submodel_body = style['submodel']['body']
                else:
                    style_submodel_body = style['submodel']['tuner']
                style_submodel_modelname = style['submodel']['modelName']
                style_submodel_nicename = style['submodel']['niceName']

                car_model = CarModel(make_id, make_name, make_nicename,
                                     model_id, model_name, model_nicename,
                                     year_id, year_year,
                                     style_id, style_name, style_trim,
                                     style_submodel_body, style_submodel_modelname, style_submodel_nicename)
                yield car_model


def save_car_model(make):
    with open(os.path.join(PROJ_DIR, 'carmodel', '{}.txt'.format(make)), 'w') as f:
        for model in parse_car_model(make):
            f.write(model.to_csv())


def save_car_models():
    for make in car_make():
        print "Processing {}".format(make)
        save_car_model(make)


def init_car_feature(make):
    """
    purge file conent
    :param make:
    :return:
    """
    with open(os.path.join(PROJ_DIR, 'carfeature', '{}.txt'.format(make)), 'w') as f:
        f.write('')

def save_car_feature(make, model, year, sub_model, feature_list):
    with open(os.path.join(PROJ_DIR, 'carfeature', '{}.txt'.format(make)), 'a') as f:
        for key, value in feature_list.iteritems():
                feature_name = key
                for feature_value in value:
                    f.write('"{}","{}","{}","{}","{}","{}"\n'.format(make, model, year, sub_model, feature_name, feature_value))


def prepare_car_feature_scrap():
    for make_file in os.listdir(os.path.join(PROJ_DIR, 'carmodel')):
        print "Processing {}".format(make_file)
        with open(os.path.join(PROJ_DIR, 'carmodel', make_file), 'r') as f:
            model_list = []
            for line in f:
                tokens = line.strip().split(',')
                make = tokens[2].strip('"')
                model = tokens[5].strip('"')
                year = tokens[7].strip('"')
                sub_model = tokens[-1].strip('"')
                model_list.append('{}|{}|{}|{}'.format(make, model, year, sub_model))

        with open(os.path.join(PROJ_DIR, 'carmodel2', make_file), 'w') as f:
            for item in set(model_list):
                f.write(item)
                f.write('\n')


def process_car_feature_scrap(make):
    for line in open(os.path.join(PROJ_DIR, 'carmodel2', '{}.txt'.format(make))):
        make, model, year, sub_model = line.strip().split('|')
        yield (make, model, year, sub_model)
