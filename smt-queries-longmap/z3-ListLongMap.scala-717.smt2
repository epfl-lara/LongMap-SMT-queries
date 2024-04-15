; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16810 () Bool)

(assert start!16810)

(declare-fun b!169196 () Bool)

(declare-fun b_free!4123 () Bool)

(declare-fun b_next!4123 () Bool)

(assert (=> b!169196 (= b_free!4123 (not b_next!4123))))

(declare-fun tp!14975 () Bool)

(declare-fun b_and!10511 () Bool)

(assert (=> b!169196 (= tp!14975 b_and!10511)))

(declare-fun b!169204 () Bool)

(declare-fun b_free!4125 () Bool)

(declare-fun b_next!4125 () Bool)

(assert (=> b!169204 (= b_free!4125 (not b_next!4125))))

(declare-fun tp!14973 () Bool)

(declare-fun b_and!10513 () Bool)

(assert (=> b!169204 (= tp!14973 b_and!10513)))

(declare-fun b!169194 () Bool)

(declare-fun e!111463 () Bool)

(declare-fun tp_is_empty!3913 () Bool)

(assert (=> b!169194 (= e!111463 tp_is_empty!3913)))

(declare-fun mapIsEmpty!6608 () Bool)

(declare-fun mapRes!6608 () Bool)

(assert (=> mapIsEmpty!6608 mapRes!6608))

(declare-fun b!169195 () Bool)

(declare-fun res!80470 () Bool)

(declare-fun e!111457 () Bool)

(assert (=> b!169195 (=> (not res!80470) (not e!111457))))

