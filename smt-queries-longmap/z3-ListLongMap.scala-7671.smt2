; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96366 () Bool)

(assert start!96366)

(declare-fun b_free!22951 () Bool)

(declare-fun b_next!22951 () Bool)

(assert (=> start!96366 (= b_free!22951 (not b_next!22951))))

(declare-fun tp!80780 () Bool)

(declare-fun b_and!36551 () Bool)

(assert (=> start!96366 (= tp!80780 b_and!36551)))

(declare-fun b!1095013 () Bool)

(declare-fun e!625157 () Bool)

(declare-fun tp_is_empty!27001 () Bool)

(assert (=> b!1095013 (= e!625157 tp_is_empty!27001)))

(declare-fun b!1095014 () Bool)

(declare-fun res!730789 () Bool)

(declare-fun e!625159 () Bool)

(assert (=> b!1095014 (=> (not res!730789) (not e!625159))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095014 (= res!730789 (validKeyInArray!0 k0!904))))

(declare-fun b!1095015 () Bool)

(declare-fun res!730791 () Bool)

(assert (=> b!1095015 (=> (not res!730791) (not e!625159))))

(declare-datatypes ((array!70832 0))(
  ( (array!70833 (arr!34088 (Array (_ BitVec 32) (_ BitVec 64))) (size!34626 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70832)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095015 (= res!730791 (= (select (arr!34088 _keys!1070) i!650) k0!904))))

(declare-fun res!730788 () Bool)

(assert (=> start!96366 (=> (not res!730788) (not e!625159))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96366 (= res!730788 (validMask!0 mask!1414))))

(assert (=> start!96366 e!625159))

(assert (=> start!96366 tp!80780))

(assert (=> start!96366 true))

(assert (=> start!96366 tp_is_empty!27001))

(declare-fun array_inv!26304 (array!70832) Bool)

(assert (=> start!96366 (array_inv!26304 _keys!1070)))

(declare-datatypes ((V!41129 0))(
  ( (V!41130 (val!13557 Int)) )
))
(declare-datatypes ((ValueCell!12791 0))(
  ( (ValueCellFull!12791 (v!16177 V!41129)) (EmptyCell!12791) )
))
(declare-datatypes ((array!70834 0))(
  ( (array!70835 (arr!34089 (Array (_ BitVec 32) ValueCell!12791)) (size!34627 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70834)

(declare-fun e!625160 () Bool)

(declare-fun array_inv!26305 (array!70834) Bool)

(assert (=> start!96366 (and (array_inv!26305 _values!874) e!625160)))

(declare-fun b!1095016 () Bool)

(declare-fun res!730795 () Bool)

(assert (=> b!1095016 (=> (not res!730795) (not e!625159))))

(assert (=> b!1095016 (= res!730795 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34626 _keys!1070))))))

(declare-fun b!1095017 () Bool)

(declare-fun e!625158 () Bool)

(assert (=> b!1095017 (= e!625159 e!625158)))

(declare-fun res!730787 () Bool)

(assert (=> b!1095017 (=> (not res!730787) (not e!625158))))

(declare-fun lt!489560 () array!70832)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70832 (_ BitVec 32)) Bool)

(assert (=> b!1095017 (= res!730787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489560 mask!1414))))

