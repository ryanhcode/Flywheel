#ifdef FLW_EMBEDDED
flat in uint flw_vertexLightingSceneId;
in vec4 flw_vertexLightingPos;
#endif

void flw_shaderLight() {
    #ifdef FLW_EMBEDDED
    FlwLightAo light;
    if (flw_light(flw_vertexLightingSceneId, flw_vertexLightingPos.xyz, flw_vertexNormal, light)) {
        flw_fragLight = max(flw_fragLight, light.light);

        flw_fragColor.rgb *= light.ao;
    }
    #endif
}
