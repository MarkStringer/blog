function trim(s) {
    return rtrim(ltrim(s));
}

function ltrim(s) {
    var l = 0;
    while (l < s.length && s[l] == ' ')
    { l++; }
    return s.substring(l, s.length);
}

function rtrim(s) {
    var r = s.length - 1;
    while (r > 0 && s[r] == ' ')
    { r -= 1; }
    return s.substring(0, r + 1);
}


function doCapitalize(ctrl) {
    //alert(ctrl.value);
    ctrl.value=ctrl.value.toLowerCase();
    ctrl.value = toTitleCase(ctrl.value, /([\w&`'‘’"“.@:\/\{\(\[<>_]+-? *)/g);
    ctrl.value = toSpecialCase(ctrl.value, /(\w)'(\w+)/g);
}

function toSpecialCase(str, caseregex) {
    return str.replace(caseregex,
        function (match, p1, index, title) {
            return match.charAt(0).toUpperCase() + match.charAt(1) + match.charAt(2).toUpperCase() + match.substr(3);
        });
}

function toTitleCase(str, caseregex) {
    return str.replace(caseregex,
        function (match, p1, index, title) {
            //alert("match =" + match + " title =" + title + " p1 =" + p1 + " index =" + index);

            // ' fix syntax highlighting 
            if (index > 0 && title.charAt(index - 2) != ":" &&
                match.search(/^(a(nd?|s|t)?|b(ut|y)|en|for|i[fn]|o[fnr]|t(he|o)|vs?\.?|via)[ -]/i) > -1)
                return match.toLowerCase();

            if (match.search(/^(mc)/i) > -1) {
                var re = match.charAt(0).toUpperCase() + match.charAt(1).toLowerCase() + match.charAt(2).toUpperCase() + match.substr(3);
                //alert(re);
                return re;
            }

            if (match.search(/^(mac)/i) > -1) {
                var re = match.charAt(0).toUpperCase() + match.charAt(1).toLowerCase() + match.charAt(2).toLowerCase() + match.charAt(3).toUpperCase() + match.substr(4);
                //alert(re);
                return re;
            }

            if (title.substring(index - 1, index + 1).search(/['"_{([]/) > -1)
                return match.charAt(0) + match.charAt(1).toUpperCase() + match.substr(2);
            if (match.substr(1).search(/[A-Z]+|&|[\w]+[._][\w]+/) > -1 ||
                title.substring(index - 1, index + 1).search(/[\])}]/) > -1)
                return match;

            return match.charAt(0).toUpperCase() + match.substr(1);
        });
}