; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16588 () Bool)

(assert start!16588)

(declare-fun b!165357 () Bool)

(declare-fun b_free!3889 () Bool)

(declare-fun b_next!3889 () Bool)

(assert (=> b!165357 (= b_free!3889 (not b_next!3889))))

(declare-fun tp!14268 () Bool)

(declare-fun b_and!10317 () Bool)

(assert (=> b!165357 (= tp!14268 b_and!10317)))

(declare-fun b!165352 () Bool)

(declare-fun e!108466 () Bool)

(declare-fun tp_is_empty!3691 () Bool)

(assert (=> b!165352 (= e!108466 tp_is_empty!3691)))

(declare-fun b!165353 () Bool)

(declare-fun e!108461 () Bool)

(declare-fun e!108462 () Bool)

(assert (=> b!165353 (= e!108461 e!108462)))

(declare-fun res!78427 () Bool)

(assert (=> b!165353 (=> (not res!78427) (not e!108462))))

(declare-datatypes ((SeekEntryResult!429 0))(
  ( (MissingZero!429 (index!3884 (_ BitVec 32))) (Found!429 (index!3885 (_ BitVec 32))) (Intermediate!429 (undefined!1241 Bool) (index!3886 (_ BitVec 32)) (x!18321 (_ BitVec 32))) (Undefined!429) (MissingVacant!429 (index!3887 (_ BitVec 32))) )
))
(declare-fun lt!83105 () SeekEntryResult!429)

(get-info :version)

