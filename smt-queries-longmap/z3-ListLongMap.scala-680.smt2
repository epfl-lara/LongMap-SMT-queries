; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16586 () Bool)

(assert start!16586)

(declare-fun b!165344 () Bool)

(declare-fun b_free!3891 () Bool)

(declare-fun b_next!3891 () Bool)

(assert (=> b!165344 (= b_free!3891 (not b_next!3891))))

(declare-fun tp!14273 () Bool)

(declare-fun b_and!10305 () Bool)

(assert (=> b!165344 (= tp!14273 b_and!10305)))

(declare-fun b!165338 () Bool)

(declare-fun e!108461 () Bool)

(declare-fun tp_is_empty!3693 () Bool)

(assert (=> b!165338 (= e!108461 tp_is_empty!3693)))

(declare-fun b!165339 () Bool)

(declare-fun e!108459 () Bool)

(assert (=> b!165339 (= e!108459 tp_is_empty!3693)))

(declare-fun b!165340 () Bool)

(declare-fun res!78430 () Bool)

(declare-fun e!108463 () Bool)

(assert (=> b!165340 (=> (not res!78430) (not e!108463))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165340 (= res!78430 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165341 () Bool)

(declare-fun res!78426 () Bool)

(declare-fun e!108462 () Bool)

(assert (=> b!165341 (=> (not res!78426) (not e!108462))))

(declare-datatypes ((V!4571 0))(
  ( (V!4572 (val!1891 Int)) )
))
(declare-datatypes ((ValueCell!1503 0))(
  ( (ValueCellFull!1503 (v!3756 V!4571)) (EmptyCell!1503) )
))
(declare-datatypes ((array!6483 0))(
  ( (array!6484 (arr!3077 (Array (_ BitVec 32) (_ BitVec 64))) (size!3365 (_ BitVec 32))) )
))
(declare-datatypes ((array!6485 0))(
  ( (array!6486 (arr!3078 (Array (_ BitVec 32) ValueCell!1503)) (size!3366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1914 0))(
  ( (LongMapFixedSize!1915 (defaultEntry!3399 Int) (mask!8108 (_ BitVec 32)) (extraKeys!3140 (_ BitVec 32)) (zeroValue!3242 V!4571) (minValue!3242 V!4571) (_size!1006 (_ BitVec 32)) (_keys!5224 array!6483) (_values!3382 array!6485) (_vacant!1006 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1914)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6483 (_ BitVec 32)) Bool)

(assert (=> b!165341 (= res!78426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5224 thiss!1248) (mask!8108 thiss!1248)))))

(declare-fun mapNonEmpty!6258 () Bool)

(declare-fun mapRes!6258 () Bool)

(declare-fun tp!14274 () Bool)

(assert (=> mapNonEmpty!6258 (= mapRes!6258 (and tp!14274 e!108461))))

(declare-fun mapKey!6258 () (_ BitVec 32))

(declare-fun mapRest!6258 () (Array (_ BitVec 32) ValueCell!1503))

(declare-fun mapValue!6258 () ValueCell!1503)

(assert (=> mapNonEmpty!6258 (= (arr!3078 (_values!3382 thiss!1248)) (store mapRest!6258 mapKey!6258 mapValue!6258))))

(declare-fun res!78431 () Bool)

(assert (=> start!16586 (=> (not res!78431) (not e!108463))))

(declare-fun valid!847 (LongMapFixedSize!1914) Bool)

(assert (=> start!16586 (= res!78431 (valid!847 thiss!1248))))

(assert (=> start!16586 e!108463))

(declare-fun e!108460 () Bool)

(assert (=> start!16586 e!108460))

(assert (=> start!16586 true))

(declare-fun b!165342 () Bool)

(assert (=> b!165342 (= e!108462 false)))

(declare-fun lt!83053 () Bool)

(declare-datatypes ((List!2047 0))(
  ( (Nil!2044) (Cons!2043 (h!2660 (_ BitVec 64)) (t!6849 List!2047)) )
))
(declare-fun arrayNoDuplicates!0 (array!6483 (_ BitVec 32) List!2047) Bool)

(assert (=> b!165342 (= lt!83053 (arrayNoDuplicates!0 (_keys!5224 thiss!1248) #b00000000000000000000000000000000 Nil!2044))))

(declare-fun b!165343 () Bool)

(declare-fun res!78427 () Bool)

(assert (=> b!165343 (=> (not res!78427) (not e!108462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165343 (= res!78427 (validMask!0 (mask!8108 thiss!1248)))))

(declare-fun e!108464 () Bool)

(declare-fun array_inv!1975 (array!6483) Bool)

(declare-fun array_inv!1976 (array!6485) Bool)

(assert (=> b!165344 (= e!108460 (and tp!14273 tp_is_empty!3693 (array_inv!1975 (_keys!5224 thiss!1248)) (array_inv!1976 (_values!3382 thiss!1248)) e!108464))))

(declare-fun b!165345 () Bool)

(declare-fun res!78428 () Bool)

(assert (=> b!165345 (=> (not res!78428) (not e!108462))))

(declare-datatypes ((tuple2!3064 0))(
  ( (tuple2!3065 (_1!1543 (_ BitVec 64)) (_2!1543 V!4571)) )
))
(declare-datatypes ((List!2048 0))(
  ( (Nil!2045) (Cons!2044 (h!2661 tuple2!3064) (t!6850 List!2048)) )
))
(declare-datatypes ((ListLongMap!2019 0))(
  ( (ListLongMap!2020 (toList!1025 List!2048)) )
))
(declare-fun contains!1067 (ListLongMap!2019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!683 (array!6483 array!6485 (_ BitVec 32) (_ BitVec 32) V!4571 V!4571 (_ BitVec 32) Int) ListLongMap!2019)

(assert (=> b!165345 (= res!78428 (not (contains!1067 (getCurrentListMap!683 (_keys!5224 thiss!1248) (_values!3382 thiss!1248) (mask!8108 thiss!1248) (extraKeys!3140 thiss!1248) (zeroValue!3242 thiss!1248) (minValue!3242 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3399 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6258 () Bool)

(assert (=> mapIsEmpty!6258 mapRes!6258))

(declare-fun b!165346 () Bool)

(assert (=> b!165346 (= e!108463 e!108462)))

(declare-fun res!78432 () Bool)

(assert (=> b!165346 (=> (not res!78432) (not e!108462))))

(declare-datatypes ((SeekEntryResult!434 0))(
  ( (MissingZero!434 (index!3904 (_ BitVec 32))) (Found!434 (index!3905 (_ BitVec 32))) (Intermediate!434 (undefined!1246 Bool) (index!3906 (_ BitVec 32)) (x!18326 (_ BitVec 32))) (Undefined!434) (MissingVacant!434 (index!3907 (_ BitVec 32))) )
))
(declare-fun lt!83052 () SeekEntryResult!434)

(get-info :version)

(assert (=> b!165346 (= res!78432 (and (not ((_ is Undefined!434) lt!83052)) (not ((_ is MissingVacant!434) lt!83052)) (not ((_ is MissingZero!434) lt!83052)) ((_ is Found!434) lt!83052)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6483 (_ BitVec 32)) SeekEntryResult!434)

(assert (=> b!165346 (= lt!83052 (seekEntryOrOpen!0 key!828 (_keys!5224 thiss!1248) (mask!8108 thiss!1248)))))

(declare-fun b!165347 () Bool)

(assert (=> b!165347 (= e!108464 (and e!108459 mapRes!6258))))

(declare-fun condMapEmpty!6258 () Bool)

(declare-fun mapDefault!6258 () ValueCell!1503)

(assert (=> b!165347 (= condMapEmpty!6258 (= (arr!3078 (_values!3382 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1503)) mapDefault!6258)))))

(declare-fun b!165348 () Bool)

(declare-fun res!78429 () Bool)

(assert (=> b!165348 (=> (not res!78429) (not e!108462))))

(assert (=> b!165348 (= res!78429 (and (= (size!3366 (_values!3382 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8108 thiss!1248))) (= (size!3365 (_keys!5224 thiss!1248)) (size!3366 (_values!3382 thiss!1248))) (bvsge (mask!8108 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3140 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3140 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16586 res!78431) b!165340))

(assert (= (and b!165340 res!78430) b!165346))

(assert (= (and b!165346 res!78432) b!165345))

(assert (= (and b!165345 res!78428) b!165343))

(assert (= (and b!165343 res!78427) b!165348))

(assert (= (and b!165348 res!78429) b!165341))

(assert (= (and b!165341 res!78426) b!165342))

(assert (= (and b!165347 condMapEmpty!6258) mapIsEmpty!6258))

(assert (= (and b!165347 (not condMapEmpty!6258)) mapNonEmpty!6258))

(assert (= (and mapNonEmpty!6258 ((_ is ValueCellFull!1503) mapValue!6258)) b!165338))

(assert (= (and b!165347 ((_ is ValueCellFull!1503) mapDefault!6258)) b!165339))

(assert (= b!165344 b!165347))

(assert (= start!16586 b!165344))

(declare-fun m!195191 () Bool)

(assert (=> b!165341 m!195191))

(declare-fun m!195193 () Bool)

(assert (=> mapNonEmpty!6258 m!195193))

(declare-fun m!195195 () Bool)

(assert (=> b!165342 m!195195))

(declare-fun m!195197 () Bool)

(assert (=> b!165343 m!195197))

(declare-fun m!195199 () Bool)

(assert (=> b!165344 m!195199))

(declare-fun m!195201 () Bool)

(assert (=> b!165344 m!195201))

(declare-fun m!195203 () Bool)

(assert (=> b!165345 m!195203))

(assert (=> b!165345 m!195203))

(declare-fun m!195205 () Bool)

(assert (=> b!165345 m!195205))

(declare-fun m!195207 () Bool)

(assert (=> b!165346 m!195207))

(declare-fun m!195209 () Bool)

(assert (=> start!16586 m!195209))

(check-sat (not mapNonEmpty!6258) (not b!165341) (not b!165345) (not start!16586) (not b!165343) (not b!165346) b_and!10305 (not b!165344) (not b_next!3891) tp_is_empty!3693 (not b!165342))
(check-sat b_and!10305 (not b_next!3891))
