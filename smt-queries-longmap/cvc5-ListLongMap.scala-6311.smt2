; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80890 () Bool)

(assert start!80890)

(declare-fun b!947829 () Bool)

(declare-fun b_free!18187 () Bool)

(declare-fun b_next!18187 () Bool)

(assert (=> b!947829 (= b_free!18187 (not b_next!18187))))

(declare-fun tp!63128 () Bool)

(declare-fun b_and!29611 () Bool)

(assert (=> b!947829 (= tp!63128 b_and!29611)))

(declare-fun b!947827 () Bool)

(declare-fun e!533531 () Bool)

(declare-fun tp_is_empty!20695 () Bool)

(assert (=> b!947827 (= e!533531 tp_is_empty!20695)))

(declare-fun b!947828 () Bool)

(declare-fun e!533532 () Bool)

(declare-fun e!533528 () Bool)

(declare-fun mapRes!32926 () Bool)

(assert (=> b!947828 (= e!533532 (and e!533528 mapRes!32926))))

(declare-fun condMapEmpty!32926 () Bool)

(declare-datatypes ((V!32559 0))(
  ( (V!32560 (val!10398 Int)) )
))
(declare-datatypes ((ValueCell!9866 0))(
  ( (ValueCellFull!9866 (v!12933 V!32559)) (EmptyCell!9866) )
))
(declare-datatypes ((array!57392 0))(
  ( (array!57393 (arr!27604 (Array (_ BitVec 32) ValueCell!9866)) (size!28077 (_ BitVec 32))) )
))
(declare-datatypes ((array!57394 0))(
  ( (array!57395 (arr!27605 (Array (_ BitVec 32) (_ BitVec 64))) (size!28078 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4882 0))(
  ( (LongMapFixedSize!4883 (defaultEntry!5740 Int) (mask!27488 (_ BitVec 32)) (extraKeys!5472 (_ BitVec 32)) (zeroValue!5576 V!32559) (minValue!5576 V!32559) (_size!2496 (_ BitVec 32)) (_keys!10654 array!57394) (_values!5763 array!57392) (_vacant!2496 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4882)

(declare-fun mapDefault!32926 () ValueCell!9866)

