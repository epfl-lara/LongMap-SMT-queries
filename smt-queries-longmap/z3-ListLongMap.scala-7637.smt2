; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96136 () Bool)

(assert start!96136)

(declare-fun b_free!22795 () Bool)

(declare-fun b_next!22795 () Bool)

(assert (=> start!96136 (= b_free!22795 (not b_next!22795))))

(declare-fun tp!80233 () Bool)

(declare-fun b_and!36239 () Bool)

(assert (=> start!96136 (= tp!80233 b_and!36239)))

(declare-fun b!1091086 () Bool)

(declare-fun e!623138 () Bool)

(declare-fun tp_is_empty!26797 () Bool)

(assert (=> b!1091086 (= e!623138 tp_is_empty!26797)))

(declare-fun b!1091087 () Bool)

(declare-fun res!727982 () Bool)

(declare-fun e!623139 () Bool)

(assert (=> b!1091087 (=> (not res!727982) (not e!623139))))

(declare-datatypes ((array!70434 0))(
  ( (array!70435 (arr!33891 (Array (_ BitVec 32) (_ BitVec 64))) (size!34429 (_ BitVec 32))) )
))
(declare-fun lt!487045 () array!70434)

(declare-datatypes ((List!23730 0))(
  ( (Nil!23727) (Cons!23726 (h!24935 (_ BitVec 64)) (t!33574 List!23730)) )
))
(declare-fun arrayNoDuplicates!0 (array!70434 (_ BitVec 32) List!23730) Bool)

