; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77978 () Bool)

(assert start!77978)

(declare-fun b_free!16521 () Bool)

(declare-fun b_next!16521 () Bool)

(assert (=> start!77978 (= b_free!16521 (not b_next!16521))))

(declare-fun tp!57831 () Bool)

(declare-fun b_and!27091 () Bool)

(assert (=> start!77978 (= tp!57831 b_and!27091)))

(declare-fun b!910368 () Bool)

(declare-fun e!510423 () Bool)

(declare-fun e!510421 () Bool)

(declare-fun mapRes!30127 () Bool)

(assert (=> b!910368 (= e!510423 (and e!510421 mapRes!30127))))

(declare-fun condMapEmpty!30127 () Bool)

(declare-datatypes ((V!30217 0))(
  ( (V!30218 (val!9520 Int)) )
))
(declare-datatypes ((ValueCell!8988 0))(
  ( (ValueCellFull!8988 (v!12028 V!30217)) (EmptyCell!8988) )
))
(declare-datatypes ((array!53892 0))(
  ( (array!53893 (arr!25903 (Array (_ BitVec 32) ValueCell!8988)) (size!26362 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53892)

(declare-fun mapDefault!30127 () ValueCell!8988)

(assert (=> b!910368 (= condMapEmpty!30127 (= (arr!25903 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8988)) mapDefault!30127)))))

(declare-fun b!910369 () Bool)

(declare-fun tp_is_empty!18939 () Bool)

(assert (=> b!910369 (= e!510421 tp_is_empty!18939)))

(declare-fun b!910370 () Bool)

(declare-fun res!614339 () Bool)

(declare-fun e!510422 () Bool)

(assert (=> b!910370 (=> (not res!614339) (not e!510422))))

(declare-datatypes ((array!53894 0))(
  ( (array!53895 (arr!25904 (Array (_ BitVec 32) (_ BitVec 64))) (size!26363 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53894)

(declare-datatypes ((List!18194 0))(
  ( (Nil!18191) (Cons!18190 (h!19336 (_ BitVec 64)) (t!25777 List!18194)) )
))
(declare-fun arrayNoDuplicates!0 (array!53894 (_ BitVec 32) List!18194) Bool)

(assert (=> b!910370 (= res!614339 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18191))))

(declare-fun mapNonEmpty!30127 () Bool)

(declare-fun tp!57830 () Bool)

(declare-fun e!510420 () Bool)

(assert (=> mapNonEmpty!30127 (= mapRes!30127 (and tp!57830 e!510420))))

(declare-fun mapKey!30127 () (_ BitVec 32))

(declare-fun mapValue!30127 () ValueCell!8988)

(declare-fun mapRest!30127 () (Array (_ BitVec 32) ValueCell!8988))

(assert (=> mapNonEmpty!30127 (= (arr!25903 _values!1152) (store mapRest!30127 mapKey!30127 mapValue!30127))))

(declare-fun b!910372 () Bool)

(declare-fun res!614336 () Bool)

(assert (=> b!910372 (=> (not res!614336) (not e!510422))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53894 (_ BitVec 32)) Bool)

(assert (=> b!910372 (= res!614336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910373 () Bool)

(declare-fun res!614337 () Bool)

(assert (=> b!910373 (=> (not res!614337) (not e!510422))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!910373 (= res!614337 (inRange!0 i!717 mask!1756))))

(declare-fun b!910374 () Bool)

(declare-fun res!614335 () Bool)

(assert (=> b!910374 (=> (not res!614335) (not e!510422))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30217)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30217)

(declare-datatypes ((tuple2!12404 0))(
  ( (tuple2!12405 (_1!6213 (_ BitVec 64)) (_2!6213 V!30217)) )
))
(declare-datatypes ((List!18195 0))(
  ( (Nil!18192) (Cons!18191 (h!19337 tuple2!12404) (t!25778 List!18195)) )
))
(declare-datatypes ((ListLongMap!11101 0))(
  ( (ListLongMap!11102 (toList!5566 List!18195)) )
))
(declare-fun contains!4609 (ListLongMap!11101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2828 (array!53894 array!53892 (_ BitVec 32) (_ BitVec 32) V!30217 V!30217 (_ BitVec 32) Int) ListLongMap!11101)

(assert (=> b!910374 (= res!614335 (contains!4609 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910375 () Bool)

(assert (=> b!910375 (= e!510420 tp_is_empty!18939)))

(declare-fun res!614340 () Bool)

(assert (=> start!77978 (=> (not res!614340) (not e!510422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77978 (= res!614340 (validMask!0 mask!1756))))

(assert (=> start!77978 e!510422))

(declare-fun array_inv!20258 (array!53892) Bool)

(assert (=> start!77978 (and (array_inv!20258 _values!1152) e!510423)))

(assert (=> start!77978 tp!57831))

(assert (=> start!77978 true))

(assert (=> start!77978 tp_is_empty!18939))

(declare-fun array_inv!20259 (array!53894) Bool)

(assert (=> start!77978 (array_inv!20259 _keys!1386)))

(declare-fun b!910371 () Bool)

(assert (=> b!910371 (= e!510422 (and (= (select (arr!25904 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26363 _keys!1386))))))

(declare-fun b!910376 () Bool)

(declare-fun res!614338 () Bool)

(assert (=> b!910376 (=> (not res!614338) (not e!510422))))

(assert (=> b!910376 (= res!614338 (and (= (size!26362 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26363 _keys!1386) (size!26362 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30127 () Bool)

(assert (=> mapIsEmpty!30127 mapRes!30127))

(assert (= (and start!77978 res!614340) b!910376))

(assert (= (and b!910376 res!614338) b!910372))

(assert (= (and b!910372 res!614336) b!910370))

(assert (= (and b!910370 res!614339) b!910374))

(assert (= (and b!910374 res!614335) b!910373))

(assert (= (and b!910373 res!614337) b!910371))

(assert (= (and b!910368 condMapEmpty!30127) mapIsEmpty!30127))

(assert (= (and b!910368 (not condMapEmpty!30127)) mapNonEmpty!30127))

(get-info :version)

(assert (= (and mapNonEmpty!30127 ((_ is ValueCellFull!8988) mapValue!30127)) b!910375))

(assert (= (and b!910368 ((_ is ValueCellFull!8988) mapDefault!30127)) b!910369))

(assert (= start!77978 b!910368))

(declare-fun m!845385 () Bool)

(assert (=> b!910373 m!845385))

(declare-fun m!845387 () Bool)

(assert (=> start!77978 m!845387))

(declare-fun m!845389 () Bool)

(assert (=> start!77978 m!845389))

(declare-fun m!845391 () Bool)

(assert (=> start!77978 m!845391))

(declare-fun m!845393 () Bool)

(assert (=> b!910371 m!845393))

(declare-fun m!845395 () Bool)

(assert (=> b!910370 m!845395))

(declare-fun m!845397 () Bool)

(assert (=> b!910372 m!845397))

(declare-fun m!845399 () Bool)

(assert (=> mapNonEmpty!30127 m!845399))

(declare-fun m!845401 () Bool)

(assert (=> b!910374 m!845401))

(assert (=> b!910374 m!845401))

(declare-fun m!845403 () Bool)

(assert (=> b!910374 m!845403))

(check-sat (not b!910370) tp_is_empty!18939 (not mapNonEmpty!30127) (not b!910372) (not b!910374) (not b!910373) b_and!27091 (not start!77978) (not b_next!16521))
(check-sat b_and!27091 (not b_next!16521))
(get-model)

(declare-fun d!112195 () Bool)

(declare-fun e!510444 () Bool)

(assert (=> d!112195 e!510444))

(declare-fun res!614361 () Bool)

(assert (=> d!112195 (=> res!614361 e!510444)))

(declare-fun lt!410189 () Bool)

(assert (=> d!112195 (= res!614361 (not lt!410189))))

(declare-fun lt!410191 () Bool)

(assert (=> d!112195 (= lt!410189 lt!410191)))

(declare-datatypes ((Unit!30858 0))(
  ( (Unit!30859) )
))
(declare-fun lt!410192 () Unit!30858)

(declare-fun e!510443 () Unit!30858)

(assert (=> d!112195 (= lt!410192 e!510443)))

(declare-fun c!95718 () Bool)

(assert (=> d!112195 (= c!95718 lt!410191)))

(declare-fun containsKey!438 (List!18195 (_ BitVec 64)) Bool)

(assert (=> d!112195 (= lt!410191 (containsKey!438 (toList!5566 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112195 (= (contains!4609 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410189)))

(declare-fun b!910410 () Bool)

(declare-fun lt!410190 () Unit!30858)

(assert (=> b!910410 (= e!510443 lt!410190)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!334 (List!18195 (_ BitVec 64)) Unit!30858)

(assert (=> b!910410 (= lt!410190 (lemmaContainsKeyImpliesGetValueByKeyDefined!334 (toList!5566 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!477 0))(
  ( (Some!476 (v!12030 V!30217)) (None!475) )
))
(declare-fun isDefined!343 (Option!477) Bool)

(declare-fun getValueByKey!471 (List!18195 (_ BitVec 64)) Option!477)

(assert (=> b!910410 (isDefined!343 (getValueByKey!471 (toList!5566 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!910411 () Bool)

(declare-fun Unit!30860 () Unit!30858)

(assert (=> b!910411 (= e!510443 Unit!30860)))

(declare-fun b!910412 () Bool)

(assert (=> b!910412 (= e!510444 (isDefined!343 (getValueByKey!471 (toList!5566 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112195 c!95718) b!910410))

(assert (= (and d!112195 (not c!95718)) b!910411))

(assert (= (and d!112195 (not res!614361)) b!910412))

(declare-fun m!845425 () Bool)

(assert (=> d!112195 m!845425))

(declare-fun m!845427 () Bool)

(assert (=> b!910410 m!845427))

(declare-fun m!845429 () Bool)

(assert (=> b!910410 m!845429))

(assert (=> b!910410 m!845429))

(declare-fun m!845431 () Bool)

(assert (=> b!910410 m!845431))

(assert (=> b!910412 m!845429))

(assert (=> b!910412 m!845429))

(assert (=> b!910412 m!845431))

(assert (=> b!910374 d!112195))

(declare-fun bm!40325 () Bool)

(declare-fun call!40334 () ListLongMap!11101)

(declare-fun call!40332 () ListLongMap!11101)

(assert (=> bm!40325 (= call!40334 call!40332)))

(declare-fun b!910455 () Bool)

(declare-fun e!510479 () ListLongMap!11101)

(declare-fun call!40330 () ListLongMap!11101)

(declare-fun +!2604 (ListLongMap!11101 tuple2!12404) ListLongMap!11101)

(assert (=> b!910455 (= e!510479 (+!2604 call!40330 (tuple2!12405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!910456 () Bool)

(declare-fun res!614385 () Bool)

(declare-fun e!510478 () Bool)

(assert (=> b!910456 (=> (not res!614385) (not e!510478))))

(declare-fun e!510482 () Bool)

(assert (=> b!910456 (= res!614385 e!510482)))

(declare-fun res!614382 () Bool)

(assert (=> b!910456 (=> res!614382 e!510482)))

(declare-fun e!510473 () Bool)

(assert (=> b!910456 (= res!614382 (not e!510473))))

(declare-fun res!614384 () Bool)

(assert (=> b!910456 (=> (not res!614384) (not e!510473))))

(assert (=> b!910456 (= res!614384 (bvslt #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(declare-fun call!40333 () ListLongMap!11101)

(declare-fun bm!40327 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3291 (array!53894 array!53892 (_ BitVec 32) (_ BitVec 32) V!30217 V!30217 (_ BitVec 32) Int) ListLongMap!11101)

(assert (=> bm!40327 (= call!40333 (getCurrentListMapNoExtraKeys!3291 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!910457 () Bool)

(declare-fun e!510480 () ListLongMap!11101)

(declare-fun call!40329 () ListLongMap!11101)

(assert (=> b!910457 (= e!510480 call!40329)))

(declare-fun b!910458 () Bool)

(declare-fun e!510481 () ListLongMap!11101)

(assert (=> b!910458 (= e!510481 call!40329)))

(declare-fun b!910459 () Bool)

(assert (=> b!910459 (= e!510479 e!510480)))

(declare-fun c!95732 () Bool)

(assert (=> b!910459 (= c!95732 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!910460 () Bool)

(declare-fun e!510483 () Bool)

(declare-fun call!40331 () Bool)

(assert (=> b!910460 (= e!510483 (not call!40331))))

(declare-fun b!910461 () Bool)

(declare-fun e!510472 () Bool)

(declare-fun e!510474 () Bool)

(assert (=> b!910461 (= e!510472 e!510474)))

(declare-fun res!614383 () Bool)

(declare-fun call!40328 () Bool)

(assert (=> b!910461 (= res!614383 call!40328)))

(assert (=> b!910461 (=> (not res!614383) (not e!510474))))

(declare-fun b!910462 () Bool)

(declare-fun e!510476 () Bool)

(assert (=> b!910462 (= e!510482 e!510476)))

(declare-fun res!614387 () Bool)

(assert (=> b!910462 (=> (not res!614387) (not e!510476))))

(declare-fun lt!410237 () ListLongMap!11101)

(assert (=> b!910462 (= res!614387 (contains!4609 lt!410237 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!910462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(declare-fun b!910463 () Bool)

(declare-fun e!510475 () Bool)

(assert (=> b!910463 (= e!510483 e!510475)))

(declare-fun res!614381 () Bool)

(assert (=> b!910463 (= res!614381 call!40331)))

(assert (=> b!910463 (=> (not res!614381) (not e!510475))))

(declare-fun bm!40328 () Bool)

(assert (=> bm!40328 (= call!40331 (contains!4609 lt!410237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!910464 () Bool)

(declare-fun e!510471 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!910464 (= e!510471 (validKeyInArray!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910465 () Bool)

(declare-fun apply!512 (ListLongMap!11101 (_ BitVec 64)) V!30217)

(assert (=> b!910465 (= e!510474 (= (apply!512 lt!410237 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!910466 () Bool)

(assert (=> b!910466 (= e!510481 call!40334)))

(declare-fun d!112197 () Bool)

(assert (=> d!112197 e!510478))

(declare-fun res!614380 () Bool)

(assert (=> d!112197 (=> (not res!614380) (not e!510478))))

(assert (=> d!112197 (= res!614380 (or (bvsge #b00000000000000000000000000000000 (size!26363 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26363 _keys!1386)))))))

(declare-fun lt!410240 () ListLongMap!11101)

(assert (=> d!112197 (= lt!410237 lt!410240)))

(declare-fun lt!410255 () Unit!30858)

(declare-fun e!510477 () Unit!30858)

(assert (=> d!112197 (= lt!410255 e!510477)))

(declare-fun c!95731 () Bool)

(assert (=> d!112197 (= c!95731 e!510471)))

(declare-fun res!614386 () Bool)

(assert (=> d!112197 (=> (not res!614386) (not e!510471))))

(assert (=> d!112197 (= res!614386 (bvslt #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(assert (=> d!112197 (= lt!410240 e!510479)))

(declare-fun c!95736 () Bool)

(assert (=> d!112197 (= c!95736 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112197 (validMask!0 mask!1756)))

(assert (=> d!112197 (= (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410237)))

(declare-fun bm!40326 () Bool)

(assert (=> bm!40326 (= call!40329 call!40330)))

(declare-fun bm!40329 () Bool)

(assert (=> bm!40329 (= call!40332 call!40333)))

(declare-fun bm!40330 () Bool)

(assert (=> bm!40330 (= call!40330 (+!2604 (ite c!95736 call!40333 (ite c!95732 call!40332 call!40334)) (ite (or c!95736 c!95732) (tuple2!12405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!910467 () Bool)

(assert (=> b!910467 (= e!510475 (= (apply!512 lt!410237 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!910468 () Bool)

(declare-fun get!13625 (ValueCell!8988 V!30217) V!30217)

(declare-fun dynLambda!1388 (Int (_ BitVec 64)) V!30217)

(assert (=> b!910468 (= e!510476 (= (apply!512 lt!410237 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)) (get!13625 (select (arr!25903 _values!1152) #b00000000000000000000000000000000) (dynLambda!1388 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!910468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26362 _values!1152)))))

(assert (=> b!910468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(declare-fun b!910469 () Bool)

(declare-fun res!614388 () Bool)

(assert (=> b!910469 (=> (not res!614388) (not e!510478))))

(assert (=> b!910469 (= res!614388 e!510483)))

(declare-fun c!95734 () Bool)

(assert (=> b!910469 (= c!95734 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40331 () Bool)

(assert (=> bm!40331 (= call!40328 (contains!4609 lt!410237 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!910470 () Bool)

(declare-fun c!95735 () Bool)

(assert (=> b!910470 (= c!95735 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!910470 (= e!510480 e!510481)))

(declare-fun b!910471 () Bool)

(declare-fun lt!410245 () Unit!30858)

(assert (=> b!910471 (= e!510477 lt!410245)))

(declare-fun lt!410246 () ListLongMap!11101)

(assert (=> b!910471 (= lt!410246 (getCurrentListMapNoExtraKeys!3291 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410248 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410249 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410249 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410251 () Unit!30858)

(declare-fun addStillContains!345 (ListLongMap!11101 (_ BitVec 64) V!30217 (_ BitVec 64)) Unit!30858)

(assert (=> b!910471 (= lt!410251 (addStillContains!345 lt!410246 lt!410248 zeroValue!1094 lt!410249))))

(assert (=> b!910471 (contains!4609 (+!2604 lt!410246 (tuple2!12405 lt!410248 zeroValue!1094)) lt!410249)))

(declare-fun lt!410239 () Unit!30858)

(assert (=> b!910471 (= lt!410239 lt!410251)))

(declare-fun lt!410258 () ListLongMap!11101)

(assert (=> b!910471 (= lt!410258 (getCurrentListMapNoExtraKeys!3291 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410242 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410242 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410238 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410238 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410254 () Unit!30858)

(declare-fun addApplyDifferent!345 (ListLongMap!11101 (_ BitVec 64) V!30217 (_ BitVec 64)) Unit!30858)

(assert (=> b!910471 (= lt!410254 (addApplyDifferent!345 lt!410258 lt!410242 minValue!1094 lt!410238))))

(assert (=> b!910471 (= (apply!512 (+!2604 lt!410258 (tuple2!12405 lt!410242 minValue!1094)) lt!410238) (apply!512 lt!410258 lt!410238))))

(declare-fun lt!410250 () Unit!30858)

(assert (=> b!910471 (= lt!410250 lt!410254)))

(declare-fun lt!410253 () ListLongMap!11101)

(assert (=> b!910471 (= lt!410253 (getCurrentListMapNoExtraKeys!3291 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410244 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410244 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410252 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410252 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410256 () Unit!30858)

(assert (=> b!910471 (= lt!410256 (addApplyDifferent!345 lt!410253 lt!410244 zeroValue!1094 lt!410252))))

(assert (=> b!910471 (= (apply!512 (+!2604 lt!410253 (tuple2!12405 lt!410244 zeroValue!1094)) lt!410252) (apply!512 lt!410253 lt!410252))))

(declare-fun lt!410241 () Unit!30858)

(assert (=> b!910471 (= lt!410241 lt!410256)))

(declare-fun lt!410243 () ListLongMap!11101)

(assert (=> b!910471 (= lt!410243 (getCurrentListMapNoExtraKeys!3291 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410247 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410257 () (_ BitVec 64))

(assert (=> b!910471 (= lt!410257 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!910471 (= lt!410245 (addApplyDifferent!345 lt!410243 lt!410247 minValue!1094 lt!410257))))

(assert (=> b!910471 (= (apply!512 (+!2604 lt!410243 (tuple2!12405 lt!410247 minValue!1094)) lt!410257) (apply!512 lt!410243 lt!410257))))

(declare-fun b!910472 () Bool)

(assert (=> b!910472 (= e!510478 e!510472)))

(declare-fun c!95733 () Bool)

(assert (=> b!910472 (= c!95733 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!910473 () Bool)

(declare-fun Unit!30861 () Unit!30858)

(assert (=> b!910473 (= e!510477 Unit!30861)))

(declare-fun b!910474 () Bool)

(assert (=> b!910474 (= e!510472 (not call!40328))))

(declare-fun b!910475 () Bool)

(assert (=> b!910475 (= e!510473 (validKeyInArray!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112197 c!95736) b!910455))

(assert (= (and d!112197 (not c!95736)) b!910459))

(assert (= (and b!910459 c!95732) b!910457))

(assert (= (and b!910459 (not c!95732)) b!910470))

(assert (= (and b!910470 c!95735) b!910458))

(assert (= (and b!910470 (not c!95735)) b!910466))

(assert (= (or b!910458 b!910466) bm!40325))

(assert (= (or b!910457 bm!40325) bm!40329))

(assert (= (or b!910457 b!910458) bm!40326))

(assert (= (or b!910455 bm!40329) bm!40327))

(assert (= (or b!910455 bm!40326) bm!40330))

(assert (= (and d!112197 res!614386) b!910464))

(assert (= (and d!112197 c!95731) b!910471))

(assert (= (and d!112197 (not c!95731)) b!910473))

(assert (= (and d!112197 res!614380) b!910456))

(assert (= (and b!910456 res!614384) b!910475))

(assert (= (and b!910456 (not res!614382)) b!910462))

(assert (= (and b!910462 res!614387) b!910468))

(assert (= (and b!910456 res!614385) b!910469))

(assert (= (and b!910469 c!95734) b!910463))

(assert (= (and b!910469 (not c!95734)) b!910460))

(assert (= (and b!910463 res!614381) b!910467))

(assert (= (or b!910463 b!910460) bm!40328))

(assert (= (and b!910469 res!614388) b!910472))

(assert (= (and b!910472 c!95733) b!910461))

(assert (= (and b!910472 (not c!95733)) b!910474))

(assert (= (and b!910461 res!614383) b!910465))

(assert (= (or b!910461 b!910474) bm!40331))

(declare-fun b_lambda!13299 () Bool)

(assert (=> (not b_lambda!13299) (not b!910468)))

(declare-fun t!25782 () Bool)

(declare-fun tb!5435 () Bool)

(assert (=> (and start!77978 (= defaultEntry!1160 defaultEntry!1160) t!25782) tb!5435))

(declare-fun result!10669 () Bool)

(assert (=> tb!5435 (= result!10669 tp_is_empty!18939)))

(assert (=> b!910468 t!25782))

(declare-fun b_and!27095 () Bool)

(assert (= b_and!27091 (and (=> t!25782 result!10669) b_and!27095)))

(declare-fun m!845433 () Bool)

(assert (=> bm!40331 m!845433))

(declare-fun m!845435 () Bool)

(assert (=> b!910468 m!845435))

(declare-fun m!845437 () Bool)

(assert (=> b!910468 m!845437))

(declare-fun m!845439 () Bool)

(assert (=> b!910468 m!845439))

(declare-fun m!845441 () Bool)

(assert (=> b!910468 m!845441))

(assert (=> b!910468 m!845439))

(assert (=> b!910468 m!845435))

(assert (=> b!910468 m!845437))

(declare-fun m!845443 () Bool)

(assert (=> b!910468 m!845443))

(assert (=> b!910464 m!845439))

(assert (=> b!910464 m!845439))

(declare-fun m!845445 () Bool)

(assert (=> b!910464 m!845445))

(assert (=> d!112197 m!845387))

(declare-fun m!845447 () Bool)

(assert (=> b!910455 m!845447))

(declare-fun m!845449 () Bool)

(assert (=> bm!40327 m!845449))

(assert (=> b!910475 m!845439))

(assert (=> b!910475 m!845439))

(assert (=> b!910475 m!845445))

(declare-fun m!845451 () Bool)

(assert (=> b!910471 m!845451))

(declare-fun m!845453 () Bool)

(assert (=> b!910471 m!845453))

(assert (=> b!910471 m!845451))

(assert (=> b!910471 m!845449))

(declare-fun m!845455 () Bool)

(assert (=> b!910471 m!845455))

(declare-fun m!845457 () Bool)

(assert (=> b!910471 m!845457))

(declare-fun m!845459 () Bool)

(assert (=> b!910471 m!845459))

(declare-fun m!845461 () Bool)

(assert (=> b!910471 m!845461))

(assert (=> b!910471 m!845439))

(declare-fun m!845463 () Bool)

(assert (=> b!910471 m!845463))

(declare-fun m!845465 () Bool)

(assert (=> b!910471 m!845465))

(declare-fun m!845467 () Bool)

(assert (=> b!910471 m!845467))

(declare-fun m!845469 () Bool)

(assert (=> b!910471 m!845469))

(declare-fun m!845471 () Bool)

(assert (=> b!910471 m!845471))

(assert (=> b!910471 m!845457))

(declare-fun m!845473 () Bool)

(assert (=> b!910471 m!845473))

(declare-fun m!845475 () Bool)

(assert (=> b!910471 m!845475))

(assert (=> b!910471 m!845455))

(declare-fun m!845477 () Bool)

(assert (=> b!910471 m!845477))

(assert (=> b!910471 m!845471))

(declare-fun m!845479 () Bool)

(assert (=> b!910471 m!845479))

(declare-fun m!845481 () Bool)

(assert (=> bm!40330 m!845481))

(declare-fun m!845483 () Bool)

(assert (=> bm!40328 m!845483))

(declare-fun m!845485 () Bool)

(assert (=> b!910465 m!845485))

(assert (=> b!910462 m!845439))

(assert (=> b!910462 m!845439))

(declare-fun m!845487 () Bool)

(assert (=> b!910462 m!845487))

(declare-fun m!845489 () Bool)

(assert (=> b!910467 m!845489))

(assert (=> b!910374 d!112197))

(declare-fun d!112199 () Bool)

(assert (=> d!112199 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!910373 d!112199))

(declare-fun b!910488 () Bool)

(declare-fun e!510494 () Bool)

(declare-fun contains!4611 (List!18194 (_ BitVec 64)) Bool)

(assert (=> b!910488 (= e!510494 (contains!4611 Nil!18191 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910489 () Bool)

(declare-fun e!510493 () Bool)

(declare-fun call!40337 () Bool)

(assert (=> b!910489 (= e!510493 call!40337)))

(declare-fun b!910490 () Bool)

(declare-fun e!510495 () Bool)

(declare-fun e!510492 () Bool)

(assert (=> b!910490 (= e!510495 e!510492)))

(declare-fun res!614397 () Bool)

(assert (=> b!910490 (=> (not res!614397) (not e!510492))))

(assert (=> b!910490 (= res!614397 (not e!510494))))

(declare-fun res!614396 () Bool)

(assert (=> b!910490 (=> (not res!614396) (not e!510494))))

(assert (=> b!910490 (= res!614396 (validKeyInArray!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40334 () Bool)

(declare-fun c!95739 () Bool)

(assert (=> bm!40334 (= call!40337 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95739 (Cons!18190 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000) Nil!18191) Nil!18191)))))

(declare-fun b!910491 () Bool)

(assert (=> b!910491 (= e!510492 e!510493)))

(assert (=> b!910491 (= c!95739 (validKeyInArray!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910492 () Bool)

(assert (=> b!910492 (= e!510493 call!40337)))

(declare-fun d!112201 () Bool)

(declare-fun res!614395 () Bool)

(assert (=> d!112201 (=> res!614395 e!510495)))

(assert (=> d!112201 (= res!614395 (bvsge #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(assert (=> d!112201 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18191) e!510495)))

(assert (= (and d!112201 (not res!614395)) b!910490))

(assert (= (and b!910490 res!614396) b!910488))

(assert (= (and b!910490 res!614397) b!910491))

(assert (= (and b!910491 c!95739) b!910489))

(assert (= (and b!910491 (not c!95739)) b!910492))

(assert (= (or b!910489 b!910492) bm!40334))

(assert (=> b!910488 m!845439))

(assert (=> b!910488 m!845439))

(declare-fun m!845491 () Bool)

(assert (=> b!910488 m!845491))

(assert (=> b!910490 m!845439))

(assert (=> b!910490 m!845439))

(assert (=> b!910490 m!845445))

(assert (=> bm!40334 m!845439))

(declare-fun m!845493 () Bool)

(assert (=> bm!40334 m!845493))

(assert (=> b!910491 m!845439))

(assert (=> b!910491 m!845439))

(assert (=> b!910491 m!845445))

(assert (=> b!910370 d!112201))

(declare-fun d!112203 () Bool)

(assert (=> d!112203 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77978 d!112203))

(declare-fun d!112205 () Bool)

(assert (=> d!112205 (= (array_inv!20258 _values!1152) (bvsge (size!26362 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77978 d!112205))

(declare-fun d!112207 () Bool)

(assert (=> d!112207 (= (array_inv!20259 _keys!1386) (bvsge (size!26363 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77978 d!112207))

(declare-fun b!910501 () Bool)

(declare-fun e!510503 () Bool)

(declare-fun call!40340 () Bool)

(assert (=> b!910501 (= e!510503 call!40340)))

(declare-fun b!910502 () Bool)

(declare-fun e!510504 () Bool)

(assert (=> b!910502 (= e!510504 call!40340)))

(declare-fun bm!40337 () Bool)

(assert (=> bm!40337 (= call!40340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!910503 () Bool)

(declare-fun e!510502 () Bool)

(assert (=> b!910503 (= e!510502 e!510503)))

(declare-fun c!95742 () Bool)

(assert (=> b!910503 (= c!95742 (validKeyInArray!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910504 () Bool)

(assert (=> b!910504 (= e!510503 e!510504)))

(declare-fun lt!410265 () (_ BitVec 64))

(assert (=> b!910504 (= lt!410265 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410267 () Unit!30858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53894 (_ BitVec 64) (_ BitVec 32)) Unit!30858)

(assert (=> b!910504 (= lt!410267 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410265 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!910504 (arrayContainsKey!0 _keys!1386 lt!410265 #b00000000000000000000000000000000)))

(declare-fun lt!410266 () Unit!30858)

(assert (=> b!910504 (= lt!410266 lt!410267)))

(declare-fun res!614403 () Bool)

(declare-datatypes ((SeekEntryResult!8965 0))(
  ( (MissingZero!8965 (index!38231 (_ BitVec 32))) (Found!8965 (index!38232 (_ BitVec 32))) (Intermediate!8965 (undefined!9777 Bool) (index!38233 (_ BitVec 32)) (x!77814 (_ BitVec 32))) (Undefined!8965) (MissingVacant!8965 (index!38234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53894 (_ BitVec 32)) SeekEntryResult!8965)

(assert (=> b!910504 (= res!614403 (= (seekEntryOrOpen!0 (select (arr!25904 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8965 #b00000000000000000000000000000000)))))

(assert (=> b!910504 (=> (not res!614403) (not e!510504))))

(declare-fun d!112209 () Bool)

(declare-fun res!614402 () Bool)

(assert (=> d!112209 (=> res!614402 e!510502)))

(assert (=> d!112209 (= res!614402 (bvsge #b00000000000000000000000000000000 (size!26363 _keys!1386)))))

(assert (=> d!112209 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!510502)))

(assert (= (and d!112209 (not res!614402)) b!910503))

(assert (= (and b!910503 c!95742) b!910504))

(assert (= (and b!910503 (not c!95742)) b!910501))

(assert (= (and b!910504 res!614403) b!910502))

(assert (= (or b!910502 b!910501) bm!40337))

(declare-fun m!845495 () Bool)

(assert (=> bm!40337 m!845495))

(assert (=> b!910503 m!845439))

(assert (=> b!910503 m!845439))

(assert (=> b!910503 m!845445))

(assert (=> b!910504 m!845439))

(declare-fun m!845497 () Bool)

(assert (=> b!910504 m!845497))

(declare-fun m!845499 () Bool)

(assert (=> b!910504 m!845499))

(assert (=> b!910504 m!845439))

(declare-fun m!845501 () Bool)

(assert (=> b!910504 m!845501))

(assert (=> b!910372 d!112209))

(declare-fun condMapEmpty!30133 () Bool)

(declare-fun mapDefault!30133 () ValueCell!8988)

(assert (=> mapNonEmpty!30127 (= condMapEmpty!30133 (= mapRest!30127 ((as const (Array (_ BitVec 32) ValueCell!8988)) mapDefault!30133)))))

(declare-fun e!510510 () Bool)

(declare-fun mapRes!30133 () Bool)

(assert (=> mapNonEmpty!30127 (= tp!57830 (and e!510510 mapRes!30133))))

(declare-fun mapIsEmpty!30133 () Bool)

(assert (=> mapIsEmpty!30133 mapRes!30133))

(declare-fun b!910512 () Bool)

(assert (=> b!910512 (= e!510510 tp_is_empty!18939)))

(declare-fun mapNonEmpty!30133 () Bool)

(declare-fun tp!57840 () Bool)

(declare-fun e!510509 () Bool)

(assert (=> mapNonEmpty!30133 (= mapRes!30133 (and tp!57840 e!510509))))

(declare-fun mapValue!30133 () ValueCell!8988)

(declare-fun mapKey!30133 () (_ BitVec 32))

(declare-fun mapRest!30133 () (Array (_ BitVec 32) ValueCell!8988))

(assert (=> mapNonEmpty!30133 (= mapRest!30127 (store mapRest!30133 mapKey!30133 mapValue!30133))))

(declare-fun b!910511 () Bool)

(assert (=> b!910511 (= e!510509 tp_is_empty!18939)))

(assert (= (and mapNonEmpty!30127 condMapEmpty!30133) mapIsEmpty!30133))

(assert (= (and mapNonEmpty!30127 (not condMapEmpty!30133)) mapNonEmpty!30133))

(assert (= (and mapNonEmpty!30133 ((_ is ValueCellFull!8988) mapValue!30133)) b!910511))

(assert (= (and mapNonEmpty!30127 ((_ is ValueCellFull!8988) mapDefault!30133)) b!910512))

(declare-fun m!845503 () Bool)

(assert (=> mapNonEmpty!30133 m!845503))

(declare-fun b_lambda!13301 () Bool)

(assert (= b_lambda!13299 (or (and start!77978 b_free!16521) b_lambda!13301)))

(check-sat b_and!27095 (not b!910504) (not d!112197) (not bm!40330) (not b!910464) (not b!910491) (not b!910455) (not b!910488) (not bm!40337) (not b!910490) (not d!112195) (not bm!40327) (not b!910503) (not b!910468) tp_is_empty!18939 (not b!910410) (not mapNonEmpty!30133) (not bm!40328) (not b_lambda!13301) (not b!910462) (not b!910475) (not b!910467) (not bm!40331) (not bm!40334) (not b!910471) (not b!910412) (not b_next!16521) (not b!910465))
(check-sat b_and!27095 (not b_next!16521))
