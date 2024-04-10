; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90076 () Bool)

(assert start!90076)

(declare-fun b!1031817 () Bool)

(declare-fun b_free!20683 () Bool)

(declare-fun b_next!20683 () Bool)

(assert (=> b!1031817 (= b_free!20683 (not b_next!20683))))

(declare-fun tp!73120 () Bool)

(declare-fun b_and!33133 () Bool)

(assert (=> b!1031817 (= tp!73120 b_and!33133)))

(declare-fun mapNonEmpty!38058 () Bool)

(declare-fun mapRes!38058 () Bool)

(declare-fun tp!73119 () Bool)

(declare-fun e!582829 () Bool)

(assert (=> mapNonEmpty!38058 (= mapRes!38058 (and tp!73119 e!582829))))

(declare-fun mapKey!38058 () (_ BitVec 32))

(declare-datatypes ((V!37411 0))(
  ( (V!37412 (val!12252 Int)) )
))
(declare-datatypes ((ValueCell!11498 0))(
  ( (ValueCellFull!11498 (v!14829 V!37411)) (EmptyCell!11498) )
))
(declare-fun mapValue!38058 () ValueCell!11498)

(declare-datatypes ((array!64870 0))(
  ( (array!64871 (arr!31237 (Array (_ BitVec 32) (_ BitVec 64))) (size!31754 (_ BitVec 32))) )
))
(declare-datatypes ((array!64872 0))(
  ( (array!64873 (arr!31238 (Array (_ BitVec 32) ValueCell!11498)) (size!31755 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5590 0))(
  ( (LongMapFixedSize!5591 (defaultEntry!6169 Int) (mask!29973 (_ BitVec 32)) (extraKeys!5901 (_ BitVec 32)) (zeroValue!6005 V!37411) (minValue!6005 V!37411) (_size!2850 (_ BitVec 32)) (_keys!11342 array!64870) (_values!6192 array!64872) (_vacant!2850 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5590)

(declare-fun mapRest!38058 () (Array (_ BitVec 32) ValueCell!11498))

(assert (=> mapNonEmpty!38058 (= (arr!31238 (_values!6192 thiss!1427)) (store mapRest!38058 mapKey!38058 mapValue!38058))))

(declare-fun b!1031808 () Bool)

(declare-fun e!582833 () Bool)

(assert (=> b!1031808 (= e!582833 false)))

(declare-fun b!1031810 () Bool)

(declare-fun e!582831 () Bool)

(assert (=> b!1031810 (= e!582831 (not true))))

(declare-fun lt!455698 () Bool)

(declare-datatypes ((Unit!33766 0))(
  ( (Unit!33767) )
))
(declare-datatypes ((tuple2!15690 0))(
  ( (tuple2!15691 (_1!7856 Unit!33766) (_2!7856 LongMapFixedSize!5590)) )
))
(declare-fun lt!455702 () tuple2!15690)

(declare-fun valid!2115 (LongMapFixedSize!5590) Bool)

(assert (=> b!1031810 (= lt!455698 (valid!2115 (_2!7856 lt!455702)))))

(declare-fun lt!455705 () Unit!33766)

(declare-fun e!582834 () Unit!33766)

(assert (=> b!1031810 (= lt!455705 e!582834)))

(declare-fun c!104253 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15692 0))(
  ( (tuple2!15693 (_1!7857 (_ BitVec 64)) (_2!7857 V!37411)) )
))
(declare-datatypes ((List!21879 0))(
  ( (Nil!21876) (Cons!21875 (h!23077 tuple2!15692) (t!31057 List!21879)) )
))
(declare-datatypes ((ListLongMap!13737 0))(
  ( (ListLongMap!13738 (toList!6884 List!21879)) )
))
(declare-fun contains!5998 (ListLongMap!13737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3932 (array!64870 array!64872 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) Int) ListLongMap!13737)

(assert (=> b!1031810 (= c!104253 (contains!5998 (getCurrentListMap!3932 (_keys!11342 (_2!7856 lt!455702)) (_values!6192 (_2!7856 lt!455702)) (mask!29973 (_2!7856 lt!455702)) (extraKeys!5901 (_2!7856 lt!455702)) (zeroValue!6005 (_2!7856 lt!455702)) (minValue!6005 (_2!7856 lt!455702)) #b00000000000000000000000000000000 (defaultEntry!6169 (_2!7856 lt!455702))) key!909))))

(declare-fun lt!455704 () array!64870)

(declare-fun lt!455694 () array!64872)

(declare-fun Unit!33768 () Unit!33766)

(declare-fun Unit!33769 () Unit!33766)

(assert (=> b!1031810 (= lt!455702 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15691 Unit!33768 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!455704 lt!455694 (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)))) (tuple2!15691 Unit!33769 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!455704 lt!455694 (_vacant!2850 thiss!1427)))))))

(declare-fun -!511 (ListLongMap!13737 (_ BitVec 64)) ListLongMap!13737)

(assert (=> b!1031810 (= (-!511 (getCurrentListMap!3932 (_keys!11342 thiss!1427) (_values!6192 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)) key!909) (getCurrentListMap!3932 lt!455704 lt!455694 (mask!29973 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9715 0))(
  ( (MissingZero!9715 (index!41231 (_ BitVec 32))) (Found!9715 (index!41232 (_ BitVec 32))) (Intermediate!9715 (undefined!10527 Bool) (index!41233 (_ BitVec 32)) (x!91907 (_ BitVec 32))) (Undefined!9715) (MissingVacant!9715 (index!41234 (_ BitVec 32))) )
))
(declare-fun lt!455701 () SeekEntryResult!9715)

(declare-fun dynLambda!1981 (Int (_ BitVec 64)) V!37411)

(assert (=> b!1031810 (= lt!455694 (array!64873 (store (arr!31238 (_values!6192 thiss!1427)) (index!41232 lt!455701) (ValueCellFull!11498 (dynLambda!1981 (defaultEntry!6169 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31755 (_values!6192 thiss!1427))))))

(declare-fun lt!455697 () Unit!33766)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!37 (array!64870 array!64872 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) (_ BitVec 64) Int) Unit!33766)

(assert (=> b!1031810 (= lt!455697 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!37 (_keys!11342 thiss!1427) (_values!6192 thiss!1427) (mask!29973 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (index!41232 lt!455701) key!909 (defaultEntry!6169 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031810 (not (arrayContainsKey!0 lt!455704 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455696 () Unit!33766)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64870 (_ BitVec 32) (_ BitVec 64)) Unit!33766)

(assert (=> b!1031810 (= lt!455696 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11342 thiss!1427) (index!41232 lt!455701) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64870 (_ BitVec 32)) Bool)

(assert (=> b!1031810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455704 (mask!29973 thiss!1427))))

(declare-fun lt!455703 () Unit!33766)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64870 (_ BitVec 32) (_ BitVec 32)) Unit!33766)

(assert (=> b!1031810 (= lt!455703 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11342 thiss!1427) (index!41232 lt!455701) (mask!29973 thiss!1427)))))

(declare-datatypes ((List!21880 0))(
  ( (Nil!21877) (Cons!21876 (h!23078 (_ BitVec 64)) (t!31058 List!21880)) )
))
(declare-fun arrayNoDuplicates!0 (array!64870 (_ BitVec 32) List!21880) Bool)

(assert (=> b!1031810 (arrayNoDuplicates!0 lt!455704 #b00000000000000000000000000000000 Nil!21877)))

(declare-fun lt!455700 () Unit!33766)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64870 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21880) Unit!33766)

(assert (=> b!1031810 (= lt!455700 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11342 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41232 lt!455701) #b00000000000000000000000000000000 Nil!21877))))

(declare-fun arrayCountValidKeys!0 (array!64870 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031810 (= (arrayCountValidKeys!0 lt!455704 #b00000000000000000000000000000000 (size!31754 (_keys!11342 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11342 thiss!1427) #b00000000000000000000000000000000 (size!31754 (_keys!11342 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031810 (= lt!455704 (array!64871 (store (arr!31237 (_keys!11342 thiss!1427)) (index!41232 lt!455701) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31754 (_keys!11342 thiss!1427))))))

(declare-fun lt!455695 () Unit!33766)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64870 (_ BitVec 32) (_ BitVec 64)) Unit!33766)

(assert (=> b!1031810 (= lt!455695 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11342 thiss!1427) (index!41232 lt!455701) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031811 () Bool)

(declare-fun tp_is_empty!24403 () Bool)

(assert (=> b!1031811 (= e!582829 tp_is_empty!24403)))

(declare-fun b!1031812 () Bool)

(declare-fun e!582832 () Bool)

(assert (=> b!1031812 (= e!582832 (arrayContainsKey!0 (_keys!11342 (_2!7856 lt!455702)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031813 () Bool)

(declare-fun e!582837 () Bool)

(assert (=> b!1031813 (= e!582837 e!582831)))

(declare-fun res!689831 () Bool)

(assert (=> b!1031813 (=> (not res!689831) (not e!582831))))

(assert (=> b!1031813 (= res!689831 (is-Found!9715 lt!455701))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64870 (_ BitVec 32)) SeekEntryResult!9715)

(assert (=> b!1031813 (= lt!455701 (seekEntry!0 key!909 (_keys!11342 thiss!1427) (mask!29973 thiss!1427)))))

(declare-fun mapIsEmpty!38058 () Bool)

(assert (=> mapIsEmpty!38058 mapRes!38058))

(declare-fun res!689828 () Bool)

(assert (=> start!90076 (=> (not res!689828) (not e!582837))))

(assert (=> start!90076 (= res!689828 (valid!2115 thiss!1427))))

(assert (=> start!90076 e!582837))

(declare-fun e!582835 () Bool)

(assert (=> start!90076 e!582835))

(assert (=> start!90076 true))

(declare-fun b!1031809 () Bool)

(declare-fun e!582828 () Bool)

(assert (=> b!1031809 (= e!582828 tp_is_empty!24403)))

(declare-fun b!1031814 () Bool)

(declare-fun Unit!33770 () Unit!33766)

(assert (=> b!1031814 (= e!582834 Unit!33770)))

(declare-fun lt!455699 () Unit!33766)

(declare-fun lemmaKeyInListMapIsInArray!346 (array!64870 array!64872 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 64) Int) Unit!33766)

(assert (=> b!1031814 (= lt!455699 (lemmaKeyInListMapIsInArray!346 (_keys!11342 (_2!7856 lt!455702)) (_values!6192 (_2!7856 lt!455702)) (mask!29973 (_2!7856 lt!455702)) (extraKeys!5901 (_2!7856 lt!455702)) (zeroValue!6005 (_2!7856 lt!455702)) (minValue!6005 (_2!7856 lt!455702)) key!909 (defaultEntry!6169 (_2!7856 lt!455702))))))

(declare-fun c!104252 () Bool)

(assert (=> b!1031814 (= c!104252 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689830 () Bool)

(assert (=> b!1031814 (= res!689830 e!582832)))

(assert (=> b!1031814 (=> (not res!689830) (not e!582833))))

(assert (=> b!1031814 e!582833))

(declare-fun b!1031815 () Bool)

(declare-fun res!689829 () Bool)

(assert (=> b!1031815 (=> (not res!689829) (not e!582837))))

(assert (=> b!1031815 (= res!689829 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031816 () Bool)

(assert (=> b!1031816 (= e!582832 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5901 (_2!7856 lt!455702)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5901 (_2!7856 lt!455702)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!582836 () Bool)

(declare-fun array_inv!24179 (array!64870) Bool)

(declare-fun array_inv!24180 (array!64872) Bool)

(assert (=> b!1031817 (= e!582835 (and tp!73120 tp_is_empty!24403 (array_inv!24179 (_keys!11342 thiss!1427)) (array_inv!24180 (_values!6192 thiss!1427)) e!582836))))

(declare-fun b!1031818 () Bool)

(assert (=> b!1031818 (= e!582836 (and e!582828 mapRes!38058))))

(declare-fun condMapEmpty!38058 () Bool)

(declare-fun mapDefault!38058 () ValueCell!11498)

