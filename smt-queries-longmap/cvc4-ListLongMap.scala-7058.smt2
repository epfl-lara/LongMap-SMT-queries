; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89406 () Bool)

(assert start!89406)

(declare-fun b!1025058 () Bool)

(declare-fun b_free!20405 () Bool)

(declare-fun b_next!20405 () Bool)

(assert (=> b!1025058 (= b_free!20405 (not b_next!20405))))

(declare-fun tp!72261 () Bool)

(declare-fun b_and!32651 () Bool)

(assert (=> b!1025058 (= tp!72261 b_and!32651)))

(declare-fun b!1025056 () Bool)

(declare-fun e!577911 () Bool)

(declare-fun tp_is_empty!24125 () Bool)

(assert (=> b!1025056 (= e!577911 tp_is_empty!24125)))

(declare-fun b!1025057 () Bool)

(declare-fun e!577913 () Bool)

(assert (=> b!1025057 (= e!577913 true)))

(declare-fun lt!450785 () Bool)

(declare-datatypes ((V!37039 0))(
  ( (V!37040 (val!12113 Int)) )
))
(declare-datatypes ((ValueCell!11359 0))(
  ( (ValueCellFull!11359 (v!14682 V!37039)) (EmptyCell!11359) )
))
(declare-datatypes ((array!64300 0))(
  ( (array!64301 (arr!30959 (Array (_ BitVec 32) (_ BitVec 64))) (size!31472 (_ BitVec 32))) )
))
(declare-datatypes ((array!64302 0))(
  ( (array!64303 (arr!30960 (Array (_ BitVec 32) ValueCell!11359)) (size!31473 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5312 0))(
  ( (LongMapFixedSize!5313 (defaultEntry!6008 Int) (mask!29670 (_ BitVec 32)) (extraKeys!5740 (_ BitVec 32)) (zeroValue!5844 V!37039) (minValue!5844 V!37039) (_size!2711 (_ BitVec 32)) (_keys!11155 array!64300) (_values!6031 array!64302) (_vacant!2711 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5312)

(declare-datatypes ((List!21742 0))(
  ( (Nil!21739) (Cons!21738 (h!22936 (_ BitVec 64)) (t!30804 List!21742)) )
))
(declare-fun arrayNoDuplicates!0 (array!64300 (_ BitVec 32) List!21742) Bool)

(assert (=> b!1025057 (= lt!450785 (arrayNoDuplicates!0 (_keys!11155 thiss!1427) #b00000000000000000000000000000000 Nil!21739))))

(declare-fun e!577916 () Bool)

(declare-fun e!577914 () Bool)

(declare-fun array_inv!23975 (array!64300) Bool)

(declare-fun array_inv!23976 (array!64302) Bool)

(assert (=> b!1025058 (= e!577916 (and tp!72261 tp_is_empty!24125 (array_inv!23975 (_keys!11155 thiss!1427)) (array_inv!23976 (_values!6031 thiss!1427)) e!577914))))

(declare-fun b!1025060 () Bool)

(declare-fun e!577915 () Bool)

(declare-fun e!577918 () Bool)

(assert (=> b!1025060 (= e!577915 e!577918)))

(declare-fun res!686288 () Bool)

(assert (=> b!1025060 (=> (not res!686288) (not e!577918))))

(declare-datatypes ((SeekEntryResult!9607 0))(
  ( (MissingZero!9607 (index!40799 (_ BitVec 32))) (Found!9607 (index!40800 (_ BitVec 32))) (Intermediate!9607 (undefined!10419 Bool) (index!40801 (_ BitVec 32)) (x!91141 (_ BitVec 32))) (Undefined!9607) (MissingVacant!9607 (index!40802 (_ BitVec 32))) )
))
(declare-fun lt!450784 () SeekEntryResult!9607)

(assert (=> b!1025060 (= res!686288 (is-Found!9607 lt!450784))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64300 (_ BitVec 32)) SeekEntryResult!9607)

(assert (=> b!1025060 (= lt!450784 (seekEntry!0 key!909 (_keys!11155 thiss!1427) (mask!29670 thiss!1427)))))

(declare-fun mapNonEmpty!37616 () Bool)

(declare-fun mapRes!37616 () Bool)

(declare-fun tp!72260 () Bool)

(assert (=> mapNonEmpty!37616 (= mapRes!37616 (and tp!72260 e!577911))))

(declare-fun mapKey!37616 () (_ BitVec 32))

(declare-fun mapValue!37616 () ValueCell!11359)

(declare-fun mapRest!37616 () (Array (_ BitVec 32) ValueCell!11359))

(assert (=> mapNonEmpty!37616 (= (arr!30960 (_values!6031 thiss!1427)) (store mapRest!37616 mapKey!37616 mapValue!37616))))

(declare-fun b!1025061 () Bool)

(declare-fun res!686289 () Bool)

(assert (=> b!1025061 (=> res!686289 e!577913)))

(declare-fun contains!5958 (List!21742 (_ BitVec 64)) Bool)

(assert (=> b!1025061 (= res!686289 (contains!5958 Nil!21739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025062 () Bool)

(declare-fun res!686293 () Bool)

(assert (=> b!1025062 (=> res!686293 e!577913)))

(declare-fun noDuplicate!1472 (List!21742) Bool)

(assert (=> b!1025062 (= res!686293 (not (noDuplicate!1472 Nil!21739)))))

(declare-fun b!1025063 () Bool)

(assert (=> b!1025063 (= e!577918 (not e!577913))))

(declare-fun res!686294 () Bool)

(assert (=> b!1025063 (=> res!686294 e!577913)))

(assert (=> b!1025063 (= res!686294 (or (bvsge (size!31472 (_keys!11155 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31472 (_keys!11155 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64300 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025063 (= (arrayCountValidKeys!0 (array!64301 (store (arr!30959 (_keys!11155 thiss!1427)) (index!40800 lt!450784) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31472 (_keys!11155 thiss!1427))) #b00000000000000000000000000000000 (size!31472 (_keys!11155 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11155 thiss!1427) #b00000000000000000000000000000000 (size!31472 (_keys!11155 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33371 0))(
  ( (Unit!33372) )
))
(declare-fun lt!450786 () Unit!33371)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64300 (_ BitVec 32) (_ BitVec 64)) Unit!33371)

(assert (=> b!1025063 (= lt!450786 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11155 thiss!1427) (index!40800 lt!450784) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37616 () Bool)

(assert (=> mapIsEmpty!37616 mapRes!37616))

(declare-fun b!1025064 () Bool)

(declare-fun e!577912 () Bool)

(assert (=> b!1025064 (= e!577914 (and e!577912 mapRes!37616))))

(declare-fun condMapEmpty!37616 () Bool)

(declare-fun mapDefault!37616 () ValueCell!11359)

