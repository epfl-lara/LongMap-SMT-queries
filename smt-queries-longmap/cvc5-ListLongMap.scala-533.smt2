; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13426 () Bool)

(assert start!13426)

(declare-fun b!122912 () Bool)

(declare-fun b_free!2785 () Bool)

(declare-fun b_next!2785 () Bool)

(assert (=> b!122912 (= b_free!2785 (not b_next!2785))))

(declare-fun tp!10744 () Bool)

(declare-fun b_and!7539 () Bool)

(assert (=> b!122912 (= tp!10744 b_and!7539)))

(declare-fun b!122915 () Bool)

(declare-fun b_free!2787 () Bool)

(declare-fun b_next!2787 () Bool)

(assert (=> b!122915 (= b_free!2787 (not b_next!2787))))

(declare-fun tp!10742 () Bool)

(declare-fun b_and!7541 () Bool)

(assert (=> b!122915 (= tp!10742 b_and!7541)))

(declare-fun mapIsEmpty!4383 () Bool)

(declare-fun mapRes!4384 () Bool)

(assert (=> mapIsEmpty!4383 mapRes!4384))

(declare-fun b!122907 () Bool)

(declare-fun e!80260 () Bool)

(declare-fun e!80272 () Bool)

(assert (=> b!122907 (= e!80260 (and e!80272 mapRes!4384))))

(declare-fun condMapEmpty!4384 () Bool)

(declare-datatypes ((V!3393 0))(
  ( (V!3394 (val!1449 Int)) )
))
(declare-datatypes ((array!4629 0))(
  ( (array!4630 (arr!2193 (Array (_ BitVec 32) (_ BitVec 64))) (size!2455 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1061 0))(
  ( (ValueCellFull!1061 (v!3078 V!3393)) (EmptyCell!1061) )
))
(declare-datatypes ((array!4631 0))(
  ( (array!4632 (arr!2194 (Array (_ BitVec 32) ValueCell!1061)) (size!2456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1030 0))(
  ( (LongMapFixedSize!1031 (defaultEntry!2748 Int) (mask!6982 (_ BitVec 32)) (extraKeys!2533 (_ BitVec 32)) (zeroValue!2613 V!3393) (minValue!2613 V!3393) (_size!564 (_ BitVec 32)) (_keys!4475 array!4629) (_values!2731 array!4631) (_vacant!564 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1030)

(declare-fun mapDefault!4383 () ValueCell!1061)

