; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75154 () Bool)

(assert start!75154)

(declare-fun b_free!15475 () Bool)

(declare-fun b_next!15475 () Bool)

(assert (=> start!75154 (= b_free!15475 (not b_next!15475))))

(declare-fun tp!54131 () Bool)

(declare-fun b_and!25675 () Bool)

(assert (=> start!75154 (= tp!54131 b_and!25675)))

(declare-fun b!885427 () Bool)

(declare-fun res!601218 () Bool)

(declare-fun e!492835 () Bool)

(assert (=> b!885427 (=> (not res!601218) (not e!492835))))

(declare-datatypes ((array!51605 0))(
  ( (array!51606 (arr!24816 (Array (_ BitVec 32) (_ BitVec 64))) (size!25257 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51605)

(declare-datatypes ((List!17574 0))(
  ( (Nil!17571) (Cons!17570 (h!18707 (_ BitVec 64)) (t!24841 List!17574)) )
))
(declare-fun arrayNoDuplicates!0 (array!51605 (_ BitVec 32) List!17574) Bool)

(assert (=> b!885427 (= res!601218 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17571))))

(declare-fun b!885428 () Bool)

(declare-fun e!492837 () Bool)

(declare-fun tp_is_empty!17719 () Bool)

(assert (=> b!885428 (= e!492837 tp_is_empty!17719)))

(declare-fun b!885429 () Bool)

(declare-fun e!492838 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28673 0))(
  ( (V!28674 (val!8907 Int)) )
))
(declare-datatypes ((ValueCell!8420 0))(
  ( (ValueCellFull!8420 (v!11380 V!28673)) (EmptyCell!8420) )
))
(declare-datatypes ((array!51607 0))(
  ( (array!51608 (arr!24817 (Array (_ BitVec 32) ValueCell!8420)) (size!25258 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51607)

(assert (=> b!885429 (= e!492838 (bvslt i!612 (size!25258 _values!688)))))

(declare-fun b!885430 () Bool)

(declare-fun e!492833 () Bool)

(declare-fun mapRes!28218 () Bool)

(assert (=> b!885430 (= e!492833 (and e!492837 mapRes!28218))))

(declare-fun condMapEmpty!28218 () Bool)

(declare-fun mapDefault!28218 () ValueCell!8420)

(assert (=> b!885430 (= condMapEmpty!28218 (= (arr!24817 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8420)) mapDefault!28218)))))

(declare-fun b!885431 () Bool)

(declare-fun res!601214 () Bool)

(assert (=> b!885431 (=> (not res!601214) (not e!492835))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!885431 (= res!601214 (validMask!0 mask!1196))))

(declare-fun res!601211 () Bool)

(assert (=> start!75154 (=> (not res!601211) (not e!492835))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!75154 (= res!601211 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25257 _keys!868))))))

(assert (=> start!75154 e!492835))

(assert (=> start!75154 tp_is_empty!17719))

(assert (=> start!75154 true))

(assert (=> start!75154 tp!54131))

(declare-fun array_inv!19576 (array!51605) Bool)

(assert (=> start!75154 (array_inv!19576 _keys!868)))

(declare-fun array_inv!19577 (array!51607) Bool)

(assert (=> start!75154 (and (array_inv!19577 _values!688) e!492833)))

(declare-fun b!885432 () Bool)

(declare-fun e!492836 () Bool)

(assert (=> b!885432 (= e!492836 (not e!492838))))

(declare-fun res!601210 () Bool)

