; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96238 () Bool)

(assert start!96238)

(declare-fun b_free!22897 () Bool)

(declare-fun b_next!22897 () Bool)

(assert (=> start!96238 (= b_free!22897 (not b_next!22897))))

(declare-fun tp!80540 () Bool)

(declare-fun b_and!36443 () Bool)

(assert (=> start!96238 (= tp!80540 b_and!36443)))

(declare-fun b!1093164 () Bool)

(declare-fun e!624197 () Bool)

(declare-fun e!624195 () Bool)

(assert (=> b!1093164 (= e!624197 e!624195)))

(declare-fun res!729502 () Bool)

(assert (=> b!1093164 (=> (not res!729502) (not e!624195))))

(declare-datatypes ((array!70630 0))(
  ( (array!70631 (arr!33989 (Array (_ BitVec 32) (_ BitVec 64))) (size!34527 (_ BitVec 32))) )
))
(declare-fun lt!488712 () array!70630)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70630 (_ BitVec 32)) Bool)

(assert (=> b!1093164 (= res!729502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488712 mask!1414))))

(declare-fun _keys!1070 () array!70630)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093164 (= lt!488712 (array!70631 (store (arr!33989 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34527 _keys!1070)))))

(declare-fun mapNonEmpty!42103 () Bool)

(declare-fun mapRes!42103 () Bool)

(declare-fun tp!80539 () Bool)

(declare-fun e!624192 () Bool)

(assert (=> mapNonEmpty!42103 (= mapRes!42103 (and tp!80539 e!624192))))

