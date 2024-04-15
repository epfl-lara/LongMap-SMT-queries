; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22178 () Bool)

(assert start!22178)

(declare-fun b!231760 () Bool)

(declare-fun b_free!6241 () Bool)

(declare-fun b_next!6241 () Bool)

(assert (=> b!231760 (= b_free!6241 (not b_next!6241))))

(declare-fun tp!21864 () Bool)

(declare-fun b_and!13113 () Bool)

(assert (=> b!231760 (= tp!21864 b_and!13113)))

(declare-fun b!231753 () Bool)

(declare-fun e!150469 () Bool)

(declare-fun tp_is_empty!6103 () Bool)

(assert (=> b!231753 (= e!150469 tp_is_empty!6103)))

(declare-fun b!231754 () Bool)

(declare-fun res!113832 () Bool)

(declare-fun e!150468 () Bool)

(assert (=> b!231754 (=> (not res!113832) (not e!150468))))

(declare-fun call!21533 () Bool)

(assert (=> b!231754 (= res!113832 call!21533)))

(declare-fun e!150473 () Bool)

(assert (=> b!231754 (= e!150473 e!150468)))

(declare-fun b!231755 () Bool)

(declare-datatypes ((Unit!7121 0))(
  ( (Unit!7122) )
))
(declare-fun e!150471 () Unit!7121)

(declare-fun lt!116818 () Unit!7121)

(assert (=> b!231755 (= e!150471 lt!116818)))

(declare-datatypes ((V!7785 0))(
  ( (V!7786 (val!3096 Int)) )
))
(declare-datatypes ((ValueCell!2708 0))(
  ( (ValueCellFull!2708 (v!5110 V!7785)) (EmptyCell!2708) )
))
(declare-datatypes ((array!11441 0))(
  ( (array!11442 (arr!5439 (Array (_ BitVec 32) ValueCell!2708)) (size!5773 (_ BitVec 32))) )
))
(declare-datatypes ((array!11443 0))(
  ( (array!11444 (arr!5440 (Array (_ BitVec 32) (_ BitVec 64))) (size!5774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3316 0))(
  ( (LongMapFixedSize!3317 (defaultEntry!4317 Int) (mask!10224 (_ BitVec 32)) (extraKeys!4054 (_ BitVec 32)) (zeroValue!4158 V!7785) (minValue!4158 V!7785) (_size!1707 (_ BitVec 32)) (_keys!6370 array!11443) (_values!4300 array!11441) (_vacant!1707 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3316)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) Int) Unit!7121)

(assert (=> b!231755 (= lt!116818 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (_keys!6370 thiss!1504) (_values!4300 thiss!1504) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 (defaultEntry!4317 thiss!1504)))))

(declare-fun c!38516 () Bool)

(declare-datatypes ((SeekEntryResult!959 0))(
  ( (MissingZero!959 (index!6006 (_ BitVec 32))) (Found!959 (index!6007 (_ BitVec 32))) (Intermediate!959 (undefined!1771 Bool) (index!6008 (_ BitVec 32)) (x!23530 (_ BitVec 32))) (Undefined!959) (MissingVacant!959 (index!6009 (_ BitVec 32))) )
))
(declare-fun lt!116821 () SeekEntryResult!959)

(get-info :version)

(assert (=> b!231755 (= c!38516 ((_ is MissingZero!959) lt!116821))))

(assert (=> b!231755 e!150473))

(declare-fun b!231756 () Bool)

(declare-fun e!150464 () Unit!7121)

(declare-fun Unit!7123 () Unit!7121)

(assert (=> b!231756 (= e!150464 Unit!7123)))

(declare-fun b!231757 () Bool)

(declare-fun e!150467 () Bool)

(declare-fun mapRes!10324 () Bool)

(assert (=> b!231757 (= e!150467 (and e!150469 mapRes!10324))))

(declare-fun condMapEmpty!10324 () Bool)

(declare-fun mapDefault!10324 () ValueCell!2708)

(assert (=> b!231757 (= condMapEmpty!10324 (= (arr!5439 (_values!4300 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2708)) mapDefault!10324)))))

(declare-fun b!231758 () Bool)

(declare-fun c!38515 () Bool)

(assert (=> b!231758 (= c!38515 ((_ is MissingVacant!959) lt!116821))))

(declare-fun e!150472 () Bool)

(assert (=> b!231758 (= e!150473 e!150472)))

(declare-fun b!231759 () Bool)

(declare-fun Unit!7124 () Unit!7121)

(assert (=> b!231759 (= e!150464 Unit!7124)))

(declare-fun lt!116812 () Unit!7121)

(declare-fun lemmaArrayContainsKeyThenInListMap!147 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) (_ BitVec 32) Int) Unit!7121)

