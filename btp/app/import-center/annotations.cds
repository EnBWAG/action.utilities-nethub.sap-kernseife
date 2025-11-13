using AdminService as service from '../../srv/admin-service';

annotate service.Imports with @(
    UI.LineItem                           : [
        {
            $Type            : 'UI.DataField',
            Label            : '{i18n>title}',
            Value            : title,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Label            : '{i18n>status}',
            Value            : status,
            ![@UI.Importance]: #Medium,
        },
        {
            $Type            : 'UI.DataField',
            Label            : '{i18n>jobStatus}',
            Value            : job.status,
            ![@UI.Importance]: #Medium,
        },
        {
            $Type            : 'UI.DataField',
            Value            : createdAt,
            ![@UI.Importance]: #Medium,
        }
    ],
    UI.SelectionPresentationVariant #table: {
        $Type              : 'UI.SelectionPresentationVariantType',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            Visualizations: ['@UI.LineItem',
            ],
            SortOrder     : [{
                $Type     : 'Common.SortOrderType',
                Property  : createdAt,
                Descending: true,
            }, ],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: [],
        },
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>generalInformation}',
            ID : 'generalInformation',
            Target : '@UI.FieldGroup#generalInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'progressCurrent',
            Target : 'job/@UI.DataPoint#progress',
        },
    ],
    UI.FieldGroup #generalInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : file,
                Label : '{i18n>file}',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : '{i18n>status}',
            },
        ],
    },
);

annotate service.Imports with @(UI.HeaderInfo: {
    Title         : {
        $Type: 'UI.DataField',
        Value: title,
    },
    TypeName      : '{i18n>import}',
    TypeNamePlural: '{i18n>imports}',
});
annotate service.Jobs with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : progressCurrent,
        Title : '{i18n>progress}',
        TargetValue : progressTotal,
        Visualization : #Progress,
    },
    UI.DataPoint #progress1 : {
        $Type : 'UI.DataPointType',
        Value : progressTotal,
        Title : 'progressTotal',
        TargetValue : 100,
        Visualization : #Progress,
    },
);

