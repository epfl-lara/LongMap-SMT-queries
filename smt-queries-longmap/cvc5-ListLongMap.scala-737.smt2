; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17182 () Bool)

(assert start!17182)

(declare-fun b!172523 () Bool)

(declare-fun b_free!4261 () Bool)

(declare-fun b_next!4261 () Bool)

(assert (=> b!172523 (= b_free!4261 (not b_next!4261))))

(declare-fun tp!15432 () Bool)

(declare-fun b_and!10701 () Bool)

(assert (=> b!172523 (= tp!15432 b_and!10701)))

(declare-fun mapNonEmpty!6862 () Bool)

(declare-fun mapRes!6862 () Bool)

(declare-fun tp!15433 () Bool)

(declare-fun e!113888 () Bool)

(assert (=> mapNonEmpty!6862 (= mapRes!6862 (and tp!15433 e!113888))))

(declare-datatypes ((V!5025 0))(
  ( (V!5026 (val!2061 Int)) )
))
(declare-datatypes ((ValueCell!1673 0))(
  ( (ValueCellFull!1673 (v!3929 V!5025)) (EmptyCell!1673) )
))
(declare-fun mapRest!6862 () (Array (_ BitVec 32) ValueCell!1673))

(declare-fun mapValue!6862 () ValueCell!1673)

(declare-fun mapKey!6862 () (_ BitVec 32))

(declare-datatypes ((array!7189 0))(
  ( (array!7190 (arr!3417 (Array (_ BitVec 32) (_ BitVec 64))) (size!3714 (_ BitVec 32))) )
))
(declare-datatypes ((array!7191 0))(
  ( (array!7192 (arr!3418 (Array (_ BitVec 32) ValueCell!1673)) (size!3715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2254 0))(
  ( (LongMapFixedSize!2255 (defaultEntry!3573 Int) (mask!8421 (_ BitVec 32)) (extraKeys!3312 (_ BitVec 32)) (zeroValue!3414 V!5025) (minValue!3416 V!5025) (_size!1176 (_ BitVec 32)) (_keys!5410 array!7189) (_values!3556 array!7191) (_vacant!1176 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2254)

(assert (=> mapNonEmpty!6862 (= (arr!3418 (_values!3556 thiss!1248)) (store mapRest!6862 mapKey!6862 mapValue!6862))))

(declare-fun b!172519 () Bool)

(declare-fun e!113886 () Bool)

(declare-fun e!113887 () Bool)

(assert (=> b!172519 (= e!113886 (and e!113887 mapRes!6862))))

(declare-fun condMapEmpty!6862 () Bool)

(declare-fun mapDefault!6862 () ValueCell!1673)

