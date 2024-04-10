; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16904 () Bool)

(assert start!16904)

(declare-fun b!170117 () Bool)

(declare-fun b_free!4183 () Bool)

(declare-fun b_next!4183 () Bool)

(assert (=> b!170117 (= b_free!4183 (not b_next!4183))))

(declare-fun tp!15165 () Bool)

(declare-fun b_and!10597 () Bool)

(assert (=> b!170117 (= tp!15165 b_and!10597)))

(declare-fun b!170114 () Bool)

(declare-fun e!112222 () Bool)

(declare-datatypes ((V!4921 0))(
  ( (V!4922 (val!2022 Int)) )
))
(declare-datatypes ((ValueCell!1634 0))(
  ( (ValueCellFull!1634 (v!3887 V!4921)) (EmptyCell!1634) )
))
(declare-datatypes ((array!7015 0))(
  ( (array!7016 (arr!3339 (Array (_ BitVec 32) (_ BitVec 64))) (size!3630 (_ BitVec 32))) )
))
(declare-datatypes ((array!7017 0))(
  ( (array!7018 (arr!3340 (Array (_ BitVec 32) ValueCell!1634)) (size!3631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2176 0))(
  ( (LongMapFixedSize!2177 (defaultEntry!3530 Int) (mask!8334 (_ BitVec 32)) (extraKeys!3271 (_ BitVec 32)) (zeroValue!3373 V!4921) (minValue!3373 V!4921) (_size!1137 (_ BitVec 32)) (_keys!5358 array!7015) (_values!3513 array!7017) (_vacant!1137 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2176)

(assert (=> b!170114 (= e!112222 (and (= (size!3631 (_values!3513 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8334 thiss!1248))) (= (size!3630 (_keys!5358 thiss!1248)) (size!3631 (_values!3513 thiss!1248))) (bvsge (mask!8334 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3271 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170115 () Bool)

(declare-fun e!112226 () Bool)

(declare-fun e!112223 () Bool)

(declare-fun mapRes!6711 () Bool)

(assert (=> b!170115 (= e!112226 (and e!112223 mapRes!6711))))

(declare-fun condMapEmpty!6711 () Bool)

(declare-fun mapDefault!6711 () ValueCell!1634)

