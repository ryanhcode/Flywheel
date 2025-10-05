#ifdef FLW_EMBEDDED
flat in uint flw_vertexLightingSceneId;
in vec4 flw_vertexLightingPos;
#endif

void flw_shaderLight() {
    vec2 embeddedLight;

    uint sceneId = 0;

    vec4 vertexLightingPos;

    #ifdef FLW_EMBEDDED
    sceneId = flw_vertexLightingSceneId;
    vertexLightingPos = flw_vertexLightingPos;
    #else
    vertexLightingPos = flw_vertexPos;
    #ifdef

    if (flw_lightFetch(sceneId, ivec3(floor(vertexLightingPos.xyz)) + flw_renderOrigin, embeddedLight)) {
        flw_fragLight = max(flw_fragLight, embeddedLight);
    }
}
