; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16646 () Bool)

(assert start!16646)

(declare-fun b!166364 () Bool)

(declare-fun b_free!3951 () Bool)

(declare-fun b_next!3951 () Bool)

(assert (=> b!166364 (= b_free!3951 (not b_next!3951))))

(declare-fun tp!14454 () Bool)

(declare-fun b_and!10365 () Bool)

(assert (=> b!166364 (= tp!14454 b_and!10365)))

(declare-fun b!166356 () Bool)

(declare-fun res!79056 () Bool)

(declare-fun e!109138 () Bool)

(assert (=> b!166356 (=> (not res!79056) (not e!109138))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166356 (= res!79056 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166357 () Bool)

(declare-fun res!79062 () Bool)

(declare-fun e!109136 () Bool)

(assert (=> b!166357 (=> (not res!79062) (not e!109136))))

(declare-datatypes ((V!4651 0))(
  ( (V!4652 (val!1921 Int)) )
))
(declare-datatypes ((ValueCell!1533 0))(
  ( (ValueCellFull!1533 (v!3786 V!4651)) (EmptyCell!1533) )
))
(declare-datatypes ((array!6603 0))(
  ( (array!6604 (arr!3137 (Array (_ BitVec 32) (_ BitVec 64))) (size!3425 (_ BitVec 32))) )
))
(declare-datatypes ((array!6605 0))(
  ( (array!6606 (arr!3138 (Array (_ BitVec 32) ValueCell!1533)) (size!3426 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1974 0))(
  ( (LongMapFixedSize!1975 (defaultEntry!3429 Int) (mask!8158 (_ BitVec 32)) (extraKeys!3170 (_ BitVec 32)) (zeroValue!3272 V!4651) (minValue!3272 V!4651) (_size!1036 (_ BitVec 32)) (_keys!5254 array!6603) (_values!3412 array!6605) (_vacant!1036 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1974)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6603 (_ BitVec 32)) Bool)

(assert (=> b!166357 (= res!79062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5254 thiss!1248) (mask!8158 thiss!1248)))))

(declare-fun b!166358 () Bool)

(declare-fun e!109134 () Bool)

(declare-fun e!109131 () Bool)

(declare-fun mapRes!6348 () Bool)

(assert (=> b!166358 (= e!109134 (and e!109131 mapRes!6348))))

(declare-fun condMapEmpty!6348 () Bool)

(declare-fun mapDefault!6348 () ValueCell!1533)

(assert (=> b!166358 (= condMapEmpty!6348 (= (arr!3138 (_values!3412 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1533)) mapDefault!6348)))))

(declare-fun b!166360 () Bool)

(declare-datatypes ((Unit!5058 0))(
  ( (Unit!5059) )
))
(declare-fun e!109137 () Unit!5058)

(declare-fun lt!83276 () Unit!5058)

(assert (=> b!166360 (= e!109137 lt!83276)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!86 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4651 V!4651 (_ BitVec 64) Int) Unit!5058)

(assert (=> b!166360 (= lt!83276 (lemmaInListMapThenSeekEntryOrOpenFindsIt!86 (_keys!5254 thiss!1248) (_values!3412 thiss!1248) (mask!8158 thiss!1248) (extraKeys!3170 thiss!1248) (zeroValue!3272 thiss!1248) (minValue!3272 thiss!1248) key!828 (defaultEntry!3429 thiss!1248)))))

(declare-fun res!79059 () Bool)

(declare-datatypes ((SeekEntryResult!454 0))(
  ( (MissingZero!454 (index!3984 (_ BitVec 32))) (Found!454 (index!3985 (_ BitVec 32))) (Intermediate!454 (undefined!1266 Bool) (index!3986 (_ BitVec 32)) (x!18426 (_ BitVec 32))) (Undefined!454) (MissingVacant!454 (index!3987 (_ BitVec 32))) )
))
(declare-fun lt!83278 () SeekEntryResult!454)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166360 (= res!79059 (inRange!0 (index!3985 lt!83278) (mask!8158 thiss!1248)))))

(declare-fun e!109132 () Bool)

(assert (=> b!166360 (=> (not res!79059) (not e!109132))))

(assert (=> b!166360 e!109132))

(declare-fun b!166361 () Bool)

(assert (=> b!166361 (= e!109136 false)))

(declare-fun lt!83274 () Bool)

(declare-datatypes ((List!2088 0))(
  ( (Nil!2085) (Cons!2084 (h!2701 (_ BitVec 64)) (t!6890 List!2088)) )
))
(declare-fun arrayNoDuplicates!0 (array!6603 (_ BitVec 32) List!2088) Bool)

(assert (=> b!166361 (= lt!83274 (arrayNoDuplicates!0 (_keys!5254 thiss!1248) #b00000000000000000000000000000000 Nil!2085))))

(declare-fun b!166362 () Bool)

(declare-fun tp_is_empty!3753 () Bool)

(assert (=> b!166362 (= e!109131 tp_is_empty!3753)))

(declare-fun mapNonEmpty!6348 () Bool)

(declare-fun tp!14453 () Bool)

(declare-fun e!109139 () Bool)

(assert (=> mapNonEmpty!6348 (= mapRes!6348 (and tp!14453 e!109139))))

(declare-fun mapKey!6348 () (_ BitVec 32))

(declare-fun mapValue!6348 () ValueCell!1533)

(declare-fun mapRest!6348 () (Array (_ BitVec 32) ValueCell!1533))

(assert (=> mapNonEmpty!6348 (= (arr!3138 (_values!3412 thiss!1248)) (store mapRest!6348 mapKey!6348 mapValue!6348))))

(declare-fun b!166363 () Bool)

(assert (=> b!166363 (= e!109139 tp_is_empty!3753)))

(declare-fun mapIsEmpty!6348 () Bool)

(assert (=> mapIsEmpty!6348 mapRes!6348))

(declare-fun e!109135 () Bool)

(declare-fun array_inv!2011 (array!6603) Bool)

(declare-fun array_inv!2012 (array!6605) Bool)

(assert (=> b!166364 (= e!109135 (and tp!14454 tp_is_empty!3753 (array_inv!2011 (_keys!5254 thiss!1248)) (array_inv!2012 (_values!3412 thiss!1248)) e!109134))))

(declare-fun b!166365 () Bool)

(assert (=> b!166365 (= e!109132 (= (select (arr!3137 (_keys!5254 thiss!1248)) (index!3985 lt!83278)) key!828))))

(declare-fun b!166366 () Bool)

(declare-fun e!109133 () Bool)

(assert (=> b!166366 (= e!109133 e!109136)))

(declare-fun res!79061 () Bool)

(assert (=> b!166366 (=> (not res!79061) (not e!109136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166366 (= res!79061 (validMask!0 (mask!8158 thiss!1248)))))

(declare-fun lt!83275 () Unit!5058)

(assert (=> b!166366 (= lt!83275 e!109137)))

(declare-fun c!30208 () Bool)

(declare-datatypes ((tuple2!3102 0))(
  ( (tuple2!3103 (_1!1562 (_ BitVec 64)) (_2!1562 V!4651)) )
))
(declare-datatypes ((List!2089 0))(
  ( (Nil!2086) (Cons!2085 (h!2702 tuple2!3102) (t!6891 List!2089)) )
))
(declare-datatypes ((ListLongMap!2057 0))(
  ( (ListLongMap!2058 (toList!1044 List!2089)) )
))
(declare-fun contains!1086 (ListLongMap!2057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!702 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4651 V!4651 (_ BitVec 32) Int) ListLongMap!2057)

(assert (=> b!166366 (= c!30208 (contains!1086 (getCurrentListMap!702 (_keys!5254 thiss!1248) (_values!3412 thiss!1248) (mask!8158 thiss!1248) (extraKeys!3170 thiss!1248) (zeroValue!3272 thiss!1248) (minValue!3272 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3429 thiss!1248)) key!828))))

(declare-fun b!166359 () Bool)

(assert (=> b!166359 (= e!109138 e!109133)))

(declare-fun res!79057 () Bool)

(assert (=> b!166359 (=> (not res!79057) (not e!109133))))

(get-info :version)

(assert (=> b!166359 (= res!79057 (and (not ((_ is Undefined!454) lt!83278)) (not ((_ is MissingVacant!454) lt!83278)) (not ((_ is MissingZero!454) lt!83278)) ((_ is Found!454) lt!83278)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6603 (_ BitVec 32)) SeekEntryResult!454)

(assert (=> b!166359 (= lt!83278 (seekEntryOrOpen!0 key!828 (_keys!5254 thiss!1248) (mask!8158 thiss!1248)))))

(declare-fun res!79058 () Bool)

(assert (=> start!16646 (=> (not res!79058) (not e!109138))))

(declare-fun valid!867 (LongMapFixedSize!1974) Bool)

(assert (=> start!16646 (= res!79058 (valid!867 thiss!1248))))

(assert (=> start!16646 e!109138))

(assert (=> start!16646 e!109135))

(assert (=> start!16646 true))

(declare-fun b!166367 () Bool)

(declare-fun Unit!5060 () Unit!5058)

(assert (=> b!166367 (= e!109137 Unit!5060)))

(declare-fun lt!83277 () Unit!5058)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!87 (array!6603 array!6605 (_ BitVec 32) (_ BitVec 32) V!4651 V!4651 (_ BitVec 64) Int) Unit!5058)

(assert (=> b!166367 (= lt!83277 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!87 (_keys!5254 thiss!1248) (_values!3412 thiss!1248) (mask!8158 thiss!1248) (extraKeys!3170 thiss!1248) (zeroValue!3272 thiss!1248) (minValue!3272 thiss!1248) key!828 (defaultEntry!3429 thiss!1248)))))

(assert (=> b!166367 false))

(declare-fun b!166368 () Bool)

(declare-fun res!79060 () Bool)

(assert (=> b!166368 (=> (not res!79060) (not e!109136))))

(assert (=> b!166368 (= res!79060 (and (= (size!3426 (_values!3412 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8158 thiss!1248))) (= (size!3425 (_keys!5254 thiss!1248)) (size!3426 (_values!3412 thiss!1248))) (bvsge (mask!8158 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3170 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3170 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16646 res!79058) b!166356))

(assert (= (and b!166356 res!79056) b!166359))

(assert (= (and b!166359 res!79057) b!166366))

(assert (= (and b!166366 c!30208) b!166360))

(assert (= (and b!166366 (not c!30208)) b!166367))

(assert (= (and b!166360 res!79059) b!166365))

(assert (= (and b!166366 res!79061) b!166368))

(assert (= (and b!166368 res!79060) b!166357))

(assert (= (and b!166357 res!79062) b!166361))

(assert (= (and b!166358 condMapEmpty!6348) mapIsEmpty!6348))

(assert (= (and b!166358 (not condMapEmpty!6348)) mapNonEmpty!6348))

(assert (= (and mapNonEmpty!6348 ((_ is ValueCellFull!1533) mapValue!6348)) b!166363))

(assert (= (and b!166358 ((_ is ValueCellFull!1533) mapDefault!6348)) b!166362))

(assert (= b!166364 b!166358))

(assert (= start!16646 b!166364))

(declare-fun m!195823 () Bool)

(assert (=> b!166359 m!195823))

(declare-fun m!195825 () Bool)

(assert (=> mapNonEmpty!6348 m!195825))

(declare-fun m!195827 () Bool)

(assert (=> b!166364 m!195827))

(declare-fun m!195829 () Bool)

(assert (=> b!166364 m!195829))

(declare-fun m!195831 () Bool)

(assert (=> b!166365 m!195831))

(declare-fun m!195833 () Bool)

(assert (=> b!166366 m!195833))

(declare-fun m!195835 () Bool)

(assert (=> b!166366 m!195835))

(assert (=> b!166366 m!195835))

(declare-fun m!195837 () Bool)

(assert (=> b!166366 m!195837))

(declare-fun m!195839 () Bool)

(assert (=> b!166357 m!195839))

(declare-fun m!195841 () Bool)

(assert (=> b!166361 m!195841))

(declare-fun m!195843 () Bool)

(assert (=> b!166360 m!195843))

(declare-fun m!195845 () Bool)

(assert (=> b!166360 m!195845))

(declare-fun m!195847 () Bool)

(assert (=> start!16646 m!195847))

(declare-fun m!195849 () Bool)

(assert (=> b!166367 m!195849))

(check-sat (not mapNonEmpty!6348) (not b!166361) (not b!166357) tp_is_empty!3753 (not b!166367) (not start!16646) (not b!166364) (not b!166360) (not b!166359) (not b_next!3951) (not b!166366) b_and!10365)
(check-sat b_and!10365 (not b_next!3951))
