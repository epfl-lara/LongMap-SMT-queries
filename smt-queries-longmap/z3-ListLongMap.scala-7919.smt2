; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98348 () Bool)

(assert start!98348)

(declare-fun b_free!23959 () Bool)

(declare-fun b_next!23959 () Bool)

(assert (=> start!98348 (= b_free!23959 (not b_next!23959))))

(declare-fun tp!84587 () Bool)

(declare-fun b_and!38745 () Bool)

(assert (=> start!98348 (= tp!84587 b_and!38745)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1133223 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!644938 () Bool)

(declare-fun lt!503452 () Bool)

(assert (=> b!1133223 (= e!644938 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503452) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49024 () Bool)

(declare-datatypes ((Unit!36976 0))(
  ( (Unit!36977) )
))
(declare-fun call!49031 () Unit!36976)

(declare-fun call!49029 () Unit!36976)

(assert (=> bm!49024 (= call!49031 call!49029)))

(declare-fun res!756688 () Bool)

(declare-fun e!644950 () Bool)

(assert (=> start!98348 (=> (not res!756688) (not e!644950))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73762 0))(
  ( (array!73763 (arr!35532 (Array (_ BitVec 32) (_ BitVec 64))) (size!36070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73762)

(assert (=> start!98348 (= res!756688 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36070 _keys!1208))))))

(assert (=> start!98348 e!644950))

(declare-fun tp_is_empty!28489 () Bool)

(assert (=> start!98348 tp_is_empty!28489))

(declare-fun array_inv!27324 (array!73762) Bool)

(assert (=> start!98348 (array_inv!27324 _keys!1208)))

(assert (=> start!98348 true))

(assert (=> start!98348 tp!84587))

(declare-datatypes ((V!43113 0))(
  ( (V!43114 (val!14301 Int)) )
))
(declare-datatypes ((ValueCell!13535 0))(
  ( (ValueCellFull!13535 (v!16937 V!43113)) (EmptyCell!13535) )
))
(declare-datatypes ((array!73764 0))(
  ( (array!73765 (arr!35533 (Array (_ BitVec 32) ValueCell!13535)) (size!36071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73764)

(declare-fun e!644940 () Bool)

(declare-fun array_inv!27325 (array!73764) Bool)

(assert (=> start!98348 (and (array_inv!27325 _values!996) e!644940)))

(declare-fun zeroValue!944 () V!43113)

(declare-fun bm!49025 () Bool)

(declare-datatypes ((tuple2!18120 0))(
  ( (tuple2!18121 (_1!9071 (_ BitVec 64)) (_2!9071 V!43113)) )
))
(declare-datatypes ((List!24866 0))(
  ( (Nil!24863) (Cons!24862 (h!26071 tuple2!18120) (t!35808 List!24866)) )
))
(declare-datatypes ((ListLongMap!16089 0))(
  ( (ListLongMap!16090 (toList!8060 List!24866)) )
))
(declare-fun call!49033 () ListLongMap!16089)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!503443 () array!73764)

(declare-fun lt!503453 () array!73762)

(declare-fun minValue!944 () V!43113)

(declare-fun getCurrentListMapNoExtraKeys!4558 (array!73762 array!73764 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 32) Int) ListLongMap!16089)

(assert (=> bm!49025 (= call!49033 (getCurrentListMapNoExtraKeys!4558 lt!503453 lt!503443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49026 () Bool)

(declare-fun call!49034 () Bool)

(declare-fun call!49028 () Bool)

(assert (=> bm!49026 (= call!49034 call!49028)))

(declare-fun b!1133224 () Bool)

(declare-fun c!110570 () Bool)

(assert (=> b!1133224 (= c!110570 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503452))))

(declare-fun e!644949 () Unit!36976)

(declare-fun e!644943 () Unit!36976)

(assert (=> b!1133224 (= e!644949 e!644943)))

(declare-fun b!1133225 () Bool)

(declare-fun res!756697 () Bool)

(assert (=> b!1133225 (=> (not res!756697) (not e!644950))))

(declare-datatypes ((List!24867 0))(
  ( (Nil!24864) (Cons!24863 (h!26072 (_ BitVec 64)) (t!35809 List!24867)) )
))
(declare-fun arrayNoDuplicates!0 (array!73762 (_ BitVec 32) List!24867) Bool)

(assert (=> b!1133225 (= res!756697 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24864))))

(declare-fun b!1133226 () Bool)

(declare-fun e!644945 () Bool)

(assert (=> b!1133226 (= e!644950 e!644945)))

(declare-fun res!756696 () Bool)

(assert (=> b!1133226 (=> (not res!756696) (not e!644945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73762 (_ BitVec 32)) Bool)

(assert (=> b!1133226 (= res!756696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503453 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133226 (= lt!503453 (array!73763 (store (arr!35532 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36070 _keys!1208)))))

(declare-fun b!1133227 () Bool)

(declare-fun res!756694 () Bool)

(assert (=> b!1133227 (=> (not res!756694) (not e!644950))))

(assert (=> b!1133227 (= res!756694 (= (select (arr!35532 _keys!1208) i!673) k0!934))))

(declare-fun c!110573 () Bool)

(declare-fun c!110572 () Bool)

(declare-fun lt!503455 () ListLongMap!16089)

(declare-fun bm!49027 () Bool)

(declare-fun call!49027 () ListLongMap!16089)

(declare-fun +!3494 (ListLongMap!16089 tuple2!18120) ListLongMap!16089)

(assert (=> bm!49027 (= call!49027 (+!3494 lt!503455 (ite (or c!110573 c!110572) (tuple2!18121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133228 () Bool)

(declare-fun Unit!36978 () Unit!36976)

(assert (=> b!1133228 (= e!644943 Unit!36978)))

(declare-fun b!1133229 () Bool)

(assert (=> b!1133229 call!49034))

(declare-fun lt!503447 () Unit!36976)

(assert (=> b!1133229 (= lt!503447 call!49031)))

(assert (=> b!1133229 (= e!644949 lt!503447)))

(declare-fun call!49032 () ListLongMap!16089)

(declare-fun bm!49028 () Bool)

(assert (=> bm!49028 (= call!49032 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133230 () Bool)

(declare-fun e!644941 () Unit!36976)

(assert (=> b!1133230 (= e!644941 e!644949)))

(assert (=> b!1133230 (= c!110572 (and (not lt!503452) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133231 () Bool)

(declare-fun res!756691 () Bool)

(assert (=> b!1133231 (=> (not res!756691) (not e!644950))))

(assert (=> b!1133231 (= res!756691 (and (= (size!36071 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36070 _keys!1208) (size!36071 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1133232 () Bool)

(declare-fun res!756687 () Bool)

(assert (=> b!1133232 (=> (not res!756687) (not e!644950))))

(assert (=> b!1133232 (= res!756687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!49030 () ListLongMap!16089)

(declare-fun lt!503449 () ListLongMap!16089)

(declare-fun bm!49029 () Bool)

(declare-fun contains!6514 (ListLongMap!16089 (_ BitVec 64)) Bool)

(assert (=> bm!49029 (= call!49028 (contains!6514 (ite c!110573 lt!503449 call!49030) k0!934))))

(declare-fun b!1133233 () Bool)

(declare-fun e!644948 () Bool)

(assert (=> b!1133233 (= e!644948 true)))

(declare-fun e!644947 () Bool)

(assert (=> b!1133233 e!644947))

(declare-fun res!756699 () Bool)

(assert (=> b!1133233 (=> (not res!756699) (not e!644947))))

(assert (=> b!1133233 (= res!756699 e!644938)))

(declare-fun c!110569 () Bool)

(assert (=> b!1133233 (= c!110569 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503454 () Unit!36976)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!326 (array!73762 array!73764 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 64) (_ BitVec 32) Int) Unit!36976)

(assert (=> b!1133233 (= lt!503454 (lemmaListMapContainsThenArrayContainsFrom!326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503448 () Unit!36976)

(assert (=> b!1133233 (= lt!503448 e!644941)))

(assert (=> b!1133233 (= c!110573 (and (not lt!503452) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133233 (= lt!503452 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133234 () Bool)

(declare-fun arrayContainsKey!0 (array!73762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133234 (= e!644938 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133235 () Bool)

(declare-fun e!644951 () Bool)

(assert (=> b!1133235 (= e!644945 (not e!644951))))

(declare-fun res!756701 () Bool)

(assert (=> b!1133235 (=> res!756701 e!644951)))

(assert (=> b!1133235 (= res!756701 (bvsgt from!1455 i!673))))

(assert (=> b!1133235 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503456 () Unit!36976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73762 (_ BitVec 64) (_ BitVec 32)) Unit!36976)

(assert (=> b!1133235 (= lt!503456 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1133236 () Bool)

(declare-fun lt!503450 () Unit!36976)

(assert (=> b!1133236 (= e!644943 lt!503450)))

(assert (=> b!1133236 (= lt!503450 call!49031)))

(assert (=> b!1133236 call!49034))

(declare-fun b!1133237 () Bool)

(declare-fun e!644939 () Bool)

(assert (=> b!1133237 (= e!644939 e!644948)))

(declare-fun res!756700 () Bool)

(assert (=> b!1133237 (=> res!756700 e!644948)))

(assert (=> b!1133237 (= res!756700 (not (contains!6514 lt!503455 k0!934)))))

(assert (=> b!1133237 (= lt!503455 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44558 () Bool)

(declare-fun mapRes!44558 () Bool)

(declare-fun tp!84588 () Bool)

(declare-fun e!644942 () Bool)

(assert (=> mapNonEmpty!44558 (= mapRes!44558 (and tp!84588 e!644942))))

(declare-fun mapRest!44558 () (Array (_ BitVec 32) ValueCell!13535))

(declare-fun mapValue!44558 () ValueCell!13535)

(declare-fun mapKey!44558 () (_ BitVec 32))

(assert (=> mapNonEmpty!44558 (= (arr!35533 _values!996) (store mapRest!44558 mapKey!44558 mapValue!44558))))

(declare-fun b!1133238 () Bool)

(declare-fun res!756698 () Bool)

(assert (=> b!1133238 (=> (not res!756698) (not e!644950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133238 (= res!756698 (validKeyInArray!0 k0!934))))

(declare-fun b!1133239 () Bool)

(declare-fun e!644944 () Bool)

(assert (=> b!1133239 (= e!644944 tp_is_empty!28489)))

(declare-fun b!1133240 () Bool)

(declare-fun e!644952 () Bool)

(declare-fun -!1162 (ListLongMap!16089 (_ BitVec 64)) ListLongMap!16089)

(assert (=> b!1133240 (= e!644952 (= call!49033 (-!1162 call!49032 k0!934)))))

(declare-fun b!1133241 () Bool)

(assert (=> b!1133241 (= e!644947 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133242 () Bool)

(assert (=> b!1133242 (= e!644940 (and e!644944 mapRes!44558))))

(declare-fun condMapEmpty!44558 () Bool)

(declare-fun mapDefault!44558 () ValueCell!13535)

(assert (=> b!1133242 (= condMapEmpty!44558 (= (arr!35533 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13535)) mapDefault!44558)))))

(declare-fun mapIsEmpty!44558 () Bool)

(assert (=> mapIsEmpty!44558 mapRes!44558))

(declare-fun b!1133243 () Bool)

(declare-fun res!756692 () Bool)

(assert (=> b!1133243 (=> (not res!756692) (not e!644945))))

(assert (=> b!1133243 (= res!756692 (arrayNoDuplicates!0 lt!503453 #b00000000000000000000000000000000 Nil!24864))))

(declare-fun b!1133244 () Bool)

(declare-fun res!756693 () Bool)

(assert (=> b!1133244 (=> (not res!756693) (not e!644950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133244 (= res!756693 (validMask!0 mask!1564))))

(declare-fun bm!49030 () Bool)

(declare-fun addStillContains!712 (ListLongMap!16089 (_ BitVec 64) V!43113 (_ BitVec 64)) Unit!36976)

(assert (=> bm!49030 (= call!49029 (addStillContains!712 (ite c!110573 lt!503449 lt!503455) (ite c!110573 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110572 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110573 minValue!944 (ite c!110572 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133245 () Bool)

(assert (=> b!1133245 (= e!644952 (= call!49033 call!49032))))

(declare-fun b!1133246 () Bool)

(declare-fun e!644946 () Bool)

(assert (=> b!1133246 (= e!644946 e!644939)))

(declare-fun res!756690 () Bool)

(assert (=> b!1133246 (=> res!756690 e!644939)))

(assert (=> b!1133246 (= res!756690 (not (= (select (arr!35532 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1133246 e!644952))

(declare-fun c!110571 () Bool)

(assert (=> b!1133246 (= c!110571 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503445 () Unit!36976)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!446 (array!73762 array!73764 (_ BitVec 32) (_ BitVec 32) V!43113 V!43113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36976)

(assert (=> b!1133246 (= lt!503445 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133247 () Bool)

(assert (=> b!1133247 (= e!644942 tp_is_empty!28489)))

(declare-fun b!1133248 () Bool)

(assert (=> b!1133248 (= e!644951 e!644946)))

(declare-fun res!756689 () Bool)

(assert (=> b!1133248 (=> res!756689 e!644946)))

(assert (=> b!1133248 (= res!756689 (not (= from!1455 i!673)))))

(declare-fun lt!503451 () ListLongMap!16089)

(assert (=> b!1133248 (= lt!503451 (getCurrentListMapNoExtraKeys!4558 lt!503453 lt!503443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2557 (Int (_ BitVec 64)) V!43113)

(assert (=> b!1133248 (= lt!503443 (array!73765 (store (arr!35533 _values!996) i!673 (ValueCellFull!13535 (dynLambda!2557 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36071 _values!996)))))

(declare-fun lt!503444 () ListLongMap!16089)

(assert (=> b!1133248 (= lt!503444 (getCurrentListMapNoExtraKeys!4558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133249 () Bool)

(declare-fun res!756695 () Bool)

(assert (=> b!1133249 (=> (not res!756695) (not e!644950))))

(assert (=> b!1133249 (= res!756695 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36070 _keys!1208))))))

(declare-fun bm!49031 () Bool)

(assert (=> bm!49031 (= call!49030 call!49027)))

(declare-fun b!1133250 () Bool)

(declare-fun lt!503457 () Unit!36976)

(assert (=> b!1133250 (= e!644941 lt!503457)))

(declare-fun lt!503446 () Unit!36976)

(assert (=> b!1133250 (= lt!503446 (addStillContains!712 lt!503455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1133250 (= lt!503449 call!49027)))

(assert (=> b!1133250 call!49028))

(assert (=> b!1133250 (= lt!503457 call!49029)))

(assert (=> b!1133250 (contains!6514 (+!3494 lt!503449 (tuple2!18121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (= (and start!98348 res!756688) b!1133244))

(assert (= (and b!1133244 res!756693) b!1133231))

(assert (= (and b!1133231 res!756691) b!1133232))

(assert (= (and b!1133232 res!756687) b!1133225))

(assert (= (and b!1133225 res!756697) b!1133249))

(assert (= (and b!1133249 res!756695) b!1133238))

(assert (= (and b!1133238 res!756698) b!1133227))

(assert (= (and b!1133227 res!756694) b!1133226))

(assert (= (and b!1133226 res!756696) b!1133243))

(assert (= (and b!1133243 res!756692) b!1133235))

(assert (= (and b!1133235 (not res!756701)) b!1133248))

(assert (= (and b!1133248 (not res!756689)) b!1133246))

(assert (= (and b!1133246 c!110571) b!1133240))

(assert (= (and b!1133246 (not c!110571)) b!1133245))

(assert (= (or b!1133240 b!1133245) bm!49025))

(assert (= (or b!1133240 b!1133245) bm!49028))

(assert (= (and b!1133246 (not res!756690)) b!1133237))

(assert (= (and b!1133237 (not res!756700)) b!1133233))

(assert (= (and b!1133233 c!110573) b!1133250))

(assert (= (and b!1133233 (not c!110573)) b!1133230))

(assert (= (and b!1133230 c!110572) b!1133229))

(assert (= (and b!1133230 (not c!110572)) b!1133224))

(assert (= (and b!1133224 c!110570) b!1133236))

(assert (= (and b!1133224 (not c!110570)) b!1133228))

(assert (= (or b!1133229 b!1133236) bm!49024))

(assert (= (or b!1133229 b!1133236) bm!49031))

(assert (= (or b!1133229 b!1133236) bm!49026))

(assert (= (or b!1133250 bm!49026) bm!49029))

(assert (= (or b!1133250 bm!49024) bm!49030))

(assert (= (or b!1133250 bm!49031) bm!49027))

(assert (= (and b!1133233 c!110569) b!1133234))

(assert (= (and b!1133233 (not c!110569)) b!1133223))

(assert (= (and b!1133233 res!756699) b!1133241))

(assert (= (and b!1133242 condMapEmpty!44558) mapIsEmpty!44558))

(assert (= (and b!1133242 (not condMapEmpty!44558)) mapNonEmpty!44558))

(get-info :version)

(assert (= (and mapNonEmpty!44558 ((_ is ValueCellFull!13535) mapValue!44558)) b!1133247))

(assert (= (and b!1133242 ((_ is ValueCellFull!13535) mapDefault!44558)) b!1133239))

(assert (= start!98348 b!1133242))

(declare-fun b_lambda!19047 () Bool)

(assert (=> (not b_lambda!19047) (not b!1133248)))

(declare-fun t!35807 () Bool)

(declare-fun tb!8763 () Bool)

(assert (=> (and start!98348 (= defaultEntry!1004 defaultEntry!1004) t!35807) tb!8763))

(declare-fun result!18099 () Bool)

(assert (=> tb!8763 (= result!18099 tp_is_empty!28489)))

(assert (=> b!1133248 t!35807))

(declare-fun b_and!38747 () Bool)

(assert (= b_and!38745 (and (=> t!35807 result!18099) b_and!38747)))

(declare-fun m!1045849 () Bool)

(assert (=> b!1133241 m!1045849))

(declare-fun m!1045851 () Bool)

(assert (=> b!1133237 m!1045851))

(declare-fun m!1045853 () Bool)

(assert (=> b!1133237 m!1045853))

(declare-fun m!1045855 () Bool)

(assert (=> b!1133225 m!1045855))

(declare-fun m!1045857 () Bool)

(assert (=> bm!49025 m!1045857))

(declare-fun m!1045859 () Bool)

(assert (=> b!1133227 m!1045859))

(declare-fun m!1045861 () Bool)

(assert (=> bm!49030 m!1045861))

(declare-fun m!1045863 () Bool)

(assert (=> b!1133235 m!1045863))

(declare-fun m!1045865 () Bool)

(assert (=> b!1133235 m!1045865))

(declare-fun m!1045867 () Bool)

(assert (=> start!98348 m!1045867))

(declare-fun m!1045869 () Bool)

(assert (=> start!98348 m!1045869))

(declare-fun m!1045871 () Bool)

(assert (=> b!1133238 m!1045871))

(declare-fun m!1045873 () Bool)

(assert (=> b!1133244 m!1045873))

(declare-fun m!1045875 () Bool)

(assert (=> mapNonEmpty!44558 m!1045875))

(assert (=> bm!49028 m!1045853))

(declare-fun m!1045877 () Bool)

(assert (=> b!1133248 m!1045877))

(declare-fun m!1045879 () Bool)

(assert (=> b!1133248 m!1045879))

(declare-fun m!1045881 () Bool)

(assert (=> b!1133248 m!1045881))

(declare-fun m!1045883 () Bool)

(assert (=> b!1133248 m!1045883))

(declare-fun m!1045885 () Bool)

(assert (=> b!1133250 m!1045885))

(declare-fun m!1045887 () Bool)

(assert (=> b!1133250 m!1045887))

(assert (=> b!1133250 m!1045887))

(declare-fun m!1045889 () Bool)

(assert (=> b!1133250 m!1045889))

(declare-fun m!1045891 () Bool)

(assert (=> bm!49027 m!1045891))

(declare-fun m!1045893 () Bool)

(assert (=> b!1133243 m!1045893))

(declare-fun m!1045895 () Bool)

(assert (=> bm!49029 m!1045895))

(declare-fun m!1045897 () Bool)

(assert (=> b!1133232 m!1045897))

(declare-fun m!1045899 () Bool)

(assert (=> b!1133226 m!1045899))

(declare-fun m!1045901 () Bool)

(assert (=> b!1133226 m!1045901))

(declare-fun m!1045903 () Bool)

(assert (=> b!1133246 m!1045903))

(declare-fun m!1045905 () Bool)

(assert (=> b!1133246 m!1045905))

(declare-fun m!1045907 () Bool)

(assert (=> b!1133233 m!1045907))

(declare-fun m!1045909 () Bool)

(assert (=> b!1133240 m!1045909))

(assert (=> b!1133234 m!1045849))

(check-sat (not start!98348) (not b!1133234) (not bm!49027) (not mapNonEmpty!44558) (not b!1133225) (not b!1133226) (not b!1133250) (not b_lambda!19047) (not b!1133241) (not b!1133246) (not b!1133233) (not b!1133243) (not b!1133232) (not b!1133244) (not b!1133235) (not bm!49028) b_and!38747 (not bm!49025) (not b_next!23959) (not b!1133237) (not bm!49029) tp_is_empty!28489 (not b!1133248) (not bm!49030) (not b!1133240) (not b!1133238))
(check-sat b_and!38747 (not b_next!23959))
