## machine generated, do not edit

const
  maxTouchpoints* = 8
  maxMousebuttons* = 3
  maxKeycodes* = 512
  maxIconimages* = 8

type
  EventType* {.pure, size:sizeof(int32).} = enum
    eventTypeInvalid,
    eventTypeKeyDown,
    eventTypeKeyUp,
    eventTypeChar,
    eventTypeMouseDown,
    eventTypeMouseUp,
    eventTypeMouseScroll,
    eventTypeMouseMove,
    eventTypeMouseEnter,
    eventTypeMouseLeave,
    eventTypeTouchesBegan,
    eventTypeTouchesMoved,
    eventTypeTouchesEnded,
    eventTypeTouchesCancelled,
    eventTypeResized,
    eventTypeIconified,
    eventTypeRestored,
    eventTypeFocused,
    eventTypeUnfocused,
    eventTypeSuspended,
    eventTypeResumed,
    eventTypeUpdateCursor,
    eventTypeQuitRequested,
    eventTypeClipboardPasted,
    eventTypeFilesDropped,

type
  Keycode* {.pure, size:sizeof(int32).} = enum
    keyCodeInvalid = 0,
    keyCodeSpace = 32,
    keyCodeApostrophe = 39,
    keyCodeComma = 44,
    keyCodeMinus = 45,
    keyCodePeriod = 46,
    keyCodeSlash = 47,
    keyCode0 = 48,
    keyCode1 = 49,
    keyCode2 = 50,
    keyCode3 = 51,
    keyCode4 = 52,
    keyCode5 = 53,
    keyCode6 = 54,
    keyCode7 = 55,
    keyCode8 = 56,
    keyCode9 = 57,
    keyCodeSemicolon = 59,
    keyCodeEqual = 61,
    keyCodeA = 65,
    keyCodeB = 66,
    keyCodeC = 67,
    keyCodeD = 68,
    keyCodeE = 69,
    keyCodeF = 70,
    keyCodeG = 71,
    keyCodeH = 72,
    keyCodeI = 73,
    keyCodeJ = 74,
    keyCodeK = 75,
    keyCodeL = 76,
    keyCodeM = 77,
    keyCodeN = 78,
    keyCodeO = 79,
    keyCodeP = 80,
    keyCodeQ = 81,
    keyCodeR = 82,
    keyCodeS = 83,
    keyCodeT = 84,
    keyCodeU = 85,
    keyCodeV = 86,
    keyCodeW = 87,
    keyCodeX = 88,
    keyCodeY = 89,
    keyCodeZ = 90,
    keyCodeLeftBracket = 91,
    keyCodeBackslash = 92,
    keyCodeRightBracket = 93,
    keyCodeGraveAccent = 96,
    keyCodeWorld1 = 161,
    keyCodeWorld2 = 162,
    keyCodeEscape = 256,
    keyCodeEnter = 257,
    keyCodeTab = 258,
    keyCodeBackspace = 259,
    keyCodeInsert = 260,
    keyCodeDelete = 261,
    keyCodeRight = 262,
    keyCodeLeft = 263,
    keyCodeDown = 264,
    keyCodeUp = 265,
    keyCodePageUp = 266,
    keyCodePageDown = 267,
    keyCodeHome = 268,
    keyCodeEnd = 269,
    keyCodeCapsLock = 280,
    keyCodeScrollLock = 281,
    keyCodeNumLock = 282,
    keyCodePrintScreen = 283,
    keyCodePause = 284,
    keyCodeF1 = 290,
    keyCodeF2 = 291,
    keyCodeF3 = 292,
    keyCodeF4 = 293,
    keyCodeF5 = 294,
    keyCodeF6 = 295,
    keyCodeF7 = 296,
    keyCodeF8 = 297,
    keyCodeF9 = 298,
    keyCodeF10 = 299,
    keyCodeF11 = 300,
    keyCodeF12 = 301,
    keyCodeF13 = 302,
    keyCodeF14 = 303,
    keyCodeF15 = 304,
    keyCodeF16 = 305,
    keyCodeF17 = 306,
    keyCodeF18 = 307,
    keyCodeF19 = 308,
    keyCodeF20 = 309,
    keyCodeF21 = 310,
    keyCodeF22 = 311,
    keyCodeF23 = 312,
    keyCodeF24 = 313,
    keyCodeF25 = 314,
    keyCodeKp0 = 320,
    keyCodeKp1 = 321,
    keyCodeKp2 = 322,
    keyCodeKp3 = 323,
    keyCodeKp4 = 324,
    keyCodeKp5 = 325,
    keyCodeKp6 = 326,
    keyCodeKp7 = 327,
    keyCodeKp8 = 328,
    keyCodeKp9 = 329,
    keyCodeKpDecimal = 330,
    keyCodeKpDivide = 331,
    keyCodeKpMultiply = 332,
    keyCodeKpSubtract = 333,
    keyCodeKpAdd = 334,
    keyCodeKpEnter = 335,
    keyCodeKpEqual = 336,
    keyCodeLeftShift = 340,
    keyCodeLeftControl = 341,
    keyCodeLeftAlt = 342,
    keyCodeLeftSuper = 343,
    keyCodeRightShift = 344,
    keyCodeRightControl = 345,
    keyCodeRightAlt = 346,
    keyCodeRightSuper = 347,
    keyCodeMenu = 348,

