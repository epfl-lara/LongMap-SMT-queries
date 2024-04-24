; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3442 () Bool)

(assert start!3442)

(declare-fun b!22249 () Bool)

(declare-fun b_free!739 () Bool)

(declare-fun b_next!739 () Bool)

(assert (=> b!22249 (= b_free!739 (not b_next!739))))

(declare-fun tp!3457 () Bool)

(declare-fun b_and!1445 () Bool)

(assert (=> b!22249 (= tp!3457 b_and!1445)))

(declare-fun b!22238 () Bool)

(declare-fun e!14428 () Bool)

(declare-fun tp_is_empty!1003 () Bool)

(assert (=> b!22238 (= e!14428 tp_is_empty!1003)))

(declare-datatypes ((V!1163 0))(
  ( (V!1164 (val!528 Int)) )
))
(declare-datatypes ((ValueCell!302 0))(
  ( (ValueCellFull!302 (v!1581 V!1163)) (EmptyCell!302) )
))
(declare-datatypes ((array!1221 0))(
  ( (array!1222 (arr!578 (Array (_ BitVec 32) ValueCell!302)) (size!674 (_ BitVec 32))) )
))
(declare-datatypes ((array!1223 0))(
  ( (array!1224 (arr!579 (Array (_ BitVec 32) (_ BitVec 64))) (size!675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!190 0))(
  ( (LongMapFixedSize!191 (defaultEntry!1731 Int) (mask!4711 (_ BitVec 32)) (extraKeys!1631 (_ BitVec 32)) (zeroValue!1656 V!1163) (minValue!1656 V!1163) (_size!138 (_ BitVec 32)) (_keys!3154 array!1223) (_values!1719 array!1221) (_vacant!138 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!920 0))(
  ( (tuple2!921 (_1!463 Bool) (_2!463 LongMapFixedSize!190)) )
))
(declare-fun lt!7458 () tuple2!920)

(declare-datatypes ((Cell!190 0))(
  ( (Cell!191 (v!1582 LongMapFixedSize!190)) )
))
(declare-fun lt!7457 () Cell!190)

(declare-datatypes ((LongMap!190 0))(
  ( (LongMap!191 (underlying!106 Cell!190)) )
))
(declare-fun thiss!938 () LongMap!190)

(declare-datatypes ((tuple3!6 0))(
  ( (tuple3!7 (_1!464 Bool) (_2!464 Cell!190) (_3!3 LongMap!190)) )
))
(declare-fun e!14433 () tuple3!6)

(declare-fun b!22239 () Bool)

(assert (=> b!22239 (= e!14433 (ite (_1!463 lt!7458) (tuple3!7 true (underlying!106 thiss!938) (LongMap!191 lt!7457)) (tuple3!7 false lt!7457 thiss!938)))))

(declare-datatypes ((tuple2!922 0))(
  ( (tuple2!923 (_1!465 Bool) (_2!465 Cell!190)) )
))
(declare-fun lt!7453 () tuple2!922)

(declare-fun repackFrom!4 (LongMap!190 LongMapFixedSize!190 (_ BitVec 32)) tuple2!920)

(assert (=> b!22239 (= lt!7458 (repackFrom!4 thiss!938 (v!1582 (_2!465 lt!7453)) (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22239 (= lt!7457 (Cell!191 (_2!463 lt!7458)))))

(declare-fun b!22240 () Bool)

(declare-fun e!14435 () Bool)

(declare-fun e!14430 () Bool)

(assert (=> b!22240 (= e!14435 e!14430)))

(declare-fun b!22241 () Bool)

(declare-fun e!14427 () Bool)

(declare-fun lt!7456 () tuple3!6)

(declare-fun valid!110 (LongMap!190) Bool)

(assert (=> b!22241 (= e!14427 (not (valid!110 (_3!3 lt!7456))))))

(declare-fun b!22242 () Bool)

(declare-fun e!14425 () tuple2!922)

(declare-fun lt!7452 () LongMapFixedSize!190)

(assert (=> b!22242 (= e!14425 (tuple2!923 true (Cell!191 lt!7452)))))

(declare-fun b!22243 () Bool)

(assert (=> b!22243 (= e!14433 (tuple3!7 false (_2!465 lt!7453) thiss!938))))

(declare-fun b!22244 () Bool)

(declare-fun lt!7460 () tuple2!920)

(assert (=> b!22244 (= e!14425 (tuple2!923 (_1!463 lt!7460) (Cell!191 (_2!463 lt!7460))))))

(declare-fun call!1564 () tuple2!920)

(assert (=> b!22244 (= lt!7460 call!1564)))

(declare-fun res!14117 () Bool)

(declare-fun e!14434 () Bool)

(assert (=> start!3442 (=> (not res!14117) (not e!14434))))

(assert (=> start!3442 (= res!14117 (valid!110 thiss!938))))

(assert (=> start!3442 e!14434))

(declare-fun e!14437 () Bool)

(assert (=> start!3442 e!14437))

(declare-fun c!2691 () Bool)

(declare-fun c!2693 () Bool)

(declare-fun lt!7459 () tuple2!920)

(declare-fun bm!1561 () Bool)

(declare-fun call!1565 () tuple2!920)

(declare-fun update!33 (LongMapFixedSize!190 (_ BitVec 64) V!1163) tuple2!920)

(assert (=> bm!1561 (= call!1565 (update!33 (ite c!2691 (_2!463 lt!7459) lt!7452) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun b!22245 () Bool)

(assert (=> b!22245 (= e!14437 e!14435)))

(declare-fun b!22246 () Bool)

(declare-fun c!2690 () Bool)

(declare-fun lt!7455 () Bool)

(assert (=> b!22246 (= c!2690 (and (not (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7455))))

(declare-fun e!14426 () tuple2!922)

(assert (=> b!22246 (= e!14426 e!14425)))

(declare-fun mapNonEmpty!989 () Bool)

(declare-fun mapRes!989 () Bool)

(declare-fun tp!3458 () Bool)

(declare-fun e!14431 () Bool)

(assert (=> mapNonEmpty!989 (= mapRes!989 (and tp!3458 e!14431))))

(declare-fun mapValue!989 () ValueCell!302)

(declare-fun mapKey!989 () (_ BitVec 32))

(declare-fun mapRest!989 () (Array (_ BitVec 32) ValueCell!302))

(assert (=> mapNonEmpty!989 (= (arr!578 (_values!1719 (v!1582 (underlying!106 thiss!938)))) (store mapRest!989 mapKey!989 mapValue!989))))

(declare-fun b!22247 () Bool)

(assert (=> b!22247 (= e!14434 e!14427)))

(declare-fun res!14118 () Bool)

(assert (=> b!22247 (=> (not res!14118) (not e!14427))))

(assert (=> b!22247 (= res!14118 (_1!464 lt!7456))))

(assert (=> b!22247 (= lt!7456 e!14433)))

(declare-fun c!2692 () Bool)

(assert (=> b!22247 (= c!2692 (not (_1!465 lt!7453)))))

(declare-fun e!14429 () tuple2!922)

(assert (=> b!22247 (= lt!7453 e!14429)))

(assert (=> b!22247 (= c!2691 (and (not lt!7455) (not (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22247 (= lt!7455 (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!31 ((_ BitVec 32) Int) LongMapFixedSize!190)

(declare-fun computeNewMask!26 (LongMap!190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22247 (= lt!7452 (getNewLongMapFixedSize!31 (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))))))

(declare-fun b!22248 () Bool)

(declare-fun lt!7454 () tuple2!920)

(assert (=> b!22248 (= e!14429 (tuple2!923 (and (_1!463 lt!7459) (_1!463 lt!7454)) (Cell!191 (_2!463 lt!7454))))))

(assert (=> b!22248 (= lt!7459 (update!33 lt!7452 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))

(assert (=> b!22248 (= lt!7454 call!1565)))

(declare-fun e!14432 () Bool)

(declare-fun array_inv!413 (array!1223) Bool)

(declare-fun array_inv!414 (array!1221) Bool)

(assert (=> b!22249 (= e!14430 (and tp!3457 tp_is_empty!1003 (array_inv!413 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) (array_inv!414 (_values!1719 (v!1582 (underlying!106 thiss!938)))) e!14432))))

(declare-fun b!22250 () Bool)

(assert (=> b!22250 (= e!14429 e!14426)))

(assert (=> b!22250 (= c!2693 (and (not lt!7455) (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22251 () Bool)

(assert (=> b!22251 (= e!14431 tp_is_empty!1003)))

(declare-fun b!22252 () Bool)

(declare-fun lt!7461 () tuple2!920)

(assert (=> b!22252 (= lt!7461 call!1564)))

(assert (=> b!22252 (= e!14426 (tuple2!923 (_1!463 lt!7461) (Cell!191 (_2!463 lt!7461))))))

(declare-fun b!22253 () Bool)

(assert (=> b!22253 (= e!14432 (and e!14428 mapRes!989))))

(declare-fun condMapEmpty!989 () Bool)

(declare-fun mapDefault!989 () ValueCell!302)

(assert (=> b!22253 (= condMapEmpty!989 (= (arr!578 (_values!1719 (v!1582 (underlying!106 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!302)) mapDefault!989)))))

(declare-fun bm!1562 () Bool)

(assert (=> bm!1562 (= call!1564 call!1565)))

(declare-fun mapIsEmpty!989 () Bool)

(assert (=> mapIsEmpty!989 mapRes!989))

(assert (= (and start!3442 res!14117) b!22247))

(assert (= (and b!22247 c!2691) b!22248))

(assert (= (and b!22247 (not c!2691)) b!22250))

(assert (= (and b!22250 c!2693) b!22252))

(assert (= (and b!22250 (not c!2693)) b!22246))

(assert (= (and b!22246 c!2690) b!22244))

(assert (= (and b!22246 (not c!2690)) b!22242))

(assert (= (or b!22252 b!22244) bm!1562))

(assert (= (or b!22248 bm!1562) bm!1561))

(assert (= (and b!22247 c!2692) b!22243))

(assert (= (and b!22247 (not c!2692)) b!22239))

(assert (= (and b!22247 res!14118) b!22241))

(assert (= (and b!22253 condMapEmpty!989) mapIsEmpty!989))

(assert (= (and b!22253 (not condMapEmpty!989)) mapNonEmpty!989))

(get-info :version)

(assert (= (and mapNonEmpty!989 ((_ is ValueCellFull!302) mapValue!989)) b!22251))

(assert (= (and b!22253 ((_ is ValueCellFull!302) mapDefault!989)) b!22238))

(assert (= b!22249 b!22253))

(assert (= b!22240 b!22249))

(assert (= b!22245 b!22240))

(assert (= start!3442 b!22245))

(declare-fun m!16136 () Bool)

(assert (=> start!3442 m!16136))

(declare-fun m!16138 () Bool)

(assert (=> bm!1561 m!16138))

(declare-fun m!16140 () Bool)

(assert (=> mapNonEmpty!989 m!16140))

(declare-fun m!16142 () Bool)

(assert (=> b!22241 m!16142))

(declare-fun m!16144 () Bool)

(assert (=> b!22249 m!16144))

(declare-fun m!16146 () Bool)

(assert (=> b!22249 m!16146))

(declare-fun m!16148 () Bool)

(assert (=> b!22248 m!16148))

(declare-fun m!16150 () Bool)

(assert (=> b!22247 m!16150))

(assert (=> b!22247 m!16150))

(declare-fun m!16152 () Bool)

(assert (=> b!22247 m!16152))

(declare-fun m!16154 () Bool)

(assert (=> b!22239 m!16154))

(check-sat (not b!22241) tp_is_empty!1003 (not start!3442) (not b!22249) (not b!22239) (not b!22248) (not b_next!739) (not mapNonEmpty!989) b_and!1445 (not bm!1561) (not b!22247))
(check-sat b_and!1445 (not b_next!739))
(get-model)

(declare-fun d!3913 () Bool)

(declare-fun valid!113 (LongMapFixedSize!190) Bool)

(assert (=> d!3913 (= (valid!110 (_3!3 lt!7456)) (valid!113 (v!1582 (underlying!106 (_3!3 lt!7456)))))))

(declare-fun bs!935 () Bool)

(assert (= bs!935 d!3913))

(declare-fun m!16196 () Bool)

(assert (=> bs!935 m!16196))

(assert (=> b!22241 d!3913))

(declare-fun d!3915 () Bool)

(assert (=> d!3915 (= (valid!110 thiss!938) (valid!113 (v!1582 (underlying!106 thiss!938))))))

(declare-fun bs!936 () Bool)

(assert (= bs!936 d!3915))

(declare-fun m!16198 () Bool)

(assert (=> bs!936 m!16198))

(assert (=> start!3442 d!3915))

(declare-fun b!22362 () Bool)

(declare-fun e!14522 () Bool)

(declare-fun lt!7585 () array!1223)

(declare-datatypes ((tuple2!928 0))(
  ( (tuple2!929 (_1!470 (_ BitVec 64)) (_2!470 V!1163)) )
))
(declare-fun lt!7570 () tuple2!928)

(declare-fun arrayContainsKey!0 (array!1223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!22362 (= e!14522 (arrayContainsKey!0 lt!7585 (_1!470 lt!7570) #b00000000000000000000000000000000))))

(declare-fun b!22363 () Bool)

(declare-fun lt!7586 () (_ BitVec 32))

(assert (=> b!22363 (= e!14522 (ite (= (_1!470 lt!7570) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!7586 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!7586 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!22364 () Bool)

(declare-fun res!14136 () Bool)

(declare-fun e!14524 () Bool)

(assert (=> b!22364 (=> (not res!14136) (not e!14524))))

(declare-fun lt!7581 () LongMapFixedSize!190)

(assert (=> b!22364 (= res!14136 (= (mask!4711 lt!7581) (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938))))))))

(declare-fun b!22365 () Bool)

(declare-datatypes ((Unit!498 0))(
  ( (Unit!499) )
))
(declare-fun e!14523 () Unit!498)

(declare-fun Unit!500 () Unit!498)

(assert (=> b!22365 (= e!14523 Unit!500)))

(declare-fun lt!7580 () LongMapFixedSize!190)

(declare-datatypes ((List!560 0))(
  ( (Nil!557) (Cons!556 (h!1122 tuple2!928) (t!3221 List!560)) )
))
(declare-fun head!826 (List!560) tuple2!928)

(declare-datatypes ((ListLongMap!559 0))(
  ( (ListLongMap!560 (toList!295 List!560)) )
))
(declare-fun map!400 (LongMapFixedSize!190) ListLongMap!559)

(assert (=> b!22365 (= lt!7570 (head!826 (toList!295 (map!400 lt!7580))))))

(assert (=> b!22365 (= lt!7585 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22365 (= lt!7586 #b00000000000000000000000000000000)))

(declare-fun lt!7590 () Unit!498)

(declare-fun lemmaKeyInListMapIsInArray!95 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!498)

(declare-fun dynLambda!138 (Int (_ BitVec 64)) V!1163)

(assert (=> b!22365 (= lt!7590 (lemmaKeyInListMapIsInArray!95 lt!7585 (array!1222 ((as const (Array (_ BitVec 32) ValueCell!302)) EmptyCell!302) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) lt!7586 (dynLambda!138 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!470 lt!7570) (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))))))

(declare-fun c!2723 () Bool)

(assert (=> b!22365 (= c!2723 (and (not (= (_1!470 lt!7570) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!470 lt!7570) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22365 e!14522))

(declare-fun lt!7582 () Unit!498)

(assert (=> b!22365 (= lt!7582 lt!7590)))

(declare-fun lt!7573 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1223 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22365 (= lt!7573 (arrayScanForKey!0 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (_1!470 lt!7570) #b00000000000000000000000000000000))))

(assert (=> b!22365 false))

(declare-fun d!3917 () Bool)

(assert (=> d!3917 e!14524))

(declare-fun res!14135 () Bool)

(assert (=> d!3917 (=> (not res!14135) (not e!14524))))

(assert (=> d!3917 (= res!14135 (valid!113 lt!7581))))

(assert (=> d!3917 (= lt!7581 lt!7580)))

(declare-fun lt!7571 () Unit!498)

(assert (=> d!3917 (= lt!7571 e!14523)))

(declare-fun c!2722 () Bool)

(assert (=> d!3917 (= c!2722 (not (= (map!400 lt!7580) (ListLongMap!560 Nil!557))))))

(declare-fun lt!7589 () Unit!498)

(declare-fun lt!7576 () Unit!498)

(assert (=> d!3917 (= lt!7589 lt!7576)))

(declare-fun lt!7587 () array!1223)

(declare-fun lt!7572 () (_ BitVec 32))

(declare-datatypes ((List!561 0))(
  ( (Nil!558) (Cons!557 (h!1123 (_ BitVec 64)) (t!3222 List!561)) )
))
(declare-fun lt!7579 () List!561)

(declare-fun arrayNoDuplicates!0 (array!1223 (_ BitVec 32) List!561) Bool)

(assert (=> d!3917 (arrayNoDuplicates!0 lt!7587 lt!7572 lt!7579)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1223 (_ BitVec 32) (_ BitVec 32) List!561) Unit!498)

(assert (=> d!3917 (= lt!7576 (lemmaArrayNoDuplicatesInAll0Array!0 lt!7587 lt!7572 (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) lt!7579))))

(assert (=> d!3917 (= lt!7579 Nil!558)))

(assert (=> d!3917 (= lt!7572 #b00000000000000000000000000000000)))

(assert (=> d!3917 (= lt!7587 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7584 () Unit!498)

(declare-fun lt!7578 () Unit!498)

(assert (=> d!3917 (= lt!7584 lt!7578)))

(declare-fun lt!7568 () (_ BitVec 32))

(declare-fun lt!7574 () array!1223)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1223 (_ BitVec 32)) Bool)

(assert (=> d!3917 (arrayForallSeekEntryOrOpenFound!0 lt!7568 lt!7574 (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!498)

(assert (=> d!3917 (= lt!7578 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!7574 (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) lt!7568))))

(assert (=> d!3917 (= lt!7568 #b00000000000000000000000000000000)))

(assert (=> d!3917 (= lt!7574 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7575 () Unit!498)

(declare-fun lt!7577 () Unit!498)

(assert (=> d!3917 (= lt!7575 lt!7577)))

(declare-fun lt!7583 () array!1223)

(declare-fun lt!7569 () (_ BitVec 32))

(declare-fun lt!7588 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3917 (= (arrayCountValidKeys!0 lt!7583 lt!7569 lt!7588) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!498)

(assert (=> d!3917 (= lt!7577 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!7583 lt!7569 lt!7588))))

(assert (=> d!3917 (= lt!7588 (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3917 (= lt!7569 #b00000000000000000000000000000000)))

(assert (=> d!3917 (= lt!7583 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3917 (= lt!7580 (LongMapFixedSize!191 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!138 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (array!1222 ((as const (Array (_ BitVec 32) ValueCell!302)) EmptyCell!302) (bvadd (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3917 (validMask!0 (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))))))

(assert (=> d!3917 (= (getNewLongMapFixedSize!31 (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))) lt!7581)))

(declare-fun b!22366 () Bool)

(declare-fun Unit!501 () Unit!498)

(assert (=> b!22366 (= e!14523 Unit!501)))

(declare-fun b!22367 () Bool)

(assert (=> b!22367 (= e!14524 (= (map!400 lt!7581) (ListLongMap!560 Nil!557)))))

(assert (= (and d!3917 c!2722) b!22365))

(assert (= (and d!3917 (not c!2722)) b!22366))

(assert (= (and b!22365 c!2723) b!22362))

(assert (= (and b!22365 (not c!2723)) b!22363))

(assert (= (and d!3917 res!14135) b!22364))

(assert (= (and b!22364 res!14136) b!22367))

(declare-fun b_lambda!1543 () Bool)

(assert (=> (not b_lambda!1543) (not b!22365)))

(declare-fun t!3220 () Bool)

(declare-fun tb!647 () Bool)

(assert (=> (and b!22249 (= (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))) t!3220) tb!647))

(declare-fun result!1075 () Bool)

(assert (=> tb!647 (= result!1075 tp_is_empty!1003)))

(assert (=> b!22365 t!3220))

(declare-fun b_and!1451 () Bool)

(assert (= b_and!1445 (and (=> t!3220 result!1075) b_and!1451)))

(declare-fun b_lambda!1545 () Bool)

(assert (=> (not b_lambda!1545) (not d!3917)))

(assert (=> d!3917 t!3220))

(declare-fun b_and!1453 () Bool)

(assert (= b_and!1451 (and (=> t!3220 result!1075) b_and!1453)))

(declare-fun m!16200 () Bool)

(assert (=> b!22362 m!16200))

(declare-fun m!16202 () Bool)

(assert (=> b!22365 m!16202))

(declare-fun m!16204 () Bool)

(assert (=> b!22365 m!16204))

(assert (=> b!22365 m!16150))

(declare-fun m!16206 () Bool)

(assert (=> b!22365 m!16206))

(assert (=> b!22365 m!16206))

(declare-fun m!16208 () Bool)

(assert (=> b!22365 m!16208))

(assert (=> b!22365 m!16206))

(declare-fun m!16210 () Bool)

(assert (=> b!22365 m!16210))

(assert (=> d!3917 m!16202))

(assert (=> d!3917 m!16150))

(declare-fun m!16212 () Bool)

(assert (=> d!3917 m!16212))

(declare-fun m!16214 () Bool)

(assert (=> d!3917 m!16214))

(assert (=> d!3917 m!16150))

(declare-fun m!16216 () Bool)

(assert (=> d!3917 m!16216))

(declare-fun m!16218 () Bool)

(assert (=> d!3917 m!16218))

(assert (=> d!3917 m!16150))

(declare-fun m!16220 () Bool)

(assert (=> d!3917 m!16220))

(declare-fun m!16222 () Bool)

(assert (=> d!3917 m!16222))

(declare-fun m!16224 () Bool)

(assert (=> d!3917 m!16224))

(assert (=> d!3917 m!16206))

(declare-fun m!16226 () Bool)

(assert (=> d!3917 m!16226))

(declare-fun m!16228 () Bool)

(assert (=> b!22367 m!16228))

(assert (=> b!22247 d!3917))

(declare-fun d!3919 () Bool)

(declare-fun e!14530 () Bool)

(assert (=> d!3919 e!14530))

(declare-fun res!14139 () Bool)

(assert (=> d!3919 (=> (not res!14139) (not e!14530))))

(declare-fun lt!7596 () (_ BitVec 32))

(assert (=> d!3919 (= res!14139 (validMask!0 lt!7596))))

(declare-datatypes ((tuple2!930 0))(
  ( (tuple2!931 (_1!471 Unit!498) (_2!471 (_ BitVec 32))) )
))
(declare-fun e!14529 () tuple2!930)

(assert (=> d!3919 (= lt!7596 (_2!471 e!14529))))

(declare-fun c!2726 () Bool)

(declare-fun lt!7595 () tuple2!930)

(assert (=> d!3919 (= c!2726 (and (bvsgt (_2!471 lt!7595) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!138 (v!1582 (underlying!106 thiss!938)))) (_2!471 lt!7595)) (bvsge (bvadd (bvand (bvashr (_2!471 lt!7595) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!138 (v!1582 (underlying!106 thiss!938))))))))

(declare-fun Unit!502 () Unit!498)

(declare-fun Unit!503 () Unit!498)

(assert (=> d!3919 (= lt!7595 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!138 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))))) (mask!4711 (v!1582 (underlying!106 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!138 (v!1582 (underlying!106 thiss!938)))) (mask!4711 (v!1582 (underlying!106 thiss!938))))) (tuple2!931 Unit!502 (bvand (bvadd (bvshl (mask!4711 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!931 Unit!503 (mask!4711 (v!1582 (underlying!106 thiss!938))))))))

(assert (=> d!3919 (validMask!0 (mask!4711 (v!1582 (underlying!106 thiss!938))))))

(assert (=> d!3919 (= (computeNewMask!26 thiss!938 (mask!4711 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (_size!138 (v!1582 (underlying!106 thiss!938)))) lt!7596)))

(declare-fun b!22376 () Bool)

(declare-fun computeNewMaskWhile!12 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!930)

(assert (=> b!22376 (= e!14529 (computeNewMaskWhile!12 (_size!138 (v!1582 (underlying!106 thiss!938))) (_vacant!138 (v!1582 (underlying!106 thiss!938))) (mask!4711 (v!1582 (underlying!106 thiss!938))) (_2!471 lt!7595)))))

(declare-fun b!22377 () Bool)

(declare-fun Unit!504 () Unit!498)

(assert (=> b!22377 (= e!14529 (tuple2!931 Unit!504 (_2!471 lt!7595)))))

(declare-fun b!22378 () Bool)

(assert (=> b!22378 (= e!14530 (bvsle (_size!138 (v!1582 (underlying!106 thiss!938))) (bvadd lt!7596 #b00000000000000000000000000000001)))))

(assert (= (and d!3919 c!2726) b!22376))

(assert (= (and d!3919 (not c!2726)) b!22377))

(assert (= (and d!3919 res!14139) b!22378))

(declare-fun m!16230 () Bool)

(assert (=> d!3919 m!16230))

(declare-fun m!16232 () Bool)

(assert (=> d!3919 m!16232))

(declare-fun m!16234 () Bool)

(assert (=> b!22376 m!16234))

(assert (=> b!22247 d!3919))

(declare-fun c!2742 () Bool)

(declare-fun call!1610 () tuple2!920)

(declare-fun bm!1601 () Bool)

(declare-fun lt!7671 () tuple2!920)

(assert (=> bm!1601 (= call!1610 (repackFrom!4 thiss!938 (ite c!2742 (_2!463 lt!7671) (v!1582 (_2!465 lt!7453))) (bvsub (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun call!1612 () ListLongMap!559)

(declare-fun lt!7684 () (_ BitVec 64))

(declare-fun call!1611 () ListLongMap!559)

(declare-fun c!2740 () Bool)

(declare-fun lt!7681 () V!1163)

(declare-fun bm!1602 () Bool)

(declare-fun lt!7663 () (_ BitVec 64))

(declare-fun +!42 (ListLongMap!559 tuple2!928) ListLongMap!559)

(assert (=> bm!1602 (= call!1612 (+!42 call!1611 (ite c!2740 (tuple2!929 lt!7684 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 lt!7663 lt!7681))))))

(declare-fun lt!7665 () ListLongMap!559)

(declare-fun call!1609 () Unit!498)

(declare-fun lt!7676 () (_ BitVec 64))

(declare-fun lt!7673 () (_ BitVec 64))

(declare-fun lt!7678 () ListLongMap!559)

(declare-fun bm!1603 () Bool)

(declare-fun addCommutativeForDiffKeys!3 (ListLongMap!559 (_ BitVec 64) V!1163 (_ BitVec 64) V!1163) Unit!498)

(assert (=> bm!1603 (= call!1609 (addCommutativeForDiffKeys!3 (ite c!2740 lt!7678 lt!7665) lt!7663 lt!7681 (ite c!2740 lt!7676 lt!7673) (ite c!2740 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))))))))

(declare-fun lt!7662 () (_ BitVec 64))

(declare-fun bm!1604 () Bool)

(declare-fun lt!7687 () ListLongMap!559)

(declare-fun call!1615 () ListLongMap!559)

(assert (=> bm!1604 (= call!1615 (+!42 (ite c!2740 lt!7678 lt!7687) (ite c!2740 (tuple2!929 lt!7663 lt!7681) (tuple2!929 lt!7662 (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun bm!1605 () Bool)

(declare-fun lt!7672 () ListLongMap!559)

(declare-fun call!1605 () ListLongMap!559)

(assert (=> bm!1605 (= call!1605 (+!42 (ite c!2740 lt!7672 lt!7665) (ite c!2740 (tuple2!929 lt!7684 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 lt!7663 lt!7681))))))

(declare-fun b!22407 () Bool)

(declare-fun e!14554 () tuple2!920)

(assert (=> b!22407 (= e!14554 (tuple2!921 false (_2!463 lt!7671)))))

(declare-fun b!22408 () Bool)

(assert (=> b!22408 false))

(declare-fun lt!7670 () Unit!498)

(declare-fun lt!7683 () Unit!498)

(assert (=> b!22408 (= lt!7670 lt!7683)))

(declare-fun lt!7661 () (_ BitVec 32))

(assert (=> b!22408 (not (arrayContainsKey!0 (_keys!3154 (v!1582 (underlying!106 thiss!938))) lt!7663 lt!7661))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!1223 (_ BitVec 32) (_ BitVec 64) List!561) Unit!498)

(assert (=> b!22408 (= lt!7683 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3154 (v!1582 (underlying!106 thiss!938))) lt!7661 lt!7663 (Cons!557 lt!7663 Nil!558)))))

(assert (=> b!22408 (= lt!7661 (bvadd (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!7691 () Unit!498)

(declare-fun lt!7664 () Unit!498)

(assert (=> b!22408 (= lt!7691 lt!7664)))

(assert (=> b!22408 (arrayNoDuplicates!0 (_keys!3154 (v!1582 (underlying!106 thiss!938))) (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) Nil!558)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!1223 (_ BitVec 32) (_ BitVec 32)) Unit!498)

(assert (=> b!22408 (= lt!7664 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3154 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000000 (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!7686 () Unit!498)

(declare-fun lt!7690 () Unit!498)

(assert (=> b!22408 (= lt!7686 lt!7690)))

(declare-fun e!14549 () Bool)

(assert (=> b!22408 e!14549))

(declare-fun c!2739 () Bool)

(assert (=> b!22408 (= c!2739 (and (not (= lt!7663 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7663 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7692 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!3 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) (_ BitVec 32) Int) Unit!498)

(assert (=> b!22408 (= lt!7690 (lemmaListMapContainsThenArrayContainsFrom!3 (_keys!3154 (v!1582 (underlying!106 thiss!938))) (_values!1719 (v!1582 (underlying!106 thiss!938))) (mask!4711 (v!1582 (underlying!106 thiss!938))) (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))) lt!7663 lt!7692 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))))))

(assert (=> b!22408 (= lt!7692 (bvadd (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!14547 () Unit!498)

(declare-fun Unit!505 () Unit!498)

(assert (=> b!22408 (= e!14547 Unit!505)))

(declare-fun d!3921 () Bool)

(declare-fun e!14552 () Bool)

(assert (=> d!3921 e!14552))

(declare-fun res!14145 () Bool)

(assert (=> d!3921 (=> res!14145 e!14552)))

(declare-fun lt!7675 () tuple2!920)

(assert (=> d!3921 (= res!14145 (not (_1!463 lt!7675)))))

(declare-fun e!14550 () tuple2!920)

(assert (=> d!3921 (= lt!7675 e!14550)))

(assert (=> d!3921 (= c!2742 (and (not (= lt!7663 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7663 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!7669 () ListLongMap!559)

(assert (=> d!3921 (= lt!7669 (map!400 (v!1582 (_2!465 lt!7453))))))

(declare-fun get!383 (ValueCell!302 V!1163) V!1163)

(assert (=> d!3921 (= lt!7681 (get!383 (select (arr!578 (_values!1719 (v!1582 (underlying!106 thiss!938)))) (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) (dynLambda!138 (defaultEntry!1731 (v!1582 (underlying!106 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3921 (= lt!7663 (select (arr!579 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3921 (valid!110 thiss!938)))

(assert (=> d!3921 (= (repackFrom!4 thiss!938 (v!1582 (_2!465 lt!7453)) (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001)) lt!7675)))

(declare-fun bm!1606 () Bool)

(assert (=> bm!1606 (= call!1611 (+!42 (ite c!2740 lt!7672 lt!7665) (ite c!2740 (tuple2!929 lt!7663 lt!7681) (tuple2!929 lt!7673 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun b!22409 () Bool)

(assert (=> b!22409 (= e!14549 (ite (= lt!7663 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!22410 () Bool)

(assert (=> b!22410 (= c!2740 (bvsgt (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!14548 () tuple2!920)

(assert (=> b!22410 (= e!14554 e!14548)))

(declare-fun b!22411 () Bool)

(declare-fun e!14551 () tuple2!920)

(assert (=> b!22411 (= e!14551 (tuple2!921 true (v!1582 (_2!465 lt!7453))))))

(declare-fun b!22412 () Bool)

(declare-fun e!14553 () Bool)

(assert (=> b!22412 (= e!14552 e!14553)))

(declare-fun res!14144 () Bool)

(assert (=> b!22412 (=> (not res!14144) (not e!14553))))

(assert (=> b!22412 (= res!14144 (valid!113 (_2!463 lt!7675)))))

(declare-fun b!22413 () Bool)

(assert (=> b!22413 (= e!14550 e!14551)))

(declare-fun c!2744 () Bool)

(assert (=> b!22413 (= c!2744 (bvsgt (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!22414 () Bool)

(assert (=> b!22414 (= e!14549 (arrayContainsKey!0 (_keys!3154 (v!1582 (underlying!106 thiss!938))) lt!7663 lt!7692))))

(declare-fun b!22415 () Bool)

(declare-fun lt!7688 () tuple2!920)

(assert (=> b!22415 (= lt!7688 call!1610)))

(assert (=> b!22415 (= e!14551 (tuple2!921 (_1!463 lt!7688) (_2!463 lt!7688)))))

(declare-fun b!22416 () Bool)

(declare-fun lt!7679 () tuple2!920)

(assert (=> b!22416 (= e!14548 (tuple2!921 (_1!463 lt!7679) (_2!463 lt!7679)))))

(declare-fun call!1616 () ListLongMap!559)

(assert (=> b!22416 (= lt!7672 call!1616)))

(assert (=> b!22416 (= lt!7684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7666 () Unit!498)

(declare-fun call!1604 () Unit!498)

(assert (=> b!22416 (= lt!7666 call!1604)))

(declare-fun call!1614 () ListLongMap!559)

(assert (=> b!22416 (= call!1612 call!1614)))

(declare-fun lt!7677 () Unit!498)

(assert (=> b!22416 (= lt!7677 lt!7666)))

(declare-fun call!1608 () ListLongMap!559)

(assert (=> b!22416 (= lt!7678 call!1608)))

(assert (=> b!22416 (= lt!7676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7685 () Unit!498)

(assert (=> b!22416 (= lt!7685 call!1609)))

(declare-fun call!1613 () ListLongMap!559)

(declare-fun call!1607 () ListLongMap!559)

(assert (=> b!22416 (= call!1613 call!1607)))

(declare-fun lt!7682 () Unit!498)

(assert (=> b!22416 (= lt!7682 lt!7685)))

(assert (=> b!22416 (= lt!7679 call!1610)))

(declare-fun call!1606 () ListLongMap!559)

(declare-fun bm!1607 () Bool)

(assert (=> bm!1607 (= call!1607 (+!42 (ite c!2740 call!1606 call!1615) (tuple2!929 lt!7663 lt!7681)))))

(declare-fun b!22417 () Bool)

(assert (=> b!22417 (= e!14548 (tuple2!921 true (_2!463 lt!7671)))))

(assert (=> b!22417 (= lt!7665 call!1616)))

(assert (=> b!22417 (= lt!7673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7680 () Unit!498)

(assert (=> b!22417 (= lt!7680 call!1609)))

(assert (=> b!22417 (= call!1613 call!1612)))

(declare-fun lt!7667 () Unit!498)

(assert (=> b!22417 (= lt!7667 lt!7680)))

(assert (=> b!22417 (= lt!7687 call!1614)))

(assert (=> b!22417 (= lt!7662 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7674 () Unit!498)

(assert (=> b!22417 (= lt!7674 call!1604)))

(assert (=> b!22417 (= call!1608 call!1607)))

(declare-fun lt!7689 () Unit!498)

(assert (=> b!22417 (= lt!7689 lt!7674)))

(declare-fun bm!1608 () Bool)

(assert (=> bm!1608 (= call!1606 (+!42 (ite c!2740 lt!7678 lt!7687) (ite c!2740 (tuple2!929 lt!7676 (minValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 lt!7663 lt!7681))))))

(declare-fun bm!1609 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!14 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) ListLongMap!559)

(assert (=> bm!1609 (= call!1616 (getCurrentListMapNoExtraKeys!14 (_keys!3154 (v!1582 (underlying!106 thiss!938))) (_values!1719 (v!1582 (underlying!106 thiss!938))) (mask!4711 (v!1582 (underlying!106 thiss!938))) (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))) (bvadd (bvsub (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1731 (v!1582 (underlying!106 thiss!938)))))))

(declare-fun b!22418 () Bool)

(assert (=> b!22418 (= e!14553 (= (map!400 (_2!463 lt!7675)) (map!400 (v!1582 (underlying!106 thiss!938)))))))

(declare-fun b!22419 () Bool)

(assert (=> b!22419 (= e!14550 e!14554)))

(assert (=> b!22419 (= lt!7671 (update!33 (v!1582 (_2!465 lt!7453)) lt!7663 lt!7681))))

(declare-fun c!2741 () Bool)

(declare-fun contains!227 (ListLongMap!559 (_ BitVec 64)) Bool)

(assert (=> b!22419 (= c!2741 (contains!227 lt!7669 lt!7663))))

(declare-fun lt!7668 () Unit!498)

(assert (=> b!22419 (= lt!7668 e!14547)))

(declare-fun c!2743 () Bool)

(assert (=> b!22419 (= c!2743 (_1!463 lt!7671))))

(declare-fun b!22420 () Bool)

(declare-fun Unit!506 () Unit!498)

(assert (=> b!22420 (= e!14547 Unit!506)))

(declare-fun bm!1610 () Bool)

(assert (=> bm!1610 (= call!1614 (+!42 (ite c!2740 call!1605 call!1616) (ite c!2740 (tuple2!929 lt!7663 lt!7681) (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun bm!1611 () Bool)

(assert (=> bm!1611 (= call!1604 (addCommutativeForDiffKeys!3 (ite c!2740 lt!7672 lt!7687) lt!7663 lt!7681 (ite c!2740 lt!7684 lt!7662) (ite c!2740 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))))))

(declare-fun bm!1612 () Bool)

(assert (=> bm!1612 (= call!1608 (+!42 (ite c!2740 call!1616 call!1606) (ite c!2740 (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 lt!7662 (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun bm!1613 () Bool)

(assert (=> bm!1613 (= call!1613 (+!42 (ite c!2740 call!1615 call!1605) (ite c!2740 (tuple2!929 lt!7676 (minValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 lt!7673 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(assert (= (and d!3921 c!2742) b!22419))

(assert (= (and d!3921 (not c!2742)) b!22413))

(assert (= (and b!22419 c!2741) b!22408))

(assert (= (and b!22419 (not c!2741)) b!22420))

(assert (= (and b!22408 c!2739) b!22414))

(assert (= (and b!22408 (not c!2739)) b!22409))

(assert (= (and b!22419 c!2743) b!22410))

(assert (= (and b!22419 (not c!2743)) b!22407))

(assert (= (and b!22410 c!2740) b!22416))

(assert (= (and b!22410 (not c!2740)) b!22417))

(assert (= (or b!22416 b!22417) bm!1611))

(assert (= (or b!22416 b!22417) bm!1608))

(assert (= (or b!22416 b!22417) bm!1606))

(assert (= (or b!22416 b!22417) bm!1605))

(assert (= (or b!22416 b!22417) bm!1603))

(assert (= (or b!22416 b!22417) bm!1604))

(assert (= (or b!22416 b!22417) bm!1609))

(assert (= (or b!22416 b!22417) bm!1613))

(assert (= (or b!22416 b!22417) bm!1612))

(assert (= (or b!22416 b!22417) bm!1607))

(assert (= (or b!22416 b!22417) bm!1610))

(assert (= (or b!22416 b!22417) bm!1602))

(assert (= (and b!22413 c!2744) b!22415))

(assert (= (and b!22413 (not c!2744)) b!22411))

(assert (= (or b!22416 b!22415) bm!1601))

(assert (= (and d!3921 (not res!14145)) b!22412))

(assert (= (and b!22412 res!14144) b!22418))

(declare-fun b_lambda!1547 () Bool)

(assert (=> (not b_lambda!1547) (not d!3921)))

(assert (=> d!3921 t!3220))

(declare-fun b_and!1455 () Bool)

(assert (= b_and!1453 (and (=> t!3220 result!1075) b_and!1455)))

(declare-fun m!16236 () Bool)

(assert (=> bm!1612 m!16236))

(declare-fun m!16238 () Bool)

(assert (=> b!22412 m!16238))

(declare-fun m!16240 () Bool)

(assert (=> b!22408 m!16240))

(declare-fun m!16242 () Bool)

(assert (=> b!22408 m!16242))

(declare-fun m!16244 () Bool)

(assert (=> b!22408 m!16244))

(declare-fun m!16246 () Bool)

(assert (=> b!22408 m!16246))

(declare-fun m!16248 () Bool)

(assert (=> b!22408 m!16248))

(declare-fun m!16250 () Bool)

(assert (=> bm!1611 m!16250))

(declare-fun m!16252 () Bool)

(assert (=> d!3921 m!16252))

(declare-fun m!16254 () Bool)

(assert (=> d!3921 m!16254))

(assert (=> d!3921 m!16206))

(declare-fun m!16256 () Bool)

(assert (=> d!3921 m!16256))

(declare-fun m!16258 () Bool)

(assert (=> d!3921 m!16258))

(assert (=> d!3921 m!16136))

(assert (=> d!3921 m!16254))

(assert (=> d!3921 m!16206))

(declare-fun m!16260 () Bool)

(assert (=> bm!1601 m!16260))

(declare-fun m!16262 () Bool)

(assert (=> bm!1603 m!16262))

(declare-fun m!16264 () Bool)

(assert (=> b!22414 m!16264))

(declare-fun m!16266 () Bool)

(assert (=> b!22419 m!16266))

(declare-fun m!16268 () Bool)

(assert (=> b!22419 m!16268))

(declare-fun m!16270 () Bool)

(assert (=> bm!1607 m!16270))

(declare-fun m!16272 () Bool)

(assert (=> b!22418 m!16272))

(declare-fun m!16274 () Bool)

(assert (=> b!22418 m!16274))

(declare-fun m!16276 () Bool)

(assert (=> bm!1602 m!16276))

(declare-fun m!16278 () Bool)

(assert (=> bm!1613 m!16278))

(declare-fun m!16280 () Bool)

(assert (=> bm!1610 m!16280))

(declare-fun m!16282 () Bool)

(assert (=> bm!1605 m!16282))

(declare-fun m!16284 () Bool)

(assert (=> bm!1608 m!16284))

(declare-fun m!16286 () Bool)

(assert (=> bm!1609 m!16286))

(declare-fun m!16288 () Bool)

(assert (=> bm!1604 m!16288))

(declare-fun m!16290 () Bool)

(assert (=> bm!1606 m!16290))

(assert (=> b!22239 d!3921))

(declare-fun bm!1662 () Bool)

(declare-fun call!1672 () ListLongMap!559)

(declare-fun lt!7753 () tuple2!920)

(assert (=> bm!1662 (= call!1672 (map!400 (_2!463 lt!7753)))))

(declare-fun b!22505 () Bool)

(declare-fun e!14610 () Unit!498)

(declare-fun lt!7763 () Unit!498)

(assert (=> b!22505 (= e!14610 lt!7763)))

(declare-fun call!1669 () Unit!498)

(assert (=> b!22505 (= lt!7763 call!1669)))

(declare-datatypes ((SeekEntryResult!52 0))(
  ( (MissingZero!52 (index!2329 (_ BitVec 32))) (Found!52 (index!2330 (_ BitVec 32))) (Intermediate!52 (undefined!864 Bool) (index!2331 (_ BitVec 32)) (x!5422 (_ BitVec 32))) (Undefined!52) (MissingVacant!52 (index!2332 (_ BitVec 32))) )
))
(declare-fun lt!7754 () SeekEntryResult!52)

(declare-fun call!1666 () SeekEntryResult!52)

(assert (=> b!22505 (= lt!7754 call!1666)))

(declare-fun res!14175 () Bool)

(assert (=> b!22505 (= res!14175 ((_ is Found!52) lt!7754))))

(declare-fun e!14614 () Bool)

(assert (=> b!22505 (=> (not res!14175) (not e!14614))))

(assert (=> b!22505 e!14614))

(declare-fun bm!1663 () Bool)

(declare-fun call!1683 () Bool)

(declare-fun call!1678 () Bool)

(assert (=> bm!1663 (= call!1683 call!1678)))

(declare-fun bm!1665 () Bool)

(declare-fun call!1688 () Bool)

(assert (=> bm!1665 (= call!1688 call!1678)))

(declare-fun b!22506 () Bool)

(declare-fun lt!7770 () tuple2!920)

(declare-fun call!1676 () tuple2!920)

(assert (=> b!22506 (= lt!7770 call!1676)))

(declare-fun e!14599 () tuple2!920)

(assert (=> b!22506 (= e!14599 (tuple2!921 (_1!463 lt!7770) (_2!463 lt!7770)))))

(declare-fun b!22507 () Bool)

(declare-fun res!14174 () Bool)

(declare-fun e!14615 () Bool)

(assert (=> b!22507 (=> (not res!14174) (not e!14615))))

(declare-fun call!1677 () Bool)

(assert (=> b!22507 (= res!14174 call!1677)))

(declare-fun e!14611 () Bool)

(assert (=> b!22507 (= e!14611 e!14615)))

(declare-fun b!22508 () Bool)

(declare-fun e!14618 () Bool)

(declare-fun lt!7773 () SeekEntryResult!52)

(assert (=> b!22508 (= e!14618 ((_ is Undefined!52) lt!7773))))

(declare-fun bm!1666 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!498)

(assert (=> bm!1666 (= call!1669 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1731 lt!7452)))))

(declare-fun bm!1667 () Bool)

(declare-fun c!2774 () Bool)

(declare-fun c!2776 () Bool)

(assert (=> bm!1667 (= c!2774 c!2776)))

(declare-fun e!14603 () ListLongMap!559)

(declare-fun lt!7764 () SeekEntryResult!52)

(declare-fun call!1673 () Bool)

(assert (=> bm!1667 (= call!1673 (contains!227 e!14603 (ite c!2776 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!579 (_keys!3154 lt!7452)) (index!2330 lt!7764)))))))

(declare-fun bm!1668 () Bool)

(declare-fun call!1684 () ListLongMap!559)

(declare-fun call!1685 () ListLongMap!559)

(assert (=> bm!1668 (= call!1684 call!1685)))

(declare-fun b!22509 () Bool)

(declare-fun e!14605 () Bool)

(assert (=> b!22509 (= e!14618 e!14605)))

(declare-fun res!14187 () Bool)

(declare-fun call!1686 () Bool)

(assert (=> b!22509 (= res!14187 call!1686)))

(assert (=> b!22509 (=> (not res!14187) (not e!14605))))

(declare-fun b!22510 () Bool)

(declare-fun lt!7765 () Unit!498)

(declare-fun lt!7758 () Unit!498)

(assert (=> b!22510 (= lt!7765 lt!7758)))

(declare-fun call!1668 () ListLongMap!559)

(declare-fun call!1679 () ListLongMap!559)

(assert (=> b!22510 (= call!1668 call!1679)))

(declare-fun lt!7747 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 V!1163 Int) Unit!498)

(assert (=> b!22510 (= lt!7758 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) lt!7747 (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (defaultEntry!1731 lt!7452)))))

(assert (=> b!22510 (= lt!7747 (bvor (extraKeys!1631 lt!7452) #b00000000000000000000000000000010))))

(declare-fun e!14619 () tuple2!920)

(assert (=> b!22510 (= e!14619 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7452) (mask!4711 lt!7452) (bvor (extraKeys!1631 lt!7452) #b00000000000000000000000000000010) (zeroValue!1656 lt!7452) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (_size!138 lt!7452) (_keys!3154 lt!7452) (_values!1719 lt!7452) (_vacant!138 lt!7452))))))

(declare-fun b!22511 () Bool)

(declare-fun c!2781 () Bool)

(assert (=> b!22511 (= c!2781 ((_ is MissingVacant!52) lt!7773))))

(declare-fun e!14620 () Bool)

(assert (=> b!22511 (= e!14620 e!14618)))

(declare-fun b!22512 () Bool)

(declare-fun e!14608 () tuple2!920)

(declare-fun e!14616 () tuple2!920)

(assert (=> b!22512 (= e!14608 e!14616)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1223 (_ BitVec 32)) SeekEntryResult!52)

(assert (=> b!22512 (= lt!7764 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3154 lt!7452) (mask!4711 lt!7452)))))

(assert (=> b!22512 (= c!2776 ((_ is Undefined!52) lt!7764))))

(declare-fun b!22513 () Bool)

(declare-fun e!14602 () ListLongMap!559)

(declare-fun getCurrentListMap!125 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) ListLongMap!559)

(assert (=> b!22513 (= e!14602 (getCurrentListMap!125 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7452)))))

(declare-fun e!14601 () Bool)

(declare-fun call!1680 () ListLongMap!559)

(declare-fun b!22514 () Bool)

(assert (=> b!22514 (= e!14601 (= call!1672 (+!42 call!1680 (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun bm!1669 () Bool)

(declare-fun call!1667 () Unit!498)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 64) Int) Unit!498)

(assert (=> bm!1669 (= call!1667 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1731 lt!7452)))))

(declare-fun bm!1670 () Bool)

(declare-fun call!1681 () SeekEntryResult!52)

(assert (=> bm!1670 (= call!1666 call!1681)))

(declare-fun b!22515 () Bool)

(declare-fun e!14612 () Bool)

(declare-fun lt!7772 () SeekEntryResult!52)

(assert (=> b!22515 (= e!14612 ((_ is Undefined!52) lt!7772))))

(declare-fun b!22516 () Bool)

(declare-fun res!14181 () Bool)

(assert (=> b!22516 (= res!14181 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2332 lt!7773)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22516 (=> (not res!14181) (not e!14605))))

(declare-fun b!22517 () Bool)

(declare-fun res!14183 () Bool)

(assert (=> b!22517 (= res!14183 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2332 lt!7772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14617 () Bool)

(assert (=> b!22517 (=> (not res!14183) (not e!14617))))

(declare-fun c!2780 () Bool)

(declare-fun bm!1671 () Bool)

(declare-fun c!2773 () Bool)

(declare-fun c!2783 () Bool)

(declare-fun lt!7760 () SeekEntryResult!52)

(declare-fun c!2777 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1671 (= call!1678 (inRange!0 (ite c!2776 (ite c!2780 (index!2330 lt!7760) (ite c!2777 (index!2329 lt!7772) (index!2332 lt!7772))) (ite c!2783 (index!2330 lt!7754) (ite c!2773 (index!2329 lt!7773) (index!2332 lt!7773)))) (mask!4711 lt!7452)))))

(declare-fun b!22518 () Bool)

(declare-fun e!14604 () Unit!498)

(declare-fun Unit!507 () Unit!498)

(assert (=> b!22518 (= e!14604 Unit!507)))

(declare-fun lt!7759 () Unit!498)

(assert (=> b!22518 (= lt!7759 call!1669)))

(declare-fun call!1675 () SeekEntryResult!52)

(assert (=> b!22518 (= lt!7760 call!1675)))

(declare-fun res!14184 () Bool)

(assert (=> b!22518 (= res!14184 ((_ is Found!52) lt!7760))))

(declare-fun e!14606 () Bool)

(assert (=> b!22518 (=> (not res!14184) (not e!14606))))

(assert (=> b!22518 e!14606))

(declare-fun lt!7761 () Unit!498)

(assert (=> b!22518 (= lt!7761 lt!7759)))

(assert (=> b!22518 false))

(declare-fun b!22519 () Bool)

(declare-fun e!14613 () Bool)

(declare-fun e!14607 () Bool)

(assert (=> b!22519 (= e!14613 e!14607)))

(declare-fun c!2778 () Bool)

(assert (=> b!22519 (= c!2778 (_1!463 lt!7753))))

(declare-fun b!22520 () Bool)

(declare-fun lt!7751 () Unit!498)

(assert (=> b!22520 (= e!14604 lt!7751)))

(assert (=> b!22520 (= lt!7751 call!1667)))

(assert (=> b!22520 (= lt!7772 call!1675)))

(assert (=> b!22520 (= c!2777 ((_ is MissingZero!52) lt!7772))))

(assert (=> b!22520 e!14611))

(declare-fun b!22521 () Bool)

(declare-fun call!1670 () Bool)

(assert (=> b!22521 (= e!14617 (not call!1670))))

(declare-fun b!22522 () Bool)

(declare-fun res!14180 () Bool)

(assert (=> b!22522 (=> (not res!14180) (not e!14615))))

(assert (=> b!22522 (= res!14180 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2329 lt!7772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22523 () Bool)

(assert (=> b!22523 (= e!14607 (= call!1672 call!1680))))

(declare-fun b!22524 () Bool)

(declare-fun call!1687 () Bool)

(assert (=> b!22524 (= e!14605 (not call!1687))))

(declare-fun call!1665 () ListLongMap!559)

(declare-fun c!2782 () Bool)

(declare-fun c!2786 () Bool)

(declare-fun bm!1664 () Bool)

(assert (=> bm!1664 (= call!1665 (+!42 e!14602 (ite c!2782 (ite c!2786 (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) (tuple2!929 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))))) (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun c!2784 () Bool)

(assert (=> bm!1664 (= c!2784 c!2782)))

(declare-fun d!3923 () Bool)

(assert (=> d!3923 e!14613))

(declare-fun res!14179 () Bool)

(assert (=> d!3923 (=> (not res!14179) (not e!14613))))

(assert (=> d!3923 (= res!14179 (valid!113 (_2!463 lt!7753)))))

(assert (=> d!3923 (= lt!7753 e!14608)))

(assert (=> d!3923 (= c!2782 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3923 (valid!113 lt!7452)))

(assert (=> d!3923 (= (update!33 lt!7452 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) lt!7753)))

(declare-fun b!22525 () Bool)

(assert (=> b!22525 (= e!14612 e!14617)))

(declare-fun res!14182 () Bool)

(assert (=> b!22525 (= res!14182 call!1677)))

(assert (=> b!22525 (=> (not res!14182) (not e!14617))))

(declare-fun b!22526 () Bool)

(declare-fun lt!7752 () Unit!498)

(declare-fun lt!7768 () Unit!498)

(assert (=> b!22526 (= lt!7752 lt!7768)))

(assert (=> b!22526 call!1673))

(declare-fun lt!7750 () array!1221)

(declare-fun lemmaValidKeyInArrayIsInListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) Int) Unit!498)

(assert (=> b!22526 (= lt!7768 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3154 lt!7452) lt!7750 (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) (index!2330 lt!7764) (defaultEntry!1731 lt!7452)))))

(assert (=> b!22526 (= lt!7750 (array!1222 (store (arr!578 (_values!1719 lt!7452)) (index!2330 lt!7764) (ValueCellFull!302 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))))) (size!674 (_values!1719 lt!7452))))))

(declare-fun lt!7766 () Unit!498)

(declare-fun lt!7756 () Unit!498)

(assert (=> b!22526 (= lt!7766 lt!7756)))

(assert (=> b!22526 (= call!1665 call!1684)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 (_ BitVec 32) (_ BitVec 64) V!1163 Int) Unit!498)

(assert (=> b!22526 (= lt!7756 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) (index!2330 lt!7764) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (defaultEntry!1731 lt!7452)))))

(declare-fun lt!7748 () Unit!498)

(assert (=> b!22526 (= lt!7748 e!14610)))

(assert (=> b!22526 (= c!2783 (contains!227 (getCurrentListMap!125 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22526 (= e!14599 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) (_size!138 lt!7452) (_keys!3154 lt!7452) (array!1222 (store (arr!578 (_values!1719 lt!7452)) (index!2330 lt!7764) (ValueCellFull!302 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))))) (size!674 (_values!1719 lt!7452))) (_vacant!138 lt!7452))))))

(declare-fun b!22527 () Bool)

(assert (=> b!22527 (= e!14614 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2330 lt!7754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!2775 () Bool)

(declare-fun bm!1672 () Bool)

(declare-fun updateHelperNewKey!8 (LongMapFixedSize!190 (_ BitVec 64) V!1163 (_ BitVec 32)) tuple2!920)

(assert (=> bm!1672 (= call!1676 (updateHelperNewKey!8 lt!7452 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2775 (index!2332 lt!7764) (index!2329 lt!7764))))))

(declare-fun b!22528 () Bool)

(assert (=> b!22528 (= e!14603 call!1684)))

(declare-fun b!22529 () Bool)

(declare-fun call!1682 () ListLongMap!559)

(assert (=> b!22529 (= e!14603 call!1682)))

(declare-fun b!22530 () Bool)

(declare-fun Unit!508 () Unit!498)

(assert (=> b!22530 (= e!14610 Unit!508)))

(declare-fun lt!7769 () Unit!498)

(assert (=> b!22530 (= lt!7769 call!1667)))

(assert (=> b!22530 (= lt!7773 call!1666)))

(assert (=> b!22530 (= c!2773 ((_ is MissingZero!52) lt!7773))))

(assert (=> b!22530 e!14620))

(declare-fun lt!7762 () Unit!498)

(assert (=> b!22530 (= lt!7762 lt!7769)))

(assert (=> b!22530 false))

(declare-fun b!22531 () Bool)

(declare-fun res!14185 () Bool)

(declare-fun e!14600 () Bool)

(assert (=> b!22531 (=> (not res!14185) (not e!14600))))

(assert (=> b!22531 (= res!14185 call!1686)))

(assert (=> b!22531 (= e!14620 e!14600)))

(declare-fun bm!1673 () Bool)

(assert (=> bm!1673 (= call!1668 call!1665)))

(declare-fun b!22532 () Bool)

(assert (=> b!22532 (= e!14607 e!14601)))

(declare-fun res!14186 () Bool)

(assert (=> b!22532 (= res!14186 (contains!227 call!1672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22532 (=> (not res!14186) (not e!14601))))

(declare-fun bm!1674 () Bool)

(declare-fun lt!7749 () (_ BitVec 32))

(assert (=> bm!1674 (= call!1682 (getCurrentListMap!125 (_keys!3154 lt!7452) (ite c!2782 (_values!1719 lt!7452) lt!7750) (mask!4711 lt!7452) (ite c!2782 (ite c!2786 lt!7749 lt!7747) (extraKeys!1631 lt!7452)) (ite (and c!2782 c!2786) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (zeroValue!1656 lt!7452)) (ite c!2782 (ite c!2786 (minValue!1656 lt!7452) (zeroValue!1656 (v!1582 (underlying!106 thiss!938)))) (minValue!1656 lt!7452)) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7452)))))

(declare-fun bm!1675 () Bool)

(declare-fun call!1674 () Bool)

(assert (=> bm!1675 (= call!1687 call!1674)))

(declare-fun b!22533 () Bool)

(declare-fun e!14609 () tuple2!920)

(assert (=> b!22533 (= e!14609 e!14599)))

(declare-fun c!2785 () Bool)

(assert (=> b!22533 (= c!2785 ((_ is MissingZero!52) lt!7764))))

(declare-fun b!22534 () Bool)

(declare-fun res!14176 () Bool)

(assert (=> b!22534 (= res!14176 call!1688)))

(assert (=> b!22534 (=> (not res!14176) (not e!14614))))

(declare-fun bm!1676 () Bool)

(assert (=> bm!1676 (= call!1680 (map!400 lt!7452))))

(declare-fun b!22535 () Bool)

(declare-fun lt!7767 () Unit!498)

(assert (=> b!22535 (= lt!7767 e!14604)))

(assert (=> b!22535 (= c!2780 call!1673)))

(assert (=> b!22535 (= e!14616 (tuple2!921 false lt!7452))))

(declare-fun bm!1677 () Bool)

(assert (=> bm!1677 (= call!1670 call!1674)))

(declare-fun b!22536 () Bool)

(assert (=> b!22536 (= e!14608 e!14619)))

(assert (=> b!22536 (= c!2786 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22537 () Bool)

(assert (=> b!22537 (= c!2775 ((_ is MissingVacant!52) lt!7764))))

(assert (=> b!22537 (= e!14616 e!14609)))

(declare-fun bm!1678 () Bool)

(assert (=> bm!1678 (= call!1685 (getCurrentListMap!125 (_keys!3154 lt!7452) (ite (or c!2782 c!2776) (_values!1719 lt!7452) (array!1222 (store (arr!578 (_values!1719 lt!7452)) (index!2330 lt!7764) (ValueCellFull!302 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))))) (size!674 (_values!1719 lt!7452)))) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) (zeroValue!1656 lt!7452) (minValue!1656 lt!7452) #b00000000000000000000000000000000 (defaultEntry!1731 lt!7452)))))

(declare-fun b!22538 () Bool)

(declare-fun c!2779 () Bool)

(assert (=> b!22538 (= c!2779 ((_ is MissingVacant!52) lt!7772))))

(assert (=> b!22538 (= e!14611 e!14612)))

(declare-fun b!22539 () Bool)

(assert (=> b!22539 (= e!14600 (not call!1687))))

(declare-fun b!22540 () Bool)

(declare-fun res!14178 () Bool)

(assert (=> b!22540 (= res!14178 call!1683)))

(assert (=> b!22540 (=> (not res!14178) (not e!14606))))

(declare-fun b!22541 () Bool)

(declare-fun call!1671 () ListLongMap!559)

(assert (=> b!22541 (= e!14602 call!1671)))

(declare-fun bm!1679 () Bool)

(assert (=> bm!1679 (= call!1686 call!1688)))

(declare-fun b!22542 () Bool)

(assert (=> b!22542 (= e!14615 (not call!1670))))

(declare-fun bm!1680 () Bool)

(assert (=> bm!1680 (= call!1679 call!1682)))

(declare-fun bm!1681 () Bool)

(assert (=> bm!1681 (= call!1681 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3154 lt!7452) (mask!4711 lt!7452)))))

(declare-fun b!22543 () Bool)

(declare-fun res!14177 () Bool)

(assert (=> b!22543 (=> (not res!14177) (not e!14600))))

(assert (=> b!22543 (= res!14177 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2329 lt!7773)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1682 () Bool)

(assert (=> bm!1682 (= call!1675 call!1681)))

(declare-fun b!22544 () Bool)

(declare-fun lt!7755 () tuple2!920)

(assert (=> b!22544 (= e!14609 (tuple2!921 (_1!463 lt!7755) (_2!463 lt!7755)))))

(assert (=> b!22544 (= lt!7755 call!1676)))

(declare-fun bm!1683 () Bool)

(assert (=> bm!1683 (= call!1677 call!1683)))

(declare-fun b!22545 () Bool)

(declare-fun lt!7771 () Unit!498)

(declare-fun lt!7757 () Unit!498)

(assert (=> b!22545 (= lt!7771 lt!7757)))

(assert (=> b!22545 (= call!1668 call!1679)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!8 (array!1223 array!1221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1163 V!1163 V!1163 Int) Unit!498)

(assert (=> b!22545 (= lt!7757 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3154 lt!7452) (_values!1719 lt!7452) (mask!4711 lt!7452) (extraKeys!1631 lt!7452) lt!7749 (zeroValue!1656 lt!7452) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 lt!7452) (defaultEntry!1731 lt!7452)))))

(assert (=> b!22545 (= lt!7749 (bvor (extraKeys!1631 lt!7452) #b00000000000000000000000000000001))))

(assert (=> b!22545 (= e!14619 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 lt!7452) (mask!4711 lt!7452) (bvor (extraKeys!1631 lt!7452) #b00000000000000000000000000000001) (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 lt!7452) (_size!138 lt!7452) (_keys!3154 lt!7452) (_values!1719 lt!7452) (_vacant!138 lt!7452))))))

(declare-fun bm!1684 () Bool)

(assert (=> bm!1684 (= call!1671 call!1685)))

(declare-fun b!22546 () Bool)

(assert (=> b!22546 (= e!14606 (= (select (arr!579 (_keys!3154 lt!7452)) (index!2330 lt!7760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1685 () Bool)

(assert (=> bm!1685 (= call!1674 (arrayContainsKey!0 (_keys!3154 lt!7452) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and d!3923 c!2782) b!22536))

(assert (= (and d!3923 (not c!2782)) b!22512))

(assert (= (and b!22536 c!2786) b!22545))

(assert (= (and b!22536 (not c!2786)) b!22510))

(assert (= (or b!22545 b!22510) bm!1680))

(assert (= (or b!22545 b!22510) bm!1684))

(assert (= (or b!22545 b!22510) bm!1673))

(assert (= (and b!22512 c!2776) b!22535))

(assert (= (and b!22512 (not c!2776)) b!22537))

(assert (= (and b!22535 c!2780) b!22518))

(assert (= (and b!22535 (not c!2780)) b!22520))

(assert (= (and b!22518 res!14184) b!22540))

(assert (= (and b!22540 res!14178) b!22546))

(assert (= (and b!22520 c!2777) b!22507))

(assert (= (and b!22520 (not c!2777)) b!22538))

(assert (= (and b!22507 res!14174) b!22522))

(assert (= (and b!22522 res!14180) b!22542))

(assert (= (and b!22538 c!2779) b!22525))

(assert (= (and b!22538 (not c!2779)) b!22515))

(assert (= (and b!22525 res!14182) b!22517))

(assert (= (and b!22517 res!14183) b!22521))

(assert (= (or b!22507 b!22525) bm!1683))

(assert (= (or b!22542 b!22521) bm!1677))

(assert (= (or b!22540 bm!1683) bm!1663))

(assert (= (or b!22518 b!22520) bm!1682))

(assert (= (and b!22537 c!2775) b!22544))

(assert (= (and b!22537 (not c!2775)) b!22533))

(assert (= (and b!22533 c!2785) b!22506))

(assert (= (and b!22533 (not c!2785)) b!22526))

(assert (= (and b!22526 c!2783) b!22505))

(assert (= (and b!22526 (not c!2783)) b!22530))

(assert (= (and b!22505 res!14175) b!22534))

(assert (= (and b!22534 res!14176) b!22527))

(assert (= (and b!22530 c!2773) b!22531))

(assert (= (and b!22530 (not c!2773)) b!22511))

(assert (= (and b!22531 res!14185) b!22543))

(assert (= (and b!22543 res!14177) b!22539))

(assert (= (and b!22511 c!2781) b!22509))

(assert (= (and b!22511 (not c!2781)) b!22508))

(assert (= (and b!22509 res!14187) b!22516))

(assert (= (and b!22516 res!14181) b!22524))

(assert (= (or b!22531 b!22509) bm!1679))

(assert (= (or b!22539 b!22524) bm!1675))

(assert (= (or b!22534 bm!1679) bm!1665))

(assert (= (or b!22505 b!22530) bm!1670))

(assert (= (or b!22544 b!22506) bm!1672))

(assert (= (or b!22518 b!22505) bm!1666))

(assert (= (or bm!1677 bm!1675) bm!1685))

(assert (= (or b!22520 b!22530) bm!1669))

(assert (= (or b!22535 b!22526) bm!1668))

(assert (= (or bm!1682 bm!1670) bm!1681))

(assert (= (or bm!1663 bm!1665) bm!1671))

(assert (= (or b!22535 b!22526) bm!1667))

(assert (= (and bm!1667 c!2774) b!22528))

(assert (= (and bm!1667 (not c!2774)) b!22529))

(assert (= (or bm!1680 b!22529) bm!1674))

(assert (= (or bm!1684 bm!1668) bm!1678))

(assert (= (or bm!1673 b!22526) bm!1664))

(assert (= (and bm!1664 c!2784) b!22541))

(assert (= (and bm!1664 (not c!2784)) b!22513))

(assert (= (and d!3923 res!14179) b!22519))

(assert (= (and b!22519 c!2778) b!22532))

(assert (= (and b!22519 (not c!2778)) b!22523))

(assert (= (and b!22532 res!14186) b!22514))

(assert (= (or b!22532 b!22514 b!22523) bm!1662))

(assert (= (or b!22514 b!22523) bm!1676))

(declare-fun m!16292 () Bool)

(assert (=> b!22514 m!16292))

(declare-fun m!16294 () Bool)

(assert (=> b!22512 m!16294))

(declare-fun m!16296 () Bool)

(assert (=> bm!1674 m!16296))

(declare-fun m!16298 () Bool)

(assert (=> b!22513 m!16298))

(declare-fun m!16300 () Bool)

(assert (=> bm!1685 m!16300))

(declare-fun m!16302 () Bool)

(assert (=> bm!1666 m!16302))

(assert (=> bm!1681 m!16294))

(declare-fun m!16304 () Bool)

(assert (=> b!22522 m!16304))

(declare-fun m!16306 () Bool)

(assert (=> b!22516 m!16306))

(declare-fun m!16308 () Bool)

(assert (=> bm!1669 m!16308))

(declare-fun m!16310 () Bool)

(assert (=> bm!1671 m!16310))

(declare-fun m!16312 () Bool)

(assert (=> d!3923 m!16312))

(declare-fun m!16314 () Bool)

(assert (=> d!3923 m!16314))

(declare-fun m!16316 () Bool)

(assert (=> bm!1676 m!16316))

(declare-fun m!16318 () Bool)

(assert (=> b!22532 m!16318))

(declare-fun m!16320 () Bool)

(assert (=> b!22545 m!16320))

(declare-fun m!16322 () Bool)

(assert (=> bm!1678 m!16322))

(declare-fun m!16324 () Bool)

(assert (=> bm!1678 m!16324))

(declare-fun m!16326 () Bool)

(assert (=> bm!1664 m!16326))

(declare-fun m!16328 () Bool)

(assert (=> b!22543 m!16328))

(declare-fun m!16330 () Bool)

(assert (=> b!22527 m!16330))

(declare-fun m!16332 () Bool)

(assert (=> bm!1662 m!16332))

(declare-fun m!16334 () Bool)

(assert (=> b!22517 m!16334))

(declare-fun m!16336 () Bool)

(assert (=> b!22510 m!16336))

(declare-fun m!16338 () Bool)

(assert (=> bm!1667 m!16338))

(declare-fun m!16340 () Bool)

(assert (=> bm!1667 m!16340))

(declare-fun m!16342 () Bool)

(assert (=> bm!1672 m!16342))

(declare-fun m!16344 () Bool)

(assert (=> b!22546 m!16344))

(assert (=> b!22526 m!16298))

(declare-fun m!16346 () Bool)

(assert (=> b!22526 m!16346))

(assert (=> b!22526 m!16322))

(declare-fun m!16348 () Bool)

(assert (=> b!22526 m!16348))

(assert (=> b!22526 m!16298))

(declare-fun m!16350 () Bool)

(assert (=> b!22526 m!16350))

(assert (=> b!22248 d!3923))

(declare-fun bm!1686 () Bool)

(declare-fun call!1696 () ListLongMap!559)

(declare-fun lt!7780 () tuple2!920)

(assert (=> bm!1686 (= call!1696 (map!400 (_2!463 lt!7780)))))

(declare-fun b!22547 () Bool)

(declare-fun e!14632 () Unit!498)

(declare-fun lt!7790 () Unit!498)

(assert (=> b!22547 (= e!14632 lt!7790)))

(declare-fun call!1693 () Unit!498)

(assert (=> b!22547 (= lt!7790 call!1693)))

(declare-fun lt!7781 () SeekEntryResult!52)

(declare-fun call!1690 () SeekEntryResult!52)

(assert (=> b!22547 (= lt!7781 call!1690)))

(declare-fun res!14189 () Bool)

(assert (=> b!22547 (= res!14189 ((_ is Found!52) lt!7781))))

(declare-fun e!14636 () Bool)

(assert (=> b!22547 (=> (not res!14189) (not e!14636))))

(assert (=> b!22547 e!14636))

(declare-fun bm!1687 () Bool)

(declare-fun call!1707 () Bool)

(declare-fun call!1702 () Bool)

(assert (=> bm!1687 (= call!1707 call!1702)))

(declare-fun bm!1689 () Bool)

(declare-fun call!1712 () Bool)

(assert (=> bm!1689 (= call!1712 call!1702)))

(declare-fun b!22548 () Bool)

(declare-fun lt!7797 () tuple2!920)

(declare-fun call!1700 () tuple2!920)

(assert (=> b!22548 (= lt!7797 call!1700)))

(declare-fun e!14621 () tuple2!920)

(assert (=> b!22548 (= e!14621 (tuple2!921 (_1!463 lt!7797) (_2!463 lt!7797)))))

(declare-fun b!22549 () Bool)

(declare-fun res!14188 () Bool)

(declare-fun e!14637 () Bool)

(assert (=> b!22549 (=> (not res!14188) (not e!14637))))

(declare-fun call!1701 () Bool)

(assert (=> b!22549 (= res!14188 call!1701)))

(declare-fun e!14633 () Bool)

(assert (=> b!22549 (= e!14633 e!14637)))

(declare-fun b!22550 () Bool)

(declare-fun e!14640 () Bool)

(declare-fun lt!7800 () SeekEntryResult!52)

(assert (=> b!22550 (= e!14640 ((_ is Undefined!52) lt!7800))))

(declare-fun bm!1690 () Bool)

(assert (=> bm!1690 (= call!1693 (lemmaInListMapThenSeekEntryOrOpenFindsIt!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun bm!1691 () Bool)

(declare-fun c!2788 () Bool)

(declare-fun c!2790 () Bool)

(assert (=> bm!1691 (= c!2788 c!2790)))

(declare-fun lt!7791 () SeekEntryResult!52)

(declare-fun call!1697 () Bool)

(declare-fun e!14625 () ListLongMap!559)

(assert (=> bm!1691 (= call!1697 (contains!227 e!14625 (ite c!2790 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7791)))))))

(declare-fun bm!1692 () Bool)

(declare-fun call!1708 () ListLongMap!559)

(declare-fun call!1709 () ListLongMap!559)

(assert (=> bm!1692 (= call!1708 call!1709)))

(declare-fun b!22551 () Bool)

(declare-fun e!14627 () Bool)

(assert (=> b!22551 (= e!14640 e!14627)))

(declare-fun res!14201 () Bool)

(declare-fun call!1710 () Bool)

(assert (=> b!22551 (= res!14201 call!1710)))

(assert (=> b!22551 (=> (not res!14201) (not e!14627))))

(declare-fun b!22552 () Bool)

(declare-fun lt!7792 () Unit!498)

(declare-fun lt!7785 () Unit!498)

(assert (=> b!22552 (= lt!7792 lt!7785)))

(declare-fun call!1692 () ListLongMap!559)

(declare-fun call!1703 () ListLongMap!559)

(assert (=> b!22552 (= call!1692 call!1703)))

(declare-fun lt!7774 () (_ BitVec 32))

(assert (=> b!22552 (= lt!7785 (lemmaChangeLongMinValueKeyThenAddPairToListMap!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) lt!7774 (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(assert (=> b!22552 (= lt!7774 (bvor (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000010))))

(declare-fun e!14641 () tuple2!920)

(assert (=> b!22552 (= e!14641 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (bvor (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000010) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (_size!138 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_vacant!138 (ite c!2691 (_2!463 lt!7459) lt!7452)))))))

(declare-fun b!22553 () Bool)

(declare-fun c!2795 () Bool)

(assert (=> b!22553 (= c!2795 ((_ is MissingVacant!52) lt!7800))))

(declare-fun e!14642 () Bool)

(assert (=> b!22553 (= e!14642 e!14640)))

(declare-fun b!22554 () Bool)

(declare-fun e!14630 () tuple2!920)

(declare-fun e!14638 () tuple2!920)

(assert (=> b!22554 (= e!14630 e!14638)))

(assert (=> b!22554 (= lt!7791 (seekEntryOrOpen!0 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(assert (=> b!22554 (= c!2790 ((_ is Undefined!52) lt!7791))))

(declare-fun b!22555 () Bool)

(declare-fun e!14624 () ListLongMap!559)

(assert (=> b!22555 (= e!14624 (getCurrentListMap!125 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000000 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun e!14623 () Bool)

(declare-fun call!1704 () ListLongMap!559)

(declare-fun b!22556 () Bool)

(assert (=> b!22556 (= e!14623 (= call!1696 (+!42 call!1704 (tuple2!929 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))))

(declare-fun call!1691 () Unit!498)

(declare-fun bm!1693 () Bool)

(assert (=> bm!1693 (= call!1691 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun bm!1694 () Bool)

(declare-fun call!1705 () SeekEntryResult!52)

(assert (=> bm!1694 (= call!1690 call!1705)))

(declare-fun b!22557 () Bool)

(declare-fun e!14634 () Bool)

(declare-fun lt!7799 () SeekEntryResult!52)

(assert (=> b!22557 (= e!14634 ((_ is Undefined!52) lt!7799))))

(declare-fun b!22558 () Bool)

(declare-fun res!14195 () Bool)

(assert (=> b!22558 (= res!14195 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2332 lt!7800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22558 (=> (not res!14195) (not e!14627))))

(declare-fun res!14197 () Bool)

(declare-fun b!22559 () Bool)

(assert (=> b!22559 (= res!14197 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2332 lt!7799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14639 () Bool)

(assert (=> b!22559 (=> (not res!14197) (not e!14639))))

(declare-fun c!2794 () Bool)

(declare-fun lt!7787 () SeekEntryResult!52)

(declare-fun bm!1695 () Bool)

(declare-fun c!2791 () Bool)

(declare-fun c!2787 () Bool)

(declare-fun c!2797 () Bool)

(assert (=> bm!1695 (= call!1702 (inRange!0 (ite c!2790 (ite c!2794 (index!2330 lt!7787) (ite c!2791 (index!2329 lt!7799) (index!2332 lt!7799))) (ite c!2797 (index!2330 lt!7781) (ite c!2787 (index!2329 lt!7800) (index!2332 lt!7800)))) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun b!22560 () Bool)

(declare-fun e!14626 () Unit!498)

(declare-fun Unit!509 () Unit!498)

(assert (=> b!22560 (= e!14626 Unit!509)))

(declare-fun lt!7786 () Unit!498)

(assert (=> b!22560 (= lt!7786 call!1693)))

(declare-fun call!1699 () SeekEntryResult!52)

(assert (=> b!22560 (= lt!7787 call!1699)))

(declare-fun res!14198 () Bool)

(assert (=> b!22560 (= res!14198 ((_ is Found!52) lt!7787))))

(declare-fun e!14628 () Bool)

(assert (=> b!22560 (=> (not res!14198) (not e!14628))))

(assert (=> b!22560 e!14628))

(declare-fun lt!7788 () Unit!498)

(assert (=> b!22560 (= lt!7788 lt!7786)))

(assert (=> b!22560 false))

(declare-fun b!22561 () Bool)

(declare-fun e!14635 () Bool)

(declare-fun e!14629 () Bool)

(assert (=> b!22561 (= e!14635 e!14629)))

(declare-fun c!2792 () Bool)

(assert (=> b!22561 (= c!2792 (_1!463 lt!7780))))

(declare-fun b!22562 () Bool)

(declare-fun lt!7778 () Unit!498)

(assert (=> b!22562 (= e!14626 lt!7778)))

(assert (=> b!22562 (= lt!7778 call!1691)))

(assert (=> b!22562 (= lt!7799 call!1699)))

(assert (=> b!22562 (= c!2791 ((_ is MissingZero!52) lt!7799))))

(assert (=> b!22562 e!14633))

(declare-fun b!22563 () Bool)

(declare-fun call!1694 () Bool)

(assert (=> b!22563 (= e!14639 (not call!1694))))

(declare-fun b!22564 () Bool)

(declare-fun res!14194 () Bool)

(assert (=> b!22564 (=> (not res!14194) (not e!14637))))

(assert (=> b!22564 (= res!14194 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2329 lt!7799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22565 () Bool)

(assert (=> b!22565 (= e!14629 (= call!1696 call!1704))))

(declare-fun b!22566 () Bool)

(declare-fun call!1711 () Bool)

(assert (=> b!22566 (= e!14627 (not call!1711))))

(declare-fun call!1689 () ListLongMap!559)

(declare-fun c!2796 () Bool)

(declare-fun c!2800 () Bool)

(declare-fun bm!1688 () Bool)

(assert (=> bm!1688 (= call!1689 (+!42 e!14624 (ite c!2796 (ite c!2800 (tuple2!929 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))) (tuple2!929 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))))) (tuple2!929 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))))

(declare-fun c!2798 () Bool)

(assert (=> bm!1688 (= c!2798 c!2796)))

(declare-fun d!3925 () Bool)

(assert (=> d!3925 e!14635))

(declare-fun res!14193 () Bool)

(assert (=> d!3925 (=> (not res!14193) (not e!14635))))

(assert (=> d!3925 (= res!14193 (valid!113 (_2!463 lt!7780)))))

(assert (=> d!3925 (= lt!7780 e!14630)))

(assert (=> d!3925 (= c!2796 (= (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3925 (valid!113 (ite c!2691 (_2!463 lt!7459) lt!7452))))

(assert (=> d!3925 (= (update!33 (ite c!2691 (_2!463 lt!7459) lt!7452) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))) lt!7780)))

(declare-fun b!22567 () Bool)

(assert (=> b!22567 (= e!14634 e!14639)))

(declare-fun res!14196 () Bool)

(assert (=> b!22567 (= res!14196 call!1701)))

(assert (=> b!22567 (=> (not res!14196) (not e!14639))))

(declare-fun b!22568 () Bool)

(declare-fun lt!7779 () Unit!498)

(declare-fun lt!7795 () Unit!498)

(assert (=> b!22568 (= lt!7779 lt!7795)))

(assert (=> b!22568 call!1697))

(declare-fun lt!7777 () array!1221)

(assert (=> b!22568 (= lt!7795 (lemmaValidKeyInArrayIsInListMap!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) lt!7777 (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (index!2330 lt!7791) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(assert (=> b!22568 (= lt!7777 (array!1222 (store (arr!578 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7791) (ValueCellFull!302 (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))))) (size!674 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)))))))

(declare-fun lt!7793 () Unit!498)

(declare-fun lt!7783 () Unit!498)

(assert (=> b!22568 (= lt!7793 lt!7783)))

(assert (=> b!22568 (= call!1689 call!1708)))

(assert (=> b!22568 (= lt!7783 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (index!2330 lt!7791) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun lt!7775 () Unit!498)

(assert (=> b!22568 (= lt!7775 e!14632)))

(assert (=> b!22568 (= c!2797 (contains!227 (getCurrentListMap!125 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000000 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22568 (= e!14621 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_size!138 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (array!1222 (store (arr!578 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7791) (ValueCellFull!302 (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))))) (size!674 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)))) (_vacant!138 (ite c!2691 (_2!463 lt!7459) lt!7452)))))))

(declare-fun b!22569 () Bool)

(assert (=> b!22569 (= e!14636 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7781)) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!2789 () Bool)

(declare-fun bm!1696 () Bool)

(assert (=> bm!1696 (= call!1700 (updateHelperNewKey!8 (ite c!2691 (_2!463 lt!7459) lt!7452) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (ite c!2789 (index!2332 lt!7791) (index!2329 lt!7791))))))

(declare-fun b!22570 () Bool)

(assert (=> b!22570 (= e!14625 call!1708)))

(declare-fun b!22571 () Bool)

(declare-fun call!1706 () ListLongMap!559)

(assert (=> b!22571 (= e!14625 call!1706)))

(declare-fun b!22572 () Bool)

(declare-fun Unit!510 () Unit!498)

(assert (=> b!22572 (= e!14632 Unit!510)))

(declare-fun lt!7796 () Unit!498)

(assert (=> b!22572 (= lt!7796 call!1691)))

(assert (=> b!22572 (= lt!7800 call!1690)))

(assert (=> b!22572 (= c!2787 ((_ is MissingZero!52) lt!7800))))

(assert (=> b!22572 e!14642))

(declare-fun lt!7789 () Unit!498)

(assert (=> b!22572 (= lt!7789 lt!7796)))

(assert (=> b!22572 false))

(declare-fun b!22573 () Bool)

(declare-fun res!14199 () Bool)

(declare-fun e!14622 () Bool)

(assert (=> b!22573 (=> (not res!14199) (not e!14622))))

(assert (=> b!22573 (= res!14199 call!1710)))

(assert (=> b!22573 (= e!14642 e!14622)))

(declare-fun bm!1697 () Bool)

(assert (=> bm!1697 (= call!1692 call!1689)))

(declare-fun b!22574 () Bool)

(assert (=> b!22574 (= e!14629 e!14623)))

(declare-fun res!14200 () Bool)

(assert (=> b!22574 (= res!14200 (contains!227 call!1696 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22574 (=> (not res!14200) (not e!14623))))

(declare-fun lt!7776 () (_ BitVec 32))

(declare-fun bm!1698 () Bool)

(assert (=> bm!1698 (= call!1706 (getCurrentListMap!125 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2796 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) lt!7777) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2796 (ite c!2800 lt!7776 lt!7774) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452))) (ite (and c!2796 c!2800) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452))) (ite c!2796 (ite c!2800 (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452))) #b00000000000000000000000000000000 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun bm!1699 () Bool)

(declare-fun call!1698 () Bool)

(assert (=> bm!1699 (= call!1711 call!1698)))

(declare-fun b!22575 () Bool)

(declare-fun e!14631 () tuple2!920)

(assert (=> b!22575 (= e!14631 e!14621)))

(declare-fun c!2799 () Bool)

(assert (=> b!22575 (= c!2799 ((_ is MissingZero!52) lt!7791))))

(declare-fun b!22576 () Bool)

(declare-fun res!14190 () Bool)

(assert (=> b!22576 (= res!14190 call!1712)))

(assert (=> b!22576 (=> (not res!14190) (not e!14636))))

(declare-fun bm!1700 () Bool)

(assert (=> bm!1700 (= call!1704 (map!400 (ite c!2691 (_2!463 lt!7459) lt!7452)))))

(declare-fun b!22577 () Bool)

(declare-fun lt!7794 () Unit!498)

(assert (=> b!22577 (= lt!7794 e!14626)))

(assert (=> b!22577 (= c!2794 call!1697)))

(assert (=> b!22577 (= e!14638 (tuple2!921 false (ite c!2691 (_2!463 lt!7459) lt!7452)))))

(declare-fun bm!1701 () Bool)

(assert (=> bm!1701 (= call!1694 call!1698)))

(declare-fun b!22578 () Bool)

(assert (=> b!22578 (= e!14630 e!14641)))

(assert (=> b!22578 (= c!2800 (= (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22579 () Bool)

(assert (=> b!22579 (= c!2789 ((_ is MissingVacant!52) lt!7791))))

(assert (=> b!22579 (= e!14638 e!14631)))

(declare-fun bm!1702 () Bool)

(assert (=> bm!1702 (= call!1709 (getCurrentListMap!125 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite (or c!2796 c!2790) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (array!1222 (store (arr!578 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7791) (ValueCellFull!302 (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))))) (size!674 (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452))))) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000000 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun b!22580 () Bool)

(declare-fun c!2793 () Bool)

(assert (=> b!22580 (= c!2793 ((_ is MissingVacant!52) lt!7799))))

(assert (=> b!22580 (= e!14633 e!14634)))

(declare-fun b!22581 () Bool)

(assert (=> b!22581 (= e!14622 (not call!1711))))

(declare-fun b!22582 () Bool)

(declare-fun res!14192 () Bool)

(assert (=> b!22582 (= res!14192 call!1707)))

(assert (=> b!22582 (=> (not res!14192) (not e!14628))))

(declare-fun b!22583 () Bool)

(declare-fun call!1695 () ListLongMap!559)

(assert (=> b!22583 (= e!14624 call!1695)))

(declare-fun bm!1703 () Bool)

(assert (=> bm!1703 (= call!1710 call!1712)))

(declare-fun b!22584 () Bool)

(assert (=> b!22584 (= e!14637 (not call!1694))))

(declare-fun bm!1704 () Bool)

(assert (=> bm!1704 (= call!1703 call!1706)))

(declare-fun bm!1705 () Bool)

(assert (=> bm!1705 (= call!1705 (seekEntryOrOpen!0 (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(declare-fun b!22585 () Bool)

(declare-fun res!14191 () Bool)

(assert (=> b!22585 (=> (not res!14191) (not e!14622))))

(assert (=> b!22585 (= res!14191 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2329 lt!7800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1706 () Bool)

(assert (=> bm!1706 (= call!1699 call!1705)))

(declare-fun b!22586 () Bool)

(declare-fun lt!7782 () tuple2!920)

(assert (=> b!22586 (= e!14631 (tuple2!921 (_1!463 lt!7782) (_2!463 lt!7782)))))

(assert (=> b!22586 (= lt!7782 call!1700)))

(declare-fun bm!1707 () Bool)

(assert (=> bm!1707 (= call!1701 call!1707)))

(declare-fun b!22587 () Bool)

(declare-fun lt!7798 () Unit!498)

(declare-fun lt!7784 () Unit!498)

(assert (=> b!22587 (= lt!7798 lt!7784)))

(assert (=> b!22587 (= call!1692 call!1703)))

(assert (=> b!22587 (= lt!7784 (lemmaChangeZeroKeyThenAddPairToListMap!8 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) lt!7776 (zeroValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452))))))

(assert (=> b!22587 (= lt!7776 (bvor (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000001))))

(assert (=> b!22587 (= e!14641 (tuple2!921 true (LongMapFixedSize!191 (defaultEntry!1731 (ite c!2691 (_2!463 lt!7459) lt!7452)) (mask!4711 (ite c!2691 (_2!463 lt!7459) lt!7452)) (bvor (extraKeys!1631 (ite c!2691 (_2!463 lt!7459) lt!7452)) #b00000000000000000000000000000001) (ite c!2691 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2693 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938))))) (minValue!1656 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_size!138 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_values!1719 (ite c!2691 (_2!463 lt!7459) lt!7452)) (_vacant!138 (ite c!2691 (_2!463 lt!7459) lt!7452)))))))

(declare-fun bm!1708 () Bool)

(assert (=> bm!1708 (= call!1695 call!1709)))

(declare-fun b!22588 () Bool)

(assert (=> b!22588 (= e!14628 (= (select (arr!579 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452))) (index!2330 lt!7787)) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1709 () Bool)

(assert (=> bm!1709 (= call!1698 (arrayContainsKey!0 (_keys!3154 (ite c!2691 (_2!463 lt!7459) lt!7452)) (ite c!2691 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2693 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(assert (= (and d!3925 c!2796) b!22578))

(assert (= (and d!3925 (not c!2796)) b!22554))

(assert (= (and b!22578 c!2800) b!22587))

(assert (= (and b!22578 (not c!2800)) b!22552))

(assert (= (or b!22587 b!22552) bm!1704))

(assert (= (or b!22587 b!22552) bm!1708))

(assert (= (or b!22587 b!22552) bm!1697))

(assert (= (and b!22554 c!2790) b!22577))

(assert (= (and b!22554 (not c!2790)) b!22579))

(assert (= (and b!22577 c!2794) b!22560))

(assert (= (and b!22577 (not c!2794)) b!22562))

(assert (= (and b!22560 res!14198) b!22582))

(assert (= (and b!22582 res!14192) b!22588))

(assert (= (and b!22562 c!2791) b!22549))

(assert (= (and b!22562 (not c!2791)) b!22580))

(assert (= (and b!22549 res!14188) b!22564))

(assert (= (and b!22564 res!14194) b!22584))

(assert (= (and b!22580 c!2793) b!22567))

(assert (= (and b!22580 (not c!2793)) b!22557))

(assert (= (and b!22567 res!14196) b!22559))

(assert (= (and b!22559 res!14197) b!22563))

(assert (= (or b!22549 b!22567) bm!1707))

(assert (= (or b!22584 b!22563) bm!1701))

(assert (= (or b!22582 bm!1707) bm!1687))

(assert (= (or b!22560 b!22562) bm!1706))

(assert (= (and b!22579 c!2789) b!22586))

(assert (= (and b!22579 (not c!2789)) b!22575))

(assert (= (and b!22575 c!2799) b!22548))

(assert (= (and b!22575 (not c!2799)) b!22568))

(assert (= (and b!22568 c!2797) b!22547))

(assert (= (and b!22568 (not c!2797)) b!22572))

(assert (= (and b!22547 res!14189) b!22576))

(assert (= (and b!22576 res!14190) b!22569))

(assert (= (and b!22572 c!2787) b!22573))

(assert (= (and b!22572 (not c!2787)) b!22553))

(assert (= (and b!22573 res!14199) b!22585))

(assert (= (and b!22585 res!14191) b!22581))

(assert (= (and b!22553 c!2795) b!22551))

(assert (= (and b!22553 (not c!2795)) b!22550))

(assert (= (and b!22551 res!14201) b!22558))

(assert (= (and b!22558 res!14195) b!22566))

(assert (= (or b!22573 b!22551) bm!1703))

(assert (= (or b!22581 b!22566) bm!1699))

(assert (= (or b!22576 bm!1703) bm!1689))

(assert (= (or b!22547 b!22572) bm!1694))

(assert (= (or b!22586 b!22548) bm!1696))

(assert (= (or b!22560 b!22547) bm!1690))

(assert (= (or bm!1701 bm!1699) bm!1709))

(assert (= (or b!22562 b!22572) bm!1693))

(assert (= (or b!22577 b!22568) bm!1692))

(assert (= (or bm!1706 bm!1694) bm!1705))

(assert (= (or bm!1687 bm!1689) bm!1695))

(assert (= (or b!22577 b!22568) bm!1691))

(assert (= (and bm!1691 c!2788) b!22570))

(assert (= (and bm!1691 (not c!2788)) b!22571))

(assert (= (or bm!1704 b!22571) bm!1698))

(assert (= (or bm!1708 bm!1692) bm!1702))

(assert (= (or bm!1697 b!22568) bm!1688))

(assert (= (and bm!1688 c!2798) b!22583))

(assert (= (and bm!1688 (not c!2798)) b!22555))

(assert (= (and d!3925 res!14193) b!22561))

(assert (= (and b!22561 c!2792) b!22574))

(assert (= (and b!22561 (not c!2792)) b!22565))

(assert (= (and b!22574 res!14200) b!22556))

(assert (= (or b!22574 b!22556 b!22565) bm!1686))

(assert (= (or b!22556 b!22565) bm!1700))

(declare-fun m!16352 () Bool)

(assert (=> b!22556 m!16352))

(declare-fun m!16354 () Bool)

(assert (=> b!22554 m!16354))

(declare-fun m!16356 () Bool)

(assert (=> bm!1698 m!16356))

(declare-fun m!16358 () Bool)

(assert (=> b!22555 m!16358))

(declare-fun m!16360 () Bool)

(assert (=> bm!1709 m!16360))

(declare-fun m!16362 () Bool)

(assert (=> bm!1690 m!16362))

(assert (=> bm!1705 m!16354))

(declare-fun m!16364 () Bool)

(assert (=> b!22564 m!16364))

(declare-fun m!16366 () Bool)

(assert (=> b!22558 m!16366))

(declare-fun m!16368 () Bool)

(assert (=> bm!1693 m!16368))

(declare-fun m!16370 () Bool)

(assert (=> bm!1695 m!16370))

(declare-fun m!16372 () Bool)

(assert (=> d!3925 m!16372))

(declare-fun m!16374 () Bool)

(assert (=> d!3925 m!16374))

(declare-fun m!16376 () Bool)

(assert (=> bm!1700 m!16376))

(declare-fun m!16378 () Bool)

(assert (=> b!22574 m!16378))

(declare-fun m!16380 () Bool)

(assert (=> b!22587 m!16380))

(declare-fun m!16382 () Bool)

(assert (=> bm!1702 m!16382))

(declare-fun m!16384 () Bool)

(assert (=> bm!1702 m!16384))

(declare-fun m!16386 () Bool)

(assert (=> bm!1688 m!16386))

(declare-fun m!16388 () Bool)

(assert (=> b!22585 m!16388))

(declare-fun m!16390 () Bool)

(assert (=> b!22569 m!16390))

(declare-fun m!16392 () Bool)

(assert (=> bm!1686 m!16392))

(declare-fun m!16394 () Bool)

(assert (=> b!22559 m!16394))

(declare-fun m!16396 () Bool)

(assert (=> b!22552 m!16396))

(declare-fun m!16398 () Bool)

(assert (=> bm!1691 m!16398))

(declare-fun m!16400 () Bool)

(assert (=> bm!1691 m!16400))

(declare-fun m!16402 () Bool)

(assert (=> bm!1696 m!16402))

(declare-fun m!16404 () Bool)

(assert (=> b!22588 m!16404))

(assert (=> b!22568 m!16358))

(declare-fun m!16406 () Bool)

(assert (=> b!22568 m!16406))

(assert (=> b!22568 m!16382))

(declare-fun m!16408 () Bool)

(assert (=> b!22568 m!16408))

(assert (=> b!22568 m!16358))

(declare-fun m!16410 () Bool)

(assert (=> b!22568 m!16410))

(assert (=> bm!1561 d!3925))

(declare-fun d!3927 () Bool)

(assert (=> d!3927 (= (array_inv!413 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) (bvsge (size!675 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22249 d!3927))

(declare-fun d!3929 () Bool)

(assert (=> d!3929 (= (array_inv!414 (_values!1719 (v!1582 (underlying!106 thiss!938)))) (bvsge (size!674 (_values!1719 (v!1582 (underlying!106 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22249 d!3929))

(declare-fun mapIsEmpty!998 () Bool)

(declare-fun mapRes!998 () Bool)

(assert (=> mapIsEmpty!998 mapRes!998))

(declare-fun condMapEmpty!998 () Bool)

(declare-fun mapDefault!998 () ValueCell!302)

(assert (=> mapNonEmpty!989 (= condMapEmpty!998 (= mapRest!989 ((as const (Array (_ BitVec 32) ValueCell!302)) mapDefault!998)))))

(declare-fun e!14648 () Bool)

(assert (=> mapNonEmpty!989 (= tp!3458 (and e!14648 mapRes!998))))

(declare-fun b!22596 () Bool)

(assert (=> b!22596 (= e!14648 tp_is_empty!1003)))

(declare-fun b!22595 () Bool)

(declare-fun e!14647 () Bool)

(assert (=> b!22595 (= e!14647 tp_is_empty!1003)))

(declare-fun mapNonEmpty!998 () Bool)

(declare-fun tp!3473 () Bool)

(assert (=> mapNonEmpty!998 (= mapRes!998 (and tp!3473 e!14647))))

(declare-fun mapKey!998 () (_ BitVec 32))

(declare-fun mapRest!998 () (Array (_ BitVec 32) ValueCell!302))

(declare-fun mapValue!998 () ValueCell!302)

(assert (=> mapNonEmpty!998 (= mapRest!989 (store mapRest!998 mapKey!998 mapValue!998))))

(assert (= (and mapNonEmpty!989 condMapEmpty!998) mapIsEmpty!998))

(assert (= (and mapNonEmpty!989 (not condMapEmpty!998)) mapNonEmpty!998))

(assert (= (and mapNonEmpty!998 ((_ is ValueCellFull!302) mapValue!998)) b!22595))

(assert (= (and mapNonEmpty!989 ((_ is ValueCellFull!302) mapDefault!998)) b!22596))

(declare-fun m!16412 () Bool)

(assert (=> mapNonEmpty!998 m!16412))

(declare-fun b_lambda!1549 () Bool)

(assert (= b_lambda!1543 (or (and b!22249 b_free!739) b_lambda!1549)))

(declare-fun b_lambda!1551 () Bool)

(assert (= b_lambda!1547 (or (and b!22249 b_free!739) b_lambda!1551)))

(declare-fun b_lambda!1553 () Bool)

(assert (= b_lambda!1545 (or (and b!22249 b_free!739) b_lambda!1553)))

(check-sat (not mapNonEmpty!998) (not bm!1705) (not b!22526) (not b!22412) (not b_next!739) (not bm!1681) (not bm!1602) (not b!22408) (not bm!1691) (not b!22362) (not bm!1601) (not b!22512) (not bm!1667) (not b_lambda!1553) (not d!3917) (not d!3919) (not b!22418) (not b!22510) (not b!22365) (not bm!1607) (not b!22555) (not b!22532) (not b!22574) tp_is_empty!1003 (not bm!1672) (not b!22513) (not bm!1702) (not d!3921) (not bm!1605) (not d!3923) (not bm!1678) (not b!22367) (not bm!1604) (not bm!1674) (not bm!1688) (not d!3915) (not d!3913) (not b!22587) (not bm!1613) (not bm!1695) (not bm!1666) (not bm!1603) (not b!22414) (not bm!1612) (not bm!1608) (not bm!1709) (not bm!1693) (not b!22556) (not bm!1676) (not bm!1611) (not b!22514) (not b_lambda!1549) (not b!22554) b_and!1455 (not bm!1696) (not b!22552) (not bm!1606) (not bm!1664) (not bm!1700) (not bm!1609) (not bm!1662) (not b_lambda!1551) (not bm!1669) (not bm!1610) (not b!22419) (not bm!1698) (not b!22376) (not bm!1671) (not bm!1690) (not bm!1686) (not b!22568) (not b!22545) (not bm!1685) (not d!3925))
(check-sat b_and!1455 (not b_next!739))
