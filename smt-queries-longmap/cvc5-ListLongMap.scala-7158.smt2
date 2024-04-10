; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91114 () Bool)

(assert start!91114)

(declare-fun b!1040133 () Bool)

(declare-fun b_free!21001 () Bool)

(declare-fun b_next!21001 () Bool)

(assert (=> b!1040133 (= b_free!21001 (not b_next!21001))))

(declare-fun tp!74195 () Bool)

(declare-fun b_and!33533 () Bool)

(assert (=> b!1040133 (= tp!74195 b_and!33533)))

(declare-fun b!1040128 () Bool)

(declare-fun e!588813 () Bool)

(declare-datatypes ((V!37835 0))(
  ( (V!37836 (val!12411 Int)) )
))
(declare-datatypes ((ValueCell!11657 0))(
  ( (ValueCellFull!11657 (v!14998 V!37835)) (EmptyCell!11657) )
))
(declare-datatypes ((array!65576 0))(
  ( (array!65577 (arr!31555 (Array (_ BitVec 32) (_ BitVec 64))) (size!32086 (_ BitVec 32))) )
))
(declare-datatypes ((array!65578 0))(
  ( (array!65579 (arr!31556 (Array (_ BitVec 32) ValueCell!11657)) (size!32087 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5908 0))(
  ( (LongMapFixedSize!5909 (defaultEntry!6336 Int) (mask!30322 (_ BitVec 32)) (extraKeys!6064 (_ BitVec 32)) (zeroValue!6170 V!37835) (minValue!6170 V!37835) (_size!3009 (_ BitVec 32)) (_keys!11554 array!65576) (_values!6359 array!65578) (_vacant!3009 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5908)

(declare-datatypes ((List!21954 0))(
  ( (Nil!21951) (Cons!21950 (h!23154 (_ BitVec 64)) (t!31168 List!21954)) )
))
(declare-fun arrayNoDuplicates!0 (array!65576 (_ BitVec 32) List!21954) Bool)

(assert (=> b!1040128 (= e!588813 (arrayNoDuplicates!0 (_keys!11554 thiss!1427) #b00000000000000000000000000000000 Nil!21951))))

(declare-fun b!1040129 () Bool)

(declare-fun e!588816 () Bool)

(declare-fun tp_is_empty!24721 () Bool)

(assert (=> b!1040129 (= e!588816 tp_is_empty!24721)))

(declare-fun mapNonEmpty!38656 () Bool)

(declare-fun mapRes!38656 () Bool)

(declare-fun tp!74194 () Bool)

(declare-fun e!588817 () Bool)

(assert (=> mapNonEmpty!38656 (= mapRes!38656 (and tp!74194 e!588817))))

(declare-fun mapRest!38656 () (Array (_ BitVec 32) ValueCell!11657))

(declare-fun mapKey!38656 () (_ BitVec 32))

(declare-fun mapValue!38656 () ValueCell!11657)

(assert (=> mapNonEmpty!38656 (= (arr!31556 (_values!6359 thiss!1427)) (store mapRest!38656 mapKey!38656 mapValue!38656))))

(declare-fun b!1040130 () Bool)

(declare-fun e!588814 () Bool)

(declare-fun e!588811 () Bool)

(assert (=> b!1040130 (= e!588814 e!588811)))

(declare-fun res!693508 () Bool)

(assert (=> b!1040130 (=> (not res!693508) (not e!588811))))

(declare-datatypes ((SeekEntryResult!9792 0))(
  ( (MissingZero!9792 (index!41539 (_ BitVec 32))) (Found!9792 (index!41540 (_ BitVec 32))) (Intermediate!9792 (undefined!10604 Bool) (index!41541 (_ BitVec 32)) (x!92848 (_ BitVec 32))) (Undefined!9792) (MissingVacant!9792 (index!41542 (_ BitVec 32))) )
))
(declare-fun lt!458407 () SeekEntryResult!9792)

(assert (=> b!1040130 (= res!693508 (is-Found!9792 lt!458407))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65576 (_ BitVec 32)) SeekEntryResult!9792)

(assert (=> b!1040130 (= lt!458407 (seekEntry!0 key!909 (_keys!11554 thiss!1427) (mask!30322 thiss!1427)))))

(declare-fun b!1040131 () Bool)

(assert (=> b!1040131 (= e!588811 (not e!588813))))

(declare-fun res!693509 () Bool)

(assert (=> b!1040131 (=> res!693509 e!588813)))

(assert (=> b!1040131 (= res!693509 (or (bvslt (index!41540 lt!458407) #b00000000000000000000000000000000) (bvsge (index!41540 lt!458407) (size!32086 (_keys!11554 thiss!1427))) (bvsge (size!32086 (_keys!11554 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458411 () array!65576)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65576 (_ BitVec 32)) Bool)

(assert (=> b!1040131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458411 (mask!30322 thiss!1427))))

(declare-datatypes ((Unit!34009 0))(
  ( (Unit!34010) )
))
(declare-fun lt!458408 () Unit!34009)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65576 (_ BitVec 32) (_ BitVec 32)) Unit!34009)

(assert (=> b!1040131 (= lt!458408 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11554 thiss!1427) (index!41540 lt!458407) (mask!30322 thiss!1427)))))

(assert (=> b!1040131 (arrayNoDuplicates!0 lt!458411 #b00000000000000000000000000000000 Nil!21951)))

(declare-fun lt!458410 () Unit!34009)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21954) Unit!34009)

(assert (=> b!1040131 (= lt!458410 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11554 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41540 lt!458407) #b00000000000000000000000000000000 Nil!21951))))

(declare-fun arrayCountValidKeys!0 (array!65576 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040131 (= (arrayCountValidKeys!0 lt!458411 #b00000000000000000000000000000000 (size!32086 (_keys!11554 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11554 thiss!1427) #b00000000000000000000000000000000 (size!32086 (_keys!11554 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040131 (= lt!458411 (array!65577 (store (arr!31555 (_keys!11554 thiss!1427)) (index!41540 lt!458407) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32086 (_keys!11554 thiss!1427))))))

(declare-fun lt!458409 () Unit!34009)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65576 (_ BitVec 32) (_ BitVec 64)) Unit!34009)

(assert (=> b!1040131 (= lt!458409 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11554 thiss!1427) (index!41540 lt!458407) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!693511 () Bool)

(assert (=> start!91114 (=> (not res!693511) (not e!588814))))

(declare-fun valid!2219 (LongMapFixedSize!5908) Bool)

(assert (=> start!91114 (= res!693511 (valid!2219 thiss!1427))))

(assert (=> start!91114 e!588814))

(declare-fun e!588815 () Bool)

(assert (=> start!91114 e!588815))

(assert (=> start!91114 true))

(declare-fun mapIsEmpty!38656 () Bool)

(assert (=> mapIsEmpty!38656 mapRes!38656))

(declare-fun b!1040132 () Bool)

(declare-fun e!588818 () Bool)

(assert (=> b!1040132 (= e!588818 (and e!588816 mapRes!38656))))

(declare-fun condMapEmpty!38656 () Bool)

(declare-fun mapDefault!38656 () ValueCell!11657)

