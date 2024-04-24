; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96608 () Bool)

(assert start!96608)

(declare-fun b_free!22951 () Bool)

(declare-fun b_next!22951 () Bool)

(assert (=> start!96608 (= b_free!22951 (not b_next!22951))))

(declare-fun tp!80779 () Bool)

(declare-fun b_and!36587 () Bool)

(assert (=> start!96608 (= tp!80779 b_and!36587)))

(declare-fun b!1096493 () Bool)

(declare-fun res!731379 () Bool)

(declare-fun e!626110 () Bool)

(assert (=> b!1096493 (=> (not res!731379) (not e!626110))))

(declare-datatypes ((array!70951 0))(
  ( (array!70952 (arr!34141 (Array (_ BitVec 32) (_ BitVec 64))) (size!34678 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70951)

(declare-datatypes ((List!23846 0))(
  ( (Nil!23843) (Cons!23842 (h!25060 (_ BitVec 64)) (t!33845 List!23846)) )
))
(declare-fun arrayNoDuplicates!0 (array!70951 (_ BitVec 32) List!23846) Bool)

(assert (=> b!1096493 (= res!731379 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23843))))

(declare-fun b!1096494 () Bool)

(declare-fun res!731380 () Bool)

(assert (=> b!1096494 (=> (not res!731380) (not e!626110))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096494 (= res!731380 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34678 _keys!1070))))))

(declare-fun mapNonEmpty!42262 () Bool)

(declare-fun mapRes!42262 () Bool)

(declare-fun tp!80780 () Bool)

(declare-fun e!626106 () Bool)

(assert (=> mapNonEmpty!42262 (= mapRes!42262 (and tp!80780 e!626106))))

