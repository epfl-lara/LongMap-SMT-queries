; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15994 () Bool)

(assert start!15994)

(declare-fun b!158815 () Bool)

(declare-fun b_free!3495 () Bool)

(declare-fun b_next!3495 () Bool)

(assert (=> b!158815 (= b_free!3495 (not b_next!3495))))

(declare-fun tp!13046 () Bool)

(declare-fun b_and!9909 () Bool)

(assert (=> b!158815 (= tp!13046 b_and!9909)))

(declare-fun mapIsEmpty!5624 () Bool)

(declare-fun mapRes!5624 () Bool)

(assert (=> mapIsEmpty!5624 mapRes!5624))

(declare-fun b!158814 () Bool)

(declare-fun e!104000 () Bool)

(declare-fun tp_is_empty!3297 () Bool)

(assert (=> b!158814 (= e!104000 tp_is_empty!3297)))

(declare-datatypes ((V!4043 0))(
  ( (V!4044 (val!1693 Int)) )
))
(declare-datatypes ((ValueCell!1305 0))(
  ( (ValueCellFull!1305 (v!3558 V!4043)) (EmptyCell!1305) )
))
(declare-datatypes ((array!5667 0))(
  ( (array!5668 (arr!2681 (Array (_ BitVec 32) (_ BitVec 64))) (size!2965 (_ BitVec 32))) )
))
(declare-datatypes ((array!5669 0))(
  ( (array!5670 (arr!2682 (Array (_ BitVec 32) ValueCell!1305)) (size!2966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1518 0))(
  ( (LongMapFixedSize!1519 (defaultEntry!3201 Int) (mask!7732 (_ BitVec 32)) (extraKeys!2942 (_ BitVec 32)) (zeroValue!3044 V!4043) (minValue!3044 V!4043) (_size!808 (_ BitVec 32)) (_keys!4996 array!5667) (_values!3184 array!5669) (_vacant!808 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1518)

(declare-fun e!103996 () Bool)

(declare-fun e!103998 () Bool)

(declare-fun array_inv!1703 (array!5667) Bool)

(declare-fun array_inv!1704 (array!5669) Bool)

(assert (=> b!158815 (= e!103996 (and tp!13046 tp_is_empty!3297 (array_inv!1703 (_keys!4996 thiss!1248)) (array_inv!1704 (_values!3184 thiss!1248)) e!103998))))

(declare-fun b!158816 () Bool)

(assert (=> b!158816 (= e!103998 (and e!104000 mapRes!5624))))

(declare-fun condMapEmpty!5624 () Bool)

(declare-fun mapDefault!5624 () ValueCell!1305)

(assert (=> b!158816 (= condMapEmpty!5624 (= (arr!2682 (_values!3184 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1305)) mapDefault!5624)))))

(declare-fun b!158817 () Bool)

(declare-fun e!103997 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5667 (_ BitVec 32)) Bool)

(assert (=> b!158817 (= e!103997 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4996 thiss!1248) (mask!7732 thiss!1248))))))

(declare-fun b!158818 () Bool)

(declare-fun res!74984 () Bool)

(assert (=> b!158818 (=> (not res!74984) (not e!103997))))

(assert (=> b!158818 (= res!74984 (and (= (size!2966 (_values!3184 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7732 thiss!1248))) (= (size!2965 (_keys!4996 thiss!1248)) (size!2966 (_values!3184 thiss!1248))) (bvsge (mask!7732 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2942 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2942 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158819 () Bool)

(declare-fun res!74983 () Bool)

(assert (=> b!158819 (=> (not res!74983) (not e!103997))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158819 (= res!74983 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5624 () Bool)

(declare-fun tp!13045 () Bool)

(declare-fun e!104001 () Bool)

(assert (=> mapNonEmpty!5624 (= mapRes!5624 (and tp!13045 e!104001))))

(declare-fun mapRest!5624 () (Array (_ BitVec 32) ValueCell!1305))

(declare-fun mapKey!5624 () (_ BitVec 32))

(declare-fun mapValue!5624 () ValueCell!1305)

(assert (=> mapNonEmpty!5624 (= (arr!2682 (_values!3184 thiss!1248)) (store mapRest!5624 mapKey!5624 mapValue!5624))))

(declare-fun b!158813 () Bool)

(declare-fun res!74985 () Bool)

(assert (=> b!158813 (=> (not res!74985) (not e!103997))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!300 0))(
  ( (MissingZero!300 (index!3368 (_ BitVec 32))) (Found!300 (index!3369 (_ BitVec 32))) (Intermediate!300 (undefined!1112 Bool) (index!3370 (_ BitVec 32)) (x!17532 (_ BitVec 32))) (Undefined!300) (MissingVacant!300 (index!3371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5667 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!158813 (= res!74985 ((_ is Undefined!300) (seekEntryOrOpen!0 key!828 (_keys!4996 thiss!1248) (mask!7732 thiss!1248))))))

(declare-fun res!74987 () Bool)

(assert (=> start!15994 (=> (not res!74987) (not e!103997))))

(declare-fun valid!715 (LongMapFixedSize!1518) Bool)

(assert (=> start!15994 (= res!74987 (valid!715 thiss!1248))))

(assert (=> start!15994 e!103997))

(assert (=> start!15994 e!103996))

(assert (=> start!15994 true))

(declare-fun b!158820 () Bool)

(declare-fun res!74986 () Bool)

(assert (=> b!158820 (=> (not res!74986) (not e!103997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158820 (= res!74986 (validMask!0 (mask!7732 thiss!1248)))))

(declare-fun b!158821 () Bool)

(assert (=> b!158821 (= e!104001 tp_is_empty!3297)))

(assert (= (and start!15994 res!74987) b!158819))

(assert (= (and b!158819 res!74983) b!158813))

(assert (= (and b!158813 res!74985) b!158820))

(assert (= (and b!158820 res!74986) b!158818))

(assert (= (and b!158818 res!74984) b!158817))

(assert (= (and b!158816 condMapEmpty!5624) mapIsEmpty!5624))

(assert (= (and b!158816 (not condMapEmpty!5624)) mapNonEmpty!5624))

(assert (= (and mapNonEmpty!5624 ((_ is ValueCellFull!1305) mapValue!5624)) b!158821))

(assert (= (and b!158816 ((_ is ValueCellFull!1305) mapDefault!5624)) b!158814))

(assert (= b!158815 b!158816))

(assert (= start!15994 b!158815))

(declare-fun m!191347 () Bool)

(assert (=> b!158817 m!191347))

(declare-fun m!191349 () Bool)

(assert (=> mapNonEmpty!5624 m!191349))

(declare-fun m!191351 () Bool)

(assert (=> b!158815 m!191351))

(declare-fun m!191353 () Bool)

(assert (=> b!158815 m!191353))

(declare-fun m!191355 () Bool)

(assert (=> b!158813 m!191355))

(declare-fun m!191357 () Bool)

(assert (=> start!15994 m!191357))

(declare-fun m!191359 () Bool)

(assert (=> b!158820 m!191359))

(check-sat (not start!15994) tp_is_empty!3297 b_and!9909 (not b_next!3495) (not mapNonEmpty!5624) (not b!158815) (not b!158813) (not b!158817) (not b!158820))
(check-sat b_and!9909 (not b_next!3495))
(get-model)

(declare-fun d!51225 () Bool)

(assert (=> d!51225 (= (validMask!0 (mask!7732 thiss!1248)) (and (or (= (mask!7732 thiss!1248) #b00000000000000000000000000000111) (= (mask!7732 thiss!1248) #b00000000000000000000000000001111) (= (mask!7732 thiss!1248) #b00000000000000000000000000011111) (= (mask!7732 thiss!1248) #b00000000000000000000000000111111) (= (mask!7732 thiss!1248) #b00000000000000000000000001111111) (= (mask!7732 thiss!1248) #b00000000000000000000000011111111) (= (mask!7732 thiss!1248) #b00000000000000000000000111111111) (= (mask!7732 thiss!1248) #b00000000000000000000001111111111) (= (mask!7732 thiss!1248) #b00000000000000000000011111111111) (= (mask!7732 thiss!1248) #b00000000000000000000111111111111) (= (mask!7732 thiss!1248) #b00000000000000000001111111111111) (= (mask!7732 thiss!1248) #b00000000000000000011111111111111) (= (mask!7732 thiss!1248) #b00000000000000000111111111111111) (= (mask!7732 thiss!1248) #b00000000000000001111111111111111) (= (mask!7732 thiss!1248) #b00000000000000011111111111111111) (= (mask!7732 thiss!1248) #b00000000000000111111111111111111) (= (mask!7732 thiss!1248) #b00000000000001111111111111111111) (= (mask!7732 thiss!1248) #b00000000000011111111111111111111) (= (mask!7732 thiss!1248) #b00000000000111111111111111111111) (= (mask!7732 thiss!1248) #b00000000001111111111111111111111) (= (mask!7732 thiss!1248) #b00000000011111111111111111111111) (= (mask!7732 thiss!1248) #b00000000111111111111111111111111) (= (mask!7732 thiss!1248) #b00000001111111111111111111111111) (= (mask!7732 thiss!1248) #b00000011111111111111111111111111) (= (mask!7732 thiss!1248) #b00000111111111111111111111111111) (= (mask!7732 thiss!1248) #b00001111111111111111111111111111) (= (mask!7732 thiss!1248) #b00011111111111111111111111111111) (= (mask!7732 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7732 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158820 d!51225))

(declare-fun d!51227 () Bool)

(assert (=> d!51227 (= (array_inv!1703 (_keys!4996 thiss!1248)) (bvsge (size!2965 (_keys!4996 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158815 d!51227))

(declare-fun d!51229 () Bool)

(assert (=> d!51229 (= (array_inv!1704 (_values!3184 thiss!1248)) (bvsge (size!2966 (_values!3184 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158815 d!51229))

(declare-fun d!51231 () Bool)

(declare-fun res!75009 () Bool)

(declare-fun e!104022 () Bool)

(assert (=> d!51231 (=> (not res!75009) (not e!104022))))

(declare-fun simpleValid!115 (LongMapFixedSize!1518) Bool)

(assert (=> d!51231 (= res!75009 (simpleValid!115 thiss!1248))))

(assert (=> d!51231 (= (valid!715 thiss!1248) e!104022)))

(declare-fun b!158855 () Bool)

(declare-fun res!75010 () Bool)

(assert (=> b!158855 (=> (not res!75010) (not e!104022))))

(declare-fun arrayCountValidKeys!0 (array!5667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158855 (= res!75010 (= (arrayCountValidKeys!0 (_keys!4996 thiss!1248) #b00000000000000000000000000000000 (size!2965 (_keys!4996 thiss!1248))) (_size!808 thiss!1248)))))

(declare-fun b!158856 () Bool)

(declare-fun res!75011 () Bool)

(assert (=> b!158856 (=> (not res!75011) (not e!104022))))

(assert (=> b!158856 (= res!75011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4996 thiss!1248) (mask!7732 thiss!1248)))))

(declare-fun b!158857 () Bool)

(declare-datatypes ((List!1892 0))(
  ( (Nil!1889) (Cons!1888 (h!2501 (_ BitVec 64)) (t!6694 List!1892)) )
))
(declare-fun arrayNoDuplicates!0 (array!5667 (_ BitVec 32) List!1892) Bool)

(assert (=> b!158857 (= e!104022 (arrayNoDuplicates!0 (_keys!4996 thiss!1248) #b00000000000000000000000000000000 Nil!1889))))

(assert (= (and d!51231 res!75009) b!158855))

(assert (= (and b!158855 res!75010) b!158856))

(assert (= (and b!158856 res!75011) b!158857))

(declare-fun m!191375 () Bool)

(assert (=> d!51231 m!191375))

(declare-fun m!191377 () Bool)

(assert (=> b!158855 m!191377))

(assert (=> b!158856 m!191347))

(declare-fun m!191379 () Bool)

(assert (=> b!158857 m!191379))

(assert (=> start!15994 d!51231))

(declare-fun b!158866 () Bool)

(declare-fun e!104031 () Bool)

(declare-fun e!104030 () Bool)

(assert (=> b!158866 (= e!104031 e!104030)))

(declare-fun lt!81929 () (_ BitVec 64))

(assert (=> b!158866 (= lt!81929 (select (arr!2681 (_keys!4996 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4990 0))(
  ( (Unit!4991) )
))
(declare-fun lt!81930 () Unit!4990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5667 (_ BitVec 64) (_ BitVec 32)) Unit!4990)

(assert (=> b!158866 (= lt!81930 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4996 thiss!1248) lt!81929 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158866 (arrayContainsKey!0 (_keys!4996 thiss!1248) lt!81929 #b00000000000000000000000000000000)))

(declare-fun lt!81931 () Unit!4990)

(assert (=> b!158866 (= lt!81931 lt!81930)))

(declare-fun res!75017 () Bool)

(assert (=> b!158866 (= res!75017 (= (seekEntryOrOpen!0 (select (arr!2681 (_keys!4996 thiss!1248)) #b00000000000000000000000000000000) (_keys!4996 thiss!1248) (mask!7732 thiss!1248)) (Found!300 #b00000000000000000000000000000000)))))

(assert (=> b!158866 (=> (not res!75017) (not e!104030))))

(declare-fun b!158867 () Bool)

(declare-fun e!104029 () Bool)

(assert (=> b!158867 (= e!104029 e!104031)))

(declare-fun c!29893 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158867 (= c!29893 (validKeyInArray!0 (select (arr!2681 (_keys!4996 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51233 () Bool)

(declare-fun res!75016 () Bool)

(assert (=> d!51233 (=> res!75016 e!104029)))

(assert (=> d!51233 (= res!75016 (bvsge #b00000000000000000000000000000000 (size!2965 (_keys!4996 thiss!1248))))))

(assert (=> d!51233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4996 thiss!1248) (mask!7732 thiss!1248)) e!104029)))

(declare-fun b!158868 () Bool)

(declare-fun call!17272 () Bool)

(assert (=> b!158868 (= e!104031 call!17272)))

(declare-fun bm!17269 () Bool)

(assert (=> bm!17269 (= call!17272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4996 thiss!1248) (mask!7732 thiss!1248)))))

(declare-fun b!158869 () Bool)

(assert (=> b!158869 (= e!104030 call!17272)))

(assert (= (and d!51233 (not res!75016)) b!158867))

(assert (= (and b!158867 c!29893) b!158866))

(assert (= (and b!158867 (not c!29893)) b!158868))

(assert (= (and b!158866 res!75017) b!158869))

(assert (= (or b!158869 b!158868) bm!17269))

(declare-fun m!191381 () Bool)

(assert (=> b!158866 m!191381))

(declare-fun m!191383 () Bool)

(assert (=> b!158866 m!191383))

(declare-fun m!191385 () Bool)

(assert (=> b!158866 m!191385))

(assert (=> b!158866 m!191381))

(declare-fun m!191387 () Bool)

(assert (=> b!158866 m!191387))

(assert (=> b!158867 m!191381))

(assert (=> b!158867 m!191381))

(declare-fun m!191389 () Bool)

(assert (=> b!158867 m!191389))

(declare-fun m!191391 () Bool)

(assert (=> bm!17269 m!191391))

(assert (=> b!158817 d!51233))

(declare-fun b!158882 () Bool)

(declare-fun c!29900 () Bool)

(declare-fun lt!81938 () (_ BitVec 64))

(assert (=> b!158882 (= c!29900 (= lt!81938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!104038 () SeekEntryResult!300)

(declare-fun e!104039 () SeekEntryResult!300)

(assert (=> b!158882 (= e!104038 e!104039)))

(declare-fun b!158883 () Bool)

(declare-fun lt!81939 () SeekEntryResult!300)

(assert (=> b!158883 (= e!104039 (MissingZero!300 (index!3370 lt!81939)))))

(declare-fun b!158884 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5667 (_ BitVec 32)) SeekEntryResult!300)

(assert (=> b!158884 (= e!104039 (seekKeyOrZeroReturnVacant!0 (x!17532 lt!81939) (index!3370 lt!81939) (index!3370 lt!81939) key!828 (_keys!4996 thiss!1248) (mask!7732 thiss!1248)))))

(declare-fun b!158885 () Bool)

(assert (=> b!158885 (= e!104038 (Found!300 (index!3370 lt!81939)))))

(declare-fun d!51235 () Bool)

(declare-fun lt!81940 () SeekEntryResult!300)

(assert (=> d!51235 (and (or ((_ is Undefined!300) lt!81940) (not ((_ is Found!300) lt!81940)) (and (bvsge (index!3369 lt!81940) #b00000000000000000000000000000000) (bvslt (index!3369 lt!81940) (size!2965 (_keys!4996 thiss!1248))))) (or ((_ is Undefined!300) lt!81940) ((_ is Found!300) lt!81940) (not ((_ is MissingZero!300) lt!81940)) (and (bvsge (index!3368 lt!81940) #b00000000000000000000000000000000) (bvslt (index!3368 lt!81940) (size!2965 (_keys!4996 thiss!1248))))) (or ((_ is Undefined!300) lt!81940) ((_ is Found!300) lt!81940) ((_ is MissingZero!300) lt!81940) (not ((_ is MissingVacant!300) lt!81940)) (and (bvsge (index!3371 lt!81940) #b00000000000000000000000000000000) (bvslt (index!3371 lt!81940) (size!2965 (_keys!4996 thiss!1248))))) (or ((_ is Undefined!300) lt!81940) (ite ((_ is Found!300) lt!81940) (= (select (arr!2681 (_keys!4996 thiss!1248)) (index!3369 lt!81940)) key!828) (ite ((_ is MissingZero!300) lt!81940) (= (select (arr!2681 (_keys!4996 thiss!1248)) (index!3368 lt!81940)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!300) lt!81940) (= (select (arr!2681 (_keys!4996 thiss!1248)) (index!3371 lt!81940)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!104040 () SeekEntryResult!300)

(assert (=> d!51235 (= lt!81940 e!104040)))

(declare-fun c!29902 () Bool)

(assert (=> d!51235 (= c!29902 (and ((_ is Intermediate!300) lt!81939) (undefined!1112 lt!81939)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5667 (_ BitVec 32)) SeekEntryResult!300)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51235 (= lt!81939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7732 thiss!1248)) key!828 (_keys!4996 thiss!1248) (mask!7732 thiss!1248)))))

(assert (=> d!51235 (validMask!0 (mask!7732 thiss!1248))))

(assert (=> d!51235 (= (seekEntryOrOpen!0 key!828 (_keys!4996 thiss!1248) (mask!7732 thiss!1248)) lt!81940)))

(declare-fun b!158886 () Bool)

(assert (=> b!158886 (= e!104040 Undefined!300)))

(declare-fun b!158887 () Bool)

(assert (=> b!158887 (= e!104040 e!104038)))

(assert (=> b!158887 (= lt!81938 (select (arr!2681 (_keys!4996 thiss!1248)) (index!3370 lt!81939)))))

(declare-fun c!29901 () Bool)

(assert (=> b!158887 (= c!29901 (= lt!81938 key!828))))

(assert (= (and d!51235 c!29902) b!158886))

(assert (= (and d!51235 (not c!29902)) b!158887))

(assert (= (and b!158887 c!29901) b!158885))

(assert (= (and b!158887 (not c!29901)) b!158882))

(assert (= (and b!158882 c!29900) b!158883))

(assert (= (and b!158882 (not c!29900)) b!158884))

(declare-fun m!191393 () Bool)

(assert (=> b!158884 m!191393))

(declare-fun m!191395 () Bool)

(assert (=> d!51235 m!191395))

(declare-fun m!191397 () Bool)

(assert (=> d!51235 m!191397))

(declare-fun m!191399 () Bool)

(assert (=> d!51235 m!191399))

(declare-fun m!191401 () Bool)

(assert (=> d!51235 m!191401))

(assert (=> d!51235 m!191359))

(assert (=> d!51235 m!191397))

(declare-fun m!191403 () Bool)

(assert (=> d!51235 m!191403))

(declare-fun m!191405 () Bool)

(assert (=> b!158887 m!191405))

(assert (=> b!158813 d!51235))

(declare-fun condMapEmpty!5630 () Bool)

(declare-fun mapDefault!5630 () ValueCell!1305)

(assert (=> mapNonEmpty!5624 (= condMapEmpty!5630 (= mapRest!5624 ((as const (Array (_ BitVec 32) ValueCell!1305)) mapDefault!5630)))))

(declare-fun e!104045 () Bool)

(declare-fun mapRes!5630 () Bool)

(assert (=> mapNonEmpty!5624 (= tp!13045 (and e!104045 mapRes!5630))))

(declare-fun mapNonEmpty!5630 () Bool)

(declare-fun tp!13055 () Bool)

(declare-fun e!104046 () Bool)

(assert (=> mapNonEmpty!5630 (= mapRes!5630 (and tp!13055 e!104046))))

(declare-fun mapKey!5630 () (_ BitVec 32))

(declare-fun mapRest!5630 () (Array (_ BitVec 32) ValueCell!1305))

(declare-fun mapValue!5630 () ValueCell!1305)

(assert (=> mapNonEmpty!5630 (= mapRest!5624 (store mapRest!5630 mapKey!5630 mapValue!5630))))

(declare-fun b!158894 () Bool)

(assert (=> b!158894 (= e!104046 tp_is_empty!3297)))

(declare-fun b!158895 () Bool)

(assert (=> b!158895 (= e!104045 tp_is_empty!3297)))

(declare-fun mapIsEmpty!5630 () Bool)

(assert (=> mapIsEmpty!5630 mapRes!5630))

(assert (= (and mapNonEmpty!5624 condMapEmpty!5630) mapIsEmpty!5630))

(assert (= (and mapNonEmpty!5624 (not condMapEmpty!5630)) mapNonEmpty!5630))

(assert (= (and mapNonEmpty!5630 ((_ is ValueCellFull!1305) mapValue!5630)) b!158894))

(assert (= (and mapNonEmpty!5624 ((_ is ValueCellFull!1305) mapDefault!5630)) b!158895))

(declare-fun m!191407 () Bool)

(assert (=> mapNonEmpty!5630 m!191407))

(check-sat (not b!158884) (not bm!17269) tp_is_empty!3297 b_and!9909 (not b_next!3495) (not b!158866) (not b!158857) (not d!51231) (not b!158855) (not b!158867) (not mapNonEmpty!5630) (not d!51235) (not b!158856))
(check-sat b_and!9909 (not b_next!3495))
