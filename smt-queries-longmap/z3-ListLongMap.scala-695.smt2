; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16678 () Bool)

(assert start!16678)

(declare-fun b!166955 () Bool)

(declare-fun b_free!3979 () Bool)

(declare-fun b_next!3979 () Bool)

(assert (=> b!166955 (= b_free!3979 (not b_next!3979))))

(declare-fun tp!14538 () Bool)

(declare-fun b_and!10407 () Bool)

(assert (=> b!166955 (= tp!14538 b_and!10407)))

(declare-fun b!166949 () Bool)

(declare-fun res!79372 () Bool)

(declare-fun e!109578 () Bool)

(assert (=> b!166949 (=> (not res!79372) (not e!109578))))

(declare-datatypes ((V!4689 0))(
  ( (V!4690 (val!1935 Int)) )
))
(declare-datatypes ((ValueCell!1547 0))(
  ( (ValueCellFull!1547 (v!3801 V!4689)) (EmptyCell!1547) )
))
(declare-datatypes ((array!6645 0))(
  ( (array!6646 (arr!3158 (Array (_ BitVec 32) (_ BitVec 64))) (size!3446 (_ BitVec 32))) )
))
(declare-datatypes ((array!6647 0))(
  ( (array!6648 (arr!3159 (Array (_ BitVec 32) ValueCell!1547)) (size!3447 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2002 0))(
  ( (LongMapFixedSize!2003 (defaultEntry!3443 Int) (mask!8182 (_ BitVec 32)) (extraKeys!3184 (_ BitVec 32)) (zeroValue!3286 V!4689) (minValue!3286 V!4689) (_size!1050 (_ BitVec 32)) (_keys!5268 array!6645) (_values!3426 array!6647) (_vacant!1050 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2002)

(assert (=> b!166949 (= res!79372 (and (= (size!3447 (_values!3426 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8182 thiss!1248))) (= (size!3446 (_keys!5268 thiss!1248)) (size!3447 (_values!3426 thiss!1248))) (bvsge (mask!8182 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3184 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3184 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166950 () Bool)

(declare-fun res!79374 () Bool)

(declare-fun e!109580 () Bool)

(assert (=> b!166950 (=> (not res!79374) (not e!109580))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166950 (= res!79374 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6390 () Bool)

(declare-fun mapRes!6390 () Bool)

(assert (=> mapIsEmpty!6390 mapRes!6390))

(declare-fun res!79376 () Bool)

(assert (=> start!16678 (=> (not res!79376) (not e!109580))))

(declare-fun valid!889 (LongMapFixedSize!2002) Bool)

(assert (=> start!16678 (= res!79376 (valid!889 thiss!1248))))

(assert (=> start!16678 e!109580))

(declare-fun e!109577 () Bool)

(assert (=> start!16678 e!109577))

(assert (=> start!16678 true))

(declare-fun b!166951 () Bool)

(declare-fun e!109574 () Bool)

(assert (=> b!166951 (= e!109580 e!109574)))

(declare-fun res!79377 () Bool)

(assert (=> b!166951 (=> (not res!79377) (not e!109574))))

(declare-datatypes ((SeekEntryResult!462 0))(
  ( (MissingZero!462 (index!4016 (_ BitVec 32))) (Found!462 (index!4017 (_ BitVec 32))) (Intermediate!462 (undefined!1274 Bool) (index!4018 (_ BitVec 32)) (x!18474 (_ BitVec 32))) (Undefined!462) (MissingVacant!462 (index!4019 (_ BitVec 32))) )
))
(declare-fun lt!83547 () SeekEntryResult!462)

(get-info :version)

(assert (=> b!166951 (= res!79377 (and (not ((_ is Undefined!462) lt!83547)) (not ((_ is MissingVacant!462) lt!83547)) (not ((_ is MissingZero!462) lt!83547)) ((_ is Found!462) lt!83547)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6645 (_ BitVec 32)) SeekEntryResult!462)

(assert (=> b!166951 (= lt!83547 (seekEntryOrOpen!0 key!828 (_keys!5268 thiss!1248) (mask!8182 thiss!1248)))))

(declare-fun b!166952 () Bool)

(declare-fun e!109576 () Bool)

(declare-fun tp_is_empty!3781 () Bool)

(assert (=> b!166952 (= e!109576 tp_is_empty!3781)))

(declare-fun b!166953 () Bool)

(declare-datatypes ((Unit!5106 0))(
  ( (Unit!5107) )
))
(declare-fun e!109581 () Unit!5106)

(declare-fun lt!83544 () Unit!5106)

(assert (=> b!166953 (= e!109581 lt!83544)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!99 (array!6645 array!6647 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 64) Int) Unit!5106)

(assert (=> b!166953 (= lt!83544 (lemmaInListMapThenSeekEntryOrOpenFindsIt!99 (_keys!5268 thiss!1248) (_values!3426 thiss!1248) (mask!8182 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) key!828 (defaultEntry!3443 thiss!1248)))))

(declare-fun res!79373 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166953 (= res!79373 (inRange!0 (index!4017 lt!83547) (mask!8182 thiss!1248)))))

(declare-fun e!109582 () Bool)

(assert (=> b!166953 (=> (not res!79373) (not e!109582))))

(assert (=> b!166953 e!109582))

(declare-fun b!166954 () Bool)

(declare-fun e!109579 () Bool)

(assert (=> b!166954 (= e!109579 (and e!109576 mapRes!6390))))

(declare-fun condMapEmpty!6390 () Bool)

(declare-fun mapDefault!6390 () ValueCell!1547)

(assert (=> b!166954 (= condMapEmpty!6390 (= (arr!3159 (_values!3426 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1547)) mapDefault!6390)))))

(declare-fun array_inv!2017 (array!6645) Bool)

(declare-fun array_inv!2018 (array!6647) Bool)

(assert (=> b!166955 (= e!109577 (and tp!14538 tp_is_empty!3781 (array_inv!2017 (_keys!5268 thiss!1248)) (array_inv!2018 (_values!3426 thiss!1248)) e!109579))))

(declare-fun b!166956 () Bool)

(declare-fun res!79371 () Bool)

(assert (=> b!166956 (=> (not res!79371) (not e!109578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6645 (_ BitVec 32)) Bool)

(assert (=> b!166956 (= res!79371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5268 thiss!1248) (mask!8182 thiss!1248)))))

(declare-fun b!166957 () Bool)

(assert (=> b!166957 (= e!109578 false)))

(declare-fun lt!83545 () Bool)

(declare-datatypes ((List!2094 0))(
  ( (Nil!2091) (Cons!2090 (h!2707 (_ BitVec 64)) (t!6888 List!2094)) )
))
(declare-fun arrayNoDuplicates!0 (array!6645 (_ BitVec 32) List!2094) Bool)

(assert (=> b!166957 (= lt!83545 (arrayNoDuplicates!0 (_keys!5268 thiss!1248) #b00000000000000000000000000000000 Nil!2091))))

(declare-fun b!166958 () Bool)

(assert (=> b!166958 (= e!109574 e!109578)))

(declare-fun res!79375 () Bool)

(assert (=> b!166958 (=> (not res!79375) (not e!109578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166958 (= res!79375 (validMask!0 (mask!8182 thiss!1248)))))

(declare-fun lt!83543 () Unit!5106)

(assert (=> b!166958 (= lt!83543 e!109581)))

(declare-fun c!30263 () Bool)

(declare-datatypes ((tuple2!3076 0))(
  ( (tuple2!3077 (_1!1549 (_ BitVec 64)) (_2!1549 V!4689)) )
))
(declare-datatypes ((List!2095 0))(
  ( (Nil!2092) (Cons!2091 (h!2708 tuple2!3076) (t!6889 List!2095)) )
))
(declare-datatypes ((ListLongMap!2037 0))(
  ( (ListLongMap!2038 (toList!1034 List!2095)) )
))
(declare-fun contains!1086 (ListLongMap!2037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!696 (array!6645 array!6647 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 32) Int) ListLongMap!2037)

(assert (=> b!166958 (= c!30263 (contains!1086 (getCurrentListMap!696 (_keys!5268 thiss!1248) (_values!3426 thiss!1248) (mask!8182 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3443 thiss!1248)) key!828))))

(declare-fun b!166959 () Bool)

(declare-fun e!109575 () Bool)

(assert (=> b!166959 (= e!109575 tp_is_empty!3781)))

(declare-fun mapNonEmpty!6390 () Bool)

(declare-fun tp!14537 () Bool)

(assert (=> mapNonEmpty!6390 (= mapRes!6390 (and tp!14537 e!109575))))

(declare-fun mapKey!6390 () (_ BitVec 32))

(declare-fun mapRest!6390 () (Array (_ BitVec 32) ValueCell!1547))

(declare-fun mapValue!6390 () ValueCell!1547)

(assert (=> mapNonEmpty!6390 (= (arr!3159 (_values!3426 thiss!1248)) (store mapRest!6390 mapKey!6390 mapValue!6390))))

(declare-fun b!166960 () Bool)

(declare-fun Unit!5108 () Unit!5106)

(assert (=> b!166960 (= e!109581 Unit!5108)))

(declare-fun lt!83546 () Unit!5106)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!96 (array!6645 array!6647 (_ BitVec 32) (_ BitVec 32) V!4689 V!4689 (_ BitVec 64) Int) Unit!5106)

(assert (=> b!166960 (= lt!83546 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!96 (_keys!5268 thiss!1248) (_values!3426 thiss!1248) (mask!8182 thiss!1248) (extraKeys!3184 thiss!1248) (zeroValue!3286 thiss!1248) (minValue!3286 thiss!1248) key!828 (defaultEntry!3443 thiss!1248)))))

(assert (=> b!166960 false))

(declare-fun b!166961 () Bool)

(assert (=> b!166961 (= e!109582 (= (select (arr!3158 (_keys!5268 thiss!1248)) (index!4017 lt!83547)) key!828))))

(assert (= (and start!16678 res!79376) b!166950))

(assert (= (and b!166950 res!79374) b!166951))

(assert (= (and b!166951 res!79377) b!166958))

(assert (= (and b!166958 c!30263) b!166953))

(assert (= (and b!166958 (not c!30263)) b!166960))

(assert (= (and b!166953 res!79373) b!166961))

(assert (= (and b!166958 res!79375) b!166949))

(assert (= (and b!166949 res!79372) b!166956))

(assert (= (and b!166956 res!79371) b!166957))

(assert (= (and b!166954 condMapEmpty!6390) mapIsEmpty!6390))

(assert (= (and b!166954 (not condMapEmpty!6390)) mapNonEmpty!6390))

(assert (= (and mapNonEmpty!6390 ((_ is ValueCellFull!1547) mapValue!6390)) b!166959))

(assert (= (and b!166954 ((_ is ValueCellFull!1547) mapDefault!6390)) b!166952))

(assert (= b!166955 b!166954))

(assert (= start!16678 b!166955))

(declare-fun m!196397 () Bool)

(assert (=> b!166960 m!196397))

(declare-fun m!196399 () Bool)

(assert (=> mapNonEmpty!6390 m!196399))

(declare-fun m!196401 () Bool)

(assert (=> start!16678 m!196401))

(declare-fun m!196403 () Bool)

(assert (=> b!166957 m!196403))

(declare-fun m!196405 () Bool)

(assert (=> b!166961 m!196405))

(declare-fun m!196407 () Bool)

(assert (=> b!166953 m!196407))

(declare-fun m!196409 () Bool)

(assert (=> b!166953 m!196409))

(declare-fun m!196411 () Bool)

(assert (=> b!166951 m!196411))

(declare-fun m!196413 () Bool)

(assert (=> b!166958 m!196413))

(declare-fun m!196415 () Bool)

(assert (=> b!166958 m!196415))

(assert (=> b!166958 m!196415))

(declare-fun m!196417 () Bool)

(assert (=> b!166958 m!196417))

(declare-fun m!196419 () Bool)

(assert (=> b!166956 m!196419))

(declare-fun m!196421 () Bool)

(assert (=> b!166955 m!196421))

(declare-fun m!196423 () Bool)

(assert (=> b!166955 m!196423))

(check-sat (not b!166960) (not b!166957) (not start!16678) (not b_next!3979) (not b!166955) (not b!166958) (not b!166953) tp_is_empty!3781 (not b!166951) b_and!10407 (not b!166956) (not mapNonEmpty!6390))
(check-sat b_and!10407 (not b_next!3979))
