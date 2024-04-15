; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95872 () Bool)

(assert start!95872)

(declare-fun b_free!22531 () Bool)

(declare-fun b_next!22531 () Bool)

(assert (=> start!95872 (= b_free!22531 (not b_next!22531))))

(declare-fun tp!79441 () Bool)

(declare-fun b_and!35711 () Bool)

(assert (=> start!95872 (= tp!79441 b_and!35711)))

(declare-fun b!1085260 () Bool)

(declare-fun res!723611 () Bool)

(declare-fun e!619966 () Bool)

(assert (=> b!1085260 (=> (not res!723611) (not e!619966))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69924 0))(
  ( (array!69925 (arr!33636 (Array (_ BitVec 32) (_ BitVec 64))) (size!34174 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69924)

(assert (=> b!1085260 (= res!723611 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34174 _keys!1070))))))

(declare-fun b!1085261 () Bool)

(declare-fun e!619973 () Bool)

(assert (=> b!1085261 (= e!619966 e!619973)))

(declare-fun res!723613 () Bool)

(assert (=> b!1085261 (=> (not res!723613) (not e!619973))))

(declare-fun lt!481455 () array!69924)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69924 (_ BitVec 32)) Bool)

(assert (=> b!1085261 (= res!723613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481455 mask!1414))))

