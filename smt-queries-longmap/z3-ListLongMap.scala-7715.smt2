; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96916 () Bool)

(assert start!96916)

(declare-fun b_free!23215 () Bool)

(declare-fun b_next!23215 () Bool)

(assert (=> start!96916 (= b_free!23215 (not b_next!23215))))

(declare-fun tp!81604 () Bool)

(declare-fun b_and!37221 () Bool)

(assert (=> start!96916 (= tp!81604 b_and!37221)))

(declare-fun b!1102582 () Bool)

(declare-fun res!735709 () Bool)

(declare-fun e!629308 () Bool)

(assert (=> b!1102582 (=> (not res!735709) (not e!629308))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71360 0))(
  ( (array!71361 (arr!34341 (Array (_ BitVec 32) (_ BitVec 64))) (size!34879 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71360)

(declare-datatypes ((V!41481 0))(
  ( (V!41482 (val!13689 Int)) )
))
(declare-datatypes ((ValueCell!12923 0))(
  ( (ValueCellFull!12923 (v!16319 V!41481)) (EmptyCell!12923) )
))
(declare-datatypes ((array!71362 0))(
  ( (array!71363 (arr!34342 (Array (_ BitVec 32) ValueCell!12923)) (size!34880 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71362)

(assert (=> b!1102582 (= res!735709 (and (= (size!34880 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34879 _keys!1070) (size!34880 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102583 () Bool)

(declare-fun res!735712 () Bool)

(assert (=> b!1102583 (=> (not res!735712) (not e!629308))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102583 (= res!735712 (validKeyInArray!0 k0!904))))

(declare-fun b!1102584 () Bool)

(declare-fun e!629311 () Bool)

(declare-fun e!629310 () Bool)

(assert (=> b!1102584 (= e!629311 (not e!629310))))

(declare-fun res!735707 () Bool)

(assert (=> b!1102584 (=> res!735707 e!629310)))

(declare-datatypes ((tuple2!17472 0))(
  ( (tuple2!17473 (_1!8747 (_ BitVec 64)) (_2!8747 V!41481)) )
))
(declare-datatypes ((List!24063 0))(
  ( (Nil!24060) (Cons!24059 (h!25268 tuple2!17472) (t!34315 List!24063)) )
))
(declare-datatypes ((ListLongMap!15441 0))(
  ( (ListLongMap!15442 (toList!7736 List!24063)) )
))
(declare-fun lt!494643 () ListLongMap!15441)

(declare-fun lt!494638 () Bool)

(declare-fun lt!494636 () ListLongMap!15441)

(assert (=> b!1102584 (= res!735707 (or (and (not lt!494638) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494638) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494638) (not (= lt!494636 lt!494643))))))

(assert (=> b!1102584 (= lt!494638 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41481)

(declare-fun lt!494640 () ListLongMap!15441)

(declare-fun zeroValue!831 () V!41481)

(declare-fun getCurrentListMap!4348 (array!71360 array!71362 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15441)

(assert (=> b!1102584 (= lt!494640 (getCurrentListMap!4348 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494644 () array!71362)

(declare-fun lt!494637 () array!71360)

(assert (=> b!1102584 (= lt!494636 (getCurrentListMap!4348 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494635 () ListLongMap!15441)

(assert (=> b!1102584 (and (= lt!494643 lt!494635) (= lt!494635 lt!494643))))

(declare-fun lt!494641 () ListLongMap!15441)

(declare-fun -!963 (ListLongMap!15441 (_ BitVec 64)) ListLongMap!15441)

(assert (=> b!1102584 (= lt!494635 (-!963 lt!494641 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36055 0))(
  ( (Unit!36056) )
))
(declare-fun lt!494639 () Unit!36055)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 (array!71360 array!71362 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36055)

(assert (=> b!1102584 (= lt!494639 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4255 (array!71360 array!71362 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15441)

(assert (=> b!1102584 (= lt!494643 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2324 (Int (_ BitVec 64)) V!41481)

(assert (=> b!1102584 (= lt!494644 (array!71363 (store (arr!34342 _values!874) i!650 (ValueCellFull!12923 (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34880 _values!874)))))

(assert (=> b!1102584 (= lt!494641 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102584 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494642 () Unit!36055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71360 (_ BitVec 64) (_ BitVec 32)) Unit!36055)

(assert (=> b!1102584 (= lt!494642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102585 () Bool)

(declare-fun res!735711 () Bool)

(assert (=> b!1102585 (=> (not res!735711) (not e!629308))))

(assert (=> b!1102585 (= res!735711 (= (select (arr!34341 _keys!1070) i!650) k0!904))))

(declare-fun b!1102586 () Bool)

(assert (=> b!1102586 (= e!629310 (= (-!963 lt!494640 k0!904) lt!494636))))

(declare-fun b!1102587 () Bool)

(declare-fun res!735708 () Bool)

(assert (=> b!1102587 (=> (not res!735708) (not e!629311))))

(declare-datatypes ((List!24064 0))(
  ( (Nil!24061) (Cons!24060 (h!25269 (_ BitVec 64)) (t!34316 List!24064)) )
))
(declare-fun arrayNoDuplicates!0 (array!71360 (_ BitVec 32) List!24064) Bool)

(assert (=> b!1102587 (= res!735708 (arrayNoDuplicates!0 lt!494637 #b00000000000000000000000000000000 Nil!24061))))

(declare-fun b!1102589 () Bool)

(declare-fun res!735715 () Bool)

(assert (=> b!1102589 (=> (not res!735715) (not e!629308))))

(assert (=> b!1102589 (= res!735715 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24061))))

(declare-fun b!1102590 () Bool)

(declare-fun e!629307 () Bool)

(declare-fun tp_is_empty!27265 () Bool)

(assert (=> b!1102590 (= e!629307 tp_is_empty!27265)))

(declare-fun b!1102591 () Bool)

(declare-fun res!735713 () Bool)

(assert (=> b!1102591 (=> (not res!735713) (not e!629308))))

(assert (=> b!1102591 (= res!735713 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34879 _keys!1070))))))

(declare-fun mapNonEmpty!42691 () Bool)

(declare-fun mapRes!42691 () Bool)

(declare-fun tp!81605 () Bool)

(assert (=> mapNonEmpty!42691 (= mapRes!42691 (and tp!81605 e!629307))))

(declare-fun mapValue!42691 () ValueCell!12923)

(declare-fun mapRest!42691 () (Array (_ BitVec 32) ValueCell!12923))

(declare-fun mapKey!42691 () (_ BitVec 32))

(assert (=> mapNonEmpty!42691 (= (arr!34342 _values!874) (store mapRest!42691 mapKey!42691 mapValue!42691))))

(declare-fun b!1102592 () Bool)

(assert (=> b!1102592 (= e!629308 e!629311)))

(declare-fun res!735710 () Bool)

(assert (=> b!1102592 (=> (not res!735710) (not e!629311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71360 (_ BitVec 32)) Bool)

(assert (=> b!1102592 (= res!735710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494637 mask!1414))))

(assert (=> b!1102592 (= lt!494637 (array!71361 (store (arr!34341 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34879 _keys!1070)))))

(declare-fun b!1102593 () Bool)

(declare-fun e!629309 () Bool)

(declare-fun e!629306 () Bool)

(assert (=> b!1102593 (= e!629309 (and e!629306 mapRes!42691))))

(declare-fun condMapEmpty!42691 () Bool)

(declare-fun mapDefault!42691 () ValueCell!12923)

(assert (=> b!1102593 (= condMapEmpty!42691 (= (arr!34342 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12923)) mapDefault!42691)))))

(declare-fun b!1102594 () Bool)

(declare-fun res!735714 () Bool)

(assert (=> b!1102594 (=> (not res!735714) (not e!629308))))

(assert (=> b!1102594 (= res!735714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42691 () Bool)

(assert (=> mapIsEmpty!42691 mapRes!42691))

(declare-fun res!735706 () Bool)

(assert (=> start!96916 (=> (not res!735706) (not e!629308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96916 (= res!735706 (validMask!0 mask!1414))))

(assert (=> start!96916 e!629308))

(assert (=> start!96916 tp!81604))

(assert (=> start!96916 true))

(assert (=> start!96916 tp_is_empty!27265))

(declare-fun array_inv!26480 (array!71360) Bool)

(assert (=> start!96916 (array_inv!26480 _keys!1070)))

(declare-fun array_inv!26481 (array!71362) Bool)

(assert (=> start!96916 (and (array_inv!26481 _values!874) e!629309)))

(declare-fun b!1102588 () Bool)

(assert (=> b!1102588 (= e!629306 tp_is_empty!27265)))

(assert (= (and start!96916 res!735706) b!1102582))

(assert (= (and b!1102582 res!735709) b!1102594))

(assert (= (and b!1102594 res!735714) b!1102589))

(assert (= (and b!1102589 res!735715) b!1102591))

(assert (= (and b!1102591 res!735713) b!1102583))

(assert (= (and b!1102583 res!735712) b!1102585))

(assert (= (and b!1102585 res!735711) b!1102592))

(assert (= (and b!1102592 res!735710) b!1102587))

(assert (= (and b!1102587 res!735708) b!1102584))

(assert (= (and b!1102584 (not res!735707)) b!1102586))

(assert (= (and b!1102593 condMapEmpty!42691) mapIsEmpty!42691))

(assert (= (and b!1102593 (not condMapEmpty!42691)) mapNonEmpty!42691))

(get-info :version)

(assert (= (and mapNonEmpty!42691 ((_ is ValueCellFull!12923) mapValue!42691)) b!1102590))

(assert (= (and b!1102593 ((_ is ValueCellFull!12923) mapDefault!42691)) b!1102588))

(assert (= start!96916 b!1102593))

(declare-fun b_lambda!18181 () Bool)

(assert (=> (not b_lambda!18181) (not b!1102584)))

(declare-fun t!34314 () Bool)

(declare-fun tb!8073 () Bool)

(assert (=> (and start!96916 (= defaultEntry!882 defaultEntry!882) t!34314) tb!8073))

(declare-fun result!16699 () Bool)

(assert (=> tb!8073 (= result!16699 tp_is_empty!27265)))

(assert (=> b!1102584 t!34314))

(declare-fun b_and!37223 () Bool)

(assert (= b_and!37221 (and (=> t!34314 result!16699) b_and!37223)))

(declare-fun m!1022431 () Bool)

(assert (=> b!1102592 m!1022431))

(declare-fun m!1022433 () Bool)

(assert (=> b!1102592 m!1022433))

(declare-fun m!1022435 () Bool)

(assert (=> mapNonEmpty!42691 m!1022435))

(declare-fun m!1022437 () Bool)

(assert (=> b!1102594 m!1022437))

(declare-fun m!1022439 () Bool)

(assert (=> b!1102589 m!1022439))

(declare-fun m!1022441 () Bool)

(assert (=> b!1102585 m!1022441))

(declare-fun m!1022443 () Bool)

(assert (=> b!1102583 m!1022443))

(declare-fun m!1022445 () Bool)

(assert (=> b!1102586 m!1022445))

(declare-fun m!1022447 () Bool)

(assert (=> b!1102587 m!1022447))

(declare-fun m!1022449 () Bool)

(assert (=> b!1102584 m!1022449))

(declare-fun m!1022451 () Bool)

(assert (=> b!1102584 m!1022451))

(declare-fun m!1022453 () Bool)

(assert (=> b!1102584 m!1022453))

(declare-fun m!1022455 () Bool)

(assert (=> b!1102584 m!1022455))

(declare-fun m!1022457 () Bool)

(assert (=> b!1102584 m!1022457))

(declare-fun m!1022459 () Bool)

(assert (=> b!1102584 m!1022459))

(declare-fun m!1022461 () Bool)

(assert (=> b!1102584 m!1022461))

(declare-fun m!1022463 () Bool)

(assert (=> b!1102584 m!1022463))

(declare-fun m!1022465 () Bool)

(assert (=> b!1102584 m!1022465))

(declare-fun m!1022467 () Bool)

(assert (=> b!1102584 m!1022467))

(declare-fun m!1022469 () Bool)

(assert (=> start!96916 m!1022469))

(declare-fun m!1022471 () Bool)

(assert (=> start!96916 m!1022471))

(declare-fun m!1022473 () Bool)

(assert (=> start!96916 m!1022473))

(check-sat (not b!1102594) (not b_lambda!18181) (not b!1102583) (not b!1102592) (not b!1102587) (not mapNonEmpty!42691) (not b_next!23215) (not b!1102586) (not start!96916) (not b!1102584) (not b!1102589) b_and!37223 tp_is_empty!27265)
(check-sat b_and!37223 (not b_next!23215))
(get-model)

(declare-fun b_lambda!18187 () Bool)

(assert (= b_lambda!18181 (or (and start!96916 b_free!23215) b_lambda!18187)))

(check-sat (not b_lambda!18187) (not b!1102594) (not b!1102583) (not b!1102592) (not b!1102587) (not mapNonEmpty!42691) (not b_next!23215) (not b!1102586) (not start!96916) (not b!1102584) (not b!1102589) b_and!37223 tp_is_empty!27265)
(check-sat b_and!37223 (not b_next!23215))
(get-model)

(declare-fun b!1102687 () Bool)

(declare-fun e!629362 () Bool)

(declare-fun e!629360 () Bool)

(assert (=> b!1102687 (= e!629362 e!629360)))

(declare-fun lt!494712 () (_ BitVec 64))

(assert (=> b!1102687 (= lt!494712 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494713 () Unit!36055)

(assert (=> b!1102687 (= lt!494713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494712 #b00000000000000000000000000000000))))

(assert (=> b!1102687 (arrayContainsKey!0 _keys!1070 lt!494712 #b00000000000000000000000000000000)))

(declare-fun lt!494711 () Unit!36055)

(assert (=> b!1102687 (= lt!494711 lt!494713)))

(declare-fun res!735780 () Bool)

(declare-datatypes ((SeekEntryResult!9916 0))(
  ( (MissingZero!9916 (index!42035 (_ BitVec 32))) (Found!9916 (index!42036 (_ BitVec 32))) (Intermediate!9916 (undefined!10728 Bool) (index!42037 (_ BitVec 32)) (x!99188 (_ BitVec 32))) (Undefined!9916) (MissingVacant!9916 (index!42038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71360 (_ BitVec 32)) SeekEntryResult!9916)

(assert (=> b!1102687 (= res!735780 (= (seekEntryOrOpen!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9916 #b00000000000000000000000000000000)))))

(assert (=> b!1102687 (=> (not res!735780) (not e!629360))))

(declare-fun b!1102688 () Bool)

(declare-fun call!46250 () Bool)

(assert (=> b!1102688 (= e!629360 call!46250)))

(declare-fun b!1102689 () Bool)

(declare-fun e!629361 () Bool)

(assert (=> b!1102689 (= e!629361 e!629362)))

(declare-fun c!108883 () Bool)

(assert (=> b!1102689 (= c!108883 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102690 () Bool)

(assert (=> b!1102690 (= e!629362 call!46250)))

(declare-fun d!130605 () Bool)

(declare-fun res!735781 () Bool)

(assert (=> d!130605 (=> res!735781 e!629361)))

(assert (=> d!130605 (= res!735781 (bvsge #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> d!130605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629361)))

(declare-fun bm!46247 () Bool)

(assert (=> bm!46247 (= call!46250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130605 (not res!735781)) b!1102689))

(assert (= (and b!1102689 c!108883) b!1102687))

(assert (= (and b!1102689 (not c!108883)) b!1102690))

(assert (= (and b!1102687 res!735780) b!1102688))

(assert (= (or b!1102688 b!1102690) bm!46247))

(declare-fun m!1022563 () Bool)

(assert (=> b!1102687 m!1022563))

(declare-fun m!1022565 () Bool)

(assert (=> b!1102687 m!1022565))

(declare-fun m!1022567 () Bool)

(assert (=> b!1102687 m!1022567))

(assert (=> b!1102687 m!1022563))

(declare-fun m!1022569 () Bool)

(assert (=> b!1102687 m!1022569))

(assert (=> b!1102689 m!1022563))

(assert (=> b!1102689 m!1022563))

(declare-fun m!1022571 () Bool)

(assert (=> b!1102689 m!1022571))

(declare-fun m!1022573 () Bool)

(assert (=> bm!46247 m!1022573))

(assert (=> b!1102594 d!130605))

(declare-fun d!130607 () Bool)

(declare-fun res!735786 () Bool)

(declare-fun e!629367 () Bool)

(assert (=> d!130607 (=> res!735786 e!629367)))

(assert (=> d!130607 (= res!735786 (= (select (arr!34341 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130607 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629367)))

(declare-fun b!1102695 () Bool)

(declare-fun e!629368 () Bool)

(assert (=> b!1102695 (= e!629367 e!629368)))

(declare-fun res!735787 () Bool)

(assert (=> b!1102695 (=> (not res!735787) (not e!629368))))

(assert (=> b!1102695 (= res!735787 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34879 _keys!1070)))))

(declare-fun b!1102696 () Bool)

(assert (=> b!1102696 (= e!629368 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130607 (not res!735786)) b!1102695))

(assert (= (and b!1102695 res!735787) b!1102696))

(assert (=> d!130607 m!1022563))

(declare-fun m!1022575 () Bool)

(assert (=> b!1102696 m!1022575))

(assert (=> b!1102584 d!130607))

(declare-fun b!1102739 () Bool)

(declare-fun e!629401 () Bool)

(declare-fun lt!494777 () ListLongMap!15441)

(declare-fun apply!947 (ListLongMap!15441 (_ BitVec 64)) V!41481)

(assert (=> b!1102739 (= e!629401 (= (apply!947 lt!494777 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102740 () Bool)

(declare-fun e!629405 () ListLongMap!15441)

(declare-fun call!46265 () ListLongMap!15441)

(declare-fun +!3442 (ListLongMap!15441 tuple2!17472) ListLongMap!15441)

(assert (=> b!1102740 (= e!629405 (+!3442 call!46265 (tuple2!17473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102741 () Bool)

(declare-fun e!629395 () Bool)

(declare-fun e!629396 () Bool)

(assert (=> b!1102741 (= e!629395 e!629396)))

(declare-fun res!735811 () Bool)

(declare-fun call!46269 () Bool)

(assert (=> b!1102741 (= res!735811 call!46269)))

(assert (=> b!1102741 (=> (not res!735811) (not e!629396))))

(declare-fun b!1102742 () Bool)

(declare-fun res!735812 () Bool)

(declare-fun e!629400 () Bool)

(assert (=> b!1102742 (=> (not res!735812) (not e!629400))))

(declare-fun e!629403 () Bool)

(assert (=> b!1102742 (= res!735812 e!629403)))

(declare-fun res!735810 () Bool)

(assert (=> b!1102742 (=> res!735810 e!629403)))

(declare-fun e!629407 () Bool)

(assert (=> b!1102742 (= res!735810 (not e!629407))))

(declare-fun res!735806 () Bool)

(assert (=> b!1102742 (=> (not res!735806) (not e!629407))))

(assert (=> b!1102742 (= res!735806 (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun b!1102743 () Bool)

(assert (=> b!1102743 (= e!629396 (= (apply!947 lt!494777 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102744 () Bool)

(assert (=> b!1102744 (= e!629395 (not call!46269))))

(declare-fun bm!46263 () Bool)

(declare-fun call!46270 () ListLongMap!15441)

(declare-fun call!46271 () ListLongMap!15441)

(assert (=> bm!46263 (= call!46270 call!46271)))

(declare-fun b!1102745 () Bool)

(declare-fun e!629397 () Bool)

(assert (=> b!1102745 (= e!629400 e!629397)))

(declare-fun c!108901 () Bool)

(assert (=> b!1102745 (= c!108901 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46264 () Bool)

(declare-fun call!46268 () Bool)

(declare-fun contains!6379 (ListLongMap!15441 (_ BitVec 64)) Bool)

(assert (=> bm!46264 (= call!46268 (contains!6379 lt!494777 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102746 () Bool)

(declare-fun e!629402 () Bool)

(assert (=> b!1102746 (= e!629403 e!629402)))

(declare-fun res!735807 () Bool)

(assert (=> b!1102746 (=> (not res!735807) (not e!629402))))

(assert (=> b!1102746 (= res!735807 (contains!6379 lt!494777 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun bm!46265 () Bool)

(assert (=> bm!46265 (= call!46269 (contains!6379 lt!494777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102747 () Bool)

(declare-fun e!629398 () Bool)

(assert (=> b!1102747 (= e!629398 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46266 () Bool)

(declare-fun call!46266 () ListLongMap!15441)

(assert (=> bm!46266 (= call!46271 call!46266)))

(declare-fun b!1102748 () Bool)

(assert (=> b!1102748 (= e!629407 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102749 () Bool)

(declare-fun e!629406 () ListLongMap!15441)

(declare-fun call!46267 () ListLongMap!15441)

(assert (=> b!1102749 (= e!629406 call!46267)))

(declare-fun bm!46262 () Bool)

(assert (=> bm!46262 (= call!46266 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130609 () Bool)

(assert (=> d!130609 e!629400))

(declare-fun res!735808 () Bool)

(assert (=> d!130609 (=> (not res!735808) (not e!629400))))

(assert (=> d!130609 (= res!735808 (or (bvsge #b00000000000000000000000000000000 (size!34879 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))))

(declare-fun lt!494766 () ListLongMap!15441)

(assert (=> d!130609 (= lt!494777 lt!494766)))

(declare-fun lt!494761 () Unit!36055)

(declare-fun e!629404 () Unit!36055)

(assert (=> d!130609 (= lt!494761 e!629404)))

(declare-fun c!108899 () Bool)

(assert (=> d!130609 (= c!108899 e!629398)))

(declare-fun res!735809 () Bool)

(assert (=> d!130609 (=> (not res!735809) (not e!629398))))

(assert (=> d!130609 (= res!735809 (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> d!130609 (= lt!494766 e!629405)))

(declare-fun c!108898 () Bool)

(assert (=> d!130609 (= c!108898 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130609 (validMask!0 mask!1414)))

(assert (=> d!130609 (= (getCurrentListMap!4348 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494777)))

(declare-fun b!1102750 () Bool)

(declare-fun Unit!36059 () Unit!36055)

(assert (=> b!1102750 (= e!629404 Unit!36059)))

(declare-fun c!108900 () Bool)

(declare-fun bm!46267 () Bool)

(assert (=> bm!46267 (= call!46265 (+!3442 (ite c!108898 call!46266 (ite c!108900 call!46271 call!46270)) (ite (or c!108898 c!108900) (tuple2!17473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102751 () Bool)

(declare-fun e!629399 () ListLongMap!15441)

(assert (=> b!1102751 (= e!629399 call!46267)))

(declare-fun b!1102752 () Bool)

(assert (=> b!1102752 (= e!629399 call!46270)))

(declare-fun b!1102753 () Bool)

(declare-fun lt!494765 () Unit!36055)

(assert (=> b!1102753 (= e!629404 lt!494765)))

(declare-fun lt!494763 () ListLongMap!15441)

(assert (=> b!1102753 (= lt!494763 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494760 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494774 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494774 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494779 () Unit!36055)

(declare-fun addStillContains!660 (ListLongMap!15441 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36055)

(assert (=> b!1102753 (= lt!494779 (addStillContains!660 lt!494763 lt!494760 zeroValue!831 lt!494774))))

(assert (=> b!1102753 (contains!6379 (+!3442 lt!494763 (tuple2!17473 lt!494760 zeroValue!831)) lt!494774)))

(declare-fun lt!494773 () Unit!36055)

(assert (=> b!1102753 (= lt!494773 lt!494779)))

(declare-fun lt!494770 () ListLongMap!15441)

(assert (=> b!1102753 (= lt!494770 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494768 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494769 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494769 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494772 () Unit!36055)

(declare-fun addApplyDifferent!516 (ListLongMap!15441 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36055)

(assert (=> b!1102753 (= lt!494772 (addApplyDifferent!516 lt!494770 lt!494768 minValue!831 lt!494769))))

(assert (=> b!1102753 (= (apply!947 (+!3442 lt!494770 (tuple2!17473 lt!494768 minValue!831)) lt!494769) (apply!947 lt!494770 lt!494769))))

(declare-fun lt!494767 () Unit!36055)

(assert (=> b!1102753 (= lt!494767 lt!494772)))

(declare-fun lt!494775 () ListLongMap!15441)

(assert (=> b!1102753 (= lt!494775 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494778 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494764 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494764 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494758 () Unit!36055)

(assert (=> b!1102753 (= lt!494758 (addApplyDifferent!516 lt!494775 lt!494778 zeroValue!831 lt!494764))))

(assert (=> b!1102753 (= (apply!947 (+!3442 lt!494775 (tuple2!17473 lt!494778 zeroValue!831)) lt!494764) (apply!947 lt!494775 lt!494764))))

(declare-fun lt!494759 () Unit!36055)

(assert (=> b!1102753 (= lt!494759 lt!494758)))

(declare-fun lt!494776 () ListLongMap!15441)

(assert (=> b!1102753 (= lt!494776 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494771 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494762 () (_ BitVec 64))

(assert (=> b!1102753 (= lt!494762 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102753 (= lt!494765 (addApplyDifferent!516 lt!494776 lt!494771 minValue!831 lt!494762))))

(assert (=> b!1102753 (= (apply!947 (+!3442 lt!494776 (tuple2!17473 lt!494771 minValue!831)) lt!494762) (apply!947 lt!494776 lt!494762))))

(declare-fun b!1102754 () Bool)

(declare-fun res!735813 () Bool)

(assert (=> b!1102754 (=> (not res!735813) (not e!629400))))

(assert (=> b!1102754 (= res!735813 e!629395)))

(declare-fun c!108896 () Bool)

(assert (=> b!1102754 (= c!108896 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102755 () Bool)

(declare-fun c!108897 () Bool)

(assert (=> b!1102755 (= c!108897 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102755 (= e!629406 e!629399)))

(declare-fun b!1102756 () Bool)

(assert (=> b!1102756 (= e!629397 (not call!46268))))

(declare-fun b!1102757 () Bool)

(assert (=> b!1102757 (= e!629405 e!629406)))

(assert (=> b!1102757 (= c!108900 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102758 () Bool)

(assert (=> b!1102758 (= e!629397 e!629401)))

(declare-fun res!735814 () Bool)

(assert (=> b!1102758 (= res!735814 call!46268)))

(assert (=> b!1102758 (=> (not res!735814) (not e!629401))))

(declare-fun b!1102759 () Bool)

(declare-fun get!17667 (ValueCell!12923 V!41481) V!41481)

(assert (=> b!1102759 (= e!629402 (= (apply!947 lt!494777 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)) (get!17667 (select (arr!34342 _values!874) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34880 _values!874)))))

(assert (=> b!1102759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun bm!46268 () Bool)

(assert (=> bm!46268 (= call!46267 call!46265)))

(assert (= (and d!130609 c!108898) b!1102740))

(assert (= (and d!130609 (not c!108898)) b!1102757))

(assert (= (and b!1102757 c!108900) b!1102749))

(assert (= (and b!1102757 (not c!108900)) b!1102755))

(assert (= (and b!1102755 c!108897) b!1102751))

(assert (= (and b!1102755 (not c!108897)) b!1102752))

(assert (= (or b!1102751 b!1102752) bm!46263))

(assert (= (or b!1102749 bm!46263) bm!46266))

(assert (= (or b!1102749 b!1102751) bm!46268))

(assert (= (or b!1102740 bm!46266) bm!46262))

(assert (= (or b!1102740 bm!46268) bm!46267))

(assert (= (and d!130609 res!735809) b!1102747))

(assert (= (and d!130609 c!108899) b!1102753))

(assert (= (and d!130609 (not c!108899)) b!1102750))

(assert (= (and d!130609 res!735808) b!1102742))

(assert (= (and b!1102742 res!735806) b!1102748))

(assert (= (and b!1102742 (not res!735810)) b!1102746))

(assert (= (and b!1102746 res!735807) b!1102759))

(assert (= (and b!1102742 res!735812) b!1102754))

(assert (= (and b!1102754 c!108896) b!1102741))

(assert (= (and b!1102754 (not c!108896)) b!1102744))

(assert (= (and b!1102741 res!735811) b!1102743))

(assert (= (or b!1102741 b!1102744) bm!46265))

(assert (= (and b!1102754 res!735813) b!1102745))

(assert (= (and b!1102745 c!108901) b!1102758))

(assert (= (and b!1102745 (not c!108901)) b!1102756))

(assert (= (and b!1102758 res!735814) b!1102739))

(assert (= (or b!1102758 b!1102756) bm!46264))

(declare-fun b_lambda!18189 () Bool)

(assert (=> (not b_lambda!18189) (not b!1102759)))

(assert (=> b!1102759 t!34314))

(declare-fun b_and!37233 () Bool)

(assert (= b_and!37223 (and (=> t!34314 result!16699) b_and!37233)))

(assert (=> bm!46262 m!1022465))

(assert (=> b!1102759 m!1022563))

(declare-fun m!1022577 () Bool)

(assert (=> b!1102759 m!1022577))

(assert (=> b!1102759 m!1022563))

(declare-fun m!1022579 () Bool)

(assert (=> b!1102759 m!1022579))

(assert (=> b!1102759 m!1022577))

(assert (=> b!1102759 m!1022449))

(declare-fun m!1022581 () Bool)

(assert (=> b!1102759 m!1022581))

(assert (=> b!1102759 m!1022449))

(assert (=> b!1102748 m!1022563))

(assert (=> b!1102748 m!1022563))

(assert (=> b!1102748 m!1022571))

(declare-fun m!1022583 () Bool)

(assert (=> b!1102753 m!1022583))

(declare-fun m!1022585 () Bool)

(assert (=> b!1102753 m!1022585))

(declare-fun m!1022587 () Bool)

(assert (=> b!1102753 m!1022587))

(declare-fun m!1022589 () Bool)

(assert (=> b!1102753 m!1022589))

(assert (=> b!1102753 m!1022563))

(declare-fun m!1022591 () Bool)

(assert (=> b!1102753 m!1022591))

(declare-fun m!1022593 () Bool)

(assert (=> b!1102753 m!1022593))

(declare-fun m!1022595 () Bool)

(assert (=> b!1102753 m!1022595))

(declare-fun m!1022597 () Bool)

(assert (=> b!1102753 m!1022597))

(assert (=> b!1102753 m!1022465))

(declare-fun m!1022599 () Bool)

(assert (=> b!1102753 m!1022599))

(assert (=> b!1102753 m!1022599))

(declare-fun m!1022601 () Bool)

(assert (=> b!1102753 m!1022601))

(declare-fun m!1022603 () Bool)

(assert (=> b!1102753 m!1022603))

(declare-fun m!1022605 () Bool)

(assert (=> b!1102753 m!1022605))

(assert (=> b!1102753 m!1022587))

(declare-fun m!1022607 () Bool)

(assert (=> b!1102753 m!1022607))

(assert (=> b!1102753 m!1022583))

(declare-fun m!1022609 () Bool)

(assert (=> b!1102753 m!1022609))

(assert (=> b!1102753 m!1022593))

(declare-fun m!1022611 () Bool)

(assert (=> b!1102753 m!1022611))

(assert (=> b!1102747 m!1022563))

(assert (=> b!1102747 m!1022563))

(assert (=> b!1102747 m!1022571))

(declare-fun m!1022613 () Bool)

(assert (=> b!1102740 m!1022613))

(assert (=> b!1102746 m!1022563))

(assert (=> b!1102746 m!1022563))

(declare-fun m!1022615 () Bool)

(assert (=> b!1102746 m!1022615))

(declare-fun m!1022617 () Bool)

(assert (=> bm!46264 m!1022617))

(declare-fun m!1022619 () Bool)

(assert (=> b!1102743 m!1022619))

(assert (=> d!130609 m!1022469))

(declare-fun m!1022621 () Bool)

(assert (=> bm!46265 m!1022621))

(declare-fun m!1022623 () Bool)

(assert (=> bm!46267 m!1022623))

(declare-fun m!1022625 () Bool)

(assert (=> b!1102739 m!1022625))

(assert (=> b!1102584 d!130609))

(declare-fun d!130611 () Bool)

(declare-fun lt!494782 () ListLongMap!15441)

(assert (=> d!130611 (not (contains!6379 lt!494782 k0!904))))

(declare-fun removeStrictlySorted!88 (List!24063 (_ BitVec 64)) List!24063)

(assert (=> d!130611 (= lt!494782 (ListLongMap!15442 (removeStrictlySorted!88 (toList!7736 lt!494641) k0!904)))))

(assert (=> d!130611 (= (-!963 lt!494641 k0!904) lt!494782)))

(declare-fun bs!32324 () Bool)

(assert (= bs!32324 d!130611))

(declare-fun m!1022627 () Bool)

(assert (=> bs!32324 m!1022627))

(declare-fun m!1022629 () Bool)

(assert (=> bs!32324 m!1022629))

(assert (=> b!1102584 d!130611))

(declare-fun b!1102760 () Bool)

(declare-fun e!629414 () Bool)

(declare-fun lt!494802 () ListLongMap!15441)

(assert (=> b!1102760 (= e!629414 (= (apply!947 lt!494802 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102761 () Bool)

(declare-fun e!629418 () ListLongMap!15441)

(declare-fun call!46272 () ListLongMap!15441)

(assert (=> b!1102761 (= e!629418 (+!3442 call!46272 (tuple2!17473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102762 () Bool)

(declare-fun e!629408 () Bool)

(declare-fun e!629409 () Bool)

(assert (=> b!1102762 (= e!629408 e!629409)))

(declare-fun res!735820 () Bool)

(declare-fun call!46276 () Bool)

(assert (=> b!1102762 (= res!735820 call!46276)))

(assert (=> b!1102762 (=> (not res!735820) (not e!629409))))

(declare-fun b!1102763 () Bool)

(declare-fun res!735821 () Bool)

(declare-fun e!629413 () Bool)

(assert (=> b!1102763 (=> (not res!735821) (not e!629413))))

(declare-fun e!629416 () Bool)

(assert (=> b!1102763 (= res!735821 e!629416)))

(declare-fun res!735819 () Bool)

(assert (=> b!1102763 (=> res!735819 e!629416)))

(declare-fun e!629420 () Bool)

(assert (=> b!1102763 (= res!735819 (not e!629420))))

(declare-fun res!735815 () Bool)

(assert (=> b!1102763 (=> (not res!735815) (not e!629420))))

(assert (=> b!1102763 (= res!735815 (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun b!1102764 () Bool)

(assert (=> b!1102764 (= e!629409 (= (apply!947 lt!494802 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102765 () Bool)

(assert (=> b!1102765 (= e!629408 (not call!46276))))

(declare-fun bm!46270 () Bool)

(declare-fun call!46277 () ListLongMap!15441)

(declare-fun call!46278 () ListLongMap!15441)

(assert (=> bm!46270 (= call!46277 call!46278)))

(declare-fun b!1102766 () Bool)

(declare-fun e!629410 () Bool)

(assert (=> b!1102766 (= e!629413 e!629410)))

(declare-fun c!108907 () Bool)

(assert (=> b!1102766 (= c!108907 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46271 () Bool)

(declare-fun call!46275 () Bool)

(assert (=> bm!46271 (= call!46275 (contains!6379 lt!494802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102767 () Bool)

(declare-fun e!629415 () Bool)

(assert (=> b!1102767 (= e!629416 e!629415)))

(declare-fun res!735816 () Bool)

(assert (=> b!1102767 (=> (not res!735816) (not e!629415))))

(assert (=> b!1102767 (= res!735816 (contains!6379 lt!494802 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(assert (=> b!1102767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun bm!46272 () Bool)

(assert (=> bm!46272 (= call!46276 (contains!6379 lt!494802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102768 () Bool)

(declare-fun e!629411 () Bool)

(assert (=> b!1102768 (= e!629411 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun bm!46273 () Bool)

(declare-fun call!46273 () ListLongMap!15441)

(assert (=> bm!46273 (= call!46278 call!46273)))

(declare-fun b!1102769 () Bool)

(assert (=> b!1102769 (= e!629420 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun b!1102770 () Bool)

(declare-fun e!629419 () ListLongMap!15441)

(declare-fun call!46274 () ListLongMap!15441)

(assert (=> b!1102770 (= e!629419 call!46274)))

(declare-fun bm!46269 () Bool)

(assert (=> bm!46269 (= call!46273 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130613 () Bool)

(assert (=> d!130613 e!629413))

(declare-fun res!735817 () Bool)

(assert (=> d!130613 (=> (not res!735817) (not e!629413))))

(assert (=> d!130613 (= res!735817 (or (bvsge #b00000000000000000000000000000000 (size!34879 lt!494637)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))))

(declare-fun lt!494791 () ListLongMap!15441)

(assert (=> d!130613 (= lt!494802 lt!494791)))

(declare-fun lt!494786 () Unit!36055)

(declare-fun e!629417 () Unit!36055)

(assert (=> d!130613 (= lt!494786 e!629417)))

(declare-fun c!108905 () Bool)

(assert (=> d!130613 (= c!108905 e!629411)))

(declare-fun res!735818 () Bool)

(assert (=> d!130613 (=> (not res!735818) (not e!629411))))

(assert (=> d!130613 (= res!735818 (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(assert (=> d!130613 (= lt!494791 e!629418)))

(declare-fun c!108904 () Bool)

(assert (=> d!130613 (= c!108904 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130613 (validMask!0 mask!1414)))

(assert (=> d!130613 (= (getCurrentListMap!4348 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494802)))

(declare-fun b!1102771 () Bool)

(declare-fun Unit!36060 () Unit!36055)

(assert (=> b!1102771 (= e!629417 Unit!36060)))

(declare-fun bm!46274 () Bool)

(declare-fun c!108906 () Bool)

(assert (=> bm!46274 (= call!46272 (+!3442 (ite c!108904 call!46273 (ite c!108906 call!46278 call!46277)) (ite (or c!108904 c!108906) (tuple2!17473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102772 () Bool)

(declare-fun e!629412 () ListLongMap!15441)

(assert (=> b!1102772 (= e!629412 call!46274)))

(declare-fun b!1102773 () Bool)

(assert (=> b!1102773 (= e!629412 call!46277)))

(declare-fun b!1102774 () Bool)

(declare-fun lt!494790 () Unit!36055)

(assert (=> b!1102774 (= e!629417 lt!494790)))

(declare-fun lt!494788 () ListLongMap!15441)

(assert (=> b!1102774 (= lt!494788 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494785 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494799 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494799 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(declare-fun lt!494804 () Unit!36055)

(assert (=> b!1102774 (= lt!494804 (addStillContains!660 lt!494788 lt!494785 zeroValue!831 lt!494799))))

(assert (=> b!1102774 (contains!6379 (+!3442 lt!494788 (tuple2!17473 lt!494785 zeroValue!831)) lt!494799)))

(declare-fun lt!494798 () Unit!36055)

(assert (=> b!1102774 (= lt!494798 lt!494804)))

(declare-fun lt!494795 () ListLongMap!15441)

(assert (=> b!1102774 (= lt!494795 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494793 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494794 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494794 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(declare-fun lt!494797 () Unit!36055)

(assert (=> b!1102774 (= lt!494797 (addApplyDifferent!516 lt!494795 lt!494793 minValue!831 lt!494794))))

(assert (=> b!1102774 (= (apply!947 (+!3442 lt!494795 (tuple2!17473 lt!494793 minValue!831)) lt!494794) (apply!947 lt!494795 lt!494794))))

(declare-fun lt!494792 () Unit!36055)

(assert (=> b!1102774 (= lt!494792 lt!494797)))

(declare-fun lt!494800 () ListLongMap!15441)

(assert (=> b!1102774 (= lt!494800 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494803 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494789 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494789 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(declare-fun lt!494783 () Unit!36055)

(assert (=> b!1102774 (= lt!494783 (addApplyDifferent!516 lt!494800 lt!494803 zeroValue!831 lt!494789))))

(assert (=> b!1102774 (= (apply!947 (+!3442 lt!494800 (tuple2!17473 lt!494803 zeroValue!831)) lt!494789) (apply!947 lt!494800 lt!494789))))

(declare-fun lt!494784 () Unit!36055)

(assert (=> b!1102774 (= lt!494784 lt!494783)))

(declare-fun lt!494801 () ListLongMap!15441)

(assert (=> b!1102774 (= lt!494801 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494796 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494796 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494787 () (_ BitVec 64))

(assert (=> b!1102774 (= lt!494787 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(assert (=> b!1102774 (= lt!494790 (addApplyDifferent!516 lt!494801 lt!494796 minValue!831 lt!494787))))

(assert (=> b!1102774 (= (apply!947 (+!3442 lt!494801 (tuple2!17473 lt!494796 minValue!831)) lt!494787) (apply!947 lt!494801 lt!494787))))

(declare-fun b!1102775 () Bool)

(declare-fun res!735822 () Bool)

(assert (=> b!1102775 (=> (not res!735822) (not e!629413))))

(assert (=> b!1102775 (= res!735822 e!629408)))

(declare-fun c!108902 () Bool)

(assert (=> b!1102775 (= c!108902 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102776 () Bool)

(declare-fun c!108903 () Bool)

(assert (=> b!1102776 (= c!108903 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102776 (= e!629419 e!629412)))

(declare-fun b!1102777 () Bool)

(assert (=> b!1102777 (= e!629410 (not call!46275))))

(declare-fun b!1102778 () Bool)

(assert (=> b!1102778 (= e!629418 e!629419)))

(assert (=> b!1102778 (= c!108906 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102779 () Bool)

(assert (=> b!1102779 (= e!629410 e!629414)))

(declare-fun res!735823 () Bool)

(assert (=> b!1102779 (= res!735823 call!46275)))

(assert (=> b!1102779 (=> (not res!735823) (not e!629414))))

(declare-fun b!1102780 () Bool)

(assert (=> b!1102780 (= e!629415 (= (apply!947 lt!494802 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)) (get!17667 (select (arr!34342 lt!494644) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34880 lt!494644)))))

(assert (=> b!1102780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun bm!46275 () Bool)

(assert (=> bm!46275 (= call!46274 call!46272)))

(assert (= (and d!130613 c!108904) b!1102761))

(assert (= (and d!130613 (not c!108904)) b!1102778))

(assert (= (and b!1102778 c!108906) b!1102770))

(assert (= (and b!1102778 (not c!108906)) b!1102776))

(assert (= (and b!1102776 c!108903) b!1102772))

(assert (= (and b!1102776 (not c!108903)) b!1102773))

(assert (= (or b!1102772 b!1102773) bm!46270))

(assert (= (or b!1102770 bm!46270) bm!46273))

(assert (= (or b!1102770 b!1102772) bm!46275))

(assert (= (or b!1102761 bm!46273) bm!46269))

(assert (= (or b!1102761 bm!46275) bm!46274))

(assert (= (and d!130613 res!735818) b!1102768))

(assert (= (and d!130613 c!108905) b!1102774))

(assert (= (and d!130613 (not c!108905)) b!1102771))

(assert (= (and d!130613 res!735817) b!1102763))

(assert (= (and b!1102763 res!735815) b!1102769))

(assert (= (and b!1102763 (not res!735819)) b!1102767))

(assert (= (and b!1102767 res!735816) b!1102780))

(assert (= (and b!1102763 res!735821) b!1102775))

(assert (= (and b!1102775 c!108902) b!1102762))

(assert (= (and b!1102775 (not c!108902)) b!1102765))

(assert (= (and b!1102762 res!735820) b!1102764))

(assert (= (or b!1102762 b!1102765) bm!46272))

(assert (= (and b!1102775 res!735822) b!1102766))

(assert (= (and b!1102766 c!108907) b!1102779))

(assert (= (and b!1102766 (not c!108907)) b!1102777))

(assert (= (and b!1102779 res!735823) b!1102760))

(assert (= (or b!1102779 b!1102777) bm!46271))

(declare-fun b_lambda!18191 () Bool)

(assert (=> (not b_lambda!18191) (not b!1102780)))

(assert (=> b!1102780 t!34314))

(declare-fun b_and!37235 () Bool)

(assert (= b_and!37233 (and (=> t!34314 result!16699) b_and!37235)))

(assert (=> bm!46269 m!1022459))

(declare-fun m!1022631 () Bool)

(assert (=> b!1102780 m!1022631))

(declare-fun m!1022633 () Bool)

(assert (=> b!1102780 m!1022633))

(assert (=> b!1102780 m!1022631))

(declare-fun m!1022635 () Bool)

(assert (=> b!1102780 m!1022635))

(assert (=> b!1102780 m!1022633))

(assert (=> b!1102780 m!1022449))

(declare-fun m!1022637 () Bool)

(assert (=> b!1102780 m!1022637))

(assert (=> b!1102780 m!1022449))

(assert (=> b!1102769 m!1022631))

(assert (=> b!1102769 m!1022631))

(declare-fun m!1022639 () Bool)

(assert (=> b!1102769 m!1022639))

(declare-fun m!1022641 () Bool)

(assert (=> b!1102774 m!1022641))

(declare-fun m!1022643 () Bool)

(assert (=> b!1102774 m!1022643))

(declare-fun m!1022645 () Bool)

(assert (=> b!1102774 m!1022645))

(declare-fun m!1022647 () Bool)

(assert (=> b!1102774 m!1022647))

(assert (=> b!1102774 m!1022631))

(declare-fun m!1022649 () Bool)

(assert (=> b!1102774 m!1022649))

(declare-fun m!1022651 () Bool)

(assert (=> b!1102774 m!1022651))

(declare-fun m!1022653 () Bool)

(assert (=> b!1102774 m!1022653))

(declare-fun m!1022655 () Bool)

(assert (=> b!1102774 m!1022655))

(assert (=> b!1102774 m!1022459))

(declare-fun m!1022657 () Bool)

(assert (=> b!1102774 m!1022657))

(assert (=> b!1102774 m!1022657))

(declare-fun m!1022659 () Bool)

(assert (=> b!1102774 m!1022659))

(declare-fun m!1022661 () Bool)

(assert (=> b!1102774 m!1022661))

(declare-fun m!1022663 () Bool)

(assert (=> b!1102774 m!1022663))

(assert (=> b!1102774 m!1022645))

(declare-fun m!1022665 () Bool)

(assert (=> b!1102774 m!1022665))

(assert (=> b!1102774 m!1022641))

(declare-fun m!1022667 () Bool)

(assert (=> b!1102774 m!1022667))

(assert (=> b!1102774 m!1022651))

(declare-fun m!1022669 () Bool)

(assert (=> b!1102774 m!1022669))

(assert (=> b!1102768 m!1022631))

(assert (=> b!1102768 m!1022631))

(assert (=> b!1102768 m!1022639))

(declare-fun m!1022671 () Bool)

(assert (=> b!1102761 m!1022671))

(assert (=> b!1102767 m!1022631))

(assert (=> b!1102767 m!1022631))

(declare-fun m!1022673 () Bool)

(assert (=> b!1102767 m!1022673))

(declare-fun m!1022675 () Bool)

(assert (=> bm!46271 m!1022675))

(declare-fun m!1022677 () Bool)

(assert (=> b!1102764 m!1022677))

(assert (=> d!130613 m!1022469))

(declare-fun m!1022679 () Bool)

(assert (=> bm!46272 m!1022679))

(declare-fun m!1022681 () Bool)

(assert (=> bm!46274 m!1022681))

(declare-fun m!1022683 () Bool)

(assert (=> b!1102760 m!1022683))

(assert (=> b!1102584 d!130613))

(declare-fun d!130615 () Bool)

(declare-fun e!629426 () Bool)

(assert (=> d!130615 e!629426))

(declare-fun res!735826 () Bool)

(assert (=> d!130615 (=> (not res!735826) (not e!629426))))

(assert (=> d!130615 (= res!735826 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34879 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34879 _keys!1070))))))))

(declare-fun lt!494807 () Unit!36055)

(declare-fun choose!1781 (array!71360 array!71362 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36055)

(assert (=> d!130615 (= lt!494807 (choose!1781 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> d!130615 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494807)))

(declare-fun e!629425 () Bool)

(declare-fun call!46284 () ListLongMap!15441)

(declare-fun call!46283 () ListLongMap!15441)

(declare-fun b!1102787 () Bool)

(assert (=> b!1102787 (= e!629425 (= call!46284 (-!963 call!46283 k0!904)))))

(assert (=> b!1102787 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34880 _values!874)))))

(declare-fun bm!46280 () Bool)

(assert (=> bm!46280 (= call!46284 (getCurrentListMapNoExtraKeys!4255 (array!71361 (store (arr!34341 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34879 _keys!1070)) (array!71363 (store (arr!34342 _values!874) i!650 (ValueCellFull!12923 (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34880 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46281 () Bool)

(assert (=> bm!46281 (= call!46283 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102788 () Bool)

(assert (=> b!1102788 (= e!629426 e!629425)))

(declare-fun c!108910 () Bool)

(assert (=> b!1102788 (= c!108910 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1102789 () Bool)

(assert (=> b!1102789 (= e!629425 (= call!46284 call!46283))))

(assert (=> b!1102789 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34880 _values!874)))))

(assert (= (and d!130615 res!735826) b!1102788))

(assert (= (and b!1102788 c!108910) b!1102787))

(assert (= (and b!1102788 (not c!108910)) b!1102789))

(assert (= (or b!1102787 b!1102789) bm!46281))

(assert (= (or b!1102787 b!1102789) bm!46280))

(declare-fun b_lambda!18193 () Bool)

(assert (=> (not b_lambda!18193) (not bm!46280)))

(assert (=> bm!46280 t!34314))

(declare-fun b_and!37237 () Bool)

(assert (= b_and!37235 (and (=> t!34314 result!16699) b_and!37237)))

(declare-fun m!1022685 () Bool)

(assert (=> d!130615 m!1022685))

(declare-fun m!1022687 () Bool)

(assert (=> b!1102787 m!1022687))

(assert (=> bm!46280 m!1022433))

(assert (=> bm!46280 m!1022449))

(assert (=> bm!46280 m!1022451))

(declare-fun m!1022689 () Bool)

(assert (=> bm!46280 m!1022689))

(assert (=> bm!46281 m!1022465))

(assert (=> b!1102584 d!130615))

(declare-fun call!46287 () ListLongMap!15441)

(declare-fun bm!46284 () Bool)

(assert (=> bm!46284 (= call!46287 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102814 () Bool)

(declare-fun res!735838 () Bool)

(declare-fun e!629444 () Bool)

(assert (=> b!1102814 (=> (not res!735838) (not e!629444))))

(declare-fun lt!494825 () ListLongMap!15441)

(assert (=> b!1102814 (= res!735838 (not (contains!6379 lt!494825 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102815 () Bool)

(declare-fun e!629441 () ListLongMap!15441)

(declare-fun e!629446 () ListLongMap!15441)

(assert (=> b!1102815 (= e!629441 e!629446)))

(declare-fun c!108922 () Bool)

(assert (=> b!1102815 (= c!108922 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun b!1102816 () Bool)

(declare-fun e!629447 () Bool)

(assert (=> b!1102816 (= e!629444 e!629447)))

(declare-fun c!108919 () Bool)

(declare-fun e!629443 () Bool)

(assert (=> b!1102816 (= c!108919 e!629443)))

(declare-fun res!735837 () Bool)

(assert (=> b!1102816 (=> (not res!735837) (not e!629443))))

(assert (=> b!1102816 (= res!735837 (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun b!1102817 () Bool)

(assert (=> b!1102817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(assert (=> b!1102817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34880 lt!494644)))))

(declare-fun e!629442 () Bool)

(assert (=> b!1102817 (= e!629442 (= (apply!947 lt!494825 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)) (get!17667 (select (arr!34342 lt!494644) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102819 () Bool)

(assert (=> b!1102819 (= e!629447 e!629442)))

(assert (=> b!1102819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun res!735835 () Bool)

(assert (=> b!1102819 (= res!735835 (contains!6379 lt!494825 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(assert (=> b!1102819 (=> (not res!735835) (not e!629442))))

(declare-fun b!1102820 () Bool)

(assert (=> b!1102820 (= e!629446 call!46287)))

(declare-fun b!1102821 () Bool)

(assert (=> b!1102821 (= e!629443 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(assert (=> b!1102821 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130617 () Bool)

(assert (=> d!130617 e!629444))

(declare-fun res!735836 () Bool)

(assert (=> d!130617 (=> (not res!735836) (not e!629444))))

(assert (=> d!130617 (= res!735836 (not (contains!6379 lt!494825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130617 (= lt!494825 e!629441)))

(declare-fun c!108920 () Bool)

(assert (=> d!130617 (= c!108920 (bvsge #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(assert (=> d!130617 (validMask!0 mask!1414)))

(assert (=> d!130617 (= (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494825)))

(declare-fun b!1102818 () Bool)

(declare-fun e!629445 () Bool)

(assert (=> b!1102818 (= e!629447 e!629445)))

(declare-fun c!108921 () Bool)

(assert (=> b!1102818 (= c!108921 (bvslt #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(declare-fun b!1102822 () Bool)

(assert (=> b!1102822 (= e!629445 (= lt!494825 (getCurrentListMapNoExtraKeys!4255 lt!494637 lt!494644 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102823 () Bool)

(assert (=> b!1102823 (= e!629441 (ListLongMap!15442 Nil!24060))))

(declare-fun b!1102824 () Bool)

(declare-fun lt!494822 () Unit!36055)

(declare-fun lt!494828 () Unit!36055)

(assert (=> b!1102824 (= lt!494822 lt!494828)))

(declare-fun lt!494823 () ListLongMap!15441)

(declare-fun lt!494826 () (_ BitVec 64))

(declare-fun lt!494827 () (_ BitVec 64))

(declare-fun lt!494824 () V!41481)

(assert (=> b!1102824 (not (contains!6379 (+!3442 lt!494823 (tuple2!17473 lt!494826 lt!494824)) lt!494827))))

(declare-fun addStillNotContains!283 (ListLongMap!15441 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36055)

(assert (=> b!1102824 (= lt!494828 (addStillNotContains!283 lt!494823 lt!494826 lt!494824 lt!494827))))

(assert (=> b!1102824 (= lt!494827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102824 (= lt!494824 (get!17667 (select (arr!34342 lt!494644) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102824 (= lt!494826 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(assert (=> b!1102824 (= lt!494823 call!46287)))

(assert (=> b!1102824 (= e!629446 (+!3442 call!46287 (tuple2!17473 (select (arr!34341 lt!494637) #b00000000000000000000000000000000) (get!17667 (select (arr!34342 lt!494644) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102825 () Bool)

(declare-fun isEmpty!977 (ListLongMap!15441) Bool)

(assert (=> b!1102825 (= e!629445 (isEmpty!977 lt!494825))))

(assert (= (and d!130617 c!108920) b!1102823))

(assert (= (and d!130617 (not c!108920)) b!1102815))

(assert (= (and b!1102815 c!108922) b!1102824))

(assert (= (and b!1102815 (not c!108922)) b!1102820))

(assert (= (or b!1102824 b!1102820) bm!46284))

(assert (= (and d!130617 res!735836) b!1102814))

(assert (= (and b!1102814 res!735838) b!1102816))

(assert (= (and b!1102816 res!735837) b!1102821))

(assert (= (and b!1102816 c!108919) b!1102819))

(assert (= (and b!1102816 (not c!108919)) b!1102818))

(assert (= (and b!1102819 res!735835) b!1102817))

(assert (= (and b!1102818 c!108921) b!1102822))

(assert (= (and b!1102818 (not c!108921)) b!1102825))

(declare-fun b_lambda!18195 () Bool)

(assert (=> (not b_lambda!18195) (not b!1102817)))

(assert (=> b!1102817 t!34314))

(declare-fun b_and!37239 () Bool)

(assert (= b_and!37237 (and (=> t!34314 result!16699) b_and!37239)))

(declare-fun b_lambda!18197 () Bool)

(assert (=> (not b_lambda!18197) (not b!1102824)))

(assert (=> b!1102824 t!34314))

(declare-fun b_and!37241 () Bool)

(assert (= b_and!37239 (and (=> t!34314 result!16699) b_and!37241)))

(declare-fun m!1022691 () Bool)

(assert (=> d!130617 m!1022691))

(assert (=> d!130617 m!1022469))

(declare-fun m!1022693 () Bool)

(assert (=> b!1102825 m!1022693))

(assert (=> b!1102821 m!1022631))

(assert (=> b!1102821 m!1022631))

(assert (=> b!1102821 m!1022639))

(assert (=> b!1102819 m!1022631))

(assert (=> b!1102819 m!1022631))

(declare-fun m!1022695 () Bool)

(assert (=> b!1102819 m!1022695))

(assert (=> b!1102815 m!1022631))

(assert (=> b!1102815 m!1022631))

(assert (=> b!1102815 m!1022639))

(declare-fun m!1022697 () Bool)

(assert (=> b!1102814 m!1022697))

(declare-fun m!1022699 () Bool)

(assert (=> b!1102822 m!1022699))

(assert (=> b!1102817 m!1022449))

(assert (=> b!1102817 m!1022631))

(declare-fun m!1022701 () Bool)

(assert (=> b!1102817 m!1022701))

(assert (=> b!1102817 m!1022631))

(assert (=> b!1102817 m!1022633))

(assert (=> b!1102817 m!1022449))

(assert (=> b!1102817 m!1022637))

(assert (=> b!1102817 m!1022633))

(assert (=> b!1102824 m!1022449))

(declare-fun m!1022703 () Bool)

(assert (=> b!1102824 m!1022703))

(assert (=> b!1102824 m!1022631))

(declare-fun m!1022705 () Bool)

(assert (=> b!1102824 m!1022705))

(declare-fun m!1022707 () Bool)

(assert (=> b!1102824 m!1022707))

(declare-fun m!1022709 () Bool)

(assert (=> b!1102824 m!1022709))

(assert (=> b!1102824 m!1022705))

(assert (=> b!1102824 m!1022633))

(assert (=> b!1102824 m!1022449))

(assert (=> b!1102824 m!1022637))

(assert (=> b!1102824 m!1022633))

(assert (=> bm!46284 m!1022699))

(assert (=> b!1102584 d!130617))

(declare-fun call!46288 () ListLongMap!15441)

(declare-fun bm!46285 () Bool)

(assert (=> bm!46285 (= call!46288 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102826 () Bool)

(declare-fun res!735842 () Bool)

(declare-fun e!629451 () Bool)

(assert (=> b!1102826 (=> (not res!735842) (not e!629451))))

(declare-fun lt!494832 () ListLongMap!15441)

(assert (=> b!1102826 (= res!735842 (not (contains!6379 lt!494832 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102827 () Bool)

(declare-fun e!629448 () ListLongMap!15441)

(declare-fun e!629453 () ListLongMap!15441)

(assert (=> b!1102827 (= e!629448 e!629453)))

(declare-fun c!108926 () Bool)

(assert (=> b!1102827 (= c!108926 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102828 () Bool)

(declare-fun e!629454 () Bool)

(assert (=> b!1102828 (= e!629451 e!629454)))

(declare-fun c!108923 () Bool)

(declare-fun e!629450 () Bool)

(assert (=> b!1102828 (= c!108923 e!629450)))

(declare-fun res!735841 () Bool)

(assert (=> b!1102828 (=> (not res!735841) (not e!629450))))

(assert (=> b!1102828 (= res!735841 (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun b!1102829 () Bool)

(assert (=> b!1102829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> b!1102829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34880 _values!874)))))

(declare-fun e!629449 () Bool)

(assert (=> b!1102829 (= e!629449 (= (apply!947 lt!494832 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)) (get!17667 (select (arr!34342 _values!874) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102831 () Bool)

(assert (=> b!1102831 (= e!629454 e!629449)))

(assert (=> b!1102831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun res!735839 () Bool)

(assert (=> b!1102831 (= res!735839 (contains!6379 lt!494832 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102831 (=> (not res!735839) (not e!629449))))

(declare-fun b!1102832 () Bool)

(assert (=> b!1102832 (= e!629453 call!46288)))

(declare-fun b!1102833 () Bool)

(assert (=> b!1102833 (= e!629450 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102833 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!130619 () Bool)

(assert (=> d!130619 e!629451))

(declare-fun res!735840 () Bool)

(assert (=> d!130619 (=> (not res!735840) (not e!629451))))

(assert (=> d!130619 (= res!735840 (not (contains!6379 lt!494832 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130619 (= lt!494832 e!629448)))

(declare-fun c!108924 () Bool)

(assert (=> d!130619 (= c!108924 (bvsge #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> d!130619 (validMask!0 mask!1414)))

(assert (=> d!130619 (= (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494832)))

(declare-fun b!1102830 () Bool)

(declare-fun e!629452 () Bool)

(assert (=> b!1102830 (= e!629454 e!629452)))

(declare-fun c!108925 () Bool)

(assert (=> b!1102830 (= c!108925 (bvslt #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(declare-fun b!1102834 () Bool)

(assert (=> b!1102834 (= e!629452 (= lt!494832 (getCurrentListMapNoExtraKeys!4255 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102835 () Bool)

(assert (=> b!1102835 (= e!629448 (ListLongMap!15442 Nil!24060))))

(declare-fun b!1102836 () Bool)

(declare-fun lt!494829 () Unit!36055)

(declare-fun lt!494835 () Unit!36055)

(assert (=> b!1102836 (= lt!494829 lt!494835)))

(declare-fun lt!494831 () V!41481)

(declare-fun lt!494834 () (_ BitVec 64))

(declare-fun lt!494833 () (_ BitVec 64))

(declare-fun lt!494830 () ListLongMap!15441)

(assert (=> b!1102836 (not (contains!6379 (+!3442 lt!494830 (tuple2!17473 lt!494833 lt!494831)) lt!494834))))

(assert (=> b!1102836 (= lt!494835 (addStillNotContains!283 lt!494830 lt!494833 lt!494831 lt!494834))))

(assert (=> b!1102836 (= lt!494834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102836 (= lt!494831 (get!17667 (select (arr!34342 _values!874) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102836 (= lt!494833 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102836 (= lt!494830 call!46288)))

(assert (=> b!1102836 (= e!629453 (+!3442 call!46288 (tuple2!17473 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000) (get!17667 (select (arr!34342 _values!874) #b00000000000000000000000000000000) (dynLambda!2324 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102837 () Bool)

(assert (=> b!1102837 (= e!629452 (isEmpty!977 lt!494832))))

(assert (= (and d!130619 c!108924) b!1102835))

(assert (= (and d!130619 (not c!108924)) b!1102827))

(assert (= (and b!1102827 c!108926) b!1102836))

(assert (= (and b!1102827 (not c!108926)) b!1102832))

(assert (= (or b!1102836 b!1102832) bm!46285))

(assert (= (and d!130619 res!735840) b!1102826))

(assert (= (and b!1102826 res!735842) b!1102828))

(assert (= (and b!1102828 res!735841) b!1102833))

(assert (= (and b!1102828 c!108923) b!1102831))

(assert (= (and b!1102828 (not c!108923)) b!1102830))

(assert (= (and b!1102831 res!735839) b!1102829))

(assert (= (and b!1102830 c!108925) b!1102834))

(assert (= (and b!1102830 (not c!108925)) b!1102837))

(declare-fun b_lambda!18199 () Bool)

(assert (=> (not b_lambda!18199) (not b!1102829)))

(assert (=> b!1102829 t!34314))

(declare-fun b_and!37243 () Bool)

(assert (= b_and!37241 (and (=> t!34314 result!16699) b_and!37243)))

(declare-fun b_lambda!18201 () Bool)

(assert (=> (not b_lambda!18201) (not b!1102836)))

(assert (=> b!1102836 t!34314))

(declare-fun b_and!37245 () Bool)

(assert (= b_and!37243 (and (=> t!34314 result!16699) b_and!37245)))

(declare-fun m!1022711 () Bool)

(assert (=> d!130619 m!1022711))

(assert (=> d!130619 m!1022469))

(declare-fun m!1022713 () Bool)

(assert (=> b!1102837 m!1022713))

(assert (=> b!1102833 m!1022563))

(assert (=> b!1102833 m!1022563))

(assert (=> b!1102833 m!1022571))

(assert (=> b!1102831 m!1022563))

(assert (=> b!1102831 m!1022563))

(declare-fun m!1022715 () Bool)

(assert (=> b!1102831 m!1022715))

(assert (=> b!1102827 m!1022563))

(assert (=> b!1102827 m!1022563))

(assert (=> b!1102827 m!1022571))

(declare-fun m!1022717 () Bool)

(assert (=> b!1102826 m!1022717))

(declare-fun m!1022719 () Bool)

(assert (=> b!1102834 m!1022719))

(assert (=> b!1102829 m!1022449))

(assert (=> b!1102829 m!1022563))

(declare-fun m!1022721 () Bool)

(assert (=> b!1102829 m!1022721))

(assert (=> b!1102829 m!1022563))

(assert (=> b!1102829 m!1022577))

(assert (=> b!1102829 m!1022449))

(assert (=> b!1102829 m!1022581))

(assert (=> b!1102829 m!1022577))

(assert (=> b!1102836 m!1022449))

(declare-fun m!1022723 () Bool)

(assert (=> b!1102836 m!1022723))

(assert (=> b!1102836 m!1022563))

(declare-fun m!1022725 () Bool)

(assert (=> b!1102836 m!1022725))

(declare-fun m!1022727 () Bool)

(assert (=> b!1102836 m!1022727))

(declare-fun m!1022729 () Bool)

(assert (=> b!1102836 m!1022729))

(assert (=> b!1102836 m!1022725))

(assert (=> b!1102836 m!1022577))

(assert (=> b!1102836 m!1022449))

(assert (=> b!1102836 m!1022581))

(assert (=> b!1102836 m!1022577))

(assert (=> bm!46285 m!1022719))

(assert (=> b!1102584 d!130619))

(declare-fun d!130621 () Bool)

(assert (=> d!130621 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494838 () Unit!36055)

(declare-fun choose!13 (array!71360 (_ BitVec 64) (_ BitVec 32)) Unit!36055)

(assert (=> d!130621 (= lt!494838 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130621 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130621 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494838)))

(declare-fun bs!32325 () Bool)

(assert (= bs!32325 d!130621))

(assert (=> bs!32325 m!1022457))

(declare-fun m!1022731 () Bool)

(assert (=> bs!32325 m!1022731))

(assert (=> b!1102584 d!130621))

(declare-fun d!130623 () Bool)

(declare-fun lt!494839 () ListLongMap!15441)

(assert (=> d!130623 (not (contains!6379 lt!494839 k0!904))))

(assert (=> d!130623 (= lt!494839 (ListLongMap!15442 (removeStrictlySorted!88 (toList!7736 lt!494640) k0!904)))))

(assert (=> d!130623 (= (-!963 lt!494640 k0!904) lt!494839)))

(declare-fun bs!32326 () Bool)

(assert (= bs!32326 d!130623))

(declare-fun m!1022733 () Bool)

(assert (=> bs!32326 m!1022733))

(declare-fun m!1022735 () Bool)

(assert (=> bs!32326 m!1022735))

(assert (=> b!1102586 d!130623))

(declare-fun bm!46288 () Bool)

(declare-fun call!46291 () Bool)

(declare-fun c!108929 () Bool)

(assert (=> bm!46288 (= call!46291 (arrayNoDuplicates!0 lt!494637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108929 (Cons!24060 (select (arr!34341 lt!494637) #b00000000000000000000000000000000) Nil!24061) Nil!24061)))))

(declare-fun b!1102848 () Bool)

(declare-fun e!629463 () Bool)

(assert (=> b!1102848 (= e!629463 call!46291)))

(declare-fun b!1102849 () Bool)

(declare-fun e!629466 () Bool)

(declare-fun e!629464 () Bool)

(assert (=> b!1102849 (= e!629466 e!629464)))

(declare-fun res!735850 () Bool)

(assert (=> b!1102849 (=> (not res!735850) (not e!629464))))

(declare-fun e!629465 () Bool)

(assert (=> b!1102849 (= res!735850 (not e!629465))))

(declare-fun res!735849 () Bool)

(assert (=> b!1102849 (=> (not res!735849) (not e!629465))))

(assert (=> b!1102849 (= res!735849 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun d!130625 () Bool)

(declare-fun res!735851 () Bool)

(assert (=> d!130625 (=> res!735851 e!629466)))

(assert (=> d!130625 (= res!735851 (bvsge #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(assert (=> d!130625 (= (arrayNoDuplicates!0 lt!494637 #b00000000000000000000000000000000 Nil!24061) e!629466)))

(declare-fun b!1102850 () Bool)

(declare-fun contains!6380 (List!24064 (_ BitVec 64)) Bool)

(assert (=> b!1102850 (= e!629465 (contains!6380 Nil!24061 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun b!1102851 () Bool)

(assert (=> b!1102851 (= e!629464 e!629463)))

(assert (=> b!1102851 (= c!108929 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun b!1102852 () Bool)

(assert (=> b!1102852 (= e!629463 call!46291)))

(assert (= (and d!130625 (not res!735851)) b!1102849))

(assert (= (and b!1102849 res!735849) b!1102850))

(assert (= (and b!1102849 res!735850) b!1102851))

(assert (= (and b!1102851 c!108929) b!1102852))

(assert (= (and b!1102851 (not c!108929)) b!1102848))

(assert (= (or b!1102852 b!1102848) bm!46288))

(assert (=> bm!46288 m!1022631))

(declare-fun m!1022737 () Bool)

(assert (=> bm!46288 m!1022737))

(assert (=> b!1102849 m!1022631))

(assert (=> b!1102849 m!1022631))

(assert (=> b!1102849 m!1022639))

(assert (=> b!1102850 m!1022631))

(assert (=> b!1102850 m!1022631))

(declare-fun m!1022739 () Bool)

(assert (=> b!1102850 m!1022739))

(assert (=> b!1102851 m!1022631))

(assert (=> b!1102851 m!1022631))

(assert (=> b!1102851 m!1022639))

(assert (=> b!1102587 d!130625))

(declare-fun b!1102853 () Bool)

(declare-fun e!629469 () Bool)

(declare-fun e!629467 () Bool)

(assert (=> b!1102853 (= e!629469 e!629467)))

(declare-fun lt!494841 () (_ BitVec 64))

(assert (=> b!1102853 (= lt!494841 (select (arr!34341 lt!494637) #b00000000000000000000000000000000))))

(declare-fun lt!494842 () Unit!36055)

(assert (=> b!1102853 (= lt!494842 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494637 lt!494841 #b00000000000000000000000000000000))))

(assert (=> b!1102853 (arrayContainsKey!0 lt!494637 lt!494841 #b00000000000000000000000000000000)))

(declare-fun lt!494840 () Unit!36055)

(assert (=> b!1102853 (= lt!494840 lt!494842)))

(declare-fun res!735852 () Bool)

(assert (=> b!1102853 (= res!735852 (= (seekEntryOrOpen!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000) lt!494637 mask!1414) (Found!9916 #b00000000000000000000000000000000)))))

(assert (=> b!1102853 (=> (not res!735852) (not e!629467))))

(declare-fun b!1102854 () Bool)

(declare-fun call!46292 () Bool)

(assert (=> b!1102854 (= e!629467 call!46292)))

(declare-fun b!1102855 () Bool)

(declare-fun e!629468 () Bool)

(assert (=> b!1102855 (= e!629468 e!629469)))

(declare-fun c!108930 () Bool)

(assert (=> b!1102855 (= c!108930 (validKeyInArray!0 (select (arr!34341 lt!494637) #b00000000000000000000000000000000)))))

(declare-fun b!1102856 () Bool)

(assert (=> b!1102856 (= e!629469 call!46292)))

(declare-fun d!130627 () Bool)

(declare-fun res!735853 () Bool)

(assert (=> d!130627 (=> res!735853 e!629468)))

(assert (=> d!130627 (= res!735853 (bvsge #b00000000000000000000000000000000 (size!34879 lt!494637)))))

(assert (=> d!130627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494637 mask!1414) e!629468)))

(declare-fun bm!46289 () Bool)

(assert (=> bm!46289 (= call!46292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494637 mask!1414))))

(assert (= (and d!130627 (not res!735853)) b!1102855))

(assert (= (and b!1102855 c!108930) b!1102853))

(assert (= (and b!1102855 (not c!108930)) b!1102856))

(assert (= (and b!1102853 res!735852) b!1102854))

(assert (= (or b!1102854 b!1102856) bm!46289))

(assert (=> b!1102853 m!1022631))

(declare-fun m!1022741 () Bool)

(assert (=> b!1102853 m!1022741))

(declare-fun m!1022743 () Bool)

(assert (=> b!1102853 m!1022743))

(assert (=> b!1102853 m!1022631))

(declare-fun m!1022745 () Bool)

(assert (=> b!1102853 m!1022745))

(assert (=> b!1102855 m!1022631))

(assert (=> b!1102855 m!1022631))

(assert (=> b!1102855 m!1022639))

(declare-fun m!1022747 () Bool)

(assert (=> bm!46289 m!1022747))

(assert (=> b!1102592 d!130627))

(declare-fun d!130629 () Bool)

(assert (=> d!130629 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102583 d!130629))

(declare-fun d!130631 () Bool)

(assert (=> d!130631 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96916 d!130631))

(declare-fun d!130633 () Bool)

(assert (=> d!130633 (= (array_inv!26480 _keys!1070) (bvsge (size!34879 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96916 d!130633))

(declare-fun d!130635 () Bool)

(assert (=> d!130635 (= (array_inv!26481 _values!874) (bvsge (size!34880 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96916 d!130635))

(declare-fun bm!46290 () Bool)

(declare-fun call!46293 () Bool)

(declare-fun c!108931 () Bool)

(assert (=> bm!46290 (= call!46293 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108931 (Cons!24060 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000) Nil!24061) Nil!24061)))))

(declare-fun b!1102857 () Bool)

(declare-fun e!629470 () Bool)

(assert (=> b!1102857 (= e!629470 call!46293)))

(declare-fun b!1102858 () Bool)

(declare-fun e!629473 () Bool)

(declare-fun e!629471 () Bool)

(assert (=> b!1102858 (= e!629473 e!629471)))

(declare-fun res!735855 () Bool)

(assert (=> b!1102858 (=> (not res!735855) (not e!629471))))

(declare-fun e!629472 () Bool)

(assert (=> b!1102858 (= res!735855 (not e!629472))))

(declare-fun res!735854 () Bool)

(assert (=> b!1102858 (=> (not res!735854) (not e!629472))))

(assert (=> b!1102858 (= res!735854 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130637 () Bool)

(declare-fun res!735856 () Bool)

(assert (=> d!130637 (=> res!735856 e!629473)))

(assert (=> d!130637 (= res!735856 (bvsge #b00000000000000000000000000000000 (size!34879 _keys!1070)))))

(assert (=> d!130637 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24061) e!629473)))

(declare-fun b!1102859 () Bool)

(assert (=> b!1102859 (= e!629472 (contains!6380 Nil!24061 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102860 () Bool)

(assert (=> b!1102860 (= e!629471 e!629470)))

(assert (=> b!1102860 (= c!108931 (validKeyInArray!0 (select (arr!34341 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102861 () Bool)

(assert (=> b!1102861 (= e!629470 call!46293)))

(assert (= (and d!130637 (not res!735856)) b!1102858))

(assert (= (and b!1102858 res!735854) b!1102859))

(assert (= (and b!1102858 res!735855) b!1102860))

(assert (= (and b!1102860 c!108931) b!1102861))

(assert (= (and b!1102860 (not c!108931)) b!1102857))

(assert (= (or b!1102861 b!1102857) bm!46290))

(assert (=> bm!46290 m!1022563))

(declare-fun m!1022749 () Bool)

(assert (=> bm!46290 m!1022749))

(assert (=> b!1102858 m!1022563))

(assert (=> b!1102858 m!1022563))

(assert (=> b!1102858 m!1022571))

(assert (=> b!1102859 m!1022563))

(assert (=> b!1102859 m!1022563))

(declare-fun m!1022751 () Bool)

(assert (=> b!1102859 m!1022751))

(assert (=> b!1102860 m!1022563))

(assert (=> b!1102860 m!1022563))

(assert (=> b!1102860 m!1022571))

(assert (=> b!1102589 d!130637))

(declare-fun mapNonEmpty!42700 () Bool)

(declare-fun mapRes!42700 () Bool)

(declare-fun tp!81620 () Bool)

(declare-fun e!629478 () Bool)

(assert (=> mapNonEmpty!42700 (= mapRes!42700 (and tp!81620 e!629478))))

(declare-fun mapKey!42700 () (_ BitVec 32))

(declare-fun mapRest!42700 () (Array (_ BitVec 32) ValueCell!12923))

(declare-fun mapValue!42700 () ValueCell!12923)

(assert (=> mapNonEmpty!42700 (= mapRest!42691 (store mapRest!42700 mapKey!42700 mapValue!42700))))

(declare-fun mapIsEmpty!42700 () Bool)

(assert (=> mapIsEmpty!42700 mapRes!42700))

(declare-fun b!1102868 () Bool)

(assert (=> b!1102868 (= e!629478 tp_is_empty!27265)))

(declare-fun condMapEmpty!42700 () Bool)

(declare-fun mapDefault!42700 () ValueCell!12923)

(assert (=> mapNonEmpty!42691 (= condMapEmpty!42700 (= mapRest!42691 ((as const (Array (_ BitVec 32) ValueCell!12923)) mapDefault!42700)))))

(declare-fun e!629479 () Bool)

(assert (=> mapNonEmpty!42691 (= tp!81605 (and e!629479 mapRes!42700))))

(declare-fun b!1102869 () Bool)

(assert (=> b!1102869 (= e!629479 tp_is_empty!27265)))

(assert (= (and mapNonEmpty!42691 condMapEmpty!42700) mapIsEmpty!42700))

(assert (= (and mapNonEmpty!42691 (not condMapEmpty!42700)) mapNonEmpty!42700))

(assert (= (and mapNonEmpty!42700 ((_ is ValueCellFull!12923) mapValue!42700)) b!1102868))

(assert (= (and mapNonEmpty!42691 ((_ is ValueCellFull!12923) mapDefault!42700)) b!1102869))

(declare-fun m!1022753 () Bool)

(assert (=> mapNonEmpty!42700 m!1022753))

(declare-fun b_lambda!18203 () Bool)

(assert (= b_lambda!18197 (or (and start!96916 b_free!23215) b_lambda!18203)))

(declare-fun b_lambda!18205 () Bool)

(assert (= b_lambda!18199 (or (and start!96916 b_free!23215) b_lambda!18205)))

(declare-fun b_lambda!18207 () Bool)

(assert (= b_lambda!18193 (or (and start!96916 b_free!23215) b_lambda!18207)))

(declare-fun b_lambda!18209 () Bool)

(assert (= b_lambda!18191 (or (and start!96916 b_free!23215) b_lambda!18209)))

(declare-fun b_lambda!18211 () Bool)

(assert (= b_lambda!18195 (or (and start!96916 b_free!23215) b_lambda!18211)))

(declare-fun b_lambda!18213 () Bool)

(assert (= b_lambda!18189 (or (and start!96916 b_free!23215) b_lambda!18213)))

(declare-fun b_lambda!18215 () Bool)

(assert (= b_lambda!18201 (or (and start!96916 b_free!23215) b_lambda!18215)))

(check-sat (not b!1102833) (not bm!46280) (not d!130609) (not b!1102858) (not d!130615) (not b_next!23215) (not b_lambda!18211) (not b!1102834) (not b_lambda!18209) b_and!37245 (not b!1102764) (not mapNonEmpty!42700) (not bm!46289) (not b!1102739) (not b!1102787) (not b!1102814) (not b!1102826) (not bm!46262) (not b_lambda!18187) (not bm!46288) (not b!1102746) (not b!1102837) (not bm!46290) (not bm!46247) (not b!1102824) (not b!1102687) (not bm!46269) (not b!1102836) (not b!1102860) (not b!1102774) (not bm!46284) (not b_lambda!18207) (not b!1102761) (not d!130621) (not b!1102859) (not b!1102855) (not b!1102696) (not b!1102689) (not bm!46264) (not bm!46285) (not b!1102851) (not b!1102740) (not b!1102760) (not bm!46281) (not b!1102743) (not b!1102827) (not b!1102753) (not b!1102821) (not b!1102769) (not bm!46267) (not d!130619) (not b_lambda!18205) (not b!1102829) (not bm!46272) (not b!1102759) (not b!1102767) (not bm!46271) (not b!1102817) (not bm!46265) (not b!1102831) (not b!1102825) (not b!1102819) (not b!1102780) (not d!130611) (not bm!46274) (not b!1102815) (not b_lambda!18215) (not b!1102850) (not b!1102853) (not d!130623) (not b_lambda!18203) (not b_lambda!18213) (not b!1102768) (not b!1102748) (not b!1102822) (not d!130613) (not b!1102849) tp_is_empty!27265 (not d!130617) (not b!1102747))
(check-sat b_and!37245 (not b_next!23215))
