; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21992 () Bool)

(assert start!21992)

(declare-fun b!225602 () Bool)

(declare-fun b_free!6055 () Bool)

(declare-fun b_next!6055 () Bool)

(assert (=> b!225602 (= b_free!6055 (not b_next!6055))))

(declare-fun tp!21306 () Bool)

(declare-fun b_and!12927 () Bool)

(assert (=> b!225602 (= tp!21306 b_and!12927)))

(declare-fun b!225580 () Bool)

(declare-fun e!146395 () Bool)

(declare-fun e!146392 () Bool)

(declare-fun mapRes!10045 () Bool)

(assert (=> b!225580 (= e!146395 (and e!146392 mapRes!10045))))

(declare-fun condMapEmpty!10045 () Bool)

(declare-datatypes ((V!7537 0))(
  ( (V!7538 (val!3003 Int)) )
))
(declare-datatypes ((ValueCell!2615 0))(
  ( (ValueCellFull!2615 (v!5017 V!7537)) (EmptyCell!2615) )
))
(declare-datatypes ((array!11069 0))(
  ( (array!11070 (arr!5253 (Array (_ BitVec 32) ValueCell!2615)) (size!5587 (_ BitVec 32))) )
))
(declare-datatypes ((array!11071 0))(
  ( (array!11072 (arr!5254 (Array (_ BitVec 32) (_ BitVec 64))) (size!5588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3130 0))(
  ( (LongMapFixedSize!3131 (defaultEntry!4224 Int) (mask!10069 (_ BitVec 32)) (extraKeys!3961 (_ BitVec 32)) (zeroValue!4065 V!7537) (minValue!4065 V!7537) (_size!1614 (_ BitVec 32)) (_keys!6277 array!11071) (_values!4207 array!11069) (_vacant!1614 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3130)

(declare-fun mapDefault!10045 () ValueCell!2615)

(assert (=> b!225580 (= condMapEmpty!10045 (= (arr!5253 (_values!4207 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2615)) mapDefault!10045)))))

(declare-fun b!225581 () Bool)

(declare-fun tp_is_empty!5917 () Bool)

(assert (=> b!225581 (= e!146392 tp_is_empty!5917)))

(declare-fun res!111010 () Bool)

(declare-fun e!146389 () Bool)

(assert (=> start!21992 (=> (not res!111010) (not e!146389))))

(declare-fun valid!1272 (LongMapFixedSize!3130) Bool)

(assert (=> start!21992 (= res!111010 (valid!1272 thiss!1504))))

(assert (=> start!21992 e!146389))

(declare-fun e!146403 () Bool)

(assert (=> start!21992 e!146403))

(assert (=> start!21992 true))

(declare-fun b!225582 () Bool)

(declare-fun e!146398 () Bool)

(assert (=> b!225582 (= e!146398 tp_is_empty!5917)))

(declare-fun b!225583 () Bool)

(declare-fun res!111004 () Bool)

(declare-datatypes ((SeekEntryResult!871 0))(
  ( (MissingZero!871 (index!5654 (_ BitVec 32))) (Found!871 (index!5655 (_ BitVec 32))) (Intermediate!871 (undefined!1683 Bool) (index!5656 (_ BitVec 32)) (x!23194 (_ BitVec 32))) (Undefined!871) (MissingVacant!871 (index!5657 (_ BitVec 32))) )
))
(declare-fun lt!113499 () SeekEntryResult!871)

(assert (=> b!225583 (= res!111004 (= (select (arr!5254 (_keys!6277 thiss!1504)) (index!5657 lt!113499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146400 () Bool)

(assert (=> b!225583 (=> (not res!111004) (not e!146400))))

(declare-fun b!225584 () Bool)

(declare-fun res!111012 () Bool)

(declare-fun e!146394 () Bool)

(assert (=> b!225584 (=> res!111012 e!146394)))

(declare-fun lt!113498 () Bool)

(assert (=> b!225584 (= res!111012 lt!113498)))

(declare-fun call!20975 () Bool)

(declare-fun bm!20972 () Bool)

(declare-fun c!37399 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20972 (= call!20975 (inRange!0 (ite c!37399 (index!5654 lt!113499) (index!5657 lt!113499)) (mask!10069 thiss!1504)))))

(declare-fun b!225585 () Bool)

(declare-fun res!111011 () Bool)

(assert (=> b!225585 (=> res!111011 e!146394)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11071 (_ BitVec 32)) Bool)

(assert (=> b!225585 (= res!111011 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6277 thiss!1504) (mask!10069 thiss!1504))))))

(declare-fun b!225586 () Bool)

(declare-fun e!146397 () Bool)

(assert (=> b!225586 (= e!146389 e!146397)))

(declare-fun res!111013 () Bool)

(assert (=> b!225586 (=> (not res!111013) (not e!146397))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225586 (= res!111013 (or (= lt!113499 (MissingZero!871 index!297)) (= lt!113499 (MissingVacant!871 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11071 (_ BitVec 32)) SeekEntryResult!871)

(assert (=> b!225586 (= lt!113499 (seekEntryOrOpen!0 key!932 (_keys!6277 thiss!1504) (mask!10069 thiss!1504)))))

(declare-fun b!225587 () Bool)

(declare-fun c!37401 () Bool)

(get-info :version)

(assert (=> b!225587 (= c!37401 ((_ is MissingVacant!871) lt!113499))))

(declare-fun e!146396 () Bool)

(declare-fun e!146401 () Bool)

(assert (=> b!225587 (= e!146396 e!146401)))

(declare-fun b!225588 () Bool)

(declare-fun e!146393 () Bool)

(assert (=> b!225588 (= e!146393 (not e!146394))))

(declare-fun res!111009 () Bool)

(assert (=> b!225588 (=> res!111009 e!146394)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225588 (= res!111009 (not (validMask!0 (mask!10069 thiss!1504))))))

(declare-fun lt!113493 () array!11071)

(declare-fun arrayCountValidKeys!0 (array!11071 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225588 (= (arrayCountValidKeys!0 lt!113493 #b00000000000000000000000000000000 (size!5588 (_keys!6277 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6277 thiss!1504) #b00000000000000000000000000000000 (size!5588 (_keys!6277 thiss!1504)))))))

(declare-datatypes ((Unit!6762 0))(
  ( (Unit!6763) )
))
(declare-fun lt!113495 () Unit!6762)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11071 (_ BitVec 32) (_ BitVec 64)) Unit!6762)

(assert (=> b!225588 (= lt!113495 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6277 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3345 0))(
  ( (Nil!3342) (Cons!3341 (h!3989 (_ BitVec 64)) (t!8295 List!3345)) )
))
(declare-fun arrayNoDuplicates!0 (array!11071 (_ BitVec 32) List!3345) Bool)

(assert (=> b!225588 (arrayNoDuplicates!0 lt!113493 #b00000000000000000000000000000000 Nil!3342)))

(assert (=> b!225588 (= lt!113493 (array!11072 (store (arr!5254 (_keys!6277 thiss!1504)) index!297 key!932) (size!5588 (_keys!6277 thiss!1504))))))

(declare-fun lt!113494 () Unit!6762)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3345) Unit!6762)

(assert (=> b!225588 (= lt!113494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6277 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3342))))

(declare-fun lt!113492 () Unit!6762)

(declare-fun e!146390 () Unit!6762)

(assert (=> b!225588 (= lt!113492 e!146390)))

(declare-fun c!37400 () Bool)

(assert (=> b!225588 (= c!37400 lt!113498)))

(declare-fun arrayContainsKey!0 (array!11071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225588 (= lt!113498 (arrayContainsKey!0 (_keys!6277 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225589 () Bool)

(declare-fun res!111006 () Bool)

(declare-fun e!146399 () Bool)

(assert (=> b!225589 (=> (not res!111006) (not e!146399))))

(assert (=> b!225589 (= res!111006 call!20975)))

(assert (=> b!225589 (= e!146396 e!146399)))

(declare-fun b!225590 () Bool)

(declare-fun res!111003 () Bool)

(assert (=> b!225590 (=> (not res!111003) (not e!146399))))

(assert (=> b!225590 (= res!111003 (= (select (arr!5254 (_keys!6277 thiss!1504)) (index!5654 lt!113499)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225591 () Bool)

(declare-fun res!111002 () Bool)

(assert (=> b!225591 (=> res!111002 e!146394)))

(assert (=> b!225591 (= res!111002 (or (not (= (size!5588 (_keys!6277 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10069 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5588 (_keys!6277 thiss!1504)))))))

(declare-fun b!225592 () Bool)

(declare-fun Unit!6764 () Unit!6762)

(assert (=> b!225592 (= e!146390 Unit!6764)))

(declare-fun b!225593 () Bool)

(assert (=> b!225593 (= e!146401 e!146400)))

(declare-fun res!111014 () Bool)

(assert (=> b!225593 (= res!111014 call!20975)))

(assert (=> b!225593 (=> (not res!111014) (not e!146400))))

(declare-fun b!225594 () Bool)

(declare-fun res!111007 () Bool)

(assert (=> b!225594 (=> (not res!111007) (not e!146389))))

(assert (=> b!225594 (= res!111007 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225595 () Bool)

(declare-fun e!146391 () Unit!6762)

(declare-fun Unit!6765 () Unit!6762)

(assert (=> b!225595 (= e!146391 Unit!6765)))

(declare-fun lt!113500 () Unit!6762)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!245 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6762)

(assert (=> b!225595 (= lt!113500 (lemmaInListMapThenSeekEntryOrOpenFindsIt!245 (_keys!6277 thiss!1504) (_values!4207 thiss!1504) (mask!10069 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225595 false))

(declare-fun b!225596 () Bool)

(declare-fun Unit!6766 () Unit!6762)

(assert (=> b!225596 (= e!146390 Unit!6766)))

(declare-fun lt!113491 () Unit!6762)

(declare-fun lemmaArrayContainsKeyThenInListMap!87 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) (_ BitVec 32) Int) Unit!6762)

(assert (=> b!225596 (= lt!113491 (lemmaArrayContainsKeyThenInListMap!87 (_keys!6277 thiss!1504) (_values!4207 thiss!1504) (mask!10069 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225596 false))

(declare-fun b!225597 () Bool)

(declare-fun call!20976 () Bool)

(assert (=> b!225597 (= e!146400 (not call!20976))))

(declare-fun b!225598 () Bool)

(assert (=> b!225598 (= e!146397 e!146393)))

(declare-fun res!111008 () Bool)

(assert (=> b!225598 (=> (not res!111008) (not e!146393))))

(assert (=> b!225598 (= res!111008 (inRange!0 index!297 (mask!10069 thiss!1504)))))

(declare-fun lt!113496 () Unit!6762)

(assert (=> b!225598 (= lt!113496 e!146391)))

(declare-fun c!37402 () Bool)

(declare-datatypes ((tuple2!4416 0))(
  ( (tuple2!4417 (_1!2219 (_ BitVec 64)) (_2!2219 V!7537)) )
))
(declare-datatypes ((List!3346 0))(
  ( (Nil!3343) (Cons!3342 (h!3990 tuple2!4416) (t!8296 List!3346)) )
))
(declare-datatypes ((ListLongMap!3319 0))(
  ( (ListLongMap!3320 (toList!1675 List!3346)) )
))
(declare-fun contains!1550 (ListLongMap!3319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1184 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 32) Int) ListLongMap!3319)

(assert (=> b!225598 (= c!37402 (contains!1550 (getCurrentListMap!1184 (_keys!6277 thiss!1504) (_values!4207 thiss!1504) (mask!10069 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4224 thiss!1504)) key!932))))

(declare-fun b!225599 () Bool)

(declare-fun res!111005 () Bool)

(assert (=> b!225599 (=> res!111005 e!146394)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225599 (= res!111005 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225600 () Bool)

(assert (=> b!225600 (= e!146399 (not call!20976))))

(declare-fun b!225601 () Bool)

(assert (=> b!225601 (= e!146401 ((_ is Undefined!871) lt!113499))))

(declare-fun mapNonEmpty!10045 () Bool)

(declare-fun tp!21307 () Bool)

(assert (=> mapNonEmpty!10045 (= mapRes!10045 (and tp!21307 e!146398))))

(declare-fun mapRest!10045 () (Array (_ BitVec 32) ValueCell!2615))

(declare-fun mapValue!10045 () ValueCell!2615)

(declare-fun mapKey!10045 () (_ BitVec 32))

(assert (=> mapNonEmpty!10045 (= (arr!5253 (_values!4207 thiss!1504)) (store mapRest!10045 mapKey!10045 mapValue!10045))))

(declare-fun mapIsEmpty!10045 () Bool)

(assert (=> mapIsEmpty!10045 mapRes!10045))

(declare-fun bm!20973 () Bool)

(assert (=> bm!20973 (= call!20976 (arrayContainsKey!0 (_keys!6277 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3467 (array!11071) Bool)

(declare-fun array_inv!3468 (array!11069) Bool)

(assert (=> b!225602 (= e!146403 (and tp!21306 tp_is_empty!5917 (array_inv!3467 (_keys!6277 thiss!1504)) (array_inv!3468 (_values!4207 thiss!1504)) e!146395))))

(declare-fun b!225603 () Bool)

(declare-fun lt!113497 () Unit!6762)

(assert (=> b!225603 (= e!146391 lt!113497)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (array!11071 array!11069 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6762)

(assert (=> b!225603 (= lt!113497 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (_keys!6277 thiss!1504) (_values!4207 thiss!1504) (mask!10069 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225603 (= c!37399 ((_ is MissingZero!871) lt!113499))))

(assert (=> b!225603 e!146396))

(declare-fun b!225604 () Bool)

(assert (=> b!225604 (= e!146394 true)))

(declare-fun lt!113490 () Bool)

(assert (=> b!225604 (= lt!113490 (arrayNoDuplicates!0 (_keys!6277 thiss!1504) #b00000000000000000000000000000000 Nil!3342))))

(assert (= (and start!21992 res!111010) b!225594))

(assert (= (and b!225594 res!111007) b!225586))

(assert (= (and b!225586 res!111013) b!225598))

(assert (= (and b!225598 c!37402) b!225595))

(assert (= (and b!225598 (not c!37402)) b!225603))

(assert (= (and b!225603 c!37399) b!225589))

(assert (= (and b!225603 (not c!37399)) b!225587))

(assert (= (and b!225589 res!111006) b!225590))

(assert (= (and b!225590 res!111003) b!225600))

(assert (= (and b!225587 c!37401) b!225593))

(assert (= (and b!225587 (not c!37401)) b!225601))

(assert (= (and b!225593 res!111014) b!225583))

(assert (= (and b!225583 res!111004) b!225597))

(assert (= (or b!225589 b!225593) bm!20972))

(assert (= (or b!225600 b!225597) bm!20973))

(assert (= (and b!225598 res!111008) b!225588))

(assert (= (and b!225588 c!37400) b!225596))

(assert (= (and b!225588 (not c!37400)) b!225592))

(assert (= (and b!225588 (not res!111009)) b!225591))

(assert (= (and b!225591 (not res!111002)) b!225599))

(assert (= (and b!225599 (not res!111005)) b!225584))

(assert (= (and b!225584 (not res!111012)) b!225585))

(assert (= (and b!225585 (not res!111011)) b!225604))

(assert (= (and b!225580 condMapEmpty!10045) mapIsEmpty!10045))

(assert (= (and b!225580 (not condMapEmpty!10045)) mapNonEmpty!10045))

(assert (= (and mapNonEmpty!10045 ((_ is ValueCellFull!2615) mapValue!10045)) b!225582))

(assert (= (and b!225580 ((_ is ValueCellFull!2615) mapDefault!10045)) b!225581))

(assert (= b!225602 b!225580))

(assert (= start!21992 b!225602))

(declare-fun m!247633 () Bool)

(assert (=> b!225596 m!247633))

(declare-fun m!247635 () Bool)

(assert (=> b!225603 m!247635))

(declare-fun m!247637 () Bool)

(assert (=> mapNonEmpty!10045 m!247637))

(declare-fun m!247639 () Bool)

(assert (=> b!225595 m!247639))

(declare-fun m!247641 () Bool)

(assert (=> start!21992 m!247641))

(declare-fun m!247643 () Bool)

(assert (=> b!225586 m!247643))

(declare-fun m!247645 () Bool)

(assert (=> b!225604 m!247645))

(declare-fun m!247647 () Bool)

(assert (=> bm!20973 m!247647))

(declare-fun m!247649 () Bool)

(assert (=> bm!20972 m!247649))

(declare-fun m!247651 () Bool)

(assert (=> b!225588 m!247651))

(assert (=> b!225588 m!247647))

(declare-fun m!247653 () Bool)

(assert (=> b!225588 m!247653))

(declare-fun m!247655 () Bool)

(assert (=> b!225588 m!247655))

(declare-fun m!247657 () Bool)

(assert (=> b!225588 m!247657))

(declare-fun m!247659 () Bool)

(assert (=> b!225588 m!247659))

(declare-fun m!247661 () Bool)

(assert (=> b!225588 m!247661))

(declare-fun m!247663 () Bool)

(assert (=> b!225588 m!247663))

(declare-fun m!247665 () Bool)

(assert (=> b!225599 m!247665))

(declare-fun m!247667 () Bool)

(assert (=> b!225602 m!247667))

(declare-fun m!247669 () Bool)

(assert (=> b!225602 m!247669))

(declare-fun m!247671 () Bool)

(assert (=> b!225583 m!247671))

(declare-fun m!247673 () Bool)

(assert (=> b!225598 m!247673))

(declare-fun m!247675 () Bool)

(assert (=> b!225598 m!247675))

(assert (=> b!225598 m!247675))

(declare-fun m!247677 () Bool)

(assert (=> b!225598 m!247677))

(declare-fun m!247679 () Bool)

(assert (=> b!225590 m!247679))

(declare-fun m!247681 () Bool)

(assert (=> b!225585 m!247681))

(check-sat (not b!225585) tp_is_empty!5917 (not b!225598) (not b!225586) (not b!225599) (not b!225588) (not mapNonEmpty!10045) (not b!225595) (not bm!20973) (not b!225602) (not bm!20972) (not b_next!6055) (not b!225596) (not b!225603) b_and!12927 (not start!21992) (not b!225604))
(check-sat b_and!12927 (not b_next!6055))
