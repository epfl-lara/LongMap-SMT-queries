; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98374 () Bool)

(assert start!98374)

(declare-fun b_free!23979 () Bool)

(declare-fun b_next!23979 () Bool)

(assert (=> start!98374 (= b_free!23979 (not b_next!23979))))

(declare-fun tp!84647 () Bool)

(declare-fun b_and!38807 () Bool)

(assert (=> start!98374 (= tp!84647 b_and!38807)))

(declare-datatypes ((V!43139 0))(
  ( (V!43140 (val!14311 Int)) )
))
(declare-fun zeroValue!944 () V!43139)

(declare-fun bm!49287 () Bool)

(declare-fun c!110745 () Bool)

(declare-fun c!110747 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37163 0))(
  ( (Unit!37164) )
))
(declare-fun call!49290 () Unit!37163)

(declare-datatypes ((tuple2!18054 0))(
  ( (tuple2!18055 (_1!9038 (_ BitVec 64)) (_2!9038 V!43139)) )
))
(declare-datatypes ((List!24813 0))(
  ( (Nil!24810) (Cons!24809 (h!26018 tuple2!18054) (t!35784 List!24813)) )
))
(declare-datatypes ((ListLongMap!16023 0))(
  ( (ListLongMap!16024 (toList!8027 List!24813)) )
))
(declare-fun lt!504107 () ListLongMap!16023)

(declare-fun minValue!944 () V!43139)

(declare-fun addStillContains!728 (ListLongMap!16023 (_ BitVec 64) V!43139 (_ BitVec 64)) Unit!37163)

