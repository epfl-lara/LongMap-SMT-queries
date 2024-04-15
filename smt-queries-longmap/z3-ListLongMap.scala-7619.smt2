; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96028 () Bool)

(assert start!96028)

(declare-fun b_free!22687 () Bool)

(declare-fun b_next!22687 () Bool)

(assert (=> start!96028 (= b_free!22687 (not b_next!22687))))

(declare-fun tp!79909 () Bool)

(declare-fun b_and!36023 () Bool)

(assert (=> start!96028 (= tp!79909 b_and!36023)))

(declare-fun b!1088701 () Bool)

(declare-fun res!726197 () Bool)

(declare-fun e!621843 () Bool)

(assert (=> b!1088701 (=> (not res!726197) (not e!621843))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70224 0))(
  ( (array!70225 (arr!33786 (Array (_ BitVec 32) (_ BitVec 64))) (size!34324 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70224)

(assert (=> b!1088701 (= res!726197 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34324 _keys!1070))))))

(declare-fun b!1088702 () Bool)

(declare-fun e!621841 () Bool)

(declare-fun e!621839 () Bool)

(assert (=> b!1088702 (= e!621841 e!621839)))

(declare-fun res!726192 () Bool)

(assert (=> b!1088702 (=> res!726192 e!621839)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088702 (= res!726192 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40713 0))(
  ( (V!40714 (val!13401 Int)) )
))
(declare-datatypes ((tuple2!17072 0))(
  ( (tuple2!17073 (_1!8547 (_ BitVec 64)) (_2!8547 V!40713)) )
))
(declare-datatypes ((List!23640 0))(
  ( (Nil!23637) (Cons!23636 (h!24845 tuple2!17072) (t!33376 List!23640)) )
))
(declare-datatypes ((ListLongMap!15041 0))(
  ( (ListLongMap!15042 (toList!7536 List!23640)) )
))
(declare-fun lt!484972 () ListLongMap!15041)

(declare-fun lt!484969 () ListLongMap!15041)

(assert (=> b!1088702 (= lt!484972 lt!484969)))

(declare-fun lt!484973 () ListLongMap!15041)

(declare-fun lt!484964 () tuple2!17072)

(declare-fun +!3337 (ListLongMap!15041 tuple2!17072) ListLongMap!15041)

(assert (=> b!1088702 (= lt!484969 (+!3337 lt!484973 lt!484964))))

(declare-fun lt!484971 () ListLongMap!15041)

(declare-fun lt!484975 () ListLongMap!15041)

(assert (=> b!1088702 (= lt!484971 lt!484975)))

(declare-fun lt!484974 () ListLongMap!15041)

(assert (=> b!1088702 (= lt!484975 (+!3337 lt!484974 lt!484964))))

(declare-fun lt!484965 () ListLongMap!15041)

(assert (=> b!1088702 (= lt!484972 (+!3337 lt!484965 lt!484964))))

(declare-fun zeroValue!831 () V!40713)

