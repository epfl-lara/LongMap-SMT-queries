; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16780 () Bool)

(assert start!16780)

(declare-fun b!168897 () Bool)

(declare-fun b_free!4081 () Bool)

(declare-fun b_next!4081 () Bool)

(assert (=> b!168897 (= b_free!4081 (not b_next!4081))))

(declare-fun tp!14843 () Bool)

(declare-fun b_and!10509 () Bool)

(assert (=> b!168897 (= tp!14843 b_and!10509)))

(declare-fun b!168889 () Bool)

(declare-datatypes ((Unit!5219 0))(
  ( (Unit!5220) )
))
(declare-fun e!111101 () Unit!5219)

(declare-fun lt!84625 () Unit!5219)

(assert (=> b!168889 (= e!111101 lt!84625)))

(declare-datatypes ((V!4825 0))(
  ( (V!4826 (val!1986 Int)) )
))
(declare-datatypes ((ValueCell!1598 0))(
  ( (ValueCellFull!1598 (v!3852 V!4825)) (EmptyCell!1598) )
))
(declare-datatypes ((array!6849 0))(
  ( (array!6850 (arr!3260 (Array (_ BitVec 32) (_ BitVec 64))) (size!3548 (_ BitVec 32))) )
))
(declare-datatypes ((array!6851 0))(
  ( (array!6852 (arr!3261 (Array (_ BitVec 32) ValueCell!1598)) (size!3549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2104 0))(
  ( (LongMapFixedSize!2105 (defaultEntry!3494 Int) (mask!8267 (_ BitVec 32)) (extraKeys!3235 (_ BitVec 32)) (zeroValue!3337 V!4825) (minValue!3337 V!4825) (_size!1101 (_ BitVec 32)) (_keys!5319 array!6849) (_values!3477 array!6851) (_vacant!1101 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2104)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (array!6849 array!6851 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 64) Int) Unit!5219)

(assert (=> b!168889 (= lt!84625 (lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) key!828 (defaultEntry!3494 thiss!1248)))))

(declare-fun res!80397 () Bool)

(declare-datatypes ((SeekEntryResult!504 0))(
  ( (MissingZero!504 (index!4184 (_ BitVec 32))) (Found!504 (index!4185 (_ BitVec 32))) (Intermediate!504 (undefined!1316 Bool) (index!4186 (_ BitVec 32)) (x!18652 (_ BitVec 32))) (Undefined!504) (MissingVacant!504 (index!4187 (_ BitVec 32))) )
))
(declare-fun lt!84623 () SeekEntryResult!504)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168889 (= res!80397 (inRange!0 (index!4185 lt!84623) (mask!8267 thiss!1248)))))

(declare-fun e!111095 () Bool)

(assert (=> b!168889 (=> (not res!80397) (not e!111095))))

(assert (=> b!168889 e!111095))

(declare-fun b!168890 () Bool)

(declare-fun e!111097 () Bool)

(assert (=> b!168890 (= e!111097 true)))

(declare-fun lt!84620 () Bool)

(declare-fun lt!84629 () LongMapFixedSize!2104)

(declare-datatypes ((tuple2!3148 0))(
  ( (tuple2!3149 (_1!1585 (_ BitVec 64)) (_2!1585 V!4825)) )
))
(declare-datatypes ((List!2155 0))(
  ( (Nil!2152) (Cons!2151 (h!2768 tuple2!3148) (t!6949 List!2155)) )
))
(declare-datatypes ((ListLongMap!2109 0))(
  ( (ListLongMap!2110 (toList!1070 List!2155)) )
))
(declare-fun contains!1122 (ListLongMap!2109 (_ BitVec 64)) Bool)

(declare-fun map!1800 (LongMapFixedSize!2104) ListLongMap!2109)

(assert (=> b!168890 (= lt!84620 (contains!1122 (map!1800 lt!84629) key!828))))

(declare-fun b!168891 () Bool)

(assert (=> b!168891 (= e!111095 (= (select (arr!3260 (_keys!5319 thiss!1248)) (index!4185 lt!84623)) key!828))))

(declare-fun b!168892 () Bool)

(declare-fun e!111102 () Bool)

(declare-fun tp_is_empty!3883 () Bool)

(assert (=> b!168892 (= e!111102 tp_is_empty!3883)))

(declare-fun b!168893 () Bool)

(declare-fun e!111103 () Bool)

(declare-fun mapRes!6543 () Bool)

(assert (=> b!168893 (= e!111103 (and e!111102 mapRes!6543))))

(declare-fun condMapEmpty!6543 () Bool)

(declare-fun mapDefault!6543 () ValueCell!1598)

(assert (=> b!168893 (= condMapEmpty!6543 (= (arr!3261 (_values!3477 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1598)) mapDefault!6543)))))

