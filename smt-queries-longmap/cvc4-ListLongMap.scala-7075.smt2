; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89508 () Bool)

(assert start!89508)

(declare-fun b!1026552 () Bool)

(declare-fun b_free!20507 () Bool)

(declare-fun b_next!20507 () Bool)

(assert (=> b!1026552 (= b_free!20507 (not b_next!20507))))

(declare-fun tp!72566 () Bool)

(declare-fun b_and!32753 () Bool)

(assert (=> b!1026552 (= tp!72566 b_and!32753)))

(declare-fun b!1026551 () Bool)

(declare-fun e!579135 () Bool)

(assert (=> b!1026551 (= e!579135 true)))

(declare-fun lt!451636 () Bool)

(declare-datatypes ((V!37175 0))(
  ( (V!37176 (val!12164 Int)) )
))
(declare-datatypes ((ValueCell!11410 0))(
  ( (ValueCellFull!11410 (v!14733 V!37175)) (EmptyCell!11410) )
))
(declare-datatypes ((array!64504 0))(
  ( (array!64505 (arr!31061 (Array (_ BitVec 32) (_ BitVec 64))) (size!31574 (_ BitVec 32))) )
))
(declare-datatypes ((array!64506 0))(
  ( (array!64507 (arr!31062 (Array (_ BitVec 32) ValueCell!11410)) (size!31575 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5414 0))(
  ( (LongMapFixedSize!5415 (defaultEntry!6059 Int) (mask!29755 (_ BitVec 32)) (extraKeys!5791 (_ BitVec 32)) (zeroValue!5895 V!37175) (minValue!5895 V!37175) (_size!2762 (_ BitVec 32)) (_keys!11206 array!64504) (_values!6082 array!64506) (_vacant!2762 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5414)

(declare-datatypes ((List!21784 0))(
  ( (Nil!21781) (Cons!21780 (h!22978 (_ BitVec 64)) (t!30846 List!21784)) )
))
(declare-fun arrayNoDuplicates!0 (array!64504 (_ BitVec 32) List!21784) Bool)

(assert (=> b!1026551 (= lt!451636 (arrayNoDuplicates!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 Nil!21781))))

(declare-fun mapNonEmpty!37769 () Bool)

(declare-fun mapRes!37769 () Bool)

(declare-fun tp!72567 () Bool)

(declare-fun e!579137 () Bool)

(assert (=> mapNonEmpty!37769 (= mapRes!37769 (and tp!72567 e!579137))))

(declare-fun mapRest!37769 () (Array (_ BitVec 32) ValueCell!11410))

(declare-fun mapValue!37769 () ValueCell!11410)

(declare-fun mapKey!37769 () (_ BitVec 32))

(assert (=> mapNonEmpty!37769 (= (arr!31062 (_values!6082 thiss!1427)) (store mapRest!37769 mapKey!37769 mapValue!37769))))

(declare-fun e!579142 () Bool)

(declare-fun e!579140 () Bool)

(declare-fun tp_is_empty!24227 () Bool)

(declare-fun array_inv!24051 (array!64504) Bool)

(declare-fun array_inv!24052 (array!64506) Bool)

(assert (=> b!1026552 (= e!579140 (and tp!72566 tp_is_empty!24227 (array_inv!24051 (_keys!11206 thiss!1427)) (array_inv!24052 (_values!6082 thiss!1427)) e!579142))))

(declare-fun b!1026553 () Bool)

(declare-fun res!687176 () Bool)

(assert (=> b!1026553 (=> res!687176 e!579135)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64504 (_ BitVec 32)) Bool)

(assert (=> b!1026553 (= res!687176 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11206 thiss!1427) (mask!29755 thiss!1427))))))

(declare-fun b!1026554 () Bool)

(declare-fun res!687172 () Bool)

(assert (=> b!1026554 (=> res!687172 e!579135)))

(assert (=> b!1026554 (= res!687172 (or (not (= (size!31575 (_values!6082 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29755 thiss!1427)))) (not (= (size!31574 (_keys!11206 thiss!1427)) (size!31575 (_values!6082 thiss!1427)))) (bvslt (mask!29755 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5791 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5791 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026556 () Bool)

(assert (=> b!1026556 (= e!579137 tp_is_empty!24227)))

(declare-fun b!1026557 () Bool)

(declare-fun e!579136 () Bool)

(declare-fun e!579138 () Bool)

(assert (=> b!1026557 (= e!579136 e!579138)))

(declare-fun res!687175 () Bool)

(assert (=> b!1026557 (=> (not res!687175) (not e!579138))))

(declare-datatypes ((SeekEntryResult!9650 0))(
  ( (MissingZero!9650 (index!40971 (_ BitVec 32))) (Found!9650 (index!40972 (_ BitVec 32))) (Intermediate!9650 (undefined!10462 Bool) (index!40973 (_ BitVec 32)) (x!91320 (_ BitVec 32))) (Undefined!9650) (MissingVacant!9650 (index!40974 (_ BitVec 32))) )
))
(declare-fun lt!451638 () SeekEntryResult!9650)

(assert (=> b!1026557 (= res!687175 (is-Found!9650 lt!451638))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64504 (_ BitVec 32)) SeekEntryResult!9650)

(assert (=> b!1026557 (= lt!451638 (seekEntry!0 key!909 (_keys!11206 thiss!1427) (mask!29755 thiss!1427)))))

(declare-fun mapIsEmpty!37769 () Bool)

(assert (=> mapIsEmpty!37769 mapRes!37769))

(declare-fun b!1026558 () Bool)

(declare-fun res!687171 () Bool)

(assert (=> b!1026558 (=> (not res!687171) (not e!579136))))

(assert (=> b!1026558 (= res!687171 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026559 () Bool)

(declare-fun e!579141 () Bool)

(assert (=> b!1026559 (= e!579141 tp_is_empty!24227)))

(declare-fun b!1026560 () Bool)

(assert (=> b!1026560 (= e!579138 (not e!579135))))

(declare-fun res!687174 () Bool)

(assert (=> b!1026560 (=> res!687174 e!579135)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026560 (= res!687174 (not (validMask!0 (mask!29755 thiss!1427))))))

(declare-fun lt!451635 () array!64504)

(declare-fun arrayContainsKey!0 (array!64504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026560 (not (arrayContainsKey!0 lt!451635 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33443 0))(
  ( (Unit!33444) )
))
(declare-fun lt!451640 () Unit!33443)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64504 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> b!1026560 (= lt!451640 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11206 thiss!1427) (index!40972 lt!451638) key!909))))

(assert (=> b!1026560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451635 (mask!29755 thiss!1427))))

(declare-fun lt!451641 () Unit!33443)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64504 (_ BitVec 32) (_ BitVec 32)) Unit!33443)

(assert (=> b!1026560 (= lt!451641 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11206 thiss!1427) (index!40972 lt!451638) (mask!29755 thiss!1427)))))

(assert (=> b!1026560 (arrayNoDuplicates!0 lt!451635 #b00000000000000000000000000000000 Nil!21781)))

(declare-fun lt!451639 () Unit!33443)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64504 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21784) Unit!33443)

(assert (=> b!1026560 (= lt!451639 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11206 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40972 lt!451638) #b00000000000000000000000000000000 Nil!21781))))

(declare-fun arrayCountValidKeys!0 (array!64504 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026560 (= (arrayCountValidKeys!0 lt!451635 #b00000000000000000000000000000000 (size!31574 (_keys!11206 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11206 thiss!1427) #b00000000000000000000000000000000 (size!31574 (_keys!11206 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026560 (= lt!451635 (array!64505 (store (arr!31061 (_keys!11206 thiss!1427)) (index!40972 lt!451638) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31574 (_keys!11206 thiss!1427))))))

(declare-fun lt!451637 () Unit!33443)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64504 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> b!1026560 (= lt!451637 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11206 thiss!1427) (index!40972 lt!451638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687173 () Bool)

(assert (=> start!89508 (=> (not res!687173) (not e!579136))))

(declare-fun valid!2056 (LongMapFixedSize!5414) Bool)

(assert (=> start!89508 (= res!687173 (valid!2056 thiss!1427))))

(assert (=> start!89508 e!579136))

(assert (=> start!89508 e!579140))

(assert (=> start!89508 true))

(declare-fun b!1026555 () Bool)

(assert (=> b!1026555 (= e!579142 (and e!579141 mapRes!37769))))

(declare-fun condMapEmpty!37769 () Bool)

(declare-fun mapDefault!37769 () ValueCell!11410)

