; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22112 () Bool)

(assert start!22112)

(declare-fun b!230048 () Bool)

(declare-fun b_free!6179 () Bool)

(declare-fun b_next!6179 () Bool)

(assert (=> b!230048 (= b_free!6179 (not b_next!6179))))

(declare-fun tp!21679 () Bool)

(declare-fun b_and!13077 () Bool)

(assert (=> b!230048 (= tp!21679 b_and!13077)))

(declare-fun b!230040 () Bool)

(declare-fun e!149272 () Bool)

(declare-fun e!149264 () Bool)

(assert (=> b!230040 (= e!149272 e!149264)))

(declare-fun res!113183 () Bool)

(assert (=> b!230040 (=> (not res!113183) (not e!149264))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7701 0))(
  ( (V!7702 (val!3065 Int)) )
))
(declare-datatypes ((ValueCell!2677 0))(
  ( (ValueCellFull!2677 (v!5085 V!7701)) (EmptyCell!2677) )
))
(declare-datatypes ((array!11325 0))(
  ( (array!11326 (arr!5382 (Array (_ BitVec 32) ValueCell!2677)) (size!5715 (_ BitVec 32))) )
))
(declare-datatypes ((array!11327 0))(
  ( (array!11328 (arr!5383 (Array (_ BitVec 32) (_ BitVec 64))) (size!5716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3254 0))(
  ( (LongMapFixedSize!3255 (defaultEntry!4286 Int) (mask!10172 (_ BitVec 32)) (extraKeys!4023 (_ BitVec 32)) (zeroValue!4127 V!7701) (minValue!4127 V!7701) (_size!1676 (_ BitVec 32)) (_keys!6340 array!11327) (_values!4269 array!11325) (_vacant!1676 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3254)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230040 (= res!113183 (inRange!0 index!297 (mask!10172 thiss!1504)))))

(declare-datatypes ((Unit!7033 0))(
  ( (Unit!7034) )
))
(declare-fun lt!115743 () Unit!7033)

(declare-fun e!149269 () Unit!7033)

(assert (=> b!230040 (= lt!115743 e!149269)))

(declare-fun c!38171 () Bool)

(declare-datatypes ((tuple2!4522 0))(
  ( (tuple2!4523 (_1!2272 (_ BitVec 64)) (_2!2272 V!7701)) )
))
(declare-datatypes ((List!3446 0))(
  ( (Nil!3443) (Cons!3442 (h!4090 tuple2!4522) (t!8405 List!3446)) )
))
(declare-datatypes ((ListLongMap!3435 0))(
  ( (ListLongMap!3436 (toList!1733 List!3446)) )
))
(declare-fun lt!115740 () ListLongMap!3435)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1606 (ListLongMap!3435 (_ BitVec 64)) Bool)

(assert (=> b!230040 (= c!38171 (contains!1606 lt!115740 key!932))))

(declare-fun getCurrentListMap!1261 (array!11327 array!11325 (_ BitVec 32) (_ BitVec 32) V!7701 V!7701 (_ BitVec 32) Int) ListLongMap!3435)

(assert (=> b!230040 (= lt!115740 (getCurrentListMap!1261 (_keys!6340 thiss!1504) (_values!4269 thiss!1504) (mask!10172 thiss!1504) (extraKeys!4023 thiss!1504) (zeroValue!4127 thiss!1504) (minValue!4127 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4286 thiss!1504)))))

(declare-fun b!230041 () Bool)

(declare-fun res!113185 () Bool)

(declare-datatypes ((SeekEntryResult!931 0))(
  ( (MissingZero!931 (index!5894 (_ BitVec 32))) (Found!931 (index!5895 (_ BitVec 32))) (Intermediate!931 (undefined!1743 Bool) (index!5896 (_ BitVec 32)) (x!23415 (_ BitVec 32))) (Undefined!931) (MissingVacant!931 (index!5897 (_ BitVec 32))) )
))
(declare-fun lt!115738 () SeekEntryResult!931)

(assert (=> b!230041 (= res!113185 (= (select (arr!5383 (_keys!6340 thiss!1504)) (index!5897 lt!115738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149263 () Bool)

(assert (=> b!230041 (=> (not res!113185) (not e!149263))))

(declare-fun b!230042 () Bool)

(declare-fun e!149276 () Bool)

(declare-fun tp_is_empty!6041 () Bool)

(assert (=> b!230042 (= e!149276 tp_is_empty!6041)))

(declare-fun b!230043 () Bool)

(declare-fun e!149266 () Bool)

(declare-fun call!21371 () Bool)

(assert (=> b!230043 (= e!149266 (not call!21371))))

(declare-fun b!230044 () Bool)

(declare-fun e!149268 () Unit!7033)

(declare-fun Unit!7035 () Unit!7033)

(assert (=> b!230044 (= e!149268 Unit!7035)))

(declare-fun b!230045 () Bool)

(declare-fun e!149270 () Bool)

(declare-fun e!149274 () Bool)

(declare-fun mapRes!10231 () Bool)

(assert (=> b!230045 (= e!149270 (and e!149274 mapRes!10231))))

(declare-fun condMapEmpty!10231 () Bool)

(declare-fun mapDefault!10231 () ValueCell!2677)

