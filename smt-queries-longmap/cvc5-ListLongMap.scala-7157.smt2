; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91088 () Bool)

(assert start!91088)

(declare-fun b!1039973 () Bool)

(declare-fun b_free!20995 () Bool)

(declare-fun b_next!20995 () Bool)

(assert (=> b!1039973 (= b_free!20995 (not b_next!20995))))

(declare-fun tp!74173 () Bool)

(declare-fun b_and!33527 () Bool)

(assert (=> b!1039973 (= tp!74173 b_and!33527)))

(declare-fun res!693438 () Bool)

(declare-fun e!588691 () Bool)

(assert (=> start!91088 (=> (not res!693438) (not e!588691))))

(declare-datatypes ((V!37827 0))(
  ( (V!37828 (val!12408 Int)) )
))
(declare-datatypes ((ValueCell!11654 0))(
  ( (ValueCellFull!11654 (v!14995 V!37827)) (EmptyCell!11654) )
))
(declare-datatypes ((array!65562 0))(
  ( (array!65563 (arr!31549 (Array (_ BitVec 32) (_ BitVec 64))) (size!32080 (_ BitVec 32))) )
))
(declare-datatypes ((array!65564 0))(
  ( (array!65565 (arr!31550 (Array (_ BitVec 32) ValueCell!11654)) (size!32081 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5902 0))(
  ( (LongMapFixedSize!5903 (defaultEntry!6333 Int) (mask!30314 (_ BitVec 32)) (extraKeys!6061 (_ BitVec 32)) (zeroValue!6167 V!37827) (minValue!6167 V!37827) (_size!3006 (_ BitVec 32)) (_keys!11549 array!65562) (_values!6356 array!65564) (_vacant!3006 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5902)

(declare-fun valid!2217 (LongMapFixedSize!5902) Bool)

(assert (=> start!91088 (= res!693438 (valid!2217 thiss!1427))))

(assert (=> start!91088 e!588691))

(declare-fun e!588689 () Bool)

(assert (=> start!91088 e!588689))

(assert (=> start!91088 true))

(declare-fun b!1039967 () Bool)

(declare-fun e!588687 () Bool)

(assert (=> b!1039967 (= e!588691 e!588687)))

(declare-fun res!693439 () Bool)

(assert (=> b!1039967 (=> (not res!693439) (not e!588687))))

(declare-datatypes ((SeekEntryResult!9790 0))(
  ( (MissingZero!9790 (index!41531 (_ BitVec 32))) (Found!9790 (index!41532 (_ BitVec 32))) (Intermediate!9790 (undefined!10602 Bool) (index!41533 (_ BitVec 32)) (x!92830 (_ BitVec 32))) (Undefined!9790) (MissingVacant!9790 (index!41534 (_ BitVec 32))) )
))
(declare-fun lt!458329 () SeekEntryResult!9790)

(assert (=> b!1039967 (= res!693439 (is-Found!9790 lt!458329))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65562 (_ BitVec 32)) SeekEntryResult!9790)

(assert (=> b!1039967 (= lt!458329 (seekEntry!0 key!909 (_keys!11549 thiss!1427) (mask!30314 thiss!1427)))))

(declare-fun b!1039968 () Bool)

(declare-fun e!588688 () Bool)

(declare-fun tp_is_empty!24715 () Bool)

(assert (=> b!1039968 (= e!588688 tp_is_empty!24715)))

(declare-fun b!1039969 () Bool)

(declare-fun e!588692 () Bool)

(assert (=> b!1039969 (= e!588692 tp_is_empty!24715)))

(declare-fun b!1039970 () Bool)

(assert (=> b!1039970 (= e!588687 (not (or (bvslt (index!41532 lt!458329) #b00000000000000000000000000000000) (bvsge (index!41532 lt!458329) (size!32080 (_keys!11549 thiss!1427))) (bvslt (size!32080 (_keys!11549 thiss!1427)) #b01111111111111111111111111111111))))))

(declare-fun lt!458331 () array!65562)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65562 (_ BitVec 32)) Bool)

(assert (=> b!1039970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458331 (mask!30314 thiss!1427))))

(declare-datatypes ((Unit!34005 0))(
  ( (Unit!34006) )
))
(declare-fun lt!458330 () Unit!34005)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65562 (_ BitVec 32) (_ BitVec 32)) Unit!34005)

(assert (=> b!1039970 (= lt!458330 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11549 thiss!1427) (index!41532 lt!458329) (mask!30314 thiss!1427)))))

(declare-datatypes ((List!21952 0))(
  ( (Nil!21949) (Cons!21948 (h!23152 (_ BitVec 64)) (t!31166 List!21952)) )
))
(declare-fun arrayNoDuplicates!0 (array!65562 (_ BitVec 32) List!21952) Bool)

(assert (=> b!1039970 (arrayNoDuplicates!0 lt!458331 #b00000000000000000000000000000000 Nil!21949)))

(declare-fun lt!458332 () Unit!34005)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21952) Unit!34005)

(assert (=> b!1039970 (= lt!458332 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11549 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41532 lt!458329) #b00000000000000000000000000000000 Nil!21949))))

(declare-fun arrayCountValidKeys!0 (array!65562 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039970 (= (arrayCountValidKeys!0 lt!458331 #b00000000000000000000000000000000 (size!32080 (_keys!11549 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11549 thiss!1427) #b00000000000000000000000000000000 (size!32080 (_keys!11549 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039970 (= lt!458331 (array!65563 (store (arr!31549 (_keys!11549 thiss!1427)) (index!41532 lt!458329) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32080 (_keys!11549 thiss!1427))))))

(declare-fun lt!458328 () Unit!34005)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65562 (_ BitVec 32) (_ BitVec 64)) Unit!34005)

(assert (=> b!1039970 (= lt!458328 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11549 thiss!1427) (index!41532 lt!458329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039971 () Bool)

(declare-fun res!693437 () Bool)

(assert (=> b!1039971 (=> (not res!693437) (not e!588691))))

(assert (=> b!1039971 (= res!693437 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38644 () Bool)

(declare-fun mapRes!38644 () Bool)

(assert (=> mapIsEmpty!38644 mapRes!38644))

(declare-fun b!1039972 () Bool)

(declare-fun e!588693 () Bool)

(assert (=> b!1039972 (= e!588693 (and e!588688 mapRes!38644))))

(declare-fun condMapEmpty!38644 () Bool)

(declare-fun mapDefault!38644 () ValueCell!11654)