(assert (=> bm!49287 (= call!49290 (addStillContains!728 lt!504107 (ite (or c!110747 c!110745) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110747 c!110745) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1134222 () Bool)

(declare-fun e!645505 () Bool)

(declare-fun e!645514 () Bool)

(assert (=> b!1134222 (= e!645505 e!645514)))

(declare-fun res!757230 () Bool)

(assert (=> b!1134222 (=> res!757230 e!645514)))

(declare-datatypes ((array!73879 0))(
  ( (array!73880 (arr!35590 (Array (_ BitVec 32) (_ BitVec 64))) (size!36126 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73879)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1134222 (= res!757230 (or (bvsge (size!36126 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36126 _keys!1208)) (bvsge from!1455 (size!36126 _keys!1208))))))

(declare-datatypes ((List!24814 0))(
  ( (Nil!24811) (Cons!24810 (h!26019 (_ BitVec 64)) (t!35785 List!24814)) )
))
(declare-fun arrayNoDuplicates!0 (array!73879 (_ BitVec 32) List!24814) Bool)

(assert (=> b!1134222 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24811)))

(declare-fun lt!504105 () Unit!37163)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73879 (_ BitVec 32) (_ BitVec 32)) Unit!37163)

(assert (=> b!1134222 (= lt!504105 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645509 () Bool)

(assert (=> b!1134222 e!645509))

(declare-fun res!757234 () Bool)

(assert (=> b!1134222 (=> (not res!757234) (not e!645509))))

(declare-fun e!645511 () Bool)

(assert (=> b!1134222 (= res!757234 e!645511)))

(declare-fun c!110746 () Bool)

(assert (=> b!1134222 (= c!110746 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!504111 () Unit!37163)

(declare-datatypes ((ValueCell!13545 0))(
  ( (ValueCellFull!13545 (v!16948 V!43139)) (EmptyCell!13545) )
))
(declare-datatypes ((array!73881 0))(
  ( (array!73882 (arr!35591 (Array (_ BitVec 32) ValueCell!13545)) (size!36127 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73881)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!336 (array!73879 array!73881 (_ BitVec 32) (_ BitVec 32) V!43139 V!43139 (_ BitVec 64) (_ BitVec 32) Int) Unit!37163)

(assert (=> b!1134222 (= lt!504111 (lemmaListMapContainsThenArrayContainsFrom!336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504104 () Unit!37163)

(declare-fun e!645503 () Unit!37163)

(assert (=> b!1134222 (= lt!504104 e!645503)))

(declare-fun lt!504096 () Bool)

(assert (=> b!1134222 (= c!110747 (and (not lt!504096) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134222 (= lt!504096 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49288 () Bool)

(declare-fun call!49295 () Bool)

(declare-fun call!49296 () Bool)

(assert (=> bm!49288 (= call!49295 call!49296)))

(declare-fun b!1134223 () Bool)

(declare-fun res!757225 () Bool)

(declare-fun e!645500 () Bool)

(assert (=> b!1134223 (=> (not res!757225) (not e!645500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134223 (= res!757225 (validMask!0 mask!1564))))

(declare-fun b!1134224 () Bool)

(declare-fun lt!504106 () Unit!37163)

(assert (=> b!1134224 (= e!645503 lt!504106)))

(declare-fun lt!504102 () Unit!37163)

(assert (=> b!1134224 (= lt!504102 call!49290)))

(declare-fun lt!504108 () ListLongMap!16023)

(declare-fun call!49291 () ListLongMap!16023)

(assert (=> b!1134224 (= lt!504108 call!49291)))

(assert (=> b!1134224 call!49296))

(assert (=> b!1134224 (= lt!504106 (addStillContains!728 lt!504108 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6551 (ListLongMap!16023 (_ BitVec 64)) Bool)

(declare-fun +!3467 (ListLongMap!16023 tuple2!18054) ListLongMap!16023)

(assert (=> b!1134224 (contains!6551 (+!3467 lt!504108 (tuple2!18055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1134225 () Bool)

(declare-fun e!645507 () Bool)

(declare-fun e!645513 () Bool)

(assert (=> b!1134225 (= e!645507 e!645513)))

(declare-fun res!757226 () Bool)

(assert (=> b!1134225 (=> res!757226 e!645513)))

(assert (=> b!1134225 (= res!757226 (not (= (select (arr!35590 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645502 () Bool)

(assert (=> b!1134225 e!645502))

(declare-fun c!110748 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134225 (= c!110748 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504097 () Unit!37163)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!444 (array!73879 array!73881 (_ BitVec 32) (_ BitVec 32) V!43139 V!43139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37163)

(assert (=> b!1134225 (= lt!504097 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134226 () Bool)

(declare-fun arrayContainsKey!0 (array!73879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134226 (= e!645511 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134228 () Bool)

(declare-fun e!645512 () Unit!37163)

(declare-fun Unit!37165 () Unit!37163)

(assert (=> b!1134228 (= e!645512 Unit!37165)))

(declare-fun call!49294 () ListLongMap!16023)

(declare-fun bm!49289 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4513 (array!73879 array!73881 (_ BitVec 32) (_ BitVec 32) V!43139 V!43139 (_ BitVec 32) Int) ListLongMap!16023)

(assert (=> bm!49289 (= call!49294 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134229 () Bool)

(declare-fun res!757219 () Bool)

(assert (=> b!1134229 (=> (not res!757219) (not e!645500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134229 (= res!757219 (validKeyInArray!0 k0!934))))

(declare-fun b!1134230 () Bool)

(assert (=> b!1134230 call!49295))

(declare-fun lt!504095 () Unit!37163)

(declare-fun call!49297 () Unit!37163)

(assert (=> b!1134230 (= lt!504095 call!49297)))

(declare-fun e!645516 () Unit!37163)

(assert (=> b!1134230 (= e!645516 lt!504095)))

(declare-fun mapNonEmpty!44588 () Bool)

(declare-fun mapRes!44588 () Bool)

(declare-fun tp!84648 () Bool)

(declare-fun e!645515 () Bool)

(assert (=> mapNonEmpty!44588 (= mapRes!44588 (and tp!84648 e!645515))))

(declare-fun mapRest!44588 () (Array (_ BitVec 32) ValueCell!13545))

(declare-fun mapKey!44588 () (_ BitVec 32))

(declare-fun mapValue!44588 () ValueCell!13545)

(assert (=> mapNonEmpty!44588 (= (arr!35591 _values!996) (store mapRest!44588 mapKey!44588 mapValue!44588))))

(declare-fun b!1134231 () Bool)

(declare-fun e!645508 () Bool)

(declare-fun e!645501 () Bool)

(assert (=> b!1134231 (= e!645508 (and e!645501 mapRes!44588))))

(declare-fun condMapEmpty!44588 () Bool)

(declare-fun mapDefault!44588 () ValueCell!13545)

(assert (=> b!1134231 (= condMapEmpty!44588 (= (arr!35591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13545)) mapDefault!44588)))))

(declare-fun b!1134232 () Bool)

(declare-fun lt!504098 () Unit!37163)

(assert (=> b!1134232 (= e!645512 lt!504098)))

(assert (=> b!1134232 (= lt!504098 call!49297)))

(assert (=> b!1134232 call!49295))

(declare-fun b!1134233 () Bool)

(declare-fun res!757231 () Bool)

(assert (=> b!1134233 (=> (not res!757231) (not e!645500))))

(assert (=> b!1134233 (= res!757231 (and (= (size!36127 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36126 _keys!1208) (size!36127 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!49292 () ListLongMap!16023)

(declare-fun b!1134234 () Bool)

(declare-fun -!1192 (ListLongMap!16023 (_ BitVec 64)) ListLongMap!16023)

(assert (=> b!1134234 (= e!645502 (= call!49292 (-!1192 call!49294 k0!934)))))

(declare-fun b!1134235 () Bool)

(declare-fun res!757222 () Bool)

(assert (=> b!1134235 (=> (not res!757222) (not e!645500))))

(assert (=> b!1134235 (= res!757222 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36126 _keys!1208))))))

(declare-fun b!1134236 () Bool)

(declare-fun res!757229 () Bool)

(assert (=> b!1134236 (=> (not res!757229) (not e!645500))))

(assert (=> b!1134236 (= res!757229 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24811))))

(declare-fun bm!49290 () Bool)

(declare-fun lt!504101 () array!73879)

(declare-fun lt!504103 () array!73881)

(assert (=> bm!49290 (= call!49292 (getCurrentListMapNoExtraKeys!4513 lt!504101 lt!504103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134237 () Bool)

(assert (=> b!1134237 (= e!645503 e!645516)))

(assert (=> b!1134237 (= c!110745 (and (not lt!504096) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134238 () Bool)

(declare-fun res!757232 () Bool)

(assert (=> b!1134238 (=> (not res!757232) (not e!645500))))

(assert (=> b!1134238 (= res!757232 (= (select (arr!35590 _keys!1208) i!673) k0!934))))

(declare-fun b!1134239 () Bool)

(declare-fun tp_is_empty!28509 () Bool)

(assert (=> b!1134239 (= e!645501 tp_is_empty!28509)))

(declare-fun mapIsEmpty!44588 () Bool)

(assert (=> mapIsEmpty!44588 mapRes!44588))

(declare-fun bm!49291 () Bool)

(declare-fun call!49293 () ListLongMap!16023)

(assert (=> bm!49291 (= call!49296 (contains!6551 (ite c!110747 lt!504108 call!49293) k0!934))))

(declare-fun b!1134240 () Bool)

(declare-fun res!757235 () Bool)

(assert (=> b!1134240 (=> (not res!757235) (not e!645500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73879 (_ BitVec 32)) Bool)

(assert (=> b!1134240 (= res!757235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49292 () Bool)

(assert (=> bm!49292 (= call!49291 (+!3467 lt!504107 (ite (or c!110747 c!110745) (tuple2!18055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18055 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun res!757218 () Bool)

(assert (=> start!98374 (=> (not res!757218) (not e!645500))))

(assert (=> start!98374 (= res!757218 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36126 _keys!1208))))))

(assert (=> start!98374 e!645500))

(assert (=> start!98374 tp_is_empty!28509))

(declare-fun array_inv!27296 (array!73879) Bool)

(assert (=> start!98374 (array_inv!27296 _keys!1208)))

(assert (=> start!98374 true))

(assert (=> start!98374 tp!84647))

(declare-fun array_inv!27297 (array!73881) Bool)

(assert (=> start!98374 (and (array_inv!27297 _values!996) e!645508)))

(declare-fun b!1134227 () Bool)

(assert (=> b!1134227 (= e!645514 true)))

(declare-fun lt!504110 () Bool)

(declare-fun contains!6552 (List!24814 (_ BitVec 64)) Bool)

(assert (=> b!1134227 (= lt!504110 (contains!6552 Nil!24811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134241 () Bool)

(assert (=> b!1134241 (= e!645502 (= call!49292 call!49294))))

(declare-fun b!1134242 () Bool)

(declare-fun e!645504 () Bool)

(declare-fun e!645506 () Bool)

(assert (=> b!1134242 (= e!645504 (not e!645506))))

(declare-fun res!757224 () Bool)

(assert (=> b!1134242 (=> res!757224 e!645506)))

(assert (=> b!1134242 (= res!757224 (bvsgt from!1455 i!673))))

(assert (=> b!1134242 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504109 () Unit!37163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73879 (_ BitVec 64) (_ BitVec 32)) Unit!37163)

(assert (=> b!1134242 (= lt!504109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134243 () Bool)

(assert (=> b!1134243 (= e!645509 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49293 () Bool)

(assert (=> bm!49293 (= call!49297 call!49290)))

(declare-fun b!1134244 () Bool)

(assert (=> b!1134244 (= e!645511 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504096) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134245 () Bool)

(assert (=> b!1134245 (= e!645513 e!645505)))

(declare-fun res!757221 () Bool)

(assert (=> b!1134245 (=> res!757221 e!645505)))

(assert (=> b!1134245 (= res!757221 (not (contains!6551 lt!504107 k0!934)))))

(assert (=> b!1134245 (= lt!504107 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49294 () Bool)

(assert (=> bm!49294 (= call!49293 call!49291)))

(declare-fun b!1134246 () Bool)

(assert (=> b!1134246 (= e!645500 e!645504)))

(declare-fun res!757228 () Bool)

(assert (=> b!1134246 (=> (not res!757228) (not e!645504))))

(assert (=> b!1134246 (= res!757228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504101 mask!1564))))

(assert (=> b!1134246 (= lt!504101 (array!73880 (store (arr!35590 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36126 _keys!1208)))))

(declare-fun b!1134247 () Bool)

(declare-fun res!757233 () Bool)

(assert (=> b!1134247 (=> (not res!757233) (not e!645504))))

(assert (=> b!1134247 (= res!757233 (arrayNoDuplicates!0 lt!504101 #b00000000000000000000000000000000 Nil!24811))))

(declare-fun b!1134248 () Bool)

(declare-fun res!757223 () Bool)

(assert (=> b!1134248 (=> res!757223 e!645514)))

(assert (=> b!1134248 (= res!757223 (contains!6552 Nil!24811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134249 () Bool)

(assert (=> b!1134249 (= e!645506 e!645507)))

(declare-fun res!757227 () Bool)

(assert (=> b!1134249 (=> res!757227 e!645507)))

(assert (=> b!1134249 (= res!757227 (not (= from!1455 i!673)))))

(declare-fun lt!504100 () ListLongMap!16023)

(assert (=> b!1134249 (= lt!504100 (getCurrentListMapNoExtraKeys!4513 lt!504101 lt!504103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2579 (Int (_ BitVec 64)) V!43139)

(assert (=> b!1134249 (= lt!504103 (array!73882 (store (arr!35591 _values!996) i!673 (ValueCellFull!13545 (dynLambda!2579 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36127 _values!996)))))

(declare-fun lt!504099 () ListLongMap!16023)

(assert (=> b!1134249 (= lt!504099 (getCurrentListMapNoExtraKeys!4513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134250 () Bool)

(assert (=> b!1134250 (= e!645515 tp_is_empty!28509)))

(declare-fun b!1134251 () Bool)

(declare-fun c!110749 () Bool)

(assert (=> b!1134251 (= c!110749 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504096))))

(assert (=> b!1134251 (= e!645516 e!645512)))

(declare-fun b!1134252 () Bool)

(declare-fun res!757220 () Bool)

(assert (=> b!1134252 (=> res!757220 e!645514)))

(declare-fun noDuplicate!1591 (List!24814) Bool)

(assert (=> b!1134252 (= res!757220 (not (noDuplicate!1591 Nil!24811)))))

(assert (= (and start!98374 res!757218) b!1134223))

(assert (= (and b!1134223 res!757225) b!1134233))

(assert (= (and b!1134233 res!757231) b!1134240))

(assert (= (and b!1134240 res!757235) b!1134236))

(assert (= (and b!1134236 res!757229) b!1134235))

(assert (= (and b!1134235 res!757222) b!1134229))

(assert (= (and b!1134229 res!757219) b!1134238))

(assert (= (and b!1134238 res!757232) b!1134246))

(assert (= (and b!1134246 res!757228) b!1134247))

(assert (= (and b!1134247 res!757233) b!1134242))

(assert (= (and b!1134242 (not res!757224)) b!1134249))

(assert (= (and b!1134249 (not res!757227)) b!1134225))

(assert (= (and b!1134225 c!110748) b!1134234))

(assert (= (and b!1134225 (not c!110748)) b!1134241))

(assert (= (or b!1134234 b!1134241) bm!49290))

(assert (= (or b!1134234 b!1134241) bm!49289))

(assert (= (and b!1134225 (not res!757226)) b!1134245))

(assert (= (and b!1134245 (not res!757221)) b!1134222))

(assert (= (and b!1134222 c!110747) b!1134224))

(assert (= (and b!1134222 (not c!110747)) b!1134237))

(assert (= (and b!1134237 c!110745) b!1134230))

(assert (= (and b!1134237 (not c!110745)) b!1134251))

(assert (= (and b!1134251 c!110749) b!1134232))

(assert (= (and b!1134251 (not c!110749)) b!1134228))

(assert (= (or b!1134230 b!1134232) bm!49293))

(assert (= (or b!1134230 b!1134232) bm!49294))

(assert (= (or b!1134230 b!1134232) bm!49288))

(assert (= (or b!1134224 bm!49288) bm!49291))

(assert (= (or b!1134224 bm!49293) bm!49287))

(assert (= (or b!1134224 bm!49294) bm!49292))

(assert (= (and b!1134222 c!110746) b!1134226))

(assert (= (and b!1134222 (not c!110746)) b!1134244))

(assert (= (and b!1134222 res!757234) b!1134243))

(assert (= (and b!1134222 (not res!757230)) b!1134252))

(assert (= (and b!1134252 (not res!757220)) b!1134248))

(assert (= (and b!1134248 (not res!757223)) b!1134227))

(assert (= (and b!1134231 condMapEmpty!44588) mapIsEmpty!44588))

(assert (= (and b!1134231 (not condMapEmpty!44588)) mapNonEmpty!44588))

(get-info :version)

(assert (= (and mapNonEmpty!44588 ((_ is ValueCellFull!13545) mapValue!44588)) b!1134250))

(assert (= (and b!1134231 ((_ is ValueCellFull!13545) mapDefault!44588)) b!1134239))

(assert (= start!98374 b!1134231))

(declare-fun b_lambda!19085 () Bool)

(assert (=> (not b_lambda!19085) (not b!1134249)))

(declare-fun t!35783 () Bool)

(declare-fun tb!8791 () Bool)

(assert (=> (and start!98374 (= defaultEntry!1004 defaultEntry!1004) t!35783) tb!8791))

(declare-fun result!18147 () Bool)

(assert (=> tb!8791 (= result!18147 tp_is_empty!28509)))

(assert (=> b!1134249 t!35783))

(declare-fun b_and!38809 () Bool)

(assert (= b_and!38807 (and (=> t!35783 result!18147) b_and!38809)))

(declare-fun m!1047081 () Bool)

(assert (=> b!1134234 m!1047081))

(declare-fun m!1047083 () Bool)

(assert (=> b!1134229 m!1047083))

(declare-fun m!1047085 () Bool)

(assert (=> start!98374 m!1047085))

(declare-fun m!1047087 () Bool)

(assert (=> start!98374 m!1047087))

(declare-fun m!1047089 () Bool)

(assert (=> b!1134242 m!1047089))

(declare-fun m!1047091 () Bool)

(assert (=> b!1134242 m!1047091))

(declare-fun m!1047093 () Bool)

(assert (=> bm!49287 m!1047093))

(declare-fun m!1047095 () Bool)

(assert (=> b!1134236 m!1047095))

(declare-fun m!1047097 () Bool)

(assert (=> b!1134243 m!1047097))

(declare-fun m!1047099 () Bool)

(assert (=> b!1134247 m!1047099))

(declare-fun m!1047101 () Bool)

(assert (=> b!1134224 m!1047101))

(declare-fun m!1047103 () Bool)

(assert (=> b!1134224 m!1047103))

(assert (=> b!1134224 m!1047103))

(declare-fun m!1047105 () Bool)

(assert (=> b!1134224 m!1047105))

(declare-fun m!1047107 () Bool)

(assert (=> b!1134227 m!1047107))

(declare-fun m!1047109 () Bool)

(assert (=> b!1134246 m!1047109))

(declare-fun m!1047111 () Bool)

(assert (=> b!1134246 m!1047111))

(declare-fun m!1047113 () Bool)

(assert (=> bm!49290 m!1047113))

(declare-fun m!1047115 () Bool)

(assert (=> b!1134223 m!1047115))

(assert (=> b!1134226 m!1047097))

(declare-fun m!1047117 () Bool)

(assert (=> b!1134222 m!1047117))

(declare-fun m!1047119 () Bool)

(assert (=> b!1134222 m!1047119))

(declare-fun m!1047121 () Bool)

(assert (=> b!1134222 m!1047121))

(declare-fun m!1047123 () Bool)

(assert (=> b!1134252 m!1047123))

(declare-fun m!1047125 () Bool)

(assert (=> b!1134240 m!1047125))

(declare-fun m!1047127 () Bool)

(assert (=> b!1134249 m!1047127))

(declare-fun m!1047129 () Bool)

(assert (=> b!1134249 m!1047129))

(declare-fun m!1047131 () Bool)

(assert (=> b!1134249 m!1047131))

(declare-fun m!1047133 () Bool)

(assert (=> b!1134249 m!1047133))

(declare-fun m!1047135 () Bool)

(assert (=> b!1134238 m!1047135))

(declare-fun m!1047137 () Bool)

(assert (=> b!1134225 m!1047137))

(declare-fun m!1047139 () Bool)

(assert (=> b!1134225 m!1047139))

(declare-fun m!1047141 () Bool)

(assert (=> bm!49292 m!1047141))

(declare-fun m!1047143 () Bool)

(assert (=> b!1134245 m!1047143))

(declare-fun m!1047145 () Bool)

(assert (=> b!1134245 m!1047145))

(assert (=> bm!49289 m!1047145))

(declare-fun m!1047147 () Bool)

(assert (=> mapNonEmpty!44588 m!1047147))

(declare-fun m!1047149 () Bool)

(assert (=> bm!49291 m!1047149))

(declare-fun m!1047151 () Bool)

(assert (=> b!1134248 m!1047151))

(check-sat (not b!1134245) (not b!1134227) b_and!38809 (not start!98374) (not bm!49292) (not b_next!23979) (not b!1134222) tp_is_empty!28509 (not b!1134236) (not b!1134246) (not b!1134229) (not b!1134248) (not bm!49290) (not b!1134249) (not b!1134224) (not b!1134252) (not b!1134223) (not b!1134234) (not b!1134225) (not bm!49289) (not b_lambda!19085) (not bm!49287) (not bm!49291) (not b!1134243) (not b!1134247) (not mapNonEmpty!44588) (not b!1134242) (not b!1134240) (not b!1134226))
(check-sat b_and!38809 (not b_next!23979))
