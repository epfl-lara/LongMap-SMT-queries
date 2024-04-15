; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96184 () Bool)

(assert start!96184)

(declare-fun b_free!22843 () Bool)

(declare-fun b_next!22843 () Bool)

(assert (=> start!96184 (= b_free!22843 (not b_next!22843))))

(declare-fun tp!80377 () Bool)

(declare-fun b_and!36335 () Bool)

(assert (=> start!96184 (= tp!80377 b_and!36335)))

(declare-fun b!1092138 () Bool)

(declare-fun e!623707 () Bool)

(declare-fun e!623706 () Bool)

(declare-fun mapRes!42022 () Bool)

(assert (=> b!1092138 (= e!623707 (and e!623706 mapRes!42022))))

(declare-fun condMapEmpty!42022 () Bool)

(declare-datatypes ((V!40921 0))(
  ( (V!40922 (val!13479 Int)) )
))
(declare-datatypes ((ValueCell!12713 0))(
  ( (ValueCellFull!12713 (v!16099 V!40921)) (EmptyCell!12713) )
))
(declare-datatypes ((array!70524 0))(
  ( (array!70525 (arr!33936 (Array (_ BitVec 32) ValueCell!12713)) (size!34474 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70524)

(declare-fun mapDefault!42022 () ValueCell!12713)

(assert (=> b!1092138 (= condMapEmpty!42022 (= (arr!33936 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12713)) mapDefault!42022)))))

(declare-fun b!1092139 () Bool)

(declare-fun e!623710 () Bool)

(assert (=> b!1092139 (= e!623710 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40921)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17204 0))(
  ( (tuple2!17205 (_1!8613 (_ BitVec 64)) (_2!8613 V!40921)) )
))
(declare-datatypes ((List!23766 0))(
  ( (Nil!23763) (Cons!23762 (h!24971 tuple2!17204) (t!33658 List!23766)) )
))
(declare-datatypes ((ListLongMap!15173 0))(
  ( (ListLongMap!15174 (toList!7602 List!23766)) )
))
(declare-fun lt!487978 () ListLongMap!15173)

(declare-fun zeroValue!831 () V!40921)

(declare-datatypes ((array!70526 0))(
  ( (array!70527 (arr!33937 (Array (_ BitVec 32) (_ BitVec 64))) (size!34475 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70526)

(declare-fun getCurrentListMap!4265 (array!70526 array!70524 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1092139 (= lt!487978 (getCurrentListMap!4265 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487973 () array!70526)

(declare-fun lt!487977 () array!70524)

(declare-fun lt!487974 () ListLongMap!15173)

(assert (=> b!1092139 (= lt!487974 (getCurrentListMap!4265 lt!487973 lt!487977 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487971 () ListLongMap!15173)

(declare-fun lt!487972 () ListLongMap!15173)

(assert (=> b!1092139 (and (= lt!487971 lt!487972) (= lt!487972 lt!487971))))

(declare-fun lt!487975 () ListLongMap!15173)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!874 (ListLongMap!15173 (_ BitVec 64)) ListLongMap!15173)

(assert (=> b!1092139 (= lt!487972 (-!874 lt!487975 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35783 0))(
  ( (Unit!35784) )
))
(declare-fun lt!487979 () Unit!35783)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!149 (array!70526 array!70524 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35783)

(assert (=> b!1092139 (= lt!487979 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!149 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4135 (array!70526 array!70524 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1092139 (= lt!487971 (getCurrentListMapNoExtraKeys!4135 lt!487973 lt!487977 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2206 (Int (_ BitVec 64)) V!40921)

(assert (=> b!1092139 (= lt!487977 (array!70525 (store (arr!33936 _values!874) i!650 (ValueCellFull!12713 (dynLambda!2206 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34474 _values!874)))))

(assert (=> b!1092139 (= lt!487975 (getCurrentListMapNoExtraKeys!4135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092139 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487976 () Unit!35783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70526 (_ BitVec 64) (_ BitVec 32)) Unit!35783)

(assert (=> b!1092139 (= lt!487976 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092140 () Bool)

(declare-fun tp_is_empty!26845 () Bool)

(assert (=> b!1092140 (= e!623706 tp_is_empty!26845)))

(declare-fun b!1092141 () Bool)

(declare-fun e!623711 () Bool)

(assert (=> b!1092141 (= e!623711 e!623710)))

(declare-fun res!728778 () Bool)

(assert (=> b!1092141 (=> (not res!728778) (not e!623710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70526 (_ BitVec 32)) Bool)

(assert (=> b!1092141 (= res!728778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487973 mask!1414))))

(assert (=> b!1092141 (= lt!487973 (array!70527 (store (arr!33937 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34475 _keys!1070)))))

(declare-fun b!1092142 () Bool)

(declare-fun res!728770 () Bool)

(assert (=> b!1092142 (=> (not res!728770) (not e!623711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092142 (= res!728770 (validKeyInArray!0 k0!904))))

(declare-fun b!1092143 () Bool)

(declare-fun res!728774 () Bool)

(assert (=> b!1092143 (=> (not res!728774) (not e!623710))))

(declare-datatypes ((List!23767 0))(
  ( (Nil!23764) (Cons!23763 (h!24972 (_ BitVec 64)) (t!33659 List!23767)) )
))
(declare-fun arrayNoDuplicates!0 (array!70526 (_ BitVec 32) List!23767) Bool)

(assert (=> b!1092143 (= res!728774 (arrayNoDuplicates!0 lt!487973 #b00000000000000000000000000000000 Nil!23764))))

(declare-fun b!1092144 () Bool)

(declare-fun res!728776 () Bool)

(assert (=> b!1092144 (=> (not res!728776) (not e!623711))))

(assert (=> b!1092144 (= res!728776 (and (= (size!34474 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34475 _keys!1070) (size!34474 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092145 () Bool)

(declare-fun res!728771 () Bool)

(assert (=> b!1092145 (=> (not res!728771) (not e!623711))))

(assert (=> b!1092145 (= res!728771 (= (select (arr!33937 _keys!1070) i!650) k0!904))))

(declare-fun res!728777 () Bool)

(assert (=> start!96184 (=> (not res!728777) (not e!623711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96184 (= res!728777 (validMask!0 mask!1414))))

(assert (=> start!96184 e!623711))

(assert (=> start!96184 tp!80377))

(assert (=> start!96184 true))

(assert (=> start!96184 tp_is_empty!26845))

(declare-fun array_inv!26200 (array!70526) Bool)

(assert (=> start!96184 (array_inv!26200 _keys!1070)))

(declare-fun array_inv!26201 (array!70524) Bool)

(assert (=> start!96184 (and (array_inv!26201 _values!874) e!623707)))

(declare-fun b!1092146 () Bool)

(declare-fun e!623708 () Bool)

(assert (=> b!1092146 (= e!623708 tp_is_empty!26845)))

(declare-fun b!1092147 () Bool)

(declare-fun res!728773 () Bool)

(assert (=> b!1092147 (=> (not res!728773) (not e!623711))))

(assert (=> b!1092147 (= res!728773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092148 () Bool)

(declare-fun res!728775 () Bool)

(assert (=> b!1092148 (=> (not res!728775) (not e!623711))))

(assert (=> b!1092148 (= res!728775 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23764))))

(declare-fun b!1092149 () Bool)

(declare-fun res!728772 () Bool)

(assert (=> b!1092149 (=> (not res!728772) (not e!623711))))

(assert (=> b!1092149 (= res!728772 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34475 _keys!1070))))))

(declare-fun mapIsEmpty!42022 () Bool)

(assert (=> mapIsEmpty!42022 mapRes!42022))

(declare-fun mapNonEmpty!42022 () Bool)

(declare-fun tp!80378 () Bool)

(assert (=> mapNonEmpty!42022 (= mapRes!42022 (and tp!80378 e!623708))))

(declare-fun mapRest!42022 () (Array (_ BitVec 32) ValueCell!12713))

(declare-fun mapValue!42022 () ValueCell!12713)

(declare-fun mapKey!42022 () (_ BitVec 32))

(assert (=> mapNonEmpty!42022 (= (arr!33936 _values!874) (store mapRest!42022 mapKey!42022 mapValue!42022))))

(assert (= (and start!96184 res!728777) b!1092144))

(assert (= (and b!1092144 res!728776) b!1092147))

(assert (= (and b!1092147 res!728773) b!1092148))

(assert (= (and b!1092148 res!728775) b!1092149))

(assert (= (and b!1092149 res!728772) b!1092142))

(assert (= (and b!1092142 res!728770) b!1092145))

(assert (= (and b!1092145 res!728771) b!1092141))

(assert (= (and b!1092141 res!728778) b!1092143))

(assert (= (and b!1092143 res!728774) b!1092139))

(assert (= (and b!1092138 condMapEmpty!42022) mapIsEmpty!42022))

(assert (= (and b!1092138 (not condMapEmpty!42022)) mapNonEmpty!42022))

(get-info :version)

(assert (= (and mapNonEmpty!42022 ((_ is ValueCellFull!12713) mapValue!42022)) b!1092146))

(assert (= (and b!1092138 ((_ is ValueCellFull!12713) mapDefault!42022)) b!1092140))

(assert (= start!96184 b!1092138))

(declare-fun b_lambda!17491 () Bool)

(assert (=> (not b_lambda!17491) (not b!1092139)))

(declare-fun t!33657 () Bool)

(declare-fun tb!7713 () Bool)

(assert (=> (and start!96184 (= defaultEntry!882 defaultEntry!882) t!33657) tb!7713))

(declare-fun result!15953 () Bool)

(assert (=> tb!7713 (= result!15953 tp_is_empty!26845)))

(assert (=> b!1092139 t!33657))

(declare-fun b_and!36337 () Bool)

(assert (= b_and!36335 (and (=> t!33657 result!15953) b_and!36337)))

(declare-fun m!1011413 () Bool)

(assert (=> b!1092141 m!1011413))

(declare-fun m!1011415 () Bool)

(assert (=> b!1092141 m!1011415))

(declare-fun m!1011417 () Bool)

(assert (=> b!1092145 m!1011417))

(declare-fun m!1011419 () Bool)

(assert (=> mapNonEmpty!42022 m!1011419))

(declare-fun m!1011421 () Bool)

(assert (=> start!96184 m!1011421))

(declare-fun m!1011423 () Bool)

(assert (=> start!96184 m!1011423))

(declare-fun m!1011425 () Bool)

(assert (=> start!96184 m!1011425))

(declare-fun m!1011427 () Bool)

(assert (=> b!1092148 m!1011427))

(declare-fun m!1011429 () Bool)

(assert (=> b!1092147 m!1011429))

(declare-fun m!1011431 () Bool)

(assert (=> b!1092142 m!1011431))

(declare-fun m!1011433 () Bool)

(assert (=> b!1092143 m!1011433))

(declare-fun m!1011435 () Bool)

(assert (=> b!1092139 m!1011435))

(declare-fun m!1011437 () Bool)

(assert (=> b!1092139 m!1011437))

(declare-fun m!1011439 () Bool)

(assert (=> b!1092139 m!1011439))

(declare-fun m!1011441 () Bool)

(assert (=> b!1092139 m!1011441))

(declare-fun m!1011443 () Bool)

(assert (=> b!1092139 m!1011443))

(declare-fun m!1011445 () Bool)

(assert (=> b!1092139 m!1011445))

(declare-fun m!1011447 () Bool)

(assert (=> b!1092139 m!1011447))

(declare-fun m!1011449 () Bool)

(assert (=> b!1092139 m!1011449))

(declare-fun m!1011451 () Bool)

(assert (=> b!1092139 m!1011451))

(declare-fun m!1011453 () Bool)

(assert (=> b!1092139 m!1011453))

(check-sat (not b_lambda!17491) (not b!1092142) (not b!1092139) tp_is_empty!26845 (not mapNonEmpty!42022) (not b!1092148) (not start!96184) (not b!1092143) (not b!1092141) (not b_next!22843) b_and!36337 (not b!1092147))
(check-sat b_and!36337 (not b_next!22843))
