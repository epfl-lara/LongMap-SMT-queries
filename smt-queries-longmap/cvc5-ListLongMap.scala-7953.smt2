; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98558 () Bool)

(assert start!98558)

(declare-fun b_free!24163 () Bool)

(declare-fun b_next!24163 () Bool)

(assert (=> start!98558 (= b_free!24163 (not b_next!24163))))

(declare-fun tp!85199 () Bool)

(declare-fun b_and!39175 () Bool)

(assert (=> start!98558 (= tp!85199 b_and!39175)))

(declare-fun b!1142562 () Bool)

(declare-datatypes ((Unit!37481 0))(
  ( (Unit!37482) )
))
(declare-fun e!650005 () Unit!37481)

(declare-fun Unit!37483 () Unit!37481)

(assert (=> b!1142562 (= e!650005 Unit!37483)))

(declare-fun lt!509344 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142562 (= lt!509344 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112327 () Bool)

(assert (=> b!1142562 (= c!112327 (and (not lt!509344) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509340 () Unit!37481)

(declare-fun e!650007 () Unit!37481)

(assert (=> b!1142562 (= lt!509340 e!650007)))

(declare-datatypes ((V!43385 0))(
  ( (V!43386 (val!14403 Int)) )
))
(declare-fun zeroValue!944 () V!43385)

(declare-datatypes ((array!74239 0))(
  ( (array!74240 (arr!35770 (Array (_ BitVec 32) (_ BitVec 64))) (size!36306 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74239)

(declare-fun lt!509342 () Unit!37481)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13637 0))(
  ( (ValueCellFull!13637 (v!17040 V!43385)) (EmptyCell!13637) )
))
(declare-datatypes ((array!74241 0))(
  ( (array!74242 (arr!35771 (Array (_ BitVec 32) ValueCell!13637)) (size!36307 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74241)

(declare-fun minValue!944 () V!43385)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!395 (array!74239 array!74241 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 64) (_ BitVec 32) Int) Unit!37481)

(assert (=> b!1142562 (= lt!509342 (lemmaListMapContainsThenArrayContainsFrom!395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112329 () Bool)

(assert (=> b!1142562 (= c!112329 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761394 () Bool)

(declare-fun e!649998 () Bool)

(assert (=> b!1142562 (= res!761394 e!649998)))

(declare-fun e!649992 () Bool)

(assert (=> b!1142562 (=> (not res!761394) (not e!649992))))

(assert (=> b!1142562 e!649992))

(declare-fun lt!509327 () Unit!37481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74239 (_ BitVec 32) (_ BitVec 32)) Unit!37481)

(assert (=> b!1142562 (= lt!509327 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24980 0))(
  ( (Nil!24977) (Cons!24976 (h!26185 (_ BitVec 64)) (t!36135 List!24980)) )
))
(declare-fun arrayNoDuplicates!0 (array!74239 (_ BitVec 32) List!24980) Bool)

(assert (=> b!1142562 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24977)))

(declare-fun lt!509346 () Unit!37481)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74239 (_ BitVec 64) (_ BitVec 32) List!24980) Unit!37481)

(assert (=> b!1142562 (= lt!509346 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24977))))

(assert (=> b!1142562 false))

(declare-fun b!1142563 () Bool)

(declare-fun e!649999 () Unit!37481)

(declare-fun e!650006 () Unit!37481)

(assert (=> b!1142563 (= e!649999 e!650006)))

(declare-fun c!112330 () Bool)

(assert (=> b!1142563 (= c!112330 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509344))))

(declare-fun b!1142564 () Bool)

(declare-fun e!650001 () Bool)

(declare-fun e!649996 () Bool)

(assert (=> b!1142564 (= e!650001 e!649996)))

(declare-fun res!761390 () Bool)

(assert (=> b!1142564 (=> res!761390 e!649996)))

(assert (=> b!1142564 (= res!761390 (not (= (select (arr!35770 _keys!1208) from!1455) k!934)))))

(declare-fun e!650000 () Bool)

(assert (=> b!1142564 e!650000))

(declare-fun c!112325 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142564 (= c!112325 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509338 () Unit!37481)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!503 (array!74239 array!74241 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37481)

(assert (=> b!1142564 (= lt!509338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142565 () Bool)

(declare-datatypes ((tuple2!18226 0))(
  ( (tuple2!18227 (_1!9124 (_ BitVec 64)) (_2!9124 V!43385)) )
))
(declare-datatypes ((List!24981 0))(
  ( (Nil!24978) (Cons!24977 (h!26186 tuple2!18226) (t!36136 List!24981)) )
))
(declare-datatypes ((ListLongMap!16195 0))(
  ( (ListLongMap!16196 (toList!8113 List!24981)) )
))
(declare-fun call!51504 () ListLongMap!16195)

(declare-fun call!51501 () ListLongMap!16195)

(assert (=> b!1142565 (= e!650000 (= call!51504 call!51501))))

(declare-fun b!1142566 () Bool)

(declare-fun Unit!37484 () Unit!37481)

(assert (=> b!1142566 (= e!650006 Unit!37484)))

(declare-fun b!1142567 () Bool)

(declare-fun lt!509333 () Unit!37481)

(assert (=> b!1142567 (= e!649999 lt!509333)))

(declare-fun call!51498 () Unit!37481)

(assert (=> b!1142567 (= lt!509333 call!51498)))

(declare-fun call!51499 () Bool)

(assert (=> b!1142567 call!51499))

(declare-fun b!1142568 () Bool)

(declare-fun e!650004 () Bool)

(declare-fun e!650003 () Bool)

(assert (=> b!1142568 (= e!650004 (not e!650003))))

(declare-fun res!761399 () Bool)

(assert (=> b!1142568 (=> res!761399 e!650003)))

(assert (=> b!1142568 (= res!761399 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142568 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!509329 () Unit!37481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74239 (_ BitVec 64) (_ BitVec 32)) Unit!37481)

(assert (=> b!1142568 (= lt!509329 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!51495 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4593 (array!74239 array!74241 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) Int) ListLongMap!16195)

(assert (=> bm!51495 (= call!51501 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142569 () Bool)

(declare-fun c!112326 () Bool)

(assert (=> b!1142569 (= c!112326 (and (not lt!509344) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1142569 (= e!650007 e!649999)))

(declare-fun b!1142570 () Bool)

(declare-fun res!761395 () Bool)

(declare-fun e!650002 () Bool)

(assert (=> b!1142570 (=> (not res!761395) (not e!650002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142570 (= res!761395 (validMask!0 mask!1564))))

(declare-fun b!1142571 () Bool)

(assert (=> b!1142571 (= e!649998 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142572 () Bool)

(declare-fun res!761386 () Bool)

(assert (=> b!1142572 (=> (not res!761386) (not e!650002))))

(assert (=> b!1142572 (= res!761386 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36306 _keys!1208))))))

(declare-fun lt!509335 () ListLongMap!16195)

(declare-fun call!51505 () Unit!37481)

(declare-fun bm!51496 () Bool)

(declare-fun addStillContains!799 (ListLongMap!16195 (_ BitVec 64) V!43385 (_ BitVec 64)) Unit!37481)

(assert (=> bm!51496 (= call!51505 (addStillContains!799 lt!509335 (ite (or c!112327 c!112326) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112327 c!112326) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1142573 () Bool)

(declare-fun res!761392 () Bool)

(assert (=> b!1142573 (=> (not res!761392) (not e!650002))))

(assert (=> b!1142573 (= res!761392 (and (= (size!36307 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36306 _keys!1208) (size!36307 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51497 () Bool)

(declare-fun lt!509339 () array!74241)

(declare-fun lt!509326 () array!74239)

(assert (=> bm!51497 (= call!51504 (getCurrentListMapNoExtraKeys!4593 lt!509326 lt!509339 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142574 () Bool)

(assert (=> b!1142574 (= e!650002 e!650004)))

(declare-fun res!761388 () Bool)

(assert (=> b!1142574 (=> (not res!761388) (not e!650004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74239 (_ BitVec 32)) Bool)

(assert (=> b!1142574 (= res!761388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509326 mask!1564))))

(assert (=> b!1142574 (= lt!509326 (array!74240 (store (arr!35770 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36306 _keys!1208)))))

(declare-fun b!1142575 () Bool)

(assert (=> b!1142575 (= e!649998 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509344) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44864 () Bool)

(declare-fun mapRes!44864 () Bool)

(assert (=> mapIsEmpty!44864 mapRes!44864))

(declare-fun b!1142576 () Bool)

(declare-fun res!761397 () Bool)

(assert (=> b!1142576 (=> (not res!761397) (not e!650004))))

(assert (=> b!1142576 (= res!761397 (arrayNoDuplicates!0 lt!509326 #b00000000000000000000000000000000 Nil!24977))))

(declare-fun b!1142577 () Bool)

(assert (=> b!1142577 call!51499))

(declare-fun lt!509328 () Unit!37481)

(assert (=> b!1142577 (= lt!509328 call!51498)))

(assert (=> b!1142577 (= e!650006 lt!509328)))

(declare-fun b!1142578 () Bool)

(assert (=> b!1142578 (= e!650003 e!650001)))

(declare-fun res!761393 () Bool)

(assert (=> b!1142578 (=> res!761393 e!650001)))

(assert (=> b!1142578 (= res!761393 (not (= from!1455 i!673)))))

(declare-fun lt!509345 () ListLongMap!16195)

(assert (=> b!1142578 (= lt!509345 (getCurrentListMapNoExtraKeys!4593 lt!509326 lt!509339 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509330 () V!43385)

(assert (=> b!1142578 (= lt!509339 (array!74242 (store (arr!35771 _values!996) i!673 (ValueCellFull!13637 lt!509330)) (size!36307 _values!996)))))

(declare-fun dynLambda!2634 (Int (_ BitVec 64)) V!43385)

(assert (=> b!1142578 (= lt!509330 (dynLambda!2634 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509332 () ListLongMap!16195)

(assert (=> b!1142578 (= lt!509332 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142579 () Bool)

(declare-fun res!761396 () Bool)

(assert (=> b!1142579 (=> (not res!761396) (not e!650002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142579 (= res!761396 (validKeyInArray!0 k!934))))

(declare-fun b!1142580 () Bool)

(declare-fun res!761387 () Bool)

(assert (=> b!1142580 (=> (not res!761387) (not e!650002))))

(assert (=> b!1142580 (= res!761387 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24977))))

(declare-fun b!1142581 () Bool)

(declare-fun e!649997 () Bool)

(declare-fun tp_is_empty!28693 () Bool)

(assert (=> b!1142581 (= e!649997 tp_is_empty!28693)))

(declare-fun call!51500 () ListLongMap!16195)

(declare-fun bm!51498 () Bool)

(declare-fun +!3543 (ListLongMap!16195 tuple2!18226) ListLongMap!16195)

(assert (=> bm!51498 (= call!51500 (+!3543 lt!509335 (ite (or c!112327 c!112326) (tuple2!18227 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18227 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51499 () Bool)

(declare-fun call!51503 () ListLongMap!16195)

(assert (=> bm!51499 (= call!51503 call!51500)))

(declare-fun b!1142582 () Bool)

(declare-fun Unit!37485 () Unit!37481)

(assert (=> b!1142582 (= e!650005 Unit!37485)))

(declare-fun mapNonEmpty!44864 () Bool)

(declare-fun tp!85200 () Bool)

(assert (=> mapNonEmpty!44864 (= mapRes!44864 (and tp!85200 e!649997))))

(declare-fun mapValue!44864 () ValueCell!13637)

(declare-fun mapRest!44864 () (Array (_ BitVec 32) ValueCell!13637))

(declare-fun mapKey!44864 () (_ BitVec 32))

(assert (=> mapNonEmpty!44864 (= (arr!35771 _values!996) (store mapRest!44864 mapKey!44864 mapValue!44864))))

(declare-fun b!1142583 () Bool)

(declare-fun e!649995 () Bool)

(assert (=> b!1142583 (= e!649995 tp_is_empty!28693)))

(declare-fun res!761389 () Bool)

(assert (=> start!98558 (=> (not res!761389) (not e!650002))))

(assert (=> start!98558 (= res!761389 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36306 _keys!1208))))))

(assert (=> start!98558 e!650002))

(assert (=> start!98558 tp_is_empty!28693))

(declare-fun array_inv!27412 (array!74239) Bool)

(assert (=> start!98558 (array_inv!27412 _keys!1208)))

(assert (=> start!98558 true))

(assert (=> start!98558 tp!85199))

(declare-fun e!649994 () Bool)

(declare-fun array_inv!27413 (array!74241) Bool)

(assert (=> start!98558 (and (array_inv!27413 _values!996) e!649994)))

(declare-fun b!1142584 () Bool)

(assert (=> b!1142584 (= e!649992 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142585 () Bool)

(declare-fun res!761391 () Bool)

(assert (=> b!1142585 (=> (not res!761391) (not e!650002))))

(assert (=> b!1142585 (= res!761391 (= (select (arr!35770 _keys!1208) i!673) k!934))))

(declare-fun bm!51500 () Bool)

(declare-fun call!51502 () Bool)

(assert (=> bm!51500 (= call!51499 call!51502)))

(declare-fun bm!51501 () Bool)

(declare-fun lt!509337 () ListLongMap!16195)

(declare-fun contains!6646 (ListLongMap!16195 (_ BitVec 64)) Bool)

(assert (=> bm!51501 (= call!51502 (contains!6646 (ite c!112327 lt!509337 call!51503) k!934))))

(declare-fun b!1142586 () Bool)

(assert (=> b!1142586 (contains!6646 (+!3543 lt!509337 (tuple2!18227 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!509343 () Unit!37481)

(assert (=> b!1142586 (= lt!509343 (addStillContains!799 lt!509337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1142586 call!51502))

(assert (=> b!1142586 (= lt!509337 call!51500)))

(declare-fun lt!509334 () Unit!37481)

(assert (=> b!1142586 (= lt!509334 call!51505)))

(assert (=> b!1142586 (= e!650007 lt!509343)))

(declare-fun b!1142587 () Bool)

(assert (=> b!1142587 (= e!649996 true)))

(declare-fun lt!509336 () V!43385)

(declare-fun -!1261 (ListLongMap!16195 (_ BitVec 64)) ListLongMap!16195)

(assert (=> b!1142587 (= (-!1261 (+!3543 lt!509335 (tuple2!18227 (select (arr!35770 _keys!1208) from!1455) lt!509336)) (select (arr!35770 _keys!1208) from!1455)) lt!509335)))

(declare-fun lt!509341 () Unit!37481)

(declare-fun addThenRemoveForNewKeyIsSame!113 (ListLongMap!16195 (_ BitVec 64) V!43385) Unit!37481)

(assert (=> b!1142587 (= lt!509341 (addThenRemoveForNewKeyIsSame!113 lt!509335 (select (arr!35770 _keys!1208) from!1455) lt!509336))))

(declare-fun get!18181 (ValueCell!13637 V!43385) V!43385)

(assert (=> b!1142587 (= lt!509336 (get!18181 (select (arr!35771 _values!996) from!1455) lt!509330))))

(declare-fun lt!509331 () Unit!37481)

(assert (=> b!1142587 (= lt!509331 e!650005)))

(declare-fun c!112328 () Bool)

(assert (=> b!1142587 (= c!112328 (contains!6646 lt!509335 k!934))))

(assert (=> b!1142587 (= lt!509335 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142588 () Bool)

(assert (=> b!1142588 (= e!649994 (and e!649995 mapRes!44864))))

(declare-fun condMapEmpty!44864 () Bool)

(declare-fun mapDefault!44864 () ValueCell!13637)

