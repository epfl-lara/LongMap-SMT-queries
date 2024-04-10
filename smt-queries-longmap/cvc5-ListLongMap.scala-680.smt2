; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16584 () Bool)

(assert start!16584)

(declare-fun b!165309 () Bool)

(declare-fun b_free!3889 () Bool)

(declare-fun b_next!3889 () Bool)

(assert (=> b!165309 (= b_free!3889 (not b_next!3889))))

(declare-fun tp!14268 () Bool)

(declare-fun b_and!10303 () Bool)

(assert (=> b!165309 (= tp!14268 b_and!10303)))

(declare-fun b!165305 () Bool)

(declare-fun res!78407 () Bool)

(declare-fun e!108438 () Bool)

(assert (=> b!165305 (=> (not res!78407) (not e!108438))))

(declare-datatypes ((V!4569 0))(
  ( (V!4570 (val!1890 Int)) )
))
(declare-datatypes ((ValueCell!1502 0))(
  ( (ValueCellFull!1502 (v!3755 V!4569)) (EmptyCell!1502) )
))
(declare-datatypes ((array!6479 0))(
  ( (array!6480 (arr!3075 (Array (_ BitVec 32) (_ BitVec 64))) (size!3363 (_ BitVec 32))) )
))
(declare-datatypes ((array!6481 0))(
  ( (array!6482 (arr!3076 (Array (_ BitVec 32) ValueCell!1502)) (size!3364 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1912 0))(
  ( (LongMapFixedSize!1913 (defaultEntry!3398 Int) (mask!8107 (_ BitVec 32)) (extraKeys!3139 (_ BitVec 32)) (zeroValue!3241 V!4569) (minValue!3241 V!4569) (_size!1005 (_ BitVec 32)) (_keys!5223 array!6479) (_values!3381 array!6481) (_vacant!1005 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1912)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3062 0))(
  ( (tuple2!3063 (_1!1542 (_ BitVec 64)) (_2!1542 V!4569)) )
))
(declare-datatypes ((List!2045 0))(
  ( (Nil!2042) (Cons!2041 (h!2658 tuple2!3062) (t!6847 List!2045)) )
))
(declare-datatypes ((ListLongMap!2017 0))(
  ( (ListLongMap!2018 (toList!1024 List!2045)) )
))
(declare-fun contains!1066 (ListLongMap!2017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!682 (array!6479 array!6481 (_ BitVec 32) (_ BitVec 32) V!4569 V!4569 (_ BitVec 32) Int) ListLongMap!2017)

(assert (=> b!165305 (= res!78407 (not (contains!1066 (getCurrentListMap!682 (_keys!5223 thiss!1248) (_values!3381 thiss!1248) (mask!8107 thiss!1248) (extraKeys!3139 thiss!1248) (zeroValue!3241 thiss!1248) (minValue!3241 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3398 thiss!1248)) key!828)))))

(declare-fun b!165306 () Bool)

(declare-fun e!108443 () Bool)

(assert (=> b!165306 (= e!108443 e!108438)))

(declare-fun res!78406 () Bool)

(assert (=> b!165306 (=> (not res!78406) (not e!108438))))

(declare-datatypes ((SeekEntryResult!433 0))(
  ( (MissingZero!433 (index!3900 (_ BitVec 32))) (Found!433 (index!3901 (_ BitVec 32))) (Intermediate!433 (undefined!1245 Bool) (index!3902 (_ BitVec 32)) (x!18325 (_ BitVec 32))) (Undefined!433) (MissingVacant!433 (index!3903 (_ BitVec 32))) )
))
(declare-fun lt!83046 () SeekEntryResult!433)

(assert (=> b!165306 (= res!78406 (and (not (is-Undefined!433 lt!83046)) (not (is-MissingVacant!433 lt!83046)) (not (is-MissingZero!433 lt!83046)) (is-Found!433 lt!83046)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6479 (_ BitVec 32)) SeekEntryResult!433)

(assert (=> b!165306 (= lt!83046 (seekEntryOrOpen!0 key!828 (_keys!5223 thiss!1248) (mask!8107 thiss!1248)))))

(declare-fun mapIsEmpty!6255 () Bool)

(declare-fun mapRes!6255 () Bool)

(assert (=> mapIsEmpty!6255 mapRes!6255))

(declare-fun b!165307 () Bool)

(declare-fun e!108441 () Bool)

(declare-fun tp_is_empty!3691 () Bool)

(assert (=> b!165307 (= e!108441 tp_is_empty!3691)))

(declare-fun b!165308 () Bool)

(declare-fun res!78411 () Bool)

(assert (=> b!165308 (=> (not res!78411) (not e!108438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165308 (= res!78411 (validMask!0 (mask!8107 thiss!1248)))))

(declare-fun e!108442 () Bool)

(declare-fun e!108439 () Bool)

(declare-fun array_inv!1973 (array!6479) Bool)

(declare-fun array_inv!1974 (array!6481) Bool)

(assert (=> b!165309 (= e!108442 (and tp!14268 tp_is_empty!3691 (array_inv!1973 (_keys!5223 thiss!1248)) (array_inv!1974 (_values!3381 thiss!1248)) e!108439))))

(declare-fun b!165310 () Bool)

(declare-fun res!78410 () Bool)

(assert (=> b!165310 (=> (not res!78410) (not e!108438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6479 (_ BitVec 32)) Bool)

(assert (=> b!165310 (= res!78410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5223 thiss!1248) (mask!8107 thiss!1248)))))

(declare-fun b!165311 () Bool)

(assert (=> b!165311 (= e!108438 false)))

(declare-fun lt!83047 () Bool)

(declare-datatypes ((List!2046 0))(
  ( (Nil!2043) (Cons!2042 (h!2659 (_ BitVec 64)) (t!6848 List!2046)) )
))
(declare-fun arrayNoDuplicates!0 (array!6479 (_ BitVec 32) List!2046) Bool)

(assert (=> b!165311 (= lt!83047 (arrayNoDuplicates!0 (_keys!5223 thiss!1248) #b00000000000000000000000000000000 Nil!2043))))

(declare-fun b!165312 () Bool)

(declare-fun res!78405 () Bool)

(assert (=> b!165312 (=> (not res!78405) (not e!108443))))

(assert (=> b!165312 (= res!78405 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78409 () Bool)

(assert (=> start!16584 (=> (not res!78409) (not e!108443))))

(declare-fun valid!846 (LongMapFixedSize!1912) Bool)

(assert (=> start!16584 (= res!78409 (valid!846 thiss!1248))))

(assert (=> start!16584 e!108443))

(assert (=> start!16584 e!108442))

(assert (=> start!16584 true))

(declare-fun b!165313 () Bool)

(declare-fun e!108440 () Bool)

(assert (=> b!165313 (= e!108440 tp_is_empty!3691)))

(declare-fun mapNonEmpty!6255 () Bool)

(declare-fun tp!14267 () Bool)

(assert (=> mapNonEmpty!6255 (= mapRes!6255 (and tp!14267 e!108441))))

(declare-fun mapRest!6255 () (Array (_ BitVec 32) ValueCell!1502))

(declare-fun mapKey!6255 () (_ BitVec 32))

(declare-fun mapValue!6255 () ValueCell!1502)

(assert (=> mapNonEmpty!6255 (= (arr!3076 (_values!3381 thiss!1248)) (store mapRest!6255 mapKey!6255 mapValue!6255))))

(declare-fun b!165314 () Bool)

(declare-fun res!78408 () Bool)

(assert (=> b!165314 (=> (not res!78408) (not e!108438))))

(assert (=> b!165314 (= res!78408 (and (= (size!3364 (_values!3381 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8107 thiss!1248))) (= (size!3363 (_keys!5223 thiss!1248)) (size!3364 (_values!3381 thiss!1248))) (bvsge (mask!8107 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3139 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3139 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165315 () Bool)

(assert (=> b!165315 (= e!108439 (and e!108440 mapRes!6255))))

(declare-fun condMapEmpty!6255 () Bool)

(declare-fun mapDefault!6255 () ValueCell!1502)

