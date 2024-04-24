; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16192 () Bool)

(assert start!16192)

(declare-fun b!161502 () Bool)

(declare-fun b_free!3649 () Bool)

(declare-fun b_next!3649 () Bool)

(assert (=> b!161502 (= b_free!3649 (not b_next!3649))))

(declare-fun tp!13516 () Bool)

(declare-fun b_and!10077 () Bool)

(assert (=> b!161502 (= tp!13516 b_and!10077)))

(declare-fun b!161497 () Bool)

(declare-fun res!76552 () Bool)

(declare-fun e!105545 () Bool)

(assert (=> b!161497 (=> (not res!76552) (not e!105545))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161497 (= res!76552 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161498 () Bool)

(declare-datatypes ((Unit!5027 0))(
  ( (Unit!5028) )
))
(declare-fun e!105540 () Unit!5027)

(declare-datatypes ((V!4249 0))(
  ( (V!4250 (val!1770 Int)) )
))
(declare-datatypes ((ValueCell!1382 0))(
  ( (ValueCellFull!1382 (v!3636 V!4249)) (EmptyCell!1382) )
))
(declare-datatypes ((array!5967 0))(
  ( (array!5968 (arr!2828 (Array (_ BitVec 32) (_ BitVec 64))) (size!3112 (_ BitVec 32))) )
))
(declare-datatypes ((array!5969 0))(
  ( (array!5970 (arr!2829 (Array (_ BitVec 32) ValueCell!1382)) (size!3113 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1672 0))(
  ( (LongMapFixedSize!1673 (defaultEntry!3278 Int) (mask!7870 (_ BitVec 32)) (extraKeys!3019 (_ BitVec 32)) (zeroValue!3121 V!4249) (minValue!3121 V!4249) (_size!885 (_ BitVec 32)) (_keys!5079 array!5967) (_values!3261 array!5969) (_vacant!885 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1672)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!78 (array!5967 array!5969 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!5027)

(assert (=> b!161498 (= e!105540 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!78 (_keys!5079 thiss!1248) (_values!3261 thiss!1248) (mask!7870 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(declare-fun b!161499 () Bool)

(declare-fun res!76551 () Bool)

(assert (=> b!161499 (=> (not res!76551) (not e!105545))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!348 0))(
  ( (MissingZero!348 (index!3560 (_ BitVec 32))) (Found!348 (index!3561 (_ BitVec 32))) (Intermediate!348 (undefined!1160 Bool) (index!3562 (_ BitVec 32)) (x!17812 (_ BitVec 32))) (Undefined!348) (MissingVacant!348 (index!3563 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5967 (_ BitVec 32)) SeekEntryResult!348)

(assert (=> b!161499 (= res!76551 ((_ is Undefined!348) (seekEntryOrOpen!0 key!828 (_keys!5079 thiss!1248) (mask!7870 thiss!1248))))))

(declare-fun b!161500 () Bool)

(assert (=> b!161500 (= e!105545 false)))

(declare-fun lt!82275 () Unit!5027)

(assert (=> b!161500 (= lt!82275 e!105540)))

(declare-fun c!29975 () Bool)

(declare-datatypes ((tuple2!2916 0))(
  ( (tuple2!2917 (_1!1469 (_ BitVec 64)) (_2!1469 V!4249)) )
))
(declare-datatypes ((List!1974 0))(
  ( (Nil!1971) (Cons!1970 (h!2583 tuple2!2916) (t!6768 List!1974)) )
))
(declare-datatypes ((ListLongMap!1915 0))(
  ( (ListLongMap!1916 (toList!973 List!1974)) )
))
(declare-fun contains!1019 (ListLongMap!1915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!640 (array!5967 array!5969 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 32) Int) ListLongMap!1915)

(assert (=> b!161500 (= c!29975 (contains!1019 (getCurrentListMap!640 (_keys!5079 thiss!1248) (_values!3261 thiss!1248) (mask!7870 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3278 thiss!1248)) key!828))))

(declare-fun b!161501 () Bool)

(declare-fun e!105541 () Bool)

(declare-fun tp_is_empty!3451 () Bool)

(assert (=> b!161501 (= e!105541 tp_is_empty!3451)))

(declare-fun mapIsEmpty!5864 () Bool)

(declare-fun mapRes!5864 () Bool)

(assert (=> mapIsEmpty!5864 mapRes!5864))

(declare-fun res!76553 () Bool)

(assert (=> start!16192 (=> (not res!76553) (not e!105545))))

(declare-fun valid!786 (LongMapFixedSize!1672) Bool)

(assert (=> start!16192 (= res!76553 (valid!786 thiss!1248))))

(assert (=> start!16192 e!105545))

(declare-fun e!105544 () Bool)

(assert (=> start!16192 e!105544))

(assert (=> start!16192 true))

(declare-fun mapNonEmpty!5864 () Bool)

(declare-fun tp!13517 () Bool)

(assert (=> mapNonEmpty!5864 (= mapRes!5864 (and tp!13517 e!105541))))

(declare-fun mapRest!5864 () (Array (_ BitVec 32) ValueCell!1382))

(declare-fun mapKey!5864 () (_ BitVec 32))

(declare-fun mapValue!5864 () ValueCell!1382)

(assert (=> mapNonEmpty!5864 (= (arr!2829 (_values!3261 thiss!1248)) (store mapRest!5864 mapKey!5864 mapValue!5864))))

(declare-fun e!105542 () Bool)

(declare-fun array_inv!1811 (array!5967) Bool)

(declare-fun array_inv!1812 (array!5969) Bool)

(assert (=> b!161502 (= e!105544 (and tp!13516 tp_is_empty!3451 (array_inv!1811 (_keys!5079 thiss!1248)) (array_inv!1812 (_values!3261 thiss!1248)) e!105542))))

(declare-fun b!161503 () Bool)

(declare-fun Unit!5029 () Unit!5027)

(assert (=> b!161503 (= e!105540 Unit!5029)))

(declare-fun lt!82274 () Unit!5027)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!80 (array!5967 array!5969 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!5027)

(assert (=> b!161503 (= lt!82274 (lemmaInListMapThenSeekEntryOrOpenFindsIt!80 (_keys!5079 thiss!1248) (_values!3261 thiss!1248) (mask!7870 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(assert (=> b!161503 false))

(declare-fun b!161504 () Bool)

(declare-fun e!105546 () Bool)

(assert (=> b!161504 (= e!105542 (and e!105546 mapRes!5864))))

(declare-fun condMapEmpty!5864 () Bool)

(declare-fun mapDefault!5864 () ValueCell!1382)

(assert (=> b!161504 (= condMapEmpty!5864 (= (arr!2829 (_values!3261 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1382)) mapDefault!5864)))))

(declare-fun b!161505 () Bool)

(assert (=> b!161505 (= e!105546 tp_is_empty!3451)))

(assert (= (and start!16192 res!76553) b!161497))

(assert (= (and b!161497 res!76552) b!161499))

(assert (= (and b!161499 res!76551) b!161500))

(assert (= (and b!161500 c!29975) b!161503))

(assert (= (and b!161500 (not c!29975)) b!161498))

(assert (= (and b!161504 condMapEmpty!5864) mapIsEmpty!5864))

(assert (= (and b!161504 (not condMapEmpty!5864)) mapNonEmpty!5864))

(assert (= (and mapNonEmpty!5864 ((_ is ValueCellFull!1382) mapValue!5864)) b!161501))

(assert (= (and b!161504 ((_ is ValueCellFull!1382) mapDefault!5864)) b!161505))

(assert (= b!161502 b!161504))

(assert (= start!16192 b!161502))

(declare-fun m!193121 () Bool)

(assert (=> b!161503 m!193121))

(declare-fun m!193123 () Bool)

(assert (=> mapNonEmpty!5864 m!193123))

(declare-fun m!193125 () Bool)

(assert (=> b!161502 m!193125))

(declare-fun m!193127 () Bool)

(assert (=> b!161502 m!193127))

(declare-fun m!193129 () Bool)

(assert (=> b!161498 m!193129))

(declare-fun m!193131 () Bool)

(assert (=> start!16192 m!193131))

(declare-fun m!193133 () Bool)

(assert (=> b!161499 m!193133))

(declare-fun m!193135 () Bool)

(assert (=> b!161500 m!193135))

(assert (=> b!161500 m!193135))

(declare-fun m!193137 () Bool)

(assert (=> b!161500 m!193137))

(check-sat (not b_next!3649) b_and!10077 (not b!161499) (not start!16192) (not b!161503) (not b!161502) (not b!161500) (not mapNonEmpty!5864) (not b!161498) tp_is_empty!3451)
(check-sat b_and!10077 (not b_next!3649))
