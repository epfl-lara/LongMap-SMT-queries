; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98414 () Bool)

(assert start!98414)

(declare-fun b_free!24025 () Bool)

(declare-fun b_next!24025 () Bool)

(assert (=> start!98414 (= b_free!24025 (not b_next!24025))))

(declare-fun tp!84786 () Bool)

(declare-fun b_and!38877 () Bool)

(assert (=> start!98414 (= tp!84786 b_and!38877)))

(declare-datatypes ((V!43201 0))(
  ( (V!43202 (val!14334 Int)) )
))
(declare-datatypes ((tuple2!18184 0))(
  ( (tuple2!18185 (_1!9103 (_ BitVec 64)) (_2!9103 V!43201)) )
))
(declare-datatypes ((List!24930 0))(
  ( (Nil!24927) (Cons!24926 (h!26135 tuple2!18184) (t!35938 List!24930)) )
))
(declare-datatypes ((ListLongMap!16153 0))(
  ( (ListLongMap!16154 (toList!8092 List!24930)) )
))
(declare-fun lt!505084 () ListLongMap!16153)

(declare-fun c!111065 () Bool)

(declare-fun call!49822 () ListLongMap!16153)

(declare-fun c!111064 () Bool)

(declare-fun minValue!944 () V!43201)

(declare-fun zeroValue!944 () V!43201)

(declare-fun bm!49816 () Bool)

(declare-fun +!3523 (ListLongMap!16153 tuple2!18184) ListLongMap!16153)