type Touchpoint* = object
  identifier*:uint
  posX*:cfloat
  posY*:cfloat
  changed*:bool

type
  Mousebutton* {.pure, size:sizeof(int32).} = enum
    mouseButtonLeft = 0,
    mouseButtonRight = 1,
    mouseButtonMiddle = 2,
    mouseButtonInvalid = 256,

const
  modifierShift* = 1
  modifierCtrl* = 2
  modifierAlt* = 4
  modifierSuper* = 8
  modifierLmb* = 256
  modifierRmb* = 512
  modifierMmb* = 1024

type Event* = object
  frameCount*:uint64
  `type`*:EventType
  keyCode*:Keycode
  charCode*:uint32
  keyRepeat*:bool
  modifiers*:uint32
  mouseButton*:Mousebutton
  mouseX*:cfloat
  mouseY*:cfloat
  mouseDx*:cfloat
  mouseDy*:cfloat
  scrollX*:cfloat
  scrollY*:cfloat
  numTouches*:cint
  touches*:array[8, Touchpoint]
  windowWidth*:cint
  windowHeight*:cint
  framebufferWidth*:cint
  framebufferHeight*:cint

converter to_Event_touches*[N:static[int]](items: array[N, Touchpoint]): array[8, Touchpoint] =
  static: assert(N < 8)
  for index,item in items.pairs: result[index]=item

type Range* = object
  `pointer`*:pointer
  size*:csize_t

type ImageDesc* = object
  width*:cint
  height*:cint
  pixels*:Range

type IconDesc* = object
  sokolDefault*:bool
  images*:array[8, ImageDesc]

converter to_IconDesc_images*[N:static[int]](items: array[N, ImageDesc]): array[8, ImageDesc] =
  static: assert(N < 8)
  for index,item in items.pairs: result[index]=item

type Allocator* = object
  alloc*:proc(a1:csize_t, a2:pointer):pointer {.cdecl.}
  free*:proc(a1:pointer, a2:pointer) {.cdecl.}
  userData*:pointer

