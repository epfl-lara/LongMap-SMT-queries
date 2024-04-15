; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43538 () Bool)

(assert start!43538)

(declare-fun b_free!12331 () Bool)

(declare-fun b_next!12331 () Bool)

(assert (=> start!43538 (= b_free!12331 (not b_next!12331))))

(declare-fun tp!43275 () Bool)

(declare-fun b_and!21065 () Bool)

(assert (=> start!43538 (= tp!43275 b_and!21065)))

(declare-fun b!482340 () Bool)

(declare-fun res!287550 () Bool)

(declare-fun e!283833 () Bool)

(assert (=> b!482340 (=> (not res!287550) (not e!283833))))

(declare-datatypes ((array!31337 0))(
  ( (array!31338 (arr!15071 (Array (_ BitVec 32) (_ BitVec 64))) (size!15430 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31337)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31337 (_ BitVec 32)) Bool)

(assert (=> b!482340 (= res!287550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482341 () Bool)

(declare-fun e!283832 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482341 (= e!283832 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482342 () Bool)

(declare-fun res!287551 () Bool)

(assert (=> b!482342 (=> (not res!287551) (not e!283833))))

(declare-datatypes ((List!9264 0))(
  ( (Nil!9261) (Cons!9260 (h!10116 (_ BitVec 64)) (t!15469 List!9264)) )
))
(declare-fun arrayNoDuplicates!0 (array!31337 (_ BitVec 32) List!9264) Bool)

(assert (=> b!482342 (= res!287551 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9261))))

(declare-fun b!482343 () Bool)

(declare-fun e!283836 () Bool)

(declare-fun tp_is_empty!13843 () Bool)

(assert (=> b!482343 (= e!283836 tp_is_empty!13843)))

(declare-fun mapIsEmpty!22474 () Bool)

(declare-fun mapRes!22474 () Bool)

(assert (=> mapIsEmpty!22474 mapRes!22474))

(declare-fun b!482344 () Bool)

(declare-fun e!283834 () Bool)

(assert (=> b!482344 (= e!283834 (and e!283836 mapRes!22474))))

(declare-fun condMapEmpty!22474 () Bool)

(declare-datatypes ((V!19529 0))(
  ( (V!19530 (val!6969 Int)) )
))
(declare-datatypes ((ValueCell!6560 0))(
  ( (ValueCellFull!6560 (v!9256 V!19529)) (EmptyCell!6560) )
))
(declare-datatypes ((array!31339 0))(
  ( (array!31340 (arr!15072 (Array (_ BitVec 32) ValueCell!6560)) (size!15431 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31339)

(declare-fun mapDefault!22474 () ValueCell!6560)

(assert (=> b!482344 (= condMapEmpty!22474 (= (arr!15072 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6560)) mapDefault!22474)))))

(declare-fun b!482345 () Bool)

(assert (=> b!482345 (= e!283833 (not (or (not (= (size!15430 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsle #b00000000000000000000000000000000 (size!15430 _keys!1874)))))))

(declare-fun lt!218521 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31337 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482345 (= lt!218521 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!482345 e!283832))

(declare-fun c!57898 () Bool)

(assert (=> b!482345 (= c!57898 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19529)

(declare-datatypes ((Unit!14128 0))(
  ( (Unit!14129) )
))
(declare-fun lt!218520 () Unit!14128)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19529)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!151 (array!31337 array!31339 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 64) Int) Unit!14128)

(assert (=> b!482345 (= lt!218520 (lemmaKeyInListMapIsInArray!151 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482346 () Bool)

(declare-fun e!283835 () Bool)

(assert (=> b!482346 (= e!283835 tp_is_empty!13843)))

(declare-fun b!482347 () Bool)

(declare-fun res!287549 () Bool)

(assert (=> b!482347 (=> (not res!287549) (not e!283833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482347 (= res!287549 (validKeyInArray!0 k0!1332))))

(declare-fun mapNonEmpty!22474 () Bool)

(declare-fun tp!43276 () Bool)

(assert (=> mapNonEmpty!22474 (= mapRes!22474 (and tp!43276 e!283835))))

(declare-fun mapKey!22474 () (_ BitVec 32))

(declare-fun mapRest!22474 () (Array (_ BitVec 32) ValueCell!6560))

(declare-fun mapValue!22474 () ValueCell!6560)

(assert (=> mapNonEmpty!22474 (= (arr!15072 _values!1516) (store mapRest!22474 mapKey!22474 mapValue!22474))))

(declare-fun b!482348 () Bool)

(assert (=> b!482348 (= e!283832 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!287552 () Bool)

(assert (=> start!43538 (=> (not res!287552) (not e!283833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43538 (= res!287552 (validMask!0 mask!2352))))

(assert (=> start!43538 e!283833))

(assert (=> start!43538 true))

(assert (=> start!43538 tp_is_empty!13843))

(declare-fun array_inv!10960 (array!31339) Bool)

(assert (=> start!43538 (and (array_inv!10960 _values!1516) e!283834)))

(assert (=> start!43538 tp!43275))

(declare-fun array_inv!10961 (array!31337) Bool)

(assert (=> start!43538 (array_inv!10961 _keys!1874)))

(declare-fun b!482349 () Bool)

(declare-fun res!287553 () Bool)

(assert (=> b!482349 (=> (not res!287553) (not e!283833))))

(declare-datatypes ((tuple2!9198 0))(
  ( (tuple2!9199 (_1!4610 (_ BitVec 64)) (_2!4610 V!19529)) )
))
(declare-datatypes ((List!9265 0))(
  ( (Nil!9262) (Cons!9261 (h!10117 tuple2!9198) (t!15470 List!9265)) )
))
(declare-datatypes ((ListLongMap!8101 0))(
  ( (ListLongMap!8102 (toList!4066 List!9265)) )
))
(declare-fun contains!2645 (ListLongMap!8101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2319 (array!31337 array!31339 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 32) Int) ListLongMap!8101)

(assert (=> b!482349 (= res!287553 (contains!2645 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482350 () Bool)

(declare-fun res!287554 () Bool)

(assert (=> b!482350 (=> (not res!287554) (not e!283833))))

(assert (=> b!482350 (= res!287554 (and (= (size!15431 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15430 _keys!1874) (size!15431 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43538 res!287552) b!482350))

(assert (= (and b!482350 res!287554) b!482340))

(assert (= (and b!482340 res!287550) b!482342))

(assert (= (and b!482342 res!287551) b!482349))

(assert (= (and b!482349 res!287553) b!482347))

(assert (= (and b!482347 res!287549) b!482345))

(assert (= (and b!482345 c!57898) b!482341))

(assert (= (and b!482345 (not c!57898)) b!482348))

(assert (= (and b!482344 condMapEmpty!22474) mapIsEmpty!22474))

(assert (= (and b!482344 (not condMapEmpty!22474)) mapNonEmpty!22474))

(get-info :version)

(assert (= (and mapNonEmpty!22474 ((_ is ValueCellFull!6560) mapValue!22474)) b!482346))

(assert (= (and b!482344 ((_ is ValueCellFull!6560) mapDefault!22474)) b!482343))

(assert (= start!43538 b!482344))

(declare-fun m!463077 () Bool)

(assert (=> b!482345 m!463077))

(declare-fun m!463079 () Bool)

(assert (=> b!482345 m!463079))

(declare-fun m!463081 () Bool)

(assert (=> b!482342 m!463081))

(declare-fun m!463083 () Bool)

(assert (=> b!482347 m!463083))

(declare-fun m!463085 () Bool)

(assert (=> b!482349 m!463085))

(assert (=> b!482349 m!463085))

(declare-fun m!463087 () Bool)

(assert (=> b!482349 m!463087))

(declare-fun m!463089 () Bool)

(assert (=> mapNonEmpty!22474 m!463089))

(declare-fun m!463091 () Bool)

(assert (=> b!482341 m!463091))

(declare-fun m!463093 () Bool)

(assert (=> b!482340 m!463093))

(declare-fun m!463095 () Bool)

(assert (=> start!43538 m!463095))

(declare-fun m!463097 () Bool)

(assert (=> start!43538 m!463097))

(declare-fun m!463099 () Bool)

(assert (=> start!43538 m!463099))

(check-sat (not b!482349) (not b!482345) (not start!43538) (not b!482341) (not b_next!12331) tp_is_empty!13843 (not mapNonEmpty!22474) (not b!482342) (not b!482347) b_and!21065 (not b!482340))
(check-sat b_and!21065 (not b_next!12331))
(get-model)

(declare-fun bm!30932 () Bool)

(declare-fun call!30935 () Bool)

(assert (=> bm!30932 (= call!30935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!482425 () Bool)

(declare-fun e!283880 () Bool)

(declare-fun e!283881 () Bool)

(assert (=> b!482425 (= e!283880 e!283881)))

(declare-fun lt!218542 () (_ BitVec 64))

(assert (=> b!482425 (= lt!218542 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218540 () Unit!14128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31337 (_ BitVec 64) (_ BitVec 32)) Unit!14128)

(assert (=> b!482425 (= lt!218540 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218542 #b00000000000000000000000000000000))))

(assert (=> b!482425 (arrayContainsKey!0 _keys!1874 lt!218542 #b00000000000000000000000000000000)))

(declare-fun lt!218541 () Unit!14128)

(assert (=> b!482425 (= lt!218541 lt!218540)))

(declare-fun res!287596 () Bool)

(declare-datatypes ((SeekEntryResult!3567 0))(
  ( (MissingZero!3567 (index!16447 (_ BitVec 32))) (Found!3567 (index!16448 (_ BitVec 32))) (Intermediate!3567 (undefined!4379 Bool) (index!16449 (_ BitVec 32)) (x!45332 (_ BitVec 32))) (Undefined!3567) (MissingVacant!3567 (index!16450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31337 (_ BitVec 32)) SeekEntryResult!3567)

(assert (=> b!482425 (= res!287596 (= (seekEntryOrOpen!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3567 #b00000000000000000000000000000000)))))

(assert (=> b!482425 (=> (not res!287596) (not e!283881))))

(declare-fun b!482426 () Bool)

(declare-fun e!283879 () Bool)

(assert (=> b!482426 (= e!283879 e!283880)))

(declare-fun c!57907 () Bool)

(assert (=> b!482426 (= c!57907 (validKeyInArray!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482427 () Bool)

(assert (=> b!482427 (= e!283880 call!30935)))

(declare-fun d!76625 () Bool)

(declare-fun res!287595 () Bool)

(assert (=> d!76625 (=> res!287595 e!283879)))

(assert (=> d!76625 (= res!287595 (bvsge #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(assert (=> d!76625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!283879)))

(declare-fun b!482428 () Bool)

(assert (=> b!482428 (= e!283881 call!30935)))

(assert (= (and d!76625 (not res!287595)) b!482426))

(assert (= (and b!482426 c!57907) b!482425))

(assert (= (and b!482426 (not c!57907)) b!482427))

(assert (= (and b!482425 res!287596) b!482428))

(assert (= (or b!482428 b!482427) bm!30932))

(declare-fun m!463149 () Bool)

(assert (=> bm!30932 m!463149))

(declare-fun m!463151 () Bool)

(assert (=> b!482425 m!463151))

(declare-fun m!463153 () Bool)

(assert (=> b!482425 m!463153))

(declare-fun m!463155 () Bool)

(assert (=> b!482425 m!463155))

(assert (=> b!482425 m!463151))

(declare-fun m!463157 () Bool)

(assert (=> b!482425 m!463157))

(assert (=> b!482426 m!463151))

(assert (=> b!482426 m!463151))

(declare-fun m!463159 () Bool)

(assert (=> b!482426 m!463159))

(assert (=> b!482340 d!76625))

(declare-fun d!76627 () Bool)

(declare-fun e!283887 () Bool)

(assert (=> d!76627 e!283887))

(declare-fun res!287599 () Bool)

(assert (=> d!76627 (=> res!287599 e!283887)))

(declare-fun lt!218553 () Bool)

(assert (=> d!76627 (= res!287599 (not lt!218553))))

(declare-fun lt!218552 () Bool)

(assert (=> d!76627 (= lt!218553 lt!218552)))

(declare-fun lt!218551 () Unit!14128)

(declare-fun e!283886 () Unit!14128)

(assert (=> d!76627 (= lt!218551 e!283886)))

(declare-fun c!57910 () Bool)

(assert (=> d!76627 (= c!57910 lt!218552)))

(declare-fun containsKey!356 (List!9265 (_ BitVec 64)) Bool)

(assert (=> d!76627 (= lt!218552 (containsKey!356 (toList!4066 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76627 (= (contains!2645 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218553)))

(declare-fun b!482435 () Bool)

(declare-fun lt!218554 () Unit!14128)

(assert (=> b!482435 (= e!283886 lt!218554)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!305 (List!9265 (_ BitVec 64)) Unit!14128)

(assert (=> b!482435 (= lt!218554 (lemmaContainsKeyImpliesGetValueByKeyDefined!305 (toList!4066 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!400 0))(
  ( (Some!399 (v!9259 V!19529)) (None!398) )
))
(declare-fun isDefined!306 (Option!400) Bool)

(declare-fun getValueByKey!394 (List!9265 (_ BitVec 64)) Option!400)

(assert (=> b!482435 (isDefined!306 (getValueByKey!394 (toList!4066 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482436 () Bool)

(declare-fun Unit!14134 () Unit!14128)

(assert (=> b!482436 (= e!283886 Unit!14134)))

(declare-fun b!482437 () Bool)

(assert (=> b!482437 (= e!283887 (isDefined!306 (getValueByKey!394 (toList!4066 (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76627 c!57910) b!482435))

(assert (= (and d!76627 (not c!57910)) b!482436))

(assert (= (and d!76627 (not res!287599)) b!482437))

(declare-fun m!463161 () Bool)

(assert (=> d!76627 m!463161))

(declare-fun m!463163 () Bool)

(assert (=> b!482435 m!463163))

(declare-fun m!463165 () Bool)

(assert (=> b!482435 m!463165))

(assert (=> b!482435 m!463165))

(declare-fun m!463167 () Bool)

(assert (=> b!482435 m!463167))

(assert (=> b!482437 m!463165))

(assert (=> b!482437 m!463165))

(assert (=> b!482437 m!463167))

(assert (=> b!482349 d!76627))

(declare-fun b!482480 () Bool)

(declare-fun e!283919 () Bool)

(declare-fun e!283922 () Bool)

(assert (=> b!482480 (= e!283919 e!283922)))

(declare-fun res!287621 () Bool)

(declare-fun call!30955 () Bool)

(assert (=> b!482480 (= res!287621 call!30955)))

(assert (=> b!482480 (=> (not res!287621) (not e!283922))))

(declare-fun b!482481 () Bool)

(declare-fun e!283918 () Bool)

(declare-fun lt!218620 () ListLongMap!8101)

(declare-fun apply!343 (ListLongMap!8101 (_ BitVec 64)) V!19529)

(assert (=> b!482481 (= e!283918 (= (apply!343 lt!218620 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!30947 () Bool)

(declare-fun call!30950 () ListLongMap!8101)

(declare-fun getCurrentListMapNoExtraKeys!2147 (array!31337 array!31339 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 32) Int) ListLongMap!8101)

(assert (=> bm!30947 (= call!30950 (getCurrentListMapNoExtraKeys!2147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482482 () Bool)

(assert (=> b!482482 (= e!283922 (= (apply!343 lt!218620 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!482483 () Bool)

(declare-fun e!283923 () Unit!14128)

(declare-fun Unit!14135 () Unit!14128)

(assert (=> b!482483 (= e!283923 Unit!14135)))

(declare-fun b!482484 () Bool)

(declare-fun lt!218607 () Unit!14128)

(assert (=> b!482484 (= e!283923 lt!218607)))

(declare-fun lt!218605 () ListLongMap!8101)

(assert (=> b!482484 (= lt!218605 (getCurrentListMapNoExtraKeys!2147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218600 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218610 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218610 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218612 () Unit!14128)

(declare-fun addStillContains!301 (ListLongMap!8101 (_ BitVec 64) V!19529 (_ BitVec 64)) Unit!14128)

(assert (=> b!482484 (= lt!218612 (addStillContains!301 lt!218605 lt!218600 zeroValue!1458 lt!218610))))

(declare-fun +!1811 (ListLongMap!8101 tuple2!9198) ListLongMap!8101)

(assert (=> b!482484 (contains!2645 (+!1811 lt!218605 (tuple2!9199 lt!218600 zeroValue!1458)) lt!218610)))

(declare-fun lt!218609 () Unit!14128)

(assert (=> b!482484 (= lt!218609 lt!218612)))

(declare-fun lt!218601 () ListLongMap!8101)

(assert (=> b!482484 (= lt!218601 (getCurrentListMapNoExtraKeys!2147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218613 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218613 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218618 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218618 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218617 () Unit!14128)

(declare-fun addApplyDifferent!301 (ListLongMap!8101 (_ BitVec 64) V!19529 (_ BitVec 64)) Unit!14128)

(assert (=> b!482484 (= lt!218617 (addApplyDifferent!301 lt!218601 lt!218613 minValue!1458 lt!218618))))

(assert (=> b!482484 (= (apply!343 (+!1811 lt!218601 (tuple2!9199 lt!218613 minValue!1458)) lt!218618) (apply!343 lt!218601 lt!218618))))

(declare-fun lt!218602 () Unit!14128)

(assert (=> b!482484 (= lt!218602 lt!218617)))

(declare-fun lt!218603 () ListLongMap!8101)

(assert (=> b!482484 (= lt!218603 (getCurrentListMapNoExtraKeys!2147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218619 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218604 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218604 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218606 () Unit!14128)

(assert (=> b!482484 (= lt!218606 (addApplyDifferent!301 lt!218603 lt!218619 zeroValue!1458 lt!218604))))

(assert (=> b!482484 (= (apply!343 (+!1811 lt!218603 (tuple2!9199 lt!218619 zeroValue!1458)) lt!218604) (apply!343 lt!218603 lt!218604))))

(declare-fun lt!218599 () Unit!14128)

(assert (=> b!482484 (= lt!218599 lt!218606)))

(declare-fun lt!218611 () ListLongMap!8101)

(assert (=> b!482484 (= lt!218611 (getCurrentListMapNoExtraKeys!2147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218608 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218615 () (_ BitVec 64))

(assert (=> b!482484 (= lt!218615 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482484 (= lt!218607 (addApplyDifferent!301 lt!218611 lt!218608 minValue!1458 lt!218615))))

(assert (=> b!482484 (= (apply!343 (+!1811 lt!218611 (tuple2!9199 lt!218608 minValue!1458)) lt!218615) (apply!343 lt!218611 lt!218615))))

(declare-fun bm!30948 () Bool)

(declare-fun call!30956 () ListLongMap!8101)

(assert (=> bm!30948 (= call!30956 call!30950)))

(declare-fun b!482485 () Bool)

(declare-fun e!283920 () Bool)

(declare-fun e!283916 () Bool)

(assert (=> b!482485 (= e!283920 e!283916)))

(declare-fun c!57926 () Bool)

(assert (=> b!482485 (= c!57926 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30949 () Bool)

(declare-fun call!30952 () ListLongMap!8101)

(declare-fun call!30953 () ListLongMap!8101)

(assert (=> bm!30949 (= call!30952 call!30953)))

(declare-fun bm!30950 () Bool)

(declare-fun c!57925 () Bool)

(declare-fun c!57928 () Bool)

(declare-fun call!30954 () ListLongMap!8101)

(assert (=> bm!30950 (= call!30953 (+!1811 (ite c!57925 call!30950 (ite c!57928 call!30956 call!30954)) (ite (or c!57925 c!57928) (tuple2!9199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!482487 () Bool)

(declare-fun res!287622 () Bool)

(assert (=> b!482487 (=> (not res!287622) (not e!283920))))

(declare-fun e!283914 () Bool)

(assert (=> b!482487 (= res!287622 e!283914)))

(declare-fun res!287618 () Bool)

(assert (=> b!482487 (=> res!287618 e!283914)))

(declare-fun e!283926 () Bool)

(assert (=> b!482487 (= res!287618 (not e!283926))))

(declare-fun res!287625 () Bool)

(assert (=> b!482487 (=> (not res!287625) (not e!283926))))

(assert (=> b!482487 (= res!287625 (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(declare-fun bm!30951 () Bool)

(assert (=> bm!30951 (= call!30955 (contains!2645 lt!218620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30952 () Bool)

(declare-fun call!30951 () Bool)

(assert (=> bm!30952 (= call!30951 (contains!2645 lt!218620 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482488 () Bool)

(declare-fun e!283925 () Bool)

(assert (=> b!482488 (= e!283914 e!283925)))

(declare-fun res!287626 () Bool)

(assert (=> b!482488 (=> (not res!287626) (not e!283925))))

(assert (=> b!482488 (= res!287626 (contains!2645 lt!218620 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(declare-fun b!482489 () Bool)

(assert (=> b!482489 (= e!283916 (not call!30951))))

(declare-fun b!482490 () Bool)

(assert (=> b!482490 (= e!283926 (validKeyInArray!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482491 () Bool)

(declare-fun e!283921 () Bool)

(assert (=> b!482491 (= e!283921 (validKeyInArray!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482492 () Bool)

(declare-fun get!7302 (ValueCell!6560 V!19529) V!19529)

(declare-fun dynLambda!957 (Int (_ BitVec 64)) V!19529)

(assert (=> b!482492 (= e!283925 (= (apply!343 lt!218620 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)) (get!7302 (select (arr!15072 _values!1516) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15431 _values!1516)))))

(assert (=> b!482492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(declare-fun bm!30953 () Bool)

(assert (=> bm!30953 (= call!30954 call!30956)))

(declare-fun b!482493 () Bool)

(assert (=> b!482493 (= e!283916 e!283918)))

(declare-fun res!287619 () Bool)

(assert (=> b!482493 (= res!287619 call!30951)))

(assert (=> b!482493 (=> (not res!287619) (not e!283918))))

(declare-fun b!482494 () Bool)

(declare-fun res!287624 () Bool)

(assert (=> b!482494 (=> (not res!287624) (not e!283920))))

(assert (=> b!482494 (= res!287624 e!283919)))

(declare-fun c!57923 () Bool)

(assert (=> b!482494 (= c!57923 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482495 () Bool)

(declare-fun e!283917 () ListLongMap!8101)

(declare-fun e!283924 () ListLongMap!8101)

(assert (=> b!482495 (= e!283917 e!283924)))

(assert (=> b!482495 (= c!57928 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482496 () Bool)

(assert (=> b!482496 (= e!283917 (+!1811 call!30953 (tuple2!9199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!482497 () Bool)

(assert (=> b!482497 (= e!283924 call!30952)))

(declare-fun b!482498 () Bool)

(declare-fun c!57924 () Bool)

(assert (=> b!482498 (= c!57924 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!283915 () ListLongMap!8101)

(assert (=> b!482498 (= e!283924 e!283915)))

(declare-fun b!482499 () Bool)

(assert (=> b!482499 (= e!283919 (not call!30955))))

(declare-fun b!482500 () Bool)

(assert (=> b!482500 (= e!283915 call!30954)))

(declare-fun d!76629 () Bool)

(assert (=> d!76629 e!283920))

(declare-fun res!287623 () Bool)

(assert (=> d!76629 (=> (not res!287623) (not e!283920))))

(assert (=> d!76629 (= res!287623 (or (bvsge #b00000000000000000000000000000000 (size!15430 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)))))))

(declare-fun lt!218616 () ListLongMap!8101)

(assert (=> d!76629 (= lt!218620 lt!218616)))

(declare-fun lt!218614 () Unit!14128)

(assert (=> d!76629 (= lt!218614 e!283923)))

(declare-fun c!57927 () Bool)

(assert (=> d!76629 (= c!57927 e!283921)))

(declare-fun res!287620 () Bool)

(assert (=> d!76629 (=> (not res!287620) (not e!283921))))

(assert (=> d!76629 (= res!287620 (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(assert (=> d!76629 (= lt!218616 e!283917)))

(assert (=> d!76629 (= c!57925 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76629 (validMask!0 mask!2352)))

(assert (=> d!76629 (= (getCurrentListMap!2319 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218620)))

(declare-fun b!482486 () Bool)

(assert (=> b!482486 (= e!283915 call!30952)))

(assert (= (and d!76629 c!57925) b!482496))

(assert (= (and d!76629 (not c!57925)) b!482495))

(assert (= (and b!482495 c!57928) b!482497))

(assert (= (and b!482495 (not c!57928)) b!482498))

(assert (= (and b!482498 c!57924) b!482486))

(assert (= (and b!482498 (not c!57924)) b!482500))

(assert (= (or b!482486 b!482500) bm!30953))

(assert (= (or b!482497 bm!30953) bm!30948))

(assert (= (or b!482497 b!482486) bm!30949))

(assert (= (or b!482496 bm!30948) bm!30947))

(assert (= (or b!482496 bm!30949) bm!30950))

(assert (= (and d!76629 res!287620) b!482491))

(assert (= (and d!76629 c!57927) b!482484))

(assert (= (and d!76629 (not c!57927)) b!482483))

(assert (= (and d!76629 res!287623) b!482487))

(assert (= (and b!482487 res!287625) b!482490))

(assert (= (and b!482487 (not res!287618)) b!482488))

(assert (= (and b!482488 res!287626) b!482492))

(assert (= (and b!482487 res!287622) b!482494))

(assert (= (and b!482494 c!57923) b!482480))

(assert (= (and b!482494 (not c!57923)) b!482499))

(assert (= (and b!482480 res!287621) b!482482))

(assert (= (or b!482480 b!482499) bm!30951))

(assert (= (and b!482494 res!287624) b!482485))

(assert (= (and b!482485 c!57926) b!482493))

(assert (= (and b!482485 (not c!57926)) b!482489))

(assert (= (and b!482493 res!287619) b!482481))

(assert (= (or b!482493 b!482489) bm!30952))

(declare-fun b_lambda!10789 () Bool)

(assert (=> (not b_lambda!10789) (not b!482492)))

(declare-fun t!15473 () Bool)

(declare-fun tb!4159 () Bool)

(assert (=> (and start!43538 (= defaultEntry!1519 defaultEntry!1519) t!15473) tb!4159))

(declare-fun result!7761 () Bool)

(assert (=> tb!4159 (= result!7761 tp_is_empty!13843)))

(assert (=> b!482492 t!15473))

(declare-fun b_and!21071 () Bool)

(assert (= b_and!21065 (and (=> t!15473 result!7761) b_and!21071)))

(declare-fun m!463169 () Bool)

(assert (=> b!482481 m!463169))

(declare-fun m!463171 () Bool)

(assert (=> b!482496 m!463171))

(assert (=> d!76629 m!463095))

(assert (=> b!482488 m!463151))

(assert (=> b!482488 m!463151))

(declare-fun m!463173 () Bool)

(assert (=> b!482488 m!463173))

(assert (=> b!482490 m!463151))

(assert (=> b!482490 m!463151))

(assert (=> b!482490 m!463159))

(declare-fun m!463175 () Bool)

(assert (=> bm!30947 m!463175))

(declare-fun m!463177 () Bool)

(assert (=> b!482492 m!463177))

(declare-fun m!463179 () Bool)

(assert (=> b!482492 m!463179))

(assert (=> b!482492 m!463177))

(declare-fun m!463181 () Bool)

(assert (=> b!482492 m!463181))

(assert (=> b!482492 m!463151))

(declare-fun m!463183 () Bool)

(assert (=> b!482492 m!463183))

(assert (=> b!482492 m!463151))

(assert (=> b!482492 m!463179))

(declare-fun m!463185 () Bool)

(assert (=> bm!30950 m!463185))

(declare-fun m!463187 () Bool)

(assert (=> b!482484 m!463187))

(declare-fun m!463189 () Bool)

(assert (=> b!482484 m!463189))

(declare-fun m!463191 () Bool)

(assert (=> b!482484 m!463191))

(declare-fun m!463193 () Bool)

(assert (=> b!482484 m!463193))

(declare-fun m!463195 () Bool)

(assert (=> b!482484 m!463195))

(assert (=> b!482484 m!463175))

(declare-fun m!463197 () Bool)

(assert (=> b!482484 m!463197))

(declare-fun m!463199 () Bool)

(assert (=> b!482484 m!463199))

(declare-fun m!463201 () Bool)

(assert (=> b!482484 m!463201))

(declare-fun m!463203 () Bool)

(assert (=> b!482484 m!463203))

(declare-fun m!463205 () Bool)

(assert (=> b!482484 m!463205))

(assert (=> b!482484 m!463193))

(declare-fun m!463207 () Bool)

(assert (=> b!482484 m!463207))

(assert (=> b!482484 m!463189))

(declare-fun m!463209 () Bool)

(assert (=> b!482484 m!463209))

(assert (=> b!482484 m!463151))

(assert (=> b!482484 m!463205))

(declare-fun m!463211 () Bool)

(assert (=> b!482484 m!463211))

(declare-fun m!463213 () Bool)

(assert (=> b!482484 m!463213))

(assert (=> b!482484 m!463197))

(declare-fun m!463215 () Bool)

(assert (=> b!482484 m!463215))

(assert (=> b!482491 m!463151))

(assert (=> b!482491 m!463151))

(assert (=> b!482491 m!463159))

(declare-fun m!463217 () Bool)

(assert (=> bm!30951 m!463217))

(declare-fun m!463219 () Bool)

(assert (=> b!482482 m!463219))

(declare-fun m!463221 () Bool)

(assert (=> bm!30952 m!463221))

(assert (=> b!482349 d!76629))

(declare-fun d!76631 () Bool)

(declare-fun lt!218623 () (_ BitVec 32))

(assert (=> d!76631 (and (or (bvslt lt!218623 #b00000000000000000000000000000000) (bvsge lt!218623 (size!15430 _keys!1874)) (and (bvsge lt!218623 #b00000000000000000000000000000000) (bvslt lt!218623 (size!15430 _keys!1874)))) (bvsge lt!218623 #b00000000000000000000000000000000) (bvslt lt!218623 (size!15430 _keys!1874)) (= (select (arr!15071 _keys!1874) lt!218623) k0!1332))))

(declare-fun e!283929 () (_ BitVec 32))

(assert (=> d!76631 (= lt!218623 e!283929)))

(declare-fun c!57931 () Bool)

(assert (=> d!76631 (= c!57931 (= (select (arr!15071 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15430 _keys!1874)) (bvslt (size!15430 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76631 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218623)))

(declare-fun b!482507 () Bool)

(assert (=> b!482507 (= e!283929 #b00000000000000000000000000000000)))

(declare-fun b!482508 () Bool)

(assert (=> b!482508 (= e!283929 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76631 c!57931) b!482507))

(assert (= (and d!76631 (not c!57931)) b!482508))

(declare-fun m!463223 () Bool)

(assert (=> d!76631 m!463223))

(assert (=> d!76631 m!463151))

(declare-fun m!463225 () Bool)

(assert (=> b!482508 m!463225))

(assert (=> b!482345 d!76631))

(declare-fun d!76633 () Bool)

(declare-fun e!283932 () Bool)

(assert (=> d!76633 e!283932))

(declare-fun c!57934 () Bool)

(assert (=> d!76633 (= c!57934 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218626 () Unit!14128)

(declare-fun choose!1386 (array!31337 array!31339 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 64) Int) Unit!14128)

(assert (=> d!76633 (= lt!218626 (choose!1386 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76633 (validMask!0 mask!2352)))

(assert (=> d!76633 (= (lemmaKeyInListMapIsInArray!151 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218626)))

(declare-fun b!482513 () Bool)

(assert (=> b!482513 (= e!283932 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482514 () Bool)

(assert (=> b!482514 (= e!283932 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76633 c!57934) b!482513))

(assert (= (and d!76633 (not c!57934)) b!482514))

(declare-fun m!463227 () Bool)

(assert (=> d!76633 m!463227))

(assert (=> d!76633 m!463095))

(assert (=> b!482513 m!463091))

(assert (=> b!482345 d!76633))

(declare-fun d!76635 () Bool)

(declare-fun res!287631 () Bool)

(declare-fun e!283937 () Bool)

(assert (=> d!76635 (=> res!287631 e!283937)))

(assert (=> d!76635 (= res!287631 (= (select (arr!15071 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76635 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!283937)))

(declare-fun b!482519 () Bool)

(declare-fun e!283938 () Bool)

(assert (=> b!482519 (= e!283937 e!283938)))

(declare-fun res!287632 () Bool)

(assert (=> b!482519 (=> (not res!287632) (not e!283938))))

(assert (=> b!482519 (= res!287632 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15430 _keys!1874)))))

(declare-fun b!482520 () Bool)

(assert (=> b!482520 (= e!283938 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76635 (not res!287631)) b!482519))

(assert (= (and b!482519 res!287632) b!482520))

(assert (=> d!76635 m!463151))

(declare-fun m!463229 () Bool)

(assert (=> b!482520 m!463229))

(assert (=> b!482341 d!76635))

(declare-fun b!482531 () Bool)

(declare-fun e!283948 () Bool)

(declare-fun call!30959 () Bool)

(assert (=> b!482531 (= e!283948 call!30959)))

(declare-fun b!482532 () Bool)

(declare-fun e!283950 () Bool)

(assert (=> b!482532 (= e!283950 e!283948)))

(declare-fun c!57937 () Bool)

(assert (=> b!482532 (= c!57937 (validKeyInArray!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482533 () Bool)

(assert (=> b!482533 (= e!283948 call!30959)))

(declare-fun b!482534 () Bool)

(declare-fun e!283949 () Bool)

(assert (=> b!482534 (= e!283949 e!283950)))

(declare-fun res!287640 () Bool)

(assert (=> b!482534 (=> (not res!287640) (not e!283950))))

(declare-fun e!283947 () Bool)

(assert (=> b!482534 (= res!287640 (not e!283947))))

(declare-fun res!287641 () Bool)

(assert (=> b!482534 (=> (not res!287641) (not e!283947))))

(assert (=> b!482534 (= res!287641 (validKeyInArray!0 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76637 () Bool)

(declare-fun res!287639 () Bool)

(assert (=> d!76637 (=> res!287639 e!283949)))

(assert (=> d!76637 (= res!287639 (bvsge #b00000000000000000000000000000000 (size!15430 _keys!1874)))))

(assert (=> d!76637 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9261) e!283949)))

(declare-fun b!482535 () Bool)

(declare-fun contains!2647 (List!9264 (_ BitVec 64)) Bool)

(assert (=> b!482535 (= e!283947 (contains!2647 Nil!9261 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30956 () Bool)

(assert (=> bm!30956 (= call!30959 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57937 (Cons!9260 (select (arr!15071 _keys!1874) #b00000000000000000000000000000000) Nil!9261) Nil!9261)))))

(assert (= (and d!76637 (not res!287639)) b!482534))

(assert (= (and b!482534 res!287641) b!482535))

(assert (= (and b!482534 res!287640) b!482532))

(assert (= (and b!482532 c!57937) b!482531))

(assert (= (and b!482532 (not c!57937)) b!482533))

(assert (= (or b!482531 b!482533) bm!30956))

(assert (=> b!482532 m!463151))

(assert (=> b!482532 m!463151))

(assert (=> b!482532 m!463159))

(assert (=> b!482534 m!463151))

(assert (=> b!482534 m!463151))

(assert (=> b!482534 m!463159))

(assert (=> b!482535 m!463151))

(assert (=> b!482535 m!463151))

(declare-fun m!463231 () Bool)

(assert (=> b!482535 m!463231))

(assert (=> bm!30956 m!463151))

(declare-fun m!463233 () Bool)

(assert (=> bm!30956 m!463233))

(assert (=> b!482342 d!76637))

(declare-fun d!76639 () Bool)

(assert (=> d!76639 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482347 d!76639))

(declare-fun d!76641 () Bool)

(assert (=> d!76641 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43538 d!76641))

(declare-fun d!76643 () Bool)

(assert (=> d!76643 (= (array_inv!10960 _values!1516) (bvsge (size!15431 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43538 d!76643))

(declare-fun d!76645 () Bool)

(assert (=> d!76645 (= (array_inv!10961 _keys!1874) (bvsge (size!15430 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43538 d!76645))

(declare-fun mapIsEmpty!22483 () Bool)

(declare-fun mapRes!22483 () Bool)

(assert (=> mapIsEmpty!22483 mapRes!22483))

(declare-fun condMapEmpty!22483 () Bool)

(declare-fun mapDefault!22483 () ValueCell!6560)

(assert (=> mapNonEmpty!22474 (= condMapEmpty!22483 (= mapRest!22474 ((as const (Array (_ BitVec 32) ValueCell!6560)) mapDefault!22483)))))

(declare-fun e!283956 () Bool)

(assert (=> mapNonEmpty!22474 (= tp!43276 (and e!283956 mapRes!22483))))

(declare-fun mapNonEmpty!22483 () Bool)

(declare-fun tp!43291 () Bool)

(declare-fun e!283955 () Bool)

(assert (=> mapNonEmpty!22483 (= mapRes!22483 (and tp!43291 e!283955))))

(declare-fun mapValue!22483 () ValueCell!6560)

(declare-fun mapRest!22483 () (Array (_ BitVec 32) ValueCell!6560))

(declare-fun mapKey!22483 () (_ BitVec 32))

(assert (=> mapNonEmpty!22483 (= mapRest!22474 (store mapRest!22483 mapKey!22483 mapValue!22483))))

(declare-fun b!482543 () Bool)

(assert (=> b!482543 (= e!283956 tp_is_empty!13843)))

(declare-fun b!482542 () Bool)

(assert (=> b!482542 (= e!283955 tp_is_empty!13843)))

(assert (= (and mapNonEmpty!22474 condMapEmpty!22483) mapIsEmpty!22483))

(assert (= (and mapNonEmpty!22474 (not condMapEmpty!22483)) mapNonEmpty!22483))

(assert (= (and mapNonEmpty!22483 ((_ is ValueCellFull!6560) mapValue!22483)) b!482542))

(assert (= (and mapNonEmpty!22474 ((_ is ValueCellFull!6560) mapDefault!22483)) b!482543))

(declare-fun m!463235 () Bool)

(assert (=> mapNonEmpty!22483 m!463235))

(declare-fun b_lambda!10791 () Bool)

(assert (= b_lambda!10789 (or (and start!43538 b_free!12331) b_lambda!10791)))

(check-sat b_and!21071 (not b!482496) (not b!482481) (not b!482513) (not b!482534) (not b!482520) (not b!482482) (not b!482425) (not b_next!12331) (not bm!30951) (not b!482437) tp_is_empty!13843 (not bm!30932) (not d!76633) (not b!482426) (not bm!30952) (not b!482508) (not bm!30956) (not bm!30950) (not mapNonEmpty!22483) (not d!76627) (not bm!30947) (not b!482491) (not b!482488) (not b!482492) (not b!482490) (not b!482535) (not b!482532) (not b_lambda!10791) (not b!482435) (not b!482484) (not d!76629))
(check-sat b_and!21071 (not b_next!12331))
