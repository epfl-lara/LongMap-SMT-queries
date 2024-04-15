; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72850 () Bool)

(assert start!72850)

(declare-fun b_free!13783 () Bool)

(declare-fun b_next!13783 () Bool)

(assert (=> start!72850 (= b_free!13783 (not b_next!13783))))

(declare-fun tp!48854 () Bool)

(declare-fun b_and!22843 () Bool)

(assert (=> start!72850 (= tp!48854 b_and!22843)))

(declare-fun b!845564 () Bool)

(declare-fun res!574500 () Bool)

(declare-fun e!471982 () Bool)

(assert (=> b!845564 (=> (not res!574500) (not e!471982))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48057 0))(
  ( (array!48058 (arr!23060 (Array (_ BitVec 32) (_ BitVec 64))) (size!23502 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48057)

(assert (=> b!845564 (= res!574500 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23502 _keys!868))))))

(declare-fun b!845565 () Bool)

(declare-fun res!574496 () Bool)

(assert (=> b!845565 (=> (not res!574496) (not e!471982))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26273 0))(
  ( (V!26274 (val!8007 Int)) )
))
(declare-datatypes ((ValueCell!7520 0))(
  ( (ValueCellFull!7520 (v!10426 V!26273)) (EmptyCell!7520) )
))
(declare-datatypes ((array!48059 0))(
  ( (array!48060 (arr!23061 (Array (_ BitVec 32) ValueCell!7520)) (size!23503 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48059)

(assert (=> b!845565 (= res!574496 (and (= (size!23503 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23502 _keys!868) (size!23503 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!574502 () Bool)

(assert (=> start!72850 (=> (not res!574502) (not e!471982))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72850 (= res!574502 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23502 _keys!868))))))

(assert (=> start!72850 e!471982))

(assert (=> start!72850 true))

(assert (=> start!72850 tp!48854))

(declare-fun array_inv!18396 (array!48057) Bool)

(assert (=> start!72850 (array_inv!18396 _keys!868)))

(declare-fun e!471980 () Bool)

(declare-fun array_inv!18397 (array!48059) Bool)

(assert (=> start!72850 (and (array_inv!18397 _values!688) e!471980)))

(declare-fun tp_is_empty!15919 () Bool)

(assert (=> start!72850 tp_is_empty!15919))

(declare-fun b!845566 () Bool)

(declare-fun e!471983 () Bool)

(assert (=> b!845566 (= e!471983 tp_is_empty!15919)))

(declare-fun b!845567 () Bool)

(declare-fun res!574498 () Bool)

(assert (=> b!845567 (=> (not res!574498) (not e!471982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48057 (_ BitVec 32)) Bool)

(assert (=> b!845567 (= res!574498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25478 () Bool)

(declare-fun mapRes!25478 () Bool)

(declare-fun tp!48853 () Bool)

(declare-fun e!471984 () Bool)

(assert (=> mapNonEmpty!25478 (= mapRes!25478 (and tp!48853 e!471984))))

(declare-fun mapValue!25478 () ValueCell!7520)

(declare-fun mapKey!25478 () (_ BitVec 32))

(declare-fun mapRest!25478 () (Array (_ BitVec 32) ValueCell!7520))

(assert (=> mapNonEmpty!25478 (= (arr!23061 _values!688) (store mapRest!25478 mapKey!25478 mapValue!25478))))

(declare-fun mapIsEmpty!25478 () Bool)

(assert (=> mapIsEmpty!25478 mapRes!25478))

(declare-fun b!845568 () Bool)

(declare-fun res!574499 () Bool)

(assert (=> b!845568 (=> (not res!574499) (not e!471982))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845568 (= res!574499 (validKeyInArray!0 k0!854))))

(declare-fun b!845569 () Bool)

(assert (=> b!845569 (= e!471980 (and e!471983 mapRes!25478))))

(declare-fun condMapEmpty!25478 () Bool)

(declare-fun mapDefault!25478 () ValueCell!7520)

(assert (=> b!845569 (= condMapEmpty!25478 (= (arr!23061 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7520)) mapDefault!25478)))))

(declare-fun b!845570 () Bool)

(declare-fun res!574501 () Bool)

(assert (=> b!845570 (=> (not res!574501) (not e!471982))))

(declare-datatypes ((List!16342 0))(
  ( (Nil!16339) (Cons!16338 (h!17469 (_ BitVec 64)) (t!22704 List!16342)) )
))
(declare-fun arrayNoDuplicates!0 (array!48057 (_ BitVec 32) List!16342) Bool)

(assert (=> b!845570 (= res!574501 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16339))))

(declare-fun b!845571 () Bool)

(declare-fun res!574503 () Bool)

(assert (=> b!845571 (=> (not res!574503) (not e!471982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845571 (= res!574503 (validMask!0 mask!1196))))

(declare-fun b!845572 () Bool)

(declare-fun res!574497 () Bool)

(assert (=> b!845572 (=> (not res!574497) (not e!471982))))

(assert (=> b!845572 (= res!574497 (and (= (select (arr!23060 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845573 () Bool)

(assert (=> b!845573 (= e!471984 tp_is_empty!15919)))

(declare-fun b!845574 () Bool)

(assert (=> b!845574 (= e!471982 false)))

(declare-datatypes ((tuple2!10482 0))(
  ( (tuple2!10483 (_1!5252 (_ BitVec 64)) (_2!5252 V!26273)) )
))
(declare-datatypes ((List!16343 0))(
  ( (Nil!16340) (Cons!16339 (h!17470 tuple2!10482) (t!22705 List!16343)) )
))
(declare-datatypes ((ListLongMap!9241 0))(
  ( (ListLongMap!9242 (toList!4636 List!16343)) )
))
(declare-fun lt!381209 () ListLongMap!9241)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26273)

(declare-fun zeroValue!654 () V!26273)

(declare-fun getCurrentListMapNoExtraKeys!2650 (array!48057 array!48059 (_ BitVec 32) (_ BitVec 32) V!26273 V!26273 (_ BitVec 32) Int) ListLongMap!9241)

(assert (=> b!845574 (= lt!381209 (getCurrentListMapNoExtraKeys!2650 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!72850 res!574502) b!845571))

(assert (= (and b!845571 res!574503) b!845565))

(assert (= (and b!845565 res!574496) b!845567))

(assert (= (and b!845567 res!574498) b!845570))

(assert (= (and b!845570 res!574501) b!845564))

(assert (= (and b!845564 res!574500) b!845568))

(assert (= (and b!845568 res!574499) b!845572))

(assert (= (and b!845572 res!574497) b!845574))

(assert (= (and b!845569 condMapEmpty!25478) mapIsEmpty!25478))

(assert (= (and b!845569 (not condMapEmpty!25478)) mapNonEmpty!25478))

(get-info :version)

(assert (= (and mapNonEmpty!25478 ((_ is ValueCellFull!7520) mapValue!25478)) b!845573))

(assert (= (and b!845569 ((_ is ValueCellFull!7520) mapDefault!25478)) b!845566))

(assert (= start!72850 b!845569))

(declare-fun m!786695 () Bool)

(assert (=> b!845568 m!786695))

(declare-fun m!786697 () Bool)

(assert (=> b!845572 m!786697))

(declare-fun m!786699 () Bool)

(assert (=> b!845574 m!786699))

(declare-fun m!786701 () Bool)

(assert (=> b!845567 m!786701))

(declare-fun m!786703 () Bool)

(assert (=> mapNonEmpty!25478 m!786703))

(declare-fun m!786705 () Bool)

(assert (=> b!845570 m!786705))

(declare-fun m!786707 () Bool)

(assert (=> b!845571 m!786707))

(declare-fun m!786709 () Bool)

(assert (=> start!72850 m!786709))

(declare-fun m!786711 () Bool)

(assert (=> start!72850 m!786711))

(check-sat (not b!845574) tp_is_empty!15919 (not b!845567) b_and!22843 (not b!845571) (not b!845570) (not mapNonEmpty!25478) (not b!845568) (not start!72850) (not b_next!13783))
(check-sat b_and!22843 (not b_next!13783))
