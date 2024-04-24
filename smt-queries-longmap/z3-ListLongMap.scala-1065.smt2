; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22076 () Bool)

(assert start!22076)

(declare-fun b!228763 () Bool)

(declare-fun b_free!6139 () Bool)

(declare-fun b_next!6139 () Bool)

(assert (=> b!228763 (= b_free!6139 (not b_next!6139))))

(declare-fun tp!21558 () Bool)

(declare-fun b_and!13051 () Bool)

(assert (=> b!228763 (= tp!21558 b_and!13051)))

(declare-fun b!228758 () Bool)

(declare-fun e!148413 () Bool)

(declare-fun call!21239 () Bool)

(assert (=> b!228758 (= e!148413 (not call!21239))))

(declare-fun b!228759 () Bool)

(declare-fun e!148407 () Bool)

(declare-fun e!148417 () Bool)

(assert (=> b!228759 (= e!148407 (not e!148417))))

(declare-fun res!112595 () Bool)

(assert (=> b!228759 (=> res!112595 e!148417)))

(declare-datatypes ((V!7649 0))(
  ( (V!7650 (val!3045 Int)) )
))
(declare-datatypes ((ValueCell!2657 0))(
  ( (ValueCellFull!2657 (v!5066 V!7649)) (EmptyCell!2657) )
))
(declare-datatypes ((array!11243 0))(
  ( (array!11244 (arr!5341 (Array (_ BitVec 32) ValueCell!2657)) (size!5674 (_ BitVec 32))) )
))
(declare-datatypes ((array!11245 0))(
  ( (array!11246 (arr!5342 (Array (_ BitVec 32) (_ BitVec 64))) (size!5675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3214 0))(
  ( (LongMapFixedSize!3215 (defaultEntry!4266 Int) (mask!10140 (_ BitVec 32)) (extraKeys!4003 (_ BitVec 32)) (zeroValue!4107 V!7649) (minValue!4107 V!7649) (_size!1656 (_ BitVec 32)) (_keys!6320 array!11245) (_values!4249 array!11243) (_vacant!1656 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3214)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228759 (= res!112595 (not (validMask!0 (mask!10140 thiss!1504))))))

(declare-fun lt!115126 () array!11245)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11245 (_ BitVec 32)) Bool)

(assert (=> b!228759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115126 (mask!10140 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6937 0))(
  ( (Unit!6938) )
))
(declare-fun lt!115116 () Unit!6937)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11245 (_ BitVec 32) (_ BitVec 32)) Unit!6937)

