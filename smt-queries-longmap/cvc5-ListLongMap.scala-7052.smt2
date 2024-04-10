; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89366 () Bool)

(assert start!89366)

(declare-fun b!1024403 () Bool)

(declare-fun b_free!20365 () Bool)

(declare-fun b_next!20365 () Bool)

(assert (=> b!1024403 (= b_free!20365 (not b_next!20365))))

(declare-fun tp!72140 () Bool)

(declare-fun b_and!32611 () Bool)

(assert (=> b!1024403 (= tp!72140 b_and!32611)))

(declare-fun b!1024396 () Bool)

(declare-fun res!685873 () Bool)

(declare-fun e!577432 () Bool)

(assert (=> b!1024396 (=> res!685873 e!577432)))

(declare-datatypes ((List!21729 0))(
  ( (Nil!21726) (Cons!21725 (h!22923 (_ BitVec 64)) (t!30791 List!21729)) )
))
(declare-fun contains!5945 (List!21729 (_ BitVec 64)) Bool)

(assert (=> b!1024396 (= res!685873 (contains!5945 Nil!21726 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!685872 () Bool)

(declare-fun e!577434 () Bool)

(assert (=> start!89366 (=> (not res!685872) (not e!577434))))

(declare-datatypes ((V!36987 0))(
  ( (V!36988 (val!12093 Int)) )
))
(declare-datatypes ((ValueCell!11339 0))(
  ( (ValueCellFull!11339 (v!14662 V!36987)) (EmptyCell!11339) )
))
(declare-datatypes ((array!64220 0))(
  ( (array!64221 (arr!30919 (Array (_ BitVec 32) (_ BitVec 64))) (size!31432 (_ BitVec 32))) )
))
(declare-datatypes ((array!64222 0))(
  ( (array!64223 (arr!30920 (Array (_ BitVec 32) ValueCell!11339)) (size!31433 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5272 0))(
  ( (LongMapFixedSize!5273 (defaultEntry!5988 Int) (mask!29638 (_ BitVec 32)) (extraKeys!5720 (_ BitVec 32)) (zeroValue!5824 V!36987) (minValue!5824 V!36987) (_size!2691 (_ BitVec 32)) (_keys!11135 array!64220) (_values!6011 array!64222) (_vacant!2691 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5272)

(declare-fun valid!2007 (LongMapFixedSize!5272) Bool)

(assert (=> start!89366 (= res!685872 (valid!2007 thiss!1427))))

(assert (=> start!89366 e!577434))

(declare-fun e!577435 () Bool)

(assert (=> start!89366 e!577435))

(assert (=> start!89366 true))

(declare-fun b!1024397 () Bool)

(declare-fun res!685870 () Bool)

(assert (=> b!1024397 (=> (not res!685870) (not e!577434))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024397 (= res!685870 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024398 () Bool)

(declare-fun e!577431 () Bool)

(declare-fun tp_is_empty!24085 () Bool)

(assert (=> b!1024398 (= e!577431 tp_is_empty!24085)))

(declare-fun b!1024399 () Bool)

(declare-fun e!577438 () Bool)

(assert (=> b!1024399 (= e!577438 (not e!577432))))

(declare-fun res!685868 () Bool)

(assert (=> b!1024399 (=> res!685868 e!577432)))

(assert (=> b!1024399 (= res!685868 (or (bvsge (size!31432 (_keys!11135 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31432 (_keys!11135 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9594 0))(
  ( (MissingZero!9594 (index!40747 (_ BitVec 32))) (Found!9594 (index!40748 (_ BitVec 32))) (Intermediate!9594 (undefined!10406 Bool) (index!40749 (_ BitVec 32)) (x!91080 (_ BitVec 32))) (Undefined!9594) (MissingVacant!9594 (index!40750 (_ BitVec 32))) )
))
(declare-fun lt!450605 () SeekEntryResult!9594)

(declare-fun arrayCountValidKeys!0 (array!64220 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024399 (= (arrayCountValidKeys!0 (array!64221 (store (arr!30919 (_keys!11135 thiss!1427)) (index!40748 lt!450605) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31432 (_keys!11135 thiss!1427))) #b00000000000000000000000000000000 (size!31432 (_keys!11135 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11135 thiss!1427) #b00000000000000000000000000000000 (size!31432 (_keys!11135 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33349 0))(
  ( (Unit!33350) )
))
(declare-fun lt!450606 () Unit!33349)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64220 (_ BitVec 32) (_ BitVec 64)) Unit!33349)

(assert (=> b!1024399 (= lt!450606 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11135 thiss!1427) (index!40748 lt!450605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024400 () Bool)

(assert (=> b!1024400 (= e!577432 true)))

(declare-fun lt!450604 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64220 (_ BitVec 32) List!21729) Bool)

(assert (=> b!1024400 (= lt!450604 (arrayNoDuplicates!0 (_keys!11135 thiss!1427) #b00000000000000000000000000000000 Nil!21726))))

(declare-fun mapIsEmpty!37556 () Bool)

(declare-fun mapRes!37556 () Bool)

(assert (=> mapIsEmpty!37556 mapRes!37556))

(declare-fun b!1024401 () Bool)

(declare-fun e!577436 () Bool)

(assert (=> b!1024401 (= e!577436 tp_is_empty!24085)))

(declare-fun b!1024402 () Bool)

(assert (=> b!1024402 (= e!577434 e!577438)))

(declare-fun res!685871 () Bool)

(assert (=> b!1024402 (=> (not res!685871) (not e!577438))))

(assert (=> b!1024402 (= res!685871 (is-Found!9594 lt!450605))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64220 (_ BitVec 32)) SeekEntryResult!9594)

(assert (=> b!1024402 (= lt!450605 (seekEntry!0 key!909 (_keys!11135 thiss!1427) (mask!29638 thiss!1427)))))

(declare-fun e!577437 () Bool)

(declare-fun array_inv!23953 (array!64220) Bool)

(declare-fun array_inv!23954 (array!64222) Bool)

(assert (=> b!1024403 (= e!577435 (and tp!72140 tp_is_empty!24085 (array_inv!23953 (_keys!11135 thiss!1427)) (array_inv!23954 (_values!6011 thiss!1427)) e!577437))))

(declare-fun b!1024404 () Bool)

(declare-fun res!685869 () Bool)

(assert (=> b!1024404 (=> res!685869 e!577432)))

(declare-fun noDuplicate!1462 (List!21729) Bool)

(assert (=> b!1024404 (= res!685869 (not (noDuplicate!1462 Nil!21726)))))

(declare-fun mapNonEmpty!37556 () Bool)

(declare-fun tp!72141 () Bool)

(assert (=> mapNonEmpty!37556 (= mapRes!37556 (and tp!72141 e!577436))))

(declare-fun mapValue!37556 () ValueCell!11339)

(declare-fun mapKey!37556 () (_ BitVec 32))

(declare-fun mapRest!37556 () (Array (_ BitVec 32) ValueCell!11339))

(assert (=> mapNonEmpty!37556 (= (arr!30920 (_values!6011 thiss!1427)) (store mapRest!37556 mapKey!37556 mapValue!37556))))

(declare-fun b!1024405 () Bool)

(assert (=> b!1024405 (= e!577437 (and e!577431 mapRes!37556))))

(declare-fun condMapEmpty!37556 () Bool)

(declare-fun mapDefault!37556 () ValueCell!11339)

