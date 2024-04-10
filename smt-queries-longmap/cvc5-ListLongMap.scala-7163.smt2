; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91284 () Bool)

(assert start!91284)

(declare-fun b!1041148 () Bool)

(declare-fun b_free!21031 () Bool)

(declare-fun b_next!21031 () Bool)

(assert (=> b!1041148 (= b_free!21031 (not b_next!21031))))

(declare-fun tp!74301 () Bool)

(declare-fun b_and!33563 () Bool)

(assert (=> b!1041148 (= tp!74301 b_and!33563)))

(declare-fun mapIsEmpty!38717 () Bool)

(declare-fun mapRes!38717 () Bool)

(assert (=> mapIsEmpty!38717 mapRes!38717))

(declare-fun b!1041147 () Bool)

(declare-fun e!589568 () Bool)

(declare-fun e!589571 () Bool)

(assert (=> b!1041147 (= e!589568 (not e!589571))))

(declare-fun res!693994 () Bool)

(assert (=> b!1041147 (=> res!693994 e!589571)))

(declare-datatypes ((V!37875 0))(
  ( (V!37876 (val!12426 Int)) )
))
(declare-datatypes ((ValueCell!11672 0))(
  ( (ValueCellFull!11672 (v!15014 V!37875)) (EmptyCell!11672) )
))
(declare-datatypes ((array!65646 0))(
  ( (array!65647 (arr!31585 (Array (_ BitVec 32) (_ BitVec 64))) (size!32117 (_ BitVec 32))) )
))
(declare-datatypes ((array!65648 0))(
  ( (array!65649 (arr!31586 (Array (_ BitVec 32) ValueCell!11672)) (size!32118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5938 0))(
  ( (LongMapFixedSize!5939 (defaultEntry!6351 Int) (mask!30369 (_ BitVec 32)) (extraKeys!6079 (_ BitVec 32)) (zeroValue!6185 V!37875) (minValue!6185 V!37875) (_size!3024 (_ BitVec 32)) (_keys!11582 array!65646) (_values!6374 array!65648) (_vacant!3024 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5938)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041147 (= res!693994 (not (validMask!0 (mask!30369 thiss!1427))))))

(declare-fun lt!458875 () array!65646)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041147 (not (arrayContainsKey!0 lt!458875 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9804 0))(
  ( (MissingZero!9804 (index!41587 (_ BitVec 32))) (Found!9804 (index!41588 (_ BitVec 32))) (Intermediate!9804 (undefined!10616 Bool) (index!41589 (_ BitVec 32)) (x!92949 (_ BitVec 32))) (Undefined!9804) (MissingVacant!9804 (index!41590 (_ BitVec 32))) )
))
(declare-fun lt!458876 () SeekEntryResult!9804)

(declare-datatypes ((Unit!34029 0))(
  ( (Unit!34030) )
))
(declare-fun lt!458874 () Unit!34029)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65646 (_ BitVec 32) (_ BitVec 64)) Unit!34029)

(assert (=> b!1041147 (= lt!458874 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11582 thiss!1427) (index!41588 lt!458876) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65646 (_ BitVec 32)) Bool)

(assert (=> b!1041147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458875 (mask!30369 thiss!1427))))

(declare-fun lt!458877 () Unit!34029)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65646 (_ BitVec 32) (_ BitVec 32)) Unit!34029)

(assert (=> b!1041147 (= lt!458877 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11582 thiss!1427) (index!41588 lt!458876) (mask!30369 thiss!1427)))))

(declare-datatypes ((List!21966 0))(
  ( (Nil!21963) (Cons!21962 (h!23167 (_ BitVec 64)) (t!31180 List!21966)) )
))
(declare-fun arrayNoDuplicates!0 (array!65646 (_ BitVec 32) List!21966) Bool)

