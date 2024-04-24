; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90268 () Bool)

(assert start!90268)

(declare-fun b!1032382 () Bool)

(declare-fun b_free!20641 () Bool)

(declare-fun b_next!20641 () Bool)

(assert (=> b!1032382 (= b_free!20641 (not b_next!20641))))

(declare-fun tp!72994 () Bool)

(declare-fun b_and!33059 () Bool)

(assert (=> b!1032382 (= tp!72994 b_and!33059)))

(declare-fun b!1032377 () Bool)

(declare-fun e!583147 () Bool)

(declare-fun e!583148 () Bool)

(assert (=> b!1032377 (= e!583147 e!583148)))

(declare-fun res!689930 () Bool)

(assert (=> b!1032377 (=> (not res!689930) (not e!583148))))

(declare-datatypes ((SeekEntryResult!9655 0))(
  ( (MissingZero!9655 (index!40991 (_ BitVec 32))) (Found!9655 (index!40992 (_ BitVec 32))) (Intermediate!9655 (undefined!10467 Bool) (index!40993 (_ BitVec 32)) (x!91771 (_ BitVec 32))) (Undefined!9655) (MissingVacant!9655 (index!40994 (_ BitVec 32))) )
))
(declare-fun lt!455557 () SeekEntryResult!9655)

(get-info :version)

