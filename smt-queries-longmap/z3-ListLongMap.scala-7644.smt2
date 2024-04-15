; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96178 () Bool)

(assert start!96178)

(declare-fun b_free!22837 () Bool)

(declare-fun b_next!22837 () Bool)

(assert (=> start!96178 (= b_free!22837 (not b_next!22837))))

(declare-fun tp!80360 () Bool)

(declare-fun b_and!36323 () Bool)

(assert (=> start!96178 (= tp!80360 b_and!36323)))

(declare-fun b!1092010 () Bool)

(declare-fun res!728681 () Bool)

(declare-fun e!623641 () Bool)

(assert (=> b!1092010 (=> (not res!728681) (not e!623641))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70512 0))(
  ( (array!70513 (arr!33930 (Array (_ BitVec 32) (_ BitVec 64))) (size!34468 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70512)

(declare-datatypes ((V!40913 0))(
  ( (V!40914 (val!13476 Int)) )
))
(declare-datatypes ((ValueCell!12710 0))(
  ( (ValueCellFull!12710 (v!16096 V!40913)) (EmptyCell!12710) )
))
(declare-datatypes ((array!70514 0))(
  ( (array!70515 (arr!33931 (Array (_ BitVec 32) ValueCell!12710)) (size!34469 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70514)

(assert (=> b!1092010 (= res!728681 (and (= (size!34469 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34468 _keys!1070) (size!34469 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092011 () Bool)

(declare-fun res!728683 () Bool)

(assert (=> b!1092011 (=> (not res!728683) (not e!623641))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092011 (= res!728683 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34468 _keys!1070))))))

(declare-fun b!1092012 () Bool)

(declare-fun res!728679 () Bool)

(assert (=> b!1092012 (=> (not res!728679) (not e!623641))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092012 (= res!728679 (validKeyInArray!0 k0!904))))

(declare-fun b!1092013 () Bool)

(declare-fun res!728680 () Bool)

(assert (=> b!1092013 (=> (not res!728680) (not e!623641))))

(declare-datatypes ((List!23760 0))(
  ( (Nil!23757) (Cons!23756 (h!24965 (_ BitVec 64)) (t!33646 List!23760)) )
))
(declare-fun arrayNoDuplicates!0 (array!70512 (_ BitVec 32) List!23760) Bool)

(assert (=> b!1092013 (= res!728680 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23757))))

(declare-fun b!1092014 () Bool)

(declare-fun e!623639 () Bool)

(assert (=> b!1092014 (= e!623641 e!623639)))

(declare-fun res!728676 () Bool)

(assert (=> b!1092014 (=> (not res!728676) (not e!623639))))

(declare-fun lt!487873 () array!70512)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70512 (_ BitVec 32)) Bool)

(assert (=> b!1092014 (= res!728676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487873 mask!1414))))

(assert (=> b!1092014 (= lt!487873 (array!70513 (store (arr!33930 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34468 _keys!1070)))))

(declare-fun mapIsEmpty!42013 () Bool)

(declare-fun mapRes!42013 () Bool)

(assert (=> mapIsEmpty!42013 mapRes!42013))

(declare-fun b!1092016 () Bool)

(declare-fun e!623645 () Bool)

(declare-fun e!623642 () Bool)

(assert (=> b!1092016 (= e!623645 e!623642)))

(declare-fun res!728675 () Bool)

(assert (=> b!1092016 (=> res!728675 e!623642)))

(assert (=> b!1092016 (= res!728675 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17198 0))(
  ( (tuple2!17199 (_1!8610 (_ BitVec 64)) (_2!8610 V!40913)) )
))
(declare-datatypes ((List!23761 0))(
  ( (Nil!23758) (Cons!23757 (h!24966 tuple2!17198) (t!33647 List!23761)) )
))
(declare-datatypes ((ListLongMap!15167 0))(
  ( (ListLongMap!15168 (toList!7599 List!23761)) )
))
(declare-fun lt!487868 () ListLongMap!15167)

(declare-fun lt!487864 () ListLongMap!15167)

(assert (=> b!1092016 (= lt!487868 lt!487864)))

(declare-fun lt!487872 () ListLongMap!15167)

(declare-fun lt!487874 () tuple2!17198)

(declare-fun +!3385 (ListLongMap!15167 tuple2!17198) ListLongMap!15167)

(assert (=> b!1092016 (= lt!487864 (+!3385 lt!487872 lt!487874))))

(declare-fun lt!487870 () ListLongMap!15167)

(declare-fun lt!487862 () ListLongMap!15167)

(assert (=> b!1092016 (= lt!487870 lt!487862)))

(declare-fun lt!487867 () ListLongMap!15167)

(assert (=> b!1092016 (= lt!487862 (+!3385 lt!487867 lt!487874))))

(declare-fun lt!487863 () ListLongMap!15167)

(assert (=> b!1092016 (= lt!487870 (+!3385 lt!487863 lt!487874))))

(declare-fun minValue!831 () V!40913)

(assert (=> b!1092016 (= lt!487874 (tuple2!17199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092017 () Bool)

(declare-fun e!623638 () Bool)

(declare-fun e!623644 () Bool)

(assert (=> b!1092017 (= e!623638 (and e!623644 mapRes!42013))))

(declare-fun condMapEmpty!42013 () Bool)

(declare-fun mapDefault!42013 () ValueCell!12710)

(assert (=> b!1092017 (= condMapEmpty!42013 (= (arr!33931 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12710)) mapDefault!42013)))))

(declare-fun b!1092018 () Bool)

(declare-fun res!728684 () Bool)

(assert (=> b!1092018 (=> (not res!728684) (not e!623641))))

(assert (=> b!1092018 (= res!728684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092019 () Bool)

(assert (=> b!1092019 (= e!623642 (bvsle #b00000000000000000000000000000000 (size!34468 _keys!1070)))))

(declare-fun -!871 (ListLongMap!15167 (_ BitVec 64)) ListLongMap!15167)

(assert (=> b!1092019 (= (-!871 lt!487864 k0!904) lt!487862)))

(declare-datatypes ((Unit!35777 0))(
  ( (Unit!35778) )
))
(declare-fun lt!487866 () Unit!35777)

(declare-fun addRemoveCommutativeForDiffKeys!114 (ListLongMap!15167 (_ BitVec 64) V!40913 (_ BitVec 64)) Unit!35777)

(assert (=> b!1092019 (= lt!487866 (addRemoveCommutativeForDiffKeys!114 lt!487872 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!728677 () Bool)

(assert (=> start!96178 (=> (not res!728677) (not e!623641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96178 (= res!728677 (validMask!0 mask!1414))))

(assert (=> start!96178 e!623641))

(assert (=> start!96178 tp!80360))

(assert (=> start!96178 true))

(declare-fun tp_is_empty!26839 () Bool)

(assert (=> start!96178 tp_is_empty!26839))

(declare-fun array_inv!26196 (array!70512) Bool)

(assert (=> start!96178 (array_inv!26196 _keys!1070)))

(declare-fun array_inv!26197 (array!70514) Bool)

(assert (=> start!96178 (and (array_inv!26197 _values!874) e!623638)))

(declare-fun b!1092015 () Bool)

(declare-fun res!728685 () Bool)

(assert (=> b!1092015 (=> (not res!728685) (not e!623641))))

(assert (=> b!1092015 (= res!728685 (= (select (arr!33930 _keys!1070) i!650) k0!904))))

(declare-fun b!1092020 () Bool)

(assert (=> b!1092020 (= e!623644 tp_is_empty!26839)))

(declare-fun b!1092021 () Bool)

(assert (=> b!1092021 (= e!623639 (not e!623645))))

(declare-fun res!728678 () Bool)

(assert (=> b!1092021 (=> res!728678 e!623645)))

(assert (=> b!1092021 (= res!728678 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40913)

(declare-fun getCurrentListMap!4262 (array!70512 array!70514 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1092021 (= lt!487868 (getCurrentListMap!4262 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487869 () array!70514)

(assert (=> b!1092021 (= lt!487870 (getCurrentListMap!4262 lt!487873 lt!487869 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092021 (and (= lt!487863 lt!487867) (= lt!487867 lt!487863))))

(assert (=> b!1092021 (= lt!487867 (-!871 lt!487872 k0!904))))

(declare-fun lt!487871 () Unit!35777)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!146 (array!70512 array!70514 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35777)

(assert (=> b!1092021 (= lt!487871 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!146 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4132 (array!70512 array!70514 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1092021 (= lt!487863 (getCurrentListMapNoExtraKeys!4132 lt!487873 lt!487869 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2203 (Int (_ BitVec 64)) V!40913)

(assert (=> b!1092021 (= lt!487869 (array!70515 (store (arr!33931 _values!874) i!650 (ValueCellFull!12710 (dynLambda!2203 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34469 _values!874)))))

(assert (=> b!1092021 (= lt!487872 (getCurrentListMapNoExtraKeys!4132 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092021 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487865 () Unit!35777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70512 (_ BitVec 64) (_ BitVec 32)) Unit!35777)

(assert (=> b!1092021 (= lt!487865 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092022 () Bool)

(declare-fun e!623640 () Bool)

(assert (=> b!1092022 (= e!623640 tp_is_empty!26839)))

(declare-fun b!1092023 () Bool)

(declare-fun res!728682 () Bool)

(assert (=> b!1092023 (=> (not res!728682) (not e!623639))))

(assert (=> b!1092023 (= res!728682 (arrayNoDuplicates!0 lt!487873 #b00000000000000000000000000000000 Nil!23757))))

(declare-fun mapNonEmpty!42013 () Bool)

(declare-fun tp!80359 () Bool)

(assert (=> mapNonEmpty!42013 (= mapRes!42013 (and tp!80359 e!623640))))

(declare-fun mapValue!42013 () ValueCell!12710)

(declare-fun mapKey!42013 () (_ BitVec 32))

(declare-fun mapRest!42013 () (Array (_ BitVec 32) ValueCell!12710))

(assert (=> mapNonEmpty!42013 (= (arr!33931 _values!874) (store mapRest!42013 mapKey!42013 mapValue!42013))))

(assert (= (and start!96178 res!728677) b!1092010))

(assert (= (and b!1092010 res!728681) b!1092018))

(assert (= (and b!1092018 res!728684) b!1092013))

(assert (= (and b!1092013 res!728680) b!1092011))

(assert (= (and b!1092011 res!728683) b!1092012))

(assert (= (and b!1092012 res!728679) b!1092015))

(assert (= (and b!1092015 res!728685) b!1092014))

(assert (= (and b!1092014 res!728676) b!1092023))

(assert (= (and b!1092023 res!728682) b!1092021))

(assert (= (and b!1092021 (not res!728678)) b!1092016))

(assert (= (and b!1092016 (not res!728675)) b!1092019))

(assert (= (and b!1092017 condMapEmpty!42013) mapIsEmpty!42013))

(assert (= (and b!1092017 (not condMapEmpty!42013)) mapNonEmpty!42013))

(get-info :version)

(assert (= (and mapNonEmpty!42013 ((_ is ValueCellFull!12710) mapValue!42013)) b!1092022))

(assert (= (and b!1092017 ((_ is ValueCellFull!12710) mapDefault!42013)) b!1092020))

(assert (= start!96178 b!1092017))

(declare-fun b_lambda!17485 () Bool)

(assert (=> (not b_lambda!17485) (not b!1092021)))

(declare-fun t!33645 () Bool)

(declare-fun tb!7707 () Bool)

(assert (=> (and start!96178 (= defaultEntry!882 defaultEntry!882) t!33645) tb!7707))

(declare-fun result!15941 () Bool)

(assert (=> tb!7707 (= result!15941 tp_is_empty!26839)))

(assert (=> b!1092021 t!33645))

(declare-fun b_and!36325 () Bool)

(assert (= b_and!36323 (and (=> t!33645 result!15941) b_and!36325)))

(declare-fun m!1011257 () Bool)

(assert (=> b!1092016 m!1011257))

(declare-fun m!1011259 () Bool)

(assert (=> b!1092016 m!1011259))

(declare-fun m!1011261 () Bool)

(assert (=> b!1092016 m!1011261))

(declare-fun m!1011263 () Bool)

(assert (=> b!1092013 m!1011263))

(declare-fun m!1011265 () Bool)

(assert (=> start!96178 m!1011265))

(declare-fun m!1011267 () Bool)

(assert (=> start!96178 m!1011267))

(declare-fun m!1011269 () Bool)

(assert (=> start!96178 m!1011269))

(declare-fun m!1011271 () Bool)

(assert (=> b!1092012 m!1011271))

(declare-fun m!1011273 () Bool)

(assert (=> mapNonEmpty!42013 m!1011273))

(declare-fun m!1011275 () Bool)

(assert (=> b!1092019 m!1011275))

(declare-fun m!1011277 () Bool)

(assert (=> b!1092019 m!1011277))

(declare-fun m!1011279 () Bool)

(assert (=> b!1092018 m!1011279))

(declare-fun m!1011281 () Bool)

(assert (=> b!1092023 m!1011281))

(declare-fun m!1011283 () Bool)

(assert (=> b!1092014 m!1011283))

(declare-fun m!1011285 () Bool)

(assert (=> b!1092014 m!1011285))

(declare-fun m!1011287 () Bool)

(assert (=> b!1092021 m!1011287))

(declare-fun m!1011289 () Bool)

(assert (=> b!1092021 m!1011289))

(declare-fun m!1011291 () Bool)

(assert (=> b!1092021 m!1011291))

(declare-fun m!1011293 () Bool)

(assert (=> b!1092021 m!1011293))

(declare-fun m!1011295 () Bool)

(assert (=> b!1092021 m!1011295))

(declare-fun m!1011297 () Bool)

(assert (=> b!1092021 m!1011297))

(declare-fun m!1011299 () Bool)

(assert (=> b!1092021 m!1011299))

(declare-fun m!1011301 () Bool)

(assert (=> b!1092021 m!1011301))

(declare-fun m!1011303 () Bool)

(assert (=> b!1092021 m!1011303))

(declare-fun m!1011305 () Bool)

(assert (=> b!1092021 m!1011305))

(declare-fun m!1011307 () Bool)

(assert (=> b!1092015 m!1011307))

(check-sat b_and!36325 (not b_next!22837) (not b_lambda!17485) (not b!1092012) (not b!1092021) (not b!1092016) tp_is_empty!26839 (not b!1092019) (not b!1092013) (not b!1092023) (not b!1092014) (not b!1092018) (not start!96178) (not mapNonEmpty!42013))
(check-sat b_and!36325 (not b_next!22837))
