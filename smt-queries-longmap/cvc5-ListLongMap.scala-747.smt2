; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17400 () Bool)

(assert start!17400)

(declare-fun b!174642 () Bool)

(declare-fun b_free!4321 () Bool)

(declare-fun b_next!4321 () Bool)

(assert (=> b!174642 (= b_free!4321 (not b_next!4321))))

(declare-fun tp!15634 () Bool)

(declare-fun b_and!10789 () Bool)

(assert (=> b!174642 (= tp!15634 b_and!10789)))

(declare-fun mapIsEmpty!6974 () Bool)

(declare-fun mapRes!6974 () Bool)

(assert (=> mapIsEmpty!6974 mapRes!6974))

(declare-fun b!174639 () Bool)

(declare-fun res!82826 () Bool)

(declare-fun e!115322 () Bool)

(assert (=> b!174639 (=> (not res!82826) (not e!115322))))

(declare-datatypes ((V!5105 0))(
  ( (V!5106 (val!2091 Int)) )
))
(declare-datatypes ((ValueCell!1703 0))(
  ( (ValueCellFull!1703 (v!3963 V!5105)) (EmptyCell!1703) )
))
(declare-datatypes ((array!7321 0))(
  ( (array!7322 (arr!3477 (Array (_ BitVec 32) (_ BitVec 64))) (size!3777 (_ BitVec 32))) )
))
(declare-datatypes ((array!7323 0))(
  ( (array!7324 (arr!3478 (Array (_ BitVec 32) ValueCell!1703)) (size!3778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2314 0))(
  ( (LongMapFixedSize!2315 (defaultEntry!3608 Int) (mask!8489 (_ BitVec 32)) (extraKeys!3345 (_ BitVec 32)) (zeroValue!3449 V!5105) (minValue!3449 V!5105) (_size!1206 (_ BitVec 32)) (_keys!5452 array!7321) (_values!3591 array!7323) (_vacant!1206 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2314)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3250 0))(
  ( (tuple2!3251 (_1!1636 (_ BitVec 64)) (_2!1636 V!5105)) )
))
(declare-datatypes ((List!2213 0))(
  ( (Nil!2210) (Cons!2209 (h!2826 tuple2!3250) (t!7027 List!2213)) )
))
(declare-datatypes ((ListLongMap!2177 0))(
  ( (ListLongMap!2178 (toList!1104 List!2213)) )
))
(declare-fun contains!1160 (ListLongMap!2177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!756 (array!7321 array!7323 (_ BitVec 32) (_ BitVec 32) V!5105 V!5105 (_ BitVec 32) Int) ListLongMap!2177)

(assert (=> b!174639 (= res!82826 (contains!1160 (getCurrentListMap!756 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) key!828))))

(declare-fun b!174640 () Bool)

(declare-fun e!115320 () Bool)

(declare-fun e!115323 () Bool)

(assert (=> b!174640 (= e!115320 (and e!115323 mapRes!6974))))

(declare-fun condMapEmpty!6974 () Bool)

(declare-fun mapDefault!6974 () ValueCell!1703)

