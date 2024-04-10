; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96590 () Bool)

(assert start!96590)

(declare-fun b_free!23091 () Bool)

(declare-fun b_next!23091 () Bool)

(assert (=> start!96590 (= b_free!23091 (not b_next!23091))))

(declare-fun tp!81208 () Bool)

(declare-fun b_and!36887 () Bool)

(assert (=> start!96590 (= tp!81208 b_and!36887)))

(declare-fun b!1098491 () Bool)

(declare-fun res!733094 () Bool)

(declare-fun e!626966 () Bool)

(assert (=> b!1098491 (=> (not res!733094) (not e!626966))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71195 0))(
  ( (array!71196 (arr!34266 (Array (_ BitVec 32) (_ BitVec 64))) (size!34802 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71195)

(assert (=> b!1098491 (= res!733094 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34802 _keys!1070))))))

(declare-fun b!1098492 () Bool)

(declare-fun e!626967 () Bool)

(assert (=> b!1098492 (= e!626966 e!626967)))

(declare-fun res!733101 () Bool)

(assert (=> b!1098492 (=> (not res!733101) (not e!626967))))

(declare-fun lt!491404 () array!71195)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71195 (_ BitVec 32)) Bool)

(assert (=> b!1098492 (= res!733101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491404 mask!1414))))

