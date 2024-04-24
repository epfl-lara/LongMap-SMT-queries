; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107866 () Bool)

(assert start!107866)

(declare-fun b!1275237 () Bool)

(declare-fun b_free!27757 () Bool)

(declare-fun b_next!27757 () Bool)

(assert (=> b!1275237 (= b_free!27757 (not b_next!27757))))

(declare-fun tp!97834 () Bool)

(declare-fun b_and!45815 () Bool)

(assert (=> b!1275237 (= tp!97834 b_and!45815)))

(declare-fun b!1275231 () Bool)

(declare-fun res!847550 () Bool)

(declare-fun e!727782 () Bool)

(assert (=> b!1275231 (=> (not res!847550) (not e!727782))))

(declare-datatypes ((V!49363 0))(
  ( (V!49364 (val!16638 Int)) )
))
(declare-datatypes ((ValueCell!15710 0))(
  ( (ValueCellFull!15710 (v!19270 V!49363)) (EmptyCell!15710) )
))
(declare-datatypes ((array!83553 0))(
  ( (array!83554 (arr!40292 (Array (_ BitVec 32) ValueCell!15710)) (size!40840 (_ BitVec 32))) )
))
(declare-datatypes ((array!83555 0))(
  ( (array!83556 (arr!40293 (Array (_ BitVec 32) (_ BitVec 64))) (size!40841 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6184 0))(
  ( (LongMapFixedSize!6185 (defaultEntry!6738 Int) (mask!34596 (_ BitVec 32)) (extraKeys!6417 (_ BitVec 32)) (zeroValue!6523 V!49363) (minValue!6523 V!49363) (_size!3147 (_ BitVec 32)) (_keys!12191 array!83555) (_values!6761 array!83553) (_vacant!3147 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6184)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83555 (_ BitVec 32)) Bool)

(assert (=> b!1275231 (= res!847550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12191 thiss!1551) (mask!34596 thiss!1551)))))

(declare-fun b!1275232 () Bool)

(declare-fun e!727783 () Bool)

(declare-fun e!727786 () Bool)

(declare-fun mapRes!51328 () Bool)

(assert (=> b!1275232 (= e!727783 (and e!727786 mapRes!51328))))

(declare-fun condMapEmpty!51328 () Bool)

(declare-fun mapDefault!51328 () ValueCell!15710)

(assert (=> b!1275232 (= condMapEmpty!51328 (= (arr!40292 (_values!6761 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51328)))))

(declare-fun res!847552 () Bool)

(assert (=> start!107866 (=> (not res!847552) (not e!727782))))

(declare-fun simpleValid!479 (LongMapFixedSize!6184) Bool)

(assert (=> start!107866 (= res!847552 (simpleValid!479 thiss!1551))))

(assert (=> start!107866 e!727782))

(declare-fun e!727784 () Bool)

(assert (=> start!107866 e!727784))

(declare-fun mapNonEmpty!51328 () Bool)

(declare-fun tp!97833 () Bool)

(declare-fun e!727785 () Bool)

(assert (=> mapNonEmpty!51328 (= mapRes!51328 (and tp!97833 e!727785))))

(declare-fun mapRest!51328 () (Array (_ BitVec 32) ValueCell!15710))

(declare-fun mapKey!51328 () (_ BitVec 32))

(declare-fun mapValue!51328 () ValueCell!15710)

(assert (=> mapNonEmpty!51328 (= (arr!40292 (_values!6761 thiss!1551)) (store mapRest!51328 mapKey!51328 mapValue!51328))))

(declare-fun b!1275233 () Bool)

(assert (=> b!1275233 (= e!727782 (and (bvsle #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))) (bvsge (size!40841 (_keys!12191 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1275234 () Bool)

(declare-fun tp_is_empty!33127 () Bool)

(assert (=> b!1275234 (= e!727785 tp_is_empty!33127)))

(declare-fun mapIsEmpty!51328 () Bool)

(assert (=> mapIsEmpty!51328 mapRes!51328))

(declare-fun b!1275235 () Bool)

(assert (=> b!1275235 (= e!727786 tp_is_empty!33127)))

(declare-fun b!1275236 () Bool)

(declare-fun res!847551 () Bool)

(assert (=> b!1275236 (=> (not res!847551) (not e!727782))))

(declare-fun arrayCountValidKeys!0 (array!83555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1275236 (= res!847551 (= (arrayCountValidKeys!0 (_keys!12191 thiss!1551) #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))) (_size!3147 thiss!1551)))))

(declare-fun array_inv!30807 (array!83555) Bool)

(declare-fun array_inv!30808 (array!83553) Bool)

(assert (=> b!1275237 (= e!727784 (and tp!97834 tp_is_empty!33127 (array_inv!30807 (_keys!12191 thiss!1551)) (array_inv!30808 (_values!6761 thiss!1551)) e!727783))))

(assert (= (and start!107866 res!847552) b!1275236))

(assert (= (and b!1275236 res!847551) b!1275231))

(assert (= (and b!1275231 res!847550) b!1275233))

(assert (= (and b!1275232 condMapEmpty!51328) mapIsEmpty!51328))

(assert (= (and b!1275232 (not condMapEmpty!51328)) mapNonEmpty!51328))

(get-info :version)

(assert (= (and mapNonEmpty!51328 ((_ is ValueCellFull!15710) mapValue!51328)) b!1275234))

(assert (= (and b!1275232 ((_ is ValueCellFull!15710) mapDefault!51328)) b!1275235))

(assert (= b!1275237 b!1275232))

(assert (= start!107866 b!1275237))

(declare-fun m!1172491 () Bool)

(assert (=> b!1275236 m!1172491))

(declare-fun m!1172493 () Bool)

(assert (=> b!1275231 m!1172493))

(declare-fun m!1172495 () Bool)

(assert (=> start!107866 m!1172495))

(declare-fun m!1172497 () Bool)

(assert (=> b!1275237 m!1172497))

(declare-fun m!1172499 () Bool)

(assert (=> b!1275237 m!1172499))

(declare-fun m!1172501 () Bool)

(assert (=> mapNonEmpty!51328 m!1172501))

(check-sat (not b!1275236) (not b_next!27757) b_and!45815 (not b!1275237) (not mapNonEmpty!51328) (not b!1275231) (not start!107866) tp_is_empty!33127)
(check-sat b_and!45815 (not b_next!27757))
(get-model)

(declare-fun b!1275291 () Bool)

(declare-fun e!727826 () Bool)

(assert (=> b!1275291 (= e!727826 (and (bvsge (extraKeys!6417 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6417 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3147 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1275289 () Bool)

(declare-fun res!847579 () Bool)

(assert (=> b!1275289 (=> (not res!847579) (not e!727826))))

(declare-fun size!40846 (LongMapFixedSize!6184) (_ BitVec 32))

(assert (=> b!1275289 (= res!847579 (bvsge (size!40846 thiss!1551) (_size!3147 thiss!1551)))))

(declare-fun b!1275290 () Bool)

(declare-fun res!847580 () Bool)

(assert (=> b!1275290 (=> (not res!847580) (not e!727826))))

(assert (=> b!1275290 (= res!847580 (= (size!40846 thiss!1551) (bvadd (_size!3147 thiss!1551) (bvsdiv (bvadd (extraKeys!6417 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1275288 () Bool)

(declare-fun res!847582 () Bool)

(assert (=> b!1275288 (=> (not res!847582) (not e!727826))))

(assert (=> b!1275288 (= res!847582 (and (= (size!40840 (_values!6761 thiss!1551)) (bvadd (mask!34596 thiss!1551) #b00000000000000000000000000000001)) (= (size!40841 (_keys!12191 thiss!1551)) (size!40840 (_values!6761 thiss!1551))) (bvsge (_size!3147 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3147 thiss!1551) (bvadd (mask!34596 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun d!140503 () Bool)

(declare-fun res!847581 () Bool)

(assert (=> d!140503 (=> (not res!847581) (not e!727826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140503 (= res!847581 (validMask!0 (mask!34596 thiss!1551)))))

(assert (=> d!140503 (= (simpleValid!479 thiss!1551) e!727826)))

(assert (= (and d!140503 res!847581) b!1275288))

(assert (= (and b!1275288 res!847582) b!1275289))

(assert (= (and b!1275289 res!847579) b!1275290))

(assert (= (and b!1275290 res!847580) b!1275291))

(declare-fun m!1172527 () Bool)

(assert (=> b!1275289 m!1172527))

(assert (=> b!1275290 m!1172527))

(declare-fun m!1172529 () Bool)

(assert (=> d!140503 m!1172529))

(assert (=> start!107866 d!140503))

(declare-fun d!140505 () Bool)

(assert (=> d!140505 (= (array_inv!30807 (_keys!12191 thiss!1551)) (bvsge (size!40841 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275237 d!140505))

(declare-fun d!140507 () Bool)

(assert (=> d!140507 (= (array_inv!30808 (_values!6761 thiss!1551)) (bvsge (size!40840 (_values!6761 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275237 d!140507))

(declare-fun d!140509 () Bool)

(declare-fun lt!575648 () (_ BitVec 32))

(assert (=> d!140509 (and (bvsge lt!575648 #b00000000000000000000000000000000) (bvsle lt!575648 (bvsub (size!40841 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!727831 () (_ BitVec 32))

(assert (=> d!140509 (= lt!575648 e!727831)))

(declare-fun c!124192 () Bool)

(assert (=> d!140509 (= c!124192 (bvsge #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140509 (and (bvsle #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40841 (_keys!12191 thiss!1551)) (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140509 (= (arrayCountValidKeys!0 (_keys!12191 thiss!1551) #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))) lt!575648)))

(declare-fun b!1275300 () Bool)

(declare-fun e!727832 () (_ BitVec 32))

(assert (=> b!1275300 (= e!727831 e!727832)))

(declare-fun c!124191 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275300 (= c!124191 (validKeyInArray!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275301 () Bool)

(assert (=> b!1275301 (= e!727831 #b00000000000000000000000000000000)))

(declare-fun bm!62677 () Bool)

(declare-fun call!62680 () (_ BitVec 32))

(assert (=> bm!62677 (= call!62680 (arrayCountValidKeys!0 (_keys!12191 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))))))

(declare-fun b!1275302 () Bool)

(assert (=> b!1275302 (= e!727832 (bvadd #b00000000000000000000000000000001 call!62680))))

(declare-fun b!1275303 () Bool)

(assert (=> b!1275303 (= e!727832 call!62680)))

(assert (= (and d!140509 c!124192) b!1275301))

(assert (= (and d!140509 (not c!124192)) b!1275300))

(assert (= (and b!1275300 c!124191) b!1275302))

(assert (= (and b!1275300 (not c!124191)) b!1275303))

(assert (= (or b!1275302 b!1275303) bm!62677))

(declare-fun m!1172531 () Bool)

(assert (=> b!1275300 m!1172531))

(assert (=> b!1275300 m!1172531))

(declare-fun m!1172533 () Bool)

(assert (=> b!1275300 m!1172533))

(declare-fun m!1172535 () Bool)

(assert (=> bm!62677 m!1172535))

(assert (=> b!1275236 d!140509))

(declare-fun bm!62680 () Bool)

(declare-fun call!62683 () Bool)

(assert (=> bm!62680 (= call!62683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)))))

(declare-fun b!1275312 () Bool)

(declare-fun e!727841 () Bool)

(declare-fun e!727839 () Bool)

(assert (=> b!1275312 (= e!727841 e!727839)))

(declare-fun c!124195 () Bool)

(assert (=> b!1275312 (= c!124195 (validKeyInArray!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275313 () Bool)

(declare-fun e!727840 () Bool)

(assert (=> b!1275313 (= e!727840 call!62683)))

(declare-fun b!1275314 () Bool)

(assert (=> b!1275314 (= e!727839 e!727840)))

(declare-fun lt!575657 () (_ BitVec 64))

(assert (=> b!1275314 (= lt!575657 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42307 0))(
  ( (Unit!42308) )
))
(declare-fun lt!575655 () Unit!42307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83555 (_ BitVec 64) (_ BitVec 32)) Unit!42307)

(assert (=> b!1275314 (= lt!575655 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275314 (arrayContainsKey!0 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000)))

(declare-fun lt!575656 () Unit!42307)

(assert (=> b!1275314 (= lt!575656 lt!575655)))

(declare-fun res!847588 () Bool)

(declare-datatypes ((SeekEntryResult!9954 0))(
  ( (MissingZero!9954 (index!42187 (_ BitVec 32))) (Found!9954 (index!42188 (_ BitVec 32))) (Intermediate!9954 (undefined!10766 Bool) (index!42189 (_ BitVec 32)) (x!112675 (_ BitVec 32))) (Undefined!9954) (MissingVacant!9954 (index!42190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83555 (_ BitVec 32)) SeekEntryResult!9954)

(assert (=> b!1275314 (= res!847588 (= (seekEntryOrOpen!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)) (Found!9954 #b00000000000000000000000000000000)))))

(assert (=> b!1275314 (=> (not res!847588) (not e!727840))))

(declare-fun d!140511 () Bool)

(declare-fun res!847587 () Bool)

(assert (=> d!140511 (=> res!847587 e!727841)))

(assert (=> d!140511 (= res!847587 (bvsge #b00000000000000000000000000000000 (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12191 thiss!1551) (mask!34596 thiss!1551)) e!727841)))

(declare-fun b!1275315 () Bool)

(assert (=> b!1275315 (= e!727839 call!62683)))

(assert (= (and d!140511 (not res!847587)) b!1275312))

(assert (= (and b!1275312 c!124195) b!1275314))

(assert (= (and b!1275312 (not c!124195)) b!1275315))

(assert (= (and b!1275314 res!847588) b!1275313))

(assert (= (or b!1275313 b!1275315) bm!62680))

(declare-fun m!1172537 () Bool)

(assert (=> bm!62680 m!1172537))

(assert (=> b!1275312 m!1172531))

(assert (=> b!1275312 m!1172531))

(assert (=> b!1275312 m!1172533))

(assert (=> b!1275314 m!1172531))

(declare-fun m!1172539 () Bool)

(assert (=> b!1275314 m!1172539))

(declare-fun m!1172541 () Bool)

(assert (=> b!1275314 m!1172541))

(assert (=> b!1275314 m!1172531))

(declare-fun m!1172543 () Bool)

(assert (=> b!1275314 m!1172543))

(assert (=> b!1275231 d!140511))

(declare-fun mapNonEmpty!51337 () Bool)

(declare-fun mapRes!51337 () Bool)

(declare-fun tp!97849 () Bool)

(declare-fun e!727846 () Bool)

(assert (=> mapNonEmpty!51337 (= mapRes!51337 (and tp!97849 e!727846))))

(declare-fun mapRest!51337 () (Array (_ BitVec 32) ValueCell!15710))

(declare-fun mapKey!51337 () (_ BitVec 32))

(declare-fun mapValue!51337 () ValueCell!15710)

(assert (=> mapNonEmpty!51337 (= mapRest!51328 (store mapRest!51337 mapKey!51337 mapValue!51337))))

(declare-fun mapIsEmpty!51337 () Bool)

(assert (=> mapIsEmpty!51337 mapRes!51337))

(declare-fun b!1275322 () Bool)

(assert (=> b!1275322 (= e!727846 tp_is_empty!33127)))

(declare-fun b!1275323 () Bool)

(declare-fun e!727847 () Bool)

(assert (=> b!1275323 (= e!727847 tp_is_empty!33127)))

(declare-fun condMapEmpty!51337 () Bool)

(declare-fun mapDefault!51337 () ValueCell!15710)

(assert (=> mapNonEmpty!51328 (= condMapEmpty!51337 (= mapRest!51328 ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51337)))))

(assert (=> mapNonEmpty!51328 (= tp!97833 (and e!727847 mapRes!51337))))

(assert (= (and mapNonEmpty!51328 condMapEmpty!51337) mapIsEmpty!51337))

(assert (= (and mapNonEmpty!51328 (not condMapEmpty!51337)) mapNonEmpty!51337))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15710) mapValue!51337)) b!1275322))

(assert (= (and mapNonEmpty!51328 ((_ is ValueCellFull!15710) mapDefault!51337)) b!1275323))

(declare-fun m!1172545 () Bool)

(assert (=> mapNonEmpty!51337 m!1172545))

(check-sat (not b!1275300) (not d!140503) (not b!1275314) (not bm!62677) b_and!45815 tp_is_empty!33127 (not mapNonEmpty!51337) (not b!1275312) (not b!1275290) (not b_next!27757) (not b!1275289) (not bm!62680))
(check-sat b_and!45815 (not b_next!27757))
(get-model)

(declare-fun d!140513 () Bool)

(assert (=> d!140513 (= (validKeyInArray!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)) (and (not (= (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1275312 d!140513))

(declare-fun d!140515 () Bool)

(assert (=> d!140515 (= (validMask!0 (mask!34596 thiss!1551)) (and (or (= (mask!34596 thiss!1551) #b00000000000000000000000000000111) (= (mask!34596 thiss!1551) #b00000000000000000000000000001111) (= (mask!34596 thiss!1551) #b00000000000000000000000000011111) (= (mask!34596 thiss!1551) #b00000000000000000000000000111111) (= (mask!34596 thiss!1551) #b00000000000000000000000001111111) (= (mask!34596 thiss!1551) #b00000000000000000000000011111111) (= (mask!34596 thiss!1551) #b00000000000000000000000111111111) (= (mask!34596 thiss!1551) #b00000000000000000000001111111111) (= (mask!34596 thiss!1551) #b00000000000000000000011111111111) (= (mask!34596 thiss!1551) #b00000000000000000000111111111111) (= (mask!34596 thiss!1551) #b00000000000000000001111111111111) (= (mask!34596 thiss!1551) #b00000000000000000011111111111111) (= (mask!34596 thiss!1551) #b00000000000000000111111111111111) (= (mask!34596 thiss!1551) #b00000000000000001111111111111111) (= (mask!34596 thiss!1551) #b00000000000000011111111111111111) (= (mask!34596 thiss!1551) #b00000000000000111111111111111111) (= (mask!34596 thiss!1551) #b00000000000001111111111111111111) (= (mask!34596 thiss!1551) #b00000000000011111111111111111111) (= (mask!34596 thiss!1551) #b00000000000111111111111111111111) (= (mask!34596 thiss!1551) #b00000000001111111111111111111111) (= (mask!34596 thiss!1551) #b00000000011111111111111111111111) (= (mask!34596 thiss!1551) #b00000000111111111111111111111111) (= (mask!34596 thiss!1551) #b00000001111111111111111111111111) (= (mask!34596 thiss!1551) #b00000011111111111111111111111111) (= (mask!34596 thiss!1551) #b00000111111111111111111111111111) (= (mask!34596 thiss!1551) #b00001111111111111111111111111111) (= (mask!34596 thiss!1551) #b00011111111111111111111111111111) (= (mask!34596 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34596 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!140503 d!140515))

(assert (=> b!1275300 d!140513))

(declare-fun bm!62681 () Bool)

(declare-fun call!62684 () Bool)

(assert (=> bm!62681 (= call!62684 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)))))

(declare-fun b!1275324 () Bool)

(declare-fun e!727850 () Bool)

(declare-fun e!727848 () Bool)

(assert (=> b!1275324 (= e!727850 e!727848)))

(declare-fun c!124196 () Bool)

(assert (=> b!1275324 (= c!124196 (validKeyInArray!0 (select (arr!40293 (_keys!12191 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1275325 () Bool)

(declare-fun e!727849 () Bool)

(assert (=> b!1275325 (= e!727849 call!62684)))

(declare-fun b!1275326 () Bool)

(assert (=> b!1275326 (= e!727848 e!727849)))

(declare-fun lt!575660 () (_ BitVec 64))

(assert (=> b!1275326 (= lt!575660 (select (arr!40293 (_keys!12191 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!575658 () Unit!42307)

(assert (=> b!1275326 (= lt!575658 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12191 thiss!1551) lt!575660 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1275326 (arrayContainsKey!0 (_keys!12191 thiss!1551) lt!575660 #b00000000000000000000000000000000)))

(declare-fun lt!575659 () Unit!42307)

(assert (=> b!1275326 (= lt!575659 lt!575658)))

(declare-fun res!847590 () Bool)

(assert (=> b!1275326 (= res!847590 (= (seekEntryOrOpen!0 (select (arr!40293 (_keys!12191 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)) (Found!9954 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1275326 (=> (not res!847590) (not e!727849))))

(declare-fun d!140517 () Bool)

(declare-fun res!847589 () Bool)

(assert (=> d!140517 (=> res!847589 e!727850)))

(assert (=> d!140517 (= res!847589 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140517 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)) e!727850)))

(declare-fun b!1275327 () Bool)

(assert (=> b!1275327 (= e!727848 call!62684)))

(assert (= (and d!140517 (not res!847589)) b!1275324))

(assert (= (and b!1275324 c!124196) b!1275326))

(assert (= (and b!1275324 (not c!124196)) b!1275327))

(assert (= (and b!1275326 res!847590) b!1275325))

(assert (= (or b!1275325 b!1275327) bm!62681))

(declare-fun m!1172547 () Bool)

(assert (=> bm!62681 m!1172547))

(declare-fun m!1172549 () Bool)

(assert (=> b!1275324 m!1172549))

(assert (=> b!1275324 m!1172549))

(declare-fun m!1172551 () Bool)

(assert (=> b!1275324 m!1172551))

(assert (=> b!1275326 m!1172549))

(declare-fun m!1172553 () Bool)

(assert (=> b!1275326 m!1172553))

(declare-fun m!1172555 () Bool)

(assert (=> b!1275326 m!1172555))

(assert (=> b!1275326 m!1172549))

(declare-fun m!1172557 () Bool)

(assert (=> b!1275326 m!1172557))

(assert (=> bm!62680 d!140517))

(declare-fun d!140519 () Bool)

(assert (=> d!140519 (= (size!40846 thiss!1551) (bvadd (_size!3147 thiss!1551) (bvsdiv (bvadd (extraKeys!6417 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1275289 d!140519))

(assert (=> b!1275290 d!140519))

(declare-fun d!140521 () Bool)

(assert (=> d!140521 (arrayContainsKey!0 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000)))

(declare-fun lt!575663 () Unit!42307)

(declare-fun choose!13 (array!83555 (_ BitVec 64) (_ BitVec 32)) Unit!42307)

(assert (=> d!140521 (= lt!575663 (choose!13 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000))))

(assert (=> d!140521 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!140521 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000) lt!575663)))

(declare-fun bs!36183 () Bool)

(assert (= bs!36183 d!140521))

(assert (=> bs!36183 m!1172541))

(declare-fun m!1172559 () Bool)

(assert (=> bs!36183 m!1172559))

(assert (=> b!1275314 d!140521))

(declare-fun d!140523 () Bool)

(declare-fun res!847595 () Bool)

(declare-fun e!727855 () Bool)

(assert (=> d!140523 (=> res!847595 e!727855)))

(assert (=> d!140523 (= res!847595 (= (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) lt!575657))))

(assert (=> d!140523 (= (arrayContainsKey!0 (_keys!12191 thiss!1551) lt!575657 #b00000000000000000000000000000000) e!727855)))

(declare-fun b!1275332 () Bool)

(declare-fun e!727856 () Bool)

(assert (=> b!1275332 (= e!727855 e!727856)))

(declare-fun res!847596 () Bool)

(assert (=> b!1275332 (=> (not res!847596) (not e!727856))))

(assert (=> b!1275332 (= res!847596 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))))))

(declare-fun b!1275333 () Bool)

(assert (=> b!1275333 (= e!727856 (arrayContainsKey!0 (_keys!12191 thiss!1551) lt!575657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!140523 (not res!847595)) b!1275332))

(assert (= (and b!1275332 res!847596) b!1275333))

(assert (=> d!140523 m!1172531))

(declare-fun m!1172561 () Bool)

(assert (=> b!1275333 m!1172561))

(assert (=> b!1275314 d!140523))

(declare-fun b!1275346 () Bool)

(declare-fun e!727864 () SeekEntryResult!9954)

(declare-fun lt!575671 () SeekEntryResult!9954)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83555 (_ BitVec 32)) SeekEntryResult!9954)

(assert (=> b!1275346 (= e!727864 (seekKeyOrZeroReturnVacant!0 (x!112675 lt!575671) (index!42189 lt!575671) (index!42189 lt!575671) (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)))))

(declare-fun b!1275347 () Bool)

(declare-fun e!727863 () SeekEntryResult!9954)

(assert (=> b!1275347 (= e!727863 Undefined!9954)))

(declare-fun b!1275348 () Bool)

(declare-fun e!727865 () SeekEntryResult!9954)

(assert (=> b!1275348 (= e!727863 e!727865)))

(declare-fun lt!575670 () (_ BitVec 64))

(assert (=> b!1275348 (= lt!575670 (select (arr!40293 (_keys!12191 thiss!1551)) (index!42189 lt!575671)))))

(declare-fun c!124205 () Bool)

(assert (=> b!1275348 (= c!124205 (= lt!575670 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!140525 () Bool)

(declare-fun lt!575672 () SeekEntryResult!9954)

(assert (=> d!140525 (and (or ((_ is Undefined!9954) lt!575672) (not ((_ is Found!9954) lt!575672)) (and (bvsge (index!42188 lt!575672) #b00000000000000000000000000000000) (bvslt (index!42188 lt!575672) (size!40841 (_keys!12191 thiss!1551))))) (or ((_ is Undefined!9954) lt!575672) ((_ is Found!9954) lt!575672) (not ((_ is MissingZero!9954) lt!575672)) (and (bvsge (index!42187 lt!575672) #b00000000000000000000000000000000) (bvslt (index!42187 lt!575672) (size!40841 (_keys!12191 thiss!1551))))) (or ((_ is Undefined!9954) lt!575672) ((_ is Found!9954) lt!575672) ((_ is MissingZero!9954) lt!575672) (not ((_ is MissingVacant!9954) lt!575672)) (and (bvsge (index!42190 lt!575672) #b00000000000000000000000000000000) (bvslt (index!42190 lt!575672) (size!40841 (_keys!12191 thiss!1551))))) (or ((_ is Undefined!9954) lt!575672) (ite ((_ is Found!9954) lt!575672) (= (select (arr!40293 (_keys!12191 thiss!1551)) (index!42188 lt!575672)) (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9954) lt!575672) (= (select (arr!40293 (_keys!12191 thiss!1551)) (index!42187 lt!575672)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9954) lt!575672) (= (select (arr!40293 (_keys!12191 thiss!1551)) (index!42190 lt!575672)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!140525 (= lt!575672 e!727863)))

(declare-fun c!124204 () Bool)

(assert (=> d!140525 (= c!124204 (and ((_ is Intermediate!9954) lt!575671) (undefined!10766 lt!575671)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83555 (_ BitVec 32)) SeekEntryResult!9954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!140525 (= lt!575671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) (mask!34596 thiss!1551)) (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)))))

(assert (=> d!140525 (validMask!0 (mask!34596 thiss!1551))))

(assert (=> d!140525 (= (seekEntryOrOpen!0 (select (arr!40293 (_keys!12191 thiss!1551)) #b00000000000000000000000000000000) (_keys!12191 thiss!1551) (mask!34596 thiss!1551)) lt!575672)))

(declare-fun b!1275349 () Bool)

(assert (=> b!1275349 (= e!727865 (Found!9954 (index!42189 lt!575671)))))

(declare-fun b!1275350 () Bool)

(declare-fun c!124203 () Bool)

(assert (=> b!1275350 (= c!124203 (= lt!575670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1275350 (= e!727865 e!727864)))

(declare-fun b!1275351 () Bool)

(assert (=> b!1275351 (= e!727864 (MissingZero!9954 (index!42189 lt!575671)))))

(assert (= (and d!140525 c!124204) b!1275347))

(assert (= (and d!140525 (not c!124204)) b!1275348))

(assert (= (and b!1275348 c!124205) b!1275349))

(assert (= (and b!1275348 (not c!124205)) b!1275350))

(assert (= (and b!1275350 c!124203) b!1275351))

(assert (= (and b!1275350 (not c!124203)) b!1275346))

(assert (=> b!1275346 m!1172531))

(declare-fun m!1172563 () Bool)

(assert (=> b!1275346 m!1172563))

(declare-fun m!1172565 () Bool)

(assert (=> b!1275348 m!1172565))

(declare-fun m!1172567 () Bool)

(assert (=> d!140525 m!1172567))

(declare-fun m!1172569 () Bool)

(assert (=> d!140525 m!1172569))

(assert (=> d!140525 m!1172529))

(declare-fun m!1172571 () Bool)

(assert (=> d!140525 m!1172571))

(assert (=> d!140525 m!1172531))

(declare-fun m!1172573 () Bool)

(assert (=> d!140525 m!1172573))

(assert (=> d!140525 m!1172573))

(assert (=> d!140525 m!1172531))

(declare-fun m!1172575 () Bool)

(assert (=> d!140525 m!1172575))

(assert (=> b!1275314 d!140525))

(declare-fun d!140527 () Bool)

(declare-fun lt!575673 () (_ BitVec 32))

(assert (=> d!140527 (and (bvsge lt!575673 #b00000000000000000000000000000000) (bvsle lt!575673 (bvsub (size!40841 (_keys!12191 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!727866 () (_ BitVec 32))

(assert (=> d!140527 (= lt!575673 e!727866)))

(declare-fun c!124207 () Bool)

(assert (=> d!140527 (= c!124207 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140527 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!40841 (_keys!12191 thiss!1551)) (size!40841 (_keys!12191 thiss!1551))))))

(assert (=> d!140527 (= (arrayCountValidKeys!0 (_keys!12191 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))) lt!575673)))

(declare-fun b!1275352 () Bool)

(declare-fun e!727867 () (_ BitVec 32))

(assert (=> b!1275352 (= e!727866 e!727867)))

(declare-fun c!124206 () Bool)

(assert (=> b!1275352 (= c!124206 (validKeyInArray!0 (select (arr!40293 (_keys!12191 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1275353 () Bool)

(assert (=> b!1275353 (= e!727866 #b00000000000000000000000000000000)))

(declare-fun bm!62682 () Bool)

(declare-fun call!62685 () (_ BitVec 32))

(assert (=> bm!62682 (= call!62685 (arrayCountValidKeys!0 (_keys!12191 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!40841 (_keys!12191 thiss!1551))))))

(declare-fun b!1275354 () Bool)

(assert (=> b!1275354 (= e!727867 (bvadd #b00000000000000000000000000000001 call!62685))))

(declare-fun b!1275355 () Bool)

(assert (=> b!1275355 (= e!727867 call!62685)))

(assert (= (and d!140527 c!124207) b!1275353))

(assert (= (and d!140527 (not c!124207)) b!1275352))

(assert (= (and b!1275352 c!124206) b!1275354))

(assert (= (and b!1275352 (not c!124206)) b!1275355))

(assert (= (or b!1275354 b!1275355) bm!62682))

(assert (=> b!1275352 m!1172549))

(assert (=> b!1275352 m!1172549))

(assert (=> b!1275352 m!1172551))

(declare-fun m!1172577 () Bool)

(assert (=> bm!62682 m!1172577))

(assert (=> bm!62677 d!140527))

(declare-fun mapNonEmpty!51338 () Bool)

(declare-fun mapRes!51338 () Bool)

(declare-fun tp!97850 () Bool)

(declare-fun e!727868 () Bool)

(assert (=> mapNonEmpty!51338 (= mapRes!51338 (and tp!97850 e!727868))))

(declare-fun mapValue!51338 () ValueCell!15710)

(declare-fun mapRest!51338 () (Array (_ BitVec 32) ValueCell!15710))

(declare-fun mapKey!51338 () (_ BitVec 32))

(assert (=> mapNonEmpty!51338 (= mapRest!51337 (store mapRest!51338 mapKey!51338 mapValue!51338))))

(declare-fun mapIsEmpty!51338 () Bool)

(assert (=> mapIsEmpty!51338 mapRes!51338))

(declare-fun b!1275356 () Bool)

(assert (=> b!1275356 (= e!727868 tp_is_empty!33127)))

(declare-fun b!1275357 () Bool)

(declare-fun e!727869 () Bool)

(assert (=> b!1275357 (= e!727869 tp_is_empty!33127)))

(declare-fun condMapEmpty!51338 () Bool)

(declare-fun mapDefault!51338 () ValueCell!15710)

(assert (=> mapNonEmpty!51337 (= condMapEmpty!51338 (= mapRest!51337 ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51338)))))

(assert (=> mapNonEmpty!51337 (= tp!97849 (and e!727869 mapRes!51338))))

(assert (= (and mapNonEmpty!51337 condMapEmpty!51338) mapIsEmpty!51338))

(assert (= (and mapNonEmpty!51337 (not condMapEmpty!51338)) mapNonEmpty!51338))

(assert (= (and mapNonEmpty!51338 ((_ is ValueCellFull!15710) mapValue!51338)) b!1275356))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15710) mapDefault!51338)) b!1275357))

(declare-fun m!1172579 () Bool)

(assert (=> mapNonEmpty!51338 m!1172579))

(check-sat (not bm!62682) (not b!1275352) (not b_next!27757) (not bm!62681) (not d!140525) (not b!1275326) (not mapNonEmpty!51338) b_and!45815 (not b!1275324) tp_is_empty!33127 (not b!1275346) (not d!140521) (not b!1275333))
(check-sat b_and!45815 (not b_next!27757))
