; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73920 () Bool)

(assert start!73920)

(declare-fun b_free!14835 () Bool)

(declare-fun b_next!14835 () Bool)

(assert (=> start!73920 (= b_free!14835 (not b_next!14835))))

(declare-fun tp!52008 () Bool)

(declare-fun b_and!24587 () Bool)

(assert (=> start!73920 (= tp!52008 b_and!24587)))

(declare-fun b!868683 () Bool)

(declare-fun res!590289 () Bool)

(declare-fun e!483817 () Bool)

(assert (=> b!868683 (=> (not res!590289) (not e!483817))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868683 (= res!590289 (validKeyInArray!0 k0!854))))

(declare-fun b!868684 () Bool)

(declare-fun e!483814 () Bool)

(declare-fun e!483816 () Bool)

(declare-fun mapRes!27056 () Bool)

(assert (=> b!868684 (= e!483814 (and e!483816 mapRes!27056))))

(declare-fun condMapEmpty!27056 () Bool)

(declare-datatypes ((V!27675 0))(
  ( (V!27676 (val!8533 Int)) )
))
(declare-datatypes ((ValueCell!8046 0))(
  ( (ValueCellFull!8046 (v!10958 V!27675)) (EmptyCell!8046) )
))
(declare-datatypes ((array!50092 0))(
  ( (array!50093 (arr!24077 (Array (_ BitVec 32) ValueCell!8046)) (size!24517 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50092)

(declare-fun mapDefault!27056 () ValueCell!8046)

(assert (=> b!868684 (= condMapEmpty!27056 (= (arr!24077 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8046)) mapDefault!27056)))))

(declare-fun mapNonEmpty!27056 () Bool)

(declare-fun tp!52009 () Bool)

(declare-fun e!483813 () Bool)

(assert (=> mapNonEmpty!27056 (= mapRes!27056 (and tp!52009 e!483813))))

(declare-fun mapRest!27056 () (Array (_ BitVec 32) ValueCell!8046))

(declare-fun mapValue!27056 () ValueCell!8046)

(declare-fun mapKey!27056 () (_ BitVec 32))

(assert (=> mapNonEmpty!27056 (= (arr!24077 _values!688) (store mapRest!27056 mapKey!27056 mapValue!27056))))

(declare-fun b!868685 () Bool)

(declare-fun res!590286 () Bool)

(assert (=> b!868685 (=> (not res!590286) (not e!483817))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868685 (= res!590286 (validMask!0 mask!1196))))

(declare-fun b!868686 () Bool)

(declare-fun e!483812 () Bool)

(assert (=> b!868686 (= e!483812 (not true))))

(declare-fun v!557 () V!27675)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394552 () array!50092)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27675)

(declare-fun zeroValue!654 () V!27675)

