; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91664 () Bool)

(assert start!91664)

(declare-fun b!1043528 () Bool)

(declare-fun b_free!21101 () Bool)

(declare-fun b_next!21101 () Bool)

(assert (=> b!1043528 (= b_free!21101 (not b_next!21101))))

(declare-fun tp!74541 () Bool)

(declare-fun b_and!33637 () Bool)

(assert (=> b!1043528 (= tp!74541 b_and!33637)))

(declare-fun b!1043523 () Bool)

(declare-fun e!591273 () Bool)

(declare-fun tp_is_empty!24821 () Bool)

(assert (=> b!1043523 (= e!591273 tp_is_empty!24821)))

(declare-fun mapIsEmpty!38852 () Bool)

(declare-fun mapRes!38852 () Bool)

(assert (=> mapIsEmpty!38852 mapRes!38852))

(declare-fun b!1043525 () Bool)

(declare-fun e!591271 () Bool)

(declare-datatypes ((SeekEntryResult!9833 0))(
  ( (MissingZero!9833 (index!41703 (_ BitVec 32))) (Found!9833 (index!41704 (_ BitVec 32))) (Intermediate!9833 (undefined!10645 Bool) (index!41705 (_ BitVec 32)) (x!93171 (_ BitVec 32))) (Undefined!9833) (MissingVacant!9833 (index!41706 (_ BitVec 32))) )
))
(declare-fun lt!460013 () SeekEntryResult!9833)

(declare-datatypes ((V!37967 0))(
  ( (V!37968 (val!12461 Int)) )
))
(declare-datatypes ((ValueCell!11707 0))(
  ( (ValueCellFull!11707 (v!15052 V!37967)) (EmptyCell!11707) )
))
(declare-datatypes ((array!65804 0))(
  ( (array!65805 (arr!31655 (Array (_ BitVec 32) (_ BitVec 64))) (size!32190 (_ BitVec 32))) )
))
(declare-datatypes ((array!65806 0))(
  ( (array!65807 (arr!31656 (Array (_ BitVec 32) ValueCell!11707)) (size!32191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6008 0))(
  ( (LongMapFixedSize!6009 (defaultEntry!6386 Int) (mask!30477 (_ BitVec 32)) (extraKeys!6114 (_ BitVec 32)) (zeroValue!6220 V!37967) (minValue!6220 V!37967) (_size!3059 (_ BitVec 32)) (_keys!11644 array!65804) (_values!6409 array!65806) (_vacant!3059 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6008)

(assert (=> b!1043525 (= e!591271 (not (and (bvsge (index!41704 lt!460013) #b00000000000000000000000000000000) (bvslt (index!41704 lt!460013) (size!32190 (_keys!11644 thiss!1427))))))))

(declare-fun lt!460018 () array!65804)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15738 0))(
  ( (tuple2!15739 (_1!7880 (_ BitVec 64)) (_2!7880 V!37967)) )
))
(declare-datatypes ((List!21992 0))(
  ( (Nil!21989) (Cons!21988 (h!23196 tuple2!15738) (t!31212 List!21992)) )
))
(declare-datatypes ((ListLongMap!13767 0))(
  ( (ListLongMap!13768 (toList!6899 List!21992)) )
))
(declare-fun -!526 (ListLongMap!13767 (_ BitVec 64)) ListLongMap!13767)

(declare-fun getCurrentListMap!3947 (array!65804 array!65806 (_ BitVec 32) (_ BitVec 32) V!37967 V!37967 (_ BitVec 32) Int) ListLongMap!13767)

(declare-fun dynLambda!1996 (Int (_ BitVec 64)) V!37967)

(assert (=> b!1043525 (= (-!526 (getCurrentListMap!3947 (_keys!11644 thiss!1427) (_values!6409 thiss!1427) (mask!30477 thiss!1427) (extraKeys!6114 thiss!1427) (zeroValue!6220 thiss!1427) (minValue!6220 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6386 thiss!1427)) key!909) (getCurrentListMap!3947 lt!460018 (array!65807 (store (arr!31656 (_values!6409 thiss!1427)) (index!41704 lt!460013) (ValueCellFull!11707 (dynLambda!1996 (defaultEntry!6386 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32191 (_values!6409 thiss!1427))) (mask!30477 thiss!1427) (extraKeys!6114 thiss!1427) (zeroValue!6220 thiss!1427) (minValue!6220 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6386 thiss!1427)))))

(declare-datatypes ((Unit!34073 0))(
  ( (Unit!34074) )
))
(declare-fun lt!460014 () Unit!34073)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (array!65804 array!65806 (_ BitVec 32) (_ BitVec 32) V!37967 V!37967 (_ BitVec 32) (_ BitVec 64) Int) Unit!34073)

(assert (=> b!1043525 (= lt!460014 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (_keys!11644 thiss!1427) (_values!6409 thiss!1427) (mask!30477 thiss!1427) (extraKeys!6114 thiss!1427) (zeroValue!6220 thiss!1427) (minValue!6220 thiss!1427) (index!41704 lt!460013) key!909 (defaultEntry!6386 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043525 (not (arrayContainsKey!0 lt!460018 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460012 () Unit!34073)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65804 (_ BitVec 32) (_ BitVec 64)) Unit!34073)

(assert (=> b!1043525 (= lt!460012 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11644 thiss!1427) (index!41704 lt!460013) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65804 (_ BitVec 32)) Bool)

(assert (=> b!1043525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460018 (mask!30477 thiss!1427))))

(declare-fun lt!460017 () Unit!34073)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65804 (_ BitVec 32) (_ BitVec 32)) Unit!34073)

(assert (=> b!1043525 (= lt!460017 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11644 thiss!1427) (index!41704 lt!460013) (mask!30477 thiss!1427)))))

(declare-datatypes ((List!21993 0))(
  ( (Nil!21990) (Cons!21989 (h!23197 (_ BitVec 64)) (t!31213 List!21993)) )
))
(declare-fun arrayNoDuplicates!0 (array!65804 (_ BitVec 32) List!21993) Bool)

(assert (=> b!1043525 (arrayNoDuplicates!0 lt!460018 #b00000000000000000000000000000000 Nil!21990)))

(declare-fun lt!460016 () Unit!34073)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65804 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21993) Unit!34073)

(assert (=> b!1043525 (= lt!460016 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11644 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41704 lt!460013) #b00000000000000000000000000000000 Nil!21990))))

(declare-fun arrayCountValidKeys!0 (array!65804 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043525 (= (arrayCountValidKeys!0 lt!460018 #b00000000000000000000000000000000 (size!32190 (_keys!11644 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11644 thiss!1427) #b00000000000000000000000000000000 (size!32190 (_keys!11644 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043525 (= lt!460018 (array!65805 (store (arr!31655 (_keys!11644 thiss!1427)) (index!41704 lt!460013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32190 (_keys!11644 thiss!1427))))))

(declare-fun lt!460015 () Unit!34073)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65804 (_ BitVec 32) (_ BitVec 64)) Unit!34073)

(assert (=> b!1043525 (= lt!460015 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11644 thiss!1427) (index!41704 lt!460013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043526 () Bool)

(declare-fun e!591270 () Bool)

(assert (=> b!1043526 (= e!591270 (and e!591273 mapRes!38852))))

(declare-fun condMapEmpty!38852 () Bool)

(declare-fun mapDefault!38852 () ValueCell!11707)

