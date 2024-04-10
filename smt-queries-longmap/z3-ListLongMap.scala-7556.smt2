; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95658 () Bool)

(assert start!95658)

(declare-fun b_free!22311 () Bool)

(declare-fun b_next!22311 () Bool)

(assert (=> start!95658 (= b_free!22311 (not b_next!22311))))

(declare-fun tp!78781 () Bool)

(declare-fun b_and!35297 () Bool)

(assert (=> start!95658 (= tp!78781 b_and!35297)))

(declare-fun b!1081121 () Bool)

(declare-fun e!617977 () Bool)

(declare-fun tp_is_empty!26313 () Bool)

(assert (=> b!1081121 (= e!617977 tp_is_empty!26313)))

(declare-fun b!1081122 () Bool)

(declare-fun res!720602 () Bool)

(declare-fun e!617976 () Bool)

(assert (=> b!1081122 (=> (not res!720602) (not e!617976))))

(declare-datatypes ((array!69573 0))(
  ( (array!69574 (arr!33460 (Array (_ BitVec 32) (_ BitVec 64))) (size!33996 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69573)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69573 (_ BitVec 32)) Bool)

(assert (=> b!1081122 (= res!720602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081123 () Bool)

(declare-fun e!617979 () Bool)

(assert (=> b!1081123 (= e!617976 e!617979)))

(declare-fun res!720601 () Bool)

(assert (=> b!1081123 (=> (not res!720601) (not e!617979))))

(declare-fun lt!479202 () array!69573)

(assert (=> b!1081123 (= res!720601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479202 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081123 (= lt!479202 (array!69574 (store (arr!33460 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33996 _keys!1070)))))

(declare-fun b!1081124 () Bool)

(declare-fun res!720595 () Bool)

(assert (=> b!1081124 (=> (not res!720595) (not e!617976))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1081124 (= res!720595 (= (select (arr!33460 _keys!1070) i!650) k0!904))))

(declare-fun b!1081125 () Bool)

(declare-fun res!720600 () Bool)

(assert (=> b!1081125 (=> (not res!720600) (not e!617979))))

(declare-datatypes ((List!23317 0))(
  ( (Nil!23314) (Cons!23313 (h!24522 (_ BitVec 64)) (t!32686 List!23317)) )
))
(declare-fun arrayNoDuplicates!0 (array!69573 (_ BitVec 32) List!23317) Bool)

(assert (=> b!1081125 (= res!720600 (arrayNoDuplicates!0 lt!479202 #b00000000000000000000000000000000 Nil!23314))))

(declare-fun b!1081126 () Bool)

(declare-fun res!720596 () Bool)

(assert (=> b!1081126 (=> (not res!720596) (not e!617976))))

(assert (=> b!1081126 (= res!720596 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23314))))

(declare-fun b!1081127 () Bool)

(declare-fun res!720597 () Bool)

(assert (=> b!1081127 (=> (not res!720597) (not e!617976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081127 (= res!720597 (validKeyInArray!0 k0!904))))

(declare-fun res!720603 () Bool)

(assert (=> start!95658 (=> (not res!720603) (not e!617976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95658 (= res!720603 (validMask!0 mask!1414))))

(assert (=> start!95658 e!617976))

(assert (=> start!95658 tp!78781))

(assert (=> start!95658 true))

(assert (=> start!95658 tp_is_empty!26313))

(declare-fun array_inv!25832 (array!69573) Bool)

(assert (=> start!95658 (array_inv!25832 _keys!1070)))

(declare-datatypes ((V!40211 0))(
  ( (V!40212 (val!13213 Int)) )
))
(declare-datatypes ((ValueCell!12447 0))(
  ( (ValueCellFull!12447 (v!15834 V!40211)) (EmptyCell!12447) )
))
(declare-datatypes ((array!69575 0))(
  ( (array!69576 (arr!33461 (Array (_ BitVec 32) ValueCell!12447)) (size!33997 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69575)

(declare-fun e!617981 () Bool)

(declare-fun array_inv!25833 (array!69575) Bool)

(assert (=> start!95658 (and (array_inv!25833 _values!874) e!617981)))

(declare-fun b!1081128 () Bool)

(declare-fun res!720599 () Bool)

(assert (=> b!1081128 (=> (not res!720599) (not e!617976))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081128 (= res!720599 (and (= (size!33997 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33996 _keys!1070) (size!33997 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41224 () Bool)

(declare-fun mapRes!41224 () Bool)

(declare-fun tp!78782 () Bool)

(declare-fun e!617978 () Bool)

(assert (=> mapNonEmpty!41224 (= mapRes!41224 (and tp!78782 e!617978))))

(declare-fun mapKey!41224 () (_ BitVec 32))

(declare-fun mapRest!41224 () (Array (_ BitVec 32) ValueCell!12447))

(declare-fun mapValue!41224 () ValueCell!12447)

(assert (=> mapNonEmpty!41224 (= (arr!33461 _values!874) (store mapRest!41224 mapKey!41224 mapValue!41224))))

(declare-fun b!1081129 () Bool)

(assert (=> b!1081129 (= e!617981 (and e!617977 mapRes!41224))))

(declare-fun condMapEmpty!41224 () Bool)

(declare-fun mapDefault!41224 () ValueCell!12447)

(assert (=> b!1081129 (= condMapEmpty!41224 (= (arr!33461 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12447)) mapDefault!41224)))))

(declare-fun b!1081130 () Bool)

(declare-fun res!720598 () Bool)

(assert (=> b!1081130 (=> (not res!720598) (not e!617976))))

(assert (=> b!1081130 (= res!720598 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33996 _keys!1070))))))

(declare-fun b!1081131 () Bool)

(assert (=> b!1081131 (= e!617979 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40211)

(declare-fun zeroValue!831 () V!40211)

(declare-datatypes ((tuple2!16736 0))(
  ( (tuple2!16737 (_1!8379 (_ BitVec 64)) (_2!8379 V!40211)) )
))
(declare-datatypes ((List!23318 0))(
  ( (Nil!23315) (Cons!23314 (h!24523 tuple2!16736) (t!32687 List!23318)) )
))
(declare-datatypes ((ListLongMap!14705 0))(
  ( (ListLongMap!14706 (toList!7368 List!23318)) )
))
(declare-fun lt!479201 () ListLongMap!14705)

(declare-fun getCurrentListMapNoExtraKeys!3916 (array!69573 array!69575 (_ BitVec 32) (_ BitVec 32) V!40211 V!40211 (_ BitVec 32) Int) ListLongMap!14705)

(declare-fun dynLambda!2053 (Int (_ BitVec 64)) V!40211)

(assert (=> b!1081131 (= lt!479201 (getCurrentListMapNoExtraKeys!3916 lt!479202 (array!69576 (store (arr!33461 _values!874) i!650 (ValueCellFull!12447 (dynLambda!2053 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33997 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479200 () ListLongMap!14705)

(assert (=> b!1081131 (= lt!479200 (getCurrentListMapNoExtraKeys!3916 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081131 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35556 0))(
  ( (Unit!35557) )
))
(declare-fun lt!479203 () Unit!35556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69573 (_ BitVec 64) (_ BitVec 32)) Unit!35556)

(assert (=> b!1081131 (= lt!479203 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081132 () Bool)

(assert (=> b!1081132 (= e!617978 tp_is_empty!26313)))

(declare-fun mapIsEmpty!41224 () Bool)

(assert (=> mapIsEmpty!41224 mapRes!41224))

(assert (= (and start!95658 res!720603) b!1081128))

(assert (= (and b!1081128 res!720599) b!1081122))

(assert (= (and b!1081122 res!720602) b!1081126))

(assert (= (and b!1081126 res!720596) b!1081130))

(assert (= (and b!1081130 res!720598) b!1081127))

(assert (= (and b!1081127 res!720597) b!1081124))

(assert (= (and b!1081124 res!720595) b!1081123))

(assert (= (and b!1081123 res!720601) b!1081125))

(assert (= (and b!1081125 res!720600) b!1081131))

(assert (= (and b!1081129 condMapEmpty!41224) mapIsEmpty!41224))

(assert (= (and b!1081129 (not condMapEmpty!41224)) mapNonEmpty!41224))

(get-info :version)

(assert (= (and mapNonEmpty!41224 ((_ is ValueCellFull!12447) mapValue!41224)) b!1081132))

(assert (= (and b!1081129 ((_ is ValueCellFull!12447) mapDefault!41224)) b!1081121))

(assert (= start!95658 b!1081129))

(declare-fun b_lambda!16981 () Bool)

(assert (=> (not b_lambda!16981) (not b!1081131)))

(declare-fun t!32685 () Bool)

(declare-fun tb!7189 () Bool)

(assert (=> (and start!95658 (= defaultEntry!882 defaultEntry!882) t!32685) tb!7189))

(declare-fun result!14897 () Bool)

(assert (=> tb!7189 (= result!14897 tp_is_empty!26313)))

(assert (=> b!1081131 t!32685))

(declare-fun b_and!35299 () Bool)

(assert (= b_and!35297 (and (=> t!32685 result!14897) b_and!35299)))

(declare-fun m!998945 () Bool)

(assert (=> b!1081126 m!998945))

(declare-fun m!998947 () Bool)

(assert (=> b!1081124 m!998947))

(declare-fun m!998949 () Bool)

(assert (=> b!1081131 m!998949))

(declare-fun m!998951 () Bool)

(assert (=> b!1081131 m!998951))

(declare-fun m!998953 () Bool)

(assert (=> b!1081131 m!998953))

(declare-fun m!998955 () Bool)

(assert (=> b!1081131 m!998955))

(declare-fun m!998957 () Bool)

(assert (=> b!1081131 m!998957))

(declare-fun m!998959 () Bool)

(assert (=> b!1081131 m!998959))

(declare-fun m!998961 () Bool)

(assert (=> mapNonEmpty!41224 m!998961))

(declare-fun m!998963 () Bool)

(assert (=> b!1081125 m!998963))

(declare-fun m!998965 () Bool)

(assert (=> b!1081127 m!998965))

(declare-fun m!998967 () Bool)

(assert (=> b!1081123 m!998967))

(declare-fun m!998969 () Bool)

(assert (=> b!1081123 m!998969))

(declare-fun m!998971 () Bool)

(assert (=> start!95658 m!998971))

(declare-fun m!998973 () Bool)

(assert (=> start!95658 m!998973))

(declare-fun m!998975 () Bool)

(assert (=> start!95658 m!998975))

(declare-fun m!998977 () Bool)

(assert (=> b!1081122 m!998977))

(check-sat (not b!1081127) (not b!1081131) b_and!35299 tp_is_empty!26313 (not b_lambda!16981) (not b_next!22311) (not mapNonEmpty!41224) (not b!1081126) (not b!1081122) (not b!1081123) (not b!1081125) (not start!95658))
(check-sat b_and!35299 (not b_next!22311))
