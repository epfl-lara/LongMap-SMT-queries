; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108134 () Bool)

(assert start!108134)

(declare-fun b_free!27847 () Bool)

(declare-fun b_next!27847 () Bool)

(assert (=> start!108134 (= b_free!27847 (not b_next!27847))))

(declare-fun tp!98495 () Bool)

(declare-fun b_and!45885 () Bool)

(assert (=> start!108134 (= tp!98495 b_and!45885)))

(declare-fun b!1276980 () Bool)

(declare-fun e!729249 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276980 (= e!729249 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!848601 () Bool)

(declare-fun e!729253 () Bool)

(assert (=> start!108134 (=> (not res!848601) (not e!729253))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108134 (= res!848601 (validMask!0 mask!1805))))

(assert (=> start!108134 e!729253))

(assert (=> start!108134 true))

(assert (=> start!108134 tp!98495))

(declare-fun tp_is_empty!33397 () Bool)

(assert (=> start!108134 tp_is_empty!33397))

(declare-datatypes ((V!49633 0))(
  ( (V!49634 (val!16773 Int)) )
))
(declare-datatypes ((ValueCell!15800 0))(
  ( (ValueCellFull!15800 (v!19369 V!49633)) (EmptyCell!15800) )
))
(declare-datatypes ((array!83785 0))(
  ( (array!83786 (arr!40404 (Array (_ BitVec 32) ValueCell!15800)) (size!40956 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83785)

(declare-fun e!729250 () Bool)

(declare-fun array_inv!30861 (array!83785) Bool)

(assert (=> start!108134 (and (array_inv!30861 _values!1187) e!729250)))

(declare-datatypes ((array!83787 0))(
  ( (array!83788 (arr!40405 (Array (_ BitVec 32) (_ BitVec 64))) (size!40957 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83787)

(declare-fun array_inv!30862 (array!83787) Bool)

(assert (=> start!108134 (array_inv!30862 _keys!1427)))

(declare-fun b!1276981 () Bool)

(declare-fun lt!575388 () Bool)

(assert (=> b!1276981 (= e!729253 (not (or lt!575388 (bvslt (size!40957 _keys!1427) #b01111111111111111111111111111111))))))

(assert (=> b!1276981 e!729249))

(declare-fun c!123938 () Bool)

(assert (=> b!1276981 (= c!123938 (not lt!575388))))

(assert (=> b!1276981 (= lt!575388 (or (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49633)

(declare-datatypes ((Unit!42219 0))(
  ( (Unit!42220) )
))
(declare-fun lt!575387 () Unit!42219)

(declare-fun zeroValue!1129 () V!49633)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!619 (array!83787 array!83785 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 64) (_ BitVec 32) Int) Unit!42219)

(assert (=> b!1276981 (= lt!575387 (lemmaListMapContainsThenArrayContainsFrom!619 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun mapNonEmpty!51626 () Bool)

(declare-fun mapRes!51626 () Bool)

(declare-fun tp!98496 () Bool)

(declare-fun e!729248 () Bool)

(assert (=> mapNonEmpty!51626 (= mapRes!51626 (and tp!98496 e!729248))))

(declare-fun mapValue!51626 () ValueCell!15800)

(declare-fun mapRest!51626 () (Array (_ BitVec 32) ValueCell!15800))

(declare-fun mapKey!51626 () (_ BitVec 32))

(assert (=> mapNonEmpty!51626 (= (arr!40404 _values!1187) (store mapRest!51626 mapKey!51626 mapValue!51626))))

(declare-fun b!1276982 () Bool)

(declare-fun e!729251 () Bool)

(assert (=> b!1276982 (= e!729250 (and e!729251 mapRes!51626))))

(declare-fun condMapEmpty!51626 () Bool)

(declare-fun mapDefault!51626 () ValueCell!15800)

(assert (=> b!1276982 (= condMapEmpty!51626 (= (arr!40404 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15800)) mapDefault!51626)))))

(declare-fun b!1276983 () Bool)

(declare-fun arrayContainsKey!0 (array!83787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276983 (= e!729249 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1276984 () Bool)

(assert (=> b!1276984 (= e!729251 tp_is_empty!33397)))

(declare-fun b!1276985 () Bool)

(declare-fun res!848596 () Bool)

(assert (=> b!1276985 (=> (not res!848596) (not e!729253))))

(declare-datatypes ((List!28764 0))(
  ( (Nil!28761) (Cons!28760 (h!29969 (_ BitVec 64)) (t!42292 List!28764)) )
))
(declare-fun arrayNoDuplicates!0 (array!83787 (_ BitVec 32) List!28764) Bool)

(assert (=> b!1276985 (= res!848596 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28761))))

(declare-fun mapIsEmpty!51626 () Bool)

(assert (=> mapIsEmpty!51626 mapRes!51626))

(declare-fun b!1276986 () Bool)

(declare-fun res!848598 () Bool)

(assert (=> b!1276986 (=> (not res!848598) (not e!729253))))

(assert (=> b!1276986 (= res!848598 (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(declare-fun b!1276987 () Bool)

(declare-fun res!848600 () Bool)

(assert (=> b!1276987 (=> (not res!848600) (not e!729253))))

(declare-datatypes ((tuple2!21594 0))(
  ( (tuple2!21595 (_1!10808 (_ BitVec 64)) (_2!10808 V!49633)) )
))
(declare-datatypes ((List!28765 0))(
  ( (Nil!28762) (Cons!28761 (h!29970 tuple2!21594) (t!42293 List!28765)) )
))
(declare-datatypes ((ListLongMap!19251 0))(
  ( (ListLongMap!19252 (toList!9641 List!28765)) )
))
(declare-fun contains!7681 (ListLongMap!19251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4615 (array!83787 array!83785 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 32) Int) ListLongMap!19251)

(assert (=> b!1276987 (= res!848600 (contains!7681 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276988 () Bool)

(assert (=> b!1276988 (= e!729248 tp_is_empty!33397)))

(declare-fun b!1276989 () Bool)

(declare-fun res!848597 () Bool)

(assert (=> b!1276989 (=> (not res!848597) (not e!729253))))

(assert (=> b!1276989 (= res!848597 (and (= (size!40956 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40957 _keys!1427) (size!40956 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276990 () Bool)

(declare-fun res!848599 () Bool)

(assert (=> b!1276990 (=> (not res!848599) (not e!729253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83787 (_ BitVec 32)) Bool)

(assert (=> b!1276990 (= res!848599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108134 res!848601) b!1276989))

(assert (= (and b!1276989 res!848597) b!1276990))

(assert (= (and b!1276990 res!848599) b!1276985))

(assert (= (and b!1276985 res!848596) b!1276987))

(assert (= (and b!1276987 res!848600) b!1276986))

(assert (= (and b!1276986 res!848598) b!1276981))

(assert (= (and b!1276981 c!123938) b!1276983))

(assert (= (and b!1276981 (not c!123938)) b!1276980))

(assert (= (and b!1276982 condMapEmpty!51626) mapIsEmpty!51626))

(assert (= (and b!1276982 (not condMapEmpty!51626)) mapNonEmpty!51626))

(get-info :version)

(assert (= (and mapNonEmpty!51626 ((_ is ValueCellFull!15800) mapValue!51626)) b!1276988))

(assert (= (and b!1276982 ((_ is ValueCellFull!15800) mapDefault!51626)) b!1276984))

(assert (= start!108134 b!1276982))

(declare-fun m!1172277 () Bool)

(assert (=> b!1276987 m!1172277))

(assert (=> b!1276987 m!1172277))

(declare-fun m!1172279 () Bool)

(assert (=> b!1276987 m!1172279))

(declare-fun m!1172281 () Bool)

(assert (=> start!108134 m!1172281))

(declare-fun m!1172283 () Bool)

(assert (=> start!108134 m!1172283))

(declare-fun m!1172285 () Bool)

(assert (=> start!108134 m!1172285))

(declare-fun m!1172287 () Bool)

(assert (=> b!1276983 m!1172287))

(declare-fun m!1172289 () Bool)

(assert (=> b!1276990 m!1172289))

(declare-fun m!1172291 () Bool)

(assert (=> b!1276985 m!1172291))

(declare-fun m!1172293 () Bool)

(assert (=> b!1276981 m!1172293))

(declare-fun m!1172295 () Bool)

(assert (=> mapNonEmpty!51626 m!1172295))

(check-sat (not b!1276985) (not b!1276983) (not start!108134) (not b_next!27847) tp_is_empty!33397 (not mapNonEmpty!51626) (not b!1276987) (not b!1276990) b_and!45885 (not b!1276981))
(check-sat b_and!45885 (not b_next!27847))
(get-model)

(declare-fun bm!62631 () Bool)

(declare-fun call!62634 () Bool)

(assert (=> bm!62631 (= call!62634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1277065 () Bool)

(declare-fun e!729298 () Bool)

(assert (=> b!1277065 (= e!729298 call!62634)))

(declare-fun d!140335 () Bool)

(declare-fun res!848643 () Bool)

(declare-fun e!729296 () Bool)

(assert (=> d!140335 (=> res!848643 e!729296)))

(assert (=> d!140335 (= res!848643 (bvsge #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(assert (=> d!140335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729296)))

(declare-fun b!1277066 () Bool)

(declare-fun e!729297 () Bool)

(assert (=> b!1277066 (= e!729297 call!62634)))

(declare-fun b!1277067 () Bool)

(assert (=> b!1277067 (= e!729298 e!729297)))

(declare-fun lt!575407 () (_ BitVec 64))

(assert (=> b!1277067 (= lt!575407 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575408 () Unit!42219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83787 (_ BitVec 64) (_ BitVec 32)) Unit!42219)

(assert (=> b!1277067 (= lt!575408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575407 #b00000000000000000000000000000000))))

(assert (=> b!1277067 (arrayContainsKey!0 _keys!1427 lt!575407 #b00000000000000000000000000000000)))

(declare-fun lt!575409 () Unit!42219)

(assert (=> b!1277067 (= lt!575409 lt!575408)))

(declare-fun res!848642 () Bool)

(declare-datatypes ((SeekEntryResult!10005 0))(
  ( (MissingZero!10005 (index!42391 (_ BitVec 32))) (Found!10005 (index!42392 (_ BitVec 32))) (Intermediate!10005 (undefined!10817 Bool) (index!42393 (_ BitVec 32)) (x!113165 (_ BitVec 32))) (Undefined!10005) (MissingVacant!10005 (index!42394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83787 (_ BitVec 32)) SeekEntryResult!10005)

(assert (=> b!1277067 (= res!848642 (= (seekEntryOrOpen!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10005 #b00000000000000000000000000000000)))))

(assert (=> b!1277067 (=> (not res!848642) (not e!729297))))

(declare-fun b!1277068 () Bool)

(assert (=> b!1277068 (= e!729296 e!729298)))

(declare-fun c!123947 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1277068 (= c!123947 (validKeyInArray!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140335 (not res!848643)) b!1277068))

(assert (= (and b!1277068 c!123947) b!1277067))

(assert (= (and b!1277068 (not c!123947)) b!1277065))

(assert (= (and b!1277067 res!848642) b!1277066))

(assert (= (or b!1277066 b!1277065) bm!62631))

(declare-fun m!1172337 () Bool)

(assert (=> bm!62631 m!1172337))

(declare-fun m!1172339 () Bool)

(assert (=> b!1277067 m!1172339))

(declare-fun m!1172341 () Bool)

(assert (=> b!1277067 m!1172341))

(declare-fun m!1172343 () Bool)

(assert (=> b!1277067 m!1172343))

(assert (=> b!1277067 m!1172339))

(declare-fun m!1172345 () Bool)

(assert (=> b!1277067 m!1172345))

(assert (=> b!1277068 m!1172339))

(assert (=> b!1277068 m!1172339))

(declare-fun m!1172347 () Bool)

(assert (=> b!1277068 m!1172347))

(assert (=> b!1276990 d!140335))

(declare-fun bm!62634 () Bool)

(declare-fun call!62637 () Bool)

(declare-fun c!123950 () Bool)

(assert (=> bm!62634 (= call!62637 (arrayNoDuplicates!0 _keys!1427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123950 (Cons!28760 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000) Nil!28761) Nil!28761)))))

(declare-fun b!1277079 () Bool)

(declare-fun e!729308 () Bool)

(declare-fun contains!7682 (List!28764 (_ BitVec 64)) Bool)

(assert (=> b!1277079 (= e!729308 (contains!7682 Nil!28761 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277080 () Bool)

(declare-fun e!729309 () Bool)

(declare-fun e!729307 () Bool)

(assert (=> b!1277080 (= e!729309 e!729307)))

(assert (=> b!1277080 (= c!123950 (validKeyInArray!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277081 () Bool)

(declare-fun e!729310 () Bool)

(assert (=> b!1277081 (= e!729310 e!729309)))

(declare-fun res!848651 () Bool)

(assert (=> b!1277081 (=> (not res!848651) (not e!729309))))

(assert (=> b!1277081 (= res!848651 (not e!729308))))

(declare-fun res!848650 () Bool)

(assert (=> b!1277081 (=> (not res!848650) (not e!729308))))

(assert (=> b!1277081 (= res!848650 (validKeyInArray!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140337 () Bool)

(declare-fun res!848652 () Bool)

(assert (=> d!140337 (=> res!848652 e!729310)))

(assert (=> d!140337 (= res!848652 (bvsge #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(assert (=> d!140337 (= (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28761) e!729310)))

(declare-fun b!1277082 () Bool)

(assert (=> b!1277082 (= e!729307 call!62637)))

(declare-fun b!1277083 () Bool)

(assert (=> b!1277083 (= e!729307 call!62637)))

(assert (= (and d!140337 (not res!848652)) b!1277081))

(assert (= (and b!1277081 res!848650) b!1277079))

(assert (= (and b!1277081 res!848651) b!1277080))

(assert (= (and b!1277080 c!123950) b!1277082))

(assert (= (and b!1277080 (not c!123950)) b!1277083))

(assert (= (or b!1277082 b!1277083) bm!62634))

(assert (=> bm!62634 m!1172339))

(declare-fun m!1172349 () Bool)

(assert (=> bm!62634 m!1172349))

(assert (=> b!1277079 m!1172339))

(assert (=> b!1277079 m!1172339))

(declare-fun m!1172351 () Bool)

(assert (=> b!1277079 m!1172351))

(assert (=> b!1277080 m!1172339))

(assert (=> b!1277080 m!1172339))

(assert (=> b!1277080 m!1172347))

(assert (=> b!1277081 m!1172339))

(assert (=> b!1277081 m!1172339))

(assert (=> b!1277081 m!1172347))

(assert (=> b!1276985 d!140337))

(declare-fun d!140339 () Bool)

(declare-fun e!729313 () Bool)

(assert (=> d!140339 e!729313))

(declare-fun c!123953 () Bool)

(assert (=> d!140339 (= c!123953 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!575412 () Unit!42219)

(declare-fun choose!1905 (array!83787 array!83785 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 64) (_ BitVec 32) Int) Unit!42219)

(assert (=> d!140339 (= lt!575412 (choose!1905 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(assert (=> d!140339 (validMask!0 mask!1805)))

(assert (=> d!140339 (= (lemmaListMapContainsThenArrayContainsFrom!619 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195) lt!575412)))

(declare-fun b!1277088 () Bool)

(assert (=> b!1277088 (= e!729313 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1277089 () Bool)

(assert (=> b!1277089 (= e!729313 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140339 c!123953) b!1277088))

(assert (= (and d!140339 (not c!123953)) b!1277089))

(declare-fun m!1172353 () Bool)

(assert (=> d!140339 m!1172353))

(assert (=> d!140339 m!1172281))

(assert (=> b!1277088 m!1172287))

(assert (=> b!1276981 d!140339))

(declare-fun d!140341 () Bool)

(declare-fun res!848657 () Bool)

(declare-fun e!729318 () Bool)

(assert (=> d!140341 (=> res!848657 e!729318)))

(assert (=> d!140341 (= res!848657 (= (select (arr!40405 _keys!1427) #b00000000000000000000000000000000) k0!1053))))

(assert (=> d!140341 (= (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000) e!729318)))

(declare-fun b!1277094 () Bool)

(declare-fun e!729319 () Bool)

(assert (=> b!1277094 (= e!729318 e!729319)))

(declare-fun res!848658 () Bool)

(assert (=> b!1277094 (=> (not res!848658) (not e!729319))))

(assert (=> b!1277094 (= res!848658 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40957 _keys!1427)))))

(declare-fun b!1277095 () Bool)

(assert (=> b!1277095 (= e!729319 (arrayContainsKey!0 _keys!1427 k0!1053 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!140341 (not res!848657)) b!1277094))

(assert (= (and b!1277094 res!848658) b!1277095))

(assert (=> d!140341 m!1172339))

(declare-fun m!1172355 () Bool)

(assert (=> b!1277095 m!1172355))

(assert (=> b!1276983 d!140341))

(declare-fun d!140343 () Bool)

(assert (=> d!140343 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108134 d!140343))

(declare-fun d!140345 () Bool)

(assert (=> d!140345 (= (array_inv!30861 _values!1187) (bvsge (size!40956 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108134 d!140345))

(declare-fun d!140347 () Bool)

(assert (=> d!140347 (= (array_inv!30862 _keys!1427) (bvsge (size!40957 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108134 d!140347))

(declare-fun d!140349 () Bool)

(declare-fun e!729325 () Bool)

(assert (=> d!140349 e!729325))

(declare-fun res!848661 () Bool)

(assert (=> d!140349 (=> res!848661 e!729325)))

(declare-fun lt!575421 () Bool)

(assert (=> d!140349 (= res!848661 (not lt!575421))))

(declare-fun lt!575424 () Bool)

(assert (=> d!140349 (= lt!575421 lt!575424)))

(declare-fun lt!575423 () Unit!42219)

(declare-fun e!729324 () Unit!42219)

(assert (=> d!140349 (= lt!575423 e!729324)))

(declare-fun c!123956 () Bool)

(assert (=> d!140349 (= c!123956 lt!575424)))

(declare-fun containsKey!710 (List!28765 (_ BitVec 64)) Bool)

(assert (=> d!140349 (= lt!575424 (containsKey!710 (toList!9641 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(assert (=> d!140349 (= (contains!7681 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053) lt!575421)))

(declare-fun b!1277102 () Bool)

(declare-fun lt!575422 () Unit!42219)

(assert (=> b!1277102 (= e!729324 lt!575422)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!457 (List!28765 (_ BitVec 64)) Unit!42219)

(assert (=> b!1277102 (= lt!575422 (lemmaContainsKeyImpliesGetValueByKeyDefined!457 (toList!9641 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-datatypes ((Option!744 0))(
  ( (Some!743 (v!19372 V!49633)) (None!742) )
))
(declare-fun isDefined!500 (Option!744) Bool)

(declare-fun getValueByKey!693 (List!28765 (_ BitVec 64)) Option!744)

(assert (=> b!1277102 (isDefined!500 (getValueByKey!693 (toList!9641 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053))))

(declare-fun b!1277103 () Bool)

(declare-fun Unit!42221 () Unit!42219)

(assert (=> b!1277103 (= e!729324 Unit!42221)))

(declare-fun b!1277104 () Bool)

(assert (=> b!1277104 (= e!729325 (isDefined!500 (getValueByKey!693 (toList!9641 (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195)) k0!1053)))))

(assert (= (and d!140349 c!123956) b!1277102))

(assert (= (and d!140349 (not c!123956)) b!1277103))

(assert (= (and d!140349 (not res!848661)) b!1277104))

(declare-fun m!1172357 () Bool)

(assert (=> d!140349 m!1172357))

(declare-fun m!1172359 () Bool)

(assert (=> b!1277102 m!1172359))

(declare-fun m!1172361 () Bool)

(assert (=> b!1277102 m!1172361))

(assert (=> b!1277102 m!1172361))

(declare-fun m!1172363 () Bool)

(assert (=> b!1277102 m!1172363))

(assert (=> b!1277104 m!1172361))

(assert (=> b!1277104 m!1172361))

(assert (=> b!1277104 m!1172363))

(assert (=> b!1276987 d!140349))

(declare-fun b!1277147 () Bool)

(declare-fun e!729362 () ListLongMap!19251)

(declare-fun e!729357 () ListLongMap!19251)

(assert (=> b!1277147 (= e!729362 e!729357)))

(declare-fun c!123971 () Bool)

(assert (=> b!1277147 (= c!123971 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1277148 () Bool)

(declare-fun e!729354 () Bool)

(declare-fun e!729353 () Bool)

(assert (=> b!1277148 (= e!729354 e!729353)))

(declare-fun res!848684 () Bool)

(declare-fun call!62657 () Bool)

(assert (=> b!1277148 (= res!848684 call!62657)))

(assert (=> b!1277148 (=> (not res!848684) (not e!729353))))

(declare-fun b!1277149 () Bool)

(declare-fun e!729363 () Bool)

(assert (=> b!1277149 (= e!729363 (validKeyInArray!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277150 () Bool)

(declare-fun e!729356 () ListLongMap!19251)

(declare-fun call!62654 () ListLongMap!19251)

(assert (=> b!1277150 (= e!729356 call!62654)))

(declare-fun b!1277151 () Bool)

(declare-fun call!62653 () ListLongMap!19251)

(assert (=> b!1277151 (= e!729356 call!62653)))

(declare-fun bm!62649 () Bool)

(declare-fun call!62655 () Bool)

(declare-fun lt!575471 () ListLongMap!19251)

(assert (=> bm!62649 (= call!62655 (contains!7681 lt!575471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1277152 () Bool)

(declare-fun res!848683 () Bool)

(declare-fun e!729360 () Bool)

(assert (=> b!1277152 (=> (not res!848683) (not e!729360))))

(declare-fun e!729359 () Bool)

(assert (=> b!1277152 (= res!848683 e!729359)))

(declare-fun res!848685 () Bool)

(assert (=> b!1277152 (=> res!848685 e!729359)))

(declare-fun e!729355 () Bool)

(assert (=> b!1277152 (= res!848685 (not e!729355))))

(declare-fun res!848687 () Bool)

(assert (=> b!1277152 (=> (not res!848687) (not e!729355))))

(assert (=> b!1277152 (= res!848687 (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(declare-fun bm!62650 () Bool)

(declare-fun call!62656 () ListLongMap!19251)

(declare-fun call!62652 () ListLongMap!19251)

(assert (=> bm!62650 (= call!62656 call!62652)))

(declare-fun b!1277153 () Bool)

(declare-fun e!729364 () Bool)

(declare-fun apply!1000 (ListLongMap!19251 (_ BitVec 64)) V!49633)

(declare-fun get!20633 (ValueCell!15800 V!49633) V!49633)

(declare-fun dynLambda!3430 (Int (_ BitVec 64)) V!49633)

(assert (=> b!1277153 (= e!729364 (= (apply!1000 lt!575471 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)) (get!20633 (select (arr!40404 _values!1187) #b00000000000000000000000000000000) (dynLambda!3430 defaultEntry!1195 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1277153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40956 _values!1187)))))

(assert (=> b!1277153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(declare-fun bm!62651 () Bool)

(declare-fun call!62658 () ListLongMap!19251)

(assert (=> bm!62651 (= call!62654 call!62658)))

(declare-fun b!1277154 () Bool)

(declare-fun e!729358 () Unit!42219)

(declare-fun Unit!42222 () Unit!42219)

(assert (=> b!1277154 (= e!729358 Unit!42222)))

(declare-fun bm!62652 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5939 (array!83787 array!83785 (_ BitVec 32) (_ BitVec 32) V!49633 V!49633 (_ BitVec 32) Int) ListLongMap!19251)

(assert (=> bm!62652 (= call!62652 (getCurrentListMapNoExtraKeys!5939 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277156 () Bool)

(assert (=> b!1277156 (= e!729359 e!729364)))

(declare-fun res!848681 () Bool)

(assert (=> b!1277156 (=> (not res!848681) (not e!729364))))

(assert (=> b!1277156 (= res!848681 (contains!7681 lt!575471 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(assert (=> b!1277156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(declare-fun b!1277157 () Bool)

(declare-fun e!729352 () Bool)

(assert (=> b!1277157 (= e!729352 (= (apply!1000 lt!575471 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1129))))

(declare-fun b!1277158 () Bool)

(assert (=> b!1277158 (= e!729354 (not call!62657))))

(declare-fun b!1277159 () Bool)

(assert (=> b!1277159 (= e!729355 (validKeyInArray!0 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1277160 () Bool)

(declare-fun +!4308 (ListLongMap!19251 tuple2!21594) ListLongMap!19251)

(assert (=> b!1277160 (= e!729362 (+!4308 call!62658 (tuple2!21595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129)))))

(declare-fun b!1277161 () Bool)

(declare-fun c!123972 () Bool)

(assert (=> b!1277161 (= c!123972 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1277161 (= e!729357 e!729356)))

(declare-fun bm!62653 () Bool)

(assert (=> bm!62653 (= call!62657 (contains!7681 lt!575471 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62654 () Bool)

(assert (=> bm!62654 (= call!62653 call!62656)))

(declare-fun b!1277162 () Bool)

(declare-fun e!729361 () Bool)

(assert (=> b!1277162 (= e!729361 (not call!62655))))

(declare-fun b!1277163 () Bool)

(declare-fun res!848688 () Bool)

(assert (=> b!1277163 (=> (not res!848688) (not e!729360))))

(assert (=> b!1277163 (= res!848688 e!729361)))

(declare-fun c!123974 () Bool)

(assert (=> b!1277163 (= c!123974 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1277164 () Bool)

(assert (=> b!1277164 (= e!729360 e!729354)))

(declare-fun c!123969 () Bool)

(assert (=> b!1277164 (= c!123969 (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1277165 () Bool)

(declare-fun lt!575483 () Unit!42219)

(assert (=> b!1277165 (= e!729358 lt!575483)))

(declare-fun lt!575470 () ListLongMap!19251)

(assert (=> b!1277165 (= lt!575470 (getCurrentListMapNoExtraKeys!5939 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575473 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575469 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575469 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575472 () Unit!42219)

(declare-fun addStillContains!1095 (ListLongMap!19251 (_ BitVec 64) V!49633 (_ BitVec 64)) Unit!42219)

(assert (=> b!1277165 (= lt!575472 (addStillContains!1095 lt!575470 lt!575473 zeroValue!1129 lt!575469))))

(assert (=> b!1277165 (contains!7681 (+!4308 lt!575470 (tuple2!21595 lt!575473 zeroValue!1129)) lt!575469)))

(declare-fun lt!575481 () Unit!42219)

(assert (=> b!1277165 (= lt!575481 lt!575472)))

(declare-fun lt!575487 () ListLongMap!19251)

(assert (=> b!1277165 (= lt!575487 (getCurrentListMapNoExtraKeys!5939 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575478 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575478 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575475 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575475 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575484 () Unit!42219)

(declare-fun addApplyDifferent!538 (ListLongMap!19251 (_ BitVec 64) V!49633 (_ BitVec 64)) Unit!42219)

(assert (=> b!1277165 (= lt!575484 (addApplyDifferent!538 lt!575487 lt!575478 minValue!1129 lt!575475))))

(assert (=> b!1277165 (= (apply!1000 (+!4308 lt!575487 (tuple2!21595 lt!575478 minValue!1129)) lt!575475) (apply!1000 lt!575487 lt!575475))))

(declare-fun lt!575479 () Unit!42219)

(assert (=> b!1277165 (= lt!575479 lt!575484)))

(declare-fun lt!575476 () ListLongMap!19251)

(assert (=> b!1277165 (= lt!575476 (getCurrentListMapNoExtraKeys!5939 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575490 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575486 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575486 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000))))

(declare-fun lt!575474 () Unit!42219)

(assert (=> b!1277165 (= lt!575474 (addApplyDifferent!538 lt!575476 lt!575490 zeroValue!1129 lt!575486))))

(assert (=> b!1277165 (= (apply!1000 (+!4308 lt!575476 (tuple2!21595 lt!575490 zeroValue!1129)) lt!575486) (apply!1000 lt!575476 lt!575486))))

(declare-fun lt!575488 () Unit!42219)

(assert (=> b!1277165 (= lt!575488 lt!575474)))

(declare-fun lt!575480 () ListLongMap!19251)

(assert (=> b!1277165 (= lt!575480 (getCurrentListMapNoExtraKeys!5939 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun lt!575485 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!575482 () (_ BitVec 64))

(assert (=> b!1277165 (= lt!575482 (select (arr!40405 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> b!1277165 (= lt!575483 (addApplyDifferent!538 lt!575480 lt!575485 minValue!1129 lt!575482))))

(assert (=> b!1277165 (= (apply!1000 (+!4308 lt!575480 (tuple2!21595 lt!575485 minValue!1129)) lt!575482) (apply!1000 lt!575480 lt!575482))))

(declare-fun b!1277166 () Bool)

(assert (=> b!1277166 (= e!729357 call!62654)))

(declare-fun c!123970 () Bool)

(declare-fun bm!62655 () Bool)

(assert (=> bm!62655 (= call!62658 (+!4308 (ite c!123970 call!62652 (ite c!123971 call!62656 call!62653)) (ite (or c!123970 c!123971) (tuple2!21595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1129) (tuple2!21595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1129))))))

(declare-fun b!1277167 () Bool)

(assert (=> b!1277167 (= e!729361 e!729352)))

(declare-fun res!848680 () Bool)

(assert (=> b!1277167 (= res!848680 call!62655)))

(assert (=> b!1277167 (=> (not res!848680) (not e!729352))))

(declare-fun b!1277155 () Bool)

(assert (=> b!1277155 (= e!729353 (= (apply!1000 lt!575471 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1129))))

(declare-fun d!140351 () Bool)

(assert (=> d!140351 e!729360))

(declare-fun res!848682 () Bool)

(assert (=> d!140351 (=> (not res!848682) (not e!729360))))

(assert (=> d!140351 (= res!848682 (or (bvsge #b00000000000000000000000000000000 (size!40957 _keys!1427)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))))

(declare-fun lt!575477 () ListLongMap!19251)

(assert (=> d!140351 (= lt!575471 lt!575477)))

(declare-fun lt!575489 () Unit!42219)

(assert (=> d!140351 (= lt!575489 e!729358)))

(declare-fun c!123973 () Bool)

(assert (=> d!140351 (= c!123973 e!729363)))

(declare-fun res!848686 () Bool)

(assert (=> d!140351 (=> (not res!848686) (not e!729363))))

(assert (=> d!140351 (= res!848686 (bvslt #b00000000000000000000000000000000 (size!40957 _keys!1427)))))

(assert (=> d!140351 (= lt!575477 e!729362)))

(assert (=> d!140351 (= c!123970 (and (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140351 (validMask!0 mask!1805)))

(assert (=> d!140351 (= (getCurrentListMap!4615 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) lt!575471)))

(assert (= (and d!140351 c!123970) b!1277160))

(assert (= (and d!140351 (not c!123970)) b!1277147))

(assert (= (and b!1277147 c!123971) b!1277166))

(assert (= (and b!1277147 (not c!123971)) b!1277161))

(assert (= (and b!1277161 c!123972) b!1277150))

(assert (= (and b!1277161 (not c!123972)) b!1277151))

(assert (= (or b!1277150 b!1277151) bm!62654))

(assert (= (or b!1277166 bm!62654) bm!62650))

(assert (= (or b!1277166 b!1277150) bm!62651))

(assert (= (or b!1277160 bm!62650) bm!62652))

(assert (= (or b!1277160 bm!62651) bm!62655))

(assert (= (and d!140351 res!848686) b!1277149))

(assert (= (and d!140351 c!123973) b!1277165))

(assert (= (and d!140351 (not c!123973)) b!1277154))

(assert (= (and d!140351 res!848682) b!1277152))

(assert (= (and b!1277152 res!848687) b!1277159))

(assert (= (and b!1277152 (not res!848685)) b!1277156))

(assert (= (and b!1277156 res!848681) b!1277153))

(assert (= (and b!1277152 res!848683) b!1277163))

(assert (= (and b!1277163 c!123974) b!1277167))

(assert (= (and b!1277163 (not c!123974)) b!1277162))

(assert (= (and b!1277167 res!848680) b!1277157))

(assert (= (or b!1277167 b!1277162) bm!62649))

(assert (= (and b!1277163 res!848688) b!1277164))

(assert (= (and b!1277164 c!123969) b!1277148))

(assert (= (and b!1277164 (not c!123969)) b!1277158))

(assert (= (and b!1277148 res!848684) b!1277155))

(assert (= (or b!1277148 b!1277158) bm!62653))

(declare-fun b_lambda!23077 () Bool)

(assert (=> (not b_lambda!23077) (not b!1277153)))

(declare-fun t!42296 () Bool)

(declare-fun tb!11333 () Bool)

(assert (=> (and start!108134 (= defaultEntry!1195 defaultEntry!1195) t!42296) tb!11333))

(declare-fun result!23655 () Bool)

(assert (=> tb!11333 (= result!23655 tp_is_empty!33397)))

(assert (=> b!1277153 t!42296))

(declare-fun b_and!45891 () Bool)

(assert (= b_and!45885 (and (=> t!42296 result!23655) b_and!45891)))

(declare-fun m!1172365 () Bool)

(assert (=> b!1277165 m!1172365))

(declare-fun m!1172367 () Bool)

(assert (=> b!1277165 m!1172367))

(declare-fun m!1172369 () Bool)

(assert (=> b!1277165 m!1172369))

(declare-fun m!1172371 () Bool)

(assert (=> b!1277165 m!1172371))

(assert (=> b!1277165 m!1172371))

(declare-fun m!1172373 () Bool)

(assert (=> b!1277165 m!1172373))

(declare-fun m!1172375 () Bool)

(assert (=> b!1277165 m!1172375))

(declare-fun m!1172377 () Bool)

(assert (=> b!1277165 m!1172377))

(assert (=> b!1277165 m!1172339))

(declare-fun m!1172379 () Bool)

(assert (=> b!1277165 m!1172379))

(declare-fun m!1172381 () Bool)

(assert (=> b!1277165 m!1172381))

(declare-fun m!1172383 () Bool)

(assert (=> b!1277165 m!1172383))

(declare-fun m!1172385 () Bool)

(assert (=> b!1277165 m!1172385))

(assert (=> b!1277165 m!1172379))

(declare-fun m!1172387 () Bool)

(assert (=> b!1277165 m!1172387))

(assert (=> b!1277165 m!1172365))

(declare-fun m!1172389 () Bool)

(assert (=> b!1277165 m!1172389))

(declare-fun m!1172391 () Bool)

(assert (=> b!1277165 m!1172391))

(declare-fun m!1172393 () Bool)

(assert (=> b!1277165 m!1172393))

(assert (=> b!1277165 m!1172391))

(declare-fun m!1172395 () Bool)

(assert (=> b!1277165 m!1172395))

(declare-fun m!1172397 () Bool)

(assert (=> b!1277155 m!1172397))

(declare-fun m!1172399 () Bool)

(assert (=> bm!62649 m!1172399))

(assert (=> d!140351 m!1172281))

(assert (=> b!1277149 m!1172339))

(assert (=> b!1277149 m!1172339))

(assert (=> b!1277149 m!1172347))

(assert (=> b!1277159 m!1172339))

(assert (=> b!1277159 m!1172339))

(assert (=> b!1277159 m!1172347))

(declare-fun m!1172401 () Bool)

(assert (=> bm!62653 m!1172401))

(declare-fun m!1172403 () Bool)

(assert (=> b!1277157 m!1172403))

(declare-fun m!1172405 () Bool)

(assert (=> b!1277160 m!1172405))

(declare-fun m!1172407 () Bool)

(assert (=> bm!62655 m!1172407))

(declare-fun m!1172409 () Bool)

(assert (=> b!1277153 m!1172409))

(declare-fun m!1172411 () Bool)

(assert (=> b!1277153 m!1172411))

(declare-fun m!1172413 () Bool)

(assert (=> b!1277153 m!1172413))

(assert (=> b!1277153 m!1172409))

(assert (=> b!1277153 m!1172411))

(assert (=> b!1277153 m!1172339))

(assert (=> b!1277153 m!1172339))

(declare-fun m!1172415 () Bool)

(assert (=> b!1277153 m!1172415))

(assert (=> b!1277156 m!1172339))

(assert (=> b!1277156 m!1172339))

(declare-fun m!1172417 () Bool)

(assert (=> b!1277156 m!1172417))

(assert (=> bm!62652 m!1172381))

(assert (=> b!1276987 d!140351))

(declare-fun condMapEmpty!51635 () Bool)

(declare-fun mapDefault!51635 () ValueCell!15800)

(assert (=> mapNonEmpty!51626 (= condMapEmpty!51635 (= mapRest!51626 ((as const (Array (_ BitVec 32) ValueCell!15800)) mapDefault!51635)))))

(declare-fun e!729370 () Bool)

(declare-fun mapRes!51635 () Bool)

(assert (=> mapNonEmpty!51626 (= tp!98496 (and e!729370 mapRes!51635))))

(declare-fun mapNonEmpty!51635 () Bool)

(declare-fun tp!98511 () Bool)

(declare-fun e!729369 () Bool)

(assert (=> mapNonEmpty!51635 (= mapRes!51635 (and tp!98511 e!729369))))

(declare-fun mapValue!51635 () ValueCell!15800)

(declare-fun mapRest!51635 () (Array (_ BitVec 32) ValueCell!15800))

(declare-fun mapKey!51635 () (_ BitVec 32))

(assert (=> mapNonEmpty!51635 (= mapRest!51626 (store mapRest!51635 mapKey!51635 mapValue!51635))))

(declare-fun b!1277176 () Bool)

(assert (=> b!1277176 (= e!729369 tp_is_empty!33397)))

(declare-fun b!1277177 () Bool)

(assert (=> b!1277177 (= e!729370 tp_is_empty!33397)))

(declare-fun mapIsEmpty!51635 () Bool)

(assert (=> mapIsEmpty!51635 mapRes!51635))

(assert (= (and mapNonEmpty!51626 condMapEmpty!51635) mapIsEmpty!51635))

(assert (= (and mapNonEmpty!51626 (not condMapEmpty!51635)) mapNonEmpty!51635))

(assert (= (and mapNonEmpty!51635 ((_ is ValueCellFull!15800) mapValue!51635)) b!1277176))

(assert (= (and mapNonEmpty!51626 ((_ is ValueCellFull!15800) mapDefault!51635)) b!1277177))

(declare-fun m!1172419 () Bool)

(assert (=> mapNonEmpty!51635 m!1172419))

(declare-fun b_lambda!23079 () Bool)

(assert (= b_lambda!23077 (or (and start!108134 b_free!27847) b_lambda!23079)))

(check-sat (not b!1277165) (not b!1277160) (not bm!62655) (not b!1277153) (not b!1277068) (not b!1277149) (not bm!62631) (not b!1277156) (not b_next!27847) (not b!1277095) (not bm!62634) (not d!140351) (not b!1277159) (not bm!62652) (not d!140349) (not b!1277102) (not b!1277080) (not b!1277088) (not mapNonEmpty!51635) (not bm!62649) (not b!1277081) (not b!1277157) b_and!45891 (not b_lambda!23079) (not bm!62653) (not b!1277067) tp_is_empty!33397 (not b!1277104) (not b!1277079) (not d!140339) (not b!1277155))
(check-sat b_and!45891 (not b_next!27847))
