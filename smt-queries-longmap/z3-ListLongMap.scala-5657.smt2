; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73894 () Bool)

(assert start!73894)

(declare-fun b_free!14641 () Bool)

(declare-fun b_next!14641 () Bool)

(assert (=> start!73894 (= b_free!14641 (not b_next!14641))))

(declare-fun tp!51427 () Bool)

(declare-fun b_and!24271 () Bool)

(assert (=> start!73894 (= tp!51427 b_and!24271)))

(declare-fun b!865178 () Bool)

(declare-fun e!482060 () Bool)

(declare-fun tp_is_empty!16777 () Bool)

(assert (=> b!865178 (= e!482060 tp_is_empty!16777)))

(declare-fun mapNonEmpty!26765 () Bool)

(declare-fun mapRes!26765 () Bool)

(declare-fun tp!51428 () Bool)

(assert (=> mapNonEmpty!26765 (= mapRes!26765 (and tp!51428 e!482060))))

(declare-datatypes ((V!27417 0))(
  ( (V!27418 (val!8436 Int)) )
))
(declare-datatypes ((ValueCell!7949 0))(
  ( (ValueCellFull!7949 (v!10861 V!27417)) (EmptyCell!7949) )
))
(declare-fun mapRest!26765 () (Array (_ BitVec 32) ValueCell!7949))

(declare-fun mapKey!26765 () (_ BitVec 32))

(declare-fun mapValue!26765 () ValueCell!7949)

