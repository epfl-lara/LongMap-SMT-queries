; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17244 () Bool)

(assert start!17244)

(declare-fun b!172980 () Bool)

(declare-fun b_free!4291 () Bool)

(declare-fun b_next!4291 () Bool)

(assert (=> b!172980 (= b_free!4291 (not b_next!4291))))

(declare-fun tp!15530 () Bool)

(declare-fun b_and!10731 () Bool)

(assert (=> b!172980 (= tp!15530 b_and!10731)))

(declare-fun b!172974 () Bool)

(declare-fun e!114242 () Bool)

(declare-datatypes ((V!5065 0))(
  ( (V!5066 (val!2076 Int)) )
))
(declare-datatypes ((ValueCell!1688 0))(
  ( (ValueCellFull!1688 (v!3944 V!5065)) (EmptyCell!1688) )
))
(declare-datatypes ((array!7253 0))(
  ( (array!7254 (arr!3447 (Array (_ BitVec 32) (_ BitVec 64))) (size!3746 (_ BitVec 32))) )
))
(declare-datatypes ((array!7255 0))(
  ( (array!7256 (arr!3448 (Array (_ BitVec 32) ValueCell!1688)) (size!3747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2284 0))(
  ( (LongMapFixedSize!2285 (defaultEntry!3588 Int) (mask!8450 (_ BitVec 32)) (extraKeys!3327 (_ BitVec 32)) (zeroValue!3429 V!5065) (minValue!3431 V!5065) (_size!1191 (_ BitVec 32)) (_keys!5427 array!7253) (_values!3571 array!7255) (_vacant!1191 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2284)

(assert (=> b!172974 (= e!114242 (and (= (size!3747 (_values!3571 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8450 thiss!1248))) (= (size!3746 (_keys!5427 thiss!1248)) (size!3747 (_values!3571 thiss!1248))) (bvsge (mask!8450 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3327 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3327 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3327 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (= (bvand (bvor (extraKeys!3327 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!172975 () Bool)

(declare-fun e!114239 () Bool)

(declare-fun e!114241 () Bool)

(declare-fun mapRes!6915 () Bool)

(assert (=> b!172975 (= e!114239 (and e!114241 mapRes!6915))))

(declare-fun condMapEmpty!6915 () Bool)

(declare-fun mapDefault!6915 () ValueCell!1688)

