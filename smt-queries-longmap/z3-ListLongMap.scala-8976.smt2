; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108826 () Bool)

(assert start!108826)

(declare-fun b_free!28129 () Bool)

(declare-fun b_next!28129 () Bool)

(assert (=> start!108826 (= b_free!28129 (not b_next!28129))))

(declare-fun tp!99499 () Bool)

(declare-fun b_and!46195 () Bool)

(assert (=> start!108826 (= tp!99499 b_and!46195)))

(declare-fun mapNonEmpty!52208 () Bool)

(declare-fun mapRes!52208 () Bool)

(declare-fun tp!99500 () Bool)

(declare-fun e!733303 () Bool)

(assert (=> mapNonEmpty!52208 (= mapRes!52208 (and tp!99500 e!733303))))

(declare-datatypes ((V!50129 0))(
  ( (V!50130 (val!16959 Int)) )
))
(declare-datatypes ((ValueCell!15986 0))(
  ( (ValueCellFull!15986 (v!19555 V!50129)) (EmptyCell!15986) )
))
(declare-fun mapValue!52208 () ValueCell!15986)

(declare-fun mapKey!52208 () (_ BitVec 32))

(declare-datatypes ((array!84639 0))(
  ( (array!84640 (arr!40818 (Array (_ BitVec 32) ValueCell!15986)) (size!41369 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84639)

(declare-fun mapRest!52208 () (Array (_ BitVec 32) ValueCell!15986))

(assert (=> mapNonEmpty!52208 (= (arr!40818 _values!1445) (store mapRest!52208 mapKey!52208 mapValue!52208))))

(declare-fun b!1283274 () Bool)

(declare-fun e!733301 () Bool)

(declare-fun tp_is_empty!33769 () Bool)

(assert (=> b!1283274 (= e!733301 tp_is_empty!33769)))

(declare-fun b!1283275 () Bool)

(declare-fun res!852085 () Bool)

(declare-fun e!733304 () Bool)

(assert (=> b!1283275 (=> (not res!852085) (not e!733304))))

(declare-fun minValue!1387 () V!50129)

(declare-fun zeroValue!1387 () V!50129)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84641 0))(
  ( (array!84642 (arr!40819 (Array (_ BitVec 32) (_ BitVec 64))) (size!41370 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84641)

(declare-datatypes ((tuple2!21736 0))(
  ( (tuple2!21737 (_1!10879 (_ BitVec 64)) (_2!10879 V!50129)) )
))
(declare-datatypes ((List!28950 0))(
  ( (Nil!28947) (Cons!28946 (h!30164 tuple2!21736) (t!42484 List!28950)) )
))
(declare-datatypes ((ListLongMap!19401 0))(
  ( (ListLongMap!19402 (toList!9716 List!28950)) )
))
(declare-fun contains!7846 (ListLongMap!19401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4785 (array!84641 array!84639 (_ BitVec 32) (_ BitVec 32) V!50129 V!50129 (_ BitVec 32) Int) ListLongMap!19401)

(assert (=> b!1283275 (= res!852085 (contains!7846 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283276 () Bool)

(declare-fun res!852082 () Bool)

(assert (=> b!1283276 (=> (not res!852082) (not e!733304))))

(assert (=> b!1283276 (= res!852082 (and (= (size!41369 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41370 _keys!1741) (size!41369 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283277 () Bool)

(declare-fun res!852084 () Bool)

(assert (=> b!1283277 (=> (not res!852084) (not e!733304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84641 (_ BitVec 32)) Bool)

(assert (=> b!1283277 (= res!852084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52208 () Bool)

(assert (=> mapIsEmpty!52208 mapRes!52208))

(declare-fun b!1283278 () Bool)

(declare-fun res!852080 () Bool)

(assert (=> b!1283278 (=> (not res!852080) (not e!733304))))

(declare-datatypes ((List!28951 0))(
  ( (Nil!28948) (Cons!28947 (h!30165 (_ BitVec 64)) (t!42485 List!28951)) )
))
(declare-fun arrayNoDuplicates!0 (array!84641 (_ BitVec 32) List!28951) Bool)

(assert (=> b!1283278 (= res!852080 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28948))))

(declare-fun res!852081 () Bool)

(assert (=> start!108826 (=> (not res!852081) (not e!733304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108826 (= res!852081 (validMask!0 mask!2175))))

(assert (=> start!108826 e!733304))

(assert (=> start!108826 tp_is_empty!33769))

(assert (=> start!108826 true))

(declare-fun e!733305 () Bool)

(declare-fun array_inv!31181 (array!84639) Bool)

(assert (=> start!108826 (and (array_inv!31181 _values!1445) e!733305)))

(declare-fun array_inv!31182 (array!84641) Bool)

(assert (=> start!108826 (array_inv!31182 _keys!1741)))

(assert (=> start!108826 tp!99499))

(declare-fun b!1283279 () Bool)

(declare-fun res!852083 () Bool)

(assert (=> b!1283279 (=> (not res!852083) (not e!733304))))

(assert (=> b!1283279 (= res!852083 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41370 _keys!1741))))))

(declare-fun b!1283280 () Bool)

(assert (=> b!1283280 (= e!733305 (and e!733301 mapRes!52208))))

(declare-fun condMapEmpty!52208 () Bool)

(declare-fun mapDefault!52208 () ValueCell!15986)

(assert (=> b!1283280 (= condMapEmpty!52208 (= (arr!40818 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15986)) mapDefault!52208)))))

(declare-fun b!1283281 () Bool)

(assert (=> b!1283281 (= e!733303 tp_is_empty!33769)))

(declare-fun b!1283282 () Bool)

(assert (=> b!1283282 (= e!733304 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41370 _keys!1741)) (= (select (arr!40819 _keys!1741) from!2144) k0!1205) (bvsge (size!41370 _keys!1741) #b01111111111111111111111111111111)))))

(assert (= (and start!108826 res!852081) b!1283276))

(assert (= (and b!1283276 res!852082) b!1283277))

(assert (= (and b!1283277 res!852084) b!1283278))

(assert (= (and b!1283278 res!852080) b!1283279))

(assert (= (and b!1283279 res!852083) b!1283275))

(assert (= (and b!1283275 res!852085) b!1283282))

(assert (= (and b!1283280 condMapEmpty!52208) mapIsEmpty!52208))

(assert (= (and b!1283280 (not condMapEmpty!52208)) mapNonEmpty!52208))

(get-info :version)

(assert (= (and mapNonEmpty!52208 ((_ is ValueCellFull!15986) mapValue!52208)) b!1283281))

(assert (= (and b!1283280 ((_ is ValueCellFull!15986) mapDefault!52208)) b!1283274))

(assert (= start!108826 b!1283280))

(declare-fun m!1177929 () Bool)

(assert (=> b!1283282 m!1177929))

(declare-fun m!1177931 () Bool)

(assert (=> mapNonEmpty!52208 m!1177931))

(declare-fun m!1177933 () Bool)

(assert (=> b!1283278 m!1177933))

(declare-fun m!1177935 () Bool)

(assert (=> b!1283277 m!1177935))

(declare-fun m!1177937 () Bool)

(assert (=> start!108826 m!1177937))

(declare-fun m!1177939 () Bool)

(assert (=> start!108826 m!1177939))

(declare-fun m!1177941 () Bool)

(assert (=> start!108826 m!1177941))

(declare-fun m!1177943 () Bool)

(assert (=> b!1283275 m!1177943))

(assert (=> b!1283275 m!1177943))

(declare-fun m!1177945 () Bool)

(assert (=> b!1283275 m!1177945))

(check-sat b_and!46195 (not start!108826) (not mapNonEmpty!52208) (not b!1283278) (not b!1283277) tp_is_empty!33769 (not b!1283275) (not b_next!28129))
(check-sat b_and!46195 (not b_next!28129))
(get-model)

(declare-fun b!1283345 () Bool)

(declare-fun e!733343 () Bool)

(declare-fun e!733342 () Bool)

(assert (=> b!1283345 (= e!733343 e!733342)))

(declare-fun lt!576902 () (_ BitVec 64))

(assert (=> b!1283345 (= lt!576902 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42418 0))(
  ( (Unit!42419) )
))
(declare-fun lt!576900 () Unit!42418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84641 (_ BitVec 64) (_ BitVec 32)) Unit!42418)

(assert (=> b!1283345 (= lt!576900 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576902 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1283345 (arrayContainsKey!0 _keys!1741 lt!576902 #b00000000000000000000000000000000)))

(declare-fun lt!576901 () Unit!42418)

(assert (=> b!1283345 (= lt!576901 lt!576900)))

(declare-fun res!852127 () Bool)

(declare-datatypes ((SeekEntryResult!9969 0))(
  ( (MissingZero!9969 (index!42247 (_ BitVec 32))) (Found!9969 (index!42248 (_ BitVec 32))) (Intermediate!9969 (undefined!10781 Bool) (index!42249 (_ BitVec 32)) (x!113690 (_ BitVec 32))) (Undefined!9969) (MissingVacant!9969 (index!42250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84641 (_ BitVec 32)) SeekEntryResult!9969)

(assert (=> b!1283345 (= res!852127 (= (seekEntryOrOpen!0 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9969 #b00000000000000000000000000000000)))))

(assert (=> b!1283345 (=> (not res!852127) (not e!733342))))

(declare-fun bm!62815 () Bool)

(declare-fun call!62818 () Bool)

(assert (=> bm!62815 (= call!62818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1283346 () Bool)

(assert (=> b!1283346 (= e!733342 call!62818)))

(declare-fun d!141121 () Bool)

(declare-fun res!852126 () Bool)

(declare-fun e!733344 () Bool)

(assert (=> d!141121 (=> res!852126 e!733344)))

(assert (=> d!141121 (= res!852126 (bvsge #b00000000000000000000000000000000 (size!41370 _keys!1741)))))

(assert (=> d!141121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!733344)))

(declare-fun b!1283347 () Bool)

(assert (=> b!1283347 (= e!733343 call!62818)))

(declare-fun b!1283348 () Bool)

(assert (=> b!1283348 (= e!733344 e!733343)))

(declare-fun c!124478 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283348 (= c!124478 (validKeyInArray!0 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141121 (not res!852126)) b!1283348))

(assert (= (and b!1283348 c!124478) b!1283345))

(assert (= (and b!1283348 (not c!124478)) b!1283347))

(assert (= (and b!1283345 res!852127) b!1283346))

(assert (= (or b!1283346 b!1283347) bm!62815))

(declare-fun m!1177983 () Bool)

(assert (=> b!1283345 m!1177983))

(declare-fun m!1177985 () Bool)

(assert (=> b!1283345 m!1177985))

(declare-fun m!1177987 () Bool)

(assert (=> b!1283345 m!1177987))

(assert (=> b!1283345 m!1177983))

(declare-fun m!1177989 () Bool)

(assert (=> b!1283345 m!1177989))

(declare-fun m!1177991 () Bool)

(assert (=> bm!62815 m!1177991))

(assert (=> b!1283348 m!1177983))

(assert (=> b!1283348 m!1177983))

(declare-fun m!1177993 () Bool)

(assert (=> b!1283348 m!1177993))

(assert (=> b!1283277 d!141121))

(declare-fun d!141123 () Bool)

(assert (=> d!141123 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108826 d!141123))

(declare-fun d!141125 () Bool)

(assert (=> d!141125 (= (array_inv!31181 _values!1445) (bvsge (size!41369 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108826 d!141125))

(declare-fun d!141127 () Bool)

(assert (=> d!141127 (= (array_inv!31182 _keys!1741) (bvsge (size!41370 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108826 d!141127))

(declare-fun b!1283359 () Bool)

(declare-fun e!733356 () Bool)

(declare-fun contains!7848 (List!28951 (_ BitVec 64)) Bool)

(assert (=> b!1283359 (= e!733356 (contains!7848 Nil!28948 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1283360 () Bool)

(declare-fun e!733354 () Bool)

(declare-fun call!62821 () Bool)

(assert (=> b!1283360 (= e!733354 call!62821)))

(declare-fun b!1283361 () Bool)

(declare-fun e!733353 () Bool)

(declare-fun e!733355 () Bool)

(assert (=> b!1283361 (= e!733353 e!733355)))

(declare-fun res!852136 () Bool)

(assert (=> b!1283361 (=> (not res!852136) (not e!733355))))

(assert (=> b!1283361 (= res!852136 (not e!733356))))

(declare-fun res!852135 () Bool)

(assert (=> b!1283361 (=> (not res!852135) (not e!733356))))

(assert (=> b!1283361 (= res!852135 (validKeyInArray!0 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1283362 () Bool)

(assert (=> b!1283362 (= e!733354 call!62821)))

(declare-fun b!1283363 () Bool)

(assert (=> b!1283363 (= e!733355 e!733354)))

(declare-fun c!124481 () Bool)

(assert (=> b!1283363 (= c!124481 (validKeyInArray!0 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141129 () Bool)

(declare-fun res!852134 () Bool)

(assert (=> d!141129 (=> res!852134 e!733353)))

(assert (=> d!141129 (= res!852134 (bvsge #b00000000000000000000000000000000 (size!41370 _keys!1741)))))

(assert (=> d!141129 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28948) e!733353)))

(declare-fun bm!62818 () Bool)

(assert (=> bm!62818 (= call!62821 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124481 (Cons!28947 (select (arr!40819 _keys!1741) #b00000000000000000000000000000000) Nil!28948) Nil!28948)))))

(assert (= (and d!141129 (not res!852134)) b!1283361))

(assert (= (and b!1283361 res!852135) b!1283359))

(assert (= (and b!1283361 res!852136) b!1283363))

(assert (= (and b!1283363 c!124481) b!1283362))

(assert (= (and b!1283363 (not c!124481)) b!1283360))

(assert (= (or b!1283362 b!1283360) bm!62818))

(assert (=> b!1283359 m!1177983))

(assert (=> b!1283359 m!1177983))

(declare-fun m!1177995 () Bool)

(assert (=> b!1283359 m!1177995))

(assert (=> b!1283361 m!1177983))

(assert (=> b!1283361 m!1177983))

(assert (=> b!1283361 m!1177993))

(assert (=> b!1283363 m!1177983))

(assert (=> b!1283363 m!1177983))

(assert (=> b!1283363 m!1177993))

(assert (=> bm!62818 m!1177983))

(declare-fun m!1177997 () Bool)

(assert (=> bm!62818 m!1177997))

(assert (=> b!1283278 d!141129))

(declare-fun d!141131 () Bool)

(declare-fun e!733361 () Bool)

(assert (=> d!141131 e!733361))

(declare-fun res!852139 () Bool)

(assert (=> d!141131 (=> res!852139 e!733361)))

(declare-fun lt!576911 () Bool)

(assert (=> d!141131 (= res!852139 (not lt!576911))))

(declare-fun lt!576913 () Bool)

(assert (=> d!141131 (= lt!576911 lt!576913)))

(declare-fun lt!576912 () Unit!42418)

(declare-fun e!733362 () Unit!42418)

(assert (=> d!141131 (= lt!576912 e!733362)))

(declare-fun c!124484 () Bool)

(assert (=> d!141131 (= c!124484 lt!576913)))

(declare-fun containsKey!715 (List!28950 (_ BitVec 64)) Bool)

(assert (=> d!141131 (= lt!576913 (containsKey!715 (toList!9716 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141131 (= (contains!7846 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576911)))

(declare-fun b!1283370 () Bool)

(declare-fun lt!576914 () Unit!42418)

(assert (=> b!1283370 (= e!733362 lt!576914)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!461 (List!28950 (_ BitVec 64)) Unit!42418)

(assert (=> b!1283370 (= lt!576914 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9716 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!740 0))(
  ( (Some!739 (v!19558 V!50129)) (None!738) )
))
(declare-fun isDefined!498 (Option!740) Bool)

(declare-fun getValueByKey!689 (List!28950 (_ BitVec 64)) Option!740)

(assert (=> b!1283370 (isDefined!498 (getValueByKey!689 (toList!9716 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1283371 () Bool)

(declare-fun Unit!42420 () Unit!42418)

(assert (=> b!1283371 (= e!733362 Unit!42420)))

(declare-fun b!1283372 () Bool)

(assert (=> b!1283372 (= e!733361 (isDefined!498 (getValueByKey!689 (toList!9716 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141131 c!124484) b!1283370))

(assert (= (and d!141131 (not c!124484)) b!1283371))

(assert (= (and d!141131 (not res!852139)) b!1283372))

(declare-fun m!1177999 () Bool)

(assert (=> d!141131 m!1177999))

(declare-fun m!1178001 () Bool)

(assert (=> b!1283370 m!1178001))

(declare-fun m!1178003 () Bool)

(assert (=> b!1283370 m!1178003))

(assert (=> b!1283370 m!1178003))

(declare-fun m!1178005 () Bool)

(assert (=> b!1283370 m!1178005))

(assert (=> b!1283372 m!1178003))

(assert (=> b!1283372 m!1178003))

(assert (=> b!1283372 m!1178005))

(assert (=> b!1283275 d!141131))

(declare-fun b!1283415 () Bool)

(declare-fun e!733396 () Bool)

(declare-fun call!62842 () Bool)

(assert (=> b!1283415 (= e!733396 (not call!62842))))

(declare-fun b!1283416 () Bool)

(declare-fun res!852166 () Bool)

(declare-fun e!733398 () Bool)

(assert (=> b!1283416 (=> (not res!852166) (not e!733398))))

(declare-fun e!733389 () Bool)

(assert (=> b!1283416 (= res!852166 e!733389)))

(declare-fun res!852162 () Bool)

(assert (=> b!1283416 (=> res!852162 e!733389)))

(declare-fun e!733400 () Bool)

(assert (=> b!1283416 (= res!852162 (not e!733400))))

(declare-fun res!852164 () Bool)

(assert (=> b!1283416 (=> (not res!852164) (not e!733400))))

(assert (=> b!1283416 (= res!852164 (bvslt from!2144 (size!41370 _keys!1741)))))

(declare-fun b!1283417 () Bool)

(declare-fun e!733393 () Bool)

(declare-fun e!733399 () Bool)

(assert (=> b!1283417 (= e!733393 e!733399)))

(declare-fun res!852161 () Bool)

(declare-fun call!62837 () Bool)

(assert (=> b!1283417 (= res!852161 call!62837)))

(assert (=> b!1283417 (=> (not res!852161) (not e!733399))))

(declare-fun b!1283418 () Bool)

(declare-fun e!733391 () ListLongMap!19401)

(declare-fun call!62838 () ListLongMap!19401)

(assert (=> b!1283418 (= e!733391 call!62838)))

(declare-fun b!1283419 () Bool)

(declare-fun e!733397 () Bool)

(assert (=> b!1283419 (= e!733396 e!733397)))

(declare-fun res!852158 () Bool)

(assert (=> b!1283419 (= res!852158 call!62842)))

(assert (=> b!1283419 (=> (not res!852158) (not e!733397))))

(declare-fun b!1283420 () Bool)

(declare-fun lt!576962 () ListLongMap!19401)

(declare-fun apply!1019 (ListLongMap!19401 (_ BitVec 64)) V!50129)

(assert (=> b!1283420 (= e!733397 (= (apply!1019 lt!576962 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1283421 () Bool)

(declare-fun c!124497 () Bool)

(assert (=> b!1283421 (= c!124497 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!733395 () ListLongMap!19401)

(assert (=> b!1283421 (= e!733395 e!733391)))

(declare-fun bm!62833 () Bool)

(declare-fun call!62841 () ListLongMap!19401)

(assert (=> bm!62833 (= call!62838 call!62841)))

(declare-fun bm!62834 () Bool)

(declare-fun call!62836 () ListLongMap!19401)

(declare-fun call!62839 () ListLongMap!19401)

(assert (=> bm!62834 (= call!62836 call!62839)))

(declare-fun b!1283422 () Bool)

(assert (=> b!1283422 (= e!733393 (not call!62837))))

(declare-fun b!1283423 () Bool)

(declare-fun e!733392 () Unit!42418)

(declare-fun lt!576965 () Unit!42418)

(assert (=> b!1283423 (= e!733392 lt!576965)))

(declare-fun lt!576970 () ListLongMap!19401)

(declare-fun getCurrentListMapNoExtraKeys!5951 (array!84641 array!84639 (_ BitVec 32) (_ BitVec 32) V!50129 V!50129 (_ BitVec 32) Int) ListLongMap!19401)

(assert (=> b!1283423 (= lt!576970 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576972 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576959 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576959 (select (arr!40819 _keys!1741) from!2144))))

(declare-fun lt!576966 () Unit!42418)

(declare-fun addStillContains!1106 (ListLongMap!19401 (_ BitVec 64) V!50129 (_ BitVec 64)) Unit!42418)

(assert (=> b!1283423 (= lt!576966 (addStillContains!1106 lt!576970 lt!576972 zeroValue!1387 lt!576959))))

(declare-fun +!4319 (ListLongMap!19401 tuple2!21736) ListLongMap!19401)

(assert (=> b!1283423 (contains!7846 (+!4319 lt!576970 (tuple2!21737 lt!576972 zeroValue!1387)) lt!576959)))

(declare-fun lt!576969 () Unit!42418)

(assert (=> b!1283423 (= lt!576969 lt!576966)))

(declare-fun lt!576979 () ListLongMap!19401)

(assert (=> b!1283423 (= lt!576979 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576971 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576978 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576978 (select (arr!40819 _keys!1741) from!2144))))

(declare-fun lt!576977 () Unit!42418)

(declare-fun addApplyDifferent!548 (ListLongMap!19401 (_ BitVec 64) V!50129 (_ BitVec 64)) Unit!42418)

(assert (=> b!1283423 (= lt!576977 (addApplyDifferent!548 lt!576979 lt!576971 minValue!1387 lt!576978))))

(assert (=> b!1283423 (= (apply!1019 (+!4319 lt!576979 (tuple2!21737 lt!576971 minValue!1387)) lt!576978) (apply!1019 lt!576979 lt!576978))))

(declare-fun lt!576980 () Unit!42418)

(assert (=> b!1283423 (= lt!576980 lt!576977)))

(declare-fun lt!576976 () ListLongMap!19401)

(assert (=> b!1283423 (= lt!576976 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576974 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576968 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576968 (select (arr!40819 _keys!1741) from!2144))))

(declare-fun lt!576963 () Unit!42418)

(assert (=> b!1283423 (= lt!576963 (addApplyDifferent!548 lt!576976 lt!576974 zeroValue!1387 lt!576968))))

(assert (=> b!1283423 (= (apply!1019 (+!4319 lt!576976 (tuple2!21737 lt!576974 zeroValue!1387)) lt!576968) (apply!1019 lt!576976 lt!576968))))

(declare-fun lt!576973 () Unit!42418)

(assert (=> b!1283423 (= lt!576973 lt!576963)))

(declare-fun lt!576960 () ListLongMap!19401)

(assert (=> b!1283423 (= lt!576960 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576967 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576964 () (_ BitVec 64))

(assert (=> b!1283423 (= lt!576964 (select (arr!40819 _keys!1741) from!2144))))

(assert (=> b!1283423 (= lt!576965 (addApplyDifferent!548 lt!576960 lt!576967 minValue!1387 lt!576964))))

(assert (=> b!1283423 (= (apply!1019 (+!4319 lt!576960 (tuple2!21737 lt!576967 minValue!1387)) lt!576964) (apply!1019 lt!576960 lt!576964))))

(declare-fun b!1283424 () Bool)

(assert (=> b!1283424 (= e!733398 e!733393)))

(declare-fun c!124501 () Bool)

(assert (=> b!1283424 (= c!124501 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141133 () Bool)

(assert (=> d!141133 e!733398))

(declare-fun res!852159 () Bool)

(assert (=> d!141133 (=> (not res!852159) (not e!733398))))

(assert (=> d!141133 (= res!852159 (or (bvsge from!2144 (size!41370 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41370 _keys!1741)))))))

(declare-fun lt!576975 () ListLongMap!19401)

(assert (=> d!141133 (= lt!576962 lt!576975)))

(declare-fun lt!576961 () Unit!42418)

(assert (=> d!141133 (= lt!576961 e!733392)))

(declare-fun c!124498 () Bool)

(declare-fun e!733390 () Bool)

(assert (=> d!141133 (= c!124498 e!733390)))

(declare-fun res!852163 () Bool)

(assert (=> d!141133 (=> (not res!852163) (not e!733390))))

(assert (=> d!141133 (= res!852163 (bvslt from!2144 (size!41370 _keys!1741)))))

(declare-fun e!733401 () ListLongMap!19401)

(assert (=> d!141133 (= lt!576975 e!733401)))

(declare-fun c!124500 () Bool)

(assert (=> d!141133 (= c!124500 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141133 (validMask!0 mask!2175)))

(assert (=> d!141133 (= (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576962)))

(declare-fun b!1283425 () Bool)

(assert (=> b!1283425 (= e!733400 (validKeyInArray!0 (select (arr!40819 _keys!1741) from!2144)))))

(declare-fun b!1283426 () Bool)

(declare-fun e!733394 () Bool)

(assert (=> b!1283426 (= e!733389 e!733394)))

(declare-fun res!852165 () Bool)

(assert (=> b!1283426 (=> (not res!852165) (not e!733394))))

(assert (=> b!1283426 (= res!852165 (contains!7846 lt!576962 (select (arr!40819 _keys!1741) from!2144)))))

(assert (=> b!1283426 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41370 _keys!1741)))))

(declare-fun bm!62835 () Bool)

(declare-fun call!62840 () ListLongMap!19401)

(declare-fun c!124499 () Bool)

(assert (=> bm!62835 (= call!62841 (+!4319 (ite c!124500 call!62839 (ite c!124499 call!62836 call!62840)) (ite (or c!124500 c!124499) (tuple2!21737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1283427 () Bool)

(assert (=> b!1283427 (= e!733395 call!62838)))

(declare-fun b!1283428 () Bool)

(assert (=> b!1283428 (= e!733399 (= (apply!1019 lt!576962 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1283429 () Bool)

(declare-fun Unit!42421 () Unit!42418)

(assert (=> b!1283429 (= e!733392 Unit!42421)))

(declare-fun b!1283430 () Bool)

(assert (=> b!1283430 (= e!733391 call!62840)))

(declare-fun bm!62836 () Bool)

(assert (=> bm!62836 (= call!62842 (contains!7846 lt!576962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1283431 () Bool)

(declare-fun res!852160 () Bool)

(assert (=> b!1283431 (=> (not res!852160) (not e!733398))))

(assert (=> b!1283431 (= res!852160 e!733396)))

(declare-fun c!124502 () Bool)

(assert (=> b!1283431 (= c!124502 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62837 () Bool)

(assert (=> bm!62837 (= call!62837 (contains!7846 lt!576962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62838 () Bool)

(assert (=> bm!62838 (= call!62840 call!62836)))

(declare-fun bm!62839 () Bool)

(assert (=> bm!62839 (= call!62839 (getCurrentListMapNoExtraKeys!5951 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1283432 () Bool)

(declare-fun get!20810 (ValueCell!15986 V!50129) V!50129)

(declare-fun dynLambda!3471 (Int (_ BitVec 64)) V!50129)

(assert (=> b!1283432 (= e!733394 (= (apply!1019 lt!576962 (select (arr!40819 _keys!1741) from!2144)) (get!20810 (select (arr!40818 _values!1445) from!2144) (dynLambda!3471 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1283432 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41369 _values!1445)))))

(assert (=> b!1283432 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41370 _keys!1741)))))

(declare-fun b!1283433 () Bool)

(assert (=> b!1283433 (= e!733390 (validKeyInArray!0 (select (arr!40819 _keys!1741) from!2144)))))

(declare-fun b!1283434 () Bool)

(assert (=> b!1283434 (= e!733401 e!733395)))

(assert (=> b!1283434 (= c!124499 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1283435 () Bool)

(assert (=> b!1283435 (= e!733401 (+!4319 call!62841 (tuple2!21737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141133 c!124500) b!1283435))

(assert (= (and d!141133 (not c!124500)) b!1283434))

(assert (= (and b!1283434 c!124499) b!1283427))

(assert (= (and b!1283434 (not c!124499)) b!1283421))

(assert (= (and b!1283421 c!124497) b!1283418))

(assert (= (and b!1283421 (not c!124497)) b!1283430))

(assert (= (or b!1283418 b!1283430) bm!62838))

(assert (= (or b!1283427 bm!62838) bm!62834))

(assert (= (or b!1283427 b!1283418) bm!62833))

(assert (= (or b!1283435 bm!62834) bm!62839))

(assert (= (or b!1283435 bm!62833) bm!62835))

(assert (= (and d!141133 res!852163) b!1283433))

(assert (= (and d!141133 c!124498) b!1283423))

(assert (= (and d!141133 (not c!124498)) b!1283429))

(assert (= (and d!141133 res!852159) b!1283416))

(assert (= (and b!1283416 res!852164) b!1283425))

(assert (= (and b!1283416 (not res!852162)) b!1283426))

(assert (= (and b!1283426 res!852165) b!1283432))

(assert (= (and b!1283416 res!852166) b!1283431))

(assert (= (and b!1283431 c!124502) b!1283419))

(assert (= (and b!1283431 (not c!124502)) b!1283415))

(assert (= (and b!1283419 res!852158) b!1283420))

(assert (= (or b!1283419 b!1283415) bm!62836))

(assert (= (and b!1283431 res!852160) b!1283424))

(assert (= (and b!1283424 c!124501) b!1283417))

(assert (= (and b!1283424 (not c!124501)) b!1283422))

(assert (= (and b!1283417 res!852161) b!1283428))

(assert (= (or b!1283417 b!1283422) bm!62837))

(declare-fun b_lambda!23097 () Bool)

(assert (=> (not b_lambda!23097) (not b!1283432)))

(declare-fun t!42488 () Bool)

(declare-fun tb!11339 () Bool)

(assert (=> (and start!108826 (= defaultEntry!1448 defaultEntry!1448) t!42488) tb!11339))

(declare-fun result!23683 () Bool)

(assert (=> tb!11339 (= result!23683 tp_is_empty!33769)))

(assert (=> b!1283432 t!42488))

(declare-fun b_and!46201 () Bool)

(assert (= b_and!46195 (and (=> t!42488 result!23683) b_and!46201)))

(declare-fun m!1178007 () Bool)

(assert (=> b!1283432 m!1178007))

(declare-fun m!1178009 () Bool)

(assert (=> b!1283432 m!1178009))

(declare-fun m!1178011 () Bool)

(assert (=> b!1283432 m!1178011))

(assert (=> b!1283432 m!1177929))

(assert (=> b!1283432 m!1177929))

(declare-fun m!1178013 () Bool)

(assert (=> b!1283432 m!1178013))

(assert (=> b!1283432 m!1178007))

(assert (=> b!1283432 m!1178009))

(assert (=> b!1283425 m!1177929))

(assert (=> b!1283425 m!1177929))

(declare-fun m!1178015 () Bool)

(assert (=> b!1283425 m!1178015))

(declare-fun m!1178017 () Bool)

(assert (=> b!1283435 m!1178017))

(assert (=> b!1283433 m!1177929))

(assert (=> b!1283433 m!1177929))

(assert (=> b!1283433 m!1178015))

(declare-fun m!1178019 () Bool)

(assert (=> b!1283423 m!1178019))

(declare-fun m!1178021 () Bool)

(assert (=> b!1283423 m!1178021))

(declare-fun m!1178023 () Bool)

(assert (=> b!1283423 m!1178023))

(declare-fun m!1178025 () Bool)

(assert (=> b!1283423 m!1178025))

(declare-fun m!1178027 () Bool)

(assert (=> b!1283423 m!1178027))

(assert (=> b!1283423 m!1178027))

(declare-fun m!1178029 () Bool)

(assert (=> b!1283423 m!1178029))

(declare-fun m!1178031 () Bool)

(assert (=> b!1283423 m!1178031))

(declare-fun m!1178033 () Bool)

(assert (=> b!1283423 m!1178033))

(declare-fun m!1178035 () Bool)

(assert (=> b!1283423 m!1178035))

(declare-fun m!1178037 () Bool)

(assert (=> b!1283423 m!1178037))

(declare-fun m!1178039 () Bool)

(assert (=> b!1283423 m!1178039))

(declare-fun m!1178041 () Bool)

(assert (=> b!1283423 m!1178041))

(assert (=> b!1283423 m!1178033))

(assert (=> b!1283423 m!1178019))

(declare-fun m!1178043 () Bool)

(assert (=> b!1283423 m!1178043))

(assert (=> b!1283423 m!1178023))

(declare-fun m!1178045 () Bool)

(assert (=> b!1283423 m!1178045))

(assert (=> b!1283423 m!1177929))

(declare-fun m!1178047 () Bool)

(assert (=> b!1283423 m!1178047))

(declare-fun m!1178049 () Bool)

(assert (=> b!1283423 m!1178049))

(declare-fun m!1178051 () Bool)

(assert (=> bm!62837 m!1178051))

(assert (=> bm!62839 m!1178041))

(declare-fun m!1178053 () Bool)

(assert (=> bm!62835 m!1178053))

(declare-fun m!1178055 () Bool)

(assert (=> bm!62836 m!1178055))

(declare-fun m!1178057 () Bool)

(assert (=> b!1283420 m!1178057))

(assert (=> b!1283426 m!1177929))

(assert (=> b!1283426 m!1177929))

(declare-fun m!1178059 () Bool)

(assert (=> b!1283426 m!1178059))

(declare-fun m!1178061 () Bool)

(assert (=> b!1283428 m!1178061))

(assert (=> d!141133 m!1177937))

(assert (=> b!1283275 d!141133))

(declare-fun mapIsEmpty!52217 () Bool)

(declare-fun mapRes!52217 () Bool)

(assert (=> mapIsEmpty!52217 mapRes!52217))

(declare-fun b!1283444 () Bool)

(declare-fun e!733406 () Bool)

(assert (=> b!1283444 (= e!733406 tp_is_empty!33769)))

(declare-fun mapNonEmpty!52217 () Bool)

(declare-fun tp!99515 () Bool)

(assert (=> mapNonEmpty!52217 (= mapRes!52217 (and tp!99515 e!733406))))

(declare-fun mapValue!52217 () ValueCell!15986)

(declare-fun mapRest!52217 () (Array (_ BitVec 32) ValueCell!15986))

(declare-fun mapKey!52217 () (_ BitVec 32))

(assert (=> mapNonEmpty!52217 (= mapRest!52208 (store mapRest!52217 mapKey!52217 mapValue!52217))))

(declare-fun condMapEmpty!52217 () Bool)

(declare-fun mapDefault!52217 () ValueCell!15986)

(assert (=> mapNonEmpty!52208 (= condMapEmpty!52217 (= mapRest!52208 ((as const (Array (_ BitVec 32) ValueCell!15986)) mapDefault!52217)))))

(declare-fun e!733407 () Bool)

(assert (=> mapNonEmpty!52208 (= tp!99500 (and e!733407 mapRes!52217))))

(declare-fun b!1283445 () Bool)

(assert (=> b!1283445 (= e!733407 tp_is_empty!33769)))

(assert (= (and mapNonEmpty!52208 condMapEmpty!52217) mapIsEmpty!52217))

(assert (= (and mapNonEmpty!52208 (not condMapEmpty!52217)) mapNonEmpty!52217))

(assert (= (and mapNonEmpty!52217 ((_ is ValueCellFull!15986) mapValue!52217)) b!1283444))

(assert (= (and mapNonEmpty!52208 ((_ is ValueCellFull!15986) mapDefault!52217)) b!1283445))

(declare-fun m!1178063 () Bool)

(assert (=> mapNonEmpty!52217 m!1178063))

(declare-fun b_lambda!23099 () Bool)

(assert (= b_lambda!23097 (or (and start!108826 b_free!28129) b_lambda!23099)))

(check-sat (not b!1283345) (not b!1283361) (not bm!62839) (not bm!62815) (not d!141131) (not b!1283432) (not b_lambda!23099) (not b!1283420) (not b!1283372) (not b!1283425) (not bm!62837) (not b!1283370) (not b!1283426) (not b!1283435) (not mapNonEmpty!52217) b_and!46201 (not b!1283348) (not bm!62836) (not d!141133) (not b!1283363) (not b!1283433) (not bm!62835) tp_is_empty!33769 (not b!1283423) (not b_next!28129) (not b!1283428) (not b!1283359) (not bm!62818))
(check-sat b_and!46201 (not b_next!28129))
