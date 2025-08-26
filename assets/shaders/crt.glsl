uniform float intensity;

vec4 effect(vec4 color, Image texture, vec2 tc, vec2 sc) {
    vec4 px = Texel(texture, sc);
    float scan = sin(tc.y * love_ScreenSize.y * 3.14159) * 0.1 * intensity;
    px.rgb -= scan;
    return px * color;
}