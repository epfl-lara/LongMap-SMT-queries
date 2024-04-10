; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90846 () Bool)

(assert start!90846)

(declare-fun b!1038449 () Bool)

(declare-fun b_free!20945 () Bool)

(declare-fun b_next!20945 () Bool)

(assert (=> b!1038449 (= b_free!20945 (not b_next!20945))))

(declare-fun tp!73995 () Bool)

(declare-fun b_and!33477 () Bool)

(assert (=> b!1038449 (= tp!73995 b_and!33477)))

(declare-fun e!587584 () Bool)

(declare-fun e!587588 () Bool)

(declare-datatypes ((V!37759 0))(
  ( (V!37760 (val!12383 Int)) )
))
(declare-datatypes ((ValueCell!11629 0))(
  ( (ValueCellFull!11629 (v!14969 V!37759)) (EmptyCell!11629) )
))
(declare-datatypes ((array!65444 0))(
  ( (array!65445 (arr!31499 (Array (_ BitVec 32) (_ BitVec 64))) (size!32029 (_ BitVec 32))) )
))
(declare-datatypes ((array!65446 0))(
  ( (array!65447 (arr!31500 (Array (_ BitVec 32) ValueCell!11629)) (size!32030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5852 0))(
  ( (LongMapFixedSize!5853 (defaultEntry!6308 Int) (mask!30246 (_ BitVec 32)) (extraKeys!6036 (_ BitVec 32)) (zeroValue!6142 V!37759) (minValue!6142 V!37759) (_size!2981 (_ BitVec 32)) (_keys!11509 array!65444) (_values!6331 array!65446) (_vacant!2981 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5852)

(declare-fun tp_is_empty!24665 () Bool)

(declare-fun array_inv!24355 (array!65444) Bool)

(declare-fun array_inv!24356 (array!65446) Bool)

(assert (=> b!1038449 (= e!587588 (and tp!73995 tp_is_empty!24665 (array_inv!24355 (_keys!11509 thiss!1427)) (array_inv!24356 (_values!6331 thiss!1427)) e!587584))))

(declare-fun b!1038450 () Bool)

(declare-fun res!692736 () Bool)

(declare-fun e!587587 () Bool)

(assert (=> b!1038450 (=> (not res!692736) (not e!587587))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038450 (= res!692736 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038451 () Bool)

(declare-fun e!587583 () Bool)

(assert (=> b!1038451 (= e!587583 tp_is_empty!24665)))

(declare-fun b!1038452 () Bool)

(declare-fun e!587585 () Bool)

(declare-fun mapRes!38541 () Bool)

(assert (=> b!1038452 (= e!587584 (and e!587585 mapRes!38541))))

(declare-fun condMapEmpty!38541 () Bool)

(declare-fun mapDefault!38541 () ValueCell!11629)

