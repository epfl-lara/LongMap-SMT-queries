; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97408 () Bool)

(assert start!97408)

(declare-fun b_free!23379 () Bool)

(declare-fun b_next!23379 () Bool)

(assert (=> start!97408 (= b_free!23379 (not b_next!23379))))

(declare-fun tp!82435 () Bool)

(declare-fun b_and!37595 () Bool)

(assert (=> start!97408 (= tp!82435 b_and!37595)))

(declare-fun res!741323 () Bool)

(declare-fun e!633500 () Bool)

(assert (=> start!97408 (=> (not res!741323) (not e!633500))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72195 0))(
  ( (array!72196 (arr!34750 (Array (_ BitVec 32) (_ BitVec 64))) (size!35286 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72195)

(assert (=> start!97408 (= res!741323 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35286 _keys!1208))))))

(assert (=> start!97408 e!633500))

(declare-fun tp_is_empty!27639 () Bool)

(assert (=> start!97408 tp_is_empty!27639))

(declare-fun array_inv!26734 (array!72195) Bool)

(assert (=> start!97408 (array_inv!26734 _keys!1208)))

(assert (=> start!97408 true))

(assert (=> start!97408 tp!82435))

(declare-datatypes ((V!41979 0))(
  ( (V!41980 (val!13876 Int)) )
))
(declare-datatypes ((ValueCell!13110 0))(
  ( (ValueCellFull!13110 (v!16509 V!41979)) (EmptyCell!13110) )
))
(declare-datatypes ((array!72197 0))(
  ( (array!72198 (arr!34751 (Array (_ BitVec 32) ValueCell!13110)) (size!35287 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72197)

(declare-fun e!633505 () Bool)

(declare-fun array_inv!26735 (array!72197) Bool)

(assert (=> start!97408 (and (array_inv!26735 _values!996) e!633505)))

(declare-fun zeroValue!944 () V!41979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17554 0))(
  ( (tuple2!17555 (_1!8788 (_ BitVec 64)) (_2!8788 V!41979)) )
))
(declare-datatypes ((List!24238 0))(
  ( (Nil!24235) (Cons!24234 (h!25443 tuple2!17554) (t!34663 List!24238)) )
))
(declare-datatypes ((ListLongMap!15523 0))(
  ( (ListLongMap!15524 (toList!7777 List!24238)) )
))
(declare-fun call!46834 () ListLongMap!15523)

(declare-fun minValue!944 () V!41979)

(declare-fun bm!46830 () Bool)

(declare-fun lt!496244 () array!72195)

(declare-fun getCurrentListMapNoExtraKeys!4269 (array!72195 array!72197 (_ BitVec 32) (_ BitVec 32) V!41979 V!41979 (_ BitVec 32) Int) ListLongMap!15523)

(declare-fun dynLambda!2398 (Int (_ BitVec 64)) V!41979)

(assert (=> bm!46830 (= call!46834 (getCurrentListMapNoExtraKeys!4269 lt!496244 (array!72198 (store (arr!34751 _values!996) i!673 (ValueCellFull!13110 (dynLambda!2398 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35287 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110881 () Bool)

(declare-fun e!633504 () Bool)

(assert (=> b!1110881 (= e!633504 tp_is_empty!27639)))

(declare-fun b!1110882 () Bool)

(declare-fun res!741321 () Bool)

(assert (=> b!1110882 (=> (not res!741321) (not e!633500))))

(declare-datatypes ((List!24239 0))(
  ( (Nil!24236) (Cons!24235 (h!25444 (_ BitVec 64)) (t!34664 List!24239)) )
))
(declare-fun arrayNoDuplicates!0 (array!72195 (_ BitVec 32) List!24239) Bool)

(assert (=> b!1110882 (= res!741321 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24236))))

(declare-fun b!1110883 () Bool)

(declare-fun res!741328 () Bool)

(assert (=> b!1110883 (=> (not res!741328) (not e!633500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72195 (_ BitVec 32)) Bool)

(assert (=> b!1110883 (= res!741328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43276 () Bool)

(declare-fun mapRes!43276 () Bool)

(declare-fun tp!82436 () Bool)

(assert (=> mapNonEmpty!43276 (= mapRes!43276 (and tp!82436 e!633504))))

(declare-fun mapKey!43276 () (_ BitVec 32))

(declare-fun mapRest!43276 () (Array (_ BitVec 32) ValueCell!13110))

(declare-fun mapValue!43276 () ValueCell!13110)

(assert (=> mapNonEmpty!43276 (= (arr!34751 _values!996) (store mapRest!43276 mapKey!43276 mapValue!43276))))

(declare-fun b!1110884 () Bool)

(declare-fun e!633503 () Bool)

(assert (=> b!1110884 (= e!633503 true)))

(declare-fun e!633506 () Bool)

(assert (=> b!1110884 e!633506))

(declare-fun c!109266 () Bool)

(assert (=> b!1110884 (= c!109266 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36456 0))(
  ( (Unit!36457) )
))
(declare-fun lt!496242 () Unit!36456)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!297 (array!72195 array!72197 (_ BitVec 32) (_ BitVec 32) V!41979 V!41979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36456)

(assert (=> b!1110884 (= lt!496242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46833 () ListLongMap!15523)

(declare-fun bm!46831 () Bool)

(assert (=> bm!46831 (= call!46833 (getCurrentListMapNoExtraKeys!4269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110885 () Bool)

(assert (=> b!1110885 (= e!633506 (= call!46834 call!46833))))

(declare-fun b!1110886 () Bool)

(declare-fun res!741318 () Bool)

(assert (=> b!1110886 (=> (not res!741318) (not e!633500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110886 (= res!741318 (validKeyInArray!0 k0!934))))

(declare-fun b!1110887 () Bool)

(declare-fun res!741324 () Bool)

(assert (=> b!1110887 (=> (not res!741324) (not e!633500))))

(assert (=> b!1110887 (= res!741324 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35286 _keys!1208))))))

(declare-fun b!1110888 () Bool)

(declare-fun res!741320 () Bool)

(assert (=> b!1110888 (=> (not res!741320) (not e!633500))))

(assert (=> b!1110888 (= res!741320 (and (= (size!35287 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35286 _keys!1208) (size!35287 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110889 () Bool)

(declare-fun e!633507 () Bool)

(assert (=> b!1110889 (= e!633505 (and e!633507 mapRes!43276))))

(declare-fun condMapEmpty!43276 () Bool)

(declare-fun mapDefault!43276 () ValueCell!13110)

(assert (=> b!1110889 (= condMapEmpty!43276 (= (arr!34751 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13110)) mapDefault!43276)))))

(declare-fun b!1110890 () Bool)

(declare-fun res!741325 () Bool)

(declare-fun e!633501 () Bool)

(assert (=> b!1110890 (=> (not res!741325) (not e!633501))))

(assert (=> b!1110890 (= res!741325 (arrayNoDuplicates!0 lt!496244 #b00000000000000000000000000000000 Nil!24236))))

(declare-fun b!1110891 () Bool)

(declare-fun res!741326 () Bool)

(assert (=> b!1110891 (=> (not res!741326) (not e!633500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110891 (= res!741326 (validMask!0 mask!1564))))

(declare-fun b!1110892 () Bool)

(assert (=> b!1110892 (= e!633507 tp_is_empty!27639)))

(declare-fun mapIsEmpty!43276 () Bool)

(assert (=> mapIsEmpty!43276 mapRes!43276))

(declare-fun b!1110893 () Bool)

(assert (=> b!1110893 (= e!633500 e!633501)))

(declare-fun res!741327 () Bool)

(assert (=> b!1110893 (=> (not res!741327) (not e!633501))))

(assert (=> b!1110893 (= res!741327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496244 mask!1564))))

(assert (=> b!1110893 (= lt!496244 (array!72196 (store (arr!34750 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35286 _keys!1208)))))

(declare-fun b!1110894 () Bool)

(assert (=> b!1110894 (= e!633501 (not e!633503))))

(declare-fun res!741319 () Bool)

(assert (=> b!1110894 (=> res!741319 e!633503)))

(assert (=> b!1110894 (= res!741319 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35286 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110894 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496243 () Unit!36456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72195 (_ BitVec 64) (_ BitVec 32)) Unit!36456)

(assert (=> b!1110894 (= lt!496243 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110895 () Bool)

(declare-fun -!1048 (ListLongMap!15523 (_ BitVec 64)) ListLongMap!15523)

(assert (=> b!1110895 (= e!633506 (= call!46834 (-!1048 call!46833 k0!934)))))

(declare-fun b!1110896 () Bool)

(declare-fun res!741322 () Bool)

(assert (=> b!1110896 (=> (not res!741322) (not e!633500))))

(assert (=> b!1110896 (= res!741322 (= (select (arr!34750 _keys!1208) i!673) k0!934))))

(assert (= (and start!97408 res!741323) b!1110891))

(assert (= (and b!1110891 res!741326) b!1110888))

(assert (= (and b!1110888 res!741320) b!1110883))

(assert (= (and b!1110883 res!741328) b!1110882))

(assert (= (and b!1110882 res!741321) b!1110887))

(assert (= (and b!1110887 res!741324) b!1110886))

(assert (= (and b!1110886 res!741318) b!1110896))

(assert (= (and b!1110896 res!741322) b!1110893))

(assert (= (and b!1110893 res!741327) b!1110890))

(assert (= (and b!1110890 res!741325) b!1110894))

(assert (= (and b!1110894 (not res!741319)) b!1110884))

(assert (= (and b!1110884 c!109266) b!1110895))

(assert (= (and b!1110884 (not c!109266)) b!1110885))

(assert (= (or b!1110895 b!1110885) bm!46830))

(assert (= (or b!1110895 b!1110885) bm!46831))

(assert (= (and b!1110889 condMapEmpty!43276) mapIsEmpty!43276))

(assert (= (and b!1110889 (not condMapEmpty!43276)) mapNonEmpty!43276))

(get-info :version)

(assert (= (and mapNonEmpty!43276 ((_ is ValueCellFull!13110) mapValue!43276)) b!1110881))

(assert (= (and b!1110889 ((_ is ValueCellFull!13110) mapDefault!43276)) b!1110892))

(assert (= start!97408 b!1110889))

(declare-fun b_lambda!18403 () Bool)

(assert (=> (not b_lambda!18403) (not bm!46830)))

(declare-fun t!34662 () Bool)

(declare-fun tb!8245 () Bool)

(assert (=> (and start!97408 (= defaultEntry!1004 defaultEntry!1004) t!34662) tb!8245))

(declare-fun result!17051 () Bool)

(assert (=> tb!8245 (= result!17051 tp_is_empty!27639)))

(assert (=> bm!46830 t!34662))

(declare-fun b_and!37597 () Bool)

(assert (= b_and!37595 (and (=> t!34662 result!17051) b_and!37597)))

(declare-fun m!1028803 () Bool)

(assert (=> start!97408 m!1028803))

(declare-fun m!1028805 () Bool)

(assert (=> start!97408 m!1028805))

(declare-fun m!1028807 () Bool)

(assert (=> b!1110886 m!1028807))

(declare-fun m!1028809 () Bool)

(assert (=> b!1110890 m!1028809))

(declare-fun m!1028811 () Bool)

(assert (=> b!1110891 m!1028811))

(declare-fun m!1028813 () Bool)

(assert (=> b!1110894 m!1028813))

(declare-fun m!1028815 () Bool)

(assert (=> b!1110894 m!1028815))

(declare-fun m!1028817 () Bool)

(assert (=> b!1110882 m!1028817))

(declare-fun m!1028819 () Bool)

(assert (=> bm!46830 m!1028819))

(declare-fun m!1028821 () Bool)

(assert (=> bm!46830 m!1028821))

(declare-fun m!1028823 () Bool)

(assert (=> bm!46830 m!1028823))

(declare-fun m!1028825 () Bool)

(assert (=> b!1110883 m!1028825))

(declare-fun m!1028827 () Bool)

(assert (=> b!1110895 m!1028827))

(declare-fun m!1028829 () Bool)

(assert (=> bm!46831 m!1028829))

(declare-fun m!1028831 () Bool)

(assert (=> b!1110893 m!1028831))

(declare-fun m!1028833 () Bool)

(assert (=> b!1110893 m!1028833))

(declare-fun m!1028835 () Bool)

(assert (=> mapNonEmpty!43276 m!1028835))

(declare-fun m!1028837 () Bool)

(assert (=> b!1110896 m!1028837))

(declare-fun m!1028839 () Bool)

(assert (=> b!1110884 m!1028839))

(check-sat b_and!37597 tp_is_empty!27639 (not b!1110883) (not b!1110890) (not b!1110884) (not start!97408) (not b!1110895) (not b_next!23379) (not b!1110893) (not mapNonEmpty!43276) (not b_lambda!18403) (not b!1110894) (not b!1110886) (not bm!46831) (not b!1110882) (not b!1110891) (not bm!46830))
(check-sat b_and!37597 (not b_next!23379))
