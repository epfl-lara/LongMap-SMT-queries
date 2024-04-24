; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96704 () Bool)

(assert start!96704)

(declare-fun b_free!23047 () Bool)

(declare-fun b_next!23047 () Bool)

(assert (=> start!96704 (= b_free!23047 (not b_next!23047))))

(declare-fun tp!81067 () Bool)

(declare-fun b_and!36767 () Bool)

(assert (=> start!96704 (= tp!81067 b_and!36767)))

(declare-fun b!1098305 () Bool)

(declare-fun res!732678 () Bool)

(declare-fun e!626972 () Bool)

(assert (=> b!1098305 (=> (not res!732678) (not e!626972))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098305 (= res!732678 (validKeyInArray!0 k0!904))))

(declare-fun b!1098306 () Bool)

(declare-fun e!626974 () Bool)

(declare-fun e!626969 () Bool)

(declare-fun mapRes!42406 () Bool)

(assert (=> b!1098306 (= e!626974 (and e!626969 mapRes!42406))))

(declare-fun condMapEmpty!42406 () Bool)

(declare-datatypes ((V!41257 0))(
  ( (V!41258 (val!13605 Int)) )
))
(declare-datatypes ((ValueCell!12839 0))(
  ( (ValueCellFull!12839 (v!16222 V!41257)) (EmptyCell!12839) )
))
(declare-datatypes ((array!71135 0))(
  ( (array!71136 (arr!34233 (Array (_ BitVec 32) ValueCell!12839)) (size!34770 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71135)

(declare-fun mapDefault!42406 () ValueCell!12839)

(assert (=> b!1098306 (= condMapEmpty!42406 (= (arr!34233 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12839)) mapDefault!42406)))))

(declare-fun b!1098307 () Bool)

(declare-fun e!626970 () Bool)

(declare-fun tp_is_empty!27097 () Bool)

(assert (=> b!1098307 (= e!626970 tp_is_empty!27097)))

(declare-fun b!1098308 () Bool)

(declare-fun res!732682 () Bool)

(assert (=> b!1098308 (=> (not res!732682) (not e!626972))))

(declare-datatypes ((array!71137 0))(
  ( (array!71138 (arr!34234 (Array (_ BitVec 32) (_ BitVec 64))) (size!34771 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71137)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71137 (_ BitVec 32)) Bool)

(assert (=> b!1098308 (= res!732682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098309 () Bool)

(declare-fun res!732681 () Bool)

(assert (=> b!1098309 (=> (not res!732681) (not e!626972))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098309 (= res!732681 (and (= (size!34770 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34771 _keys!1070) (size!34770 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098310 () Bool)

(declare-fun res!732679 () Bool)

(assert (=> b!1098310 (=> (not res!732679) (not e!626972))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098310 (= res!732679 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34771 _keys!1070))))))

(declare-fun mapIsEmpty!42406 () Bool)

(assert (=> mapIsEmpty!42406 mapRes!42406))

(declare-fun res!732675 () Bool)

(assert (=> start!96704 (=> (not res!732675) (not e!626972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96704 (= res!732675 (validMask!0 mask!1414))))

(assert (=> start!96704 e!626972))

(assert (=> start!96704 tp!81067))

(assert (=> start!96704 true))

(assert (=> start!96704 tp_is_empty!27097))

(declare-fun array_inv!26404 (array!71137) Bool)

(assert (=> start!96704 (array_inv!26404 _keys!1070)))

(declare-fun array_inv!26405 (array!71135) Bool)

(assert (=> start!96704 (and (array_inv!26405 _values!874) e!626974)))

(declare-fun b!1098311 () Bool)

(declare-fun e!626973 () Bool)

(assert (=> b!1098311 (= e!626972 e!626973)))

(declare-fun res!732676 () Bool)

(assert (=> b!1098311 (=> (not res!732676) (not e!626973))))

(declare-fun lt!490838 () array!71137)

(assert (=> b!1098311 (= res!732676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490838 mask!1414))))

(assert (=> b!1098311 (= lt!490838 (array!71138 (store (arr!34234 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34771 _keys!1070)))))

(declare-fun b!1098312 () Bool)

(declare-datatypes ((tuple2!17290 0))(
  ( (tuple2!17291 (_1!8656 (_ BitVec 64)) (_2!8656 V!41257)) )
))
(declare-datatypes ((List!23913 0))(
  ( (Nil!23910) (Cons!23909 (h!25127 tuple2!17290) (t!33998 List!23913)) )
))
(declare-datatypes ((ListLongMap!15267 0))(
  ( (ListLongMap!15268 (toList!7649 List!23913)) )
))
(declare-fun lt!490841 () ListLongMap!15267)

(declare-fun lt!490837 () ListLongMap!15267)

(assert (=> b!1098312 (= e!626973 (not (= lt!490841 lt!490837)))))

(assert (=> b!1098312 (= lt!490837 lt!490841)))

(declare-fun lt!490839 () ListLongMap!15267)

(declare-fun -!923 (ListLongMap!15267 (_ BitVec 64)) ListLongMap!15267)

(assert (=> b!1098312 (= lt!490841 (-!923 lt!490839 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41257)

(declare-datatypes ((Unit!36085 0))(
  ( (Unit!36086) )
))
(declare-fun lt!490842 () Unit!36085)

(declare-fun zeroValue!831 () V!41257)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 (array!71137 array!71135 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36085)

(assert (=> b!1098312 (= lt!490842 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4202 (array!71137 array!71135 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) Int) ListLongMap!15267)

(declare-fun dynLambda!2320 (Int (_ BitVec 64)) V!41257)

(assert (=> b!1098312 (= lt!490837 (getCurrentListMapNoExtraKeys!4202 lt!490838 (array!71136 (store (arr!34233 _values!874) i!650 (ValueCellFull!12839 (dynLambda!2320 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34770 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098312 (= lt!490839 (getCurrentListMapNoExtraKeys!4202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098312 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490840 () Unit!36085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71137 (_ BitVec 64) (_ BitVec 32)) Unit!36085)

(assert (=> b!1098312 (= lt!490840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42406 () Bool)

(declare-fun tp!81068 () Bool)

(assert (=> mapNonEmpty!42406 (= mapRes!42406 (and tp!81068 e!626970))))

(declare-fun mapKey!42406 () (_ BitVec 32))

(declare-fun mapRest!42406 () (Array (_ BitVec 32) ValueCell!12839))

(declare-fun mapValue!42406 () ValueCell!12839)

(assert (=> mapNonEmpty!42406 (= (arr!34233 _values!874) (store mapRest!42406 mapKey!42406 mapValue!42406))))

(declare-fun b!1098313 () Bool)

(declare-fun res!732674 () Bool)

(assert (=> b!1098313 (=> (not res!732674) (not e!626972))))

(declare-datatypes ((List!23914 0))(
  ( (Nil!23911) (Cons!23910 (h!25128 (_ BitVec 64)) (t!33999 List!23914)) )
))
(declare-fun arrayNoDuplicates!0 (array!71137 (_ BitVec 32) List!23914) Bool)

(assert (=> b!1098313 (= res!732674 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun b!1098314 () Bool)

(declare-fun res!732680 () Bool)

(assert (=> b!1098314 (=> (not res!732680) (not e!626973))))

(assert (=> b!1098314 (= res!732680 (arrayNoDuplicates!0 lt!490838 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun b!1098315 () Bool)

(declare-fun res!732677 () Bool)

(assert (=> b!1098315 (=> (not res!732677) (not e!626972))))

(assert (=> b!1098315 (= res!732677 (= (select (arr!34234 _keys!1070) i!650) k0!904))))

(declare-fun b!1098316 () Bool)

(assert (=> b!1098316 (= e!626969 tp_is_empty!27097)))

(assert (= (and start!96704 res!732675) b!1098309))

(assert (= (and b!1098309 res!732681) b!1098308))

(assert (= (and b!1098308 res!732682) b!1098313))

(assert (= (and b!1098313 res!732674) b!1098310))

(assert (= (and b!1098310 res!732679) b!1098305))

(assert (= (and b!1098305 res!732678) b!1098315))

(assert (= (and b!1098315 res!732677) b!1098311))

(assert (= (and b!1098311 res!732676) b!1098314))

(assert (= (and b!1098314 res!732680) b!1098312))

(assert (= (and b!1098306 condMapEmpty!42406) mapIsEmpty!42406))

(assert (= (and b!1098306 (not condMapEmpty!42406)) mapNonEmpty!42406))

(get-info :version)

(assert (= (and mapNonEmpty!42406 ((_ is ValueCellFull!12839) mapValue!42406)) b!1098307))

(assert (= (and b!1098306 ((_ is ValueCellFull!12839) mapDefault!42406)) b!1098316))

(assert (= start!96704 b!1098306))

(declare-fun b_lambda!17715 () Bool)

(assert (=> (not b_lambda!17715) (not b!1098312)))

(declare-fun t!33997 () Bool)

(declare-fun tb!7905 () Bool)

(assert (=> (and start!96704 (= defaultEntry!882 defaultEntry!882) t!33997) tb!7905))

(declare-fun result!16341 () Bool)

(assert (=> tb!7905 (= result!16341 tp_is_empty!27097)))

(assert (=> b!1098312 t!33997))

(declare-fun b_and!36769 () Bool)

(assert (= b_and!36767 (and (=> t!33997 result!16341) b_and!36769)))

(declare-fun m!1018125 () Bool)

(assert (=> b!1098305 m!1018125))

(declare-fun m!1018127 () Bool)

(assert (=> b!1098311 m!1018127))

(declare-fun m!1018129 () Bool)

(assert (=> b!1098311 m!1018129))

(declare-fun m!1018131 () Bool)

(assert (=> b!1098312 m!1018131))

(declare-fun m!1018133 () Bool)

(assert (=> b!1098312 m!1018133))

(declare-fun m!1018135 () Bool)

(assert (=> b!1098312 m!1018135))

(declare-fun m!1018137 () Bool)

(assert (=> b!1098312 m!1018137))

(declare-fun m!1018139 () Bool)

(assert (=> b!1098312 m!1018139))

(declare-fun m!1018141 () Bool)

(assert (=> b!1098312 m!1018141))

(declare-fun m!1018143 () Bool)

(assert (=> b!1098312 m!1018143))

(declare-fun m!1018145 () Bool)

(assert (=> b!1098312 m!1018145))

(declare-fun m!1018147 () Bool)

(assert (=> b!1098313 m!1018147))

(declare-fun m!1018149 () Bool)

(assert (=> b!1098315 m!1018149))

(declare-fun m!1018151 () Bool)

(assert (=> mapNonEmpty!42406 m!1018151))

(declare-fun m!1018153 () Bool)

(assert (=> b!1098314 m!1018153))

(declare-fun m!1018155 () Bool)

(assert (=> b!1098308 m!1018155))

(declare-fun m!1018157 () Bool)

(assert (=> start!96704 m!1018157))

(declare-fun m!1018159 () Bool)

(assert (=> start!96704 m!1018159))

(declare-fun m!1018161 () Bool)

(assert (=> start!96704 m!1018161))

(check-sat (not mapNonEmpty!42406) (not b!1098312) (not b!1098313) tp_is_empty!27097 (not b_lambda!17715) (not b!1098308) (not b!1098314) (not start!96704) (not b!1098305) (not b!1098311) (not b_next!23047) b_and!36769)
(check-sat b_and!36769 (not b_next!23047))
