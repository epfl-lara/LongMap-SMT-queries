; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16778 () Bool)

(assert start!16778)

(declare-fun b!168882 () Bool)

(declare-fun b_free!4083 () Bool)

(declare-fun b_next!4083 () Bool)

(assert (=> b!168882 (= b_free!4083 (not b_next!4083))))

(declare-fun tp!14849 () Bool)

(declare-fun b_and!10497 () Bool)

(assert (=> b!168882 (= tp!14849 b_and!10497)))

(declare-fun b!168875 () Bool)

(declare-datatypes ((Unit!5215 0))(
  ( (Unit!5216) )
))
(declare-fun e!111104 () Unit!5215)

(declare-fun Unit!5217 () Unit!5215)

(assert (=> b!168875 (= e!111104 Unit!5217)))

(declare-fun lt!84598 () Unit!5215)

(declare-datatypes ((V!4827 0))(
  ( (V!4828 (val!1987 Int)) )
))
(declare-datatypes ((ValueCell!1599 0))(
  ( (ValueCellFull!1599 (v!3852 V!4827)) (EmptyCell!1599) )
))
(declare-datatypes ((array!6867 0))(
  ( (array!6868 (arr!3269 (Array (_ BitVec 32) (_ BitVec 64))) (size!3557 (_ BitVec 32))) )
))
(declare-datatypes ((array!6869 0))(
  ( (array!6870 (arr!3270 (Array (_ BitVec 32) ValueCell!1599)) (size!3558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2106 0))(
  ( (LongMapFixedSize!2107 (defaultEntry!3495 Int) (mask!8268 (_ BitVec 32)) (extraKeys!3236 (_ BitVec 32)) (zeroValue!3338 V!4827) (minValue!3338 V!4827) (_size!1102 (_ BitVec 32)) (_keys!5320 array!6867) (_values!3478 array!6869) (_vacant!1102 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2106)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4827 V!4827 (_ BitVec 64) Int) Unit!5215)

(assert (=> b!168875 (= lt!84598 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!132 (_keys!5320 thiss!1248) (_values!3478 thiss!1248) (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) key!828 (defaultEntry!3495 thiss!1248)))))

(assert (=> b!168875 false))

(declare-datatypes ((SeekEntryResult!512 0))(
  ( (MissingZero!512 (index!4216 (_ BitVec 32))) (Found!512 (index!4217 (_ BitVec 32))) (Intermediate!512 (undefined!1324 Bool) (index!4218 (_ BitVec 32)) (x!18660 (_ BitVec 32))) (Undefined!512) (MissingVacant!512 (index!4219 (_ BitVec 32))) )
))
(declare-fun lt!84606 () SeekEntryResult!512)

(declare-fun e!111110 () Bool)

(declare-fun b!168876 () Bool)

(assert (=> b!168876 (= e!111110 (= (select (arr!3269 (_keys!5320 thiss!1248)) (index!4217 lt!84606)) key!828))))

(declare-fun mapIsEmpty!6546 () Bool)

(declare-fun mapRes!6546 () Bool)

(assert (=> mapIsEmpty!6546 mapRes!6546))

(declare-fun b!168877 () Bool)

(declare-fun e!111106 () Bool)

(declare-fun tp_is_empty!3885 () Bool)

(assert (=> b!168877 (= e!111106 tp_is_empty!3885)))

(declare-fun b!168878 () Bool)

(declare-fun e!111107 () Bool)

(assert (=> b!168878 (= e!111107 tp_is_empty!3885)))

(declare-fun res!80389 () Bool)

(declare-fun e!111103 () Bool)

(assert (=> start!16778 (=> (not res!80389) (not e!111103))))

(declare-fun valid!912 (LongMapFixedSize!2106) Bool)

(assert (=> start!16778 (= res!80389 (valid!912 thiss!1248))))

(assert (=> start!16778 e!111103))

(declare-fun e!111101 () Bool)

(assert (=> start!16778 e!111101))

(assert (=> start!16778 true))

(assert (=> start!16778 tp_is_empty!3885))

(declare-fun mapNonEmpty!6546 () Bool)

(declare-fun tp!14850 () Bool)

(assert (=> mapNonEmpty!6546 (= mapRes!6546 (and tp!14850 e!111107))))

(declare-fun mapKey!6546 () (_ BitVec 32))

(declare-fun mapValue!6546 () ValueCell!1599)

(declare-fun mapRest!6546 () (Array (_ BitVec 32) ValueCell!1599))

(assert (=> mapNonEmpty!6546 (= (arr!3270 (_values!3478 thiss!1248)) (store mapRest!6546 mapKey!6546 mapValue!6546))))

(declare-fun b!168879 () Bool)

(declare-fun e!111109 () Bool)

(assert (=> b!168879 (= e!111109 true)))

(declare-fun lt!84604 () Bool)

(declare-fun lt!84600 () LongMapFixedSize!2106)

(declare-datatypes ((tuple2!3186 0))(
  ( (tuple2!3187 (_1!1604 (_ BitVec 64)) (_2!1604 V!4827)) )
))
(declare-datatypes ((List!2174 0))(
  ( (Nil!2171) (Cons!2170 (h!2787 tuple2!3186) (t!6976 List!2174)) )
))
(declare-datatypes ((ListLongMap!2141 0))(
  ( (ListLongMap!2142 (toList!1086 List!2174)) )
))
(declare-fun contains!1128 (ListLongMap!2141 (_ BitVec 64)) Bool)

(declare-fun map!1806 (LongMapFixedSize!2106) ListLongMap!2141)

(assert (=> b!168879 (= lt!84604 (contains!1128 (map!1806 lt!84600) key!828))))

(declare-fun b!168880 () Bool)

(declare-fun lt!84602 () Unit!5215)

(assert (=> b!168880 (= e!111104 lt!84602)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!131 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4827 V!4827 (_ BitVec 64) Int) Unit!5215)

(assert (=> b!168880 (= lt!84602 (lemmaInListMapThenSeekEntryOrOpenFindsIt!131 (_keys!5320 thiss!1248) (_values!3478 thiss!1248) (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) key!828 (defaultEntry!3495 thiss!1248)))))

(declare-fun res!80388 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168880 (= res!80388 (inRange!0 (index!4217 lt!84606) (mask!8268 thiss!1248)))))

(assert (=> b!168880 (=> (not res!80388) (not e!111110))))

(assert (=> b!168880 e!111110))

(declare-fun b!168881 () Bool)

(declare-fun res!80387 () Bool)

(assert (=> b!168881 (=> (not res!80387) (not e!111103))))

(assert (=> b!168881 (= res!80387 (not (= key!828 (bvneg key!828))))))

(declare-fun e!111108 () Bool)

(declare-fun array_inv!2103 (array!6867) Bool)

(declare-fun array_inv!2104 (array!6869) Bool)

(assert (=> b!168882 (= e!111101 (and tp!14849 tp_is_empty!3885 (array_inv!2103 (_keys!5320 thiss!1248)) (array_inv!2104 (_values!3478 thiss!1248)) e!111108))))

(declare-fun b!168883 () Bool)

(declare-fun e!111102 () Bool)

(assert (=> b!168883 (= e!111102 (not e!111109))))

(declare-fun res!80391 () Bool)

(assert (=> b!168883 (=> res!80391 e!111109)))

(assert (=> b!168883 (= res!80391 (not (valid!912 lt!84600)))))

(declare-fun lt!84596 () ListLongMap!2141)

(assert (=> b!168883 (contains!1128 lt!84596 (select (arr!3269 (_keys!5320 thiss!1248)) (index!4217 lt!84606)))))

(declare-fun lt!84605 () Unit!5215)

(declare-fun lt!84603 () array!6869)

(declare-fun lemmaValidKeyInArrayIsInListMap!139 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4827 V!4827 (_ BitVec 32) Int) Unit!5215)

(assert (=> b!168883 (= lt!84605 (lemmaValidKeyInArrayIsInListMap!139 (_keys!5320 thiss!1248) lt!84603 (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) (index!4217 lt!84606) (defaultEntry!3495 thiss!1248)))))

(assert (=> b!168883 (= lt!84600 (LongMapFixedSize!2107 (defaultEntry!3495 thiss!1248) (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) (_size!1102 thiss!1248) (_keys!5320 thiss!1248) lt!84603 (_vacant!1102 thiss!1248)))))

(declare-fun lt!84601 () ListLongMap!2141)

(assert (=> b!168883 (= lt!84601 lt!84596)))

(declare-fun getCurrentListMap!744 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4827 V!4827 (_ BitVec 32) Int) ListLongMap!2141)

