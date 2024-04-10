; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89976 () Bool)

(assert start!89976)

(declare-fun b!1030412 () Bool)

(declare-fun b_free!20615 () Bool)

(declare-fun b_next!20615 () Bool)

(assert (=> b!1030412 (= b_free!20615 (not b_next!20615))))

(declare-fun tp!72913 () Bool)

(declare-fun b_and!32991 () Bool)

(assert (=> b!1030412 (= tp!72913 b_and!32991)))

(declare-fun b!1030407 () Bool)

(declare-fun res!689053 () Bool)

(declare-fun e!581861 () Bool)

(assert (=> b!1030407 (=> res!689053 e!581861)))

(declare-datatypes ((V!37319 0))(
  ( (V!37320 (val!12218 Int)) )
))
(declare-datatypes ((ValueCell!11464 0))(
  ( (ValueCellFull!11464 (v!14795 V!37319)) (EmptyCell!11464) )
))
(declare-datatypes ((Unit!33657 0))(
  ( (Unit!33658) )
))
(declare-datatypes ((array!64732 0))(
  ( (array!64733 (arr!31169 (Array (_ BitVec 32) (_ BitVec 64))) (size!31686 (_ BitVec 32))) )
))
(declare-datatypes ((array!64734 0))(
  ( (array!64735 (arr!31170 (Array (_ BitVec 32) ValueCell!11464)) (size!31687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5522 0))(
  ( (LongMapFixedSize!5523 (defaultEntry!6133 Int) (mask!29909 (_ BitVec 32)) (extraKeys!5865 (_ BitVec 32)) (zeroValue!5969 V!37319) (minValue!5969 V!37319) (_size!2816 (_ BitVec 32)) (_keys!11304 array!64732) (_values!6156 array!64734) (_vacant!2816 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15586 0))(
  ( (tuple2!15587 (_1!7804 Unit!33657) (_2!7804 LongMapFixedSize!5522)) )
))
(declare-fun lt!454535 () tuple2!15586)

(assert (=> b!1030407 (= res!689053 (or (not (= (size!31687 (_values!6156 (_2!7804 lt!454535))) (bvadd #b00000000000000000000000000000001 (mask!29909 (_2!7804 lt!454535))))) (not (= (size!31686 (_keys!11304 (_2!7804 lt!454535))) (size!31687 (_values!6156 (_2!7804 lt!454535))))) (bvslt (mask!29909 (_2!7804 lt!454535)) #b00000000000000000000000000000000) (bvslt (extraKeys!5865 (_2!7804 lt!454535)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5865 (_2!7804 lt!454535)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37953 () Bool)

(declare-fun mapRes!37953 () Bool)

(declare-fun tp!72912 () Bool)

(declare-fun e!581862 () Bool)

(assert (=> mapNonEmpty!37953 (= mapRes!37953 (and tp!72912 e!581862))))

(declare-fun mapRest!37953 () (Array (_ BitVec 32) ValueCell!11464))

(declare-fun mapValue!37953 () ValueCell!11464)

(declare-fun thiss!1427 () LongMapFixedSize!5522)

(declare-fun mapKey!37953 () (_ BitVec 32))

(assert (=> mapNonEmpty!37953 (= (arr!31170 (_values!6156 thiss!1427)) (store mapRest!37953 mapKey!37953 mapValue!37953))))

(declare-fun b!1030408 () Bool)

(declare-fun res!689054 () Bool)

(declare-fun e!581863 () Bool)

(assert (=> b!1030408 (=> (not res!689054) (not e!581863))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030408 (= res!689054 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030409 () Bool)

(declare-fun tp_is_empty!24335 () Bool)

(assert (=> b!1030409 (= e!581862 tp_is_empty!24335)))

(declare-fun b!1030410 () Bool)

(declare-fun e!581864 () Bool)

(assert (=> b!1030410 (= e!581864 tp_is_empty!24335)))

(declare-fun b!1030411 () Bool)

(declare-datatypes ((List!21837 0))(
  ( (Nil!21834) (Cons!21833 (h!23035 (_ BitVec 64)) (t!30947 List!21837)) )
))
(declare-fun arrayNoDuplicates!0 (array!64732 (_ BitVec 32) List!21837) Bool)

(assert (=> b!1030411 (= e!581861 (arrayNoDuplicates!0 (_keys!11304 (_2!7804 lt!454535)) #b00000000000000000000000000000000 Nil!21834))))

(declare-fun e!581867 () Bool)

(declare-fun e!581865 () Bool)

(declare-fun array_inv!24129 (array!64732) Bool)

(declare-fun array_inv!24130 (array!64734) Bool)

(assert (=> b!1030412 (= e!581867 (and tp!72913 tp_is_empty!24335 (array_inv!24129 (_keys!11304 thiss!1427)) (array_inv!24130 (_values!6156 thiss!1427)) e!581865))))

(declare-fun res!689056 () Bool)

(assert (=> start!89976 (=> (not res!689056) (not e!581863))))

(declare-fun valid!2090 (LongMapFixedSize!5522) Bool)

(assert (=> start!89976 (= res!689056 (valid!2090 thiss!1427))))

(assert (=> start!89976 e!581863))

(assert (=> start!89976 e!581867))

(assert (=> start!89976 true))

(declare-fun b!1030413 () Bool)

(declare-fun res!689057 () Bool)

(assert (=> b!1030413 (=> res!689057 e!581861)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64732 (_ BitVec 32)) Bool)

(assert (=> b!1030413 (= res!689057 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11304 (_2!7804 lt!454535)) (mask!29909 (_2!7804 lt!454535)))))))

(declare-fun b!1030414 () Bool)

(declare-fun e!581860 () Bool)

(assert (=> b!1030414 (= e!581860 (not e!581861))))

(declare-fun res!689058 () Bool)

(assert (=> b!1030414 (=> res!689058 e!581861)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030414 (= res!689058 (not (validMask!0 (mask!29909 (_2!7804 lt!454535)))))))

(declare-fun lt!454529 () array!64732)

(declare-fun lt!454528 () array!64734)

(declare-fun Unit!33659 () Unit!33657)

(declare-fun Unit!33660 () Unit!33657)

(assert (=> b!1030414 (= lt!454535 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2816 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15587 Unit!33659 (LongMapFixedSize!5523 (defaultEntry!6133 thiss!1427) (mask!29909 thiss!1427) (extraKeys!5865 thiss!1427) (zeroValue!5969 thiss!1427) (minValue!5969 thiss!1427) (bvsub (_size!2816 thiss!1427) #b00000000000000000000000000000001) lt!454529 lt!454528 (bvadd #b00000000000000000000000000000001 (_vacant!2816 thiss!1427)))) (tuple2!15587 Unit!33660 (LongMapFixedSize!5523 (defaultEntry!6133 thiss!1427) (mask!29909 thiss!1427) (extraKeys!5865 thiss!1427) (zeroValue!5969 thiss!1427) (minValue!5969 thiss!1427) (bvsub (_size!2816 thiss!1427) #b00000000000000000000000000000001) lt!454529 lt!454528 (_vacant!2816 thiss!1427)))))))

(declare-datatypes ((tuple2!15588 0))(
  ( (tuple2!15589 (_1!7805 (_ BitVec 64)) (_2!7805 V!37319)) )
))
(declare-datatypes ((List!21838 0))(
  ( (Nil!21835) (Cons!21834 (h!23036 tuple2!15588) (t!30948 List!21838)) )
))
(declare-datatypes ((ListLongMap!13697 0))(
  ( (ListLongMap!13698 (toList!6864 List!21838)) )
))
(declare-fun -!491 (ListLongMap!13697 (_ BitVec 64)) ListLongMap!13697)

(declare-fun getCurrentListMap!3912 (array!64732 array!64734 (_ BitVec 32) (_ BitVec 32) V!37319 V!37319 (_ BitVec 32) Int) ListLongMap!13697)

(assert (=> b!1030414 (= (-!491 (getCurrentListMap!3912 (_keys!11304 thiss!1427) (_values!6156 thiss!1427) (mask!29909 thiss!1427) (extraKeys!5865 thiss!1427) (zeroValue!5969 thiss!1427) (minValue!5969 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6133 thiss!1427)) key!909) (getCurrentListMap!3912 lt!454529 lt!454528 (mask!29909 thiss!1427) (extraKeys!5865 thiss!1427) (zeroValue!5969 thiss!1427) (minValue!5969 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6133 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9690 0))(
  ( (MissingZero!9690 (index!41131 (_ BitVec 32))) (Found!9690 (index!41132 (_ BitVec 32))) (Intermediate!9690 (undefined!10502 Bool) (index!41133 (_ BitVec 32)) (x!91700 (_ BitVec 32))) (Undefined!9690) (MissingVacant!9690 (index!41134 (_ BitVec 32))) )
))
(declare-fun lt!454532 () SeekEntryResult!9690)

(declare-fun dynLambda!1961 (Int (_ BitVec 64)) V!37319)

(assert (=> b!1030414 (= lt!454528 (array!64735 (store (arr!31170 (_values!6156 thiss!1427)) (index!41132 lt!454532) (ValueCellFull!11464 (dynLambda!1961 (defaultEntry!6133 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31687 (_values!6156 thiss!1427))))))

(declare-fun lt!454534 () Unit!33657)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!17 (array!64732 array!64734 (_ BitVec 32) (_ BitVec 32) V!37319 V!37319 (_ BitVec 32) (_ BitVec 64) Int) Unit!33657)

(assert (=> b!1030414 (= lt!454534 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!17 (_keys!11304 thiss!1427) (_values!6156 thiss!1427) (mask!29909 thiss!1427) (extraKeys!5865 thiss!1427) (zeroValue!5969 thiss!1427) (minValue!5969 thiss!1427) (index!41132 lt!454532) key!909 (defaultEntry!6133 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030414 (not (arrayContainsKey!0 lt!454529 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454531 () Unit!33657)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64732 (_ BitVec 32) (_ BitVec 64)) Unit!33657)

(assert (=> b!1030414 (= lt!454531 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11304 thiss!1427) (index!41132 lt!454532) key!909))))

(assert (=> b!1030414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454529 (mask!29909 thiss!1427))))

(declare-fun lt!454536 () Unit!33657)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64732 (_ BitVec 32) (_ BitVec 32)) Unit!33657)

(assert (=> b!1030414 (= lt!454536 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11304 thiss!1427) (index!41132 lt!454532) (mask!29909 thiss!1427)))))

(assert (=> b!1030414 (arrayNoDuplicates!0 lt!454529 #b00000000000000000000000000000000 Nil!21834)))

(declare-fun lt!454530 () Unit!33657)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21837) Unit!33657)

(assert (=> b!1030414 (= lt!454530 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11304 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41132 lt!454532) #b00000000000000000000000000000000 Nil!21834))))

(declare-fun arrayCountValidKeys!0 (array!64732 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030414 (= (arrayCountValidKeys!0 lt!454529 #b00000000000000000000000000000000 (size!31686 (_keys!11304 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11304 thiss!1427) #b00000000000000000000000000000000 (size!31686 (_keys!11304 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030414 (= lt!454529 (array!64733 (store (arr!31169 (_keys!11304 thiss!1427)) (index!41132 lt!454532) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31686 (_keys!11304 thiss!1427))))))

(declare-fun lt!454533 () Unit!33657)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64732 (_ BitVec 32) (_ BitVec 64)) Unit!33657)

(assert (=> b!1030414 (= lt!454533 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11304 thiss!1427) (index!41132 lt!454532) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030415 () Bool)

(assert (=> b!1030415 (= e!581863 e!581860)))

(declare-fun res!689055 () Bool)

(assert (=> b!1030415 (=> (not res!689055) (not e!581860))))

(assert (=> b!1030415 (= res!689055 (is-Found!9690 lt!454532))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64732 (_ BitVec 32)) SeekEntryResult!9690)

(assert (=> b!1030415 (= lt!454532 (seekEntry!0 key!909 (_keys!11304 thiss!1427) (mask!29909 thiss!1427)))))

(declare-fun b!1030416 () Bool)

(assert (=> b!1030416 (= e!581865 (and e!581864 mapRes!37953))))

(declare-fun condMapEmpty!37953 () Bool)

(declare-fun mapDefault!37953 () ValueCell!11464)

