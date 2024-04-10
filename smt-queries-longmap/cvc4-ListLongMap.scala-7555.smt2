; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95654 () Bool)

(assert start!95654)

(declare-fun b_free!22307 () Bool)

(declare-fun b_next!22307 () Bool)

(assert (=> start!95654 (= b_free!22307 (not b_next!22307))))

(declare-fun tp!78769 () Bool)

(declare-fun b_and!35289 () Bool)

(assert (=> start!95654 (= tp!78769 b_and!35289)))

(declare-fun b!1081045 () Bool)

(declare-fun res!720549 () Bool)

(declare-fun e!617940 () Bool)

(assert (=> b!1081045 (=> (not res!720549) (not e!617940))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081045 (= res!720549 (validKeyInArray!0 k!904))))

(declare-fun b!1081046 () Bool)

(declare-fun res!720548 () Bool)

(assert (=> b!1081046 (=> (not res!720548) (not e!617940))))

(declare-datatypes ((array!69567 0))(
  ( (array!69568 (arr!33457 (Array (_ BitVec 32) (_ BitVec 64))) (size!33993 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69567)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69567 (_ BitVec 32)) Bool)

(assert (=> b!1081046 (= res!720548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081047 () Bool)

(declare-fun res!720546 () Bool)

(assert (=> b!1081047 (=> (not res!720546) (not e!617940))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40205 0))(
  ( (V!40206 (val!13211 Int)) )
))
(declare-datatypes ((ValueCell!12445 0))(
  ( (ValueCellFull!12445 (v!15832 V!40205)) (EmptyCell!12445) )
))
(declare-datatypes ((array!69569 0))(
  ( (array!69570 (arr!33458 (Array (_ BitVec 32) ValueCell!12445)) (size!33994 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69569)

(assert (=> b!1081047 (= res!720546 (and (= (size!33994 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33993 _keys!1070) (size!33994 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41218 () Bool)

(declare-fun mapRes!41218 () Bool)

(declare-fun tp!78770 () Bool)

(declare-fun e!617944 () Bool)

(assert (=> mapNonEmpty!41218 (= mapRes!41218 (and tp!78770 e!617944))))

(declare-fun mapKey!41218 () (_ BitVec 32))

(declare-fun mapValue!41218 () ValueCell!12445)

(declare-fun mapRest!41218 () (Array (_ BitVec 32) ValueCell!12445))

(assert (=> mapNonEmpty!41218 (= (arr!33458 _values!874) (store mapRest!41218 mapKey!41218 mapValue!41218))))

(declare-fun b!1081048 () Bool)

(declare-fun res!720541 () Bool)

(assert (=> b!1081048 (=> (not res!720541) (not e!617940))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081048 (= res!720541 (= (select (arr!33457 _keys!1070) i!650) k!904))))

(declare-fun b!1081049 () Bool)

(declare-fun e!617941 () Bool)

(assert (=> b!1081049 (= e!617941 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16734 0))(
  ( (tuple2!16735 (_1!8378 (_ BitVec 64)) (_2!8378 V!40205)) )
))
(declare-datatypes ((List!23315 0))(
  ( (Nil!23312) (Cons!23311 (h!24520 tuple2!16734) (t!32680 List!23315)) )
))
(declare-datatypes ((ListLongMap!14703 0))(
  ( (ListLongMap!14704 (toList!7367 List!23315)) )
))
(declare-fun lt!479178 () ListLongMap!14703)

(declare-fun minValue!831 () V!40205)

(declare-fun lt!479176 () array!69567)

(declare-fun zeroValue!831 () V!40205)

(declare-fun getCurrentListMapNoExtraKeys!3915 (array!69567 array!69569 (_ BitVec 32) (_ BitVec 32) V!40205 V!40205 (_ BitVec 32) Int) ListLongMap!14703)

(declare-fun dynLambda!2052 (Int (_ BitVec 64)) V!40205)

(assert (=> b!1081049 (= lt!479178 (getCurrentListMapNoExtraKeys!3915 lt!479176 (array!69570 (store (arr!33458 _values!874) i!650 (ValueCellFull!12445 (dynLambda!2052 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33994 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479177 () ListLongMap!14703)

(assert (=> b!1081049 (= lt!479177 (getCurrentListMapNoExtraKeys!3915 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081049 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35554 0))(
  ( (Unit!35555) )
))
(declare-fun lt!479179 () Unit!35554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69567 (_ BitVec 64) (_ BitVec 32)) Unit!35554)

(assert (=> b!1081049 (= lt!479179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081050 () Bool)

(assert (=> b!1081050 (= e!617940 e!617941)))

(declare-fun res!720544 () Bool)

(assert (=> b!1081050 (=> (not res!720544) (not e!617941))))

(assert (=> b!1081050 (= res!720544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479176 mask!1414))))

(assert (=> b!1081050 (= lt!479176 (array!69568 (store (arr!33457 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33993 _keys!1070)))))

(declare-fun b!1081051 () Bool)

(declare-fun e!617945 () Bool)

(declare-fun tp_is_empty!26309 () Bool)

(assert (=> b!1081051 (= e!617945 tp_is_empty!26309)))

(declare-fun b!1081052 () Bool)

(declare-fun res!720545 () Bool)

(assert (=> b!1081052 (=> (not res!720545) (not e!617941))))

(declare-datatypes ((List!23316 0))(
  ( (Nil!23313) (Cons!23312 (h!24521 (_ BitVec 64)) (t!32681 List!23316)) )
))
(declare-fun arrayNoDuplicates!0 (array!69567 (_ BitVec 32) List!23316) Bool)

(assert (=> b!1081052 (= res!720545 (arrayNoDuplicates!0 lt!479176 #b00000000000000000000000000000000 Nil!23313))))

(declare-fun b!1081053 () Bool)

(assert (=> b!1081053 (= e!617944 tp_is_empty!26309)))

(declare-fun mapIsEmpty!41218 () Bool)

(assert (=> mapIsEmpty!41218 mapRes!41218))

(declare-fun b!1081055 () Bool)

(declare-fun e!617942 () Bool)

(assert (=> b!1081055 (= e!617942 (and e!617945 mapRes!41218))))

(declare-fun condMapEmpty!41218 () Bool)

(declare-fun mapDefault!41218 () ValueCell!12445)

