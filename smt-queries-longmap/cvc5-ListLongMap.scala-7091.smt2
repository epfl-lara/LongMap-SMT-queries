; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89886 () Bool)

(assert start!89886)

(declare-fun b!1029696 () Bool)

(declare-fun b_free!20599 () Bool)

(declare-fun b_next!20599 () Bool)

(assert (=> b!1029696 (= b_free!20599 (not b_next!20599))))

(declare-fun tp!72861 () Bool)

(declare-fun b_and!32941 () Bool)

(assert (=> b!1029696 (= tp!72861 b_and!32941)))

(declare-fun res!688721 () Bool)

(declare-fun e!581377 () Bool)

(assert (=> start!89886 (=> (not res!688721) (not e!581377))))

(declare-datatypes ((V!37299 0))(
  ( (V!37300 (val!12210 Int)) )
))
(declare-datatypes ((ValueCell!11456 0))(
  ( (ValueCellFull!11456 (v!14785 V!37299)) (EmptyCell!11456) )
))
(declare-datatypes ((array!64698 0))(
  ( (array!64699 (arr!31153 (Array (_ BitVec 32) (_ BitVec 64))) (size!31669 (_ BitVec 32))) )
))
(declare-datatypes ((array!64700 0))(
  ( (array!64701 (arr!31154 (Array (_ BitVec 32) ValueCell!11456)) (size!31670 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5506 0))(
  ( (LongMapFixedSize!5507 (defaultEntry!6121 Int) (mask!29884 (_ BitVec 32)) (extraKeys!5853 (_ BitVec 32)) (zeroValue!5957 V!37299) (minValue!5957 V!37299) (_size!2808 (_ BitVec 32)) (_keys!11287 array!64698) (_values!6144 array!64700) (_vacant!2808 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5506)

(declare-fun valid!2085 (LongMapFixedSize!5506) Bool)

(assert (=> start!89886 (= res!688721 (valid!2085 thiss!1427))))

(assert (=> start!89886 e!581377))

(declare-fun e!581373 () Bool)

(assert (=> start!89886 e!581373))

(assert (=> start!89886 true))

(declare-fun b!1029691 () Bool)

(declare-fun e!581374 () Bool)

(declare-datatypes ((Unit!33625 0))(
  ( (Unit!33626) )
))
(declare-datatypes ((tuple2!15566 0))(
  ( (tuple2!15567 (_1!7794 Unit!33625) (_2!7794 LongMapFixedSize!5506)) )
))
(declare-fun lt!453971 () tuple2!15566)

(assert (=> b!1029691 (= e!581374 (or (not (= (size!31670 (_values!6144 (_2!7794 lt!453971))) (bvadd #b00000000000000000000000000000001 (mask!29884 (_2!7794 lt!453971))))) (not (= (size!31669 (_keys!11287 (_2!7794 lt!453971))) (size!31670 (_values!6144 (_2!7794 lt!453971))))) (bvslt (mask!29884 (_2!7794 lt!453971)) #b00000000000000000000000000000000) (bvslt (extraKeys!5853 (_2!7794 lt!453971)) #b00000000000000000000000000000000) (bvsle (extraKeys!5853 (_2!7794 lt!453971)) #b00000000000000000000000000000011)))))

(declare-fun b!1029692 () Bool)

(declare-fun e!581372 () Bool)

(assert (=> b!1029692 (= e!581377 e!581372)))

(declare-fun res!688718 () Bool)

(assert (=> b!1029692 (=> (not res!688718) (not e!581372))))

(declare-datatypes ((SeekEntryResult!9685 0))(
  ( (MissingZero!9685 (index!41111 (_ BitVec 32))) (Found!9685 (index!41112 (_ BitVec 32))) (Intermediate!9685 (undefined!10497 Bool) (index!41113 (_ BitVec 32)) (x!91633 (_ BitVec 32))) (Undefined!9685) (MissingVacant!9685 (index!41114 (_ BitVec 32))) )
))
(declare-fun lt!453975 () SeekEntryResult!9685)

(assert (=> b!1029692 (= res!688718 (is-Found!9685 lt!453975))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64698 (_ BitVec 32)) SeekEntryResult!9685)

(assert (=> b!1029692 (= lt!453975 (seekEntry!0 key!909 (_keys!11287 thiss!1427) (mask!29884 thiss!1427)))))

(declare-fun b!1029693 () Bool)

(declare-fun e!581376 () Bool)

(declare-fun tp_is_empty!24319 () Bool)

(assert (=> b!1029693 (= e!581376 tp_is_empty!24319)))

(declare-fun b!1029694 () Bool)

(declare-fun res!688720 () Bool)

(assert (=> b!1029694 (=> (not res!688720) (not e!581377))))

(assert (=> b!1029694 (= res!688720 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1029695 () Bool)

(assert (=> b!1029695 (= e!581372 (not e!581374))))

(declare-fun res!688719 () Bool)

(assert (=> b!1029695 (=> res!688719 e!581374)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029695 (= res!688719 (not (validMask!0 (mask!29884 (_2!7794 lt!453971)))))))

(declare-fun lt!453976 () array!64698)

(declare-fun lt!453973 () array!64700)

(declare-fun Unit!33627 () Unit!33625)

(declare-fun Unit!33628 () Unit!33625)

(assert (=> b!1029695 (= lt!453971 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15567 Unit!33627 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29884 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!453976 lt!453973 (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)))) (tuple2!15567 Unit!33628 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29884 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!453976 lt!453973 (_vacant!2808 thiss!1427)))))))

(declare-datatypes ((tuple2!15568 0))(
  ( (tuple2!15569 (_1!7795 (_ BitVec 64)) (_2!7795 V!37299)) )
))
(declare-datatypes ((List!21827 0))(
  ( (Nil!21824) (Cons!21823 (h!23024 tuple2!15568) (t!30921 List!21827)) )
))
(declare-datatypes ((ListLongMap!13687 0))(
  ( (ListLongMap!13688 (toList!6859 List!21827)) )
))
(declare-fun -!486 (ListLongMap!13687 (_ BitVec 64)) ListLongMap!13687)

(declare-fun getCurrentListMap!3907 (array!64698 array!64700 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) Int) ListLongMap!13687)

(assert (=> b!1029695 (= (-!486 (getCurrentListMap!3907 (_keys!11287 thiss!1427) (_values!6144 thiss!1427) (mask!29884 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3907 lt!453976 lt!453973 (mask!29884 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun dynLambda!1956 (Int (_ BitVec 64)) V!37299)

(assert (=> b!1029695 (= lt!453973 (array!64701 (store (arr!31154 (_values!6144 thiss!1427)) (index!41112 lt!453975) (ValueCellFull!11456 (dynLambda!1956 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31670 (_values!6144 thiss!1427))))))

(declare-fun lt!453979 () Unit!33625)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!12 (array!64698 array!64700 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) (_ BitVec 64) Int) Unit!33625)

(assert (=> b!1029695 (= lt!453979 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!12 (_keys!11287 thiss!1427) (_values!6144 thiss!1427) (mask!29884 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!41112 lt!453975) key!909 (defaultEntry!6121 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029695 (not (arrayContainsKey!0 lt!453976 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453972 () Unit!33625)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64698 (_ BitVec 32) (_ BitVec 64)) Unit!33625)

(assert (=> b!1029695 (= lt!453972 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11287 thiss!1427) (index!41112 lt!453975) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64698 (_ BitVec 32)) Bool)

(assert (=> b!1029695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453976 (mask!29884 thiss!1427))))

(declare-fun lt!453977 () Unit!33625)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64698 (_ BitVec 32) (_ BitVec 32)) Unit!33625)

(assert (=> b!1029695 (= lt!453977 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11287 thiss!1427) (index!41112 lt!453975) (mask!29884 thiss!1427)))))

(declare-datatypes ((List!21828 0))(
  ( (Nil!21825) (Cons!21824 (h!23025 (_ BitVec 64)) (t!30922 List!21828)) )
))
(declare-fun arrayNoDuplicates!0 (array!64698 (_ BitVec 32) List!21828) Bool)

(assert (=> b!1029695 (arrayNoDuplicates!0 lt!453976 #b00000000000000000000000000000000 Nil!21825)))

(declare-fun lt!453978 () Unit!33625)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64698 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21828) Unit!33625)

(assert (=> b!1029695 (= lt!453978 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11287 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41112 lt!453975) #b00000000000000000000000000000000 Nil!21825))))

(declare-fun arrayCountValidKeys!0 (array!64698 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029695 (= (arrayCountValidKeys!0 lt!453976 #b00000000000000000000000000000000 (size!31669 (_keys!11287 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11287 thiss!1427) #b00000000000000000000000000000000 (size!31669 (_keys!11287 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029695 (= lt!453976 (array!64699 (store (arr!31153 (_keys!11287 thiss!1427)) (index!41112 lt!453975) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31669 (_keys!11287 thiss!1427))))))

(declare-fun lt!453974 () Unit!33625)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64698 (_ BitVec 32) (_ BitVec 64)) Unit!33625)

(assert (=> b!1029695 (= lt!453974 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11287 thiss!1427) (index!41112 lt!453975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37925 () Bool)

(declare-fun mapRes!37925 () Bool)

(declare-fun tp!72860 () Bool)

(assert (=> mapNonEmpty!37925 (= mapRes!37925 (and tp!72860 e!581376))))

(declare-fun mapRest!37925 () (Array (_ BitVec 32) ValueCell!11456))

(declare-fun mapValue!37925 () ValueCell!11456)

(declare-fun mapKey!37925 () (_ BitVec 32))

(assert (=> mapNonEmpty!37925 (= (arr!31154 (_values!6144 thiss!1427)) (store mapRest!37925 mapKey!37925 mapValue!37925))))

(declare-fun e!581375 () Bool)

(declare-fun array_inv!24115 (array!64698) Bool)

(declare-fun array_inv!24116 (array!64700) Bool)

(assert (=> b!1029696 (= e!581373 (and tp!72861 tp_is_empty!24319 (array_inv!24115 (_keys!11287 thiss!1427)) (array_inv!24116 (_values!6144 thiss!1427)) e!581375))))

(declare-fun b!1029697 () Bool)

(declare-fun e!581371 () Bool)

(assert (=> b!1029697 (= e!581375 (and e!581371 mapRes!37925))))

(declare-fun condMapEmpty!37925 () Bool)

(declare-fun mapDefault!37925 () ValueCell!11456)

