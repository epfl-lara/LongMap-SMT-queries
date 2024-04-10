; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95554 () Bool)

(assert start!95554)

(declare-fun mapNonEmpty!41068 () Bool)

(declare-fun mapRes!41068 () Bool)

(declare-fun tp!78530 () Bool)

(declare-fun e!617042 () Bool)

(assert (=> mapNonEmpty!41068 (= mapRes!41068 (and tp!78530 e!617042))))

(declare-datatypes ((V!40073 0))(
  ( (V!40074 (val!13161 Int)) )
))
(declare-datatypes ((ValueCell!12395 0))(
  ( (ValueCellFull!12395 (v!15782 V!40073)) (EmptyCell!12395) )
))
(declare-fun mapRest!41068 () (Array (_ BitVec 32) ValueCell!12395))

(declare-datatypes ((array!69373 0))(
  ( (array!69374 (arr!33360 (Array (_ BitVec 32) ValueCell!12395)) (size!33896 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69373)

(declare-fun mapKey!41068 () (_ BitVec 32))

(declare-fun mapValue!41068 () ValueCell!12395)

(assert (=> mapNonEmpty!41068 (= (arr!33360 _values!874) (store mapRest!41068 mapKey!41068 mapValue!41068))))

(declare-fun b!1079241 () Bool)

(declare-fun res!719193 () Bool)

(declare-fun e!617044 () Bool)

(assert (=> b!1079241 (=> (not res!719193) (not e!617044))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079241 (= res!719193 (validKeyInArray!0 k!904))))

(declare-fun b!1079242 () Bool)

(declare-fun e!617041 () Bool)

(assert (=> b!1079242 (= e!617041 (not true))))

(declare-datatypes ((array!69375 0))(
  ( (array!69376 (arr!33361 (Array (_ BitVec 32) (_ BitVec 64))) (size!33897 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69375)

(declare-fun arrayContainsKey!0 (array!69375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079242 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35486 0))(
  ( (Unit!35487) )
))
(declare-fun lt!478780 () Unit!35486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69375 (_ BitVec 64) (_ BitVec 32)) Unit!35486)

(assert (=> b!1079242 (= lt!478780 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079243 () Bool)

(declare-fun res!719196 () Bool)

(assert (=> b!1079243 (=> (not res!719196) (not e!617044))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079243 (= res!719196 (and (= (size!33896 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33897 _keys!1070) (size!33896 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079244 () Bool)

(declare-fun e!617040 () Bool)

(declare-fun tp_is_empty!26209 () Bool)

(assert (=> b!1079244 (= e!617040 tp_is_empty!26209)))

(declare-fun b!1079245 () Bool)

(declare-fun res!719199 () Bool)

(assert (=> b!1079245 (=> (not res!719199) (not e!617044))))

(assert (=> b!1079245 (= res!719199 (= (select (arr!33361 _keys!1070) i!650) k!904))))

(declare-fun b!1079246 () Bool)

(declare-fun e!617045 () Bool)

(assert (=> b!1079246 (= e!617045 (and e!617040 mapRes!41068))))

(declare-fun condMapEmpty!41068 () Bool)

(declare-fun mapDefault!41068 () ValueCell!12395)

