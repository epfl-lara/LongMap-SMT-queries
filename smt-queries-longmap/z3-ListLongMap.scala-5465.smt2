; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72576 () Bool)

(assert start!72576)

(declare-fun b!842513 () Bool)

(declare-fun res!572631 () Bool)

(declare-fun e!469942 () Bool)

(assert (=> b!842513 (=> (not res!572631) (not e!469942))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47528 0))(
  ( (array!47529 (arr!22795 (Array (_ BitVec 32) (_ BitVec 64))) (size!23235 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47528)

(declare-datatypes ((V!25883 0))(
  ( (V!25884 (val!7861 Int)) )
))
(declare-datatypes ((ValueCell!7374 0))(
  ( (ValueCellFull!7374 (v!10286 V!25883)) (EmptyCell!7374) )
))
(declare-datatypes ((array!47530 0))(
  ( (array!47531 (arr!22796 (Array (_ BitVec 32) ValueCell!7374)) (size!23236 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47530)

(assert (=> b!842513 (= res!572631 (and (= (size!23236 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23235 _keys!868) (size!23236 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842515 () Bool)

(assert (=> b!842515 (= e!469942 false)))

(declare-fun lt!381007 () Bool)

(declare-datatypes ((List!16213 0))(
  ( (Nil!16210) (Cons!16209 (h!17340 (_ BitVec 64)) (t!22584 List!16213)) )
))
(declare-fun arrayNoDuplicates!0 (array!47528 (_ BitVec 32) List!16213) Bool)

(assert (=> b!842515 (= lt!381007 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16210))))

(declare-fun mapIsEmpty!25040 () Bool)

(declare-fun mapRes!25040 () Bool)

(assert (=> mapIsEmpty!25040 mapRes!25040))

(declare-fun mapNonEmpty!25040 () Bool)

(declare-fun tp!48358 () Bool)

(declare-fun e!469939 () Bool)

(assert (=> mapNonEmpty!25040 (= mapRes!25040 (and tp!48358 e!469939))))

(declare-fun mapValue!25040 () ValueCell!7374)

(declare-fun mapRest!25040 () (Array (_ BitVec 32) ValueCell!7374))

(declare-fun mapKey!25040 () (_ BitVec 32))

(assert (=> mapNonEmpty!25040 (= (arr!22796 _values!688) (store mapRest!25040 mapKey!25040 mapValue!25040))))

(declare-fun b!842516 () Bool)

(declare-fun e!469940 () Bool)

(declare-fun tp_is_empty!15627 () Bool)

(assert (=> b!842516 (= e!469940 tp_is_empty!15627)))

(declare-fun b!842517 () Bool)

(declare-fun res!572633 () Bool)

(assert (=> b!842517 (=> (not res!572633) (not e!469942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842517 (= res!572633 (validMask!0 mask!1196))))

(declare-fun b!842518 () Bool)

(declare-fun e!469938 () Bool)

(assert (=> b!842518 (= e!469938 (and e!469940 mapRes!25040))))

(declare-fun condMapEmpty!25040 () Bool)

(declare-fun mapDefault!25040 () ValueCell!7374)

(assert (=> b!842518 (= condMapEmpty!25040 (= (arr!22796 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7374)) mapDefault!25040)))))

(declare-fun b!842519 () Bool)

(declare-fun res!572630 () Bool)

(assert (=> b!842519 (=> (not res!572630) (not e!469942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47528 (_ BitVec 32)) Bool)

(assert (=> b!842519 (= res!572630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842514 () Bool)

(assert (=> b!842514 (= e!469939 tp_is_empty!15627)))

(declare-fun res!572632 () Bool)

(assert (=> start!72576 (=> (not res!572632) (not e!469942))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72576 (= res!572632 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23235 _keys!868))))))

(assert (=> start!72576 e!469942))

(assert (=> start!72576 true))

(declare-fun array_inv!18140 (array!47528) Bool)

(assert (=> start!72576 (array_inv!18140 _keys!868)))

(declare-fun array_inv!18141 (array!47530) Bool)

(assert (=> start!72576 (and (array_inv!18141 _values!688) e!469938)))

(assert (= (and start!72576 res!572632) b!842517))

(assert (= (and b!842517 res!572633) b!842513))

(assert (= (and b!842513 res!572631) b!842519))

(assert (= (and b!842519 res!572630) b!842515))

(assert (= (and b!842518 condMapEmpty!25040) mapIsEmpty!25040))

(assert (= (and b!842518 (not condMapEmpty!25040)) mapNonEmpty!25040))

(get-info :version)

(assert (= (and mapNonEmpty!25040 ((_ is ValueCellFull!7374) mapValue!25040)) b!842514))

(assert (= (and b!842518 ((_ is ValueCellFull!7374) mapDefault!25040)) b!842516))

(assert (= start!72576 b!842518))

(declare-fun m!785589 () Bool)

(assert (=> mapNonEmpty!25040 m!785589))

(declare-fun m!785591 () Bool)

(assert (=> b!842515 m!785591))

(declare-fun m!785593 () Bool)

(assert (=> start!72576 m!785593))

(declare-fun m!785595 () Bool)

(assert (=> start!72576 m!785595))

(declare-fun m!785597 () Bool)

(assert (=> b!842519 m!785597))

(declare-fun m!785599 () Bool)

(assert (=> b!842517 m!785599))

(check-sat (not mapNonEmpty!25040) tp_is_empty!15627 (not start!72576) (not b!842517) (not b!842515) (not b!842519))
(check-sat)
