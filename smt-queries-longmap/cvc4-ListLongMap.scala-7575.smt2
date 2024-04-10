; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95774 () Bool)

(assert start!95774)

(declare-fun b_free!22427 () Bool)

(declare-fun b_next!22427 () Bool)

(assert (=> start!95774 (= b_free!22427 (not b_next!22427))))

(declare-fun tp!79129 () Bool)

(declare-fun b_and!35529 () Bool)

(assert (=> start!95774 (= tp!79129 b_and!35529)))

(declare-fun b!1083325 () Bool)

(declare-fun e!619021 () Bool)

(assert (=> b!1083325 (= e!619021 (not true))))

(declare-datatypes ((V!40365 0))(
  ( (V!40366 (val!13271 Int)) )
))
(declare-datatypes ((tuple2!16816 0))(
  ( (tuple2!16817 (_1!8419 (_ BitVec 64)) (_2!8419 V!40365)) )
))
(declare-datatypes ((List!23403 0))(
  ( (Nil!23400) (Cons!23399 (h!24608 tuple2!16816) (t!32888 List!23403)) )
))
(declare-datatypes ((ListLongMap!14785 0))(
  ( (ListLongMap!14786 (toList!7408 List!23403)) )
))
(declare-fun lt!480020 () ListLongMap!14785)

(declare-fun lt!480021 () ListLongMap!14785)

(assert (=> b!1083325 (and (= lt!480020 lt!480021) (= lt!480021 lt!480020))))

(declare-fun lt!480025 () ListLongMap!14785)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!735 (ListLongMap!14785 (_ BitVec 64)) ListLongMap!14785)

(assert (=> b!1083325 (= lt!480021 (-!735 lt!480025 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!35636 0))(
  ( (Unit!35637) )
))
(declare-fun lt!480023 () Unit!35636)

(declare-fun minValue!831 () V!40365)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40365)

