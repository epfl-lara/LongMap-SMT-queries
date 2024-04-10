; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72774 () Bool)

(assert start!72774)

(declare-fun b!844592 () Bool)

(declare-fun e!471425 () Bool)

(declare-fun tp_is_empty!15825 () Bool)

(assert (=> b!844592 (= e!471425 tp_is_empty!15825)))

(declare-fun b!844593 () Bool)

(declare-fun e!471423 () Bool)

(assert (=> b!844593 (= e!471423 false)))

(declare-fun lt!381304 () Bool)

(declare-datatypes ((array!47880 0))(
  ( (array!47881 (arr!22971 (Array (_ BitVec 32) (_ BitVec 64))) (size!23411 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47880)

(declare-datatypes ((List!16277 0))(
  ( (Nil!16274) (Cons!16273 (h!17404 (_ BitVec 64)) (t!22648 List!16277)) )
))
(declare-fun arrayNoDuplicates!0 (array!47880 (_ BitVec 32) List!16277) Bool)

(assert (=> b!844593 (= lt!381304 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16274))))

(declare-fun b!844594 () Bool)

(declare-fun res!573820 () Bool)

(assert (=> b!844594 (=> (not res!573820) (not e!471423))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26147 0))(
  ( (V!26148 (val!7960 Int)) )
))
(declare-datatypes ((ValueCell!7473 0))(
  ( (ValueCellFull!7473 (v!10385 V!26147)) (EmptyCell!7473) )
))
(declare-datatypes ((array!47882 0))(
  ( (array!47883 (arr!22972 (Array (_ BitVec 32) ValueCell!7473)) (size!23412 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47882)

(assert (=> b!844594 (= res!573820 (and (= (size!23412 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23411 _keys!868) (size!23412 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573819 () Bool)

(assert (=> start!72774 (=> (not res!573819) (not e!471423))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72774 (= res!573819 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23411 _keys!868))))))

(assert (=> start!72774 e!471423))

(assert (=> start!72774 true))

(declare-fun array_inv!18264 (array!47880) Bool)

(assert (=> start!72774 (array_inv!18264 _keys!868)))

(declare-fun e!471426 () Bool)

(declare-fun array_inv!18265 (array!47882) Bool)

(assert (=> start!72774 (and (array_inv!18265 _values!688) e!471426)))

(declare-fun mapNonEmpty!25337 () Bool)

(declare-fun mapRes!25337 () Bool)

(declare-fun tp!48655 () Bool)

(assert (=> mapNonEmpty!25337 (= mapRes!25337 (and tp!48655 e!471425))))

(declare-fun mapValue!25337 () ValueCell!7473)

(declare-fun mapRest!25337 () (Array (_ BitVec 32) ValueCell!7473))

(declare-fun mapKey!25337 () (_ BitVec 32))

(assert (=> mapNonEmpty!25337 (= (arr!22972 _values!688) (store mapRest!25337 mapKey!25337 mapValue!25337))))

(declare-fun b!844595 () Bool)

(declare-fun res!573821 () Bool)

(assert (=> b!844595 (=> (not res!573821) (not e!471423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844595 (= res!573821 (validMask!0 mask!1196))))

(declare-fun b!844596 () Bool)

(declare-fun res!573818 () Bool)

(assert (=> b!844596 (=> (not res!573818) (not e!471423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47880 (_ BitVec 32)) Bool)

(assert (=> b!844596 (= res!573818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844597 () Bool)

(declare-fun e!471424 () Bool)

(assert (=> b!844597 (= e!471426 (and e!471424 mapRes!25337))))

(declare-fun condMapEmpty!25337 () Bool)

(declare-fun mapDefault!25337 () ValueCell!7473)

(assert (=> b!844597 (= condMapEmpty!25337 (= (arr!22972 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7473)) mapDefault!25337)))))

(declare-fun b!844598 () Bool)

(assert (=> b!844598 (= e!471424 tp_is_empty!15825)))

(declare-fun mapIsEmpty!25337 () Bool)

(assert (=> mapIsEmpty!25337 mapRes!25337))

(assert (= (and start!72774 res!573819) b!844595))

(assert (= (and b!844595 res!573821) b!844594))

(assert (= (and b!844594 res!573820) b!844596))

(assert (= (and b!844596 res!573818) b!844593))

(assert (= (and b!844597 condMapEmpty!25337) mapIsEmpty!25337))

(assert (= (and b!844597 (not condMapEmpty!25337)) mapNonEmpty!25337))

(get-info :version)

(assert (= (and mapNonEmpty!25337 ((_ is ValueCellFull!7473) mapValue!25337)) b!844592))

(assert (= (and b!844597 ((_ is ValueCellFull!7473) mapDefault!25337)) b!844598))

(assert (= start!72774 b!844597))

(declare-fun m!786777 () Bool)

(assert (=> b!844596 m!786777))

(declare-fun m!786779 () Bool)

(assert (=> b!844593 m!786779))

(declare-fun m!786781 () Bool)

(assert (=> mapNonEmpty!25337 m!786781))

(declare-fun m!786783 () Bool)

(assert (=> start!72774 m!786783))

(declare-fun m!786785 () Bool)

(assert (=> start!72774 m!786785))

(declare-fun m!786787 () Bool)

(assert (=> b!844595 m!786787))

(check-sat (not mapNonEmpty!25337) tp_is_empty!15825 (not b!844596) (not b!844593) (not b!844595) (not start!72774))
(check-sat)