type Desc* = object
  initCb*:proc() {.cdecl.}
  frameCb*:proc() {.cdecl.}
  cleanupCb*:proc() {.cdecl.}
  eventCb*:proc(a1:ptr Event) {.cdecl.}
  failCb*:proc(a1:cstring) {.cdecl.}
  userData*:pointer
  initUserdataCb*:proc(a1:pointer) {.cdecl.}
  frameUserdataCb*:proc(a1:pointer) {.cdecl.}
  cleanupUserdataCb*:proc(a1:pointer) {.cdecl.}
  eventUserdataCb*:proc(a1:ptr Event, a2:pointer) {.cdecl.}
  failUserdataCb*:proc(a1:cstring, a2:pointer) {.cdecl.}
  width*:cint
  height*:cint
  sampleCount*:cint
  swapInterval*:cint
  highDpi*:bool
  fullscreen*:bool
  alpha*:bool
  windowTitle*:cstring
  userCursor*:bool
  enableClipboard*:bool
  clipboardSize*:cint
  enableDragndrop*:bool
  maxDroppedFiles*:cint
  maxDroppedFilePathLength*:cint
  icon*:IconDesc
  allocator*:Allocator
  glForceGles2*:bool
  glMajorVersion*:cint
  glMinorVersion*:cint
  win32ConsoleUtf8*:bool
  win32ConsoleCreate*:bool
  win32ConsoleAttach*:bool
  html5CanvasName*:cstring
  html5CanvasResize*:bool
  html5PreserveDrawingBuffer*:bool
  html5PremultipliedAlpha*:bool
  html5AskLeaveSite*:bool
  iosKeyboardResizesCanvas*:bool

type
  Html5FetchError* {.pure, size:sizeof(int32).} = enum
    html5FetchErrorNoError,
    html5FetchErrorBufferTooSmall,
    html5FetchErrorOther,

type Html5FetchResponse* = object
  succeeded*:bool
  errorCode*:Html5FetchError
  fileIndex*:cint
  fetchedSize*:uint32
  bufferPtr*:pointer
  bufferSize*:uint32
  userData*:pointer

type Html5FetchRequest* = object
  droppedFileIndex*:cint
  callback*:proc(a1:ptr Html5FetchResponse) {.cdecl.}
  bufferPtr*:pointer
  bufferSize*:uint32
  userData*:pointer

proc c_isvalid():bool {.cdecl, importc:"sapp_isvalid".}
proc isvalid*():bool =
    c_isvalid()

proc c_width():cint {.cdecl, importc:"sapp_width".}
proc width*():cint =
    c_width()

proc c_widthf():cfloat {.cdecl, importc:"sapp_widthf".}
proc widthf*():cfloat =
    c_widthf()

proc c_height():cint {.cdecl, importc:"sapp_height".}
proc height*():cint =
    c_height()

proc c_heightf():cfloat {.cdecl, importc:"sapp_heightf".}
proc heightf*():cfloat =
    c_heightf()

proc c_colorFormat():cint {.cdecl, importc:"sapp_color_format".}
proc colorFormat*():cint =
    c_colorFormat()

proc c_depthFormat():cint {.cdecl, importc:"sapp_depth_format".}
proc depthFormat*():cint =
    c_depthFormat()

proc c_sampleCount():cint {.cdecl, importc:"sapp_sample_count".}
proc sampleCount*():cint =
    c_sampleCount()

proc c_highDpi():bool {.cdecl, importc:"sapp_high_dpi".}
proc highDpi*():bool =
    c_highDpi()

proc c_dpiScale():cfloat {.cdecl, importc:"sapp_dpi_scale".}
proc dpiScale*():cfloat =
    c_dpiScale()

proc c_showKeyboard(show:bool):void {.cdecl, importc:"sapp_show_keyboard".}
proc showKeyboard*(show:bool):void =
    c_showKeyboard(show)

proc c_keyboardShown():bool {.cdecl, importc:"sapp_keyboard_shown".}
proc keyboardShown*():bool =
    c_keyboardShown()

proc c_isFullscreen():bool {.cdecl, importc:"sapp_is_fullscreen".}
proc isFullscreen*():bool =
    c_isFullscreen()

proc c_toggleFullscreen():void {.cdecl, importc:"sapp_toggle_fullscreen".}
proc toggleFullscreen*():void =
    c_toggleFullscreen()

proc c_showMouse(show:bool):void {.cdecl, importc:"sapp_show_mouse".}
proc showMouse*(show:bool):void =
    c_showMouse(show)

proc c_mouseShown():bool {.cdecl, importc:"sapp_mouse_shown".}
proc mouseShown*():bool =
    c_mouseShown()

