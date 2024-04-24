; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101242 () Bool)

(assert start!101242)

(declare-fun b_free!26005 () Bool)

(declare-fun b_next!26005 () Bool)

(assert (=> start!101242 (= b_free!26005 (not b_next!26005))))

(declare-fun tp!91030 () Bool)

(declare-fun b_and!43093 () Bool)

(assert (=> start!101242 (= tp!91030 b_and!43093)))

(declare-fun mapIsEmpty!47932 () Bool)

(declare-fun mapRes!47932 () Bool)

(assert (=> mapIsEmpty!47932 mapRes!47932))

(declare-fun b!1211234 () Bool)

(declare-fun e!688003 () Bool)

(declare-datatypes ((V!46073 0))(
  ( (V!46074 (val!15411 Int)) )
))
(declare-datatypes ((tuple2!19802 0))(
  ( (tuple2!19803 (_1!9912 (_ BitVec 64)) (_2!9912 V!46073)) )
))
(declare-datatypes ((List!26607 0))(
  ( (Nil!26604) (Cons!26603 (h!27821 tuple2!19802) (t!39584 List!26607)) )
))
(declare-datatypes ((ListLongMap!17779 0))(
  ( (ListLongMap!17780 (toList!8905 List!26607)) )
))
(declare-fun call!59571 () ListLongMap!17779)

(declare-fun call!59568 () ListLongMap!17779)

(assert (=> b!1211234 (= e!688003 (= call!59571 call!59568))))

(declare-fun b!1211235 () Bool)

(declare-datatypes ((Unit!40056 0))(
  ( (Unit!40057) )
))
(declare-fun e!688007 () Unit!40056)

(declare-fun Unit!40058 () Unit!40056)

(assert (=> b!1211235 (= e!688007 Unit!40058)))

