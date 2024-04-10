; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73758 () Bool)

(assert start!73758)

(declare-fun b_free!14673 () Bool)

(declare-fun b_next!14673 () Bool)

(assert (=> start!73758 (= b_free!14673 (not b_next!14673))))

(declare-fun tp!51522 () Bool)

(declare-fun b_and!24325 () Bool)

(assert (=> start!73758 (= tp!51522 b_and!24325)))

(declare-fun b!865075 () Bool)

(declare-fun res!587810 () Bool)

(declare-fun e!481918 () Bool)

(assert (=> b!865075 (=> (not res!587810) (not e!481918))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49778 0))(
  ( (array!49779 (arr!23920 (Array (_ BitVec 32) (_ BitVec 64))) (size!24360 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49778)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!865075 (= res!587810 (and (= (select (arr!23920 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26813 () Bool)

(declare-fun mapRes!26813 () Bool)

(declare-fun tp!51523 () Bool)

(declare-fun e!481913 () Bool)

(assert (=> mapNonEmpty!26813 (= mapRes!26813 (and tp!51523 e!481913))))

(declare-fun mapKey!26813 () (_ BitVec 32))

(declare-datatypes ((V!27459 0))(
  ( (V!27460 (val!8452 Int)) )
))
(declare-datatypes ((ValueCell!7965 0))(
  ( (ValueCellFull!7965 (v!10877 V!27459)) (EmptyCell!7965) )
))
(declare-fun mapValue!26813 () ValueCell!7965)

(declare-fun mapRest!26813 () (Array (_ BitVec 32) ValueCell!7965))

(declare-datatypes ((array!49780 0))(
  ( (array!49781 (arr!23921 (Array (_ BitVec 32) ValueCell!7965)) (size!24361 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49780)

(assert (=> mapNonEmpty!26813 (= (arr!23921 _values!688) (store mapRest!26813 mapKey!26813 mapValue!26813))))

(declare-fun b!865076 () Bool)

(declare-fun e!481915 () Bool)

(declare-fun e!481916 () Bool)

(assert (=> b!865076 (= e!481915 e!481916)))

(declare-fun res!587805 () Bool)

(assert (=> b!865076 (=> res!587805 e!481916)))

(assert (=> b!865076 (= res!587805 (= k0!854 (select (arr!23920 _keys!868) from!1053)))))

(assert (=> b!865076 (not (= (select (arr!23920 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29617 0))(
  ( (Unit!29618) )
))
(declare-fun lt!391802 () Unit!29617)

(declare-fun e!481910 () Unit!29617)

(assert (=> b!865076 (= lt!391802 e!481910)))

(declare-fun c!92230 () Bool)

(assert (=> b!865076 (= c!92230 (= (select (arr!23920 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11200 0))(
  ( (tuple2!11201 (_1!5611 (_ BitVec 64)) (_2!5611 V!27459)) )
))
(declare-datatypes ((List!17003 0))(
  ( (Nil!17000) (Cons!16999 (h!18130 tuple2!11200) (t!23942 List!17003)) )
))
(declare-datatypes ((ListLongMap!9969 0))(
  ( (ListLongMap!9970 (toList!5000 List!17003)) )
))
(declare-fun lt!391801 () ListLongMap!9969)

(declare-fun lt!391809 () ListLongMap!9969)

(assert (=> b!865076 (= lt!391801 lt!391809)))

(declare-fun lt!391805 () ListLongMap!9969)

(declare-fun lt!391814 () tuple2!11200)

(declare-fun +!2349 (ListLongMap!9969 tuple2!11200) ListLongMap!9969)

(assert (=> b!865076 (= lt!391809 (+!2349 lt!391805 lt!391814))))

(declare-fun lt!391813 () V!27459)

(assert (=> b!865076 (= lt!391814 (tuple2!11201 (select (arr!23920 _keys!868) from!1053) lt!391813))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12641 (ValueCell!7965 V!27459) V!27459)

(declare-fun dynLambda!1173 (Int (_ BitVec 64)) V!27459)

(assert (=> b!865076 (= lt!391813 (get!12641 (select (arr!23921 _values!688) from!1053) (dynLambda!1173 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865077 () Bool)

(declare-fun res!587804 () Bool)

(assert (=> b!865077 (=> (not res!587804) (not e!481918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865077 (= res!587804 (validKeyInArray!0 k0!854))))

(declare-fun b!865078 () Bool)

(declare-fun tp_is_empty!16809 () Bool)

(assert (=> b!865078 (= e!481913 tp_is_empty!16809)))

(declare-fun b!865079 () Bool)

(declare-fun e!481911 () Bool)

(assert (=> b!865079 (= e!481911 tp_is_empty!16809)))

(declare-fun b!865080 () Bool)

(declare-fun res!587803 () Bool)

(assert (=> b!865080 (=> (not res!587803) (not e!481918))))

(declare-datatypes ((List!17004 0))(
  ( (Nil!17001) (Cons!17000 (h!18131 (_ BitVec 64)) (t!23943 List!17004)) )
))
(declare-fun arrayNoDuplicates!0 (array!49778 (_ BitVec 32) List!17004) Bool)

(assert (=> b!865080 (= res!587803 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17001))))

(declare-fun res!587807 () Bool)

(assert (=> start!73758 (=> (not res!587807) (not e!481918))))

(assert (=> start!73758 (= res!587807 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24360 _keys!868))))))

(assert (=> start!73758 e!481918))

(assert (=> start!73758 tp_is_empty!16809))

(assert (=> start!73758 true))

(assert (=> start!73758 tp!51522))

(declare-fun array_inv!18912 (array!49778) Bool)

(assert (=> start!73758 (array_inv!18912 _keys!868)))

(declare-fun e!481917 () Bool)

(declare-fun array_inv!18913 (array!49780) Bool)

(assert (=> start!73758 (and (array_inv!18913 _values!688) e!481917)))

(declare-fun b!865081 () Bool)

(declare-fun res!587809 () Bool)

(assert (=> b!865081 (=> (not res!587809) (not e!481918))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49778 (_ BitVec 32)) Bool)

(assert (=> b!865081 (= res!587809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865082 () Bool)

(declare-fun res!587812 () Bool)

(assert (=> b!865082 (=> (not res!587812) (not e!481918))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!865082 (= res!587812 (and (= (size!24361 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24360 _keys!868) (size!24361 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865083 () Bool)

(assert (=> b!865083 (= e!481917 (and e!481911 mapRes!26813))))

(declare-fun condMapEmpty!26813 () Bool)

(declare-fun mapDefault!26813 () ValueCell!7965)

(assert (=> b!865083 (= condMapEmpty!26813 (= (arr!23921 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7965)) mapDefault!26813)))))

(declare-fun b!865084 () Bool)

(assert (=> b!865084 (= e!481916 true)))

(declare-fun lt!391807 () tuple2!11200)

(declare-fun lt!391816 () ListLongMap!9969)

(assert (=> b!865084 (= lt!391809 (+!2349 (+!2349 lt!391816 lt!391814) lt!391807))))

(declare-fun v!557 () V!27459)

(declare-fun lt!391806 () Unit!29617)

(declare-fun addCommutativeForDiffKeys!518 (ListLongMap!9969 (_ BitVec 64) V!27459 (_ BitVec 64) V!27459) Unit!29617)

(assert (=> b!865084 (= lt!391806 (addCommutativeForDiffKeys!518 lt!391816 k0!854 v!557 (select (arr!23920 _keys!868) from!1053) lt!391813))))

(declare-fun b!865085 () Bool)

(declare-fun e!481912 () Bool)

(assert (=> b!865085 (= e!481918 e!481912)))

(declare-fun res!587808 () Bool)

(assert (=> b!865085 (=> (not res!587808) (not e!481912))))

(assert (=> b!865085 (= res!587808 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391810 () array!49780)

(declare-fun minValue!654 () V!27459)

(declare-fun zeroValue!654 () V!27459)

(declare-fun getCurrentListMapNoExtraKeys!2971 (array!49778 array!49780 (_ BitVec 32) (_ BitVec 32) V!27459 V!27459 (_ BitVec 32) Int) ListLongMap!9969)

(assert (=> b!865085 (= lt!391801 (getCurrentListMapNoExtraKeys!2971 _keys!868 lt!391810 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865085 (= lt!391810 (array!49781 (store (arr!23921 _values!688) i!612 (ValueCellFull!7965 v!557)) (size!24361 _values!688)))))

(declare-fun lt!391812 () ListLongMap!9969)

(assert (=> b!865085 (= lt!391812 (getCurrentListMapNoExtraKeys!2971 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865086 () Bool)

(declare-fun res!587811 () Bool)

(assert (=> b!865086 (=> (not res!587811) (not e!481918))))

(assert (=> b!865086 (= res!587811 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24360 _keys!868))))))

(declare-fun b!865087 () Bool)

(declare-fun Unit!29619 () Unit!29617)

(assert (=> b!865087 (= e!481910 Unit!29619)))

(declare-fun lt!391804 () Unit!29617)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49778 (_ BitVec 32) (_ BitVec 32)) Unit!29617)

(assert (=> b!865087 (= lt!391804 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865087 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17001)))

(declare-fun lt!391808 () Unit!29617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49778 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29617)

(assert (=> b!865087 (= lt!391808 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865087 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391803 () Unit!29617)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49778 (_ BitVec 64) (_ BitVec 32) List!17004) Unit!29617)

(assert (=> b!865087 (= lt!391803 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17001))))

(assert (=> b!865087 false))

(declare-fun mapIsEmpty!26813 () Bool)

(assert (=> mapIsEmpty!26813 mapRes!26813))

(declare-fun b!865088 () Bool)

(declare-fun Unit!29620 () Unit!29617)

(assert (=> b!865088 (= e!481910 Unit!29620)))

(declare-fun b!865089 () Bool)

(assert (=> b!865089 (= e!481912 (not e!481915))))

(declare-fun res!587806 () Bool)

(assert (=> b!865089 (=> res!587806 e!481915)))

(assert (=> b!865089 (= res!587806 (not (validKeyInArray!0 (select (arr!23920 _keys!868) from!1053))))))

(declare-fun lt!391811 () ListLongMap!9969)

(assert (=> b!865089 (= lt!391811 lt!391805)))

(assert (=> b!865089 (= lt!391805 (+!2349 lt!391816 lt!391807))))

(assert (=> b!865089 (= lt!391811 (getCurrentListMapNoExtraKeys!2971 _keys!868 lt!391810 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865089 (= lt!391807 (tuple2!11201 k0!854 v!557))))

(assert (=> b!865089 (= lt!391816 (getCurrentListMapNoExtraKeys!2971 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391815 () Unit!29617)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!551 (array!49778 array!49780 (_ BitVec 32) (_ BitVec 32) V!27459 V!27459 (_ BitVec 32) (_ BitVec 64) V!27459 (_ BitVec 32) Int) Unit!29617)

(assert (=> b!865089 (= lt!391815 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!551 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865090 () Bool)

(declare-fun res!587813 () Bool)

(assert (=> b!865090 (=> (not res!587813) (not e!481918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865090 (= res!587813 (validMask!0 mask!1196))))

(assert (= (and start!73758 res!587807) b!865090))

(assert (= (and b!865090 res!587813) b!865082))

(assert (= (and b!865082 res!587812) b!865081))

(assert (= (and b!865081 res!587809) b!865080))

(assert (= (and b!865080 res!587803) b!865086))

(assert (= (and b!865086 res!587811) b!865077))

(assert (= (and b!865077 res!587804) b!865075))

(assert (= (and b!865075 res!587810) b!865085))

(assert (= (and b!865085 res!587808) b!865089))

(assert (= (and b!865089 (not res!587806)) b!865076))

(assert (= (and b!865076 c!92230) b!865087))

(assert (= (and b!865076 (not c!92230)) b!865088))

(assert (= (and b!865076 (not res!587805)) b!865084))

(assert (= (and b!865083 condMapEmpty!26813) mapIsEmpty!26813))

(assert (= (and b!865083 (not condMapEmpty!26813)) mapNonEmpty!26813))

(get-info :version)

(assert (= (and mapNonEmpty!26813 ((_ is ValueCellFull!7965) mapValue!26813)) b!865078))

(assert (= (and b!865083 ((_ is ValueCellFull!7965) mapDefault!26813)) b!865079))

(assert (= start!73758 b!865083))

(declare-fun b_lambda!12025 () Bool)

(assert (=> (not b_lambda!12025) (not b!865076)))

(declare-fun t!23941 () Bool)

(declare-fun tb!4795 () Bool)

(assert (=> (and start!73758 (= defaultEntry!696 defaultEntry!696) t!23941) tb!4795))

(declare-fun result!9201 () Bool)

(assert (=> tb!4795 (= result!9201 tp_is_empty!16809)))

(assert (=> b!865076 t!23941))

(declare-fun b_and!24327 () Bool)

(assert (= b_and!24325 (and (=> t!23941 result!9201) b_and!24327)))

(declare-fun m!806517 () Bool)

(assert (=> b!865090 m!806517))

(declare-fun m!806519 () Bool)

(assert (=> b!865076 m!806519))

(declare-fun m!806521 () Bool)

(assert (=> b!865076 m!806521))

(declare-fun m!806523 () Bool)

(assert (=> b!865076 m!806523))

(declare-fun m!806525 () Bool)

(assert (=> b!865076 m!806525))

(assert (=> b!865076 m!806521))

(declare-fun m!806527 () Bool)

(assert (=> b!865076 m!806527))

(assert (=> b!865076 m!806523))

(declare-fun m!806529 () Bool)

(assert (=> start!73758 m!806529))

(declare-fun m!806531 () Bool)

(assert (=> start!73758 m!806531))

(declare-fun m!806533 () Bool)

(assert (=> b!865084 m!806533))

(assert (=> b!865084 m!806533))

(declare-fun m!806535 () Bool)

(assert (=> b!865084 m!806535))

(assert (=> b!865084 m!806527))

(assert (=> b!865084 m!806527))

(declare-fun m!806537 () Bool)

(assert (=> b!865084 m!806537))

(declare-fun m!806539 () Bool)

(assert (=> mapNonEmpty!26813 m!806539))

(declare-fun m!806541 () Bool)

(assert (=> b!865077 m!806541))

(declare-fun m!806543 () Bool)

(assert (=> b!865081 m!806543))

(declare-fun m!806545 () Bool)

(assert (=> b!865085 m!806545))

(declare-fun m!806547 () Bool)

(assert (=> b!865085 m!806547))

(declare-fun m!806549 () Bool)

(assert (=> b!865085 m!806549))

(declare-fun m!806551 () Bool)

(assert (=> b!865089 m!806551))

(assert (=> b!865089 m!806527))

(declare-fun m!806553 () Bool)

(assert (=> b!865089 m!806553))

(assert (=> b!865089 m!806527))

(declare-fun m!806555 () Bool)

(assert (=> b!865089 m!806555))

(declare-fun m!806557 () Bool)

(assert (=> b!865089 m!806557))

(declare-fun m!806559 () Bool)

(assert (=> b!865089 m!806559))

(declare-fun m!806561 () Bool)

(assert (=> b!865075 m!806561))

(declare-fun m!806563 () Bool)

(assert (=> b!865087 m!806563))

(declare-fun m!806565 () Bool)

(assert (=> b!865087 m!806565))

(declare-fun m!806567 () Bool)

(assert (=> b!865087 m!806567))

(declare-fun m!806569 () Bool)

(assert (=> b!865087 m!806569))

(declare-fun m!806571 () Bool)

(assert (=> b!865087 m!806571))

(declare-fun m!806573 () Bool)

(assert (=> b!865080 m!806573))

(check-sat (not b!865076) (not b!865089) (not b!865081) (not mapNonEmpty!26813) (not b!865080) (not b!865084) b_and!24327 (not start!73758) (not b!865087) (not b!865090) (not b!865077) (not b!865085) (not b_next!14673) tp_is_empty!16809 (not b_lambda!12025))
(check-sat b_and!24327 (not b_next!14673))
