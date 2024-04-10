; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15638 () Bool)

(assert start!15638)

(declare-fun b!155822 () Bool)

(declare-fun b_free!3305 () Bool)

(declare-fun b_next!3305 () Bool)

(assert (=> b!155822 (= b_free!3305 (not b_next!3305))))

(declare-fun tp!12439 () Bool)

(declare-fun b_and!9719 () Bool)

(assert (=> b!155822 (= tp!12439 b_and!9719)))

(declare-fun mapIsEmpty!5303 () Bool)

(declare-fun mapRes!5303 () Bool)

(assert (=> mapIsEmpty!5303 mapRes!5303))

(declare-fun b!155817 () Bool)

(declare-fun e!101822 () Bool)

(declare-fun tp_is_empty!3107 () Bool)

(assert (=> b!155817 (= e!101822 tp_is_empty!3107)))

(declare-fun b!155818 () Bool)

(declare-fun e!101820 () Bool)

(assert (=> b!155818 (= e!101820 (and e!101822 mapRes!5303))))

(declare-fun condMapEmpty!5303 () Bool)

(declare-datatypes ((V!3789 0))(
  ( (V!3790 (val!1598 Int)) )
))
(declare-datatypes ((ValueCell!1210 0))(
  ( (ValueCellFull!1210 (v!3463 V!3789)) (EmptyCell!1210) )
))
(declare-datatypes ((array!5267 0))(
  ( (array!5268 (arr!2491 (Array (_ BitVec 32) (_ BitVec 64))) (size!2769 (_ BitVec 32))) )
))
(declare-datatypes ((array!5269 0))(
  ( (array!5270 (arr!2492 (Array (_ BitVec 32) ValueCell!1210)) (size!2770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1328 0))(
  ( (LongMapFixedSize!1329 (defaultEntry!3106 Int) (mask!7539 (_ BitVec 32)) (extraKeys!2847 (_ BitVec 32)) (zeroValue!2949 V!3789) (minValue!2949 V!3789) (_size!713 (_ BitVec 32)) (_keys!4881 array!5267) (_values!3089 array!5269) (_vacant!713 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1328)

(declare-fun mapDefault!5303 () ValueCell!1210)

