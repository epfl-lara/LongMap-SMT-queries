; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23568 () Bool)

(assert start!23568)

(declare-fun b!247487 () Bool)

(declare-fun b_free!6583 () Bool)

(declare-fun b_next!6583 () Bool)

(assert (=> b!247487 (= b_free!6583 (not b_next!6583))))

(declare-fun tp!22997 () Bool)

(declare-fun b_and!13599 () Bool)

(assert (=> b!247487 (= tp!22997 b_and!13599)))

(declare-fun b!247466 () Bool)

(declare-fun e!160526 () Bool)

(declare-fun e!160531 () Bool)

(declare-fun mapRes!10943 () Bool)

(assert (=> b!247466 (= e!160526 (and e!160531 mapRes!10943))))

(declare-fun condMapEmpty!10943 () Bool)

(declare-datatypes ((V!8241 0))(
  ( (V!8242 (val!3267 Int)) )
))
(declare-datatypes ((ValueCell!2879 0))(
  ( (ValueCellFull!2879 (v!5326 V!8241)) (EmptyCell!2879) )
))
(declare-datatypes ((array!12195 0))(
  ( (array!12196 (arr!5785 (Array (_ BitVec 32) ValueCell!2879)) (size!6128 (_ BitVec 32))) )
))
(declare-datatypes ((array!12197 0))(
  ( (array!12198 (arr!5786 (Array (_ BitVec 32) (_ BitVec 64))) (size!6129 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3658 0))(
  ( (LongMapFixedSize!3659 (defaultEntry!4578 Int) (mask!10716 (_ BitVec 32)) (extraKeys!4315 (_ BitVec 32)) (zeroValue!4419 V!8241) (minValue!4419 V!8241) (_size!1878 (_ BitVec 32)) (_keys!6700 array!12197) (_values!4561 array!12195) (_vacant!1878 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3658)

(declare-fun mapDefault!10943 () ValueCell!2879)

(assert (=> b!247466 (= condMapEmpty!10943 (= (arr!5785 (_values!4561 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2879)) mapDefault!10943)))))

(declare-fun b!247467 () Bool)

(declare-fun e!160532 () Bool)

(declare-fun e!160534 () Bool)

(assert (=> b!247467 (= e!160532 (not e!160534))))

(declare-fun res!121305 () Bool)

(assert (=> b!247467 (=> res!121305 e!160534)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247467 (= res!121305 (not (validMask!0 (mask!10716 thiss!1504))))))

(declare-fun lt!123988 () array!12197)

(declare-fun arrayCountValidKeys!0 (array!12197 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247467 (= (arrayCountValidKeys!0 lt!123988 #b00000000000000000000000000000000 (size!6129 (_keys!6700 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6700 thiss!1504) #b00000000000000000000000000000000 (size!6129 (_keys!6700 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7627 0))(
  ( (Unit!7628) )
))
(declare-fun lt!123983 () Unit!7627)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12197 (_ BitVec 32) (_ BitVec 64)) Unit!7627)

(assert (=> b!247467 (= lt!123983 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6700 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3616 0))(
  ( (Nil!3613) (Cons!3612 (h!4270 (_ BitVec 64)) (t!8631 List!3616)) )
))
(declare-fun arrayNoDuplicates!0 (array!12197 (_ BitVec 32) List!3616) Bool)

(assert (=> b!247467 (arrayNoDuplicates!0 lt!123988 #b00000000000000000000000000000000 Nil!3613)))

(assert (=> b!247467 (= lt!123988 (array!12198 (store (arr!5786 (_keys!6700 thiss!1504)) index!297 key!932) (size!6129 (_keys!6700 thiss!1504))))))

(declare-fun lt!123984 () Unit!7627)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3616) Unit!7627)

(assert (=> b!247467 (= lt!123984 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6700 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3613))))

(declare-fun lt!123989 () Unit!7627)

(declare-fun e!160524 () Unit!7627)

(assert (=> b!247467 (= lt!123989 e!160524)))

(declare-fun c!41438 () Bool)

(declare-fun lt!123985 () Bool)

(assert (=> b!247467 (= c!41438 lt!123985)))

(declare-fun arrayContainsKey!0 (array!12197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247467 (= lt!123985 (arrayContainsKey!0 (_keys!6700 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247468 () Bool)

(assert (=> b!247468 (= e!160534 (not lt!123985))))

(declare-fun b!247469 () Bool)

(declare-fun e!160530 () Bool)

(assert (=> b!247469 (= e!160530 e!160532)))

(declare-fun res!121304 () Bool)

(assert (=> b!247469 (=> (not res!121304) (not e!160532))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247469 (= res!121304 (inRange!0 index!297 (mask!10716 thiss!1504)))))

(declare-fun lt!123987 () Unit!7627)

(declare-fun e!160535 () Unit!7627)

(assert (=> b!247469 (= lt!123987 e!160535)))

(declare-fun c!41436 () Bool)

(declare-datatypes ((tuple2!4740 0))(
  ( (tuple2!4741 (_1!2381 (_ BitVec 64)) (_2!2381 V!8241)) )
))
(declare-datatypes ((List!3617 0))(
  ( (Nil!3614) (Cons!3613 (h!4271 tuple2!4740) (t!8632 List!3617)) )
))
(declare-datatypes ((ListLongMap!3655 0))(
  ( (ListLongMap!3656 (toList!1843 List!3617)) )
))
(declare-fun contains!1773 (ListLongMap!3655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1375 (array!12197 array!12195 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 32) Int) ListLongMap!3655)

(assert (=> b!247469 (= c!41436 (contains!1773 (getCurrentListMap!1375 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)) key!932))))

(declare-fun b!247470 () Bool)

(declare-fun Unit!7629 () Unit!7627)

(assert (=> b!247470 (= e!160524 Unit!7629)))

(declare-fun lt!123982 () Unit!7627)

(declare-fun lemmaArrayContainsKeyThenInListMap!197 (array!12197 array!12195 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) (_ BitVec 32) Int) Unit!7627)

(assert (=> b!247470 (= lt!123982 (lemmaArrayContainsKeyThenInListMap!197 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247470 false))

(declare-fun bm!23155 () Bool)

(declare-fun call!23158 () Bool)

(assert (=> bm!23155 (= call!23158 (arrayContainsKey!0 (_keys!6700 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247471 () Bool)

(declare-fun res!121297 () Bool)

(declare-fun e!160523 () Bool)

(assert (=> b!247471 (=> (not res!121297) (not e!160523))))

(declare-datatypes ((SeekEntryResult!1068 0))(
  ( (MissingZero!1068 (index!6442 (_ BitVec 32))) (Found!1068 (index!6443 (_ BitVec 32))) (Intermediate!1068 (undefined!1880 Bool) (index!6444 (_ BitVec 32)) (x!24496 (_ BitVec 32))) (Undefined!1068) (MissingVacant!1068 (index!6445 (_ BitVec 32))) )
))
(declare-fun lt!123986 () SeekEntryResult!1068)

(assert (=> b!247471 (= res!121297 (= (select (arr!5786 (_keys!6700 thiss!1504)) (index!6442 lt!123986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247472 () Bool)

(declare-fun res!121302 () Bool)

(assert (=> b!247472 (=> res!121302 e!160534)))

(assert (=> b!247472 (= res!121302 (or (not (= (size!6129 (_keys!6700 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10716 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6129 (_keys!6700 thiss!1504)))))))

(declare-fun b!247473 () Bool)

(declare-fun res!121298 () Bool)

(assert (=> b!247473 (= res!121298 (= (select (arr!5786 (_keys!6700 thiss!1504)) (index!6445 lt!123986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160522 () Bool)

(assert (=> b!247473 (=> (not res!121298) (not e!160522))))

(declare-fun b!247474 () Bool)

(assert (=> b!247474 (= e!160522 (not call!23158))))

(declare-fun b!247475 () Bool)

(declare-fun lt!123980 () Unit!7627)

(assert (=> b!247475 (= e!160535 lt!123980)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!374 (array!12197 array!12195 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7627)

(assert (=> b!247475 (= lt!123980 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!374 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(declare-fun c!41437 () Bool)

(get-info :version)

(assert (=> b!247475 (= c!41437 ((_ is MissingZero!1068) lt!123986))))

(declare-fun e!160528 () Bool)

(assert (=> b!247475 e!160528))

(declare-fun b!247476 () Bool)

(declare-fun res!121301 () Bool)

(assert (=> b!247476 (=> (not res!121301) (not e!160523))))

(declare-fun call!23159 () Bool)

(assert (=> b!247476 (= res!121301 call!23159)))

(assert (=> b!247476 (= e!160528 e!160523)))

(declare-fun b!247477 () Bool)

(declare-fun e!160536 () Bool)

(assert (=> b!247477 (= e!160536 e!160530)))

(declare-fun res!121306 () Bool)

(assert (=> b!247477 (=> (not res!121306) (not e!160530))))

(assert (=> b!247477 (= res!121306 (or (= lt!123986 (MissingZero!1068 index!297)) (= lt!123986 (MissingVacant!1068 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12197 (_ BitVec 32)) SeekEntryResult!1068)

(assert (=> b!247477 (= lt!123986 (seekEntryOrOpen!0 key!932 (_keys!6700 thiss!1504) (mask!10716 thiss!1504)))))

(declare-fun b!247478 () Bool)

(declare-fun e!160527 () Bool)

(assert (=> b!247478 (= e!160527 ((_ is Undefined!1068) lt!123986))))

(declare-fun res!121303 () Bool)

(assert (=> start!23568 (=> (not res!121303) (not e!160536))))

(declare-fun valid!1442 (LongMapFixedSize!3658) Bool)

(assert (=> start!23568 (= res!121303 (valid!1442 thiss!1504))))

(assert (=> start!23568 e!160536))

(declare-fun e!160525 () Bool)

(assert (=> start!23568 e!160525))

(assert (=> start!23568 true))

(declare-fun mapIsEmpty!10943 () Bool)

(assert (=> mapIsEmpty!10943 mapRes!10943))

(declare-fun b!247479 () Bool)

(declare-fun Unit!7630 () Unit!7627)

(assert (=> b!247479 (= e!160535 Unit!7630)))

(declare-fun lt!123981 () Unit!7627)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!379 (array!12197 array!12195 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7627)

(assert (=> b!247479 (= lt!123981 (lemmaInListMapThenSeekEntryOrOpenFindsIt!379 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247479 false))

(declare-fun mapNonEmpty!10943 () Bool)

(declare-fun tp!22996 () Bool)

(declare-fun e!160533 () Bool)

(assert (=> mapNonEmpty!10943 (= mapRes!10943 (and tp!22996 e!160533))))

(declare-fun mapRest!10943 () (Array (_ BitVec 32) ValueCell!2879))

(declare-fun mapValue!10943 () ValueCell!2879)

(declare-fun mapKey!10943 () (_ BitVec 32))

(assert (=> mapNonEmpty!10943 (= (arr!5785 (_values!4561 thiss!1504)) (store mapRest!10943 mapKey!10943 mapValue!10943))))

(declare-fun b!247480 () Bool)

(declare-fun Unit!7631 () Unit!7627)

(assert (=> b!247480 (= e!160524 Unit!7631)))

(declare-fun b!247481 () Bool)

(assert (=> b!247481 (= e!160523 (not call!23158))))

(declare-fun b!247482 () Bool)

(declare-fun tp_is_empty!6445 () Bool)

(assert (=> b!247482 (= e!160533 tp_is_empty!6445)))

(declare-fun b!247483 () Bool)

(declare-fun res!121296 () Bool)

(assert (=> b!247483 (=> (not res!121296) (not e!160536))))

(assert (=> b!247483 (= res!121296 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247484 () Bool)

(assert (=> b!247484 (= e!160527 e!160522)))

(declare-fun res!121299 () Bool)

(assert (=> b!247484 (= res!121299 call!23159)))

(assert (=> b!247484 (=> (not res!121299) (not e!160522))))

(declare-fun b!247485 () Bool)

(declare-fun c!41439 () Bool)

(assert (=> b!247485 (= c!41439 ((_ is MissingVacant!1068) lt!123986))))

(assert (=> b!247485 (= e!160528 e!160527)))

(declare-fun b!247486 () Bool)

(assert (=> b!247486 (= e!160531 tp_is_empty!6445)))

(declare-fun array_inv!3805 (array!12197) Bool)

(declare-fun array_inv!3806 (array!12195) Bool)

(assert (=> b!247487 (= e!160525 (and tp!22997 tp_is_empty!6445 (array_inv!3805 (_keys!6700 thiss!1504)) (array_inv!3806 (_values!4561 thiss!1504)) e!160526))))

(declare-fun b!247488 () Bool)

(declare-fun res!121300 () Bool)

(assert (=> b!247488 (=> res!121300 e!160534)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247488 (= res!121300 (not (validKeyInArray!0 key!932)))))

(declare-fun bm!23156 () Bool)

(assert (=> bm!23156 (= call!23159 (inRange!0 (ite c!41437 (index!6442 lt!123986) (index!6445 lt!123986)) (mask!10716 thiss!1504)))))

(assert (= (and start!23568 res!121303) b!247483))

(assert (= (and b!247483 res!121296) b!247477))

(assert (= (and b!247477 res!121306) b!247469))

(assert (= (and b!247469 c!41436) b!247479))

(assert (= (and b!247469 (not c!41436)) b!247475))

(assert (= (and b!247475 c!41437) b!247476))

(assert (= (and b!247475 (not c!41437)) b!247485))

(assert (= (and b!247476 res!121301) b!247471))

(assert (= (and b!247471 res!121297) b!247481))

(assert (= (and b!247485 c!41439) b!247484))

(assert (= (and b!247485 (not c!41439)) b!247478))

(assert (= (and b!247484 res!121299) b!247473))

(assert (= (and b!247473 res!121298) b!247474))

(assert (= (or b!247476 b!247484) bm!23156))

(assert (= (or b!247481 b!247474) bm!23155))

(assert (= (and b!247469 res!121304) b!247467))

(assert (= (and b!247467 c!41438) b!247470))

(assert (= (and b!247467 (not c!41438)) b!247480))

(assert (= (and b!247467 (not res!121305)) b!247472))

(assert (= (and b!247472 (not res!121302)) b!247488))

(assert (= (and b!247488 (not res!121300)) b!247468))

(assert (= (and b!247466 condMapEmpty!10943) mapIsEmpty!10943))

(assert (= (and b!247466 (not condMapEmpty!10943)) mapNonEmpty!10943))

(assert (= (and mapNonEmpty!10943 ((_ is ValueCellFull!2879) mapValue!10943)) b!247482))

(assert (= (and b!247466 ((_ is ValueCellFull!2879) mapDefault!10943)) b!247486))

(assert (= b!247487 b!247466))

(assert (= start!23568 b!247487))

(declare-fun m!264675 () Bool)

(assert (=> b!247479 m!264675))

(declare-fun m!264677 () Bool)

(assert (=> mapNonEmpty!10943 m!264677))

(declare-fun m!264679 () Bool)

(assert (=> b!247475 m!264679))

(declare-fun m!264681 () Bool)

(assert (=> b!247487 m!264681))

(declare-fun m!264683 () Bool)

(assert (=> b!247487 m!264683))

(declare-fun m!264685 () Bool)

(assert (=> b!247477 m!264685))

(declare-fun m!264687 () Bool)

(assert (=> start!23568 m!264687))

(declare-fun m!264689 () Bool)

(assert (=> b!247469 m!264689))

(declare-fun m!264691 () Bool)

(assert (=> b!247469 m!264691))

(assert (=> b!247469 m!264691))

(declare-fun m!264693 () Bool)

(assert (=> b!247469 m!264693))

(declare-fun m!264695 () Bool)

(assert (=> b!247488 m!264695))

(declare-fun m!264697 () Bool)

(assert (=> b!247471 m!264697))

(declare-fun m!264699 () Bool)

(assert (=> b!247467 m!264699))

(declare-fun m!264701 () Bool)

(assert (=> b!247467 m!264701))

(declare-fun m!264703 () Bool)

(assert (=> b!247467 m!264703))

(declare-fun m!264705 () Bool)

(assert (=> b!247467 m!264705))

(declare-fun m!264707 () Bool)

(assert (=> b!247467 m!264707))

(declare-fun m!264709 () Bool)

(assert (=> b!247467 m!264709))

(declare-fun m!264711 () Bool)

(assert (=> b!247467 m!264711))

(declare-fun m!264713 () Bool)

(assert (=> b!247467 m!264713))

(declare-fun m!264715 () Bool)

(assert (=> b!247470 m!264715))

(declare-fun m!264717 () Bool)

(assert (=> bm!23156 m!264717))

(assert (=> bm!23155 m!264701))

(declare-fun m!264719 () Bool)

(assert (=> b!247473 m!264719))

(check-sat (not b!247470) (not b!247469) (not start!23568) (not b_next!6583) (not b!247477) tp_is_empty!6445 (not b!247487) (not b!247479) (not bm!23156) (not b!247475) (not bm!23155) (not b!247488) b_and!13599 (not mapNonEmpty!10943) (not b!247467))
(check-sat b_and!13599 (not b_next!6583))
