; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89516 () Bool)

(assert start!89516)

(declare-fun b!1026671 () Bool)

(declare-fun b_free!20515 () Bool)

(declare-fun b_next!20515 () Bool)

(assert (=> b!1026671 (= b_free!20515 (not b_next!20515))))

(declare-fun tp!72591 () Bool)

(declare-fun b_and!32761 () Bool)

(assert (=> b!1026671 (= tp!72591 b_and!32761)))

(declare-fun e!579233 () Bool)

(declare-fun tp_is_empty!24235 () Bool)

(declare-datatypes ((V!37187 0))(
  ( (V!37188 (val!12168 Int)) )
))
(declare-datatypes ((ValueCell!11414 0))(
  ( (ValueCellFull!11414 (v!14737 V!37187)) (EmptyCell!11414) )
))
(declare-datatypes ((array!64520 0))(
  ( (array!64521 (arr!31069 (Array (_ BitVec 32) (_ BitVec 64))) (size!31582 (_ BitVec 32))) )
))
(declare-datatypes ((array!64522 0))(
  ( (array!64523 (arr!31070 (Array (_ BitVec 32) ValueCell!11414)) (size!31583 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5422 0))(
  ( (LongMapFixedSize!5423 (defaultEntry!6063 Int) (mask!29763 (_ BitVec 32)) (extraKeys!5795 (_ BitVec 32)) (zeroValue!5899 V!37187) (minValue!5899 V!37187) (_size!2766 (_ BitVec 32)) (_keys!11210 array!64520) (_values!6086 array!64522) (_vacant!2766 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5422)

(declare-fun e!579236 () Bool)

(declare-fun array_inv!24057 (array!64520) Bool)

(declare-fun array_inv!24058 (array!64522) Bool)

(assert (=> b!1026671 (= e!579233 (and tp!72591 tp_is_empty!24235 (array_inv!24057 (_keys!11210 thiss!1427)) (array_inv!24058 (_values!6086 thiss!1427)) e!579236))))

(declare-fun b!1026672 () Bool)

(declare-fun e!579237 () Bool)

(assert (=> b!1026672 (= e!579237 tp_is_empty!24235)))

(declare-fun mapNonEmpty!37781 () Bool)

(declare-fun mapRes!37781 () Bool)

(declare-fun tp!72590 () Bool)

(assert (=> mapNonEmpty!37781 (= mapRes!37781 (and tp!72590 e!579237))))

(declare-fun mapKey!37781 () (_ BitVec 32))

(declare-fun mapValue!37781 () ValueCell!11414)

(declare-fun mapRest!37781 () (Array (_ BitVec 32) ValueCell!11414))

(assert (=> mapNonEmpty!37781 (= (arr!31070 (_values!6086 thiss!1427)) (store mapRest!37781 mapKey!37781 mapValue!37781))))

(declare-fun b!1026673 () Bool)

(declare-fun e!579231 () Bool)

(assert (=> b!1026673 (= e!579231 true)))

(declare-fun lt!451724 () Bool)

(declare-datatypes ((List!21786 0))(
  ( (Nil!21783) (Cons!21782 (h!22980 (_ BitVec 64)) (t!30848 List!21786)) )
))
(declare-fun arrayNoDuplicates!0 (array!64520 (_ BitVec 32) List!21786) Bool)

(assert (=> b!1026673 (= lt!451724 (arrayNoDuplicates!0 (_keys!11210 thiss!1427) #b00000000000000000000000000000000 Nil!21783))))

(declare-fun b!1026674 () Bool)

(declare-fun e!579238 () Bool)

(declare-fun e!579235 () Bool)

(assert (=> b!1026674 (= e!579238 e!579235)))

(declare-fun res!687248 () Bool)

(assert (=> b!1026674 (=> (not res!687248) (not e!579235))))

(declare-datatypes ((SeekEntryResult!9652 0))(
  ( (MissingZero!9652 (index!40979 (_ BitVec 32))) (Found!9652 (index!40980 (_ BitVec 32))) (Intermediate!9652 (undefined!10464 Bool) (index!40981 (_ BitVec 32)) (x!91338 (_ BitVec 32))) (Undefined!9652) (MissingVacant!9652 (index!40982 (_ BitVec 32))) )
))
(declare-fun lt!451719 () SeekEntryResult!9652)

(assert (=> b!1026674 (= res!687248 (is-Found!9652 lt!451719))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64520 (_ BitVec 32)) SeekEntryResult!9652)

(assert (=> b!1026674 (= lt!451719 (seekEntry!0 key!909 (_keys!11210 thiss!1427) (mask!29763 thiss!1427)))))

(declare-fun b!1026675 () Bool)

(assert (=> b!1026675 (= e!579235 (not e!579231))))

(declare-fun res!687247 () Bool)

(assert (=> b!1026675 (=> res!687247 e!579231)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026675 (= res!687247 (not (validMask!0 (mask!29763 thiss!1427))))))

(declare-fun lt!451721 () array!64520)

(declare-fun arrayContainsKey!0 (array!64520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026675 (not (arrayContainsKey!0 lt!451721 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33447 0))(
  ( (Unit!33448) )
))
(declare-fun lt!451725 () Unit!33447)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64520 (_ BitVec 32) (_ BitVec 64)) Unit!33447)

(assert (=> b!1026675 (= lt!451725 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11210 thiss!1427) (index!40980 lt!451719) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64520 (_ BitVec 32)) Bool)

(assert (=> b!1026675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451721 (mask!29763 thiss!1427))))

(declare-fun lt!451722 () Unit!33447)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64520 (_ BitVec 32) (_ BitVec 32)) Unit!33447)

(assert (=> b!1026675 (= lt!451722 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11210 thiss!1427) (index!40980 lt!451719) (mask!29763 thiss!1427)))))

(assert (=> b!1026675 (arrayNoDuplicates!0 lt!451721 #b00000000000000000000000000000000 Nil!21783)))

(declare-fun lt!451723 () Unit!33447)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21786) Unit!33447)

(assert (=> b!1026675 (= lt!451723 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11210 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40980 lt!451719) #b00000000000000000000000000000000 Nil!21783))))

(declare-fun arrayCountValidKeys!0 (array!64520 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026675 (= (arrayCountValidKeys!0 lt!451721 #b00000000000000000000000000000000 (size!31582 (_keys!11210 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11210 thiss!1427) #b00000000000000000000000000000000 (size!31582 (_keys!11210 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026675 (= lt!451721 (array!64521 (store (arr!31069 (_keys!11210 thiss!1427)) (index!40980 lt!451719) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31582 (_keys!11210 thiss!1427))))))

(declare-fun lt!451720 () Unit!33447)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64520 (_ BitVec 32) (_ BitVec 64)) Unit!33447)

(assert (=> b!1026675 (= lt!451720 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11210 thiss!1427) (index!40980 lt!451719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026676 () Bool)

(declare-fun e!579234 () Bool)

(assert (=> b!1026676 (= e!579234 tp_is_empty!24235)))

(declare-fun mapIsEmpty!37781 () Bool)

(assert (=> mapIsEmpty!37781 mapRes!37781))

(declare-fun res!687244 () Bool)

(assert (=> start!89516 (=> (not res!687244) (not e!579238))))

(declare-fun valid!2058 (LongMapFixedSize!5422) Bool)

(assert (=> start!89516 (= res!687244 (valid!2058 thiss!1427))))

(assert (=> start!89516 e!579238))

(assert (=> start!89516 e!579233))

(assert (=> start!89516 true))

(declare-fun b!1026677 () Bool)

(declare-fun res!687245 () Bool)

(assert (=> b!1026677 (=> res!687245 e!579231)))

(assert (=> b!1026677 (= res!687245 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11210 thiss!1427) (mask!29763 thiss!1427))))))

(declare-fun b!1026678 () Bool)

(assert (=> b!1026678 (= e!579236 (and e!579234 mapRes!37781))))

(declare-fun condMapEmpty!37781 () Bool)

(declare-fun mapDefault!37781 () ValueCell!11414)

