React = window.React
{div, li, ul} = React.DOM


Guitar = React.createClass
    render: ->
        strings = [1..6].map (num) ->
            data = {num}
            GString {data}
        div {className: "guitar"}, strings


GString = React.createClass
    render: ->
        component = @
        fretNodes = [1..16].map (num) ->

            data = {checked: false, num, stringNum: component.props.data.num}
            Fret {data}
        ul {className: "string"}, fretNodes


Fret = React.createClass
    render: ->
        className = if @props.data.checked then "on" else "off"
        li {className: "#{className} fret", "data-fret-num": @props.data.num}


React.renderComponent(
    Guitar()
    document.getElementById "container"
)
