; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95398 () Bool)

(assert start!95398)

(declare-fun b!1077440 () Bool)

(declare-fun e!616067 () Bool)

(declare-fun tp_is_empty!26111 () Bool)

(assert (=> b!1077440 (= e!616067 tp_is_empty!26111)))

(declare-fun b!1077441 () Bool)

(declare-fun res!717922 () Bool)

(declare-fun e!616064 () Bool)

(assert (=> b!1077441 (=> (not res!717922) (not e!616064))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69175 0))(
  ( (array!69176 (arr!33265 (Array (_ BitVec 32) (_ BitVec 64))) (size!33801 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69175)

(declare-datatypes ((V!39941 0))(
  ( (V!39942 (val!13112 Int)) )
))
(declare-datatypes ((ValueCell!12346 0))(
  ( (ValueCellFull!12346 (v!15732 V!39941)) (EmptyCell!12346) )
))
(declare-datatypes ((array!69177 0))(
  ( (array!69178 (arr!33266 (Array (_ BitVec 32) ValueCell!12346)) (size!33802 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69177)

(assert (=> b!1077441 (= res!717922 (and (= (size!33802 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33801 _keys!1070) (size!33802 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!717923 () Bool)

(assert (=> start!95398 (=> (not res!717923) (not e!616064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95398 (= res!717923 (validMask!0 mask!1414))))

(assert (=> start!95398 e!616064))

(assert (=> start!95398 true))

(declare-fun e!616065 () Bool)

(declare-fun array_inv!25700 (array!69177) Bool)

(assert (=> start!95398 (and (array_inv!25700 _values!874) e!616065)))

(declare-fun array_inv!25701 (array!69175) Bool)

(assert (=> start!95398 (array_inv!25701 _keys!1070)))

(declare-fun b!1077442 () Bool)

(declare-fun e!616066 () Bool)

(assert (=> b!1077442 (= e!616066 tp_is_empty!26111)))

(declare-fun mapIsEmpty!40909 () Bool)

(declare-fun mapRes!40909 () Bool)

(assert (=> mapIsEmpty!40909 mapRes!40909))

(declare-fun b!1077443 () Bool)

(declare-fun res!717921 () Bool)

(assert (=> b!1077443 (=> (not res!717921) (not e!616064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69175 (_ BitVec 32)) Bool)

(assert (=> b!1077443 (= res!717921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077444 () Bool)

(assert (=> b!1077444 (= e!616065 (and e!616067 mapRes!40909))))

(declare-fun condMapEmpty!40909 () Bool)

(declare-fun mapDefault!40909 () ValueCell!12346)