(assert (=> bm!49816 (= call!49822 (+!3523 lt!505084 (ite (or c!111064 c!111065) (tuple2!18185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136283 () Bool)

(declare-fun res!758410 () Bool)

(declare-fun e!646597 () Bool)

(assert (=> b!1136283 (=> (not res!758410) (not e!646597))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73894 0))(
  ( (array!73895 (arr!35598 (Array (_ BitVec 32) (_ BitVec 64))) (size!36136 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73894)

(assert (=> b!1136283 (= res!758410 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36136 _keys!1208))))))

(declare-fun b!1136284 () Bool)

(declare-fun res!758405 () Bool)

(declare-fun e!646611 () Bool)

(assert (=> b!1136284 (=> res!758405 e!646611)))

(declare-datatypes ((List!24931 0))(
  ( (Nil!24928) (Cons!24927 (h!26136 (_ BitVec 64)) (t!35939 List!24931)) )
))
(declare-fun noDuplicate!1616 (List!24931) Bool)

(assert (=> b!1136284 (= res!758405 (not (noDuplicate!1616 Nil!24928)))))

(declare-fun b!1136285 () Bool)

(declare-fun res!758409 () Bool)

(assert (=> b!1136285 (=> (not res!758409) (not e!646597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13568 0))(
  ( (ValueCellFull!13568 (v!16970 V!43201)) (EmptyCell!13568) )
))
(declare-datatypes ((array!73896 0))(
  ( (array!73897 (arr!35599 (Array (_ BitVec 32) ValueCell!13568)) (size!36137 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73896)

(assert (=> b!1136285 (= res!758409 (and (= (size!36137 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36136 _keys!1208) (size!36137 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136286 () Bool)

(declare-fun e!646599 () Bool)

(declare-fun tp_is_empty!28555 () Bool)

(assert (=> b!1136286 (= e!646599 tp_is_empty!28555)))

(declare-fun lt!505082 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1136287 () Bool)

(declare-fun e!646600 () Bool)

(assert (=> b!1136287 (= e!646600 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505079 () array!73894)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!505086 () array!73896)

(declare-fun bm!49817 () Bool)

(declare-fun call!49819 () ListLongMap!16153)

(declare-fun getCurrentListMapNoExtraKeys!4588 (array!73894 array!73896 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 32) Int) ListLongMap!16153)

(assert (=> bm!49817 (= call!49819 (getCurrentListMapNoExtraKeys!4588 lt!505079 lt!505086 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136288 () Bool)

(declare-fun arrayContainsKey!0 (array!73894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136288 (= e!646600 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136289 () Bool)

(declare-fun e!646605 () Bool)

(declare-fun e!646609 () Bool)

(assert (=> b!1136289 (= e!646605 (not e!646609))))

(declare-fun res!758396 () Bool)

(assert (=> b!1136289 (=> res!758396 e!646609)))

(assert (=> b!1136289 (= res!758396 (bvsgt from!1455 i!673))))

(assert (=> b!1136289 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37067 0))(
  ( (Unit!37068) )
))
(declare-fun lt!505088 () Unit!37067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73894 (_ BitVec 64) (_ BitVec 32)) Unit!37067)

(assert (=> b!1136289 (= lt!505088 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49818 () Bool)

(declare-fun call!49820 () ListLongMap!16153)

(assert (=> bm!49818 (= call!49820 call!49822)))

(declare-fun b!1136290 () Bool)

(declare-fun call!49824 () Bool)

(assert (=> b!1136290 call!49824))

(declare-fun lt!505090 () Unit!37067)

(declare-fun call!49821 () Unit!37067)

(assert (=> b!1136290 (= lt!505090 call!49821)))

(declare-fun e!646607 () Unit!37067)

(assert (=> b!1136290 (= e!646607 lt!505090)))

(declare-fun mapIsEmpty!44657 () Bool)

(declare-fun mapRes!44657 () Bool)

(assert (=> mapIsEmpty!44657 mapRes!44657))

(declare-fun b!1136291 () Bool)

(declare-fun res!758408 () Bool)

(assert (=> b!1136291 (=> (not res!758408) (not e!646597))))

(declare-fun arrayNoDuplicates!0 (array!73894 (_ BitVec 32) List!24931) Bool)

(assert (=> b!1136291 (= res!758408 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24928))))

(declare-fun b!1136292 () Bool)

(assert (=> b!1136292 (= e!646597 e!646605)))

(declare-fun res!758402 () Bool)

(assert (=> b!1136292 (=> (not res!758402) (not e!646605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73894 (_ BitVec 32)) Bool)

(assert (=> b!1136292 (= res!758402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505079 mask!1564))))

(assert (=> b!1136292 (= lt!505079 (array!73895 (store (arr!35598 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36136 _keys!1208)))))

(declare-fun mapNonEmpty!44657 () Bool)

(declare-fun tp!84785 () Bool)

(declare-fun e!646596 () Bool)

(assert (=> mapNonEmpty!44657 (= mapRes!44657 (and tp!84785 e!646596))))

(declare-fun mapKey!44657 () (_ BitVec 32))

(declare-fun mapRest!44657 () (Array (_ BitVec 32) ValueCell!13568))

(declare-fun mapValue!44657 () ValueCell!13568)

(assert (=> mapNonEmpty!44657 (= (arr!35599 _values!996) (store mapRest!44657 mapKey!44657 mapValue!44657))))

(declare-fun b!1136293 () Bool)

(assert (=> b!1136293 (= e!646611 true)))

(declare-fun lt!505083 () Bool)

(declare-fun contains!6565 (List!24931 (_ BitVec 64)) Bool)

(assert (=> b!1136293 (= lt!505083 (contains!6565 Nil!24928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136294 () Bool)

(declare-fun e!646603 () Unit!37067)

(declare-fun Unit!37069 () Unit!37067)

(assert (=> b!1136294 (= e!646603 Unit!37069)))

(declare-fun b!1136295 () Bool)

(declare-fun e!646595 () Bool)

(declare-fun e!646608 () Bool)

(assert (=> b!1136295 (= e!646595 e!646608)))

(declare-fun res!758411 () Bool)

(assert (=> b!1136295 (=> res!758411 e!646608)))

(assert (=> b!1136295 (= res!758411 (not (= (select (arr!35598 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646598 () Bool)

(assert (=> b!1136295 e!646598))

(declare-fun c!111068 () Bool)

(assert (=> b!1136295 (= c!111068 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505089 () Unit!37067)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 (array!73894 array!73896 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37067)

(assert (=> b!1136295 (= lt!505089 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136296 () Bool)

(declare-fun e!646601 () Bool)

(assert (=> b!1136296 (= e!646601 (and e!646599 mapRes!44657))))

(declare-fun condMapEmpty!44657 () Bool)

(declare-fun mapDefault!44657 () ValueCell!13568)

(assert (=> b!1136296 (= condMapEmpty!44657 (= (arr!35599 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13568)) mapDefault!44657)))))

(declare-fun b!1136297 () Bool)

(assert (=> b!1136297 (= e!646596 tp_is_empty!28555)))

(declare-fun b!1136298 () Bool)

(declare-fun e!646602 () Bool)

(assert (=> b!1136298 (= e!646602 e!646611)))

(declare-fun res!758394 () Bool)

(assert (=> b!1136298 (=> res!758394 e!646611)))

(assert (=> b!1136298 (= res!758394 (or (bvsge (size!36136 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36136 _keys!1208)) (bvsge from!1455 (size!36136 _keys!1208))))))

(assert (=> b!1136298 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24928)))

(declare-fun lt!505080 () Unit!37067)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73894 (_ BitVec 32) (_ BitVec 32)) Unit!37067)

(assert (=> b!1136298 (= lt!505080 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646604 () Bool)

(assert (=> b!1136298 e!646604))

(declare-fun res!758404 () Bool)

(assert (=> b!1136298 (=> (not res!758404) (not e!646604))))

(assert (=> b!1136298 (= res!758404 e!646600)))

(declare-fun c!111067 () Bool)

(assert (=> b!1136298 (= c!111067 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505078 () Unit!37067)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!353 (array!73894 array!73896 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 64) (_ BitVec 32) Int) Unit!37067)

(assert (=> b!1136298 (= lt!505078 (lemmaListMapContainsThenArrayContainsFrom!353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505081 () Unit!37067)

(declare-fun e!646610 () Unit!37067)

(assert (=> b!1136298 (= lt!505081 e!646610)))

(assert (=> b!1136298 (= c!111064 (and (not lt!505082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136298 (= lt!505082 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136299 () Bool)

(declare-fun c!111066 () Bool)

(assert (=> b!1136299 (= c!111066 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505082))))

(assert (=> b!1136299 (= e!646607 e!646603)))

(declare-fun b!1136300 () Bool)

(assert (=> b!1136300 (= e!646608 e!646602)))

(declare-fun res!758401 () Bool)

(assert (=> b!1136300 (=> res!758401 e!646602)))

(declare-fun contains!6566 (ListLongMap!16153 (_ BitVec 64)) Bool)

(assert (=> b!1136300 (= res!758401 (not (contains!6566 lt!505084 k0!934)))))

(assert (=> b!1136300 (= lt!505084 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49819 () Bool)

(declare-fun call!49825 () Unit!37067)

(assert (=> bm!49819 (= call!49821 call!49825)))

(declare-fun res!758406 () Bool)

(assert (=> start!98414 (=> (not res!758406) (not e!646597))))

(assert (=> start!98414 (= res!758406 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36136 _keys!1208))))))

(assert (=> start!98414 e!646597))

(assert (=> start!98414 tp_is_empty!28555))

(declare-fun array_inv!27370 (array!73894) Bool)

(assert (=> start!98414 (array_inv!27370 _keys!1208)))

(assert (=> start!98414 true))

(assert (=> start!98414 tp!84786))

(declare-fun array_inv!27371 (array!73896) Bool)

(assert (=> start!98414 (and (array_inv!27371 _values!996) e!646601)))

(declare-fun call!49826 () ListLongMap!16153)

(declare-fun bm!49820 () Bool)

(assert (=> bm!49820 (= call!49826 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136301 () Bool)

(declare-fun lt!505085 () Unit!37067)

(assert (=> b!1136301 (= e!646603 lt!505085)))

(assert (=> b!1136301 (= lt!505085 call!49821)))

(assert (=> b!1136301 call!49824))

(declare-fun b!1136302 () Bool)

(declare-fun res!758395 () Bool)

(assert (=> b!1136302 (=> (not res!758395) (not e!646597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136302 (= res!758395 (validKeyInArray!0 k0!934))))

(declare-fun bm!49821 () Bool)

(declare-fun call!49823 () Bool)

(assert (=> bm!49821 (= call!49824 call!49823)))

(declare-fun b!1136303 () Bool)

(declare-fun -!1188 (ListLongMap!16153 (_ BitVec 64)) ListLongMap!16153)

(assert (=> b!1136303 (= e!646598 (= call!49819 (-!1188 call!49826 k0!934)))))

(declare-fun b!1136304 () Bool)

(declare-fun res!758399 () Bool)

(assert (=> b!1136304 (=> (not res!758399) (not e!646597))))

(assert (=> b!1136304 (= res!758399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136305 () Bool)

(declare-fun res!758397 () Bool)

(assert (=> b!1136305 (=> res!758397 e!646611)))

(assert (=> b!1136305 (= res!758397 (contains!6565 Nil!24928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136306 () Bool)

(assert (=> b!1136306 (= e!646598 (= call!49819 call!49826))))

(declare-fun bm!49822 () Bool)

(declare-fun lt!505077 () ListLongMap!16153)

(declare-fun addStillContains!741 (ListLongMap!16153 (_ BitVec 64) V!43201 (_ BitVec 64)) Unit!37067)

(assert (=> bm!49822 (= call!49825 (addStillContains!741 (ite c!111064 lt!505077 lt!505084) (ite c!111064 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111065 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111064 minValue!944 (ite c!111065 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1136307 () Bool)

(declare-fun res!758400 () Bool)

(assert (=> b!1136307 (=> (not res!758400) (not e!646597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136307 (= res!758400 (validMask!0 mask!1564))))

(declare-fun b!1136308 () Bool)

(declare-fun res!758398 () Bool)

(assert (=> b!1136308 (=> (not res!758398) (not e!646605))))

(assert (=> b!1136308 (= res!758398 (arrayNoDuplicates!0 lt!505079 #b00000000000000000000000000000000 Nil!24928))))

(declare-fun b!1136309 () Bool)

(assert (=> b!1136309 (= e!646604 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49823 () Bool)

(assert (=> bm!49823 (= call!49823 (contains!6566 (ite c!111064 lt!505077 call!49820) k0!934))))

(declare-fun b!1136310 () Bool)

(declare-fun res!758403 () Bool)

(assert (=> b!1136310 (=> (not res!758403) (not e!646597))))

(assert (=> b!1136310 (= res!758403 (= (select (arr!35598 _keys!1208) i!673) k0!934))))

(declare-fun b!1136311 () Bool)

(declare-fun lt!505091 () Unit!37067)

(assert (=> b!1136311 (= e!646610 lt!505091)))

(declare-fun lt!505092 () Unit!37067)

(assert (=> b!1136311 (= lt!505092 (addStillContains!741 lt!505084 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1136311 (= lt!505077 call!49822)))

(assert (=> b!1136311 call!49823))

(assert (=> b!1136311 (= lt!505091 call!49825)))

(assert (=> b!1136311 (contains!6566 (+!3523 lt!505077 (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1136312 () Bool)

(assert (=> b!1136312 (= e!646610 e!646607)))

(assert (=> b!1136312 (= c!111065 (and (not lt!505082) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136313 () Bool)

(assert (=> b!1136313 (= e!646609 e!646595)))

(declare-fun res!758407 () Bool)

(assert (=> b!1136313 (=> res!758407 e!646595)))

(assert (=> b!1136313 (= res!758407 (not (= from!1455 i!673)))))

(declare-fun lt!505087 () ListLongMap!16153)

(assert (=> b!1136313 (= lt!505087 (getCurrentListMapNoExtraKeys!4588 lt!505079 lt!505086 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2582 (Int (_ BitVec 64)) V!43201)

(assert (=> b!1136313 (= lt!505086 (array!73897 (store (arr!35599 _values!996) i!673 (ValueCellFull!13568 (dynLambda!2582 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36137 _values!996)))))

(declare-fun lt!505076 () ListLongMap!16153)

(assert (=> b!1136313 (= lt!505076 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98414 res!758406) b!1136307))

(assert (= (and b!1136307 res!758400) b!1136285))

(assert (= (and b!1136285 res!758409) b!1136304))

(assert (= (and b!1136304 res!758399) b!1136291))

(assert (= (and b!1136291 res!758408) b!1136283))

(assert (= (and b!1136283 res!758410) b!1136302))

(assert (= (and b!1136302 res!758395) b!1136310))

(assert (= (and b!1136310 res!758403) b!1136292))

(assert (= (and b!1136292 res!758402) b!1136308))

(assert (= (and b!1136308 res!758398) b!1136289))

(assert (= (and b!1136289 (not res!758396)) b!1136313))

(assert (= (and b!1136313 (not res!758407)) b!1136295))

(assert (= (and b!1136295 c!111068) b!1136303))

(assert (= (and b!1136295 (not c!111068)) b!1136306))

(assert (= (or b!1136303 b!1136306) bm!49817))

(assert (= (or b!1136303 b!1136306) bm!49820))

(assert (= (and b!1136295 (not res!758411)) b!1136300))

(assert (= (and b!1136300 (not res!758401)) b!1136298))

(assert (= (and b!1136298 c!111064) b!1136311))

(assert (= (and b!1136298 (not c!111064)) b!1136312))

(assert (= (and b!1136312 c!111065) b!1136290))

(assert (= (and b!1136312 (not c!111065)) b!1136299))

(assert (= (and b!1136299 c!111066) b!1136301))

(assert (= (and b!1136299 (not c!111066)) b!1136294))

(assert (= (or b!1136290 b!1136301) bm!49819))

(assert (= (or b!1136290 b!1136301) bm!49818))

(assert (= (or b!1136290 b!1136301) bm!49821))

(assert (= (or b!1136311 bm!49821) bm!49823))

(assert (= (or b!1136311 bm!49819) bm!49822))

(assert (= (or b!1136311 bm!49818) bm!49816))

(assert (= (and b!1136298 c!111067) b!1136288))

(assert (= (and b!1136298 (not c!111067)) b!1136287))

(assert (= (and b!1136298 res!758404) b!1136309))

(assert (= (and b!1136298 (not res!758394)) b!1136284))

(assert (= (and b!1136284 (not res!758405)) b!1136305))

(assert (= (and b!1136305 (not res!758397)) b!1136293))

(assert (= (and b!1136296 condMapEmpty!44657) mapIsEmpty!44657))

(assert (= (and b!1136296 (not condMapEmpty!44657)) mapNonEmpty!44657))

(get-info :version)

(assert (= (and mapNonEmpty!44657 ((_ is ValueCellFull!13568) mapValue!44657)) b!1136297))

(assert (= (and b!1136296 ((_ is ValueCellFull!13568) mapDefault!44657)) b!1136286))

(assert (= start!98414 b!1136296))

(declare-fun b_lambda!19113 () Bool)

(assert (=> (not b_lambda!19113) (not b!1136313)))

(declare-fun t!35937 () Bool)

(declare-fun tb!8829 () Bool)

(assert (=> (and start!98414 (= defaultEntry!1004 defaultEntry!1004) t!35937) tb!8829))

(declare-fun result!18231 () Bool)

(assert (=> tb!8829 (= result!18231 tp_is_empty!28555)))

(assert (=> b!1136313 t!35937))

(declare-fun b_and!38879 () Bool)

(assert (= b_and!38877 (and (=> t!35937 result!18231) b_and!38879)))

(declare-fun m!1048137 () Bool)

(assert (=> b!1136304 m!1048137))

(declare-fun m!1048139 () Bool)

(assert (=> bm!49816 m!1048139))

(declare-fun m!1048141 () Bool)

(assert (=> b!1136309 m!1048141))

(declare-fun m!1048143 () Bool)

(assert (=> bm!49820 m!1048143))

(declare-fun m!1048145 () Bool)

(assert (=> b!1136292 m!1048145))

(declare-fun m!1048147 () Bool)

(assert (=> b!1136292 m!1048147))

(declare-fun m!1048149 () Bool)

(assert (=> b!1136313 m!1048149))

(declare-fun m!1048151 () Bool)

(assert (=> b!1136313 m!1048151))

(declare-fun m!1048153 () Bool)

(assert (=> b!1136313 m!1048153))

(declare-fun m!1048155 () Bool)

(assert (=> b!1136313 m!1048155))

(declare-fun m!1048157 () Bool)

(assert (=> b!1136298 m!1048157))

(declare-fun m!1048159 () Bool)

(assert (=> b!1136298 m!1048159))

(declare-fun m!1048161 () Bool)

(assert (=> b!1136298 m!1048161))

(declare-fun m!1048163 () Bool)

(assert (=> b!1136302 m!1048163))

(declare-fun m!1048165 () Bool)

(assert (=> b!1136307 m!1048165))

(declare-fun m!1048167 () Bool)

(assert (=> b!1136284 m!1048167))

(declare-fun m!1048169 () Bool)

(assert (=> bm!49823 m!1048169))

(declare-fun m!1048171 () Bool)

(assert (=> b!1136295 m!1048171))

(declare-fun m!1048173 () Bool)

(assert (=> b!1136295 m!1048173))

(declare-fun m!1048175 () Bool)

(assert (=> b!1136308 m!1048175))

(declare-fun m!1048177 () Bool)

(assert (=> b!1136300 m!1048177))

(assert (=> b!1136300 m!1048143))

(declare-fun m!1048179 () Bool)

(assert (=> b!1136291 m!1048179))

(declare-fun m!1048181 () Bool)

(assert (=> b!1136293 m!1048181))

(declare-fun m!1048183 () Bool)

(assert (=> b!1136305 m!1048183))

(declare-fun m!1048185 () Bool)

(assert (=> b!1136303 m!1048185))

(declare-fun m!1048187 () Bool)

(assert (=> b!1136311 m!1048187))

(declare-fun m!1048189 () Bool)

(assert (=> b!1136311 m!1048189))

(assert (=> b!1136311 m!1048189))

(declare-fun m!1048191 () Bool)

(assert (=> b!1136311 m!1048191))

(declare-fun m!1048193 () Bool)

(assert (=> start!98414 m!1048193))

(declare-fun m!1048195 () Bool)

(assert (=> start!98414 m!1048195))

(assert (=> b!1136288 m!1048141))

(declare-fun m!1048197 () Bool)

(assert (=> b!1136310 m!1048197))

(declare-fun m!1048199 () Bool)

(assert (=> mapNonEmpty!44657 m!1048199))

(declare-fun m!1048201 () Bool)

(assert (=> bm!49822 m!1048201))

(declare-fun m!1048203 () Bool)

(assert (=> b!1136289 m!1048203))

(declare-fun m!1048205 () Bool)

(assert (=> b!1136289 m!1048205))

(declare-fun m!1048207 () Bool)

(assert (=> bm!49817 m!1048207))

(check-sat (not b!1136311) b_and!38879 (not b!1136288) (not b!1136309) (not start!98414) (not b!1136313) (not b!1136305) (not b!1136302) (not b!1136293) (not b!1136308) (not bm!49816) (not b!1136307) (not b!1136295) (not bm!49820) (not bm!49822) (not b!1136284) (not mapNonEmpty!44657) (not bm!49817) (not b!1136292) (not bm!49823) (not b!1136300) (not b!1136298) (not b!1136291) (not b_lambda!19113) (not b!1136289) (not b!1136303) (not b_next!24025) tp_is_empty!28555 (not b!1136304))
(check-sat b_and!38879 (not b_next!24025))
