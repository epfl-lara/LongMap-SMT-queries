; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90080 () Bool)

(assert start!90080)

(declare-fun b!1031772 () Bool)

(declare-fun b_free!20689 () Bool)

(declare-fun b_next!20689 () Bool)

(assert (=> b!1031772 (= b_free!20689 (not b_next!20689))))

(declare-fun tp!73138 () Bool)

(declare-fun b_and!33119 () Bool)

(assert (=> b!1031772 (= tp!73138 b_and!33119)))

(declare-fun b!1031771 () Bool)

(declare-fun e!582835 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37419 0))(
  ( (V!37420 (val!12255 Int)) )
))
(declare-datatypes ((ValueCell!11501 0))(
  ( (ValueCellFull!11501 (v!14831 V!37419)) (EmptyCell!11501) )
))
(declare-datatypes ((Unit!33668 0))(
  ( (Unit!33669) )
))
(declare-datatypes ((array!64821 0))(
  ( (array!64822 (arr!31212 (Array (_ BitVec 32) (_ BitVec 64))) (size!31731 (_ BitVec 32))) )
))
(declare-datatypes ((array!64823 0))(
  ( (array!64824 (arr!31213 (Array (_ BitVec 32) ValueCell!11501)) (size!31732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5596 0))(
  ( (LongMapFixedSize!5597 (defaultEntry!6172 Int) (mask!29973 (_ BitVec 32)) (extraKeys!5904 (_ BitVec 32)) (zeroValue!6008 V!37419) (minValue!6008 V!37419) (_size!2853 (_ BitVec 32)) (_keys!11341 array!64821) (_values!6195 array!64823) (_vacant!2853 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15784 0))(
  ( (tuple2!15785 (_1!7903 Unit!33668) (_2!7903 LongMapFixedSize!5596)) )
))
(declare-fun lt!455613 () tuple2!15784)

(assert (=> b!1031771 (= e!582835 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5904 (_2!7903 lt!455613)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5904 (_2!7903 lt!455613)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!689798 () Bool)

(declare-fun e!582834 () Bool)

(assert (=> start!90080 (=> (not res!689798) (not e!582834))))

(declare-fun thiss!1427 () LongMapFixedSize!5596)

(declare-fun valid!2107 (LongMapFixedSize!5596) Bool)

(assert (=> start!90080 (= res!689798 (valid!2107 thiss!1427))))

(assert (=> start!90080 e!582834))

(declare-fun e!582827 () Bool)

(assert (=> start!90080 e!582827))

(assert (=> start!90080 true))

(declare-fun e!582829 () Bool)

(declare-fun tp_is_empty!24409 () Bool)

(declare-fun array_inv!24155 (array!64821) Bool)

(declare-fun array_inv!24156 (array!64823) Bool)

(assert (=> b!1031772 (= e!582827 (and tp!73138 tp_is_empty!24409 (array_inv!24155 (_keys!11341 thiss!1427)) (array_inv!24156 (_values!6195 thiss!1427)) e!582829))))

(declare-fun b!1031773 () Bool)

(declare-fun e!582833 () Unit!33668)

(declare-fun Unit!33670 () Unit!33668)

(assert (=> b!1031773 (= e!582833 Unit!33670)))

(declare-fun b!1031774 () Bool)

(declare-fun Unit!33671 () Unit!33668)

(assert (=> b!1031774 (= e!582833 Unit!33671)))

(declare-fun lt!455603 () Unit!33668)

(declare-fun lemmaKeyInListMapIsInArray!328 (array!64821 array!64823 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 64) Int) Unit!33668)

(assert (=> b!1031774 (= lt!455603 (lemmaKeyInListMapIsInArray!328 (_keys!11341 (_2!7903 lt!455613)) (_values!6195 (_2!7903 lt!455613)) (mask!29973 (_2!7903 lt!455613)) (extraKeys!5904 (_2!7903 lt!455613)) (zeroValue!6008 (_2!7903 lt!455613)) (minValue!6008 (_2!7903 lt!455613)) key!909 (defaultEntry!6172 (_2!7903 lt!455613))))))

(declare-fun c!104231 () Bool)

(assert (=> b!1031774 (= c!104231 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689800 () Bool)

(assert (=> b!1031774 (= res!689800 e!582835)))

(declare-fun e!582832 () Bool)

(assert (=> b!1031774 (=> (not res!689800) (not e!582832))))

(assert (=> b!1031774 e!582832))

(declare-fun mapNonEmpty!38067 () Bool)

(declare-fun mapRes!38067 () Bool)

(declare-fun tp!73137 () Bool)

(declare-fun e!582828 () Bool)

(assert (=> mapNonEmpty!38067 (= mapRes!38067 (and tp!73137 e!582828))))

(declare-fun mapRest!38067 () (Array (_ BitVec 32) ValueCell!11501))

(declare-fun mapValue!38067 () ValueCell!11501)

(declare-fun mapKey!38067 () (_ BitVec 32))

(assert (=> mapNonEmpty!38067 (= (arr!31213 (_values!6195 thiss!1427)) (store mapRest!38067 mapKey!38067 mapValue!38067))))

(declare-fun b!1031775 () Bool)

(declare-fun e!582830 () Bool)

(assert (=> b!1031775 (= e!582830 tp_is_empty!24409)))

(declare-fun b!1031776 () Bool)

(declare-fun e!582836 () Bool)

(assert (=> b!1031776 (= e!582834 e!582836)))

(declare-fun res!689799 () Bool)

(assert (=> b!1031776 (=> (not res!689799) (not e!582836))))

(declare-datatypes ((SeekEntryResult!9708 0))(
  ( (MissingZero!9708 (index!41203 (_ BitVec 32))) (Found!9708 (index!41204 (_ BitVec 32))) (Intermediate!9708 (undefined!10520 Bool) (index!41205 (_ BitVec 32)) (x!91911 (_ BitVec 32))) (Undefined!9708) (MissingVacant!9708 (index!41206 (_ BitVec 32))) )
))
(declare-fun lt!455609 () SeekEntryResult!9708)

(get-info :version)

(assert (=> b!1031776 (= res!689799 ((_ is Found!9708) lt!455609))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64821 (_ BitVec 32)) SeekEntryResult!9708)

(assert (=> b!1031776 (= lt!455609 (seekEntry!0 key!909 (_keys!11341 thiss!1427) (mask!29973 thiss!1427)))))

(declare-fun b!1031777 () Bool)

(assert (=> b!1031777 (= e!582828 tp_is_empty!24409)))

(declare-fun b!1031778 () Bool)

(declare-fun res!689797 () Bool)

(assert (=> b!1031778 (=> (not res!689797) (not e!582834))))

(assert (=> b!1031778 (= res!689797 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38067 () Bool)

(assert (=> mapIsEmpty!38067 mapRes!38067))

(declare-fun b!1031779 () Bool)

(assert (=> b!1031779 (= e!582829 (and e!582830 mapRes!38067))))

(declare-fun condMapEmpty!38067 () Bool)

(declare-fun mapDefault!38067 () ValueCell!11501)

(assert (=> b!1031779 (= condMapEmpty!38067 (= (arr!31213 (_values!6195 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11501)) mapDefault!38067)))))

(declare-fun b!1031780 () Bool)

(declare-fun arrayContainsKey!0 (array!64821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031780 (= e!582835 (arrayContainsKey!0 (_keys!11341 (_2!7903 lt!455613)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031781 () Bool)

(assert (=> b!1031781 (= e!582836 (not true))))

(declare-fun lt!455606 () Bool)

(assert (=> b!1031781 (= lt!455606 (valid!2107 (_2!7903 lt!455613)))))

(declare-fun lt!455608 () Unit!33668)

(assert (=> b!1031781 (= lt!455608 e!582833)))

(declare-fun c!104232 () Bool)

(declare-datatypes ((tuple2!15786 0))(
  ( (tuple2!15787 (_1!7904 (_ BitVec 64)) (_2!7904 V!37419)) )
))
(declare-datatypes ((List!21921 0))(
  ( (Nil!21918) (Cons!21917 (h!23119 tuple2!15786) (t!31096 List!21921)) )
))
(declare-datatypes ((ListLongMap!13819 0))(
  ( (ListLongMap!13820 (toList!6925 List!21921)) )
))
(declare-fun contains!5981 (ListLongMap!13819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3892 (array!64821 array!64823 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) Int) ListLongMap!13819)

(assert (=> b!1031781 (= c!104232 (contains!5981 (getCurrentListMap!3892 (_keys!11341 (_2!7903 lt!455613)) (_values!6195 (_2!7903 lt!455613)) (mask!29973 (_2!7903 lt!455613)) (extraKeys!5904 (_2!7903 lt!455613)) (zeroValue!6008 (_2!7903 lt!455613)) (minValue!6008 (_2!7903 lt!455613)) #b00000000000000000000000000000000 (defaultEntry!6172 (_2!7903 lt!455613))) key!909))))

(declare-fun lt!455610 () array!64823)

(declare-fun lt!455607 () array!64821)

(declare-fun Unit!33672 () Unit!33668)

(declare-fun Unit!33673 () Unit!33668)

(assert (=> b!1031781 (= lt!455613 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15785 Unit!33672 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!455607 lt!455610 (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)))) (tuple2!15785 Unit!33673 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!455607 lt!455610 (_vacant!2853 thiss!1427)))))))

(declare-fun -!517 (ListLongMap!13819 (_ BitVec 64)) ListLongMap!13819)

(assert (=> b!1031781 (= (-!517 (getCurrentListMap!3892 (_keys!11341 thiss!1427) (_values!6195 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)) key!909) (getCurrentListMap!3892 lt!455607 lt!455610 (mask!29973 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)))))

(declare-fun dynLambda!1979 (Int (_ BitVec 64)) V!37419)

(assert (=> b!1031781 (= lt!455610 (array!64824 (store (arr!31213 (_values!6195 thiss!1427)) (index!41204 lt!455609) (ValueCellFull!11501 (dynLambda!1979 (defaultEntry!6172 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31732 (_values!6195 thiss!1427))))))

(declare-fun lt!455612 () Unit!33668)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (array!64821 array!64823 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) (_ BitVec 64) Int) Unit!33668)

(assert (=> b!1031781 (= lt!455612 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (_keys!11341 thiss!1427) (_values!6195 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (index!41204 lt!455609) key!909 (defaultEntry!6172 thiss!1427)))))

(assert (=> b!1031781 (not (arrayContainsKey!0 lt!455607 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455602 () Unit!33668)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64821 (_ BitVec 32) (_ BitVec 64)) Unit!33668)

(assert (=> b!1031781 (= lt!455602 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11341 thiss!1427) (index!41204 lt!455609) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64821 (_ BitVec 32)) Bool)

(assert (=> b!1031781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455607 (mask!29973 thiss!1427))))

(declare-fun lt!455604 () Unit!33668)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64821 (_ BitVec 32) (_ BitVec 32)) Unit!33668)

(assert (=> b!1031781 (= lt!455604 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11341 thiss!1427) (index!41204 lt!455609) (mask!29973 thiss!1427)))))

(declare-datatypes ((List!21922 0))(
  ( (Nil!21919) (Cons!21918 (h!23120 (_ BitVec 64)) (t!31097 List!21922)) )
))
(declare-fun arrayNoDuplicates!0 (array!64821 (_ BitVec 32) List!21922) Bool)

(assert (=> b!1031781 (arrayNoDuplicates!0 lt!455607 #b00000000000000000000000000000000 Nil!21919)))

(declare-fun lt!455605 () Unit!33668)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64821 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21922) Unit!33668)

(assert (=> b!1031781 (= lt!455605 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11341 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41204 lt!455609) #b00000000000000000000000000000000 Nil!21919))))

(declare-fun arrayCountValidKeys!0 (array!64821 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031781 (= (arrayCountValidKeys!0 lt!455607 #b00000000000000000000000000000000 (size!31731 (_keys!11341 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11341 thiss!1427) #b00000000000000000000000000000000 (size!31731 (_keys!11341 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031781 (= lt!455607 (array!64822 (store (arr!31212 (_keys!11341 thiss!1427)) (index!41204 lt!455609) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31731 (_keys!11341 thiss!1427))))))

(declare-fun lt!455611 () Unit!33668)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64821 (_ BitVec 32) (_ BitVec 64)) Unit!33668)

(assert (=> b!1031781 (= lt!455611 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11341 thiss!1427) (index!41204 lt!455609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031782 () Bool)

(assert (=> b!1031782 (= e!582832 false)))

(assert (= (and start!90080 res!689798) b!1031778))

(assert (= (and b!1031778 res!689797) b!1031776))

(assert (= (and b!1031776 res!689799) b!1031781))

(assert (= (and b!1031781 c!104232) b!1031774))

(assert (= (and b!1031781 (not c!104232)) b!1031773))

(assert (= (and b!1031774 c!104231) b!1031780))

(assert (= (and b!1031774 (not c!104231)) b!1031771))

(assert (= (and b!1031774 res!689800) b!1031782))

(assert (= (and b!1031779 condMapEmpty!38067) mapIsEmpty!38067))

(assert (= (and b!1031779 (not condMapEmpty!38067)) mapNonEmpty!38067))

(assert (= (and mapNonEmpty!38067 ((_ is ValueCellFull!11501) mapValue!38067)) b!1031777))

(assert (= (and b!1031779 ((_ is ValueCellFull!11501) mapDefault!38067)) b!1031775))

(assert (= b!1031772 b!1031779))

(assert (= start!90080 b!1031772))

(declare-fun b_lambda!16011 () Bool)

(assert (=> (not b_lambda!16011) (not b!1031781)))

(declare-fun t!31095 () Bool)

(declare-fun tb!6999 () Bool)

(assert (=> (and b!1031772 (= (defaultEntry!6172 thiss!1427) (defaultEntry!6172 thiss!1427)) t!31095) tb!6999))

(declare-fun result!14335 () Bool)

(assert (=> tb!6999 (= result!14335 tp_is_empty!24409)))

(assert (=> b!1031781 t!31095))

(declare-fun b_and!33121 () Bool)

(assert (= b_and!33119 (and (=> t!31095 result!14335) b_and!33121)))

(declare-fun m!951625 () Bool)

(assert (=> start!90080 m!951625))

(declare-fun m!951627 () Bool)

(assert (=> b!1031781 m!951627))

(declare-fun m!951629 () Bool)

(assert (=> b!1031781 m!951629))

(declare-fun m!951631 () Bool)

(assert (=> b!1031781 m!951631))

(declare-fun m!951633 () Bool)

(assert (=> b!1031781 m!951633))

(declare-fun m!951635 () Bool)

(assert (=> b!1031781 m!951635))

(declare-fun m!951637 () Bool)

(assert (=> b!1031781 m!951637))

(declare-fun m!951639 () Bool)

(assert (=> b!1031781 m!951639))

(declare-fun m!951641 () Bool)

(assert (=> b!1031781 m!951641))

(declare-fun m!951643 () Bool)

(assert (=> b!1031781 m!951643))

(declare-fun m!951645 () Bool)

(assert (=> b!1031781 m!951645))

(declare-fun m!951647 () Bool)

(assert (=> b!1031781 m!951647))

(declare-fun m!951649 () Bool)

(assert (=> b!1031781 m!951649))

(declare-fun m!951651 () Bool)

(assert (=> b!1031781 m!951651))

(declare-fun m!951653 () Bool)

(assert (=> b!1031781 m!951653))

(assert (=> b!1031781 m!951649))

(declare-fun m!951655 () Bool)

(assert (=> b!1031781 m!951655))

(declare-fun m!951657 () Bool)

(assert (=> b!1031781 m!951657))

(declare-fun m!951659 () Bool)

(assert (=> b!1031781 m!951659))

(assert (=> b!1031781 m!951643))

(declare-fun m!951661 () Bool)

(assert (=> b!1031781 m!951661))

(declare-fun m!951663 () Bool)

(assert (=> b!1031781 m!951663))

(declare-fun m!951665 () Bool)

(assert (=> b!1031774 m!951665))

(declare-fun m!951667 () Bool)

(assert (=> b!1031772 m!951667))

(declare-fun m!951669 () Bool)

(assert (=> b!1031772 m!951669))

(declare-fun m!951671 () Bool)

(assert (=> b!1031780 m!951671))

(declare-fun m!951673 () Bool)

(assert (=> mapNonEmpty!38067 m!951673))

(declare-fun m!951675 () Bool)

(assert (=> b!1031776 m!951675))

(check-sat (not b_next!20689) (not b!1031780) (not b_lambda!16011) (not b!1031772) (not b!1031776) (not b!1031781) (not mapNonEmpty!38067) (not b!1031774) tp_is_empty!24409 (not start!90080) b_and!33121)
(check-sat b_and!33121 (not b_next!20689))
