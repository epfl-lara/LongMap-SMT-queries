; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96296 () Bool)

(assert start!96296)

(declare-fun b_free!22949 () Bool)

(declare-fun b_next!22949 () Bool)

(assert (=> start!96296 (= b_free!22949 (not b_next!22949))))

(declare-fun tp!80696 () Bool)

(declare-fun b_and!36573 () Bool)

(assert (=> start!96296 (= tp!80696 b_and!36573)))

(declare-fun b!1094305 () Bool)

(declare-fun res!730275 () Bool)

(declare-fun e!624754 () Bool)

(assert (=> b!1094305 (=> (not res!730275) (not e!624754))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70817 0))(
  ( (array!70818 (arr!34082 (Array (_ BitVec 32) (_ BitVec 64))) (size!34618 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70817)

(assert (=> b!1094305 (= res!730275 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34618 _keys!1070))))))

(declare-fun b!1094306 () Bool)

(declare-fun res!730272 () Bool)

(assert (=> b!1094306 (=> (not res!730272) (not e!624754))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70817 (_ BitVec 32)) Bool)

(assert (=> b!1094306 (= res!730272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094307 () Bool)

(declare-fun e!624753 () Bool)

(declare-fun tp_is_empty!26951 () Bool)

(assert (=> b!1094307 (= e!624753 tp_is_empty!26951)))

(declare-fun mapIsEmpty!42181 () Bool)

(declare-fun mapRes!42181 () Bool)

(assert (=> mapIsEmpty!42181 mapRes!42181))

(declare-fun mapNonEmpty!42181 () Bool)

(declare-fun tp!80695 () Bool)

(assert (=> mapNonEmpty!42181 (= mapRes!42181 (and tp!80695 e!624753))))

(declare-datatypes ((V!41061 0))(
  ( (V!41062 (val!13532 Int)) )
))
(declare-datatypes ((ValueCell!12766 0))(
  ( (ValueCellFull!12766 (v!16153 V!41061)) (EmptyCell!12766) )
))
(declare-datatypes ((array!70819 0))(
  ( (array!70820 (arr!34083 (Array (_ BitVec 32) ValueCell!12766)) (size!34619 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70819)

(declare-fun mapKey!42181 () (_ BitVec 32))

(declare-fun mapValue!42181 () ValueCell!12766)

(declare-fun mapRest!42181 () (Array (_ BitVec 32) ValueCell!12766))

(assert (=> mapNonEmpty!42181 (= (arr!34083 _values!874) (store mapRest!42181 mapKey!42181 mapValue!42181))))

(declare-fun res!730271 () Bool)

(assert (=> start!96296 (=> (not res!730271) (not e!624754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96296 (= res!730271 (validMask!0 mask!1414))))

(assert (=> start!96296 e!624754))

(assert (=> start!96296 tp!80696))

(assert (=> start!96296 true))

(assert (=> start!96296 tp_is_empty!26951))

(declare-fun array_inv!26266 (array!70817) Bool)

(assert (=> start!96296 (array_inv!26266 _keys!1070)))

(declare-fun e!624756 () Bool)

(declare-fun array_inv!26267 (array!70819) Bool)

(assert (=> start!96296 (and (array_inv!26267 _values!874) e!624756)))

(declare-fun b!1094308 () Bool)

(declare-fun e!624755 () Bool)

(assert (=> b!1094308 (= e!624754 e!624755)))

(declare-fun res!730277 () Bool)

(assert (=> b!1094308 (=> (not res!730277) (not e!624755))))

(declare-fun lt!489627 () array!70817)

(assert (=> b!1094308 (= res!730277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489627 mask!1414))))

(assert (=> b!1094308 (= lt!489627 (array!70818 (store (arr!34082 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34618 _keys!1070)))))

(declare-fun lt!489624 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17216 0))(
  ( (tuple2!17217 (_1!8619 (_ BitVec 64)) (_2!8619 V!41061)) )
))
(declare-datatypes ((List!23813 0))(
  ( (Nil!23810) (Cons!23809 (h!25018 tuple2!17216) (t!33820 List!23813)) )
))
(declare-datatypes ((ListLongMap!15185 0))(
  ( (ListLongMap!15186 (toList!7608 List!23813)) )
))
(declare-fun lt!489628 () ListLongMap!15185)

(declare-fun lt!489626 () ListLongMap!15185)

(declare-fun b!1094309 () Bool)

(assert (=> b!1094309 (= e!624755 (not (or (and (not lt!489624) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!489624) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!489624) (not (= lt!489628 lt!489626)) (bvsle #b00000000000000000000000000000000 (size!34618 _keys!1070)))))))

(assert (=> b!1094309 (= lt!489624 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41061)

(declare-fun lt!489620 () ListLongMap!15185)

(declare-fun zeroValue!831 () V!41061)

(declare-fun getCurrentListMap!4364 (array!70817 array!70819 (_ BitVec 32) (_ BitVec 32) V!41061 V!41061 (_ BitVec 32) Int) ListLongMap!15185)

(assert (=> b!1094309 (= lt!489620 (getCurrentListMap!4364 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489622 () array!70819)

(assert (=> b!1094309 (= lt!489628 (getCurrentListMap!4364 lt!489627 lt!489622 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489621 () ListLongMap!15185)

(assert (=> b!1094309 (and (= lt!489626 lt!489621) (= lt!489621 lt!489626))))

(declare-fun lt!489623 () ListLongMap!15185)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!927 (ListLongMap!15185 (_ BitVec 64)) ListLongMap!15185)

(assert (=> b!1094309 (= lt!489621 (-!927 lt!489623 k!904))))

(declare-datatypes ((Unit!36020 0))(
  ( (Unit!36021) )
))
(declare-fun lt!489619 () Unit!36020)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 (array!70817 array!70819 (_ BitVec 32) (_ BitVec 32) V!41061 V!41061 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36020)

(assert (=> b!1094309 (= lt!489619 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!183 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4124 (array!70817 array!70819 (_ BitVec 32) (_ BitVec 32) V!41061 V!41061 (_ BitVec 32) Int) ListLongMap!15185)

(assert (=> b!1094309 (= lt!489626 (getCurrentListMapNoExtraKeys!4124 lt!489627 lt!489622 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2261 (Int (_ BitVec 64)) V!41061)

(assert (=> b!1094309 (= lt!489622 (array!70820 (store (arr!34083 _values!874) i!650 (ValueCellFull!12766 (dynLambda!2261 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34619 _values!874)))))

(assert (=> b!1094309 (= lt!489623 (getCurrentListMapNoExtraKeys!4124 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094309 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489625 () Unit!36020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70817 (_ BitVec 64) (_ BitVec 32)) Unit!36020)

(assert (=> b!1094309 (= lt!489625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1094310 () Bool)

(declare-fun res!730278 () Bool)

(assert (=> b!1094310 (=> (not res!730278) (not e!624754))))

(assert (=> b!1094310 (= res!730278 (and (= (size!34619 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34618 _keys!1070) (size!34619 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094311 () Bool)

(declare-fun res!730273 () Bool)

(assert (=> b!1094311 (=> (not res!730273) (not e!624754))))

(declare-datatypes ((List!23814 0))(
  ( (Nil!23811) (Cons!23810 (h!25019 (_ BitVec 64)) (t!33821 List!23814)) )
))
(declare-fun arrayNoDuplicates!0 (array!70817 (_ BitVec 32) List!23814) Bool)

(assert (=> b!1094311 (= res!730273 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23811))))

(declare-fun b!1094312 () Bool)

(declare-fun res!730274 () Bool)

(assert (=> b!1094312 (=> (not res!730274) (not e!624755))))

(assert (=> b!1094312 (= res!730274 (arrayNoDuplicates!0 lt!489627 #b00000000000000000000000000000000 Nil!23811))))

(declare-fun b!1094313 () Bool)

(declare-fun e!624758 () Bool)

(assert (=> b!1094313 (= e!624758 tp_is_empty!26951)))

(declare-fun b!1094314 () Bool)

(declare-fun res!730276 () Bool)

(assert (=> b!1094314 (=> (not res!730276) (not e!624754))))

(assert (=> b!1094314 (= res!730276 (= (select (arr!34082 _keys!1070) i!650) k!904))))

(declare-fun b!1094315 () Bool)

(assert (=> b!1094315 (= e!624756 (and e!624758 mapRes!42181))))

(declare-fun condMapEmpty!42181 () Bool)

(declare-fun mapDefault!42181 () ValueCell!12766)

