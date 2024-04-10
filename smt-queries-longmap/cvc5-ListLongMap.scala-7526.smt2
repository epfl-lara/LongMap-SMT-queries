; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95418 () Bool)

(assert start!95418)

(declare-fun b!1077684 () Bool)

(declare-fun res!718079 () Bool)

(declare-fun e!616216 () Bool)

(assert (=> b!1077684 (=> (not res!718079) (not e!616216))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69211 0))(
  ( (array!69212 (arr!33283 (Array (_ BitVec 32) (_ BitVec 64))) (size!33819 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69211)

(declare-datatypes ((V!39969 0))(
  ( (V!39970 (val!13122 Int)) )
))
(declare-datatypes ((ValueCell!12356 0))(
  ( (ValueCellFull!12356 (v!15742 V!39969)) (EmptyCell!12356) )
))
(declare-datatypes ((array!69213 0))(
  ( (array!69214 (arr!33284 (Array (_ BitVec 32) ValueCell!12356)) (size!33820 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69213)

(assert (=> b!1077684 (= res!718079 (and (= (size!33820 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33819 _keys!1070) (size!33820 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077685 () Bool)

(declare-fun res!718080 () Bool)

(assert (=> b!1077685 (=> (not res!718080) (not e!616216))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077685 (= res!718080 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33819 _keys!1070))))))

(declare-fun mapIsEmpty!40939 () Bool)

(declare-fun mapRes!40939 () Bool)

(assert (=> mapIsEmpty!40939 mapRes!40939))

(declare-fun b!1077686 () Bool)

(declare-fun res!718078 () Bool)

(assert (=> b!1077686 (=> (not res!718078) (not e!616216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69211 (_ BitVec 32)) Bool)

(assert (=> b!1077686 (= res!718078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!718081 () Bool)

(assert (=> start!95418 (=> (not res!718081) (not e!616216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95418 (= res!718081 (validMask!0 mask!1414))))

(assert (=> start!95418 e!616216))

(assert (=> start!95418 true))

(declare-fun array_inv!25714 (array!69211) Bool)

(assert (=> start!95418 (array_inv!25714 _keys!1070)))

(declare-fun e!616213 () Bool)

(declare-fun array_inv!25715 (array!69213) Bool)

(assert (=> start!95418 (and (array_inv!25715 _values!874) e!616213)))

(declare-fun b!1077687 () Bool)

(declare-fun e!616217 () Bool)

(declare-fun tp_is_empty!26131 () Bool)

(assert (=> b!1077687 (= e!616217 tp_is_empty!26131)))

(declare-fun b!1077688 () Bool)

(declare-fun e!616215 () Bool)

(assert (=> b!1077688 (= e!616213 (and e!616215 mapRes!40939))))

(declare-fun condMapEmpty!40939 () Bool)

(declare-fun mapDefault!40939 () ValueCell!12356)