(assert (=> b!1088702 (= lt!484964 (tuple2!17073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!726195 () Bool)

(assert (=> start!96028 (=> (not res!726195) (not e!621843))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96028 (= res!726195 (validMask!0 mask!1414))))

(assert (=> start!96028 e!621843))

(assert (=> start!96028 tp!79909))

(assert (=> start!96028 true))

(declare-fun tp_is_empty!26689 () Bool)

(assert (=> start!96028 tp_is_empty!26689))

(declare-fun array_inv!26102 (array!70224) Bool)

(assert (=> start!96028 (array_inv!26102 _keys!1070)))

(declare-datatypes ((ValueCell!12635 0))(
  ( (ValueCellFull!12635 (v!16021 V!40713)) (EmptyCell!12635) )
))
(declare-datatypes ((array!70226 0))(
  ( (array!70227 (arr!33787 (Array (_ BitVec 32) ValueCell!12635)) (size!34325 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70226)

(declare-fun e!621844 () Bool)

(declare-fun array_inv!26103 (array!70226) Bool)

(assert (=> start!96028 (and (array_inv!26103 _values!874) e!621844)))

(declare-fun b!1088703 () Bool)

(declare-fun res!726201 () Bool)

(assert (=> b!1088703 (=> (not res!726201) (not e!621843))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088703 (= res!726201 (and (= (size!34325 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34324 _keys!1070) (size!34325 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41788 () Bool)

(declare-fun mapRes!41788 () Bool)

(declare-fun tp!79910 () Bool)

(declare-fun e!621838 () Bool)

(assert (=> mapNonEmpty!41788 (= mapRes!41788 (and tp!79910 e!621838))))

(declare-fun mapKey!41788 () (_ BitVec 32))

(declare-fun mapRest!41788 () (Array (_ BitVec 32) ValueCell!12635))

(declare-fun mapValue!41788 () ValueCell!12635)

(assert (=> mapNonEmpty!41788 (= (arr!33787 _values!874) (store mapRest!41788 mapKey!41788 mapValue!41788))))

(declare-fun mapIsEmpty!41788 () Bool)

(assert (=> mapIsEmpty!41788 mapRes!41788))

(declare-fun b!1088704 () Bool)

(declare-fun res!726199 () Bool)

(assert (=> b!1088704 (=> (not res!726199) (not e!621843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088704 (= res!726199 (validKeyInArray!0 k0!904))))

(declare-fun b!1088705 () Bool)

(declare-fun res!726194 () Bool)

(declare-fun e!621845 () Bool)

(assert (=> b!1088705 (=> (not res!726194) (not e!621845))))

(declare-fun lt!484966 () array!70224)

(declare-datatypes ((List!23641 0))(
  ( (Nil!23638) (Cons!23637 (h!24846 (_ BitVec 64)) (t!33377 List!23641)) )
))
(declare-fun arrayNoDuplicates!0 (array!70224 (_ BitVec 32) List!23641) Bool)

(assert (=> b!1088705 (= res!726194 (arrayNoDuplicates!0 lt!484966 #b00000000000000000000000000000000 Nil!23638))))

(declare-fun b!1088706 () Bool)

(declare-fun res!726191 () Bool)

(assert (=> b!1088706 (=> (not res!726191) (not e!621843))))

(assert (=> b!1088706 (= res!726191 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23638))))

(declare-fun b!1088707 () Bool)

(declare-fun res!726198 () Bool)

(assert (=> b!1088707 (=> (not res!726198) (not e!621843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70224 (_ BitVec 32)) Bool)

(assert (=> b!1088707 (= res!726198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088708 () Bool)

(assert (=> b!1088708 (= e!621839 true)))

(declare-fun -!814 (ListLongMap!15041 (_ BitVec 64)) ListLongMap!15041)

(assert (=> b!1088708 (= (-!814 lt!484975 k0!904) lt!484969)))

(declare-datatypes ((Unit!35663 0))(
  ( (Unit!35664) )
))
(declare-fun lt!484967 () Unit!35663)

(declare-fun addRemoveCommutativeForDiffKeys!65 (ListLongMap!15041 (_ BitVec 64) V!40713 (_ BitVec 64)) Unit!35663)

(assert (=> b!1088708 (= lt!484967 (addRemoveCommutativeForDiffKeys!65 lt!484974 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088709 () Bool)

(assert (=> b!1088709 (= e!621838 tp_is_empty!26689)))

(declare-fun b!1088710 () Bool)

(declare-fun res!726193 () Bool)

(assert (=> b!1088710 (=> (not res!726193) (not e!621843))))

(assert (=> b!1088710 (= res!726193 (= (select (arr!33786 _keys!1070) i!650) k0!904))))

(declare-fun b!1088711 () Bool)

(assert (=> b!1088711 (= e!621843 e!621845)))

(declare-fun res!726200 () Bool)

(assert (=> b!1088711 (=> (not res!726200) (not e!621845))))

(assert (=> b!1088711 (= res!726200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484966 mask!1414))))

(assert (=> b!1088711 (= lt!484966 (array!70225 (store (arr!33786 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34324 _keys!1070)))))

(declare-fun b!1088712 () Bool)

(declare-fun e!621842 () Bool)

(assert (=> b!1088712 (= e!621844 (and e!621842 mapRes!41788))))

(declare-fun condMapEmpty!41788 () Bool)

(declare-fun mapDefault!41788 () ValueCell!12635)

(assert (=> b!1088712 (= condMapEmpty!41788 (= (arr!33787 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12635)) mapDefault!41788)))))

(declare-fun b!1088713 () Bool)

(assert (=> b!1088713 (= e!621845 (not e!621841))))

(declare-fun res!726196 () Bool)

(assert (=> b!1088713 (=> res!726196 e!621841)))

(assert (=> b!1088713 (= res!726196 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40713)

(declare-fun getCurrentListMap!4216 (array!70224 array!70226 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!15041)

(assert (=> b!1088713 (= lt!484971 (getCurrentListMap!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484968 () array!70226)

(assert (=> b!1088713 (= lt!484972 (getCurrentListMap!4216 lt!484966 lt!484968 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088713 (and (= lt!484965 lt!484973) (= lt!484973 lt!484965))))

(assert (=> b!1088713 (= lt!484973 (-!814 lt!484974 k0!904))))

(declare-fun lt!484976 () Unit!35663)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 (array!70224 array!70226 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35663)

(assert (=> b!1088713 (= lt!484976 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4086 (array!70224 array!70226 (_ BitVec 32) (_ BitVec 32) V!40713 V!40713 (_ BitVec 32) Int) ListLongMap!15041)

(assert (=> b!1088713 (= lt!484965 (getCurrentListMapNoExtraKeys!4086 lt!484966 lt!484968 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2157 (Int (_ BitVec 64)) V!40713)

(assert (=> b!1088713 (= lt!484968 (array!70227 (store (arr!33787 _values!874) i!650 (ValueCellFull!12635 (dynLambda!2157 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34325 _values!874)))))

(assert (=> b!1088713 (= lt!484974 (getCurrentListMapNoExtraKeys!4086 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088713 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484970 () Unit!35663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70224 (_ BitVec 64) (_ BitVec 32)) Unit!35663)

(assert (=> b!1088713 (= lt!484970 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088714 () Bool)

(assert (=> b!1088714 (= e!621842 tp_is_empty!26689)))

(assert (= (and start!96028 res!726195) b!1088703))

(assert (= (and b!1088703 res!726201) b!1088707))

(assert (= (and b!1088707 res!726198) b!1088706))

(assert (= (and b!1088706 res!726191) b!1088701))

(assert (= (and b!1088701 res!726197) b!1088704))

(assert (= (and b!1088704 res!726199) b!1088710))

(assert (= (and b!1088710 res!726193) b!1088711))

(assert (= (and b!1088711 res!726200) b!1088705))

(assert (= (and b!1088705 res!726194) b!1088713))

(assert (= (and b!1088713 (not res!726196)) b!1088702))

(assert (= (and b!1088702 (not res!726192)) b!1088708))

(assert (= (and b!1088712 condMapEmpty!41788) mapIsEmpty!41788))

(assert (= (and b!1088712 (not condMapEmpty!41788)) mapNonEmpty!41788))

(get-info :version)

(assert (= (and mapNonEmpty!41788 ((_ is ValueCellFull!12635) mapValue!41788)) b!1088709))

(assert (= (and b!1088712 ((_ is ValueCellFull!12635) mapDefault!41788)) b!1088714))

(assert (= start!96028 b!1088712))

(declare-fun b_lambda!17335 () Bool)

(assert (=> (not b_lambda!17335) (not b!1088713)))

(declare-fun t!33375 () Bool)

(declare-fun tb!7557 () Bool)

(assert (=> (and start!96028 (= defaultEntry!882 defaultEntry!882) t!33375) tb!7557))

(declare-fun result!15641 () Bool)

(assert (=> tb!7557 (= result!15641 tp_is_empty!26689)))

(assert (=> b!1088713 t!33375))

(declare-fun b_and!36025 () Bool)

(assert (= b_and!36023 (and (=> t!33375 result!15641) b_and!36025)))

(declare-fun m!1007369 () Bool)

(assert (=> b!1088706 m!1007369))

(declare-fun m!1007371 () Bool)

(assert (=> b!1088713 m!1007371))

(declare-fun m!1007373 () Bool)

(assert (=> b!1088713 m!1007373))

(declare-fun m!1007375 () Bool)

(assert (=> b!1088713 m!1007375))

(declare-fun m!1007377 () Bool)

(assert (=> b!1088713 m!1007377))

(declare-fun m!1007379 () Bool)

(assert (=> b!1088713 m!1007379))

(declare-fun m!1007381 () Bool)

(assert (=> b!1088713 m!1007381))

(declare-fun m!1007383 () Bool)

(assert (=> b!1088713 m!1007383))

(declare-fun m!1007385 () Bool)

(assert (=> b!1088713 m!1007385))

(declare-fun m!1007387 () Bool)

(assert (=> b!1088713 m!1007387))

(declare-fun m!1007389 () Bool)

(assert (=> b!1088713 m!1007389))

(declare-fun m!1007391 () Bool)

(assert (=> b!1088704 m!1007391))

(declare-fun m!1007393 () Bool)

(assert (=> b!1088705 m!1007393))

(declare-fun m!1007395 () Bool)

(assert (=> b!1088708 m!1007395))

(declare-fun m!1007397 () Bool)

(assert (=> b!1088708 m!1007397))

(declare-fun m!1007399 () Bool)

(assert (=> b!1088710 m!1007399))

(declare-fun m!1007401 () Bool)

(assert (=> mapNonEmpty!41788 m!1007401))

(declare-fun m!1007403 () Bool)

(assert (=> start!96028 m!1007403))

(declare-fun m!1007405 () Bool)

(assert (=> start!96028 m!1007405))

(declare-fun m!1007407 () Bool)

(assert (=> start!96028 m!1007407))

(declare-fun m!1007409 () Bool)

(assert (=> b!1088702 m!1007409))

(declare-fun m!1007411 () Bool)

(assert (=> b!1088702 m!1007411))

(declare-fun m!1007413 () Bool)

(assert (=> b!1088702 m!1007413))

(declare-fun m!1007415 () Bool)

(assert (=> b!1088711 m!1007415))

(declare-fun m!1007417 () Bool)

(assert (=> b!1088711 m!1007417))

(declare-fun m!1007419 () Bool)

(assert (=> b!1088707 m!1007419))

(check-sat (not b!1088705) (not b!1088708) (not b!1088711) b_and!36025 (not start!96028) (not b_lambda!17335) (not b!1088706) (not b!1088704) (not b!1088713) (not b!1088707) (not b_next!22687) (not b!1088702) tp_is_empty!26689 (not mapNonEmpty!41788))
(check-sat b_and!36025 (not b_next!22687))