(assert (=> b!1098492 (= lt!491404 (array!71196 (store (arr!34266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34802 _keys!1070)))))

(declare-fun b!1098493 () Bool)

(declare-fun res!733099 () Bool)

(assert (=> b!1098493 (=> (not res!733099) (not e!626967))))

(declare-datatypes ((List!23929 0))(
  ( (Nil!23926) (Cons!23925 (h!25134 (_ BitVec 64)) (t!34066 List!23929)) )
))
(declare-fun arrayNoDuplicates!0 (array!71195 (_ BitVec 32) List!23929) Bool)

(assert (=> b!1098493 (= res!733099 (arrayNoDuplicates!0 lt!491404 #b00000000000000000000000000000000 Nil!23926))))

(declare-fun b!1098494 () Bool)

(declare-fun res!733102 () Bool)

(assert (=> b!1098494 (=> (not res!733102) (not e!626966))))

(assert (=> b!1098494 (= res!733102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098495 () Bool)

(declare-fun res!733100 () Bool)

(assert (=> b!1098495 (=> (not res!733100) (not e!626966))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098495 (= res!733100 (validKeyInArray!0 k0!904))))

(declare-fun res!733097 () Bool)

(assert (=> start!96590 (=> (not res!733097) (not e!626966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96590 (= res!733097 (validMask!0 mask!1414))))

(assert (=> start!96590 e!626966))

(assert (=> start!96590 tp!81208))

(assert (=> start!96590 true))

(declare-fun tp_is_empty!27141 () Bool)

(assert (=> start!96590 tp_is_empty!27141))

(declare-fun array_inv!26398 (array!71195) Bool)

(assert (=> start!96590 (array_inv!26398 _keys!1070)))

(declare-datatypes ((V!41315 0))(
  ( (V!41316 (val!13627 Int)) )
))
(declare-datatypes ((ValueCell!12861 0))(
  ( (ValueCellFull!12861 (v!16251 V!41315)) (EmptyCell!12861) )
))
(declare-datatypes ((array!71197 0))(
  ( (array!71198 (arr!34267 (Array (_ BitVec 32) ValueCell!12861)) (size!34803 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71197)

(declare-fun e!626970 () Bool)

(declare-fun array_inv!26399 (array!71197) Bool)

(assert (=> start!96590 (and (array_inv!26399 _values!874) e!626970)))

(declare-fun b!1098496 () Bool)

(declare-fun res!733096 () Bool)

(assert (=> b!1098496 (=> (not res!733096) (not e!626966))))

(assert (=> b!1098496 (= res!733096 (= (select (arr!34266 _keys!1070) i!650) k0!904))))

(declare-fun b!1098497 () Bool)

(declare-fun e!626969 () Bool)

(declare-fun mapRes!42481 () Bool)

(assert (=> b!1098497 (= e!626970 (and e!626969 mapRes!42481))))

(declare-fun condMapEmpty!42481 () Bool)

(declare-fun mapDefault!42481 () ValueCell!12861)

(assert (=> b!1098497 (= condMapEmpty!42481 (= (arr!34267 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12861)) mapDefault!42481)))))

(declare-fun b!1098498 () Bool)

(declare-fun e!626965 () Bool)

(assert (=> b!1098498 (= e!626965 tp_is_empty!27141)))

(declare-fun b!1098499 () Bool)

(declare-fun e!626971 () Bool)

(assert (=> b!1098499 (= e!626971 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(declare-datatypes ((tuple2!17308 0))(
  ( (tuple2!17309 (_1!8665 (_ BitVec 64)) (_2!8665 V!41315)) )
))
(declare-datatypes ((List!23930 0))(
  ( (Nil!23927) (Cons!23926 (h!25135 tuple2!17308) (t!34067 List!23930)) )
))
(declare-datatypes ((ListLongMap!15277 0))(
  ( (ListLongMap!15278 (toList!7654 List!23930)) )
))
(declare-fun lt!491409 () ListLongMap!15277)

(declare-fun lt!491413 () ListLongMap!15277)

(declare-fun -!943 (ListLongMap!15277 (_ BitVec 64)) ListLongMap!15277)

(assert (=> b!1098499 (= (-!943 lt!491409 k0!904) lt!491413)))

(declare-datatypes ((Unit!36124 0))(
  ( (Unit!36125) )
))
(declare-fun lt!491410 () Unit!36124)

(declare-fun lt!491405 () ListLongMap!15277)

(declare-fun zeroValue!831 () V!41315)

(declare-fun addRemoveCommutativeForDiffKeys!115 (ListLongMap!15277 (_ BitVec 64) V!41315 (_ BitVec 64)) Unit!36124)

(assert (=> b!1098499 (= lt!491410 (addRemoveCommutativeForDiffKeys!115 lt!491405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!491411 () ListLongMap!15277)

(declare-fun lt!491416 () tuple2!17308)

(declare-fun +!3363 (ListLongMap!15277 tuple2!17308) ListLongMap!15277)

(assert (=> b!1098499 (= lt!491411 (+!3363 lt!491413 lt!491416))))

(declare-fun lt!491408 () ListLongMap!15277)

(declare-fun lt!491415 () tuple2!17308)

(assert (=> b!1098499 (= lt!491413 (+!3363 lt!491408 lt!491415))))

(declare-fun lt!491414 () ListLongMap!15277)

(assert (=> b!1098499 (= lt!491414 (+!3363 lt!491409 lt!491416))))

(assert (=> b!1098499 (= lt!491409 (+!3363 lt!491405 lt!491415))))

(declare-fun lt!491403 () ListLongMap!15277)

(assert (=> b!1098499 (= lt!491411 (+!3363 (+!3363 lt!491403 lt!491415) lt!491416))))

(declare-fun minValue!831 () V!41315)

(assert (=> b!1098499 (= lt!491416 (tuple2!17309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098499 (= lt!491415 (tuple2!17309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098500 () Bool)

(declare-fun res!733095 () Bool)

(assert (=> b!1098500 (=> (not res!733095) (not e!626966))))

(assert (=> b!1098500 (= res!733095 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23926))))

(declare-fun mapNonEmpty!42481 () Bool)

(declare-fun tp!81209 () Bool)

(assert (=> mapNonEmpty!42481 (= mapRes!42481 (and tp!81209 e!626965))))

(declare-fun mapKey!42481 () (_ BitVec 32))

(declare-fun mapValue!42481 () ValueCell!12861)

(declare-fun mapRest!42481 () (Array (_ BitVec 32) ValueCell!12861))

(assert (=> mapNonEmpty!42481 (= (arr!34267 _values!874) (store mapRest!42481 mapKey!42481 mapValue!42481))))

(declare-fun b!1098501 () Bool)

(assert (=> b!1098501 (= e!626967 (not e!626971))))

(declare-fun res!733093 () Bool)

(assert (=> b!1098501 (=> res!733093 e!626971)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098501 (= res!733093 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4373 (array!71195 array!71197 (_ BitVec 32) (_ BitVec 32) V!41315 V!41315 (_ BitVec 32) Int) ListLongMap!15277)

(assert (=> b!1098501 (= lt!491414 (getCurrentListMap!4373 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491407 () array!71197)

(assert (=> b!1098501 (= lt!491411 (getCurrentListMap!4373 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098501 (and (= lt!491403 lt!491408) (= lt!491408 lt!491403))))

(assert (=> b!1098501 (= lt!491408 (-!943 lt!491405 k0!904))))

(declare-fun lt!491406 () Unit!36124)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!199 (array!71195 array!71197 (_ BitVec 32) (_ BitVec 32) V!41315 V!41315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36124)

(assert (=> b!1098501 (= lt!491406 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4169 (array!71195 array!71197 (_ BitVec 32) (_ BitVec 32) V!41315 V!41315 (_ BitVec 32) Int) ListLongMap!15277)

(assert (=> b!1098501 (= lt!491403 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2304 (Int (_ BitVec 64)) V!41315)

(assert (=> b!1098501 (= lt!491407 (array!71198 (store (arr!34267 _values!874) i!650 (ValueCellFull!12861 (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34803 _values!874)))))

(assert (=> b!1098501 (= lt!491405 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098501 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491412 () Unit!36124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71195 (_ BitVec 64) (_ BitVec 32)) Unit!36124)

(assert (=> b!1098501 (= lt!491412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098502 () Bool)

(declare-fun res!733098 () Bool)

(assert (=> b!1098502 (=> (not res!733098) (not e!626966))))

(assert (=> b!1098502 (= res!733098 (and (= (size!34803 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34802 _keys!1070) (size!34803 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098503 () Bool)

(assert (=> b!1098503 (= e!626969 tp_is_empty!27141)))

(declare-fun mapIsEmpty!42481 () Bool)

(assert (=> mapIsEmpty!42481 mapRes!42481))

(assert (= (and start!96590 res!733097) b!1098502))

(assert (= (and b!1098502 res!733098) b!1098494))

(assert (= (and b!1098494 res!733102) b!1098500))

(assert (= (and b!1098500 res!733095) b!1098491))

(assert (= (and b!1098491 res!733094) b!1098495))

(assert (= (and b!1098495 res!733100) b!1098496))

(assert (= (and b!1098496 res!733096) b!1098492))

(assert (= (and b!1098492 res!733101) b!1098493))

(assert (= (and b!1098493 res!733099) b!1098501))

(assert (= (and b!1098501 (not res!733093)) b!1098499))

(assert (= (and b!1098497 condMapEmpty!42481) mapIsEmpty!42481))

(assert (= (and b!1098497 (not condMapEmpty!42481)) mapNonEmpty!42481))

(get-info :version)

(assert (= (and mapNonEmpty!42481 ((_ is ValueCellFull!12861) mapValue!42481)) b!1098498))

(assert (= (and b!1098497 ((_ is ValueCellFull!12861) mapDefault!42481)) b!1098503))

(assert (= start!96590 b!1098497))

(declare-fun b_lambda!17839 () Bool)

(assert (=> (not b_lambda!17839) (not b!1098501)))

(declare-fun t!34065 () Bool)

(declare-fun tb!7957 () Bool)

(assert (=> (and start!96590 (= defaultEntry!882 defaultEntry!882) t!34065) tb!7957))

(declare-fun result!16443 () Bool)

(assert (=> tb!7957 (= result!16443 tp_is_empty!27141)))

(assert (=> b!1098501 t!34065))

(declare-fun b_and!36889 () Bool)

(assert (= b_and!36887 (and (=> t!34065 result!16443) b_and!36889)))

(declare-fun m!1018173 () Bool)

(assert (=> b!1098492 m!1018173))

(declare-fun m!1018175 () Bool)

(assert (=> b!1098492 m!1018175))

(declare-fun m!1018177 () Bool)

(assert (=> b!1098493 m!1018177))

(declare-fun m!1018179 () Bool)

(assert (=> b!1098501 m!1018179))

(declare-fun m!1018181 () Bool)

(assert (=> b!1098501 m!1018181))

(declare-fun m!1018183 () Bool)

(assert (=> b!1098501 m!1018183))

(declare-fun m!1018185 () Bool)

(assert (=> b!1098501 m!1018185))

(declare-fun m!1018187 () Bool)

(assert (=> b!1098501 m!1018187))

(declare-fun m!1018189 () Bool)

(assert (=> b!1098501 m!1018189))

(declare-fun m!1018191 () Bool)

(assert (=> b!1098501 m!1018191))

(declare-fun m!1018193 () Bool)

(assert (=> b!1098501 m!1018193))

(declare-fun m!1018195 () Bool)

(assert (=> b!1098501 m!1018195))

(declare-fun m!1018197 () Bool)

(assert (=> b!1098501 m!1018197))

(declare-fun m!1018199 () Bool)

(assert (=> mapNonEmpty!42481 m!1018199))

(declare-fun m!1018201 () Bool)

(assert (=> b!1098500 m!1018201))

(declare-fun m!1018203 () Bool)

(assert (=> b!1098499 m!1018203))

(declare-fun m!1018205 () Bool)

(assert (=> b!1098499 m!1018205))

(declare-fun m!1018207 () Bool)

(assert (=> b!1098499 m!1018207))

(declare-fun m!1018209 () Bool)

(assert (=> b!1098499 m!1018209))

(declare-fun m!1018211 () Bool)

(assert (=> b!1098499 m!1018211))

(declare-fun m!1018213 () Bool)

(assert (=> b!1098499 m!1018213))

(declare-fun m!1018215 () Bool)

(assert (=> b!1098499 m!1018215))

(assert (=> b!1098499 m!1018209))

(declare-fun m!1018217 () Bool)

(assert (=> b!1098499 m!1018217))

(declare-fun m!1018219 () Bool)

(assert (=> start!96590 m!1018219))

(declare-fun m!1018221 () Bool)

(assert (=> start!96590 m!1018221))

(declare-fun m!1018223 () Bool)

(assert (=> start!96590 m!1018223))

(declare-fun m!1018225 () Bool)

(assert (=> b!1098495 m!1018225))

(declare-fun m!1018227 () Bool)

(assert (=> b!1098494 m!1018227))

(declare-fun m!1018229 () Bool)

(assert (=> b!1098496 m!1018229))

(check-sat (not b_next!23091) (not b!1098493) (not b!1098494) (not b_lambda!17839) b_and!36889 (not b!1098501) tp_is_empty!27141 (not start!96590) (not b!1098492) (not b!1098495) (not b!1098499) (not b!1098500) (not mapNonEmpty!42481))
(check-sat b_and!36889 (not b_next!23091))
(get-model)

(declare-fun b_lambda!17843 () Bool)

(assert (= b_lambda!17839 (or (and start!96590 b_free!23091) b_lambda!17843)))

(check-sat (not b_next!23091) (not b!1098493) (not b!1098494) b_and!36889 (not b!1098501) tp_is_empty!27141 (not start!96590) (not b!1098492) (not b!1098495) (not b!1098499) (not b_lambda!17843) (not b!1098500) (not mapNonEmpty!42481))
(check-sat b_and!36889 (not b_next!23091))
(get-model)

(declare-fun b!1098555 () Bool)

(declare-fun e!627000 () Bool)

(declare-fun call!45905 () Bool)

(assert (=> b!1098555 (= e!627000 call!45905)))

(declare-fun b!1098556 () Bool)

(declare-fun e!627001 () Bool)

(declare-fun e!626999 () Bool)

(assert (=> b!1098556 (= e!627001 e!626999)))

(declare-fun c!108514 () Bool)

(assert (=> b!1098556 (= c!108514 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45902 () Bool)

(assert (=> bm!45902 (= call!45905 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130421 () Bool)

(declare-fun res!733137 () Bool)

(assert (=> d!130421 (=> res!733137 e!627001)))

(assert (=> d!130421 (= res!733137 (bvsge #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(assert (=> d!130421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627001)))

(declare-fun b!1098557 () Bool)

(assert (=> b!1098557 (= e!626999 e!627000)))

(declare-fun lt!491466 () (_ BitVec 64))

(assert (=> b!1098557 (= lt!491466 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491465 () Unit!36124)

(assert (=> b!1098557 (= lt!491465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491466 #b00000000000000000000000000000000))))

(assert (=> b!1098557 (arrayContainsKey!0 _keys!1070 lt!491466 #b00000000000000000000000000000000)))

(declare-fun lt!491467 () Unit!36124)

(assert (=> b!1098557 (= lt!491467 lt!491465)))

(declare-fun res!733138 () Bool)

(declare-datatypes ((SeekEntryResult!9909 0))(
  ( (MissingZero!9909 (index!42007 (_ BitVec 32))) (Found!9909 (index!42008 (_ BitVec 32))) (Intermediate!9909 (undefined!10721 Bool) (index!42009 (_ BitVec 32)) (x!98802 (_ BitVec 32))) (Undefined!9909) (MissingVacant!9909 (index!42010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71195 (_ BitVec 32)) SeekEntryResult!9909)

(assert (=> b!1098557 (= res!733138 (= (seekEntryOrOpen!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9909 #b00000000000000000000000000000000)))))

(assert (=> b!1098557 (=> (not res!733138) (not e!627000))))

(declare-fun b!1098558 () Bool)

(assert (=> b!1098558 (= e!626999 call!45905)))

(assert (= (and d!130421 (not res!733137)) b!1098556))

(assert (= (and b!1098556 c!108514) b!1098557))

(assert (= (and b!1098556 (not c!108514)) b!1098558))

(assert (= (and b!1098557 res!733138) b!1098555))

(assert (= (or b!1098555 b!1098558) bm!45902))

(declare-fun m!1018289 () Bool)

(assert (=> b!1098556 m!1018289))

(assert (=> b!1098556 m!1018289))

(declare-fun m!1018291 () Bool)

(assert (=> b!1098556 m!1018291))

(declare-fun m!1018293 () Bool)

(assert (=> bm!45902 m!1018293))

(assert (=> b!1098557 m!1018289))

(declare-fun m!1018295 () Bool)

(assert (=> b!1098557 m!1018295))

(declare-fun m!1018297 () Bool)

(assert (=> b!1098557 m!1018297))

(assert (=> b!1098557 m!1018289))

(declare-fun m!1018299 () Bool)

(assert (=> b!1098557 m!1018299))

(assert (=> b!1098494 d!130421))

(declare-fun d!130423 () Bool)

(declare-fun e!627004 () Bool)

(assert (=> d!130423 e!627004))

(declare-fun res!733143 () Bool)

(assert (=> d!130423 (=> (not res!733143) (not e!627004))))

(declare-fun lt!491478 () ListLongMap!15277)

(declare-fun contains!6386 (ListLongMap!15277 (_ BitVec 64)) Bool)

(assert (=> d!130423 (= res!733143 (contains!6386 lt!491478 (_1!8665 lt!491416)))))

(declare-fun lt!491479 () List!23930)

(assert (=> d!130423 (= lt!491478 (ListLongMap!15278 lt!491479))))

(declare-fun lt!491476 () Unit!36124)

(declare-fun lt!491477 () Unit!36124)

(assert (=> d!130423 (= lt!491476 lt!491477)))

(declare-datatypes ((Option!672 0))(
  ( (Some!671 (v!16253 V!41315)) (None!670) )
))
(declare-fun getValueByKey!621 (List!23930 (_ BitVec 64)) Option!672)

(assert (=> d!130423 (= (getValueByKey!621 lt!491479 (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416)))))

(declare-fun lemmaContainsTupThenGetReturnValue!298 (List!23930 (_ BitVec 64) V!41315) Unit!36124)

(assert (=> d!130423 (= lt!491477 (lemmaContainsTupThenGetReturnValue!298 lt!491479 (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(declare-fun insertStrictlySorted!391 (List!23930 (_ BitVec 64) V!41315) List!23930)

(assert (=> d!130423 (= lt!491479 (insertStrictlySorted!391 (toList!7654 lt!491413) (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(assert (=> d!130423 (= (+!3363 lt!491413 lt!491416) lt!491478)))

(declare-fun b!1098563 () Bool)

(declare-fun res!733144 () Bool)

(assert (=> b!1098563 (=> (not res!733144) (not e!627004))))

(assert (=> b!1098563 (= res!733144 (= (getValueByKey!621 (toList!7654 lt!491478) (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416))))))

(declare-fun b!1098564 () Bool)

(declare-fun contains!6387 (List!23930 tuple2!17308) Bool)

(assert (=> b!1098564 (= e!627004 (contains!6387 (toList!7654 lt!491478) lt!491416))))

(assert (= (and d!130423 res!733143) b!1098563))

(assert (= (and b!1098563 res!733144) b!1098564))

(declare-fun m!1018301 () Bool)

(assert (=> d!130423 m!1018301))

(declare-fun m!1018303 () Bool)

(assert (=> d!130423 m!1018303))

(declare-fun m!1018305 () Bool)

(assert (=> d!130423 m!1018305))

(declare-fun m!1018307 () Bool)

(assert (=> d!130423 m!1018307))

(declare-fun m!1018309 () Bool)

(assert (=> b!1098563 m!1018309))

(declare-fun m!1018311 () Bool)

(assert (=> b!1098564 m!1018311))

(assert (=> b!1098499 d!130423))

(declare-fun d!130425 () Bool)

(declare-fun e!627005 () Bool)

(assert (=> d!130425 e!627005))

(declare-fun res!733145 () Bool)

(assert (=> d!130425 (=> (not res!733145) (not e!627005))))

(declare-fun lt!491482 () ListLongMap!15277)

(assert (=> d!130425 (= res!733145 (contains!6386 lt!491482 (_1!8665 lt!491416)))))

(declare-fun lt!491483 () List!23930)

(assert (=> d!130425 (= lt!491482 (ListLongMap!15278 lt!491483))))

(declare-fun lt!491480 () Unit!36124)

(declare-fun lt!491481 () Unit!36124)

(assert (=> d!130425 (= lt!491480 lt!491481)))

(assert (=> d!130425 (= (getValueByKey!621 lt!491483 (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416)))))

(assert (=> d!130425 (= lt!491481 (lemmaContainsTupThenGetReturnValue!298 lt!491483 (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(assert (=> d!130425 (= lt!491483 (insertStrictlySorted!391 (toList!7654 lt!491409) (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(assert (=> d!130425 (= (+!3363 lt!491409 lt!491416) lt!491482)))

(declare-fun b!1098565 () Bool)

(declare-fun res!733146 () Bool)

(assert (=> b!1098565 (=> (not res!733146) (not e!627005))))

(assert (=> b!1098565 (= res!733146 (= (getValueByKey!621 (toList!7654 lt!491482) (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416))))))

(declare-fun b!1098566 () Bool)

(assert (=> b!1098566 (= e!627005 (contains!6387 (toList!7654 lt!491482) lt!491416))))

(assert (= (and d!130425 res!733145) b!1098565))

(assert (= (and b!1098565 res!733146) b!1098566))

(declare-fun m!1018313 () Bool)

(assert (=> d!130425 m!1018313))

(declare-fun m!1018315 () Bool)

(assert (=> d!130425 m!1018315))

(declare-fun m!1018317 () Bool)

(assert (=> d!130425 m!1018317))

(declare-fun m!1018319 () Bool)

(assert (=> d!130425 m!1018319))

(declare-fun m!1018321 () Bool)

(assert (=> b!1098565 m!1018321))

(declare-fun m!1018323 () Bool)

(assert (=> b!1098566 m!1018323))

(assert (=> b!1098499 d!130425))

(declare-fun d!130427 () Bool)

(declare-fun e!627006 () Bool)

(assert (=> d!130427 e!627006))

(declare-fun res!733147 () Bool)

(assert (=> d!130427 (=> (not res!733147) (not e!627006))))

(declare-fun lt!491486 () ListLongMap!15277)

(assert (=> d!130427 (= res!733147 (contains!6386 lt!491486 (_1!8665 lt!491415)))))

(declare-fun lt!491487 () List!23930)

(assert (=> d!130427 (= lt!491486 (ListLongMap!15278 lt!491487))))

(declare-fun lt!491484 () Unit!36124)

(declare-fun lt!491485 () Unit!36124)

(assert (=> d!130427 (= lt!491484 lt!491485)))

(assert (=> d!130427 (= (getValueByKey!621 lt!491487 (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415)))))

(assert (=> d!130427 (= lt!491485 (lemmaContainsTupThenGetReturnValue!298 lt!491487 (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130427 (= lt!491487 (insertStrictlySorted!391 (toList!7654 lt!491405) (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130427 (= (+!3363 lt!491405 lt!491415) lt!491486)))

(declare-fun b!1098567 () Bool)

(declare-fun res!733148 () Bool)

(assert (=> b!1098567 (=> (not res!733148) (not e!627006))))

(assert (=> b!1098567 (= res!733148 (= (getValueByKey!621 (toList!7654 lt!491486) (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415))))))

(declare-fun b!1098568 () Bool)

(assert (=> b!1098568 (= e!627006 (contains!6387 (toList!7654 lt!491486) lt!491415))))

(assert (= (and d!130427 res!733147) b!1098567))

(assert (= (and b!1098567 res!733148) b!1098568))

(declare-fun m!1018325 () Bool)

(assert (=> d!130427 m!1018325))

(declare-fun m!1018327 () Bool)

(assert (=> d!130427 m!1018327))

(declare-fun m!1018329 () Bool)

(assert (=> d!130427 m!1018329))

(declare-fun m!1018331 () Bool)

(assert (=> d!130427 m!1018331))

(declare-fun m!1018333 () Bool)

(assert (=> b!1098567 m!1018333))

(declare-fun m!1018335 () Bool)

(assert (=> b!1098568 m!1018335))

(assert (=> b!1098499 d!130427))

(declare-fun d!130429 () Bool)

(declare-fun e!627007 () Bool)

(assert (=> d!130429 e!627007))

(declare-fun res!733149 () Bool)

(assert (=> d!130429 (=> (not res!733149) (not e!627007))))

(declare-fun lt!491490 () ListLongMap!15277)

(assert (=> d!130429 (= res!733149 (contains!6386 lt!491490 (_1!8665 lt!491415)))))

(declare-fun lt!491491 () List!23930)

(assert (=> d!130429 (= lt!491490 (ListLongMap!15278 lt!491491))))

(declare-fun lt!491488 () Unit!36124)

(declare-fun lt!491489 () Unit!36124)

(assert (=> d!130429 (= lt!491488 lt!491489)))

(assert (=> d!130429 (= (getValueByKey!621 lt!491491 (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415)))))

(assert (=> d!130429 (= lt!491489 (lemmaContainsTupThenGetReturnValue!298 lt!491491 (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130429 (= lt!491491 (insertStrictlySorted!391 (toList!7654 lt!491408) (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130429 (= (+!3363 lt!491408 lt!491415) lt!491490)))

(declare-fun b!1098569 () Bool)

(declare-fun res!733150 () Bool)

(assert (=> b!1098569 (=> (not res!733150) (not e!627007))))

(assert (=> b!1098569 (= res!733150 (= (getValueByKey!621 (toList!7654 lt!491490) (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415))))))

(declare-fun b!1098570 () Bool)

(assert (=> b!1098570 (= e!627007 (contains!6387 (toList!7654 lt!491490) lt!491415))))

(assert (= (and d!130429 res!733149) b!1098569))

(assert (= (and b!1098569 res!733150) b!1098570))

(declare-fun m!1018337 () Bool)

(assert (=> d!130429 m!1018337))

(declare-fun m!1018339 () Bool)

(assert (=> d!130429 m!1018339))

(declare-fun m!1018341 () Bool)

(assert (=> d!130429 m!1018341))

(declare-fun m!1018343 () Bool)

(assert (=> d!130429 m!1018343))

(declare-fun m!1018345 () Bool)

(assert (=> b!1098569 m!1018345))

(declare-fun m!1018347 () Bool)

(assert (=> b!1098570 m!1018347))

(assert (=> b!1098499 d!130429))

(declare-fun d!130431 () Bool)

(declare-fun e!627008 () Bool)

(assert (=> d!130431 e!627008))

(declare-fun res!733151 () Bool)

(assert (=> d!130431 (=> (not res!733151) (not e!627008))))

(declare-fun lt!491494 () ListLongMap!15277)

(assert (=> d!130431 (= res!733151 (contains!6386 lt!491494 (_1!8665 lt!491416)))))

(declare-fun lt!491495 () List!23930)

(assert (=> d!130431 (= lt!491494 (ListLongMap!15278 lt!491495))))

(declare-fun lt!491492 () Unit!36124)

(declare-fun lt!491493 () Unit!36124)

(assert (=> d!130431 (= lt!491492 lt!491493)))

(assert (=> d!130431 (= (getValueByKey!621 lt!491495 (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416)))))

(assert (=> d!130431 (= lt!491493 (lemmaContainsTupThenGetReturnValue!298 lt!491495 (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(assert (=> d!130431 (= lt!491495 (insertStrictlySorted!391 (toList!7654 (+!3363 lt!491403 lt!491415)) (_1!8665 lt!491416) (_2!8665 lt!491416)))))

(assert (=> d!130431 (= (+!3363 (+!3363 lt!491403 lt!491415) lt!491416) lt!491494)))

(declare-fun b!1098571 () Bool)

(declare-fun res!733152 () Bool)

(assert (=> b!1098571 (=> (not res!733152) (not e!627008))))

(assert (=> b!1098571 (= res!733152 (= (getValueByKey!621 (toList!7654 lt!491494) (_1!8665 lt!491416)) (Some!671 (_2!8665 lt!491416))))))

(declare-fun b!1098572 () Bool)

(assert (=> b!1098572 (= e!627008 (contains!6387 (toList!7654 lt!491494) lt!491416))))

(assert (= (and d!130431 res!733151) b!1098571))

(assert (= (and b!1098571 res!733152) b!1098572))

(declare-fun m!1018349 () Bool)

(assert (=> d!130431 m!1018349))

(declare-fun m!1018351 () Bool)

(assert (=> d!130431 m!1018351))

(declare-fun m!1018353 () Bool)

(assert (=> d!130431 m!1018353))

(declare-fun m!1018355 () Bool)

(assert (=> d!130431 m!1018355))

(declare-fun m!1018357 () Bool)

(assert (=> b!1098571 m!1018357))

(declare-fun m!1018359 () Bool)

(assert (=> b!1098572 m!1018359))

(assert (=> b!1098499 d!130431))

(declare-fun d!130433 () Bool)

(assert (=> d!130433 (= (-!943 (+!3363 lt!491405 (tuple2!17309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) k0!904) (+!3363 (-!943 lt!491405 k0!904) (tuple2!17309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(declare-fun lt!491498 () Unit!36124)

(declare-fun choose!1764 (ListLongMap!15277 (_ BitVec 64) V!41315 (_ BitVec 64)) Unit!36124)

(assert (=> d!130433 (= lt!491498 (choose!1764 lt!491405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> d!130433 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> d!130433 (= (addRemoveCommutativeForDiffKeys!115 lt!491405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904) lt!491498)))

(declare-fun bs!32272 () Bool)

(assert (= bs!32272 d!130433))

(assert (=> bs!32272 m!1018195))

(declare-fun m!1018361 () Bool)

(assert (=> bs!32272 m!1018361))

(declare-fun m!1018363 () Bool)

(assert (=> bs!32272 m!1018363))

(assert (=> bs!32272 m!1018195))

(declare-fun m!1018365 () Bool)

(assert (=> bs!32272 m!1018365))

(assert (=> bs!32272 m!1018363))

(declare-fun m!1018367 () Bool)

(assert (=> bs!32272 m!1018367))

(assert (=> b!1098499 d!130433))

(declare-fun d!130435 () Bool)

(declare-fun e!627009 () Bool)

(assert (=> d!130435 e!627009))

(declare-fun res!733153 () Bool)

(assert (=> d!130435 (=> (not res!733153) (not e!627009))))

(declare-fun lt!491501 () ListLongMap!15277)

(assert (=> d!130435 (= res!733153 (contains!6386 lt!491501 (_1!8665 lt!491415)))))

(declare-fun lt!491502 () List!23930)

(assert (=> d!130435 (= lt!491501 (ListLongMap!15278 lt!491502))))

(declare-fun lt!491499 () Unit!36124)

(declare-fun lt!491500 () Unit!36124)

(assert (=> d!130435 (= lt!491499 lt!491500)))

(assert (=> d!130435 (= (getValueByKey!621 lt!491502 (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415)))))

(assert (=> d!130435 (= lt!491500 (lemmaContainsTupThenGetReturnValue!298 lt!491502 (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130435 (= lt!491502 (insertStrictlySorted!391 (toList!7654 lt!491403) (_1!8665 lt!491415) (_2!8665 lt!491415)))))

(assert (=> d!130435 (= (+!3363 lt!491403 lt!491415) lt!491501)))

(declare-fun b!1098573 () Bool)

(declare-fun res!733154 () Bool)

(assert (=> b!1098573 (=> (not res!733154) (not e!627009))))

(assert (=> b!1098573 (= res!733154 (= (getValueByKey!621 (toList!7654 lt!491501) (_1!8665 lt!491415)) (Some!671 (_2!8665 lt!491415))))))

(declare-fun b!1098574 () Bool)

(assert (=> b!1098574 (= e!627009 (contains!6387 (toList!7654 lt!491501) lt!491415))))

(assert (= (and d!130435 res!733153) b!1098573))

(assert (= (and b!1098573 res!733154) b!1098574))

(declare-fun m!1018369 () Bool)

(assert (=> d!130435 m!1018369))

(declare-fun m!1018371 () Bool)

(assert (=> d!130435 m!1018371))

(declare-fun m!1018373 () Bool)

(assert (=> d!130435 m!1018373))

(declare-fun m!1018375 () Bool)

(assert (=> d!130435 m!1018375))

(declare-fun m!1018377 () Bool)

(assert (=> b!1098573 m!1018377))

(declare-fun m!1018379 () Bool)

(assert (=> b!1098574 m!1018379))

(assert (=> b!1098499 d!130435))

(declare-fun d!130437 () Bool)

(declare-fun lt!491505 () ListLongMap!15277)

(assert (=> d!130437 (not (contains!6386 lt!491505 k0!904))))

(declare-fun removeStrictlySorted!80 (List!23930 (_ BitVec 64)) List!23930)

(assert (=> d!130437 (= lt!491505 (ListLongMap!15278 (removeStrictlySorted!80 (toList!7654 lt!491409) k0!904)))))

(assert (=> d!130437 (= (-!943 lt!491409 k0!904) lt!491505)))

(declare-fun bs!32273 () Bool)

(assert (= bs!32273 d!130437))

(declare-fun m!1018381 () Bool)

(assert (=> bs!32273 m!1018381))

(declare-fun m!1018383 () Bool)

(assert (=> bs!32273 m!1018383))

(assert (=> b!1098499 d!130437))

(declare-fun d!130439 () Bool)

(assert (=> d!130439 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96590 d!130439))

(declare-fun d!130441 () Bool)

(assert (=> d!130441 (= (array_inv!26398 _keys!1070) (bvsge (size!34802 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96590 d!130441))

(declare-fun d!130443 () Bool)

(assert (=> d!130443 (= (array_inv!26399 _values!874) (bvsge (size!34803 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96590 d!130443))

(declare-fun d!130445 () Bool)

(assert (=> d!130445 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098495 d!130445))

(declare-fun b!1098585 () Bool)

(declare-fun e!627018 () Bool)

(declare-fun call!45908 () Bool)

(assert (=> b!1098585 (= e!627018 call!45908)))

(declare-fun b!1098586 () Bool)

(declare-fun e!627021 () Bool)

(declare-fun e!627020 () Bool)

(assert (=> b!1098586 (= e!627021 e!627020)))

(declare-fun res!733162 () Bool)

(assert (=> b!1098586 (=> (not res!733162) (not e!627020))))

(declare-fun e!627019 () Bool)

(assert (=> b!1098586 (= res!733162 (not e!627019))))

(declare-fun res!733163 () Bool)

(assert (=> b!1098586 (=> (not res!733163) (not e!627019))))

(assert (=> b!1098586 (= res!733163 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098587 () Bool)

(assert (=> b!1098587 (= e!627018 call!45908)))

(declare-fun bm!45905 () Bool)

(declare-fun c!108517 () Bool)

(assert (=> bm!45905 (= call!45908 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108517 (Cons!23925 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000) Nil!23926) Nil!23926)))))

(declare-fun b!1098588 () Bool)

(declare-fun contains!6388 (List!23929 (_ BitVec 64)) Bool)

(assert (=> b!1098588 (= e!627019 (contains!6388 Nil!23926 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098589 () Bool)

(assert (=> b!1098589 (= e!627020 e!627018)))

(assert (=> b!1098589 (= c!108517 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130447 () Bool)

(declare-fun res!733161 () Bool)

(assert (=> d!130447 (=> res!733161 e!627021)))

(assert (=> d!130447 (= res!733161 (bvsge #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(assert (=> d!130447 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23926) e!627021)))

(assert (= (and d!130447 (not res!733161)) b!1098586))

(assert (= (and b!1098586 res!733163) b!1098588))

(assert (= (and b!1098586 res!733162) b!1098589))

(assert (= (and b!1098589 c!108517) b!1098585))

(assert (= (and b!1098589 (not c!108517)) b!1098587))

(assert (= (or b!1098585 b!1098587) bm!45905))

(assert (=> b!1098586 m!1018289))

(assert (=> b!1098586 m!1018289))

(assert (=> b!1098586 m!1018291))

(assert (=> bm!45905 m!1018289))

(declare-fun m!1018385 () Bool)

(assert (=> bm!45905 m!1018385))

(assert (=> b!1098588 m!1018289))

(assert (=> b!1098588 m!1018289))

(declare-fun m!1018387 () Bool)

(assert (=> b!1098588 m!1018387))

(assert (=> b!1098589 m!1018289))

(assert (=> b!1098589 m!1018289))

(assert (=> b!1098589 m!1018291))

(assert (=> b!1098500 d!130447))

(declare-fun d!130449 () Bool)

(declare-fun res!733168 () Bool)

(declare-fun e!627026 () Bool)

(assert (=> d!130449 (=> res!733168 e!627026)))

(assert (=> d!130449 (= res!733168 (= (select (arr!34266 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130449 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627026)))

(declare-fun b!1098594 () Bool)

(declare-fun e!627027 () Bool)

(assert (=> b!1098594 (= e!627026 e!627027)))

(declare-fun res!733169 () Bool)

(assert (=> b!1098594 (=> (not res!733169) (not e!627027))))

(assert (=> b!1098594 (= res!733169 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34802 _keys!1070)))))

(declare-fun b!1098595 () Bool)

(assert (=> b!1098595 (= e!627027 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130449 (not res!733168)) b!1098594))

(assert (= (and b!1098594 res!733169) b!1098595))

(assert (=> d!130449 m!1018289))

(declare-fun m!1018389 () Bool)

(assert (=> b!1098595 m!1018389))

(assert (=> b!1098501 d!130449))

(declare-fun b!1098638 () Bool)

(declare-fun e!627064 () Bool)

(declare-fun e!627059 () Bool)

(assert (=> b!1098638 (= e!627064 e!627059)))

(declare-fun c!108530 () Bool)

(assert (=> b!1098638 (= c!108530 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098639 () Bool)

(declare-fun call!45926 () Bool)

(assert (=> b!1098639 (= e!627059 (not call!45926))))

(declare-fun e!627058 () Bool)

(declare-fun lt!491558 () ListLongMap!15277)

(declare-fun b!1098640 () Bool)

(declare-fun apply!946 (ListLongMap!15277 (_ BitVec 64)) V!41315)

(declare-fun get!17622 (ValueCell!12861 V!41315) V!41315)

(assert (=> b!1098640 (= e!627058 (= (apply!946 lt!491558 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)) (get!17622 (select (arr!34267 lt!491407) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34803 lt!491407)))))

(assert (=> b!1098640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun d!130451 () Bool)

(assert (=> d!130451 e!627064))

(declare-fun res!733194 () Bool)

(assert (=> d!130451 (=> (not res!733194) (not e!627064))))

(assert (=> d!130451 (= res!733194 (or (bvsge #b00000000000000000000000000000000 (size!34802 lt!491404)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))))

(declare-fun lt!491554 () ListLongMap!15277)

(assert (=> d!130451 (= lt!491558 lt!491554)))

(declare-fun lt!491566 () Unit!36124)

(declare-fun e!627057 () Unit!36124)

(assert (=> d!130451 (= lt!491566 e!627057)))

(declare-fun c!108532 () Bool)

(declare-fun e!627061 () Bool)

(assert (=> d!130451 (= c!108532 e!627061)))

(declare-fun res!733191 () Bool)

(assert (=> d!130451 (=> (not res!733191) (not e!627061))))

(assert (=> d!130451 (= res!733191 (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun e!627063 () ListLongMap!15277)

(assert (=> d!130451 (= lt!491554 e!627063)))

(declare-fun c!108535 () Bool)

(assert (=> d!130451 (= c!108535 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130451 (validMask!0 mask!1414)))

(assert (=> d!130451 (= (getCurrentListMap!4373 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491558)))

(declare-fun b!1098641 () Bool)

(declare-fun e!627062 () Bool)

(assert (=> b!1098641 (= e!627062 e!627058)))

(declare-fun res!733193 () Bool)

(assert (=> b!1098641 (=> (not res!733193) (not e!627058))))

(assert (=> b!1098641 (= res!733193 (contains!6386 lt!491558 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(assert (=> b!1098641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun b!1098642 () Bool)

(declare-fun res!733192 () Bool)

(assert (=> b!1098642 (=> (not res!733192) (not e!627064))))

(declare-fun e!627060 () Bool)

(assert (=> b!1098642 (= res!733192 e!627060)))

(declare-fun c!108534 () Bool)

(assert (=> b!1098642 (= c!108534 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098643 () Bool)

(declare-fun e!627055 () ListLongMap!15277)

(declare-fun call!45929 () ListLongMap!15277)

(assert (=> b!1098643 (= e!627055 call!45929)))

(declare-fun call!45928 () ListLongMap!15277)

(declare-fun call!45924 () ListLongMap!15277)

(declare-fun c!108531 () Bool)

(declare-fun bm!45920 () Bool)

(declare-fun call!45927 () ListLongMap!15277)

(declare-fun call!45925 () ListLongMap!15277)

(assert (=> bm!45920 (= call!45927 (+!3363 (ite c!108535 call!45924 (ite c!108531 call!45928 call!45925)) (ite (or c!108535 c!108531) (tuple2!17309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098644 () Bool)

(declare-fun Unit!36128 () Unit!36124)

(assert (=> b!1098644 (= e!627057 Unit!36128)))

(declare-fun bm!45921 () Bool)

(assert (=> bm!45921 (= call!45929 call!45927)))

(declare-fun b!1098645 () Bool)

(declare-fun lt!491550 () Unit!36124)

(assert (=> b!1098645 (= e!627057 lt!491550)))

(declare-fun lt!491551 () ListLongMap!15277)

(assert (=> b!1098645 (= lt!491551 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491562 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491570 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491570 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(declare-fun lt!491563 () Unit!36124)

(declare-fun addStillContains!659 (ListLongMap!15277 (_ BitVec 64) V!41315 (_ BitVec 64)) Unit!36124)

(assert (=> b!1098645 (= lt!491563 (addStillContains!659 lt!491551 lt!491562 zeroValue!831 lt!491570))))

(assert (=> b!1098645 (contains!6386 (+!3363 lt!491551 (tuple2!17309 lt!491562 zeroValue!831)) lt!491570)))

(declare-fun lt!491569 () Unit!36124)

(assert (=> b!1098645 (= lt!491569 lt!491563)))

(declare-fun lt!491557 () ListLongMap!15277)

(assert (=> b!1098645 (= lt!491557 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491552 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491565 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491565 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(declare-fun lt!491568 () Unit!36124)

(declare-fun addApplyDifferent!519 (ListLongMap!15277 (_ BitVec 64) V!41315 (_ BitVec 64)) Unit!36124)

(assert (=> b!1098645 (= lt!491568 (addApplyDifferent!519 lt!491557 lt!491552 minValue!831 lt!491565))))

(assert (=> b!1098645 (= (apply!946 (+!3363 lt!491557 (tuple2!17309 lt!491552 minValue!831)) lt!491565) (apply!946 lt!491557 lt!491565))))

(declare-fun lt!491571 () Unit!36124)

(assert (=> b!1098645 (= lt!491571 lt!491568)))

(declare-fun lt!491567 () ListLongMap!15277)

(assert (=> b!1098645 (= lt!491567 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491561 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491556 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491556 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(declare-fun lt!491555 () Unit!36124)

(assert (=> b!1098645 (= lt!491555 (addApplyDifferent!519 lt!491567 lt!491561 zeroValue!831 lt!491556))))

(assert (=> b!1098645 (= (apply!946 (+!3363 lt!491567 (tuple2!17309 lt!491561 zeroValue!831)) lt!491556) (apply!946 lt!491567 lt!491556))))

(declare-fun lt!491553 () Unit!36124)

(assert (=> b!1098645 (= lt!491553 lt!491555)))

(declare-fun lt!491564 () ListLongMap!15277)

(assert (=> b!1098645 (= lt!491564 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491559 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491560 () (_ BitVec 64))

(assert (=> b!1098645 (= lt!491560 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(assert (=> b!1098645 (= lt!491550 (addApplyDifferent!519 lt!491564 lt!491559 minValue!831 lt!491560))))

(assert (=> b!1098645 (= (apply!946 (+!3363 lt!491564 (tuple2!17309 lt!491559 minValue!831)) lt!491560) (apply!946 lt!491564 lt!491560))))

(declare-fun b!1098646 () Bool)

(declare-fun e!627054 () Bool)

(assert (=> b!1098646 (= e!627054 (= (apply!946 lt!491558 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098647 () Bool)

(assert (=> b!1098647 (= e!627061 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun b!1098648 () Bool)

(declare-fun res!733195 () Bool)

(assert (=> b!1098648 (=> (not res!733195) (not e!627064))))

(assert (=> b!1098648 (= res!733195 e!627062)))

(declare-fun res!733190 () Bool)

(assert (=> b!1098648 (=> res!733190 e!627062)))

(declare-fun e!627065 () Bool)

(assert (=> b!1098648 (= res!733190 (not e!627065))))

(declare-fun res!733196 () Bool)

(assert (=> b!1098648 (=> (not res!733196) (not e!627065))))

(assert (=> b!1098648 (= res!733196 (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun b!1098649 () Bool)

(declare-fun c!108533 () Bool)

(assert (=> b!1098649 (= c!108533 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627056 () ListLongMap!15277)

(assert (=> b!1098649 (= e!627055 e!627056)))

(declare-fun b!1098650 () Bool)

(assert (=> b!1098650 (= e!627063 (+!3363 call!45927 (tuple2!17309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45922 () Bool)

(assert (=> bm!45922 (= call!45924 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45923 () Bool)

(assert (=> bm!45923 (= call!45926 (contains!6386 lt!491558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098651 () Bool)

(assert (=> b!1098651 (= e!627059 e!627054)))

(declare-fun res!733189 () Bool)

(assert (=> b!1098651 (= res!733189 call!45926)))

(assert (=> b!1098651 (=> (not res!733189) (not e!627054))))

(declare-fun b!1098652 () Bool)

(assert (=> b!1098652 (= e!627063 e!627055)))

(assert (=> b!1098652 (= c!108531 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45924 () Bool)

(assert (=> bm!45924 (= call!45925 call!45928)))

(declare-fun bm!45925 () Bool)

(declare-fun call!45923 () Bool)

(assert (=> bm!45925 (= call!45923 (contains!6386 lt!491558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098653 () Bool)

(assert (=> b!1098653 (= e!627060 (not call!45923))))

(declare-fun b!1098654 () Bool)

(assert (=> b!1098654 (= e!627056 call!45925)))

(declare-fun b!1098655 () Bool)

(declare-fun e!627066 () Bool)

(assert (=> b!1098655 (= e!627060 e!627066)))

(declare-fun res!733188 () Bool)

(assert (=> b!1098655 (= res!733188 call!45923)))

(assert (=> b!1098655 (=> (not res!733188) (not e!627066))))

(declare-fun b!1098656 () Bool)

(assert (=> b!1098656 (= e!627056 call!45929)))

(declare-fun b!1098657 () Bool)

(assert (=> b!1098657 (= e!627065 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun bm!45926 () Bool)

(assert (=> bm!45926 (= call!45928 call!45924)))

(declare-fun b!1098658 () Bool)

(assert (=> b!1098658 (= e!627066 (= (apply!946 lt!491558 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(assert (= (and d!130451 c!108535) b!1098650))

(assert (= (and d!130451 (not c!108535)) b!1098652))

(assert (= (and b!1098652 c!108531) b!1098643))

(assert (= (and b!1098652 (not c!108531)) b!1098649))

(assert (= (and b!1098649 c!108533) b!1098656))

(assert (= (and b!1098649 (not c!108533)) b!1098654))

(assert (= (or b!1098656 b!1098654) bm!45924))

(assert (= (or b!1098643 bm!45924) bm!45926))

(assert (= (or b!1098643 b!1098656) bm!45921))

(assert (= (or b!1098650 bm!45926) bm!45922))

(assert (= (or b!1098650 bm!45921) bm!45920))

(assert (= (and d!130451 res!733191) b!1098647))

(assert (= (and d!130451 c!108532) b!1098645))

(assert (= (and d!130451 (not c!108532)) b!1098644))

(assert (= (and d!130451 res!733194) b!1098648))

(assert (= (and b!1098648 res!733196) b!1098657))

(assert (= (and b!1098648 (not res!733190)) b!1098641))

(assert (= (and b!1098641 res!733193) b!1098640))

(assert (= (and b!1098648 res!733195) b!1098642))

(assert (= (and b!1098642 c!108534) b!1098655))

(assert (= (and b!1098642 (not c!108534)) b!1098653))

(assert (= (and b!1098655 res!733188) b!1098658))

(assert (= (or b!1098655 b!1098653) bm!45925))

(assert (= (and b!1098642 res!733192) b!1098638))

(assert (= (and b!1098638 c!108530) b!1098651))

(assert (= (and b!1098638 (not c!108530)) b!1098639))

(assert (= (and b!1098651 res!733189) b!1098646))

(assert (= (or b!1098651 b!1098639) bm!45923))

(declare-fun b_lambda!17845 () Bool)

(assert (=> (not b_lambda!17845) (not b!1098640)))

(assert (=> b!1098640 t!34065))

(declare-fun b_and!36895 () Bool)

(assert (= b_and!36889 (and (=> t!34065 result!16443) b_and!36895)))

(assert (=> bm!45922 m!1018187))

(declare-fun m!1018391 () Bool)

(assert (=> b!1098657 m!1018391))

(assert (=> b!1098657 m!1018391))

(declare-fun m!1018393 () Bool)

(assert (=> b!1098657 m!1018393))

(assert (=> b!1098640 m!1018391))

(declare-fun m!1018395 () Bool)

(assert (=> b!1098640 m!1018395))

(assert (=> b!1098640 m!1018391))

(assert (=> b!1098640 m!1018179))

(declare-fun m!1018397 () Bool)

(assert (=> b!1098640 m!1018397))

(assert (=> b!1098640 m!1018397))

(assert (=> b!1098640 m!1018179))

(declare-fun m!1018399 () Bool)

(assert (=> b!1098640 m!1018399))

(assert (=> d!130451 m!1018219))

(declare-fun m!1018401 () Bool)

(assert (=> bm!45920 m!1018401))

(declare-fun m!1018403 () Bool)

(assert (=> bm!45923 m!1018403))

(assert (=> b!1098641 m!1018391))

(assert (=> b!1098641 m!1018391))

(declare-fun m!1018405 () Bool)

(assert (=> b!1098641 m!1018405))

(declare-fun m!1018407 () Bool)

(assert (=> bm!45925 m!1018407))

(assert (=> b!1098647 m!1018391))

(assert (=> b!1098647 m!1018391))

(assert (=> b!1098647 m!1018393))

(declare-fun m!1018409 () Bool)

(assert (=> b!1098645 m!1018409))

(declare-fun m!1018411 () Bool)

(assert (=> b!1098645 m!1018411))

(declare-fun m!1018413 () Bool)

(assert (=> b!1098645 m!1018413))

(declare-fun m!1018415 () Bool)

(assert (=> b!1098645 m!1018415))

(declare-fun m!1018417 () Bool)

(assert (=> b!1098645 m!1018417))

(assert (=> b!1098645 m!1018413))

(declare-fun m!1018419 () Bool)

(assert (=> b!1098645 m!1018419))

(declare-fun m!1018421 () Bool)

(assert (=> b!1098645 m!1018421))

(declare-fun m!1018423 () Bool)

(assert (=> b!1098645 m!1018423))

(assert (=> b!1098645 m!1018391))

(declare-fun m!1018425 () Bool)

(assert (=> b!1098645 m!1018425))

(declare-fun m!1018427 () Bool)

(assert (=> b!1098645 m!1018427))

(declare-fun m!1018429 () Bool)

(assert (=> b!1098645 m!1018429))

(assert (=> b!1098645 m!1018187))

(declare-fun m!1018431 () Bool)

(assert (=> b!1098645 m!1018431))

(assert (=> b!1098645 m!1018421))

(declare-fun m!1018433 () Bool)

(assert (=> b!1098645 m!1018433))

(assert (=> b!1098645 m!1018417))

(declare-fun m!1018435 () Bool)

(assert (=> b!1098645 m!1018435))

(assert (=> b!1098645 m!1018427))

(declare-fun m!1018437 () Bool)

(assert (=> b!1098645 m!1018437))

(declare-fun m!1018439 () Bool)

(assert (=> b!1098658 m!1018439))

(declare-fun m!1018441 () Bool)

(assert (=> b!1098646 m!1018441))

(declare-fun m!1018443 () Bool)

(assert (=> b!1098650 m!1018443))

(assert (=> b!1098501 d!130451))

(declare-fun b!1098659 () Bool)

(declare-fun e!627077 () Bool)

(declare-fun e!627072 () Bool)

(assert (=> b!1098659 (= e!627077 e!627072)))

(declare-fun c!108536 () Bool)

(assert (=> b!1098659 (= c!108536 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1098660 () Bool)

(declare-fun call!45933 () Bool)

(assert (=> b!1098660 (= e!627072 (not call!45933))))

(declare-fun lt!491580 () ListLongMap!15277)

(declare-fun b!1098661 () Bool)

(declare-fun e!627071 () Bool)

(assert (=> b!1098661 (= e!627071 (= (apply!946 lt!491580 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)) (get!17622 (select (arr!34267 _values!874) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34803 _values!874)))))

(assert (=> b!1098661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun d!130453 () Bool)

(assert (=> d!130453 e!627077))

(declare-fun res!733203 () Bool)

(assert (=> d!130453 (=> (not res!733203) (not e!627077))))

(assert (=> d!130453 (= res!733203 (or (bvsge #b00000000000000000000000000000000 (size!34802 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))))

(declare-fun lt!491576 () ListLongMap!15277)

(assert (=> d!130453 (= lt!491580 lt!491576)))

(declare-fun lt!491588 () Unit!36124)

(declare-fun e!627070 () Unit!36124)

(assert (=> d!130453 (= lt!491588 e!627070)))

(declare-fun c!108538 () Bool)

(declare-fun e!627074 () Bool)

(assert (=> d!130453 (= c!108538 e!627074)))

(declare-fun res!733200 () Bool)

(assert (=> d!130453 (=> (not res!733200) (not e!627074))))

(assert (=> d!130453 (= res!733200 (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun e!627076 () ListLongMap!15277)

(assert (=> d!130453 (= lt!491576 e!627076)))

(declare-fun c!108541 () Bool)

(assert (=> d!130453 (= c!108541 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130453 (validMask!0 mask!1414)))

(assert (=> d!130453 (= (getCurrentListMap!4373 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491580)))

(declare-fun b!1098662 () Bool)

(declare-fun e!627075 () Bool)

(assert (=> b!1098662 (= e!627075 e!627071)))

(declare-fun res!733202 () Bool)

(assert (=> b!1098662 (=> (not res!733202) (not e!627071))))

(assert (=> b!1098662 (= res!733202 (contains!6386 lt!491580 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun b!1098663 () Bool)

(declare-fun res!733201 () Bool)

(assert (=> b!1098663 (=> (not res!733201) (not e!627077))))

(declare-fun e!627073 () Bool)

(assert (=> b!1098663 (= res!733201 e!627073)))

(declare-fun c!108540 () Bool)

(assert (=> b!1098663 (= c!108540 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098664 () Bool)

(declare-fun e!627068 () ListLongMap!15277)

(declare-fun call!45936 () ListLongMap!15277)

(assert (=> b!1098664 (= e!627068 call!45936)))

(declare-fun bm!45927 () Bool)

(declare-fun call!45934 () ListLongMap!15277)

(declare-fun call!45931 () ListLongMap!15277)

(declare-fun call!45932 () ListLongMap!15277)

(declare-fun call!45935 () ListLongMap!15277)

(declare-fun c!108537 () Bool)

(assert (=> bm!45927 (= call!45934 (+!3363 (ite c!108541 call!45931 (ite c!108537 call!45935 call!45932)) (ite (or c!108541 c!108537) (tuple2!17309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098665 () Bool)

(declare-fun Unit!36129 () Unit!36124)

(assert (=> b!1098665 (= e!627070 Unit!36129)))

(declare-fun bm!45928 () Bool)

(assert (=> bm!45928 (= call!45936 call!45934)))

(declare-fun b!1098666 () Bool)

(declare-fun lt!491572 () Unit!36124)

(assert (=> b!1098666 (= e!627070 lt!491572)))

(declare-fun lt!491573 () ListLongMap!15277)

(assert (=> b!1098666 (= lt!491573 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491584 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491592 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491592 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491585 () Unit!36124)

(assert (=> b!1098666 (= lt!491585 (addStillContains!659 lt!491573 lt!491584 zeroValue!831 lt!491592))))

(assert (=> b!1098666 (contains!6386 (+!3363 lt!491573 (tuple2!17309 lt!491584 zeroValue!831)) lt!491592)))

(declare-fun lt!491591 () Unit!36124)

(assert (=> b!1098666 (= lt!491591 lt!491585)))

(declare-fun lt!491579 () ListLongMap!15277)

(assert (=> b!1098666 (= lt!491579 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491574 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491587 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491587 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491590 () Unit!36124)

(assert (=> b!1098666 (= lt!491590 (addApplyDifferent!519 lt!491579 lt!491574 minValue!831 lt!491587))))

(assert (=> b!1098666 (= (apply!946 (+!3363 lt!491579 (tuple2!17309 lt!491574 minValue!831)) lt!491587) (apply!946 lt!491579 lt!491587))))

(declare-fun lt!491593 () Unit!36124)

(assert (=> b!1098666 (= lt!491593 lt!491590)))

(declare-fun lt!491589 () ListLongMap!15277)

(assert (=> b!1098666 (= lt!491589 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491583 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491578 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491578 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491577 () Unit!36124)

(assert (=> b!1098666 (= lt!491577 (addApplyDifferent!519 lt!491589 lt!491583 zeroValue!831 lt!491578))))

(assert (=> b!1098666 (= (apply!946 (+!3363 lt!491589 (tuple2!17309 lt!491583 zeroValue!831)) lt!491578) (apply!946 lt!491589 lt!491578))))

(declare-fun lt!491575 () Unit!36124)

(assert (=> b!1098666 (= lt!491575 lt!491577)))

(declare-fun lt!491586 () ListLongMap!15277)

(assert (=> b!1098666 (= lt!491586 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491581 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491581 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491582 () (_ BitVec 64))

(assert (=> b!1098666 (= lt!491582 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098666 (= lt!491572 (addApplyDifferent!519 lt!491586 lt!491581 minValue!831 lt!491582))))

(assert (=> b!1098666 (= (apply!946 (+!3363 lt!491586 (tuple2!17309 lt!491581 minValue!831)) lt!491582) (apply!946 lt!491586 lt!491582))))

(declare-fun b!1098667 () Bool)

(declare-fun e!627067 () Bool)

(assert (=> b!1098667 (= e!627067 (= (apply!946 lt!491580 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098668 () Bool)

(assert (=> b!1098668 (= e!627074 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098669 () Bool)

(declare-fun res!733204 () Bool)

(assert (=> b!1098669 (=> (not res!733204) (not e!627077))))

(assert (=> b!1098669 (= res!733204 e!627075)))

(declare-fun res!733199 () Bool)

(assert (=> b!1098669 (=> res!733199 e!627075)))

(declare-fun e!627078 () Bool)

(assert (=> b!1098669 (= res!733199 (not e!627078))))

(declare-fun res!733205 () Bool)

(assert (=> b!1098669 (=> (not res!733205) (not e!627078))))

(assert (=> b!1098669 (= res!733205 (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun b!1098670 () Bool)

(declare-fun c!108539 () Bool)

(assert (=> b!1098670 (= c!108539 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!627069 () ListLongMap!15277)

(assert (=> b!1098670 (= e!627068 e!627069)))

(declare-fun b!1098671 () Bool)

(assert (=> b!1098671 (= e!627076 (+!3363 call!45934 (tuple2!17309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45929 () Bool)

(assert (=> bm!45929 (= call!45931 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45930 () Bool)

(assert (=> bm!45930 (= call!45933 (contains!6386 lt!491580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098672 () Bool)

(assert (=> b!1098672 (= e!627072 e!627067)))

(declare-fun res!733198 () Bool)

(assert (=> b!1098672 (= res!733198 call!45933)))

(assert (=> b!1098672 (=> (not res!733198) (not e!627067))))

(declare-fun b!1098673 () Bool)

(assert (=> b!1098673 (= e!627076 e!627068)))

(assert (=> b!1098673 (= c!108537 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45931 () Bool)

(assert (=> bm!45931 (= call!45932 call!45935)))

(declare-fun bm!45932 () Bool)

(declare-fun call!45930 () Bool)

(assert (=> bm!45932 (= call!45930 (contains!6386 lt!491580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098674 () Bool)

(assert (=> b!1098674 (= e!627073 (not call!45930))))

(declare-fun b!1098675 () Bool)

(assert (=> b!1098675 (= e!627069 call!45932)))

(declare-fun b!1098676 () Bool)

(declare-fun e!627079 () Bool)

(assert (=> b!1098676 (= e!627073 e!627079)))

(declare-fun res!733197 () Bool)

(assert (=> b!1098676 (= res!733197 call!45930)))

(assert (=> b!1098676 (=> (not res!733197) (not e!627079))))

(declare-fun b!1098677 () Bool)

(assert (=> b!1098677 (= e!627069 call!45936)))

(declare-fun b!1098678 () Bool)

(assert (=> b!1098678 (= e!627078 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45933 () Bool)

(assert (=> bm!45933 (= call!45935 call!45931)))

(declare-fun b!1098679 () Bool)

(assert (=> b!1098679 (= e!627079 (= (apply!946 lt!491580 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(assert (= (and d!130453 c!108541) b!1098671))

(assert (= (and d!130453 (not c!108541)) b!1098673))

(assert (= (and b!1098673 c!108537) b!1098664))

(assert (= (and b!1098673 (not c!108537)) b!1098670))

(assert (= (and b!1098670 c!108539) b!1098677))

(assert (= (and b!1098670 (not c!108539)) b!1098675))

(assert (= (or b!1098677 b!1098675) bm!45931))

(assert (= (or b!1098664 bm!45931) bm!45933))

(assert (= (or b!1098664 b!1098677) bm!45928))

(assert (= (or b!1098671 bm!45933) bm!45929))

(assert (= (or b!1098671 bm!45928) bm!45927))

(assert (= (and d!130453 res!733200) b!1098668))

(assert (= (and d!130453 c!108538) b!1098666))

(assert (= (and d!130453 (not c!108538)) b!1098665))

(assert (= (and d!130453 res!733203) b!1098669))

(assert (= (and b!1098669 res!733205) b!1098678))

(assert (= (and b!1098669 (not res!733199)) b!1098662))

(assert (= (and b!1098662 res!733202) b!1098661))

(assert (= (and b!1098669 res!733204) b!1098663))

(assert (= (and b!1098663 c!108540) b!1098676))

(assert (= (and b!1098663 (not c!108540)) b!1098674))

(assert (= (and b!1098676 res!733197) b!1098679))

(assert (= (or b!1098676 b!1098674) bm!45932))

(assert (= (and b!1098663 res!733201) b!1098659))

(assert (= (and b!1098659 c!108536) b!1098672))

(assert (= (and b!1098659 (not c!108536)) b!1098660))

(assert (= (and b!1098672 res!733198) b!1098667))

(assert (= (or b!1098672 b!1098660) bm!45930))

(declare-fun b_lambda!17847 () Bool)

(assert (=> (not b_lambda!17847) (not b!1098661)))

(assert (=> b!1098661 t!34065))

(declare-fun b_and!36897 () Bool)

(assert (= b_and!36895 (and (=> t!34065 result!16443) b_and!36897)))

(assert (=> bm!45929 m!1018197))

(assert (=> b!1098678 m!1018289))

(assert (=> b!1098678 m!1018289))

(assert (=> b!1098678 m!1018291))

(assert (=> b!1098661 m!1018289))

(declare-fun m!1018445 () Bool)

(assert (=> b!1098661 m!1018445))

(assert (=> b!1098661 m!1018289))

(assert (=> b!1098661 m!1018179))

(declare-fun m!1018447 () Bool)

(assert (=> b!1098661 m!1018447))

(assert (=> b!1098661 m!1018447))

(assert (=> b!1098661 m!1018179))

(declare-fun m!1018449 () Bool)

(assert (=> b!1098661 m!1018449))

(assert (=> d!130453 m!1018219))

(declare-fun m!1018451 () Bool)

(assert (=> bm!45927 m!1018451))

(declare-fun m!1018453 () Bool)

(assert (=> bm!45930 m!1018453))

(assert (=> b!1098662 m!1018289))

(assert (=> b!1098662 m!1018289))

(declare-fun m!1018455 () Bool)

(assert (=> b!1098662 m!1018455))

(declare-fun m!1018457 () Bool)

(assert (=> bm!45932 m!1018457))

(assert (=> b!1098668 m!1018289))

(assert (=> b!1098668 m!1018289))

(assert (=> b!1098668 m!1018291))

(declare-fun m!1018459 () Bool)

(assert (=> b!1098666 m!1018459))

(declare-fun m!1018461 () Bool)

(assert (=> b!1098666 m!1018461))

(declare-fun m!1018463 () Bool)

(assert (=> b!1098666 m!1018463))

(declare-fun m!1018465 () Bool)

(assert (=> b!1098666 m!1018465))

(declare-fun m!1018467 () Bool)

(assert (=> b!1098666 m!1018467))

(assert (=> b!1098666 m!1018463))

(declare-fun m!1018469 () Bool)

(assert (=> b!1098666 m!1018469))

(declare-fun m!1018471 () Bool)

(assert (=> b!1098666 m!1018471))

(declare-fun m!1018473 () Bool)

(assert (=> b!1098666 m!1018473))

(assert (=> b!1098666 m!1018289))

(declare-fun m!1018475 () Bool)

(assert (=> b!1098666 m!1018475))

(declare-fun m!1018477 () Bool)

(assert (=> b!1098666 m!1018477))

(declare-fun m!1018479 () Bool)

(assert (=> b!1098666 m!1018479))

(assert (=> b!1098666 m!1018197))

(declare-fun m!1018481 () Bool)

(assert (=> b!1098666 m!1018481))

(assert (=> b!1098666 m!1018471))

(declare-fun m!1018483 () Bool)

(assert (=> b!1098666 m!1018483))

(assert (=> b!1098666 m!1018467))

(declare-fun m!1018485 () Bool)

(assert (=> b!1098666 m!1018485))

(assert (=> b!1098666 m!1018477))

(declare-fun m!1018487 () Bool)

(assert (=> b!1098666 m!1018487))

(declare-fun m!1018489 () Bool)

(assert (=> b!1098679 m!1018489))

(declare-fun m!1018491 () Bool)

(assert (=> b!1098667 m!1018491))

(declare-fun m!1018493 () Bool)

(assert (=> b!1098671 m!1018493))

(assert (=> b!1098501 d!130453))

(declare-fun b!1098704 () Bool)

(declare-fun e!627100 () ListLongMap!15277)

(declare-fun e!627096 () ListLongMap!15277)

(assert (=> b!1098704 (= e!627100 e!627096)))

(declare-fun c!108552 () Bool)

(assert (=> b!1098704 (= c!108552 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun b!1098705 () Bool)

(declare-fun e!627097 () Bool)

(declare-fun e!627095 () Bool)

(assert (=> b!1098705 (= e!627097 e!627095)))

(assert (=> b!1098705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun res!733216 () Bool)

(declare-fun lt!491613 () ListLongMap!15277)

(assert (=> b!1098705 (= res!733216 (contains!6386 lt!491613 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(assert (=> b!1098705 (=> (not res!733216) (not e!627095))))

(declare-fun d!130455 () Bool)

(declare-fun e!627094 () Bool)

(assert (=> d!130455 e!627094))

(declare-fun res!733217 () Bool)

(assert (=> d!130455 (=> (not res!733217) (not e!627094))))

(assert (=> d!130455 (= res!733217 (not (contains!6386 lt!491613 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130455 (= lt!491613 e!627100)))

(declare-fun c!108550 () Bool)

(assert (=> d!130455 (= c!108550 (bvsge #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(assert (=> d!130455 (validMask!0 mask!1414)))

(assert (=> d!130455 (= (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491613)))

(declare-fun b!1098706 () Bool)

(declare-fun call!45939 () ListLongMap!15277)

(assert (=> b!1098706 (= e!627096 call!45939)))

(declare-fun b!1098707 () Bool)

(declare-fun e!627098 () Bool)

(assert (=> b!1098707 (= e!627098 (= lt!491613 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098708 () Bool)

(declare-fun res!733215 () Bool)

(assert (=> b!1098708 (=> (not res!733215) (not e!627094))))

(assert (=> b!1098708 (= res!733215 (not (contains!6386 lt!491613 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098709 () Bool)

(declare-fun lt!491614 () Unit!36124)

(declare-fun lt!491610 () Unit!36124)

(assert (=> b!1098709 (= lt!491614 lt!491610)))

(declare-fun lt!491612 () ListLongMap!15277)

(declare-fun lt!491608 () V!41315)

(declare-fun lt!491611 () (_ BitVec 64))

(declare-fun lt!491609 () (_ BitVec 64))

(assert (=> b!1098709 (not (contains!6386 (+!3363 lt!491612 (tuple2!17309 lt!491611 lt!491608)) lt!491609))))

(declare-fun addStillNotContains!274 (ListLongMap!15277 (_ BitVec 64) V!41315 (_ BitVec 64)) Unit!36124)

(assert (=> b!1098709 (= lt!491610 (addStillNotContains!274 lt!491612 lt!491611 lt!491608 lt!491609))))

(assert (=> b!1098709 (= lt!491609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098709 (= lt!491608 (get!17622 (select (arr!34267 lt!491407) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098709 (= lt!491611 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(assert (=> b!1098709 (= lt!491612 call!45939)))

(assert (=> b!1098709 (= e!627096 (+!3363 call!45939 (tuple2!17309 (select (arr!34266 lt!491404) #b00000000000000000000000000000000) (get!17622 (select (arr!34267 lt!491407) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098710 () Bool)

(assert (=> b!1098710 (= e!627100 (ListLongMap!15278 Nil!23927))))

(declare-fun b!1098711 () Bool)

(assert (=> b!1098711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(assert (=> b!1098711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34803 lt!491407)))))

(assert (=> b!1098711 (= e!627095 (= (apply!946 lt!491613 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)) (get!17622 (select (arr!34267 lt!491407) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45936 () Bool)

(assert (=> bm!45936 (= call!45939 (getCurrentListMapNoExtraKeys!4169 lt!491404 lt!491407 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098712 () Bool)

(assert (=> b!1098712 (= e!627097 e!627098)))

(declare-fun c!108553 () Bool)

(assert (=> b!1098712 (= c!108553 (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun b!1098713 () Bool)

(declare-fun e!627099 () Bool)

(assert (=> b!1098713 (= e!627099 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(assert (=> b!1098713 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1098714 () Bool)

(assert (=> b!1098714 (= e!627094 e!627097)))

(declare-fun c!108551 () Bool)

(assert (=> b!1098714 (= c!108551 e!627099)))

(declare-fun res!733214 () Bool)

(assert (=> b!1098714 (=> (not res!733214) (not e!627099))))

(assert (=> b!1098714 (= res!733214 (bvslt #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(declare-fun b!1098715 () Bool)

(declare-fun isEmpty!964 (ListLongMap!15277) Bool)

(assert (=> b!1098715 (= e!627098 (isEmpty!964 lt!491613))))

(assert (= (and d!130455 c!108550) b!1098710))

(assert (= (and d!130455 (not c!108550)) b!1098704))

(assert (= (and b!1098704 c!108552) b!1098709))

(assert (= (and b!1098704 (not c!108552)) b!1098706))

(assert (= (or b!1098709 b!1098706) bm!45936))

(assert (= (and d!130455 res!733217) b!1098708))

(assert (= (and b!1098708 res!733215) b!1098714))

(assert (= (and b!1098714 res!733214) b!1098713))

(assert (= (and b!1098714 c!108551) b!1098705))

(assert (= (and b!1098714 (not c!108551)) b!1098712))

(assert (= (and b!1098705 res!733216) b!1098711))

(assert (= (and b!1098712 c!108553) b!1098707))

(assert (= (and b!1098712 (not c!108553)) b!1098715))

(declare-fun b_lambda!17849 () Bool)

(assert (=> (not b_lambda!17849) (not b!1098709)))

(assert (=> b!1098709 t!34065))

(declare-fun b_and!36899 () Bool)

(assert (= b_and!36897 (and (=> t!34065 result!16443) b_and!36899)))

(declare-fun b_lambda!17851 () Bool)

(assert (=> (not b_lambda!17851) (not b!1098711)))

(assert (=> b!1098711 t!34065))

(declare-fun b_and!36901 () Bool)

(assert (= b_and!36899 (and (=> t!34065 result!16443) b_and!36901)))

(declare-fun m!1018495 () Bool)

(assert (=> d!130455 m!1018495))

(assert (=> d!130455 m!1018219))

(assert (=> b!1098711 m!1018179))

(assert (=> b!1098711 m!1018391))

(declare-fun m!1018497 () Bool)

(assert (=> b!1098711 m!1018497))

(assert (=> b!1098711 m!1018397))

(assert (=> b!1098711 m!1018179))

(assert (=> b!1098711 m!1018399))

(assert (=> b!1098711 m!1018397))

(assert (=> b!1098711 m!1018391))

(assert (=> b!1098704 m!1018391))

(assert (=> b!1098704 m!1018391))

(assert (=> b!1098704 m!1018393))

(declare-fun m!1018499 () Bool)

(assert (=> bm!45936 m!1018499))

(declare-fun m!1018501 () Bool)

(assert (=> b!1098708 m!1018501))

(assert (=> b!1098705 m!1018391))

(assert (=> b!1098705 m!1018391))

(declare-fun m!1018503 () Bool)

(assert (=> b!1098705 m!1018503))

(assert (=> b!1098707 m!1018499))

(assert (=> b!1098709 m!1018179))

(declare-fun m!1018505 () Bool)

(assert (=> b!1098709 m!1018505))

(assert (=> b!1098709 m!1018505))

(declare-fun m!1018507 () Bool)

(assert (=> b!1098709 m!1018507))

(declare-fun m!1018509 () Bool)

(assert (=> b!1098709 m!1018509))

(declare-fun m!1018511 () Bool)

(assert (=> b!1098709 m!1018511))

(assert (=> b!1098709 m!1018397))

(assert (=> b!1098709 m!1018179))

(assert (=> b!1098709 m!1018399))

(assert (=> b!1098709 m!1018397))

(assert (=> b!1098709 m!1018391))

(assert (=> b!1098713 m!1018391))

(assert (=> b!1098713 m!1018391))

(assert (=> b!1098713 m!1018393))

(declare-fun m!1018513 () Bool)

(assert (=> b!1098715 m!1018513))

(assert (=> b!1098501 d!130455))

(declare-fun d!130457 () Bool)

(declare-fun lt!491615 () ListLongMap!15277)

(assert (=> d!130457 (not (contains!6386 lt!491615 k0!904))))

(assert (=> d!130457 (= lt!491615 (ListLongMap!15278 (removeStrictlySorted!80 (toList!7654 lt!491405) k0!904)))))

(assert (=> d!130457 (= (-!943 lt!491405 k0!904) lt!491615)))

(declare-fun bs!32274 () Bool)

(assert (= bs!32274 d!130457))

(declare-fun m!1018515 () Bool)

(assert (=> bs!32274 m!1018515))

(declare-fun m!1018517 () Bool)

(assert (=> bs!32274 m!1018517))

(assert (=> b!1098501 d!130457))

(declare-fun bm!45941 () Bool)

(declare-fun call!45944 () ListLongMap!15277)

(assert (=> bm!45941 (= call!45944 (getCurrentListMapNoExtraKeys!4169 (array!71196 (store (arr!34266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34802 _keys!1070)) (array!71198 (store (arr!34267 _values!874) i!650 (ValueCellFull!12861 (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34803 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45942 () Bool)

(declare-fun call!45945 () ListLongMap!15277)

(assert (=> bm!45942 (= call!45945 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098722 () Bool)

(declare-fun e!627106 () Bool)

(assert (=> b!1098722 (= e!627106 (= call!45944 (-!943 call!45945 k0!904)))))

(assert (=> b!1098722 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34803 _values!874)))))

(declare-fun d!130459 () Bool)

(declare-fun e!627105 () Bool)

(assert (=> d!130459 e!627105))

(declare-fun res!733220 () Bool)

(assert (=> d!130459 (=> (not res!733220) (not e!627105))))

(assert (=> d!130459 (= res!733220 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34802 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34802 _keys!1070))))))))

(declare-fun lt!491618 () Unit!36124)

(declare-fun choose!1765 (array!71195 array!71197 (_ BitVec 32) (_ BitVec 32) V!41315 V!41315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36124)

(assert (=> d!130459 (= lt!491618 (choose!1765 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(assert (=> d!130459 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491618)))

(declare-fun b!1098723 () Bool)

(assert (=> b!1098723 (= e!627106 (= call!45944 call!45945))))

(assert (=> b!1098723 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34803 _values!874)))))

(declare-fun b!1098724 () Bool)

(assert (=> b!1098724 (= e!627105 e!627106)))

(declare-fun c!108556 () Bool)

(assert (=> b!1098724 (= c!108556 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130459 res!733220) b!1098724))

(assert (= (and b!1098724 c!108556) b!1098722))

(assert (= (and b!1098724 (not c!108556)) b!1098723))

(assert (= (or b!1098722 b!1098723) bm!45942))

(assert (= (or b!1098722 b!1098723) bm!45941))

(declare-fun b_lambda!17853 () Bool)

(assert (=> (not b_lambda!17853) (not bm!45941)))

(assert (=> bm!45941 t!34065))

(declare-fun b_and!36903 () Bool)

(assert (= b_and!36901 (and (=> t!34065 result!16443) b_and!36903)))

(assert (=> bm!45941 m!1018175))

(assert (=> bm!45941 m!1018179))

(assert (=> bm!45941 m!1018181))

(declare-fun m!1018519 () Bool)

(assert (=> bm!45941 m!1018519))

(assert (=> bm!45942 m!1018197))

(declare-fun m!1018521 () Bool)

(assert (=> b!1098722 m!1018521))

(declare-fun m!1018523 () Bool)

(assert (=> d!130459 m!1018523))

(assert (=> b!1098501 d!130459))

(declare-fun b!1098725 () Bool)

(declare-fun e!627113 () ListLongMap!15277)

(declare-fun e!627109 () ListLongMap!15277)

(assert (=> b!1098725 (= e!627113 e!627109)))

(declare-fun c!108559 () Bool)

(assert (=> b!1098725 (= c!108559 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098726 () Bool)

(declare-fun e!627110 () Bool)

(declare-fun e!627108 () Bool)

(assert (=> b!1098726 (= e!627110 e!627108)))

(assert (=> b!1098726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun res!733223 () Bool)

(declare-fun lt!491624 () ListLongMap!15277)

(assert (=> b!1098726 (= res!733223 (contains!6386 lt!491624 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098726 (=> (not res!733223) (not e!627108))))

(declare-fun d!130461 () Bool)

(declare-fun e!627107 () Bool)

(assert (=> d!130461 e!627107))

(declare-fun res!733224 () Bool)

(assert (=> d!130461 (=> (not res!733224) (not e!627107))))

(assert (=> d!130461 (= res!733224 (not (contains!6386 lt!491624 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130461 (= lt!491624 e!627113)))

(declare-fun c!108557 () Bool)

(assert (=> d!130461 (= c!108557 (bvsge #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(assert (=> d!130461 (validMask!0 mask!1414)))

(assert (=> d!130461 (= (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491624)))

(declare-fun b!1098727 () Bool)

(declare-fun call!45946 () ListLongMap!15277)

(assert (=> b!1098727 (= e!627109 call!45946)))

(declare-fun e!627111 () Bool)

(declare-fun b!1098728 () Bool)

(assert (=> b!1098728 (= e!627111 (= lt!491624 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098729 () Bool)

(declare-fun res!733222 () Bool)

(assert (=> b!1098729 (=> (not res!733222) (not e!627107))))

(assert (=> b!1098729 (= res!733222 (not (contains!6386 lt!491624 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098730 () Bool)

(declare-fun lt!491625 () Unit!36124)

(declare-fun lt!491621 () Unit!36124)

(assert (=> b!1098730 (= lt!491625 lt!491621)))

(declare-fun lt!491622 () (_ BitVec 64))

(declare-fun lt!491623 () ListLongMap!15277)

(declare-fun lt!491619 () V!41315)

(declare-fun lt!491620 () (_ BitVec 64))

(assert (=> b!1098730 (not (contains!6386 (+!3363 lt!491623 (tuple2!17309 lt!491622 lt!491619)) lt!491620))))

(assert (=> b!1098730 (= lt!491621 (addStillNotContains!274 lt!491623 lt!491622 lt!491619 lt!491620))))

(assert (=> b!1098730 (= lt!491620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098730 (= lt!491619 (get!17622 (select (arr!34267 _values!874) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098730 (= lt!491622 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098730 (= lt!491623 call!45946)))

(assert (=> b!1098730 (= e!627109 (+!3363 call!45946 (tuple2!17309 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000) (get!17622 (select (arr!34267 _values!874) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098731 () Bool)

(assert (=> b!1098731 (= e!627113 (ListLongMap!15278 Nil!23927))))

(declare-fun b!1098732 () Bool)

(assert (=> b!1098732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(assert (=> b!1098732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34803 _values!874)))))

(assert (=> b!1098732 (= e!627108 (= (apply!946 lt!491624 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)) (get!17622 (select (arr!34267 _values!874) #b00000000000000000000000000000000) (dynLambda!2304 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45943 () Bool)

(assert (=> bm!45943 (= call!45946 (getCurrentListMapNoExtraKeys!4169 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098733 () Bool)

(assert (=> b!1098733 (= e!627110 e!627111)))

(declare-fun c!108560 () Bool)

(assert (=> b!1098733 (= c!108560 (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun b!1098734 () Bool)

(declare-fun e!627112 () Bool)

(assert (=> b!1098734 (= e!627112 (validKeyInArray!0 (select (arr!34266 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098734 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1098735 () Bool)

(assert (=> b!1098735 (= e!627107 e!627110)))

(declare-fun c!108558 () Bool)

(assert (=> b!1098735 (= c!108558 e!627112)))

(declare-fun res!733221 () Bool)

(assert (=> b!1098735 (=> (not res!733221) (not e!627112))))

(assert (=> b!1098735 (= res!733221 (bvslt #b00000000000000000000000000000000 (size!34802 _keys!1070)))))

(declare-fun b!1098736 () Bool)

(assert (=> b!1098736 (= e!627111 (isEmpty!964 lt!491624))))

(assert (= (and d!130461 c!108557) b!1098731))

(assert (= (and d!130461 (not c!108557)) b!1098725))

(assert (= (and b!1098725 c!108559) b!1098730))

(assert (= (and b!1098725 (not c!108559)) b!1098727))

(assert (= (or b!1098730 b!1098727) bm!45943))

(assert (= (and d!130461 res!733224) b!1098729))

(assert (= (and b!1098729 res!733222) b!1098735))

(assert (= (and b!1098735 res!733221) b!1098734))

(assert (= (and b!1098735 c!108558) b!1098726))

(assert (= (and b!1098735 (not c!108558)) b!1098733))

(assert (= (and b!1098726 res!733223) b!1098732))

(assert (= (and b!1098733 c!108560) b!1098728))

(assert (= (and b!1098733 (not c!108560)) b!1098736))

(declare-fun b_lambda!17855 () Bool)

(assert (=> (not b_lambda!17855) (not b!1098730)))

(assert (=> b!1098730 t!34065))

(declare-fun b_and!36905 () Bool)

(assert (= b_and!36903 (and (=> t!34065 result!16443) b_and!36905)))

(declare-fun b_lambda!17857 () Bool)

(assert (=> (not b_lambda!17857) (not b!1098732)))

(assert (=> b!1098732 t!34065))

(declare-fun b_and!36907 () Bool)

(assert (= b_and!36905 (and (=> t!34065 result!16443) b_and!36907)))

(declare-fun m!1018525 () Bool)

(assert (=> d!130461 m!1018525))

(assert (=> d!130461 m!1018219))

(assert (=> b!1098732 m!1018179))

(assert (=> b!1098732 m!1018289))

(declare-fun m!1018527 () Bool)

(assert (=> b!1098732 m!1018527))

(assert (=> b!1098732 m!1018447))

(assert (=> b!1098732 m!1018179))

(assert (=> b!1098732 m!1018449))

(assert (=> b!1098732 m!1018447))

(assert (=> b!1098732 m!1018289))

(assert (=> b!1098725 m!1018289))

(assert (=> b!1098725 m!1018289))

(assert (=> b!1098725 m!1018291))

(declare-fun m!1018529 () Bool)

(assert (=> bm!45943 m!1018529))

(declare-fun m!1018531 () Bool)

(assert (=> b!1098729 m!1018531))

(assert (=> b!1098726 m!1018289))

(assert (=> b!1098726 m!1018289))

(declare-fun m!1018533 () Bool)

(assert (=> b!1098726 m!1018533))

(assert (=> b!1098728 m!1018529))

(assert (=> b!1098730 m!1018179))

(declare-fun m!1018535 () Bool)

(assert (=> b!1098730 m!1018535))

(assert (=> b!1098730 m!1018535))

(declare-fun m!1018537 () Bool)

(assert (=> b!1098730 m!1018537))

(declare-fun m!1018539 () Bool)

(assert (=> b!1098730 m!1018539))

(declare-fun m!1018541 () Bool)

(assert (=> b!1098730 m!1018541))

(assert (=> b!1098730 m!1018447))

(assert (=> b!1098730 m!1018179))

(assert (=> b!1098730 m!1018449))

(assert (=> b!1098730 m!1018447))

(assert (=> b!1098730 m!1018289))

(assert (=> b!1098734 m!1018289))

(assert (=> b!1098734 m!1018289))

(assert (=> b!1098734 m!1018291))

(declare-fun m!1018543 () Bool)

(assert (=> b!1098736 m!1018543))

(assert (=> b!1098501 d!130461))

(declare-fun d!130463 () Bool)

(assert (=> d!130463 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491628 () Unit!36124)

(declare-fun choose!13 (array!71195 (_ BitVec 64) (_ BitVec 32)) Unit!36124)

(assert (=> d!130463 (= lt!491628 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130463 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130463 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491628)))

(declare-fun bs!32275 () Bool)

(assert (= bs!32275 d!130463))

(assert (=> bs!32275 m!1018185))

(declare-fun m!1018545 () Bool)

(assert (=> bs!32275 m!1018545))

(assert (=> b!1098501 d!130463))

(declare-fun b!1098737 () Bool)

(declare-fun e!627114 () Bool)

(declare-fun call!45947 () Bool)

(assert (=> b!1098737 (= e!627114 call!45947)))

(declare-fun b!1098738 () Bool)

(declare-fun e!627117 () Bool)

(declare-fun e!627116 () Bool)

(assert (=> b!1098738 (= e!627117 e!627116)))

(declare-fun res!733226 () Bool)

(assert (=> b!1098738 (=> (not res!733226) (not e!627116))))

(declare-fun e!627115 () Bool)

(assert (=> b!1098738 (= res!733226 (not e!627115))))

(declare-fun res!733227 () Bool)

(assert (=> b!1098738 (=> (not res!733227) (not e!627115))))

(assert (=> b!1098738 (= res!733227 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun b!1098739 () Bool)

(assert (=> b!1098739 (= e!627114 call!45947)))

(declare-fun bm!45944 () Bool)

(declare-fun c!108561 () Bool)

(assert (=> bm!45944 (= call!45947 (arrayNoDuplicates!0 lt!491404 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108561 (Cons!23925 (select (arr!34266 lt!491404) #b00000000000000000000000000000000) Nil!23926) Nil!23926)))))

(declare-fun b!1098740 () Bool)

(assert (=> b!1098740 (= e!627115 (contains!6388 Nil!23926 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun b!1098741 () Bool)

(assert (=> b!1098741 (= e!627116 e!627114)))

(assert (=> b!1098741 (= c!108561 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun d!130465 () Bool)

(declare-fun res!733225 () Bool)

(assert (=> d!130465 (=> res!733225 e!627117)))

(assert (=> d!130465 (= res!733225 (bvsge #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(assert (=> d!130465 (= (arrayNoDuplicates!0 lt!491404 #b00000000000000000000000000000000 Nil!23926) e!627117)))

(assert (= (and d!130465 (not res!733225)) b!1098738))

(assert (= (and b!1098738 res!733227) b!1098740))

(assert (= (and b!1098738 res!733226) b!1098741))

(assert (= (and b!1098741 c!108561) b!1098737))

(assert (= (and b!1098741 (not c!108561)) b!1098739))

(assert (= (or b!1098737 b!1098739) bm!45944))

(assert (=> b!1098738 m!1018391))

(assert (=> b!1098738 m!1018391))

(assert (=> b!1098738 m!1018393))

(assert (=> bm!45944 m!1018391))

(declare-fun m!1018547 () Bool)

(assert (=> bm!45944 m!1018547))

(assert (=> b!1098740 m!1018391))

(assert (=> b!1098740 m!1018391))

(declare-fun m!1018549 () Bool)

(assert (=> b!1098740 m!1018549))

(assert (=> b!1098741 m!1018391))

(assert (=> b!1098741 m!1018391))

(assert (=> b!1098741 m!1018393))

(assert (=> b!1098493 d!130465))

(declare-fun b!1098742 () Bool)

(declare-fun e!627119 () Bool)

(declare-fun call!45948 () Bool)

(assert (=> b!1098742 (= e!627119 call!45948)))

(declare-fun b!1098743 () Bool)

(declare-fun e!627120 () Bool)

(declare-fun e!627118 () Bool)

(assert (=> b!1098743 (= e!627120 e!627118)))

(declare-fun c!108562 () Bool)

(assert (=> b!1098743 (= c!108562 (validKeyInArray!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000)))))

(declare-fun bm!45945 () Bool)

(assert (=> bm!45945 (= call!45948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491404 mask!1414))))

(declare-fun d!130467 () Bool)

(declare-fun res!733228 () Bool)

(assert (=> d!130467 (=> res!733228 e!627120)))

(assert (=> d!130467 (= res!733228 (bvsge #b00000000000000000000000000000000 (size!34802 lt!491404)))))

(assert (=> d!130467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491404 mask!1414) e!627120)))

(declare-fun b!1098744 () Bool)

(assert (=> b!1098744 (= e!627118 e!627119)))

(declare-fun lt!491630 () (_ BitVec 64))

(assert (=> b!1098744 (= lt!491630 (select (arr!34266 lt!491404) #b00000000000000000000000000000000))))

(declare-fun lt!491629 () Unit!36124)

(assert (=> b!1098744 (= lt!491629 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491404 lt!491630 #b00000000000000000000000000000000))))

(assert (=> b!1098744 (arrayContainsKey!0 lt!491404 lt!491630 #b00000000000000000000000000000000)))

(declare-fun lt!491631 () Unit!36124)

(assert (=> b!1098744 (= lt!491631 lt!491629)))

(declare-fun res!733229 () Bool)

(assert (=> b!1098744 (= res!733229 (= (seekEntryOrOpen!0 (select (arr!34266 lt!491404) #b00000000000000000000000000000000) lt!491404 mask!1414) (Found!9909 #b00000000000000000000000000000000)))))

(assert (=> b!1098744 (=> (not res!733229) (not e!627119))))

(declare-fun b!1098745 () Bool)

(assert (=> b!1098745 (= e!627118 call!45948)))

(assert (= (and d!130467 (not res!733228)) b!1098743))

(assert (= (and b!1098743 c!108562) b!1098744))

(assert (= (and b!1098743 (not c!108562)) b!1098745))

(assert (= (and b!1098744 res!733229) b!1098742))

(assert (= (or b!1098742 b!1098745) bm!45945))

(assert (=> b!1098743 m!1018391))

(assert (=> b!1098743 m!1018391))

(assert (=> b!1098743 m!1018393))

(declare-fun m!1018551 () Bool)

(assert (=> bm!45945 m!1018551))

(assert (=> b!1098744 m!1018391))

(declare-fun m!1018553 () Bool)

(assert (=> b!1098744 m!1018553))

(declare-fun m!1018555 () Bool)

(assert (=> b!1098744 m!1018555))

(assert (=> b!1098744 m!1018391))

(declare-fun m!1018557 () Bool)

(assert (=> b!1098744 m!1018557))

(assert (=> b!1098492 d!130467))

(declare-fun condMapEmpty!42487 () Bool)

(declare-fun mapDefault!42487 () ValueCell!12861)

(assert (=> mapNonEmpty!42481 (= condMapEmpty!42487 (= mapRest!42481 ((as const (Array (_ BitVec 32) ValueCell!12861)) mapDefault!42487)))))

(declare-fun e!627125 () Bool)

(declare-fun mapRes!42487 () Bool)

(assert (=> mapNonEmpty!42481 (= tp!81209 (and e!627125 mapRes!42487))))

(declare-fun b!1098753 () Bool)

(assert (=> b!1098753 (= e!627125 tp_is_empty!27141)))

(declare-fun b!1098752 () Bool)

(declare-fun e!627126 () Bool)

(assert (=> b!1098752 (= e!627126 tp_is_empty!27141)))

(declare-fun mapIsEmpty!42487 () Bool)

(assert (=> mapIsEmpty!42487 mapRes!42487))

(declare-fun mapNonEmpty!42487 () Bool)

(declare-fun tp!81218 () Bool)

(assert (=> mapNonEmpty!42487 (= mapRes!42487 (and tp!81218 e!627126))))

(declare-fun mapRest!42487 () (Array (_ BitVec 32) ValueCell!12861))

(declare-fun mapValue!42487 () ValueCell!12861)

(declare-fun mapKey!42487 () (_ BitVec 32))

(assert (=> mapNonEmpty!42487 (= mapRest!42481 (store mapRest!42487 mapKey!42487 mapValue!42487))))

(assert (= (and mapNonEmpty!42481 condMapEmpty!42487) mapIsEmpty!42487))

(assert (= (and mapNonEmpty!42481 (not condMapEmpty!42487)) mapNonEmpty!42487))

(assert (= (and mapNonEmpty!42487 ((_ is ValueCellFull!12861) mapValue!42487)) b!1098752))

(assert (= (and mapNonEmpty!42481 ((_ is ValueCellFull!12861) mapDefault!42487)) b!1098753))

(declare-fun m!1018559 () Bool)

(assert (=> mapNonEmpty!42487 m!1018559))

(declare-fun b_lambda!17859 () Bool)

(assert (= b_lambda!17845 (or (and start!96590 b_free!23091) b_lambda!17859)))

(declare-fun b_lambda!17861 () Bool)

(assert (= b_lambda!17855 (or (and start!96590 b_free!23091) b_lambda!17861)))

(declare-fun b_lambda!17863 () Bool)

(assert (= b_lambda!17851 (or (and start!96590 b_free!23091) b_lambda!17863)))

(declare-fun b_lambda!17865 () Bool)

(assert (= b_lambda!17849 (or (and start!96590 b_free!23091) b_lambda!17865)))

(declare-fun b_lambda!17867 () Bool)

(assert (= b_lambda!17853 (or (and start!96590 b_free!23091) b_lambda!17867)))

(declare-fun b_lambda!17869 () Bool)

(assert (= b_lambda!17857 (or (and start!96590 b_free!23091) b_lambda!17869)))

(declare-fun b_lambda!17871 () Bool)

(assert (= b_lambda!17847 (or (and start!96590 b_free!23091) b_lambda!17871)))

(check-sat (not b_next!23091) (not b!1098640) (not bm!45932) (not bm!45929) (not bm!45944) (not bm!45927) (not b!1098729) (not b!1098573) (not b_lambda!17865) (not b!1098709) (not b!1098738) (not b!1098741) (not b!1098708) (not b!1098734) (not b!1098567) (not b!1098658) (not b!1098565) (not b_lambda!17867) (not b!1098736) (not b!1098662) (not b!1098569) (not b!1098646) (not d!130425) (not b!1098667) (not b!1098704) (not b!1098743) (not bm!45945) (not b!1098570) (not b!1098661) (not b!1098650) (not b!1098589) (not bm!45902) (not b!1098668) (not d!130457) (not b!1098726) (not b!1098557) (not b!1098574) (not b!1098563) (not b!1098556) (not b!1098571) (not b!1098705) (not d!130427) (not bm!45923) (not bm!45943) (not b!1098722) (not bm!45922) (not d!130429) (not d!130437) (not bm!45930) (not d!130431) (not b!1098725) tp_is_empty!27141 (not b!1098566) (not b!1098730) (not b!1098728) (not d!130453) (not d!130433) (not d!130463) (not b!1098641) (not b!1098671) (not b_lambda!17861) (not b!1098707) (not b_lambda!17859) (not b!1098645) (not b!1098595) (not b_lambda!17869) (not b!1098740) b_and!36907 (not b!1098647) (not bm!45936) (not d!130455) (not mapNonEmpty!42487) (not b!1098586) (not b!1098715) (not d!130451) (not b!1098588) (not d!130423) (not b!1098713) (not b!1098744) (not bm!45920) (not bm!45925) (not b!1098564) (not b!1098666) (not b!1098679) (not d!130459) (not bm!45905) (not b!1098711) (not b!1098572) (not b_lambda!17863) (not d!130461) (not b!1098678) (not bm!45941) (not b_lambda!17843) (not b!1098732) (not d!130435) (not b!1098568) (not b!1098657) (not b_lambda!17871) (not bm!45942))
(check-sat b_and!36907 (not b_next!23091))
