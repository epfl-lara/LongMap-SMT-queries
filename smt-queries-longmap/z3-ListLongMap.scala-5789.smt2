; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74844 () Bool)

(assert start!74844)

(declare-fun b_free!15325 () Bool)

(declare-fun b_next!15325 () Bool)

(assert (=> start!74844 (= b_free!15325 (not b_next!15325))))

(declare-fun tp!53663 () Bool)

(declare-fun b_and!25279 () Bool)

(assert (=> start!74844 (= tp!53663 b_and!25279)))

(declare-fun b!881072 () Bool)

(declare-fun e!490398 () Bool)

(declare-fun e!490395 () Bool)

(declare-fun mapRes!27975 () Bool)

(assert (=> b!881072 (= e!490398 (and e!490395 mapRes!27975))))

(declare-fun condMapEmpty!27975 () Bool)

(declare-datatypes ((V!28473 0))(
  ( (V!28474 (val!8832 Int)) )
))
(declare-datatypes ((ValueCell!8345 0))(
  ( (ValueCellFull!8345 (v!11280 V!28473)) (EmptyCell!8345) )
))
(declare-datatypes ((array!51299 0))(
  ( (array!51300 (arr!24669 (Array (_ BitVec 32) ValueCell!8345)) (size!25110 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51299)

(declare-fun mapDefault!27975 () ValueCell!8345)

(assert (=> b!881072 (= condMapEmpty!27975 (= (arr!24669 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8345)) mapDefault!27975)))))

(declare-fun mapNonEmpty!27975 () Bool)

(declare-fun tp!53664 () Bool)

(declare-fun e!490394 () Bool)

(assert (=> mapNonEmpty!27975 (= mapRes!27975 (and tp!53664 e!490394))))

(declare-fun mapValue!27975 () ValueCell!8345)

(declare-fun mapKey!27975 () (_ BitVec 32))

(declare-fun mapRest!27975 () (Array (_ BitVec 32) ValueCell!8345))

(assert (=> mapNonEmpty!27975 (= (arr!24669 _values!688) (store mapRest!27975 mapKey!27975 mapValue!27975))))

(declare-fun b!881073 () Bool)

(declare-fun res!598319 () Bool)

(declare-fun e!490393 () Bool)

(assert (=> b!881073 (=> (not res!598319) (not e!490393))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51301 0))(
  ( (array!51302 (arr!24670 (Array (_ BitVec 32) (_ BitVec 64))) (size!25111 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51301)

(assert (=> b!881073 (= res!598319 (and (= (size!25110 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25111 _keys!868) (size!25110 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27975 () Bool)

(assert (=> mapIsEmpty!27975 mapRes!27975))

(declare-fun b!881074 () Bool)

(declare-fun tp_is_empty!17569 () Bool)

(assert (=> b!881074 (= e!490395 tp_is_empty!17569)))

(declare-fun b!881075 () Bool)

(declare-fun e!490396 () Bool)

(assert (=> b!881075 (= e!490393 e!490396)))

(declare-fun res!598318 () Bool)

(assert (=> b!881075 (=> (not res!598318) (not e!490396))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881075 (= res!598318 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28473)

(declare-fun zeroValue!654 () V!28473)

(declare-datatypes ((tuple2!11624 0))(
  ( (tuple2!11625 (_1!5823 (_ BitVec 64)) (_2!5823 V!28473)) )
))
(declare-datatypes ((List!17455 0))(
  ( (Nil!17452) (Cons!17451 (h!18588 tuple2!11624) (t!24574 List!17455)) )
))
(declare-datatypes ((ListLongMap!10395 0))(
  ( (ListLongMap!10396 (toList!5213 List!17455)) )
))
(declare-fun lt!398341 () ListLongMap!10395)

(declare-fun lt!398343 () array!51299)

(declare-fun getCurrentListMapNoExtraKeys!3255 (array!51301 array!51299 (_ BitVec 32) (_ BitVec 32) V!28473 V!28473 (_ BitVec 32) Int) ListLongMap!10395)

(assert (=> b!881075 (= lt!398341 (getCurrentListMapNoExtraKeys!3255 _keys!868 lt!398343 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28473)

(assert (=> b!881075 (= lt!398343 (array!51300 (store (arr!24669 _values!688) i!612 (ValueCellFull!8345 v!557)) (size!25110 _values!688)))))

(declare-fun lt!398340 () ListLongMap!10395)

(assert (=> b!881075 (= lt!398340 (getCurrentListMapNoExtraKeys!3255 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!598323 () Bool)

(assert (=> start!74844 (=> (not res!598323) (not e!490393))))

(assert (=> start!74844 (= res!598323 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25111 _keys!868))))))

(assert (=> start!74844 e!490393))

(assert (=> start!74844 tp_is_empty!17569))

(assert (=> start!74844 true))

(assert (=> start!74844 tp!53663))

(declare-fun array_inv!19474 (array!51301) Bool)

(assert (=> start!74844 (array_inv!19474 _keys!868)))

(declare-fun array_inv!19475 (array!51299) Bool)

(assert (=> start!74844 (and (array_inv!19475 _values!688) e!490398)))

(declare-fun b!881076 () Bool)

(declare-fun res!598325 () Bool)

(assert (=> b!881076 (=> (not res!598325) (not e!490393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51301 (_ BitVec 32)) Bool)

(assert (=> b!881076 (= res!598325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881077 () Bool)

(declare-fun res!598321 () Bool)

(assert (=> b!881077 (=> (not res!598321) (not e!490393))))

(assert (=> b!881077 (= res!598321 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25111 _keys!868))))))

(declare-fun b!881078 () Bool)

(declare-fun e!490397 () Bool)

(assert (=> b!881078 (= e!490396 (not e!490397))))

(declare-fun res!598316 () Bool)

(assert (=> b!881078 (=> res!598316 e!490397)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881078 (= res!598316 (not (validKeyInArray!0 (select (arr!24670 _keys!868) from!1053))))))

(declare-fun lt!398338 () ListLongMap!10395)

(declare-fun lt!398337 () ListLongMap!10395)

(assert (=> b!881078 (= lt!398338 lt!398337)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!398342 () ListLongMap!10395)

(declare-fun +!2529 (ListLongMap!10395 tuple2!11624) ListLongMap!10395)

(assert (=> b!881078 (= lt!398337 (+!2529 lt!398342 (tuple2!11625 k0!854 v!557)))))

(assert (=> b!881078 (= lt!398338 (getCurrentListMapNoExtraKeys!3255 _keys!868 lt!398343 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881078 (= lt!398342 (getCurrentListMapNoExtraKeys!3255 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30028 0))(
  ( (Unit!30029) )
))
(declare-fun lt!398339 () Unit!30028)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 (array!51301 array!51299 (_ BitVec 32) (_ BitVec 32) V!28473 V!28473 (_ BitVec 32) (_ BitVec 64) V!28473 (_ BitVec 32) Int) Unit!30028)

(assert (=> b!881078 (= lt!398339 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881079 () Bool)

(assert (=> b!881079 (= e!490397 true)))

(declare-fun get!12991 (ValueCell!8345 V!28473) V!28473)

(declare-fun dynLambda!1254 (Int (_ BitVec 64)) V!28473)

(assert (=> b!881079 (= lt!398341 (+!2529 lt!398337 (tuple2!11625 (select (arr!24670 _keys!868) from!1053) (get!12991 (select (arr!24669 _values!688) from!1053) (dynLambda!1254 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881080 () Bool)

(declare-fun res!598317 () Bool)

(assert (=> b!881080 (=> (not res!598317) (not e!490393))))

(declare-datatypes ((List!17456 0))(
  ( (Nil!17453) (Cons!17452 (h!18589 (_ BitVec 64)) (t!24575 List!17456)) )
))
(declare-fun arrayNoDuplicates!0 (array!51301 (_ BitVec 32) List!17456) Bool)

(assert (=> b!881080 (= res!598317 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17453))))

(declare-fun b!881081 () Bool)

(declare-fun res!598320 () Bool)

(assert (=> b!881081 (=> (not res!598320) (not e!490393))))

(assert (=> b!881081 (= res!598320 (and (= (select (arr!24670 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881082 () Bool)

(declare-fun res!598322 () Bool)

(assert (=> b!881082 (=> (not res!598322) (not e!490393))))

(assert (=> b!881082 (= res!598322 (validKeyInArray!0 k0!854))))

(declare-fun b!881083 () Bool)

(assert (=> b!881083 (= e!490394 tp_is_empty!17569)))

(declare-fun b!881084 () Bool)

(declare-fun res!598324 () Bool)

(assert (=> b!881084 (=> (not res!598324) (not e!490393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881084 (= res!598324 (validMask!0 mask!1196))))

(assert (= (and start!74844 res!598323) b!881084))

(assert (= (and b!881084 res!598324) b!881073))

(assert (= (and b!881073 res!598319) b!881076))

(assert (= (and b!881076 res!598325) b!881080))

(assert (= (and b!881080 res!598317) b!881077))

(assert (= (and b!881077 res!598321) b!881082))

(assert (= (and b!881082 res!598322) b!881081))

(assert (= (and b!881081 res!598320) b!881075))

(assert (= (and b!881075 res!598318) b!881078))

(assert (= (and b!881078 (not res!598316)) b!881079))

(assert (= (and b!881072 condMapEmpty!27975) mapIsEmpty!27975))

(assert (= (and b!881072 (not condMapEmpty!27975)) mapNonEmpty!27975))

(get-info :version)

(assert (= (and mapNonEmpty!27975 ((_ is ValueCellFull!8345) mapValue!27975)) b!881083))

(assert (= (and b!881072 ((_ is ValueCellFull!8345) mapDefault!27975)) b!881074))

(assert (= start!74844 b!881072))

(declare-fun b_lambda!12447 () Bool)

(assert (=> (not b_lambda!12447) (not b!881079)))

(declare-fun t!24573 () Bool)

(declare-fun tb!4975 () Bool)

(assert (=> (and start!74844 (= defaultEntry!696 defaultEntry!696) t!24573) tb!4975))

(declare-fun result!9583 () Bool)

(assert (=> tb!4975 (= result!9583 tp_is_empty!17569)))

(assert (=> b!881079 t!24573))

(declare-fun b_and!25281 () Bool)

(assert (= b_and!25279 (and (=> t!24573 result!9583) b_and!25281)))

(declare-fun m!821231 () Bool)

(assert (=> b!881080 m!821231))

(declare-fun m!821233 () Bool)

(assert (=> b!881078 m!821233))

(declare-fun m!821235 () Bool)

(assert (=> b!881078 m!821235))

(declare-fun m!821237 () Bool)

(assert (=> b!881078 m!821237))

(declare-fun m!821239 () Bool)

(assert (=> b!881078 m!821239))

(assert (=> b!881078 m!821237))

(declare-fun m!821241 () Bool)

(assert (=> b!881078 m!821241))

(declare-fun m!821243 () Bool)

(assert (=> b!881078 m!821243))

(declare-fun m!821245 () Bool)

(assert (=> b!881081 m!821245))

(declare-fun m!821247 () Bool)

(assert (=> b!881084 m!821247))

(declare-fun m!821249 () Bool)

(assert (=> b!881079 m!821249))

(declare-fun m!821251 () Bool)

(assert (=> b!881079 m!821251))

(declare-fun m!821253 () Bool)

(assert (=> b!881079 m!821253))

(declare-fun m!821255 () Bool)

(assert (=> b!881079 m!821255))

(assert (=> b!881079 m!821251))

(assert (=> b!881079 m!821237))

(assert (=> b!881079 m!821253))

(declare-fun m!821257 () Bool)

(assert (=> b!881075 m!821257))

(declare-fun m!821259 () Bool)

(assert (=> b!881075 m!821259))

(declare-fun m!821261 () Bool)

(assert (=> b!881075 m!821261))

(declare-fun m!821263 () Bool)

(assert (=> start!74844 m!821263))

(declare-fun m!821265 () Bool)

(assert (=> start!74844 m!821265))

(declare-fun m!821267 () Bool)

(assert (=> b!881076 m!821267))

(declare-fun m!821269 () Bool)

(assert (=> b!881082 m!821269))

(declare-fun m!821271 () Bool)

(assert (=> mapNonEmpty!27975 m!821271))

(check-sat (not b_lambda!12447) (not start!74844) (not b!881075) b_and!25281 (not b!881080) (not b!881078) (not b_next!15325) (not b!881079) tp_is_empty!17569 (not mapNonEmpty!27975) (not b!881084) (not b!881076) (not b!881082))
(check-sat b_and!25281 (not b_next!15325))
