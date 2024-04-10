; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91776 () Bool)

(assert start!91776)

(declare-fun b!1044365 () Bool)

(declare-fun b_free!21119 () Bool)

(declare-fun b_next!21119 () Bool)

(assert (=> b!1044365 (= b_free!21119 (not b_next!21119))))

(declare-fun tp!74603 () Bool)

(declare-fun b_and!33693 () Bool)

(assert (=> b!1044365 (= tp!74603 b_and!33693)))

(declare-fun b!1044361 () Bool)

(declare-fun res!695594 () Bool)

(declare-fun e!591869 () Bool)

(assert (=> b!1044361 (=> (not res!695594) (not e!591869))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044361 (= res!695594 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044362 () Bool)

(declare-fun e!591865 () Bool)

(assert (=> b!1044362 (= e!591869 e!591865)))

(declare-fun res!695592 () Bool)

(assert (=> b!1044362 (=> (not res!695592) (not e!591865))))

(declare-datatypes ((SeekEntryResult!9840 0))(
  ( (MissingZero!9840 (index!41731 (_ BitVec 32))) (Found!9840 (index!41732 (_ BitVec 32))) (Intermediate!9840 (undefined!10652 Bool) (index!41733 (_ BitVec 32)) (x!93258 (_ BitVec 32))) (Undefined!9840) (MissingVacant!9840 (index!41734 (_ BitVec 32))) )
))
(declare-fun lt!460662 () SeekEntryResult!9840)

(assert (=> b!1044362 (= res!695592 (is-Found!9840 lt!460662))))

(declare-datatypes ((V!37991 0))(
  ( (V!37992 (val!12470 Int)) )
))
(declare-datatypes ((ValueCell!11716 0))(
  ( (ValueCellFull!11716 (v!15062 V!37991)) (EmptyCell!11716) )
))
(declare-datatypes ((array!65846 0))(
  ( (array!65847 (arr!31673 (Array (_ BitVec 32) (_ BitVec 64))) (size!32208 (_ BitVec 32))) )
))
(declare-datatypes ((array!65848 0))(
  ( (array!65849 (arr!31674 (Array (_ BitVec 32) ValueCell!11716)) (size!32209 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6026 0))(
  ( (LongMapFixedSize!6027 (defaultEntry!6401 Int) (mask!30508 (_ BitVec 32)) (extraKeys!6129 (_ BitVec 32)) (zeroValue!6235 V!37991) (minValue!6235 V!37991) (_size!3068 (_ BitVec 32)) (_keys!11665 array!65846) (_values!6424 array!65848) (_vacant!3068 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6026)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65846 (_ BitVec 32)) SeekEntryResult!9840)

(assert (=> b!1044362 (= lt!460662 (seekEntry!0 key!909 (_keys!11665 thiss!1427) (mask!30508 thiss!1427)))))

(declare-fun b!1044363 () Bool)

(declare-fun e!591868 () Bool)

(assert (=> b!1044363 (= e!591865 (not e!591868))))

(declare-fun res!695595 () Bool)

(assert (=> b!1044363 (=> res!695595 e!591868)))

(declare-datatypes ((Unit!34103 0))(
  ( (Unit!34104) )
))
(declare-datatypes ((tuple2!15760 0))(
  ( (tuple2!15761 (_1!7891 Unit!34103) (_2!7891 LongMapFixedSize!6026)) )
))
(declare-fun lt!460663 () tuple2!15760)

(declare-datatypes ((tuple2!15762 0))(
  ( (tuple2!15763 (_1!7892 (_ BitVec 64)) (_2!7892 V!37991)) )
))
(declare-datatypes ((List!22006 0))(
  ( (Nil!22003) (Cons!22002 (h!23210 tuple2!15762) (t!31246 List!22006)) )
))
(declare-datatypes ((ListLongMap!13781 0))(
  ( (ListLongMap!13782 (toList!6906 List!22006)) )
))
(declare-fun contains!6071 (ListLongMap!13781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3954 (array!65846 array!65848 (_ BitVec 32) (_ BitVec 32) V!37991 V!37991 (_ BitVec 32) Int) ListLongMap!13781)

(assert (=> b!1044363 (= res!695595 (not (contains!6071 (getCurrentListMap!3954 (_keys!11665 (_2!7891 lt!460663)) (_values!6424 (_2!7891 lt!460663)) (mask!30508 (_2!7891 lt!460663)) (extraKeys!6129 (_2!7891 lt!460663)) (zeroValue!6235 (_2!7891 lt!460663)) (minValue!6235 (_2!7891 lt!460663)) #b00000000000000000000000000000000 (defaultEntry!6401 (_2!7891 lt!460663))) key!909)))))

(declare-fun lt!460664 () array!65846)

(declare-fun lt!460669 () array!65848)

(declare-fun Unit!34105 () Unit!34103)

(declare-fun Unit!34106 () Unit!34103)

(assert (=> b!1044363 (= lt!460663 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3068 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15761 Unit!34105 (LongMapFixedSize!6027 (defaultEntry!6401 thiss!1427) (mask!30508 thiss!1427) (extraKeys!6129 thiss!1427) (zeroValue!6235 thiss!1427) (minValue!6235 thiss!1427) (bvsub (_size!3068 thiss!1427) #b00000000000000000000000000000001) lt!460664 lt!460669 (bvadd #b00000000000000000000000000000001 (_vacant!3068 thiss!1427)))) (tuple2!15761 Unit!34106 (LongMapFixedSize!6027 (defaultEntry!6401 thiss!1427) (mask!30508 thiss!1427) (extraKeys!6129 thiss!1427) (zeroValue!6235 thiss!1427) (minValue!6235 thiss!1427) (bvsub (_size!3068 thiss!1427) #b00000000000000000000000000000001) lt!460664 lt!460669 (_vacant!3068 thiss!1427)))))))

(declare-fun -!533 (ListLongMap!13781 (_ BitVec 64)) ListLongMap!13781)

(assert (=> b!1044363 (= (-!533 (getCurrentListMap!3954 (_keys!11665 thiss!1427) (_values!6424 thiss!1427) (mask!30508 thiss!1427) (extraKeys!6129 thiss!1427) (zeroValue!6235 thiss!1427) (minValue!6235 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6401 thiss!1427)) key!909) (getCurrentListMap!3954 lt!460664 lt!460669 (mask!30508 thiss!1427) (extraKeys!6129 thiss!1427) (zeroValue!6235 thiss!1427) (minValue!6235 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6401 thiss!1427)))))

(declare-fun dynLambda!2003 (Int (_ BitVec 64)) V!37991)

(assert (=> b!1044363 (= lt!460669 (array!65849 (store (arr!31674 (_values!6424 thiss!1427)) (index!41732 lt!460662) (ValueCellFull!11716 (dynLambda!2003 (defaultEntry!6401 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32209 (_values!6424 thiss!1427))))))

(declare-fun lt!460670 () Unit!34103)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (array!65846 array!65848 (_ BitVec 32) (_ BitVec 32) V!37991 V!37991 (_ BitVec 32) (_ BitVec 64) Int) Unit!34103)

(assert (=> b!1044363 (= lt!460670 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (_keys!11665 thiss!1427) (_values!6424 thiss!1427) (mask!30508 thiss!1427) (extraKeys!6129 thiss!1427) (zeroValue!6235 thiss!1427) (minValue!6235 thiss!1427) (index!41732 lt!460662) key!909 (defaultEntry!6401 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044363 (not (arrayContainsKey!0 lt!460664 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460668 () Unit!34103)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65846 (_ BitVec 32) (_ BitVec 64)) Unit!34103)

(assert (=> b!1044363 (= lt!460668 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11665 thiss!1427) (index!41732 lt!460662) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65846 (_ BitVec 32)) Bool)

(assert (=> b!1044363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460664 (mask!30508 thiss!1427))))

(declare-fun lt!460666 () Unit!34103)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65846 (_ BitVec 32) (_ BitVec 32)) Unit!34103)

(assert (=> b!1044363 (= lt!460666 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11665 thiss!1427) (index!41732 lt!460662) (mask!30508 thiss!1427)))))

(declare-datatypes ((List!22007 0))(
  ( (Nil!22004) (Cons!22003 (h!23211 (_ BitVec 64)) (t!31247 List!22007)) )
))
(declare-fun arrayNoDuplicates!0 (array!65846 (_ BitVec 32) List!22007) Bool)

(assert (=> b!1044363 (arrayNoDuplicates!0 lt!460664 #b00000000000000000000000000000000 Nil!22004)))

(declare-fun lt!460665 () Unit!34103)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65846 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22007) Unit!34103)

(assert (=> b!1044363 (= lt!460665 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11665 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41732 lt!460662) #b00000000000000000000000000000000 Nil!22004))))

(declare-fun arrayCountValidKeys!0 (array!65846 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044363 (= (arrayCountValidKeys!0 lt!460664 #b00000000000000000000000000000000 (size!32208 (_keys!11665 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11665 thiss!1427) #b00000000000000000000000000000000 (size!32208 (_keys!11665 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044363 (= lt!460664 (array!65847 (store (arr!31673 (_keys!11665 thiss!1427)) (index!41732 lt!460662) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32208 (_keys!11665 thiss!1427))))))

(declare-fun lt!460667 () Unit!34103)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65846 (_ BitVec 32) (_ BitVec 64)) Unit!34103)

(assert (=> b!1044363 (= lt!460667 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11665 thiss!1427) (index!41732 lt!460662) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695593 () Bool)

(assert (=> start!91776 (=> (not res!695593) (not e!591869))))

(declare-fun valid!2261 (LongMapFixedSize!6026) Bool)

(assert (=> start!91776 (= res!695593 (valid!2261 thiss!1427))))

(assert (=> start!91776 e!591869))

(declare-fun e!591870 () Bool)

(assert (=> start!91776 e!591870))

(assert (=> start!91776 true))

(declare-fun b!1044364 () Bool)

(declare-fun res!695591 () Bool)

(assert (=> b!1044364 (=> res!695591 e!591868)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044364 (= res!695591 (not (validMask!0 (mask!30508 (_2!7891 lt!460663)))))))

(declare-fun e!591866 () Bool)

(declare-fun tp_is_empty!24839 () Bool)

(declare-fun array_inv!24465 (array!65846) Bool)

(declare-fun array_inv!24466 (array!65848) Bool)

(assert (=> b!1044365 (= e!591870 (and tp!74603 tp_is_empty!24839 (array_inv!24465 (_keys!11665 thiss!1427)) (array_inv!24466 (_values!6424 thiss!1427)) e!591866))))

(declare-fun b!1044366 () Bool)

(declare-fun e!591871 () Bool)

(assert (=> b!1044366 (= e!591871 tp_is_empty!24839)))

(declare-fun b!1044367 () Bool)

(declare-fun mapRes!38888 () Bool)

(assert (=> b!1044367 (= e!591866 (and e!591871 mapRes!38888))))

(declare-fun condMapEmpty!38888 () Bool)

(declare-fun mapDefault!38888 () ValueCell!11716)

