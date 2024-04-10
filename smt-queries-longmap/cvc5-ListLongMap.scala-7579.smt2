; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95794 () Bool)

(assert start!95794)

(declare-fun b_free!22447 () Bool)

(declare-fun b_next!22447 () Bool)

(assert (=> start!95794 (= b_free!22447 (not b_next!22447))))

(declare-fun tp!79189 () Bool)

(declare-fun b_and!35569 () Bool)

(assert (=> start!95794 (= tp!79189 b_and!35569)))

(declare-fun b!1083705 () Bool)

(declare-fun e!619204 () Bool)

(declare-fun e!619201 () Bool)

(assert (=> b!1083705 (= e!619204 e!619201)))

(declare-fun res!722439 () Bool)

(assert (=> b!1083705 (=> (not res!722439) (not e!619201))))

(declare-datatypes ((array!69841 0))(
  ( (array!69842 (arr!33594 (Array (_ BitVec 32) (_ BitVec 64))) (size!34130 (_ BitVec 32))) )
))
(declare-fun lt!480227 () array!69841)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69841 (_ BitVec 32)) Bool)

(assert (=> b!1083705 (= res!722439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480227 mask!1414))))

(declare-fun _keys!1070 () array!69841)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083705 (= lt!480227 (array!69842 (store (arr!33594 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34130 _keys!1070)))))

(declare-fun b!1083707 () Bool)

(declare-fun res!722431 () Bool)

(assert (=> b!1083707 (=> (not res!722431) (not e!619201))))

(declare-datatypes ((List!23419 0))(
  ( (Nil!23416) (Cons!23415 (h!24624 (_ BitVec 64)) (t!32924 List!23419)) )
))
(declare-fun arrayNoDuplicates!0 (array!69841 (_ BitVec 32) List!23419) Bool)

(assert (=> b!1083707 (= res!722431 (arrayNoDuplicates!0 lt!480227 #b00000000000000000000000000000000 Nil!23416))))

(declare-fun b!1083708 () Bool)

(declare-fun e!619203 () Bool)

(declare-fun tp_is_empty!26449 () Bool)

(assert (=> b!1083708 (= e!619203 tp_is_empty!26449)))

(declare-fun mapIsEmpty!41428 () Bool)

(declare-fun mapRes!41428 () Bool)

(assert (=> mapIsEmpty!41428 mapRes!41428))

(declare-fun b!1083709 () Bool)

(declare-fun res!722438 () Bool)

(assert (=> b!1083709 (=> (not res!722438) (not e!619204))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40393 0))(
  ( (V!40394 (val!13281 Int)) )
))
(declare-datatypes ((ValueCell!12515 0))(
  ( (ValueCellFull!12515 (v!15902 V!40393)) (EmptyCell!12515) )
))
(declare-datatypes ((array!69843 0))(
  ( (array!69844 (arr!33595 (Array (_ BitVec 32) ValueCell!12515)) (size!34131 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69843)

(assert (=> b!1083709 (= res!722438 (and (= (size!34131 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34130 _keys!1070) (size!34131 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083710 () Bool)

(declare-fun res!722437 () Bool)

(assert (=> b!1083710 (=> (not res!722437) (not e!619204))))

(assert (=> b!1083710 (= res!722437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083711 () Bool)

(assert (=> b!1083711 (= e!619201 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40393)

(declare-fun lt!480225 () array!69843)

(declare-fun zeroValue!831 () V!40393)

(declare-datatypes ((tuple2!16832 0))(
  ( (tuple2!16833 (_1!8427 (_ BitVec 64)) (_2!8427 V!40393)) )
))
(declare-datatypes ((List!23420 0))(
  ( (Nil!23417) (Cons!23416 (h!24625 tuple2!16832) (t!32925 List!23420)) )
))
(declare-datatypes ((ListLongMap!14801 0))(
  ( (ListLongMap!14802 (toList!7416 List!23420)) )
))
(declare-fun lt!480222 () ListLongMap!14801)

(declare-fun getCurrentListMap!4204 (array!69841 array!69843 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14801)

(assert (=> b!1083711 (= lt!480222 (getCurrentListMap!4204 lt!480227 lt!480225 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480229 () ListLongMap!14801)

(declare-fun lt!480228 () ListLongMap!14801)

(assert (=> b!1083711 (and (= lt!480229 lt!480228) (= lt!480228 lt!480229))))

(declare-fun lt!480224 () ListLongMap!14801)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!743 (ListLongMap!14801 (_ BitVec 64)) ListLongMap!14801)

(assert (=> b!1083711 (= lt!480228 (-!743 lt!480224 k!904))))

(declare-datatypes ((Unit!35652 0))(
  ( (Unit!35653) )
))
(declare-fun lt!480223 () Unit!35652)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!23 (array!69841 array!69843 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35652)

(assert (=> b!1083711 (= lt!480223 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!23 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3964 (array!69841 array!69843 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14801)

(assert (=> b!1083711 (= lt!480229 (getCurrentListMapNoExtraKeys!3964 lt!480227 lt!480225 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2101 (Int (_ BitVec 64)) V!40393)

(assert (=> b!1083711 (= lt!480225 (array!69844 (store (arr!33595 _values!874) i!650 (ValueCellFull!12515 (dynLambda!2101 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34131 _values!874)))))

(assert (=> b!1083711 (= lt!480224 (getCurrentListMapNoExtraKeys!3964 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083711 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480226 () Unit!35652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69841 (_ BitVec 64) (_ BitVec 32)) Unit!35652)

(assert (=> b!1083711 (= lt!480226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083712 () Bool)

(declare-fun res!722435 () Bool)

(assert (=> b!1083712 (=> (not res!722435) (not e!619204))))

(assert (=> b!1083712 (= res!722435 (= (select (arr!33594 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41428 () Bool)

(declare-fun tp!79190 () Bool)

(assert (=> mapNonEmpty!41428 (= mapRes!41428 (and tp!79190 e!619203))))

(declare-fun mapKey!41428 () (_ BitVec 32))

(declare-fun mapRest!41428 () (Array (_ BitVec 32) ValueCell!12515))

(declare-fun mapValue!41428 () ValueCell!12515)

(assert (=> mapNonEmpty!41428 (= (arr!33595 _values!874) (store mapRest!41428 mapKey!41428 mapValue!41428))))

(declare-fun b!1083713 () Bool)

(declare-fun e!619205 () Bool)

(assert (=> b!1083713 (= e!619205 tp_is_empty!26449)))

(declare-fun b!1083714 () Bool)

(declare-fun e!619202 () Bool)

(assert (=> b!1083714 (= e!619202 (and e!619205 mapRes!41428))))

(declare-fun condMapEmpty!41428 () Bool)

(declare-fun mapDefault!41428 () ValueCell!12515)

