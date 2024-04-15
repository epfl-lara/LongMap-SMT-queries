; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97406 () Bool)

(assert start!97406)

(declare-fun b_free!23383 () Bool)

(declare-fun b_next!23383 () Bool)

(assert (=> start!97406 (= b_free!23383 (not b_next!23383))))

(declare-fun tp!82448 () Bool)

(declare-fun b_and!37581 () Bool)

(assert (=> start!97406 (= tp!82448 b_and!37581)))

(declare-fun b!1110852 () Bool)

(declare-fun res!741317 () Bool)

(declare-fun e!633469 () Bool)

(assert (=> b!1110852 (=> (not res!741317) (not e!633469))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72096 0))(
  ( (array!72097 (arr!34701 (Array (_ BitVec 32) (_ BitVec 64))) (size!35239 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72096)

(assert (=> b!1110852 (= res!741317 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35239 _keys!1208))))))

(declare-fun res!741319 () Bool)

(assert (=> start!97406 (=> (not res!741319) (not e!633469))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97406 (= res!741319 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35239 _keys!1208))))))

(assert (=> start!97406 e!633469))

(declare-fun tp_is_empty!27643 () Bool)

(assert (=> start!97406 tp_is_empty!27643))

(declare-fun array_inv!26750 (array!72096) Bool)

(assert (=> start!97406 (array_inv!26750 _keys!1208)))

(assert (=> start!97406 true))

(assert (=> start!97406 tp!82448))