(assert (=> b!228759 (= lt!115116 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6320 thiss!1504) index!297 (mask!10140 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11245 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228759 (= (arrayCountValidKeys!0 lt!115126 #b00000000000000000000000000000000 (size!5675 (_keys!6320 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6320 thiss!1504) #b00000000000000000000000000000000 (size!5675 (_keys!6320 thiss!1504)))))))

(declare-fun lt!115125 () Unit!6937)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11245 (_ BitVec 32) (_ BitVec 64)) Unit!6937)

(assert (=> b!228759 (= lt!115125 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6320 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3335 0))(
  ( (Nil!3332) (Cons!3331 (h!3979 (_ BitVec 64)) (t!8286 List!3335)) )
))
(declare-fun arrayNoDuplicates!0 (array!11245 (_ BitVec 32) List!3335) Bool)

(assert (=> b!228759 (arrayNoDuplicates!0 lt!115126 #b00000000000000000000000000000000 Nil!3332)))

(assert (=> b!228759 (= lt!115126 (array!11246 (store (arr!5342 (_keys!6320 thiss!1504)) index!297 key!932) (size!5675 (_keys!6320 thiss!1504))))))

(declare-fun lt!115122 () Unit!6937)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11245 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3335) Unit!6937)

(assert (=> b!228759 (= lt!115122 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6320 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3332))))

(declare-fun lt!115121 () Unit!6937)

(declare-fun e!148416 () Unit!6937)

(assert (=> b!228759 (= lt!115121 e!148416)))

(declare-fun c!37943 () Bool)

(declare-fun arrayContainsKey!0 (array!11245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228759 (= c!37943 (arrayContainsKey!0 (_keys!6320 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228760 () Bool)

(declare-fun Unit!6939 () Unit!6937)

(assert (=> b!228760 (= e!148416 Unit!6939)))

(declare-fun lt!115120 () Unit!6937)

(declare-fun lemmaArrayContainsKeyThenInListMap!116 (array!11245 array!11243 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) (_ BitVec 32) Int) Unit!6937)

(assert (=> b!228760 (= lt!115120 (lemmaArrayContainsKeyThenInListMap!116 (_keys!6320 thiss!1504) (_values!4249 thiss!1504) (mask!10140 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228760 false))

(declare-fun b!228761 () Bool)

(declare-fun e!148405 () Bool)

(declare-datatypes ((SeekEntryResult!881 0))(
  ( (MissingZero!881 (index!5694 (_ BitVec 32))) (Found!881 (index!5695 (_ BitVec 32))) (Intermediate!881 (undefined!1693 Bool) (index!5696 (_ BitVec 32)) (x!23317 (_ BitVec 32))) (Undefined!881) (MissingVacant!881 (index!5697 (_ BitVec 32))) )
))
(declare-fun lt!115119 () SeekEntryResult!881)

(get-info :version)

(assert (=> b!228761 (= e!148405 ((_ is Undefined!881) lt!115119))))

(declare-fun res!112598 () Bool)

(declare-fun e!148414 () Bool)

(assert (=> start!22076 (=> (not res!112598) (not e!148414))))

(declare-fun valid!1293 (LongMapFixedSize!3214) Bool)

(assert (=> start!22076 (= res!112598 (valid!1293 thiss!1504))))

(assert (=> start!22076 e!148414))

(declare-fun e!148408 () Bool)

(assert (=> start!22076 e!148408))

(assert (=> start!22076 true))

(declare-fun call!21240 () Bool)

(declare-fun c!37942 () Bool)

(declare-fun bm!21236 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21236 (= call!21240 (inRange!0 (ite c!37942 (index!5694 lt!115119) (index!5697 lt!115119)) (mask!10140 thiss!1504)))))

(declare-fun b!228762 () Bool)

(declare-fun e!148409 () Bool)

(declare-fun tp_is_empty!6001 () Bool)

(assert (=> b!228762 (= e!148409 tp_is_empty!6001)))

(declare-fun e!148410 () Bool)

(declare-fun array_inv!3507 (array!11245) Bool)

(declare-fun array_inv!3508 (array!11243) Bool)

(assert (=> b!228763 (= e!148408 (and tp!21558 tp_is_empty!6001 (array_inv!3507 (_keys!6320 thiss!1504)) (array_inv!3508 (_values!4249 thiss!1504)) e!148410))))

(declare-fun b!228764 () Bool)

(declare-fun e!148411 () Unit!6937)

(declare-fun lt!115118 () Unit!6937)

(assert (=> b!228764 (= e!148411 lt!115118)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!269 (array!11245 array!11243 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) Int) Unit!6937)

(assert (=> b!228764 (= lt!115118 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!269 (_keys!6320 thiss!1504) (_values!4249 thiss!1504) (mask!10140 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228764 (= c!37942 ((_ is MissingZero!881) lt!115119))))

(declare-fun e!148412 () Bool)

(assert (=> b!228764 e!148412))

(declare-fun b!228765 () Bool)

(declare-fun c!37945 () Bool)

(assert (=> b!228765 (= c!37945 ((_ is MissingVacant!881) lt!115119))))

(assert (=> b!228765 (= e!148412 e!148405)))

(declare-fun bm!21237 () Bool)

(assert (=> bm!21237 (= call!21239 (arrayContainsKey!0 (_keys!6320 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228766 () Bool)

(declare-fun res!112592 () Bool)

(assert (=> b!228766 (=> res!112592 e!148417)))

(assert (=> b!228766 (= res!112592 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6320 thiss!1504) (mask!10140 thiss!1504))))))

(declare-fun b!228767 () Bool)

(declare-fun res!112596 () Bool)

(assert (=> b!228767 (=> res!112596 e!148417)))

(assert (=> b!228767 (= res!112596 (or (not (= (size!5674 (_values!4249 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10140 thiss!1504)))) (not (= (size!5675 (_keys!6320 thiss!1504)) (size!5674 (_values!4249 thiss!1504)))) (bvslt (mask!10140 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4003 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4003 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228768 () Bool)

(declare-fun e!148415 () Bool)

(assert (=> b!228768 (= e!148414 e!148415)))

(declare-fun res!112597 () Bool)

(assert (=> b!228768 (=> (not res!112597) (not e!148415))))

(assert (=> b!228768 (= res!112597 (or (= lt!115119 (MissingZero!881 index!297)) (= lt!115119 (MissingVacant!881 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11245 (_ BitVec 32)) SeekEntryResult!881)

(assert (=> b!228768 (= lt!115119 (seekEntryOrOpen!0 key!932 (_keys!6320 thiss!1504) (mask!10140 thiss!1504)))))

(declare-fun b!228769 () Bool)

(declare-fun e!148406 () Bool)

(declare-fun mapRes!10171 () Bool)

(assert (=> b!228769 (= e!148410 (and e!148406 mapRes!10171))))

(declare-fun condMapEmpty!10171 () Bool)

(declare-fun mapDefault!10171 () ValueCell!2657)

(assert (=> b!228769 (= condMapEmpty!10171 (= (arr!5341 (_values!4249 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2657)) mapDefault!10171)))))

(declare-fun b!228770 () Bool)

(declare-fun Unit!6940 () Unit!6937)

(assert (=> b!228770 (= e!148411 Unit!6940)))

(declare-fun lt!115124 () Unit!6937)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (array!11245 array!11243 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 64) Int) Unit!6937)

(assert (=> b!228770 (= lt!115124 (lemmaInListMapThenSeekEntryOrOpenFindsIt!275 (_keys!6320 thiss!1504) (_values!4249 thiss!1504) (mask!10140 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) key!932 (defaultEntry!4266 thiss!1504)))))

(assert (=> b!228770 false))

(declare-fun b!228771 () Bool)

(declare-fun e!148418 () Bool)

(assert (=> b!228771 (= e!148418 (not call!21239))))

(declare-fun b!228772 () Bool)

(declare-fun res!112600 () Bool)

(assert (=> b!228772 (=> (not res!112600) (not e!148418))))

(assert (=> b!228772 (= res!112600 call!21240)))

(assert (=> b!228772 (= e!148412 e!148418)))

(declare-fun mapIsEmpty!10171 () Bool)

(assert (=> mapIsEmpty!10171 mapRes!10171))

(declare-fun b!228773 () Bool)

(declare-fun res!112590 () Bool)

(assert (=> b!228773 (=> (not res!112590) (not e!148414))))

(assert (=> b!228773 (= res!112590 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228774 () Bool)

(declare-fun res!112593 () Bool)

(assert (=> b!228774 (= res!112593 (= (select (arr!5342 (_keys!6320 thiss!1504)) (index!5697 lt!115119)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228774 (=> (not res!112593) (not e!148413))))

(declare-fun b!228775 () Bool)

(assert (=> b!228775 (= e!148406 tp_is_empty!6001)))

(declare-fun b!228776 () Bool)

(declare-fun Unit!6941 () Unit!6937)

(assert (=> b!228776 (= e!148416 Unit!6941)))

(declare-fun b!228777 () Bool)

(declare-fun res!112599 () Bool)

(assert (=> b!228777 (=> (not res!112599) (not e!148418))))

(assert (=> b!228777 (= res!112599 (= (select (arr!5342 (_keys!6320 thiss!1504)) (index!5694 lt!115119)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228778 () Bool)

(assert (=> b!228778 (= e!148417 true)))

(declare-fun lt!115123 () Bool)

(assert (=> b!228778 (= lt!115123 (arrayNoDuplicates!0 (_keys!6320 thiss!1504) #b00000000000000000000000000000000 Nil!3332))))

(declare-fun b!228779 () Bool)

(assert (=> b!228779 (= e!148415 e!148407)))

(declare-fun res!112591 () Bool)

(assert (=> b!228779 (=> (not res!112591) (not e!148407))))

(assert (=> b!228779 (= res!112591 (inRange!0 index!297 (mask!10140 thiss!1504)))))

(declare-fun lt!115117 () Unit!6937)

(assert (=> b!228779 (= lt!115117 e!148411)))

(declare-fun c!37944 () Bool)

(declare-datatypes ((tuple2!4420 0))(
  ( (tuple2!4421 (_1!2221 (_ BitVec 64)) (_2!2221 V!7649)) )
))
(declare-datatypes ((List!3336 0))(
  ( (Nil!3333) (Cons!3332 (h!3980 tuple2!4420) (t!8287 List!3336)) )
))
(declare-datatypes ((ListLongMap!3335 0))(
  ( (ListLongMap!3336 (toList!1683 List!3336)) )
))
(declare-fun contains!1572 (ListLongMap!3335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1215 (array!11245 array!11243 (_ BitVec 32) (_ BitVec 32) V!7649 V!7649 (_ BitVec 32) Int) ListLongMap!3335)

(assert (=> b!228779 (= c!37944 (contains!1572 (getCurrentListMap!1215 (_keys!6320 thiss!1504) (_values!4249 thiss!1504) (mask!10140 thiss!1504) (extraKeys!4003 thiss!1504) (zeroValue!4107 thiss!1504) (minValue!4107 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4266 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10171 () Bool)

(declare-fun tp!21559 () Bool)

(assert (=> mapNonEmpty!10171 (= mapRes!10171 (and tp!21559 e!148409))))

(declare-fun mapValue!10171 () ValueCell!2657)

(declare-fun mapRest!10171 () (Array (_ BitVec 32) ValueCell!2657))

(declare-fun mapKey!10171 () (_ BitVec 32))

(assert (=> mapNonEmpty!10171 (= (arr!5341 (_values!4249 thiss!1504)) (store mapRest!10171 mapKey!10171 mapValue!10171))))

(declare-fun b!228780 () Bool)

(assert (=> b!228780 (= e!148405 e!148413)))

(declare-fun res!112594 () Bool)

(assert (=> b!228780 (= res!112594 call!21240)))

(assert (=> b!228780 (=> (not res!112594) (not e!148413))))

(assert (= (and start!22076 res!112598) b!228773))

(assert (= (and b!228773 res!112590) b!228768))

(assert (= (and b!228768 res!112597) b!228779))

(assert (= (and b!228779 c!37944) b!228770))

(assert (= (and b!228779 (not c!37944)) b!228764))

(assert (= (and b!228764 c!37942) b!228772))

(assert (= (and b!228764 (not c!37942)) b!228765))

(assert (= (and b!228772 res!112600) b!228777))

(assert (= (and b!228777 res!112599) b!228771))

(assert (= (and b!228765 c!37945) b!228780))

(assert (= (and b!228765 (not c!37945)) b!228761))

(assert (= (and b!228780 res!112594) b!228774))

(assert (= (and b!228774 res!112593) b!228758))

(assert (= (or b!228772 b!228780) bm!21236))

(assert (= (or b!228771 b!228758) bm!21237))

(assert (= (and b!228779 res!112591) b!228759))

(assert (= (and b!228759 c!37943) b!228760))

(assert (= (and b!228759 (not c!37943)) b!228776))

(assert (= (and b!228759 (not res!112595)) b!228767))

(assert (= (and b!228767 (not res!112596)) b!228766))

(assert (= (and b!228766 (not res!112592)) b!228778))

(assert (= (and b!228769 condMapEmpty!10171) mapIsEmpty!10171))

(assert (= (and b!228769 (not condMapEmpty!10171)) mapNonEmpty!10171))

(assert (= (and mapNonEmpty!10171 ((_ is ValueCellFull!2657) mapValue!10171)) b!228762))

(assert (= (and b!228769 ((_ is ValueCellFull!2657) mapDefault!10171)) b!228775))

(assert (= b!228763 b!228769))

(assert (= start!22076 b!228763))

(declare-fun m!250585 () Bool)

(assert (=> b!228763 m!250585))

(declare-fun m!250587 () Bool)

(assert (=> b!228763 m!250587))

(declare-fun m!250589 () Bool)

(assert (=> bm!21236 m!250589))

(declare-fun m!250591 () Bool)

(assert (=> b!228778 m!250591))

(declare-fun m!250593 () Bool)

(assert (=> b!228774 m!250593))

(declare-fun m!250595 () Bool)

(assert (=> b!228770 m!250595))

(declare-fun m!250597 () Bool)

(assert (=> b!228760 m!250597))

(declare-fun m!250599 () Bool)

(assert (=> b!228766 m!250599))

(declare-fun m!250601 () Bool)

(assert (=> bm!21237 m!250601))

(declare-fun m!250603 () Bool)

(assert (=> b!228764 m!250603))

(declare-fun m!250605 () Bool)

(assert (=> mapNonEmpty!10171 m!250605))

(declare-fun m!250607 () Bool)

(assert (=> b!228779 m!250607))

(declare-fun m!250609 () Bool)

(assert (=> b!228779 m!250609))

(assert (=> b!228779 m!250609))

(declare-fun m!250611 () Bool)

(assert (=> b!228779 m!250611))

(declare-fun m!250613 () Bool)

(assert (=> b!228759 m!250613))

(assert (=> b!228759 m!250601))

(declare-fun m!250615 () Bool)

(assert (=> b!228759 m!250615))

(declare-fun m!250617 () Bool)

(assert (=> b!228759 m!250617))

(declare-fun m!250619 () Bool)

(assert (=> b!228759 m!250619))

(declare-fun m!250621 () Bool)

(assert (=> b!228759 m!250621))

(declare-fun m!250623 () Bool)

(assert (=> b!228759 m!250623))

(declare-fun m!250625 () Bool)

(assert (=> b!228759 m!250625))

(declare-fun m!250627 () Bool)

(assert (=> b!228759 m!250627))

(declare-fun m!250629 () Bool)

(assert (=> b!228759 m!250629))

(declare-fun m!250631 () Bool)

(assert (=> b!228768 m!250631))

(declare-fun m!250633 () Bool)

(assert (=> start!22076 m!250633))

(declare-fun m!250635 () Bool)

(assert (=> b!228777 m!250635))

(check-sat (not bm!21236) (not b!228768) (not b!228764) (not b!228778) (not b!228770) b_and!13051 (not b!228766) (not bm!21237) (not start!22076) tp_is_empty!6001 (not b!228763) (not b!228759) (not mapNonEmpty!10171) (not b_next!6139) (not b!228779) (not b!228760))
(check-sat b_and!13051 (not b_next!6139))