(assert (=> b!1085261 (= lt!481455 (array!69925 (store (arr!33636 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34174 _keys!1070)))))

(declare-fun b!1085262 () Bool)

(declare-fun e!619967 () Bool)

(declare-fun tp_is_empty!26533 () Bool)

(assert (=> b!1085262 (= e!619967 tp_is_empty!26533)))

(declare-fun b!1085263 () Bool)

(declare-fun res!723616 () Bool)

(assert (=> b!1085263 (=> (not res!723616) (not e!619973))))

(declare-datatypes ((List!23517 0))(
  ( (Nil!23514) (Cons!23513 (h!24722 (_ BitVec 64)) (t!33097 List!23517)) )
))
(declare-fun arrayNoDuplicates!0 (array!69924 (_ BitVec 32) List!23517) Bool)

(assert (=> b!1085263 (= res!723616 (arrayNoDuplicates!0 lt!481455 #b00000000000000000000000000000000 Nil!23514))))

(declare-fun mapNonEmpty!41554 () Bool)

(declare-fun mapRes!41554 () Bool)

(declare-fun tp!79442 () Bool)

(assert (=> mapNonEmpty!41554 (= mapRes!41554 (and tp!79442 e!619967))))

(declare-datatypes ((V!40505 0))(
  ( (V!40506 (val!13323 Int)) )
))
(declare-datatypes ((ValueCell!12557 0))(
  ( (ValueCellFull!12557 (v!15943 V!40505)) (EmptyCell!12557) )
))
(declare-datatypes ((array!69926 0))(
  ( (array!69927 (arr!33637 (Array (_ BitVec 32) ValueCell!12557)) (size!34175 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69926)

(declare-fun mapRest!41554 () (Array (_ BitVec 32) ValueCell!12557))

(declare-fun mapKey!41554 () (_ BitVec 32))

(declare-fun mapValue!41554 () ValueCell!12557)

(assert (=> mapNonEmpty!41554 (= (arr!33637 _values!874) (store mapRest!41554 mapKey!41554 mapValue!41554))))

(declare-fun b!1085264 () Bool)

(declare-fun res!723614 () Bool)

(assert (=> b!1085264 (=> (not res!723614) (not e!619966))))

(assert (=> b!1085264 (= res!723614 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23514))))

(declare-fun b!1085265 () Bool)

(declare-fun res!723610 () Bool)

(assert (=> b!1085265 (=> (not res!723610) (not e!619966))))

(assert (=> b!1085265 (= res!723610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085266 () Bool)

(declare-fun res!723608 () Bool)

(assert (=> b!1085266 (=> (not res!723608) (not e!619966))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1085266 (= res!723608 (= (select (arr!33636 _keys!1070) i!650) k0!904))))

(declare-fun res!723615 () Bool)

(assert (=> start!95872 (=> (not res!723615) (not e!619966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95872 (= res!723615 (validMask!0 mask!1414))))

(assert (=> start!95872 e!619966))

(assert (=> start!95872 tp!79441))

(assert (=> start!95872 true))

(assert (=> start!95872 tp_is_empty!26533))

(declare-fun array_inv!25994 (array!69924) Bool)

(assert (=> start!95872 (array_inv!25994 _keys!1070)))

(declare-fun e!619972 () Bool)

(declare-fun array_inv!25995 (array!69926) Bool)

(assert (=> start!95872 (and (array_inv!25995 _values!874) e!619972)))

(declare-fun mapIsEmpty!41554 () Bool)

(assert (=> mapIsEmpty!41554 mapRes!41554))

(declare-fun b!1085267 () Bool)

(declare-fun e!619970 () Bool)

(declare-fun e!619969 () Bool)

(assert (=> b!1085267 (= e!619970 e!619969)))

(declare-fun res!723609 () Bool)

(assert (=> b!1085267 (=> res!723609 e!619969)))

(assert (=> b!1085267 (= res!723609 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16946 0))(
  ( (tuple2!16947 (_1!8484 (_ BitVec 64)) (_2!8484 V!40505)) )
))
(declare-datatypes ((List!23518 0))(
  ( (Nil!23515) (Cons!23514 (h!24723 tuple2!16946) (t!33098 List!23518)) )
))
(declare-datatypes ((ListLongMap!14915 0))(
  ( (ListLongMap!14916 (toList!7473 List!23518)) )
))
(declare-fun lt!481461 () ListLongMap!14915)

(declare-fun lt!481469 () ListLongMap!14915)

(assert (=> b!1085267 (= lt!481461 lt!481469)))

(declare-fun lt!481460 () ListLongMap!14915)

(declare-fun -!752 (ListLongMap!14915 (_ BitVec 64)) ListLongMap!14915)

(assert (=> b!1085267 (= lt!481461 (-!752 lt!481460 k0!904))))

(declare-datatypes ((Unit!35539 0))(
  ( (Unit!35540) )
))
(declare-fun lt!481464 () Unit!35539)

(declare-fun lt!481462 () ListLongMap!14915)

(declare-fun zeroValue!831 () V!40505)

(declare-fun addRemoveCommutativeForDiffKeys!10 (ListLongMap!14915 (_ BitVec 64) V!40505 (_ BitVec 64)) Unit!35539)

(assert (=> b!1085267 (= lt!481464 (addRemoveCommutativeForDiffKeys!10 lt!481462 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481453 () ListLongMap!14915)

(declare-fun lt!481468 () tuple2!16946)

(declare-fun +!3281 (ListLongMap!14915 tuple2!16946) ListLongMap!14915)

(assert (=> b!1085267 (= lt!481453 (+!3281 lt!481469 lt!481468))))

(declare-fun lt!481454 () ListLongMap!14915)

(declare-fun lt!481463 () tuple2!16946)

(assert (=> b!1085267 (= lt!481469 (+!3281 lt!481454 lt!481463))))

(declare-fun lt!481457 () ListLongMap!14915)

(declare-fun lt!481466 () ListLongMap!14915)

(assert (=> b!1085267 (= lt!481457 lt!481466)))

(assert (=> b!1085267 (= lt!481466 (+!3281 lt!481460 lt!481468))))

(assert (=> b!1085267 (= lt!481460 (+!3281 lt!481462 lt!481463))))

(declare-fun lt!481458 () ListLongMap!14915)

(assert (=> b!1085267 (= lt!481453 (+!3281 (+!3281 lt!481458 lt!481463) lt!481468))))

(declare-fun minValue!831 () V!40505)

(assert (=> b!1085267 (= lt!481468 (tuple2!16947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085267 (= lt!481463 (tuple2!16947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085268 () Bool)

(assert (=> b!1085268 (= e!619969 true)))

(assert (=> b!1085268 (= (-!752 lt!481466 k0!904) (+!3281 lt!481461 lt!481468))))

(declare-fun lt!481456 () Unit!35539)

(assert (=> b!1085268 (= lt!481456 (addRemoveCommutativeForDiffKeys!10 lt!481460 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085269 () Bool)

(declare-fun res!723612 () Bool)

(assert (=> b!1085269 (=> (not res!723612) (not e!619966))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085269 (= res!723612 (and (= (size!34175 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34174 _keys!1070) (size!34175 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085270 () Bool)

(declare-fun e!619971 () Bool)

(assert (=> b!1085270 (= e!619971 tp_is_empty!26533)))

(declare-fun b!1085271 () Bool)

(declare-fun res!723618 () Bool)

(assert (=> b!1085271 (=> (not res!723618) (not e!619966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085271 (= res!723618 (validKeyInArray!0 k0!904))))

(declare-fun b!1085272 () Bool)

(assert (=> b!1085272 (= e!619973 (not e!619970))))

(declare-fun res!723617 () Bool)

(assert (=> b!1085272 (=> res!723617 e!619970)))

(assert (=> b!1085272 (= res!723617 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4164 (array!69924 array!69926 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1085272 (= lt!481457 (getCurrentListMap!4164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481467 () array!69926)

(assert (=> b!1085272 (= lt!481453 (getCurrentListMap!4164 lt!481455 lt!481467 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085272 (and (= lt!481458 lt!481454) (= lt!481454 lt!481458))))

(assert (=> b!1085272 (= lt!481454 (-!752 lt!481462 k0!904))))

(declare-fun lt!481459 () Unit!35539)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!48 (array!69924 array!69926 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35539)

(assert (=> b!1085272 (= lt!481459 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!48 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4034 (array!69924 array!69926 (_ BitVec 32) (_ BitVec 32) V!40505 V!40505 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1085272 (= lt!481458 (getCurrentListMapNoExtraKeys!4034 lt!481455 lt!481467 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2105 (Int (_ BitVec 64)) V!40505)

(assert (=> b!1085272 (= lt!481467 (array!69927 (store (arr!33637 _values!874) i!650 (ValueCellFull!12557 (dynLambda!2105 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34175 _values!874)))))

(assert (=> b!1085272 (= lt!481462 (getCurrentListMapNoExtraKeys!4034 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085272 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481465 () Unit!35539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69924 (_ BitVec 64) (_ BitVec 32)) Unit!35539)

(assert (=> b!1085272 (= lt!481465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085273 () Bool)

(assert (=> b!1085273 (= e!619972 (and e!619971 mapRes!41554))))

(declare-fun condMapEmpty!41554 () Bool)

(declare-fun mapDefault!41554 () ValueCell!12557)

(assert (=> b!1085273 (= condMapEmpty!41554 (= (arr!33637 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12557)) mapDefault!41554)))))

(assert (= (and start!95872 res!723615) b!1085269))

(assert (= (and b!1085269 res!723612) b!1085265))

(assert (= (and b!1085265 res!723610) b!1085264))

(assert (= (and b!1085264 res!723614) b!1085260))

(assert (= (and b!1085260 res!723611) b!1085271))

(assert (= (and b!1085271 res!723618) b!1085266))

(assert (= (and b!1085266 res!723608) b!1085261))

(assert (= (and b!1085261 res!723613) b!1085263))

(assert (= (and b!1085263 res!723616) b!1085272))

(assert (= (and b!1085272 (not res!723617)) b!1085267))

(assert (= (and b!1085267 (not res!723609)) b!1085268))

(assert (= (and b!1085273 condMapEmpty!41554) mapIsEmpty!41554))

(assert (= (and b!1085273 (not condMapEmpty!41554)) mapNonEmpty!41554))

(get-info :version)

(assert (= (and mapNonEmpty!41554 ((_ is ValueCellFull!12557) mapValue!41554)) b!1085262))

(assert (= (and b!1085273 ((_ is ValueCellFull!12557) mapDefault!41554)) b!1085270))

(assert (= start!95872 b!1085273))

(declare-fun b_lambda!17179 () Bool)

(assert (=> (not b_lambda!17179) (not b!1085272)))

(declare-fun t!33096 () Bool)

(declare-fun tb!7401 () Bool)

(assert (=> (and start!95872 (= defaultEntry!882 defaultEntry!882) t!33096) tb!7401))

(declare-fun result!15329 () Bool)

(assert (=> tb!7401 (= result!15329 tp_is_empty!26533)))

(assert (=> b!1085272 t!33096))

(declare-fun b_and!35713 () Bool)

(assert (= b_and!35711 (and (=> t!33096 result!15329) b_and!35713)))

(declare-fun m!1002821 () Bool)

(assert (=> b!1085272 m!1002821))

(declare-fun m!1002823 () Bool)

(assert (=> b!1085272 m!1002823))

(declare-fun m!1002825 () Bool)

(assert (=> b!1085272 m!1002825))

(declare-fun m!1002827 () Bool)

(assert (=> b!1085272 m!1002827))

(declare-fun m!1002829 () Bool)

(assert (=> b!1085272 m!1002829))

(declare-fun m!1002831 () Bool)

(assert (=> b!1085272 m!1002831))

(declare-fun m!1002833 () Bool)

(assert (=> b!1085272 m!1002833))

(declare-fun m!1002835 () Bool)

(assert (=> b!1085272 m!1002835))

(declare-fun m!1002837 () Bool)

(assert (=> b!1085272 m!1002837))

(declare-fun m!1002839 () Bool)

(assert (=> b!1085272 m!1002839))

(declare-fun m!1002841 () Bool)

(assert (=> b!1085263 m!1002841))

(declare-fun m!1002843 () Bool)

(assert (=> b!1085271 m!1002843))

(declare-fun m!1002845 () Bool)

(assert (=> start!95872 m!1002845))

(declare-fun m!1002847 () Bool)

(assert (=> start!95872 m!1002847))

(declare-fun m!1002849 () Bool)

(assert (=> start!95872 m!1002849))

(declare-fun m!1002851 () Bool)

(assert (=> b!1085265 m!1002851))

(declare-fun m!1002853 () Bool)

(assert (=> b!1085264 m!1002853))

(declare-fun m!1002855 () Bool)

(assert (=> b!1085267 m!1002855))

(declare-fun m!1002857 () Bool)

(assert (=> b!1085267 m!1002857))

(declare-fun m!1002859 () Bool)

(assert (=> b!1085267 m!1002859))

(declare-fun m!1002861 () Bool)

(assert (=> b!1085267 m!1002861))

(declare-fun m!1002863 () Bool)

(assert (=> b!1085267 m!1002863))

(declare-fun m!1002865 () Bool)

(assert (=> b!1085267 m!1002865))

(assert (=> b!1085267 m!1002863))

(declare-fun m!1002867 () Bool)

(assert (=> b!1085267 m!1002867))

(declare-fun m!1002869 () Bool)

(assert (=> b!1085267 m!1002869))

(declare-fun m!1002871 () Bool)

(assert (=> b!1085268 m!1002871))

(declare-fun m!1002873 () Bool)

(assert (=> b!1085268 m!1002873))

(declare-fun m!1002875 () Bool)

(assert (=> b!1085268 m!1002875))

(declare-fun m!1002877 () Bool)

(assert (=> b!1085261 m!1002877))

(declare-fun m!1002879 () Bool)

(assert (=> b!1085261 m!1002879))

(declare-fun m!1002881 () Bool)

(assert (=> mapNonEmpty!41554 m!1002881))

(declare-fun m!1002883 () Bool)

(assert (=> b!1085266 m!1002883))

(check-sat tp_is_empty!26533 (not b!1085265) (not mapNonEmpty!41554) (not b!1085267) (not b!1085268) (not b_next!22531) (not b!1085263) (not b!1085261) b_and!35713 (not b_lambda!17179) (not b!1085271) (not b!1085264) (not start!95872) (not b!1085272))
(check-sat b_and!35713 (not b_next!22531))