(declare-datatypes ((V!41985 0))(
  ( (V!41986 (val!13878 Int)) )
))
(declare-datatypes ((ValueCell!13112 0))(
  ( (ValueCellFull!13112 (v!16510 V!41985)) (EmptyCell!13112) )
))
(declare-datatypes ((array!72098 0))(
  ( (array!72099 (arr!34702 (Array (_ BitVec 32) ValueCell!13112)) (size!35240 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72098)

(declare-fun e!633471 () Bool)

(declare-fun array_inv!26751 (array!72098) Bool)

(assert (=> start!97406 (and (array_inv!26751 _values!996) e!633471)))

(declare-fun b!1110853 () Bool)

(declare-fun res!741316 () Bool)

(assert (=> b!1110853 (=> (not res!741316) (not e!633469))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1110853 (= res!741316 (= (select (arr!34701 _keys!1208) i!673) k0!934))))

(declare-fun b!1110854 () Bool)

(declare-fun e!633473 () Bool)

(declare-datatypes ((tuple2!17620 0))(
  ( (tuple2!17621 (_1!8821 (_ BitVec 64)) (_2!8821 V!41985)) )
))
(declare-datatypes ((List!24273 0))(
  ( (Nil!24270) (Cons!24269 (h!25478 tuple2!17620) (t!34693 List!24273)) )
))
(declare-datatypes ((ListLongMap!15589 0))(
  ( (ListLongMap!15590 (toList!7810 List!24273)) )
))
(declare-fun call!46822 () ListLongMap!15589)

(declare-fun call!46823 () ListLongMap!15589)

(assert (=> b!1110854 (= e!633473 (= call!46822 call!46823))))

(declare-fun b!1110855 () Bool)

(declare-fun res!741322 () Bool)

(assert (=> b!1110855 (=> (not res!741322) (not e!633469))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110855 (= res!741322 (validMask!0 mask!1564))))

(declare-fun b!1110856 () Bool)

(declare-fun e!633470 () Bool)

(declare-fun e!633474 () Bool)

(assert (=> b!1110856 (= e!633470 (not e!633474))))

(declare-fun res!741315 () Bool)

(assert (=> b!1110856 (=> res!741315 e!633474)))

(assert (=> b!1110856 (= res!741315 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35239 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110856 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36269 0))(
  ( (Unit!36270) )
))
(declare-fun lt!496062 () Unit!36269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72096 (_ BitVec 64) (_ BitVec 32)) Unit!36269)

(assert (=> b!1110856 (= lt!496062 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!41985)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46819 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!496061 () array!72096)

(declare-fun minValue!944 () V!41985)

(declare-fun getCurrentListMapNoExtraKeys!4323 (array!72096 array!72098 (_ BitVec 32) (_ BitVec 32) V!41985 V!41985 (_ BitVec 32) Int) ListLongMap!15589)

(declare-fun dynLambda!2386 (Int (_ BitVec 64)) V!41985)

(assert (=> bm!46819 (= call!46822 (getCurrentListMapNoExtraKeys!4323 lt!496061 (array!72099 (store (arr!34702 _values!996) i!673 (ValueCellFull!13112 (dynLambda!2386 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35240 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43282 () Bool)

(declare-fun mapRes!43282 () Bool)

(declare-fun tp!82447 () Bool)

(declare-fun e!633468 () Bool)

(assert (=> mapNonEmpty!43282 (= mapRes!43282 (and tp!82447 e!633468))))

(declare-fun mapRest!43282 () (Array (_ BitVec 32) ValueCell!13112))

(declare-fun mapKey!43282 () (_ BitVec 32))

(declare-fun mapValue!43282 () ValueCell!13112)

(assert (=> mapNonEmpty!43282 (= (arr!34702 _values!996) (store mapRest!43282 mapKey!43282 mapValue!43282))))

(declare-fun b!1110857 () Bool)

(declare-fun -!1023 (ListLongMap!15589 (_ BitVec 64)) ListLongMap!15589)

(assert (=> b!1110857 (= e!633473 (= call!46822 (-!1023 call!46823 k0!934)))))

(declare-fun b!1110858 () Bool)

(declare-fun e!633467 () Bool)

(assert (=> b!1110858 (= e!633467 tp_is_empty!27643)))

(declare-fun b!1110859 () Bool)

(assert (=> b!1110859 (= e!633474 true)))

(assert (=> b!1110859 e!633473))

(declare-fun c!109245 () Bool)

(assert (=> b!1110859 (= c!109245 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496060 () Unit!36269)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!296 (array!72096 array!72098 (_ BitVec 32) (_ BitVec 32) V!41985 V!41985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36269)

(assert (=> b!1110859 (= lt!496060 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110860 () Bool)

(declare-fun res!741321 () Bool)

(assert (=> b!1110860 (=> (not res!741321) (not e!633469))))

(declare-datatypes ((List!24274 0))(
  ( (Nil!24271) (Cons!24270 (h!25479 (_ BitVec 64)) (t!34694 List!24274)) )
))
(declare-fun arrayNoDuplicates!0 (array!72096 (_ BitVec 32) List!24274) Bool)

(assert (=> b!1110860 (= res!741321 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24271))))

(declare-fun b!1110861 () Bool)

(assert (=> b!1110861 (= e!633471 (and e!633467 mapRes!43282))))

(declare-fun condMapEmpty!43282 () Bool)

(declare-fun mapDefault!43282 () ValueCell!13112)

(assert (=> b!1110861 (= condMapEmpty!43282 (= (arr!34702 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13112)) mapDefault!43282)))))

(declare-fun b!1110862 () Bool)

(assert (=> b!1110862 (= e!633469 e!633470)))

(declare-fun res!741324 () Bool)

(assert (=> b!1110862 (=> (not res!741324) (not e!633470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72096 (_ BitVec 32)) Bool)

(assert (=> b!1110862 (= res!741324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496061 mask!1564))))

(assert (=> b!1110862 (= lt!496061 (array!72097 (store (arr!34701 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35239 _keys!1208)))))

(declare-fun b!1110863 () Bool)

(declare-fun res!741320 () Bool)

(assert (=> b!1110863 (=> (not res!741320) (not e!633469))))

(assert (=> b!1110863 (= res!741320 (and (= (size!35240 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35239 _keys!1208) (size!35240 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43282 () Bool)

(assert (=> mapIsEmpty!43282 mapRes!43282))

(declare-fun b!1110864 () Bool)

(declare-fun res!741325 () Bool)

(assert (=> b!1110864 (=> (not res!741325) (not e!633470))))

(assert (=> b!1110864 (= res!741325 (arrayNoDuplicates!0 lt!496061 #b00000000000000000000000000000000 Nil!24271))))

(declare-fun b!1110865 () Bool)

(declare-fun res!741323 () Bool)

(assert (=> b!1110865 (=> (not res!741323) (not e!633469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110865 (= res!741323 (validKeyInArray!0 k0!934))))

(declare-fun b!1110866 () Bool)

(assert (=> b!1110866 (= e!633468 tp_is_empty!27643)))

(declare-fun b!1110867 () Bool)

(declare-fun res!741318 () Bool)

(assert (=> b!1110867 (=> (not res!741318) (not e!633469))))

(assert (=> b!1110867 (= res!741318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46820 () Bool)

(assert (=> bm!46820 (= call!46823 (getCurrentListMapNoExtraKeys!4323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97406 res!741319) b!1110855))

(assert (= (and b!1110855 res!741322) b!1110863))

(assert (= (and b!1110863 res!741320) b!1110867))

(assert (= (and b!1110867 res!741318) b!1110860))

(assert (= (and b!1110860 res!741321) b!1110852))

(assert (= (and b!1110852 res!741317) b!1110865))

(assert (= (and b!1110865 res!741323) b!1110853))

(assert (= (and b!1110853 res!741316) b!1110862))

(assert (= (and b!1110862 res!741324) b!1110864))

(assert (= (and b!1110864 res!741325) b!1110856))

(assert (= (and b!1110856 (not res!741315)) b!1110859))

(assert (= (and b!1110859 c!109245) b!1110857))

(assert (= (and b!1110859 (not c!109245)) b!1110854))

(assert (= (or b!1110857 b!1110854) bm!46819))

(assert (= (or b!1110857 b!1110854) bm!46820))

(assert (= (and b!1110861 condMapEmpty!43282) mapIsEmpty!43282))

(assert (= (and b!1110861 (not condMapEmpty!43282)) mapNonEmpty!43282))

(get-info :version)

(assert (= (and mapNonEmpty!43282 ((_ is ValueCellFull!13112) mapValue!43282)) b!1110866))

(assert (= (and b!1110861 ((_ is ValueCellFull!13112) mapDefault!43282)) b!1110858))

(assert (= start!97406 b!1110861))

(declare-fun b_lambda!18389 () Bool)

(assert (=> (not b_lambda!18389) (not bm!46819)))

(declare-fun t!34692 () Bool)

(declare-fun tb!8241 () Bool)

(assert (=> (and start!97406 (= defaultEntry!1004 defaultEntry!1004) t!34692) tb!8241))

(declare-fun result!17051 () Bool)

(assert (=> tb!8241 (= result!17051 tp_is_empty!27643)))

(assert (=> bm!46819 t!34692))

(declare-fun b_and!37583 () Bool)

(assert (= b_and!37581 (and (=> t!34692 result!17051) b_and!37583)))

(declare-fun m!1028253 () Bool)

(assert (=> start!97406 m!1028253))

(declare-fun m!1028255 () Bool)

(assert (=> start!97406 m!1028255))

(declare-fun m!1028257 () Bool)

(assert (=> b!1110864 m!1028257))

(declare-fun m!1028259 () Bool)

(assert (=> b!1110857 m!1028259))

(declare-fun m!1028261 () Bool)

(assert (=> b!1110853 m!1028261))

(declare-fun m!1028263 () Bool)

(assert (=> b!1110855 m!1028263))

(declare-fun m!1028265 () Bool)

(assert (=> b!1110859 m!1028265))

(declare-fun m!1028267 () Bool)

(assert (=> bm!46819 m!1028267))

(declare-fun m!1028269 () Bool)

(assert (=> bm!46819 m!1028269))

(declare-fun m!1028271 () Bool)

(assert (=> bm!46819 m!1028271))

(declare-fun m!1028273 () Bool)

(assert (=> b!1110865 m!1028273))

(declare-fun m!1028275 () Bool)

(assert (=> b!1110867 m!1028275))

(declare-fun m!1028277 () Bool)

(assert (=> b!1110856 m!1028277))

(declare-fun m!1028279 () Bool)

(assert (=> b!1110856 m!1028279))

(declare-fun m!1028281 () Bool)

(assert (=> b!1110860 m!1028281))

(declare-fun m!1028283 () Bool)

(assert (=> bm!46820 m!1028283))

(declare-fun m!1028285 () Bool)

(assert (=> b!1110862 m!1028285))

(declare-fun m!1028287 () Bool)

(assert (=> b!1110862 m!1028287))

(declare-fun m!1028289 () Bool)

(assert (=> mapNonEmpty!43282 m!1028289))

(check-sat (not bm!46819) (not start!97406) (not b_lambda!18389) (not b!1110867) (not b!1110864) (not bm!46820) (not b!1110855) tp_is_empty!27643 (not b!1110860) (not b!1110859) (not b!1110865) (not b!1110857) b_and!37583 (not b!1110862) (not b!1110856) (not mapNonEmpty!43282) (not b_next!23383))
(check-sat b_and!37583 (not b_next!23383))
