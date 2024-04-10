; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16808 () Bool)

(assert start!16808)

(declare-fun b!169382 () Bool)

(declare-fun b_free!4127 () Bool)

(declare-fun b_next!4127 () Bool)

(assert (=> b!169382 (= b_free!4127 (not b_next!4127))))

(declare-fun tp!14985 () Bool)

(declare-fun b_and!10541 () Bool)

(assert (=> b!169382 (= tp!14985 b_and!10541)))

(declare-fun b!169390 () Bool)

(declare-fun b_free!4129 () Bool)

(declare-fun b_next!4129 () Bool)

(assert (=> b!169390 (= b_free!4129 (not b_next!4129))))

(declare-fun tp!14986 () Bool)

(declare-fun b_and!10543 () Bool)

(assert (=> b!169390 (= tp!14986 b_and!10543)))

(declare-fun b!169380 () Bool)

(declare-fun e!111596 () Bool)

(assert (=> b!169380 (= e!111596 false)))

(declare-fun lt!84902 () Bool)

(declare-datatypes ((V!4867 0))(
  ( (V!4868 (val!2002 Int)) )
))
(declare-datatypes ((ValueCell!1614 0))(
  ( (ValueCellFull!1614 (v!3867 V!4867)) (EmptyCell!1614) )
))
(declare-datatypes ((array!6927 0))(
  ( (array!6928 (arr!3299 (Array (_ BitVec 32) (_ BitVec 64))) (size!3587 (_ BitVec 32))) )
))
(declare-datatypes ((array!6929 0))(
  ( (array!6930 (arr!3300 (Array (_ BitVec 32) ValueCell!1614)) (size!3588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2136 0))(
  ( (LongMapFixedSize!2137 (defaultEntry!3510 Int) (mask!8293 (_ BitVec 32)) (extraKeys!3251 (_ BitVec 32)) (zeroValue!3353 V!4867) (minValue!3353 V!4867) (_size!1117 (_ BitVec 32)) (_keys!5335 array!6927) (_values!3493 array!6929) (_vacant!1117 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3214 0))(
  ( (tuple2!3215 (_1!1618 Bool) (_2!1618 LongMapFixedSize!2136)) )
))
(declare-fun lt!84904 () tuple2!3214)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3216 0))(
  ( (tuple2!3217 (_1!1619 (_ BitVec 64)) (_2!1619 V!4867)) )
))
(declare-datatypes ((List!2182 0))(
  ( (Nil!2179) (Cons!2178 (h!2795 tuple2!3216) (t!6984 List!2182)) )
))
(declare-datatypes ((ListLongMap!2157 0))(
  ( (ListLongMap!2158 (toList!1094 List!2182)) )
))
(declare-fun contains!1136 (ListLongMap!2157 (_ BitVec 64)) Bool)

(declare-fun map!1821 (LongMapFixedSize!2136) ListLongMap!2157)

(assert (=> b!169380 (= lt!84902 (contains!1136 (map!1821 (_2!1618 lt!84904)) key!828))))

(declare-fun b!169381 () Bool)

(declare-fun e!111593 () Bool)

(declare-fun e!111595 () Bool)

(declare-fun mapRes!6614 () Bool)

(assert (=> b!169381 (= e!111593 (and e!111595 mapRes!6614))))

(declare-fun condMapEmpty!6615 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2136)

(declare-fun mapDefault!6614 () ValueCell!1614)

(assert (=> b!169381 (= condMapEmpty!6615 (= (arr!3300 (_values!3493 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1614)) mapDefault!6614)))))

(declare-fun mapNonEmpty!6614 () Bool)

(declare-fun mapRes!6615 () Bool)

(declare-fun tp!14987 () Bool)

(declare-fun e!111602 () Bool)

(assert (=> mapNonEmpty!6614 (= mapRes!6615 (and tp!14987 e!111602))))

(declare-fun mapValue!6615 () ValueCell!1614)

(declare-fun mapKey!6615 () (_ BitVec 32))

(declare-fun err!67 () tuple2!3214)

(declare-fun mapRest!6614 () (Array (_ BitVec 32) ValueCell!1614))

