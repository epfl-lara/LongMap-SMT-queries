; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95588 () Bool)

(assert start!95588)

(declare-fun b!1079853 () Bool)

(declare-fun e!617347 () Bool)

(declare-fun e!617346 () Bool)

(assert (=> b!1079853 (= e!617347 e!617346)))

(declare-fun res!719657 () Bool)

(assert (=> b!1079853 (=> (not res!719657) (not e!617346))))

(declare-datatypes ((array!69439 0))(
  ( (array!69440 (arr!33393 (Array (_ BitVec 32) (_ BitVec 64))) (size!33929 (_ BitVec 32))) )
))
(declare-fun lt!478882 () array!69439)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69439 (_ BitVec 32)) Bool)

(assert (=> b!1079853 (= res!719657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478882 mask!1414))))

(declare-fun _keys!1070 () array!69439)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079853 (= lt!478882 (array!69440 (store (arr!33393 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33929 _keys!1070)))))

(declare-fun b!1079854 () Bool)

(declare-fun res!719656 () Bool)

(assert (=> b!1079854 (=> (not res!719656) (not e!617347))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40117 0))(
  ( (V!40118 (val!13178 Int)) )
))
(declare-datatypes ((ValueCell!12412 0))(
  ( (ValueCellFull!12412 (v!15799 V!40117)) (EmptyCell!12412) )
))
(declare-datatypes ((array!69441 0))(
  ( (array!69442 (arr!33394 (Array (_ BitVec 32) ValueCell!12412)) (size!33930 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69441)

(assert (=> b!1079854 (= res!719656 (and (= (size!33930 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33929 _keys!1070) (size!33930 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079856 () Bool)

(declare-fun e!617350 () Bool)

(declare-fun tp_is_empty!26243 () Bool)

(assert (=> b!1079856 (= e!617350 tp_is_empty!26243)))

(declare-fun b!1079857 () Bool)

(declare-fun res!719650 () Bool)

(assert (=> b!1079857 (=> (not res!719650) (not e!617347))))

(assert (=> b!1079857 (= res!719650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079858 () Bool)

(assert (=> b!1079858 (= e!617346 (not true))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079858 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35506 0))(
  ( (Unit!35507) )
))
(declare-fun lt!478881 () Unit!35506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69439 (_ BitVec 64) (_ BitVec 32)) Unit!35506)

(assert (=> b!1079858 (= lt!478881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079859 () Bool)

(declare-fun res!719652 () Bool)

(assert (=> b!1079859 (=> (not res!719652) (not e!617347))))

(declare-datatypes ((List!23270 0))(
  ( (Nil!23267) (Cons!23266 (h!24475 (_ BitVec 64)) (t!32629 List!23270)) )
))
(declare-fun arrayNoDuplicates!0 (array!69439 (_ BitVec 32) List!23270) Bool)

(assert (=> b!1079859 (= res!719652 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23267))))

(declare-fun mapIsEmpty!41119 () Bool)

(declare-fun mapRes!41119 () Bool)

(assert (=> mapIsEmpty!41119 mapRes!41119))

(declare-fun b!1079860 () Bool)

(declare-fun res!719655 () Bool)

(assert (=> b!1079860 (=> (not res!719655) (not e!617347))))

(assert (=> b!1079860 (= res!719655 (= (select (arr!33393 _keys!1070) i!650) k!904))))

(declare-fun b!1079861 () Bool)

(declare-fun e!617351 () Bool)

(assert (=> b!1079861 (= e!617351 (and e!617350 mapRes!41119))))

(declare-fun condMapEmpty!41119 () Bool)

(declare-fun mapDefault!41119 () ValueCell!12412)

