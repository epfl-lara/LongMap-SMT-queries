; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97066 () Bool)

(assert start!97066)

(declare-fun b_free!23173 () Bool)

(declare-fun b_next!23173 () Bool)

(assert (=> start!97066 (= b_free!23173 (not b_next!23173))))

(declare-fun tp!81473 () Bool)

(declare-fun b_and!37145 () Bool)

(assert (=> start!97066 (= tp!81473 b_and!37145)))

(declare-fun mapNonEmpty!42622 () Bool)

(declare-fun mapRes!42622 () Bool)

(declare-fun tp!81472 () Bool)

(declare-fun e!629548 () Bool)

(assert (=> mapNonEmpty!42622 (= mapRes!42622 (and tp!81472 e!629548))))

(declare-datatypes ((V!41425 0))(
  ( (V!41426 (val!13668 Int)) )
))
(declare-datatypes ((ValueCell!12902 0))(
  ( (ValueCellFull!12902 (v!16294 V!41425)) (EmptyCell!12902) )
))
(declare-fun mapRest!42622 () (Array (_ BitVec 32) ValueCell!12902))

(declare-fun mapValue!42622 () ValueCell!12902)

(declare-datatypes ((array!71403 0))(
  ( (array!71404 (arr!34358 (Array (_ BitVec 32) ValueCell!12902)) (size!34895 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71403)

(declare-fun mapKey!42622 () (_ BitVec 32))

(assert (=> mapNonEmpty!42622 (= (arr!34358 _values!874) (store mapRest!42622 mapKey!42622 mapValue!42622))))

(declare-fun res!735482 () Bool)

(declare-fun e!629553 () Bool)

(assert (=> start!97066 (=> (not res!735482) (not e!629553))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97066 (= res!735482 (validMask!0 mask!1414))))

(assert (=> start!97066 e!629553))

(assert (=> start!97066 tp!81473))

(assert (=> start!97066 true))

(declare-fun tp_is_empty!27223 () Bool)

(assert (=> start!97066 tp_is_empty!27223))

(declare-datatypes ((array!71405 0))(
  ( (array!71406 (arr!34359 (Array (_ BitVec 32) (_ BitVec 64))) (size!34896 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71405)

(declare-fun array_inv!26488 (array!71405) Bool)

(assert (=> start!97066 (array_inv!26488 _keys!1070)))

(declare-fun e!629554 () Bool)

(declare-fun array_inv!26489 (array!71403) Bool)

(assert (=> start!97066 (and (array_inv!26489 _values!874) e!629554)))

(declare-fun e!629549 () Bool)

(declare-datatypes ((tuple2!17398 0))(
  ( (tuple2!17399 (_1!8710 (_ BitVec 64)) (_2!8710 V!41425)) )
))
(declare-datatypes ((List!24017 0))(
  ( (Nil!24014) (Cons!24013 (h!25231 tuple2!17398) (t!34228 List!24017)) )
))
(declare-datatypes ((ListLongMap!15375 0))(
  ( (ListLongMap!15376 (toList!7703 List!24017)) )
))
(declare-fun lt!494354 () ListLongMap!15375)

(declare-fun b!1102795 () Bool)

(declare-fun lt!494356 () tuple2!17398)

(declare-fun lt!494361 () ListLongMap!15375)

(declare-fun +!3431 (ListLongMap!15375 tuple2!17398) ListLongMap!15375)

(assert (=> b!1102795 (= e!629549 (= lt!494354 (+!3431 lt!494361 lt!494356)))))

(declare-fun b!1102796 () Bool)

(declare-fun e!629551 () Bool)

(assert (=> b!1102796 (= e!629554 (and e!629551 mapRes!42622))))

(declare-fun condMapEmpty!42622 () Bool)

(declare-fun mapDefault!42622 () ValueCell!12902)

(assert (=> b!1102796 (= condMapEmpty!42622 (= (arr!34358 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12902)) mapDefault!42622)))))

(declare-fun b!1102797 () Bool)

(declare-fun res!735483 () Bool)

(assert (=> b!1102797 (=> (not res!735483) (not e!629553))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102797 (= res!735483 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42622 () Bool)

(assert (=> mapIsEmpty!42622 mapRes!42622))

(declare-fun b!1102798 () Bool)

(assert (=> b!1102798 (= e!629551 tp_is_empty!27223)))

(declare-fun b!1102799 () Bool)

(declare-fun res!735492 () Bool)

(assert (=> b!1102799 (=> (not res!735492) (not e!629553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71405 (_ BitVec 32)) Bool)

(assert (=> b!1102799 (= res!735492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102800 () Bool)

(declare-fun e!629550 () Bool)

(assert (=> b!1102800 (= e!629553 e!629550)))

(declare-fun res!735488 () Bool)

(assert (=> b!1102800 (=> (not res!735488) (not e!629550))))

(declare-fun lt!494358 () array!71405)

(assert (=> b!1102800 (= res!735488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494358 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102800 (= lt!494358 (array!71406 (store (arr!34359 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34896 _keys!1070)))))

(declare-fun b!1102801 () Bool)

(declare-fun res!735485 () Bool)

(assert (=> b!1102801 (=> (not res!735485) (not e!629553))))

(declare-datatypes ((List!24018 0))(
  ( (Nil!24015) (Cons!24014 (h!25232 (_ BitVec 64)) (t!34229 List!24018)) )
))
(declare-fun arrayNoDuplicates!0 (array!71405 (_ BitVec 32) List!24018) Bool)

(assert (=> b!1102801 (= res!735485 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24015))))

(declare-fun b!1102802 () Bool)

(declare-fun res!735487 () Bool)

(assert (=> b!1102802 (=> (not res!735487) (not e!629553))))

(assert (=> b!1102802 (= res!735487 (= (select (arr!34359 _keys!1070) i!650) k0!904))))

(declare-fun b!1102803 () Bool)

(declare-fun res!735489 () Bool)

(assert (=> b!1102803 (=> (not res!735489) (not e!629550))))

(assert (=> b!1102803 (= res!735489 (arrayNoDuplicates!0 lt!494358 #b00000000000000000000000000000000 Nil!24015))))

(declare-fun b!1102804 () Bool)

(assert (=> b!1102804 (= e!629548 tp_is_empty!27223)))

(declare-fun b!1102805 () Bool)

(declare-fun res!735484 () Bool)

(assert (=> b!1102805 (=> (not res!735484) (not e!629553))))

(assert (=> b!1102805 (= res!735484 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34896 _keys!1070))))))

(declare-fun b!1102806 () Bool)

(declare-fun res!735491 () Bool)

(assert (=> b!1102806 (=> (not res!735491) (not e!629549))))

(declare-fun lt!494360 () ListLongMap!15375)

(declare-fun lt!494363 () ListLongMap!15375)

(assert (=> b!1102806 (= res!735491 (= lt!494363 (+!3431 lt!494360 lt!494356)))))

(declare-fun b!1102807 () Bool)

(declare-fun res!735486 () Bool)

(assert (=> b!1102807 (=> (not res!735486) (not e!629553))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102807 (= res!735486 (and (= (size!34895 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34896 _keys!1070) (size!34895 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102808 () Bool)

(declare-fun e!629552 () Bool)

(assert (=> b!1102808 (= e!629552 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1102808 e!629549))

(declare-fun res!735490 () Bool)

(assert (=> b!1102808 (=> (not res!735490) (not e!629549))))

(declare-fun lt!494355 () ListLongMap!15375)

(assert (=> b!1102808 (= res!735490 (= lt!494363 (+!3431 lt!494355 lt!494356)))))

(declare-fun minValue!831 () V!41425)

(assert (=> b!1102808 (= lt!494356 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1102809 () Bool)

(assert (=> b!1102809 (= e!629550 (not e!629552))))

(declare-fun res!735481 () Bool)

(assert (=> b!1102809 (=> res!735481 e!629552)))

(assert (=> b!1102809 (= res!735481 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41425)

(declare-fun getCurrentListMap!4404 (array!71405 array!71403 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1102809 (= lt!494354 (getCurrentListMap!4404 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494362 () array!71403)

(assert (=> b!1102809 (= lt!494363 (getCurrentListMap!4404 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1102809 (and (= lt!494355 lt!494360) (= lt!494360 lt!494355))))

(declare-fun -!968 (ListLongMap!15375 (_ BitVec 64)) ListLongMap!15375)

(assert (=> b!1102809 (= lt!494360 (-!968 lt!494361 k0!904))))

(declare-datatypes ((Unit!36193 0))(
  ( (Unit!36194) )
))
(declare-fun lt!494357 () Unit!36193)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!238 (array!71405 array!71403 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36193)

(assert (=> b!1102809 (= lt!494357 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4245 (array!71405 array!71403 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1102809 (= lt!494355 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2363 (Int (_ BitVec 64)) V!41425)

(assert (=> b!1102809 (= lt!494362 (array!71404 (store (arr!34358 _values!874) i!650 (ValueCellFull!12902 (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34895 _values!874)))))

(assert (=> b!1102809 (= lt!494361 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102809 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494359 () Unit!36193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71405 (_ BitVec 64) (_ BitVec 32)) Unit!36193)

(assert (=> b!1102809 (= lt!494359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!97066 res!735482) b!1102807))

(assert (= (and b!1102807 res!735486) b!1102799))

(assert (= (and b!1102799 res!735492) b!1102801))

(assert (= (and b!1102801 res!735485) b!1102805))

(assert (= (and b!1102805 res!735484) b!1102797))

(assert (= (and b!1102797 res!735483) b!1102802))

(assert (= (and b!1102802 res!735487) b!1102800))

(assert (= (and b!1102800 res!735488) b!1102803))

(assert (= (and b!1102803 res!735489) b!1102809))

(assert (= (and b!1102809 (not res!735481)) b!1102808))

(assert (= (and b!1102808 res!735490) b!1102806))

(assert (= (and b!1102806 res!735491) b!1102795))

(assert (= (and b!1102796 condMapEmpty!42622) mapIsEmpty!42622))

(assert (= (and b!1102796 (not condMapEmpty!42622)) mapNonEmpty!42622))

(get-info :version)

(assert (= (and mapNonEmpty!42622 ((_ is ValueCellFull!12902) mapValue!42622)) b!1102804))

(assert (= (and b!1102796 ((_ is ValueCellFull!12902) mapDefault!42622)) b!1102798))

(assert (= start!97066 b!1102796))

(declare-fun b_lambda!18111 () Bool)

(assert (=> (not b_lambda!18111) (not b!1102809)))

(declare-fun t!34227 () Bool)

(declare-fun tb!8031 () Bool)

(assert (=> (and start!97066 (= defaultEntry!882 defaultEntry!882) t!34227) tb!8031))

(declare-fun result!16611 () Bool)

(assert (=> tb!8031 (= result!16611 tp_is_empty!27223)))

(assert (=> b!1102809 t!34227))

(declare-fun b_and!37147 () Bool)

(assert (= b_and!37145 (and (=> t!34227 result!16611) b_and!37147)))

(declare-fun m!1023321 () Bool)

(assert (=> b!1102803 m!1023321))

(declare-fun m!1023323 () Bool)

(assert (=> b!1102806 m!1023323))

(declare-fun m!1023325 () Bool)

(assert (=> b!1102795 m!1023325))

(declare-fun m!1023327 () Bool)

(assert (=> b!1102809 m!1023327))

(declare-fun m!1023329 () Bool)

(assert (=> b!1102809 m!1023329))

(declare-fun m!1023331 () Bool)

(assert (=> b!1102809 m!1023331))

(declare-fun m!1023333 () Bool)

(assert (=> b!1102809 m!1023333))

(declare-fun m!1023335 () Bool)

(assert (=> b!1102809 m!1023335))

(declare-fun m!1023337 () Bool)

(assert (=> b!1102809 m!1023337))

(declare-fun m!1023339 () Bool)

(assert (=> b!1102809 m!1023339))

(declare-fun m!1023341 () Bool)

(assert (=> b!1102809 m!1023341))

(declare-fun m!1023343 () Bool)

(assert (=> b!1102809 m!1023343))

(declare-fun m!1023345 () Bool)

(assert (=> b!1102809 m!1023345))

(declare-fun m!1023347 () Bool)

(assert (=> b!1102800 m!1023347))

(declare-fun m!1023349 () Bool)

(assert (=> b!1102800 m!1023349))

(declare-fun m!1023351 () Bool)

(assert (=> b!1102801 m!1023351))

(declare-fun m!1023353 () Bool)

(assert (=> mapNonEmpty!42622 m!1023353))

(declare-fun m!1023355 () Bool)

(assert (=> b!1102802 m!1023355))

(declare-fun m!1023357 () Bool)

(assert (=> b!1102797 m!1023357))

(declare-fun m!1023359 () Bool)

(assert (=> start!97066 m!1023359))

(declare-fun m!1023361 () Bool)

(assert (=> start!97066 m!1023361))

(declare-fun m!1023363 () Bool)

(assert (=> start!97066 m!1023363))

(declare-fun m!1023365 () Bool)

(assert (=> b!1102808 m!1023365))

(declare-fun m!1023367 () Bool)

(assert (=> b!1102799 m!1023367))

(check-sat (not b!1102799) (not start!97066) b_and!37147 (not b!1102797) (not mapNonEmpty!42622) (not b!1102806) (not b!1102809) (not b_next!23173) (not b!1102803) (not b!1102795) tp_is_empty!27223 (not b!1102800) (not b!1102808) (not b_lambda!18111) (not b!1102801))
(check-sat b_and!37147 (not b_next!23173))
(get-model)

(declare-fun b_lambda!18117 () Bool)

(assert (= b_lambda!18111 (or (and start!97066 b_free!23173) b_lambda!18117)))

(check-sat (not b!1102799) (not start!97066) (not b!1102797) (not mapNonEmpty!42622) (not b!1102801) (not b!1102806) (not b!1102809) (not b_next!23173) (not b!1102803) (not b_lambda!18117) b_and!37147 (not b!1102795) tp_is_empty!27223 (not b!1102800) (not b!1102808))
(check-sat b_and!37147 (not b_next!23173))
(get-model)

(declare-fun d!131141 () Bool)

(assert (=> d!131141 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!97066 d!131141))

(declare-fun d!131143 () Bool)

(assert (=> d!131143 (= (array_inv!26488 _keys!1070) (bvsge (size!34896 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!97066 d!131143))

(declare-fun d!131145 () Bool)

(assert (=> d!131145 (= (array_inv!26489 _values!874) (bvsge (size!34895 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!97066 d!131145))

(declare-fun d!131147 () Bool)

(assert (=> d!131147 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102797 d!131147))

(declare-fun b!1102930 () Bool)

(declare-fun e!629618 () Bool)

(declare-fun e!629619 () Bool)

(assert (=> b!1102930 (= e!629618 e!629619)))

(assert (=> b!1102930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(declare-fun res!735576 () Bool)

(declare-fun lt!494438 () ListLongMap!15375)

(declare-fun contains!6428 (ListLongMap!15375 (_ BitVec 64)) Bool)

(assert (=> b!1102930 (= res!735576 (contains!6428 lt!494438 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(assert (=> b!1102930 (=> (not res!735576) (not e!629619))))

(declare-fun b!1102931 () Bool)

(assert (=> b!1102931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (=> b!1102931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34895 lt!494362)))))

(declare-fun apply!961 (ListLongMap!15375 (_ BitVec 64)) V!41425)

(declare-fun get!17685 (ValueCell!12902 V!41425) V!41425)

(assert (=> b!1102931 (= e!629619 (= (apply!961 lt!494438 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)) (get!17685 (select (arr!34358 lt!494362) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102932 () Bool)

(declare-fun e!629623 () ListLongMap!15375)

(declare-fun e!629622 () ListLongMap!15375)

(assert (=> b!1102932 (= e!629623 e!629622)))

(declare-fun c!109237 () Bool)

(assert (=> b!1102932 (= c!109237 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun b!1102933 () Bool)

(declare-fun e!629621 () Bool)

(assert (=> b!1102933 (= e!629621 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(assert (=> b!1102933 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102934 () Bool)

(declare-fun call!46248 () ListLongMap!15375)

(assert (=> b!1102934 (= e!629622 call!46248)))

(declare-fun b!1102935 () Bool)

(declare-fun e!629620 () Bool)

(declare-fun isEmpty!974 (ListLongMap!15375) Bool)

(assert (=> b!1102935 (= e!629620 (isEmpty!974 lt!494438))))

(declare-fun b!1102936 () Bool)

(assert (=> b!1102936 (= e!629618 e!629620)))

(declare-fun c!109236 () Bool)

(assert (=> b!1102936 (= c!109236 (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(declare-fun b!1102937 () Bool)

(declare-fun lt!494443 () Unit!36193)

(declare-fun lt!494440 () Unit!36193)

(assert (=> b!1102937 (= lt!494443 lt!494440)))

(declare-fun lt!494444 () (_ BitVec 64))

(declare-fun lt!494439 () ListLongMap!15375)

(declare-fun lt!494441 () (_ BitVec 64))

(declare-fun lt!494442 () V!41425)

(assert (=> b!1102937 (not (contains!6428 (+!3431 lt!494439 (tuple2!17399 lt!494444 lt!494442)) lt!494441))))

(declare-fun addStillNotContains!282 (ListLongMap!15375 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36193)

(assert (=> b!1102937 (= lt!494440 (addStillNotContains!282 lt!494439 lt!494444 lt!494442 lt!494441))))

(assert (=> b!1102937 (= lt!494441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102937 (= lt!494442 (get!17685 (select (arr!34358 lt!494362) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102937 (= lt!494444 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(assert (=> b!1102937 (= lt!494439 call!46248)))

(assert (=> b!1102937 (= e!629622 (+!3431 call!46248 (tuple2!17399 (select (arr!34359 lt!494358) #b00000000000000000000000000000000) (get!17685 (select (arr!34358 lt!494362) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102938 () Bool)

(assert (=> b!1102938 (= e!629623 (ListLongMap!15376 Nil!24014))))

(declare-fun b!1102939 () Bool)

(declare-fun res!735573 () Bool)

(declare-fun e!629624 () Bool)

(assert (=> b!1102939 (=> (not res!735573) (not e!629624))))

(assert (=> b!1102939 (= res!735573 (not (contains!6428 lt!494438 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!131149 () Bool)

(assert (=> d!131149 e!629624))

(declare-fun res!735575 () Bool)

(assert (=> d!131149 (=> (not res!735575) (not e!629624))))

(assert (=> d!131149 (= res!735575 (not (contains!6428 lt!494438 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131149 (= lt!494438 e!629623)))

(declare-fun c!109238 () Bool)

(assert (=> d!131149 (= c!109238 (bvsge #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (=> d!131149 (validMask!0 mask!1414)))

(assert (=> d!131149 (= (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494438)))

(declare-fun bm!46245 () Bool)

(assert (=> bm!46245 (= call!46248 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102940 () Bool)

(assert (=> b!1102940 (= e!629620 (= lt!494438 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102941 () Bool)

(assert (=> b!1102941 (= e!629624 e!629618)))

(declare-fun c!109239 () Bool)

(assert (=> b!1102941 (= c!109239 e!629621)))

(declare-fun res!735574 () Bool)

(assert (=> b!1102941 (=> (not res!735574) (not e!629621))))

(assert (=> b!1102941 (= res!735574 (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (= (and d!131149 c!109238) b!1102938))

(assert (= (and d!131149 (not c!109238)) b!1102932))

(assert (= (and b!1102932 c!109237) b!1102937))

(assert (= (and b!1102932 (not c!109237)) b!1102934))

(assert (= (or b!1102937 b!1102934) bm!46245))

(assert (= (and d!131149 res!735575) b!1102939))

(assert (= (and b!1102939 res!735573) b!1102941))

(assert (= (and b!1102941 res!735574) b!1102933))

(assert (= (and b!1102941 c!109239) b!1102930))

(assert (= (and b!1102941 (not c!109239)) b!1102936))

(assert (= (and b!1102930 res!735576) b!1102931))

(assert (= (and b!1102936 c!109236) b!1102940))

(assert (= (and b!1102936 (not c!109236)) b!1102935))

(declare-fun b_lambda!18119 () Bool)

(assert (=> (not b_lambda!18119) (not b!1102931)))

(assert (=> b!1102931 t!34227))

(declare-fun b_and!37157 () Bool)

(assert (= b_and!37147 (and (=> t!34227 result!16611) b_and!37157)))

(declare-fun b_lambda!18121 () Bool)

(assert (=> (not b_lambda!18121) (not b!1102937)))

(assert (=> b!1102937 t!34227))

(declare-fun b_and!37159 () Bool)

(assert (= b_and!37157 (and (=> t!34227 result!16611) b_and!37159)))

(declare-fun m!1023465 () Bool)

(assert (=> b!1102940 m!1023465))

(declare-fun m!1023467 () Bool)

(assert (=> d!131149 m!1023467))

(assert (=> d!131149 m!1023359))

(declare-fun m!1023469 () Bool)

(assert (=> b!1102932 m!1023469))

(assert (=> b!1102932 m!1023469))

(declare-fun m!1023471 () Bool)

(assert (=> b!1102932 m!1023471))

(assert (=> bm!46245 m!1023465))

(assert (=> b!1102930 m!1023469))

(assert (=> b!1102930 m!1023469))

(declare-fun m!1023473 () Bool)

(assert (=> b!1102930 m!1023473))

(assert (=> b!1102933 m!1023469))

(assert (=> b!1102933 m!1023469))

(assert (=> b!1102933 m!1023471))

(declare-fun m!1023475 () Bool)

(assert (=> b!1102939 m!1023475))

(declare-fun m!1023477 () Bool)

(assert (=> b!1102937 m!1023477))

(declare-fun m!1023479 () Bool)

(assert (=> b!1102937 m!1023479))

(declare-fun m!1023481 () Bool)

(assert (=> b!1102937 m!1023481))

(assert (=> b!1102937 m!1023327))

(declare-fun m!1023483 () Bool)

(assert (=> b!1102937 m!1023483))

(assert (=> b!1102937 m!1023327))

(declare-fun m!1023485 () Bool)

(assert (=> b!1102937 m!1023485))

(assert (=> b!1102937 m!1023479))

(declare-fun m!1023487 () Bool)

(assert (=> b!1102937 m!1023487))

(assert (=> b!1102937 m!1023469))

(assert (=> b!1102937 m!1023481))

(assert (=> b!1102931 m!1023327))

(assert (=> b!1102931 m!1023481))

(assert (=> b!1102931 m!1023327))

(assert (=> b!1102931 m!1023483))

(assert (=> b!1102931 m!1023469))

(declare-fun m!1023489 () Bool)

(assert (=> b!1102931 m!1023489))

(assert (=> b!1102931 m!1023469))

(assert (=> b!1102931 m!1023481))

(declare-fun m!1023491 () Bool)

(assert (=> b!1102935 m!1023491))

(assert (=> b!1102809 d!131149))

(declare-fun bm!46260 () Bool)

(declare-fun call!46269 () Bool)

(declare-fun lt!494489 () ListLongMap!15375)

(assert (=> bm!46260 (= call!46269 (contains!6428 lt!494489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102984 () Bool)

(declare-fun e!629652 () Bool)

(declare-fun e!629659 () Bool)

(assert (=> b!1102984 (= e!629652 e!629659)))

(declare-fun c!109253 () Bool)

(assert (=> b!1102984 (= c!109253 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102985 () Bool)

(declare-fun e!629654 () Bool)

(declare-fun e!629653 () Bool)

(assert (=> b!1102985 (= e!629654 e!629653)))

(declare-fun res!735602 () Bool)

(assert (=> b!1102985 (=> (not res!735602) (not e!629653))))

(assert (=> b!1102985 (= res!735602 (contains!6428 lt!494489 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(declare-fun b!1102986 () Bool)

(declare-fun e!629660 () Bool)

(assert (=> b!1102986 (= e!629660 (not call!46269))))

(declare-fun b!1102987 () Bool)

(declare-fun e!629657 () Unit!36193)

(declare-fun Unit!36195 () Unit!36193)

(assert (=> b!1102987 (= e!629657 Unit!36195)))

(declare-fun b!1102989 () Bool)

(declare-fun e!629663 () ListLongMap!15375)

(declare-fun e!629656 () ListLongMap!15375)

(assert (=> b!1102989 (= e!629663 e!629656)))

(declare-fun c!109252 () Bool)

(assert (=> b!1102989 (= c!109252 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102990 () Bool)

(declare-fun e!629658 () Bool)

(assert (=> b!1102990 (= e!629658 (= (apply!961 lt!494489 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102991 () Bool)

(declare-fun lt!494503 () Unit!36193)

(assert (=> b!1102991 (= e!629657 lt!494503)))

(declare-fun lt!494504 () ListLongMap!15375)

(assert (=> b!1102991 (= lt!494504 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494491 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494501 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494501 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494500 () Unit!36193)

(declare-fun addStillContains!665 (ListLongMap!15375 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36193)

(assert (=> b!1102991 (= lt!494500 (addStillContains!665 lt!494504 lt!494491 zeroValue!831 lt!494501))))

(assert (=> b!1102991 (contains!6428 (+!3431 lt!494504 (tuple2!17399 lt!494491 zeroValue!831)) lt!494501)))

(declare-fun lt!494493 () Unit!36193)

(assert (=> b!1102991 (= lt!494493 lt!494500)))

(declare-fun lt!494498 () ListLongMap!15375)

(assert (=> b!1102991 (= lt!494498 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494499 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494506 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494506 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494494 () Unit!36193)

(declare-fun addApplyDifferent!521 (ListLongMap!15375 (_ BitVec 64) V!41425 (_ BitVec 64)) Unit!36193)

(assert (=> b!1102991 (= lt!494494 (addApplyDifferent!521 lt!494498 lt!494499 minValue!831 lt!494506))))

(assert (=> b!1102991 (= (apply!961 (+!3431 lt!494498 (tuple2!17399 lt!494499 minValue!831)) lt!494506) (apply!961 lt!494498 lt!494506))))

(declare-fun lt!494496 () Unit!36193)

(assert (=> b!1102991 (= lt!494496 lt!494494)))

(declare-fun lt!494502 () ListLongMap!15375)

(assert (=> b!1102991 (= lt!494502 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494510 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494505 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494505 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494490 () Unit!36193)

(assert (=> b!1102991 (= lt!494490 (addApplyDifferent!521 lt!494502 lt!494510 zeroValue!831 lt!494505))))

(assert (=> b!1102991 (= (apply!961 (+!3431 lt!494502 (tuple2!17399 lt!494510 zeroValue!831)) lt!494505) (apply!961 lt!494502 lt!494505))))

(declare-fun lt!494495 () Unit!36193)

(assert (=> b!1102991 (= lt!494495 lt!494490)))

(declare-fun lt!494507 () ListLongMap!15375)

(assert (=> b!1102991 (= lt!494507 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494492 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494492 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494509 () (_ BitVec 64))

(assert (=> b!1102991 (= lt!494509 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102991 (= lt!494503 (addApplyDifferent!521 lt!494507 lt!494492 minValue!831 lt!494509))))

(assert (=> b!1102991 (= (apply!961 (+!3431 lt!494507 (tuple2!17399 lt!494492 minValue!831)) lt!494509) (apply!961 lt!494507 lt!494509))))

(declare-fun b!1102992 () Bool)

(declare-fun call!46265 () ListLongMap!15375)

(assert (=> b!1102992 (= e!629663 (+!3431 call!46265 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102993 () Bool)

(declare-fun e!629651 () Bool)

(assert (=> b!1102993 (= e!629651 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102994 () Bool)

(declare-fun e!629662 () Bool)

(assert (=> b!1102994 (= e!629662 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46261 () Bool)

(declare-fun call!46266 () Bool)

(assert (=> bm!46261 (= call!46266 (contains!6428 lt!494489 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46262 () Bool)

(declare-fun call!46263 () ListLongMap!15375)

(declare-fun call!46268 () ListLongMap!15375)

(assert (=> bm!46262 (= call!46263 call!46268)))

(declare-fun bm!46263 () Bool)

(declare-fun call!46267 () ListLongMap!15375)

(assert (=> bm!46263 (= call!46267 call!46265)))

(declare-fun b!1102995 () Bool)

(declare-fun res!735601 () Bool)

(assert (=> b!1102995 (=> (not res!735601) (not e!629652))))

(assert (=> b!1102995 (= res!735601 e!629660)))

(declare-fun c!109254 () Bool)

(assert (=> b!1102995 (= c!109254 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102996 () Bool)

(assert (=> b!1102996 (= e!629659 (not call!46266))))

(declare-fun b!1102997 () Bool)

(declare-fun res!735599 () Bool)

(assert (=> b!1102997 (=> (not res!735599) (not e!629652))))

(assert (=> b!1102997 (= res!735599 e!629654)))

(declare-fun res!735598 () Bool)

(assert (=> b!1102997 (=> res!735598 e!629654)))

(assert (=> b!1102997 (= res!735598 (not e!629651))))

(declare-fun res!735603 () Bool)

(assert (=> b!1102997 (=> (not res!735603) (not e!629651))))

(assert (=> b!1102997 (= res!735603 (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(declare-fun d!131151 () Bool)

(assert (=> d!131151 e!629652))

(declare-fun res!735600 () Bool)

(assert (=> d!131151 (=> (not res!735600) (not e!629652))))

(assert (=> d!131151 (= res!735600 (or (bvsge #b00000000000000000000000000000000 (size!34896 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))))

(declare-fun lt!494497 () ListLongMap!15375)

(assert (=> d!131151 (= lt!494489 lt!494497)))

(declare-fun lt!494508 () Unit!36193)

(assert (=> d!131151 (= lt!494508 e!629657)))

(declare-fun c!109255 () Bool)

(assert (=> d!131151 (= c!109255 e!629662)))

(declare-fun res!735596 () Bool)

(assert (=> d!131151 (=> (not res!735596) (not e!629662))))

(assert (=> d!131151 (= res!735596 (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> d!131151 (= lt!494497 e!629663)))

(declare-fun c!109256 () Bool)

(assert (=> d!131151 (= c!109256 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131151 (validMask!0 mask!1414)))

(assert (=> d!131151 (= (getCurrentListMap!4404 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494489)))

(declare-fun b!1102988 () Bool)

(declare-fun c!109257 () Bool)

(assert (=> b!1102988 (= c!109257 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629661 () ListLongMap!15375)

(assert (=> b!1102988 (= e!629656 e!629661)))

(declare-fun b!1102998 () Bool)

(assert (=> b!1102998 (= e!629659 e!629658)))

(declare-fun res!735597 () Bool)

(assert (=> b!1102998 (= res!735597 call!46266)))

(assert (=> b!1102998 (=> (not res!735597) (not e!629658))))

(declare-fun bm!46264 () Bool)

(declare-fun call!46264 () ListLongMap!15375)

(assert (=> bm!46264 (= call!46264 call!46263)))

(declare-fun b!1102999 () Bool)

(assert (=> b!1102999 (= e!629656 call!46267)))

(declare-fun b!1103000 () Bool)

(assert (=> b!1103000 (= e!629661 call!46267)))

(declare-fun bm!46265 () Bool)

(assert (=> bm!46265 (= call!46268 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1103001 () Bool)

(assert (=> b!1103001 (= e!629661 call!46264)))

(declare-fun bm!46266 () Bool)

(assert (=> bm!46266 (= call!46265 (+!3431 (ite c!109256 call!46268 (ite c!109252 call!46263 call!46264)) (ite (or c!109256 c!109252) (tuple2!17399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1103002 () Bool)

(assert (=> b!1103002 (= e!629653 (= (apply!961 lt!494489 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)) (get!17685 (select (arr!34358 _values!874) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34895 _values!874)))))

(assert (=> b!1103002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(declare-fun b!1103003 () Bool)

(declare-fun e!629655 () Bool)

(assert (=> b!1103003 (= e!629655 (= (apply!961 lt!494489 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1103004 () Bool)

(assert (=> b!1103004 (= e!629660 e!629655)))

(declare-fun res!735595 () Bool)

(assert (=> b!1103004 (= res!735595 call!46269)))

(assert (=> b!1103004 (=> (not res!735595) (not e!629655))))

(assert (= (and d!131151 c!109256) b!1102992))

(assert (= (and d!131151 (not c!109256)) b!1102989))

(assert (= (and b!1102989 c!109252) b!1102999))

(assert (= (and b!1102989 (not c!109252)) b!1102988))

(assert (= (and b!1102988 c!109257) b!1103000))

(assert (= (and b!1102988 (not c!109257)) b!1103001))

(assert (= (or b!1103000 b!1103001) bm!46264))

(assert (= (or b!1102999 bm!46264) bm!46262))

(assert (= (or b!1102999 b!1103000) bm!46263))

(assert (= (or b!1102992 bm!46262) bm!46265))

(assert (= (or b!1102992 bm!46263) bm!46266))

(assert (= (and d!131151 res!735596) b!1102994))

(assert (= (and d!131151 c!109255) b!1102991))

(assert (= (and d!131151 (not c!109255)) b!1102987))

(assert (= (and d!131151 res!735600) b!1102997))

(assert (= (and b!1102997 res!735603) b!1102993))

(assert (= (and b!1102997 (not res!735598)) b!1102985))

(assert (= (and b!1102985 res!735602) b!1103002))

(assert (= (and b!1102997 res!735599) b!1102995))

(assert (= (and b!1102995 c!109254) b!1103004))

(assert (= (and b!1102995 (not c!109254)) b!1102986))

(assert (= (and b!1103004 res!735595) b!1103003))

(assert (= (or b!1103004 b!1102986) bm!46260))

(assert (= (and b!1102995 res!735601) b!1102984))

(assert (= (and b!1102984 c!109253) b!1102998))

(assert (= (and b!1102984 (not c!109253)) b!1102996))

(assert (= (and b!1102998 res!735597) b!1102990))

(assert (= (or b!1102998 b!1102996) bm!46261))

(declare-fun b_lambda!18123 () Bool)

(assert (=> (not b_lambda!18123) (not b!1103002)))

(assert (=> b!1103002 t!34227))

(declare-fun b_and!37161 () Bool)

(assert (= b_and!37159 (and (=> t!34227 result!16611) b_and!37161)))

(declare-fun m!1023493 () Bool)

(assert (=> b!1102992 m!1023493))

(declare-fun m!1023495 () Bool)

(assert (=> b!1102994 m!1023495))

(assert (=> b!1102994 m!1023495))

(declare-fun m!1023497 () Bool)

(assert (=> b!1102994 m!1023497))

(declare-fun m!1023499 () Bool)

(assert (=> b!1102990 m!1023499))

(assert (=> b!1102985 m!1023495))

(assert (=> b!1102985 m!1023495))

(declare-fun m!1023501 () Bool)

(assert (=> b!1102985 m!1023501))

(assert (=> b!1103002 m!1023495))

(declare-fun m!1023503 () Bool)

(assert (=> b!1103002 m!1023503))

(declare-fun m!1023505 () Bool)

(assert (=> b!1103002 m!1023505))

(assert (=> b!1103002 m!1023327))

(declare-fun m!1023507 () Bool)

(assert (=> b!1103002 m!1023507))

(assert (=> b!1103002 m!1023495))

(assert (=> b!1103002 m!1023327))

(assert (=> b!1103002 m!1023505))

(assert (=> bm!46265 m!1023341))

(assert (=> b!1102993 m!1023495))

(assert (=> b!1102993 m!1023495))

(assert (=> b!1102993 m!1023497))

(declare-fun m!1023509 () Bool)

(assert (=> bm!46266 m!1023509))

(declare-fun m!1023511 () Bool)

(assert (=> bm!46260 m!1023511))

(declare-fun m!1023513 () Bool)

(assert (=> bm!46261 m!1023513))

(assert (=> d!131151 m!1023359))

(declare-fun m!1023515 () Bool)

(assert (=> b!1102991 m!1023515))

(declare-fun m!1023517 () Bool)

(assert (=> b!1102991 m!1023517))

(declare-fun m!1023519 () Bool)

(assert (=> b!1102991 m!1023519))

(declare-fun m!1023521 () Bool)

(assert (=> b!1102991 m!1023521))

(declare-fun m!1023523 () Bool)

(assert (=> b!1102991 m!1023523))

(declare-fun m!1023525 () Bool)

(assert (=> b!1102991 m!1023525))

(assert (=> b!1102991 m!1023517))

(declare-fun m!1023527 () Bool)

(assert (=> b!1102991 m!1023527))

(declare-fun m!1023529 () Bool)

(assert (=> b!1102991 m!1023529))

(assert (=> b!1102991 m!1023523))

(declare-fun m!1023531 () Bool)

(assert (=> b!1102991 m!1023531))

(declare-fun m!1023533 () Bool)

(assert (=> b!1102991 m!1023533))

(declare-fun m!1023535 () Bool)

(assert (=> b!1102991 m!1023535))

(assert (=> b!1102991 m!1023519))

(declare-fun m!1023537 () Bool)

(assert (=> b!1102991 m!1023537))

(declare-fun m!1023539 () Bool)

(assert (=> b!1102991 m!1023539))

(assert (=> b!1102991 m!1023529))

(declare-fun m!1023541 () Bool)

(assert (=> b!1102991 m!1023541))

(assert (=> b!1102991 m!1023341))

(assert (=> b!1102991 m!1023495))

(declare-fun m!1023543 () Bool)

(assert (=> b!1102991 m!1023543))

(declare-fun m!1023545 () Bool)

(assert (=> b!1103003 m!1023545))

(assert (=> b!1102809 d!131151))

(declare-fun bm!46267 () Bool)

(declare-fun call!46276 () Bool)

(declare-fun lt!494511 () ListLongMap!15375)

(assert (=> bm!46267 (= call!46276 (contains!6428 lt!494511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103005 () Bool)

(declare-fun e!629665 () Bool)

(declare-fun e!629672 () Bool)

(assert (=> b!1103005 (= e!629665 e!629672)))

(declare-fun c!109259 () Bool)

(assert (=> b!1103005 (= c!109259 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103006 () Bool)

(declare-fun e!629667 () Bool)

(declare-fun e!629666 () Bool)

(assert (=> b!1103006 (= e!629667 e!629666)))

(declare-fun res!735611 () Bool)

(assert (=> b!1103006 (=> (not res!735611) (not e!629666))))

(assert (=> b!1103006 (= res!735611 (contains!6428 lt!494511 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(assert (=> b!1103006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(declare-fun b!1103007 () Bool)

(declare-fun e!629673 () Bool)

(assert (=> b!1103007 (= e!629673 (not call!46276))))

(declare-fun b!1103008 () Bool)

(declare-fun e!629670 () Unit!36193)

(declare-fun Unit!36196 () Unit!36193)

(assert (=> b!1103008 (= e!629670 Unit!36196)))

(declare-fun b!1103010 () Bool)

(declare-fun e!629676 () ListLongMap!15375)

(declare-fun e!629669 () ListLongMap!15375)

(assert (=> b!1103010 (= e!629676 e!629669)))

(declare-fun c!109258 () Bool)

(assert (=> b!1103010 (= c!109258 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103011 () Bool)

(declare-fun e!629671 () Bool)

(assert (=> b!1103011 (= e!629671 (= (apply!961 lt!494511 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1103012 () Bool)

(declare-fun lt!494525 () Unit!36193)

(assert (=> b!1103012 (= e!629670 lt!494525)))

(declare-fun lt!494526 () ListLongMap!15375)

(assert (=> b!1103012 (= lt!494526 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494513 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494523 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494523 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(declare-fun lt!494522 () Unit!36193)

(assert (=> b!1103012 (= lt!494522 (addStillContains!665 lt!494526 lt!494513 zeroValue!831 lt!494523))))

(assert (=> b!1103012 (contains!6428 (+!3431 lt!494526 (tuple2!17399 lt!494513 zeroValue!831)) lt!494523)))

(declare-fun lt!494515 () Unit!36193)

(assert (=> b!1103012 (= lt!494515 lt!494522)))

(declare-fun lt!494520 () ListLongMap!15375)

(assert (=> b!1103012 (= lt!494520 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494521 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494528 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494528 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(declare-fun lt!494516 () Unit!36193)

(assert (=> b!1103012 (= lt!494516 (addApplyDifferent!521 lt!494520 lt!494521 minValue!831 lt!494528))))

(assert (=> b!1103012 (= (apply!961 (+!3431 lt!494520 (tuple2!17399 lt!494521 minValue!831)) lt!494528) (apply!961 lt!494520 lt!494528))))

(declare-fun lt!494518 () Unit!36193)

(assert (=> b!1103012 (= lt!494518 lt!494516)))

(declare-fun lt!494524 () ListLongMap!15375)

(assert (=> b!1103012 (= lt!494524 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494532 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494527 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494527 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(declare-fun lt!494512 () Unit!36193)

(assert (=> b!1103012 (= lt!494512 (addApplyDifferent!521 lt!494524 lt!494532 zeroValue!831 lt!494527))))

(assert (=> b!1103012 (= (apply!961 (+!3431 lt!494524 (tuple2!17399 lt!494532 zeroValue!831)) lt!494527) (apply!961 lt!494524 lt!494527))))

(declare-fun lt!494517 () Unit!36193)

(assert (=> b!1103012 (= lt!494517 lt!494512)))

(declare-fun lt!494529 () ListLongMap!15375)

(assert (=> b!1103012 (= lt!494529 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494514 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494531 () (_ BitVec 64))

(assert (=> b!1103012 (= lt!494531 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(assert (=> b!1103012 (= lt!494525 (addApplyDifferent!521 lt!494529 lt!494514 minValue!831 lt!494531))))

(assert (=> b!1103012 (= (apply!961 (+!3431 lt!494529 (tuple2!17399 lt!494514 minValue!831)) lt!494531) (apply!961 lt!494529 lt!494531))))

(declare-fun b!1103013 () Bool)

(declare-fun call!46272 () ListLongMap!15375)

(assert (=> b!1103013 (= e!629676 (+!3431 call!46272 (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1103014 () Bool)

(declare-fun e!629664 () Bool)

(assert (=> b!1103014 (= e!629664 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun b!1103015 () Bool)

(declare-fun e!629675 () Bool)

(assert (=> b!1103015 (= e!629675 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun bm!46268 () Bool)

(declare-fun call!46273 () Bool)

(assert (=> bm!46268 (= call!46273 (contains!6428 lt!494511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46269 () Bool)

(declare-fun call!46270 () ListLongMap!15375)

(declare-fun call!46275 () ListLongMap!15375)

(assert (=> bm!46269 (= call!46270 call!46275)))

(declare-fun bm!46270 () Bool)

(declare-fun call!46274 () ListLongMap!15375)

(assert (=> bm!46270 (= call!46274 call!46272)))

(declare-fun b!1103016 () Bool)

(declare-fun res!735610 () Bool)

(assert (=> b!1103016 (=> (not res!735610) (not e!629665))))

(assert (=> b!1103016 (= res!735610 e!629673)))

(declare-fun c!109260 () Bool)

(assert (=> b!1103016 (= c!109260 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1103017 () Bool)

(assert (=> b!1103017 (= e!629672 (not call!46273))))

(declare-fun b!1103018 () Bool)

(declare-fun res!735608 () Bool)

(assert (=> b!1103018 (=> (not res!735608) (not e!629665))))

(assert (=> b!1103018 (= res!735608 e!629667)))

(declare-fun res!735607 () Bool)

(assert (=> b!1103018 (=> res!735607 e!629667)))

(assert (=> b!1103018 (= res!735607 (not e!629664))))

(declare-fun res!735612 () Bool)

(assert (=> b!1103018 (=> (not res!735612) (not e!629664))))

(assert (=> b!1103018 (= res!735612 (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(declare-fun d!131153 () Bool)

(assert (=> d!131153 e!629665))

(declare-fun res!735609 () Bool)

(assert (=> d!131153 (=> (not res!735609) (not e!629665))))

(assert (=> d!131153 (= res!735609 (or (bvsge #b00000000000000000000000000000000 (size!34896 lt!494358)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))))

(declare-fun lt!494519 () ListLongMap!15375)

(assert (=> d!131153 (= lt!494511 lt!494519)))

(declare-fun lt!494530 () Unit!36193)

(assert (=> d!131153 (= lt!494530 e!629670)))

(declare-fun c!109261 () Bool)

(assert (=> d!131153 (= c!109261 e!629675)))

(declare-fun res!735605 () Bool)

(assert (=> d!131153 (=> (not res!735605) (not e!629675))))

(assert (=> d!131153 (= res!735605 (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (=> d!131153 (= lt!494519 e!629676)))

(declare-fun c!109262 () Bool)

(assert (=> d!131153 (= c!109262 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131153 (validMask!0 mask!1414)))

(assert (=> d!131153 (= (getCurrentListMap!4404 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494511)))

(declare-fun b!1103009 () Bool)

(declare-fun c!109263 () Bool)

(assert (=> b!1103009 (= c!109263 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629674 () ListLongMap!15375)

(assert (=> b!1103009 (= e!629669 e!629674)))

(declare-fun b!1103019 () Bool)

(assert (=> b!1103019 (= e!629672 e!629671)))

(declare-fun res!735606 () Bool)

(assert (=> b!1103019 (= res!735606 call!46273)))

(assert (=> b!1103019 (=> (not res!735606) (not e!629671))))

(declare-fun bm!46271 () Bool)

(declare-fun call!46271 () ListLongMap!15375)

(assert (=> bm!46271 (= call!46271 call!46270)))

(declare-fun b!1103020 () Bool)

(assert (=> b!1103020 (= e!629669 call!46274)))

(declare-fun b!1103021 () Bool)

(assert (=> b!1103021 (= e!629674 call!46274)))

(declare-fun bm!46272 () Bool)

(assert (=> bm!46272 (= call!46275 (getCurrentListMapNoExtraKeys!4245 lt!494358 lt!494362 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1103022 () Bool)

(assert (=> b!1103022 (= e!629674 call!46271)))

(declare-fun bm!46273 () Bool)

(assert (=> bm!46273 (= call!46272 (+!3431 (ite c!109262 call!46275 (ite c!109258 call!46270 call!46271)) (ite (or c!109262 c!109258) (tuple2!17399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1103023 () Bool)

(assert (=> b!1103023 (= e!629666 (= (apply!961 lt!494511 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)) (get!17685 (select (arr!34358 lt!494362) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34895 lt!494362)))))

(assert (=> b!1103023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(declare-fun b!1103024 () Bool)

(declare-fun e!629668 () Bool)

(assert (=> b!1103024 (= e!629668 (= (apply!961 lt!494511 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1103025 () Bool)

(assert (=> b!1103025 (= e!629673 e!629668)))

(declare-fun res!735604 () Bool)

(assert (=> b!1103025 (= res!735604 call!46276)))

(assert (=> b!1103025 (=> (not res!735604) (not e!629668))))

(assert (= (and d!131153 c!109262) b!1103013))

(assert (= (and d!131153 (not c!109262)) b!1103010))

(assert (= (and b!1103010 c!109258) b!1103020))

(assert (= (and b!1103010 (not c!109258)) b!1103009))

(assert (= (and b!1103009 c!109263) b!1103021))

(assert (= (and b!1103009 (not c!109263)) b!1103022))

(assert (= (or b!1103021 b!1103022) bm!46271))

(assert (= (or b!1103020 bm!46271) bm!46269))

(assert (= (or b!1103020 b!1103021) bm!46270))

(assert (= (or b!1103013 bm!46269) bm!46272))

(assert (= (or b!1103013 bm!46270) bm!46273))

(assert (= (and d!131153 res!735605) b!1103015))

(assert (= (and d!131153 c!109261) b!1103012))

(assert (= (and d!131153 (not c!109261)) b!1103008))

(assert (= (and d!131153 res!735609) b!1103018))

(assert (= (and b!1103018 res!735612) b!1103014))

(assert (= (and b!1103018 (not res!735607)) b!1103006))

(assert (= (and b!1103006 res!735611) b!1103023))

(assert (= (and b!1103018 res!735608) b!1103016))

(assert (= (and b!1103016 c!109260) b!1103025))

(assert (= (and b!1103016 (not c!109260)) b!1103007))

(assert (= (and b!1103025 res!735604) b!1103024))

(assert (= (or b!1103025 b!1103007) bm!46267))

(assert (= (and b!1103016 res!735610) b!1103005))

(assert (= (and b!1103005 c!109259) b!1103019))

(assert (= (and b!1103005 (not c!109259)) b!1103017))

(assert (= (and b!1103019 res!735606) b!1103011))

(assert (= (or b!1103019 b!1103017) bm!46268))

(declare-fun b_lambda!18125 () Bool)

(assert (=> (not b_lambda!18125) (not b!1103023)))

(assert (=> b!1103023 t!34227))

(declare-fun b_and!37163 () Bool)

(assert (= b_and!37161 (and (=> t!34227 result!16611) b_and!37163)))

(declare-fun m!1023547 () Bool)

(assert (=> b!1103013 m!1023547))

(assert (=> b!1103015 m!1023469))

(assert (=> b!1103015 m!1023469))

(assert (=> b!1103015 m!1023471))

(declare-fun m!1023549 () Bool)

(assert (=> b!1103011 m!1023549))

(assert (=> b!1103006 m!1023469))

(assert (=> b!1103006 m!1023469))

(declare-fun m!1023551 () Bool)

(assert (=> b!1103006 m!1023551))

(assert (=> b!1103023 m!1023469))

(declare-fun m!1023553 () Bool)

(assert (=> b!1103023 m!1023553))

(assert (=> b!1103023 m!1023481))

(assert (=> b!1103023 m!1023327))

(assert (=> b!1103023 m!1023483))

(assert (=> b!1103023 m!1023469))

(assert (=> b!1103023 m!1023327))

(assert (=> b!1103023 m!1023481))

(assert (=> bm!46272 m!1023337))

(assert (=> b!1103014 m!1023469))

(assert (=> b!1103014 m!1023469))

(assert (=> b!1103014 m!1023471))

(declare-fun m!1023555 () Bool)

(assert (=> bm!46273 m!1023555))

(declare-fun m!1023557 () Bool)

(assert (=> bm!46267 m!1023557))

(declare-fun m!1023559 () Bool)

(assert (=> bm!46268 m!1023559))

(assert (=> d!131153 m!1023359))

(declare-fun m!1023561 () Bool)

(assert (=> b!1103012 m!1023561))

(declare-fun m!1023563 () Bool)

(assert (=> b!1103012 m!1023563))

(declare-fun m!1023565 () Bool)

(assert (=> b!1103012 m!1023565))

(declare-fun m!1023567 () Bool)

(assert (=> b!1103012 m!1023567))

(declare-fun m!1023569 () Bool)

(assert (=> b!1103012 m!1023569))

(declare-fun m!1023571 () Bool)

(assert (=> b!1103012 m!1023571))

(assert (=> b!1103012 m!1023563))

(declare-fun m!1023573 () Bool)

(assert (=> b!1103012 m!1023573))

(declare-fun m!1023575 () Bool)

(assert (=> b!1103012 m!1023575))

(assert (=> b!1103012 m!1023569))

(declare-fun m!1023577 () Bool)

(assert (=> b!1103012 m!1023577))

(declare-fun m!1023579 () Bool)

(assert (=> b!1103012 m!1023579))

(declare-fun m!1023581 () Bool)

(assert (=> b!1103012 m!1023581))

(assert (=> b!1103012 m!1023565))

(declare-fun m!1023583 () Bool)

(assert (=> b!1103012 m!1023583))

(declare-fun m!1023585 () Bool)

(assert (=> b!1103012 m!1023585))

(assert (=> b!1103012 m!1023575))

(declare-fun m!1023587 () Bool)

(assert (=> b!1103012 m!1023587))

(assert (=> b!1103012 m!1023337))

(assert (=> b!1103012 m!1023469))

(declare-fun m!1023589 () Bool)

(assert (=> b!1103012 m!1023589))

(declare-fun m!1023591 () Bool)

(assert (=> b!1103024 m!1023591))

(assert (=> b!1102809 d!131153))

(declare-fun d!131155 () Bool)

(declare-fun e!629681 () Bool)

(assert (=> d!131155 e!629681))

(declare-fun res!735615 () Bool)

(assert (=> d!131155 (=> (not res!735615) (not e!629681))))

(assert (=> d!131155 (= res!735615 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34896 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34896 _keys!1070))))))))

(declare-fun lt!494535 () Unit!36193)

(declare-fun choose!1776 (array!71405 array!71403 (_ BitVec 32) (_ BitVec 32) V!41425 V!41425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36193)

(assert (=> d!131155 (= lt!494535 (choose!1776 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> d!131155 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494535)))

(declare-fun e!629682 () Bool)

(declare-fun b!1103032 () Bool)

(declare-fun call!46281 () ListLongMap!15375)

(declare-fun call!46282 () ListLongMap!15375)

(assert (=> b!1103032 (= e!629682 (= call!46282 (-!968 call!46281 k0!904)))))

(assert (=> b!1103032 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34895 _values!874)))))

(declare-fun b!1103033 () Bool)

(assert (=> b!1103033 (= e!629681 e!629682)))

(declare-fun c!109266 () Bool)

(assert (=> b!1103033 (= c!109266 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!46278 () Bool)

(assert (=> bm!46278 (= call!46281 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46279 () Bool)

(assert (=> bm!46279 (= call!46282 (getCurrentListMapNoExtraKeys!4245 (array!71406 (store (arr!34359 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34896 _keys!1070)) (array!71404 (store (arr!34358 _values!874) i!650 (ValueCellFull!12902 (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34895 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1103034 () Bool)

(assert (=> b!1103034 (= e!629682 (= call!46282 call!46281))))

(assert (=> b!1103034 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34895 _values!874)))))

(assert (= (and d!131155 res!735615) b!1103033))

(assert (= (and b!1103033 c!109266) b!1103032))

(assert (= (and b!1103033 (not c!109266)) b!1103034))

(assert (= (or b!1103032 b!1103034) bm!46278))

(assert (= (or b!1103032 b!1103034) bm!46279))

(declare-fun b_lambda!18127 () Bool)

(assert (=> (not b_lambda!18127) (not bm!46279)))

(assert (=> bm!46279 t!34227))

(declare-fun b_and!37165 () Bool)

(assert (= b_and!37163 (and (=> t!34227 result!16611) b_and!37165)))

(declare-fun m!1023593 () Bool)

(assert (=> d!131155 m!1023593))

(declare-fun m!1023595 () Bool)

(assert (=> b!1103032 m!1023595))

(assert (=> bm!46278 m!1023341))

(assert (=> bm!46279 m!1023349))

(assert (=> bm!46279 m!1023327))

(assert (=> bm!46279 m!1023333))

(declare-fun m!1023597 () Bool)

(assert (=> bm!46279 m!1023597))

(assert (=> b!1102809 d!131155))

(declare-fun d!131157 () Bool)

(declare-fun lt!494538 () ListLongMap!15375)

(assert (=> d!131157 (not (contains!6428 lt!494538 k0!904))))

(declare-fun removeStrictlySorted!85 (List!24017 (_ BitVec 64)) List!24017)

(assert (=> d!131157 (= lt!494538 (ListLongMap!15376 (removeStrictlySorted!85 (toList!7703 lt!494361) k0!904)))))

(assert (=> d!131157 (= (-!968 lt!494361 k0!904) lt!494538)))

(declare-fun bs!32348 () Bool)

(assert (= bs!32348 d!131157))

(declare-fun m!1023599 () Bool)

(assert (=> bs!32348 m!1023599))

(declare-fun m!1023601 () Bool)

(assert (=> bs!32348 m!1023601))

(assert (=> b!1102809 d!131157))

(declare-fun d!131159 () Bool)

(declare-fun res!735620 () Bool)

(declare-fun e!629687 () Bool)

(assert (=> d!131159 (=> res!735620 e!629687)))

(assert (=> d!131159 (= res!735620 (= (select (arr!34359 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131159 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629687)))

(declare-fun b!1103039 () Bool)

(declare-fun e!629688 () Bool)

(assert (=> b!1103039 (= e!629687 e!629688)))

(declare-fun res!735621 () Bool)

(assert (=> b!1103039 (=> (not res!735621) (not e!629688))))

(assert (=> b!1103039 (= res!735621 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34896 _keys!1070)))))

(declare-fun b!1103040 () Bool)

(assert (=> b!1103040 (= e!629688 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131159 (not res!735620)) b!1103039))

(assert (= (and b!1103039 res!735621) b!1103040))

(assert (=> d!131159 m!1023495))

(declare-fun m!1023603 () Bool)

(assert (=> b!1103040 m!1023603))

(assert (=> b!1102809 d!131159))

(declare-fun b!1103041 () Bool)

(declare-fun e!629689 () Bool)

(declare-fun e!629690 () Bool)

(assert (=> b!1103041 (= e!629689 e!629690)))

(assert (=> b!1103041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(declare-fun res!735625 () Bool)

(declare-fun lt!494539 () ListLongMap!15375)

(assert (=> b!1103041 (= res!735625 (contains!6428 lt!494539 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103041 (=> (not res!735625) (not e!629690))))

(declare-fun b!1103042 () Bool)

(assert (=> b!1103042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> b!1103042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34895 _values!874)))))

(assert (=> b!1103042 (= e!629690 (= (apply!961 lt!494539 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)) (get!17685 (select (arr!34358 _values!874) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1103043 () Bool)

(declare-fun e!629694 () ListLongMap!15375)

(declare-fun e!629693 () ListLongMap!15375)

(assert (=> b!1103043 (= e!629694 e!629693)))

(declare-fun c!109268 () Bool)

(assert (=> b!1103043 (= c!109268 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103044 () Bool)

(declare-fun e!629692 () Bool)

(assert (=> b!1103044 (= e!629692 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103044 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1103045 () Bool)

(declare-fun call!46283 () ListLongMap!15375)

(assert (=> b!1103045 (= e!629693 call!46283)))

(declare-fun b!1103046 () Bool)

(declare-fun e!629691 () Bool)

(assert (=> b!1103046 (= e!629691 (isEmpty!974 lt!494539))))

(declare-fun b!1103047 () Bool)

(assert (=> b!1103047 (= e!629689 e!629691)))

(declare-fun c!109267 () Bool)

(assert (=> b!1103047 (= c!109267 (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(declare-fun b!1103048 () Bool)

(declare-fun lt!494544 () Unit!36193)

(declare-fun lt!494541 () Unit!36193)

(assert (=> b!1103048 (= lt!494544 lt!494541)))

(declare-fun lt!494543 () V!41425)

(declare-fun lt!494545 () (_ BitVec 64))

(declare-fun lt!494540 () ListLongMap!15375)

(declare-fun lt!494542 () (_ BitVec 64))

(assert (=> b!1103048 (not (contains!6428 (+!3431 lt!494540 (tuple2!17399 lt!494545 lt!494543)) lt!494542))))

(assert (=> b!1103048 (= lt!494541 (addStillNotContains!282 lt!494540 lt!494545 lt!494543 lt!494542))))

(assert (=> b!1103048 (= lt!494542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1103048 (= lt!494543 (get!17685 (select (arr!34358 _values!874) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1103048 (= lt!494545 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1103048 (= lt!494540 call!46283)))

(assert (=> b!1103048 (= e!629693 (+!3431 call!46283 (tuple2!17399 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000) (get!17685 (select (arr!34358 _values!874) #b00000000000000000000000000000000) (dynLambda!2363 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1103049 () Bool)

(assert (=> b!1103049 (= e!629694 (ListLongMap!15376 Nil!24014))))

(declare-fun b!1103050 () Bool)

(declare-fun res!735622 () Bool)

(declare-fun e!629695 () Bool)

(assert (=> b!1103050 (=> (not res!735622) (not e!629695))))

(assert (=> b!1103050 (= res!735622 (not (contains!6428 lt!494539 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!131161 () Bool)

(assert (=> d!131161 e!629695))

(declare-fun res!735624 () Bool)

(assert (=> d!131161 (=> (not res!735624) (not e!629695))))

(assert (=> d!131161 (= res!735624 (not (contains!6428 lt!494539 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131161 (= lt!494539 e!629694)))

(declare-fun c!109269 () Bool)

(assert (=> d!131161 (= c!109269 (bvsge #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> d!131161 (validMask!0 mask!1414)))

(assert (=> d!131161 (= (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494539)))

(declare-fun bm!46280 () Bool)

(assert (=> bm!46280 (= call!46283 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1103051 () Bool)

(assert (=> b!1103051 (= e!629691 (= lt!494539 (getCurrentListMapNoExtraKeys!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1103052 () Bool)

(assert (=> b!1103052 (= e!629695 e!629689)))

(declare-fun c!109270 () Bool)

(assert (=> b!1103052 (= c!109270 e!629692)))

(declare-fun res!735623 () Bool)

(assert (=> b!1103052 (=> (not res!735623) (not e!629692))))

(assert (=> b!1103052 (= res!735623 (bvslt #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (= (and d!131161 c!109269) b!1103049))

(assert (= (and d!131161 (not c!109269)) b!1103043))

(assert (= (and b!1103043 c!109268) b!1103048))

(assert (= (and b!1103043 (not c!109268)) b!1103045))

(assert (= (or b!1103048 b!1103045) bm!46280))

(assert (= (and d!131161 res!735624) b!1103050))

(assert (= (and b!1103050 res!735622) b!1103052))

(assert (= (and b!1103052 res!735623) b!1103044))

(assert (= (and b!1103052 c!109270) b!1103041))

(assert (= (and b!1103052 (not c!109270)) b!1103047))

(assert (= (and b!1103041 res!735625) b!1103042))

(assert (= (and b!1103047 c!109267) b!1103051))

(assert (= (and b!1103047 (not c!109267)) b!1103046))

(declare-fun b_lambda!18129 () Bool)

(assert (=> (not b_lambda!18129) (not b!1103042)))

(assert (=> b!1103042 t!34227))

(declare-fun b_and!37167 () Bool)

(assert (= b_and!37165 (and (=> t!34227 result!16611) b_and!37167)))

(declare-fun b_lambda!18131 () Bool)

(assert (=> (not b_lambda!18131) (not b!1103048)))

(assert (=> b!1103048 t!34227))

(declare-fun b_and!37169 () Bool)

(assert (= b_and!37167 (and (=> t!34227 result!16611) b_and!37169)))

(declare-fun m!1023605 () Bool)

(assert (=> b!1103051 m!1023605))

(declare-fun m!1023607 () Bool)

(assert (=> d!131161 m!1023607))

(assert (=> d!131161 m!1023359))

(assert (=> b!1103043 m!1023495))

(assert (=> b!1103043 m!1023495))

(assert (=> b!1103043 m!1023497))

(assert (=> bm!46280 m!1023605))

(assert (=> b!1103041 m!1023495))

(assert (=> b!1103041 m!1023495))

(declare-fun m!1023609 () Bool)

(assert (=> b!1103041 m!1023609))

(assert (=> b!1103044 m!1023495))

(assert (=> b!1103044 m!1023495))

(assert (=> b!1103044 m!1023497))

(declare-fun m!1023611 () Bool)

(assert (=> b!1103050 m!1023611))

(declare-fun m!1023613 () Bool)

(assert (=> b!1103048 m!1023613))

(declare-fun m!1023615 () Bool)

(assert (=> b!1103048 m!1023615))

(assert (=> b!1103048 m!1023505))

(assert (=> b!1103048 m!1023327))

(assert (=> b!1103048 m!1023507))

(assert (=> b!1103048 m!1023327))

(declare-fun m!1023617 () Bool)

(assert (=> b!1103048 m!1023617))

(assert (=> b!1103048 m!1023615))

(declare-fun m!1023619 () Bool)

(assert (=> b!1103048 m!1023619))

(assert (=> b!1103048 m!1023495))

(assert (=> b!1103048 m!1023505))

(assert (=> b!1103042 m!1023327))

(assert (=> b!1103042 m!1023505))

(assert (=> b!1103042 m!1023327))

(assert (=> b!1103042 m!1023507))

(assert (=> b!1103042 m!1023495))

(declare-fun m!1023621 () Bool)

(assert (=> b!1103042 m!1023621))

(assert (=> b!1103042 m!1023495))

(assert (=> b!1103042 m!1023505))

(declare-fun m!1023623 () Bool)

(assert (=> b!1103046 m!1023623))

(assert (=> b!1102809 d!131161))

(declare-fun d!131163 () Bool)

(assert (=> d!131163 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494548 () Unit!36193)

(declare-fun choose!13 (array!71405 (_ BitVec 64) (_ BitVec 32)) Unit!36193)

(assert (=> d!131163 (= lt!494548 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131163 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131163 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494548)))

(declare-fun bs!32349 () Bool)

(assert (= bs!32349 d!131163))

(assert (=> bs!32349 m!1023335))

(declare-fun m!1023625 () Bool)

(assert (=> bs!32349 m!1023625))

(assert (=> b!1102809 d!131163))

(declare-fun d!131165 () Bool)

(declare-fun e!629698 () Bool)

(assert (=> d!131165 e!629698))

(declare-fun res!735631 () Bool)

(assert (=> d!131165 (=> (not res!735631) (not e!629698))))

(declare-fun lt!494559 () ListLongMap!15375)

(assert (=> d!131165 (= res!735631 (contains!6428 lt!494559 (_1!8710 lt!494356)))))

(declare-fun lt!494557 () List!24017)

(assert (=> d!131165 (= lt!494559 (ListLongMap!15376 lt!494557))))

(declare-fun lt!494558 () Unit!36193)

(declare-fun lt!494560 () Unit!36193)

(assert (=> d!131165 (= lt!494558 lt!494560)))

(declare-datatypes ((Option!674 0))(
  ( (Some!673 (v!16297 V!41425)) (None!672) )
))
(declare-fun getValueByKey!623 (List!24017 (_ BitVec 64)) Option!674)

(assert (=> d!131165 (= (getValueByKey!623 lt!494557 (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356)))))

(declare-fun lemmaContainsTupThenGetReturnValue!305 (List!24017 (_ BitVec 64) V!41425) Unit!36193)

(assert (=> d!131165 (= lt!494560 (lemmaContainsTupThenGetReturnValue!305 lt!494557 (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(declare-fun insertStrictlySorted!398 (List!24017 (_ BitVec 64) V!41425) List!24017)

(assert (=> d!131165 (= lt!494557 (insertStrictlySorted!398 (toList!7703 lt!494355) (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(assert (=> d!131165 (= (+!3431 lt!494355 lt!494356) lt!494559)))

(declare-fun b!1103057 () Bool)

(declare-fun res!735630 () Bool)

(assert (=> b!1103057 (=> (not res!735630) (not e!629698))))

(assert (=> b!1103057 (= res!735630 (= (getValueByKey!623 (toList!7703 lt!494559) (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356))))))

(declare-fun b!1103058 () Bool)

(declare-fun contains!6429 (List!24017 tuple2!17398) Bool)

(assert (=> b!1103058 (= e!629698 (contains!6429 (toList!7703 lt!494559) lt!494356))))

(assert (= (and d!131165 res!735631) b!1103057))

(assert (= (and b!1103057 res!735630) b!1103058))

(declare-fun m!1023627 () Bool)

(assert (=> d!131165 m!1023627))

(declare-fun m!1023629 () Bool)

(assert (=> d!131165 m!1023629))

(declare-fun m!1023631 () Bool)

(assert (=> d!131165 m!1023631))

(declare-fun m!1023633 () Bool)

(assert (=> d!131165 m!1023633))

(declare-fun m!1023635 () Bool)

(assert (=> b!1103057 m!1023635))

(declare-fun m!1023637 () Bool)

(assert (=> b!1103058 m!1023637))

(assert (=> b!1102808 d!131165))

(declare-fun b!1103069 () Bool)

(declare-fun e!629708 () Bool)

(declare-fun contains!6430 (List!24018 (_ BitVec 64)) Bool)

(assert (=> b!1103069 (= e!629708 (contains!6430 Nil!24015 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun b!1103070 () Bool)

(declare-fun e!629709 () Bool)

(declare-fun call!46286 () Bool)

(assert (=> b!1103070 (= e!629709 call!46286)))

(declare-fun bm!46283 () Bool)

(declare-fun c!109273 () Bool)

(assert (=> bm!46283 (= call!46286 (arrayNoDuplicates!0 lt!494358 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109273 (Cons!24014 (select (arr!34359 lt!494358) #b00000000000000000000000000000000) Nil!24015) Nil!24015)))))

(declare-fun b!1103072 () Bool)

(declare-fun e!629707 () Bool)

(assert (=> b!1103072 (= e!629707 e!629709)))

(assert (=> b!1103072 (= c!109273 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun b!1103073 () Bool)

(assert (=> b!1103073 (= e!629709 call!46286)))

(declare-fun b!1103071 () Bool)

(declare-fun e!629710 () Bool)

(assert (=> b!1103071 (= e!629710 e!629707)))

(declare-fun res!735638 () Bool)

(assert (=> b!1103071 (=> (not res!735638) (not e!629707))))

(assert (=> b!1103071 (= res!735638 (not e!629708))))

(declare-fun res!735640 () Bool)

(assert (=> b!1103071 (=> (not res!735640) (not e!629708))))

(assert (=> b!1103071 (= res!735640 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun d!131167 () Bool)

(declare-fun res!735639 () Bool)

(assert (=> d!131167 (=> res!735639 e!629710)))

(assert (=> d!131167 (= res!735639 (bvsge #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (=> d!131167 (= (arrayNoDuplicates!0 lt!494358 #b00000000000000000000000000000000 Nil!24015) e!629710)))

(assert (= (and d!131167 (not res!735639)) b!1103071))

(assert (= (and b!1103071 res!735640) b!1103069))

(assert (= (and b!1103071 res!735638) b!1103072))

(assert (= (and b!1103072 c!109273) b!1103073))

(assert (= (and b!1103072 (not c!109273)) b!1103070))

(assert (= (or b!1103073 b!1103070) bm!46283))

(assert (=> b!1103069 m!1023469))

(assert (=> b!1103069 m!1023469))

(declare-fun m!1023639 () Bool)

(assert (=> b!1103069 m!1023639))

(assert (=> bm!46283 m!1023469))

(declare-fun m!1023641 () Bool)

(assert (=> bm!46283 m!1023641))

(assert (=> b!1103072 m!1023469))

(assert (=> b!1103072 m!1023469))

(assert (=> b!1103072 m!1023471))

(assert (=> b!1103071 m!1023469))

(assert (=> b!1103071 m!1023469))

(assert (=> b!1103071 m!1023471))

(assert (=> b!1102803 d!131167))

(declare-fun d!131169 () Bool)

(declare-fun e!629711 () Bool)

(assert (=> d!131169 e!629711))

(declare-fun res!735642 () Bool)

(assert (=> d!131169 (=> (not res!735642) (not e!629711))))

(declare-fun lt!494563 () ListLongMap!15375)

(assert (=> d!131169 (= res!735642 (contains!6428 lt!494563 (_1!8710 lt!494356)))))

(declare-fun lt!494561 () List!24017)

(assert (=> d!131169 (= lt!494563 (ListLongMap!15376 lt!494561))))

(declare-fun lt!494562 () Unit!36193)

(declare-fun lt!494564 () Unit!36193)

(assert (=> d!131169 (= lt!494562 lt!494564)))

(assert (=> d!131169 (= (getValueByKey!623 lt!494561 (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356)))))

(assert (=> d!131169 (= lt!494564 (lemmaContainsTupThenGetReturnValue!305 lt!494561 (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(assert (=> d!131169 (= lt!494561 (insertStrictlySorted!398 (toList!7703 lt!494361) (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(assert (=> d!131169 (= (+!3431 lt!494361 lt!494356) lt!494563)))

(declare-fun b!1103074 () Bool)

(declare-fun res!735641 () Bool)

(assert (=> b!1103074 (=> (not res!735641) (not e!629711))))

(assert (=> b!1103074 (= res!735641 (= (getValueByKey!623 (toList!7703 lt!494563) (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356))))))

(declare-fun b!1103075 () Bool)

(assert (=> b!1103075 (= e!629711 (contains!6429 (toList!7703 lt!494563) lt!494356))))

(assert (= (and d!131169 res!735642) b!1103074))

(assert (= (and b!1103074 res!735641) b!1103075))

(declare-fun m!1023643 () Bool)

(assert (=> d!131169 m!1023643))

(declare-fun m!1023645 () Bool)

(assert (=> d!131169 m!1023645))

(declare-fun m!1023647 () Bool)

(assert (=> d!131169 m!1023647))

(declare-fun m!1023649 () Bool)

(assert (=> d!131169 m!1023649))

(declare-fun m!1023651 () Bool)

(assert (=> b!1103074 m!1023651))

(declare-fun m!1023653 () Bool)

(assert (=> b!1103075 m!1023653))

(assert (=> b!1102795 d!131169))

(declare-fun b!1103084 () Bool)

(declare-fun e!629718 () Bool)

(declare-fun call!46289 () Bool)

(assert (=> b!1103084 (= e!629718 call!46289)))

(declare-fun d!131171 () Bool)

(declare-fun res!735647 () Bool)

(declare-fun e!629719 () Bool)

(assert (=> d!131171 (=> res!735647 e!629719)))

(assert (=> d!131171 (= res!735647 (bvsge #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> d!131171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629719)))

(declare-fun b!1103085 () Bool)

(declare-fun e!629720 () Bool)

(assert (=> b!1103085 (= e!629719 e!629720)))

(declare-fun c!109276 () Bool)

(assert (=> b!1103085 (= c!109276 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103086 () Bool)

(assert (=> b!1103086 (= e!629720 e!629718)))

(declare-fun lt!494573 () (_ BitVec 64))

(assert (=> b!1103086 (= lt!494573 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494572 () Unit!36193)

(assert (=> b!1103086 (= lt!494572 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494573 #b00000000000000000000000000000000))))

(assert (=> b!1103086 (arrayContainsKey!0 _keys!1070 lt!494573 #b00000000000000000000000000000000)))

(declare-fun lt!494571 () Unit!36193)

(assert (=> b!1103086 (= lt!494571 lt!494572)))

(declare-fun res!735648 () Bool)

(declare-datatypes ((SeekEntryResult!9871 0))(
  ( (MissingZero!9871 (index!41855 (_ BitVec 32))) (Found!9871 (index!41856 (_ BitVec 32))) (Intermediate!9871 (undefined!10683 Bool) (index!41857 (_ BitVec 32)) (x!99048 (_ BitVec 32))) (Undefined!9871) (MissingVacant!9871 (index!41858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71405 (_ BitVec 32)) SeekEntryResult!9871)

(assert (=> b!1103086 (= res!735648 (= (seekEntryOrOpen!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9871 #b00000000000000000000000000000000)))))

(assert (=> b!1103086 (=> (not res!735648) (not e!629718))))

(declare-fun b!1103087 () Bool)

(assert (=> b!1103087 (= e!629720 call!46289)))

(declare-fun bm!46286 () Bool)

(assert (=> bm!46286 (= call!46289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!131171 (not res!735647)) b!1103085))

(assert (= (and b!1103085 c!109276) b!1103086))

(assert (= (and b!1103085 (not c!109276)) b!1103087))

(assert (= (and b!1103086 res!735648) b!1103084))

(assert (= (or b!1103084 b!1103087) bm!46286))

(assert (=> b!1103085 m!1023495))

(assert (=> b!1103085 m!1023495))

(assert (=> b!1103085 m!1023497))

(assert (=> b!1103086 m!1023495))

(declare-fun m!1023655 () Bool)

(assert (=> b!1103086 m!1023655))

(declare-fun m!1023657 () Bool)

(assert (=> b!1103086 m!1023657))

(assert (=> b!1103086 m!1023495))

(declare-fun m!1023659 () Bool)

(assert (=> b!1103086 m!1023659))

(declare-fun m!1023661 () Bool)

(assert (=> bm!46286 m!1023661))

(assert (=> b!1102799 d!131171))

(declare-fun d!131173 () Bool)

(declare-fun e!629721 () Bool)

(assert (=> d!131173 e!629721))

(declare-fun res!735650 () Bool)

(assert (=> d!131173 (=> (not res!735650) (not e!629721))))

(declare-fun lt!494576 () ListLongMap!15375)

(assert (=> d!131173 (= res!735650 (contains!6428 lt!494576 (_1!8710 lt!494356)))))

(declare-fun lt!494574 () List!24017)

(assert (=> d!131173 (= lt!494576 (ListLongMap!15376 lt!494574))))

(declare-fun lt!494575 () Unit!36193)

(declare-fun lt!494577 () Unit!36193)

(assert (=> d!131173 (= lt!494575 lt!494577)))

(assert (=> d!131173 (= (getValueByKey!623 lt!494574 (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356)))))

(assert (=> d!131173 (= lt!494577 (lemmaContainsTupThenGetReturnValue!305 lt!494574 (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(assert (=> d!131173 (= lt!494574 (insertStrictlySorted!398 (toList!7703 lt!494360) (_1!8710 lt!494356) (_2!8710 lt!494356)))))

(assert (=> d!131173 (= (+!3431 lt!494360 lt!494356) lt!494576)))

(declare-fun b!1103088 () Bool)

(declare-fun res!735649 () Bool)

(assert (=> b!1103088 (=> (not res!735649) (not e!629721))))

(assert (=> b!1103088 (= res!735649 (= (getValueByKey!623 (toList!7703 lt!494576) (_1!8710 lt!494356)) (Some!673 (_2!8710 lt!494356))))))

(declare-fun b!1103089 () Bool)

(assert (=> b!1103089 (= e!629721 (contains!6429 (toList!7703 lt!494576) lt!494356))))

(assert (= (and d!131173 res!735650) b!1103088))

(assert (= (and b!1103088 res!735649) b!1103089))

(declare-fun m!1023663 () Bool)

(assert (=> d!131173 m!1023663))

(declare-fun m!1023665 () Bool)

(assert (=> d!131173 m!1023665))

(declare-fun m!1023667 () Bool)

(assert (=> d!131173 m!1023667))

(declare-fun m!1023669 () Bool)

(assert (=> d!131173 m!1023669))

(declare-fun m!1023671 () Bool)

(assert (=> b!1103088 m!1023671))

(declare-fun m!1023673 () Bool)

(assert (=> b!1103089 m!1023673))

(assert (=> b!1102806 d!131173))

(declare-fun b!1103090 () Bool)

(declare-fun e!629723 () Bool)

(assert (=> b!1103090 (= e!629723 (contains!6430 Nil!24015 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103091 () Bool)

(declare-fun e!629724 () Bool)

(declare-fun call!46290 () Bool)

(assert (=> b!1103091 (= e!629724 call!46290)))

(declare-fun bm!46287 () Bool)

(declare-fun c!109277 () Bool)

(assert (=> bm!46287 (= call!46290 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109277 (Cons!24014 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000) Nil!24015) Nil!24015)))))

(declare-fun b!1103093 () Bool)

(declare-fun e!629722 () Bool)

(assert (=> b!1103093 (= e!629722 e!629724)))

(assert (=> b!1103093 (= c!109277 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103094 () Bool)

(assert (=> b!1103094 (= e!629724 call!46290)))

(declare-fun b!1103092 () Bool)

(declare-fun e!629725 () Bool)

(assert (=> b!1103092 (= e!629725 e!629722)))

(declare-fun res!735651 () Bool)

(assert (=> b!1103092 (=> (not res!735651) (not e!629722))))

(assert (=> b!1103092 (= res!735651 (not e!629723))))

(declare-fun res!735653 () Bool)

(assert (=> b!1103092 (=> (not res!735653) (not e!629723))))

(assert (=> b!1103092 (= res!735653 (validKeyInArray!0 (select (arr!34359 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131175 () Bool)

(declare-fun res!735652 () Bool)

(assert (=> d!131175 (=> res!735652 e!629725)))

(assert (=> d!131175 (= res!735652 (bvsge #b00000000000000000000000000000000 (size!34896 _keys!1070)))))

(assert (=> d!131175 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24015) e!629725)))

(assert (= (and d!131175 (not res!735652)) b!1103092))

(assert (= (and b!1103092 res!735653) b!1103090))

(assert (= (and b!1103092 res!735651) b!1103093))

(assert (= (and b!1103093 c!109277) b!1103094))

(assert (= (and b!1103093 (not c!109277)) b!1103091))

(assert (= (or b!1103094 b!1103091) bm!46287))

(assert (=> b!1103090 m!1023495))

(assert (=> b!1103090 m!1023495))

(declare-fun m!1023675 () Bool)

(assert (=> b!1103090 m!1023675))

(assert (=> bm!46287 m!1023495))

(declare-fun m!1023677 () Bool)

(assert (=> bm!46287 m!1023677))

(assert (=> b!1103093 m!1023495))

(assert (=> b!1103093 m!1023495))

(assert (=> b!1103093 m!1023497))

(assert (=> b!1103092 m!1023495))

(assert (=> b!1103092 m!1023495))

(assert (=> b!1103092 m!1023497))

(assert (=> b!1102801 d!131175))

(declare-fun b!1103095 () Bool)

(declare-fun e!629726 () Bool)

(declare-fun call!46291 () Bool)

(assert (=> b!1103095 (= e!629726 call!46291)))

(declare-fun d!131177 () Bool)

(declare-fun res!735654 () Bool)

(declare-fun e!629727 () Bool)

(assert (=> d!131177 (=> res!735654 e!629727)))

(assert (=> d!131177 (= res!735654 (bvsge #b00000000000000000000000000000000 (size!34896 lt!494358)))))

(assert (=> d!131177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494358 mask!1414) e!629727)))

(declare-fun b!1103096 () Bool)

(declare-fun e!629728 () Bool)

(assert (=> b!1103096 (= e!629727 e!629728)))

(declare-fun c!109278 () Bool)

(assert (=> b!1103096 (= c!109278 (validKeyInArray!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000)))))

(declare-fun b!1103097 () Bool)

(assert (=> b!1103097 (= e!629728 e!629726)))

(declare-fun lt!494580 () (_ BitVec 64))

(assert (=> b!1103097 (= lt!494580 (select (arr!34359 lt!494358) #b00000000000000000000000000000000))))

(declare-fun lt!494579 () Unit!36193)

(assert (=> b!1103097 (= lt!494579 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494358 lt!494580 #b00000000000000000000000000000000))))

(assert (=> b!1103097 (arrayContainsKey!0 lt!494358 lt!494580 #b00000000000000000000000000000000)))

(declare-fun lt!494578 () Unit!36193)

(assert (=> b!1103097 (= lt!494578 lt!494579)))

(declare-fun res!735655 () Bool)

(assert (=> b!1103097 (= res!735655 (= (seekEntryOrOpen!0 (select (arr!34359 lt!494358) #b00000000000000000000000000000000) lt!494358 mask!1414) (Found!9871 #b00000000000000000000000000000000)))))

(assert (=> b!1103097 (=> (not res!735655) (not e!629726))))

(declare-fun b!1103098 () Bool)

(assert (=> b!1103098 (= e!629728 call!46291)))

(declare-fun bm!46288 () Bool)

(assert (=> bm!46288 (= call!46291 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494358 mask!1414))))

(assert (= (and d!131177 (not res!735654)) b!1103096))

(assert (= (and b!1103096 c!109278) b!1103097))

(assert (= (and b!1103096 (not c!109278)) b!1103098))

(assert (= (and b!1103097 res!735655) b!1103095))

(assert (= (or b!1103095 b!1103098) bm!46288))

(assert (=> b!1103096 m!1023469))

(assert (=> b!1103096 m!1023469))

(assert (=> b!1103096 m!1023471))

(assert (=> b!1103097 m!1023469))

(declare-fun m!1023679 () Bool)

(assert (=> b!1103097 m!1023679))

(declare-fun m!1023681 () Bool)

(assert (=> b!1103097 m!1023681))

(assert (=> b!1103097 m!1023469))

(declare-fun m!1023683 () Bool)

(assert (=> b!1103097 m!1023683))

(declare-fun m!1023685 () Bool)

(assert (=> bm!46288 m!1023685))

(assert (=> b!1102800 d!131177))

(declare-fun mapNonEmpty!42631 () Bool)

(declare-fun mapRes!42631 () Bool)

(declare-fun tp!81488 () Bool)

(declare-fun e!629733 () Bool)

(assert (=> mapNonEmpty!42631 (= mapRes!42631 (and tp!81488 e!629733))))

(declare-fun mapRest!42631 () (Array (_ BitVec 32) ValueCell!12902))

(declare-fun mapValue!42631 () ValueCell!12902)

(declare-fun mapKey!42631 () (_ BitVec 32))

(assert (=> mapNonEmpty!42631 (= mapRest!42622 (store mapRest!42631 mapKey!42631 mapValue!42631))))

(declare-fun b!1103106 () Bool)

(declare-fun e!629734 () Bool)

(assert (=> b!1103106 (= e!629734 tp_is_empty!27223)))

(declare-fun mapIsEmpty!42631 () Bool)

(assert (=> mapIsEmpty!42631 mapRes!42631))

(declare-fun b!1103105 () Bool)

(assert (=> b!1103105 (= e!629733 tp_is_empty!27223)))

(declare-fun condMapEmpty!42631 () Bool)

(declare-fun mapDefault!42631 () ValueCell!12902)

(assert (=> mapNonEmpty!42622 (= condMapEmpty!42631 (= mapRest!42622 ((as const (Array (_ BitVec 32) ValueCell!12902)) mapDefault!42631)))))

(assert (=> mapNonEmpty!42622 (= tp!81472 (and e!629734 mapRes!42631))))

(assert (= (and mapNonEmpty!42622 condMapEmpty!42631) mapIsEmpty!42631))

(assert (= (and mapNonEmpty!42622 (not condMapEmpty!42631)) mapNonEmpty!42631))

(assert (= (and mapNonEmpty!42631 ((_ is ValueCellFull!12902) mapValue!42631)) b!1103105))

(assert (= (and mapNonEmpty!42622 ((_ is ValueCellFull!12902) mapDefault!42631)) b!1103106))

(declare-fun m!1023687 () Bool)

(assert (=> mapNonEmpty!42631 m!1023687))

(declare-fun b_lambda!18133 () Bool)

(assert (= b_lambda!18119 (or (and start!97066 b_free!23173) b_lambda!18133)))

(declare-fun b_lambda!18135 () Bool)

(assert (= b_lambda!18127 (or (and start!97066 b_free!23173) b_lambda!18135)))

(declare-fun b_lambda!18137 () Bool)

(assert (= b_lambda!18121 (or (and start!97066 b_free!23173) b_lambda!18137)))

(declare-fun b_lambda!18139 () Bool)

(assert (= b_lambda!18131 (or (and start!97066 b_free!23173) b_lambda!18139)))

(declare-fun b_lambda!18141 () Bool)

(assert (= b_lambda!18123 (or (and start!97066 b_free!23173) b_lambda!18141)))

(declare-fun b_lambda!18143 () Bool)

(assert (= b_lambda!18129 (or (and start!97066 b_free!23173) b_lambda!18143)))

(declare-fun b_lambda!18145 () Bool)

(assert (= b_lambda!18125 (or (and start!97066 b_free!23173) b_lambda!18145)))

(check-sat (not d!131155) (not b_lambda!18141) (not bm!46261) (not b!1102992) (not bm!46265) (not b_next!23173) (not bm!46288) (not b_lambda!18145) (not bm!46267) (not b_lambda!18133) (not d!131149) (not b!1102985) (not b!1103097) (not bm!46260) (not b_lambda!18143) (not b!1102994) (not b!1103024) (not bm!46245) (not bm!46286) (not b!1103086) (not b!1103096) (not b!1103043) (not b_lambda!18135) (not b!1103011) (not b_lambda!18137) (not bm!46266) (not d!131173) (not b!1103072) (not bm!46287) (not b!1103051) (not b!1102940) (not b!1103048) (not b_lambda!18117) (not b!1103058) (not b!1103015) (not d!131163) (not b!1103075) (not bm!46279) (not b!1102935) (not b!1103069) (not b!1103090) (not b_lambda!18139) (not b!1103092) (not b!1103089) (not b!1102937) (not bm!46273) (not d!131153) (not b!1103046) (not b!1103057) b_and!37169 (not d!131151) (not d!131161) tp_is_empty!27223 (not b!1103002) (not bm!46278) (not b!1103012) (not b!1103032) (not b!1103013) (not b!1103088) (not b!1103074) (not b!1103042) (not bm!46268) (not b!1102991) (not b!1103014) (not bm!46283) (not bm!46280) (not b!1102930) (not b!1102993) (not mapNonEmpty!42631) (not d!131165) (not b!1102933) (not b!1103071) (not b!1103044) (not b!1102932) (not b!1103003) (not d!131157) (not b!1102939) (not b!1102931) (not b!1103050) (not d!131169) (not b!1102990) (not b!1103006) (not bm!46272) (not b!1103085) (not b!1103023) (not b!1103093) (not b!1103041) (not b!1103040))
(check-sat b_and!37169 (not b_next!23173))
