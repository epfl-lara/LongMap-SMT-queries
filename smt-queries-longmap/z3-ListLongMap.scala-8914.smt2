; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108358 () Bool)

(assert start!108358)

(declare-fun b_free!27847 () Bool)

(declare-fun b_next!27847 () Bool)

(assert (=> start!108358 (= b_free!27847 (not b_next!27847))))

(declare-fun tp!98494 () Bool)

(declare-fun b_and!45905 () Bool)

(assert (=> start!108358 (= tp!98494 b_and!45905)))

(declare-fun b!1278349 () Bool)

(declare-fun res!849145 () Bool)

(declare-fun e!730126 () Bool)

(assert (=> b!1278349 (=> (not res!849145) (not e!730126))))

(declare-datatypes ((array!83915 0))(
  ( (array!83916 (arr!40464 (Array (_ BitVec 32) (_ BitVec 64))) (size!41015 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83915)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83915 (_ BitVec 32)) Bool)

(assert (=> b!1278349 (= res!849145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278350 () Bool)

(declare-fun res!849144 () Bool)

(assert (=> b!1278350 (=> (not res!849144) (not e!730126))))

(assert (=> b!1278350 (= res!849144 (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(declare-fun b!1278351 () Bool)

(declare-fun lt!576050 () Bool)

(assert (=> b!1278351 (= e!730126 (not (or lt!576050 (bvslt (size!41015 _keys!1427) #b01111111111111111111111111111111))))))

(declare-fun e!730128 () Bool)

(assert (=> b!1278351 e!730128))

(declare-fun c!124354 () Bool)

(assert (=> b!1278351 (= c!124354 (not lt!576050))))

(declare-fun k0!1053 () (_ BitVec 64))

(assert (=> b!1278351 (= lt!576050 (or (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49633 0))(
  ( (V!49634 (val!16773 Int)) )
))
(declare-fun minValue!1129 () V!49633)

(declare-datatypes ((ValueCell!15800 0))(
  ( (ValueCellFull!15800 (v!19365 V!49633)) (EmptyCell!15800) )
))
(declare-datatypes ((array!83917 0))(
  ( (array!83918 (arr!40465 (Array (_ BitVec 32) ValueCell!15800)) (size!41016 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83917)

(declare-datatypes ((Unit!42340 0))(
  ( (Unit!42341) )
))
(declare-fun lt!576049 () Unit!42340)

(declare-fun zeroValue!1129 () V!49633)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!633 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 64) (_ BitVec 32) Int) Unit!42340)

(assert (=> b!1278351 (= lt!576049 (lemmaListMapContainsThenArrayContainsFrom!633 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun mapNonEmpty!51626 () Bool)

(declare-fun mapRes!51626 () Bool)

(declare-fun tp!98495 () Bool)

(declare-fun e!730125 () Bool)

(assert (=> mapNonEmpty!51626 (= mapRes!51626 (and tp!98495 e!730125))))

(declare-fun mapRest!51626 () (Array (_ BitVec 32) ValueCell!15800))

(declare-fun mapValue!51626 () ValueCell!15800)

(declare-fun mapKey!51626 () (_ BitVec 32))

(assert (=> mapNonEmpty!51626 (= (arr!40465 _values!1187) (store mapRest!51626 mapKey!51626 mapValue!51626))))

(declare-fun b!1278352 () Bool)

(declare-fun e!730127 () Bool)

(declare-fun e!730124 () Bool)

(assert (=> b!1278352 (= e!730127 (and e!730124 mapRes!51626))))

(declare-fun condMapEmpty!51626 () Bool)

(declare-fun mapDefault!51626 () ValueCell!15800)

(assert (=> b!1278352 (= condMapEmpty!51626 (= (arr!40465 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15800)) mapDefault!51626)))))

(declare-fun b!1278353 () Bool)

(declare-fun res!849148 () Bool)

(assert (=> b!1278353 (=> (not res!849148) (not e!730126))))

(declare-datatypes ((List!28721 0))(
  ( (Nil!28718) (Cons!28717 (h!29935 (_ BitVec 64)) (t!42249 List!28721)) )
))
(declare-fun arrayNoDuplicates!0 (array!83915 (_ BitVec 32) List!28721) Bool)

(assert (=> b!1278353 (= res!849148 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28718))))

(declare-fun mapIsEmpty!51626 () Bool)

(assert (=> mapIsEmpty!51626 mapRes!51626))

(declare-fun b!1278355 () Bool)

(assert (=> b!1278355 (= e!730128 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1278356 () Bool)

(declare-fun tp_is_empty!33397 () Bool)

(assert (=> b!1278356 (= e!730125 tp_is_empty!33397)))

(declare-fun b!1278357 () Bool)

(assert (=> b!1278357 (= e!730124 tp_is_empty!33397)))

(declare-fun b!1278358 () Bool)

(declare-fun arrayContainsKey!0 (array!83915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278358 (= e!730128 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1278359 () Bool)

(declare-fun res!849146 () Bool)

(assert (=> b!1278359 (=> (not res!849146) (not e!730126))))

(declare-datatypes ((tuple2!21532 0))(
  ( (tuple2!21533 (_1!10777 (_ BitVec 64)) (_2!10777 V!49633)) )
))
(declare-datatypes ((List!28722 0))(
  ( (Nil!28719) (Cons!28718 (h!29936 tuple2!21532) (t!42250 List!28722)) )
))
(declare-datatypes ((ListLongMap!19197 0))(
  ( (ListLongMap!19198 (toList!9614 List!28722)) )
))
(declare-fun contains!7738 (ListLongMap!19197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4683 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 32) Int) ListLongMap!19197)

(assert (=> b!1278359 (= res!849146 (contains!7738 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!849147 () Bool)

(assert (=> start!108358 (=> (not res!849147) (not e!730126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108358 (= res!849147 (validMask!0 mask!1805))))

(assert (=> start!108358 e!730126))

(assert (=> start!108358 true))

(assert (=> start!108358 tp!98494))

(assert (=> start!108358 tp_is_empty!33397))

(declare-fun array_inv!30933 (array!83917) Bool)

(assert (=> start!108358 (and (array_inv!30933 _values!1187) e!730127)))

(declare-fun array_inv!30934 (array!83915) Bool)

(assert (=> start!108358 (array_inv!30934 _keys!1427)))

(declare-fun b!1278354 () Bool)

(declare-fun res!849143 () Bool)

(assert (=> b!1278354 (=> (not res!849143) (not e!730126))))

(assert (=> b!1278354 (= res!849143 (and (= (size!41016 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41015 _keys!1427) (size!41016 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108358 res!849147) b!1278354))

(assert (= (and b!1278354 res!849143) b!1278349))

(assert (= (and b!1278349 res!849145) b!1278353))

(assert (= (and b!1278353 res!849148) b!1278359))

(assert (= (and b!1278359 res!849146) b!1278350))

(assert (= (and b!1278350 res!849144) b!1278351))

(assert (= (and b!1278351 c!124354) b!1278358))

(assert (= (and b!1278351 (not c!124354)) b!1278355))

(assert (= (and b!1278352 condMapEmpty!51626) mapIsEmpty!51626))

(assert (= (and b!1278352 (not condMapEmpty!51626)) mapNonEmpty!51626))

(get-info :version)

(assert (= (and mapNonEmpty!51626 ((_ is ValueCellFull!15800) mapValue!51626)) b!1278356))

(assert (= (and b!1278352 ((_ is ValueCellFull!15800) mapDefault!51626)) b!1278357))

(assert (= start!108358 b!1278352))

(declare-fun m!1174389 () Bool)

(assert (=> mapNonEmpty!51626 m!1174389))

(declare-fun m!1174391 () Bool)

(assert (=> b!1278358 m!1174391))

(declare-fun m!1174393 () Bool)

(assert (=> b!1278353 m!1174393))

(declare-fun m!1174395 () Bool)

(assert (=> b!1278351 m!1174395))

(declare-fun m!1174397 () Bool)

(assert (=> start!108358 m!1174397))

(declare-fun m!1174399 () Bool)

(assert (=> start!108358 m!1174399))

(declare-fun m!1174401 () Bool)

(assert (=> start!108358 m!1174401))

(declare-fun m!1174403 () Bool)

(assert (=> b!1278349 m!1174403))

(declare-fun m!1174405 () Bool)

(assert (=> b!1278359 m!1174405))

(assert (=> b!1278359 m!1174405))

(declare-fun m!1174407 () Bool)

(assert (=> b!1278359 m!1174407))

(check-sat (not b!1278351) (not b!1278359) (not mapNonEmpty!51626) b_and!45905 (not b!1278349) (not b!1278353) tp_is_empty!33397 (not b_next!27847) (not start!108358) (not b!1278358))
(check-sat b_and!45905 (not b_next!27847))
(get-model)

(declare-fun d!140895 () Bool)

(declare-fun e!730168 () Bool)

(assert (=> d!140895 e!730168))

(declare-fun c!124363 () Bool)

(assert (=> d!140895 (= c!124363 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!576065 () Unit!42340)

(declare-fun choose!1899 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 64) (_ BitVec 32) Int) Unit!42340)

(assert (=> d!140895 (= lt!576065 (choose!1899 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(assert (=> d!140895 (validMask!0 mask!1805)))

(assert (=> d!140895 (= (lemmaListMapContainsThenArrayContainsFrom!633 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195) lt!576065)))

(declare-fun b!1278430 () Bool)

(assert (=> b!1278430 (= e!730168 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1278431 () Bool)

(assert (=> b!1278431 (= e!730168 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140895 c!124363) b!1278430))

(assert (= (and d!140895 (not c!124363)) b!1278431))

(declare-fun m!1174449 () Bool)

(assert (=> d!140895 m!1174449))

(assert (=> d!140895 m!1174397))

(assert (=> b!1278430 m!1174391))

(assert (=> b!1278351 d!140895))

(declare-fun d!140897 () Bool)

(declare-fun e!730173 () Bool)

(assert (=> d!140897 e!730173))

(declare-fun res!849187 () Bool)

(assert (=> d!140897 (=> res!849187 e!730173)))

(declare-fun lt!576074 () Bool)

(assert (=> d!140897 (= res!849187 (not lt!576074))))

(declare-fun lt!576077 () Bool)

(assert (=> d!140897 (= lt!576074 lt!576077)))

(declare-fun lt!576075 () Unit!42340)

(declare-fun e!730174 () Unit!42340)

(assert (=> d!140897 (= lt!576075 e!730174)))

(declare-fun c!124366 () Bool)

(assert (=> d!140897 (= c!124366 lt!576077)))

(declare-fun containsKey!712 (List!28722 (_ BitVec 64)) Bool)

(assert (=> d!140897 (= lt!576077 (containsKey!712 (toList!9614 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140897 (= (contains!7738 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!576074)))

(declare-fun b!1278438 () Bool)

(declare-fun lt!576076 () Unit!42340)

(assert (=> b!1278438 (= e!730174 lt!576076)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!458 (List!28722 (_ BitVec 64)) Unit!42340)

(assert (=> b!1278438 (= lt!576076 (lemmaContainsKeyImpliesGetValueByKeyDefined!458 (toList!9614 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!737 0))(
  ( (Some!736 (v!19368 V!49633)) (None!735) )
))
(declare-fun isDefined!495 (Option!737) Bool)

(declare-fun getValueByKey!686 (List!28722 (_ BitVec 64)) Option!737)

(assert (=> b!1278438 (isDefined!495 (getValueByKey!686 (toList!9614 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1278439 () Bool)

(declare-fun Unit!42344 () Unit!42340)

(assert (=> b!1278439 (= e!730174 Unit!42344)))

(declare-fun b!1278440 () Bool)

(assert (=> b!1278440 (= e!730173 (isDefined!495 (getValueByKey!686 (toList!9614 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140897 c!124366) b!1278438))

(assert (= (and d!140897 (not c!124366)) b!1278439))

(assert (= (and d!140897 (not res!849187)) b!1278440))

(declare-fun m!1174451 () Bool)

(assert (=> d!140897 m!1174451))

(declare-fun m!1174453 () Bool)

(assert (=> b!1278438 m!1174453))

(declare-fun m!1174455 () Bool)

(assert (=> b!1278438 m!1174455))

(assert (=> b!1278438 m!1174455))

(declare-fun m!1174457 () Bool)

(assert (=> b!1278438 m!1174457))

(assert (=> b!1278440 m!1174455))

(assert (=> b!1278440 m!1174455))

(assert (=> b!1278440 m!1174457))

(assert (=> b!1278359 d!140897))

(declare-fun b!1278483 () Bool)

(declare-fun e!730213 () Bool)

(declare-fun e!730201 () Bool)

(assert (=> b!1278483 (= e!730213 e!730201)))

(declare-fun c!124379 () Bool)

(assert (=> b!1278483 (= c!124379 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1278484 () Bool)

(declare-fun e!730212 () Bool)

(declare-fun lt!576124 () ListLongMap!19197)

(declare-fun apply!1016 (ListLongMap!19197 (_ BitVec 64)) V!49633)

(assert (=> b!1278484 (= e!730212 (= (apply!1016 lt!576124 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun d!140899 () Bool)

(assert (=> d!140899 e!730213))

(declare-fun res!849214 () Bool)

(assert (=> d!140899 (=> (not res!849214) (not e!730213))))

(assert (=> d!140899 (= res!849214 (or (bvsge #b00000000000000000000000000000000 (size!41015 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))))

(declare-fun lt!576130 () ListLongMap!19197)

(assert (=> d!140899 (= lt!576124 lt!576130)))

(declare-fun lt!576135 () Unit!42340)

(declare-fun e!730205 () Unit!42340)

(assert (=> d!140899 (= lt!576135 e!730205)))

(declare-fun c!124383 () Bool)

(declare-fun e!730209 () Bool)

(assert (=> d!140899 (= c!124383 e!730209)))

(declare-fun res!849212 () Bool)

(assert (=> d!140899 (=> (not res!849212) (not e!730209))))

(assert (=> d!140899 (= res!849212 (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(declare-fun e!730206 () ListLongMap!19197)

(assert (=> d!140899 (= lt!576130 e!730206)))

(declare-fun c!124382 () Bool)

(assert (=> d!140899 (= c!124382 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140899 (validMask!0 mask!1805)))

(assert (=> d!140899 (= (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!576124)))

(declare-fun b!1278485 () Bool)

(declare-fun e!730204 () Bool)

(declare-fun call!62731 () Bool)

(assert (=> b!1278485 (= e!730204 (not call!62731))))

(declare-fun b!1278486 () Bool)

(assert (=> b!1278486 (= e!730201 e!730212)))

(declare-fun res!849206 () Bool)

(declare-fun call!62734 () Bool)

(assert (=> b!1278486 (= res!849206 call!62734)))

(assert (=> b!1278486 (=> (not res!849206) (not e!730212))))

(declare-fun b!1278487 () Bool)

(assert (=> b!1278487 (= e!730201 (not call!62734))))

(declare-fun bm!62727 () Bool)

(declare-fun call!62735 () ListLongMap!19197)

(declare-fun getCurrentListMapNoExtraKeys!5948 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 32) Int) ListLongMap!19197)

(assert (=> bm!62727 (= call!62735 (getCurrentListMapNoExtraKeys!5948 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1278488 () Bool)

(declare-fun e!730203 () ListLongMap!19197)

(declare-fun call!62733 () ListLongMap!19197)

(assert (=> b!1278488 (= e!730203 call!62733)))

(declare-fun b!1278489 () Bool)

(declare-fun c!124380 () Bool)

(assert (=> b!1278489 (= c!124380 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!730208 () ListLongMap!19197)

(assert (=> b!1278489 (= e!730203 e!730208)))

(declare-fun b!1278490 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278490 (= e!730209 (validKeyInArray!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1278491 () Bool)

(declare-fun lt!576127 () Unit!42340)

(assert (=> b!1278491 (= e!730205 lt!576127)))

(declare-fun lt!576122 () ListLongMap!19197)

(assert (=> b!1278491 (= lt!576122 (getCurrentListMapNoExtraKeys!5948 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576126 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576123 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576123 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576128 () Unit!42340)

(declare-fun addStillContains!1103 (ListLongMap!19197 (_ BitVec 64) V!49633 (_ BitVec 64)) Unit!42340)

(assert (=> b!1278491 (= lt!576128 (addStillContains!1103 lt!576122 lt!576126 zeroValue!1129 lt!576123))))

(declare-fun +!4316 (ListLongMap!19197 tuple2!21532) ListLongMap!19197)

(assert (=> b!1278491 (contains!7738 (+!4316 lt!576122 (tuple2!21533 lt!576126 zeroValue!1129)) lt!576123)))

(declare-fun lt!576139 () Unit!42340)

(assert (=> b!1278491 (= lt!576139 lt!576128)))

(declare-fun lt!576138 () ListLongMap!19197)

(assert (=> b!1278491 (= lt!576138 (getCurrentListMapNoExtraKeys!5948 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576137 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576141 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576141 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576136 () Unit!42340)

(declare-fun addApplyDifferent!545 (ListLongMap!19197 (_ BitVec 64) V!49633 (_ BitVec 64)) Unit!42340)

(assert (=> b!1278491 (= lt!576136 (addApplyDifferent!545 lt!576138 lt!576137 minValue!1129 lt!576141))))

(assert (=> b!1278491 (= (apply!1016 (+!4316 lt!576138 (tuple2!21533 lt!576137 minValue!1129)) lt!576141) (apply!1016 lt!576138 lt!576141))))

(declare-fun lt!576133 () Unit!42340)

(assert (=> b!1278491 (= lt!576133 lt!576136)))

(declare-fun lt!576125 () ListLongMap!19197)

(assert (=> b!1278491 (= lt!576125 (getCurrentListMapNoExtraKeys!5948 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576134 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576131 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576131 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576142 () Unit!42340)

(assert (=> b!1278491 (= lt!576142 (addApplyDifferent!545 lt!576125 lt!576134 zeroValue!1129 lt!576131))))

(assert (=> b!1278491 (= (apply!1016 (+!4316 lt!576125 (tuple2!21533 lt!576134 zeroValue!1129)) lt!576131) (apply!1016 lt!576125 lt!576131))))

(declare-fun lt!576129 () Unit!42340)

(assert (=> b!1278491 (= lt!576129 lt!576142)))

(declare-fun lt!576140 () ListLongMap!19197)

(assert (=> b!1278491 (= lt!576140 (getCurrentListMapNoExtraKeys!5948 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!576132 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576132 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576143 () (_ BitVec 64))

(assert (=> b!1278491 (= lt!576143 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1278491 (= lt!576127 (addApplyDifferent!545 lt!576140 lt!576132 minValue!1129 lt!576143))))

(assert (=> b!1278491 (= (apply!1016 (+!4316 lt!576140 (tuple2!21533 lt!576132 minValue!1129)) lt!576143) (apply!1016 lt!576140 lt!576143))))

(declare-fun b!1278492 () Bool)

(declare-fun e!730211 () Bool)

(assert (=> b!1278492 (= e!730211 (= (apply!1016 lt!576124 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun bm!62728 () Bool)

(assert (=> bm!62728 (= call!62734 (contains!7738 lt!576124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278493 () Bool)

(declare-fun Unit!42345 () Unit!42340)

(assert (=> b!1278493 (= e!730205 Unit!42345)))

(declare-fun bm!62729 () Bool)

(assert (=> bm!62729 (= call!62731 (contains!7738 lt!576124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62730 () Bool)

(declare-fun call!62732 () ListLongMap!19197)

(assert (=> bm!62730 (= call!62733 call!62732)))

(declare-fun bm!62731 () Bool)

(declare-fun call!62730 () ListLongMap!19197)

(declare-fun call!62736 () ListLongMap!19197)

(assert (=> bm!62731 (= call!62730 call!62736)))

(declare-fun b!1278494 () Bool)

(declare-fun res!849211 () Bool)

(assert (=> b!1278494 (=> (not res!849211) (not e!730213))))

(declare-fun e!730207 () Bool)

(assert (=> b!1278494 (= res!849211 e!730207)))

(declare-fun res!849207 () Bool)

(assert (=> b!1278494 (=> res!849207 e!730207)))

(declare-fun e!730202 () Bool)

(assert (=> b!1278494 (= res!849207 (not e!730202))))

(declare-fun res!849213 () Bool)

(assert (=> b!1278494 (=> (not res!849213) (not e!730202))))

(assert (=> b!1278494 (= res!849213 (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(declare-fun b!1278495 () Bool)

(assert (=> b!1278495 (= e!730206 e!730203)))

(declare-fun c!124384 () Bool)

(assert (=> b!1278495 (= c!124384 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1278496 () Bool)

(assert (=> b!1278496 (= e!730208 call!62733)))

(declare-fun bm!62732 () Bool)

(assert (=> bm!62732 (= call!62736 call!62735)))

(declare-fun b!1278497 () Bool)

(declare-fun e!730210 () Bool)

(assert (=> b!1278497 (= e!730207 e!730210)))

(declare-fun res!849209 () Bool)

(assert (=> b!1278497 (=> (not res!849209) (not e!730210))))

(assert (=> b!1278497 (= res!849209 (contains!7738 lt!576124 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1278497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(declare-fun b!1278498 () Bool)

(declare-fun res!849210 () Bool)

(assert (=> b!1278498 (=> (not res!849210) (not e!730213))))

(assert (=> b!1278498 (= res!849210 e!730204)))

(declare-fun c!124381 () Bool)

(assert (=> b!1278498 (= c!124381 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1278499 () Bool)

(declare-fun get!20683 (ValueCell!15800 V!49633) V!49633)

(declare-fun dynLambda!3468 (Int (_ BitVec 64)) V!49633)

(assert (=> b!1278499 (= e!730210 (= (apply!1016 lt!576124 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)) (get!20683 (select (arr!40465 _values!1187) #b00000000000000000000000000000000) (dynLambda!3468 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1278499 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41016 _values!1187)))))

(assert (=> b!1278499 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(declare-fun b!1278500 () Bool)

(assert (=> b!1278500 (= e!730206 (+!4316 call!62732 (tuple2!21533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun b!1278501 () Bool)

(assert (=> b!1278501 (= e!730202 (validKeyInArray!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1278502 () Bool)

(assert (=> b!1278502 (= e!730208 call!62730)))

(declare-fun bm!62733 () Bool)

(assert (=> bm!62733 (= call!62732 (+!4316 (ite c!124382 call!62735 (ite c!124384 call!62736 call!62730)) (ite (or c!124382 c!124384) (tuple2!21533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1278503 () Bool)

(assert (=> b!1278503 (= e!730204 e!730211)))

(declare-fun res!849208 () Bool)

(assert (=> b!1278503 (= res!849208 call!62731)))

(assert (=> b!1278503 (=> (not res!849208) (not e!730211))))

(assert (= (and d!140899 c!124382) b!1278500))

(assert (= (and d!140899 (not c!124382)) b!1278495))

(assert (= (and b!1278495 c!124384) b!1278488))

(assert (= (and b!1278495 (not c!124384)) b!1278489))

(assert (= (and b!1278489 c!124380) b!1278496))

(assert (= (and b!1278489 (not c!124380)) b!1278502))

(assert (= (or b!1278496 b!1278502) bm!62731))

(assert (= (or b!1278488 bm!62731) bm!62732))

(assert (= (or b!1278488 b!1278496) bm!62730))

(assert (= (or b!1278500 bm!62732) bm!62727))

(assert (= (or b!1278500 bm!62730) bm!62733))

(assert (= (and d!140899 res!849212) b!1278490))

(assert (= (and d!140899 c!124383) b!1278491))

(assert (= (and d!140899 (not c!124383)) b!1278493))

(assert (= (and d!140899 res!849214) b!1278494))

(assert (= (and b!1278494 res!849213) b!1278501))

(assert (= (and b!1278494 (not res!849207)) b!1278497))

(assert (= (and b!1278497 res!849209) b!1278499))

(assert (= (and b!1278494 res!849211) b!1278498))

(assert (= (and b!1278498 c!124381) b!1278503))

(assert (= (and b!1278498 (not c!124381)) b!1278485))

(assert (= (and b!1278503 res!849208) b!1278492))

(assert (= (or b!1278503 b!1278485) bm!62729))

(assert (= (and b!1278498 res!849210) b!1278483))

(assert (= (and b!1278483 c!124379) b!1278486))

(assert (= (and b!1278483 (not c!124379)) b!1278487))

(assert (= (and b!1278486 res!849206) b!1278484))

(assert (= (or b!1278486 b!1278487) bm!62728))

(declare-fun b_lambda!23081 () Bool)

(assert (=> (not b_lambda!23081) (not b!1278499)))

(declare-fun t!42255 () Bool)

(declare-fun tb!11333 () Bool)

(assert (=> (and start!108358 (= defaultEntry!1195 defaultEntry!1195) t!42255) tb!11333))

(declare-fun result!23655 () Bool)

(assert (=> tb!11333 (= result!23655 tp_is_empty!33397)))

(assert (=> b!1278499 t!42255))

(declare-fun b_and!45911 () Bool)

(assert (= b_and!45905 (and (=> t!42255 result!23655) b_and!45911)))

(declare-fun m!1174459 () Bool)

(assert (=> bm!62727 m!1174459))

(declare-fun m!1174461 () Bool)

(assert (=> b!1278497 m!1174461))

(assert (=> b!1278497 m!1174461))

(declare-fun m!1174463 () Bool)

(assert (=> b!1278497 m!1174463))

(assert (=> b!1278501 m!1174461))

(assert (=> b!1278501 m!1174461))

(declare-fun m!1174465 () Bool)

(assert (=> b!1278501 m!1174465))

(declare-fun m!1174467 () Bool)

(assert (=> b!1278484 m!1174467))

(assert (=> b!1278499 m!1174461))

(assert (=> b!1278499 m!1174461))

(declare-fun m!1174469 () Bool)

(assert (=> b!1278499 m!1174469))

(declare-fun m!1174471 () Bool)

(assert (=> b!1278499 m!1174471))

(declare-fun m!1174473 () Bool)

(assert (=> b!1278499 m!1174473))

(assert (=> b!1278499 m!1174473))

(assert (=> b!1278499 m!1174471))

(declare-fun m!1174475 () Bool)

(assert (=> b!1278499 m!1174475))

(assert (=> d!140899 m!1174397))

(declare-fun m!1174477 () Bool)

(assert (=> b!1278492 m!1174477))

(declare-fun m!1174479 () Bool)

(assert (=> bm!62728 m!1174479))

(declare-fun m!1174481 () Bool)

(assert (=> b!1278491 m!1174481))

(assert (=> b!1278491 m!1174461))

(declare-fun m!1174483 () Bool)

(assert (=> b!1278491 m!1174483))

(assert (=> b!1278491 m!1174459))

(declare-fun m!1174485 () Bool)

(assert (=> b!1278491 m!1174485))

(assert (=> b!1278491 m!1174485))

(declare-fun m!1174487 () Bool)

(assert (=> b!1278491 m!1174487))

(declare-fun m!1174489 () Bool)

(assert (=> b!1278491 m!1174489))

(declare-fun m!1174491 () Bool)

(assert (=> b!1278491 m!1174491))

(declare-fun m!1174493 () Bool)

(assert (=> b!1278491 m!1174493))

(declare-fun m!1174495 () Bool)

(assert (=> b!1278491 m!1174495))

(declare-fun m!1174497 () Bool)

(assert (=> b!1278491 m!1174497))

(declare-fun m!1174499 () Bool)

(assert (=> b!1278491 m!1174499))

(assert (=> b!1278491 m!1174481))

(declare-fun m!1174501 () Bool)

(assert (=> b!1278491 m!1174501))

(declare-fun m!1174503 () Bool)

(assert (=> b!1278491 m!1174503))

(assert (=> b!1278491 m!1174499))

(declare-fun m!1174505 () Bool)

(assert (=> b!1278491 m!1174505))

(declare-fun m!1174507 () Bool)

(assert (=> b!1278491 m!1174507))

(assert (=> b!1278491 m!1174495))

(declare-fun m!1174509 () Bool)

(assert (=> b!1278491 m!1174509))

(declare-fun m!1174511 () Bool)

(assert (=> b!1278500 m!1174511))

(assert (=> b!1278490 m!1174461))

(assert (=> b!1278490 m!1174461))

(assert (=> b!1278490 m!1174465))

(declare-fun m!1174513 () Bool)

(assert (=> bm!62733 m!1174513))

(declare-fun m!1174515 () Bool)

(assert (=> bm!62729 m!1174515))

(assert (=> b!1278359 d!140899))

(declare-fun b!1278514 () Bool)

(declare-fun e!730221 () Bool)

(declare-fun call!62739 () Bool)

(assert (=> b!1278514 (= e!730221 call!62739)))

(declare-fun b!1278515 () Bool)

(declare-fun e!730222 () Bool)

(assert (=> b!1278515 (= e!730222 e!730221)))

(declare-fun c!124387 () Bool)

(assert (=> b!1278515 (= c!124387 (validKeyInArray!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140901 () Bool)

(declare-fun res!849219 () Bool)

(assert (=> d!140901 (=> res!849219 e!730222)))

(assert (=> d!140901 (= res!849219 (bvsge #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(assert (=> d!140901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!730222)))

(declare-fun b!1278516 () Bool)

(declare-fun e!730220 () Bool)

(assert (=> b!1278516 (= e!730221 e!730220)))

(declare-fun lt!576151 () (_ BitVec 64))

(assert (=> b!1278516 (= lt!576151 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!576152 () Unit!42340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83915 (_ BitVec 64) (_ BitVec 32)) Unit!42340)

(assert (=> b!1278516 (= lt!576152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!576151 #b00000000000000000000000000000000))))

(assert (=> b!1278516 (arrayContainsKey!0 _keys!1427 lt!576151 #b00000000000000000000000000000000)))

(declare-fun lt!576150 () Unit!42340)

(assert (=> b!1278516 (= lt!576150 lt!576152)))

(declare-fun res!849220 () Bool)

(declare-datatypes ((SeekEntryResult!9962 0))(
  ( (MissingZero!9962 (index!42219 (_ BitVec 32))) (Found!9962 (index!42220 (_ BitVec 32))) (Intermediate!9962 (undefined!10774 Bool) (index!42221 (_ BitVec 32)) (x!113147 (_ BitVec 32))) (Undefined!9962) (MissingVacant!9962 (index!42222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83915 (_ BitVec 32)) SeekEntryResult!9962)

(assert (=> b!1278516 (= res!849220 (= (seekEntryOrOpen!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9962 #b00000000000000000000000000000000)))))

(assert (=> b!1278516 (=> (not res!849220) (not e!730220))))

(declare-fun b!1278517 () Bool)

(assert (=> b!1278517 (= e!730220 call!62739)))

(declare-fun bm!62736 () Bool)

(assert (=> bm!62736 (= call!62739 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(assert (= (and d!140901 (not res!849219)) b!1278515))

(assert (= (and b!1278515 c!124387) b!1278516))

(assert (= (and b!1278515 (not c!124387)) b!1278514))

(assert (= (and b!1278516 res!849220) b!1278517))

(assert (= (or b!1278517 b!1278514) bm!62736))

(assert (=> b!1278515 m!1174461))

(assert (=> b!1278515 m!1174461))

(assert (=> b!1278515 m!1174465))

(assert (=> b!1278516 m!1174461))

(declare-fun m!1174517 () Bool)

(assert (=> b!1278516 m!1174517))

(declare-fun m!1174519 () Bool)

(assert (=> b!1278516 m!1174519))

(assert (=> b!1278516 m!1174461))

(declare-fun m!1174521 () Bool)

(assert (=> b!1278516 m!1174521))

(declare-fun m!1174523 () Bool)

(assert (=> bm!62736 m!1174523))

(assert (=> b!1278349 d!140901))

(declare-fun d!140903 () Bool)

(declare-fun res!849225 () Bool)

(declare-fun e!730227 () Bool)

(assert (=> d!140903 (=> res!849225 e!730227)))

(assert (=> d!140903 (= res!849225 (= (select (arr!40464 _keys!1427) #b00000000000000000000000000000000) k0!1053))))

(assert (=> d!140903 (= (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000) e!730227)))

(declare-fun b!1278522 () Bool)

(declare-fun e!730228 () Bool)

(assert (=> b!1278522 (= e!730227 e!730228)))

(declare-fun res!849226 () Bool)

(assert (=> b!1278522 (=> (not res!849226) (not e!730228))))

(assert (=> b!1278522 (= res!849226 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!41015 _keys!1427)))))

(declare-fun b!1278523 () Bool)

(assert (=> b!1278523 (= e!730228 (arrayContainsKey!0 _keys!1427 k0!1053 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!140903 (not res!849225)) b!1278522))

(assert (= (and b!1278522 res!849226) b!1278523))

(assert (=> d!140903 m!1174461))

(declare-fun m!1174525 () Bool)

(assert (=> b!1278523 m!1174525))

(assert (=> b!1278358 d!140903))

(declare-fun b!1278534 () Bool)

(declare-fun e!730237 () Bool)

(declare-fun call!62742 () Bool)

(assert (=> b!1278534 (= e!730237 call!62742)))

(declare-fun b!1278535 () Bool)

(declare-fun e!730239 () Bool)

(assert (=> b!1278535 (= e!730239 e!730237)))

(declare-fun c!124390 () Bool)

(assert (=> b!1278535 (= c!124390 (validKeyInArray!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun bm!62739 () Bool)

(assert (=> bm!62739 (= call!62742 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124390 (Cons!28717 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000) Nil!28718) Nil!28718)))))

(declare-fun b!1278536 () Bool)

(declare-fun e!730240 () Bool)

(assert (=> b!1278536 (= e!730240 e!730239)))

(declare-fun res!849233 () Bool)

(assert (=> b!1278536 (=> (not res!849233) (not e!730239))))

(declare-fun e!730238 () Bool)

(assert (=> b!1278536 (= res!849233 (not e!730238))))

(declare-fun res!849235 () Bool)

(assert (=> b!1278536 (=> (not res!849235) (not e!730238))))

(assert (=> b!1278536 (= res!849235 (validKeyInArray!0 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140905 () Bool)

(declare-fun res!849234 () Bool)

(assert (=> d!140905 (=> res!849234 e!730240)))

(assert (=> d!140905 (= res!849234 (bvsge #b00000000000000000000000000000000 (size!41015 _keys!1427)))))

(assert (=> d!140905 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28718) e!730240)))

(declare-fun b!1278537 () Bool)

(assert (=> b!1278537 (= e!730237 call!62742)))

(declare-fun b!1278538 () Bool)

(declare-fun contains!7740 (List!28721 (_ BitVec 64)) Bool)

(assert (=> b!1278538 (= e!730238 (contains!7740 Nil!28718 (select (arr!40464 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140905 (not res!849234)) b!1278536))

(assert (= (and b!1278536 res!849235) b!1278538))

(assert (= (and b!1278536 res!849233) b!1278535))

(assert (= (and b!1278535 c!124390) b!1278534))

(assert (= (and b!1278535 (not c!124390)) b!1278537))

(assert (= (or b!1278534 b!1278537) bm!62739))

(assert (=> b!1278535 m!1174461))

(assert (=> b!1278535 m!1174461))

(assert (=> b!1278535 m!1174465))

(assert (=> bm!62739 m!1174461))

(declare-fun m!1174527 () Bool)

(assert (=> bm!62739 m!1174527))

(assert (=> b!1278536 m!1174461))

(assert (=> b!1278536 m!1174461))

(assert (=> b!1278536 m!1174465))

(assert (=> b!1278538 m!1174461))

(assert (=> b!1278538 m!1174461))

(declare-fun m!1174529 () Bool)

(assert (=> b!1278538 m!1174529))

(assert (=> b!1278353 d!140905))

(declare-fun d!140907 () Bool)

(assert (=> d!140907 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108358 d!140907))

(declare-fun d!140909 () Bool)

(assert (=> d!140909 (= (array_inv!30933 _values!1187) (bvsge (size!41016 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108358 d!140909))

(declare-fun d!140911 () Bool)

(assert (=> d!140911 (= (array_inv!30934 _keys!1427) (bvsge (size!41015 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108358 d!140911))

(declare-fun b!1278546 () Bool)

(declare-fun e!730246 () Bool)

(assert (=> b!1278546 (= e!730246 tp_is_empty!33397)))

(declare-fun mapNonEmpty!51635 () Bool)

(declare-fun mapRes!51635 () Bool)

(declare-fun tp!98510 () Bool)

(declare-fun e!730245 () Bool)

(assert (=> mapNonEmpty!51635 (= mapRes!51635 (and tp!98510 e!730245))))

(declare-fun mapValue!51635 () ValueCell!15800)

(declare-fun mapRest!51635 () (Array (_ BitVec 32) ValueCell!15800))

(declare-fun mapKey!51635 () (_ BitVec 32))

(assert (=> mapNonEmpty!51635 (= mapRest!51626 (store mapRest!51635 mapKey!51635 mapValue!51635))))

(declare-fun b!1278545 () Bool)

(assert (=> b!1278545 (= e!730245 tp_is_empty!33397)))

(declare-fun mapIsEmpty!51635 () Bool)

(assert (=> mapIsEmpty!51635 mapRes!51635))

(declare-fun condMapEmpty!51635 () Bool)

(declare-fun mapDefault!51635 () ValueCell!15800)

(assert (=> mapNonEmpty!51626 (= condMapEmpty!51635 (= mapRest!51626 ((as const (Array (_ BitVec 32) ValueCell!15800)) mapDefault!51635)))))

(assert (=> mapNonEmpty!51626 (= tp!98495 (and e!730246 mapRes!51635))))

(assert (= (and mapNonEmpty!51626 condMapEmpty!51635) mapIsEmpty!51635))

(assert (= (and mapNonEmpty!51626 (not condMapEmpty!51635)) mapNonEmpty!51635))

(assert (= (and mapNonEmpty!51635 ((_ is ValueCellFull!15800) mapValue!51635)) b!1278545))

(assert (= (and mapNonEmpty!51626 ((_ is ValueCellFull!15800) mapDefault!51635)) b!1278546))

(declare-fun m!1174531 () Bool)

(assert (=> mapNonEmpty!51635 m!1174531))

(declare-fun b_lambda!23083 () Bool)

(assert (= b_lambda!23081 (or (and start!108358 b_free!27847) b_lambda!23083)))

(check-sat (not bm!62733) (not bm!62728) (not b!1278523) (not b!1278490) (not b!1278515) (not b!1278538) (not mapNonEmpty!51635) (not b!1278535) (not b!1278499) tp_is_empty!33397 (not b!1278430) (not b!1278438) (not b_next!27847) (not b!1278484) (not b!1278491) (not b!1278500) (not bm!62736) (not d!140895) (not b_lambda!23083) (not b!1278440) (not b!1278497) (not d!140897) (not b!1278536) (not b!1278492) (not b!1278516) b_and!45911 (not d!140899) (not bm!62727) (not bm!62739) (not b!1278501) (not bm!62729))
(check-sat b_and!45911 (not b_next!27847))
