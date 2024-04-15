; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108602 () Bool)

(assert start!108602)

(declare-fun b_free!28129 () Bool)

(declare-fun b_next!28129 () Bool)

(assert (=> start!108602 (= b_free!28129 (not b_next!28129))))

(declare-fun tp!99501 () Bool)

(declare-fun b_and!46175 () Bool)

(assert (=> start!108602 (= tp!99501 b_and!46175)))

(declare-fun b!1281905 () Bool)

(declare-fun e!732429 () Bool)

(declare-fun e!732425 () Bool)

(declare-fun mapRes!52208 () Bool)

(assert (=> b!1281905 (= e!732429 (and e!732425 mapRes!52208))))

(declare-fun condMapEmpty!52208 () Bool)

(declare-datatypes ((V!50129 0))(
  ( (V!50130 (val!16959 Int)) )
))
(declare-datatypes ((ValueCell!15986 0))(
  ( (ValueCellFull!15986 (v!19559 V!50129)) (EmptyCell!15986) )
))
(declare-datatypes ((array!84505 0))(
  ( (array!84506 (arr!40756 (Array (_ BitVec 32) ValueCell!15986)) (size!41308 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84505)

(declare-fun mapDefault!52208 () ValueCell!15986)

(assert (=> b!1281905 (= condMapEmpty!52208 (= (arr!40756 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15986)) mapDefault!52208)))))

(declare-fun res!851538 () Bool)

(declare-fun e!732426 () Bool)

(assert (=> start!108602 (=> (not res!851538) (not e!732426))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108602 (= res!851538 (validMask!0 mask!2175))))

(assert (=> start!108602 e!732426))

(declare-fun tp_is_empty!33769 () Bool)

(assert (=> start!108602 tp_is_empty!33769))

(assert (=> start!108602 true))

(declare-fun array_inv!31085 (array!84505) Bool)

(assert (=> start!108602 (and (array_inv!31085 _values!1445) e!732429)))

(declare-datatypes ((array!84507 0))(
  ( (array!84508 (arr!40757 (Array (_ BitVec 32) (_ BitVec 64))) (size!41309 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84507)

(declare-fun array_inv!31086 (array!84507) Bool)

(assert (=> start!108602 (array_inv!31086 _keys!1741)))

(assert (=> start!108602 tp!99501))

(declare-fun b!1281906 () Bool)

(declare-fun res!851537 () Bool)

(assert (=> b!1281906 (=> (not res!851537) (not e!732426))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281906 (= res!851537 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41309 _keys!1741))))))

(declare-fun b!1281907 () Bool)

(declare-fun res!851536 () Bool)

(assert (=> b!1281907 (=> (not res!851536) (not e!732426))))

(declare-datatypes ((List!28977 0))(
  ( (Nil!28974) (Cons!28973 (h!30182 (_ BitVec 64)) (t!42511 List!28977)) )
))
(declare-fun arrayNoDuplicates!0 (array!84507 (_ BitVec 32) List!28977) Bool)

(assert (=> b!1281907 (= res!851536 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28974))))

(declare-fun b!1281908 () Bool)

(assert (=> b!1281908 (= e!732425 tp_is_empty!33769)))

(declare-fun b!1281909 () Bool)

(declare-fun res!851535 () Bool)

(assert (=> b!1281909 (=> (not res!851535) (not e!732426))))

(declare-fun zeroValue!1387 () V!50129)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50129)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21790 0))(
  ( (tuple2!21791 (_1!10906 (_ BitVec 64)) (_2!10906 V!50129)) )
))
(declare-datatypes ((List!28978 0))(
  ( (Nil!28975) (Cons!28974 (h!30183 tuple2!21790) (t!42512 List!28978)) )
))
(declare-datatypes ((ListLongMap!19447 0))(
  ( (ListLongMap!19448 (toList!9739 List!28978)) )
))
(declare-fun contains!7785 (ListLongMap!19447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4713 (array!84507 array!84505 (_ BitVec 32) (_ BitVec 32) V!50129 V!50129 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1281909 (= res!851535 (contains!7785 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52208 () Bool)

(declare-fun tp!99500 () Bool)

(declare-fun e!732427 () Bool)

(assert (=> mapNonEmpty!52208 (= mapRes!52208 (and tp!99500 e!732427))))

(declare-fun mapRest!52208 () (Array (_ BitVec 32) ValueCell!15986))

(declare-fun mapKey!52208 () (_ BitVec 32))

(declare-fun mapValue!52208 () ValueCell!15986)

(assert (=> mapNonEmpty!52208 (= (arr!40756 _values!1445) (store mapRest!52208 mapKey!52208 mapValue!52208))))

(declare-fun b!1281910 () Bool)

(assert (=> b!1281910 (= e!732426 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41309 _keys!1741)) (= (select (arr!40757 _keys!1741) from!2144) k0!1205) (bvsge (size!41309 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1281911 () Bool)

(declare-fun res!851534 () Bool)

(assert (=> b!1281911 (=> (not res!851534) (not e!732426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84507 (_ BitVec 32)) Bool)

(assert (=> b!1281911 (= res!851534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52208 () Bool)

(assert (=> mapIsEmpty!52208 mapRes!52208))

(declare-fun b!1281912 () Bool)

(declare-fun res!851533 () Bool)

(assert (=> b!1281912 (=> (not res!851533) (not e!732426))))

(assert (=> b!1281912 (= res!851533 (and (= (size!41308 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41309 _keys!1741) (size!41308 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281913 () Bool)

(assert (=> b!1281913 (= e!732427 tp_is_empty!33769)))

(assert (= (and start!108602 res!851538) b!1281912))

(assert (= (and b!1281912 res!851533) b!1281911))

(assert (= (and b!1281911 res!851534) b!1281907))

(assert (= (and b!1281907 res!851536) b!1281906))

(assert (= (and b!1281906 res!851537) b!1281909))

(assert (= (and b!1281909 res!851535) b!1281910))

(assert (= (and b!1281905 condMapEmpty!52208) mapIsEmpty!52208))

(assert (= (and b!1281905 (not condMapEmpty!52208)) mapNonEmpty!52208))

(get-info :version)

(assert (= (and mapNonEmpty!52208 ((_ is ValueCellFull!15986) mapValue!52208)) b!1281913))

(assert (= (and b!1281905 ((_ is ValueCellFull!15986) mapDefault!52208)) b!1281908))

(assert (= start!108602 b!1281905))

(declare-fun m!1175817 () Bool)

(assert (=> b!1281911 m!1175817))

(declare-fun m!1175819 () Bool)

(assert (=> start!108602 m!1175819))

(declare-fun m!1175821 () Bool)

(assert (=> start!108602 m!1175821))

(declare-fun m!1175823 () Bool)

(assert (=> start!108602 m!1175823))

(declare-fun m!1175825 () Bool)

(assert (=> b!1281909 m!1175825))

(assert (=> b!1281909 m!1175825))

(declare-fun m!1175827 () Bool)

(assert (=> b!1281909 m!1175827))

(declare-fun m!1175829 () Bool)

(assert (=> b!1281907 m!1175829))

(declare-fun m!1175831 () Bool)

(assert (=> b!1281910 m!1175831))

(declare-fun m!1175833 () Bool)

(assert (=> mapNonEmpty!52208 m!1175833))

(check-sat (not b!1281909) (not mapNonEmpty!52208) (not b!1281907) (not b_next!28129) tp_is_empty!33769 (not b!1281911) b_and!46175 (not start!108602))
(check-sat b_and!46175 (not b_next!28129))
(get-model)

(declare-fun b!1281976 () Bool)

(declare-fun e!732466 () Bool)

(declare-fun call!62734 () Bool)

(assert (=> b!1281976 (= e!732466 call!62734)))

(declare-fun b!1281978 () Bool)

(declare-fun e!732467 () Bool)

(declare-fun e!732468 () Bool)

(assert (=> b!1281978 (= e!732467 e!732468)))

(declare-fun c!124062 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1281978 (= c!124062 (validKeyInArray!0 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62731 () Bool)

(assert (=> bm!62731 (= call!62734 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1281979 () Bool)

(assert (=> b!1281979 (= e!732468 call!62734)))

(declare-fun b!1281977 () Bool)

(assert (=> b!1281977 (= e!732468 e!732466)))

(declare-fun lt!576239 () (_ BitVec 64))

(assert (=> b!1281977 (= lt!576239 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42297 0))(
  ( (Unit!42298) )
))
(declare-fun lt!576240 () Unit!42297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84507 (_ BitVec 64) (_ BitVec 32)) Unit!42297)

(assert (=> b!1281977 (= lt!576240 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576239 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281977 (arrayContainsKey!0 _keys!1741 lt!576239 #b00000000000000000000000000000000)))

(declare-fun lt!576238 () Unit!42297)

(assert (=> b!1281977 (= lt!576238 lt!576240)))

(declare-fun res!851580 () Bool)

(declare-datatypes ((SeekEntryResult!10012 0))(
  ( (MissingZero!10012 (index!42419 (_ BitVec 32))) (Found!10012 (index!42420 (_ BitVec 32))) (Intermediate!10012 (undefined!10824 Bool) (index!42421 (_ BitVec 32)) (x!113708 (_ BitVec 32))) (Undefined!10012) (MissingVacant!10012 (index!42422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84507 (_ BitVec 32)) SeekEntryResult!10012)

(assert (=> b!1281977 (= res!851580 (= (seekEntryOrOpen!0 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10012 #b00000000000000000000000000000000)))))

(assert (=> b!1281977 (=> (not res!851580) (not e!732466))))

(declare-fun d!140561 () Bool)

(declare-fun res!851579 () Bool)

(assert (=> d!140561 (=> res!851579 e!732467)))

(assert (=> d!140561 (= res!851579 (bvsge #b00000000000000000000000000000000 (size!41309 _keys!1741)))))

(assert (=> d!140561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!732467)))

(assert (= (and d!140561 (not res!851579)) b!1281978))

(assert (= (and b!1281978 c!124062) b!1281977))

(assert (= (and b!1281978 (not c!124062)) b!1281979))

(assert (= (and b!1281977 res!851580) b!1281976))

(assert (= (or b!1281976 b!1281979) bm!62731))

(declare-fun m!1175871 () Bool)

(assert (=> b!1281978 m!1175871))

(assert (=> b!1281978 m!1175871))

(declare-fun m!1175873 () Bool)

(assert (=> b!1281978 m!1175873))

(declare-fun m!1175875 () Bool)

(assert (=> bm!62731 m!1175875))

(assert (=> b!1281977 m!1175871))

(declare-fun m!1175877 () Bool)

(assert (=> b!1281977 m!1175877))

(declare-fun m!1175879 () Bool)

(assert (=> b!1281977 m!1175879))

(assert (=> b!1281977 m!1175871))

(declare-fun m!1175881 () Bool)

(assert (=> b!1281977 m!1175881))

(assert (=> b!1281911 d!140561))

(declare-fun b!1281990 () Bool)

(declare-fun e!732479 () Bool)

(declare-fun contains!7786 (List!28977 (_ BitVec 64)) Bool)

(assert (=> b!1281990 (= e!732479 (contains!7786 Nil!28974 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281991 () Bool)

(declare-fun e!732480 () Bool)

(declare-fun e!732477 () Bool)

(assert (=> b!1281991 (= e!732480 e!732477)))

(declare-fun res!851587 () Bool)

(assert (=> b!1281991 (=> (not res!851587) (not e!732477))))

(assert (=> b!1281991 (= res!851587 (not e!732479))))

(declare-fun res!851588 () Bool)

(assert (=> b!1281991 (=> (not res!851588) (not e!732479))))

(assert (=> b!1281991 (= res!851588 (validKeyInArray!0 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62734 () Bool)

(declare-fun call!62737 () Bool)

(declare-fun c!124065 () Bool)

(assert (=> bm!62734 (= call!62737 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124065 (Cons!28973 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000) Nil!28974) Nil!28974)))))

(declare-fun d!140563 () Bool)

(declare-fun res!851589 () Bool)

(assert (=> d!140563 (=> res!851589 e!732480)))

(assert (=> d!140563 (= res!851589 (bvsge #b00000000000000000000000000000000 (size!41309 _keys!1741)))))

(assert (=> d!140563 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28974) e!732480)))

(declare-fun b!1281992 () Bool)

(declare-fun e!732478 () Bool)

(assert (=> b!1281992 (= e!732477 e!732478)))

(assert (=> b!1281992 (= c!124065 (validKeyInArray!0 (select (arr!40757 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281993 () Bool)

(assert (=> b!1281993 (= e!732478 call!62737)))

(declare-fun b!1281994 () Bool)

(assert (=> b!1281994 (= e!732478 call!62737)))

(assert (= (and d!140563 (not res!851589)) b!1281991))

(assert (= (and b!1281991 res!851588) b!1281990))

(assert (= (and b!1281991 res!851587) b!1281992))

(assert (= (and b!1281992 c!124065) b!1281993))

(assert (= (and b!1281992 (not c!124065)) b!1281994))

(assert (= (or b!1281993 b!1281994) bm!62734))

(assert (=> b!1281990 m!1175871))

(assert (=> b!1281990 m!1175871))

(declare-fun m!1175883 () Bool)

(assert (=> b!1281990 m!1175883))

(assert (=> b!1281991 m!1175871))

(assert (=> b!1281991 m!1175871))

(assert (=> b!1281991 m!1175873))

(assert (=> bm!62734 m!1175871))

(declare-fun m!1175885 () Bool)

(assert (=> bm!62734 m!1175885))

(assert (=> b!1281992 m!1175871))

(assert (=> b!1281992 m!1175871))

(assert (=> b!1281992 m!1175873))

(assert (=> b!1281907 d!140563))

(declare-fun d!140565 () Bool)

(declare-fun e!732486 () Bool)

(assert (=> d!140565 e!732486))

(declare-fun res!851592 () Bool)

(assert (=> d!140565 (=> res!851592 e!732486)))

(declare-fun lt!576250 () Bool)

(assert (=> d!140565 (= res!851592 (not lt!576250))))

(declare-fun lt!576252 () Bool)

(assert (=> d!140565 (= lt!576250 lt!576252)))

(declare-fun lt!576249 () Unit!42297)

(declare-fun e!732485 () Unit!42297)

(assert (=> d!140565 (= lt!576249 e!732485)))

(declare-fun c!124068 () Bool)

(assert (=> d!140565 (= c!124068 lt!576252)))

(declare-fun containsKey!713 (List!28978 (_ BitVec 64)) Bool)

(assert (=> d!140565 (= lt!576252 (containsKey!713 (toList!9739 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140565 (= (contains!7785 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576250)))

(declare-fun b!1282001 () Bool)

(declare-fun lt!576251 () Unit!42297)

(assert (=> b!1282001 (= e!732485 lt!576251)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!460 (List!28978 (_ BitVec 64)) Unit!42297)

(assert (=> b!1282001 (= lt!576251 (lemmaContainsKeyImpliesGetValueByKeyDefined!460 (toList!9739 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!747 0))(
  ( (Some!746 (v!19562 V!50129)) (None!745) )
))
(declare-fun isDefined!503 (Option!747) Bool)

(declare-fun getValueByKey!696 (List!28978 (_ BitVec 64)) Option!747)

(assert (=> b!1282001 (isDefined!503 (getValueByKey!696 (toList!9739 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1282002 () Bool)

(declare-fun Unit!42299 () Unit!42297)

(assert (=> b!1282002 (= e!732485 Unit!42299)))

(declare-fun b!1282003 () Bool)

(assert (=> b!1282003 (= e!732486 (isDefined!503 (getValueByKey!696 (toList!9739 (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140565 c!124068) b!1282001))

(assert (= (and d!140565 (not c!124068)) b!1282002))

(assert (= (and d!140565 (not res!851592)) b!1282003))

(declare-fun m!1175887 () Bool)

(assert (=> d!140565 m!1175887))

(declare-fun m!1175889 () Bool)

(assert (=> b!1282001 m!1175889))

(declare-fun m!1175891 () Bool)

(assert (=> b!1282001 m!1175891))

(assert (=> b!1282001 m!1175891))

(declare-fun m!1175893 () Bool)

(assert (=> b!1282001 m!1175893))

(assert (=> b!1282003 m!1175891))

(assert (=> b!1282003 m!1175891))

(assert (=> b!1282003 m!1175893))

(assert (=> b!1281909 d!140565))

(declare-fun lt!576318 () ListLongMap!19447)

(declare-fun b!1282046 () Bool)

(declare-fun e!732519 () Bool)

(declare-fun apply!1003 (ListLongMap!19447 (_ BitVec 64)) V!50129)

(declare-fun get!20760 (ValueCell!15986 V!50129) V!50129)

(declare-fun dynLambda!3433 (Int (_ BitVec 64)) V!50129)

(assert (=> b!1282046 (= e!732519 (= (apply!1003 lt!576318 (select (arr!40757 _keys!1741) from!2144)) (get!20760 (select (arr!40756 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1282046 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41308 _values!1445)))))

(assert (=> b!1282046 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41309 _keys!1741)))))

(declare-fun b!1282047 () Bool)

(declare-fun e!732525 () Unit!42297)

(declare-fun lt!576317 () Unit!42297)

(assert (=> b!1282047 (= e!732525 lt!576317)))

(declare-fun lt!576298 () ListLongMap!19447)

(declare-fun getCurrentListMapNoExtraKeys!5942 (array!84507 array!84505 (_ BitVec 32) (_ BitVec 32) V!50129 V!50129 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1282047 (= lt!576298 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576313 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576310 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576310 (select (arr!40757 _keys!1741) from!2144))))

(declare-fun lt!576302 () Unit!42297)

(declare-fun addStillContains!1098 (ListLongMap!19447 (_ BitVec 64) V!50129 (_ BitVec 64)) Unit!42297)

(assert (=> b!1282047 (= lt!576302 (addStillContains!1098 lt!576298 lt!576313 zeroValue!1387 lt!576310))))

(declare-fun +!4311 (ListLongMap!19447 tuple2!21790) ListLongMap!19447)

(assert (=> b!1282047 (contains!7785 (+!4311 lt!576298 (tuple2!21791 lt!576313 zeroValue!1387)) lt!576310)))

(declare-fun lt!576303 () Unit!42297)

(assert (=> b!1282047 (= lt!576303 lt!576302)))

(declare-fun lt!576301 () ListLongMap!19447)

(assert (=> b!1282047 (= lt!576301 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576305 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576300 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576300 (select (arr!40757 _keys!1741) from!2144))))

(declare-fun lt!576306 () Unit!42297)

(declare-fun addApplyDifferent!541 (ListLongMap!19447 (_ BitVec 64) V!50129 (_ BitVec 64)) Unit!42297)

(assert (=> b!1282047 (= lt!576306 (addApplyDifferent!541 lt!576301 lt!576305 minValue!1387 lt!576300))))

(assert (=> b!1282047 (= (apply!1003 (+!4311 lt!576301 (tuple2!21791 lt!576305 minValue!1387)) lt!576300) (apply!1003 lt!576301 lt!576300))))

(declare-fun lt!576307 () Unit!42297)

(assert (=> b!1282047 (= lt!576307 lt!576306)))

(declare-fun lt!576312 () ListLongMap!19447)

(assert (=> b!1282047 (= lt!576312 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576299 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576316 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576316 (select (arr!40757 _keys!1741) from!2144))))

(declare-fun lt!576304 () Unit!42297)

(assert (=> b!1282047 (= lt!576304 (addApplyDifferent!541 lt!576312 lt!576299 zeroValue!1387 lt!576316))))

(assert (=> b!1282047 (= (apply!1003 (+!4311 lt!576312 (tuple2!21791 lt!576299 zeroValue!1387)) lt!576316) (apply!1003 lt!576312 lt!576316))))

(declare-fun lt!576309 () Unit!42297)

(assert (=> b!1282047 (= lt!576309 lt!576304)))

(declare-fun lt!576311 () ListLongMap!19447)

(assert (=> b!1282047 (= lt!576311 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576314 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576314 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576308 () (_ BitVec 64))

(assert (=> b!1282047 (= lt!576308 (select (arr!40757 _keys!1741) from!2144))))

(assert (=> b!1282047 (= lt!576317 (addApplyDifferent!541 lt!576311 lt!576314 minValue!1387 lt!576308))))

(assert (=> b!1282047 (= (apply!1003 (+!4311 lt!576311 (tuple2!21791 lt!576314 minValue!1387)) lt!576308) (apply!1003 lt!576311 lt!576308))))

(declare-fun b!1282048 () Bool)

(declare-fun e!732522 () Bool)

(declare-fun e!732517 () Bool)

(assert (=> b!1282048 (= e!732522 e!732517)))

(declare-fun res!851615 () Bool)

(declare-fun call!62753 () Bool)

(assert (=> b!1282048 (= res!851615 call!62753)))

(assert (=> b!1282048 (=> (not res!851615) (not e!732517))))

(declare-fun call!62755 () ListLongMap!19447)

(declare-fun c!124085 () Bool)

(declare-fun c!124083 () Bool)

(declare-fun call!62758 () ListLongMap!19447)

(declare-fun call!62754 () ListLongMap!19447)

(declare-fun bm!62749 () Bool)

(declare-fun call!62757 () ListLongMap!19447)

(assert (=> bm!62749 (= call!62755 (+!4311 (ite c!124085 call!62758 (ite c!124083 call!62757 call!62754)) (ite (or c!124085 c!124083) (tuple2!21791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!62750 () Bool)

(declare-fun call!62756 () ListLongMap!19447)

(assert (=> bm!62750 (= call!62756 call!62755)))

(declare-fun b!1282049 () Bool)

(declare-fun e!732516 () ListLongMap!19447)

(assert (=> b!1282049 (= e!732516 (+!4311 call!62755 (tuple2!21791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1282050 () Bool)

(assert (=> b!1282050 (= e!732517 (= (apply!1003 lt!576318 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!62751 () Bool)

(assert (=> bm!62751 (= call!62754 call!62757)))

(declare-fun bm!62752 () Bool)

(assert (=> bm!62752 (= call!62753 (contains!7785 lt!576318 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1282051 () Bool)

(declare-fun e!732518 () Bool)

(assert (=> b!1282051 (= e!732518 (validKeyInArray!0 (select (arr!40757 _keys!1741) from!2144)))))

(declare-fun bm!62753 () Bool)

(assert (=> bm!62753 (= call!62757 call!62758)))

(declare-fun b!1282052 () Bool)

(declare-fun e!732520 () ListLongMap!19447)

(assert (=> b!1282052 (= e!732520 call!62756)))

(declare-fun b!1282053 () Bool)

(declare-fun e!732521 () ListLongMap!19447)

(assert (=> b!1282053 (= e!732516 e!732521)))

(assert (=> b!1282053 (= c!124083 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!140567 () Bool)

(declare-fun e!732515 () Bool)

(assert (=> d!140567 e!732515))

(declare-fun res!851619 () Bool)

(assert (=> d!140567 (=> (not res!851619) (not e!732515))))

(assert (=> d!140567 (= res!851619 (or (bvsge from!2144 (size!41309 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41309 _keys!1741)))))))

(declare-fun lt!576315 () ListLongMap!19447)

(assert (=> d!140567 (= lt!576318 lt!576315)))

(declare-fun lt!576297 () Unit!42297)

(assert (=> d!140567 (= lt!576297 e!732525)))

(declare-fun c!124081 () Bool)

(assert (=> d!140567 (= c!124081 e!732518)))

(declare-fun res!851616 () Bool)

(assert (=> d!140567 (=> (not res!851616) (not e!732518))))

(assert (=> d!140567 (= res!851616 (bvslt from!2144 (size!41309 _keys!1741)))))

(assert (=> d!140567 (= lt!576315 e!732516)))

(assert (=> d!140567 (= c!124085 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140567 (validMask!0 mask!2175)))

(assert (=> d!140567 (= (getCurrentListMap!4713 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576318)))

(declare-fun b!1282054 () Bool)

(declare-fun e!732514 () Bool)

(assert (=> b!1282054 (= e!732514 e!732519)))

(declare-fun res!851614 () Bool)

(assert (=> b!1282054 (=> (not res!851614) (not e!732519))))

(assert (=> b!1282054 (= res!851614 (contains!7785 lt!576318 (select (arr!40757 _keys!1741) from!2144)))))

(assert (=> b!1282054 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41309 _keys!1741)))))

(declare-fun b!1282055 () Bool)

(assert (=> b!1282055 (= e!732522 (not call!62753))))

(declare-fun b!1282056 () Bool)

(declare-fun c!124082 () Bool)

(assert (=> b!1282056 (= c!124082 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1282056 (= e!732521 e!732520)))

(declare-fun bm!62754 () Bool)

(declare-fun call!62752 () Bool)

(assert (=> bm!62754 (= call!62752 (contains!7785 lt!576318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1282057 () Bool)

(declare-fun e!732523 () Bool)

(assert (=> b!1282057 (= e!732523 (not call!62752))))

(declare-fun b!1282058 () Bool)

(declare-fun e!732513 () Bool)

(assert (=> b!1282058 (= e!732513 (= (apply!1003 lt!576318 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1282059 () Bool)

(declare-fun Unit!42300 () Unit!42297)

(assert (=> b!1282059 (= e!732525 Unit!42300)))

(declare-fun b!1282060 () Bool)

(assert (=> b!1282060 (= e!732523 e!732513)))

(declare-fun res!851618 () Bool)

(assert (=> b!1282060 (= res!851618 call!62752)))

(assert (=> b!1282060 (=> (not res!851618) (not e!732513))))

(declare-fun b!1282061 () Bool)

(assert (=> b!1282061 (= e!732520 call!62754)))

(declare-fun b!1282062 () Bool)

(assert (=> b!1282062 (= e!732515 e!732522)))

(declare-fun c!124084 () Bool)

(assert (=> b!1282062 (= c!124084 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1282063 () Bool)

(declare-fun res!851611 () Bool)

(assert (=> b!1282063 (=> (not res!851611) (not e!732515))))

(assert (=> b!1282063 (= res!851611 e!732523)))

(declare-fun c!124086 () Bool)

(assert (=> b!1282063 (= c!124086 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1282064 () Bool)

(declare-fun e!732524 () Bool)

(assert (=> b!1282064 (= e!732524 (validKeyInArray!0 (select (arr!40757 _keys!1741) from!2144)))))

(declare-fun bm!62755 () Bool)

(assert (=> bm!62755 (= call!62758 (getCurrentListMapNoExtraKeys!5942 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1282065 () Bool)

(assert (=> b!1282065 (= e!732521 call!62756)))

(declare-fun b!1282066 () Bool)

(declare-fun res!851617 () Bool)

(assert (=> b!1282066 (=> (not res!851617) (not e!732515))))

(assert (=> b!1282066 (= res!851617 e!732514)))

(declare-fun res!851613 () Bool)

(assert (=> b!1282066 (=> res!851613 e!732514)))

(assert (=> b!1282066 (= res!851613 (not e!732524))))

(declare-fun res!851612 () Bool)

(assert (=> b!1282066 (=> (not res!851612) (not e!732524))))

(assert (=> b!1282066 (= res!851612 (bvslt from!2144 (size!41309 _keys!1741)))))

(assert (= (and d!140567 c!124085) b!1282049))

(assert (= (and d!140567 (not c!124085)) b!1282053))

(assert (= (and b!1282053 c!124083) b!1282065))

(assert (= (and b!1282053 (not c!124083)) b!1282056))

(assert (= (and b!1282056 c!124082) b!1282052))

(assert (= (and b!1282056 (not c!124082)) b!1282061))

(assert (= (or b!1282052 b!1282061) bm!62751))

(assert (= (or b!1282065 bm!62751) bm!62753))

(assert (= (or b!1282065 b!1282052) bm!62750))

(assert (= (or b!1282049 bm!62753) bm!62755))

(assert (= (or b!1282049 bm!62750) bm!62749))

(assert (= (and d!140567 res!851616) b!1282051))

(assert (= (and d!140567 c!124081) b!1282047))

(assert (= (and d!140567 (not c!124081)) b!1282059))

(assert (= (and d!140567 res!851619) b!1282066))

(assert (= (and b!1282066 res!851612) b!1282064))

(assert (= (and b!1282066 (not res!851613)) b!1282054))

(assert (= (and b!1282054 res!851614) b!1282046))

(assert (= (and b!1282066 res!851617) b!1282063))

(assert (= (and b!1282063 c!124086) b!1282060))

(assert (= (and b!1282063 (not c!124086)) b!1282057))

(assert (= (and b!1282060 res!851618) b!1282058))

(assert (= (or b!1282060 b!1282057) bm!62754))

(assert (= (and b!1282063 res!851611) b!1282062))

(assert (= (and b!1282062 c!124084) b!1282048))

(assert (= (and b!1282062 (not c!124084)) b!1282055))

(assert (= (and b!1282048 res!851615) b!1282050))

(assert (= (or b!1282048 b!1282055) bm!62752))

(declare-fun b_lambda!23093 () Bool)

(assert (=> (not b_lambda!23093) (not b!1282046)))

(declare-fun t!42514 () Bool)

(declare-fun tb!11339 () Bool)

(assert (=> (and start!108602 (= defaultEntry!1448 defaultEntry!1448) t!42514) tb!11339))

(declare-fun result!23683 () Bool)

(assert (=> tb!11339 (= result!23683 tp_is_empty!33769)))

(assert (=> b!1282046 t!42514))

(declare-fun b_and!46181 () Bool)

(assert (= b_and!46175 (and (=> t!42514 result!23683) b_and!46181)))

(declare-fun m!1175895 () Bool)

(assert (=> b!1282047 m!1175895))

(declare-fun m!1175897 () Bool)

(assert (=> b!1282047 m!1175897))

(declare-fun m!1175899 () Bool)

(assert (=> b!1282047 m!1175899))

(assert (=> b!1282047 m!1175895))

(assert (=> b!1282047 m!1175831))

(declare-fun m!1175901 () Bool)

(assert (=> b!1282047 m!1175901))

(assert (=> b!1282047 m!1175901))

(declare-fun m!1175903 () Bool)

(assert (=> b!1282047 m!1175903))

(declare-fun m!1175905 () Bool)

(assert (=> b!1282047 m!1175905))

(declare-fun m!1175907 () Bool)

(assert (=> b!1282047 m!1175907))

(declare-fun m!1175909 () Bool)

(assert (=> b!1282047 m!1175909))

(declare-fun m!1175911 () Bool)

(assert (=> b!1282047 m!1175911))

(declare-fun m!1175913 () Bool)

(assert (=> b!1282047 m!1175913))

(declare-fun m!1175915 () Bool)

(assert (=> b!1282047 m!1175915))

(assert (=> b!1282047 m!1175913))

(declare-fun m!1175917 () Bool)

(assert (=> b!1282047 m!1175917))

(declare-fun m!1175919 () Bool)

(assert (=> b!1282047 m!1175919))

(declare-fun m!1175921 () Bool)

(assert (=> b!1282047 m!1175921))

(declare-fun m!1175923 () Bool)

(assert (=> b!1282047 m!1175923))

(assert (=> b!1282047 m!1175921))

(declare-fun m!1175925 () Bool)

(assert (=> b!1282047 m!1175925))

(assert (=> d!140567 m!1175819))

(declare-fun m!1175927 () Bool)

(assert (=> bm!62749 m!1175927))

(declare-fun m!1175929 () Bool)

(assert (=> b!1282046 m!1175929))

(assert (=> b!1282046 m!1175831))

(declare-fun m!1175931 () Bool)

(assert (=> b!1282046 m!1175931))

(assert (=> b!1282046 m!1175831))

(declare-fun m!1175933 () Bool)

(assert (=> b!1282046 m!1175933))

(assert (=> b!1282046 m!1175929))

(declare-fun m!1175935 () Bool)

(assert (=> b!1282046 m!1175935))

(assert (=> b!1282046 m!1175933))

(assert (=> b!1282054 m!1175831))

(assert (=> b!1282054 m!1175831))

(declare-fun m!1175937 () Bool)

(assert (=> b!1282054 m!1175937))

(assert (=> b!1282064 m!1175831))

(assert (=> b!1282064 m!1175831))

(declare-fun m!1175939 () Bool)

(assert (=> b!1282064 m!1175939))

(declare-fun m!1175941 () Bool)

(assert (=> b!1282050 m!1175941))

(declare-fun m!1175943 () Bool)

(assert (=> b!1282058 m!1175943))

(declare-fun m!1175945 () Bool)

(assert (=> bm!62754 m!1175945))

(declare-fun m!1175947 () Bool)

(assert (=> b!1282049 m!1175947))

(assert (=> bm!62755 m!1175911))

(declare-fun m!1175949 () Bool)

(assert (=> bm!62752 m!1175949))

(assert (=> b!1282051 m!1175831))

(assert (=> b!1282051 m!1175831))

(assert (=> b!1282051 m!1175939))

(assert (=> b!1281909 d!140567))

(declare-fun d!140569 () Bool)

(assert (=> d!140569 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108602 d!140569))

(declare-fun d!140571 () Bool)

(assert (=> d!140571 (= (array_inv!31085 _values!1445) (bvsge (size!41308 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108602 d!140571))

(declare-fun d!140573 () Bool)

(assert (=> d!140573 (= (array_inv!31086 _keys!1741) (bvsge (size!41309 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108602 d!140573))

(declare-fun mapIsEmpty!52217 () Bool)

(declare-fun mapRes!52217 () Bool)

(assert (=> mapIsEmpty!52217 mapRes!52217))

(declare-fun condMapEmpty!52217 () Bool)

(declare-fun mapDefault!52217 () ValueCell!15986)

(assert (=> mapNonEmpty!52208 (= condMapEmpty!52217 (= mapRest!52208 ((as const (Array (_ BitVec 32) ValueCell!15986)) mapDefault!52217)))))

(declare-fun e!732531 () Bool)

(assert (=> mapNonEmpty!52208 (= tp!99500 (and e!732531 mapRes!52217))))

(declare-fun b!1282076 () Bool)

(assert (=> b!1282076 (= e!732531 tp_is_empty!33769)))

(declare-fun b!1282075 () Bool)

(declare-fun e!732530 () Bool)

(assert (=> b!1282075 (= e!732530 tp_is_empty!33769)))

(declare-fun mapNonEmpty!52217 () Bool)

(declare-fun tp!99516 () Bool)

(assert (=> mapNonEmpty!52217 (= mapRes!52217 (and tp!99516 e!732530))))

(declare-fun mapValue!52217 () ValueCell!15986)

(declare-fun mapRest!52217 () (Array (_ BitVec 32) ValueCell!15986))

(declare-fun mapKey!52217 () (_ BitVec 32))

(assert (=> mapNonEmpty!52217 (= mapRest!52208 (store mapRest!52217 mapKey!52217 mapValue!52217))))

(assert (= (and mapNonEmpty!52208 condMapEmpty!52217) mapIsEmpty!52217))

(assert (= (and mapNonEmpty!52208 (not condMapEmpty!52217)) mapNonEmpty!52217))

(assert (= (and mapNonEmpty!52217 ((_ is ValueCellFull!15986) mapValue!52217)) b!1282075))

(assert (= (and mapNonEmpty!52208 ((_ is ValueCellFull!15986) mapDefault!52217)) b!1282076))

(declare-fun m!1175951 () Bool)

(assert (=> mapNonEmpty!52217 m!1175951))

(declare-fun b_lambda!23095 () Bool)

(assert (= b_lambda!23093 (or (and start!108602 b_free!28129) b_lambda!23095)))

(check-sat (not b!1282001) (not b!1282058) (not b!1281990) (not bm!62734) (not b!1282054) (not b!1282047) (not bm!62754) (not bm!62755) (not b!1282051) (not b!1282064) (not b!1282046) (not bm!62731) (not bm!62749) (not b!1282049) (not b!1281977) (not mapNonEmpty!52217) (not b!1281992) (not d!140565) (not b_next!28129) (not b_lambda!23095) (not bm!62752) (not b!1282050) tp_is_empty!33769 b_and!46181 (not b!1281978) (not b!1281991) (not d!140567) (not b!1282003))
(check-sat b_and!46181 (not b_next!28129))