(declare-datatypes ((array!69801 0))(
  ( (array!69802 (arr!33574 (Array (_ BitVec 32) (_ BitVec 64))) (size!34110 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69801)

(declare-datatypes ((ValueCell!12505 0))(
  ( (ValueCellFull!12505 (v!15892 V!40365)) (EmptyCell!12505) )
))
(declare-datatypes ((array!69803 0))(
  ( (array!69804 (arr!33575 (Array (_ BitVec 32) ValueCell!12505)) (size!34111 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69803)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!15 (array!69801 array!69803 (_ BitVec 32) (_ BitVec 32) V!40365 V!40365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35636)

(assert (=> b!1083325 (= lt!480023 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!15 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480024 () array!69801)

(declare-fun getCurrentListMapNoExtraKeys!3956 (array!69801 array!69803 (_ BitVec 32) (_ BitVec 32) V!40365 V!40365 (_ BitVec 32) Int) ListLongMap!14785)

(declare-fun dynLambda!2093 (Int (_ BitVec 64)) V!40365)

(assert (=> b!1083325 (= lt!480020 (getCurrentListMapNoExtraKeys!3956 lt!480024 (array!69804 (store (arr!33575 _values!874) i!650 (ValueCellFull!12505 (dynLambda!2093 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34111 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083325 (= lt!480025 (getCurrentListMapNoExtraKeys!3956 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083325 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480022 () Unit!35636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69801 (_ BitVec 64) (_ BitVec 32)) Unit!35636)

(assert (=> b!1083325 (= lt!480022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083326 () Bool)

(declare-fun res!722167 () Bool)

(declare-fun e!619024 () Bool)

(assert (=> b!1083326 (=> (not res!722167) (not e!619024))))

(assert (=> b!1083326 (= res!722167 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34110 _keys!1070))))))

(declare-fun mapNonEmpty!41398 () Bool)

(declare-fun mapRes!41398 () Bool)

(declare-fun tp!79130 () Bool)

(declare-fun e!619023 () Bool)

(assert (=> mapNonEmpty!41398 (= mapRes!41398 (and tp!79130 e!619023))))

(declare-fun mapValue!41398 () ValueCell!12505)

(declare-fun mapRest!41398 () (Array (_ BitVec 32) ValueCell!12505))

(declare-fun mapKey!41398 () (_ BitVec 32))

(assert (=> mapNonEmpty!41398 (= (arr!33575 _values!874) (store mapRest!41398 mapKey!41398 mapValue!41398))))

(declare-fun res!722168 () Bool)

(assert (=> start!95774 (=> (not res!722168) (not e!619024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95774 (= res!722168 (validMask!0 mask!1414))))

(assert (=> start!95774 e!619024))

(assert (=> start!95774 tp!79129))

(assert (=> start!95774 true))

(declare-fun tp_is_empty!26429 () Bool)

(assert (=> start!95774 tp_is_empty!26429))

(declare-fun array_inv!25912 (array!69801) Bool)

(assert (=> start!95774 (array_inv!25912 _keys!1070)))

(declare-fun e!619025 () Bool)

(declare-fun array_inv!25913 (array!69803) Bool)

(assert (=> start!95774 (and (array_inv!25913 _values!874) e!619025)))

(declare-fun b!1083327 () Bool)

(declare-fun res!722163 () Bool)

(assert (=> b!1083327 (=> (not res!722163) (not e!619024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69801 (_ BitVec 32)) Bool)

(assert (=> b!1083327 (= res!722163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083328 () Bool)

(assert (=> b!1083328 (= e!619023 tp_is_empty!26429)))

(declare-fun b!1083329 () Bool)

(declare-fun res!722165 () Bool)

(assert (=> b!1083329 (=> (not res!722165) (not e!619024))))

(assert (=> b!1083329 (= res!722165 (and (= (size!34111 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34110 _keys!1070) (size!34111 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083330 () Bool)

(declare-fun res!722166 () Bool)

(assert (=> b!1083330 (=> (not res!722166) (not e!619024))))

(assert (=> b!1083330 (= res!722166 (= (select (arr!33574 _keys!1070) i!650) k!904))))

(declare-fun b!1083331 () Bool)

(declare-fun res!722161 () Bool)

(assert (=> b!1083331 (=> (not res!722161) (not e!619024))))

(declare-datatypes ((List!23404 0))(
  ( (Nil!23401) (Cons!23400 (h!24609 (_ BitVec 64)) (t!32889 List!23404)) )
))
(declare-fun arrayNoDuplicates!0 (array!69801 (_ BitVec 32) List!23404) Bool)

(assert (=> b!1083331 (= res!722161 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23401))))

(declare-fun b!1083332 () Bool)

(declare-fun e!619022 () Bool)

(assert (=> b!1083332 (= e!619022 tp_is_empty!26429)))

(declare-fun b!1083333 () Bool)

(assert (=> b!1083333 (= e!619024 e!619021)))

(declare-fun res!722169 () Bool)

(assert (=> b!1083333 (=> (not res!722169) (not e!619021))))

(assert (=> b!1083333 (= res!722169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480024 mask!1414))))

(assert (=> b!1083333 (= lt!480024 (array!69802 (store (arr!33574 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34110 _keys!1070)))))

(declare-fun b!1083334 () Bool)

(declare-fun res!722162 () Bool)

(assert (=> b!1083334 (=> (not res!722162) (not e!619021))))

(assert (=> b!1083334 (= res!722162 (arrayNoDuplicates!0 lt!480024 #b00000000000000000000000000000000 Nil!23401))))

(declare-fun mapIsEmpty!41398 () Bool)

(assert (=> mapIsEmpty!41398 mapRes!41398))

(declare-fun b!1083335 () Bool)

(assert (=> b!1083335 (= e!619025 (and e!619022 mapRes!41398))))

(declare-fun condMapEmpty!41398 () Bool)

(declare-fun mapDefault!41398 () ValueCell!12505)