(declare-datatypes ((array!50094 0))(
  ( (array!50095 (arr!24078 (Array (_ BitVec 32) (_ BitVec 64))) (size!24518 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50094)

(declare-datatypes ((tuple2!11326 0))(
  ( (tuple2!11327 (_1!5674 (_ BitVec 64)) (_2!5674 V!27675)) )
))
(declare-datatypes ((List!17122 0))(
  ( (Nil!17119) (Cons!17118 (h!18249 tuple2!11326) (t!24159 List!17122)) )
))
(declare-datatypes ((ListLongMap!10095 0))(
  ( (ListLongMap!10096 (toList!5063 List!17122)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3032 (array!50094 array!50092 (_ BitVec 32) (_ BitVec 32) V!27675 V!27675 (_ BitVec 32) Int) ListLongMap!10095)

(declare-fun +!2405 (ListLongMap!10095 tuple2!11326) ListLongMap!10095)

(assert (=> b!868686 (= (getCurrentListMapNoExtraKeys!3032 _keys!868 lt!394552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2405 (getCurrentListMapNoExtraKeys!3032 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11327 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29808 0))(
  ( (Unit!29809) )
))
(declare-fun lt!394549 () Unit!29808)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!599 (array!50094 array!50092 (_ BitVec 32) (_ BitVec 32) V!27675 V!27675 (_ BitVec 32) (_ BitVec 64) V!27675 (_ BitVec 32) Int) Unit!29808)

(assert (=> b!868686 (= lt!394549 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!599 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868687 () Bool)

(declare-fun res!590294 () Bool)

(assert (=> b!868687 (=> (not res!590294) (not e!483817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50094 (_ BitVec 32)) Bool)

(assert (=> b!868687 (= res!590294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868688 () Bool)

(declare-fun res!590288 () Bool)

(assert (=> b!868688 (=> (not res!590288) (not e!483817))))

(assert (=> b!868688 (= res!590288 (and (= (select (arr!24078 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868689 () Bool)

(declare-fun res!590287 () Bool)

(assert (=> b!868689 (=> (not res!590287) (not e!483817))))

(assert (=> b!868689 (= res!590287 (and (= (size!24517 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24518 _keys!868) (size!24517 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868690 () Bool)

(declare-fun tp_is_empty!16971 () Bool)

(assert (=> b!868690 (= e!483813 tp_is_empty!16971)))

(declare-fun res!590291 () Bool)

(assert (=> start!73920 (=> (not res!590291) (not e!483817))))

(assert (=> start!73920 (= res!590291 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24518 _keys!868))))))

(assert (=> start!73920 e!483817))

(assert (=> start!73920 tp_is_empty!16971))

(assert (=> start!73920 true))

(assert (=> start!73920 tp!52008))

(declare-fun array_inv!19018 (array!50094) Bool)

(assert (=> start!73920 (array_inv!19018 _keys!868)))

(declare-fun array_inv!19019 (array!50092) Bool)

(assert (=> start!73920 (and (array_inv!19019 _values!688) e!483814)))

(declare-fun b!868691 () Bool)

(assert (=> b!868691 (= e!483817 e!483812)))

(declare-fun res!590290 () Bool)

(assert (=> b!868691 (=> (not res!590290) (not e!483812))))

(assert (=> b!868691 (= res!590290 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394551 () ListLongMap!10095)

(assert (=> b!868691 (= lt!394551 (getCurrentListMapNoExtraKeys!3032 _keys!868 lt!394552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868691 (= lt!394552 (array!50093 (store (arr!24077 _values!688) i!612 (ValueCellFull!8046 v!557)) (size!24517 _values!688)))))

(declare-fun lt!394550 () ListLongMap!10095)

(assert (=> b!868691 (= lt!394550 (getCurrentListMapNoExtraKeys!3032 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868692 () Bool)

(declare-fun res!590292 () Bool)

(assert (=> b!868692 (=> (not res!590292) (not e!483817))))

(assert (=> b!868692 (= res!590292 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24518 _keys!868))))))

(declare-fun b!868693 () Bool)

(assert (=> b!868693 (= e!483816 tp_is_empty!16971)))

(declare-fun b!868694 () Bool)

(declare-fun res!590293 () Bool)

(assert (=> b!868694 (=> (not res!590293) (not e!483817))))

(declare-datatypes ((List!17123 0))(
  ( (Nil!17120) (Cons!17119 (h!18250 (_ BitVec 64)) (t!24160 List!17123)) )
))
(declare-fun arrayNoDuplicates!0 (array!50094 (_ BitVec 32) List!17123) Bool)

(assert (=> b!868694 (= res!590293 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17120))))

(declare-fun mapIsEmpty!27056 () Bool)

(assert (=> mapIsEmpty!27056 mapRes!27056))

(assert (= (and start!73920 res!590291) b!868685))

(assert (= (and b!868685 res!590286) b!868689))

(assert (= (and b!868689 res!590287) b!868687))

(assert (= (and b!868687 res!590294) b!868694))

(assert (= (and b!868694 res!590293) b!868692))

(assert (= (and b!868692 res!590292) b!868683))

(assert (= (and b!868683 res!590289) b!868688))

(assert (= (and b!868688 res!590288) b!868691))

(assert (= (and b!868691 res!590290) b!868686))

(assert (= (and b!868684 condMapEmpty!27056) mapIsEmpty!27056))

(assert (= (and b!868684 (not condMapEmpty!27056)) mapNonEmpty!27056))

(get-info :version)

(assert (= (and mapNonEmpty!27056 ((_ is ValueCellFull!8046) mapValue!27056)) b!868690))

(assert (= (and b!868684 ((_ is ValueCellFull!8046) mapDefault!27056)) b!868693))

(assert (= start!73920 b!868684))

(declare-fun m!810347 () Bool)

(assert (=> mapNonEmpty!27056 m!810347))

(declare-fun m!810349 () Bool)

(assert (=> start!73920 m!810349))

(declare-fun m!810351 () Bool)

(assert (=> start!73920 m!810351))

(declare-fun m!810353 () Bool)

(assert (=> b!868685 m!810353))

(declare-fun m!810355 () Bool)

(assert (=> b!868687 m!810355))

(declare-fun m!810357 () Bool)

(assert (=> b!868694 m!810357))

(declare-fun m!810359 () Bool)

(assert (=> b!868686 m!810359))

(declare-fun m!810361 () Bool)

(assert (=> b!868686 m!810361))

(assert (=> b!868686 m!810361))

(declare-fun m!810363 () Bool)

(assert (=> b!868686 m!810363))

(declare-fun m!810365 () Bool)

(assert (=> b!868686 m!810365))

(declare-fun m!810367 () Bool)

(assert (=> b!868688 m!810367))

(declare-fun m!810369 () Bool)

(assert (=> b!868691 m!810369))

(declare-fun m!810371 () Bool)

(assert (=> b!868691 m!810371))

(declare-fun m!810373 () Bool)

(assert (=> b!868691 m!810373))

(declare-fun m!810375 () Bool)

(assert (=> b!868683 m!810375))

(check-sat (not b!868683) tp_is_empty!16971 b_and!24587 (not b!868691) (not b!868686) (not start!73920) (not b!868685) (not b!868687) (not b_next!14835) (not b!868694) (not mapNonEmpty!27056))
(check-sat b_and!24587 (not b_next!14835))
