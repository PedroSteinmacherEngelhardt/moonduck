shader_type spatial;

void fragment() {
    // Define a cor base, caso não tenha textura aplicada
    vec4 color = vec4(0.0, 1.0, 0.0, 1.0); // Verde com alpha 1.0

    // Se uma textura estiver aplicada, use a cor da textura

    // Ajuste o valor de alpha para tornar o objeto transparente
    color.a = 0.3; // Defina o alpha para 0.3 (30% de transparência)

    // Defina a cor final do objeto
    ALBEDO = color.rgb;
    ALPHA = color.a;
}
