; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96512 () Bool)

(assert start!96512)

(declare-fun b_free!23071 () Bool)

(declare-fun b_next!23071 () Bool)

(assert (=> start!96512 (= b_free!23071 (not b_next!23071))))

(declare-fun tp!81143 () Bool)

(declare-fun b_and!36793 () Bool)

(assert (=> start!96512 (= tp!81143 b_and!36793)))

(declare-fun b!1097491 () Bool)

(declare-fun res!732516 () Bool)

(declare-fun e!626382 () Bool)

(assert (=> b!1097491 (=> (not res!732516) (not e!626382))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097491 (= res!732516 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42445 () Bool)

(declare-fun mapRes!42445 () Bool)

(assert (=> mapIsEmpty!42445 mapRes!42445))

(declare-fun b!1097492 () Bool)

(declare-fun e!626383 () Bool)

(declare-fun e!626381 () Bool)

(assert (=> b!1097492 (= e!626383 (and e!626381 mapRes!42445))))

(declare-fun condMapEmpty!42445 () Bool)

(declare-datatypes ((V!41289 0))(
  ( (V!41290 (val!13617 Int)) )
))
(declare-datatypes ((ValueCell!12851 0))(
  ( (ValueCellFull!12851 (v!16238 V!41289)) (EmptyCell!12851) )
))
(declare-datatypes ((array!71062 0))(
  ( (array!71063 (arr!34202 (Array (_ BitVec 32) ValueCell!12851)) (size!34740 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71062)

(declare-fun mapDefault!42445 () ValueCell!12851)

(assert (=> b!1097492 (= condMapEmpty!42445 (= (arr!34202 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12851)) mapDefault!42445)))))

(declare-fun b!1097493 () Bool)

(declare-fun e!626379 () Bool)

(declare-fun e!626380 () Bool)

(assert (=> b!1097493 (= e!626379 (not e!626380))))

(declare-fun res!732514 () Bool)

(assert (=> b!1097493 (=> res!732514 e!626380)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097493 (= res!732514 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41289)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17356 0))(
  ( (tuple2!17357 (_1!8689 (_ BitVec 64)) (_2!8689 V!41289)) )
))
(declare-datatypes ((List!23951 0))(
  ( (Nil!23948) (Cons!23947 (h!25156 tuple2!17356) (t!34059 List!23951)) )
))
(declare-datatypes ((ListLongMap!15325 0))(
  ( (ListLongMap!15326 (toList!7678 List!23951)) )
))
(declare-fun lt!490535 () ListLongMap!15325)

(declare-fun zeroValue!831 () V!41289)

(declare-datatypes ((array!71064 0))(
  ( (array!71065 (arr!34203 (Array (_ BitVec 32) (_ BitVec 64))) (size!34741 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71064)

(declare-fun getCurrentListMap!4304 (array!71064 array!71062 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) Int) ListLongMap!15325)

(assert (=> b!1097493 (= lt!490535 (getCurrentListMap!4304 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490538 () array!71062)

(declare-fun lt!490530 () array!71064)

(declare-fun lt!490536 () ListLongMap!15325)

(assert (=> b!1097493 (= lt!490536 (getCurrentListMap!4304 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490534 () ListLongMap!15325)

(declare-fun lt!490529 () ListLongMap!15325)

(assert (=> b!1097493 (and (= lt!490534 lt!490529) (= lt!490529 lt!490534))))

(declare-fun lt!490537 () ListLongMap!15325)

(declare-fun -!918 (ListLongMap!15325 (_ BitVec 64)) ListLongMap!15325)

(assert (=> b!1097493 (= lt!490529 (-!918 lt!490537 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35945 0))(
  ( (Unit!35946) )
))
(declare-fun lt!490531 () Unit!35945)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 (array!71064 array!71062 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35945)

(assert (=> b!1097493 (= lt!490531 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4211 (array!71064 array!71062 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) Int) ListLongMap!15325)

(assert (=> b!1097493 (= lt!490534 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2280 (Int (_ BitVec 64)) V!41289)

(assert (=> b!1097493 (= lt!490538 (array!71063 (store (arr!34202 _values!874) i!650 (ValueCellFull!12851 (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34740 _values!874)))))

(assert (=> b!1097493 (= lt!490537 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097493 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490532 () Unit!35945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71064 (_ BitVec 64) (_ BitVec 32)) Unit!35945)

(assert (=> b!1097493 (= lt!490532 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097494 () Bool)

(declare-fun e!626384 () Bool)

(declare-fun tp_is_empty!27121 () Bool)

(assert (=> b!1097494 (= e!626384 tp_is_empty!27121)))

(declare-fun b!1097495 () Bool)

(assert (=> b!1097495 (= e!626382 e!626379)))

(declare-fun res!732510 () Bool)

(assert (=> b!1097495 (=> (not res!732510) (not e!626379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71064 (_ BitVec 32)) Bool)

(assert (=> b!1097495 (= res!732510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490530 mask!1414))))

(assert (=> b!1097495 (= lt!490530 (array!71065 (store (arr!34203 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34741 _keys!1070)))))

(declare-fun b!1097496 () Bool)

(declare-fun res!732507 () Bool)

(assert (=> b!1097496 (=> (not res!732507) (not e!626382))))

(assert (=> b!1097496 (= res!732507 (and (= (size!34740 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34741 _keys!1070) (size!34740 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097497 () Bool)

(assert (=> b!1097497 (= e!626381 tp_is_empty!27121)))

(declare-fun lt!490533 () tuple2!17356)

(declare-fun b!1097499 () Bool)

(declare-fun lt!490528 () tuple2!17356)

(declare-fun +!3390 (ListLongMap!15325 tuple2!17356) ListLongMap!15325)

(assert (=> b!1097499 (= e!626380 (= lt!490535 (+!3390 (+!3390 lt!490537 lt!490533) lt!490528)))))

(assert (=> b!1097499 (= lt!490536 (+!3390 (+!3390 lt!490534 lt!490533) lt!490528))))

(assert (=> b!1097499 (= lt!490528 (tuple2!17357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1097499 (= lt!490533 (tuple2!17357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1097500 () Bool)

(declare-fun res!732513 () Bool)

(assert (=> b!1097500 (=> (not res!732513) (not e!626379))))

(declare-datatypes ((List!23952 0))(
  ( (Nil!23949) (Cons!23948 (h!25157 (_ BitVec 64)) (t!34060 List!23952)) )
))
(declare-fun arrayNoDuplicates!0 (array!71064 (_ BitVec 32) List!23952) Bool)

(assert (=> b!1097500 (= res!732513 (arrayNoDuplicates!0 lt!490530 #b00000000000000000000000000000000 Nil!23949))))

(declare-fun b!1097501 () Bool)

(declare-fun res!732509 () Bool)

(assert (=> b!1097501 (=> (not res!732509) (not e!626382))))

(assert (=> b!1097501 (= res!732509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097502 () Bool)

(declare-fun res!732508 () Bool)

(assert (=> b!1097502 (=> (not res!732508) (not e!626382))))

(assert (=> b!1097502 (= res!732508 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23949))))

(declare-fun res!732511 () Bool)

(assert (=> start!96512 (=> (not res!732511) (not e!626382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96512 (= res!732511 (validMask!0 mask!1414))))

(assert (=> start!96512 e!626382))

(assert (=> start!96512 tp!81143))

(assert (=> start!96512 true))

(assert (=> start!96512 tp_is_empty!27121))

(declare-fun array_inv!26384 (array!71064) Bool)

(assert (=> start!96512 (array_inv!26384 _keys!1070)))

(declare-fun array_inv!26385 (array!71062) Bool)

(assert (=> start!96512 (and (array_inv!26385 _values!874) e!626383)))

(declare-fun b!1097498 () Bool)

(declare-fun res!732512 () Bool)

(assert (=> b!1097498 (=> (not res!732512) (not e!626382))))

(assert (=> b!1097498 (= res!732512 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34741 _keys!1070))))))

(declare-fun b!1097503 () Bool)

(declare-fun res!732515 () Bool)

(assert (=> b!1097503 (=> (not res!732515) (not e!626382))))

(assert (=> b!1097503 (= res!732515 (= (select (arr!34203 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42445 () Bool)

(declare-fun tp!81142 () Bool)

(assert (=> mapNonEmpty!42445 (= mapRes!42445 (and tp!81142 e!626384))))

(declare-fun mapRest!42445 () (Array (_ BitVec 32) ValueCell!12851))

(declare-fun mapKey!42445 () (_ BitVec 32))

(declare-fun mapValue!42445 () ValueCell!12851)

(assert (=> mapNonEmpty!42445 (= (arr!34202 _values!874) (store mapRest!42445 mapKey!42445 mapValue!42445))))

(assert (= (and start!96512 res!732511) b!1097496))

(assert (= (and b!1097496 res!732507) b!1097501))

(assert (= (and b!1097501 res!732509) b!1097502))

(assert (= (and b!1097502 res!732508) b!1097498))

(assert (= (and b!1097498 res!732512) b!1097491))

(assert (= (and b!1097491 res!732516) b!1097503))

(assert (= (and b!1097503 res!732515) b!1097495))

(assert (= (and b!1097495 res!732510) b!1097500))

(assert (= (and b!1097500 res!732513) b!1097493))

(assert (= (and b!1097493 (not res!732514)) b!1097499))

(assert (= (and b!1097492 condMapEmpty!42445) mapIsEmpty!42445))

(assert (= (and b!1097492 (not condMapEmpty!42445)) mapNonEmpty!42445))

(get-info :version)

(assert (= (and mapNonEmpty!42445 ((_ is ValueCellFull!12851) mapValue!42445)) b!1097494))

(assert (= (and b!1097492 ((_ is ValueCellFull!12851) mapDefault!42445)) b!1097497))

(assert (= start!96512 b!1097492))

(declare-fun b_lambda!17737 () Bool)

(assert (=> (not b_lambda!17737) (not b!1097493)))

(declare-fun t!34058 () Bool)

(declare-fun tb!7929 () Bool)

(assert (=> (and start!96512 (= defaultEntry!882 defaultEntry!882) t!34058) tb!7929))

(declare-fun result!16391 () Bool)

(assert (=> tb!7929 (= result!16391 tp_is_empty!27121)))

(assert (=> b!1097493 t!34058))

(declare-fun b_and!36795 () Bool)

(assert (= b_and!36793 (and (=> t!34058 result!16391) b_and!36795)))

(declare-fun m!1016519 () Bool)

(assert (=> b!1097503 m!1016519))

(declare-fun m!1016521 () Bool)

(assert (=> start!96512 m!1016521))

(declare-fun m!1016523 () Bool)

(assert (=> start!96512 m!1016523))

(declare-fun m!1016525 () Bool)

(assert (=> start!96512 m!1016525))

(declare-fun m!1016527 () Bool)

(assert (=> b!1097501 m!1016527))

(declare-fun m!1016529 () Bool)

(assert (=> b!1097499 m!1016529))

(assert (=> b!1097499 m!1016529))

(declare-fun m!1016531 () Bool)

(assert (=> b!1097499 m!1016531))

(declare-fun m!1016533 () Bool)

(assert (=> b!1097499 m!1016533))

(assert (=> b!1097499 m!1016533))

(declare-fun m!1016535 () Bool)

(assert (=> b!1097499 m!1016535))

(declare-fun m!1016537 () Bool)

(assert (=> b!1097495 m!1016537))

(declare-fun m!1016539 () Bool)

(assert (=> b!1097495 m!1016539))

(declare-fun m!1016541 () Bool)

(assert (=> b!1097500 m!1016541))

(declare-fun m!1016543 () Bool)

(assert (=> b!1097502 m!1016543))

(declare-fun m!1016545 () Bool)

(assert (=> b!1097493 m!1016545))

(declare-fun m!1016547 () Bool)

(assert (=> b!1097493 m!1016547))

(declare-fun m!1016549 () Bool)

(assert (=> b!1097493 m!1016549))

(declare-fun m!1016551 () Bool)

(assert (=> b!1097493 m!1016551))

(declare-fun m!1016553 () Bool)

(assert (=> b!1097493 m!1016553))

(declare-fun m!1016555 () Bool)

(assert (=> b!1097493 m!1016555))

(declare-fun m!1016557 () Bool)

(assert (=> b!1097493 m!1016557))

(declare-fun m!1016559 () Bool)

(assert (=> b!1097493 m!1016559))

(declare-fun m!1016561 () Bool)

(assert (=> b!1097493 m!1016561))

(declare-fun m!1016563 () Bool)

(assert (=> b!1097493 m!1016563))

(declare-fun m!1016565 () Bool)

(assert (=> b!1097491 m!1016565))

(declare-fun m!1016567 () Bool)

(assert (=> mapNonEmpty!42445 m!1016567))

(check-sat (not b_lambda!17737) (not mapNonEmpty!42445) (not b!1097493) (not b!1097501) (not b!1097491) (not start!96512) tp_is_empty!27121 b_and!36795 (not b!1097499) (not b_next!23071) (not b!1097500) (not b!1097495) (not b!1097502))
(check-sat b_and!36795 (not b_next!23071))
(get-model)

(declare-fun b_lambda!17743 () Bool)

(assert (= b_lambda!17737 (or (and start!96512 b_free!23071) b_lambda!17743)))

(check-sat (not mapNonEmpty!42445) (not b!1097493) (not b!1097501) (not b!1097491) (not start!96512) tp_is_empty!27121 b_and!36795 (not b_lambda!17743) (not b!1097499) (not b_next!23071) (not b!1097500) (not b!1097495) (not b!1097502))
(check-sat b_and!36795 (not b_next!23071))
(get-model)

(declare-fun b!1097598 () Bool)

(declare-fun e!626438 () Bool)

(declare-fun call!45790 () Bool)

(assert (=> b!1097598 (= e!626438 call!45790)))

(declare-fun b!1097599 () Bool)

(declare-fun e!626437 () Bool)

(assert (=> b!1097599 (= e!626437 e!626438)))

(declare-fun c!108373 () Bool)

(assert (=> b!1097599 (= c!108373 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45787 () Bool)

(assert (=> bm!45787 (= call!45790 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108373 (Cons!23948 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000) Nil!23949) Nil!23949)))))

(declare-fun d!130175 () Bool)

(declare-fun res!732584 () Bool)

(declare-fun e!626436 () Bool)

(assert (=> d!130175 (=> res!732584 e!626436)))

(assert (=> d!130175 (= res!732584 (bvsge #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(assert (=> d!130175 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23949) e!626436)))

(declare-fun b!1097600 () Bool)

(assert (=> b!1097600 (= e!626436 e!626437)))

(declare-fun res!732583 () Bool)

(assert (=> b!1097600 (=> (not res!732583) (not e!626437))))

(declare-fun e!626435 () Bool)

(assert (=> b!1097600 (= res!732583 (not e!626435))))

(declare-fun res!732585 () Bool)

(assert (=> b!1097600 (=> (not res!732585) (not e!626435))))

(assert (=> b!1097600 (= res!732585 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097601 () Bool)

(declare-fun contains!6350 (List!23952 (_ BitVec 64)) Bool)

(assert (=> b!1097601 (= e!626435 (contains!6350 Nil!23949 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097602 () Bool)

(assert (=> b!1097602 (= e!626438 call!45790)))

(assert (= (and d!130175 (not res!732584)) b!1097600))

(assert (= (and b!1097600 res!732585) b!1097601))

(assert (= (and b!1097600 res!732583) b!1097599))

(assert (= (and b!1097599 c!108373) b!1097602))

(assert (= (and b!1097599 (not c!108373)) b!1097598))

(assert (= (or b!1097602 b!1097598) bm!45787))

(declare-fun m!1016669 () Bool)

(assert (=> b!1097599 m!1016669))

(assert (=> b!1097599 m!1016669))

(declare-fun m!1016671 () Bool)

(assert (=> b!1097599 m!1016671))

(assert (=> bm!45787 m!1016669))

(declare-fun m!1016673 () Bool)

(assert (=> bm!45787 m!1016673))

(assert (=> b!1097600 m!1016669))

(assert (=> b!1097600 m!1016669))

(assert (=> b!1097600 m!1016671))

(assert (=> b!1097601 m!1016669))

(assert (=> b!1097601 m!1016669))

(declare-fun m!1016675 () Bool)

(assert (=> b!1097601 m!1016675))

(assert (=> b!1097502 d!130175))

(declare-fun d!130177 () Bool)

(declare-fun res!732590 () Bool)

(declare-fun e!626443 () Bool)

(assert (=> d!130177 (=> res!732590 e!626443)))

(assert (=> d!130177 (= res!732590 (= (select (arr!34203 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130177 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626443)))

(declare-fun b!1097607 () Bool)

(declare-fun e!626444 () Bool)

(assert (=> b!1097607 (= e!626443 e!626444)))

(declare-fun res!732591 () Bool)

(assert (=> b!1097607 (=> (not res!732591) (not e!626444))))

(assert (=> b!1097607 (= res!732591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34741 _keys!1070)))))

(declare-fun b!1097608 () Bool)

(assert (=> b!1097608 (= e!626444 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130177 (not res!732590)) b!1097607))

(assert (= (and b!1097607 res!732591) b!1097608))

(assert (=> d!130177 m!1016669))

(declare-fun m!1016677 () Bool)

(assert (=> b!1097608 m!1016677))

(assert (=> b!1097493 d!130177))

(declare-fun d!130179 () Bool)

(declare-fun e!626477 () Bool)

(assert (=> d!130179 e!626477))

(declare-fun res!732610 () Bool)

(assert (=> d!130179 (=> (not res!732610) (not e!626477))))

(assert (=> d!130179 (= res!732610 (or (bvsge #b00000000000000000000000000000000 (size!34741 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))))

(declare-fun lt!490649 () ListLongMap!15325)

(declare-fun lt!490662 () ListLongMap!15325)

(assert (=> d!130179 (= lt!490649 lt!490662)))

(declare-fun lt!490654 () Unit!35945)

(declare-fun e!626483 () Unit!35945)

(assert (=> d!130179 (= lt!490654 e!626483)))

(declare-fun c!108390 () Bool)

(declare-fun e!626478 () Bool)

(assert (=> d!130179 (= c!108390 e!626478)))

(declare-fun res!732618 () Bool)

(assert (=> d!130179 (=> (not res!732618) (not e!626478))))

(assert (=> d!130179 (= res!732618 (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun e!626482 () ListLongMap!15325)

(assert (=> d!130179 (= lt!490662 e!626482)))

(declare-fun c!108391 () Bool)

(assert (=> d!130179 (= c!108391 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130179 (validMask!0 mask!1414)))

(assert (=> d!130179 (= (getCurrentListMap!4304 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490649)))

(declare-fun b!1097651 () Bool)

(declare-fun e!626479 () ListLongMap!15325)

(declare-fun call!45809 () ListLongMap!15325)

(assert (=> b!1097651 (= e!626479 call!45809)))

(declare-fun bm!45802 () Bool)

(declare-fun call!45808 () ListLongMap!15325)

(declare-fun c!108389 () Bool)

(declare-fun call!45807 () ListLongMap!15325)

(declare-fun call!45806 () ListLongMap!15325)

(assert (=> bm!45802 (= call!45807 (+!3390 (ite c!108391 call!45808 (ite c!108389 call!45806 call!45809)) (ite (or c!108391 c!108389) (tuple2!17357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097652 () Bool)

(declare-fun e!626475 () Bool)

(declare-fun call!45810 () Bool)

(assert (=> b!1097652 (= e!626475 (not call!45810))))

(declare-fun b!1097653 () Bool)

(declare-fun e!626480 () Bool)

(declare-fun apply!937 (ListLongMap!15325 (_ BitVec 64)) V!41289)

(assert (=> b!1097653 (= e!626480 (= (apply!937 lt!490649 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097654 () Bool)

(declare-fun res!732617 () Bool)

(assert (=> b!1097654 (=> (not res!732617) (not e!626477))))

(declare-fun e!626476 () Bool)

(assert (=> b!1097654 (= res!732617 e!626476)))

(declare-fun res!732614 () Bool)

(assert (=> b!1097654 (=> res!732614 e!626476)))

(declare-fun e!626481 () Bool)

(assert (=> b!1097654 (= res!732614 (not e!626481))))

(declare-fun res!732612 () Bool)

(assert (=> b!1097654 (=> (not res!732612) (not e!626481))))

(assert (=> b!1097654 (= res!732612 (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun b!1097655 () Bool)

(assert (=> b!1097655 (= e!626478 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097656 () Bool)

(declare-fun e!626472 () ListLongMap!15325)

(declare-fun call!45811 () ListLongMap!15325)

(assert (=> b!1097656 (= e!626472 call!45811)))

(declare-fun bm!45803 () Bool)

(assert (=> bm!45803 (= call!45811 call!45807)))

(declare-fun b!1097657 () Bool)

(assert (=> b!1097657 (= e!626482 (+!3390 call!45807 (tuple2!17357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45804 () Bool)

(declare-fun call!45805 () Bool)

(declare-fun contains!6351 (ListLongMap!15325 (_ BitVec 64)) Bool)

(assert (=> bm!45804 (= call!45805 (contains!6351 lt!490649 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097658 () Bool)

(declare-fun e!626471 () Bool)

(assert (=> b!1097658 (= e!626476 e!626471)))

(declare-fun res!732613 () Bool)

(assert (=> b!1097658 (=> (not res!732613) (not e!626471))))

(assert (=> b!1097658 (= res!732613 (contains!6351 lt!490649 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun b!1097659 () Bool)

(declare-fun res!732615 () Bool)

(assert (=> b!1097659 (=> (not res!732615) (not e!626477))))

(assert (=> b!1097659 (= res!732615 e!626475)))

(declare-fun c!108388 () Bool)

(assert (=> b!1097659 (= c!108388 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45805 () Bool)

(assert (=> bm!45805 (= call!45809 call!45806)))

(declare-fun b!1097660 () Bool)

(declare-fun e!626474 () Bool)

(assert (=> b!1097660 (= e!626474 (not call!45805))))

(declare-fun b!1097661 () Bool)

(assert (=> b!1097661 (= e!626481 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45806 () Bool)

(assert (=> bm!45806 (= call!45806 call!45808)))

(declare-fun b!1097662 () Bool)

(assert (=> b!1097662 (= e!626482 e!626472)))

(assert (=> b!1097662 (= c!108389 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097663 () Bool)

(declare-fun Unit!35949 () Unit!35945)

(assert (=> b!1097663 (= e!626483 Unit!35949)))

(declare-fun b!1097664 () Bool)

(declare-fun c!108386 () Bool)

(assert (=> b!1097664 (= c!108386 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1097664 (= e!626472 e!626479)))

(declare-fun b!1097665 () Bool)

(declare-fun lt!490659 () Unit!35945)

(assert (=> b!1097665 (= e!626483 lt!490659)))

(declare-fun lt!490669 () ListLongMap!15325)

(assert (=> b!1097665 (= lt!490669 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490655 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490660 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490660 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490653 () Unit!35945)

(declare-fun addStillContains!650 (ListLongMap!15325 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!35945)

(assert (=> b!1097665 (= lt!490653 (addStillContains!650 lt!490669 lt!490655 zeroValue!831 lt!490660))))

(assert (=> b!1097665 (contains!6351 (+!3390 lt!490669 (tuple2!17357 lt!490655 zeroValue!831)) lt!490660)))

(declare-fun lt!490652 () Unit!35945)

(assert (=> b!1097665 (= lt!490652 lt!490653)))

(declare-fun lt!490666 () ListLongMap!15325)

(assert (=> b!1097665 (= lt!490666 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490667 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490664 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490664 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490670 () Unit!35945)

(declare-fun addApplyDifferent!506 (ListLongMap!15325 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!35945)

(assert (=> b!1097665 (= lt!490670 (addApplyDifferent!506 lt!490666 lt!490667 minValue!831 lt!490664))))

(assert (=> b!1097665 (= (apply!937 (+!3390 lt!490666 (tuple2!17357 lt!490667 minValue!831)) lt!490664) (apply!937 lt!490666 lt!490664))))

(declare-fun lt!490661 () Unit!35945)

(assert (=> b!1097665 (= lt!490661 lt!490670)))

(declare-fun lt!490650 () ListLongMap!15325)

(assert (=> b!1097665 (= lt!490650 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490658 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490657 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490657 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490663 () Unit!35945)

(assert (=> b!1097665 (= lt!490663 (addApplyDifferent!506 lt!490650 lt!490658 zeroValue!831 lt!490657))))

(assert (=> b!1097665 (= (apply!937 (+!3390 lt!490650 (tuple2!17357 lt!490658 zeroValue!831)) lt!490657) (apply!937 lt!490650 lt!490657))))

(declare-fun lt!490651 () Unit!35945)

(assert (=> b!1097665 (= lt!490651 lt!490663)))

(declare-fun lt!490656 () ListLongMap!15325)

(assert (=> b!1097665 (= lt!490656 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490668 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490668 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490665 () (_ BitVec 64))

(assert (=> b!1097665 (= lt!490665 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097665 (= lt!490659 (addApplyDifferent!506 lt!490656 lt!490668 minValue!831 lt!490665))))

(assert (=> b!1097665 (= (apply!937 (+!3390 lt!490656 (tuple2!17357 lt!490668 minValue!831)) lt!490665) (apply!937 lt!490656 lt!490665))))

(declare-fun b!1097666 () Bool)

(declare-fun e!626473 () Bool)

(assert (=> b!1097666 (= e!626474 e!626473)))

(declare-fun res!732611 () Bool)

(assert (=> b!1097666 (= res!732611 call!45805)))

(assert (=> b!1097666 (=> (not res!732611) (not e!626473))))

(declare-fun bm!45807 () Bool)

(assert (=> bm!45807 (= call!45808 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097667 () Bool)

(assert (=> b!1097667 (= e!626479 call!45811)))

(declare-fun b!1097668 () Bool)

(assert (=> b!1097668 (= e!626473 (= (apply!937 lt!490649 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097669 () Bool)

(assert (=> b!1097669 (= e!626477 e!626474)))

(declare-fun c!108387 () Bool)

(assert (=> b!1097669 (= c!108387 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097670 () Bool)

(declare-fun get!17609 (ValueCell!12851 V!41289) V!41289)

(assert (=> b!1097670 (= e!626471 (= (apply!937 lt!490649 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)) (get!17609 (select (arr!34202 _values!874) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34740 _values!874)))))

(assert (=> b!1097670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun bm!45808 () Bool)

(assert (=> bm!45808 (= call!45810 (contains!6351 lt!490649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097671 () Bool)

(assert (=> b!1097671 (= e!626475 e!626480)))

(declare-fun res!732616 () Bool)

(assert (=> b!1097671 (= res!732616 call!45810)))

(assert (=> b!1097671 (=> (not res!732616) (not e!626480))))

(assert (= (and d!130179 c!108391) b!1097657))

(assert (= (and d!130179 (not c!108391)) b!1097662))

(assert (= (and b!1097662 c!108389) b!1097656))

(assert (= (and b!1097662 (not c!108389)) b!1097664))

(assert (= (and b!1097664 c!108386) b!1097667))

(assert (= (and b!1097664 (not c!108386)) b!1097651))

(assert (= (or b!1097667 b!1097651) bm!45805))

(assert (= (or b!1097656 bm!45805) bm!45806))

(assert (= (or b!1097656 b!1097667) bm!45803))

(assert (= (or b!1097657 bm!45806) bm!45807))

(assert (= (or b!1097657 bm!45803) bm!45802))

(assert (= (and d!130179 res!732618) b!1097655))

(assert (= (and d!130179 c!108390) b!1097665))

(assert (= (and d!130179 (not c!108390)) b!1097663))

(assert (= (and d!130179 res!732610) b!1097654))

(assert (= (and b!1097654 res!732612) b!1097661))

(assert (= (and b!1097654 (not res!732614)) b!1097658))

(assert (= (and b!1097658 res!732613) b!1097670))

(assert (= (and b!1097654 res!732617) b!1097659))

(assert (= (and b!1097659 c!108388) b!1097671))

(assert (= (and b!1097659 (not c!108388)) b!1097652))

(assert (= (and b!1097671 res!732616) b!1097653))

(assert (= (or b!1097671 b!1097652) bm!45808))

(assert (= (and b!1097659 res!732615) b!1097669))

(assert (= (and b!1097669 c!108387) b!1097666))

(assert (= (and b!1097669 (not c!108387)) b!1097660))

(assert (= (and b!1097666 res!732611) b!1097668))

(assert (= (or b!1097666 b!1097660) bm!45804))

(declare-fun b_lambda!17745 () Bool)

(assert (=> (not b_lambda!17745) (not b!1097670)))

(assert (=> b!1097670 t!34058))

(declare-fun b_and!36805 () Bool)

(assert (= b_and!36795 (and (=> t!34058 result!16391) b_and!36805)))

(assert (=> d!130179 m!1016521))

(assert (=> b!1097658 m!1016669))

(assert (=> b!1097658 m!1016669))

(declare-fun m!1016679 () Bool)

(assert (=> b!1097658 m!1016679))

(declare-fun m!1016681 () Bool)

(assert (=> b!1097668 m!1016681))

(declare-fun m!1016683 () Bool)

(assert (=> b!1097653 m!1016683))

(assert (=> b!1097655 m!1016669))

(assert (=> b!1097655 m!1016669))

(assert (=> b!1097655 m!1016671))

(declare-fun m!1016685 () Bool)

(assert (=> b!1097665 m!1016685))

(declare-fun m!1016687 () Bool)

(assert (=> b!1097665 m!1016687))

(declare-fun m!1016689 () Bool)

(assert (=> b!1097665 m!1016689))

(declare-fun m!1016691 () Bool)

(assert (=> b!1097665 m!1016691))

(assert (=> b!1097665 m!1016687))

(declare-fun m!1016693 () Bool)

(assert (=> b!1097665 m!1016693))

(declare-fun m!1016695 () Bool)

(assert (=> b!1097665 m!1016695))

(declare-fun m!1016697 () Bool)

(assert (=> b!1097665 m!1016697))

(declare-fun m!1016699 () Bool)

(assert (=> b!1097665 m!1016699))

(assert (=> b!1097665 m!1016559))

(declare-fun m!1016701 () Bool)

(assert (=> b!1097665 m!1016701))

(declare-fun m!1016703 () Bool)

(assert (=> b!1097665 m!1016703))

(declare-fun m!1016705 () Bool)

(assert (=> b!1097665 m!1016705))

(declare-fun m!1016707 () Bool)

(assert (=> b!1097665 m!1016707))

(declare-fun m!1016709 () Bool)

(assert (=> b!1097665 m!1016709))

(declare-fun m!1016711 () Bool)

(assert (=> b!1097665 m!1016711))

(assert (=> b!1097665 m!1016705))

(assert (=> b!1097665 m!1016693))

(declare-fun m!1016713 () Bool)

(assert (=> b!1097665 m!1016713))

(assert (=> b!1097665 m!1016669))

(assert (=> b!1097665 m!1016695))

(declare-fun m!1016715 () Bool)

(assert (=> b!1097657 m!1016715))

(declare-fun m!1016717 () Bool)

(assert (=> b!1097670 m!1016717))

(assert (=> b!1097670 m!1016717))

(assert (=> b!1097670 m!1016545))

(declare-fun m!1016719 () Bool)

(assert (=> b!1097670 m!1016719))

(assert (=> b!1097670 m!1016545))

(assert (=> b!1097670 m!1016669))

(declare-fun m!1016721 () Bool)

(assert (=> b!1097670 m!1016721))

(assert (=> b!1097670 m!1016669))

(declare-fun m!1016723 () Bool)

(assert (=> bm!45802 m!1016723))

(assert (=> b!1097661 m!1016669))

(assert (=> b!1097661 m!1016669))

(assert (=> b!1097661 m!1016671))

(assert (=> bm!45807 m!1016559))

(declare-fun m!1016725 () Bool)

(assert (=> bm!45808 m!1016725))

(declare-fun m!1016727 () Bool)

(assert (=> bm!45804 m!1016727))

(assert (=> b!1097493 d!130179))

(declare-fun b!1097696 () Bool)

(declare-fun e!626504 () Bool)

(declare-fun e!626500 () Bool)

(assert (=> b!1097696 (= e!626504 e!626500)))

(declare-fun c!108403 () Bool)

(declare-fun e!626498 () Bool)

(assert (=> b!1097696 (= c!108403 e!626498)))

(declare-fun res!732627 () Bool)

(assert (=> b!1097696 (=> (not res!732627) (not e!626498))))

(assert (=> b!1097696 (= res!732627 (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun b!1097697 () Bool)

(declare-fun e!626499 () Bool)

(assert (=> b!1097697 (= e!626500 e!626499)))

(declare-fun c!108400 () Bool)

(assert (=> b!1097697 (= c!108400 (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun lt!490685 () ListLongMap!15325)

(declare-fun b!1097698 () Bool)

(assert (=> b!1097698 (= e!626499 (= lt!490685 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097699 () Bool)

(declare-fun e!626502 () ListLongMap!15325)

(declare-fun call!45814 () ListLongMap!15325)

(assert (=> b!1097699 (= e!626502 call!45814)))

(declare-fun b!1097700 () Bool)

(declare-fun lt!490686 () Unit!35945)

(declare-fun lt!490690 () Unit!35945)

(assert (=> b!1097700 (= lt!490686 lt!490690)))

(declare-fun lt!490689 () (_ BitVec 64))

(declare-fun lt!490691 () V!41289)

(declare-fun lt!490687 () (_ BitVec 64))

(declare-fun lt!490688 () ListLongMap!15325)

(assert (=> b!1097700 (not (contains!6351 (+!3390 lt!490688 (tuple2!17357 lt!490689 lt!490691)) lt!490687))))

(declare-fun addStillNotContains!273 (ListLongMap!15325 (_ BitVec 64) V!41289 (_ BitVec 64)) Unit!35945)

(assert (=> b!1097700 (= lt!490690 (addStillNotContains!273 lt!490688 lt!490689 lt!490691 lt!490687))))

(assert (=> b!1097700 (= lt!490687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097700 (= lt!490691 (get!17609 (select (arr!34202 lt!490538) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097700 (= lt!490689 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(assert (=> b!1097700 (= lt!490688 call!45814)))

(assert (=> b!1097700 (= e!626502 (+!3390 call!45814 (tuple2!17357 (select (arr!34203 lt!490530) #b00000000000000000000000000000000) (get!17609 (select (arr!34202 lt!490538) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097701 () Bool)

(declare-fun e!626503 () Bool)

(assert (=> b!1097701 (= e!626500 e!626503)))

(assert (=> b!1097701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun res!732628 () Bool)

(assert (=> b!1097701 (= res!732628 (contains!6351 lt!490685 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(assert (=> b!1097701 (=> (not res!732628) (not e!626503))))

(declare-fun b!1097702 () Bool)

(declare-fun isEmpty!967 (ListLongMap!15325) Bool)

(assert (=> b!1097702 (= e!626499 (isEmpty!967 lt!490685))))

(declare-fun b!1097704 () Bool)

(assert (=> b!1097704 (= e!626498 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(assert (=> b!1097704 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1097705 () Bool)

(declare-fun e!626501 () ListLongMap!15325)

(assert (=> b!1097705 (= e!626501 e!626502)))

(declare-fun c!108401 () Bool)

(assert (=> b!1097705 (= c!108401 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun b!1097706 () Bool)

(declare-fun res!732630 () Bool)

(assert (=> b!1097706 (=> (not res!732630) (not e!626504))))

(assert (=> b!1097706 (= res!732630 (not (contains!6351 lt!490685 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097707 () Bool)

(assert (=> b!1097707 (= e!626501 (ListLongMap!15326 Nil!23948))))

(declare-fun bm!45811 () Bool)

(assert (=> bm!45811 (= call!45814 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097703 () Bool)

(assert (=> b!1097703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(assert (=> b!1097703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34740 lt!490538)))))

(assert (=> b!1097703 (= e!626503 (= (apply!937 lt!490685 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)) (get!17609 (select (arr!34202 lt!490538) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130181 () Bool)

(assert (=> d!130181 e!626504))

(declare-fun res!732629 () Bool)

(assert (=> d!130181 (=> (not res!732629) (not e!626504))))

(assert (=> d!130181 (= res!732629 (not (contains!6351 lt!490685 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130181 (= lt!490685 e!626501)))

(declare-fun c!108402 () Bool)

(assert (=> d!130181 (= c!108402 (bvsge #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(assert (=> d!130181 (validMask!0 mask!1414)))

(assert (=> d!130181 (= (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490685)))

(assert (= (and d!130181 c!108402) b!1097707))

(assert (= (and d!130181 (not c!108402)) b!1097705))

(assert (= (and b!1097705 c!108401) b!1097700))

(assert (= (and b!1097705 (not c!108401)) b!1097699))

(assert (= (or b!1097700 b!1097699) bm!45811))

(assert (= (and d!130181 res!732629) b!1097706))

(assert (= (and b!1097706 res!732630) b!1097696))

(assert (= (and b!1097696 res!732627) b!1097704))

(assert (= (and b!1097696 c!108403) b!1097701))

(assert (= (and b!1097696 (not c!108403)) b!1097697))

(assert (= (and b!1097701 res!732628) b!1097703))

(assert (= (and b!1097697 c!108400) b!1097698))

(assert (= (and b!1097697 (not c!108400)) b!1097702))

(declare-fun b_lambda!17747 () Bool)

(assert (=> (not b_lambda!17747) (not b!1097700)))

(assert (=> b!1097700 t!34058))

(declare-fun b_and!36807 () Bool)

(assert (= b_and!36805 (and (=> t!34058 result!16391) b_and!36807)))

(declare-fun b_lambda!17749 () Bool)

(assert (=> (not b_lambda!17749) (not b!1097703)))

(assert (=> b!1097703 t!34058))

(declare-fun b_and!36809 () Bool)

(assert (= b_and!36807 (and (=> t!34058 result!16391) b_and!36809)))

(declare-fun m!1016729 () Bool)

(assert (=> bm!45811 m!1016729))

(declare-fun m!1016731 () Bool)

(assert (=> b!1097705 m!1016731))

(assert (=> b!1097705 m!1016731))

(declare-fun m!1016733 () Bool)

(assert (=> b!1097705 m!1016733))

(declare-fun m!1016735 () Bool)

(assert (=> b!1097703 m!1016735))

(assert (=> b!1097703 m!1016731))

(declare-fun m!1016737 () Bool)

(assert (=> b!1097703 m!1016737))

(assert (=> b!1097703 m!1016735))

(assert (=> b!1097703 m!1016545))

(declare-fun m!1016739 () Bool)

(assert (=> b!1097703 m!1016739))

(assert (=> b!1097703 m!1016731))

(assert (=> b!1097703 m!1016545))

(declare-fun m!1016741 () Bool)

(assert (=> b!1097702 m!1016741))

(assert (=> b!1097700 m!1016735))

(declare-fun m!1016743 () Bool)

(assert (=> b!1097700 m!1016743))

(declare-fun m!1016745 () Bool)

(assert (=> b!1097700 m!1016745))

(assert (=> b!1097700 m!1016731))

(assert (=> b!1097700 m!1016545))

(assert (=> b!1097700 m!1016745))

(declare-fun m!1016747 () Bool)

(assert (=> b!1097700 m!1016747))

(declare-fun m!1016749 () Bool)

(assert (=> b!1097700 m!1016749))

(assert (=> b!1097700 m!1016735))

(assert (=> b!1097700 m!1016545))

(assert (=> b!1097700 m!1016739))

(declare-fun m!1016751 () Bool)

(assert (=> b!1097706 m!1016751))

(assert (=> b!1097704 m!1016731))

(assert (=> b!1097704 m!1016731))

(assert (=> b!1097704 m!1016733))

(assert (=> b!1097701 m!1016731))

(assert (=> b!1097701 m!1016731))

(declare-fun m!1016753 () Bool)

(assert (=> b!1097701 m!1016753))

(assert (=> b!1097698 m!1016729))

(declare-fun m!1016755 () Bool)

(assert (=> d!130181 m!1016755))

(assert (=> d!130181 m!1016521))

(assert (=> b!1097493 d!130181))

(declare-fun b!1097714 () Bool)

(declare-fun e!626510 () Bool)

(declare-fun call!45819 () ListLongMap!15325)

(declare-fun call!45820 () ListLongMap!15325)

(assert (=> b!1097714 (= e!626510 (= call!45819 call!45820))))

(assert (=> b!1097714 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34740 _values!874)))))

(declare-fun bm!45816 () Bool)

(assert (=> bm!45816 (= call!45819 (getCurrentListMapNoExtraKeys!4211 (array!71065 (store (arr!34203 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34741 _keys!1070)) (array!71063 (store (arr!34202 _values!874) i!650 (ValueCellFull!12851 (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34740 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45817 () Bool)

(assert (=> bm!45817 (= call!45820 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097715 () Bool)

(assert (=> b!1097715 (= e!626510 (= call!45819 (-!918 call!45820 k0!904)))))

(assert (=> b!1097715 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34740 _values!874)))))

(declare-fun b!1097716 () Bool)

(declare-fun e!626509 () Bool)

(assert (=> b!1097716 (= e!626509 e!626510)))

(declare-fun c!108406 () Bool)

(assert (=> b!1097716 (= c!108406 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!130183 () Bool)

(assert (=> d!130183 e!626509))

(declare-fun res!732633 () Bool)

(assert (=> d!130183 (=> (not res!732633) (not e!626509))))

(assert (=> d!130183 (= res!732633 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34741 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34741 _keys!1070))))))))

(declare-fun lt!490694 () Unit!35945)

(declare-fun choose!1770 (array!71064 array!71062 (_ BitVec 32) (_ BitVec 32) V!41289 V!41289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35945)

(assert (=> d!130183 (= lt!490694 (choose!1770 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(assert (=> d!130183 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!490694)))

(assert (= (and d!130183 res!732633) b!1097716))

(assert (= (and b!1097716 c!108406) b!1097715))

(assert (= (and b!1097716 (not c!108406)) b!1097714))

(assert (= (or b!1097715 b!1097714) bm!45817))

(assert (= (or b!1097715 b!1097714) bm!45816))

(declare-fun b_lambda!17751 () Bool)

(assert (=> (not b_lambda!17751) (not bm!45816)))

(assert (=> bm!45816 t!34058))

(declare-fun b_and!36811 () Bool)

(assert (= b_and!36809 (and (=> t!34058 result!16391) b_and!36811)))

(assert (=> bm!45816 m!1016539))

(assert (=> bm!45816 m!1016545))

(assert (=> bm!45816 m!1016549))

(declare-fun m!1016757 () Bool)

(assert (=> bm!45816 m!1016757))

(assert (=> bm!45817 m!1016559))

(declare-fun m!1016759 () Bool)

(assert (=> b!1097715 m!1016759))

(declare-fun m!1016761 () Bool)

(assert (=> d!130183 m!1016761))

(assert (=> b!1097493 d!130183))

(declare-fun d!130185 () Bool)

(declare-fun lt!490697 () ListLongMap!15325)

(assert (=> d!130185 (not (contains!6351 lt!490697 k0!904))))

(declare-fun removeStrictlySorted!78 (List!23951 (_ BitVec 64)) List!23951)

(assert (=> d!130185 (= lt!490697 (ListLongMap!15326 (removeStrictlySorted!78 (toList!7678 lt!490537) k0!904)))))

(assert (=> d!130185 (= (-!918 lt!490537 k0!904) lt!490697)))

(declare-fun bs!32230 () Bool)

(assert (= bs!32230 d!130185))

(declare-fun m!1016763 () Bool)

(assert (=> bs!32230 m!1016763))

(declare-fun m!1016765 () Bool)

(assert (=> bs!32230 m!1016765))

(assert (=> b!1097493 d!130185))

(declare-fun b!1097717 () Bool)

(declare-fun e!626517 () Bool)

(declare-fun e!626513 () Bool)

(assert (=> b!1097717 (= e!626517 e!626513)))

(declare-fun c!108410 () Bool)

(declare-fun e!626511 () Bool)

(assert (=> b!1097717 (= c!108410 e!626511)))

(declare-fun res!732634 () Bool)

(assert (=> b!1097717 (=> (not res!732634) (not e!626511))))

(assert (=> b!1097717 (= res!732634 (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun b!1097718 () Bool)

(declare-fun e!626512 () Bool)

(assert (=> b!1097718 (= e!626513 e!626512)))

(declare-fun c!108407 () Bool)

(assert (=> b!1097718 (= c!108407 (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun lt!490698 () ListLongMap!15325)

(declare-fun b!1097719 () Bool)

(assert (=> b!1097719 (= e!626512 (= lt!490698 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097720 () Bool)

(declare-fun e!626515 () ListLongMap!15325)

(declare-fun call!45821 () ListLongMap!15325)

(assert (=> b!1097720 (= e!626515 call!45821)))

(declare-fun b!1097721 () Bool)

(declare-fun lt!490699 () Unit!35945)

(declare-fun lt!490703 () Unit!35945)

(assert (=> b!1097721 (= lt!490699 lt!490703)))

(declare-fun lt!490702 () (_ BitVec 64))

(declare-fun lt!490704 () V!41289)

(declare-fun lt!490700 () (_ BitVec 64))

(declare-fun lt!490701 () ListLongMap!15325)

(assert (=> b!1097721 (not (contains!6351 (+!3390 lt!490701 (tuple2!17357 lt!490702 lt!490704)) lt!490700))))

(assert (=> b!1097721 (= lt!490703 (addStillNotContains!273 lt!490701 lt!490702 lt!490704 lt!490700))))

(assert (=> b!1097721 (= lt!490700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097721 (= lt!490704 (get!17609 (select (arr!34202 _values!874) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097721 (= lt!490702 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097721 (= lt!490701 call!45821)))

(assert (=> b!1097721 (= e!626515 (+!3390 call!45821 (tuple2!17357 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000) (get!17609 (select (arr!34202 _values!874) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097722 () Bool)

(declare-fun e!626516 () Bool)

(assert (=> b!1097722 (= e!626513 e!626516)))

(assert (=> b!1097722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(declare-fun res!732635 () Bool)

(assert (=> b!1097722 (= res!732635 (contains!6351 lt!490698 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097722 (=> (not res!732635) (not e!626516))))

(declare-fun b!1097723 () Bool)

(assert (=> b!1097723 (= e!626512 (isEmpty!967 lt!490698))))

(declare-fun b!1097725 () Bool)

(assert (=> b!1097725 (= e!626511 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097725 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1097726 () Bool)

(declare-fun e!626514 () ListLongMap!15325)

(assert (=> b!1097726 (= e!626514 e!626515)))

(declare-fun c!108408 () Bool)

(assert (=> b!1097726 (= c!108408 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097727 () Bool)

(declare-fun res!732637 () Bool)

(assert (=> b!1097727 (=> (not res!732637) (not e!626517))))

(assert (=> b!1097727 (= res!732637 (not (contains!6351 lt!490698 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097728 () Bool)

(assert (=> b!1097728 (= e!626514 (ListLongMap!15326 Nil!23948))))

(declare-fun bm!45818 () Bool)

(assert (=> bm!45818 (= call!45821 (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097724 () Bool)

(assert (=> b!1097724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(assert (=> b!1097724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34740 _values!874)))))

(assert (=> b!1097724 (= e!626516 (= (apply!937 lt!490698 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)) (get!17609 (select (arr!34202 _values!874) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130187 () Bool)

(assert (=> d!130187 e!626517))

(declare-fun res!732636 () Bool)

(assert (=> d!130187 (=> (not res!732636) (not e!626517))))

(assert (=> d!130187 (= res!732636 (not (contains!6351 lt!490698 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130187 (= lt!490698 e!626514)))

(declare-fun c!108409 () Bool)

(assert (=> d!130187 (= c!108409 (bvsge #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(assert (=> d!130187 (validMask!0 mask!1414)))

(assert (=> d!130187 (= (getCurrentListMapNoExtraKeys!4211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490698)))

(assert (= (and d!130187 c!108409) b!1097728))

(assert (= (and d!130187 (not c!108409)) b!1097726))

(assert (= (and b!1097726 c!108408) b!1097721))

(assert (= (and b!1097726 (not c!108408)) b!1097720))

(assert (= (or b!1097721 b!1097720) bm!45818))

(assert (= (and d!130187 res!732636) b!1097727))

(assert (= (and b!1097727 res!732637) b!1097717))

(assert (= (and b!1097717 res!732634) b!1097725))

(assert (= (and b!1097717 c!108410) b!1097722))

(assert (= (and b!1097717 (not c!108410)) b!1097718))

(assert (= (and b!1097722 res!732635) b!1097724))

(assert (= (and b!1097718 c!108407) b!1097719))

(assert (= (and b!1097718 (not c!108407)) b!1097723))

(declare-fun b_lambda!17753 () Bool)

(assert (=> (not b_lambda!17753) (not b!1097721)))

(assert (=> b!1097721 t!34058))

(declare-fun b_and!36813 () Bool)

(assert (= b_and!36811 (and (=> t!34058 result!16391) b_and!36813)))

(declare-fun b_lambda!17755 () Bool)

(assert (=> (not b_lambda!17755) (not b!1097724)))

(assert (=> b!1097724 t!34058))

(declare-fun b_and!36815 () Bool)

(assert (= b_and!36813 (and (=> t!34058 result!16391) b_and!36815)))

(declare-fun m!1016767 () Bool)

(assert (=> bm!45818 m!1016767))

(assert (=> b!1097726 m!1016669))

(assert (=> b!1097726 m!1016669))

(assert (=> b!1097726 m!1016671))

(assert (=> b!1097724 m!1016717))

(assert (=> b!1097724 m!1016669))

(declare-fun m!1016769 () Bool)

(assert (=> b!1097724 m!1016769))

(assert (=> b!1097724 m!1016717))

(assert (=> b!1097724 m!1016545))

(assert (=> b!1097724 m!1016719))

(assert (=> b!1097724 m!1016669))

(assert (=> b!1097724 m!1016545))

(declare-fun m!1016771 () Bool)

(assert (=> b!1097723 m!1016771))

(assert (=> b!1097721 m!1016717))

(declare-fun m!1016773 () Bool)

(assert (=> b!1097721 m!1016773))

(declare-fun m!1016775 () Bool)

(assert (=> b!1097721 m!1016775))

(assert (=> b!1097721 m!1016669))

(assert (=> b!1097721 m!1016545))

(assert (=> b!1097721 m!1016775))

(declare-fun m!1016777 () Bool)

(assert (=> b!1097721 m!1016777))

(declare-fun m!1016779 () Bool)

(assert (=> b!1097721 m!1016779))

(assert (=> b!1097721 m!1016717))

(assert (=> b!1097721 m!1016545))

(assert (=> b!1097721 m!1016719))

(declare-fun m!1016781 () Bool)

(assert (=> b!1097727 m!1016781))

(assert (=> b!1097725 m!1016669))

(assert (=> b!1097725 m!1016669))

(assert (=> b!1097725 m!1016671))

(assert (=> b!1097722 m!1016669))

(assert (=> b!1097722 m!1016669))

(declare-fun m!1016783 () Bool)

(assert (=> b!1097722 m!1016783))

(assert (=> b!1097719 m!1016767))

(declare-fun m!1016785 () Bool)

(assert (=> d!130187 m!1016785))

(assert (=> d!130187 m!1016521))

(assert (=> b!1097493 d!130187))

(declare-fun d!130189 () Bool)

(declare-fun e!626524 () Bool)

(assert (=> d!130189 e!626524))

(declare-fun res!732638 () Bool)

(assert (=> d!130189 (=> (not res!732638) (not e!626524))))

(assert (=> d!130189 (= res!732638 (or (bvsge #b00000000000000000000000000000000 (size!34741 lt!490530)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))))

(declare-fun lt!490705 () ListLongMap!15325)

(declare-fun lt!490718 () ListLongMap!15325)

(assert (=> d!130189 (= lt!490705 lt!490718)))

(declare-fun lt!490710 () Unit!35945)

(declare-fun e!626530 () Unit!35945)

(assert (=> d!130189 (= lt!490710 e!626530)))

(declare-fun c!108415 () Bool)

(declare-fun e!626525 () Bool)

(assert (=> d!130189 (= c!108415 e!626525)))

(declare-fun res!732646 () Bool)

(assert (=> d!130189 (=> (not res!732646) (not e!626525))))

(assert (=> d!130189 (= res!732646 (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun e!626529 () ListLongMap!15325)

(assert (=> d!130189 (= lt!490718 e!626529)))

(declare-fun c!108416 () Bool)

(assert (=> d!130189 (= c!108416 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130189 (validMask!0 mask!1414)))

(assert (=> d!130189 (= (getCurrentListMap!4304 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490705)))

(declare-fun b!1097729 () Bool)

(declare-fun e!626526 () ListLongMap!15325)

(declare-fun call!45826 () ListLongMap!15325)

(assert (=> b!1097729 (= e!626526 call!45826)))

(declare-fun call!45825 () ListLongMap!15325)

(declare-fun bm!45819 () Bool)

(declare-fun call!45823 () ListLongMap!15325)

(declare-fun c!108414 () Bool)

(declare-fun call!45824 () ListLongMap!15325)

(assert (=> bm!45819 (= call!45824 (+!3390 (ite c!108416 call!45825 (ite c!108414 call!45823 call!45826)) (ite (or c!108416 c!108414) (tuple2!17357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097730 () Bool)

(declare-fun e!626522 () Bool)

(declare-fun call!45827 () Bool)

(assert (=> b!1097730 (= e!626522 (not call!45827))))

(declare-fun b!1097731 () Bool)

(declare-fun e!626527 () Bool)

(assert (=> b!1097731 (= e!626527 (= (apply!937 lt!490705 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097732 () Bool)

(declare-fun res!732645 () Bool)

(assert (=> b!1097732 (=> (not res!732645) (not e!626524))))

(declare-fun e!626523 () Bool)

(assert (=> b!1097732 (= res!732645 e!626523)))

(declare-fun res!732642 () Bool)

(assert (=> b!1097732 (=> res!732642 e!626523)))

(declare-fun e!626528 () Bool)

(assert (=> b!1097732 (= res!732642 (not e!626528))))

(declare-fun res!732640 () Bool)

(assert (=> b!1097732 (=> (not res!732640) (not e!626528))))

(assert (=> b!1097732 (= res!732640 (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun b!1097733 () Bool)

(assert (=> b!1097733 (= e!626525 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun b!1097734 () Bool)

(declare-fun e!626519 () ListLongMap!15325)

(declare-fun call!45828 () ListLongMap!15325)

(assert (=> b!1097734 (= e!626519 call!45828)))

(declare-fun bm!45820 () Bool)

(assert (=> bm!45820 (= call!45828 call!45824)))

(declare-fun b!1097735 () Bool)

(assert (=> b!1097735 (= e!626529 (+!3390 call!45824 (tuple2!17357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45821 () Bool)

(declare-fun call!45822 () Bool)

(assert (=> bm!45821 (= call!45822 (contains!6351 lt!490705 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097736 () Bool)

(declare-fun e!626518 () Bool)

(assert (=> b!1097736 (= e!626523 e!626518)))

(declare-fun res!732641 () Bool)

(assert (=> b!1097736 (=> (not res!732641) (not e!626518))))

(assert (=> b!1097736 (= res!732641 (contains!6351 lt!490705 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(assert (=> b!1097736 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun b!1097737 () Bool)

(declare-fun res!732643 () Bool)

(assert (=> b!1097737 (=> (not res!732643) (not e!626524))))

(assert (=> b!1097737 (= res!732643 e!626522)))

(declare-fun c!108413 () Bool)

(assert (=> b!1097737 (= c!108413 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45822 () Bool)

(assert (=> bm!45822 (= call!45826 call!45823)))

(declare-fun b!1097738 () Bool)

(declare-fun e!626521 () Bool)

(assert (=> b!1097738 (= e!626521 (not call!45822))))

(declare-fun b!1097739 () Bool)

(assert (=> b!1097739 (= e!626528 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun bm!45823 () Bool)

(assert (=> bm!45823 (= call!45823 call!45825)))

(declare-fun b!1097740 () Bool)

(assert (=> b!1097740 (= e!626529 e!626519)))

(assert (=> b!1097740 (= c!108414 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097741 () Bool)

(declare-fun Unit!35950 () Unit!35945)

(assert (=> b!1097741 (= e!626530 Unit!35950)))

(declare-fun b!1097742 () Bool)

(declare-fun c!108411 () Bool)

(assert (=> b!1097742 (= c!108411 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1097742 (= e!626519 e!626526)))

(declare-fun b!1097743 () Bool)

(declare-fun lt!490715 () Unit!35945)

(assert (=> b!1097743 (= e!626530 lt!490715)))

(declare-fun lt!490725 () ListLongMap!15325)

(assert (=> b!1097743 (= lt!490725 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490711 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490716 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490716 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(declare-fun lt!490709 () Unit!35945)

(assert (=> b!1097743 (= lt!490709 (addStillContains!650 lt!490725 lt!490711 zeroValue!831 lt!490716))))

(assert (=> b!1097743 (contains!6351 (+!3390 lt!490725 (tuple2!17357 lt!490711 zeroValue!831)) lt!490716)))

(declare-fun lt!490708 () Unit!35945)

(assert (=> b!1097743 (= lt!490708 lt!490709)))

(declare-fun lt!490722 () ListLongMap!15325)

(assert (=> b!1097743 (= lt!490722 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490723 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490720 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490720 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(declare-fun lt!490726 () Unit!35945)

(assert (=> b!1097743 (= lt!490726 (addApplyDifferent!506 lt!490722 lt!490723 minValue!831 lt!490720))))

(assert (=> b!1097743 (= (apply!937 (+!3390 lt!490722 (tuple2!17357 lt!490723 minValue!831)) lt!490720) (apply!937 lt!490722 lt!490720))))

(declare-fun lt!490717 () Unit!35945)

(assert (=> b!1097743 (= lt!490717 lt!490726)))

(declare-fun lt!490706 () ListLongMap!15325)

(assert (=> b!1097743 (= lt!490706 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490714 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490713 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490713 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(declare-fun lt!490719 () Unit!35945)

(assert (=> b!1097743 (= lt!490719 (addApplyDifferent!506 lt!490706 lt!490714 zeroValue!831 lt!490713))))

(assert (=> b!1097743 (= (apply!937 (+!3390 lt!490706 (tuple2!17357 lt!490714 zeroValue!831)) lt!490713) (apply!937 lt!490706 lt!490713))))

(declare-fun lt!490707 () Unit!35945)

(assert (=> b!1097743 (= lt!490707 lt!490719)))

(declare-fun lt!490712 () ListLongMap!15325)

(assert (=> b!1097743 (= lt!490712 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490724 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490724 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490721 () (_ BitVec 64))

(assert (=> b!1097743 (= lt!490721 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(assert (=> b!1097743 (= lt!490715 (addApplyDifferent!506 lt!490712 lt!490724 minValue!831 lt!490721))))

(assert (=> b!1097743 (= (apply!937 (+!3390 lt!490712 (tuple2!17357 lt!490724 minValue!831)) lt!490721) (apply!937 lt!490712 lt!490721))))

(declare-fun b!1097744 () Bool)

(declare-fun e!626520 () Bool)

(assert (=> b!1097744 (= e!626521 e!626520)))

(declare-fun res!732639 () Bool)

(assert (=> b!1097744 (= res!732639 call!45822)))

(assert (=> b!1097744 (=> (not res!732639) (not e!626520))))

(declare-fun bm!45824 () Bool)

(assert (=> bm!45824 (= call!45825 (getCurrentListMapNoExtraKeys!4211 lt!490530 lt!490538 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097745 () Bool)

(assert (=> b!1097745 (= e!626526 call!45828)))

(declare-fun b!1097746 () Bool)

(assert (=> b!1097746 (= e!626520 (= (apply!937 lt!490705 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097747 () Bool)

(assert (=> b!1097747 (= e!626524 e!626521)))

(declare-fun c!108412 () Bool)

(assert (=> b!1097747 (= c!108412 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097748 () Bool)

(assert (=> b!1097748 (= e!626518 (= (apply!937 lt!490705 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)) (get!17609 (select (arr!34202 lt!490538) #b00000000000000000000000000000000) (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34740 lt!490538)))))

(assert (=> b!1097748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(declare-fun bm!45825 () Bool)

(assert (=> bm!45825 (= call!45827 (contains!6351 lt!490705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097749 () Bool)

(assert (=> b!1097749 (= e!626522 e!626527)))

(declare-fun res!732644 () Bool)

(assert (=> b!1097749 (= res!732644 call!45827)))

(assert (=> b!1097749 (=> (not res!732644) (not e!626527))))

(assert (= (and d!130189 c!108416) b!1097735))

(assert (= (and d!130189 (not c!108416)) b!1097740))

(assert (= (and b!1097740 c!108414) b!1097734))

(assert (= (and b!1097740 (not c!108414)) b!1097742))

(assert (= (and b!1097742 c!108411) b!1097745))

(assert (= (and b!1097742 (not c!108411)) b!1097729))

(assert (= (or b!1097745 b!1097729) bm!45822))

(assert (= (or b!1097734 bm!45822) bm!45823))

(assert (= (or b!1097734 b!1097745) bm!45820))

(assert (= (or b!1097735 bm!45823) bm!45824))

(assert (= (or b!1097735 bm!45820) bm!45819))

(assert (= (and d!130189 res!732646) b!1097733))

(assert (= (and d!130189 c!108415) b!1097743))

(assert (= (and d!130189 (not c!108415)) b!1097741))

(assert (= (and d!130189 res!732638) b!1097732))

(assert (= (and b!1097732 res!732640) b!1097739))

(assert (= (and b!1097732 (not res!732642)) b!1097736))

(assert (= (and b!1097736 res!732641) b!1097748))

(assert (= (and b!1097732 res!732645) b!1097737))

(assert (= (and b!1097737 c!108413) b!1097749))

(assert (= (and b!1097737 (not c!108413)) b!1097730))

(assert (= (and b!1097749 res!732644) b!1097731))

(assert (= (or b!1097749 b!1097730) bm!45825))

(assert (= (and b!1097737 res!732643) b!1097747))

(assert (= (and b!1097747 c!108412) b!1097744))

(assert (= (and b!1097747 (not c!108412)) b!1097738))

(assert (= (and b!1097744 res!732639) b!1097746))

(assert (= (or b!1097744 b!1097738) bm!45821))

(declare-fun b_lambda!17757 () Bool)

(assert (=> (not b_lambda!17757) (not b!1097748)))

(assert (=> b!1097748 t!34058))

(declare-fun b_and!36817 () Bool)

(assert (= b_and!36815 (and (=> t!34058 result!16391) b_and!36817)))

(assert (=> d!130189 m!1016521))

(assert (=> b!1097736 m!1016731))

(assert (=> b!1097736 m!1016731))

(declare-fun m!1016787 () Bool)

(assert (=> b!1097736 m!1016787))

(declare-fun m!1016789 () Bool)

(assert (=> b!1097746 m!1016789))

(declare-fun m!1016791 () Bool)

(assert (=> b!1097731 m!1016791))

(assert (=> b!1097733 m!1016731))

(assert (=> b!1097733 m!1016731))

(assert (=> b!1097733 m!1016733))

(declare-fun m!1016793 () Bool)

(assert (=> b!1097743 m!1016793))

(declare-fun m!1016795 () Bool)

(assert (=> b!1097743 m!1016795))

(declare-fun m!1016797 () Bool)

(assert (=> b!1097743 m!1016797))

(declare-fun m!1016799 () Bool)

(assert (=> b!1097743 m!1016799))

(assert (=> b!1097743 m!1016795))

(declare-fun m!1016801 () Bool)

(assert (=> b!1097743 m!1016801))

(declare-fun m!1016803 () Bool)

(assert (=> b!1097743 m!1016803))

(declare-fun m!1016805 () Bool)

(assert (=> b!1097743 m!1016805))

(declare-fun m!1016807 () Bool)

(assert (=> b!1097743 m!1016807))

(assert (=> b!1097743 m!1016557))

(declare-fun m!1016809 () Bool)

(assert (=> b!1097743 m!1016809))

(declare-fun m!1016811 () Bool)

(assert (=> b!1097743 m!1016811))

(declare-fun m!1016813 () Bool)

(assert (=> b!1097743 m!1016813))

(declare-fun m!1016815 () Bool)

(assert (=> b!1097743 m!1016815))

(declare-fun m!1016817 () Bool)

(assert (=> b!1097743 m!1016817))

(declare-fun m!1016819 () Bool)

(assert (=> b!1097743 m!1016819))

(assert (=> b!1097743 m!1016813))

(assert (=> b!1097743 m!1016801))

(declare-fun m!1016821 () Bool)

(assert (=> b!1097743 m!1016821))

(assert (=> b!1097743 m!1016731))

(assert (=> b!1097743 m!1016803))

(declare-fun m!1016823 () Bool)

(assert (=> b!1097735 m!1016823))

(assert (=> b!1097748 m!1016735))

(assert (=> b!1097748 m!1016735))

(assert (=> b!1097748 m!1016545))

(assert (=> b!1097748 m!1016739))

(assert (=> b!1097748 m!1016545))

(assert (=> b!1097748 m!1016731))

(declare-fun m!1016825 () Bool)

(assert (=> b!1097748 m!1016825))

(assert (=> b!1097748 m!1016731))

(declare-fun m!1016827 () Bool)

(assert (=> bm!45819 m!1016827))

(assert (=> b!1097739 m!1016731))

(assert (=> b!1097739 m!1016731))

(assert (=> b!1097739 m!1016733))

(assert (=> bm!45824 m!1016557))

(declare-fun m!1016829 () Bool)

(assert (=> bm!45825 m!1016829))

(declare-fun m!1016831 () Bool)

(assert (=> bm!45821 m!1016831))

(assert (=> b!1097493 d!130189))

(declare-fun d!130191 () Bool)

(assert (=> d!130191 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490729 () Unit!35945)

(declare-fun choose!13 (array!71064 (_ BitVec 64) (_ BitVec 32)) Unit!35945)

(assert (=> d!130191 (= lt!490729 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130191 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130191 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!490729)))

(declare-fun bs!32231 () Bool)

(assert (= bs!32231 d!130191))

(assert (=> bs!32231 m!1016553))

(declare-fun m!1016833 () Bool)

(assert (=> bs!32231 m!1016833))

(assert (=> b!1097493 d!130191))

(declare-fun d!130193 () Bool)

(declare-fun e!626533 () Bool)

(assert (=> d!130193 e!626533))

(declare-fun res!732651 () Bool)

(assert (=> d!130193 (=> (not res!732651) (not e!626533))))

(declare-fun lt!490741 () ListLongMap!15325)

(assert (=> d!130193 (= res!732651 (contains!6351 lt!490741 (_1!8689 lt!490528)))))

(declare-fun lt!490740 () List!23951)

(assert (=> d!130193 (= lt!490741 (ListLongMap!15326 lt!490740))))

(declare-fun lt!490739 () Unit!35945)

(declare-fun lt!490738 () Unit!35945)

(assert (=> d!130193 (= lt!490739 lt!490738)))

(declare-datatypes ((Option!672 0))(
  ( (Some!671 (v!16241 V!41289)) (None!670) )
))
(declare-fun getValueByKey!621 (List!23951 (_ BitVec 64)) Option!672)

(assert (=> d!130193 (= (getValueByKey!621 lt!490740 (_1!8689 lt!490528)) (Some!671 (_2!8689 lt!490528)))))

(declare-fun lemmaContainsTupThenGetReturnValue!297 (List!23951 (_ BitVec 64) V!41289) Unit!35945)

(assert (=> d!130193 (= lt!490738 (lemmaContainsTupThenGetReturnValue!297 lt!490740 (_1!8689 lt!490528) (_2!8689 lt!490528)))))

(declare-fun insertStrictlySorted!390 (List!23951 (_ BitVec 64) V!41289) List!23951)

(assert (=> d!130193 (= lt!490740 (insertStrictlySorted!390 (toList!7678 (+!3390 lt!490537 lt!490533)) (_1!8689 lt!490528) (_2!8689 lt!490528)))))

(assert (=> d!130193 (= (+!3390 (+!3390 lt!490537 lt!490533) lt!490528) lt!490741)))

(declare-fun b!1097754 () Bool)

(declare-fun res!732652 () Bool)

(assert (=> b!1097754 (=> (not res!732652) (not e!626533))))

(assert (=> b!1097754 (= res!732652 (= (getValueByKey!621 (toList!7678 lt!490741) (_1!8689 lt!490528)) (Some!671 (_2!8689 lt!490528))))))

(declare-fun b!1097755 () Bool)

(declare-fun contains!6352 (List!23951 tuple2!17356) Bool)

(assert (=> b!1097755 (= e!626533 (contains!6352 (toList!7678 lt!490741) lt!490528))))

(assert (= (and d!130193 res!732651) b!1097754))

(assert (= (and b!1097754 res!732652) b!1097755))

(declare-fun m!1016835 () Bool)

(assert (=> d!130193 m!1016835))

(declare-fun m!1016837 () Bool)

(assert (=> d!130193 m!1016837))

(declare-fun m!1016839 () Bool)

(assert (=> d!130193 m!1016839))

(declare-fun m!1016841 () Bool)

(assert (=> d!130193 m!1016841))

(declare-fun m!1016843 () Bool)

(assert (=> b!1097754 m!1016843))

(declare-fun m!1016845 () Bool)

(assert (=> b!1097755 m!1016845))

(assert (=> b!1097499 d!130193))

(declare-fun d!130195 () Bool)

(declare-fun e!626534 () Bool)

(assert (=> d!130195 e!626534))

(declare-fun res!732653 () Bool)

(assert (=> d!130195 (=> (not res!732653) (not e!626534))))

(declare-fun lt!490745 () ListLongMap!15325)

(assert (=> d!130195 (= res!732653 (contains!6351 lt!490745 (_1!8689 lt!490533)))))

(declare-fun lt!490744 () List!23951)

(assert (=> d!130195 (= lt!490745 (ListLongMap!15326 lt!490744))))

(declare-fun lt!490743 () Unit!35945)

(declare-fun lt!490742 () Unit!35945)

(assert (=> d!130195 (= lt!490743 lt!490742)))

(assert (=> d!130195 (= (getValueByKey!621 lt!490744 (_1!8689 lt!490533)) (Some!671 (_2!8689 lt!490533)))))

(assert (=> d!130195 (= lt!490742 (lemmaContainsTupThenGetReturnValue!297 lt!490744 (_1!8689 lt!490533) (_2!8689 lt!490533)))))

(assert (=> d!130195 (= lt!490744 (insertStrictlySorted!390 (toList!7678 lt!490537) (_1!8689 lt!490533) (_2!8689 lt!490533)))))

(assert (=> d!130195 (= (+!3390 lt!490537 lt!490533) lt!490745)))

(declare-fun b!1097756 () Bool)

(declare-fun res!732654 () Bool)

(assert (=> b!1097756 (=> (not res!732654) (not e!626534))))

(assert (=> b!1097756 (= res!732654 (= (getValueByKey!621 (toList!7678 lt!490745) (_1!8689 lt!490533)) (Some!671 (_2!8689 lt!490533))))))

(declare-fun b!1097757 () Bool)

(assert (=> b!1097757 (= e!626534 (contains!6352 (toList!7678 lt!490745) lt!490533))))

(assert (= (and d!130195 res!732653) b!1097756))

(assert (= (and b!1097756 res!732654) b!1097757))

(declare-fun m!1016847 () Bool)

(assert (=> d!130195 m!1016847))

(declare-fun m!1016849 () Bool)

(assert (=> d!130195 m!1016849))

(declare-fun m!1016851 () Bool)

(assert (=> d!130195 m!1016851))

(declare-fun m!1016853 () Bool)

(assert (=> d!130195 m!1016853))

(declare-fun m!1016855 () Bool)

(assert (=> b!1097756 m!1016855))

(declare-fun m!1016857 () Bool)

(assert (=> b!1097757 m!1016857))

(assert (=> b!1097499 d!130195))

(declare-fun d!130197 () Bool)

(declare-fun e!626535 () Bool)

(assert (=> d!130197 e!626535))

(declare-fun res!732655 () Bool)

(assert (=> d!130197 (=> (not res!732655) (not e!626535))))

(declare-fun lt!490749 () ListLongMap!15325)

(assert (=> d!130197 (= res!732655 (contains!6351 lt!490749 (_1!8689 lt!490528)))))

(declare-fun lt!490748 () List!23951)

(assert (=> d!130197 (= lt!490749 (ListLongMap!15326 lt!490748))))

(declare-fun lt!490747 () Unit!35945)

(declare-fun lt!490746 () Unit!35945)

(assert (=> d!130197 (= lt!490747 lt!490746)))

(assert (=> d!130197 (= (getValueByKey!621 lt!490748 (_1!8689 lt!490528)) (Some!671 (_2!8689 lt!490528)))))

(assert (=> d!130197 (= lt!490746 (lemmaContainsTupThenGetReturnValue!297 lt!490748 (_1!8689 lt!490528) (_2!8689 lt!490528)))))

(assert (=> d!130197 (= lt!490748 (insertStrictlySorted!390 (toList!7678 (+!3390 lt!490534 lt!490533)) (_1!8689 lt!490528) (_2!8689 lt!490528)))))

(assert (=> d!130197 (= (+!3390 (+!3390 lt!490534 lt!490533) lt!490528) lt!490749)))

(declare-fun b!1097758 () Bool)

(declare-fun res!732656 () Bool)

(assert (=> b!1097758 (=> (not res!732656) (not e!626535))))

(assert (=> b!1097758 (= res!732656 (= (getValueByKey!621 (toList!7678 lt!490749) (_1!8689 lt!490528)) (Some!671 (_2!8689 lt!490528))))))

(declare-fun b!1097759 () Bool)

(assert (=> b!1097759 (= e!626535 (contains!6352 (toList!7678 lt!490749) lt!490528))))

(assert (= (and d!130197 res!732655) b!1097758))

(assert (= (and b!1097758 res!732656) b!1097759))

(declare-fun m!1016859 () Bool)

(assert (=> d!130197 m!1016859))

(declare-fun m!1016861 () Bool)

(assert (=> d!130197 m!1016861))

(declare-fun m!1016863 () Bool)

(assert (=> d!130197 m!1016863))

(declare-fun m!1016865 () Bool)

(assert (=> d!130197 m!1016865))

(declare-fun m!1016867 () Bool)

(assert (=> b!1097758 m!1016867))

(declare-fun m!1016869 () Bool)

(assert (=> b!1097759 m!1016869))

(assert (=> b!1097499 d!130197))

(declare-fun d!130199 () Bool)

(declare-fun e!626536 () Bool)

(assert (=> d!130199 e!626536))

(declare-fun res!732657 () Bool)

(assert (=> d!130199 (=> (not res!732657) (not e!626536))))

(declare-fun lt!490753 () ListLongMap!15325)

(assert (=> d!130199 (= res!732657 (contains!6351 lt!490753 (_1!8689 lt!490533)))))

(declare-fun lt!490752 () List!23951)

(assert (=> d!130199 (= lt!490753 (ListLongMap!15326 lt!490752))))

(declare-fun lt!490751 () Unit!35945)

(declare-fun lt!490750 () Unit!35945)

(assert (=> d!130199 (= lt!490751 lt!490750)))

(assert (=> d!130199 (= (getValueByKey!621 lt!490752 (_1!8689 lt!490533)) (Some!671 (_2!8689 lt!490533)))))

(assert (=> d!130199 (= lt!490750 (lemmaContainsTupThenGetReturnValue!297 lt!490752 (_1!8689 lt!490533) (_2!8689 lt!490533)))))

(assert (=> d!130199 (= lt!490752 (insertStrictlySorted!390 (toList!7678 lt!490534) (_1!8689 lt!490533) (_2!8689 lt!490533)))))

(assert (=> d!130199 (= (+!3390 lt!490534 lt!490533) lt!490753)))

(declare-fun b!1097760 () Bool)

(declare-fun res!732658 () Bool)

(assert (=> b!1097760 (=> (not res!732658) (not e!626536))))

(assert (=> b!1097760 (= res!732658 (= (getValueByKey!621 (toList!7678 lt!490753) (_1!8689 lt!490533)) (Some!671 (_2!8689 lt!490533))))))

(declare-fun b!1097761 () Bool)

(assert (=> b!1097761 (= e!626536 (contains!6352 (toList!7678 lt!490753) lt!490533))))

(assert (= (and d!130199 res!732657) b!1097760))

(assert (= (and b!1097760 res!732658) b!1097761))

(declare-fun m!1016871 () Bool)

(assert (=> d!130199 m!1016871))

(declare-fun m!1016873 () Bool)

(assert (=> d!130199 m!1016873))

(declare-fun m!1016875 () Bool)

(assert (=> d!130199 m!1016875))

(declare-fun m!1016877 () Bool)

(assert (=> d!130199 m!1016877))

(declare-fun m!1016879 () Bool)

(assert (=> b!1097760 m!1016879))

(declare-fun m!1016881 () Bool)

(assert (=> b!1097761 m!1016881))

(assert (=> b!1097499 d!130199))

(declare-fun d!130201 () Bool)

(assert (=> d!130201 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96512 d!130201))

(declare-fun d!130203 () Bool)

(assert (=> d!130203 (= (array_inv!26384 _keys!1070) (bvsge (size!34741 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96512 d!130203))

(declare-fun d!130205 () Bool)

(assert (=> d!130205 (= (array_inv!26385 _values!874) (bvsge (size!34740 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96512 d!130205))

(declare-fun bm!45828 () Bool)

(declare-fun call!45831 () Bool)

(assert (=> bm!45828 (= call!45831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490530 mask!1414))))

(declare-fun b!1097770 () Bool)

(declare-fun e!626544 () Bool)

(assert (=> b!1097770 (= e!626544 call!45831)))

(declare-fun b!1097771 () Bool)

(declare-fun e!626543 () Bool)

(assert (=> b!1097771 (= e!626543 e!626544)))

(declare-fun c!108419 () Bool)

(assert (=> b!1097771 (= c!108419 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun b!1097772 () Bool)

(declare-fun e!626545 () Bool)

(assert (=> b!1097772 (= e!626544 e!626545)))

(declare-fun lt!490761 () (_ BitVec 64))

(assert (=> b!1097772 (= lt!490761 (select (arr!34203 lt!490530) #b00000000000000000000000000000000))))

(declare-fun lt!490762 () Unit!35945)

(assert (=> b!1097772 (= lt!490762 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490530 lt!490761 #b00000000000000000000000000000000))))

(assert (=> b!1097772 (arrayContainsKey!0 lt!490530 lt!490761 #b00000000000000000000000000000000)))

(declare-fun lt!490760 () Unit!35945)

(assert (=> b!1097772 (= lt!490760 lt!490762)))

(declare-fun res!732664 () Bool)

(declare-datatypes ((SeekEntryResult!9906 0))(
  ( (MissingZero!9906 (index!41995 (_ BitVec 32))) (Found!9906 (index!41996 (_ BitVec 32))) (Intermediate!9906 (undefined!10718 Bool) (index!41997 (_ BitVec 32)) (x!98732 (_ BitVec 32))) (Undefined!9906) (MissingVacant!9906 (index!41998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71064 (_ BitVec 32)) SeekEntryResult!9906)

(assert (=> b!1097772 (= res!732664 (= (seekEntryOrOpen!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000) lt!490530 mask!1414) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1097772 (=> (not res!732664) (not e!626545))))

(declare-fun b!1097773 () Bool)

(assert (=> b!1097773 (= e!626545 call!45831)))

(declare-fun d!130207 () Bool)

(declare-fun res!732663 () Bool)

(assert (=> d!130207 (=> res!732663 e!626543)))

(assert (=> d!130207 (= res!732663 (bvsge #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(assert (=> d!130207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490530 mask!1414) e!626543)))

(assert (= (and d!130207 (not res!732663)) b!1097771))

(assert (= (and b!1097771 c!108419) b!1097772))

(assert (= (and b!1097771 (not c!108419)) b!1097770))

(assert (= (and b!1097772 res!732664) b!1097773))

(assert (= (or b!1097773 b!1097770) bm!45828))

(declare-fun m!1016883 () Bool)

(assert (=> bm!45828 m!1016883))

(assert (=> b!1097771 m!1016731))

(assert (=> b!1097771 m!1016731))

(assert (=> b!1097771 m!1016733))

(assert (=> b!1097772 m!1016731))

(declare-fun m!1016885 () Bool)

(assert (=> b!1097772 m!1016885))

(declare-fun m!1016887 () Bool)

(assert (=> b!1097772 m!1016887))

(assert (=> b!1097772 m!1016731))

(declare-fun m!1016889 () Bool)

(assert (=> b!1097772 m!1016889))

(assert (=> b!1097495 d!130207))

(declare-fun b!1097774 () Bool)

(declare-fun e!626549 () Bool)

(declare-fun call!45832 () Bool)

(assert (=> b!1097774 (= e!626549 call!45832)))

(declare-fun b!1097775 () Bool)

(declare-fun e!626548 () Bool)

(assert (=> b!1097775 (= e!626548 e!626549)))

(declare-fun c!108420 () Bool)

(assert (=> b!1097775 (= c!108420 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun bm!45829 () Bool)

(assert (=> bm!45829 (= call!45832 (arrayNoDuplicates!0 lt!490530 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108420 (Cons!23948 (select (arr!34203 lt!490530) #b00000000000000000000000000000000) Nil!23949) Nil!23949)))))

(declare-fun d!130209 () Bool)

(declare-fun res!732666 () Bool)

(declare-fun e!626547 () Bool)

(assert (=> d!130209 (=> res!732666 e!626547)))

(assert (=> d!130209 (= res!732666 (bvsge #b00000000000000000000000000000000 (size!34741 lt!490530)))))

(assert (=> d!130209 (= (arrayNoDuplicates!0 lt!490530 #b00000000000000000000000000000000 Nil!23949) e!626547)))

(declare-fun b!1097776 () Bool)

(assert (=> b!1097776 (= e!626547 e!626548)))

(declare-fun res!732665 () Bool)

(assert (=> b!1097776 (=> (not res!732665) (not e!626548))))

(declare-fun e!626546 () Bool)

(assert (=> b!1097776 (= res!732665 (not e!626546))))

(declare-fun res!732667 () Bool)

(assert (=> b!1097776 (=> (not res!732667) (not e!626546))))

(assert (=> b!1097776 (= res!732667 (validKeyInArray!0 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun b!1097777 () Bool)

(assert (=> b!1097777 (= e!626546 (contains!6350 Nil!23949 (select (arr!34203 lt!490530) #b00000000000000000000000000000000)))))

(declare-fun b!1097778 () Bool)

(assert (=> b!1097778 (= e!626549 call!45832)))

(assert (= (and d!130209 (not res!732666)) b!1097776))

(assert (= (and b!1097776 res!732667) b!1097777))

(assert (= (and b!1097776 res!732665) b!1097775))

(assert (= (and b!1097775 c!108420) b!1097778))

(assert (= (and b!1097775 (not c!108420)) b!1097774))

(assert (= (or b!1097778 b!1097774) bm!45829))

(assert (=> b!1097775 m!1016731))

(assert (=> b!1097775 m!1016731))

(assert (=> b!1097775 m!1016733))

(assert (=> bm!45829 m!1016731))

(declare-fun m!1016891 () Bool)

(assert (=> bm!45829 m!1016891))

(assert (=> b!1097776 m!1016731))

(assert (=> b!1097776 m!1016731))

(assert (=> b!1097776 m!1016733))

(assert (=> b!1097777 m!1016731))

(assert (=> b!1097777 m!1016731))

(declare-fun m!1016893 () Bool)

(assert (=> b!1097777 m!1016893))

(assert (=> b!1097500 d!130209))

(declare-fun bm!45830 () Bool)

(declare-fun call!45833 () Bool)

(assert (=> bm!45830 (= call!45833 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1097779 () Bool)

(declare-fun e!626551 () Bool)

(assert (=> b!1097779 (= e!626551 call!45833)))

(declare-fun b!1097780 () Bool)

(declare-fun e!626550 () Bool)

(assert (=> b!1097780 (= e!626550 e!626551)))

(declare-fun c!108421 () Bool)

(assert (=> b!1097780 (= c!108421 (validKeyInArray!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097781 () Bool)

(declare-fun e!626552 () Bool)

(assert (=> b!1097781 (= e!626551 e!626552)))

(declare-fun lt!490764 () (_ BitVec 64))

(assert (=> b!1097781 (= lt!490764 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490765 () Unit!35945)

(assert (=> b!1097781 (= lt!490765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490764 #b00000000000000000000000000000000))))

(assert (=> b!1097781 (arrayContainsKey!0 _keys!1070 lt!490764 #b00000000000000000000000000000000)))

(declare-fun lt!490763 () Unit!35945)

(assert (=> b!1097781 (= lt!490763 lt!490765)))

(declare-fun res!732669 () Bool)

(assert (=> b!1097781 (= res!732669 (= (seekEntryOrOpen!0 (select (arr!34203 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1097781 (=> (not res!732669) (not e!626552))))

(declare-fun b!1097782 () Bool)

(assert (=> b!1097782 (= e!626552 call!45833)))

(declare-fun d!130211 () Bool)

(declare-fun res!732668 () Bool)

(assert (=> d!130211 (=> res!732668 e!626550)))

(assert (=> d!130211 (= res!732668 (bvsge #b00000000000000000000000000000000 (size!34741 _keys!1070)))))

(assert (=> d!130211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626550)))

(assert (= (and d!130211 (not res!732668)) b!1097780))

(assert (= (and b!1097780 c!108421) b!1097781))

(assert (= (and b!1097780 (not c!108421)) b!1097779))

(assert (= (and b!1097781 res!732669) b!1097782))

(assert (= (or b!1097782 b!1097779) bm!45830))

(declare-fun m!1016895 () Bool)

(assert (=> bm!45830 m!1016895))

(assert (=> b!1097780 m!1016669))

(assert (=> b!1097780 m!1016669))

(assert (=> b!1097780 m!1016671))

(assert (=> b!1097781 m!1016669))

(declare-fun m!1016897 () Bool)

(assert (=> b!1097781 m!1016897))

(declare-fun m!1016899 () Bool)

(assert (=> b!1097781 m!1016899))

(assert (=> b!1097781 m!1016669))

(declare-fun m!1016901 () Bool)

(assert (=> b!1097781 m!1016901))

(assert (=> b!1097501 d!130211))

(declare-fun d!130213 () Bool)

(assert (=> d!130213 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097491 d!130213))

(declare-fun condMapEmpty!42454 () Bool)

(declare-fun mapDefault!42454 () ValueCell!12851)

(assert (=> mapNonEmpty!42445 (= condMapEmpty!42454 (= mapRest!42445 ((as const (Array (_ BitVec 32) ValueCell!12851)) mapDefault!42454)))))

(declare-fun e!626557 () Bool)

(declare-fun mapRes!42454 () Bool)

(assert (=> mapNonEmpty!42445 (= tp!81142 (and e!626557 mapRes!42454))))

(declare-fun mapIsEmpty!42454 () Bool)

(assert (=> mapIsEmpty!42454 mapRes!42454))

(declare-fun mapNonEmpty!42454 () Bool)

(declare-fun tp!81158 () Bool)

(declare-fun e!626558 () Bool)

(assert (=> mapNonEmpty!42454 (= mapRes!42454 (and tp!81158 e!626558))))

(declare-fun mapValue!42454 () ValueCell!12851)

(declare-fun mapKey!42454 () (_ BitVec 32))

(declare-fun mapRest!42454 () (Array (_ BitVec 32) ValueCell!12851))

(assert (=> mapNonEmpty!42454 (= mapRest!42445 (store mapRest!42454 mapKey!42454 mapValue!42454))))

(declare-fun b!1097789 () Bool)

(assert (=> b!1097789 (= e!626558 tp_is_empty!27121)))

(declare-fun b!1097790 () Bool)

(assert (=> b!1097790 (= e!626557 tp_is_empty!27121)))

(assert (= (and mapNonEmpty!42445 condMapEmpty!42454) mapIsEmpty!42454))

(assert (= (and mapNonEmpty!42445 (not condMapEmpty!42454)) mapNonEmpty!42454))

(assert (= (and mapNonEmpty!42454 ((_ is ValueCellFull!12851) mapValue!42454)) b!1097789))

(assert (= (and mapNonEmpty!42445 ((_ is ValueCellFull!12851) mapDefault!42454)) b!1097790))

(declare-fun m!1016903 () Bool)

(assert (=> mapNonEmpty!42454 m!1016903))

(declare-fun b_lambda!17759 () Bool)

(assert (= b_lambda!17755 (or (and start!96512 b_free!23071) b_lambda!17759)))

(declare-fun b_lambda!17761 () Bool)

(assert (= b_lambda!17747 (or (and start!96512 b_free!23071) b_lambda!17761)))

(declare-fun b_lambda!17763 () Bool)

(assert (= b_lambda!17753 (or (and start!96512 b_free!23071) b_lambda!17763)))

(declare-fun b_lambda!17765 () Bool)

(assert (= b_lambda!17745 (or (and start!96512 b_free!23071) b_lambda!17765)))

(declare-fun b_lambda!17767 () Bool)

(assert (= b_lambda!17751 (or (and start!96512 b_free!23071) b_lambda!17767)))

(declare-fun b_lambda!17769 () Bool)

(assert (= b_lambda!17757 (or (and start!96512 b_free!23071) b_lambda!17769)))

(declare-fun b_lambda!17771 () Bool)

(assert (= b_lambda!17749 (or (and start!96512 b_free!23071) b_lambda!17771)))

(check-sat (not b!1097704) (not b!1097655) (not b!1097723) (not b!1097781) (not b!1097600) (not b!1097726) (not b!1097661) (not b!1097739) (not d!130185) (not b!1097746) (not b!1097724) (not b!1097754) (not bm!45819) (not b!1097608) (not b!1097755) (not bm!45817) (not b_lambda!17759) (not b!1097702) (not bm!45804) (not b!1097727) (not b!1097772) (not b!1097706) (not bm!45821) (not b!1097721) (not b!1097722) b_and!36817 (not bm!45808) (not b!1097665) (not bm!45807) (not b_lambda!17763) (not b_next!23071) (not d!130179) (not b!1097725) (not bm!45811) (not bm!45824) (not b!1097657) (not b!1097670) (not bm!45828) (not bm!45818) (not b!1097658) (not b_lambda!17765) (not b!1097760) (not b!1097599) (not mapNonEmpty!42454) (not bm!45787) (not d!130189) (not b!1097748) (not b!1097703) (not b!1097698) (not bm!45816) (not b!1097700) (not d!130187) (not d!130197) (not d!130191) (not b_lambda!17769) (not d!130195) (not d!130183) (not b!1097701) (not b!1097601) (not bm!45802) (not b!1097715) (not d!130193) (not b!1097771) (not b!1097777) (not b!1097757) (not b!1097731) (not b_lambda!17767) (not b!1097756) (not b!1097736) (not b!1097759) (not b_lambda!17771) (not d!130199) (not b!1097780) (not b_lambda!17761) tp_is_empty!27121 (not b!1097735) (not d!130181) (not bm!45825) (not bm!45830) (not b!1097743) (not b!1097761) (not b_lambda!17743) (not b!1097668) (not b!1097776) (not b!1097775) (not b!1097653) (not b!1097705) (not bm!45829) (not b!1097733) (not b!1097758) (not b!1097719))
(check-sat b_and!36817 (not b_next!23071))
