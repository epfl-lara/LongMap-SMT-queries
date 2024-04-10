; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95364 () Bool)

(assert start!95364)

(declare-fun mapIsEmpty!40885 () Bool)

(declare-fun mapRes!40885 () Bool)

(assert (=> mapIsEmpty!40885 mapRes!40885))

(declare-fun b!1077244 () Bool)

(declare-fun res!717810 () Bool)

(declare-fun e!615918 () Bool)

(assert (=> b!1077244 (=> (not res!717810) (not e!615918))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!69147 0))(
  ( (array!69148 (arr!33253 (Array (_ BitVec 32) (_ BitVec 64))) (size!33789 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69147)

(declare-datatypes ((V!39925 0))(
  ( (V!39926 (val!13106 Int)) )
))
(declare-datatypes ((ValueCell!12340 0))(
  ( (ValueCellFull!12340 (v!15725 V!39925)) (EmptyCell!12340) )
))
(declare-datatypes ((array!69149 0))(
  ( (array!69150 (arr!33254 (Array (_ BitVec 32) ValueCell!12340)) (size!33790 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69149)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077244 (= res!717810 (and (= (size!33790 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33789 _keys!1070) (size!33790 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077245 () Bool)

(declare-fun res!717809 () Bool)

(assert (=> b!1077245 (=> (not res!717809) (not e!615918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69147 (_ BitVec 32)) Bool)

(assert (=> b!1077245 (= res!717809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077246 () Bool)

(declare-fun res!717808 () Bool)

(assert (=> b!1077246 (=> (not res!717808) (not e!615918))))

(assert (=> b!1077246 (= res!717808 (and (bvsle #b00000000000000000000000000000000 (size!33789 _keys!1070)) (bvslt (size!33789 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077247 () Bool)

(declare-fun e!615914 () Bool)

(declare-fun tp_is_empty!26099 () Bool)

(assert (=> b!1077247 (= e!615914 tp_is_empty!26099)))

(declare-fun b!1077248 () Bool)

(declare-fun e!615916 () Bool)

(assert (=> b!1077248 (= e!615916 (and e!615914 mapRes!40885))))

(declare-fun condMapEmpty!40885 () Bool)

(declare-fun mapDefault!40885 () ValueCell!12340)