(assert (=> b!168883 (= lt!84596 (getCurrentListMap!744 (_keys!5320 thiss!1248) lt!84603 (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3495 thiss!1248)))))

(declare-fun lt!84599 () ListLongMap!2141)

(declare-fun v!309 () V!4827)

(declare-fun +!238 (ListLongMap!2141 tuple2!3186) ListLongMap!2141)

(assert (=> b!168883 (= lt!84601 (+!238 lt!84599 (tuple2!3187 key!828 v!309)))))

(assert (=> b!168883 (= lt!84603 (array!6870 (store (arr!3270 (_values!3478 thiss!1248)) (index!4217 lt!84606) (ValueCellFull!1599 v!309)) (size!3558 (_values!3478 thiss!1248))))))

(declare-fun lt!84597 () Unit!5215)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!93 (array!6867 array!6869 (_ BitVec 32) (_ BitVec 32) V!4827 V!4827 (_ BitVec 32) (_ BitVec 64) V!4827 Int) Unit!5215)

(assert (=> b!168883 (= lt!84597 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!93 (_keys!5320 thiss!1248) (_values!3478 thiss!1248) (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) (index!4217 lt!84606) key!828 v!309 (defaultEntry!3495 thiss!1248)))))

(declare-fun lt!84607 () Unit!5215)

