; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96288 () Bool)

(assert start!96288)

(declare-fun b_free!22705 () Bool)

(declare-fun b_next!22705 () Bool)

(assert (=> start!96288 (= b_free!22705 (not b_next!22705))))

(declare-fun tp!79964 () Bool)

(declare-fun b_and!36095 () Bool)

(assert (=> start!96288 (= tp!79964 b_and!36095)))

(declare-fun b!1090577 () Bool)

(declare-fun res!727082 () Bool)

(declare-fun e!623004 () Bool)

(assert (=> b!1090577 (=> (not res!727082) (not e!623004))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70377 0))(
  ( (array!70378 (arr!33856 (Array (_ BitVec 32) (_ BitVec 64))) (size!34393 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70377)

(assert (=> b!1090577 (= res!727082 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34393 _keys!1070))))))

(declare-fun b!1090578 () Bool)

(declare-fun e!623006 () Bool)

(declare-fun tp_is_empty!26707 () Bool)

(assert (=> b!1090578 (= e!623006 tp_is_empty!26707)))

(declare-fun mapIsEmpty!41815 () Bool)

(declare-fun mapRes!41815 () Bool)

(assert (=> mapIsEmpty!41815 mapRes!41815))

(declare-fun b!1090579 () Bool)

(declare-fun res!727085 () Bool)

