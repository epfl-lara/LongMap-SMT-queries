; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91232 () Bool)

(assert start!91232)

(declare-fun b!1040896 () Bool)

(declare-fun b_free!21029 () Bool)

(declare-fun b_next!21029 () Bool)

(assert (=> b!1040896 (= b_free!21029 (not b_next!21029))))

(declare-fun tp!74291 () Bool)

(declare-fun b_and!33561 () Bool)

(assert (=> b!1040896 (= tp!74291 b_and!33561)))

(declare-fun b!1040890 () Bool)

(declare-fun e!589400 () Bool)

(declare-fun tp_is_empty!24749 () Bool)

(assert (=> b!1040890 (= e!589400 tp_is_empty!24749)))

(declare-fun b!1040891 () Bool)

(declare-fun e!589402 () Bool)

(declare-fun e!589398 () Bool)

(assert (=> b!1040891 (= e!589402 e!589398)))

(declare-fun res!693882 () Bool)

(assert (=> b!1040891 (=> (not res!693882) (not e!589398))))

(declare-datatypes ((SeekEntryResult!9803 0))(
  ( (MissingZero!9803 (index!41583 (_ BitVec 32))) (Found!9803 (index!41584 (_ BitVec 32))) (Intermediate!9803 (undefined!10615 Bool) (index!41585 (_ BitVec 32)) (x!92923 (_ BitVec 32))) (Undefined!9803) (MissingVacant!9803 (index!41586 (_ BitVec 32))) )
))
(declare-fun lt!458773 () SeekEntryResult!9803)

(assert (=> b!1040891 (= res!693882 (is-Found!9803 lt!458773))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37871 0))(
  ( (V!37872 (val!12425 Int)) )
))
(declare-datatypes ((ValueCell!11671 0))(
  ( (ValueCellFull!11671 (v!15012 V!37871)) (EmptyCell!11671) )
))
(declare-datatypes ((array!65640 0))(
  ( (array!65641 (arr!31583 (Array (_ BitVec 32) (_ BitVec 64))) (size!32114 (_ BitVec 32))) )
))
(declare-datatypes ((array!65642 0))(
  ( (array!65643 (arr!31584 (Array (_ BitVec 32) ValueCell!11671)) (size!32115 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5936 0))(
  ( (LongMapFixedSize!5937 (defaultEntry!6350 Int) (mask!30357 (_ BitVec 32)) (extraKeys!6078 (_ BitVec 32)) (zeroValue!6184 V!37871) (minValue!6184 V!37871) (_size!3023 (_ BitVec 32)) (_keys!11576 array!65640) (_values!6373 array!65642) (_vacant!3023 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5936)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65640 (_ BitVec 32)) SeekEntryResult!9803)

(assert (=> b!1040891 (= lt!458773 (seekEntry!0 key!909 (_keys!11576 thiss!1427) (mask!30357 thiss!1427)))))

(declare-fun b!1040892 () Bool)

(declare-fun e!589399 () Bool)

(assert (=> b!1040892 (= e!589398 (not e!589399))))

(declare-fun res!693881 () Bool)

(assert (=> b!1040892 (=> res!693881 e!589399)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040892 (= res!693881 (not (validMask!0 (mask!30357 thiss!1427))))))

(declare-fun lt!458777 () array!65640)

(declare-fun arrayContainsKey!0 (array!65640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040892 (not (arrayContainsKey!0 lt!458777 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34027 0))(
  ( (Unit!34028) )
))
(declare-fun lt!458775 () Unit!34027)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65640 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> b!1040892 (= lt!458775 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11576 thiss!1427) (index!41584 lt!458773) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65640 (_ BitVec 32)) Bool)

(assert (=> b!1040892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458777 (mask!30357 thiss!1427))))

(declare-fun lt!458776 () Unit!34027)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65640 (_ BitVec 32) (_ BitVec 32)) Unit!34027)

(assert (=> b!1040892 (= lt!458776 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11576 thiss!1427) (index!41584 lt!458773) (mask!30357 thiss!1427)))))

(declare-datatypes ((List!21965 0))(
  ( (Nil!21962) (Cons!21961 (h!23165 (_ BitVec 64)) (t!31179 List!21965)) )
))
(declare-fun arrayNoDuplicates!0 (array!65640 (_ BitVec 32) List!21965) Bool)

(assert (=> b!1040892 (arrayNoDuplicates!0 lt!458777 #b00000000000000000000000000000000 Nil!21962)))

(declare-fun lt!458774 () Unit!34027)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21965) Unit!34027)

(assert (=> b!1040892 (= lt!458774 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11576 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41584 lt!458773) #b00000000000000000000000000000000 Nil!21962))))

(declare-fun arrayCountValidKeys!0 (array!65640 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040892 (= (arrayCountValidKeys!0 lt!458777 #b00000000000000000000000000000000 (size!32114 (_keys!11576 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11576 thiss!1427) #b00000000000000000000000000000000 (size!32114 (_keys!11576 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040892 (= lt!458777 (array!65641 (store (arr!31583 (_keys!11576 thiss!1427)) (index!41584 lt!458773) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32114 (_keys!11576 thiss!1427))))))

(declare-fun lt!458778 () Unit!34027)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65640 (_ BitVec 32) (_ BitVec 64)) Unit!34027)

(assert (=> b!1040892 (= lt!458778 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11576 thiss!1427) (index!41584 lt!458773) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38710 () Bool)

(declare-fun mapRes!38710 () Bool)

(assert (=> mapIsEmpty!38710 mapRes!38710))

(declare-fun b!1040893 () Bool)

(declare-fun e!589397 () Bool)

(assert (=> b!1040893 (= e!589397 tp_is_empty!24749)))

(declare-fun mapNonEmpty!38710 () Bool)

(declare-fun tp!74290 () Bool)

(assert (=> mapNonEmpty!38710 (= mapRes!38710 (and tp!74290 e!589397))))

(declare-fun mapRest!38710 () (Array (_ BitVec 32) ValueCell!11671))

(declare-fun mapValue!38710 () ValueCell!11671)

(declare-fun mapKey!38710 () (_ BitVec 32))

(assert (=> mapNonEmpty!38710 (= (arr!31584 (_values!6373 thiss!1427)) (store mapRest!38710 mapKey!38710 mapValue!38710))))

(declare-fun b!1040894 () Bool)

(assert (=> b!1040894 (= e!589399 (= (size!32115 (_values!6373 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30357 thiss!1427))))))

(declare-fun res!693880 () Bool)

(assert (=> start!91232 (=> (not res!693880) (not e!589402))))

(declare-fun valid!2229 (LongMapFixedSize!5936) Bool)

(assert (=> start!91232 (= res!693880 (valid!2229 thiss!1427))))

(assert (=> start!91232 e!589402))

(declare-fun e!589401 () Bool)

(assert (=> start!91232 e!589401))

(assert (=> start!91232 true))

(declare-fun b!1040895 () Bool)

(declare-fun e!589395 () Bool)

(assert (=> b!1040895 (= e!589395 (and e!589400 mapRes!38710))))

(declare-fun condMapEmpty!38710 () Bool)

(declare-fun mapDefault!38710 () ValueCell!11671)

