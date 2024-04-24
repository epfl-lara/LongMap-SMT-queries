; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18776 () Bool)

(assert start!18776)

(declare-fun b!185553 () Bool)

(declare-fun b_free!4567 () Bool)

(declare-fun b_next!4567 () Bool)

(assert (=> b!185553 (= b_free!4567 (not b_next!4567))))

(declare-fun tp!16496 () Bool)

(declare-fun b_and!11181 () Bool)

(assert (=> b!185553 (= tp!16496 b_and!11181)))

(declare-fun b!185543 () Bool)

(declare-fun e!122087 () Bool)

(declare-fun tp_is_empty!4339 () Bool)

(assert (=> b!185543 (= e!122087 tp_is_empty!4339)))

(declare-fun b!185544 () Bool)

(declare-fun e!122086 () Bool)

(assert (=> b!185544 (= e!122086 tp_is_empty!4339)))

(declare-fun b!185545 () Bool)

(declare-fun res!87768 () Bool)

(declare-fun e!122090 () Bool)

(assert (=> b!185545 (=> (not res!87768) (not e!122090))))

(declare-datatypes ((V!5433 0))(
  ( (V!5434 (val!2214 Int)) )
))
(declare-datatypes ((ValueCell!1826 0))(
  ( (ValueCellFull!1826 (v!4125 V!5433)) (EmptyCell!1826) )
))
(declare-datatypes ((array!7871 0))(
  ( (array!7872 (arr!3716 (Array (_ BitVec 32) (_ BitVec 64))) (size!4032 (_ BitVec 32))) )
))
(declare-datatypes ((array!7873 0))(
  ( (array!7874 (arr!3717 (Array (_ BitVec 32) ValueCell!1826)) (size!4033 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2560 0))(
  ( (LongMapFixedSize!2561 (defaultEntry!3781 Int) (mask!8889 (_ BitVec 32)) (extraKeys!3518 (_ BitVec 32)) (zeroValue!3622 V!5433) (minValue!3622 V!5433) (_size!1329 (_ BitVec 32)) (_keys!5720 array!7871) (_values!3764 array!7873) (_vacant!1329 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2560)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7871 (_ BitVec 32)) Bool)

(assert (=> b!185545 (= res!87768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185546 () Bool)

(declare-fun e!122089 () Bool)

(declare-fun mapRes!7467 () Bool)

(assert (=> b!185546 (= e!122089 (and e!122087 mapRes!7467))))

(declare-fun condMapEmpty!7467 () Bool)

(declare-fun mapDefault!7467 () ValueCell!1826)

(assert (=> b!185546 (= condMapEmpty!7467 (= (arr!3717 (_values!3764 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1826)) mapDefault!7467)))))

(declare-fun b!185547 () Bool)

(declare-fun res!87763 () Bool)

(assert (=> b!185547 (=> (not res!87763) (not e!122090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185547 (= res!87763 (validMask!0 (mask!8889 thiss!1248)))))

(declare-fun b!185548 () Bool)

(declare-fun e!122088 () Bool)

(assert (=> b!185548 (= e!122088 e!122090)))

(declare-fun res!87764 () Bool)

(assert (=> b!185548 (=> (not res!87764) (not e!122090))))

(declare-datatypes ((SeekEntryResult!622 0))(
  ( (MissingZero!622 (index!4658 (_ BitVec 32))) (Found!622 (index!4659 (_ BitVec 32))) (Intermediate!622 (undefined!1434 Bool) (index!4660 (_ BitVec 32)) (x!20134 (_ BitVec 32))) (Undefined!622) (MissingVacant!622 (index!4661 (_ BitVec 32))) )
))
(declare-fun lt!91808 () SeekEntryResult!622)

(get-info :version)

(assert (=> b!185548 (= res!87764 (and (not ((_ is Undefined!622) lt!91808)) (not ((_ is MissingVacant!622) lt!91808)) (not ((_ is MissingZero!622) lt!91808)) ((_ is Found!622) lt!91808)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7871 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!185548 (= lt!91808 (seekEntryOrOpen!0 key!828 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185549 () Bool)

(declare-fun res!87766 () Bool)

(assert (=> b!185549 (=> (not res!87766) (not e!122088))))

(assert (=> b!185549 (= res!87766 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185550 () Bool)

(declare-fun res!87767 () Bool)

(assert (=> b!185550 (=> (not res!87767) (not e!122090))))

(declare-datatypes ((tuple2!3392 0))(
  ( (tuple2!3393 (_1!1707 (_ BitVec 64)) (_2!1707 V!5433)) )
))
(declare-datatypes ((List!2323 0))(
  ( (Nil!2320) (Cons!2319 (h!2952 tuple2!3392) (t!7197 List!2323)) )
))
(declare-datatypes ((ListLongMap!2313 0))(
  ( (ListLongMap!2314 (toList!1172 List!2323)) )
))
(declare-fun contains!1279 (ListLongMap!2313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!824 (array!7871 array!7873 (_ BitVec 32) (_ BitVec 32) V!5433 V!5433 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> b!185550 (= res!87767 (not (contains!1279 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) key!828)))))

(declare-fun b!185551 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185551 (= e!122090 (not (validKeyInArray!0 key!828)))))

(declare-fun mapIsEmpty!7467 () Bool)

(assert (=> mapIsEmpty!7467 mapRes!7467))

(declare-fun b!185552 () Bool)

(declare-fun res!87770 () Bool)

(assert (=> b!185552 (=> (not res!87770) (not e!122090))))

(declare-datatypes ((List!2324 0))(
  ( (Nil!2321) (Cons!2320 (h!2953 (_ BitVec 64)) (t!7198 List!2324)) )
))
(declare-fun arrayNoDuplicates!0 (array!7871 (_ BitVec 32) List!2324) Bool)

(assert (=> b!185552 (= res!87770 (arrayNoDuplicates!0 (_keys!5720 thiss!1248) #b00000000000000000000000000000000 Nil!2321))))

(declare-fun res!87769 () Bool)

(assert (=> start!18776 (=> (not res!87769) (not e!122088))))

(declare-fun valid!1079 (LongMapFixedSize!2560) Bool)

(assert (=> start!18776 (= res!87769 (valid!1079 thiss!1248))))

(assert (=> start!18776 e!122088))

(declare-fun e!122092 () Bool)

(assert (=> start!18776 e!122092))

(assert (=> start!18776 true))

(declare-fun array_inv!2397 (array!7871) Bool)

(declare-fun array_inv!2398 (array!7873) Bool)

(assert (=> b!185553 (= e!122092 (and tp!16496 tp_is_empty!4339 (array_inv!2397 (_keys!5720 thiss!1248)) (array_inv!2398 (_values!3764 thiss!1248)) e!122089))))

(declare-fun mapNonEmpty!7467 () Bool)

(declare-fun tp!16497 () Bool)

(assert (=> mapNonEmpty!7467 (= mapRes!7467 (and tp!16497 e!122086))))

(declare-fun mapKey!7467 () (_ BitVec 32))

(declare-fun mapValue!7467 () ValueCell!1826)

(declare-fun mapRest!7467 () (Array (_ BitVec 32) ValueCell!1826))

(assert (=> mapNonEmpty!7467 (= (arr!3717 (_values!3764 thiss!1248)) (store mapRest!7467 mapKey!7467 mapValue!7467))))

(declare-fun b!185554 () Bool)

(declare-fun res!87765 () Bool)

(assert (=> b!185554 (=> (not res!87765) (not e!122090))))

(assert (=> b!185554 (= res!87765 (and (= (size!4033 (_values!3764 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8889 thiss!1248))) (= (size!4032 (_keys!5720 thiss!1248)) (size!4033 (_values!3764 thiss!1248))) (bvsge (mask!8889 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3518 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3518 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!18776 res!87769) b!185549))

(assert (= (and b!185549 res!87766) b!185548))

(assert (= (and b!185548 res!87764) b!185550))

(assert (= (and b!185550 res!87767) b!185547))

(assert (= (and b!185547 res!87763) b!185554))

(assert (= (and b!185554 res!87765) b!185545))

(assert (= (and b!185545 res!87768) b!185552))

(assert (= (and b!185552 res!87770) b!185551))

(assert (= (and b!185546 condMapEmpty!7467) mapIsEmpty!7467))

(assert (= (and b!185546 (not condMapEmpty!7467)) mapNonEmpty!7467))

(assert (= (and mapNonEmpty!7467 ((_ is ValueCellFull!1826) mapValue!7467)) b!185544))

(assert (= (and b!185546 ((_ is ValueCellFull!1826) mapDefault!7467)) b!185543))

(assert (= b!185553 b!185546))

(assert (= start!18776 b!185553))

(declare-fun m!212883 () Bool)

(assert (=> start!18776 m!212883))

(declare-fun m!212885 () Bool)

(assert (=> b!185550 m!212885))

(assert (=> b!185550 m!212885))

(declare-fun m!212887 () Bool)

(assert (=> b!185550 m!212887))

(declare-fun m!212889 () Bool)

(assert (=> b!185545 m!212889))

(declare-fun m!212891 () Bool)

(assert (=> mapNonEmpty!7467 m!212891))

(declare-fun m!212893 () Bool)

(assert (=> b!185548 m!212893))

(declare-fun m!212895 () Bool)

(assert (=> b!185552 m!212895))

(declare-fun m!212897 () Bool)

(assert (=> b!185551 m!212897))

(declare-fun m!212899 () Bool)

(assert (=> b!185547 m!212899))

(declare-fun m!212901 () Bool)

(assert (=> b!185553 m!212901))

(declare-fun m!212903 () Bool)

(assert (=> b!185553 m!212903))

(check-sat (not b_next!4567) (not b!185550) (not start!18776) tp_is_empty!4339 (not b!185551) b_and!11181 (not b!185553) (not mapNonEmpty!7467) (not b!185552) (not b!185548) (not b!185545) (not b!185547))
(check-sat b_and!11181 (not b_next!4567))
(get-model)

(declare-fun b!185637 () Bool)

(declare-fun e!122143 () Bool)

(declare-fun e!122146 () Bool)

(assert (=> b!185637 (= e!122143 e!122146)))

(declare-fun res!87825 () Bool)

(assert (=> b!185637 (=> (not res!87825) (not e!122146))))

(declare-fun e!122145 () Bool)

(assert (=> b!185637 (= res!87825 (not e!122145))))

(declare-fun res!87826 () Bool)

(assert (=> b!185637 (=> (not res!87826) (not e!122145))))

(assert (=> b!185637 (= res!87826 (validKeyInArray!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55191 () Bool)

(declare-fun res!87827 () Bool)

(assert (=> d!55191 (=> res!87827 e!122143)))

(assert (=> d!55191 (= res!87827 (bvsge #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(assert (=> d!55191 (= (arrayNoDuplicates!0 (_keys!5720 thiss!1248) #b00000000000000000000000000000000 Nil!2321) e!122143)))

(declare-fun b!185638 () Bool)

(declare-fun contains!1282 (List!2324 (_ BitVec 64)) Bool)

(assert (=> b!185638 (= e!122145 (contains!1282 Nil!2321 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185639 () Bool)

(declare-fun e!122144 () Bool)

(declare-fun call!18703 () Bool)

(assert (=> b!185639 (= e!122144 call!18703)))

(declare-fun bm!18700 () Bool)

(declare-fun c!33302 () Bool)

(assert (=> bm!18700 (= call!18703 (arrayNoDuplicates!0 (_keys!5720 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33302 (Cons!2320 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000) Nil!2321) Nil!2321)))))

(declare-fun b!185640 () Bool)

(assert (=> b!185640 (= e!122146 e!122144)))

(assert (=> b!185640 (= c!33302 (validKeyInArray!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185641 () Bool)

(assert (=> b!185641 (= e!122144 call!18703)))

(assert (= (and d!55191 (not res!87827)) b!185637))

(assert (= (and b!185637 res!87826) b!185638))

(assert (= (and b!185637 res!87825) b!185640))

(assert (= (and b!185640 c!33302) b!185639))

(assert (= (and b!185640 (not c!33302)) b!185641))

(assert (= (or b!185639 b!185641) bm!18700))

(declare-fun m!212949 () Bool)

(assert (=> b!185637 m!212949))

(assert (=> b!185637 m!212949))

(declare-fun m!212951 () Bool)

(assert (=> b!185637 m!212951))

(assert (=> b!185638 m!212949))

(assert (=> b!185638 m!212949))

(declare-fun m!212953 () Bool)

(assert (=> b!185638 m!212953))

(assert (=> bm!18700 m!212949))

(declare-fun m!212955 () Bool)

(assert (=> bm!18700 m!212955))

(assert (=> b!185640 m!212949))

(assert (=> b!185640 m!212949))

(assert (=> b!185640 m!212951))

(assert (=> b!185552 d!55191))

(declare-fun b!185654 () Bool)

(declare-fun e!122154 () SeekEntryResult!622)

(declare-fun lt!91823 () SeekEntryResult!622)

(assert (=> b!185654 (= e!122154 (MissingZero!622 (index!4660 lt!91823)))))

(declare-fun b!185655 () Bool)

(declare-fun e!122153 () SeekEntryResult!622)

(assert (=> b!185655 (= e!122153 (Found!622 (index!4660 lt!91823)))))

(declare-fun b!185656 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7871 (_ BitVec 32)) SeekEntryResult!622)

(assert (=> b!185656 (= e!122154 (seekKeyOrZeroReturnVacant!0 (x!20134 lt!91823) (index!4660 lt!91823) (index!4660 lt!91823) key!828 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185657 () Bool)

(declare-fun c!33309 () Bool)

(declare-fun lt!91821 () (_ BitVec 64))

(assert (=> b!185657 (= c!33309 (= lt!91821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185657 (= e!122153 e!122154)))

(declare-fun b!185658 () Bool)

(declare-fun e!122155 () SeekEntryResult!622)

(assert (=> b!185658 (= e!122155 e!122153)))

(assert (=> b!185658 (= lt!91821 (select (arr!3716 (_keys!5720 thiss!1248)) (index!4660 lt!91823)))))

(declare-fun c!33310 () Bool)

(assert (=> b!185658 (= c!33310 (= lt!91821 key!828))))

(declare-fun d!55193 () Bool)

(declare-fun lt!91822 () SeekEntryResult!622)

(assert (=> d!55193 (and (or ((_ is Undefined!622) lt!91822) (not ((_ is Found!622) lt!91822)) (and (bvsge (index!4659 lt!91822) #b00000000000000000000000000000000) (bvslt (index!4659 lt!91822) (size!4032 (_keys!5720 thiss!1248))))) (or ((_ is Undefined!622) lt!91822) ((_ is Found!622) lt!91822) (not ((_ is MissingZero!622) lt!91822)) (and (bvsge (index!4658 lt!91822) #b00000000000000000000000000000000) (bvslt (index!4658 lt!91822) (size!4032 (_keys!5720 thiss!1248))))) (or ((_ is Undefined!622) lt!91822) ((_ is Found!622) lt!91822) ((_ is MissingZero!622) lt!91822) (not ((_ is MissingVacant!622) lt!91822)) (and (bvsge (index!4661 lt!91822) #b00000000000000000000000000000000) (bvslt (index!4661 lt!91822) (size!4032 (_keys!5720 thiss!1248))))) (or ((_ is Undefined!622) lt!91822) (ite ((_ is Found!622) lt!91822) (= (select (arr!3716 (_keys!5720 thiss!1248)) (index!4659 lt!91822)) key!828) (ite ((_ is MissingZero!622) lt!91822) (= (select (arr!3716 (_keys!5720 thiss!1248)) (index!4658 lt!91822)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!622) lt!91822) (= (select (arr!3716 (_keys!5720 thiss!1248)) (index!4661 lt!91822)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55193 (= lt!91822 e!122155)))

(declare-fun c!33311 () Bool)

(assert (=> d!55193 (= c!33311 (and ((_ is Intermediate!622) lt!91823) (undefined!1434 lt!91823)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7871 (_ BitVec 32)) SeekEntryResult!622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55193 (= lt!91823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8889 thiss!1248)) key!828 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(assert (=> d!55193 (validMask!0 (mask!8889 thiss!1248))))

(assert (=> d!55193 (= (seekEntryOrOpen!0 key!828 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)) lt!91822)))

(declare-fun b!185659 () Bool)

(assert (=> b!185659 (= e!122155 Undefined!622)))

(assert (= (and d!55193 c!33311) b!185659))

(assert (= (and d!55193 (not c!33311)) b!185658))

(assert (= (and b!185658 c!33310) b!185655))

(assert (= (and b!185658 (not c!33310)) b!185657))

(assert (= (and b!185657 c!33309) b!185654))

(assert (= (and b!185657 (not c!33309)) b!185656))

(declare-fun m!212957 () Bool)

(assert (=> b!185656 m!212957))

(declare-fun m!212959 () Bool)

(assert (=> b!185658 m!212959))

(declare-fun m!212961 () Bool)

(assert (=> d!55193 m!212961))

(declare-fun m!212963 () Bool)

(assert (=> d!55193 m!212963))

(declare-fun m!212965 () Bool)

(assert (=> d!55193 m!212965))

(declare-fun m!212967 () Bool)

(assert (=> d!55193 m!212967))

(assert (=> d!55193 m!212899))

(assert (=> d!55193 m!212961))

(declare-fun m!212969 () Bool)

(assert (=> d!55193 m!212969))

(assert (=> b!185548 d!55193))

(declare-fun d!55195 () Bool)

(assert (=> d!55195 (= (array_inv!2397 (_keys!5720 thiss!1248)) (bvsge (size!4032 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185553 d!55195))

(declare-fun d!55197 () Bool)

(assert (=> d!55197 (= (array_inv!2398 (_values!3764 thiss!1248)) (bvsge (size!4033 (_values!3764 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185553 d!55197))

(declare-fun d!55199 () Bool)

(declare-fun res!87834 () Bool)

(declare-fun e!122158 () Bool)

(assert (=> d!55199 (=> (not res!87834) (not e!122158))))

(declare-fun simpleValid!182 (LongMapFixedSize!2560) Bool)

(assert (=> d!55199 (= res!87834 (simpleValid!182 thiss!1248))))

(assert (=> d!55199 (= (valid!1079 thiss!1248) e!122158)))

(declare-fun b!185666 () Bool)

(declare-fun res!87835 () Bool)

(assert (=> b!185666 (=> (not res!87835) (not e!122158))))

(declare-fun arrayCountValidKeys!0 (array!7871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185666 (= res!87835 (= (arrayCountValidKeys!0 (_keys!5720 thiss!1248) #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))) (_size!1329 thiss!1248)))))

(declare-fun b!185667 () Bool)

(declare-fun res!87836 () Bool)

(assert (=> b!185667 (=> (not res!87836) (not e!122158))))

(assert (=> b!185667 (= res!87836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185668 () Bool)

(assert (=> b!185668 (= e!122158 (arrayNoDuplicates!0 (_keys!5720 thiss!1248) #b00000000000000000000000000000000 Nil!2321))))

(assert (= (and d!55199 res!87834) b!185666))

(assert (= (and b!185666 res!87835) b!185667))

(assert (= (and b!185667 res!87836) b!185668))

(declare-fun m!212971 () Bool)

(assert (=> d!55199 m!212971))

(declare-fun m!212973 () Bool)

(assert (=> b!185666 m!212973))

(assert (=> b!185667 m!212889))

(assert (=> b!185668 m!212895))

(assert (=> start!18776 d!55199))

(declare-fun d!55201 () Bool)

(assert (=> d!55201 (= (validMask!0 (mask!8889 thiss!1248)) (and (or (= (mask!8889 thiss!1248) #b00000000000000000000000000000111) (= (mask!8889 thiss!1248) #b00000000000000000000000000001111) (= (mask!8889 thiss!1248) #b00000000000000000000000000011111) (= (mask!8889 thiss!1248) #b00000000000000000000000000111111) (= (mask!8889 thiss!1248) #b00000000000000000000000001111111) (= (mask!8889 thiss!1248) #b00000000000000000000000011111111) (= (mask!8889 thiss!1248) #b00000000000000000000000111111111) (= (mask!8889 thiss!1248) #b00000000000000000000001111111111) (= (mask!8889 thiss!1248) #b00000000000000000000011111111111) (= (mask!8889 thiss!1248) #b00000000000000000000111111111111) (= (mask!8889 thiss!1248) #b00000000000000000001111111111111) (= (mask!8889 thiss!1248) #b00000000000000000011111111111111) (= (mask!8889 thiss!1248) #b00000000000000000111111111111111) (= (mask!8889 thiss!1248) #b00000000000000001111111111111111) (= (mask!8889 thiss!1248) #b00000000000000011111111111111111) (= (mask!8889 thiss!1248) #b00000000000000111111111111111111) (= (mask!8889 thiss!1248) #b00000000000001111111111111111111) (= (mask!8889 thiss!1248) #b00000000000011111111111111111111) (= (mask!8889 thiss!1248) #b00000000000111111111111111111111) (= (mask!8889 thiss!1248) #b00000000001111111111111111111111) (= (mask!8889 thiss!1248) #b00000000011111111111111111111111) (= (mask!8889 thiss!1248) #b00000000111111111111111111111111) (= (mask!8889 thiss!1248) #b00000001111111111111111111111111) (= (mask!8889 thiss!1248) #b00000011111111111111111111111111) (= (mask!8889 thiss!1248) #b00000111111111111111111111111111) (= (mask!8889 thiss!1248) #b00001111111111111111111111111111) (= (mask!8889 thiss!1248) #b00011111111111111111111111111111) (= (mask!8889 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8889 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185547 d!55201))

(declare-fun d!55203 () Bool)

(declare-fun res!87842 () Bool)

(declare-fun e!122167 () Bool)

(assert (=> d!55203 (=> res!87842 e!122167)))

(assert (=> d!55203 (= res!87842 (bvsge #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(assert (=> d!55203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)) e!122167)))

(declare-fun b!185677 () Bool)

(declare-fun e!122166 () Bool)

(declare-fun e!122165 () Bool)

(assert (=> b!185677 (= e!122166 e!122165)))

(declare-fun lt!91831 () (_ BitVec 64))

(assert (=> b!185677 (= lt!91831 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5592 0))(
  ( (Unit!5593) )
))
(declare-fun lt!91830 () Unit!5592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7871 (_ BitVec 64) (_ BitVec 32)) Unit!5592)

(assert (=> b!185677 (= lt!91830 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5720 thiss!1248) lt!91831 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185677 (arrayContainsKey!0 (_keys!5720 thiss!1248) lt!91831 #b00000000000000000000000000000000)))

(declare-fun lt!91832 () Unit!5592)

(assert (=> b!185677 (= lt!91832 lt!91830)))

(declare-fun res!87841 () Bool)

(assert (=> b!185677 (= res!87841 (= (seekEntryOrOpen!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000) (_keys!5720 thiss!1248) (mask!8889 thiss!1248)) (Found!622 #b00000000000000000000000000000000)))))

(assert (=> b!185677 (=> (not res!87841) (not e!122165))))

(declare-fun b!185678 () Bool)

(assert (=> b!185678 (= e!122167 e!122166)))

(declare-fun c!33314 () Bool)

(assert (=> b!185678 (= c!33314 (validKeyInArray!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185679 () Bool)

(declare-fun call!18706 () Bool)

(assert (=> b!185679 (= e!122166 call!18706)))

(declare-fun bm!18703 () Bool)

(assert (=> bm!18703 (= call!18706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185680 () Bool)

(assert (=> b!185680 (= e!122165 call!18706)))

(assert (= (and d!55203 (not res!87842)) b!185678))

(assert (= (and b!185678 c!33314) b!185677))

(assert (= (and b!185678 (not c!33314)) b!185679))

(assert (= (and b!185677 res!87841) b!185680))

(assert (= (or b!185680 b!185679) bm!18703))

(assert (=> b!185677 m!212949))

(declare-fun m!212975 () Bool)

(assert (=> b!185677 m!212975))

(declare-fun m!212977 () Bool)

(assert (=> b!185677 m!212977))

(assert (=> b!185677 m!212949))

(declare-fun m!212979 () Bool)

(assert (=> b!185677 m!212979))

(assert (=> b!185678 m!212949))

(assert (=> b!185678 m!212949))

(assert (=> b!185678 m!212951))

(declare-fun m!212981 () Bool)

(assert (=> bm!18703 m!212981))

(assert (=> b!185545 d!55203))

(declare-fun d!55205 () Bool)

(assert (=> d!55205 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185551 d!55205))

(declare-fun d!55207 () Bool)

(declare-fun e!122172 () Bool)

(assert (=> d!55207 e!122172))

(declare-fun res!87845 () Bool)

(assert (=> d!55207 (=> res!87845 e!122172)))

(declare-fun lt!91841 () Bool)

(assert (=> d!55207 (= res!87845 (not lt!91841))))

(declare-fun lt!91843 () Bool)

(assert (=> d!55207 (= lt!91841 lt!91843)))

(declare-fun lt!91844 () Unit!5592)

(declare-fun e!122173 () Unit!5592)

(assert (=> d!55207 (= lt!91844 e!122173)))

(declare-fun c!33317 () Bool)

(assert (=> d!55207 (= c!33317 lt!91843)))

(declare-fun containsKey!227 (List!2323 (_ BitVec 64)) Bool)

(assert (=> d!55207 (= lt!91843 (containsKey!227 (toList!1172 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(assert (=> d!55207 (= (contains!1279 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) key!828) lt!91841)))

(declare-fun b!185687 () Bool)

(declare-fun lt!91842 () Unit!5592)

(assert (=> b!185687 (= e!122173 lt!91842)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!175 (List!2323 (_ BitVec 64)) Unit!5592)

(assert (=> b!185687 (= lt!91842 (lemmaContainsKeyImpliesGetValueByKeyDefined!175 (toList!1172 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(declare-datatypes ((Option!230 0))(
  ( (Some!229 (v!4128 V!5433)) (None!228) )
))
(declare-fun isDefined!176 (Option!230) Bool)

(declare-fun getValueByKey!224 (List!2323 (_ BitVec 64)) Option!230)

(assert (=> b!185687 (isDefined!176 (getValueByKey!224 (toList!1172 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828))))

(declare-fun b!185688 () Bool)

(declare-fun Unit!5594 () Unit!5592)

(assert (=> b!185688 (= e!122173 Unit!5594)))

(declare-fun b!185689 () Bool)

(assert (=> b!185689 (= e!122172 (isDefined!176 (getValueByKey!224 (toList!1172 (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248))) key!828)))))

(assert (= (and d!55207 c!33317) b!185687))

(assert (= (and d!55207 (not c!33317)) b!185688))

(assert (= (and d!55207 (not res!87845)) b!185689))

(declare-fun m!212983 () Bool)

(assert (=> d!55207 m!212983))

(declare-fun m!212985 () Bool)

(assert (=> b!185687 m!212985))

(declare-fun m!212987 () Bool)

(assert (=> b!185687 m!212987))

(assert (=> b!185687 m!212987))

(declare-fun m!212989 () Bool)

(assert (=> b!185687 m!212989))

(assert (=> b!185689 m!212987))

(assert (=> b!185689 m!212987))

(assert (=> b!185689 m!212989))

(assert (=> b!185550 d!55207))

(declare-fun bm!18718 () Bool)

(declare-fun call!18727 () ListLongMap!2313)

(declare-fun call!18721 () ListLongMap!2313)

(assert (=> bm!18718 (= call!18727 call!18721)))

(declare-fun b!185732 () Bool)

(declare-fun e!122208 () Bool)

(declare-fun lt!91896 () ListLongMap!2313)

(declare-fun apply!166 (ListLongMap!2313 (_ BitVec 64)) V!5433)

(assert (=> b!185732 (= e!122208 (= (apply!166 lt!91896 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3622 thiss!1248)))))

(declare-fun b!185733 () Bool)

(declare-fun e!122209 () Bool)

(declare-fun e!122202 () Bool)

(assert (=> b!185733 (= e!122209 e!122202)))

(declare-fun c!33334 () Bool)

(assert (=> b!185733 (= c!33334 (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185734 () Bool)

(declare-fun e!122201 () Unit!5592)

(declare-fun Unit!5595 () Unit!5592)

(assert (=> b!185734 (= e!122201 Unit!5595)))

(declare-fun d!55209 () Bool)

(assert (=> d!55209 e!122209))

(declare-fun res!87866 () Bool)

(assert (=> d!55209 (=> (not res!87866) (not e!122209))))

(assert (=> d!55209 (= res!87866 (or (bvsge #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))))

(declare-fun lt!91906 () ListLongMap!2313)

(assert (=> d!55209 (= lt!91896 lt!91906)))

(declare-fun lt!91904 () Unit!5592)

(assert (=> d!55209 (= lt!91904 e!122201)))

(declare-fun c!33330 () Bool)

(declare-fun e!122206 () Bool)

(assert (=> d!55209 (= c!33330 e!122206)))

(declare-fun res!87867 () Bool)

(assert (=> d!55209 (=> (not res!87867) (not e!122206))))

(assert (=> d!55209 (= res!87867 (bvslt #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(declare-fun e!122212 () ListLongMap!2313)

(assert (=> d!55209 (= lt!91906 e!122212)))

(declare-fun c!33333 () Bool)

(assert (=> d!55209 (= c!33333 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55209 (validMask!0 (mask!8889 thiss!1248))))

(assert (=> d!55209 (= (getCurrentListMap!824 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)) lt!91896)))

(declare-fun b!185735 () Bool)

(declare-fun lt!91898 () Unit!5592)

(assert (=> b!185735 (= e!122201 lt!91898)))

(declare-fun lt!91900 () ListLongMap!2313)

(declare-fun getCurrentListMapNoExtraKeys!197 (array!7871 array!7873 (_ BitVec 32) (_ BitVec 32) V!5433 V!5433 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> b!185735 (= lt!91900 (getCurrentListMapNoExtraKeys!197 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91889 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91891 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91891 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91899 () Unit!5592)

(declare-fun addStillContains!142 (ListLongMap!2313 (_ BitVec 64) V!5433 (_ BitVec 64)) Unit!5592)

(assert (=> b!185735 (= lt!91899 (addStillContains!142 lt!91900 lt!91889 (zeroValue!3622 thiss!1248) lt!91891))))

(declare-fun +!286 (ListLongMap!2313 tuple2!3392) ListLongMap!2313)

(assert (=> b!185735 (contains!1279 (+!286 lt!91900 (tuple2!3393 lt!91889 (zeroValue!3622 thiss!1248))) lt!91891)))

(declare-fun lt!91892 () Unit!5592)

(assert (=> b!185735 (= lt!91892 lt!91899)))

(declare-fun lt!91907 () ListLongMap!2313)

(assert (=> b!185735 (= lt!91907 (getCurrentListMapNoExtraKeys!197 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91902 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91902 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91895 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91895 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91909 () Unit!5592)

(declare-fun addApplyDifferent!142 (ListLongMap!2313 (_ BitVec 64) V!5433 (_ BitVec 64)) Unit!5592)

(assert (=> b!185735 (= lt!91909 (addApplyDifferent!142 lt!91907 lt!91902 (minValue!3622 thiss!1248) lt!91895))))

(assert (=> b!185735 (= (apply!166 (+!286 lt!91907 (tuple2!3393 lt!91902 (minValue!3622 thiss!1248))) lt!91895) (apply!166 lt!91907 lt!91895))))

(declare-fun lt!91901 () Unit!5592)

(assert (=> b!185735 (= lt!91901 lt!91909)))

(declare-fun lt!91897 () ListLongMap!2313)

(assert (=> b!185735 (= lt!91897 (getCurrentListMapNoExtraKeys!197 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91905 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91890 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91890 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91893 () Unit!5592)

(assert (=> b!185735 (= lt!91893 (addApplyDifferent!142 lt!91897 lt!91905 (zeroValue!3622 thiss!1248) lt!91890))))

(assert (=> b!185735 (= (apply!166 (+!286 lt!91897 (tuple2!3393 lt!91905 (zeroValue!3622 thiss!1248))) lt!91890) (apply!166 lt!91897 lt!91890))))

(declare-fun lt!91894 () Unit!5592)

(assert (=> b!185735 (= lt!91894 lt!91893)))

(declare-fun lt!91908 () ListLongMap!2313)

(assert (=> b!185735 (= lt!91908 (getCurrentListMapNoExtraKeys!197 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun lt!91903 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91910 () (_ BitVec 64))

(assert (=> b!185735 (= lt!91910 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185735 (= lt!91898 (addApplyDifferent!142 lt!91908 lt!91903 (minValue!3622 thiss!1248) lt!91910))))

(assert (=> b!185735 (= (apply!166 (+!286 lt!91908 (tuple2!3393 lt!91903 (minValue!3622 thiss!1248))) lt!91910) (apply!166 lt!91908 lt!91910))))

(declare-fun bm!18719 () Bool)

(declare-fun call!18724 () ListLongMap!2313)

(assert (=> bm!18719 (= call!18724 (getCurrentListMapNoExtraKeys!197 (_keys!5720 thiss!1248) (_values!3764 thiss!1248) (mask!8889 thiss!1248) (extraKeys!3518 thiss!1248) (zeroValue!3622 thiss!1248) (minValue!3622 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3781 thiss!1248)))))

(declare-fun b!185736 () Bool)

(declare-fun e!122205 () Bool)

(declare-fun e!122207 () Bool)

(assert (=> b!185736 (= e!122205 e!122207)))

(declare-fun res!87872 () Bool)

(declare-fun call!18722 () Bool)

(assert (=> b!185736 (= res!87872 call!18722)))

(assert (=> b!185736 (=> (not res!87872) (not e!122207))))

(declare-fun b!185737 () Bool)

(assert (=> b!185737 (= e!122207 (= (apply!166 lt!91896 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3622 thiss!1248)))))

(declare-fun bm!18720 () Bool)

(declare-fun call!18723 () ListLongMap!2313)

(declare-fun call!18725 () ListLongMap!2313)

(assert (=> bm!18720 (= call!18723 call!18725)))

(declare-fun b!185738 () Bool)

(declare-fun c!33331 () Bool)

(assert (=> b!185738 (= c!33331 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122204 () ListLongMap!2313)

(declare-fun e!122211 () ListLongMap!2313)

(assert (=> b!185738 (= e!122204 e!122211)))

(declare-fun b!185739 () Bool)

(declare-fun res!87870 () Bool)

(assert (=> b!185739 (=> (not res!87870) (not e!122209))))

(assert (=> b!185739 (= res!87870 e!122205)))

(declare-fun c!33335 () Bool)

(assert (=> b!185739 (= c!33335 (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18721 () Bool)

(declare-fun call!18726 () Bool)

(assert (=> bm!18721 (= call!18726 (contains!1279 lt!91896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185740 () Bool)

(assert (=> b!185740 (= e!122205 (not call!18722))))

(declare-fun b!185741 () Bool)

(assert (=> b!185741 (= e!122204 call!18723)))

(declare-fun b!185742 () Bool)

(assert (=> b!185742 (= e!122202 e!122208)))

(declare-fun res!87865 () Bool)

(assert (=> b!185742 (= res!87865 call!18726)))

(assert (=> b!185742 (=> (not res!87865) (not e!122208))))

(declare-fun b!185743 () Bool)

(declare-fun res!87868 () Bool)

(assert (=> b!185743 (=> (not res!87868) (not e!122209))))

(declare-fun e!122200 () Bool)

(assert (=> b!185743 (= res!87868 e!122200)))

(declare-fun res!87869 () Bool)

(assert (=> b!185743 (=> res!87869 e!122200)))

(declare-fun e!122210 () Bool)

(assert (=> b!185743 (= res!87869 (not e!122210))))

(declare-fun res!87864 () Bool)

(assert (=> b!185743 (=> (not res!87864) (not e!122210))))

(assert (=> b!185743 (= res!87864 (bvslt #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(declare-fun b!185744 () Bool)

(assert (=> b!185744 (= e!122212 e!122204)))

(declare-fun c!33332 () Bool)

(assert (=> b!185744 (= c!33332 (and (not (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3518 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18722 () Bool)

(assert (=> bm!18722 (= call!18725 (+!286 (ite c!33333 call!18724 (ite c!33332 call!18721 call!18727)) (ite (or c!33333 c!33332) (tuple2!3393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3622 thiss!1248)) (tuple2!3393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3622 thiss!1248)))))))

(declare-fun bm!18723 () Bool)

(assert (=> bm!18723 (= call!18721 call!18724)))

(declare-fun b!185745 () Bool)

(assert (=> b!185745 (= e!122212 (+!286 call!18725 (tuple2!3393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3622 thiss!1248))))))

(declare-fun b!185746 () Bool)

(declare-fun e!122203 () Bool)

(assert (=> b!185746 (= e!122200 e!122203)))

(declare-fun res!87871 () Bool)

(assert (=> b!185746 (=> (not res!87871) (not e!122203))))

(assert (=> b!185746 (= res!87871 (contains!1279 lt!91896 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(declare-fun b!185747 () Bool)

(assert (=> b!185747 (= e!122211 call!18727)))

(declare-fun b!185748 () Bool)

(assert (=> b!185748 (= e!122202 (not call!18726))))

(declare-fun b!185749 () Bool)

(declare-fun get!2147 (ValueCell!1826 V!5433) V!5433)

(declare-fun dynLambda!509 (Int (_ BitVec 64)) V!5433)

(assert (=> b!185749 (= e!122203 (= (apply!166 lt!91896 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)) (get!2147 (select (arr!3717 (_values!3764 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!509 (defaultEntry!3781 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4033 (_values!3764 thiss!1248))))))

(assert (=> b!185749 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4032 (_keys!5720 thiss!1248))))))

(declare-fun b!185750 () Bool)

(assert (=> b!185750 (= e!122206 (validKeyInArray!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18724 () Bool)

(assert (=> bm!18724 (= call!18722 (contains!1279 lt!91896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185751 () Bool)

(assert (=> b!185751 (= e!122211 call!18723)))

(declare-fun b!185752 () Bool)

(assert (=> b!185752 (= e!122210 (validKeyInArray!0 (select (arr!3716 (_keys!5720 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55209 c!33333) b!185745))

(assert (= (and d!55209 (not c!33333)) b!185744))

(assert (= (and b!185744 c!33332) b!185741))

(assert (= (and b!185744 (not c!33332)) b!185738))

(assert (= (and b!185738 c!33331) b!185751))

(assert (= (and b!185738 (not c!33331)) b!185747))

(assert (= (or b!185751 b!185747) bm!18718))

(assert (= (or b!185741 bm!18718) bm!18723))

(assert (= (or b!185741 b!185751) bm!18720))

(assert (= (or b!185745 bm!18723) bm!18719))

(assert (= (or b!185745 bm!18720) bm!18722))

(assert (= (and d!55209 res!87867) b!185750))

(assert (= (and d!55209 c!33330) b!185735))

(assert (= (and d!55209 (not c!33330)) b!185734))

(assert (= (and d!55209 res!87866) b!185743))

(assert (= (and b!185743 res!87864) b!185752))

(assert (= (and b!185743 (not res!87869)) b!185746))

(assert (= (and b!185746 res!87871) b!185749))

(assert (= (and b!185743 res!87868) b!185739))

(assert (= (and b!185739 c!33335) b!185736))

(assert (= (and b!185739 (not c!33335)) b!185740))

(assert (= (and b!185736 res!87872) b!185737))

(assert (= (or b!185736 b!185740) bm!18724))

(assert (= (and b!185739 res!87870) b!185733))

(assert (= (and b!185733 c!33334) b!185742))

(assert (= (and b!185733 (not c!33334)) b!185748))

(assert (= (and b!185742 res!87865) b!185732))

(assert (= (or b!185742 b!185748) bm!18721))

(declare-fun b_lambda!7273 () Bool)

(assert (=> (not b_lambda!7273) (not b!185749)))

(declare-fun t!7203 () Bool)

(declare-fun tb!2835 () Bool)

(assert (=> (and b!185553 (= (defaultEntry!3781 thiss!1248) (defaultEntry!3781 thiss!1248)) t!7203) tb!2835))

(declare-fun result!4799 () Bool)

(assert (=> tb!2835 (= result!4799 tp_is_empty!4339)))

(assert (=> b!185749 t!7203))

(declare-fun b_and!11187 () Bool)

(assert (= b_and!11181 (and (=> t!7203 result!4799) b_and!11187)))

(assert (=> b!185746 m!212949))

(assert (=> b!185746 m!212949))

(declare-fun m!212991 () Bool)

(assert (=> b!185746 m!212991))

(declare-fun m!212993 () Bool)

(assert (=> b!185732 m!212993))

(declare-fun m!212995 () Bool)

(assert (=> b!185737 m!212995))

(assert (=> b!185752 m!212949))

(assert (=> b!185752 m!212949))

(assert (=> b!185752 m!212951))

(declare-fun m!212997 () Bool)

(assert (=> bm!18724 m!212997))

(declare-fun m!212999 () Bool)

(assert (=> b!185735 m!212999))

(declare-fun m!213001 () Bool)

(assert (=> b!185735 m!213001))

(declare-fun m!213003 () Bool)

(assert (=> b!185735 m!213003))

(declare-fun m!213005 () Bool)

(assert (=> b!185735 m!213005))

(assert (=> b!185735 m!213005))

(declare-fun m!213007 () Bool)

(assert (=> b!185735 m!213007))

(assert (=> b!185735 m!212949))

(declare-fun m!213009 () Bool)

(assert (=> b!185735 m!213009))

(assert (=> b!185735 m!212999))

(declare-fun m!213011 () Bool)

(assert (=> b!185735 m!213011))

(declare-fun m!213013 () Bool)

(assert (=> b!185735 m!213013))

(declare-fun m!213015 () Bool)

(assert (=> b!185735 m!213015))

(declare-fun m!213017 () Bool)

(assert (=> b!185735 m!213017))

(declare-fun m!213019 () Bool)

(assert (=> b!185735 m!213019))

(declare-fun m!213021 () Bool)

(assert (=> b!185735 m!213021))

(declare-fun m!213023 () Bool)

(assert (=> b!185735 m!213023))

(assert (=> b!185735 m!213017))

(declare-fun m!213025 () Bool)

(assert (=> b!185735 m!213025))

(assert (=> b!185735 m!213013))

(declare-fun m!213027 () Bool)

(assert (=> b!185735 m!213027))

(declare-fun m!213029 () Bool)

(assert (=> b!185735 m!213029))

(assert (=> bm!18719 m!213023))

(assert (=> b!185750 m!212949))

(assert (=> b!185750 m!212949))

(assert (=> b!185750 m!212951))

(assert (=> d!55209 m!212899))

(declare-fun m!213031 () Bool)

(assert (=> b!185749 m!213031))

(assert (=> b!185749 m!212949))

(assert (=> b!185749 m!213031))

(declare-fun m!213033 () Bool)

(assert (=> b!185749 m!213033))

(declare-fun m!213035 () Bool)

(assert (=> b!185749 m!213035))

(assert (=> b!185749 m!212949))

(declare-fun m!213037 () Bool)

(assert (=> b!185749 m!213037))

(assert (=> b!185749 m!213033))

(declare-fun m!213039 () Bool)

(assert (=> bm!18721 m!213039))

(declare-fun m!213041 () Bool)

(assert (=> bm!18722 m!213041))

(declare-fun m!213043 () Bool)

(assert (=> b!185745 m!213043))

(assert (=> b!185550 d!55209))

(declare-fun mapIsEmpty!7476 () Bool)

(declare-fun mapRes!7476 () Bool)

(assert (=> mapIsEmpty!7476 mapRes!7476))

(declare-fun b!185762 () Bool)

(declare-fun e!122218 () Bool)

(assert (=> b!185762 (= e!122218 tp_is_empty!4339)))

(declare-fun b!185761 () Bool)

(declare-fun e!122217 () Bool)

(assert (=> b!185761 (= e!122217 tp_is_empty!4339)))

(declare-fun mapNonEmpty!7476 () Bool)

(declare-fun tp!16512 () Bool)

(assert (=> mapNonEmpty!7476 (= mapRes!7476 (and tp!16512 e!122217))))

(declare-fun mapValue!7476 () ValueCell!1826)

(declare-fun mapKey!7476 () (_ BitVec 32))

(declare-fun mapRest!7476 () (Array (_ BitVec 32) ValueCell!1826))

(assert (=> mapNonEmpty!7476 (= mapRest!7467 (store mapRest!7476 mapKey!7476 mapValue!7476))))

(declare-fun condMapEmpty!7476 () Bool)

(declare-fun mapDefault!7476 () ValueCell!1826)

(assert (=> mapNonEmpty!7467 (= condMapEmpty!7476 (= mapRest!7467 ((as const (Array (_ BitVec 32) ValueCell!1826)) mapDefault!7476)))))

(assert (=> mapNonEmpty!7467 (= tp!16497 (and e!122218 mapRes!7476))))

(assert (= (and mapNonEmpty!7467 condMapEmpty!7476) mapIsEmpty!7476))

(assert (= (and mapNonEmpty!7467 (not condMapEmpty!7476)) mapNonEmpty!7476))

(assert (= (and mapNonEmpty!7476 ((_ is ValueCellFull!1826) mapValue!7476)) b!185761))

(assert (= (and mapNonEmpty!7467 ((_ is ValueCellFull!1826) mapDefault!7476)) b!185762))

(declare-fun m!213045 () Bool)

(assert (=> mapNonEmpty!7476 m!213045))

(declare-fun b_lambda!7275 () Bool)

(assert (= b_lambda!7273 (or (and b!185553 b_free!4567) b_lambda!7275)))

(check-sat (not bm!18721) (not d!55209) (not d!55193) (not b_lambda!7275) (not b!185667) (not b!185678) (not b!185746) (not d!55199) (not b!185687) b_and!11187 (not mapNonEmpty!7476) (not b!185638) (not b_next!4567) (not bm!18719) (not bm!18703) (not b!185640) (not b!185666) (not b!185749) (not b!185732) (not b!185689) tp_is_empty!4339 (not b!185668) (not b!185752) (not bm!18722) (not b!185750) (not b!185637) (not b!185745) (not b!185735) (not b!185656) (not b!185737) (not d!55207) (not bm!18724) (not b!185677) (not bm!18700))
(check-sat b_and!11187 (not b_next!4567))
