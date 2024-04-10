; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89570 () Bool)

(assert start!89570)

(declare-fun b!1027481 () Bool)

(declare-fun b_free!20569 () Bool)

(declare-fun b_next!20569 () Bool)

(assert (=> b!1027481 (= b_free!20569 (not b_next!20569))))

(declare-fun tp!72752 () Bool)

(declare-fun b_and!32815 () Bool)

(assert (=> b!1027481 (= tp!72752 b_and!32815)))

(declare-datatypes ((V!37259 0))(
  ( (V!37260 (val!12195 Int)) )
))
(declare-datatypes ((ValueCell!11441 0))(
  ( (ValueCellFull!11441 (v!14764 V!37259)) (EmptyCell!11441) )
))
(declare-datatypes ((array!64628 0))(
  ( (array!64629 (arr!31123 (Array (_ BitVec 32) ValueCell!11441)) (size!31636 (_ BitVec 32))) )
))
(declare-fun lt!452295 () array!64628)

(declare-datatypes ((array!64630 0))(
  ( (array!64631 (arr!31124 (Array (_ BitVec 32) (_ BitVec 64))) (size!31637 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5476 0))(
  ( (LongMapFixedSize!5477 (defaultEntry!6090 Int) (mask!29808 (_ BitVec 32)) (extraKeys!5822 (_ BitVec 32)) (zeroValue!5926 V!37259) (minValue!5926 V!37259) (_size!2793 (_ BitVec 32)) (_keys!11237 array!64630) (_values!6113 array!64628) (_vacant!2793 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5476)

(declare-fun lt!452294 () array!64630)

(declare-fun e!579879 () Bool)

(declare-fun b!1027475 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-datatypes ((Unit!33485 0))(
  ( (Unit!33486) )
))
(declare-datatypes ((tuple2!15526 0))(
  ( (tuple2!15527 (_1!7774 Unit!33485) (_2!7774 LongMapFixedSize!5476)) )
))
(declare-fun Unit!33487 () Unit!33485)

(declare-fun Unit!33488 () Unit!33485)

(assert (=> b!1027475 (= e!579879 (not (validMask!0 (mask!29808 (_2!7774 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15527 Unit!33487 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29808 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452294 lt!452295 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15527 Unit!33488 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29808 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452294 lt!452295 (_vacant!2793 thiss!1427)))))))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15528 0))(
  ( (tuple2!15529 (_1!7775 (_ BitVec 64)) (_2!7775 V!37259)) )
))
(declare-datatypes ((List!21807 0))(
  ( (Nil!21804) (Cons!21803 (h!23001 tuple2!15528) (t!30871 List!21807)) )
))
(declare-datatypes ((ListLongMap!13667 0))(
  ( (ListLongMap!13668 (toList!6849 List!21807)) )
))
(declare-fun -!476 (ListLongMap!13667 (_ BitVec 64)) ListLongMap!13667)

(declare-fun getCurrentListMap!3897 (array!64630 array!64628 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) Int) ListLongMap!13667)

(assert (=> b!1027475 (= (-!476 (getCurrentListMap!3897 (_keys!11237 thiss!1427) (_values!6113 thiss!1427) (mask!29808 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) (getCurrentListMap!3897 lt!452294 lt!452295 (mask!29808 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9673 0))(
  ( (MissingZero!9673 (index!41063 (_ BitVec 32))) (Found!9673 (index!41064 (_ BitVec 32))) (Intermediate!9673 (undefined!10485 Bool) (index!41065 (_ BitVec 32)) (x!91433 (_ BitVec 32))) (Undefined!9673) (MissingVacant!9673 (index!41066 (_ BitVec 32))) )
))
(declare-fun lt!452290 () SeekEntryResult!9673)

(declare-fun dynLambda!1946 (Int (_ BitVec 64)) V!37259)

(assert (=> b!1027475 (= lt!452295 (array!64629 (store (arr!31123 (_values!6113 thiss!1427)) (index!41064 lt!452290) (ValueCellFull!11441 (dynLambda!1946 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31636 (_values!6113 thiss!1427))))))

(declare-fun lt!452291 () Unit!33485)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (array!64630 array!64628 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) (_ BitVec 64) Int) Unit!33485)

(assert (=> b!1027475 (= lt!452291 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (_keys!11237 thiss!1427) (_values!6113 thiss!1427) (mask!29808 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!41064 lt!452290) key!909 (defaultEntry!6090 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027475 (not (arrayContainsKey!0 lt!452294 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452288 () Unit!33485)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64630 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> b!1027475 (= lt!452288 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11237 thiss!1427) (index!41064 lt!452290) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64630 (_ BitVec 32)) Bool)

(assert (=> b!1027475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452294 (mask!29808 thiss!1427))))

(declare-fun lt!452292 () Unit!33485)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64630 (_ BitVec 32) (_ BitVec 32)) Unit!33485)

(assert (=> b!1027475 (= lt!452292 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11237 thiss!1427) (index!41064 lt!452290) (mask!29808 thiss!1427)))))

(declare-datatypes ((List!21808 0))(
  ( (Nil!21805) (Cons!21804 (h!23002 (_ BitVec 64)) (t!30872 List!21808)) )
))
(declare-fun arrayNoDuplicates!0 (array!64630 (_ BitVec 32) List!21808) Bool)

(assert (=> b!1027475 (arrayNoDuplicates!0 lt!452294 #b00000000000000000000000000000000 Nil!21805)))

(declare-fun lt!452293 () Unit!33485)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64630 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21808) Unit!33485)

(assert (=> b!1027475 (= lt!452293 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11237 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41064 lt!452290) #b00000000000000000000000000000000 Nil!21805))))

(declare-fun arrayCountValidKeys!0 (array!64630 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027475 (= (arrayCountValidKeys!0 lt!452294 #b00000000000000000000000000000000 (size!31637 (_keys!11237 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11237 thiss!1427) #b00000000000000000000000000000000 (size!31637 (_keys!11237 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027475 (= lt!452294 (array!64631 (store (arr!31124 (_keys!11237 thiss!1427)) (index!41064 lt!452290) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31637 (_keys!11237 thiss!1427))))))

(declare-fun lt!452289 () Unit!33485)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64630 (_ BitVec 32) (_ BitVec 64)) Unit!33485)

(assert (=> b!1027475 (= lt!452289 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11237 thiss!1427) (index!41064 lt!452290) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37862 () Bool)

(declare-fun mapRes!37862 () Bool)

(assert (=> mapIsEmpty!37862 mapRes!37862))

(declare-fun res!687724 () Bool)

(declare-fun e!579878 () Bool)

(assert (=> start!89570 (=> (not res!687724) (not e!579878))))

(declare-fun valid!2073 (LongMapFixedSize!5476) Bool)

(assert (=> start!89570 (= res!687724 (valid!2073 thiss!1427))))

(assert (=> start!89570 e!579878))

(declare-fun e!579877 () Bool)

(assert (=> start!89570 e!579877))

(assert (=> start!89570 true))

(declare-fun b!1027476 () Bool)

(assert (=> b!1027476 (= e!579878 e!579879)))

(declare-fun res!687723 () Bool)

(assert (=> b!1027476 (=> (not res!687723) (not e!579879))))

(assert (=> b!1027476 (= res!687723 (is-Found!9673 lt!452290))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64630 (_ BitVec 32)) SeekEntryResult!9673)

(assert (=> b!1027476 (= lt!452290 (seekEntry!0 key!909 (_keys!11237 thiss!1427) (mask!29808 thiss!1427)))))

(declare-fun b!1027477 () Bool)

(declare-fun e!579882 () Bool)

(declare-fun e!579880 () Bool)

(assert (=> b!1027477 (= e!579882 (and e!579880 mapRes!37862))))

(declare-fun condMapEmpty!37862 () Bool)

(declare-fun mapDefault!37862 () ValueCell!11441)

