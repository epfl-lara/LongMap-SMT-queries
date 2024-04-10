; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19320 () Bool)

(assert start!19320)

(declare-fun b!190094 () Bool)

(declare-fun b_free!4665 () Bool)

(declare-fun b_next!4665 () Bool)

(assert (=> b!190094 (= b_free!4665 (not b_next!4665))))

(declare-fun tp!16834 () Bool)

(declare-fun b_and!11311 () Bool)

(assert (=> b!190094 (= tp!16834 b_and!11311)))

(declare-fun mapIsEmpty!7657 () Bool)

(declare-fun mapRes!7657 () Bool)

(assert (=> mapIsEmpty!7657 mapRes!7657))

(declare-fun b!190086 () Bool)

(declare-fun e!125113 () Bool)

(declare-fun e!125117 () Bool)

(assert (=> b!190086 (= e!125113 e!125117)))

(declare-fun res!89868 () Bool)

(assert (=> b!190086 (=> (not res!89868) (not e!125117))))

(declare-datatypes ((SeekEntryResult!672 0))(
  ( (MissingZero!672 (index!4858 (_ BitVec 32))) (Found!672 (index!4859 (_ BitVec 32))) (Intermediate!672 (undefined!1484 Bool) (index!4860 (_ BitVec 32)) (x!20474 (_ BitVec 32))) (Undefined!672) (MissingVacant!672 (index!4861 (_ BitVec 32))) )
))
(declare-fun lt!94184 () SeekEntryResult!672)

(get-info :version)

(assert (=> b!190086 (= res!89868 (and (not ((_ is Undefined!672) lt!94184)) (not ((_ is MissingVacant!672) lt!94184)) (not ((_ is MissingZero!672) lt!94184)) ((_ is Found!672) lt!94184)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5563 0))(
  ( (V!5564 (val!2263 Int)) )
))
(declare-datatypes ((ValueCell!1875 0))(
  ( (ValueCellFull!1875 (v!4190 V!5563)) (EmptyCell!1875) )
))
(declare-datatypes ((array!8107 0))(
  ( (array!8108 (arr!3821 (Array (_ BitVec 32) (_ BitVec 64))) (size!4141 (_ BitVec 32))) )
))
(declare-datatypes ((array!8109 0))(
  ( (array!8110 (arr!3822 (Array (_ BitVec 32) ValueCell!1875)) (size!4142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2658 0))(
  ( (LongMapFixedSize!2659 (defaultEntry!3881 Int) (mask!9079 (_ BitVec 32)) (extraKeys!3618 (_ BitVec 32)) (zeroValue!3722 V!5563) (minValue!3722 V!5563) (_size!1378 (_ BitVec 32)) (_keys!5850 array!8107) (_values!3864 array!8109) (_vacant!1378 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2658)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8107 (_ BitVec 32)) SeekEntryResult!672)

(assert (=> b!190086 (= lt!94184 (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun b!190087 () Bool)

(declare-fun e!125109 () Bool)

(assert (=> b!190087 (= e!125109 (= (size!4142 (_values!3864 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9079 thiss!1248))))))

(declare-fun b!190088 () Bool)

(declare-fun res!89870 () Bool)

(assert (=> b!190088 (=> (not res!89870) (not e!125113))))

(assert (=> b!190088 (= res!89870 (not (= key!828 (bvneg key!828))))))

(declare-fun b!190089 () Bool)

(declare-fun e!125110 () Bool)

(declare-fun e!125112 () Bool)

(assert (=> b!190089 (= e!125110 (and e!125112 mapRes!7657))))

(declare-fun condMapEmpty!7657 () Bool)

(declare-fun mapDefault!7657 () ValueCell!1875)

(assert (=> b!190089 (= condMapEmpty!7657 (= (arr!3822 (_values!3864 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1875)) mapDefault!7657)))))

(declare-fun b!190090 () Bool)

(declare-datatypes ((Unit!5743 0))(
  ( (Unit!5744) )
))
(declare-fun e!125114 () Unit!5743)

(declare-fun lt!94188 () Unit!5743)

(assert (=> b!190090 (= e!125114 lt!94188)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 64) Int) Unit!5743)

(assert (=> b!190090 (= lt!94188 (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)))))

(declare-fun res!89872 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190090 (= res!89872 (inRange!0 (index!4859 lt!94184) (mask!9079 thiss!1248)))))

(declare-fun e!125111 () Bool)

(assert (=> b!190090 (=> (not res!89872) (not e!125111))))

(assert (=> b!190090 e!125111))

(declare-fun b!190091 () Bool)

(assert (=> b!190091 (= e!125111 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4859 lt!94184)) key!828))))

(declare-fun res!89869 () Bool)

(assert (=> start!19320 (=> (not res!89869) (not e!125113))))

(declare-fun valid!1092 (LongMapFixedSize!2658) Bool)

(assert (=> start!19320 (= res!89869 (valid!1092 thiss!1248))))

(assert (=> start!19320 e!125113))

(declare-fun e!125116 () Bool)

(assert (=> start!19320 e!125116))

(assert (=> start!19320 true))

(declare-fun tp_is_empty!4437 () Bool)

(assert (=> start!19320 tp_is_empty!4437))

(declare-fun b!190092 () Bool)

(declare-fun e!125108 () Bool)

(assert (=> b!190092 (= e!125108 tp_is_empty!4437)))

(declare-fun b!190093 () Bool)

(assert (=> b!190093 (= e!125112 tp_is_empty!4437)))

(declare-fun array_inv!2477 (array!8107) Bool)

(declare-fun array_inv!2478 (array!8109) Bool)

(assert (=> b!190094 (= e!125116 (and tp!16834 tp_is_empty!4437 (array_inv!2477 (_keys!5850 thiss!1248)) (array_inv!2478 (_values!3864 thiss!1248)) e!125110))))

(declare-fun mapNonEmpty!7657 () Bool)

(declare-fun tp!16833 () Bool)

(assert (=> mapNonEmpty!7657 (= mapRes!7657 (and tp!16833 e!125108))))

(declare-fun mapValue!7657 () ValueCell!1875)

(declare-fun mapKey!7657 () (_ BitVec 32))

(declare-fun mapRest!7657 () (Array (_ BitVec 32) ValueCell!1875))

(assert (=> mapNonEmpty!7657 (= (arr!3822 (_values!3864 thiss!1248)) (store mapRest!7657 mapKey!7657 mapValue!7657))))

(declare-fun b!190095 () Bool)

(declare-fun Unit!5745 () Unit!5743)

(assert (=> b!190095 (= e!125114 Unit!5745)))

(declare-fun lt!94186 () Unit!5743)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!174 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 64) Int) Unit!5743)

(assert (=> b!190095 (= lt!94186 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!174 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)))))

(assert (=> b!190095 false))

(declare-fun b!190096 () Bool)

(assert (=> b!190096 (= e!125117 (not e!125109))))

(declare-fun res!89871 () Bool)

(assert (=> b!190096 (=> res!89871 e!125109)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190096 (= res!89871 (not (validMask!0 (mask!9079 thiss!1248))))))

(declare-datatypes ((tuple2!3518 0))(
  ( (tuple2!3519 (_1!1770 (_ BitVec 64)) (_2!1770 V!5563)) )
))
(declare-datatypes ((List!2415 0))(
  ( (Nil!2412) (Cons!2411 (h!3048 tuple2!3518) (t!7323 List!2415)) )
))
(declare-datatypes ((ListLongMap!2435 0))(
  ( (ListLongMap!2436 (toList!1233 List!2415)) )
))
(declare-fun lt!94189 () ListLongMap!2435)

(declare-fun v!309 () V!5563)

(declare-fun +!301 (ListLongMap!2435 tuple2!3518) ListLongMap!2435)

(declare-fun getCurrentListMap!881 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 32) Int) ListLongMap!2435)

(assert (=> b!190096 (= (+!301 lt!94189 (tuple2!3519 key!828 v!309)) (getCurrentListMap!881 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94185 () Unit!5743)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 32) (_ BitVec 64) V!5563 Int) Unit!5743)