(assert (=> b!1095017 (= lt!489560 (array!70833 (store (arr!34088 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34626 _keys!1070)))))

(declare-fun b!1095018 () Bool)

(declare-fun res!730790 () Bool)

(assert (=> b!1095018 (=> (not res!730790) (not e!625159))))

(assert (=> b!1095018 (= res!730790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42262 () Bool)

(declare-fun mapRes!42262 () Bool)

(declare-fun tp!80779 () Bool)

(assert (=> mapNonEmpty!42262 (= mapRes!42262 (and tp!80779 e!625157))))

(declare-fun mapKey!42262 () (_ BitVec 32))

(declare-fun mapRest!42262 () (Array (_ BitVec 32) ValueCell!12791))

(declare-fun mapValue!42262 () ValueCell!12791)

(assert (=> mapNonEmpty!42262 (= (arr!34089 _values!874) (store mapRest!42262 mapKey!42262 mapValue!42262))))

(declare-fun b!1095019 () Bool)

(declare-fun e!625161 () Bool)

(assert (=> b!1095019 (= e!625161 tp_is_empty!27001)))

(declare-fun b!1095020 () Bool)

(declare-fun res!730792 () Bool)

(assert (=> b!1095020 (=> (not res!730792) (not e!625159))))

(declare-datatypes ((List!23868 0))(
  ( (Nil!23865) (Cons!23864 (h!25073 (_ BitVec 64)) (t!33866 List!23868)) )
))
(declare-fun arrayNoDuplicates!0 (array!70832 (_ BitVec 32) List!23868) Bool)

(assert (=> b!1095020 (= res!730792 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23865))))

(declare-fun b!1095021 () Bool)

(declare-fun res!730793 () Bool)

(assert (=> b!1095021 (=> (not res!730793) (not e!625158))))

(assert (=> b!1095021 (= res!730793 (arrayNoDuplicates!0 lt!489560 #b00000000000000000000000000000000 Nil!23865))))

(declare-fun b!1095022 () Bool)

(assert (=> b!1095022 (= e!625158 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41129)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41129)

(declare-datatypes ((tuple2!17278 0))(
  ( (tuple2!17279 (_1!8650 (_ BitVec 64)) (_2!8650 V!41129)) )
))
(declare-datatypes ((List!23869 0))(
  ( (Nil!23866) (Cons!23865 (h!25074 tuple2!17278) (t!33867 List!23869)) )
))
(declare-datatypes ((ListLongMap!15247 0))(
  ( (ListLongMap!15248 (toList!7639 List!23869)) )
))
(declare-fun lt!489558 () ListLongMap!15247)

(declare-fun getCurrentListMapNoExtraKeys!4172 (array!70832 array!70834 (_ BitVec 32) (_ BitVec 32) V!41129 V!41129 (_ BitVec 32) Int) ListLongMap!15247)

(assert (=> b!1095022 (= lt!489558 (getCurrentListMapNoExtraKeys!4172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095022 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35865 0))(
  ( (Unit!35866) )
))
(declare-fun lt!489559 () Unit!35865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70832 (_ BitVec 64) (_ BitVec 32)) Unit!35865)

(assert (=> b!1095022 (= lt!489559 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095023 () Bool)

(declare-fun res!730794 () Bool)

(assert (=> b!1095023 (=> (not res!730794) (not e!625159))))

(assert (=> b!1095023 (= res!730794 (and (= (size!34627 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34626 _keys!1070) (size!34627 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095024 () Bool)

(assert (=> b!1095024 (= e!625160 (and e!625161 mapRes!42262))))

(declare-fun condMapEmpty!42262 () Bool)

(declare-fun mapDefault!42262 () ValueCell!12791)

(assert (=> b!1095024 (= condMapEmpty!42262 (= (arr!34089 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12791)) mapDefault!42262)))))

(declare-fun mapIsEmpty!42262 () Bool)

(assert (=> mapIsEmpty!42262 mapRes!42262))

(assert (= (and start!96366 res!730788) b!1095023))

(assert (= (and b!1095023 res!730794) b!1095018))

(assert (= (and b!1095018 res!730790) b!1095020))

(assert (= (and b!1095020 res!730792) b!1095016))

(assert (= (and b!1095016 res!730795) b!1095014))

(assert (= (and b!1095014 res!730789) b!1095015))

(assert (= (and b!1095015 res!730791) b!1095017))

(assert (= (and b!1095017 res!730787) b!1095021))

(assert (= (and b!1095021 res!730793) b!1095022))

(assert (= (and b!1095024 condMapEmpty!42262) mapIsEmpty!42262))

(assert (= (and b!1095024 (not condMapEmpty!42262)) mapNonEmpty!42262))

(get-info :version)

(assert (= (and mapNonEmpty!42262 ((_ is ValueCellFull!12791) mapValue!42262)) b!1095013))

(assert (= (and b!1095024 ((_ is ValueCellFull!12791) mapDefault!42262)) b!1095019))

(assert (= start!96366 b!1095024))

(declare-fun m!1014231 () Bool)

(assert (=> mapNonEmpty!42262 m!1014231))

(declare-fun m!1014233 () Bool)

(assert (=> b!1095022 m!1014233))

(declare-fun m!1014235 () Bool)

(assert (=> b!1095022 m!1014235))

(declare-fun m!1014237 () Bool)

(assert (=> b!1095022 m!1014237))

(declare-fun m!1014239 () Bool)

(assert (=> b!1095014 m!1014239))

(declare-fun m!1014241 () Bool)

(assert (=> b!1095015 m!1014241))

(declare-fun m!1014243 () Bool)

(assert (=> start!96366 m!1014243))

(declare-fun m!1014245 () Bool)

(assert (=> start!96366 m!1014245))

(declare-fun m!1014247 () Bool)

(assert (=> start!96366 m!1014247))

(declare-fun m!1014249 () Bool)

(assert (=> b!1095018 m!1014249))

(declare-fun m!1014251 () Bool)

(assert (=> b!1095017 m!1014251))

(declare-fun m!1014253 () Bool)

(assert (=> b!1095017 m!1014253))

(declare-fun m!1014255 () Bool)

(assert (=> b!1095020 m!1014255))

(declare-fun m!1014257 () Bool)

(assert (=> b!1095021 m!1014257))

(check-sat tp_is_empty!27001 (not b!1095014) b_and!36551 (not b!1095018) (not mapNonEmpty!42262) (not b_next!22951) (not b!1095020) (not b!1095017) (not b!1095022) (not start!96366) (not b!1095021))
(check-sat b_and!36551 (not b_next!22951))