(assert (=> b!885432 (=> res!601210 e!492838)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!885432 (= res!601210 (validKeyInArray!0 (select (arr!24816 _keys!868) from!1053)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28673)

(declare-fun zeroValue!654 () V!28673)

(declare-fun lt!401062 () array!51607)

(declare-fun v!557 () V!28673)

(declare-datatypes ((tuple2!11742 0))(
  ( (tuple2!11743 (_1!5882 (_ BitVec 64)) (_2!5882 V!28673)) )
))
(declare-datatypes ((List!17575 0))(
  ( (Nil!17572) (Cons!17571 (h!18708 tuple2!11742) (t!24842 List!17575)) )
))
(declare-datatypes ((ListLongMap!10513 0))(
  ( (ListLongMap!10514 (toList!5272 List!17575)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3308 (array!51605 array!51607 (_ BitVec 32) (_ BitVec 32) V!28673 V!28673 (_ BitVec 32) Int) ListLongMap!10513)

(declare-fun +!2584 (ListLongMap!10513 tuple2!11742) ListLongMap!10513)

(assert (=> b!885432 (= (getCurrentListMapNoExtraKeys!3308 _keys!868 lt!401062 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2584 (getCurrentListMapNoExtraKeys!3308 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11743 k0!854 v!557)))))

(declare-datatypes ((Unit!30182 0))(
  ( (Unit!30183) )
))
(declare-fun lt!401064 () Unit!30182)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 (array!51605 array!51607 (_ BitVec 32) (_ BitVec 32) V!28673 V!28673 (_ BitVec 32) (_ BitVec 64) V!28673 (_ BitVec 32) Int) Unit!30182)

(assert (=> b!885432 (= lt!401064 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!885433 () Bool)

(declare-fun res!601219 () Bool)

(assert (=> b!885433 (=> (not res!601219) (not e!492835))))

(assert (=> b!885433 (= res!601219 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25257 _keys!868))))))

(declare-fun b!885434 () Bool)

(declare-fun res!601215 () Bool)

(assert (=> b!885434 (=> (not res!601215) (not e!492835))))

(assert (=> b!885434 (= res!601215 (and (= (size!25258 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25257 _keys!868) (size!25258 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28218 () Bool)

(declare-fun tp!54132 () Bool)

(declare-fun e!492834 () Bool)

(assert (=> mapNonEmpty!28218 (= mapRes!28218 (and tp!54132 e!492834))))

(declare-fun mapRest!28218 () (Array (_ BitVec 32) ValueCell!8420))

(declare-fun mapValue!28218 () ValueCell!8420)

(declare-fun mapKey!28218 () (_ BitVec 32))

(assert (=> mapNonEmpty!28218 (= (arr!24817 _values!688) (store mapRest!28218 mapKey!28218 mapValue!28218))))

(declare-fun b!885435 () Bool)

(assert (=> b!885435 (= e!492835 e!492836)))

(declare-fun res!601216 () Bool)

(assert (=> b!885435 (=> (not res!601216) (not e!492836))))

(assert (=> b!885435 (= res!601216 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!401065 () ListLongMap!10513)

(assert (=> b!885435 (= lt!401065 (getCurrentListMapNoExtraKeys!3308 _keys!868 lt!401062 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!885435 (= lt!401062 (array!51608 (store (arr!24817 _values!688) i!612 (ValueCellFull!8420 v!557)) (size!25258 _values!688)))))

(declare-fun lt!401063 () ListLongMap!10513)

(assert (=> b!885435 (= lt!401063 (getCurrentListMapNoExtraKeys!3308 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!885436 () Bool)

(declare-fun res!601213 () Bool)

(assert (=> b!885436 (=> (not res!601213) (not e!492835))))

(assert (=> b!885436 (= res!601213 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28218 () Bool)

(assert (=> mapIsEmpty!28218 mapRes!28218))

(declare-fun b!885437 () Bool)

(declare-fun res!601217 () Bool)

(assert (=> b!885437 (=> (not res!601217) (not e!492835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51605 (_ BitVec 32)) Bool)

(assert (=> b!885437 (= res!601217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!885438 () Bool)

(assert (=> b!885438 (= e!492834 tp_is_empty!17719)))

(declare-fun b!885439 () Bool)

(declare-fun res!601212 () Bool)

(assert (=> b!885439 (=> (not res!601212) (not e!492835))))

(assert (=> b!885439 (= res!601212 (and (= (select (arr!24816 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!75154 res!601211) b!885431))

(assert (= (and b!885431 res!601214) b!885434))

(assert (= (and b!885434 res!601215) b!885437))

(assert (= (and b!885437 res!601217) b!885427))

(assert (= (and b!885427 res!601218) b!885433))

(assert (= (and b!885433 res!601219) b!885436))

(assert (= (and b!885436 res!601213) b!885439))

(assert (= (and b!885439 res!601212) b!885435))

(assert (= (and b!885435 res!601216) b!885432))

(assert (= (and b!885432 (not res!601210)) b!885429))

(assert (= (and b!885430 condMapEmpty!28218) mapIsEmpty!28218))

(assert (= (and b!885430 (not condMapEmpty!28218)) mapNonEmpty!28218))

(get-info :version)

(assert (= (and mapNonEmpty!28218 ((_ is ValueCellFull!8420) mapValue!28218)) b!885438))

(assert (= (and b!885430 ((_ is ValueCellFull!8420) mapDefault!28218)) b!885428))

(assert (= start!75154 b!885430))

(declare-fun m!826073 () Bool)

(assert (=> b!885435 m!826073))

(declare-fun m!826075 () Bool)

(assert (=> b!885435 m!826075))

(declare-fun m!826077 () Bool)

(assert (=> b!885435 m!826077))

(declare-fun m!826079 () Bool)

(assert (=> b!885432 m!826079))

(declare-fun m!826081 () Bool)

(assert (=> b!885432 m!826081))

(assert (=> b!885432 m!826079))

(declare-fun m!826083 () Bool)

(assert (=> b!885432 m!826083))

(declare-fun m!826085 () Bool)

(assert (=> b!885432 m!826085))

(declare-fun m!826087 () Bool)

(assert (=> b!885432 m!826087))

(assert (=> b!885432 m!826085))

(declare-fun m!826089 () Bool)

(assert (=> b!885432 m!826089))

(declare-fun m!826091 () Bool)

(assert (=> b!885431 m!826091))

(declare-fun m!826093 () Bool)

(assert (=> b!885437 m!826093))

(declare-fun m!826095 () Bool)

(assert (=> b!885439 m!826095))

(declare-fun m!826097 () Bool)

(assert (=> start!75154 m!826097))

(declare-fun m!826099 () Bool)

(assert (=> start!75154 m!826099))

(declare-fun m!826101 () Bool)

(assert (=> b!885436 m!826101))

(declare-fun m!826103 () Bool)

(assert (=> mapNonEmpty!28218 m!826103))

(declare-fun m!826105 () Bool)

(assert (=> b!885427 m!826105))

(check-sat (not start!75154) (not b_next!15475) b_and!25675 (not b!885431) (not mapNonEmpty!28218) (not b!885436) (not b!885432) (not b!885427) (not b!885437) (not b!885435) tp_is_empty!17719)
(check-sat b_and!25675 (not b_next!15475))