(assert (=> b!1090579 (=> (not res!727085) (not e!623004))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40737 0))(
  ( (V!40738 (val!13410 Int)) )
))
(declare-datatypes ((ValueCell!12644 0))(
  ( (ValueCellFull!12644 (v!16027 V!40737)) (EmptyCell!12644) )
))
(declare-datatypes ((array!70379 0))(
  ( (array!70380 (arr!33857 (Array (_ BitVec 32) ValueCell!12644)) (size!34394 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70379)

(assert (=> b!1090579 (= res!727085 (and (= (size!34394 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34393 _keys!1070) (size!34394 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41815 () Bool)

(declare-fun tp!79963 () Bool)

(assert (=> mapNonEmpty!41815 (= mapRes!41815 (and tp!79963 e!623006))))

(declare-fun mapValue!41815 () ValueCell!12644)

(declare-fun mapKey!41815 () (_ BitVec 32))

(declare-fun mapRest!41815 () (Array (_ BitVec 32) ValueCell!12644))

(assert (=> mapNonEmpty!41815 (= (arr!33857 _values!874) (store mapRest!41815 mapKey!41815 mapValue!41815))))

(declare-fun b!1090580 () Bool)

(declare-fun res!727088 () Bool)

(assert (=> b!1090580 (=> (not res!727088) (not e!623004))))

(declare-datatypes ((List!23639 0))(
  ( (Nil!23636) (Cons!23635 (h!24853 (_ BitVec 64)) (t!33394 List!23639)) )
))
(declare-fun arrayNoDuplicates!0 (array!70377 (_ BitVec 32) List!23639) Bool)

(assert (=> b!1090580 (= res!727088 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23636))))

(declare-fun b!1090581 () Bool)

(declare-fun res!727080 () Bool)

(assert (=> b!1090581 (=> (not res!727080) (not e!623004))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1090581 (= res!727080 (= (select (arr!33856 _keys!1070) i!650) k0!904))))

(declare-fun b!1090582 () Bool)

(declare-fun res!727084 () Bool)

(assert (=> b!1090582 (=> (not res!727084) (not e!623004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70377 (_ BitVec 32)) Bool)

(assert (=> b!1090582 (= res!727084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090583 () Bool)

(declare-fun res!727083 () Bool)

(declare-fun e!623003 () Bool)

(assert (=> b!1090583 (=> (not res!727083) (not e!623003))))

(declare-fun lt!486039 () array!70377)

(assert (=> b!1090583 (= res!727083 (arrayNoDuplicates!0 lt!486039 #b00000000000000000000000000000000 Nil!23636))))

(declare-fun b!1090584 () Bool)

(declare-fun e!623008 () Bool)

(assert (=> b!1090584 (= e!623003 (not e!623008))))

(declare-fun res!727087 () Bool)

(assert (=> b!1090584 (=> res!727087 e!623008)))

(assert (=> b!1090584 (= res!727087 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40737)

(declare-datatypes ((tuple2!17048 0))(
  ( (tuple2!17049 (_1!8535 (_ BitVec 64)) (_2!8535 V!40737)) )
))
(declare-datatypes ((List!23640 0))(
  ( (Nil!23637) (Cons!23636 (h!24854 tuple2!17048) (t!33395 List!23640)) )
))
(declare-datatypes ((ListLongMap!15025 0))(
  ( (ListLongMap!15026 (toList!7528 List!23640)) )
))
(declare-fun lt!486037 () ListLongMap!15025)

(declare-fun zeroValue!831 () V!40737)

(declare-fun getCurrentListMap!4285 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1090584 (= lt!486037 (getCurrentListMap!4285 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486033 () array!70379)

(declare-fun lt!486030 () ListLongMap!15025)

(assert (=> b!1090584 (= lt!486030 (getCurrentListMap!4285 lt!486039 lt!486033 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486042 () ListLongMap!15025)

(declare-fun lt!486031 () ListLongMap!15025)

(assert (=> b!1090584 (and (= lt!486042 lt!486031) (= lt!486031 lt!486042))))

(declare-fun lt!486032 () ListLongMap!15025)

(declare-fun -!838 (ListLongMap!15025 (_ BitVec 64)) ListLongMap!15025)

(assert (=> b!1090584 (= lt!486031 (-!838 lt!486032 k0!904))))

(declare-datatypes ((Unit!35843 0))(
  ( (Unit!35844) )
))
(declare-fun lt!486034 () Unit!35843)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!114 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35843)

(assert (=> b!1090584 (= lt!486034 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!114 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4090 (array!70377 array!70379 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1090584 (= lt!486042 (getCurrentListMapNoExtraKeys!4090 lt!486039 lt!486033 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2211 (Int (_ BitVec 64)) V!40737)

(assert (=> b!1090584 (= lt!486033 (array!70380 (store (arr!33857 _values!874) i!650 (ValueCellFull!12644 (dynLambda!2211 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34394 _values!874)))))

(assert (=> b!1090584 (= lt!486032 (getCurrentListMapNoExtraKeys!4090 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090584 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486035 () Unit!35843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70377 (_ BitVec 64) (_ BitVec 32)) Unit!35843)

(assert (=> b!1090584 (= lt!486035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090585 () Bool)

(assert (=> b!1090585 (= e!623004 e!623003)))

(declare-fun res!727079 () Bool)

(assert (=> b!1090585 (=> (not res!727079) (not e!623003))))

(assert (=> b!1090585 (= res!727079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486039 mask!1414))))

(assert (=> b!1090585 (= lt!486039 (array!70378 (store (arr!33856 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34393 _keys!1070)))))

(declare-fun b!1090586 () Bool)

(declare-fun e!623005 () Bool)

(assert (=> b!1090586 (= e!623008 e!623005)))

(declare-fun res!727089 () Bool)

(assert (=> b!1090586 (=> res!727089 e!623005)))

(assert (=> b!1090586 (= res!727089 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486040 () ListLongMap!15025)

(assert (=> b!1090586 (= lt!486030 lt!486040)))

(declare-fun lt!486041 () tuple2!17048)

(declare-fun +!3346 (ListLongMap!15025 tuple2!17048) ListLongMap!15025)

(assert (=> b!1090586 (= lt!486040 (+!3346 lt!486031 lt!486041))))

(declare-fun lt!486036 () ListLongMap!15025)

(assert (=> b!1090586 (= lt!486037 lt!486036)))

(assert (=> b!1090586 (= lt!486036 (+!3346 lt!486032 lt!486041))))

(assert (=> b!1090586 (= lt!486030 (+!3346 lt!486042 lt!486041))))

(assert (=> b!1090586 (= lt!486041 (tuple2!17049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!727086 () Bool)

(assert (=> start!96288 (=> (not res!727086) (not e!623004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96288 (= res!727086 (validMask!0 mask!1414))))

(assert (=> start!96288 e!623004))

(assert (=> start!96288 tp!79964))

(assert (=> start!96288 true))

(assert (=> start!96288 tp_is_empty!26707))

(declare-fun array_inv!26162 (array!70377) Bool)

(assert (=> start!96288 (array_inv!26162 _keys!1070)))

(declare-fun e!623009 () Bool)

(declare-fun array_inv!26163 (array!70379) Bool)

(assert (=> start!96288 (and (array_inv!26163 _values!874) e!623009)))

(declare-fun b!1090587 () Bool)

(declare-fun e!623007 () Bool)

(assert (=> b!1090587 (= e!623009 (and e!623007 mapRes!41815))))

(declare-fun condMapEmpty!41815 () Bool)

(declare-fun mapDefault!41815 () ValueCell!12644)

(assert (=> b!1090587 (= condMapEmpty!41815 (= (arr!33857 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12644)) mapDefault!41815)))))

(declare-fun b!1090588 () Bool)

(assert (=> b!1090588 (= e!623007 tp_is_empty!26707)))

(declare-fun b!1090589 () Bool)

(assert (=> b!1090589 (= e!623005 true)))

(assert (=> b!1090589 (= (-!838 lt!486036 k0!904) lt!486040)))

(declare-fun lt!486038 () Unit!35843)

(declare-fun addRemoveCommutativeForDiffKeys!76 (ListLongMap!15025 (_ BitVec 64) V!40737 (_ BitVec 64)) Unit!35843)

(assert (=> b!1090589 (= lt!486038 (addRemoveCommutativeForDiffKeys!76 lt!486032 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1090590 () Bool)

(declare-fun res!727081 () Bool)

(assert (=> b!1090590 (=> (not res!727081) (not e!623004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090590 (= res!727081 (validKeyInArray!0 k0!904))))

(assert (= (and start!96288 res!727086) b!1090579))

(assert (= (and b!1090579 res!727085) b!1090582))

(assert (= (and b!1090582 res!727084) b!1090580))

(assert (= (and b!1090580 res!727088) b!1090577))

(assert (= (and b!1090577 res!727082) b!1090590))

(assert (= (and b!1090590 res!727081) b!1090581))

(assert (= (and b!1090581 res!727080) b!1090585))

(assert (= (and b!1090585 res!727079) b!1090583))

(assert (= (and b!1090583 res!727083) b!1090584))

(assert (= (and b!1090584 (not res!727087)) b!1090586))

(assert (= (and b!1090586 (not res!727089)) b!1090589))

(assert (= (and b!1090587 condMapEmpty!41815) mapIsEmpty!41815))

(assert (= (and b!1090587 (not condMapEmpty!41815)) mapNonEmpty!41815))

(get-info :version)

(assert (= (and mapNonEmpty!41815 ((_ is ValueCellFull!12644) mapValue!41815)) b!1090578))

(assert (= (and b!1090587 ((_ is ValueCellFull!12644) mapDefault!41815)) b!1090588))

(assert (= start!96288 b!1090587))

(declare-fun b_lambda!17385 () Bool)

(assert (=> (not b_lambda!17385) (not b!1090584)))

(declare-fun t!33393 () Bool)

(declare-fun tb!7575 () Bool)

(assert (=> (and start!96288 (= defaultEntry!882 defaultEntry!882) t!33393) tb!7575))

(declare-fun result!15677 () Bool)

(assert (=> tb!7575 (= result!15677 tp_is_empty!26707)))

(assert (=> b!1090584 t!33393))

(declare-fun b_and!36097 () Bool)

(assert (= b_and!36095 (and (=> t!33393 result!15677) b_and!36097)))

(declare-fun m!1010135 () Bool)

(assert (=> b!1090583 m!1010135))

(declare-fun m!1010137 () Bool)

(assert (=> b!1090580 m!1010137))

(declare-fun m!1010139 () Bool)

(assert (=> b!1090590 m!1010139))

(declare-fun m!1010141 () Bool)

(assert (=> start!96288 m!1010141))

(declare-fun m!1010143 () Bool)

(assert (=> start!96288 m!1010143))

(declare-fun m!1010145 () Bool)

(assert (=> start!96288 m!1010145))

(declare-fun m!1010147 () Bool)

(assert (=> mapNonEmpty!41815 m!1010147))

(declare-fun m!1010149 () Bool)

(assert (=> b!1090586 m!1010149))

(declare-fun m!1010151 () Bool)

(assert (=> b!1090586 m!1010151))

(declare-fun m!1010153 () Bool)

(assert (=> b!1090586 m!1010153))

(declare-fun m!1010155 () Bool)

(assert (=> b!1090584 m!1010155))

(declare-fun m!1010157 () Bool)

(assert (=> b!1090584 m!1010157))

(declare-fun m!1010159 () Bool)

(assert (=> b!1090584 m!1010159))

(declare-fun m!1010161 () Bool)

(assert (=> b!1090584 m!1010161))

(declare-fun m!1010163 () Bool)

(assert (=> b!1090584 m!1010163))

(declare-fun m!1010165 () Bool)

(assert (=> b!1090584 m!1010165))

(declare-fun m!1010167 () Bool)

(assert (=> b!1090584 m!1010167))

(declare-fun m!1010169 () Bool)

(assert (=> b!1090584 m!1010169))

(declare-fun m!1010171 () Bool)

(assert (=> b!1090584 m!1010171))

(declare-fun m!1010173 () Bool)

(assert (=> b!1090584 m!1010173))

(declare-fun m!1010175 () Bool)

(assert (=> b!1090585 m!1010175))

(declare-fun m!1010177 () Bool)

(assert (=> b!1090585 m!1010177))

(declare-fun m!1010179 () Bool)

(assert (=> b!1090589 m!1010179))

(declare-fun m!1010181 () Bool)

(assert (=> b!1090589 m!1010181))

(declare-fun m!1010183 () Bool)

(assert (=> b!1090581 m!1010183))

(declare-fun m!1010185 () Bool)

(assert (=> b!1090582 m!1010185))

(check-sat b_and!36097 (not b_lambda!17385) (not b!1090589) (not b!1090584) (not mapNonEmpty!41815) (not start!96288) (not b!1090590) (not b_next!22705) (not b!1090585) tp_is_empty!26707 (not b!1090583) (not b!1090586) (not b!1090582) (not b!1090580))
(check-sat b_and!36097 (not b_next!22705))
