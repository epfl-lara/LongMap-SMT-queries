; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15858 () Bool)

(assert start!15858)

(declare-fun b!157884 () Bool)

(declare-fun b_free!3465 () Bool)

(declare-fun b_next!3465 () Bool)

(assert (=> b!157884 (= b_free!3465 (not b_next!3465))))

(declare-fun tp!12936 () Bool)

(declare-fun b_and!9879 () Bool)

(assert (=> b!157884 (= tp!12936 b_and!9879)))

(declare-fun b!157881 () Bool)

(declare-fun e!103413 () Bool)

(declare-fun tp_is_empty!3267 () Bool)

(assert (=> b!157881 (= e!103413 tp_is_empty!3267)))

(declare-fun mapNonEmpty!5560 () Bool)

(declare-fun mapRes!5560 () Bool)

(declare-fun tp!12937 () Bool)

(declare-fun e!103415 () Bool)

(assert (=> mapNonEmpty!5560 (= mapRes!5560 (and tp!12937 e!103415))))

(declare-fun mapKey!5560 () (_ BitVec 32))

(declare-datatypes ((V!4003 0))(
  ( (V!4004 (val!1678 Int)) )
))
(declare-datatypes ((ValueCell!1290 0))(
  ( (ValueCellFull!1290 (v!3543 V!4003)) (EmptyCell!1290) )
))
(declare-fun mapRest!5560 () (Array (_ BitVec 32) ValueCell!1290))

(declare-fun mapValue!5560 () ValueCell!1290)

