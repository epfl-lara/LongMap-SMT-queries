; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95812 () Bool)

(assert start!95812)

(declare-fun b_free!22465 () Bool)

(declare-fun b_next!22465 () Bool)

(assert (=> start!95812 (= b_free!22465 (not b_next!22465))))

(declare-fun tp!79244 () Bool)

(declare-fun b_and!35605 () Bool)

(assert (=> start!95812 (= tp!79244 b_and!35605)))

(declare-fun b!1084047 () Bool)

(declare-fun res!722677 () Bool)

(declare-fun e!619362 () Bool)

(assert (=> b!1084047 (=> (not res!722677) (not e!619362))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69875 0))(
  ( (array!69876 (arr!33611 (Array (_ BitVec 32) (_ BitVec 64))) (size!34147 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69875)

(assert (=> b!1084047 (= res!722677 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34147 _keys!1070))))))

(declare-fun b!1084048 () Bool)

(declare-fun e!619366 () Bool)

(assert (=> b!1084048 (= e!619362 e!619366)))

(declare-fun res!722682 () Bool)

(assert (=> b!1084048 (=> (not res!722682) (not e!619366))))

(declare-fun lt!480445 () array!69875)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69875 (_ BitVec 32)) Bool)

(assert (=> b!1084048 (= res!722682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480445 mask!1414))))

(assert (=> b!1084048 (= lt!480445 (array!69876 (store (arr!33611 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34147 _keys!1070)))))

(declare-fun b!1084050 () Bool)

(declare-fun res!722674 () Bool)

(assert (=> b!1084050 (=> (not res!722674) (not e!619362))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084050 (= res!722674 (validKeyInArray!0 k!904))))

(declare-fun b!1084051 () Bool)

(declare-fun res!722675 () Bool)

(assert (=> b!1084051 (=> (not res!722675) (not e!619362))))

(assert (=> b!1084051 (= res!722675 (= (select (arr!33611 _keys!1070) i!650) k!904))))

(declare-fun b!1084052 () Bool)

(declare-fun res!722681 () Bool)

(assert (=> b!1084052 (=> (not res!722681) (not e!619362))))

(declare-datatypes ((List!23433 0))(
  ( (Nil!23430) (Cons!23429 (h!24638 (_ BitVec 64)) (t!32956 List!23433)) )
))
(declare-fun arrayNoDuplicates!0 (array!69875 (_ BitVec 32) List!23433) Bool)

(assert (=> b!1084052 (= res!722681 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23430))))

(declare-fun mapIsEmpty!41455 () Bool)

(declare-fun mapRes!41455 () Bool)

(assert (=> mapIsEmpty!41455 mapRes!41455))

(declare-fun b!1084053 () Bool)

(declare-fun e!619363 () Bool)

(declare-fun tp_is_empty!26467 () Bool)

(assert (=> b!1084053 (= e!619363 tp_is_empty!26467)))

(declare-fun b!1084054 () Bool)

(declare-fun res!722679 () Bool)

(assert (=> b!1084054 (=> (not res!722679) (not e!619362))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40417 0))(
  ( (V!40418 (val!13290 Int)) )
))
(declare-datatypes ((ValueCell!12524 0))(
  ( (ValueCellFull!12524 (v!15911 V!40417)) (EmptyCell!12524) )
))
(declare-datatypes ((array!69877 0))(
  ( (array!69878 (arr!33612 (Array (_ BitVec 32) ValueCell!12524)) (size!34148 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69877)

(assert (=> b!1084054 (= res!722679 (and (= (size!34148 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34147 _keys!1070) (size!34148 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084055 () Bool)

(declare-fun res!722680 () Bool)

(assert (=> b!1084055 (=> (not res!722680) (not e!619366))))

(assert (=> b!1084055 (= res!722680 (arrayNoDuplicates!0 lt!480445 #b00000000000000000000000000000000 Nil!23430))))

(declare-fun b!1084049 () Bool)

(assert (=> b!1084049 (= e!619366 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40417)

(declare-datatypes ((tuple2!16846 0))(
  ( (tuple2!16847 (_1!8434 (_ BitVec 64)) (_2!8434 V!40417)) )
))
(declare-datatypes ((List!23434 0))(
  ( (Nil!23431) (Cons!23430 (h!24639 tuple2!16846) (t!32957 List!23434)) )
))
(declare-datatypes ((ListLongMap!14815 0))(
  ( (ListLongMap!14816 (toList!7423 List!23434)) )
))
(declare-fun lt!480441 () ListLongMap!14815)

(declare-fun lt!480443 () array!69877)

(declare-fun zeroValue!831 () V!40417)

(declare-fun getCurrentListMap!4211 (array!69875 array!69877 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14815)

(assert (=> b!1084049 (= lt!480441 (getCurrentListMap!4211 lt!480445 lt!480443 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480442 () ListLongMap!14815)

(declare-fun lt!480444 () ListLongMap!14815)

(assert (=> b!1084049 (and (= lt!480442 lt!480444) (= lt!480444 lt!480442))))

(declare-fun lt!480438 () ListLongMap!14815)

(declare-fun -!750 (ListLongMap!14815 (_ BitVec 64)) ListLongMap!14815)

(assert (=> b!1084049 (= lt!480444 (-!750 lt!480438 k!904))))

(declare-datatypes ((Unit!35666 0))(
  ( (Unit!35667) )
))
(declare-fun lt!480439 () Unit!35666)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!30 (array!69875 array!69877 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35666)

(assert (=> b!1084049 (= lt!480439 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!30 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3971 (array!69875 array!69877 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14815)

(assert (=> b!1084049 (= lt!480442 (getCurrentListMapNoExtraKeys!3971 lt!480445 lt!480443 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2108 (Int (_ BitVec 64)) V!40417)

(assert (=> b!1084049 (= lt!480443 (array!69878 (store (arr!33612 _values!874) i!650 (ValueCellFull!12524 (dynLambda!2108 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34148 _values!874)))))

(assert (=> b!1084049 (= lt!480438 (getCurrentListMapNoExtraKeys!3971 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084049 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480440 () Unit!35666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69875 (_ BitVec 64) (_ BitVec 32)) Unit!35666)

(assert (=> b!1084049 (= lt!480440 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun res!722676 () Bool)

(assert (=> start!95812 (=> (not res!722676) (not e!619362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95812 (= res!722676 (validMask!0 mask!1414))))

(assert (=> start!95812 e!619362))

(assert (=> start!95812 tp!79244))

(assert (=> start!95812 true))

(assert (=> start!95812 tp_is_empty!26467))

(declare-fun array_inv!25942 (array!69875) Bool)

(assert (=> start!95812 (array_inv!25942 _keys!1070)))

(declare-fun e!619367 () Bool)

(declare-fun array_inv!25943 (array!69877) Bool)

(assert (=> start!95812 (and (array_inv!25943 _values!874) e!619367)))

(declare-fun b!1084056 () Bool)

(assert (=> b!1084056 (= e!619367 (and e!619363 mapRes!41455))))

(declare-fun condMapEmpty!41455 () Bool)

(declare-fun mapDefault!41455 () ValueCell!12524)

