; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22772 () Bool)

(assert start!22772)

(declare-fun b!237458 () Bool)

(declare-fun b_free!6379 () Bool)

(declare-fun b_next!6379 () Bool)

(assert (=> b!237458 (= b_free!6379 (not b_next!6379))))

(declare-fun tp!22328 () Bool)

(declare-fun b_and!13333 () Bool)

(assert (=> b!237458 (= tp!22328 b_and!13333)))

(declare-fun res!116378 () Bool)

(declare-fun e!154197 () Bool)

(assert (=> start!22772 (=> (not res!116378) (not e!154197))))

(declare-datatypes ((V!7969 0))(
  ( (V!7970 (val!3165 Int)) )
))
(declare-datatypes ((ValueCell!2777 0))(
  ( (ValueCellFull!2777 (v!5199 V!7969)) (EmptyCell!2777) )
))
(declare-datatypes ((array!11753 0))(
  ( (array!11754 (arr!5582 (Array (_ BitVec 32) ValueCell!2777)) (size!5922 (_ BitVec 32))) )
))
(declare-datatypes ((array!11755 0))(
  ( (array!11756 (arr!5583 (Array (_ BitVec 32) (_ BitVec 64))) (size!5923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3454 0))(
  ( (LongMapFixedSize!3455 (defaultEntry!4407 Int) (mask!10420 (_ BitVec 32)) (extraKeys!4144 (_ BitVec 32)) (zeroValue!4248 V!7969) (minValue!4248 V!7969) (_size!1776 (_ BitVec 32)) (_keys!6499 array!11755) (_values!4390 array!11753) (_vacant!1776 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3454)

(declare-fun valid!1363 (LongMapFixedSize!3454) Bool)

(assert (=> start!22772 (= res!116378 (valid!1363 thiss!1504))))

(assert (=> start!22772 e!154197))

(declare-fun e!154195 () Bool)

(assert (=> start!22772 e!154195))

(assert (=> start!22772 true))

(declare-fun b!237452 () Bool)

(declare-fun res!116377 () Bool)

(declare-fun e!154199 () Bool)

(assert (=> b!237452 (=> (not res!116377) (not e!154199))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4664 0))(
  ( (tuple2!4665 (_1!2343 (_ BitVec 64)) (_2!2343 V!7969)) )
))
(declare-datatypes ((List!3565 0))(
  ( (Nil!3562) (Cons!3561 (h!4216 tuple2!4664) (t!8552 List!3565)) )
))
(declare-datatypes ((ListLongMap!3577 0))(
  ( (ListLongMap!3578 (toList!1804 List!3565)) )
))
(declare-fun contains!1688 (ListLongMap!3577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1332 (array!11755 array!11753 (_ BitVec 32) (_ BitVec 32) V!7969 V!7969 (_ BitVec 32) Int) ListLongMap!3577)

(assert (=> b!237452 (= res!116377 (not (contains!1688 (getCurrentListMap!1332 (_keys!6499 thiss!1504) (_values!4390 thiss!1504) (mask!10420 thiss!1504) (extraKeys!4144 thiss!1504) (zeroValue!4248 thiss!1504) (minValue!4248 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4407 thiss!1504)) key!932)))))

(declare-fun b!237453 () Bool)

(assert (=> b!237453 (= e!154199 (and (= (size!5922 (_values!4390 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10420 thiss!1504))) (= (size!5923 (_keys!6499 thiss!1504)) (size!5922 (_values!4390 thiss!1504))) (bvsge (mask!10420 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4144 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4144 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237454 () Bool)

(declare-fun e!154196 () Bool)

(declare-fun tp_is_empty!6241 () Bool)

(assert (=> b!237454 (= e!154196 tp_is_empty!6241)))

(declare-fun b!237455 () Bool)

(declare-fun res!116376 () Bool)

(assert (=> b!237455 (=> (not res!116376) (not e!154199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237455 (= res!116376 (validMask!0 (mask!10420 thiss!1504)))))

(declare-fun b!237456 () Bool)

(declare-fun e!154198 () Bool)

(assert (=> b!237456 (= e!154198 tp_is_empty!6241)))

(declare-fun mapNonEmpty!10580 () Bool)

(declare-fun mapRes!10580 () Bool)

(declare-fun tp!22327 () Bool)

(assert (=> mapNonEmpty!10580 (= mapRes!10580 (and tp!22327 e!154198))))

(declare-fun mapKey!10580 () (_ BitVec 32))

(declare-fun mapRest!10580 () (Array (_ BitVec 32) ValueCell!2777))

(declare-fun mapValue!10580 () ValueCell!2777)

(assert (=> mapNonEmpty!10580 (= (arr!5582 (_values!4390 thiss!1504)) (store mapRest!10580 mapKey!10580 mapValue!10580))))

(declare-fun b!237457 () Bool)

(declare-fun res!116379 () Bool)

(assert (=> b!237457 (=> (not res!116379) (not e!154197))))

(assert (=> b!237457 (= res!116379 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!154200 () Bool)

(declare-fun array_inv!3685 (array!11755) Bool)

(declare-fun array_inv!3686 (array!11753) Bool)

(assert (=> b!237458 (= e!154195 (and tp!22328 tp_is_empty!6241 (array_inv!3685 (_keys!6499 thiss!1504)) (array_inv!3686 (_values!4390 thiss!1504)) e!154200))))

(declare-fun b!237459 () Bool)

(assert (=> b!237459 (= e!154200 (and e!154196 mapRes!10580))))

(declare-fun condMapEmpty!10580 () Bool)

(declare-fun mapDefault!10580 () ValueCell!2777)

