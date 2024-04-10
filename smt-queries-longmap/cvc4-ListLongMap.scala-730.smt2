; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16976 () Bool)

(assert start!16976)

(declare-fun b!170687 () Bool)

(declare-fun b_free!4223 () Bool)

(declare-fun b_next!4223 () Bool)

(assert (=> b!170687 (= b_free!4223 (not b_next!4223))))

(declare-fun tp!15292 () Bool)

(declare-fun b_and!10637 () Bool)

(assert (=> b!170687 (= tp!15292 b_and!10637)))

(declare-fun b!170682 () Bool)

(declare-fun e!112663 () Bool)

(declare-fun tp_is_empty!3995 () Bool)

(assert (=> b!170682 (= e!112663 tp_is_empty!3995)))

(declare-fun b!170683 () Bool)

(declare-fun e!112668 () Bool)

(declare-fun e!112666 () Bool)

(declare-fun mapRes!6779 () Bool)

(assert (=> b!170683 (= e!112668 (and e!112666 mapRes!6779))))

(declare-fun condMapEmpty!6779 () Bool)

(declare-datatypes ((V!4973 0))(
  ( (V!4974 (val!2042 Int)) )
))
(declare-datatypes ((ValueCell!1654 0))(
  ( (ValueCellFull!1654 (v!3907 V!4973)) (EmptyCell!1654) )
))
(declare-datatypes ((array!7099 0))(
  ( (array!7100 (arr!3379 (Array (_ BitVec 32) (_ BitVec 64))) (size!3672 (_ BitVec 32))) )
))
(declare-datatypes ((array!7101 0))(
  ( (array!7102 (arr!3380 (Array (_ BitVec 32) ValueCell!1654)) (size!3673 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2216 0))(
  ( (LongMapFixedSize!2217 (defaultEntry!3550 Int) (mask!8370 (_ BitVec 32)) (extraKeys!3291 (_ BitVec 32)) (zeroValue!3393 V!4973) (minValue!3393 V!4973) (_size!1157 (_ BitVec 32)) (_keys!5380 array!7099) (_values!3533 array!7101) (_vacant!1157 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2216)

(declare-fun mapDefault!6779 () ValueCell!1654)

