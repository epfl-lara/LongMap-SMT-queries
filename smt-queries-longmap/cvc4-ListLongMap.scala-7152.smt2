; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90960 () Bool)

(assert start!90960)

(declare-fun b!1039176 () Bool)

(declare-fun b_free!20969 () Bool)

(declare-fun b_next!20969 () Bool)

(assert (=> b!1039176 (= b_free!20969 (not b_next!20969))))

(declare-fun tp!74081 () Bool)

(declare-fun b_and!33501 () Bool)

(assert (=> b!1039176 (= tp!74081 b_and!33501)))

(declare-fun b!1039172 () Bool)

(declare-fun res!693062 () Bool)

(declare-fun e!588123 () Bool)

(assert (=> b!1039172 (=> (not res!693062) (not e!588123))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039172 (= res!693062 (not (= key!909 (bvneg key!909))))))

(declare-fun res!693060 () Bool)

(assert (=> start!90960 (=> (not res!693060) (not e!588123))))

(declare-datatypes ((V!37791 0))(
  ( (V!37792 (val!12395 Int)) )
))
(declare-datatypes ((ValueCell!11641 0))(
  ( (ValueCellFull!11641 (v!14982 V!37791)) (EmptyCell!11641) )
))
(declare-datatypes ((array!65500 0))(
  ( (array!65501 (arr!31523 (Array (_ BitVec 32) (_ BitVec 64))) (size!32054 (_ BitVec 32))) )
))
(declare-datatypes ((array!65502 0))(
  ( (array!65503 (arr!31524 (Array (_ BitVec 32) ValueCell!11641)) (size!32055 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5876 0))(
  ( (LongMapFixedSize!5877 (defaultEntry!6320 Int) (mask!30278 (_ BitVec 32)) (extraKeys!6048 (_ BitVec 32)) (zeroValue!6154 V!37791) (minValue!6154 V!37791) (_size!2993 (_ BitVec 32)) (_keys!11528 array!65500) (_values!6343 array!65502) (_vacant!2993 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5876)

(declare-fun valid!2208 (LongMapFixedSize!5876) Bool)

(assert (=> start!90960 (= res!693060 (valid!2208 thiss!1427))))

(assert (=> start!90960 e!588123))

(declare-fun e!588125 () Bool)

(assert (=> start!90960 e!588125))

(assert (=> start!90960 true))

(declare-fun mapNonEmpty!38590 () Bool)

(declare-fun mapRes!38590 () Bool)

(declare-fun tp!74080 () Bool)

(declare-fun e!588119 () Bool)

(assert (=> mapNonEmpty!38590 (= mapRes!38590 (and tp!74080 e!588119))))

(declare-fun mapValue!38590 () ValueCell!11641)

(declare-fun mapKey!38590 () (_ BitVec 32))

(declare-fun mapRest!38590 () (Array (_ BitVec 32) ValueCell!11641))

(assert (=> mapNonEmpty!38590 (= (arr!31524 (_values!6343 thiss!1427)) (store mapRest!38590 mapKey!38590 mapValue!38590))))

(declare-fun b!1039173 () Bool)

(declare-fun tp_is_empty!24689 () Bool)

(assert (=> b!1039173 (= e!588119 tp_is_empty!24689)))

(declare-fun b!1039174 () Bool)

(declare-fun e!588126 () Bool)

(declare-fun e!588120 () Bool)

(assert (=> b!1039174 (= e!588126 (and e!588120 mapRes!38590))))

(declare-fun condMapEmpty!38590 () Bool)

(declare-fun mapDefault!38590 () ValueCell!11641)

