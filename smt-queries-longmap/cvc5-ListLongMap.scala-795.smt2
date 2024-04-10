; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18998 () Bool)

(assert start!18998)

(declare-fun b!187318 () Bool)

(declare-fun b_free!4609 () Bool)

(declare-fun b_next!4609 () Bool)

(assert (=> b!187318 (= b_free!4609 (not b_next!4609))))

(declare-fun tp!16639 () Bool)

(declare-fun b_and!11227 () Bool)

(assert (=> b!187318 (= tp!16639 b_and!11227)))

(declare-fun b!187316 () Bool)

(declare-fun e!123284 () Bool)

(declare-fun e!123287 () Bool)

(assert (=> b!187316 (= e!123284 e!123287)))

(declare-fun res!88578 () Bool)

(assert (=> b!187316 (=> (not res!88578) (not e!123287))))

(declare-datatypes ((V!5489 0))(
  ( (V!5490 (val!2235 Int)) )
))
(declare-datatypes ((ValueCell!1847 0))(
  ( (ValueCellFull!1847 (v!4150 V!5489)) (EmptyCell!1847) )
))
(declare-datatypes ((array!7979 0))(
  ( (array!7980 (arr!3765 (Array (_ BitVec 32) (_ BitVec 64))) (size!4083 (_ BitVec 32))) )
))
(declare-datatypes ((array!7981 0))(
  ( (array!7982 (arr!3766 (Array (_ BitVec 32) ValueCell!1847)) (size!4084 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2602 0))(
  ( (LongMapFixedSize!2603 (defaultEntry!3821 Int) (mask!8966 (_ BitVec 32)) (extraKeys!3558 (_ BitVec 32)) (zeroValue!3662 V!5489) (minValue!3662 V!5489) (_size!1350 (_ BitVec 32)) (_keys!5772 array!7979) (_values!3804 array!7981) (_vacant!1350 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2602)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187316 (= res!88578 (validMask!0 (mask!8966 thiss!1248)))))

(declare-datatypes ((Unit!5644 0))(
  ( (Unit!5645) )
))
(declare-fun lt!92669 () Unit!5644)

(declare-fun e!123279 () Unit!5644)

(assert (=> b!187316 (= lt!92669 e!123279)))

(declare-fun c!33627 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3476 0))(
  ( (tuple2!3477 (_1!1749 (_ BitVec 64)) (_2!1749 V!5489)) )
))
(declare-datatypes ((List!2381 0))(
  ( (Nil!2378) (Cons!2377 (h!3012 tuple2!3476) (t!7273 List!2381)) )
))
(declare-datatypes ((ListLongMap!2393 0))(
  ( (ListLongMap!2394 (toList!1212 List!2381)) )
))
(declare-fun contains!1312 (ListLongMap!2393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!860 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 32) Int) ListLongMap!2393)

(assert (=> b!187316 (= c!33627 (contains!1312 (getCurrentListMap!860 (_keys!5772 thiss!1248) (_values!3804 thiss!1248) (mask!8966 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) key!828))))

(declare-fun b!187317 () Bool)

(assert (=> b!187317 (= e!123287 (and (= (size!4084 (_values!3804 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8966 thiss!1248))) (= (size!4083 (_keys!5772 thiss!1248)) (size!4084 (_values!3804 thiss!1248))) (bvsge (mask!8966 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3558 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!4381 () Bool)

(declare-fun e!123280 () Bool)

(declare-fun e!123286 () Bool)

(declare-fun array_inv!2435 (array!7979) Bool)

(declare-fun array_inv!2436 (array!7981) Bool)

(assert (=> b!187318 (= e!123286 (and tp!16639 tp_is_empty!4381 (array_inv!2435 (_keys!5772 thiss!1248)) (array_inv!2436 (_values!3804 thiss!1248)) e!123280))))

(declare-fun res!88576 () Bool)

(declare-fun e!123283 () Bool)

(assert (=> start!18998 (=> (not res!88576) (not e!123283))))

(declare-fun valid!1070 (LongMapFixedSize!2602) Bool)

(assert (=> start!18998 (= res!88576 (valid!1070 thiss!1248))))

(assert (=> start!18998 e!123283))

(assert (=> start!18998 e!123286))

(assert (=> start!18998 true))

(declare-fun b!187319 () Bool)

(declare-fun e!123278 () Bool)

(assert (=> b!187319 (= e!123278 tp_is_empty!4381)))

(declare-fun b!187320 () Bool)

(declare-fun mapRes!7547 () Bool)

(assert (=> b!187320 (= e!123280 (and e!123278 mapRes!7547))))

(declare-fun condMapEmpty!7547 () Bool)

(declare-fun mapDefault!7547 () ValueCell!1847)

