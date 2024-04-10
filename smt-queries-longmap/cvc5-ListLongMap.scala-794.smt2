; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18972 () Bool)

(assert start!18972)

(declare-fun b!187080 () Bool)

(declare-fun b_free!4603 () Bool)

(declare-fun b_next!4603 () Bool)

(assert (=> b!187080 (= b_free!4603 (not b_next!4603))))

(declare-fun tp!16618 () Bool)

(declare-fun b_and!11219 () Bool)

(assert (=> b!187080 (= tp!16618 b_and!11219)))

(declare-fun b!187078 () Bool)

(declare-datatypes ((Unit!5633 0))(
  ( (Unit!5634) )
))
(declare-fun e!123111 () Unit!5633)

(declare-fun Unit!5635 () Unit!5633)

(assert (=> b!187078 (= e!123111 Unit!5635)))

(declare-fun lt!92533 () Unit!5633)

(declare-datatypes ((V!5481 0))(
  ( (V!5482 (val!2232 Int)) )
))
(declare-datatypes ((ValueCell!1844 0))(
  ( (ValueCellFull!1844 (v!4146 V!5481)) (EmptyCell!1844) )
))
(declare-datatypes ((array!7965 0))(
  ( (array!7966 (arr!3759 (Array (_ BitVec 32) (_ BitVec 64))) (size!4077 (_ BitVec 32))) )
))
(declare-datatypes ((array!7967 0))(
  ( (array!7968 (arr!3760 (Array (_ BitVec 32) ValueCell!1844)) (size!4078 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2596 0))(
  ( (LongMapFixedSize!2597 (defaultEntry!3815 Int) (mask!8955 (_ BitVec 32)) (extraKeys!3552 (_ BitVec 32)) (zeroValue!3656 V!5481) (minValue!3656 V!5481) (_size!1347 (_ BitVec 32)) (_keys!5765 array!7965) (_values!3798 array!7967) (_vacant!1347 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2596)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!150 (array!7965 array!7967 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5633)

(assert (=> b!187078 (= lt!92533 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!150 (_keys!5765 thiss!1248) (_values!3798 thiss!1248) (mask!8955 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> b!187078 false))

(declare-fun tp_is_empty!4375 () Bool)

(declare-fun e!123115 () Bool)

(declare-fun e!123112 () Bool)

(declare-fun array_inv!2431 (array!7965) Bool)

(declare-fun array_inv!2432 (array!7967) Bool)

(assert (=> b!187080 (= e!123112 (and tp!16618 tp_is_empty!4375 (array_inv!2431 (_keys!5765 thiss!1248)) (array_inv!2432 (_values!3798 thiss!1248)) e!123115))))

(declare-fun b!187081 () Bool)

(declare-fun e!123114 () Bool)

(declare-fun mapRes!7535 () Bool)

(assert (=> b!187081 (= e!123115 (and e!123114 mapRes!7535))))

(declare-fun condMapEmpty!7535 () Bool)

(declare-fun mapDefault!7535 () ValueCell!1844)

