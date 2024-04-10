; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23880 () Bool)

(assert start!23880)

(declare-fun b!250397 () Bool)

(declare-fun b_free!6627 () Bool)

(declare-fun b_next!6627 () Bool)

(assert (=> b!250397 (= b_free!6627 (not b_next!6627))))

(declare-fun tp!23146 () Bool)

(declare-fun b_and!13647 () Bool)

(assert (=> b!250397 (= tp!23146 b_and!13647)))

(declare-fun b!250377 () Bool)

(declare-datatypes ((Unit!7748 0))(
  ( (Unit!7749) )
))
(declare-fun e!162389 () Unit!7748)

(declare-fun Unit!7750 () Unit!7748)

(assert (=> b!250377 (= e!162389 Unit!7750)))

(declare-fun mapNonEmpty!11026 () Bool)

(declare-fun mapRes!11026 () Bool)

(declare-fun tp!23145 () Bool)

(declare-fun e!162382 () Bool)

(assert (=> mapNonEmpty!11026 (= mapRes!11026 (and tp!23145 e!162382))))

(declare-datatypes ((V!8299 0))(
  ( (V!8300 (val!3289 Int)) )
))
(declare-datatypes ((ValueCell!2901 0))(
  ( (ValueCellFull!2901 (v!5354 V!8299)) (EmptyCell!2901) )
))
(declare-datatypes ((array!12295 0))(
  ( (array!12296 (arr!5830 (Array (_ BitVec 32) ValueCell!2901)) (size!6175 (_ BitVec 32))) )
))
(declare-datatypes ((array!12297 0))(
  ( (array!12298 (arr!5831 (Array (_ BitVec 32) (_ BitVec 64))) (size!6176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3702 0))(
  ( (LongMapFixedSize!3703 (defaultEntry!4628 Int) (mask!10811 (_ BitVec 32)) (extraKeys!4365 (_ BitVec 32)) (zeroValue!4469 V!8299) (minValue!4469 V!8299) (_size!1900 (_ BitVec 32)) (_keys!6764 array!12297) (_values!4611 array!12295) (_vacant!1900 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3702)

(declare-fun mapRest!11026 () (Array (_ BitVec 32) ValueCell!2901))

(declare-fun mapValue!11026 () ValueCell!2901)

(declare-fun mapKey!11026 () (_ BitVec 32))

(assert (=> mapNonEmpty!11026 (= (arr!5830 (_values!4611 thiss!1504)) (store mapRest!11026 mapKey!11026 mapValue!11026))))

(declare-fun res!122632 () Bool)

(declare-fun e!162391 () Bool)

(assert (=> start!23880 (=> (not res!122632) (not e!162391))))

(declare-fun valid!1447 (LongMapFixedSize!3702) Bool)

(assert (=> start!23880 (= res!122632 (valid!1447 thiss!1504))))

(assert (=> start!23880 e!162391))

(declare-fun e!162390 () Bool)

(assert (=> start!23880 e!162390))

(assert (=> start!23880 true))

(declare-fun b!250378 () Bool)

(declare-fun e!162393 () Unit!7748)

(declare-fun Unit!7751 () Unit!7748)

(assert (=> b!250378 (= e!162393 Unit!7751)))

(declare-fun lt!125439 () Unit!7748)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) Int) Unit!7748)

(assert (=> b!250378 (= lt!125439 (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)))))

(assert (=> b!250378 false))

(declare-fun mapIsEmpty!11026 () Bool)

(assert (=> mapIsEmpty!11026 mapRes!11026))

(declare-fun b!250379 () Bool)

(declare-fun e!162394 () Bool)

(declare-datatypes ((SeekEntryResult!1121 0))(
  ( (MissingZero!1121 (index!6654 (_ BitVec 32))) (Found!1121 (index!6655 (_ BitVec 32))) (Intermediate!1121 (undefined!1933 Bool) (index!6656 (_ BitVec 32)) (x!24671 (_ BitVec 32))) (Undefined!1121) (MissingVacant!1121 (index!6657 (_ BitVec 32))) )
))
(declare-fun lt!125440 () SeekEntryResult!1121)

(get-info :version)

(assert (=> b!250379 (= e!162394 ((_ is Undefined!1121) lt!125440))))

(declare-fun b!250380 () Bool)

(declare-fun res!122635 () Bool)

(assert (=> b!250380 (=> (not res!122635) (not e!162391))))

(assert (=> b!250380 (= res!122635 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!23521 () Bool)

(declare-fun call!23525 () Bool)

(declare-fun arrayContainsKey!0 (array!12297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23521 (= call!23525 (arrayContainsKey!0 (_keys!6764 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250381 () Bool)

(declare-fun e!162386 () Bool)

(declare-fun e!162388 () Bool)

(assert (=> b!250381 (= e!162386 (and e!162388 mapRes!11026))))

(declare-fun condMapEmpty!11026 () Bool)

(declare-fun mapDefault!11026 () ValueCell!2901)

(assert (=> b!250381 (= condMapEmpty!11026 (= (arr!5830 (_values!4611 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2901)) mapDefault!11026)))))

(declare-fun b!250382 () Bool)

(declare-fun e!162387 () Bool)

(declare-fun e!162385 () Bool)

(assert (=> b!250382 (= e!162387 (not e!162385))))

(declare-fun res!122634 () Bool)

(assert (=> b!250382 (=> res!122634 e!162385)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250382 (= res!122634 (not (validMask!0 (mask!10811 thiss!1504))))))

(declare-fun lt!125442 () array!12297)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12297 (_ BitVec 32)) Bool)

(assert (=> b!250382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125442 (mask!10811 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!125437 () Unit!7748)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12297 (_ BitVec 32) (_ BitVec 32)) Unit!7748)

(assert (=> b!250382 (= lt!125437 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) index!297 (mask!10811 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12297 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250382 (= (arrayCountValidKeys!0 lt!125442 #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6764 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504)))))))

(declare-fun lt!125443 () Unit!7748)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12297 (_ BitVec 32) (_ BitVec 64)) Unit!7748)

(assert (=> b!250382 (= lt!125443 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6764 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3722 0))(
  ( (Nil!3719) (Cons!3718 (h!4378 (_ BitVec 64)) (t!8755 List!3722)) )
))
(declare-fun arrayNoDuplicates!0 (array!12297 (_ BitVec 32) List!3722) Bool)

(assert (=> b!250382 (arrayNoDuplicates!0 lt!125442 #b00000000000000000000000000000000 Nil!3719)))

(assert (=> b!250382 (= lt!125442 (array!12298 (store (arr!5831 (_keys!6764 thiss!1504)) index!297 key!932) (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun lt!125445 () Unit!7748)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3722) Unit!7748)

(assert (=> b!250382 (= lt!125445 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6764 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3719))))

(declare-fun lt!125438 () Unit!7748)

(assert (=> b!250382 (= lt!125438 e!162389)))

(declare-fun c!42067 () Bool)

(assert (=> b!250382 (= c!42067 (arrayContainsKey!0 (_keys!6764 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250383 () Bool)

(declare-fun e!162383 () Bool)

(assert (=> b!250383 (= e!162394 e!162383)))

(declare-fun res!122629 () Bool)

(declare-fun call!23524 () Bool)

(assert (=> b!250383 (= res!122629 call!23524)))

(assert (=> b!250383 (=> (not res!122629) (not e!162383))))

(declare-fun b!250384 () Bool)

(declare-fun e!162392 () Bool)

(assert (=> b!250384 (= e!162392 (not call!23525))))

(declare-fun b!250385 () Bool)

(declare-fun e!162384 () Bool)

(assert (=> b!250385 (= e!162391 e!162384)))

(declare-fun res!122627 () Bool)

(assert (=> b!250385 (=> (not res!122627) (not e!162384))))

(assert (=> b!250385 (= res!122627 (or (= lt!125440 (MissingZero!1121 index!297)) (= lt!125440 (MissingVacant!1121 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12297 (_ BitVec 32)) SeekEntryResult!1121)

(assert (=> b!250385 (= lt!125440 (seekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(declare-fun b!250386 () Bool)

(assert (=> b!250386 (= e!162385 (or (not (= (size!6175 (_values!4611 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10811 thiss!1504)))) (not (= (size!6176 (_keys!6764 thiss!1504)) (size!6175 (_values!4611 thiss!1504)))) (bvsge (mask!10811 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250387 () Bool)

(declare-fun lt!125436 () Unit!7748)

(assert (=> b!250387 (= e!162393 lt!125436)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!399 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) Int) Unit!7748)

(assert (=> b!250387 (= lt!125436 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!399 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)))))

(declare-fun c!42066 () Bool)

(assert (=> b!250387 (= c!42066 ((_ is MissingZero!1121) lt!125440))))

(declare-fun e!162381 () Bool)

(assert (=> b!250387 e!162381))

(declare-fun b!250388 () Bool)

(declare-fun tp_is_empty!6489 () Bool)

(assert (=> b!250388 (= e!162388 tp_is_empty!6489)))

(declare-fun b!250389 () Bool)

(assert (=> b!250389 (= e!162383 (not call!23525))))

(declare-fun b!250390 () Bool)

(assert (=> b!250390 (= e!162384 e!162387)))

(declare-fun res!122633 () Bool)

(assert (=> b!250390 (=> (not res!122633) (not e!162387))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250390 (= res!122633 (inRange!0 index!297 (mask!10811 thiss!1504)))))

(declare-fun lt!125441 () Unit!7748)

(assert (=> b!250390 (= lt!125441 e!162393)))

(declare-fun c!42068 () Bool)

(declare-datatypes ((tuple2!4840 0))(
  ( (tuple2!4841 (_1!2431 (_ BitVec 64)) (_2!2431 V!8299)) )
))
(declare-datatypes ((List!3723 0))(
  ( (Nil!3720) (Cons!3719 (h!4379 tuple2!4840) (t!8756 List!3723)) )
))
(declare-datatypes ((ListLongMap!3753 0))(
  ( (ListLongMap!3754 (toList!1892 List!3723)) )
))
(declare-fun contains!1813 (ListLongMap!3753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1420 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 32) Int) ListLongMap!3753)

(assert (=> b!250390 (= c!42068 (contains!1813 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)) key!932))))

(declare-fun b!250391 () Bool)

(declare-fun Unit!7752 () Unit!7748)

(assert (=> b!250391 (= e!162389 Unit!7752)))

(declare-fun lt!125444 () Unit!7748)

(declare-fun lemmaArrayContainsKeyThenInListMap!200 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) (_ BitVec 32) Int) Unit!7748)

(assert (=> b!250391 (= lt!125444 (lemmaArrayContainsKeyThenInListMap!200 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(assert (=> b!250391 false))

(declare-fun b!250392 () Bool)

(declare-fun res!122631 () Bool)

(assert (=> b!250392 (=> (not res!122631) (not e!162392))))

(assert (=> b!250392 (= res!122631 call!23524)))

(assert (=> b!250392 (= e!162381 e!162392)))

(declare-fun b!250393 () Bool)

(assert (=> b!250393 (= e!162382 tp_is_empty!6489)))

(declare-fun b!250394 () Bool)

(declare-fun res!122628 () Bool)

(assert (=> b!250394 (= res!122628 (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6657 lt!125440)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250394 (=> (not res!122628) (not e!162383))))

(declare-fun b!250395 () Bool)

(declare-fun c!42069 () Bool)

(assert (=> b!250395 (= c!42069 ((_ is MissingVacant!1121) lt!125440))))

(assert (=> b!250395 (= e!162381 e!162394)))

(declare-fun b!250396 () Bool)

(declare-fun res!122630 () Bool)

(assert (=> b!250396 (=> (not res!122630) (not e!162392))))

(assert (=> b!250396 (= res!122630 (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6654 lt!125440)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!3847 (array!12297) Bool)

(declare-fun array_inv!3848 (array!12295) Bool)

(assert (=> b!250397 (= e!162390 (and tp!23146 tp_is_empty!6489 (array_inv!3847 (_keys!6764 thiss!1504)) (array_inv!3848 (_values!4611 thiss!1504)) e!162386))))

(declare-fun bm!23522 () Bool)

(assert (=> bm!23522 (= call!23524 (inRange!0 (ite c!42066 (index!6654 lt!125440) (index!6657 lt!125440)) (mask!10811 thiss!1504)))))

(assert (= (and start!23880 res!122632) b!250380))

(assert (= (and b!250380 res!122635) b!250385))

(assert (= (and b!250385 res!122627) b!250390))

(assert (= (and b!250390 c!42068) b!250378))

(assert (= (and b!250390 (not c!42068)) b!250387))

(assert (= (and b!250387 c!42066) b!250392))

(assert (= (and b!250387 (not c!42066)) b!250395))

(assert (= (and b!250392 res!122631) b!250396))

(assert (= (and b!250396 res!122630) b!250384))

(assert (= (and b!250395 c!42069) b!250383))

(assert (= (and b!250395 (not c!42069)) b!250379))

(assert (= (and b!250383 res!122629) b!250394))

(assert (= (and b!250394 res!122628) b!250389))

(assert (= (or b!250392 b!250383) bm!23522))

(assert (= (or b!250384 b!250389) bm!23521))

(assert (= (and b!250390 res!122633) b!250382))

(assert (= (and b!250382 c!42067) b!250391))

(assert (= (and b!250382 (not c!42067)) b!250377))

(assert (= (and b!250382 (not res!122634)) b!250386))

(assert (= (and b!250381 condMapEmpty!11026) mapIsEmpty!11026))

(assert (= (and b!250381 (not condMapEmpty!11026)) mapNonEmpty!11026))

(assert (= (and mapNonEmpty!11026 ((_ is ValueCellFull!2901) mapValue!11026)) b!250393))

(assert (= (and b!250381 ((_ is ValueCellFull!2901) mapDefault!11026)) b!250388))

(assert (= b!250397 b!250381))

(assert (= start!23880 b!250397))

(declare-fun m!266825 () Bool)

(assert (=> b!250391 m!266825))

(declare-fun m!266827 () Bool)

(assert (=> bm!23521 m!266827))

(declare-fun m!266829 () Bool)

(assert (=> b!250397 m!266829))

(declare-fun m!266831 () Bool)

(assert (=> b!250397 m!266831))

(declare-fun m!266833 () Bool)

(assert (=> start!23880 m!266833))

(declare-fun m!266835 () Bool)

(assert (=> b!250394 m!266835))

(declare-fun m!266837 () Bool)

(assert (=> b!250378 m!266837))

(declare-fun m!266839 () Bool)

(assert (=> b!250390 m!266839))

(declare-fun m!266841 () Bool)

(assert (=> b!250390 m!266841))

(assert (=> b!250390 m!266841))

(declare-fun m!266843 () Bool)

(assert (=> b!250390 m!266843))

(declare-fun m!266845 () Bool)

(assert (=> b!250382 m!266845))

(assert (=> b!250382 m!266827))

(declare-fun m!266847 () Bool)

(assert (=> b!250382 m!266847))

(declare-fun m!266849 () Bool)

(assert (=> b!250382 m!266849))

(declare-fun m!266851 () Bool)

(assert (=> b!250382 m!266851))

(declare-fun m!266853 () Bool)

(assert (=> b!250382 m!266853))

(declare-fun m!266855 () Bool)

(assert (=> b!250382 m!266855))

(declare-fun m!266857 () Bool)

(assert (=> b!250382 m!266857))

(declare-fun m!266859 () Bool)

(assert (=> b!250382 m!266859))

(declare-fun m!266861 () Bool)

(assert (=> b!250382 m!266861))

(declare-fun m!266863 () Bool)

(assert (=> b!250385 m!266863))

(declare-fun m!266865 () Bool)

(assert (=> b!250387 m!266865))

(declare-fun m!266867 () Bool)

(assert (=> mapNonEmpty!11026 m!266867))

(declare-fun m!266869 () Bool)

(assert (=> b!250396 m!266869))

(declare-fun m!266871 () Bool)

(assert (=> bm!23522 m!266871))

(check-sat tp_is_empty!6489 (not bm!23522) (not b!250385) (not b!250390) (not b_next!6627) (not mapNonEmpty!11026) (not b!250382) (not b!250387) (not start!23880) (not b!250397) b_and!13647 (not b!250391) (not bm!23521) (not b!250378))
(check-sat b_and!13647 (not b_next!6627))
(get-model)

(declare-fun d!60931 () Bool)

(assert (=> d!60931 (= (inRange!0 (ite c!42066 (index!6654 lt!125440) (index!6657 lt!125440)) (mask!10811 thiss!1504)) (and (bvsge (ite c!42066 (index!6654 lt!125440) (index!6657 lt!125440)) #b00000000000000000000000000000000) (bvslt (ite c!42066 (index!6654 lt!125440) (index!6657 lt!125440)) (bvadd (mask!10811 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23522 d!60931))

(declare-fun b!250469 () Bool)

(declare-fun e!162445 () (_ BitVec 32))

(declare-fun call!23534 () (_ BitVec 32))

(assert (=> b!250469 (= e!162445 (bvadd #b00000000000000000000000000000001 call!23534))))

(declare-fun d!60933 () Bool)

(declare-fun lt!125478 () (_ BitVec 32))

(assert (=> d!60933 (and (bvsge lt!125478 #b00000000000000000000000000000000) (bvsle lt!125478 (bvsub (size!6176 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162446 () (_ BitVec 32))

(assert (=> d!60933 (= lt!125478 e!162446)))

(declare-fun c!42087 () Bool)

(assert (=> d!60933 (= c!42087 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(assert (=> d!60933 (and (bvsle #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6764 thiss!1504)) (size!6176 (_keys!6764 thiss!1504))))))

(assert (=> d!60933 (= (arrayCountValidKeys!0 (_keys!6764 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) lt!125478)))

(declare-fun b!250470 () Bool)

(assert (=> b!250470 (= e!162445 call!23534)))

(declare-fun b!250471 () Bool)

(assert (=> b!250471 (= e!162446 e!162445)))

(declare-fun c!42086 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250471 (= c!42086 (validKeyInArray!0 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23531 () Bool)

(assert (=> bm!23531 (= call!23534 (arrayCountValidKeys!0 (_keys!6764 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun b!250472 () Bool)

(assert (=> b!250472 (= e!162446 #b00000000000000000000000000000000)))

(assert (= (and d!60933 c!42087) b!250472))

(assert (= (and d!60933 (not c!42087)) b!250471))

(assert (= (and b!250471 c!42086) b!250469))

(assert (= (and b!250471 (not c!42086)) b!250470))

(assert (= (or b!250469 b!250470) bm!23531))

(declare-fun m!266921 () Bool)

(assert (=> b!250471 m!266921))

(assert (=> b!250471 m!266921))

(declare-fun m!266923 () Bool)

(assert (=> b!250471 m!266923))

(declare-fun m!266925 () Bool)

(assert (=> bm!23531 m!266925))

(assert (=> b!250382 d!60933))

(declare-fun b!250483 () Bool)

(declare-fun e!162456 () Bool)

(declare-fun e!162458 () Bool)

(assert (=> b!250483 (= e!162456 e!162458)))

(declare-fun c!42090 () Bool)

(assert (=> b!250483 (= c!42090 (validKeyInArray!0 (select (arr!5831 lt!125442) #b00000000000000000000000000000000)))))

(declare-fun d!60935 () Bool)

(declare-fun res!122669 () Bool)

(declare-fun e!162457 () Bool)

(assert (=> d!60935 (=> res!122669 e!162457)))

(assert (=> d!60935 (= res!122669 (bvsge #b00000000000000000000000000000000 (size!6176 lt!125442)))))

(assert (=> d!60935 (= (arrayNoDuplicates!0 lt!125442 #b00000000000000000000000000000000 Nil!3719) e!162457)))

(declare-fun b!250484 () Bool)

(declare-fun call!23537 () Bool)

(assert (=> b!250484 (= e!162458 call!23537)))

(declare-fun b!250485 () Bool)

(declare-fun e!162455 () Bool)

(declare-fun contains!1815 (List!3722 (_ BitVec 64)) Bool)

(assert (=> b!250485 (= e!162455 (contains!1815 Nil!3719 (select (arr!5831 lt!125442) #b00000000000000000000000000000000)))))

(declare-fun bm!23534 () Bool)

(assert (=> bm!23534 (= call!23537 (arrayNoDuplicates!0 lt!125442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42090 (Cons!3718 (select (arr!5831 lt!125442) #b00000000000000000000000000000000) Nil!3719) Nil!3719)))))

(declare-fun b!250486 () Bool)

(assert (=> b!250486 (= e!162458 call!23537)))

(declare-fun b!250487 () Bool)

(assert (=> b!250487 (= e!162457 e!162456)))

(declare-fun res!122671 () Bool)

(assert (=> b!250487 (=> (not res!122671) (not e!162456))))

(assert (=> b!250487 (= res!122671 (not e!162455))))

(declare-fun res!122670 () Bool)

(assert (=> b!250487 (=> (not res!122670) (not e!162455))))

(assert (=> b!250487 (= res!122670 (validKeyInArray!0 (select (arr!5831 lt!125442) #b00000000000000000000000000000000)))))

(assert (= (and d!60935 (not res!122669)) b!250487))

(assert (= (and b!250487 res!122670) b!250485))

(assert (= (and b!250487 res!122671) b!250483))

(assert (= (and b!250483 c!42090) b!250484))

(assert (= (and b!250483 (not c!42090)) b!250486))

(assert (= (or b!250484 b!250486) bm!23534))

(declare-fun m!266927 () Bool)

(assert (=> b!250483 m!266927))

(assert (=> b!250483 m!266927))

(declare-fun m!266929 () Bool)

(assert (=> b!250483 m!266929))

(assert (=> b!250485 m!266927))

(assert (=> b!250485 m!266927))

(declare-fun m!266931 () Bool)

(assert (=> b!250485 m!266931))

(assert (=> bm!23534 m!266927))

(declare-fun m!266933 () Bool)

(assert (=> bm!23534 m!266933))

(assert (=> b!250487 m!266927))

(assert (=> b!250487 m!266927))

(assert (=> b!250487 m!266929))

(assert (=> b!250382 d!60935))

(declare-fun d!60937 () Bool)

(declare-fun e!162461 () Bool)

(assert (=> d!60937 e!162461))

(declare-fun res!122674 () Bool)

(assert (=> d!60937 (=> (not res!122674) (not e!162461))))

(assert (=> d!60937 (= res!122674 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6764 thiss!1504)))))))

(declare-fun lt!125481 () Unit!7748)

(declare-fun choose!41 (array!12297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3722) Unit!7748)

(assert (=> d!60937 (= lt!125481 (choose!41 (_keys!6764 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3719))))

(assert (=> d!60937 (bvslt (size!6176 (_keys!6764 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60937 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6764 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3719) lt!125481)))

(declare-fun b!250490 () Bool)

(assert (=> b!250490 (= e!162461 (arrayNoDuplicates!0 (array!12298 (store (arr!5831 (_keys!6764 thiss!1504)) index!297 key!932) (size!6176 (_keys!6764 thiss!1504))) #b00000000000000000000000000000000 Nil!3719))))

(assert (= (and d!60937 res!122674) b!250490))

(declare-fun m!266935 () Bool)

(assert (=> d!60937 m!266935))

(assert (=> b!250490 m!266857))

(declare-fun m!266937 () Bool)

(assert (=> b!250490 m!266937))

(assert (=> b!250382 d!60937))

(declare-fun b!250499 () Bool)

(declare-fun res!122683 () Bool)

(declare-fun e!162467 () Bool)

(assert (=> b!250499 (=> (not res!122683) (not e!162467))))

(assert (=> b!250499 (= res!122683 (not (validKeyInArray!0 (select (arr!5831 (_keys!6764 thiss!1504)) index!297))))))

(declare-fun b!250502 () Bool)

(declare-fun e!162466 () Bool)

(assert (=> b!250502 (= e!162466 (= (arrayCountValidKeys!0 (array!12298 (store (arr!5831 (_keys!6764 thiss!1504)) index!297 key!932) (size!6176 (_keys!6764 thiss!1504))) #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6764 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!250500 () Bool)

(declare-fun res!122686 () Bool)

(assert (=> b!250500 (=> (not res!122686) (not e!162467))))

(assert (=> b!250500 (= res!122686 (validKeyInArray!0 key!932))))

(declare-fun d!60939 () Bool)

(assert (=> d!60939 e!162466))

(declare-fun res!122685 () Bool)

(assert (=> d!60939 (=> (not res!122685) (not e!162466))))

(assert (=> d!60939 (= res!122685 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6764 thiss!1504)))))))

(declare-fun lt!125484 () Unit!7748)

(declare-fun choose!1 (array!12297 (_ BitVec 32) (_ BitVec 64)) Unit!7748)

(assert (=> d!60939 (= lt!125484 (choose!1 (_keys!6764 thiss!1504) index!297 key!932))))

(assert (=> d!60939 e!162467))

(declare-fun res!122684 () Bool)

(assert (=> d!60939 (=> (not res!122684) (not e!162467))))

(assert (=> d!60939 (= res!122684 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6764 thiss!1504)))))))

(assert (=> d!60939 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6764 thiss!1504) index!297 key!932) lt!125484)))

(declare-fun b!250501 () Bool)

(assert (=> b!250501 (= e!162467 (bvslt (size!6176 (_keys!6764 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60939 res!122684) b!250499))

(assert (= (and b!250499 res!122683) b!250500))

(assert (= (and b!250500 res!122686) b!250501))

(assert (= (and d!60939 res!122685) b!250502))

(declare-fun m!266939 () Bool)

(assert (=> b!250499 m!266939))

(assert (=> b!250499 m!266939))

(declare-fun m!266941 () Bool)

(assert (=> b!250499 m!266941))

(assert (=> b!250502 m!266857))

(declare-fun m!266943 () Bool)

(assert (=> b!250502 m!266943))

(assert (=> b!250502 m!266859))

(declare-fun m!266945 () Bool)

(assert (=> b!250500 m!266945))

(declare-fun m!266947 () Bool)

(assert (=> d!60939 m!266947))

(assert (=> b!250382 d!60939))

(declare-fun b!250503 () Bool)

(declare-fun e!162468 () (_ BitVec 32))

(declare-fun call!23538 () (_ BitVec 32))

(assert (=> b!250503 (= e!162468 (bvadd #b00000000000000000000000000000001 call!23538))))

(declare-fun d!60941 () Bool)

(declare-fun lt!125485 () (_ BitVec 32))

(assert (=> d!60941 (and (bvsge lt!125485 #b00000000000000000000000000000000) (bvsle lt!125485 (bvsub (size!6176 lt!125442) #b00000000000000000000000000000000)))))

(declare-fun e!162469 () (_ BitVec 32))

(assert (=> d!60941 (= lt!125485 e!162469)))

(declare-fun c!42092 () Bool)

(assert (=> d!60941 (= c!42092 (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(assert (=> d!60941 (and (bvsle #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6176 (_keys!6764 thiss!1504)) (size!6176 lt!125442)))))

(assert (=> d!60941 (= (arrayCountValidKeys!0 lt!125442 #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) lt!125485)))

(declare-fun b!250504 () Bool)

(assert (=> b!250504 (= e!162468 call!23538)))

(declare-fun b!250505 () Bool)

(assert (=> b!250505 (= e!162469 e!162468)))

(declare-fun c!42091 () Bool)

(assert (=> b!250505 (= c!42091 (validKeyInArray!0 (select (arr!5831 lt!125442) #b00000000000000000000000000000000)))))

(declare-fun bm!23535 () Bool)

(assert (=> bm!23535 (= call!23538 (arrayCountValidKeys!0 lt!125442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun b!250506 () Bool)

(assert (=> b!250506 (= e!162469 #b00000000000000000000000000000000)))

(assert (= (and d!60941 c!42092) b!250506))

(assert (= (and d!60941 (not c!42092)) b!250505))

(assert (= (and b!250505 c!42091) b!250503))

(assert (= (and b!250505 (not c!42091)) b!250504))

(assert (= (or b!250503 b!250504) bm!23535))

(assert (=> b!250505 m!266927))

(assert (=> b!250505 m!266927))

(assert (=> b!250505 m!266929))

(declare-fun m!266949 () Bool)

(assert (=> bm!23535 m!266949))

(assert (=> b!250382 d!60941))

(declare-fun d!60943 () Bool)

(declare-fun res!122691 () Bool)

(declare-fun e!162474 () Bool)

(assert (=> d!60943 (=> res!122691 e!162474)))

(assert (=> d!60943 (= res!122691 (= (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60943 (= (arrayContainsKey!0 (_keys!6764 thiss!1504) key!932 #b00000000000000000000000000000000) e!162474)))

(declare-fun b!250511 () Bool)

(declare-fun e!162475 () Bool)

(assert (=> b!250511 (= e!162474 e!162475)))

(declare-fun res!122692 () Bool)

(assert (=> b!250511 (=> (not res!122692) (not e!162475))))

(assert (=> b!250511 (= res!122692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun b!250512 () Bool)

(assert (=> b!250512 (= e!162475 (arrayContainsKey!0 (_keys!6764 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60943 (not res!122691)) b!250511))

(assert (= (and b!250511 res!122692) b!250512))

(assert (=> d!60943 m!266921))

(declare-fun m!266951 () Bool)

(assert (=> b!250512 m!266951))

(assert (=> b!250382 d!60943))

(declare-fun d!60945 () Bool)

(declare-fun e!162478 () Bool)

(assert (=> d!60945 e!162478))

(declare-fun res!122695 () Bool)

(assert (=> d!60945 (=> (not res!122695) (not e!162478))))

(assert (=> d!60945 (= res!122695 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6176 (_keys!6764 thiss!1504)))))))

(declare-fun lt!125488 () Unit!7748)

(declare-fun choose!102 ((_ BitVec 64) array!12297 (_ BitVec 32) (_ BitVec 32)) Unit!7748)

(assert (=> d!60945 (= lt!125488 (choose!102 key!932 (_keys!6764 thiss!1504) index!297 (mask!10811 thiss!1504)))))

(assert (=> d!60945 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60945 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) index!297 (mask!10811 thiss!1504)) lt!125488)))

(declare-fun b!250515 () Bool)

(assert (=> b!250515 (= e!162478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12298 (store (arr!5831 (_keys!6764 thiss!1504)) index!297 key!932) (size!6176 (_keys!6764 thiss!1504))) (mask!10811 thiss!1504)))))

(assert (= (and d!60945 res!122695) b!250515))

(declare-fun m!266953 () Bool)

(assert (=> d!60945 m!266953))

(assert (=> d!60945 m!266845))

(assert (=> b!250515 m!266857))

(declare-fun m!266955 () Bool)

(assert (=> b!250515 m!266955))

(assert (=> b!250382 d!60945))

(declare-fun d!60947 () Bool)

(assert (=> d!60947 (= (validMask!0 (mask!10811 thiss!1504)) (and (or (= (mask!10811 thiss!1504) #b00000000000000000000000000000111) (= (mask!10811 thiss!1504) #b00000000000000000000000000001111) (= (mask!10811 thiss!1504) #b00000000000000000000000000011111) (= (mask!10811 thiss!1504) #b00000000000000000000000000111111) (= (mask!10811 thiss!1504) #b00000000000000000000000001111111) (= (mask!10811 thiss!1504) #b00000000000000000000000011111111) (= (mask!10811 thiss!1504) #b00000000000000000000000111111111) (= (mask!10811 thiss!1504) #b00000000000000000000001111111111) (= (mask!10811 thiss!1504) #b00000000000000000000011111111111) (= (mask!10811 thiss!1504) #b00000000000000000000111111111111) (= (mask!10811 thiss!1504) #b00000000000000000001111111111111) (= (mask!10811 thiss!1504) #b00000000000000000011111111111111) (= (mask!10811 thiss!1504) #b00000000000000000111111111111111) (= (mask!10811 thiss!1504) #b00000000000000001111111111111111) (= (mask!10811 thiss!1504) #b00000000000000011111111111111111) (= (mask!10811 thiss!1504) #b00000000000000111111111111111111) (= (mask!10811 thiss!1504) #b00000000000001111111111111111111) (= (mask!10811 thiss!1504) #b00000000000011111111111111111111) (= (mask!10811 thiss!1504) #b00000000000111111111111111111111) (= (mask!10811 thiss!1504) #b00000000001111111111111111111111) (= (mask!10811 thiss!1504) #b00000000011111111111111111111111) (= (mask!10811 thiss!1504) #b00000000111111111111111111111111) (= (mask!10811 thiss!1504) #b00000001111111111111111111111111) (= (mask!10811 thiss!1504) #b00000011111111111111111111111111) (= (mask!10811 thiss!1504) #b00000111111111111111111111111111) (= (mask!10811 thiss!1504) #b00001111111111111111111111111111) (= (mask!10811 thiss!1504) #b00011111111111111111111111111111) (= (mask!10811 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10811 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250382 d!60947))

(declare-fun b!250524 () Bool)

(declare-fun e!162487 () Bool)

(declare-fun call!23541 () Bool)

(assert (=> b!250524 (= e!162487 call!23541)))

(declare-fun b!250525 () Bool)

(declare-fun e!162486 () Bool)

(assert (=> b!250525 (= e!162486 e!162487)))

(declare-fun c!42095 () Bool)

(assert (=> b!250525 (= c!42095 (validKeyInArray!0 (select (arr!5831 lt!125442) #b00000000000000000000000000000000)))))

(declare-fun bm!23538 () Bool)

(assert (=> bm!23538 (= call!23541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125442 (mask!10811 thiss!1504)))))

(declare-fun b!250526 () Bool)

(declare-fun e!162485 () Bool)

(assert (=> b!250526 (= e!162487 e!162485)))

(declare-fun lt!125496 () (_ BitVec 64))

(assert (=> b!250526 (= lt!125496 (select (arr!5831 lt!125442) #b00000000000000000000000000000000))))

(declare-fun lt!125495 () Unit!7748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12297 (_ BitVec 64) (_ BitVec 32)) Unit!7748)

(assert (=> b!250526 (= lt!125495 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125442 lt!125496 #b00000000000000000000000000000000))))

(assert (=> b!250526 (arrayContainsKey!0 lt!125442 lt!125496 #b00000000000000000000000000000000)))

(declare-fun lt!125497 () Unit!7748)

(assert (=> b!250526 (= lt!125497 lt!125495)))

(declare-fun res!122701 () Bool)

(assert (=> b!250526 (= res!122701 (= (seekEntryOrOpen!0 (select (arr!5831 lt!125442) #b00000000000000000000000000000000) lt!125442 (mask!10811 thiss!1504)) (Found!1121 #b00000000000000000000000000000000)))))

(assert (=> b!250526 (=> (not res!122701) (not e!162485))))

(declare-fun b!250527 () Bool)

(assert (=> b!250527 (= e!162485 call!23541)))

(declare-fun d!60949 () Bool)

(declare-fun res!122700 () Bool)

(assert (=> d!60949 (=> res!122700 e!162486)))

(assert (=> d!60949 (= res!122700 (bvsge #b00000000000000000000000000000000 (size!6176 lt!125442)))))

(assert (=> d!60949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125442 (mask!10811 thiss!1504)) e!162486)))

(assert (= (and d!60949 (not res!122700)) b!250525))

(assert (= (and b!250525 c!42095) b!250526))

(assert (= (and b!250525 (not c!42095)) b!250524))

(assert (= (and b!250526 res!122701) b!250527))

(assert (= (or b!250527 b!250524) bm!23538))

(assert (=> b!250525 m!266927))

(assert (=> b!250525 m!266927))

(assert (=> b!250525 m!266929))

(declare-fun m!266957 () Bool)

(assert (=> bm!23538 m!266957))

(assert (=> b!250526 m!266927))

(declare-fun m!266959 () Bool)

(assert (=> b!250526 m!266959))

(declare-fun m!266961 () Bool)

(assert (=> b!250526 m!266961))

(assert (=> b!250526 m!266927))

(declare-fun m!266963 () Bool)

(assert (=> b!250526 m!266963))

(assert (=> b!250382 d!60949))

(declare-fun d!60951 () Bool)

(declare-fun e!162490 () Bool)

(assert (=> d!60951 e!162490))

(declare-fun res!122707 () Bool)

(assert (=> d!60951 (=> (not res!122707) (not e!162490))))

(declare-fun lt!125502 () SeekEntryResult!1121)

(assert (=> d!60951 (= res!122707 ((_ is Found!1121) lt!125502))))

(assert (=> d!60951 (= lt!125502 (seekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(declare-fun lt!125503 () Unit!7748)

(declare-fun choose!1185 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) Int) Unit!7748)

(assert (=> d!60951 (= lt!125503 (choose!1185 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)))))

(assert (=> d!60951 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60951 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!398 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)) lt!125503)))

(declare-fun b!250532 () Bool)

(declare-fun res!122706 () Bool)

(assert (=> b!250532 (=> (not res!122706) (not e!162490))))

(assert (=> b!250532 (= res!122706 (inRange!0 (index!6655 lt!125502) (mask!10811 thiss!1504)))))

(declare-fun b!250533 () Bool)

(assert (=> b!250533 (= e!162490 (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6655 lt!125502)) key!932))))

(assert (=> b!250533 (and (bvsge (index!6655 lt!125502) #b00000000000000000000000000000000) (bvslt (index!6655 lt!125502) (size!6176 (_keys!6764 thiss!1504))))))

(assert (= (and d!60951 res!122707) b!250532))

(assert (= (and b!250532 res!122706) b!250533))

(assert (=> d!60951 m!266863))

(declare-fun m!266965 () Bool)

(assert (=> d!60951 m!266965))

(assert (=> d!60951 m!266845))

(declare-fun m!266967 () Bool)

(assert (=> b!250532 m!266967))

(declare-fun m!266969 () Bool)

(assert (=> b!250533 m!266969))

(assert (=> b!250378 d!60951))

(declare-fun b!250550 () Bool)

(declare-fun e!162500 () Bool)

(declare-fun call!23547 () Bool)

(assert (=> b!250550 (= e!162500 (not call!23547))))

(declare-fun b!250551 () Bool)

(declare-fun e!162502 () Bool)

(declare-fun lt!125509 () SeekEntryResult!1121)

(assert (=> b!250551 (= e!162502 ((_ is Undefined!1121) lt!125509))))

(declare-fun b!250552 () Bool)

(declare-fun res!122716 () Bool)

(assert (=> b!250552 (=> (not res!122716) (not e!162500))))

(declare-fun call!23546 () Bool)

(assert (=> b!250552 (= res!122716 call!23546)))

(assert (=> b!250552 (= e!162502 e!162500)))

(declare-fun b!250553 () Bool)

(declare-fun e!162501 () Bool)

(declare-fun e!162499 () Bool)

(assert (=> b!250553 (= e!162501 e!162499)))

(declare-fun res!122718 () Bool)

(assert (=> b!250553 (= res!122718 call!23546)))

(assert (=> b!250553 (=> (not res!122718) (not e!162499))))

(declare-fun bm!23543 () Bool)

(assert (=> bm!23543 (= call!23547 (arrayContainsKey!0 (_keys!6764 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250554 () Bool)

(assert (=> b!250554 (= e!162501 e!162502)))

(declare-fun c!42100 () Bool)

(assert (=> b!250554 (= c!42100 ((_ is MissingVacant!1121) lt!125509))))

(declare-fun d!60953 () Bool)

(assert (=> d!60953 e!162501))

(declare-fun c!42101 () Bool)

(assert (=> d!60953 (= c!42101 ((_ is MissingZero!1121) lt!125509))))

(assert (=> d!60953 (= lt!125509 (seekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(declare-fun lt!125508 () Unit!7748)

(declare-fun choose!1186 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) Int) Unit!7748)

(assert (=> d!60953 (= lt!125508 (choose!1186 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)))))

(assert (=> d!60953 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60953 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!399 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 (defaultEntry!4628 thiss!1504)) lt!125508)))

(declare-fun b!250555 () Bool)

(assert (=> b!250555 (and (bvsge (index!6654 lt!125509) #b00000000000000000000000000000000) (bvslt (index!6654 lt!125509) (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun res!122719 () Bool)

(assert (=> b!250555 (= res!122719 (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6654 lt!125509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250555 (=> (not res!122719) (not e!162499))))

(declare-fun bm!23544 () Bool)

(assert (=> bm!23544 (= call!23546 (inRange!0 (ite c!42101 (index!6654 lt!125509) (index!6657 lt!125509)) (mask!10811 thiss!1504)))))

(declare-fun b!250556 () Bool)

(assert (=> b!250556 (= e!162499 (not call!23547))))

(declare-fun b!250557 () Bool)

(declare-fun res!122717 () Bool)

(assert (=> b!250557 (=> (not res!122717) (not e!162500))))

(assert (=> b!250557 (= res!122717 (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6657 lt!125509)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250557 (and (bvsge (index!6657 lt!125509) #b00000000000000000000000000000000) (bvslt (index!6657 lt!125509) (size!6176 (_keys!6764 thiss!1504))))))

(assert (= (and d!60953 c!42101) b!250553))

(assert (= (and d!60953 (not c!42101)) b!250554))

(assert (= (and b!250553 res!122718) b!250555))

(assert (= (and b!250555 res!122719) b!250556))

(assert (= (and b!250554 c!42100) b!250552))

(assert (= (and b!250554 (not c!42100)) b!250551))

(assert (= (and b!250552 res!122716) b!250557))

(assert (= (and b!250557 res!122717) b!250550))

(assert (= (or b!250553 b!250552) bm!23544))

(assert (= (or b!250556 b!250550) bm!23543))

(declare-fun m!266971 () Bool)

(assert (=> bm!23544 m!266971))

(declare-fun m!266973 () Bool)

(assert (=> b!250555 m!266973))

(declare-fun m!266975 () Bool)

(assert (=> b!250557 m!266975))

(assert (=> d!60953 m!266863))

(declare-fun m!266977 () Bool)

(assert (=> d!60953 m!266977))

(assert (=> d!60953 m!266845))

(assert (=> bm!23543 m!266827))

(assert (=> b!250387 d!60953))

(declare-fun d!60955 () Bool)

(assert (=> d!60955 (= (array_inv!3847 (_keys!6764 thiss!1504)) (bvsge (size!6176 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250397 d!60955))

(declare-fun d!60957 () Bool)

(assert (=> d!60957 (= (array_inv!3848 (_values!4611 thiss!1504)) (bvsge (size!6175 (_values!4611 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250397 d!60957))

(assert (=> bm!23521 d!60943))

(declare-fun d!60959 () Bool)

(assert (=> d!60959 (contains!1813 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)) key!932)))

(declare-fun lt!125512 () Unit!7748)

(declare-fun choose!1187 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 64) (_ BitVec 32) Int) Unit!7748)

(assert (=> d!60959 (= lt!125512 (choose!1187 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(assert (=> d!60959 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60959 (= (lemmaArrayContainsKeyThenInListMap!200 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)) lt!125512)))

(declare-fun bs!8983 () Bool)

(assert (= bs!8983 d!60959))

(assert (=> bs!8983 m!266841))

(assert (=> bs!8983 m!266841))

(assert (=> bs!8983 m!266843))

(declare-fun m!266979 () Bool)

(assert (=> bs!8983 m!266979))

(assert (=> bs!8983 m!266845))

(assert (=> b!250391 d!60959))

(declare-fun d!60961 () Bool)

(assert (=> d!60961 (= (inRange!0 index!297 (mask!10811 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10811 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250390 d!60961))

(declare-fun d!60963 () Bool)

(declare-fun e!162508 () Bool)

(assert (=> d!60963 e!162508))

(declare-fun res!122722 () Bool)

(assert (=> d!60963 (=> res!122722 e!162508)))

(declare-fun lt!125522 () Bool)

(assert (=> d!60963 (= res!122722 (not lt!125522))))

(declare-fun lt!125521 () Bool)

(assert (=> d!60963 (= lt!125522 lt!125521)))

(declare-fun lt!125524 () Unit!7748)

(declare-fun e!162507 () Unit!7748)

(assert (=> d!60963 (= lt!125524 e!162507)))

(declare-fun c!42104 () Bool)

(assert (=> d!60963 (= c!42104 lt!125521)))

(declare-fun containsKey!290 (List!3723 (_ BitVec 64)) Bool)

(assert (=> d!60963 (= lt!125521 (containsKey!290 (toList!1892 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504))) key!932))))

(assert (=> d!60963 (= (contains!1813 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)) key!932) lt!125522)))

(declare-fun b!250564 () Bool)

(declare-fun lt!125523 () Unit!7748)

(assert (=> b!250564 (= e!162507 lt!125523)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!238 (List!3723 (_ BitVec 64)) Unit!7748)

(assert (=> b!250564 (= lt!125523 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1892 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504))) key!932))))

(declare-datatypes ((Option!304 0))(
  ( (Some!303 (v!5356 V!8299)) (None!302) )
))
(declare-fun isDefined!239 (Option!304) Bool)

(declare-fun getValueByKey!298 (List!3723 (_ BitVec 64)) Option!304)

(assert (=> b!250564 (isDefined!239 (getValueByKey!298 (toList!1892 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504))) key!932))))

(declare-fun b!250565 () Bool)

(declare-fun Unit!7755 () Unit!7748)

(assert (=> b!250565 (= e!162507 Unit!7755)))

(declare-fun b!250566 () Bool)

(assert (=> b!250566 (= e!162508 (isDefined!239 (getValueByKey!298 (toList!1892 (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504))) key!932)))))

(assert (= (and d!60963 c!42104) b!250564))

(assert (= (and d!60963 (not c!42104)) b!250565))

(assert (= (and d!60963 (not res!122722)) b!250566))

(declare-fun m!266981 () Bool)

(assert (=> d!60963 m!266981))

(declare-fun m!266983 () Bool)

(assert (=> b!250564 m!266983))

(declare-fun m!266985 () Bool)

(assert (=> b!250564 m!266985))

(assert (=> b!250564 m!266985))

(declare-fun m!266987 () Bool)

(assert (=> b!250564 m!266987))

(assert (=> b!250566 m!266985))

(assert (=> b!250566 m!266985))

(assert (=> b!250566 m!266987))

(assert (=> b!250390 d!60963))

(declare-fun b!250609 () Bool)

(declare-fun e!162542 () Bool)

(assert (=> b!250609 (= e!162542 (validKeyInArray!0 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250610 () Bool)

(declare-fun e!162539 () Bool)

(declare-fun lt!125572 () ListLongMap!3753)

(declare-fun apply!240 (ListLongMap!3753 (_ BitVec 64)) V!8299)

(assert (=> b!250610 (= e!162539 (= (apply!240 lt!125572 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4469 thiss!1504)))))

(declare-fun b!250611 () Bool)

(declare-fun res!122744 () Bool)

(declare-fun e!162540 () Bool)

(assert (=> b!250611 (=> (not res!122744) (not e!162540))))

(declare-fun e!162538 () Bool)

(assert (=> b!250611 (= res!122744 e!162538)))

(declare-fun c!42120 () Bool)

(assert (=> b!250611 (= c!42120 (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23559 () Bool)

(declare-fun call!23563 () ListLongMap!3753)

(declare-fun call!23567 () ListLongMap!3753)

(assert (=> bm!23559 (= call!23563 call!23567)))

(declare-fun b!250612 () Bool)

(declare-fun e!162536 () ListLongMap!3753)

(declare-fun call!23565 () ListLongMap!3753)

(assert (=> b!250612 (= e!162536 call!23565)))

(declare-fun bm!23560 () Bool)

(declare-fun call!23564 () Bool)

(assert (=> bm!23560 (= call!23564 (contains!1813 lt!125572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250613 () Bool)

(declare-fun e!162535 () Unit!7748)

(declare-fun lt!125583 () Unit!7748)

(assert (=> b!250613 (= e!162535 lt!125583)))

(declare-fun lt!125575 () ListLongMap!3753)

(declare-fun getCurrentListMapNoExtraKeys!562 (array!12297 array!12295 (_ BitVec 32) (_ BitVec 32) V!8299 V!8299 (_ BitVec 32) Int) ListLongMap!3753)

(assert (=> b!250613 (= lt!125575 (getCurrentListMapNoExtraKeys!562 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(declare-fun lt!125576 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125580 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125580 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125577 () Unit!7748)

(declare-fun addStillContains!216 (ListLongMap!3753 (_ BitVec 64) V!8299 (_ BitVec 64)) Unit!7748)

(assert (=> b!250613 (= lt!125577 (addStillContains!216 lt!125575 lt!125576 (zeroValue!4469 thiss!1504) lt!125580))))

(declare-fun +!667 (ListLongMap!3753 tuple2!4840) ListLongMap!3753)

(assert (=> b!250613 (contains!1813 (+!667 lt!125575 (tuple2!4841 lt!125576 (zeroValue!4469 thiss!1504))) lt!125580)))

(declare-fun lt!125569 () Unit!7748)

(assert (=> b!250613 (= lt!125569 lt!125577)))

(declare-fun lt!125584 () ListLongMap!3753)

(assert (=> b!250613 (= lt!125584 (getCurrentListMapNoExtraKeys!562 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(declare-fun lt!125570 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125582 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125582 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125587 () Unit!7748)

(declare-fun addApplyDifferent!216 (ListLongMap!3753 (_ BitVec 64) V!8299 (_ BitVec 64)) Unit!7748)

(assert (=> b!250613 (= lt!125587 (addApplyDifferent!216 lt!125584 lt!125570 (minValue!4469 thiss!1504) lt!125582))))

(assert (=> b!250613 (= (apply!240 (+!667 lt!125584 (tuple2!4841 lt!125570 (minValue!4469 thiss!1504))) lt!125582) (apply!240 lt!125584 lt!125582))))

(declare-fun lt!125588 () Unit!7748)

(assert (=> b!250613 (= lt!125588 lt!125587)))

(declare-fun lt!125590 () ListLongMap!3753)

(assert (=> b!250613 (= lt!125590 (getCurrentListMapNoExtraKeys!562 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(declare-fun lt!125574 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125578 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125578 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125579 () Unit!7748)

(assert (=> b!250613 (= lt!125579 (addApplyDifferent!216 lt!125590 lt!125574 (zeroValue!4469 thiss!1504) lt!125578))))

(assert (=> b!250613 (= (apply!240 (+!667 lt!125590 (tuple2!4841 lt!125574 (zeroValue!4469 thiss!1504))) lt!125578) (apply!240 lt!125590 lt!125578))))

(declare-fun lt!125571 () Unit!7748)

(assert (=> b!250613 (= lt!125571 lt!125579)))

(declare-fun lt!125589 () ListLongMap!3753)

(assert (=> b!250613 (= lt!125589 (getCurrentListMapNoExtraKeys!562 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(declare-fun lt!125573 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125581 () (_ BitVec 64))

(assert (=> b!250613 (= lt!125581 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250613 (= lt!125583 (addApplyDifferent!216 lt!125589 lt!125573 (minValue!4469 thiss!1504) lt!125581))))

(assert (=> b!250613 (= (apply!240 (+!667 lt!125589 (tuple2!4841 lt!125573 (minValue!4469 thiss!1504))) lt!125581) (apply!240 lt!125589 lt!125581))))

(declare-fun b!250614 () Bool)

(declare-fun call!23568 () Bool)

(assert (=> b!250614 (= e!162538 (not call!23568))))

(declare-fun b!250615 () Bool)

(declare-fun e!162544 () Bool)

(assert (=> b!250615 (= e!162544 (not call!23564))))

(declare-fun bm!23561 () Bool)

(declare-fun call!23566 () ListLongMap!3753)

(assert (=> bm!23561 (= call!23566 call!23563)))

(declare-fun c!42118 () Bool)

(declare-fun bm!23562 () Bool)

(declare-fun call!23562 () ListLongMap!3753)

(declare-fun c!42122 () Bool)

(assert (=> bm!23562 (= call!23562 (+!667 (ite c!42122 call!23567 (ite c!42118 call!23563 call!23566)) (ite (or c!42122 c!42118) (tuple2!4841 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4469 thiss!1504)) (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4469 thiss!1504)))))))

(declare-fun b!250616 () Bool)

(declare-fun e!162541 () Bool)

(assert (=> b!250616 (= e!162541 (validKeyInArray!0 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250617 () Bool)

(declare-fun e!162543 () ListLongMap!3753)

(assert (=> b!250617 (= e!162543 call!23566)))

(declare-fun b!250618 () Bool)

(declare-fun e!162545 () Bool)

(declare-fun e!162537 () Bool)

(assert (=> b!250618 (= e!162545 e!162537)))

(declare-fun res!122747 () Bool)

(assert (=> b!250618 (=> (not res!122747) (not e!162537))))

(assert (=> b!250618 (= res!122747 (contains!1813 lt!125572 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun b!250619 () Bool)

(declare-fun e!162546 () ListLongMap!3753)

(assert (=> b!250619 (= e!162546 (+!667 call!23562 (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4469 thiss!1504))))))

(declare-fun b!250620 () Bool)

(assert (=> b!250620 (= e!162538 e!162539)))

(declare-fun res!122749 () Bool)

(assert (=> b!250620 (= res!122749 call!23568)))

(assert (=> b!250620 (=> (not res!122749) (not e!162539))))

(declare-fun b!250621 () Bool)

(declare-fun get!2997 (ValueCell!2901 V!8299) V!8299)

(declare-fun dynLambda!583 (Int (_ BitVec 64)) V!8299)

(assert (=> b!250621 (= e!162537 (= (apply!240 lt!125572 (select (arr!5831 (_keys!6764 thiss!1504)) #b00000000000000000000000000000000)) (get!2997 (select (arr!5830 (_values!4611 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!583 (defaultEntry!4628 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6175 (_values!4611 thiss!1504))))))

(assert (=> b!250621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun d!60965 () Bool)

(assert (=> d!60965 e!162540))

(declare-fun res!122742 () Bool)

(assert (=> d!60965 (=> (not res!122742) (not e!162540))))

(assert (=> d!60965 (= res!122742 (or (bvsge #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))))

(declare-fun lt!125585 () ListLongMap!3753)

(assert (=> d!60965 (= lt!125572 lt!125585)))

(declare-fun lt!125586 () Unit!7748)

(assert (=> d!60965 (= lt!125586 e!162535)))

(declare-fun c!42119 () Bool)

(assert (=> d!60965 (= c!42119 e!162542)))

(declare-fun res!122745 () Bool)

(assert (=> d!60965 (=> (not res!122745) (not e!162542))))

(assert (=> d!60965 (= res!122745 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(assert (=> d!60965 (= lt!125585 e!162546)))

(assert (=> d!60965 (= c!42122 (and (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60965 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60965 (= (getCurrentListMap!1420 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)) lt!125572)))

(declare-fun b!250622 () Bool)

(declare-fun Unit!7756 () Unit!7748)

(assert (=> b!250622 (= e!162535 Unit!7756)))

(declare-fun bm!23563 () Bool)

(assert (=> bm!23563 (= call!23567 (getCurrentListMapNoExtraKeys!562 (_keys!6764 thiss!1504) (_values!4611 thiss!1504) (mask!10811 thiss!1504) (extraKeys!4365 thiss!1504) (zeroValue!4469 thiss!1504) (minValue!4469 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4628 thiss!1504)))))

(declare-fun b!250623 () Bool)

(declare-fun c!42121 () Bool)

(assert (=> b!250623 (= c!42121 (and (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!250623 (= e!162536 e!162543)))

(declare-fun b!250624 () Bool)

(declare-fun res!122743 () Bool)

(assert (=> b!250624 (=> (not res!122743) (not e!162540))))

(assert (=> b!250624 (= res!122743 e!162545)))

(declare-fun res!122746 () Bool)

(assert (=> b!250624 (=> res!122746 e!162545)))

(assert (=> b!250624 (= res!122746 (not e!162541))))

(declare-fun res!122748 () Bool)

(assert (=> b!250624 (=> (not res!122748) (not e!162541))))

(assert (=> b!250624 (= res!122748 (bvslt #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))))))

(declare-fun b!250625 () Bool)

(declare-fun e!162547 () Bool)

(assert (=> b!250625 (= e!162544 e!162547)))

(declare-fun res!122741 () Bool)

(assert (=> b!250625 (= res!122741 call!23564)))

(assert (=> b!250625 (=> (not res!122741) (not e!162547))))

(declare-fun bm!23564 () Bool)

(assert (=> bm!23564 (= call!23568 (contains!1813 lt!125572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23565 () Bool)

(assert (=> bm!23565 (= call!23565 call!23562)))

(declare-fun b!250626 () Bool)

(assert (=> b!250626 (= e!162543 call!23565)))

(declare-fun b!250627 () Bool)

(assert (=> b!250627 (= e!162546 e!162536)))

(assert (=> b!250627 (= c!42118 (and (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250628 () Bool)

(assert (=> b!250628 (= e!162540 e!162544)))

(declare-fun c!42117 () Bool)

(assert (=> b!250628 (= c!42117 (not (= (bvand (extraKeys!4365 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250629 () Bool)

(assert (=> b!250629 (= e!162547 (= (apply!240 lt!125572 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4469 thiss!1504)))))

(assert (= (and d!60965 c!42122) b!250619))

(assert (= (and d!60965 (not c!42122)) b!250627))

(assert (= (and b!250627 c!42118) b!250612))

(assert (= (and b!250627 (not c!42118)) b!250623))

(assert (= (and b!250623 c!42121) b!250626))

(assert (= (and b!250623 (not c!42121)) b!250617))

(assert (= (or b!250626 b!250617) bm!23561))

(assert (= (or b!250612 bm!23561) bm!23559))

(assert (= (or b!250612 b!250626) bm!23565))

(assert (= (or b!250619 bm!23559) bm!23563))

(assert (= (or b!250619 bm!23565) bm!23562))

(assert (= (and d!60965 res!122745) b!250609))

(assert (= (and d!60965 c!42119) b!250613))

(assert (= (and d!60965 (not c!42119)) b!250622))

(assert (= (and d!60965 res!122742) b!250624))

(assert (= (and b!250624 res!122748) b!250616))

(assert (= (and b!250624 (not res!122746)) b!250618))

(assert (= (and b!250618 res!122747) b!250621))

(assert (= (and b!250624 res!122743) b!250611))

(assert (= (and b!250611 c!42120) b!250620))

(assert (= (and b!250611 (not c!42120)) b!250614))

(assert (= (and b!250620 res!122749) b!250610))

(assert (= (or b!250620 b!250614) bm!23564))

(assert (= (and b!250611 res!122744) b!250628))

(assert (= (and b!250628 c!42117) b!250625))

(assert (= (and b!250628 (not c!42117)) b!250615))

(assert (= (and b!250625 res!122741) b!250629))

(assert (= (or b!250625 b!250615) bm!23560))

(declare-fun b_lambda!8087 () Bool)

(assert (=> (not b_lambda!8087) (not b!250621)))

(declare-fun t!8759 () Bool)

(declare-fun tb!2993 () Bool)

(assert (=> (and b!250397 (= (defaultEntry!4628 thiss!1504) (defaultEntry!4628 thiss!1504)) t!8759) tb!2993))

(declare-fun result!5301 () Bool)

(assert (=> tb!2993 (= result!5301 tp_is_empty!6489)))

(assert (=> b!250621 t!8759))

(declare-fun b_and!13651 () Bool)

(assert (= b_and!13647 (and (=> t!8759 result!5301) b_and!13651)))

(assert (=> b!250609 m!266921))

(assert (=> b!250609 m!266921))

(assert (=> b!250609 m!266923))

(declare-fun m!266989 () Bool)

(assert (=> bm!23563 m!266989))

(declare-fun m!266991 () Bool)

(assert (=> b!250610 m!266991))

(declare-fun m!266993 () Bool)

(assert (=> b!250619 m!266993))

(declare-fun m!266995 () Bool)

(assert (=> bm!23564 m!266995))

(assert (=> d!60965 m!266845))

(declare-fun m!266997 () Bool)

(assert (=> b!250629 m!266997))

(assert (=> b!250618 m!266921))

(assert (=> b!250618 m!266921))

(declare-fun m!266999 () Bool)

(assert (=> b!250618 m!266999))

(declare-fun m!267001 () Bool)

(assert (=> b!250613 m!267001))

(declare-fun m!267003 () Bool)

(assert (=> b!250613 m!267003))

(declare-fun m!267005 () Bool)

(assert (=> b!250613 m!267005))

(declare-fun m!267007 () Bool)

(assert (=> b!250613 m!267007))

(assert (=> b!250613 m!266921))

(declare-fun m!267009 () Bool)

(assert (=> b!250613 m!267009))

(declare-fun m!267011 () Bool)

(assert (=> b!250613 m!267011))

(declare-fun m!267013 () Bool)

(assert (=> b!250613 m!267013))

(assert (=> b!250613 m!267009))

(assert (=> b!250613 m!267001))

(declare-fun m!267015 () Bool)

(assert (=> b!250613 m!267015))

(declare-fun m!267017 () Bool)

(assert (=> b!250613 m!267017))

(assert (=> b!250613 m!267007))

(declare-fun m!267019 () Bool)

(assert (=> b!250613 m!267019))

(declare-fun m!267021 () Bool)

(assert (=> b!250613 m!267021))

(assert (=> b!250613 m!267017))

(declare-fun m!267023 () Bool)

(assert (=> b!250613 m!267023))

(assert (=> b!250613 m!266989))

(declare-fun m!267025 () Bool)

(assert (=> b!250613 m!267025))

(declare-fun m!267027 () Bool)

(assert (=> b!250613 m!267027))

(declare-fun m!267029 () Bool)

(assert (=> b!250613 m!267029))

(assert (=> b!250621 m!266921))

(declare-fun m!267031 () Bool)

(assert (=> b!250621 m!267031))

(declare-fun m!267033 () Bool)

(assert (=> b!250621 m!267033))

(declare-fun m!267035 () Bool)

(assert (=> b!250621 m!267035))

(assert (=> b!250621 m!267031))

(assert (=> b!250621 m!267033))

(assert (=> b!250621 m!266921))

(declare-fun m!267037 () Bool)

(assert (=> b!250621 m!267037))

(declare-fun m!267039 () Bool)

(assert (=> bm!23562 m!267039))

(declare-fun m!267041 () Bool)

(assert (=> bm!23560 m!267041))

(assert (=> b!250616 m!266921))

(assert (=> b!250616 m!266921))

(assert (=> b!250616 m!266923))

(assert (=> b!250390 d!60965))

(declare-fun lt!125598 () SeekEntryResult!1121)

(declare-fun e!162556 () SeekEntryResult!1121)

(declare-fun b!250644 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12297 (_ BitVec 32)) SeekEntryResult!1121)

(assert (=> b!250644 (= e!162556 (seekKeyOrZeroReturnVacant!0 (x!24671 lt!125598) (index!6656 lt!125598) (index!6656 lt!125598) key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(declare-fun b!250645 () Bool)

(declare-fun c!42129 () Bool)

(declare-fun lt!125597 () (_ BitVec 64))

(assert (=> b!250645 (= c!42129 (= lt!125597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162555 () SeekEntryResult!1121)

(assert (=> b!250645 (= e!162555 e!162556)))

(declare-fun b!250646 () Bool)

(assert (=> b!250646 (= e!162555 (Found!1121 (index!6656 lt!125598)))))

(declare-fun b!250647 () Bool)

(declare-fun e!162554 () SeekEntryResult!1121)

(assert (=> b!250647 (= e!162554 Undefined!1121)))

(declare-fun b!250648 () Bool)

(assert (=> b!250648 (= e!162554 e!162555)))

(assert (=> b!250648 (= lt!125597 (select (arr!5831 (_keys!6764 thiss!1504)) (index!6656 lt!125598)))))

(declare-fun c!42130 () Bool)

(assert (=> b!250648 (= c!42130 (= lt!125597 key!932))))

(declare-fun d!60967 () Bool)

(declare-fun lt!125599 () SeekEntryResult!1121)

(assert (=> d!60967 (and (or ((_ is Undefined!1121) lt!125599) (not ((_ is Found!1121) lt!125599)) (and (bvsge (index!6655 lt!125599) #b00000000000000000000000000000000) (bvslt (index!6655 lt!125599) (size!6176 (_keys!6764 thiss!1504))))) (or ((_ is Undefined!1121) lt!125599) ((_ is Found!1121) lt!125599) (not ((_ is MissingZero!1121) lt!125599)) (and (bvsge (index!6654 lt!125599) #b00000000000000000000000000000000) (bvslt (index!6654 lt!125599) (size!6176 (_keys!6764 thiss!1504))))) (or ((_ is Undefined!1121) lt!125599) ((_ is Found!1121) lt!125599) ((_ is MissingZero!1121) lt!125599) (not ((_ is MissingVacant!1121) lt!125599)) (and (bvsge (index!6657 lt!125599) #b00000000000000000000000000000000) (bvslt (index!6657 lt!125599) (size!6176 (_keys!6764 thiss!1504))))) (or ((_ is Undefined!1121) lt!125599) (ite ((_ is Found!1121) lt!125599) (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6655 lt!125599)) key!932) (ite ((_ is MissingZero!1121) lt!125599) (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6654 lt!125599)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1121) lt!125599) (= (select (arr!5831 (_keys!6764 thiss!1504)) (index!6657 lt!125599)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60967 (= lt!125599 e!162554)))

(declare-fun c!42131 () Bool)

(assert (=> d!60967 (= c!42131 (and ((_ is Intermediate!1121) lt!125598) (undefined!1933 lt!125598)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12297 (_ BitVec 32)) SeekEntryResult!1121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60967 (= lt!125598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10811 thiss!1504)) key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(assert (=> d!60967 (validMask!0 (mask!10811 thiss!1504))))

(assert (=> d!60967 (= (seekEntryOrOpen!0 key!932 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)) lt!125599)))

(declare-fun b!250649 () Bool)

(assert (=> b!250649 (= e!162556 (MissingZero!1121 (index!6656 lt!125598)))))

(assert (= (and d!60967 c!42131) b!250647))

(assert (= (and d!60967 (not c!42131)) b!250648))

(assert (= (and b!250648 c!42130) b!250646))

(assert (= (and b!250648 (not c!42130)) b!250645))

(assert (= (and b!250645 c!42129) b!250649))

(assert (= (and b!250645 (not c!42129)) b!250644))

(declare-fun m!267043 () Bool)

(assert (=> b!250644 m!267043))

(declare-fun m!267045 () Bool)

(assert (=> b!250648 m!267045))

(declare-fun m!267047 () Bool)

(assert (=> d!60967 m!267047))

(declare-fun m!267049 () Bool)

(assert (=> d!60967 m!267049))

(declare-fun m!267051 () Bool)

(assert (=> d!60967 m!267051))

(assert (=> d!60967 m!266845))

(assert (=> d!60967 m!267051))

(declare-fun m!267053 () Bool)

(assert (=> d!60967 m!267053))

(declare-fun m!267055 () Bool)

(assert (=> d!60967 m!267055))

(assert (=> b!250385 d!60967))

(declare-fun d!60969 () Bool)

(declare-fun res!122756 () Bool)

(declare-fun e!162559 () Bool)

(assert (=> d!60969 (=> (not res!122756) (not e!162559))))

(declare-fun simpleValid!263 (LongMapFixedSize!3702) Bool)

(assert (=> d!60969 (= res!122756 (simpleValid!263 thiss!1504))))

(assert (=> d!60969 (= (valid!1447 thiss!1504) e!162559)))

(declare-fun b!250656 () Bool)

(declare-fun res!122757 () Bool)

(assert (=> b!250656 (=> (not res!122757) (not e!162559))))

(assert (=> b!250656 (= res!122757 (= (arrayCountValidKeys!0 (_keys!6764 thiss!1504) #b00000000000000000000000000000000 (size!6176 (_keys!6764 thiss!1504))) (_size!1900 thiss!1504)))))

(declare-fun b!250657 () Bool)

(declare-fun res!122758 () Bool)

(assert (=> b!250657 (=> (not res!122758) (not e!162559))))

(assert (=> b!250657 (= res!122758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6764 thiss!1504) (mask!10811 thiss!1504)))))

(declare-fun b!250658 () Bool)

(assert (=> b!250658 (= e!162559 (arrayNoDuplicates!0 (_keys!6764 thiss!1504) #b00000000000000000000000000000000 Nil!3719))))

(assert (= (and d!60969 res!122756) b!250656))

(assert (= (and b!250656 res!122757) b!250657))

(assert (= (and b!250657 res!122758) b!250658))

(declare-fun m!267057 () Bool)

(assert (=> d!60969 m!267057))

(assert (=> b!250656 m!266859))

(declare-fun m!267059 () Bool)

(assert (=> b!250657 m!267059))

(declare-fun m!267061 () Bool)

(assert (=> b!250658 m!267061))

(assert (=> start!23880 d!60969))

(declare-fun b!250666 () Bool)

(declare-fun e!162564 () Bool)

(assert (=> b!250666 (= e!162564 tp_is_empty!6489)))

(declare-fun mapIsEmpty!11032 () Bool)

(declare-fun mapRes!11032 () Bool)

(assert (=> mapIsEmpty!11032 mapRes!11032))

(declare-fun condMapEmpty!11032 () Bool)

(declare-fun mapDefault!11032 () ValueCell!2901)

(assert (=> mapNonEmpty!11026 (= condMapEmpty!11032 (= mapRest!11026 ((as const (Array (_ BitVec 32) ValueCell!2901)) mapDefault!11032)))))

(assert (=> mapNonEmpty!11026 (= tp!23145 (and e!162564 mapRes!11032))))

(declare-fun mapNonEmpty!11032 () Bool)

(declare-fun tp!23155 () Bool)

(declare-fun e!162565 () Bool)

(assert (=> mapNonEmpty!11032 (= mapRes!11032 (and tp!23155 e!162565))))

(declare-fun mapKey!11032 () (_ BitVec 32))

(declare-fun mapValue!11032 () ValueCell!2901)

(declare-fun mapRest!11032 () (Array (_ BitVec 32) ValueCell!2901))

(assert (=> mapNonEmpty!11032 (= mapRest!11026 (store mapRest!11032 mapKey!11032 mapValue!11032))))

(declare-fun b!250665 () Bool)

(assert (=> b!250665 (= e!162565 tp_is_empty!6489)))

(assert (= (and mapNonEmpty!11026 condMapEmpty!11032) mapIsEmpty!11032))

(assert (= (and mapNonEmpty!11026 (not condMapEmpty!11032)) mapNonEmpty!11032))

(assert (= (and mapNonEmpty!11032 ((_ is ValueCellFull!2901) mapValue!11032)) b!250665))

(assert (= (and mapNonEmpty!11026 ((_ is ValueCellFull!2901) mapDefault!11032)) b!250666))

(declare-fun m!267063 () Bool)

(assert (=> mapNonEmpty!11032 m!267063))

(declare-fun b_lambda!8089 () Bool)

(assert (= b_lambda!8087 (or (and b!250397 b_free!6627) b_lambda!8089)))

(check-sat (not b!250515) (not b!250499) (not b!250609) (not bm!23543) (not b_lambda!8089) (not d!60963) (not b!250526) (not bm!23535) (not b!250490) (not bm!23544) (not d!60965) (not b!250512) (not b!250610) b_and!13651 (not d!60953) (not b!250505) tp_is_empty!6489 (not mapNonEmpty!11032) (not bm!23538) (not bm!23531) (not d!60945) (not b!250613) (not bm!23560) (not d!60967) (not b!250525) (not b!250471) (not b!250644) (not b!250619) (not d!60937) (not b!250483) (not b!250629) (not b!250621) (not b!250564) (not b_next!6627) (not d!60959) (not b!250502) (not bm!23564) (not b!250656) (not b!250618) (not bm!23563) (not b!250657) (not b!250485) (not bm!23562) (not b!250487) (not b!250566) (not b!250532) (not d!60939) (not b!250616) (not b!250500) (not b!250658) (not d!60951) (not bm!23534) (not d!60969))
(check-sat b_and!13651 (not b_next!6627))