(assert (=> b!231759 (= lt!116812 (lemmaArrayContainsKeyThenInListMap!147 (_keys!6370 thiss!1504) (_values!4300 thiss!1504) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(assert (=> b!231759 false))

(declare-fun e!150465 () Bool)

(declare-fun array_inv!3591 (array!11443) Bool)

(declare-fun array_inv!3592 (array!11441) Bool)

(assert (=> b!231760 (= e!150465 (and tp!21864 tp_is_empty!6103 (array_inv!3591 (_keys!6370 thiss!1504)) (array_inv!3592 (_values!4300 thiss!1504)) e!150467))))

(declare-fun b!231761 () Bool)

(declare-fun e!150474 () Bool)

(declare-fun e!150477 () Bool)

(assert (=> b!231761 (= e!150474 e!150477)))

(declare-fun res!113827 () Bool)

(assert (=> b!231761 (=> (not res!113827) (not e!150477))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231761 (= res!113827 (or (= lt!116821 (MissingZero!959 index!297)) (= lt!116821 (MissingVacant!959 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11443 (_ BitVec 32)) SeekEntryResult!959)

(assert (=> b!231761 (= lt!116821 (seekEntryOrOpen!0 key!932 (_keys!6370 thiss!1504) (mask!10224 thiss!1504)))))

(declare-fun res!113831 () Bool)

(assert (=> start!22178 (=> (not res!113831) (not e!150474))))

(declare-fun valid!1329 (LongMapFixedSize!3316) Bool)

(assert (=> start!22178 (= res!113831 (valid!1329 thiss!1504))))

(assert (=> start!22178 e!150474))

(assert (=> start!22178 e!150465))

(assert (=> start!22178 true))

(assert (=> start!22178 tp_is_empty!6103))

(declare-fun b!231762 () Bool)

(declare-fun res!113830 () Bool)

(assert (=> b!231762 (=> (not res!113830) (not e!150474))))

(assert (=> b!231762 (= res!113830 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231763 () Bool)

(declare-fun res!113833 () Bool)

(assert (=> b!231763 (= res!113833 (= (select (arr!5440 (_keys!6370 thiss!1504)) (index!6009 lt!116821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150470 () Bool)

(assert (=> b!231763 (=> (not res!113833) (not e!150470))))

(declare-fun b!231764 () Bool)

(declare-fun e!150476 () Bool)

(assert (=> b!231764 (= e!150477 e!150476)))

(declare-fun res!113834 () Bool)

(assert (=> b!231764 (=> (not res!113834) (not e!150476))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231764 (= res!113834 (inRange!0 index!297 (mask!10224 thiss!1504)))))

(declare-fun lt!116820 () Unit!7121)

(assert (=> b!231764 (= lt!116820 e!150471)))

(declare-fun c!38518 () Bool)

(declare-datatypes ((tuple2!4542 0))(
  ( (tuple2!4543 (_1!2282 (_ BitVec 64)) (_2!2282 V!7785)) )
))
(declare-datatypes ((List!3479 0))(
  ( (Nil!3476) (Cons!3475 (h!4123 tuple2!4542) (t!8429 List!3479)) )
))
(declare-datatypes ((ListLongMap!3445 0))(
  ( (ListLongMap!3446 (toList!1738 List!3479)) )
))
(declare-fun lt!116810 () ListLongMap!3445)

(declare-fun contains!1610 (ListLongMap!3445 (_ BitVec 64)) Bool)

(assert (=> b!231764 (= c!38518 (contains!1610 lt!116810 key!932))))

(declare-fun getCurrentListMap!1247 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) Int) ListLongMap!3445)

(assert (=> b!231764 (= lt!116810 (getCurrentListMap!1247 (_keys!6370 thiss!1504) (_values!4300 thiss!1504) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun b!231765 () Bool)

(assert (=> b!231765 (= e!150472 ((_ is Undefined!959) lt!116821))))

(declare-fun b!231766 () Bool)

(declare-fun Unit!7125 () Unit!7121)

(assert (=> b!231766 (= e!150471 Unit!7125)))

(declare-fun lt!116817 () Unit!7121)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 64) Int) Unit!7121)

(assert (=> b!231766 (= lt!116817 (lemmaInListMapThenSeekEntryOrOpenFindsIt!309 (_keys!6370 thiss!1504) (_values!4300 thiss!1504) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) key!932 (defaultEntry!4317 thiss!1504)))))

(assert (=> b!231766 false))

(declare-fun b!231767 () Bool)

(declare-fun res!113829 () Bool)

(assert (=> b!231767 (=> (not res!113829) (not e!150468))))

(assert (=> b!231767 (= res!113829 (= (select (arr!5440 (_keys!6370 thiss!1504)) (index!6006 lt!116821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231768 () Bool)

(assert (=> b!231768 (= e!150476 (not true))))

(declare-fun lt!116813 () array!11443)

(declare-fun arrayCountValidKeys!0 (array!11443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231768 (= (arrayCountValidKeys!0 lt!116813 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116814 () Unit!7121)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11443 (_ BitVec 32)) Unit!7121)

(assert (=> b!231768 (= lt!116814 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116813 index!297))))

(declare-fun arrayContainsKey!0 (array!11443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231768 (arrayContainsKey!0 lt!116813 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116809 () Unit!7121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11443 (_ BitVec 64) (_ BitVec 32)) Unit!7121)

(assert (=> b!231768 (= lt!116809 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116813 key!932 index!297))))

(declare-fun v!346 () V!7785)

(declare-fun +!623 (ListLongMap!3445 tuple2!4542) ListLongMap!3445)

(assert (=> b!231768 (= (+!623 lt!116810 (tuple2!4543 key!932 v!346)) (getCurrentListMap!1247 lt!116813 (array!11442 (store (arr!5439 (_values!4300 thiss!1504)) index!297 (ValueCellFull!2708 v!346)) (size!5773 (_values!4300 thiss!1504))) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4317 thiss!1504)))))

(declare-fun lt!116815 () Unit!7121)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!78 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7785 V!7785 (_ BitVec 32) (_ BitVec 64) V!7785 Int) Unit!7121)

(assert (=> b!231768 (= lt!116815 (lemmaAddValidKeyToArrayThenAddPairToListMap!78 (_keys!6370 thiss!1504) (_values!4300 thiss!1504) (mask!10224 thiss!1504) (extraKeys!4054 thiss!1504) (zeroValue!4158 thiss!1504) (minValue!4158 thiss!1504) index!297 key!932 v!346 (defaultEntry!4317 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11443 (_ BitVec 32)) Bool)

(assert (=> b!231768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116813 (mask!10224 thiss!1504))))

(declare-fun lt!116819 () Unit!7121)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11443 (_ BitVec 32) (_ BitVec 32)) Unit!7121)

(assert (=> b!231768 (= lt!116819 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6370 thiss!1504) index!297 (mask!10224 thiss!1504)))))

(assert (=> b!231768 (= (arrayCountValidKeys!0 lt!116813 #b00000000000000000000000000000000 (size!5774 (_keys!6370 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6370 thiss!1504) #b00000000000000000000000000000000 (size!5774 (_keys!6370 thiss!1504)))))))

(declare-fun lt!116808 () Unit!7121)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11443 (_ BitVec 32) (_ BitVec 64)) Unit!7121)

(assert (=> b!231768 (= lt!116808 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6370 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3480 0))(
  ( (Nil!3477) (Cons!3476 (h!4124 (_ BitVec 64)) (t!8430 List!3480)) )
))
(declare-fun arrayNoDuplicates!0 (array!11443 (_ BitVec 32) List!3480) Bool)

(assert (=> b!231768 (arrayNoDuplicates!0 lt!116813 #b00000000000000000000000000000000 Nil!3477)))

(assert (=> b!231768 (= lt!116813 (array!11444 (store (arr!5440 (_keys!6370 thiss!1504)) index!297 key!932) (size!5774 (_keys!6370 thiss!1504))))))

(declare-fun lt!116816 () Unit!7121)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3480) Unit!7121)

(assert (=> b!231768 (= lt!116816 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6370 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3477))))

(declare-fun lt!116811 () Unit!7121)

(assert (=> b!231768 (= lt!116811 e!150464)))

(declare-fun c!38517 () Bool)

(assert (=> b!231768 (= c!38517 (arrayContainsKey!0 (_keys!6370 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21530 () Bool)

(declare-fun call!21534 () Bool)

(assert (=> bm!21530 (= call!21534 (arrayContainsKey!0 (_keys!6370 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231769 () Bool)

(assert (=> b!231769 (= e!150468 (not call!21534))))

(declare-fun b!231770 () Bool)

(assert (=> b!231770 (= e!150470 (not call!21534))))

(declare-fun b!231771 () Bool)

(assert (=> b!231771 (= e!150472 e!150470)))

(declare-fun res!113828 () Bool)

(assert (=> b!231771 (= res!113828 call!21533)))

(assert (=> b!231771 (=> (not res!113828) (not e!150470))))

(declare-fun bm!21531 () Bool)

(assert (=> bm!21531 (= call!21533 (inRange!0 (ite c!38516 (index!6006 lt!116821) (index!6009 lt!116821)) (mask!10224 thiss!1504)))))

(declare-fun mapIsEmpty!10324 () Bool)

(assert (=> mapIsEmpty!10324 mapRes!10324))

(declare-fun mapNonEmpty!10324 () Bool)

(declare-fun tp!21865 () Bool)

(declare-fun e!150475 () Bool)

(assert (=> mapNonEmpty!10324 (= mapRes!10324 (and tp!21865 e!150475))))

(declare-fun mapKey!10324 () (_ BitVec 32))

(declare-fun mapRest!10324 () (Array (_ BitVec 32) ValueCell!2708))

(declare-fun mapValue!10324 () ValueCell!2708)

(assert (=> mapNonEmpty!10324 (= (arr!5439 (_values!4300 thiss!1504)) (store mapRest!10324 mapKey!10324 mapValue!10324))))

(declare-fun b!231772 () Bool)

(assert (=> b!231772 (= e!150475 tp_is_empty!6103)))

(assert (= (and start!22178 res!113831) b!231762))

(assert (= (and b!231762 res!113830) b!231761))

(assert (= (and b!231761 res!113827) b!231764))

(assert (= (and b!231764 c!38518) b!231766))

(assert (= (and b!231764 (not c!38518)) b!231755))

(assert (= (and b!231755 c!38516) b!231754))

(assert (= (and b!231755 (not c!38516)) b!231758))

(assert (= (and b!231754 res!113832) b!231767))

(assert (= (and b!231767 res!113829) b!231769))

(assert (= (and b!231758 c!38515) b!231771))

(assert (= (and b!231758 (not c!38515)) b!231765))

(assert (= (and b!231771 res!113828) b!231763))

(assert (= (and b!231763 res!113833) b!231770))

(assert (= (or b!231754 b!231771) bm!21531))

(assert (= (or b!231769 b!231770) bm!21530))

(assert (= (and b!231764 res!113834) b!231768))

(assert (= (and b!231768 c!38517) b!231759))

(assert (= (and b!231768 (not c!38517)) b!231756))

(assert (= (and b!231757 condMapEmpty!10324) mapIsEmpty!10324))

(assert (= (and b!231757 (not condMapEmpty!10324)) mapNonEmpty!10324))

(assert (= (and mapNonEmpty!10324 ((_ is ValueCellFull!2708) mapValue!10324)) b!231772))

(assert (= (and b!231757 ((_ is ValueCellFull!2708) mapDefault!10324)) b!231753))

(assert (= b!231760 b!231757))

(assert (= start!22178 b!231760))

(declare-fun m!252691 () Bool)

(assert (=> b!231768 m!252691))

(declare-fun m!252693 () Bool)

(assert (=> b!231768 m!252693))

(declare-fun m!252695 () Bool)

(assert (=> b!231768 m!252695))

(declare-fun m!252697 () Bool)

(assert (=> b!231768 m!252697))

(declare-fun m!252699 () Bool)

(assert (=> b!231768 m!252699))

(declare-fun m!252701 () Bool)

(assert (=> b!231768 m!252701))

(declare-fun m!252703 () Bool)

(assert (=> b!231768 m!252703))

(declare-fun m!252705 () Bool)

(assert (=> b!231768 m!252705))

(declare-fun m!252707 () Bool)

(assert (=> b!231768 m!252707))

(declare-fun m!252709 () Bool)

(assert (=> b!231768 m!252709))

(declare-fun m!252711 () Bool)

(assert (=> b!231768 m!252711))

(declare-fun m!252713 () Bool)

(assert (=> b!231768 m!252713))

(declare-fun m!252715 () Bool)

(assert (=> b!231768 m!252715))

(declare-fun m!252717 () Bool)

(assert (=> b!231768 m!252717))

(declare-fun m!252719 () Bool)

(assert (=> b!231768 m!252719))

(declare-fun m!252721 () Bool)

(assert (=> b!231768 m!252721))

(declare-fun m!252723 () Bool)

(assert (=> b!231768 m!252723))

(declare-fun m!252725 () Bool)

(assert (=> b!231764 m!252725))

(declare-fun m!252727 () Bool)

(assert (=> b!231764 m!252727))

(declare-fun m!252729 () Bool)

(assert (=> b!231764 m!252729))

(declare-fun m!252731 () Bool)

(assert (=> b!231763 m!252731))

(declare-fun m!252733 () Bool)

(assert (=> b!231755 m!252733))

(declare-fun m!252735 () Bool)

(assert (=> b!231759 m!252735))

(declare-fun m!252737 () Bool)

(assert (=> b!231767 m!252737))

(declare-fun m!252739 () Bool)

(assert (=> mapNonEmpty!10324 m!252739))

(declare-fun m!252741 () Bool)

(assert (=> bm!21531 m!252741))

(declare-fun m!252743 () Bool)

(assert (=> b!231761 m!252743))

(declare-fun m!252745 () Bool)

(assert (=> start!22178 m!252745))

(declare-fun m!252747 () Bool)

(assert (=> b!231760 m!252747))

(declare-fun m!252749 () Bool)

(assert (=> b!231760 m!252749))

(declare-fun m!252751 () Bool)

(assert (=> b!231766 m!252751))

(assert (=> bm!21530 m!252705))

(check-sat (not start!22178) (not bm!21531) (not b!231759) (not b!231760) (not b!231764) tp_is_empty!6103 (not b!231761) (not b!231755) b_and!13113 (not bm!21530) (not b!231768) (not b!231766) (not b_next!6241) (not mapNonEmpty!10324))
(check-sat b_and!13113 (not b_next!6241))
