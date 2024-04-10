; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89468 () Bool)

(assert start!89468)

(declare-fun b!1026023 () Bool)

(declare-fun b_free!20467 () Bool)

(declare-fun b_next!20467 () Bool)

(assert (=> b!1026023 (= b_free!20467 (not b_next!20467))))

(declare-fun tp!72447 () Bool)

(declare-fun b_and!32713 () Bool)

(assert (=> b!1026023 (= tp!72447 b_and!32713)))

(declare-fun b!1026019 () Bool)

(declare-fun e!578657 () Bool)

(declare-fun e!578661 () Bool)

(assert (=> b!1026019 (= e!578657 e!578661)))

(declare-fun res!686882 () Bool)

(assert (=> b!1026019 (=> (not res!686882) (not e!578661))))

(declare-datatypes ((SeekEntryResult!9637 0))(
  ( (MissingZero!9637 (index!40919 (_ BitVec 32))) (Found!9637 (index!40920 (_ BitVec 32))) (Intermediate!9637 (undefined!10449 Bool) (index!40921 (_ BitVec 32)) (x!91259 (_ BitVec 32))) (Undefined!9637) (MissingVacant!9637 (index!40922 (_ BitVec 32))) )
))
(declare-fun lt!451252 () SeekEntryResult!9637)

(assert (=> b!1026019 (= res!686882 (is-Found!9637 lt!451252))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37123 0))(
  ( (V!37124 (val!12144 Int)) )
))
(declare-datatypes ((ValueCell!11390 0))(
  ( (ValueCellFull!11390 (v!14713 V!37123)) (EmptyCell!11390) )
))
(declare-datatypes ((array!64424 0))(
  ( (array!64425 (arr!31021 (Array (_ BitVec 32) (_ BitVec 64))) (size!31534 (_ BitVec 32))) )
))
(declare-datatypes ((array!64426 0))(
  ( (array!64427 (arr!31022 (Array (_ BitVec 32) ValueCell!11390)) (size!31535 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5374 0))(
  ( (LongMapFixedSize!5375 (defaultEntry!6039 Int) (mask!29723 (_ BitVec 32)) (extraKeys!5771 (_ BitVec 32)) (zeroValue!5875 V!37123) (minValue!5875 V!37123) (_size!2742 (_ BitVec 32)) (_keys!11186 array!64424) (_values!6062 array!64426) (_vacant!2742 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5374)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64424 (_ BitVec 32)) SeekEntryResult!9637)

(assert (=> b!1026019 (= lt!451252 (seekEntry!0 key!909 (_keys!11186 thiss!1427) (mask!29723 thiss!1427)))))

(declare-fun mapIsEmpty!37709 () Bool)

(declare-fun mapRes!37709 () Bool)

(assert (=> mapIsEmpty!37709 mapRes!37709))

(declare-fun b!1026020 () Bool)

(declare-fun e!578659 () Bool)

(declare-fun tp_is_empty!24187 () Bool)

(assert (=> b!1026020 (= e!578659 tp_is_empty!24187)))

(declare-fun b!1026021 () Bool)

(declare-fun e!578660 () Bool)

(assert (=> b!1026021 (= e!578660 tp_is_empty!24187)))

(declare-fun mapNonEmpty!37709 () Bool)

(declare-fun tp!72446 () Bool)

(assert (=> mapNonEmpty!37709 (= mapRes!37709 (and tp!72446 e!578659))))

(declare-fun mapRest!37709 () (Array (_ BitVec 32) ValueCell!11390))

(declare-fun mapKey!37709 () (_ BitVec 32))

(declare-fun mapValue!37709 () ValueCell!11390)

(assert (=> mapNonEmpty!37709 (= (arr!31022 (_values!6062 thiss!1427)) (store mapRest!37709 mapKey!37709 mapValue!37709))))

(declare-fun b!1026022 () Bool)

(declare-fun e!578662 () Bool)

(assert (=> b!1026022 (= e!578661 (not e!578662))))

(declare-fun res!686881 () Bool)

(assert (=> b!1026022 (=> res!686881 e!578662)))

(assert (=> b!1026022 (= res!686881 (or (bvslt (index!40920 lt!451252) #b00000000000000000000000000000000) (bvsge (index!40920 lt!451252) (size!31534 (_keys!11186 thiss!1427))) (bvsge (size!31534 (_keys!11186 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451251 () array!64424)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64424 (_ BitVec 32)) Bool)

(assert (=> b!1026022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451251 (mask!29723 thiss!1427))))

(declare-datatypes ((Unit!33419 0))(
  ( (Unit!33420) )
))
(declare-fun lt!451253 () Unit!33419)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64424 (_ BitVec 32) (_ BitVec 32)) Unit!33419)

(assert (=> b!1026022 (= lt!451253 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11186 thiss!1427) (index!40920 lt!451252) (mask!29723 thiss!1427)))))

(declare-datatypes ((List!21767 0))(
  ( (Nil!21764) (Cons!21763 (h!22961 (_ BitVec 64)) (t!30829 List!21767)) )
))
(declare-fun arrayNoDuplicates!0 (array!64424 (_ BitVec 32) List!21767) Bool)

(assert (=> b!1026022 (arrayNoDuplicates!0 lt!451251 #b00000000000000000000000000000000 Nil!21764)))

(declare-fun lt!451254 () Unit!33419)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21767) Unit!33419)

(assert (=> b!1026022 (= lt!451254 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11186 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40920 lt!451252) #b00000000000000000000000000000000 Nil!21764))))

(declare-fun arrayCountValidKeys!0 (array!64424 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026022 (= (arrayCountValidKeys!0 lt!451251 #b00000000000000000000000000000000 (size!31534 (_keys!11186 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11186 thiss!1427) #b00000000000000000000000000000000 (size!31534 (_keys!11186 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026022 (= lt!451251 (array!64425 (store (arr!31021 (_keys!11186 thiss!1427)) (index!40920 lt!451252) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31534 (_keys!11186 thiss!1427))))))

(declare-fun lt!451250 () Unit!33419)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64424 (_ BitVec 32) (_ BitVec 64)) Unit!33419)

(assert (=> b!1026022 (= lt!451250 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11186 thiss!1427) (index!40920 lt!451252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578658 () Bool)

(declare-fun e!578655 () Bool)

(declare-fun array_inv!24025 (array!64424) Bool)

(declare-fun array_inv!24026 (array!64426) Bool)

(assert (=> b!1026023 (= e!578655 (and tp!72447 tp_is_empty!24187 (array_inv!24025 (_keys!11186 thiss!1427)) (array_inv!24026 (_values!6062 thiss!1427)) e!578658))))

(declare-fun b!1026024 () Bool)

(assert (=> b!1026024 (= e!578658 (and e!578660 mapRes!37709))))

(declare-fun condMapEmpty!37709 () Bool)

(declare-fun mapDefault!37709 () ValueCell!11390)

