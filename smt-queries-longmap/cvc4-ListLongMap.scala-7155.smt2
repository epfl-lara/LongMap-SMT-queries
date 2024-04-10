; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91040 () Bool)

(assert start!91040)

(declare-fun b!1039691 () Bool)

(declare-fun b_free!20987 () Bool)

(declare-fun b_next!20987 () Bool)

(assert (=> b!1039691 (= b_free!20987 (not b_next!20987))))

(declare-fun tp!74143 () Bool)

(declare-fun b_and!33519 () Bool)

(assert (=> b!1039691 (= tp!74143 b_and!33519)))

(declare-fun res!693319 () Bool)

(declare-fun e!588488 () Bool)

(assert (=> start!91040 (=> (not res!693319) (not e!588488))))

(declare-datatypes ((V!37815 0))(
  ( (V!37816 (val!12404 Int)) )
))
(declare-datatypes ((ValueCell!11650 0))(
  ( (ValueCellFull!11650 (v!14991 V!37815)) (EmptyCell!11650) )
))
(declare-datatypes ((array!65542 0))(
  ( (array!65543 (arr!31541 (Array (_ BitVec 32) (_ BitVec 64))) (size!32072 (_ BitVec 32))) )
))
(declare-datatypes ((array!65544 0))(
  ( (array!65545 (arr!31542 (Array (_ BitVec 32) ValueCell!11650)) (size!32073 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5894 0))(
  ( (LongMapFixedSize!5895 (defaultEntry!6329 Int) (mask!30300 (_ BitVec 32)) (extraKeys!6057 (_ BitVec 32)) (zeroValue!6163 V!37815) (minValue!6163 V!37815) (_size!3002 (_ BitVec 32)) (_keys!11541 array!65542) (_values!6352 array!65544) (_vacant!3002 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5894)

(declare-fun valid!2214 (LongMapFixedSize!5894) Bool)

(assert (=> start!91040 (= res!693319 (valid!2214 thiss!1427))))

(assert (=> start!91040 e!588488))

(declare-fun e!588485 () Bool)

(assert (=> start!91040 e!588485))

(assert (=> start!91040 true))

(declare-fun mapNonEmpty!38626 () Bool)

(declare-fun mapRes!38626 () Bool)

(declare-fun tp!74144 () Bool)

(declare-fun e!588490 () Bool)

(assert (=> mapNonEmpty!38626 (= mapRes!38626 (and tp!74144 e!588490))))

(declare-fun mapRest!38626 () (Array (_ BitVec 32) ValueCell!11650))

(declare-fun mapKey!38626 () (_ BitVec 32))

(declare-fun mapValue!38626 () ValueCell!11650)

(assert (=> mapNonEmpty!38626 (= (arr!31542 (_values!6352 thiss!1427)) (store mapRest!38626 mapKey!38626 mapValue!38626))))

(declare-fun tp_is_empty!24707 () Bool)

(declare-fun e!588491 () Bool)

(declare-fun array_inv!24381 (array!65542) Bool)

(declare-fun array_inv!24382 (array!65544) Bool)

(assert (=> b!1039691 (= e!588485 (and tp!74143 tp_is_empty!24707 (array_inv!24381 (_keys!11541 thiss!1427)) (array_inv!24382 (_values!6352 thiss!1427)) e!588491))))

(declare-fun b!1039692 () Bool)

(declare-fun e!588487 () Bool)

(assert (=> b!1039692 (= e!588488 e!588487)))

(declare-fun res!693317 () Bool)

(assert (=> b!1039692 (=> (not res!693317) (not e!588487))))

(declare-datatypes ((SeekEntryResult!9787 0))(
  ( (MissingZero!9787 (index!41519 (_ BitVec 32))) (Found!9787 (index!41520 (_ BitVec 32))) (Intermediate!9787 (undefined!10599 Bool) (index!41521 (_ BitVec 32)) (x!92795 (_ BitVec 32))) (Undefined!9787) (MissingVacant!9787 (index!41522 (_ BitVec 32))) )
))
(declare-fun lt!458204 () SeekEntryResult!9787)

(assert (=> b!1039692 (= res!693317 (is-Found!9787 lt!458204))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65542 (_ BitVec 32)) SeekEntryResult!9787)

(assert (=> b!1039692 (= lt!458204 (seekEntry!0 key!909 (_keys!11541 thiss!1427) (mask!30300 thiss!1427)))))

(declare-fun b!1039693 () Bool)

(declare-fun res!693318 () Bool)

(assert (=> b!1039693 (=> (not res!693318) (not e!588488))))

(assert (=> b!1039693 (= res!693318 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38626 () Bool)

(assert (=> mapIsEmpty!38626 mapRes!38626))

(declare-fun b!1039694 () Bool)

(declare-fun e!588489 () Bool)

(assert (=> b!1039694 (= e!588491 (and e!588489 mapRes!38626))))

(declare-fun condMapEmpty!38626 () Bool)

(declare-fun mapDefault!38626 () ValueCell!11650)