(assert (=> b!1041147 (arrayNoDuplicates!0 lt!458875 #b00000000000000000000000000000000 Nil!21963)))

(declare-fun lt!458873 () Unit!34029)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21966) Unit!34029)

(assert (=> b!1041147 (= lt!458873 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11582 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41588 lt!458876) #b00000000000000000000000000000000 Nil!21963))))

(declare-fun arrayCountValidKeys!0 (array!65646 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041147 (= (arrayCountValidKeys!0 lt!458875 #b00000000000000000000000000000000 (size!32117 (_keys!11582 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 (size!32117 (_keys!11582 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041147 (= lt!458875 (array!65647 (store (arr!31585 (_keys!11582 thiss!1427)) (index!41588 lt!458876) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32117 (_keys!11582 thiss!1427))))))

(declare-fun lt!458878 () Unit!34029)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65646 (_ BitVec 32) (_ BitVec 64)) Unit!34029)

(assert (=> b!1041147 (= lt!458878 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11582 thiss!1427) (index!41588 lt!458876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!693993 () Bool)

(declare-fun e!589564 () Bool)

(assert (=> start!91284 (=> (not res!693993) (not e!589564))))

(declare-fun valid!2230 (LongMapFixedSize!5938) Bool)

(assert (=> start!91284 (= res!693993 (valid!2230 thiss!1427))))

(assert (=> start!91284 e!589564))

(declare-fun e!589569 () Bool)

(assert (=> start!91284 e!589569))

(assert (=> start!91284 true))

(declare-fun e!589565 () Bool)

(declare-fun tp_is_empty!24751 () Bool)

(declare-fun array_inv!24401 (array!65646) Bool)

(declare-fun array_inv!24402 (array!65648) Bool)

(assert (=> b!1041148 (= e!589569 (and tp!74301 tp_is_empty!24751 (array_inv!24401 (_keys!11582 thiss!1427)) (array_inv!24402 (_values!6374 thiss!1427)) e!589565))))

(declare-fun b!1041149 () Bool)

(assert (=> b!1041149 (= e!589571 (or (not (= (size!32118 (_values!6374 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30369 thiss!1427)))) (= (size!32117 (_keys!11582 thiss!1427)) (size!32118 (_values!6374 thiss!1427)))))))

(declare-fun b!1041150 () Bool)

(declare-fun e!589570 () Bool)

(assert (=> b!1041150 (= e!589570 tp_is_empty!24751)))

(declare-fun b!1041151 () Bool)

(assert (=> b!1041151 (= e!589564 e!589568)))

(declare-fun res!693992 () Bool)

(assert (=> b!1041151 (=> (not res!693992) (not e!589568))))

(assert (=> b!1041151 (= res!693992 (is-Found!9804 lt!458876))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65646 (_ BitVec 32)) SeekEntryResult!9804)

(assert (=> b!1041151 (= lt!458876 (seekEntry!0 key!909 (_keys!11582 thiss!1427) (mask!30369 thiss!1427)))))

(declare-fun mapNonEmpty!38717 () Bool)

(declare-fun tp!74300 () Bool)

(assert (=> mapNonEmpty!38717 (= mapRes!38717 (and tp!74300 e!589570))))

(declare-fun mapValue!38717 () ValueCell!11672)

(declare-fun mapRest!38717 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapKey!38717 () (_ BitVec 32))

(assert (=> mapNonEmpty!38717 (= (arr!31586 (_values!6374 thiss!1427)) (store mapRest!38717 mapKey!38717 mapValue!38717))))

(declare-fun b!1041152 () Bool)

(declare-fun e!589566 () Bool)

(assert (=> b!1041152 (= e!589566 tp_is_empty!24751)))

(declare-fun b!1041153 () Bool)

(declare-fun res!693995 () Bool)

(assert (=> b!1041153 (=> (not res!693995) (not e!589564))))

(assert (=> b!1041153 (= res!693995 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041154 () Bool)

(assert (=> b!1041154 (= e!589565 (and e!589566 mapRes!38717))))

(declare-fun condMapEmpty!38717 () Bool)

(declare-fun mapDefault!38717 () ValueCell!11672)

