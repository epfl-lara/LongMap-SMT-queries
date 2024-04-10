; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73770 () Bool)

(assert start!73770)

(declare-fun b_free!14685 () Bool)

(declare-fun b_next!14685 () Bool)

(assert (=> start!73770 (= b_free!14685 (not b_next!14685))))

(declare-fun tp!51558 () Bool)

(declare-fun b_and!24349 () Bool)

(assert (=> start!73770 (= tp!51558 b_and!24349)))

(declare-fun b!865375 () Bool)

(declare-fun res!588008 () Bool)

(declare-fun e!482073 () Bool)

(assert (=> b!865375 (=> (not res!588008) (not e!482073))))

(declare-datatypes ((array!49802 0))(
  ( (array!49803 (arr!23932 (Array (_ BitVec 32) (_ BitVec 64))) (size!24372 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49802)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49802 (_ BitVec 32)) Bool)

(assert (=> b!865375 (= res!588008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865376 () Bool)

(declare-fun res!588005 () Bool)

(assert (=> b!865376 (=> (not res!588005) (not e!482073))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865376 (= res!588005 (and (= (select (arr!23932 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865377 () Bool)

(declare-fun res!588002 () Bool)

(assert (=> b!865377 (=> (not res!588002) (not e!482073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865377 (= res!588002 (validMask!0 mask!1196))))

(declare-fun b!865378 () Bool)

(declare-fun e!482080 () Bool)

(declare-fun tp_is_empty!16821 () Bool)

(assert (=> b!865378 (= e!482080 tp_is_empty!16821)))

(declare-fun b!865379 () Bool)

(declare-fun res!588009 () Bool)

(assert (=> b!865379 (=> (not res!588009) (not e!482073))))

(assert (=> b!865379 (= res!588009 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24372 _keys!868))))))

(declare-fun b!865380 () Bool)

(declare-fun res!588003 () Bool)

(assert (=> b!865380 (=> (not res!588003) (not e!482073))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27475 0))(
  ( (V!27476 (val!8458 Int)) )
))
(declare-datatypes ((ValueCell!7971 0))(
  ( (ValueCellFull!7971 (v!10883 V!27475)) (EmptyCell!7971) )
))
(declare-datatypes ((array!49804 0))(
  ( (array!49805 (arr!23933 (Array (_ BitVec 32) ValueCell!7971)) (size!24373 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49804)

(assert (=> b!865380 (= res!588003 (and (= (size!24373 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24372 _keys!868) (size!24373 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865381 () Bool)

(declare-fun e!482075 () Bool)

(assert (=> b!865381 (= e!482075 true)))

(declare-datatypes ((tuple2!11208 0))(
  ( (tuple2!11209 (_1!5615 (_ BitVec 64)) (_2!5615 V!27475)) )
))
(declare-fun lt!392097 () tuple2!11208)

(declare-datatypes ((List!17011 0))(
  ( (Nil!17008) (Cons!17007 (h!18138 tuple2!11208) (t!23962 List!17011)) )
))
(declare-datatypes ((ListLongMap!9977 0))(
  ( (ListLongMap!9978 (toList!5004 List!17011)) )
))
(declare-fun lt!392100 () ListLongMap!9977)

(declare-fun lt!392101 () ListLongMap!9977)

(declare-fun lt!392104 () tuple2!11208)

(declare-fun +!2353 (ListLongMap!9977 tuple2!11208) ListLongMap!9977)

(assert (=> b!865381 (= lt!392101 (+!2353 (+!2353 lt!392100 lt!392097) lt!392104))))

(declare-fun v!557 () V!27475)

(declare-fun lt!392091 () V!27475)

(declare-datatypes ((Unit!29635 0))(
  ( (Unit!29636) )
))
(declare-fun lt!392089 () Unit!29635)

(declare-fun addCommutativeForDiffKeys!522 (ListLongMap!9977 (_ BitVec 64) V!27475 (_ BitVec 64) V!27475) Unit!29635)

(assert (=> b!865381 (= lt!392089 (addCommutativeForDiffKeys!522 lt!392100 k0!854 v!557 (select (arr!23932 _keys!868) from!1053) lt!392091))))

(declare-fun b!865382 () Bool)

(declare-fun e!482078 () Unit!29635)

(declare-fun Unit!29637 () Unit!29635)

(assert (=> b!865382 (= e!482078 Unit!29637)))

(declare-fun lt!392096 () Unit!29635)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49802 (_ BitVec 32) (_ BitVec 32)) Unit!29635)

(assert (=> b!865382 (= lt!392096 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17012 0))(
  ( (Nil!17009) (Cons!17008 (h!18139 (_ BitVec 64)) (t!23963 List!17012)) )
))
(declare-fun arrayNoDuplicates!0 (array!49802 (_ BitVec 32) List!17012) Bool)

(assert (=> b!865382 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17009)))

(declare-fun lt!392098 () Unit!29635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49802 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29635)

(assert (=> b!865382 (= lt!392098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865382 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392094 () Unit!29635)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49802 (_ BitVec 64) (_ BitVec 32) List!17012) Unit!29635)

(assert (=> b!865382 (= lt!392094 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17009))))

(assert (=> b!865382 false))

(declare-fun res!588010 () Bool)

(assert (=> start!73770 (=> (not res!588010) (not e!482073))))

(assert (=> start!73770 (= res!588010 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24372 _keys!868))))))

(assert (=> start!73770 e!482073))

(assert (=> start!73770 tp_is_empty!16821))

(assert (=> start!73770 true))

(assert (=> start!73770 tp!51558))

(declare-fun array_inv!18918 (array!49802) Bool)

(assert (=> start!73770 (array_inv!18918 _keys!868)))

(declare-fun e!482076 () Bool)

(declare-fun array_inv!18919 (array!49804) Bool)

(assert (=> start!73770 (and (array_inv!18919 _values!688) e!482076)))

(declare-fun b!865383 () Bool)

(declare-fun e!482074 () Bool)

(declare-fun mapRes!26831 () Bool)

(assert (=> b!865383 (= e!482076 (and e!482074 mapRes!26831))))

(declare-fun condMapEmpty!26831 () Bool)

(declare-fun mapDefault!26831 () ValueCell!7971)

(assert (=> b!865383 (= condMapEmpty!26831 (= (arr!23933 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7971)) mapDefault!26831)))))

(declare-fun b!865384 () Bool)

(declare-fun e!482077 () Bool)

(declare-fun e!482072 () Bool)

(assert (=> b!865384 (= e!482077 (not e!482072))))

(declare-fun res!588001 () Bool)

(assert (=> b!865384 (=> res!588001 e!482072)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865384 (= res!588001 (not (validKeyInArray!0 (select (arr!23932 _keys!868) from!1053))))))

(declare-fun lt!392093 () ListLongMap!9977)

(declare-fun lt!392103 () ListLongMap!9977)

(assert (=> b!865384 (= lt!392093 lt!392103)))

(assert (=> b!865384 (= lt!392103 (+!2353 lt!392100 lt!392104))))

(declare-fun lt!392090 () array!49804)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27475)

(declare-fun zeroValue!654 () V!27475)

(declare-fun getCurrentListMapNoExtraKeys!2975 (array!49802 array!49804 (_ BitVec 32) (_ BitVec 32) V!27475 V!27475 (_ BitVec 32) Int) ListLongMap!9977)

(assert (=> b!865384 (= lt!392093 (getCurrentListMapNoExtraKeys!2975 _keys!868 lt!392090 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865384 (= lt!392104 (tuple2!11209 k0!854 v!557))))

(assert (=> b!865384 (= lt!392100 (getCurrentListMapNoExtraKeys!2975 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392095 () Unit!29635)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!554 (array!49802 array!49804 (_ BitVec 32) (_ BitVec 32) V!27475 V!27475 (_ BitVec 32) (_ BitVec 64) V!27475 (_ BitVec 32) Int) Unit!29635)

(assert (=> b!865384 (= lt!392095 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!554 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865385 () Bool)

(assert (=> b!865385 (= e!482074 tp_is_empty!16821)))

(declare-fun mapIsEmpty!26831 () Bool)

(assert (=> mapIsEmpty!26831 mapRes!26831))

(declare-fun b!865386 () Bool)

(assert (=> b!865386 (= e!482072 e!482075)))

(declare-fun res!588004 () Bool)

(assert (=> b!865386 (=> res!588004 e!482075)))

(assert (=> b!865386 (= res!588004 (= k0!854 (select (arr!23932 _keys!868) from!1053)))))

(assert (=> b!865386 (not (= (select (arr!23932 _keys!868) from!1053) k0!854))))

(declare-fun lt!392102 () Unit!29635)

(assert (=> b!865386 (= lt!392102 e!482078)))

(declare-fun c!92248 () Bool)

(assert (=> b!865386 (= c!92248 (= (select (arr!23932 _keys!868) from!1053) k0!854))))

(declare-fun lt!392092 () ListLongMap!9977)

(assert (=> b!865386 (= lt!392092 lt!392101)))

(assert (=> b!865386 (= lt!392101 (+!2353 lt!392103 lt!392097))))

(assert (=> b!865386 (= lt!392097 (tuple2!11209 (select (arr!23932 _keys!868) from!1053) lt!392091))))

(declare-fun get!12648 (ValueCell!7971 V!27475) V!27475)

(declare-fun dynLambda!1176 (Int (_ BitVec 64)) V!27475)

(assert (=> b!865386 (= lt!392091 (get!12648 (select (arr!23933 _values!688) from!1053) (dynLambda!1176 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26831 () Bool)

(declare-fun tp!51559 () Bool)

(assert (=> mapNonEmpty!26831 (= mapRes!26831 (and tp!51559 e!482080))))

(declare-fun mapValue!26831 () ValueCell!7971)

(declare-fun mapRest!26831 () (Array (_ BitVec 32) ValueCell!7971))

(declare-fun mapKey!26831 () (_ BitVec 32))

(assert (=> mapNonEmpty!26831 (= (arr!23933 _values!688) (store mapRest!26831 mapKey!26831 mapValue!26831))))

(declare-fun b!865387 () Bool)

(declare-fun res!588006 () Bool)

(assert (=> b!865387 (=> (not res!588006) (not e!482073))))

(assert (=> b!865387 (= res!588006 (validKeyInArray!0 k0!854))))

(declare-fun b!865388 () Bool)

(assert (=> b!865388 (= e!482073 e!482077)))

(declare-fun res!588007 () Bool)

(assert (=> b!865388 (=> (not res!588007) (not e!482077))))

(assert (=> b!865388 (= res!588007 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865388 (= lt!392092 (getCurrentListMapNoExtraKeys!2975 _keys!868 lt!392090 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865388 (= lt!392090 (array!49805 (store (arr!23933 _values!688) i!612 (ValueCellFull!7971 v!557)) (size!24373 _values!688)))))

(declare-fun lt!392099 () ListLongMap!9977)

(assert (=> b!865388 (= lt!392099 (getCurrentListMapNoExtraKeys!2975 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865389 () Bool)

(declare-fun res!588011 () Bool)

(assert (=> b!865389 (=> (not res!588011) (not e!482073))))

(assert (=> b!865389 (= res!588011 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17009))))

(declare-fun b!865390 () Bool)

(declare-fun Unit!29638 () Unit!29635)

(assert (=> b!865390 (= e!482078 Unit!29638)))

(assert (= (and start!73770 res!588010) b!865377))

(assert (= (and b!865377 res!588002) b!865380))

(assert (= (and b!865380 res!588003) b!865375))

(assert (= (and b!865375 res!588008) b!865389))

(assert (= (and b!865389 res!588011) b!865379))

(assert (= (and b!865379 res!588009) b!865387))

(assert (= (and b!865387 res!588006) b!865376))

(assert (= (and b!865376 res!588005) b!865388))

(assert (= (and b!865388 res!588007) b!865384))

(assert (= (and b!865384 (not res!588001)) b!865386))

(assert (= (and b!865386 c!92248) b!865382))

(assert (= (and b!865386 (not c!92248)) b!865390))

(assert (= (and b!865386 (not res!588004)) b!865381))

(assert (= (and b!865383 condMapEmpty!26831) mapIsEmpty!26831))

(assert (= (and b!865383 (not condMapEmpty!26831)) mapNonEmpty!26831))

(get-info :version)

(assert (= (and mapNonEmpty!26831 ((_ is ValueCellFull!7971) mapValue!26831)) b!865378))

(assert (= (and b!865383 ((_ is ValueCellFull!7971) mapDefault!26831)) b!865385))

(assert (= start!73770 b!865383))

(declare-fun b_lambda!12037 () Bool)

(assert (=> (not b_lambda!12037) (not b!865386)))

(declare-fun t!23961 () Bool)

(declare-fun tb!4807 () Bool)

(assert (=> (and start!73770 (= defaultEntry!696 defaultEntry!696) t!23961) tb!4807))

(declare-fun result!9225 () Bool)

(assert (=> tb!4807 (= result!9225 tp_is_empty!16821)))

(assert (=> b!865386 t!23961))

(declare-fun b_and!24351 () Bool)

(assert (= b_and!24349 (and (=> t!23961 result!9225) b_and!24351)))

(declare-fun m!806865 () Bool)

(assert (=> b!865388 m!806865))

(declare-fun m!806867 () Bool)

(assert (=> b!865388 m!806867))

(declare-fun m!806869 () Bool)

(assert (=> b!865388 m!806869))

(declare-fun m!806871 () Bool)

(assert (=> start!73770 m!806871))

(declare-fun m!806873 () Bool)

(assert (=> start!73770 m!806873))

(declare-fun m!806875 () Bool)

(assert (=> b!865381 m!806875))

(assert (=> b!865381 m!806875))

(declare-fun m!806877 () Bool)

(assert (=> b!865381 m!806877))

(declare-fun m!806879 () Bool)

(assert (=> b!865381 m!806879))

(assert (=> b!865381 m!806879))

(declare-fun m!806881 () Bool)

(assert (=> b!865381 m!806881))

(declare-fun m!806883 () Bool)

(assert (=> mapNonEmpty!26831 m!806883))

(declare-fun m!806885 () Bool)

(assert (=> b!865376 m!806885))

(declare-fun m!806887 () Bool)

(assert (=> b!865386 m!806887))

(declare-fun m!806889 () Bool)

(assert (=> b!865386 m!806889))

(declare-fun m!806891 () Bool)

(assert (=> b!865386 m!806891))

(declare-fun m!806893 () Bool)

(assert (=> b!865386 m!806893))

(assert (=> b!865386 m!806889))

(assert (=> b!865386 m!806879))

(assert (=> b!865386 m!806891))

(declare-fun m!806895 () Bool)

(assert (=> b!865377 m!806895))

(declare-fun m!806897 () Bool)

(assert (=> b!865375 m!806897))

(declare-fun m!806899 () Bool)

(assert (=> b!865389 m!806899))

(declare-fun m!806901 () Bool)

(assert (=> b!865387 m!806901))

(declare-fun m!806903 () Bool)

(assert (=> b!865382 m!806903))

(declare-fun m!806905 () Bool)

(assert (=> b!865382 m!806905))

(declare-fun m!806907 () Bool)

(assert (=> b!865382 m!806907))

(declare-fun m!806909 () Bool)

(assert (=> b!865382 m!806909))

(declare-fun m!806911 () Bool)

(assert (=> b!865382 m!806911))

(declare-fun m!806913 () Bool)

(assert (=> b!865384 m!806913))

(declare-fun m!806915 () Bool)

(assert (=> b!865384 m!806915))

(assert (=> b!865384 m!806879))

(declare-fun m!806917 () Bool)

(assert (=> b!865384 m!806917))

(declare-fun m!806919 () Bool)

(assert (=> b!865384 m!806919))

(assert (=> b!865384 m!806879))

(declare-fun m!806921 () Bool)

(assert (=> b!865384 m!806921))

(check-sat (not start!73770) (not b!865387) tp_is_empty!16821 (not mapNonEmpty!26831) (not b!865381) (not b!865382) (not b!865389) (not b_lambda!12037) (not b!865375) (not b!865388) (not b!865384) (not b!865377) b_and!24351 (not b!865386) (not b_next!14685))
(check-sat b_and!24351 (not b_next!14685))
