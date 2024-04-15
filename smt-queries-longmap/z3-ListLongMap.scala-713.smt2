; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16786 () Bool)

(assert start!16786)

(declare-fun b!168792 () Bool)

(declare-fun b_free!4087 () Bool)

(declare-fun b_next!4087 () Bool)

(assert (=> b!168792 (= b_free!4087 (not b_next!4087))))

(declare-fun tp!14862 () Bool)

(declare-fun b_and!10475 () Bool)

(assert (=> b!168792 (= tp!14862 b_and!10475)))

(declare-fun tp_is_empty!3889 () Bool)

(declare-datatypes ((V!4833 0))(
  ( (V!4834 (val!1989 Int)) )
))
(declare-datatypes ((ValueCell!1601 0))(
  ( (ValueCellFull!1601 (v!3848 V!4833)) (EmptyCell!1601) )
))
(declare-datatypes ((array!6855 0))(
  ( (array!6856 (arr!3262 (Array (_ BitVec 32) (_ BitVec 64))) (size!3551 (_ BitVec 32))) )
))
(declare-datatypes ((array!6857 0))(
  ( (array!6858 (arr!3263 (Array (_ BitVec 32) ValueCell!1601)) (size!3552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2110 0))(
  ( (LongMapFixedSize!2111 (defaultEntry!3497 Int) (mask!8271 (_ BitVec 32)) (extraKeys!3238 (_ BitVec 32)) (zeroValue!3340 V!4833) (minValue!3340 V!4833) (_size!1104 (_ BitVec 32)) (_keys!5321 array!6855) (_values!3480 array!6857) (_vacant!1104 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2110)

(declare-fun e!111058 () Bool)

(declare-fun e!111062 () Bool)

(declare-fun array_inv!2095 (array!6855) Bool)

(declare-fun array_inv!2096 (array!6857) Bool)

(assert (=> b!168792 (= e!111062 (and tp!14862 tp_is_empty!3889 (array_inv!2095 (_keys!5321 thiss!1248)) (array_inv!2096 (_values!3480 thiss!1248)) e!111058))))

(declare-fun b!168793 () Bool)

(declare-datatypes ((Unit!5199 0))(
  ( (Unit!5200) )
))
(declare-fun e!111059 () Unit!5199)

(declare-fun Unit!5201 () Unit!5199)

(assert (=> b!168793 (= e!111059 Unit!5201)))

(declare-fun lt!84485 () Unit!5199)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!131 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5199)

(assert (=> b!168793 (= lt!84485 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!131 (_keys!5321 thiss!1248) (_values!3480 thiss!1248) (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(assert (=> b!168793 false))

(declare-fun b!168794 () Bool)

(declare-fun lt!84495 () Unit!5199)

(assert (=> b!168794 (= e!111059 lt!84495)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5199)

(assert (=> b!168794 (= lt!84495 (lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (_keys!5321 thiss!1248) (_values!3480 thiss!1248) (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(declare-fun res!80322 () Bool)

(declare-datatypes ((SeekEntryResult!526 0))(
  ( (MissingZero!526 (index!4272 (_ BitVec 32))) (Found!526 (index!4273 (_ BitVec 32))) (Intermediate!526 (undefined!1338 Bool) (index!4274 (_ BitVec 32)) (x!18681 (_ BitVec 32))) (Undefined!526) (MissingVacant!526 (index!4275 (_ BitVec 32))) )
))
(declare-fun lt!84491 () SeekEntryResult!526)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168794 (= res!80322 (inRange!0 (index!4273 lt!84491) (mask!8271 thiss!1248)))))

(declare-fun e!111061 () Bool)

(assert (=> b!168794 (=> (not res!80322) (not e!111061))))

(assert (=> b!168794 e!111061))

(declare-fun b!168795 () Bool)

(declare-fun res!80320 () Bool)

(declare-fun e!111063 () Bool)

(assert (=> b!168795 (=> (not res!80320) (not e!111063))))

(assert (=> b!168795 (= res!80320 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168796 () Bool)

(declare-fun e!111064 () Bool)

(assert (=> b!168796 (= e!111064 tp_is_empty!3889)))

(declare-fun res!80323 () Bool)

(assert (=> start!16786 (=> (not res!80323) (not e!111063))))

(declare-fun valid!927 (LongMapFixedSize!2110) Bool)

(assert (=> start!16786 (= res!80323 (valid!927 thiss!1248))))

(assert (=> start!16786 e!111063))

(assert (=> start!16786 e!111062))

(assert (=> start!16786 true))

(assert (=> start!16786 tp_is_empty!3889))

(declare-fun b!168797 () Bool)

(declare-fun mapRes!6552 () Bool)

(assert (=> b!168797 (= e!111058 (and e!111064 mapRes!6552))))

(declare-fun condMapEmpty!6552 () Bool)

(declare-fun mapDefault!6552 () ValueCell!1601)

(assert (=> b!168797 (= condMapEmpty!6552 (= (arr!3263 (_values!3480 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1601)) mapDefault!6552)))))

(declare-fun b!168798 () Bool)

(assert (=> b!168798 (= e!111061 (= (select (arr!3262 (_keys!5321 thiss!1248)) (index!4273 lt!84491)) key!828))))

(declare-fun b!168799 () Bool)

(declare-fun e!111065 () Bool)

(assert (=> b!168799 (= e!111063 e!111065)))

(declare-fun res!80321 () Bool)

(assert (=> b!168799 (=> (not res!80321) (not e!111065))))

(get-info :version)

(assert (=> b!168799 (= res!80321 (and (not ((_ is Undefined!526) lt!84491)) (not ((_ is MissingVacant!526) lt!84491)) (not ((_ is MissingZero!526) lt!84491)) ((_ is Found!526) lt!84491)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6855 (_ BitVec 32)) SeekEntryResult!526)

(assert (=> b!168799 (= lt!84491 (seekEntryOrOpen!0 key!828 (_keys!5321 thiss!1248) (mask!8271 thiss!1248)))))

(declare-fun mapIsEmpty!6552 () Bool)

(assert (=> mapIsEmpty!6552 mapRes!6552))

(declare-fun b!168800 () Bool)

(assert (=> b!168800 (= e!111065 (not true))))

(declare-fun lt!84490 () Bool)

(declare-fun lt!84487 () array!6857)

(assert (=> b!168800 (= lt!84490 (valid!927 (LongMapFixedSize!2111 (defaultEntry!3497 thiss!1248) (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (_size!1104 thiss!1248) (_keys!5321 thiss!1248) lt!84487 (_vacant!1104 thiss!1248))))))

(declare-datatypes ((tuple2!3192 0))(
  ( (tuple2!3193 (_1!1607 (_ BitVec 64)) (_2!1607 V!4833)) )
))
(declare-datatypes ((List!2186 0))(
  ( (Nil!2183) (Cons!2182 (h!2799 tuple2!3192) (t!6979 List!2186)) )
))
(declare-datatypes ((ListLongMap!2135 0))(
  ( (ListLongMap!2136 (toList!1083 List!2186)) )
))
(declare-fun lt!84488 () ListLongMap!2135)

(declare-fun contains!1128 (ListLongMap!2135 (_ BitVec 64)) Bool)

(assert (=> b!168800 (contains!1128 lt!84488 (select (arr!3262 (_keys!5321 thiss!1248)) (index!4273 lt!84491)))))

(declare-fun lt!84489 () Unit!5199)

(declare-fun lemmaValidKeyInArrayIsInListMap!137 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) Int) Unit!5199)

(assert (=> b!168800 (= lt!84489 (lemmaValidKeyInArrayIsInListMap!137 (_keys!5321 thiss!1248) lt!84487 (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (index!4273 lt!84491) (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84492 () ListLongMap!2135)

(assert (=> b!168800 (= lt!84492 lt!84488)))

(declare-fun getCurrentListMap!725 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) Int) ListLongMap!2135)

(assert (=> b!168800 (= lt!84488 (getCurrentListMap!725 (_keys!5321 thiss!1248) lt!84487 (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84494 () ListLongMap!2135)

(declare-fun v!309 () V!4833)

(declare-fun +!234 (ListLongMap!2135 tuple2!3192) ListLongMap!2135)

(assert (=> b!168800 (= lt!84492 (+!234 lt!84494 (tuple2!3193 key!828 v!309)))))

(assert (=> b!168800 (= lt!84487 (array!6858 (store (arr!3263 (_values!3480 thiss!1248)) (index!4273 lt!84491) (ValueCellFull!1601 v!309)) (size!3552 (_values!3480 thiss!1248))))))

(declare-fun lt!84486 () Unit!5199)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!106 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) (_ BitVec 64) V!4833 Int) Unit!5199)

(assert (=> b!168800 (= lt!84486 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!106 (_keys!5321 thiss!1248) (_values!3480 thiss!1248) (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (index!4273 lt!84491) key!828 v!309 (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84493 () Unit!5199)

(assert (=> b!168800 (= lt!84493 e!111059)))

(declare-fun c!30386 () Bool)

(assert (=> b!168800 (= c!30386 (contains!1128 lt!84494 key!828))))

(assert (=> b!168800 (= lt!84494 (getCurrentListMap!725 (_keys!5321 thiss!1248) (_values!3480 thiss!1248) (mask!8271 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3497 thiss!1248)))))

(declare-fun mapNonEmpty!6552 () Bool)

(declare-fun tp!14861 () Bool)

(declare-fun e!111066 () Bool)

(assert (=> mapNonEmpty!6552 (= mapRes!6552 (and tp!14861 e!111066))))

(declare-fun mapRest!6552 () (Array (_ BitVec 32) ValueCell!1601))

(declare-fun mapValue!6552 () ValueCell!1601)

(declare-fun mapKey!6552 () (_ BitVec 32))

(assert (=> mapNonEmpty!6552 (= (arr!3263 (_values!3480 thiss!1248)) (store mapRest!6552 mapKey!6552 mapValue!6552))))

(declare-fun b!168801 () Bool)

(assert (=> b!168801 (= e!111066 tp_is_empty!3889)))

(assert (= (and start!16786 res!80323) b!168795))

(assert (= (and b!168795 res!80320) b!168799))

(assert (= (and b!168799 res!80321) b!168800))

(assert (= (and b!168800 c!30386) b!168794))

(assert (= (and b!168800 (not c!30386)) b!168793))

(assert (= (and b!168794 res!80322) b!168798))

(assert (= (and b!168797 condMapEmpty!6552) mapIsEmpty!6552))

(assert (= (and b!168797 (not condMapEmpty!6552)) mapNonEmpty!6552))

(assert (= (and mapNonEmpty!6552 ((_ is ValueCellFull!1601) mapValue!6552)) b!168801))

(assert (= (and b!168797 ((_ is ValueCellFull!1601) mapDefault!6552)) b!168796))

(assert (= b!168792 b!168797))

(assert (= start!16786 b!168792))

(declare-fun m!197443 () Bool)

(assert (=> b!168792 m!197443))

(declare-fun m!197445 () Bool)

(assert (=> b!168792 m!197445))

(declare-fun m!197447 () Bool)

(assert (=> b!168800 m!197447))

(declare-fun m!197449 () Bool)

(assert (=> b!168800 m!197449))

(declare-fun m!197451 () Bool)

(assert (=> b!168800 m!197451))

(declare-fun m!197453 () Bool)

(assert (=> b!168800 m!197453))

(declare-fun m!197455 () Bool)

(assert (=> b!168800 m!197455))

(declare-fun m!197457 () Bool)

(assert (=> b!168800 m!197457))

(declare-fun m!197459 () Bool)

(assert (=> b!168800 m!197459))

(declare-fun m!197461 () Bool)

(assert (=> b!168800 m!197461))

(declare-fun m!197463 () Bool)

(assert (=> b!168800 m!197463))

(assert (=> b!168800 m!197461))

(declare-fun m!197465 () Bool)

(assert (=> b!168800 m!197465))

(declare-fun m!197467 () Bool)

(assert (=> b!168793 m!197467))

(declare-fun m!197469 () Bool)

(assert (=> mapNonEmpty!6552 m!197469))

(declare-fun m!197471 () Bool)

(assert (=> b!168794 m!197471))

(declare-fun m!197473 () Bool)

(assert (=> b!168794 m!197473))

(assert (=> b!168798 m!197461))

(declare-fun m!197475 () Bool)

(assert (=> b!168799 m!197475))

(declare-fun m!197477 () Bool)

(assert (=> start!16786 m!197477))

(check-sat (not start!16786) (not mapNonEmpty!6552) b_and!10475 tp_is_empty!3889 (not b!168799) (not b!168794) (not b!168793) (not b!168800) (not b!168792) (not b_next!4087))
(check-sat b_and!10475 (not b_next!4087))