(assert (=> b!1091087 (= res!727982 (arrayNoDuplicates!0 lt!487045 #b00000000000000000000000000000000 Nil!23727))))

(declare-fun b!1091088 () Bool)

(declare-fun res!727989 () Bool)

(declare-fun e!623137 () Bool)

(assert (=> b!1091088 (=> (not res!727989) (not e!623137))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70434)

(declare-datatypes ((V!40857 0))(
  ( (V!40858 (val!13455 Int)) )
))
(declare-datatypes ((ValueCell!12689 0))(
  ( (ValueCellFull!12689 (v!16075 V!40857)) (EmptyCell!12689) )
))
(declare-datatypes ((array!70436 0))(
  ( (array!70437 (arr!33892 (Array (_ BitVec 32) ValueCell!12689)) (size!34430 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70436)

(assert (=> b!1091088 (= res!727989 (and (= (size!34430 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34429 _keys!1070) (size!34430 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091089 () Bool)

(declare-fun e!623134 () Bool)

(assert (=> b!1091089 (= e!623139 (not e!623134))))

(declare-fun res!727991 () Bool)

(assert (=> b!1091089 (=> res!727991 e!623134)))

(assert (=> b!1091089 (= res!727991 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40857)

(declare-fun zeroValue!831 () V!40857)

(declare-datatypes ((tuple2!17164 0))(
  ( (tuple2!17165 (_1!8593 (_ BitVec 64)) (_2!8593 V!40857)) )
))
(declare-datatypes ((List!23731 0))(
  ( (Nil!23728) (Cons!23727 (h!24936 tuple2!17164) (t!33575 List!23731)) )
))
(declare-datatypes ((ListLongMap!15133 0))(
  ( (ListLongMap!15134 (toList!7582 List!23731)) )
))
(declare-fun lt!487055 () ListLongMap!15133)

(declare-fun getCurrentListMap!4251 (array!70434 array!70436 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1091089 (= lt!487055 (getCurrentListMap!4251 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487043 () array!70436)

(declare-fun lt!487047 () ListLongMap!15133)

(assert (=> b!1091089 (= lt!487047 (getCurrentListMap!4251 lt!487045 lt!487043 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487053 () ListLongMap!15133)

(declare-fun lt!487052 () ListLongMap!15133)

(assert (=> b!1091089 (and (= lt!487053 lt!487052) (= lt!487052 lt!487053))))

(declare-fun lt!487051 () ListLongMap!15133)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!856 (ListLongMap!15133 (_ BitVec 64)) ListLongMap!15133)

(assert (=> b!1091089 (= lt!487052 (-!856 lt!487051 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35747 0))(
  ( (Unit!35748) )
))
(declare-fun lt!487046 () Unit!35747)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 (array!70434 array!70436 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35747)

(assert (=> b!1091089 (= lt!487046 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4121 (array!70434 array!70436 (_ BitVec 32) (_ BitVec 32) V!40857 V!40857 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1091089 (= lt!487053 (getCurrentListMapNoExtraKeys!4121 lt!487045 lt!487043 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2192 (Int (_ BitVec 64)) V!40857)

(assert (=> b!1091089 (= lt!487043 (array!70437 (store (arr!33892 _values!874) i!650 (ValueCellFull!12689 (dynLambda!2192 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34430 _values!874)))))

(assert (=> b!1091089 (= lt!487051 (getCurrentListMapNoExtraKeys!4121 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091089 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487049 () Unit!35747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70434 (_ BitVec 64) (_ BitVec 32)) Unit!35747)

(assert (=> b!1091089 (= lt!487049 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091090 () Bool)

(declare-fun res!727984 () Bool)

(assert (=> b!1091090 (=> (not res!727984) (not e!623137))))

(assert (=> b!1091090 (= res!727984 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23727))))

(declare-fun b!1091092 () Bool)

(declare-fun res!727987 () Bool)

(assert (=> b!1091092 (=> (not res!727987) (not e!623137))))

(assert (=> b!1091092 (= res!727987 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34429 _keys!1070))))))

(declare-fun b!1091093 () Bool)

(assert (=> b!1091093 (= e!623137 e!623139)))

(declare-fun res!727986 () Bool)

(assert (=> b!1091093 (=> (not res!727986) (not e!623139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70434 (_ BitVec 32)) Bool)

(assert (=> b!1091093 (= res!727986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487045 mask!1414))))

(assert (=> b!1091093 (= lt!487045 (array!70435 (store (arr!33891 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34429 _keys!1070)))))

(declare-fun b!1091094 () Bool)

(declare-fun res!727983 () Bool)

(assert (=> b!1091094 (=> (not res!727983) (not e!623137))))

(assert (=> b!1091094 (= res!727983 (= (select (arr!33891 _keys!1070) i!650) k0!904))))

(declare-fun b!1091095 () Bool)

(declare-fun res!727988 () Bool)

(assert (=> b!1091095 (=> (not res!727988) (not e!623137))))

(assert (=> b!1091095 (= res!727988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091096 () Bool)

(declare-fun e!623141 () Bool)

(assert (=> b!1091096 (= e!623141 true)))

(declare-fun lt!487054 () ListLongMap!15133)

(declare-fun lt!487048 () ListLongMap!15133)

(assert (=> b!1091096 (= (-!856 lt!487054 k0!904) lt!487048)))

(declare-fun lt!487050 () Unit!35747)

(declare-fun addRemoveCommutativeForDiffKeys!100 (ListLongMap!15133 (_ BitVec 64) V!40857 (_ BitVec 64)) Unit!35747)

(assert (=> b!1091096 (= lt!487050 (addRemoveCommutativeForDiffKeys!100 lt!487051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091097 () Bool)

(declare-fun e!623135 () Bool)

(declare-fun e!623136 () Bool)

(declare-fun mapRes!41950 () Bool)

(assert (=> b!1091097 (= e!623135 (and e!623136 mapRes!41950))))

(declare-fun condMapEmpty!41950 () Bool)

(declare-fun mapDefault!41950 () ValueCell!12689)

(assert (=> b!1091097 (= condMapEmpty!41950 (= (arr!33892 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12689)) mapDefault!41950)))))

(declare-fun mapNonEmpty!41950 () Bool)

(declare-fun tp!80234 () Bool)

(assert (=> mapNonEmpty!41950 (= mapRes!41950 (and tp!80234 e!623138))))

(declare-fun mapRest!41950 () (Array (_ BitVec 32) ValueCell!12689))

(declare-fun mapKey!41950 () (_ BitVec 32))

(declare-fun mapValue!41950 () ValueCell!12689)

(assert (=> mapNonEmpty!41950 (= (arr!33892 _values!874) (store mapRest!41950 mapKey!41950 mapValue!41950))))

(declare-fun b!1091098 () Bool)

(assert (=> b!1091098 (= e!623136 tp_is_empty!26797)))

(declare-fun res!727992 () Bool)

(assert (=> start!96136 (=> (not res!727992) (not e!623137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96136 (= res!727992 (validMask!0 mask!1414))))

(assert (=> start!96136 e!623137))

(assert (=> start!96136 tp!80233))

(assert (=> start!96136 true))

(assert (=> start!96136 tp_is_empty!26797))

(declare-fun array_inv!26172 (array!70434) Bool)

(assert (=> start!96136 (array_inv!26172 _keys!1070)))

(declare-fun array_inv!26173 (array!70436) Bool)

(assert (=> start!96136 (and (array_inv!26173 _values!874) e!623135)))

(declare-fun b!1091091 () Bool)

(declare-fun res!727990 () Bool)

(assert (=> b!1091091 (=> (not res!727990) (not e!623137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091091 (= res!727990 (validKeyInArray!0 k0!904))))

(declare-fun b!1091099 () Bool)

(assert (=> b!1091099 (= e!623134 e!623141)))

(declare-fun res!727985 () Bool)

(assert (=> b!1091099 (=> res!727985 e!623141)))

(assert (=> b!1091099 (= res!727985 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091099 (= lt!487055 lt!487054)))

(declare-fun lt!487044 () tuple2!17164)

(declare-fun +!3372 (ListLongMap!15133 tuple2!17164) ListLongMap!15133)

(assert (=> b!1091099 (= lt!487054 (+!3372 lt!487051 lt!487044))))

(assert (=> b!1091099 (= lt!487047 lt!487048)))

(assert (=> b!1091099 (= lt!487048 (+!3372 lt!487052 lt!487044))))

(assert (=> b!1091099 (= lt!487047 (+!3372 lt!487053 lt!487044))))

(assert (=> b!1091099 (= lt!487044 (tuple2!17165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapIsEmpty!41950 () Bool)

(assert (=> mapIsEmpty!41950 mapRes!41950))

(assert (= (and start!96136 res!727992) b!1091088))

(assert (= (and b!1091088 res!727989) b!1091095))

(assert (= (and b!1091095 res!727988) b!1091090))

(assert (= (and b!1091090 res!727984) b!1091092))

(assert (= (and b!1091092 res!727987) b!1091091))

(assert (= (and b!1091091 res!727990) b!1091094))

(assert (= (and b!1091094 res!727983) b!1091093))

(assert (= (and b!1091093 res!727986) b!1091087))

(assert (= (and b!1091087 res!727982) b!1091089))

(assert (= (and b!1091089 (not res!727991)) b!1091099))

(assert (= (and b!1091099 (not res!727985)) b!1091096))

(assert (= (and b!1091097 condMapEmpty!41950) mapIsEmpty!41950))

(assert (= (and b!1091097 (not condMapEmpty!41950)) mapNonEmpty!41950))

(get-info :version)

(assert (= (and mapNonEmpty!41950 ((_ is ValueCellFull!12689) mapValue!41950)) b!1091086))

(assert (= (and b!1091097 ((_ is ValueCellFull!12689) mapDefault!41950)) b!1091098))

(assert (= start!96136 b!1091097))

(declare-fun b_lambda!17443 () Bool)

(assert (=> (not b_lambda!17443) (not b!1091089)))

(declare-fun t!33573 () Bool)

(declare-fun tb!7665 () Bool)

(assert (=> (and start!96136 (= defaultEntry!882 defaultEntry!882) t!33573) tb!7665))

(declare-fun result!15857 () Bool)

(assert (=> tb!7665 (= result!15857 tp_is_empty!26797)))

(assert (=> b!1091089 t!33573))

(declare-fun b_and!36241 () Bool)

(assert (= b_and!36239 (and (=> t!33573 result!15857) b_and!36241)))

(declare-fun m!1010165 () Bool)

(assert (=> b!1091090 m!1010165))

(declare-fun m!1010167 () Bool)

(assert (=> b!1091095 m!1010167))

(declare-fun m!1010169 () Bool)

(assert (=> mapNonEmpty!41950 m!1010169))

(declare-fun m!1010171 () Bool)

(assert (=> b!1091099 m!1010171))

(declare-fun m!1010173 () Bool)

(assert (=> b!1091099 m!1010173))

(declare-fun m!1010175 () Bool)

(assert (=> b!1091099 m!1010175))

(declare-fun m!1010177 () Bool)

(assert (=> b!1091091 m!1010177))

(declare-fun m!1010179 () Bool)

(assert (=> b!1091093 m!1010179))

(declare-fun m!1010181 () Bool)

(assert (=> b!1091093 m!1010181))

(declare-fun m!1010183 () Bool)

(assert (=> b!1091087 m!1010183))

(declare-fun m!1010185 () Bool)

(assert (=> b!1091089 m!1010185))

(declare-fun m!1010187 () Bool)

(assert (=> b!1091089 m!1010187))

(declare-fun m!1010189 () Bool)

(assert (=> b!1091089 m!1010189))

(declare-fun m!1010191 () Bool)

(assert (=> b!1091089 m!1010191))

(declare-fun m!1010193 () Bool)

(assert (=> b!1091089 m!1010193))

(declare-fun m!1010195 () Bool)

(assert (=> b!1091089 m!1010195))

(declare-fun m!1010197 () Bool)

(assert (=> b!1091089 m!1010197))

(declare-fun m!1010199 () Bool)

(assert (=> b!1091089 m!1010199))

(declare-fun m!1010201 () Bool)

(assert (=> b!1091089 m!1010201))

(declare-fun m!1010203 () Bool)

(assert (=> b!1091089 m!1010203))

(declare-fun m!1010205 () Bool)

(assert (=> start!96136 m!1010205))

(declare-fun m!1010207 () Bool)

(assert (=> start!96136 m!1010207))

(declare-fun m!1010209 () Bool)

(assert (=> start!96136 m!1010209))

(declare-fun m!1010211 () Bool)

(assert (=> b!1091096 m!1010211))

(declare-fun m!1010213 () Bool)

(assert (=> b!1091096 m!1010213))

(declare-fun m!1010215 () Bool)

(assert (=> b!1091094 m!1010215))

(check-sat tp_is_empty!26797 (not b_next!22795) (not b_lambda!17443) (not mapNonEmpty!41950) (not b!1091096) (not b!1091090) (not b!1091095) (not b!1091089) (not b!1091091) (not b!1091093) (not b!1091087) (not b!1091099) (not start!96136) b_and!36241)
(check-sat b_and!36241 (not b_next!22795))