(assert (=> b!1032377 (= res!689930 ((_ is Found!9655) lt!455557))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37355 0))(
  ( (V!37356 (val!12231 Int)) )
))
(declare-datatypes ((ValueCell!11477 0))(
  ( (ValueCellFull!11477 (v!14804 V!37355)) (EmptyCell!11477) )
))
(declare-datatypes ((array!64835 0))(
  ( (array!64836 (arr!31213 (Array (_ BitVec 32) (_ BitVec 64))) (size!31731 (_ BitVec 32))) )
))
(declare-datatypes ((array!64837 0))(
  ( (array!64838 (arr!31214 (Array (_ BitVec 32) ValueCell!11477)) (size!31732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5548 0))(
  ( (LongMapFixedSize!5549 (defaultEntry!6148 Int) (mask!29998 (_ BitVec 32)) (extraKeys!5880 (_ BitVec 32)) (zeroValue!5984 V!37355) (minValue!5984 V!37355) (_size!2829 (_ BitVec 32)) (_keys!11359 array!64835) (_values!6171 array!64837) (_vacant!2829 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5548)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64835 (_ BitVec 32)) SeekEntryResult!9655)

(assert (=> b!1032377 (= lt!455557 (seekEntry!0 key!909 (_keys!11359 thiss!1427) (mask!29998 thiss!1427)))))

(declare-fun b!1032378 () Bool)

(declare-fun res!689935 () Bool)

(assert (=> b!1032378 (=> (not res!689935) (not e!583147))))

(assert (=> b!1032378 (= res!689935 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032379 () Bool)

(declare-fun e!583152 () Bool)

(declare-fun tp_is_empty!24361 () Bool)

(assert (=> b!1032379 (= e!583152 tp_is_empty!24361)))

(declare-fun mapNonEmpty!37995 () Bool)

(declare-fun mapRes!37995 () Bool)

(declare-fun tp!72993 () Bool)

(declare-fun e!583145 () Bool)

(assert (=> mapNonEmpty!37995 (= mapRes!37995 (and tp!72993 e!583145))))

(declare-fun mapRest!37995 () (Array (_ BitVec 32) ValueCell!11477))

(declare-fun mapValue!37995 () ValueCell!11477)

(declare-fun mapKey!37995 () (_ BitVec 32))

(assert (=> mapNonEmpty!37995 (= (arr!31214 (_values!6171 thiss!1427)) (store mapRest!37995 mapKey!37995 mapValue!37995))))

(declare-fun b!1032380 () Bool)

(declare-fun e!583151 () Bool)

(assert (=> b!1032380 (= e!583151 true)))

(declare-fun lt!455562 () Bool)

(declare-datatypes ((Unit!33712 0))(
  ( (Unit!33713) )
))
(declare-datatypes ((tuple2!15636 0))(
  ( (tuple2!15637 (_1!7829 Unit!33712) (_2!7829 LongMapFixedSize!5548)) )
))
(declare-fun lt!455558 () tuple2!15636)

(declare-datatypes ((List!21842 0))(
  ( (Nil!21839) (Cons!21838 (h!23049 (_ BitVec 64)) (t!30970 List!21842)) )
))
(declare-fun arrayNoDuplicates!0 (array!64835 (_ BitVec 32) List!21842) Bool)

(assert (=> b!1032380 (= lt!455562 (arrayNoDuplicates!0 (_keys!11359 (_2!7829 lt!455558)) #b00000000000000000000000000000000 Nil!21839))))

(declare-fun b!1032381 () Bool)

(declare-fun res!689931 () Bool)

(assert (=> b!1032381 (=> res!689931 e!583151)))

(assert (=> b!1032381 (= res!689931 (or (not (= (size!31732 (_values!6171 (_2!7829 lt!455558))) (bvadd #b00000000000000000000000000000001 (mask!29998 (_2!7829 lt!455558))))) (not (= (size!31731 (_keys!11359 (_2!7829 lt!455558))) (size!31732 (_values!6171 (_2!7829 lt!455558))))) (bvslt (mask!29998 (_2!7829 lt!455558)) #b00000000000000000000000000000000) (bvslt (extraKeys!5880 (_2!7829 lt!455558)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5880 (_2!7829 lt!455558)) #b00000000000000000000000000000011)))))

(declare-fun e!583150 () Bool)

(declare-fun e!583146 () Bool)

(declare-fun array_inv!24169 (array!64835) Bool)

(declare-fun array_inv!24170 (array!64837) Bool)

(assert (=> b!1032382 (= e!583146 (and tp!72994 tp_is_empty!24361 (array_inv!24169 (_keys!11359 thiss!1427)) (array_inv!24170 (_values!6171 thiss!1427)) e!583150))))

(declare-fun b!1032383 () Bool)

(declare-fun res!689936 () Bool)

(assert (=> b!1032383 (=> res!689936 e!583151)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032383 (= res!689936 (not (validMask!0 (mask!29998 (_2!7829 lt!455558)))))))

(declare-fun b!1032384 () Bool)

(declare-fun res!689933 () Bool)

(assert (=> b!1032384 (=> res!689933 e!583151)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64835 (_ BitVec 32)) Bool)

(assert (=> b!1032384 (= res!689933 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11359 (_2!7829 lt!455558)) (mask!29998 (_2!7829 lt!455558)))))))

(declare-fun b!1032385 () Bool)

(assert (=> b!1032385 (= e!583145 tp_is_empty!24361)))

(declare-fun res!689934 () Bool)

(assert (=> start!90268 (=> (not res!689934) (not e!583147))))

(declare-fun valid!2106 (LongMapFixedSize!5548) Bool)

(assert (=> start!90268 (= res!689934 (valid!2106 thiss!1427))))

(assert (=> start!90268 e!583147))

(assert (=> start!90268 e!583146))

(assert (=> start!90268 true))

(declare-fun mapIsEmpty!37995 () Bool)

(assert (=> mapIsEmpty!37995 mapRes!37995))

(declare-fun b!1032386 () Bool)

(assert (=> b!1032386 (= e!583150 (and e!583152 mapRes!37995))))

(declare-fun condMapEmpty!37995 () Bool)

(declare-fun mapDefault!37995 () ValueCell!11477)

(assert (=> b!1032386 (= condMapEmpty!37995 (= (arr!31214 (_values!6171 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11477)) mapDefault!37995)))))

(declare-fun b!1032387 () Bool)

(assert (=> b!1032387 (= e!583148 (not e!583151))))

(declare-fun res!689932 () Bool)

(assert (=> b!1032387 (=> res!689932 e!583151)))

(declare-datatypes ((tuple2!15638 0))(
  ( (tuple2!15639 (_1!7830 (_ BitVec 64)) (_2!7830 V!37355)) )
))
(declare-datatypes ((List!21843 0))(
  ( (Nil!21840) (Cons!21839 (h!23050 tuple2!15638) (t!30971 List!21843)) )
))
(declare-datatypes ((ListLongMap!13723 0))(
  ( (ListLongMap!13724 (toList!6877 List!21843)) )
))
(declare-fun contains!6012 (ListLongMap!13723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3923 (array!64835 array!64837 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) Int) ListLongMap!13723)

(assert (=> b!1032387 (= res!689932 (not (contains!6012 (getCurrentListMap!3923 (_keys!11359 (_2!7829 lt!455558)) (_values!6171 (_2!7829 lt!455558)) (mask!29998 (_2!7829 lt!455558)) (extraKeys!5880 (_2!7829 lt!455558)) (zeroValue!5984 (_2!7829 lt!455558)) (minValue!5984 (_2!7829 lt!455558)) #b00000000000000000000000000000000 (defaultEntry!6148 (_2!7829 lt!455558))) key!909)))))

(declare-fun lt!455564 () array!64837)

(declare-fun lt!455561 () array!64835)

(declare-fun Unit!33714 () Unit!33712)

(declare-fun Unit!33715 () Unit!33712)

(assert (=> b!1032387 (= lt!455558 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15637 Unit!33714 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29998 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!455561 lt!455564 (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)))) (tuple2!15637 Unit!33715 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29998 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!455561 lt!455564 (_vacant!2829 thiss!1427)))))))

(declare-fun -!500 (ListLongMap!13723 (_ BitVec 64)) ListLongMap!13723)

(assert (=> b!1032387 (= (-!500 (getCurrentListMap!3923 (_keys!11359 thiss!1427) (_values!6171 thiss!1427) (mask!29998 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)) key!909) (getCurrentListMap!3923 lt!455561 lt!455564 (mask!29998 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)))))

(declare-fun dynLambda!1994 (Int (_ BitVec 64)) V!37355)

(assert (=> b!1032387 (= lt!455564 (array!64838 (store (arr!31214 (_values!6171 thiss!1427)) (index!40992 lt!455557) (ValueCellFull!11477 (dynLambda!1994 (defaultEntry!6148 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31732 (_values!6171 thiss!1427))))))

(declare-fun lt!455559 () Unit!33712)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (array!64835 array!64837 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) (_ BitVec 64) Int) Unit!33712)

(assert (=> b!1032387 (= lt!455559 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!26 (_keys!11359 thiss!1427) (_values!6171 thiss!1427) (mask!29998 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (index!40992 lt!455557) key!909 (defaultEntry!6148 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032387 (not (arrayContainsKey!0 lt!455561 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455566 () Unit!33712)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64835 (_ BitVec 32) (_ BitVec 64)) Unit!33712)

(assert (=> b!1032387 (= lt!455566 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11359 thiss!1427) (index!40992 lt!455557) key!909))))

(assert (=> b!1032387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455561 (mask!29998 thiss!1427))))

(declare-fun lt!455565 () Unit!33712)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64835 (_ BitVec 32) (_ BitVec 32)) Unit!33712)

(assert (=> b!1032387 (= lt!455565 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11359 thiss!1427) (index!40992 lt!455557) (mask!29998 thiss!1427)))))

(assert (=> b!1032387 (arrayNoDuplicates!0 lt!455561 #b00000000000000000000000000000000 Nil!21839)))

(declare-fun lt!455560 () Unit!33712)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64835 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21842) Unit!33712)

(assert (=> b!1032387 (= lt!455560 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11359 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40992 lt!455557) #b00000000000000000000000000000000 Nil!21839))))

(declare-fun arrayCountValidKeys!0 (array!64835 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032387 (= (arrayCountValidKeys!0 lt!455561 #b00000000000000000000000000000000 (size!31731 (_keys!11359 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11359 thiss!1427) #b00000000000000000000000000000000 (size!31731 (_keys!11359 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032387 (= lt!455561 (array!64836 (store (arr!31213 (_keys!11359 thiss!1427)) (index!40992 lt!455557) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31731 (_keys!11359 thiss!1427))))))

(declare-fun lt!455563 () Unit!33712)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64835 (_ BitVec 32) (_ BitVec 64)) Unit!33712)

(assert (=> b!1032387 (= lt!455563 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11359 thiss!1427) (index!40992 lt!455557) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90268 res!689934) b!1032378))

(assert (= (and b!1032378 res!689935) b!1032377))

(assert (= (and b!1032377 res!689930) b!1032387))

(assert (= (and b!1032387 (not res!689932)) b!1032383))

(assert (= (and b!1032383 (not res!689936)) b!1032381))

(assert (= (and b!1032381 (not res!689931)) b!1032384))

(assert (= (and b!1032384 (not res!689933)) b!1032380))

(assert (= (and b!1032386 condMapEmpty!37995) mapIsEmpty!37995))

(assert (= (and b!1032386 (not condMapEmpty!37995)) mapNonEmpty!37995))

(assert (= (and mapNonEmpty!37995 ((_ is ValueCellFull!11477) mapValue!37995)) b!1032385))

(assert (= (and b!1032386 ((_ is ValueCellFull!11477) mapDefault!37995)) b!1032379))

(assert (= b!1032382 b!1032386))

(assert (= start!90268 b!1032382))

(declare-fun b_lambda!15995 () Bool)

(assert (=> (not b_lambda!15995) (not b!1032387)))

(declare-fun t!30969 () Bool)

(declare-fun tb!6951 () Bool)

(assert (=> (and b!1032382 (= (defaultEntry!6148 thiss!1427) (defaultEntry!6148 thiss!1427)) t!30969) tb!6951))

(declare-fun result!14239 () Bool)

(assert (=> tb!6951 (= result!14239 tp_is_empty!24361)))

(assert (=> b!1032387 t!30969))

(declare-fun b_and!33061 () Bool)

(assert (= b_and!33059 (and (=> t!30969 result!14239) b_and!33061)))

(declare-fun m!952661 () Bool)

(assert (=> b!1032384 m!952661))

(declare-fun m!952663 () Bool)

(assert (=> b!1032383 m!952663))

(declare-fun m!952665 () Bool)

(assert (=> start!90268 m!952665))

(declare-fun m!952667 () Bool)

(assert (=> b!1032382 m!952667))

(declare-fun m!952669 () Bool)

(assert (=> b!1032382 m!952669))

(declare-fun m!952671 () Bool)

(assert (=> mapNonEmpty!37995 m!952671))

(declare-fun m!952673 () Bool)

(assert (=> b!1032387 m!952673))

(declare-fun m!952675 () Bool)

(assert (=> b!1032387 m!952675))

(declare-fun m!952677 () Bool)

(assert (=> b!1032387 m!952677))

(declare-fun m!952679 () Bool)

(assert (=> b!1032387 m!952679))

(declare-fun m!952681 () Bool)

(assert (=> b!1032387 m!952681))

(declare-fun m!952683 () Bool)

(assert (=> b!1032387 m!952683))

(declare-fun m!952685 () Bool)

(assert (=> b!1032387 m!952685))

(declare-fun m!952687 () Bool)

(assert (=> b!1032387 m!952687))

(declare-fun m!952689 () Bool)

(assert (=> b!1032387 m!952689))

(declare-fun m!952691 () Bool)

(assert (=> b!1032387 m!952691))

(declare-fun m!952693 () Bool)

(assert (=> b!1032387 m!952693))

(declare-fun m!952695 () Bool)

(assert (=> b!1032387 m!952695))

(declare-fun m!952697 () Bool)

(assert (=> b!1032387 m!952697))

(declare-fun m!952699 () Bool)

(assert (=> b!1032387 m!952699))

(declare-fun m!952701 () Bool)

(assert (=> b!1032387 m!952701))

(declare-fun m!952703 () Bool)

(assert (=> b!1032387 m!952703))

(declare-fun m!952705 () Bool)

(assert (=> b!1032387 m!952705))

(declare-fun m!952707 () Bool)

(assert (=> b!1032387 m!952707))

(assert (=> b!1032387 m!952673))

(assert (=> b!1032387 m!952689))

(declare-fun m!952709 () Bool)

(assert (=> b!1032380 m!952709))

(declare-fun m!952711 () Bool)

(assert (=> b!1032377 m!952711))

(check-sat (not b!1032382) (not b!1032383) (not b!1032377) (not b!1032387) tp_is_empty!24361 (not b!1032384) (not mapNonEmpty!37995) b_and!33061 (not start!90268) (not b!1032380) (not b_lambda!15995) (not b_next!20641))
(check-sat b_and!33061 (not b_next!20641))
