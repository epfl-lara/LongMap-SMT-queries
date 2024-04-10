; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73524 () Bool)

(assert start!73524)

(declare-fun b_free!14439 () Bool)

(declare-fun b_next!14439 () Bool)

(assert (=> start!73524 (= b_free!14439 (not b_next!14439))))

(declare-fun tp!50820 () Bool)

(declare-fun b_and!23857 () Bool)

(assert (=> start!73524 (= tp!50820 b_and!23857)))

(declare-fun b!859242 () Bool)

(declare-fun res!583792 () Bool)

(declare-fun e!478847 () Bool)

(assert (=> b!859242 (=> (not res!583792) (not e!478847))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49330 0))(
  ( (array!49331 (arr!23696 (Array (_ BitVec 32) (_ BitVec 64))) (size!24136 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49330)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859242 (= res!583792 (and (= (select (arr!23696 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859243 () Bool)

(declare-fun res!583794 () Bool)

(assert (=> b!859243 (=> (not res!583794) (not e!478847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859243 (= res!583794 (validKeyInArray!0 k0!854))))

(declare-fun b!859244 () Bool)

(declare-fun e!478851 () Bool)

(declare-fun e!478852 () Bool)

(declare-fun mapRes!26462 () Bool)

(assert (=> b!859244 (= e!478851 (and e!478852 mapRes!26462))))

(declare-fun condMapEmpty!26462 () Bool)

(declare-datatypes ((V!27147 0))(
  ( (V!27148 (val!8335 Int)) )
))
(declare-datatypes ((ValueCell!7848 0))(
  ( (ValueCellFull!7848 (v!10760 V!27147)) (EmptyCell!7848) )
))
(declare-datatypes ((array!49332 0))(
  ( (array!49333 (arr!23697 (Array (_ BitVec 32) ValueCell!7848)) (size!24137 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49332)

(declare-fun mapDefault!26462 () ValueCell!7848)

(assert (=> b!859244 (= condMapEmpty!26462 (= (arr!23697 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7848)) mapDefault!26462)))))

(declare-fun mapNonEmpty!26462 () Bool)

(declare-fun tp!50821 () Bool)

(declare-fun e!478850 () Bool)

(assert (=> mapNonEmpty!26462 (= mapRes!26462 (and tp!50821 e!478850))))

(declare-fun mapRest!26462 () (Array (_ BitVec 32) ValueCell!7848))

(declare-fun mapValue!26462 () ValueCell!7848)

(declare-fun mapKey!26462 () (_ BitVec 32))

(assert (=> mapNonEmpty!26462 (= (arr!23697 _values!688) (store mapRest!26462 mapKey!26462 mapValue!26462))))

(declare-fun b!859245 () Bool)

(declare-fun tp_is_empty!16575 () Bool)

(assert (=> b!859245 (= e!478852 tp_is_empty!16575)))

(declare-fun b!859246 () Bool)

(declare-fun e!478845 () Bool)

(assert (=> b!859246 (= e!478845 true)))

(declare-datatypes ((List!16815 0))(
  ( (Nil!16812) (Cons!16811 (h!17942 (_ BitVec 64)) (t!23520 List!16815)) )
))
(declare-fun arrayNoDuplicates!0 (array!49330 (_ BitVec 32) List!16815) Bool)

(assert (=> b!859246 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16812)))

(declare-datatypes ((Unit!29297 0))(
  ( (Unit!29298) )
))
(declare-fun lt!387158 () Unit!29297)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49330 (_ BitVec 32) (_ BitVec 32)) Unit!29297)

(assert (=> b!859246 (= lt!387158 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859247 () Bool)

(declare-fun res!583799 () Bool)

(assert (=> b!859247 (=> (not res!583799) (not e!478847))))

(assert (=> b!859247 (= res!583799 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16812))))

(declare-fun b!859248 () Bool)

(declare-fun res!583789 () Bool)

(assert (=> b!859248 (=> (not res!583789) (not e!478847))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!859248 (= res!583789 (and (= (size!24137 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24136 _keys!868) (size!24137 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859250 () Bool)

(declare-fun res!583796 () Bool)

(assert (=> b!859250 (=> (not res!583796) (not e!478847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859250 (= res!583796 (validMask!0 mask!1196))))

(declare-fun b!859251 () Bool)

(assert (=> b!859251 (= e!478850 tp_is_empty!16575)))

(declare-fun b!859252 () Bool)

(declare-fun e!478848 () Bool)

(assert (=> b!859252 (= e!478848 e!478845)))

(declare-fun res!583797 () Bool)

(assert (=> b!859252 (=> res!583797 e!478845)))

(assert (=> b!859252 (= res!583797 (not (= (select (arr!23696 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11006 0))(
  ( (tuple2!11007 (_1!5514 (_ BitVec 64)) (_2!5514 V!27147)) )
))
(declare-datatypes ((List!16816 0))(
  ( (Nil!16813) (Cons!16812 (h!17943 tuple2!11006) (t!23521 List!16816)) )
))
(declare-datatypes ((ListLongMap!9775 0))(
  ( (ListLongMap!9776 (toList!4903 List!16816)) )
))
(declare-fun lt!387154 () ListLongMap!9775)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387155 () ListLongMap!9775)

(declare-fun +!2256 (ListLongMap!9775 tuple2!11006) ListLongMap!9775)

(declare-fun get!12485 (ValueCell!7848 V!27147) V!27147)

(declare-fun dynLambda!1095 (Int (_ BitVec 64)) V!27147)

(assert (=> b!859252 (= lt!387154 (+!2256 lt!387155 (tuple2!11007 (select (arr!23696 _keys!868) from!1053) (get!12485 (select (arr!23697 _values!688) from!1053) (dynLambda!1095 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859253 () Bool)

(declare-fun res!583793 () Bool)

(assert (=> b!859253 (=> (not res!583793) (not e!478847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49330 (_ BitVec 32)) Bool)

(assert (=> b!859253 (= res!583793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859254 () Bool)

(declare-fun e!478849 () Bool)

(assert (=> b!859254 (= e!478847 e!478849)))

(declare-fun res!583790 () Bool)

(assert (=> b!859254 (=> (not res!583790) (not e!478849))))

(assert (=> b!859254 (= res!583790 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387153 () array!49332)

(declare-fun minValue!654 () V!27147)

(declare-fun zeroValue!654 () V!27147)

(declare-fun getCurrentListMapNoExtraKeys!2882 (array!49330 array!49332 (_ BitVec 32) (_ BitVec 32) V!27147 V!27147 (_ BitVec 32) Int) ListLongMap!9775)

(assert (=> b!859254 (= lt!387154 (getCurrentListMapNoExtraKeys!2882 _keys!868 lt!387153 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27147)

(assert (=> b!859254 (= lt!387153 (array!49333 (store (arr!23697 _values!688) i!612 (ValueCellFull!7848 v!557)) (size!24137 _values!688)))))

(declare-fun lt!387160 () ListLongMap!9775)

(assert (=> b!859254 (= lt!387160 (getCurrentListMapNoExtraKeys!2882 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859255 () Bool)

(assert (=> b!859255 (= e!478849 (not e!478848))))

(declare-fun res!583791 () Bool)

(assert (=> b!859255 (=> res!583791 e!478848)))

(assert (=> b!859255 (= res!583791 (not (validKeyInArray!0 (select (arr!23696 _keys!868) from!1053))))))

(declare-fun lt!387156 () ListLongMap!9775)

(assert (=> b!859255 (= lt!387156 lt!387155)))

(declare-fun lt!387159 () ListLongMap!9775)

(assert (=> b!859255 (= lt!387155 (+!2256 lt!387159 (tuple2!11007 k0!854 v!557)))))

(assert (=> b!859255 (= lt!387156 (getCurrentListMapNoExtraKeys!2882 _keys!868 lt!387153 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859255 (= lt!387159 (getCurrentListMapNoExtraKeys!2882 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387157 () Unit!29297)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!472 (array!49330 array!49332 (_ BitVec 32) (_ BitVec 32) V!27147 V!27147 (_ BitVec 32) (_ BitVec 64) V!27147 (_ BitVec 32) Int) Unit!29297)

(assert (=> b!859255 (= lt!387157 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!472 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26462 () Bool)

(assert (=> mapIsEmpty!26462 mapRes!26462))

(declare-fun b!859249 () Bool)

(declare-fun res!583798 () Bool)

(assert (=> b!859249 (=> (not res!583798) (not e!478847))))

(assert (=> b!859249 (= res!583798 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24136 _keys!868))))))

(declare-fun res!583795 () Bool)

(assert (=> start!73524 (=> (not res!583795) (not e!478847))))

(assert (=> start!73524 (= res!583795 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24136 _keys!868))))))

(assert (=> start!73524 e!478847))

(assert (=> start!73524 tp_is_empty!16575))

(assert (=> start!73524 true))

(assert (=> start!73524 tp!50820))

(declare-fun array_inv!18760 (array!49330) Bool)

(assert (=> start!73524 (array_inv!18760 _keys!868)))

(declare-fun array_inv!18761 (array!49332) Bool)

(assert (=> start!73524 (and (array_inv!18761 _values!688) e!478851)))

(assert (= (and start!73524 res!583795) b!859250))

(assert (= (and b!859250 res!583796) b!859248))

(assert (= (and b!859248 res!583789) b!859253))

(assert (= (and b!859253 res!583793) b!859247))

(assert (= (and b!859247 res!583799) b!859249))

(assert (= (and b!859249 res!583798) b!859243))

(assert (= (and b!859243 res!583794) b!859242))

(assert (= (and b!859242 res!583792) b!859254))

(assert (= (and b!859254 res!583790) b!859255))

(assert (= (and b!859255 (not res!583791)) b!859252))

(assert (= (and b!859252 (not res!583797)) b!859246))

(assert (= (and b!859244 condMapEmpty!26462) mapIsEmpty!26462))

(assert (= (and b!859244 (not condMapEmpty!26462)) mapNonEmpty!26462))

(get-info :version)

(assert (= (and mapNonEmpty!26462 ((_ is ValueCellFull!7848) mapValue!26462)) b!859251))

(assert (= (and b!859244 ((_ is ValueCellFull!7848) mapDefault!26462)) b!859245))

(assert (= start!73524 b!859244))

(declare-fun b_lambda!11791 () Bool)

(assert (=> (not b_lambda!11791) (not b!859252)))

(declare-fun t!23519 () Bool)

(declare-fun tb!4561 () Bool)

(assert (=> (and start!73524 (= defaultEntry!696 defaultEntry!696) t!23519) tb!4561))

(declare-fun result!8733 () Bool)

(assert (=> tb!4561 (= result!8733 tp_is_empty!16575)))

(assert (=> b!859252 t!23519))

(declare-fun b_and!23859 () Bool)

(assert (= b_and!23857 (and (=> t!23519 result!8733) b_and!23859)))

(declare-fun m!799989 () Bool)

(assert (=> b!859255 m!799989))

(declare-fun m!799991 () Bool)

(assert (=> b!859255 m!799991))

(declare-fun m!799993 () Bool)

(assert (=> b!859255 m!799993))

(assert (=> b!859255 m!799991))

(declare-fun m!799995 () Bool)

(assert (=> b!859255 m!799995))

(declare-fun m!799997 () Bool)

(assert (=> b!859255 m!799997))

(declare-fun m!799999 () Bool)

(assert (=> b!859255 m!799999))

(declare-fun m!800001 () Bool)

(assert (=> b!859250 m!800001))

(declare-fun m!800003 () Bool)

(assert (=> b!859252 m!800003))

(declare-fun m!800005 () Bool)

(assert (=> b!859252 m!800005))

(declare-fun m!800007 () Bool)

(assert (=> b!859252 m!800007))

(declare-fun m!800009 () Bool)

(assert (=> b!859252 m!800009))

(assert (=> b!859252 m!800005))

(assert (=> b!859252 m!799991))

(assert (=> b!859252 m!800007))

(declare-fun m!800011 () Bool)

(assert (=> b!859242 m!800011))

(declare-fun m!800013 () Bool)

(assert (=> b!859246 m!800013))

(declare-fun m!800015 () Bool)

(assert (=> b!859246 m!800015))

(declare-fun m!800017 () Bool)

(assert (=> mapNonEmpty!26462 m!800017))

(declare-fun m!800019 () Bool)

(assert (=> b!859247 m!800019))

(declare-fun m!800021 () Bool)

(assert (=> b!859254 m!800021))

(declare-fun m!800023 () Bool)

(assert (=> b!859254 m!800023))

(declare-fun m!800025 () Bool)

(assert (=> b!859254 m!800025))

(declare-fun m!800027 () Bool)

(assert (=> start!73524 m!800027))

(declare-fun m!800029 () Bool)

(assert (=> start!73524 m!800029))

(declare-fun m!800031 () Bool)

(assert (=> b!859253 m!800031))

(declare-fun m!800033 () Bool)

(assert (=> b!859243 m!800033))

(check-sat (not b!859243) (not b!859246) (not b_next!14439) (not b!859250) (not b_lambda!11791) b_and!23859 (not mapNonEmpty!26462) tp_is_empty!16575 (not b!859252) (not start!73524) (not b!859254) (not b!859253) (not b!859255) (not b!859247))
(check-sat b_and!23859 (not b_next!14439))
