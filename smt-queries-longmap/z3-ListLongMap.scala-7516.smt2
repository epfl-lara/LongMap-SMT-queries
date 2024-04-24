; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95550 () Bool)

(assert start!95550)

(declare-fun res!718215 () Bool)

(declare-fun e!616523 () Bool)

(assert (=> start!95550 (=> (not res!718215) (not e!616523))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95550 (= res!718215 (validMask!0 mask!1414))))

(assert (=> start!95550 e!616523))

(assert (=> start!95550 true))

(declare-datatypes ((V!39889 0))(
  ( (V!39890 (val!13092 Int)) )
))
(declare-datatypes ((ValueCell!12326 0))(
  ( (ValueCellFull!12326 (v!15707 V!39889)) (EmptyCell!12326) )
))
(declare-datatypes ((array!69133 0))(
  ( (array!69134 (arr!33243 (Array (_ BitVec 32) ValueCell!12326)) (size!33780 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69133)

(declare-fun e!616526 () Bool)

(declare-fun array_inv!25728 (array!69133) Bool)

(assert (=> start!95550 (and (array_inv!25728 _values!874) e!616526)))

(declare-datatypes ((array!69135 0))(
  ( (array!69136 (arr!33244 (Array (_ BitVec 32) (_ BitVec 64))) (size!33781 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69135)

(declare-fun array_inv!25729 (array!69135) Bool)

(assert (=> start!95550 (array_inv!25729 _keys!1070)))

(declare-fun b!1078295 () Bool)

(declare-fun e!616527 () Bool)

(declare-fun tp_is_empty!26071 () Bool)

(assert (=> b!1078295 (= e!616527 tp_is_empty!26071)))

(declare-fun b!1078296 () Bool)

(declare-fun mapRes!40834 () Bool)

(assert (=> b!1078296 (= e!616526 (and e!616527 mapRes!40834))))

(declare-fun condMapEmpty!40834 () Bool)

(declare-fun mapDefault!40834 () ValueCell!12326)

(assert (=> b!1078296 (= condMapEmpty!40834 (= (arr!33243 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12326)) mapDefault!40834)))))

(declare-fun b!1078297 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078297 (= e!616523 (and (= (size!33780 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33781 _keys!1070) (size!33780 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (not (= (size!33781 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun mapIsEmpty!40834 () Bool)

(assert (=> mapIsEmpty!40834 mapRes!40834))

(declare-fun mapNonEmpty!40834 () Bool)

(declare-fun tp!78296 () Bool)

(declare-fun e!616524 () Bool)

(assert (=> mapNonEmpty!40834 (= mapRes!40834 (and tp!78296 e!616524))))

(declare-fun mapValue!40834 () ValueCell!12326)

(declare-fun mapRest!40834 () (Array (_ BitVec 32) ValueCell!12326))

(declare-fun mapKey!40834 () (_ BitVec 32))

(assert (=> mapNonEmpty!40834 (= (arr!33243 _values!874) (store mapRest!40834 mapKey!40834 mapValue!40834))))

(declare-fun b!1078298 () Bool)

(assert (=> b!1078298 (= e!616524 tp_is_empty!26071)))

(assert (= (and start!95550 res!718215) b!1078297))

(assert (= (and b!1078296 condMapEmpty!40834) mapIsEmpty!40834))

(assert (= (and b!1078296 (not condMapEmpty!40834)) mapNonEmpty!40834))

(get-info :version)

(assert (= (and mapNonEmpty!40834 ((_ is ValueCellFull!12326) mapValue!40834)) b!1078298))

(assert (= (and b!1078296 ((_ is ValueCellFull!12326) mapDefault!40834)) b!1078295))

(assert (= start!95550 b!1078296))

(declare-fun m!997679 () Bool)

(assert (=> start!95550 m!997679))

(declare-fun m!997681 () Bool)

(assert (=> start!95550 m!997681))

(declare-fun m!997683 () Bool)

(assert (=> start!95550 m!997683))

(declare-fun m!997685 () Bool)

(assert (=> mapNonEmpty!40834 m!997685))

(check-sat (not start!95550) (not mapNonEmpty!40834) tp_is_empty!26071)
(check-sat)
