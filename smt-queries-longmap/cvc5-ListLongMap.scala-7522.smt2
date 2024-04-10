; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95394 () Bool)

(assert start!95394)

(declare-fun res!717904 () Bool)

(declare-fun e!616036 () Bool)

(assert (=> start!95394 (=> (not res!717904) (not e!616036))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95394 (= res!717904 (validMask!0 mask!1414))))

(assert (=> start!95394 e!616036))

(assert (=> start!95394 true))

(declare-datatypes ((V!39937 0))(
  ( (V!39938 (val!13110 Int)) )
))
(declare-datatypes ((ValueCell!12344 0))(
  ( (ValueCellFull!12344 (v!15730 V!39937)) (EmptyCell!12344) )
))
(declare-datatypes ((array!69167 0))(
  ( (array!69168 (arr!33261 (Array (_ BitVec 32) ValueCell!12344)) (size!33797 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69167)

(declare-fun e!616033 () Bool)

(declare-fun array_inv!25696 (array!69167) Bool)

(assert (=> start!95394 (and (array_inv!25696 _values!874) e!616033)))

(declare-datatypes ((array!69169 0))(
  ( (array!69170 (arr!33262 (Array (_ BitVec 32) (_ BitVec 64))) (size!33798 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69169)

(declare-fun array_inv!25697 (array!69169) Bool)

(assert (=> start!95394 (array_inv!25697 _keys!1070)))

(declare-fun b!1077404 () Bool)

(declare-fun res!717903 () Bool)

(assert (=> b!1077404 (=> (not res!717903) (not e!616036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69169 (_ BitVec 32)) Bool)

(assert (=> b!1077404 (= res!717903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077405 () Bool)

(declare-fun res!717905 () Bool)

(assert (=> b!1077405 (=> (not res!717905) (not e!616036))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077405 (= res!717905 (and (= (size!33797 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33798 _keys!1070) (size!33797 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077406 () Bool)

(declare-fun e!616037 () Bool)

(declare-fun tp_is_empty!26107 () Bool)

(assert (=> b!1077406 (= e!616037 tp_is_empty!26107)))

(declare-fun mapIsEmpty!40903 () Bool)

(declare-fun mapRes!40903 () Bool)

(assert (=> mapIsEmpty!40903 mapRes!40903))

(declare-fun b!1077407 () Bool)

(assert (=> b!1077407 (= e!616033 (and e!616037 mapRes!40903))))

(declare-fun condMapEmpty!40903 () Bool)

(declare-fun mapDefault!40903 () ValueCell!12344)

