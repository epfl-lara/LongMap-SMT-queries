; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73590 () Bool)

(assert start!73590)

(declare-fun b_free!14505 () Bool)

(declare-fun b_next!14505 () Bool)

(assert (=> start!73590 (= b_free!14505 (not b_next!14505))))

(declare-fun tp!51018 () Bool)

(declare-fun b_and!23989 () Bool)

(assert (=> start!73590 (= tp!51018 b_and!23989)))

(declare-fun b!860951 () Bool)

(declare-fun res!585116 () Bool)

(declare-fun e!479718 () Bool)

(assert (=> b!860951 (=> (not res!585116) (not e!479718))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49454 0))(
  ( (array!49455 (arr!23758 (Array (_ BitVec 32) (_ BitVec 64))) (size!24198 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49454)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860951 (= res!585116 (and (= (select (arr!23758 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860952 () Bool)

(declare-fun res!585111 () Bool)

(assert (=> b!860952 (=> (not res!585111) (not e!479718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860952 (= res!585111 (validKeyInArray!0 k0!854))))

(declare-fun b!860953 () Bool)

(declare-fun e!479722 () Bool)

(declare-fun tp_is_empty!16641 () Bool)

(assert (=> b!860953 (= e!479722 tp_is_empty!16641)))

(declare-fun b!860954 () Bool)

(declare-fun res!585113 () Bool)

(assert (=> b!860954 (=> (not res!585113) (not e!479718))))

(assert (=> b!860954 (= res!585113 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24198 _keys!868))))))

(declare-fun b!860955 () Bool)

(declare-fun res!585109 () Bool)

(assert (=> b!860955 (=> (not res!585109) (not e!479718))))

(declare-datatypes ((List!16869 0))(
  ( (Nil!16866) (Cons!16865 (h!17996 (_ BitVec 64)) (t!23640 List!16869)) )
))
(declare-fun arrayNoDuplicates!0 (array!49454 (_ BitVec 32) List!16869) Bool)

(assert (=> b!860955 (= res!585109 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16866))))

(declare-fun b!860956 () Bool)

(declare-fun e!479721 () Bool)

(assert (=> b!860956 (= e!479718 e!479721)))

(declare-fun res!585107 () Bool)

(assert (=> b!860956 (=> (not res!585107) (not e!479721))))

(assert (=> b!860956 (= res!585107 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27235 0))(
  ( (V!27236 (val!8368 Int)) )
))
(declare-datatypes ((tuple2!11060 0))(
  ( (tuple2!11061 (_1!5541 (_ BitVec 64)) (_2!5541 V!27235)) )
))
(declare-datatypes ((List!16870 0))(
  ( (Nil!16867) (Cons!16866 (h!17997 tuple2!11060) (t!23641 List!16870)) )
))
(declare-datatypes ((ListLongMap!9829 0))(
  ( (ListLongMap!9830 (toList!4930 List!16870)) )
))
(declare-fun lt!388159 () ListLongMap!9829)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7881 0))(
  ( (ValueCellFull!7881 (v!10793 V!27235)) (EmptyCell!7881) )
))
(declare-datatypes ((array!49456 0))(
  ( (array!49457 (arr!23759 (Array (_ BitVec 32) ValueCell!7881)) (size!24199 (_ BitVec 32))) )
))
(declare-fun lt!388154 () array!49456)

(declare-fun minValue!654 () V!27235)

(declare-fun zeroValue!654 () V!27235)

(declare-fun getCurrentListMapNoExtraKeys!2907 (array!49454 array!49456 (_ BitVec 32) (_ BitVec 32) V!27235 V!27235 (_ BitVec 32) Int) ListLongMap!9829)

(assert (=> b!860956 (= lt!388159 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!388154 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27235)

(declare-fun _values!688 () array!49456)

(assert (=> b!860956 (= lt!388154 (array!49457 (store (arr!23759 _values!688) i!612 (ValueCellFull!7881 v!557)) (size!24199 _values!688)))))

(declare-fun lt!388155 () ListLongMap!9829)

(assert (=> b!860956 (= lt!388155 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860957 () Bool)

(declare-fun res!585115 () Bool)

(assert (=> b!860957 (=> (not res!585115) (not e!479718))))

(assert (=> b!860957 (= res!585115 (and (= (size!24199 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24198 _keys!868) (size!24199 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26561 () Bool)

(declare-fun mapRes!26561 () Bool)

(declare-fun tp!51019 () Bool)

(assert (=> mapNonEmpty!26561 (= mapRes!26561 (and tp!51019 e!479722))))

(declare-fun mapRest!26561 () (Array (_ BitVec 32) ValueCell!7881))

(declare-fun mapKey!26561 () (_ BitVec 32))

(declare-fun mapValue!26561 () ValueCell!7881)

(assert (=> mapNonEmpty!26561 (= (arr!23759 _values!688) (store mapRest!26561 mapKey!26561 mapValue!26561))))

(declare-fun b!860958 () Bool)

(declare-fun e!479724 () Bool)

(assert (=> b!860958 (= e!479724 tp_is_empty!16641)))

(declare-fun b!860959 () Bool)

(declare-datatypes ((Unit!29355 0))(
  ( (Unit!29356) )
))
(declare-fun e!479720 () Unit!29355)

(declare-fun Unit!29357 () Unit!29355)

(assert (=> b!860959 (= e!479720 Unit!29357)))

(declare-fun lt!388156 () Unit!29355)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49454 (_ BitVec 32) (_ BitVec 32)) Unit!29355)

(assert (=> b!860959 (= lt!388156 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!860959 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16866)))

(declare-fun lt!388149 () Unit!29355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29355)

(assert (=> b!860959 (= lt!388149 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860959 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388157 () Unit!29355)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49454 (_ BitVec 64) (_ BitVec 32) List!16869) Unit!29355)

(assert (=> b!860959 (= lt!388157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16866))))

(assert (=> b!860959 false))

(declare-fun res!585114 () Bool)

(assert (=> start!73590 (=> (not res!585114) (not e!479718))))

(assert (=> start!73590 (= res!585114 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24198 _keys!868))))))

(assert (=> start!73590 e!479718))

(assert (=> start!73590 tp_is_empty!16641))

(assert (=> start!73590 true))

(assert (=> start!73590 tp!51018))

(declare-fun array_inv!18806 (array!49454) Bool)

(assert (=> start!73590 (array_inv!18806 _keys!868)))

(declare-fun e!479723 () Bool)

(declare-fun array_inv!18807 (array!49456) Bool)

(assert (=> start!73590 (and (array_inv!18807 _values!688) e!479723)))

(declare-fun b!860960 () Bool)

(declare-fun e!479719 () Bool)

(assert (=> b!860960 (= e!479721 (not e!479719))))

(declare-fun res!585108 () Bool)

(assert (=> b!860960 (=> res!585108 e!479719)))

(assert (=> b!860960 (= res!585108 (not (validKeyInArray!0 (select (arr!23758 _keys!868) from!1053))))))

(declare-fun lt!388150 () ListLongMap!9829)

(declare-fun lt!388151 () ListLongMap!9829)

(assert (=> b!860960 (= lt!388150 lt!388151)))

(declare-fun lt!388153 () ListLongMap!9829)

(declare-fun +!2281 (ListLongMap!9829 tuple2!11060) ListLongMap!9829)

(assert (=> b!860960 (= lt!388151 (+!2281 lt!388153 (tuple2!11061 k0!854 v!557)))))

(assert (=> b!860960 (= lt!388150 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!388154 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860960 (= lt!388153 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388152 () Unit!29355)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!493 (array!49454 array!49456 (_ BitVec 32) (_ BitVec 32) V!27235 V!27235 (_ BitVec 32) (_ BitVec 64) V!27235 (_ BitVec 32) Int) Unit!29355)

(assert (=> b!860960 (= lt!388152 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!493 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26561 () Bool)

(assert (=> mapIsEmpty!26561 mapRes!26561))

(declare-fun b!860961 () Bool)

(assert (=> b!860961 (= e!479719 true)))

(assert (=> b!860961 (not (= (select (arr!23758 _keys!868) from!1053) k0!854))))

(declare-fun lt!388158 () Unit!29355)

(assert (=> b!860961 (= lt!388158 e!479720)))

(declare-fun c!91978 () Bool)

(assert (=> b!860961 (= c!91978 (= (select (arr!23758 _keys!868) from!1053) k0!854))))

(declare-fun get!12529 (ValueCell!7881 V!27235) V!27235)

(declare-fun dynLambda!1117 (Int (_ BitVec 64)) V!27235)

(assert (=> b!860961 (= lt!388159 (+!2281 lt!388151 (tuple2!11061 (select (arr!23758 _keys!868) from!1053) (get!12529 (select (arr!23759 _values!688) from!1053) (dynLambda!1117 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860962 () Bool)

(declare-fun res!585110 () Bool)

(assert (=> b!860962 (=> (not res!585110) (not e!479718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860962 (= res!585110 (validMask!0 mask!1196))))

(declare-fun b!860963 () Bool)

(declare-fun Unit!29358 () Unit!29355)

(assert (=> b!860963 (= e!479720 Unit!29358)))

(declare-fun b!860964 () Bool)

(declare-fun res!585112 () Bool)

(assert (=> b!860964 (=> (not res!585112) (not e!479718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49454 (_ BitVec 32)) Bool)

(assert (=> b!860964 (= res!585112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860965 () Bool)

(assert (=> b!860965 (= e!479723 (and e!479724 mapRes!26561))))

(declare-fun condMapEmpty!26561 () Bool)

(declare-fun mapDefault!26561 () ValueCell!7881)

(assert (=> b!860965 (= condMapEmpty!26561 (= (arr!23759 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7881)) mapDefault!26561)))))

(assert (= (and start!73590 res!585114) b!860962))

(assert (= (and b!860962 res!585110) b!860957))

(assert (= (and b!860957 res!585115) b!860964))

(assert (= (and b!860964 res!585112) b!860955))

(assert (= (and b!860955 res!585109) b!860954))

(assert (= (and b!860954 res!585113) b!860952))

(assert (= (and b!860952 res!585111) b!860951))

(assert (= (and b!860951 res!585116) b!860956))

(assert (= (and b!860956 res!585107) b!860960))

(assert (= (and b!860960 (not res!585108)) b!860961))

(assert (= (and b!860961 c!91978) b!860959))

(assert (= (and b!860961 (not c!91978)) b!860963))

(assert (= (and b!860965 condMapEmpty!26561) mapIsEmpty!26561))

(assert (= (and b!860965 (not condMapEmpty!26561)) mapNonEmpty!26561))

(get-info :version)

(assert (= (and mapNonEmpty!26561 ((_ is ValueCellFull!7881) mapValue!26561)) b!860953))

(assert (= (and b!860965 ((_ is ValueCellFull!7881) mapDefault!26561)) b!860958))

(assert (= start!73590 b!860965))

(declare-fun b_lambda!11857 () Bool)

(assert (=> (not b_lambda!11857) (not b!860961)))

(declare-fun t!23639 () Bool)

(declare-fun tb!4627 () Bool)

(assert (=> (and start!73590 (= defaultEntry!696 defaultEntry!696) t!23639) tb!4627))

(declare-fun result!8865 () Bool)

(assert (=> tb!4627 (= result!8865 tp_is_empty!16641)))

(assert (=> b!860961 t!23639))

(declare-fun b_and!23991 () Bool)

(assert (= b_and!23989 (and (=> t!23639 result!8865) b_and!23991)))

(declare-fun m!801801 () Bool)

(assert (=> b!860964 m!801801))

(declare-fun m!801803 () Bool)

(assert (=> b!860955 m!801803))

(declare-fun m!801805 () Bool)

(assert (=> b!860956 m!801805))

(declare-fun m!801807 () Bool)

(assert (=> b!860956 m!801807))

(declare-fun m!801809 () Bool)

(assert (=> b!860956 m!801809))

(declare-fun m!801811 () Bool)

(assert (=> b!860961 m!801811))

(declare-fun m!801813 () Bool)

(assert (=> b!860961 m!801813))

(declare-fun m!801815 () Bool)

(assert (=> b!860961 m!801815))

(declare-fun m!801817 () Bool)

(assert (=> b!860961 m!801817))

(assert (=> b!860961 m!801813))

(declare-fun m!801819 () Bool)

(assert (=> b!860961 m!801819))

(assert (=> b!860961 m!801815))

(declare-fun m!801821 () Bool)

(assert (=> mapNonEmpty!26561 m!801821))

(declare-fun m!801823 () Bool)

(assert (=> b!860960 m!801823))

(declare-fun m!801825 () Bool)

(assert (=> b!860960 m!801825))

(assert (=> b!860960 m!801819))

(declare-fun m!801827 () Bool)

(assert (=> b!860960 m!801827))

(assert (=> b!860960 m!801819))

(declare-fun m!801829 () Bool)

(assert (=> b!860960 m!801829))

(declare-fun m!801831 () Bool)

(assert (=> b!860960 m!801831))

(declare-fun m!801833 () Bool)

(assert (=> b!860951 m!801833))

(declare-fun m!801835 () Bool)

(assert (=> start!73590 m!801835))

(declare-fun m!801837 () Bool)

(assert (=> start!73590 m!801837))

(declare-fun m!801839 () Bool)

(assert (=> b!860952 m!801839))

(declare-fun m!801841 () Bool)

(assert (=> b!860959 m!801841))

(declare-fun m!801843 () Bool)

(assert (=> b!860959 m!801843))

(declare-fun m!801845 () Bool)

(assert (=> b!860959 m!801845))

(declare-fun m!801847 () Bool)

(assert (=> b!860959 m!801847))

(declare-fun m!801849 () Bool)

(assert (=> b!860959 m!801849))

(declare-fun m!801851 () Bool)

(assert (=> b!860962 m!801851))

(check-sat (not b!860952) tp_is_empty!16641 (not mapNonEmpty!26561) (not b!860956) (not start!73590) (not b_lambda!11857) (not b!860962) (not b!860959) b_and!23991 (not b!860961) (not b_next!14505) (not b!860960) (not b!860955) (not b!860964))
(check-sat b_and!23991 (not b_next!14505))
