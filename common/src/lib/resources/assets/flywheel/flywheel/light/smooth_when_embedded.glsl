#ifdef FLW_EMBEDDED
uniform float _flw_lightingSkyLightScaleUniform;
flat in uint flw_vertexLightingSceneId;
in vec4 flw_vertexLightingPos;
#endif

void flw_shaderLight() {
    #ifdef FLW_EMBEDDED
    ivec3 renderOrigin = flw_renderOrigin;

    if (flw_vertexLightingSceneId != 0) {
        renderOrigin = ivec3(0);
    }

    FlwLightAo light;
    if (flw_light(flw_vertexLightingSceneId, flw_vertexLightingPos.xyz, flw_vertexNormal, renderOrigin, light)) {
        flw_fragLight = max(flw_fragLight, light.light);

        flw_fragColor.rgb *= light.ao;
    }

    flw_fragLight.y *= _flw_lightingSkyLightScaleUniform;
    #endif
}
