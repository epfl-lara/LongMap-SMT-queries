; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95780 () Bool)

(assert start!95780)

(declare-fun b_free!22433 () Bool)

(declare-fun b_next!22433 () Bool)

(assert (=> start!95780 (= b_free!22433 (not b_next!22433))))

(declare-fun tp!79148 () Bool)

(declare-fun b_and!35541 () Bool)

(assert (=> start!95780 (= tp!79148 b_and!35541)))

(declare-fun b!1083439 () Bool)

(declare-fun res!722243 () Bool)

(declare-fun e!619074 () Bool)

(assert (=> b!1083439 (=> (not res!722243) (not e!619074))))

(declare-datatypes ((array!69813 0))(
  ( (array!69814 (arr!33580 (Array (_ BitVec 32) (_ BitVec 64))) (size!34116 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69813)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69813 (_ BitVec 32)) Bool)

(assert (=> b!1083439 (= res!722243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083440 () Bool)

(declare-fun e!619079 () Bool)

(assert (=> b!1083440 (= e!619079 (not true))))

(declare-datatypes ((V!40373 0))(
  ( (V!40374 (val!13274 Int)) )
))
(declare-datatypes ((tuple2!16820 0))(
  ( (tuple2!16821 (_1!8421 (_ BitVec 64)) (_2!8421 V!40373)) )
))
(declare-datatypes ((List!23408 0))(
  ( (Nil!23405) (Cons!23404 (h!24613 tuple2!16820) (t!32899 List!23408)) )
))
(declare-datatypes ((ListLongMap!14789 0))(
  ( (ListLongMap!14790 (toList!7410 List!23408)) )
))
(declare-fun lt!480074 () ListLongMap!14789)

(declare-fun lt!480076 () ListLongMap!14789)

(assert (=> b!1083440 (and (= lt!480074 lt!480076) (= lt!480076 lt!480074))))

(declare-fun lt!480078 () ListLongMap!14789)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!737 (ListLongMap!14789 (_ BitVec 64)) ListLongMap!14789)

(assert (=> b!1083440 (= lt!480076 (-!737 lt!480078 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40373)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35640 0))(
  ( (Unit!35641) )
))
(declare-fun lt!480079 () Unit!35640)

(declare-fun zeroValue!831 () V!40373)

(declare-datatypes ((ValueCell!12508 0))(
  ( (ValueCellFull!12508 (v!15895 V!40373)) (EmptyCell!12508) )
))
(declare-datatypes ((array!69815 0))(
  ( (array!69816 (arr!33581 (Array (_ BitVec 32) ValueCell!12508)) (size!34117 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69815)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 (array!69813 array!69815 (_ BitVec 32) (_ BitVec 32) V!40373 V!40373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35640)

(assert (=> b!1083440 (= lt!480079 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480077 () array!69813)

(declare-fun getCurrentListMapNoExtraKeys!3958 (array!69813 array!69815 (_ BitVec 32) (_ BitVec 32) V!40373 V!40373 (_ BitVec 32) Int) ListLongMap!14789)

(declare-fun dynLambda!2095 (Int (_ BitVec 64)) V!40373)

(assert (=> b!1083440 (= lt!480074 (getCurrentListMapNoExtraKeys!3958 lt!480077 (array!69816 (store (arr!33581 _values!874) i!650 (ValueCellFull!12508 (dynLambda!2095 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34117 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083440 (= lt!480078 (getCurrentListMapNoExtraKeys!3958 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083440 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480075 () Unit!35640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69813 (_ BitVec 64) (_ BitVec 32)) Unit!35640)

(assert (=> b!1083440 (= lt!480075 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083441 () Bool)

(assert (=> b!1083441 (= e!619074 e!619079)))

(declare-fun res!722244 () Bool)

(assert (=> b!1083441 (=> (not res!722244) (not e!619079))))

(assert (=> b!1083441 (= res!722244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480077 mask!1414))))

(assert (=> b!1083441 (= lt!480077 (array!69814 (store (arr!33580 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34116 _keys!1070)))))

(declare-fun b!1083442 () Bool)

(declare-fun res!722247 () Bool)

(assert (=> b!1083442 (=> (not res!722247) (not e!619074))))

(assert (=> b!1083442 (= res!722247 (and (= (size!34117 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34116 _keys!1070) (size!34117 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!722249 () Bool)

(assert (=> start!95780 (=> (not res!722249) (not e!619074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95780 (= res!722249 (validMask!0 mask!1414))))

(assert (=> start!95780 e!619074))

(assert (=> start!95780 tp!79148))

(assert (=> start!95780 true))

(declare-fun tp_is_empty!26435 () Bool)

(assert (=> start!95780 tp_is_empty!26435))

(declare-fun array_inv!25916 (array!69813) Bool)

(assert (=> start!95780 (array_inv!25916 _keys!1070)))

(declare-fun e!619075 () Bool)

(declare-fun array_inv!25917 (array!69815) Bool)

(assert (=> start!95780 (and (array_inv!25917 _values!874) e!619075)))

(declare-fun b!1083443 () Bool)

(declare-fun res!722246 () Bool)

(assert (=> b!1083443 (=> (not res!722246) (not e!619074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083443 (= res!722246 (validKeyInArray!0 k!904))))

(declare-fun b!1083444 () Bool)

(declare-fun res!722245 () Bool)

(assert (=> b!1083444 (=> (not res!722245) (not e!619074))))

(assert (=> b!1083444 (= res!722245 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34116 _keys!1070))))))

(declare-fun b!1083445 () Bool)

(declare-fun e!619076 () Bool)

(declare-fun mapRes!41407 () Bool)

(assert (=> b!1083445 (= e!619075 (and e!619076 mapRes!41407))))

(declare-fun condMapEmpty!41407 () Bool)

(declare-fun mapDefault!41407 () ValueCell!12508)

