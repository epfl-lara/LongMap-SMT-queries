; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16588 () Bool)

(assert start!16588)

(declare-fun b!165161 () Bool)

(declare-fun b_free!3889 () Bool)

(declare-fun b_next!3889 () Bool)

(assert (=> b!165161 (= b_free!3889 (not b_next!3889))))

(declare-fun tp!14268 () Bool)

(declare-fun b_and!10277 () Bool)

(assert (=> b!165161 (= tp!14268 b_and!10277)))

(declare-fun b!165158 () Bool)

(declare-fun res!78310 () Bool)

(declare-fun e!108340 () Bool)

(assert (=> b!165158 (=> (not res!78310) (not e!108340))))

(declare-datatypes ((V!4569 0))(
  ( (V!4570 (val!1890 Int)) )
))
(declare-datatypes ((ValueCell!1502 0))(
  ( (ValueCellFull!1502 (v!3749 V!4569)) (EmptyCell!1502) )
))
(declare-datatypes ((array!6459 0))(
  ( (array!6460 (arr!3064 (Array (_ BitVec 32) (_ BitVec 64))) (size!3353 (_ BitVec 32))) )
))
(declare-datatypes ((array!6461 0))(
  ( (array!6462 (arr!3065 (Array (_ BitVec 32) ValueCell!1502)) (size!3354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1912 0))(
  ( (LongMapFixedSize!1913 (defaultEntry!3398 Int) (mask!8106 (_ BitVec 32)) (extraKeys!3139 (_ BitVec 32)) (zeroValue!3241 V!4569) (minValue!3241 V!4569) (_size!1005 (_ BitVec 32)) (_keys!5222 array!6459) (_values!3381 array!6461) (_vacant!1005 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1912)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165158 (= res!78310 (validMask!0 (mask!8106 thiss!1248)))))

(declare-fun b!165159 () Bool)

(declare-fun e!108336 () Bool)

(declare-fun tp_is_empty!3691 () Bool)

(assert (=> b!165159 (= e!108336 tp_is_empty!3691)))

(declare-fun e!108339 () Bool)

(declare-fun e!108342 () Bool)

(declare-fun array_inv!1967 (array!6459) Bool)

(declare-fun array_inv!1968 (array!6461) Bool)

(assert (=> b!165161 (= e!108339 (and tp!14268 tp_is_empty!3691 (array_inv!1967 (_keys!5222 thiss!1248)) (array_inv!1968 (_values!3381 thiss!1248)) e!108342))))

(declare-fun b!165162 () Bool)

(declare-fun res!78312 () Bool)

(assert (=> b!165162 (=> (not res!78312) (not e!108340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6459 (_ BitVec 32)) Bool)

(assert (=> b!165162 (= res!78312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5222 thiss!1248) (mask!8106 thiss!1248)))))

(declare-fun b!165163 () Bool)

(declare-fun res!78313 () Bool)

(assert (=> b!165163 (=> (not res!78313) (not e!108340))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3048 0))(
  ( (tuple2!3049 (_1!1535 (_ BitVec 64)) (_2!1535 V!4569)) )
))
(declare-datatypes ((List!2048 0))(
  ( (Nil!2045) (Cons!2044 (h!2661 tuple2!3048) (t!6841 List!2048)) )
))
(declare-datatypes ((ListLongMap!1991 0))(
  ( (ListLongMap!1992 (toList!1011 List!2048)) )
))
(declare-fun contains!1056 (ListLongMap!1991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!653 (array!6459 array!6461 (_ BitVec 32) (_ BitVec 32) V!4569 V!4569 (_ BitVec 32) Int) ListLongMap!1991)

(assert (=> b!165163 (= res!78313 (not (contains!1056 (getCurrentListMap!653 (_keys!5222 thiss!1248) (_values!3381 thiss!1248) (mask!8106 thiss!1248) (extraKeys!3139 thiss!1248) (zeroValue!3241 thiss!1248) (minValue!3241 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3398 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6255 () Bool)

(declare-fun mapRes!6255 () Bool)

(declare-fun tp!14267 () Bool)

(assert (=> mapNonEmpty!6255 (= mapRes!6255 (and tp!14267 e!108336))))

(declare-fun mapKey!6255 () (_ BitVec 32))

(declare-fun mapRest!6255 () (Array (_ BitVec 32) ValueCell!1502))

(declare-fun mapValue!6255 () ValueCell!1502)

(assert (=> mapNonEmpty!6255 (= (arr!3065 (_values!3381 thiss!1248)) (store mapRest!6255 mapKey!6255 mapValue!6255))))

(declare-fun b!165164 () Bool)

(assert (=> b!165164 (= e!108340 false)))

(declare-fun lt!82865 () Bool)

(declare-datatypes ((List!2049 0))(
  ( (Nil!2046) (Cons!2045 (h!2662 (_ BitVec 64)) (t!6842 List!2049)) )
))
(declare-fun arrayNoDuplicates!0 (array!6459 (_ BitVec 32) List!2049) Bool)

(assert (=> b!165164 (= lt!82865 (arrayNoDuplicates!0 (_keys!5222 thiss!1248) #b00000000000000000000000000000000 Nil!2046))))

(declare-fun mapIsEmpty!6255 () Bool)

(assert (=> mapIsEmpty!6255 mapRes!6255))

(declare-fun b!165165 () Bool)

(declare-fun res!78311 () Bool)

(assert (=> b!165165 (=> (not res!78311) (not e!108340))))

(assert (=> b!165165 (= res!78311 (and (= (size!3354 (_values!3381 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8106 thiss!1248))) (= (size!3353 (_keys!5222 thiss!1248)) (size!3354 (_values!3381 thiss!1248))) (bvsge (mask!8106 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3139 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3139 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165166 () Bool)

(declare-fun res!78316 () Bool)

(declare-fun e!108338 () Bool)

(assert (=> b!165166 (=> (not res!78316) (not e!108338))))

(assert (=> b!165166 (= res!78316 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165167 () Bool)

(assert (=> b!165167 (= e!108338 e!108340)))

(declare-fun res!78315 () Bool)

(assert (=> b!165167 (=> (not res!78315) (not e!108340))))

(declare-datatypes ((SeekEntryResult!442 0))(
  ( (MissingZero!442 (index!3936 (_ BitVec 32))) (Found!442 (index!3937 (_ BitVec 32))) (Intermediate!442 (undefined!1254 Bool) (index!3938 (_ BitVec 32)) (x!18333 (_ BitVec 32))) (Undefined!442) (MissingVacant!442 (index!3939 (_ BitVec 32))) )
))
(declare-fun lt!82866 () SeekEntryResult!442)

(get-info :version)

(assert (=> b!165167 (= res!78315 (and (not ((_ is Undefined!442) lt!82866)) (not ((_ is MissingVacant!442) lt!82866)) (not ((_ is MissingZero!442) lt!82866)) ((_ is Found!442) lt!82866)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6459 (_ BitVec 32)) SeekEntryResult!442)

(assert (=> b!165167 (= lt!82866 (seekEntryOrOpen!0 key!828 (_keys!5222 thiss!1248) (mask!8106 thiss!1248)))))

(declare-fun b!165168 () Bool)

(declare-fun e!108341 () Bool)

(assert (=> b!165168 (= e!108342 (and e!108341 mapRes!6255))))

(declare-fun condMapEmpty!6255 () Bool)

(declare-fun mapDefault!6255 () ValueCell!1502)

(assert (=> b!165168 (= condMapEmpty!6255 (= (arr!3065 (_values!3381 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1502)) mapDefault!6255)))))

(declare-fun res!78314 () Bool)

(assert (=> start!16588 (=> (not res!78314) (not e!108338))))

(declare-fun valid!851 (LongMapFixedSize!1912) Bool)

(assert (=> start!16588 (= res!78314 (valid!851 thiss!1248))))

(assert (=> start!16588 e!108338))

(assert (=> start!16588 e!108339))

(assert (=> start!16588 true))

(declare-fun b!165160 () Bool)

(assert (=> b!165160 (= e!108341 tp_is_empty!3691)))

(assert (= (and start!16588 res!78314) b!165166))

(assert (= (and b!165166 res!78316) b!165167))

(assert (= (and b!165167 res!78315) b!165163))

(assert (= (and b!165163 res!78313) b!165158))

(assert (= (and b!165158 res!78310) b!165165))

(assert (= (and b!165165 res!78311) b!165162))

(assert (= (and b!165162 res!78312) b!165164))

(assert (= (and b!165168 condMapEmpty!6255) mapIsEmpty!6255))

(assert (= (and b!165168 (not condMapEmpty!6255)) mapNonEmpty!6255))

(assert (= (and mapNonEmpty!6255 ((_ is ValueCellFull!1502) mapValue!6255)) b!165159))

(assert (= (and b!165168 ((_ is ValueCellFull!1502) mapDefault!6255)) b!165160))

(assert (= b!165161 b!165168))

(assert (= start!16588 b!165161))

(declare-fun m!194551 () Bool)

(assert (=> b!165164 m!194551))

(declare-fun m!194553 () Bool)

(assert (=> b!165162 m!194553))

(declare-fun m!194555 () Bool)

(assert (=> b!165163 m!194555))

(assert (=> b!165163 m!194555))

(declare-fun m!194557 () Bool)

(assert (=> b!165163 m!194557))

(declare-fun m!194559 () Bool)

(assert (=> mapNonEmpty!6255 m!194559))

(declare-fun m!194561 () Bool)

(assert (=> b!165161 m!194561))

(declare-fun m!194563 () Bool)

(assert (=> b!165161 m!194563))

(declare-fun m!194565 () Bool)

(assert (=> b!165167 m!194565))

(declare-fun m!194567 () Bool)

(assert (=> b!165158 m!194567))

(declare-fun m!194569 () Bool)

(assert (=> start!16588 m!194569))

(check-sat (not b!165163) b_and!10277 (not b_next!3889) (not b!165162) (not b!165167) (not b!165164) (not start!16588) tp_is_empty!3691 (not b!165161) (not mapNonEmpty!6255) (not b!165158))
(check-sat b_and!10277 (not b_next!3889))
