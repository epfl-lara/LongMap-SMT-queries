; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96208 () Bool)

(assert start!96208)

(declare-fun b_free!22867 () Bool)

(declare-fun b_next!22867 () Bool)

(assert (=> start!96208 (= b_free!22867 (not b_next!22867))))

(declare-fun tp!80449 () Bool)

(declare-fun b_and!36383 () Bool)

(assert (=> start!96208 (= tp!80449 b_and!36383)))

(declare-fun b!1092594 () Bool)

(declare-fun e!623924 () Bool)

(declare-fun tp_is_empty!26869 () Bool)

(assert (=> b!1092594 (= e!623924 tp_is_empty!26869)))

(declare-fun b!1092595 () Bool)

(declare-fun e!623926 () Bool)

(declare-fun e!623923 () Bool)

(declare-fun mapRes!42058 () Bool)

(assert (=> b!1092595 (= e!623926 (and e!623923 mapRes!42058))))

(declare-fun condMapEmpty!42058 () Bool)

(declare-datatypes ((V!40953 0))(
  ( (V!40954 (val!13491 Int)) )
))
(declare-datatypes ((ValueCell!12725 0))(
  ( (ValueCellFull!12725 (v!16111 V!40953)) (EmptyCell!12725) )
))
(declare-datatypes ((array!70570 0))(
  ( (array!70571 (arr!33959 (Array (_ BitVec 32) ValueCell!12725)) (size!34497 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70570)

(declare-fun mapDefault!42058 () ValueCell!12725)

(assert (=> b!1092595 (= condMapEmpty!42058 (= (arr!33959 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12725)) mapDefault!42058)))))

(declare-fun b!1092597 () Bool)

(declare-fun res!729102 () Bool)

(declare-fun e!623922 () Bool)

(assert (=> b!1092597 (=> (not res!729102) (not e!623922))))

(declare-datatypes ((array!70572 0))(
  ( (array!70573 (arr!33960 (Array (_ BitVec 32) (_ BitVec 64))) (size!34498 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70572)

(declare-datatypes ((List!23784 0))(
  ( (Nil!23781) (Cons!23780 (h!24989 (_ BitVec 64)) (t!33700 List!23784)) )
))
(declare-fun arrayNoDuplicates!0 (array!70572 (_ BitVec 32) List!23784) Bool)

(assert (=> b!1092597 (= res!729102 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23781))))

(declare-fun b!1092598 () Bool)

(declare-fun res!729097 () Bool)

(assert (=> b!1092598 (=> (not res!729097) (not e!623922))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092598 (= res!729097 (= (select (arr!33960 _keys!1070) i!650) k0!904))))

(declare-fun b!1092599 () Bool)

(assert (=> b!1092599 (= e!623923 tp_is_empty!26869)))

(declare-fun mapIsEmpty!42058 () Bool)

(assert (=> mapIsEmpty!42058 mapRes!42058))

(declare-fun b!1092600 () Bool)

(declare-fun res!729095 () Bool)

(declare-fun e!623925 () Bool)

(assert (=> b!1092600 (=> (not res!729095) (not e!623925))))

(declare-fun lt!488303 () array!70572)

(assert (=> b!1092600 (= res!729095 (arrayNoDuplicates!0 lt!488303 #b00000000000000000000000000000000 Nil!23781))))

(declare-fun b!1092601 () Bool)

(declare-fun res!729100 () Bool)

(assert (=> b!1092601 (=> (not res!729100) (not e!623922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092601 (= res!729100 (validKeyInArray!0 k0!904))))

(declare-fun b!1092602 () Bool)

(declare-fun res!729101 () Bool)

(assert (=> b!1092602 (=> (not res!729101) (not e!623922))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70572 (_ BitVec 32)) Bool)

(assert (=> b!1092602 (= res!729101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!729099 () Bool)

(assert (=> start!96208 (=> (not res!729099) (not e!623922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96208 (= res!729099 (validMask!0 mask!1414))))

(assert (=> start!96208 e!623922))

(assert (=> start!96208 tp!80449))

(assert (=> start!96208 true))

(assert (=> start!96208 tp_is_empty!26869))

(declare-fun array_inv!26216 (array!70572) Bool)

(assert (=> start!96208 (array_inv!26216 _keys!1070)))

(declare-fun array_inv!26217 (array!70570) Bool)

(assert (=> start!96208 (and (array_inv!26217 _values!874) e!623926)))

(declare-fun b!1092596 () Bool)

(assert (=> b!1092596 (= e!623925 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17220 0))(
  ( (tuple2!17221 (_1!8621 (_ BitVec 64)) (_2!8621 V!40953)) )
))
(declare-datatypes ((List!23785 0))(
  ( (Nil!23782) (Cons!23781 (h!24990 tuple2!17220) (t!33701 List!23785)) )
))
(declare-datatypes ((ListLongMap!15189 0))(
  ( (ListLongMap!15190 (toList!7610 List!23785)) )
))
(declare-fun lt!488296 () ListLongMap!15189)

(declare-fun zeroValue!831 () V!40953)

(declare-fun minValue!831 () V!40953)

(declare-fun getCurrentListMap!4273 (array!70572 array!70570 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) Int) ListLongMap!15189)

(assert (=> b!1092596 (= lt!488296 (getCurrentListMap!4273 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488301 () ListLongMap!15189)

(declare-fun lt!488297 () array!70570)

(assert (=> b!1092596 (= lt!488301 (getCurrentListMap!4273 lt!488303 lt!488297 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488302 () ListLongMap!15189)

(declare-fun lt!488300 () ListLongMap!15189)

(assert (=> b!1092596 (and (= lt!488302 lt!488300) (= lt!488300 lt!488302))))

(declare-fun lt!488295 () ListLongMap!15189)

(declare-fun -!882 (ListLongMap!15189 (_ BitVec 64)) ListLongMap!15189)

(assert (=> b!1092596 (= lt!488300 (-!882 lt!488295 k0!904))))

(declare-datatypes ((Unit!35799 0))(
  ( (Unit!35800) )
))
(declare-fun lt!488299 () Unit!35799)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!157 (array!70572 array!70570 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35799)

(assert (=> b!1092596 (= lt!488299 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!157 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4143 (array!70572 array!70570 (_ BitVec 32) (_ BitVec 32) V!40953 V!40953 (_ BitVec 32) Int) ListLongMap!15189)

(assert (=> b!1092596 (= lt!488302 (getCurrentListMapNoExtraKeys!4143 lt!488303 lt!488297 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2214 (Int (_ BitVec 64)) V!40953)

(assert (=> b!1092596 (= lt!488297 (array!70571 (store (arr!33959 _values!874) i!650 (ValueCellFull!12725 (dynLambda!2214 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34497 _values!874)))))

(assert (=> b!1092596 (= lt!488295 (getCurrentListMapNoExtraKeys!4143 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092596 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488298 () Unit!35799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70572 (_ BitVec 64) (_ BitVec 32)) Unit!35799)

(assert (=> b!1092596 (= lt!488298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092603 () Bool)

(declare-fun res!729094 () Bool)

(assert (=> b!1092603 (=> (not res!729094) (not e!623922))))

(assert (=> b!1092603 (= res!729094 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34498 _keys!1070))))))

(declare-fun b!1092604 () Bool)

(declare-fun res!729098 () Bool)

(assert (=> b!1092604 (=> (not res!729098) (not e!623922))))

(assert (=> b!1092604 (= res!729098 (and (= (size!34497 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34498 _keys!1070) (size!34497 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092605 () Bool)

(assert (=> b!1092605 (= e!623922 e!623925)))

(declare-fun res!729096 () Bool)

(assert (=> b!1092605 (=> (not res!729096) (not e!623925))))

(assert (=> b!1092605 (= res!729096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488303 mask!1414))))

(assert (=> b!1092605 (= lt!488303 (array!70573 (store (arr!33960 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34498 _keys!1070)))))

(declare-fun mapNonEmpty!42058 () Bool)

(declare-fun tp!80450 () Bool)

(assert (=> mapNonEmpty!42058 (= mapRes!42058 (and tp!80450 e!623924))))

(declare-fun mapRest!42058 () (Array (_ BitVec 32) ValueCell!12725))

(declare-fun mapKey!42058 () (_ BitVec 32))

(declare-fun mapValue!42058 () ValueCell!12725)

(assert (=> mapNonEmpty!42058 (= (arr!33959 _values!874) (store mapRest!42058 mapKey!42058 mapValue!42058))))

(assert (= (and start!96208 res!729099) b!1092604))

(assert (= (and b!1092604 res!729098) b!1092602))

(assert (= (and b!1092602 res!729101) b!1092597))

(assert (= (and b!1092597 res!729102) b!1092603))

(assert (= (and b!1092603 res!729094) b!1092601))

(assert (= (and b!1092601 res!729100) b!1092598))

(assert (= (and b!1092598 res!729097) b!1092605))

(assert (= (and b!1092605 res!729096) b!1092600))

(assert (= (and b!1092600 res!729095) b!1092596))

(assert (= (and b!1092595 condMapEmpty!42058) mapIsEmpty!42058))

(assert (= (and b!1092595 (not condMapEmpty!42058)) mapNonEmpty!42058))

(get-info :version)

(assert (= (and mapNonEmpty!42058 ((_ is ValueCellFull!12725) mapValue!42058)) b!1092594))

(assert (= (and b!1092595 ((_ is ValueCellFull!12725) mapDefault!42058)) b!1092599))

(assert (= start!96208 b!1092595))

(declare-fun b_lambda!17515 () Bool)

(assert (=> (not b_lambda!17515) (not b!1092596)))

(declare-fun t!33699 () Bool)

(declare-fun tb!7737 () Bool)

(assert (=> (and start!96208 (= defaultEntry!882 defaultEntry!882) t!33699) tb!7737))

(declare-fun result!16001 () Bool)

(assert (=> tb!7737 (= result!16001 tp_is_empty!26869)))

(assert (=> b!1092596 t!33699))

(declare-fun b_and!36385 () Bool)

(assert (= b_and!36383 (and (=> t!33699 result!16001) b_and!36385)))

(declare-fun m!1011917 () Bool)

(assert (=> b!1092596 m!1011917))

(declare-fun m!1011919 () Bool)

(assert (=> b!1092596 m!1011919))

(declare-fun m!1011921 () Bool)

(assert (=> b!1092596 m!1011921))

(declare-fun m!1011923 () Bool)

(assert (=> b!1092596 m!1011923))

(declare-fun m!1011925 () Bool)

(assert (=> b!1092596 m!1011925))

(declare-fun m!1011927 () Bool)

(assert (=> b!1092596 m!1011927))

(declare-fun m!1011929 () Bool)

(assert (=> b!1092596 m!1011929))

(declare-fun m!1011931 () Bool)

(assert (=> b!1092596 m!1011931))

(declare-fun m!1011933 () Bool)

(assert (=> b!1092596 m!1011933))

(declare-fun m!1011935 () Bool)

(assert (=> b!1092596 m!1011935))

(declare-fun m!1011937 () Bool)

(assert (=> b!1092605 m!1011937))

(declare-fun m!1011939 () Bool)

(assert (=> b!1092605 m!1011939))

(declare-fun m!1011941 () Bool)

(assert (=> mapNonEmpty!42058 m!1011941))

(declare-fun m!1011943 () Bool)

(assert (=> start!96208 m!1011943))

(declare-fun m!1011945 () Bool)

(assert (=> start!96208 m!1011945))

(declare-fun m!1011947 () Bool)

(assert (=> start!96208 m!1011947))

(declare-fun m!1011949 () Bool)

(assert (=> b!1092598 m!1011949))

(declare-fun m!1011951 () Bool)

(assert (=> b!1092602 m!1011951))

(declare-fun m!1011953 () Bool)

(assert (=> b!1092597 m!1011953))

(declare-fun m!1011955 () Bool)

(assert (=> b!1092600 m!1011955))

(declare-fun m!1011957 () Bool)

(assert (=> b!1092601 m!1011957))

(check-sat (not b_next!22867) (not b!1092601) (not b!1092605) b_and!36385 (not mapNonEmpty!42058) (not b!1092596) tp_is_empty!26869 (not b!1092602) (not b_lambda!17515) (not b!1092600) (not b!1092597) (not start!96208))
(check-sat b_and!36385 (not b_next!22867))
