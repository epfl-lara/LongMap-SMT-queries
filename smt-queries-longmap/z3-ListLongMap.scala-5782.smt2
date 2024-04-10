; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74596 () Bool)

(assert start!74596)

(declare-fun b_free!15285 () Bool)

(declare-fun b_next!15285 () Bool)

(assert (=> start!74596 (= b_free!15285 (not b_next!15285))))

(declare-fun tp!53536 () Bool)

(declare-fun b_and!25161 () Bool)

(assert (=> start!74596 (= tp!53536 b_and!25161)))

(declare-fun b!879093 () Bool)

(declare-fun e!489227 () Bool)

(declare-fun e!489232 () Bool)

(declare-fun mapRes!27909 () Bool)

(assert (=> b!879093 (= e!489227 (and e!489232 mapRes!27909))))

(declare-fun condMapEmpty!27909 () Bool)

(declare-datatypes ((V!28419 0))(
  ( (V!28420 (val!8812 Int)) )
))
(declare-datatypes ((ValueCell!8325 0))(
  ( (ValueCellFull!8325 (v!11252 V!28419)) (EmptyCell!8325) )
))
(declare-datatypes ((array!51184 0))(
  ( (array!51185 (arr!24618 (Array (_ BitVec 32) ValueCell!8325)) (size!25058 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51184)

(declare-fun mapDefault!27909 () ValueCell!8325)

(assert (=> b!879093 (= condMapEmpty!27909 (= (arr!24618 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8325)) mapDefault!27909)))))

(declare-fun b!879094 () Bool)

(declare-fun res!597273 () Bool)

(declare-fun e!489226 () Bool)

(assert (=> b!879094 (=> (not res!597273) (not e!489226))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51186 0))(
  ( (array!51187 (arr!24619 (Array (_ BitVec 32) (_ BitVec 64))) (size!25059 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51186)

(assert (=> b!879094 (= res!597273 (and (= (size!25058 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25059 _keys!868) (size!25058 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879095 () Bool)

(declare-fun e!489229 () Bool)

(declare-fun e!489230 () Bool)

(assert (=> b!879095 (= e!489229 (not e!489230))))

(declare-fun res!597279 () Bool)

(assert (=> b!879095 (=> res!597279 e!489230)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879095 (= res!597279 (not (validKeyInArray!0 (select (arr!24619 _keys!868) from!1053))))))

(declare-fun v!557 () V!28419)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28419)

(declare-fun zeroValue!654 () V!28419)

(declare-fun lt!397428 () array!51184)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!11654 0))(
  ( (tuple2!11655 (_1!5838 (_ BitVec 64)) (_2!5838 V!28419)) )
))
(declare-datatypes ((List!17471 0))(
  ( (Nil!17468) (Cons!17467 (h!18598 tuple2!11654) (t!24560 List!17471)) )
))
(declare-datatypes ((ListLongMap!10423 0))(
  ( (ListLongMap!10424 (toList!5227 List!17471)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3194 (array!51186 array!51184 (_ BitVec 32) (_ BitVec 32) V!28419 V!28419 (_ BitVec 32) Int) ListLongMap!10423)

(declare-fun +!2500 (ListLongMap!10423 tuple2!11654) ListLongMap!10423)

(assert (=> b!879095 (= (getCurrentListMapNoExtraKeys!3194 _keys!868 lt!397428 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2500 (getCurrentListMapNoExtraKeys!3194 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11655 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30026 0))(
  ( (Unit!30027) )
))
(declare-fun lt!397431 () Unit!30026)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!695 (array!51186 array!51184 (_ BitVec 32) (_ BitVec 32) V!28419 V!28419 (_ BitVec 32) (_ BitVec 64) V!28419 (_ BitVec 32) Int) Unit!30026)

(assert (=> b!879095 (= lt!397431 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!695 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27909 () Bool)

(assert (=> mapIsEmpty!27909 mapRes!27909))

(declare-fun b!879096 () Bool)

(declare-fun tp_is_empty!17529 () Bool)

(assert (=> b!879096 (= e!489232 tp_is_empty!17529)))

(declare-fun b!879097 () Bool)

(declare-fun res!597272 () Bool)

(assert (=> b!879097 (=> (not res!597272) (not e!489226))))

(declare-datatypes ((List!17472 0))(
  ( (Nil!17469) (Cons!17468 (h!18599 (_ BitVec 64)) (t!24561 List!17472)) )
))
(declare-fun arrayNoDuplicates!0 (array!51186 (_ BitVec 32) List!17472) Bool)

(assert (=> b!879097 (= res!597272 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17469))))

(declare-fun b!879098 () Bool)

(declare-fun e!489231 () Bool)

(assert (=> b!879098 (= e!489231 tp_is_empty!17529)))

(declare-fun b!879099 () Bool)

(assert (=> b!879099 (= e!489230 (bvslt from!1053 (size!25058 _values!688)))))

(declare-fun b!879100 () Bool)

(declare-fun res!597275 () Bool)

(assert (=> b!879100 (=> (not res!597275) (not e!489226))))

(assert (=> b!879100 (= res!597275 (validKeyInArray!0 k0!854))))

(declare-fun res!597274 () Bool)

(assert (=> start!74596 (=> (not res!597274) (not e!489226))))

(assert (=> start!74596 (= res!597274 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25059 _keys!868))))))

(assert (=> start!74596 e!489226))

(assert (=> start!74596 tp_is_empty!17529))

(assert (=> start!74596 true))

(assert (=> start!74596 tp!53536))

(declare-fun array_inv!19402 (array!51186) Bool)

(assert (=> start!74596 (array_inv!19402 _keys!868)))

(declare-fun array_inv!19403 (array!51184) Bool)

(assert (=> start!74596 (and (array_inv!19403 _values!688) e!489227)))

(declare-fun b!879101 () Bool)

(declare-fun res!597281 () Bool)

(assert (=> b!879101 (=> (not res!597281) (not e!489226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51186 (_ BitVec 32)) Bool)

(assert (=> b!879101 (= res!597281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27909 () Bool)

(declare-fun tp!53537 () Bool)

(assert (=> mapNonEmpty!27909 (= mapRes!27909 (and tp!53537 e!489231))))

(declare-fun mapRest!27909 () (Array (_ BitVec 32) ValueCell!8325))

(declare-fun mapValue!27909 () ValueCell!8325)

(declare-fun mapKey!27909 () (_ BitVec 32))

(assert (=> mapNonEmpty!27909 (= (arr!24618 _values!688) (store mapRest!27909 mapKey!27909 mapValue!27909))))

(declare-fun b!879102 () Bool)

(declare-fun res!597277 () Bool)

(assert (=> b!879102 (=> (not res!597277) (not e!489226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879102 (= res!597277 (validMask!0 mask!1196))))

(declare-fun b!879103 () Bool)

(assert (=> b!879103 (= e!489226 e!489229)))

(declare-fun res!597278 () Bool)

(assert (=> b!879103 (=> (not res!597278) (not e!489229))))

(assert (=> b!879103 (= res!597278 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397429 () ListLongMap!10423)

(assert (=> b!879103 (= lt!397429 (getCurrentListMapNoExtraKeys!3194 _keys!868 lt!397428 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879103 (= lt!397428 (array!51185 (store (arr!24618 _values!688) i!612 (ValueCellFull!8325 v!557)) (size!25058 _values!688)))))

(declare-fun lt!397430 () ListLongMap!10423)

(assert (=> b!879103 (= lt!397430 (getCurrentListMapNoExtraKeys!3194 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879104 () Bool)

(declare-fun res!597280 () Bool)

(assert (=> b!879104 (=> (not res!597280) (not e!489226))))

(assert (=> b!879104 (= res!597280 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25059 _keys!868))))))

(declare-fun b!879105 () Bool)

(declare-fun res!597276 () Bool)

(assert (=> b!879105 (=> (not res!597276) (not e!489226))))

(assert (=> b!879105 (= res!597276 (and (= (select (arr!24619 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74596 res!597274) b!879102))

(assert (= (and b!879102 res!597277) b!879094))

(assert (= (and b!879094 res!597273) b!879101))

(assert (= (and b!879101 res!597281) b!879097))

(assert (= (and b!879097 res!597272) b!879104))

(assert (= (and b!879104 res!597280) b!879100))

(assert (= (and b!879100 res!597275) b!879105))

(assert (= (and b!879105 res!597276) b!879103))

(assert (= (and b!879103 res!597278) b!879095))

(assert (= (and b!879095 (not res!597279)) b!879099))

(assert (= (and b!879093 condMapEmpty!27909) mapIsEmpty!27909))

(assert (= (and b!879093 (not condMapEmpty!27909)) mapNonEmpty!27909))

(get-info :version)

(assert (= (and mapNonEmpty!27909 ((_ is ValueCellFull!8325) mapValue!27909)) b!879098))

(assert (= (and b!879093 ((_ is ValueCellFull!8325) mapDefault!27909)) b!879096))

(assert (= start!74596 b!879093))

(declare-fun m!818817 () Bool)

(assert (=> mapNonEmpty!27909 m!818817))

(declare-fun m!818819 () Bool)

(assert (=> b!879100 m!818819))

(declare-fun m!818821 () Bool)

(assert (=> b!879103 m!818821))

(declare-fun m!818823 () Bool)

(assert (=> b!879103 m!818823))

(declare-fun m!818825 () Bool)

(assert (=> b!879103 m!818825))

(declare-fun m!818827 () Bool)

(assert (=> b!879097 m!818827))

(declare-fun m!818829 () Bool)

(assert (=> b!879102 m!818829))

(declare-fun m!818831 () Bool)

(assert (=> start!74596 m!818831))

(declare-fun m!818833 () Bool)

(assert (=> start!74596 m!818833))

(declare-fun m!818835 () Bool)

(assert (=> b!879105 m!818835))

(declare-fun m!818837 () Bool)

(assert (=> b!879095 m!818837))

(declare-fun m!818839 () Bool)

(assert (=> b!879095 m!818839))

(assert (=> b!879095 m!818837))

(declare-fun m!818841 () Bool)

(assert (=> b!879095 m!818841))

(declare-fun m!818843 () Bool)

(assert (=> b!879095 m!818843))

(assert (=> b!879095 m!818841))

(declare-fun m!818845 () Bool)

(assert (=> b!879095 m!818845))

(declare-fun m!818847 () Bool)

(assert (=> b!879095 m!818847))

(declare-fun m!818849 () Bool)

(assert (=> b!879101 m!818849))

(check-sat (not b!879102) (not b!879103) tp_is_empty!17529 (not b!879097) b_and!25161 (not b!879100) (not mapNonEmpty!27909) (not b!879101) (not b_next!15285) (not start!74596) (not b!879095))
(check-sat b_and!25161 (not b_next!15285))
