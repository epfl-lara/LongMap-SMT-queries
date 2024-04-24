; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91574 () Bool)

(assert start!91574)

(declare-fun b!1042774 () Bool)

(declare-fun b_free!21037 () Bool)

(declare-fun b_next!21037 () Bool)

(assert (=> b!1042774 (= b_free!21037 (not b_next!21037))))

(declare-fun tp!74322 () Bool)

(declare-fun b_and!33579 () Bool)

(assert (=> b!1042774 (= tp!74322 b_and!33579)))

(declare-fun b!1042767 () Bool)

(declare-fun res!694640 () Bool)

(declare-fun e!590626 () Bool)

(assert (=> b!1042767 (=> (not res!694640) (not e!590626))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042767 (= res!694640 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042768 () Bool)

(declare-fun e!590624 () Bool)

(declare-fun e!590630 () Bool)

(declare-fun mapRes!38730 () Bool)

(assert (=> b!1042768 (= e!590624 (and e!590630 mapRes!38730))))

(declare-fun condMapEmpty!38730 () Bool)

(declare-datatypes ((V!37883 0))(
  ( (V!37884 (val!12429 Int)) )
))
(declare-datatypes ((ValueCell!11675 0))(
  ( (ValueCellFull!11675 (v!15014 V!37883)) (EmptyCell!11675) )
))
(declare-datatypes ((array!65709 0))(
  ( (array!65710 (arr!31609 (Array (_ BitVec 32) (_ BitVec 64))) (size!32143 (_ BitVec 32))) )
))
(declare-datatypes ((array!65711 0))(
  ( (array!65712 (arr!31610 (Array (_ BitVec 32) ValueCell!11675)) (size!32144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5944 0))(
  ( (LongMapFixedSize!5945 (defaultEntry!6354 Int) (mask!30443 (_ BitVec 32)) (extraKeys!6082 (_ BitVec 32)) (zeroValue!6188 V!37883) (minValue!6188 V!37883) (_size!3027 (_ BitVec 32)) (_keys!11628 array!65709) (_values!6377 array!65711) (_vacant!3027 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5944)

(declare-fun mapDefault!38730 () ValueCell!11675)

(assert (=> b!1042768 (= condMapEmpty!38730 (= (arr!31610 (_values!6377 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11675)) mapDefault!38730)))))

(declare-fun b!1042769 () Bool)

(declare-fun e!590625 () Bool)

(declare-fun tp_is_empty!24757 () Bool)

(assert (=> b!1042769 (= e!590625 tp_is_empty!24757)))

(declare-fun b!1042770 () Bool)

(assert (=> b!1042770 (= e!590630 tp_is_empty!24757)))

(declare-fun b!1042771 () Bool)

(declare-fun e!590628 () Bool)

(assert (=> b!1042771 (= e!590628 (or (not (= (size!32144 (_values!6377 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30443 thiss!1427)))) (not (= (size!32143 (_keys!11628 thiss!1427)) (size!32144 (_values!6377 thiss!1427)))) (bvsge (mask!30443 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38730 () Bool)

(assert (=> mapIsEmpty!38730 mapRes!38730))

(declare-fun res!694641 () Bool)

(assert (=> start!91574 (=> (not res!694641) (not e!590626))))

(declare-fun valid!2239 (LongMapFixedSize!5944) Bool)

(assert (=> start!91574 (= res!694641 (valid!2239 thiss!1427))))

(assert (=> start!91574 e!590626))

(declare-fun e!590631 () Bool)

(assert (=> start!91574 e!590631))

(assert (=> start!91574 true))

(declare-fun b!1042772 () Bool)

(declare-fun e!590627 () Bool)

(assert (=> b!1042772 (= e!590626 e!590627)))

(declare-fun res!694638 () Bool)

(assert (=> b!1042772 (=> (not res!694638) (not e!590627))))

(declare-datatypes ((SeekEntryResult!9762 0))(
  ( (MissingZero!9762 (index!41419 (_ BitVec 32))) (Found!9762 (index!41420 (_ BitVec 32))) (Intermediate!9762 (undefined!10574 Bool) (index!41421 (_ BitVec 32)) (x!92954 (_ BitVec 32))) (Undefined!9762) (MissingVacant!9762 (index!41422 (_ BitVec 32))) )
))
(declare-fun lt!459525 () SeekEntryResult!9762)

(get-info :version)

(assert (=> b!1042772 (= res!694638 ((_ is Found!9762) lt!459525))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65709 (_ BitVec 32)) SeekEntryResult!9762)

(assert (=> b!1042772 (= lt!459525 (seekEntry!0 key!909 (_keys!11628 thiss!1427) (mask!30443 thiss!1427)))))

(declare-fun b!1042773 () Bool)

(assert (=> b!1042773 (= e!590627 (not e!590628))))

(declare-fun res!694639 () Bool)

(assert (=> b!1042773 (=> res!694639 e!590628)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042773 (= res!694639 (not (validMask!0 (mask!30443 thiss!1427))))))

(declare-fun lt!459526 () array!65709)

(declare-fun arrayContainsKey!0 (array!65709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042773 (not (arrayContainsKey!0 lt!459526 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34039 0))(
  ( (Unit!34040) )
))
(declare-fun lt!459527 () Unit!34039)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65709 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> b!1042773 (= lt!459527 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65709 (_ BitVec 32)) Bool)

(assert (=> b!1042773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459526 (mask!30443 thiss!1427))))

(declare-fun lt!459524 () Unit!34039)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65709 (_ BitVec 32) (_ BitVec 32)) Unit!34039)

(assert (=> b!1042773 (= lt!459524 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) (mask!30443 thiss!1427)))))

(declare-datatypes ((List!21957 0))(
  ( (Nil!21954) (Cons!21953 (h!23168 (_ BitVec 64)) (t!31163 List!21957)) )
))
(declare-fun arrayNoDuplicates!0 (array!65709 (_ BitVec 32) List!21957) Bool)

(assert (=> b!1042773 (arrayNoDuplicates!0 lt!459526 #b00000000000000000000000000000000 Nil!21954)))

(declare-fun lt!459529 () Unit!34039)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21957) Unit!34039)

(assert (=> b!1042773 (= lt!459529 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11628 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41420 lt!459525) #b00000000000000000000000000000000 Nil!21954))))

(declare-fun arrayCountValidKeys!0 (array!65709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042773 (= (arrayCountValidKeys!0 lt!459526 #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042773 (= lt!459526 (array!65710 (store (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32143 (_keys!11628 thiss!1427))))))

(declare-fun lt!459528 () Unit!34039)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65709 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> b!1042773 (= lt!459528 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38730 () Bool)

(declare-fun tp!74323 () Bool)

(assert (=> mapNonEmpty!38730 (= mapRes!38730 (and tp!74323 e!590625))))

(declare-fun mapRest!38730 () (Array (_ BitVec 32) ValueCell!11675))

(declare-fun mapValue!38730 () ValueCell!11675)

(declare-fun mapKey!38730 () (_ BitVec 32))

(assert (=> mapNonEmpty!38730 (= (arr!31610 (_values!6377 thiss!1427)) (store mapRest!38730 mapKey!38730 mapValue!38730))))

(declare-fun array_inv!24437 (array!65709) Bool)

(declare-fun array_inv!24438 (array!65711) Bool)

(assert (=> b!1042774 (= e!590631 (and tp!74322 tp_is_empty!24757 (array_inv!24437 (_keys!11628 thiss!1427)) (array_inv!24438 (_values!6377 thiss!1427)) e!590624))))

(assert (= (and start!91574 res!694641) b!1042767))

(assert (= (and b!1042767 res!694640) b!1042772))

(assert (= (and b!1042772 res!694638) b!1042773))

(assert (= (and b!1042773 (not res!694639)) b!1042771))

(assert (= (and b!1042768 condMapEmpty!38730) mapIsEmpty!38730))

(assert (= (and b!1042768 (not condMapEmpty!38730)) mapNonEmpty!38730))

(assert (= (and mapNonEmpty!38730 ((_ is ValueCellFull!11675) mapValue!38730)) b!1042769))

(assert (= (and b!1042768 ((_ is ValueCellFull!11675) mapDefault!38730)) b!1042770))

(assert (= b!1042774 b!1042768))

(assert (= start!91574 b!1042774))

(declare-fun m!962539 () Bool)

(assert (=> b!1042772 m!962539))

(declare-fun m!962541 () Bool)

(assert (=> mapNonEmpty!38730 m!962541))

(declare-fun m!962543 () Bool)

(assert (=> start!91574 m!962543))

(declare-fun m!962545 () Bool)

(assert (=> b!1042773 m!962545))

(declare-fun m!962547 () Bool)

(assert (=> b!1042773 m!962547))

(declare-fun m!962549 () Bool)

(assert (=> b!1042773 m!962549))

(declare-fun m!962551 () Bool)

(assert (=> b!1042773 m!962551))

(declare-fun m!962553 () Bool)

(assert (=> b!1042773 m!962553))

(declare-fun m!962555 () Bool)

(assert (=> b!1042773 m!962555))

(declare-fun m!962557 () Bool)

(assert (=> b!1042773 m!962557))

(declare-fun m!962559 () Bool)

(assert (=> b!1042773 m!962559))

(declare-fun m!962561 () Bool)

(assert (=> b!1042773 m!962561))

(declare-fun m!962563 () Bool)

(assert (=> b!1042773 m!962563))

(declare-fun m!962565 () Bool)

(assert (=> b!1042773 m!962565))

(declare-fun m!962567 () Bool)

(assert (=> b!1042774 m!962567))

(declare-fun m!962569 () Bool)

(assert (=> b!1042774 m!962569))

(check-sat (not b!1042773) tp_is_empty!24757 (not mapNonEmpty!38730) (not start!91574) b_and!33579 (not b!1042774) (not b!1042772) (not b_next!21037))
(check-sat b_and!33579 (not b_next!21037))
(get-model)

(declare-fun d!126349 () Bool)

(declare-fun res!694672 () Bool)

(declare-fun e!590682 () Bool)

(assert (=> d!126349 (=> (not res!694672) (not e!590682))))

(declare-fun simpleValid!438 (LongMapFixedSize!5944) Bool)

(assert (=> d!126349 (= res!694672 (simpleValid!438 thiss!1427))))

(assert (=> d!126349 (= (valid!2239 thiss!1427) e!590682)))

(declare-fun b!1042829 () Bool)

(declare-fun res!694673 () Bool)

(assert (=> b!1042829 (=> (not res!694673) (not e!590682))))

(assert (=> b!1042829 (= res!694673 (= (arrayCountValidKeys!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) (_size!3027 thiss!1427)))))

(declare-fun b!1042830 () Bool)

(declare-fun res!694674 () Bool)

(assert (=> b!1042830 (=> (not res!694674) (not e!590682))))

(assert (=> b!1042830 (= res!694674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11628 thiss!1427) (mask!30443 thiss!1427)))))

(declare-fun b!1042831 () Bool)

(assert (=> b!1042831 (= e!590682 (arrayNoDuplicates!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 Nil!21954))))

(assert (= (and d!126349 res!694672) b!1042829))

(assert (= (and b!1042829 res!694673) b!1042830))

(assert (= (and b!1042830 res!694674) b!1042831))

(declare-fun m!962635 () Bool)

(assert (=> d!126349 m!962635))

(assert (=> b!1042829 m!962561))

(declare-fun m!962637 () Bool)

(assert (=> b!1042830 m!962637))

(declare-fun m!962639 () Bool)

(assert (=> b!1042831 m!962639))

(assert (=> start!91574 d!126349))

(declare-fun b!1042844 () Bool)

(declare-fun e!590689 () SeekEntryResult!9762)

(declare-fun e!590690 () SeekEntryResult!9762)

(assert (=> b!1042844 (= e!590689 e!590690)))

(declare-fun lt!459576 () (_ BitVec 64))

(declare-fun lt!459574 () SeekEntryResult!9762)

(assert (=> b!1042844 (= lt!459576 (select (arr!31609 (_keys!11628 thiss!1427)) (index!41421 lt!459574)))))

(declare-fun c!106078 () Bool)

(assert (=> b!1042844 (= c!106078 (= lt!459576 key!909))))

(declare-fun b!1042845 () Bool)

(declare-fun c!106080 () Bool)

(assert (=> b!1042845 (= c!106080 (= lt!459576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590691 () SeekEntryResult!9762)

(assert (=> b!1042845 (= e!590690 e!590691)))

(declare-fun b!1042846 () Bool)

(assert (=> b!1042846 (= e!590691 (MissingZero!9762 (index!41421 lt!459574)))))

(declare-fun d!126351 () Bool)

(declare-fun lt!459577 () SeekEntryResult!9762)

(assert (=> d!126351 (and (or ((_ is MissingVacant!9762) lt!459577) (not ((_ is Found!9762) lt!459577)) (and (bvsge (index!41420 lt!459577) #b00000000000000000000000000000000) (bvslt (index!41420 lt!459577) (size!32143 (_keys!11628 thiss!1427))))) (not ((_ is MissingVacant!9762) lt!459577)) (or (not ((_ is Found!9762) lt!459577)) (= (select (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459577)) key!909)))))

(assert (=> d!126351 (= lt!459577 e!590689)))

(declare-fun c!106079 () Bool)

(assert (=> d!126351 (= c!106079 (and ((_ is Intermediate!9762) lt!459574) (undefined!10574 lt!459574)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65709 (_ BitVec 32)) SeekEntryResult!9762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126351 (= lt!459574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30443 thiss!1427)) key!909 (_keys!11628 thiss!1427) (mask!30443 thiss!1427)))))

(assert (=> d!126351 (validMask!0 (mask!30443 thiss!1427))))

(assert (=> d!126351 (= (seekEntry!0 key!909 (_keys!11628 thiss!1427) (mask!30443 thiss!1427)) lt!459577)))

(declare-fun b!1042847 () Bool)

(assert (=> b!1042847 (= e!590689 Undefined!9762)))

(declare-fun b!1042848 () Bool)

(assert (=> b!1042848 (= e!590690 (Found!9762 (index!41421 lt!459574)))))

(declare-fun b!1042849 () Bool)

(declare-fun lt!459575 () SeekEntryResult!9762)

(assert (=> b!1042849 (= e!590691 (ite ((_ is MissingVacant!9762) lt!459575) (MissingZero!9762 (index!41422 lt!459575)) lt!459575))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65709 (_ BitVec 32)) SeekEntryResult!9762)

(assert (=> b!1042849 (= lt!459575 (seekKeyOrZeroReturnVacant!0 (x!92954 lt!459574) (index!41421 lt!459574) (index!41421 lt!459574) key!909 (_keys!11628 thiss!1427) (mask!30443 thiss!1427)))))

(assert (= (and d!126351 c!106079) b!1042847))

(assert (= (and d!126351 (not c!106079)) b!1042844))

(assert (= (and b!1042844 c!106078) b!1042848))

(assert (= (and b!1042844 (not c!106078)) b!1042845))

(assert (= (and b!1042845 c!106080) b!1042846))

(assert (= (and b!1042845 (not c!106080)) b!1042849))

(declare-fun m!962641 () Bool)

(assert (=> b!1042844 m!962641))

(declare-fun m!962643 () Bool)

(assert (=> d!126351 m!962643))

(declare-fun m!962645 () Bool)

(assert (=> d!126351 m!962645))

(assert (=> d!126351 m!962645))

(declare-fun m!962647 () Bool)

(assert (=> d!126351 m!962647))

(assert (=> d!126351 m!962549))

(declare-fun m!962649 () Bool)

(assert (=> b!1042849 m!962649))

(assert (=> b!1042772 d!126351))

(declare-fun b!1042858 () Bool)

(declare-fun e!590698 () Bool)

(declare-fun call!44185 () Bool)

(assert (=> b!1042858 (= e!590698 call!44185)))

(declare-fun b!1042859 () Bool)

(declare-fun e!590699 () Bool)

(assert (=> b!1042859 (= e!590699 call!44185)))

(declare-fun b!1042860 () Bool)

(assert (=> b!1042860 (= e!590699 e!590698)))

(declare-fun lt!459585 () (_ BitVec 64))

(assert (=> b!1042860 (= lt!459585 (select (arr!31609 lt!459526) #b00000000000000000000000000000000))))

(declare-fun lt!459586 () Unit!34039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65709 (_ BitVec 64) (_ BitVec 32)) Unit!34039)

(assert (=> b!1042860 (= lt!459586 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459526 lt!459585 #b00000000000000000000000000000000))))

(assert (=> b!1042860 (arrayContainsKey!0 lt!459526 lt!459585 #b00000000000000000000000000000000)))

(declare-fun lt!459584 () Unit!34039)

(assert (=> b!1042860 (= lt!459584 lt!459586)))

(declare-fun res!694679 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65709 (_ BitVec 32)) SeekEntryResult!9762)

(assert (=> b!1042860 (= res!694679 (= (seekEntryOrOpen!0 (select (arr!31609 lt!459526) #b00000000000000000000000000000000) lt!459526 (mask!30443 thiss!1427)) (Found!9762 #b00000000000000000000000000000000)))))

(assert (=> b!1042860 (=> (not res!694679) (not e!590698))))

(declare-fun b!1042861 () Bool)

(declare-fun e!590700 () Bool)

(assert (=> b!1042861 (= e!590700 e!590699)))

(declare-fun c!106083 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042861 (= c!106083 (validKeyInArray!0 (select (arr!31609 lt!459526) #b00000000000000000000000000000000)))))

(declare-fun bm!44182 () Bool)

(assert (=> bm!44182 (= call!44185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459526 (mask!30443 thiss!1427)))))

(declare-fun d!126353 () Bool)

(declare-fun res!694680 () Bool)

(assert (=> d!126353 (=> res!694680 e!590700)))

(assert (=> d!126353 (= res!694680 (bvsge #b00000000000000000000000000000000 (size!32143 lt!459526)))))

(assert (=> d!126353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459526 (mask!30443 thiss!1427)) e!590700)))

(assert (= (and d!126353 (not res!694680)) b!1042861))

(assert (= (and b!1042861 c!106083) b!1042860))

(assert (= (and b!1042861 (not c!106083)) b!1042859))

(assert (= (and b!1042860 res!694679) b!1042858))

(assert (= (or b!1042858 b!1042859) bm!44182))

(declare-fun m!962651 () Bool)

(assert (=> b!1042860 m!962651))

(declare-fun m!962653 () Bool)

(assert (=> b!1042860 m!962653))

(declare-fun m!962655 () Bool)

(assert (=> b!1042860 m!962655))

(assert (=> b!1042860 m!962651))

(declare-fun m!962657 () Bool)

(assert (=> b!1042860 m!962657))

(assert (=> b!1042861 m!962651))

(assert (=> b!1042861 m!962651))

(declare-fun m!962659 () Bool)

(assert (=> b!1042861 m!962659))

(declare-fun m!962661 () Bool)

(assert (=> bm!44182 m!962661))

(assert (=> b!1042773 d!126353))

(declare-fun b!1042873 () Bool)

(declare-fun e!590705 () Bool)

(assert (=> b!1042873 (= e!590705 (= (arrayCountValidKeys!0 (array!65710 (store (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32143 (_keys!11628 thiss!1427))) #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126355 () Bool)

(assert (=> d!126355 e!590705))

(declare-fun res!694690 () Bool)

(assert (=> d!126355 (=> (not res!694690) (not e!590705))))

(assert (=> d!126355 (= res!694690 (and (bvsge (index!41420 lt!459525) #b00000000000000000000000000000000) (bvslt (index!41420 lt!459525) (size!32143 (_keys!11628 thiss!1427)))))))

(declare-fun lt!459589 () Unit!34039)

(declare-fun choose!82 (array!65709 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> d!126355 (= lt!459589 (choose!82 (_keys!11628 thiss!1427) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590706 () Bool)

(assert (=> d!126355 e!590706))

(declare-fun res!694689 () Bool)

(assert (=> d!126355 (=> (not res!694689) (not e!590706))))

(assert (=> d!126355 (= res!694689 (and (bvsge (index!41420 lt!459525) #b00000000000000000000000000000000) (bvslt (index!41420 lt!459525) (size!32143 (_keys!11628 thiss!1427)))))))

(assert (=> d!126355 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459589)))

(declare-fun b!1042870 () Bool)

(declare-fun res!694692 () Bool)

(assert (=> b!1042870 (=> (not res!694692) (not e!590706))))

(assert (=> b!1042870 (= res!694692 (validKeyInArray!0 (select (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525))))))

(declare-fun b!1042871 () Bool)

(declare-fun res!694691 () Bool)

(assert (=> b!1042871 (=> (not res!694691) (not e!590706))))

(assert (=> b!1042871 (= res!694691 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1042872 () Bool)

(assert (=> b!1042872 (= e!590706 (bvslt (size!32143 (_keys!11628 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126355 res!694689) b!1042870))

(assert (= (and b!1042870 res!694692) b!1042871))

(assert (= (and b!1042871 res!694691) b!1042872))

(assert (= (and d!126355 res!694690) b!1042873))

(assert (=> b!1042873 m!962563))

(declare-fun m!962663 () Bool)

(assert (=> b!1042873 m!962663))

(assert (=> b!1042873 m!962561))

(declare-fun m!962665 () Bool)

(assert (=> d!126355 m!962665))

(declare-fun m!962667 () Bool)

(assert (=> b!1042870 m!962667))

(assert (=> b!1042870 m!962667))

(declare-fun m!962669 () Bool)

(assert (=> b!1042870 m!962669))

(declare-fun m!962671 () Bool)

(assert (=> b!1042871 m!962671))

(assert (=> b!1042773 d!126355))

(declare-fun d!126357 () Bool)

(declare-fun e!590709 () Bool)

(assert (=> d!126357 e!590709))

(declare-fun res!694695 () Bool)

(assert (=> d!126357 (=> (not res!694695) (not e!590709))))

(assert (=> d!126357 (= res!694695 (and (bvsge (index!41420 lt!459525) #b00000000000000000000000000000000) (bvslt (index!41420 lt!459525) (size!32143 (_keys!11628 thiss!1427)))))))

(declare-fun lt!459592 () Unit!34039)

(declare-fun choose!53 (array!65709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21957) Unit!34039)

(assert (=> d!126357 (= lt!459592 (choose!53 (_keys!11628 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41420 lt!459525) #b00000000000000000000000000000000 Nil!21954))))

(assert (=> d!126357 (bvslt (size!32143 (_keys!11628 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126357 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11628 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41420 lt!459525) #b00000000000000000000000000000000 Nil!21954) lt!459592)))

(declare-fun b!1042876 () Bool)

(assert (=> b!1042876 (= e!590709 (arrayNoDuplicates!0 (array!65710 (store (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32143 (_keys!11628 thiss!1427))) #b00000000000000000000000000000000 Nil!21954))))

(assert (= (and d!126357 res!694695) b!1042876))

(declare-fun m!962673 () Bool)

(assert (=> d!126357 m!962673))

(assert (=> b!1042876 m!962563))

(declare-fun m!962675 () Bool)

(assert (=> b!1042876 m!962675))

(assert (=> b!1042773 d!126357))

(declare-fun b!1042885 () Bool)

(declare-fun e!590715 () (_ BitVec 32))

(declare-fun call!44188 () (_ BitVec 32))

(assert (=> b!1042885 (= e!590715 (bvadd #b00000000000000000000000000000001 call!44188))))

(declare-fun bm!44185 () Bool)

(assert (=> bm!44185 (= call!44188 (arrayCountValidKeys!0 lt!459526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32143 (_keys!11628 thiss!1427))))))

(declare-fun d!126359 () Bool)

(declare-fun lt!459595 () (_ BitVec 32))

(assert (=> d!126359 (and (bvsge lt!459595 #b00000000000000000000000000000000) (bvsle lt!459595 (bvsub (size!32143 lt!459526) #b00000000000000000000000000000000)))))

(declare-fun e!590714 () (_ BitVec 32))

(assert (=> d!126359 (= lt!459595 e!590714)))

(declare-fun c!106089 () Bool)

(assert (=> d!126359 (= c!106089 (bvsge #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))))))

(assert (=> d!126359 (and (bvsle #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32143 (_keys!11628 thiss!1427)) (size!32143 lt!459526)))))

(assert (=> d!126359 (= (arrayCountValidKeys!0 lt!459526 #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) lt!459595)))

(declare-fun b!1042886 () Bool)

(assert (=> b!1042886 (= e!590714 #b00000000000000000000000000000000)))

(declare-fun b!1042887 () Bool)

(assert (=> b!1042887 (= e!590715 call!44188)))

(declare-fun b!1042888 () Bool)

(assert (=> b!1042888 (= e!590714 e!590715)))

(declare-fun c!106088 () Bool)

(assert (=> b!1042888 (= c!106088 (validKeyInArray!0 (select (arr!31609 lt!459526) #b00000000000000000000000000000000)))))

(assert (= (and d!126359 c!106089) b!1042886))

(assert (= (and d!126359 (not c!106089)) b!1042888))

(assert (= (and b!1042888 c!106088) b!1042885))

(assert (= (and b!1042888 (not c!106088)) b!1042887))

(assert (= (or b!1042885 b!1042887) bm!44185))

(declare-fun m!962677 () Bool)

(assert (=> bm!44185 m!962677))

(assert (=> b!1042888 m!962651))

(assert (=> b!1042888 m!962651))

(assert (=> b!1042888 m!962659))

(assert (=> b!1042773 d!126359))

(declare-fun b!1042889 () Bool)

(declare-fun e!590717 () (_ BitVec 32))

(declare-fun call!44189 () (_ BitVec 32))

(assert (=> b!1042889 (= e!590717 (bvadd #b00000000000000000000000000000001 call!44189))))

(declare-fun bm!44186 () Bool)

(assert (=> bm!44186 (= call!44189 (arrayCountValidKeys!0 (_keys!11628 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32143 (_keys!11628 thiss!1427))))))

(declare-fun d!126361 () Bool)

(declare-fun lt!459596 () (_ BitVec 32))

(assert (=> d!126361 (and (bvsge lt!459596 #b00000000000000000000000000000000) (bvsle lt!459596 (bvsub (size!32143 (_keys!11628 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590716 () (_ BitVec 32))

(assert (=> d!126361 (= lt!459596 e!590716)))

(declare-fun c!106091 () Bool)

(assert (=> d!126361 (= c!106091 (bvsge #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))))))

(assert (=> d!126361 (and (bvsle #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32143 (_keys!11628 thiss!1427)) (size!32143 (_keys!11628 thiss!1427))))))

(assert (=> d!126361 (= (arrayCountValidKeys!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 (size!32143 (_keys!11628 thiss!1427))) lt!459596)))

(declare-fun b!1042890 () Bool)

(assert (=> b!1042890 (= e!590716 #b00000000000000000000000000000000)))

(declare-fun b!1042891 () Bool)

(assert (=> b!1042891 (= e!590717 call!44189)))

(declare-fun b!1042892 () Bool)

(assert (=> b!1042892 (= e!590716 e!590717)))

(declare-fun c!106090 () Bool)

(assert (=> b!1042892 (= c!106090 (validKeyInArray!0 (select (arr!31609 (_keys!11628 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126361 c!106091) b!1042890))

(assert (= (and d!126361 (not c!106091)) b!1042892))

(assert (= (and b!1042892 c!106090) b!1042889))

(assert (= (and b!1042892 (not c!106090)) b!1042891))

(assert (= (or b!1042889 b!1042891) bm!44186))

(declare-fun m!962679 () Bool)

(assert (=> bm!44186 m!962679))

(declare-fun m!962681 () Bool)

(assert (=> b!1042892 m!962681))

(assert (=> b!1042892 m!962681))

(declare-fun m!962683 () Bool)

(assert (=> b!1042892 m!962683))

(assert (=> b!1042773 d!126361))

(declare-fun d!126363 () Bool)

(declare-fun res!694700 () Bool)

(declare-fun e!590722 () Bool)

(assert (=> d!126363 (=> res!694700 e!590722)))

(assert (=> d!126363 (= res!694700 (= (select (arr!31609 lt!459526) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126363 (= (arrayContainsKey!0 lt!459526 key!909 #b00000000000000000000000000000000) e!590722)))

(declare-fun b!1042897 () Bool)

(declare-fun e!590723 () Bool)

(assert (=> b!1042897 (= e!590722 e!590723)))

(declare-fun res!694701 () Bool)

(assert (=> b!1042897 (=> (not res!694701) (not e!590723))))

(assert (=> b!1042897 (= res!694701 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32143 lt!459526)))))

(declare-fun b!1042898 () Bool)

(assert (=> b!1042898 (= e!590723 (arrayContainsKey!0 lt!459526 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126363 (not res!694700)) b!1042897))

(assert (= (and b!1042897 res!694701) b!1042898))

(assert (=> d!126363 m!962651))

(declare-fun m!962685 () Bool)

(assert (=> b!1042898 m!962685))

(assert (=> b!1042773 d!126363))

(declare-fun bm!44189 () Bool)

(declare-fun call!44192 () Bool)

(declare-fun c!106094 () Bool)

(assert (=> bm!44189 (= call!44192 (arrayNoDuplicates!0 lt!459526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106094 (Cons!21953 (select (arr!31609 lt!459526) #b00000000000000000000000000000000) Nil!21954) Nil!21954)))))

(declare-fun b!1042909 () Bool)

(declare-fun e!590734 () Bool)

(declare-fun e!590732 () Bool)

(assert (=> b!1042909 (= e!590734 e!590732)))

(assert (=> b!1042909 (= c!106094 (validKeyInArray!0 (select (arr!31609 lt!459526) #b00000000000000000000000000000000)))))

(declare-fun b!1042910 () Bool)

(declare-fun e!590735 () Bool)

(assert (=> b!1042910 (= e!590735 e!590734)))

(declare-fun res!694708 () Bool)

(assert (=> b!1042910 (=> (not res!694708) (not e!590734))))

(declare-fun e!590733 () Bool)

(assert (=> b!1042910 (= res!694708 (not e!590733))))

(declare-fun res!694710 () Bool)

(assert (=> b!1042910 (=> (not res!694710) (not e!590733))))

(assert (=> b!1042910 (= res!694710 (validKeyInArray!0 (select (arr!31609 lt!459526) #b00000000000000000000000000000000)))))

(declare-fun b!1042911 () Bool)

(assert (=> b!1042911 (= e!590732 call!44192)))

(declare-fun b!1042912 () Bool)

(declare-fun contains!6080 (List!21957 (_ BitVec 64)) Bool)

(assert (=> b!1042912 (= e!590733 (contains!6080 Nil!21954 (select (arr!31609 lt!459526) #b00000000000000000000000000000000)))))

(declare-fun d!126365 () Bool)

(declare-fun res!694709 () Bool)

(assert (=> d!126365 (=> res!694709 e!590735)))

(assert (=> d!126365 (= res!694709 (bvsge #b00000000000000000000000000000000 (size!32143 lt!459526)))))

(assert (=> d!126365 (= (arrayNoDuplicates!0 lt!459526 #b00000000000000000000000000000000 Nil!21954) e!590735)))

(declare-fun b!1042913 () Bool)

(assert (=> b!1042913 (= e!590732 call!44192)))

(assert (= (and d!126365 (not res!694709)) b!1042910))

(assert (= (and b!1042910 res!694710) b!1042912))

(assert (= (and b!1042910 res!694708) b!1042909))

(assert (= (and b!1042909 c!106094) b!1042913))

(assert (= (and b!1042909 (not c!106094)) b!1042911))

(assert (= (or b!1042913 b!1042911) bm!44189))

(assert (=> bm!44189 m!962651))

(declare-fun m!962687 () Bool)

(assert (=> bm!44189 m!962687))

(assert (=> b!1042909 m!962651))

(assert (=> b!1042909 m!962651))

(assert (=> b!1042909 m!962659))

(assert (=> b!1042910 m!962651))

(assert (=> b!1042910 m!962651))

(assert (=> b!1042910 m!962659))

(assert (=> b!1042912 m!962651))

(assert (=> b!1042912 m!962651))

(declare-fun m!962689 () Bool)

(assert (=> b!1042912 m!962689))

(assert (=> b!1042773 d!126365))

(declare-fun d!126367 () Bool)

(assert (=> d!126367 (= (validMask!0 (mask!30443 thiss!1427)) (and (or (= (mask!30443 thiss!1427) #b00000000000000000000000000000111) (= (mask!30443 thiss!1427) #b00000000000000000000000000001111) (= (mask!30443 thiss!1427) #b00000000000000000000000000011111) (= (mask!30443 thiss!1427) #b00000000000000000000000000111111) (= (mask!30443 thiss!1427) #b00000000000000000000000001111111) (= (mask!30443 thiss!1427) #b00000000000000000000000011111111) (= (mask!30443 thiss!1427) #b00000000000000000000000111111111) (= (mask!30443 thiss!1427) #b00000000000000000000001111111111) (= (mask!30443 thiss!1427) #b00000000000000000000011111111111) (= (mask!30443 thiss!1427) #b00000000000000000000111111111111) (= (mask!30443 thiss!1427) #b00000000000000000001111111111111) (= (mask!30443 thiss!1427) #b00000000000000000011111111111111) (= (mask!30443 thiss!1427) #b00000000000000000111111111111111) (= (mask!30443 thiss!1427) #b00000000000000001111111111111111) (= (mask!30443 thiss!1427) #b00000000000000011111111111111111) (= (mask!30443 thiss!1427) #b00000000000000111111111111111111) (= (mask!30443 thiss!1427) #b00000000000001111111111111111111) (= (mask!30443 thiss!1427) #b00000000000011111111111111111111) (= (mask!30443 thiss!1427) #b00000000000111111111111111111111) (= (mask!30443 thiss!1427) #b00000000001111111111111111111111) (= (mask!30443 thiss!1427) #b00000000011111111111111111111111) (= (mask!30443 thiss!1427) #b00000000111111111111111111111111) (= (mask!30443 thiss!1427) #b00000001111111111111111111111111) (= (mask!30443 thiss!1427) #b00000011111111111111111111111111) (= (mask!30443 thiss!1427) #b00000111111111111111111111111111) (= (mask!30443 thiss!1427) #b00001111111111111111111111111111) (= (mask!30443 thiss!1427) #b00011111111111111111111111111111) (= (mask!30443 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30443 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042773 d!126367))

(declare-fun d!126369 () Bool)

(declare-fun e!590738 () Bool)

(assert (=> d!126369 e!590738))

(declare-fun res!694713 () Bool)

(assert (=> d!126369 (=> (not res!694713) (not e!590738))))

(assert (=> d!126369 (= res!694713 (bvslt (index!41420 lt!459525) (size!32143 (_keys!11628 thiss!1427))))))

(declare-fun lt!459599 () Unit!34039)

(declare-fun choose!121 (array!65709 (_ BitVec 32) (_ BitVec 64)) Unit!34039)

(assert (=> d!126369 (= lt!459599 (choose!121 (_keys!11628 thiss!1427) (index!41420 lt!459525) key!909))))

(assert (=> d!126369 (bvsge (index!41420 lt!459525) #b00000000000000000000000000000000)))

(assert (=> d!126369 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) key!909) lt!459599)))

(declare-fun b!1042916 () Bool)

(assert (=> b!1042916 (= e!590738 (not (arrayContainsKey!0 (array!65710 (store (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32143 (_keys!11628 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126369 res!694713) b!1042916))

(declare-fun m!962691 () Bool)

(assert (=> d!126369 m!962691))

(assert (=> b!1042916 m!962563))

(declare-fun m!962693 () Bool)

(assert (=> b!1042916 m!962693))

(assert (=> b!1042773 d!126369))

(declare-fun d!126371 () Bool)

(declare-fun e!590741 () Bool)

(assert (=> d!126371 e!590741))

(declare-fun res!694716 () Bool)

(assert (=> d!126371 (=> (not res!694716) (not e!590741))))

(assert (=> d!126371 (= res!694716 (and (bvsge (index!41420 lt!459525) #b00000000000000000000000000000000) (bvslt (index!41420 lt!459525) (size!32143 (_keys!11628 thiss!1427)))))))

(declare-fun lt!459602 () Unit!34039)

(declare-fun choose!25 (array!65709 (_ BitVec 32) (_ BitVec 32)) Unit!34039)

(assert (=> d!126371 (= lt!459602 (choose!25 (_keys!11628 thiss!1427) (index!41420 lt!459525) (mask!30443 thiss!1427)))))

(assert (=> d!126371 (validMask!0 (mask!30443 thiss!1427))))

(assert (=> d!126371 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11628 thiss!1427) (index!41420 lt!459525) (mask!30443 thiss!1427)) lt!459602)))

(declare-fun b!1042919 () Bool)

(assert (=> b!1042919 (= e!590741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65710 (store (arr!31609 (_keys!11628 thiss!1427)) (index!41420 lt!459525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32143 (_keys!11628 thiss!1427))) (mask!30443 thiss!1427)))))

(assert (= (and d!126371 res!694716) b!1042919))

(declare-fun m!962695 () Bool)

(assert (=> d!126371 m!962695))

(assert (=> d!126371 m!962549))

(assert (=> b!1042919 m!962563))

(declare-fun m!962697 () Bool)

(assert (=> b!1042919 m!962697))

(assert (=> b!1042773 d!126371))

(declare-fun d!126373 () Bool)

(assert (=> d!126373 (= (array_inv!24437 (_keys!11628 thiss!1427)) (bvsge (size!32143 (_keys!11628 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042774 d!126373))

(declare-fun d!126375 () Bool)

(assert (=> d!126375 (= (array_inv!24438 (_values!6377 thiss!1427)) (bvsge (size!32144 (_values!6377 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042774 d!126375))

(declare-fun b!1042927 () Bool)

(declare-fun e!590746 () Bool)

(assert (=> b!1042927 (= e!590746 tp_is_empty!24757)))

(declare-fun mapIsEmpty!38739 () Bool)

(declare-fun mapRes!38739 () Bool)

(assert (=> mapIsEmpty!38739 mapRes!38739))

(declare-fun b!1042926 () Bool)

(declare-fun e!590747 () Bool)

(assert (=> b!1042926 (= e!590747 tp_is_empty!24757)))

(declare-fun mapNonEmpty!38739 () Bool)

(declare-fun tp!74338 () Bool)

(assert (=> mapNonEmpty!38739 (= mapRes!38739 (and tp!74338 e!590747))))

(declare-fun mapKey!38739 () (_ BitVec 32))

(declare-fun mapValue!38739 () ValueCell!11675)

(declare-fun mapRest!38739 () (Array (_ BitVec 32) ValueCell!11675))

(assert (=> mapNonEmpty!38739 (= mapRest!38730 (store mapRest!38739 mapKey!38739 mapValue!38739))))

(declare-fun condMapEmpty!38739 () Bool)

(declare-fun mapDefault!38739 () ValueCell!11675)

(assert (=> mapNonEmpty!38730 (= condMapEmpty!38739 (= mapRest!38730 ((as const (Array (_ BitVec 32) ValueCell!11675)) mapDefault!38739)))))

(assert (=> mapNonEmpty!38730 (= tp!74323 (and e!590746 mapRes!38739))))

(assert (= (and mapNonEmpty!38730 condMapEmpty!38739) mapIsEmpty!38739))

(assert (= (and mapNonEmpty!38730 (not condMapEmpty!38739)) mapNonEmpty!38739))

(assert (= (and mapNonEmpty!38739 ((_ is ValueCellFull!11675) mapValue!38739)) b!1042926))

(assert (= (and mapNonEmpty!38730 ((_ is ValueCellFull!11675) mapDefault!38739)) b!1042927))

(declare-fun m!962699 () Bool)

(assert (=> mapNonEmpty!38739 m!962699))

(check-sat (not b!1042871) (not b!1042870) tp_is_empty!24757 (not d!126357) (not bm!44185) (not b!1042898) (not b!1042831) (not mapNonEmpty!38739) (not b!1042830) (not b_next!21037) (not b!1042910) (not d!126369) (not b!1042873) (not b!1042892) (not d!126355) (not d!126349) (not b!1042888) (not b!1042919) (not b!1042909) (not bm!44186) (not bm!44182) (not b!1042829) (not b!1042849) (not d!126371) (not b!1042916) b_and!33579 (not d!126351) (not bm!44189) (not b!1042912) (not b!1042861) (not b!1042876) (not b!1042860))
(check-sat b_and!33579 (not b_next!21037))