(declare-fun mapNonEmpty!6543 () Bool)

(declare-fun tp!14844 () Bool)

(declare-fun e!111104 () Bool)

(assert (=> mapNonEmpty!6543 (= mapRes!6543 (and tp!14844 e!111104))))

(declare-fun mapValue!6543 () ValueCell!1598)

(declare-fun mapKey!6543 () (_ BitVec 32))

(declare-fun mapRest!6543 () (Array (_ BitVec 32) ValueCell!1598))

(assert (=> mapNonEmpty!6543 (= (arr!3261 (_values!3477 thiss!1248)) (store mapRest!6543 mapKey!6543 mapValue!6543))))

(declare-fun b!168894 () Bool)

(declare-fun res!80396 () Bool)

(declare-fun e!111100 () Bool)

(assert (=> b!168894 (=> (not res!80396) (not e!111100))))

(assert (=> b!168894 (= res!80396 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168895 () Bool)

(declare-fun Unit!5221 () Unit!5219)

(assert (=> b!168895 (= e!111101 Unit!5221)))

(declare-fun lt!84628 () Unit!5219)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!125 (array!6849 array!6851 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 64) Int) Unit!5219)

(assert (=> b!168895 (= lt!84628 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!125 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) key!828 (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168895 false))

(declare-fun res!80394 () Bool)

(assert (=> start!16780 (=> (not res!80394) (not e!111100))))

(declare-fun valid!920 (LongMapFixedSize!2104) Bool)

(assert (=> start!16780 (= res!80394 (valid!920 thiss!1248))))

(assert (=> start!16780 e!111100))

(declare-fun e!111099 () Bool)

(assert (=> start!16780 e!111099))

(assert (=> start!16780 true))

(assert (=> start!16780 tp_is_empty!3883))

(declare-fun b!168896 () Bool)

(declare-fun e!111096 () Bool)

(assert (=> b!168896 (= e!111096 (not e!111097))))

(declare-fun res!80395 () Bool)

(assert (=> b!168896 (=> res!80395 e!111097)))

(assert (=> b!168896 (= res!80395 (not (valid!920 lt!84629)))))

(declare-fun lt!84630 () ListLongMap!2109)

(assert (=> b!168896 (contains!1122 lt!84630 (select (arr!3260 (_keys!5319 thiss!1248)) (index!4185 lt!84623)))))

(declare-fun lt!84624 () Unit!5219)

(declare-fun lt!84626 () array!6851)

(declare-fun lemmaValidKeyInArrayIsInListMap!135 (array!6849 array!6851 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) Unit!5219)

(assert (=> b!168896 (= lt!84624 (lemmaValidKeyInArrayIsInListMap!135 (_keys!5319 thiss!1248) lt!84626 (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4185 lt!84623) (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168896 (= lt!84629 (LongMapFixedSize!2105 (defaultEntry!3494 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (_size!1101 thiss!1248) (_keys!5319 thiss!1248) lt!84626 (_vacant!1101 thiss!1248)))))

(declare-fun lt!84622 () ListLongMap!2109)

(assert (=> b!168896 (= lt!84622 lt!84630)))

(declare-fun getCurrentListMap!731 (array!6849 array!6851 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) ListLongMap!2109)

(assert (=> b!168896 (= lt!84630 (getCurrentListMap!731 (_keys!5319 thiss!1248) lt!84626 (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun v!309 () V!4825)

(declare-fun lt!84621 () ListLongMap!2109)

(declare-fun +!237 (ListLongMap!2109 tuple2!3148) ListLongMap!2109)

(assert (=> b!168896 (= lt!84622 (+!237 lt!84621 (tuple2!3149 key!828 v!309)))))

(assert (=> b!168896 (= lt!84626 (array!6852 (store (arr!3261 (_values!3477 thiss!1248)) (index!4185 lt!84623) (ValueCellFull!1598 v!309)) (size!3549 (_values!3477 thiss!1248))))))

(declare-fun lt!84619 () Unit!5219)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!95 (array!6849 array!6851 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) (_ BitVec 64) V!4825 Int) Unit!5219)

(assert (=> b!168896 (= lt!84619 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!95 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4185 lt!84623) key!828 v!309 (defaultEntry!3494 thiss!1248)))))

(declare-fun lt!84627 () Unit!5219)

(assert (=> b!168896 (= lt!84627 e!111101)))

(declare-fun c!30416 () Bool)

(assert (=> b!168896 (= c!30416 (contains!1122 lt!84621 key!828))))

(assert (=> b!168896 (= lt!84621 (getCurrentListMap!731 (_keys!5319 thiss!1248) (_values!3477 thiss!1248) (mask!8267 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun mapIsEmpty!6543 () Bool)

(assert (=> mapIsEmpty!6543 mapRes!6543))

(declare-fun array_inv!2091 (array!6849) Bool)

(declare-fun array_inv!2092 (array!6851) Bool)

(assert (=> b!168897 (= e!111099 (and tp!14843 tp_is_empty!3883 (array_inv!2091 (_keys!5319 thiss!1248)) (array_inv!2092 (_values!3477 thiss!1248)) e!111103))))

(declare-fun b!168898 () Bool)

(assert (=> b!168898 (= e!111100 e!111096)))

(declare-fun res!80393 () Bool)

(assert (=> b!168898 (=> (not res!80393) (not e!111096))))

(get-info :version)

(assert (=> b!168898 (= res!80393 (and (not ((_ is Undefined!504) lt!84623)) (not ((_ is MissingVacant!504) lt!84623)) (not ((_ is MissingZero!504) lt!84623)) ((_ is Found!504) lt!84623)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6849 (_ BitVec 32)) SeekEntryResult!504)

(assert (=> b!168898 (= lt!84623 (seekEntryOrOpen!0 key!828 (_keys!5319 thiss!1248) (mask!8267 thiss!1248)))))

(declare-fun b!168899 () Bool)

(assert (=> b!168899 (= e!111104 tp_is_empty!3883)))

(assert (= (and start!16780 res!80394) b!168894))

(assert (= (and b!168894 res!80396) b!168898))

(assert (= (and b!168898 res!80393) b!168896))

(assert (= (and b!168896 c!30416) b!168889))

(assert (= (and b!168896 (not c!30416)) b!168895))

(assert (= (and b!168889 res!80397) b!168891))

(assert (= (and b!168896 (not res!80395)) b!168890))

(assert (= (and b!168893 condMapEmpty!6543) mapIsEmpty!6543))

(assert (= (and b!168893 (not condMapEmpty!6543)) mapNonEmpty!6543))

(assert (= (and mapNonEmpty!6543 ((_ is ValueCellFull!1598) mapValue!6543)) b!168899))

(assert (= (and b!168893 ((_ is ValueCellFull!1598) mapDefault!6543)) b!168892))

(assert (= b!168897 b!168893))

(assert (= start!16780 b!168897))

(declare-fun m!198125 () Bool)

(assert (=> start!16780 m!198125))

(declare-fun m!198127 () Bool)

(assert (=> b!168896 m!198127))

(declare-fun m!198129 () Bool)

(assert (=> b!168896 m!198129))

(declare-fun m!198131 () Bool)

(assert (=> b!168896 m!198131))

(declare-fun m!198133 () Bool)

(assert (=> b!168896 m!198133))

(assert (=> b!168896 m!198127))

(declare-fun m!198135 () Bool)

(assert (=> b!168896 m!198135))

(declare-fun m!198137 () Bool)

(assert (=> b!168896 m!198137))

(declare-fun m!198139 () Bool)

(assert (=> b!168896 m!198139))

(declare-fun m!198141 () Bool)

(assert (=> b!168896 m!198141))

(declare-fun m!198143 () Bool)

(assert (=> b!168896 m!198143))

(declare-fun m!198145 () Bool)

(assert (=> b!168896 m!198145))

(declare-fun m!198147 () Bool)

(assert (=> b!168889 m!198147))

(declare-fun m!198149 () Bool)

(assert (=> b!168889 m!198149))

(declare-fun m!198151 () Bool)

(assert (=> b!168895 m!198151))

(declare-fun m!198153 () Bool)

(assert (=> b!168898 m!198153))

(declare-fun m!198155 () Bool)

(assert (=> b!168890 m!198155))

(assert (=> b!168890 m!198155))

(declare-fun m!198157 () Bool)

(assert (=> b!168890 m!198157))

(assert (=> b!168891 m!198127))

(declare-fun m!198159 () Bool)

(assert (=> mapNonEmpty!6543 m!198159))

(declare-fun m!198161 () Bool)

(assert (=> b!168897 m!198161))

(declare-fun m!198163 () Bool)

(assert (=> b!168897 m!198163))

(check-sat b_and!10509 (not mapNonEmpty!6543) (not b_next!4081) tp_is_empty!3883 (not b!168889) (not b!168897) (not b!168895) (not b!168890) (not start!16780) (not b!168896) (not b!168898))
(check-sat b_and!10509 (not b_next!4081))
