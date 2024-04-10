; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23702 () Bool)

(assert start!23702)

(declare-fun b!249058 () Bool)

(declare-fun b_free!6613 () Bool)

(declare-fun b_next!6613 () Bool)

(assert (=> b!249058 (= b_free!6613 (not b_next!6613))))

(declare-fun tp!23096 () Bool)

(declare-fun b_and!13621 () Bool)

(assert (=> b!249058 (= tp!23096 b_and!13621)))

(declare-fun bm!23369 () Bool)

(declare-fun call!23373 () Bool)

(declare-datatypes ((V!8281 0))(
  ( (V!8282 (val!3282 Int)) )
))
(declare-datatypes ((ValueCell!2894 0))(
  ( (ValueCellFull!2894 (v!5343 V!8281)) (EmptyCell!2894) )
))
(declare-datatypes ((array!12263 0))(
  ( (array!12264 (arr!5816 (Array (_ BitVec 32) ValueCell!2894)) (size!6159 (_ BitVec 32))) )
))
(declare-datatypes ((array!12265 0))(
  ( (array!12266 (arr!5817 (Array (_ BitVec 32) (_ BitVec 64))) (size!6160 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3688 0))(
  ( (LongMapFixedSize!3689 (defaultEntry!4605 Int) (mask!10766 (_ BitVec 32)) (extraKeys!4342 (_ BitVec 32)) (zeroValue!4446 V!8281) (minValue!4446 V!8281) (_size!1893 (_ BitVec 32)) (_keys!6733 array!12265) (_values!4588 array!12263) (_vacant!1893 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3688)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23369 (= call!23373 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10997 () Bool)

(declare-fun mapRes!10997 () Bool)

(assert (=> mapIsEmpty!10997 mapRes!10997))

(declare-fun b!249040 () Bool)

(declare-fun e!161539 () Bool)

(declare-datatypes ((SeekEntryResult!1115 0))(
  ( (MissingZero!1115 (index!6630 (_ BitVec 32))) (Found!1115 (index!6631 (_ BitVec 32))) (Intermediate!1115 (undefined!1927 Bool) (index!6632 (_ BitVec 32)) (x!24613 (_ BitVec 32))) (Undefined!1115) (MissingVacant!1115 (index!6633 (_ BitVec 32))) )
))
(declare-fun lt!124737 () SeekEntryResult!1115)

(assert (=> b!249040 (= e!161539 (is-Undefined!1115 lt!124737))))

(declare-fun b!249041 () Bool)

(declare-fun res!122026 () Bool)

(assert (=> b!249041 (= res!122026 (= (select (arr!5817 (_keys!6733 thiss!1504)) (index!6633 lt!124737)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161536 () Bool)

(assert (=> b!249041 (=> (not res!122026) (not e!161536))))

(declare-fun res!122032 () Bool)

(declare-fun e!161533 () Bool)

(assert (=> start!23702 (=> (not res!122032) (not e!161533))))

(declare-fun valid!1443 (LongMapFixedSize!3688) Bool)

(assert (=> start!23702 (= res!122032 (valid!1443 thiss!1504))))

(assert (=> start!23702 e!161533))

(declare-fun e!161542 () Bool)

(assert (=> start!23702 e!161542))

(assert (=> start!23702 true))

(declare-fun b!249042 () Bool)

(declare-fun e!161541 () Bool)

(declare-fun e!161535 () Bool)

(assert (=> b!249042 (= e!161541 (not e!161535))))

(declare-fun res!122031 () Bool)

(assert (=> b!249042 (=> res!122031 e!161535)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249042 (= res!122031 (not (validMask!0 (mask!10766 thiss!1504))))))

(declare-fun lt!124733 () array!12265)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12265 (_ BitVec 32)) Bool)

(assert (=> b!249042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124733 (mask!10766 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7710 0))(
  ( (Unit!7711) )
))
(declare-fun lt!124736 () Unit!7710)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12265 (_ BitVec 32) (_ BitVec 32)) Unit!7710)

(assert (=> b!249042 (= lt!124736 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) index!297 (mask!10766 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12265 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249042 (= (arrayCountValidKeys!0 lt!124733 #b00000000000000000000000000000000 (size!6160 (_keys!6733 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6160 (_keys!6733 thiss!1504)))))))

(declare-fun lt!124734 () Unit!7710)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12265 (_ BitVec 32) (_ BitVec 64)) Unit!7710)

(assert (=> b!249042 (= lt!124734 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6733 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3711 0))(
  ( (Nil!3708) (Cons!3707 (h!4365 (_ BitVec 64)) (t!8740 List!3711)) )
))
(declare-fun arrayNoDuplicates!0 (array!12265 (_ BitVec 32) List!3711) Bool)

(assert (=> b!249042 (arrayNoDuplicates!0 lt!124733 #b00000000000000000000000000000000 Nil!3708)))

(assert (=> b!249042 (= lt!124733 (array!12266 (store (arr!5817 (_keys!6733 thiss!1504)) index!297 key!932) (size!6160 (_keys!6733 thiss!1504))))))

(declare-fun lt!124735 () Unit!7710)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3711) Unit!7710)

(assert (=> b!249042 (= lt!124735 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6733 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3708))))

(declare-fun lt!124729 () Unit!7710)

(declare-fun e!161534 () Unit!7710)

(assert (=> b!249042 (= lt!124729 e!161534)))

(declare-fun c!41755 () Bool)

(assert (=> b!249042 (= c!41755 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249043 () Bool)

(declare-fun res!122028 () Bool)

(declare-fun e!161529 () Bool)

(assert (=> b!249043 (=> (not res!122028) (not e!161529))))

(assert (=> b!249043 (= res!122028 (= (select (arr!5817 (_keys!6733 thiss!1504)) (index!6630 lt!124737)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249044 () Bool)

(declare-fun res!122024 () Bool)

(assert (=> b!249044 (=> (not res!122024) (not e!161533))))

(assert (=> b!249044 (= res!122024 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249045 () Bool)

(declare-fun c!41756 () Bool)

(assert (=> b!249045 (= c!41756 (is-MissingVacant!1115 lt!124737))))

(declare-fun e!161531 () Bool)

(assert (=> b!249045 (= e!161531 e!161539)))

(declare-fun b!249046 () Bool)

(declare-fun e!161540 () Unit!7710)

(declare-fun lt!124732 () Unit!7710)

(assert (=> b!249046 (= e!161540 lt!124732)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!395 (array!12265 array!12263 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7710)

(assert (=> b!249046 (= lt!124732 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!395 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(declare-fun c!41754 () Bool)

(assert (=> b!249046 (= c!41754 (is-MissingZero!1115 lt!124737))))

(assert (=> b!249046 e!161531))

(declare-fun b!249047 () Bool)

(declare-fun e!161530 () Bool)

(assert (=> b!249047 (= e!161530 e!161541)))

(declare-fun res!122027 () Bool)

(assert (=> b!249047 (=> (not res!122027) (not e!161541))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!249047 (= res!122027 (inRange!0 index!297 (mask!10766 thiss!1504)))))

(declare-fun lt!124728 () Unit!7710)

(assert (=> b!249047 (= lt!124728 e!161540)))

(declare-fun c!41757 () Bool)

(declare-datatypes ((tuple2!4830 0))(
  ( (tuple2!4831 (_1!2426 (_ BitVec 64)) (_2!2426 V!8281)) )
))
(declare-datatypes ((List!3712 0))(
  ( (Nil!3709) (Cons!3708 (h!4366 tuple2!4830) (t!8741 List!3712)) )
))
(declare-datatypes ((ListLongMap!3743 0))(
  ( (ListLongMap!3744 (toList!1887 List!3712)) )
))
(declare-fun contains!1804 (ListLongMap!3743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1415 (array!12265 array!12263 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 32) Int) ListLongMap!3743)

(assert (=> b!249047 (= c!41757 (contains!1804 (getCurrentListMap!1415 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932))))

(declare-fun b!249048 () Bool)

(declare-fun e!161528 () Bool)

(declare-fun tp_is_empty!6475 () Bool)

(assert (=> b!249048 (= e!161528 tp_is_empty!6475)))

(declare-fun mapNonEmpty!10997 () Bool)

(declare-fun tp!23095 () Bool)

(declare-fun e!161538 () Bool)

(assert (=> mapNonEmpty!10997 (= mapRes!10997 (and tp!23095 e!161538))))

(declare-fun mapRest!10997 () (Array (_ BitVec 32) ValueCell!2894))

(declare-fun mapValue!10997 () ValueCell!2894)

(declare-fun mapKey!10997 () (_ BitVec 32))

(assert (=> mapNonEmpty!10997 (= (arr!5816 (_values!4588 thiss!1504)) (store mapRest!10997 mapKey!10997 mapValue!10997))))

(declare-fun bm!23370 () Bool)

(declare-fun call!23372 () Bool)

(assert (=> bm!23370 (= call!23372 (inRange!0 (ite c!41754 (index!6630 lt!124737) (index!6633 lt!124737)) (mask!10766 thiss!1504)))))

(declare-fun b!249049 () Bool)

(declare-fun Unit!7712 () Unit!7710)

(assert (=> b!249049 (= e!161540 Unit!7712)))

(declare-fun lt!124730 () Unit!7710)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (array!12265 array!12263 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7710)

(assert (=> b!249049 (= lt!124730 (lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!249049 false))

(declare-fun b!249050 () Bool)

(assert (=> b!249050 (= e!161538 tp_is_empty!6475)))

(declare-fun b!249051 () Bool)

(declare-fun Unit!7713 () Unit!7710)

(assert (=> b!249051 (= e!161534 Unit!7713)))

(declare-fun lt!124731 () Unit!7710)

(declare-fun lemmaArrayContainsKeyThenInListMap!196 (array!12265 array!12263 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) (_ BitVec 32) Int) Unit!7710)

(assert (=> b!249051 (= lt!124731 (lemmaArrayContainsKeyThenInListMap!196 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!249051 false))

(declare-fun b!249052 () Bool)

(declare-fun res!122030 () Bool)

(assert (=> b!249052 (=> (not res!122030) (not e!161529))))

(assert (=> b!249052 (= res!122030 call!23372)))

(assert (=> b!249052 (= e!161531 e!161529)))

(declare-fun b!249053 () Bool)

(assert (=> b!249053 (= e!161529 (not call!23373))))

(declare-fun b!249054 () Bool)

(declare-fun e!161532 () Bool)

(assert (=> b!249054 (= e!161532 (and e!161528 mapRes!10997))))

(declare-fun condMapEmpty!10997 () Bool)

(declare-fun mapDefault!10997 () ValueCell!2894)

