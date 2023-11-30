import * as THREE from '/Dam.OS/test/src/three.module.js';
import {WEBGL} from '/Dam.OS/test/src/WebGL.js';
import {graphics} from '/Dam.OS/test/src/graphics.js';

export const game = (function() {
  return {
    Game: class {
      constructor() {
        this._Initialize();
      }

      _Initialize() {
        this._graphics = new graphics.Graphics(this);
        if (!this._graphics.Initialize()) {
          this._DisplayError('WebGL2 is not available.');
          return;
        }

        this._previousRAF = null;

        this._OnInitialize();
        this._RAF();
      }

      _DisplayError(errorText) {
        const error = document.getElementById('error');
        error.innerText = errorText;
      }

      _RAF() {
        requestAnimationFrame((t) => {
          if (this._previousRAF === null) {
            this._previousRAF = t;
          }
          this._Render(t - this._previousRAF);
          this._previousRAF = t;
        });
      }

      _Render(timeInMS) {
        const timeInSeconds = timeInMS * 0.001;
        this._OnStep(timeInSeconds);
        this._graphics.Render(timeInSeconds);

        this._RAF();
      }
    }
  };
})();
