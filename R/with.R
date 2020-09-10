#' @export
with_formatters <- function(generator,
                            expr,
                            byte_formatter = generator$get_byte_formatter(),
                            dollar_formatter = generator$get_dollar_formatter(),
                            decimal_formatter = generator$get_decimal_formatter(),
                            scientific_formatter = generator$get_scientific_formatter(),
                            percent_formatter = generator$get_percent_formatter()) {

    saved_byte_formatter <- generator$get_byte_formatter()
    saved_dollar_formatter <- generator$get_dollar_formatter()
    saved_decimal_formatter <- generator$get_decimal_formatter()
    saved_scientific_formatter <- generator$get_scientific_formatter()
    saved_percent_formatter <- generator$get_percent_formatter()

    generator$set_byte_formatter(byte_formatter)
    generator$set_dollar_formatter(dollar_formatter)
    generator$set_decimal_formatter(decimal_formatter)
    generator$set_scientific_formatter(scientific_formatter)
    generator$set_percent_formatter(percent_formatter)

    result <- expr

    generator$set_byte_formatter(saved_byte_formatter)
    generator$set_dollar_formatter(saved_dollar_formatter)
    generator$set_decimal_formatter(saved_decimal_formatter)
    generator$set_scientific_formatter(saved_scientific_formatter)
    generator$set_percent_formatter(saved_percent_formatter)

    result
}

#' @export
with.LatexMacroGenerator <- function(data, expr, ...) {
    with_formatters(data, expr, ...)
}
