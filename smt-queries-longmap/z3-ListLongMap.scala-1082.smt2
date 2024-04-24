; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22178 () Bool)

(assert start!22178)

(declare-fun b!231952 () Bool)

(declare-fun b_free!6241 () Bool)

(declare-fun b_next!6241 () Bool)

(assert (=> b!231952 (= b_free!6241 (not b_next!6241))))

(declare-fun tp!21865 () Bool)

(declare-fun b_and!13153 () Bool)

(assert (=> b!231952 (= tp!21865 b_and!13153)))

(declare-fun b!231947 () Bool)

(declare-fun e!150598 () Bool)

(declare-fun tp_is_empty!6103 () Bool)

(assert (=> b!231947 (= e!150598 tp_is_empty!6103)))

(declare-fun b!231948 () Bool)

(declare-fun e!150594 () Bool)

(assert (=> b!231948 (= e!150594 (not true))))

(declare-datatypes ((array!11447 0))(
  ( (array!11448 (arr!5443 (Array (_ BitVec 32) (_ BitVec 64))) (size!5776 (_ BitVec 32))) )
))
(declare-fun lt!117054 () array!11447)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11447 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231948 (= (arrayCountValidKeys!0 lt!117054 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7128 0))(
  ( (Unit!7129) )
))
(declare-fun lt!117051 () Unit!7128)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11447 (_ BitVec 32)) Unit!7128)

