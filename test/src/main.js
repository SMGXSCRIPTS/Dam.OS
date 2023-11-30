import * as THREE from '/Dam.OS/test/src/three.module.js';
import '/Dam.OS/test/src/simplex-noise.js';
import {clouds} from '/Dam.OS/test/src/clouds.js';
import {controls} from '/Dam.OS/test/src/controls.js';
import {game} from '/Dam.OS/test/src/game.js';
import {graphics} from '/Dam.OS/test/src/graphics.js';
import {math} from '/Dam.OS/test/src/math.js';
import {textures} from '/Dam.OS/test/src/textures.js';
import {voxels} from '/Dam.OS/test/src/voxels.js';


let _APP = null;


class SimonDevCraft extends game.Game {
  constructor() {
    super();
  }

  _OnInitialize() {
    this._entities = {};

    this._LoadBackground();

    this._atlas = new textures.TextureAtlas(this);
    this._atlas.onLoad = () => {
      this._entities['_voxels'] = new voxels.SparseVoxelCellManager(this);
      this._entities['_clouds'] = new clouds.CloudManager(this);
      this._entities['_controls'] = new controls.FPSControls(
          {
            cells: this._entities['_voxels'],
            scene: this._graphics.Scene,
            camera: this._graphics.Camera
          });
    };
  }

  _LoadBackground() {
    const loader = new THREE.CubeTextureLoader();
    const texture = loader.load([
        './resources/posx.jpg',
        './resources/posx.jpg',
        './resources/posy.jpg',
        './resources/negy.jpg',
        './resources/posx.jpg',
        './resources/posx.jpg',
    ]);
    this._graphics.Scene.background = texture;
  }

  _OnStep(timeInSeconds) {
    timeInSeconds = Math.min(timeInSeconds, 1 / 10.0);

    this._StepEntities(timeInSeconds);
  }

  _StepEntities(timeInSeconds) {
    for (let k in this._entities) {
      this._entities[k].Update(timeInSeconds);
    }
  }
}


function _Main() {
  _APP = new SimonDevCraft();
}

_Main();
