; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73642 () Bool)

(assert start!73642)

(declare-fun b_free!14389 () Bool)

(declare-fun b_next!14389 () Bool)

(assert (=> start!73642 (= b_free!14389 (not b_next!14389))))

(declare-fun tp!50671 () Bool)

(declare-fun b_and!23767 () Bool)

(assert (=> start!73642 (= tp!50671 b_and!23767)))

(declare-fun b!859070 () Bool)

(declare-fun res!583333 () Bool)

(declare-fun e!478852 () Bool)

(assert (=> b!859070 (=> (not res!583333) (not e!478852))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49281 0))(
  ( (array!49282 (arr!23667 (Array (_ BitVec 32) (_ BitVec 64))) (size!24108 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49281)

(assert (=> b!859070 (= res!583333 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24108 _keys!868))))))

(declare-fun b!859071 () Bool)

(declare-fun res!583340 () Bool)

(assert (=> b!859071 (=> (not res!583340) (not e!478852))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27081 0))(
  ( (V!27082 (val!8310 Int)) )
))
(declare-datatypes ((ValueCell!7823 0))(
  ( (ValueCellFull!7823 (v!10735 V!27081)) (EmptyCell!7823) )
))
(declare-datatypes ((array!49283 0))(
  ( (array!49284 (arr!23668 (Array (_ BitVec 32) ValueCell!7823)) (size!24109 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49283)

(assert (=> b!859071 (= res!583340 (and (= (size!24109 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24108 _keys!868) (size!24109 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859072 () Bool)

(declare-fun res!583341 () Bool)

(assert (=> b!859072 (=> (not res!583341) (not e!478852))))

(declare-datatypes ((List!16731 0))(
  ( (Nil!16728) (Cons!16727 (h!17864 (_ BitVec 64)) (t!23378 List!16731)) )
))
(declare-fun arrayNoDuplicates!0 (array!49281 (_ BitVec 32) List!16731) Bool)

(assert (=> b!859072 (= res!583341 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16728))))

(declare-fun mapIsEmpty!26387 () Bool)

(declare-fun mapRes!26387 () Bool)

(assert (=> mapIsEmpty!26387 mapRes!26387))

(declare-fun b!859073 () Bool)

(declare-fun e!478858 () Bool)

(declare-fun tp_is_empty!16525 () Bool)

(assert (=> b!859073 (= e!478858 tp_is_empty!16525)))

(declare-fun b!859074 () Bool)

(declare-fun e!478857 () Bool)

(assert (=> b!859074 (= e!478857 true)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10892 0))(
  ( (tuple2!10893 (_1!5457 (_ BitVec 64)) (_2!5457 V!27081)) )
))
(declare-datatypes ((List!16732 0))(
  ( (Nil!16729) (Cons!16728 (h!17865 tuple2!10892) (t!23379 List!16732)) )
))
(declare-datatypes ((ListLongMap!9663 0))(
  ( (ListLongMap!9664 (toList!4847 List!16732)) )
))
(declare-fun lt!386941 () ListLongMap!9663)

(declare-fun lt!386943 () ListLongMap!9663)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun +!2254 (ListLongMap!9663 tuple2!10892) ListLongMap!9663)

(declare-fun get!12468 (ValueCell!7823 V!27081) V!27081)

(declare-fun dynLambda!1088 (Int (_ BitVec 64)) V!27081)

(assert (=> b!859074 (= lt!386943 (+!2254 lt!386941 (tuple2!10893 (select (arr!23667 _keys!868) from!1053) (get!12468 (select (arr!23668 _values!688) from!1053) (dynLambda!1088 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859075 () Bool)

(declare-fun res!583336 () Bool)

(assert (=> b!859075 (=> (not res!583336) (not e!478852))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859075 (= res!583336 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26387 () Bool)

(declare-fun tp!50672 () Bool)

(declare-fun e!478853 () Bool)

(assert (=> mapNonEmpty!26387 (= mapRes!26387 (and tp!50672 e!478853))))

(declare-fun mapKey!26387 () (_ BitVec 32))

(declare-fun mapValue!26387 () ValueCell!7823)

(declare-fun mapRest!26387 () (Array (_ BitVec 32) ValueCell!7823))

(assert (=> mapNonEmpty!26387 (= (arr!23668 _values!688) (store mapRest!26387 mapKey!26387 mapValue!26387))))

(declare-fun b!859076 () Bool)

(declare-fun res!583337 () Bool)

(assert (=> b!859076 (=> (not res!583337) (not e!478852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859076 (= res!583337 (validMask!0 mask!1196))))

(declare-fun b!859077 () Bool)

(declare-fun res!583338 () Bool)

(assert (=> b!859077 (=> (not res!583338) (not e!478852))))

(assert (=> b!859077 (= res!583338 (and (= (select (arr!23667 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859078 () Bool)

(declare-fun e!478854 () Bool)

(assert (=> b!859078 (= e!478852 e!478854)))

(declare-fun res!583334 () Bool)

(assert (=> b!859078 (=> (not res!583334) (not e!478854))))

(assert (=> b!859078 (= res!583334 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386939 () array!49283)

(declare-fun minValue!654 () V!27081)

(declare-fun zeroValue!654 () V!27081)

(declare-fun getCurrentListMapNoExtraKeys!2903 (array!49281 array!49283 (_ BitVec 32) (_ BitVec 32) V!27081 V!27081 (_ BitVec 32) Int) ListLongMap!9663)

(assert (=> b!859078 (= lt!386943 (getCurrentListMapNoExtraKeys!2903 _keys!868 lt!386939 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27081)

(assert (=> b!859078 (= lt!386939 (array!49284 (store (arr!23668 _values!688) i!612 (ValueCellFull!7823 v!557)) (size!24109 _values!688)))))

(declare-fun lt!386940 () ListLongMap!9663)

(assert (=> b!859078 (= lt!386940 (getCurrentListMapNoExtraKeys!2903 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859079 () Bool)

(declare-fun res!583335 () Bool)

(assert (=> b!859079 (=> (not res!583335) (not e!478852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49281 (_ BitVec 32)) Bool)

(assert (=> b!859079 (= res!583335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859080 () Bool)

(declare-fun e!478856 () Bool)

(assert (=> b!859080 (= e!478856 (and e!478858 mapRes!26387))))

(declare-fun condMapEmpty!26387 () Bool)

(declare-fun mapDefault!26387 () ValueCell!7823)

(assert (=> b!859080 (= condMapEmpty!26387 (= (arr!23668 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7823)) mapDefault!26387)))))

(declare-fun res!583339 () Bool)

(assert (=> start!73642 (=> (not res!583339) (not e!478852))))

(assert (=> start!73642 (= res!583339 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24108 _keys!868))))))

(assert (=> start!73642 e!478852))

(assert (=> start!73642 tp_is_empty!16525))

(assert (=> start!73642 true))

(assert (=> start!73642 tp!50671))

(declare-fun array_inv!18794 (array!49281) Bool)

(assert (=> start!73642 (array_inv!18794 _keys!868)))

(declare-fun array_inv!18795 (array!49283) Bool)

(assert (=> start!73642 (and (array_inv!18795 _values!688) e!478856)))

(declare-fun b!859081 () Bool)

(assert (=> b!859081 (= e!478854 (not e!478857))))

(declare-fun res!583342 () Bool)

(assert (=> b!859081 (=> res!583342 e!478857)))

(assert (=> b!859081 (= res!583342 (not (validKeyInArray!0 (select (arr!23667 _keys!868) from!1053))))))

(declare-fun lt!386944 () ListLongMap!9663)

(assert (=> b!859081 (= lt!386944 lt!386941)))

(declare-fun lt!386945 () ListLongMap!9663)

(assert (=> b!859081 (= lt!386941 (+!2254 lt!386945 (tuple2!10893 k0!854 v!557)))))

(assert (=> b!859081 (= lt!386944 (getCurrentListMapNoExtraKeys!2903 _keys!868 lt!386939 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859081 (= lt!386945 (getCurrentListMapNoExtraKeys!2903 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29262 0))(
  ( (Unit!29263) )
))
(declare-fun lt!386942 () Unit!29262)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 (array!49281 array!49283 (_ BitVec 32) (_ BitVec 32) V!27081 V!27081 (_ BitVec 32) (_ BitVec 64) V!27081 (_ BitVec 32) Int) Unit!29262)

(assert (=> b!859081 (= lt!386942 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859082 () Bool)

(assert (=> b!859082 (= e!478853 tp_is_empty!16525)))

(assert (= (and start!73642 res!583339) b!859076))

(assert (= (and b!859076 res!583337) b!859071))

(assert (= (and b!859071 res!583340) b!859079))

(assert (= (and b!859079 res!583335) b!859072))

(assert (= (and b!859072 res!583341) b!859070))

(assert (= (and b!859070 res!583333) b!859075))

(assert (= (and b!859075 res!583336) b!859077))

(assert (= (and b!859077 res!583338) b!859078))

(assert (= (and b!859078 res!583334) b!859081))

(assert (= (and b!859081 (not res!583342)) b!859074))

(assert (= (and b!859080 condMapEmpty!26387) mapIsEmpty!26387))

(assert (= (and b!859080 (not condMapEmpty!26387)) mapNonEmpty!26387))

(get-info :version)

(assert (= (and mapNonEmpty!26387 ((_ is ValueCellFull!7823) mapValue!26387)) b!859082))

(assert (= (and b!859080 ((_ is ValueCellFull!7823) mapDefault!26387)) b!859073))

(assert (= start!73642 b!859080))

(declare-fun b_lambda!11755 () Bool)

(assert (=> (not b_lambda!11755) (not b!859074)))

(declare-fun t!23377 () Bool)

(declare-fun tb!4503 () Bool)

(assert (=> (and start!73642 (= defaultEntry!696 defaultEntry!696) t!23377) tb!4503))

(declare-fun result!8625 () Bool)

(assert (=> tb!4503 (= result!8625 tp_is_empty!16525)))

(assert (=> b!859074 t!23377))

(declare-fun b_and!23769 () Bool)

(assert (= b_and!23767 (and (=> t!23377 result!8625) b_and!23769)))

(declare-fun m!800165 () Bool)

(assert (=> b!859076 m!800165))

(declare-fun m!800167 () Bool)

(assert (=> b!859077 m!800167))

(declare-fun m!800169 () Bool)

(assert (=> mapNonEmpty!26387 m!800169))

(declare-fun m!800171 () Bool)

(assert (=> b!859078 m!800171))

(declare-fun m!800173 () Bool)

(assert (=> b!859078 m!800173))

(declare-fun m!800175 () Bool)

(assert (=> b!859078 m!800175))

(declare-fun m!800177 () Bool)

(assert (=> b!859079 m!800177))

(declare-fun m!800179 () Bool)

(assert (=> b!859081 m!800179))

(declare-fun m!800181 () Bool)

(assert (=> b!859081 m!800181))

(declare-fun m!800183 () Bool)

(assert (=> b!859081 m!800183))

(assert (=> b!859081 m!800181))

(declare-fun m!800185 () Bool)

(assert (=> b!859081 m!800185))

(declare-fun m!800187 () Bool)

(assert (=> b!859081 m!800187))

(declare-fun m!800189 () Bool)

(assert (=> b!859081 m!800189))

(declare-fun m!800191 () Bool)

(assert (=> b!859075 m!800191))

(declare-fun m!800193 () Bool)

(assert (=> b!859074 m!800193))

(declare-fun m!800195 () Bool)

(assert (=> b!859074 m!800195))

(declare-fun m!800197 () Bool)

(assert (=> b!859074 m!800197))

(declare-fun m!800199 () Bool)

(assert (=> b!859074 m!800199))

(assert (=> b!859074 m!800195))

(assert (=> b!859074 m!800181))

(assert (=> b!859074 m!800197))

(declare-fun m!800201 () Bool)

(assert (=> b!859072 m!800201))

(declare-fun m!800203 () Bool)

(assert (=> start!73642 m!800203))

(declare-fun m!800205 () Bool)

(assert (=> start!73642 m!800205))

(check-sat (not b!859072) (not b!859078) (not b!859076) (not start!73642) tp_is_empty!16525 b_and!23769 (not b!859074) (not mapNonEmpty!26387) (not b!859081) (not b_next!14389) (not b!859079) (not b!859075) (not b_lambda!11755))
(check-sat b_and!23769 (not b_next!14389))
