# The `pgfcet` package

The `pgfcet` package exposes the perceptually-uniform colour maps presented by [colorcet.com](https://colorcet.com) in a form suitable for use as colourmaps with the `pgfplots` library. You must be using `pgfplots` with `tikz` for the colour maps to be available. Otherwise, the package has no dependencies besides the `xstring` package, which will be loaded if not yet imported.

## Usage
Installing the package is as simple as copying `tikzlibrarypgfcet.code.tex` into the same folder as the LaTeX source file you are compiling. To load the library of colour maps, use the command
> \usetikzlibrary{pgfcet}
and then load individual colour maps using the macro
> \pgfcetloadcmap{XXX}
where `XXX` is replaced by the identifier of the colour map from the webpage [https://colorcet.com/gallery.html](https://colorcet.com/gallery.html) (minus the CET- prefix), for example `L20` or `D01A`. To then use the colourmap, it can be loaded in an axis using the property
> colormap name=cet-XXX

## The colorcet colour maps
The maps used in colorcet were produced by Peter Kovesi. More information is available at [colorcet.com](https://colorcet.com), or in

*Kovesi, P. (2015)* Good Colour Maps: How to Design Them _[arXiv:1509.03700 cs.GR](https://arxiv.org/abs/1509.03700)_

## Example
See `readme.pdf` for the output of the following example.
> \usetikzlibrary{pgfcet}
\pgfcetloadcmap{R3}

\begin{figure}
    \centering
    \begin{tikzpicture}
        \begin{axis}[colormap name=cet-R3, width=10cm]
            \addplot3[
            surf,
            samples=50,
            domain=-8:8]
            {sin(deg(sqrt(x^2+y^2)))/sqrt(x^2+y^2)};
        \end{axis}
    \end{tikzpicture}
    \caption{A sample plot}
    \label{fig:example}
\end{figure}