(assert (=> mapNonEmpty!6614 (= (arr!3300 (_values!3493 (_2!1618 err!67))) (store mapRest!6614 mapKey!6615 mapValue!6615))))

(declare-fun mapIsEmpty!6614 () Bool)

(assert (=> mapIsEmpty!6614 mapRes!6614))

(declare-fun tp_is_empty!3915 () Bool)

(declare-fun e!111598 () Bool)

(declare-fun e!111603 () Bool)

(declare-fun array_inv!2119 (array!6927) Bool)

(declare-fun array_inv!2120 (array!6929) Bool)

(assert (=> b!169382 (= e!111598 (and tp!14985 tp_is_empty!3915 (array_inv!2119 (_keys!5335 (_2!1618 err!67))) (array_inv!2120 (_values!3493 (_2!1618 err!67))) e!111603))))

(declare-fun b!169383 () Bool)

(assert (=> b!169383 (= e!111602 tp_is_empty!3915)))

(declare-fun b!169384 () Bool)

(declare-fun e!111599 () Bool)

(assert (=> b!169384 (= e!111599 e!111596)))

(declare-fun res!80576 () Bool)

(assert (=> b!169384 (=> (not res!80576) (not e!111596))))

(declare-fun valid!922 (LongMapFixedSize!2136) Bool)

(assert (=> b!169384 (= res!80576 (valid!922 (_2!1618 lt!84904)))))

(assert (=> b!169384 (= lt!84904 err!67)))

(assert (=> b!169384 true))

(assert (=> b!169384 e!111598))

(declare-fun b!169385 () Bool)

(declare-fun res!80578 () Bool)

(assert (=> b!169385 (=> (not res!80578) (not e!111596))))

(assert (=> b!169385 (= res!80578 (_1!1618 lt!84904))))

(declare-fun b!169386 () Bool)

(declare-fun e!111605 () Bool)

(assert (=> b!169386 (= e!111605 tp_is_empty!3915)))

(declare-fun b!169387 () Bool)

(assert (=> b!169387 (= e!111603 (and e!111605 mapRes!6615))))

(declare-fun condMapEmpty!6614 () Bool)

(declare-fun mapDefault!6615 () ValueCell!1614)

(assert (=> b!169387 (= condMapEmpty!6614 (= (arr!3300 (_values!3493 (_2!1618 err!67))) ((as const (Array (_ BitVec 32) ValueCell!1614)) mapDefault!6615)))))

(declare-fun mapIsEmpty!6615 () Bool)

(assert (=> mapIsEmpty!6615 mapRes!6615))

(declare-fun res!80580 () Bool)

(declare-fun e!111594 () Bool)

(assert (=> start!16808 (=> (not res!80580) (not e!111594))))

(assert (=> start!16808 (= res!80580 (valid!922 thiss!1248))))

(assert (=> start!16808 e!111594))

(declare-fun e!111601 () Bool)

(assert (=> start!16808 e!111601))

(assert (=> start!16808 true))

(declare-fun b!169388 () Bool)

(assert (=> b!169388 (= e!111595 tp_is_empty!3915)))

(declare-fun b!169389 () Bool)

(declare-fun res!80579 () Bool)

(assert (=> b!169389 (=> (not res!80579) (not e!111594))))

(assert (=> b!169389 (= res!80579 (not (= key!828 (bvneg key!828))))))

(assert (=> b!169390 (= e!111601 (and tp!14986 tp_is_empty!3915 (array_inv!2119 (_keys!5335 thiss!1248)) (array_inv!2120 (_values!3493 thiss!1248)) e!111593))))

(declare-fun b!169391 () Bool)

(declare-fun e!111604 () Bool)

(assert (=> b!169391 (= e!111604 tp_is_empty!3915)))

(declare-fun b!169392 () Bool)

(assert (=> b!169392 (= e!111594 e!111599)))

(declare-fun res!80577 () Bool)

(assert (=> b!169392 (=> (not res!80577) (not e!111599))))

