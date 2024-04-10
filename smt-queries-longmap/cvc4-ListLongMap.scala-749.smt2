; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17516 () Bool)

(assert start!17516)

(declare-fun b!175472 () Bool)

(declare-fun b_free!4337 () Bool)

(declare-fun b_next!4337 () Bool)

(assert (=> b!175472 (= b_free!4337 (not b_next!4337))))

(declare-fun tp!15691 () Bool)

(declare-fun b_and!10817 () Bool)

(assert (=> b!175472 (= tp!15691 b_and!10817)))

(declare-fun b!175465 () Bool)

(declare-fun res!83188 () Bool)

(declare-fun e!115825 () Bool)

(assert (=> b!175465 (=> (not res!83188) (not e!115825))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!175465 (= res!83188 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7006 () Bool)

(declare-fun mapRes!7006 () Bool)

(assert (=> mapIsEmpty!7006 mapRes!7006))

(declare-fun mapNonEmpty!7006 () Bool)

(declare-fun tp!15690 () Bool)

(declare-fun e!115824 () Bool)

(assert (=> mapNonEmpty!7006 (= mapRes!7006 (and tp!15690 e!115824))))

(declare-datatypes ((V!5125 0))(
  ( (V!5126 (val!2099 Int)) )
))
(declare-datatypes ((ValueCell!1711 0))(
  ( (ValueCellFull!1711 (v!3973 V!5125)) (EmptyCell!1711) )
))
(declare-fun mapRest!7006 () (Array (_ BitVec 32) ValueCell!1711))

(declare-datatypes ((array!7357 0))(
  ( (array!7358 (arr!3493 (Array (_ BitVec 32) (_ BitVec 64))) (size!3795 (_ BitVec 32))) )
))
(declare-datatypes ((array!7359 0))(
  ( (array!7360 (arr!3494 (Array (_ BitVec 32) ValueCell!1711)) (size!3796 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2330 0))(
  ( (LongMapFixedSize!2331 (defaultEntry!3620 Int) (mask!8517 (_ BitVec 32)) (extraKeys!3357 (_ BitVec 32)) (zeroValue!3461 V!5125) (minValue!3461 V!5125) (_size!1214 (_ BitVec 32)) (_keys!5472 array!7357) (_values!3603 array!7359) (_vacant!1214 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2330)

(declare-fun mapValue!7006 () ValueCell!1711)

(declare-fun mapKey!7006 () (_ BitVec 32))

(assert (=> mapNonEmpty!7006 (= (arr!3494 (_values!3603 thiss!1248)) (store mapRest!7006 mapKey!7006 mapValue!7006))))

(declare-fun b!175466 () Bool)

(assert (=> b!175466 (= e!115825 (and (= (size!3796 (_values!3603 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8517 thiss!1248))) (= (size!3795 (_keys!5472 thiss!1248)) (size!3796 (_values!3603 thiss!1248))) (bvslt (mask!8517 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175467 () Bool)

(declare-fun res!83191 () Bool)

(assert (=> b!175467 (=> (not res!83191) (not e!115825))))

(declare-datatypes ((tuple2!3264 0))(
  ( (tuple2!3265 (_1!1643 (_ BitVec 64)) (_2!1643 V!5125)) )
))
(declare-datatypes ((List!2222 0))(
  ( (Nil!2219) (Cons!2218 (h!2837 tuple2!3264) (t!7040 List!2222)) )
))
(declare-datatypes ((ListLongMap!2191 0))(
  ( (ListLongMap!2192 (toList!1111 List!2222)) )
))
(declare-fun contains!1171 (ListLongMap!2191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!763 (array!7357 array!7359 (_ BitVec 32) (_ BitVec 32) V!5125 V!5125 (_ BitVec 32) Int) ListLongMap!2191)

(assert (=> b!175467 (= res!83191 (contains!1171 (getCurrentListMap!763 (_keys!5472 thiss!1248) (_values!3603 thiss!1248) (mask!8517 thiss!1248) (extraKeys!3357 thiss!1248) (zeroValue!3461 thiss!1248) (minValue!3461 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3620 thiss!1248)) key!828))))

(declare-fun b!175469 () Bool)

(declare-fun e!115821 () Bool)

(declare-fun e!115822 () Bool)

(assert (=> b!175469 (= e!115821 (and e!115822 mapRes!7006))))

(declare-fun condMapEmpty!7006 () Bool)

(declare-fun mapDefault!7006 () ValueCell!1711)

