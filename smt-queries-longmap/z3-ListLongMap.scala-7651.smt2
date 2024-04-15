; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96220 () Bool)

(assert start!96220)

(declare-fun b_free!22879 () Bool)

(declare-fun b_next!22879 () Bool)

(assert (=> start!96220 (= b_free!22879 (not b_next!22879))))

(declare-fun tp!80485 () Bool)

(declare-fun b_and!36407 () Bool)

(assert (=> start!96220 (= tp!80485 b_and!36407)))

(declare-fun b!1092822 () Bool)

(declare-fun e!624030 () Bool)

(declare-fun tp_is_empty!26881 () Bool)

(assert (=> b!1092822 (= e!624030 tp_is_empty!26881)))

(declare-fun b!1092823 () Bool)

(declare-fun res!729258 () Bool)

(declare-fun e!624032 () Bool)

(assert (=> b!1092823 (=> (not res!729258) (not e!624032))))

(declare-datatypes ((array!70594 0))(
  ( (array!70595 (arr!33971 (Array (_ BitVec 32) (_ BitVec 64))) (size!34509 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70594)

(declare-datatypes ((List!23792 0))(
  ( (Nil!23789) (Cons!23788 (h!24997 (_ BitVec 64)) (t!33720 List!23792)) )
))
(declare-fun arrayNoDuplicates!0 (array!70594 (_ BitVec 32) List!23792) Bool)

(assert (=> b!1092823 (= res!729258 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun b!1092824 () Bool)

(declare-fun res!729262 () Bool)

(assert (=> b!1092824 (=> (not res!729262) (not e!624032))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092824 (= res!729262 (= (select (arr!33971 _keys!1070) i!650) k0!904))))

(declare-fun b!1092825 () Bool)

(declare-fun e!624031 () Bool)

(assert (=> b!1092825 (= e!624032 e!624031)))

(declare-fun res!729256 () Bool)

(assert (=> b!1092825 (=> (not res!729256) (not e!624031))))

(declare-fun lt!488457 () array!70594)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70594 (_ BitVec 32)) Bool)

(assert (=> b!1092825 (= res!729256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488457 mask!1414))))

(assert (=> b!1092825 (= lt!488457 (array!70595 (store (arr!33971 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34509 _keys!1070)))))

(declare-fun b!1092826 () Bool)

(declare-fun res!729259 () Bool)

(assert (=> b!1092826 (=> (not res!729259) (not e!624031))))

(assert (=> b!1092826 (= res!729259 (arrayNoDuplicates!0 lt!488457 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun res!729263 () Bool)

(assert (=> start!96220 (=> (not res!729263) (not e!624032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96220 (= res!729263 (validMask!0 mask!1414))))

(assert (=> start!96220 e!624032))

(assert (=> start!96220 tp!80485))

(assert (=> start!96220 true))

(assert (=> start!96220 tp_is_empty!26881))

(declare-fun array_inv!26224 (array!70594) Bool)

(assert (=> start!96220 (array_inv!26224 _keys!1070)))

(declare-datatypes ((V!40969 0))(
  ( (V!40970 (val!13497 Int)) )
))
(declare-datatypes ((ValueCell!12731 0))(
  ( (ValueCellFull!12731 (v!16117 V!40969)) (EmptyCell!12731) )
))
(declare-datatypes ((array!70596 0))(
  ( (array!70597 (arr!33972 (Array (_ BitVec 32) ValueCell!12731)) (size!34510 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70596)

(declare-fun e!624035 () Bool)

(declare-fun array_inv!26225 (array!70596) Bool)

(assert (=> start!96220 (and (array_inv!26225 _values!874) e!624035)))

(declare-fun b!1092827 () Bool)

(assert (=> b!1092827 (= e!624031 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40969)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17226 0))(
  ( (tuple2!17227 (_1!8624 (_ BitVec 64)) (_2!8624 V!40969)) )
))
(declare-datatypes ((List!23793 0))(
  ( (Nil!23790) (Cons!23789 (h!24998 tuple2!17226) (t!33721 List!23793)) )
))
(declare-datatypes ((ListLongMap!15195 0))(
  ( (ListLongMap!15196 (toList!7613 List!23793)) )
))
(declare-fun lt!488459 () ListLongMap!15195)

(declare-fun zeroValue!831 () V!40969)

(declare-fun getCurrentListMap!4276 (array!70594 array!70596 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) Int) ListLongMap!15195)

(assert (=> b!1092827 (= lt!488459 (getCurrentListMap!4276 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488460 () array!70596)

(declare-fun lt!488458 () ListLongMap!15195)

(assert (=> b!1092827 (= lt!488458 (getCurrentListMap!4276 lt!488457 lt!488460 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488462 () ListLongMap!15195)

(declare-fun lt!488464 () ListLongMap!15195)

(assert (=> b!1092827 (and (= lt!488462 lt!488464) (= lt!488464 lt!488462))))

(declare-fun lt!488465 () ListLongMap!15195)

(declare-fun -!885 (ListLongMap!15195 (_ BitVec 64)) ListLongMap!15195)

(assert (=> b!1092827 (= lt!488464 (-!885 lt!488465 k0!904))))

(declare-datatypes ((Unit!35805 0))(
  ( (Unit!35806) )
))
(declare-fun lt!488463 () Unit!35805)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!160 (array!70594 array!70596 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35805)

(assert (=> b!1092827 (= lt!488463 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!160 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4146 (array!70594 array!70596 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) Int) ListLongMap!15195)

(assert (=> b!1092827 (= lt!488462 (getCurrentListMapNoExtraKeys!4146 lt!488457 lt!488460 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2217 (Int (_ BitVec 64)) V!40969)

(assert (=> b!1092827 (= lt!488460 (array!70597 (store (arr!33972 _values!874) i!650 (ValueCellFull!12731 (dynLambda!2217 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34510 _values!874)))))

(assert (=> b!1092827 (= lt!488465 (getCurrentListMapNoExtraKeys!4146 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092827 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488461 () Unit!35805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70594 (_ BitVec 64) (_ BitVec 32)) Unit!35805)

(assert (=> b!1092827 (= lt!488461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092828 () Bool)

(declare-fun mapRes!42076 () Bool)

(assert (=> b!1092828 (= e!624035 (and e!624030 mapRes!42076))))

(declare-fun condMapEmpty!42076 () Bool)

(declare-fun mapDefault!42076 () ValueCell!12731)

(assert (=> b!1092828 (= condMapEmpty!42076 (= (arr!33972 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12731)) mapDefault!42076)))))

(declare-fun b!1092829 () Bool)

(declare-fun e!624033 () Bool)

(assert (=> b!1092829 (= e!624033 tp_is_empty!26881)))

(declare-fun mapIsEmpty!42076 () Bool)

(assert (=> mapIsEmpty!42076 mapRes!42076))

(declare-fun b!1092830 () Bool)

(declare-fun res!729257 () Bool)

(assert (=> b!1092830 (=> (not res!729257) (not e!624032))))

(assert (=> b!1092830 (= res!729257 (and (= (size!34510 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34509 _keys!1070) (size!34510 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092831 () Bool)

(declare-fun res!729261 () Bool)

(assert (=> b!1092831 (=> (not res!729261) (not e!624032))))

(assert (=> b!1092831 (= res!729261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092832 () Bool)

(declare-fun res!729264 () Bool)

(assert (=> b!1092832 (=> (not res!729264) (not e!624032))))

(assert (=> b!1092832 (= res!729264 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34509 _keys!1070))))))

(declare-fun b!1092833 () Bool)

(declare-fun res!729260 () Bool)

(assert (=> b!1092833 (=> (not res!729260) (not e!624032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092833 (= res!729260 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42076 () Bool)

(declare-fun tp!80486 () Bool)

(assert (=> mapNonEmpty!42076 (= mapRes!42076 (and tp!80486 e!624033))))

(declare-fun mapRest!42076 () (Array (_ BitVec 32) ValueCell!12731))

(declare-fun mapKey!42076 () (_ BitVec 32))

(declare-fun mapValue!42076 () ValueCell!12731)

(assert (=> mapNonEmpty!42076 (= (arr!33972 _values!874) (store mapRest!42076 mapKey!42076 mapValue!42076))))

(assert (= (and start!96220 res!729263) b!1092830))

(assert (= (and b!1092830 res!729257) b!1092831))

(assert (= (and b!1092831 res!729261) b!1092823))

(assert (= (and b!1092823 res!729258) b!1092832))

(assert (= (and b!1092832 res!729264) b!1092833))

(assert (= (and b!1092833 res!729260) b!1092824))

(assert (= (and b!1092824 res!729262) b!1092825))

(assert (= (and b!1092825 res!729256) b!1092826))

(assert (= (and b!1092826 res!729259) b!1092827))

(assert (= (and b!1092828 condMapEmpty!42076) mapIsEmpty!42076))

(assert (= (and b!1092828 (not condMapEmpty!42076)) mapNonEmpty!42076))

(get-info :version)

(assert (= (and mapNonEmpty!42076 ((_ is ValueCellFull!12731) mapValue!42076)) b!1092829))

(assert (= (and b!1092828 ((_ is ValueCellFull!12731) mapDefault!42076)) b!1092822))

(assert (= start!96220 b!1092828))

(declare-fun b_lambda!17527 () Bool)

(assert (=> (not b_lambda!17527) (not b!1092827)))

(declare-fun t!33719 () Bool)

(declare-fun tb!7749 () Bool)

(assert (=> (and start!96220 (= defaultEntry!882 defaultEntry!882) t!33719) tb!7749))

(declare-fun result!16025 () Bool)

(assert (=> tb!7749 (= result!16025 tp_is_empty!26881)))

(assert (=> b!1092827 t!33719))

(declare-fun b_and!36409 () Bool)

(assert (= b_and!36407 (and (=> t!33719 result!16025) b_and!36409)))

(declare-fun m!1012169 () Bool)

(assert (=> mapNonEmpty!42076 m!1012169))

(declare-fun m!1012171 () Bool)

(assert (=> b!1092823 m!1012171))

(declare-fun m!1012173 () Bool)

(assert (=> b!1092824 m!1012173))

(declare-fun m!1012175 () Bool)

(assert (=> start!96220 m!1012175))

(declare-fun m!1012177 () Bool)

(assert (=> start!96220 m!1012177))

(declare-fun m!1012179 () Bool)

(assert (=> start!96220 m!1012179))

(declare-fun m!1012181 () Bool)

(assert (=> b!1092826 m!1012181))

(declare-fun m!1012183 () Bool)

(assert (=> b!1092825 m!1012183))

(declare-fun m!1012185 () Bool)

(assert (=> b!1092825 m!1012185))

(declare-fun m!1012187 () Bool)

(assert (=> b!1092833 m!1012187))

(declare-fun m!1012189 () Bool)

(assert (=> b!1092827 m!1012189))

(declare-fun m!1012191 () Bool)

(assert (=> b!1092827 m!1012191))

(declare-fun m!1012193 () Bool)

(assert (=> b!1092827 m!1012193))

(declare-fun m!1012195 () Bool)

(assert (=> b!1092827 m!1012195))

(declare-fun m!1012197 () Bool)

(assert (=> b!1092827 m!1012197))

(declare-fun m!1012199 () Bool)

(assert (=> b!1092827 m!1012199))

(declare-fun m!1012201 () Bool)

(assert (=> b!1092827 m!1012201))

(declare-fun m!1012203 () Bool)

(assert (=> b!1092827 m!1012203))

(declare-fun m!1012205 () Bool)

(assert (=> b!1092827 m!1012205))

(declare-fun m!1012207 () Bool)

(assert (=> b!1092827 m!1012207))

(declare-fun m!1012209 () Bool)

(assert (=> b!1092831 m!1012209))

(check-sat (not b!1092825) tp_is_empty!26881 (not b_next!22879) (not mapNonEmpty!42076) (not b_lambda!17527) (not b!1092827) (not start!96220) b_and!36409 (not b!1092826) (not b!1092833) (not b!1092831) (not b!1092823))
(check-sat b_and!36409 (not b_next!22879))