(declare-datatypes ((SeekEntryResult!523 0))(
  ( (MissingZero!523 (index!4260 (_ BitVec 32))) (Found!523 (index!4261 (_ BitVec 32))) (Intermediate!523 (undefined!1335 Bool) (index!4262 (_ BitVec 32)) (x!18711 (_ BitVec 32))) (Undefined!523) (MissingVacant!523 (index!4263 (_ BitVec 32))) )
))
(declare-fun lt!84903 () SeekEntryResult!523)

(get-info :version)

(assert (=> b!169392 (= res!80577 (and (not ((_ is Undefined!523) lt!84903)) (not ((_ is MissingVacant!523) lt!84903)) (not ((_ is MissingZero!523) lt!84903)) (not ((_ is Found!523) lt!84903))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6927 (_ BitVec 32)) SeekEntryResult!523)

(assert (=> b!169392 (= lt!84903 (seekEntryOrOpen!0 key!828 (_keys!5335 thiss!1248) (mask!8293 thiss!1248)))))

(declare-fun mapNonEmpty!6615 () Bool)

(declare-fun tp!14988 () Bool)

(assert (=> mapNonEmpty!6615 (= mapRes!6614 (and tp!14988 e!111604))))

(declare-fun mapValue!6614 () ValueCell!1614)

(declare-fun mapKey!6614 () (_ BitVec 32))

(declare-fun mapRest!6615 () (Array (_ BitVec 32) ValueCell!1614))

(assert (=> mapNonEmpty!6615 (= (arr!3300 (_values!3493 thiss!1248)) (store mapRest!6615 mapKey!6614 mapValue!6614))))

(assert (= (and start!16808 res!80580) b!169389))

(assert (= (and b!169389 res!80579) b!169392))

(assert (= (and b!169392 res!80577) b!169384))

(assert (= (and b!169387 condMapEmpty!6614) mapIsEmpty!6615))

(assert (= (and b!169387 (not condMapEmpty!6614)) mapNonEmpty!6614))

(assert (= (and mapNonEmpty!6614 ((_ is ValueCellFull!1614) mapValue!6615)) b!169383))

(assert (= (and b!169387 ((_ is ValueCellFull!1614) mapDefault!6615)) b!169386))

(assert (= b!169382 b!169387))

(assert (= b!169384 b!169382))

(assert (= (and b!169384 res!80576) b!169385))

(assert (= (and b!169385 res!80578) b!169380))

(assert (= (and b!169381 condMapEmpty!6615) mapIsEmpty!6614))

(assert (= (and b!169381 (not condMapEmpty!6615)) mapNonEmpty!6615))

(assert (= (and mapNonEmpty!6615 ((_ is ValueCellFull!1614) mapValue!6614)) b!169391))

(assert (= (and b!169381 ((_ is ValueCellFull!1614) mapDefault!6614)) b!169388))

(assert (= b!169390 b!169381))

(assert (= start!16808 b!169390))

(declare-fun m!198421 () Bool)

(assert (=> mapNonEmpty!6615 m!198421))

(declare-fun m!198423 () Bool)

(assert (=> b!169382 m!198423))

(declare-fun m!198425 () Bool)

(assert (=> b!169382 m!198425))

(declare-fun m!198427 () Bool)

(assert (=> start!16808 m!198427))

(declare-fun m!198429 () Bool)

(assert (=> b!169380 m!198429))

(assert (=> b!169380 m!198429))

(declare-fun m!198431 () Bool)

(assert (=> b!169380 m!198431))

(declare-fun m!198433 () Bool)

(assert (=> b!169392 m!198433))

(declare-fun m!198435 () Bool)

(assert (=> mapNonEmpty!6614 m!198435))

(declare-fun m!198437 () Bool)

(assert (=> b!169384 m!198437))

(declare-fun m!198439 () Bool)

(assert (=> b!169390 m!198439))

(declare-fun m!198441 () Bool)

(assert (=> b!169390 m!198441))

(check-sat b_and!10541 (not b!169392) tp_is_empty!3915 (not b_next!4129) (not b!169390) (not b!169382) (not b_next!4127) b_and!10543 (not start!16808) (not mapNonEmpty!6615) (not b!169380) (not mapNonEmpty!6614) (not b!169384))
(check-sat b_and!10541 b_and!10543 (not b_next!4129) (not b_next!4127))