(declare-datatypes ((array!5597 0))(
  ( (array!5598 (arr!2651 (Array (_ BitVec 32) (_ BitVec 64))) (size!2931 (_ BitVec 32))) )
))
(declare-datatypes ((array!5599 0))(
  ( (array!5600 (arr!2652 (Array (_ BitVec 32) ValueCell!1290)) (size!2932 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1488 0))(
  ( (LongMapFixedSize!1489 (defaultEntry!3186 Int) (mask!7681 (_ BitVec 32)) (extraKeys!2927 (_ BitVec 32)) (zeroValue!3029 V!4003) (minValue!3029 V!4003) (_size!793 (_ BitVec 32)) (_keys!4964 array!5597) (_values!3169 array!5599) (_vacant!793 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1488)

(assert (=> mapNonEmpty!5560 (= (arr!2652 (_values!3169 thiss!1248)) (store mapRest!5560 mapKey!5560 mapValue!5560))))

(declare-fun b!157882 () Bool)

(declare-fun e!103414 () Bool)

(assert (=> b!157882 (= e!103414 (not (= (size!2932 (_values!3169 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7681 thiss!1248)))))))

(declare-fun mapIsEmpty!5560 () Bool)

(assert (=> mapIsEmpty!5560 mapRes!5560))

(declare-fun b!157883 () Bool)

(assert (=> b!157883 (= e!103415 tp_is_empty!3267)))

(declare-fun e!103416 () Bool)

(declare-fun e!103417 () Bool)

(declare-fun array_inv!1689 (array!5597) Bool)

(declare-fun array_inv!1690 (array!5599) Bool)

(assert (=> b!157884 (= e!103417 (and tp!12936 tp_is_empty!3267 (array_inv!1689 (_keys!4964 thiss!1248)) (array_inv!1690 (_values!3169 thiss!1248)) e!103416))))

(declare-fun b!157885 () Bool)

(assert (=> b!157885 (= e!103416 (and e!103413 mapRes!5560))))

(declare-fun condMapEmpty!5560 () Bool)

(declare-fun mapDefault!5560 () ValueCell!1290)

(assert (=> b!157885 (= condMapEmpty!5560 (= (arr!2652 (_values!3169 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1290)) mapDefault!5560)))))

(declare-fun b!157886 () Bool)

(declare-fun res!74606 () Bool)

(assert (=> b!157886 (=> (not res!74606) (not e!103414))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157886 (= res!74606 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74608 () Bool)

(assert (=> start!15858 (=> (not res!74608) (not e!103414))))

(declare-fun valid!703 (LongMapFixedSize!1488) Bool)

(assert (=> start!15858 (= res!74608 (valid!703 thiss!1248))))

(assert (=> start!15858 e!103414))

(assert (=> start!15858 e!103417))

(assert (=> start!15858 true))

(declare-fun b!157887 () Bool)

(declare-fun res!74607 () Bool)

(assert (=> b!157887 (=> (not res!74607) (not e!103414))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!290 0))(
  ( (MissingZero!290 (index!3328 (_ BitVec 32))) (Found!290 (index!3329 (_ BitVec 32))) (Intermediate!290 (undefined!1102 Bool) (index!3330 (_ BitVec 32)) (x!17406 (_ BitVec 32))) (Undefined!290) (MissingVacant!290 (index!3331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5597 (_ BitVec 32)) SeekEntryResult!290)

(assert (=> b!157887 (= res!74607 ((_ is Undefined!290) (seekEntryOrOpen!0 key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248))))))

(declare-fun b!157888 () Bool)

(declare-fun res!74605 () Bool)

(assert (=> b!157888 (=> (not res!74605) (not e!103414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157888 (= res!74605 (validMask!0 (mask!7681 thiss!1248)))))

(assert (= (and start!15858 res!74608) b!157886))

(assert (= (and b!157886 res!74606) b!157887))

(assert (= (and b!157887 res!74607) b!157888))

(assert (= (and b!157888 res!74605) b!157882))

(assert (= (and b!157885 condMapEmpty!5560) mapIsEmpty!5560))

(assert (= (and b!157885 (not condMapEmpty!5560)) mapNonEmpty!5560))

(assert (= (and mapNonEmpty!5560 ((_ is ValueCellFull!1290) mapValue!5560)) b!157883))

(assert (= (and b!157885 ((_ is ValueCellFull!1290) mapDefault!5560)) b!157881))

(assert (= b!157884 b!157885))

(assert (= start!15858 b!157884))

(declare-fun m!190893 () Bool)

(assert (=> mapNonEmpty!5560 m!190893))

(declare-fun m!190895 () Bool)

(assert (=> b!157888 m!190895))

(declare-fun m!190897 () Bool)

(assert (=> b!157884 m!190897))

(declare-fun m!190899 () Bool)

(assert (=> b!157884 m!190899))

(declare-fun m!190901 () Bool)

(assert (=> start!15858 m!190901))

(declare-fun m!190903 () Bool)

(assert (=> b!157887 m!190903))

(check-sat (not b!157887) (not b!157888) (not b_next!3465) b_and!9879 (not b!157884) (not mapNonEmpty!5560) tp_is_empty!3267 (not start!15858))
(check-sat b_and!9879 (not b_next!3465))
(get-model)

(declare-fun d!51109 () Bool)

(assert (=> d!51109 (= (array_inv!1689 (_keys!4964 thiss!1248)) (bvsge (size!2931 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157884 d!51109))

(declare-fun d!51111 () Bool)

(assert (=> d!51111 (= (array_inv!1690 (_values!3169 thiss!1248)) (bvsge (size!2932 (_values!3169 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157884 d!51111))

(declare-fun d!51113 () Bool)

(assert (=> d!51113 (= (validMask!0 (mask!7681 thiss!1248)) (and (or (= (mask!7681 thiss!1248) #b00000000000000000000000000000111) (= (mask!7681 thiss!1248) #b00000000000000000000000000001111) (= (mask!7681 thiss!1248) #b00000000000000000000000000011111) (= (mask!7681 thiss!1248) #b00000000000000000000000000111111) (= (mask!7681 thiss!1248) #b00000000000000000000000001111111) (= (mask!7681 thiss!1248) #b00000000000000000000000011111111) (= (mask!7681 thiss!1248) #b00000000000000000000000111111111) (= (mask!7681 thiss!1248) #b00000000000000000000001111111111) (= (mask!7681 thiss!1248) #b00000000000000000000011111111111) (= (mask!7681 thiss!1248) #b00000000000000000000111111111111) (= (mask!7681 thiss!1248) #b00000000000000000001111111111111) (= (mask!7681 thiss!1248) #b00000000000000000011111111111111) (= (mask!7681 thiss!1248) #b00000000000000000111111111111111) (= (mask!7681 thiss!1248) #b00000000000000001111111111111111) (= (mask!7681 thiss!1248) #b00000000000000011111111111111111) (= (mask!7681 thiss!1248) #b00000000000000111111111111111111) (= (mask!7681 thiss!1248) #b00000000000001111111111111111111) (= (mask!7681 thiss!1248) #b00000000000011111111111111111111) (= (mask!7681 thiss!1248) #b00000000000111111111111111111111) (= (mask!7681 thiss!1248) #b00000000001111111111111111111111) (= (mask!7681 thiss!1248) #b00000000011111111111111111111111) (= (mask!7681 thiss!1248) #b00000000111111111111111111111111) (= (mask!7681 thiss!1248) #b00000001111111111111111111111111) (= (mask!7681 thiss!1248) #b00000011111111111111111111111111) (= (mask!7681 thiss!1248) #b00000111111111111111111111111111) (= (mask!7681 thiss!1248) #b00001111111111111111111111111111) (= (mask!7681 thiss!1248) #b00011111111111111111111111111111) (= (mask!7681 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7681 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157888 d!51113))

(declare-fun d!51115 () Bool)

(declare-fun res!74627 () Bool)

(declare-fun e!103438 () Bool)

(assert (=> d!51115 (=> (not res!74627) (not e!103438))))

(declare-fun simpleValid!110 (LongMapFixedSize!1488) Bool)

(assert (=> d!51115 (= res!74627 (simpleValid!110 thiss!1248))))

(assert (=> d!51115 (= (valid!703 thiss!1248) e!103438)))

(declare-fun b!157919 () Bool)

(declare-fun res!74628 () Bool)

(assert (=> b!157919 (=> (not res!74628) (not e!103438))))

(declare-fun arrayCountValidKeys!0 (array!5597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157919 (= res!74628 (= (arrayCountValidKeys!0 (_keys!4964 thiss!1248) #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))) (_size!793 thiss!1248)))))

(declare-fun b!157920 () Bool)

(declare-fun res!74629 () Bool)

(assert (=> b!157920 (=> (not res!74629) (not e!103438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5597 (_ BitVec 32)) Bool)

(assert (=> b!157920 (= res!74629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(declare-fun b!157921 () Bool)

(declare-datatypes ((List!1887 0))(
  ( (Nil!1884) (Cons!1883 (h!2492 (_ BitVec 64)) (t!6689 List!1887)) )
))
(declare-fun arrayNoDuplicates!0 (array!5597 (_ BitVec 32) List!1887) Bool)

(assert (=> b!157921 (= e!103438 (arrayNoDuplicates!0 (_keys!4964 thiss!1248) #b00000000000000000000000000000000 Nil!1884))))

(assert (= (and d!51115 res!74627) b!157919))

(assert (= (and b!157919 res!74628) b!157920))

(assert (= (and b!157920 res!74629) b!157921))

(declare-fun m!190917 () Bool)

(assert (=> d!51115 m!190917))

(declare-fun m!190919 () Bool)

(assert (=> b!157919 m!190919))

(declare-fun m!190921 () Bool)

(assert (=> b!157920 m!190921))

(declare-fun m!190923 () Bool)

(assert (=> b!157921 m!190923))

(assert (=> start!15858 d!51115))

(declare-fun b!157934 () Bool)

(declare-fun c!29732 () Bool)

(declare-fun lt!81764 () (_ BitVec 64))

(assert (=> b!157934 (= c!29732 (= lt!81764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103447 () SeekEntryResult!290)

(declare-fun e!103445 () SeekEntryResult!290)

(assert (=> b!157934 (= e!103447 e!103445)))

(declare-fun b!157935 () Bool)

(declare-fun lt!81766 () SeekEntryResult!290)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5597 (_ BitVec 32)) SeekEntryResult!290)

(assert (=> b!157935 (= e!103445 (seekKeyOrZeroReturnVacant!0 (x!17406 lt!81766) (index!3330 lt!81766) (index!3330 lt!81766) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(declare-fun b!157936 () Bool)

(assert (=> b!157936 (= e!103445 (MissingZero!290 (index!3330 lt!81766)))))

(declare-fun d!51117 () Bool)

(declare-fun lt!81765 () SeekEntryResult!290)

(assert (=> d!51117 (and (or ((_ is Undefined!290) lt!81765) (not ((_ is Found!290) lt!81765)) (and (bvsge (index!3329 lt!81765) #b00000000000000000000000000000000) (bvslt (index!3329 lt!81765) (size!2931 (_keys!4964 thiss!1248))))) (or ((_ is Undefined!290) lt!81765) ((_ is Found!290) lt!81765) (not ((_ is MissingZero!290) lt!81765)) (and (bvsge (index!3328 lt!81765) #b00000000000000000000000000000000) (bvslt (index!3328 lt!81765) (size!2931 (_keys!4964 thiss!1248))))) (or ((_ is Undefined!290) lt!81765) ((_ is Found!290) lt!81765) ((_ is MissingZero!290) lt!81765) (not ((_ is MissingVacant!290) lt!81765)) (and (bvsge (index!3331 lt!81765) #b00000000000000000000000000000000) (bvslt (index!3331 lt!81765) (size!2931 (_keys!4964 thiss!1248))))) (or ((_ is Undefined!290) lt!81765) (ite ((_ is Found!290) lt!81765) (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3329 lt!81765)) key!828) (ite ((_ is MissingZero!290) lt!81765) (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3328 lt!81765)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!290) lt!81765) (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3331 lt!81765)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103446 () SeekEntryResult!290)

(assert (=> d!51117 (= lt!81765 e!103446)))

(declare-fun c!29734 () Bool)

(assert (=> d!51117 (= c!29734 (and ((_ is Intermediate!290) lt!81766) (undefined!1102 lt!81766)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5597 (_ BitVec 32)) SeekEntryResult!290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51117 (= lt!81766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7681 thiss!1248)) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(assert (=> d!51117 (validMask!0 (mask!7681 thiss!1248))))

(assert (=> d!51117 (= (seekEntryOrOpen!0 key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)) lt!81765)))

(declare-fun b!157937 () Bool)

(assert (=> b!157937 (= e!103447 (Found!290 (index!3330 lt!81766)))))

(declare-fun b!157938 () Bool)

(assert (=> b!157938 (= e!103446 Undefined!290)))

(declare-fun b!157939 () Bool)

(assert (=> b!157939 (= e!103446 e!103447)))

(assert (=> b!157939 (= lt!81764 (select (arr!2651 (_keys!4964 thiss!1248)) (index!3330 lt!81766)))))

(declare-fun c!29733 () Bool)

(assert (=> b!157939 (= c!29733 (= lt!81764 key!828))))

(assert (= (and d!51117 c!29734) b!157938))

(assert (= (and d!51117 (not c!29734)) b!157939))

(assert (= (and b!157939 c!29733) b!157937))

(assert (= (and b!157939 (not c!29733)) b!157934))

(assert (= (and b!157934 c!29732) b!157936))

(assert (= (and b!157934 (not c!29732)) b!157935))

(declare-fun m!190925 () Bool)

(assert (=> b!157935 m!190925))

(assert (=> d!51117 m!190895))

(declare-fun m!190927 () Bool)

(assert (=> d!51117 m!190927))

(assert (=> d!51117 m!190927))

(declare-fun m!190929 () Bool)

(assert (=> d!51117 m!190929))

(declare-fun m!190931 () Bool)

(assert (=> d!51117 m!190931))

(declare-fun m!190933 () Bool)

(assert (=> d!51117 m!190933))

(declare-fun m!190935 () Bool)

(assert (=> d!51117 m!190935))

(declare-fun m!190937 () Bool)

(assert (=> b!157939 m!190937))

(assert (=> b!157887 d!51117))

(declare-fun mapNonEmpty!5566 () Bool)

(declare-fun mapRes!5566 () Bool)

(declare-fun tp!12946 () Bool)

(declare-fun e!103452 () Bool)

(assert (=> mapNonEmpty!5566 (= mapRes!5566 (and tp!12946 e!103452))))

(declare-fun mapKey!5566 () (_ BitVec 32))

(declare-fun mapValue!5566 () ValueCell!1290)

(declare-fun mapRest!5566 () (Array (_ BitVec 32) ValueCell!1290))

(assert (=> mapNonEmpty!5566 (= mapRest!5560 (store mapRest!5566 mapKey!5566 mapValue!5566))))

(declare-fun b!157947 () Bool)

(declare-fun e!103453 () Bool)

(assert (=> b!157947 (= e!103453 tp_is_empty!3267)))

(declare-fun condMapEmpty!5566 () Bool)

(declare-fun mapDefault!5566 () ValueCell!1290)

(assert (=> mapNonEmpty!5560 (= condMapEmpty!5566 (= mapRest!5560 ((as const (Array (_ BitVec 32) ValueCell!1290)) mapDefault!5566)))))

(assert (=> mapNonEmpty!5560 (= tp!12937 (and e!103453 mapRes!5566))))

(declare-fun b!157946 () Bool)

(assert (=> b!157946 (= e!103452 tp_is_empty!3267)))

(declare-fun mapIsEmpty!5566 () Bool)

(assert (=> mapIsEmpty!5566 mapRes!5566))

(assert (= (and mapNonEmpty!5560 condMapEmpty!5566) mapIsEmpty!5566))

(assert (= (and mapNonEmpty!5560 (not condMapEmpty!5566)) mapNonEmpty!5566))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1290) mapValue!5566)) b!157946))

(assert (= (and mapNonEmpty!5560 ((_ is ValueCellFull!1290) mapDefault!5566)) b!157947))

(declare-fun m!190939 () Bool)

(assert (=> mapNonEmpty!5566 m!190939))

(check-sat (not b!157920) (not mapNonEmpty!5566) (not d!51115) tp_is_empty!3267 (not b_next!3465) b_and!9879 (not b!157935) (not b!157921) (not b!157919) (not d!51117))
(check-sat b_and!9879 (not b_next!3465))
(get-model)

(declare-fun b!157958 () Bool)

(declare-fun e!103464 () Bool)

(declare-fun e!103465 () Bool)

(assert (=> b!157958 (= e!103464 e!103465)))

(declare-fun res!74638 () Bool)

(assert (=> b!157958 (=> (not res!74638) (not e!103465))))

(declare-fun e!103463 () Bool)

(assert (=> b!157958 (= res!74638 (not e!103463))))

(declare-fun res!74636 () Bool)

(assert (=> b!157958 (=> (not res!74636) (not e!103463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157958 (= res!74636 (validKeyInArray!0 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157959 () Bool)

(declare-fun e!103462 () Bool)

(declare-fun call!17236 () Bool)

(assert (=> b!157959 (= e!103462 call!17236)))

(declare-fun b!157960 () Bool)

(assert (=> b!157960 (= e!103465 e!103462)))

(declare-fun c!29737 () Bool)

(assert (=> b!157960 (= c!29737 (validKeyInArray!0 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157961 () Bool)

(assert (=> b!157961 (= e!103462 call!17236)))

(declare-fun b!157962 () Bool)

(declare-fun contains!979 (List!1887 (_ BitVec 64)) Bool)

(assert (=> b!157962 (= e!103463 (contains!979 Nil!1884 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17233 () Bool)

(assert (=> bm!17233 (= call!17236 (arrayNoDuplicates!0 (_keys!4964 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29737 (Cons!1883 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000) Nil!1884) Nil!1884)))))

(declare-fun d!51119 () Bool)

(declare-fun res!74637 () Bool)

(assert (=> d!51119 (=> res!74637 e!103464)))

(assert (=> d!51119 (= res!74637 (bvsge #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))))))

(assert (=> d!51119 (= (arrayNoDuplicates!0 (_keys!4964 thiss!1248) #b00000000000000000000000000000000 Nil!1884) e!103464)))

(assert (= (and d!51119 (not res!74637)) b!157958))

(assert (= (and b!157958 res!74636) b!157962))

(assert (= (and b!157958 res!74638) b!157960))

(assert (= (and b!157960 c!29737) b!157959))

(assert (= (and b!157960 (not c!29737)) b!157961))

(assert (= (or b!157959 b!157961) bm!17233))

(declare-fun m!190941 () Bool)

(assert (=> b!157958 m!190941))

(assert (=> b!157958 m!190941))

(declare-fun m!190943 () Bool)

(assert (=> b!157958 m!190943))

(assert (=> b!157960 m!190941))

(assert (=> b!157960 m!190941))

(assert (=> b!157960 m!190943))

(assert (=> b!157962 m!190941))

(assert (=> b!157962 m!190941))

(declare-fun m!190945 () Bool)

(assert (=> b!157962 m!190945))

(assert (=> bm!17233 m!190941))

(declare-fun m!190947 () Bool)

(assert (=> bm!17233 m!190947))

(assert (=> b!157921 d!51119))

(declare-fun b!157975 () Bool)

(declare-fun e!103474 () SeekEntryResult!290)

(assert (=> b!157975 (= e!103474 (Found!290 (index!3330 lt!81766)))))

(declare-fun b!157976 () Bool)

(declare-fun e!103473 () SeekEntryResult!290)

(assert (=> b!157976 (= e!103473 e!103474)))

(declare-fun c!29746 () Bool)

(declare-fun lt!81771 () (_ BitVec 64))

(assert (=> b!157976 (= c!29746 (= lt!81771 key!828))))

(declare-fun b!157977 () Bool)

(assert (=> b!157977 (= e!103473 Undefined!290)))

(declare-fun d!51121 () Bool)

(declare-fun lt!81772 () SeekEntryResult!290)

(assert (=> d!51121 (and (or ((_ is Undefined!290) lt!81772) (not ((_ is Found!290) lt!81772)) (and (bvsge (index!3329 lt!81772) #b00000000000000000000000000000000) (bvslt (index!3329 lt!81772) (size!2931 (_keys!4964 thiss!1248))))) (or ((_ is Undefined!290) lt!81772) ((_ is Found!290) lt!81772) (not ((_ is MissingVacant!290) lt!81772)) (not (= (index!3331 lt!81772) (index!3330 lt!81766))) (and (bvsge (index!3331 lt!81772) #b00000000000000000000000000000000) (bvslt (index!3331 lt!81772) (size!2931 (_keys!4964 thiss!1248))))) (or ((_ is Undefined!290) lt!81772) (ite ((_ is Found!290) lt!81772) (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3329 lt!81772)) key!828) (and ((_ is MissingVacant!290) lt!81772) (= (index!3331 lt!81772) (index!3330 lt!81766)) (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3331 lt!81772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51121 (= lt!81772 e!103473)))

(declare-fun c!29744 () Bool)

(assert (=> d!51121 (= c!29744 (bvsge (x!17406 lt!81766) #b01111111111111111111111111111110))))

(assert (=> d!51121 (= lt!81771 (select (arr!2651 (_keys!4964 thiss!1248)) (index!3330 lt!81766)))))

(assert (=> d!51121 (validMask!0 (mask!7681 thiss!1248))))

(assert (=> d!51121 (= (seekKeyOrZeroReturnVacant!0 (x!17406 lt!81766) (index!3330 lt!81766) (index!3330 lt!81766) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)) lt!81772)))

(declare-fun e!103472 () SeekEntryResult!290)

(declare-fun b!157978 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157978 (= e!103472 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17406 lt!81766) #b00000000000000000000000000000001) (nextIndex!0 (index!3330 lt!81766) (x!17406 lt!81766) (mask!7681 thiss!1248)) (index!3330 lt!81766) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(declare-fun b!157979 () Bool)

(declare-fun c!29745 () Bool)

(assert (=> b!157979 (= c!29745 (= lt!81771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157979 (= e!103474 e!103472)))

(declare-fun b!157980 () Bool)

(assert (=> b!157980 (= e!103472 (MissingVacant!290 (index!3330 lt!81766)))))

(assert (= (and d!51121 c!29744) b!157977))

(assert (= (and d!51121 (not c!29744)) b!157976))

(assert (= (and b!157976 c!29746) b!157975))

(assert (= (and b!157976 (not c!29746)) b!157979))

(assert (= (and b!157979 c!29745) b!157980))

(assert (= (and b!157979 (not c!29745)) b!157978))

(declare-fun m!190949 () Bool)

(assert (=> d!51121 m!190949))

(declare-fun m!190951 () Bool)

(assert (=> d!51121 m!190951))

(assert (=> d!51121 m!190937))

(assert (=> d!51121 m!190895))

(declare-fun m!190953 () Bool)

(assert (=> b!157978 m!190953))

(assert (=> b!157978 m!190953))

(declare-fun m!190955 () Bool)

(assert (=> b!157978 m!190955))

(assert (=> b!157935 d!51121))

(declare-fun b!157999 () Bool)

(declare-fun e!103486 () Bool)

(declare-fun lt!81778 () SeekEntryResult!290)

(assert (=> b!157999 (= e!103486 (bvsge (x!17406 lt!81778) #b01111111111111111111111111111110))))

(declare-fun b!158000 () Bool)

(declare-fun e!103489 () SeekEntryResult!290)

(assert (=> b!158000 (= e!103489 (Intermediate!290 false (toIndex!0 key!828 (mask!7681 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51123 () Bool)

(assert (=> d!51123 e!103486))

(declare-fun c!29753 () Bool)

(assert (=> d!51123 (= c!29753 (and ((_ is Intermediate!290) lt!81778) (undefined!1102 lt!81778)))))

(declare-fun e!103487 () SeekEntryResult!290)

(assert (=> d!51123 (= lt!81778 e!103487)))

(declare-fun c!29754 () Bool)

(assert (=> d!51123 (= c!29754 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!81777 () (_ BitVec 64))

(assert (=> d!51123 (= lt!81777 (select (arr!2651 (_keys!4964 thiss!1248)) (toIndex!0 key!828 (mask!7681 thiss!1248))))))

(assert (=> d!51123 (validMask!0 (mask!7681 thiss!1248))))

(assert (=> d!51123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7681 thiss!1248)) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)) lt!81778)))

(declare-fun b!158001 () Bool)

(assert (=> b!158001 (= e!103487 e!103489)))

(declare-fun c!29755 () Bool)

(assert (=> b!158001 (= c!29755 (or (= lt!81777 key!828) (= (bvadd lt!81777 lt!81777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158002 () Bool)

(assert (=> b!158002 (and (bvsge (index!3330 lt!81778) #b00000000000000000000000000000000) (bvslt (index!3330 lt!81778) (size!2931 (_keys!4964 thiss!1248))))))

(declare-fun e!103488 () Bool)

(assert (=> b!158002 (= e!103488 (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3330 lt!81778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158003 () Bool)

(assert (=> b!158003 (= e!103487 (Intermediate!290 true (toIndex!0 key!828 (mask!7681 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158004 () Bool)

(declare-fun e!103485 () Bool)

(assert (=> b!158004 (= e!103486 e!103485)))

(declare-fun res!74645 () Bool)

(assert (=> b!158004 (= res!74645 (and ((_ is Intermediate!290) lt!81778) (not (undefined!1102 lt!81778)) (bvslt (x!17406 lt!81778) #b01111111111111111111111111111110) (bvsge (x!17406 lt!81778) #b00000000000000000000000000000000) (bvsge (x!17406 lt!81778) #b00000000000000000000000000000000)))))

(assert (=> b!158004 (=> (not res!74645) (not e!103485))))

(declare-fun b!158005 () Bool)

(assert (=> b!158005 (= e!103489 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7681 thiss!1248)) #b00000000000000000000000000000000 (mask!7681 thiss!1248)) key!828 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(declare-fun b!158006 () Bool)

(assert (=> b!158006 (and (bvsge (index!3330 lt!81778) #b00000000000000000000000000000000) (bvslt (index!3330 lt!81778) (size!2931 (_keys!4964 thiss!1248))))))

(declare-fun res!74646 () Bool)

(assert (=> b!158006 (= res!74646 (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3330 lt!81778)) key!828))))

(assert (=> b!158006 (=> res!74646 e!103488)))

(assert (=> b!158006 (= e!103485 e!103488)))

(declare-fun b!158007 () Bool)

(assert (=> b!158007 (and (bvsge (index!3330 lt!81778) #b00000000000000000000000000000000) (bvslt (index!3330 lt!81778) (size!2931 (_keys!4964 thiss!1248))))))

(declare-fun res!74647 () Bool)

(assert (=> b!158007 (= res!74647 (= (select (arr!2651 (_keys!4964 thiss!1248)) (index!3330 lt!81778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158007 (=> res!74647 e!103488)))

(assert (= (and d!51123 c!29754) b!158003))

(assert (= (and d!51123 (not c!29754)) b!158001))

(assert (= (and b!158001 c!29755) b!158000))

(assert (= (and b!158001 (not c!29755)) b!158005))

(assert (= (and d!51123 c!29753) b!157999))

(assert (= (and d!51123 (not c!29753)) b!158004))

(assert (= (and b!158004 res!74645) b!158006))

(assert (= (and b!158006 (not res!74646)) b!158007))

(assert (= (and b!158007 (not res!74647)) b!158002))

(declare-fun m!190957 () Bool)

(assert (=> b!158006 m!190957))

(assert (=> d!51123 m!190927))

(declare-fun m!190959 () Bool)

(assert (=> d!51123 m!190959))

(assert (=> d!51123 m!190895))

(assert (=> b!158007 m!190957))

(assert (=> b!158002 m!190957))

(assert (=> b!158005 m!190927))

(declare-fun m!190961 () Bool)

(assert (=> b!158005 m!190961))

(assert (=> b!158005 m!190961))

(declare-fun m!190963 () Bool)

(assert (=> b!158005 m!190963))

(assert (=> d!51117 d!51123))

(declare-fun d!51125 () Bool)

(declare-fun lt!81784 () (_ BitVec 32))

(declare-fun lt!81783 () (_ BitVec 32))

(assert (=> d!51125 (= lt!81784 (bvmul (bvxor lt!81783 (bvlshr lt!81783 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51125 (= lt!81783 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51125 (and (bvsge (mask!7681 thiss!1248) #b00000000000000000000000000000000) (let ((res!74648 (let ((h!2493 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17424 (bvmul (bvxor h!2493 (bvlshr h!2493 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17424 (bvlshr x!17424 #b00000000000000000000000000001101)) (mask!7681 thiss!1248)))))) (and (bvslt res!74648 (bvadd (mask!7681 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74648 #b00000000000000000000000000000000))))))

(assert (=> d!51125 (= (toIndex!0 key!828 (mask!7681 thiss!1248)) (bvand (bvxor lt!81784 (bvlshr lt!81784 #b00000000000000000000000000001101)) (mask!7681 thiss!1248)))))

(assert (=> d!51117 d!51125))

(assert (=> d!51117 d!51113))

(declare-fun d!51127 () Bool)

(declare-fun res!74654 () Bool)

(declare-fun e!103497 () Bool)

(assert (=> d!51127 (=> res!74654 e!103497)))

(assert (=> d!51127 (= res!74654 (bvsge #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))))))

(assert (=> d!51127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4964 thiss!1248) (mask!7681 thiss!1248)) e!103497)))

(declare-fun bm!17236 () Bool)

(declare-fun call!17239 () Bool)

(assert (=> bm!17236 (= call!17239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4964 thiss!1248) (mask!7681 thiss!1248)))))

(declare-fun b!158016 () Bool)

(declare-fun e!103496 () Bool)

(assert (=> b!158016 (= e!103497 e!103496)))

(declare-fun c!29758 () Bool)

(assert (=> b!158016 (= c!29758 (validKeyInArray!0 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158017 () Bool)

(assert (=> b!158017 (= e!103496 call!17239)))

(declare-fun b!158018 () Bool)

(declare-fun e!103498 () Bool)

(assert (=> b!158018 (= e!103496 e!103498)))

(declare-fun lt!81792 () (_ BitVec 64))

(assert (=> b!158018 (= lt!81792 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4982 0))(
  ( (Unit!4983) )
))
(declare-fun lt!81791 () Unit!4982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5597 (_ BitVec 64) (_ BitVec 32)) Unit!4982)

(assert (=> b!158018 (= lt!81791 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4964 thiss!1248) lt!81792 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158018 (arrayContainsKey!0 (_keys!4964 thiss!1248) lt!81792 #b00000000000000000000000000000000)))

(declare-fun lt!81793 () Unit!4982)

(assert (=> b!158018 (= lt!81793 lt!81791)))

(declare-fun res!74653 () Bool)

(assert (=> b!158018 (= res!74653 (= (seekEntryOrOpen!0 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000) (_keys!4964 thiss!1248) (mask!7681 thiss!1248)) (Found!290 #b00000000000000000000000000000000)))))

(assert (=> b!158018 (=> (not res!74653) (not e!103498))))

(declare-fun b!158019 () Bool)

(assert (=> b!158019 (= e!103498 call!17239)))

(assert (= (and d!51127 (not res!74654)) b!158016))

(assert (= (and b!158016 c!29758) b!158018))

(assert (= (and b!158016 (not c!29758)) b!158017))

(assert (= (and b!158018 res!74653) b!158019))

(assert (= (or b!158019 b!158017) bm!17236))

(declare-fun m!190965 () Bool)

(assert (=> bm!17236 m!190965))

(assert (=> b!158016 m!190941))

(assert (=> b!158016 m!190941))

(assert (=> b!158016 m!190943))

(assert (=> b!158018 m!190941))

(declare-fun m!190967 () Bool)

(assert (=> b!158018 m!190967))

(declare-fun m!190969 () Bool)

(assert (=> b!158018 m!190969))

(assert (=> b!158018 m!190941))

(declare-fun m!190971 () Bool)

(assert (=> b!158018 m!190971))

(assert (=> b!157920 d!51127))

(declare-fun b!158028 () Bool)

(declare-fun e!103503 () (_ BitVec 32))

(declare-fun call!17242 () (_ BitVec 32))

(assert (=> b!158028 (= e!103503 (bvadd #b00000000000000000000000000000001 call!17242))))

(declare-fun b!158029 () Bool)

(declare-fun e!103504 () (_ BitVec 32))

(assert (=> b!158029 (= e!103504 e!103503)))

(declare-fun c!29764 () Bool)

(assert (=> b!158029 (= c!29764 (validKeyInArray!0 (select (arr!2651 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17239 () Bool)

(assert (=> bm!17239 (= call!17242 (arrayCountValidKeys!0 (_keys!4964 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2931 (_keys!4964 thiss!1248))))))

(declare-fun d!51129 () Bool)

(declare-fun lt!81796 () (_ BitVec 32))

(assert (=> d!51129 (and (bvsge lt!81796 #b00000000000000000000000000000000) (bvsle lt!81796 (bvsub (size!2931 (_keys!4964 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51129 (= lt!81796 e!103504)))

(declare-fun c!29763 () Bool)

(assert (=> d!51129 (= c!29763 (bvsge #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))))))

(assert (=> d!51129 (and (bvsle #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2931 (_keys!4964 thiss!1248)) (size!2931 (_keys!4964 thiss!1248))))))

(assert (=> d!51129 (= (arrayCountValidKeys!0 (_keys!4964 thiss!1248) #b00000000000000000000000000000000 (size!2931 (_keys!4964 thiss!1248))) lt!81796)))

(declare-fun b!158030 () Bool)

(assert (=> b!158030 (= e!103503 call!17242)))

(declare-fun b!158031 () Bool)

(assert (=> b!158031 (= e!103504 #b00000000000000000000000000000000)))

(assert (= (and d!51129 c!29763) b!158031))

(assert (= (and d!51129 (not c!29763)) b!158029))

(assert (= (and b!158029 c!29764) b!158028))

(assert (= (and b!158029 (not c!29764)) b!158030))

(assert (= (or b!158028 b!158030) bm!17239))

(assert (=> b!158029 m!190941))

(assert (=> b!158029 m!190941))

(assert (=> b!158029 m!190943))

(declare-fun m!190973 () Bool)

(assert (=> bm!17239 m!190973))

(assert (=> b!157919 d!51129))

(declare-fun b!158040 () Bool)

(declare-fun res!74663 () Bool)

(declare-fun e!103507 () Bool)

(assert (=> b!158040 (=> (not res!74663) (not e!103507))))

(assert (=> b!158040 (= res!74663 (and (= (size!2932 (_values!3169 thiss!1248)) (bvadd (mask!7681 thiss!1248) #b00000000000000000000000000000001)) (= (size!2931 (_keys!4964 thiss!1248)) (size!2932 (_values!3169 thiss!1248))) (bvsge (_size!793 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!793 thiss!1248) (bvadd (mask!7681 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158041 () Bool)

(declare-fun res!74664 () Bool)

(assert (=> b!158041 (=> (not res!74664) (not e!103507))))

(declare-fun size!2935 (LongMapFixedSize!1488) (_ BitVec 32))

(assert (=> b!158041 (= res!74664 (bvsge (size!2935 thiss!1248) (_size!793 thiss!1248)))))

(declare-fun b!158043 () Bool)

(assert (=> b!158043 (= e!103507 (and (bvsge (extraKeys!2927 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2927 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!793 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158042 () Bool)

(declare-fun res!74666 () Bool)

(assert (=> b!158042 (=> (not res!74666) (not e!103507))))

(assert (=> b!158042 (= res!74666 (= (size!2935 thiss!1248) (bvadd (_size!793 thiss!1248) (bvsdiv (bvadd (extraKeys!2927 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51131 () Bool)

(declare-fun res!74665 () Bool)

(assert (=> d!51131 (=> (not res!74665) (not e!103507))))

(assert (=> d!51131 (= res!74665 (validMask!0 (mask!7681 thiss!1248)))))

(assert (=> d!51131 (= (simpleValid!110 thiss!1248) e!103507)))

(assert (= (and d!51131 res!74665) b!158040))

(assert (= (and b!158040 res!74663) b!158041))

(assert (= (and b!158041 res!74664) b!158042))

(assert (= (and b!158042 res!74666) b!158043))

(declare-fun m!190975 () Bool)

(assert (=> b!158041 m!190975))

(assert (=> b!158042 m!190975))

(assert (=> d!51131 m!190895))

(assert (=> d!51115 d!51131))

(declare-fun mapNonEmpty!5567 () Bool)

(declare-fun mapRes!5567 () Bool)

(declare-fun tp!12947 () Bool)

(declare-fun e!103508 () Bool)

(assert (=> mapNonEmpty!5567 (= mapRes!5567 (and tp!12947 e!103508))))

(declare-fun mapRest!5567 () (Array (_ BitVec 32) ValueCell!1290))

(declare-fun mapKey!5567 () (_ BitVec 32))

(declare-fun mapValue!5567 () ValueCell!1290)

(assert (=> mapNonEmpty!5567 (= mapRest!5566 (store mapRest!5567 mapKey!5567 mapValue!5567))))

(declare-fun b!158045 () Bool)

(declare-fun e!103509 () Bool)

(assert (=> b!158045 (= e!103509 tp_is_empty!3267)))

(declare-fun condMapEmpty!5567 () Bool)

(declare-fun mapDefault!5567 () ValueCell!1290)

(assert (=> mapNonEmpty!5566 (= condMapEmpty!5567 (= mapRest!5566 ((as const (Array (_ BitVec 32) ValueCell!1290)) mapDefault!5567)))))

(assert (=> mapNonEmpty!5566 (= tp!12946 (and e!103509 mapRes!5567))))

(declare-fun b!158044 () Bool)

(assert (=> b!158044 (= e!103508 tp_is_empty!3267)))

(declare-fun mapIsEmpty!5567 () Bool)

(assert (=> mapIsEmpty!5567 mapRes!5567))

(assert (= (and mapNonEmpty!5566 condMapEmpty!5567) mapIsEmpty!5567))

(assert (= (and mapNonEmpty!5566 (not condMapEmpty!5567)) mapNonEmpty!5567))

(assert (= (and mapNonEmpty!5567 ((_ is ValueCellFull!1290) mapValue!5567)) b!158044))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1290) mapDefault!5567)) b!158045))

(declare-fun m!190977 () Bool)

(assert (=> mapNonEmpty!5567 m!190977))

(check-sat (not d!51121) (not bm!17239) tp_is_empty!3267 (not b!157978) (not b_next!3465) (not b!158041) (not d!51123) b_and!9879 (not mapNonEmpty!5567) (not bm!17233) (not b!158018) (not d!51131) (not b!158005) (not b!157962) (not bm!17236) (not b!158042) (not b!157958) (not b!158016) (not b!157960) (not b!158029))
(check-sat b_and!9879 (not b_next!3465))
