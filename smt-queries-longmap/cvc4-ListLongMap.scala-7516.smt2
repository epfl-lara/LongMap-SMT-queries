; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95318 () Bool)

(assert start!95318)

(declare-fun res!717699 () Bool)

(declare-fun e!615700 () Bool)

(assert (=> start!95318 (=> (not res!717699) (not e!615700))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95318 (= res!717699 (validMask!0 mask!1414))))

(assert (=> start!95318 e!615700))

(assert (=> start!95318 true))

(declare-datatypes ((V!39893 0))(
  ( (V!39894 (val!13094 Int)) )
))
(declare-datatypes ((ValueCell!12328 0))(
  ( (ValueCellFull!12328 (v!15713 V!39893)) (EmptyCell!12328) )
))
(declare-datatypes ((array!69097 0))(
  ( (array!69098 (arr!33231 (Array (_ BitVec 32) ValueCell!12328)) (size!33767 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69097)

(declare-fun e!615702 () Bool)

(declare-fun array_inv!25676 (array!69097) Bool)

(assert (=> start!95318 (and (array_inv!25676 _values!874) e!615702)))

(declare-datatypes ((array!69099 0))(
  ( (array!69100 (arr!33232 (Array (_ BitVec 32) (_ BitVec 64))) (size!33768 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69099)

(declare-fun array_inv!25677 (array!69099) Bool)

(assert (=> start!95318 (array_inv!25677 _keys!1070)))

(declare-fun b!1076992 () Bool)

(declare-fun e!615698 () Bool)

(declare-fun tp_is_empty!26075 () Bool)

(assert (=> b!1076992 (= e!615698 tp_is_empty!26075)))

(declare-fun mapIsEmpty!40840 () Bool)

(declare-fun mapRes!40840 () Bool)

(assert (=> mapIsEmpty!40840 mapRes!40840))

(declare-fun b!1076993 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1076993 (= e!615700 (and (= (size!33767 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33768 _keys!1070) (size!33767 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (not (= (size!33768 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun b!1076994 () Bool)

(declare-fun e!615699 () Bool)

(assert (=> b!1076994 (= e!615702 (and e!615699 mapRes!40840))))

(declare-fun condMapEmpty!40840 () Bool)

(declare-fun mapDefault!40840 () ValueCell!12328)