proc c_lockMouse(lock:bool):void {.cdecl, importc:"sapp_lock_mouse".}
proc lockMouse*(lock:bool):void =
    c_lockMouse(lock)

proc c_mouseLocked():bool {.cdecl, importc:"sapp_mouse_locked".}
proc mouseLocked*():bool =
    c_mouseLocked()

proc c_userdata():pointer {.cdecl, importc:"sapp_userdata".}
proc userdata*():pointer =
    c_userdata()

proc c_queryDesc():Desc {.cdecl, importc:"sapp_query_desc".}
proc queryDesc*():Desc =
    c_queryDesc()

proc c_requestQuit():void {.cdecl, importc:"sapp_request_quit".}
proc requestQuit*():void =
    c_requestQuit()

proc c_cancelQuit():void {.cdecl, importc:"sapp_cancel_quit".}
proc cancelQuit*():void =
    c_cancelQuit()

proc c_quit():void {.cdecl, importc:"sapp_quit".}
proc quit*():void =
    c_quit()

proc c_consumeEvent():void {.cdecl, importc:"sapp_consume_event".}
proc consumeEvent*():void =
    c_consumeEvent()

proc c_frameCount():uint64 {.cdecl, importc:"sapp_frame_count".}
proc frameCount*():uint64 =
    c_frameCount()

proc c_frameDuration():cdouble {.cdecl, importc:"sapp_frame_duration".}
proc frameDuration*():cdouble =
    c_frameDuration()

proc c_setClipboardString(str:cstring):void {.cdecl, importc:"sapp_set_clipboard_string".}
proc setClipboardString*(str:cstring):void =
    c_setClipboardString(str)

proc c_getClipboardString():cstring {.cdecl, importc:"sapp_get_clipboard_string".}
proc getClipboardString*():cstring =
    c_getClipboardString()

proc c_setWindowTitle(str:cstring):void {.cdecl, importc:"sapp_set_window_title".}
proc setWindowTitle*(str:cstring):void =
    c_setWindowTitle(str)

proc c_setIcon(icon_desc:ptr IconDesc):void {.cdecl, importc:"sapp_set_icon".}
proc setIcon*(icon_desc:IconDesc):void =
    c_setIcon(unsafeAddr(icon_desc))

proc c_getNumDroppedFiles():cint {.cdecl, importc:"sapp_get_num_dropped_files".}
proc getNumDroppedFiles*():cint =
    c_getNumDroppedFiles()

proc c_getDroppedFilePath(index:cint):cstring {.cdecl, importc:"sapp_get_dropped_file_path".}
proc getDroppedFilePath*(index:cint):cstring =
    c_getDroppedFilePath(index)

proc c_run(desc:ptr Desc):void {.cdecl, importc:"sapp_run".}
proc run*(desc:Desc):void =
    c_run(unsafeAddr(desc))

proc c_gles2():bool {.cdecl, importc:"sapp_gles2".}
proc gles2*():bool =
    c_gles2()

proc c_html5AskLeaveSite(ask:bool):void {.cdecl, importc:"sapp_html5_ask_leave_site".}
proc html5AskLeaveSite*(ask:bool):void =
    c_html5AskLeaveSite(ask)

proc c_html5GetDroppedFileSize(index:cint):uint32 {.cdecl, importc:"sapp_html5_get_dropped_file_size".}
proc html5GetDroppedFileSize*(index:cint):uint32 =
    c_html5GetDroppedFileSize(index)

proc c_html5FetchDroppedFile(request:ptr Html5FetchRequest):void {.cdecl, importc:"sapp_html5_fetch_dropped_file".}
proc html5FetchDroppedFile*(request:Html5FetchRequest):void =
    c_html5FetchDroppedFile(unsafeAddr(request))

proc c_metalGetDevice():pointer {.cdecl, importc:"sapp_metal_get_device".}
proc metalGetDevice*():pointer =
    c_metalGetDevice()

