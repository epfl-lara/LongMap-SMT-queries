; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96036 () Bool)

(assert start!96036)

(declare-fun b_free!22453 () Bool)

(declare-fun b_next!22453 () Bool)

(assert (=> start!96036 (= b_free!22453 (not b_next!22453))))

(declare-fun tp!79207 () Bool)

(declare-fun b_and!35591 () Bool)

(assert (=> start!96036 (= tp!79207 b_and!35591)))

(declare-fun b!1085146 () Bool)

(declare-fun res!723040 () Bool)

(declare-fun e!620111 () Bool)

(assert (=> b!1085146 (=> (not res!723040) (not e!620111))))

(declare-datatypes ((array!69887 0))(
  ( (array!69888 (arr!33611 (Array (_ BitVec 32) (_ BitVec 64))) (size!34148 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69887)

(declare-datatypes ((List!23435 0))(
  ( (Nil!23432) (Cons!23431 (h!24649 (_ BitVec 64)) (t!32938 List!23435)) )
))
(declare-fun arrayNoDuplicates!0 (array!69887 (_ BitVec 32) List!23435) Bool)

(assert (=> b!1085146 (= res!723040 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23432))))

(declare-fun b!1085147 () Bool)

(declare-fun res!723041 () Bool)

(assert (=> b!1085147 (=> (not res!723041) (not e!620111))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085147 (= res!723041 (validKeyInArray!0 k0!904))))

(declare-fun res!723036 () Bool)

(assert (=> start!96036 (=> (not res!723036) (not e!620111))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96036 (= res!723036 (validMask!0 mask!1414))))

(assert (=> start!96036 e!620111))

(assert (=> start!96036 tp!79207))

(assert (=> start!96036 true))

(declare-fun tp_is_empty!26455 () Bool)

(assert (=> start!96036 tp_is_empty!26455))

(declare-fun array_inv!25986 (array!69887) Bool)

(assert (=> start!96036 (array_inv!25986 _keys!1070)))

(declare-datatypes ((V!40401 0))(
  ( (V!40402 (val!13284 Int)) )
))
(declare-datatypes ((ValueCell!12518 0))(
  ( (ValueCellFull!12518 (v!15901 V!40401)) (EmptyCell!12518) )
))
(declare-datatypes ((array!69889 0))(
  ( (array!69890 (arr!33612 (Array (_ BitVec 32) ValueCell!12518)) (size!34149 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69889)

(declare-fun e!620110 () Bool)

(declare-fun array_inv!25987 (array!69889) Bool)

(assert (=> start!96036 (and (array_inv!25987 _values!874) e!620110)))

(declare-fun b!1085148 () Bool)

(declare-fun e!620112 () Bool)

(assert (=> b!1085148 (= e!620112 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!480812 () array!69889)

(declare-fun minValue!831 () V!40401)

(declare-fun lt!480811 () array!69887)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16840 0))(
  ( (tuple2!16841 (_1!8431 (_ BitVec 64)) (_2!8431 V!40401)) )
))
(declare-datatypes ((List!23436 0))(
  ( (Nil!23433) (Cons!23432 (h!24650 tuple2!16840) (t!32939 List!23436)) )
))
(declare-datatypes ((ListLongMap!14817 0))(
  ( (ListLongMap!14818 (toList!7424 List!23436)) )
))
(declare-fun lt!480809 () ListLongMap!14817)

(declare-fun zeroValue!831 () V!40401)

(declare-fun getCurrentListMap!4196 (array!69887 array!69889 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14817)

(assert (=> b!1085148 (= lt!480809 (getCurrentListMap!4196 lt!480811 lt!480812 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480810 () ListLongMap!14817)

(declare-fun lt!480816 () ListLongMap!14817)

(assert (=> b!1085148 (and (= lt!480810 lt!480816) (= lt!480816 lt!480810))))

(declare-fun lt!480814 () ListLongMap!14817)

(declare-fun -!736 (ListLongMap!14817 (_ BitVec 64)) ListLongMap!14817)

(assert (=> b!1085148 (= lt!480816 (-!736 lt!480814 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35639 0))(
  ( (Unit!35640) )
))
(declare-fun lt!480813 () Unit!35639)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 (array!69887 array!69889 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35639)

(assert (=> b!1085148 (= lt!480813 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!25 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4001 (array!69887 array!69889 (_ BitVec 32) (_ BitVec 32) V!40401 V!40401 (_ BitVec 32) Int) ListLongMap!14817)

(assert (=> b!1085148 (= lt!480810 (getCurrentListMapNoExtraKeys!4001 lt!480811 lt!480812 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2122 (Int (_ BitVec 64)) V!40401)

(assert (=> b!1085148 (= lt!480812 (array!69890 (store (arr!33612 _values!874) i!650 (ValueCellFull!12518 (dynLambda!2122 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34149 _values!874)))))

(assert (=> b!1085148 (= lt!480814 (getCurrentListMapNoExtraKeys!4001 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085148 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480815 () Unit!35639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69887 (_ BitVec 64) (_ BitVec 32)) Unit!35639)

(assert (=> b!1085148 (= lt!480815 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085149 () Bool)

(declare-fun res!723037 () Bool)

(assert (=> b!1085149 (=> (not res!723037) (not e!620111))))

(assert (=> b!1085149 (= res!723037 (= (select (arr!33611 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41437 () Bool)

(declare-fun mapRes!41437 () Bool)

(declare-fun tp!79208 () Bool)

(declare-fun e!620114 () Bool)

(assert (=> mapNonEmpty!41437 (= mapRes!41437 (and tp!79208 e!620114))))

(declare-fun mapKey!41437 () (_ BitVec 32))

(declare-fun mapRest!41437 () (Array (_ BitVec 32) ValueCell!12518))

(declare-fun mapValue!41437 () ValueCell!12518)

(assert (=> mapNonEmpty!41437 (= (arr!33612 _values!874) (store mapRest!41437 mapKey!41437 mapValue!41437))))

(declare-fun b!1085150 () Bool)

(declare-fun res!723034 () Bool)

(assert (=> b!1085150 (=> (not res!723034) (not e!620111))))

(assert (=> b!1085150 (= res!723034 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34148 _keys!1070))))))

(declare-fun b!1085151 () Bool)

(declare-fun e!620109 () Bool)

(assert (=> b!1085151 (= e!620109 tp_is_empty!26455)))

(declare-fun b!1085152 () Bool)

(assert (=> b!1085152 (= e!620114 tp_is_empty!26455)))

(declare-fun b!1085153 () Bool)

(assert (=> b!1085153 (= e!620111 e!620112)))

(declare-fun res!723042 () Bool)

(assert (=> b!1085153 (=> (not res!723042) (not e!620112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69887 (_ BitVec 32)) Bool)

(assert (=> b!1085153 (= res!723042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480811 mask!1414))))

(assert (=> b!1085153 (= lt!480811 (array!69888 (store (arr!33611 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34148 _keys!1070)))))

(declare-fun b!1085154 () Bool)

(assert (=> b!1085154 (= e!620110 (and e!620109 mapRes!41437))))

(declare-fun condMapEmpty!41437 () Bool)

(declare-fun mapDefault!41437 () ValueCell!12518)

(assert (=> b!1085154 (= condMapEmpty!41437 (= (arr!33612 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12518)) mapDefault!41437)))))

(declare-fun b!1085155 () Bool)

(declare-fun res!723038 () Bool)

(assert (=> b!1085155 (=> (not res!723038) (not e!620111))))

(assert (=> b!1085155 (= res!723038 (and (= (size!34149 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34148 _keys!1070) (size!34149 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41437 () Bool)

(assert (=> mapIsEmpty!41437 mapRes!41437))

(declare-fun b!1085156 () Bool)

(declare-fun res!723035 () Bool)

(assert (=> b!1085156 (=> (not res!723035) (not e!620111))))

(assert (=> b!1085156 (= res!723035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085157 () Bool)

(declare-fun res!723039 () Bool)

(assert (=> b!1085157 (=> (not res!723039) (not e!620112))))

(assert (=> b!1085157 (= res!723039 (arrayNoDuplicates!0 lt!480811 #b00000000000000000000000000000000 Nil!23432))))

(assert (= (and start!96036 res!723036) b!1085155))

(assert (= (and b!1085155 res!723038) b!1085156))

(assert (= (and b!1085156 res!723035) b!1085146))

(assert (= (and b!1085146 res!723040) b!1085150))

(assert (= (and b!1085150 res!723034) b!1085147))

(assert (= (and b!1085147 res!723041) b!1085149))

(assert (= (and b!1085149 res!723037) b!1085153))

(assert (= (and b!1085153 res!723042) b!1085157))

(assert (= (and b!1085157 res!723039) b!1085148))

(assert (= (and b!1085154 condMapEmpty!41437) mapIsEmpty!41437))

(assert (= (and b!1085154 (not condMapEmpty!41437)) mapNonEmpty!41437))

(get-info :version)

(assert (= (and mapNonEmpty!41437 ((_ is ValueCellFull!12518) mapValue!41437)) b!1085152))

(assert (= (and b!1085154 ((_ is ValueCellFull!12518) mapDefault!41437)) b!1085151))

(assert (= start!96036 b!1085154))

(declare-fun b_lambda!17133 () Bool)

(assert (=> (not b_lambda!17133) (not b!1085148)))

(declare-fun t!32937 () Bool)

(declare-fun tb!7323 () Bool)

(assert (=> (and start!96036 (= defaultEntry!882 defaultEntry!882) t!32937) tb!7323))

(declare-fun result!15173 () Bool)

(assert (=> tb!7323 (= result!15173 tp_is_empty!26455)))

(assert (=> b!1085148 t!32937))

(declare-fun b_and!35593 () Bool)

(assert (= b_and!35591 (and (=> t!32937 result!15173) b_and!35593)))

(declare-fun m!1003175 () Bool)

(assert (=> b!1085156 m!1003175))

(declare-fun m!1003177 () Bool)

(assert (=> b!1085146 m!1003177))

(declare-fun m!1003179 () Bool)

(assert (=> b!1085147 m!1003179))

(declare-fun m!1003181 () Bool)

(assert (=> b!1085148 m!1003181))

(declare-fun m!1003183 () Bool)

(assert (=> b!1085148 m!1003183))

(declare-fun m!1003185 () Bool)

(assert (=> b!1085148 m!1003185))

(declare-fun m!1003187 () Bool)

(assert (=> b!1085148 m!1003187))

(declare-fun m!1003189 () Bool)

(assert (=> b!1085148 m!1003189))

(declare-fun m!1003191 () Bool)

(assert (=> b!1085148 m!1003191))

(declare-fun m!1003193 () Bool)

(assert (=> b!1085148 m!1003193))

(declare-fun m!1003195 () Bool)

(assert (=> b!1085148 m!1003195))

(declare-fun m!1003197 () Bool)

(assert (=> b!1085148 m!1003197))

(declare-fun m!1003199 () Bool)

(assert (=> mapNonEmpty!41437 m!1003199))

(declare-fun m!1003201 () Bool)

(assert (=> b!1085149 m!1003201))

(declare-fun m!1003203 () Bool)

(assert (=> b!1085153 m!1003203))

(declare-fun m!1003205 () Bool)

(assert (=> b!1085153 m!1003205))

(declare-fun m!1003207 () Bool)

(assert (=> b!1085157 m!1003207))

(declare-fun m!1003209 () Bool)

(assert (=> start!96036 m!1003209))

(declare-fun m!1003211 () Bool)

(assert (=> start!96036 m!1003211))

(declare-fun m!1003213 () Bool)

(assert (=> start!96036 m!1003213))

(check-sat (not b!1085148) (not b!1085156) (not b!1085157) (not b!1085147) (not start!96036) b_and!35593 (not b_next!22453) (not mapNonEmpty!41437) (not b_lambda!17133) tp_is_empty!26455 (not b!1085153) (not b!1085146))
(check-sat b_and!35593 (not b_next!22453))
