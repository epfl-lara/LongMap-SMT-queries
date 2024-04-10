; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90912 () Bool)

(assert start!90912)

(declare-fun b!1038859 () Bool)

(declare-fun b_free!20957 () Bool)

(declare-fun b_next!20957 () Bool)

(assert (=> b!1038859 (= b_free!20957 (not b_next!20957))))

(declare-fun tp!74038 () Bool)

(declare-fun b_and!33489 () Bool)

(assert (=> b!1038859 (= tp!74038 b_and!33489)))

(declare-fun b!1038858 () Bool)

(declare-fun e!587884 () Bool)

(declare-fun tp_is_empty!24677 () Bool)

(assert (=> b!1038858 (= e!587884 tp_is_empty!24677)))

(declare-fun e!587887 () Bool)

(declare-fun e!587886 () Bool)

(declare-datatypes ((V!37775 0))(
  ( (V!37776 (val!12389 Int)) )
))
(declare-datatypes ((ValueCell!11635 0))(
  ( (ValueCellFull!11635 (v!14976 V!37775)) (EmptyCell!11635) )
))
(declare-datatypes ((array!65472 0))(
  ( (array!65473 (arr!31511 (Array (_ BitVec 32) (_ BitVec 64))) (size!32042 (_ BitVec 32))) )
))
(declare-datatypes ((array!65474 0))(
  ( (array!65475 (arr!31512 (Array (_ BitVec 32) ValueCell!11635)) (size!32043 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5864 0))(
  ( (LongMapFixedSize!5865 (defaultEntry!6314 Int) (mask!30264 (_ BitVec 32)) (extraKeys!6042 (_ BitVec 32)) (zeroValue!6148 V!37775) (minValue!6148 V!37775) (_size!2987 (_ BitVec 32)) (_keys!11520 array!65472) (_values!6337 array!65474) (_vacant!2987 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5864)

(declare-fun array_inv!24365 (array!65472) Bool)

(declare-fun array_inv!24366 (array!65474) Bool)

(assert (=> b!1038859 (= e!587886 (and tp!74038 tp_is_empty!24677 (array_inv!24365 (_keys!11520 thiss!1427)) (array_inv!24366 (_values!6337 thiss!1427)) e!587887))))

(declare-fun b!1038860 () Bool)

(declare-fun e!587883 () Bool)

(declare-fun e!587888 () Bool)

(assert (=> b!1038860 (= e!587883 e!587888)))

(declare-fun res!692917 () Bool)

(assert (=> b!1038860 (=> (not res!692917) (not e!587888))))

(declare-datatypes ((SeekEntryResult!9776 0))(
  ( (MissingZero!9776 (index!41475 (_ BitVec 32))) (Found!9776 (index!41476 (_ BitVec 32))) (Intermediate!9776 (undefined!10588 Bool) (index!41477 (_ BitVec 32)) (x!92704 (_ BitVec 32))) (Undefined!9776) (MissingVacant!9776 (index!41478 (_ BitVec 32))) )
))
(declare-fun lt!457893 () SeekEntryResult!9776)

(assert (=> b!1038860 (= res!692917 (is-Found!9776 lt!457893))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65472 (_ BitVec 32)) SeekEntryResult!9776)

(assert (=> b!1038860 (= lt!457893 (seekEntry!0 key!909 (_keys!11520 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun mapNonEmpty!38566 () Bool)

(declare-fun mapRes!38566 () Bool)

(declare-fun tp!74039 () Bool)

(assert (=> mapNonEmpty!38566 (= mapRes!38566 (and tp!74039 e!587884))))

(declare-fun mapRest!38566 () (Array (_ BitVec 32) ValueCell!11635))

(declare-fun mapKey!38566 () (_ BitVec 32))

(declare-fun mapValue!38566 () ValueCell!11635)

(assert (=> mapNonEmpty!38566 (= (arr!31512 (_values!6337 thiss!1427)) (store mapRest!38566 mapKey!38566 mapValue!38566))))

(declare-fun b!1038861 () Bool)

(declare-fun e!587881 () Bool)

(assert (=> b!1038861 (= e!587887 (and e!587881 mapRes!38566))))

(declare-fun condMapEmpty!38566 () Bool)

(declare-fun mapDefault!38566 () ValueCell!11635)

