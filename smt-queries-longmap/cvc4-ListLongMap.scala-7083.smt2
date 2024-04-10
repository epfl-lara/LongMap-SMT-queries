; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89556 () Bool)

(assert start!89556)

(declare-fun b!1027276 () Bool)

(declare-fun b_free!20555 () Bool)

(declare-fun b_next!20555 () Bool)

(assert (=> b!1027276 (= b_free!20555 (not b_next!20555))))

(declare-fun tp!72711 () Bool)

(declare-fun b_and!32801 () Bool)

(assert (=> b!1027276 (= tp!72711 b_and!32801)))

(declare-fun b!1027271 () Bool)

(declare-fun e!579717 () Bool)

(declare-fun tp_is_empty!24275 () Bool)

(assert (=> b!1027271 (= e!579717 tp_is_empty!24275)))

(declare-fun b!1027272 () Bool)

(declare-fun res!687608 () Bool)

(declare-fun e!579716 () Bool)

(assert (=> b!1027272 (=> (not res!687608) (not e!579716))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027272 (= res!687608 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027273 () Bool)

(declare-fun e!579713 () Bool)

(declare-fun e!579712 () Bool)

(assert (=> b!1027273 (= e!579713 (not e!579712))))

(declare-fun res!687606 () Bool)

(assert (=> b!1027273 (=> res!687606 e!579712)))

(declare-datatypes ((V!37239 0))(
  ( (V!37240 (val!12188 Int)) )
))
(declare-datatypes ((ValueCell!11434 0))(
  ( (ValueCellFull!11434 (v!14757 V!37239)) (EmptyCell!11434) )
))
(declare-datatypes ((array!64600 0))(
  ( (array!64601 (arr!31109 (Array (_ BitVec 32) (_ BitVec 64))) (size!31622 (_ BitVec 32))) )
))
(declare-datatypes ((array!64602 0))(
  ( (array!64603 (arr!31110 (Array (_ BitVec 32) ValueCell!11434)) (size!31623 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5462 0))(
  ( (LongMapFixedSize!5463 (defaultEntry!6083 Int) (mask!29795 (_ BitVec 32)) (extraKeys!5815 (_ BitVec 32)) (zeroValue!5919 V!37239) (minValue!5919 V!37239) (_size!2786 (_ BitVec 32)) (_keys!11230 array!64600) (_values!6106 array!64602) (_vacant!2786 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5462)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027273 (= res!687606 (not (validMask!0 (mask!29795 thiss!1427))))))

(declare-fun lt!452142 () array!64600)

(declare-fun arrayContainsKey!0 (array!64600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027273 (not (arrayContainsKey!0 lt!452142 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33477 0))(
  ( (Unit!33478) )
))
(declare-fun lt!452143 () Unit!33477)

(declare-datatypes ((SeekEntryResult!9669 0))(
  ( (MissingZero!9669 (index!41047 (_ BitVec 32))) (Found!9669 (index!41048 (_ BitVec 32))) (Intermediate!9669 (undefined!10481 Bool) (index!41049 (_ BitVec 32)) (x!91403 (_ BitVec 32))) (Undefined!9669) (MissingVacant!9669 (index!41050 (_ BitVec 32))) )
))
(declare-fun lt!452141 () SeekEntryResult!9669)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64600 (_ BitVec 32) (_ BitVec 64)) Unit!33477)

(assert (=> b!1027273 (= lt!452143 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11230 thiss!1427) (index!41048 lt!452141) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64600 (_ BitVec 32)) Bool)

(assert (=> b!1027273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452142 (mask!29795 thiss!1427))))

(declare-fun lt!452145 () Unit!33477)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64600 (_ BitVec 32) (_ BitVec 32)) Unit!33477)

(assert (=> b!1027273 (= lt!452145 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11230 thiss!1427) (index!41048 lt!452141) (mask!29795 thiss!1427)))))

(declare-datatypes ((List!21803 0))(
  ( (Nil!21800) (Cons!21799 (h!22997 (_ BitVec 64)) (t!30865 List!21803)) )
))
(declare-fun arrayNoDuplicates!0 (array!64600 (_ BitVec 32) List!21803) Bool)

(assert (=> b!1027273 (arrayNoDuplicates!0 lt!452142 #b00000000000000000000000000000000 Nil!21800)))

(declare-fun lt!452140 () Unit!33477)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21803) Unit!33477)

(assert (=> b!1027273 (= lt!452140 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11230 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41048 lt!452141) #b00000000000000000000000000000000 Nil!21800))))

(declare-fun arrayCountValidKeys!0 (array!64600 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027273 (= (arrayCountValidKeys!0 lt!452142 #b00000000000000000000000000000000 (size!31622 (_keys!11230 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11230 thiss!1427) #b00000000000000000000000000000000 (size!31622 (_keys!11230 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027273 (= lt!452142 (array!64601 (store (arr!31109 (_keys!11230 thiss!1427)) (index!41048 lt!452141) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31622 (_keys!11230 thiss!1427))))))

(declare-fun lt!452139 () Unit!33477)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64600 (_ BitVec 32) (_ BitVec 64)) Unit!33477)

(assert (=> b!1027273 (= lt!452139 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11230 thiss!1427) (index!41048 lt!452141) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027274 () Bool)

(assert (=> b!1027274 (= e!579716 e!579713)))

(declare-fun res!687605 () Bool)

(assert (=> b!1027274 (=> (not res!687605) (not e!579713))))

(assert (=> b!1027274 (= res!687605 (is-Found!9669 lt!452141))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64600 (_ BitVec 32)) SeekEntryResult!9669)

(assert (=> b!1027274 (= lt!452141 (seekEntry!0 key!909 (_keys!11230 thiss!1427) (mask!29795 thiss!1427)))))

(declare-fun b!1027275 () Bool)

(declare-fun res!687604 () Bool)

(assert (=> b!1027275 (=> res!687604 e!579712)))

(assert (=> b!1027275 (= res!687604 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11230 thiss!1427) (mask!29795 thiss!1427))))))

(declare-fun e!579718 () Bool)

(declare-fun e!579714 () Bool)

(declare-fun array_inv!24087 (array!64600) Bool)

(declare-fun array_inv!24088 (array!64602) Bool)

(assert (=> b!1027276 (= e!579718 (and tp!72711 tp_is_empty!24275 (array_inv!24087 (_keys!11230 thiss!1427)) (array_inv!24088 (_values!6106 thiss!1427)) e!579714))))

(declare-fun b!1027277 () Bool)

(declare-fun e!579711 () Bool)

(declare-fun mapRes!37841 () Bool)

(assert (=> b!1027277 (= e!579714 (and e!579711 mapRes!37841))))

(declare-fun condMapEmpty!37841 () Bool)

(declare-fun mapDefault!37841 () ValueCell!11434)

