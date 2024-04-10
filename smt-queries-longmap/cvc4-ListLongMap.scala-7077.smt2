; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89520 () Bool)

(assert start!89520)

(declare-fun b!1026732 () Bool)

(declare-fun b_free!20519 () Bool)

(declare-fun b_next!20519 () Bool)

(assert (=> b!1026732 (= b_free!20519 (not b_next!20519))))

(declare-fun tp!72603 () Bool)

(declare-fun b_and!32765 () Bool)

(assert (=> b!1026732 (= tp!72603 b_and!32765)))

(declare-fun e!579280 () Bool)

(declare-fun e!579286 () Bool)

(declare-fun tp_is_empty!24239 () Bool)

(declare-datatypes ((V!37191 0))(
  ( (V!37192 (val!12170 Int)) )
))
(declare-datatypes ((ValueCell!11416 0))(
  ( (ValueCellFull!11416 (v!14739 V!37191)) (EmptyCell!11416) )
))
(declare-datatypes ((array!64528 0))(
  ( (array!64529 (arr!31073 (Array (_ BitVec 32) (_ BitVec 64))) (size!31586 (_ BitVec 32))) )
))
(declare-datatypes ((array!64530 0))(
  ( (array!64531 (arr!31074 (Array (_ BitVec 32) ValueCell!11416)) (size!31587 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5426 0))(
  ( (LongMapFixedSize!5427 (defaultEntry!6065 Int) (mask!29765 (_ BitVec 32)) (extraKeys!5797 (_ BitVec 32)) (zeroValue!5901 V!37191) (minValue!5901 V!37191) (_size!2768 (_ BitVec 32)) (_keys!11212 array!64528) (_values!6088 array!64530) (_vacant!2768 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5426)

(declare-fun array_inv!24061 (array!64528) Bool)

(declare-fun array_inv!24062 (array!64530) Bool)

(assert (=> b!1026732 (= e!579280 (and tp!72603 tp_is_empty!24239 (array_inv!24061 (_keys!11212 thiss!1427)) (array_inv!24062 (_values!6088 thiss!1427)) e!579286))))

(declare-fun b!1026733 () Bool)

(declare-fun res!687282 () Bool)

(declare-fun e!579283 () Bool)

(assert (=> b!1026733 (=> (not res!687282) (not e!579283))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026733 (= res!687282 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026734 () Bool)

(declare-fun e!579284 () Bool)

(assert (=> b!1026734 (= e!579284 tp_is_empty!24239)))

(declare-fun b!1026735 () Bool)

(declare-fun e!579285 () Bool)

(assert (=> b!1026735 (= e!579285 tp_is_empty!24239)))

(declare-fun b!1026736 () Bool)

(declare-fun e!579279 () Bool)

(declare-fun e!579282 () Bool)

(assert (=> b!1026736 (= e!579279 (not e!579282))))

(declare-fun res!687284 () Bool)

(assert (=> b!1026736 (=> res!687284 e!579282)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026736 (= res!687284 (not (validMask!0 (mask!29765 thiss!1427))))))

(declare-fun lt!451763 () array!64528)

(declare-fun arrayContainsKey!0 (array!64528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026736 (not (arrayContainsKey!0 lt!451763 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9654 0))(
  ( (MissingZero!9654 (index!40987 (_ BitVec 32))) (Found!9654 (index!40988 (_ BitVec 32))) (Intermediate!9654 (undefined!10466 Bool) (index!40989 (_ BitVec 32)) (x!91340 (_ BitVec 32))) (Undefined!9654) (MissingVacant!9654 (index!40990 (_ BitVec 32))) )
))
(declare-fun lt!451761 () SeekEntryResult!9654)

(declare-datatypes ((Unit!33451 0))(
  ( (Unit!33452) )
))
(declare-fun lt!451764 () Unit!33451)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64528 (_ BitVec 32) (_ BitVec 64)) Unit!33451)

(assert (=> b!1026736 (= lt!451764 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11212 thiss!1427) (index!40988 lt!451761) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64528 (_ BitVec 32)) Bool)

(assert (=> b!1026736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451763 (mask!29765 thiss!1427))))

(declare-fun lt!451765 () Unit!33451)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64528 (_ BitVec 32) (_ BitVec 32)) Unit!33451)

(assert (=> b!1026736 (= lt!451765 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11212 thiss!1427) (index!40988 lt!451761) (mask!29765 thiss!1427)))))

(declare-datatypes ((List!21788 0))(
  ( (Nil!21785) (Cons!21784 (h!22982 (_ BitVec 64)) (t!30850 List!21788)) )
))
(declare-fun arrayNoDuplicates!0 (array!64528 (_ BitVec 32) List!21788) Bool)

(assert (=> b!1026736 (arrayNoDuplicates!0 lt!451763 #b00000000000000000000000000000000 Nil!21785)))

(declare-fun lt!451767 () Unit!33451)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21788) Unit!33451)

(assert (=> b!1026736 (= lt!451767 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11212 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40988 lt!451761) #b00000000000000000000000000000000 Nil!21785))))

(declare-fun arrayCountValidKeys!0 (array!64528 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026736 (= (arrayCountValidKeys!0 lt!451763 #b00000000000000000000000000000000 (size!31586 (_keys!11212 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 (size!31586 (_keys!11212 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026736 (= lt!451763 (array!64529 (store (arr!31073 (_keys!11212 thiss!1427)) (index!40988 lt!451761) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31586 (_keys!11212 thiss!1427))))))

(declare-fun lt!451762 () Unit!33451)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64528 (_ BitVec 32) (_ BitVec 64)) Unit!33451)

(assert (=> b!1026736 (= lt!451762 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11212 thiss!1427) (index!40988 lt!451761) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687279 () Bool)

(assert (=> start!89520 (=> (not res!687279) (not e!579283))))

(declare-fun valid!2060 (LongMapFixedSize!5426) Bool)

(assert (=> start!89520 (= res!687279 (valid!2060 thiss!1427))))

(assert (=> start!89520 e!579283))

(assert (=> start!89520 e!579280))

(assert (=> start!89520 true))

(declare-fun b!1026731 () Bool)

(assert (=> b!1026731 (= e!579282 true)))

(declare-fun lt!451766 () Bool)

(assert (=> b!1026731 (= lt!451766 (arrayNoDuplicates!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 Nil!21785))))

(declare-fun b!1026737 () Bool)

(assert (=> b!1026737 (= e!579283 e!579279)))

(declare-fun res!687281 () Bool)

(assert (=> b!1026737 (=> (not res!687281) (not e!579279))))

(assert (=> b!1026737 (= res!687281 (is-Found!9654 lt!451761))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64528 (_ BitVec 32)) SeekEntryResult!9654)

(assert (=> b!1026737 (= lt!451761 (seekEntry!0 key!909 (_keys!11212 thiss!1427) (mask!29765 thiss!1427)))))

(declare-fun mapIsEmpty!37787 () Bool)

(declare-fun mapRes!37787 () Bool)

(assert (=> mapIsEmpty!37787 mapRes!37787))

(declare-fun b!1026738 () Bool)

(declare-fun res!687283 () Bool)

(assert (=> b!1026738 (=> res!687283 e!579282)))

(assert (=> b!1026738 (= res!687283 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11212 thiss!1427) (mask!29765 thiss!1427))))))

(declare-fun b!1026739 () Bool)

(assert (=> b!1026739 (= e!579286 (and e!579285 mapRes!37787))))

(declare-fun condMapEmpty!37787 () Bool)

(declare-fun mapDefault!37787 () ValueCell!11416)

