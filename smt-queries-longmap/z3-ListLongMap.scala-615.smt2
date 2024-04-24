; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16014 () Bool)

(assert start!16014)

(declare-fun b!158972 () Bool)

(declare-fun b_free!3499 () Bool)

(declare-fun b_next!3499 () Bool)

(assert (=> b!158972 (= b_free!3499 (not b_next!3499))))

(declare-fun tp!13061 () Bool)

(declare-fun b_and!9927 () Bool)

(assert (=> b!158972 (= tp!13061 b_and!9927)))

(declare-fun b!158963 () Bool)

(declare-fun e!104088 () Bool)

(declare-fun e!104084 () Bool)

(declare-fun mapRes!5633 () Bool)

(assert (=> b!158963 (= e!104088 (and e!104084 mapRes!5633))))

(declare-fun condMapEmpty!5633 () Bool)

(declare-datatypes ((V!4049 0))(
  ( (V!4050 (val!1695 Int)) )
))
(declare-datatypes ((ValueCell!1307 0))(
  ( (ValueCellFull!1307 (v!3561 V!4049)) (EmptyCell!1307) )
))
(declare-datatypes ((array!5663 0))(
  ( (array!5664 (arr!2678 (Array (_ BitVec 32) (_ BitVec 64))) (size!2962 (_ BitVec 32))) )
))
(declare-datatypes ((array!5665 0))(
  ( (array!5666 (arr!2679 (Array (_ BitVec 32) ValueCell!1307)) (size!2963 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1522 0))(
  ( (LongMapFixedSize!1523 (defaultEntry!3203 Int) (mask!7739 (_ BitVec 32)) (extraKeys!2944 (_ BitVec 32)) (zeroValue!3046 V!4049) (minValue!3046 V!4049) (_size!810 (_ BitVec 32)) (_keys!5000 array!5663) (_values!3186 array!5665) (_vacant!810 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1522)

(declare-fun mapDefault!5633 () ValueCell!1307)

(assert (=> b!158963 (= condMapEmpty!5633 (= (arr!2679 (_values!3186 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1307)) mapDefault!5633)))))

(declare-fun mapNonEmpty!5633 () Bool)

(declare-fun tp!13060 () Bool)

(declare-fun e!104086 () Bool)

(assert (=> mapNonEmpty!5633 (= mapRes!5633 (and tp!13060 e!104086))))

(declare-fun mapValue!5633 () ValueCell!1307)

(declare-fun mapRest!5633 () (Array (_ BitVec 32) ValueCell!1307))

(declare-fun mapKey!5633 () (_ BitVec 32))

(assert (=> mapNonEmpty!5633 (= (arr!2679 (_values!3186 thiss!1248)) (store mapRest!5633 mapKey!5633 mapValue!5633))))

(declare-fun b!158964 () Bool)

(declare-fun e!104087 () Bool)

(declare-datatypes ((List!1877 0))(
  ( (Nil!1874) (Cons!1873 (h!2486 (_ BitVec 64)) (t!6671 List!1877)) )
))
(declare-fun arrayNoDuplicates!0 (array!5663 (_ BitVec 32) List!1877) Bool)

(assert (=> b!158964 (= e!104087 (not (arrayNoDuplicates!0 (_keys!5000 thiss!1248) #b00000000000000000000000000000000 Nil!1874)))))

(declare-fun b!158965 () Bool)

(declare-fun res!75055 () Bool)

(assert (=> b!158965 (=> (not res!75055) (not e!104087))))

(assert (=> b!158965 (= res!75055 (and (= (size!2963 (_values!3186 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7739 thiss!1248))) (= (size!2962 (_keys!5000 thiss!1248)) (size!2963 (_values!3186 thiss!1248))) (bvsge (mask!7739 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2944 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2944 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158966 () Bool)

(declare-fun res!75052 () Bool)

(assert (=> b!158966 (=> (not res!75052) (not e!104087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5663 (_ BitVec 32)) Bool)

(assert (=> b!158966 (= res!75052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(declare-fun mapIsEmpty!5633 () Bool)

(assert (=> mapIsEmpty!5633 mapRes!5633))

(declare-fun b!158967 () Bool)

(declare-fun res!75054 () Bool)

(assert (=> b!158967 (=> (not res!75054) (not e!104087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158967 (= res!75054 (validMask!0 (mask!7739 thiss!1248)))))

(declare-fun b!158968 () Bool)

(declare-fun tp_is_empty!3301 () Bool)

(assert (=> b!158968 (= e!104084 tp_is_empty!3301)))

(declare-fun res!75056 () Bool)

(assert (=> start!16014 (=> (not res!75056) (not e!104087))))

(declare-fun valid!734 (LongMapFixedSize!1522) Bool)

(assert (=> start!16014 (= res!75056 (valid!734 thiss!1248))))

(assert (=> start!16014 e!104087))

(declare-fun e!104083 () Bool)

(assert (=> start!16014 e!104083))

(assert (=> start!16014 true))

(declare-fun b!158969 () Bool)

(declare-fun res!75051 () Bool)

(assert (=> b!158969 (=> (not res!75051) (not e!104087))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158969 (= res!75051 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158970 () Bool)

(assert (=> b!158970 (= e!104086 tp_is_empty!3301)))

(declare-fun b!158971 () Bool)

(declare-fun res!75053 () Bool)

(assert (=> b!158971 (=> (not res!75053) (not e!104087))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!298 0))(
  ( (MissingZero!298 (index!3360 (_ BitVec 32))) (Found!298 (index!3361 (_ BitVec 32))) (Intermediate!298 (undefined!1110 Bool) (index!3362 (_ BitVec 32)) (x!17546 (_ BitVec 32))) (Undefined!298) (MissingVacant!298 (index!3363 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5663 (_ BitVec 32)) SeekEntryResult!298)

(assert (=> b!158971 (= res!75053 ((_ is Undefined!298) (seekEntryOrOpen!0 key!828 (_keys!5000 thiss!1248) (mask!7739 thiss!1248))))))

(declare-fun array_inv!1705 (array!5663) Bool)

(declare-fun array_inv!1706 (array!5665) Bool)

(assert (=> b!158972 (= e!104083 (and tp!13061 tp_is_empty!3301 (array_inv!1705 (_keys!5000 thiss!1248)) (array_inv!1706 (_values!3186 thiss!1248)) e!104088))))

(assert (= (and start!16014 res!75056) b!158969))

(assert (= (and b!158969 res!75051) b!158971))

(assert (= (and b!158971 res!75053) b!158967))

(assert (= (and b!158967 res!75054) b!158965))

(assert (= (and b!158965 res!75055) b!158966))

(assert (= (and b!158966 res!75052) b!158964))

(assert (= (and b!158963 condMapEmpty!5633) mapIsEmpty!5633))

(assert (= (and b!158963 (not condMapEmpty!5633)) mapNonEmpty!5633))

(assert (= (and mapNonEmpty!5633 ((_ is ValueCellFull!1307) mapValue!5633)) b!158970))

(assert (= (and b!158963 ((_ is ValueCellFull!1307) mapDefault!5633)) b!158968))

(assert (= b!158972 b!158963))

(assert (= start!16014 b!158972))

(declare-fun m!191591 () Bool)

(assert (=> b!158964 m!191591))

(declare-fun m!191593 () Bool)

(assert (=> mapNonEmpty!5633 m!191593))

(declare-fun m!191595 () Bool)

(assert (=> start!16014 m!191595))

(declare-fun m!191597 () Bool)

(assert (=> b!158966 m!191597))

(declare-fun m!191599 () Bool)

(assert (=> b!158972 m!191599))

(declare-fun m!191601 () Bool)

(assert (=> b!158972 m!191601))

(declare-fun m!191603 () Bool)

(assert (=> b!158967 m!191603))

(declare-fun m!191605 () Bool)

(assert (=> b!158971 m!191605))

(check-sat (not mapNonEmpty!5633) (not b_next!3499) tp_is_empty!3301 (not b!158964) (not b!158971) (not b!158972) b_and!9927 (not b!158967) (not start!16014) (not b!158966))
(check-sat b_and!9927 (not b_next!3499))
(get-model)

(declare-fun bm!17260 () Bool)

(declare-fun call!17263 () Bool)

(declare-fun c!29918 () Bool)

(assert (=> bm!17260 (= call!17263 (arrayNoDuplicates!0 (_keys!5000 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29918 (Cons!1873 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000) Nil!1874) Nil!1874)))))

(declare-fun b!159043 () Bool)

(declare-fun e!104135 () Bool)

(assert (=> b!159043 (= e!104135 call!17263)))

(declare-fun b!159044 () Bool)

(declare-fun e!104134 () Bool)

(assert (=> b!159044 (= e!104134 e!104135)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!159044 (= c!29918 (validKeyInArray!0 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159045 () Bool)

(declare-fun e!104136 () Bool)

(declare-fun contains!966 (List!1877 (_ BitVec 64)) Bool)

(assert (=> b!159045 (= e!104136 (contains!966 Nil!1874 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!159046 () Bool)

(assert (=> b!159046 (= e!104135 call!17263)))

(declare-fun d!51313 () Bool)

(declare-fun res!75100 () Bool)

(declare-fun e!104133 () Bool)

(assert (=> d!51313 (=> res!75100 e!104133)))

(assert (=> d!51313 (= res!75100 (bvsge #b00000000000000000000000000000000 (size!2962 (_keys!5000 thiss!1248))))))

(assert (=> d!51313 (= (arrayNoDuplicates!0 (_keys!5000 thiss!1248) #b00000000000000000000000000000000 Nil!1874) e!104133)))

(declare-fun b!159047 () Bool)

(assert (=> b!159047 (= e!104133 e!104134)))

(declare-fun res!75099 () Bool)

(assert (=> b!159047 (=> (not res!75099) (not e!104134))))

(assert (=> b!159047 (= res!75099 (not e!104136))))

(declare-fun res!75101 () Bool)

(assert (=> b!159047 (=> (not res!75101) (not e!104136))))

(assert (=> b!159047 (= res!75101 (validKeyInArray!0 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51313 (not res!75100)) b!159047))

(assert (= (and b!159047 res!75101) b!159045))

(assert (= (and b!159047 res!75099) b!159044))

(assert (= (and b!159044 c!29918) b!159043))

(assert (= (and b!159044 (not c!29918)) b!159046))

(assert (= (or b!159043 b!159046) bm!17260))

(declare-fun m!191639 () Bool)

(assert (=> bm!17260 m!191639))

(declare-fun m!191641 () Bool)

(assert (=> bm!17260 m!191641))

(assert (=> b!159044 m!191639))

(assert (=> b!159044 m!191639))

(declare-fun m!191643 () Bool)

(assert (=> b!159044 m!191643))

(assert (=> b!159045 m!191639))

(assert (=> b!159045 m!191639))

(declare-fun m!191645 () Bool)

(assert (=> b!159045 m!191645))

(assert (=> b!159047 m!191639))

(assert (=> b!159047 m!191639))

(assert (=> b!159047 m!191643))

(assert (=> b!158964 d!51313))

(declare-fun b!159056 () Bool)

(declare-fun e!104144 () Bool)

(declare-fun e!104145 () Bool)

(assert (=> b!159056 (= e!104144 e!104145)))

(declare-fun lt!82007 () (_ BitVec 64))

(assert (=> b!159056 (= lt!82007 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4997 0))(
  ( (Unit!4998) )
))
(declare-fun lt!82008 () Unit!4997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5663 (_ BitVec 64) (_ BitVec 32)) Unit!4997)

(assert (=> b!159056 (= lt!82008 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5000 thiss!1248) lt!82007 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!159056 (arrayContainsKey!0 (_keys!5000 thiss!1248) lt!82007 #b00000000000000000000000000000000)))

(declare-fun lt!82006 () Unit!4997)

(assert (=> b!159056 (= lt!82006 lt!82008)))

(declare-fun res!75107 () Bool)

(assert (=> b!159056 (= res!75107 (= (seekEntryOrOpen!0 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000) (_keys!5000 thiss!1248) (mask!7739 thiss!1248)) (Found!298 #b00000000000000000000000000000000)))))

(assert (=> b!159056 (=> (not res!75107) (not e!104145))))

(declare-fun d!51315 () Bool)

(declare-fun res!75106 () Bool)

(declare-fun e!104143 () Bool)

(assert (=> d!51315 (=> res!75106 e!104143)))

(assert (=> d!51315 (= res!75106 (bvsge #b00000000000000000000000000000000 (size!2962 (_keys!5000 thiss!1248))))))

(assert (=> d!51315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)) e!104143)))

(declare-fun bm!17263 () Bool)

(declare-fun call!17266 () Bool)

(assert (=> bm!17263 (= call!17266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(declare-fun b!159057 () Bool)

(assert (=> b!159057 (= e!104145 call!17266)))

(declare-fun b!159058 () Bool)

(assert (=> b!159058 (= e!104144 call!17266)))

(declare-fun b!159059 () Bool)

(assert (=> b!159059 (= e!104143 e!104144)))

(declare-fun c!29921 () Bool)

(assert (=> b!159059 (= c!29921 (validKeyInArray!0 (select (arr!2678 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51315 (not res!75106)) b!159059))

(assert (= (and b!159059 c!29921) b!159056))

(assert (= (and b!159059 (not c!29921)) b!159058))

(assert (= (and b!159056 res!75107) b!159057))

(assert (= (or b!159057 b!159058) bm!17263))

(assert (=> b!159056 m!191639))

(declare-fun m!191647 () Bool)

(assert (=> b!159056 m!191647))

(declare-fun m!191649 () Bool)

(assert (=> b!159056 m!191649))

(assert (=> b!159056 m!191639))

(declare-fun m!191651 () Bool)

(assert (=> b!159056 m!191651))

(declare-fun m!191653 () Bool)

(assert (=> bm!17263 m!191653))

(assert (=> b!159059 m!191639))

(assert (=> b!159059 m!191639))

(assert (=> b!159059 m!191643))

(assert (=> b!158966 d!51315))

(declare-fun d!51317 () Bool)

(declare-fun res!75114 () Bool)

(declare-fun e!104148 () Bool)

(assert (=> d!51317 (=> (not res!75114) (not e!104148))))

(declare-fun simpleValid!116 (LongMapFixedSize!1522) Bool)

(assert (=> d!51317 (= res!75114 (simpleValid!116 thiss!1248))))

(assert (=> d!51317 (= (valid!734 thiss!1248) e!104148)))

(declare-fun b!159066 () Bool)

(declare-fun res!75115 () Bool)

(assert (=> b!159066 (=> (not res!75115) (not e!104148))))

(declare-fun arrayCountValidKeys!0 (array!5663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!159066 (= res!75115 (= (arrayCountValidKeys!0 (_keys!5000 thiss!1248) #b00000000000000000000000000000000 (size!2962 (_keys!5000 thiss!1248))) (_size!810 thiss!1248)))))

(declare-fun b!159067 () Bool)

(declare-fun res!75116 () Bool)

(assert (=> b!159067 (=> (not res!75116) (not e!104148))))

(assert (=> b!159067 (= res!75116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(declare-fun b!159068 () Bool)

(assert (=> b!159068 (= e!104148 (arrayNoDuplicates!0 (_keys!5000 thiss!1248) #b00000000000000000000000000000000 Nil!1874))))

(assert (= (and d!51317 res!75114) b!159066))

(assert (= (and b!159066 res!75115) b!159067))

(assert (= (and b!159067 res!75116) b!159068))

(declare-fun m!191655 () Bool)

(assert (=> d!51317 m!191655))

(declare-fun m!191657 () Bool)

(assert (=> b!159066 m!191657))

(assert (=> b!159067 m!191597))

(assert (=> b!159068 m!191591))

(assert (=> start!16014 d!51317))

(declare-fun d!51319 () Bool)

(declare-fun lt!82017 () SeekEntryResult!298)

(assert (=> d!51319 (and (or ((_ is Undefined!298) lt!82017) (not ((_ is Found!298) lt!82017)) (and (bvsge (index!3361 lt!82017) #b00000000000000000000000000000000) (bvslt (index!3361 lt!82017) (size!2962 (_keys!5000 thiss!1248))))) (or ((_ is Undefined!298) lt!82017) ((_ is Found!298) lt!82017) (not ((_ is MissingZero!298) lt!82017)) (and (bvsge (index!3360 lt!82017) #b00000000000000000000000000000000) (bvslt (index!3360 lt!82017) (size!2962 (_keys!5000 thiss!1248))))) (or ((_ is Undefined!298) lt!82017) ((_ is Found!298) lt!82017) ((_ is MissingZero!298) lt!82017) (not ((_ is MissingVacant!298) lt!82017)) (and (bvsge (index!3363 lt!82017) #b00000000000000000000000000000000) (bvslt (index!3363 lt!82017) (size!2962 (_keys!5000 thiss!1248))))) (or ((_ is Undefined!298) lt!82017) (ite ((_ is Found!298) lt!82017) (= (select (arr!2678 (_keys!5000 thiss!1248)) (index!3361 lt!82017)) key!828) (ite ((_ is MissingZero!298) lt!82017) (= (select (arr!2678 (_keys!5000 thiss!1248)) (index!3360 lt!82017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!298) lt!82017) (= (select (arr!2678 (_keys!5000 thiss!1248)) (index!3363 lt!82017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!104157 () SeekEntryResult!298)

(assert (=> d!51319 (= lt!82017 e!104157)))

(declare-fun c!29930 () Bool)

(declare-fun lt!82016 () SeekEntryResult!298)

(assert (=> d!51319 (= c!29930 (and ((_ is Intermediate!298) lt!82016) (undefined!1110 lt!82016)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5663 (_ BitVec 32)) SeekEntryResult!298)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51319 (= lt!82016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7739 thiss!1248)) key!828 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(assert (=> d!51319 (validMask!0 (mask!7739 thiss!1248))))

(assert (=> d!51319 (= (seekEntryOrOpen!0 key!828 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)) lt!82017)))

(declare-fun b!159081 () Bool)

(declare-fun c!29929 () Bool)

(declare-fun lt!82015 () (_ BitVec 64))

(assert (=> b!159081 (= c!29929 (= lt!82015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!104155 () SeekEntryResult!298)

(declare-fun e!104156 () SeekEntryResult!298)

(assert (=> b!159081 (= e!104155 e!104156)))

(declare-fun b!159082 () Bool)

(assert (=> b!159082 (= e!104156 (MissingZero!298 (index!3362 lt!82016)))))

(declare-fun b!159083 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5663 (_ BitVec 32)) SeekEntryResult!298)

(assert (=> b!159083 (= e!104156 (seekKeyOrZeroReturnVacant!0 (x!17546 lt!82016) (index!3362 lt!82016) (index!3362 lt!82016) key!828 (_keys!5000 thiss!1248) (mask!7739 thiss!1248)))))

(declare-fun b!159084 () Bool)

(assert (=> b!159084 (= e!104155 (Found!298 (index!3362 lt!82016)))))

(declare-fun b!159085 () Bool)

(assert (=> b!159085 (= e!104157 Undefined!298)))

(declare-fun b!159086 () Bool)

(assert (=> b!159086 (= e!104157 e!104155)))

(assert (=> b!159086 (= lt!82015 (select (arr!2678 (_keys!5000 thiss!1248)) (index!3362 lt!82016)))))

(declare-fun c!29928 () Bool)

(assert (=> b!159086 (= c!29928 (= lt!82015 key!828))))

(assert (= (and d!51319 c!29930) b!159085))

(assert (= (and d!51319 (not c!29930)) b!159086))

(assert (= (and b!159086 c!29928) b!159084))

(assert (= (and b!159086 (not c!29928)) b!159081))

(assert (= (and b!159081 c!29929) b!159082))

(assert (= (and b!159081 (not c!29929)) b!159083))

(declare-fun m!191659 () Bool)

(assert (=> d!51319 m!191659))

(declare-fun m!191661 () Bool)

(assert (=> d!51319 m!191661))

(assert (=> d!51319 m!191603))

(declare-fun m!191663 () Bool)

(assert (=> d!51319 m!191663))

(declare-fun m!191665 () Bool)

(assert (=> d!51319 m!191665))

(assert (=> d!51319 m!191665))

(declare-fun m!191667 () Bool)

(assert (=> d!51319 m!191667))

(declare-fun m!191669 () Bool)

(assert (=> b!159083 m!191669))

(declare-fun m!191671 () Bool)

(assert (=> b!159086 m!191671))

(assert (=> b!158971 d!51319))

(declare-fun d!51321 () Bool)

(assert (=> d!51321 (= (validMask!0 (mask!7739 thiss!1248)) (and (or (= (mask!7739 thiss!1248) #b00000000000000000000000000000111) (= (mask!7739 thiss!1248) #b00000000000000000000000000001111) (= (mask!7739 thiss!1248) #b00000000000000000000000000011111) (= (mask!7739 thiss!1248) #b00000000000000000000000000111111) (= (mask!7739 thiss!1248) #b00000000000000000000000001111111) (= (mask!7739 thiss!1248) #b00000000000000000000000011111111) (= (mask!7739 thiss!1248) #b00000000000000000000000111111111) (= (mask!7739 thiss!1248) #b00000000000000000000001111111111) (= (mask!7739 thiss!1248) #b00000000000000000000011111111111) (= (mask!7739 thiss!1248) #b00000000000000000000111111111111) (= (mask!7739 thiss!1248) #b00000000000000000001111111111111) (= (mask!7739 thiss!1248) #b00000000000000000011111111111111) (= (mask!7739 thiss!1248) #b00000000000000000111111111111111) (= (mask!7739 thiss!1248) #b00000000000000001111111111111111) (= (mask!7739 thiss!1248) #b00000000000000011111111111111111) (= (mask!7739 thiss!1248) #b00000000000000111111111111111111) (= (mask!7739 thiss!1248) #b00000000000001111111111111111111) (= (mask!7739 thiss!1248) #b00000000000011111111111111111111) (= (mask!7739 thiss!1248) #b00000000000111111111111111111111) (= (mask!7739 thiss!1248) #b00000000001111111111111111111111) (= (mask!7739 thiss!1248) #b00000000011111111111111111111111) (= (mask!7739 thiss!1248) #b00000000111111111111111111111111) (= (mask!7739 thiss!1248) #b00000001111111111111111111111111) (= (mask!7739 thiss!1248) #b00000011111111111111111111111111) (= (mask!7739 thiss!1248) #b00000111111111111111111111111111) (= (mask!7739 thiss!1248) #b00001111111111111111111111111111) (= (mask!7739 thiss!1248) #b00011111111111111111111111111111) (= (mask!7739 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7739 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158967 d!51321))

(declare-fun d!51323 () Bool)

(assert (=> d!51323 (= (array_inv!1705 (_keys!5000 thiss!1248)) (bvsge (size!2962 (_keys!5000 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158972 d!51323))

(declare-fun d!51325 () Bool)

(assert (=> d!51325 (= (array_inv!1706 (_values!3186 thiss!1248)) (bvsge (size!2963 (_values!3186 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158972 d!51325))

(declare-fun b!159093 () Bool)

(declare-fun e!104162 () Bool)

(assert (=> b!159093 (= e!104162 tp_is_empty!3301)))

(declare-fun condMapEmpty!5642 () Bool)

(declare-fun mapDefault!5642 () ValueCell!1307)

(assert (=> mapNonEmpty!5633 (= condMapEmpty!5642 (= mapRest!5633 ((as const (Array (_ BitVec 32) ValueCell!1307)) mapDefault!5642)))))

(declare-fun e!104163 () Bool)

(declare-fun mapRes!5642 () Bool)

(assert (=> mapNonEmpty!5633 (= tp!13060 (and e!104163 mapRes!5642))))

(declare-fun mapNonEmpty!5642 () Bool)

(declare-fun tp!13076 () Bool)

(assert (=> mapNonEmpty!5642 (= mapRes!5642 (and tp!13076 e!104162))))

(declare-fun mapValue!5642 () ValueCell!1307)

(declare-fun mapRest!5642 () (Array (_ BitVec 32) ValueCell!1307))

(declare-fun mapKey!5642 () (_ BitVec 32))

(assert (=> mapNonEmpty!5642 (= mapRest!5633 (store mapRest!5642 mapKey!5642 mapValue!5642))))

(declare-fun b!159094 () Bool)

(assert (=> b!159094 (= e!104163 tp_is_empty!3301)))

(declare-fun mapIsEmpty!5642 () Bool)

(assert (=> mapIsEmpty!5642 mapRes!5642))

(assert (= (and mapNonEmpty!5633 condMapEmpty!5642) mapIsEmpty!5642))

(assert (= (and mapNonEmpty!5633 (not condMapEmpty!5642)) mapNonEmpty!5642))

(assert (= (and mapNonEmpty!5642 ((_ is ValueCellFull!1307) mapValue!5642)) b!159093))

(assert (= (and mapNonEmpty!5633 ((_ is ValueCellFull!1307) mapDefault!5642)) b!159094))

(declare-fun m!191673 () Bool)

(assert (=> mapNonEmpty!5642 m!191673))

(check-sat (not b!159044) (not b!159068) tp_is_empty!3301 (not b!159067) (not mapNonEmpty!5642) (not bm!17260) b_and!9927 (not b!159066) (not bm!17263) (not b!159045) (not d!51317) (not b_next!3499) (not b!159083) (not d!51319) (not b!159056) (not b!159059) (not b!159047))
(check-sat b_and!9927 (not b_next!3499))
