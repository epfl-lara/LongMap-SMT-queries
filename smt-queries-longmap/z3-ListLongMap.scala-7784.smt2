; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97450 () Bool)

(assert start!97450)

(declare-fun b_free!23421 () Bool)

(declare-fun b_next!23421 () Bool)

(assert (=> start!97450 (= b_free!23421 (not b_next!23421))))

(declare-fun tp!82561 () Bool)

(declare-fun b_and!37679 () Bool)

(assert (=> start!97450 (= tp!82561 b_and!37679)))

(declare-fun b!1111931 () Bool)

(declare-fun e!634004 () Bool)

(declare-fun e!634011 () Bool)

(assert (=> b!1111931 (= e!634004 e!634011)))

(declare-fun res!742019 () Bool)

(assert (=> b!1111931 (=> (not res!742019) (not e!634011))))

(declare-datatypes ((array!72275 0))(
  ( (array!72276 (arr!34790 (Array (_ BitVec 32) (_ BitVec 64))) (size!35326 (_ BitVec 32))) )
))
(declare-fun lt!496432 () array!72275)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72275 (_ BitVec 32)) Bool)

(assert (=> b!1111931 (= res!742019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496432 mask!1564))))

(declare-fun _keys!1208 () array!72275)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111931 (= lt!496432 (array!72276 (store (arr!34790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35326 _keys!1208)))))

(declare-fun b!1111932 () Bool)

(declare-fun res!742020 () Bool)

(assert (=> b!1111932 (=> (not res!742020) (not e!634004))))

(assert (=> b!1111932 (= res!742020 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35326 _keys!1208))))))

(declare-fun b!1111933 () Bool)

(declare-fun e!634007 () Bool)

(assert (=> b!1111933 (= e!634007 true)))

(declare-fun e!634005 () Bool)

(assert (=> b!1111933 e!634005))

