; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90842 () Bool)

(assert start!90842)

(declare-fun b!1038413 () Bool)

(declare-fun b_free!20941 () Bool)

(declare-fun b_next!20941 () Bool)

(assert (=> b!1038413 (= b_free!20941 (not b_next!20941))))

(declare-fun tp!73984 () Bool)

(declare-fun b_and!33473 () Bool)

(assert (=> b!1038413 (= tp!73984 b_and!33473)))

(declare-fun mapNonEmpty!38535 () Bool)

(declare-fun mapRes!38535 () Bool)

(declare-fun tp!73983 () Bool)

(declare-fun e!587541 () Bool)

(assert (=> mapNonEmpty!38535 (= mapRes!38535 (and tp!73983 e!587541))))

(declare-fun mapKey!38535 () (_ BitVec 32))

(declare-datatypes ((V!37755 0))(
  ( (V!37756 (val!12381 Int)) )
))
(declare-datatypes ((ValueCell!11627 0))(
  ( (ValueCellFull!11627 (v!14967 V!37755)) (EmptyCell!11627) )
))
(declare-fun mapValue!38535 () ValueCell!11627)

(declare-datatypes ((array!65436 0))(
  ( (array!65437 (arr!31495 (Array (_ BitVec 32) (_ BitVec 64))) (size!32025 (_ BitVec 32))) )
))
(declare-datatypes ((array!65438 0))(
  ( (array!65439 (arr!31496 (Array (_ BitVec 32) ValueCell!11627)) (size!32026 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5848 0))(
  ( (LongMapFixedSize!5849 (defaultEntry!6306 Int) (mask!30244 (_ BitVec 32)) (extraKeys!6034 (_ BitVec 32)) (zeroValue!6140 V!37755) (minValue!6140 V!37755) (_size!2979 (_ BitVec 32)) (_keys!11507 array!65436) (_values!6329 array!65438) (_vacant!2979 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5848)

(declare-fun mapRest!38535 () (Array (_ BitVec 32) ValueCell!11627))

(assert (=> mapNonEmpty!38535 (= (arr!31496 (_values!6329 thiss!1427)) (store mapRest!38535 mapKey!38535 mapValue!38535))))

(declare-fun b!1038408 () Bool)

(declare-fun res!692718 () Bool)

(declare-fun e!587540 () Bool)

(assert (=> b!1038408 (=> (not res!692718) (not e!587540))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038408 (= res!692718 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38535 () Bool)

(assert (=> mapIsEmpty!38535 mapRes!38535))

(declare-fun b!1038409 () Bool)

(declare-fun tp_is_empty!24661 () Bool)

(assert (=> b!1038409 (= e!587541 tp_is_empty!24661)))

(declare-fun b!1038410 () Bool)

(declare-fun e!587542 () Bool)

(assert (=> b!1038410 (= e!587542 tp_is_empty!24661)))

(declare-fun b!1038411 () Bool)

(declare-fun e!587545 () Bool)

(assert (=> b!1038411 (= e!587545 (and e!587542 mapRes!38535))))

(declare-fun condMapEmpty!38535 () Bool)

(declare-fun mapDefault!38535 () ValueCell!11627)

