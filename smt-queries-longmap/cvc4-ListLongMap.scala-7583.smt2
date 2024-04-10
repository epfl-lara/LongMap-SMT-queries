; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95822 () Bool)

(assert start!95822)

(declare-fun b_free!22475 () Bool)

(declare-fun b_next!22475 () Bool)

(assert (=> start!95822 (= b_free!22475 (not b_next!22475))))

(declare-fun tp!79273 () Bool)

(declare-fun b_and!35625 () Bool)

(assert (=> start!95822 (= tp!79273 b_and!35625)))

(declare-fun b!1084237 () Bool)

(declare-fun res!722812 () Bool)

(declare-fun e!619454 () Bool)

(assert (=> b!1084237 (=> (not res!722812) (not e!619454))))

(declare-datatypes ((array!69895 0))(
  ( (array!69896 (arr!33621 (Array (_ BitVec 32) (_ BitVec 64))) (size!34157 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69895)

(declare-datatypes ((List!23440 0))(
  ( (Nil!23437) (Cons!23436 (h!24645 (_ BitVec 64)) (t!32973 List!23440)) )
))
(declare-fun arrayNoDuplicates!0 (array!69895 (_ BitVec 32) List!23440) Bool)

(assert (=> b!1084237 (= res!722812 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23437))))

(declare-fun b!1084238 () Bool)

(declare-fun res!722816 () Bool)

(assert (=> b!1084238 (=> (not res!722816) (not e!619454))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084238 (= res!722816 (validKeyInArray!0 k!904))))

(declare-fun b!1084239 () Bool)

(declare-fun res!722814 () Bool)

(assert (=> b!1084239 (=> (not res!722814) (not e!619454))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084239 (= res!722814 (= (select (arr!33621 _keys!1070) i!650) k!904))))

(declare-fun b!1084240 () Bool)

(declare-fun e!619453 () Bool)

(declare-fun tp_is_empty!26477 () Bool)

(assert (=> b!1084240 (= e!619453 tp_is_empty!26477)))

(declare-fun mapIsEmpty!41470 () Bool)

(declare-fun mapRes!41470 () Bool)

(assert (=> mapIsEmpty!41470 mapRes!41470))

(declare-fun b!1084241 () Bool)

(declare-fun res!722810 () Bool)

(assert (=> b!1084241 (=> (not res!722810) (not e!619454))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40429 0))(
  ( (V!40430 (val!13295 Int)) )
))
(declare-datatypes ((ValueCell!12529 0))(
  ( (ValueCellFull!12529 (v!15916 V!40429)) (EmptyCell!12529) )
))
(declare-datatypes ((array!69897 0))(
  ( (array!69898 (arr!33622 (Array (_ BitVec 32) ValueCell!12529)) (size!34158 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69897)

(assert (=> b!1084241 (= res!722810 (and (= (size!34158 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34157 _keys!1070) (size!34158 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41470 () Bool)

(declare-fun tp!79274 () Bool)

(declare-fun e!619456 () Bool)

(assert (=> mapNonEmpty!41470 (= mapRes!41470 (and tp!79274 e!619456))))

(declare-fun mapKey!41470 () (_ BitVec 32))

(declare-fun mapRest!41470 () (Array (_ BitVec 32) ValueCell!12529))

(declare-fun mapValue!41470 () ValueCell!12529)

(assert (=> mapNonEmpty!41470 (= (arr!33622 _values!874) (store mapRest!41470 mapKey!41470 mapValue!41470))))

(declare-fun b!1084242 () Bool)

(declare-fun e!619457 () Bool)

(assert (=> b!1084242 (= e!619454 e!619457)))

(declare-fun res!722811 () Bool)

(assert (=> b!1084242 (=> (not res!722811) (not e!619457))))

(declare-fun lt!480558 () array!69895)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69895 (_ BitVec 32)) Bool)

(assert (=> b!1084242 (= res!722811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480558 mask!1414))))

(assert (=> b!1084242 (= lt!480558 (array!69896 (store (arr!33621 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34157 _keys!1070)))))

(declare-fun b!1084244 () Bool)

(declare-fun res!722813 () Bool)

(assert (=> b!1084244 (=> (not res!722813) (not e!619454))))

(assert (=> b!1084244 (= res!722813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084245 () Bool)

(declare-fun e!619452 () Bool)

(assert (=> b!1084245 (= e!619452 (and e!619453 mapRes!41470))))

(declare-fun condMapEmpty!41470 () Bool)

(declare-fun mapDefault!41470 () ValueCell!12529)

