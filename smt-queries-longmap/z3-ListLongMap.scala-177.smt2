; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3448 () Bool)

(assert start!3448)

(declare-fun b!22295 () Bool)

(declare-fun b_free!741 () Bool)

(declare-fun b_next!741 () Bool)

(assert (=> b!22295 (= b_free!741 (not b_next!741))))

(declare-fun tp!3463 () Bool)

(declare-fun b_and!1453 () Bool)

(assert (=> b!22295 (= tp!3463 b_and!1453)))

(declare-fun bm!1567 () Bool)

(declare-datatypes ((V!1165 0))(
  ( (V!1166 (val!529 Int)) )
))
(declare-datatypes ((ValueCell!303 0))(
  ( (ValueCellFull!303 (v!1583 V!1165)) (EmptyCell!303) )
))
(declare-datatypes ((array!1243 0))(
  ( (array!1244 (arr!589 (Array (_ BitVec 32) ValueCell!303)) (size!685 (_ BitVec 32))) )
))
(declare-datatypes ((array!1245 0))(
  ( (array!1246 (arr!590 (Array (_ BitVec 32) (_ BitVec 64))) (size!686 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!192 0))(
  ( (LongMapFixedSize!193 (defaultEntry!1732 Int) (mask!4712 (_ BitVec 32)) (extraKeys!1632 (_ BitVec 32)) (zeroValue!1657 V!1165) (minValue!1657 V!1165) (_size!139 (_ BitVec 32)) (_keys!3155 array!1245) (_values!1720 array!1243) (_vacant!139 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!914 0))(
  ( (tuple2!915 (_1!461 Bool) (_2!461 LongMapFixedSize!192)) )
))
(declare-fun call!1570 () tuple2!914)

(declare-fun call!1571 () tuple2!914)

(assert (=> bm!1567 (= call!1570 call!1571)))

(declare-fun res!14146 () Bool)

(declare-fun e!14489 () Bool)

(assert (=> start!3448 (=> (not res!14146) (not e!14489))))

(declare-datatypes ((Cell!192 0))(
  ( (Cell!193 (v!1584 LongMapFixedSize!192)) )
))
(declare-datatypes ((LongMap!192 0))(
  ( (LongMap!193 (underlying!107 Cell!192)) )
))
(declare-fun thiss!938 () LongMap!192)

(declare-fun valid!96 (LongMap!192) Bool)

(assert (=> start!3448 (= res!14146 (valid!96 thiss!938))))

(assert (=> start!3448 e!14489))

(declare-fun e!14487 () Bool)

(assert (=> start!3448 e!14487))

(declare-fun mapIsEmpty!992 () Bool)

(declare-fun mapRes!992 () Bool)

(assert (=> mapIsEmpty!992 mapRes!992))

(declare-fun b!22292 () Bool)

(declare-fun lt!7485 () tuple2!914)

(assert (=> b!22292 (= lt!7485 call!1570)))

(declare-datatypes ((tuple2!916 0))(
  ( (tuple2!917 (_1!462 Bool) (_2!462 Cell!192)) )
))
(declare-fun e!14488 () tuple2!916)

(assert (=> b!22292 (= e!14488 (tuple2!917 (_1!461 lt!7485) (Cell!193 (_2!461 lt!7485))))))

(declare-fun b!22293 () Bool)

(declare-fun c!2695 () Bool)

(declare-fun lt!7484 () Bool)

(assert (=> b!22293 (= c!2695 (and (not (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7484))))

(declare-fun e!14485 () tuple2!916)

(assert (=> b!22293 (= e!14488 e!14485)))

(declare-fun b!22294 () Bool)

(declare-fun e!14490 () Bool)

(declare-fun e!14481 () Bool)

(assert (=> b!22294 (= e!14490 (and e!14481 mapRes!992))))

(declare-fun condMapEmpty!992 () Bool)

(declare-fun mapDefault!992 () ValueCell!303)

(assert (=> b!22294 (= condMapEmpty!992 (= (arr!589 (_values!1720 (v!1584 (underlying!107 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!303)) mapDefault!992)))))

(declare-fun tp_is_empty!1005 () Bool)

(declare-fun e!14478 () Bool)

(declare-fun array_inv!399 (array!1245) Bool)

(declare-fun array_inv!400 (array!1243) Bool)

(assert (=> b!22295 (= e!14478 (and tp!3463 tp_is_empty!1005 (array_inv!399 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) (array_inv!400 (_values!1720 (v!1584 (underlying!107 thiss!938)))) e!14490))))

(declare-fun b!22296 () Bool)

(declare-fun e!14486 () Bool)

(declare-datatypes ((tuple3!8 0))(
  ( (tuple3!9 (_1!463 Bool) (_2!463 Cell!192) (_3!4 LongMap!192)) )
))
(declare-fun lt!7483 () tuple3!8)

(assert (=> b!22296 (= e!14486 (not (valid!96 (_3!4 lt!7483))))))

(declare-fun bm!1568 () Bool)

(declare-fun c!2697 () Bool)

(declare-fun c!2696 () Bool)

(declare-fun lt!7486 () LongMapFixedSize!192)

(declare-fun update!26 (LongMapFixedSize!192 (_ BitVec 64) V!1165) tuple2!914)

(assert (=> bm!1568 (= call!1571 (update!26 lt!7486 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))))))

(declare-fun b!22297 () Bool)

(assert (=> b!22297 (= e!14489 e!14486)))

(declare-fun res!14145 () Bool)

(assert (=> b!22297 (=> (not res!14145) (not e!14486))))

(assert (=> b!22297 (= res!14145 (_1!463 lt!7483))))

(declare-fun e!14479 () tuple3!8)

(assert (=> b!22297 (= lt!7483 e!14479)))

(declare-fun c!2694 () Bool)

(declare-fun lt!7489 () tuple2!916)

(assert (=> b!22297 (= c!2694 (not (_1!462 lt!7489)))))

(declare-fun e!14484 () tuple2!916)

(assert (=> b!22297 (= lt!7489 e!14484)))

(assert (=> b!22297 (= c!2696 (and (not lt!7484) (not (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22297 (= lt!7484 (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!27 ((_ BitVec 32) Int) LongMapFixedSize!192)

(declare-fun computeNewMask!23 (LongMap!192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22297 (= lt!7486 (getNewLongMapFixedSize!27 (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun lt!7488 () Cell!192)

(declare-fun b!22298 () Bool)

(declare-fun lt!7490 () tuple2!914)

(assert (=> b!22298 (= e!14479 (ite (_1!461 lt!7490) (tuple3!9 true (underlying!107 thiss!938) (LongMap!193 lt!7488)) (tuple3!9 false lt!7488 thiss!938)))))

(declare-fun repackFrom!4 (LongMap!192 LongMapFixedSize!192 (_ BitVec 32)) tuple2!914)

(assert (=> b!22298 (= lt!7490 (repackFrom!4 thiss!938 (v!1584 (_2!462 lt!7489)) (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22298 (= lt!7488 (Cell!193 (_2!461 lt!7490)))))

(declare-fun b!22299 () Bool)

(assert (=> b!22299 (= e!14479 (tuple3!9 false (_2!462 lt!7489) thiss!938))))

(declare-fun b!22300 () Bool)

(assert (=> b!22300 (= e!14484 e!14488)))

(assert (=> b!22300 (= c!2697 (and (not lt!7484) (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22301 () Bool)

(declare-fun e!14483 () Bool)

(assert (=> b!22301 (= e!14483 e!14478)))

(declare-fun b!22302 () Bool)

(declare-fun e!14480 () Bool)

(assert (=> b!22302 (= e!14480 tp_is_empty!1005)))

(declare-fun b!22303 () Bool)

(declare-fun lt!7487 () tuple2!914)

(declare-fun lt!7482 () tuple2!914)

(assert (=> b!22303 (= e!14484 (tuple2!917 (and (_1!461 lt!7487) (_1!461 lt!7482)) (Cell!193 (_2!461 lt!7482))))))

(assert (=> b!22303 (= lt!7487 call!1571)))

(assert (=> b!22303 (= lt!7482 (update!26 (_2!461 lt!7487) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun b!22304 () Bool)

(assert (=> b!22304 (= e!14487 e!14483)))

(declare-fun b!22305 () Bool)

(declare-fun lt!7491 () tuple2!914)

(assert (=> b!22305 (= e!14485 (tuple2!917 (_1!461 lt!7491) (Cell!193 (_2!461 lt!7491))))))

(assert (=> b!22305 (= lt!7491 call!1570)))

(declare-fun b!22306 () Bool)

(assert (=> b!22306 (= e!14481 tp_is_empty!1005)))

(declare-fun b!22307 () Bool)

(assert (=> b!22307 (= e!14485 (tuple2!917 true (Cell!193 lt!7486)))))

(declare-fun mapNonEmpty!992 () Bool)

(declare-fun tp!3464 () Bool)

(assert (=> mapNonEmpty!992 (= mapRes!992 (and tp!3464 e!14480))))

(declare-fun mapValue!992 () ValueCell!303)

(declare-fun mapKey!992 () (_ BitVec 32))

(declare-fun mapRest!992 () (Array (_ BitVec 32) ValueCell!303))

(assert (=> mapNonEmpty!992 (= (arr!589 (_values!1720 (v!1584 (underlying!107 thiss!938)))) (store mapRest!992 mapKey!992 mapValue!992))))

(assert (= (and start!3448 res!14146) b!22297))

(assert (= (and b!22297 c!2696) b!22303))

(assert (= (and b!22297 (not c!2696)) b!22300))

(assert (= (and b!22300 c!2697) b!22292))

(assert (= (and b!22300 (not c!2697)) b!22293))

(assert (= (and b!22293 c!2695) b!22305))

(assert (= (and b!22293 (not c!2695)) b!22307))

(assert (= (or b!22292 b!22305) bm!1567))

(assert (= (or b!22303 bm!1567) bm!1568))

(assert (= (and b!22297 c!2694) b!22299))

(assert (= (and b!22297 (not c!2694)) b!22298))

(assert (= (and b!22297 res!14145) b!22296))

(assert (= (and b!22294 condMapEmpty!992) mapIsEmpty!992))

(assert (= (and b!22294 (not condMapEmpty!992)) mapNonEmpty!992))

(get-info :version)

(assert (= (and mapNonEmpty!992 ((_ is ValueCellFull!303) mapValue!992)) b!22302))

(assert (= (and b!22294 ((_ is ValueCellFull!303) mapDefault!992)) b!22306))

(assert (= b!22295 b!22294))

(assert (= b!22301 b!22295))

(assert (= b!22304 b!22301))

(assert (= start!3448 b!22304))

(declare-fun m!16200 () Bool)

(assert (=> b!22298 m!16200))

(declare-fun m!16202 () Bool)

(assert (=> start!3448 m!16202))

(declare-fun m!16204 () Bool)

(assert (=> bm!1568 m!16204))

(declare-fun m!16206 () Bool)

(assert (=> mapNonEmpty!992 m!16206))

(declare-fun m!16208 () Bool)

(assert (=> b!22296 m!16208))

(declare-fun m!16210 () Bool)

(assert (=> b!22295 m!16210))

(declare-fun m!16212 () Bool)

(assert (=> b!22295 m!16212))

(declare-fun m!16214 () Bool)

(assert (=> b!22303 m!16214))

(declare-fun m!16216 () Bool)

(assert (=> b!22297 m!16216))

(assert (=> b!22297 m!16216))

(declare-fun m!16218 () Bool)

(assert (=> b!22297 m!16218))

(check-sat (not b_next!741) tp_is_empty!1005 (not b!22296) (not start!3448) (not b!22298) (not b!22303) (not b!22297) b_and!1453 (not bm!1568) (not b!22295) (not mapNonEmpty!992))
(check-sat b_and!1453 (not b_next!741))
(get-model)

(declare-fun b!22368 () Bool)

(declare-fun e!14538 () Bool)

(declare-fun lt!7590 () array!1245)

(declare-datatypes ((tuple2!922 0))(
  ( (tuple2!923 (_1!467 (_ BitVec 64)) (_2!467 V!1165)) )
))
(declare-fun lt!7589 () tuple2!922)

(declare-fun arrayContainsKey!0 (array!1245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!22368 (= e!14538 (arrayContainsKey!0 lt!7590 (_1!467 lt!7589) #b00000000000000000000000000000000))))

(declare-fun b!22369 () Bool)

(declare-fun lt!7584 () (_ BitVec 32))

(assert (=> b!22369 (= e!14538 (ite (= (_1!467 lt!7589) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!7584 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!7584 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3945 () Bool)

(declare-fun e!14537 () Bool)

(assert (=> d!3945 e!14537))

(declare-fun res!14158 () Bool)

(assert (=> d!3945 (=> (not res!14158) (not e!14537))))

(declare-fun lt!7582 () LongMapFixedSize!192)

(declare-fun valid!97 (LongMapFixedSize!192) Bool)

(assert (=> d!3945 (= res!14158 (valid!97 lt!7582))))

(declare-fun lt!7588 () LongMapFixedSize!192)

(assert (=> d!3945 (= lt!7582 lt!7588)))

(declare-datatypes ((Unit!488 0))(
  ( (Unit!489) )
))
(declare-fun lt!7568 () Unit!488)

(declare-fun e!14536 () Unit!488)

(assert (=> d!3945 (= lt!7568 e!14536)))

(declare-fun c!2715 () Bool)

(declare-datatypes ((List!564 0))(
  ( (Nil!561) (Cons!560 (h!1126 tuple2!922) (t!3231 List!564)) )
))
(declare-datatypes ((ListLongMap!563 0))(
  ( (ListLongMap!564 (toList!297 List!564)) )
))
(declare-fun map!399 (LongMapFixedSize!192) ListLongMap!563)

(assert (=> d!3945 (= c!2715 (not (= (map!399 lt!7588) (ListLongMap!564 Nil!561))))))

(declare-fun lt!7585 () Unit!488)

(declare-fun lt!7570 () Unit!488)

(assert (=> d!3945 (= lt!7585 lt!7570)))

(declare-fun lt!7583 () array!1245)

(declare-fun lt!7574 () (_ BitVec 32))

(declare-datatypes ((List!565 0))(
  ( (Nil!562) (Cons!561 (h!1127 (_ BitVec 64)) (t!3232 List!565)) )
))
(declare-fun lt!7569 () List!565)

(declare-fun arrayNoDuplicates!0 (array!1245 (_ BitVec 32) List!565) Bool)

(assert (=> d!3945 (arrayNoDuplicates!0 lt!7583 lt!7574 lt!7569)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1245 (_ BitVec 32) (_ BitVec 32) List!565) Unit!488)

(assert (=> d!3945 (= lt!7570 (lemmaArrayNoDuplicatesInAll0Array!0 lt!7583 lt!7574 (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) lt!7569))))

(assert (=> d!3945 (= lt!7569 Nil!562)))

(assert (=> d!3945 (= lt!7574 #b00000000000000000000000000000000)))

(assert (=> d!3945 (= lt!7583 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7575 () Unit!488)

(declare-fun lt!7572 () Unit!488)

(assert (=> d!3945 (= lt!7575 lt!7572)))

(declare-fun lt!7581 () (_ BitVec 32))

(declare-fun lt!7579 () array!1245)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1245 (_ BitVec 32)) Bool)

(assert (=> d!3945 (arrayForallSeekEntryOrOpenFound!0 lt!7581 lt!7579 (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1245 (_ BitVec 32) (_ BitVec 32)) Unit!488)

(assert (=> d!3945 (= lt!7572 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!7579 (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) lt!7581))))

(assert (=> d!3945 (= lt!7581 #b00000000000000000000000000000000)))

(assert (=> d!3945 (= lt!7579 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7586 () Unit!488)

(declare-fun lt!7580 () Unit!488)

(assert (=> d!3945 (= lt!7586 lt!7580)))

(declare-fun lt!7578 () array!1245)

(declare-fun lt!7571 () (_ BitVec 32))

(declare-fun lt!7573 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1245 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3945 (= (arrayCountValidKeys!0 lt!7578 lt!7571 lt!7573) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1245 (_ BitVec 32) (_ BitVec 32)) Unit!488)

(assert (=> d!3945 (= lt!7580 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!7578 lt!7571 lt!7573))))

(assert (=> d!3945 (= lt!7573 (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3945 (= lt!7571 #b00000000000000000000000000000000)))

(assert (=> d!3945 (= lt!7578 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!142 (Int (_ BitVec 64)) V!1165)

(assert (=> d!3945 (= lt!7588 (LongMapFixedSize!193 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!142 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) (array!1244 ((as const (Array (_ BitVec 32) ValueCell!303)) EmptyCell!303) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3945 (validMask!0 (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))))))

(assert (=> d!3945 (= (getNewLongMapFixedSize!27 (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))) lt!7582)))

(declare-fun b!22370 () Bool)

(declare-fun Unit!490 () Unit!488)

(assert (=> b!22370 (= e!14536 Unit!490)))

(declare-fun b!22371 () Bool)

(assert (=> b!22371 (= e!14537 (= (map!399 lt!7582) (ListLongMap!564 Nil!561)))))

(declare-fun b!22372 () Bool)

(declare-fun Unit!491 () Unit!488)

(assert (=> b!22372 (= e!14536 Unit!491)))

(declare-fun head!828 (List!564) tuple2!922)

(assert (=> b!22372 (= lt!7589 (head!828 (toList!297 (map!399 lt!7588))))))

(assert (=> b!22372 (= lt!7590 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22372 (= lt!7584 #b00000000000000000000000000000000)))

(declare-fun lt!7577 () Unit!488)

(declare-fun lemmaKeyInListMapIsInArray!89 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 64) Int) Unit!488)

(assert (=> b!22372 (= lt!7577 (lemmaKeyInListMapIsInArray!89 lt!7590 (array!1244 ((as const (Array (_ BitVec 32) ValueCell!303)) EmptyCell!303) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) lt!7584 (dynLambda!142 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!467 lt!7589) (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun c!2714 () Bool)

(assert (=> b!22372 (= c!2714 (and (not (= (_1!467 lt!7589) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!467 lt!7589) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22372 e!14538))

(declare-fun lt!7576 () Unit!488)

(assert (=> b!22372 (= lt!7576 lt!7577)))

(declare-fun lt!7587 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1245 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22372 (= lt!7587 (arrayScanForKey!0 (array!1246 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) (_1!467 lt!7589) #b00000000000000000000000000000000))))

(assert (=> b!22372 false))

(declare-fun b!22373 () Bool)

(declare-fun res!14157 () Bool)

(assert (=> b!22373 (=> (not res!14157) (not e!14537))))

(assert (=> b!22373 (= res!14157 (= (mask!4712 lt!7582) (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938))))))))

(assert (= (and d!3945 c!2715) b!22372))

(assert (= (and d!3945 (not c!2715)) b!22370))

(assert (= (and b!22372 c!2714) b!22368))

(assert (= (and b!22372 (not c!2714)) b!22369))

(assert (= (and d!3945 res!14158) b!22373))

(assert (= (and b!22373 res!14157) b!22371))

(declare-fun b_lambda!1555 () Bool)

(assert (=> (not b_lambda!1555) (not d!3945)))

(declare-fun t!3230 () Bool)

(declare-fun tb!653 () Bool)

(assert (=> (and b!22295 (= (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))) t!3230) tb!653))

(declare-fun result!1081 () Bool)

(assert (=> tb!653 (= result!1081 tp_is_empty!1005)))

(assert (=> d!3945 t!3230))

(declare-fun b_and!1457 () Bool)

(assert (= b_and!1453 (and (=> t!3230 result!1081) b_and!1457)))

(declare-fun b_lambda!1557 () Bool)

(assert (=> (not b_lambda!1557) (not b!22372)))

(assert (=> b!22372 t!3230))

(declare-fun b_and!1459 () Bool)

(assert (= b_and!1457 (and (=> t!3230 result!1081) b_and!1459)))

(declare-fun m!16240 () Bool)

(assert (=> b!22368 m!16240))

(declare-fun m!16242 () Bool)

(assert (=> d!3945 m!16242))

(assert (=> d!3945 m!16216))

(declare-fun m!16244 () Bool)

(assert (=> d!3945 m!16244))

(assert (=> d!3945 m!16216))

(declare-fun m!16246 () Bool)

(assert (=> d!3945 m!16246))

(declare-fun m!16248 () Bool)

(assert (=> d!3945 m!16248))

(declare-fun m!16250 () Bool)

(assert (=> d!3945 m!16250))

(assert (=> d!3945 m!16216))

(declare-fun m!16252 () Bool)

(assert (=> d!3945 m!16252))

(declare-fun m!16254 () Bool)

(assert (=> d!3945 m!16254))

(declare-fun m!16256 () Bool)

(assert (=> d!3945 m!16256))

(declare-fun m!16258 () Bool)

(assert (=> d!3945 m!16258))

(declare-fun m!16260 () Bool)

(assert (=> d!3945 m!16260))

(declare-fun m!16262 () Bool)

(assert (=> b!22371 m!16262))

(declare-fun m!16264 () Bool)

(assert (=> b!22372 m!16264))

(declare-fun m!16266 () Bool)

(assert (=> b!22372 m!16266))

(assert (=> b!22372 m!16260))

(assert (=> b!22372 m!16216))

(assert (=> b!22372 m!16248))

(assert (=> b!22372 m!16248))

(declare-fun m!16268 () Bool)

(assert (=> b!22372 m!16268))

(assert (=> b!22372 m!16248))

(assert (=> b!22297 d!3945))

(declare-fun d!3947 () Bool)

(declare-fun e!14543 () Bool)

(assert (=> d!3947 e!14543))

(declare-fun res!14161 () Bool)

(assert (=> d!3947 (=> (not res!14161) (not e!14543))))

(declare-fun lt!7595 () (_ BitVec 32))

(assert (=> d!3947 (= res!14161 (validMask!0 lt!7595))))

(declare-datatypes ((tuple2!924 0))(
  ( (tuple2!925 (_1!468 Unit!488) (_2!468 (_ BitVec 32))) )
))
(declare-fun e!14544 () tuple2!924)

(assert (=> d!3947 (= lt!7595 (_2!468 e!14544))))

(declare-fun c!2718 () Bool)

(declare-fun lt!7596 () tuple2!924)

(assert (=> d!3947 (= c!2718 (and (bvsgt (_2!468 lt!7596) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!139 (v!1584 (underlying!107 thiss!938)))) (_2!468 lt!7596)) (bvsge (bvadd (bvand (bvashr (_2!468 lt!7596) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!139 (v!1584 (underlying!107 thiss!938))))))))

(declare-fun Unit!492 () Unit!488)

(declare-fun Unit!493 () Unit!488)

(assert (=> d!3947 (= lt!7596 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!139 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))))) (mask!4712 (v!1584 (underlying!107 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!139 (v!1584 (underlying!107 thiss!938)))) (mask!4712 (v!1584 (underlying!107 thiss!938))))) (tuple2!925 Unit!492 (bvand (bvadd (bvshl (mask!4712 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!925 Unit!493 (mask!4712 (v!1584 (underlying!107 thiss!938))))))))

(assert (=> d!3947 (validMask!0 (mask!4712 (v!1584 (underlying!107 thiss!938))))))

(assert (=> d!3947 (= (computeNewMask!23 thiss!938 (mask!4712 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (_size!139 (v!1584 (underlying!107 thiss!938)))) lt!7595)))

(declare-fun b!22382 () Bool)

(declare-fun computeNewMaskWhile!12 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!924)

(assert (=> b!22382 (= e!14544 (computeNewMaskWhile!12 (_size!139 (v!1584 (underlying!107 thiss!938))) (_vacant!139 (v!1584 (underlying!107 thiss!938))) (mask!4712 (v!1584 (underlying!107 thiss!938))) (_2!468 lt!7596)))))

(declare-fun b!22383 () Bool)

(declare-fun Unit!494 () Unit!488)

(assert (=> b!22383 (= e!14544 (tuple2!925 Unit!494 (_2!468 lt!7596)))))

(declare-fun b!22384 () Bool)

(assert (=> b!22384 (= e!14543 (bvsle (_size!139 (v!1584 (underlying!107 thiss!938))) (bvadd lt!7595 #b00000000000000000000000000000001)))))

(assert (= (and d!3947 c!2718) b!22382))

(assert (= (and d!3947 (not c!2718)) b!22383))

(assert (= (and d!3947 res!14161) b!22384))

(declare-fun m!16270 () Bool)

(assert (=> d!3947 m!16270))

(declare-fun m!16272 () Bool)

(assert (=> d!3947 m!16272))

(declare-fun m!16274 () Bool)

(assert (=> b!22382 m!16274))

(assert (=> b!22297 d!3947))

(declare-fun b!22469 () Bool)

(declare-fun res!14202 () Bool)

(declare-fun e!14609 () Bool)

(assert (=> b!22469 (=> (not res!14202) (not e!14609))))

(declare-datatypes ((SeekEntryResult!52 0))(
  ( (MissingZero!52 (index!2329 (_ BitVec 32))) (Found!52 (index!2330 (_ BitVec 32))) (Intermediate!52 (undefined!864 Bool) (index!2331 (_ BitVec 32)) (x!5422 (_ BitVec 32))) (Undefined!52) (MissingVacant!52 (index!2332 (_ BitVec 32))) )
))
(declare-fun lt!7660 () SeekEntryResult!52)

(assert (=> b!22469 (= res!14202 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2329 lt!7660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1623 () Bool)

(declare-fun call!1632 () ListLongMap!563)

(declare-fun lt!7656 () tuple2!914)

(assert (=> bm!1623 (= call!1632 (map!399 (_2!461 lt!7656)))))

(declare-fun b!22470 () Bool)

(declare-fun e!14605 () Bool)

(declare-fun e!14606 () Bool)

(assert (=> b!22470 (= e!14605 e!14606)))

(declare-fun res!14197 () Bool)

(declare-fun contains!228 (ListLongMap!563 (_ BitVec 64)) Bool)

(assert (=> b!22470 (= res!14197 (contains!228 call!1632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22470 (=> (not res!14197) (not e!14606))))

(declare-fun b!22471 () Bool)

(declare-fun e!14598 () tuple2!914)

(declare-fun e!14595 () tuple2!914)

(assert (=> b!22471 (= e!14598 e!14595)))

(declare-fun lt!7673 () SeekEntryResult!52)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1245 (_ BitVec 32)) SeekEntryResult!52)

(assert (=> b!22471 (= lt!7673 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3155 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487))))))

(declare-fun c!2753 () Bool)

(assert (=> b!22471 (= c!2753 ((_ is Undefined!52) lt!7673))))

(declare-fun bm!1624 () Bool)

(declare-fun call!1647 () Bool)

(assert (=> bm!1624 (= call!1647 (arrayContainsKey!0 (_keys!3155 (_2!461 lt!7487)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1625 () Bool)

(declare-fun c!2758 () Bool)

(assert (=> bm!1625 (= c!2758 c!2753)))

(declare-fun call!1638 () Bool)

(declare-fun e!14601 () ListLongMap!563)

(assert (=> bm!1625 (= call!1638 (contains!228 e!14601 (ite c!2753 #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2330 lt!7673)))))))

(declare-fun b!22472 () Bool)

(declare-fun c!2749 () Bool)

(declare-fun lt!7663 () SeekEntryResult!52)

(assert (=> b!22472 (= c!2749 ((_ is MissingVacant!52) lt!7663))))

(declare-fun e!14590 () Bool)

(declare-fun e!14593 () Bool)

(assert (=> b!22472 (= e!14590 e!14593)))

(declare-fun b!22473 () Bool)

(declare-fun res!14196 () Bool)

(declare-fun call!1641 () Bool)

(assert (=> b!22473 (= res!14196 call!1641)))

(declare-fun e!14610 () Bool)

(assert (=> b!22473 (=> (not res!14196) (not e!14610))))

(declare-fun b!22474 () Bool)

(declare-fun e!14594 () Bool)

(assert (=> b!22474 (= e!14594 e!14605)))

(declare-fun c!2750 () Bool)

(assert (=> b!22474 (= c!2750 (_1!461 lt!7656))))

(declare-fun bm!1626 () Bool)

(declare-fun call!1631 () Unit!488)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 64) Int) Unit!488)

(assert (=> bm!1626 (= call!1631 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun b!22475 () Bool)

(declare-fun lt!7667 () Unit!488)

(declare-fun e!14602 () Unit!488)

(assert (=> b!22475 (= lt!7667 e!14602)))

(declare-fun c!2754 () Bool)

(assert (=> b!22475 (= c!2754 call!1638)))

(assert (=> b!22475 (= e!14595 (tuple2!915 false (_2!461 lt!7487)))))

(declare-fun b!22476 () Bool)

(declare-fun call!1644 () ListLongMap!563)

(assert (=> b!22476 (= e!14601 call!1644)))

(declare-fun b!22477 () Bool)

(declare-fun lt!7676 () Unit!488)

(declare-fun lt!7655 () Unit!488)

(assert (=> b!22477 (= lt!7676 lt!7655)))

(declare-fun call!1646 () ListLongMap!563)

(declare-fun call!1637 () ListLongMap!563)

(assert (=> b!22477 (= call!1646 call!1637)))

(declare-fun lt!7658 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 V!1165 Int) Unit!488)

(assert (=> b!22477 (= lt!7655 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) lt!7658 (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (_2!461 lt!7487)) (defaultEntry!1732 (_2!461 lt!7487))))))

(assert (=> b!22477 (= lt!7658 (bvor (extraKeys!1632 (_2!461 lt!7487)) #b00000000000000000000000000000001))))

(declare-fun e!14592 () tuple2!914)

(assert (=> b!22477 (= e!14592 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (bvor (extraKeys!1632 (_2!461 lt!7487)) #b00000000000000000000000000000001) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (_2!461 lt!7487)) (_size!139 (_2!461 lt!7487)) (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (_vacant!139 (_2!461 lt!7487)))))))

(declare-fun b!22478 () Bool)

(declare-fun e!14589 () tuple2!914)

(declare-fun lt!7665 () tuple2!914)

(assert (=> b!22478 (= e!14589 (tuple2!915 (_1!461 lt!7665) (_2!461 lt!7665)))))

(declare-fun call!1635 () tuple2!914)

(assert (=> b!22478 (= lt!7665 call!1635)))

(declare-fun bm!1627 () Bool)

(declare-fun call!1627 () ListLongMap!563)

(assert (=> bm!1627 (= call!1627 (map!399 (_2!461 lt!7487)))))

(declare-fun bm!1628 () Bool)

(declare-fun call!1626 () SeekEntryResult!52)

(declare-fun call!1639 () SeekEntryResult!52)

(assert (=> bm!1628 (= call!1626 call!1639)))

(declare-fun b!22479 () Bool)

(declare-fun c!2752 () Bool)

(assert (=> b!22479 (= c!2752 ((_ is MissingVacant!52) lt!7660))))

(declare-fun e!14603 () Bool)

(declare-fun e!14591 () Bool)

(assert (=> b!22479 (= e!14603 e!14591)))

(declare-fun b!22480 () Bool)

(declare-fun Unit!495 () Unit!488)

(assert (=> b!22480 (= e!14602 Unit!495)))

(declare-fun lt!7670 () Unit!488)

(declare-fun call!1648 () Unit!488)

(assert (=> b!22480 (= lt!7670 call!1648)))

(declare-fun lt!7664 () SeekEntryResult!52)

(assert (=> b!22480 (= lt!7664 call!1626)))

(declare-fun res!14193 () Bool)

(assert (=> b!22480 (= res!14193 ((_ is Found!52) lt!7664))))

(declare-fun e!14599 () Bool)

(assert (=> b!22480 (=> (not res!14193) (not e!14599))))

(assert (=> b!22480 e!14599))

(declare-fun lt!7677 () Unit!488)

(assert (=> b!22480 (= lt!7677 lt!7670)))

(assert (=> b!22480 false))

(declare-fun b!22481 () Bool)

(declare-fun e!14607 () Bool)

(declare-fun call!1643 () Bool)

(assert (=> b!22481 (= e!14607 (not call!1643))))

(declare-fun b!22482 () Bool)

(declare-fun lt!7674 () tuple2!914)

(assert (=> b!22482 (= lt!7674 call!1635)))

(declare-fun e!14597 () tuple2!914)

(assert (=> b!22482 (= e!14597 (tuple2!915 (_1!461 lt!7674) (_2!461 lt!7674)))))

(declare-fun c!2755 () Bool)

(declare-fun c!2757 () Bool)

(declare-fun bm!1629 () Bool)

(declare-fun c!2756 () Bool)

(declare-fun call!1629 () Bool)

(declare-fun lt!7659 () SeekEntryResult!52)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1629 (= call!1629 (inRange!0 (ite c!2753 (ite c!2754 (index!2330 lt!7664) (ite c!2755 (index!2329 lt!7663) (index!2332 lt!7663))) (ite c!2756 (index!2330 lt!7659) (ite c!2757 (index!2329 lt!7660) (index!2332 lt!7660)))) (mask!4712 (_2!461 lt!7487))))))

(declare-fun b!22483 () Bool)

(declare-fun res!14190 () Bool)

(assert (=> b!22483 (= res!14190 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2332 lt!7660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14604 () Bool)

(assert (=> b!22483 (=> (not res!14190) (not e!14604))))

(declare-fun bm!1630 () Bool)

(declare-fun call!1634 () ListLongMap!563)

(assert (=> bm!1630 (= call!1644 call!1634)))

(declare-fun bm!1631 () Bool)

(declare-fun call!1628 () SeekEntryResult!52)

(assert (=> bm!1631 (= call!1628 call!1639)))

(declare-fun b!22484 () Bool)

(assert (=> b!22484 (= e!14599 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2330 lt!7664)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!2747 () Bool)

(declare-fun bm!1632 () Bool)

(declare-fun lt!7666 () (_ BitVec 32))

(declare-fun lt!7657 () array!1243)

(declare-fun call!1649 () ListLongMap!563)

(declare-fun c!2748 () Bool)

(declare-fun getCurrentListMap!128 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 32) Int) ListLongMap!563)

(assert (=> bm!1632 (= call!1649 (getCurrentListMap!128 (_keys!3155 (_2!461 lt!7487)) (ite c!2747 (_values!1720 (_2!461 lt!7487)) lt!7657) (mask!4712 (_2!461 lt!7487)) (ite c!2747 (ite c!2748 lt!7658 lt!7666) (extraKeys!1632 (_2!461 lt!7487))) (ite (and c!2747 c!2748) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (zeroValue!1657 (_2!461 lt!7487))) (ite c!2747 (ite c!2748 (minValue!1657 (_2!461 lt!7487)) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (minValue!1657 (_2!461 lt!7487))) #b00000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun b!22485 () Bool)

(declare-fun call!1645 () Bool)

(assert (=> b!22485 (= e!14604 (not call!1645))))

(declare-fun b!22486 () Bool)

(declare-fun res!14198 () Bool)

(declare-fun call!1640 () Bool)

(assert (=> b!22486 (= res!14198 call!1640)))

(assert (=> b!22486 (=> (not res!14198) (not e!14599))))

(declare-fun b!22487 () Bool)

(assert (=> b!22487 (= e!14609 (not call!1645))))

(declare-fun b!22488 () Bool)

(declare-fun +!43 (ListLongMap!563 tuple2!922) ListLongMap!563)

(assert (=> b!22488 (= e!14606 (= call!1632 (+!43 call!1627 (tuple2!923 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun b!22489 () Bool)

(assert (=> b!22489 (= e!14601 call!1649)))

(declare-fun b!22490 () Bool)

(declare-fun res!14201 () Bool)

(assert (=> b!22490 (= res!14201 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2332 lt!7663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14608 () Bool)

(assert (=> b!22490 (=> (not res!14201) (not e!14608))))

(declare-fun b!22491 () Bool)

(declare-fun e!14600 () Unit!488)

(declare-fun Unit!496 () Unit!488)

(assert (=> b!22491 (= e!14600 Unit!496)))

(declare-fun lt!7668 () Unit!488)

(assert (=> b!22491 (= lt!7668 call!1631)))

(assert (=> b!22491 (= lt!7660 call!1628)))

(assert (=> b!22491 (= c!2757 ((_ is MissingZero!52) lt!7660))))

(assert (=> b!22491 e!14603))

(declare-fun lt!7661 () Unit!488)

(assert (=> b!22491 (= lt!7661 lt!7668)))

(assert (=> b!22491 false))

(declare-fun bm!1633 () Bool)

(assert (=> bm!1633 (= call!1645 call!1647)))

(declare-fun bm!1634 () Bool)

(assert (=> bm!1634 (= call!1634 (getCurrentListMap!128 (_keys!3155 (_2!461 lt!7487)) (ite (or c!2747 c!2753) (_values!1720 (_2!461 lt!7487)) (array!1244 (store (arr!589 (_values!1720 (_2!461 lt!7487))) (index!2330 lt!7673) (ValueCellFull!303 (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (size!685 (_values!1720 (_2!461 lt!7487))))) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) #b00000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun b!22492 () Bool)

(declare-fun res!14199 () Bool)

(assert (=> b!22492 (=> (not res!14199) (not e!14607))))

(assert (=> b!22492 (= res!14199 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2329 lt!7663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1635 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 64) Int) Unit!488)

(assert (=> bm!1635 (= call!1648 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun b!22493 () Bool)

(declare-fun e!14596 () ListLongMap!563)

(declare-fun call!1630 () ListLongMap!563)

(assert (=> b!22493 (= e!14596 call!1630)))

(declare-fun b!22494 () Bool)

(declare-fun lt!7654 () Unit!488)

(declare-fun lt!7675 () Unit!488)

(assert (=> b!22494 (= lt!7654 lt!7675)))

(assert (=> b!22494 call!1638))

(declare-fun lemmaValidKeyInArrayIsInListMap!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 32) Int) Unit!488)

(assert (=> b!22494 (= lt!7675 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3155 (_2!461 lt!7487)) lt!7657 (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) (index!2330 lt!7673) (defaultEntry!1732 (_2!461 lt!7487))))))

(assert (=> b!22494 (= lt!7657 (array!1244 (store (arr!589 (_values!1720 (_2!461 lt!7487))) (index!2330 lt!7673) (ValueCellFull!303 (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (size!685 (_values!1720 (_2!461 lt!7487)))))))

(declare-fun lt!7652 () Unit!488)

(declare-fun lt!7671 () Unit!488)

(assert (=> b!22494 (= lt!7652 lt!7671)))

(declare-fun call!1636 () ListLongMap!563)

(assert (=> b!22494 (= call!1636 call!1644)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 32) (_ BitVec 64) V!1165 Int) Unit!488)

(assert (=> b!22494 (= lt!7671 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) (index!2330 lt!7673) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938))) (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun lt!7669 () Unit!488)

(assert (=> b!22494 (= lt!7669 e!14600)))

(assert (=> b!22494 (= c!2756 (contains!228 (getCurrentListMap!128 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) #b00000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22494 (= e!14597 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) (_size!139 (_2!461 lt!7487)) (_keys!3155 (_2!461 lt!7487)) (array!1244 (store (arr!589 (_values!1720 (_2!461 lt!7487))) (index!2330 lt!7673) (ValueCellFull!303 (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (size!685 (_values!1720 (_2!461 lt!7487)))) (_vacant!139 (_2!461 lt!7487)))))))

(declare-fun d!3949 () Bool)

(assert (=> d!3949 e!14594))

(declare-fun res!14195 () Bool)

(assert (=> d!3949 (=> (not res!14195) (not e!14594))))

(assert (=> d!3949 (= res!14195 (valid!97 (_2!461 lt!7656)))))

(assert (=> d!3949 (= lt!7656 e!14598)))

(assert (=> d!3949 (= c!2747 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3949 (valid!97 (_2!461 lt!7487))))

(assert (=> d!3949 (= (update!26 (_2!461 lt!7487) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938)))) lt!7656)))

(declare-fun bm!1636 () Bool)

(assert (=> bm!1636 (= call!1636 (+!43 e!14596 (ite c!2747 (ite c!2748 (tuple2!923 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (tuple2!923 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun c!2751 () Bool)

(assert (=> bm!1636 (= c!2751 c!2747)))

(declare-fun bm!1637 () Bool)

(assert (=> bm!1637 (= call!1630 call!1634)))

(declare-fun bm!1638 () Bool)

(assert (=> bm!1638 (= call!1637 call!1649)))

(declare-fun b!22495 () Bool)

(assert (=> b!22495 (= e!14591 e!14604)))

(declare-fun res!14194 () Bool)

(declare-fun call!1642 () Bool)

(assert (=> b!22495 (= res!14194 call!1642)))

(assert (=> b!22495 (=> (not res!14194) (not e!14604))))

(declare-fun b!22496 () Bool)

(declare-fun lt!7653 () Unit!488)

(assert (=> b!22496 (= e!14600 lt!7653)))

(assert (=> b!22496 (= lt!7653 call!1648)))

(assert (=> b!22496 (= lt!7659 call!1628)))

(declare-fun res!14200 () Bool)

(assert (=> b!22496 (= res!14200 ((_ is Found!52) lt!7659))))

(assert (=> b!22496 (=> (not res!14200) (not e!14610))))

(assert (=> b!22496 e!14610))

(declare-fun b!22497 () Bool)

(assert (=> b!22497 (= e!14593 e!14608)))

(declare-fun res!14192 () Bool)

(declare-fun call!1633 () Bool)

(assert (=> b!22497 (= res!14192 call!1633)))

(assert (=> b!22497 (=> (not res!14192) (not e!14608))))

(declare-fun b!22498 () Bool)

(assert (=> b!22498 (= e!14598 e!14592)))

(assert (=> b!22498 (= c!2748 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22499 () Bool)

(declare-fun lt!7662 () Unit!488)

(declare-fun lt!7651 () Unit!488)

(assert (=> b!22499 (= lt!7662 lt!7651)))

(assert (=> b!22499 (= call!1646 call!1637)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 V!1165 Int) Unit!488)

(assert (=> b!22499 (= lt!7651 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) lt!7666 (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (defaultEntry!1732 (_2!461 lt!7487))))))

(assert (=> b!22499 (= lt!7666 (bvor (extraKeys!1632 (_2!461 lt!7487)) #b00000000000000000000000000000010))))

(assert (=> b!22499 (= e!14592 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (bvor (extraKeys!1632 (_2!461 lt!7487)) #b00000000000000000000000000000010) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (_size!139 (_2!461 lt!7487)) (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (_vacant!139 (_2!461 lt!7487)))))))

(declare-fun b!22500 () Bool)

(assert (=> b!22500 (= e!14591 ((_ is Undefined!52) lt!7660))))

(declare-fun bm!1639 () Bool)

(assert (=> bm!1639 (= call!1643 call!1647)))

(declare-fun bm!1640 () Bool)

(assert (=> bm!1640 (= call!1639 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3155 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487))))))

(declare-fun bm!1641 () Bool)

(assert (=> bm!1641 (= call!1633 call!1640)))

(declare-fun b!22501 () Bool)

(assert (=> b!22501 (= e!14608 (not call!1643))))

(declare-fun b!22502 () Bool)

(assert (=> b!22502 (= e!14610 (= (select (arr!590 (_keys!3155 (_2!461 lt!7487))) (index!2330 lt!7659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1642 () Bool)

(assert (=> bm!1642 (= call!1642 call!1641)))

(declare-fun bm!1643 () Bool)

(declare-fun c!2760 () Bool)

(declare-fun updateHelperNewKey!8 (LongMapFixedSize!192 (_ BitVec 64) V!1165 (_ BitVec 32)) tuple2!914)

(assert (=> bm!1643 (= call!1635 (updateHelperNewKey!8 (_2!461 lt!7487) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1657 (v!1584 (underlying!107 thiss!938))) (ite c!2760 (index!2332 lt!7673) (index!2329 lt!7673))))))

(declare-fun b!22503 () Bool)

(declare-fun res!14191 () Bool)

(assert (=> b!22503 (=> (not res!14191) (not e!14607))))

(assert (=> b!22503 (= res!14191 call!1633)))

(assert (=> b!22503 (= e!14590 e!14607)))

(declare-fun bm!1644 () Bool)

(assert (=> bm!1644 (= call!1646 call!1636)))

(declare-fun bm!1645 () Bool)

(assert (=> bm!1645 (= call!1641 call!1629)))

(declare-fun b!22504 () Bool)

(assert (=> b!22504 (= e!14593 ((_ is Undefined!52) lt!7663))))

(declare-fun b!22505 () Bool)

(declare-fun lt!7672 () Unit!488)

(assert (=> b!22505 (= e!14602 lt!7672)))

(assert (=> b!22505 (= lt!7672 call!1631)))

(assert (=> b!22505 (= lt!7663 call!1626)))

(assert (=> b!22505 (= c!2755 ((_ is MissingZero!52) lt!7663))))

(assert (=> b!22505 e!14590))

(declare-fun b!22506 () Bool)

(declare-fun res!14203 () Bool)

(assert (=> b!22506 (=> (not res!14203) (not e!14609))))

(assert (=> b!22506 (= res!14203 call!1642)))

(assert (=> b!22506 (= e!14603 e!14609)))

(declare-fun bm!1646 () Bool)

(assert (=> bm!1646 (= call!1640 call!1629)))

(declare-fun b!22507 () Bool)

(assert (=> b!22507 (= e!14589 e!14597)))

(declare-fun c!2759 () Bool)

(assert (=> b!22507 (= c!2759 ((_ is MissingZero!52) lt!7673))))

(declare-fun b!22508 () Bool)

(assert (=> b!22508 (= e!14596 (getCurrentListMap!128 (_keys!3155 (_2!461 lt!7487)) (_values!1720 (_2!461 lt!7487)) (mask!4712 (_2!461 lt!7487)) (extraKeys!1632 (_2!461 lt!7487)) (zeroValue!1657 (_2!461 lt!7487)) (minValue!1657 (_2!461 lt!7487)) #b00000000000000000000000000000000 (defaultEntry!1732 (_2!461 lt!7487))))))

(declare-fun b!22509 () Bool)

(assert (=> b!22509 (= c!2760 ((_ is MissingVacant!52) lt!7673))))

(assert (=> b!22509 (= e!14595 e!14589)))

(declare-fun b!22510 () Bool)

(assert (=> b!22510 (= e!14605 (= call!1632 call!1627))))

(assert (= (and d!3949 c!2747) b!22498))

(assert (= (and d!3949 (not c!2747)) b!22471))

(assert (= (and b!22498 c!2748) b!22477))

(assert (= (and b!22498 (not c!2748)) b!22499))

(assert (= (or b!22477 b!22499) bm!1638))

(assert (= (or b!22477 b!22499) bm!1637))

(assert (= (or b!22477 b!22499) bm!1644))

(assert (= (and b!22471 c!2753) b!22475))

(assert (= (and b!22471 (not c!2753)) b!22509))

(assert (= (and b!22475 c!2754) b!22480))

(assert (= (and b!22475 (not c!2754)) b!22505))

(assert (= (and b!22480 res!14193) b!22486))

(assert (= (and b!22486 res!14198) b!22484))

(assert (= (and b!22505 c!2755) b!22503))

(assert (= (and b!22505 (not c!2755)) b!22472))

(assert (= (and b!22503 res!14191) b!22492))

(assert (= (and b!22492 res!14199) b!22481))

(assert (= (and b!22472 c!2749) b!22497))

(assert (= (and b!22472 (not c!2749)) b!22504))

(assert (= (and b!22497 res!14192) b!22490))

(assert (= (and b!22490 res!14201) b!22501))

(assert (= (or b!22503 b!22497) bm!1641))

(assert (= (or b!22481 b!22501) bm!1639))

(assert (= (or b!22486 bm!1641) bm!1646))

(assert (= (or b!22480 b!22505) bm!1628))

(assert (= (and b!22509 c!2760) b!22478))

(assert (= (and b!22509 (not c!2760)) b!22507))

(assert (= (and b!22507 c!2759) b!22482))

(assert (= (and b!22507 (not c!2759)) b!22494))

(assert (= (and b!22494 c!2756) b!22496))

(assert (= (and b!22494 (not c!2756)) b!22491))

(assert (= (and b!22496 res!14200) b!22473))

(assert (= (and b!22473 res!14196) b!22502))

(assert (= (and b!22491 c!2757) b!22506))

(assert (= (and b!22491 (not c!2757)) b!22479))

(assert (= (and b!22506 res!14203) b!22469))

(assert (= (and b!22469 res!14202) b!22487))

(assert (= (and b!22479 c!2752) b!22495))

(assert (= (and b!22479 (not c!2752)) b!22500))

(assert (= (and b!22495 res!14194) b!22483))

(assert (= (and b!22483 res!14190) b!22485))

(assert (= (or b!22506 b!22495) bm!1642))

(assert (= (or b!22487 b!22485) bm!1633))

(assert (= (or b!22473 bm!1642) bm!1645))

(assert (= (or b!22496 b!22491) bm!1631))

(assert (= (or b!22478 b!22482) bm!1643))

(assert (= (or b!22475 b!22494) bm!1630))

(assert (= (or bm!1628 bm!1631) bm!1640))

(assert (= (or b!22480 b!22496) bm!1635))

(assert (= (or bm!1639 bm!1633) bm!1624))

(assert (= (or b!22505 b!22491) bm!1626))

(assert (= (or bm!1646 bm!1645) bm!1629))

(assert (= (or b!22475 b!22494) bm!1625))

(assert (= (and bm!1625 c!2758) b!22476))

(assert (= (and bm!1625 (not c!2758)) b!22489))

(assert (= (or bm!1638 b!22489) bm!1632))

(assert (= (or bm!1637 bm!1630) bm!1634))

(assert (= (or bm!1644 b!22494) bm!1636))

(assert (= (and bm!1636 c!2751) b!22493))

(assert (= (and bm!1636 (not c!2751)) b!22508))

(assert (= (and d!3949 res!14195) b!22474))

(assert (= (and b!22474 c!2750) b!22470))

(assert (= (and b!22474 (not c!2750)) b!22510))

(assert (= (and b!22470 res!14197) b!22488))

(assert (= (or b!22470 b!22488 b!22510) bm!1623))

(assert (= (or b!22488 b!22510) bm!1627))

(declare-fun m!16276 () Bool)

(assert (=> bm!1635 m!16276))

(declare-fun m!16278 () Bool)

(assert (=> b!22490 m!16278))

(declare-fun m!16280 () Bool)

(assert (=> bm!1636 m!16280))

(declare-fun m!16282 () Bool)

(assert (=> bm!1627 m!16282))

(declare-fun m!16284 () Bool)

(assert (=> b!22484 m!16284))

(declare-fun m!16286 () Bool)

(assert (=> b!22471 m!16286))

(declare-fun m!16288 () Bool)

(assert (=> bm!1625 m!16288))

(declare-fun m!16290 () Bool)

(assert (=> bm!1625 m!16290))

(declare-fun m!16292 () Bool)

(assert (=> bm!1634 m!16292))

(declare-fun m!16294 () Bool)

(assert (=> bm!1634 m!16294))

(declare-fun m!16296 () Bool)

(assert (=> b!22494 m!16296))

(declare-fun m!16298 () Bool)

(assert (=> b!22494 m!16298))

(assert (=> b!22494 m!16296))

(declare-fun m!16300 () Bool)

(assert (=> b!22494 m!16300))

(declare-fun m!16302 () Bool)

(assert (=> b!22494 m!16302))

(assert (=> b!22494 m!16292))

(declare-fun m!16304 () Bool)

(assert (=> bm!1626 m!16304))

(declare-fun m!16306 () Bool)

(assert (=> bm!1623 m!16306))

(assert (=> bm!1640 m!16286))

(declare-fun m!16308 () Bool)

(assert (=> b!22469 m!16308))

(declare-fun m!16310 () Bool)

(assert (=> b!22483 m!16310))

(declare-fun m!16312 () Bool)

(assert (=> bm!1632 m!16312))

(declare-fun m!16314 () Bool)

(assert (=> b!22499 m!16314))

(declare-fun m!16316 () Bool)

(assert (=> bm!1629 m!16316))

(declare-fun m!16318 () Bool)

(assert (=> b!22477 m!16318))

(declare-fun m!16320 () Bool)

(assert (=> d!3949 m!16320))

(declare-fun m!16322 () Bool)

(assert (=> d!3949 m!16322))

(declare-fun m!16324 () Bool)

(assert (=> b!22492 m!16324))

(assert (=> b!22508 m!16296))

(declare-fun m!16326 () Bool)

(assert (=> b!22488 m!16326))

(declare-fun m!16328 () Bool)

(assert (=> bm!1643 m!16328))

(declare-fun m!16330 () Bool)

(assert (=> b!22470 m!16330))

(declare-fun m!16332 () Bool)

(assert (=> bm!1624 m!16332))

(declare-fun m!16334 () Bool)

(assert (=> b!22502 m!16334))

(assert (=> b!22303 d!3949))

(declare-fun lt!7750 () V!1165)

(declare-fun call!1683 () ListLongMap!563)

(declare-fun c!2778 () Bool)

(declare-fun bm!1673 () Bool)

(declare-fun call!1678 () ListLongMap!563)

(declare-fun lt!7752 () (_ BitVec 64))

(declare-fun lt!7746 () (_ BitVec 64))

(assert (=> bm!1673 (= call!1678 (+!43 call!1683 (ite c!2778 (tuple2!923 lt!7752 lt!7750) (tuple2!923 lt!7746 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun call!1681 () ListLongMap!563)

(declare-fun call!1685 () ListLongMap!563)

(declare-fun call!1679 () ListLongMap!563)

(declare-fun lt!7762 () (_ BitVec 64))

(declare-fun bm!1674 () Bool)

(assert (=> bm!1674 (= call!1679 (+!43 (ite c!2778 call!1681 call!1685) (ite c!2778 (tuple2!923 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 lt!7762 (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun b!22539 () Bool)

(declare-fun e!14629 () tuple2!914)

(declare-fun lt!7771 () tuple2!914)

(assert (=> b!22539 (= e!14629 (tuple2!915 (_1!461 lt!7771) (_2!461 lt!7771)))))

(declare-fun lt!7767 () ListLongMap!563)

(assert (=> b!22539 (= lt!7767 call!1681)))

(declare-fun lt!7768 () (_ BitVec 64))

(assert (=> b!22539 (= lt!7768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7756 () Unit!488)

(declare-fun call!1677 () Unit!488)

(assert (=> b!22539 (= lt!7756 call!1677)))

(declare-fun call!1687 () ListLongMap!563)

(assert (=> b!22539 (= call!1687 call!1678)))

(declare-fun lt!7748 () Unit!488)

(assert (=> b!22539 (= lt!7748 lt!7756)))

(declare-fun lt!7758 () ListLongMap!563)

(assert (=> b!22539 (= lt!7758 call!1679)))

(declare-fun lt!7747 () (_ BitVec 64))

(assert (=> b!22539 (= lt!7747 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7744 () Unit!488)

(declare-fun call!1684 () Unit!488)

(assert (=> b!22539 (= lt!7744 call!1684)))

(declare-fun call!1688 () ListLongMap!563)

(declare-fun call!1680 () ListLongMap!563)

(assert (=> b!22539 (= call!1688 call!1680)))

(declare-fun lt!7742 () Unit!488)

(assert (=> b!22539 (= lt!7742 lt!7744)))

(declare-fun call!1686 () tuple2!914)

(assert (=> b!22539 (= lt!7771 call!1686)))

(declare-fun call!1676 () ListLongMap!563)

(declare-fun bm!1675 () Bool)

(declare-fun lt!7773 () ListLongMap!563)

(assert (=> bm!1675 (= call!1676 (+!43 (ite c!2778 lt!7758 lt!7773) (ite c!2778 (tuple2!923 lt!7752 lt!7750) (tuple2!923 lt!7746 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun bm!1676 () Bool)

(declare-fun call!1682 () ListLongMap!563)

(assert (=> bm!1676 (= call!1680 (+!43 (ite c!2778 call!1682 call!1681) (ite c!2778 (tuple2!923 lt!7752 lt!7750) (tuple2!923 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun bm!1677 () Bool)

(declare-fun addCommutativeForDiffKeys!3 (ListLongMap!563 (_ BitVec 64) V!1165 (_ BitVec 64) V!1165) Unit!488)

(assert (=> bm!1677 (= call!1677 (addCommutativeForDiffKeys!3 (ite c!2778 lt!7767 lt!7773) lt!7752 lt!7750 (ite c!2778 lt!7768 lt!7746) (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun b!22540 () Bool)

(declare-fun e!14633 () Unit!488)

(declare-fun Unit!497 () Unit!488)

(assert (=> b!22540 (= e!14633 Unit!497)))

(declare-fun b!22541 () Bool)

(declare-fun e!14632 () tuple2!914)

(assert (=> b!22541 (= e!14632 (tuple2!915 true (v!1584 (_2!462 lt!7489))))))

(declare-fun b!22542 () Bool)

(declare-fun e!14627 () tuple2!914)

(declare-fun e!14630 () tuple2!914)

(assert (=> b!22542 (= e!14627 e!14630)))

(declare-fun lt!7755 () tuple2!914)

(assert (=> b!22542 (= lt!7755 (update!26 (v!1584 (_2!462 lt!7489)) lt!7752 lt!7750))))

(declare-fun c!2774 () Bool)

(declare-fun lt!7770 () ListLongMap!563)

(assert (=> b!22542 (= c!2774 (contains!228 lt!7770 lt!7752))))

(declare-fun lt!7743 () Unit!488)

(assert (=> b!22542 (= lt!7743 e!14633)))

(declare-fun c!2776 () Bool)

(assert (=> b!22542 (= c!2776 (_1!461 lt!7755))))

(declare-fun lt!7754 () ListLongMap!563)

(declare-fun bm!1678 () Bool)

(assert (=> bm!1678 (= call!1685 (+!43 (ite c!2778 lt!7767 lt!7754) (tuple2!923 lt!7752 lt!7750)))))

(declare-fun d!3951 () Bool)

(declare-fun e!14634 () Bool)

(assert (=> d!3951 e!14634))

(declare-fun res!14208 () Bool)

(assert (=> d!3951 (=> res!14208 e!14634)))

(declare-fun lt!7759 () tuple2!914)

(assert (=> d!3951 (= res!14208 (not (_1!461 lt!7759)))))

(assert (=> d!3951 (= lt!7759 e!14627)))

(declare-fun c!2775 () Bool)

(assert (=> d!3951 (= c!2775 (and (not (= lt!7752 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7752 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3951 (= lt!7770 (map!399 (v!1584 (_2!462 lt!7489))))))

(declare-fun get!383 (ValueCell!303 V!1165) V!1165)

(assert (=> d!3951 (= lt!7750 (get!383 (select (arr!589 (_values!1720 (v!1584 (underlying!107 thiss!938)))) (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!142 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3951 (= lt!7752 (select (arr!590 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3951 (valid!96 thiss!938)))

(assert (=> d!3951 (= (repackFrom!4 thiss!938 (v!1584 (_2!462 lt!7489)) (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)) lt!7759)))

(declare-fun bm!1679 () Bool)

(assert (=> bm!1679 (= call!1686 (repackFrom!4 thiss!938 (ite c!2775 (_2!461 lt!7755) (v!1584 (_2!462 lt!7489))) (bvsub (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!22543 () Bool)

(assert (=> b!22543 (= e!14629 (tuple2!915 true (_2!461 lt!7755)))))

(assert (=> b!22543 (= lt!7773 call!1681)))

(assert (=> b!22543 (= lt!7746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7764 () Unit!488)

(assert (=> b!22543 (= lt!7764 call!1677)))

(assert (=> b!22543 (= call!1678 call!1687)))

(declare-fun lt!7761 () Unit!488)

(assert (=> b!22543 (= lt!7761 lt!7764)))

(assert (=> b!22543 (= lt!7754 call!1680)))

(assert (=> b!22543 (= lt!7762 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7765 () Unit!488)

(assert (=> b!22543 (= lt!7765 call!1684)))

(assert (=> b!22543 (= call!1679 call!1688)))

(declare-fun lt!7745 () Unit!488)

(assert (=> b!22543 (= lt!7745 lt!7765)))

(declare-fun b!22544 () Bool)

(assert (=> b!22544 (= e!14630 (tuple2!915 false (_2!461 lt!7755)))))

(declare-fun b!22545 () Bool)

(declare-fun e!14628 () Bool)

(assert (=> b!22545 (= e!14634 e!14628)))

(declare-fun res!14209 () Bool)

(assert (=> b!22545 (=> (not res!14209) (not e!14628))))

(assert (=> b!22545 (= res!14209 (valid!97 (_2!461 lt!7759)))))

(declare-fun lt!7760 () (_ BitVec 32))

(declare-fun e!14631 () Bool)

(declare-fun b!22546 () Bool)

(assert (=> b!22546 (= e!14631 (arrayContainsKey!0 (_keys!3155 (v!1584 (underlying!107 thiss!938))) lt!7752 lt!7760))))

(declare-fun bm!1680 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!14 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 32) Int) ListLongMap!563)

(assert (=> bm!1680 (= call!1681 (getCurrentListMapNoExtraKeys!14 (_keys!3155 (v!1584 (underlying!107 thiss!938))) (_values!1720 (v!1584 (underlying!107 thiss!938))) (mask!4712 (v!1584 (underlying!107 thiss!938))) (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))) (bvadd (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun b!22547 () Bool)

(assert (=> b!22547 (= e!14628 (= (map!399 (_2!461 lt!7759)) (map!399 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun bm!1681 () Bool)

(assert (=> bm!1681 (= call!1682 (+!43 (ite c!2778 lt!7758 lt!7754) (ite c!2778 (tuple2!923 lt!7747 (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 lt!7762 (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))))

(declare-fun b!22548 () Bool)

(assert (=> b!22548 false))

(declare-fun lt!7763 () Unit!488)

(declare-fun lt!7749 () Unit!488)

(assert (=> b!22548 (= lt!7763 lt!7749)))

(declare-fun lt!7769 () (_ BitVec 32))

(assert (=> b!22548 (not (arrayContainsKey!0 (_keys!3155 (v!1584 (underlying!107 thiss!938))) lt!7752 lt!7769))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1245 (_ BitVec 32) (_ BitVec 64) List!565) Unit!488)

(assert (=> b!22548 (= lt!7749 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3155 (v!1584 (underlying!107 thiss!938))) lt!7769 lt!7752 (Cons!561 lt!7752 Nil!562)))))

(assert (=> b!22548 (= lt!7769 (bvadd (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!7772 () Unit!488)

(declare-fun lt!7751 () Unit!488)

(assert (=> b!22548 (= lt!7772 lt!7751)))

(assert (=> b!22548 (arrayNoDuplicates!0 (_keys!3155 (v!1584 (underlying!107 thiss!938))) (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) Nil!562)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1245 (_ BitVec 32) (_ BitVec 32)) Unit!488)

(assert (=> b!22548 (= lt!7751 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3155 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7766 () Unit!488)

(declare-fun lt!7753 () Unit!488)

(assert (=> b!22548 (= lt!7766 lt!7753)))

(assert (=> b!22548 e!14631))

(declare-fun c!2773 () Bool)

(assert (=> b!22548 (= c!2773 (and (not (= lt!7752 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7752 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!3 (array!1245 array!1243 (_ BitVec 32) (_ BitVec 32) V!1165 V!1165 (_ BitVec 64) (_ BitVec 32) Int) Unit!488)

(assert (=> b!22548 (= lt!7753 (lemmaListMapContainsThenArrayContainsFrom!3 (_keys!3155 (v!1584 (underlying!107 thiss!938))) (_values!1720 (v!1584 (underlying!107 thiss!938))) (mask!4712 (v!1584 (underlying!107 thiss!938))) (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))) lt!7752 lt!7760 (defaultEntry!1732 (v!1584 (underlying!107 thiss!938)))))))

(assert (=> b!22548 (= lt!7760 (bvadd (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!498 () Unit!488)

(assert (=> b!22548 (= e!14633 Unit!498)))

(declare-fun bm!1682 () Bool)

(assert (=> bm!1682 (= call!1687 (+!43 (ite c!2778 call!1685 call!1676) (ite c!2778 (tuple2!923 lt!7768 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 lt!7752 lt!7750))))))

(declare-fun b!22549 () Bool)

(assert (=> b!22549 (= e!14627 e!14632)))

(declare-fun c!2777 () Bool)

(assert (=> b!22549 (= c!2777 (bvsgt (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!22550 () Bool)

(assert (=> b!22550 (= e!14631 (ite (= lt!7752 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1632 (v!1584 (underlying!107 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!1683 () Bool)

(assert (=> bm!1683 (= call!1683 (+!43 (ite c!2778 lt!7767 lt!7773) (ite c!2778 (tuple2!923 lt!7768 (zeroValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 lt!7752 lt!7750))))))

(declare-fun b!22551 () Bool)

(assert (=> b!22551 (= c!2778 (bvsgt (bvsub (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!22551 (= e!14630 e!14629)))

(declare-fun bm!1684 () Bool)

(assert (=> bm!1684 (= call!1688 (+!43 (ite c!2778 call!1676 call!1682) (ite c!2778 (tuple2!923 lt!7747 (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (tuple2!923 lt!7752 lt!7750))))))

(declare-fun bm!1685 () Bool)

(assert (=> bm!1685 (= call!1684 (addCommutativeForDiffKeys!3 (ite c!2778 lt!7758 lt!7754) lt!7752 lt!7750 (ite c!2778 lt!7747 lt!7762) (minValue!1657 (v!1584 (underlying!107 thiss!938)))))))

(declare-fun b!22552 () Bool)

(declare-fun lt!7757 () tuple2!914)

(assert (=> b!22552 (= lt!7757 call!1686)))

(assert (=> b!22552 (= e!14632 (tuple2!915 (_1!461 lt!7757) (_2!461 lt!7757)))))

(assert (= (and d!3951 c!2775) b!22542))

(assert (= (and d!3951 (not c!2775)) b!22549))

(assert (= (and b!22542 c!2774) b!22548))

(assert (= (and b!22542 (not c!2774)) b!22540))

(assert (= (and b!22548 c!2773) b!22546))

(assert (= (and b!22548 (not c!2773)) b!22550))

(assert (= (and b!22542 c!2776) b!22551))

(assert (= (and b!22542 (not c!2776)) b!22544))

(assert (= (and b!22551 c!2778) b!22539))

(assert (= (and b!22551 (not c!2778)) b!22543))

(assert (= (or b!22539 b!22543) bm!1685))

(assert (= (or b!22539 b!22543) bm!1680))

(assert (= (or b!22539 b!22543) bm!1681))

(assert (= (or b!22539 b!22543) bm!1683))

(assert (= (or b!22539 b!22543) bm!1678))

(assert (= (or b!22539 b!22543) bm!1677))

(assert (= (or b!22539 b!22543) bm!1675))

(assert (= (or b!22539 b!22543) bm!1673))

(assert (= (or b!22539 b!22543) bm!1682))

(assert (= (or b!22539 b!22543) bm!1674))

(assert (= (or b!22539 b!22543) bm!1684))

(assert (= (or b!22539 b!22543) bm!1676))

(assert (= (and b!22549 c!2777) b!22552))

(assert (= (and b!22549 (not c!2777)) b!22541))

(assert (= (or b!22539 b!22552) bm!1679))

(assert (= (and d!3951 (not res!14208)) b!22545))

(assert (= (and b!22545 res!14209) b!22547))

(declare-fun b_lambda!1559 () Bool)

(assert (=> (not b_lambda!1559) (not d!3951)))

(assert (=> d!3951 t!3230))

(declare-fun b_and!1461 () Bool)

(assert (= b_and!1459 (and (=> t!3230 result!1081) b_and!1461)))

(declare-fun m!16336 () Bool)

(assert (=> b!22546 m!16336))

(declare-fun m!16338 () Bool)

(assert (=> bm!1675 m!16338))

(declare-fun m!16340 () Bool)

(assert (=> bm!1677 m!16340))

(declare-fun m!16342 () Bool)

(assert (=> bm!1674 m!16342))

(declare-fun m!16344 () Bool)

(assert (=> bm!1676 m!16344))

(declare-fun m!16346 () Bool)

(assert (=> bm!1678 m!16346))

(declare-fun m!16348 () Bool)

(assert (=> bm!1683 m!16348))

(declare-fun m!16350 () Bool)

(assert (=> d!3951 m!16350))

(assert (=> d!3951 m!16202))

(declare-fun m!16352 () Bool)

(assert (=> d!3951 m!16352))

(declare-fun m!16354 () Bool)

(assert (=> d!3951 m!16354))

(assert (=> d!3951 m!16352))

(assert (=> d!3951 m!16248))

(declare-fun m!16356 () Bool)

(assert (=> d!3951 m!16356))

(assert (=> d!3951 m!16248))

(declare-fun m!16358 () Bool)

(assert (=> b!22548 m!16358))

(declare-fun m!16360 () Bool)

(assert (=> b!22548 m!16360))

(declare-fun m!16362 () Bool)

(assert (=> b!22548 m!16362))

(declare-fun m!16364 () Bool)

(assert (=> b!22548 m!16364))

(declare-fun m!16366 () Bool)

(assert (=> b!22548 m!16366))

(declare-fun m!16368 () Bool)

(assert (=> bm!1679 m!16368))

(declare-fun m!16370 () Bool)

(assert (=> bm!1685 m!16370))

(declare-fun m!16372 () Bool)

(assert (=> bm!1682 m!16372))

(declare-fun m!16374 () Bool)

(assert (=> b!22547 m!16374))

(declare-fun m!16376 () Bool)

(assert (=> b!22547 m!16376))

(declare-fun m!16378 () Bool)

(assert (=> b!22542 m!16378))

(declare-fun m!16380 () Bool)

(assert (=> b!22542 m!16380))

(declare-fun m!16382 () Bool)

(assert (=> bm!1684 m!16382))

(declare-fun m!16384 () Bool)

(assert (=> bm!1673 m!16384))

(declare-fun m!16386 () Bool)

(assert (=> b!22545 m!16386))

(declare-fun m!16388 () Bool)

(assert (=> bm!1680 m!16388))

(declare-fun m!16390 () Bool)

(assert (=> bm!1681 m!16390))

(assert (=> b!22298 d!3951))

(declare-fun d!3953 () Bool)

(assert (=> d!3953 (= (array_inv!399 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) (bvsge (size!686 (_keys!3155 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22295 d!3953))

(declare-fun d!3955 () Bool)

(assert (=> d!3955 (= (array_inv!400 (_values!1720 (v!1584 (underlying!107 thiss!938)))) (bvsge (size!685 (_values!1720 (v!1584 (underlying!107 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22295 d!3955))

(declare-fun d!3957 () Bool)

(assert (=> d!3957 (= (valid!96 thiss!938) (valid!97 (v!1584 (underlying!107 thiss!938))))))

(declare-fun bs!937 () Bool)

(assert (= bs!937 d!3957))

(declare-fun m!16392 () Bool)

(assert (=> bs!937 m!16392))

(assert (=> start!3448 d!3957))

(declare-fun d!3959 () Bool)

(assert (=> d!3959 (= (valid!96 (_3!4 lt!7483)) (valid!97 (v!1584 (underlying!107 (_3!4 lt!7483)))))))

(declare-fun bs!938 () Bool)

(assert (= bs!938 d!3959))

(declare-fun m!16394 () Bool)

(assert (=> bs!938 m!16394))

(assert (=> b!22296 d!3959))

(declare-fun b!22553 () Bool)

(declare-fun res!14222 () Bool)

(declare-fun e!14655 () Bool)

(assert (=> b!22553 (=> (not res!14222) (not e!14655))))

(declare-fun lt!7783 () SeekEntryResult!52)

(assert (=> b!22553 (= res!14222 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2329 lt!7783)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1686 () Bool)

(declare-fun call!1695 () ListLongMap!563)

(declare-fun lt!7779 () tuple2!914)

(assert (=> bm!1686 (= call!1695 (map!399 (_2!461 lt!7779)))))

(declare-fun b!22554 () Bool)

(declare-fun e!14651 () Bool)

(declare-fun e!14652 () Bool)

(assert (=> b!22554 (= e!14651 e!14652)))

(declare-fun res!14217 () Bool)

(assert (=> b!22554 (= res!14217 (contains!228 call!1695 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22554 (=> (not res!14217) (not e!14652))))

(declare-fun b!22555 () Bool)

(declare-fun e!14644 () tuple2!914)

(declare-fun e!14641 () tuple2!914)

(assert (=> b!22555 (= e!14644 e!14641)))

(declare-fun lt!7796 () SeekEntryResult!52)

(assert (=> b!22555 (= lt!7796 (seekEntryOrOpen!0 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3155 lt!7486) (mask!4712 lt!7486)))))

(declare-fun c!2785 () Bool)

(assert (=> b!22555 (= c!2785 ((_ is Undefined!52) lt!7796))))

(declare-fun bm!1687 () Bool)

(declare-fun call!1710 () Bool)

(assert (=> bm!1687 (= call!1710 (arrayContainsKey!0 (_keys!3155 lt!7486) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun bm!1688 () Bool)

(declare-fun c!2790 () Bool)

(assert (=> bm!1688 (= c!2790 c!2785)))

(declare-fun call!1701 () Bool)

(declare-fun e!14647 () ListLongMap!563)

(assert (=> bm!1688 (= call!1701 (contains!228 e!14647 (ite c!2785 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (select (arr!590 (_keys!3155 lt!7486)) (index!2330 lt!7796)))))))

(declare-fun b!22556 () Bool)

(declare-fun c!2781 () Bool)

(declare-fun lt!7786 () SeekEntryResult!52)

(assert (=> b!22556 (= c!2781 ((_ is MissingVacant!52) lt!7786))))

(declare-fun e!14636 () Bool)

(declare-fun e!14639 () Bool)

(assert (=> b!22556 (= e!14636 e!14639)))

(declare-fun b!22557 () Bool)

(declare-fun res!14216 () Bool)

(declare-fun call!1704 () Bool)

(assert (=> b!22557 (= res!14216 call!1704)))

(declare-fun e!14656 () Bool)

(assert (=> b!22557 (=> (not res!14216) (not e!14656))))

(declare-fun b!22558 () Bool)

(declare-fun e!14640 () Bool)

(assert (=> b!22558 (= e!14640 e!14651)))

(declare-fun c!2782 () Bool)

(assert (=> b!22558 (= c!2782 (_1!461 lt!7779))))

(declare-fun call!1694 () Unit!488)

(declare-fun bm!1689 () Bool)

(assert (=> bm!1689 (= call!1694 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1732 lt!7486)))))

(declare-fun b!22559 () Bool)

(declare-fun lt!7790 () Unit!488)

(declare-fun e!14648 () Unit!488)

(assert (=> b!22559 (= lt!7790 e!14648)))

(declare-fun c!2786 () Bool)

(assert (=> b!22559 (= c!2786 call!1701)))

(assert (=> b!22559 (= e!14641 (tuple2!915 false lt!7486))))

(declare-fun b!22560 () Bool)

(declare-fun call!1707 () ListLongMap!563)

(assert (=> b!22560 (= e!14647 call!1707)))

(declare-fun b!22561 () Bool)

(declare-fun lt!7799 () Unit!488)

(declare-fun lt!7778 () Unit!488)

(assert (=> b!22561 (= lt!7799 lt!7778)))

(declare-fun call!1709 () ListLongMap!563)

(declare-fun call!1700 () ListLongMap!563)

(assert (=> b!22561 (= call!1709 call!1700)))

(declare-fun lt!7781 () (_ BitVec 32))

(assert (=> b!22561 (= lt!7778 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) lt!7781 (zeroValue!1657 lt!7486) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (minValue!1657 lt!7486) (defaultEntry!1732 lt!7486)))))

(assert (=> b!22561 (= lt!7781 (bvor (extraKeys!1632 lt!7486) #b00000000000000000000000000000001))))

(declare-fun e!14638 () tuple2!914)

(assert (=> b!22561 (= e!14638 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 lt!7486) (mask!4712 lt!7486) (bvor (extraKeys!1632 lt!7486) #b00000000000000000000000000000001) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (minValue!1657 lt!7486) (_size!139 lt!7486) (_keys!3155 lt!7486) (_values!1720 lt!7486) (_vacant!139 lt!7486))))))

(declare-fun b!22562 () Bool)

(declare-fun e!14635 () tuple2!914)

(declare-fun lt!7788 () tuple2!914)

(assert (=> b!22562 (= e!14635 (tuple2!915 (_1!461 lt!7788) (_2!461 lt!7788)))))

(declare-fun call!1698 () tuple2!914)

(assert (=> b!22562 (= lt!7788 call!1698)))

(declare-fun bm!1690 () Bool)

(declare-fun call!1690 () ListLongMap!563)

(assert (=> bm!1690 (= call!1690 (map!399 lt!7486))))

(declare-fun bm!1691 () Bool)

(declare-fun call!1689 () SeekEntryResult!52)

(declare-fun call!1702 () SeekEntryResult!52)

(assert (=> bm!1691 (= call!1689 call!1702)))

(declare-fun b!22563 () Bool)

(declare-fun c!2784 () Bool)

(assert (=> b!22563 (= c!2784 ((_ is MissingVacant!52) lt!7783))))

(declare-fun e!14649 () Bool)

(declare-fun e!14637 () Bool)

(assert (=> b!22563 (= e!14649 e!14637)))

(declare-fun b!22564 () Bool)

(declare-fun Unit!499 () Unit!488)

(assert (=> b!22564 (= e!14648 Unit!499)))

(declare-fun lt!7793 () Unit!488)

(declare-fun call!1711 () Unit!488)

(assert (=> b!22564 (= lt!7793 call!1711)))

(declare-fun lt!7787 () SeekEntryResult!52)

(assert (=> b!22564 (= lt!7787 call!1689)))

(declare-fun res!14213 () Bool)

(assert (=> b!22564 (= res!14213 ((_ is Found!52) lt!7787))))

(declare-fun e!14645 () Bool)

(assert (=> b!22564 (=> (not res!14213) (not e!14645))))

(assert (=> b!22564 e!14645))

(declare-fun lt!7800 () Unit!488)

(assert (=> b!22564 (= lt!7800 lt!7793)))

(assert (=> b!22564 false))

(declare-fun b!22565 () Bool)

(declare-fun e!14653 () Bool)

(declare-fun call!1706 () Bool)

(assert (=> b!22565 (= e!14653 (not call!1706))))

(declare-fun b!22566 () Bool)

(declare-fun lt!7797 () tuple2!914)

(assert (=> b!22566 (= lt!7797 call!1698)))

(declare-fun e!14643 () tuple2!914)

(assert (=> b!22566 (= e!14643 (tuple2!915 (_1!461 lt!7797) (_2!461 lt!7797)))))

(declare-fun bm!1692 () Bool)

(declare-fun call!1692 () Bool)

(declare-fun c!2787 () Bool)

(declare-fun lt!7782 () SeekEntryResult!52)

(declare-fun c!2788 () Bool)

(declare-fun c!2789 () Bool)

(assert (=> bm!1692 (= call!1692 (inRange!0 (ite c!2785 (ite c!2786 (index!2330 lt!7787) (ite c!2787 (index!2329 lt!7786) (index!2332 lt!7786))) (ite c!2788 (index!2330 lt!7782) (ite c!2789 (index!2329 lt!7783) (index!2332 lt!7783)))) (mask!4712 lt!7486)))))

(declare-fun b!22567 () Bool)

(declare-fun res!14210 () Bool)

(assert (=> b!22567 (= res!14210 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2332 lt!7783)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14650 () Bool)

(assert (=> b!22567 (=> (not res!14210) (not e!14650))))

(declare-fun bm!1693 () Bool)

(declare-fun call!1697 () ListLongMap!563)

(assert (=> bm!1693 (= call!1707 call!1697)))

(declare-fun bm!1694 () Bool)

(declare-fun call!1691 () SeekEntryResult!52)

(assert (=> bm!1694 (= call!1691 call!1702)))

(declare-fun b!22568 () Bool)

(assert (=> b!22568 (= e!14645 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2330 lt!7787)) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!1712 () ListLongMap!563)

(declare-fun c!2780 () Bool)

(declare-fun lt!7789 () (_ BitVec 32))

(declare-fun c!2779 () Bool)

(declare-fun lt!7780 () array!1243)

(declare-fun bm!1695 () Bool)

(assert (=> bm!1695 (= call!1712 (getCurrentListMap!128 (_keys!3155 lt!7486) (ite c!2779 (_values!1720 lt!7486) lt!7780) (mask!4712 lt!7486) (ite c!2779 (ite c!2780 lt!7781 lt!7789) (extraKeys!1632 lt!7486)) (ite (and c!2779 c!2780) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (zeroValue!1657 lt!7486)) (ite c!2779 (ite c!2780 (minValue!1657 lt!7486) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (minValue!1657 lt!7486)) #b00000000000000000000000000000000 (defaultEntry!1732 lt!7486)))))

(declare-fun b!22569 () Bool)

(declare-fun call!1708 () Bool)

(assert (=> b!22569 (= e!14650 (not call!1708))))

(declare-fun b!22570 () Bool)

(declare-fun res!14218 () Bool)

(declare-fun call!1703 () Bool)

(assert (=> b!22570 (= res!14218 call!1703)))

(assert (=> b!22570 (=> (not res!14218) (not e!14645))))

(declare-fun b!22571 () Bool)

(assert (=> b!22571 (= e!14655 (not call!1708))))

(declare-fun b!22572 () Bool)

(assert (=> b!22572 (= e!14652 (= call!1695 (+!43 call!1690 (tuple2!923 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))))))))

(declare-fun b!22573 () Bool)

(assert (=> b!22573 (= e!14647 call!1712)))

(declare-fun b!22574 () Bool)

(declare-fun res!14221 () Bool)

(assert (=> b!22574 (= res!14221 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2332 lt!7786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14654 () Bool)

(assert (=> b!22574 (=> (not res!14221) (not e!14654))))

(declare-fun b!22575 () Bool)

(declare-fun e!14646 () Unit!488)

(declare-fun Unit!500 () Unit!488)

(assert (=> b!22575 (= e!14646 Unit!500)))

(declare-fun lt!7791 () Unit!488)

(assert (=> b!22575 (= lt!7791 call!1694)))

(assert (=> b!22575 (= lt!7783 call!1691)))

(assert (=> b!22575 (= c!2789 ((_ is MissingZero!52) lt!7783))))

(assert (=> b!22575 e!14649))

(declare-fun lt!7784 () Unit!488)

(assert (=> b!22575 (= lt!7784 lt!7791)))

(assert (=> b!22575 false))

(declare-fun bm!1696 () Bool)

(assert (=> bm!1696 (= call!1708 call!1710)))

(declare-fun bm!1697 () Bool)

(assert (=> bm!1697 (= call!1697 (getCurrentListMap!128 (_keys!3155 lt!7486) (ite (or c!2779 c!2785) (_values!1720 lt!7486) (array!1244 (store (arr!589 (_values!1720 lt!7486)) (index!2330 lt!7796) (ValueCellFull!303 (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))))) (size!685 (_values!1720 lt!7486)))) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) #b00000000000000000000000000000000 (defaultEntry!1732 lt!7486)))))

(declare-fun b!22576 () Bool)

(declare-fun res!14219 () Bool)

(assert (=> b!22576 (=> (not res!14219) (not e!14653))))

(assert (=> b!22576 (= res!14219 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2329 lt!7786)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1698 () Bool)

(assert (=> bm!1698 (= call!1711 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1732 lt!7486)))))

(declare-fun b!22577 () Bool)

(declare-fun e!14642 () ListLongMap!563)

(declare-fun call!1693 () ListLongMap!563)

(assert (=> b!22577 (= e!14642 call!1693)))

(declare-fun b!22578 () Bool)

(declare-fun lt!7777 () Unit!488)

(declare-fun lt!7798 () Unit!488)

(assert (=> b!22578 (= lt!7777 lt!7798)))

(assert (=> b!22578 call!1701))

(assert (=> b!22578 (= lt!7798 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3155 lt!7486) lt!7780 (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (index!2330 lt!7796) (defaultEntry!1732 lt!7486)))))

(assert (=> b!22578 (= lt!7780 (array!1244 (store (arr!589 (_values!1720 lt!7486)) (index!2330 lt!7796) (ValueCellFull!303 (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))))) (size!685 (_values!1720 lt!7486))))))

(declare-fun lt!7775 () Unit!488)

(declare-fun lt!7794 () Unit!488)

(assert (=> b!22578 (= lt!7775 lt!7794)))

(declare-fun call!1699 () ListLongMap!563)

(assert (=> b!22578 (= call!1699 call!1707)))

(assert (=> b!22578 (= lt!7794 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (index!2330 lt!7796) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (defaultEntry!1732 lt!7486)))))

(declare-fun lt!7792 () Unit!488)

(assert (=> b!22578 (= lt!7792 e!14646)))

(assert (=> b!22578 (= c!2788 (contains!228 (getCurrentListMap!128 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) #b00000000000000000000000000000000 (defaultEntry!1732 lt!7486)) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22578 (= e!14643 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (_size!139 lt!7486) (_keys!3155 lt!7486) (array!1244 (store (arr!589 (_values!1720 lt!7486)) (index!2330 lt!7796) (ValueCellFull!303 (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))))) (size!685 (_values!1720 lt!7486))) (_vacant!139 lt!7486))))))

(declare-fun d!3961 () Bool)

(assert (=> d!3961 e!14640))

(declare-fun res!14215 () Bool)

(assert (=> d!3961 (=> (not res!14215) (not e!14640))))

(assert (=> d!3961 (= res!14215 (valid!97 (_2!461 lt!7779)))))

(assert (=> d!3961 (= lt!7779 e!14644)))

(assert (=> d!3961 (= c!2779 (= (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3961 (valid!97 lt!7486)))

(assert (=> d!3961 (= (update!26 lt!7486 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))) lt!7779)))

(declare-fun bm!1699 () Bool)

(assert (=> bm!1699 (= call!1699 (+!43 e!14642 (ite c!2779 (ite c!2780 (tuple2!923 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))) (tuple2!923 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))))) (tuple2!923 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938))))))))))

(declare-fun c!2783 () Bool)

(assert (=> bm!1699 (= c!2783 c!2779)))

(declare-fun bm!1700 () Bool)

(assert (=> bm!1700 (= call!1693 call!1697)))

(declare-fun bm!1701 () Bool)

(assert (=> bm!1701 (= call!1700 call!1712)))

(declare-fun b!22579 () Bool)

(assert (=> b!22579 (= e!14637 e!14650)))

(declare-fun res!14214 () Bool)

(declare-fun call!1705 () Bool)

(assert (=> b!22579 (= res!14214 call!1705)))

(assert (=> b!22579 (=> (not res!14214) (not e!14650))))

(declare-fun b!22580 () Bool)

(declare-fun lt!7776 () Unit!488)

(assert (=> b!22580 (= e!14646 lt!7776)))

(assert (=> b!22580 (= lt!7776 call!1711)))

(assert (=> b!22580 (= lt!7782 call!1691)))

(declare-fun res!14220 () Bool)

(assert (=> b!22580 (= res!14220 ((_ is Found!52) lt!7782))))

(assert (=> b!22580 (=> (not res!14220) (not e!14656))))

(assert (=> b!22580 e!14656))

(declare-fun b!22581 () Bool)

(assert (=> b!22581 (= e!14639 e!14654)))

(declare-fun res!14212 () Bool)

(declare-fun call!1696 () Bool)

(assert (=> b!22581 (= res!14212 call!1696)))

(assert (=> b!22581 (=> (not res!14212) (not e!14654))))

(declare-fun b!22582 () Bool)

(assert (=> b!22582 (= e!14644 e!14638)))

(assert (=> b!22582 (= c!2780 (= (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22583 () Bool)

(declare-fun lt!7785 () Unit!488)

(declare-fun lt!7774 () Unit!488)

(assert (=> b!22583 (= lt!7785 lt!7774)))

(assert (=> b!22583 (= call!1709 call!1700)))

(assert (=> b!22583 (= lt!7774 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) lt!7789 (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (defaultEntry!1732 lt!7486)))))

(assert (=> b!22583 (= lt!7789 (bvor (extraKeys!1632 lt!7486) #b00000000000000000000000000000010))))

(assert (=> b!22583 (= e!14638 (tuple2!915 true (LongMapFixedSize!193 (defaultEntry!1732 lt!7486) (mask!4712 lt!7486) (bvor (extraKeys!1632 lt!7486) #b00000000000000000000000000000010) (zeroValue!1657 lt!7486) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (_size!139 lt!7486) (_keys!3155 lt!7486) (_values!1720 lt!7486) (_vacant!139 lt!7486))))))

(declare-fun b!22584 () Bool)

(assert (=> b!22584 (= e!14637 ((_ is Undefined!52) lt!7783))))

(declare-fun bm!1702 () Bool)

(assert (=> bm!1702 (= call!1706 call!1710)))

(declare-fun bm!1703 () Bool)

(assert (=> bm!1703 (= call!1702 (seekEntryOrOpen!0 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3155 lt!7486) (mask!4712 lt!7486)))))

(declare-fun bm!1704 () Bool)

(assert (=> bm!1704 (= call!1696 call!1703)))

(declare-fun b!22585 () Bool)

(assert (=> b!22585 (= e!14654 (not call!1706))))

(declare-fun b!22586 () Bool)

(assert (=> b!22586 (= e!14656 (= (select (arr!590 (_keys!3155 lt!7486)) (index!2330 lt!7782)) (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1705 () Bool)

(assert (=> bm!1705 (= call!1705 call!1704)))

(declare-fun bm!1706 () Bool)

(declare-fun c!2792 () Bool)

(assert (=> bm!1706 (= call!1698 (updateHelperNewKey!8 lt!7486 (ite (or c!2696 c!2697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2696 c!2697) (zeroValue!1657 (v!1584 (underlying!107 thiss!938))) (minValue!1657 (v!1584 (underlying!107 thiss!938)))) (ite c!2792 (index!2332 lt!7796) (index!2329 lt!7796))))))

(declare-fun b!22587 () Bool)

(declare-fun res!14211 () Bool)

(assert (=> b!22587 (=> (not res!14211) (not e!14653))))

(assert (=> b!22587 (= res!14211 call!1696)))

(assert (=> b!22587 (= e!14636 e!14653)))

(declare-fun bm!1707 () Bool)

(assert (=> bm!1707 (= call!1709 call!1699)))

(declare-fun bm!1708 () Bool)

(assert (=> bm!1708 (= call!1704 call!1692)))

(declare-fun b!22588 () Bool)

(assert (=> b!22588 (= e!14639 ((_ is Undefined!52) lt!7786))))

(declare-fun b!22589 () Bool)

(declare-fun lt!7795 () Unit!488)

(assert (=> b!22589 (= e!14648 lt!7795)))

(assert (=> b!22589 (= lt!7795 call!1694)))

(assert (=> b!22589 (= lt!7786 call!1689)))

(assert (=> b!22589 (= c!2787 ((_ is MissingZero!52) lt!7786))))

(assert (=> b!22589 e!14636))

(declare-fun b!22590 () Bool)

(declare-fun res!14223 () Bool)

(assert (=> b!22590 (=> (not res!14223) (not e!14655))))

(assert (=> b!22590 (= res!14223 call!1705)))

(assert (=> b!22590 (= e!14649 e!14655)))

(declare-fun bm!1709 () Bool)

(assert (=> bm!1709 (= call!1703 call!1692)))

(declare-fun b!22591 () Bool)

(assert (=> b!22591 (= e!14635 e!14643)))

(declare-fun c!2791 () Bool)

(assert (=> b!22591 (= c!2791 ((_ is MissingZero!52) lt!7796))))

(declare-fun b!22592 () Bool)

(assert (=> b!22592 (= e!14642 (getCurrentListMap!128 (_keys!3155 lt!7486) (_values!1720 lt!7486) (mask!4712 lt!7486) (extraKeys!1632 lt!7486) (zeroValue!1657 lt!7486) (minValue!1657 lt!7486) #b00000000000000000000000000000000 (defaultEntry!1732 lt!7486)))))

(declare-fun b!22593 () Bool)

(assert (=> b!22593 (= c!2792 ((_ is MissingVacant!52) lt!7796))))

(assert (=> b!22593 (= e!14641 e!14635)))

(declare-fun b!22594 () Bool)

(assert (=> b!22594 (= e!14651 (= call!1695 call!1690))))

(assert (= (and d!3961 c!2779) b!22582))

(assert (= (and d!3961 (not c!2779)) b!22555))

(assert (= (and b!22582 c!2780) b!22561))

(assert (= (and b!22582 (not c!2780)) b!22583))

(assert (= (or b!22561 b!22583) bm!1701))

(assert (= (or b!22561 b!22583) bm!1700))

(assert (= (or b!22561 b!22583) bm!1707))

(assert (= (and b!22555 c!2785) b!22559))

(assert (= (and b!22555 (not c!2785)) b!22593))

(assert (= (and b!22559 c!2786) b!22564))

(assert (= (and b!22559 (not c!2786)) b!22589))

(assert (= (and b!22564 res!14213) b!22570))

(assert (= (and b!22570 res!14218) b!22568))

(assert (= (and b!22589 c!2787) b!22587))

(assert (= (and b!22589 (not c!2787)) b!22556))

(assert (= (and b!22587 res!14211) b!22576))

(assert (= (and b!22576 res!14219) b!22565))

(assert (= (and b!22556 c!2781) b!22581))

(assert (= (and b!22556 (not c!2781)) b!22588))

(assert (= (and b!22581 res!14212) b!22574))

(assert (= (and b!22574 res!14221) b!22585))

(assert (= (or b!22587 b!22581) bm!1704))

(assert (= (or b!22565 b!22585) bm!1702))

(assert (= (or b!22570 bm!1704) bm!1709))

(assert (= (or b!22564 b!22589) bm!1691))

(assert (= (and b!22593 c!2792) b!22562))

(assert (= (and b!22593 (not c!2792)) b!22591))

(assert (= (and b!22591 c!2791) b!22566))

(assert (= (and b!22591 (not c!2791)) b!22578))

(assert (= (and b!22578 c!2788) b!22580))

(assert (= (and b!22578 (not c!2788)) b!22575))

(assert (= (and b!22580 res!14220) b!22557))

(assert (= (and b!22557 res!14216) b!22586))

(assert (= (and b!22575 c!2789) b!22590))

(assert (= (and b!22575 (not c!2789)) b!22563))

(assert (= (and b!22590 res!14223) b!22553))

(assert (= (and b!22553 res!14222) b!22571))

(assert (= (and b!22563 c!2784) b!22579))

(assert (= (and b!22563 (not c!2784)) b!22584))

(assert (= (and b!22579 res!14214) b!22567))

(assert (= (and b!22567 res!14210) b!22569))

(assert (= (or b!22590 b!22579) bm!1705))

(assert (= (or b!22571 b!22569) bm!1696))

(assert (= (or b!22557 bm!1705) bm!1708))

(assert (= (or b!22580 b!22575) bm!1694))

(assert (= (or b!22562 b!22566) bm!1706))

(assert (= (or b!22559 b!22578) bm!1693))

(assert (= (or bm!1691 bm!1694) bm!1703))

(assert (= (or b!22564 b!22580) bm!1698))

(assert (= (or bm!1702 bm!1696) bm!1687))

(assert (= (or b!22589 b!22575) bm!1689))

(assert (= (or bm!1709 bm!1708) bm!1692))

(assert (= (or b!22559 b!22578) bm!1688))

(assert (= (and bm!1688 c!2790) b!22560))

(assert (= (and bm!1688 (not c!2790)) b!22573))

(assert (= (or bm!1701 b!22573) bm!1695))

(assert (= (or bm!1700 bm!1693) bm!1697))

(assert (= (or bm!1707 b!22578) bm!1699))

(assert (= (and bm!1699 c!2783) b!22577))

(assert (= (and bm!1699 (not c!2783)) b!22592))

(assert (= (and d!3961 res!14215) b!22558))

(assert (= (and b!22558 c!2782) b!22554))

(assert (= (and b!22558 (not c!2782)) b!22594))

(assert (= (and b!22554 res!14217) b!22572))

(assert (= (or b!22554 b!22572 b!22594) bm!1686))

(assert (= (or b!22572 b!22594) bm!1690))

(declare-fun m!16396 () Bool)

(assert (=> bm!1698 m!16396))

(declare-fun m!16398 () Bool)

(assert (=> b!22574 m!16398))

(declare-fun m!16400 () Bool)

(assert (=> bm!1699 m!16400))

(declare-fun m!16402 () Bool)

(assert (=> bm!1690 m!16402))

(declare-fun m!16404 () Bool)

(assert (=> b!22568 m!16404))

(declare-fun m!16406 () Bool)

(assert (=> b!22555 m!16406))

(declare-fun m!16408 () Bool)

(assert (=> bm!1688 m!16408))

(declare-fun m!16410 () Bool)

(assert (=> bm!1688 m!16410))

(declare-fun m!16412 () Bool)

(assert (=> bm!1697 m!16412))

(declare-fun m!16414 () Bool)

(assert (=> bm!1697 m!16414))

(declare-fun m!16416 () Bool)

(assert (=> b!22578 m!16416))

(declare-fun m!16418 () Bool)

(assert (=> b!22578 m!16418))

(assert (=> b!22578 m!16416))

(declare-fun m!16420 () Bool)

(assert (=> b!22578 m!16420))

(declare-fun m!16422 () Bool)

(assert (=> b!22578 m!16422))

(assert (=> b!22578 m!16412))

(declare-fun m!16424 () Bool)

(assert (=> bm!1689 m!16424))

(declare-fun m!16426 () Bool)

(assert (=> bm!1686 m!16426))

(assert (=> bm!1703 m!16406))

(declare-fun m!16428 () Bool)

(assert (=> b!22553 m!16428))

(declare-fun m!16430 () Bool)

(assert (=> b!22567 m!16430))

(declare-fun m!16432 () Bool)

(assert (=> bm!1695 m!16432))

(declare-fun m!16434 () Bool)

(assert (=> b!22583 m!16434))

(declare-fun m!16436 () Bool)

(assert (=> bm!1692 m!16436))

(declare-fun m!16438 () Bool)

(assert (=> b!22561 m!16438))

(declare-fun m!16440 () Bool)

(assert (=> d!3961 m!16440))

(declare-fun m!16442 () Bool)

(assert (=> d!3961 m!16442))

(declare-fun m!16444 () Bool)

(assert (=> b!22576 m!16444))

(assert (=> b!22592 m!16416))

(declare-fun m!16446 () Bool)

(assert (=> b!22572 m!16446))

(declare-fun m!16448 () Bool)

(assert (=> bm!1706 m!16448))

(declare-fun m!16450 () Bool)

(assert (=> b!22554 m!16450))

(declare-fun m!16452 () Bool)

(assert (=> bm!1687 m!16452))

(declare-fun m!16454 () Bool)

(assert (=> b!22586 m!16454))

(assert (=> bm!1568 d!3961))

(declare-fun b!22602 () Bool)

(declare-fun e!14662 () Bool)

(assert (=> b!22602 (= e!14662 tp_is_empty!1005)))

(declare-fun mapIsEmpty!998 () Bool)

(declare-fun mapRes!998 () Bool)

(assert (=> mapIsEmpty!998 mapRes!998))

(declare-fun mapNonEmpty!998 () Bool)

(declare-fun tp!3473 () Bool)

(declare-fun e!14661 () Bool)

(assert (=> mapNonEmpty!998 (= mapRes!998 (and tp!3473 e!14661))))

(declare-fun mapKey!998 () (_ BitVec 32))

(declare-fun mapRest!998 () (Array (_ BitVec 32) ValueCell!303))

(declare-fun mapValue!998 () ValueCell!303)

(assert (=> mapNonEmpty!998 (= mapRest!992 (store mapRest!998 mapKey!998 mapValue!998))))

(declare-fun b!22601 () Bool)

(assert (=> b!22601 (= e!14661 tp_is_empty!1005)))

(declare-fun condMapEmpty!998 () Bool)

(declare-fun mapDefault!998 () ValueCell!303)

(assert (=> mapNonEmpty!992 (= condMapEmpty!998 (= mapRest!992 ((as const (Array (_ BitVec 32) ValueCell!303)) mapDefault!998)))))

(assert (=> mapNonEmpty!992 (= tp!3464 (and e!14662 mapRes!998))))

(assert (= (and mapNonEmpty!992 condMapEmpty!998) mapIsEmpty!998))

(assert (= (and mapNonEmpty!992 (not condMapEmpty!998)) mapNonEmpty!998))

(assert (= (and mapNonEmpty!998 ((_ is ValueCellFull!303) mapValue!998)) b!22601))

(assert (= (and mapNonEmpty!992 ((_ is ValueCellFull!303) mapDefault!998)) b!22602))

(declare-fun m!16456 () Bool)

(assert (=> mapNonEmpty!998 m!16456))

(declare-fun b_lambda!1561 () Bool)

(assert (= b_lambda!1557 (or (and b!22295 b_free!741) b_lambda!1561)))

(declare-fun b_lambda!1563 () Bool)

(assert (= b_lambda!1559 (or (and b!22295 b_free!741) b_lambda!1563)))

(declare-fun b_lambda!1565 () Bool)

(assert (= b_lambda!1555 (or (and b!22295 b_free!741) b_lambda!1565)))

(check-sat (not b_lambda!1561) (not bm!1632) (not d!3947) (not b!22471) (not b!22555) (not bm!1682) (not b!22592) (not bm!1686) b_and!1461 (not b_next!741) (not d!3949) (not b_lambda!1565) (not b!22572) (not bm!1624) (not d!3961) tp_is_empty!1005 (not b!22488) (not b!22548) (not b!22578) (not bm!1673) (not bm!1703) (not bm!1625) (not bm!1706) (not bm!1674) (not b!22554) (not bm!1676) (not bm!1699) (not b!22470) (not b!22499) (not bm!1688) (not bm!1643) (not bm!1634) (not bm!1679) (not bm!1629) (not b_lambda!1563) (not bm!1626) (not d!3957) (not bm!1683) (not bm!1636) (not bm!1692) (not bm!1684) (not b!22494) (not bm!1685) (not b!22382) (not bm!1698) (not bm!1690) (not bm!1675) (not b!22583) (not bm!1689) (not b!22508) (not b!22547) (not b!22561) (not b!22371) (not mapNonEmpty!998) (not bm!1695) (not bm!1627) (not b!22542) (not bm!1687) (not bm!1681) (not b!22545) (not bm!1680) (not bm!1635) (not d!3959) (not d!3951) (not bm!1623) (not bm!1677) (not d!3945) (not b!22477) (not b!22368) (not bm!1697) (not b!22372) (not b!22546) (not bm!1678) (not bm!1640))
(check-sat b_and!1461 (not b_next!741))