(assert (=> b!168883 (= lt!84607 e!111104)))

(declare-fun c!30406 () Bool)

(assert (=> b!168883 (= c!30406 (contains!1128 lt!84599 key!828))))

(assert (=> b!168883 (= lt!84599 (getCurrentListMap!744 (_keys!5320 thiss!1248) (_values!3478 thiss!1248) (mask!8268 thiss!1248) (extraKeys!3236 thiss!1248) (zeroValue!3338 thiss!1248) (minValue!3338 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3495 thiss!1248)))))

(declare-fun b!168884 () Bool)

(assert (=> b!168884 (= e!111108 (and e!111106 mapRes!6546))))

(declare-fun condMapEmpty!6546 () Bool)

(declare-fun mapDefault!6546 () ValueCell!1599)

(assert (=> b!168884 (= condMapEmpty!6546 (= (arr!3270 (_values!3478 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1599)) mapDefault!6546)))))

(declare-fun b!168885 () Bool)

(assert (=> b!168885 (= e!111103 e!111102)))

(declare-fun res!80390 () Bool)

(assert (=> b!168885 (=> (not res!80390) (not e!111102))))

(get-info :version)

(assert (=> b!168885 (= res!80390 (and (not ((_ is Undefined!512) lt!84606)) (not ((_ is MissingVacant!512) lt!84606)) (not ((_ is MissingZero!512) lt!84606)) ((_ is Found!512) lt!84606)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6867 (_ BitVec 32)) SeekEntryResult!512)

(assert (=> b!168885 (= lt!84606 (seekEntryOrOpen!0 key!828 (_keys!5320 thiss!1248) (mask!8268 thiss!1248)))))

(assert (= (and start!16778 res!80389) b!168881))

(assert (= (and b!168881 res!80387) b!168885))

(assert (= (and b!168885 res!80390) b!168883))

(assert (= (and b!168883 c!30406) b!168880))

(assert (= (and b!168883 (not c!30406)) b!168875))

(assert (= (and b!168880 res!80388) b!168876))

(assert (= (and b!168883 (not res!80391)) b!168879))

(assert (= (and b!168884 condMapEmpty!6546) mapIsEmpty!6546))

(assert (= (and b!168884 (not condMapEmpty!6546)) mapNonEmpty!6546))

(assert (= (and mapNonEmpty!6546 ((_ is ValueCellFull!1599) mapValue!6546)) b!168878))

(assert (= (and b!168884 ((_ is ValueCellFull!1599) mapDefault!6546)) b!168877))

(assert (= b!168882 b!168884))

(assert (= start!16778 b!168882))

(declare-fun m!197983 () Bool)

(assert (=> b!168880 m!197983))

(declare-fun m!197985 () Bool)

(assert (=> b!168880 m!197985))

(declare-fun m!197987 () Bool)

(assert (=> b!168885 m!197987))

(declare-fun m!197989 () Bool)

(assert (=> b!168879 m!197989))

(assert (=> b!168879 m!197989))

(declare-fun m!197991 () Bool)

(assert (=> b!168879 m!197991))

(declare-fun m!197993 () Bool)

(assert (=> b!168883 m!197993))

(declare-fun m!197995 () Bool)

(assert (=> b!168883 m!197995))

(declare-fun m!197997 () Bool)

(assert (=> b!168883 m!197997))

(declare-fun m!197999 () Bool)

(assert (=> b!168883 m!197999))

(declare-fun m!198001 () Bool)

(assert (=> b!168883 m!198001))

(declare-fun m!198003 () Bool)

(assert (=> b!168883 m!198003))

(declare-fun m!198005 () Bool)

(assert (=> b!168883 m!198005))

(declare-fun m!198007 () Bool)

(assert (=> b!168883 m!198007))

(declare-fun m!198009 () Bool)

(assert (=> b!168883 m!198009))

(assert (=> b!168883 m!198007))

(declare-fun m!198011 () Bool)

(assert (=> b!168883 m!198011))

(assert (=> b!168876 m!198007))

(declare-fun m!198013 () Bool)

(assert (=> b!168882 m!198013))

(declare-fun m!198015 () Bool)

(assert (=> b!168882 m!198015))

(declare-fun m!198017 () Bool)

(assert (=> start!16778 m!198017))

(declare-fun m!198019 () Bool)

(assert (=> mapNonEmpty!6546 m!198019))

(declare-fun m!198021 () Bool)

(assert (=> b!168875 m!198021))

(check-sat tp_is_empty!3885 (not b!168880) b_and!10497 (not b!168882) (not b_next!4083) (not b!168879) (not b!168883) (not b!168885) (not b!168875) (not start!16778) (not mapNonEmpty!6546))
(check-sat b_and!10497 (not b_next!4083))