(declare-datatypes ((V!40993 0))(
  ( (V!40994 (val!13506 Int)) )
))
(declare-datatypes ((ValueCell!12740 0))(
  ( (ValueCellFull!12740 (v!16126 V!40993)) (EmptyCell!12740) )
))
(declare-datatypes ((array!70632 0))(
  ( (array!70633 (arr!33990 (Array (_ BitVec 32) ValueCell!12740)) (size!34528 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70632)

(declare-fun mapRest!42103 () (Array (_ BitVec 32) ValueCell!12740))

(declare-fun mapValue!42103 () ValueCell!12740)

(declare-fun mapKey!42103 () (_ BitVec 32))

(assert (=> mapNonEmpty!42103 (= (arr!33990 _values!874) (store mapRest!42103 mapKey!42103 mapValue!42103))))

(declare-fun mapIsEmpty!42103 () Bool)

(assert (=> mapIsEmpty!42103 mapRes!42103))

(declare-fun b!1093165 () Bool)

(declare-fun res!729499 () Bool)

(assert (=> b!1093165 (=> (not res!729499) (not e!624197))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093165 (= res!729499 (= (select (arr!33989 _keys!1070) i!650) k0!904))))

(declare-fun b!1093166 () Bool)

(declare-fun res!729501 () Bool)

(assert (=> b!1093166 (=> (not res!729501) (not e!624197))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093166 (= res!729501 (and (= (size!34528 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34527 _keys!1070) (size!34528 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093167 () Bool)

(declare-fun tp_is_empty!26899 () Bool)

(assert (=> b!1093167 (= e!624192 tp_is_empty!26899)))

(declare-fun b!1093168 () Bool)

(declare-fun e!624196 () Bool)

(declare-fun e!624193 () Bool)

(assert (=> b!1093168 (= e!624196 (and e!624193 mapRes!42103))))

(declare-fun condMapEmpty!42103 () Bool)

(declare-fun mapDefault!42103 () ValueCell!12740)

(assert (=> b!1093168 (= condMapEmpty!42103 (= (arr!33990 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12740)) mapDefault!42103)))))

(declare-fun b!1093169 () Bool)

(declare-fun res!729503 () Bool)

(assert (=> b!1093169 (=> (not res!729503) (not e!624197))))

(assert (=> b!1093169 (= res!729503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!729505 () Bool)

(assert (=> start!96238 (=> (not res!729505) (not e!624197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96238 (= res!729505 (validMask!0 mask!1414))))

(assert (=> start!96238 e!624197))

(assert (=> start!96238 tp!80540))

(assert (=> start!96238 true))

(assert (=> start!96238 tp_is_empty!26899))

(declare-fun array_inv!26238 (array!70630) Bool)

(assert (=> start!96238 (array_inv!26238 _keys!1070)))

(declare-fun array_inv!26239 (array!70632) Bool)

(assert (=> start!96238 (and (array_inv!26239 _values!874) e!624196)))

(declare-fun b!1093170 () Bool)

(assert (=> b!1093170 (= e!624193 tp_is_empty!26899)))

(declare-fun b!1093171 () Bool)

(assert (=> b!1093171 (= e!624195 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40993)

(declare-datatypes ((tuple2!17242 0))(
  ( (tuple2!17243 (_1!8632 (_ BitVec 64)) (_2!8632 V!40993)) )
))
(declare-datatypes ((List!23809 0))(
  ( (Nil!23806) (Cons!23805 (h!25014 tuple2!17242) (t!33755 List!23809)) )
))
(declare-datatypes ((ListLongMap!15211 0))(
  ( (ListLongMap!15212 (toList!7621 List!23809)) )
))
(declare-fun lt!488716 () ListLongMap!15211)

(declare-fun zeroValue!831 () V!40993)

(declare-fun getCurrentListMap!4284 (array!70630 array!70632 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) Int) ListLongMap!15211)

(assert (=> b!1093171 (= lt!488716 (getCurrentListMap!4284 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488717 () array!70632)

(declare-fun lt!488709 () ListLongMap!15211)

(assert (=> b!1093171 (= lt!488709 (getCurrentListMap!4284 lt!488712 lt!488717 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488713 () ListLongMap!15211)

(declare-fun lt!488715 () ListLongMap!15211)

(assert (=> b!1093171 (and (= lt!488713 lt!488715) (= lt!488715 lt!488713))))

(declare-fun lt!488714 () ListLongMap!15211)

(declare-fun -!893 (ListLongMap!15211 (_ BitVec 64)) ListLongMap!15211)

(assert (=> b!1093171 (= lt!488715 (-!893 lt!488714 k0!904))))

(declare-datatypes ((Unit!35821 0))(
  ( (Unit!35822) )
))
(declare-fun lt!488710 () Unit!35821)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 (array!70630 array!70632 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35821)

(assert (=> b!1093171 (= lt!488710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4154 (array!70630 array!70632 (_ BitVec 32) (_ BitVec 32) V!40993 V!40993 (_ BitVec 32) Int) ListLongMap!15211)

(assert (=> b!1093171 (= lt!488713 (getCurrentListMapNoExtraKeys!4154 lt!488712 lt!488717 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2225 (Int (_ BitVec 64)) V!40993)

(assert (=> b!1093171 (= lt!488717 (array!70633 (store (arr!33990 _values!874) i!650 (ValueCellFull!12740 (dynLambda!2225 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34528 _values!874)))))

(assert (=> b!1093171 (= lt!488714 (getCurrentListMapNoExtraKeys!4154 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093171 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488711 () Unit!35821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70630 (_ BitVec 64) (_ BitVec 32)) Unit!35821)

(assert (=> b!1093171 (= lt!488711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093172 () Bool)

(declare-fun res!729500 () Bool)

(assert (=> b!1093172 (=> (not res!729500) (not e!624197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093172 (= res!729500 (validKeyInArray!0 k0!904))))

(declare-fun b!1093173 () Bool)

(declare-fun res!729507 () Bool)

(assert (=> b!1093173 (=> (not res!729507) (not e!624197))))

(declare-datatypes ((List!23810 0))(
  ( (Nil!23807) (Cons!23806 (h!25015 (_ BitVec 64)) (t!33756 List!23810)) )
))
(declare-fun arrayNoDuplicates!0 (array!70630 (_ BitVec 32) List!23810) Bool)

(assert (=> b!1093173 (= res!729507 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23807))))

(declare-fun b!1093174 () Bool)

(declare-fun res!729504 () Bool)

(assert (=> b!1093174 (=> (not res!729504) (not e!624195))))

(assert (=> b!1093174 (= res!729504 (arrayNoDuplicates!0 lt!488712 #b00000000000000000000000000000000 Nil!23807))))

(declare-fun b!1093175 () Bool)

(declare-fun res!729506 () Bool)

(assert (=> b!1093175 (=> (not res!729506) (not e!624197))))

(assert (=> b!1093175 (= res!729506 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34527 _keys!1070))))))

(assert (= (and start!96238 res!729505) b!1093166))

(assert (= (and b!1093166 res!729501) b!1093169))

(assert (= (and b!1093169 res!729503) b!1093173))

(assert (= (and b!1093173 res!729507) b!1093175))

(assert (= (and b!1093175 res!729506) b!1093172))

(assert (= (and b!1093172 res!729500) b!1093165))

(assert (= (and b!1093165 res!729499) b!1093164))

(assert (= (and b!1093164 res!729502) b!1093174))

(assert (= (and b!1093174 res!729504) b!1093171))

(assert (= (and b!1093168 condMapEmpty!42103) mapIsEmpty!42103))

(assert (= (and b!1093168 (not condMapEmpty!42103)) mapNonEmpty!42103))

(get-info :version)

(assert (= (and mapNonEmpty!42103 ((_ is ValueCellFull!12740) mapValue!42103)) b!1093167))

(assert (= (and b!1093168 ((_ is ValueCellFull!12740) mapDefault!42103)) b!1093170))

(assert (= start!96238 b!1093168))

(declare-fun b_lambda!17545 () Bool)

(assert (=> (not b_lambda!17545) (not b!1093171)))

(declare-fun t!33754 () Bool)

(declare-fun tb!7767 () Bool)

(assert (=> (and start!96238 (= defaultEntry!882 defaultEntry!882) t!33754) tb!7767))

(declare-fun result!16061 () Bool)

(assert (=> tb!7767 (= result!16061 tp_is_empty!26899)))

(assert (=> b!1093171 t!33754))

(declare-fun b_and!36445 () Bool)

(assert (= b_and!36443 (and (=> t!33754 result!16061) b_and!36445)))

(declare-fun m!1012547 () Bool)

(assert (=> mapNonEmpty!42103 m!1012547))

(declare-fun m!1012549 () Bool)

(assert (=> b!1093164 m!1012549))

(declare-fun m!1012551 () Bool)

(assert (=> b!1093164 m!1012551))

(declare-fun m!1012553 () Bool)

(assert (=> b!1093169 m!1012553))

(declare-fun m!1012555 () Bool)

(assert (=> b!1093165 m!1012555))

(declare-fun m!1012557 () Bool)

(assert (=> b!1093174 m!1012557))

(declare-fun m!1012559 () Bool)

(assert (=> b!1093171 m!1012559))

(declare-fun m!1012561 () Bool)

(assert (=> b!1093171 m!1012561))

(declare-fun m!1012563 () Bool)

(assert (=> b!1093171 m!1012563))

(declare-fun m!1012565 () Bool)

(assert (=> b!1093171 m!1012565))

(declare-fun m!1012567 () Bool)

(assert (=> b!1093171 m!1012567))

(declare-fun m!1012569 () Bool)

(assert (=> b!1093171 m!1012569))

(declare-fun m!1012571 () Bool)

(assert (=> b!1093171 m!1012571))

(declare-fun m!1012573 () Bool)

(assert (=> b!1093171 m!1012573))

(declare-fun m!1012575 () Bool)

(assert (=> b!1093171 m!1012575))

(declare-fun m!1012577 () Bool)

(assert (=> b!1093171 m!1012577))

(declare-fun m!1012579 () Bool)

(assert (=> b!1093172 m!1012579))

(declare-fun m!1012581 () Bool)

(assert (=> b!1093173 m!1012581))

(declare-fun m!1012583 () Bool)

(assert (=> start!96238 m!1012583))

(declare-fun m!1012585 () Bool)

(assert (=> start!96238 m!1012585))

(declare-fun m!1012587 () Bool)

(assert (=> start!96238 m!1012587))

(check-sat (not b_next!22897) (not b_lambda!17545) tp_is_empty!26899 b_and!36445 (not b!1093171) (not b!1093169) (not b!1093172) (not b!1093173) (not b!1093164) (not start!96238) (not b!1093174) (not mapNonEmpty!42103))
(check-sat b_and!36445 (not b_next!22897))
