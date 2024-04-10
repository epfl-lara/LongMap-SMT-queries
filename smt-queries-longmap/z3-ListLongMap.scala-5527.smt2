; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72948 () Bool)

(assert start!72948)

(declare-fun b_free!13863 () Bool)

(declare-fun b_next!13863 () Bool)

(assert (=> start!72948 (= b_free!13863 (not b_next!13863))))

(declare-fun tp!49093 () Bool)

(declare-fun b_and!22949 () Bool)

(assert (=> start!72948 (= tp!49093 b_and!22949)))

(declare-fun b!847123 () Bool)

(declare-fun e!472729 () Bool)

(declare-fun tp_is_empty!15999 () Bool)

(assert (=> b!847123 (= e!472729 tp_is_empty!15999)))

(declare-fun b!847124 () Bool)

(declare-fun res!575573 () Bool)

(declare-fun e!472730 () Bool)

(assert (=> b!847124 (=> (not res!575573) (not e!472730))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48210 0))(
  ( (array!48211 (arr!23136 (Array (_ BitVec 32) (_ BitVec 64))) (size!23576 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48210)

(declare-datatypes ((V!26379 0))(
  ( (V!26380 (val!8047 Int)) )
))
(declare-datatypes ((ValueCell!7560 0))(
  ( (ValueCellFull!7560 (v!10472 V!26379)) (EmptyCell!7560) )
))
(declare-datatypes ((array!48212 0))(
  ( (array!48213 (arr!23137 (Array (_ BitVec 32) ValueCell!7560)) (size!23577 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48212)

(assert (=> b!847124 (= res!575573 (and (= (size!23577 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23576 _keys!868) (size!23577 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847125 () Bool)

(declare-fun res!575566 () Bool)

(assert (=> b!847125 (=> (not res!575566) (not e!472730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48210 (_ BitVec 32)) Bool)

(assert (=> b!847125 (= res!575566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847126 () Bool)

(declare-fun res!575569 () Bool)

(assert (=> b!847126 (=> (not res!575569) (not e!472730))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847126 (= res!575569 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25598 () Bool)

(declare-fun mapRes!25598 () Bool)

(declare-fun tp!49092 () Bool)

(declare-fun e!472732 () Bool)

(assert (=> mapNonEmpty!25598 (= mapRes!25598 (and tp!49092 e!472732))))

(declare-fun mapRest!25598 () (Array (_ BitVec 32) ValueCell!7560))

(declare-fun mapKey!25598 () (_ BitVec 32))

(declare-fun mapValue!25598 () ValueCell!7560)

(assert (=> mapNonEmpty!25598 (= (arr!23137 _values!688) (store mapRest!25598 mapKey!25598 mapValue!25598))))

(declare-fun b!847127 () Bool)

(declare-fun res!575570 () Bool)

(assert (=> b!847127 (=> (not res!575570) (not e!472730))))

(declare-datatypes ((List!16368 0))(
  ( (Nil!16365) (Cons!16364 (h!17495 (_ BitVec 64)) (t!22739 List!16368)) )
))
(declare-fun arrayNoDuplicates!0 (array!48210 (_ BitVec 32) List!16368) Bool)

(assert (=> b!847127 (= res!575570 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16365))))

(declare-fun b!847128 () Bool)

(declare-fun res!575572 () Bool)

(assert (=> b!847128 (=> (not res!575572) (not e!472730))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847128 (= res!575572 (and (= (select (arr!23136 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847129 () Bool)

(declare-fun res!575568 () Bool)

(assert (=> b!847129 (=> (not res!575568) (not e!472730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847129 (= res!575568 (validMask!0 mask!1196))))

(declare-fun b!847130 () Bool)

(assert (=> b!847130 (= e!472730 false)))

(declare-datatypes ((tuple2!10508 0))(
  ( (tuple2!10509 (_1!5265 (_ BitVec 64)) (_2!5265 V!26379)) )
))
(declare-datatypes ((List!16369 0))(
  ( (Nil!16366) (Cons!16365 (h!17496 tuple2!10508) (t!22740 List!16369)) )
))
(declare-datatypes ((ListLongMap!9277 0))(
  ( (ListLongMap!9278 (toList!4654 List!16369)) )
))
(declare-fun lt!381661 () ListLongMap!9277)

(declare-fun v!557 () V!26379)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26379)

(declare-fun zeroValue!654 () V!26379)

(declare-fun getCurrentListMapNoExtraKeys!2639 (array!48210 array!48212 (_ BitVec 32) (_ BitVec 32) V!26379 V!26379 (_ BitVec 32) Int) ListLongMap!9277)

(assert (=> b!847130 (= lt!381661 (getCurrentListMapNoExtraKeys!2639 _keys!868 (array!48213 (store (arr!23137 _values!688) i!612 (ValueCellFull!7560 v!557)) (size!23577 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381660 () ListLongMap!9277)

(assert (=> b!847130 (= lt!381660 (getCurrentListMapNoExtraKeys!2639 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25598 () Bool)

(assert (=> mapIsEmpty!25598 mapRes!25598))

(declare-fun b!847131 () Bool)

(declare-fun e!472731 () Bool)

(assert (=> b!847131 (= e!472731 (and e!472729 mapRes!25598))))

(declare-fun condMapEmpty!25598 () Bool)

(declare-fun mapDefault!25598 () ValueCell!7560)

(assert (=> b!847131 (= condMapEmpty!25598 (= (arr!23137 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7560)) mapDefault!25598)))))

(declare-fun b!847132 () Bool)

(declare-fun res!575571 () Bool)

(assert (=> b!847132 (=> (not res!575571) (not e!472730))))

(assert (=> b!847132 (= res!575571 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23576 _keys!868))))))

(declare-fun res!575567 () Bool)

(assert (=> start!72948 (=> (not res!575567) (not e!472730))))

(assert (=> start!72948 (= res!575567 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23576 _keys!868))))))

(assert (=> start!72948 e!472730))

(assert (=> start!72948 tp_is_empty!15999))

(assert (=> start!72948 true))

(assert (=> start!72948 tp!49093))

(declare-fun array_inv!18376 (array!48210) Bool)

(assert (=> start!72948 (array_inv!18376 _keys!868)))

(declare-fun array_inv!18377 (array!48212) Bool)

(assert (=> start!72948 (and (array_inv!18377 _values!688) e!472731)))

(declare-fun b!847133 () Bool)

(assert (=> b!847133 (= e!472732 tp_is_empty!15999)))

(assert (= (and start!72948 res!575567) b!847129))

(assert (= (and b!847129 res!575568) b!847124))

(assert (= (and b!847124 res!575573) b!847125))

(assert (= (and b!847125 res!575566) b!847127))

(assert (= (and b!847127 res!575570) b!847132))

(assert (= (and b!847132 res!575571) b!847126))

(assert (= (and b!847126 res!575569) b!847128))

(assert (= (and b!847128 res!575572) b!847130))

(assert (= (and b!847131 condMapEmpty!25598) mapIsEmpty!25598))

(assert (= (and b!847131 (not condMapEmpty!25598)) mapNonEmpty!25598))

(get-info :version)

(assert (= (and mapNonEmpty!25598 ((_ is ValueCellFull!7560) mapValue!25598)) b!847133))

(assert (= (and b!847131 ((_ is ValueCellFull!7560) mapDefault!25598)) b!847123))

(assert (= start!72948 b!847131))

(declare-fun m!788293 () Bool)

(assert (=> b!847128 m!788293))

(declare-fun m!788295 () Bool)

(assert (=> b!847126 m!788295))

(declare-fun m!788297 () Bool)

(assert (=> mapNonEmpty!25598 m!788297))

(declare-fun m!788299 () Bool)

(assert (=> b!847127 m!788299))

(declare-fun m!788301 () Bool)

(assert (=> b!847125 m!788301))

(declare-fun m!788303 () Bool)

(assert (=> b!847130 m!788303))

(declare-fun m!788305 () Bool)

(assert (=> b!847130 m!788305))

(declare-fun m!788307 () Bool)

(assert (=> b!847130 m!788307))

(declare-fun m!788309 () Bool)

(assert (=> b!847129 m!788309))

(declare-fun m!788311 () Bool)

(assert (=> start!72948 m!788311))

(declare-fun m!788313 () Bool)

(assert (=> start!72948 m!788313))

(check-sat (not start!72948) (not b!847127) (not b_next!13863) (not b!847126) (not mapNonEmpty!25598) b_and!22949 tp_is_empty!15999 (not b!847130) (not b!847125) (not b!847129))
(check-sat b_and!22949 (not b_next!13863))
