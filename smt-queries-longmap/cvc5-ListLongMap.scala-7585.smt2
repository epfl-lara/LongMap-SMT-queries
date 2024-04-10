; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95830 () Bool)

(assert start!95830)

(declare-fun b_free!22483 () Bool)

(declare-fun b_next!22483 () Bool)

(assert (=> start!95830 (= b_free!22483 (not b_next!22483))))

(declare-fun tp!79298 () Bool)

(declare-fun b_and!35641 () Bool)

(assert (=> start!95830 (= tp!79298 b_and!35641)))

(declare-fun b!1084389 () Bool)

(declare-fun e!619528 () Bool)

(declare-fun tp_is_empty!26485 () Bool)

(assert (=> b!1084389 (= e!619528 tp_is_empty!26485)))

(declare-fun b!1084390 () Bool)

(declare-fun res!722923 () Bool)

(declare-fun e!619529 () Bool)

(assert (=> b!1084390 (=> (not res!722923) (not e!619529))))

(declare-datatypes ((array!69909 0))(
  ( (array!69910 (arr!33628 (Array (_ BitVec 32) (_ BitVec 64))) (size!34164 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69909)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69909 (_ BitVec 32)) Bool)

(assert (=> b!1084390 (= res!722923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084391 () Bool)

(declare-fun e!619524 () Bool)

(assert (=> b!1084391 (= e!619529 e!619524)))

(declare-fun res!722917 () Bool)

(assert (=> b!1084391 (=> (not res!722917) (not e!619524))))

(declare-fun lt!480655 () array!69909)

(assert (=> b!1084391 (= res!722917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480655 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084391 (= lt!480655 (array!69910 (store (arr!33628 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34164 _keys!1070)))))

(declare-fun b!1084392 () Bool)

(declare-fun res!722921 () Bool)

(assert (=> b!1084392 (=> (not res!722921) (not e!619529))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084392 (= res!722921 (validKeyInArray!0 k!904))))

(declare-fun b!1084393 () Bool)

(declare-fun res!722925 () Bool)

(assert (=> b!1084393 (=> (not res!722925) (not e!619524))))

(declare-datatypes ((List!23445 0))(
  ( (Nil!23442) (Cons!23441 (h!24650 (_ BitVec 64)) (t!32986 List!23445)) )
))
(declare-fun arrayNoDuplicates!0 (array!69909 (_ BitVec 32) List!23445) Bool)

(assert (=> b!1084393 (= res!722925 (arrayNoDuplicates!0 lt!480655 #b00000000000000000000000000000000 Nil!23442))))

(declare-fun b!1084394 () Bool)

(declare-fun res!722922 () Bool)

(assert (=> b!1084394 (=> (not res!722922) (not e!619529))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40441 0))(
  ( (V!40442 (val!13299 Int)) )
))
(declare-datatypes ((ValueCell!12533 0))(
  ( (ValueCellFull!12533 (v!15920 V!40441)) (EmptyCell!12533) )
))
(declare-datatypes ((array!69911 0))(
  ( (array!69912 (arr!33629 (Array (_ BitVec 32) ValueCell!12533)) (size!34165 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69911)

(assert (=> b!1084394 (= res!722922 (and (= (size!34165 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34164 _keys!1070) (size!34165 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!722919 () Bool)

(assert (=> start!95830 (=> (not res!722919) (not e!619529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95830 (= res!722919 (validMask!0 mask!1414))))

(assert (=> start!95830 e!619529))

(assert (=> start!95830 tp!79298))

(assert (=> start!95830 true))

(assert (=> start!95830 tp_is_empty!26485))

(declare-fun array_inv!25952 (array!69909) Bool)

(assert (=> start!95830 (array_inv!25952 _keys!1070)))

(declare-fun e!619526 () Bool)

(declare-fun array_inv!25953 (array!69911) Bool)

(assert (=> start!95830 (and (array_inv!25953 _values!874) e!619526)))

(declare-fun b!1084395 () Bool)

(assert (=> b!1084395 (= e!619524 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40441)

(declare-datatypes ((tuple2!16856 0))(
  ( (tuple2!16857 (_1!8439 (_ BitVec 64)) (_2!8439 V!40441)) )
))
(declare-datatypes ((List!23446 0))(
  ( (Nil!23443) (Cons!23442 (h!24651 tuple2!16856) (t!32987 List!23446)) )
))
(declare-datatypes ((ListLongMap!14825 0))(
  ( (ListLongMap!14826 (toList!7428 List!23446)) )
))
(declare-fun lt!480657 () ListLongMap!14825)

(declare-fun lt!480654 () array!69911)

(declare-fun zeroValue!831 () V!40441)

(declare-fun getCurrentListMap!4216 (array!69909 array!69911 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14825)

(assert (=> b!1084395 (= lt!480657 (getCurrentListMap!4216 lt!480655 lt!480654 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480661 () ListLongMap!14825)

(declare-fun lt!480656 () ListLongMap!14825)

(assert (=> b!1084395 (and (= lt!480661 lt!480656) (= lt!480656 lt!480661))))

(declare-fun lt!480658 () ListLongMap!14825)

(declare-fun -!755 (ListLongMap!14825 (_ BitVec 64)) ListLongMap!14825)

(assert (=> b!1084395 (= lt!480656 (-!755 lt!480658 k!904))))

(declare-datatypes ((Unit!35676 0))(
  ( (Unit!35677) )
))
(declare-fun lt!480659 () Unit!35676)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!35 (array!69909 array!69911 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35676)

(assert (=> b!1084395 (= lt!480659 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!35 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3976 (array!69909 array!69911 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14825)

(assert (=> b!1084395 (= lt!480661 (getCurrentListMapNoExtraKeys!3976 lt!480655 lt!480654 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2113 (Int (_ BitVec 64)) V!40441)

(assert (=> b!1084395 (= lt!480654 (array!69912 (store (arr!33629 _values!874) i!650 (ValueCellFull!12533 (dynLambda!2113 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34165 _values!874)))))

(assert (=> b!1084395 (= lt!480658 (getCurrentListMapNoExtraKeys!3976 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084395 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480660 () Unit!35676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69909 (_ BitVec 64) (_ BitVec 32)) Unit!35676)

(assert (=> b!1084395 (= lt!480660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41482 () Bool)

(declare-fun mapRes!41482 () Bool)

(assert (=> mapIsEmpty!41482 mapRes!41482))

(declare-fun mapNonEmpty!41482 () Bool)

(declare-fun tp!79297 () Bool)

(assert (=> mapNonEmpty!41482 (= mapRes!41482 (and tp!79297 e!619528))))

(declare-fun mapRest!41482 () (Array (_ BitVec 32) ValueCell!12533))

(declare-fun mapKey!41482 () (_ BitVec 32))

(declare-fun mapValue!41482 () ValueCell!12533)

(assert (=> mapNonEmpty!41482 (= (arr!33629 _values!874) (store mapRest!41482 mapKey!41482 mapValue!41482))))

(declare-fun b!1084396 () Bool)

(declare-fun e!619527 () Bool)

(assert (=> b!1084396 (= e!619526 (and e!619527 mapRes!41482))))

(declare-fun condMapEmpty!41482 () Bool)

(declare-fun mapDefault!41482 () ValueCell!12533)

