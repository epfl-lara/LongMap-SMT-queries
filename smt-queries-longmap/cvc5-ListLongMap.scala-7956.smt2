; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98576 () Bool)

(assert start!98576)

(declare-fun b_free!24181 () Bool)

(declare-fun b_next!24181 () Bool)

(assert (=> start!98576 (= b_free!24181 (not b_next!24181))))

(declare-fun tp!85253 () Bool)

(declare-fun b_and!39211 () Bool)

(assert (=> start!98576 (= tp!85253 b_and!39211)))

(declare-fun b!1143363 () Bool)

(declare-datatypes ((Unit!37519 0))(
  ( (Unit!37520) )
))
(declare-fun e!650425 () Unit!37519)

(declare-fun Unit!37521 () Unit!37519)

(assert (=> b!1143363 (= e!650425 Unit!37521)))

(declare-fun res!761772 () Bool)

(declare-fun e!650439 () Bool)

(assert (=> start!98576 (=> (not res!761772) (not e!650439))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74275 0))(
  ( (array!74276 (arr!35788 (Array (_ BitVec 32) (_ BitVec 64))) (size!36324 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74275)

(assert (=> start!98576 (= res!761772 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36324 _keys!1208))))))

(assert (=> start!98576 e!650439))

(declare-fun tp_is_empty!28711 () Bool)

(assert (=> start!98576 tp_is_empty!28711))

(declare-fun array_inv!27424 (array!74275) Bool)

(assert (=> start!98576 (array_inv!27424 _keys!1208)))

(assert (=> start!98576 true))

(assert (=> start!98576 tp!85253))

