; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113786 () Bool)

(assert start!113786)

(declare-fun b_free!31555 () Bool)

(declare-fun b_next!31555 () Bool)

(assert (=> start!113786 (= b_free!31555 (not b_next!31555))))

(declare-fun tp!110474 () Bool)

(declare-fun b_and!50901 () Bool)

(assert (=> start!113786 (= tp!110474 b_and!50901)))

(declare-fun b!1349486 () Bool)

(declare-fun res!895064 () Bool)

(declare-fun e!767807 () Bool)

(assert (=> b!1349486 (=> (not res!895064) (not e!767807))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1349486 (= res!895064 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58043 () Bool)

(declare-fun mapRes!58043 () Bool)

(assert (=> mapIsEmpty!58043 mapRes!58043))

(declare-datatypes ((V!55177 0))(
  ( (V!55178 (val!18852 Int)) )
))
(declare-fun minValue!1245 () V!55177)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92051 0))(
  ( (array!92052 (arr!44476 (Array (_ BitVec 32) (_ BitVec 64))) (size!45027 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92051)

(declare-fun zeroValue!1245 () V!55177)

(declare-fun b!1349487 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17879 0))(
  ( (ValueCellFull!17879 (v!21498 V!55177)) (EmptyCell!17879) )
))
(declare-datatypes ((array!92053 0))(
  ( (array!92054 (arr!44477 (Array (_ BitVec 32) ValueCell!17879)) (size!45028 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92053)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24358 0))(
  ( (tuple2!24359 (_1!12190 (_ BitVec 64)) (_2!12190 V!55177)) )
))
(declare-datatypes ((List!31495 0))(
  ( (Nil!31492) (Cons!31491 (h!32709 tuple2!24358) (t!46121 List!31495)) )
))
(declare-datatypes ((ListLongMap!22023 0))(
  ( (ListLongMap!22024 (toList!11027 List!31495)) )
))
(declare-fun contains!9216 (ListLongMap!22023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5965 (array!92051 array!92053 (_ BitVec 32) (_ BitVec 32) V!55177 V!55177 (_ BitVec 32) Int) ListLongMap!22023)

(assert (=> b!1349487 (= e!767807 (not (contains!9216 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun lt!596438 () ListLongMap!22023)

(declare-fun +!4887 (ListLongMap!22023 tuple2!24358) ListLongMap!22023)

(assert (=> b!1349487 (contains!9216 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44109 0))(
  ( (Unit!44110) )
))
(declare-fun lt!596439 () Unit!44109)

(declare-fun addStillContains!1214 (ListLongMap!22023 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44109)

(assert (=> b!1349487 (= lt!596439 (addStillContains!1214 lt!596438 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1349487 (contains!9216 lt!596438 k0!1142)))

(declare-fun lt!596435 () Unit!44109)

(declare-fun lt!596436 () V!55177)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!403 ((_ BitVec 64) (_ BitVec 64) V!55177 ListLongMap!22023) Unit!44109)

(assert (=> b!1349487 (= lt!596435 (lemmaInListMapAfterAddingDiffThenInBefore!403 k0!1142 (select (arr!44476 _keys!1571) from!1960) lt!596436 lt!596438))))

(declare-fun lt!596434 () ListLongMap!22023)

(assert (=> b!1349487 (contains!9216 lt!596434 k0!1142)))

(declare-fun lt!596437 () Unit!44109)

(assert (=> b!1349487 (= lt!596437 (lemmaInListMapAfterAddingDiffThenInBefore!403 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596434))))

(assert (=> b!1349487 (= lt!596434 (+!4887 lt!596438 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)))))

(declare-fun get!22484 (ValueCell!17879 V!55177) V!55177)

(declare-fun dynLambda!3841 (Int (_ BitVec 64)) V!55177)

(assert (=> b!1349487 (= lt!596436 (get!22484 (select (arr!44477 _values!1303) from!1960) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6540 (array!92051 array!92053 (_ BitVec 32) (_ BitVec 32) V!55177 V!55177 (_ BitVec 32) Int) ListLongMap!22023)

(assert (=> b!1349487 (= lt!596438 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1349488 () Bool)

(declare-fun res!895066 () Bool)

(assert (=> b!1349488 (=> (not res!895066) (not e!767807))))

(assert (=> b!1349488 (= res!895066 (and (= (size!45028 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45027 _keys!1571) (size!45028 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349489 () Bool)

(declare-fun e!767809 () Bool)

(declare-fun e!767810 () Bool)

(assert (=> b!1349489 (= e!767809 (and e!767810 mapRes!58043))))

(declare-fun condMapEmpty!58043 () Bool)

(declare-fun mapDefault!58043 () ValueCell!17879)

(assert (=> b!1349489 (= condMapEmpty!58043 (= (arr!44477 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17879)) mapDefault!58043)))))

(declare-fun b!1349490 () Bool)

(declare-fun res!895067 () Bool)

(assert (=> b!1349490 (=> (not res!895067) (not e!767807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349490 (= res!895067 (validKeyInArray!0 (select (arr!44476 _keys!1571) from!1960)))))

(declare-fun res!895065 () Bool)

(assert (=> start!113786 (=> (not res!895065) (not e!767807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113786 (= res!895065 (validMask!0 mask!1977))))

(assert (=> start!113786 e!767807))

(declare-fun tp_is_empty!37555 () Bool)

(assert (=> start!113786 tp_is_empty!37555))

(assert (=> start!113786 true))

(declare-fun array_inv!33765 (array!92051) Bool)

(assert (=> start!113786 (array_inv!33765 _keys!1571)))

(declare-fun array_inv!33766 (array!92053) Bool)

(assert (=> start!113786 (and (array_inv!33766 _values!1303) e!767809)))

(assert (=> start!113786 tp!110474))

(declare-fun b!1349491 () Bool)

(declare-fun res!895071 () Bool)

(assert (=> b!1349491 (=> (not res!895071) (not e!767807))))

(assert (=> b!1349491 (= res!895071 (not (= (select (arr!44476 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349492 () Bool)

(assert (=> b!1349492 (= e!767810 tp_is_empty!37555)))

(declare-fun b!1349493 () Bool)

(declare-fun e!767808 () Bool)

(assert (=> b!1349493 (= e!767808 tp_is_empty!37555)))

(declare-fun b!1349494 () Bool)

(declare-fun res!895069 () Bool)

(assert (=> b!1349494 (=> (not res!895069) (not e!767807))))

(assert (=> b!1349494 (= res!895069 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45027 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349495 () Bool)

(declare-fun res!895068 () Bool)

(assert (=> b!1349495 (=> (not res!895068) (not e!767807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92051 (_ BitVec 32)) Bool)

(assert (=> b!1349495 (= res!895068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1349496 () Bool)

(declare-fun res!895070 () Bool)

(assert (=> b!1349496 (=> (not res!895070) (not e!767807))))

(declare-datatypes ((List!31496 0))(
  ( (Nil!31493) (Cons!31492 (h!32710 (_ BitVec 64)) (t!46122 List!31496)) )
))
(declare-fun arrayNoDuplicates!0 (array!92051 (_ BitVec 32) List!31496) Bool)

(assert (=> b!1349496 (= res!895070 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31493))))

(declare-fun b!1349497 () Bool)

(declare-fun res!895072 () Bool)

(assert (=> b!1349497 (=> (not res!895072) (not e!767807))))

(assert (=> b!1349497 (= res!895072 (contains!9216 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!58043 () Bool)

(declare-fun tp!110473 () Bool)

(assert (=> mapNonEmpty!58043 (= mapRes!58043 (and tp!110473 e!767808))))

(declare-fun mapKey!58043 () (_ BitVec 32))

(declare-fun mapValue!58043 () ValueCell!17879)

(declare-fun mapRest!58043 () (Array (_ BitVec 32) ValueCell!17879))

(assert (=> mapNonEmpty!58043 (= (arr!44477 _values!1303) (store mapRest!58043 mapKey!58043 mapValue!58043))))

(assert (= (and start!113786 res!895065) b!1349488))

(assert (= (and b!1349488 res!895066) b!1349495))

(assert (= (and b!1349495 res!895068) b!1349496))

(assert (= (and b!1349496 res!895070) b!1349494))

(assert (= (and b!1349494 res!895069) b!1349497))

(assert (= (and b!1349497 res!895072) b!1349491))

(assert (= (and b!1349491 res!895071) b!1349490))

(assert (= (and b!1349490 res!895067) b!1349486))

(assert (= (and b!1349486 res!895064) b!1349487))

(assert (= (and b!1349489 condMapEmpty!58043) mapIsEmpty!58043))

(assert (= (and b!1349489 (not condMapEmpty!58043)) mapNonEmpty!58043))

(get-info :version)

(assert (= (and mapNonEmpty!58043 ((_ is ValueCellFull!17879) mapValue!58043)) b!1349493))

(assert (= (and b!1349489 ((_ is ValueCellFull!17879) mapDefault!58043)) b!1349492))

(assert (= start!113786 b!1349489))

(declare-fun b_lambda!24623 () Bool)

(assert (=> (not b_lambda!24623) (not b!1349487)))

(declare-fun t!46120 () Bool)

(declare-fun tb!12429 () Bool)

(assert (=> (and start!113786 (= defaultEntry!1306 defaultEntry!1306) t!46120) tb!12429))

(declare-fun result!25959 () Bool)

(assert (=> tb!12429 (= result!25959 tp_is_empty!37555)))

(assert (=> b!1349487 t!46120))

(declare-fun b_and!50903 () Bool)

(assert (= b_and!50901 (and (=> t!46120 result!25959) b_and!50903)))

(declare-fun m!1236805 () Bool)

(assert (=> b!1349496 m!1236805))

(declare-fun m!1236807 () Bool)

(assert (=> b!1349490 m!1236807))

(assert (=> b!1349490 m!1236807))

(declare-fun m!1236809 () Bool)

(assert (=> b!1349490 m!1236809))

(declare-fun m!1236811 () Bool)

(assert (=> mapNonEmpty!58043 m!1236811))

(declare-fun m!1236813 () Bool)

(assert (=> b!1349495 m!1236813))

(declare-fun m!1236815 () Bool)

(assert (=> b!1349497 m!1236815))

(assert (=> b!1349497 m!1236815))

(declare-fun m!1236817 () Bool)

(assert (=> b!1349497 m!1236817))

(declare-fun m!1236819 () Bool)

(assert (=> start!113786 m!1236819))

(declare-fun m!1236821 () Bool)

(assert (=> start!113786 m!1236821))

(declare-fun m!1236823 () Bool)

(assert (=> start!113786 m!1236823))

(declare-fun m!1236825 () Bool)

(assert (=> b!1349487 m!1236825))

(declare-fun m!1236827 () Bool)

(assert (=> b!1349487 m!1236827))

(declare-fun m!1236829 () Bool)

(assert (=> b!1349487 m!1236829))

(declare-fun m!1236831 () Bool)

(assert (=> b!1349487 m!1236831))

(declare-fun m!1236833 () Bool)

(assert (=> b!1349487 m!1236833))

(declare-fun m!1236835 () Bool)

(assert (=> b!1349487 m!1236835))

(assert (=> b!1349487 m!1236829))

(assert (=> b!1349487 m!1236827))

(declare-fun m!1236837 () Bool)

(assert (=> b!1349487 m!1236837))

(declare-fun m!1236839 () Bool)

(assert (=> b!1349487 m!1236839))

(assert (=> b!1349487 m!1236831))

(assert (=> b!1349487 m!1236807))

(declare-fun m!1236841 () Bool)

(assert (=> b!1349487 m!1236841))

(declare-fun m!1236843 () Bool)

(assert (=> b!1349487 m!1236843))

(declare-fun m!1236845 () Bool)

(assert (=> b!1349487 m!1236845))

(assert (=> b!1349487 m!1236843))

(declare-fun m!1236847 () Bool)

(assert (=> b!1349487 m!1236847))

(assert (=> b!1349487 m!1236807))

(declare-fun m!1236849 () Bool)

(assert (=> b!1349487 m!1236849))

(declare-fun m!1236851 () Bool)

(assert (=> b!1349487 m!1236851))

(assert (=> b!1349491 m!1236807))

(check-sat b_and!50903 tp_is_empty!37555 (not mapNonEmpty!58043) (not b!1349497) (not b!1349490) (not b_lambda!24623) (not b!1349496) (not b!1349495) (not b_next!31555) (not b!1349487) (not start!113786))
(check-sat b_and!50903 (not b_next!31555))
(get-model)

(declare-fun b_lambda!24629 () Bool)

(assert (= b_lambda!24623 (or (and start!113786 b_free!31555) b_lambda!24629)))

(check-sat tp_is_empty!37555 (not mapNonEmpty!58043) (not b!1349497) (not b!1349490) (not b!1349496) (not b!1349495) (not b_next!31555) (not b!1349487) (not start!113786) b_and!50903 (not b_lambda!24629))
(check-sat b_and!50903 (not b_next!31555))
(get-model)

(declare-fun d!144909 () Bool)

(assert (=> d!144909 (contains!9216 lt!596434 k0!1142)))

(declare-fun lt!596478 () Unit!44109)

(declare-fun choose!1979 ((_ BitVec 64) (_ BitVec 64) V!55177 ListLongMap!22023) Unit!44109)

(assert (=> d!144909 (= lt!596478 (choose!1979 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596434))))

(assert (=> d!144909 (contains!9216 (+!4887 lt!596434 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(assert (=> d!144909 (= (lemmaInListMapAfterAddingDiffThenInBefore!403 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596434) lt!596478)))

(declare-fun bs!38665 () Bool)

(assert (= bs!38665 d!144909))

(assert (=> bs!38665 m!1236835))

(declare-fun m!1236949 () Bool)

(assert (=> bs!38665 m!1236949))

(declare-fun m!1236951 () Bool)

(assert (=> bs!38665 m!1236951))

(assert (=> bs!38665 m!1236951))

(declare-fun m!1236953 () Bool)

(assert (=> bs!38665 m!1236953))

(assert (=> b!1349487 d!144909))

(declare-fun d!144911 () Bool)

(declare-fun e!767845 () Bool)

(assert (=> d!144911 e!767845))

(declare-fun res!895129 () Bool)

(assert (=> d!144911 (=> res!895129 e!767845)))

(declare-fun lt!596490 () Bool)

(assert (=> d!144911 (= res!895129 (not lt!596490))))

(declare-fun lt!596489 () Bool)

(assert (=> d!144911 (= lt!596490 lt!596489)))

(declare-fun lt!596488 () Unit!44109)

(declare-fun e!767846 () Unit!44109)

(assert (=> d!144911 (= lt!596488 e!767846)))

(declare-fun c!126804 () Bool)

(assert (=> d!144911 (= c!126804 lt!596489)))

(declare-fun containsKey!743 (List!31495 (_ BitVec 64)) Bool)

(assert (=> d!144911 (= lt!596489 (containsKey!743 (toList!11027 lt!596438) k0!1142))))

(assert (=> d!144911 (= (contains!9216 lt!596438 k0!1142) lt!596490)))

(declare-fun b!1349582 () Bool)

(declare-fun lt!596487 () Unit!44109)

(assert (=> b!1349582 (= e!767846 lt!596487)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!489 (List!31495 (_ BitVec 64)) Unit!44109)

(assert (=> b!1349582 (= lt!596487 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11027 lt!596438) k0!1142))))

(declare-datatypes ((Option!768 0))(
  ( (Some!767 (v!21501 V!55177)) (None!766) )
))
(declare-fun isDefined!526 (Option!768) Bool)

(declare-fun getValueByKey!717 (List!31495 (_ BitVec 64)) Option!768)

(assert (=> b!1349582 (isDefined!526 (getValueByKey!717 (toList!11027 lt!596438) k0!1142))))

(declare-fun b!1349583 () Bool)

(declare-fun Unit!44113 () Unit!44109)

(assert (=> b!1349583 (= e!767846 Unit!44113)))

(declare-fun b!1349584 () Bool)

(assert (=> b!1349584 (= e!767845 (isDefined!526 (getValueByKey!717 (toList!11027 lt!596438) k0!1142)))))

(assert (= (and d!144911 c!126804) b!1349582))

(assert (= (and d!144911 (not c!126804)) b!1349583))

(assert (= (and d!144911 (not res!895129)) b!1349584))

(declare-fun m!1236955 () Bool)

(assert (=> d!144911 m!1236955))

(declare-fun m!1236957 () Bool)

(assert (=> b!1349582 m!1236957))

(declare-fun m!1236959 () Bool)

(assert (=> b!1349582 m!1236959))

(assert (=> b!1349582 m!1236959))

(declare-fun m!1236961 () Bool)

(assert (=> b!1349582 m!1236961))

(assert (=> b!1349584 m!1236959))

(assert (=> b!1349584 m!1236959))

(assert (=> b!1349584 m!1236961))

(assert (=> b!1349487 d!144911))

(declare-fun d!144913 () Bool)

(declare-fun e!767849 () Bool)

(assert (=> d!144913 e!767849))

(declare-fun res!895135 () Bool)

(assert (=> d!144913 (=> (not res!895135) (not e!767849))))

(declare-fun lt!596500 () ListLongMap!22023)

(assert (=> d!144913 (= res!895135 (contains!9216 lt!596500 (_1!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))))))

(declare-fun lt!596499 () List!31495)

(assert (=> d!144913 (= lt!596500 (ListLongMap!22024 lt!596499))))

(declare-fun lt!596502 () Unit!44109)

(declare-fun lt!596501 () Unit!44109)

(assert (=> d!144913 (= lt!596502 lt!596501)))

(assert (=> d!144913 (= (getValueByKey!717 lt!596499 (_1!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))) (Some!767 (_2!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!367 (List!31495 (_ BitVec 64) V!55177) Unit!44109)

(assert (=> d!144913 (= lt!596501 (lemmaContainsTupThenGetReturnValue!367 lt!596499 (_1!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)) (_2!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))))))

(declare-fun insertStrictlySorted!496 (List!31495 (_ BitVec 64) V!55177) List!31495)

(assert (=> d!144913 (= lt!596499 (insertStrictlySorted!496 (toList!11027 lt!596438) (_1!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)) (_2!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))))))

(assert (=> d!144913 (= (+!4887 lt!596438 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)) lt!596500)))

(declare-fun b!1349589 () Bool)

(declare-fun res!895134 () Bool)

(assert (=> b!1349589 (=> (not res!895134) (not e!767849))))

(assert (=> b!1349589 (= res!895134 (= (getValueByKey!717 (toList!11027 lt!596500) (_1!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436))) (Some!767 (_2!12190 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)))))))

(declare-fun b!1349590 () Bool)

(declare-fun contains!9219 (List!31495 tuple2!24358) Bool)

(assert (=> b!1349590 (= e!767849 (contains!9219 (toList!11027 lt!596500) (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)))))

(assert (= (and d!144913 res!895135) b!1349589))

(assert (= (and b!1349589 res!895134) b!1349590))

(declare-fun m!1236963 () Bool)

(assert (=> d!144913 m!1236963))

(declare-fun m!1236965 () Bool)

(assert (=> d!144913 m!1236965))

(declare-fun m!1236967 () Bool)

(assert (=> d!144913 m!1236967))

(declare-fun m!1236969 () Bool)

(assert (=> d!144913 m!1236969))

(declare-fun m!1236971 () Bool)

(assert (=> b!1349589 m!1236971))

(declare-fun m!1236973 () Bool)

(assert (=> b!1349590 m!1236973))

(assert (=> b!1349487 d!144913))

(declare-fun d!144915 () Bool)

(declare-fun e!767850 () Bool)

(assert (=> d!144915 e!767850))

(declare-fun res!895136 () Bool)

(assert (=> d!144915 (=> res!895136 e!767850)))

(declare-fun lt!596506 () Bool)

(assert (=> d!144915 (= res!895136 (not lt!596506))))

(declare-fun lt!596505 () Bool)

(assert (=> d!144915 (= lt!596506 lt!596505)))

(declare-fun lt!596504 () Unit!44109)

(declare-fun e!767851 () Unit!44109)

(assert (=> d!144915 (= lt!596504 e!767851)))

(declare-fun c!126805 () Bool)

(assert (=> d!144915 (= c!126805 lt!596505)))

(assert (=> d!144915 (= lt!596505 (containsKey!743 (toList!11027 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> d!144915 (= (contains!9216 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142) lt!596506)))

(declare-fun b!1349591 () Bool)

(declare-fun lt!596503 () Unit!44109)

(assert (=> b!1349591 (= e!767851 lt!596503)))

(assert (=> b!1349591 (= lt!596503 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11027 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(assert (=> b!1349591 (isDefined!526 (getValueByKey!717 (toList!11027 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142))))

(declare-fun b!1349592 () Bool)

(declare-fun Unit!44114 () Unit!44109)

(assert (=> b!1349592 (= e!767851 Unit!44114)))

(declare-fun b!1349593 () Bool)

(assert (=> b!1349593 (= e!767850 (isDefined!526 (getValueByKey!717 (toList!11027 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) k0!1142)))))

(assert (= (and d!144915 c!126805) b!1349591))

(assert (= (and d!144915 (not c!126805)) b!1349592))

(assert (= (and d!144915 (not res!895136)) b!1349593))

(declare-fun m!1236975 () Bool)

(assert (=> d!144915 m!1236975))

(declare-fun m!1236977 () Bool)

(assert (=> b!1349591 m!1236977))

(declare-fun m!1236979 () Bool)

(assert (=> b!1349591 m!1236979))

(assert (=> b!1349591 m!1236979))

(declare-fun m!1236981 () Bool)

(assert (=> b!1349591 m!1236981))

(assert (=> b!1349593 m!1236979))

(assert (=> b!1349593 m!1236979))

(assert (=> b!1349593 m!1236981))

(assert (=> b!1349487 d!144915))

(declare-fun d!144917 () Bool)

(declare-fun e!767852 () Bool)

(assert (=> d!144917 e!767852))

(declare-fun res!895137 () Bool)

(assert (=> d!144917 (=> res!895137 e!767852)))

(declare-fun lt!596510 () Bool)

(assert (=> d!144917 (= res!895137 (not lt!596510))))

(declare-fun lt!596509 () Bool)

(assert (=> d!144917 (= lt!596510 lt!596509)))

(declare-fun lt!596508 () Unit!44109)

(declare-fun e!767853 () Unit!44109)

(assert (=> d!144917 (= lt!596508 e!767853)))

(declare-fun c!126806 () Bool)

(assert (=> d!144917 (= c!126806 lt!596509)))

(assert (=> d!144917 (= lt!596509 (containsKey!743 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144917 (= (contains!9216 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596510)))

(declare-fun b!1349594 () Bool)

(declare-fun lt!596507 () Unit!44109)

(assert (=> b!1349594 (= e!767853 lt!596507)))

(assert (=> b!1349594 (= lt!596507 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> b!1349594 (isDefined!526 (getValueByKey!717 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1349595 () Bool)

(declare-fun Unit!44115 () Unit!44109)

(assert (=> b!1349595 (= e!767853 Unit!44115)))

(declare-fun b!1349596 () Bool)

(assert (=> b!1349596 (= e!767852 (isDefined!526 (getValueByKey!717 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144917 c!126806) b!1349594))

(assert (= (and d!144917 (not c!126806)) b!1349595))

(assert (= (and d!144917 (not res!895137)) b!1349596))

(declare-fun m!1236983 () Bool)

(assert (=> d!144917 m!1236983))

(declare-fun m!1236985 () Bool)

(assert (=> b!1349594 m!1236985))

(declare-fun m!1236987 () Bool)

(assert (=> b!1349594 m!1236987))

(assert (=> b!1349594 m!1236987))

(declare-fun m!1236989 () Bool)

(assert (=> b!1349594 m!1236989))

(assert (=> b!1349596 m!1236987))

(assert (=> b!1349596 m!1236987))

(assert (=> b!1349596 m!1236989))

(assert (=> b!1349487 d!144917))

(declare-fun b!1349639 () Bool)

(declare-fun e!767880 () Bool)

(declare-fun call!65168 () Bool)

(assert (=> b!1349639 (= e!767880 (not call!65168))))

(declare-fun b!1349640 () Bool)

(declare-fun e!767888 () Bool)

(declare-fun e!767889 () Bool)

(assert (=> b!1349640 (= e!767888 e!767889)))

(declare-fun res!895160 () Bool)

(declare-fun call!65167 () Bool)

(assert (=> b!1349640 (= res!895160 call!65167)))

(assert (=> b!1349640 (=> (not res!895160) (not e!767889))))

(declare-fun b!1349641 () Bool)

(declare-fun c!126820 () Bool)

(assert (=> b!1349641 (= c!126820 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767881 () ListLongMap!22023)

(declare-fun e!767887 () ListLongMap!22023)

(assert (=> b!1349641 (= e!767881 e!767887)))

(declare-fun e!767885 () Bool)

(declare-fun lt!596567 () ListLongMap!22023)

(declare-fun b!1349642 () Bool)

(declare-fun apply!1047 (ListLongMap!22023 (_ BitVec 64)) V!55177)

(assert (=> b!1349642 (= e!767885 (= (apply!1047 lt!596567 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22484 (select (arr!44477 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349642 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45028 _values!1303)))))

(assert (=> b!1349642 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(declare-fun b!1349643 () Bool)

(declare-fun e!767892 () Bool)

(assert (=> b!1349643 (= e!767892 e!767880)))

(declare-fun c!126823 () Bool)

(assert (=> b!1349643 (= c!126823 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349645 () Bool)

(declare-fun e!767884 () ListLongMap!22023)

(declare-fun call!65165 () ListLongMap!22023)

(assert (=> b!1349645 (= e!767884 (+!4887 call!65165 (tuple2!24359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349646 () Bool)

(declare-fun e!767883 () Unit!44109)

(declare-fun Unit!44116 () Unit!44109)

(assert (=> b!1349646 (= e!767883 Unit!44116)))

(declare-fun b!1349647 () Bool)

(declare-fun res!895163 () Bool)

(assert (=> b!1349647 (=> (not res!895163) (not e!767892))))

(declare-fun e!767886 () Bool)

(assert (=> b!1349647 (= res!895163 e!767886)))

(declare-fun res!895159 () Bool)

(assert (=> b!1349647 (=> res!895159 e!767886)))

(declare-fun e!767882 () Bool)

(assert (=> b!1349647 (= res!895159 (not e!767882))))

(declare-fun res!895158 () Bool)

(assert (=> b!1349647 (=> (not res!895158) (not e!767882))))

(assert (=> b!1349647 (= res!895158 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(declare-fun b!1349648 () Bool)

(assert (=> b!1349648 (= e!767888 (not call!65167))))

(declare-fun b!1349649 () Bool)

(assert (=> b!1349649 (= e!767882 (validKeyInArray!0 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349650 () Bool)

(assert (=> b!1349650 (= e!767886 e!767885)))

(declare-fun res!895162 () Bool)

(assert (=> b!1349650 (=> (not res!895162) (not e!767885))))

(assert (=> b!1349650 (= res!895162 (contains!9216 lt!596567 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349650 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(declare-fun bm!65160 () Bool)

(declare-fun call!65169 () ListLongMap!22023)

(declare-fun call!65164 () ListLongMap!22023)

(assert (=> bm!65160 (= call!65169 call!65164)))

(declare-fun b!1349651 () Bool)

(declare-fun call!65163 () ListLongMap!22023)

(assert (=> b!1349651 (= e!767887 call!65163)))

(declare-fun b!1349652 () Bool)

(assert (=> b!1349652 (= e!767881 call!65163)))

(declare-fun bm!65161 () Bool)

(assert (=> bm!65161 (= call!65164 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1349644 () Bool)

(declare-fun res!895164 () Bool)

(assert (=> b!1349644 (=> (not res!895164) (not e!767892))))

(assert (=> b!1349644 (= res!895164 e!767888)))

(declare-fun c!126819 () Bool)

(assert (=> b!1349644 (= c!126819 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!144919 () Bool)

(assert (=> d!144919 e!767892))

(declare-fun res!895157 () Bool)

(assert (=> d!144919 (=> (not res!895157) (not e!767892))))

(assert (=> d!144919 (= res!895157 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))))

(declare-fun lt!596574 () ListLongMap!22023)

(assert (=> d!144919 (= lt!596567 lt!596574)))

(declare-fun lt!596555 () Unit!44109)

(assert (=> d!144919 (= lt!596555 e!767883)))

(declare-fun c!126824 () Bool)

(declare-fun e!767890 () Bool)

(assert (=> d!144919 (= c!126824 e!767890)))

(declare-fun res!895156 () Bool)

(assert (=> d!144919 (=> (not res!895156) (not e!767890))))

(assert (=> d!144919 (= res!895156 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(assert (=> d!144919 (= lt!596574 e!767884)))

(declare-fun c!126822 () Bool)

(assert (=> d!144919 (= c!126822 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144919 (validMask!0 mask!1977)))

(assert (=> d!144919 (= (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596567)))

(declare-fun b!1349653 () Bool)

(declare-fun lt!596568 () Unit!44109)

(assert (=> b!1349653 (= e!767883 lt!596568)))

(declare-fun lt!596563 () ListLongMap!22023)

(assert (=> b!1349653 (= lt!596563 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596558 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596576 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596576 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596559 () Unit!44109)

(assert (=> b!1349653 (= lt!596559 (addStillContains!1214 lt!596563 lt!596558 zeroValue!1245 lt!596576))))

(assert (=> b!1349653 (contains!9216 (+!4887 lt!596563 (tuple2!24359 lt!596558 zeroValue!1245)) lt!596576)))

(declare-fun lt!596561 () Unit!44109)

(assert (=> b!1349653 (= lt!596561 lt!596559)))

(declare-fun lt!596571 () ListLongMap!22023)

(assert (=> b!1349653 (= lt!596571 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596564 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596569 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596569 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596562 () Unit!44109)

(declare-fun addApplyDifferent!576 (ListLongMap!22023 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44109)

(assert (=> b!1349653 (= lt!596562 (addApplyDifferent!576 lt!596571 lt!596564 minValue!1245 lt!596569))))

(assert (=> b!1349653 (= (apply!1047 (+!4887 lt!596571 (tuple2!24359 lt!596564 minValue!1245)) lt!596569) (apply!1047 lt!596571 lt!596569))))

(declare-fun lt!596556 () Unit!44109)

(assert (=> b!1349653 (= lt!596556 lt!596562)))

(declare-fun lt!596560 () ListLongMap!22023)

(assert (=> b!1349653 (= lt!596560 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596573 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596570 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596570 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596557 () Unit!44109)

(assert (=> b!1349653 (= lt!596557 (addApplyDifferent!576 lt!596560 lt!596573 zeroValue!1245 lt!596570))))

(assert (=> b!1349653 (= (apply!1047 (+!4887 lt!596560 (tuple2!24359 lt!596573 zeroValue!1245)) lt!596570) (apply!1047 lt!596560 lt!596570))))

(declare-fun lt!596575 () Unit!44109)

(assert (=> b!1349653 (= lt!596575 lt!596557)))

(declare-fun lt!596572 () ListLongMap!22023)

(assert (=> b!1349653 (= lt!596572 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596566 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596565 () (_ BitVec 64))

(assert (=> b!1349653 (= lt!596565 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349653 (= lt!596568 (addApplyDifferent!576 lt!596572 lt!596566 minValue!1245 lt!596565))))

(assert (=> b!1349653 (= (apply!1047 (+!4887 lt!596572 (tuple2!24359 lt!596566 minValue!1245)) lt!596565) (apply!1047 lt!596572 lt!596565))))

(declare-fun b!1349654 () Bool)

(assert (=> b!1349654 (= e!767890 (validKeyInArray!0 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349655 () Bool)

(declare-fun e!767891 () Bool)

(assert (=> b!1349655 (= e!767891 (= (apply!1047 lt!596567 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun bm!65162 () Bool)

(declare-fun call!65166 () ListLongMap!22023)

(declare-fun c!126821 () Bool)

(assert (=> bm!65162 (= call!65165 (+!4887 (ite c!126822 call!65164 (ite c!126821 call!65169 call!65166)) (ite (or c!126822 c!126821) (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65163 () Bool)

(assert (=> bm!65163 (= call!65163 call!65165)))

(declare-fun b!1349656 () Bool)

(assert (=> b!1349656 (= e!767887 call!65166)))

(declare-fun b!1349657 () Bool)

(assert (=> b!1349657 (= e!767880 e!767891)))

(declare-fun res!895161 () Bool)

(assert (=> b!1349657 (= res!895161 call!65168)))

(assert (=> b!1349657 (=> (not res!895161) (not e!767891))))

(declare-fun bm!65164 () Bool)

(assert (=> bm!65164 (= call!65167 (contains!9216 lt!596567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65165 () Bool)

(assert (=> bm!65165 (= call!65168 (contains!9216 lt!596567 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349658 () Bool)

(assert (=> b!1349658 (= e!767884 e!767881)))

(assert (=> b!1349658 (= c!126821 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65166 () Bool)

(assert (=> bm!65166 (= call!65166 call!65169)))

(declare-fun b!1349659 () Bool)

(assert (=> b!1349659 (= e!767889 (= (apply!1047 lt!596567 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(assert (= (and d!144919 c!126822) b!1349645))

(assert (= (and d!144919 (not c!126822)) b!1349658))

(assert (= (and b!1349658 c!126821) b!1349652))

(assert (= (and b!1349658 (not c!126821)) b!1349641))

(assert (= (and b!1349641 c!126820) b!1349651))

(assert (= (and b!1349641 (not c!126820)) b!1349656))

(assert (= (or b!1349651 b!1349656) bm!65166))

(assert (= (or b!1349652 bm!65166) bm!65160))

(assert (= (or b!1349652 b!1349651) bm!65163))

(assert (= (or b!1349645 bm!65160) bm!65161))

(assert (= (or b!1349645 bm!65163) bm!65162))

(assert (= (and d!144919 res!895156) b!1349654))

(assert (= (and d!144919 c!126824) b!1349653))

(assert (= (and d!144919 (not c!126824)) b!1349646))

(assert (= (and d!144919 res!895157) b!1349647))

(assert (= (and b!1349647 res!895158) b!1349649))

(assert (= (and b!1349647 (not res!895159)) b!1349650))

(assert (= (and b!1349650 res!895162) b!1349642))

(assert (= (and b!1349647 res!895163) b!1349644))

(assert (= (and b!1349644 c!126819) b!1349640))

(assert (= (and b!1349644 (not c!126819)) b!1349648))

(assert (= (and b!1349640 res!895160) b!1349659))

(assert (= (or b!1349640 b!1349648) bm!65164))

(assert (= (and b!1349644 res!895164) b!1349643))

(assert (= (and b!1349643 c!126823) b!1349657))

(assert (= (and b!1349643 (not c!126823)) b!1349639))

(assert (= (and b!1349657 res!895161) b!1349655))

(assert (= (or b!1349657 b!1349639) bm!65165))

(declare-fun b_lambda!24631 () Bool)

(assert (=> (not b_lambda!24631) (not b!1349642)))

(assert (=> b!1349642 t!46120))

(declare-fun b_and!50913 () Bool)

(assert (= b_and!50903 (and (=> t!46120 result!25959) b_and!50913)))

(declare-fun m!1236991 () Bool)

(assert (=> b!1349654 m!1236991))

(assert (=> b!1349654 m!1236991))

(declare-fun m!1236993 () Bool)

(assert (=> b!1349654 m!1236993))

(assert (=> b!1349649 m!1236991))

(assert (=> b!1349649 m!1236991))

(assert (=> b!1349649 m!1236993))

(assert (=> b!1349650 m!1236991))

(assert (=> b!1349650 m!1236991))

(declare-fun m!1236995 () Bool)

(assert (=> b!1349650 m!1236995))

(declare-fun m!1236997 () Bool)

(assert (=> b!1349642 m!1236997))

(assert (=> b!1349642 m!1236831))

(assert (=> b!1349642 m!1236997))

(assert (=> b!1349642 m!1236831))

(declare-fun m!1236999 () Bool)

(assert (=> b!1349642 m!1236999))

(assert (=> b!1349642 m!1236991))

(declare-fun m!1237001 () Bool)

(assert (=> b!1349642 m!1237001))

(assert (=> b!1349642 m!1236991))

(assert (=> d!144919 m!1236819))

(assert (=> bm!65161 m!1236825))

(declare-fun m!1237003 () Bool)

(assert (=> bm!65162 m!1237003))

(declare-fun m!1237005 () Bool)

(assert (=> bm!65165 m!1237005))

(declare-fun m!1237007 () Bool)

(assert (=> b!1349659 m!1237007))

(declare-fun m!1237009 () Bool)

(assert (=> b!1349653 m!1237009))

(declare-fun m!1237011 () Bool)

(assert (=> b!1349653 m!1237011))

(declare-fun m!1237013 () Bool)

(assert (=> b!1349653 m!1237013))

(assert (=> b!1349653 m!1237011))

(declare-fun m!1237015 () Bool)

(assert (=> b!1349653 m!1237015))

(declare-fun m!1237017 () Bool)

(assert (=> b!1349653 m!1237017))

(declare-fun m!1237019 () Bool)

(assert (=> b!1349653 m!1237019))

(assert (=> b!1349653 m!1237009))

(declare-fun m!1237021 () Bool)

(assert (=> b!1349653 m!1237021))

(declare-fun m!1237023 () Bool)

(assert (=> b!1349653 m!1237023))

(declare-fun m!1237025 () Bool)

(assert (=> b!1349653 m!1237025))

(declare-fun m!1237027 () Bool)

(assert (=> b!1349653 m!1237027))

(declare-fun m!1237029 () Bool)

(assert (=> b!1349653 m!1237029))

(declare-fun m!1237031 () Bool)

(assert (=> b!1349653 m!1237031))

(assert (=> b!1349653 m!1236991))

(declare-fun m!1237033 () Bool)

(assert (=> b!1349653 m!1237033))

(declare-fun m!1237035 () Bool)

(assert (=> b!1349653 m!1237035))

(declare-fun m!1237037 () Bool)

(assert (=> b!1349653 m!1237037))

(assert (=> b!1349653 m!1236825))

(assert (=> b!1349653 m!1237035))

(assert (=> b!1349653 m!1237025))

(declare-fun m!1237039 () Bool)

(assert (=> b!1349645 m!1237039))

(declare-fun m!1237041 () Bool)

(assert (=> bm!65164 m!1237041))

(declare-fun m!1237043 () Bool)

(assert (=> b!1349655 m!1237043))

(assert (=> b!1349487 d!144919))

(declare-fun d!144921 () Bool)

(assert (=> d!144921 (contains!9216 lt!596438 k0!1142)))

(declare-fun lt!596577 () Unit!44109)

(assert (=> d!144921 (= lt!596577 (choose!1979 k0!1142 (select (arr!44476 _keys!1571) from!1960) lt!596436 lt!596438))))

(assert (=> d!144921 (contains!9216 (+!4887 lt!596438 (tuple2!24359 (select (arr!44476 _keys!1571) from!1960) lt!596436)) k0!1142)))

(assert (=> d!144921 (= (lemmaInListMapAfterAddingDiffThenInBefore!403 k0!1142 (select (arr!44476 _keys!1571) from!1960) lt!596436 lt!596438) lt!596577)))

(declare-fun bs!38666 () Bool)

(assert (= bs!38666 d!144921))

(assert (=> bs!38666 m!1236849))

(assert (=> bs!38666 m!1236807))

(declare-fun m!1237045 () Bool)

(assert (=> bs!38666 m!1237045))

(assert (=> bs!38666 m!1236851))

(assert (=> bs!38666 m!1236851))

(declare-fun m!1237047 () Bool)

(assert (=> bs!38666 m!1237047))

(assert (=> b!1349487 d!144921))

(declare-fun d!144923 () Bool)

(declare-fun e!767893 () Bool)

(assert (=> d!144923 e!767893))

(declare-fun res!895166 () Bool)

(assert (=> d!144923 (=> (not res!895166) (not e!767893))))

(declare-fun lt!596579 () ListLongMap!22023)

(assert (=> d!144923 (= res!895166 (contains!9216 lt!596579 (_1!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(declare-fun lt!596578 () List!31495)

(assert (=> d!144923 (= lt!596579 (ListLongMap!22024 lt!596578))))

(declare-fun lt!596581 () Unit!44109)

(declare-fun lt!596580 () Unit!44109)

(assert (=> d!144923 (= lt!596581 lt!596580)))

(assert (=> d!144923 (= (getValueByKey!717 lt!596578 (_1!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!767 (_2!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144923 (= lt!596580 (lemmaContainsTupThenGetReturnValue!367 lt!596578 (_1!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144923 (= lt!596578 (insertStrictlySorted!496 (toList!11027 lt!596438) (_1!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) (_2!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))))))

(assert (=> d!144923 (= (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) lt!596579)))

(declare-fun b!1349660 () Bool)

(declare-fun res!895165 () Bool)

(assert (=> b!1349660 (=> (not res!895165) (not e!767893))))

(assert (=> b!1349660 (= res!895165 (= (getValueByKey!717 (toList!11027 lt!596579) (_1!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245))) (Some!767 (_2!12190 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))))

(declare-fun b!1349661 () Bool)

(assert (=> b!1349661 (= e!767893 (contains!9219 (toList!11027 lt!596579) (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)))))

(assert (= (and d!144923 res!895166) b!1349660))

(assert (= (and b!1349660 res!895165) b!1349661))

(declare-fun m!1237049 () Bool)

(assert (=> d!144923 m!1237049))

(declare-fun m!1237051 () Bool)

(assert (=> d!144923 m!1237051))

(declare-fun m!1237053 () Bool)

(assert (=> d!144923 m!1237053))

(declare-fun m!1237055 () Bool)

(assert (=> d!144923 m!1237055))

(declare-fun m!1237057 () Bool)

(assert (=> b!1349660 m!1237057))

(declare-fun m!1237059 () Bool)

(assert (=> b!1349661 m!1237059))

(assert (=> b!1349487 d!144923))

(declare-fun d!144925 () Bool)

(assert (=> d!144925 (contains!9216 (+!4887 lt!596438 (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-fun lt!596584 () Unit!44109)

(declare-fun choose!1980 (ListLongMap!22023 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44109)

(assert (=> d!144925 (= lt!596584 (choose!1980 lt!596438 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> d!144925 (contains!9216 lt!596438 k0!1142)))

(assert (=> d!144925 (= (addStillContains!1214 lt!596438 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142) lt!596584)))

(declare-fun bs!38667 () Bool)

(assert (= bs!38667 d!144925))

(assert (=> bs!38667 m!1236843))

(assert (=> bs!38667 m!1236843))

(assert (=> bs!38667 m!1236845))

(declare-fun m!1237061 () Bool)

(assert (=> bs!38667 m!1237061))

(assert (=> bs!38667 m!1236849))

(assert (=> b!1349487 d!144925))

(declare-fun d!144927 () Bool)

(declare-fun c!126827 () Bool)

(assert (=> d!144927 (= c!126827 ((_ is ValueCellFull!17879) (select (arr!44477 _values!1303) from!1960)))))

(declare-fun e!767896 () V!55177)

(assert (=> d!144927 (= (get!22484 (select (arr!44477 _values!1303) from!1960) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767896)))

(declare-fun b!1349667 () Bool)

(declare-fun get!22486 (ValueCell!17879 V!55177) V!55177)

(assert (=> b!1349667 (= e!767896 (get!22486 (select (arr!44477 _values!1303) from!1960) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349668 () Bool)

(declare-fun get!22487 (ValueCell!17879 V!55177) V!55177)

(assert (=> b!1349668 (= e!767896 (get!22487 (select (arr!44477 _values!1303) from!1960) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144927 c!126827) b!1349667))

(assert (= (and d!144927 (not c!126827)) b!1349668))

(assert (=> b!1349667 m!1236829))

(assert (=> b!1349667 m!1236831))

(declare-fun m!1237063 () Bool)

(assert (=> b!1349667 m!1237063))

(assert (=> b!1349668 m!1236829))

(assert (=> b!1349668 m!1236831))

(declare-fun m!1237065 () Bool)

(assert (=> b!1349668 m!1237065))

(assert (=> b!1349487 d!144927))

(declare-fun d!144929 () Bool)

(declare-fun e!767897 () Bool)

(assert (=> d!144929 e!767897))

(declare-fun res!895167 () Bool)

(assert (=> d!144929 (=> res!895167 e!767897)))

(declare-fun lt!596588 () Bool)

(assert (=> d!144929 (= res!895167 (not lt!596588))))

(declare-fun lt!596587 () Bool)

(assert (=> d!144929 (= lt!596588 lt!596587)))

(declare-fun lt!596586 () Unit!44109)

(declare-fun e!767898 () Unit!44109)

(assert (=> d!144929 (= lt!596586 e!767898)))

(declare-fun c!126828 () Bool)

(assert (=> d!144929 (= c!126828 lt!596587)))

(assert (=> d!144929 (= lt!596587 (containsKey!743 (toList!11027 lt!596434) k0!1142))))

(assert (=> d!144929 (= (contains!9216 lt!596434 k0!1142) lt!596588)))

(declare-fun b!1349669 () Bool)

(declare-fun lt!596585 () Unit!44109)

(assert (=> b!1349669 (= e!767898 lt!596585)))

(assert (=> b!1349669 (= lt!596585 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11027 lt!596434) k0!1142))))

(assert (=> b!1349669 (isDefined!526 (getValueByKey!717 (toList!11027 lt!596434) k0!1142))))

(declare-fun b!1349670 () Bool)

(declare-fun Unit!44117 () Unit!44109)

(assert (=> b!1349670 (= e!767898 Unit!44117)))

(declare-fun b!1349671 () Bool)

(assert (=> b!1349671 (= e!767897 (isDefined!526 (getValueByKey!717 (toList!11027 lt!596434) k0!1142)))))

(assert (= (and d!144929 c!126828) b!1349669))

(assert (= (and d!144929 (not c!126828)) b!1349670))

(assert (= (and d!144929 (not res!895167)) b!1349671))

(declare-fun m!1237067 () Bool)

(assert (=> d!144929 m!1237067))

(declare-fun m!1237069 () Bool)

(assert (=> b!1349669 m!1237069))

(declare-fun m!1237071 () Bool)

(assert (=> b!1349669 m!1237071))

(assert (=> b!1349669 m!1237071))

(declare-fun m!1237073 () Bool)

(assert (=> b!1349669 m!1237073))

(assert (=> b!1349671 m!1237071))

(assert (=> b!1349671 m!1237071))

(assert (=> b!1349671 m!1237073))

(assert (=> b!1349487 d!144929))

(declare-fun b!1349696 () Bool)

(declare-fun e!767917 () Bool)

(assert (=> b!1349696 (= e!767917 (validKeyInArray!0 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349696 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1349697 () Bool)

(assert (=> b!1349697 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(assert (=> b!1349697 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45028 _values!1303)))))

(declare-fun e!767916 () Bool)

(declare-fun lt!596607 () ListLongMap!22023)

(assert (=> b!1349697 (= e!767916 (= (apply!1047 lt!596607 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22484 (select (arr!44477 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349698 () Bool)

(declare-fun e!767915 () ListLongMap!22023)

(assert (=> b!1349698 (= e!767915 (ListLongMap!22024 Nil!31492))))

(declare-fun b!1349699 () Bool)

(declare-fun e!767914 () Bool)

(assert (=> b!1349699 (= e!767914 e!767916)))

(assert (=> b!1349699 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(declare-fun res!895176 () Bool)

(assert (=> b!1349699 (= res!895176 (contains!9216 lt!596607 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349699 (=> (not res!895176) (not e!767916))))

(declare-fun b!1349701 () Bool)

(declare-fun e!767918 () ListLongMap!22023)

(assert (=> b!1349701 (= e!767915 e!767918)))

(declare-fun c!126838 () Bool)

(assert (=> b!1349701 (= c!126838 (validKeyInArray!0 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65169 () Bool)

(declare-fun call!65172 () ListLongMap!22023)

(assert (=> bm!65169 (= call!65172 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349702 () Bool)

(declare-fun res!895178 () Bool)

(declare-fun e!767919 () Bool)

(assert (=> b!1349702 (=> (not res!895178) (not e!767919))))

(assert (=> b!1349702 (= res!895178 (not (contains!9216 lt!596607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349703 () Bool)

(declare-fun e!767913 () Bool)

(declare-fun isEmpty!1098 (ListLongMap!22023) Bool)

(assert (=> b!1349703 (= e!767913 (isEmpty!1098 lt!596607))))

(declare-fun b!1349704 () Bool)

(declare-fun lt!596605 () Unit!44109)

(declare-fun lt!596606 () Unit!44109)

(assert (=> b!1349704 (= lt!596605 lt!596606)))

(declare-fun lt!596604 () (_ BitVec 64))

(declare-fun lt!596603 () (_ BitVec 64))

(declare-fun lt!596608 () ListLongMap!22023)

(declare-fun lt!596609 () V!55177)

(assert (=> b!1349704 (not (contains!9216 (+!4887 lt!596608 (tuple2!24359 lt!596603 lt!596609)) lt!596604))))

(declare-fun addStillNotContains!503 (ListLongMap!22023 (_ BitVec 64) V!55177 (_ BitVec 64)) Unit!44109)

(assert (=> b!1349704 (= lt!596606 (addStillNotContains!503 lt!596608 lt!596603 lt!596609 lt!596604))))

(assert (=> b!1349704 (= lt!596604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349704 (= lt!596609 (get!22484 (select (arr!44477 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349704 (= lt!596603 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349704 (= lt!596608 call!65172)))

(assert (=> b!1349704 (= e!767918 (+!4887 call!65172 (tuple2!24359 (select (arr!44476 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22484 (select (arr!44477 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!144931 () Bool)

(assert (=> d!144931 e!767919))

(declare-fun res!895177 () Bool)

(assert (=> d!144931 (=> (not res!895177) (not e!767919))))

(assert (=> d!144931 (= res!895177 (not (contains!9216 lt!596607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144931 (= lt!596607 e!767915)))

(declare-fun c!126839 () Bool)

(assert (=> d!144931 (= c!126839 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(assert (=> d!144931 (validMask!0 mask!1977)))

(assert (=> d!144931 (= (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596607)))

(declare-fun b!1349700 () Bool)

(assert (=> b!1349700 (= e!767918 call!65172)))

(declare-fun b!1349705 () Bool)

(assert (=> b!1349705 (= e!767913 (= lt!596607 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349706 () Bool)

(assert (=> b!1349706 (= e!767919 e!767914)))

(declare-fun c!126837 () Bool)

(assert (=> b!1349706 (= c!126837 e!767917)))

(declare-fun res!895179 () Bool)

(assert (=> b!1349706 (=> (not res!895179) (not e!767917))))

(assert (=> b!1349706 (= res!895179 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(declare-fun b!1349707 () Bool)

(assert (=> b!1349707 (= e!767914 e!767913)))

(declare-fun c!126840 () Bool)

(assert (=> b!1349707 (= c!126840 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45027 _keys!1571)))))

(assert (= (and d!144931 c!126839) b!1349698))

(assert (= (and d!144931 (not c!126839)) b!1349701))

(assert (= (and b!1349701 c!126838) b!1349704))

(assert (= (and b!1349701 (not c!126838)) b!1349700))

(assert (= (or b!1349704 b!1349700) bm!65169))

(assert (= (and d!144931 res!895177) b!1349702))

(assert (= (and b!1349702 res!895178) b!1349706))

(assert (= (and b!1349706 res!895179) b!1349696))

(assert (= (and b!1349706 c!126837) b!1349699))

(assert (= (and b!1349706 (not c!126837)) b!1349707))

(assert (= (and b!1349699 res!895176) b!1349697))

(assert (= (and b!1349707 c!126840) b!1349705))

(assert (= (and b!1349707 (not c!126840)) b!1349703))

(declare-fun b_lambda!24633 () Bool)

(assert (=> (not b_lambda!24633) (not b!1349697)))

(assert (=> b!1349697 t!46120))

(declare-fun b_and!50915 () Bool)

(assert (= b_and!50913 (and (=> t!46120 result!25959) b_and!50915)))

(declare-fun b_lambda!24635 () Bool)

(assert (=> (not b_lambda!24635) (not b!1349704)))

(assert (=> b!1349704 t!46120))

(declare-fun b_and!50917 () Bool)

(assert (= b_and!50915 (and (=> t!46120 result!25959) b_and!50917)))

(declare-fun m!1237075 () Bool)

(assert (=> b!1349704 m!1237075))

(assert (=> b!1349704 m!1236831))

(assert (=> b!1349704 m!1236997))

(declare-fun m!1237077 () Bool)

(assert (=> b!1349704 m!1237077))

(declare-fun m!1237079 () Bool)

(assert (=> b!1349704 m!1237079))

(assert (=> b!1349704 m!1237077))

(declare-fun m!1237081 () Bool)

(assert (=> b!1349704 m!1237081))

(assert (=> b!1349704 m!1236997))

(assert (=> b!1349704 m!1236831))

(assert (=> b!1349704 m!1236999))

(assert (=> b!1349704 m!1236991))

(assert (=> b!1349696 m!1236991))

(assert (=> b!1349696 m!1236991))

(assert (=> b!1349696 m!1236993))

(assert (=> b!1349699 m!1236991))

(assert (=> b!1349699 m!1236991))

(declare-fun m!1237083 () Bool)

(assert (=> b!1349699 m!1237083))

(declare-fun m!1237085 () Bool)

(assert (=> d!144931 m!1237085))

(assert (=> d!144931 m!1236819))

(declare-fun m!1237087 () Bool)

(assert (=> b!1349705 m!1237087))

(declare-fun m!1237089 () Bool)

(assert (=> b!1349703 m!1237089))

(declare-fun m!1237091 () Bool)

(assert (=> b!1349702 m!1237091))

(assert (=> b!1349701 m!1236991))

(assert (=> b!1349701 m!1236991))

(assert (=> b!1349701 m!1236993))

(assert (=> b!1349697 m!1236831))

(assert (=> b!1349697 m!1236997))

(assert (=> b!1349697 m!1236991))

(declare-fun m!1237093 () Bool)

(assert (=> b!1349697 m!1237093))

(assert (=> b!1349697 m!1236997))

(assert (=> b!1349697 m!1236831))

(assert (=> b!1349697 m!1236999))

(assert (=> b!1349697 m!1236991))

(assert (=> bm!65169 m!1237087))

(assert (=> b!1349487 d!144931))

(declare-fun d!144933 () Bool)

(declare-fun e!767920 () Bool)

(assert (=> d!144933 e!767920))

(declare-fun res!895180 () Bool)

(assert (=> d!144933 (=> res!895180 e!767920)))

(declare-fun lt!596613 () Bool)

(assert (=> d!144933 (= res!895180 (not lt!596613))))

(declare-fun lt!596612 () Bool)

(assert (=> d!144933 (= lt!596613 lt!596612)))

(declare-fun lt!596611 () Unit!44109)

(declare-fun e!767921 () Unit!44109)

(assert (=> d!144933 (= lt!596611 e!767921)))

(declare-fun c!126841 () Bool)

(assert (=> d!144933 (= c!126841 lt!596612)))

(assert (=> d!144933 (= lt!596612 (containsKey!743 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144933 (= (contains!9216 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596613)))

(declare-fun b!1349708 () Bool)

(declare-fun lt!596610 () Unit!44109)

(assert (=> b!1349708 (= e!767921 lt!596610)))

(assert (=> b!1349708 (= lt!596610 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1349708 (isDefined!526 (getValueByKey!717 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1349709 () Bool)

(declare-fun Unit!44118 () Unit!44109)

(assert (=> b!1349709 (= e!767921 Unit!44118)))

(declare-fun b!1349710 () Bool)

(assert (=> b!1349710 (= e!767920 (isDefined!526 (getValueByKey!717 (toList!11027 (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144933 c!126841) b!1349708))

(assert (= (and d!144933 (not c!126841)) b!1349709))

(assert (= (and d!144933 (not res!895180)) b!1349710))

(declare-fun m!1237095 () Bool)

(assert (=> d!144933 m!1237095))

(declare-fun m!1237097 () Bool)

(assert (=> b!1349708 m!1237097))

(declare-fun m!1237099 () Bool)

(assert (=> b!1349708 m!1237099))

(assert (=> b!1349708 m!1237099))

(declare-fun m!1237101 () Bool)

(assert (=> b!1349708 m!1237101))

(assert (=> b!1349710 m!1237099))

(assert (=> b!1349710 m!1237099))

(assert (=> b!1349710 m!1237101))

(assert (=> b!1349497 d!144933))

(declare-fun b!1349711 () Bool)

(declare-fun e!767922 () Bool)

(declare-fun call!65178 () Bool)

(assert (=> b!1349711 (= e!767922 (not call!65178))))

(declare-fun b!1349712 () Bool)

(declare-fun e!767930 () Bool)

(declare-fun e!767931 () Bool)

(assert (=> b!1349712 (= e!767930 e!767931)))

(declare-fun res!895185 () Bool)

(declare-fun call!65177 () Bool)

(assert (=> b!1349712 (= res!895185 call!65177)))

(assert (=> b!1349712 (=> (not res!895185) (not e!767931))))

(declare-fun b!1349713 () Bool)

(declare-fun c!126843 () Bool)

(assert (=> b!1349713 (= c!126843 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767923 () ListLongMap!22023)

(declare-fun e!767929 () ListLongMap!22023)

(assert (=> b!1349713 (= e!767923 e!767929)))

(declare-fun b!1349714 () Bool)

(declare-fun lt!596626 () ListLongMap!22023)

(declare-fun e!767927 () Bool)

(assert (=> b!1349714 (= e!767927 (= (apply!1047 lt!596626 (select (arr!44476 _keys!1571) from!1960)) (get!22484 (select (arr!44477 _values!1303) from!1960) (dynLambda!3841 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349714 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45028 _values!1303)))))

(assert (=> b!1349714 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45027 _keys!1571)))))

(declare-fun b!1349715 () Bool)

(declare-fun e!767934 () Bool)

(assert (=> b!1349715 (= e!767934 e!767922)))

(declare-fun c!126846 () Bool)

(assert (=> b!1349715 (= c!126846 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349717 () Bool)

(declare-fun e!767926 () ListLongMap!22023)

(declare-fun call!65175 () ListLongMap!22023)

(assert (=> b!1349717 (= e!767926 (+!4887 call!65175 (tuple2!24359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349718 () Bool)

(declare-fun e!767925 () Unit!44109)

(declare-fun Unit!44119 () Unit!44109)

(assert (=> b!1349718 (= e!767925 Unit!44119)))

(declare-fun b!1349719 () Bool)

(declare-fun res!895188 () Bool)

(assert (=> b!1349719 (=> (not res!895188) (not e!767934))))

(declare-fun e!767928 () Bool)

(assert (=> b!1349719 (= res!895188 e!767928)))

(declare-fun res!895184 () Bool)

(assert (=> b!1349719 (=> res!895184 e!767928)))

(declare-fun e!767924 () Bool)

(assert (=> b!1349719 (= res!895184 (not e!767924))))

(declare-fun res!895183 () Bool)

(assert (=> b!1349719 (=> (not res!895183) (not e!767924))))

(assert (=> b!1349719 (= res!895183 (bvslt from!1960 (size!45027 _keys!1571)))))

(declare-fun b!1349720 () Bool)

(assert (=> b!1349720 (= e!767930 (not call!65177))))

(declare-fun b!1349721 () Bool)

(assert (=> b!1349721 (= e!767924 (validKeyInArray!0 (select (arr!44476 _keys!1571) from!1960)))))

(declare-fun b!1349722 () Bool)

(assert (=> b!1349722 (= e!767928 e!767927)))

(declare-fun res!895187 () Bool)

(assert (=> b!1349722 (=> (not res!895187) (not e!767927))))

(assert (=> b!1349722 (= res!895187 (contains!9216 lt!596626 (select (arr!44476 _keys!1571) from!1960)))))

(assert (=> b!1349722 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45027 _keys!1571)))))

(declare-fun bm!65170 () Bool)

(declare-fun call!65179 () ListLongMap!22023)

(declare-fun call!65174 () ListLongMap!22023)

(assert (=> bm!65170 (= call!65179 call!65174)))

(declare-fun b!1349723 () Bool)

(declare-fun call!65173 () ListLongMap!22023)

(assert (=> b!1349723 (= e!767929 call!65173)))

(declare-fun b!1349724 () Bool)

(assert (=> b!1349724 (= e!767923 call!65173)))

(declare-fun bm!65171 () Bool)

(assert (=> bm!65171 (= call!65174 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun b!1349716 () Bool)

(declare-fun res!895189 () Bool)

(assert (=> b!1349716 (=> (not res!895189) (not e!767934))))

(assert (=> b!1349716 (= res!895189 e!767930)))

(declare-fun c!126842 () Bool)

(assert (=> b!1349716 (= c!126842 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!144935 () Bool)

(assert (=> d!144935 e!767934))

(declare-fun res!895182 () Bool)

(assert (=> d!144935 (=> (not res!895182) (not e!767934))))

(assert (=> d!144935 (= res!895182 (or (bvsge from!1960 (size!45027 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45027 _keys!1571)))))))

(declare-fun lt!596633 () ListLongMap!22023)

(assert (=> d!144935 (= lt!596626 lt!596633)))

(declare-fun lt!596614 () Unit!44109)

(assert (=> d!144935 (= lt!596614 e!767925)))

(declare-fun c!126847 () Bool)

(declare-fun e!767932 () Bool)

(assert (=> d!144935 (= c!126847 e!767932)))

(declare-fun res!895181 () Bool)

(assert (=> d!144935 (=> (not res!895181) (not e!767932))))

(assert (=> d!144935 (= res!895181 (bvslt from!1960 (size!45027 _keys!1571)))))

(assert (=> d!144935 (= lt!596633 e!767926)))

(declare-fun c!126845 () Bool)

(assert (=> d!144935 (= c!126845 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144935 (validMask!0 mask!1977)))

(assert (=> d!144935 (= (getCurrentListMap!5965 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596626)))

(declare-fun b!1349725 () Bool)

(declare-fun lt!596627 () Unit!44109)

(assert (=> b!1349725 (= e!767925 lt!596627)))

(declare-fun lt!596622 () ListLongMap!22023)

(assert (=> b!1349725 (= lt!596622 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596617 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596635 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596635 (select (arr!44476 _keys!1571) from!1960))))

(declare-fun lt!596618 () Unit!44109)

(assert (=> b!1349725 (= lt!596618 (addStillContains!1214 lt!596622 lt!596617 zeroValue!1245 lt!596635))))

(assert (=> b!1349725 (contains!9216 (+!4887 lt!596622 (tuple2!24359 lt!596617 zeroValue!1245)) lt!596635)))

(declare-fun lt!596620 () Unit!44109)

(assert (=> b!1349725 (= lt!596620 lt!596618)))

(declare-fun lt!596630 () ListLongMap!22023)

(assert (=> b!1349725 (= lt!596630 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596623 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596623 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596628 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596628 (select (arr!44476 _keys!1571) from!1960))))

(declare-fun lt!596621 () Unit!44109)

(assert (=> b!1349725 (= lt!596621 (addApplyDifferent!576 lt!596630 lt!596623 minValue!1245 lt!596628))))

(assert (=> b!1349725 (= (apply!1047 (+!4887 lt!596630 (tuple2!24359 lt!596623 minValue!1245)) lt!596628) (apply!1047 lt!596630 lt!596628))))

(declare-fun lt!596615 () Unit!44109)

(assert (=> b!1349725 (= lt!596615 lt!596621)))

(declare-fun lt!596619 () ListLongMap!22023)

(assert (=> b!1349725 (= lt!596619 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596632 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596629 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596629 (select (arr!44476 _keys!1571) from!1960))))

(declare-fun lt!596616 () Unit!44109)

(assert (=> b!1349725 (= lt!596616 (addApplyDifferent!576 lt!596619 lt!596632 zeroValue!1245 lt!596629))))

(assert (=> b!1349725 (= (apply!1047 (+!4887 lt!596619 (tuple2!24359 lt!596632 zeroValue!1245)) lt!596629) (apply!1047 lt!596619 lt!596629))))

(declare-fun lt!596634 () Unit!44109)

(assert (=> b!1349725 (= lt!596634 lt!596616)))

(declare-fun lt!596631 () ListLongMap!22023)

(assert (=> b!1349725 (= lt!596631 (getCurrentListMapNoExtraKeys!6540 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596625 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596625 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596624 () (_ BitVec 64))

(assert (=> b!1349725 (= lt!596624 (select (arr!44476 _keys!1571) from!1960))))

(assert (=> b!1349725 (= lt!596627 (addApplyDifferent!576 lt!596631 lt!596625 minValue!1245 lt!596624))))

(assert (=> b!1349725 (= (apply!1047 (+!4887 lt!596631 (tuple2!24359 lt!596625 minValue!1245)) lt!596624) (apply!1047 lt!596631 lt!596624))))

(declare-fun b!1349726 () Bool)

(assert (=> b!1349726 (= e!767932 (validKeyInArray!0 (select (arr!44476 _keys!1571) from!1960)))))

(declare-fun b!1349727 () Bool)

(declare-fun e!767933 () Bool)

(assert (=> b!1349727 (= e!767933 (= (apply!1047 lt!596626 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun bm!65172 () Bool)

(declare-fun call!65176 () ListLongMap!22023)

(declare-fun c!126844 () Bool)

(assert (=> bm!65172 (= call!65175 (+!4887 (ite c!126845 call!65174 (ite c!126844 call!65179 call!65176)) (ite (or c!126845 c!126844) (tuple2!24359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun bm!65173 () Bool)

(assert (=> bm!65173 (= call!65173 call!65175)))

(declare-fun b!1349728 () Bool)

(assert (=> b!1349728 (= e!767929 call!65176)))

(declare-fun b!1349729 () Bool)

(assert (=> b!1349729 (= e!767922 e!767933)))

(declare-fun res!895186 () Bool)

(assert (=> b!1349729 (= res!895186 call!65178)))

(assert (=> b!1349729 (=> (not res!895186) (not e!767933))))

(declare-fun bm!65174 () Bool)

(assert (=> bm!65174 (= call!65177 (contains!9216 lt!596626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65175 () Bool)

(assert (=> bm!65175 (= call!65178 (contains!9216 lt!596626 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349730 () Bool)

(assert (=> b!1349730 (= e!767926 e!767923)))

(assert (=> b!1349730 (= c!126844 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!65176 () Bool)

(assert (=> bm!65176 (= call!65176 call!65179)))

(declare-fun b!1349731 () Bool)

(assert (=> b!1349731 (= e!767931 (= (apply!1047 lt!596626 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(assert (= (and d!144935 c!126845) b!1349717))

(assert (= (and d!144935 (not c!126845)) b!1349730))

(assert (= (and b!1349730 c!126844) b!1349724))

(assert (= (and b!1349730 (not c!126844)) b!1349713))

(assert (= (and b!1349713 c!126843) b!1349723))

(assert (= (and b!1349713 (not c!126843)) b!1349728))

(assert (= (or b!1349723 b!1349728) bm!65176))

(assert (= (or b!1349724 bm!65176) bm!65170))

(assert (= (or b!1349724 b!1349723) bm!65173))

(assert (= (or b!1349717 bm!65170) bm!65171))

(assert (= (or b!1349717 bm!65173) bm!65172))

(assert (= (and d!144935 res!895181) b!1349726))

(assert (= (and d!144935 c!126847) b!1349725))

(assert (= (and d!144935 (not c!126847)) b!1349718))

(assert (= (and d!144935 res!895182) b!1349719))

(assert (= (and b!1349719 res!895183) b!1349721))

(assert (= (and b!1349719 (not res!895184)) b!1349722))

(assert (= (and b!1349722 res!895187) b!1349714))

(assert (= (and b!1349719 res!895188) b!1349716))

(assert (= (and b!1349716 c!126842) b!1349712))

(assert (= (and b!1349716 (not c!126842)) b!1349720))

(assert (= (and b!1349712 res!895185) b!1349731))

(assert (= (or b!1349712 b!1349720) bm!65174))

(assert (= (and b!1349716 res!895189) b!1349715))

(assert (= (and b!1349715 c!126846) b!1349729))

(assert (= (and b!1349715 (not c!126846)) b!1349711))

(assert (= (and b!1349729 res!895186) b!1349727))

(assert (= (or b!1349729 b!1349711) bm!65175))

(declare-fun b_lambda!24637 () Bool)

(assert (=> (not b_lambda!24637) (not b!1349714)))

(assert (=> b!1349714 t!46120))

(declare-fun b_and!50919 () Bool)

(assert (= b_and!50917 (and (=> t!46120 result!25959) b_and!50919)))

(assert (=> b!1349726 m!1236807))

(assert (=> b!1349726 m!1236807))

(assert (=> b!1349726 m!1236809))

(assert (=> b!1349721 m!1236807))

(assert (=> b!1349721 m!1236807))

(assert (=> b!1349721 m!1236809))

(assert (=> b!1349722 m!1236807))

(assert (=> b!1349722 m!1236807))

(declare-fun m!1237103 () Bool)

(assert (=> b!1349722 m!1237103))

(assert (=> b!1349714 m!1236829))

(assert (=> b!1349714 m!1236831))

(assert (=> b!1349714 m!1236829))

(assert (=> b!1349714 m!1236831))

(assert (=> b!1349714 m!1236833))

(assert (=> b!1349714 m!1236807))

(declare-fun m!1237105 () Bool)

(assert (=> b!1349714 m!1237105))

(assert (=> b!1349714 m!1236807))

(assert (=> d!144935 m!1236819))

(declare-fun m!1237107 () Bool)

(assert (=> bm!65171 m!1237107))

(declare-fun m!1237109 () Bool)

(assert (=> bm!65172 m!1237109))

(declare-fun m!1237111 () Bool)

(assert (=> bm!65175 m!1237111))

(declare-fun m!1237113 () Bool)

(assert (=> b!1349731 m!1237113))

(declare-fun m!1237115 () Bool)

(assert (=> b!1349725 m!1237115))

(declare-fun m!1237117 () Bool)

(assert (=> b!1349725 m!1237117))

(declare-fun m!1237119 () Bool)

(assert (=> b!1349725 m!1237119))

(assert (=> b!1349725 m!1237117))

(declare-fun m!1237121 () Bool)

(assert (=> b!1349725 m!1237121))

(declare-fun m!1237123 () Bool)

(assert (=> b!1349725 m!1237123))

(declare-fun m!1237125 () Bool)

(assert (=> b!1349725 m!1237125))

(assert (=> b!1349725 m!1237115))

(declare-fun m!1237127 () Bool)

(assert (=> b!1349725 m!1237127))

(declare-fun m!1237129 () Bool)

(assert (=> b!1349725 m!1237129))

(declare-fun m!1237131 () Bool)

(assert (=> b!1349725 m!1237131))

(declare-fun m!1237133 () Bool)

(assert (=> b!1349725 m!1237133))

(declare-fun m!1237135 () Bool)

(assert (=> b!1349725 m!1237135))

(declare-fun m!1237137 () Bool)

(assert (=> b!1349725 m!1237137))

(assert (=> b!1349725 m!1236807))

(declare-fun m!1237139 () Bool)

(assert (=> b!1349725 m!1237139))

(declare-fun m!1237141 () Bool)

(assert (=> b!1349725 m!1237141))

(declare-fun m!1237143 () Bool)

(assert (=> b!1349725 m!1237143))

(assert (=> b!1349725 m!1237107))

(assert (=> b!1349725 m!1237141))

(assert (=> b!1349725 m!1237131))

(declare-fun m!1237145 () Bool)

(assert (=> b!1349717 m!1237145))

(declare-fun m!1237147 () Bool)

(assert (=> bm!65174 m!1237147))

(declare-fun m!1237149 () Bool)

(assert (=> b!1349727 m!1237149))

(assert (=> b!1349497 d!144935))

(declare-fun b!1349742 () Bool)

(declare-fun e!767946 () Bool)

(declare-fun call!65182 () Bool)

(assert (=> b!1349742 (= e!767946 call!65182)))

(declare-fun b!1349743 () Bool)

(declare-fun e!767943 () Bool)

(declare-fun e!767944 () Bool)

(assert (=> b!1349743 (= e!767943 e!767944)))

(declare-fun res!895198 () Bool)

(assert (=> b!1349743 (=> (not res!895198) (not e!767944))))

(declare-fun e!767945 () Bool)

(assert (=> b!1349743 (= res!895198 (not e!767945))))

(declare-fun res!895197 () Bool)

(assert (=> b!1349743 (=> (not res!895197) (not e!767945))))

(assert (=> b!1349743 (= res!895197 (validKeyInArray!0 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65179 () Bool)

(declare-fun c!126850 () Bool)

(assert (=> bm!65179 (= call!65182 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126850 (Cons!31492 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000) Nil!31493) Nil!31493)))))

(declare-fun b!1349744 () Bool)

(declare-fun contains!9220 (List!31496 (_ BitVec 64)) Bool)

(assert (=> b!1349744 (= e!767945 (contains!9220 Nil!31493 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!144937 () Bool)

(declare-fun res!895196 () Bool)

(assert (=> d!144937 (=> res!895196 e!767943)))

(assert (=> d!144937 (= res!895196 (bvsge #b00000000000000000000000000000000 (size!45027 _keys!1571)))))

(assert (=> d!144937 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31493) e!767943)))

(declare-fun b!1349745 () Bool)

(assert (=> b!1349745 (= e!767946 call!65182)))

(declare-fun b!1349746 () Bool)

(assert (=> b!1349746 (= e!767944 e!767946)))

(assert (=> b!1349746 (= c!126850 (validKeyInArray!0 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144937 (not res!895196)) b!1349743))

(assert (= (and b!1349743 res!895197) b!1349744))

(assert (= (and b!1349743 res!895198) b!1349746))

(assert (= (and b!1349746 c!126850) b!1349742))

(assert (= (and b!1349746 (not c!126850)) b!1349745))

(assert (= (or b!1349742 b!1349745) bm!65179))

(declare-fun m!1237151 () Bool)

(assert (=> b!1349743 m!1237151))

(assert (=> b!1349743 m!1237151))

(declare-fun m!1237153 () Bool)

(assert (=> b!1349743 m!1237153))

(assert (=> bm!65179 m!1237151))

(declare-fun m!1237155 () Bool)

(assert (=> bm!65179 m!1237155))

(assert (=> b!1349744 m!1237151))

(assert (=> b!1349744 m!1237151))

(declare-fun m!1237157 () Bool)

(assert (=> b!1349744 m!1237157))

(assert (=> b!1349746 m!1237151))

(assert (=> b!1349746 m!1237151))

(assert (=> b!1349746 m!1237153))

(assert (=> b!1349496 d!144937))

(declare-fun d!144939 () Bool)

(assert (=> d!144939 (= (validKeyInArray!0 (select (arr!44476 _keys!1571) from!1960)) (and (not (= (select (arr!44476 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44476 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349490 d!144939))

(declare-fun b!1349755 () Bool)

(declare-fun e!767953 () Bool)

(declare-fun call!65185 () Bool)

(assert (=> b!1349755 (= e!767953 call!65185)))

(declare-fun b!1349756 () Bool)

(declare-fun e!767954 () Bool)

(assert (=> b!1349756 (= e!767954 e!767953)))

(declare-fun c!126853 () Bool)

(assert (=> b!1349756 (= c!126853 (validKeyInArray!0 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349757 () Bool)

(declare-fun e!767955 () Bool)

(assert (=> b!1349757 (= e!767955 call!65185)))

(declare-fun b!1349758 () Bool)

(assert (=> b!1349758 (= e!767953 e!767955)))

(declare-fun lt!596642 () (_ BitVec 64))

(assert (=> b!1349758 (= lt!596642 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000))))

(declare-fun lt!596643 () Unit!44109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92051 (_ BitVec 64) (_ BitVec 32)) Unit!44109)

(assert (=> b!1349758 (= lt!596643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596642 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1349758 (arrayContainsKey!0 _keys!1571 lt!596642 #b00000000000000000000000000000000)))

(declare-fun lt!596644 () Unit!44109)

(assert (=> b!1349758 (= lt!596644 lt!596643)))

(declare-fun res!895203 () Bool)

(declare-datatypes ((SeekEntryResult!10013 0))(
  ( (MissingZero!10013 (index!42423 (_ BitVec 32))) (Found!10013 (index!42424 (_ BitVec 32))) (Intermediate!10013 (undefined!10825 Bool) (index!42425 (_ BitVec 32)) (x!120652 (_ BitVec 32))) (Undefined!10013) (MissingVacant!10013 (index!42426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92051 (_ BitVec 32)) SeekEntryResult!10013)

(assert (=> b!1349758 (= res!895203 (= (seekEntryOrOpen!0 (select (arr!44476 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10013 #b00000000000000000000000000000000)))))

(assert (=> b!1349758 (=> (not res!895203) (not e!767955))))

(declare-fun d!144941 () Bool)

(declare-fun res!895204 () Bool)

(assert (=> d!144941 (=> res!895204 e!767954)))

(assert (=> d!144941 (= res!895204 (bvsge #b00000000000000000000000000000000 (size!45027 _keys!1571)))))

(assert (=> d!144941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767954)))

(declare-fun bm!65182 () Bool)

(assert (=> bm!65182 (= call!65185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!144941 (not res!895204)) b!1349756))

(assert (= (and b!1349756 c!126853) b!1349758))

(assert (= (and b!1349756 (not c!126853)) b!1349755))

(assert (= (and b!1349758 res!895203) b!1349757))

(assert (= (or b!1349757 b!1349755) bm!65182))

(assert (=> b!1349756 m!1237151))

(assert (=> b!1349756 m!1237151))

(assert (=> b!1349756 m!1237153))

(assert (=> b!1349758 m!1237151))

(declare-fun m!1237159 () Bool)

(assert (=> b!1349758 m!1237159))

(declare-fun m!1237161 () Bool)

(assert (=> b!1349758 m!1237161))

(assert (=> b!1349758 m!1237151))

(declare-fun m!1237163 () Bool)

(assert (=> b!1349758 m!1237163))

(declare-fun m!1237165 () Bool)

(assert (=> bm!65182 m!1237165))

(assert (=> b!1349495 d!144941))

(declare-fun d!144943 () Bool)

(assert (=> d!144943 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113786 d!144943))

(declare-fun d!144945 () Bool)

(assert (=> d!144945 (= (array_inv!33765 _keys!1571) (bvsge (size!45027 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113786 d!144945))

(declare-fun d!144947 () Bool)

(assert (=> d!144947 (= (array_inv!33766 _values!1303) (bvsge (size!45028 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113786 d!144947))

(declare-fun condMapEmpty!58052 () Bool)

(declare-fun mapDefault!58052 () ValueCell!17879)

(assert (=> mapNonEmpty!58043 (= condMapEmpty!58052 (= mapRest!58043 ((as const (Array (_ BitVec 32) ValueCell!17879)) mapDefault!58052)))))

(declare-fun e!767960 () Bool)

(declare-fun mapRes!58052 () Bool)

(assert (=> mapNonEmpty!58043 (= tp!110473 (and e!767960 mapRes!58052))))

(declare-fun mapIsEmpty!58052 () Bool)

(assert (=> mapIsEmpty!58052 mapRes!58052))

(declare-fun mapNonEmpty!58052 () Bool)

(declare-fun tp!110489 () Bool)

(declare-fun e!767961 () Bool)

(assert (=> mapNonEmpty!58052 (= mapRes!58052 (and tp!110489 e!767961))))

(declare-fun mapRest!58052 () (Array (_ BitVec 32) ValueCell!17879))

(declare-fun mapValue!58052 () ValueCell!17879)

(declare-fun mapKey!58052 () (_ BitVec 32))

(assert (=> mapNonEmpty!58052 (= mapRest!58043 (store mapRest!58052 mapKey!58052 mapValue!58052))))

(declare-fun b!1349766 () Bool)

(assert (=> b!1349766 (= e!767960 tp_is_empty!37555)))

(declare-fun b!1349765 () Bool)

(assert (=> b!1349765 (= e!767961 tp_is_empty!37555)))

(assert (= (and mapNonEmpty!58043 condMapEmpty!58052) mapIsEmpty!58052))

(assert (= (and mapNonEmpty!58043 (not condMapEmpty!58052)) mapNonEmpty!58052))

(assert (= (and mapNonEmpty!58052 ((_ is ValueCellFull!17879) mapValue!58052)) b!1349765))

(assert (= (and mapNonEmpty!58043 ((_ is ValueCellFull!17879) mapDefault!58052)) b!1349766))

(declare-fun m!1237167 () Bool)

(assert (=> mapNonEmpty!58052 m!1237167))

(declare-fun b_lambda!24639 () Bool)

(assert (= b_lambda!24637 (or (and start!113786 b_free!31555) b_lambda!24639)))

(declare-fun b_lambda!24641 () Bool)

(assert (= b_lambda!24631 (or (and start!113786 b_free!31555) b_lambda!24641)))

(declare-fun b_lambda!24643 () Bool)

(assert (= b_lambda!24635 (or (and start!113786 b_free!31555) b_lambda!24643)))

(declare-fun b_lambda!24645 () Bool)

(assert (= b_lambda!24633 (or (and start!113786 b_free!31555) b_lambda!24645)))

(check-sat (not b!1349650) (not b!1349714) (not bm!65169) (not bm!65164) (not d!144925) (not b!1349721) (not b!1349661) (not b!1349590) (not b!1349727) (not b!1349696) (not b!1349645) (not b!1349708) (not b!1349725) (not b!1349697) (not bm!65182) (not b!1349703) (not d!144935) (not b!1349702) (not bm!65171) (not b!1349589) (not d!144929) (not b!1349593) (not b_lambda!24629) (not b!1349731) (not b!1349671) (not d!144915) (not bm!65161) tp_is_empty!37555 (not b!1349582) (not d!144931) (not bm!65175) (not d!144919) (not b!1349596) (not b!1349594) (not d!144917) (not b!1349699) (not b!1349591) (not b!1349710) (not d!144923) b_and!50919 (not b!1349659) (not b!1349743) (not b!1349746) (not b!1349756) (not b!1349667) (not bm!65165) (not b_lambda!24641) (not b!1349704) (not bm!65162) (not bm!65172) (not b!1349669) (not b!1349642) (not b!1349701) (not b!1349655) (not b!1349744) (not d!144913) (not b_lambda!24639) (not b!1349722) (not bm!65179) (not b!1349654) (not d!144921) (not b!1349584) (not d!144911) (not b!1349653) (not b_next!31555) (not b!1349649) (not mapNonEmpty!58052) (not bm!65174) (not b!1349758) (not b_lambda!24645) (not b!1349705) (not b!1349717) (not b!1349660) (not b!1349726) (not b!1349668) (not d!144933) (not d!144909) (not b_lambda!24643))
(check-sat b_and!50919 (not b_next!31555))
