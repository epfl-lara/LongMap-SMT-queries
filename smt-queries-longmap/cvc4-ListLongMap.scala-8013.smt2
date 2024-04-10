; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98922 () Bool)

(assert start!98922)

(declare-fun b_free!24527 () Bool)

(declare-fun b_next!24527 () Bool)

(assert (=> start!98922 (= b_free!24527 (not b_next!24527))))

(declare-fun tp!86291 () Bool)

(declare-fun b_and!39903 () Bool)

(assert (=> start!98922 (= tp!86291 b_and!39903)))

(declare-fun b!1159254 () Bool)

(declare-fun res!769532 () Bool)

(declare-fun e!659227 () Bool)

(assert (=> b!1159254 (=> (not res!769532) (not e!659227))))

(declare-datatypes ((array!74955 0))(
  ( (array!74956 (arr!36128 (Array (_ BitVec 32) (_ BitVec 64))) (size!36664 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74955)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74955 (_ BitVec 32)) Bool)

(assert (=> b!1159254 (= res!769532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1159255 () Bool)

(declare-fun e!659230 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159255 (= e!659230 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159256 () Bool)

(declare-datatypes ((Unit!38202 0))(
  ( (Unit!38203) )
))
(declare-fun e!659222 () Unit!38202)

(declare-fun Unit!38204 () Unit!38202)

(assert (=> b!1159256 (= e!659222 Unit!38204)))

(declare-fun lt!521140 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1159256 (= lt!521140 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115603 () Bool)

(assert (=> b!1159256 (= c!115603 (and (not lt!521140) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521144 () Unit!38202)

(declare-fun e!659233 () Unit!38202)

(assert (=> b!1159256 (= lt!521144 e!659233)))

(declare-datatypes ((V!43869 0))(
  ( (V!43870 (val!14585 Int)) )
))
(declare-fun zeroValue!944 () V!43869)

(declare-datatypes ((ValueCell!13819 0))(
  ( (ValueCellFull!13819 (v!17222 V!43869)) (EmptyCell!13819) )
))
(declare-datatypes ((array!74957 0))(
  ( (array!74958 (arr!36129 (Array (_ BitVec 32) ValueCell!13819)) (size!36665 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74957)

(declare-fun minValue!944 () V!43869)

(declare-fun lt!521130 () Unit!38202)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!519 (array!74955 array!74957 (_ BitVec 32) (_ BitVec 32) V!43869 V!43869 (_ BitVec 64) (_ BitVec 32) Int) Unit!38202)

(assert (=> b!1159256 (= lt!521130 (lemmaListMapContainsThenArrayContainsFrom!519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115605 () Bool)

(assert (=> b!1159256 (= c!115605 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769534 () Bool)

(assert (=> b!1159256 (= res!769534 e!659230)))

(declare-fun e!659238 () Bool)

(assert (=> b!1159256 (=> (not res!769534) (not e!659238))))

(assert (=> b!1159256 e!659238))

(declare-fun lt!521134 () Unit!38202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74955 (_ BitVec 32) (_ BitVec 32)) Unit!38202)

(assert (=> b!1159256 (= lt!521134 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25306 0))(
  ( (Nil!25303) (Cons!25302 (h!26511 (_ BitVec 64)) (t!36825 List!25306)) )
))
(declare-fun arrayNoDuplicates!0 (array!74955 (_ BitVec 32) List!25306) Bool)

(assert (=> b!1159256 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25303)))

(declare-fun lt!521124 () Unit!38202)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74955 (_ BitVec 64) (_ BitVec 32) List!25306) Unit!38202)

(assert (=> b!1159256 (= lt!521124 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25303))))

(assert (=> b!1159256 false))

(declare-fun b!1159257 () Bool)

(declare-fun res!769536 () Bool)

(assert (=> b!1159257 (=> (not res!769536) (not e!659227))))

(assert (=> b!1159257 (= res!769536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25303))))

(declare-fun b!1159258 () Bool)

(declare-fun e!659228 () Bool)

(declare-fun tp_is_empty!29057 () Bool)

(assert (=> b!1159258 (= e!659228 tp_is_empty!29057)))

(declare-fun b!1159259 () Bool)

(declare-fun res!769533 () Bool)

(assert (=> b!1159259 (=> (not res!769533) (not e!659227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159259 (= res!769533 (validMask!0 mask!1564))))

(declare-fun b!1159260 () Bool)

(declare-fun e!659235 () Bool)

(assert (=> b!1159260 (= e!659235 true)))

(declare-fun e!659234 () Bool)

(assert (=> b!1159260 e!659234))

(declare-fun res!769531 () Bool)

(assert (=> b!1159260 (=> (not res!769531) (not e!659234))))

(declare-datatypes ((tuple2!18568 0))(
  ( (tuple2!18569 (_1!9295 (_ BitVec 64)) (_2!9295 V!43869)) )
))
(declare-datatypes ((List!25307 0))(
  ( (Nil!25304) (Cons!25303 (h!26512 tuple2!18568) (t!36826 List!25307)) )
))
(declare-datatypes ((ListLongMap!16537 0))(
  ( (ListLongMap!16538 (toList!8284 List!25307)) )
))
(declare-fun lt!521133 () ListLongMap!16537)

(declare-fun lt!521136 () ListLongMap!16537)

(assert (=> b!1159260 (= res!769531 (= lt!521133 lt!521136))))

(declare-fun lt!521135 () ListLongMap!16537)

(declare-fun -!1395 (ListLongMap!16537 (_ BitVec 64)) ListLongMap!16537)

(assert (=> b!1159260 (= lt!521133 (-!1395 lt!521135 k!934))))

(declare-fun lt!521142 () V!43869)

(declare-fun +!3692 (ListLongMap!16537 tuple2!18568) ListLongMap!16537)

(assert (=> b!1159260 (= (-!1395 (+!3692 lt!521136 (tuple2!18569 (select (arr!36128 _keys!1208) from!1455) lt!521142)) (select (arr!36128 _keys!1208) from!1455)) lt!521136)))

(declare-fun lt!521125 () Unit!38202)

(declare-fun addThenRemoveForNewKeyIsSame!231 (ListLongMap!16537 (_ BitVec 64) V!43869) Unit!38202)

(assert (=> b!1159260 (= lt!521125 (addThenRemoveForNewKeyIsSame!231 lt!521136 (select (arr!36128 _keys!1208) from!1455) lt!521142))))

(declare-fun lt!521126 () V!43869)

(declare-fun get!18419 (ValueCell!13819 V!43869) V!43869)

(assert (=> b!1159260 (= lt!521142 (get!18419 (select (arr!36129 _values!996) from!1455) lt!521126))))

(declare-fun lt!521139 () Unit!38202)

(assert (=> b!1159260 (= lt!521139 e!659222)))

(declare-fun c!115602 () Bool)

(declare-fun contains!6793 (ListLongMap!16537 (_ BitVec 64)) Bool)

(assert (=> b!1159260 (= c!115602 (contains!6793 lt!521136 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4748 (array!74955 array!74957 (_ BitVec 32) (_ BitVec 32) V!43869 V!43869 (_ BitVec 32) Int) ListLongMap!16537)

(assert (=> b!1159260 (= lt!521136 (getCurrentListMapNoExtraKeys!4748 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159261 () Bool)

(declare-fun call!55867 () ListLongMap!16537)

(assert (=> b!1159261 (contains!6793 call!55867 k!934)))

(declare-fun lt!521143 () Unit!38202)

(declare-fun call!55871 () Unit!38202)

(assert (=> b!1159261 (= lt!521143 call!55871)))

(declare-fun call!55869 () Bool)

(assert (=> b!1159261 call!55869))

(declare-fun lt!521131 () ListLongMap!16537)

(assert (=> b!1159261 (= lt!521131 (+!3692 lt!521136 (tuple2!18569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521137 () Unit!38202)

(declare-fun addStillContains!934 (ListLongMap!16537 (_ BitVec 64) V!43869 (_ BitVec 64)) Unit!38202)

(assert (=> b!1159261 (= lt!521137 (addStillContains!934 lt!521136 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1159261 (= e!659233 lt!521143)))

(declare-fun mapIsEmpty!45410 () Bool)

(declare-fun mapRes!45410 () Bool)

(assert (=> mapIsEmpty!45410 mapRes!45410))

(declare-fun bm!55863 () Bool)

(declare-fun call!55870 () Bool)

(assert (=> bm!55863 (= call!55870 call!55869)))

(declare-fun b!1159262 () Bool)

(declare-fun e!659225 () Unit!38202)

(declare-fun e!659226 () Unit!38202)

(assert (=> b!1159262 (= e!659225 e!659226)))

(declare-fun c!115606 () Bool)

(assert (=> b!1159262 (= c!115606 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521140))))

(declare-fun b!1159263 () Bool)

(declare-fun Unit!38205 () Unit!38202)

(assert (=> b!1159263 (= e!659226 Unit!38205)))

(declare-fun b!1159264 () Bool)

(declare-fun res!769527 () Bool)

(assert (=> b!1159264 (=> (not res!769527) (not e!659227))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159264 (= res!769527 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36664 _keys!1208))))))

(declare-fun b!1159265 () Bool)

(declare-fun e!659229 () Bool)

(declare-fun e!659224 () Bool)

(assert (=> b!1159265 (= e!659229 e!659224)))

(declare-fun res!769528 () Bool)

(assert (=> b!1159265 (=> res!769528 e!659224)))

(assert (=> b!1159265 (= res!769528 (not (= from!1455 i!673)))))

(declare-fun lt!521141 () ListLongMap!16537)

(declare-fun lt!521145 () array!74957)

(declare-fun lt!521132 () array!74955)

(assert (=> b!1159265 (= lt!521141 (getCurrentListMapNoExtraKeys!4748 lt!521132 lt!521145 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159265 (= lt!521145 (array!74958 (store (arr!36129 _values!996) i!673 (ValueCellFull!13819 lt!521126)) (size!36665 _values!996)))))

(declare-fun dynLambda!2752 (Int (_ BitVec 64)) V!43869)

(assert (=> b!1159265 (= lt!521126 (dynLambda!2752 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159265 (= lt!521135 (getCurrentListMapNoExtraKeys!4748 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159266 () Bool)

(declare-fun res!769525 () Bool)

(declare-fun e!659236 () Bool)

(assert (=> b!1159266 (=> (not res!769525) (not e!659236))))

(assert (=> b!1159266 (= res!769525 (arrayNoDuplicates!0 lt!521132 #b00000000000000000000000000000000 Nil!25303))))

(declare-fun b!1159267 () Bool)

(declare-fun c!115601 () Bool)

(assert (=> b!1159267 (= c!115601 (and (not lt!521140) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159267 (= e!659233 e!659225)))

(declare-fun b!1159268 () Bool)

(assert (=> b!1159268 (= e!659230 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521140) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159269 () Bool)

(declare-fun res!769537 () Bool)

(assert (=> b!1159269 (=> (not res!769537) (not e!659227))))

(assert (=> b!1159269 (= res!769537 (and (= (size!36665 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36664 _keys!1208) (size!36665 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!55868 () ListLongMap!16537)

(declare-fun bm!55864 () Bool)

(assert (=> bm!55864 (= call!55869 (contains!6793 (ite c!115603 lt!521131 call!55868) k!934))))

(declare-fun b!1159270 () Bool)

(declare-fun lt!521138 () Unit!38202)

(assert (=> b!1159270 (= e!659225 lt!521138)))

(declare-fun call!55873 () Unit!38202)

(assert (=> b!1159270 (= lt!521138 call!55873)))

(assert (=> b!1159270 call!55870))

(declare-fun bm!55865 () Bool)

(assert (=> bm!55865 (= call!55871 (addStillContains!934 (ite c!115603 lt!521131 lt!521136) (ite c!115603 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115601 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115603 minValue!944 (ite c!115601 zeroValue!944 minValue!944)) k!934))))

(declare-fun mapNonEmpty!45410 () Bool)

(declare-fun tp!86292 () Bool)

(declare-fun e!659237 () Bool)

(assert (=> mapNonEmpty!45410 (= mapRes!45410 (and tp!86292 e!659237))))

(declare-fun mapValue!45410 () ValueCell!13819)

(declare-fun mapKey!45410 () (_ BitVec 32))

(declare-fun mapRest!45410 () (Array (_ BitVec 32) ValueCell!13819))

(assert (=> mapNonEmpty!45410 (= (arr!36129 _values!996) (store mapRest!45410 mapKey!45410 mapValue!45410))))

(declare-fun b!1159271 () Bool)

(declare-fun res!769529 () Bool)

(assert (=> b!1159271 (=> (not res!769529) (not e!659227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159271 (= res!769529 (validKeyInArray!0 k!934))))

(declare-fun b!1159272 () Bool)

(assert (=> b!1159272 (= e!659238 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!769535 () Bool)

(assert (=> start!98922 (=> (not res!769535) (not e!659227))))

(assert (=> start!98922 (= res!769535 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36664 _keys!1208))))))

(assert (=> start!98922 e!659227))

(assert (=> start!98922 tp_is_empty!29057))

(declare-fun array_inv!27646 (array!74955) Bool)

(assert (=> start!98922 (array_inv!27646 _keys!1208)))

(assert (=> start!98922 true))

(assert (=> start!98922 tp!86291))

(declare-fun e!659231 () Bool)

(declare-fun array_inv!27647 (array!74957) Bool)

(assert (=> start!98922 (and (array_inv!27647 _values!996) e!659231)))

(declare-fun b!1159273 () Bool)

(assert (=> b!1159273 (= e!659224 e!659235)))

(declare-fun res!769538 () Bool)

(assert (=> b!1159273 (=> res!769538 e!659235)))

(assert (=> b!1159273 (= res!769538 (not (= (select (arr!36128 _keys!1208) from!1455) k!934)))))

(declare-fun e!659232 () Bool)

(assert (=> b!1159273 e!659232))

(declare-fun c!115604 () Bool)

(assert (=> b!1159273 (= c!115604 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521127 () Unit!38202)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!626 (array!74955 array!74957 (_ BitVec 32) (_ BitVec 32) V!43869 V!43869 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38202)

(assert (=> b!1159273 (= lt!521127 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159274 () Bool)

(assert (=> b!1159274 call!55870))

(declare-fun lt!521128 () Unit!38202)

(assert (=> b!1159274 (= lt!521128 call!55873)))

(assert (=> b!1159274 (= e!659226 lt!521128)))

(declare-fun b!1159275 () Bool)

(assert (=> b!1159275 (= e!659236 (not e!659229))))

(declare-fun res!769530 () Bool)

(assert (=> b!1159275 (=> res!769530 e!659229)))

(assert (=> b!1159275 (= res!769530 (bvsgt from!1455 i!673))))

(assert (=> b!1159275 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521129 () Unit!38202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74955 (_ BitVec 64) (_ BitVec 32)) Unit!38202)

(assert (=> b!1159275 (= lt!521129 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1159276 () Bool)

(assert (=> b!1159276 (= e!659227 e!659236)))

(declare-fun res!769526 () Bool)

(assert (=> b!1159276 (=> (not res!769526) (not e!659236))))

(assert (=> b!1159276 (= res!769526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521132 mask!1564))))

(assert (=> b!1159276 (= lt!521132 (array!74956 (store (arr!36128 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36664 _keys!1208)))))

(declare-fun b!1159277 () Bool)

(declare-fun call!55866 () ListLongMap!16537)

(declare-fun call!55872 () ListLongMap!16537)

(assert (=> b!1159277 (= e!659232 (= call!55866 (-!1395 call!55872 k!934)))))

(declare-fun bm!55866 () Bool)

(assert (=> bm!55866 (= call!55872 (getCurrentListMapNoExtraKeys!4748 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159278 () Bool)

(assert (=> b!1159278 (= e!659237 tp_is_empty!29057)))

(declare-fun bm!55867 () Bool)

(assert (=> bm!55867 (= call!55868 call!55867)))

(declare-fun b!1159279 () Bool)

(declare-fun res!769524 () Bool)

(assert (=> b!1159279 (=> (not res!769524) (not e!659227))))

(assert (=> b!1159279 (= res!769524 (= (select (arr!36128 _keys!1208) i!673) k!934))))

(declare-fun bm!55868 () Bool)

(assert (=> bm!55868 (= call!55867 (+!3692 (ite c!115603 lt!521131 lt!521136) (ite c!115603 (tuple2!18569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115601 (tuple2!18569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1159280 () Bool)

(assert (=> b!1159280 (= e!659234 (= lt!521133 (getCurrentListMapNoExtraKeys!4748 lt!521132 lt!521145 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159281 () Bool)

(declare-fun Unit!38206 () Unit!38202)

(assert (=> b!1159281 (= e!659222 Unit!38206)))

(declare-fun b!1159282 () Bool)

(assert (=> b!1159282 (= e!659231 (and e!659228 mapRes!45410))))

(declare-fun condMapEmpty!45410 () Bool)

(declare-fun mapDefault!45410 () ValueCell!13819)