(declare-datatypes ((V!41129 0))(
  ( (V!41130 (val!13557 Int)) )
))
(declare-datatypes ((ValueCell!12791 0))(
  ( (ValueCellFull!12791 (v!16174 V!41129)) (EmptyCell!12791) )
))
(declare-datatypes ((array!70953 0))(
  ( (array!70954 (arr!34142 (Array (_ BitVec 32) ValueCell!12791)) (size!34679 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70953)

(declare-fun mapRest!42262 () (Array (_ BitVec 32) ValueCell!12791))

(declare-fun mapValue!42262 () ValueCell!12791)

(declare-fun mapKey!42262 () (_ BitVec 32))

(assert (=> mapNonEmpty!42262 (= (arr!34142 _values!874) (store mapRest!42262 mapKey!42262 mapValue!42262))))

(declare-fun b!1096495 () Bool)

(declare-fun res!731382 () Bool)

(assert (=> b!1096495 (=> (not res!731382) (not e!626110))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096495 (= res!731382 (and (= (size!34679 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34678 _keys!1070) (size!34679 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096496 () Bool)

(declare-fun e!626108 () Bool)

(assert (=> b!1096496 (= e!626110 e!626108)))

(declare-fun res!731378 () Bool)

(assert (=> b!1096496 (=> (not res!731378) (not e!626108))))

(declare-fun lt!490275 () array!70951)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70951 (_ BitVec 32)) Bool)

(assert (=> b!1096496 (= res!731378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490275 mask!1414))))

(assert (=> b!1096496 (= lt!490275 (array!70952 (store (arr!34141 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34678 _keys!1070)))))

(declare-fun b!1096497 () Bool)

(declare-fun tp_is_empty!27001 () Bool)

(assert (=> b!1096497 (= e!626106 tp_is_empty!27001)))

(declare-fun b!1096498 () Bool)

(assert (=> b!1096498 (= e!626108 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41129)

(declare-datatypes ((tuple2!17228 0))(
  ( (tuple2!17229 (_1!8625 (_ BitVec 64)) (_2!8625 V!41129)) )
))
(declare-datatypes ((List!23847 0))(
  ( (Nil!23844) (Cons!23843 (h!25061 tuple2!17228) (t!33846 List!23847)) )
))
(declare-datatypes ((ListLongMap!15205 0))(
  ( (ListLongMap!15206 (toList!7618 List!23847)) )
))
(declare-fun lt!490274 () ListLongMap!15205)

(declare-fun zeroValue!831 () V!41129)

(declare-fun getCurrentListMapNoExtraKeys!4171 (array!70951 array!70953 (_ BitVec 32) (_ BitVec 32) V!41129 V!41129 (_ BitVec 32) Int) ListLongMap!15205)

(assert (=> b!1096498 (= lt!490274 (getCurrentListMapNoExtraKeys!4171 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096498 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36023 0))(
  ( (Unit!36024) )
))
(declare-fun lt!490273 () Unit!36023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70951 (_ BitVec 64) (_ BitVec 32)) Unit!36023)

(assert (=> b!1096498 (= lt!490273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096499 () Bool)

(declare-fun e!626109 () Bool)

(declare-fun e!626105 () Bool)

(assert (=> b!1096499 (= e!626109 (and e!626105 mapRes!42262))))

(declare-fun condMapEmpty!42262 () Bool)

(declare-fun mapDefault!42262 () ValueCell!12791)

(assert (=> b!1096499 (= condMapEmpty!42262 (= (arr!34142 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12791)) mapDefault!42262)))))

(declare-fun b!1096500 () Bool)

(declare-fun res!731384 () Bool)

(assert (=> b!1096500 (=> (not res!731384) (not e!626108))))

(assert (=> b!1096500 (= res!731384 (arrayNoDuplicates!0 lt!490275 #b00000000000000000000000000000000 Nil!23843))))

(declare-fun b!1096501 () Bool)

(declare-fun res!731383 () Bool)

(assert (=> b!1096501 (=> (not res!731383) (not e!626110))))

(assert (=> b!1096501 (= res!731383 (= (select (arr!34141 _keys!1070) i!650) k0!904))))

(declare-fun b!1096502 () Bool)

(declare-fun res!731386 () Bool)

(assert (=> b!1096502 (=> (not res!731386) (not e!626110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096502 (= res!731386 (validKeyInArray!0 k0!904))))

(declare-fun b!1096503 () Bool)

(declare-fun res!731381 () Bool)

(assert (=> b!1096503 (=> (not res!731381) (not e!626110))))

(assert (=> b!1096503 (= res!731381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096504 () Bool)

(assert (=> b!1096504 (= e!626105 tp_is_empty!27001)))

(declare-fun mapIsEmpty!42262 () Bool)

(assert (=> mapIsEmpty!42262 mapRes!42262))

(declare-fun res!731385 () Bool)

(assert (=> start!96608 (=> (not res!731385) (not e!626110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96608 (= res!731385 (validMask!0 mask!1414))))

(assert (=> start!96608 e!626110))

(assert (=> start!96608 tp!80779))

(assert (=> start!96608 true))

(assert (=> start!96608 tp_is_empty!27001))

(declare-fun array_inv!26342 (array!70951) Bool)

(assert (=> start!96608 (array_inv!26342 _keys!1070)))

(declare-fun array_inv!26343 (array!70953) Bool)

(assert (=> start!96608 (and (array_inv!26343 _values!874) e!626109)))

(assert (= (and start!96608 res!731385) b!1096495))

(assert (= (and b!1096495 res!731382) b!1096503))

(assert (= (and b!1096503 res!731381) b!1096493))

(assert (= (and b!1096493 res!731379) b!1096494))

(assert (= (and b!1096494 res!731380) b!1096502))

(assert (= (and b!1096502 res!731386) b!1096501))

(assert (= (and b!1096501 res!731383) b!1096496))

(assert (= (and b!1096496 res!731378) b!1096500))

(assert (= (and b!1096500 res!731384) b!1096498))

(assert (= (and b!1096499 condMapEmpty!42262) mapIsEmpty!42262))

(assert (= (and b!1096499 (not condMapEmpty!42262)) mapNonEmpty!42262))

(get-info :version)

(assert (= (and mapNonEmpty!42262 ((_ is ValueCellFull!12791) mapValue!42262)) b!1096497))

(assert (= (and b!1096499 ((_ is ValueCellFull!12791) mapDefault!42262)) b!1096504))

(assert (= start!96608 b!1096499))

(declare-fun m!1016529 () Bool)

(assert (=> start!96608 m!1016529))

(declare-fun m!1016531 () Bool)

(assert (=> start!96608 m!1016531))

(declare-fun m!1016533 () Bool)

(assert (=> start!96608 m!1016533))

(declare-fun m!1016535 () Bool)

(assert (=> b!1096493 m!1016535))

(declare-fun m!1016537 () Bool)

(assert (=> b!1096496 m!1016537))

(declare-fun m!1016539 () Bool)

(assert (=> b!1096496 m!1016539))

(declare-fun m!1016541 () Bool)

(assert (=> b!1096502 m!1016541))

(declare-fun m!1016543 () Bool)

(assert (=> b!1096501 m!1016543))

(declare-fun m!1016545 () Bool)

(assert (=> b!1096503 m!1016545))

(declare-fun m!1016547 () Bool)

(assert (=> mapNonEmpty!42262 m!1016547))

(declare-fun m!1016549 () Bool)

(assert (=> b!1096498 m!1016549))

(declare-fun m!1016551 () Bool)

(assert (=> b!1096498 m!1016551))

(declare-fun m!1016553 () Bool)

(assert (=> b!1096498 m!1016553))

(declare-fun m!1016555 () Bool)

(assert (=> b!1096500 m!1016555))

(check-sat (not mapNonEmpty!42262) (not b!1096496) (not b!1096500) (not b!1096498) tp_is_empty!27001 (not start!96608) b_and!36587 (not b!1096502) (not b_next!22951) (not b!1096503) (not b!1096493))
(check-sat b_and!36587 (not b_next!22951))
