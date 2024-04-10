; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16790 () Bool)

(assert start!16790)

(declare-fun b!169068 () Bool)

(declare-fun b_free!4095 () Bool)

(declare-fun b_next!4095 () Bool)

(assert (=> b!169068 (= b_free!4095 (not b_next!4095))))

(declare-fun tp!14885 () Bool)

(declare-fun b_and!10509 () Bool)

(assert (=> b!169068 (= tp!14885 b_and!10509)))

(declare-fun mapIsEmpty!6564 () Bool)

(declare-fun mapRes!6564 () Bool)

(assert (=> mapIsEmpty!6564 mapRes!6564))

(declare-fun b!169059 () Bool)

(declare-datatypes ((Unit!5230 0))(
  ( (Unit!5231) )
))
(declare-fun e!111268 () Unit!5230)

(declare-fun Unit!5232 () Unit!5230)

(assert (=> b!169059 (= e!111268 Unit!5232)))

(declare-fun lt!84803 () Unit!5230)

(declare-datatypes ((V!4843 0))(
  ( (V!4844 (val!1993 Int)) )
))
(declare-datatypes ((ValueCell!1605 0))(
  ( (ValueCellFull!1605 (v!3858 V!4843)) (EmptyCell!1605) )
))
(declare-datatypes ((array!6891 0))(
  ( (array!6892 (arr!3281 (Array (_ BitVec 32) (_ BitVec 64))) (size!3569 (_ BitVec 32))) )
))
(declare-datatypes ((array!6893 0))(
  ( (array!6894 (arr!3282 (Array (_ BitVec 32) ValueCell!1605)) (size!3570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2118 0))(
  ( (LongMapFixedSize!2119 (defaultEntry!3501 Int) (mask!8278 (_ BitVec 32)) (extraKeys!3242 (_ BitVec 32)) (zeroValue!3344 V!4843) (minValue!3344 V!4843) (_size!1108 (_ BitVec 32)) (_keys!5326 array!6891) (_values!3484 array!6893) (_vacant!1108 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2118)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (array!6891 array!6893 (_ BitVec 32) (_ BitVec 32) V!4843 V!4843 (_ BitVec 64) Int) Unit!5230)

(assert (=> b!169059 (= lt!84803 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (_keys!5326 thiss!1248) (_values!3484 thiss!1248) (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) key!828 (defaultEntry!3501 thiss!1248)))))

(assert (=> b!169059 false))

(declare-fun mapNonEmpty!6564 () Bool)

(declare-fun tp!14886 () Bool)

(declare-fun e!111267 () Bool)

(assert (=> mapNonEmpty!6564 (= mapRes!6564 (and tp!14886 e!111267))))

(declare-fun mapRest!6564 () (Array (_ BitVec 32) ValueCell!1605))

(declare-fun mapValue!6564 () ValueCell!1605)

(declare-fun mapKey!6564 () (_ BitVec 32))

(assert (=> mapNonEmpty!6564 (= (arr!3282 (_values!3484 thiss!1248)) (store mapRest!6564 mapKey!6564 mapValue!6564))))

(declare-fun b!169060 () Bool)

(declare-fun tp_is_empty!3897 () Bool)

(assert (=> b!169060 (= e!111267 tp_is_empty!3897)))

(declare-fun b!169061 () Bool)

(declare-fun e!111275 () Bool)

(declare-fun e!111271 () Bool)

(assert (=> b!169061 (= e!111275 (and e!111271 mapRes!6564))))

(declare-fun condMapEmpty!6564 () Bool)

(declare-fun mapDefault!6564 () ValueCell!1605)

(assert (=> b!169061 (= condMapEmpty!6564 (= (arr!3282 (_values!3484 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1605)) mapDefault!6564)))))

(declare-fun b!169063 () Bool)

(declare-fun res!80465 () Bool)

(declare-fun e!111273 () Bool)

(assert (=> b!169063 (=> (not res!80465) (not e!111273))))

(assert (=> b!169063 (= res!80465 (not (= key!828 (bvneg key!828))))))

(declare-fun e!111269 () Bool)

(declare-fun b!169064 () Bool)

(declare-datatypes ((SeekEntryResult!517 0))(
  ( (MissingZero!517 (index!4236 (_ BitVec 32))) (Found!517 (index!4237 (_ BitVec 32))) (Intermediate!517 (undefined!1329 Bool) (index!4238 (_ BitVec 32)) (x!18681 (_ BitVec 32))) (Undefined!517) (MissingVacant!517 (index!4239 (_ BitVec 32))) )
))
(declare-fun lt!84807 () SeekEntryResult!517)

(assert (=> b!169064 (= e!111269 (= (select (arr!3281 (_keys!5326 thiss!1248)) (index!4237 lt!84807)) key!828))))

(declare-fun b!169065 () Bool)

(declare-fun lt!84801 () Unit!5230)

(assert (=> b!169065 (= e!111268 lt!84801)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!134 (array!6891 array!6893 (_ BitVec 32) (_ BitVec 32) V!4843 V!4843 (_ BitVec 64) Int) Unit!5230)

(assert (=> b!169065 (= lt!84801 (lemmaInListMapThenSeekEntryOrOpenFindsIt!134 (_keys!5326 thiss!1248) (_values!3484 thiss!1248) (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) key!828 (defaultEntry!3501 thiss!1248)))))

(declare-fun res!80464 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!169065 (= res!80464 (inRange!0 (index!4237 lt!84807) (mask!8278 thiss!1248)))))

(assert (=> b!169065 (=> (not res!80464) (not e!111269))))

(assert (=> b!169065 e!111269))

(declare-fun b!169066 () Bool)

(declare-fun e!111270 () Bool)

(assert (=> b!169066 (= e!111273 e!111270)))

(declare-fun res!80466 () Bool)

(assert (=> b!169066 (=> (not res!80466) (not e!111270))))

(get-info :version)

(assert (=> b!169066 (= res!80466 (and (not ((_ is Undefined!517) lt!84807)) (not ((_ is MissingVacant!517) lt!84807)) (not ((_ is MissingZero!517) lt!84807)) ((_ is Found!517) lt!84807)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6891 (_ BitVec 32)) SeekEntryResult!517)

(assert (=> b!169066 (= lt!84807 (seekEntryOrOpen!0 key!828 (_keys!5326 thiss!1248) (mask!8278 thiss!1248)))))

(declare-fun b!169067 () Bool)

(assert (=> b!169067 (= e!111271 tp_is_empty!3897)))

(declare-fun e!111274 () Bool)

(declare-fun array_inv!2109 (array!6891) Bool)

(declare-fun array_inv!2110 (array!6893) Bool)

(assert (=> b!169068 (= e!111274 (and tp!14885 tp_is_empty!3897 (array_inv!2109 (_keys!5326 thiss!1248)) (array_inv!2110 (_values!3484 thiss!1248)) e!111275))))

(declare-fun b!169062 () Bool)

(assert (=> b!169062 (= e!111270 (not true))))

(declare-fun lt!84804 () Bool)

(declare-fun lt!84806 () array!6893)

(declare-fun valid!917 (LongMapFixedSize!2118) Bool)

(assert (=> b!169062 (= lt!84804 (valid!917 (LongMapFixedSize!2119 (defaultEntry!3501 thiss!1248) (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) (_size!1108 thiss!1248) (_keys!5326 thiss!1248) lt!84806 (_vacant!1108 thiss!1248))))))

(declare-datatypes ((tuple2!3192 0))(
  ( (tuple2!3193 (_1!1607 (_ BitVec 64)) (_2!1607 V!4843)) )
))
(declare-datatypes ((List!2177 0))(
  ( (Nil!2174) (Cons!2173 (h!2790 tuple2!3192) (t!6979 List!2177)) )
))
(declare-datatypes ((ListLongMap!2147 0))(
  ( (ListLongMap!2148 (toList!1089 List!2177)) )
))
(declare-fun lt!84799 () ListLongMap!2147)

(declare-fun contains!1131 (ListLongMap!2147 (_ BitVec 64)) Bool)

(assert (=> b!169062 (contains!1131 lt!84799 (select (arr!3281 (_keys!5326 thiss!1248)) (index!4237 lt!84807)))))

(declare-fun lt!84798 () Unit!5230)

(declare-fun lemmaValidKeyInArrayIsInListMap!142 (array!6891 array!6893 (_ BitVec 32) (_ BitVec 32) V!4843 V!4843 (_ BitVec 32) Int) Unit!5230)

(assert (=> b!169062 (= lt!84798 (lemmaValidKeyInArrayIsInListMap!142 (_keys!5326 thiss!1248) lt!84806 (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) (index!4237 lt!84807) (defaultEntry!3501 thiss!1248)))))

(declare-fun lt!84802 () ListLongMap!2147)

(assert (=> b!169062 (= lt!84802 lt!84799)))

(declare-fun getCurrentListMap!747 (array!6891 array!6893 (_ BitVec 32) (_ BitVec 32) V!4843 V!4843 (_ BitVec 32) Int) ListLongMap!2147)

(assert (=> b!169062 (= lt!84799 (getCurrentListMap!747 (_keys!5326 thiss!1248) lt!84806 (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3501 thiss!1248)))))

(declare-fun lt!84800 () ListLongMap!2147)

(declare-fun v!309 () V!4843)

(declare-fun +!241 (ListLongMap!2147 tuple2!3192) ListLongMap!2147)

(assert (=> b!169062 (= lt!84802 (+!241 lt!84800 (tuple2!3193 key!828 v!309)))))

(assert (=> b!169062 (= lt!84806 (array!6894 (store (arr!3282 (_values!3484 thiss!1248)) (index!4237 lt!84807) (ValueCellFull!1605 v!309)) (size!3570 (_values!3484 thiss!1248))))))

(declare-fun lt!84805 () Unit!5230)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!96 (array!6891 array!6893 (_ BitVec 32) (_ BitVec 32) V!4843 V!4843 (_ BitVec 32) (_ BitVec 64) V!4843 Int) Unit!5230)

(assert (=> b!169062 (= lt!84805 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!96 (_keys!5326 thiss!1248) (_values!3484 thiss!1248) (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) (index!4237 lt!84807) key!828 v!309 (defaultEntry!3501 thiss!1248)))))

(declare-fun lt!84808 () Unit!5230)

(assert (=> b!169062 (= lt!84808 e!111268)))

(declare-fun c!30424 () Bool)

(assert (=> b!169062 (= c!30424 (contains!1131 lt!84800 key!828))))

(assert (=> b!169062 (= lt!84800 (getCurrentListMap!747 (_keys!5326 thiss!1248) (_values!3484 thiss!1248) (mask!8278 thiss!1248) (extraKeys!3242 thiss!1248) (zeroValue!3344 thiss!1248) (minValue!3344 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3501 thiss!1248)))))

(declare-fun res!80463 () Bool)

(assert (=> start!16790 (=> (not res!80463) (not e!111273))))

(assert (=> start!16790 (= res!80463 (valid!917 thiss!1248))))

(assert (=> start!16790 e!111273))

(assert (=> start!16790 e!111274))

(assert (=> start!16790 true))

(assert (=> start!16790 tp_is_empty!3897))

(assert (= (and start!16790 res!80463) b!169063))

(assert (= (and b!169063 res!80465) b!169066))

(assert (= (and b!169066 res!80466) b!169062))

(assert (= (and b!169062 c!30424) b!169065))

(assert (= (and b!169062 (not c!30424)) b!169059))

(assert (= (and b!169065 res!80464) b!169064))

(assert (= (and b!169061 condMapEmpty!6564) mapIsEmpty!6564))

(assert (= (and b!169061 (not condMapEmpty!6564)) mapNonEmpty!6564))

(assert (= (and mapNonEmpty!6564 ((_ is ValueCellFull!1605) mapValue!6564)) b!169060))

(assert (= (and b!169061 ((_ is ValueCellFull!1605) mapDefault!6564)) b!169067))

(assert (= b!169068 b!169061))

(assert (= start!16790 b!169068))

(declare-fun m!198207 () Bool)

(assert (=> b!169066 m!198207))

(declare-fun m!198209 () Bool)

(assert (=> b!169062 m!198209))

(declare-fun m!198211 () Bool)

(assert (=> b!169062 m!198211))

(declare-fun m!198213 () Bool)

(assert (=> b!169062 m!198213))

(declare-fun m!198215 () Bool)

(assert (=> b!169062 m!198215))

(declare-fun m!198217 () Bool)

(assert (=> b!169062 m!198217))

(declare-fun m!198219 () Bool)

(assert (=> b!169062 m!198219))

(declare-fun m!198221 () Bool)

(assert (=> b!169062 m!198221))

(declare-fun m!198223 () Bool)

(assert (=> b!169062 m!198223))

(assert (=> b!169062 m!198209))

(declare-fun m!198225 () Bool)

(assert (=> b!169062 m!198225))

(declare-fun m!198227 () Bool)

(assert (=> b!169062 m!198227))

(assert (=> b!169064 m!198209))

(declare-fun m!198229 () Bool)

(assert (=> mapNonEmpty!6564 m!198229))

(declare-fun m!198231 () Bool)

(assert (=> b!169065 m!198231))

(declare-fun m!198233 () Bool)

(assert (=> b!169065 m!198233))

(declare-fun m!198235 () Bool)

(assert (=> b!169059 m!198235))

(declare-fun m!198237 () Bool)

(assert (=> b!169068 m!198237))

(declare-fun m!198239 () Bool)

(assert (=> b!169068 m!198239))

(declare-fun m!198241 () Bool)

(assert (=> start!16790 m!198241))

(check-sat (not b_next!4095) tp_is_empty!3897 (not mapNonEmpty!6564) (not b!169059) (not b!169062) (not b!169066) (not b!169065) b_and!10509 (not start!16790) (not b!169068))
(check-sat b_and!10509 (not b_next!4095))
