; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16702 () Bool)

(assert start!16702)

(declare-fun b!167226 () Bool)

(declare-fun b_free!4003 () Bool)

(declare-fun b_next!4003 () Bool)

(assert (=> b!167226 (= b_free!4003 (not b_next!4003))))

(declare-fun tp!14610 () Bool)

(declare-fun b_and!10391 () Bool)

(assert (=> b!167226 (= tp!14610 b_and!10391)))

(declare-fun b!167223 () Bool)

(declare-fun e!109818 () Bool)

(declare-fun tp_is_empty!3805 () Bool)

(assert (=> b!167223 (= e!109818 tp_is_empty!3805)))

(declare-fun b!167224 () Bool)

(declare-fun res!79507 () Bool)

(declare-fun e!109814 () Bool)

(assert (=> b!167224 (=> (not res!79507) (not e!109814))))

(declare-datatypes ((V!4721 0))(
  ( (V!4722 (val!1947 Int)) )
))
(declare-datatypes ((ValueCell!1559 0))(
  ( (ValueCellFull!1559 (v!3806 V!4721)) (EmptyCell!1559) )
))
(declare-datatypes ((array!6687 0))(
  ( (array!6688 (arr!3178 (Array (_ BitVec 32) (_ BitVec 64))) (size!3467 (_ BitVec 32))) )
))
(declare-datatypes ((array!6689 0))(
  ( (array!6690 (arr!3179 (Array (_ BitVec 32) ValueCell!1559)) (size!3468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2026 0))(
  ( (LongMapFixedSize!2027 (defaultEntry!3455 Int) (mask!8201 (_ BitVec 32)) (extraKeys!3196 (_ BitVec 32)) (zeroValue!3298 V!4721) (minValue!3298 V!4721) (_size!1062 (_ BitVec 32)) (_keys!5279 array!6687) (_values!3438 array!6689) (_vacant!1062 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2026)

(assert (=> b!167224 (= res!79507 (and (= (size!3468 (_values!3438 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8201 thiss!1248))) (= (size!3467 (_keys!5279 thiss!1248)) (size!3468 (_values!3438 thiss!1248))) (bvsge (mask!8201 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3196 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3196 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167225 () Bool)

(declare-datatypes ((Unit!5089 0))(
  ( (Unit!5090) )
))
(declare-fun e!109810 () Unit!5089)

(declare-fun lt!83487 () Unit!5089)

(assert (=> b!167225 (= e!109810 lt!83487)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!100 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5089)

(assert (=> b!167225 (= lt!83487 (lemmaInListMapThenSeekEntryOrOpenFindsIt!100 (_keys!5279 thiss!1248) (_values!3438 thiss!1248) (mask!8201 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(declare-fun res!79513 () Bool)

(declare-datatypes ((SeekEntryResult!486 0))(
  ( (MissingZero!486 (index!4112 (_ BitVec 32))) (Found!486 (index!4113 (_ BitVec 32))) (Intermediate!486 (undefined!1298 Bool) (index!4114 (_ BitVec 32)) (x!18529 (_ BitVec 32))) (Undefined!486) (MissingVacant!486 (index!4115 (_ BitVec 32))) )
))
(declare-fun lt!83485 () SeekEntryResult!486)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167225 (= res!79513 (inRange!0 (index!4113 lt!83485) (mask!8201 thiss!1248)))))

(declare-fun e!109811 () Bool)

(assert (=> b!167225 (=> (not res!79513) (not e!109811))))

(assert (=> b!167225 e!109811))

(declare-fun e!109813 () Bool)

(declare-fun e!109816 () Bool)

(declare-fun array_inv!2047 (array!6687) Bool)

(declare-fun array_inv!2048 (array!6689) Bool)

(assert (=> b!167226 (= e!109816 (and tp!14610 tp_is_empty!3805 (array_inv!2047 (_keys!5279 thiss!1248)) (array_inv!2048 (_values!3438 thiss!1248)) e!109813))))

(declare-fun mapNonEmpty!6426 () Bool)

(declare-fun mapRes!6426 () Bool)

(declare-fun tp!14609 () Bool)

(declare-fun e!109812 () Bool)

(assert (=> mapNonEmpty!6426 (= mapRes!6426 (and tp!14609 e!109812))))

(declare-fun mapRest!6426 () (Array (_ BitVec 32) ValueCell!1559))

(declare-fun mapKey!6426 () (_ BitVec 32))

(declare-fun mapValue!6426 () ValueCell!1559)

(assert (=> mapNonEmpty!6426 (= (arr!3179 (_values!3438 thiss!1248)) (store mapRest!6426 mapKey!6426 mapValue!6426))))

(declare-fun b!167227 () Bool)

(assert (=> b!167227 (= e!109812 tp_is_empty!3805)))

(declare-fun b!167228 () Bool)

(declare-fun res!79511 () Bool)

(assert (=> b!167228 (=> (not res!79511) (not e!109814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6687 (_ BitVec 32)) Bool)

(assert (=> b!167228 (= res!79511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5279 thiss!1248) (mask!8201 thiss!1248)))))

(declare-fun res!79512 () Bool)

(declare-fun e!109817 () Bool)

(assert (=> start!16702 (=> (not res!79512) (not e!109817))))

(declare-fun valid!893 (LongMapFixedSize!2026) Bool)

(assert (=> start!16702 (= res!79512 (valid!893 thiss!1248))))

(assert (=> start!16702 e!109817))

(assert (=> start!16702 e!109816))

(assert (=> start!16702 true))

(declare-fun b!167229 () Bool)

(declare-fun e!109809 () Bool)

(assert (=> b!167229 (= e!109817 e!109809)))

(declare-fun res!79508 () Bool)

(assert (=> b!167229 (=> (not res!79508) (not e!109809))))

(get-info :version)

(assert (=> b!167229 (= res!79508 (and (not ((_ is Undefined!486) lt!83485)) (not ((_ is MissingVacant!486) lt!83485)) (not ((_ is MissingZero!486) lt!83485)) ((_ is Found!486) lt!83485)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6687 (_ BitVec 32)) SeekEntryResult!486)

(assert (=> b!167229 (= lt!83485 (seekEntryOrOpen!0 key!828 (_keys!5279 thiss!1248) (mask!8201 thiss!1248)))))

(declare-fun b!167230 () Bool)

(declare-fun res!79509 () Bool)

(assert (=> b!167230 (=> (not res!79509) (not e!109817))))

(assert (=> b!167230 (= res!79509 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167231 () Bool)

(assert (=> b!167231 (= e!109809 e!109814)))

(declare-fun res!79510 () Bool)

(assert (=> b!167231 (=> (not res!79510) (not e!109814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167231 (= res!79510 (validMask!0 (mask!8201 thiss!1248)))))

(declare-fun lt!83484 () Unit!5089)

(assert (=> b!167231 (= lt!83484 e!109810)))

(declare-fun c!30260 () Bool)

(declare-datatypes ((tuple2!3120 0))(
  ( (tuple2!3121 (_1!1571 (_ BitVec 64)) (_2!1571 V!4721)) )
))
(declare-datatypes ((List!2126 0))(
  ( (Nil!2123) (Cons!2122 (h!2739 tuple2!3120) (t!6919 List!2126)) )
))
(declare-datatypes ((ListLongMap!2063 0))(
  ( (ListLongMap!2064 (toList!1047 List!2126)) )
))
(declare-fun contains!1092 (ListLongMap!2063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!689 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 32) Int) ListLongMap!2063)

(assert (=> b!167231 (= c!30260 (contains!1092 (getCurrentListMap!689 (_keys!5279 thiss!1248) (_values!3438 thiss!1248) (mask!8201 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3455 thiss!1248)) key!828))))

(declare-fun b!167232 () Bool)

(assert (=> b!167232 (= e!109814 false)))

(declare-fun lt!83483 () Bool)

(declare-datatypes ((List!2127 0))(
  ( (Nil!2124) (Cons!2123 (h!2740 (_ BitVec 64)) (t!6920 List!2127)) )
))
(declare-fun arrayNoDuplicates!0 (array!6687 (_ BitVec 32) List!2127) Bool)

(assert (=> b!167232 (= lt!83483 (arrayNoDuplicates!0 (_keys!5279 thiss!1248) #b00000000000000000000000000000000 Nil!2124))))

(declare-fun b!167233 () Bool)

(declare-fun Unit!5091 () Unit!5089)

(assert (=> b!167233 (= e!109810 Unit!5091)))

(declare-fun lt!83486 () Unit!5089)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (array!6687 array!6689 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5089)

(assert (=> b!167233 (= lt!83486 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (_keys!5279 thiss!1248) (_values!3438 thiss!1248) (mask!8201 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(assert (=> b!167233 false))

(declare-fun mapIsEmpty!6426 () Bool)

(assert (=> mapIsEmpty!6426 mapRes!6426))

(declare-fun b!167234 () Bool)

(assert (=> b!167234 (= e!109811 (= (select (arr!3178 (_keys!5279 thiss!1248)) (index!4113 lt!83485)) key!828))))

(declare-fun b!167235 () Bool)

(assert (=> b!167235 (= e!109813 (and e!109818 mapRes!6426))))

(declare-fun condMapEmpty!6426 () Bool)

(declare-fun mapDefault!6426 () ValueCell!1559)

(assert (=> b!167235 (= condMapEmpty!6426 (= (arr!3179 (_values!3438 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1559)) mapDefault!6426)))))

(assert (= (and start!16702 res!79512) b!167230))

(assert (= (and b!167230 res!79509) b!167229))

(assert (= (and b!167229 res!79508) b!167231))

(assert (= (and b!167231 c!30260) b!167225))

(assert (= (and b!167231 (not c!30260)) b!167233))

(assert (= (and b!167225 res!79513) b!167234))

(assert (= (and b!167231 res!79510) b!167224))

(assert (= (and b!167224 res!79507) b!167228))

(assert (= (and b!167228 res!79511) b!167232))

(assert (= (and b!167235 condMapEmpty!6426) mapIsEmpty!6426))

(assert (= (and b!167235 (not condMapEmpty!6426)) mapNonEmpty!6426))

(assert (= (and mapNonEmpty!6426 ((_ is ValueCellFull!1559) mapValue!6426)) b!167227))

(assert (= (and b!167235 ((_ is ValueCellFull!1559) mapDefault!6426)) b!167223))

(assert (= b!167226 b!167235))

(assert (= start!16702 b!167226))

(declare-fun m!195931 () Bool)

(assert (=> b!167226 m!195931))

(declare-fun m!195933 () Bool)

(assert (=> b!167226 m!195933))

(declare-fun m!195935 () Bool)

(assert (=> b!167231 m!195935))

(declare-fun m!195937 () Bool)

(assert (=> b!167231 m!195937))

(assert (=> b!167231 m!195937))

(declare-fun m!195939 () Bool)

(assert (=> b!167231 m!195939))

(declare-fun m!195941 () Bool)

(assert (=> b!167229 m!195941))

(declare-fun m!195943 () Bool)

(assert (=> start!16702 m!195943))

(declare-fun m!195945 () Bool)

(assert (=> b!167234 m!195945))

(declare-fun m!195947 () Bool)

(assert (=> b!167225 m!195947))

(declare-fun m!195949 () Bool)

(assert (=> b!167225 m!195949))

(declare-fun m!195951 () Bool)

(assert (=> mapNonEmpty!6426 m!195951))

(declare-fun m!195953 () Bool)

(assert (=> b!167228 m!195953))

(declare-fun m!195955 () Bool)

(assert (=> b!167233 m!195955))

(declare-fun m!195957 () Bool)

(assert (=> b!167232 m!195957))

(check-sat (not b!167232) b_and!10391 (not b!167225) tp_is_empty!3805 (not b!167231) (not b!167233) (not b!167229) (not b_next!4003) (not start!16702) (not b!167226) (not mapNonEmpty!6426) (not b!167228))
(check-sat b_and!10391 (not b_next!4003))
