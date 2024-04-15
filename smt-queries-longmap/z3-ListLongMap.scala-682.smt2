; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16600 () Bool)

(assert start!16600)

(declare-fun b!165366 () Bool)

(declare-fun b_free!3901 () Bool)

(declare-fun b_next!3901 () Bool)

(assert (=> b!165366 (= b_free!3901 (not b_next!3901))))

(declare-fun tp!14304 () Bool)

(declare-fun b_and!10289 () Bool)

(assert (=> b!165366 (= tp!14304 b_and!10289)))

(declare-fun b!165356 () Bool)

(declare-fun res!78440 () Bool)

(declare-fun e!108464 () Bool)

(assert (=> b!165356 (=> (not res!78440) (not e!108464))))

(declare-datatypes ((V!4585 0))(
  ( (V!4586 (val!1896 Int)) )
))
(declare-datatypes ((ValueCell!1508 0))(
  ( (ValueCellFull!1508 (v!3755 V!4585)) (EmptyCell!1508) )
))
(declare-datatypes ((array!6483 0))(
  ( (array!6484 (arr!3076 (Array (_ BitVec 32) (_ BitVec 64))) (size!3365 (_ BitVec 32))) )
))
(declare-datatypes ((array!6485 0))(
  ( (array!6486 (arr!3077 (Array (_ BitVec 32) ValueCell!1508)) (size!3366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1924 0))(
  ( (LongMapFixedSize!1925 (defaultEntry!3404 Int) (mask!8116 (_ BitVec 32)) (extraKeys!3145 (_ BitVec 32)) (zeroValue!3247 V!4585) (minValue!3247 V!4585) (_size!1011 (_ BitVec 32)) (_keys!5228 array!6483) (_values!3387 array!6485) (_vacant!1011 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1924)

(assert (=> b!165356 (= res!78440 (and (= (size!3366 (_values!3387 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8116 thiss!1248))) (= (size!3365 (_keys!5228 thiss!1248)) (size!3366 (_values!3387 thiss!1248))) (bvsge (mask!8116 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3145 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3145 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!78441 () Bool)

(declare-fun e!108468 () Bool)

(assert (=> start!16600 (=> (not res!78441) (not e!108468))))

(declare-fun valid!856 (LongMapFixedSize!1924) Bool)

(assert (=> start!16600 (= res!78441 (valid!856 thiss!1248))))

(assert (=> start!16600 e!108468))

(declare-fun e!108463 () Bool)

(assert (=> start!16600 e!108463))

(assert (=> start!16600 true))

(declare-fun b!165357 () Bool)

(declare-fun e!108466 () Bool)

(declare-fun tp_is_empty!3703 () Bool)

(assert (=> b!165357 (= e!108466 tp_is_empty!3703)))

(declare-fun b!165358 () Bool)

(declare-fun e!108467 () Bool)

(declare-fun e!108462 () Bool)

(declare-fun mapRes!6273 () Bool)

(assert (=> b!165358 (= e!108467 (and e!108462 mapRes!6273))))

(declare-fun condMapEmpty!6273 () Bool)

(declare-fun mapDefault!6273 () ValueCell!1508)

(assert (=> b!165358 (= condMapEmpty!6273 (= (arr!3077 (_values!3387 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1508)) mapDefault!6273)))))

(declare-fun b!165359 () Bool)

(declare-fun res!78442 () Bool)

(assert (=> b!165359 (=> (not res!78442) (not e!108468))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165359 (= res!78442 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165360 () Bool)

(declare-fun res!78439 () Bool)

(assert (=> b!165360 (=> (not res!78439) (not e!108464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165360 (= res!78439 (validMask!0 (mask!8116 thiss!1248)))))

(declare-fun b!165361 () Bool)

(assert (=> b!165361 (= e!108464 false)))

(declare-fun lt!82902 () Bool)

(declare-datatypes ((List!2059 0))(
  ( (Nil!2056) (Cons!2055 (h!2672 (_ BitVec 64)) (t!6852 List!2059)) )
))
(declare-fun arrayNoDuplicates!0 (array!6483 (_ BitVec 32) List!2059) Bool)

(assert (=> b!165361 (= lt!82902 (arrayNoDuplicates!0 (_keys!5228 thiss!1248) #b00000000000000000000000000000000 Nil!2056))))

(declare-fun b!165362 () Bool)

(declare-fun res!78436 () Bool)

(assert (=> b!165362 (=> (not res!78436) (not e!108464))))

(declare-datatypes ((tuple2!3058 0))(
  ( (tuple2!3059 (_1!1540 (_ BitVec 64)) (_2!1540 V!4585)) )
))
(declare-datatypes ((List!2060 0))(
  ( (Nil!2057) (Cons!2056 (h!2673 tuple2!3058) (t!6853 List!2060)) )
))
(declare-datatypes ((ListLongMap!2001 0))(
  ( (ListLongMap!2002 (toList!1016 List!2060)) )
))
(declare-fun contains!1061 (ListLongMap!2001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!658 (array!6483 array!6485 (_ BitVec 32) (_ BitVec 32) V!4585 V!4585 (_ BitVec 32) Int) ListLongMap!2001)

(assert (=> b!165362 (= res!78436 (not (contains!1061 (getCurrentListMap!658 (_keys!5228 thiss!1248) (_values!3387 thiss!1248) (mask!8116 thiss!1248) (extraKeys!3145 thiss!1248) (zeroValue!3247 thiss!1248) (minValue!3247 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3404 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6273 () Bool)

(declare-fun tp!14303 () Bool)

(assert (=> mapNonEmpty!6273 (= mapRes!6273 (and tp!14303 e!108466))))

(declare-fun mapKey!6273 () (_ BitVec 32))

(declare-fun mapValue!6273 () ValueCell!1508)

(declare-fun mapRest!6273 () (Array (_ BitVec 32) ValueCell!1508))

(assert (=> mapNonEmpty!6273 (= (arr!3077 (_values!3387 thiss!1248)) (store mapRest!6273 mapKey!6273 mapValue!6273))))

(declare-fun b!165363 () Bool)

(assert (=> b!165363 (= e!108468 e!108464)))

(declare-fun res!78437 () Bool)

(assert (=> b!165363 (=> (not res!78437) (not e!108464))))

(declare-datatypes ((SeekEntryResult!447 0))(
  ( (MissingZero!447 (index!3956 (_ BitVec 32))) (Found!447 (index!3957 (_ BitVec 32))) (Intermediate!447 (undefined!1259 Bool) (index!3958 (_ BitVec 32)) (x!18354 (_ BitVec 32))) (Undefined!447) (MissingVacant!447 (index!3959 (_ BitVec 32))) )
))
(declare-fun lt!82901 () SeekEntryResult!447)

(get-info :version)

(assert (=> b!165363 (= res!78437 (and (not ((_ is Undefined!447) lt!82901)) (not ((_ is MissingVacant!447) lt!82901)) (not ((_ is MissingZero!447) lt!82901)) ((_ is Found!447) lt!82901)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6483 (_ BitVec 32)) SeekEntryResult!447)

(assert (=> b!165363 (= lt!82901 (seekEntryOrOpen!0 key!828 (_keys!5228 thiss!1248) (mask!8116 thiss!1248)))))

(declare-fun mapIsEmpty!6273 () Bool)

(assert (=> mapIsEmpty!6273 mapRes!6273))

(declare-fun b!165364 () Bool)

(declare-fun res!78438 () Bool)

(assert (=> b!165364 (=> (not res!78438) (not e!108464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6483 (_ BitVec 32)) Bool)

(assert (=> b!165364 (= res!78438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5228 thiss!1248) (mask!8116 thiss!1248)))))

(declare-fun b!165365 () Bool)

(assert (=> b!165365 (= e!108462 tp_is_empty!3703)))

(declare-fun array_inv!1977 (array!6483) Bool)

(declare-fun array_inv!1978 (array!6485) Bool)

(assert (=> b!165366 (= e!108463 (and tp!14304 tp_is_empty!3703 (array_inv!1977 (_keys!5228 thiss!1248)) (array_inv!1978 (_values!3387 thiss!1248)) e!108467))))

(assert (= (and start!16600 res!78441) b!165359))

(assert (= (and b!165359 res!78442) b!165363))

(assert (= (and b!165363 res!78437) b!165362))

(assert (= (and b!165362 res!78436) b!165360))

(assert (= (and b!165360 res!78439) b!165356))

(assert (= (and b!165356 res!78440) b!165364))

(assert (= (and b!165364 res!78438) b!165361))

(assert (= (and b!165358 condMapEmpty!6273) mapIsEmpty!6273))

(assert (= (and b!165358 (not condMapEmpty!6273)) mapNonEmpty!6273))

(assert (= (and mapNonEmpty!6273 ((_ is ValueCellFull!1508) mapValue!6273)) b!165357))

(assert (= (and b!165358 ((_ is ValueCellFull!1508) mapDefault!6273)) b!165365))

(assert (= b!165366 b!165358))

(assert (= start!16600 b!165366))

(declare-fun m!194671 () Bool)

(assert (=> b!165363 m!194671))

(declare-fun m!194673 () Bool)

(assert (=> start!16600 m!194673))

(declare-fun m!194675 () Bool)

(assert (=> b!165361 m!194675))

(declare-fun m!194677 () Bool)

(assert (=> b!165362 m!194677))

(assert (=> b!165362 m!194677))

(declare-fun m!194679 () Bool)

(assert (=> b!165362 m!194679))

(declare-fun m!194681 () Bool)

(assert (=> mapNonEmpty!6273 m!194681))

(declare-fun m!194683 () Bool)

(assert (=> b!165364 m!194683))

(declare-fun m!194685 () Bool)

(assert (=> b!165360 m!194685))

(declare-fun m!194687 () Bool)

(assert (=> b!165366 m!194687))

(declare-fun m!194689 () Bool)

(assert (=> b!165366 m!194689))

(check-sat (not b!165361) tp_is_empty!3703 (not b!165366) (not b!165362) (not b!165364) (not b!165360) b_and!10289 (not b!165363) (not mapNonEmpty!6273) (not b_next!3901) (not start!16600))
(check-sat b_and!10289 (not b_next!3901))
