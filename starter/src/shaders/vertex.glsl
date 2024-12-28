uniform vec3 uLightPosition1; // First light position in world space
uniform vec3 uLightPosition2; // Second light position in world space
uniform vec3 uColor;

varying vec3 vNormal;
varying vec3 vViewPosition;
varying vec3 vLightDir1; // Light direction for the first light
varying vec3 vLightDir2; // Light direction for the second light

void main() {
    vec4 viewPosition = modelViewMatrix * vec4(position, 1.0);
    vViewPosition = -viewPosition.xyz;

    vNormal = normalize(normalMatrix * normal); // Transforming the normal

    // Calculate light directions for both lights
    vLightDir1 = normalize(uLightPosition1 - viewPosition.xyz);
    vLightDir2 = normalize(uLightPosition2 - viewPosition.xyz);

    gl_Position = projectionMatrix * viewPosition; // Position output
}
