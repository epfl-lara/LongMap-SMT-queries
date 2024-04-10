; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95894 () Bool)

(assert start!95894)

(declare-fun b_free!22547 () Bool)

(declare-fun b_next!22547 () Bool)

(assert (=> start!95894 (= b_free!22547 (not b_next!22547))))

(declare-fun tp!79489 () Bool)

(declare-fun b_and!35769 () Bool)

(assert (=> start!95894 (= tp!79489 b_and!35769)))

(declare-fun b!1085765 () Bool)

(declare-fun e!620251 () Bool)

(declare-fun e!620253 () Bool)

(assert (=> b!1085765 (= e!620251 e!620253)))

(declare-fun res!723950 () Bool)

(assert (=> b!1085765 (=> res!723950 e!620253)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1085765 (= res!723950 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40525 0))(
  ( (V!40526 (val!13331 Int)) )
))
(declare-datatypes ((tuple2!16906 0))(
  ( (tuple2!16907 (_1!8464 (_ BitVec 64)) (_2!8464 V!40525)) )
))
(declare-datatypes ((List!23495 0))(
  ( (Nil!23492) (Cons!23491 (h!24700 tuple2!16906) (t!33100 List!23495)) )
))
(declare-datatypes ((ListLongMap!14875 0))(
  ( (ListLongMap!14876 (toList!7453 List!23495)) )
))
(declare-fun lt!482066 () ListLongMap!14875)

(declare-fun lt!482061 () ListLongMap!14875)

(assert (=> b!1085765 (= lt!482066 lt!482061)))

(declare-fun lt!482062 () ListLongMap!14875)

(declare-fun -!779 (ListLongMap!14875 (_ BitVec 64)) ListLongMap!14875)

(assert (=> b!1085765 (= lt!482066 (-!779 lt!482062 k!904))))

(declare-fun lt!482075 () ListLongMap!14875)

(declare-datatypes ((Unit!35724 0))(
  ( (Unit!35725) )
))
(declare-fun lt!482073 () Unit!35724)

(declare-fun zeroValue!831 () V!40525)

(declare-fun addRemoveCommutativeForDiffKeys!17 (ListLongMap!14875 (_ BitVec 64) V!40525 (_ BitVec 64)) Unit!35724)

