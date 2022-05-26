uses SDL2,SDL2_image;
var
	
	sdlWindow1:PSDL_Window;
	sdlRenderer:PSDL_Renderer;
	sdlSurfaceFormula,sdlSurfaceRedCar,sdlSurfaceGreenCar,sdlSurfaceYellowCar,sdlSurfacePurpelCar,sdlSurfaceDefeat,sdlSurfaceRoad:PSDL_Surface;
	sdlTextureFormula,sdlTextureRedCar,sdlTextureGreenCar,sdlTextureYellowCar,sdlTexturePurpelCar,sdlTextureDefeat,sdlTextureRoad:PSDL_Texture;
	sdlRectFormula,sdlRectRedCar,sdlRectGreenCar,sdlRectYellowCar,sdlRectPurpelCar,sdlRectDefeat,sdlRectRoad:TSDL_Rect;
	sdlKeyboardState: PUInt8;
	start,machine,ride,j,g:integer;
	a:PSDL_Event;
	
Begin
	
	if SDL_Init(SDL_INIT_VIDEO) < 0 Then Halt;
	sdlWindow1:=SDL_CreateWindow('Window1', 400, 100, 800, 900, SDL_WINDOW_SHOWN);
	if sdlWindow1=nil Then Halt;
	sdlRenderer:=SDL_CreateRenderer(sdlWindow1, -1, 0);
		new(a);
	
	randomize;
	
	machine:=1;
	start:=1;
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceFormula:=IMG_LOAD('Formula1.png');
	sdlTextureFormula:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceFormula);
	SDL_FreeSurface(sdlSurfaceFormula);
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceDefeat:=IMG_LOAD('Defeat.png');
	sdlTextureDefeat:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceDefeat);
	SDL_FreeSurface(sdlSurfaceDefeat);
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceRedCar:=IMG_LOAD('RedCar.png');
	sdlTextureRedCar:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceRedCar);
	SDL_FreeSurface(sdlSurfaceRedCar);
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceGreenCar:=IMG_LOAD('GreenCar.png');
	sdlTextureGreenCar:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceGreenCar);
	SDL_FreeSurface(sdlSurfaceGreenCar);
	
	if sdlRenderer = nil then Halt;
	sdlSurfacePurpelCar:=IMG_LOAD('PurpelCar.png');
	sdlTexturePurpelCar:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfacePurpelCar);
	SDL_FreeSurface(sdlSurfacePurpelCar);
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceYellowCar:=IMG_LOAD('YellowCar.png');
	sdlTextureYellowCar:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceYellowCar);
	SDL_FreeSurface(sdlSurfaceYellowCar);
	
	if sdlRenderer = nil then Halt;
	sdlSurfaceRoad:=IMG_LOAD('road.png');
	sdlTextureRoad:=SDL_CreateTextureFromSurface(sdlRenderer,sdlSurfaceRoad);
	SDL_FreeSurface(sdlSurfaceRoad);
	
	
	sdlRectRoad.x:=200;
	sdlRectRoad.y:=0;
	sdlRectRoad.h:=900;
	sdlRectRoad.w:=350;
	
	
	sdlRectDefeat.x:=300;
	sdlRectDefeat.y:=300;
	sdlRectDefeat.h:=100;
	sdlRectDefeat.w:=200;
	
	sdlRectFormula.x:=400;
	sdlRectFormula.y:=700;
	sdlRectFormula.h:=100;
	sdlRectFormula.w:=50;
	
	sdlRectGreenCar.x:=200;
	sdlRectGreenCar.y:=0;
	sdlRectGreenCar.h:=100;
	sdlRectGreenCar.w:=50;
	
	sdlRectRedCar.x:=300;
	sdlRectRedCar.y:=0;
	sdlRectRedCar.h:=100;
	sdlRectRedCar.w:=50;
	
	sdlRectPurpelCar.x:=400;
	sdlRectPurpelCar.y:=0;
	sdlRectPurpelCar.h:=100;
	sdlRectPurpelCar.w:=50;
	
	sdlRectYellowCar.x:=500;
	sdlRectYellowCar.y:=0;
	sdlRectYellowCar.h:=100;
	sdlRectYellowCar.w:=50;
		
	while start=1 do
			begin	
					SDL_RenderClear(sdlRenderer);
					
					
					SDL_SetRenderDrawColor(sdlRenderer, 255,255,255, SDL_ALPHA_OPAQUE);
					
					SDL_RenderCopy(sdlRenderer,sdlTextureRoad,nil,@sdlRectRoad);
						
					SDL_RenderCopy(sdlRenderer,sdlTextureFormula,nil,@sdlRectFormula);
					
					SDL_RenderCopy(sdlRenderer,sdlTextureGreenCar,nil,@sdlRectGreenCar);
					
					SDL_RenderCopy(sdlRenderer,sdlTextureRedCar,nil,@sdlRectRedCar);
					
					SDL_RenderCopy(sdlRenderer,sdlTexturePurpelCar,nil,@sdlRectPurpelCar);
					
					SDL_RenderCopy(sdlRenderer,sdlTextureYellowCar,nil,@sdlRectYellowCar);
					SDL_Delay(10);
					
					SDL_RenderPresent(sdlRenderer);
					
					if machine=1 then
					begin
					
					ride:=random(5);
					end;
					
					if ride=1 then
					begin
					j:=random(10);
					sdlRectYellowCar.y:=sdlRectYellowCar.y+j;
					end;
					
					if sdlRectYellowCar.y>800 then
					begin
					ride:=0;
					machine:=0;
					sdlRectYellowCar.y:=0;
					machine:=1;
					end;
					
					if ride=4 then
					begin
					j:=random(20);
					sdlRectGreenCar.y:=sdlRectGreenCar.y+j;
					end;
					
					if sdlRectGreenCar.y>800 then
					begin
					ride:=0;
					machine:=0;
					sdlRectGreenCar.y:=0;
					machine:=1;
					end;
					
					
					if sdlRectYellowCar.y>800 then
					begin
					ride:=0;
					machine:=0;
					sdlRectYellowCar.y:=0;
					machine:=1;
					end;
					
					if ride=2 then
					begin
					j:=random(35);
					sdlRectRedCar.y:=sdlRectRedCar.y+j;
					end;
					
					if sdlRectRedCar.y>800 then
					begin
					ride:=0;
					machine:=0;
					sdlRectRedCar.y:=0;
					machine:=1;
					end;
					
					if ride=3 then
					begin
					j:=random(30);
					sdlRectPurpelCar.y:=sdlRectPurpelCar.y+j;
					end;
					
					if sdlRectPurpelCar.y>800 then
					begin
					ride:=0;
					machine:=0;
					sdlRectPurpelCar.y:=0;
					machine:=1;
					end;
					
					if (sdlRectGreenCar.y>sdlRectFormula.y-sdlRectFormula.h) and  (sdlRectGreenCar.x=sdlRectFormula.x) then
					begin
					SDL_RenderClear(sdlRenderer);
					SDL_RenderCopy(sdlRenderer,sdlTextureDefeat,nil,@sdlRectDefeat);
					SDL_RenderPresent(sdlRenderer);
					SDL_Delay(1000);
					SDL_DestroyRenderer(sdlRenderer);
					SDL_DestroyWindow (sdlWindow1);
					SDL_Quit;
					end;
					
					if (sdlRectYellowCar.y>sdlRectFormula.y-sdlRectFormula.h) and  (sdlRectYellowCar.x=sdlRectFormula.x) then
					begin
					SDL_RenderClear(sdlRenderer);
					SDL_RenderCopy(sdlRenderer,sdlTextureDefeat,nil,@sdlRectDefeat);
					SDL_RenderPresent(sdlRenderer);
					SDL_Delay(1000);
					SDL_DestroyRenderer(sdlRenderer);
					SDL_DestroyWindow (sdlWindow1);
					SDL_Quit;
					end;
					
					if (sdlRectRedCar.y>sdlRectFormula.y-sdlRectFormula.h) and  (sdlRectRedCar.x=sdlRectFormula.x)then
					begin
					SDL_RenderClear(sdlRenderer);
					SDL_RenderCopy(sdlRenderer,sdlTextureDefeat,nil,@sdlRectDefeat);
					SDL_RenderPresent(sdlRenderer);
					SDL_Delay(1000);
					SDL_DestroyRenderer(sdlRenderer);
					SDL_DestroyWindow (sdlWindow1);
					SDL_Quit;
					end;
					
					if (sdlRectPurpelCar.y>sdlRectFormula.y-sdlRectFormula.h) and  (sdlRectPurpelCar.x=sdlRectFormula.x)then
					begin
					SDL_RenderClear(sdlRenderer);
					SDL_RenderCopy(sdlRenderer,sdlTextureDefeat,nil,@sdlRectDefeat);
					SDL_RenderPresent(sdlRenderer);
					SDL_Delay(1000);
					SDL_DestroyRenderer(sdlRenderer);
					SDL_DestroyWindow (sdlWindow1);
					SDL_Quit;
					end;
					
					if sdlRectFormula.x>500 then
								begin
								sdlRectFormula.x:=500;
								end;
					
					if sdlRectFormula.x<200 then
								begin
								sdlRectFormula.x:=200;
								end;
					
					SDL_PumpEvents;
					sdlKeyboardState := SDL_GetKeyboardState(nil);
			
			
								if sdlKeyboardState[SDL_SCANCODE_ESCAPE] = 1 then
								begin
								SDL_DestroyRenderer(sdlRenderer);
								SDL_DestroyWindow (sdlWindow1);
								SDL_Quit;
								end;

								if sdlKeyboardState[SDL_SCANCODE_A] = 1 then
								begin
								sdlRectFormula.x := sdlRectFormula.x-100;
								SDL_Delay(200);
								if sdlRectFormula.x<200 then
								begin
								sdlRectFormula.x:=200;
								end;
								end;
								if sdlKeyboardState[SDL_SCANCODE_D] = 1 then
								begin
								sdlRectFormula.x := sdlRectFormula.x+100;
								SDL_Delay(200);	
								if sdlRectFormula.x>500 then
								begin
								sdlRectFormula.x:=500;
								end;
								end;						
								
			end;	
	
		
End.
