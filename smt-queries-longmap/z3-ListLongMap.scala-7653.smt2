; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96240 () Bool)

(assert start!96240)

(declare-fun b_free!22893 () Bool)

(declare-fun b_next!22893 () Bool)

(assert (=> start!96240 (= b_free!22893 (not b_next!22893))))

(declare-fun tp!80527 () Bool)

(declare-fun b_and!36461 () Bool)

(assert (=> start!96240 (= tp!80527 b_and!36461)))

(declare-fun b!1093241 () Bool)

(declare-fun res!729522 () Bool)

(declare-fun e!624250 () Bool)

(assert (=> b!1093241 (=> (not res!729522) (not e!624250))))

(declare-datatypes ((array!70707 0))(
  ( (array!70708 (arr!34027 (Array (_ BitVec 32) (_ BitVec 64))) (size!34563 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70707)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70707 (_ BitVec 32)) Bool)

(assert (=> b!1093241 (= res!729522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42097 () Bool)

(declare-fun mapRes!42097 () Bool)

(declare-fun tp!80528 () Bool)

(declare-fun e!624249 () Bool)

(assert (=> mapNonEmpty!42097 (= mapRes!42097 (and tp!80528 e!624249))))

(declare-datatypes ((V!40987 0))(
  ( (V!40988 (val!13504 Int)) )
))
(declare-datatypes ((ValueCell!12738 0))(
  ( (ValueCellFull!12738 (v!16125 V!40987)) (EmptyCell!12738) )
))
(declare-fun mapRest!42097 () (Array (_ BitVec 32) ValueCell!12738))

(declare-fun mapValue!42097 () ValueCell!12738)

(declare-fun mapKey!42097 () (_ BitVec 32))

(declare-datatypes ((array!70709 0))(
  ( (array!70710 (arr!34028 (Array (_ BitVec 32) ValueCell!12738)) (size!34564 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70709)

(assert (=> mapNonEmpty!42097 (= (arr!34028 _values!874) (store mapRest!42097 mapKey!42097 mapValue!42097))))

(declare-fun b!1093242 () Bool)

(declare-fun res!729514 () Bool)

(assert (=> b!1093242 (=> (not res!729514) (not e!624250))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093242 (= res!729514 (and (= (size!34564 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34563 _keys!1070) (size!34564 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093243 () Bool)

(declare-fun tp_is_empty!26895 () Bool)

(assert (=> b!1093243 (= e!624249 tp_is_empty!26895)))

(declare-datatypes ((tuple2!17180 0))(
  ( (tuple2!17181 (_1!8601 (_ BitVec 64)) (_2!8601 V!40987)) )
))
(declare-datatypes ((List!23772 0))(
  ( (Nil!23769) (Cons!23768 (h!24977 tuple2!17180) (t!33723 List!23772)) )
))
(declare-datatypes ((ListLongMap!15149 0))(
  ( (ListLongMap!15150 (toList!7590 List!23772)) )
))
(declare-fun lt!488857 () ListLongMap!15149)

(declare-fun lt!488854 () ListLongMap!15149)

(declare-fun lt!488853 () Bool)

(declare-fun e!624251 () Bool)

(declare-fun b!1093244 () Bool)

(assert (=> b!1093244 (= e!624251 (not (or (and (not lt!488853) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!488853) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!488853) (not (= lt!488854 lt!488857)) (bvsle #b00000000000000000000000000000000 (size!34563 _keys!1070)))))))

(assert (=> b!1093244 (= lt!488853 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!488860 () ListLongMap!15149)

(declare-fun minValue!831 () V!40987)

(declare-fun zeroValue!831 () V!40987)

(declare-fun getCurrentListMap!4346 (array!70707 array!70709 (_ BitVec 32) (_ BitVec 32) V!40987 V!40987 (_ BitVec 32) Int) ListLongMap!15149)

(assert (=> b!1093244 (= lt!488860 (getCurrentListMap!4346 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488859 () array!70707)

(declare-fun lt!488851 () array!70709)

(assert (=> b!1093244 (= lt!488854 (getCurrentListMap!4346 lt!488859 lt!488851 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488856 () ListLongMap!15149)

(assert (=> b!1093244 (and (= lt!488857 lt!488856) (= lt!488856 lt!488857))))

(declare-fun lt!488858 () ListLongMap!15149)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!909 (ListLongMap!15149 (_ BitVec 64)) ListLongMap!15149)

(assert (=> b!1093244 (= lt!488856 (-!909 lt!488858 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35984 0))(
  ( (Unit!35985) )
))
(declare-fun lt!488855 () Unit!35984)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!165 (array!70707 array!70709 (_ BitVec 32) (_ BitVec 32) V!40987 V!40987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35984)

(assert (=> b!1093244 (= lt!488855 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!165 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4106 (array!70707 array!70709 (_ BitVec 32) (_ BitVec 32) V!40987 V!40987 (_ BitVec 32) Int) ListLongMap!15149)

(assert (=> b!1093244 (= lt!488857 (getCurrentListMapNoExtraKeys!4106 lt!488859 lt!488851 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2243 (Int (_ BitVec 64)) V!40987)

(assert (=> b!1093244 (= lt!488851 (array!70710 (store (arr!34028 _values!874) i!650 (ValueCellFull!12738 (dynLambda!2243 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34564 _values!874)))))

(assert (=> b!1093244 (= lt!488858 (getCurrentListMapNoExtraKeys!4106 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093244 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488852 () Unit!35984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70707 (_ BitVec 64) (_ BitVec 32)) Unit!35984)

(assert (=> b!1093244 (= lt!488852 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093246 () Bool)

(assert (=> b!1093246 (= e!624250 e!624251)))

(declare-fun res!729520 () Bool)

(assert (=> b!1093246 (=> (not res!729520) (not e!624251))))

(assert (=> b!1093246 (= res!729520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488859 mask!1414))))

(assert (=> b!1093246 (= lt!488859 (array!70708 (store (arr!34027 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34563 _keys!1070)))))

(declare-fun mapIsEmpty!42097 () Bool)

(assert (=> mapIsEmpty!42097 mapRes!42097))

(declare-fun b!1093247 () Bool)

(declare-fun res!729518 () Bool)

(assert (=> b!1093247 (=> (not res!729518) (not e!624250))))

(assert (=> b!1093247 (= res!729518 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34563 _keys!1070))))))

(declare-fun b!1093248 () Bool)

(declare-fun res!729516 () Bool)

(assert (=> b!1093248 (=> (not res!729516) (not e!624250))))

(assert (=> b!1093248 (= res!729516 (= (select (arr!34027 _keys!1070) i!650) k0!904))))

(declare-fun b!1093249 () Bool)

(declare-fun res!729521 () Bool)

(assert (=> b!1093249 (=> (not res!729521) (not e!624250))))

(declare-datatypes ((List!23773 0))(
  ( (Nil!23770) (Cons!23769 (h!24978 (_ BitVec 64)) (t!33724 List!23773)) )
))
(declare-fun arrayNoDuplicates!0 (array!70707 (_ BitVec 32) List!23773) Bool)

(assert (=> b!1093249 (= res!729521 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23770))))

(declare-fun b!1093250 () Bool)

(declare-fun res!729515 () Bool)

(assert (=> b!1093250 (=> (not res!729515) (not e!624251))))

(assert (=> b!1093250 (= res!729515 (arrayNoDuplicates!0 lt!488859 #b00000000000000000000000000000000 Nil!23770))))

(declare-fun b!1093251 () Bool)

(declare-fun res!729517 () Bool)

(assert (=> b!1093251 (=> (not res!729517) (not e!624250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093251 (= res!729517 (validKeyInArray!0 k0!904))))

(declare-fun b!1093252 () Bool)

(declare-fun e!624252 () Bool)

(declare-fun e!624253 () Bool)

(assert (=> b!1093252 (= e!624252 (and e!624253 mapRes!42097))))

(declare-fun condMapEmpty!42097 () Bool)

(declare-fun mapDefault!42097 () ValueCell!12738)

(assert (=> b!1093252 (= condMapEmpty!42097 (= (arr!34028 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12738)) mapDefault!42097)))))

(declare-fun res!729519 () Bool)

(assert (=> start!96240 (=> (not res!729519) (not e!624250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96240 (= res!729519 (validMask!0 mask!1414))))

(assert (=> start!96240 e!624250))

(assert (=> start!96240 tp!80527))

(assert (=> start!96240 true))

(assert (=> start!96240 tp_is_empty!26895))

(declare-fun array_inv!26224 (array!70707) Bool)

(assert (=> start!96240 (array_inv!26224 _keys!1070)))

(declare-fun array_inv!26225 (array!70709) Bool)

(assert (=> start!96240 (and (array_inv!26225 _values!874) e!624252)))

(declare-fun b!1093245 () Bool)

(assert (=> b!1093245 (= e!624253 tp_is_empty!26895)))

(assert (= (and start!96240 res!729519) b!1093242))

(assert (= (and b!1093242 res!729514) b!1093241))

(assert (= (and b!1093241 res!729522) b!1093249))

(assert (= (and b!1093249 res!729521) b!1093247))

(assert (= (and b!1093247 res!729518) b!1093251))

(assert (= (and b!1093251 res!729517) b!1093248))

(assert (= (and b!1093248 res!729516) b!1093246))

(assert (= (and b!1093246 res!729520) b!1093250))

(assert (= (and b!1093250 res!729515) b!1093244))

(assert (= (and b!1093252 condMapEmpty!42097) mapIsEmpty!42097))

(assert (= (and b!1093252 (not condMapEmpty!42097)) mapNonEmpty!42097))

(get-info :version)

(assert (= (and mapNonEmpty!42097 ((_ is ValueCellFull!12738) mapValue!42097)) b!1093243))

(assert (= (and b!1093252 ((_ is ValueCellFull!12738) mapDefault!42097)) b!1093245))

(assert (= start!96240 b!1093252))

(declare-fun b_lambda!17563 () Bool)

(assert (=> (not b_lambda!17563) (not b!1093244)))

(declare-fun t!33722 () Bool)

(declare-fun tb!7771 () Bool)

(assert (=> (and start!96240 (= defaultEntry!882 defaultEntry!882) t!33722) tb!7771))

(declare-fun result!16061 () Bool)

(assert (=> tb!7771 (= result!16061 tp_is_empty!26895)))

(assert (=> b!1093244 t!33722))

(declare-fun b_and!36463 () Bool)

(assert (= b_and!36461 (and (=> t!33722 result!16061) b_and!36463)))

(declare-fun m!1013089 () Bool)

(assert (=> b!1093244 m!1013089))

(declare-fun m!1013091 () Bool)

(assert (=> b!1093244 m!1013091))

(declare-fun m!1013093 () Bool)

(assert (=> b!1093244 m!1013093))

(declare-fun m!1013095 () Bool)

(assert (=> b!1093244 m!1013095))

(declare-fun m!1013097 () Bool)

(assert (=> b!1093244 m!1013097))

(declare-fun m!1013099 () Bool)

(assert (=> b!1093244 m!1013099))

(declare-fun m!1013101 () Bool)

(assert (=> b!1093244 m!1013101))

(declare-fun m!1013103 () Bool)

(assert (=> b!1093244 m!1013103))

(declare-fun m!1013105 () Bool)

(assert (=> b!1093244 m!1013105))

(declare-fun m!1013107 () Bool)

(assert (=> b!1093244 m!1013107))

(declare-fun m!1013109 () Bool)

(assert (=> b!1093251 m!1013109))

(declare-fun m!1013111 () Bool)

(assert (=> b!1093250 m!1013111))

(declare-fun m!1013113 () Bool)

(assert (=> b!1093241 m!1013113))

(declare-fun m!1013115 () Bool)

(assert (=> mapNonEmpty!42097 m!1013115))

(declare-fun m!1013117 () Bool)

(assert (=> b!1093249 m!1013117))

(declare-fun m!1013119 () Bool)

(assert (=> b!1093246 m!1013119))

(declare-fun m!1013121 () Bool)

(assert (=> b!1093246 m!1013121))

(declare-fun m!1013123 () Bool)

(assert (=> start!96240 m!1013123))

(declare-fun m!1013125 () Bool)

(assert (=> start!96240 m!1013125))

(declare-fun m!1013127 () Bool)

(assert (=> start!96240 m!1013127))

(declare-fun m!1013129 () Bool)

(assert (=> b!1093248 m!1013129))

(check-sat (not b!1093249) tp_is_empty!26895 b_and!36463 (not b!1093250) (not b!1093251) (not mapNonEmpty!42097) (not b!1093244) (not b!1093246) (not b_lambda!17563) (not b_next!22893) (not b!1093241) (not start!96240))
(check-sat b_and!36463 (not b_next!22893))
