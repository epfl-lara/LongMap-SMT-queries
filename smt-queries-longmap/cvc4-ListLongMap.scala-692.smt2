; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16660 () Bool)

(assert start!16660)

(declare-fun b!166638 () Bool)

(declare-fun b_free!3965 () Bool)

(declare-fun b_next!3965 () Bool)

(assert (=> b!166638 (= b_free!3965 (not b_next!3965))))

(declare-fun tp!14496 () Bool)

(declare-fun b_and!10379 () Bool)

(assert (=> b!166638 (= tp!14496 b_and!10379)))

(declare-fun b!166629 () Bool)

(declare-fun e!109344 () Bool)

(declare-fun e!109340 () Bool)

(declare-fun mapRes!6369 () Bool)

(assert (=> b!166629 (= e!109344 (and e!109340 mapRes!6369))))

(declare-fun condMapEmpty!6369 () Bool)

(declare-datatypes ((V!4669 0))(
  ( (V!4670 (val!1928 Int)) )
))
(declare-datatypes ((ValueCell!1540 0))(
  ( (ValueCellFull!1540 (v!3793 V!4669)) (EmptyCell!1540) )
))
(declare-datatypes ((array!6631 0))(
  ( (array!6632 (arr!3151 (Array (_ BitVec 32) (_ BitVec 64))) (size!3439 (_ BitVec 32))) )
))
(declare-datatypes ((array!6633 0))(
  ( (array!6634 (arr!3152 (Array (_ BitVec 32) ValueCell!1540)) (size!3440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1988 0))(
  ( (LongMapFixedSize!1989 (defaultEntry!3436 Int) (mask!8169 (_ BitVec 32)) (extraKeys!3177 (_ BitVec 32)) (zeroValue!3279 V!4669) (minValue!3279 V!4669) (_size!1043 (_ BitVec 32)) (_keys!5261 array!6631) (_values!3419 array!6633) (_vacant!1043 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1988)

(declare-fun mapDefault!6369 () ValueCell!1540)

