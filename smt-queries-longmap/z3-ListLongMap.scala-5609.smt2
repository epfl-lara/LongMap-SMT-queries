; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73606 () Bool)

(assert start!73606)

(declare-fun b_free!14353 () Bool)

(declare-fun b_next!14353 () Bool)

(assert (=> start!73606 (= b_free!14353 (not b_next!14353))))

(declare-fun tp!50563 () Bool)

(declare-fun b_and!23719 () Bool)

(assert (=> start!73606 (= tp!50563 b_and!23719)))

(declare-fun mapIsEmpty!26333 () Bool)

(declare-fun mapRes!26333 () Bool)

(assert (=> mapIsEmpty!26333 mapRes!26333))

(declare-fun b!858381 () Bool)

(declare-fun res!582825 () Bool)

(declare-fun e!478501 () Bool)

(assert (=> b!858381 (=> (not res!582825) (not e!478501))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49211 0))(
  ( (array!49212 (arr!23632 (Array (_ BitVec 32) (_ BitVec 64))) (size!24073 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49211)

(declare-datatypes ((V!27033 0))(
  ( (V!27034 (val!8292 Int)) )
))
(declare-datatypes ((ValueCell!7805 0))(
  ( (ValueCellFull!7805 (v!10717 V!27033)) (EmptyCell!7805) )
))
(declare-datatypes ((array!49213 0))(
  ( (array!49214 (arr!23633 (Array (_ BitVec 32) ValueCell!7805)) (size!24074 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49213)

(assert (=> b!858381 (= res!582825 (and (= (size!24074 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24073 _keys!868) (size!24074 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858382 () Bool)

(declare-fun res!582823 () Bool)

(assert (=> b!858382 (=> (not res!582823) (not e!478501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49211 (_ BitVec 32)) Bool)

(assert (=> b!858382 (= res!582823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858383 () Bool)

(declare-fun res!582824 () Bool)

(assert (=> b!858383 (=> (not res!582824) (not e!478501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858383 (= res!582824 (validMask!0 mask!1196))))

(declare-fun b!858384 () Bool)

(declare-fun e!478502 () Bool)

(assert (=> b!858384 (= e!478501 e!478502)))

(declare-fun res!582818 () Bool)

(assert (=> b!858384 (=> (not res!582818) (not e!478502))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858384 (= res!582818 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386665 () array!49213)

(declare-datatypes ((tuple2!10860 0))(
  ( (tuple2!10861 (_1!5441 (_ BitVec 64)) (_2!5441 V!27033)) )
))
(declare-datatypes ((List!16703 0))(
  ( (Nil!16700) (Cons!16699 (h!17836 tuple2!10860) (t!23336 List!16703)) )
))
(declare-datatypes ((ListLongMap!9631 0))(
  ( (ListLongMap!9632 (toList!4831 List!16703)) )
))
(declare-fun lt!386663 () ListLongMap!9631)

(declare-fun minValue!654 () V!27033)

(declare-fun zeroValue!654 () V!27033)

(declare-fun getCurrentListMapNoExtraKeys!2887 (array!49211 array!49213 (_ BitVec 32) (_ BitVec 32) V!27033 V!27033 (_ BitVec 32) Int) ListLongMap!9631)

(assert (=> b!858384 (= lt!386663 (getCurrentListMapNoExtraKeys!2887 _keys!868 lt!386665 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27033)

(assert (=> b!858384 (= lt!386665 (array!49214 (store (arr!23633 _values!688) i!612 (ValueCellFull!7805 v!557)) (size!24074 _values!688)))))

(declare-fun lt!386664 () ListLongMap!9631)

(assert (=> b!858384 (= lt!386664 (getCurrentListMapNoExtraKeys!2887 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26333 () Bool)

(declare-fun tp!50564 () Bool)

(declare-fun e!478504 () Bool)

(assert (=> mapNonEmpty!26333 (= mapRes!26333 (and tp!50564 e!478504))))

(declare-fun mapKey!26333 () (_ BitVec 32))

(declare-fun mapRest!26333 () (Array (_ BitVec 32) ValueCell!7805))

(declare-fun mapValue!26333 () ValueCell!7805)

(assert (=> mapNonEmpty!26333 (= (arr!23633 _values!688) (store mapRest!26333 mapKey!26333 mapValue!26333))))

(declare-fun b!858385 () Bool)

(declare-fun e!478500 () Bool)

(declare-fun e!478499 () Bool)

(assert (=> b!858385 (= e!478500 (and e!478499 mapRes!26333))))

(declare-fun condMapEmpty!26333 () Bool)

(declare-fun mapDefault!26333 () ValueCell!7805)

(assert (=> b!858385 (= condMapEmpty!26333 (= (arr!23633 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7805)) mapDefault!26333)))))

(declare-fun b!858387 () Bool)

(declare-fun res!582822 () Bool)

(assert (=> b!858387 (=> (not res!582822) (not e!478501))))

(declare-datatypes ((List!16704 0))(
  ( (Nil!16701) (Cons!16700 (h!17837 (_ BitVec 64)) (t!23337 List!16704)) )
))
(declare-fun arrayNoDuplicates!0 (array!49211 (_ BitVec 32) List!16704) Bool)

(assert (=> b!858387 (= res!582822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16701))))

(declare-fun b!858388 () Bool)

(declare-fun res!582820 () Bool)

(assert (=> b!858388 (=> (not res!582820) (not e!478501))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858388 (= res!582820 (validKeyInArray!0 k0!854))))

(declare-fun b!858389 () Bool)

(declare-fun res!582826 () Bool)

(assert (=> b!858389 (=> (not res!582826) (not e!478501))))

(assert (=> b!858389 (= res!582826 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24073 _keys!868))))))

(declare-fun b!858390 () Bool)

(assert (=> b!858390 (= e!478502 (not true))))

(declare-fun +!2241 (ListLongMap!9631 tuple2!10860) ListLongMap!9631)

(assert (=> b!858390 (= (getCurrentListMapNoExtraKeys!2887 _keys!868 lt!386665 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2241 (getCurrentListMapNoExtraKeys!2887 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10861 k0!854 v!557)))))

(declare-datatypes ((Unit!29238 0))(
  ( (Unit!29239) )
))
(declare-fun lt!386666 () Unit!29238)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 (array!49211 array!49213 (_ BitVec 32) (_ BitVec 32) V!27033 V!27033 (_ BitVec 32) (_ BitVec 64) V!27033 (_ BitVec 32) Int) Unit!29238)

(assert (=> b!858390 (= lt!386666 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!582821 () Bool)

(assert (=> start!73606 (=> (not res!582821) (not e!478501))))

(assert (=> start!73606 (= res!582821 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24073 _keys!868))))))

(assert (=> start!73606 e!478501))

(declare-fun tp_is_empty!16489 () Bool)

(assert (=> start!73606 tp_is_empty!16489))

(assert (=> start!73606 true))

(assert (=> start!73606 tp!50563))

(declare-fun array_inv!18768 (array!49211) Bool)

(assert (=> start!73606 (array_inv!18768 _keys!868)))

(declare-fun array_inv!18769 (array!49213) Bool)

(assert (=> start!73606 (and (array_inv!18769 _values!688) e!478500)))

(declare-fun b!858386 () Bool)

(declare-fun res!582819 () Bool)

(assert (=> b!858386 (=> (not res!582819) (not e!478501))))

(assert (=> b!858386 (= res!582819 (and (= (select (arr!23632 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858391 () Bool)

(assert (=> b!858391 (= e!478499 tp_is_empty!16489)))

(declare-fun b!858392 () Bool)

(assert (=> b!858392 (= e!478504 tp_is_empty!16489)))

(assert (= (and start!73606 res!582821) b!858383))

(assert (= (and b!858383 res!582824) b!858381))

(assert (= (and b!858381 res!582825) b!858382))

(assert (= (and b!858382 res!582823) b!858387))

(assert (= (and b!858387 res!582822) b!858389))

(assert (= (and b!858389 res!582826) b!858388))

(assert (= (and b!858388 res!582820) b!858386))

(assert (= (and b!858386 res!582819) b!858384))

(assert (= (and b!858384 res!582818) b!858390))

(assert (= (and b!858385 condMapEmpty!26333) mapIsEmpty!26333))

(assert (= (and b!858385 (not condMapEmpty!26333)) mapNonEmpty!26333))

(get-info :version)

(assert (= (and mapNonEmpty!26333 ((_ is ValueCellFull!7805) mapValue!26333)) b!858392))

(assert (= (and b!858385 ((_ is ValueCellFull!7805) mapDefault!26333)) b!858391))

(assert (= start!73606 b!858385))

(declare-fun m!799541 () Bool)

(assert (=> b!858383 m!799541))

(declare-fun m!799543 () Bool)

(assert (=> b!858387 m!799543))

(declare-fun m!799545 () Bool)

(assert (=> b!858388 m!799545))

(declare-fun m!799547 () Bool)

(assert (=> start!73606 m!799547))

(declare-fun m!799549 () Bool)

(assert (=> start!73606 m!799549))

(declare-fun m!799551 () Bool)

(assert (=> b!858390 m!799551))

(declare-fun m!799553 () Bool)

(assert (=> b!858390 m!799553))

(assert (=> b!858390 m!799553))

(declare-fun m!799555 () Bool)

(assert (=> b!858390 m!799555))

(declare-fun m!799557 () Bool)

(assert (=> b!858390 m!799557))

(declare-fun m!799559 () Bool)

(assert (=> b!858384 m!799559))

(declare-fun m!799561 () Bool)

(assert (=> b!858384 m!799561))

(declare-fun m!799563 () Bool)

(assert (=> b!858384 m!799563))

(declare-fun m!799565 () Bool)

(assert (=> b!858386 m!799565))

(declare-fun m!799567 () Bool)

(assert (=> mapNonEmpty!26333 m!799567))

(declare-fun m!799569 () Bool)

(assert (=> b!858382 m!799569))

(check-sat (not b!858390) (not b!858384) tp_is_empty!16489 (not b!858388) b_and!23719 (not mapNonEmpty!26333) (not b_next!14353) (not b!858382) (not b!858387) (not b!858383) (not start!73606))
(check-sat b_and!23719 (not b_next!14353))
