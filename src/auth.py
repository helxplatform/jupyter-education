from onelogin.saml2.auth import OneLogin_Saml2_Auth
from onelogin.saml2.utils import OneLogin_Saml2_Utils
import os

def init_saml_auth(req):
    parent_dir_path = os.path.abspath(os.path.join(__file__, os.pardir))
    settings_file_path = os.path.join(parent_dir_path, "saml")
    auth = OneLogin_Saml2_Auth(req, custom_base_path=settings_file_path)
    return auth