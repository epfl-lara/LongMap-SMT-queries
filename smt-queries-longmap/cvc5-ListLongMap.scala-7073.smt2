; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89492 () Bool)

(assert start!89492)

(declare-fun b!1026314 () Bool)

(declare-fun b_free!20491 () Bool)

(declare-fun b_next!20491 () Bool)

(assert (=> b!1026314 (= b_free!20491 (not b_next!20491))))

(declare-fun tp!72518 () Bool)

(declare-fun b_and!32737 () Bool)

(assert (=> b!1026314 (= tp!72518 b_and!32737)))

(declare-fun b!1026311 () Bool)

(declare-fun res!687032 () Bool)

(declare-fun e!578948 () Bool)

(assert (=> b!1026311 (=> res!687032 e!578948)))

(declare-datatypes ((V!37155 0))(
  ( (V!37156 (val!12156 Int)) )
))
(declare-datatypes ((ValueCell!11402 0))(
  ( (ValueCellFull!11402 (v!14725 V!37155)) (EmptyCell!11402) )
))
(declare-datatypes ((array!64472 0))(
  ( (array!64473 (arr!31045 (Array (_ BitVec 32) (_ BitVec 64))) (size!31558 (_ BitVec 32))) )
))
(declare-datatypes ((array!64474 0))(
  ( (array!64475 (arr!31046 (Array (_ BitVec 32) ValueCell!11402)) (size!31559 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5398 0))(
  ( (LongMapFixedSize!5399 (defaultEntry!6051 Int) (mask!29743 (_ BitVec 32)) (extraKeys!5783 (_ BitVec 32)) (zeroValue!5887 V!37155) (minValue!5887 V!37155) (_size!2754 (_ BitVec 32)) (_keys!11198 array!64472) (_values!6074 array!64474) (_vacant!2754 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5398)

(assert (=> b!1026311 (= res!687032 (or (not (= (size!31559 (_values!6074 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29743 thiss!1427)))) (not (= (size!31558 (_keys!11198 thiss!1427)) (size!31559 (_values!6074 thiss!1427)))) (bvslt (mask!29743 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5783 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37745 () Bool)

(declare-fun mapRes!37745 () Bool)

(assert (=> mapIsEmpty!37745 mapRes!37745))

(declare-fun b!1026312 () Bool)

(declare-fun e!578950 () Bool)

(declare-fun tp_is_empty!24211 () Bool)

(assert (=> b!1026312 (= e!578950 tp_is_empty!24211)))

(declare-fun b!1026313 () Bool)

(declare-fun e!578945 () Bool)

(assert (=> b!1026313 (= e!578945 (not e!578948))))

(declare-fun res!687027 () Bool)

(assert (=> b!1026313 (=> res!687027 e!578948)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026313 (= res!687027 (not (validMask!0 (mask!29743 thiss!1427))))))

(declare-fun lt!451469 () array!64472)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026313 (not (arrayContainsKey!0 lt!451469 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9644 0))(
  ( (MissingZero!9644 (index!40947 (_ BitVec 32))) (Found!9644 (index!40948 (_ BitVec 32))) (Intermediate!9644 (undefined!10456 Bool) (index!40949 (_ BitVec 32)) (x!91298 (_ BitVec 32))) (Undefined!9644) (MissingVacant!9644 (index!40950 (_ BitVec 32))) )
))
(declare-fun lt!451473 () SeekEntryResult!9644)

(declare-datatypes ((Unit!33433 0))(
  ( (Unit!33434) )
))
(declare-fun lt!451467 () Unit!33433)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64472 (_ BitVec 32) (_ BitVec 64)) Unit!33433)

(assert (=> b!1026313 (= lt!451467 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11198 thiss!1427) (index!40948 lt!451473) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64472 (_ BitVec 32)) Bool)

(assert (=> b!1026313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451469 (mask!29743 thiss!1427))))

(declare-fun lt!451472 () Unit!33433)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64472 (_ BitVec 32) (_ BitVec 32)) Unit!33433)

(assert (=> b!1026313 (= lt!451472 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11198 thiss!1427) (index!40948 lt!451473) (mask!29743 thiss!1427)))))

(declare-datatypes ((List!21777 0))(
  ( (Nil!21774) (Cons!21773 (h!22971 (_ BitVec 64)) (t!30839 List!21777)) )
))
(declare-fun arrayNoDuplicates!0 (array!64472 (_ BitVec 32) List!21777) Bool)

(assert (=> b!1026313 (arrayNoDuplicates!0 lt!451469 #b00000000000000000000000000000000 Nil!21774)))

(declare-fun lt!451468 () Unit!33433)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21777) Unit!33433)

(assert (=> b!1026313 (= lt!451468 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11198 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40948 lt!451473) #b00000000000000000000000000000000 Nil!21774))))

(declare-fun arrayCountValidKeys!0 (array!64472 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026313 (= (arrayCountValidKeys!0 lt!451469 #b00000000000000000000000000000000 (size!31558 (_keys!11198 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11198 thiss!1427) #b00000000000000000000000000000000 (size!31558 (_keys!11198 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026313 (= lt!451469 (array!64473 (store (arr!31045 (_keys!11198 thiss!1427)) (index!40948 lt!451473) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31558 (_keys!11198 thiss!1427))))))

(declare-fun lt!451471 () Unit!33433)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64472 (_ BitVec 32) (_ BitVec 64)) Unit!33433)

(assert (=> b!1026313 (= lt!451471 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11198 thiss!1427) (index!40948 lt!451473) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578943 () Bool)

(declare-fun e!578949 () Bool)

(declare-fun array_inv!24039 (array!64472) Bool)

(declare-fun array_inv!24040 (array!64474) Bool)

(assert (=> b!1026314 (= e!578949 (and tp!72518 tp_is_empty!24211 (array_inv!24039 (_keys!11198 thiss!1427)) (array_inv!24040 (_values!6074 thiss!1427)) e!578943))))

(declare-fun b!1026315 () Bool)

(declare-fun res!687029 () Bool)

(assert (=> b!1026315 (=> res!687029 e!578948)))

(assert (=> b!1026315 (= res!687029 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11198 thiss!1427) (mask!29743 thiss!1427))))))

(declare-fun b!1026316 () Bool)

(declare-fun res!687031 () Bool)

(declare-fun e!578946 () Bool)

(assert (=> b!1026316 (=> (not res!687031) (not e!578946))))

(assert (=> b!1026316 (= res!687031 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026317 () Bool)

(assert (=> b!1026317 (= e!578948 true)))

(declare-fun lt!451470 () Bool)

(assert (=> b!1026317 (= lt!451470 (arrayNoDuplicates!0 (_keys!11198 thiss!1427) #b00000000000000000000000000000000 Nil!21774))))

(declare-fun res!687028 () Bool)

(assert (=> start!89492 (=> (not res!687028) (not e!578946))))

(declare-fun valid!2050 (LongMapFixedSize!5398) Bool)

(assert (=> start!89492 (= res!687028 (valid!2050 thiss!1427))))

(assert (=> start!89492 e!578946))

(assert (=> start!89492 e!578949))

(assert (=> start!89492 true))

(declare-fun mapNonEmpty!37745 () Bool)

(declare-fun tp!72519 () Bool)

(declare-fun e!578947 () Bool)

(assert (=> mapNonEmpty!37745 (= mapRes!37745 (and tp!72519 e!578947))))

(declare-fun mapKey!37745 () (_ BitVec 32))

(declare-fun mapValue!37745 () ValueCell!11402)

(declare-fun mapRest!37745 () (Array (_ BitVec 32) ValueCell!11402))

(assert (=> mapNonEmpty!37745 (= (arr!31046 (_values!6074 thiss!1427)) (store mapRest!37745 mapKey!37745 mapValue!37745))))

(declare-fun b!1026318 () Bool)

(assert (=> b!1026318 (= e!578943 (and e!578950 mapRes!37745))))

(declare-fun condMapEmpty!37745 () Bool)

(declare-fun mapDefault!37745 () ValueCell!11402)

