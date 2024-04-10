; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95316 () Bool)

(assert start!95316)

(declare-fun b!1076980 () Bool)

(declare-fun e!615685 () Bool)

(declare-fun tp_is_empty!26073 () Bool)

(assert (=> b!1076980 (= e!615685 tp_is_empty!26073)))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1076981 () Bool)

(declare-fun e!615687 () Bool)

(declare-datatypes ((array!69093 0))(
  ( (array!69094 (arr!33229 (Array (_ BitVec 32) (_ BitVec 64))) (size!33765 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69093)

(declare-datatypes ((V!39891 0))(
  ( (V!39892 (val!13093 Int)) )
))
(declare-datatypes ((ValueCell!12327 0))(
  ( (ValueCellFull!12327 (v!15712 V!39891)) (EmptyCell!12327) )
))
(declare-datatypes ((array!69095 0))(
  ( (array!69096 (arr!33230 (Array (_ BitVec 32) ValueCell!12327)) (size!33766 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69095)

(assert (=> b!1076981 (= e!615687 (and (= (size!33766 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33765 _keys!1070) (size!33766 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (not (= (size!33765 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun mapNonEmpty!40837 () Bool)

(declare-fun mapRes!40837 () Bool)

(declare-fun tp!78299 () Bool)

(declare-fun e!615684 () Bool)

(assert (=> mapNonEmpty!40837 (= mapRes!40837 (and tp!78299 e!615684))))

(declare-fun mapRest!40837 () (Array (_ BitVec 32) ValueCell!12327))

(declare-fun mapValue!40837 () ValueCell!12327)

(declare-fun mapKey!40837 () (_ BitVec 32))

(assert (=> mapNonEmpty!40837 (= (arr!33230 _values!874) (store mapRest!40837 mapKey!40837 mapValue!40837))))

(declare-fun b!1076982 () Bool)

(declare-fun e!615683 () Bool)

(assert (=> b!1076982 (= e!615683 (and e!615685 mapRes!40837))))

(declare-fun condMapEmpty!40837 () Bool)

(declare-fun mapDefault!40837 () ValueCell!12327)

(assert (=> b!1076982 (= condMapEmpty!40837 (= (arr!33230 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12327)) mapDefault!40837)))))

(declare-fun b!1076983 () Bool)

(assert (=> b!1076983 (= e!615684 tp_is_empty!26073)))

(declare-fun res!717696 () Bool)

(assert (=> start!95316 (=> (not res!717696) (not e!615687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95316 (= res!717696 (validMask!0 mask!1414))))

(assert (=> start!95316 e!615687))

(assert (=> start!95316 true))

(declare-fun array_inv!25674 (array!69095) Bool)

(assert (=> start!95316 (and (array_inv!25674 _values!874) e!615683)))

(declare-fun array_inv!25675 (array!69093) Bool)

(assert (=> start!95316 (array_inv!25675 _keys!1070)))

(declare-fun mapIsEmpty!40837 () Bool)

(assert (=> mapIsEmpty!40837 mapRes!40837))

(assert (= (and start!95316 res!717696) b!1076981))

(assert (= (and b!1076982 condMapEmpty!40837) mapIsEmpty!40837))

(assert (= (and b!1076982 (not condMapEmpty!40837)) mapNonEmpty!40837))

(get-info :version)

(assert (= (and mapNonEmpty!40837 ((_ is ValueCellFull!12327) mapValue!40837)) b!1076983))

(assert (= (and b!1076982 ((_ is ValueCellFull!12327) mapDefault!40837)) b!1076980))

(assert (= start!95316 b!1076982))

(declare-fun m!996015 () Bool)

(assert (=> mapNonEmpty!40837 m!996015))

(declare-fun m!996017 () Bool)

(assert (=> start!95316 m!996017))

(declare-fun m!996019 () Bool)

(assert (=> start!95316 m!996019))

(declare-fun m!996021 () Bool)

(assert (=> start!95316 m!996021))

(check-sat (not start!95316) (not mapNonEmpty!40837) tp_is_empty!26073)
(check-sat)
