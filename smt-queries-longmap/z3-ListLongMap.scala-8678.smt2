; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105668 () Bool)

(assert start!105668)

(declare-fun b_free!27103 () Bool)

(declare-fun b_next!27103 () Bool)

(assert (=> start!105668 (= b_free!27103 (not b_next!27103))))

(declare-fun tp!94822 () Bool)

(declare-fun b_and!44951 () Bool)

(assert (=> start!105668 (= tp!94822 b_and!44951)))

(declare-fun b!1257612 () Bool)

(declare-fun res!838051 () Bool)

(declare-fun e!715026 () Bool)

(assert (=> b!1257612 (=> (not res!838051) (not e!715026))))

(declare-datatypes ((array!81697 0))(
  ( (array!81698 (arr!39403 (Array (_ BitVec 32) (_ BitVec 64))) (size!39940 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81697)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81697 (_ BitVec 32)) Bool)

(assert (=> b!1257612 (= res!838051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257613 () Bool)

(declare-fun e!715028 () Bool)

(declare-fun e!715025 () Bool)

(declare-fun mapRes!49792 () Bool)

(assert (=> b!1257613 (= e!715028 (and e!715025 mapRes!49792))))

(declare-fun condMapEmpty!49792 () Bool)

(declare-datatypes ((V!48039 0))(
  ( (V!48040 (val!16065 Int)) )
))
(declare-datatypes ((ValueCell!15239 0))(
  ( (ValueCellFull!15239 (v!18761 V!48039)) (EmptyCell!15239) )
))
(declare-datatypes ((array!81699 0))(
  ( (array!81700 (arr!39404 (Array (_ BitVec 32) ValueCell!15239)) (size!39941 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81699)

(declare-fun mapDefault!49792 () ValueCell!15239)

(assert (=> b!1257613 (= condMapEmpty!49792 (= (arr!39404 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15239)) mapDefault!49792)))))

(declare-fun b!1257614 () Bool)

(declare-fun res!838049 () Bool)

(assert (=> b!1257614 (=> (not res!838049) (not e!715026))))

(declare-datatypes ((List!28005 0))(
  ( (Nil!28002) (Cons!28001 (h!29219 (_ BitVec 64)) (t!41484 List!28005)) )
))
(declare-fun arrayNoDuplicates!0 (array!81697 (_ BitVec 32) List!28005) Bool)

(assert (=> b!1257614 (= res!838049 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28002))))

(declare-fun b!1257615 () Bool)

(declare-fun e!715029 () Bool)

(declare-fun tp_is_empty!32005 () Bool)

(assert (=> b!1257615 (= e!715029 tp_is_empty!32005)))

(declare-fun mapIsEmpty!49792 () Bool)

(assert (=> mapIsEmpty!49792 mapRes!49792))

(declare-fun b!1257616 () Bool)

(declare-fun e!715023 () Bool)

(assert (=> b!1257616 (= e!715026 (not e!715023))))

(declare-fun res!838053 () Bool)

(assert (=> b!1257616 (=> res!838053 e!715023)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257616 (= res!838053 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20774 0))(
  ( (tuple2!20775 (_1!10398 (_ BitVec 64)) (_2!10398 V!48039)) )
))
(declare-datatypes ((List!28006 0))(
  ( (Nil!28003) (Cons!28002 (h!29220 tuple2!20774) (t!41485 List!28006)) )
))
(declare-datatypes ((ListLongMap!18655 0))(
  ( (ListLongMap!18656 (toList!9343 List!28006)) )
))
(declare-fun lt!568528 () ListLongMap!18655)

(declare-fun lt!568530 () ListLongMap!18655)

(assert (=> b!1257616 (= lt!568528 lt!568530)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48039)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48039)

(declare-fun minValueBefore!43 () V!48039)

(declare-datatypes ((Unit!41827 0))(
  ( (Unit!41828) )
))
(declare-fun lt!568529 () Unit!41827)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1076 (array!81697 array!81699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 V!48039 V!48039 (_ BitVec 32) Int) Unit!41827)

(assert (=> b!1257616 (= lt!568529 (lemmaNoChangeToArrayThenSameMapNoExtras!1076 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5762 (array!81697 array!81699 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18655)

(assert (=> b!1257616 (= lt!568530 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257616 (= lt!568528 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257617 () Bool)

(assert (=> b!1257617 (= e!715025 tp_is_empty!32005)))

(declare-fun res!838052 () Bool)

(assert (=> start!105668 (=> (not res!838052) (not e!715026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105668 (= res!838052 (validMask!0 mask!1466))))

(assert (=> start!105668 e!715026))

(assert (=> start!105668 true))

(assert (=> start!105668 tp!94822))

(assert (=> start!105668 tp_is_empty!32005))

(declare-fun array_inv!30153 (array!81697) Bool)

(assert (=> start!105668 (array_inv!30153 _keys!1118)))

(declare-fun array_inv!30154 (array!81699) Bool)

(assert (=> start!105668 (and (array_inv!30154 _values!914) e!715028)))

(declare-fun b!1257618 () Bool)

(declare-fun e!715024 () Bool)

(assert (=> b!1257618 (= e!715024 (bvsle #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun lt!568531 () ListLongMap!18655)

(declare-fun -!2059 (ListLongMap!18655 (_ BitVec 64)) ListLongMap!18655)

(assert (=> b!1257618 (= (-!2059 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568531)))

(declare-fun lt!568532 () Unit!41827)

(declare-fun removeNotPresentStillSame!131 (ListLongMap!18655 (_ BitVec 64)) Unit!41827)

(assert (=> b!1257618 (= lt!568532 (removeNotPresentStillSame!131 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257619 () Bool)

(declare-fun res!838050 () Bool)

(assert (=> b!1257619 (=> (not res!838050) (not e!715026))))

(assert (=> b!1257619 (= res!838050 (and (= (size!39941 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39940 _keys!1118) (size!39941 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257620 () Bool)

(assert (=> b!1257620 (= e!715023 e!715024)))

(declare-fun res!838048 () Bool)

(assert (=> b!1257620 (=> res!838048 e!715024)))

(declare-fun contains!7574 (ListLongMap!18655 (_ BitVec 64)) Bool)

(assert (=> b!1257620 (= res!838048 (contains!7574 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4552 (array!81697 array!81699 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18655)

(assert (=> b!1257620 (= lt!568531 (getCurrentListMap!4552 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49792 () Bool)

(declare-fun tp!94823 () Bool)

(assert (=> mapNonEmpty!49792 (= mapRes!49792 (and tp!94823 e!715029))))

(declare-fun mapRest!49792 () (Array (_ BitVec 32) ValueCell!15239))

(declare-fun mapValue!49792 () ValueCell!15239)

(declare-fun mapKey!49792 () (_ BitVec 32))

(assert (=> mapNonEmpty!49792 (= (arr!39404 _values!914) (store mapRest!49792 mapKey!49792 mapValue!49792))))

(assert (= (and start!105668 res!838052) b!1257619))

(assert (= (and b!1257619 res!838050) b!1257612))

(assert (= (and b!1257612 res!838051) b!1257614))

(assert (= (and b!1257614 res!838049) b!1257616))

(assert (= (and b!1257616 (not res!838053)) b!1257620))

(assert (= (and b!1257620 (not res!838048)) b!1257618))

(assert (= (and b!1257613 condMapEmpty!49792) mapIsEmpty!49792))

(assert (= (and b!1257613 (not condMapEmpty!49792)) mapNonEmpty!49792))

(get-info :version)

(assert (= (and mapNonEmpty!49792 ((_ is ValueCellFull!15239) mapValue!49792)) b!1257615))

(assert (= (and b!1257613 ((_ is ValueCellFull!15239) mapDefault!49792)) b!1257617))

(assert (= start!105668 b!1257613))

(declare-fun m!1158597 () Bool)

(assert (=> mapNonEmpty!49792 m!1158597))

(declare-fun m!1158599 () Bool)

(assert (=> b!1257618 m!1158599))

(declare-fun m!1158601 () Bool)

(assert (=> b!1257618 m!1158601))

(declare-fun m!1158603 () Bool)

(assert (=> start!105668 m!1158603))

(declare-fun m!1158605 () Bool)

(assert (=> start!105668 m!1158605))

(declare-fun m!1158607 () Bool)

(assert (=> start!105668 m!1158607))

(declare-fun m!1158609 () Bool)

(assert (=> b!1257620 m!1158609))

(declare-fun m!1158611 () Bool)

(assert (=> b!1257620 m!1158611))

(declare-fun m!1158613 () Bool)

(assert (=> b!1257612 m!1158613))

(declare-fun m!1158615 () Bool)

(assert (=> b!1257614 m!1158615))

(declare-fun m!1158617 () Bool)

(assert (=> b!1257616 m!1158617))

(declare-fun m!1158619 () Bool)

(assert (=> b!1257616 m!1158619))

(declare-fun m!1158621 () Bool)

(assert (=> b!1257616 m!1158621))

(check-sat (not b!1257616) (not b_next!27103) (not b!1257614) (not start!105668) b_and!44951 (not mapNonEmpty!49792) (not b!1257618) (not b!1257620) (not b!1257612) tp_is_empty!32005)
(check-sat b_and!44951 (not b_next!27103))
(get-model)

(declare-fun d!138633 () Bool)

(declare-fun lt!568565 () ListLongMap!18655)

(assert (=> d!138633 (not (contains!7574 lt!568565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!139 (List!28006 (_ BitVec 64)) List!28006)

(assert (=> d!138633 (= lt!568565 (ListLongMap!18656 (removeStrictlySorted!139 (toList!9343 lt!568531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138633 (= (-!2059 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568565)))

(declare-fun bs!35535 () Bool)

(assert (= bs!35535 d!138633))

(declare-fun m!1158675 () Bool)

(assert (=> bs!35535 m!1158675))

(declare-fun m!1158677 () Bool)

(assert (=> bs!35535 m!1158677))

(assert (=> b!1257618 d!138633))

(declare-fun d!138635 () Bool)

(assert (=> d!138635 (= (-!2059 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568531)))

(declare-fun lt!568568 () Unit!41827)

(declare-fun choose!1862 (ListLongMap!18655 (_ BitVec 64)) Unit!41827)

(assert (=> d!138635 (= lt!568568 (choose!1862 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138635 (not (contains!7574 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138635 (= (removeNotPresentStillSame!131 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568568)))

(declare-fun bs!35536 () Bool)

(assert (= bs!35536 d!138635))

(assert (=> bs!35536 m!1158599))

(declare-fun m!1158679 () Bool)

(assert (=> bs!35536 m!1158679))

(assert (=> bs!35536 m!1158609))

(assert (=> b!1257618 d!138635))

(declare-fun bm!61842 () Bool)

(declare-fun call!61845 () Bool)

(assert (=> bm!61842 (= call!61845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1257684 () Bool)

(declare-fun e!715078 () Bool)

(assert (=> b!1257684 (= e!715078 call!61845)))

(declare-fun b!1257685 () Bool)

(declare-fun e!715079 () Bool)

(assert (=> b!1257685 (= e!715079 call!61845)))

(declare-fun b!1257686 () Bool)

(assert (=> b!1257686 (= e!715079 e!715078)))

(declare-fun lt!568576 () (_ BitVec 64))

(assert (=> b!1257686 (= lt!568576 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568575 () Unit!41827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81697 (_ BitVec 64) (_ BitVec 32)) Unit!41827)

(assert (=> b!1257686 (= lt!568575 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568576 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1257686 (arrayContainsKey!0 _keys!1118 lt!568576 #b00000000000000000000000000000000)))

(declare-fun lt!568577 () Unit!41827)

(assert (=> b!1257686 (= lt!568577 lt!568575)))

(declare-fun res!838094 () Bool)

(declare-datatypes ((SeekEntryResult!9922 0))(
  ( (MissingZero!9922 (index!42059 (_ BitVec 32))) (Found!9922 (index!42060 (_ BitVec 32))) (Intermediate!9922 (undefined!10734 Bool) (index!42061 (_ BitVec 32)) (x!110611 (_ BitVec 32))) (Undefined!9922) (MissingVacant!9922 (index!42062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81697 (_ BitVec 32)) SeekEntryResult!9922)

(assert (=> b!1257686 (= res!838094 (= (seekEntryOrOpen!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9922 #b00000000000000000000000000000000)))))

(assert (=> b!1257686 (=> (not res!838094) (not e!715078))))

(declare-fun b!1257683 () Bool)

(declare-fun e!715080 () Bool)

(assert (=> b!1257683 (= e!715080 e!715079)))

(declare-fun c!122811 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1257683 (= c!122811 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138637 () Bool)

(declare-fun res!838095 () Bool)

(assert (=> d!138637 (=> res!838095 e!715080)))

(assert (=> d!138637 (= res!838095 (bvsge #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> d!138637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715080)))

(assert (= (and d!138637 (not res!838095)) b!1257683))

(assert (= (and b!1257683 c!122811) b!1257686))

(assert (= (and b!1257683 (not c!122811)) b!1257685))

(assert (= (and b!1257686 res!838094) b!1257684))

(assert (= (or b!1257684 b!1257685) bm!61842))

(declare-fun m!1158681 () Bool)

(assert (=> bm!61842 m!1158681))

(declare-fun m!1158683 () Bool)

(assert (=> b!1257686 m!1158683))

(declare-fun m!1158685 () Bool)

(assert (=> b!1257686 m!1158685))

(declare-fun m!1158687 () Bool)

(assert (=> b!1257686 m!1158687))

(assert (=> b!1257686 m!1158683))

(declare-fun m!1158689 () Bool)

(assert (=> b!1257686 m!1158689))

(assert (=> b!1257683 m!1158683))

(assert (=> b!1257683 m!1158683))

(declare-fun m!1158691 () Bool)

(assert (=> b!1257683 m!1158691))

(assert (=> b!1257612 d!138637))

(declare-fun d!138639 () Bool)

(assert (=> d!138639 (= (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568580 () Unit!41827)

(declare-fun choose!1863 (array!81697 array!81699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 V!48039 V!48039 (_ BitVec 32) Int) Unit!41827)

(assert (=> d!138639 (= lt!568580 (choose!1863 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138639 (validMask!0 mask!1466)))

(assert (=> d!138639 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1076 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568580)))

(declare-fun bs!35537 () Bool)

(assert (= bs!35537 d!138639))

(assert (=> bs!35537 m!1158621))

(assert (=> bs!35537 m!1158619))

(declare-fun m!1158693 () Bool)

(assert (=> bs!35537 m!1158693))

(assert (=> bs!35537 m!1158603))

(assert (=> b!1257616 d!138639))

(declare-fun b!1257711 () Bool)

(declare-fun e!715100 () Bool)

(declare-fun e!715097 () Bool)

(assert (=> b!1257711 (= e!715100 e!715097)))

(declare-fun c!122823 () Bool)

(declare-fun e!715099 () Bool)

(assert (=> b!1257711 (= c!122823 e!715099)))

(declare-fun res!838104 () Bool)

(assert (=> b!1257711 (=> (not res!838104) (not e!715099))))

(assert (=> b!1257711 (= res!838104 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257712 () Bool)

(declare-fun res!838107 () Bool)

(assert (=> b!1257712 (=> (not res!838107) (not e!715100))))

(declare-fun lt!568595 () ListLongMap!18655)

(assert (=> b!1257712 (= res!838107 (not (contains!7574 lt!568595 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257713 () Bool)

(declare-fun e!715095 () ListLongMap!18655)

(declare-fun e!715098 () ListLongMap!18655)

(assert (=> b!1257713 (= e!715095 e!715098)))

(declare-fun c!122821 () Bool)

(assert (=> b!1257713 (= c!122821 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138641 () Bool)

(assert (=> d!138641 e!715100))

(declare-fun res!838106 () Bool)

(assert (=> d!138641 (=> (not res!838106) (not e!715100))))

(assert (=> d!138641 (= res!838106 (not (contains!7574 lt!568595 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138641 (= lt!568595 e!715095)))

(declare-fun c!122822 () Bool)

(assert (=> d!138641 (= c!122822 (bvsge #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> d!138641 (validMask!0 mask!1466)))

(assert (=> d!138641 (= (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568595)))

(declare-fun b!1257714 () Bool)

(assert (=> b!1257714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> b!1257714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39941 _values!914)))))

(declare-fun e!715096 () Bool)

(declare-fun apply!997 (ListLongMap!18655 (_ BitVec 64)) V!48039)

(declare-fun get!20192 (ValueCell!15239 V!48039) V!48039)

(declare-fun dynLambda!3449 (Int (_ BitVec 64)) V!48039)

(assert (=> b!1257714 (= e!715096 (= (apply!997 lt!568595 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)) (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257715 () Bool)

(assert (=> b!1257715 (= e!715099 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257715 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257716 () Bool)

(assert (=> b!1257716 (= e!715097 e!715096)))

(assert (=> b!1257716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun res!838105 () Bool)

(assert (=> b!1257716 (= res!838105 (contains!7574 lt!568595 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257716 (=> (not res!838105) (not e!715096))))

(declare-fun b!1257717 () Bool)

(declare-fun e!715101 () Bool)

(assert (=> b!1257717 (= e!715097 e!715101)))

(declare-fun c!122820 () Bool)

(assert (=> b!1257717 (= c!122820 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257718 () Bool)

(assert (=> b!1257718 (= e!715095 (ListLongMap!18656 Nil!28003))))

(declare-fun b!1257719 () Bool)

(declare-fun lt!568596 () Unit!41827)

(declare-fun lt!568599 () Unit!41827)

(assert (=> b!1257719 (= lt!568596 lt!568599)))

(declare-fun lt!568601 () ListLongMap!18655)

(declare-fun lt!568600 () (_ BitVec 64))

(declare-fun lt!568597 () V!48039)

(declare-fun lt!568598 () (_ BitVec 64))

(declare-fun +!4238 (ListLongMap!18655 tuple2!20774) ListLongMap!18655)

(assert (=> b!1257719 (not (contains!7574 (+!4238 lt!568601 (tuple2!20775 lt!568598 lt!568597)) lt!568600))))

(declare-fun addStillNotContains!318 (ListLongMap!18655 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41827)

(assert (=> b!1257719 (= lt!568599 (addStillNotContains!318 lt!568601 lt!568598 lt!568597 lt!568600))))

(assert (=> b!1257719 (= lt!568600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257719 (= lt!568597 (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257719 (= lt!568598 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61848 () ListLongMap!18655)

(assert (=> b!1257719 (= lt!568601 call!61848)))

(assert (=> b!1257719 (= e!715098 (+!4238 call!61848 (tuple2!20775 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000) (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257720 () Bool)

(declare-fun isEmpty!1034 (ListLongMap!18655) Bool)

(assert (=> b!1257720 (= e!715101 (isEmpty!1034 lt!568595))))

(declare-fun bm!61845 () Bool)

(assert (=> bm!61845 (= call!61848 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257721 () Bool)

(assert (=> b!1257721 (= e!715098 call!61848)))

(declare-fun b!1257722 () Bool)

(assert (=> b!1257722 (= e!715101 (= lt!568595 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138641 c!122822) b!1257718))

(assert (= (and d!138641 (not c!122822)) b!1257713))

(assert (= (and b!1257713 c!122821) b!1257719))

(assert (= (and b!1257713 (not c!122821)) b!1257721))

(assert (= (or b!1257719 b!1257721) bm!61845))

(assert (= (and d!138641 res!838106) b!1257712))

(assert (= (and b!1257712 res!838107) b!1257711))

(assert (= (and b!1257711 res!838104) b!1257715))

(assert (= (and b!1257711 c!122823) b!1257716))

(assert (= (and b!1257711 (not c!122823)) b!1257717))

(assert (= (and b!1257716 res!838105) b!1257714))

(assert (= (and b!1257717 c!122820) b!1257722))

(assert (= (and b!1257717 (not c!122820)) b!1257720))

(declare-fun b_lambda!22661 () Bool)

(assert (=> (not b_lambda!22661) (not b!1257714)))

(declare-fun t!41491 () Bool)

(declare-fun tb!11295 () Bool)

(assert (=> (and start!105668 (= defaultEntry!922 defaultEntry!922) t!41491) tb!11295))

(declare-fun result!23309 () Bool)

(assert (=> tb!11295 (= result!23309 tp_is_empty!32005)))

(assert (=> b!1257714 t!41491))

(declare-fun b_and!44957 () Bool)

(assert (= b_and!44951 (and (=> t!41491 result!23309) b_and!44957)))

(declare-fun b_lambda!22663 () Bool)

(assert (=> (not b_lambda!22663) (not b!1257719)))

(assert (=> b!1257719 t!41491))

(declare-fun b_and!44959 () Bool)

(assert (= b_and!44957 (and (=> t!41491 result!23309) b_and!44959)))

(declare-fun m!1158695 () Bool)

(assert (=> bm!61845 m!1158695))

(declare-fun m!1158697 () Bool)

(assert (=> d!138641 m!1158697))

(assert (=> d!138641 m!1158603))

(assert (=> b!1257716 m!1158683))

(assert (=> b!1257716 m!1158683))

(declare-fun m!1158699 () Bool)

(assert (=> b!1257716 m!1158699))

(assert (=> b!1257714 m!1158683))

(declare-fun m!1158701 () Bool)

(assert (=> b!1257714 m!1158701))

(assert (=> b!1257714 m!1158701))

(declare-fun m!1158703 () Bool)

(assert (=> b!1257714 m!1158703))

(declare-fun m!1158705 () Bool)

(assert (=> b!1257714 m!1158705))

(assert (=> b!1257714 m!1158703))

(assert (=> b!1257714 m!1158683))

(declare-fun m!1158707 () Bool)

(assert (=> b!1257714 m!1158707))

(declare-fun m!1158709 () Bool)

(assert (=> b!1257720 m!1158709))

(assert (=> b!1257722 m!1158695))

(assert (=> b!1257715 m!1158683))

(assert (=> b!1257715 m!1158683))

(assert (=> b!1257715 m!1158691))

(declare-fun m!1158711 () Bool)

(assert (=> b!1257712 m!1158711))

(declare-fun m!1158713 () Bool)

(assert (=> b!1257719 m!1158713))

(assert (=> b!1257719 m!1158701))

(assert (=> b!1257719 m!1158701))

(assert (=> b!1257719 m!1158703))

(assert (=> b!1257719 m!1158705))

(assert (=> b!1257719 m!1158703))

(declare-fun m!1158715 () Bool)

(assert (=> b!1257719 m!1158715))

(declare-fun m!1158717 () Bool)

(assert (=> b!1257719 m!1158717))

(assert (=> b!1257719 m!1158683))

(assert (=> b!1257719 m!1158715))

(declare-fun m!1158719 () Bool)

(assert (=> b!1257719 m!1158719))

(assert (=> b!1257713 m!1158683))

(assert (=> b!1257713 m!1158683))

(assert (=> b!1257713 m!1158691))

(assert (=> b!1257616 d!138641))

(declare-fun b!1257725 () Bool)

(declare-fun e!715107 () Bool)

(declare-fun e!715104 () Bool)

(assert (=> b!1257725 (= e!715107 e!715104)))

(declare-fun c!122827 () Bool)

(declare-fun e!715106 () Bool)

(assert (=> b!1257725 (= c!122827 e!715106)))

(declare-fun res!838108 () Bool)

(assert (=> b!1257725 (=> (not res!838108) (not e!715106))))

(assert (=> b!1257725 (= res!838108 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257726 () Bool)

(declare-fun res!838111 () Bool)

(assert (=> b!1257726 (=> (not res!838111) (not e!715107))))

(declare-fun lt!568602 () ListLongMap!18655)

(assert (=> b!1257726 (= res!838111 (not (contains!7574 lt!568602 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257727 () Bool)

(declare-fun e!715102 () ListLongMap!18655)

(declare-fun e!715105 () ListLongMap!18655)

(assert (=> b!1257727 (= e!715102 e!715105)))

(declare-fun c!122825 () Bool)

(assert (=> b!1257727 (= c!122825 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138643 () Bool)

(assert (=> d!138643 e!715107))

(declare-fun res!838110 () Bool)

(assert (=> d!138643 (=> (not res!838110) (not e!715107))))

(assert (=> d!138643 (= res!838110 (not (contains!7574 lt!568602 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138643 (= lt!568602 e!715102)))

(declare-fun c!122826 () Bool)

(assert (=> d!138643 (= c!122826 (bvsge #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> d!138643 (validMask!0 mask!1466)))

(assert (=> d!138643 (= (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568602)))

(declare-fun b!1257728 () Bool)

(assert (=> b!1257728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> b!1257728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39941 _values!914)))))

(declare-fun e!715103 () Bool)

(assert (=> b!1257728 (= e!715103 (= (apply!997 lt!568602 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)) (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257729 () Bool)

(assert (=> b!1257729 (= e!715106 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257729 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257730 () Bool)

(assert (=> b!1257730 (= e!715104 e!715103)))

(assert (=> b!1257730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun res!838109 () Bool)

(assert (=> b!1257730 (= res!838109 (contains!7574 lt!568602 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257730 (=> (not res!838109) (not e!715103))))

(declare-fun b!1257731 () Bool)

(declare-fun e!715108 () Bool)

(assert (=> b!1257731 (= e!715104 e!715108)))

(declare-fun c!122824 () Bool)

(assert (=> b!1257731 (= c!122824 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257732 () Bool)

(assert (=> b!1257732 (= e!715102 (ListLongMap!18656 Nil!28003))))

(declare-fun b!1257733 () Bool)

(declare-fun lt!568603 () Unit!41827)

(declare-fun lt!568606 () Unit!41827)

(assert (=> b!1257733 (= lt!568603 lt!568606)))

(declare-fun lt!568604 () V!48039)

(declare-fun lt!568608 () ListLongMap!18655)

(declare-fun lt!568607 () (_ BitVec 64))

(declare-fun lt!568605 () (_ BitVec 64))

(assert (=> b!1257733 (not (contains!7574 (+!4238 lt!568608 (tuple2!20775 lt!568605 lt!568604)) lt!568607))))

(assert (=> b!1257733 (= lt!568606 (addStillNotContains!318 lt!568608 lt!568605 lt!568604 lt!568607))))

(assert (=> b!1257733 (= lt!568607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257733 (= lt!568604 (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257733 (= lt!568605 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61849 () ListLongMap!18655)

(assert (=> b!1257733 (= lt!568608 call!61849)))

(assert (=> b!1257733 (= e!715105 (+!4238 call!61849 (tuple2!20775 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000) (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257734 () Bool)

(assert (=> b!1257734 (= e!715108 (isEmpty!1034 lt!568602))))

(declare-fun bm!61846 () Bool)

(assert (=> bm!61846 (= call!61849 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257735 () Bool)

(assert (=> b!1257735 (= e!715105 call!61849)))

(declare-fun b!1257736 () Bool)

(assert (=> b!1257736 (= e!715108 (= lt!568602 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138643 c!122826) b!1257732))

(assert (= (and d!138643 (not c!122826)) b!1257727))

(assert (= (and b!1257727 c!122825) b!1257733))

(assert (= (and b!1257727 (not c!122825)) b!1257735))

(assert (= (or b!1257733 b!1257735) bm!61846))

(assert (= (and d!138643 res!838110) b!1257726))

(assert (= (and b!1257726 res!838111) b!1257725))

(assert (= (and b!1257725 res!838108) b!1257729))

(assert (= (and b!1257725 c!122827) b!1257730))

(assert (= (and b!1257725 (not c!122827)) b!1257731))

(assert (= (and b!1257730 res!838109) b!1257728))

(assert (= (and b!1257731 c!122824) b!1257736))

(assert (= (and b!1257731 (not c!122824)) b!1257734))

(declare-fun b_lambda!22665 () Bool)

(assert (=> (not b_lambda!22665) (not b!1257728)))

(assert (=> b!1257728 t!41491))

(declare-fun b_and!44961 () Bool)

(assert (= b_and!44959 (and (=> t!41491 result!23309) b_and!44961)))

(declare-fun b_lambda!22667 () Bool)

(assert (=> (not b_lambda!22667) (not b!1257733)))

(assert (=> b!1257733 t!41491))

(declare-fun b_and!44963 () Bool)

(assert (= b_and!44961 (and (=> t!41491 result!23309) b_and!44963)))

(declare-fun m!1158721 () Bool)

(assert (=> bm!61846 m!1158721))

(declare-fun m!1158723 () Bool)

(assert (=> d!138643 m!1158723))

(assert (=> d!138643 m!1158603))

(assert (=> b!1257730 m!1158683))

(assert (=> b!1257730 m!1158683))

(declare-fun m!1158725 () Bool)

(assert (=> b!1257730 m!1158725))

(assert (=> b!1257728 m!1158683))

(assert (=> b!1257728 m!1158701))

(assert (=> b!1257728 m!1158701))

(assert (=> b!1257728 m!1158703))

(assert (=> b!1257728 m!1158705))

(assert (=> b!1257728 m!1158703))

(assert (=> b!1257728 m!1158683))

(declare-fun m!1158727 () Bool)

(assert (=> b!1257728 m!1158727))

(declare-fun m!1158729 () Bool)

(assert (=> b!1257734 m!1158729))

(assert (=> b!1257736 m!1158721))

(assert (=> b!1257729 m!1158683))

(assert (=> b!1257729 m!1158683))

(assert (=> b!1257729 m!1158691))

(declare-fun m!1158731 () Bool)

(assert (=> b!1257726 m!1158731))

(declare-fun m!1158733 () Bool)

(assert (=> b!1257733 m!1158733))

(assert (=> b!1257733 m!1158701))

(assert (=> b!1257733 m!1158701))

(assert (=> b!1257733 m!1158703))

(assert (=> b!1257733 m!1158705))

(assert (=> b!1257733 m!1158703))

(declare-fun m!1158735 () Bool)

(assert (=> b!1257733 m!1158735))

(declare-fun m!1158737 () Bool)

(assert (=> b!1257733 m!1158737))

(assert (=> b!1257733 m!1158683))

(assert (=> b!1257733 m!1158735))

(declare-fun m!1158739 () Bool)

(assert (=> b!1257733 m!1158739))

(assert (=> b!1257727 m!1158683))

(assert (=> b!1257727 m!1158683))

(assert (=> b!1257727 m!1158691))

(assert (=> b!1257616 d!138643))

(declare-fun d!138645 () Bool)

(assert (=> d!138645 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105668 d!138645))

(declare-fun d!138647 () Bool)

(assert (=> d!138647 (= (array_inv!30153 _keys!1118) (bvsge (size!39940 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105668 d!138647))

(declare-fun d!138649 () Bool)

(assert (=> d!138649 (= (array_inv!30154 _values!914) (bvsge (size!39941 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105668 d!138649))

(declare-fun d!138651 () Bool)

(declare-fun e!715113 () Bool)

(assert (=> d!138651 e!715113))

(declare-fun res!838114 () Bool)

(assert (=> d!138651 (=> res!838114 e!715113)))

(declare-fun lt!568619 () Bool)

(assert (=> d!138651 (= res!838114 (not lt!568619))))

(declare-fun lt!568618 () Bool)

(assert (=> d!138651 (= lt!568619 lt!568618)))

(declare-fun lt!568620 () Unit!41827)

(declare-fun e!715114 () Unit!41827)

(assert (=> d!138651 (= lt!568620 e!715114)))

(declare-fun c!122830 () Bool)

(assert (=> d!138651 (= c!122830 lt!568618)))

(declare-fun containsKey!620 (List!28006 (_ BitVec 64)) Bool)

(assert (=> d!138651 (= lt!568618 (containsKey!620 (toList!9343 lt!568531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138651 (= (contains!7574 lt!568531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568619)))

(declare-fun b!1257743 () Bool)

(declare-fun lt!568617 () Unit!41827)

(assert (=> b!1257743 (= e!715114 lt!568617)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!429 (List!28006 (_ BitVec 64)) Unit!41827)

(assert (=> b!1257743 (= lt!568617 (lemmaContainsKeyImpliesGetValueByKeyDefined!429 (toList!9343 lt!568531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!703 0))(
  ( (Some!702 (v!18764 V!48039)) (None!701) )
))
(declare-fun isDefined!467 (Option!703) Bool)

(declare-fun getValueByKey!652 (List!28006 (_ BitVec 64)) Option!703)

(assert (=> b!1257743 (isDefined!467 (getValueByKey!652 (toList!9343 lt!568531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257744 () Bool)

(declare-fun Unit!41831 () Unit!41827)

(assert (=> b!1257744 (= e!715114 Unit!41831)))

(declare-fun b!1257745 () Bool)

(assert (=> b!1257745 (= e!715113 (isDefined!467 (getValueByKey!652 (toList!9343 lt!568531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138651 c!122830) b!1257743))

(assert (= (and d!138651 (not c!122830)) b!1257744))

(assert (= (and d!138651 (not res!838114)) b!1257745))

(declare-fun m!1158741 () Bool)

(assert (=> d!138651 m!1158741))

(declare-fun m!1158743 () Bool)

(assert (=> b!1257743 m!1158743))

(declare-fun m!1158745 () Bool)

(assert (=> b!1257743 m!1158745))

(assert (=> b!1257743 m!1158745))

(declare-fun m!1158747 () Bool)

(assert (=> b!1257743 m!1158747))

(assert (=> b!1257745 m!1158745))

(assert (=> b!1257745 m!1158745))

(assert (=> b!1257745 m!1158747))

(assert (=> b!1257620 d!138651))

(declare-fun b!1257788 () Bool)

(declare-fun e!715144 () Bool)

(declare-fun e!715146 () Bool)

(assert (=> b!1257788 (= e!715144 e!715146)))

(declare-fun res!838138 () Bool)

(declare-fun call!61864 () Bool)

(assert (=> b!1257788 (= res!838138 call!61864)))

(assert (=> b!1257788 (=> (not res!838138) (not e!715146))))

(declare-fun b!1257789 () Bool)

(declare-fun e!715149 () Bool)

(assert (=> b!1257789 (= e!715149 e!715144)))

(declare-fun c!122846 () Bool)

(assert (=> b!1257789 (= c!122846 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61861 () Bool)

(declare-fun lt!568676 () ListLongMap!18655)

(assert (=> bm!61861 (= call!61864 (contains!7574 lt!568676 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257790 () Bool)

(assert (=> b!1257790 (= e!715146 (= (apply!997 lt!568676 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61862 () Bool)

(declare-fun call!61870 () ListLongMap!18655)

(declare-fun call!61868 () ListLongMap!18655)

(assert (=> bm!61862 (= call!61870 call!61868)))

(declare-fun b!1257791 () Bool)

(declare-fun e!715147 () Bool)

(assert (=> b!1257791 (= e!715147 (= (apply!997 lt!568676 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)) (get!20192 (select (arr!39404 _values!914) #b00000000000000000000000000000000) (dynLambda!3449 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1257791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39941 _values!914)))))

(assert (=> b!1257791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257792 () Bool)

(assert (=> b!1257792 (= e!715144 (not call!61864))))

(declare-fun b!1257793 () Bool)

(declare-fun res!838135 () Bool)

(assert (=> b!1257793 (=> (not res!838135) (not e!715149))))

(declare-fun e!715151 () Bool)

(assert (=> b!1257793 (= res!838135 e!715151)))

(declare-fun res!838134 () Bool)

(assert (=> b!1257793 (=> res!838134 e!715151)))

(declare-fun e!715150 () Bool)

(assert (=> b!1257793 (= res!838134 (not e!715150))))

(declare-fun res!838133 () Bool)

(assert (=> b!1257793 (=> (not res!838133) (not e!715150))))

(assert (=> b!1257793 (= res!838133 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257794 () Bool)

(declare-fun e!715142 () ListLongMap!18655)

(declare-fun call!61865 () ListLongMap!18655)

(assert (=> b!1257794 (= e!715142 call!61865)))

(declare-fun bm!61863 () Bool)

(declare-fun call!61866 () ListLongMap!18655)

(assert (=> bm!61863 (= call!61865 call!61866)))

(declare-fun b!1257795 () Bool)

(declare-fun e!715153 () Unit!41827)

(declare-fun lt!568674 () Unit!41827)

(assert (=> b!1257795 (= e!715153 lt!568674)))

(declare-fun lt!568680 () ListLongMap!18655)

(assert (=> b!1257795 (= lt!568680 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568672 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568679 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568679 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568666 () Unit!41827)

(declare-fun addStillContains!1088 (ListLongMap!18655 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41827)

(assert (=> b!1257795 (= lt!568666 (addStillContains!1088 lt!568680 lt!568672 zeroValue!871 lt!568679))))

(assert (=> b!1257795 (contains!7574 (+!4238 lt!568680 (tuple2!20775 lt!568672 zeroValue!871)) lt!568679)))

(declare-fun lt!568668 () Unit!41827)

(assert (=> b!1257795 (= lt!568668 lt!568666)))

(declare-fun lt!568675 () ListLongMap!18655)

(assert (=> b!1257795 (= lt!568675 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568684 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568684 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568686 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568686 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568678 () Unit!41827)

(declare-fun addApplyDifferent!530 (ListLongMap!18655 (_ BitVec 64) V!48039 (_ BitVec 64)) Unit!41827)

(assert (=> b!1257795 (= lt!568678 (addApplyDifferent!530 lt!568675 lt!568684 minValueBefore!43 lt!568686))))

(assert (=> b!1257795 (= (apply!997 (+!4238 lt!568675 (tuple2!20775 lt!568684 minValueBefore!43)) lt!568686) (apply!997 lt!568675 lt!568686))))

(declare-fun lt!568682 () Unit!41827)

(assert (=> b!1257795 (= lt!568682 lt!568678)))

(declare-fun lt!568667 () ListLongMap!18655)

(assert (=> b!1257795 (= lt!568667 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568683 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568665 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568665 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568685 () Unit!41827)

(assert (=> b!1257795 (= lt!568685 (addApplyDifferent!530 lt!568667 lt!568683 zeroValue!871 lt!568665))))

(assert (=> b!1257795 (= (apply!997 (+!4238 lt!568667 (tuple2!20775 lt!568683 zeroValue!871)) lt!568665) (apply!997 lt!568667 lt!568665))))

(declare-fun lt!568671 () Unit!41827)

(assert (=> b!1257795 (= lt!568671 lt!568685)))

(declare-fun lt!568669 () ListLongMap!18655)

(assert (=> b!1257795 (= lt!568669 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568673 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568670 () (_ BitVec 64))

(assert (=> b!1257795 (= lt!568670 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1257795 (= lt!568674 (addApplyDifferent!530 lt!568669 lt!568673 minValueBefore!43 lt!568670))))

(assert (=> b!1257795 (= (apply!997 (+!4238 lt!568669 (tuple2!20775 lt!568673 minValueBefore!43)) lt!568670) (apply!997 lt!568669 lt!568670))))

(declare-fun b!1257797 () Bool)

(declare-fun e!715148 () ListLongMap!18655)

(declare-fun call!61869 () ListLongMap!18655)

(assert (=> b!1257797 (= e!715148 call!61869)))

(declare-fun b!1257798 () Bool)

(assert (=> b!1257798 (= e!715150 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257799 () Bool)

(assert (=> b!1257799 (= e!715151 e!715147)))

(declare-fun res!838137 () Bool)

(assert (=> b!1257799 (=> (not res!838137) (not e!715147))))

(assert (=> b!1257799 (= res!838137 (contains!7574 lt!568676 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257799 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(declare-fun b!1257800 () Bool)

(declare-fun e!715141 () Bool)

(declare-fun e!715145 () Bool)

(assert (=> b!1257800 (= e!715141 e!715145)))

(declare-fun res!838136 () Bool)

(declare-fun call!61867 () Bool)

(assert (=> b!1257800 (= res!838136 call!61867)))

(assert (=> b!1257800 (=> (not res!838136) (not e!715145))))

(declare-fun c!122844 () Bool)

(declare-fun bm!61864 () Bool)

(declare-fun c!122845 () Bool)

(assert (=> bm!61864 (= call!61866 (+!4238 (ite c!122844 call!61868 (ite c!122845 call!61870 call!61869)) (ite (or c!122844 c!122845) (tuple2!20775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61865 () Bool)

(assert (=> bm!61865 (= call!61869 call!61870)))

(declare-fun b!1257801 () Bool)

(declare-fun e!715143 () Bool)

(assert (=> b!1257801 (= e!715143 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257802 () Bool)

(declare-fun e!715152 () ListLongMap!18655)

(assert (=> b!1257802 (= e!715152 (+!4238 call!61866 (tuple2!20775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1257803 () Bool)

(assert (=> b!1257803 (= e!715145 (= (apply!997 lt!568676 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1257804 () Bool)

(declare-fun Unit!41832 () Unit!41827)

(assert (=> b!1257804 (= e!715153 Unit!41832)))

(declare-fun b!1257805 () Bool)

(declare-fun c!122848 () Bool)

(assert (=> b!1257805 (= c!122848 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1257805 (= e!715142 e!715148)))

(declare-fun b!1257806 () Bool)

(assert (=> b!1257806 (= e!715152 e!715142)))

(assert (=> b!1257806 (= c!122845 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61866 () Bool)

(assert (=> bm!61866 (= call!61868 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61867 () Bool)

(assert (=> bm!61867 (= call!61867 (contains!7574 lt!568676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257807 () Bool)

(assert (=> b!1257807 (= e!715148 call!61865)))

(declare-fun b!1257808 () Bool)

(declare-fun res!838141 () Bool)

(assert (=> b!1257808 (=> (not res!838141) (not e!715149))))

(assert (=> b!1257808 (= res!838141 e!715141)))

(declare-fun c!122847 () Bool)

(assert (=> b!1257808 (= c!122847 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!138653 () Bool)

(assert (=> d!138653 e!715149))

(declare-fun res!838139 () Bool)

(assert (=> d!138653 (=> (not res!838139) (not e!715149))))

(assert (=> d!138653 (= res!838139 (or (bvsge #b00000000000000000000000000000000 (size!39940 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))))

(declare-fun lt!568677 () ListLongMap!18655)

(assert (=> d!138653 (= lt!568676 lt!568677)))

(declare-fun lt!568681 () Unit!41827)

(assert (=> d!138653 (= lt!568681 e!715153)))

(declare-fun c!122843 () Bool)

(assert (=> d!138653 (= c!122843 e!715143)))

(declare-fun res!838140 () Bool)

(assert (=> d!138653 (=> (not res!838140) (not e!715143))))

(assert (=> d!138653 (= res!838140 (bvslt #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> d!138653 (= lt!568677 e!715152)))

(assert (=> d!138653 (= c!122844 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138653 (validMask!0 mask!1466)))

(assert (=> d!138653 (= (getCurrentListMap!4552 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568676)))

(declare-fun b!1257796 () Bool)

(assert (=> b!1257796 (= e!715141 (not call!61867))))

(assert (= (and d!138653 c!122844) b!1257802))

(assert (= (and d!138653 (not c!122844)) b!1257806))

(assert (= (and b!1257806 c!122845) b!1257794))

(assert (= (and b!1257806 (not c!122845)) b!1257805))

(assert (= (and b!1257805 c!122848) b!1257807))

(assert (= (and b!1257805 (not c!122848)) b!1257797))

(assert (= (or b!1257807 b!1257797) bm!61865))

(assert (= (or b!1257794 bm!61865) bm!61862))

(assert (= (or b!1257794 b!1257807) bm!61863))

(assert (= (or b!1257802 bm!61862) bm!61866))

(assert (= (or b!1257802 bm!61863) bm!61864))

(assert (= (and d!138653 res!838140) b!1257801))

(assert (= (and d!138653 c!122843) b!1257795))

(assert (= (and d!138653 (not c!122843)) b!1257804))

(assert (= (and d!138653 res!838139) b!1257793))

(assert (= (and b!1257793 res!838133) b!1257798))

(assert (= (and b!1257793 (not res!838134)) b!1257799))

(assert (= (and b!1257799 res!838137) b!1257791))

(assert (= (and b!1257793 res!838135) b!1257808))

(assert (= (and b!1257808 c!122847) b!1257800))

(assert (= (and b!1257808 (not c!122847)) b!1257796))

(assert (= (and b!1257800 res!838136) b!1257803))

(assert (= (or b!1257800 b!1257796) bm!61867))

(assert (= (and b!1257808 res!838141) b!1257789))

(assert (= (and b!1257789 c!122846) b!1257788))

(assert (= (and b!1257789 (not c!122846)) b!1257792))

(assert (= (and b!1257788 res!838138) b!1257790))

(assert (= (or b!1257788 b!1257792) bm!61861))

(declare-fun b_lambda!22669 () Bool)

(assert (=> (not b_lambda!22669) (not b!1257791)))

(assert (=> b!1257791 t!41491))

(declare-fun b_and!44965 () Bool)

(assert (= b_and!44963 (and (=> t!41491 result!23309) b_and!44965)))

(assert (=> bm!61866 m!1158621))

(declare-fun m!1158749 () Bool)

(assert (=> b!1257802 m!1158749))

(declare-fun m!1158751 () Bool)

(assert (=> bm!61867 m!1158751))

(declare-fun m!1158753 () Bool)

(assert (=> b!1257803 m!1158753))

(assert (=> b!1257798 m!1158683))

(assert (=> b!1257798 m!1158683))

(assert (=> b!1257798 m!1158691))

(declare-fun m!1158755 () Bool)

(assert (=> bm!61861 m!1158755))

(assert (=> d!138653 m!1158603))

(declare-fun m!1158757 () Bool)

(assert (=> bm!61864 m!1158757))

(declare-fun m!1158759 () Bool)

(assert (=> b!1257790 m!1158759))

(assert (=> b!1257799 m!1158683))

(assert (=> b!1257799 m!1158683))

(declare-fun m!1158761 () Bool)

(assert (=> b!1257799 m!1158761))

(declare-fun m!1158763 () Bool)

(assert (=> b!1257795 m!1158763))

(declare-fun m!1158765 () Bool)

(assert (=> b!1257795 m!1158765))

(declare-fun m!1158767 () Bool)

(assert (=> b!1257795 m!1158767))

(declare-fun m!1158769 () Bool)

(assert (=> b!1257795 m!1158769))

(declare-fun m!1158771 () Bool)

(assert (=> b!1257795 m!1158771))

(declare-fun m!1158773 () Bool)

(assert (=> b!1257795 m!1158773))

(declare-fun m!1158775 () Bool)

(assert (=> b!1257795 m!1158775))

(assert (=> b!1257795 m!1158773))

(declare-fun m!1158777 () Bool)

(assert (=> b!1257795 m!1158777))

(declare-fun m!1158779 () Bool)

(assert (=> b!1257795 m!1158779))

(assert (=> b!1257795 m!1158763))

(declare-fun m!1158781 () Bool)

(assert (=> b!1257795 m!1158781))

(assert (=> b!1257795 m!1158769))

(declare-fun m!1158783 () Bool)

(assert (=> b!1257795 m!1158783))

(assert (=> b!1257795 m!1158621))

(assert (=> b!1257795 m!1158683))

(assert (=> b!1257795 m!1158765))

(declare-fun m!1158785 () Bool)

(assert (=> b!1257795 m!1158785))

(declare-fun m!1158787 () Bool)

(assert (=> b!1257795 m!1158787))

(declare-fun m!1158789 () Bool)

(assert (=> b!1257795 m!1158789))

(declare-fun m!1158791 () Bool)

(assert (=> b!1257795 m!1158791))

(assert (=> b!1257791 m!1158701))

(assert (=> b!1257791 m!1158703))

(assert (=> b!1257791 m!1158705))

(assert (=> b!1257791 m!1158683))

(declare-fun m!1158793 () Bool)

(assert (=> b!1257791 m!1158793))

(assert (=> b!1257791 m!1158701))

(assert (=> b!1257791 m!1158703))

(assert (=> b!1257791 m!1158683))

(assert (=> b!1257801 m!1158683))

(assert (=> b!1257801 m!1158683))

(assert (=> b!1257801 m!1158691))

(assert (=> b!1257620 d!138653))

(declare-fun b!1257819 () Bool)

(declare-fun e!715164 () Bool)

(declare-fun call!61873 () Bool)

(assert (=> b!1257819 (= e!715164 call!61873)))

(declare-fun d!138655 () Bool)

(declare-fun res!838149 () Bool)

(declare-fun e!715163 () Bool)

(assert (=> d!138655 (=> res!838149 e!715163)))

(assert (=> d!138655 (= res!838149 (bvsge #b00000000000000000000000000000000 (size!39940 _keys!1118)))))

(assert (=> d!138655 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28002) e!715163)))

(declare-fun b!1257820 () Bool)

(declare-fun e!715162 () Bool)

(declare-fun contains!7576 (List!28005 (_ BitVec 64)) Bool)

(assert (=> b!1257820 (= e!715162 (contains!7576 Nil!28002 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257821 () Bool)

(assert (=> b!1257821 (= e!715164 call!61873)))

(declare-fun b!1257822 () Bool)

(declare-fun e!715165 () Bool)

(assert (=> b!1257822 (= e!715163 e!715165)))

(declare-fun res!838148 () Bool)

(assert (=> b!1257822 (=> (not res!838148) (not e!715165))))

(assert (=> b!1257822 (= res!838148 (not e!715162))))

(declare-fun res!838150 () Bool)

(assert (=> b!1257822 (=> (not res!838150) (not e!715162))))

(assert (=> b!1257822 (= res!838150 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257823 () Bool)

(assert (=> b!1257823 (= e!715165 e!715164)))

(declare-fun c!122851 () Bool)

(assert (=> b!1257823 (= c!122851 (validKeyInArray!0 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61870 () Bool)

(assert (=> bm!61870 (= call!61873 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122851 (Cons!28001 (select (arr!39403 _keys!1118) #b00000000000000000000000000000000) Nil!28002) Nil!28002)))))

(assert (= (and d!138655 (not res!838149)) b!1257822))

(assert (= (and b!1257822 res!838150) b!1257820))

(assert (= (and b!1257822 res!838148) b!1257823))

(assert (= (and b!1257823 c!122851) b!1257819))

(assert (= (and b!1257823 (not c!122851)) b!1257821))

(assert (= (or b!1257819 b!1257821) bm!61870))

(assert (=> b!1257820 m!1158683))

(assert (=> b!1257820 m!1158683))

(declare-fun m!1158795 () Bool)

(assert (=> b!1257820 m!1158795))

(assert (=> b!1257822 m!1158683))

(assert (=> b!1257822 m!1158683))

(assert (=> b!1257822 m!1158691))

(assert (=> b!1257823 m!1158683))

(assert (=> b!1257823 m!1158683))

(assert (=> b!1257823 m!1158691))

(assert (=> bm!61870 m!1158683))

(declare-fun m!1158797 () Bool)

(assert (=> bm!61870 m!1158797))

(assert (=> b!1257614 d!138655))

(declare-fun mapIsEmpty!49801 () Bool)

(declare-fun mapRes!49801 () Bool)

(assert (=> mapIsEmpty!49801 mapRes!49801))

(declare-fun b!1257830 () Bool)

(declare-fun e!715170 () Bool)

(assert (=> b!1257830 (= e!715170 tp_is_empty!32005)))

(declare-fun b!1257831 () Bool)

(declare-fun e!715171 () Bool)

(assert (=> b!1257831 (= e!715171 tp_is_empty!32005)))

(declare-fun mapNonEmpty!49801 () Bool)

(declare-fun tp!94838 () Bool)

(assert (=> mapNonEmpty!49801 (= mapRes!49801 (and tp!94838 e!715170))))

(declare-fun mapRest!49801 () (Array (_ BitVec 32) ValueCell!15239))

(declare-fun mapKey!49801 () (_ BitVec 32))

(declare-fun mapValue!49801 () ValueCell!15239)

(assert (=> mapNonEmpty!49801 (= mapRest!49792 (store mapRest!49801 mapKey!49801 mapValue!49801))))

(declare-fun condMapEmpty!49801 () Bool)

(declare-fun mapDefault!49801 () ValueCell!15239)

(assert (=> mapNonEmpty!49792 (= condMapEmpty!49801 (= mapRest!49792 ((as const (Array (_ BitVec 32) ValueCell!15239)) mapDefault!49801)))))

(assert (=> mapNonEmpty!49792 (= tp!94823 (and e!715171 mapRes!49801))))

(assert (= (and mapNonEmpty!49792 condMapEmpty!49801) mapIsEmpty!49801))

(assert (= (and mapNonEmpty!49792 (not condMapEmpty!49801)) mapNonEmpty!49801))

(assert (= (and mapNonEmpty!49801 ((_ is ValueCellFull!15239) mapValue!49801)) b!1257830))

(assert (= (and mapNonEmpty!49792 ((_ is ValueCellFull!15239) mapDefault!49801)) b!1257831))

(declare-fun m!1158799 () Bool)

(assert (=> mapNonEmpty!49801 m!1158799))

(declare-fun b_lambda!22671 () Bool)

(assert (= b_lambda!22667 (or (and start!105668 b_free!27103) b_lambda!22671)))

(declare-fun b_lambda!22673 () Bool)

(assert (= b_lambda!22661 (or (and start!105668 b_free!27103) b_lambda!22673)))

(declare-fun b_lambda!22675 () Bool)

(assert (= b_lambda!22663 (or (and start!105668 b_free!27103) b_lambda!22675)))

(declare-fun b_lambda!22677 () Bool)

(assert (= b_lambda!22665 (or (and start!105668 b_free!27103) b_lambda!22677)))

(declare-fun b_lambda!22679 () Bool)

(assert (= b_lambda!22669 (or (and start!105668 b_free!27103) b_lambda!22679)))

(check-sat (not b!1257722) (not b!1257795) (not b!1257822) (not b!1257743) (not b!1257799) (not b!1257686) (not d!138651) (not b!1257734) (not b!1257730) (not mapNonEmpty!49801) (not bm!61864) (not b!1257790) (not b!1257791) (not b!1257727) (not b!1257736) (not b!1257801) (not b!1257728) (not b!1257714) (not b_lambda!22677) (not b!1257683) (not b!1257719) (not d!138633) (not bm!61870) (not b!1257802) (not bm!61846) (not b_lambda!22673) (not b_next!27103) (not d!138641) b_and!44965 (not b_lambda!22675) (not b!1257713) (not bm!61867) (not b_lambda!22671) (not b!1257820) (not bm!61845) (not bm!61861) (not d!138639) (not d!138653) (not b!1257715) (not b_lambda!22679) (not b!1257726) (not b!1257733) (not b!1257729) tp_is_empty!32005 (not b!1257720) (not d!138635) (not bm!61866) (not d!138643) (not b!1257745) (not bm!61842) (not b!1257712) (not b!1257716) (not b!1257823) (not b!1257798) (not b!1257803))
(check-sat b_and!44965 (not b_next!27103))
