; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95308 () Bool)

(assert start!95308)

(declare-fun res!717624 () Bool)

(declare-fun e!615575 () Bool)

(assert (=> start!95308 (=> (not res!717624) (not e!615575))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95308 (= res!717624 (validMask!0 mask!1414))))

(assert (=> start!95308 e!615575))

(assert (=> start!95308 true))

(declare-datatypes ((V!39889 0))(
  ( (V!39890 (val!13092 Int)) )
))
(declare-datatypes ((ValueCell!12326 0))(
  ( (ValueCellFull!12326 (v!15710 V!39889)) (EmptyCell!12326) )
))
(declare-datatypes ((array!69024 0))(
  ( (array!69025 (arr!33195 (Array (_ BitVec 32) ValueCell!12326)) (size!33733 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69024)

(declare-fun e!615578 () Bool)

(declare-fun array_inv!25676 (array!69024) Bool)

(assert (=> start!95308 (and (array_inv!25676 _values!874) e!615578)))

(declare-datatypes ((array!69026 0))(
  ( (array!69027 (arr!33196 (Array (_ BitVec 32) (_ BitVec 64))) (size!33734 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69026)

(declare-fun array_inv!25677 (array!69026) Bool)

(assert (=> start!95308 (array_inv!25677 _keys!1070)))

(declare-fun b!1076815 () Bool)

(declare-fun e!615576 () Bool)

(declare-fun tp_is_empty!26071 () Bool)

(assert (=> b!1076815 (= e!615576 tp_is_empty!26071)))

(declare-fun b!1076816 () Bool)

(declare-fun mapRes!40834 () Bool)

(assert (=> b!1076816 (= e!615578 (and e!615576 mapRes!40834))))

(declare-fun condMapEmpty!40834 () Bool)

(declare-fun mapDefault!40834 () ValueCell!12326)

(assert (=> b!1076816 (= condMapEmpty!40834 (= (arr!33195 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12326)) mapDefault!40834)))))

(declare-fun mapNonEmpty!40834 () Bool)

(declare-fun tp!78296 () Bool)

(declare-fun e!615579 () Bool)

(assert (=> mapNonEmpty!40834 (= mapRes!40834 (and tp!78296 e!615579))))

(declare-fun mapRest!40834 () (Array (_ BitVec 32) ValueCell!12326))

(declare-fun mapValue!40834 () ValueCell!12326)

(declare-fun mapKey!40834 () (_ BitVec 32))

(assert (=> mapNonEmpty!40834 (= (arr!33195 _values!874) (store mapRest!40834 mapKey!40834 mapValue!40834))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1076817 () Bool)

(assert (=> b!1076817 (= e!615575 (and (= (size!33733 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33734 _keys!1070) (size!33733 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (not (= (size!33734 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun mapIsEmpty!40834 () Bool)

(assert (=> mapIsEmpty!40834 mapRes!40834))

(declare-fun b!1076818 () Bool)

(assert (=> b!1076818 (= e!615579 tp_is_empty!26071)))

(assert (= (and start!95308 res!717624) b!1076817))

(assert (= (and b!1076816 condMapEmpty!40834) mapIsEmpty!40834))

(assert (= (and b!1076816 (not condMapEmpty!40834)) mapNonEmpty!40834))

(get-info :version)

(assert (= (and mapNonEmpty!40834 ((_ is ValueCellFull!12326) mapValue!40834)) b!1076818))

(assert (= (and b!1076816 ((_ is ValueCellFull!12326) mapDefault!40834)) b!1076815))

(assert (= start!95308 b!1076816))

(declare-fun m!995381 () Bool)

(assert (=> start!95308 m!995381))

(declare-fun m!995383 () Bool)

(assert (=> start!95308 m!995383))

(declare-fun m!995385 () Bool)

(assert (=> start!95308 m!995385))

(declare-fun m!995387 () Bool)

(assert (=> mapNonEmpty!40834 m!995387))

(check-sat (not start!95308) (not mapNonEmpty!40834) tp_is_empty!26071)
(check-sat)
