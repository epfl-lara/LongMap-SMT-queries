; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95320 () Bool)

(assert start!95320)

(declare-fun mapIsEmpty!40843 () Bool)

(declare-fun mapRes!40843 () Bool)

(assert (=> mapIsEmpty!40843 mapRes!40843))

(declare-fun e!615715 () Bool)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1077004 () Bool)

(declare-datatypes ((array!69101 0))(
  ( (array!69102 (arr!33233 (Array (_ BitVec 32) (_ BitVec 64))) (size!33769 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69101)

(declare-datatypes ((V!39897 0))(
  ( (V!39898 (val!13095 Int)) )
))
(declare-datatypes ((ValueCell!12329 0))(
  ( (ValueCellFull!12329 (v!15714 V!39897)) (EmptyCell!12329) )
))
(declare-datatypes ((array!69103 0))(
  ( (array!69104 (arr!33234 (Array (_ BitVec 32) ValueCell!12329)) (size!33770 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69103)

(assert (=> b!1077004 (= e!615715 (and (= (size!33770 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33769 _keys!1070) (size!33770 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (= (size!33769 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33769 _keys!1070))))))

(declare-fun res!717702 () Bool)

(assert (=> start!95320 (=> (not res!717702) (not e!615715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95320 (= res!717702 (validMask!0 mask!1414))))

(assert (=> start!95320 e!615715))

(assert (=> start!95320 true))

(declare-fun e!615717 () Bool)

(declare-fun array_inv!25678 (array!69103) Bool)

(assert (=> start!95320 (and (array_inv!25678 _values!874) e!615717)))

(declare-fun array_inv!25679 (array!69101) Bool)

(assert (=> start!95320 (array_inv!25679 _keys!1070)))

(declare-fun mapNonEmpty!40843 () Bool)

(declare-fun tp!78305 () Bool)

(declare-fun e!615713 () Bool)

(assert (=> mapNonEmpty!40843 (= mapRes!40843 (and tp!78305 e!615713))))

(declare-fun mapKey!40843 () (_ BitVec 32))

(declare-fun mapRest!40843 () (Array (_ BitVec 32) ValueCell!12329))

(declare-fun mapValue!40843 () ValueCell!12329)

(assert (=> mapNonEmpty!40843 (= (arr!33234 _values!874) (store mapRest!40843 mapKey!40843 mapValue!40843))))

(declare-fun b!1077005 () Bool)

(declare-fun tp_is_empty!26077 () Bool)

(assert (=> b!1077005 (= e!615713 tp_is_empty!26077)))

(declare-fun b!1077006 () Bool)

(declare-fun e!615714 () Bool)

(assert (=> b!1077006 (= e!615717 (and e!615714 mapRes!40843))))

(declare-fun condMapEmpty!40843 () Bool)

(declare-fun mapDefault!40843 () ValueCell!12329)