(declare-fun c!109329 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111933 (= c!109329 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42035 0))(
  ( (V!42036 (val!13897 Int)) )
))
(declare-fun zeroValue!944 () V!42035)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13131 0))(
  ( (ValueCellFull!13131 (v!16530 V!42035)) (EmptyCell!13131) )
))
(declare-datatypes ((array!72277 0))(
  ( (array!72278 (arr!34791 (Array (_ BitVec 32) ValueCell!13131)) (size!35327 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72277)

(declare-datatypes ((Unit!36488 0))(
  ( (Unit!36489) )
))
(declare-fun lt!496433 () Unit!36488)

(declare-fun minValue!944 () V!42035)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 (array!72275 array!72277 (_ BitVec 32) (_ BitVec 32) V!42035 V!42035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36488)

(assert (=> b!1111933 (= lt!496433 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111934 () Bool)

(declare-fun res!742012 () Bool)

(assert (=> b!1111934 (=> (not res!742012) (not e!634004))))

(assert (=> b!1111934 (= res!742012 (= (select (arr!34790 _keys!1208) i!673) k0!934))))

(declare-fun b!1111935 () Bool)

(declare-fun e!634009 () Bool)

(declare-fun e!634008 () Bool)

(declare-fun mapRes!43339 () Bool)

(assert (=> b!1111935 (= e!634009 (and e!634008 mapRes!43339))))

(declare-fun condMapEmpty!43339 () Bool)

(declare-fun mapDefault!43339 () ValueCell!13131)

(assert (=> b!1111935 (= condMapEmpty!43339 (= (arr!34791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13131)) mapDefault!43339)))))

(declare-fun b!1111937 () Bool)

(declare-fun e!634006 () Bool)

(declare-fun tp_is_empty!27681 () Bool)

(assert (=> b!1111937 (= e!634006 tp_is_empty!27681)))

(declare-fun bm!46956 () Bool)

(declare-datatypes ((tuple2!17588 0))(
  ( (tuple2!17589 (_1!8805 (_ BitVec 64)) (_2!8805 V!42035)) )
))
(declare-datatypes ((List!24271 0))(
  ( (Nil!24268) (Cons!24267 (h!25476 tuple2!17588) (t!34738 List!24271)) )
))
(declare-datatypes ((ListLongMap!15557 0))(
  ( (ListLongMap!15558 (toList!7794 List!24271)) )
))
(declare-fun call!46959 () ListLongMap!15557)

(declare-fun getCurrentListMapNoExtraKeys!4285 (array!72275 array!72277 (_ BitVec 32) (_ BitVec 32) V!42035 V!42035 (_ BitVec 32) Int) ListLongMap!15557)

(assert (=> bm!46956 (= call!46959 (getCurrentListMapNoExtraKeys!4285 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111938 () Bool)

(declare-fun res!742018 () Bool)

(assert (=> b!1111938 (=> (not res!742018) (not e!634004))))

(assert (=> b!1111938 (= res!742018 (and (= (size!35327 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35326 _keys!1208) (size!35327 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!46960 () ListLongMap!15557)

(declare-fun bm!46957 () Bool)

(declare-fun dynLambda!2412 (Int (_ BitVec 64)) V!42035)

(assert (=> bm!46957 (= call!46960 (getCurrentListMapNoExtraKeys!4285 lt!496432 (array!72278 (store (arr!34791 _values!996) i!673 (ValueCellFull!13131 (dynLambda!2412 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35327 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43339 () Bool)

(declare-fun tp!82562 () Bool)

(assert (=> mapNonEmpty!43339 (= mapRes!43339 (and tp!82562 e!634006))))

(declare-fun mapKey!43339 () (_ BitVec 32))

(declare-fun mapRest!43339 () (Array (_ BitVec 32) ValueCell!13131))

(declare-fun mapValue!43339 () ValueCell!13131)

(assert (=> mapNonEmpty!43339 (= (arr!34791 _values!996) (store mapRest!43339 mapKey!43339 mapValue!43339))))

(declare-fun b!1111939 () Bool)

(declare-fun res!742017 () Bool)

(assert (=> b!1111939 (=> (not res!742017) (not e!634004))))

(assert (=> b!1111939 (= res!742017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111940 () Bool)

(declare-fun res!742015 () Bool)

(assert (=> b!1111940 (=> (not res!742015) (not e!634004))))

(declare-datatypes ((List!24272 0))(
  ( (Nil!24269) (Cons!24268 (h!25477 (_ BitVec 64)) (t!34739 List!24272)) )
))
(declare-fun arrayNoDuplicates!0 (array!72275 (_ BitVec 32) List!24272) Bool)

(assert (=> b!1111940 (= res!742015 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24269))))

(declare-fun b!1111941 () Bool)

(declare-fun -!1060 (ListLongMap!15557 (_ BitVec 64)) ListLongMap!15557)

(assert (=> b!1111941 (= e!634005 (= call!46960 (-!1060 call!46959 k0!934)))))

(declare-fun res!742014 () Bool)

(assert (=> start!97450 (=> (not res!742014) (not e!634004))))

(assert (=> start!97450 (= res!742014 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35326 _keys!1208))))))

(assert (=> start!97450 e!634004))

(assert (=> start!97450 tp_is_empty!27681))

(declare-fun array_inv!26754 (array!72275) Bool)

(assert (=> start!97450 (array_inv!26754 _keys!1208)))

(assert (=> start!97450 true))

(assert (=> start!97450 tp!82561))

(declare-fun array_inv!26755 (array!72277) Bool)

(assert (=> start!97450 (and (array_inv!26755 _values!996) e!634009)))

(declare-fun b!1111936 () Bool)

(declare-fun res!742011 () Bool)

(assert (=> b!1111936 (=> (not res!742011) (not e!634004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111936 (= res!742011 (validKeyInArray!0 k0!934))))

(declare-fun b!1111942 () Bool)

(declare-fun res!742021 () Bool)

(assert (=> b!1111942 (=> (not res!742021) (not e!634011))))

(assert (=> b!1111942 (= res!742021 (arrayNoDuplicates!0 lt!496432 #b00000000000000000000000000000000 Nil!24269))))

(declare-fun mapIsEmpty!43339 () Bool)

(assert (=> mapIsEmpty!43339 mapRes!43339))

(declare-fun b!1111943 () Bool)

(declare-fun res!742013 () Bool)

(assert (=> b!1111943 (=> (not res!742013) (not e!634004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111943 (= res!742013 (validMask!0 mask!1564))))

(declare-fun b!1111944 () Bool)

(assert (=> b!1111944 (= e!634011 (not e!634007))))

(declare-fun res!742016 () Bool)

(assert (=> b!1111944 (=> res!742016 e!634007)))

(assert (=> b!1111944 (= res!742016 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35326 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111944 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496431 () Unit!36488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72275 (_ BitVec 64) (_ BitVec 32)) Unit!36488)

(assert (=> b!1111944 (= lt!496431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111945 () Bool)

(assert (=> b!1111945 (= e!634005 (= call!46960 call!46959))))

(declare-fun b!1111946 () Bool)

(assert (=> b!1111946 (= e!634008 tp_is_empty!27681)))

(assert (= (and start!97450 res!742014) b!1111943))

(assert (= (and b!1111943 res!742013) b!1111938))

(assert (= (and b!1111938 res!742018) b!1111939))

(assert (= (and b!1111939 res!742017) b!1111940))

(assert (= (and b!1111940 res!742015) b!1111932))

(assert (= (and b!1111932 res!742020) b!1111936))

(assert (= (and b!1111936 res!742011) b!1111934))

(assert (= (and b!1111934 res!742012) b!1111931))

(assert (= (and b!1111931 res!742019) b!1111942))

(assert (= (and b!1111942 res!742021) b!1111944))

(assert (= (and b!1111944 (not res!742016)) b!1111933))

(assert (= (and b!1111933 c!109329) b!1111941))

(assert (= (and b!1111933 (not c!109329)) b!1111945))

(assert (= (or b!1111941 b!1111945) bm!46957))

(assert (= (or b!1111941 b!1111945) bm!46956))

(assert (= (and b!1111935 condMapEmpty!43339) mapIsEmpty!43339))

(assert (= (and b!1111935 (not condMapEmpty!43339)) mapNonEmpty!43339))

(get-info :version)

(assert (= (and mapNonEmpty!43339 ((_ is ValueCellFull!13131) mapValue!43339)) b!1111937))

(assert (= (and b!1111935 ((_ is ValueCellFull!13131) mapDefault!43339)) b!1111946))

(assert (= start!97450 b!1111935))

(declare-fun b_lambda!18445 () Bool)

(assert (=> (not b_lambda!18445) (not bm!46957)))

(declare-fun t!34737 () Bool)

(declare-fun tb!8287 () Bool)

(assert (=> (and start!97450 (= defaultEntry!1004 defaultEntry!1004) t!34737) tb!8287))

(declare-fun result!17135 () Bool)

(assert (=> tb!8287 (= result!17135 tp_is_empty!27681)))

(assert (=> bm!46957 t!34737))

(declare-fun b_and!37681 () Bool)

(assert (= b_and!37679 (and (=> t!34737 result!17135) b_and!37681)))

(declare-fun m!1029601 () Bool)

(assert (=> b!1111942 m!1029601))

(declare-fun m!1029603 () Bool)

(assert (=> b!1111931 m!1029603))

(declare-fun m!1029605 () Bool)

(assert (=> b!1111931 m!1029605))

(declare-fun m!1029607 () Bool)

(assert (=> bm!46957 m!1029607))

(declare-fun m!1029609 () Bool)

(assert (=> bm!46957 m!1029609))

(declare-fun m!1029611 () Bool)

(assert (=> bm!46957 m!1029611))

(declare-fun m!1029613 () Bool)

(assert (=> b!1111943 m!1029613))

(declare-fun m!1029615 () Bool)

(assert (=> bm!46956 m!1029615))

(declare-fun m!1029617 () Bool)

(assert (=> b!1111934 m!1029617))

(declare-fun m!1029619 () Bool)

(assert (=> mapNonEmpty!43339 m!1029619))

(declare-fun m!1029621 () Bool)

(assert (=> b!1111944 m!1029621))

(declare-fun m!1029623 () Bool)

(assert (=> b!1111944 m!1029623))

(declare-fun m!1029625 () Bool)

(assert (=> b!1111939 m!1029625))

(declare-fun m!1029627 () Bool)

(assert (=> b!1111941 m!1029627))

(declare-fun m!1029629 () Bool)

(assert (=> b!1111940 m!1029629))

(declare-fun m!1029631 () Bool)

(assert (=> b!1111933 m!1029631))

(declare-fun m!1029633 () Bool)

(assert (=> b!1111936 m!1029633))

(declare-fun m!1029635 () Bool)

(assert (=> start!97450 m!1029635))

(declare-fun m!1029637 () Bool)

(assert (=> start!97450 m!1029637))

(check-sat (not b!1111944) b_and!37681 (not b!1111940) (not b!1111941) (not bm!46956) (not mapNonEmpty!43339) (not start!97450) (not b!1111936) (not bm!46957) (not b_lambda!18445) (not b!1111933) (not b!1111939) (not b!1111943) (not b!1111942) tp_is_empty!27681 (not b!1111931) (not b_next!23421))
(check-sat b_and!37681 (not b_next!23421))
