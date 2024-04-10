; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16574 () Bool)

(assert start!16574)

(declare-fun b!165147 () Bool)

(declare-fun b_free!3879 () Bool)

(declare-fun b_next!3879 () Bool)

(assert (=> b!165147 (= b_free!3879 (not b_next!3879))))

(declare-fun tp!14238 () Bool)

(declare-fun b_and!10293 () Bool)

(assert (=> b!165147 (= tp!14238 b_and!10293)))

(declare-fun b!165140 () Bool)

(declare-fun e!108334 () Bool)

(assert (=> b!165140 (= e!108334 false)))

(declare-fun lt!83016 () Bool)

(declare-datatypes ((V!4555 0))(
  ( (V!4556 (val!1885 Int)) )
))
(declare-datatypes ((ValueCell!1497 0))(
  ( (ValueCellFull!1497 (v!3750 V!4555)) (EmptyCell!1497) )
))
(declare-datatypes ((array!6459 0))(
  ( (array!6460 (arr!3065 (Array (_ BitVec 32) (_ BitVec 64))) (size!3353 (_ BitVec 32))) )
))
(declare-datatypes ((array!6461 0))(
  ( (array!6462 (arr!3066 (Array (_ BitVec 32) ValueCell!1497)) (size!3354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1902 0))(
  ( (LongMapFixedSize!1903 (defaultEntry!3393 Int) (mask!8098 (_ BitVec 32)) (extraKeys!3134 (_ BitVec 32)) (zeroValue!3236 V!4555) (minValue!3236 V!4555) (_size!1000 (_ BitVec 32)) (_keys!5218 array!6459) (_values!3376 array!6461) (_vacant!1000 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1902)

(declare-datatypes ((List!2036 0))(
  ( (Nil!2033) (Cons!2032 (h!2649 (_ BitVec 64)) (t!6838 List!2036)) )
))
(declare-fun arrayNoDuplicates!0 (array!6459 (_ BitVec 32) List!2036) Bool)

(assert (=> b!165140 (= lt!83016 (arrayNoDuplicates!0 (_keys!5218 thiss!1248) #b00000000000000000000000000000000 Nil!2033))))

(declare-fun b!165141 () Bool)

(declare-fun e!108338 () Bool)

(declare-fun tp_is_empty!3681 () Bool)

(assert (=> b!165141 (= e!108338 tp_is_empty!3681)))

(declare-fun b!165142 () Bool)

(declare-fun res!78302 () Bool)

(assert (=> b!165142 (=> (not res!78302) (not e!108334))))

(assert (=> b!165142 (= res!78302 (and (= (size!3354 (_values!3376 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8098 thiss!1248))) (= (size!3353 (_keys!5218 thiss!1248)) (size!3354 (_values!3376 thiss!1248))) (bvsge (mask!8098 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3134 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3134 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165143 () Bool)

(declare-fun res!78306 () Bool)

(assert (=> b!165143 (=> (not res!78306) (not e!108334))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3054 0))(
  ( (tuple2!3055 (_1!1538 (_ BitVec 64)) (_2!1538 V!4555)) )
))
(declare-datatypes ((List!2037 0))(
  ( (Nil!2034) (Cons!2033 (h!2650 tuple2!3054) (t!6839 List!2037)) )
))
(declare-datatypes ((ListLongMap!2009 0))(
  ( (ListLongMap!2010 (toList!1020 List!2037)) )
))
(declare-fun contains!1062 (ListLongMap!2009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!678 (array!6459 array!6461 (_ BitVec 32) (_ BitVec 32) V!4555 V!4555 (_ BitVec 32) Int) ListLongMap!2009)

(assert (=> b!165143 (= res!78306 (contains!1062 (getCurrentListMap!678 (_keys!5218 thiss!1248) (_values!3376 thiss!1248) (mask!8098 thiss!1248) (extraKeys!3134 thiss!1248) (zeroValue!3236 thiss!1248) (minValue!3236 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3393 thiss!1248)) key!828))))

(declare-fun b!165144 () Bool)

(declare-fun res!78300 () Bool)

(declare-fun e!108337 () Bool)

(assert (=> b!165144 (=> (not res!78300) (not e!108337))))

(assert (=> b!165144 (= res!78300 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165145 () Bool)

(declare-fun e!108332 () Bool)

(assert (=> b!165145 (= e!108332 tp_is_empty!3681)))

(declare-fun b!165146 () Bool)

(assert (=> b!165146 (= e!108337 e!108334)))

(declare-fun res!78304 () Bool)

(assert (=> b!165146 (=> (not res!78304) (not e!108334))))

(declare-datatypes ((SeekEntryResult!429 0))(
  ( (MissingZero!429 (index!3884 (_ BitVec 32))) (Found!429 (index!3885 (_ BitVec 32))) (Intermediate!429 (undefined!1241 Bool) (index!3886 (_ BitVec 32)) (x!18305 (_ BitVec 32))) (Undefined!429) (MissingVacant!429 (index!3887 (_ BitVec 32))) )
))
(declare-fun lt!83017 () SeekEntryResult!429)

(get-info :version)

(assert (=> b!165146 (= res!78304 (and (not ((_ is Undefined!429) lt!83017)) (not ((_ is MissingVacant!429) lt!83017)) (not ((_ is MissingZero!429) lt!83017)) ((_ is Found!429) lt!83017)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6459 (_ BitVec 32)) SeekEntryResult!429)

(assert (=> b!165146 (= lt!83017 (seekEntryOrOpen!0 key!828 (_keys!5218 thiss!1248) (mask!8098 thiss!1248)))))

(declare-fun mapIsEmpty!6240 () Bool)

(declare-fun mapRes!6240 () Bool)

(assert (=> mapIsEmpty!6240 mapRes!6240))

(declare-fun e!108336 () Bool)

(declare-fun e!108333 () Bool)

(declare-fun array_inv!1967 (array!6459) Bool)

(declare-fun array_inv!1968 (array!6461) Bool)

(assert (=> b!165147 (= e!108333 (and tp!14238 tp_is_empty!3681 (array_inv!1967 (_keys!5218 thiss!1248)) (array_inv!1968 (_values!3376 thiss!1248)) e!108336))))

(declare-fun b!165148 () Bool)

(declare-fun res!78301 () Bool)

(assert (=> b!165148 (=> (not res!78301) (not e!108334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6459 (_ BitVec 32)) Bool)

(assert (=> b!165148 (= res!78301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5218 thiss!1248) (mask!8098 thiss!1248)))))

(declare-fun b!165149 () Bool)

(assert (=> b!165149 (= e!108336 (and e!108332 mapRes!6240))))

(declare-fun condMapEmpty!6240 () Bool)

(declare-fun mapDefault!6240 () ValueCell!1497)

(assert (=> b!165149 (= condMapEmpty!6240 (= (arr!3066 (_values!3376 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1497)) mapDefault!6240)))))

(declare-fun b!165150 () Bool)

(declare-fun res!78303 () Bool)

(assert (=> b!165150 (=> (not res!78303) (not e!108334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165150 (= res!78303 (validMask!0 (mask!8098 thiss!1248)))))

(declare-fun mapNonEmpty!6240 () Bool)

(declare-fun tp!14237 () Bool)

(assert (=> mapNonEmpty!6240 (= mapRes!6240 (and tp!14237 e!108338))))

(declare-fun mapValue!6240 () ValueCell!1497)

(declare-fun mapRest!6240 () (Array (_ BitVec 32) ValueCell!1497))

(declare-fun mapKey!6240 () (_ BitVec 32))

(assert (=> mapNonEmpty!6240 (= (arr!3066 (_values!3376 thiss!1248)) (store mapRest!6240 mapKey!6240 mapValue!6240))))

(declare-fun res!78305 () Bool)

(assert (=> start!16574 (=> (not res!78305) (not e!108337))))

(declare-fun valid!842 (LongMapFixedSize!1902) Bool)

(assert (=> start!16574 (= res!78305 (valid!842 thiss!1248))))

(assert (=> start!16574 e!108337))

(assert (=> start!16574 e!108333))

(assert (=> start!16574 true))

(assert (= (and start!16574 res!78305) b!165144))

(assert (= (and b!165144 res!78300) b!165146))

(assert (= (and b!165146 res!78304) b!165143))

(assert (= (and b!165143 res!78306) b!165150))

(assert (= (and b!165150 res!78303) b!165142))

(assert (= (and b!165142 res!78302) b!165148))

(assert (= (and b!165148 res!78301) b!165140))

(assert (= (and b!165149 condMapEmpty!6240) mapIsEmpty!6240))

(assert (= (and b!165149 (not condMapEmpty!6240)) mapNonEmpty!6240))

(assert (= (and mapNonEmpty!6240 ((_ is ValueCellFull!1497) mapValue!6240)) b!165141))

(assert (= (and b!165149 ((_ is ValueCellFull!1497) mapDefault!6240)) b!165145))

(assert (= b!165147 b!165149))

(assert (= start!16574 b!165147))

(declare-fun m!195071 () Bool)

(assert (=> b!165150 m!195071))

(declare-fun m!195073 () Bool)

(assert (=> b!165140 m!195073))

(declare-fun m!195075 () Bool)

(assert (=> b!165143 m!195075))

(assert (=> b!165143 m!195075))

(declare-fun m!195077 () Bool)

(assert (=> b!165143 m!195077))

(declare-fun m!195079 () Bool)

(assert (=> b!165148 m!195079))

(declare-fun m!195081 () Bool)

(assert (=> b!165146 m!195081))

(declare-fun m!195083 () Bool)

(assert (=> start!16574 m!195083))

(declare-fun m!195085 () Bool)

(assert (=> mapNonEmpty!6240 m!195085))

(declare-fun m!195087 () Bool)

(assert (=> b!165147 m!195087))

(declare-fun m!195089 () Bool)

(assert (=> b!165147 m!195089))

(check-sat b_and!10293 (not b!165143) (not b!165147) (not b!165148) (not mapNonEmpty!6240) (not b_next!3879) (not b!165140) (not b!165146) tp_is_empty!3681 (not b!165150) (not start!16574))
(check-sat b_and!10293 (not b_next!3879))
