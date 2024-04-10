; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90392 () Bool)

(assert start!90392)

(declare-fun b!1034664 () Bool)

(declare-fun b_free!20803 () Bool)

(declare-fun b_next!20803 () Bool)

(assert (=> b!1034664 (= b_free!20803 (not b_next!20803))))

(declare-fun tp!73513 () Bool)

(declare-fun b_and!33303 () Bool)

(assert (=> b!1034664 (= tp!73513 b_and!33303)))

(declare-fun b!1034662 () Bool)

(declare-fun e!584902 () Bool)

(declare-fun e!584906 () Bool)

(declare-fun mapRes!38272 () Bool)

(assert (=> b!1034662 (= e!584902 (and e!584906 mapRes!38272))))

(declare-fun condMapEmpty!38272 () Bool)

(declare-datatypes ((V!37571 0))(
  ( (V!37572 (val!12312 Int)) )
))
(declare-datatypes ((ValueCell!11558 0))(
  ( (ValueCellFull!11558 (v!14892 V!37571)) (EmptyCell!11558) )
))
(declare-datatypes ((array!65128 0))(
  ( (array!65129 (arr!31357 (Array (_ BitVec 32) (_ BitVec 64))) (size!31880 (_ BitVec 32))) )
))
(declare-datatypes ((array!65130 0))(
  ( (array!65131 (arr!31358 (Array (_ BitVec 32) ValueCell!11558)) (size!31881 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5710 0))(
  ( (LongMapFixedSize!5711 (defaultEntry!6233 Int) (mask!30095 (_ BitVec 32)) (extraKeys!5963 (_ BitVec 32)) (zeroValue!6067 V!37571) (minValue!6069 V!37571) (_size!2910 (_ BitVec 32)) (_keys!11415 array!65128) (_values!6256 array!65130) (_vacant!2910 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5710)

(declare-fun mapDefault!38272 () ValueCell!11558)

