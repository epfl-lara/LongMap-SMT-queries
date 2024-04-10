; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89552 () Bool)

(assert start!89552)

(declare-fun b!1027213 () Bool)

(declare-fun b_free!20551 () Bool)

(declare-fun b_next!20551 () Bool)

(assert (=> b!1027213 (= b_free!20551 (not b_next!20551))))

(declare-fun tp!72698 () Bool)

(declare-fun b_and!32797 () Bool)

(assert (=> b!1027213 (= tp!72698 b_and!32797)))

(declare-fun mapNonEmpty!37835 () Bool)

(declare-fun mapRes!37835 () Bool)

(declare-fun tp!72699 () Bool)

(declare-fun e!579668 () Bool)

(assert (=> mapNonEmpty!37835 (= mapRes!37835 (and tp!72699 e!579668))))

(declare-datatypes ((V!37235 0))(
  ( (V!37236 (val!12186 Int)) )
))
(declare-datatypes ((ValueCell!11432 0))(
  ( (ValueCellFull!11432 (v!14755 V!37235)) (EmptyCell!11432) )
))
(declare-fun mapRest!37835 () (Array (_ BitVec 32) ValueCell!11432))

(declare-fun mapKey!37835 () (_ BitVec 32))

(declare-datatypes ((array!64592 0))(
  ( (array!64593 (arr!31105 (Array (_ BitVec 32) (_ BitVec 64))) (size!31618 (_ BitVec 32))) )
))
(declare-datatypes ((array!64594 0))(
  ( (array!64595 (arr!31106 (Array (_ BitVec 32) ValueCell!11432)) (size!31619 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5458 0))(
  ( (LongMapFixedSize!5459 (defaultEntry!6081 Int) (mask!29793 (_ BitVec 32)) (extraKeys!5813 (_ BitVec 32)) (zeroValue!5917 V!37235) (minValue!5917 V!37235) (_size!2784 (_ BitVec 32)) (_keys!11228 array!64592) (_values!6104 array!64594) (_vacant!2784 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5458)

(declare-fun mapValue!37835 () ValueCell!11432)

(assert (=> mapNonEmpty!37835 (= (arr!31106 (_values!6104 thiss!1427)) (store mapRest!37835 mapKey!37835 mapValue!37835))))

(declare-fun b!1027211 () Bool)

(declare-fun res!687571 () Bool)

(declare-fun e!579670 () Bool)

(assert (=> b!1027211 (=> (not res!687571) (not e!579670))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027211 (= res!687571 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027212 () Bool)

(declare-fun e!579666 () Bool)

(declare-fun e!579665 () Bool)

(assert (=> b!1027212 (= e!579666 (not e!579665))))

(declare-fun res!687572 () Bool)

(assert (=> b!1027212 (=> res!687572 e!579665)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027212 (= res!687572 (not (validMask!0 (mask!29793 thiss!1427))))))

(declare-fun lt!452099 () array!64592)

(declare-fun arrayContainsKey!0 (array!64592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027212 (not (arrayContainsKey!0 lt!452099 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33473 0))(
  ( (Unit!33474) )
))
(declare-fun lt!452103 () Unit!33473)

(declare-datatypes ((SeekEntryResult!9667 0))(
  ( (MissingZero!9667 (index!41039 (_ BitVec 32))) (Found!9667 (index!41040 (_ BitVec 32))) (Intermediate!9667 (undefined!10479 Bool) (index!41041 (_ BitVec 32)) (x!91401 (_ BitVec 32))) (Undefined!9667) (MissingVacant!9667 (index!41042 (_ BitVec 32))) )
))
(declare-fun lt!452097 () SeekEntryResult!9667)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64592 (_ BitVec 32) (_ BitVec 64)) Unit!33473)

(assert (=> b!1027212 (= lt!452103 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11228 thiss!1427) (index!41040 lt!452097) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64592 (_ BitVec 32)) Bool)

(assert (=> b!1027212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452099 (mask!29793 thiss!1427))))

(declare-fun lt!452102 () Unit!33473)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64592 (_ BitVec 32) (_ BitVec 32)) Unit!33473)

(assert (=> b!1027212 (= lt!452102 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11228 thiss!1427) (index!41040 lt!452097) (mask!29793 thiss!1427)))))

(declare-datatypes ((List!21801 0))(
  ( (Nil!21798) (Cons!21797 (h!22995 (_ BitVec 64)) (t!30863 List!21801)) )
))
(declare-fun arrayNoDuplicates!0 (array!64592 (_ BitVec 32) List!21801) Bool)

(assert (=> b!1027212 (arrayNoDuplicates!0 lt!452099 #b00000000000000000000000000000000 Nil!21798)))

(declare-fun lt!452098 () Unit!33473)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21801) Unit!33473)

(assert (=> b!1027212 (= lt!452098 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11228 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41040 lt!452097) #b00000000000000000000000000000000 Nil!21798))))

(declare-fun arrayCountValidKeys!0 (array!64592 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027212 (= (arrayCountValidKeys!0 lt!452099 #b00000000000000000000000000000000 (size!31618 (_keys!11228 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11228 thiss!1427) #b00000000000000000000000000000000 (size!31618 (_keys!11228 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027212 (= lt!452099 (array!64593 (store (arr!31105 (_keys!11228 thiss!1427)) (index!41040 lt!452097) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31618 (_keys!11228 thiss!1427))))))

(declare-fun lt!452100 () Unit!33473)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64592 (_ BitVec 32) (_ BitVec 64)) Unit!33473)

(assert (=> b!1027212 (= lt!452100 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11228 thiss!1427) (index!41040 lt!452097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!579663 () Bool)

(declare-fun tp_is_empty!24271 () Bool)

(declare-fun e!579667 () Bool)

(declare-fun array_inv!24083 (array!64592) Bool)

(declare-fun array_inv!24084 (array!64594) Bool)

(assert (=> b!1027213 (= e!579667 (and tp!72698 tp_is_empty!24271 (array_inv!24083 (_keys!11228 thiss!1427)) (array_inv!24084 (_values!6104 thiss!1427)) e!579663))))

(declare-fun b!1027214 () Bool)

(declare-fun e!579669 () Bool)

(assert (=> b!1027214 (= e!579663 (and e!579669 mapRes!37835))))

(declare-fun condMapEmpty!37835 () Bool)

(declare-fun mapDefault!37835 () ValueCell!11432)

