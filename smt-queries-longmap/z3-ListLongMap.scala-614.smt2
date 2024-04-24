; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15996 () Bool)

(assert start!15996)

(declare-fun b!158835 () Bool)

(declare-fun b_free!3493 () Bool)

(declare-fun b_next!3493 () Bool)

(assert (=> b!158835 (= b_free!3493 (not b_next!3493))))

(declare-fun tp!13040 () Bool)

(declare-fun b_and!9921 () Bool)

(assert (=> b!158835 (= tp!13040 b_and!9921)))

(declare-fun b!158833 () Bool)

(declare-fun e!104002 () Bool)

(declare-fun e!104004 () Bool)

(declare-fun mapRes!5621 () Bool)

(assert (=> b!158833 (= e!104002 (and e!104004 mapRes!5621))))

(declare-fun condMapEmpty!5621 () Bool)

(declare-datatypes ((V!4041 0))(
  ( (V!4042 (val!1692 Int)) )
))
(declare-datatypes ((ValueCell!1304 0))(
  ( (ValueCellFull!1304 (v!3558 V!4041)) (EmptyCell!1304) )
))
(declare-datatypes ((array!5649 0))(
  ( (array!5650 (arr!2672 (Array (_ BitVec 32) (_ BitVec 64))) (size!2956 (_ BitVec 32))) )
))
(declare-datatypes ((array!5651 0))(
  ( (array!5652 (arr!2673 (Array (_ BitVec 32) ValueCell!1304)) (size!2957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1516 0))(
  ( (LongMapFixedSize!1517 (defaultEntry!3200 Int) (mask!7731 (_ BitVec 32)) (extraKeys!2941 (_ BitVec 32)) (zeroValue!3043 V!4041) (minValue!3043 V!4041) (_size!807 (_ BitVec 32)) (_keys!4995 array!5649) (_values!3183 array!5651) (_vacant!807 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1516)

(declare-fun mapDefault!5621 () ValueCell!1304)

(assert (=> b!158833 (= condMapEmpty!5621 (= (arr!2673 (_values!3183 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1304)) mapDefault!5621)))))

(declare-fun b!158834 () Bool)

(declare-fun res!74990 () Bool)

(declare-fun e!104006 () Bool)

(assert (=> b!158834 (=> (not res!74990) (not e!104006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158834 (= res!74990 (validMask!0 (mask!7731 thiss!1248)))))

(declare-fun e!104005 () Bool)

(declare-fun tp_is_empty!3295 () Bool)

(declare-fun array_inv!1703 (array!5649) Bool)

(declare-fun array_inv!1704 (array!5651) Bool)

(assert (=> b!158835 (= e!104005 (and tp!13040 tp_is_empty!3295 (array_inv!1703 (_keys!4995 thiss!1248)) (array_inv!1704 (_values!3183 thiss!1248)) e!104002))))

(declare-fun b!158836 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5649 (_ BitVec 32)) Bool)

(assert (=> b!158836 (= e!104006 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4995 thiss!1248) (mask!7731 thiss!1248))))))

(declare-fun mapIsEmpty!5621 () Bool)

(assert (=> mapIsEmpty!5621 mapRes!5621))

(declare-fun b!158837 () Bool)

(declare-fun res!74992 () Bool)

(assert (=> b!158837 (=> (not res!74992) (not e!104006))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158837 (= res!74992 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74993 () Bool)

(assert (=> start!15996 (=> (not res!74993) (not e!104006))))

(declare-fun valid!733 (LongMapFixedSize!1516) Bool)

(assert (=> start!15996 (= res!74993 (valid!733 thiss!1248))))

(assert (=> start!15996 e!104006))

(assert (=> start!15996 e!104005))

(assert (=> start!15996 true))

(declare-fun mapNonEmpty!5621 () Bool)

(declare-fun tp!13039 () Bool)

(declare-fun e!104007 () Bool)

(assert (=> mapNonEmpty!5621 (= mapRes!5621 (and tp!13039 e!104007))))

(declare-fun mapKey!5621 () (_ BitVec 32))

(declare-fun mapValue!5621 () ValueCell!1304)

(declare-fun mapRest!5621 () (Array (_ BitVec 32) ValueCell!1304))

(assert (=> mapNonEmpty!5621 (= (arr!2673 (_values!3183 thiss!1248)) (store mapRest!5621 mapKey!5621 mapValue!5621))))

(declare-fun b!158838 () Bool)

(assert (=> b!158838 (= e!104007 tp_is_empty!3295)))

(declare-fun b!158839 () Bool)

(declare-fun res!74989 () Bool)

(assert (=> b!158839 (=> (not res!74989) (not e!104006))))

(assert (=> b!158839 (= res!74989 (and (= (size!2957 (_values!3183 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7731 thiss!1248))) (= (size!2956 (_keys!4995 thiss!1248)) (size!2957 (_values!3183 thiss!1248))) (bvsge (mask!7731 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2941 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2941 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158840 () Bool)

(declare-fun res!74991 () Bool)

(assert (=> b!158840 (=> (not res!74991) (not e!104006))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!297 0))(
  ( (MissingZero!297 (index!3356 (_ BitVec 32))) (Found!297 (index!3357 (_ BitVec 32))) (Intermediate!297 (undefined!1109 Bool) (index!3358 (_ BitVec 32)) (x!17529 (_ BitVec 32))) (Undefined!297) (MissingVacant!297 (index!3359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5649 (_ BitVec 32)) SeekEntryResult!297)

(assert (=> b!158840 (= res!74991 ((_ is Undefined!297) (seekEntryOrOpen!0 key!828 (_keys!4995 thiss!1248) (mask!7731 thiss!1248))))))

(declare-fun b!158841 () Bool)

(assert (=> b!158841 (= e!104004 tp_is_empty!3295)))

(assert (= (and start!15996 res!74993) b!158837))

(assert (= (and b!158837 res!74992) b!158840))

(assert (= (and b!158840 res!74991) b!158834))

(assert (= (and b!158834 res!74990) b!158839))

(assert (= (and b!158839 res!74989) b!158836))

(assert (= (and b!158833 condMapEmpty!5621) mapIsEmpty!5621))

(assert (= (and b!158833 (not condMapEmpty!5621)) mapNonEmpty!5621))

(assert (= (and mapNonEmpty!5621 ((_ is ValueCellFull!1304) mapValue!5621)) b!158838))

(assert (= (and b!158833 ((_ is ValueCellFull!1304) mapDefault!5621)) b!158841))

(assert (= b!158835 b!158833))

(assert (= start!15996 b!158835))

(declare-fun m!191515 () Bool)

(assert (=> b!158836 m!191515))

(declare-fun m!191517 () Bool)

(assert (=> mapNonEmpty!5621 m!191517))

(declare-fun m!191519 () Bool)

(assert (=> start!15996 m!191519))

(declare-fun m!191521 () Bool)

(assert (=> b!158834 m!191521))

(declare-fun m!191523 () Bool)

(assert (=> b!158835 m!191523))

(declare-fun m!191525 () Bool)

(assert (=> b!158835 m!191525))

(declare-fun m!191527 () Bool)

(assert (=> b!158840 m!191527))

(check-sat b_and!9921 (not b_next!3493) (not b!158834) (not b!158836) (not mapNonEmpty!5621) tp_is_empty!3295 (not start!15996) (not b!158840) (not b!158835))
(check-sat b_and!9921 (not b_next!3493))
(get-model)

(declare-fun d!51299 () Bool)

(assert (=> d!51299 (= (validMask!0 (mask!7731 thiss!1248)) (and (or (= (mask!7731 thiss!1248) #b00000000000000000000000000000111) (= (mask!7731 thiss!1248) #b00000000000000000000000000001111) (= (mask!7731 thiss!1248) #b00000000000000000000000000011111) (= (mask!7731 thiss!1248) #b00000000000000000000000000111111) (= (mask!7731 thiss!1248) #b00000000000000000000000001111111) (= (mask!7731 thiss!1248) #b00000000000000000000000011111111) (= (mask!7731 thiss!1248) #b00000000000000000000000111111111) (= (mask!7731 thiss!1248) #b00000000000000000000001111111111) (= (mask!7731 thiss!1248) #b00000000000000000000011111111111) (= (mask!7731 thiss!1248) #b00000000000000000000111111111111) (= (mask!7731 thiss!1248) #b00000000000000000001111111111111) (= (mask!7731 thiss!1248) #b00000000000000000011111111111111) (= (mask!7731 thiss!1248) #b00000000000000000111111111111111) (= (mask!7731 thiss!1248) #b00000000000000001111111111111111) (= (mask!7731 thiss!1248) #b00000000000000011111111111111111) (= (mask!7731 thiss!1248) #b00000000000000111111111111111111) (= (mask!7731 thiss!1248) #b00000000000001111111111111111111) (= (mask!7731 thiss!1248) #b00000000000011111111111111111111) (= (mask!7731 thiss!1248) #b00000000000111111111111111111111) (= (mask!7731 thiss!1248) #b00000000001111111111111111111111) (= (mask!7731 thiss!1248) #b00000000011111111111111111111111) (= (mask!7731 thiss!1248) #b00000000111111111111111111111111) (= (mask!7731 thiss!1248) #b00000001111111111111111111111111) (= (mask!7731 thiss!1248) #b00000011111111111111111111111111) (= (mask!7731 thiss!1248) #b00000111111111111111111111111111) (= (mask!7731 thiss!1248) #b00001111111111111111111111111111) (= (mask!7731 thiss!1248) #b00011111111111111111111111111111) (= (mask!7731 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7731 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158834 d!51299))

(declare-fun b!158904 () Bool)

(declare-fun e!104051 () Bool)

(declare-fun call!17260 () Bool)

(assert (=> b!158904 (= e!104051 call!17260)))

(declare-fun b!158905 () Bool)

(declare-fun e!104052 () Bool)

(assert (=> b!158905 (= e!104051 e!104052)))

(declare-fun lt!81989 () (_ BitVec 64))

(assert (=> b!158905 (= lt!81989 (select (arr!2672 (_keys!4995 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4995 0))(
  ( (Unit!4996) )
))
(declare-fun lt!81990 () Unit!4995)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5649 (_ BitVec 64) (_ BitVec 32)) Unit!4995)

(assert (=> b!158905 (= lt!81990 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4995 thiss!1248) lt!81989 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158905 (arrayContainsKey!0 (_keys!4995 thiss!1248) lt!81989 #b00000000000000000000000000000000)))

(declare-fun lt!81988 () Unit!4995)

(assert (=> b!158905 (= lt!81988 lt!81990)))

(declare-fun res!75029 () Bool)

(assert (=> b!158905 (= res!75029 (= (seekEntryOrOpen!0 (select (arr!2672 (_keys!4995 thiss!1248)) #b00000000000000000000000000000000) (_keys!4995 thiss!1248) (mask!7731 thiss!1248)) (Found!297 #b00000000000000000000000000000000)))))

(assert (=> b!158905 (=> (not res!75029) (not e!104052))))

(declare-fun bm!17257 () Bool)

(assert (=> bm!17257 (= call!17260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4995 thiss!1248) (mask!7731 thiss!1248)))))

(declare-fun d!51301 () Bool)

(declare-fun res!75028 () Bool)

(declare-fun e!104050 () Bool)

(assert (=> d!51301 (=> res!75028 e!104050)))

(assert (=> d!51301 (= res!75028 (bvsge #b00000000000000000000000000000000 (size!2956 (_keys!4995 thiss!1248))))))

(assert (=> d!51301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4995 thiss!1248) (mask!7731 thiss!1248)) e!104050)))

(declare-fun b!158906 () Bool)

(assert (=> b!158906 (= e!104050 e!104051)))

(declare-fun c!29906 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158906 (= c!29906 (validKeyInArray!0 (select (arr!2672 (_keys!4995 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158907 () Bool)

(assert (=> b!158907 (= e!104052 call!17260)))

(assert (= (and d!51301 (not res!75028)) b!158906))

(assert (= (and b!158906 c!29906) b!158905))

(assert (= (and b!158906 (not c!29906)) b!158904))

(assert (= (and b!158905 res!75029) b!158907))

(assert (= (or b!158907 b!158904) bm!17257))

(declare-fun m!191557 () Bool)

(assert (=> b!158905 m!191557))

(declare-fun m!191559 () Bool)

(assert (=> b!158905 m!191559))

(declare-fun m!191561 () Bool)

(assert (=> b!158905 m!191561))

(assert (=> b!158905 m!191557))

(declare-fun m!191563 () Bool)

(assert (=> b!158905 m!191563))

(declare-fun m!191565 () Bool)

(assert (=> bm!17257 m!191565))

(assert (=> b!158906 m!191557))

(assert (=> b!158906 m!191557))

(declare-fun m!191567 () Bool)

(assert (=> b!158906 m!191567))

(assert (=> b!158836 d!51301))

(declare-fun d!51303 () Bool)

(assert (=> d!51303 (= (array_inv!1703 (_keys!4995 thiss!1248)) (bvsge (size!2956 (_keys!4995 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158835 d!51303))

(declare-fun d!51305 () Bool)

(assert (=> d!51305 (= (array_inv!1704 (_values!3183 thiss!1248)) (bvsge (size!2957 (_values!3183 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158835 d!51305))

(declare-fun d!51307 () Bool)

(declare-fun res!75036 () Bool)

(declare-fun e!104055 () Bool)

(assert (=> d!51307 (=> (not res!75036) (not e!104055))))

(declare-fun simpleValid!115 (LongMapFixedSize!1516) Bool)

(assert (=> d!51307 (= res!75036 (simpleValid!115 thiss!1248))))

(assert (=> d!51307 (= (valid!733 thiss!1248) e!104055)))

(declare-fun b!158914 () Bool)

(declare-fun res!75037 () Bool)

(assert (=> b!158914 (=> (not res!75037) (not e!104055))))

(declare-fun arrayCountValidKeys!0 (array!5649 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158914 (= res!75037 (= (arrayCountValidKeys!0 (_keys!4995 thiss!1248) #b00000000000000000000000000000000 (size!2956 (_keys!4995 thiss!1248))) (_size!807 thiss!1248)))))

(declare-fun b!158915 () Bool)

(declare-fun res!75038 () Bool)

(assert (=> b!158915 (=> (not res!75038) (not e!104055))))

(assert (=> b!158915 (= res!75038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4995 thiss!1248) (mask!7731 thiss!1248)))))

(declare-fun b!158916 () Bool)

(declare-datatypes ((List!1876 0))(
  ( (Nil!1873) (Cons!1872 (h!2485 (_ BitVec 64)) (t!6670 List!1876)) )
))
(declare-fun arrayNoDuplicates!0 (array!5649 (_ BitVec 32) List!1876) Bool)

(assert (=> b!158916 (= e!104055 (arrayNoDuplicates!0 (_keys!4995 thiss!1248) #b00000000000000000000000000000000 Nil!1873))))

(assert (= (and d!51307 res!75036) b!158914))

(assert (= (and b!158914 res!75037) b!158915))

(assert (= (and b!158915 res!75038) b!158916))

(declare-fun m!191569 () Bool)

(assert (=> d!51307 m!191569))

(declare-fun m!191571 () Bool)

(assert (=> b!158914 m!191571))

(assert (=> b!158915 m!191515))

(declare-fun m!191573 () Bool)

(assert (=> b!158916 m!191573))

(assert (=> start!15996 d!51307))

(declare-fun b!158929 () Bool)

(declare-fun e!104064 () SeekEntryResult!297)

(declare-fun lt!81997 () SeekEntryResult!297)

(assert (=> b!158929 (= e!104064 (Found!297 (index!3358 lt!81997)))))

(declare-fun b!158930 () Bool)

(declare-fun e!104062 () SeekEntryResult!297)

(assert (=> b!158930 (= e!104062 e!104064)))

(declare-fun lt!81998 () (_ BitVec 64))

(assert (=> b!158930 (= lt!81998 (select (arr!2672 (_keys!4995 thiss!1248)) (index!3358 lt!81997)))))

(declare-fun c!29915 () Bool)

(assert (=> b!158930 (= c!29915 (= lt!81998 key!828))))

(declare-fun b!158931 () Bool)

(assert (=> b!158931 (= e!104062 Undefined!297)))

(declare-fun d!51309 () Bool)

(declare-fun lt!81999 () SeekEntryResult!297)

(assert (=> d!51309 (and (or ((_ is Undefined!297) lt!81999) (not ((_ is Found!297) lt!81999)) (and (bvsge (index!3357 lt!81999) #b00000000000000000000000000000000) (bvslt (index!3357 lt!81999) (size!2956 (_keys!4995 thiss!1248))))) (or ((_ is Undefined!297) lt!81999) ((_ is Found!297) lt!81999) (not ((_ is MissingZero!297) lt!81999)) (and (bvsge (index!3356 lt!81999) #b00000000000000000000000000000000) (bvslt (index!3356 lt!81999) (size!2956 (_keys!4995 thiss!1248))))) (or ((_ is Undefined!297) lt!81999) ((_ is Found!297) lt!81999) ((_ is MissingZero!297) lt!81999) (not ((_ is MissingVacant!297) lt!81999)) (and (bvsge (index!3359 lt!81999) #b00000000000000000000000000000000) (bvslt (index!3359 lt!81999) (size!2956 (_keys!4995 thiss!1248))))) (or ((_ is Undefined!297) lt!81999) (ite ((_ is Found!297) lt!81999) (= (select (arr!2672 (_keys!4995 thiss!1248)) (index!3357 lt!81999)) key!828) (ite ((_ is MissingZero!297) lt!81999) (= (select (arr!2672 (_keys!4995 thiss!1248)) (index!3356 lt!81999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!297) lt!81999) (= (select (arr!2672 (_keys!4995 thiss!1248)) (index!3359 lt!81999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51309 (= lt!81999 e!104062)))

(declare-fun c!29914 () Bool)

(assert (=> d!51309 (= c!29914 (and ((_ is Intermediate!297) lt!81997) (undefined!1109 lt!81997)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5649 (_ BitVec 32)) SeekEntryResult!297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51309 (= lt!81997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7731 thiss!1248)) key!828 (_keys!4995 thiss!1248) (mask!7731 thiss!1248)))))

(assert (=> d!51309 (validMask!0 (mask!7731 thiss!1248))))

(assert (=> d!51309 (= (seekEntryOrOpen!0 key!828 (_keys!4995 thiss!1248) (mask!7731 thiss!1248)) lt!81999)))

(declare-fun b!158932 () Bool)

(declare-fun e!104063 () SeekEntryResult!297)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5649 (_ BitVec 32)) SeekEntryResult!297)

(assert (=> b!158932 (= e!104063 (seekKeyOrZeroReturnVacant!0 (x!17529 lt!81997) (index!3358 lt!81997) (index!3358 lt!81997) key!828 (_keys!4995 thiss!1248) (mask!7731 thiss!1248)))))

(declare-fun b!158933 () Bool)

(assert (=> b!158933 (= e!104063 (MissingZero!297 (index!3358 lt!81997)))))

(declare-fun b!158934 () Bool)

(declare-fun c!29913 () Bool)

(assert (=> b!158934 (= c!29913 (= lt!81998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158934 (= e!104064 e!104063)))

(assert (= (and d!51309 c!29914) b!158931))

(assert (= (and d!51309 (not c!29914)) b!158930))

(assert (= (and b!158930 c!29915) b!158929))

(assert (= (and b!158930 (not c!29915)) b!158934))

(assert (= (and b!158934 c!29913) b!158933))

(assert (= (and b!158934 (not c!29913)) b!158932))

(declare-fun m!191575 () Bool)

(assert (=> b!158930 m!191575))

(declare-fun m!191577 () Bool)

(assert (=> d!51309 m!191577))

(declare-fun m!191579 () Bool)

(assert (=> d!51309 m!191579))

(declare-fun m!191581 () Bool)

(assert (=> d!51309 m!191581))

(declare-fun m!191583 () Bool)

(assert (=> d!51309 m!191583))

(declare-fun m!191585 () Bool)

(assert (=> d!51309 m!191585))

(assert (=> d!51309 m!191521))

(assert (=> d!51309 m!191577))

(declare-fun m!191587 () Bool)

(assert (=> b!158932 m!191587))

(assert (=> b!158840 d!51309))

(declare-fun mapIsEmpty!5630 () Bool)

(declare-fun mapRes!5630 () Bool)

(assert (=> mapIsEmpty!5630 mapRes!5630))

(declare-fun condMapEmpty!5630 () Bool)

(declare-fun mapDefault!5630 () ValueCell!1304)

(assert (=> mapNonEmpty!5621 (= condMapEmpty!5630 (= mapRest!5621 ((as const (Array (_ BitVec 32) ValueCell!1304)) mapDefault!5630)))))

(declare-fun e!104070 () Bool)

(assert (=> mapNonEmpty!5621 (= tp!13039 (and e!104070 mapRes!5630))))

(declare-fun b!158941 () Bool)

(declare-fun e!104069 () Bool)

(assert (=> b!158941 (= e!104069 tp_is_empty!3295)))

(declare-fun b!158942 () Bool)

(assert (=> b!158942 (= e!104070 tp_is_empty!3295)))

(declare-fun mapNonEmpty!5630 () Bool)

(declare-fun tp!13055 () Bool)

(assert (=> mapNonEmpty!5630 (= mapRes!5630 (and tp!13055 e!104069))))

(declare-fun mapRest!5630 () (Array (_ BitVec 32) ValueCell!1304))

(declare-fun mapValue!5630 () ValueCell!1304)

(declare-fun mapKey!5630 () (_ BitVec 32))

(assert (=> mapNonEmpty!5630 (= mapRest!5621 (store mapRest!5630 mapKey!5630 mapValue!5630))))

(assert (= (and mapNonEmpty!5621 condMapEmpty!5630) mapIsEmpty!5630))

(assert (= (and mapNonEmpty!5621 (not condMapEmpty!5630)) mapNonEmpty!5630))

(assert (= (and mapNonEmpty!5630 ((_ is ValueCellFull!1304) mapValue!5630)) b!158941))

(assert (= (and mapNonEmpty!5621 ((_ is ValueCellFull!1304) mapDefault!5630)) b!158942))

(declare-fun m!191589 () Bool)

(assert (=> mapNonEmpty!5630 m!191589))

(check-sat (not d!51307) b_and!9921 (not b_next!3493) (not b!158914) (not bm!17257) (not d!51309) (not b!158915) tp_is_empty!3295 (not b!158916) (not b!158906) (not mapNonEmpty!5630) (not b!158932) (not b!158905))
(check-sat b_and!9921 (not b_next!3493))
