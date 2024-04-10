; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95798 () Bool)

(assert start!95798)

(declare-fun b_free!22451 () Bool)

(declare-fun b_next!22451 () Bool)

(assert (=> start!95798 (= b_free!22451 (not b_next!22451))))

(declare-fun tp!79202 () Bool)

(declare-fun b_and!35577 () Bool)

(assert (=> start!95798 (= tp!79202 b_and!35577)))

(declare-fun b!1083781 () Bool)

(declare-fun e!619238 () Bool)

(assert (=> b!1083781 (= e!619238 (not true))))

(declare-datatypes ((V!40397 0))(
  ( (V!40398 (val!13283 Int)) )
))
(declare-fun minValue!831 () V!40397)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69849 0))(
  ( (array!69850 (arr!33598 (Array (_ BitVec 32) (_ BitVec 64))) (size!34134 (_ BitVec 32))) )
))
(declare-fun lt!480277 () array!69849)

(declare-datatypes ((tuple2!16836 0))(
  ( (tuple2!16837 (_1!8429 (_ BitVec 64)) (_2!8429 V!40397)) )
))
(declare-datatypes ((List!23423 0))(
  ( (Nil!23420) (Cons!23419 (h!24628 tuple2!16836) (t!32932 List!23423)) )
))
(declare-datatypes ((ListLongMap!14805 0))(
  ( (ListLongMap!14806 (toList!7418 List!23423)) )
))
(declare-fun lt!480274 () ListLongMap!14805)

(declare-fun zeroValue!831 () V!40397)

(declare-datatypes ((ValueCell!12517 0))(
  ( (ValueCellFull!12517 (v!15904 V!40397)) (EmptyCell!12517) )
))
(declare-datatypes ((array!69851 0))(
  ( (array!69852 (arr!33599 (Array (_ BitVec 32) ValueCell!12517)) (size!34135 (_ BitVec 32))) )
))
(declare-fun lt!480271 () array!69851)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4206 (array!69849 array!69851 (_ BitVec 32) (_ BitVec 32) V!40397 V!40397 (_ BitVec 32) Int) ListLongMap!14805)

