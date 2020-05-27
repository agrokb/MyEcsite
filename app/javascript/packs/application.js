require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

const images = require.context('../images',true);
const imagePath = (name) => images(name,true);

import "controllers";

import "../scripts/shared/application";
import "..//scripts/frontend/application";

import "styles/shared"
import "styles/frontend"



require("trix")
require("@rails/actiontext")