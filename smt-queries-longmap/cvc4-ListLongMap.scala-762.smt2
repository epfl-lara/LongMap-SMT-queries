; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17940 () Bool)

(assert start!17940)

(declare-fun b!178817 () Bool)

(declare-fun b_free!4415 () Bool)

(declare-fun b_next!4415 () Bool)

(assert (=> b!178817 (= b_free!4415 (not b_next!4415))))

(declare-fun tp!15962 () Bool)

(declare-fun b_and!10937 () Bool)

(assert (=> b!178817 (= tp!15962 b_and!10937)))

(declare-fun e!117851 () Bool)

(declare-fun tp_is_empty!4187 () Bool)

(declare-fun e!117847 () Bool)

(declare-datatypes ((V!5229 0))(
  ( (V!5230 (val!2138 Int)) )
))
(declare-datatypes ((ValueCell!1750 0))(
  ( (ValueCellFull!1750 (v!4023 V!5229)) (EmptyCell!1750) )
))
(declare-datatypes ((array!7535 0))(
  ( (array!7536 (arr!3571 (Array (_ BitVec 32) (_ BitVec 64))) (size!3878 (_ BitVec 32))) )
))
(declare-datatypes ((array!7537 0))(
  ( (array!7538 (arr!3572 (Array (_ BitVec 32) ValueCell!1750)) (size!3879 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2408 0))(
  ( (LongMapFixedSize!2409 (defaultEntry!3675 Int) (mask!8643 (_ BitVec 32)) (extraKeys!3412 (_ BitVec 32)) (zeroValue!3516 V!5229) (minValue!3516 V!5229) (_size!1253 (_ BitVec 32)) (_keys!5556 array!7535) (_values!3658 array!7537) (_vacant!1253 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2408)

(declare-fun array_inv!2297 (array!7535) Bool)

(declare-fun array_inv!2298 (array!7537) Bool)

(assert (=> b!178817 (= e!117851 (and tp!15962 tp_is_empty!4187 (array_inv!2297 (_keys!5556 thiss!1248)) (array_inv!2298 (_values!3658 thiss!1248)) e!117847))))

(declare-fun mapIsEmpty!7161 () Bool)

(declare-fun mapRes!7161 () Bool)

(assert (=> mapIsEmpty!7161 mapRes!7161))

(declare-fun b!178818 () Bool)

(declare-fun e!117849 () Bool)

(assert (=> b!178818 (= e!117847 (and e!117849 mapRes!7161))))

(declare-fun condMapEmpty!7161 () Bool)

(declare-fun mapDefault!7161 () ValueCell!1750)

