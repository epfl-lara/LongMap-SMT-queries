; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74188 () Bool)

(assert start!74188)

(declare-fun b_free!14935 () Bool)

(declare-fun b_next!14935 () Bool)

(assert (=> start!74188 (= b_free!14935 (not b_next!14935))))

(declare-fun tp!52309 () Bool)

(declare-fun b_and!24697 () Bool)

(assert (=> start!74188 (= tp!52309 b_and!24697)))

(declare-fun b!871386 () Bool)

(declare-fun e!485294 () Bool)

(declare-fun tp_is_empty!17071 () Bool)

(assert (=> b!871386 (= e!485294 tp_is_empty!17071)))

(declare-fun b!871387 () Bool)

(declare-fun res!591985 () Bool)

(declare-fun e!485298 () Bool)

(assert (=> b!871387 (=> (not res!591985) (not e!485298))))

(declare-datatypes ((array!50345 0))(
  ( (array!50346 (arr!24199 (Array (_ BitVec 32) (_ BitVec 64))) (size!24640 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50345)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50345 (_ BitVec 32)) Bool)

(assert (=> b!871387 (= res!591985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27206 () Bool)

(declare-fun mapRes!27206 () Bool)

(declare-fun tp!52310 () Bool)

(assert (=> mapNonEmpty!27206 (= mapRes!27206 (and tp!52310 e!485294))))

(declare-datatypes ((V!27809 0))(
  ( (V!27810 (val!8583 Int)) )
))
(declare-datatypes ((ValueCell!8096 0))(
  ( (ValueCellFull!8096 (v!11008 V!27809)) (EmptyCell!8096) )
))
(declare-fun mapValue!27206 () ValueCell!8096)

(declare-fun mapKey!27206 () (_ BitVec 32))

(declare-fun mapRest!27206 () (Array (_ BitVec 32) ValueCell!8096))

(declare-datatypes ((array!50347 0))(
  ( (array!50348 (arr!24200 (Array (_ BitVec 32) ValueCell!8096)) (size!24641 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50347)

(assert (=> mapNonEmpty!27206 (= (arr!24200 _values!688) (store mapRest!27206 mapKey!27206 mapValue!27206))))

(declare-fun b!871388 () Bool)

(declare-fun res!591987 () Bool)

(assert (=> b!871388 (=> (not res!591987) (not e!485298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871388 (= res!591987 (validMask!0 mask!1196))))

(declare-fun b!871389 () Bool)

(declare-fun res!591981 () Bool)

(assert (=> b!871389 (=> (not res!591981) (not e!485298))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871389 (= res!591981 (and (= (size!24641 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24640 _keys!868) (size!24641 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!591980 () Bool)

(assert (=> start!74188 (=> (not res!591980) (not e!485298))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74188 (= res!591980 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24640 _keys!868))))))

(assert (=> start!74188 e!485298))

(assert (=> start!74188 tp_is_empty!17071))

(assert (=> start!74188 true))

(assert (=> start!74188 tp!52309))

(declare-fun array_inv!19166 (array!50345) Bool)

(assert (=> start!74188 (array_inv!19166 _keys!868)))

(declare-fun e!485299 () Bool)

(declare-fun array_inv!19167 (array!50347) Bool)

(assert (=> start!74188 (and (array_inv!19167 _values!688) e!485299)))

(declare-fun b!871390 () Bool)

(declare-fun res!591986 () Bool)

(assert (=> b!871390 (=> (not res!591986) (not e!485298))))

(declare-datatypes ((List!17153 0))(
  ( (Nil!17150) (Cons!17149 (h!18286 (_ BitVec 64)) (t!24182 List!17153)) )
))
(declare-fun arrayNoDuplicates!0 (array!50345 (_ BitVec 32) List!17153) Bool)

(assert (=> b!871390 (= res!591986 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17150))))

(declare-fun b!871391 () Bool)

(declare-fun e!485297 () Bool)

(assert (=> b!871391 (= e!485299 (and e!485297 mapRes!27206))))

(declare-fun condMapEmpty!27206 () Bool)

(declare-fun mapDefault!27206 () ValueCell!8096)

(assert (=> b!871391 (= condMapEmpty!27206 (= (arr!24200 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8096)) mapDefault!27206)))))

(declare-fun mapIsEmpty!27206 () Bool)

(assert (=> mapIsEmpty!27206 mapRes!27206))

(declare-fun b!871392 () Bool)

(declare-fun e!485295 () Bool)

(assert (=> b!871392 (= e!485295 (not true))))

(declare-fun v!557 () V!27809)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395512 () array!50347)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27809)

(declare-fun zeroValue!654 () V!27809)

(declare-datatypes ((tuple2!11336 0))(
  ( (tuple2!11337 (_1!5679 (_ BitVec 64)) (_2!5679 V!27809)) )
))
(declare-datatypes ((List!17154 0))(
  ( (Nil!17151) (Cons!17150 (h!18287 tuple2!11336) (t!24183 List!17154)) )
))
(declare-datatypes ((ListLongMap!10107 0))(
  ( (ListLongMap!10108 (toList!5069 List!17154)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3113 (array!50345 array!50347 (_ BitVec 32) (_ BitVec 32) V!27809 V!27809 (_ BitVec 32) Int) ListLongMap!10107)

(declare-fun +!2461 (ListLongMap!10107 tuple2!11336) ListLongMap!10107)

(assert (=> b!871392 (= (getCurrentListMapNoExtraKeys!3113 _keys!868 lt!395512 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2461 (getCurrentListMapNoExtraKeys!3113 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11337 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29872 0))(
  ( (Unit!29873) )
))
(declare-fun lt!395513 () Unit!29872)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!632 (array!50345 array!50347 (_ BitVec 32) (_ BitVec 32) V!27809 V!27809 (_ BitVec 32) (_ BitVec 64) V!27809 (_ BitVec 32) Int) Unit!29872)

(assert (=> b!871392 (= lt!395513 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!632 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871393 () Bool)

(declare-fun res!591984 () Bool)

(assert (=> b!871393 (=> (not res!591984) (not e!485298))))

(assert (=> b!871393 (= res!591984 (and (= (select (arr!24199 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871394 () Bool)

(declare-fun res!591983 () Bool)

(assert (=> b!871394 (=> (not res!591983) (not e!485298))))

(assert (=> b!871394 (= res!591983 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24640 _keys!868))))))

(declare-fun b!871395 () Bool)

(assert (=> b!871395 (= e!485297 tp_is_empty!17071)))

(declare-fun b!871396 () Bool)

(assert (=> b!871396 (= e!485298 e!485295)))

(declare-fun res!591988 () Bool)

(assert (=> b!871396 (=> (not res!591988) (not e!485295))))

(assert (=> b!871396 (= res!591988 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395510 () ListLongMap!10107)

(assert (=> b!871396 (= lt!395510 (getCurrentListMapNoExtraKeys!3113 _keys!868 lt!395512 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871396 (= lt!395512 (array!50348 (store (arr!24200 _values!688) i!612 (ValueCellFull!8096 v!557)) (size!24641 _values!688)))))

(declare-fun lt!395511 () ListLongMap!10107)

(assert (=> b!871396 (= lt!395511 (getCurrentListMapNoExtraKeys!3113 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871397 () Bool)

(declare-fun res!591982 () Bool)

(assert (=> b!871397 (=> (not res!591982) (not e!485298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871397 (= res!591982 (validKeyInArray!0 k0!854))))

(assert (= (and start!74188 res!591980) b!871388))

(assert (= (and b!871388 res!591987) b!871389))

(assert (= (and b!871389 res!591981) b!871387))

(assert (= (and b!871387 res!591985) b!871390))

(assert (= (and b!871390 res!591986) b!871394))

(assert (= (and b!871394 res!591983) b!871397))

(assert (= (and b!871397 res!591982) b!871393))

(assert (= (and b!871393 res!591984) b!871396))

(assert (= (and b!871396 res!591988) b!871392))

(assert (= (and b!871391 condMapEmpty!27206) mapIsEmpty!27206))

(assert (= (and b!871391 (not condMapEmpty!27206)) mapNonEmpty!27206))

(get-info :version)

(assert (= (and mapNonEmpty!27206 ((_ is ValueCellFull!8096) mapValue!27206)) b!871386))

(assert (= (and b!871391 ((_ is ValueCellFull!8096) mapDefault!27206)) b!871395))

(assert (= start!74188 b!871391))

(declare-fun m!813137 () Bool)

(assert (=> b!871388 m!813137))

(declare-fun m!813139 () Bool)

(assert (=> b!871396 m!813139))

(declare-fun m!813141 () Bool)

(assert (=> b!871396 m!813141))

(declare-fun m!813143 () Bool)

(assert (=> b!871396 m!813143))

(declare-fun m!813145 () Bool)

(assert (=> b!871387 m!813145))

(declare-fun m!813147 () Bool)

(assert (=> b!871397 m!813147))

(declare-fun m!813149 () Bool)

(assert (=> b!871393 m!813149))

(declare-fun m!813151 () Bool)

(assert (=> start!74188 m!813151))

(declare-fun m!813153 () Bool)

(assert (=> start!74188 m!813153))

(declare-fun m!813155 () Bool)

(assert (=> b!871392 m!813155))

(declare-fun m!813157 () Bool)

(assert (=> b!871392 m!813157))

(assert (=> b!871392 m!813157))

(declare-fun m!813159 () Bool)

(assert (=> b!871392 m!813159))

(declare-fun m!813161 () Bool)

(assert (=> b!871392 m!813161))

(declare-fun m!813163 () Bool)

(assert (=> mapNonEmpty!27206 m!813163))

(declare-fun m!813165 () Bool)

(assert (=> b!871390 m!813165))

(check-sat (not b!871388) tp_is_empty!17071 (not b!871392) (not b!871396) b_and!24697 (not b_next!14935) (not b!871390) (not start!74188) (not b!871387) (not b!871397) (not mapNonEmpty!27206))
(check-sat b_and!24697 (not b_next!14935))