(assert (=> b!1085765 (= lt!482073 (addRemoveCommutativeForDiffKeys!17 lt!482075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!482070 () ListLongMap!14875)

(declare-fun lt!482063 () tuple2!16906)

(declare-fun +!3261 (ListLongMap!14875 tuple2!16906) ListLongMap!14875)

(assert (=> b!1085765 (= lt!482070 (+!3261 lt!482061 lt!482063))))

(declare-fun lt!482064 () ListLongMap!14875)

(declare-fun lt!482071 () tuple2!16906)

(assert (=> b!1085765 (= lt!482061 (+!3261 lt!482064 lt!482071))))

(declare-fun lt!482072 () ListLongMap!14875)

(declare-fun lt!482065 () ListLongMap!14875)

(assert (=> b!1085765 (= lt!482072 lt!482065)))

(assert (=> b!1085765 (= lt!482065 (+!3261 lt!482062 lt!482063))))

(assert (=> b!1085765 (= lt!482062 (+!3261 lt!482075 lt!482071))))

(declare-fun lt!482074 () ListLongMap!14875)

(assert (=> b!1085765 (= lt!482070 (+!3261 (+!3261 lt!482074 lt!482071) lt!482063))))

(declare-fun minValue!831 () V!40525)

(assert (=> b!1085765 (= lt!482063 (tuple2!16907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085765 (= lt!482071 (tuple2!16907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085766 () Bool)

(declare-fun e!620255 () Bool)

(declare-fun e!620252 () Bool)

(assert (=> b!1085766 (= e!620255 e!620252)))

(declare-fun res!723948 () Bool)

(assert (=> b!1085766 (=> (not res!723948) (not e!620252))))

(declare-datatypes ((array!70033 0))(
  ( (array!70034 (arr!33690 (Array (_ BitVec 32) (_ BitVec 64))) (size!34226 (_ BitVec 32))) )
))
(declare-fun lt!482077 () array!70033)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70033 (_ BitVec 32)) Bool)

(assert (=> b!1085766 (= res!723948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482077 mask!1414))))

(declare-fun _keys!1070 () array!70033)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085766 (= lt!482077 (array!70034 (store (arr!33690 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34226 _keys!1070)))))

(declare-fun mapIsEmpty!41578 () Bool)

(declare-fun mapRes!41578 () Bool)

(assert (=> mapIsEmpty!41578 mapRes!41578))

(declare-fun b!1085767 () Bool)

(declare-fun res!723945 () Bool)

(assert (=> b!1085767 (=> (not res!723945) (not e!620255))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12565 0))(
  ( (ValueCellFull!12565 (v!15952 V!40525)) (EmptyCell!12565) )
))
(declare-datatypes ((array!70035 0))(
  ( (array!70036 (arr!33691 (Array (_ BitVec 32) ValueCell!12565)) (size!34227 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70035)

(assert (=> b!1085767 (= res!723945 (and (= (size!34227 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34226 _keys!1070) (size!34227 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085768 () Bool)

(declare-fun res!723949 () Bool)

(assert (=> b!1085768 (=> (not res!723949) (not e!620252))))

(declare-datatypes ((List!23496 0))(
  ( (Nil!23493) (Cons!23492 (h!24701 (_ BitVec 64)) (t!33101 List!23496)) )
))
(declare-fun arrayNoDuplicates!0 (array!70033 (_ BitVec 32) List!23496) Bool)

(assert (=> b!1085768 (= res!723949 (arrayNoDuplicates!0 lt!482077 #b00000000000000000000000000000000 Nil!23493))))

(declare-fun b!1085769 () Bool)

(declare-fun res!723941 () Bool)

(assert (=> b!1085769 (=> (not res!723941) (not e!620255))))

(assert (=> b!1085769 (= res!723941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085770 () Bool)

(declare-fun res!723942 () Bool)

(assert (=> b!1085770 (=> (not res!723942) (not e!620255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085770 (= res!723942 (validKeyInArray!0 k!904))))

(declare-fun res!723951 () Bool)

(assert (=> start!95894 (=> (not res!723951) (not e!620255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95894 (= res!723951 (validMask!0 mask!1414))))

(assert (=> start!95894 e!620255))

(assert (=> start!95894 tp!79489))

(assert (=> start!95894 true))

(declare-fun tp_is_empty!26549 () Bool)

(assert (=> start!95894 tp_is_empty!26549))

(declare-fun array_inv!26000 (array!70033) Bool)

(assert (=> start!95894 (array_inv!26000 _keys!1070)))

(declare-fun e!620254 () Bool)

(declare-fun array_inv!26001 (array!70035) Bool)

(assert (=> start!95894 (and (array_inv!26001 _values!874) e!620254)))

(declare-fun mapNonEmpty!41578 () Bool)

(declare-fun tp!79490 () Bool)

(declare-fun e!620257 () Bool)

(assert (=> mapNonEmpty!41578 (= mapRes!41578 (and tp!79490 e!620257))))

(declare-fun mapRest!41578 () (Array (_ BitVec 32) ValueCell!12565))

(declare-fun mapValue!41578 () ValueCell!12565)

(declare-fun mapKey!41578 () (_ BitVec 32))

(assert (=> mapNonEmpty!41578 (= (arr!33691 _values!874) (store mapRest!41578 mapKey!41578 mapValue!41578))))

(declare-fun b!1085771 () Bool)

(declare-fun e!620258 () Bool)

(assert (=> b!1085771 (= e!620254 (and e!620258 mapRes!41578))))

(declare-fun condMapEmpty!41578 () Bool)

(declare-fun mapDefault!41578 () ValueCell!12565)