proc c_metalGetRenderpassDescriptor():pointer {.cdecl, importc:"sapp_metal_get_renderpass_descriptor".}
proc metalGetRenderpassDescriptor*():pointer =
    c_metalGetRenderpassDescriptor()

proc c_metalGetDrawable():pointer {.cdecl, importc:"sapp_metal_get_drawable".}
proc metalGetDrawable*():pointer =
    c_metalGetDrawable()

proc c_macosGetWindow():pointer {.cdecl, importc:"sapp_macos_get_window".}
proc macosGetWindow*():pointer =
    c_macosGetWindow()

proc c_iosGetWindow():pointer {.cdecl, importc:"sapp_ios_get_window".}
proc iosGetWindow*():pointer =
    c_iosGetWindow()

proc c_d3d11GetDevice():pointer {.cdecl, importc:"sapp_d3d11_get_device".}
proc d3d11GetDevice*():pointer =
    c_d3d11GetDevice()

proc c_d3d11GetDeviceContext():pointer {.cdecl, importc:"sapp_d3d11_get_device_context".}
proc d3d11GetDeviceContext*():pointer =
    c_d3d11GetDeviceContext()

proc c_d3d11GetSwapChain():pointer {.cdecl, importc:"sapp_d3d11_get_swap_chain".}
proc d3d11GetSwapChain*():pointer =
    c_d3d11GetSwapChain()

proc c_d3d11GetRenderTargetView():pointer {.cdecl, importc:"sapp_d3d11_get_render_target_view".}
proc d3d11GetRenderTargetView*():pointer =
    c_d3d11GetRenderTargetView()

proc c_d3d11GetDepthStencilView():pointer {.cdecl, importc:"sapp_d3d11_get_depth_stencil_view".}
proc d3d11GetDepthStencilView*():pointer =
    c_d3d11GetDepthStencilView()

proc c_win32GetHwnd():pointer {.cdecl, importc:"sapp_win32_get_hwnd".}
proc win32GetHwnd*():pointer =
    c_win32GetHwnd()

proc c_wgpuGetDevice():pointer {.cdecl, importc:"sapp_wgpu_get_device".}
proc wgpuGetDevice*():pointer =
    c_wgpuGetDevice()

proc c_wgpuGetRenderView():pointer {.cdecl, importc:"sapp_wgpu_get_render_view".}
proc wgpuGetRenderView*():pointer =
    c_wgpuGetRenderView()

proc c_wgpuGetResolveView():pointer {.cdecl, importc:"sapp_wgpu_get_resolve_view".}
proc wgpuGetResolveView*():pointer =
    c_wgpuGetResolveView()

proc c_wgpuGetDepthStencilView():pointer {.cdecl, importc:"sapp_wgpu_get_depth_stencil_view".}
proc wgpuGetDepthStencilView*():pointer =
    c_wgpuGetDepthStencilView()

proc c_androidGetNativeActivity():pointer {.cdecl, importc:"sapp_android_get_native_activity".}
proc androidGetNativeActivity*():pointer =
    c_androidGetNativeActivity()

when defined windows:
  when not defined vcc:
    {.passl:"-lkernel32 -luser32 -lshell32 -lgdi32".}
  when defined gl:
    {.passc:"-DSOKOL_GLCORE33".}
  else:
    {.passc:"-DSOKOL_D3D11".}
    when not defined vcc:
      {.passl:"-ld3d11 -ldxgi".}
elif defined macosx:
  {.passc:"-x objective-c".}
  {.passl:"-framework Cocoa -framework QuartzCore".}
  when defined gl:
    {.passc:"-DSOKOL_GLCORE33".}
    {.passl:"-framework OpenGL".}
  else:
    {.passc:"-DSOKOL_METAL".}
    {.passl:"-framework Metal -framework MetalKit".}
elif defined linux:
  {.passc:"-DSOKOL_GLCORE33".}
  {.passl:"-lX11 -lXi -lXcursor -lGL -lm -ldl -lpthread".}
else:
  error("unsupported platform")

{.passc:"-DSOKOL_NIM_IMPL".}
{.compile:"c/sokol_app.c".}
