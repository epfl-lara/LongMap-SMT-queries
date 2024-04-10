; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90282 () Bool)

(assert start!90282)

(declare-fun b!1033453 () Bool)

(declare-fun b_free!20791 () Bool)

(declare-fun b_next!20791 () Bool)

(assert (=> b!1033453 (= b_free!20791 (not b_next!20791))))

(declare-fun tp!73469 () Bool)

(declare-fun b_and!33259 () Bool)

(assert (=> b!1033453 (= tp!73469 b_and!33259)))

(declare-fun b!1033449 () Bool)

(declare-fun e!584134 () Bool)

(declare-fun e!584133 () Bool)

(declare-fun mapRes!38246 () Bool)

(assert (=> b!1033449 (= e!584134 (and e!584133 mapRes!38246))))

(declare-fun condMapEmpty!38246 () Bool)

(declare-datatypes ((V!37555 0))(
  ( (V!37556 (val!12306 Int)) )
))
(declare-datatypes ((ValueCell!11552 0))(
  ( (ValueCellFull!11552 (v!14883 V!37555)) (EmptyCell!11552) )
))
(declare-datatypes ((array!65100 0))(
  ( (array!65101 (arr!31345 (Array (_ BitVec 32) (_ BitVec 64))) (size!31867 (_ BitVec 32))) )
))
(declare-datatypes ((array!65102 0))(
  ( (array!65103 (arr!31346 (Array (_ BitVec 32) ValueCell!11552)) (size!31868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5698 0))(
  ( (LongMapFixedSize!5699 (defaultEntry!6223 Int) (mask!30076 (_ BitVec 32)) (extraKeys!5955 (_ BitVec 32)) (zeroValue!6059 V!37555) (minValue!6059 V!37555) (_size!2904 (_ BitVec 32)) (_keys!11402 array!65100) (_values!6246 array!65102) (_vacant!2904 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5698)

(declare-fun mapDefault!38246 () ValueCell!11552)

