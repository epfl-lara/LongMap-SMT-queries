; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72544 () Bool)

(assert start!72544)

(declare-fun b!842127 () Bool)

(declare-fun e!469687 () Bool)

(assert (=> b!842127 (= e!469687 false)))

(declare-fun lt!380750 () Bool)

(declare-datatypes ((array!47479 0))(
  ( (array!47480 (arr!22771 (Array (_ BitVec 32) (_ BitVec 64))) (size!23213 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47479)

(declare-datatypes ((List!16222 0))(
  ( (Nil!16219) (Cons!16218 (h!17349 (_ BitVec 64)) (t!22584 List!16222)) )
))
(declare-fun arrayNoDuplicates!0 (array!47479 (_ BitVec 32) List!16222) Bool)

(assert (=> b!842127 (= lt!380750 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16219))))

(declare-fun b!842128 () Bool)

(declare-fun e!469689 () Bool)

(declare-fun tp_is_empty!15613 () Bool)

(assert (=> b!842128 (= e!469689 tp_is_empty!15613)))

(declare-fun res!572436 () Bool)

(assert (=> start!72544 (=> (not res!572436) (not e!469687))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72544 (= res!572436 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23213 _keys!868))))))

(assert (=> start!72544 e!469687))

(assert (=> start!72544 true))

(declare-fun array_inv!18194 (array!47479) Bool)

(assert (=> start!72544 (array_inv!18194 _keys!868)))

(declare-datatypes ((V!25865 0))(
  ( (V!25866 (val!7854 Int)) )
))
(declare-datatypes ((ValueCell!7367 0))(
  ( (ValueCellFull!7367 (v!10273 V!25865)) (EmptyCell!7367) )
))
(declare-datatypes ((array!47481 0))(
  ( (array!47482 (arr!22772 (Array (_ BitVec 32) ValueCell!7367)) (size!23214 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47481)

(declare-fun e!469686 () Bool)

(declare-fun array_inv!18195 (array!47481) Bool)

(assert (=> start!72544 (and (array_inv!18195 _values!688) e!469686)))

(declare-fun b!842129 () Bool)

(declare-fun e!469685 () Bool)

(assert (=> b!842129 (= e!469685 tp_is_empty!15613)))

(declare-fun b!842130 () Bool)

(declare-fun mapRes!25019 () Bool)

(assert (=> b!842130 (= e!469686 (and e!469689 mapRes!25019))))

(declare-fun condMapEmpty!25019 () Bool)

(declare-fun mapDefault!25019 () ValueCell!7367)

(assert (=> b!842130 (= condMapEmpty!25019 (= (arr!22772 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7367)) mapDefault!25019)))))

(declare-fun mapNonEmpty!25019 () Bool)

(declare-fun tp!48338 () Bool)

(assert (=> mapNonEmpty!25019 (= mapRes!25019 (and tp!48338 e!469685))))

(declare-fun mapKey!25019 () (_ BitVec 32))

(declare-fun mapValue!25019 () ValueCell!7367)

(declare-fun mapRest!25019 () (Array (_ BitVec 32) ValueCell!7367))

(assert (=> mapNonEmpty!25019 (= (arr!22772 _values!688) (store mapRest!25019 mapKey!25019 mapValue!25019))))

(declare-fun b!842131 () Bool)

(declare-fun res!572438 () Bool)

(assert (=> b!842131 (=> (not res!572438) (not e!469687))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47479 (_ BitVec 32)) Bool)

(assert (=> b!842131 (= res!572438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842132 () Bool)

(declare-fun res!572439 () Bool)

(assert (=> b!842132 (=> (not res!572439) (not e!469687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842132 (= res!572439 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25019 () Bool)

(assert (=> mapIsEmpty!25019 mapRes!25019))

(declare-fun b!842133 () Bool)

(declare-fun res!572437 () Bool)

(assert (=> b!842133 (=> (not res!572437) (not e!469687))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842133 (= res!572437 (and (= (size!23214 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23213 _keys!868) (size!23214 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72544 res!572436) b!842132))

(assert (= (and b!842132 res!572439) b!842133))

(assert (= (and b!842133 res!572437) b!842131))

(assert (= (and b!842131 res!572438) b!842127))

(assert (= (and b!842130 condMapEmpty!25019) mapIsEmpty!25019))

(assert (= (and b!842130 (not condMapEmpty!25019)) mapNonEmpty!25019))

(get-info :version)

(assert (= (and mapNonEmpty!25019 ((_ is ValueCellFull!7367) mapValue!25019)) b!842129))

(assert (= (and b!842130 ((_ is ValueCellFull!7367) mapDefault!25019)) b!842128))

(assert (= start!72544 b!842130))

(declare-fun m!784751 () Bool)

(assert (=> mapNonEmpty!25019 m!784751))

(declare-fun m!784753 () Bool)

(assert (=> b!842131 m!784753))

(declare-fun m!784755 () Bool)

(assert (=> start!72544 m!784755))

(declare-fun m!784757 () Bool)

(assert (=> start!72544 m!784757))

(declare-fun m!784759 () Bool)

(assert (=> b!842127 m!784759))

(declare-fun m!784761 () Bool)

(assert (=> b!842132 m!784761))

(check-sat (not b!842127) (not b!842132) (not mapNonEmpty!25019) (not start!72544) tp_is_empty!15613 (not b!842131))
(check-sat)