(declare-datatypes ((array!49765 0))(
  ( (array!49766 (arr!23909 (Array (_ BitVec 32) ValueCell!7949)) (size!24350 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49765)

(assert (=> mapNonEmpty!26765 (= (arr!23909 _values!688) (store mapRest!26765 mapKey!26765 mapValue!26765))))

(declare-fun b!865179 () Bool)

(declare-fun e!482067 () Bool)

(declare-fun e!482063 () Bool)

(assert (=> b!865179 (= e!482067 (not e!482063))))

(declare-fun res!587621 () Bool)

(assert (=> b!865179 (=> res!587621 e!482063)))

(declare-datatypes ((array!49767 0))(
  ( (array!49768 (arr!23910 (Array (_ BitVec 32) (_ BitVec 64))) (size!24351 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49767)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865179 (= res!587621 (not (validKeyInArray!0 (select (arr!23910 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11090 0))(
  ( (tuple2!11091 (_1!5556 (_ BitVec 64)) (_2!5556 V!27417)) )
))
(declare-datatypes ((List!16922 0))(
  ( (Nil!16919) (Cons!16918 (h!18055 tuple2!11090) (t!23821 List!16922)) )
))
(declare-datatypes ((ListLongMap!9861 0))(
  ( (ListLongMap!9862 (toList!4946 List!16922)) )
))
(declare-fun lt!391409 () ListLongMap!9861)

(declare-fun lt!391397 () ListLongMap!9861)

(assert (=> b!865179 (= lt!391409 lt!391397)))

(declare-fun lt!391402 () ListLongMap!9861)

(declare-fun lt!391403 () tuple2!11090)

(declare-fun +!2349 (ListLongMap!9861 tuple2!11090) ListLongMap!9861)

(assert (=> b!865179 (= lt!391397 (+!2349 lt!391402 lt!391403))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!391405 () array!49765)

(declare-fun minValue!654 () V!27417)

(declare-fun zeroValue!654 () V!27417)

(declare-fun getCurrentListMapNoExtraKeys!2996 (array!49767 array!49765 (_ BitVec 32) (_ BitVec 32) V!27417 V!27417 (_ BitVec 32) Int) ListLongMap!9861)

(assert (=> b!865179 (= lt!391409 (getCurrentListMapNoExtraKeys!2996 _keys!868 lt!391405 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27417)

(assert (=> b!865179 (= lt!391403 (tuple2!11091 k0!854 v!557))))

(assert (=> b!865179 (= lt!391402 (getCurrentListMapNoExtraKeys!2996 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29550 0))(
  ( (Unit!29551) )
))
(declare-fun lt!391395 () Unit!29550)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 (array!49767 array!49765 (_ BitVec 32) (_ BitVec 32) V!27417 V!27417 (_ BitVec 32) (_ BitVec 64) V!27417 (_ BitVec 32) Int) Unit!29550)

(assert (=> b!865179 (= lt!391395 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865180 () Bool)

(declare-fun res!587629 () Bool)

(declare-fun e!482061 () Bool)

(assert (=> b!865180 (=> (not res!587629) (not e!482061))))

(assert (=> b!865180 (= res!587629 (validKeyInArray!0 k0!854))))

(declare-fun b!865181 () Bool)

(declare-fun e!482068 () Bool)

(assert (=> b!865181 (= e!482068 tp_is_empty!16777)))

(declare-fun b!865182 () Bool)

(declare-fun e!482066 () Unit!29550)

(declare-fun Unit!29552 () Unit!29550)

(assert (=> b!865182 (= e!482066 Unit!29552)))

(declare-fun lt!391404 () Unit!29550)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49767 (_ BitVec 32) (_ BitVec 32)) Unit!29550)

(assert (=> b!865182 (= lt!391404 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16923 0))(
  ( (Nil!16920) (Cons!16919 (h!18056 (_ BitVec 64)) (t!23822 List!16923)) )
))
(declare-fun arrayNoDuplicates!0 (array!49767 (_ BitVec 32) List!16923) Bool)

(assert (=> b!865182 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16920)))

(declare-fun lt!391398 () Unit!29550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49767 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29550)

(assert (=> b!865182 (= lt!391398 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865182 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391407 () Unit!29550)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49767 (_ BitVec 64) (_ BitVec 32) List!16923) Unit!29550)

(assert (=> b!865182 (= lt!391407 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16920))))

(assert (=> b!865182 false))

(declare-fun mapIsEmpty!26765 () Bool)

(assert (=> mapIsEmpty!26765 mapRes!26765))

(declare-fun b!865183 () Bool)

(declare-fun Unit!29553 () Unit!29550)

(assert (=> b!865183 (= e!482066 Unit!29553)))

(declare-fun b!865184 () Bool)

(declare-fun e!482065 () Bool)

(assert (=> b!865184 (= e!482065 (and e!482068 mapRes!26765))))

(declare-fun condMapEmpty!26765 () Bool)

(declare-fun mapDefault!26765 () ValueCell!7949)

(assert (=> b!865184 (= condMapEmpty!26765 (= (arr!23909 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7949)) mapDefault!26765)))))

(declare-fun res!587625 () Bool)

(assert (=> start!73894 (=> (not res!587625) (not e!482061))))

(assert (=> start!73894 (= res!587625 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24351 _keys!868))))))

(assert (=> start!73894 e!482061))

(assert (=> start!73894 tp_is_empty!16777))

(assert (=> start!73894 true))

(assert (=> start!73894 tp!51427))

(declare-fun array_inv!18962 (array!49767) Bool)

(assert (=> start!73894 (array_inv!18962 _keys!868)))

(declare-fun array_inv!18963 (array!49765) Bool)

(assert (=> start!73894 (and (array_inv!18963 _values!688) e!482065)))

(declare-fun b!865185 () Bool)

(declare-fun res!587619 () Bool)

(assert (=> b!865185 (=> (not res!587619) (not e!482061))))

(assert (=> b!865185 (= res!587619 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16920))))

(declare-fun b!865186 () Bool)

(declare-fun res!587628 () Bool)

(assert (=> b!865186 (=> (not res!587628) (not e!482061))))

(assert (=> b!865186 (= res!587628 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24351 _keys!868))))))

(declare-fun b!865187 () Bool)

(declare-fun res!587627 () Bool)

(assert (=> b!865187 (=> (not res!587627) (not e!482061))))

(assert (=> b!865187 (= res!587627 (and (= (size!24350 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24351 _keys!868) (size!24350 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865188 () Bool)

(declare-fun e!482064 () Bool)

(assert (=> b!865188 (= e!482064 true)))

(declare-fun lt!391406 () tuple2!11090)

(declare-fun lt!391408 () ListLongMap!9861)

(assert (=> b!865188 (= lt!391408 (+!2349 (+!2349 lt!391402 lt!391406) lt!391403))))

(declare-fun lt!391399 () V!27417)

(declare-fun lt!391394 () Unit!29550)

(declare-fun addCommutativeForDiffKeys!500 (ListLongMap!9861 (_ BitVec 64) V!27417 (_ BitVec 64) V!27417) Unit!29550)

(assert (=> b!865188 (= lt!391394 (addCommutativeForDiffKeys!500 lt!391402 k0!854 v!557 (select (arr!23910 _keys!868) from!1053) lt!391399))))

(declare-fun b!865189 () Bool)

(declare-fun res!587626 () Bool)

(assert (=> b!865189 (=> (not res!587626) (not e!482061))))

(assert (=> b!865189 (= res!587626 (and (= (select (arr!23910 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865190 () Bool)

(declare-fun res!587622 () Bool)

(assert (=> b!865190 (=> (not res!587622) (not e!482061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865190 (= res!587622 (validMask!0 mask!1196))))

(declare-fun b!865191 () Bool)

(declare-fun res!587624 () Bool)

(assert (=> b!865191 (=> (not res!587624) (not e!482061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49767 (_ BitVec 32)) Bool)

(assert (=> b!865191 (= res!587624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865192 () Bool)

(assert (=> b!865192 (= e!482063 e!482064)))

(declare-fun res!587620 () Bool)

(assert (=> b!865192 (=> res!587620 e!482064)))

(assert (=> b!865192 (= res!587620 (= k0!854 (select (arr!23910 _keys!868) from!1053)))))

(assert (=> b!865192 (not (= (select (arr!23910 _keys!868) from!1053) k0!854))))

(declare-fun lt!391400 () Unit!29550)

(assert (=> b!865192 (= lt!391400 e!482066)))

(declare-fun c!92464 () Bool)

(assert (=> b!865192 (= c!92464 (= (select (arr!23910 _keys!868) from!1053) k0!854))))

(declare-fun lt!391396 () ListLongMap!9861)

(assert (=> b!865192 (= lt!391396 lt!391408)))

(assert (=> b!865192 (= lt!391408 (+!2349 lt!391397 lt!391406))))

(assert (=> b!865192 (= lt!391406 (tuple2!11091 (select (arr!23910 _keys!868) from!1053) lt!391399))))

(declare-fun get!12638 (ValueCell!7949 V!27417) V!27417)

(declare-fun dynLambda!1174 (Int (_ BitVec 64)) V!27417)

(assert (=> b!865192 (= lt!391399 (get!12638 (select (arr!23909 _values!688) from!1053) (dynLambda!1174 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865193 () Bool)

(assert (=> b!865193 (= e!482061 e!482067)))

(declare-fun res!587623 () Bool)

(assert (=> b!865193 (=> (not res!587623) (not e!482067))))

(assert (=> b!865193 (= res!587623 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865193 (= lt!391396 (getCurrentListMapNoExtraKeys!2996 _keys!868 lt!391405 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865193 (= lt!391405 (array!49766 (store (arr!23909 _values!688) i!612 (ValueCellFull!7949 v!557)) (size!24350 _values!688)))))

(declare-fun lt!391401 () ListLongMap!9861)

(assert (=> b!865193 (= lt!391401 (getCurrentListMapNoExtraKeys!2996 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73894 res!587625) b!865190))

(assert (= (and b!865190 res!587622) b!865187))

(assert (= (and b!865187 res!587627) b!865191))

(assert (= (and b!865191 res!587624) b!865185))

(assert (= (and b!865185 res!587619) b!865186))

(assert (= (and b!865186 res!587628) b!865180))

(assert (= (and b!865180 res!587629) b!865189))

(assert (= (and b!865189 res!587626) b!865193))

(assert (= (and b!865193 res!587623) b!865179))

(assert (= (and b!865179 (not res!587621)) b!865192))

(assert (= (and b!865192 c!92464) b!865182))

(assert (= (and b!865192 (not c!92464)) b!865183))

(assert (= (and b!865192 (not res!587620)) b!865188))

(assert (= (and b!865184 condMapEmpty!26765) mapIsEmpty!26765))

(assert (= (and b!865184 (not condMapEmpty!26765)) mapNonEmpty!26765))

(get-info :version)

(assert (= (and mapNonEmpty!26765 ((_ is ValueCellFull!7949) mapValue!26765)) b!865178))

(assert (= (and b!865184 ((_ is ValueCellFull!7949) mapDefault!26765)) b!865181))

(assert (= start!73894 b!865184))

(declare-fun b_lambda!12007 () Bool)

(assert (=> (not b_lambda!12007) (not b!865192)))

(declare-fun t!23820 () Bool)

(declare-fun tb!4755 () Bool)

(assert (=> (and start!73894 (= defaultEntry!696 defaultEntry!696) t!23820) tb!4755))

(declare-fun result!9129 () Bool)

(assert (=> tb!4755 (= result!9129 tp_is_empty!16777)))

(assert (=> b!865192 t!23820))

(declare-fun b_and!24273 () Bool)

(assert (= b_and!24271 (and (=> t!23820 result!9129) b_and!24273)))

(declare-fun m!806879 () Bool)

(assert (=> b!865189 m!806879))

(declare-fun m!806881 () Bool)

(assert (=> b!865191 m!806881))

(declare-fun m!806883 () Bool)

(assert (=> b!865192 m!806883))

(declare-fun m!806885 () Bool)

(assert (=> b!865192 m!806885))

(declare-fun m!806887 () Bool)

(assert (=> b!865192 m!806887))

(declare-fun m!806889 () Bool)

(assert (=> b!865192 m!806889))

(assert (=> b!865192 m!806885))

(declare-fun m!806891 () Bool)

(assert (=> b!865192 m!806891))

(assert (=> b!865192 m!806887))

(declare-fun m!806893 () Bool)

(assert (=> b!865180 m!806893))

(declare-fun m!806895 () Bool)

(assert (=> b!865179 m!806895))

(declare-fun m!806897 () Bool)

(assert (=> b!865179 m!806897))

(declare-fun m!806899 () Bool)

(assert (=> b!865179 m!806899))

(assert (=> b!865179 m!806891))

(declare-fun m!806901 () Bool)

(assert (=> b!865179 m!806901))

(assert (=> b!865179 m!806891))

(declare-fun m!806903 () Bool)

(assert (=> b!865179 m!806903))

(declare-fun m!806905 () Bool)

(assert (=> b!865182 m!806905))

(declare-fun m!806907 () Bool)

(assert (=> b!865182 m!806907))

(declare-fun m!806909 () Bool)

(assert (=> b!865182 m!806909))

(declare-fun m!806911 () Bool)

(assert (=> b!865182 m!806911))

(declare-fun m!806913 () Bool)

(assert (=> b!865182 m!806913))

(declare-fun m!806915 () Bool)

(assert (=> b!865193 m!806915))

(declare-fun m!806917 () Bool)

(assert (=> b!865193 m!806917))

(declare-fun m!806919 () Bool)

(assert (=> b!865193 m!806919))

(declare-fun m!806921 () Bool)

(assert (=> b!865188 m!806921))

(assert (=> b!865188 m!806921))

(declare-fun m!806923 () Bool)

(assert (=> b!865188 m!806923))

(assert (=> b!865188 m!806891))

(assert (=> b!865188 m!806891))

(declare-fun m!806925 () Bool)

(assert (=> b!865188 m!806925))

(declare-fun m!806927 () Bool)

(assert (=> b!865185 m!806927))

(declare-fun m!806929 () Bool)

(assert (=> mapNonEmpty!26765 m!806929))

(declare-fun m!806931 () Bool)

(assert (=> b!865190 m!806931))

(declare-fun m!806933 () Bool)

(assert (=> start!73894 m!806933))

(declare-fun m!806935 () Bool)

(assert (=> start!73894 m!806935))

(check-sat (not b!865180) (not b!865190) (not start!73894) (not mapNonEmpty!26765) (not b_lambda!12007) (not b!865193) b_and!24273 (not b!865191) (not b!865182) (not b!865179) (not b!865185) tp_is_empty!16777 (not b!865192) (not b!865188) (not b_next!14641))
(check-sat b_and!24273 (not b_next!14641))
