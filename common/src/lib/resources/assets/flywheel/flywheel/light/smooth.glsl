#ifdef FLW_EMBEDDED
flat in uint flw_vertexLightingSceneId;
in vec4 flw_vertexLightingPos;
#endif

void flw_shaderLight() {
    uint sceneId = 0;
    vec4 vertexLightingPos;

    #ifdef FLW_EMBEDDED
    sceneId = flw_vertexLightingSceneId;
    vertexLightingPos = flw_vertexLightingPos;
    #else
    vertexLightingPos = flw_vertexPos;
    #ifdef

    FlwLightAo light;
    if (flw_light(sceneId, vertexLightingPos.xyz, flw_vertexNormal, light)) {
        flw_fragLight = max(flw_fragLight, light.light);

        flw_fragColor.rgb *= light.ao;
    }
}
