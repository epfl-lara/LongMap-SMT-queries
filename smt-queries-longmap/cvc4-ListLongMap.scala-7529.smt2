; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95466 () Bool)

(assert start!95466)

(declare-fun b!1078164 () Bool)

(declare-fun e!616455 () Bool)

(declare-fun e!616454 () Bool)

(assert (=> b!1078164 (= e!616455 e!616454)))

(declare-fun res!718412 () Bool)

(assert (=> b!1078164 (=> res!718412 e!616454)))

(declare-datatypes ((List!23232 0))(
  ( (Nil!23229) (Cons!23228 (h!24437 (_ BitVec 64)) (t!32591 List!23232)) )
))
(declare-fun contains!6373 (List!23232 (_ BitVec 64)) Bool)

(assert (=> b!1078164 (= res!718412 (contains!6373 Nil!23229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40978 () Bool)

(declare-fun mapRes!40978 () Bool)

(assert (=> mapIsEmpty!40978 mapRes!40978))

(declare-fun b!1078165 () Bool)

(declare-fun e!616457 () Bool)

(declare-fun tp_is_empty!26153 () Bool)

(assert (=> b!1078165 (= e!616457 tp_is_empty!26153)))

(declare-fun b!1078166 () Bool)

(declare-fun res!718422 () Bool)

(assert (=> b!1078166 (=> (not res!718422) (not e!616455))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69259 0))(
  ( (array!69260 (arr!33305 (Array (_ BitVec 32) (_ BitVec 64))) (size!33841 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69259)

(declare-datatypes ((V!39997 0))(
  ( (V!39998 (val!13133 Int)) )
))
(declare-datatypes ((ValueCell!12367 0))(
  ( (ValueCellFull!12367 (v!15753 V!39997)) (EmptyCell!12367) )
))
(declare-datatypes ((array!69261 0))(
  ( (array!69262 (arr!33306 (Array (_ BitVec 32) ValueCell!12367)) (size!33842 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69261)

(assert (=> b!1078166 (= res!718422 (and (= (size!33842 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33841 _keys!1070) (size!33842 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078167 () Bool)

(declare-fun res!718414 () Bool)

(assert (=> b!1078167 (=> (not res!718414) (not e!616455))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078167 (= res!718414 (= (select (arr!33305 _keys!1070) i!650) k!904))))

(declare-fun b!1078168 () Bool)

(assert (=> b!1078168 (= e!616454 (contains!6373 Nil!23229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078169 () Bool)

(declare-fun res!718417 () Bool)

(assert (=> b!1078169 (=> (not res!718417) (not e!616455))))

(declare-fun noDuplicate!1580 (List!23232) Bool)

(assert (=> b!1078169 (= res!718417 (noDuplicate!1580 Nil!23229))))

(declare-fun b!1078170 () Bool)

(declare-fun res!718419 () Bool)

(assert (=> b!1078170 (=> (not res!718419) (not e!616455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69259 (_ BitVec 32)) Bool)

(assert (=> b!1078170 (= res!718419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078171 () Bool)

(declare-fun res!718421 () Bool)

(assert (=> b!1078171 (=> (not res!718421) (not e!616455))))

(assert (=> b!1078171 (= res!718421 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33841 _keys!1070))))))

(declare-fun b!1078172 () Bool)

(declare-fun res!718415 () Bool)

(assert (=> b!1078172 (=> (not res!718415) (not e!616455))))

(assert (=> b!1078172 (= res!718415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69260 (store (arr!33305 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33841 _keys!1070)) mask!1414))))

(declare-fun b!1078173 () Bool)

(declare-fun res!718420 () Bool)

(assert (=> b!1078173 (=> (not res!718420) (not e!616455))))

(assert (=> b!1078173 (= res!718420 (and (bvsle #b00000000000000000000000000000000 (size!33841 _keys!1070)) (bvslt (size!33841 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078174 () Bool)

(declare-fun e!616452 () Bool)

(assert (=> b!1078174 (= e!616452 tp_is_empty!26153)))

(declare-fun b!1078175 () Bool)

(declare-fun e!616453 () Bool)

(assert (=> b!1078175 (= e!616453 (and e!616457 mapRes!40978))))

(declare-fun condMapEmpty!40978 () Bool)

(declare-fun mapDefault!40978 () ValueCell!12367)

