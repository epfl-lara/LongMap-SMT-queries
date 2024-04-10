; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95572 () Bool)

(assert start!95572)

(declare-fun b!1079565 () Bool)

(declare-fun res!719438 () Bool)

(declare-fun e!617206 () Bool)

(assert (=> b!1079565 (=> (not res!719438) (not e!617206))))

(declare-datatypes ((array!69409 0))(
  ( (array!69410 (arr!33378 (Array (_ BitVec 32) (_ BitVec 64))) (size!33914 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69409)

(declare-datatypes ((List!23263 0))(
  ( (Nil!23260) (Cons!23259 (h!24468 (_ BitVec 64)) (t!32622 List!23263)) )
))
(declare-fun arrayNoDuplicates!0 (array!69409 (_ BitVec 32) List!23263) Bool)

(assert (=> b!1079565 (= res!719438 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23260))))

(declare-fun b!1079566 () Bool)

(declare-fun res!719439 () Bool)

(assert (=> b!1079566 (=> (not res!719439) (not e!617206))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079566 (= res!719439 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33914 _keys!1070))))))

(declare-fun b!1079567 () Bool)

(declare-fun e!617202 () Bool)

(assert (=> b!1079567 (= e!617202 (not true))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079567 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35496 0))(
  ( (Unit!35497) )
))
(declare-fun lt!478833 () Unit!35496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69409 (_ BitVec 64) (_ BitVec 32)) Unit!35496)

(assert (=> b!1079567 (= lt!478833 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079568 () Bool)

(declare-fun e!617203 () Bool)

(declare-fun tp_is_empty!26227 () Bool)

(assert (=> b!1079568 (= e!617203 tp_is_empty!26227)))

(declare-fun b!1079569 () Bool)

(declare-fun res!719440 () Bool)

(assert (=> b!1079569 (=> (not res!719440) (not e!617206))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69409 (_ BitVec 32)) Bool)

(assert (=> b!1079569 (= res!719440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41095 () Bool)

(declare-fun mapRes!41095 () Bool)

(assert (=> mapIsEmpty!41095 mapRes!41095))

(declare-fun b!1079570 () Bool)

(declare-fun res!719434 () Bool)

(assert (=> b!1079570 (=> (not res!719434) (not e!617202))))

(declare-fun lt!478834 () array!69409)

(assert (=> b!1079570 (= res!719434 (arrayNoDuplicates!0 lt!478834 #b00000000000000000000000000000000 Nil!23260))))

(declare-fun b!1079571 () Bool)

(assert (=> b!1079571 (= e!617206 e!617202)))

(declare-fun res!719437 () Bool)

(assert (=> b!1079571 (=> (not res!719437) (not e!617202))))

(assert (=> b!1079571 (= res!719437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478834 mask!1414))))

(assert (=> b!1079571 (= lt!478834 (array!69410 (store (arr!33378 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33914 _keys!1070)))))

(declare-fun b!1079572 () Bool)

(declare-fun res!719442 () Bool)

(assert (=> b!1079572 (=> (not res!719442) (not e!617206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079572 (= res!719442 (validKeyInArray!0 k!904))))

(declare-fun b!1079573 () Bool)

(declare-fun e!617207 () Bool)

(assert (=> b!1079573 (= e!617207 tp_is_empty!26227)))

(declare-fun b!1079574 () Bool)

(declare-fun res!719436 () Bool)

(assert (=> b!1079574 (=> (not res!719436) (not e!617206))))

(assert (=> b!1079574 (= res!719436 (= (select (arr!33378 _keys!1070) i!650) k!904))))

(declare-fun b!1079575 () Bool)

(declare-fun res!719441 () Bool)

(assert (=> b!1079575 (=> (not res!719441) (not e!617206))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40097 0))(
  ( (V!40098 (val!13170 Int)) )
))
(declare-datatypes ((ValueCell!12404 0))(
  ( (ValueCellFull!12404 (v!15791 V!40097)) (EmptyCell!12404) )
))
(declare-datatypes ((array!69411 0))(
  ( (array!69412 (arr!33379 (Array (_ BitVec 32) ValueCell!12404)) (size!33915 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69411)

(assert (=> b!1079575 (= res!719441 (and (= (size!33915 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33914 _keys!1070) (size!33915 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079576 () Bool)

(declare-fun e!617205 () Bool)

(assert (=> b!1079576 (= e!617205 (and e!617203 mapRes!41095))))

(declare-fun condMapEmpty!41095 () Bool)

(declare-fun mapDefault!41095 () ValueCell!12404)

