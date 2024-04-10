; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90188 () Bool)

(assert start!90188)

(declare-fun b!1032793 () Bool)

(declare-fun b_free!20747 () Bool)

(declare-fun b_next!20747 () Bool)

(assert (=> b!1032793 (= b_free!20747 (not b_next!20747))))

(declare-fun tp!73324 () Bool)

(declare-fun b_and!33215 () Bool)

(assert (=> b!1032793 (= tp!73324 b_and!33215)))

(declare-fun mapIsEmpty!38166 () Bool)

(declare-fun mapRes!38166 () Bool)

(assert (=> mapIsEmpty!38166 mapRes!38166))

(declare-fun mapNonEmpty!38166 () Bool)

(declare-fun tp!73323 () Bool)

(declare-fun e!583627 () Bool)

(assert (=> mapNonEmpty!38166 (= mapRes!38166 (and tp!73323 e!583627))))

(declare-datatypes ((V!37495 0))(
  ( (V!37496 (val!12284 Int)) )
))
(declare-datatypes ((ValueCell!11530 0))(
  ( (ValueCellFull!11530 (v!14861 V!37495)) (EmptyCell!11530) )
))
(declare-fun mapValue!38166 () ValueCell!11530)

(declare-fun mapRest!38166 () (Array (_ BitVec 32) ValueCell!11530))

(declare-fun mapKey!38166 () (_ BitVec 32))

(declare-datatypes ((array!65004 0))(
  ( (array!65005 (arr!31301 (Array (_ BitVec 32) (_ BitVec 64))) (size!31821 (_ BitVec 32))) )
))
(declare-datatypes ((array!65006 0))(
  ( (array!65007 (arr!31302 (Array (_ BitVec 32) ValueCell!11530)) (size!31822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5654 0))(
  ( (LongMapFixedSize!5655 (defaultEntry!6201 Int) (mask!30031 (_ BitVec 32)) (extraKeys!5933 (_ BitVec 32)) (zeroValue!6037 V!37495) (minValue!6037 V!37495) (_size!2882 (_ BitVec 32)) (_keys!11377 array!65004) (_values!6224 array!65006) (_vacant!2882 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5654)

(assert (=> mapNonEmpty!38166 (= (arr!31302 (_values!6224 thiss!1427)) (store mapRest!38166 mapKey!38166 mapValue!38166))))

(declare-fun b!1032788 () Bool)

(declare-fun e!583629 () Bool)

(declare-fun e!583631 () Bool)

(assert (=> b!1032788 (= e!583629 (and e!583631 mapRes!38166))))

(declare-fun condMapEmpty!38166 () Bool)

(declare-fun mapDefault!38166 () ValueCell!11530)

