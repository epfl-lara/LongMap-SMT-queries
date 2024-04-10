; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95416 () Bool)

(assert start!95416)

(declare-fun b!1077653 () Bool)

(declare-fun res!718054 () Bool)

(declare-fun e!616201 () Bool)

(assert (=> b!1077653 (=> (not res!718054) (not e!616201))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077653 (= res!718054 (validKeyInArray!0 k!904))))

(declare-datatypes ((array!69207 0))(
  ( (array!69208 (arr!33281 (Array (_ BitVec 32) (_ BitVec 64))) (size!33817 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69207)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun b!1077654 () Bool)

(assert (=> b!1077654 (= e!616201 (and (= (select (arr!33281 _keys!1070) i!650) k!904) (= (size!33817 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33817 _keys!1070))))))

(declare-fun b!1077655 () Bool)

(declare-fun res!718056 () Bool)

(assert (=> b!1077655 (=> (not res!718056) (not e!616201))))

(assert (=> b!1077655 (= res!718056 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33817 _keys!1070))))))

(declare-fun mapIsEmpty!40936 () Bool)

(declare-fun mapRes!40936 () Bool)

(assert (=> mapIsEmpty!40936 mapRes!40936))

(declare-fun b!1077656 () Bool)

(declare-fun res!718053 () Bool)

(assert (=> b!1077656 (=> (not res!718053) (not e!616201))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39965 0))(
  ( (V!39966 (val!13121 Int)) )
))
(declare-datatypes ((ValueCell!12355 0))(
  ( (ValueCellFull!12355 (v!15741 V!39965)) (EmptyCell!12355) )
))
(declare-datatypes ((array!69209 0))(
  ( (array!69210 (arr!33282 (Array (_ BitVec 32) ValueCell!12355)) (size!33818 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69209)

(assert (=> b!1077656 (= res!718053 (and (= (size!33818 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33817 _keys!1070) (size!33818 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!718055 () Bool)

(assert (=> start!95416 (=> (not res!718055) (not e!616201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95416 (= res!718055 (validMask!0 mask!1414))))

(assert (=> start!95416 e!616201))

(assert (=> start!95416 true))

(declare-fun array_inv!25712 (array!69207) Bool)

(assert (=> start!95416 (array_inv!25712 _keys!1070)))

(declare-fun e!616202 () Bool)

(declare-fun array_inv!25713 (array!69209) Bool)

(assert (=> start!95416 (and (array_inv!25713 _values!874) e!616202)))

(declare-fun b!1077657 () Bool)

(declare-fun e!616198 () Bool)

(declare-fun tp_is_empty!26129 () Bool)

(assert (=> b!1077657 (= e!616198 tp_is_empty!26129)))

(declare-fun b!1077658 () Bool)

(declare-fun res!718057 () Bool)

(assert (=> b!1077658 (=> (not res!718057) (not e!616201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69207 (_ BitVec 32)) Bool)

(assert (=> b!1077658 (= res!718057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077659 () Bool)

(assert (=> b!1077659 (= e!616202 (and e!616198 mapRes!40936))))

(declare-fun condMapEmpty!40936 () Bool)

(declare-fun mapDefault!40936 () ValueCell!12355)

