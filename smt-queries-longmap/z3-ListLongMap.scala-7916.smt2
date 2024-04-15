; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98300 () Bool)

(assert start!98300)

(declare-fun b_free!23941 () Bool)

(declare-fun b_next!23941 () Bool)

(assert (=> start!98300 (= b_free!23941 (not b_next!23941))))

(declare-fun tp!84531 () Bool)

(declare-fun b_and!38691 () Bool)

(assert (=> start!98300 (= tp!84531 b_and!38691)))

(declare-fun b!1132293 () Bool)

(declare-datatypes ((Unit!36949 0))(
  ( (Unit!36950) )
))
(declare-fun e!644407 () Unit!36949)

(declare-fun e!644405 () Unit!36949)

(assert (=> b!1132293 (= e!644407 e!644405)))

(declare-fun c!110395 () Bool)

(declare-fun lt!502935 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1132293 (= c!110395 (and (not lt!502935) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1132294 () Bool)

(declare-fun e!644416 () Bool)

(declare-fun e!644413 () Bool)

(assert (=> b!1132294 (= e!644416 e!644413)))

(declare-fun res!756231 () Bool)

(assert (=> b!1132294 (=> res!756231 e!644413)))

(declare-datatypes ((array!73724 0))(
  ( (array!73725 (arr!35514 (Array (_ BitVec 32) (_ BitVec 64))) (size!36052 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73724)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1132294 (= res!756231 (not (= (select (arr!35514 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644419 () Bool)

(assert (=> b!1132294 e!644419))

(declare-fun c!110393 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132294 (= c!110393 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43089 0))(
  ( (V!43090 (val!14292 Int)) )
))
(declare-fun zeroValue!944 () V!43089)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13526 0))(
  ( (ValueCellFull!13526 (v!16927 V!43089)) (EmptyCell!13526) )
))
(declare-datatypes ((array!73726 0))(
  ( (array!73727 (arr!35515 (Array (_ BitVec 32) ValueCell!13526)) (size!36053 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73726)

(declare-fun minValue!944 () V!43089)

(declare-fun lt!502941 () Unit!36949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!440 (array!73724 array!73726 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36949)

(assert (=> b!1132294 (= lt!502941 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44528 () Bool)

(declare-fun mapRes!44528 () Bool)

(declare-fun tp!84530 () Bool)

(declare-fun e!644408 () Bool)

(assert (=> mapNonEmpty!44528 (= mapRes!44528 (and tp!84530 e!644408))))

(declare-fun mapRest!44528 () (Array (_ BitVec 32) ValueCell!13526))

(declare-fun mapKey!44528 () (_ BitVec 32))

(declare-fun mapValue!44528 () ValueCell!13526)

(assert (=> mapNonEmpty!44528 (= (arr!35515 _values!996) (store mapRest!44528 mapKey!44528 mapValue!44528))))

(declare-datatypes ((tuple2!18102 0))(
  ( (tuple2!18103 (_1!9062 (_ BitVec 64)) (_2!9062 V!43089)) )
))
(declare-datatypes ((List!24850 0))(
  ( (Nil!24847) (Cons!24846 (h!26055 tuple2!18102) (t!35774 List!24850)) )
))
(declare-datatypes ((ListLongMap!16071 0))(
  ( (ListLongMap!16072 (toList!8051 List!24850)) )
))
(declare-fun lt!502932 () ListLongMap!16071)

(declare-fun bm!48788 () Bool)

(declare-fun call!48795 () Bool)

(declare-fun call!48792 () ListLongMap!16071)

(declare-fun c!110394 () Bool)

(declare-fun contains!6505 (ListLongMap!16071 (_ BitVec 64)) Bool)

(assert (=> bm!48788 (= call!48795 (contains!6505 (ite c!110394 lt!502932 call!48792) k0!934))))

(declare-fun b!1132295 () Bool)

(declare-fun e!644415 () Bool)

(assert (=> b!1132295 (= e!644415 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)) (bvslt (size!36052 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun e!644412 () Bool)

(assert (=> b!1132295 e!644412))

(declare-fun c!110391 () Bool)

(assert (=> b!1132295 (= c!110391 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!502936 () Unit!36949)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!320 (array!73724 array!73726 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 64) (_ BitVec 32) Int) Unit!36949)

(assert (=> b!1132295 (= lt!502936 (lemmaListMapContainsThenArrayContainsFrom!320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!502938 () Unit!36949)

(assert (=> b!1132295 (= lt!502938 e!644407)))

(assert (=> b!1132295 (= c!110394 (and (not lt!502935) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132295 (= lt!502935 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132296 () Bool)

(declare-fun arrayContainsKey!0 (array!73724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132296 (= e!644412 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!502940 () ListLongMap!16071)

(declare-fun bm!48789 () Bool)

(declare-fun call!48794 () Unit!36949)

(declare-fun addStillContains!706 (ListLongMap!16071 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!36949)

(assert (=> bm!48789 (= call!48794 (addStillContains!706 (ite c!110394 lt!502932 lt!502940) (ite c!110394 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110395 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110394 minValue!944 (ite c!110395 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!48796 () ListLongMap!16071)

(declare-fun call!48793 () ListLongMap!16071)

(declare-fun b!1132297 () Bool)

(declare-fun -!1155 (ListLongMap!16071 (_ BitVec 64)) ListLongMap!16071)

(assert (=> b!1132297 (= e!644419 (= call!48796 (-!1155 call!48793 k0!934)))))

(declare-fun lt!502945 () array!73726)

(declare-fun lt!502934 () array!73724)

(declare-fun bm!48790 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4550 (array!73724 array!73726 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) Int) ListLongMap!16071)

(assert (=> bm!48790 (= call!48796 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132298 () Bool)

(declare-fun res!756222 () Bool)

(declare-fun e!644406 () Bool)

(assert (=> b!1132298 (=> (not res!756222) (not e!644406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132298 (= res!756222 (validKeyInArray!0 k0!934))))

(declare-fun bm!48791 () Bool)

(declare-fun call!48791 () Bool)

(assert (=> bm!48791 (= call!48791 call!48795)))

(declare-fun b!1132299 () Bool)

(declare-fun lt!502944 () Unit!36949)

(assert (=> b!1132299 (= e!644407 lt!502944)))

(declare-fun lt!502937 () Unit!36949)

(assert (=> b!1132299 (= lt!502937 (addStillContains!706 lt!502940 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!48798 () ListLongMap!16071)

(assert (=> b!1132299 (= lt!502932 call!48798)))

(assert (=> b!1132299 call!48795))

(assert (=> b!1132299 (= lt!502944 call!48794)))

(declare-fun +!3488 (ListLongMap!16071 tuple2!18102) ListLongMap!16071)

(assert (=> b!1132299 (contains!6505 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1132300 () Bool)

(declare-fun e!644417 () Bool)

(declare-fun tp_is_empty!28471 () Bool)

(assert (=> b!1132300 (= e!644417 tp_is_empty!28471)))

(declare-fun bm!48792 () Bool)

(declare-fun call!48797 () Unit!36949)

(assert (=> bm!48792 (= call!48797 call!48794)))

(declare-fun b!1132301 () Bool)

(assert (=> b!1132301 (= e!644413 e!644415)))

(declare-fun res!756226 () Bool)

(assert (=> b!1132301 (=> res!756226 e!644415)))

(assert (=> b!1132301 (= res!756226 (not (contains!6505 lt!502940 k0!934)))))

(assert (=> b!1132301 (= lt!502940 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132302 () Bool)

(declare-fun res!756233 () Bool)

(declare-fun e!644414 () Bool)

(assert (=> b!1132302 (=> (not res!756233) (not e!644414))))

(declare-datatypes ((List!24851 0))(
  ( (Nil!24848) (Cons!24847 (h!26056 (_ BitVec 64)) (t!35775 List!24851)) )
))
(declare-fun arrayNoDuplicates!0 (array!73724 (_ BitVec 32) List!24851) Bool)

(assert (=> b!1132302 (= res!756233 (arrayNoDuplicates!0 lt!502934 #b00000000000000000000000000000000 Nil!24848))))

(declare-fun b!1132303 () Bool)

(assert (=> b!1132303 call!48791))

(declare-fun lt!502939 () Unit!36949)

(assert (=> b!1132303 (= lt!502939 call!48797)))

(assert (=> b!1132303 (= e!644405 lt!502939)))

(declare-fun b!1132304 () Bool)

(declare-fun e!644411 () Bool)

(assert (=> b!1132304 (= e!644411 e!644416)))

(declare-fun res!756225 () Bool)

(assert (=> b!1132304 (=> res!756225 e!644416)))

(assert (=> b!1132304 (= res!756225 (not (= from!1455 i!673)))))

(declare-fun lt!502933 () ListLongMap!16071)

(assert (=> b!1132304 (= lt!502933 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2550 (Int (_ BitVec 64)) V!43089)

(assert (=> b!1132304 (= lt!502945 (array!73727 (store (arr!35515 _values!996) i!673 (ValueCellFull!13526 (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36053 _values!996)))))

(declare-fun lt!502943 () ListLongMap!16071)

(assert (=> b!1132304 (= lt!502943 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1132305 () Bool)

(declare-fun e!644410 () Unit!36949)

(declare-fun Unit!36951 () Unit!36949)

(assert (=> b!1132305 (= e!644410 Unit!36951)))

(declare-fun b!1132306 () Bool)

(declare-fun res!756221 () Bool)

(assert (=> b!1132306 (=> (not res!756221) (not e!644406))))

(assert (=> b!1132306 (= res!756221 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24848))))

(declare-fun b!1132307 () Bool)

(declare-fun res!756232 () Bool)

(assert (=> b!1132307 (=> (not res!756232) (not e!644406))))

(assert (=> b!1132307 (= res!756232 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36052 _keys!1208))))))

(declare-fun b!1132308 () Bool)

(declare-fun res!756230 () Bool)

(assert (=> b!1132308 (=> (not res!756230) (not e!644406))))

(assert (=> b!1132308 (= res!756230 (and (= (size!36053 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36052 _keys!1208) (size!36053 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132309 () Bool)

(assert (=> b!1132309 (= e!644406 e!644414)))

(declare-fun res!756228 () Bool)

(assert (=> b!1132309 (=> (not res!756228) (not e!644414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73724 (_ BitVec 32)) Bool)

(assert (=> b!1132309 (= res!756228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502934 mask!1564))))

(assert (=> b!1132309 (= lt!502934 (array!73725 (store (arr!35514 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36052 _keys!1208)))))

(declare-fun b!1132310 () Bool)

(assert (=> b!1132310 (= e!644419 (= call!48796 call!48793))))

(declare-fun bm!48793 () Bool)

(assert (=> bm!48793 (= call!48798 (+!3488 lt!502940 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132311 () Bool)

(declare-fun lt!502946 () Unit!36949)

(assert (=> b!1132311 (= e!644410 lt!502946)))

(assert (=> b!1132311 (= lt!502946 call!48797)))

(assert (=> b!1132311 call!48791))

(declare-fun bm!48794 () Bool)

(assert (=> bm!48794 (= call!48792 call!48798)))

(declare-fun b!1132312 () Bool)

(declare-fun res!756224 () Bool)

(assert (=> b!1132312 (=> (not res!756224) (not e!644406))))

(assert (=> b!1132312 (= res!756224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132313 () Bool)

(declare-fun res!756234 () Bool)

(assert (=> b!1132313 (=> (not res!756234) (not e!644406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132313 (= res!756234 (validMask!0 mask!1564))))

(declare-fun b!1132314 () Bool)

(declare-fun c!110392 () Bool)

(assert (=> b!1132314 (= c!110392 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502935))))

(assert (=> b!1132314 (= e!644405 e!644410)))

(declare-fun b!1132315 () Bool)

(assert (=> b!1132315 (= e!644412 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!502935) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!48795 () Bool)

(assert (=> bm!48795 (= call!48793 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132316 () Bool)

(assert (=> b!1132316 (= e!644408 tp_is_empty!28471)))

(declare-fun b!1132317 () Bool)

(declare-fun res!756223 () Bool)

(assert (=> b!1132317 (=> (not res!756223) (not e!644406))))

(assert (=> b!1132317 (= res!756223 (= (select (arr!35514 _keys!1208) i!673) k0!934))))

(declare-fun res!756229 () Bool)

(assert (=> start!98300 (=> (not res!756229) (not e!644406))))

(assert (=> start!98300 (= res!756229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36052 _keys!1208))))))

(assert (=> start!98300 e!644406))

(assert (=> start!98300 tp_is_empty!28471))

(declare-fun array_inv!27314 (array!73724) Bool)

(assert (=> start!98300 (array_inv!27314 _keys!1208)))

(assert (=> start!98300 true))

(assert (=> start!98300 tp!84531))

(declare-fun e!644409 () Bool)

(declare-fun array_inv!27315 (array!73726) Bool)

(assert (=> start!98300 (and (array_inv!27315 _values!996) e!644409)))

(declare-fun mapIsEmpty!44528 () Bool)

(assert (=> mapIsEmpty!44528 mapRes!44528))

(declare-fun b!1132318 () Bool)

(assert (=> b!1132318 (= e!644414 (not e!644411))))

(declare-fun res!756227 () Bool)

(assert (=> b!1132318 (=> res!756227 e!644411)))

(assert (=> b!1132318 (= res!756227 (bvsgt from!1455 i!673))))

(assert (=> b!1132318 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502942 () Unit!36949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73724 (_ BitVec 64) (_ BitVec 32)) Unit!36949)

(assert (=> b!1132318 (= lt!502942 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132319 () Bool)

(assert (=> b!1132319 (= e!644409 (and e!644417 mapRes!44528))))

(declare-fun condMapEmpty!44528 () Bool)

(declare-fun mapDefault!44528 () ValueCell!13526)

(assert (=> b!1132319 (= condMapEmpty!44528 (= (arr!35515 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13526)) mapDefault!44528)))))

(assert (= (and start!98300 res!756229) b!1132313))

(assert (= (and b!1132313 res!756234) b!1132308))

(assert (= (and b!1132308 res!756230) b!1132312))

(assert (= (and b!1132312 res!756224) b!1132306))

(assert (= (and b!1132306 res!756221) b!1132307))

(assert (= (and b!1132307 res!756232) b!1132298))

(assert (= (and b!1132298 res!756222) b!1132317))

(assert (= (and b!1132317 res!756223) b!1132309))

(assert (= (and b!1132309 res!756228) b!1132302))

(assert (= (and b!1132302 res!756233) b!1132318))

(assert (= (and b!1132318 (not res!756227)) b!1132304))

(assert (= (and b!1132304 (not res!756225)) b!1132294))

(assert (= (and b!1132294 c!110393) b!1132297))

(assert (= (and b!1132294 (not c!110393)) b!1132310))

(assert (= (or b!1132297 b!1132310) bm!48790))

(assert (= (or b!1132297 b!1132310) bm!48795))

(assert (= (and b!1132294 (not res!756231)) b!1132301))

(assert (= (and b!1132301 (not res!756226)) b!1132295))

(assert (= (and b!1132295 c!110394) b!1132299))

(assert (= (and b!1132295 (not c!110394)) b!1132293))

(assert (= (and b!1132293 c!110395) b!1132303))

(assert (= (and b!1132293 (not c!110395)) b!1132314))

(assert (= (and b!1132314 c!110392) b!1132311))

(assert (= (and b!1132314 (not c!110392)) b!1132305))

(assert (= (or b!1132303 b!1132311) bm!48792))

(assert (= (or b!1132303 b!1132311) bm!48794))

(assert (= (or b!1132303 b!1132311) bm!48791))

(assert (= (or b!1132299 bm!48791) bm!48788))

(assert (= (or b!1132299 bm!48792) bm!48789))

(assert (= (or b!1132299 bm!48794) bm!48793))

(assert (= (and b!1132295 c!110391) b!1132296))

(assert (= (and b!1132295 (not c!110391)) b!1132315))

(assert (= (and b!1132319 condMapEmpty!44528) mapIsEmpty!44528))

(assert (= (and b!1132319 (not condMapEmpty!44528)) mapNonEmpty!44528))

(get-info :version)

(assert (= (and mapNonEmpty!44528 ((_ is ValueCellFull!13526) mapValue!44528)) b!1132316))

(assert (= (and b!1132319 ((_ is ValueCellFull!13526) mapDefault!44528)) b!1132300))

(assert (= start!98300 b!1132319))

(declare-fun b_lambda!18991 () Bool)

(assert (=> (not b_lambda!18991) (not b!1132304)))

(declare-fun t!35773 () Bool)

(declare-fun tb!8745 () Bool)

(assert (=> (and start!98300 (= defaultEntry!1004 defaultEntry!1004) t!35773) tb!8745))

(declare-fun result!18061 () Bool)

(assert (=> tb!8745 (= result!18061 tp_is_empty!28471)))

(assert (=> b!1132304 t!35773))

(declare-fun b_and!38693 () Bool)

(assert (= b_and!38691 (and (=> t!35773 result!18061) b_and!38693)))

(declare-fun m!1045067 () Bool)

(assert (=> b!1132302 m!1045067))

(declare-fun m!1045069 () Bool)

(assert (=> b!1132296 m!1045069))

(declare-fun m!1045071 () Bool)

(assert (=> b!1132301 m!1045071))

(declare-fun m!1045073 () Bool)

(assert (=> b!1132301 m!1045073))

(declare-fun m!1045075 () Bool)

(assert (=> mapNonEmpty!44528 m!1045075))

(declare-fun m!1045077 () Bool)

(assert (=> b!1132318 m!1045077))

(declare-fun m!1045079 () Bool)

(assert (=> b!1132318 m!1045079))

(declare-fun m!1045081 () Bool)

(assert (=> bm!48789 m!1045081))

(declare-fun m!1045083 () Bool)

(assert (=> bm!48788 m!1045083))

(declare-fun m!1045085 () Bool)

(assert (=> b!1132295 m!1045085))

(declare-fun m!1045087 () Bool)

(assert (=> start!98300 m!1045087))

(declare-fun m!1045089 () Bool)

(assert (=> start!98300 m!1045089))

(declare-fun m!1045091 () Bool)

(assert (=> b!1132294 m!1045091))

(declare-fun m!1045093 () Bool)

(assert (=> b!1132294 m!1045093))

(declare-fun m!1045095 () Bool)

(assert (=> b!1132304 m!1045095))

(declare-fun m!1045097 () Bool)

(assert (=> b!1132304 m!1045097))

(declare-fun m!1045099 () Bool)

(assert (=> b!1132304 m!1045099))

(declare-fun m!1045101 () Bool)

(assert (=> b!1132304 m!1045101))

(declare-fun m!1045103 () Bool)

(assert (=> bm!48793 m!1045103))

(declare-fun m!1045105 () Bool)

(assert (=> bm!48790 m!1045105))

(declare-fun m!1045107 () Bool)

(assert (=> b!1132297 m!1045107))

(declare-fun m!1045109 () Bool)

(assert (=> b!1132309 m!1045109))

(declare-fun m!1045111 () Bool)

(assert (=> b!1132309 m!1045111))

(declare-fun m!1045113 () Bool)

(assert (=> b!1132317 m!1045113))

(assert (=> bm!48795 m!1045073))

(declare-fun m!1045115 () Bool)

(assert (=> b!1132299 m!1045115))

(declare-fun m!1045117 () Bool)

(assert (=> b!1132299 m!1045117))

(assert (=> b!1132299 m!1045117))

(declare-fun m!1045119 () Bool)

(assert (=> b!1132299 m!1045119))

(declare-fun m!1045121 () Bool)

(assert (=> b!1132312 m!1045121))

(declare-fun m!1045123 () Bool)

(assert (=> b!1132306 m!1045123))

(declare-fun m!1045125 () Bool)

(assert (=> b!1132313 m!1045125))

(declare-fun m!1045127 () Bool)

(assert (=> b!1132298 m!1045127))

(check-sat (not b!1132309) (not b!1132299) (not mapNonEmpty!44528) (not bm!48795) (not b!1132295) (not b!1132312) (not b!1132296) (not b!1132304) (not bm!48789) (not bm!48790) (not b!1132306) (not b!1132318) (not b!1132294) (not bm!48793) b_and!38693 (not b!1132302) (not b!1132301) (not start!98300) (not b_next!23941) (not b!1132298) tp_is_empty!28471 (not b!1132313) (not b_lambda!18991) (not bm!48788) (not b!1132297))
(check-sat b_and!38693 (not b_next!23941))
(get-model)

(declare-fun b_lambda!18997 () Bool)

(assert (= b_lambda!18991 (or (and start!98300 b_free!23941) b_lambda!18997)))

(check-sat (not b!1132309) (not b!1132299) (not mapNonEmpty!44528) (not bm!48795) (not b!1132295) (not b!1132312) (not b!1132296) (not b!1132304) (not bm!48789) (not bm!48790) (not b!1132306) (not b!1132318) (not b!1132294) (not bm!48793) b_and!38693 (not b!1132302) (not b!1132301) (not b_lambda!18997) (not start!98300) (not b_next!23941) (not b!1132298) tp_is_empty!28471 (not b!1132313) (not bm!48788) (not b!1132297))
(check-sat b_and!38693 (not b_next!23941))
(get-model)

(declare-fun b!1132498 () Bool)

(declare-fun e!644519 () Bool)

(declare-fun call!48849 () Bool)

(assert (=> b!1132498 (= e!644519 call!48849)))

(declare-fun b!1132499 () Bool)

(declare-fun e!644520 () Bool)

(declare-fun e!644521 () Bool)

(assert (=> b!1132499 (= e!644520 e!644521)))

(declare-fun res!756327 () Bool)

(assert (=> b!1132499 (=> (not res!756327) (not e!644521))))

(declare-fun e!644518 () Bool)

(assert (=> b!1132499 (= res!756327 (not e!644518))))

(declare-fun res!756326 () Bool)

(assert (=> b!1132499 (=> (not res!756326) (not e!644518))))

(assert (=> b!1132499 (= res!756326 (validKeyInArray!0 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132500 () Bool)

(assert (=> b!1132500 (= e!644521 e!644519)))

(declare-fun c!110428 () Bool)

(assert (=> b!1132500 (= c!110428 (validKeyInArray!0 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!48846 () Bool)

(assert (=> bm!48846 (= call!48849 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110428 (Cons!24847 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000) Nil!24848) Nil!24848)))))

(declare-fun b!1132502 () Bool)

(declare-fun contains!6507 (List!24851 (_ BitVec 64)) Bool)

(assert (=> b!1132502 (= e!644518 (contains!6507 Nil!24848 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131423 () Bool)

(declare-fun res!756325 () Bool)

(assert (=> d!131423 (=> res!756325 e!644520)))

(assert (=> d!131423 (= res!756325 (bvsge #b00000000000000000000000000000000 (size!36052 _keys!1208)))))

(assert (=> d!131423 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24848) e!644520)))

(declare-fun b!1132501 () Bool)

(assert (=> b!1132501 (= e!644519 call!48849)))

(assert (= (and d!131423 (not res!756325)) b!1132499))

(assert (= (and b!1132499 res!756326) b!1132502))

(assert (= (and b!1132499 res!756327) b!1132500))

(assert (= (and b!1132500 c!110428) b!1132501))

(assert (= (and b!1132500 (not c!110428)) b!1132498))

(assert (= (or b!1132501 b!1132498) bm!48846))

(declare-fun m!1045253 () Bool)

(assert (=> b!1132499 m!1045253))

(assert (=> b!1132499 m!1045253))

(declare-fun m!1045255 () Bool)

(assert (=> b!1132499 m!1045255))

(assert (=> b!1132500 m!1045253))

(assert (=> b!1132500 m!1045253))

(assert (=> b!1132500 m!1045255))

(assert (=> bm!48846 m!1045253))

(declare-fun m!1045257 () Bool)

(assert (=> bm!48846 m!1045257))

(assert (=> b!1132502 m!1045253))

(assert (=> b!1132502 m!1045253))

(declare-fun m!1045259 () Bool)

(assert (=> b!1132502 m!1045259))

(assert (=> b!1132306 d!131423))

(declare-fun d!131425 () Bool)

(declare-fun e!644527 () Bool)

(assert (=> d!131425 e!644527))

(declare-fun res!756330 () Bool)

(assert (=> d!131425 (=> (not res!756330) (not e!644527))))

(assert (=> d!131425 (= res!756330 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36052 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36052 _keys!1208))))))))

(declare-fun lt!503039 () Unit!36949)

(declare-fun choose!1788 (array!73724 array!73726 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36949)

(assert (=> d!131425 (= lt!503039 (choose!1788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131425 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(assert (=> d!131425 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503039)))

(declare-fun b!1132509 () Bool)

(declare-fun e!644526 () Bool)

(assert (=> b!1132509 (= e!644527 e!644526)))

(declare-fun c!110431 () Bool)

(assert (=> b!1132509 (= c!110431 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1132510 () Bool)

(declare-fun call!48855 () ListLongMap!16071)

(declare-fun call!48854 () ListLongMap!16071)

(assert (=> b!1132510 (= e!644526 (= call!48855 call!48854))))

(assert (=> b!1132510 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36053 _values!996)))))

(declare-fun b!1132511 () Bool)

(assert (=> b!1132511 (= e!644526 (= call!48855 (-!1155 call!48854 k0!934)))))

(assert (=> b!1132511 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36053 _values!996)))))

(declare-fun bm!48851 () Bool)

(assert (=> bm!48851 (= call!48854 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48852 () Bool)

(assert (=> bm!48852 (= call!48855 (getCurrentListMapNoExtraKeys!4550 (array!73725 (store (arr!35514 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36052 _keys!1208)) (array!73727 (store (arr!35515 _values!996) i!673 (ValueCellFull!13526 (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36053 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!131425 res!756330) b!1132509))

(assert (= (and b!1132509 c!110431) b!1132511))

(assert (= (and b!1132509 (not c!110431)) b!1132510))

(assert (= (or b!1132511 b!1132510) bm!48851))

(assert (= (or b!1132511 b!1132510) bm!48852))

(declare-fun b_lambda!18999 () Bool)

(assert (=> (not b_lambda!18999) (not bm!48852)))

(assert (=> bm!48852 t!35773))

(declare-fun b_and!38703 () Bool)

(assert (= b_and!38693 (and (=> t!35773 result!18061) b_and!38703)))

(declare-fun m!1045261 () Bool)

(assert (=> d!131425 m!1045261))

(declare-fun m!1045263 () Bool)

(assert (=> b!1132511 m!1045263))

(assert (=> bm!48851 m!1045073))

(assert (=> bm!48852 m!1045111))

(assert (=> bm!48852 m!1045097))

(assert (=> bm!48852 m!1045099))

(declare-fun m!1045265 () Bool)

(assert (=> bm!48852 m!1045265))

(assert (=> b!1132294 d!131425))

(declare-fun b!1132537 () Bool)

(declare-fun res!756341 () Bool)

(declare-fun e!644547 () Bool)

(assert (=> b!1132537 (=> (not res!756341) (not e!644547))))

(declare-fun lt!503059 () ListLongMap!16071)

(assert (=> b!1132537 (= res!756341 (not (contains!6505 lt!503059 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132538 () Bool)

(declare-fun lt!503058 () Unit!36949)

(declare-fun lt!503054 () Unit!36949)

(assert (=> b!1132538 (= lt!503058 lt!503054)))

(declare-fun lt!503057 () ListLongMap!16071)

(declare-fun lt!503060 () (_ BitVec 64))

(declare-fun lt!503056 () V!43089)

(declare-fun lt!503055 () (_ BitVec 64))

(assert (=> b!1132538 (not (contains!6505 (+!3488 lt!503057 (tuple2!18103 lt!503060 lt!503056)) lt!503055))))

(declare-fun addStillNotContains!285 (ListLongMap!16071 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!36949)

(assert (=> b!1132538 (= lt!503054 (addStillNotContains!285 lt!503057 lt!503060 lt!503056 lt!503055))))

(assert (=> b!1132538 (= lt!503055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!18074 (ValueCell!13526 V!43089) V!43089)

(assert (=> b!1132538 (= lt!503056 (get!18074 (select (arr!35515 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132538 (= lt!503060 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48858 () ListLongMap!16071)

(assert (=> b!1132538 (= lt!503057 call!48858)))

(declare-fun e!644546 () ListLongMap!16071)

(assert (=> b!1132538 (= e!644546 (+!3488 call!48858 (tuple2!18103 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18074 (select (arr!35515 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132539 () Bool)

(declare-fun e!644542 () Bool)

(assert (=> b!1132539 (= e!644542 (= lt!503059 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!48855 () Bool)

(assert (=> bm!48855 (= call!48858 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132540 () Bool)

(declare-fun e!644548 () ListLongMap!16071)

(assert (=> b!1132540 (= e!644548 e!644546)))

(declare-fun c!110441 () Bool)

(assert (=> b!1132540 (= c!110441 (validKeyInArray!0 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132541 () Bool)

(assert (=> b!1132541 (= e!644546 call!48858)))

(declare-fun b!1132542 () Bool)

(assert (=> b!1132542 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(assert (=> b!1132542 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36053 _values!996)))))

(declare-fun e!644545 () Bool)

(declare-fun apply!949 (ListLongMap!16071 (_ BitVec 64)) V!43089)

(assert (=> b!1132542 (= e!644545 (= (apply!949 lt!503059 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18074 (select (arr!35515 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132543 () Bool)

(assert (=> b!1132543 (= e!644548 (ListLongMap!16072 Nil!24847))))

(declare-fun d!131427 () Bool)

(assert (=> d!131427 e!644547))

(declare-fun res!756340 () Bool)

(assert (=> d!131427 (=> (not res!756340) (not e!644547))))

(assert (=> d!131427 (= res!756340 (not (contains!6505 lt!503059 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131427 (= lt!503059 e!644548)))

(declare-fun c!110442 () Bool)

(assert (=> d!131427 (= c!110442 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(assert (=> d!131427 (validMask!0 mask!1564)))

(assert (=> d!131427 (= (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503059)))

(declare-fun b!1132536 () Bool)

(declare-fun e!644543 () Bool)

(assert (=> b!1132536 (= e!644543 e!644545)))

(assert (=> b!1132536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(declare-fun res!756342 () Bool)

(assert (=> b!1132536 (= res!756342 (contains!6505 lt!503059 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132536 (=> (not res!756342) (not e!644545))))

(declare-fun b!1132544 () Bool)

(assert (=> b!1132544 (= e!644543 e!644542)))

(declare-fun c!110440 () Bool)

(assert (=> b!1132544 (= c!110440 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(declare-fun b!1132545 () Bool)

(declare-fun isEmpty!981 (ListLongMap!16071) Bool)

(assert (=> b!1132545 (= e!644542 (isEmpty!981 lt!503059))))

(declare-fun b!1132546 () Bool)

(assert (=> b!1132546 (= e!644547 e!644543)))

(declare-fun c!110443 () Bool)

(declare-fun e!644544 () Bool)

(assert (=> b!1132546 (= c!110443 e!644544)))

(declare-fun res!756339 () Bool)

(assert (=> b!1132546 (=> (not res!756339) (not e!644544))))

(assert (=> b!1132546 (= res!756339 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 _keys!1208)))))

(declare-fun b!1132547 () Bool)

(assert (=> b!1132547 (= e!644544 (validKeyInArray!0 (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132547 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!131427 c!110442) b!1132543))

(assert (= (and d!131427 (not c!110442)) b!1132540))

(assert (= (and b!1132540 c!110441) b!1132538))

(assert (= (and b!1132540 (not c!110441)) b!1132541))

(assert (= (or b!1132538 b!1132541) bm!48855))

(assert (= (and d!131427 res!756340) b!1132537))

(assert (= (and b!1132537 res!756341) b!1132546))

(assert (= (and b!1132546 res!756339) b!1132547))

(assert (= (and b!1132546 c!110443) b!1132536))

(assert (= (and b!1132546 (not c!110443)) b!1132544))

(assert (= (and b!1132536 res!756342) b!1132542))

(assert (= (and b!1132544 c!110440) b!1132539))

(assert (= (and b!1132544 (not c!110440)) b!1132545))

(declare-fun b_lambda!19001 () Bool)

(assert (=> (not b_lambda!19001) (not b!1132538)))

(assert (=> b!1132538 t!35773))

(declare-fun b_and!38705 () Bool)

(assert (= b_and!38703 (and (=> t!35773 result!18061) b_and!38705)))

(declare-fun b_lambda!19003 () Bool)

(assert (=> (not b_lambda!19003) (not b!1132542)))

(assert (=> b!1132542 t!35773))

(declare-fun b_and!38707 () Bool)

(assert (= b_and!38705 (and (=> t!35773 result!18061) b_and!38707)))

(declare-fun m!1045267 () Bool)

(assert (=> b!1132540 m!1045267))

(assert (=> b!1132540 m!1045267))

(declare-fun m!1045269 () Bool)

(assert (=> b!1132540 m!1045269))

(declare-fun m!1045271 () Bool)

(assert (=> b!1132537 m!1045271))

(assert (=> b!1132547 m!1045267))

(assert (=> b!1132547 m!1045267))

(assert (=> b!1132547 m!1045269))

(declare-fun m!1045273 () Bool)

(assert (=> b!1132539 m!1045273))

(assert (=> b!1132538 m!1045267))

(declare-fun m!1045275 () Bool)

(assert (=> b!1132538 m!1045275))

(assert (=> b!1132538 m!1045097))

(declare-fun m!1045277 () Bool)

(assert (=> b!1132538 m!1045277))

(declare-fun m!1045279 () Bool)

(assert (=> b!1132538 m!1045279))

(assert (=> b!1132538 m!1045275))

(assert (=> b!1132538 m!1045097))

(declare-fun m!1045281 () Bool)

(assert (=> b!1132538 m!1045281))

(assert (=> b!1132538 m!1045279))

(declare-fun m!1045283 () Bool)

(assert (=> b!1132538 m!1045283))

(declare-fun m!1045285 () Bool)

(assert (=> b!1132538 m!1045285))

(declare-fun m!1045287 () Bool)

(assert (=> d!131427 m!1045287))

(assert (=> d!131427 m!1045125))

(assert (=> b!1132542 m!1045267))

(assert (=> b!1132542 m!1045275))

(assert (=> b!1132542 m!1045097))

(assert (=> b!1132542 m!1045277))

(assert (=> b!1132542 m!1045267))

(declare-fun m!1045289 () Bool)

(assert (=> b!1132542 m!1045289))

(assert (=> b!1132542 m!1045275))

(assert (=> b!1132542 m!1045097))

(declare-fun m!1045291 () Bool)

(assert (=> b!1132545 m!1045291))

(assert (=> bm!48855 m!1045273))

(assert (=> b!1132536 m!1045267))

(assert (=> b!1132536 m!1045267))

(declare-fun m!1045293 () Bool)

(assert (=> b!1132536 m!1045293))

(assert (=> bm!48795 d!131427))

(declare-fun d!131429 () Bool)

(assert (=> d!131429 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1132313 d!131429))

(declare-fun b!1132549 () Bool)

(declare-fun res!756345 () Bool)

(declare-fun e!644554 () Bool)

(assert (=> b!1132549 (=> (not res!756345) (not e!644554))))

(declare-fun lt!503066 () ListLongMap!16071)

(assert (=> b!1132549 (= res!756345 (not (contains!6505 lt!503066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132550 () Bool)

(declare-fun lt!503065 () Unit!36949)

(declare-fun lt!503061 () Unit!36949)

(assert (=> b!1132550 (= lt!503065 lt!503061)))

(declare-fun lt!503067 () (_ BitVec 64))

(declare-fun lt!503064 () ListLongMap!16071)

(declare-fun lt!503062 () (_ BitVec 64))

(declare-fun lt!503063 () V!43089)

(assert (=> b!1132550 (not (contains!6505 (+!3488 lt!503064 (tuple2!18103 lt!503067 lt!503063)) lt!503062))))

(assert (=> b!1132550 (= lt!503061 (addStillNotContains!285 lt!503064 lt!503067 lt!503063 lt!503062))))

(assert (=> b!1132550 (= lt!503062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132550 (= lt!503063 (get!18074 (select (arr!35515 lt!502945) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132550 (= lt!503067 (select (arr!35514 lt!502934) from!1455))))

(declare-fun call!48859 () ListLongMap!16071)

(assert (=> b!1132550 (= lt!503064 call!48859)))

(declare-fun e!644553 () ListLongMap!16071)

(assert (=> b!1132550 (= e!644553 (+!3488 call!48859 (tuple2!18103 (select (arr!35514 lt!502934) from!1455) (get!18074 (select (arr!35515 lt!502945) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!644549 () Bool)

(declare-fun b!1132551 () Bool)

(assert (=> b!1132551 (= e!644549 (= lt!503066 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!48856 () Bool)

(assert (=> bm!48856 (= call!48859 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132552 () Bool)

(declare-fun e!644555 () ListLongMap!16071)

(assert (=> b!1132552 (= e!644555 e!644553)))

(declare-fun c!110445 () Bool)

(assert (=> b!1132552 (= c!110445 (validKeyInArray!0 (select (arr!35514 lt!502934) from!1455)))))

(declare-fun b!1132553 () Bool)

(assert (=> b!1132553 (= e!644553 call!48859)))

(declare-fun b!1132554 () Bool)

(assert (=> b!1132554 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36052 lt!502934)))))

(assert (=> b!1132554 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36053 lt!502945)))))

(declare-fun e!644552 () Bool)

(assert (=> b!1132554 (= e!644552 (= (apply!949 lt!503066 (select (arr!35514 lt!502934) from!1455)) (get!18074 (select (arr!35515 lt!502945) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132555 () Bool)

(assert (=> b!1132555 (= e!644555 (ListLongMap!16072 Nil!24847))))

(declare-fun d!131431 () Bool)

(assert (=> d!131431 e!644554))

(declare-fun res!756344 () Bool)

(assert (=> d!131431 (=> (not res!756344) (not e!644554))))

(assert (=> d!131431 (= res!756344 (not (contains!6505 lt!503066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131431 (= lt!503066 e!644555)))

(declare-fun c!110446 () Bool)

(assert (=> d!131431 (= c!110446 (bvsge from!1455 (size!36052 lt!502934)))))

(assert (=> d!131431 (validMask!0 mask!1564)))

(assert (=> d!131431 (= (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503066)))

(declare-fun b!1132548 () Bool)

(declare-fun e!644550 () Bool)

(assert (=> b!1132548 (= e!644550 e!644552)))

(assert (=> b!1132548 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36052 lt!502934)))))

(declare-fun res!756346 () Bool)

(assert (=> b!1132548 (= res!756346 (contains!6505 lt!503066 (select (arr!35514 lt!502934) from!1455)))))

(assert (=> b!1132548 (=> (not res!756346) (not e!644552))))

(declare-fun b!1132556 () Bool)

(assert (=> b!1132556 (= e!644550 e!644549)))

(declare-fun c!110444 () Bool)

(assert (=> b!1132556 (= c!110444 (bvslt from!1455 (size!36052 lt!502934)))))

(declare-fun b!1132557 () Bool)

(assert (=> b!1132557 (= e!644549 (isEmpty!981 lt!503066))))

(declare-fun b!1132558 () Bool)

(assert (=> b!1132558 (= e!644554 e!644550)))

(declare-fun c!110447 () Bool)

(declare-fun e!644551 () Bool)

(assert (=> b!1132558 (= c!110447 e!644551)))

(declare-fun res!756343 () Bool)

(assert (=> b!1132558 (=> (not res!756343) (not e!644551))))

(assert (=> b!1132558 (= res!756343 (bvslt from!1455 (size!36052 lt!502934)))))

(declare-fun b!1132559 () Bool)

(assert (=> b!1132559 (= e!644551 (validKeyInArray!0 (select (arr!35514 lt!502934) from!1455)))))

(assert (=> b!1132559 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!131431 c!110446) b!1132555))

(assert (= (and d!131431 (not c!110446)) b!1132552))

(assert (= (and b!1132552 c!110445) b!1132550))

(assert (= (and b!1132552 (not c!110445)) b!1132553))

(assert (= (or b!1132550 b!1132553) bm!48856))

(assert (= (and d!131431 res!756344) b!1132549))

(assert (= (and b!1132549 res!756345) b!1132558))

(assert (= (and b!1132558 res!756343) b!1132559))

(assert (= (and b!1132558 c!110447) b!1132548))

(assert (= (and b!1132558 (not c!110447)) b!1132556))

(assert (= (and b!1132548 res!756346) b!1132554))

(assert (= (and b!1132556 c!110444) b!1132551))

(assert (= (and b!1132556 (not c!110444)) b!1132557))

(declare-fun b_lambda!19005 () Bool)

(assert (=> (not b_lambda!19005) (not b!1132550)))

(assert (=> b!1132550 t!35773))

(declare-fun b_and!38709 () Bool)

(assert (= b_and!38707 (and (=> t!35773 result!18061) b_and!38709)))

(declare-fun b_lambda!19007 () Bool)

(assert (=> (not b_lambda!19007) (not b!1132554)))

(assert (=> b!1132554 t!35773))

(declare-fun b_and!38711 () Bool)

(assert (= b_and!38709 (and (=> t!35773 result!18061) b_and!38711)))

(declare-fun m!1045295 () Bool)

(assert (=> b!1132552 m!1045295))

(assert (=> b!1132552 m!1045295))

(declare-fun m!1045297 () Bool)

(assert (=> b!1132552 m!1045297))

(declare-fun m!1045299 () Bool)

(assert (=> b!1132549 m!1045299))

(assert (=> b!1132559 m!1045295))

(assert (=> b!1132559 m!1045295))

(assert (=> b!1132559 m!1045297))

(declare-fun m!1045301 () Bool)

(assert (=> b!1132551 m!1045301))

(assert (=> b!1132550 m!1045295))

(declare-fun m!1045303 () Bool)

(assert (=> b!1132550 m!1045303))

(assert (=> b!1132550 m!1045097))

(declare-fun m!1045305 () Bool)

(assert (=> b!1132550 m!1045305))

(declare-fun m!1045307 () Bool)

(assert (=> b!1132550 m!1045307))

(assert (=> b!1132550 m!1045303))

(assert (=> b!1132550 m!1045097))

(declare-fun m!1045309 () Bool)

(assert (=> b!1132550 m!1045309))

(assert (=> b!1132550 m!1045307))

(declare-fun m!1045311 () Bool)

(assert (=> b!1132550 m!1045311))

(declare-fun m!1045313 () Bool)

(assert (=> b!1132550 m!1045313))

(declare-fun m!1045315 () Bool)

(assert (=> d!131431 m!1045315))

(assert (=> d!131431 m!1045125))

(assert (=> b!1132554 m!1045295))

(assert (=> b!1132554 m!1045303))

(assert (=> b!1132554 m!1045097))

(assert (=> b!1132554 m!1045305))

(assert (=> b!1132554 m!1045295))

(declare-fun m!1045317 () Bool)

(assert (=> b!1132554 m!1045317))

(assert (=> b!1132554 m!1045303))

(assert (=> b!1132554 m!1045097))

(declare-fun m!1045319 () Bool)

(assert (=> b!1132557 m!1045319))

(assert (=> bm!48856 m!1045301))

(assert (=> b!1132548 m!1045295))

(assert (=> b!1132548 m!1045295))

(declare-fun m!1045321 () Bool)

(assert (=> b!1132548 m!1045321))

(assert (=> b!1132304 d!131431))

(declare-fun b!1132561 () Bool)

(declare-fun res!756349 () Bool)

(declare-fun e!644561 () Bool)

(assert (=> b!1132561 (=> (not res!756349) (not e!644561))))

(declare-fun lt!503073 () ListLongMap!16071)

(assert (=> b!1132561 (= res!756349 (not (contains!6505 lt!503073 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132562 () Bool)

(declare-fun lt!503072 () Unit!36949)

(declare-fun lt!503068 () Unit!36949)

(assert (=> b!1132562 (= lt!503072 lt!503068)))

(declare-fun lt!503071 () ListLongMap!16071)

(declare-fun lt!503074 () (_ BitVec 64))

(declare-fun lt!503070 () V!43089)

(declare-fun lt!503069 () (_ BitVec 64))

(assert (=> b!1132562 (not (contains!6505 (+!3488 lt!503071 (tuple2!18103 lt!503074 lt!503070)) lt!503069))))

(assert (=> b!1132562 (= lt!503068 (addStillNotContains!285 lt!503071 lt!503074 lt!503070 lt!503069))))

(assert (=> b!1132562 (= lt!503069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132562 (= lt!503070 (get!18074 (select (arr!35515 _values!996) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132562 (= lt!503074 (select (arr!35514 _keys!1208) from!1455))))

(declare-fun call!48860 () ListLongMap!16071)

(assert (=> b!1132562 (= lt!503071 call!48860)))

(declare-fun e!644560 () ListLongMap!16071)

(assert (=> b!1132562 (= e!644560 (+!3488 call!48860 (tuple2!18103 (select (arr!35514 _keys!1208) from!1455) (get!18074 (select (arr!35515 _values!996) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132563 () Bool)

(declare-fun e!644556 () Bool)

(assert (=> b!1132563 (= e!644556 (= lt!503073 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!48857 () Bool)

(assert (=> bm!48857 (= call!48860 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132564 () Bool)

(declare-fun e!644562 () ListLongMap!16071)

(assert (=> b!1132564 (= e!644562 e!644560)))

(declare-fun c!110449 () Bool)

(assert (=> b!1132564 (= c!110449 (validKeyInArray!0 (select (arr!35514 _keys!1208) from!1455)))))

(declare-fun b!1132565 () Bool)

(assert (=> b!1132565 (= e!644560 call!48860)))

(declare-fun b!1132566 () Bool)

(assert (=> b!1132566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36052 _keys!1208)))))

(assert (=> b!1132566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36053 _values!996)))))

(declare-fun e!644559 () Bool)

(assert (=> b!1132566 (= e!644559 (= (apply!949 lt!503073 (select (arr!35514 _keys!1208) from!1455)) (get!18074 (select (arr!35515 _values!996) from!1455) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132567 () Bool)

(assert (=> b!1132567 (= e!644562 (ListLongMap!16072 Nil!24847))))

(declare-fun d!131433 () Bool)

(assert (=> d!131433 e!644561))

(declare-fun res!756348 () Bool)

(assert (=> d!131433 (=> (not res!756348) (not e!644561))))

(assert (=> d!131433 (= res!756348 (not (contains!6505 lt!503073 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131433 (= lt!503073 e!644562)))

(declare-fun c!110450 () Bool)

(assert (=> d!131433 (= c!110450 (bvsge from!1455 (size!36052 _keys!1208)))))

(assert (=> d!131433 (validMask!0 mask!1564)))

(assert (=> d!131433 (= (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503073)))

(declare-fun b!1132560 () Bool)

(declare-fun e!644557 () Bool)

(assert (=> b!1132560 (= e!644557 e!644559)))

(assert (=> b!1132560 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36052 _keys!1208)))))

(declare-fun res!756350 () Bool)

(assert (=> b!1132560 (= res!756350 (contains!6505 lt!503073 (select (arr!35514 _keys!1208) from!1455)))))

(assert (=> b!1132560 (=> (not res!756350) (not e!644559))))

(declare-fun b!1132568 () Bool)

(assert (=> b!1132568 (= e!644557 e!644556)))

(declare-fun c!110448 () Bool)

(assert (=> b!1132568 (= c!110448 (bvslt from!1455 (size!36052 _keys!1208)))))

(declare-fun b!1132569 () Bool)

(assert (=> b!1132569 (= e!644556 (isEmpty!981 lt!503073))))

(declare-fun b!1132570 () Bool)

(assert (=> b!1132570 (= e!644561 e!644557)))

(declare-fun c!110451 () Bool)

(declare-fun e!644558 () Bool)

(assert (=> b!1132570 (= c!110451 e!644558)))

(declare-fun res!756347 () Bool)

(assert (=> b!1132570 (=> (not res!756347) (not e!644558))))

(assert (=> b!1132570 (= res!756347 (bvslt from!1455 (size!36052 _keys!1208)))))

(declare-fun b!1132571 () Bool)

(assert (=> b!1132571 (= e!644558 (validKeyInArray!0 (select (arr!35514 _keys!1208) from!1455)))))

(assert (=> b!1132571 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!131433 c!110450) b!1132567))

(assert (= (and d!131433 (not c!110450)) b!1132564))

(assert (= (and b!1132564 c!110449) b!1132562))

(assert (= (and b!1132564 (not c!110449)) b!1132565))

(assert (= (or b!1132562 b!1132565) bm!48857))

(assert (= (and d!131433 res!756348) b!1132561))

(assert (= (and b!1132561 res!756349) b!1132570))

(assert (= (and b!1132570 res!756347) b!1132571))

(assert (= (and b!1132570 c!110451) b!1132560))

(assert (= (and b!1132570 (not c!110451)) b!1132568))

(assert (= (and b!1132560 res!756350) b!1132566))

(assert (= (and b!1132568 c!110448) b!1132563))

(assert (= (and b!1132568 (not c!110448)) b!1132569))

(declare-fun b_lambda!19009 () Bool)

(assert (=> (not b_lambda!19009) (not b!1132562)))

(assert (=> b!1132562 t!35773))

(declare-fun b_and!38713 () Bool)

(assert (= b_and!38711 (and (=> t!35773 result!18061) b_and!38713)))

(declare-fun b_lambda!19011 () Bool)

(assert (=> (not b_lambda!19011) (not b!1132566)))

(assert (=> b!1132566 t!35773))

(declare-fun b_and!38715 () Bool)

(assert (= b_and!38713 (and (=> t!35773 result!18061) b_and!38715)))

(assert (=> b!1132564 m!1045091))

(assert (=> b!1132564 m!1045091))

(declare-fun m!1045323 () Bool)

(assert (=> b!1132564 m!1045323))

(declare-fun m!1045325 () Bool)

(assert (=> b!1132561 m!1045325))

(assert (=> b!1132571 m!1045091))

(assert (=> b!1132571 m!1045091))

(assert (=> b!1132571 m!1045323))

(declare-fun m!1045327 () Bool)

(assert (=> b!1132563 m!1045327))

(assert (=> b!1132562 m!1045091))

(declare-fun m!1045329 () Bool)

(assert (=> b!1132562 m!1045329))

(assert (=> b!1132562 m!1045097))

(declare-fun m!1045331 () Bool)

(assert (=> b!1132562 m!1045331))

(declare-fun m!1045333 () Bool)

(assert (=> b!1132562 m!1045333))

(assert (=> b!1132562 m!1045329))

(assert (=> b!1132562 m!1045097))

(declare-fun m!1045335 () Bool)

(assert (=> b!1132562 m!1045335))

(assert (=> b!1132562 m!1045333))

(declare-fun m!1045337 () Bool)

(assert (=> b!1132562 m!1045337))

(declare-fun m!1045339 () Bool)

(assert (=> b!1132562 m!1045339))

(declare-fun m!1045341 () Bool)

(assert (=> d!131433 m!1045341))

(assert (=> d!131433 m!1045125))

(assert (=> b!1132566 m!1045091))

(assert (=> b!1132566 m!1045329))

(assert (=> b!1132566 m!1045097))

(assert (=> b!1132566 m!1045331))

(assert (=> b!1132566 m!1045091))

(declare-fun m!1045343 () Bool)

(assert (=> b!1132566 m!1045343))

(assert (=> b!1132566 m!1045329))

(assert (=> b!1132566 m!1045097))

(declare-fun m!1045345 () Bool)

(assert (=> b!1132569 m!1045345))

(assert (=> bm!48857 m!1045327))

(assert (=> b!1132560 m!1045091))

(assert (=> b!1132560 m!1045091))

(declare-fun m!1045347 () Bool)

(assert (=> b!1132560 m!1045347))

(assert (=> b!1132304 d!131433))

(declare-fun d!131435 () Bool)

(declare-fun lt!503077 () ListLongMap!16071)

(assert (=> d!131435 (not (contains!6505 lt!503077 k0!934))))

(declare-fun removeStrictlySorted!90 (List!24850 (_ BitVec 64)) List!24850)

(assert (=> d!131435 (= lt!503077 (ListLongMap!16072 (removeStrictlySorted!90 (toList!8051 call!48793) k0!934)))))

(assert (=> d!131435 (= (-!1155 call!48793 k0!934) lt!503077)))

(declare-fun bs!32954 () Bool)

(assert (= bs!32954 d!131435))

(declare-fun m!1045349 () Bool)

(assert (=> bs!32954 m!1045349))

(declare-fun m!1045351 () Bool)

(assert (=> bs!32954 m!1045351))

(assert (=> b!1132297 d!131435))

(declare-fun d!131437 () Bool)

(declare-fun res!756356 () Bool)

(declare-fun e!644569 () Bool)

(assert (=> d!131437 (=> res!756356 e!644569)))

(assert (=> d!131437 (= res!756356 (bvsge #b00000000000000000000000000000000 (size!36052 _keys!1208)))))

(assert (=> d!131437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!644569)))

(declare-fun b!1132580 () Bool)

(declare-fun e!644570 () Bool)

(assert (=> b!1132580 (= e!644569 e!644570)))

(declare-fun c!110454 () Bool)

(assert (=> b!1132580 (= c!110454 (validKeyInArray!0 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132581 () Bool)

(declare-fun e!644571 () Bool)

(declare-fun call!48863 () Bool)

(assert (=> b!1132581 (= e!644571 call!48863)))

(declare-fun b!1132582 () Bool)

(assert (=> b!1132582 (= e!644570 e!644571)))

(declare-fun lt!503084 () (_ BitVec 64))

(assert (=> b!1132582 (= lt!503084 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!503086 () Unit!36949)

(assert (=> b!1132582 (= lt!503086 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503084 #b00000000000000000000000000000000))))

(assert (=> b!1132582 (arrayContainsKey!0 _keys!1208 lt!503084 #b00000000000000000000000000000000)))

(declare-fun lt!503085 () Unit!36949)

(assert (=> b!1132582 (= lt!503085 lt!503086)))

(declare-fun res!756355 () Bool)

(declare-datatypes ((SeekEntryResult!9925 0))(
  ( (MissingZero!9925 (index!42071 (_ BitVec 32))) (Found!9925 (index!42072 (_ BitVec 32))) (Intermediate!9925 (undefined!10737 Bool) (index!42073 (_ BitVec 32)) (x!101517 (_ BitVec 32))) (Undefined!9925) (MissingVacant!9925 (index!42074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73724 (_ BitVec 32)) SeekEntryResult!9925)

(assert (=> b!1132582 (= res!756355 (= (seekEntryOrOpen!0 (select (arr!35514 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9925 #b00000000000000000000000000000000)))))

(assert (=> b!1132582 (=> (not res!756355) (not e!644571))))

(declare-fun b!1132583 () Bool)

(assert (=> b!1132583 (= e!644570 call!48863)))

(declare-fun bm!48860 () Bool)

(assert (=> bm!48860 (= call!48863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!131437 (not res!756356)) b!1132580))

(assert (= (and b!1132580 c!110454) b!1132582))

(assert (= (and b!1132580 (not c!110454)) b!1132583))

(assert (= (and b!1132582 res!756355) b!1132581))

(assert (= (or b!1132581 b!1132583) bm!48860))

(assert (=> b!1132580 m!1045253))

(assert (=> b!1132580 m!1045253))

(assert (=> b!1132580 m!1045255))

(assert (=> b!1132582 m!1045253))

(declare-fun m!1045353 () Bool)

(assert (=> b!1132582 m!1045353))

(declare-fun m!1045355 () Bool)

(assert (=> b!1132582 m!1045355))

(assert (=> b!1132582 m!1045253))

(declare-fun m!1045357 () Bool)

(assert (=> b!1132582 m!1045357))

(declare-fun m!1045359 () Bool)

(assert (=> bm!48860 m!1045359))

(assert (=> b!1132312 d!131437))

(declare-fun d!131439 () Bool)

(assert (=> d!131439 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1132298 d!131439))

(declare-fun b!1132585 () Bool)

(declare-fun res!756359 () Bool)

(declare-fun e!644577 () Bool)

(assert (=> b!1132585 (=> (not res!756359) (not e!644577))))

(declare-fun lt!503092 () ListLongMap!16071)

(assert (=> b!1132585 (= res!756359 (not (contains!6505 lt!503092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132586 () Bool)

(declare-fun lt!503091 () Unit!36949)

(declare-fun lt!503087 () Unit!36949)

(assert (=> b!1132586 (= lt!503091 lt!503087)))

(declare-fun lt!503090 () ListLongMap!16071)

(declare-fun lt!503089 () V!43089)

(declare-fun lt!503088 () (_ BitVec 64))

(declare-fun lt!503093 () (_ BitVec 64))

(assert (=> b!1132586 (not (contains!6505 (+!3488 lt!503090 (tuple2!18103 lt!503093 lt!503089)) lt!503088))))

(assert (=> b!1132586 (= lt!503087 (addStillNotContains!285 lt!503090 lt!503093 lt!503089 lt!503088))))

(assert (=> b!1132586 (= lt!503088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132586 (= lt!503089 (get!18074 (select (arr!35515 lt!502945) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132586 (= lt!503093 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48864 () ListLongMap!16071)

(assert (=> b!1132586 (= lt!503090 call!48864)))

(declare-fun e!644576 () ListLongMap!16071)

(assert (=> b!1132586 (= e!644576 (+!3488 call!48864 (tuple2!18103 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18074 (select (arr!35515 lt!502945) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!644572 () Bool)

(declare-fun b!1132587 () Bool)

(assert (=> b!1132587 (= e!644572 (= lt!503092 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!48861 () Bool)

(assert (=> bm!48861 (= call!48864 (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132588 () Bool)

(declare-fun e!644578 () ListLongMap!16071)

(assert (=> b!1132588 (= e!644578 e!644576)))

(declare-fun c!110456 () Bool)

(assert (=> b!1132588 (= c!110456 (validKeyInArray!0 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132589 () Bool)

(assert (=> b!1132589 (= e!644576 call!48864)))

(declare-fun b!1132590 () Bool)

(assert (=> b!1132590 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 lt!502934)))))

(assert (=> b!1132590 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36053 lt!502945)))))

(declare-fun e!644575 () Bool)

(assert (=> b!1132590 (= e!644575 (= (apply!949 lt!503092 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18074 (select (arr!35515 lt!502945) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1132591 () Bool)

(assert (=> b!1132591 (= e!644578 (ListLongMap!16072 Nil!24847))))

(declare-fun d!131441 () Bool)

(assert (=> d!131441 e!644577))

(declare-fun res!756358 () Bool)

(assert (=> d!131441 (=> (not res!756358) (not e!644577))))

(assert (=> d!131441 (= res!756358 (not (contains!6505 lt!503092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131441 (= lt!503092 e!644578)))

(declare-fun c!110457 () Bool)

(assert (=> d!131441 (= c!110457 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 lt!502934)))))

(assert (=> d!131441 (validMask!0 mask!1564)))

(assert (=> d!131441 (= (getCurrentListMapNoExtraKeys!4550 lt!502934 lt!502945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503092)))

(declare-fun b!1132584 () Bool)

(declare-fun e!644573 () Bool)

(assert (=> b!1132584 (= e!644573 e!644575)))

(assert (=> b!1132584 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 lt!502934)))))

(declare-fun res!756360 () Bool)

(assert (=> b!1132584 (= res!756360 (contains!6505 lt!503092 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132584 (=> (not res!756360) (not e!644575))))

(declare-fun b!1132592 () Bool)

(assert (=> b!1132592 (= e!644573 e!644572)))

(declare-fun c!110455 () Bool)

(assert (=> b!1132592 (= c!110455 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 lt!502934)))))

(declare-fun b!1132593 () Bool)

(assert (=> b!1132593 (= e!644572 (isEmpty!981 lt!503092))))

(declare-fun b!1132594 () Bool)

(assert (=> b!1132594 (= e!644577 e!644573)))

(declare-fun c!110458 () Bool)

(declare-fun e!644574 () Bool)

(assert (=> b!1132594 (= c!110458 e!644574)))

(declare-fun res!756357 () Bool)

(assert (=> b!1132594 (=> (not res!756357) (not e!644574))))

(assert (=> b!1132594 (= res!756357 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36052 lt!502934)))))

(declare-fun b!1132595 () Bool)

(assert (=> b!1132595 (= e!644574 (validKeyInArray!0 (select (arr!35514 lt!502934) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132595 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!131441 c!110457) b!1132591))

(assert (= (and d!131441 (not c!110457)) b!1132588))

(assert (= (and b!1132588 c!110456) b!1132586))

(assert (= (and b!1132588 (not c!110456)) b!1132589))

(assert (= (or b!1132586 b!1132589) bm!48861))

(assert (= (and d!131441 res!756358) b!1132585))

(assert (= (and b!1132585 res!756359) b!1132594))

(assert (= (and b!1132594 res!756357) b!1132595))

(assert (= (and b!1132594 c!110458) b!1132584))

(assert (= (and b!1132594 (not c!110458)) b!1132592))

(assert (= (and b!1132584 res!756360) b!1132590))

(assert (= (and b!1132592 c!110455) b!1132587))

(assert (= (and b!1132592 (not c!110455)) b!1132593))

(declare-fun b_lambda!19013 () Bool)

(assert (=> (not b_lambda!19013) (not b!1132586)))

(assert (=> b!1132586 t!35773))

(declare-fun b_and!38717 () Bool)

(assert (= b_and!38715 (and (=> t!35773 result!18061) b_and!38717)))

(declare-fun b_lambda!19015 () Bool)

(assert (=> (not b_lambda!19015) (not b!1132590)))

(assert (=> b!1132590 t!35773))

(declare-fun b_and!38719 () Bool)

(assert (= b_and!38717 (and (=> t!35773 result!18061) b_and!38719)))

(declare-fun m!1045361 () Bool)

(assert (=> b!1132588 m!1045361))

(assert (=> b!1132588 m!1045361))

(declare-fun m!1045363 () Bool)

(assert (=> b!1132588 m!1045363))

(declare-fun m!1045365 () Bool)

(assert (=> b!1132585 m!1045365))

(assert (=> b!1132595 m!1045361))

(assert (=> b!1132595 m!1045361))

(assert (=> b!1132595 m!1045363))

(declare-fun m!1045367 () Bool)

(assert (=> b!1132587 m!1045367))

(assert (=> b!1132586 m!1045361))

(declare-fun m!1045369 () Bool)

(assert (=> b!1132586 m!1045369))

(assert (=> b!1132586 m!1045097))

(declare-fun m!1045371 () Bool)

(assert (=> b!1132586 m!1045371))

(declare-fun m!1045373 () Bool)

(assert (=> b!1132586 m!1045373))

(assert (=> b!1132586 m!1045369))

(assert (=> b!1132586 m!1045097))

(declare-fun m!1045375 () Bool)

(assert (=> b!1132586 m!1045375))

(assert (=> b!1132586 m!1045373))

(declare-fun m!1045377 () Bool)

(assert (=> b!1132586 m!1045377))

(declare-fun m!1045379 () Bool)

(assert (=> b!1132586 m!1045379))

(declare-fun m!1045381 () Bool)

(assert (=> d!131441 m!1045381))

(assert (=> d!131441 m!1045125))

(assert (=> b!1132590 m!1045361))

(assert (=> b!1132590 m!1045369))

(assert (=> b!1132590 m!1045097))

(assert (=> b!1132590 m!1045371))

(assert (=> b!1132590 m!1045361))

(declare-fun m!1045383 () Bool)

(assert (=> b!1132590 m!1045383))

(assert (=> b!1132590 m!1045369))

(assert (=> b!1132590 m!1045097))

(declare-fun m!1045385 () Bool)

(assert (=> b!1132593 m!1045385))

(assert (=> bm!48861 m!1045367))

(assert (=> b!1132584 m!1045361))

(assert (=> b!1132584 m!1045361))

(declare-fun m!1045387 () Bool)

(assert (=> b!1132584 m!1045387))

(assert (=> bm!48790 d!131441))

(declare-fun d!131443 () Bool)

(assert (=> d!131443 (= (array_inv!27314 _keys!1208) (bvsge (size!36052 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98300 d!131443))

(declare-fun d!131445 () Bool)

(assert (=> d!131445 (= (array_inv!27315 _values!996) (bvsge (size!36053 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98300 d!131445))

(declare-fun d!131447 () Bool)

(declare-fun res!756365 () Bool)

(declare-fun e!644583 () Bool)

(assert (=> d!131447 (=> res!756365 e!644583)))

(assert (=> d!131447 (= res!756365 (= (select (arr!35514 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!131447 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!644583)))

(declare-fun b!1132600 () Bool)

(declare-fun e!644584 () Bool)

(assert (=> b!1132600 (= e!644583 e!644584)))

(declare-fun res!756366 () Bool)

(assert (=> b!1132600 (=> (not res!756366) (not e!644584))))

(assert (=> b!1132600 (= res!756366 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36052 _keys!1208)))))

(declare-fun b!1132601 () Bool)

(assert (=> b!1132601 (= e!644584 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!131447 (not res!756365)) b!1132600))

(assert (= (and b!1132600 res!756366) b!1132601))

(assert (=> d!131447 m!1045267))

(declare-fun m!1045389 () Bool)

(assert (=> b!1132601 m!1045389))

(assert (=> b!1132296 d!131447))

(declare-fun d!131449 () Bool)

(declare-fun e!644589 () Bool)

(assert (=> d!131449 e!644589))

(declare-fun res!756369 () Bool)

(assert (=> d!131449 (=> res!756369 e!644589)))

(declare-fun lt!503103 () Bool)

(assert (=> d!131449 (= res!756369 (not lt!503103))))

(declare-fun lt!503104 () Bool)

(assert (=> d!131449 (= lt!503103 lt!503104)))

(declare-fun lt!503105 () Unit!36949)

(declare-fun e!644590 () Unit!36949)

(assert (=> d!131449 (= lt!503105 e!644590)))

(declare-fun c!110461 () Bool)

(assert (=> d!131449 (= c!110461 lt!503104)))

(declare-fun containsKey!586 (List!24850 (_ BitVec 64)) Bool)

(assert (=> d!131449 (= lt!503104 (containsKey!586 (toList!8051 lt!502940) k0!934))))

(assert (=> d!131449 (= (contains!6505 lt!502940 k0!934) lt!503103)))

(declare-fun b!1132608 () Bool)

(declare-fun lt!503102 () Unit!36949)

(assert (=> b!1132608 (= e!644590 lt!503102)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!415 (List!24850 (_ BitVec 64)) Unit!36949)

(assert (=> b!1132608 (= lt!503102 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8051 lt!502940) k0!934))))

(declare-datatypes ((Option!682 0))(
  ( (Some!681 (v!16930 V!43089)) (None!680) )
))
(declare-fun isDefined!458 (Option!682) Bool)

(declare-fun getValueByKey!631 (List!24850 (_ BitVec 64)) Option!682)

(assert (=> b!1132608 (isDefined!458 (getValueByKey!631 (toList!8051 lt!502940) k0!934))))

(declare-fun b!1132609 () Bool)

(declare-fun Unit!36957 () Unit!36949)

(assert (=> b!1132609 (= e!644590 Unit!36957)))

(declare-fun b!1132610 () Bool)

(assert (=> b!1132610 (= e!644589 (isDefined!458 (getValueByKey!631 (toList!8051 lt!502940) k0!934)))))

(assert (= (and d!131449 c!110461) b!1132608))

(assert (= (and d!131449 (not c!110461)) b!1132609))

(assert (= (and d!131449 (not res!756369)) b!1132610))

(declare-fun m!1045391 () Bool)

(assert (=> d!131449 m!1045391))

(declare-fun m!1045393 () Bool)

(assert (=> b!1132608 m!1045393))

(declare-fun m!1045395 () Bool)

(assert (=> b!1132608 m!1045395))

(assert (=> b!1132608 m!1045395))

(declare-fun m!1045397 () Bool)

(assert (=> b!1132608 m!1045397))

(assert (=> b!1132610 m!1045395))

(assert (=> b!1132610 m!1045395))

(assert (=> b!1132610 m!1045397))

(assert (=> b!1132301 d!131449))

(assert (=> b!1132301 d!131427))

(declare-fun d!131451 () Bool)

(declare-fun e!644593 () Bool)

(assert (=> d!131451 e!644593))

(declare-fun c!110464 () Bool)

(assert (=> d!131451 (= c!110464 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503108 () Unit!36949)

(declare-fun choose!1789 (array!73724 array!73726 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 64) (_ BitVec 32) Int) Unit!36949)

(assert (=> d!131451 (= lt!503108 (choose!1789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131451 (validMask!0 mask!1564)))

(assert (=> d!131451 (= (lemmaListMapContainsThenArrayContainsFrom!320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503108)))

(declare-fun b!1132615 () Bool)

(assert (=> b!1132615 (= e!644593 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132616 () Bool)

(assert (=> b!1132616 (= e!644593 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131451 c!110464) b!1132615))

(assert (= (and d!131451 (not c!110464)) b!1132616))

(declare-fun m!1045399 () Bool)

(assert (=> d!131451 m!1045399))

(assert (=> d!131451 m!1045125))

(assert (=> b!1132615 m!1045069))

(assert (=> b!1132295 d!131451))

(declare-fun d!131453 () Bool)

(assert (=> d!131453 (contains!6505 (+!3488 (ite c!110394 lt!502932 lt!502940) (tuple2!18103 (ite c!110394 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110395 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110394 minValue!944 (ite c!110395 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!503111 () Unit!36949)

(declare-fun choose!1790 (ListLongMap!16071 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!36949)

(assert (=> d!131453 (= lt!503111 (choose!1790 (ite c!110394 lt!502932 lt!502940) (ite c!110394 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110395 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110394 minValue!944 (ite c!110395 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!131453 (contains!6505 (ite c!110394 lt!502932 lt!502940) k0!934)))

(assert (=> d!131453 (= (addStillContains!706 (ite c!110394 lt!502932 lt!502940) (ite c!110394 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110395 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110394 minValue!944 (ite c!110395 zeroValue!944 minValue!944)) k0!934) lt!503111)))

(declare-fun bs!32955 () Bool)

(assert (= bs!32955 d!131453))

(declare-fun m!1045401 () Bool)

(assert (=> bs!32955 m!1045401))

(assert (=> bs!32955 m!1045401))

(declare-fun m!1045403 () Bool)

(assert (=> bs!32955 m!1045403))

(declare-fun m!1045405 () Bool)

(assert (=> bs!32955 m!1045405))

(declare-fun m!1045407 () Bool)

(assert (=> bs!32955 m!1045407))

(assert (=> bm!48789 d!131453))

(declare-fun b!1132618 () Bool)

(declare-fun e!644595 () Bool)

(declare-fun call!48865 () Bool)

(assert (=> b!1132618 (= e!644595 call!48865)))

(declare-fun b!1132619 () Bool)

(declare-fun e!644596 () Bool)

(declare-fun e!644597 () Bool)

(assert (=> b!1132619 (= e!644596 e!644597)))

(declare-fun res!756372 () Bool)

(assert (=> b!1132619 (=> (not res!756372) (not e!644597))))

(declare-fun e!644594 () Bool)

(assert (=> b!1132619 (= res!756372 (not e!644594))))

(declare-fun res!756371 () Bool)

(assert (=> b!1132619 (=> (not res!756371) (not e!644594))))

(assert (=> b!1132619 (= res!756371 (validKeyInArray!0 (select (arr!35514 lt!502934) #b00000000000000000000000000000000)))))

(declare-fun b!1132620 () Bool)

(assert (=> b!1132620 (= e!644597 e!644595)))

(declare-fun c!110465 () Bool)

(assert (=> b!1132620 (= c!110465 (validKeyInArray!0 (select (arr!35514 lt!502934) #b00000000000000000000000000000000)))))

(declare-fun bm!48862 () Bool)

(assert (=> bm!48862 (= call!48865 (arrayNoDuplicates!0 lt!502934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110465 (Cons!24847 (select (arr!35514 lt!502934) #b00000000000000000000000000000000) Nil!24848) Nil!24848)))))

(declare-fun b!1132622 () Bool)

(assert (=> b!1132622 (= e!644594 (contains!6507 Nil!24848 (select (arr!35514 lt!502934) #b00000000000000000000000000000000)))))

(declare-fun d!131455 () Bool)

(declare-fun res!756370 () Bool)

(assert (=> d!131455 (=> res!756370 e!644596)))

(assert (=> d!131455 (= res!756370 (bvsge #b00000000000000000000000000000000 (size!36052 lt!502934)))))

(assert (=> d!131455 (= (arrayNoDuplicates!0 lt!502934 #b00000000000000000000000000000000 Nil!24848) e!644596)))

(declare-fun b!1132621 () Bool)

(assert (=> b!1132621 (= e!644595 call!48865)))

(assert (= (and d!131455 (not res!756370)) b!1132619))

(assert (= (and b!1132619 res!756371) b!1132622))

(assert (= (and b!1132619 res!756372) b!1132620))

(assert (= (and b!1132620 c!110465) b!1132621))

(assert (= (and b!1132620 (not c!110465)) b!1132618))

(assert (= (or b!1132621 b!1132618) bm!48862))

(declare-fun m!1045409 () Bool)

(assert (=> b!1132619 m!1045409))

(assert (=> b!1132619 m!1045409))

(declare-fun m!1045411 () Bool)

(assert (=> b!1132619 m!1045411))

(assert (=> b!1132620 m!1045409))

(assert (=> b!1132620 m!1045409))

(assert (=> b!1132620 m!1045411))

(assert (=> bm!48862 m!1045409))

(declare-fun m!1045413 () Bool)

(assert (=> bm!48862 m!1045413))

(assert (=> b!1132622 m!1045409))

(assert (=> b!1132622 m!1045409))

(declare-fun m!1045415 () Bool)

(assert (=> b!1132622 m!1045415))

(assert (=> b!1132302 d!131455))

(declare-fun d!131457 () Bool)

(declare-fun res!756374 () Bool)

(declare-fun e!644598 () Bool)

(assert (=> d!131457 (=> res!756374 e!644598)))

(assert (=> d!131457 (= res!756374 (bvsge #b00000000000000000000000000000000 (size!36052 lt!502934)))))

(assert (=> d!131457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502934 mask!1564) e!644598)))

(declare-fun b!1132623 () Bool)

(declare-fun e!644599 () Bool)

(assert (=> b!1132623 (= e!644598 e!644599)))

(declare-fun c!110466 () Bool)

(assert (=> b!1132623 (= c!110466 (validKeyInArray!0 (select (arr!35514 lt!502934) #b00000000000000000000000000000000)))))

(declare-fun b!1132624 () Bool)

(declare-fun e!644600 () Bool)

(declare-fun call!48866 () Bool)

(assert (=> b!1132624 (= e!644600 call!48866)))

(declare-fun b!1132625 () Bool)

(assert (=> b!1132625 (= e!644599 e!644600)))

(declare-fun lt!503112 () (_ BitVec 64))

(assert (=> b!1132625 (= lt!503112 (select (arr!35514 lt!502934) #b00000000000000000000000000000000))))

(declare-fun lt!503114 () Unit!36949)

(assert (=> b!1132625 (= lt!503114 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!502934 lt!503112 #b00000000000000000000000000000000))))

(assert (=> b!1132625 (arrayContainsKey!0 lt!502934 lt!503112 #b00000000000000000000000000000000)))

(declare-fun lt!503113 () Unit!36949)

(assert (=> b!1132625 (= lt!503113 lt!503114)))

(declare-fun res!756373 () Bool)

(assert (=> b!1132625 (= res!756373 (= (seekEntryOrOpen!0 (select (arr!35514 lt!502934) #b00000000000000000000000000000000) lt!502934 mask!1564) (Found!9925 #b00000000000000000000000000000000)))))

(assert (=> b!1132625 (=> (not res!756373) (not e!644600))))

(declare-fun b!1132626 () Bool)

(assert (=> b!1132626 (= e!644599 call!48866)))

(declare-fun bm!48863 () Bool)

(assert (=> bm!48863 (= call!48866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!502934 mask!1564))))

(assert (= (and d!131457 (not res!756374)) b!1132623))

(assert (= (and b!1132623 c!110466) b!1132625))

(assert (= (and b!1132623 (not c!110466)) b!1132626))

(assert (= (and b!1132625 res!756373) b!1132624))

(assert (= (or b!1132624 b!1132626) bm!48863))

(assert (=> b!1132623 m!1045409))

(assert (=> b!1132623 m!1045409))

(assert (=> b!1132623 m!1045411))

(assert (=> b!1132625 m!1045409))

(declare-fun m!1045417 () Bool)

(assert (=> b!1132625 m!1045417))

(declare-fun m!1045419 () Bool)

(assert (=> b!1132625 m!1045419))

(assert (=> b!1132625 m!1045409))

(declare-fun m!1045421 () Bool)

(assert (=> b!1132625 m!1045421))

(declare-fun m!1045423 () Bool)

(assert (=> bm!48863 m!1045423))

(assert (=> b!1132309 d!131457))

(declare-fun d!131459 () Bool)

(assert (=> d!131459 (contains!6505 (+!3488 lt!502940 (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!503115 () Unit!36949)

(assert (=> d!131459 (= lt!503115 (choose!1790 lt!502940 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!131459 (contains!6505 lt!502940 k0!934)))

(assert (=> d!131459 (= (addStillContains!706 lt!502940 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!503115)))

(declare-fun bs!32956 () Bool)

(assert (= bs!32956 d!131459))

(declare-fun m!1045425 () Bool)

(assert (=> bs!32956 m!1045425))

(assert (=> bs!32956 m!1045425))

(declare-fun m!1045427 () Bool)

(assert (=> bs!32956 m!1045427))

(declare-fun m!1045429 () Bool)

(assert (=> bs!32956 m!1045429))

(assert (=> bs!32956 m!1045071))

(assert (=> b!1132299 d!131459))

(declare-fun d!131461 () Bool)

(declare-fun e!644601 () Bool)

(assert (=> d!131461 e!644601))

(declare-fun res!756375 () Bool)

(assert (=> d!131461 (=> res!756375 e!644601)))

(declare-fun lt!503117 () Bool)

(assert (=> d!131461 (= res!756375 (not lt!503117))))

(declare-fun lt!503118 () Bool)

(assert (=> d!131461 (= lt!503117 lt!503118)))

(declare-fun lt!503119 () Unit!36949)

(declare-fun e!644602 () Unit!36949)

(assert (=> d!131461 (= lt!503119 e!644602)))

(declare-fun c!110467 () Bool)

(assert (=> d!131461 (= c!110467 lt!503118)))

(assert (=> d!131461 (= lt!503118 (containsKey!586 (toList!8051 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!131461 (= (contains!6505 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!503117)))

(declare-fun b!1132627 () Bool)

(declare-fun lt!503116 () Unit!36949)

(assert (=> b!1132627 (= e!644602 lt!503116)))

(assert (=> b!1132627 (= lt!503116 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8051 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1132627 (isDefined!458 (getValueByKey!631 (toList!8051 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1132628 () Bool)

(declare-fun Unit!36958 () Unit!36949)

(assert (=> b!1132628 (= e!644602 Unit!36958)))

(declare-fun b!1132629 () Bool)

(assert (=> b!1132629 (= e!644601 (isDefined!458 (getValueByKey!631 (toList!8051 (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!131461 c!110467) b!1132627))

(assert (= (and d!131461 (not c!110467)) b!1132628))

(assert (= (and d!131461 (not res!756375)) b!1132629))

(declare-fun m!1045431 () Bool)

(assert (=> d!131461 m!1045431))

(declare-fun m!1045433 () Bool)

(assert (=> b!1132627 m!1045433))

(declare-fun m!1045435 () Bool)

(assert (=> b!1132627 m!1045435))

(assert (=> b!1132627 m!1045435))

(declare-fun m!1045437 () Bool)

(assert (=> b!1132627 m!1045437))

(assert (=> b!1132629 m!1045435))

(assert (=> b!1132629 m!1045435))

(assert (=> b!1132629 m!1045437))

(assert (=> b!1132299 d!131461))

(declare-fun d!131463 () Bool)

(declare-fun e!644605 () Bool)

(assert (=> d!131463 e!644605))

(declare-fun res!756380 () Bool)

(assert (=> d!131463 (=> (not res!756380) (not e!644605))))

(declare-fun lt!503128 () ListLongMap!16071)

(assert (=> d!131463 (= res!756380 (contains!6505 lt!503128 (_1!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!503129 () List!24850)

(assert (=> d!131463 (= lt!503128 (ListLongMap!16072 lt!503129))))

(declare-fun lt!503131 () Unit!36949)

(declare-fun lt!503130 () Unit!36949)

(assert (=> d!131463 (= lt!503131 lt!503130)))

(assert (=> d!131463 (= (getValueByKey!631 lt!503129 (_1!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!307 (List!24850 (_ BitVec 64) V!43089) Unit!36949)

(assert (=> d!131463 (= lt!503130 (lemmaContainsTupThenGetReturnValue!307 lt!503129 (_1!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!400 (List!24850 (_ BitVec 64) V!43089) List!24850)

(assert (=> d!131463 (= lt!503129 (insertStrictlySorted!400 (toList!8051 lt!502932) (_1!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131463 (= (+!3488 lt!502932 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!503128)))

(declare-fun b!1132634 () Bool)

(declare-fun res!756381 () Bool)

(assert (=> b!1132634 (=> (not res!756381) (not e!644605))))

(assert (=> b!1132634 (= res!756381 (= (getValueByKey!631 (toList!8051 lt!503128) (_1!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9062 (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132635 () Bool)

(declare-fun contains!6508 (List!24850 tuple2!18102) Bool)

(assert (=> b!1132635 (= e!644605 (contains!6508 (toList!8051 lt!503128) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131463 res!756380) b!1132634))

(assert (= (and b!1132634 res!756381) b!1132635))

(declare-fun m!1045439 () Bool)

(assert (=> d!131463 m!1045439))

(declare-fun m!1045441 () Bool)

(assert (=> d!131463 m!1045441))

(declare-fun m!1045443 () Bool)

(assert (=> d!131463 m!1045443))

(declare-fun m!1045445 () Bool)

(assert (=> d!131463 m!1045445))

(declare-fun m!1045447 () Bool)

(assert (=> b!1132634 m!1045447))

(declare-fun m!1045449 () Bool)

(assert (=> b!1132635 m!1045449))

(assert (=> b!1132299 d!131463))

(declare-fun d!131465 () Bool)

(declare-fun e!644606 () Bool)

(assert (=> d!131465 e!644606))

(declare-fun res!756382 () Bool)

(assert (=> d!131465 (=> (not res!756382) (not e!644606))))

(declare-fun lt!503132 () ListLongMap!16071)

(assert (=> d!131465 (= res!756382 (contains!6505 lt!503132 (_1!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!503133 () List!24850)

(assert (=> d!131465 (= lt!503132 (ListLongMap!16072 lt!503133))))

(declare-fun lt!503135 () Unit!36949)

(declare-fun lt!503134 () Unit!36949)

(assert (=> d!131465 (= lt!503135 lt!503134)))

(assert (=> d!131465 (= (getValueByKey!631 lt!503133 (_1!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!681 (_2!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131465 (= lt!503134 (lemmaContainsTupThenGetReturnValue!307 lt!503133 (_1!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131465 (= lt!503133 (insertStrictlySorted!400 (toList!8051 lt!502940) (_1!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131465 (= (+!3488 lt!502940 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503132)))

(declare-fun b!1132636 () Bool)

(declare-fun res!756383 () Bool)

(assert (=> b!1132636 (=> (not res!756383) (not e!644606))))

(assert (=> b!1132636 (= res!756383 (= (getValueByKey!631 (toList!8051 lt!503132) (_1!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!681 (_2!9062 (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132637 () Bool)

(assert (=> b!1132637 (= e!644606 (contains!6508 (toList!8051 lt!503132) (ite (or c!110394 c!110395) (tuple2!18103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131465 res!756382) b!1132636))

(assert (= (and b!1132636 res!756383) b!1132637))

(declare-fun m!1045451 () Bool)

(assert (=> d!131465 m!1045451))

(declare-fun m!1045453 () Bool)

(assert (=> d!131465 m!1045453))

(declare-fun m!1045455 () Bool)

(assert (=> d!131465 m!1045455))

(declare-fun m!1045457 () Bool)

(assert (=> d!131465 m!1045457))

(declare-fun m!1045459 () Bool)

(assert (=> b!1132636 m!1045459))

(declare-fun m!1045461 () Bool)

(assert (=> b!1132637 m!1045461))

(assert (=> bm!48793 d!131465))

(declare-fun d!131467 () Bool)

(declare-fun e!644607 () Bool)

(assert (=> d!131467 e!644607))

(declare-fun res!756384 () Bool)

(assert (=> d!131467 (=> res!756384 e!644607)))

(declare-fun lt!503137 () Bool)

(assert (=> d!131467 (= res!756384 (not lt!503137))))

(declare-fun lt!503138 () Bool)

(assert (=> d!131467 (= lt!503137 lt!503138)))

(declare-fun lt!503139 () Unit!36949)

(declare-fun e!644608 () Unit!36949)

(assert (=> d!131467 (= lt!503139 e!644608)))

(declare-fun c!110468 () Bool)

(assert (=> d!131467 (= c!110468 lt!503138)))

(assert (=> d!131467 (= lt!503138 (containsKey!586 (toList!8051 (ite c!110394 lt!502932 call!48792)) k0!934))))

(assert (=> d!131467 (= (contains!6505 (ite c!110394 lt!502932 call!48792) k0!934) lt!503137)))

(declare-fun b!1132638 () Bool)

(declare-fun lt!503136 () Unit!36949)

(assert (=> b!1132638 (= e!644608 lt!503136)))

(assert (=> b!1132638 (= lt!503136 (lemmaContainsKeyImpliesGetValueByKeyDefined!415 (toList!8051 (ite c!110394 lt!502932 call!48792)) k0!934))))

(assert (=> b!1132638 (isDefined!458 (getValueByKey!631 (toList!8051 (ite c!110394 lt!502932 call!48792)) k0!934))))

(declare-fun b!1132639 () Bool)

(declare-fun Unit!36959 () Unit!36949)

(assert (=> b!1132639 (= e!644608 Unit!36959)))

(declare-fun b!1132640 () Bool)

(assert (=> b!1132640 (= e!644607 (isDefined!458 (getValueByKey!631 (toList!8051 (ite c!110394 lt!502932 call!48792)) k0!934)))))

(assert (= (and d!131467 c!110468) b!1132638))

(assert (= (and d!131467 (not c!110468)) b!1132639))

(assert (= (and d!131467 (not res!756384)) b!1132640))

(declare-fun m!1045463 () Bool)

(assert (=> d!131467 m!1045463))

(declare-fun m!1045465 () Bool)

(assert (=> b!1132638 m!1045465))

(declare-fun m!1045467 () Bool)

(assert (=> b!1132638 m!1045467))

(assert (=> b!1132638 m!1045467))

(declare-fun m!1045469 () Bool)

(assert (=> b!1132638 m!1045469))

(assert (=> b!1132640 m!1045467))

(assert (=> b!1132640 m!1045467))

(assert (=> b!1132640 m!1045469))

(assert (=> bm!48788 d!131467))

(declare-fun d!131469 () Bool)

(declare-fun res!756385 () Bool)

(declare-fun e!644609 () Bool)

(assert (=> d!131469 (=> res!756385 e!644609)))

(assert (=> d!131469 (= res!756385 (= (select (arr!35514 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131469 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!644609)))

(declare-fun b!1132641 () Bool)

(declare-fun e!644610 () Bool)

(assert (=> b!1132641 (= e!644609 e!644610)))

(declare-fun res!756386 () Bool)

(assert (=> b!1132641 (=> (not res!756386) (not e!644610))))

(assert (=> b!1132641 (= res!756386 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36052 _keys!1208)))))

(declare-fun b!1132642 () Bool)

(assert (=> b!1132642 (= e!644610 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131469 (not res!756385)) b!1132641))

(assert (= (and b!1132641 res!756386) b!1132642))

(assert (=> d!131469 m!1045253))

(declare-fun m!1045471 () Bool)

(assert (=> b!1132642 m!1045471))

(assert (=> b!1132318 d!131469))

(declare-fun d!131471 () Bool)

(assert (=> d!131471 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503142 () Unit!36949)

(declare-fun choose!13 (array!73724 (_ BitVec 64) (_ BitVec 32)) Unit!36949)

(assert (=> d!131471 (= lt!503142 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131471 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131471 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!503142)))

(declare-fun bs!32957 () Bool)

(assert (= bs!32957 d!131471))

(assert (=> bs!32957 m!1045077))

(declare-fun m!1045473 () Bool)

(assert (=> bs!32957 m!1045473))

(assert (=> b!1132318 d!131471))

(declare-fun condMapEmpty!44537 () Bool)

(declare-fun mapDefault!44537 () ValueCell!13526)

(assert (=> mapNonEmpty!44528 (= condMapEmpty!44537 (= mapRest!44528 ((as const (Array (_ BitVec 32) ValueCell!13526)) mapDefault!44537)))))

(declare-fun e!644615 () Bool)

(declare-fun mapRes!44537 () Bool)

(assert (=> mapNonEmpty!44528 (= tp!84530 (and e!644615 mapRes!44537))))

(declare-fun b!1132649 () Bool)

(declare-fun e!644616 () Bool)

(assert (=> b!1132649 (= e!644616 tp_is_empty!28471)))

(declare-fun mapIsEmpty!44537 () Bool)

(assert (=> mapIsEmpty!44537 mapRes!44537))

(declare-fun b!1132650 () Bool)

(assert (=> b!1132650 (= e!644615 tp_is_empty!28471)))

(declare-fun mapNonEmpty!44537 () Bool)

(declare-fun tp!84546 () Bool)

(assert (=> mapNonEmpty!44537 (= mapRes!44537 (and tp!84546 e!644616))))

(declare-fun mapRest!44537 () (Array (_ BitVec 32) ValueCell!13526))

(declare-fun mapKey!44537 () (_ BitVec 32))

(declare-fun mapValue!44537 () ValueCell!13526)

(assert (=> mapNonEmpty!44537 (= mapRest!44528 (store mapRest!44537 mapKey!44537 mapValue!44537))))

(assert (= (and mapNonEmpty!44528 condMapEmpty!44537) mapIsEmpty!44537))

(assert (= (and mapNonEmpty!44528 (not condMapEmpty!44537)) mapNonEmpty!44537))

(assert (= (and mapNonEmpty!44537 ((_ is ValueCellFull!13526) mapValue!44537)) b!1132649))

(assert (= (and mapNonEmpty!44528 ((_ is ValueCellFull!13526) mapDefault!44537)) b!1132650))

(declare-fun m!1045475 () Bool)

(assert (=> mapNonEmpty!44537 m!1045475))

(declare-fun b_lambda!19017 () Bool)

(assert (= b_lambda!19007 (or (and start!98300 b_free!23941) b_lambda!19017)))

(declare-fun b_lambda!19019 () Bool)

(assert (= b_lambda!19003 (or (and start!98300 b_free!23941) b_lambda!19019)))

(declare-fun b_lambda!19021 () Bool)

(assert (= b_lambda!19013 (or (and start!98300 b_free!23941) b_lambda!19021)))

(declare-fun b_lambda!19023 () Bool)

(assert (= b_lambda!18999 (or (and start!98300 b_free!23941) b_lambda!19023)))

(declare-fun b_lambda!19025 () Bool)

(assert (= b_lambda!19011 (or (and start!98300 b_free!23941) b_lambda!19025)))

(declare-fun b_lambda!19027 () Bool)

(assert (= b_lambda!19009 (or (and start!98300 b_free!23941) b_lambda!19027)))

(declare-fun b_lambda!19029 () Bool)

(assert (= b_lambda!19015 (or (and start!98300 b_free!23941) b_lambda!19029)))

(declare-fun b_lambda!19031 () Bool)

(assert (= b_lambda!19001 (or (and start!98300 b_free!23941) b_lambda!19031)))

(declare-fun b_lambda!19033 () Bool)

(assert (= b_lambda!19005 (or (and start!98300 b_free!23941) b_lambda!19033)))

(check-sat (not b!1132629) (not b!1132551) (not b!1132571) (not b_lambda!19025) (not b!1132569) (not b!1132550) (not b!1132615) b_and!38719 (not b!1132564) (not d!131459) (not bm!48852) (not b!1132539) (not b!1132593) (not d!131427) (not b!1132586) (not bm!48863) (not b_lambda!19033) (not b_lambda!19017) (not b!1132547) (not b!1132635) (not b!1132620) (not bm!48851) (not b!1132502) (not d!131433) (not bm!48861) (not b!1132587) (not b!1132554) (not b!1132595) (not d!131425) (not d!131471) (not b!1132588) (not bm!48857) (not b!1132627) (not b!1132634) (not b_lambda!19023) (not b!1132560) (not b!1132552) (not d!131465) (not b!1132638) (not b!1132566) (not bm!48846) (not b!1132610) (not b!1132582) (not bm!48862) (not b!1132537) (not b_lambda!19019) (not b!1132584) (not b!1132499) (not b!1132601) (not b!1132540) (not b!1132536) (not b!1132642) (not b!1132563) (not b!1132500) (not d!131461) (not b_lambda!19027) (not b_lambda!18997) (not d!131453) (not d!131467) (not bm!48860) (not d!131449) (not b!1132548) (not b_lambda!19031) (not b_next!23941) (not b!1132637) (not bm!48856) (not b!1132511) (not b!1132580) (not b!1132557) (not d!131435) (not b!1132559) tp_is_empty!28471 (not b!1132619) (not d!131451) (not b!1132561) (not b!1132608) (not b!1132590) (not b!1132636) (not b!1132545) (not b_lambda!19021) (not mapNonEmpty!44537) (not b!1132622) (not d!131441) (not b!1132640) (not bm!48855) (not d!131463) (not b!1132538) (not d!131431) (not b!1132585) (not b!1132549) (not b!1132623) (not b!1132542) (not b!1132562) (not b!1132625) (not b_lambda!19029))
(check-sat b_and!38719 (not b_next!23941))
