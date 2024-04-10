; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23256 () Bool)

(assert start!23256)

(declare-fun b!244410 () Bool)

(declare-fun b_free!6539 () Bool)

(declare-fun b_next!6539 () Bool)

(assert (=> b!244410 (= b_free!6539 (not b_next!6539))))

(declare-fun tp!22843 () Bool)

(declare-fun b_and!13523 () Bool)

(assert (=> b!244410 (= tp!22843 b_and!13523)))

(declare-fun b!244384 () Bool)

(declare-fun e!158574 () Bool)

(declare-datatypes ((SeekEntryResult!1080 0))(
  ( (MissingZero!1080 (index!6490 (_ BitVec 32))) (Found!1080 (index!6491 (_ BitVec 32))) (Intermediate!1080 (undefined!1892 Bool) (index!6492 (_ BitVec 32)) (x!24366 (_ BitVec 32))) (Undefined!1080) (MissingVacant!1080 (index!6493 (_ BitVec 32))) )
))
(declare-fun lt!122477 () SeekEntryResult!1080)

(assert (=> b!244384 (= e!158574 (is-Undefined!1080 lt!122477))))

(declare-fun b!244385 () Bool)

(declare-fun e!158583 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244385 (= e!158583 (not (validKeyInArray!0 key!932)))))

