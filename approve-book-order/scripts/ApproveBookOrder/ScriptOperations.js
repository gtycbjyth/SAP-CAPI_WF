var departmentManagerRole = "Department Manager";

var purchasingManagerRole = "Purchasing Manager";

var financialAuditManagerRole = "Financial Audit Manager";

var requestDate;

if (!$.context.History) {

    requestDate = new Date().toISOString().slice(0, 10);

    $.context.History = [];

    var decision = {

        "Role": "Requester",

        "Comment": $.context.WorkflowDetails.comment,

        "RequestDate": requestDate,

        "User": $.info.startedBy,

        "Decision": "Initial Request"

    };

    $.context.History.push(decision);

    $.context.WorkflowDetails.currentRole = departmentManagerRole;

    var author = $.context.BookOrder.authorfirstName + " " + $.context.BookOrder.authorlastName;

    var priceWithCurrencyCode = $.context.BookOrder.price + " " + $.context.BookOrder.CurrencyCode_code;

    var totalPriceWithCurrencyCode = $.context.BookOrder.totalPrice + " " + $.context.BookOrder.CurrencyCode_code;

    var totalLocalPriceWithLocalCurrencyCode = $.context.BookOrder.totalLocal + " " + $.context.BookOrder.LocalCurrencyCode_code;

    $.context.BookOrderCalcFields = {

        author: author,

        priceWithCurrencyCode: priceWithCurrencyCode,

        totalPriceWithCurrencyCode: totalPriceWithCurrencyCode,

        totalLocalPriceWithLocalCurrencyCode: totalLocalPriceWithLocalCurrencyCode

    }

}

else if ($.context.WorkflowDetails.currentRole == departmentManagerRole) {

    var task1 = $.usertasks.usertask1.last;

    prepare_decision(task1);

    $.context.WorkflowDetails.currentRole = purchasingManagerRole

}

function prepare_decision(task) {

    requestDate = new Date().toISOString().slice(0, 10);

    var decision = {

        "Role": $.context.WorkflowDetails.currentRole,

        "Comment": $.context.WorkflowDetails.comment,

        "RequestDate": requestDate,

        "User": task.processor,

        "Decision": task.decision

    };

    $.context.History.push(decision);

}