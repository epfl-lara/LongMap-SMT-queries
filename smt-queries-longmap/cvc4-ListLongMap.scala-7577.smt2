; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95786 () Bool)

(assert start!95786)

(declare-fun b_free!22439 () Bool)

(declare-fun b_next!22439 () Bool)

(assert (=> start!95786 (= b_free!22439 (not b_next!22439))))

(declare-fun tp!79165 () Bool)

(declare-fun b_and!35553 () Bool)

(assert (=> start!95786 (= tp!79165 b_and!35553)))

(declare-fun b!1083553 () Bool)

(declare-fun res!722330 () Bool)

(declare-fun e!619133 () Bool)

(assert (=> b!1083553 (=> (not res!722330) (not e!619133))))

(declare-datatypes ((array!69825 0))(
  ( (array!69826 (arr!33586 (Array (_ BitVec 32) (_ BitVec 64))) (size!34122 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69825)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69825 (_ BitVec 32)) Bool)

(assert (=> b!1083553 (= res!722330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083554 () Bool)

(declare-fun res!722331 () Bool)

(assert (=> b!1083554 (=> (not res!722331) (not e!619133))))

(declare-datatypes ((List!23412 0))(
  ( (Nil!23409) (Cons!23408 (h!24617 (_ BitVec 64)) (t!32909 List!23412)) )
))
(declare-fun arrayNoDuplicates!0 (array!69825 (_ BitVec 32) List!23412) Bool)

(assert (=> b!1083554 (= res!722331 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23409))))

(declare-fun b!1083555 () Bool)

(declare-fun e!619132 () Bool)

(assert (=> b!1083555 (= e!619133 e!619132)))

(declare-fun res!722327 () Bool)

(assert (=> b!1083555 (=> (not res!722327) (not e!619132))))

(declare-fun lt!480129 () array!69825)

(assert (=> b!1083555 (= res!722327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480129 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083555 (= lt!480129 (array!69826 (store (arr!33586 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34122 _keys!1070)))))

(declare-fun b!1083556 () Bool)

(declare-fun res!722323 () Bool)

(assert (=> b!1083556 (=> (not res!722323) (not e!619133))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083556 (= res!722323 (validKeyInArray!0 k!904))))

(declare-fun b!1083557 () Bool)

(declare-fun res!722329 () Bool)

(assert (=> b!1083557 (=> (not res!722329) (not e!619132))))

(assert (=> b!1083557 (= res!722329 (arrayNoDuplicates!0 lt!480129 #b00000000000000000000000000000000 Nil!23409))))

(declare-fun b!1083558 () Bool)

(declare-fun e!619130 () Bool)

(declare-fun tp_is_empty!26441 () Bool)

(assert (=> b!1083558 (= e!619130 tp_is_empty!26441)))

(declare-fun mapIsEmpty!41416 () Bool)

(declare-fun mapRes!41416 () Bool)

(assert (=> mapIsEmpty!41416 mapRes!41416))

(declare-fun b!1083559 () Bool)

(declare-fun e!619128 () Bool)

(assert (=> b!1083559 (= e!619128 tp_is_empty!26441)))

(declare-fun b!1083560 () Bool)

(declare-fun res!722328 () Bool)

(assert (=> b!1083560 (=> (not res!722328) (not e!619133))))

(assert (=> b!1083560 (= res!722328 (= (select (arr!33586 _keys!1070) i!650) k!904))))

(declare-fun res!722324 () Bool)

(assert (=> start!95786 (=> (not res!722324) (not e!619133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95786 (= res!722324 (validMask!0 mask!1414))))

(assert (=> start!95786 e!619133))

(assert (=> start!95786 tp!79165))

(assert (=> start!95786 true))

(assert (=> start!95786 tp_is_empty!26441))

(declare-fun array_inv!25922 (array!69825) Bool)

(assert (=> start!95786 (array_inv!25922 _keys!1070)))

(declare-datatypes ((V!40381 0))(
  ( (V!40382 (val!13277 Int)) )
))
(declare-datatypes ((ValueCell!12511 0))(
  ( (ValueCellFull!12511 (v!15898 V!40381)) (EmptyCell!12511) )
))
(declare-datatypes ((array!69827 0))(
  ( (array!69828 (arr!33587 (Array (_ BitVec 32) ValueCell!12511)) (size!34123 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69827)

(declare-fun e!619129 () Bool)

(declare-fun array_inv!25923 (array!69827) Bool)

(assert (=> start!95786 (and (array_inv!25923 _values!874) e!619129)))

(declare-fun b!1083561 () Bool)

(assert (=> b!1083561 (= e!619132 (not (bvsle #b00000000000000000000000000000000 (size!34122 _keys!1070))))))

(declare-datatypes ((tuple2!16824 0))(
  ( (tuple2!16825 (_1!8423 (_ BitVec 64)) (_2!8423 V!40381)) )
))
(declare-datatypes ((List!23413 0))(
  ( (Nil!23410) (Cons!23409 (h!24618 tuple2!16824) (t!32910 List!23413)) )
))
(declare-datatypes ((ListLongMap!14793 0))(
  ( (ListLongMap!14794 (toList!7412 List!23413)) )
))
(declare-fun lt!480132 () ListLongMap!14793)

(declare-fun lt!480131 () ListLongMap!14793)

(assert (=> b!1083561 (and (= lt!480132 lt!480131) (= lt!480131 lt!480132))))

(declare-fun lt!480130 () ListLongMap!14793)

(declare-fun -!739 (ListLongMap!14793 (_ BitVec 64)) ListLongMap!14793)

(assert (=> b!1083561 (= lt!480131 (-!739 lt!480130 k!904))))

(declare-datatypes ((Unit!35644 0))(
  ( (Unit!35645) )
))
(declare-fun lt!480128 () Unit!35644)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40381)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40381)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!19 (array!69825 array!69827 (_ BitVec 32) (_ BitVec 32) V!40381 V!40381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35644)

(assert (=> b!1083561 (= lt!480128 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!19 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3960 (array!69825 array!69827 (_ BitVec 32) (_ BitVec 32) V!40381 V!40381 (_ BitVec 32) Int) ListLongMap!14793)

(declare-fun dynLambda!2097 (Int (_ BitVec 64)) V!40381)

(assert (=> b!1083561 (= lt!480132 (getCurrentListMapNoExtraKeys!3960 lt!480129 (array!69828 (store (arr!33587 _values!874) i!650 (ValueCellFull!12511 (dynLambda!2097 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34123 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083561 (= lt!480130 (getCurrentListMapNoExtraKeys!3960 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083561 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480133 () Unit!35644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69825 (_ BitVec 64) (_ BitVec 32)) Unit!35644)

(assert (=> b!1083561 (= lt!480133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!41416 () Bool)

(declare-fun tp!79166 () Bool)

(assert (=> mapNonEmpty!41416 (= mapRes!41416 (and tp!79166 e!619128))))

(declare-fun mapValue!41416 () ValueCell!12511)

(declare-fun mapKey!41416 () (_ BitVec 32))

(declare-fun mapRest!41416 () (Array (_ BitVec 32) ValueCell!12511))

(assert (=> mapNonEmpty!41416 (= (arr!33587 _values!874) (store mapRest!41416 mapKey!41416 mapValue!41416))))

(declare-fun b!1083562 () Bool)

(declare-fun res!722325 () Bool)

(assert (=> b!1083562 (=> (not res!722325) (not e!619133))))

(assert (=> b!1083562 (= res!722325 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34122 _keys!1070))))))

(declare-fun b!1083563 () Bool)

(assert (=> b!1083563 (= e!619129 (and e!619130 mapRes!41416))))

(declare-fun condMapEmpty!41416 () Bool)

(declare-fun mapDefault!41416 () ValueCell!12511)

