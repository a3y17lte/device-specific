#ifndef INIT_SEC_H
#define INIT_SEC_H

#include <string.h>

enum device_variant {
    VARIANT_A320FL = 0,
    VARIANT_A320F,
    VARIANT_A320Y,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant A320FL_model = {
    .model = "SM-A320FL",
    .codename = "a3y17ltexc"
};

static const variant A320F_model = {
    .model = "SM-A320F",
    .codename = "a3y17ltexx"
};

static const variant A320Y_model = {
    .model = "SM-A320Y",
    .codename = "a3y17ltelk"
};

static const variant *all_variants[VARIANT_MAX] = {
    &A320FL_model,
    &A320F_model,
    &A320Y_model
};

#endif // INIT_SEC_H
