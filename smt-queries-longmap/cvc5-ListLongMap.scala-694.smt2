; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16668 () Bool)

(assert start!16668)

(declare-fun b!166797 () Bool)

(declare-fun b_free!3973 () Bool)

(declare-fun b_next!3973 () Bool)

(assert (=> b!166797 (= b_free!3973 (not b_next!3973))))

(declare-fun tp!14519 () Bool)

(declare-fun b_and!10387 () Bool)

(assert (=> b!166797 (= tp!14519 b_and!10387)))

(declare-fun b!166785 () Bool)

(declare-fun e!109467 () Bool)

(declare-fun tp_is_empty!3775 () Bool)

(assert (=> b!166785 (= e!109467 tp_is_empty!3775)))

(declare-fun b!166786 () Bool)

(declare-fun e!109463 () Bool)

(declare-fun e!109460 () Bool)

(declare-fun mapRes!6381 () Bool)

(assert (=> b!166786 (= e!109463 (and e!109460 mapRes!6381))))

(declare-fun condMapEmpty!6381 () Bool)

(declare-datatypes ((V!4681 0))(
  ( (V!4682 (val!1932 Int)) )
))
(declare-datatypes ((ValueCell!1544 0))(
  ( (ValueCellFull!1544 (v!3797 V!4681)) (EmptyCell!1544) )
))
(declare-datatypes ((array!6647 0))(
  ( (array!6648 (arr!3159 (Array (_ BitVec 32) (_ BitVec 64))) (size!3447 (_ BitVec 32))) )
))
(declare-datatypes ((array!6649 0))(
  ( (array!6650 (arr!3160 (Array (_ BitVec 32) ValueCell!1544)) (size!3448 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1996 0))(
  ( (LongMapFixedSize!1997 (defaultEntry!3440 Int) (mask!8177 (_ BitVec 32)) (extraKeys!3181 (_ BitVec 32)) (zeroValue!3283 V!4681) (minValue!3283 V!4681) (_size!1047 (_ BitVec 32)) (_keys!5265 array!6647) (_values!3423 array!6649) (_vacant!1047 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1996)

(declare-fun mapDefault!6381 () ValueCell!1544)