(declare-fun lt!549756 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211235 (= lt!549756 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119555 () Bool)

(assert (=> b!1211235 (= c!119555 (and (not lt!549756) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549753 () Unit!40056)

(declare-fun e!688009 () Unit!40056)

(assert (=> b!1211235 (= lt!549753 e!688009)))

(declare-fun zeroValue!944 () V!46073)

(declare-datatypes ((array!78237 0))(
  ( (array!78238 (arr!37749 (Array (_ BitVec 32) (_ BitVec 64))) (size!38286 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78237)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!549754 () Unit!40056)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14645 0))(
  ( (ValueCellFull!14645 (v!18058 V!46073)) (EmptyCell!14645) )
))
(declare-datatypes ((array!78239 0))(
  ( (array!78240 (arr!37750 (Array (_ BitVec 32) ValueCell!14645)) (size!38287 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78239)

(declare-fun minValue!944 () V!46073)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!599 (array!78237 array!78239 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 64) (_ BitVec 32) Int) Unit!40056)

(assert (=> b!1211235 (= lt!549754 (lemmaListMapContainsThenArrayContainsFrom!599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119556 () Bool)

(assert (=> b!1211235 (= c!119556 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804594 () Bool)

(declare-fun e!688006 () Bool)

(assert (=> b!1211235 (= res!804594 e!688006)))

(declare-fun e!688011 () Bool)

(assert (=> b!1211235 (=> (not res!804594) (not e!688011))))

(assert (=> b!1211235 e!688011))

(declare-fun lt!549763 () Unit!40056)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78237 (_ BitVec 32) (_ BitVec 32)) Unit!40056)

(assert (=> b!1211235 (= lt!549763 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26608 0))(
  ( (Nil!26605) (Cons!26604 (h!27822 (_ BitVec 64)) (t!39585 List!26608)) )
))
(declare-fun arrayNoDuplicates!0 (array!78237 (_ BitVec 32) List!26608) Bool)

(assert (=> b!1211235 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26605)))

(declare-fun lt!549767 () Unit!40056)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78237 (_ BitVec 64) (_ BitVec 32) List!26608) Unit!40056)

(assert (=> b!1211235 (= lt!549767 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26605))))

(assert (=> b!1211235 false))

(declare-fun b!1211236 () Bool)

(declare-fun e!688000 () Bool)

(declare-fun tp_is_empty!30709 () Bool)

(assert (=> b!1211236 (= e!688000 tp_is_empty!30709)))

(declare-fun bm!59563 () Bool)

(declare-fun call!59569 () Bool)

(declare-fun call!59572 () Bool)

(assert (=> bm!59563 (= call!59569 call!59572)))

(declare-fun call!59567 () Unit!40056)

(declare-fun lt!549764 () ListLongMap!17779)

(declare-fun bm!59564 () Bool)

(declare-fun c!119558 () Bool)

(declare-fun addStillContains!1049 (ListLongMap!17779 (_ BitVec 64) V!46073 (_ BitVec 64)) Unit!40056)

(assert (=> bm!59564 (= call!59567 (addStillContains!1049 lt!549764 (ite (or c!119555 c!119558) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119555 c!119558) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!59565 () Bool)

(declare-fun call!59573 () Unit!40056)

(assert (=> bm!59565 (= call!59573 call!59567)))

(declare-fun mapNonEmpty!47932 () Bool)

(declare-fun tp!91031 () Bool)

(assert (=> mapNonEmpty!47932 (= mapRes!47932 (and tp!91031 e!688000))))

(declare-fun mapKey!47932 () (_ BitVec 32))

(declare-fun mapRest!47932 () (Array (_ BitVec 32) ValueCell!14645))

(declare-fun mapValue!47932 () ValueCell!14645)

(assert (=> mapNonEmpty!47932 (= (arr!37750 _values!996) (store mapRest!47932 mapKey!47932 mapValue!47932))))

(declare-fun b!1211238 () Bool)

(declare-fun e!688002 () Bool)

(assert (=> b!1211238 (= e!688002 (bvslt from!1455 (size!38286 _keys!1208)))))

(declare-fun lt!549762 () Unit!40056)

(assert (=> b!1211238 (= lt!549762 e!688007)))

(declare-fun c!119559 () Bool)

(declare-fun contains!6998 (ListLongMap!17779 (_ BitVec 64)) Bool)

(assert (=> b!1211238 (= c!119559 (contains!6998 lt!549764 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!5365 (array!78237 array!78239 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) Int) ListLongMap!17779)

(assert (=> b!1211238 (= lt!549764 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211239 () Bool)

(declare-fun lt!549755 () ListLongMap!17779)

(declare-fun +!4066 (ListLongMap!17779 tuple2!19802) ListLongMap!17779)

(assert (=> b!1211239 (contains!6998 (+!4066 lt!549755 (tuple2!19803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!549769 () Unit!40056)

(assert (=> b!1211239 (= lt!549769 (addStillContains!1049 lt!549755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1211239 call!59572))

(declare-fun call!59570 () ListLongMap!17779)

(assert (=> b!1211239 (= lt!549755 call!59570)))

(declare-fun lt!549759 () Unit!40056)

(assert (=> b!1211239 (= lt!549759 call!59567)))

(assert (=> b!1211239 (= e!688009 lt!549769)))

(declare-fun b!1211240 () Bool)

(declare-fun e!688005 () Unit!40056)

(declare-fun Unit!40059 () Unit!40056)

(assert (=> b!1211240 (= e!688005 Unit!40059)))

(declare-fun lt!549758 () array!78237)

(declare-fun bm!59566 () Bool)

(declare-fun lt!549757 () array!78239)

(assert (=> bm!59566 (= call!59571 (getCurrentListMapNoExtraKeys!5365 lt!549758 lt!549757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211241 () Bool)

(declare-fun Unit!40060 () Unit!40056)

(assert (=> b!1211241 (= e!688007 Unit!40060)))

(declare-fun b!1211242 () Bool)

(declare-fun e!687998 () Bool)

(declare-fun e!688008 () Bool)

(assert (=> b!1211242 (= e!687998 e!688008)))

(declare-fun res!804583 () Bool)

(assert (=> b!1211242 (=> (not res!804583) (not e!688008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78237 (_ BitVec 32)) Bool)

(assert (=> b!1211242 (= res!804583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549758 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211242 (= lt!549758 (array!78238 (store (arr!37749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38286 _keys!1208)))))

(declare-fun b!1211243 () Bool)

(declare-fun res!804589 () Bool)

(assert (=> b!1211243 (=> (not res!804589) (not e!687998))))

(assert (=> b!1211243 (= res!804589 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38286 _keys!1208))))))

(declare-fun bm!59567 () Bool)

(declare-fun call!59566 () ListLongMap!17779)

(assert (=> bm!59567 (= call!59566 call!59570)))

(declare-fun b!1211244 () Bool)

(declare-fun e!688013 () Bool)

(assert (=> b!1211244 (= e!688013 e!688002)))

(declare-fun res!804596 () Bool)

(assert (=> b!1211244 (=> res!804596 e!688002)))

(assert (=> b!1211244 (= res!804596 (not (= (select (arr!37749 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211244 e!688003))

(declare-fun c!119557 () Bool)

(assert (=> b!1211244 (= c!119557 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549768 () Unit!40056)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1052 (array!78237 array!78239 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40056)

(assert (=> b!1211244 (= lt!549768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59568 () Bool)

(assert (=> bm!59568 (= call!59568 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211245 () Bool)

(declare-fun -!1834 (ListLongMap!17779 (_ BitVec 64)) ListLongMap!17779)

(assert (=> b!1211245 (= e!688003 (= call!59571 (-!1834 call!59568 k0!934)))))

(declare-fun b!1211246 () Bool)

(declare-fun res!804590 () Bool)

(assert (=> b!1211246 (=> (not res!804590) (not e!687998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211246 (= res!804590 (validKeyInArray!0 k0!934))))

(declare-fun b!1211247 () Bool)

(declare-fun arrayContainsKey!0 (array!78237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211247 (= e!688011 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211248 () Bool)

(assert (=> b!1211248 (= c!119558 (and (not lt!549756) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688004 () Unit!40056)

(assert (=> b!1211248 (= e!688009 e!688004)))

(declare-fun b!1211249 () Bool)

(declare-fun res!804591 () Bool)

(assert (=> b!1211249 (=> (not res!804591) (not e!687998))))

(assert (=> b!1211249 (= res!804591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211250 () Bool)

(declare-fun e!688010 () Bool)

(declare-fun e!688001 () Bool)

(assert (=> b!1211250 (= e!688010 (and e!688001 mapRes!47932))))

(declare-fun condMapEmpty!47932 () Bool)

(declare-fun mapDefault!47932 () ValueCell!14645)

(assert (=> b!1211250 (= condMapEmpty!47932 (= (arr!37750 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14645)) mapDefault!47932)))))

(declare-fun b!1211251 () Bool)

(declare-fun res!804592 () Bool)

(assert (=> b!1211251 (=> (not res!804592) (not e!687998))))

(assert (=> b!1211251 (= res!804592 (and (= (size!38287 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38286 _keys!1208) (size!38287 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211252 () Bool)

(declare-fun e!688012 () Bool)

(assert (=> b!1211252 (= e!688012 e!688013)))

(declare-fun res!804586 () Bool)

(assert (=> b!1211252 (=> res!804586 e!688013)))

(assert (=> b!1211252 (= res!804586 (not (= from!1455 i!673)))))

(declare-fun lt!549760 () ListLongMap!17779)

(assert (=> b!1211252 (= lt!549760 (getCurrentListMapNoExtraKeys!5365 lt!549758 lt!549757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3284 (Int (_ BitVec 64)) V!46073)

(assert (=> b!1211252 (= lt!549757 (array!78240 (store (arr!37750 _values!996) i!673 (ValueCellFull!14645 (dynLambda!3284 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38287 _values!996)))))

(declare-fun lt!549761 () ListLongMap!17779)

(assert (=> b!1211252 (= lt!549761 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211253 () Bool)

(assert (=> b!1211253 (= e!688004 e!688005)))

(declare-fun c!119560 () Bool)

(assert (=> b!1211253 (= c!119560 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549756))))

(declare-fun b!1211254 () Bool)

(declare-fun lt!549752 () Unit!40056)

(assert (=> b!1211254 (= e!688004 lt!549752)))

(assert (=> b!1211254 (= lt!549752 call!59573)))

(assert (=> b!1211254 call!59569))

(declare-fun b!1211237 () Bool)

(declare-fun res!804585 () Bool)

(assert (=> b!1211237 (=> (not res!804585) (not e!687998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211237 (= res!804585 (validMask!0 mask!1564))))

(declare-fun res!804588 () Bool)

(assert (=> start!101242 (=> (not res!804588) (not e!687998))))

(assert (=> start!101242 (= res!804588 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38286 _keys!1208))))))

(assert (=> start!101242 e!687998))

(assert (=> start!101242 tp_is_empty!30709))

(declare-fun array_inv!28816 (array!78237) Bool)

(assert (=> start!101242 (array_inv!28816 _keys!1208)))

(assert (=> start!101242 true))

(assert (=> start!101242 tp!91030))

(declare-fun array_inv!28817 (array!78239) Bool)

(assert (=> start!101242 (and (array_inv!28817 _values!996) e!688010)))

(declare-fun b!1211255 () Bool)

(assert (=> b!1211255 (= e!688006 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549756) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211256 () Bool)

(assert (=> b!1211256 call!59569))

(declare-fun lt!549766 () Unit!40056)

(assert (=> b!1211256 (= lt!549766 call!59573)))

(assert (=> b!1211256 (= e!688005 lt!549766)))

(declare-fun b!1211257 () Bool)

(declare-fun res!804584 () Bool)

(assert (=> b!1211257 (=> (not res!804584) (not e!688008))))

(assert (=> b!1211257 (= res!804584 (arrayNoDuplicates!0 lt!549758 #b00000000000000000000000000000000 Nil!26605))))

(declare-fun bm!59569 () Bool)

(assert (=> bm!59569 (= call!59572 (contains!6998 (ite c!119555 lt!549755 call!59566) k0!934))))

(declare-fun b!1211258 () Bool)

(assert (=> b!1211258 (= e!688008 (not e!688012))))

(declare-fun res!804587 () Bool)

(assert (=> b!1211258 (=> res!804587 e!688012)))

(assert (=> b!1211258 (= res!804587 (bvsgt from!1455 i!673))))

(assert (=> b!1211258 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549765 () Unit!40056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78237 (_ BitVec 64) (_ BitVec 32)) Unit!40056)

(assert (=> b!1211258 (= lt!549765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211259 () Bool)

(assert (=> b!1211259 (= e!688006 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211260 () Bool)

(declare-fun res!804593 () Bool)

(assert (=> b!1211260 (=> (not res!804593) (not e!687998))))

(assert (=> b!1211260 (= res!804593 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26605))))

(declare-fun b!1211261 () Bool)

(declare-fun res!804595 () Bool)

(assert (=> b!1211261 (=> (not res!804595) (not e!687998))))

(assert (=> b!1211261 (= res!804595 (= (select (arr!37749 _keys!1208) i!673) k0!934))))

(declare-fun bm!59570 () Bool)

(assert (=> bm!59570 (= call!59570 (+!4066 lt!549764 (ite (or c!119555 c!119558) (tuple2!19803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211262 () Bool)

(assert (=> b!1211262 (= e!688001 tp_is_empty!30709)))

(assert (= (and start!101242 res!804588) b!1211237))

(assert (= (and b!1211237 res!804585) b!1211251))

(assert (= (and b!1211251 res!804592) b!1211249))

(assert (= (and b!1211249 res!804591) b!1211260))

(assert (= (and b!1211260 res!804593) b!1211243))

(assert (= (and b!1211243 res!804589) b!1211246))

(assert (= (and b!1211246 res!804590) b!1211261))

(assert (= (and b!1211261 res!804595) b!1211242))

(assert (= (and b!1211242 res!804583) b!1211257))

(assert (= (and b!1211257 res!804584) b!1211258))

(assert (= (and b!1211258 (not res!804587)) b!1211252))

(assert (= (and b!1211252 (not res!804586)) b!1211244))

(assert (= (and b!1211244 c!119557) b!1211245))

(assert (= (and b!1211244 (not c!119557)) b!1211234))

(assert (= (or b!1211245 b!1211234) bm!59566))

(assert (= (or b!1211245 b!1211234) bm!59568))

(assert (= (and b!1211244 (not res!804596)) b!1211238))

(assert (= (and b!1211238 c!119559) b!1211235))

(assert (= (and b!1211238 (not c!119559)) b!1211241))

(assert (= (and b!1211235 c!119555) b!1211239))

(assert (= (and b!1211235 (not c!119555)) b!1211248))

(assert (= (and b!1211248 c!119558) b!1211254))

(assert (= (and b!1211248 (not c!119558)) b!1211253))

(assert (= (and b!1211253 c!119560) b!1211256))

(assert (= (and b!1211253 (not c!119560)) b!1211240))

(assert (= (or b!1211254 b!1211256) bm!59565))

(assert (= (or b!1211254 b!1211256) bm!59567))

(assert (= (or b!1211254 b!1211256) bm!59563))

(assert (= (or b!1211239 bm!59563) bm!59569))

(assert (= (or b!1211239 bm!59565) bm!59564))

(assert (= (or b!1211239 bm!59567) bm!59570))

(assert (= (and b!1211235 c!119556) b!1211259))

(assert (= (and b!1211235 (not c!119556)) b!1211255))

(assert (= (and b!1211235 res!804594) b!1211247))

(assert (= (and b!1211250 condMapEmpty!47932) mapIsEmpty!47932))

(assert (= (and b!1211250 (not condMapEmpty!47932)) mapNonEmpty!47932))

(get-info :version)

(assert (= (and mapNonEmpty!47932 ((_ is ValueCellFull!14645) mapValue!47932)) b!1211236))

(assert (= (and b!1211250 ((_ is ValueCellFull!14645) mapDefault!47932)) b!1211262))

(assert (= start!101242 b!1211250))

(declare-fun b_lambda!21599 () Bool)

(assert (=> (not b_lambda!21599) (not b!1211252)))

(declare-fun t!39583 () Bool)

(declare-fun tb!10797 () Bool)

(assert (=> (and start!101242 (= defaultEntry!1004 defaultEntry!1004) t!39583) tb!10797))

(declare-fun result!22195 () Bool)

(assert (=> tb!10797 (= result!22195 tp_is_empty!30709)))

(assert (=> b!1211252 t!39583))

(declare-fun b_and!43095 () Bool)

(assert (= b_and!43093 (and (=> t!39583 result!22195) b_and!43095)))

(declare-fun m!1117137 () Bool)

(assert (=> b!1211257 m!1117137))

(declare-fun m!1117139 () Bool)

(assert (=> start!101242 m!1117139))

(declare-fun m!1117141 () Bool)

(assert (=> start!101242 m!1117141))

(declare-fun m!1117143 () Bool)

(assert (=> b!1211239 m!1117143))

(assert (=> b!1211239 m!1117143))

(declare-fun m!1117145 () Bool)

(assert (=> b!1211239 m!1117145))

(declare-fun m!1117147 () Bool)

(assert (=> b!1211239 m!1117147))

(declare-fun m!1117149 () Bool)

(assert (=> bm!59568 m!1117149))

(declare-fun m!1117151 () Bool)

(assert (=> b!1211252 m!1117151))

(declare-fun m!1117153 () Bool)

(assert (=> b!1211252 m!1117153))

(declare-fun m!1117155 () Bool)

(assert (=> b!1211252 m!1117155))

(declare-fun m!1117157 () Bool)

(assert (=> b!1211252 m!1117157))

(declare-fun m!1117159 () Bool)

(assert (=> b!1211244 m!1117159))

(declare-fun m!1117161 () Bool)

(assert (=> b!1211244 m!1117161))

(declare-fun m!1117163 () Bool)

(assert (=> b!1211249 m!1117163))

(declare-fun m!1117165 () Bool)

(assert (=> b!1211258 m!1117165))

(declare-fun m!1117167 () Bool)

(assert (=> b!1211258 m!1117167))

(declare-fun m!1117169 () Bool)

(assert (=> bm!59564 m!1117169))

(declare-fun m!1117171 () Bool)

(assert (=> b!1211246 m!1117171))

(declare-fun m!1117173 () Bool)

(assert (=> b!1211235 m!1117173))

(declare-fun m!1117175 () Bool)

(assert (=> b!1211235 m!1117175))

(declare-fun m!1117177 () Bool)

(assert (=> b!1211235 m!1117177))

(declare-fun m!1117179 () Bool)

(assert (=> b!1211235 m!1117179))

(declare-fun m!1117181 () Bool)

(assert (=> b!1211260 m!1117181))

(declare-fun m!1117183 () Bool)

(assert (=> b!1211242 m!1117183))

(declare-fun m!1117185 () Bool)

(assert (=> b!1211242 m!1117185))

(declare-fun m!1117187 () Bool)

(assert (=> bm!59566 m!1117187))

(declare-fun m!1117189 () Bool)

(assert (=> b!1211247 m!1117189))

(assert (=> b!1211259 m!1117189))

(declare-fun m!1117191 () Bool)

(assert (=> mapNonEmpty!47932 m!1117191))

(declare-fun m!1117193 () Bool)

(assert (=> bm!59569 m!1117193))

(declare-fun m!1117195 () Bool)

(assert (=> b!1211245 m!1117195))

(declare-fun m!1117197 () Bool)

(assert (=> b!1211237 m!1117197))

(declare-fun m!1117199 () Bool)

(assert (=> bm!59570 m!1117199))

(declare-fun m!1117201 () Bool)

(assert (=> b!1211238 m!1117201))

(assert (=> b!1211238 m!1117149))

(declare-fun m!1117203 () Bool)

(assert (=> b!1211261 m!1117203))

(check-sat (not b!1211235) (not b!1211258) (not b!1211237) (not b!1211249) (not b!1211245) (not b!1211246) (not b_next!26005) (not b!1211239) (not mapNonEmpty!47932) (not bm!59564) (not bm!59566) (not b!1211242) tp_is_empty!30709 (not b!1211260) (not bm!59570) (not b!1211244) b_and!43095 (not start!101242) (not b_lambda!21599) (not b!1211252) (not b!1211238) (not bm!59568) (not b!1211257) (not bm!59569) (not b!1211259) (not b!1211247))
(check-sat b_and!43095 (not b_next!26005))