(assert (=> b!231948 (= lt!117051 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117054 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231948 (arrayContainsKey!0 lt!117054 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117052 () Unit!7128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11447 (_ BitVec 64) (_ BitVec 32)) Unit!7128)

(assert (=> b!231948 (= lt!117052 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117054 key!932 index!297))))

(declare-datatypes ((V!7785 0))(
  ( (V!7786 (val!3096 Int)) )
))
(declare-datatypes ((ValueCell!2708 0))(
  ( (ValueCellFull!2708 (v!5117 V!7785)) (EmptyCell!2708) )
))
(declare-datatypes ((array!11449 0))(
  ( (array!11450 (arr!5444 (Array (_ BitVec 32) ValueCell!2708)) (size!5777 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3316 0))(
  ( (LongMapFixedSize!3317 (defaultEntry!4317 Int) (mask!10225 (_ BitVec 32)) (extraKeys!4054 (_ BitVec 32)) (zeroValue!4158 V!7785) (minValue!4158 V!7785) (_size!1707 (_ BitVec 32)) (_keys!6371 array!11447) (_values!4300 array!11449) (_vacant!1707 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3316)

(declare-fun v!346 () V!7785)

(declare-datatypes ((tuple2!4498 0))(
  ( (tuple2!4499 (_1!2260 (_ BitVec 64)) (_2!2260 V!7785)) )
))
(declare-datatypes ((List!3407 0))(
  ( (Nil!3404) (Cons!3403 (h!4051 tuple2!4498) (t!8358 List!3407)) )
))
(declare-datatypes ((ListLongMap!3413 0))(
  ( (ListLongMap!3414 (toList!1722 List!3407)) )
))
(declare-fun lt!117056 () ListLongMap!3413)

(declare-fun +!617 (ListLongMap!3413 tuple2!4498) ListLongMap!3413)

(declare-fun getCurrentListMap!1254 (array!11447 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) Int) ListLongMap!3413)

(assert (=> b!231948 (= (+!617 lt!117056 (tuple2!4499 key!932 v!346)) (getCurrentListMap!1254 lt!117054 (array!11450 (store (arr!5444 (_values!4300 thiss!1504)) index!297 (ValueCellFull!2708 v!346)) (size!5777 (_values!4300 thiss!1504))) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun lt!117057 () Unit!7128)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!76 (array!11447 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) (_ BitVec 64) V!7785 Int) Unit!7128)

(assert (=> b!231948 (= lt!117057 (lemmaAddValidKeyToArrayThenAddPairToListMap!76 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) index!297 key!932 v!346 (defaultEntry!4317 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11447 (_ BitVec 32)) Bool)

(assert (=> b!231948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117054 (mask!10225 thiss!1504))))

(declare-fun lt!117059 () Unit!7128)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11447 (_ BitVec 32) (_ BitVec 32)) Unit!7128)

(assert (=> b!231948 (= lt!117059 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6371 thiss!1504) index!297 (mask!10225 thiss!1504)))))

(assert (=> b!231948 (= (arrayCountValidKeys!0 lt!117054 #b00000000000000000000000000000000 (size!5776 (_keys!6371 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6371 thiss!1504) #b00000000000000000000000000000000 (size!5776 (_keys!6371 thiss!1504)))))))

(declare-fun lt!117060 () Unit!7128)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11447 (_ BitVec 32) (_ BitVec 64)) Unit!7128)

(assert (=> b!231948 (= lt!117060 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6371 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3408 0))(
  ( (Nil!3405) (Cons!3404 (h!4052 (_ BitVec 64)) (t!8359 List!3408)) )
))
(declare-fun arrayNoDuplicates!0 (array!11447 (_ BitVec 32) List!3408) Bool)

(assert (=> b!231948 (arrayNoDuplicates!0 lt!117054 #b00000000000000000000000000000000 Nil!3405)))

(assert (=> b!231948 (= lt!117054 (array!11448 (store (arr!5443 (_keys!6371 thiss!1504)) index!297 key!932) (size!5776 (_keys!6371 thiss!1504))))))

(declare-fun lt!117053 () Unit!7128)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3408) Unit!7128)

(assert (=> b!231948 (= lt!117053 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6371 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3405))))

(declare-fun lt!117048 () Unit!7128)

(declare-fun e!150600 () Unit!7128)

(assert (=> b!231948 (= lt!117048 e!150600)))

(declare-fun c!38557 () Bool)

(assert (=> b!231948 (= c!38557 (arrayContainsKey!0 (_keys!6371 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21542 () Bool)

(declare-fun call!21546 () Bool)

(assert (=> bm!21542 (= call!21546 (arrayContainsKey!0 (_keys!6371 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231949 () Bool)

(declare-fun e!150599 () Bool)

(assert (=> b!231949 (= e!150599 (not call!21546))))

(declare-fun b!231950 () Bool)

(declare-fun e!150589 () Bool)

(assert (=> b!231950 (= e!150589 e!150599)))

(declare-fun res!113947 () Bool)

(declare-fun call!21545 () Bool)

(assert (=> b!231950 (= res!113947 call!21545)))

(assert (=> b!231950 (=> (not res!113947) (not e!150599))))

(declare-fun b!231951 () Bool)

(declare-fun e!150601 () Bool)

(assert (=> b!231951 (= e!150601 (not call!21546))))

(declare-fun e!150591 () Bool)

(declare-fun e!150602 () Bool)

(declare-fun array_inv!3571 (array!11447) Bool)

(declare-fun array_inv!3572 (array!11449) Bool)

(assert (=> b!231952 (= e!150591 (and tp!21865 tp_is_empty!6103 (array_inv!3571 (_keys!6371 thiss!1504)) (array_inv!3572 (_values!4300 thiss!1504)) e!150602))))

(declare-fun b!231953 () Bool)

(declare-fun e!150596 () Unit!7128)

(declare-fun Unit!7130 () Unit!7128)

(assert (=> b!231953 (= e!150596 Unit!7130)))

(declare-fun lt!117049 () Unit!7128)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (array!11447 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) Int) Unit!7128)

(assert (=> b!231953 (= lt!117049 (lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 (defaultEntry!4317 thiss!1504)))))

(assert (=> b!231953 false))

(declare-fun res!113944 () Bool)

(declare-fun e!150590 () Bool)

(assert (=> start!22178 (=> (not res!113944) (not e!150590))))

(declare-fun valid!1330 (LongMapFixedSize!3316) Bool)

(assert (=> start!22178 (= res!113944 (valid!1330 thiss!1504))))

(assert (=> start!22178 e!150590))

(assert (=> start!22178 e!150591))

(assert (=> start!22178 true))

(assert (=> start!22178 tp_is_empty!6103))

(declare-fun b!231954 () Bool)

(declare-fun Unit!7131 () Unit!7128)

(assert (=> b!231954 (= e!150600 Unit!7131)))

(declare-datatypes ((SeekEntryResult!925 0))(
  ( (MissingZero!925 (index!5870 (_ BitVec 32))) (Found!925 (index!5871 (_ BitVec 32))) (Intermediate!925 (undefined!1737 Bool) (index!5872 (_ BitVec 32)) (x!23497 (_ BitVec 32))) (Undefined!925) (MissingVacant!925 (index!5873 (_ BitVec 32))) )
))
(declare-fun lt!117055 () SeekEntryResult!925)

(declare-fun c!38556 () Bool)

(declare-fun bm!21543 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21543 (= call!21545 (inRange!0 (ite c!38556 (index!5870 lt!117055) (index!5873 lt!117055)) (mask!10225 thiss!1504)))))

(declare-fun b!231955 () Bool)

(declare-fun res!113946 () Bool)

(assert (=> b!231955 (=> (not res!113946) (not e!150590))))

(assert (=> b!231955 (= res!113946 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231956 () Bool)

(declare-fun res!113945 () Bool)

(assert (=> b!231956 (=> (not res!113945) (not e!150601))))

(assert (=> b!231956 (= res!113945 (= (select (arr!5443 (_keys!6371 thiss!1504)) (index!5870 lt!117055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231957 () Bool)

(declare-fun lt!117061 () Unit!7128)

(assert (=> b!231957 (= e!150596 lt!117061)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!304 (array!11447 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) Int) Unit!7128)

(assert (=> b!231957 (= lt!117061 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!304 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 (defaultEntry!4317 thiss!1504)))))

(get-info :version)

(assert (=> b!231957 (= c!38556 ((_ is MissingZero!925) lt!117055))))

(declare-fun e!150592 () Bool)

(assert (=> b!231957 e!150592))

(declare-fun b!231958 () Bool)

(assert (=> b!231958 (= e!150589 ((_ is Undefined!925) lt!117055))))

(declare-fun b!231959 () Bool)

(declare-fun Unit!7132 () Unit!7128)

(assert (=> b!231959 (= e!150600 Unit!7132)))

(declare-fun lt!117058 () Unit!7128)

(declare-fun lemmaArrayContainsKeyThenInListMap!145 (array!11447 array!11449 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) (_ BitVec 32) Int) Unit!7128)

(assert (=> b!231959 (= lt!117058 (lemmaArrayContainsKeyThenInListMap!145 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(assert (=> b!231959 false))

(declare-fun b!231960 () Bool)

(declare-fun e!150595 () Bool)

(assert (=> b!231960 (= e!150590 e!150595)))

(declare-fun res!113943 () Bool)

(assert (=> b!231960 (=> (not res!113943) (not e!150595))))

(assert (=> b!231960 (= res!113943 (or (= lt!117055 (MissingZero!925 index!297)) (= lt!117055 (MissingVacant!925 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11447 (_ BitVec 32)) SeekEntryResult!925)

(assert (=> b!231960 (= lt!117055 (seekEntryOrOpen!0 key!932 (_keys!6371 thiss!1504) (mask!10225 thiss!1504)))))

(declare-fun b!231961 () Bool)

(declare-fun e!150593 () Bool)

(assert (=> b!231961 (= e!150593 tp_is_empty!6103)))

(declare-fun b!231962 () Bool)

(declare-fun res!113950 () Bool)

(assert (=> b!231962 (=> (not res!113950) (not e!150601))))

(assert (=> b!231962 (= res!113950 call!21545)))

(assert (=> b!231962 (= e!150592 e!150601)))

(declare-fun mapNonEmpty!10324 () Bool)

(declare-fun mapRes!10324 () Bool)

(declare-fun tp!21864 () Bool)

(assert (=> mapNonEmpty!10324 (= mapRes!10324 (and tp!21864 e!150598))))

(declare-fun mapKey!10324 () (_ BitVec 32))

(declare-fun mapRest!10324 () (Array (_ BitVec 32) ValueCell!2708))

(declare-fun mapValue!10324 () ValueCell!2708)

(assert (=> mapNonEmpty!10324 (= (arr!5444 (_values!4300 thiss!1504)) (store mapRest!10324 mapKey!10324 mapValue!10324))))

(declare-fun b!231963 () Bool)

(declare-fun c!38555 () Bool)

(assert (=> b!231963 (= c!38555 ((_ is MissingVacant!925) lt!117055))))

(assert (=> b!231963 (= e!150592 e!150589)))

(declare-fun b!231964 () Bool)

(assert (=> b!231964 (= e!150595 e!150594)))

(declare-fun res!113948 () Bool)

(assert (=> b!231964 (=> (not res!113948) (not e!150594))))

(assert (=> b!231964 (= res!113948 (inRange!0 index!297 (mask!10225 thiss!1504)))))

(declare-fun lt!117050 () Unit!7128)

(assert (=> b!231964 (= lt!117050 e!150596)))

(declare-fun c!38554 () Bool)

(declare-fun contains!1606 (ListLongMap!3413 (_ BitVec 64)) Bool)

(assert (=> b!231964 (= c!38554 (contains!1606 lt!117056 key!932))))

(assert (=> b!231964 (= lt!117056 (getCurrentListMap!1254 (_keys!6371 thiss!1504) (_values!4300 thiss!1504) (mask!10225 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun b!231965 () Bool)

(declare-fun res!113949 () Bool)

(assert (=> b!231965 (= res!113949 (= (select (arr!5443 (_keys!6371 thiss!1504)) (index!5873 lt!117055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231965 (=> (not res!113949) (not e!150599))))

(declare-fun b!231966 () Bool)

(assert (=> b!231966 (= e!150602 (and e!150593 mapRes!10324))))

(declare-fun condMapEmpty!10324 () Bool)

(declare-fun mapDefault!10324 () ValueCell!2708)

(assert (=> b!231966 (= condMapEmpty!10324 (= (arr!5444 (_values!4300 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2708)) mapDefault!10324)))))

(declare-fun mapIsEmpty!10324 () Bool)

(assert (=> mapIsEmpty!10324 mapRes!10324))

(assert (= (and start!22178 res!113944) b!231955))

(assert (= (and b!231955 res!113946) b!231960))

(assert (= (and b!231960 res!113943) b!231964))

(assert (= (and b!231964 c!38554) b!231953))

(assert (= (and b!231964 (not c!38554)) b!231957))

(assert (= (and b!231957 c!38556) b!231962))

(assert (= (and b!231957 (not c!38556)) b!231963))

(assert (= (and b!231962 res!113950) b!231956))

(assert (= (and b!231956 res!113945) b!231951))

(assert (= (and b!231963 c!38555) b!231950))

(assert (= (and b!231963 (not c!38555)) b!231958))

(assert (= (and b!231950 res!113947) b!231965))

(assert (= (and b!231965 res!113949) b!231949))

(assert (= (or b!231962 b!231950) bm!21543))

(assert (= (or b!231951 b!231949) bm!21542))

(assert (= (and b!231964 res!113948) b!231948))

(assert (= (and b!231948 c!38557) b!231959))

(assert (= (and b!231948 (not c!38557)) b!231954))

(assert (= (and b!231966 condMapEmpty!10324) mapIsEmpty!10324))

(assert (= (and b!231966 (not condMapEmpty!10324)) mapNonEmpty!10324))

(assert (= (and mapNonEmpty!10324 ((_ is ValueCellFull!2708) mapValue!10324)) b!231947))

(assert (= (and b!231966 ((_ is ValueCellFull!2708) mapDefault!10324)) b!231961))

(assert (= b!231952 b!231966))

(assert (= start!22178 b!231952))

(declare-fun m!253489 () Bool)

(assert (=> b!231957 m!253489))

(declare-fun m!253491 () Bool)

(assert (=> start!22178 m!253491))

(declare-fun m!253493 () Bool)

(assert (=> b!231964 m!253493))

(declare-fun m!253495 () Bool)

(assert (=> b!231964 m!253495))

(declare-fun m!253497 () Bool)

(assert (=> b!231964 m!253497))

(declare-fun m!253499 () Bool)

(assert (=> b!231959 m!253499))

(declare-fun m!253501 () Bool)

(assert (=> b!231948 m!253501))

(declare-fun m!253503 () Bool)

(assert (=> b!231948 m!253503))

(declare-fun m!253505 () Bool)

(assert (=> b!231948 m!253505))

(declare-fun m!253507 () Bool)

(assert (=> b!231948 m!253507))

(declare-fun m!253509 () Bool)

(assert (=> b!231948 m!253509))

(declare-fun m!253511 () Bool)

(assert (=> b!231948 m!253511))

(declare-fun m!253513 () Bool)

(assert (=> b!231948 m!253513))

(declare-fun m!253515 () Bool)

(assert (=> b!231948 m!253515))

(declare-fun m!253517 () Bool)

(assert (=> b!231948 m!253517))

(declare-fun m!253519 () Bool)

(assert (=> b!231948 m!253519))

(declare-fun m!253521 () Bool)

(assert (=> b!231948 m!253521))

(declare-fun m!253523 () Bool)

(assert (=> b!231948 m!253523))

(declare-fun m!253525 () Bool)

(assert (=> b!231948 m!253525))

(declare-fun m!253527 () Bool)

(assert (=> b!231948 m!253527))

(declare-fun m!253529 () Bool)

(assert (=> b!231948 m!253529))

(declare-fun m!253531 () Bool)

(assert (=> b!231948 m!253531))

(declare-fun m!253533 () Bool)

(assert (=> b!231948 m!253533))

(declare-fun m!253535 () Bool)

(assert (=> b!231956 m!253535))

(declare-fun m!253537 () Bool)

(assert (=> b!231952 m!253537))

(declare-fun m!253539 () Bool)

(assert (=> b!231952 m!253539))

(declare-fun m!253541 () Bool)

(assert (=> b!231965 m!253541))

(declare-fun m!253543 () Bool)

(assert (=> mapNonEmpty!10324 m!253543))

(declare-fun m!253545 () Bool)

(assert (=> bm!21543 m!253545))

(declare-fun m!253547 () Bool)

(assert (=> b!231960 m!253547))

(declare-fun m!253549 () Bool)

(assert (=> b!231953 m!253549))

(assert (=> bm!21542 m!253503))

(check-sat (not start!22178) (not bm!21543) (not b!231948) (not b!231953) (not bm!21542) (not mapNonEmpty!10324) (not b!231957) tp_is_empty!6103 (not b!231964) (not b!231960) (not b!231952) b_and!13153 (not b!231959) (not b_next!6241))
(check-sat b_and!13153 (not b_next!6241))
