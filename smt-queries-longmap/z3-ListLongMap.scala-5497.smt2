; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72768 () Bool)

(assert start!72768)

(declare-fun b!844529 () Bool)

(declare-fun e!471382 () Bool)

(declare-fun tp_is_empty!15819 () Bool)

(assert (=> b!844529 (= e!471382 tp_is_empty!15819)))

(declare-fun b!844530 () Bool)

(declare-fun res!573782 () Bool)

(declare-fun e!471381 () Bool)

(assert (=> b!844530 (=> (not res!573782) (not e!471381))))

(declare-datatypes ((array!47868 0))(
  ( (array!47869 (arr!22965 (Array (_ BitVec 32) (_ BitVec 64))) (size!23405 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47868)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47868 (_ BitVec 32)) Bool)

(assert (=> b!844530 (= res!573782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844531 () Bool)

(declare-fun res!573783 () Bool)

(assert (=> b!844531 (=> (not res!573783) (not e!471381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844531 (= res!573783 (validMask!0 mask!1196))))

(declare-fun b!844532 () Bool)

(declare-fun e!471380 () Bool)

(assert (=> b!844532 (= e!471380 tp_is_empty!15819)))

(declare-fun b!844533 () Bool)

(declare-fun e!471378 () Bool)

(declare-fun mapRes!25328 () Bool)

(assert (=> b!844533 (= e!471378 (and e!471382 mapRes!25328))))

(declare-fun condMapEmpty!25328 () Bool)

(declare-datatypes ((V!26139 0))(
  ( (V!26140 (val!7957 Int)) )
))
(declare-datatypes ((ValueCell!7470 0))(
  ( (ValueCellFull!7470 (v!10382 V!26139)) (EmptyCell!7470) )
))
(declare-datatypes ((array!47870 0))(
  ( (array!47871 (arr!22966 (Array (_ BitVec 32) ValueCell!7470)) (size!23406 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47870)

(declare-fun mapDefault!25328 () ValueCell!7470)

(assert (=> b!844533 (= condMapEmpty!25328 (= (arr!22966 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7470)) mapDefault!25328)))))

(declare-fun mapIsEmpty!25328 () Bool)

(assert (=> mapIsEmpty!25328 mapRes!25328))

(declare-fun res!573785 () Bool)

(assert (=> start!72768 (=> (not res!573785) (not e!471381))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72768 (= res!573785 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23405 _keys!868))))))

(assert (=> start!72768 e!471381))

(assert (=> start!72768 true))

(declare-fun array_inv!18262 (array!47868) Bool)

(assert (=> start!72768 (array_inv!18262 _keys!868)))

(declare-fun array_inv!18263 (array!47870) Bool)

(assert (=> start!72768 (and (array_inv!18263 _values!688) e!471378)))

(declare-fun b!844534 () Bool)

(assert (=> b!844534 (= e!471381 false)))

(declare-fun lt!381295 () Bool)

(declare-datatypes ((List!16275 0))(
  ( (Nil!16272) (Cons!16271 (h!17402 (_ BitVec 64)) (t!22646 List!16275)) )
))
(declare-fun arrayNoDuplicates!0 (array!47868 (_ BitVec 32) List!16275) Bool)

(assert (=> b!844534 (= lt!381295 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16272))))

(declare-fun b!844535 () Bool)

(declare-fun res!573784 () Bool)

(assert (=> b!844535 (=> (not res!573784) (not e!471381))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844535 (= res!573784 (and (= (size!23406 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23405 _keys!868) (size!23406 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25328 () Bool)

(declare-fun tp!48646 () Bool)

(assert (=> mapNonEmpty!25328 (= mapRes!25328 (and tp!48646 e!471380))))

(declare-fun mapKey!25328 () (_ BitVec 32))

(declare-fun mapRest!25328 () (Array (_ BitVec 32) ValueCell!7470))

(declare-fun mapValue!25328 () ValueCell!7470)

(assert (=> mapNonEmpty!25328 (= (arr!22966 _values!688) (store mapRest!25328 mapKey!25328 mapValue!25328))))

(assert (= (and start!72768 res!573785) b!844531))

(assert (= (and b!844531 res!573783) b!844535))

(assert (= (and b!844535 res!573784) b!844530))

(assert (= (and b!844530 res!573782) b!844534))

(assert (= (and b!844533 condMapEmpty!25328) mapIsEmpty!25328))

(assert (= (and b!844533 (not condMapEmpty!25328)) mapNonEmpty!25328))

(get-info :version)

(assert (= (and mapNonEmpty!25328 ((_ is ValueCellFull!7470) mapValue!25328)) b!844532))

(assert (= (and b!844533 ((_ is ValueCellFull!7470) mapDefault!25328)) b!844529))

(assert (= start!72768 b!844533))

(declare-fun m!786741 () Bool)

(assert (=> b!844530 m!786741))

(declare-fun m!786743 () Bool)

(assert (=> mapNonEmpty!25328 m!786743))

(declare-fun m!786745 () Bool)

(assert (=> start!72768 m!786745))

(declare-fun m!786747 () Bool)

(assert (=> start!72768 m!786747))

(declare-fun m!786749 () Bool)

(assert (=> b!844534 m!786749))

(declare-fun m!786751 () Bool)

(assert (=> b!844531 m!786751))

(check-sat (not b!844531) tp_is_empty!15819 (not mapNonEmpty!25328) (not b!844530) (not start!72768) (not b!844534))
(check-sat)
