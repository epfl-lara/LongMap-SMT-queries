; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16804 () Bool)

(assert start!16804)

(declare-fun b!169273 () Bool)

(declare-fun b_free!4111 () Bool)

(declare-fun b_next!4111 () Bool)

(assert (=> b!169273 (= b_free!4111 (not b_next!4111))))

(declare-fun tp!14937 () Bool)

(declare-fun b_and!10539 () Bool)

(assert (=> b!169273 (= tp!14937 b_and!10539)))

(declare-fun b!169280 () Bool)

(declare-fun b_free!4113 () Bool)

(declare-fun b_next!4113 () Bool)

(assert (=> b!169280 (= b_free!4113 (not b_next!4113))))

(declare-fun tp!14938 () Bool)

(declare-fun b_and!10541 () Bool)

(assert (=> b!169280 (= tp!14938 b_and!10541)))

(declare-fun b!169271 () Bool)

(declare-fun res!80539 () Bool)

(declare-fun e!111462 () Bool)

(assert (=> b!169271 (=> (not res!80539) (not e!111462))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169271 (= res!80539 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169272 () Bool)

(declare-fun e!111470 () Bool)

(declare-fun e!111465 () Bool)

(declare-fun mapRes!6590 () Bool)

(assert (=> b!169272 (= e!111470 (and e!111465 mapRes!6590))))

(declare-fun condMapEmpty!6590 () Bool)

(declare-datatypes ((V!4857 0))(
  ( (V!4858 (val!1998 Int)) )
))
(declare-datatypes ((ValueCell!1610 0))(
  ( (ValueCellFull!1610 (v!3864 V!4857)) (EmptyCell!1610) )
))
(declare-datatypes ((array!6897 0))(
  ( (array!6898 (arr!3284 (Array (_ BitVec 32) (_ BitVec 64))) (size!3572 (_ BitVec 32))) )
))
(declare-datatypes ((array!6899 0))(
  ( (array!6900 (arr!3285 (Array (_ BitVec 32) ValueCell!1610)) (size!3573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2128 0))(
  ( (LongMapFixedSize!2129 (defaultEntry!3506 Int) (mask!8287 (_ BitVec 32)) (extraKeys!3247 (_ BitVec 32)) (zeroValue!3349 V!4857) (minValue!3349 V!4857) (_size!1113 (_ BitVec 32)) (_keys!5331 array!6897) (_values!3489 array!6899) (_vacant!1113 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2128)

(declare-fun mapDefault!6590 () ValueCell!1610)

(assert (=> b!169272 (= condMapEmpty!6590 (= (arr!3285 (_values!3489 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1610)) mapDefault!6590)))))

(declare-fun e!111464 () Bool)

(declare-datatypes ((tuple2!3168 0))(
  ( (tuple2!3169 (_1!1595 Bool) (_2!1595 LongMapFixedSize!2128)) )
))
(declare-fun err!51 () tuple2!3168)

(declare-fun tp_is_empty!3907 () Bool)

(declare-fun e!111466 () Bool)

(declare-fun array_inv!2103 (array!6897) Bool)

(declare-fun array_inv!2104 (array!6899) Bool)

(assert (=> b!169273 (= e!111464 (and tp!14937 tp_is_empty!3907 (array_inv!2103 (_keys!5331 (_2!1595 err!51))) (array_inv!2104 (_values!3489 (_2!1595 err!51))) e!111466))))

(declare-fun b!169274 () Bool)

(declare-fun e!111461 () Bool)

(assert (=> b!169274 (= e!111461 tp_is_empty!3907)))

(declare-fun b!169275 () Bool)

(declare-fun res!80538 () Bool)

(declare-fun e!111473 () Bool)

(assert (=> b!169275 (=> (not res!80538) (not e!111473))))

(declare-fun lt!84926 () tuple2!3168)

(assert (=> b!169275 (= res!80538 (_1!1595 lt!84926))))

(declare-fun mapNonEmpty!6590 () Bool)

(declare-fun tp!14939 () Bool)

(declare-fun e!111468 () Bool)

(assert (=> mapNonEmpty!6590 (= mapRes!6590 (and tp!14939 e!111468))))

(declare-fun mapKey!6591 () (_ BitVec 32))

(declare-fun mapValue!6591 () ValueCell!1610)

(declare-fun mapRest!6591 () (Array (_ BitVec 32) ValueCell!1610))

(assert (=> mapNonEmpty!6590 (= (arr!3285 (_values!3489 thiss!1248)) (store mapRest!6591 mapKey!6591 mapValue!6591))))

(declare-fun b!169276 () Bool)

(assert (=> b!169276 (= e!111465 tp_is_empty!3907)))

(declare-fun mapIsEmpty!6590 () Bool)

(declare-fun mapRes!6591 () Bool)

(assert (=> mapIsEmpty!6590 mapRes!6591))

(declare-fun b!169277 () Bool)

(assert (=> b!169277 (= e!111468 tp_is_empty!3907)))

(declare-fun b!169278 () Bool)

(declare-fun e!111469 () Bool)

(assert (=> b!169278 (= e!111469 tp_is_empty!3907)))

(declare-fun b!169279 () Bool)

(assert (=> b!169279 (= e!111473 false)))

(declare-fun lt!84925 () Bool)

(declare-datatypes ((tuple2!3170 0))(
  ( (tuple2!3171 (_1!1596 (_ BitVec 64)) (_2!1596 V!4857)) )
))
(declare-datatypes ((List!2162 0))(
  ( (Nil!2159) (Cons!2158 (h!2775 tuple2!3170) (t!6956 List!2162)) )
))
(declare-datatypes ((ListLongMap!2123 0))(
  ( (ListLongMap!2124 (toList!1077 List!2162)) )
))
(declare-fun contains!1129 (ListLongMap!2123 (_ BitVec 64)) Bool)

(declare-fun map!1810 (LongMapFixedSize!2128) ListLongMap!2123)

(assert (=> b!169279 (= lt!84925 (contains!1129 (map!1810 (_2!1595 lt!84926)) key!828))))

(declare-fun e!111471 () Bool)

(assert (=> b!169280 (= e!111471 (and tp!14938 tp_is_empty!3907 (array_inv!2103 (_keys!5331 thiss!1248)) (array_inv!2104 (_values!3489 thiss!1248)) e!111470))))

(declare-fun b!169281 () Bool)

(assert (=> b!169281 (= e!111466 (and e!111469 mapRes!6591))))

(declare-fun condMapEmpty!6591 () Bool)

(declare-fun mapDefault!6591 () ValueCell!1610)

(assert (=> b!169281 (= condMapEmpty!6591 (= (arr!3285 (_values!3489 (_2!1595 err!51))) ((as const (Array (_ BitVec 32) ValueCell!1610)) mapDefault!6591)))))

(declare-fun b!169282 () Bool)

(declare-fun e!111472 () Bool)

(assert (=> b!169282 (= e!111462 e!111472)))

(declare-fun res!80540 () Bool)

(assert (=> b!169282 (=> (not res!80540) (not e!111472))))

(declare-datatypes ((SeekEntryResult!512 0))(
  ( (MissingZero!512 (index!4216 (_ BitVec 32))) (Found!512 (index!4217 (_ BitVec 32))) (Intermediate!512 (undefined!1324 Bool) (index!4218 (_ BitVec 32)) (x!18692 (_ BitVec 32))) (Undefined!512) (MissingVacant!512 (index!4219 (_ BitVec 32))) )
))
(declare-fun lt!84927 () SeekEntryResult!512)

(get-info :version)

(assert (=> b!169282 (= res!80540 (and (not ((_ is Undefined!512) lt!84927)) (not ((_ is MissingVacant!512) lt!84927)) (not ((_ is MissingZero!512) lt!84927)) (not ((_ is Found!512) lt!84927))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6897 (_ BitVec 32)) SeekEntryResult!512)

(assert (=> b!169282 (= lt!84927 (seekEntryOrOpen!0 key!828 (_keys!5331 thiss!1248) (mask!8287 thiss!1248)))))

(declare-fun mapIsEmpty!6591 () Bool)

(assert (=> mapIsEmpty!6591 mapRes!6590))

(declare-fun b!169283 () Bool)

(assert (=> b!169283 (= e!111472 e!111473)))

(declare-fun res!80537 () Bool)

(assert (=> b!169283 (=> (not res!80537) (not e!111473))))

(declare-fun valid!929 (LongMapFixedSize!2128) Bool)

(assert (=> b!169283 (= res!80537 (valid!929 (_2!1595 lt!84926)))))

(assert (=> b!169283 (= lt!84926 err!51)))

(assert (=> b!169283 true))

(assert (=> b!169283 e!111464))

(declare-fun res!80541 () Bool)

(assert (=> start!16804 (=> (not res!80541) (not e!111462))))

(assert (=> start!16804 (= res!80541 (valid!929 thiss!1248))))

(assert (=> start!16804 e!111462))

(assert (=> start!16804 e!111471))

(assert (=> start!16804 true))

(declare-fun mapNonEmpty!6591 () Bool)

(declare-fun tp!14940 () Bool)

(assert (=> mapNonEmpty!6591 (= mapRes!6591 (and tp!14940 e!111461))))

(declare-fun mapRest!6590 () (Array (_ BitVec 32) ValueCell!1610))

(declare-fun mapValue!6590 () ValueCell!1610)

(declare-fun mapKey!6590 () (_ BitVec 32))

(assert (=> mapNonEmpty!6591 (= (arr!3285 (_values!3489 (_2!1595 err!51))) (store mapRest!6590 mapKey!6590 mapValue!6590))))

(assert (= (and start!16804 res!80541) b!169271))

(assert (= (and b!169271 res!80539) b!169282))

(assert (= (and b!169282 res!80540) b!169283))

(assert (= (and b!169281 condMapEmpty!6591) mapIsEmpty!6590))

(assert (= (and b!169281 (not condMapEmpty!6591)) mapNonEmpty!6591))

(assert (= (and mapNonEmpty!6591 ((_ is ValueCellFull!1610) mapValue!6590)) b!169274))

(assert (= (and b!169281 ((_ is ValueCellFull!1610) mapDefault!6591)) b!169278))

(assert (= b!169273 b!169281))

(assert (= b!169283 b!169273))

(assert (= (and b!169283 res!80537) b!169275))

(assert (= (and b!169275 res!80538) b!169279))

(assert (= (and b!169272 condMapEmpty!6590) mapIsEmpty!6591))

(assert (= (and b!169272 (not condMapEmpty!6590)) mapNonEmpty!6590))

(assert (= (and mapNonEmpty!6590 ((_ is ValueCellFull!1610) mapValue!6591)) b!169277))

(assert (= (and b!169272 ((_ is ValueCellFull!1610) mapDefault!6590)) b!169276))

(assert (= b!169280 b!169272))

(assert (= start!16804 b!169280))

(declare-fun m!198515 () Bool)

(assert (=> b!169280 m!198515))

(declare-fun m!198517 () Bool)

(assert (=> b!169280 m!198517))

(declare-fun m!198519 () Bool)

(assert (=> b!169279 m!198519))

(assert (=> b!169279 m!198519))

(declare-fun m!198521 () Bool)

(assert (=> b!169279 m!198521))

(declare-fun m!198523 () Bool)

(assert (=> b!169273 m!198523))

(declare-fun m!198525 () Bool)

(assert (=> b!169273 m!198525))

(declare-fun m!198527 () Bool)

(assert (=> b!169282 m!198527))

(declare-fun m!198529 () Bool)

(assert (=> mapNonEmpty!6590 m!198529))

(declare-fun m!198531 () Bool)

(assert (=> start!16804 m!198531))

(declare-fun m!198533 () Bool)

(assert (=> mapNonEmpty!6591 m!198533))

(declare-fun m!198535 () Bool)

(assert (=> b!169283 m!198535))

(check-sat (not b_next!4111) (not b_next!4113) b_and!10541 (not b!169282) (not b!169283) (not b!169280) (not mapNonEmpty!6591) (not mapNonEmpty!6590) (not b!169273) (not start!16804) (not b!169279) tp_is_empty!3907 b_and!10539)
(check-sat b_and!10539 b_and!10541 (not b_next!4113) (not b_next!4111))
