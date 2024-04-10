; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90722 () Bool)

(assert start!90722)

(declare-fun b!1037380 () Bool)

(declare-fun b_free!20899 () Bool)

(declare-fun b_next!20899 () Bool)

(assert (=> b!1037380 (= b_free!20899 (not b_next!20899))))

(declare-fun tp!73843 () Bool)

(declare-fun b_and!33431 () Bool)

(assert (=> b!1037380 (= tp!73843 b_and!33431)))

(declare-fun mapIsEmpty!38457 () Bool)

(declare-fun mapRes!38457 () Bool)

(assert (=> mapIsEmpty!38457 mapRes!38457))

(declare-fun b!1037375 () Bool)

(declare-fun e!586806 () Bool)

(declare-fun e!586805 () Bool)

(assert (=> b!1037375 (= e!586806 (and e!586805 mapRes!38457))))

(declare-fun condMapEmpty!38457 () Bool)

(declare-datatypes ((V!37699 0))(
  ( (V!37700 (val!12360 Int)) )
))
(declare-datatypes ((ValueCell!11606 0))(
  ( (ValueCellFull!11606 (v!14943 V!37699)) (EmptyCell!11606) )
))
(declare-datatypes ((array!65342 0))(
  ( (array!65343 (arr!31453 (Array (_ BitVec 32) (_ BitVec 64))) (size!31983 (_ BitVec 32))) )
))
(declare-datatypes ((array!65344 0))(
  ( (array!65345 (arr!31454 (Array (_ BitVec 32) ValueCell!11606)) (size!31984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5806 0))(
  ( (LongMapFixedSize!5807 (defaultEntry!6285 Int) (mask!30204 (_ BitVec 32)) (extraKeys!6013 (_ BitVec 32)) (zeroValue!6119 V!37699) (minValue!6119 V!37699) (_size!2958 (_ BitVec 32)) (_keys!11481 array!65342) (_values!6308 array!65344) (_vacant!2958 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5806)

(declare-fun mapDefault!38457 () ValueCell!11606)

