; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95428 () Bool)

(assert start!95428)

(declare-fun b!1077849 () Bool)

(declare-fun res!718199 () Bool)

(declare-fun e!616291 () Bool)

(assert (=> b!1077849 (=> (not res!718199) (not e!616291))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69231 0))(
  ( (array!69232 (arr!33293 (Array (_ BitVec 32) (_ BitVec 64))) (size!33829 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69231)

(declare-datatypes ((V!39981 0))(
  ( (V!39982 (val!13127 Int)) )
))
(declare-datatypes ((ValueCell!12361 0))(
  ( (ValueCellFull!12361 (v!15747 V!39981)) (EmptyCell!12361) )
))
(declare-datatypes ((array!69233 0))(
  ( (array!69234 (arr!33294 (Array (_ BitVec 32) ValueCell!12361)) (size!33830 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69233)

(assert (=> b!1077849 (= res!718199 (and (= (size!33830 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33829 _keys!1070) (size!33830 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!718200 () Bool)

(assert (=> start!95428 (=> (not res!718200) (not e!616291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95428 (= res!718200 (validMask!0 mask!1414))))

(assert (=> start!95428 e!616291))

(assert (=> start!95428 true))

(declare-fun array_inv!25720 (array!69231) Bool)

(assert (=> start!95428 (array_inv!25720 _keys!1070)))

(declare-fun e!616289 () Bool)

(declare-fun array_inv!25721 (array!69233) Bool)

(assert (=> start!95428 (and (array_inv!25721 _values!874) e!616289)))

(declare-fun b!1077850 () Bool)

(declare-fun res!718197 () Bool)

(assert (=> b!1077850 (=> (not res!718197) (not e!616291))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077850 (= res!718197 (validKeyInArray!0 k!904))))

(declare-fun b!1077851 () Bool)

(declare-fun e!616292 () Bool)

(declare-fun tp_is_empty!26141 () Bool)

(assert (=> b!1077851 (= e!616292 tp_is_empty!26141)))

(declare-fun b!1077852 () Bool)

(assert (=> b!1077852 (= e!616291 (and (bvsle #b00000000000000000000000000000000 (size!33829 _keys!1070)) (bvsge (size!33829 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077853 () Bool)

(declare-fun res!718202 () Bool)

(assert (=> b!1077853 (=> (not res!718202) (not e!616291))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69231 (_ BitVec 32)) Bool)

(assert (=> b!1077853 (= res!718202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69232 (store (arr!33293 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33829 _keys!1070)) mask!1414))))

(declare-fun b!1077854 () Bool)

(declare-fun res!718201 () Bool)

(assert (=> b!1077854 (=> (not res!718201) (not e!616291))))

(assert (=> b!1077854 (= res!718201 (= (select (arr!33293 _keys!1070) i!650) k!904))))

(declare-fun b!1077855 () Bool)

(declare-fun e!616290 () Bool)

(declare-fun mapRes!40954 () Bool)

(assert (=> b!1077855 (= e!616289 (and e!616290 mapRes!40954))))

(declare-fun condMapEmpty!40954 () Bool)

(declare-fun mapDefault!40954 () ValueCell!12361)

