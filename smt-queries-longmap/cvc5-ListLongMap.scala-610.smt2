; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15886 () Bool)

(assert start!15886)

(declare-fun b!158067 () Bool)

(declare-fun b_free!3469 () Bool)

(declare-fun b_next!3469 () Bool)

(assert (=> b!158067 (= b_free!3469 (not b_next!3469))))

(declare-fun tp!12952 () Bool)

(declare-fun b_and!9883 () Bool)

(assert (=> b!158067 (= tp!12952 b_and!9883)))

(declare-fun b!158062 () Bool)

(declare-fun e!103526 () Bool)

(declare-fun tp_is_empty!3271 () Bool)

(assert (=> b!158062 (= e!103526 tp_is_empty!3271)))

(declare-fun b!158063 () Bool)

(declare-fun e!103523 () Bool)

(assert (=> b!158063 (= e!103523 tp_is_empty!3271)))

(declare-fun b!158064 () Bool)

(declare-fun e!103525 () Bool)

(declare-datatypes ((V!4009 0))(
  ( (V!4010 (val!1680 Int)) )
))
(declare-datatypes ((ValueCell!1292 0))(
  ( (ValueCellFull!1292 (v!3545 V!4009)) (EmptyCell!1292) )
))
(declare-datatypes ((array!5607 0))(
  ( (array!5608 (arr!2655 (Array (_ BitVec 32) (_ BitVec 64))) (size!2936 (_ BitVec 32))) )
))
(declare-datatypes ((array!5609 0))(
  ( (array!5610 (arr!2656 (Array (_ BitVec 32) ValueCell!1292)) (size!2937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1492 0))(
  ( (LongMapFixedSize!1493 (defaultEntry!3188 Int) (mask!7691 (_ BitVec 32)) (extraKeys!2929 (_ BitVec 32)) (zeroValue!3031 V!4009) (minValue!3031 V!4009) (_size!795 (_ BitVec 32)) (_keys!4970 array!5607) (_values!3171 array!5609) (_vacant!795 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1492)

(assert (=> b!158064 (= e!103525 (and (= (size!2937 (_values!3171 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7691 thiss!1248))) (not (= (size!2936 (_keys!4970 thiss!1248)) (size!2937 (_values!3171 thiss!1248))))))))

(declare-fun b!158065 () Bool)

(declare-fun e!103522 () Bool)

(declare-fun mapRes!5570 () Bool)

(assert (=> b!158065 (= e!103522 (and e!103526 mapRes!5570))))

(declare-fun condMapEmpty!5570 () Bool)

(declare-fun mapDefault!5570 () ValueCell!1292)

