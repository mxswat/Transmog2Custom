local isDisabled = false

if isDisabled then
    -- If is disabled, then disable the button
    return
end

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

require "GenerateTransmog"

local function onClick()
    GenerateTransmog('Transmog2Custom')

    local w = getCore():getScreenWidth() / 2 - 350
    local h = getCore():getScreenHeight() / 2 - 300

    local text = "<H1> Custom Transmog File Generated! <LINE><LINE> "

    local tmogPopup = ISModalRichText:new(w, h, 700, 100, text, false);
    tmogPopup:initialise();
    tmogPopup.backgroundColor = { r = 0, g = 0, b = 0, a = 0.9 };
    tmogPopup.alwaysOnTop = true;
    tmogPopup.chatText:paginate();
    tmogPopup:setY(getCore():getScreenHeight() / 2 - (tmogPopup:getHeight() / 2));
    tmogPopup:setVisible(true);
    tmogPopup:addToUIManager();
end

local old_MainScreen_instantiate = MainScreen.instantiate
function MainScreen:instantiate()
    local result = old_MainScreen_instantiate(self)

    local x = self.width - 40 - 90 - 65
    local y = self.height - FONT_HGT_SMALL - 45 - 25

    -- Color from https://www.tug.org/pracjourn/2007-4/walden/color.pdf
    local color = { r = 0.9, g = 0.5, b = 0.1, a = 1 };

    self.resetLua = ISButton:new(x, y, 90, FONT_HGT_SMALL + 1 * 2, "Generate Custom Transmog", self, onClick);
    self.resetLua:initialise();
    self.resetLua.borderColor = color;
    self.resetLua.textColor = color;
    self:addChild(self.resetLua);
    self.resetLua:setAnchorLeft(false)
    self.resetLua:setAnchorTop(false)
    self.resetLua:setAnchorRight(true)
    self.resetLua:setAnchorBottom(true)

    return result
end
