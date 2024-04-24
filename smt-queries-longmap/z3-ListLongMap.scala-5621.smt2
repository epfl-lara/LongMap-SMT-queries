; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73678 () Bool)

(assert start!73678)

(declare-fun b_free!14425 () Bool)

(declare-fun b_next!14425 () Bool)

(assert (=> start!73678 (= b_free!14425 (not b_next!14425))))

(declare-fun tp!50780 () Bool)

(declare-fun b_and!23839 () Bool)

(assert (=> start!73678 (= tp!50780 b_and!23839)))

(declare-fun b!859837 () Bool)

(declare-fun res!583910 () Bool)

(declare-fun e!479263 () Bool)

(assert (=> b!859837 (=> (not res!583910) (not e!479263))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49351 0))(
  ( (array!49352 (arr!23702 (Array (_ BitVec 32) (_ BitVec 64))) (size!24143 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49351)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859837 (= res!583910 (and (= (select (arr!23702 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!583906 () Bool)

(assert (=> start!73678 (=> (not res!583906) (not e!479263))))

(assert (=> start!73678 (= res!583906 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24143 _keys!868))))))

(assert (=> start!73678 e!479263))

(declare-fun tp_is_empty!16561 () Bool)

(assert (=> start!73678 tp_is_empty!16561))

(assert (=> start!73678 true))

(assert (=> start!73678 tp!50780))

(declare-fun array_inv!18814 (array!49351) Bool)

(assert (=> start!73678 (array_inv!18814 _keys!868)))

(declare-datatypes ((V!27129 0))(
  ( (V!27130 (val!8328 Int)) )
))
(declare-datatypes ((ValueCell!7841 0))(
  ( (ValueCellFull!7841 (v!10753 V!27129)) (EmptyCell!7841) )
))
(declare-datatypes ((array!49353 0))(
  ( (array!49354 (arr!23703 (Array (_ BitVec 32) ValueCell!7841)) (size!24144 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49353)

(declare-fun e!479259 () Bool)

(declare-fun array_inv!18815 (array!49353) Bool)

(assert (=> start!73678 (and (array_inv!18815 _values!688) e!479259)))

(declare-fun mapNonEmpty!26441 () Bool)

(declare-fun mapRes!26441 () Bool)

(declare-fun tp!50779 () Bool)

(declare-fun e!479262 () Bool)

(assert (=> mapNonEmpty!26441 (= mapRes!26441 (and tp!50779 e!479262))))

(declare-fun mapValue!26441 () ValueCell!7841)

(declare-fun mapKey!26441 () (_ BitVec 32))

(declare-fun mapRest!26441 () (Array (_ BitVec 32) ValueCell!7841))

(assert (=> mapNonEmpty!26441 (= (arr!23703 _values!688) (store mapRest!26441 mapKey!26441 mapValue!26441))))

(declare-fun b!859838 () Bool)

(declare-fun e!479261 () Bool)

(declare-fun e!479266 () Bool)

(assert (=> b!859838 (= e!479261 (not e!479266))))

(declare-fun res!583909 () Bool)

(assert (=> b!859838 (=> res!583909 e!479266)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859838 (= res!583909 (not (validKeyInArray!0 (select (arr!23702 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10920 0))(
  ( (tuple2!10921 (_1!5471 (_ BitVec 64)) (_2!5471 V!27129)) )
))
(declare-datatypes ((List!16759 0))(
  ( (Nil!16756) (Cons!16755 (h!17892 tuple2!10920) (t!23442 List!16759)) )
))
(declare-datatypes ((ListLongMap!9691 0))(
  ( (ListLongMap!9692 (toList!4861 List!16759)) )
))
(declare-fun lt!387349 () ListLongMap!9691)

(declare-fun lt!387347 () ListLongMap!9691)

(assert (=> b!859838 (= lt!387349 lt!387347)))

(declare-fun v!557 () V!27129)

(declare-fun lt!387351 () ListLongMap!9691)

(declare-fun +!2267 (ListLongMap!9691 tuple2!10920) ListLongMap!9691)

(assert (=> b!859838 (= lt!387347 (+!2267 lt!387351 (tuple2!10921 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387348 () array!49353)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27129)

(declare-fun zeroValue!654 () V!27129)

(declare-fun getCurrentListMapNoExtraKeys!2917 (array!49351 array!49353 (_ BitVec 32) (_ BitVec 32) V!27129 V!27129 (_ BitVec 32) Int) ListLongMap!9691)

(assert (=> b!859838 (= lt!387349 (getCurrentListMapNoExtraKeys!2917 _keys!868 lt!387348 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859838 (= lt!387351 (getCurrentListMapNoExtraKeys!2917 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29286 0))(
  ( (Unit!29287) )
))
(declare-fun lt!387346 () Unit!29286)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 (array!49351 array!49353 (_ BitVec 32) (_ BitVec 32) V!27129 V!27129 (_ BitVec 32) (_ BitVec 64) V!27129 (_ BitVec 32) Int) Unit!29286)

(assert (=> b!859838 (= lt!387346 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859839 () Bool)

(declare-fun res!583911 () Bool)

(assert (=> b!859839 (=> (not res!583911) (not e!479263))))

(declare-datatypes ((List!16760 0))(
  ( (Nil!16757) (Cons!16756 (h!17893 (_ BitVec 64)) (t!23443 List!16760)) )
))
(declare-fun arrayNoDuplicates!0 (array!49351 (_ BitVec 32) List!16760) Bool)

(assert (=> b!859839 (= res!583911 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16757))))

(declare-fun b!859840 () Bool)

(declare-fun res!583905 () Bool)

(assert (=> b!859840 (=> (not res!583905) (not e!479263))))

(assert (=> b!859840 (= res!583905 (validKeyInArray!0 k0!854))))

(declare-fun b!859841 () Bool)

(assert (=> b!859841 (= e!479263 e!479261)))

(declare-fun res!583912 () Bool)

(assert (=> b!859841 (=> (not res!583912) (not e!479261))))

(assert (=> b!859841 (= res!583912 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387352 () ListLongMap!9691)

(assert (=> b!859841 (= lt!387352 (getCurrentListMapNoExtraKeys!2917 _keys!868 lt!387348 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859841 (= lt!387348 (array!49354 (store (arr!23703 _values!688) i!612 (ValueCellFull!7841 v!557)) (size!24144 _values!688)))))

(declare-fun lt!387350 () ListLongMap!9691)

(assert (=> b!859841 (= lt!387350 (getCurrentListMapNoExtraKeys!2917 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859842 () Bool)

(declare-fun res!583904 () Bool)

(assert (=> b!859842 (=> (not res!583904) (not e!479263))))

(assert (=> b!859842 (= res!583904 (and (= (size!24144 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24143 _keys!868) (size!24144 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859843 () Bool)

(declare-fun e!479264 () Bool)

(assert (=> b!859843 (= e!479266 e!479264)))

(declare-fun res!583907 () Bool)

(assert (=> b!859843 (=> res!583907 e!479264)))

(assert (=> b!859843 (= res!583907 (not (= (select (arr!23702 _keys!868) from!1053) k0!854)))))

(declare-fun get!12493 (ValueCell!7841 V!27129) V!27129)

(declare-fun dynLambda!1101 (Int (_ BitVec 64)) V!27129)

(assert (=> b!859843 (= lt!387352 (+!2267 lt!387347 (tuple2!10921 (select (arr!23702 _keys!868) from!1053) (get!12493 (select (arr!23703 _values!688) from!1053) (dynLambda!1101 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859844 () Bool)

(declare-fun e!479265 () Bool)

(assert (=> b!859844 (= e!479259 (and e!479265 mapRes!26441))))

(declare-fun condMapEmpty!26441 () Bool)

(declare-fun mapDefault!26441 () ValueCell!7841)

(assert (=> b!859844 (= condMapEmpty!26441 (= (arr!23703 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7841)) mapDefault!26441)))))

(declare-fun b!859845 () Bool)

(declare-fun res!583902 () Bool)

(assert (=> b!859845 (=> (not res!583902) (not e!479263))))

(assert (=> b!859845 (= res!583902 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24143 _keys!868))))))

(declare-fun mapIsEmpty!26441 () Bool)

(assert (=> mapIsEmpty!26441 mapRes!26441))

(declare-fun b!859846 () Bool)

(assert (=> b!859846 (= e!479264 true)))

(assert (=> b!859846 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16757)))

(declare-fun lt!387353 () Unit!29286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49351 (_ BitVec 32) (_ BitVec 32)) Unit!29286)

(assert (=> b!859846 (= lt!387353 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859847 () Bool)

(assert (=> b!859847 (= e!479265 tp_is_empty!16561)))

(declare-fun b!859848 () Bool)

(declare-fun res!583908 () Bool)

(assert (=> b!859848 (=> (not res!583908) (not e!479263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49351 (_ BitVec 32)) Bool)

(assert (=> b!859848 (= res!583908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859849 () Bool)

(assert (=> b!859849 (= e!479262 tp_is_empty!16561)))

(declare-fun b!859850 () Bool)

(declare-fun res!583903 () Bool)

(assert (=> b!859850 (=> (not res!583903) (not e!479263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859850 (= res!583903 (validMask!0 mask!1196))))

(assert (= (and start!73678 res!583906) b!859850))

(assert (= (and b!859850 res!583903) b!859842))

(assert (= (and b!859842 res!583904) b!859848))

(assert (= (and b!859848 res!583908) b!859839))

(assert (= (and b!859839 res!583911) b!859845))

(assert (= (and b!859845 res!583902) b!859840))

(assert (= (and b!859840 res!583905) b!859837))

(assert (= (and b!859837 res!583910) b!859841))

(assert (= (and b!859841 res!583912) b!859838))

(assert (= (and b!859838 (not res!583909)) b!859843))

(assert (= (and b!859843 (not res!583907)) b!859846))

(assert (= (and b!859844 condMapEmpty!26441) mapIsEmpty!26441))

(assert (= (and b!859844 (not condMapEmpty!26441)) mapNonEmpty!26441))

(get-info :version)

(assert (= (and mapNonEmpty!26441 ((_ is ValueCellFull!7841) mapValue!26441)) b!859849))

(assert (= (and b!859844 ((_ is ValueCellFull!7841) mapDefault!26441)) b!859847))

(assert (= start!73678 b!859844))

(declare-fun b_lambda!11791 () Bool)

(assert (=> (not b_lambda!11791) (not b!859843)))

(declare-fun t!23441 () Bool)

(declare-fun tb!4539 () Bool)

(assert (=> (and start!73678 (= defaultEntry!696 defaultEntry!696) t!23441) tb!4539))

(declare-fun result!8697 () Bool)

(assert (=> tb!4539 (= result!8697 tp_is_empty!16561)))

(assert (=> b!859843 t!23441))

(declare-fun b_and!23841 () Bool)

(assert (= b_and!23839 (and (=> t!23441 result!8697) b_and!23841)))

(declare-fun m!800957 () Bool)

(assert (=> b!859841 m!800957))

(declare-fun m!800959 () Bool)

(assert (=> b!859841 m!800959))

(declare-fun m!800961 () Bool)

(assert (=> b!859841 m!800961))

(declare-fun m!800963 () Bool)

(assert (=> b!859837 m!800963))

(declare-fun m!800965 () Bool)

(assert (=> b!859839 m!800965))

(declare-fun m!800967 () Bool)

(assert (=> start!73678 m!800967))

(declare-fun m!800969 () Bool)

(assert (=> start!73678 m!800969))

(declare-fun m!800971 () Bool)

(assert (=> b!859848 m!800971))

(declare-fun m!800973 () Bool)

(assert (=> b!859840 m!800973))

(declare-fun m!800975 () Bool)

(assert (=> b!859843 m!800975))

(declare-fun m!800977 () Bool)

(assert (=> b!859843 m!800977))

(declare-fun m!800979 () Bool)

(assert (=> b!859843 m!800979))

(declare-fun m!800981 () Bool)

(assert (=> b!859843 m!800981))

(assert (=> b!859843 m!800977))

(declare-fun m!800983 () Bool)

(assert (=> b!859843 m!800983))

(assert (=> b!859843 m!800979))

(declare-fun m!800985 () Bool)

(assert (=> b!859838 m!800985))

(declare-fun m!800987 () Bool)

(assert (=> b!859838 m!800987))

(declare-fun m!800989 () Bool)

(assert (=> b!859838 m!800989))

(assert (=> b!859838 m!800983))

(declare-fun m!800991 () Bool)

(assert (=> b!859838 m!800991))

(assert (=> b!859838 m!800983))

(declare-fun m!800993 () Bool)

(assert (=> b!859838 m!800993))

(declare-fun m!800995 () Bool)

(assert (=> mapNonEmpty!26441 m!800995))

(declare-fun m!800997 () Bool)

(assert (=> b!859846 m!800997))

(declare-fun m!800999 () Bool)

(assert (=> b!859846 m!800999))

(declare-fun m!801001 () Bool)

(assert (=> b!859850 m!801001))

(check-sat (not b_next!14425) (not b!859839) (not b!859840) (not b!859838) (not mapNonEmpty!26441) (not start!73678) (not b!859846) b_and!23841 (not b!859841) (not b_lambda!11791) (not b!859850) tp_is_empty!16561 (not b!859848) (not b!859843))
(check-sat b_and!23841 (not b_next!14425))
