; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17864 () Bool)

(assert start!17864)

(declare-fun b!178242 () Bool)

(declare-fun b_free!4403 () Bool)

(declare-fun b_next!4403 () Bool)

(assert (=> b!178242 (= b_free!4403 (not b_next!4403))))

(declare-fun tp!15920 () Bool)

(declare-fun b_and!10917 () Bool)

(assert (=> b!178242 (= tp!15920 b_and!10917)))

(declare-fun b!178241 () Bool)

(declare-fun e!117496 () Bool)

(declare-fun e!117499 () Bool)

(declare-fun mapRes!7136 () Bool)

(assert (=> b!178241 (= e!117496 (and e!117499 mapRes!7136))))

(declare-fun condMapEmpty!7136 () Bool)

(declare-datatypes ((V!5213 0))(
  ( (V!5214 (val!2132 Int)) )
))
(declare-datatypes ((ValueCell!1744 0))(
  ( (ValueCellFull!1744 (v!4015 V!5213)) (EmptyCell!1744) )
))
(declare-datatypes ((array!7507 0))(
  ( (array!7508 (arr!3559 (Array (_ BitVec 32) (_ BitVec 64))) (size!3865 (_ BitVec 32))) )
))
(declare-datatypes ((array!7509 0))(
  ( (array!7510 (arr!3560 (Array (_ BitVec 32) ValueCell!1744)) (size!3866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2396 0))(
  ( (LongMapFixedSize!2397 (defaultEntry!3666 Int) (mask!8622 (_ BitVec 32)) (extraKeys!3403 (_ BitVec 32)) (zeroValue!3507 V!5213) (minValue!3507 V!5213) (_size!1247 (_ BitVec 32)) (_keys!5542 array!7507) (_values!3649 array!7509) (_vacant!1247 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2396)

(declare-fun mapDefault!7136 () ValueCell!1744)