(assert (=> b!1083781 (= lt!480274 (getCurrentListMap!4206 lt!480277 lt!480271 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480276 () ListLongMap!14805)

(declare-fun lt!480273 () ListLongMap!14805)

(assert (=> b!1083781 (and (= lt!480276 lt!480273) (= lt!480273 lt!480276))))

(declare-fun lt!480270 () ListLongMap!14805)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!745 (ListLongMap!14805 (_ BitVec 64)) ListLongMap!14805)

(assert (=> b!1083781 (= lt!480273 (-!745 lt!480270 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69849)

(declare-fun _values!874 () array!69851)

(declare-datatypes ((Unit!35656 0))(
  ( (Unit!35657) )
))
(declare-fun lt!480272 () Unit!35656)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 (array!69849 array!69851 (_ BitVec 32) (_ BitVec 32) V!40397 V!40397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35656)

(assert (=> b!1083781 (= lt!480272 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3966 (array!69849 array!69851 (_ BitVec 32) (_ BitVec 32) V!40397 V!40397 (_ BitVec 32) Int) ListLongMap!14805)

(assert (=> b!1083781 (= lt!480276 (getCurrentListMapNoExtraKeys!3966 lt!480277 lt!480271 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2103 (Int (_ BitVec 64)) V!40397)

(assert (=> b!1083781 (= lt!480271 (array!69852 (store (arr!33599 _values!874) i!650 (ValueCellFull!12517 (dynLambda!2103 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34135 _values!874)))))

(assert (=> b!1083781 (= lt!480270 (getCurrentListMapNoExtraKeys!3966 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083781 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480275 () Unit!35656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69849 (_ BitVec 64) (_ BitVec 32)) Unit!35656)

(assert (=> b!1083781 (= lt!480275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083782 () Bool)

(declare-fun res!722487 () Bool)

(assert (=> b!1083782 (=> (not res!722487) (not e!619238))))

(declare-datatypes ((List!23424 0))(
  ( (Nil!23421) (Cons!23420 (h!24629 (_ BitVec 64)) (t!32933 List!23424)) )
))
(declare-fun arrayNoDuplicates!0 (array!69849 (_ BitVec 32) List!23424) Bool)

(assert (=> b!1083782 (= res!722487 (arrayNoDuplicates!0 lt!480277 #b00000000000000000000000000000000 Nil!23421))))

(declare-fun b!1083783 () Bool)

(declare-fun e!619239 () Bool)

(declare-fun tp_is_empty!26453 () Bool)

(assert (=> b!1083783 (= e!619239 tp_is_empty!26453)))

(declare-fun b!1083784 () Bool)

(declare-fun res!722485 () Bool)

(declare-fun e!619237 () Bool)

(assert (=> b!1083784 (=> (not res!722485) (not e!619237))))

(assert (=> b!1083784 (= res!722485 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23421))))

(declare-fun mapNonEmpty!41434 () Bool)

(declare-fun mapRes!41434 () Bool)

(declare-fun tp!79201 () Bool)

(declare-fun e!619241 () Bool)

(assert (=> mapNonEmpty!41434 (= mapRes!41434 (and tp!79201 e!619241))))

(declare-fun mapRest!41434 () (Array (_ BitVec 32) ValueCell!12517))

(declare-fun mapKey!41434 () (_ BitVec 32))

(declare-fun mapValue!41434 () ValueCell!12517)

(assert (=> mapNonEmpty!41434 (= (arr!33599 _values!874) (store mapRest!41434 mapKey!41434 mapValue!41434))))

(declare-fun b!1083785 () Bool)

(declare-fun res!722493 () Bool)

(assert (=> b!1083785 (=> (not res!722493) (not e!619237))))

(assert (=> b!1083785 (= res!722493 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34134 _keys!1070))))))

(declare-fun res!722490 () Bool)

(assert (=> start!95798 (=> (not res!722490) (not e!619237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95798 (= res!722490 (validMask!0 mask!1414))))

(assert (=> start!95798 e!619237))

(assert (=> start!95798 tp!79202))

(assert (=> start!95798 true))

(assert (=> start!95798 tp_is_empty!26453))

(declare-fun array_inv!25932 (array!69849) Bool)

(assert (=> start!95798 (array_inv!25932 _keys!1070)))

(declare-fun e!619236 () Bool)

(declare-fun array_inv!25933 (array!69851) Bool)

(assert (=> start!95798 (and (array_inv!25933 _values!874) e!619236)))

(declare-fun b!1083786 () Bool)

(assert (=> b!1083786 (= e!619237 e!619238)))

(declare-fun res!722486 () Bool)

(assert (=> b!1083786 (=> (not res!722486) (not e!619238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69849 (_ BitVec 32)) Bool)

(assert (=> b!1083786 (= res!722486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480277 mask!1414))))

(assert (=> b!1083786 (= lt!480277 (array!69850 (store (arr!33598 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34134 _keys!1070)))))

(declare-fun mapIsEmpty!41434 () Bool)

(assert (=> mapIsEmpty!41434 mapRes!41434))

(declare-fun b!1083787 () Bool)

(assert (=> b!1083787 (= e!619241 tp_is_empty!26453)))

(declare-fun b!1083788 () Bool)

(declare-fun res!722489 () Bool)

(assert (=> b!1083788 (=> (not res!722489) (not e!619237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083788 (= res!722489 (validKeyInArray!0 k!904))))

(declare-fun b!1083789 () Bool)

(declare-fun res!722488 () Bool)

(assert (=> b!1083789 (=> (not res!722488) (not e!619237))))

(assert (=> b!1083789 (= res!722488 (= (select (arr!33598 _keys!1070) i!650) k!904))))

(declare-fun b!1083790 () Bool)

(declare-fun res!722491 () Bool)

(assert (=> b!1083790 (=> (not res!722491) (not e!619237))))

(assert (=> b!1083790 (= res!722491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083791 () Bool)

(assert (=> b!1083791 (= e!619236 (and e!619239 mapRes!41434))))

(declare-fun condMapEmpty!41434 () Bool)

(declare-fun mapDefault!41434 () ValueCell!12517)