(assert (=> b!190096 (= lt!94185 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (index!4859 lt!94184) key!828 v!309 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94187 () Unit!5743)

(assert (=> b!190096 (= lt!94187 e!125114)))

(declare-fun c!34154 () Bool)

(declare-fun contains!1342 (ListLongMap!2435 (_ BitVec 64)) Bool)

(assert (=> b!190096 (= c!34154 (contains!1342 lt!94189 key!828))))

(assert (=> b!190096 (= lt!94189 (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(assert (= (and start!19320 res!89869) b!190088))

(assert (= (and b!190088 res!89870) b!190086))

(assert (= (and b!190086 res!89868) b!190096))

(assert (= (and b!190096 c!34154) b!190090))

(assert (= (and b!190096 (not c!34154)) b!190095))

(assert (= (and b!190090 res!89872) b!190091))

(assert (= (and b!190096 (not res!89871)) b!190087))

(assert (= (and b!190089 condMapEmpty!7657) mapIsEmpty!7657))

(assert (= (and b!190089 (not condMapEmpty!7657)) mapNonEmpty!7657))

(assert (= (and mapNonEmpty!7657 ((_ is ValueCellFull!1875) mapValue!7657)) b!190092))

(assert (= (and b!190089 ((_ is ValueCellFull!1875) mapDefault!7657)) b!190093))

(assert (= b!190094 b!190089))

(assert (= start!19320 b!190094))

(declare-fun m!216409 () Bool)

(assert (=> start!19320 m!216409))

(declare-fun m!216411 () Bool)

(assert (=> b!190095 m!216411))

(declare-fun m!216413 () Bool)

(assert (=> b!190090 m!216413))

(declare-fun m!216415 () Bool)

(assert (=> b!190090 m!216415))

(declare-fun m!216417 () Bool)

(assert (=> b!190091 m!216417))

(declare-fun m!216419 () Bool)

(assert (=> b!190086 m!216419))

(declare-fun m!216421 () Bool)

(assert (=> b!190094 m!216421))

(declare-fun m!216423 () Bool)

(assert (=> b!190094 m!216423))

(declare-fun m!216425 () Bool)

(assert (=> b!190096 m!216425))

(declare-fun m!216427 () Bool)

(assert (=> b!190096 m!216427))

(declare-fun m!216429 () Bool)

(assert (=> b!190096 m!216429))

(declare-fun m!216431 () Bool)

(assert (=> b!190096 m!216431))

(declare-fun m!216433 () Bool)

(assert (=> b!190096 m!216433))

(declare-fun m!216435 () Bool)

(assert (=> b!190096 m!216435))

(declare-fun m!216437 () Bool)

(assert (=> b!190096 m!216437))

(declare-fun m!216439 () Bool)

(assert (=> mapNonEmpty!7657 m!216439))

(check-sat (not b_next!4665) (not b!190096) (not b!190095) (not b!190090) (not b!190094) (not start!19320) b_and!11311 (not b!190086) (not mapNonEmpty!7657) tp_is_empty!4437)
(check-sat b_and!11311 (not b_next!4665))
(get-model)

(declare-fun b!190146 () Bool)

(declare-fun lt!94212 () SeekEntryResult!672)

(assert (=> b!190146 (and (bvsge (index!4858 lt!94212) #b00000000000000000000000000000000) (bvslt (index!4858 lt!94212) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun res!89899 () Bool)

(assert (=> b!190146 (= res!89899 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4858 lt!94212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125158 () Bool)

(assert (=> b!190146 (=> (not res!89899) (not e!125158))))

(declare-fun b!190147 () Bool)

(declare-fun e!125159 () Bool)

(declare-fun e!125157 () Bool)

(assert (=> b!190147 (= e!125159 e!125157)))

(declare-fun c!34162 () Bool)

(assert (=> b!190147 (= c!34162 ((_ is MissingVacant!672) lt!94212))))

(declare-fun c!34163 () Bool)

(declare-fun call!19175 () Bool)

(declare-fun bm!19172 () Bool)

(assert (=> bm!19172 (= call!19175 (inRange!0 (ite c!34163 (index!4858 lt!94212) (index!4861 lt!94212)) (mask!9079 thiss!1248)))))

(declare-fun bm!19173 () Bool)

(declare-fun call!19176 () Bool)

(declare-fun arrayContainsKey!0 (array!8107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19173 (= call!19176 (arrayContainsKey!0 (_keys!5850 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!190148 () Bool)

(assert (=> b!190148 (= e!125157 ((_ is Undefined!672) lt!94212))))

(declare-fun b!190149 () Bool)

(declare-fun e!125156 () Bool)

(assert (=> b!190149 (= e!125156 (not call!19176))))

(declare-fun b!190150 () Bool)

(assert (=> b!190150 (= e!125159 e!125158)))

(declare-fun res!89897 () Bool)

(assert (=> b!190150 (= res!89897 call!19175)))

(assert (=> b!190150 (=> (not res!89897) (not e!125158))))

(declare-fun d!55771 () Bool)

(assert (=> d!55771 e!125159))

(assert (=> d!55771 (= c!34163 ((_ is MissingZero!672) lt!94212))))

(assert (=> d!55771 (= lt!94212 (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun lt!94213 () Unit!5743)

(declare-fun choose!1020 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 64) Int) Unit!5743)

(assert (=> d!55771 (= lt!94213 (choose!1020 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)))))

(assert (=> d!55771 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55771 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!174 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)) lt!94213)))

(declare-fun b!190151 () Bool)

(declare-fun res!89896 () Bool)

(assert (=> b!190151 (=> (not res!89896) (not e!125156))))

(assert (=> b!190151 (= res!89896 call!19175)))

(assert (=> b!190151 (= e!125157 e!125156)))

(declare-fun b!190152 () Bool)

(assert (=> b!190152 (= e!125158 (not call!19176))))

(declare-fun b!190153 () Bool)

(declare-fun res!89898 () Bool)

(assert (=> b!190153 (=> (not res!89898) (not e!125156))))

(assert (=> b!190153 (= res!89898 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4861 lt!94212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190153 (and (bvsge (index!4861 lt!94212) #b00000000000000000000000000000000) (bvslt (index!4861 lt!94212) (size!4141 (_keys!5850 thiss!1248))))))

(assert (= (and d!55771 c!34163) b!190150))

(assert (= (and d!55771 (not c!34163)) b!190147))

(assert (= (and b!190150 res!89897) b!190146))

(assert (= (and b!190146 res!89899) b!190152))

(assert (= (and b!190147 c!34162) b!190151))

(assert (= (and b!190147 (not c!34162)) b!190148))

(assert (= (and b!190151 res!89896) b!190153))

(assert (= (and b!190153 res!89898) b!190149))

(assert (= (or b!190150 b!190151) bm!19172))

(assert (= (or b!190152 b!190149) bm!19173))

(declare-fun m!216473 () Bool)

(assert (=> b!190153 m!216473))

(declare-fun m!216475 () Bool)

(assert (=> b!190146 m!216475))

(declare-fun m!216477 () Bool)

(assert (=> bm!19172 m!216477))

(declare-fun m!216479 () Bool)

(assert (=> bm!19173 m!216479))

(assert (=> d!55771 m!216419))

(declare-fun m!216481 () Bool)

(assert (=> d!55771 m!216481))

(assert (=> d!55771 m!216437))

(assert (=> b!190095 d!55771))

(declare-fun d!55773 () Bool)

(declare-fun e!125162 () Bool)

(assert (=> d!55773 e!125162))

(declare-fun res!89905 () Bool)

(assert (=> d!55773 (=> (not res!89905) (not e!125162))))

(declare-fun lt!94219 () SeekEntryResult!672)

(assert (=> d!55773 (= res!89905 ((_ is Found!672) lt!94219))))

(assert (=> d!55773 (= lt!94219 (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun lt!94218 () Unit!5743)

(declare-fun choose!1021 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 64) Int) Unit!5743)

(assert (=> d!55773 (= lt!94218 (choose!1021 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)))))

(assert (=> d!55773 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55773 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!170 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)) lt!94218)))

(declare-fun b!190158 () Bool)

(declare-fun res!89904 () Bool)

(assert (=> b!190158 (=> (not res!89904) (not e!125162))))

(assert (=> b!190158 (= res!89904 (inRange!0 (index!4859 lt!94219) (mask!9079 thiss!1248)))))

(declare-fun b!190159 () Bool)

(assert (=> b!190159 (= e!125162 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4859 lt!94219)) key!828))))

(assert (=> b!190159 (and (bvsge (index!4859 lt!94219) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94219) (size!4141 (_keys!5850 thiss!1248))))))

(assert (= (and d!55773 res!89905) b!190158))

(assert (= (and b!190158 res!89904) b!190159))

(assert (=> d!55773 m!216419))

(declare-fun m!216483 () Bool)

(assert (=> d!55773 m!216483))

(assert (=> d!55773 m!216437))

(declare-fun m!216485 () Bool)

(assert (=> b!190158 m!216485))

(declare-fun m!216487 () Bool)

(assert (=> b!190159 m!216487))

(assert (=> b!190090 d!55773))

(declare-fun d!55775 () Bool)

(assert (=> d!55775 (= (inRange!0 (index!4859 lt!94184) (mask!9079 thiss!1248)) (and (bvsge (index!4859 lt!94184) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94184) (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190090 d!55775))

(declare-fun b!190173 () Bool)

(declare-fun e!125171 () SeekEntryResult!672)

(assert (=> b!190173 (= e!125171 Undefined!672)))

(declare-fun b!190174 () Bool)

(declare-fun e!125169 () SeekEntryResult!672)

(declare-fun lt!94227 () SeekEntryResult!672)

(assert (=> b!190174 (= e!125169 (MissingZero!672 (index!4860 lt!94227)))))

(declare-fun b!190175 () Bool)

(declare-fun e!125170 () SeekEntryResult!672)

(assert (=> b!190175 (= e!125170 (Found!672 (index!4860 lt!94227)))))

(declare-fun b!190176 () Bool)

(declare-fun c!34171 () Bool)

(declare-fun lt!94226 () (_ BitVec 64))

(assert (=> b!190176 (= c!34171 (= lt!94226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190176 (= e!125170 e!125169)))

(declare-fun b!190177 () Bool)

(assert (=> b!190177 (= e!125171 e!125170)))

(assert (=> b!190177 (= lt!94226 (select (arr!3821 (_keys!5850 thiss!1248)) (index!4860 lt!94227)))))

(declare-fun c!34170 () Bool)

(assert (=> b!190177 (= c!34170 (= lt!94226 key!828))))

(declare-fun d!55777 () Bool)

(declare-fun lt!94228 () SeekEntryResult!672)

(assert (=> d!55777 (and (or ((_ is Undefined!672) lt!94228) (not ((_ is Found!672) lt!94228)) (and (bvsge (index!4859 lt!94228) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94228) (size!4141 (_keys!5850 thiss!1248))))) (or ((_ is Undefined!672) lt!94228) ((_ is Found!672) lt!94228) (not ((_ is MissingZero!672) lt!94228)) (and (bvsge (index!4858 lt!94228) #b00000000000000000000000000000000) (bvslt (index!4858 lt!94228) (size!4141 (_keys!5850 thiss!1248))))) (or ((_ is Undefined!672) lt!94228) ((_ is Found!672) lt!94228) ((_ is MissingZero!672) lt!94228) (not ((_ is MissingVacant!672) lt!94228)) (and (bvsge (index!4861 lt!94228) #b00000000000000000000000000000000) (bvslt (index!4861 lt!94228) (size!4141 (_keys!5850 thiss!1248))))) (or ((_ is Undefined!672) lt!94228) (ite ((_ is Found!672) lt!94228) (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4859 lt!94228)) key!828) (ite ((_ is MissingZero!672) lt!94228) (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4858 lt!94228)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!672) lt!94228) (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4861 lt!94228)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55777 (= lt!94228 e!125171)))

(declare-fun c!34172 () Bool)

(assert (=> d!55777 (= c!34172 (and ((_ is Intermediate!672) lt!94227) (undefined!1484 lt!94227)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8107 (_ BitVec 32)) SeekEntryResult!672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55777 (= lt!94227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9079 thiss!1248)) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(assert (=> d!55777 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55777 (= (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)) lt!94228)))

(declare-fun b!190172 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8107 (_ BitVec 32)) SeekEntryResult!672)

(assert (=> b!190172 (= e!125169 (seekKeyOrZeroReturnVacant!0 (x!20474 lt!94227) (index!4860 lt!94227) (index!4860 lt!94227) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(assert (= (and d!55777 c!34172) b!190173))

(assert (= (and d!55777 (not c!34172)) b!190177))

(assert (= (and b!190177 c!34170) b!190175))

(assert (= (and b!190177 (not c!34170)) b!190176))

(assert (= (and b!190176 c!34171) b!190174))

(assert (= (and b!190176 (not c!34171)) b!190172))

(declare-fun m!216489 () Bool)

(assert (=> b!190177 m!216489))

(declare-fun m!216491 () Bool)

(assert (=> d!55777 m!216491))

(assert (=> d!55777 m!216437))

(declare-fun m!216493 () Bool)

(assert (=> d!55777 m!216493))

(declare-fun m!216495 () Bool)

(assert (=> d!55777 m!216495))

(declare-fun m!216497 () Bool)

(assert (=> d!55777 m!216497))

(declare-fun m!216499 () Bool)

(assert (=> d!55777 m!216499))

(assert (=> d!55777 m!216497))

(declare-fun m!216501 () Bool)

(assert (=> b!190172 m!216501))

(assert (=> b!190086 d!55777))

(declare-fun b!190220 () Bool)

(declare-fun e!125205 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!190220 (= e!125205 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190221 () Bool)

(declare-fun e!125201 () Bool)

(declare-fun e!125204 () Bool)

(assert (=> b!190221 (= e!125201 e!125204)))

(declare-fun c!34188 () Bool)

(assert (=> b!190221 (= c!34188 (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190222 () Bool)

(declare-fun res!89927 () Bool)

(assert (=> b!190222 (=> (not res!89927) (not e!125201))))

(declare-fun e!125200 () Bool)

(assert (=> b!190222 (= res!89927 e!125200)))

(declare-fun res!89929 () Bool)

(assert (=> b!190222 (=> res!89929 e!125200)))

(declare-fun e!125202 () Bool)

(assert (=> b!190222 (= res!89929 (not e!125202))))

(declare-fun res!89928 () Bool)

(assert (=> b!190222 (=> (not res!89928) (not e!125202))))

(assert (=> b!190222 (= res!89928 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun bm!19188 () Bool)

(declare-fun call!19196 () ListLongMap!2435)

(declare-fun call!19194 () ListLongMap!2435)

(assert (=> bm!19188 (= call!19196 call!19194)))

(declare-fun b!190224 () Bool)

(declare-fun c!34190 () Bool)

(assert (=> b!190224 (= c!34190 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125198 () ListLongMap!2435)

(declare-fun e!125210 () ListLongMap!2435)

(assert (=> b!190224 (= e!125198 e!125210)))

(declare-fun c!34185 () Bool)

(declare-fun call!19192 () ListLongMap!2435)

(declare-fun call!19195 () ListLongMap!2435)

(declare-fun bm!19189 () Bool)

(declare-fun c!34189 () Bool)

(declare-fun call!19197 () ListLongMap!2435)

(assert (=> bm!19189 (= call!19194 (+!301 (ite c!34185 call!19197 (ite c!34189 call!19192 call!19195)) (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(declare-fun bm!19190 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!212 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 32) Int) ListLongMap!2435)

(assert (=> bm!19190 (= call!19197 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun b!190225 () Bool)

(declare-fun e!125199 () ListLongMap!2435)

(assert (=> b!190225 (= e!125199 e!125198)))

(assert (=> b!190225 (= c!34189 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190226 () Bool)

(assert (=> b!190226 (= e!125210 call!19196)))

(declare-fun bm!19191 () Bool)

(assert (=> bm!19191 (= call!19195 call!19192)))

(declare-fun b!190227 () Bool)

(declare-fun e!125206 () Unit!5743)

(declare-fun Unit!5749 () Unit!5743)

(assert (=> b!190227 (= e!125206 Unit!5749)))

(declare-fun b!190228 () Bool)

(declare-fun res!89930 () Bool)

(assert (=> b!190228 (=> (not res!89930) (not e!125201))))

(declare-fun e!125207 () Bool)

(assert (=> b!190228 (= res!89930 e!125207)))

(declare-fun c!34186 () Bool)

(assert (=> b!190228 (= c!34186 (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190229 () Bool)

(assert (=> b!190229 (= e!125199 (+!301 call!19194 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))

(declare-fun b!190230 () Bool)

(declare-fun call!19193 () Bool)

(assert (=> b!190230 (= e!125207 (not call!19193))))

(declare-fun b!190231 () Bool)

(assert (=> b!190231 (= e!125202 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190223 () Bool)

(declare-fun lt!94278 () Unit!5743)

(assert (=> b!190223 (= e!125206 lt!94278)))

(declare-fun lt!94285 () ListLongMap!2435)

(assert (=> b!190223 (= lt!94285 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94288 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94287 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94287 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94286 () Unit!5743)

(declare-fun addStillContains!155 (ListLongMap!2435 (_ BitVec 64) V!5563 (_ BitVec 64)) Unit!5743)

(assert (=> b!190223 (= lt!94286 (addStillContains!155 lt!94285 lt!94288 (zeroValue!3722 thiss!1248) lt!94287))))

(assert (=> b!190223 (contains!1342 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) lt!94287)))

(declare-fun lt!94276 () Unit!5743)

(assert (=> b!190223 (= lt!94276 lt!94286)))

(declare-fun lt!94294 () ListLongMap!2435)

(assert (=> b!190223 (= lt!94294 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94293 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94293 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94277 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94277 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94280 () Unit!5743)

(declare-fun addApplyDifferent!155 (ListLongMap!2435 (_ BitVec 64) V!5563 (_ BitVec 64)) Unit!5743)

(assert (=> b!190223 (= lt!94280 (addApplyDifferent!155 lt!94294 lt!94293 (minValue!3722 thiss!1248) lt!94277))))

(declare-fun apply!179 (ListLongMap!2435 (_ BitVec 64)) V!5563)

(assert (=> b!190223 (= (apply!179 (+!301 lt!94294 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) lt!94277) (apply!179 lt!94294 lt!94277))))

(declare-fun lt!94283 () Unit!5743)

(assert (=> b!190223 (= lt!94283 lt!94280)))

(declare-fun lt!94281 () ListLongMap!2435)

(assert (=> b!190223 (= lt!94281 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94284 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94289 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94289 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94273 () Unit!5743)

(assert (=> b!190223 (= lt!94273 (addApplyDifferent!155 lt!94281 lt!94284 (zeroValue!3722 thiss!1248) lt!94289))))

(assert (=> b!190223 (= (apply!179 (+!301 lt!94281 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) lt!94289) (apply!179 lt!94281 lt!94289))))

(declare-fun lt!94275 () Unit!5743)

(assert (=> b!190223 (= lt!94275 lt!94273)))

(declare-fun lt!94279 () ListLongMap!2435)

(assert (=> b!190223 (= lt!94279 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94291 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94291 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94282 () (_ BitVec 64))

(assert (=> b!190223 (= lt!94282 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190223 (= lt!94278 (addApplyDifferent!155 lt!94279 lt!94291 (minValue!3722 thiss!1248) lt!94282))))

(assert (=> b!190223 (= (apply!179 (+!301 lt!94279 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) lt!94282) (apply!179 lt!94279 lt!94282))))

(declare-fun d!55779 () Bool)

(assert (=> d!55779 e!125201))

(declare-fun res!89926 () Bool)

(assert (=> d!55779 (=> (not res!89926) (not e!125201))))

(assert (=> d!55779 (= res!89926 (or (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))))

(declare-fun lt!94274 () ListLongMap!2435)

(declare-fun lt!94290 () ListLongMap!2435)

(assert (=> d!55779 (= lt!94274 lt!94290)))

(declare-fun lt!94292 () Unit!5743)

(assert (=> d!55779 (= lt!94292 e!125206)))

(declare-fun c!34187 () Bool)

(assert (=> d!55779 (= c!34187 e!125205)))

(declare-fun res!89924 () Bool)

(assert (=> d!55779 (=> (not res!89924) (not e!125205))))

(assert (=> d!55779 (= res!89924 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55779 (= lt!94290 e!125199)))

(assert (=> d!55779 (= c!34185 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55779 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55779 (= (getCurrentListMap!881 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) lt!94274)))

(declare-fun bm!19192 () Bool)

(assert (=> bm!19192 (= call!19193 (contains!1342 lt!94274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19193 () Bool)

(assert (=> bm!19193 (= call!19192 call!19197)))

(declare-fun b!190232 () Bool)

(assert (=> b!190232 (= e!125198 call!19196)))

(declare-fun b!190233 () Bool)

(assert (=> b!190233 (= e!125210 call!19195)))

(declare-fun b!190234 () Bool)

(declare-fun e!125208 () Bool)

(assert (=> b!190234 (= e!125208 (= (apply!179 lt!94274 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3722 thiss!1248)))))

(declare-fun b!190235 () Bool)

(declare-fun e!125209 () Bool)

(assert (=> b!190235 (= e!125207 e!125209)))

(declare-fun res!89932 () Bool)

(assert (=> b!190235 (= res!89932 call!19193)))

(assert (=> b!190235 (=> (not res!89932) (not e!125209))))

(declare-fun b!190236 () Bool)

(assert (=> b!190236 (= e!125209 (= (apply!179 lt!94274 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3722 thiss!1248)))))

(declare-fun b!190237 () Bool)

(declare-fun e!125203 () Bool)

(assert (=> b!190237 (= e!125200 e!125203)))

(declare-fun res!89925 () Bool)

(assert (=> b!190237 (=> (not res!89925) (not e!125203))))

(assert (=> b!190237 (= res!89925 (contains!1342 lt!94274 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190238 () Bool)

(assert (=> b!190238 (= e!125204 e!125208)))

(declare-fun res!89931 () Bool)

(declare-fun call!19191 () Bool)

(assert (=> b!190238 (= res!89931 call!19191)))

(assert (=> b!190238 (=> (not res!89931) (not e!125208))))

(declare-fun bm!19194 () Bool)

(assert (=> bm!19194 (= call!19191 (contains!1342 lt!94274 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190239 () Bool)

(declare-fun get!2198 (ValueCell!1875 V!5563) V!5563)

(declare-fun dynLambda!522 (Int (_ BitVec 64)) V!5563)

(assert (=> b!190239 (= e!125203 (= (apply!179 lt!94274 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4142 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))))))))

(assert (=> b!190239 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190240 () Bool)

(assert (=> b!190240 (= e!125204 (not call!19191))))

(assert (= (and d!55779 c!34185) b!190229))

(assert (= (and d!55779 (not c!34185)) b!190225))

(assert (= (and b!190225 c!34189) b!190232))

(assert (= (and b!190225 (not c!34189)) b!190224))

(assert (= (and b!190224 c!34190) b!190226))

(assert (= (and b!190224 (not c!34190)) b!190233))

(assert (= (or b!190226 b!190233) bm!19191))

(assert (= (or b!190232 bm!19191) bm!19193))

(assert (= (or b!190232 b!190226) bm!19188))

(assert (= (or b!190229 bm!19193) bm!19190))

(assert (= (or b!190229 bm!19188) bm!19189))

(assert (= (and d!55779 res!89924) b!190220))

(assert (= (and d!55779 c!34187) b!190223))

(assert (= (and d!55779 (not c!34187)) b!190227))

(assert (= (and d!55779 res!89926) b!190222))

(assert (= (and b!190222 res!89928) b!190231))

(assert (= (and b!190222 (not res!89929)) b!190237))

(assert (= (and b!190237 res!89925) b!190239))

(assert (= (and b!190222 res!89927) b!190228))

(assert (= (and b!190228 c!34186) b!190235))

(assert (= (and b!190228 (not c!34186)) b!190230))

(assert (= (and b!190235 res!89932) b!190236))

(assert (= (or b!190235 b!190230) bm!19192))

(assert (= (and b!190228 res!89930) b!190221))

(assert (= (and b!190221 c!34188) b!190238))

(assert (= (and b!190221 (not c!34188)) b!190240))

(assert (= (and b!190238 res!89931) b!190234))

(assert (= (or b!190238 b!190240) bm!19194))

(declare-fun b_lambda!7343 () Bool)

(assert (=> (not b_lambda!7343) (not b!190239)))

(declare-fun t!7326 () Bool)

(declare-fun tb!2869 () Bool)

(assert (=> (and b!190094 (= (defaultEntry!3881 thiss!1248) (defaultEntry!3881 thiss!1248)) t!7326) tb!2869))

(declare-fun result!4885 () Bool)

(assert (=> tb!2869 (= result!4885 tp_is_empty!4437)))

(assert (=> b!190239 t!7326))

(declare-fun b_and!11315 () Bool)

(assert (= b_and!11311 (and (=> t!7326 result!4885) b_and!11315)))

(declare-fun m!216503 () Bool)

(assert (=> bm!19192 m!216503))

(declare-fun m!216505 () Bool)

(assert (=> b!190234 m!216505))

(declare-fun m!216507 () Bool)

(assert (=> bm!19194 m!216507))

(assert (=> d!55779 m!216437))

(declare-fun m!216509 () Bool)

(assert (=> bm!19189 m!216509))

(declare-fun m!216511 () Bool)

(assert (=> b!190229 m!216511))

(declare-fun m!216513 () Bool)

(assert (=> b!190239 m!216513))

(declare-fun m!216515 () Bool)

(assert (=> b!190239 m!216515))

(assert (=> b!190239 m!216513))

(declare-fun m!216517 () Bool)

(assert (=> b!190239 m!216517))

(declare-fun m!216519 () Bool)

(assert (=> b!190239 m!216519))

(assert (=> b!190239 m!216515))

(assert (=> b!190239 m!216519))

(declare-fun m!216521 () Bool)

(assert (=> b!190239 m!216521))

(declare-fun m!216523 () Bool)

(assert (=> bm!19190 m!216523))

(assert (=> b!190231 m!216519))

(assert (=> b!190231 m!216519))

(declare-fun m!216525 () Bool)

(assert (=> b!190231 m!216525))

(assert (=> b!190237 m!216519))

(assert (=> b!190237 m!216519))

(declare-fun m!216527 () Bool)

(assert (=> b!190237 m!216527))

(declare-fun m!216529 () Bool)

(assert (=> b!190223 m!216529))

(declare-fun m!216531 () Bool)

(assert (=> b!190223 m!216531))

(declare-fun m!216533 () Bool)

(assert (=> b!190223 m!216533))

(declare-fun m!216535 () Bool)

(assert (=> b!190223 m!216535))

(declare-fun m!216537 () Bool)

(assert (=> b!190223 m!216537))

(declare-fun m!216539 () Bool)

(assert (=> b!190223 m!216539))

(declare-fun m!216541 () Bool)

(assert (=> b!190223 m!216541))

(assert (=> b!190223 m!216519))

(declare-fun m!216543 () Bool)

(assert (=> b!190223 m!216543))

(declare-fun m!216545 () Bool)

(assert (=> b!190223 m!216545))

(declare-fun m!216547 () Bool)

(assert (=> b!190223 m!216547))

(declare-fun m!216549 () Bool)

(assert (=> b!190223 m!216549))

(declare-fun m!216551 () Bool)

(assert (=> b!190223 m!216551))

(assert (=> b!190223 m!216547))

(assert (=> b!190223 m!216543))

(declare-fun m!216553 () Bool)

(assert (=> b!190223 m!216553))

(assert (=> b!190223 m!216529))

(declare-fun m!216555 () Bool)

(assert (=> b!190223 m!216555))

(assert (=> b!190223 m!216539))

(assert (=> b!190223 m!216523))

(declare-fun m!216557 () Bool)

(assert (=> b!190223 m!216557))

(assert (=> b!190220 m!216519))

(assert (=> b!190220 m!216519))

(assert (=> b!190220 m!216525))

(declare-fun m!216559 () Bool)

(assert (=> b!190236 m!216559))

(assert (=> b!190096 d!55779))

(declare-fun d!55781 () Bool)

(assert (=> d!55781 (= (validMask!0 (mask!9079 thiss!1248)) (and (or (= (mask!9079 thiss!1248) #b00000000000000000000000000000111) (= (mask!9079 thiss!1248) #b00000000000000000000000000001111) (= (mask!9079 thiss!1248) #b00000000000000000000000000011111) (= (mask!9079 thiss!1248) #b00000000000000000000000000111111) (= (mask!9079 thiss!1248) #b00000000000000000000000001111111) (= (mask!9079 thiss!1248) #b00000000000000000000000011111111) (= (mask!9079 thiss!1248) #b00000000000000000000000111111111) (= (mask!9079 thiss!1248) #b00000000000000000000001111111111) (= (mask!9079 thiss!1248) #b00000000000000000000011111111111) (= (mask!9079 thiss!1248) #b00000000000000000000111111111111) (= (mask!9079 thiss!1248) #b00000000000000000001111111111111) (= (mask!9079 thiss!1248) #b00000000000000000011111111111111) (= (mask!9079 thiss!1248) #b00000000000000000111111111111111) (= (mask!9079 thiss!1248) #b00000000000000001111111111111111) (= (mask!9079 thiss!1248) #b00000000000000011111111111111111) (= (mask!9079 thiss!1248) #b00000000000000111111111111111111) (= (mask!9079 thiss!1248) #b00000000000001111111111111111111) (= (mask!9079 thiss!1248) #b00000000000011111111111111111111) (= (mask!9079 thiss!1248) #b00000000000111111111111111111111) (= (mask!9079 thiss!1248) #b00000000001111111111111111111111) (= (mask!9079 thiss!1248) #b00000000011111111111111111111111) (= (mask!9079 thiss!1248) #b00000000111111111111111111111111) (= (mask!9079 thiss!1248) #b00000001111111111111111111111111) (= (mask!9079 thiss!1248) #b00000011111111111111111111111111) (= (mask!9079 thiss!1248) #b00000111111111111111111111111111) (= (mask!9079 thiss!1248) #b00001111111111111111111111111111) (= (mask!9079 thiss!1248) #b00011111111111111111111111111111) (= (mask!9079 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9079 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!190096 d!55781))

(declare-fun d!55783 () Bool)

(declare-fun e!125213 () Bool)

(assert (=> d!55783 e!125213))

(declare-fun res!89935 () Bool)

(assert (=> d!55783 (=> (not res!89935) (not e!125213))))

(assert (=> d!55783 (= res!89935 (and (bvsge (index!4859 lt!94184) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94184) (size!4142 (_values!3864 thiss!1248)))))))

(declare-fun lt!94297 () Unit!5743)

(declare-fun choose!1022 (array!8107 array!8109 (_ BitVec 32) (_ BitVec 32) V!5563 V!5563 (_ BitVec 32) (_ BitVec 64) V!5563 Int) Unit!5743)

(assert (=> d!55783 (= lt!94297 (choose!1022 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (index!4859 lt!94184) key!828 v!309 (defaultEntry!3881 thiss!1248)))))

(assert (=> d!55783 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55783 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!102 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (index!4859 lt!94184) key!828 v!309 (defaultEntry!3881 thiss!1248)) lt!94297)))

(declare-fun b!190245 () Bool)

(assert (=> b!190245 (= e!125213 (= (+!301 (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) (tuple2!3519 key!828 v!309)) (getCurrentListMap!881 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248))))))

(assert (= (and d!55783 res!89935) b!190245))

(declare-fun m!216561 () Bool)

(assert (=> d!55783 m!216561))

(assert (=> d!55783 m!216437))

(assert (=> b!190245 m!216427))

(assert (=> b!190245 m!216427))

(declare-fun m!216563 () Bool)

(assert (=> b!190245 m!216563))

(assert (=> b!190245 m!216431))

(assert (=> b!190245 m!216435))

(assert (=> b!190096 d!55783))

(declare-fun b!190246 () Bool)

(declare-fun e!125221 () Bool)

(assert (=> b!190246 (= e!125221 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190247 () Bool)

(declare-fun e!125217 () Bool)

(declare-fun e!125220 () Bool)

(assert (=> b!190247 (= e!125217 e!125220)))

(declare-fun c!34194 () Bool)

(assert (=> b!190247 (= c!34194 (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190248 () Bool)

(declare-fun res!89939 () Bool)

(assert (=> b!190248 (=> (not res!89939) (not e!125217))))

(declare-fun e!125216 () Bool)

(assert (=> b!190248 (= res!89939 e!125216)))

(declare-fun res!89941 () Bool)

(assert (=> b!190248 (=> res!89941 e!125216)))

(declare-fun e!125218 () Bool)

(assert (=> b!190248 (= res!89941 (not e!125218))))

(declare-fun res!89940 () Bool)

(assert (=> b!190248 (=> (not res!89940) (not e!125218))))

(assert (=> b!190248 (= res!89940 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun bm!19195 () Bool)

(declare-fun call!19203 () ListLongMap!2435)

(declare-fun call!19201 () ListLongMap!2435)

(assert (=> bm!19195 (= call!19203 call!19201)))

(declare-fun b!190250 () Bool)

(declare-fun c!34196 () Bool)

(assert (=> b!190250 (= c!34196 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125214 () ListLongMap!2435)

(declare-fun e!125226 () ListLongMap!2435)

(assert (=> b!190250 (= e!125214 e!125226)))

(declare-fun call!19202 () ListLongMap!2435)

(declare-fun call!19204 () ListLongMap!2435)

(declare-fun call!19199 () ListLongMap!2435)

(declare-fun c!34191 () Bool)

(declare-fun bm!19196 () Bool)

(declare-fun c!34195 () Bool)

(assert (=> bm!19196 (= call!19201 (+!301 (ite c!34191 call!19204 (ite c!34195 call!19199 call!19202)) (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(declare-fun bm!19197 () Bool)

(assert (=> bm!19197 (= call!19204 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun b!190251 () Bool)

(declare-fun e!125215 () ListLongMap!2435)

(assert (=> b!190251 (= e!125215 e!125214)))

(assert (=> b!190251 (= c!34195 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!190252 () Bool)

(assert (=> b!190252 (= e!125226 call!19203)))

(declare-fun bm!19198 () Bool)

(assert (=> bm!19198 (= call!19202 call!19199)))

(declare-fun b!190253 () Bool)

(declare-fun e!125222 () Unit!5743)

(declare-fun Unit!5750 () Unit!5743)

(assert (=> b!190253 (= e!125222 Unit!5750)))

(declare-fun b!190254 () Bool)

(declare-fun res!89942 () Bool)

(assert (=> b!190254 (=> (not res!89942) (not e!125217))))

(declare-fun e!125223 () Bool)

(assert (=> b!190254 (= res!89942 e!125223)))

(declare-fun c!34192 () Bool)

(assert (=> b!190254 (= c!34192 (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!190255 () Bool)

(assert (=> b!190255 (= e!125215 (+!301 call!19201 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))

(declare-fun b!190256 () Bool)

(declare-fun call!19200 () Bool)

(assert (=> b!190256 (= e!125223 (not call!19200))))

(declare-fun b!190257 () Bool)

(assert (=> b!190257 (= e!125218 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190249 () Bool)

(declare-fun lt!94303 () Unit!5743)

(assert (=> b!190249 (= e!125222 lt!94303)))

(declare-fun lt!94310 () ListLongMap!2435)

(assert (=> b!190249 (= lt!94310 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94313 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94312 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94312 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94311 () Unit!5743)

(assert (=> b!190249 (= lt!94311 (addStillContains!155 lt!94310 lt!94313 (zeroValue!3722 thiss!1248) lt!94312))))

(assert (=> b!190249 (contains!1342 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) lt!94312)))

(declare-fun lt!94301 () Unit!5743)

(assert (=> b!190249 (= lt!94301 lt!94311)))

(declare-fun lt!94319 () ListLongMap!2435)

(assert (=> b!190249 (= lt!94319 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94318 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94302 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94302 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94305 () Unit!5743)

(assert (=> b!190249 (= lt!94305 (addApplyDifferent!155 lt!94319 lt!94318 (minValue!3722 thiss!1248) lt!94302))))

(assert (=> b!190249 (= (apply!179 (+!301 lt!94319 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) lt!94302) (apply!179 lt!94319 lt!94302))))

(declare-fun lt!94308 () Unit!5743)

(assert (=> b!190249 (= lt!94308 lt!94305)))

(declare-fun lt!94306 () ListLongMap!2435)

(assert (=> b!190249 (= lt!94306 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94309 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94314 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94314 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94298 () Unit!5743)

(assert (=> b!190249 (= lt!94298 (addApplyDifferent!155 lt!94306 lt!94309 (zeroValue!3722 thiss!1248) lt!94314))))

(assert (=> b!190249 (= (apply!179 (+!301 lt!94306 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) lt!94314) (apply!179 lt!94306 lt!94314))))

(declare-fun lt!94300 () Unit!5743)

(assert (=> b!190249 (= lt!94300 lt!94298)))

(declare-fun lt!94304 () ListLongMap!2435)

(assert (=> b!190249 (= lt!94304 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(declare-fun lt!94316 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94307 () (_ BitVec 64))

(assert (=> b!190249 (= lt!94307 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190249 (= lt!94303 (addApplyDifferent!155 lt!94304 lt!94316 (minValue!3722 thiss!1248) lt!94307))))

(assert (=> b!190249 (= (apply!179 (+!301 lt!94304 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) lt!94307) (apply!179 lt!94304 lt!94307))))

(declare-fun d!55785 () Bool)

(assert (=> d!55785 e!125217))

(declare-fun res!89938 () Bool)

(assert (=> d!55785 (=> (not res!89938) (not e!125217))))

(assert (=> d!55785 (= res!89938 (or (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))))

(declare-fun lt!94299 () ListLongMap!2435)

(declare-fun lt!94315 () ListLongMap!2435)

(assert (=> d!55785 (= lt!94299 lt!94315)))

(declare-fun lt!94317 () Unit!5743)

(assert (=> d!55785 (= lt!94317 e!125222)))

(declare-fun c!34193 () Bool)

(assert (=> d!55785 (= c!34193 e!125221)))

(declare-fun res!89936 () Bool)

(assert (=> d!55785 (=> (not res!89936) (not e!125221))))

(assert (=> d!55785 (= res!89936 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55785 (= lt!94315 e!125215)))

(assert (=> d!55785 (= c!34191 (and (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3618 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55785 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55785 (= (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) lt!94299)))

(declare-fun bm!19199 () Bool)

(assert (=> bm!19199 (= call!19200 (contains!1342 lt!94299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19200 () Bool)

(assert (=> bm!19200 (= call!19199 call!19204)))

(declare-fun b!190258 () Bool)

(assert (=> b!190258 (= e!125214 call!19203)))

(declare-fun b!190259 () Bool)

(assert (=> b!190259 (= e!125226 call!19202)))

(declare-fun b!190260 () Bool)

(declare-fun e!125224 () Bool)

(assert (=> b!190260 (= e!125224 (= (apply!179 lt!94299 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3722 thiss!1248)))))

(declare-fun b!190261 () Bool)

(declare-fun e!125225 () Bool)

(assert (=> b!190261 (= e!125223 e!125225)))

(declare-fun res!89944 () Bool)

(assert (=> b!190261 (= res!89944 call!19200)))

(assert (=> b!190261 (=> (not res!89944) (not e!125225))))

(declare-fun b!190262 () Bool)

(assert (=> b!190262 (= e!125225 (= (apply!179 lt!94299 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3722 thiss!1248)))))

(declare-fun b!190263 () Bool)

(declare-fun e!125219 () Bool)

(assert (=> b!190263 (= e!125216 e!125219)))

(declare-fun res!89937 () Bool)

(assert (=> b!190263 (=> (not res!89937) (not e!125219))))

(assert (=> b!190263 (= res!89937 (contains!1342 lt!94299 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190264 () Bool)

(assert (=> b!190264 (= e!125220 e!125224)))

(declare-fun res!89943 () Bool)

(declare-fun call!19198 () Bool)

(assert (=> b!190264 (= res!89943 call!19198)))

(assert (=> b!190264 (=> (not res!89943) (not e!125224))))

(declare-fun bm!19201 () Bool)

(assert (=> bm!19201 (= call!19198 (contains!1342 lt!94299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190265 () Bool)

(assert (=> b!190265 (= e!125219 (= (apply!179 lt!94299 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4142 (_values!3864 thiss!1248))))))

(assert (=> b!190265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190266 () Bool)

(assert (=> b!190266 (= e!125220 (not call!19198))))

(assert (= (and d!55785 c!34191) b!190255))

(assert (= (and d!55785 (not c!34191)) b!190251))

(assert (= (and b!190251 c!34195) b!190258))

(assert (= (and b!190251 (not c!34195)) b!190250))

(assert (= (and b!190250 c!34196) b!190252))

(assert (= (and b!190250 (not c!34196)) b!190259))

(assert (= (or b!190252 b!190259) bm!19198))

(assert (= (or b!190258 bm!19198) bm!19200))

(assert (= (or b!190258 b!190252) bm!19195))

(assert (= (or b!190255 bm!19200) bm!19197))

(assert (= (or b!190255 bm!19195) bm!19196))

(assert (= (and d!55785 res!89936) b!190246))

(assert (= (and d!55785 c!34193) b!190249))

(assert (= (and d!55785 (not c!34193)) b!190253))

(assert (= (and d!55785 res!89938) b!190248))

(assert (= (and b!190248 res!89940) b!190257))

(assert (= (and b!190248 (not res!89941)) b!190263))

(assert (= (and b!190263 res!89937) b!190265))

(assert (= (and b!190248 res!89939) b!190254))

(assert (= (and b!190254 c!34192) b!190261))

(assert (= (and b!190254 (not c!34192)) b!190256))

(assert (= (and b!190261 res!89944) b!190262))

(assert (= (or b!190261 b!190256) bm!19199))

(assert (= (and b!190254 res!89942) b!190247))

(assert (= (and b!190247 c!34194) b!190264))

(assert (= (and b!190247 (not c!34194)) b!190266))

(assert (= (and b!190264 res!89943) b!190260))

(assert (= (or b!190264 b!190266) bm!19201))

(declare-fun b_lambda!7345 () Bool)

(assert (=> (not b_lambda!7345) (not b!190265)))

(assert (=> b!190265 t!7326))

(declare-fun b_and!11317 () Bool)

(assert (= b_and!11315 (and (=> t!7326 result!4885) b_and!11317)))

(declare-fun m!216565 () Bool)

(assert (=> bm!19199 m!216565))

(declare-fun m!216567 () Bool)

(assert (=> b!190260 m!216567))

(declare-fun m!216569 () Bool)

(assert (=> bm!19201 m!216569))

(assert (=> d!55785 m!216437))

(declare-fun m!216571 () Bool)

(assert (=> bm!19196 m!216571))

(declare-fun m!216573 () Bool)

(assert (=> b!190255 m!216573))

(assert (=> b!190265 m!216513))

(declare-fun m!216575 () Bool)

(assert (=> b!190265 m!216575))

(assert (=> b!190265 m!216513))

(declare-fun m!216577 () Bool)

(assert (=> b!190265 m!216577))

(assert (=> b!190265 m!216519))

(assert (=> b!190265 m!216575))

(assert (=> b!190265 m!216519))

(declare-fun m!216579 () Bool)

(assert (=> b!190265 m!216579))

(declare-fun m!216581 () Bool)

(assert (=> bm!19197 m!216581))

(assert (=> b!190257 m!216519))

(assert (=> b!190257 m!216519))

(assert (=> b!190257 m!216525))

(assert (=> b!190263 m!216519))

(assert (=> b!190263 m!216519))

(declare-fun m!216583 () Bool)

(assert (=> b!190263 m!216583))

(declare-fun m!216585 () Bool)

(assert (=> b!190249 m!216585))

(declare-fun m!216587 () Bool)

(assert (=> b!190249 m!216587))

(declare-fun m!216589 () Bool)

(assert (=> b!190249 m!216589))

(declare-fun m!216591 () Bool)

(assert (=> b!190249 m!216591))

(declare-fun m!216593 () Bool)

(assert (=> b!190249 m!216593))

(declare-fun m!216595 () Bool)

(assert (=> b!190249 m!216595))

(declare-fun m!216597 () Bool)

(assert (=> b!190249 m!216597))

(assert (=> b!190249 m!216519))

(declare-fun m!216599 () Bool)

(assert (=> b!190249 m!216599))

(declare-fun m!216601 () Bool)

(assert (=> b!190249 m!216601))

(declare-fun m!216603 () Bool)

(assert (=> b!190249 m!216603))

(declare-fun m!216605 () Bool)

(assert (=> b!190249 m!216605))

(declare-fun m!216607 () Bool)

(assert (=> b!190249 m!216607))

(assert (=> b!190249 m!216603))

(assert (=> b!190249 m!216599))

(declare-fun m!216609 () Bool)

(assert (=> b!190249 m!216609))

(assert (=> b!190249 m!216585))

(declare-fun m!216611 () Bool)

(assert (=> b!190249 m!216611))

(assert (=> b!190249 m!216595))

(assert (=> b!190249 m!216581))

(declare-fun m!216613 () Bool)

(assert (=> b!190249 m!216613))

(assert (=> b!190246 m!216519))

(assert (=> b!190246 m!216519))

(assert (=> b!190246 m!216525))

(declare-fun m!216615 () Bool)

(assert (=> b!190262 m!216615))

(assert (=> b!190096 d!55785))

(declare-fun d!55787 () Bool)

(declare-fun e!125229 () Bool)

(assert (=> d!55787 e!125229))

(declare-fun res!89950 () Bool)

(assert (=> d!55787 (=> (not res!89950) (not e!125229))))

(declare-fun lt!94331 () ListLongMap!2435)

(assert (=> d!55787 (= res!89950 (contains!1342 lt!94331 (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun lt!94328 () List!2415)

(assert (=> d!55787 (= lt!94331 (ListLongMap!2436 lt!94328))))

(declare-fun lt!94330 () Unit!5743)

(declare-fun lt!94329 () Unit!5743)

(assert (=> d!55787 (= lt!94330 lt!94329)))

(declare-datatypes ((Option!242 0))(
  ( (Some!241 (v!4194 V!5563)) (None!240) )
))
(declare-fun getValueByKey!236 (List!2415 (_ BitVec 64)) Option!242)

(assert (=> d!55787 (= (getValueByKey!236 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309))) (Some!241 (_2!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!123 (List!2415 (_ BitVec 64) V!5563) Unit!5743)

(assert (=> d!55787 (= lt!94329 (lemmaContainsTupThenGetReturnValue!123 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun insertStrictlySorted!126 (List!2415 (_ BitVec 64) V!5563) List!2415)

(assert (=> d!55787 (= lt!94328 (insertStrictlySorted!126 (toList!1233 lt!94189) (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> d!55787 (= (+!301 lt!94189 (tuple2!3519 key!828 v!309)) lt!94331)))

(declare-fun b!190271 () Bool)

(declare-fun res!89949 () Bool)

(assert (=> b!190271 (=> (not res!89949) (not e!125229))))

(assert (=> b!190271 (= res!89949 (= (getValueByKey!236 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309))) (Some!241 (_2!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun b!190272 () Bool)

(declare-fun contains!1344 (List!2415 tuple2!3518) Bool)

(assert (=> b!190272 (= e!125229 (contains!1344 (toList!1233 lt!94331) (tuple2!3519 key!828 v!309)))))

(assert (= (and d!55787 res!89950) b!190271))

(assert (= (and b!190271 res!89949) b!190272))

(declare-fun m!216617 () Bool)

(assert (=> d!55787 m!216617))

(declare-fun m!216619 () Bool)

(assert (=> d!55787 m!216619))

(declare-fun m!216621 () Bool)

(assert (=> d!55787 m!216621))

(declare-fun m!216623 () Bool)

(assert (=> d!55787 m!216623))

(declare-fun m!216625 () Bool)

(assert (=> b!190271 m!216625))

(declare-fun m!216627 () Bool)

(assert (=> b!190272 m!216627))

(assert (=> b!190096 d!55787))

(declare-fun d!55789 () Bool)

(declare-fun e!125235 () Bool)

(assert (=> d!55789 e!125235))

(declare-fun res!89953 () Bool)

(assert (=> d!55789 (=> res!89953 e!125235)))

(declare-fun lt!94341 () Bool)

(assert (=> d!55789 (= res!89953 (not lt!94341))))

(declare-fun lt!94340 () Bool)

(assert (=> d!55789 (= lt!94341 lt!94340)))

(declare-fun lt!94343 () Unit!5743)

(declare-fun e!125234 () Unit!5743)

(assert (=> d!55789 (= lt!94343 e!125234)))

(declare-fun c!34199 () Bool)

(assert (=> d!55789 (= c!34199 lt!94340)))

(declare-fun containsKey!240 (List!2415 (_ BitVec 64)) Bool)

(assert (=> d!55789 (= lt!94340 (containsKey!240 (toList!1233 lt!94189) key!828))))

(assert (=> d!55789 (= (contains!1342 lt!94189 key!828) lt!94341)))

(declare-fun b!190279 () Bool)

(declare-fun lt!94342 () Unit!5743)

(assert (=> b!190279 (= e!125234 lt!94342)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!188 (List!2415 (_ BitVec 64)) Unit!5743)

(assert (=> b!190279 (= lt!94342 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94189) key!828))))

(declare-fun isDefined!189 (Option!242) Bool)

(assert (=> b!190279 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94189) key!828))))

(declare-fun b!190280 () Bool)

(declare-fun Unit!5751 () Unit!5743)

(assert (=> b!190280 (= e!125234 Unit!5751)))

(declare-fun b!190281 () Bool)

(assert (=> b!190281 (= e!125235 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94189) key!828)))))

(assert (= (and d!55789 c!34199) b!190279))

(assert (= (and d!55789 (not c!34199)) b!190280))

(assert (= (and d!55789 (not res!89953)) b!190281))

(declare-fun m!216629 () Bool)

(assert (=> d!55789 m!216629))

(declare-fun m!216631 () Bool)

(assert (=> b!190279 m!216631))

(declare-fun m!216633 () Bool)

(assert (=> b!190279 m!216633))

(assert (=> b!190279 m!216633))

(declare-fun m!216635 () Bool)

(assert (=> b!190279 m!216635))

(assert (=> b!190281 m!216633))

(assert (=> b!190281 m!216633))

(assert (=> b!190281 m!216635))

(assert (=> b!190096 d!55789))

(declare-fun d!55791 () Bool)

(assert (=> d!55791 (= (array_inv!2477 (_keys!5850 thiss!1248)) (bvsge (size!4141 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190094 d!55791))

(declare-fun d!55793 () Bool)

(assert (=> d!55793 (= (array_inv!2478 (_values!3864 thiss!1248)) (bvsge (size!4142 (_values!3864 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190094 d!55793))

(declare-fun d!55795 () Bool)

(declare-fun res!89960 () Bool)

(declare-fun e!125238 () Bool)

(assert (=> d!55795 (=> (not res!89960) (not e!125238))))

(declare-fun simpleValid!195 (LongMapFixedSize!2658) Bool)

(assert (=> d!55795 (= res!89960 (simpleValid!195 thiss!1248))))

(assert (=> d!55795 (= (valid!1092 thiss!1248) e!125238)))

(declare-fun b!190288 () Bool)

(declare-fun res!89961 () Bool)

(assert (=> b!190288 (=> (not res!89961) (not e!125238))))

(declare-fun arrayCountValidKeys!0 (array!8107 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190288 (= res!89961 (= (arrayCountValidKeys!0 (_keys!5850 thiss!1248) #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))) (_size!1378 thiss!1248)))))

(declare-fun b!190289 () Bool)

(declare-fun res!89962 () Bool)

(assert (=> b!190289 (=> (not res!89962) (not e!125238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8107 (_ BitVec 32)) Bool)

(assert (=> b!190289 (= res!89962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun b!190290 () Bool)

(declare-datatypes ((List!2417 0))(
  ( (Nil!2414) (Cons!2413 (h!3050 (_ BitVec 64)) (t!7327 List!2417)) )
))
(declare-fun arrayNoDuplicates!0 (array!8107 (_ BitVec 32) List!2417) Bool)

(assert (=> b!190290 (= e!125238 (arrayNoDuplicates!0 (_keys!5850 thiss!1248) #b00000000000000000000000000000000 Nil!2414))))

(assert (= (and d!55795 res!89960) b!190288))

(assert (= (and b!190288 res!89961) b!190289))

(assert (= (and b!190289 res!89962) b!190290))

(declare-fun m!216637 () Bool)

(assert (=> d!55795 m!216637))

(declare-fun m!216639 () Bool)

(assert (=> b!190288 m!216639))

(declare-fun m!216641 () Bool)

(assert (=> b!190289 m!216641))

(declare-fun m!216643 () Bool)

(assert (=> b!190290 m!216643))

(assert (=> start!19320 d!55795))

(declare-fun b!190298 () Bool)

(declare-fun e!125244 () Bool)

(assert (=> b!190298 (= e!125244 tp_is_empty!4437)))

(declare-fun condMapEmpty!7663 () Bool)

(declare-fun mapDefault!7663 () ValueCell!1875)

(assert (=> mapNonEmpty!7657 (= condMapEmpty!7663 (= mapRest!7657 ((as const (Array (_ BitVec 32) ValueCell!1875)) mapDefault!7663)))))

(declare-fun mapRes!7663 () Bool)

(assert (=> mapNonEmpty!7657 (= tp!16833 (and e!125244 mapRes!7663))))

(declare-fun mapNonEmpty!7663 () Bool)

(declare-fun tp!16843 () Bool)

(declare-fun e!125243 () Bool)

(assert (=> mapNonEmpty!7663 (= mapRes!7663 (and tp!16843 e!125243))))

(declare-fun mapKey!7663 () (_ BitVec 32))

(declare-fun mapValue!7663 () ValueCell!1875)

(declare-fun mapRest!7663 () (Array (_ BitVec 32) ValueCell!1875))

(assert (=> mapNonEmpty!7663 (= mapRest!7657 (store mapRest!7663 mapKey!7663 mapValue!7663))))

(declare-fun mapIsEmpty!7663 () Bool)

(assert (=> mapIsEmpty!7663 mapRes!7663))

(declare-fun b!190297 () Bool)

(assert (=> b!190297 (= e!125243 tp_is_empty!4437)))

(assert (= (and mapNonEmpty!7657 condMapEmpty!7663) mapIsEmpty!7663))

(assert (= (and mapNonEmpty!7657 (not condMapEmpty!7663)) mapNonEmpty!7663))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1875) mapValue!7663)) b!190297))

(assert (= (and mapNonEmpty!7657 ((_ is ValueCellFull!1875) mapDefault!7663)) b!190298))

(declare-fun m!216645 () Bool)

(assert (=> mapNonEmpty!7663 m!216645))

(declare-fun b_lambda!7347 () Bool)

(assert (= b_lambda!7345 (or (and b!190094 b_free!4665) b_lambda!7347)))

(declare-fun b_lambda!7349 () Bool)

(assert (= b_lambda!7343 (or (and b!190094 b_free!4665) b_lambda!7349)))

(check-sat (not b!190223) (not bm!19199) (not b!190272) (not mapNonEmpty!7663) (not bm!19196) (not b!190279) (not bm!19197) (not b_lambda!7349) (not b!190290) (not bm!19189) (not b!190281) (not bm!19172) (not b_next!4665) (not b!190263) (not b!190249) (not b!190220) (not bm!19190) (not d!55771) (not bm!19192) (not b!190257) (not bm!19173) (not b!190260) (not b!190271) (not d!55777) (not b!190229) (not b!190234) (not d!55779) (not b!190158) (not b!190265) b_and!11317 (not b!190289) (not b!190236) (not b!190262) (not bm!19194) (not d!55789) (not b!190245) (not d!55783) tp_is_empty!4437 (not b!190237) (not b!190255) (not d!55795) (not b!190231) (not b!190172) (not b_lambda!7347) (not b!190246) (not d!55787) (not b!190288) (not bm!19201) (not d!55773) (not b!190239) (not d!55785))
(check-sat b_and!11317 (not b_next!4665))
(get-model)

(declare-fun b!190307 () Bool)

(declare-fun e!125250 () (_ BitVec 32))

(assert (=> b!190307 (= e!125250 #b00000000000000000000000000000000)))

(declare-fun d!55797 () Bool)

(declare-fun lt!94346 () (_ BitVec 32))

(assert (=> d!55797 (and (bvsge lt!94346 #b00000000000000000000000000000000) (bvsle lt!94346 (bvsub (size!4141 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55797 (= lt!94346 e!125250)))

(declare-fun c!34204 () Bool)

(assert (=> d!55797 (= c!34204 (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55797 (and (bvsle #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4141 (_keys!5850 thiss!1248)) (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55797 (= (arrayCountValidKeys!0 (_keys!5850 thiss!1248) #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))) lt!94346)))

(declare-fun bm!19204 () Bool)

(declare-fun call!19207 () (_ BitVec 32))

(assert (=> bm!19204 (= call!19207 (arrayCountValidKeys!0 (_keys!5850 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190308 () Bool)

(declare-fun e!125249 () (_ BitVec 32))

(assert (=> b!190308 (= e!125249 (bvadd #b00000000000000000000000000000001 call!19207))))

(declare-fun b!190309 () Bool)

(assert (=> b!190309 (= e!125249 call!19207)))

(declare-fun b!190310 () Bool)

(assert (=> b!190310 (= e!125250 e!125249)))

(declare-fun c!34205 () Bool)

(assert (=> b!190310 (= c!34205 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55797 c!34204) b!190307))

(assert (= (and d!55797 (not c!34204)) b!190310))

(assert (= (and b!190310 c!34205) b!190308))

(assert (= (and b!190310 (not c!34205)) b!190309))

(assert (= (or b!190308 b!190309) bm!19204))

(declare-fun m!216647 () Bool)

(assert (=> bm!19204 m!216647))

(assert (=> b!190310 m!216519))

(assert (=> b!190310 m!216519))

(assert (=> b!190310 m!216525))

(assert (=> b!190288 d!55797))

(declare-fun d!55799 () Bool)

(declare-fun get!2199 (Option!242) V!5563)

(assert (=> d!55799 (= (apply!179 lt!94274 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!236 (toList!1233 lt!94274) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7611 () Bool)

(assert (= bs!7611 d!55799))

(declare-fun m!216649 () Bool)

(assert (=> bs!7611 m!216649))

(assert (=> bs!7611 m!216649))

(declare-fun m!216651 () Bool)

(assert (=> bs!7611 m!216651))

(assert (=> b!190236 d!55799))

(declare-fun d!55801 () Bool)

(declare-fun res!89968 () Bool)

(declare-fun e!125257 () Bool)

(assert (=> d!55801 (=> res!89968 e!125257)))

(assert (=> d!55801 (= res!89968 (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)) e!125257)))

(declare-fun bm!19207 () Bool)

(declare-fun call!19210 () Bool)

(assert (=> bm!19207 (= call!19210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun b!190319 () Bool)

(declare-fun e!125259 () Bool)

(assert (=> b!190319 (= e!125259 call!19210)))

(declare-fun b!190320 () Bool)

(declare-fun e!125258 () Bool)

(assert (=> b!190320 (= e!125258 call!19210)))

(declare-fun b!190321 () Bool)

(assert (=> b!190321 (= e!125257 e!125259)))

(declare-fun c!34208 () Bool)

(assert (=> b!190321 (= c!34208 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190322 () Bool)

(assert (=> b!190322 (= e!125259 e!125258)))

(declare-fun lt!94354 () (_ BitVec 64))

(assert (=> b!190322 (= lt!94354 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94355 () Unit!5743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8107 (_ BitVec 64) (_ BitVec 32)) Unit!5743)

(assert (=> b!190322 (= lt!94355 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5850 thiss!1248) lt!94354 #b00000000000000000000000000000000))))

(assert (=> b!190322 (arrayContainsKey!0 (_keys!5850 thiss!1248) lt!94354 #b00000000000000000000000000000000)))

(declare-fun lt!94353 () Unit!5743)

(assert (=> b!190322 (= lt!94353 lt!94355)))

(declare-fun res!89967 () Bool)

(assert (=> b!190322 (= res!89967 (= (seekEntryOrOpen!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) (_keys!5850 thiss!1248) (mask!9079 thiss!1248)) (Found!672 #b00000000000000000000000000000000)))))

(assert (=> b!190322 (=> (not res!89967) (not e!125258))))

(assert (= (and d!55801 (not res!89968)) b!190321))

(assert (= (and b!190321 c!34208) b!190322))

(assert (= (and b!190321 (not c!34208)) b!190319))

(assert (= (and b!190322 res!89967) b!190320))

(assert (= (or b!190320 b!190319) bm!19207))

(declare-fun m!216653 () Bool)

(assert (=> bm!19207 m!216653))

(assert (=> b!190321 m!216519))

(assert (=> b!190321 m!216519))

(assert (=> b!190321 m!216525))

(assert (=> b!190322 m!216519))

(declare-fun m!216655 () Bool)

(assert (=> b!190322 m!216655))

(declare-fun m!216657 () Bool)

(assert (=> b!190322 m!216657))

(assert (=> b!190322 m!216519))

(declare-fun m!216659 () Bool)

(assert (=> b!190322 m!216659))

(assert (=> b!190289 d!55801))

(declare-fun d!55803 () Bool)

(declare-fun e!125261 () Bool)

(assert (=> d!55803 e!125261))

(declare-fun res!89969 () Bool)

(assert (=> d!55803 (=> res!89969 e!125261)))

(declare-fun lt!94357 () Bool)

(assert (=> d!55803 (= res!89969 (not lt!94357))))

(declare-fun lt!94356 () Bool)

(assert (=> d!55803 (= lt!94357 lt!94356)))

(declare-fun lt!94359 () Unit!5743)

(declare-fun e!125260 () Unit!5743)

(assert (=> d!55803 (= lt!94359 e!125260)))

(declare-fun c!34209 () Bool)

(assert (=> d!55803 (= c!34209 lt!94356)))

(assert (=> d!55803 (= lt!94356 (containsKey!240 (toList!1233 lt!94274) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55803 (= (contains!1342 lt!94274 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) lt!94357)))

(declare-fun b!190323 () Bool)

(declare-fun lt!94358 () Unit!5743)

(assert (=> b!190323 (= e!125260 lt!94358)))

(assert (=> b!190323 (= lt!94358 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94274) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190323 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190324 () Bool)

(declare-fun Unit!5752 () Unit!5743)

(assert (=> b!190324 (= e!125260 Unit!5752)))

(declare-fun b!190325 () Bool)

(assert (=> b!190325 (= e!125261 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55803 c!34209) b!190323))

(assert (= (and d!55803 (not c!34209)) b!190324))

(assert (= (and d!55803 (not res!89969)) b!190325))

(assert (=> d!55803 m!216519))

(declare-fun m!216661 () Bool)

(assert (=> d!55803 m!216661))

(assert (=> b!190323 m!216519))

(declare-fun m!216663 () Bool)

(assert (=> b!190323 m!216663))

(assert (=> b!190323 m!216519))

(declare-fun m!216665 () Bool)

(assert (=> b!190323 m!216665))

(assert (=> b!190323 m!216665))

(declare-fun m!216667 () Bool)

(assert (=> b!190323 m!216667))

(assert (=> b!190325 m!216519))

(assert (=> b!190325 m!216665))

(assert (=> b!190325 m!216665))

(assert (=> b!190325 m!216667))

(assert (=> b!190237 d!55803))

(declare-fun d!55805 () Bool)

(declare-fun isEmpty!479 (Option!242) Bool)

(assert (=> d!55805 (= (isDefined!189 (getValueByKey!236 (toList!1233 lt!94189) key!828)) (not (isEmpty!479 (getValueByKey!236 (toList!1233 lt!94189) key!828))))))

(declare-fun bs!7612 () Bool)

(assert (= bs!7612 d!55805))

(assert (=> bs!7612 m!216633))

(declare-fun m!216669 () Bool)

(assert (=> bs!7612 m!216669))

(assert (=> b!190281 d!55805))

(declare-fun d!55807 () Bool)

(declare-fun c!34214 () Bool)

(assert (=> d!55807 (= c!34214 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (= (_1!1770 (h!3048 (toList!1233 lt!94189))) key!828)))))

(declare-fun e!125266 () Option!242)

(assert (=> d!55807 (= (getValueByKey!236 (toList!1233 lt!94189) key!828) e!125266)))

(declare-fun b!190335 () Bool)

(declare-fun e!125267 () Option!242)

(assert (=> b!190335 (= e!125266 e!125267)))

(declare-fun c!34215 () Bool)

(assert (=> b!190335 (= c!34215 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (not (= (_1!1770 (h!3048 (toList!1233 lt!94189))) key!828))))))

(declare-fun b!190337 () Bool)

(assert (=> b!190337 (= e!125267 None!240)))

(declare-fun b!190336 () Bool)

(assert (=> b!190336 (= e!125267 (getValueByKey!236 (t!7323 (toList!1233 lt!94189)) key!828))))

(declare-fun b!190334 () Bool)

(assert (=> b!190334 (= e!125266 (Some!241 (_2!1770 (h!3048 (toList!1233 lt!94189)))))))

(assert (= (and d!55807 c!34214) b!190334))

(assert (= (and d!55807 (not c!34214)) b!190335))

(assert (= (and b!190335 c!34215) b!190336))

(assert (= (and b!190335 (not c!34215)) b!190337))

(declare-fun m!216671 () Bool)

(assert (=> b!190336 m!216671))

(assert (=> b!190281 d!55807))

(declare-fun d!55809 () Bool)

(assert (=> d!55809 (= (+!301 (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) (tuple2!3519 key!828 v!309)) (getCurrentListMap!881 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)))))

(assert (=> d!55809 true))

(declare-fun _$5!146 () Unit!5743)

(assert (=> d!55809 (= (choose!1022 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (index!4859 lt!94184) key!828 v!309 (defaultEntry!3881 thiss!1248)) _$5!146)))

(declare-fun bs!7613 () Bool)

(assert (= bs!7613 d!55809))

(assert (=> bs!7613 m!216427))

(assert (=> bs!7613 m!216427))

(assert (=> bs!7613 m!216563))

(assert (=> bs!7613 m!216431))

(assert (=> bs!7613 m!216435))

(assert (=> d!55783 d!55809))

(assert (=> d!55783 d!55781))

(assert (=> d!55771 d!55777))

(declare-fun b!190354 () Bool)

(declare-fun e!125276 () Bool)

(declare-fun call!19215 () Bool)

(assert (=> b!190354 (= e!125276 (not call!19215))))

(declare-fun b!190355 () Bool)

(declare-fun res!89979 () Bool)

(assert (=> b!190355 (=> (not res!89979) (not e!125276))))

(declare-fun lt!94362 () SeekEntryResult!672)

(assert (=> b!190355 (= res!89979 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4861 lt!94362)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190356 () Bool)

(declare-fun e!125277 () Bool)

(assert (=> b!190356 (= e!125277 ((_ is Undefined!672) lt!94362))))

(declare-fun b!190357 () Bool)

(declare-fun res!89980 () Bool)

(assert (=> b!190357 (= res!89980 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4858 lt!94362)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125279 () Bool)

(assert (=> b!190357 (=> (not res!89980) (not e!125279))))

(declare-fun b!190358 () Bool)

(assert (=> b!190358 (= e!125279 (not call!19215))))

(declare-fun b!190359 () Bool)

(declare-fun e!125278 () Bool)

(assert (=> b!190359 (= e!125278 e!125277)))

(declare-fun c!34221 () Bool)

(assert (=> b!190359 (= c!34221 ((_ is MissingVacant!672) lt!94362))))

(declare-fun b!190360 () Bool)

(assert (=> b!190360 (= e!125278 e!125279)))

(declare-fun res!89978 () Bool)

(declare-fun call!19216 () Bool)

(assert (=> b!190360 (= res!89978 call!19216)))

(assert (=> b!190360 (=> (not res!89978) (not e!125279))))

(declare-fun bm!19212 () Bool)

(assert (=> bm!19212 (= call!19215 (arrayContainsKey!0 (_keys!5850 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun c!34220 () Bool)

(declare-fun bm!19213 () Bool)

(assert (=> bm!19213 (= call!19216 (inRange!0 (ite c!34220 (index!4858 lt!94362) (index!4861 lt!94362)) (mask!9079 thiss!1248)))))

(declare-fun d!55811 () Bool)

(assert (=> d!55811 e!125278))

(assert (=> d!55811 (= c!34220 ((_ is MissingZero!672) lt!94362))))

(assert (=> d!55811 (= lt!94362 (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(assert (=> d!55811 true))

(declare-fun _$34!1075 () Unit!5743)

(assert (=> d!55811 (= (choose!1020 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)) _$34!1075)))

(declare-fun b!190361 () Bool)

(declare-fun res!89981 () Bool)

(assert (=> b!190361 (=> (not res!89981) (not e!125276))))

(assert (=> b!190361 (= res!89981 call!19216)))

(assert (=> b!190361 (= e!125277 e!125276)))

(assert (= (and d!55811 c!34220) b!190360))

(assert (= (and d!55811 (not c!34220)) b!190359))

(assert (= (and b!190360 res!89978) b!190357))

(assert (= (and b!190357 res!89980) b!190358))

(assert (= (and b!190359 c!34221) b!190361))

(assert (= (and b!190359 (not c!34221)) b!190356))

(assert (= (and b!190361 res!89981) b!190355))

(assert (= (and b!190355 res!89979) b!190354))

(assert (= (or b!190360 b!190361) bm!19213))

(assert (= (or b!190358 b!190354) bm!19212))

(assert (=> d!55811 m!216419))

(declare-fun m!216673 () Bool)

(assert (=> bm!19213 m!216673))

(declare-fun m!216675 () Bool)

(assert (=> b!190355 m!216675))

(declare-fun m!216677 () Bool)

(assert (=> b!190357 m!216677))

(assert (=> bm!19212 m!216479))

(assert (=> d!55771 d!55811))

(assert (=> d!55771 d!55781))

(declare-fun d!55813 () Bool)

(assert (=> d!55813 (= (apply!179 (+!301 lt!94294 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) lt!94277) (apply!179 lt!94294 lt!94277))))

(declare-fun lt!94365 () Unit!5743)

(declare-fun choose!1023 (ListLongMap!2435 (_ BitVec 64) V!5563 (_ BitVec 64)) Unit!5743)

(assert (=> d!55813 (= lt!94365 (choose!1023 lt!94294 lt!94293 (minValue!3722 thiss!1248) lt!94277))))

(declare-fun e!125282 () Bool)

(assert (=> d!55813 e!125282))

(declare-fun res!89984 () Bool)

(assert (=> d!55813 (=> (not res!89984) (not e!125282))))

(assert (=> d!55813 (= res!89984 (contains!1342 lt!94294 lt!94277))))

(assert (=> d!55813 (= (addApplyDifferent!155 lt!94294 lt!94293 (minValue!3722 thiss!1248) lt!94277) lt!94365)))

(declare-fun b!190365 () Bool)

(assert (=> b!190365 (= e!125282 (not (= lt!94277 lt!94293)))))

(assert (= (and d!55813 res!89984) b!190365))

(declare-fun m!216679 () Bool)

(assert (=> d!55813 m!216679))

(assert (=> d!55813 m!216543))

(assert (=> d!55813 m!216533))

(assert (=> d!55813 m!216543))

(assert (=> d!55813 m!216553))

(declare-fun m!216681 () Bool)

(assert (=> d!55813 m!216681))

(assert (=> b!190223 d!55813))

(declare-fun d!55815 () Bool)

(assert (=> d!55815 (= (apply!179 (+!301 lt!94279 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) lt!94282) (apply!179 lt!94279 lt!94282))))

(declare-fun lt!94366 () Unit!5743)

(assert (=> d!55815 (= lt!94366 (choose!1023 lt!94279 lt!94291 (minValue!3722 thiss!1248) lt!94282))))

(declare-fun e!125283 () Bool)

(assert (=> d!55815 e!125283))

(declare-fun res!89985 () Bool)

(assert (=> d!55815 (=> (not res!89985) (not e!125283))))

(assert (=> d!55815 (= res!89985 (contains!1342 lt!94279 lt!94282))))

(assert (=> d!55815 (= (addApplyDifferent!155 lt!94279 lt!94291 (minValue!3722 thiss!1248) lt!94282) lt!94366)))

(declare-fun b!190366 () Bool)

(assert (=> b!190366 (= e!125283 (not (= lt!94282 lt!94291)))))

(assert (= (and d!55815 res!89985) b!190366))

(declare-fun m!216683 () Bool)

(assert (=> d!55815 m!216683))

(assert (=> d!55815 m!216529))

(assert (=> d!55815 m!216545))

(assert (=> d!55815 m!216529))

(assert (=> d!55815 m!216531))

(declare-fun m!216685 () Bool)

(assert (=> d!55815 m!216685))

(assert (=> b!190223 d!55815))

(declare-fun d!55817 () Bool)

(declare-fun e!125284 () Bool)

(assert (=> d!55817 e!125284))

(declare-fun res!89987 () Bool)

(assert (=> d!55817 (=> (not res!89987) (not e!125284))))

(declare-fun lt!94370 () ListLongMap!2435)

(assert (=> d!55817 (= res!89987 (contains!1342 lt!94370 (_1!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94367 () List!2415)

(assert (=> d!55817 (= lt!94370 (ListLongMap!2436 lt!94367))))

(declare-fun lt!94369 () Unit!5743)

(declare-fun lt!94368 () Unit!5743)

(assert (=> d!55817 (= lt!94369 lt!94368)))

(assert (=> d!55817 (= (getValueByKey!236 lt!94367 (_1!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))))))

(assert (=> d!55817 (= lt!94368 (lemmaContainsTupThenGetReturnValue!123 lt!94367 (_1!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))))))

(assert (=> d!55817 (= lt!94367 (insertStrictlySorted!126 (toList!1233 lt!94279) (_1!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))))))

(assert (=> d!55817 (= (+!301 lt!94279 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) lt!94370)))

(declare-fun b!190367 () Bool)

(declare-fun res!89986 () Bool)

(assert (=> b!190367 (=> (not res!89986) (not e!125284))))

(assert (=> b!190367 (= res!89986 (= (getValueByKey!236 (toList!1233 lt!94370) (_1!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))))))))

(declare-fun b!190368 () Bool)

(assert (=> b!190368 (= e!125284 (contains!1344 (toList!1233 lt!94370) (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))))))

(assert (= (and d!55817 res!89987) b!190367))

(assert (= (and b!190367 res!89986) b!190368))

(declare-fun m!216687 () Bool)

(assert (=> d!55817 m!216687))

(declare-fun m!216689 () Bool)

(assert (=> d!55817 m!216689))

(declare-fun m!216691 () Bool)

(assert (=> d!55817 m!216691))

(declare-fun m!216693 () Bool)

(assert (=> d!55817 m!216693))

(declare-fun m!216695 () Bool)

(assert (=> b!190367 m!216695))

(declare-fun m!216697 () Bool)

(assert (=> b!190368 m!216697))

(assert (=> b!190223 d!55817))

(declare-fun d!55819 () Bool)

(assert (=> d!55819 (= (apply!179 (+!301 lt!94281 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) lt!94289) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94281 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))) lt!94289)))))

(declare-fun bs!7614 () Bool)

(assert (= bs!7614 d!55819))

(declare-fun m!216699 () Bool)

(assert (=> bs!7614 m!216699))

(assert (=> bs!7614 m!216699))

(declare-fun m!216701 () Bool)

(assert (=> bs!7614 m!216701))

(assert (=> b!190223 d!55819))

(declare-fun d!55821 () Bool)

(assert (=> d!55821 (= (apply!179 (+!301 lt!94294 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) lt!94277) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94294 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))) lt!94277)))))

(declare-fun bs!7615 () Bool)

(assert (= bs!7615 d!55821))

(declare-fun m!216703 () Bool)

(assert (=> bs!7615 m!216703))

(assert (=> bs!7615 m!216703))

(declare-fun m!216705 () Bool)

(assert (=> bs!7615 m!216705))

(assert (=> b!190223 d!55821))

(declare-fun d!55823 () Bool)

(assert (=> d!55823 (= (apply!179 lt!94281 lt!94289) (get!2199 (getValueByKey!236 (toList!1233 lt!94281) lt!94289)))))

(declare-fun bs!7616 () Bool)

(assert (= bs!7616 d!55823))

(declare-fun m!216707 () Bool)

(assert (=> bs!7616 m!216707))

(assert (=> bs!7616 m!216707))

(declare-fun m!216709 () Bool)

(assert (=> bs!7616 m!216709))

(assert (=> b!190223 d!55823))

(declare-fun d!55825 () Bool)

(declare-fun e!125286 () Bool)

(assert (=> d!55825 e!125286))

(declare-fun res!89988 () Bool)

(assert (=> d!55825 (=> res!89988 e!125286)))

(declare-fun lt!94372 () Bool)

(assert (=> d!55825 (= res!89988 (not lt!94372))))

(declare-fun lt!94371 () Bool)

(assert (=> d!55825 (= lt!94372 lt!94371)))

(declare-fun lt!94374 () Unit!5743)

(declare-fun e!125285 () Unit!5743)

(assert (=> d!55825 (= lt!94374 e!125285)))

(declare-fun c!34222 () Bool)

(assert (=> d!55825 (= c!34222 lt!94371)))

(assert (=> d!55825 (= lt!94371 (containsKey!240 (toList!1233 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) lt!94287))))

(assert (=> d!55825 (= (contains!1342 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) lt!94287) lt!94372)))

(declare-fun b!190369 () Bool)

(declare-fun lt!94373 () Unit!5743)

(assert (=> b!190369 (= e!125285 lt!94373)))

(assert (=> b!190369 (= lt!94373 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) lt!94287))))

(assert (=> b!190369 (isDefined!189 (getValueByKey!236 (toList!1233 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) lt!94287))))

(declare-fun b!190370 () Bool)

(declare-fun Unit!5753 () Unit!5743)

(assert (=> b!190370 (= e!125285 Unit!5753)))

(declare-fun b!190371 () Bool)

(assert (=> b!190371 (= e!125286 (isDefined!189 (getValueByKey!236 (toList!1233 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) lt!94287)))))

(assert (= (and d!55825 c!34222) b!190369))

(assert (= (and d!55825 (not c!34222)) b!190370))

(assert (= (and d!55825 (not res!89988)) b!190371))

(declare-fun m!216711 () Bool)

(assert (=> d!55825 m!216711))

(declare-fun m!216713 () Bool)

(assert (=> b!190369 m!216713))

(declare-fun m!216715 () Bool)

(assert (=> b!190369 m!216715))

(assert (=> b!190369 m!216715))

(declare-fun m!216717 () Bool)

(assert (=> b!190369 m!216717))

(assert (=> b!190371 m!216715))

(assert (=> b!190371 m!216715))

(assert (=> b!190371 m!216717))

(assert (=> b!190223 d!55825))

(declare-fun d!55827 () Bool)

(declare-fun e!125287 () Bool)

(assert (=> d!55827 e!125287))

(declare-fun res!89990 () Bool)

(assert (=> d!55827 (=> (not res!89990) (not e!125287))))

(declare-fun lt!94378 () ListLongMap!2435)

(assert (=> d!55827 (= res!89990 (contains!1342 lt!94378 (_1!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94375 () List!2415)

(assert (=> d!55827 (= lt!94378 (ListLongMap!2436 lt!94375))))

(declare-fun lt!94377 () Unit!5743)

(declare-fun lt!94376 () Unit!5743)

(assert (=> d!55827 (= lt!94377 lt!94376)))

(assert (=> d!55827 (= (getValueByKey!236 lt!94375 (_1!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))))))

(assert (=> d!55827 (= lt!94376 (lemmaContainsTupThenGetReturnValue!123 lt!94375 (_1!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))))))

(assert (=> d!55827 (= lt!94375 (insertStrictlySorted!126 (toList!1233 lt!94294) (_1!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))))))

(assert (=> d!55827 (= (+!301 lt!94294 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))) lt!94378)))

(declare-fun b!190372 () Bool)

(declare-fun res!89989 () Bool)

(assert (=> b!190372 (=> (not res!89989) (not e!125287))))

(assert (=> b!190372 (= res!89989 (= (getValueByKey!236 (toList!1233 lt!94378) (_1!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))))))))

(declare-fun b!190373 () Bool)

(assert (=> b!190373 (= e!125287 (contains!1344 (toList!1233 lt!94378) (tuple2!3519 lt!94293 (minValue!3722 thiss!1248))))))

(assert (= (and d!55827 res!89990) b!190372))

(assert (= (and b!190372 res!89989) b!190373))

(declare-fun m!216719 () Bool)

(assert (=> d!55827 m!216719))

(declare-fun m!216721 () Bool)

(assert (=> d!55827 m!216721))

(declare-fun m!216723 () Bool)

(assert (=> d!55827 m!216723))

(declare-fun m!216725 () Bool)

(assert (=> d!55827 m!216725))

(declare-fun m!216727 () Bool)

(assert (=> b!190372 m!216727))

(declare-fun m!216729 () Bool)

(assert (=> b!190373 m!216729))

(assert (=> b!190223 d!55827))

(declare-fun d!55829 () Bool)

(declare-fun e!125288 () Bool)

(assert (=> d!55829 e!125288))

(declare-fun res!89992 () Bool)

(assert (=> d!55829 (=> (not res!89992) (not e!125288))))

(declare-fun lt!94382 () ListLongMap!2435)

(assert (=> d!55829 (= res!89992 (contains!1342 lt!94382 (_1!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))))))

(declare-fun lt!94379 () List!2415)

(assert (=> d!55829 (= lt!94382 (ListLongMap!2436 lt!94379))))

(declare-fun lt!94381 () Unit!5743)

(declare-fun lt!94380 () Unit!5743)

(assert (=> d!55829 (= lt!94381 lt!94380)))

(assert (=> d!55829 (= (getValueByKey!236 lt!94379 (_1!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55829 (= lt!94380 (lemmaContainsTupThenGetReturnValue!123 lt!94379 (_1!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55829 (= lt!94379 (insertStrictlySorted!126 (toList!1233 lt!94285) (_1!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55829 (= (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) lt!94382)))

(declare-fun b!190374 () Bool)

(declare-fun res!89991 () Bool)

(assert (=> b!190374 (=> (not res!89991) (not e!125288))))

(assert (=> b!190374 (= res!89991 (= (getValueByKey!236 (toList!1233 lt!94382) (_1!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))))))))

(declare-fun b!190375 () Bool)

(assert (=> b!190375 (= e!125288 (contains!1344 (toList!1233 lt!94382) (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))))))

(assert (= (and d!55829 res!89992) b!190374))

(assert (= (and b!190374 res!89991) b!190375))

(declare-fun m!216731 () Bool)

(assert (=> d!55829 m!216731))

(declare-fun m!216733 () Bool)

(assert (=> d!55829 m!216733))

(declare-fun m!216735 () Bool)

(assert (=> d!55829 m!216735))

(declare-fun m!216737 () Bool)

(assert (=> d!55829 m!216737))

(declare-fun m!216739 () Bool)

(assert (=> b!190374 m!216739))

(declare-fun m!216741 () Bool)

(assert (=> b!190375 m!216741))

(assert (=> b!190223 d!55829))

(declare-fun d!55831 () Bool)

(assert (=> d!55831 (contains!1342 (+!301 lt!94285 (tuple2!3519 lt!94288 (zeroValue!3722 thiss!1248))) lt!94287)))

(declare-fun lt!94385 () Unit!5743)

(declare-fun choose!1024 (ListLongMap!2435 (_ BitVec 64) V!5563 (_ BitVec 64)) Unit!5743)

(assert (=> d!55831 (= lt!94385 (choose!1024 lt!94285 lt!94288 (zeroValue!3722 thiss!1248) lt!94287))))

(assert (=> d!55831 (contains!1342 lt!94285 lt!94287)))

(assert (=> d!55831 (= (addStillContains!155 lt!94285 lt!94288 (zeroValue!3722 thiss!1248) lt!94287) lt!94385)))

(declare-fun bs!7617 () Bool)

(assert (= bs!7617 d!55831))

(assert (=> bs!7617 m!216547))

(assert (=> bs!7617 m!216547))

(assert (=> bs!7617 m!216549))

(declare-fun m!216743 () Bool)

(assert (=> bs!7617 m!216743))

(declare-fun m!216745 () Bool)

(assert (=> bs!7617 m!216745))

(assert (=> b!190223 d!55831))

(declare-fun d!55833 () Bool)

(assert (=> d!55833 (= (apply!179 lt!94279 lt!94282) (get!2199 (getValueByKey!236 (toList!1233 lt!94279) lt!94282)))))

(declare-fun bs!7618 () Bool)

(assert (= bs!7618 d!55833))

(declare-fun m!216747 () Bool)

(assert (=> bs!7618 m!216747))

(assert (=> bs!7618 m!216747))

(declare-fun m!216749 () Bool)

(assert (=> bs!7618 m!216749))

(assert (=> b!190223 d!55833))

(declare-fun b!190401 () Bool)

(declare-fun e!125309 () ListLongMap!2435)

(declare-fun call!19219 () ListLongMap!2435)

(assert (=> b!190401 (= e!125309 call!19219)))

(declare-fun b!190402 () Bool)

(declare-fun res!90003 () Bool)

(declare-fun e!125303 () Bool)

(assert (=> b!190402 (=> (not res!90003) (not e!125303))))

(declare-fun lt!94403 () ListLongMap!2435)

(assert (=> b!190402 (= res!90003 (not (contains!1342 lt!94403 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190403 () Bool)

(declare-fun e!125308 () ListLongMap!2435)

(assert (=> b!190403 (= e!125308 (ListLongMap!2436 Nil!2412))))

(declare-fun e!125307 () Bool)

(declare-fun b!190404 () Bool)

(assert (=> b!190404 (= e!125307 (= lt!94403 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3881 thiss!1248))))))

(declare-fun b!190405 () Bool)

(declare-fun e!125304 () Bool)

(assert (=> b!190405 (= e!125304 e!125307)))

(declare-fun c!34232 () Bool)

(assert (=> b!190405 (= c!34232 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190406 () Bool)

(assert (=> b!190406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> b!190406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4142 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))))))))

(declare-fun e!125306 () Bool)

(assert (=> b!190406 (= e!125306 (= (apply!179 lt!94403 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190408 () Bool)

(declare-fun isEmpty!480 (ListLongMap!2435) Bool)

(assert (=> b!190408 (= e!125307 (isEmpty!480 lt!94403))))

(declare-fun b!190409 () Bool)

(assert (=> b!190409 (= e!125303 e!125304)))

(declare-fun c!34234 () Bool)

(declare-fun e!125305 () Bool)

(assert (=> b!190409 (= c!34234 e!125305)))

(declare-fun res!90004 () Bool)

(assert (=> b!190409 (=> (not res!90004) (not e!125305))))

(assert (=> b!190409 (= res!90004 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun bm!19216 () Bool)

(assert (=> bm!19216 (= call!19219 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3881 thiss!1248)))))

(declare-fun b!190410 () Bool)

(assert (=> b!190410 (= e!125308 e!125309)))

(declare-fun c!34233 () Bool)

(assert (=> b!190410 (= c!34233 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190411 () Bool)

(declare-fun lt!94400 () Unit!5743)

(declare-fun lt!94402 () Unit!5743)

(assert (=> b!190411 (= lt!94400 lt!94402)))

(declare-fun lt!94406 () (_ BitVec 64))

(declare-fun lt!94405 () (_ BitVec 64))

(declare-fun lt!94404 () V!5563)

(declare-fun lt!94401 () ListLongMap!2435)

(assert (=> b!190411 (not (contains!1342 (+!301 lt!94401 (tuple2!3519 lt!94406 lt!94404)) lt!94405))))

(declare-fun addStillNotContains!93 (ListLongMap!2435 (_ BitVec 64) V!5563 (_ BitVec 64)) Unit!5743)

(assert (=> b!190411 (= lt!94402 (addStillNotContains!93 lt!94401 lt!94406 lt!94404 lt!94405))))

(assert (=> b!190411 (= lt!94405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190411 (= lt!94404 (get!2198 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190411 (= lt!94406 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190411 (= lt!94401 call!19219)))

(assert (=> b!190411 (= e!125309 (+!301 call!19219 (tuple2!3519 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) (get!2198 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190412 () Bool)

(assert (=> b!190412 (= e!125304 e!125306)))

(assert (=> b!190412 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun res!90001 () Bool)

(assert (=> b!190412 (= res!90001 (contains!1342 lt!94403 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190412 (=> (not res!90001) (not e!125306))))

(declare-fun b!190407 () Bool)

(assert (=> b!190407 (= e!125305 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190407 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!55835 () Bool)

(assert (=> d!55835 e!125303))

(declare-fun res!90002 () Bool)

(assert (=> d!55835 (=> (not res!90002) (not e!125303))))

(assert (=> d!55835 (= res!90002 (not (contains!1342 lt!94403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55835 (= lt!94403 e!125308)))

(declare-fun c!34231 () Bool)

(assert (=> d!55835 (= c!34231 (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55835 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55835 (= (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248))) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) lt!94403)))

(assert (= (and d!55835 c!34231) b!190403))

(assert (= (and d!55835 (not c!34231)) b!190410))

(assert (= (and b!190410 c!34233) b!190411))

(assert (= (and b!190410 (not c!34233)) b!190401))

(assert (= (or b!190411 b!190401) bm!19216))

(assert (= (and d!55835 res!90002) b!190402))

(assert (= (and b!190402 res!90003) b!190409))

(assert (= (and b!190409 res!90004) b!190407))

(assert (= (and b!190409 c!34234) b!190412))

(assert (= (and b!190409 (not c!34234)) b!190405))

(assert (= (and b!190412 res!90001) b!190406))

(assert (= (and b!190405 c!34232) b!190404))

(assert (= (and b!190405 (not c!34232)) b!190408))

(declare-fun b_lambda!7351 () Bool)

(assert (=> (not b_lambda!7351) (not b!190406)))

(assert (=> b!190406 t!7326))

(declare-fun b_and!11319 () Bool)

(assert (= b_and!11317 (and (=> t!7326 result!4885) b_and!11319)))

(declare-fun b_lambda!7353 () Bool)

(assert (=> (not b_lambda!7353) (not b!190411)))

(assert (=> b!190411 t!7326))

(declare-fun b_and!11321 () Bool)

(assert (= b_and!11319 (and (=> t!7326 result!4885) b_and!11321)))

(declare-fun m!216751 () Bool)

(assert (=> d!55835 m!216751))

(assert (=> d!55835 m!216437))

(declare-fun m!216753 () Bool)

(assert (=> b!190404 m!216753))

(declare-fun m!216755 () Bool)

(assert (=> b!190411 m!216755))

(assert (=> b!190411 m!216513))

(assert (=> b!190411 m!216519))

(declare-fun m!216757 () Bool)

(assert (=> b!190411 m!216757))

(assert (=> b!190411 m!216515))

(assert (=> b!190411 m!216513))

(assert (=> b!190411 m!216517))

(assert (=> b!190411 m!216755))

(declare-fun m!216759 () Bool)

(assert (=> b!190411 m!216759))

(declare-fun m!216761 () Bool)

(assert (=> b!190411 m!216761))

(assert (=> b!190411 m!216515))

(assert (=> b!190410 m!216519))

(assert (=> b!190410 m!216519))

(assert (=> b!190410 m!216525))

(declare-fun m!216763 () Bool)

(assert (=> b!190408 m!216763))

(assert (=> b!190412 m!216519))

(assert (=> b!190412 m!216519))

(declare-fun m!216765 () Bool)

(assert (=> b!190412 m!216765))

(declare-fun m!216767 () Bool)

(assert (=> b!190402 m!216767))

(assert (=> bm!19216 m!216753))

(assert (=> b!190407 m!216519))

(assert (=> b!190407 m!216519))

(assert (=> b!190407 m!216525))

(assert (=> b!190406 m!216513))

(assert (=> b!190406 m!216519))

(assert (=> b!190406 m!216519))

(declare-fun m!216769 () Bool)

(assert (=> b!190406 m!216769))

(assert (=> b!190406 m!216515))

(assert (=> b!190406 m!216513))

(assert (=> b!190406 m!216517))

(assert (=> b!190406 m!216515))

(assert (=> b!190223 d!55835))

(declare-fun d!55837 () Bool)

(assert (=> d!55837 (= (apply!179 (+!301 lt!94279 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248))) lt!94282) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94279 (tuple2!3519 lt!94291 (minValue!3722 thiss!1248)))) lt!94282)))))

(declare-fun bs!7619 () Bool)

(assert (= bs!7619 d!55837))

(declare-fun m!216771 () Bool)

(assert (=> bs!7619 m!216771))

(assert (=> bs!7619 m!216771))

(declare-fun m!216773 () Bool)

(assert (=> bs!7619 m!216773))

(assert (=> b!190223 d!55837))

(declare-fun d!55839 () Bool)

(declare-fun e!125310 () Bool)

(assert (=> d!55839 e!125310))

(declare-fun res!90006 () Bool)

(assert (=> d!55839 (=> (not res!90006) (not e!125310))))

(declare-fun lt!94410 () ListLongMap!2435)

(assert (=> d!55839 (= res!90006 (contains!1342 lt!94410 (_1!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))))))

(declare-fun lt!94407 () List!2415)

(assert (=> d!55839 (= lt!94410 (ListLongMap!2436 lt!94407))))

(declare-fun lt!94409 () Unit!5743)

(declare-fun lt!94408 () Unit!5743)

(assert (=> d!55839 (= lt!94409 lt!94408)))

(assert (=> d!55839 (= (getValueByKey!236 lt!94407 (_1!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55839 (= lt!94408 (lemmaContainsTupThenGetReturnValue!123 lt!94407 (_1!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55839 (= lt!94407 (insertStrictlySorted!126 (toList!1233 lt!94281) (_1!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55839 (= (+!301 lt!94281 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) lt!94410)))

(declare-fun b!190413 () Bool)

(declare-fun res!90005 () Bool)

(assert (=> b!190413 (=> (not res!90005) (not e!125310))))

(assert (=> b!190413 (= res!90005 (= (getValueByKey!236 (toList!1233 lt!94410) (_1!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))))))))

(declare-fun b!190414 () Bool)

(assert (=> b!190414 (= e!125310 (contains!1344 (toList!1233 lt!94410) (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))))))

(assert (= (and d!55839 res!90006) b!190413))

(assert (= (and b!190413 res!90005) b!190414))

(declare-fun m!216775 () Bool)

(assert (=> d!55839 m!216775))

(declare-fun m!216777 () Bool)

(assert (=> d!55839 m!216777))

(declare-fun m!216779 () Bool)

(assert (=> d!55839 m!216779))

(declare-fun m!216781 () Bool)

(assert (=> d!55839 m!216781))

(declare-fun m!216783 () Bool)

(assert (=> b!190413 m!216783))

(declare-fun m!216785 () Bool)

(assert (=> b!190414 m!216785))

(assert (=> b!190223 d!55839))

(declare-fun d!55841 () Bool)

(assert (=> d!55841 (= (apply!179 (+!301 lt!94281 (tuple2!3519 lt!94284 (zeroValue!3722 thiss!1248))) lt!94289) (apply!179 lt!94281 lt!94289))))

(declare-fun lt!94411 () Unit!5743)

(assert (=> d!55841 (= lt!94411 (choose!1023 lt!94281 lt!94284 (zeroValue!3722 thiss!1248) lt!94289))))

(declare-fun e!125311 () Bool)

(assert (=> d!55841 e!125311))

(declare-fun res!90007 () Bool)

(assert (=> d!55841 (=> (not res!90007) (not e!125311))))

(assert (=> d!55841 (= res!90007 (contains!1342 lt!94281 lt!94289))))

(assert (=> d!55841 (= (addApplyDifferent!155 lt!94281 lt!94284 (zeroValue!3722 thiss!1248) lt!94289) lt!94411)))

(declare-fun b!190415 () Bool)

(assert (=> b!190415 (= e!125311 (not (= lt!94289 lt!94284)))))

(assert (= (and d!55841 res!90007) b!190415))

(declare-fun m!216787 () Bool)

(assert (=> d!55841 m!216787))

(assert (=> d!55841 m!216539))

(assert (=> d!55841 m!216557))

(assert (=> d!55841 m!216539))

(assert (=> d!55841 m!216541))

(declare-fun m!216789 () Bool)

(assert (=> d!55841 m!216789))

(assert (=> b!190223 d!55841))

(declare-fun d!55843 () Bool)

(assert (=> d!55843 (= (apply!179 lt!94294 lt!94277) (get!2199 (getValueByKey!236 (toList!1233 lt!94294) lt!94277)))))

(declare-fun bs!7620 () Bool)

(assert (= bs!7620 d!55843))

(declare-fun m!216791 () Bool)

(assert (=> bs!7620 m!216791))

(assert (=> bs!7620 m!216791))

(declare-fun m!216793 () Bool)

(assert (=> bs!7620 m!216793))

(assert (=> b!190223 d!55843))

(declare-fun b!190426 () Bool)

(declare-fun e!125321 () Bool)

(declare-fun contains!1345 (List!2417 (_ BitVec 64)) Bool)

(assert (=> b!190426 (= e!125321 (contains!1345 Nil!2414 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190428 () Bool)

(declare-fun e!125320 () Bool)

(declare-fun call!19222 () Bool)

(assert (=> b!190428 (= e!125320 call!19222)))

(declare-fun b!190429 () Bool)

(assert (=> b!190429 (= e!125320 call!19222)))

(declare-fun b!190427 () Bool)

(declare-fun e!125323 () Bool)

(declare-fun e!125322 () Bool)

(assert (=> b!190427 (= e!125323 e!125322)))

(declare-fun res!90015 () Bool)

(assert (=> b!190427 (=> (not res!90015) (not e!125322))))

(assert (=> b!190427 (= res!90015 (not e!125321))))

(declare-fun res!90016 () Bool)

(assert (=> b!190427 (=> (not res!90016) (not e!125321))))

(assert (=> b!190427 (= res!90016 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55845 () Bool)

(declare-fun res!90014 () Bool)

(assert (=> d!55845 (=> res!90014 e!125323)))

(assert (=> d!55845 (= res!90014 (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55845 (= (arrayNoDuplicates!0 (_keys!5850 thiss!1248) #b00000000000000000000000000000000 Nil!2414) e!125323)))

(declare-fun bm!19219 () Bool)

(declare-fun c!34237 () Bool)

(assert (=> bm!19219 (= call!19222 (arrayNoDuplicates!0 (_keys!5850 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34237 (Cons!2413 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) Nil!2414) Nil!2414)))))

(declare-fun b!190430 () Bool)

(assert (=> b!190430 (= e!125322 e!125320)))

(assert (=> b!190430 (= c!34237 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55845 (not res!90014)) b!190427))

(assert (= (and b!190427 res!90016) b!190426))

(assert (= (and b!190427 res!90015) b!190430))

(assert (= (and b!190430 c!34237) b!190429))

(assert (= (and b!190430 (not c!34237)) b!190428))

(assert (= (or b!190429 b!190428) bm!19219))

(assert (=> b!190426 m!216519))

(assert (=> b!190426 m!216519))

(declare-fun m!216795 () Bool)

(assert (=> b!190426 m!216795))

(assert (=> b!190427 m!216519))

(assert (=> b!190427 m!216519))

(assert (=> b!190427 m!216525))

(assert (=> bm!19219 m!216519))

(declare-fun m!216797 () Bool)

(assert (=> bm!19219 m!216797))

(assert (=> b!190430 m!216519))

(assert (=> b!190430 m!216519))

(assert (=> b!190430 m!216525))

(assert (=> b!190290 d!55845))

(declare-fun d!55847 () Bool)

(assert (=> d!55847 (= (inRange!0 (index!4859 lt!94219) (mask!9079 thiss!1248)) (and (bvsge (index!4859 lt!94219) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94219) (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!190158 d!55847))

(declare-fun d!55849 () Bool)

(assert (=> d!55849 (= (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!190257 d!55849))

(declare-fun d!55851 () Bool)

(assert (=> d!55851 (= (apply!179 lt!94274 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!236 (toList!1233 lt!94274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7621 () Bool)

(assert (= bs!7621 d!55851))

(declare-fun m!216799 () Bool)

(assert (=> bs!7621 m!216799))

(assert (=> bs!7621 m!216799))

(declare-fun m!216801 () Bool)

(assert (=> bs!7621 m!216801))

(assert (=> b!190234 d!55851))

(declare-fun d!55853 () Bool)

(declare-fun e!125325 () Bool)

(assert (=> d!55853 e!125325))

(declare-fun res!90017 () Bool)

(assert (=> d!55853 (=> res!90017 e!125325)))

(declare-fun lt!94413 () Bool)

(assert (=> d!55853 (= res!90017 (not lt!94413))))

(declare-fun lt!94412 () Bool)

(assert (=> d!55853 (= lt!94413 lt!94412)))

(declare-fun lt!94415 () Unit!5743)

(declare-fun e!125324 () Unit!5743)

(assert (=> d!55853 (= lt!94415 e!125324)))

(declare-fun c!34238 () Bool)

(assert (=> d!55853 (= c!34238 lt!94412)))

(assert (=> d!55853 (= lt!94412 (containsKey!240 (toList!1233 lt!94299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55853 (= (contains!1342 lt!94299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94413)))

(declare-fun b!190431 () Bool)

(declare-fun lt!94414 () Unit!5743)

(assert (=> b!190431 (= e!125324 lt!94414)))

(assert (=> b!190431 (= lt!94414 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190431 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190432 () Bool)

(declare-fun Unit!5754 () Unit!5743)

(assert (=> b!190432 (= e!125324 Unit!5754)))

(declare-fun b!190433 () Bool)

(assert (=> b!190433 (= e!125325 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55853 c!34238) b!190431))

(assert (= (and d!55853 (not c!34238)) b!190432))

(assert (= (and d!55853 (not res!90017)) b!190433))

(declare-fun m!216803 () Bool)

(assert (=> d!55853 m!216803))

(declare-fun m!216805 () Bool)

(assert (=> b!190431 m!216805))

(declare-fun m!216807 () Bool)

(assert (=> b!190431 m!216807))

(assert (=> b!190431 m!216807))

(declare-fun m!216809 () Bool)

(assert (=> b!190431 m!216809))

(assert (=> b!190433 m!216807))

(assert (=> b!190433 m!216807))

(assert (=> b!190433 m!216809))

(assert (=> bm!19199 d!55853))

(declare-fun d!55855 () Bool)

(assert (=> d!55855 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94189) key!828))))

(declare-fun lt!94418 () Unit!5743)

(declare-fun choose!1025 (List!2415 (_ BitVec 64)) Unit!5743)

(assert (=> d!55855 (= lt!94418 (choose!1025 (toList!1233 lt!94189) key!828))))

(declare-fun e!125328 () Bool)

(assert (=> d!55855 e!125328))

(declare-fun res!90020 () Bool)

(assert (=> d!55855 (=> (not res!90020) (not e!125328))))

(declare-fun isStrictlySorted!353 (List!2415) Bool)

(assert (=> d!55855 (= res!90020 (isStrictlySorted!353 (toList!1233 lt!94189)))))

(assert (=> d!55855 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94189) key!828) lt!94418)))

(declare-fun b!190436 () Bool)

(assert (=> b!190436 (= e!125328 (containsKey!240 (toList!1233 lt!94189) key!828))))

(assert (= (and d!55855 res!90020) b!190436))

(assert (=> d!55855 m!216633))

(assert (=> d!55855 m!216633))

(assert (=> d!55855 m!216635))

(declare-fun m!216811 () Bool)

(assert (=> d!55855 m!216811))

(declare-fun m!216813 () Bool)

(assert (=> d!55855 m!216813))

(assert (=> b!190436 m!216629))

(assert (=> b!190279 d!55855))

(assert (=> b!190279 d!55805))

(assert (=> b!190279 d!55807))

(declare-fun b!190445 () Bool)

(declare-fun res!90030 () Bool)

(declare-fun e!125331 () Bool)

(assert (=> b!190445 (=> (not res!90030) (not e!125331))))

(assert (=> b!190445 (= res!90030 (and (= (size!4142 (_values!3864 thiss!1248)) (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001)) (= (size!4141 (_keys!5850 thiss!1248)) (size!4142 (_values!3864 thiss!1248))) (bvsge (_size!1378 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1378 thiss!1248) (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!190447 () Bool)

(declare-fun res!90031 () Bool)

(assert (=> b!190447 (=> (not res!90031) (not e!125331))))

(declare-fun size!4145 (LongMapFixedSize!2658) (_ BitVec 32))

(assert (=> b!190447 (= res!90031 (= (size!4145 thiss!1248) (bvadd (_size!1378 thiss!1248) (bvsdiv (bvadd (extraKeys!3618 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!55857 () Bool)

(declare-fun res!90029 () Bool)

(assert (=> d!55857 (=> (not res!90029) (not e!125331))))

(assert (=> d!55857 (= res!90029 (validMask!0 (mask!9079 thiss!1248)))))

(assert (=> d!55857 (= (simpleValid!195 thiss!1248) e!125331)))

(declare-fun b!190446 () Bool)

(declare-fun res!90032 () Bool)

(assert (=> b!190446 (=> (not res!90032) (not e!125331))))

(assert (=> b!190446 (= res!90032 (bvsge (size!4145 thiss!1248) (_size!1378 thiss!1248)))))

(declare-fun b!190448 () Bool)

(assert (=> b!190448 (= e!125331 (and (bvsge (extraKeys!3618 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3618 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1378 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!55857 res!90029) b!190445))

(assert (= (and b!190445 res!90030) b!190446))

(assert (= (and b!190446 res!90032) b!190447))

(assert (= (and b!190447 res!90031) b!190448))

(declare-fun m!216815 () Bool)

(assert (=> b!190447 m!216815))

(assert (=> d!55857 m!216437))

(assert (=> b!190446 m!216815))

(assert (=> d!55795 d!55857))

(assert (=> b!190220 d!55849))

(declare-fun d!55859 () Bool)

(declare-fun e!125332 () Bool)

(assert (=> d!55859 e!125332))

(declare-fun res!90034 () Bool)

(assert (=> d!55859 (=> (not res!90034) (not e!125332))))

(declare-fun lt!94422 () ListLongMap!2435)

(assert (=> d!55859 (= res!90034 (contains!1342 lt!94422 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94419 () List!2415)

(assert (=> d!55859 (= lt!94422 (ListLongMap!2436 lt!94419))))

(declare-fun lt!94421 () Unit!5743)

(declare-fun lt!94420 () Unit!5743)

(assert (=> d!55859 (= lt!94421 lt!94420)))

(assert (=> d!55859 (= (getValueByKey!236 lt!94419 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55859 (= lt!94420 (lemmaContainsTupThenGetReturnValue!123 lt!94419 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55859 (= lt!94419 (insertStrictlySorted!126 (toList!1233 call!19201) (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55859 (= (+!301 call!19201 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) lt!94422)))

(declare-fun b!190449 () Bool)

(declare-fun res!90033 () Bool)

(assert (=> b!190449 (=> (not res!90033) (not e!125332))))

(assert (=> b!190449 (= res!90033 (= (getValueByKey!236 (toList!1233 lt!94422) (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(declare-fun b!190450 () Bool)

(assert (=> b!190450 (= e!125332 (contains!1344 (toList!1233 lt!94422) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))

(assert (= (and d!55859 res!90034) b!190449))

(assert (= (and b!190449 res!90033) b!190450))

(declare-fun m!216817 () Bool)

(assert (=> d!55859 m!216817))

(declare-fun m!216819 () Bool)

(assert (=> d!55859 m!216819))

(declare-fun m!216821 () Bool)

(assert (=> d!55859 m!216821))

(declare-fun m!216823 () Bool)

(assert (=> d!55859 m!216823))

(declare-fun m!216825 () Bool)

(assert (=> b!190449 m!216825))

(declare-fun m!216827 () Bool)

(assert (=> b!190450 m!216827))

(assert (=> b!190255 d!55859))

(assert (=> d!55779 d!55781))

(declare-fun e!125340 () SeekEntryResult!672)

(declare-fun b!190463 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!190463 (= e!125340 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20474 lt!94227) #b00000000000000000000000000000001) (nextIndex!0 (index!4860 lt!94227) (x!20474 lt!94227) (mask!9079 thiss!1248)) (index!4860 lt!94227) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun b!190465 () Bool)

(declare-fun e!125341 () SeekEntryResult!672)

(declare-fun e!125339 () SeekEntryResult!672)

(assert (=> b!190465 (= e!125341 e!125339)))

(declare-fun c!34247 () Bool)

(declare-fun lt!94428 () (_ BitVec 64))

(assert (=> b!190465 (= c!34247 (= lt!94428 key!828))))

(declare-fun b!190466 () Bool)

(assert (=> b!190466 (= e!125339 (Found!672 (index!4860 lt!94227)))))

(declare-fun b!190467 () Bool)

(declare-fun c!34245 () Bool)

(assert (=> b!190467 (= c!34245 (= lt!94428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190467 (= e!125339 e!125340)))

(declare-fun b!190468 () Bool)

(assert (=> b!190468 (= e!125340 (MissingVacant!672 (index!4860 lt!94227)))))

(declare-fun b!190464 () Bool)

(assert (=> b!190464 (= e!125341 Undefined!672)))

(declare-fun d!55861 () Bool)

(declare-fun lt!94427 () SeekEntryResult!672)

(assert (=> d!55861 (and (or ((_ is Undefined!672) lt!94427) (not ((_ is Found!672) lt!94427)) (and (bvsge (index!4859 lt!94427) #b00000000000000000000000000000000) (bvslt (index!4859 lt!94427) (size!4141 (_keys!5850 thiss!1248))))) (or ((_ is Undefined!672) lt!94427) ((_ is Found!672) lt!94427) (not ((_ is MissingVacant!672) lt!94427)) (not (= (index!4861 lt!94427) (index!4860 lt!94227))) (and (bvsge (index!4861 lt!94427) #b00000000000000000000000000000000) (bvslt (index!4861 lt!94427) (size!4141 (_keys!5850 thiss!1248))))) (or ((_ is Undefined!672) lt!94427) (ite ((_ is Found!672) lt!94427) (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4859 lt!94427)) key!828) (and ((_ is MissingVacant!672) lt!94427) (= (index!4861 lt!94427) (index!4860 lt!94227)) (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4861 lt!94427)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55861 (= lt!94427 e!125341)))

(declare-fun c!34246 () Bool)

(assert (=> d!55861 (= c!34246 (bvsge (x!20474 lt!94227) #b01111111111111111111111111111110))))

(assert (=> d!55861 (= lt!94428 (select (arr!3821 (_keys!5850 thiss!1248)) (index!4860 lt!94227)))))

(assert (=> d!55861 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55861 (= (seekKeyOrZeroReturnVacant!0 (x!20474 lt!94227) (index!4860 lt!94227) (index!4860 lt!94227) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)) lt!94427)))

(assert (= (and d!55861 c!34246) b!190464))

(assert (= (and d!55861 (not c!34246)) b!190465))

(assert (= (and b!190465 c!34247) b!190466))

(assert (= (and b!190465 (not c!34247)) b!190467))

(assert (= (and b!190467 c!34245) b!190468))

(assert (= (and b!190467 (not c!34245)) b!190463))

(declare-fun m!216829 () Bool)

(assert (=> b!190463 m!216829))

(assert (=> b!190463 m!216829))

(declare-fun m!216831 () Bool)

(assert (=> b!190463 m!216831))

(declare-fun m!216833 () Bool)

(assert (=> d!55861 m!216833))

(declare-fun m!216835 () Bool)

(assert (=> d!55861 m!216835))

(assert (=> d!55861 m!216489))

(assert (=> d!55861 m!216437))

(assert (=> b!190172 d!55861))

(declare-fun lt!94431 () Bool)

(declare-fun d!55863 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!151 (List!2415) (InoxSet tuple2!3518))

(assert (=> d!55863 (= lt!94431 (select (content!151 (toList!1233 lt!94331)) (tuple2!3519 key!828 v!309)))))

(declare-fun e!125347 () Bool)

(assert (=> d!55863 (= lt!94431 e!125347)))

(declare-fun res!90039 () Bool)

(assert (=> d!55863 (=> (not res!90039) (not e!125347))))

(assert (=> d!55863 (= res!90039 ((_ is Cons!2411) (toList!1233 lt!94331)))))

(assert (=> d!55863 (= (contains!1344 (toList!1233 lt!94331) (tuple2!3519 key!828 v!309)) lt!94431)))

(declare-fun b!190473 () Bool)

(declare-fun e!125346 () Bool)

(assert (=> b!190473 (= e!125347 e!125346)))

(declare-fun res!90040 () Bool)

(assert (=> b!190473 (=> res!90040 e!125346)))

(assert (=> b!190473 (= res!90040 (= (h!3048 (toList!1233 lt!94331)) (tuple2!3519 key!828 v!309)))))

(declare-fun b!190474 () Bool)

(assert (=> b!190474 (= e!125346 (contains!1344 (t!7323 (toList!1233 lt!94331)) (tuple2!3519 key!828 v!309)))))

(assert (= (and d!55863 res!90039) b!190473))

(assert (= (and b!190473 (not res!90040)) b!190474))

(declare-fun m!216837 () Bool)

(assert (=> d!55863 m!216837))

(declare-fun m!216839 () Bool)

(assert (=> d!55863 m!216839))

(declare-fun m!216841 () Bool)

(assert (=> b!190474 m!216841))

(assert (=> b!190272 d!55863))

(declare-fun d!55865 () Bool)

(declare-fun res!90045 () Bool)

(declare-fun e!125352 () Bool)

(assert (=> d!55865 (=> res!90045 e!125352)))

(assert (=> d!55865 (= res!90045 (= (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55865 (= (arrayContainsKey!0 (_keys!5850 thiss!1248) key!828 #b00000000000000000000000000000000) e!125352)))

(declare-fun b!190479 () Bool)

(declare-fun e!125353 () Bool)

(assert (=> b!190479 (= e!125352 e!125353)))

(declare-fun res!90046 () Bool)

(assert (=> b!190479 (=> (not res!90046) (not e!125353))))

(assert (=> b!190479 (= res!90046 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190480 () Bool)

(assert (=> b!190480 (= e!125353 (arrayContainsKey!0 (_keys!5850 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55865 (not res!90045)) b!190479))

(assert (= (and b!190479 res!90046) b!190480))

(assert (=> d!55865 m!216519))

(declare-fun m!216843 () Bool)

(assert (=> b!190480 m!216843))

(assert (=> bm!19173 d!55865))

(assert (=> b!190231 d!55849))

(declare-fun d!55867 () Bool)

(declare-fun e!125355 () Bool)

(assert (=> d!55867 e!125355))

(declare-fun res!90047 () Bool)

(assert (=> d!55867 (=> res!90047 e!125355)))

(declare-fun lt!94433 () Bool)

(assert (=> d!55867 (= res!90047 (not lt!94433))))

(declare-fun lt!94432 () Bool)

(assert (=> d!55867 (= lt!94433 lt!94432)))

(declare-fun lt!94435 () Unit!5743)

(declare-fun e!125354 () Unit!5743)

(assert (=> d!55867 (= lt!94435 e!125354)))

(declare-fun c!34248 () Bool)

(assert (=> d!55867 (= c!34248 lt!94432)))

(assert (=> d!55867 (= lt!94432 (containsKey!240 (toList!1233 lt!94274) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55867 (= (contains!1342 lt!94274 #b0000000000000000000000000000000000000000000000000000000000000000) lt!94433)))

(declare-fun b!190481 () Bool)

(declare-fun lt!94434 () Unit!5743)

(assert (=> b!190481 (= e!125354 lt!94434)))

(assert (=> b!190481 (= lt!94434 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94274) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190481 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190482 () Bool)

(declare-fun Unit!5755 () Unit!5743)

(assert (=> b!190482 (= e!125354 Unit!5755)))

(declare-fun b!190483 () Bool)

(assert (=> b!190483 (= e!125355 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55867 c!34248) b!190481))

(assert (= (and d!55867 (not c!34248)) b!190482))

(assert (= (and d!55867 (not res!90047)) b!190483))

(declare-fun m!216845 () Bool)

(assert (=> d!55867 m!216845))

(declare-fun m!216847 () Bool)

(assert (=> b!190481 m!216847))

(assert (=> b!190481 m!216649))

(assert (=> b!190481 m!216649))

(declare-fun m!216849 () Bool)

(assert (=> b!190481 m!216849))

(assert (=> b!190483 m!216649))

(assert (=> b!190483 m!216649))

(assert (=> b!190483 m!216849))

(assert (=> bm!19192 d!55867))

(declare-fun b!190484 () Bool)

(declare-fun e!125362 () ListLongMap!2435)

(declare-fun call!19223 () ListLongMap!2435)

(assert (=> b!190484 (= e!125362 call!19223)))

(declare-fun b!190485 () Bool)

(declare-fun res!90050 () Bool)

(declare-fun e!125356 () Bool)

(assert (=> b!190485 (=> (not res!90050) (not e!125356))))

(declare-fun lt!94439 () ListLongMap!2435)

(assert (=> b!190485 (= res!90050 (not (contains!1342 lt!94439 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190486 () Bool)

(declare-fun e!125361 () ListLongMap!2435)

(assert (=> b!190486 (= e!125361 (ListLongMap!2436 Nil!2412))))

(declare-fun b!190487 () Bool)

(declare-fun e!125360 () Bool)

(assert (=> b!190487 (= e!125360 (= lt!94439 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3881 thiss!1248))))))

(declare-fun b!190488 () Bool)

(declare-fun e!125357 () Bool)

(assert (=> b!190488 (= e!125357 e!125360)))

(declare-fun c!34250 () Bool)

(assert (=> b!190488 (= c!34250 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun b!190489 () Bool)

(assert (=> b!190489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> b!190489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4142 (_values!3864 thiss!1248))))))

(declare-fun e!125359 () Bool)

(assert (=> b!190489 (= e!125359 (= (apply!179 lt!94439 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!190491 () Bool)

(assert (=> b!190491 (= e!125360 (isEmpty!480 lt!94439))))

(declare-fun b!190492 () Bool)

(assert (=> b!190492 (= e!125356 e!125357)))

(declare-fun c!34252 () Bool)

(declare-fun e!125358 () Bool)

(assert (=> b!190492 (= c!34252 e!125358)))

(declare-fun res!90051 () Bool)

(assert (=> b!190492 (=> (not res!90051) (not e!125358))))

(assert (=> b!190492 (= res!90051 (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun bm!19220 () Bool)

(assert (=> bm!19220 (= call!19223 (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3881 thiss!1248)))))

(declare-fun b!190493 () Bool)

(assert (=> b!190493 (= e!125361 e!125362)))

(declare-fun c!34251 () Bool)

(assert (=> b!190493 (= c!34251 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190494 () Bool)

(declare-fun lt!94436 () Unit!5743)

(declare-fun lt!94438 () Unit!5743)

(assert (=> b!190494 (= lt!94436 lt!94438)))

(declare-fun lt!94441 () (_ BitVec 64))

(declare-fun lt!94437 () ListLongMap!2435)

(declare-fun lt!94440 () V!5563)

(declare-fun lt!94442 () (_ BitVec 64))

(assert (=> b!190494 (not (contains!1342 (+!301 lt!94437 (tuple2!3519 lt!94442 lt!94440)) lt!94441))))

(assert (=> b!190494 (= lt!94438 (addStillNotContains!93 lt!94437 lt!94442 lt!94440 lt!94441))))

(assert (=> b!190494 (= lt!94441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!190494 (= lt!94440 (get!2198 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190494 (= lt!94442 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!190494 (= lt!94437 call!19223)))

(assert (=> b!190494 (= e!125362 (+!301 call!19223 (tuple2!3519 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000) (get!2198 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!190495 () Bool)

(assert (=> b!190495 (= e!125357 e!125359)))

(assert (=> b!190495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun res!90048 () Bool)

(assert (=> b!190495 (= res!90048 (contains!1342 lt!94439 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190495 (=> (not res!90048) (not e!125359))))

(declare-fun b!190490 () Bool)

(assert (=> b!190490 (= e!125358 (validKeyInArray!0 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190490 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!55869 () Bool)

(assert (=> d!55869 e!125356))

(declare-fun res!90049 () Bool)

(assert (=> d!55869 (=> (not res!90049) (not e!125356))))

(assert (=> d!55869 (= res!90049 (not (contains!1342 lt!94439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55869 (= lt!94439 e!125361)))

(declare-fun c!34249 () Bool)

(assert (=> d!55869 (= c!34249 (bvsge #b00000000000000000000000000000000 (size!4141 (_keys!5850 thiss!1248))))))

(assert (=> d!55869 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55869 (= (getCurrentListMapNoExtraKeys!212 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) lt!94439)))

(assert (= (and d!55869 c!34249) b!190486))

(assert (= (and d!55869 (not c!34249)) b!190493))

(assert (= (and b!190493 c!34251) b!190494))

(assert (= (and b!190493 (not c!34251)) b!190484))

(assert (= (or b!190494 b!190484) bm!19220))

(assert (= (and d!55869 res!90049) b!190485))

(assert (= (and b!190485 res!90050) b!190492))

(assert (= (and b!190492 res!90051) b!190490))

(assert (= (and b!190492 c!34252) b!190495))

(assert (= (and b!190492 (not c!34252)) b!190488))

(assert (= (and b!190495 res!90048) b!190489))

(assert (= (and b!190488 c!34250) b!190487))

(assert (= (and b!190488 (not c!34250)) b!190491))

(declare-fun b_lambda!7355 () Bool)

(assert (=> (not b_lambda!7355) (not b!190489)))

(assert (=> b!190489 t!7326))

(declare-fun b_and!11323 () Bool)

(assert (= b_and!11321 (and (=> t!7326 result!4885) b_and!11323)))

(declare-fun b_lambda!7357 () Bool)

(assert (=> (not b_lambda!7357) (not b!190494)))

(assert (=> b!190494 t!7326))

(declare-fun b_and!11325 () Bool)

(assert (= b_and!11323 (and (=> t!7326 result!4885) b_and!11325)))

(declare-fun m!216851 () Bool)

(assert (=> d!55869 m!216851))

(assert (=> d!55869 m!216437))

(declare-fun m!216853 () Bool)

(assert (=> b!190487 m!216853))

(declare-fun m!216855 () Bool)

(assert (=> b!190494 m!216855))

(assert (=> b!190494 m!216513))

(assert (=> b!190494 m!216519))

(declare-fun m!216857 () Bool)

(assert (=> b!190494 m!216857))

(assert (=> b!190494 m!216575))

(assert (=> b!190494 m!216513))

(assert (=> b!190494 m!216577))

(assert (=> b!190494 m!216855))

(declare-fun m!216859 () Bool)

(assert (=> b!190494 m!216859))

(declare-fun m!216861 () Bool)

(assert (=> b!190494 m!216861))

(assert (=> b!190494 m!216575))

(assert (=> b!190493 m!216519))

(assert (=> b!190493 m!216519))

(assert (=> b!190493 m!216525))

(declare-fun m!216863 () Bool)

(assert (=> b!190491 m!216863))

(assert (=> b!190495 m!216519))

(assert (=> b!190495 m!216519))

(declare-fun m!216865 () Bool)

(assert (=> b!190495 m!216865))

(declare-fun m!216867 () Bool)

(assert (=> b!190485 m!216867))

(assert (=> bm!19220 m!216853))

(assert (=> b!190490 m!216519))

(assert (=> b!190490 m!216519))

(assert (=> b!190490 m!216525))

(assert (=> b!190489 m!216513))

(assert (=> b!190489 m!216519))

(assert (=> b!190489 m!216519))

(declare-fun m!216869 () Bool)

(assert (=> b!190489 m!216869))

(assert (=> b!190489 m!216575))

(assert (=> b!190489 m!216513))

(assert (=> b!190489 m!216577))

(assert (=> b!190489 m!216575))

(assert (=> bm!19197 d!55869))

(declare-fun d!55871 () Bool)

(declare-fun e!125363 () Bool)

(assert (=> d!55871 e!125363))

(declare-fun res!90053 () Bool)

(assert (=> d!55871 (=> (not res!90053) (not e!125363))))

(declare-fun lt!94446 () ListLongMap!2435)

(assert (=> d!55871 (= res!90053 (contains!1342 lt!94446 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94443 () List!2415)

(assert (=> d!55871 (= lt!94446 (ListLongMap!2436 lt!94443))))

(declare-fun lt!94445 () Unit!5743)

(declare-fun lt!94444 () Unit!5743)

(assert (=> d!55871 (= lt!94445 lt!94444)))

(assert (=> d!55871 (= (getValueByKey!236 lt!94443 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55871 (= lt!94444 (lemmaContainsTupThenGetReturnValue!123 lt!94443 (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55871 (= lt!94443 (insertStrictlySorted!126 (toList!1233 call!19194) (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (=> d!55871 (= (+!301 call!19194 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))) lt!94446)))

(declare-fun b!190496 () Bool)

(declare-fun res!90052 () Bool)

(assert (=> b!190496 (=> (not res!90052) (not e!125363))))

(assert (=> b!190496 (= res!90052 (= (getValueByKey!236 (toList!1233 lt!94446) (_1!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(declare-fun b!190497 () Bool)

(assert (=> b!190497 (= e!125363 (contains!1344 (toList!1233 lt!94446) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))

(assert (= (and d!55871 res!90053) b!190496))

(assert (= (and b!190496 res!90052) b!190497))

(declare-fun m!216871 () Bool)

(assert (=> d!55871 m!216871))

(declare-fun m!216873 () Bool)

(assert (=> d!55871 m!216873))

(declare-fun m!216875 () Bool)

(assert (=> d!55871 m!216875))

(declare-fun m!216877 () Bool)

(assert (=> d!55871 m!216877))

(declare-fun m!216879 () Bool)

(assert (=> b!190496 m!216879))

(declare-fun m!216881 () Bool)

(assert (=> b!190497 m!216881))

(assert (=> b!190229 d!55871))

(declare-fun b!190516 () Bool)

(declare-fun e!125374 () Bool)

(declare-fun e!125377 () Bool)

(assert (=> b!190516 (= e!125374 e!125377)))

(declare-fun res!90061 () Bool)

(declare-fun lt!94452 () SeekEntryResult!672)

(assert (=> b!190516 (= res!90061 (and ((_ is Intermediate!672) lt!94452) (not (undefined!1484 lt!94452)) (bvslt (x!20474 lt!94452) #b01111111111111111111111111111110) (bvsge (x!20474 lt!94452) #b00000000000000000000000000000000) (bvsge (x!20474 lt!94452) #b00000000000000000000000000000000)))))

(assert (=> b!190516 (=> (not res!90061) (not e!125377))))

(declare-fun d!55873 () Bool)

(assert (=> d!55873 e!125374))

(declare-fun c!34260 () Bool)

(assert (=> d!55873 (= c!34260 (and ((_ is Intermediate!672) lt!94452) (undefined!1484 lt!94452)))))

(declare-fun e!125375 () SeekEntryResult!672)

(assert (=> d!55873 (= lt!94452 e!125375)))

(declare-fun c!34261 () Bool)

(assert (=> d!55873 (= c!34261 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!94451 () (_ BitVec 64))

(assert (=> d!55873 (= lt!94451 (select (arr!3821 (_keys!5850 thiss!1248)) (toIndex!0 key!828 (mask!9079 thiss!1248))))))

(assert (=> d!55873 (validMask!0 (mask!9079 thiss!1248))))

(assert (=> d!55873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9079 thiss!1248)) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)) lt!94452)))

(declare-fun b!190517 () Bool)

(declare-fun e!125378 () SeekEntryResult!672)

(assert (=> b!190517 (= e!125378 (Intermediate!672 false (toIndex!0 key!828 (mask!9079 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190518 () Bool)

(assert (=> b!190518 (= e!125378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9079 thiss!1248)) #b00000000000000000000000000000000 (mask!9079 thiss!1248)) key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(declare-fun b!190519 () Bool)

(assert (=> b!190519 (and (bvsge (index!4860 lt!94452) #b00000000000000000000000000000000) (bvslt (index!4860 lt!94452) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun e!125376 () Bool)

(assert (=> b!190519 (= e!125376 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4860 lt!94452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190520 () Bool)

(assert (=> b!190520 (= e!125375 (Intermediate!672 true (toIndex!0 key!828 (mask!9079 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!190521 () Bool)

(assert (=> b!190521 (and (bvsge (index!4860 lt!94452) #b00000000000000000000000000000000) (bvslt (index!4860 lt!94452) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun res!90062 () Bool)

(assert (=> b!190521 (= res!90062 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4860 lt!94452)) key!828))))

(assert (=> b!190521 (=> res!90062 e!125376)))

(assert (=> b!190521 (= e!125377 e!125376)))

(declare-fun b!190522 () Bool)

(assert (=> b!190522 (and (bvsge (index!4860 lt!94452) #b00000000000000000000000000000000) (bvslt (index!4860 lt!94452) (size!4141 (_keys!5850 thiss!1248))))))

(declare-fun res!90060 () Bool)

(assert (=> b!190522 (= res!90060 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4860 lt!94452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190522 (=> res!90060 e!125376)))

(declare-fun b!190523 () Bool)

(assert (=> b!190523 (= e!125374 (bvsge (x!20474 lt!94452) #b01111111111111111111111111111110))))

(declare-fun b!190524 () Bool)

(assert (=> b!190524 (= e!125375 e!125378)))

(declare-fun c!34259 () Bool)

(assert (=> b!190524 (= c!34259 (or (= lt!94451 key!828) (= (bvadd lt!94451 lt!94451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55873 c!34261) b!190520))

(assert (= (and d!55873 (not c!34261)) b!190524))

(assert (= (and b!190524 c!34259) b!190517))

(assert (= (and b!190524 (not c!34259)) b!190518))

(assert (= (and d!55873 c!34260) b!190523))

(assert (= (and d!55873 (not c!34260)) b!190516))

(assert (= (and b!190516 res!90061) b!190521))

(assert (= (and b!190521 (not res!90062)) b!190522))

(assert (= (and b!190522 (not res!90060)) b!190519))

(assert (=> b!190518 m!216497))

(declare-fun m!216883 () Bool)

(assert (=> b!190518 m!216883))

(assert (=> b!190518 m!216883))

(declare-fun m!216885 () Bool)

(assert (=> b!190518 m!216885))

(declare-fun m!216887 () Bool)

(assert (=> b!190519 m!216887))

(assert (=> b!190522 m!216887))

(assert (=> b!190521 m!216887))

(assert (=> d!55873 m!216497))

(declare-fun m!216889 () Bool)

(assert (=> d!55873 m!216889))

(assert (=> d!55873 m!216437))

(assert (=> d!55777 d!55873))

(declare-fun d!55875 () Bool)

(declare-fun lt!94458 () (_ BitVec 32))

(declare-fun lt!94457 () (_ BitVec 32))

(assert (=> d!55875 (= lt!94458 (bvmul (bvxor lt!94457 (bvlshr lt!94457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55875 (= lt!94457 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55875 (and (bvsge (mask!9079 thiss!1248) #b00000000000000000000000000000000) (let ((res!90063 (let ((h!3051 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20493 (bvmul (bvxor h!3051 (bvlshr h!3051 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20493 (bvlshr x!20493 #b00000000000000000000000000001101)) (mask!9079 thiss!1248)))))) (and (bvslt res!90063 (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90063 #b00000000000000000000000000000000))))))

(assert (=> d!55875 (= (toIndex!0 key!828 (mask!9079 thiss!1248)) (bvand (bvxor lt!94458 (bvlshr lt!94458 #b00000000000000000000000000001101)) (mask!9079 thiss!1248)))))

(assert (=> d!55777 d!55875))

(assert (=> d!55777 d!55781))

(declare-fun d!55877 () Bool)

(assert (=> d!55877 (= (inRange!0 (ite c!34163 (index!4858 lt!94212) (index!4861 lt!94212)) (mask!9079 thiss!1248)) (and (bvsge (ite c!34163 (index!4858 lt!94212) (index!4861 lt!94212)) #b00000000000000000000000000000000) (bvslt (ite c!34163 (index!4858 lt!94212) (index!4861 lt!94212)) (bvadd (mask!9079 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19172 d!55877))

(declare-fun d!55879 () Bool)

(declare-fun c!34262 () Bool)

(assert (=> d!55879 (= c!34262 (and ((_ is Cons!2411) (toList!1233 lt!94331)) (= (_1!1770 (h!3048 (toList!1233 lt!94331))) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun e!125379 () Option!242)

(assert (=> d!55879 (= (getValueByKey!236 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309))) e!125379)))

(declare-fun b!190526 () Bool)

(declare-fun e!125380 () Option!242)

(assert (=> b!190526 (= e!125379 e!125380)))

(declare-fun c!34263 () Bool)

(assert (=> b!190526 (= c!34263 (and ((_ is Cons!2411) (toList!1233 lt!94331)) (not (= (_1!1770 (h!3048 (toList!1233 lt!94331))) (_1!1770 (tuple2!3519 key!828 v!309))))))))

(declare-fun b!190528 () Bool)

(assert (=> b!190528 (= e!125380 None!240)))

(declare-fun b!190527 () Bool)

(assert (=> b!190527 (= e!125380 (getValueByKey!236 (t!7323 (toList!1233 lt!94331)) (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190525 () Bool)

(assert (=> b!190525 (= e!125379 (Some!241 (_2!1770 (h!3048 (toList!1233 lt!94331)))))))

(assert (= (and d!55879 c!34262) b!190525))

(assert (= (and d!55879 (not c!34262)) b!190526))

(assert (= (and b!190526 c!34263) b!190527))

(assert (= (and b!190526 (not c!34263)) b!190528))

(declare-fun m!216891 () Bool)

(assert (=> b!190527 m!216891))

(assert (=> b!190271 d!55879))

(declare-fun d!55881 () Bool)

(declare-fun e!125382 () Bool)

(assert (=> d!55881 e!125382))

(declare-fun res!90064 () Bool)

(assert (=> d!55881 (=> res!90064 e!125382)))

(declare-fun lt!94460 () Bool)

(assert (=> d!55881 (= res!90064 (not lt!94460))))

(declare-fun lt!94459 () Bool)

(assert (=> d!55881 (= lt!94460 lt!94459)))

(declare-fun lt!94462 () Unit!5743)

(declare-fun e!125381 () Unit!5743)

(assert (=> d!55881 (= lt!94462 e!125381)))

(declare-fun c!34264 () Bool)

(assert (=> d!55881 (= c!34264 lt!94459)))

(assert (=> d!55881 (= lt!94459 (containsKey!240 (toList!1233 lt!94299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55881 (= (contains!1342 lt!94299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94460)))

(declare-fun b!190529 () Bool)

(declare-fun lt!94461 () Unit!5743)

(assert (=> b!190529 (= e!125381 lt!94461)))

(assert (=> b!190529 (= lt!94461 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190529 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190530 () Bool)

(declare-fun Unit!5756 () Unit!5743)

(assert (=> b!190530 (= e!125381 Unit!5756)))

(declare-fun b!190531 () Bool)

(assert (=> b!190531 (= e!125382 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55881 c!34264) b!190529))

(assert (= (and d!55881 (not c!34264)) b!190530))

(assert (= (and d!55881 (not res!90064)) b!190531))

(declare-fun m!216893 () Bool)

(assert (=> d!55881 m!216893))

(declare-fun m!216895 () Bool)

(assert (=> b!190529 m!216895))

(declare-fun m!216897 () Bool)

(assert (=> b!190529 m!216897))

(assert (=> b!190529 m!216897))

(declare-fun m!216899 () Bool)

(assert (=> b!190529 m!216899))

(assert (=> b!190531 m!216897))

(assert (=> b!190531 m!216897))

(assert (=> b!190531 m!216899))

(assert (=> bm!19201 d!55881))

(declare-fun d!55883 () Bool)

(assert (=> d!55883 (= (apply!179 lt!94299 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2199 (getValueByKey!236 (toList!1233 lt!94299) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7622 () Bool)

(assert (= bs!7622 d!55883))

(assert (=> bs!7622 m!216519))

(declare-fun m!216901 () Bool)

(assert (=> bs!7622 m!216901))

(assert (=> bs!7622 m!216901))

(declare-fun m!216903 () Bool)

(assert (=> bs!7622 m!216903))

(assert (=> b!190265 d!55883))

(declare-fun d!55885 () Bool)

(declare-fun c!34267 () Bool)

(assert (=> d!55885 (= c!34267 ((_ is ValueCellFull!1875) (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!125385 () V!5563)

(assert (=> d!55885 (= (get!2198 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125385)))

(declare-fun b!190536 () Bool)

(declare-fun get!2200 (ValueCell!1875 V!5563) V!5563)

(assert (=> b!190536 (= e!125385 (get!2200 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190537 () Bool)

(declare-fun get!2201 (ValueCell!1875 V!5563) V!5563)

(assert (=> b!190537 (= e!125385 (get!2201 (select (arr!3822 (_values!3864 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55885 c!34267) b!190536))

(assert (= (and d!55885 (not c!34267)) b!190537))

(assert (=> b!190536 m!216575))

(assert (=> b!190536 m!216513))

(declare-fun m!216905 () Bool)

(assert (=> b!190536 m!216905))

(assert (=> b!190537 m!216575))

(assert (=> b!190537 m!216513))

(declare-fun m!216907 () Bool)

(assert (=> b!190537 m!216907))

(assert (=> b!190265 d!55885))

(assert (=> d!55773 d!55777))

(declare-fun d!55887 () Bool)

(declare-fun e!125388 () Bool)

(assert (=> d!55887 e!125388))

(declare-fun res!90070 () Bool)

(assert (=> d!55887 (=> (not res!90070) (not e!125388))))

(declare-fun lt!94465 () SeekEntryResult!672)

(assert (=> d!55887 (= res!90070 ((_ is Found!672) lt!94465))))

(assert (=> d!55887 (= lt!94465 (seekEntryOrOpen!0 key!828 (_keys!5850 thiss!1248) (mask!9079 thiss!1248)))))

(assert (=> d!55887 true))

(declare-fun _$33!138 () Unit!5743)

(assert (=> d!55887 (= (choose!1021 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) key!828 (defaultEntry!3881 thiss!1248)) _$33!138)))

(declare-fun b!190542 () Bool)

(declare-fun res!90069 () Bool)

(assert (=> b!190542 (=> (not res!90069) (not e!125388))))

(assert (=> b!190542 (= res!90069 (inRange!0 (index!4859 lt!94465) (mask!9079 thiss!1248)))))

(declare-fun b!190543 () Bool)

(assert (=> b!190543 (= e!125388 (= (select (arr!3821 (_keys!5850 thiss!1248)) (index!4859 lt!94465)) key!828))))

(assert (= (and d!55887 res!90070) b!190542))

(assert (= (and b!190542 res!90069) b!190543))

(assert (=> d!55887 m!216419))

(declare-fun m!216909 () Bool)

(assert (=> b!190542 m!216909))

(declare-fun m!216911 () Bool)

(assert (=> b!190543 m!216911))

(assert (=> d!55773 d!55887))

(assert (=> d!55773 d!55781))

(declare-fun d!55889 () Bool)

(declare-fun e!125389 () Bool)

(assert (=> d!55889 e!125389))

(declare-fun res!90072 () Bool)

(assert (=> d!55889 (=> (not res!90072) (not e!125389))))

(declare-fun lt!94469 () ListLongMap!2435)

(assert (=> d!55889 (= res!90072 (contains!1342 lt!94469 (_1!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(declare-fun lt!94466 () List!2415)

(assert (=> d!55889 (= lt!94469 (ListLongMap!2436 lt!94466))))

(declare-fun lt!94468 () Unit!5743)

(declare-fun lt!94467 () Unit!5743)

(assert (=> d!55889 (= lt!94468 lt!94467)))

(assert (=> d!55889 (= (getValueByKey!236 lt!94466 (_1!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))) (Some!241 (_2!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55889 (= lt!94467 (lemmaContainsTupThenGetReturnValue!123 lt!94466 (_1!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (_2!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55889 (= lt!94466 (insertStrictlySorted!126 (toList!1233 (ite c!34191 call!19204 (ite c!34195 call!19199 call!19202))) (_1!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (_2!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55889 (= (+!301 (ite c!34191 call!19204 (ite c!34195 call!19199 call!19202)) (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) lt!94469)))

(declare-fun b!190544 () Bool)

(declare-fun res!90071 () Bool)

(assert (=> b!190544 (=> (not res!90071) (not e!125389))))

(assert (=> b!190544 (= res!90071 (= (getValueByKey!236 (toList!1233 lt!94469) (_1!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))) (Some!241 (_2!1770 (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))))

(declare-fun b!190545 () Bool)

(assert (=> b!190545 (= e!125389 (contains!1344 (toList!1233 lt!94469) (ite (or c!34191 c!34195) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (= (and d!55889 res!90072) b!190544))

(assert (= (and b!190544 res!90071) b!190545))

(declare-fun m!216913 () Bool)

(assert (=> d!55889 m!216913))

(declare-fun m!216915 () Bool)

(assert (=> d!55889 m!216915))

(declare-fun m!216917 () Bool)

(assert (=> d!55889 m!216917))

(declare-fun m!216919 () Bool)

(assert (=> d!55889 m!216919))

(declare-fun m!216921 () Bool)

(assert (=> b!190544 m!216921))

(declare-fun m!216923 () Bool)

(assert (=> b!190545 m!216923))

(assert (=> bm!19196 d!55889))

(assert (=> d!55785 d!55781))

(declare-fun d!55891 () Bool)

(declare-fun e!125390 () Bool)

(assert (=> d!55891 e!125390))

(declare-fun res!90074 () Bool)

(assert (=> d!55891 (=> (not res!90074) (not e!125390))))

(declare-fun lt!94473 () ListLongMap!2435)

(assert (=> d!55891 (= res!90074 (contains!1342 lt!94473 (_1!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(declare-fun lt!94470 () List!2415)

(assert (=> d!55891 (= lt!94473 (ListLongMap!2436 lt!94470))))

(declare-fun lt!94472 () Unit!5743)

(declare-fun lt!94471 () Unit!5743)

(assert (=> d!55891 (= lt!94472 lt!94471)))

(assert (=> d!55891 (= (getValueByKey!236 lt!94470 (_1!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))) (Some!241 (_2!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55891 (= lt!94471 (lemmaContainsTupThenGetReturnValue!123 lt!94470 (_1!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (_2!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55891 (= lt!94470 (insertStrictlySorted!126 (toList!1233 (ite c!34185 call!19197 (ite c!34189 call!19192 call!19195))) (_1!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) (_2!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))))))

(assert (=> d!55891 (= (+!301 (ite c!34185 call!19197 (ite c!34189 call!19192 call!19195)) (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))) lt!94473)))

(declare-fun b!190546 () Bool)

(declare-fun res!90073 () Bool)

(assert (=> b!190546 (=> (not res!90073) (not e!125390))))

(assert (=> b!190546 (= res!90073 (= (getValueByKey!236 (toList!1233 lt!94473) (_1!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248))))) (Some!241 (_2!1770 (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))))

(declare-fun b!190547 () Bool)

(assert (=> b!190547 (= e!125390 (contains!1344 (toList!1233 lt!94473) (ite (or c!34185 c!34189) (tuple2!3519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3722 thiss!1248)) (tuple2!3519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3722 thiss!1248)))))))

(assert (= (and d!55891 res!90074) b!190546))

(assert (= (and b!190546 res!90073) b!190547))

(declare-fun m!216925 () Bool)

(assert (=> d!55891 m!216925))

(declare-fun m!216927 () Bool)

(assert (=> d!55891 m!216927))

(declare-fun m!216929 () Bool)

(assert (=> d!55891 m!216929))

(declare-fun m!216931 () Bool)

(assert (=> d!55891 m!216931))

(declare-fun m!216933 () Bool)

(assert (=> b!190546 m!216933))

(declare-fun m!216935 () Bool)

(assert (=> b!190547 m!216935))

(assert (=> bm!19189 d!55891))

(declare-fun d!55893 () Bool)

(declare-fun res!90079 () Bool)

(declare-fun e!125395 () Bool)

(assert (=> d!55893 (=> res!90079 e!125395)))

(assert (=> d!55893 (= res!90079 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (= (_1!1770 (h!3048 (toList!1233 lt!94189))) key!828)))))

(assert (=> d!55893 (= (containsKey!240 (toList!1233 lt!94189) key!828) e!125395)))

(declare-fun b!190552 () Bool)

(declare-fun e!125396 () Bool)

(assert (=> b!190552 (= e!125395 e!125396)))

(declare-fun res!90080 () Bool)

(assert (=> b!190552 (=> (not res!90080) (not e!125396))))

(assert (=> b!190552 (= res!90080 (and (or (not ((_ is Cons!2411) (toList!1233 lt!94189))) (bvsle (_1!1770 (h!3048 (toList!1233 lt!94189))) key!828)) ((_ is Cons!2411) (toList!1233 lt!94189)) (bvslt (_1!1770 (h!3048 (toList!1233 lt!94189))) key!828)))))

(declare-fun b!190553 () Bool)

(assert (=> b!190553 (= e!125396 (containsKey!240 (t!7323 (toList!1233 lt!94189)) key!828))))

(assert (= (and d!55893 (not res!90079)) b!190552))

(assert (= (and b!190552 res!90080) b!190553))

(declare-fun m!216937 () Bool)

(assert (=> b!190553 m!216937))

(assert (=> d!55789 d!55893))

(assert (=> bm!19190 d!55835))

(declare-fun d!55895 () Bool)

(declare-fun e!125398 () Bool)

(assert (=> d!55895 e!125398))

(declare-fun res!90081 () Bool)

(assert (=> d!55895 (=> res!90081 e!125398)))

(declare-fun lt!94475 () Bool)

(assert (=> d!55895 (= res!90081 (not lt!94475))))

(declare-fun lt!94474 () Bool)

(assert (=> d!55895 (= lt!94475 lt!94474)))

(declare-fun lt!94477 () Unit!5743)

(declare-fun e!125397 () Unit!5743)

(assert (=> d!55895 (= lt!94477 e!125397)))

(declare-fun c!34268 () Bool)

(assert (=> d!55895 (= c!34268 lt!94474)))

(assert (=> d!55895 (= lt!94474 (containsKey!240 (toList!1233 lt!94299) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55895 (= (contains!1342 lt!94299 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) lt!94475)))

(declare-fun b!190554 () Bool)

(declare-fun lt!94476 () Unit!5743)

(assert (=> b!190554 (= e!125397 lt!94476)))

(assert (=> b!190554 (= lt!94476 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94299) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!190554 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!190555 () Bool)

(declare-fun Unit!5757 () Unit!5743)

(assert (=> b!190555 (= e!125397 Unit!5757)))

(declare-fun b!190556 () Bool)

(assert (=> b!190556 (= e!125398 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94299) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55895 c!34268) b!190554))

(assert (= (and d!55895 (not c!34268)) b!190555))

(assert (= (and d!55895 (not res!90081)) b!190556))

(assert (=> d!55895 m!216519))

(declare-fun m!216939 () Bool)

(assert (=> d!55895 m!216939))

(assert (=> b!190554 m!216519))

(declare-fun m!216941 () Bool)

(assert (=> b!190554 m!216941))

(assert (=> b!190554 m!216519))

(assert (=> b!190554 m!216901))

(assert (=> b!190554 m!216901))

(declare-fun m!216943 () Bool)

(assert (=> b!190554 m!216943))

(assert (=> b!190556 m!216519))

(assert (=> b!190556 m!216901))

(assert (=> b!190556 m!216901))

(assert (=> b!190556 m!216943))

(assert (=> b!190263 d!55895))

(declare-fun d!55897 () Bool)

(assert (=> d!55897 (= (apply!179 (+!301 lt!94306 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) lt!94314) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94306 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))) lt!94314)))))

(declare-fun bs!7623 () Bool)

(assert (= bs!7623 d!55897))

(declare-fun m!216945 () Bool)

(assert (=> bs!7623 m!216945))

(assert (=> bs!7623 m!216945))

(declare-fun m!216947 () Bool)

(assert (=> bs!7623 m!216947))

(assert (=> b!190249 d!55897))

(declare-fun d!55899 () Bool)

(assert (=> d!55899 (= (apply!179 lt!94304 lt!94307) (get!2199 (getValueByKey!236 (toList!1233 lt!94304) lt!94307)))))

(declare-fun bs!7624 () Bool)

(assert (= bs!7624 d!55899))

(declare-fun m!216949 () Bool)

(assert (=> bs!7624 m!216949))

(assert (=> bs!7624 m!216949))

(declare-fun m!216951 () Bool)

(assert (=> bs!7624 m!216951))

(assert (=> b!190249 d!55899))

(declare-fun d!55901 () Bool)

(assert (=> d!55901 (= (apply!179 (+!301 lt!94304 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) lt!94307) (apply!179 lt!94304 lt!94307))))

(declare-fun lt!94478 () Unit!5743)

(assert (=> d!55901 (= lt!94478 (choose!1023 lt!94304 lt!94316 (minValue!3722 thiss!1248) lt!94307))))

(declare-fun e!125399 () Bool)

(assert (=> d!55901 e!125399))

(declare-fun res!90082 () Bool)

(assert (=> d!55901 (=> (not res!90082) (not e!125399))))

(assert (=> d!55901 (= res!90082 (contains!1342 lt!94304 lt!94307))))

(assert (=> d!55901 (= (addApplyDifferent!155 lt!94304 lt!94316 (minValue!3722 thiss!1248) lt!94307) lt!94478)))

(declare-fun b!190557 () Bool)

(assert (=> b!190557 (= e!125399 (not (= lt!94307 lt!94316)))))

(assert (= (and d!55901 res!90082) b!190557))

(declare-fun m!216953 () Bool)

(assert (=> d!55901 m!216953))

(assert (=> d!55901 m!216585))

(assert (=> d!55901 m!216601))

(assert (=> d!55901 m!216585))

(assert (=> d!55901 m!216587))

(declare-fun m!216955 () Bool)

(assert (=> d!55901 m!216955))

(assert (=> b!190249 d!55901))

(declare-fun d!55903 () Bool)

(assert (=> d!55903 (contains!1342 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) lt!94312)))

(declare-fun lt!94479 () Unit!5743)

(assert (=> d!55903 (= lt!94479 (choose!1024 lt!94310 lt!94313 (zeroValue!3722 thiss!1248) lt!94312))))

(assert (=> d!55903 (contains!1342 lt!94310 lt!94312)))

(assert (=> d!55903 (= (addStillContains!155 lt!94310 lt!94313 (zeroValue!3722 thiss!1248) lt!94312) lt!94479)))

(declare-fun bs!7625 () Bool)

(assert (= bs!7625 d!55903))

(assert (=> bs!7625 m!216603))

(assert (=> bs!7625 m!216603))

(assert (=> bs!7625 m!216605))

(declare-fun m!216957 () Bool)

(assert (=> bs!7625 m!216957))

(declare-fun m!216959 () Bool)

(assert (=> bs!7625 m!216959))

(assert (=> b!190249 d!55903))

(declare-fun d!55905 () Bool)

(assert (=> d!55905 (= (apply!179 (+!301 lt!94304 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) lt!94307) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94304 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))) lt!94307)))))

(declare-fun bs!7626 () Bool)

(assert (= bs!7626 d!55905))

(declare-fun m!216961 () Bool)

(assert (=> bs!7626 m!216961))

(assert (=> bs!7626 m!216961))

(declare-fun m!216963 () Bool)

(assert (=> bs!7626 m!216963))

(assert (=> b!190249 d!55905))

(declare-fun d!55907 () Bool)

(declare-fun e!125400 () Bool)

(assert (=> d!55907 e!125400))

(declare-fun res!90084 () Bool)

(assert (=> d!55907 (=> (not res!90084) (not e!125400))))

(declare-fun lt!94483 () ListLongMap!2435)

(assert (=> d!55907 (= res!90084 (contains!1342 lt!94483 (_1!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94480 () List!2415)

(assert (=> d!55907 (= lt!94483 (ListLongMap!2436 lt!94480))))

(declare-fun lt!94482 () Unit!5743)

(declare-fun lt!94481 () Unit!5743)

(assert (=> d!55907 (= lt!94482 lt!94481)))

(assert (=> d!55907 (= (getValueByKey!236 lt!94480 (_1!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))))))

(assert (=> d!55907 (= lt!94481 (lemmaContainsTupThenGetReturnValue!123 lt!94480 (_1!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))))))

(assert (=> d!55907 (= lt!94480 (insertStrictlySorted!126 (toList!1233 lt!94319) (_1!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))))))

(assert (=> d!55907 (= (+!301 lt!94319 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) lt!94483)))

(declare-fun b!190558 () Bool)

(declare-fun res!90083 () Bool)

(assert (=> b!190558 (=> (not res!90083) (not e!125400))))

(assert (=> b!190558 (= res!90083 (= (getValueByKey!236 (toList!1233 lt!94483) (_1!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))))))))

(declare-fun b!190559 () Bool)

(assert (=> b!190559 (= e!125400 (contains!1344 (toList!1233 lt!94483) (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))))))

(assert (= (and d!55907 res!90084) b!190558))

(assert (= (and b!190558 res!90083) b!190559))

(declare-fun m!216965 () Bool)

(assert (=> d!55907 m!216965))

(declare-fun m!216967 () Bool)

(assert (=> d!55907 m!216967))

(declare-fun m!216969 () Bool)

(assert (=> d!55907 m!216969))

(declare-fun m!216971 () Bool)

(assert (=> d!55907 m!216971))

(declare-fun m!216973 () Bool)

(assert (=> b!190558 m!216973))

(declare-fun m!216975 () Bool)

(assert (=> b!190559 m!216975))

(assert (=> b!190249 d!55907))

(declare-fun d!55909 () Bool)

(declare-fun e!125401 () Bool)

(assert (=> d!55909 e!125401))

(declare-fun res!90086 () Bool)

(assert (=> d!55909 (=> (not res!90086) (not e!125401))))

(declare-fun lt!94487 () ListLongMap!2435)

(assert (=> d!55909 (= res!90086 (contains!1342 lt!94487 (_1!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))))))

(declare-fun lt!94484 () List!2415)

(assert (=> d!55909 (= lt!94487 (ListLongMap!2436 lt!94484))))

(declare-fun lt!94486 () Unit!5743)

(declare-fun lt!94485 () Unit!5743)

(assert (=> d!55909 (= lt!94486 lt!94485)))

(assert (=> d!55909 (= (getValueByKey!236 lt!94484 (_1!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))))))

(assert (=> d!55909 (= lt!94485 (lemmaContainsTupThenGetReturnValue!123 lt!94484 (_1!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))))))

(assert (=> d!55909 (= lt!94484 (insertStrictlySorted!126 (toList!1233 lt!94304) (_1!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))))))

(assert (=> d!55909 (= (+!301 lt!94304 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))) lt!94487)))

(declare-fun b!190560 () Bool)

(declare-fun res!90085 () Bool)

(assert (=> b!190560 (=> (not res!90085) (not e!125401))))

(assert (=> b!190560 (= res!90085 (= (getValueByKey!236 (toList!1233 lt!94487) (_1!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))))))))

(declare-fun b!190561 () Bool)

(assert (=> b!190561 (= e!125401 (contains!1344 (toList!1233 lt!94487) (tuple2!3519 lt!94316 (minValue!3722 thiss!1248))))))

(assert (= (and d!55909 res!90086) b!190560))

(assert (= (and b!190560 res!90085) b!190561))

(declare-fun m!216977 () Bool)

(assert (=> d!55909 m!216977))

(declare-fun m!216979 () Bool)

(assert (=> d!55909 m!216979))

(declare-fun m!216981 () Bool)

(assert (=> d!55909 m!216981))

(declare-fun m!216983 () Bool)

(assert (=> d!55909 m!216983))

(declare-fun m!216985 () Bool)

(assert (=> b!190560 m!216985))

(declare-fun m!216987 () Bool)

(assert (=> b!190561 m!216987))

(assert (=> b!190249 d!55909))

(declare-fun d!55911 () Bool)

(assert (=> d!55911 (= (apply!179 (+!301 lt!94306 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) lt!94314) (apply!179 lt!94306 lt!94314))))

(declare-fun lt!94488 () Unit!5743)

(assert (=> d!55911 (= lt!94488 (choose!1023 lt!94306 lt!94309 (zeroValue!3722 thiss!1248) lt!94314))))

(declare-fun e!125402 () Bool)

(assert (=> d!55911 e!125402))

(declare-fun res!90087 () Bool)

(assert (=> d!55911 (=> (not res!90087) (not e!125402))))

(assert (=> d!55911 (= res!90087 (contains!1342 lt!94306 lt!94314))))

(assert (=> d!55911 (= (addApplyDifferent!155 lt!94306 lt!94309 (zeroValue!3722 thiss!1248) lt!94314) lt!94488)))

(declare-fun b!190562 () Bool)

(assert (=> b!190562 (= e!125402 (not (= lt!94314 lt!94309)))))

(assert (= (and d!55911 res!90087) b!190562))

(declare-fun m!216989 () Bool)

(assert (=> d!55911 m!216989))

(assert (=> d!55911 m!216595))

(assert (=> d!55911 m!216613))

(assert (=> d!55911 m!216595))

(assert (=> d!55911 m!216597))

(declare-fun m!216991 () Bool)

(assert (=> d!55911 m!216991))

(assert (=> b!190249 d!55911))

(declare-fun d!55913 () Bool)

(declare-fun e!125404 () Bool)

(assert (=> d!55913 e!125404))

(declare-fun res!90088 () Bool)

(assert (=> d!55913 (=> res!90088 e!125404)))

(declare-fun lt!94490 () Bool)

(assert (=> d!55913 (= res!90088 (not lt!94490))))

(declare-fun lt!94489 () Bool)

(assert (=> d!55913 (= lt!94490 lt!94489)))

(declare-fun lt!94492 () Unit!5743)

(declare-fun e!125403 () Unit!5743)

(assert (=> d!55913 (= lt!94492 e!125403)))

(declare-fun c!34269 () Bool)

(assert (=> d!55913 (= c!34269 lt!94489)))

(assert (=> d!55913 (= lt!94489 (containsKey!240 (toList!1233 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) lt!94312))))

(assert (=> d!55913 (= (contains!1342 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) lt!94312) lt!94490)))

(declare-fun b!190563 () Bool)

(declare-fun lt!94491 () Unit!5743)

(assert (=> b!190563 (= e!125403 lt!94491)))

(assert (=> b!190563 (= lt!94491 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) lt!94312))))

(assert (=> b!190563 (isDefined!189 (getValueByKey!236 (toList!1233 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) lt!94312))))

(declare-fun b!190564 () Bool)

(declare-fun Unit!5758 () Unit!5743)

(assert (=> b!190564 (= e!125403 Unit!5758)))

(declare-fun b!190565 () Bool)

(assert (=> b!190565 (= e!125404 (isDefined!189 (getValueByKey!236 (toList!1233 (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) lt!94312)))))

(assert (= (and d!55913 c!34269) b!190563))

(assert (= (and d!55913 (not c!34269)) b!190564))

(assert (= (and d!55913 (not res!90088)) b!190565))

(declare-fun m!216993 () Bool)

(assert (=> d!55913 m!216993))

(declare-fun m!216995 () Bool)

(assert (=> b!190563 m!216995))

(declare-fun m!216997 () Bool)

(assert (=> b!190563 m!216997))

(assert (=> b!190563 m!216997))

(declare-fun m!216999 () Bool)

(assert (=> b!190563 m!216999))

(assert (=> b!190565 m!216997))

(assert (=> b!190565 m!216997))

(assert (=> b!190565 m!216999))

(assert (=> b!190249 d!55913))

(declare-fun d!55915 () Bool)

(declare-fun e!125405 () Bool)

(assert (=> d!55915 e!125405))

(declare-fun res!90090 () Bool)

(assert (=> d!55915 (=> (not res!90090) (not e!125405))))

(declare-fun lt!94496 () ListLongMap!2435)

(assert (=> d!55915 (= res!90090 (contains!1342 lt!94496 (_1!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))))))

(declare-fun lt!94493 () List!2415)

(assert (=> d!55915 (= lt!94496 (ListLongMap!2436 lt!94493))))

(declare-fun lt!94495 () Unit!5743)

(declare-fun lt!94494 () Unit!5743)

(assert (=> d!55915 (= lt!94495 lt!94494)))

(assert (=> d!55915 (= (getValueByKey!236 lt!94493 (_1!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55915 (= lt!94494 (lemmaContainsTupThenGetReturnValue!123 lt!94493 (_1!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55915 (= lt!94493 (insertStrictlySorted!126 (toList!1233 lt!94306) (_1!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55915 (= (+!301 lt!94306 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))) lt!94496)))

(declare-fun b!190566 () Bool)

(declare-fun res!90089 () Bool)

(assert (=> b!190566 (=> (not res!90089) (not e!125405))))

(assert (=> b!190566 (= res!90089 (= (getValueByKey!236 (toList!1233 lt!94496) (_1!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))))))))

(declare-fun b!190567 () Bool)

(assert (=> b!190567 (= e!125405 (contains!1344 (toList!1233 lt!94496) (tuple2!3519 lt!94309 (zeroValue!3722 thiss!1248))))))

(assert (= (and d!55915 res!90090) b!190566))

(assert (= (and b!190566 res!90089) b!190567))

(declare-fun m!217001 () Bool)

(assert (=> d!55915 m!217001))

(declare-fun m!217003 () Bool)

(assert (=> d!55915 m!217003))

(declare-fun m!217005 () Bool)

(assert (=> d!55915 m!217005))

(declare-fun m!217007 () Bool)

(assert (=> d!55915 m!217007))

(declare-fun m!217009 () Bool)

(assert (=> b!190566 m!217009))

(declare-fun m!217011 () Bool)

(assert (=> b!190567 m!217011))

(assert (=> b!190249 d!55915))

(declare-fun d!55917 () Bool)

(assert (=> d!55917 (= (apply!179 lt!94319 lt!94302) (get!2199 (getValueByKey!236 (toList!1233 lt!94319) lt!94302)))))

(declare-fun bs!7627 () Bool)

(assert (= bs!7627 d!55917))

(declare-fun m!217013 () Bool)

(assert (=> bs!7627 m!217013))

(assert (=> bs!7627 m!217013))

(declare-fun m!217015 () Bool)

(assert (=> bs!7627 m!217015))

(assert (=> b!190249 d!55917))

(assert (=> b!190249 d!55869))

(declare-fun d!55919 () Bool)

(assert (=> d!55919 (= (apply!179 (+!301 lt!94319 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) lt!94302) (get!2199 (getValueByKey!236 (toList!1233 (+!301 lt!94319 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248)))) lt!94302)))))

(declare-fun bs!7628 () Bool)

(assert (= bs!7628 d!55919))

(declare-fun m!217017 () Bool)

(assert (=> bs!7628 m!217017))

(assert (=> bs!7628 m!217017))

(declare-fun m!217019 () Bool)

(assert (=> bs!7628 m!217019))

(assert (=> b!190249 d!55919))

(declare-fun d!55921 () Bool)

(assert (=> d!55921 (= (apply!179 lt!94306 lt!94314) (get!2199 (getValueByKey!236 (toList!1233 lt!94306) lt!94314)))))

(declare-fun bs!7629 () Bool)

(assert (= bs!7629 d!55921))

(declare-fun m!217021 () Bool)

(assert (=> bs!7629 m!217021))

(assert (=> bs!7629 m!217021))

(declare-fun m!217023 () Bool)

(assert (=> bs!7629 m!217023))

(assert (=> b!190249 d!55921))

(declare-fun d!55923 () Bool)

(declare-fun e!125406 () Bool)

(assert (=> d!55923 e!125406))

(declare-fun res!90092 () Bool)

(assert (=> d!55923 (=> (not res!90092) (not e!125406))))

(declare-fun lt!94500 () ListLongMap!2435)

(assert (=> d!55923 (= res!90092 (contains!1342 lt!94500 (_1!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))))))

(declare-fun lt!94497 () List!2415)

(assert (=> d!55923 (= lt!94500 (ListLongMap!2436 lt!94497))))

(declare-fun lt!94499 () Unit!5743)

(declare-fun lt!94498 () Unit!5743)

(assert (=> d!55923 (= lt!94499 lt!94498)))

(assert (=> d!55923 (= (getValueByKey!236 lt!94497 (_1!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55923 (= lt!94498 (lemmaContainsTupThenGetReturnValue!123 lt!94497 (_1!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55923 (= lt!94497 (insertStrictlySorted!126 (toList!1233 lt!94310) (_1!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) (_2!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))))))

(assert (=> d!55923 (= (+!301 lt!94310 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))) lt!94500)))

(declare-fun b!190568 () Bool)

(declare-fun res!90091 () Bool)

(assert (=> b!190568 (=> (not res!90091) (not e!125406))))

(assert (=> b!190568 (= res!90091 (= (getValueByKey!236 (toList!1233 lt!94500) (_1!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248)))) (Some!241 (_2!1770 (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))))))))

(declare-fun b!190569 () Bool)

(assert (=> b!190569 (= e!125406 (contains!1344 (toList!1233 lt!94500) (tuple2!3519 lt!94313 (zeroValue!3722 thiss!1248))))))

(assert (= (and d!55923 res!90092) b!190568))

(assert (= (and b!190568 res!90091) b!190569))

(declare-fun m!217025 () Bool)

(assert (=> d!55923 m!217025))

(declare-fun m!217027 () Bool)

(assert (=> d!55923 m!217027))

(declare-fun m!217029 () Bool)

(assert (=> d!55923 m!217029))

(declare-fun m!217031 () Bool)

(assert (=> d!55923 m!217031))

(declare-fun m!217033 () Bool)

(assert (=> b!190568 m!217033))

(declare-fun m!217035 () Bool)

(assert (=> b!190569 m!217035))

(assert (=> b!190249 d!55923))

(declare-fun d!55925 () Bool)

(assert (=> d!55925 (= (apply!179 (+!301 lt!94319 (tuple2!3519 lt!94318 (minValue!3722 thiss!1248))) lt!94302) (apply!179 lt!94319 lt!94302))))

(declare-fun lt!94501 () Unit!5743)

(assert (=> d!55925 (= lt!94501 (choose!1023 lt!94319 lt!94318 (minValue!3722 thiss!1248) lt!94302))))

(declare-fun e!125407 () Bool)

(assert (=> d!55925 e!125407))

(declare-fun res!90093 () Bool)

(assert (=> d!55925 (=> (not res!90093) (not e!125407))))

(assert (=> d!55925 (= res!90093 (contains!1342 lt!94319 lt!94302))))

(assert (=> d!55925 (= (addApplyDifferent!155 lt!94319 lt!94318 (minValue!3722 thiss!1248) lt!94302) lt!94501)))

(declare-fun b!190570 () Bool)

(assert (=> b!190570 (= e!125407 (not (= lt!94302 lt!94318)))))

(assert (= (and d!55925 res!90093) b!190570))

(declare-fun m!217037 () Bool)

(assert (=> d!55925 m!217037))

(assert (=> d!55925 m!216599))

(assert (=> d!55925 m!216589))

(assert (=> d!55925 m!216599))

(assert (=> d!55925 m!216609))

(declare-fun m!217039 () Bool)

(assert (=> d!55925 m!217039))

(assert (=> b!190249 d!55925))

(declare-fun d!55927 () Bool)

(assert (=> d!55927 (= (apply!179 lt!94299 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!236 (toList!1233 lt!94299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7630 () Bool)

(assert (= bs!7630 d!55927))

(assert (=> bs!7630 m!216897))

(assert (=> bs!7630 m!216897))

(declare-fun m!217041 () Bool)

(assert (=> bs!7630 m!217041))

(assert (=> b!190260 d!55927))

(declare-fun d!55929 () Bool)

(declare-fun e!125409 () Bool)

(assert (=> d!55929 e!125409))

(declare-fun res!90094 () Bool)

(assert (=> d!55929 (=> res!90094 e!125409)))

(declare-fun lt!94503 () Bool)

(assert (=> d!55929 (= res!90094 (not lt!94503))))

(declare-fun lt!94502 () Bool)

(assert (=> d!55929 (= lt!94503 lt!94502)))

(declare-fun lt!94505 () Unit!5743)

(declare-fun e!125408 () Unit!5743)

(assert (=> d!55929 (= lt!94505 e!125408)))

(declare-fun c!34270 () Bool)

(assert (=> d!55929 (= c!34270 lt!94502)))

(assert (=> d!55929 (= lt!94502 (containsKey!240 (toList!1233 lt!94274) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55929 (= (contains!1342 lt!94274 #b1000000000000000000000000000000000000000000000000000000000000000) lt!94503)))

(declare-fun b!190571 () Bool)

(declare-fun lt!94504 () Unit!5743)

(assert (=> b!190571 (= e!125408 lt!94504)))

(assert (=> b!190571 (= lt!94504 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94274) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!190571 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!190572 () Bool)

(declare-fun Unit!5759 () Unit!5743)

(assert (=> b!190572 (= e!125408 Unit!5759)))

(declare-fun b!190573 () Bool)

(assert (=> b!190573 (= e!125409 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55929 c!34270) b!190571))

(assert (= (and d!55929 (not c!34270)) b!190572))

(assert (= (and d!55929 (not res!90094)) b!190573))

(declare-fun m!217043 () Bool)

(assert (=> d!55929 m!217043))

(declare-fun m!217045 () Bool)

(assert (=> b!190571 m!217045))

(assert (=> b!190571 m!216799))

(assert (=> b!190571 m!216799))

(declare-fun m!217047 () Bool)

(assert (=> b!190571 m!217047))

(assert (=> b!190573 m!216799))

(assert (=> b!190573 m!216799))

(assert (=> b!190573 m!217047))

(assert (=> bm!19194 d!55929))

(assert (=> b!190246 d!55849))

(declare-fun d!55931 () Bool)

(declare-fun e!125410 () Bool)

(assert (=> d!55931 e!125410))

(declare-fun res!90096 () Bool)

(assert (=> d!55931 (=> (not res!90096) (not e!125410))))

(declare-fun lt!94509 () ListLongMap!2435)

(assert (=> d!55931 (= res!90096 (contains!1342 lt!94509 (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun lt!94506 () List!2415)

(assert (=> d!55931 (= lt!94509 (ListLongMap!2436 lt!94506))))

(declare-fun lt!94508 () Unit!5743)

(declare-fun lt!94507 () Unit!5743)

(assert (=> d!55931 (= lt!94508 lt!94507)))

(assert (=> d!55931 (= (getValueByKey!236 lt!94506 (_1!1770 (tuple2!3519 key!828 v!309))) (Some!241 (_2!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> d!55931 (= lt!94507 (lemmaContainsTupThenGetReturnValue!123 lt!94506 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> d!55931 (= lt!94506 (insertStrictlySorted!126 (toList!1233 (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248))) (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> d!55931 (= (+!301 (getCurrentListMap!881 (_keys!5850 thiss!1248) (_values!3864 thiss!1248) (mask!9079 thiss!1248) (extraKeys!3618 thiss!1248) (zeroValue!3722 thiss!1248) (minValue!3722 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3881 thiss!1248)) (tuple2!3519 key!828 v!309)) lt!94509)))

(declare-fun b!190574 () Bool)

(declare-fun res!90095 () Bool)

(assert (=> b!190574 (=> (not res!90095) (not e!125410))))

(assert (=> b!190574 (= res!90095 (= (getValueByKey!236 (toList!1233 lt!94509) (_1!1770 (tuple2!3519 key!828 v!309))) (Some!241 (_2!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun b!190575 () Bool)

(assert (=> b!190575 (= e!125410 (contains!1344 (toList!1233 lt!94509) (tuple2!3519 key!828 v!309)))))

(assert (= (and d!55931 res!90096) b!190574))

(assert (= (and b!190574 res!90095) b!190575))

(declare-fun m!217049 () Bool)

(assert (=> d!55931 m!217049))

(declare-fun m!217051 () Bool)

(assert (=> d!55931 m!217051))

(declare-fun m!217053 () Bool)

(assert (=> d!55931 m!217053))

(declare-fun m!217055 () Bool)

(assert (=> d!55931 m!217055))

(declare-fun m!217057 () Bool)

(assert (=> b!190574 m!217057))

(declare-fun m!217059 () Bool)

(assert (=> b!190575 m!217059))

(assert (=> b!190245 d!55931))

(assert (=> b!190245 d!55785))

(assert (=> b!190245 d!55779))

(declare-fun d!55933 () Bool)

(declare-fun e!125412 () Bool)

(assert (=> d!55933 e!125412))

(declare-fun res!90097 () Bool)

(assert (=> d!55933 (=> res!90097 e!125412)))

(declare-fun lt!94511 () Bool)

(assert (=> d!55933 (= res!90097 (not lt!94511))))

(declare-fun lt!94510 () Bool)

(assert (=> d!55933 (= lt!94511 lt!94510)))

(declare-fun lt!94513 () Unit!5743)

(declare-fun e!125411 () Unit!5743)

(assert (=> d!55933 (= lt!94513 e!125411)))

(declare-fun c!34271 () Bool)

(assert (=> d!55933 (= c!34271 lt!94510)))

(assert (=> d!55933 (= lt!94510 (containsKey!240 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> d!55933 (= (contains!1342 lt!94331 (_1!1770 (tuple2!3519 key!828 v!309))) lt!94511)))

(declare-fun b!190576 () Bool)

(declare-fun lt!94512 () Unit!5743)

(assert (=> b!190576 (= e!125411 lt!94512)))

(assert (=> b!190576 (= lt!94512 (lemmaContainsKeyImpliesGetValueByKeyDefined!188 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309))))))

(assert (=> b!190576 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190577 () Bool)

(declare-fun Unit!5760 () Unit!5743)

(assert (=> b!190577 (= e!125411 Unit!5760)))

(declare-fun b!190578 () Bool)

(assert (=> b!190578 (= e!125412 (isDefined!189 (getValueByKey!236 (toList!1233 lt!94331) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(assert (= (and d!55933 c!34271) b!190576))

(assert (= (and d!55933 (not c!34271)) b!190577))

(assert (= (and d!55933 (not res!90097)) b!190578))

(declare-fun m!217061 () Bool)

(assert (=> d!55933 m!217061))

(declare-fun m!217063 () Bool)

(assert (=> b!190576 m!217063))

(assert (=> b!190576 m!216625))

(assert (=> b!190576 m!216625))

(declare-fun m!217065 () Bool)

(assert (=> b!190576 m!217065))

(assert (=> b!190578 m!216625))

(assert (=> b!190578 m!216625))

(assert (=> b!190578 m!217065))

(assert (=> d!55787 d!55933))

(declare-fun c!34272 () Bool)

(declare-fun d!55935 () Bool)

(assert (=> d!55935 (= c!34272 (and ((_ is Cons!2411) lt!94328) (= (_1!1770 (h!3048 lt!94328)) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun e!125413 () Option!242)

(assert (=> d!55935 (= (getValueByKey!236 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309))) e!125413)))

(declare-fun b!190580 () Bool)

(declare-fun e!125414 () Option!242)

(assert (=> b!190580 (= e!125413 e!125414)))

(declare-fun c!34273 () Bool)

(assert (=> b!190580 (= c!34273 (and ((_ is Cons!2411) lt!94328) (not (= (_1!1770 (h!3048 lt!94328)) (_1!1770 (tuple2!3519 key!828 v!309))))))))

(declare-fun b!190582 () Bool)

(assert (=> b!190582 (= e!125414 None!240)))

(declare-fun b!190581 () Bool)

(assert (=> b!190581 (= e!125414 (getValueByKey!236 (t!7323 lt!94328) (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190579 () Bool)

(assert (=> b!190579 (= e!125413 (Some!241 (_2!1770 (h!3048 lt!94328))))))

(assert (= (and d!55935 c!34272) b!190579))

(assert (= (and d!55935 (not c!34272)) b!190580))

(assert (= (and b!190580 c!34273) b!190581))

(assert (= (and b!190580 (not c!34273)) b!190582))

(declare-fun m!217067 () Bool)

(assert (=> b!190581 m!217067))

(assert (=> d!55787 d!55935))

(declare-fun d!55937 () Bool)

(assert (=> d!55937 (= (getValueByKey!236 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309))) (Some!241 (_2!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun lt!94516 () Unit!5743)

(declare-fun choose!1026 (List!2415 (_ BitVec 64) V!5563) Unit!5743)

(assert (=> d!55937 (= lt!94516 (choose!1026 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun e!125417 () Bool)

(assert (=> d!55937 e!125417))

(declare-fun res!90102 () Bool)

(assert (=> d!55937 (=> (not res!90102) (not e!125417))))

(assert (=> d!55937 (= res!90102 (isStrictlySorted!353 lt!94328))))

(assert (=> d!55937 (= (lemmaContainsTupThenGetReturnValue!123 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))) lt!94516)))

(declare-fun b!190587 () Bool)

(declare-fun res!90103 () Bool)

(assert (=> b!190587 (=> (not res!90103) (not e!125417))))

(assert (=> b!190587 (= res!90103 (containsKey!240 lt!94328 (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190588 () Bool)

(assert (=> b!190588 (= e!125417 (contains!1344 lt!94328 (tuple2!3519 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309)))))))

(assert (= (and d!55937 res!90102) b!190587))

(assert (= (and b!190587 res!90103) b!190588))

(assert (=> d!55937 m!216619))

(declare-fun m!217069 () Bool)

(assert (=> d!55937 m!217069))

(declare-fun m!217071 () Bool)

(assert (=> d!55937 m!217071))

(declare-fun m!217073 () Bool)

(assert (=> b!190587 m!217073))

(declare-fun m!217075 () Bool)

(assert (=> b!190588 m!217075))

(assert (=> d!55787 d!55937))

(declare-fun b!190609 () Bool)

(declare-fun e!125430 () List!2415)

(declare-fun call!19231 () List!2415)

(assert (=> b!190609 (= e!125430 call!19231)))

(declare-fun b!190610 () Bool)

(declare-fun e!125429 () List!2415)

(declare-fun call!19230 () List!2415)

(assert (=> b!190610 (= e!125429 call!19230)))

(declare-fun d!55939 () Bool)

(declare-fun e!125428 () Bool)

(assert (=> d!55939 e!125428))

(declare-fun res!90109 () Bool)

(assert (=> d!55939 (=> (not res!90109) (not e!125428))))

(declare-fun lt!94519 () List!2415)

(assert (=> d!55939 (= res!90109 (isStrictlySorted!353 lt!94519))))

(declare-fun e!125432 () List!2415)

(assert (=> d!55939 (= lt!94519 e!125432)))

(declare-fun c!34282 () Bool)

(assert (=> d!55939 (= c!34282 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (bvslt (_1!1770 (h!3048 (toList!1233 lt!94189))) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(assert (=> d!55939 (isStrictlySorted!353 (toList!1233 lt!94189))))

(assert (=> d!55939 (= (insertStrictlySorted!126 (toList!1233 lt!94189) (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))) lt!94519)))

(declare-fun bm!19227 () Bool)

(declare-fun call!19232 () List!2415)

(assert (=> bm!19227 (= call!19230 call!19232)))

(declare-fun b!190611 () Bool)

(assert (=> b!190611 (= e!125432 call!19232)))

(declare-fun b!190612 () Bool)

(assert (=> b!190612 (= e!125430 call!19231)))

(declare-fun e!125431 () List!2415)

(declare-fun bm!19228 () Bool)

(declare-fun $colon$colon!99 (List!2415 tuple2!3518) List!2415)

(assert (=> bm!19228 (= call!19232 ($colon$colon!99 e!125431 (ite c!34282 (h!3048 (toList!1233 lt!94189)) (tuple2!3519 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))))

(declare-fun c!34283 () Bool)

(assert (=> bm!19228 (= c!34283 c!34282)))

(declare-fun b!190613 () Bool)

(assert (=> b!190613 (= e!125428 (contains!1344 lt!94519 (tuple2!3519 (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun c!34284 () Bool)

(declare-fun c!34285 () Bool)

(declare-fun b!190614 () Bool)

(assert (=> b!190614 (= e!125431 (ite c!34284 (t!7323 (toList!1233 lt!94189)) (ite c!34285 (Cons!2411 (h!3048 (toList!1233 lt!94189)) (t!7323 (toList!1233 lt!94189))) Nil!2412)))))

(declare-fun bm!19229 () Bool)

(assert (=> bm!19229 (= call!19231 call!19230)))

(declare-fun b!190615 () Bool)

(declare-fun res!90108 () Bool)

(assert (=> b!190615 (=> (not res!90108) (not e!125428))))

(assert (=> b!190615 (= res!90108 (containsKey!240 lt!94519 (_1!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190616 () Bool)

(assert (=> b!190616 (= e!125432 e!125429)))

(assert (=> b!190616 (= c!34284 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (= (_1!1770 (h!3048 (toList!1233 lt!94189))) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(declare-fun b!190617 () Bool)

(assert (=> b!190617 (= e!125431 (insertStrictlySorted!126 (t!7323 (toList!1233 lt!94189)) (_1!1770 (tuple2!3519 key!828 v!309)) (_2!1770 (tuple2!3519 key!828 v!309))))))

(declare-fun b!190618 () Bool)

(assert (=> b!190618 (= c!34285 (and ((_ is Cons!2411) (toList!1233 lt!94189)) (bvsgt (_1!1770 (h!3048 (toList!1233 lt!94189))) (_1!1770 (tuple2!3519 key!828 v!309)))))))

(assert (=> b!190618 (= e!125429 e!125430)))

(assert (= (and d!55939 c!34282) b!190611))

(assert (= (and d!55939 (not c!34282)) b!190616))

(assert (= (and b!190616 c!34284) b!190610))

(assert (= (and b!190616 (not c!34284)) b!190618))

(assert (= (and b!190618 c!34285) b!190612))

(assert (= (and b!190618 (not c!34285)) b!190609))

(assert (= (or b!190612 b!190609) bm!19229))

(assert (= (or b!190610 bm!19229) bm!19227))

(assert (= (or b!190611 bm!19227) bm!19228))

(assert (= (and bm!19228 c!34283) b!190617))

(assert (= (and bm!19228 (not c!34283)) b!190614))

(assert (= (and d!55939 res!90109) b!190615))

(assert (= (and b!190615 res!90108) b!190613))

(declare-fun m!217077 () Bool)

(assert (=> d!55939 m!217077))

(assert (=> d!55939 m!216813))

(declare-fun m!217079 () Bool)

(assert (=> b!190617 m!217079))

(declare-fun m!217081 () Bool)

(assert (=> b!190615 m!217081))

(declare-fun m!217083 () Bool)

(assert (=> b!190613 m!217083))

(declare-fun m!217085 () Bool)

(assert (=> bm!19228 m!217085))

(assert (=> d!55787 d!55939))

(declare-fun d!55941 () Bool)

(assert (=> d!55941 (= (apply!179 lt!94274 (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000)) (get!2199 (getValueByKey!236 (toList!1233 lt!94274) (select (arr!3821 (_keys!5850 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7631 () Bool)

(assert (= bs!7631 d!55941))

(assert (=> bs!7631 m!216519))

(assert (=> bs!7631 m!216665))

(assert (=> bs!7631 m!216665))

(declare-fun m!217087 () Bool)

(assert (=> bs!7631 m!217087))

(assert (=> b!190239 d!55941))

(declare-fun d!55943 () Bool)

(declare-fun c!34286 () Bool)

(assert (=> d!55943 (= c!34286 ((_ is ValueCellFull!1875) (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!125433 () V!5563)

(assert (=> d!55943 (= (get!2198 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!125433)))

(declare-fun b!190619 () Bool)

(assert (=> b!190619 (= e!125433 (get!2200 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!190620 () Bool)

(assert (=> b!190620 (= e!125433 (get!2201 (select (arr!3822 (array!8110 (store (arr!3822 (_values!3864 thiss!1248)) (index!4859 lt!94184) (ValueCellFull!1875 v!309)) (size!4142 (_values!3864 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3881 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55943 c!34286) b!190619))

(assert (= (and d!55943 (not c!34286)) b!190620))

(assert (=> b!190619 m!216515))

(assert (=> b!190619 m!216513))

(declare-fun m!217089 () Bool)

(assert (=> b!190619 m!217089))

(assert (=> b!190620 m!216515))

(assert (=> b!190620 m!216513))

(declare-fun m!217091 () Bool)

(assert (=> b!190620 m!217091))

(assert (=> b!190239 d!55943))

(declare-fun d!55945 () Bool)

(assert (=> d!55945 (= (apply!179 lt!94299 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2199 (getValueByKey!236 (toList!1233 lt!94299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7632 () Bool)

(assert (= bs!7632 d!55945))

(assert (=> bs!7632 m!216807))

(assert (=> bs!7632 m!216807))

(declare-fun m!217093 () Bool)

(assert (=> bs!7632 m!217093))

(assert (=> b!190262 d!55945))

(declare-fun b!190622 () Bool)

(declare-fun e!125435 () Bool)

(assert (=> b!190622 (= e!125435 tp_is_empty!4437)))

(declare-fun condMapEmpty!7664 () Bool)

(declare-fun mapDefault!7664 () ValueCell!1875)

(assert (=> mapNonEmpty!7663 (= condMapEmpty!7664 (= mapRest!7663 ((as const (Array (_ BitVec 32) ValueCell!1875)) mapDefault!7664)))))

(declare-fun mapRes!7664 () Bool)

(assert (=> mapNonEmpty!7663 (= tp!16843 (and e!125435 mapRes!7664))))

(declare-fun mapNonEmpty!7664 () Bool)

(declare-fun tp!16844 () Bool)

(declare-fun e!125434 () Bool)

(assert (=> mapNonEmpty!7664 (= mapRes!7664 (and tp!16844 e!125434))))

(declare-fun mapValue!7664 () ValueCell!1875)

(declare-fun mapKey!7664 () (_ BitVec 32))

(declare-fun mapRest!7664 () (Array (_ BitVec 32) ValueCell!1875))

(assert (=> mapNonEmpty!7664 (= mapRest!7663 (store mapRest!7664 mapKey!7664 mapValue!7664))))

(declare-fun mapIsEmpty!7664 () Bool)

(assert (=> mapIsEmpty!7664 mapRes!7664))

(declare-fun b!190621 () Bool)

(assert (=> b!190621 (= e!125434 tp_is_empty!4437)))

(assert (= (and mapNonEmpty!7663 condMapEmpty!7664) mapIsEmpty!7664))

(assert (= (and mapNonEmpty!7663 (not condMapEmpty!7664)) mapNonEmpty!7664))

(assert (= (and mapNonEmpty!7664 ((_ is ValueCellFull!1875) mapValue!7664)) b!190621))

(assert (= (and mapNonEmpty!7663 ((_ is ValueCellFull!1875) mapDefault!7664)) b!190622))

(declare-fun m!217095 () Bool)

(assert (=> mapNonEmpty!7664 m!217095))

(declare-fun b_lambda!7359 () Bool)

(assert (= b_lambda!7353 (or (and b!190094 b_free!4665) b_lambda!7359)))

(declare-fun b_lambda!7361 () Bool)

(assert (= b_lambda!7355 (or (and b!190094 b_free!4665) b_lambda!7361)))

(declare-fun b_lambda!7363 () Bool)

(assert (= b_lambda!7357 (or (and b!190094 b_free!4665) b_lambda!7363)))

(declare-fun b_lambda!7365 () Bool)

(assert (= b_lambda!7351 (or (and b!190094 b_free!4665) b_lambda!7365)))

(check-sat (not b!190481) (not b!190321) (not b!190493) (not b!190325) (not d!55881) (not d!55809) (not b!190490) (not b_lambda!7349) (not d!55817) (not d!55891) (not b!190483) (not b!190619) (not b!190367) (not b_lambda!7363) (not b!190414) (not d!55873) (not d!55815) (not b!190427) (not d!55829) (not b_next!4665) (not b_lambda!7361) (not d!55909) (not d!55843) (not b!190406) (not b!190322) (not d!55871) (not d!55823) (not b!190531) (not b!190474) (not d!55905) (not b!190559) (not b!190565) (not d!55895) (not d!55933) (not d!55911) (not d!55813) (not d!55811) (not b!190576) (not d!55919) (not d!55899) (not d!55939) (not b!190310) (not b_lambda!7359) (not bm!19216) (not b!190574) (not d!55913) (not b!190542) (not b!190487) (not d!55821) (not b!190411) (not b!190410) (not d!55803) (not d!55917) (not d!55907) (not b!190563) (not b!190450) (not d!55805) (not d!55887) (not b!190433) (not b!190567) (not b!190544) (not b!190556) (not d!55799) (not bm!19219) (not d!55883) (not mapNonEmpty!7664) (not b!190369) (not b!190373) (not b!190494) (not b!190489) (not b!190374) (not d!55837) (not b!190568) (not b!190578) (not bm!19204) (not d!55855) (not d!55833) (not d!55869) (not b!190553) (not b!190587) (not b!190480) (not b!190408) (not b!190529) (not b!190569) (not b!190463) (not b!190372) (not b!190368) (not d!55859) (not b!190407) (not b!190430) (not d!55863) (not b!190575) (not b!190402) (not b!190412) (not b!190413) (not b!190527) (not b_lambda!7365) (not b!190613) (not d!55929) (not d!55827) (not d!55831) (not d!55857) (not b!190426) (not d!55853) (not d!55923) (not b!190371) (not b!190323) b_and!11325 (not b!190617) (not d!55925) (not b!190491) (not d!55901) (not b!190537) (not b!190447) (not b!190573) (not b!190375) (not b!190495) (not b!190547) (not b!190497) (not b!190571) (not b!190560) (not d!55937) (not b!190404) (not d!55941) (not d!55921) (not b!190446) (not bm!19220) (not d!55839) (not d!55861) (not b!190581) (not b!190545) (not d!55897) (not b!190518) (not bm!19213) (not b!190558) (not b!190536) (not bm!19228) (not b!190620) (not b!190431) tp_is_empty!4437 (not b!190449) (not b!190554) (not b!190436) (not b!190336) (not b!190588) (not d!55927) (not bm!19207) (not b!190615) (not d!55819) (not bm!19212) (not d!55825) (not d!55915) (not b!190566) (not b!190546) (not b!190561) (not b_lambda!7347) (not d!55841) (not d!55867) (not d!55931) (not b!190485) (not d!55851) (not d!55945) (not d!55835) (not d!55903) (not d!55889) (not b!190496))
(check-sat b_and!11325 (not b_next!4665))
