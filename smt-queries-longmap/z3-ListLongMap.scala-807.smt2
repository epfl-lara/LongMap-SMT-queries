; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19506 () Bool)

(assert start!19506)

(declare-fun b!191539 () Bool)

(declare-fun b_free!4683 () Bool)

(declare-fun b_next!4683 () Bool)

(assert (=> b!191539 (= b_free!4683 (not b_next!4683))))

(declare-fun tp!16899 () Bool)

(declare-fun b_and!11357 () Bool)

(assert (=> b!191539 (= tp!16899 b_and!11357)))

(declare-fun b!191538 () Bool)

(declare-fun res!90526 () Bool)

(declare-fun e!126057 () Bool)

(assert (=> b!191538 (=> (not res!90526) (not e!126057))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!191538 (= res!90526 (not (= key!828 (bvneg key!828))))))

(declare-fun e!126055 () Bool)

(declare-fun tp_is_empty!4455 () Bool)

(declare-datatypes ((V!5587 0))(
  ( (V!5588 (val!2272 Int)) )
))
(declare-datatypes ((ValueCell!1884 0))(
  ( (ValueCellFull!1884 (v!4212 V!5587)) (EmptyCell!1884) )
))
(declare-datatypes ((array!8149 0))(
  ( (array!8150 (arr!3839 (Array (_ BitVec 32) (_ BitVec 64))) (size!4161 (_ BitVec 32))) )
))
(declare-datatypes ((array!8151 0))(
  ( (array!8152 (arr!3840 (Array (_ BitVec 32) ValueCell!1884)) (size!4162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2676 0))(
  ( (LongMapFixedSize!2677 (defaultEntry!3910 Int) (mask!9131 (_ BitVec 32)) (extraKeys!3647 (_ BitVec 32)) (zeroValue!3751 V!5587) (minValue!3751 V!5587) (_size!1387 (_ BitVec 32)) (_keys!5888 array!8149) (_values!3893 array!8151) (_vacant!1387 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2676)

(declare-fun e!126059 () Bool)

(declare-fun array_inv!2489 (array!8149) Bool)

(declare-fun array_inv!2490 (array!8151) Bool)

(assert (=> b!191539 (= e!126055 (and tp!16899 tp_is_empty!4455 (array_inv!2489 (_keys!5888 thiss!1248)) (array_inv!2490 (_values!3893 thiss!1248)) e!126059))))

(declare-fun e!126058 () Bool)

(declare-datatypes ((SeekEntryResult!679 0))(
  ( (MissingZero!679 (index!4886 (_ BitVec 32))) (Found!679 (index!4887 (_ BitVec 32))) (Intermediate!679 (undefined!1491 Bool) (index!4888 (_ BitVec 32)) (x!20551 (_ BitVec 32))) (Undefined!679) (MissingVacant!679 (index!4889 (_ BitVec 32))) )
))
(declare-fun lt!95108 () SeekEntryResult!679)

(declare-fun b!191540 () Bool)

(assert (=> b!191540 (= e!126058 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4887 lt!95108)) key!828))))

(declare-fun mapIsEmpty!7695 () Bool)

(declare-fun mapRes!7695 () Bool)

(assert (=> mapIsEmpty!7695 mapRes!7695))

(declare-fun b!191541 () Bool)

(declare-fun e!126052 () Bool)

(assert (=> b!191541 (= e!126052 (or (not (= (size!4162 (_values!3893 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9131 thiss!1248)))) (not (= (size!4161 (_keys!5888 thiss!1248)) (size!4162 (_values!3893 thiss!1248)))) (bvslt (mask!9131 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3647 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191542 () Bool)

(declare-fun e!126060 () Bool)

(assert (=> b!191542 (= e!126059 (and e!126060 mapRes!7695))))

(declare-fun condMapEmpty!7695 () Bool)

(declare-fun mapDefault!7695 () ValueCell!1884)

(assert (=> b!191542 (= condMapEmpty!7695 (= (arr!3840 (_values!3893 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1884)) mapDefault!7695)))))

(declare-fun res!90523 () Bool)

(assert (=> start!19506 (=> (not res!90523) (not e!126057))))

(declare-fun valid!1098 (LongMapFixedSize!2676) Bool)

(assert (=> start!19506 (= res!90523 (valid!1098 thiss!1248))))

(assert (=> start!19506 e!126057))

(assert (=> start!19506 e!126055))

(assert (=> start!19506 true))

(assert (=> start!19506 tp_is_empty!4455))

(declare-fun b!191543 () Bool)

(declare-fun e!126056 () Bool)

(assert (=> b!191543 (= e!126057 e!126056)))

(declare-fun res!90524 () Bool)

(assert (=> b!191543 (=> (not res!90524) (not e!126056))))

(get-info :version)

(assert (=> b!191543 (= res!90524 (and (not ((_ is Undefined!679) lt!95108)) (not ((_ is MissingVacant!679) lt!95108)) (not ((_ is MissingZero!679) lt!95108)) ((_ is Found!679) lt!95108)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8149 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!191543 (= lt!95108 (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun b!191544 () Bool)

(declare-datatypes ((Unit!5793 0))(
  ( (Unit!5794) )
))
(declare-fun e!126051 () Unit!5793)

(declare-fun Unit!5795 () Unit!5793)

(assert (=> b!191544 (= e!126051 Unit!5795)))

(declare-fun lt!95110 () Unit!5793)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!181 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 64) Int) Unit!5793)

(assert (=> b!191544 (= lt!95110 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!181 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)))))

(assert (=> b!191544 false))

(declare-fun mapNonEmpty!7695 () Bool)

(declare-fun tp!16898 () Bool)

(declare-fun e!126053 () Bool)

(assert (=> mapNonEmpty!7695 (= mapRes!7695 (and tp!16898 e!126053))))

(declare-fun mapValue!7695 () ValueCell!1884)

(declare-fun mapKey!7695 () (_ BitVec 32))

(declare-fun mapRest!7695 () (Array (_ BitVec 32) ValueCell!1884))

(assert (=> mapNonEmpty!7695 (= (arr!3840 (_values!3893 thiss!1248)) (store mapRest!7695 mapKey!7695 mapValue!7695))))

(declare-fun b!191545 () Bool)

(assert (=> b!191545 (= e!126053 tp_is_empty!4455)))

(declare-fun b!191546 () Bool)

(assert (=> b!191546 (= e!126056 (not e!126052))))

(declare-fun res!90522 () Bool)

(assert (=> b!191546 (=> res!90522 e!126052)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191546 (= res!90522 (not (validMask!0 (mask!9131 thiss!1248))))))

(declare-datatypes ((tuple2!3532 0))(
  ( (tuple2!3533 (_1!1777 (_ BitVec 64)) (_2!1777 V!5587)) )
))
(declare-datatypes ((List!2425 0))(
  ( (Nil!2422) (Cons!2421 (h!3060 tuple2!3532) (t!7339 List!2425)) )
))
(declare-datatypes ((ListLongMap!2449 0))(
  ( (ListLongMap!2450 (toList!1240 List!2425)) )
))
(declare-fun lt!95111 () ListLongMap!2449)

(declare-fun v!309 () V!5587)

(declare-fun +!308 (ListLongMap!2449 tuple2!3532) ListLongMap!2449)

(declare-fun getCurrentListMap!888 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 32) Int) ListLongMap!2449)

(assert (=> b!191546 (= (+!308 lt!95111 (tuple2!3533 key!828 v!309)) (getCurrentListMap!888 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95106 () Unit!5793)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!109 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 32) (_ BitVec 64) V!5587 Int) Unit!5793)

(assert (=> b!191546 (= lt!95106 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!109 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (index!4887 lt!95108) key!828 v!309 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95107 () Unit!5793)

(assert (=> b!191546 (= lt!95107 e!126051)))

(declare-fun c!34481 () Bool)

(declare-fun contains!1354 (ListLongMap!2449 (_ BitVec 64)) Bool)

(assert (=> b!191546 (= c!34481 (contains!1354 lt!95111 key!828))))

(assert (=> b!191546 (= lt!95111 (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun b!191547 () Bool)

(declare-fun lt!95109 () Unit!5793)

(assert (=> b!191547 (= e!126051 lt!95109)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 64) Int) Unit!5793)

(assert (=> b!191547 (= lt!95109 (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)))))

(declare-fun res!90525 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191547 (= res!90525 (inRange!0 (index!4887 lt!95108) (mask!9131 thiss!1248)))))

(assert (=> b!191547 (=> (not res!90525) (not e!126058))))

(assert (=> b!191547 e!126058))

(declare-fun b!191548 () Bool)

(assert (=> b!191548 (= e!126060 tp_is_empty!4455)))

(assert (= (and start!19506 res!90523) b!191538))

(assert (= (and b!191538 res!90526) b!191543))

(assert (= (and b!191543 res!90524) b!191546))

(assert (= (and b!191546 c!34481) b!191547))

(assert (= (and b!191546 (not c!34481)) b!191544))

(assert (= (and b!191547 res!90525) b!191540))

(assert (= (and b!191546 (not res!90522)) b!191541))

(assert (= (and b!191542 condMapEmpty!7695) mapIsEmpty!7695))

(assert (= (and b!191542 (not condMapEmpty!7695)) mapNonEmpty!7695))

(assert (= (and mapNonEmpty!7695 ((_ is ValueCellFull!1884) mapValue!7695)) b!191545))

(assert (= (and b!191542 ((_ is ValueCellFull!1884) mapDefault!7695)) b!191548))

(assert (= b!191539 b!191542))

(assert (= start!19506 b!191539))

(declare-fun m!218119 () Bool)

(assert (=> b!191540 m!218119))

(declare-fun m!218121 () Bool)

(assert (=> b!191543 m!218121))

(declare-fun m!218123 () Bool)

(assert (=> b!191544 m!218123))

(declare-fun m!218125 () Bool)

(assert (=> b!191546 m!218125))

(declare-fun m!218127 () Bool)

(assert (=> b!191546 m!218127))

(declare-fun m!218129 () Bool)

(assert (=> b!191546 m!218129))

(declare-fun m!218131 () Bool)

(assert (=> b!191546 m!218131))

(declare-fun m!218133 () Bool)

(assert (=> b!191546 m!218133))

(declare-fun m!218135 () Bool)

(assert (=> b!191546 m!218135))

(declare-fun m!218137 () Bool)

(assert (=> b!191546 m!218137))

(declare-fun m!218139 () Bool)

(assert (=> b!191547 m!218139))

(declare-fun m!218141 () Bool)

(assert (=> b!191547 m!218141))

(declare-fun m!218143 () Bool)

(assert (=> mapNonEmpty!7695 m!218143))

(declare-fun m!218145 () Bool)

(assert (=> start!19506 m!218145))

(declare-fun m!218147 () Bool)

(assert (=> b!191539 m!218147))

(declare-fun m!218149 () Bool)

(assert (=> b!191539 m!218149))

(check-sat (not b!191543) (not b_next!4683) (not mapNonEmpty!7695) (not b!191546) tp_is_empty!4455 (not b!191547) b_and!11357 (not b!191539) (not start!19506) (not b!191544))
(check-sat b_and!11357 (not b_next!4683))
(get-model)

(declare-fun d!56155 () Bool)

(declare-fun res!90548 () Bool)

(declare-fun e!126093 () Bool)

(assert (=> d!56155 (=> (not res!90548) (not e!126093))))

(declare-fun simpleValid!198 (LongMapFixedSize!2676) Bool)

(assert (=> d!56155 (= res!90548 (simpleValid!198 thiss!1248))))

(assert (=> d!56155 (= (valid!1098 thiss!1248) e!126093)))

(declare-fun b!191588 () Bool)

(declare-fun res!90549 () Bool)

(assert (=> b!191588 (=> (not res!90549) (not e!126093))))

(declare-fun arrayCountValidKeys!0 (array!8149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191588 (= res!90549 (= (arrayCountValidKeys!0 (_keys!5888 thiss!1248) #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))) (_size!1387 thiss!1248)))))

(declare-fun b!191589 () Bool)

(declare-fun res!90550 () Bool)

(assert (=> b!191589 (=> (not res!90550) (not e!126093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8149 (_ BitVec 32)) Bool)

(assert (=> b!191589 (= res!90550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun b!191590 () Bool)

(declare-datatypes ((List!2427 0))(
  ( (Nil!2424) (Cons!2423 (h!3062 (_ BitVec 64)) (t!7343 List!2427)) )
))
(declare-fun arrayNoDuplicates!0 (array!8149 (_ BitVec 32) List!2427) Bool)

(assert (=> b!191590 (= e!126093 (arrayNoDuplicates!0 (_keys!5888 thiss!1248) #b00000000000000000000000000000000 Nil!2424))))

(assert (= (and d!56155 res!90548) b!191588))

(assert (= (and b!191588 res!90549) b!191589))

(assert (= (and b!191589 res!90550) b!191590))

(declare-fun m!218183 () Bool)

(assert (=> d!56155 m!218183))

(declare-fun m!218185 () Bool)

(assert (=> b!191588 m!218185))

(declare-fun m!218187 () Bool)

(assert (=> b!191589 m!218187))

(declare-fun m!218189 () Bool)

(assert (=> b!191590 m!218189))

(assert (=> start!19506 d!56155))

(declare-fun d!56157 () Bool)

(declare-fun e!126096 () Bool)

(assert (=> d!56157 e!126096))

(declare-fun res!90555 () Bool)

(assert (=> d!56157 (=> (not res!90555) (not e!126096))))

(declare-fun lt!95135 () SeekEntryResult!679)

(assert (=> d!56157 (= res!90555 ((_ is Found!679) lt!95135))))

(assert (=> d!56157 (= lt!95135 (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun lt!95134 () Unit!5793)

(declare-fun choose!1037 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 64) Int) Unit!5793)

(assert (=> d!56157 (= lt!95134 (choose!1037 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)))))

(assert (=> d!56157 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56157 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!174 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)) lt!95134)))

(declare-fun b!191595 () Bool)

(declare-fun res!90556 () Bool)

(assert (=> b!191595 (=> (not res!90556) (not e!126096))))

(assert (=> b!191595 (= res!90556 (inRange!0 (index!4887 lt!95135) (mask!9131 thiss!1248)))))

(declare-fun b!191596 () Bool)

(assert (=> b!191596 (= e!126096 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4887 lt!95135)) key!828))))

(assert (=> b!191596 (and (bvsge (index!4887 lt!95135) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95135) (size!4161 (_keys!5888 thiss!1248))))))

(assert (= (and d!56157 res!90555) b!191595))

(assert (= (and b!191595 res!90556) b!191596))

(assert (=> d!56157 m!218121))

(declare-fun m!218191 () Bool)

(assert (=> d!56157 m!218191))

(assert (=> d!56157 m!218137))

(declare-fun m!218193 () Bool)

(assert (=> b!191595 m!218193))

(declare-fun m!218195 () Bool)

(assert (=> b!191596 m!218195))

(assert (=> b!191547 d!56157))

(declare-fun d!56159 () Bool)

(assert (=> d!56159 (= (inRange!0 (index!4887 lt!95108) (mask!9131 thiss!1248)) (and (bvsge (index!4887 lt!95108) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95108) (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191547 d!56159))

(declare-fun d!56161 () Bool)

(declare-fun e!126102 () Bool)

(assert (=> d!56161 e!126102))

(declare-fun res!90559 () Bool)

(assert (=> d!56161 (=> res!90559 e!126102)))

(declare-fun lt!95145 () Bool)

(assert (=> d!56161 (= res!90559 (not lt!95145))))

(declare-fun lt!95146 () Bool)

(assert (=> d!56161 (= lt!95145 lt!95146)))

(declare-fun lt!95147 () Unit!5793)

(declare-fun e!126101 () Unit!5793)

(assert (=> d!56161 (= lt!95147 e!126101)))

(declare-fun c!34487 () Bool)

(assert (=> d!56161 (= c!34487 lt!95146)))

(declare-fun containsKey!243 (List!2425 (_ BitVec 64)) Bool)

(assert (=> d!56161 (= lt!95146 (containsKey!243 (toList!1240 lt!95111) key!828))))

(assert (=> d!56161 (= (contains!1354 lt!95111 key!828) lt!95145)))

(declare-fun b!191603 () Bool)

(declare-fun lt!95144 () Unit!5793)

(assert (=> b!191603 (= e!126101 lt!95144)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!191 (List!2425 (_ BitVec 64)) Unit!5793)

(assert (=> b!191603 (= lt!95144 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95111) key!828))))

(declare-datatypes ((Option!245 0))(
  ( (Some!244 (v!4216 V!5587)) (None!243) )
))
(declare-fun isDefined!192 (Option!245) Bool)

(declare-fun getValueByKey!239 (List!2425 (_ BitVec 64)) Option!245)

(assert (=> b!191603 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95111) key!828))))

(declare-fun b!191604 () Bool)

(declare-fun Unit!5799 () Unit!5793)

(assert (=> b!191604 (= e!126101 Unit!5799)))

(declare-fun b!191605 () Bool)

(assert (=> b!191605 (= e!126102 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95111) key!828)))))

(assert (= (and d!56161 c!34487) b!191603))

(assert (= (and d!56161 (not c!34487)) b!191604))

(assert (= (and d!56161 (not res!90559)) b!191605))

(declare-fun m!218197 () Bool)

(assert (=> d!56161 m!218197))

(declare-fun m!218199 () Bool)

(assert (=> b!191603 m!218199))

(declare-fun m!218201 () Bool)

(assert (=> b!191603 m!218201))

(assert (=> b!191603 m!218201))

(declare-fun m!218203 () Bool)

(assert (=> b!191603 m!218203))

(assert (=> b!191605 m!218201))

(assert (=> b!191605 m!218201))

(assert (=> b!191605 m!218203))

(assert (=> b!191546 d!56161))

(declare-fun d!56163 () Bool)

(assert (=> d!56163 (= (validMask!0 (mask!9131 thiss!1248)) (and (or (= (mask!9131 thiss!1248) #b00000000000000000000000000000111) (= (mask!9131 thiss!1248) #b00000000000000000000000000001111) (= (mask!9131 thiss!1248) #b00000000000000000000000000011111) (= (mask!9131 thiss!1248) #b00000000000000000000000000111111) (= (mask!9131 thiss!1248) #b00000000000000000000000001111111) (= (mask!9131 thiss!1248) #b00000000000000000000000011111111) (= (mask!9131 thiss!1248) #b00000000000000000000000111111111) (= (mask!9131 thiss!1248) #b00000000000000000000001111111111) (= (mask!9131 thiss!1248) #b00000000000000000000011111111111) (= (mask!9131 thiss!1248) #b00000000000000000000111111111111) (= (mask!9131 thiss!1248) #b00000000000000000001111111111111) (= (mask!9131 thiss!1248) #b00000000000000000011111111111111) (= (mask!9131 thiss!1248) #b00000000000000000111111111111111) (= (mask!9131 thiss!1248) #b00000000000000001111111111111111) (= (mask!9131 thiss!1248) #b00000000000000011111111111111111) (= (mask!9131 thiss!1248) #b00000000000000111111111111111111) (= (mask!9131 thiss!1248) #b00000000000001111111111111111111) (= (mask!9131 thiss!1248) #b00000000000011111111111111111111) (= (mask!9131 thiss!1248) #b00000000000111111111111111111111) (= (mask!9131 thiss!1248) #b00000000001111111111111111111111) (= (mask!9131 thiss!1248) #b00000000011111111111111111111111) (= (mask!9131 thiss!1248) #b00000000111111111111111111111111) (= (mask!9131 thiss!1248) #b00000001111111111111111111111111) (= (mask!9131 thiss!1248) #b00000011111111111111111111111111) (= (mask!9131 thiss!1248) #b00000111111111111111111111111111) (= (mask!9131 thiss!1248) #b00001111111111111111111111111111) (= (mask!9131 thiss!1248) #b00011111111111111111111111111111) (= (mask!9131 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9131 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191546 d!56163))

(declare-fun d!56165 () Bool)

(declare-fun e!126105 () Bool)

(assert (=> d!56165 e!126105))

(declare-fun res!90562 () Bool)

(assert (=> d!56165 (=> (not res!90562) (not e!126105))))

(assert (=> d!56165 (= res!90562 (and (bvsge (index!4887 lt!95108) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95108) (size!4162 (_values!3893 thiss!1248)))))))

(declare-fun lt!95150 () Unit!5793)

(declare-fun choose!1038 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 32) (_ BitVec 64) V!5587 Int) Unit!5793)

(assert (=> d!56165 (= lt!95150 (choose!1038 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (index!4887 lt!95108) key!828 v!309 (defaultEntry!3910 thiss!1248)))))

(assert (=> d!56165 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56165 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!109 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (index!4887 lt!95108) key!828 v!309 (defaultEntry!3910 thiss!1248)) lt!95150)))

(declare-fun b!191608 () Bool)

(assert (=> b!191608 (= e!126105 (= (+!308 (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) (tuple2!3533 key!828 v!309)) (getCurrentListMap!888 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248))))))

(assert (= (and d!56165 res!90562) b!191608))

(declare-fun m!218205 () Bool)

(assert (=> d!56165 m!218205))

(assert (=> d!56165 m!218137))

(assert (=> b!191608 m!218129))

(assert (=> b!191608 m!218129))

(declare-fun m!218207 () Bool)

(assert (=> b!191608 m!218207))

(assert (=> b!191608 m!218131))

(assert (=> b!191608 m!218133))

(assert (=> b!191546 d!56165))

(declare-fun b!191651 () Bool)

(declare-fun e!126139 () ListLongMap!2449)

(declare-fun call!19345 () ListLongMap!2449)

(assert (=> b!191651 (= e!126139 (+!308 call!19345 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))

(declare-fun e!126144 () Bool)

(declare-fun b!191652 () Bool)

(declare-fun lt!95212 () ListLongMap!2449)

(declare-fun apply!182 (ListLongMap!2449 (_ BitVec 64)) V!5587)

(declare-fun get!2213 (ValueCell!1884 V!5587) V!5587)

(declare-fun dynLambda!525 (Int (_ BitVec 64)) V!5587)

(assert (=> b!191652 (= e!126144 (= (apply!182 lt!95212 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4162 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))))))))

(assert (=> b!191652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191653 () Bool)

(declare-fun e!126137 () Bool)

(assert (=> b!191653 (= e!126137 (= (apply!182 lt!95212 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3751 thiss!1248)))))

(declare-fun b!191654 () Bool)

(declare-fun e!126143 () Bool)

(declare-fun call!19344 () Bool)

(assert (=> b!191654 (= e!126143 (not call!19344))))

(declare-fun bm!19340 () Bool)

(declare-fun call!19349 () ListLongMap!2449)

(declare-fun getCurrentListMapNoExtraKeys!215 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 32) Int) ListLongMap!2449)

(assert (=> bm!19340 (= call!19349 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun b!191655 () Bool)

(declare-fun c!34503 () Bool)

(assert (=> b!191655 (= c!34503 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126135 () ListLongMap!2449)

(declare-fun e!126136 () ListLongMap!2449)

(assert (=> b!191655 (= e!126135 e!126136)))

(declare-fun b!191656 () Bool)

(assert (=> b!191656 (= e!126139 e!126135)))

(declare-fun c!34501 () Bool)

(assert (=> b!191656 (= c!34501 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191657 () Bool)

(declare-fun call!19348 () ListLongMap!2449)

(assert (=> b!191657 (= e!126136 call!19348)))

(declare-fun call!19347 () ListLongMap!2449)

(declare-fun bm!19341 () Bool)

(declare-fun c!34505 () Bool)

(declare-fun call!19343 () ListLongMap!2449)

(assert (=> bm!19341 (= call!19345 (+!308 (ite c!34505 call!19349 (ite c!34501 call!19343 call!19347)) (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(declare-fun d!56167 () Bool)

(declare-fun e!126134 () Bool)

(assert (=> d!56167 e!126134))

(declare-fun res!90588 () Bool)

(assert (=> d!56167 (=> (not res!90588) (not e!126134))))

(assert (=> d!56167 (= res!90588 (or (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))))

(declare-fun lt!95201 () ListLongMap!2449)

(assert (=> d!56167 (= lt!95212 lt!95201)))

(declare-fun lt!95211 () Unit!5793)

(declare-fun e!126140 () Unit!5793)

(assert (=> d!56167 (= lt!95211 e!126140)))

(declare-fun c!34504 () Bool)

(declare-fun e!126141 () Bool)

(assert (=> d!56167 (= c!34504 e!126141)))

(declare-fun res!90585 () Bool)

(assert (=> d!56167 (=> (not res!90585) (not e!126141))))

(assert (=> d!56167 (= res!90585 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56167 (= lt!95201 e!126139)))

(assert (=> d!56167 (= c!34505 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56167 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56167 (= (getCurrentListMap!888 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) lt!95212)))

(declare-fun b!191658 () Bool)

(assert (=> b!191658 (= e!126134 e!126143)))

(declare-fun c!34500 () Bool)

(assert (=> b!191658 (= c!34500 (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19342 () Bool)

(assert (=> bm!19342 (= call!19344 (contains!1354 lt!95212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19343 () Bool)

(assert (=> bm!19343 (= call!19347 call!19343)))

(declare-fun b!191659 () Bool)

(declare-fun lt!95208 () Unit!5793)

(assert (=> b!191659 (= e!126140 lt!95208)))

(declare-fun lt!95204 () ListLongMap!2449)

(assert (=> b!191659 (= lt!95204 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95197 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95197 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95207 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95207 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95198 () Unit!5793)

(declare-fun addStillContains!158 (ListLongMap!2449 (_ BitVec 64) V!5587 (_ BitVec 64)) Unit!5793)

(assert (=> b!191659 (= lt!95198 (addStillContains!158 lt!95204 lt!95197 (zeroValue!3751 thiss!1248) lt!95207))))

(assert (=> b!191659 (contains!1354 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) lt!95207)))

(declare-fun lt!95195 () Unit!5793)

(assert (=> b!191659 (= lt!95195 lt!95198)))

(declare-fun lt!95205 () ListLongMap!2449)

(assert (=> b!191659 (= lt!95205 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95199 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95202 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95202 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95213 () Unit!5793)

(declare-fun addApplyDifferent!158 (ListLongMap!2449 (_ BitVec 64) V!5587 (_ BitVec 64)) Unit!5793)

(assert (=> b!191659 (= lt!95213 (addApplyDifferent!158 lt!95205 lt!95199 (minValue!3751 thiss!1248) lt!95202))))

(assert (=> b!191659 (= (apply!182 (+!308 lt!95205 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) lt!95202) (apply!182 lt!95205 lt!95202))))

(declare-fun lt!95215 () Unit!5793)

(assert (=> b!191659 (= lt!95215 lt!95213)))

(declare-fun lt!95214 () ListLongMap!2449)

(assert (=> b!191659 (= lt!95214 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95203 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95206 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95206 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95200 () Unit!5793)

(assert (=> b!191659 (= lt!95200 (addApplyDifferent!158 lt!95214 lt!95203 (zeroValue!3751 thiss!1248) lt!95206))))

(assert (=> b!191659 (= (apply!182 (+!308 lt!95214 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) lt!95206) (apply!182 lt!95214 lt!95206))))

(declare-fun lt!95196 () Unit!5793)

(assert (=> b!191659 (= lt!95196 lt!95200)))

(declare-fun lt!95216 () ListLongMap!2449)

(assert (=> b!191659 (= lt!95216 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95209 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95210 () (_ BitVec 64))

(assert (=> b!191659 (= lt!95210 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191659 (= lt!95208 (addApplyDifferent!158 lt!95216 lt!95209 (minValue!3751 thiss!1248) lt!95210))))

(assert (=> b!191659 (= (apply!182 (+!308 lt!95216 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) lt!95210) (apply!182 lt!95216 lt!95210))))

(declare-fun b!191660 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191660 (= e!126141 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191661 () Bool)

(declare-fun e!126132 () Bool)

(assert (=> b!191661 (= e!126132 e!126144)))

(declare-fun res!90582 () Bool)

(assert (=> b!191661 (=> (not res!90582) (not e!126144))))

(assert (=> b!191661 (= res!90582 (contains!1354 lt!95212 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun bm!19344 () Bool)

(declare-fun call!19346 () Bool)

(assert (=> bm!19344 (= call!19346 (contains!1354 lt!95212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191662 () Bool)

(assert (=> b!191662 (= e!126136 call!19347)))

(declare-fun b!191663 () Bool)

(declare-fun e!126142 () Bool)

(assert (=> b!191663 (= e!126142 e!126137)))

(declare-fun res!90583 () Bool)

(assert (=> b!191663 (= res!90583 call!19346)))

(assert (=> b!191663 (=> (not res!90583) (not e!126137))))

(declare-fun b!191664 () Bool)

(declare-fun e!126133 () Bool)

(assert (=> b!191664 (= e!126133 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191665 () Bool)

(assert (=> b!191665 (= e!126135 call!19348)))

(declare-fun bm!19345 () Bool)

(assert (=> bm!19345 (= call!19348 call!19345)))

(declare-fun b!191666 () Bool)

(assert (=> b!191666 (= e!126142 (not call!19346))))

(declare-fun b!191667 () Bool)

(declare-fun Unit!5800 () Unit!5793)

(assert (=> b!191667 (= e!126140 Unit!5800)))

(declare-fun b!191668 () Bool)

(declare-fun res!90584 () Bool)

(assert (=> b!191668 (=> (not res!90584) (not e!126134))))

(assert (=> b!191668 (= res!90584 e!126132)))

(declare-fun res!90581 () Bool)

(assert (=> b!191668 (=> res!90581 e!126132)))

(assert (=> b!191668 (= res!90581 (not e!126133))))

(declare-fun res!90589 () Bool)

(assert (=> b!191668 (=> (not res!90589) (not e!126133))))

(assert (=> b!191668 (= res!90589 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191669 () Bool)

(declare-fun res!90586 () Bool)

(assert (=> b!191669 (=> (not res!90586) (not e!126134))))

(assert (=> b!191669 (= res!90586 e!126142)))

(declare-fun c!34502 () Bool)

(assert (=> b!191669 (= c!34502 (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19346 () Bool)

(assert (=> bm!19346 (= call!19343 call!19349)))

(declare-fun b!191670 () Bool)

(declare-fun e!126138 () Bool)

(assert (=> b!191670 (= e!126143 e!126138)))

(declare-fun res!90587 () Bool)

(assert (=> b!191670 (= res!90587 call!19344)))

(assert (=> b!191670 (=> (not res!90587) (not e!126138))))

(declare-fun b!191671 () Bool)

(assert (=> b!191671 (= e!126138 (= (apply!182 lt!95212 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3751 thiss!1248)))))

(assert (= (and d!56167 c!34505) b!191651))

(assert (= (and d!56167 (not c!34505)) b!191656))

(assert (= (and b!191656 c!34501) b!191665))

(assert (= (and b!191656 (not c!34501)) b!191655))

(assert (= (and b!191655 c!34503) b!191657))

(assert (= (and b!191655 (not c!34503)) b!191662))

(assert (= (or b!191657 b!191662) bm!19343))

(assert (= (or b!191665 bm!19343) bm!19346))

(assert (= (or b!191665 b!191657) bm!19345))

(assert (= (or b!191651 bm!19346) bm!19340))

(assert (= (or b!191651 bm!19345) bm!19341))

(assert (= (and d!56167 res!90585) b!191660))

(assert (= (and d!56167 c!34504) b!191659))

(assert (= (and d!56167 (not c!34504)) b!191667))

(assert (= (and d!56167 res!90588) b!191668))

(assert (= (and b!191668 res!90589) b!191664))

(assert (= (and b!191668 (not res!90581)) b!191661))

(assert (= (and b!191661 res!90582) b!191652))

(assert (= (and b!191668 res!90584) b!191669))

(assert (= (and b!191669 c!34502) b!191663))

(assert (= (and b!191669 (not c!34502)) b!191666))

(assert (= (and b!191663 res!90583) b!191653))

(assert (= (or b!191663 b!191666) bm!19344))

(assert (= (and b!191669 res!90586) b!191658))

(assert (= (and b!191658 c!34500) b!191670))

(assert (= (and b!191658 (not c!34500)) b!191654))

(assert (= (and b!191670 res!90587) b!191671))

(assert (= (or b!191670 b!191654) bm!19342))

(declare-fun b_lambda!7399 () Bool)

(assert (=> (not b_lambda!7399) (not b!191652)))

(declare-fun t!7342 () Bool)

(declare-fun tb!2875 () Bool)

(assert (=> (and b!191539 (= (defaultEntry!3910 thiss!1248) (defaultEntry!3910 thiss!1248)) t!7342) tb!2875))

(declare-fun result!4903 () Bool)

(assert (=> tb!2875 (= result!4903 tp_is_empty!4455)))

(assert (=> b!191652 t!7342))

(declare-fun b_and!11361 () Bool)

(assert (= b_and!11357 (and (=> t!7342 result!4903) b_and!11361)))

(declare-fun m!218209 () Bool)

(assert (=> b!191661 m!218209))

(assert (=> b!191661 m!218209))

(declare-fun m!218211 () Bool)

(assert (=> b!191661 m!218211))

(assert (=> b!191652 m!218209))

(declare-fun m!218213 () Bool)

(assert (=> b!191652 m!218213))

(declare-fun m!218215 () Bool)

(assert (=> b!191652 m!218215))

(declare-fun m!218217 () Bool)

(assert (=> b!191652 m!218217))

(assert (=> b!191652 m!218215))

(assert (=> b!191652 m!218209))

(declare-fun m!218219 () Bool)

(assert (=> b!191652 m!218219))

(assert (=> b!191652 m!218213))

(declare-fun m!218221 () Bool)

(assert (=> b!191653 m!218221))

(declare-fun m!218223 () Bool)

(assert (=> bm!19340 m!218223))

(declare-fun m!218225 () Bool)

(assert (=> b!191671 m!218225))

(declare-fun m!218227 () Bool)

(assert (=> b!191659 m!218227))

(declare-fun m!218229 () Bool)

(assert (=> b!191659 m!218229))

(declare-fun m!218231 () Bool)

(assert (=> b!191659 m!218231))

(declare-fun m!218233 () Bool)

(assert (=> b!191659 m!218233))

(assert (=> b!191659 m!218229))

(declare-fun m!218235 () Bool)

(assert (=> b!191659 m!218235))

(declare-fun m!218237 () Bool)

(assert (=> b!191659 m!218237))

(declare-fun m!218239 () Bool)

(assert (=> b!191659 m!218239))

(declare-fun m!218241 () Bool)

(assert (=> b!191659 m!218241))

(declare-fun m!218243 () Bool)

(assert (=> b!191659 m!218243))

(assert (=> b!191659 m!218223))

(declare-fun m!218245 () Bool)

(assert (=> b!191659 m!218245))

(declare-fun m!218247 () Bool)

(assert (=> b!191659 m!218247))

(declare-fun m!218249 () Bool)

(assert (=> b!191659 m!218249))

(assert (=> b!191659 m!218233))

(declare-fun m!218251 () Bool)

(assert (=> b!191659 m!218251))

(declare-fun m!218253 () Bool)

(assert (=> b!191659 m!218253))

(assert (=> b!191659 m!218209))

(declare-fun m!218255 () Bool)

(assert (=> b!191659 m!218255))

(assert (=> b!191659 m!218245))

(assert (=> b!191659 m!218241))

(assert (=> b!191664 m!218209))

(assert (=> b!191664 m!218209))

(declare-fun m!218257 () Bool)

(assert (=> b!191664 m!218257))

(declare-fun m!218259 () Bool)

(assert (=> bm!19342 m!218259))

(assert (=> b!191660 m!218209))

(assert (=> b!191660 m!218209))

(assert (=> b!191660 m!218257))

(declare-fun m!218261 () Bool)

(assert (=> bm!19344 m!218261))

(declare-fun m!218263 () Bool)

(assert (=> bm!19341 m!218263))

(assert (=> d!56167 m!218137))

(declare-fun m!218265 () Bool)

(assert (=> b!191651 m!218265))

(assert (=> b!191546 d!56167))

(declare-fun b!191674 () Bool)

(declare-fun e!126152 () ListLongMap!2449)

(declare-fun call!19352 () ListLongMap!2449)

(assert (=> b!191674 (= e!126152 (+!308 call!19352 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))

(declare-fun b!191675 () Bool)

(declare-fun e!126157 () Bool)

(declare-fun lt!95234 () ListLongMap!2449)

(assert (=> b!191675 (= e!126157 (= (apply!182 lt!95234 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4162 (_values!3893 thiss!1248))))))

(assert (=> b!191675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191676 () Bool)

(declare-fun e!126150 () Bool)

(assert (=> b!191676 (= e!126150 (= (apply!182 lt!95234 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3751 thiss!1248)))))

(declare-fun b!191677 () Bool)

(declare-fun e!126156 () Bool)

(declare-fun call!19351 () Bool)

(assert (=> b!191677 (= e!126156 (not call!19351))))

(declare-fun bm!19347 () Bool)

(declare-fun call!19356 () ListLongMap!2449)

(assert (=> bm!19347 (= call!19356 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun b!191678 () Bool)

(declare-fun c!34509 () Bool)

(assert (=> b!191678 (= c!34509 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126148 () ListLongMap!2449)

(declare-fun e!126149 () ListLongMap!2449)

(assert (=> b!191678 (= e!126148 e!126149)))

(declare-fun b!191679 () Bool)

(assert (=> b!191679 (= e!126152 e!126148)))

(declare-fun c!34507 () Bool)

(assert (=> b!191679 (= c!34507 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191680 () Bool)

(declare-fun call!19355 () ListLongMap!2449)

(assert (=> b!191680 (= e!126149 call!19355)))

(declare-fun bm!19348 () Bool)

(declare-fun call!19350 () ListLongMap!2449)

(declare-fun c!34511 () Bool)

(declare-fun call!19354 () ListLongMap!2449)

(assert (=> bm!19348 (= call!19352 (+!308 (ite c!34511 call!19356 (ite c!34507 call!19350 call!19354)) (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(declare-fun d!56169 () Bool)

(declare-fun e!126147 () Bool)

(assert (=> d!56169 e!126147))

(declare-fun res!90597 () Bool)

(assert (=> d!56169 (=> (not res!90597) (not e!126147))))

(assert (=> d!56169 (= res!90597 (or (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))))

(declare-fun lt!95223 () ListLongMap!2449)

(assert (=> d!56169 (= lt!95234 lt!95223)))

(declare-fun lt!95233 () Unit!5793)

(declare-fun e!126153 () Unit!5793)

(assert (=> d!56169 (= lt!95233 e!126153)))

(declare-fun c!34510 () Bool)

(declare-fun e!126154 () Bool)

(assert (=> d!56169 (= c!34510 e!126154)))

(declare-fun res!90594 () Bool)

(assert (=> d!56169 (=> (not res!90594) (not e!126154))))

(assert (=> d!56169 (= res!90594 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56169 (= lt!95223 e!126152)))

(assert (=> d!56169 (= c!34511 (and (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56169 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56169 (= (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) lt!95234)))

(declare-fun b!191681 () Bool)

(assert (=> b!191681 (= e!126147 e!126156)))

(declare-fun c!34506 () Bool)

(assert (=> b!191681 (= c!34506 (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19349 () Bool)

(assert (=> bm!19349 (= call!19351 (contains!1354 lt!95234 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19350 () Bool)

(assert (=> bm!19350 (= call!19354 call!19350)))

(declare-fun b!191682 () Bool)

(declare-fun lt!95230 () Unit!5793)

(assert (=> b!191682 (= e!126153 lt!95230)))

(declare-fun lt!95226 () ListLongMap!2449)

(assert (=> b!191682 (= lt!95226 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95219 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95229 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95229 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95220 () Unit!5793)

(assert (=> b!191682 (= lt!95220 (addStillContains!158 lt!95226 lt!95219 (zeroValue!3751 thiss!1248) lt!95229))))

(assert (=> b!191682 (contains!1354 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) lt!95229)))

(declare-fun lt!95217 () Unit!5793)

(assert (=> b!191682 (= lt!95217 lt!95220)))

(declare-fun lt!95227 () ListLongMap!2449)

(assert (=> b!191682 (= lt!95227 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95221 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95221 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95224 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95224 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95235 () Unit!5793)

(assert (=> b!191682 (= lt!95235 (addApplyDifferent!158 lt!95227 lt!95221 (minValue!3751 thiss!1248) lt!95224))))

(assert (=> b!191682 (= (apply!182 (+!308 lt!95227 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) lt!95224) (apply!182 lt!95227 lt!95224))))

(declare-fun lt!95237 () Unit!5793)

(assert (=> b!191682 (= lt!95237 lt!95235)))

(declare-fun lt!95236 () ListLongMap!2449)

(assert (=> b!191682 (= lt!95236 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95225 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95228 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95228 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95222 () Unit!5793)

(assert (=> b!191682 (= lt!95222 (addApplyDifferent!158 lt!95236 lt!95225 (zeroValue!3751 thiss!1248) lt!95228))))

(assert (=> b!191682 (= (apply!182 (+!308 lt!95236 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) lt!95228) (apply!182 lt!95236 lt!95228))))

(declare-fun lt!95218 () Unit!5793)

(assert (=> b!191682 (= lt!95218 lt!95222)))

(declare-fun lt!95238 () ListLongMap!2449)

(assert (=> b!191682 (= lt!95238 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(declare-fun lt!95231 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95232 () (_ BitVec 64))

(assert (=> b!191682 (= lt!95232 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191682 (= lt!95230 (addApplyDifferent!158 lt!95238 lt!95231 (minValue!3751 thiss!1248) lt!95232))))

(assert (=> b!191682 (= (apply!182 (+!308 lt!95238 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) lt!95232) (apply!182 lt!95238 lt!95232))))

(declare-fun b!191683 () Bool)

(assert (=> b!191683 (= e!126154 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191684 () Bool)

(declare-fun e!126145 () Bool)

(assert (=> b!191684 (= e!126145 e!126157)))

(declare-fun res!90591 () Bool)

(assert (=> b!191684 (=> (not res!90591) (not e!126157))))

(assert (=> b!191684 (= res!90591 (contains!1354 lt!95234 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun bm!19351 () Bool)

(declare-fun call!19353 () Bool)

(assert (=> bm!19351 (= call!19353 (contains!1354 lt!95234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191685 () Bool)

(assert (=> b!191685 (= e!126149 call!19354)))

(declare-fun b!191686 () Bool)

(declare-fun e!126155 () Bool)

(assert (=> b!191686 (= e!126155 e!126150)))

(declare-fun res!90592 () Bool)

(assert (=> b!191686 (= res!90592 call!19353)))

(assert (=> b!191686 (=> (not res!90592) (not e!126150))))

(declare-fun b!191687 () Bool)

(declare-fun e!126146 () Bool)

(assert (=> b!191687 (= e!126146 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191688 () Bool)

(assert (=> b!191688 (= e!126148 call!19355)))

(declare-fun bm!19352 () Bool)

(assert (=> bm!19352 (= call!19355 call!19352)))

(declare-fun b!191689 () Bool)

(assert (=> b!191689 (= e!126155 (not call!19353))))

(declare-fun b!191690 () Bool)

(declare-fun Unit!5801 () Unit!5793)

(assert (=> b!191690 (= e!126153 Unit!5801)))

(declare-fun b!191691 () Bool)

(declare-fun res!90593 () Bool)

(assert (=> b!191691 (=> (not res!90593) (not e!126147))))

(assert (=> b!191691 (= res!90593 e!126145)))

(declare-fun res!90590 () Bool)

(assert (=> b!191691 (=> res!90590 e!126145)))

(assert (=> b!191691 (= res!90590 (not e!126146))))

(declare-fun res!90598 () Bool)

(assert (=> b!191691 (=> (not res!90598) (not e!126146))))

(assert (=> b!191691 (= res!90598 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191692 () Bool)

(declare-fun res!90595 () Bool)

(assert (=> b!191692 (=> (not res!90595) (not e!126147))))

(assert (=> b!191692 (= res!90595 e!126155)))

(declare-fun c!34508 () Bool)

(assert (=> b!191692 (= c!34508 (not (= (bvand (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19353 () Bool)

(assert (=> bm!19353 (= call!19350 call!19356)))

(declare-fun b!191693 () Bool)

(declare-fun e!126151 () Bool)

(assert (=> b!191693 (= e!126156 e!126151)))

(declare-fun res!90596 () Bool)

(assert (=> b!191693 (= res!90596 call!19351)))

(assert (=> b!191693 (=> (not res!90596) (not e!126151))))

(declare-fun b!191694 () Bool)

(assert (=> b!191694 (= e!126151 (= (apply!182 lt!95234 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3751 thiss!1248)))))

(assert (= (and d!56169 c!34511) b!191674))

(assert (= (and d!56169 (not c!34511)) b!191679))

(assert (= (and b!191679 c!34507) b!191688))

(assert (= (and b!191679 (not c!34507)) b!191678))

(assert (= (and b!191678 c!34509) b!191680))

(assert (= (and b!191678 (not c!34509)) b!191685))

(assert (= (or b!191680 b!191685) bm!19350))

(assert (= (or b!191688 bm!19350) bm!19353))

(assert (= (or b!191688 b!191680) bm!19352))

(assert (= (or b!191674 bm!19353) bm!19347))

(assert (= (or b!191674 bm!19352) bm!19348))

(assert (= (and d!56169 res!90594) b!191683))

(assert (= (and d!56169 c!34510) b!191682))

(assert (= (and d!56169 (not c!34510)) b!191690))

(assert (= (and d!56169 res!90597) b!191691))

(assert (= (and b!191691 res!90598) b!191687))

(assert (= (and b!191691 (not res!90590)) b!191684))

(assert (= (and b!191684 res!90591) b!191675))

(assert (= (and b!191691 res!90593) b!191692))

(assert (= (and b!191692 c!34508) b!191686))

(assert (= (and b!191692 (not c!34508)) b!191689))

(assert (= (and b!191686 res!90592) b!191676))

(assert (= (or b!191686 b!191689) bm!19351))

(assert (= (and b!191692 res!90595) b!191681))

(assert (= (and b!191681 c!34506) b!191693))

(assert (= (and b!191681 (not c!34506)) b!191677))

(assert (= (and b!191693 res!90596) b!191694))

(assert (= (or b!191693 b!191677) bm!19349))

(declare-fun b_lambda!7401 () Bool)

(assert (=> (not b_lambda!7401) (not b!191675)))

(assert (=> b!191675 t!7342))

(declare-fun b_and!11363 () Bool)

(assert (= b_and!11361 (and (=> t!7342 result!4903) b_and!11363)))

(assert (=> b!191684 m!218209))

(assert (=> b!191684 m!218209))

(declare-fun m!218267 () Bool)

(assert (=> b!191684 m!218267))

(assert (=> b!191675 m!218209))

(declare-fun m!218269 () Bool)

(assert (=> b!191675 m!218269))

(assert (=> b!191675 m!218215))

(declare-fun m!218271 () Bool)

(assert (=> b!191675 m!218271))

(assert (=> b!191675 m!218215))

(assert (=> b!191675 m!218209))

(declare-fun m!218273 () Bool)

(assert (=> b!191675 m!218273))

(assert (=> b!191675 m!218269))

(declare-fun m!218275 () Bool)

(assert (=> b!191676 m!218275))

(declare-fun m!218277 () Bool)

(assert (=> bm!19347 m!218277))

(declare-fun m!218279 () Bool)

(assert (=> b!191694 m!218279))

(declare-fun m!218281 () Bool)

(assert (=> b!191682 m!218281))

(declare-fun m!218283 () Bool)

(assert (=> b!191682 m!218283))

(declare-fun m!218285 () Bool)

(assert (=> b!191682 m!218285))

(declare-fun m!218287 () Bool)

(assert (=> b!191682 m!218287))

(assert (=> b!191682 m!218283))

(declare-fun m!218289 () Bool)

(assert (=> b!191682 m!218289))

(declare-fun m!218291 () Bool)

(assert (=> b!191682 m!218291))

(declare-fun m!218293 () Bool)

(assert (=> b!191682 m!218293))

(declare-fun m!218295 () Bool)

(assert (=> b!191682 m!218295))

(declare-fun m!218297 () Bool)

(assert (=> b!191682 m!218297))

(assert (=> b!191682 m!218277))

(declare-fun m!218299 () Bool)

(assert (=> b!191682 m!218299))

(declare-fun m!218301 () Bool)

(assert (=> b!191682 m!218301))

(declare-fun m!218303 () Bool)

(assert (=> b!191682 m!218303))

(assert (=> b!191682 m!218287))

(declare-fun m!218305 () Bool)

(assert (=> b!191682 m!218305))

(declare-fun m!218307 () Bool)

(assert (=> b!191682 m!218307))

(assert (=> b!191682 m!218209))

(declare-fun m!218309 () Bool)

(assert (=> b!191682 m!218309))

(assert (=> b!191682 m!218299))

(assert (=> b!191682 m!218295))

(assert (=> b!191687 m!218209))

(assert (=> b!191687 m!218209))

(assert (=> b!191687 m!218257))

(declare-fun m!218311 () Bool)

(assert (=> bm!19349 m!218311))

(assert (=> b!191683 m!218209))

(assert (=> b!191683 m!218209))

(assert (=> b!191683 m!218257))

(declare-fun m!218313 () Bool)

(assert (=> bm!19351 m!218313))

(declare-fun m!218315 () Bool)

(assert (=> bm!19348 m!218315))

(assert (=> d!56169 m!218137))

(declare-fun m!218317 () Bool)

(assert (=> b!191674 m!218317))

(assert (=> b!191546 d!56169))

(declare-fun d!56171 () Bool)

(declare-fun e!126160 () Bool)

(assert (=> d!56171 e!126160))

(declare-fun res!90604 () Bool)

(assert (=> d!56171 (=> (not res!90604) (not e!126160))))

(declare-fun lt!95249 () ListLongMap!2449)

(assert (=> d!56171 (= res!90604 (contains!1354 lt!95249 (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun lt!95247 () List!2425)

(assert (=> d!56171 (= lt!95249 (ListLongMap!2450 lt!95247))))

(declare-fun lt!95248 () Unit!5793)

(declare-fun lt!95250 () Unit!5793)

(assert (=> d!56171 (= lt!95248 lt!95250)))

(assert (=> d!56171 (= (getValueByKey!239 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309))) (Some!244 (_2!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!126 (List!2425 (_ BitVec 64) V!5587) Unit!5793)

(assert (=> d!56171 (= lt!95250 (lemmaContainsTupThenGetReturnValue!126 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun insertStrictlySorted!129 (List!2425 (_ BitVec 64) V!5587) List!2425)

(assert (=> d!56171 (= lt!95247 (insertStrictlySorted!129 (toList!1240 lt!95111) (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> d!56171 (= (+!308 lt!95111 (tuple2!3533 key!828 v!309)) lt!95249)))

(declare-fun b!191699 () Bool)

(declare-fun res!90603 () Bool)

(assert (=> b!191699 (=> (not res!90603) (not e!126160))))

(assert (=> b!191699 (= res!90603 (= (getValueByKey!239 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309))) (Some!244 (_2!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun b!191700 () Bool)

(declare-fun contains!1356 (List!2425 tuple2!3532) Bool)

(assert (=> b!191700 (= e!126160 (contains!1356 (toList!1240 lt!95249) (tuple2!3533 key!828 v!309)))))

(assert (= (and d!56171 res!90604) b!191699))

(assert (= (and b!191699 res!90603) b!191700))

(declare-fun m!218319 () Bool)

(assert (=> d!56171 m!218319))

(declare-fun m!218321 () Bool)

(assert (=> d!56171 m!218321))

(declare-fun m!218323 () Bool)

(assert (=> d!56171 m!218323))

(declare-fun m!218325 () Bool)

(assert (=> d!56171 m!218325))

(declare-fun m!218327 () Bool)

(assert (=> b!191699 m!218327))

(declare-fun m!218329 () Bool)

(assert (=> b!191700 m!218329))

(assert (=> b!191546 d!56171))

(declare-fun b!191717 () Bool)

(declare-fun lt!95255 () SeekEntryResult!679)

(assert (=> b!191717 (and (bvsge (index!4886 lt!95255) #b00000000000000000000000000000000) (bvslt (index!4886 lt!95255) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun res!90614 () Bool)

(assert (=> b!191717 (= res!90614 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4886 lt!95255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126172 () Bool)

(assert (=> b!191717 (=> (not res!90614) (not e!126172))))

(declare-fun d!56173 () Bool)

(declare-fun e!126170 () Bool)

(assert (=> d!56173 e!126170))

(declare-fun c!34516 () Bool)

(assert (=> d!56173 (= c!34516 ((_ is MissingZero!679) lt!95255))))

(assert (=> d!56173 (= lt!95255 (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun lt!95256 () Unit!5793)

(declare-fun choose!1039 (array!8149 array!8151 (_ BitVec 32) (_ BitVec 32) V!5587 V!5587 (_ BitVec 64) Int) Unit!5793)

(assert (=> d!56173 (= lt!95256 (choose!1039 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)))))

(assert (=> d!56173 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56173 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!181 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)) lt!95256)))

(declare-fun b!191718 () Bool)

(declare-fun res!90616 () Bool)

(declare-fun e!126169 () Bool)

(assert (=> b!191718 (=> (not res!90616) (not e!126169))))

(assert (=> b!191718 (= res!90616 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4889 lt!95255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191718 (and (bvsge (index!4889 lt!95255) #b00000000000000000000000000000000) (bvslt (index!4889 lt!95255) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191719 () Bool)

(declare-fun call!19361 () Bool)

(assert (=> b!191719 (= e!126172 (not call!19361))))

(declare-fun call!19362 () Bool)

(declare-fun bm!19358 () Bool)

(assert (=> bm!19358 (= call!19362 (inRange!0 (ite c!34516 (index!4886 lt!95255) (index!4889 lt!95255)) (mask!9131 thiss!1248)))))

(declare-fun bm!19359 () Bool)

(declare-fun arrayContainsKey!0 (array!8149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19359 (= call!19361 (arrayContainsKey!0 (_keys!5888 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191720 () Bool)

(declare-fun e!126171 () Bool)

(assert (=> b!191720 (= e!126170 e!126171)))

(declare-fun c!34517 () Bool)

(assert (=> b!191720 (= c!34517 ((_ is MissingVacant!679) lt!95255))))

(declare-fun b!191721 () Bool)

(assert (=> b!191721 (= e!126169 (not call!19361))))

(declare-fun b!191722 () Bool)

(assert (=> b!191722 (= e!126171 ((_ is Undefined!679) lt!95255))))

(declare-fun b!191723 () Bool)

(declare-fun res!90615 () Bool)

(assert (=> b!191723 (=> (not res!90615) (not e!126169))))

(assert (=> b!191723 (= res!90615 call!19362)))

(assert (=> b!191723 (= e!126171 e!126169)))

(declare-fun b!191724 () Bool)

(assert (=> b!191724 (= e!126170 e!126172)))

(declare-fun res!90613 () Bool)

(assert (=> b!191724 (= res!90613 call!19362)))

(assert (=> b!191724 (=> (not res!90613) (not e!126172))))

(assert (= (and d!56173 c!34516) b!191724))

(assert (= (and d!56173 (not c!34516)) b!191720))

(assert (= (and b!191724 res!90613) b!191717))

(assert (= (and b!191717 res!90614) b!191719))

(assert (= (and b!191720 c!34517) b!191723))

(assert (= (and b!191720 (not c!34517)) b!191722))

(assert (= (and b!191723 res!90615) b!191718))

(assert (= (and b!191718 res!90616) b!191721))

(assert (= (or b!191724 b!191723) bm!19358))

(assert (= (or b!191719 b!191721) bm!19359))

(declare-fun m!218331 () Bool)

(assert (=> bm!19359 m!218331))

(assert (=> d!56173 m!218121))

(declare-fun m!218333 () Bool)

(assert (=> d!56173 m!218333))

(assert (=> d!56173 m!218137))

(declare-fun m!218335 () Bool)

(assert (=> bm!19358 m!218335))

(declare-fun m!218337 () Bool)

(assert (=> b!191717 m!218337))

(declare-fun m!218339 () Bool)

(assert (=> b!191718 m!218339))

(assert (=> b!191544 d!56173))

(declare-fun b!191737 () Bool)

(declare-fun e!126179 () SeekEntryResult!679)

(declare-fun lt!95265 () SeekEntryResult!679)

(assert (=> b!191737 (= e!126179 (MissingZero!679 (index!4888 lt!95265)))))

(declare-fun b!191738 () Bool)

(declare-fun c!34525 () Bool)

(declare-fun lt!95264 () (_ BitVec 64))

(assert (=> b!191738 (= c!34525 (= lt!95264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126180 () SeekEntryResult!679)

(assert (=> b!191738 (= e!126180 e!126179)))

(declare-fun b!191739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8149 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!191739 (= e!126179 (seekKeyOrZeroReturnVacant!0 (x!20551 lt!95265) (index!4888 lt!95265) (index!4888 lt!95265) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun d!56175 () Bool)

(declare-fun lt!95263 () SeekEntryResult!679)

(assert (=> d!56175 (and (or ((_ is Undefined!679) lt!95263) (not ((_ is Found!679) lt!95263)) (and (bvsge (index!4887 lt!95263) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95263) (size!4161 (_keys!5888 thiss!1248))))) (or ((_ is Undefined!679) lt!95263) ((_ is Found!679) lt!95263) (not ((_ is MissingZero!679) lt!95263)) (and (bvsge (index!4886 lt!95263) #b00000000000000000000000000000000) (bvslt (index!4886 lt!95263) (size!4161 (_keys!5888 thiss!1248))))) (or ((_ is Undefined!679) lt!95263) ((_ is Found!679) lt!95263) ((_ is MissingZero!679) lt!95263) (not ((_ is MissingVacant!679) lt!95263)) (and (bvsge (index!4889 lt!95263) #b00000000000000000000000000000000) (bvslt (index!4889 lt!95263) (size!4161 (_keys!5888 thiss!1248))))) (or ((_ is Undefined!679) lt!95263) (ite ((_ is Found!679) lt!95263) (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4887 lt!95263)) key!828) (ite ((_ is MissingZero!679) lt!95263) (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4886 lt!95263)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!679) lt!95263) (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4889 lt!95263)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!126181 () SeekEntryResult!679)

(assert (=> d!56175 (= lt!95263 e!126181)))

(declare-fun c!34524 () Bool)

(assert (=> d!56175 (= c!34524 (and ((_ is Intermediate!679) lt!95265) (undefined!1491 lt!95265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8149 (_ BitVec 32)) SeekEntryResult!679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56175 (= lt!95265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9131 thiss!1248)) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(assert (=> d!56175 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56175 (= (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)) lt!95263)))

(declare-fun b!191740 () Bool)

(assert (=> b!191740 (= e!126181 Undefined!679)))

(declare-fun b!191741 () Bool)

(assert (=> b!191741 (= e!126180 (Found!679 (index!4888 lt!95265)))))

(declare-fun b!191742 () Bool)

(assert (=> b!191742 (= e!126181 e!126180)))

(assert (=> b!191742 (= lt!95264 (select (arr!3839 (_keys!5888 thiss!1248)) (index!4888 lt!95265)))))

(declare-fun c!34526 () Bool)

(assert (=> b!191742 (= c!34526 (= lt!95264 key!828))))

(assert (= (and d!56175 c!34524) b!191740))

(assert (= (and d!56175 (not c!34524)) b!191742))

(assert (= (and b!191742 c!34526) b!191741))

(assert (= (and b!191742 (not c!34526)) b!191738))

(assert (= (and b!191738 c!34525) b!191737))

(assert (= (and b!191738 (not c!34525)) b!191739))

(declare-fun m!218341 () Bool)

(assert (=> b!191739 m!218341))

(declare-fun m!218343 () Bool)

(assert (=> d!56175 m!218343))

(declare-fun m!218345 () Bool)

(assert (=> d!56175 m!218345))

(declare-fun m!218347 () Bool)

(assert (=> d!56175 m!218347))

(assert (=> d!56175 m!218137))

(declare-fun m!218349 () Bool)

(assert (=> d!56175 m!218349))

(declare-fun m!218351 () Bool)

(assert (=> d!56175 m!218351))

(assert (=> d!56175 m!218345))

(declare-fun m!218353 () Bool)

(assert (=> b!191742 m!218353))

(assert (=> b!191543 d!56175))

(declare-fun d!56177 () Bool)

(assert (=> d!56177 (= (array_inv!2489 (_keys!5888 thiss!1248)) (bvsge (size!4161 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191539 d!56177))

(declare-fun d!56179 () Bool)

(assert (=> d!56179 (= (array_inv!2490 (_values!3893 thiss!1248)) (bvsge (size!4162 (_values!3893 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191539 d!56179))

(declare-fun b!191749 () Bool)

(declare-fun e!126186 () Bool)

(assert (=> b!191749 (= e!126186 tp_is_empty!4455)))

(declare-fun mapNonEmpty!7701 () Bool)

(declare-fun mapRes!7701 () Bool)

(declare-fun tp!16908 () Bool)

(assert (=> mapNonEmpty!7701 (= mapRes!7701 (and tp!16908 e!126186))))

(declare-fun mapKey!7701 () (_ BitVec 32))

(declare-fun mapRest!7701 () (Array (_ BitVec 32) ValueCell!1884))

(declare-fun mapValue!7701 () ValueCell!1884)

(assert (=> mapNonEmpty!7701 (= mapRest!7695 (store mapRest!7701 mapKey!7701 mapValue!7701))))

(declare-fun condMapEmpty!7701 () Bool)

(declare-fun mapDefault!7701 () ValueCell!1884)

(assert (=> mapNonEmpty!7695 (= condMapEmpty!7701 (= mapRest!7695 ((as const (Array (_ BitVec 32) ValueCell!1884)) mapDefault!7701)))))

(declare-fun e!126187 () Bool)

(assert (=> mapNonEmpty!7695 (= tp!16898 (and e!126187 mapRes!7701))))

(declare-fun b!191750 () Bool)

(assert (=> b!191750 (= e!126187 tp_is_empty!4455)))

(declare-fun mapIsEmpty!7701 () Bool)

(assert (=> mapIsEmpty!7701 mapRes!7701))

(assert (= (and mapNonEmpty!7695 condMapEmpty!7701) mapIsEmpty!7701))

(assert (= (and mapNonEmpty!7695 (not condMapEmpty!7701)) mapNonEmpty!7701))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1884) mapValue!7701)) b!191749))

(assert (= (and mapNonEmpty!7695 ((_ is ValueCellFull!1884) mapDefault!7701)) b!191750))

(declare-fun m!218355 () Bool)

(assert (=> mapNonEmpty!7701 m!218355))

(declare-fun b_lambda!7403 () Bool)

(assert (= b_lambda!7399 (or (and b!191539 b_free!4683) b_lambda!7403)))

(declare-fun b_lambda!7405 () Bool)

(assert (= b_lambda!7401 (or (and b!191539 b_free!4683) b_lambda!7405)))

(check-sat (not b!191699) (not b!191664) (not b!191608) (not b_next!4683) (not bm!19340) tp_is_empty!4455 (not b!191684) (not b!191588) (not b!191682) (not d!56161) (not b!191660) (not b!191700) (not b!191659) (not bm!19347) (not bm!19344) (not bm!19359) (not b!191671) (not b!191589) (not b!191590) (not d!56173) (not d!56165) (not b!191674) b_and!11363 (not d!56167) (not bm!19342) (not b!191675) (not b!191683) (not b!191603) (not bm!19358) (not b!191687) (not d!56157) (not b_lambda!7405) (not d!56169) (not d!56175) (not d!56171) (not bm!19351) (not bm!19349) (not b!191605) (not b!191676) (not b!191739) (not bm!19341) (not b!191651) (not b!191595) (not mapNonEmpty!7701) (not b!191652) (not b!191661) (not b!191653) (not d!56155) (not b!191694) (not bm!19348) (not b_lambda!7403))
(check-sat b_and!11363 (not b_next!4683))
(get-model)

(declare-fun d!56181 () Bool)

(declare-fun get!2214 (Option!245) V!5587)

(assert (=> d!56181 (= (apply!182 lt!95234 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!239 (toList!1240 lt!95234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7664 () Bool)

(assert (= bs!7664 d!56181))

(declare-fun m!218357 () Bool)

(assert (=> bs!7664 m!218357))

(assert (=> bs!7664 m!218357))

(declare-fun m!218359 () Bool)

(assert (=> bs!7664 m!218359))

(assert (=> b!191694 d!56181))

(declare-fun d!56183 () Bool)

(assert (=> d!56183 (= (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191664 d!56183))

(assert (=> d!56167 d!56163))

(assert (=> d!56157 d!56175))

(declare-fun d!56185 () Bool)

(declare-fun e!126190 () Bool)

(assert (=> d!56185 e!126190))

(declare-fun res!90621 () Bool)

(assert (=> d!56185 (=> (not res!90621) (not e!126190))))

(declare-fun lt!95268 () SeekEntryResult!679)

(assert (=> d!56185 (= res!90621 ((_ is Found!679) lt!95268))))

(assert (=> d!56185 (= lt!95268 (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(assert (=> d!56185 true))

(declare-fun _$33!144 () Unit!5793)

(assert (=> d!56185 (= (choose!1037 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)) _$33!144)))

(declare-fun b!191755 () Bool)

(declare-fun res!90622 () Bool)

(assert (=> b!191755 (=> (not res!90622) (not e!126190))))

(assert (=> b!191755 (= res!90622 (inRange!0 (index!4887 lt!95268) (mask!9131 thiss!1248)))))

(declare-fun b!191756 () Bool)

(assert (=> b!191756 (= e!126190 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4887 lt!95268)) key!828))))

(assert (= (and d!56185 res!90621) b!191755))

(assert (= (and b!191755 res!90622) b!191756))

(assert (=> d!56185 m!218121))

(declare-fun m!218361 () Bool)

(assert (=> b!191755 m!218361))

(declare-fun m!218363 () Bool)

(assert (=> b!191756 m!218363))

(assert (=> d!56157 d!56185))

(assert (=> d!56157 d!56163))

(assert (=> d!56169 d!56163))

(declare-fun d!56187 () Bool)

(declare-fun c!34531 () Bool)

(assert (=> d!56187 (= c!34531 (and ((_ is Cons!2421) (toList!1240 lt!95249)) (= (_1!1777 (h!3060 (toList!1240 lt!95249))) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun e!126195 () Option!245)

(assert (=> d!56187 (= (getValueByKey!239 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309))) e!126195)))

(declare-fun e!126196 () Option!245)

(declare-fun b!191767 () Bool)

(assert (=> b!191767 (= e!126196 (getValueByKey!239 (t!7339 (toList!1240 lt!95249)) (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun b!191765 () Bool)

(assert (=> b!191765 (= e!126195 (Some!244 (_2!1777 (h!3060 (toList!1240 lt!95249)))))))

(declare-fun b!191766 () Bool)

(assert (=> b!191766 (= e!126195 e!126196)))

(declare-fun c!34532 () Bool)

(assert (=> b!191766 (= c!34532 (and ((_ is Cons!2421) (toList!1240 lt!95249)) (not (= (_1!1777 (h!3060 (toList!1240 lt!95249))) (_1!1777 (tuple2!3533 key!828 v!309))))))))

(declare-fun b!191768 () Bool)

(assert (=> b!191768 (= e!126196 None!243)))

(assert (= (and d!56187 c!34531) b!191765))

(assert (= (and d!56187 (not c!34531)) b!191766))

(assert (= (and b!191766 c!34532) b!191767))

(assert (= (and b!191766 (not c!34532)) b!191768))

(declare-fun m!218365 () Bool)

(assert (=> b!191767 m!218365))

(assert (=> b!191699 d!56187))

(declare-fun d!56189 () Bool)

(declare-fun e!126197 () Bool)

(assert (=> d!56189 e!126197))

(declare-fun res!90624 () Bool)

(assert (=> d!56189 (=> (not res!90624) (not e!126197))))

(declare-fun lt!95271 () ListLongMap!2449)

(assert (=> d!56189 (= res!90624 (contains!1354 lt!95271 (_1!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(declare-fun lt!95269 () List!2425)

(assert (=> d!56189 (= lt!95271 (ListLongMap!2450 lt!95269))))

(declare-fun lt!95270 () Unit!5793)

(declare-fun lt!95272 () Unit!5793)

(assert (=> d!56189 (= lt!95270 lt!95272)))

(assert (=> d!56189 (= (getValueByKey!239 lt!95269 (_1!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))) (Some!244 (_2!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56189 (= lt!95272 (lemmaContainsTupThenGetReturnValue!126 lt!95269 (_1!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (_2!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56189 (= lt!95269 (insertStrictlySorted!129 (toList!1240 (ite c!34511 call!19356 (ite c!34507 call!19350 call!19354))) (_1!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (_2!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56189 (= (+!308 (ite c!34511 call!19356 (ite c!34507 call!19350 call!19354)) (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) lt!95271)))

(declare-fun b!191769 () Bool)

(declare-fun res!90623 () Bool)

(assert (=> b!191769 (=> (not res!90623) (not e!126197))))

(assert (=> b!191769 (= res!90623 (= (getValueByKey!239 (toList!1240 lt!95271) (_1!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))) (Some!244 (_2!1777 (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))))

(declare-fun b!191770 () Bool)

(assert (=> b!191770 (= e!126197 (contains!1356 (toList!1240 lt!95271) (ite (or c!34511 c!34507) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (= (and d!56189 res!90624) b!191769))

(assert (= (and b!191769 res!90623) b!191770))

(declare-fun m!218367 () Bool)

(assert (=> d!56189 m!218367))

(declare-fun m!218369 () Bool)

(assert (=> d!56189 m!218369))

(declare-fun m!218371 () Bool)

(assert (=> d!56189 m!218371))

(declare-fun m!218373 () Bool)

(assert (=> d!56189 m!218373))

(declare-fun m!218375 () Bool)

(assert (=> b!191769 m!218375))

(declare-fun m!218377 () Bool)

(assert (=> b!191770 m!218377))

(assert (=> bm!19348 d!56189))

(declare-fun d!56191 () Bool)

(declare-fun res!90629 () Bool)

(declare-fun e!126202 () Bool)

(assert (=> d!56191 (=> res!90629 e!126202)))

(assert (=> d!56191 (= res!90629 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (= (_1!1777 (h!3060 (toList!1240 lt!95111))) key!828)))))

(assert (=> d!56191 (= (containsKey!243 (toList!1240 lt!95111) key!828) e!126202)))

(declare-fun b!191775 () Bool)

(declare-fun e!126203 () Bool)

(assert (=> b!191775 (= e!126202 e!126203)))

(declare-fun res!90630 () Bool)

(assert (=> b!191775 (=> (not res!90630) (not e!126203))))

(assert (=> b!191775 (= res!90630 (and (or (not ((_ is Cons!2421) (toList!1240 lt!95111))) (bvsle (_1!1777 (h!3060 (toList!1240 lt!95111))) key!828)) ((_ is Cons!2421) (toList!1240 lt!95111)) (bvslt (_1!1777 (h!3060 (toList!1240 lt!95111))) key!828)))))

(declare-fun b!191776 () Bool)

(assert (=> b!191776 (= e!126203 (containsKey!243 (t!7339 (toList!1240 lt!95111)) key!828))))

(assert (= (and d!56191 (not res!90629)) b!191775))

(assert (= (and b!191775 res!90630) b!191776))

(declare-fun m!218379 () Bool)

(assert (=> b!191776 m!218379))

(assert (=> d!56161 d!56191))

(declare-fun d!56193 () Bool)

(declare-fun e!126204 () Bool)

(assert (=> d!56193 e!126204))

(declare-fun res!90632 () Bool)

(assert (=> d!56193 (=> (not res!90632) (not e!126204))))

(declare-fun lt!95275 () ListLongMap!2449)

(assert (=> d!56193 (= res!90632 (contains!1354 lt!95275 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95273 () List!2425)

(assert (=> d!56193 (= lt!95275 (ListLongMap!2450 lt!95273))))

(declare-fun lt!95274 () Unit!5793)

(declare-fun lt!95276 () Unit!5793)

(assert (=> d!56193 (= lt!95274 lt!95276)))

(assert (=> d!56193 (= (getValueByKey!239 lt!95273 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56193 (= lt!95276 (lemmaContainsTupThenGetReturnValue!126 lt!95273 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56193 (= lt!95273 (insertStrictlySorted!129 (toList!1240 call!19345) (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56193 (= (+!308 call!19345 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) lt!95275)))

(declare-fun b!191777 () Bool)

(declare-fun res!90631 () Bool)

(assert (=> b!191777 (=> (not res!90631) (not e!126204))))

(assert (=> b!191777 (= res!90631 (= (getValueByKey!239 (toList!1240 lt!95275) (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(declare-fun b!191778 () Bool)

(assert (=> b!191778 (= e!126204 (contains!1356 (toList!1240 lt!95275) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))

(assert (= (and d!56193 res!90632) b!191777))

(assert (= (and b!191777 res!90631) b!191778))

(declare-fun m!218381 () Bool)

(assert (=> d!56193 m!218381))

(declare-fun m!218383 () Bool)

(assert (=> d!56193 m!218383))

(declare-fun m!218385 () Bool)

(assert (=> d!56193 m!218385))

(declare-fun m!218387 () Bool)

(assert (=> d!56193 m!218387))

(declare-fun m!218389 () Bool)

(assert (=> b!191777 m!218389))

(declare-fun m!218391 () Bool)

(assert (=> b!191778 m!218391))

(assert (=> b!191651 d!56193))

(declare-fun lt!95279 () Bool)

(declare-fun d!56195 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!153 (List!2425) (InoxSet tuple2!3532))

(assert (=> d!56195 (= lt!95279 (select (content!153 (toList!1240 lt!95249)) (tuple2!3533 key!828 v!309)))))

(declare-fun e!126209 () Bool)

(assert (=> d!56195 (= lt!95279 e!126209)))

(declare-fun res!90638 () Bool)

(assert (=> d!56195 (=> (not res!90638) (not e!126209))))

(assert (=> d!56195 (= res!90638 ((_ is Cons!2421) (toList!1240 lt!95249)))))

(assert (=> d!56195 (= (contains!1356 (toList!1240 lt!95249) (tuple2!3533 key!828 v!309)) lt!95279)))

(declare-fun b!191783 () Bool)

(declare-fun e!126210 () Bool)

(assert (=> b!191783 (= e!126209 e!126210)))

(declare-fun res!90637 () Bool)

(assert (=> b!191783 (=> res!90637 e!126210)))

(assert (=> b!191783 (= res!90637 (= (h!3060 (toList!1240 lt!95249)) (tuple2!3533 key!828 v!309)))))

(declare-fun b!191784 () Bool)

(assert (=> b!191784 (= e!126210 (contains!1356 (t!7339 (toList!1240 lt!95249)) (tuple2!3533 key!828 v!309)))))

(assert (= (and d!56195 res!90638) b!191783))

(assert (= (and b!191783 (not res!90637)) b!191784))

(declare-fun m!218393 () Bool)

(assert (=> d!56195 m!218393))

(declare-fun m!218395 () Bool)

(assert (=> d!56195 m!218395))

(declare-fun m!218397 () Bool)

(assert (=> b!191784 m!218397))

(assert (=> b!191700 d!56195))

(declare-fun d!56197 () Bool)

(declare-fun e!126212 () Bool)

(assert (=> d!56197 e!126212))

(declare-fun res!90639 () Bool)

(assert (=> d!56197 (=> res!90639 e!126212)))

(declare-fun lt!95281 () Bool)

(assert (=> d!56197 (= res!90639 (not lt!95281))))

(declare-fun lt!95282 () Bool)

(assert (=> d!56197 (= lt!95281 lt!95282)))

(declare-fun lt!95283 () Unit!5793)

(declare-fun e!126211 () Unit!5793)

(assert (=> d!56197 (= lt!95283 e!126211)))

(declare-fun c!34533 () Bool)

(assert (=> d!56197 (= c!34533 lt!95282)))

(assert (=> d!56197 (= lt!95282 (containsKey!243 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> d!56197 (= (contains!1354 lt!95249 (_1!1777 (tuple2!3533 key!828 v!309))) lt!95281)))

(declare-fun b!191785 () Bool)

(declare-fun lt!95280 () Unit!5793)

(assert (=> b!191785 (= e!126211 lt!95280)))

(assert (=> b!191785 (= lt!95280 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> b!191785 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun b!191786 () Bool)

(declare-fun Unit!5802 () Unit!5793)

(assert (=> b!191786 (= e!126211 Unit!5802)))

(declare-fun b!191787 () Bool)

(assert (=> b!191787 (= e!126212 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95249) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(assert (= (and d!56197 c!34533) b!191785))

(assert (= (and d!56197 (not c!34533)) b!191786))

(assert (= (and d!56197 (not res!90639)) b!191787))

(declare-fun m!218399 () Bool)

(assert (=> d!56197 m!218399))

(declare-fun m!218401 () Bool)

(assert (=> b!191785 m!218401))

(assert (=> b!191785 m!218327))

(assert (=> b!191785 m!218327))

(declare-fun m!218403 () Bool)

(assert (=> b!191785 m!218403))

(assert (=> b!191787 m!218327))

(assert (=> b!191787 m!218327))

(assert (=> b!191787 m!218403))

(assert (=> d!56171 d!56197))

(declare-fun c!34534 () Bool)

(declare-fun d!56199 () Bool)

(assert (=> d!56199 (= c!34534 (and ((_ is Cons!2421) lt!95247) (= (_1!1777 (h!3060 lt!95247)) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun e!126213 () Option!245)

(assert (=> d!56199 (= (getValueByKey!239 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309))) e!126213)))

(declare-fun b!191790 () Bool)

(declare-fun e!126214 () Option!245)

(assert (=> b!191790 (= e!126214 (getValueByKey!239 (t!7339 lt!95247) (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun b!191788 () Bool)

(assert (=> b!191788 (= e!126213 (Some!244 (_2!1777 (h!3060 lt!95247))))))

(declare-fun b!191789 () Bool)

(assert (=> b!191789 (= e!126213 e!126214)))

(declare-fun c!34535 () Bool)

(assert (=> b!191789 (= c!34535 (and ((_ is Cons!2421) lt!95247) (not (= (_1!1777 (h!3060 lt!95247)) (_1!1777 (tuple2!3533 key!828 v!309))))))))

(declare-fun b!191791 () Bool)

(assert (=> b!191791 (= e!126214 None!243)))

(assert (= (and d!56199 c!34534) b!191788))

(assert (= (and d!56199 (not c!34534)) b!191789))

(assert (= (and b!191789 c!34535) b!191790))

(assert (= (and b!191789 (not c!34535)) b!191791))

(declare-fun m!218405 () Bool)

(assert (=> b!191790 m!218405))

(assert (=> d!56171 d!56199))

(declare-fun d!56201 () Bool)

(assert (=> d!56201 (= (getValueByKey!239 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309))) (Some!244 (_2!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun lt!95286 () Unit!5793)

(declare-fun choose!1040 (List!2425 (_ BitVec 64) V!5587) Unit!5793)

(assert (=> d!56201 (= lt!95286 (choose!1040 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun e!126217 () Bool)

(assert (=> d!56201 e!126217))

(declare-fun res!90644 () Bool)

(assert (=> d!56201 (=> (not res!90644) (not e!126217))))

(declare-fun isStrictlySorted!355 (List!2425) Bool)

(assert (=> d!56201 (= res!90644 (isStrictlySorted!355 lt!95247))))

(assert (=> d!56201 (= (lemmaContainsTupThenGetReturnValue!126 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))) lt!95286)))

(declare-fun b!191796 () Bool)

(declare-fun res!90645 () Bool)

(assert (=> b!191796 (=> (not res!90645) (not e!126217))))

(assert (=> b!191796 (= res!90645 (containsKey!243 lt!95247 (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun b!191797 () Bool)

(assert (=> b!191797 (= e!126217 (contains!1356 lt!95247 (tuple2!3533 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309)))))))

(assert (= (and d!56201 res!90644) b!191796))

(assert (= (and b!191796 res!90645) b!191797))

(assert (=> d!56201 m!218321))

(declare-fun m!218407 () Bool)

(assert (=> d!56201 m!218407))

(declare-fun m!218409 () Bool)

(assert (=> d!56201 m!218409))

(declare-fun m!218411 () Bool)

(assert (=> b!191796 m!218411))

(declare-fun m!218413 () Bool)

(assert (=> b!191797 m!218413))

(assert (=> d!56171 d!56201))

(declare-fun b!191818 () Bool)

(declare-fun e!126232 () List!2425)

(declare-fun call!19370 () List!2425)

(assert (=> b!191818 (= e!126232 call!19370)))

(declare-fun b!191819 () Bool)

(declare-fun res!90650 () Bool)

(declare-fun e!126228 () Bool)

(assert (=> b!191819 (=> (not res!90650) (not e!126228))))

(declare-fun lt!95289 () List!2425)

(assert (=> b!191819 (= res!90650 (containsKey!243 lt!95289 (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun bm!19366 () Bool)

(declare-fun call!19371 () List!2425)

(assert (=> bm!19366 (= call!19371 call!19370)))

(declare-fun b!191820 () Bool)

(declare-fun e!126229 () List!2425)

(assert (=> b!191820 (= e!126229 (insertStrictlySorted!129 (t!7339 (toList!1240 lt!95111)) (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun b!191821 () Bool)

(declare-fun e!126231 () List!2425)

(assert (=> b!191821 (= e!126231 e!126232)))

(declare-fun c!34546 () Bool)

(assert (=> b!191821 (= c!34546 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (= (_1!1777 (h!3060 (toList!1240 lt!95111))) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun bm!19367 () Bool)

(declare-fun call!19369 () List!2425)

(assert (=> bm!19367 (= call!19370 call!19369)))

(declare-fun b!191822 () Bool)

(declare-fun e!126230 () List!2425)

(assert (=> b!191822 (= e!126230 call!19371)))

(declare-fun b!191823 () Bool)

(declare-fun c!34544 () Bool)

(assert (=> b!191823 (= c!34544 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (bvsgt (_1!1777 (h!3060 (toList!1240 lt!95111))) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(assert (=> b!191823 (= e!126232 e!126230)))

(declare-fun b!191824 () Bool)

(assert (=> b!191824 (= e!126229 (ite c!34546 (t!7339 (toList!1240 lt!95111)) (ite c!34544 (Cons!2421 (h!3060 (toList!1240 lt!95111)) (t!7339 (toList!1240 lt!95111))) Nil!2422)))))

(declare-fun b!191825 () Bool)

(assert (=> b!191825 (= e!126230 call!19371)))

(declare-fun b!191826 () Bool)

(assert (=> b!191826 (= e!126228 (contains!1356 lt!95289 (tuple2!3533 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun d!56203 () Bool)

(assert (=> d!56203 e!126228))

(declare-fun res!90651 () Bool)

(assert (=> d!56203 (=> (not res!90651) (not e!126228))))

(assert (=> d!56203 (= res!90651 (isStrictlySorted!355 lt!95289))))

(assert (=> d!56203 (= lt!95289 e!126231)))

(declare-fun c!34545 () Bool)

(assert (=> d!56203 (= c!34545 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (bvslt (_1!1777 (h!3060 (toList!1240 lt!95111))) (_1!1777 (tuple2!3533 key!828 v!309)))))))

(assert (=> d!56203 (isStrictlySorted!355 (toList!1240 lt!95111))))

(assert (=> d!56203 (= (insertStrictlySorted!129 (toList!1240 lt!95111) (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))) lt!95289)))

(declare-fun bm!19368 () Bool)

(declare-fun $colon$colon!101 (List!2425 tuple2!3532) List!2425)

(assert (=> bm!19368 (= call!19369 ($colon$colon!101 e!126229 (ite c!34545 (h!3060 (toList!1240 lt!95111)) (tuple2!3533 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))))

(declare-fun c!34547 () Bool)

(assert (=> bm!19368 (= c!34547 c!34545)))

(declare-fun b!191827 () Bool)

(assert (=> b!191827 (= e!126231 call!19369)))

(assert (= (and d!56203 c!34545) b!191827))

(assert (= (and d!56203 (not c!34545)) b!191821))

(assert (= (and b!191821 c!34546) b!191818))

(assert (= (and b!191821 (not c!34546)) b!191823))

(assert (= (and b!191823 c!34544) b!191825))

(assert (= (and b!191823 (not c!34544)) b!191822))

(assert (= (or b!191825 b!191822) bm!19366))

(assert (= (or b!191818 bm!19366) bm!19367))

(assert (= (or b!191827 bm!19367) bm!19368))

(assert (= (and bm!19368 c!34547) b!191820))

(assert (= (and bm!19368 (not c!34547)) b!191824))

(assert (= (and d!56203 res!90651) b!191819))

(assert (= (and b!191819 res!90650) b!191826))

(declare-fun m!218415 () Bool)

(assert (=> b!191826 m!218415))

(declare-fun m!218417 () Bool)

(assert (=> b!191820 m!218417))

(declare-fun m!218419 () Bool)

(assert (=> b!191819 m!218419))

(declare-fun m!218421 () Bool)

(assert (=> bm!19368 m!218421))

(declare-fun m!218423 () Bool)

(assert (=> d!56203 m!218423))

(declare-fun m!218425 () Bool)

(assert (=> d!56203 m!218425))

(assert (=> d!56171 d!56203))

(declare-fun d!56205 () Bool)

(assert (=> d!56205 (= (apply!182 lt!95205 lt!95202) (get!2214 (getValueByKey!239 (toList!1240 lt!95205) lt!95202)))))

(declare-fun bs!7665 () Bool)

(assert (= bs!7665 d!56205))

(declare-fun m!218427 () Bool)

(assert (=> bs!7665 m!218427))

(assert (=> bs!7665 m!218427))

(declare-fun m!218429 () Bool)

(assert (=> bs!7665 m!218429))

(assert (=> b!191659 d!56205))

(declare-fun d!56207 () Bool)

(assert (=> d!56207 (= (apply!182 (+!308 lt!95205 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) lt!95202) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95205 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))) lt!95202)))))

(declare-fun bs!7666 () Bool)

(assert (= bs!7666 d!56207))

(declare-fun m!218431 () Bool)

(assert (=> bs!7666 m!218431))

(assert (=> bs!7666 m!218431))

(declare-fun m!218433 () Bool)

(assert (=> bs!7666 m!218433))

(assert (=> b!191659 d!56207))

(declare-fun d!56209 () Bool)

(assert (=> d!56209 (= (apply!182 (+!308 lt!95205 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) lt!95202) (apply!182 lt!95205 lt!95202))))

(declare-fun lt!95292 () Unit!5793)

(declare-fun choose!1041 (ListLongMap!2449 (_ BitVec 64) V!5587 (_ BitVec 64)) Unit!5793)

(assert (=> d!56209 (= lt!95292 (choose!1041 lt!95205 lt!95199 (minValue!3751 thiss!1248) lt!95202))))

(declare-fun e!126235 () Bool)

(assert (=> d!56209 e!126235))

(declare-fun res!90654 () Bool)

(assert (=> d!56209 (=> (not res!90654) (not e!126235))))

(assert (=> d!56209 (= res!90654 (contains!1354 lt!95205 lt!95202))))

(assert (=> d!56209 (= (addApplyDifferent!158 lt!95205 lt!95199 (minValue!3751 thiss!1248) lt!95202) lt!95292)))

(declare-fun b!191831 () Bool)

(assert (=> b!191831 (= e!126235 (not (= lt!95202 lt!95199)))))

(assert (= (and d!56209 res!90654) b!191831))

(assert (=> d!56209 m!218237))

(assert (=> d!56209 m!218241))

(assert (=> d!56209 m!218241))

(assert (=> d!56209 m!218243))

(declare-fun m!218435 () Bool)

(assert (=> d!56209 m!218435))

(declare-fun m!218437 () Bool)

(assert (=> d!56209 m!218437))

(assert (=> b!191659 d!56209))

(declare-fun d!56211 () Bool)

(declare-fun e!126237 () Bool)

(assert (=> d!56211 e!126237))

(declare-fun res!90655 () Bool)

(assert (=> d!56211 (=> res!90655 e!126237)))

(declare-fun lt!95294 () Bool)

(assert (=> d!56211 (= res!90655 (not lt!95294))))

(declare-fun lt!95295 () Bool)

(assert (=> d!56211 (= lt!95294 lt!95295)))

(declare-fun lt!95296 () Unit!5793)

(declare-fun e!126236 () Unit!5793)

(assert (=> d!56211 (= lt!95296 e!126236)))

(declare-fun c!34548 () Bool)

(assert (=> d!56211 (= c!34548 lt!95295)))

(assert (=> d!56211 (= lt!95295 (containsKey!243 (toList!1240 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) lt!95207))))

(assert (=> d!56211 (= (contains!1354 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) lt!95207) lt!95294)))

(declare-fun b!191832 () Bool)

(declare-fun lt!95293 () Unit!5793)

(assert (=> b!191832 (= e!126236 lt!95293)))

(assert (=> b!191832 (= lt!95293 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) lt!95207))))

(assert (=> b!191832 (isDefined!192 (getValueByKey!239 (toList!1240 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) lt!95207))))

(declare-fun b!191833 () Bool)

(declare-fun Unit!5803 () Unit!5793)

(assert (=> b!191833 (= e!126236 Unit!5803)))

(declare-fun b!191834 () Bool)

(assert (=> b!191834 (= e!126237 (isDefined!192 (getValueByKey!239 (toList!1240 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) lt!95207)))))

(assert (= (and d!56211 c!34548) b!191832))

(assert (= (and d!56211 (not c!34548)) b!191833))

(assert (= (and d!56211 (not res!90655)) b!191834))

(declare-fun m!218439 () Bool)

(assert (=> d!56211 m!218439))

(declare-fun m!218441 () Bool)

(assert (=> b!191832 m!218441))

(declare-fun m!218443 () Bool)

(assert (=> b!191832 m!218443))

(assert (=> b!191832 m!218443))

(declare-fun m!218445 () Bool)

(assert (=> b!191832 m!218445))

(assert (=> b!191834 m!218443))

(assert (=> b!191834 m!218443))

(assert (=> b!191834 m!218445))

(assert (=> b!191659 d!56211))

(declare-fun d!56213 () Bool)

(assert (=> d!56213 (= (apply!182 lt!95216 lt!95210) (get!2214 (getValueByKey!239 (toList!1240 lt!95216) lt!95210)))))

(declare-fun bs!7667 () Bool)

(assert (= bs!7667 d!56213))

(declare-fun m!218447 () Bool)

(assert (=> bs!7667 m!218447))

(assert (=> bs!7667 m!218447))

(declare-fun m!218449 () Bool)

(assert (=> bs!7667 m!218449))

(assert (=> b!191659 d!56213))

(declare-fun d!56215 () Bool)

(assert (=> d!56215 (= (apply!182 lt!95214 lt!95206) (get!2214 (getValueByKey!239 (toList!1240 lt!95214) lt!95206)))))

(declare-fun bs!7668 () Bool)

(assert (= bs!7668 d!56215))

(declare-fun m!218451 () Bool)

(assert (=> bs!7668 m!218451))

(assert (=> bs!7668 m!218451))

(declare-fun m!218453 () Bool)

(assert (=> bs!7668 m!218453))

(assert (=> b!191659 d!56215))

(declare-fun d!56217 () Bool)

(declare-fun e!126238 () Bool)

(assert (=> d!56217 e!126238))

(declare-fun res!90657 () Bool)

(assert (=> d!56217 (=> (not res!90657) (not e!126238))))

(declare-fun lt!95299 () ListLongMap!2449)

(assert (=> d!56217 (= res!90657 (contains!1354 lt!95299 (_1!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))))))

(declare-fun lt!95297 () List!2425)

(assert (=> d!56217 (= lt!95299 (ListLongMap!2450 lt!95297))))

(declare-fun lt!95298 () Unit!5793)

(declare-fun lt!95300 () Unit!5793)

(assert (=> d!56217 (= lt!95298 lt!95300)))

(assert (=> d!56217 (= (getValueByKey!239 lt!95297 (_1!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56217 (= lt!95300 (lemmaContainsTupThenGetReturnValue!126 lt!95297 (_1!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56217 (= lt!95297 (insertStrictlySorted!129 (toList!1240 lt!95204) (_1!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56217 (= (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) lt!95299)))

(declare-fun b!191835 () Bool)

(declare-fun res!90656 () Bool)

(assert (=> b!191835 (=> (not res!90656) (not e!126238))))

(assert (=> b!191835 (= res!90656 (= (getValueByKey!239 (toList!1240 lt!95299) (_1!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))))))))

(declare-fun b!191836 () Bool)

(assert (=> b!191836 (= e!126238 (contains!1356 (toList!1240 lt!95299) (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))))))

(assert (= (and d!56217 res!90657) b!191835))

(assert (= (and b!191835 res!90656) b!191836))

(declare-fun m!218455 () Bool)

(assert (=> d!56217 m!218455))

(declare-fun m!218457 () Bool)

(assert (=> d!56217 m!218457))

(declare-fun m!218459 () Bool)

(assert (=> d!56217 m!218459))

(declare-fun m!218461 () Bool)

(assert (=> d!56217 m!218461))

(declare-fun m!218463 () Bool)

(assert (=> b!191835 m!218463))

(declare-fun m!218465 () Bool)

(assert (=> b!191836 m!218465))

(assert (=> b!191659 d!56217))

(declare-fun d!56219 () Bool)

(declare-fun e!126239 () Bool)

(assert (=> d!56219 e!126239))

(declare-fun res!90659 () Bool)

(assert (=> d!56219 (=> (not res!90659) (not e!126239))))

(declare-fun lt!95303 () ListLongMap!2449)

(assert (=> d!56219 (= res!90659 (contains!1354 lt!95303 (_1!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95301 () List!2425)

(assert (=> d!56219 (= lt!95303 (ListLongMap!2450 lt!95301))))

(declare-fun lt!95302 () Unit!5793)

(declare-fun lt!95304 () Unit!5793)

(assert (=> d!56219 (= lt!95302 lt!95304)))

(assert (=> d!56219 (= (getValueByKey!239 lt!95301 (_1!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))))))

(assert (=> d!56219 (= lt!95304 (lemmaContainsTupThenGetReturnValue!126 lt!95301 (_1!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))))))

(assert (=> d!56219 (= lt!95301 (insertStrictlySorted!129 (toList!1240 lt!95216) (_1!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))))))

(assert (=> d!56219 (= (+!308 lt!95216 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) lt!95303)))

(declare-fun b!191837 () Bool)

(declare-fun res!90658 () Bool)

(assert (=> b!191837 (=> (not res!90658) (not e!126239))))

(assert (=> b!191837 (= res!90658 (= (getValueByKey!239 (toList!1240 lt!95303) (_1!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))))))))

(declare-fun b!191838 () Bool)

(assert (=> b!191838 (= e!126239 (contains!1356 (toList!1240 lt!95303) (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))))))

(assert (= (and d!56219 res!90659) b!191837))

(assert (= (and b!191837 res!90658) b!191838))

(declare-fun m!218467 () Bool)

(assert (=> d!56219 m!218467))

(declare-fun m!218469 () Bool)

(assert (=> d!56219 m!218469))

(declare-fun m!218471 () Bool)

(assert (=> d!56219 m!218471))

(declare-fun m!218473 () Bool)

(assert (=> d!56219 m!218473))

(declare-fun m!218475 () Bool)

(assert (=> b!191837 m!218475))

(declare-fun m!218477 () Bool)

(assert (=> b!191838 m!218477))

(assert (=> b!191659 d!56219))

(declare-fun d!56221 () Bool)

(assert (=> d!56221 (= (apply!182 (+!308 lt!95216 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) lt!95210) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95216 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248)))) lt!95210)))))

(declare-fun bs!7669 () Bool)

(assert (= bs!7669 d!56221))

(declare-fun m!218479 () Bool)

(assert (=> bs!7669 m!218479))

(assert (=> bs!7669 m!218479))

(declare-fun m!218481 () Bool)

(assert (=> bs!7669 m!218481))

(assert (=> b!191659 d!56221))

(declare-fun b!191863 () Bool)

(declare-fun e!126259 () Bool)

(declare-fun e!126257 () Bool)

(assert (=> b!191863 (= e!126259 e!126257)))

(declare-fun c!34558 () Bool)

(declare-fun e!126258 () Bool)

(assert (=> b!191863 (= c!34558 e!126258)))

(declare-fun res!90671 () Bool)

(assert (=> b!191863 (=> (not res!90671) (not e!126258))))

(assert (=> b!191863 (= res!90671 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191864 () Bool)

(declare-fun lt!95319 () Unit!5793)

(declare-fun lt!95325 () Unit!5793)

(assert (=> b!191864 (= lt!95319 lt!95325)))

(declare-fun lt!95324 () (_ BitVec 64))

(declare-fun lt!95321 () ListLongMap!2449)

(declare-fun lt!95323 () V!5587)

(declare-fun lt!95320 () (_ BitVec 64))

(assert (=> b!191864 (not (contains!1354 (+!308 lt!95321 (tuple2!3533 lt!95324 lt!95323)) lt!95320))))

(declare-fun addStillNotContains!95 (ListLongMap!2449 (_ BitVec 64) V!5587 (_ BitVec 64)) Unit!5793)

(assert (=> b!191864 (= lt!95325 (addStillNotContains!95 lt!95321 lt!95324 lt!95323 lt!95320))))

(assert (=> b!191864 (= lt!95320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191864 (= lt!95323 (get!2213 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191864 (= lt!95324 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19374 () ListLongMap!2449)

(assert (=> b!191864 (= lt!95321 call!19374)))

(declare-fun e!126256 () ListLongMap!2449)

(assert (=> b!191864 (= e!126256 (+!308 call!19374 (tuple2!3533 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) (get!2213 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!191865 () Bool)

(assert (=> b!191865 (= e!126258 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191865 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191866 () Bool)

(declare-fun e!126254 () Bool)

(assert (=> b!191866 (= e!126257 e!126254)))

(declare-fun c!34559 () Bool)

(assert (=> b!191866 (= c!34559 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191867 () Bool)

(declare-fun lt!95322 () ListLongMap!2449)

(declare-fun isEmpty!483 (ListLongMap!2449) Bool)

(assert (=> b!191867 (= e!126254 (isEmpty!483 lt!95322))))

(declare-fun b!191868 () Bool)

(declare-fun e!126260 () ListLongMap!2449)

(assert (=> b!191868 (= e!126260 e!126256)))

(declare-fun c!34560 () Bool)

(assert (=> b!191868 (= c!34560 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191869 () Bool)

(assert (=> b!191869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> b!191869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4162 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))))))))

(declare-fun e!126255 () Bool)

(assert (=> b!191869 (= e!126255 (= (apply!182 lt!95322 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19371 () Bool)

(assert (=> bm!19371 (= call!19374 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3910 thiss!1248)))))

(declare-fun b!191870 () Bool)

(assert (=> b!191870 (= e!126257 e!126255)))

(assert (=> b!191870 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun res!90668 () Bool)

(assert (=> b!191870 (= res!90668 (contains!1354 lt!95322 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191870 (=> (not res!90668) (not e!126255))))

(declare-fun b!191871 () Bool)

(assert (=> b!191871 (= e!126256 call!19374)))

(declare-fun d!56223 () Bool)

(assert (=> d!56223 e!126259))

(declare-fun res!90670 () Bool)

(assert (=> d!56223 (=> (not res!90670) (not e!126259))))

(assert (=> d!56223 (= res!90670 (not (contains!1354 lt!95322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56223 (= lt!95322 e!126260)))

(declare-fun c!34557 () Bool)

(assert (=> d!56223 (= c!34557 (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56223 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56223 (= (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) lt!95322)))

(declare-fun b!191872 () Bool)

(assert (=> b!191872 (= e!126254 (= lt!95322 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3910 thiss!1248))))))

(declare-fun b!191873 () Bool)

(assert (=> b!191873 (= e!126260 (ListLongMap!2450 Nil!2422))))

(declare-fun b!191874 () Bool)

(declare-fun res!90669 () Bool)

(assert (=> b!191874 (=> (not res!90669) (not e!126259))))

(assert (=> b!191874 (= res!90669 (not (contains!1354 lt!95322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56223 c!34557) b!191873))

(assert (= (and d!56223 (not c!34557)) b!191868))

(assert (= (and b!191868 c!34560) b!191864))

(assert (= (and b!191868 (not c!34560)) b!191871))

(assert (= (or b!191864 b!191871) bm!19371))

(assert (= (and d!56223 res!90670) b!191874))

(assert (= (and b!191874 res!90669) b!191863))

(assert (= (and b!191863 res!90671) b!191865))

(assert (= (and b!191863 c!34558) b!191870))

(assert (= (and b!191863 (not c!34558)) b!191866))

(assert (= (and b!191870 res!90668) b!191869))

(assert (= (and b!191866 c!34559) b!191872))

(assert (= (and b!191866 (not c!34559)) b!191867))

(declare-fun b_lambda!7407 () Bool)

(assert (=> (not b_lambda!7407) (not b!191864)))

(assert (=> b!191864 t!7342))

(declare-fun b_and!11365 () Bool)

(assert (= b_and!11363 (and (=> t!7342 result!4903) b_and!11365)))

(declare-fun b_lambda!7409 () Bool)

(assert (=> (not b_lambda!7409) (not b!191869)))

(assert (=> b!191869 t!7342))

(declare-fun b_and!11367 () Bool)

(assert (= b_and!11365 (and (=> t!7342 result!4903) b_and!11367)))

(declare-fun m!218483 () Bool)

(assert (=> b!191874 m!218483))

(declare-fun m!218485 () Bool)

(assert (=> d!56223 m!218485))

(assert (=> d!56223 m!218137))

(declare-fun m!218487 () Bool)

(assert (=> b!191872 m!218487))

(assert (=> b!191864 m!218209))

(declare-fun m!218489 () Bool)

(assert (=> b!191864 m!218489))

(assert (=> b!191864 m!218213))

(declare-fun m!218491 () Bool)

(assert (=> b!191864 m!218491))

(assert (=> b!191864 m!218215))

(assert (=> b!191864 m!218491))

(declare-fun m!218493 () Bool)

(assert (=> b!191864 m!218493))

(declare-fun m!218495 () Bool)

(assert (=> b!191864 m!218495))

(assert (=> b!191864 m!218213))

(assert (=> b!191864 m!218215))

(assert (=> b!191864 m!218217))

(assert (=> b!191870 m!218209))

(assert (=> b!191870 m!218209))

(declare-fun m!218497 () Bool)

(assert (=> b!191870 m!218497))

(declare-fun m!218499 () Bool)

(assert (=> b!191867 m!218499))

(assert (=> bm!19371 m!218487))

(assert (=> b!191869 m!218209))

(assert (=> b!191869 m!218209))

(declare-fun m!218501 () Bool)

(assert (=> b!191869 m!218501))

(assert (=> b!191869 m!218213))

(assert (=> b!191869 m!218215))

(assert (=> b!191869 m!218213))

(assert (=> b!191869 m!218215))

(assert (=> b!191869 m!218217))

(assert (=> b!191865 m!218209))

(assert (=> b!191865 m!218209))

(assert (=> b!191865 m!218257))

(assert (=> b!191868 m!218209))

(assert (=> b!191868 m!218209))

(assert (=> b!191868 m!218257))

(assert (=> b!191659 d!56223))

(declare-fun d!56225 () Bool)

(assert (=> d!56225 (= (apply!182 (+!308 lt!95214 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) lt!95206) (apply!182 lt!95214 lt!95206))))

(declare-fun lt!95326 () Unit!5793)

(assert (=> d!56225 (= lt!95326 (choose!1041 lt!95214 lt!95203 (zeroValue!3751 thiss!1248) lt!95206))))

(declare-fun e!126261 () Bool)

(assert (=> d!56225 e!126261))

(declare-fun res!90672 () Bool)

(assert (=> d!56225 (=> (not res!90672) (not e!126261))))

(assert (=> d!56225 (= res!90672 (contains!1354 lt!95214 lt!95206))))

(assert (=> d!56225 (= (addApplyDifferent!158 lt!95214 lt!95203 (zeroValue!3751 thiss!1248) lt!95206) lt!95326)))

(declare-fun b!191875 () Bool)

(assert (=> b!191875 (= e!126261 (not (= lt!95206 lt!95203)))))

(assert (= (and d!56225 res!90672) b!191875))

(assert (=> d!56225 m!218249))

(assert (=> d!56225 m!218233))

(assert (=> d!56225 m!218233))

(assert (=> d!56225 m!218251))

(declare-fun m!218503 () Bool)

(assert (=> d!56225 m!218503))

(declare-fun m!218505 () Bool)

(assert (=> d!56225 m!218505))

(assert (=> b!191659 d!56225))

(declare-fun d!56227 () Bool)

(assert (=> d!56227 (= (apply!182 (+!308 lt!95216 (tuple2!3533 lt!95209 (minValue!3751 thiss!1248))) lt!95210) (apply!182 lt!95216 lt!95210))))

(declare-fun lt!95327 () Unit!5793)

(assert (=> d!56227 (= lt!95327 (choose!1041 lt!95216 lt!95209 (minValue!3751 thiss!1248) lt!95210))))

(declare-fun e!126262 () Bool)

(assert (=> d!56227 e!126262))

(declare-fun res!90673 () Bool)

(assert (=> d!56227 (=> (not res!90673) (not e!126262))))

(assert (=> d!56227 (= res!90673 (contains!1354 lt!95216 lt!95210))))

(assert (=> d!56227 (= (addApplyDifferent!158 lt!95216 lt!95209 (minValue!3751 thiss!1248) lt!95210) lt!95327)))

(declare-fun b!191876 () Bool)

(assert (=> b!191876 (= e!126262 (not (= lt!95210 lt!95209)))))

(assert (= (and d!56227 res!90673) b!191876))

(assert (=> d!56227 m!218239))

(assert (=> d!56227 m!218229))

(assert (=> d!56227 m!218229))

(assert (=> d!56227 m!218235))

(declare-fun m!218507 () Bool)

(assert (=> d!56227 m!218507))

(declare-fun m!218509 () Bool)

(assert (=> d!56227 m!218509))

(assert (=> b!191659 d!56227))

(declare-fun d!56229 () Bool)

(declare-fun e!126263 () Bool)

(assert (=> d!56229 e!126263))

(declare-fun res!90675 () Bool)

(assert (=> d!56229 (=> (not res!90675) (not e!126263))))

(declare-fun lt!95330 () ListLongMap!2449)

(assert (=> d!56229 (= res!90675 (contains!1354 lt!95330 (_1!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))))))

(declare-fun lt!95328 () List!2425)

(assert (=> d!56229 (= lt!95330 (ListLongMap!2450 lt!95328))))

(declare-fun lt!95329 () Unit!5793)

(declare-fun lt!95331 () Unit!5793)

(assert (=> d!56229 (= lt!95329 lt!95331)))

(assert (=> d!56229 (= (getValueByKey!239 lt!95328 (_1!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56229 (= lt!95331 (lemmaContainsTupThenGetReturnValue!126 lt!95328 (_1!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56229 (= lt!95328 (insertStrictlySorted!129 (toList!1240 lt!95214) (_1!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56229 (= (+!308 lt!95214 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) lt!95330)))

(declare-fun b!191877 () Bool)

(declare-fun res!90674 () Bool)

(assert (=> b!191877 (=> (not res!90674) (not e!126263))))

(assert (=> b!191877 (= res!90674 (= (getValueByKey!239 (toList!1240 lt!95330) (_1!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))))))))

(declare-fun b!191878 () Bool)

(assert (=> b!191878 (= e!126263 (contains!1356 (toList!1240 lt!95330) (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))))))

(assert (= (and d!56229 res!90675) b!191877))

(assert (= (and b!191877 res!90674) b!191878))

(declare-fun m!218511 () Bool)

(assert (=> d!56229 m!218511))

(declare-fun m!218513 () Bool)

(assert (=> d!56229 m!218513))

(declare-fun m!218515 () Bool)

(assert (=> d!56229 m!218515))

(declare-fun m!218517 () Bool)

(assert (=> d!56229 m!218517))

(declare-fun m!218519 () Bool)

(assert (=> b!191877 m!218519))

(declare-fun m!218521 () Bool)

(assert (=> b!191878 m!218521))

(assert (=> b!191659 d!56229))

(declare-fun d!56231 () Bool)

(declare-fun e!126264 () Bool)

(assert (=> d!56231 e!126264))

(declare-fun res!90677 () Bool)

(assert (=> d!56231 (=> (not res!90677) (not e!126264))))

(declare-fun lt!95334 () ListLongMap!2449)

(assert (=> d!56231 (= res!90677 (contains!1354 lt!95334 (_1!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95332 () List!2425)

(assert (=> d!56231 (= lt!95334 (ListLongMap!2450 lt!95332))))

(declare-fun lt!95333 () Unit!5793)

(declare-fun lt!95335 () Unit!5793)

(assert (=> d!56231 (= lt!95333 lt!95335)))

(assert (=> d!56231 (= (getValueByKey!239 lt!95332 (_1!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))))))

(assert (=> d!56231 (= lt!95335 (lemmaContainsTupThenGetReturnValue!126 lt!95332 (_1!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))))))

(assert (=> d!56231 (= lt!95332 (insertStrictlySorted!129 (toList!1240 lt!95205) (_1!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))))))

(assert (=> d!56231 (= (+!308 lt!95205 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))) lt!95334)))

(declare-fun b!191879 () Bool)

(declare-fun res!90676 () Bool)

(assert (=> b!191879 (=> (not res!90676) (not e!126264))))

(assert (=> b!191879 (= res!90676 (= (getValueByKey!239 (toList!1240 lt!95334) (_1!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))))))))

(declare-fun b!191880 () Bool)

(assert (=> b!191880 (= e!126264 (contains!1356 (toList!1240 lt!95334) (tuple2!3533 lt!95199 (minValue!3751 thiss!1248))))))

(assert (= (and d!56231 res!90677) b!191879))

(assert (= (and b!191879 res!90676) b!191880))

(declare-fun m!218523 () Bool)

(assert (=> d!56231 m!218523))

(declare-fun m!218525 () Bool)

(assert (=> d!56231 m!218525))

(declare-fun m!218527 () Bool)

(assert (=> d!56231 m!218527))

(declare-fun m!218529 () Bool)

(assert (=> d!56231 m!218529))

(declare-fun m!218531 () Bool)

(assert (=> b!191879 m!218531))

(declare-fun m!218533 () Bool)

(assert (=> b!191880 m!218533))

(assert (=> b!191659 d!56231))

(declare-fun d!56233 () Bool)

(assert (=> d!56233 (contains!1354 (+!308 lt!95204 (tuple2!3533 lt!95197 (zeroValue!3751 thiss!1248))) lt!95207)))

(declare-fun lt!95338 () Unit!5793)

(declare-fun choose!1042 (ListLongMap!2449 (_ BitVec 64) V!5587 (_ BitVec 64)) Unit!5793)

(assert (=> d!56233 (= lt!95338 (choose!1042 lt!95204 lt!95197 (zeroValue!3751 thiss!1248) lt!95207))))

(assert (=> d!56233 (contains!1354 lt!95204 lt!95207)))

(assert (=> d!56233 (= (addStillContains!158 lt!95204 lt!95197 (zeroValue!3751 thiss!1248) lt!95207) lt!95338)))

(declare-fun bs!7670 () Bool)

(assert (= bs!7670 d!56233))

(assert (=> bs!7670 m!218245))

(assert (=> bs!7670 m!218245))

(assert (=> bs!7670 m!218247))

(declare-fun m!218535 () Bool)

(assert (=> bs!7670 m!218535))

(declare-fun m!218537 () Bool)

(assert (=> bs!7670 m!218537))

(assert (=> b!191659 d!56233))

(declare-fun d!56235 () Bool)

(assert (=> d!56235 (= (apply!182 (+!308 lt!95214 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248))) lt!95206) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95214 (tuple2!3533 lt!95203 (zeroValue!3751 thiss!1248)))) lt!95206)))))

(declare-fun bs!7671 () Bool)

(assert (= bs!7671 d!56235))

(declare-fun m!218539 () Bool)

(assert (=> bs!7671 m!218539))

(assert (=> bs!7671 m!218539))

(declare-fun m!218541 () Bool)

(assert (=> bs!7671 m!218541))

(assert (=> b!191659 d!56235))

(declare-fun d!56237 () Bool)

(declare-fun e!126265 () Bool)

(assert (=> d!56237 e!126265))

(declare-fun res!90679 () Bool)

(assert (=> d!56237 (=> (not res!90679) (not e!126265))))

(declare-fun lt!95341 () ListLongMap!2449)

(assert (=> d!56237 (= res!90679 (contains!1354 lt!95341 (_1!1777 (tuple2!3533 key!828 v!309))))))

(declare-fun lt!95339 () List!2425)

(assert (=> d!56237 (= lt!95341 (ListLongMap!2450 lt!95339))))

(declare-fun lt!95340 () Unit!5793)

(declare-fun lt!95342 () Unit!5793)

(assert (=> d!56237 (= lt!95340 lt!95342)))

(assert (=> d!56237 (= (getValueByKey!239 lt!95339 (_1!1777 (tuple2!3533 key!828 v!309))) (Some!244 (_2!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> d!56237 (= lt!95342 (lemmaContainsTupThenGetReturnValue!126 lt!95339 (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> d!56237 (= lt!95339 (insertStrictlySorted!129 (toList!1240 (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248))) (_1!1777 (tuple2!3533 key!828 v!309)) (_2!1777 (tuple2!3533 key!828 v!309))))))

(assert (=> d!56237 (= (+!308 (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) (tuple2!3533 key!828 v!309)) lt!95341)))

(declare-fun b!191882 () Bool)

(declare-fun res!90678 () Bool)

(assert (=> b!191882 (=> (not res!90678) (not e!126265))))

(assert (=> b!191882 (= res!90678 (= (getValueByKey!239 (toList!1240 lt!95341) (_1!1777 (tuple2!3533 key!828 v!309))) (Some!244 (_2!1777 (tuple2!3533 key!828 v!309)))))))

(declare-fun b!191883 () Bool)

(assert (=> b!191883 (= e!126265 (contains!1356 (toList!1240 lt!95341) (tuple2!3533 key!828 v!309)))))

(assert (= (and d!56237 res!90679) b!191882))

(assert (= (and b!191882 res!90678) b!191883))

(declare-fun m!218543 () Bool)

(assert (=> d!56237 m!218543))

(declare-fun m!218545 () Bool)

(assert (=> d!56237 m!218545))

(declare-fun m!218547 () Bool)

(assert (=> d!56237 m!218547))

(declare-fun m!218549 () Bool)

(assert (=> d!56237 m!218549))

(declare-fun m!218551 () Bool)

(assert (=> b!191882 m!218551))

(declare-fun m!218553 () Bool)

(assert (=> b!191883 m!218553))

(assert (=> b!191608 d!56237))

(assert (=> b!191608 d!56169))

(assert (=> b!191608 d!56167))

(declare-fun d!56239 () Bool)

(declare-fun e!126266 () Bool)

(assert (=> d!56239 e!126266))

(declare-fun res!90681 () Bool)

(assert (=> d!56239 (=> (not res!90681) (not e!126266))))

(declare-fun lt!95345 () ListLongMap!2449)

(assert (=> d!56239 (= res!90681 (contains!1354 lt!95345 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95343 () List!2425)

(assert (=> d!56239 (= lt!95345 (ListLongMap!2450 lt!95343))))

(declare-fun lt!95344 () Unit!5793)

(declare-fun lt!95346 () Unit!5793)

(assert (=> d!56239 (= lt!95344 lt!95346)))

(assert (=> d!56239 (= (getValueByKey!239 lt!95343 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56239 (= lt!95346 (lemmaContainsTupThenGetReturnValue!126 lt!95343 (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56239 (= lt!95343 (insertStrictlySorted!129 (toList!1240 call!19352) (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (=> d!56239 (= (+!308 call!19352 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))) lt!95345)))

(declare-fun b!191884 () Bool)

(declare-fun res!90680 () Bool)

(assert (=> b!191884 (=> (not res!90680) (not e!126266))))

(assert (=> b!191884 (= res!90680 (= (getValueByKey!239 (toList!1240 lt!95345) (_1!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(declare-fun b!191885 () Bool)

(assert (=> b!191885 (= e!126266 (contains!1356 (toList!1240 lt!95345) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))

(assert (= (and d!56239 res!90681) b!191884))

(assert (= (and b!191884 res!90680) b!191885))

(declare-fun m!218555 () Bool)

(assert (=> d!56239 m!218555))

(declare-fun m!218557 () Bool)

(assert (=> d!56239 m!218557))

(declare-fun m!218559 () Bool)

(assert (=> d!56239 m!218559))

(declare-fun m!218561 () Bool)

(assert (=> d!56239 m!218561))

(declare-fun m!218563 () Bool)

(assert (=> b!191884 m!218563))

(declare-fun m!218565 () Bool)

(assert (=> b!191885 m!218565))

(assert (=> b!191674 d!56239))

(declare-fun d!56241 () Bool)

(assert (=> d!56241 (= (apply!182 lt!95234 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2214 (getValueByKey!239 (toList!1240 lt!95234) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7672 () Bool)

(assert (= bs!7672 d!56241))

(assert (=> bs!7672 m!218209))

(declare-fun m!218567 () Bool)

(assert (=> bs!7672 m!218567))

(assert (=> bs!7672 m!218567))

(declare-fun m!218569 () Bool)

(assert (=> bs!7672 m!218569))

(assert (=> b!191675 d!56241))

(declare-fun d!56243 () Bool)

(declare-fun c!34563 () Bool)

(assert (=> d!56243 (= c!34563 ((_ is ValueCellFull!1884) (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126269 () V!5587)

(assert (=> d!56243 (= (get!2213 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126269)))

(declare-fun b!191890 () Bool)

(declare-fun get!2215 (ValueCell!1884 V!5587) V!5587)

(assert (=> b!191890 (= e!126269 (get!2215 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191891 () Bool)

(declare-fun get!2216 (ValueCell!1884 V!5587) V!5587)

(assert (=> b!191891 (= e!126269 (get!2216 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56243 c!34563) b!191890))

(assert (= (and d!56243 (not c!34563)) b!191891))

(assert (=> b!191890 m!218269))

(assert (=> b!191890 m!218215))

(declare-fun m!218571 () Bool)

(assert (=> b!191890 m!218571))

(assert (=> b!191891 m!218269))

(assert (=> b!191891 m!218215))

(declare-fun m!218573 () Bool)

(assert (=> b!191891 m!218573))

(assert (=> b!191675 d!56243))

(declare-fun d!56245 () Bool)

(assert (=> d!56245 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95111) key!828))))

(declare-fun lt!95349 () Unit!5793)

(declare-fun choose!1043 (List!2425 (_ BitVec 64)) Unit!5793)

(assert (=> d!56245 (= lt!95349 (choose!1043 (toList!1240 lt!95111) key!828))))

(declare-fun e!126272 () Bool)

(assert (=> d!56245 e!126272))

(declare-fun res!90684 () Bool)

(assert (=> d!56245 (=> (not res!90684) (not e!126272))))

(assert (=> d!56245 (= res!90684 (isStrictlySorted!355 (toList!1240 lt!95111)))))

(assert (=> d!56245 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95111) key!828) lt!95349)))

(declare-fun b!191894 () Bool)

(assert (=> b!191894 (= e!126272 (containsKey!243 (toList!1240 lt!95111) key!828))))

(assert (= (and d!56245 res!90684) b!191894))

(assert (=> d!56245 m!218201))

(assert (=> d!56245 m!218201))

(assert (=> d!56245 m!218203))

(declare-fun m!218575 () Bool)

(assert (=> d!56245 m!218575))

(assert (=> d!56245 m!218425))

(assert (=> b!191894 m!218197))

(assert (=> b!191603 d!56245))

(declare-fun d!56247 () Bool)

(declare-fun isEmpty!484 (Option!245) Bool)

(assert (=> d!56247 (= (isDefined!192 (getValueByKey!239 (toList!1240 lt!95111) key!828)) (not (isEmpty!484 (getValueByKey!239 (toList!1240 lt!95111) key!828))))))

(declare-fun bs!7673 () Bool)

(assert (= bs!7673 d!56247))

(assert (=> bs!7673 m!218201))

(declare-fun m!218577 () Bool)

(assert (=> bs!7673 m!218577))

(assert (=> b!191603 d!56247))

(declare-fun d!56249 () Bool)

(declare-fun c!34564 () Bool)

(assert (=> d!56249 (= c!34564 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (= (_1!1777 (h!3060 (toList!1240 lt!95111))) key!828)))))

(declare-fun e!126273 () Option!245)

(assert (=> d!56249 (= (getValueByKey!239 (toList!1240 lt!95111) key!828) e!126273)))

(declare-fun b!191897 () Bool)

(declare-fun e!126274 () Option!245)

(assert (=> b!191897 (= e!126274 (getValueByKey!239 (t!7339 (toList!1240 lt!95111)) key!828))))

(declare-fun b!191895 () Bool)

(assert (=> b!191895 (= e!126273 (Some!244 (_2!1777 (h!3060 (toList!1240 lt!95111)))))))

(declare-fun b!191896 () Bool)

(assert (=> b!191896 (= e!126273 e!126274)))

(declare-fun c!34565 () Bool)

(assert (=> b!191896 (= c!34565 (and ((_ is Cons!2421) (toList!1240 lt!95111)) (not (= (_1!1777 (h!3060 (toList!1240 lt!95111))) key!828))))))

(declare-fun b!191898 () Bool)

(assert (=> b!191898 (= e!126274 None!243)))

(assert (= (and d!56249 c!34564) b!191895))

(assert (= (and d!56249 (not c!34564)) b!191896))

(assert (= (and b!191896 c!34565) b!191897))

(assert (= (and b!191896 (not c!34565)) b!191898))

(declare-fun m!218579 () Bool)

(assert (=> b!191897 m!218579))

(assert (=> b!191603 d!56249))

(assert (=> b!191660 d!56183))

(declare-fun d!56251 () Bool)

(declare-fun e!126276 () Bool)

(assert (=> d!56251 e!126276))

(declare-fun res!90685 () Bool)

(assert (=> d!56251 (=> res!90685 e!126276)))

(declare-fun lt!95351 () Bool)

(assert (=> d!56251 (= res!90685 (not lt!95351))))

(declare-fun lt!95352 () Bool)

(assert (=> d!56251 (= lt!95351 lt!95352)))

(declare-fun lt!95353 () Unit!5793)

(declare-fun e!126275 () Unit!5793)

(assert (=> d!56251 (= lt!95353 e!126275)))

(declare-fun c!34566 () Bool)

(assert (=> d!56251 (= c!34566 lt!95352)))

(assert (=> d!56251 (= lt!95352 (containsKey!243 (toList!1240 lt!95212) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56251 (= (contains!1354 lt!95212 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) lt!95351)))

(declare-fun b!191899 () Bool)

(declare-fun lt!95350 () Unit!5793)

(assert (=> b!191899 (= e!126275 lt!95350)))

(assert (=> b!191899 (= lt!95350 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95212) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191899 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191900 () Bool)

(declare-fun Unit!5804 () Unit!5793)

(assert (=> b!191900 (= e!126275 Unit!5804)))

(declare-fun b!191901 () Bool)

(assert (=> b!191901 (= e!126276 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56251 c!34566) b!191899))

(assert (= (and d!56251 (not c!34566)) b!191900))

(assert (= (and d!56251 (not res!90685)) b!191901))

(assert (=> d!56251 m!218209))

(declare-fun m!218581 () Bool)

(assert (=> d!56251 m!218581))

(assert (=> b!191899 m!218209))

(declare-fun m!218583 () Bool)

(assert (=> b!191899 m!218583))

(assert (=> b!191899 m!218209))

(declare-fun m!218585 () Bool)

(assert (=> b!191899 m!218585))

(assert (=> b!191899 m!218585))

(declare-fun m!218587 () Bool)

(assert (=> b!191899 m!218587))

(assert (=> b!191901 m!218209))

(assert (=> b!191901 m!218585))

(assert (=> b!191901 m!218585))

(assert (=> b!191901 m!218587))

(assert (=> b!191661 d!56251))

(declare-fun d!56253 () Bool)

(assert (=> d!56253 (= (apply!182 lt!95234 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!239 (toList!1240 lt!95234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7674 () Bool)

(assert (= bs!7674 d!56253))

(declare-fun m!218589 () Bool)

(assert (=> bs!7674 m!218589))

(assert (=> bs!7674 m!218589))

(declare-fun m!218591 () Bool)

(assert (=> bs!7674 m!218591))

(assert (=> b!191676 d!56253))

(assert (=> d!56173 d!56175))

(declare-fun b!191918 () Bool)

(declare-fun res!90696 () Bool)

(declare-fun e!126286 () Bool)

(assert (=> b!191918 (=> (not res!90696) (not e!126286))))

(declare-fun lt!95356 () SeekEntryResult!679)

(assert (=> b!191918 (= res!90696 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4889 lt!95356)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191919 () Bool)

(declare-fun e!126288 () Bool)

(declare-fun e!126287 () Bool)

(assert (=> b!191919 (= e!126288 e!126287)))

(declare-fun c!34572 () Bool)

(assert (=> b!191919 (= c!34572 ((_ is MissingVacant!679) lt!95356))))

(declare-fun b!191920 () Bool)

(declare-fun res!90697 () Bool)

(assert (=> b!191920 (= res!90697 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4886 lt!95356)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126285 () Bool)

(assert (=> b!191920 (=> (not res!90697) (not e!126285))))

(declare-fun d!56255 () Bool)

(assert (=> d!56255 e!126288))

(declare-fun c!34571 () Bool)

(assert (=> d!56255 (= c!34571 ((_ is MissingZero!679) lt!95356))))

(assert (=> d!56255 (= lt!95356 (seekEntryOrOpen!0 key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(assert (=> d!56255 true))

(declare-fun _$34!1081 () Unit!5793)

(assert (=> d!56255 (= (choose!1039 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) key!828 (defaultEntry!3910 thiss!1248)) _$34!1081)))

(declare-fun b!191921 () Bool)

(assert (=> b!191921 (= e!126287 ((_ is Undefined!679) lt!95356))))

(declare-fun bm!19376 () Bool)

(declare-fun call!19379 () Bool)

(assert (=> bm!19376 (= call!19379 (arrayContainsKey!0 (_keys!5888 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191922 () Bool)

(declare-fun res!90694 () Bool)

(assert (=> b!191922 (=> (not res!90694) (not e!126286))))

(declare-fun call!19380 () Bool)

(assert (=> b!191922 (= res!90694 call!19380)))

(assert (=> b!191922 (= e!126287 e!126286)))

(declare-fun bm!19377 () Bool)

(assert (=> bm!19377 (= call!19380 (inRange!0 (ite c!34571 (index!4886 lt!95356) (index!4889 lt!95356)) (mask!9131 thiss!1248)))))

(declare-fun b!191923 () Bool)

(assert (=> b!191923 (= e!126286 (not call!19379))))

(declare-fun b!191924 () Bool)

(assert (=> b!191924 (= e!126288 e!126285)))

(declare-fun res!90695 () Bool)

(assert (=> b!191924 (= res!90695 call!19380)))

(assert (=> b!191924 (=> (not res!90695) (not e!126285))))

(declare-fun b!191925 () Bool)

(assert (=> b!191925 (= e!126285 (not call!19379))))

(assert (= (and d!56255 c!34571) b!191924))

(assert (= (and d!56255 (not c!34571)) b!191919))

(assert (= (and b!191924 res!90695) b!191920))

(assert (= (and b!191920 res!90697) b!191925))

(assert (= (and b!191919 c!34572) b!191922))

(assert (= (and b!191919 (not c!34572)) b!191921))

(assert (= (and b!191922 res!90694) b!191918))

(assert (= (and b!191918 res!90696) b!191923))

(assert (= (or b!191924 b!191922) bm!19377))

(assert (= (or b!191925 b!191923) bm!19376))

(declare-fun m!218593 () Bool)

(assert (=> b!191920 m!218593))

(assert (=> d!56255 m!218121))

(declare-fun m!218595 () Bool)

(assert (=> b!191918 m!218595))

(declare-fun m!218597 () Bool)

(assert (=> bm!19377 m!218597))

(assert (=> bm!19376 m!218331))

(assert (=> d!56173 d!56255))

(assert (=> d!56173 d!56163))

(assert (=> b!191605 d!56247))

(assert (=> b!191605 d!56249))

(declare-fun d!56257 () Bool)

(declare-fun e!126290 () Bool)

(assert (=> d!56257 e!126290))

(declare-fun res!90698 () Bool)

(assert (=> d!56257 (=> res!90698 e!126290)))

(declare-fun lt!95358 () Bool)

(assert (=> d!56257 (= res!90698 (not lt!95358))))

(declare-fun lt!95359 () Bool)

(assert (=> d!56257 (= lt!95358 lt!95359)))

(declare-fun lt!95360 () Unit!5793)

(declare-fun e!126289 () Unit!5793)

(assert (=> d!56257 (= lt!95360 e!126289)))

(declare-fun c!34573 () Bool)

(assert (=> d!56257 (= c!34573 lt!95359)))

(assert (=> d!56257 (= lt!95359 (containsKey!243 (toList!1240 lt!95212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56257 (= (contains!1354 lt!95212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95358)))

(declare-fun b!191926 () Bool)

(declare-fun lt!95357 () Unit!5793)

(assert (=> b!191926 (= e!126289 lt!95357)))

(assert (=> b!191926 (= lt!95357 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191926 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191927 () Bool)

(declare-fun Unit!5805 () Unit!5793)

(assert (=> b!191927 (= e!126289 Unit!5805)))

(declare-fun b!191928 () Bool)

(assert (=> b!191928 (= e!126290 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56257 c!34573) b!191926))

(assert (= (and d!56257 (not c!34573)) b!191927))

(assert (= (and d!56257 (not res!90698)) b!191928))

(declare-fun m!218599 () Bool)

(assert (=> d!56257 m!218599))

(declare-fun m!218601 () Bool)

(assert (=> b!191926 m!218601))

(declare-fun m!218603 () Bool)

(assert (=> b!191926 m!218603))

(assert (=> b!191926 m!218603))

(declare-fun m!218605 () Bool)

(assert (=> b!191926 m!218605))

(assert (=> b!191928 m!218603))

(assert (=> b!191928 m!218603))

(assert (=> b!191928 m!218605))

(assert (=> bm!19344 d!56257))

(declare-fun b!191929 () Bool)

(declare-fun e!126296 () Bool)

(declare-fun e!126294 () Bool)

(assert (=> b!191929 (= e!126296 e!126294)))

(declare-fun c!34575 () Bool)

(declare-fun e!126295 () Bool)

(assert (=> b!191929 (= c!34575 e!126295)))

(declare-fun res!90702 () Bool)

(assert (=> b!191929 (=> (not res!90702) (not e!126295))))

(assert (=> b!191929 (= res!90702 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191930 () Bool)

(declare-fun lt!95361 () Unit!5793)

(declare-fun lt!95367 () Unit!5793)

(assert (=> b!191930 (= lt!95361 lt!95367)))

(declare-fun lt!95365 () V!5587)

(declare-fun lt!95363 () ListLongMap!2449)

(declare-fun lt!95366 () (_ BitVec 64))

(declare-fun lt!95362 () (_ BitVec 64))

(assert (=> b!191930 (not (contains!1354 (+!308 lt!95363 (tuple2!3533 lt!95366 lt!95365)) lt!95362))))

(assert (=> b!191930 (= lt!95367 (addStillNotContains!95 lt!95363 lt!95366 lt!95365 lt!95362))))

(assert (=> b!191930 (= lt!95362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191930 (= lt!95365 (get!2213 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191930 (= lt!95366 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19381 () ListLongMap!2449)

(assert (=> b!191930 (= lt!95363 call!19381)))

(declare-fun e!126293 () ListLongMap!2449)

(assert (=> b!191930 (= e!126293 (+!308 call!19381 (tuple2!3533 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) (get!2213 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!191931 () Bool)

(assert (=> b!191931 (= e!126295 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191931 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191932 () Bool)

(declare-fun e!126291 () Bool)

(assert (=> b!191932 (= e!126294 e!126291)))

(declare-fun c!34576 () Bool)

(assert (=> b!191932 (= c!34576 (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191933 () Bool)

(declare-fun lt!95364 () ListLongMap!2449)

(assert (=> b!191933 (= e!126291 (isEmpty!483 lt!95364))))

(declare-fun b!191934 () Bool)

(declare-fun e!126297 () ListLongMap!2449)

(assert (=> b!191934 (= e!126297 e!126293)))

(declare-fun c!34577 () Bool)

(assert (=> b!191934 (= c!34577 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191935 () Bool)

(assert (=> b!191935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> b!191935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4162 (_values!3893 thiss!1248))))))

(declare-fun e!126292 () Bool)

(assert (=> b!191935 (= e!126292 (= (apply!182 lt!95364 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3840 (_values!3893 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19378 () Bool)

(assert (=> bm!19378 (= call!19381 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3910 thiss!1248)))))

(declare-fun b!191936 () Bool)

(assert (=> b!191936 (= e!126294 e!126292)))

(assert (=> b!191936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun res!90699 () Bool)

(assert (=> b!191936 (= res!90699 (contains!1354 lt!95364 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191936 (=> (not res!90699) (not e!126292))))

(declare-fun b!191937 () Bool)

(assert (=> b!191937 (= e!126293 call!19381)))

(declare-fun d!56259 () Bool)

(assert (=> d!56259 e!126296))

(declare-fun res!90701 () Bool)

(assert (=> d!56259 (=> (not res!90701) (not e!126296))))

(assert (=> d!56259 (= res!90701 (not (contains!1354 lt!95364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56259 (= lt!95364 e!126297)))

(declare-fun c!34574 () Bool)

(assert (=> d!56259 (= c!34574 (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56259 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56259 (= (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) lt!95364)))

(declare-fun b!191938 () Bool)

(assert (=> b!191938 (= e!126291 (= lt!95364 (getCurrentListMapNoExtraKeys!215 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3910 thiss!1248))))))

(declare-fun b!191939 () Bool)

(assert (=> b!191939 (= e!126297 (ListLongMap!2450 Nil!2422))))

(declare-fun b!191940 () Bool)

(declare-fun res!90700 () Bool)

(assert (=> b!191940 (=> (not res!90700) (not e!126296))))

(assert (=> b!191940 (= res!90700 (not (contains!1354 lt!95364 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56259 c!34574) b!191939))

(assert (= (and d!56259 (not c!34574)) b!191934))

(assert (= (and b!191934 c!34577) b!191930))

(assert (= (and b!191934 (not c!34577)) b!191937))

(assert (= (or b!191930 b!191937) bm!19378))

(assert (= (and d!56259 res!90701) b!191940))

(assert (= (and b!191940 res!90700) b!191929))

(assert (= (and b!191929 res!90702) b!191931))

(assert (= (and b!191929 c!34575) b!191936))

(assert (= (and b!191929 (not c!34575)) b!191932))

(assert (= (and b!191936 res!90699) b!191935))

(assert (= (and b!191932 c!34576) b!191938))

(assert (= (and b!191932 (not c!34576)) b!191933))

(declare-fun b_lambda!7411 () Bool)

(assert (=> (not b_lambda!7411) (not b!191930)))

(assert (=> b!191930 t!7342))

(declare-fun b_and!11369 () Bool)

(assert (= b_and!11367 (and (=> t!7342 result!4903) b_and!11369)))

(declare-fun b_lambda!7413 () Bool)

(assert (=> (not b_lambda!7413) (not b!191935)))

(assert (=> b!191935 t!7342))

(declare-fun b_and!11371 () Bool)

(assert (= b_and!11369 (and (=> t!7342 result!4903) b_and!11371)))

(declare-fun m!218607 () Bool)

(assert (=> b!191940 m!218607))

(declare-fun m!218609 () Bool)

(assert (=> d!56259 m!218609))

(assert (=> d!56259 m!218137))

(declare-fun m!218611 () Bool)

(assert (=> b!191938 m!218611))

(assert (=> b!191930 m!218209))

(declare-fun m!218613 () Bool)

(assert (=> b!191930 m!218613))

(assert (=> b!191930 m!218269))

(declare-fun m!218615 () Bool)

(assert (=> b!191930 m!218615))

(assert (=> b!191930 m!218215))

(assert (=> b!191930 m!218615))

(declare-fun m!218617 () Bool)

(assert (=> b!191930 m!218617))

(declare-fun m!218619 () Bool)

(assert (=> b!191930 m!218619))

(assert (=> b!191930 m!218269))

(assert (=> b!191930 m!218215))

(assert (=> b!191930 m!218271))

(assert (=> b!191936 m!218209))

(assert (=> b!191936 m!218209))

(declare-fun m!218621 () Bool)

(assert (=> b!191936 m!218621))

(declare-fun m!218623 () Bool)

(assert (=> b!191933 m!218623))

(assert (=> bm!19378 m!218611))

(assert (=> b!191935 m!218209))

(assert (=> b!191935 m!218209))

(declare-fun m!218625 () Bool)

(assert (=> b!191935 m!218625))

(assert (=> b!191935 m!218269))

(assert (=> b!191935 m!218215))

(assert (=> b!191935 m!218269))

(assert (=> b!191935 m!218215))

(assert (=> b!191935 m!218271))

(assert (=> b!191931 m!218209))

(assert (=> b!191931 m!218209))

(assert (=> b!191931 m!218257))

(assert (=> b!191934 m!218209))

(assert (=> b!191934 m!218209))

(assert (=> b!191934 m!218257))

(assert (=> bm!19347 d!56259))

(declare-fun b!191949 () Bool)

(declare-fun e!126303 () (_ BitVec 32))

(declare-fun call!19384 () (_ BitVec 32))

(assert (=> b!191949 (= e!126303 call!19384)))

(declare-fun d!56261 () Bool)

(declare-fun lt!95370 () (_ BitVec 32))

(assert (=> d!56261 (and (bvsge lt!95370 #b00000000000000000000000000000000) (bvsle lt!95370 (bvsub (size!4161 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126302 () (_ BitVec 32))

(assert (=> d!56261 (= lt!95370 e!126302)))

(declare-fun c!34583 () Bool)

(assert (=> d!56261 (= c!34583 (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56261 (and (bvsle #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4161 (_keys!5888 thiss!1248)) (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56261 (= (arrayCountValidKeys!0 (_keys!5888 thiss!1248) #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))) lt!95370)))

(declare-fun b!191950 () Bool)

(assert (=> b!191950 (= e!126302 e!126303)))

(declare-fun c!34582 () Bool)

(assert (=> b!191950 (= c!34582 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191951 () Bool)

(assert (=> b!191951 (= e!126302 #b00000000000000000000000000000000)))

(declare-fun bm!19381 () Bool)

(assert (=> bm!19381 (= call!19384 (arrayCountValidKeys!0 (_keys!5888 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!191952 () Bool)

(assert (=> b!191952 (= e!126303 (bvadd #b00000000000000000000000000000001 call!19384))))

(assert (= (and d!56261 c!34583) b!191951))

(assert (= (and d!56261 (not c!34583)) b!191950))

(assert (= (and b!191950 c!34582) b!191952))

(assert (= (and b!191950 (not c!34582)) b!191949))

(assert (= (or b!191952 b!191949) bm!19381))

(assert (=> b!191950 m!218209))

(assert (=> b!191950 m!218209))

(assert (=> b!191950 m!218257))

(declare-fun m!218627 () Bool)

(assert (=> bm!19381 m!218627))

(assert (=> b!191588 d!56261))

(declare-fun d!56263 () Bool)

(assert (=> d!56263 (= (apply!182 lt!95212 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!239 (toList!1240 lt!95212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7675 () Bool)

(assert (= bs!7675 d!56263))

(declare-fun m!218629 () Bool)

(assert (=> bs!7675 m!218629))

(assert (=> bs!7675 m!218629))

(declare-fun m!218631 () Bool)

(assert (=> bs!7675 m!218631))

(assert (=> b!191671 d!56263))

(declare-fun bm!19384 () Bool)

(declare-fun call!19387 () Bool)

(assert (=> bm!19384 (= call!19387 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun b!191961 () Bool)

(declare-fun e!126311 () Bool)

(declare-fun e!126312 () Bool)

(assert (=> b!191961 (= e!126311 e!126312)))

(declare-fun lt!95377 () (_ BitVec 64))

(assert (=> b!191961 (= lt!95377 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95379 () Unit!5793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8149 (_ BitVec 64) (_ BitVec 32)) Unit!5793)

(assert (=> b!191961 (= lt!95379 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5888 thiss!1248) lt!95377 #b00000000000000000000000000000000))))

(assert (=> b!191961 (arrayContainsKey!0 (_keys!5888 thiss!1248) lt!95377 #b00000000000000000000000000000000)))

(declare-fun lt!95378 () Unit!5793)

(assert (=> b!191961 (= lt!95378 lt!95379)))

(declare-fun res!90707 () Bool)

(assert (=> b!191961 (= res!90707 (= (seekEntryOrOpen!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) (_keys!5888 thiss!1248) (mask!9131 thiss!1248)) (Found!679 #b00000000000000000000000000000000)))))

(assert (=> b!191961 (=> (not res!90707) (not e!126312))))

(declare-fun b!191962 () Bool)

(assert (=> b!191962 (= e!126312 call!19387)))

(declare-fun b!191963 () Bool)

(declare-fun e!126310 () Bool)

(assert (=> b!191963 (= e!126310 e!126311)))

(declare-fun c!34586 () Bool)

(assert (=> b!191963 (= c!34586 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191964 () Bool)

(assert (=> b!191964 (= e!126311 call!19387)))

(declare-fun d!56265 () Bool)

(declare-fun res!90708 () Bool)

(assert (=> d!56265 (=> res!90708 e!126310)))

(assert (=> d!56265 (= res!90708 (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)) e!126310)))

(assert (= (and d!56265 (not res!90708)) b!191963))

(assert (= (and b!191963 c!34586) b!191961))

(assert (= (and b!191963 (not c!34586)) b!191964))

(assert (= (and b!191961 res!90707) b!191962))

(assert (= (or b!191962 b!191964) bm!19384))

(declare-fun m!218633 () Bool)

(assert (=> bm!19384 m!218633))

(assert (=> b!191961 m!218209))

(declare-fun m!218635 () Bool)

(assert (=> b!191961 m!218635))

(declare-fun m!218637 () Bool)

(assert (=> b!191961 m!218637))

(assert (=> b!191961 m!218209))

(declare-fun m!218639 () Bool)

(assert (=> b!191961 m!218639))

(assert (=> b!191963 m!218209))

(assert (=> b!191963 m!218209))

(assert (=> b!191963 m!218257))

(assert (=> b!191589 d!56265))

(declare-fun d!56267 () Bool)

(declare-fun e!126313 () Bool)

(assert (=> d!56267 e!126313))

(declare-fun res!90710 () Bool)

(assert (=> d!56267 (=> (not res!90710) (not e!126313))))

(declare-fun lt!95382 () ListLongMap!2449)

(assert (=> d!56267 (= res!90710 (contains!1354 lt!95382 (_1!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(declare-fun lt!95380 () List!2425)

(assert (=> d!56267 (= lt!95382 (ListLongMap!2450 lt!95380))))

(declare-fun lt!95381 () Unit!5793)

(declare-fun lt!95383 () Unit!5793)

(assert (=> d!56267 (= lt!95381 lt!95383)))

(assert (=> d!56267 (= (getValueByKey!239 lt!95380 (_1!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))) (Some!244 (_2!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56267 (= lt!95383 (lemmaContainsTupThenGetReturnValue!126 lt!95380 (_1!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (_2!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56267 (= lt!95380 (insertStrictlySorted!129 (toList!1240 (ite c!34505 call!19349 (ite c!34501 call!19343 call!19347))) (_1!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) (_2!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))))))

(assert (=> d!56267 (= (+!308 (ite c!34505 call!19349 (ite c!34501 call!19343 call!19347)) (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))) lt!95382)))

(declare-fun b!191965 () Bool)

(declare-fun res!90709 () Bool)

(assert (=> b!191965 (=> (not res!90709) (not e!126313))))

(assert (=> b!191965 (= res!90709 (= (getValueByKey!239 (toList!1240 lt!95382) (_1!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248))))) (Some!244 (_2!1777 (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))))

(declare-fun b!191966 () Bool)

(assert (=> b!191966 (= e!126313 (contains!1356 (toList!1240 lt!95382) (ite (or c!34505 c!34501) (tuple2!3533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3751 thiss!1248)) (tuple2!3533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3751 thiss!1248)))))))

(assert (= (and d!56267 res!90710) b!191965))

(assert (= (and b!191965 res!90709) b!191966))

(declare-fun m!218641 () Bool)

(assert (=> d!56267 m!218641))

(declare-fun m!218643 () Bool)

(assert (=> d!56267 m!218643))

(declare-fun m!218645 () Bool)

(assert (=> d!56267 m!218645))

(declare-fun m!218647 () Bool)

(assert (=> d!56267 m!218647))

(declare-fun m!218649 () Bool)

(assert (=> b!191965 m!218649))

(declare-fun m!218651 () Bool)

(assert (=> b!191966 m!218651))

(assert (=> bm!19341 d!56267))

(declare-fun d!56269 () Bool)

(declare-fun res!90719 () Bool)

(declare-fun e!126324 () Bool)

(assert (=> d!56269 (=> res!90719 e!126324)))

(assert (=> d!56269 (= res!90719 (bvsge #b00000000000000000000000000000000 (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> d!56269 (= (arrayNoDuplicates!0 (_keys!5888 thiss!1248) #b00000000000000000000000000000000 Nil!2424) e!126324)))

(declare-fun bm!19387 () Bool)

(declare-fun call!19390 () Bool)

(declare-fun c!34589 () Bool)

(assert (=> bm!19387 (= call!19390 (arrayNoDuplicates!0 (_keys!5888 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34589 (Cons!2423 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) Nil!2424) Nil!2424)))))

(declare-fun b!191977 () Bool)

(declare-fun e!126325 () Bool)

(assert (=> b!191977 (= e!126325 call!19390)))

(declare-fun b!191978 () Bool)

(assert (=> b!191978 (= e!126325 call!19390)))

(declare-fun b!191979 () Bool)

(declare-fun e!126322 () Bool)

(assert (=> b!191979 (= e!126324 e!126322)))

(declare-fun res!90717 () Bool)

(assert (=> b!191979 (=> (not res!90717) (not e!126322))))

(declare-fun e!126323 () Bool)

(assert (=> b!191979 (= res!90717 (not e!126323))))

(declare-fun res!90718 () Bool)

(assert (=> b!191979 (=> (not res!90718) (not e!126323))))

(assert (=> b!191979 (= res!90718 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191980 () Bool)

(declare-fun contains!1357 (List!2427 (_ BitVec 64)) Bool)

(assert (=> b!191980 (= e!126323 (contains!1357 Nil!2424 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191981 () Bool)

(assert (=> b!191981 (= e!126322 e!126325)))

(assert (=> b!191981 (= c!34589 (validKeyInArray!0 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56269 (not res!90719)) b!191979))

(assert (= (and b!191979 res!90718) b!191980))

(assert (= (and b!191979 res!90717) b!191981))

(assert (= (and b!191981 c!34589) b!191977))

(assert (= (and b!191981 (not c!34589)) b!191978))

(assert (= (or b!191977 b!191978) bm!19387))

(assert (=> bm!19387 m!218209))

(declare-fun m!218653 () Bool)

(assert (=> bm!19387 m!218653))

(assert (=> b!191979 m!218209))

(assert (=> b!191979 m!218209))

(assert (=> b!191979 m!218257))

(assert (=> b!191980 m!218209))

(assert (=> b!191980 m!218209))

(declare-fun m!218655 () Bool)

(assert (=> b!191980 m!218655))

(assert (=> b!191981 m!218209))

(assert (=> b!191981 m!218209))

(assert (=> b!191981 m!218257))

(assert (=> b!191590 d!56269))

(declare-fun b!191994 () Bool)

(declare-fun e!126334 () SeekEntryResult!679)

(assert (=> b!191994 (= e!126334 (MissingVacant!679 (index!4888 lt!95265)))))

(declare-fun b!191995 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191995 (= e!126334 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20551 lt!95265) #b00000000000000000000000000000001) (nextIndex!0 (index!4888 lt!95265) (x!20551 lt!95265) (mask!9131 thiss!1248)) (index!4888 lt!95265) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun b!191996 () Bool)

(declare-fun e!126332 () SeekEntryResult!679)

(declare-fun e!126333 () SeekEntryResult!679)

(assert (=> b!191996 (= e!126332 e!126333)))

(declare-fun c!34596 () Bool)

(declare-fun lt!95389 () (_ BitVec 64))

(assert (=> b!191996 (= c!34596 (= lt!95389 key!828))))

(declare-fun d!56271 () Bool)

(declare-fun lt!95388 () SeekEntryResult!679)

(assert (=> d!56271 (and (or ((_ is Undefined!679) lt!95388) (not ((_ is Found!679) lt!95388)) (and (bvsge (index!4887 lt!95388) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95388) (size!4161 (_keys!5888 thiss!1248))))) (or ((_ is Undefined!679) lt!95388) ((_ is Found!679) lt!95388) (not ((_ is MissingVacant!679) lt!95388)) (not (= (index!4889 lt!95388) (index!4888 lt!95265))) (and (bvsge (index!4889 lt!95388) #b00000000000000000000000000000000) (bvslt (index!4889 lt!95388) (size!4161 (_keys!5888 thiss!1248))))) (or ((_ is Undefined!679) lt!95388) (ite ((_ is Found!679) lt!95388) (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4887 lt!95388)) key!828) (and ((_ is MissingVacant!679) lt!95388) (= (index!4889 lt!95388) (index!4888 lt!95265)) (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4889 lt!95388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56271 (= lt!95388 e!126332)))

(declare-fun c!34597 () Bool)

(assert (=> d!56271 (= c!34597 (bvsge (x!20551 lt!95265) #b01111111111111111111111111111110))))

(assert (=> d!56271 (= lt!95389 (select (arr!3839 (_keys!5888 thiss!1248)) (index!4888 lt!95265)))))

(assert (=> d!56271 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56271 (= (seekKeyOrZeroReturnVacant!0 (x!20551 lt!95265) (index!4888 lt!95265) (index!4888 lt!95265) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)) lt!95388)))

(declare-fun b!191997 () Bool)

(declare-fun c!34598 () Bool)

(assert (=> b!191997 (= c!34598 (= lt!95389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191997 (= e!126333 e!126334)))

(declare-fun b!191998 () Bool)

(assert (=> b!191998 (= e!126332 Undefined!679)))

(declare-fun b!191999 () Bool)

(assert (=> b!191999 (= e!126333 (Found!679 (index!4888 lt!95265)))))

(assert (= (and d!56271 c!34597) b!191998))

(assert (= (and d!56271 (not c!34597)) b!191996))

(assert (= (and b!191996 c!34596) b!191999))

(assert (= (and b!191996 (not c!34596)) b!191997))

(assert (= (and b!191997 c!34598) b!191994))

(assert (= (and b!191997 (not c!34598)) b!191995))

(declare-fun m!218657 () Bool)

(assert (=> b!191995 m!218657))

(assert (=> b!191995 m!218657))

(declare-fun m!218659 () Bool)

(assert (=> b!191995 m!218659))

(declare-fun m!218661 () Bool)

(assert (=> d!56271 m!218661))

(declare-fun m!218663 () Bool)

(assert (=> d!56271 m!218663))

(assert (=> d!56271 m!218353))

(assert (=> d!56271 m!218137))

(assert (=> b!191739 d!56271))

(assert (=> b!191687 d!56183))

(declare-fun d!56273 () Bool)

(assert (=> d!56273 (= (+!308 (getCurrentListMap!888 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)) (tuple2!3533 key!828 v!309)) (getCurrentListMap!888 (_keys!5888 thiss!1248) (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248))) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3910 thiss!1248)))))

(assert (=> d!56273 true))

(declare-fun _$5!152 () Unit!5793)

(assert (=> d!56273 (= (choose!1038 (_keys!5888 thiss!1248) (_values!3893 thiss!1248) (mask!9131 thiss!1248) (extraKeys!3647 thiss!1248) (zeroValue!3751 thiss!1248) (minValue!3751 thiss!1248) (index!4887 lt!95108) key!828 v!309 (defaultEntry!3910 thiss!1248)) _$5!152)))

(declare-fun bs!7676 () Bool)

(assert (= bs!7676 d!56273))

(assert (=> bs!7676 m!218129))

(assert (=> bs!7676 m!218129))

(assert (=> bs!7676 m!218207))

(assert (=> bs!7676 m!218131))

(assert (=> bs!7676 m!218133))

(assert (=> d!56165 d!56273))

(assert (=> d!56165 d!56163))

(declare-fun d!56275 () Bool)

(declare-fun e!126336 () Bool)

(assert (=> d!56275 e!126336))

(declare-fun res!90720 () Bool)

(assert (=> d!56275 (=> res!90720 e!126336)))

(declare-fun lt!95391 () Bool)

(assert (=> d!56275 (= res!90720 (not lt!95391))))

(declare-fun lt!95392 () Bool)

(assert (=> d!56275 (= lt!95391 lt!95392)))

(declare-fun lt!95393 () Unit!5793)

(declare-fun e!126335 () Unit!5793)

(assert (=> d!56275 (= lt!95393 e!126335)))

(declare-fun c!34599 () Bool)

(assert (=> d!56275 (= c!34599 lt!95392)))

(assert (=> d!56275 (= lt!95392 (containsKey!243 (toList!1240 lt!95212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56275 (= (contains!1354 lt!95212 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95391)))

(declare-fun b!192000 () Bool)

(declare-fun lt!95390 () Unit!5793)

(assert (=> b!192000 (= e!126335 lt!95390)))

(assert (=> b!192000 (= lt!95390 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192000 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192001 () Bool)

(declare-fun Unit!5806 () Unit!5793)

(assert (=> b!192001 (= e!126335 Unit!5806)))

(declare-fun b!192002 () Bool)

(assert (=> b!192002 (= e!126336 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56275 c!34599) b!192000))

(assert (= (and d!56275 (not c!34599)) b!192001))

(assert (= (and d!56275 (not res!90720)) b!192002))

(declare-fun m!218665 () Bool)

(assert (=> d!56275 m!218665))

(declare-fun m!218667 () Bool)

(assert (=> b!192000 m!218667))

(assert (=> b!192000 m!218629))

(assert (=> b!192000 m!218629))

(declare-fun m!218669 () Bool)

(assert (=> b!192000 m!218669))

(assert (=> b!192002 m!218629))

(assert (=> b!192002 m!218629))

(assert (=> b!192002 m!218669))

(assert (=> bm!19342 d!56275))

(declare-fun d!56277 () Bool)

(declare-fun e!126338 () Bool)

(assert (=> d!56277 e!126338))

(declare-fun res!90721 () Bool)

(assert (=> d!56277 (=> res!90721 e!126338)))

(declare-fun lt!95395 () Bool)

(assert (=> d!56277 (= res!90721 (not lt!95395))))

(declare-fun lt!95396 () Bool)

(assert (=> d!56277 (= lt!95395 lt!95396)))

(declare-fun lt!95397 () Unit!5793)

(declare-fun e!126337 () Unit!5793)

(assert (=> d!56277 (= lt!95397 e!126337)))

(declare-fun c!34600 () Bool)

(assert (=> d!56277 (= c!34600 lt!95396)))

(assert (=> d!56277 (= lt!95396 (containsKey!243 (toList!1240 lt!95234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56277 (= (contains!1354 lt!95234 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95395)))

(declare-fun b!192003 () Bool)

(declare-fun lt!95394 () Unit!5793)

(assert (=> b!192003 (= e!126337 lt!95394)))

(assert (=> b!192003 (= lt!95394 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192003 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192004 () Bool)

(declare-fun Unit!5807 () Unit!5793)

(assert (=> b!192004 (= e!126337 Unit!5807)))

(declare-fun b!192005 () Bool)

(assert (=> b!192005 (= e!126338 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56277 c!34600) b!192003))

(assert (= (and d!56277 (not c!34600)) b!192004))

(assert (= (and d!56277 (not res!90721)) b!192005))

(declare-fun m!218671 () Bool)

(assert (=> d!56277 m!218671))

(declare-fun m!218673 () Bool)

(assert (=> b!192003 m!218673))

(assert (=> b!192003 m!218357))

(assert (=> b!192003 m!218357))

(declare-fun m!218675 () Bool)

(assert (=> b!192003 m!218675))

(assert (=> b!192005 m!218357))

(assert (=> b!192005 m!218357))

(assert (=> b!192005 m!218675))

(assert (=> bm!19349 d!56277))

(declare-fun b!192024 () Bool)

(declare-fun e!126352 () SeekEntryResult!679)

(assert (=> b!192024 (= e!126352 (Intermediate!679 true (toIndex!0 key!828 (mask!9131 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192025 () Bool)

(declare-fun lt!95403 () SeekEntryResult!679)

(assert (=> b!192025 (and (bvsge (index!4888 lt!95403) #b00000000000000000000000000000000) (bvslt (index!4888 lt!95403) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun res!90728 () Bool)

(assert (=> b!192025 (= res!90728 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4888 lt!95403)) key!828))))

(declare-fun e!126350 () Bool)

(assert (=> b!192025 (=> res!90728 e!126350)))

(declare-fun e!126353 () Bool)

(assert (=> b!192025 (= e!126353 e!126350)))

(declare-fun b!192026 () Bool)

(declare-fun e!126349 () SeekEntryResult!679)

(assert (=> b!192026 (= e!126352 e!126349)))

(declare-fun c!34608 () Bool)

(declare-fun lt!95402 () (_ BitVec 64))

(assert (=> b!192026 (= c!34608 (or (= lt!95402 key!828) (= (bvadd lt!95402 lt!95402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192027 () Bool)

(assert (=> b!192027 (and (bvsge (index!4888 lt!95403) #b00000000000000000000000000000000) (bvslt (index!4888 lt!95403) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun res!90730 () Bool)

(assert (=> b!192027 (= res!90730 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4888 lt!95403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192027 (=> res!90730 e!126350)))

(declare-fun b!192028 () Bool)

(assert (=> b!192028 (and (bvsge (index!4888 lt!95403) #b00000000000000000000000000000000) (bvslt (index!4888 lt!95403) (size!4161 (_keys!5888 thiss!1248))))))

(assert (=> b!192028 (= e!126350 (= (select (arr!3839 (_keys!5888 thiss!1248)) (index!4888 lt!95403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192029 () Bool)

(declare-fun e!126351 () Bool)

(assert (=> b!192029 (= e!126351 (bvsge (x!20551 lt!95403) #b01111111111111111111111111111110))))

(declare-fun b!192030 () Bool)

(assert (=> b!192030 (= e!126349 (Intermediate!679 false (toIndex!0 key!828 (mask!9131 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192031 () Bool)

(assert (=> b!192031 (= e!126349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9131 thiss!1248)) #b00000000000000000000000000000000 (mask!9131 thiss!1248)) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)))))

(declare-fun b!192032 () Bool)

(assert (=> b!192032 (= e!126351 e!126353)))

(declare-fun res!90729 () Bool)

(assert (=> b!192032 (= res!90729 (and ((_ is Intermediate!679) lt!95403) (not (undefined!1491 lt!95403)) (bvslt (x!20551 lt!95403) #b01111111111111111111111111111110) (bvsge (x!20551 lt!95403) #b00000000000000000000000000000000) (bvsge (x!20551 lt!95403) #b00000000000000000000000000000000)))))

(assert (=> b!192032 (=> (not res!90729) (not e!126353))))

(declare-fun d!56279 () Bool)

(assert (=> d!56279 e!126351))

(declare-fun c!34607 () Bool)

(assert (=> d!56279 (= c!34607 (and ((_ is Intermediate!679) lt!95403) (undefined!1491 lt!95403)))))

(assert (=> d!56279 (= lt!95403 e!126352)))

(declare-fun c!34609 () Bool)

(assert (=> d!56279 (= c!34609 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56279 (= lt!95402 (select (arr!3839 (_keys!5888 thiss!1248)) (toIndex!0 key!828 (mask!9131 thiss!1248))))))

(assert (=> d!56279 (validMask!0 (mask!9131 thiss!1248))))

(assert (=> d!56279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9131 thiss!1248)) key!828 (_keys!5888 thiss!1248) (mask!9131 thiss!1248)) lt!95403)))

(assert (= (and d!56279 c!34609) b!192024))

(assert (= (and d!56279 (not c!34609)) b!192026))

(assert (= (and b!192026 c!34608) b!192030))

(assert (= (and b!192026 (not c!34608)) b!192031))

(assert (= (and d!56279 c!34607) b!192029))

(assert (= (and d!56279 (not c!34607)) b!192032))

(assert (= (and b!192032 res!90729) b!192025))

(assert (= (and b!192025 (not res!90728)) b!192027))

(assert (= (and b!192027 (not res!90730)) b!192028))

(assert (=> d!56279 m!218345))

(declare-fun m!218677 () Bool)

(assert (=> d!56279 m!218677))

(assert (=> d!56279 m!218137))

(assert (=> b!192031 m!218345))

(declare-fun m!218679 () Bool)

(assert (=> b!192031 m!218679))

(assert (=> b!192031 m!218679))

(declare-fun m!218681 () Bool)

(assert (=> b!192031 m!218681))

(declare-fun m!218683 () Bool)

(assert (=> b!192027 m!218683))

(assert (=> b!192025 m!218683))

(assert (=> b!192028 m!218683))

(assert (=> d!56175 d!56279))

(declare-fun d!56281 () Bool)

(declare-fun lt!95409 () (_ BitVec 32))

(declare-fun lt!95408 () (_ BitVec 32))

(assert (=> d!56281 (= lt!95409 (bvmul (bvxor lt!95408 (bvlshr lt!95408 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56281 (= lt!95408 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56281 (and (bvsge (mask!9131 thiss!1248) #b00000000000000000000000000000000) (let ((res!90731 (let ((h!3063 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20570 (bvmul (bvxor h!3063 (bvlshr h!3063 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20570 (bvlshr x!20570 #b00000000000000000000000000001101)) (mask!9131 thiss!1248)))))) (and (bvslt res!90731 (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90731 #b00000000000000000000000000000000))))))

(assert (=> d!56281 (= (toIndex!0 key!828 (mask!9131 thiss!1248)) (bvand (bvxor lt!95409 (bvlshr lt!95409 #b00000000000000000000000000001101)) (mask!9131 thiss!1248)))))

(assert (=> d!56175 d!56281))

(assert (=> d!56175 d!56163))

(declare-fun d!56283 () Bool)

(assert (=> d!56283 (= (apply!182 lt!95212 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) (get!2214 (getValueByKey!239 (toList!1240 lt!95212) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7677 () Bool)

(assert (= bs!7677 d!56283))

(assert (=> bs!7677 m!218209))

(assert (=> bs!7677 m!218585))

(assert (=> bs!7677 m!218585))

(declare-fun m!218685 () Bool)

(assert (=> bs!7677 m!218685))

(assert (=> b!191652 d!56283))

(declare-fun d!56285 () Bool)

(declare-fun c!34610 () Bool)

(assert (=> d!56285 (= c!34610 ((_ is ValueCellFull!1884) (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126354 () V!5587)

(assert (=> d!56285 (= (get!2213 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126354)))

(declare-fun b!192033 () Bool)

(assert (=> b!192033 (= e!126354 (get!2215 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192034 () Bool)

(assert (=> b!192034 (= e!126354 (get!2216 (select (arr!3840 (array!8152 (store (arr!3840 (_values!3893 thiss!1248)) (index!4887 lt!95108) (ValueCellFull!1884 v!309)) (size!4162 (_values!3893 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3910 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56285 c!34610) b!192033))

(assert (= (and d!56285 (not c!34610)) b!192034))

(assert (=> b!192033 m!218213))

(assert (=> b!192033 m!218215))

(declare-fun m!218687 () Bool)

(assert (=> b!192033 m!218687))

(assert (=> b!192034 m!218213))

(assert (=> b!192034 m!218215))

(declare-fun m!218689 () Bool)

(assert (=> b!192034 m!218689))

(assert (=> b!191652 d!56285))

(declare-fun d!56287 () Bool)

(assert (=> d!56287 (= (apply!182 lt!95212 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!239 (toList!1240 lt!95212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7678 () Bool)

(assert (= bs!7678 d!56287))

(assert (=> bs!7678 m!218603))

(assert (=> bs!7678 m!218603))

(declare-fun m!218691 () Bool)

(assert (=> bs!7678 m!218691))

(assert (=> b!191653 d!56287))

(declare-fun d!56289 () Bool)

(assert (=> d!56289 (= (apply!182 (+!308 lt!95236 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) lt!95228) (apply!182 lt!95236 lt!95228))))

(declare-fun lt!95410 () Unit!5793)

(assert (=> d!56289 (= lt!95410 (choose!1041 lt!95236 lt!95225 (zeroValue!3751 thiss!1248) lt!95228))))

(declare-fun e!126355 () Bool)

(assert (=> d!56289 e!126355))

(declare-fun res!90732 () Bool)

(assert (=> d!56289 (=> (not res!90732) (not e!126355))))

(assert (=> d!56289 (= res!90732 (contains!1354 lt!95236 lt!95228))))

(assert (=> d!56289 (= (addApplyDifferent!158 lt!95236 lt!95225 (zeroValue!3751 thiss!1248) lt!95228) lt!95410)))

(declare-fun b!192035 () Bool)

(assert (=> b!192035 (= e!126355 (not (= lt!95228 lt!95225)))))

(assert (= (and d!56289 res!90732) b!192035))

(assert (=> d!56289 m!218303))

(assert (=> d!56289 m!218287))

(assert (=> d!56289 m!218287))

(assert (=> d!56289 m!218305))

(declare-fun m!218693 () Bool)

(assert (=> d!56289 m!218693))

(declare-fun m!218695 () Bool)

(assert (=> d!56289 m!218695))

(assert (=> b!191682 d!56289))

(declare-fun d!56291 () Bool)

(assert (=> d!56291 (contains!1354 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) lt!95229)))

(declare-fun lt!95411 () Unit!5793)

(assert (=> d!56291 (= lt!95411 (choose!1042 lt!95226 lt!95219 (zeroValue!3751 thiss!1248) lt!95229))))

(assert (=> d!56291 (contains!1354 lt!95226 lt!95229)))

(assert (=> d!56291 (= (addStillContains!158 lt!95226 lt!95219 (zeroValue!3751 thiss!1248) lt!95229) lt!95411)))

(declare-fun bs!7679 () Bool)

(assert (= bs!7679 d!56291))

(assert (=> bs!7679 m!218299))

(assert (=> bs!7679 m!218299))

(assert (=> bs!7679 m!218301))

(declare-fun m!218697 () Bool)

(assert (=> bs!7679 m!218697))

(declare-fun m!218699 () Bool)

(assert (=> bs!7679 m!218699))

(assert (=> b!191682 d!56291))

(declare-fun d!56293 () Bool)

(assert (=> d!56293 (= (apply!182 (+!308 lt!95238 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) lt!95232) (apply!182 lt!95238 lt!95232))))

(declare-fun lt!95412 () Unit!5793)

(assert (=> d!56293 (= lt!95412 (choose!1041 lt!95238 lt!95231 (minValue!3751 thiss!1248) lt!95232))))

(declare-fun e!126356 () Bool)

(assert (=> d!56293 e!126356))

(declare-fun res!90733 () Bool)

(assert (=> d!56293 (=> (not res!90733) (not e!126356))))

(assert (=> d!56293 (= res!90733 (contains!1354 lt!95238 lt!95232))))

(assert (=> d!56293 (= (addApplyDifferent!158 lt!95238 lt!95231 (minValue!3751 thiss!1248) lt!95232) lt!95412)))

(declare-fun b!192036 () Bool)

(assert (=> b!192036 (= e!126356 (not (= lt!95232 lt!95231)))))

(assert (= (and d!56293 res!90733) b!192036))

(assert (=> d!56293 m!218293))

(assert (=> d!56293 m!218283))

(assert (=> d!56293 m!218283))

(assert (=> d!56293 m!218289))

(declare-fun m!218701 () Bool)

(assert (=> d!56293 m!218701))

(declare-fun m!218703 () Bool)

(assert (=> d!56293 m!218703))

(assert (=> b!191682 d!56293))

(declare-fun d!56295 () Bool)

(declare-fun e!126357 () Bool)

(assert (=> d!56295 e!126357))

(declare-fun res!90735 () Bool)

(assert (=> d!56295 (=> (not res!90735) (not e!126357))))

(declare-fun lt!95415 () ListLongMap!2449)

(assert (=> d!56295 (= res!90735 (contains!1354 lt!95415 (_1!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95413 () List!2425)

(assert (=> d!56295 (= lt!95415 (ListLongMap!2450 lt!95413))))

(declare-fun lt!95414 () Unit!5793)

(declare-fun lt!95416 () Unit!5793)

(assert (=> d!56295 (= lt!95414 lt!95416)))

(assert (=> d!56295 (= (getValueByKey!239 lt!95413 (_1!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))))))

(assert (=> d!56295 (= lt!95416 (lemmaContainsTupThenGetReturnValue!126 lt!95413 (_1!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))))))

(assert (=> d!56295 (= lt!95413 (insertStrictlySorted!129 (toList!1240 lt!95227) (_1!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))))))

(assert (=> d!56295 (= (+!308 lt!95227 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) lt!95415)))

(declare-fun b!192037 () Bool)

(declare-fun res!90734 () Bool)

(assert (=> b!192037 (=> (not res!90734) (not e!126357))))

(assert (=> b!192037 (= res!90734 (= (getValueByKey!239 (toList!1240 lt!95415) (_1!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))))))))

(declare-fun b!192038 () Bool)

(assert (=> b!192038 (= e!126357 (contains!1356 (toList!1240 lt!95415) (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))))))

(assert (= (and d!56295 res!90735) b!192037))

(assert (= (and b!192037 res!90734) b!192038))

(declare-fun m!218705 () Bool)

(assert (=> d!56295 m!218705))

(declare-fun m!218707 () Bool)

(assert (=> d!56295 m!218707))

(declare-fun m!218709 () Bool)

(assert (=> d!56295 m!218709))

(declare-fun m!218711 () Bool)

(assert (=> d!56295 m!218711))

(declare-fun m!218713 () Bool)

(assert (=> b!192037 m!218713))

(declare-fun m!218715 () Bool)

(assert (=> b!192038 m!218715))

(assert (=> b!191682 d!56295))

(declare-fun d!56297 () Bool)

(declare-fun e!126358 () Bool)

(assert (=> d!56297 e!126358))

(declare-fun res!90737 () Bool)

(assert (=> d!56297 (=> (not res!90737) (not e!126358))))

(declare-fun lt!95419 () ListLongMap!2449)

(assert (=> d!56297 (= res!90737 (contains!1354 lt!95419 (_1!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))))))

(declare-fun lt!95417 () List!2425)

(assert (=> d!56297 (= lt!95419 (ListLongMap!2450 lt!95417))))

(declare-fun lt!95418 () Unit!5793)

(declare-fun lt!95420 () Unit!5793)

(assert (=> d!56297 (= lt!95418 lt!95420)))

(assert (=> d!56297 (= (getValueByKey!239 lt!95417 (_1!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))))))

(assert (=> d!56297 (= lt!95420 (lemmaContainsTupThenGetReturnValue!126 lt!95417 (_1!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))))))

(assert (=> d!56297 (= lt!95417 (insertStrictlySorted!129 (toList!1240 lt!95238) (_1!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))))))

(assert (=> d!56297 (= (+!308 lt!95238 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) lt!95419)))

(declare-fun b!192039 () Bool)

(declare-fun res!90736 () Bool)

(assert (=> b!192039 (=> (not res!90736) (not e!126358))))

(assert (=> b!192039 (= res!90736 (= (getValueByKey!239 (toList!1240 lt!95419) (_1!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))))))))

(declare-fun b!192040 () Bool)

(assert (=> b!192040 (= e!126358 (contains!1356 (toList!1240 lt!95419) (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))))))

(assert (= (and d!56297 res!90737) b!192039))

(assert (= (and b!192039 res!90736) b!192040))

(declare-fun m!218717 () Bool)

(assert (=> d!56297 m!218717))

(declare-fun m!218719 () Bool)

(assert (=> d!56297 m!218719))

(declare-fun m!218721 () Bool)

(assert (=> d!56297 m!218721))

(declare-fun m!218723 () Bool)

(assert (=> d!56297 m!218723))

(declare-fun m!218725 () Bool)

(assert (=> b!192039 m!218725))

(declare-fun m!218727 () Bool)

(assert (=> b!192040 m!218727))

(assert (=> b!191682 d!56297))

(declare-fun d!56299 () Bool)

(assert (=> d!56299 (= (apply!182 lt!95227 lt!95224) (get!2214 (getValueByKey!239 (toList!1240 lt!95227) lt!95224)))))

(declare-fun bs!7680 () Bool)

(assert (= bs!7680 d!56299))

(declare-fun m!218729 () Bool)

(assert (=> bs!7680 m!218729))

(assert (=> bs!7680 m!218729))

(declare-fun m!218731 () Bool)

(assert (=> bs!7680 m!218731))

(assert (=> b!191682 d!56299))

(assert (=> b!191682 d!56259))

(declare-fun d!56301 () Bool)

(assert (=> d!56301 (= (apply!182 (+!308 lt!95227 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) lt!95224) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95227 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248)))) lt!95224)))))

(declare-fun bs!7681 () Bool)

(assert (= bs!7681 d!56301))

(declare-fun m!218733 () Bool)

(assert (=> bs!7681 m!218733))

(assert (=> bs!7681 m!218733))

(declare-fun m!218735 () Bool)

(assert (=> bs!7681 m!218735))

(assert (=> b!191682 d!56301))

(declare-fun d!56303 () Bool)

(assert (=> d!56303 (= (apply!182 (+!308 lt!95238 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248))) lt!95232) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95238 (tuple2!3533 lt!95231 (minValue!3751 thiss!1248)))) lt!95232)))))

(declare-fun bs!7682 () Bool)

(assert (= bs!7682 d!56303))

(declare-fun m!218737 () Bool)

(assert (=> bs!7682 m!218737))

(assert (=> bs!7682 m!218737))

(declare-fun m!218739 () Bool)

(assert (=> bs!7682 m!218739))

(assert (=> b!191682 d!56303))

(declare-fun d!56305 () Bool)

(declare-fun e!126359 () Bool)

(assert (=> d!56305 e!126359))

(declare-fun res!90739 () Bool)

(assert (=> d!56305 (=> (not res!90739) (not e!126359))))

(declare-fun lt!95423 () ListLongMap!2449)

(assert (=> d!56305 (= res!90739 (contains!1354 lt!95423 (_1!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))))))

(declare-fun lt!95421 () List!2425)

(assert (=> d!56305 (= lt!95423 (ListLongMap!2450 lt!95421))))

(declare-fun lt!95422 () Unit!5793)

(declare-fun lt!95424 () Unit!5793)

(assert (=> d!56305 (= lt!95422 lt!95424)))

(assert (=> d!56305 (= (getValueByKey!239 lt!95421 (_1!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56305 (= lt!95424 (lemmaContainsTupThenGetReturnValue!126 lt!95421 (_1!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56305 (= lt!95421 (insertStrictlySorted!129 (toList!1240 lt!95236) (_1!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56305 (= (+!308 lt!95236 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) lt!95423)))

(declare-fun b!192041 () Bool)

(declare-fun res!90738 () Bool)

(assert (=> b!192041 (=> (not res!90738) (not e!126359))))

(assert (=> b!192041 (= res!90738 (= (getValueByKey!239 (toList!1240 lt!95423) (_1!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))))))))

(declare-fun b!192042 () Bool)

(assert (=> b!192042 (= e!126359 (contains!1356 (toList!1240 lt!95423) (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))))))

(assert (= (and d!56305 res!90739) b!192041))

(assert (= (and b!192041 res!90738) b!192042))

(declare-fun m!218741 () Bool)

(assert (=> d!56305 m!218741))

(declare-fun m!218743 () Bool)

(assert (=> d!56305 m!218743))

(declare-fun m!218745 () Bool)

(assert (=> d!56305 m!218745))

(declare-fun m!218747 () Bool)

(assert (=> d!56305 m!218747))

(declare-fun m!218749 () Bool)

(assert (=> b!192041 m!218749))

(declare-fun m!218751 () Bool)

(assert (=> b!192042 m!218751))

(assert (=> b!191682 d!56305))

(declare-fun d!56307 () Bool)

(assert (=> d!56307 (= (apply!182 lt!95238 lt!95232) (get!2214 (getValueByKey!239 (toList!1240 lt!95238) lt!95232)))))

(declare-fun bs!7683 () Bool)

(assert (= bs!7683 d!56307))

(declare-fun m!218753 () Bool)

(assert (=> bs!7683 m!218753))

(assert (=> bs!7683 m!218753))

(declare-fun m!218755 () Bool)

(assert (=> bs!7683 m!218755))

(assert (=> b!191682 d!56307))

(declare-fun d!56309 () Bool)

(declare-fun e!126360 () Bool)

(assert (=> d!56309 e!126360))

(declare-fun res!90741 () Bool)

(assert (=> d!56309 (=> (not res!90741) (not e!126360))))

(declare-fun lt!95427 () ListLongMap!2449)

(assert (=> d!56309 (= res!90741 (contains!1354 lt!95427 (_1!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))))))

(declare-fun lt!95425 () List!2425)

(assert (=> d!56309 (= lt!95427 (ListLongMap!2450 lt!95425))))

(declare-fun lt!95426 () Unit!5793)

(declare-fun lt!95428 () Unit!5793)

(assert (=> d!56309 (= lt!95426 lt!95428)))

(assert (=> d!56309 (= (getValueByKey!239 lt!95425 (_1!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56309 (= lt!95428 (lemmaContainsTupThenGetReturnValue!126 lt!95425 (_1!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56309 (= lt!95425 (insertStrictlySorted!129 (toList!1240 lt!95226) (_1!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) (_2!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))))))

(assert (=> d!56309 (= (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) lt!95427)))

(declare-fun b!192043 () Bool)

(declare-fun res!90740 () Bool)

(assert (=> b!192043 (=> (not res!90740) (not e!126360))))

(assert (=> b!192043 (= res!90740 (= (getValueByKey!239 (toList!1240 lt!95427) (_1!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) (Some!244 (_2!1777 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))))))))

(declare-fun b!192044 () Bool)

(assert (=> b!192044 (= e!126360 (contains!1356 (toList!1240 lt!95427) (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))))))

(assert (= (and d!56309 res!90741) b!192043))

(assert (= (and b!192043 res!90740) b!192044))

(declare-fun m!218757 () Bool)

(assert (=> d!56309 m!218757))

(declare-fun m!218759 () Bool)

(assert (=> d!56309 m!218759))

(declare-fun m!218761 () Bool)

(assert (=> d!56309 m!218761))

(declare-fun m!218763 () Bool)

(assert (=> d!56309 m!218763))

(declare-fun m!218765 () Bool)

(assert (=> b!192043 m!218765))

(declare-fun m!218767 () Bool)

(assert (=> b!192044 m!218767))

(assert (=> b!191682 d!56309))

(declare-fun d!56311 () Bool)

(assert (=> d!56311 (= (apply!182 (+!308 lt!95227 (tuple2!3533 lt!95221 (minValue!3751 thiss!1248))) lt!95224) (apply!182 lt!95227 lt!95224))))

(declare-fun lt!95429 () Unit!5793)

(assert (=> d!56311 (= lt!95429 (choose!1041 lt!95227 lt!95221 (minValue!3751 thiss!1248) lt!95224))))

(declare-fun e!126361 () Bool)

(assert (=> d!56311 e!126361))

(declare-fun res!90742 () Bool)

(assert (=> d!56311 (=> (not res!90742) (not e!126361))))

(assert (=> d!56311 (= res!90742 (contains!1354 lt!95227 lt!95224))))

(assert (=> d!56311 (= (addApplyDifferent!158 lt!95227 lt!95221 (minValue!3751 thiss!1248) lt!95224) lt!95429)))

(declare-fun b!192045 () Bool)

(assert (=> b!192045 (= e!126361 (not (= lt!95224 lt!95221)))))

(assert (= (and d!56311 res!90742) b!192045))

(assert (=> d!56311 m!218291))

(assert (=> d!56311 m!218295))

(assert (=> d!56311 m!218295))

(assert (=> d!56311 m!218297))

(declare-fun m!218769 () Bool)

(assert (=> d!56311 m!218769))

(declare-fun m!218771 () Bool)

(assert (=> d!56311 m!218771))

(assert (=> b!191682 d!56311))

(declare-fun d!56313 () Bool)

(assert (=> d!56313 (= (apply!182 lt!95236 lt!95228) (get!2214 (getValueByKey!239 (toList!1240 lt!95236) lt!95228)))))

(declare-fun bs!7684 () Bool)

(assert (= bs!7684 d!56313))

(declare-fun m!218773 () Bool)

(assert (=> bs!7684 m!218773))

(assert (=> bs!7684 m!218773))

(declare-fun m!218775 () Bool)

(assert (=> bs!7684 m!218775))

(assert (=> b!191682 d!56313))

(declare-fun d!56315 () Bool)

(assert (=> d!56315 (= (apply!182 (+!308 lt!95236 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248))) lt!95228) (get!2214 (getValueByKey!239 (toList!1240 (+!308 lt!95236 (tuple2!3533 lt!95225 (zeroValue!3751 thiss!1248)))) lt!95228)))))

(declare-fun bs!7685 () Bool)

(assert (= bs!7685 d!56315))

(declare-fun m!218777 () Bool)

(assert (=> bs!7685 m!218777))

(assert (=> bs!7685 m!218777))

(declare-fun m!218779 () Bool)

(assert (=> bs!7685 m!218779))

(assert (=> b!191682 d!56315))

(declare-fun d!56317 () Bool)

(declare-fun e!126363 () Bool)

(assert (=> d!56317 e!126363))

(declare-fun res!90743 () Bool)

(assert (=> d!56317 (=> res!90743 e!126363)))

(declare-fun lt!95431 () Bool)

(assert (=> d!56317 (= res!90743 (not lt!95431))))

(declare-fun lt!95432 () Bool)

(assert (=> d!56317 (= lt!95431 lt!95432)))

(declare-fun lt!95433 () Unit!5793)

(declare-fun e!126362 () Unit!5793)

(assert (=> d!56317 (= lt!95433 e!126362)))

(declare-fun c!34611 () Bool)

(assert (=> d!56317 (= c!34611 lt!95432)))

(assert (=> d!56317 (= lt!95432 (containsKey!243 (toList!1240 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) lt!95229))))

(assert (=> d!56317 (= (contains!1354 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248))) lt!95229) lt!95431)))

(declare-fun b!192046 () Bool)

(declare-fun lt!95430 () Unit!5793)

(assert (=> b!192046 (= e!126362 lt!95430)))

(assert (=> b!192046 (= lt!95430 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) lt!95229))))

(assert (=> b!192046 (isDefined!192 (getValueByKey!239 (toList!1240 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) lt!95229))))

(declare-fun b!192047 () Bool)

(declare-fun Unit!5808 () Unit!5793)

(assert (=> b!192047 (= e!126362 Unit!5808)))

(declare-fun b!192048 () Bool)

(assert (=> b!192048 (= e!126363 (isDefined!192 (getValueByKey!239 (toList!1240 (+!308 lt!95226 (tuple2!3533 lt!95219 (zeroValue!3751 thiss!1248)))) lt!95229)))))

(assert (= (and d!56317 c!34611) b!192046))

(assert (= (and d!56317 (not c!34611)) b!192047))

(assert (= (and d!56317 (not res!90743)) b!192048))

(declare-fun m!218781 () Bool)

(assert (=> d!56317 m!218781))

(declare-fun m!218783 () Bool)

(assert (=> b!192046 m!218783))

(declare-fun m!218785 () Bool)

(assert (=> b!192046 m!218785))

(assert (=> b!192046 m!218785))

(declare-fun m!218787 () Bool)

(assert (=> b!192046 m!218787))

(assert (=> b!192048 m!218785))

(assert (=> b!192048 m!218785))

(assert (=> b!192048 m!218787))

(assert (=> b!191682 d!56317))

(assert (=> b!191683 d!56183))

(assert (=> bm!19340 d!56223))

(declare-fun d!56319 () Bool)

(assert (=> d!56319 (= (inRange!0 (ite c!34516 (index!4886 lt!95255) (index!4889 lt!95255)) (mask!9131 thiss!1248)) (and (bvsge (ite c!34516 (index!4886 lt!95255) (index!4889 lt!95255)) #b00000000000000000000000000000000) (bvslt (ite c!34516 (index!4886 lt!95255) (index!4889 lt!95255)) (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19358 d!56319))

(declare-fun d!56321 () Bool)

(declare-fun e!126365 () Bool)

(assert (=> d!56321 e!126365))

(declare-fun res!90744 () Bool)

(assert (=> d!56321 (=> res!90744 e!126365)))

(declare-fun lt!95435 () Bool)

(assert (=> d!56321 (= res!90744 (not lt!95435))))

(declare-fun lt!95436 () Bool)

(assert (=> d!56321 (= lt!95435 lt!95436)))

(declare-fun lt!95437 () Unit!5793)

(declare-fun e!126364 () Unit!5793)

(assert (=> d!56321 (= lt!95437 e!126364)))

(declare-fun c!34612 () Bool)

(assert (=> d!56321 (= c!34612 lt!95436)))

(assert (=> d!56321 (= lt!95436 (containsKey!243 (toList!1240 lt!95234) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56321 (= (contains!1354 lt!95234 (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)) lt!95435)))

(declare-fun b!192049 () Bool)

(declare-fun lt!95434 () Unit!5793)

(assert (=> b!192049 (= e!126364 lt!95434)))

(assert (=> b!192049 (= lt!95434 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95234) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192049 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192050 () Bool)

(declare-fun Unit!5809 () Unit!5793)

(assert (=> b!192050 (= e!126364 Unit!5809)))

(declare-fun b!192051 () Bool)

(assert (=> b!192051 (= e!126365 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56321 c!34612) b!192049))

(assert (= (and d!56321 (not c!34612)) b!192050))

(assert (= (and d!56321 (not res!90744)) b!192051))

(assert (=> d!56321 m!218209))

(declare-fun m!218789 () Bool)

(assert (=> d!56321 m!218789))

(assert (=> b!192049 m!218209))

(declare-fun m!218791 () Bool)

(assert (=> b!192049 m!218791))

(assert (=> b!192049 m!218209))

(assert (=> b!192049 m!218567))

(assert (=> b!192049 m!218567))

(declare-fun m!218793 () Bool)

(assert (=> b!192049 m!218793))

(assert (=> b!192051 m!218209))

(assert (=> b!192051 m!218567))

(assert (=> b!192051 m!218567))

(assert (=> b!192051 m!218793))

(assert (=> b!191684 d!56321))

(declare-fun d!56323 () Bool)

(declare-fun res!90749 () Bool)

(declare-fun e!126370 () Bool)

(assert (=> d!56323 (=> res!90749 e!126370)))

(assert (=> d!56323 (= res!90749 (= (select (arr!3839 (_keys!5888 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56323 (= (arrayContainsKey!0 (_keys!5888 thiss!1248) key!828 #b00000000000000000000000000000000) e!126370)))

(declare-fun b!192056 () Bool)

(declare-fun e!126371 () Bool)

(assert (=> b!192056 (= e!126370 e!126371)))

(declare-fun res!90750 () Bool)

(assert (=> b!192056 (=> (not res!90750) (not e!126371))))

(assert (=> b!192056 (= res!90750 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4161 (_keys!5888 thiss!1248))))))

(declare-fun b!192057 () Bool)

(assert (=> b!192057 (= e!126371 (arrayContainsKey!0 (_keys!5888 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56323 (not res!90749)) b!192056))

(assert (= (and b!192056 res!90750) b!192057))

(assert (=> d!56323 m!218209))

(declare-fun m!218795 () Bool)

(assert (=> b!192057 m!218795))

(assert (=> bm!19359 d!56323))

(declare-fun d!56325 () Bool)

(declare-fun e!126373 () Bool)

(assert (=> d!56325 e!126373))

(declare-fun res!90751 () Bool)

(assert (=> d!56325 (=> res!90751 e!126373)))

(declare-fun lt!95439 () Bool)

(assert (=> d!56325 (= res!90751 (not lt!95439))))

(declare-fun lt!95440 () Bool)

(assert (=> d!56325 (= lt!95439 lt!95440)))

(declare-fun lt!95441 () Unit!5793)

(declare-fun e!126372 () Unit!5793)

(assert (=> d!56325 (= lt!95441 e!126372)))

(declare-fun c!34613 () Bool)

(assert (=> d!56325 (= c!34613 lt!95440)))

(assert (=> d!56325 (= lt!95440 (containsKey!243 (toList!1240 lt!95234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56325 (= (contains!1354 lt!95234 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95439)))

(declare-fun b!192058 () Bool)

(declare-fun lt!95438 () Unit!5793)

(assert (=> b!192058 (= e!126372 lt!95438)))

(assert (=> b!192058 (= lt!95438 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1240 lt!95234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192058 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192059 () Bool)

(declare-fun Unit!5810 () Unit!5793)

(assert (=> b!192059 (= e!126372 Unit!5810)))

(declare-fun b!192060 () Bool)

(assert (=> b!192060 (= e!126373 (isDefined!192 (getValueByKey!239 (toList!1240 lt!95234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56325 c!34613) b!192058))

(assert (= (and d!56325 (not c!34613)) b!192059))

(assert (= (and d!56325 (not res!90751)) b!192060))

(declare-fun m!218797 () Bool)

(assert (=> d!56325 m!218797))

(declare-fun m!218799 () Bool)

(assert (=> b!192058 m!218799))

(assert (=> b!192058 m!218589))

(assert (=> b!192058 m!218589))

(declare-fun m!218801 () Bool)

(assert (=> b!192058 m!218801))

(assert (=> b!192060 m!218589))

(assert (=> b!192060 m!218589))

(assert (=> b!192060 m!218801))

(assert (=> bm!19351 d!56325))

(declare-fun d!56327 () Bool)

(assert (=> d!56327 (= (inRange!0 (index!4887 lt!95135) (mask!9131 thiss!1248)) (and (bvsge (index!4887 lt!95135) #b00000000000000000000000000000000) (bvslt (index!4887 lt!95135) (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191595 d!56327))

(declare-fun b!192069 () Bool)

(declare-fun res!90763 () Bool)

(declare-fun e!126376 () Bool)

(assert (=> b!192069 (=> (not res!90763) (not e!126376))))

(assert (=> b!192069 (= res!90763 (and (= (size!4162 (_values!3893 thiss!1248)) (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001)) (= (size!4161 (_keys!5888 thiss!1248)) (size!4162 (_values!3893 thiss!1248))) (bvsge (_size!1387 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1387 thiss!1248) (bvadd (mask!9131 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!192070 () Bool)

(declare-fun res!90762 () Bool)

(assert (=> b!192070 (=> (not res!90762) (not e!126376))))

(declare-fun size!4165 (LongMapFixedSize!2676) (_ BitVec 32))

(assert (=> b!192070 (= res!90762 (bvsge (size!4165 thiss!1248) (_size!1387 thiss!1248)))))

(declare-fun b!192072 () Bool)

(assert (=> b!192072 (= e!126376 (and (bvsge (extraKeys!3647 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3647 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1387 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!192071 () Bool)

(declare-fun res!90760 () Bool)

(assert (=> b!192071 (=> (not res!90760) (not e!126376))))

(assert (=> b!192071 (= res!90760 (= (size!4165 thiss!1248) (bvadd (_size!1387 thiss!1248) (bvsdiv (bvadd (extraKeys!3647 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!56329 () Bool)

(declare-fun res!90761 () Bool)

(assert (=> d!56329 (=> (not res!90761) (not e!126376))))

(assert (=> d!56329 (= res!90761 (validMask!0 (mask!9131 thiss!1248)))))

(assert (=> d!56329 (= (simpleValid!198 thiss!1248) e!126376)))

(assert (= (and d!56329 res!90761) b!192069))

(assert (= (and b!192069 res!90763) b!192070))

(assert (= (and b!192070 res!90762) b!192071))

(assert (= (and b!192071 res!90760) b!192072))

(declare-fun m!218803 () Bool)

(assert (=> b!192070 m!218803))

(assert (=> b!192071 m!218803))

(assert (=> d!56329 m!218137))

(assert (=> d!56155 d!56329))

(declare-fun b!192073 () Bool)

(declare-fun e!126377 () Bool)

(assert (=> b!192073 (= e!126377 tp_is_empty!4455)))

(declare-fun mapNonEmpty!7702 () Bool)

(declare-fun mapRes!7702 () Bool)

(declare-fun tp!16909 () Bool)

(assert (=> mapNonEmpty!7702 (= mapRes!7702 (and tp!16909 e!126377))))

(declare-fun mapRest!7702 () (Array (_ BitVec 32) ValueCell!1884))

(declare-fun mapValue!7702 () ValueCell!1884)

(declare-fun mapKey!7702 () (_ BitVec 32))

(assert (=> mapNonEmpty!7702 (= mapRest!7701 (store mapRest!7702 mapKey!7702 mapValue!7702))))

(declare-fun condMapEmpty!7702 () Bool)

(declare-fun mapDefault!7702 () ValueCell!1884)

(assert (=> mapNonEmpty!7701 (= condMapEmpty!7702 (= mapRest!7701 ((as const (Array (_ BitVec 32) ValueCell!1884)) mapDefault!7702)))))

(declare-fun e!126378 () Bool)

(assert (=> mapNonEmpty!7701 (= tp!16908 (and e!126378 mapRes!7702))))

(declare-fun b!192074 () Bool)

(assert (=> b!192074 (= e!126378 tp_is_empty!4455)))

(declare-fun mapIsEmpty!7702 () Bool)

(assert (=> mapIsEmpty!7702 mapRes!7702))

(assert (= (and mapNonEmpty!7701 condMapEmpty!7702) mapIsEmpty!7702))

(assert (= (and mapNonEmpty!7701 (not condMapEmpty!7702)) mapNonEmpty!7702))

(assert (= (and mapNonEmpty!7702 ((_ is ValueCellFull!1884) mapValue!7702)) b!192073))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1884) mapDefault!7702)) b!192074))

(declare-fun m!218805 () Bool)

(assert (=> mapNonEmpty!7702 m!218805))

(declare-fun b_lambda!7415 () Bool)

(assert (= b_lambda!7407 (or (and b!191539 b_free!4683) b_lambda!7415)))

(declare-fun b_lambda!7417 () Bool)

(assert (= b_lambda!7411 (or (and b!191539 b_free!4683) b_lambda!7417)))

(declare-fun b_lambda!7419 () Bool)

(assert (= b_lambda!7413 (or (and b!191539 b_free!4683) b_lambda!7419)))

(declare-fun b_lambda!7421 () Bool)

(assert (= b_lambda!7409 (or (and b!191539 b_free!4683) b_lambda!7421)))

(check-sat (not d!56247) (not b!191769) (not d!56251) (not d!56271) (not b!191883) (not d!56229) (not d!56197) (not b!191901) (not b!191767) (not d!56325) (not d!56283) (not d!56263) (not d!56255) (not b!191897) (not b!191963) (not d!56189) (not b!191834) (not b!191819) (not b!191755) (not b_lambda!7421) (not bm!19381) (not d!56205) (not d!56301) (not d!56245) (not b!192046) (not d!56185) (not b!191877) (not b!191770) (not d!56241) (not d!56267) (not d!56257) (not b!192048) (not b!191864) (not d!56231) (not b!192040) (not d!56215) (not b!192058) (not d!56289) (not d!56203) (not b!191868) (not b!191933) (not b!191790) (not b!191894) (not b!191835) (not d!56181) (not b_next!4683) (not d!56315) (not d!56253) (not b!191869) (not d!56233) (not b!192038) (not b!192033) (not b!192057) (not b!191981) (not bm!19387) (not b!192039) (not d!56227) (not b!191940) (not b!192043) (not d!56223) (not b!191832) (not b!192002) (not d!56225) (not b!191778) (not d!56279) (not b!191928) (not b!191787) (not d!56275) (not b!191930) (not b!191867) b_and!11371 (not bm!19368) (not b!191884) (not b!192000) (not b!191961) (not mapNonEmpty!7702) (not b!191838) (not d!56309) (not d!56311) (not b!192042) (not b!191872) (not b!191874) (not b!191935) (not d!56239) (not b!191878) (not b!191980) (not b!192051) (not b_lambda!7405) (not b!191995) (not b!191785) (not d!56305) (not b!191885) (not d!56291) (not bm!19371) (not b!192003) tp_is_empty!4455 (not d!56329) (not d!56193) (not d!56307) (not d!56313) (not b!191837) (not b!191826) (not b!191865) (not b!191836) (not b!191926) (not b!191820) (not b!191879) (not d!56237) (not d!56321) (not b!191938) (not b!191891) (not d!56297) (not bm!19376) (not b!192060) (not d!56207) (not b!191870) (not b!192049) (not b!191784) (not d!56259) (not b!192031) (not d!56273) (not b!191899) (not d!56277) (not d!56235) (not b!191965) (not d!56201) (not b!191796) (not d!56295) (not b!191776) (not d!56209) (not b_lambda!7417) (not d!56299) (not d!56213) (not b!191797) (not b!191880) (not b!191950) (not b!191777) (not d!56217) (not b!191966) (not b!191934) (not b!192041) (not b!192037) (not d!56293) (not bm!19384) (not b!192070) (not b_lambda!7415) (not d!56303) (not d!56219) (not d!56317) (not b!191882) (not b_lambda!7419) (not b!192005) (not b!192071) (not d!56221) (not bm!19378) (not b!191890) (not b!192034) (not b!192044) (not b!191936) (not d!56211) (not d!56195) (not d!56287) (not b_lambda!7403) (not b!191931) (not bm!19377) (not b!191979))
(check-sat b_and!11371 (not b_next!4683))
