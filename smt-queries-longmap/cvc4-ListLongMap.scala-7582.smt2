; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95816 () Bool)

(assert start!95816)

(declare-fun b_free!22469 () Bool)

(declare-fun b_next!22469 () Bool)

(assert (=> start!95816 (= b_free!22469 (not b_next!22469))))

(declare-fun tp!79255 () Bool)

(declare-fun b_and!35613 () Bool)

(assert (=> start!95816 (= tp!79255 b_and!35613)))

(declare-fun b!1084123 () Bool)

(declare-fun res!722732 () Bool)

(declare-fun e!619402 () Bool)

(assert (=> b!1084123 (=> (not res!722732) (not e!619402))))

(declare-datatypes ((array!69883 0))(
  ( (array!69884 (arr!33615 (Array (_ BitVec 32) (_ BitVec 64))) (size!34151 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69883)

(declare-datatypes ((List!23437 0))(
  ( (Nil!23434) (Cons!23433 (h!24642 (_ BitVec 64)) (t!32964 List!23437)) )
))
(declare-fun arrayNoDuplicates!0 (array!69883 (_ BitVec 32) List!23437) Bool)

(assert (=> b!1084123 (= res!722732 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23434))))

(declare-fun mapIsEmpty!41461 () Bool)

(declare-fun mapRes!41461 () Bool)

(assert (=> mapIsEmpty!41461 mapRes!41461))

(declare-fun b!1084124 () Bool)

(declare-fun res!722733 () Bool)

(assert (=> b!1084124 (=> (not res!722733) (not e!619402))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084124 (= res!722733 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34151 _keys!1070))))))

(declare-fun b!1084125 () Bool)

(declare-fun e!619401 () Bool)

(declare-fun tp_is_empty!26471 () Bool)

(assert (=> b!1084125 (= e!619401 tp_is_empty!26471)))

(declare-fun mapNonEmpty!41461 () Bool)

(declare-fun tp!79256 () Bool)

(declare-fun e!619403 () Bool)

(assert (=> mapNonEmpty!41461 (= mapRes!41461 (and tp!79256 e!619403))))

(declare-datatypes ((V!40421 0))(
  ( (V!40422 (val!13292 Int)) )
))
(declare-datatypes ((ValueCell!12526 0))(
  ( (ValueCellFull!12526 (v!15913 V!40421)) (EmptyCell!12526) )
))
(declare-datatypes ((array!69885 0))(
  ( (array!69886 (arr!33616 (Array (_ BitVec 32) ValueCell!12526)) (size!34152 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69885)

(declare-fun mapRest!41461 () (Array (_ BitVec 32) ValueCell!12526))

(declare-fun mapKey!41461 () (_ BitVec 32))

(declare-fun mapValue!41461 () ValueCell!12526)

(assert (=> mapNonEmpty!41461 (= (arr!33616 _values!874) (store mapRest!41461 mapKey!41461 mapValue!41461))))

(declare-fun b!1084127 () Bool)

(declare-fun res!722735 () Bool)

(declare-fun e!619400 () Bool)

(assert (=> b!1084127 (=> (not res!722735) (not e!619400))))

(declare-fun lt!480487 () array!69883)

(assert (=> b!1084127 (= res!722735 (arrayNoDuplicates!0 lt!480487 #b00000000000000000000000000000000 Nil!23434))))

(declare-fun b!1084128 () Bool)

(assert (=> b!1084128 (= e!619402 e!619400)))

(declare-fun res!722736 () Bool)

(assert (=> b!1084128 (=> (not res!722736) (not e!619400))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69883 (_ BitVec 32)) Bool)

(assert (=> b!1084128 (= res!722736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480487 mask!1414))))

(assert (=> b!1084128 (= lt!480487 (array!69884 (store (arr!33615 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34151 _keys!1070)))))

(declare-fun b!1084129 () Bool)

(declare-fun res!722728 () Bool)

(assert (=> b!1084129 (=> (not res!722728) (not e!619402))))

(assert (=> b!1084129 (= res!722728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084130 () Bool)

(assert (=> b!1084130 (= e!619403 tp_is_empty!26471)))

(declare-fun b!1084131 () Bool)

(declare-fun e!619399 () Bool)

(assert (=> b!1084131 (= e!619399 (and e!619401 mapRes!41461))))

(declare-fun condMapEmpty!41461 () Bool)

(declare-fun mapDefault!41461 () ValueCell!12526)