(declare-datatypes ((V!8181 0))(
  ( (V!8182 (val!3245 Int)) )
))
(declare-datatypes ((ValueCell!2857 0))(
  ( (ValueCellFull!2857 (v!5294 V!8181)) (EmptyCell!2857) )
))
(declare-datatypes ((array!12095 0))(
  ( (array!12096 (arr!5742 (Array (_ BitVec 32) ValueCell!2857)) (size!6084 (_ BitVec 32))) )
))
(declare-datatypes ((array!12097 0))(
  ( (array!12098 (arr!5743 (Array (_ BitVec 32) (_ BitVec 64))) (size!6085 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3614 0))(
  ( (LongMapFixedSize!3615 (defaultEntry!4524 Int) (mask!10623 (_ BitVec 32)) (extraKeys!4261 (_ BitVec 32)) (zeroValue!4365 V!8181) (minValue!4365 V!8181) (_size!1856 (_ BitVec 32)) (_keys!6636 array!12097) (_values!4507 array!12095) (_vacant!1856 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3614)

(declare-fun c!40787 () Bool)

(declare-fun call!22791 () Bool)

(declare-fun bm!22787 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22787 (= call!22791 (inRange!0 (ite c!40787 (index!6490 lt!122477) (index!6493 lt!122477)) (mask!10623 thiss!1504)))))

(declare-fun b!244386 () Bool)

(declare-fun e!158580 () Bool)

(declare-fun e!158581 () Bool)

(assert (=> b!244386 (= e!158580 e!158581)))

(declare-fun res!119860 () Bool)

(assert (=> b!244386 (=> (not res!119860) (not e!158581))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244386 (= res!119860 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244387 () Bool)

(declare-datatypes ((List!3658 0))(
  ( (Nil!3655) (Cons!3654 (h!4311 (_ BitVec 64)) (t!8667 List!3658)) )
))
(declare-fun contains!1764 (List!3658 (_ BitVec 64)) Bool)

(assert (=> b!244387 (= e!158581 (not (contains!1764 Nil!3655 key!932)))))

(declare-fun b!244388 () Bool)

(declare-fun e!158575 () Bool)

(assert (=> b!244388 (= e!158574 e!158575)))

(declare-fun res!119867 () Bool)

(assert (=> b!244388 (= res!119867 call!22791)))

(assert (=> b!244388 (=> (not res!119867) (not e!158575))))

(declare-fun b!244389 () Bool)

(declare-fun res!119866 () Bool)

(declare-fun e!158588 () Bool)

(assert (=> b!244389 (=> (not res!119866) (not e!158588))))

(assert (=> b!244389 (= res!119866 (= (select (arr!5743 (_keys!6636 thiss!1504)) (index!6490 lt!122477)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244390 () Bool)

(declare-datatypes ((Unit!7545 0))(
  ( (Unit!7546) )
))
(declare-fun e!158579 () Unit!7545)

(declare-fun Unit!7547 () Unit!7545)

(assert (=> b!244390 (= e!158579 Unit!7547)))

(declare-fun b!244391 () Bool)

(declare-fun res!119854 () Bool)

(assert (=> b!244391 (=> (not res!119854) (not e!158583))))

(assert (=> b!244391 (= res!119854 (not (contains!1764 Nil!3655 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!22788 () Bool)

(declare-fun call!22790 () Bool)

(declare-fun arrayContainsKey!0 (array!12097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22788 (= call!22790 (arrayContainsKey!0 (_keys!6636 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244392 () Bool)

(declare-fun res!119869 () Bool)

(assert (=> b!244392 (= res!119869 (= (select (arr!5743 (_keys!6636 thiss!1504)) (index!6493 lt!122477)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244392 (=> (not res!119869) (not e!158575))))

(declare-fun res!119864 () Bool)

(declare-fun e!158577 () Bool)

(assert (=> start!23256 (=> (not res!119864) (not e!158577))))

(declare-fun valid!1416 (LongMapFixedSize!3614) Bool)

(assert (=> start!23256 (= res!119864 (valid!1416 thiss!1504))))

(assert (=> start!23256 e!158577))

(declare-fun e!158576 () Bool)

(assert (=> start!23256 e!158576))

(assert (=> start!23256 true))

(declare-fun b!244393 () Bool)

(declare-fun res!119858 () Bool)

(assert (=> b!244393 (=> (not res!119858) (not e!158577))))

(assert (=> b!244393 (= res!119858 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244394 () Bool)

(declare-fun res!119859 () Bool)

(assert (=> b!244394 (=> (not res!119859) (not e!158583))))

(declare-fun arrayNoDuplicates!0 (array!12097 (_ BitVec 32) List!3658) Bool)

(assert (=> b!244394 (= res!119859 (arrayNoDuplicates!0 (_keys!6636 thiss!1504) #b00000000000000000000000000000000 Nil!3655))))

(declare-fun b!244395 () Bool)

(declare-fun res!119856 () Bool)

(assert (=> b!244395 (=> (not res!119856) (not e!158583))))

(assert (=> b!244395 (= res!119856 (not (contains!1764 Nil!3655 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244396 () Bool)

(declare-fun c!40785 () Bool)

(assert (=> b!244396 (= c!40785 (is-MissingVacant!1080 lt!122477))))

(declare-fun e!158586 () Bool)

(assert (=> b!244396 (= e!158586 e!158574)))

(declare-fun b!244397 () Bool)

(declare-fun e!158587 () Bool)

(assert (=> b!244397 (= e!158587 (contains!1764 Nil!3655 key!932))))

(declare-fun b!244398 () Bool)

(declare-fun res!119861 () Bool)

(assert (=> b!244398 (=> (not res!119861) (not e!158583))))

(assert (=> b!244398 (= res!119861 e!158580)))

(declare-fun res!119853 () Bool)

(assert (=> b!244398 (=> res!119853 e!158580)))

(assert (=> b!244398 (= res!119853 e!158587)))

(declare-fun res!119868 () Bool)

(assert (=> b!244398 (=> (not res!119868) (not e!158587))))

(assert (=> b!244398 (= res!119868 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244399 () Bool)

(declare-fun e!158578 () Bool)

(declare-fun tp_is_empty!6401 () Bool)

(assert (=> b!244399 (= e!158578 tp_is_empty!6401)))

(declare-fun b!244400 () Bool)

(declare-fun Unit!7548 () Unit!7545)

(assert (=> b!244400 (= e!158579 Unit!7548)))

(declare-fun lt!122478 () Unit!7545)

(declare-fun lemmaArrayContainsKeyThenInListMap!170 (array!12097 array!12095 (_ BitVec 32) (_ BitVec 32) V!8181 V!8181 (_ BitVec 64) (_ BitVec 32) Int) Unit!7545)

(assert (=> b!244400 (= lt!122478 (lemmaArrayContainsKeyThenInListMap!170 (_keys!6636 thiss!1504) (_values!4507 thiss!1504) (mask!10623 thiss!1504) (extraKeys!4261 thiss!1504) (zeroValue!4365 thiss!1504) (minValue!4365 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4524 thiss!1504)))))

(assert (=> b!244400 false))

(declare-fun mapNonEmpty!10855 () Bool)

(declare-fun mapRes!10855 () Bool)

(declare-fun tp!22842 () Bool)

(declare-fun e!158573 () Bool)

(assert (=> mapNonEmpty!10855 (= mapRes!10855 (and tp!22842 e!158573))))

(declare-fun mapKey!10855 () (_ BitVec 32))

(declare-fun mapValue!10855 () ValueCell!2857)

(declare-fun mapRest!10855 () (Array (_ BitVec 32) ValueCell!2857))

(assert (=> mapNonEmpty!10855 (= (arr!5742 (_values!4507 thiss!1504)) (store mapRest!10855 mapKey!10855 mapValue!10855))))

(declare-fun b!244401 () Bool)

(declare-fun e!158582 () Bool)

(assert (=> b!244401 (= e!158577 e!158582)))

(declare-fun res!119865 () Bool)

(assert (=> b!244401 (=> (not res!119865) (not e!158582))))

(assert (=> b!244401 (= res!119865 (or (= lt!122477 (MissingZero!1080 index!297)) (= lt!122477 (MissingVacant!1080 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12097 (_ BitVec 32)) SeekEntryResult!1080)

(assert (=> b!244401 (= lt!122477 (seekEntryOrOpen!0 key!932 (_keys!6636 thiss!1504) (mask!10623 thiss!1504)))))

(declare-fun b!244402 () Bool)

(assert (=> b!244402 (= e!158575 (not call!22790))))

(declare-fun b!244403 () Bool)

(declare-fun e!158589 () Bool)

(assert (=> b!244403 (= e!158589 e!158583)))

(declare-fun res!119870 () Bool)

(assert (=> b!244403 (=> (not res!119870) (not e!158583))))

(assert (=> b!244403 (= res!119870 (and (bvslt (size!6085 (_keys!6636 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6085 (_keys!6636 thiss!1504)))))))

(declare-fun lt!122475 () Unit!7545)

(assert (=> b!244403 (= lt!122475 e!158579)))

(declare-fun c!40786 () Bool)

(assert (=> b!244403 (= c!40786 (arrayContainsKey!0 (_keys!6636 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244404 () Bool)

(assert (=> b!244404 (= e!158582 e!158589)))

(declare-fun res!119862 () Bool)

(assert (=> b!244404 (=> (not res!119862) (not e!158589))))

(assert (=> b!244404 (= res!119862 (inRange!0 index!297 (mask!10623 thiss!1504)))))

(declare-fun lt!122474 () Unit!7545)

(declare-fun e!158572 () Unit!7545)

(assert (=> b!244404 (= lt!122474 e!158572)))

(declare-fun c!40788 () Bool)

(declare-datatypes ((tuple2!4776 0))(
  ( (tuple2!4777 (_1!2399 (_ BitVec 64)) (_2!2399 V!8181)) )
))
(declare-datatypes ((List!3659 0))(
  ( (Nil!3656) (Cons!3655 (h!4312 tuple2!4776) (t!8668 List!3659)) )
))
(declare-datatypes ((ListLongMap!3689 0))(
  ( (ListLongMap!3690 (toList!1860 List!3659)) )
))
(declare-fun contains!1765 (ListLongMap!3689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1388 (array!12097 array!12095 (_ BitVec 32) (_ BitVec 32) V!8181 V!8181 (_ BitVec 32) Int) ListLongMap!3689)

(assert (=> b!244404 (= c!40788 (contains!1765 (getCurrentListMap!1388 (_keys!6636 thiss!1504) (_values!4507 thiss!1504) (mask!10623 thiss!1504) (extraKeys!4261 thiss!1504) (zeroValue!4365 thiss!1504) (minValue!4365 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4524 thiss!1504)) key!932))))

(declare-fun b!244405 () Bool)

(declare-fun lt!122473 () Unit!7545)

(assert (=> b!244405 (= e!158572 lt!122473)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!373 (array!12097 array!12095 (_ BitVec 32) (_ BitVec 32) V!8181 V!8181 (_ BitVec 64) Int) Unit!7545)

(assert (=> b!244405 (= lt!122473 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!373 (_keys!6636 thiss!1504) (_values!4507 thiss!1504) (mask!10623 thiss!1504) (extraKeys!4261 thiss!1504) (zeroValue!4365 thiss!1504) (minValue!4365 thiss!1504) key!932 (defaultEntry!4524 thiss!1504)))))

(assert (=> b!244405 (= c!40787 (is-MissingZero!1080 lt!122477))))

(assert (=> b!244405 e!158586))

(declare-fun b!244406 () Bool)

(declare-fun e!158585 () Bool)

(assert (=> b!244406 (= e!158585 (and e!158578 mapRes!10855))))

(declare-fun condMapEmpty!10855 () Bool)

(declare-fun mapDefault!10855 () ValueCell!2857)

