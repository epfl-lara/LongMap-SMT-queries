; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95690 () Bool)

(assert start!95690)

(declare-fun b_free!22343 () Bool)

(declare-fun b_next!22343 () Bool)

(assert (=> start!95690 (= b_free!22343 (not b_next!22343))))

(declare-fun tp!78877 () Bool)

(declare-fun b_and!35361 () Bool)

(assert (=> start!95690 (= tp!78877 b_and!35361)))

(declare-fun b!1081729 () Bool)

(declare-fun res!721031 () Bool)

(declare-fun e!618267 () Bool)

(assert (=> b!1081729 (=> (not res!721031) (not e!618267))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69637 0))(
  ( (array!69638 (arr!33492 (Array (_ BitVec 32) (_ BitVec 64))) (size!34028 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69637)

(declare-datatypes ((V!40253 0))(
  ( (V!40254 (val!13229 Int)) )
))
(declare-datatypes ((ValueCell!12463 0))(
  ( (ValueCellFull!12463 (v!15850 V!40253)) (EmptyCell!12463) )
))
(declare-datatypes ((array!69639 0))(
  ( (array!69640 (arr!33493 (Array (_ BitVec 32) ValueCell!12463)) (size!34029 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69639)

(assert (=> b!1081729 (= res!721031 (and (= (size!34029 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34028 _keys!1070) (size!34029 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081730 () Bool)

(declare-fun res!721028 () Bool)

(assert (=> b!1081730 (=> (not res!721028) (not e!618267))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081730 (= res!721028 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34028 _keys!1070))))))

(declare-fun res!721030 () Bool)

(assert (=> start!95690 (=> (not res!721030) (not e!618267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95690 (= res!721030 (validMask!0 mask!1414))))

(assert (=> start!95690 e!618267))

(assert (=> start!95690 tp!78877))

(assert (=> start!95690 true))

(declare-fun tp_is_empty!26345 () Bool)

(assert (=> start!95690 tp_is_empty!26345))

(declare-fun array_inv!25856 (array!69637) Bool)

(assert (=> start!95690 (array_inv!25856 _keys!1070)))

(declare-fun e!618269 () Bool)

(declare-fun array_inv!25857 (array!69639) Bool)

(assert (=> start!95690 (and (array_inv!25857 _values!874) e!618269)))

(declare-fun mapIsEmpty!41272 () Bool)

(declare-fun mapRes!41272 () Bool)

(assert (=> mapIsEmpty!41272 mapRes!41272))

(declare-fun b!1081731 () Bool)

(declare-fun e!618265 () Bool)

(assert (=> b!1081731 (= e!618265 tp_is_empty!26345)))

(declare-fun b!1081732 () Bool)

(assert (=> b!1081732 (= e!618269 (and e!618265 mapRes!41272))))

(declare-fun condMapEmpty!41272 () Bool)

(declare-fun mapDefault!41272 () ValueCell!12463)