(declare-datatypes ((V!4865 0))(
  ( (V!4866 (val!2001 Int)) )
))
(declare-datatypes ((ValueCell!1613 0))(
  ( (ValueCellFull!1613 (v!3860 V!4865)) (EmptyCell!1613) )
))
(declare-datatypes ((array!6903 0))(
  ( (array!6904 (arr!3286 (Array (_ BitVec 32) (_ BitVec 64))) (size!3575 (_ BitVec 32))) )
))
(declare-datatypes ((array!6905 0))(
  ( (array!6906 (arr!3287 (Array (_ BitVec 32) ValueCell!1613)) (size!3576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2134 0))(
  ( (LongMapFixedSize!2135 (defaultEntry!3509 Int) (mask!8291 (_ BitVec 32)) (extraKeys!3250 (_ BitVec 32)) (zeroValue!3352 V!4865) (minValue!3352 V!4865) (_size!1116 (_ BitVec 32)) (_keys!5333 array!6903) (_values!3492 array!6905) (_vacant!1116 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3214 0))(
  ( (tuple2!3215 (_1!1618 Bool) (_2!1618 LongMapFixedSize!2134)) )
))
(declare-fun lt!84713 () tuple2!3214)

(assert (=> b!169195 (= res!80470 (_1!1618 lt!84713))))

(declare-fun e!111453 () Bool)

(declare-fun err!63 () tuple2!3214)

(declare-fun e!111456 () Bool)

(declare-fun array_inv!2113 (array!6903) Bool)

(declare-fun array_inv!2114 (array!6905) Bool)

(assert (=> b!169196 (= e!111456 (and tp!14975 tp_is_empty!3913 (array_inv!2113 (_keys!5333 (_2!1618 err!63))) (array_inv!2114 (_values!3492 (_2!1618 err!63))) e!111453))))

(declare-fun b!169197 () Bool)

(declare-fun e!111458 () Bool)

(assert (=> b!169197 (= e!111453 (and e!111458 mapRes!6608))))

(declare-fun condMapEmpty!6608 () Bool)

(declare-fun mapDefault!6608 () ValueCell!1613)

(assert (=> b!169197 (= condMapEmpty!6608 (= (arr!3287 (_values!3492 (_2!1618 err!63))) ((as const (Array (_ BitVec 32) ValueCell!1613)) mapDefault!6608)))))

(declare-fun b!169198 () Bool)

(declare-fun e!111465 () Bool)

(assert (=> b!169198 (= e!111465 tp_is_empty!3913)))

(declare-fun b!169199 () Bool)

(declare-fun e!111455 () Bool)

(declare-fun e!111461 () Bool)

(assert (=> b!169199 (= e!111455 e!111461)))

(declare-fun res!80467 () Bool)

(assert (=> b!169199 (=> (not res!80467) (not e!111461))))

(declare-datatypes ((SeekEntryResult!535 0))(
  ( (MissingZero!535 (index!4308 (_ BitVec 32))) (Found!535 (index!4309 (_ BitVec 32))) (Intermediate!535 (undefined!1347 Bool) (index!4310 (_ BitVec 32)) (x!18722 (_ BitVec 32))) (Undefined!535) (MissingVacant!535 (index!4311 (_ BitVec 32))) )
))
(declare-fun lt!84712 () SeekEntryResult!535)

(get-info :version)

(assert (=> b!169199 (= res!80467 (and (not ((_ is Undefined!535) lt!84712)) (not ((_ is MissingVacant!535) lt!84712)) (not ((_ is MissingZero!535) lt!84712)) (not ((_ is Found!535) lt!84712))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!2134)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6903 (_ BitVec 32)) SeekEntryResult!535)

(assert (=> b!169199 (= lt!84712 (seekEntryOrOpen!0 key!828 (_keys!5333 thiss!1248) (mask!8291 thiss!1248)))))

(declare-fun b!169200 () Bool)

(assert (=> b!169200 (= e!111458 tp_is_empty!3913)))

(declare-fun res!80468 () Bool)

(assert (=> start!16810 (=> (not res!80468) (not e!111455))))

(declare-fun valid!935 (LongMapFixedSize!2134) Bool)

(assert (=> start!16810 (= res!80468 (valid!935 thiss!1248))))

(assert (=> start!16810 e!111455))

(declare-fun e!111459 () Bool)

(assert (=> start!16810 e!111459))

(assert (=> start!16810 true))

(declare-fun b!169201 () Bool)

(assert (=> b!169201 (= e!111457 false)))

(declare-fun lt!84714 () Bool)

(declare-datatypes ((tuple2!3216 0))(
  ( (tuple2!3217 (_1!1619 (_ BitVec 64)) (_2!1619 V!4865)) )
))
(declare-datatypes ((List!2192 0))(
  ( (Nil!2189) (Cons!2188 (h!2805 tuple2!3216) (t!6985 List!2192)) )
))
(declare-datatypes ((ListLongMap!2147 0))(
  ( (ListLongMap!2148 (toList!1089 List!2192)) )
))
(declare-fun contains!1134 (ListLongMap!2147 (_ BitVec 64)) Bool)

(declare-fun map!1802 (LongMapFixedSize!2134) ListLongMap!2147)

(assert (=> b!169201 (= lt!84714 (contains!1134 (map!1802 (_2!1618 lt!84713)) key!828))))

(declare-fun mapNonEmpty!6608 () Bool)

(declare-fun tp!14974 () Bool)

(assert (=> mapNonEmpty!6608 (= mapRes!6608 (and tp!14974 e!111465))))

(declare-fun mapKey!6609 () (_ BitVec 32))

(declare-fun mapRest!6609 () (Array (_ BitVec 32) ValueCell!1613))

(declare-fun mapValue!6608 () ValueCell!1613)

(assert (=> mapNonEmpty!6608 (= (arr!3287 (_values!3492 (_2!1618 err!63))) (store mapRest!6609 mapKey!6609 mapValue!6608))))

(declare-fun b!169202 () Bool)

(declare-fun res!80466 () Bool)

(assert (=> b!169202 (=> (not res!80466) (not e!111455))))

(assert (=> b!169202 (= res!80466 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169203 () Bool)

(assert (=> b!169203 (= e!111461 e!111457)))

(declare-fun res!80469 () Bool)

(assert (=> b!169203 (=> (not res!80469) (not e!111457))))

(assert (=> b!169203 (= res!80469 (valid!935 (_2!1618 lt!84713)))))

(assert (=> b!169203 (= lt!84713 err!63)))

(assert (=> b!169203 true))

(assert (=> b!169203 e!111456))

(declare-fun e!111454 () Bool)

(assert (=> b!169204 (= e!111459 (and tp!14973 tp_is_empty!3913 (array_inv!2113 (_keys!5333 thiss!1248)) (array_inv!2114 (_values!3492 thiss!1248)) e!111454))))

(declare-fun b!169205 () Bool)

(declare-fun mapRes!6609 () Bool)

(assert (=> b!169205 (= e!111454 (and e!111463 mapRes!6609))))

(declare-fun condMapEmpty!6609 () Bool)

(declare-fun mapDefault!6609 () ValueCell!1613)

(assert (=> b!169205 (= condMapEmpty!6609 (= (arr!3287 (_values!3492 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1613)) mapDefault!6609)))))

(declare-fun mapIsEmpty!6609 () Bool)

(assert (=> mapIsEmpty!6609 mapRes!6609))

(declare-fun mapNonEmpty!6609 () Bool)

(declare-fun tp!14976 () Bool)

(declare-fun e!111462 () Bool)

(assert (=> mapNonEmpty!6609 (= mapRes!6609 (and tp!14976 e!111462))))

(declare-fun mapRest!6608 () (Array (_ BitVec 32) ValueCell!1613))

(declare-fun mapValue!6609 () ValueCell!1613)

(declare-fun mapKey!6608 () (_ BitVec 32))

(assert (=> mapNonEmpty!6609 (= (arr!3287 (_values!3492 thiss!1248)) (store mapRest!6608 mapKey!6608 mapValue!6609))))

(declare-fun b!169206 () Bool)

(assert (=> b!169206 (= e!111462 tp_is_empty!3913)))

(assert (= (and start!16810 res!80468) b!169202))

(assert (= (and b!169202 res!80466) b!169199))

(assert (= (and b!169199 res!80467) b!169203))

(assert (= (and b!169197 condMapEmpty!6608) mapIsEmpty!6608))

(assert (= (and b!169197 (not condMapEmpty!6608)) mapNonEmpty!6608))

(assert (= (and mapNonEmpty!6608 ((_ is ValueCellFull!1613) mapValue!6608)) b!169198))

(assert (= (and b!169197 ((_ is ValueCellFull!1613) mapDefault!6608)) b!169200))

(assert (= b!169196 b!169197))

(assert (= b!169203 b!169196))

(assert (= (and b!169203 res!80469) b!169195))

(assert (= (and b!169195 res!80470) b!169201))

(assert (= (and b!169205 condMapEmpty!6609) mapIsEmpty!6609))

(assert (= (and b!169205 (not condMapEmpty!6609)) mapNonEmpty!6609))

(assert (= (and mapNonEmpty!6609 ((_ is ValueCellFull!1613) mapValue!6609)) b!169206))

(assert (= (and b!169205 ((_ is ValueCellFull!1613) mapDefault!6609)) b!169194))

(assert (= b!169204 b!169205))

(assert (= start!16810 b!169204))

(declare-fun m!197779 () Bool)

(assert (=> b!169196 m!197779))

(declare-fun m!197781 () Bool)

(assert (=> b!169196 m!197781))

(declare-fun m!197783 () Bool)

(assert (=> b!169199 m!197783))

(declare-fun m!197785 () Bool)

(assert (=> b!169204 m!197785))

(declare-fun m!197787 () Bool)

(assert (=> b!169204 m!197787))

(declare-fun m!197789 () Bool)

(assert (=> b!169203 m!197789))

(declare-fun m!197791 () Bool)

(assert (=> mapNonEmpty!6608 m!197791))

(declare-fun m!197793 () Bool)

(assert (=> start!16810 m!197793))

(declare-fun m!197795 () Bool)

(assert (=> mapNonEmpty!6609 m!197795))

(declare-fun m!197797 () Bool)

(assert (=> b!169201 m!197797))

(assert (=> b!169201 m!197797))

(declare-fun m!197799 () Bool)

(assert (=> b!169201 m!197799))

(check-sat (not b!169203) (not b!169201) (not mapNonEmpty!6609) (not start!16810) (not b!169204) b_and!10513 (not b_next!4123) (not b_next!4125) tp_is_empty!3913 (not mapNonEmpty!6608) b_and!10511 (not b!169199) (not b!169196))
(check-sat b_and!10511 b_and!10513 (not b_next!4125) (not b_next!4123))