(assert (=> b!165353 (= res!78427 (and (not ((_ is Undefined!429) lt!83105)) (not ((_ is MissingVacant!429) lt!83105)) (not ((_ is MissingZero!429) lt!83105)) ((_ is Found!429) lt!83105)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4569 0))(
  ( (V!4570 (val!1890 Int)) )
))
(declare-datatypes ((ValueCell!1502 0))(
  ( (ValueCellFull!1502 (v!3756 V!4569)) (EmptyCell!1502) )
))
(declare-datatypes ((array!6465 0))(
  ( (array!6466 (arr!3068 (Array (_ BitVec 32) (_ BitVec 64))) (size!3356 (_ BitVec 32))) )
))
(declare-datatypes ((array!6467 0))(
  ( (array!6468 (arr!3069 (Array (_ BitVec 32) ValueCell!1502)) (size!3357 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1912 0))(
  ( (LongMapFixedSize!1913 (defaultEntry!3398 Int) (mask!8107 (_ BitVec 32)) (extraKeys!3139 (_ BitVec 32)) (zeroValue!3241 V!4569) (minValue!3241 V!4569) (_size!1005 (_ BitVec 32)) (_keys!5223 array!6465) (_values!3381 array!6467) (_vacant!1005 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1912)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6465 (_ BitVec 32)) SeekEntryResult!429)

(assert (=> b!165353 (= lt!83105 (seekEntryOrOpen!0 key!828 (_keys!5223 thiss!1248) (mask!8107 thiss!1248)))))

(declare-fun b!165354 () Bool)

(declare-fun res!78432 () Bool)

(assert (=> b!165354 (=> (not res!78432) (not e!108462))))

(assert (=> b!165354 (= res!78432 (and (= (size!3357 (_values!3381 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8107 thiss!1248))) (= (size!3356 (_keys!5223 thiss!1248)) (size!3357 (_values!3381 thiss!1248))) (bvsge (mask!8107 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3139 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3139 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165355 () Bool)

(assert (=> b!165355 (= e!108462 false)))

(declare-fun lt!83106 () Bool)

(declare-datatypes ((List!2035 0))(
  ( (Nil!2032) (Cons!2031 (h!2648 (_ BitVec 64)) (t!6829 List!2035)) )
))
(declare-fun arrayNoDuplicates!0 (array!6465 (_ BitVec 32) List!2035) Bool)

(assert (=> b!165355 (= lt!83106 (arrayNoDuplicates!0 (_keys!5223 thiss!1248) #b00000000000000000000000000000000 Nil!2032))))

(declare-fun mapNonEmpty!6255 () Bool)

(declare-fun mapRes!6255 () Bool)

(declare-fun tp!14267 () Bool)

(assert (=> mapNonEmpty!6255 (= mapRes!6255 (and tp!14267 e!108466))))

(declare-fun mapRest!6255 () (Array (_ BitVec 32) ValueCell!1502))

(declare-fun mapValue!6255 () ValueCell!1502)

(declare-fun mapKey!6255 () (_ BitVec 32))

(assert (=> mapNonEmpty!6255 (= (arr!3069 (_values!3381 thiss!1248)) (store mapRest!6255 mapKey!6255 mapValue!6255))))

(declare-fun b!165356 () Bool)

(declare-fun res!78431 () Bool)

(assert (=> b!165356 (=> (not res!78431) (not e!108462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6465 (_ BitVec 32)) Bool)

(assert (=> b!165356 (= res!78431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5223 thiss!1248) (mask!8107 thiss!1248)))))

(declare-fun e!108463 () Bool)

(declare-fun e!108464 () Bool)

(declare-fun array_inv!1971 (array!6465) Bool)

(declare-fun array_inv!1972 (array!6467) Bool)

(assert (=> b!165357 (= e!108463 (and tp!14268 tp_is_empty!3691 (array_inv!1971 (_keys!5223 thiss!1248)) (array_inv!1972 (_values!3381 thiss!1248)) e!108464))))

(declare-fun b!165358 () Bool)

(declare-fun e!108465 () Bool)

(assert (=> b!165358 (= e!108465 tp_is_empty!3691)))

(declare-fun b!165359 () Bool)

(declare-fun res!78428 () Bool)

(assert (=> b!165359 (=> (not res!78428) (not e!108462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165359 (= res!78428 (validMask!0 (mask!8107 thiss!1248)))))

(declare-fun res!78426 () Bool)

(assert (=> start!16588 (=> (not res!78426) (not e!108461))))

(declare-fun valid!862 (LongMapFixedSize!1912) Bool)

(assert (=> start!16588 (= res!78426 (valid!862 thiss!1248))))

(assert (=> start!16588 e!108461))

(assert (=> start!16588 e!108463))

(assert (=> start!16588 true))

(declare-fun b!165360 () Bool)

(assert (=> b!165360 (= e!108464 (and e!108465 mapRes!6255))))

(declare-fun condMapEmpty!6255 () Bool)

(declare-fun mapDefault!6255 () ValueCell!1502)

(assert (=> b!165360 (= condMapEmpty!6255 (= (arr!3069 (_values!3381 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1502)) mapDefault!6255)))))

(declare-fun b!165361 () Bool)

(declare-fun res!78429 () Bool)

(assert (=> b!165361 (=> (not res!78429) (not e!108462))))

(declare-datatypes ((tuple2!3014 0))(
  ( (tuple2!3015 (_1!1518 (_ BitVec 64)) (_2!1518 V!4569)) )
))
(declare-datatypes ((List!2036 0))(
  ( (Nil!2033) (Cons!2032 (h!2649 tuple2!3014) (t!6830 List!2036)) )
))
(declare-datatypes ((ListLongMap!1975 0))(
  ( (ListLongMap!1976 (toList!1003 List!2036)) )
))
(declare-fun contains!1055 (ListLongMap!1975 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!665 (array!6465 array!6467 (_ BitVec 32) (_ BitVec 32) V!4569 V!4569 (_ BitVec 32) Int) ListLongMap!1975)

(assert (=> b!165361 (= res!78429 (not (contains!1055 (getCurrentListMap!665 (_keys!5223 thiss!1248) (_values!3381 thiss!1248) (mask!8107 thiss!1248) (extraKeys!3139 thiss!1248) (zeroValue!3241 thiss!1248) (minValue!3241 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3398 thiss!1248)) key!828)))))

(declare-fun b!165362 () Bool)

(declare-fun res!78430 () Bool)

(assert (=> b!165362 (=> (not res!78430) (not e!108461))))

(assert (=> b!165362 (= res!78430 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6255 () Bool)

(assert (=> mapIsEmpty!6255 mapRes!6255))

(assert (= (and start!16588 res!78426) b!165362))

(assert (= (and b!165362 res!78430) b!165353))

(assert (= (and b!165353 res!78427) b!165361))

(assert (= (and b!165361 res!78429) b!165359))

(assert (= (and b!165359 res!78428) b!165354))

(assert (= (and b!165354 res!78432) b!165356))

(assert (= (and b!165356 res!78431) b!165355))

(assert (= (and b!165360 condMapEmpty!6255) mapIsEmpty!6255))

(assert (= (and b!165360 (not condMapEmpty!6255)) mapNonEmpty!6255))

(assert (= (and mapNonEmpty!6255 ((_ is ValueCellFull!1502) mapValue!6255)) b!165352))

(assert (= (and b!165360 ((_ is ValueCellFull!1502) mapDefault!6255)) b!165358))

(assert (= b!165357 b!165360))

(assert (= start!16588 b!165357))

(declare-fun m!195353 () Bool)

(assert (=> b!165357 m!195353))

(declare-fun m!195355 () Bool)

(assert (=> b!165357 m!195355))

(declare-fun m!195357 () Bool)

(assert (=> b!165353 m!195357))

(declare-fun m!195359 () Bool)

(assert (=> start!16588 m!195359))

(declare-fun m!195361 () Bool)

(assert (=> b!165361 m!195361))

(assert (=> b!165361 m!195361))

(declare-fun m!195363 () Bool)

(assert (=> b!165361 m!195363))

(declare-fun m!195365 () Bool)

(assert (=> b!165356 m!195365))

(declare-fun m!195367 () Bool)

(assert (=> mapNonEmpty!6255 m!195367))

(declare-fun m!195369 () Bool)

(assert (=> b!165359 m!195369))

(declare-fun m!195371 () Bool)

(assert (=> b!165355 m!195371))

(check-sat (not b!165361) (not mapNonEmpty!6255) (not b_next!3889) (not b!165357) (not b!165356) tp_is_empty!3691 (not b!165359) (not b!165355) (not start!16588) b_and!10317 (not b!165353))
(check-sat b_and!10317 (not b_next!3889))