(declare-datatypes ((V!43409 0))(
  ( (V!43410 (val!14412 Int)) )
))
(declare-datatypes ((ValueCell!13646 0))(
  ( (ValueCellFull!13646 (v!17049 V!43409)) (EmptyCell!13646) )
))
(declare-datatypes ((array!74277 0))(
  ( (array!74278 (arr!35789 (Array (_ BitVec 32) ValueCell!13646)) (size!36325 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74277)

(declare-fun e!650435 () Bool)

(declare-fun array_inv!27425 (array!74277) Bool)

(assert (=> start!98576 (and (array_inv!27425 _values!996) e!650435)))

(declare-fun b!1143364 () Bool)

(declare-fun res!761768 () Bool)

(assert (=> b!1143364 (=> (not res!761768) (not e!650439))))

(declare-datatypes ((List!24997 0))(
  ( (Nil!24994) (Cons!24993 (h!26202 (_ BitVec 64)) (t!36170 List!24997)) )
))
(declare-fun arrayNoDuplicates!0 (array!74275 (_ BitVec 32) List!24997) Bool)

(assert (=> b!1143364 (= res!761768 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24994))))

(declare-fun b!1143365 () Bool)

(declare-fun res!761774 () Bool)

(assert (=> b!1143365 (=> (not res!761774) (not e!650439))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1143365 (= res!761774 (= (select (arr!35788 _keys!1208) i!673) k!934))))

(declare-fun b!1143366 () Bool)

(declare-fun res!761773 () Bool)

(assert (=> b!1143366 (=> (not res!761773) (not e!650439))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1143366 (= res!761773 (and (= (size!36325 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36324 _keys!1208) (size!36325 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43409)

(declare-fun call!51720 () Unit!37519)

(declare-datatypes ((tuple2!18244 0))(
  ( (tuple2!18245 (_1!9133 (_ BitVec 64)) (_2!9133 V!43409)) )
))
(declare-datatypes ((List!24998 0))(
  ( (Nil!24995) (Cons!24994 (h!26203 tuple2!18244) (t!36171 List!24998)) )
))
(declare-datatypes ((ListLongMap!16213 0))(
  ( (ListLongMap!16214 (toList!8122 List!24998)) )
))
(declare-fun lt!509897 () ListLongMap!16213)

(declare-fun bm!51711 () Bool)

(declare-fun lt!509901 () ListLongMap!16213)

(declare-fun c!112488 () Bool)

(declare-fun minValue!944 () V!43409)

(declare-fun c!112492 () Bool)

(declare-fun addStillContains!807 (ListLongMap!16213 (_ BitVec 64) V!43409 (_ BitVec 64)) Unit!37519)

(assert (=> bm!51711 (= call!51720 (addStillContains!807 (ite c!112488 lt!509901 lt!509897) (ite c!112488 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112492 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112488 minValue!944 (ite c!112492 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1143367 () Bool)

(declare-fun e!650433 () Unit!37519)

(declare-fun e!650434 () Unit!37519)

(assert (=> b!1143367 (= e!650433 e!650434)))

(declare-fun c!112491 () Bool)

(declare-fun lt!509911 () Bool)

(assert (=> b!1143367 (= c!112491 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509911))))

(declare-fun b!1143368 () Bool)

(assert (=> b!1143368 (= c!112492 (and (not lt!509911) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650437 () Unit!37519)

(assert (=> b!1143368 (= e!650437 e!650433)))

(declare-fun b!1143369 () Bool)

(declare-fun call!51715 () Bool)

(assert (=> b!1143369 call!51715))

(declare-fun lt!509899 () Unit!37519)

(declare-fun call!51719 () Unit!37519)

(assert (=> b!1143369 (= lt!509899 call!51719)))

(assert (=> b!1143369 (= e!650434 lt!509899)))

(declare-fun b!1143370 () Bool)

(declare-fun res!761764 () Bool)

(assert (=> b!1143370 (=> (not res!761764) (not e!650439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143370 (= res!761764 (validMask!0 mask!1564))))

(declare-fun call!51714 () ListLongMap!16213)

(declare-fun bm!51712 () Bool)

(declare-fun +!3551 (ListLongMap!16213 tuple2!18244) ListLongMap!16213)

(assert (=> bm!51712 (= call!51714 (+!3551 lt!509897 (ite (or c!112488 c!112492) (tuple2!18245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1143371 () Bool)

(declare-fun res!761771 () Bool)

(assert (=> b!1143371 (=> (not res!761771) (not e!650439))))

(assert (=> b!1143371 (= res!761771 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36324 _keys!1208))))))

(declare-fun b!1143372 () Bool)

(declare-fun lt!509902 () Unit!37519)

(assert (=> b!1143372 (= e!650433 lt!509902)))

(assert (=> b!1143372 (= lt!509902 call!51719)))

(assert (=> b!1143372 call!51715))

(declare-fun e!650429 () Bool)

(declare-fun b!1143373 () Bool)

(declare-fun arrayContainsKey!0 (array!74275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143373 (= e!650429 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143374 () Bool)

(declare-fun e!650424 () Bool)

(declare-fun e!650426 () Bool)

(assert (=> b!1143374 (= e!650424 (not e!650426))))

(declare-fun res!761775 () Bool)

(assert (=> b!1143374 (=> res!761775 e!650426)))

(assert (=> b!1143374 (= res!761775 (bvsgt from!1455 i!673))))

(assert (=> b!1143374 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!509903 () Unit!37519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74275 (_ BitVec 64) (_ BitVec 32)) Unit!37519)

(assert (=> b!1143374 (= lt!509903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun call!51717 () Bool)

(declare-fun call!51718 () ListLongMap!16213)

(declare-fun bm!51713 () Bool)

(declare-fun contains!6654 (ListLongMap!16213 (_ BitVec 64)) Bool)

(assert (=> bm!51713 (= call!51717 (contains!6654 (ite c!112488 lt!509901 call!51718) k!934))))

(declare-fun e!650438 () Bool)

(declare-fun call!51721 () ListLongMap!16213)

(declare-fun b!1143375 () Bool)

(declare-fun call!51716 () ListLongMap!16213)

(declare-fun -!1268 (ListLongMap!16213 (_ BitVec 64)) ListLongMap!16213)

(assert (=> b!1143375 (= e!650438 (= call!51721 (-!1268 call!51716 k!934)))))

(declare-fun b!1143376 () Bool)

(declare-fun res!761776 () Bool)

(assert (=> b!1143376 (=> (not res!761776) (not e!650439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74275 (_ BitVec 32)) Bool)

(assert (=> b!1143376 (= res!761776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143377 () Bool)

(assert (=> b!1143377 (contains!6654 (+!3551 lt!509901 (tuple2!18245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!509905 () Unit!37519)

(assert (=> b!1143377 (= lt!509905 call!51720)))

(assert (=> b!1143377 call!51717))

(assert (=> b!1143377 (= lt!509901 call!51714)))

(declare-fun lt!509907 () Unit!37519)

(assert (=> b!1143377 (= lt!509907 (addStillContains!807 lt!509897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1143377 (= e!650437 lt!509905)))

(declare-fun bm!51714 () Bool)

(assert (=> bm!51714 (= call!51719 call!51720)))

(declare-fun b!1143378 () Bool)

(declare-fun e!650430 () Bool)

(assert (=> b!1143378 (= e!650430 true)))

(declare-fun lt!509898 () V!43409)

(assert (=> b!1143378 (= (-!1268 (+!3551 lt!509897 (tuple2!18245 (select (arr!35788 _keys!1208) from!1455) lt!509898)) (select (arr!35788 _keys!1208) from!1455)) lt!509897)))

(declare-fun lt!509894 () Unit!37519)

(declare-fun addThenRemoveForNewKeyIsSame!120 (ListLongMap!16213 (_ BitVec 64) V!43409) Unit!37519)

(assert (=> b!1143378 (= lt!509894 (addThenRemoveForNewKeyIsSame!120 lt!509897 (select (arr!35788 _keys!1208) from!1455) lt!509898))))

(declare-fun lt!509900 () V!43409)

(declare-fun get!18194 (ValueCell!13646 V!43409) V!43409)

(assert (=> b!1143378 (= lt!509898 (get!18194 (select (arr!35789 _values!996) from!1455) lt!509900))))

(declare-fun lt!509895 () Unit!37519)

(assert (=> b!1143378 (= lt!509895 e!650425)))

(declare-fun c!112487 () Bool)

(assert (=> b!1143378 (= c!112487 (contains!6654 lt!509897 k!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4602 (array!74275 array!74277 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) Int) ListLongMap!16213)

(assert (=> b!1143378 (= lt!509897 (getCurrentListMapNoExtraKeys!4602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143379 () Bool)

(declare-fun Unit!37522 () Unit!37519)

(assert (=> b!1143379 (= e!650425 Unit!37522)))

(assert (=> b!1143379 (= lt!509911 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143379 (= c!112488 (and (not lt!509911) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509908 () Unit!37519)

(assert (=> b!1143379 (= lt!509908 e!650437)))

(declare-fun lt!509913 () Unit!37519)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!401 (array!74275 array!74277 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 64) (_ BitVec 32) Int) Unit!37519)

(assert (=> b!1143379 (= lt!509913 (lemmaListMapContainsThenArrayContainsFrom!401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112489 () Bool)

(assert (=> b!1143379 (= c!112489 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761777 () Bool)

(assert (=> b!1143379 (= res!761777 e!650429)))

(declare-fun e!650427 () Bool)

(assert (=> b!1143379 (=> (not res!761777) (not e!650427))))

(assert (=> b!1143379 e!650427))

(declare-fun lt!509912 () Unit!37519)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74275 (_ BitVec 32) (_ BitVec 32)) Unit!37519)

(assert (=> b!1143379 (= lt!509912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143379 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24994)))

(declare-fun lt!509893 () Unit!37519)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74275 (_ BitVec 64) (_ BitVec 32) List!24997) Unit!37519)

(assert (=> b!1143379 (= lt!509893 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24994))))

(assert (=> b!1143379 false))

(declare-fun b!1143380 () Bool)

(declare-fun e!650431 () Bool)

(assert (=> b!1143380 (= e!650426 e!650431)))

(declare-fun res!761769 () Bool)

(assert (=> b!1143380 (=> res!761769 e!650431)))

(assert (=> b!1143380 (= res!761769 (not (= from!1455 i!673)))))

(declare-fun lt!509906 () array!74275)

(declare-fun lt!509909 () array!74277)

(declare-fun lt!509896 () ListLongMap!16213)

(assert (=> b!1143380 (= lt!509896 (getCurrentListMapNoExtraKeys!4602 lt!509906 lt!509909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1143380 (= lt!509909 (array!74278 (store (arr!35789 _values!996) i!673 (ValueCellFull!13646 lt!509900)) (size!36325 _values!996)))))

(declare-fun dynLambda!2640 (Int (_ BitVec 64)) V!43409)

(assert (=> b!1143380 (= lt!509900 (dynLambda!2640 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509904 () ListLongMap!16213)

(assert (=> b!1143380 (= lt!509904 (getCurrentListMapNoExtraKeys!4602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143381 () Bool)

(assert (=> b!1143381 (= e!650439 e!650424)))

(declare-fun res!761770 () Bool)

(assert (=> b!1143381 (=> (not res!761770) (not e!650424))))

(assert (=> b!1143381 (= res!761770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509906 mask!1564))))

(assert (=> b!1143381 (= lt!509906 (array!74276 (store (arr!35788 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36324 _keys!1208)))))

(declare-fun mapIsEmpty!44891 () Bool)

(declare-fun mapRes!44891 () Bool)

(assert (=> mapIsEmpty!44891 mapRes!44891))

(declare-fun b!1143382 () Bool)

(declare-fun e!650436 () Bool)

(assert (=> b!1143382 (= e!650436 tp_is_empty!28711)))

(declare-fun b!1143383 () Bool)

(assert (=> b!1143383 (= e!650431 e!650430)))

(declare-fun res!761766 () Bool)

(assert (=> b!1143383 (=> res!761766 e!650430)))

(assert (=> b!1143383 (= res!761766 (not (= (select (arr!35788 _keys!1208) from!1455) k!934)))))

(assert (=> b!1143383 e!650438))

(declare-fun c!112490 () Bool)

(assert (=> b!1143383 (= c!112490 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509910 () Unit!37519)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!510 (array!74275 array!74277 (_ BitVec 32) (_ BitVec 32) V!43409 V!43409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37519)

(assert (=> b!1143383 (= lt!509910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143384 () Bool)

(assert (=> b!1143384 (= e!650429 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509911) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51715 () Bool)

(assert (=> bm!51715 (= call!51721 (getCurrentListMapNoExtraKeys!4602 lt!509906 lt!509909 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143385 () Bool)

(assert (=> b!1143385 (= e!650435 (and e!650436 mapRes!44891))))

(declare-fun condMapEmpty!44891 () Bool)

(declare-fun mapDefault!44891 () ValueCell!13646)

