; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96150 () Bool)

(assert start!96150)

(declare-fun b_free!22567 () Bool)

(declare-fun b_next!22567 () Bool)

(assert (=> start!96150 (= b_free!22567 (not b_next!22567))))

(declare-fun tp!79549 () Bool)

(declare-fun b_and!35819 () Bool)

(assert (=> start!96150 (= tp!79549 b_and!35819)))

(declare-fun b!1087533 () Bool)

(declare-fun res!724797 () Bool)

(declare-fun e!621347 () Bool)

(assert (=> b!1087533 (=> (not res!724797) (not e!621347))))

(declare-datatypes ((array!70109 0))(
  ( (array!70110 (arr!33722 (Array (_ BitVec 32) (_ BitVec 64))) (size!34259 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70109)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70109 (_ BitVec 32)) Bool)

(assert (=> b!1087533 (= res!724797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087534 () Bool)

(declare-fun res!724801 () Bool)

(assert (=> b!1087534 (=> (not res!724801) (not e!621347))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087534 (= res!724801 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34259 _keys!1070))))))

(declare-fun b!1087535 () Bool)

(declare-fun res!724802 () Bool)

(assert (=> b!1087535 (=> (not res!724802) (not e!621347))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087535 (= res!724802 (= (select (arr!33722 _keys!1070) i!650) k0!904))))

(declare-fun b!1087536 () Bool)

(declare-fun e!621352 () Bool)

(declare-fun tp_is_empty!26569 () Bool)

(assert (=> b!1087536 (= e!621352 tp_is_empty!26569)))

(declare-fun b!1087537 () Bool)

(declare-fun e!621348 () Bool)

(assert (=> b!1087537 (= e!621348 tp_is_empty!26569)))

(declare-fun b!1087538 () Bool)

(declare-fun e!621353 () Bool)

(declare-fun e!621350 () Bool)

(assert (=> b!1087538 (= e!621353 e!621350)))

(declare-fun res!724803 () Bool)

(assert (=> b!1087538 (=> res!724803 e!621350)))

(assert (=> b!1087538 (= res!724803 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40553 0))(
  ( (V!40554 (val!13341 Int)) )
))
(declare-datatypes ((tuple2!16930 0))(
  ( (tuple2!16931 (_1!8476 (_ BitVec 64)) (_2!8476 V!40553)) )
))
(declare-datatypes ((List!23528 0))(
  ( (Nil!23525) (Cons!23524 (h!24742 tuple2!16930) (t!33145 List!23528)) )
))
(declare-datatypes ((ListLongMap!14907 0))(
  ( (ListLongMap!14908 (toList!7469 List!23528)) )
))
(declare-fun lt!483092 () ListLongMap!14907)

(declare-fun lt!483087 () ListLongMap!14907)

(assert (=> b!1087538 (= lt!483092 lt!483087)))

(declare-fun lt!483088 () ListLongMap!14907)

(declare-fun -!781 (ListLongMap!14907 (_ BitVec 64)) ListLongMap!14907)

(assert (=> b!1087538 (= lt!483092 (-!781 lt!483088 k0!904))))

(declare-fun zeroValue!831 () V!40553)

(declare-fun lt!483095 () ListLongMap!14907)

(declare-datatypes ((Unit!35729 0))(
  ( (Unit!35730) )
))
(declare-fun lt!483089 () Unit!35729)

(declare-fun addRemoveCommutativeForDiffKeys!27 (ListLongMap!14907 (_ BitVec 64) V!40553 (_ BitVec 64)) Unit!35729)

(assert (=> b!1087538 (= lt!483089 (addRemoveCommutativeForDiffKeys!27 lt!483095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483098 () ListLongMap!14907)

(declare-fun lt!483099 () tuple2!16930)

(declare-fun +!3293 (ListLongMap!14907 tuple2!16930) ListLongMap!14907)

(assert (=> b!1087538 (= lt!483098 (+!3293 lt!483087 lt!483099))))

(declare-fun lt!483096 () ListLongMap!14907)

(declare-fun lt!483100 () tuple2!16930)

(assert (=> b!1087538 (= lt!483087 (+!3293 lt!483096 lt!483100))))

(declare-fun lt!483093 () ListLongMap!14907)

(declare-fun lt!483086 () ListLongMap!14907)

(assert (=> b!1087538 (= lt!483093 lt!483086)))

(assert (=> b!1087538 (= lt!483086 (+!3293 lt!483088 lt!483099))))

(assert (=> b!1087538 (= lt!483088 (+!3293 lt!483095 lt!483100))))

(declare-fun lt!483101 () ListLongMap!14907)

(assert (=> b!1087538 (= lt!483098 (+!3293 (+!3293 lt!483101 lt!483100) lt!483099))))

(declare-fun minValue!831 () V!40553)

(assert (=> b!1087538 (= lt!483099 (tuple2!16931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087538 (= lt!483100 (tuple2!16931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087539 () Bool)

(declare-fun e!621346 () Bool)

(assert (=> b!1087539 (= e!621347 e!621346)))

(declare-fun res!724798 () Bool)

(assert (=> b!1087539 (=> (not res!724798) (not e!621346))))

(declare-fun lt!483094 () array!70109)

(assert (=> b!1087539 (= res!724798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483094 mask!1414))))

(assert (=> b!1087539 (= lt!483094 (array!70110 (store (arr!33722 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34259 _keys!1070)))))

(declare-fun b!1087540 () Bool)

(declare-fun res!724799 () Bool)

(assert (=> b!1087540 (=> (not res!724799) (not e!621347))))

(declare-datatypes ((List!23529 0))(
  ( (Nil!23526) (Cons!23525 (h!24743 (_ BitVec 64)) (t!33146 List!23529)) )
))
(declare-fun arrayNoDuplicates!0 (array!70109 (_ BitVec 32) List!23529) Bool)

(assert (=> b!1087540 (= res!724799 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23526))))

(declare-fun b!1087541 () Bool)

(declare-fun e!621351 () Bool)

(declare-fun mapRes!41608 () Bool)

(assert (=> b!1087541 (= e!621351 (and e!621348 mapRes!41608))))

(declare-fun condMapEmpty!41608 () Bool)

(declare-datatypes ((ValueCell!12575 0))(
  ( (ValueCellFull!12575 (v!15958 V!40553)) (EmptyCell!12575) )
))
(declare-datatypes ((array!70111 0))(
  ( (array!70112 (arr!33723 (Array (_ BitVec 32) ValueCell!12575)) (size!34260 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70111)

(declare-fun mapDefault!41608 () ValueCell!12575)

(assert (=> b!1087541 (= condMapEmpty!41608 (= (arr!33723 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12575)) mapDefault!41608)))))

(declare-fun mapIsEmpty!41608 () Bool)

(assert (=> mapIsEmpty!41608 mapRes!41608))

(declare-fun b!1087542 () Bool)

(declare-fun res!724796 () Bool)

(assert (=> b!1087542 (=> (not res!724796) (not e!621347))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087542 (= res!724796 (and (= (size!34260 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34259 _keys!1070) (size!34260 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087543 () Bool)

(assert (=> b!1087543 (= e!621346 (not e!621353))))

(declare-fun res!724795 () Bool)

(assert (=> b!1087543 (=> res!724795 e!621353)))

(assert (=> b!1087543 (= res!724795 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4236 (array!70109 array!70111 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14907)

(assert (=> b!1087543 (= lt!483093 (getCurrentListMap!4236 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483102 () array!70111)

(assert (=> b!1087543 (= lt!483098 (getCurrentListMap!4236 lt!483094 lt!483102 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087543 (and (= lt!483101 lt!483096) (= lt!483096 lt!483101))))

(assert (=> b!1087543 (= lt!483096 (-!781 lt!483095 k0!904))))

(declare-fun lt!483091 () Unit!35729)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!65 (array!70109 array!70111 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35729)

(assert (=> b!1087543 (= lt!483091 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!65 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4041 (array!70109 array!70111 (_ BitVec 32) (_ BitVec 32) V!40553 V!40553 (_ BitVec 32) Int) ListLongMap!14907)

(assert (=> b!1087543 (= lt!483101 (getCurrentListMapNoExtraKeys!4041 lt!483094 lt!483102 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2162 (Int (_ BitVec 64)) V!40553)

(assert (=> b!1087543 (= lt!483102 (array!70112 (store (arr!33723 _values!874) i!650 (ValueCellFull!12575 (dynLambda!2162 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34260 _values!874)))))

(assert (=> b!1087543 (= lt!483095 (getCurrentListMapNoExtraKeys!4041 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087543 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483090 () Unit!35729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70109 (_ BitVec 64) (_ BitVec 32)) Unit!35729)

(assert (=> b!1087543 (= lt!483090 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!724800 () Bool)

(assert (=> start!96150 (=> (not res!724800) (not e!621347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96150 (= res!724800 (validMask!0 mask!1414))))

(assert (=> start!96150 e!621347))

(assert (=> start!96150 tp!79549))

(assert (=> start!96150 true))

(assert (=> start!96150 tp_is_empty!26569))

(declare-fun array_inv!26064 (array!70109) Bool)

(assert (=> start!96150 (array_inv!26064 _keys!1070)))

(declare-fun array_inv!26065 (array!70111) Bool)

(assert (=> start!96150 (and (array_inv!26065 _values!874) e!621351)))

(declare-fun b!1087532 () Bool)

(declare-fun res!724794 () Bool)

(assert (=> b!1087532 (=> (not res!724794) (not e!621346))))

(assert (=> b!1087532 (= res!724794 (arrayNoDuplicates!0 lt!483094 #b00000000000000000000000000000000 Nil!23526))))

(declare-fun b!1087544 () Bool)

(declare-fun res!724793 () Bool)

(assert (=> b!1087544 (=> (not res!724793) (not e!621347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087544 (= res!724793 (validKeyInArray!0 k0!904))))

(declare-fun b!1087545 () Bool)

(assert (=> b!1087545 (= e!621350 true)))

(assert (=> b!1087545 (= (-!781 lt!483086 k0!904) (+!3293 lt!483092 lt!483099))))

(declare-fun lt!483097 () Unit!35729)

(assert (=> b!1087545 (= lt!483097 (addRemoveCommutativeForDiffKeys!27 lt!483088 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41608 () Bool)

(declare-fun tp!79550 () Bool)

(assert (=> mapNonEmpty!41608 (= mapRes!41608 (and tp!79550 e!621352))))

(declare-fun mapValue!41608 () ValueCell!12575)

(declare-fun mapKey!41608 () (_ BitVec 32))

(declare-fun mapRest!41608 () (Array (_ BitVec 32) ValueCell!12575))

(assert (=> mapNonEmpty!41608 (= (arr!33723 _values!874) (store mapRest!41608 mapKey!41608 mapValue!41608))))

(assert (= (and start!96150 res!724800) b!1087542))

(assert (= (and b!1087542 res!724796) b!1087533))

(assert (= (and b!1087533 res!724797) b!1087540))

(assert (= (and b!1087540 res!724799) b!1087534))

(assert (= (and b!1087534 res!724801) b!1087544))

(assert (= (and b!1087544 res!724793) b!1087535))

(assert (= (and b!1087535 res!724802) b!1087539))

(assert (= (and b!1087539 res!724798) b!1087532))

(assert (= (and b!1087532 res!724794) b!1087543))

(assert (= (and b!1087543 (not res!724795)) b!1087538))

(assert (= (and b!1087538 (not res!724803)) b!1087545))

(assert (= (and b!1087541 condMapEmpty!41608) mapIsEmpty!41608))

(assert (= (and b!1087541 (not condMapEmpty!41608)) mapNonEmpty!41608))

(get-info :version)

(assert (= (and mapNonEmpty!41608 ((_ is ValueCellFull!12575) mapValue!41608)) b!1087536))

(assert (= (and b!1087541 ((_ is ValueCellFull!12575) mapDefault!41608)) b!1087537))

(assert (= start!96150 b!1087541))

(declare-fun b_lambda!17247 () Bool)

(assert (=> (not b_lambda!17247) (not b!1087543)))

(declare-fun t!33144 () Bool)

(declare-fun tb!7437 () Bool)

(assert (=> (and start!96150 (= defaultEntry!882 defaultEntry!882) t!33144) tb!7437))

(declare-fun result!15401 () Bool)

(assert (=> tb!7437 (= result!15401 tp_is_empty!26569)))

(assert (=> b!1087543 t!33144))

(declare-fun b_and!35821 () Bool)

(assert (= b_and!35819 (and (=> t!33144 result!15401) b_and!35821)))

(declare-fun m!1006271 () Bool)

(assert (=> b!1087532 m!1006271))

(declare-fun m!1006273 () Bool)

(assert (=> b!1087538 m!1006273))

(declare-fun m!1006275 () Bool)

(assert (=> b!1087538 m!1006275))

(declare-fun m!1006277 () Bool)

(assert (=> b!1087538 m!1006277))

(declare-fun m!1006279 () Bool)

(assert (=> b!1087538 m!1006279))

(declare-fun m!1006281 () Bool)

(assert (=> b!1087538 m!1006281))

(declare-fun m!1006283 () Bool)

(assert (=> b!1087538 m!1006283))

(declare-fun m!1006285 () Bool)

(assert (=> b!1087538 m!1006285))

(assert (=> b!1087538 m!1006273))

(declare-fun m!1006287 () Bool)

(assert (=> b!1087538 m!1006287))

(declare-fun m!1006289 () Bool)

(assert (=> b!1087535 m!1006289))

(declare-fun m!1006291 () Bool)

(assert (=> b!1087544 m!1006291))

(declare-fun m!1006293 () Bool)

(assert (=> mapNonEmpty!41608 m!1006293))

(declare-fun m!1006295 () Bool)

(assert (=> start!96150 m!1006295))

(declare-fun m!1006297 () Bool)

(assert (=> start!96150 m!1006297))

(declare-fun m!1006299 () Bool)

(assert (=> start!96150 m!1006299))

(declare-fun m!1006301 () Bool)

(assert (=> b!1087539 m!1006301))

(declare-fun m!1006303 () Bool)

(assert (=> b!1087539 m!1006303))

(declare-fun m!1006305 () Bool)

(assert (=> b!1087540 m!1006305))

(declare-fun m!1006307 () Bool)

(assert (=> b!1087545 m!1006307))

(declare-fun m!1006309 () Bool)

(assert (=> b!1087545 m!1006309))

(declare-fun m!1006311 () Bool)

(assert (=> b!1087545 m!1006311))

(declare-fun m!1006313 () Bool)

(assert (=> b!1087543 m!1006313))

(declare-fun m!1006315 () Bool)

(assert (=> b!1087543 m!1006315))

(declare-fun m!1006317 () Bool)

(assert (=> b!1087543 m!1006317))

(declare-fun m!1006319 () Bool)

(assert (=> b!1087543 m!1006319))

(declare-fun m!1006321 () Bool)

(assert (=> b!1087543 m!1006321))

(declare-fun m!1006323 () Bool)

(assert (=> b!1087543 m!1006323))

(declare-fun m!1006325 () Bool)

(assert (=> b!1087543 m!1006325))

(declare-fun m!1006327 () Bool)

(assert (=> b!1087543 m!1006327))

(declare-fun m!1006329 () Bool)

(assert (=> b!1087543 m!1006329))

(declare-fun m!1006331 () Bool)

(assert (=> b!1087543 m!1006331))

(declare-fun m!1006333 () Bool)

(assert (=> b!1087533 m!1006333))

(check-sat (not b!1087540) (not b!1087533) (not b!1087538) (not b!1087545) (not b!1087543) (not start!96150) tp_is_empty!26569 (not b_lambda!17247) (not b!1087532) (not mapNonEmpty!41608) b_and!35821 (not b!1087539) (not b!1087544) (not b_next!22567))
(check-sat b_and!35821 (not b_next!22567))
