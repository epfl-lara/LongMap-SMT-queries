; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16502 () Bool)

(assert start!16502)

(declare-fun b!163918 () Bool)

(declare-fun b_free!3817 () Bool)

(declare-fun b_next!3817 () Bool)

(assert (=> b!163918 (= b_free!3817 (not b_next!3817))))

(declare-fun tp!14048 () Bool)

(declare-fun b_and!10205 () Bool)

(assert (=> b!163918 (= tp!14048 b_and!10205)))

(declare-fun b!163908 () Bool)

(declare-fun e!107542 () Bool)

(declare-fun e!107547 () Bool)

(assert (=> b!163908 (= e!107542 e!107547)))

(declare-fun res!77531 () Bool)

(assert (=> b!163908 (=> (not res!77531) (not e!107547))))

(declare-datatypes ((SeekEntryResult!418 0))(
  ( (MissingZero!418 (index!3840 (_ BitVec 32))) (Found!418 (index!3841 (_ BitVec 32))) (Intermediate!418 (undefined!1230 Bool) (index!3842 (_ BitVec 32)) (x!18205 (_ BitVec 32))) (Undefined!418) (MissingVacant!418 (index!3843 (_ BitVec 32))) )
))
(declare-fun lt!82638 () SeekEntryResult!418)

(get-info :version)

(assert (=> b!163908 (= res!77531 (and (not ((_ is Undefined!418) lt!82638)) (not ((_ is MissingVacant!418) lt!82638)) (not ((_ is MissingZero!418) lt!82638)) ((_ is Found!418) lt!82638)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4473 0))(
  ( (V!4474 (val!1854 Int)) )
))
(declare-datatypes ((ValueCell!1466 0))(
  ( (ValueCellFull!1466 (v!3713 V!4473)) (EmptyCell!1466) )
))
(declare-datatypes ((array!6313 0))(
  ( (array!6314 (arr!2992 (Array (_ BitVec 32) (_ BitVec 64))) (size!3281 (_ BitVec 32))) )
))
(declare-datatypes ((array!6315 0))(
  ( (array!6316 (arr!2993 (Array (_ BitVec 32) ValueCell!1466)) (size!3282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1840 0))(
  ( (LongMapFixedSize!1841 (defaultEntry!3362 Int) (mask!8043 (_ BitVec 32)) (extraKeys!3103 (_ BitVec 32)) (zeroValue!3205 V!4473) (minValue!3205 V!4473) (_size!969 (_ BitVec 32)) (_keys!5184 array!6313) (_values!3345 array!6315) (_vacant!969 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1840)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6313 (_ BitVec 32)) SeekEntryResult!418)

(assert (=> b!163908 (= lt!82638 (seekEntryOrOpen!0 key!828 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(declare-fun b!163909 () Bool)

(declare-fun res!77533 () Bool)

(assert (=> b!163909 (=> (not res!77533) (not e!107547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163909 (= res!77533 (validMask!0 (mask!8043 thiss!1248)))))

(declare-fun mapIsEmpty!6144 () Bool)

(declare-fun mapRes!6144 () Bool)

(assert (=> mapIsEmpty!6144 mapRes!6144))

(declare-fun b!163910 () Bool)

(declare-fun res!77535 () Bool)

(assert (=> b!163910 (=> (not res!77535) (not e!107542))))

(assert (=> b!163910 (= res!77535 (not (= key!828 (bvneg key!828))))))

(declare-fun res!77532 () Bool)

(assert (=> start!16502 (=> (not res!77532) (not e!107542))))

(declare-fun valid!829 (LongMapFixedSize!1840) Bool)

(assert (=> start!16502 (= res!77532 (valid!829 thiss!1248))))

(assert (=> start!16502 e!107542))

(declare-fun e!107543 () Bool)

(assert (=> start!16502 e!107543))

(assert (=> start!16502 true))

(declare-fun mapNonEmpty!6144 () Bool)

(declare-fun tp!14049 () Bool)

(declare-fun e!107545 () Bool)

(assert (=> mapNonEmpty!6144 (= mapRes!6144 (and tp!14049 e!107545))))

(declare-fun mapKey!6144 () (_ BitVec 32))

(declare-fun mapValue!6144 () ValueCell!1466)

(declare-fun mapRest!6144 () (Array (_ BitVec 32) ValueCell!1466))

(assert (=> mapNonEmpty!6144 (= (arr!2993 (_values!3345 thiss!1248)) (store mapRest!6144 mapKey!6144 mapValue!6144))))

(declare-fun b!163911 () Bool)

(assert (=> b!163911 (= e!107547 (bvsgt #b00000000000000000000000000000000 (size!3281 (_keys!5184 thiss!1248))))))

(declare-fun b!163912 () Bool)

(declare-fun e!107546 () Bool)

(declare-fun e!107541 () Bool)

(assert (=> b!163912 (= e!107546 (and e!107541 mapRes!6144))))

(declare-fun condMapEmpty!6144 () Bool)

(declare-fun mapDefault!6144 () ValueCell!1466)

(assert (=> b!163912 (= condMapEmpty!6144 (= (arr!2993 (_values!3345 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1466)) mapDefault!6144)))))

(declare-fun b!163913 () Bool)

(declare-fun res!77536 () Bool)

(assert (=> b!163913 (=> (not res!77536) (not e!107547))))

(assert (=> b!163913 (= res!77536 (and (= (size!3282 (_values!3345 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8043 thiss!1248))) (= (size!3281 (_keys!5184 thiss!1248)) (size!3282 (_values!3345 thiss!1248))) (bvsge (mask!8043 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3103 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3103 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163914 () Bool)

(declare-fun tp_is_empty!3619 () Bool)

(assert (=> b!163914 (= e!107545 tp_is_empty!3619)))

(declare-fun b!163915 () Bool)

(declare-fun res!77534 () Bool)

(assert (=> b!163915 (=> (not res!77534) (not e!107547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6313 (_ BitVec 32)) Bool)

(assert (=> b!163915 (= res!77534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(declare-fun b!163916 () Bool)

(declare-fun res!77530 () Bool)

(assert (=> b!163916 (=> (not res!77530) (not e!107547))))

(declare-datatypes ((List!2002 0))(
  ( (Nil!1999) (Cons!1998 (h!2615 (_ BitVec 64)) (t!6795 List!2002)) )
))
(declare-fun arrayNoDuplicates!0 (array!6313 (_ BitVec 32) List!2002) Bool)

(assert (=> b!163916 (= res!77530 (arrayNoDuplicates!0 (_keys!5184 thiss!1248) #b00000000000000000000000000000000 Nil!1999))))

(declare-fun b!163917 () Bool)

(assert (=> b!163917 (= e!107541 tp_is_empty!3619)))

(declare-fun array_inv!1929 (array!6313) Bool)

(declare-fun array_inv!1930 (array!6315) Bool)

(assert (=> b!163918 (= e!107543 (and tp!14048 tp_is_empty!3619 (array_inv!1929 (_keys!5184 thiss!1248)) (array_inv!1930 (_values!3345 thiss!1248)) e!107546))))

(assert (= (and start!16502 res!77532) b!163910))

(assert (= (and b!163910 res!77535) b!163908))

(assert (= (and b!163908 res!77531) b!163909))

(assert (= (and b!163909 res!77533) b!163913))

(assert (= (and b!163913 res!77536) b!163915))

(assert (= (and b!163915 res!77534) b!163916))

(assert (= (and b!163916 res!77530) b!163911))

(assert (= (and b!163912 condMapEmpty!6144) mapIsEmpty!6144))

(assert (= (and b!163912 (not condMapEmpty!6144)) mapNonEmpty!6144))

(assert (= (and mapNonEmpty!6144 ((_ is ValueCellFull!1466) mapValue!6144)) b!163914))

(assert (= (and b!163912 ((_ is ValueCellFull!1466) mapDefault!6144)) b!163917))

(assert (= b!163918 b!163912))

(assert (= start!16502 b!163918))

(declare-fun m!193807 () Bool)

(assert (=> b!163916 m!193807))

(declare-fun m!193809 () Bool)

(assert (=> b!163915 m!193809))

(declare-fun m!193811 () Bool)

(assert (=> b!163909 m!193811))

(declare-fun m!193813 () Bool)

(assert (=> b!163918 m!193813))

(declare-fun m!193815 () Bool)

(assert (=> b!163918 m!193815))

(declare-fun m!193817 () Bool)

(assert (=> mapNonEmpty!6144 m!193817))

(declare-fun m!193819 () Bool)

(assert (=> b!163908 m!193819))

(declare-fun m!193821 () Bool)

(assert (=> start!16502 m!193821))

(check-sat (not b!163916) (not mapNonEmpty!6144) tp_is_empty!3619 (not start!16502) (not b!163915) b_and!10205 (not b!163908) (not b!163909) (not b!163918) (not b_next!3817))
(check-sat b_and!10205 (not b_next!3817))
(get-model)

(declare-fun d!51367 () Bool)

(assert (=> d!51367 (= (validMask!0 (mask!8043 thiss!1248)) (and (or (= (mask!8043 thiss!1248) #b00000000000000000000000000000111) (= (mask!8043 thiss!1248) #b00000000000000000000000000001111) (= (mask!8043 thiss!1248) #b00000000000000000000000000011111) (= (mask!8043 thiss!1248) #b00000000000000000000000000111111) (= (mask!8043 thiss!1248) #b00000000000000000000000001111111) (= (mask!8043 thiss!1248) #b00000000000000000000000011111111) (= (mask!8043 thiss!1248) #b00000000000000000000000111111111) (= (mask!8043 thiss!1248) #b00000000000000000000001111111111) (= (mask!8043 thiss!1248) #b00000000000000000000011111111111) (= (mask!8043 thiss!1248) #b00000000000000000000111111111111) (= (mask!8043 thiss!1248) #b00000000000000000001111111111111) (= (mask!8043 thiss!1248) #b00000000000000000011111111111111) (= (mask!8043 thiss!1248) #b00000000000000000111111111111111) (= (mask!8043 thiss!1248) #b00000000000000001111111111111111) (= (mask!8043 thiss!1248) #b00000000000000011111111111111111) (= (mask!8043 thiss!1248) #b00000000000000111111111111111111) (= (mask!8043 thiss!1248) #b00000000000001111111111111111111) (= (mask!8043 thiss!1248) #b00000000000011111111111111111111) (= (mask!8043 thiss!1248) #b00000000000111111111111111111111) (= (mask!8043 thiss!1248) #b00000000001111111111111111111111) (= (mask!8043 thiss!1248) #b00000000011111111111111111111111) (= (mask!8043 thiss!1248) #b00000000111111111111111111111111) (= (mask!8043 thiss!1248) #b00000001111111111111111111111111) (= (mask!8043 thiss!1248) #b00000011111111111111111111111111) (= (mask!8043 thiss!1248) #b00000111111111111111111111111111) (= (mask!8043 thiss!1248) #b00001111111111111111111111111111) (= (mask!8043 thiss!1248) #b00011111111111111111111111111111) (= (mask!8043 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8043 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163909 d!51367))

(declare-fun d!51369 () Bool)

(assert (=> d!51369 (= (array_inv!1929 (_keys!5184 thiss!1248)) (bvsge (size!3281 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163918 d!51369))

(declare-fun d!51371 () Bool)

(assert (=> d!51371 (= (array_inv!1930 (_values!3345 thiss!1248)) (bvsge (size!3282 (_values!3345 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163918 d!51371))

(declare-fun d!51373 () Bool)

(declare-fun res!77585 () Bool)

(declare-fun e!107592 () Bool)

(assert (=> d!51373 (=> (not res!77585) (not e!107592))))

(declare-fun simpleValid!126 (LongMapFixedSize!1840) Bool)

(assert (=> d!51373 (= res!77585 (simpleValid!126 thiss!1248))))

(assert (=> d!51373 (= (valid!829 thiss!1248) e!107592)))

(declare-fun b!163991 () Bool)

(declare-fun res!77586 () Bool)

(assert (=> b!163991 (=> (not res!77586) (not e!107592))))

(declare-fun arrayCountValidKeys!0 (array!6313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163991 (= res!77586 (= (arrayCountValidKeys!0 (_keys!5184 thiss!1248) #b00000000000000000000000000000000 (size!3281 (_keys!5184 thiss!1248))) (_size!969 thiss!1248)))))

(declare-fun b!163992 () Bool)

(declare-fun res!77587 () Bool)

(assert (=> b!163992 (=> (not res!77587) (not e!107592))))

(assert (=> b!163992 (= res!77587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(declare-fun b!163993 () Bool)

(assert (=> b!163993 (= e!107592 (arrayNoDuplicates!0 (_keys!5184 thiss!1248) #b00000000000000000000000000000000 Nil!1999))))

(assert (= (and d!51373 res!77585) b!163991))

(assert (= (and b!163991 res!77586) b!163992))

(assert (= (and b!163992 res!77587) b!163993))

(declare-fun m!193855 () Bool)

(assert (=> d!51373 m!193855))

(declare-fun m!193857 () Bool)

(assert (=> b!163991 m!193857))

(assert (=> b!163992 m!193809))

(assert (=> b!163993 m!193807))

(assert (=> start!16502 d!51373))

(declare-fun d!51375 () Bool)

(declare-fun res!77593 () Bool)

(declare-fun e!107599 () Bool)

(assert (=> d!51375 (=> res!77593 e!107599)))

(assert (=> d!51375 (= res!77593 (bvsge #b00000000000000000000000000000000 (size!3281 (_keys!5184 thiss!1248))))))

(assert (=> d!51375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)) e!107599)))

(declare-fun b!164002 () Bool)

(declare-fun e!107601 () Bool)

(declare-fun e!107600 () Bool)

(assert (=> b!164002 (= e!107601 e!107600)))

(declare-fun lt!82653 () (_ BitVec 64))

(assert (=> b!164002 (= lt!82653 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5017 0))(
  ( (Unit!5018) )
))
(declare-fun lt!82651 () Unit!5017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6313 (_ BitVec 64) (_ BitVec 32)) Unit!5017)

(assert (=> b!164002 (= lt!82651 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5184 thiss!1248) lt!82653 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!164002 (arrayContainsKey!0 (_keys!5184 thiss!1248) lt!82653 #b00000000000000000000000000000000)))

(declare-fun lt!82652 () Unit!5017)

(assert (=> b!164002 (= lt!82652 lt!82651)))

(declare-fun res!77592 () Bool)

(assert (=> b!164002 (= res!77592 (= (seekEntryOrOpen!0 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000) (_keys!5184 thiss!1248) (mask!8043 thiss!1248)) (Found!418 #b00000000000000000000000000000000)))))

(assert (=> b!164002 (=> (not res!77592) (not e!107600))))

(declare-fun b!164003 () Bool)

(assert (=> b!164003 (= e!107599 e!107601)))

(declare-fun c!30155 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!164003 (= c!30155 (validKeyInArray!0 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17305 () Bool)

(declare-fun call!17308 () Bool)

(assert (=> bm!17305 (= call!17308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(declare-fun b!164004 () Bool)

(assert (=> b!164004 (= e!107600 call!17308)))

(declare-fun b!164005 () Bool)

(assert (=> b!164005 (= e!107601 call!17308)))

(assert (= (and d!51375 (not res!77593)) b!164003))

(assert (= (and b!164003 c!30155) b!164002))

(assert (= (and b!164003 (not c!30155)) b!164005))

(assert (= (and b!164002 res!77592) b!164004))

(assert (= (or b!164004 b!164005) bm!17305))

(declare-fun m!193859 () Bool)

(assert (=> b!164002 m!193859))

(declare-fun m!193861 () Bool)

(assert (=> b!164002 m!193861))

(declare-fun m!193863 () Bool)

(assert (=> b!164002 m!193863))

(assert (=> b!164002 m!193859))

(declare-fun m!193865 () Bool)

(assert (=> b!164002 m!193865))

(assert (=> b!164003 m!193859))

(assert (=> b!164003 m!193859))

(declare-fun m!193867 () Bool)

(assert (=> b!164003 m!193867))

(declare-fun m!193869 () Bool)

(assert (=> bm!17305 m!193869))

(assert (=> b!163915 d!51375))

(declare-fun bm!17308 () Bool)

(declare-fun call!17311 () Bool)

(declare-fun c!30158 () Bool)

(assert (=> bm!17308 (= call!17311 (arrayNoDuplicates!0 (_keys!5184 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30158 (Cons!1998 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000) Nil!1999) Nil!1999)))))

(declare-fun d!51377 () Bool)

(declare-fun res!77602 () Bool)

(declare-fun e!107610 () Bool)

(assert (=> d!51377 (=> res!77602 e!107610)))

(assert (=> d!51377 (= res!77602 (bvsge #b00000000000000000000000000000000 (size!3281 (_keys!5184 thiss!1248))))))

(assert (=> d!51377 (= (arrayNoDuplicates!0 (_keys!5184 thiss!1248) #b00000000000000000000000000000000 Nil!1999) e!107610)))

(declare-fun b!164016 () Bool)

(declare-fun e!107613 () Bool)

(assert (=> b!164016 (= e!107610 e!107613)))

(declare-fun res!77600 () Bool)

(assert (=> b!164016 (=> (not res!77600) (not e!107613))))

(declare-fun e!107611 () Bool)

(assert (=> b!164016 (= res!77600 (not e!107611))))

(declare-fun res!77601 () Bool)

(assert (=> b!164016 (=> (not res!77601) (not e!107611))))

(assert (=> b!164016 (= res!77601 (validKeyInArray!0 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164017 () Bool)

(declare-fun e!107612 () Bool)

(assert (=> b!164017 (= e!107612 call!17311)))

(declare-fun b!164018 () Bool)

(declare-fun contains!1033 (List!2002 (_ BitVec 64)) Bool)

(assert (=> b!164018 (= e!107611 (contains!1033 Nil!1999 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164019 () Bool)

(assert (=> b!164019 (= e!107612 call!17311)))

(declare-fun b!164020 () Bool)

(assert (=> b!164020 (= e!107613 e!107612)))

(assert (=> b!164020 (= c!30158 (validKeyInArray!0 (select (arr!2992 (_keys!5184 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51377 (not res!77602)) b!164016))

(assert (= (and b!164016 res!77601) b!164018))

(assert (= (and b!164016 res!77600) b!164020))

(assert (= (and b!164020 c!30158) b!164017))

(assert (= (and b!164020 (not c!30158)) b!164019))

(assert (= (or b!164017 b!164019) bm!17308))

(assert (=> bm!17308 m!193859))

(declare-fun m!193871 () Bool)

(assert (=> bm!17308 m!193871))

(assert (=> b!164016 m!193859))

(assert (=> b!164016 m!193859))

(assert (=> b!164016 m!193867))

(assert (=> b!164018 m!193859))

(assert (=> b!164018 m!193859))

(declare-fun m!193873 () Bool)

(assert (=> b!164018 m!193873))

(assert (=> b!164020 m!193859))

(assert (=> b!164020 m!193859))

(assert (=> b!164020 m!193867))

(assert (=> b!163916 d!51377))

(declare-fun b!164033 () Bool)

(declare-fun c!30167 () Bool)

(declare-fun lt!82661 () (_ BitVec 64))

(assert (=> b!164033 (= c!30167 (= lt!82661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107621 () SeekEntryResult!418)

(declare-fun e!107622 () SeekEntryResult!418)

(assert (=> b!164033 (= e!107621 e!107622)))

(declare-fun b!164034 () Bool)

(declare-fun lt!82662 () SeekEntryResult!418)

(assert (=> b!164034 (= e!107622 (MissingZero!418 (index!3842 lt!82662)))))

(declare-fun b!164035 () Bool)

(declare-fun e!107620 () SeekEntryResult!418)

(assert (=> b!164035 (= e!107620 Undefined!418)))

(declare-fun b!164036 () Bool)

(assert (=> b!164036 (= e!107620 e!107621)))

(assert (=> b!164036 (= lt!82661 (select (arr!2992 (_keys!5184 thiss!1248)) (index!3842 lt!82662)))))

(declare-fun c!30166 () Bool)

(assert (=> b!164036 (= c!30166 (= lt!82661 key!828))))

(declare-fun b!164037 () Bool)

(assert (=> b!164037 (= e!107621 (Found!418 (index!3842 lt!82662)))))

(declare-fun d!51379 () Bool)

(declare-fun lt!82660 () SeekEntryResult!418)

(assert (=> d!51379 (and (or ((_ is Undefined!418) lt!82660) (not ((_ is Found!418) lt!82660)) (and (bvsge (index!3841 lt!82660) #b00000000000000000000000000000000) (bvslt (index!3841 lt!82660) (size!3281 (_keys!5184 thiss!1248))))) (or ((_ is Undefined!418) lt!82660) ((_ is Found!418) lt!82660) (not ((_ is MissingZero!418) lt!82660)) (and (bvsge (index!3840 lt!82660) #b00000000000000000000000000000000) (bvslt (index!3840 lt!82660) (size!3281 (_keys!5184 thiss!1248))))) (or ((_ is Undefined!418) lt!82660) ((_ is Found!418) lt!82660) ((_ is MissingZero!418) lt!82660) (not ((_ is MissingVacant!418) lt!82660)) (and (bvsge (index!3843 lt!82660) #b00000000000000000000000000000000) (bvslt (index!3843 lt!82660) (size!3281 (_keys!5184 thiss!1248))))) (or ((_ is Undefined!418) lt!82660) (ite ((_ is Found!418) lt!82660) (= (select (arr!2992 (_keys!5184 thiss!1248)) (index!3841 lt!82660)) key!828) (ite ((_ is MissingZero!418) lt!82660) (= (select (arr!2992 (_keys!5184 thiss!1248)) (index!3840 lt!82660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!418) lt!82660) (= (select (arr!2992 (_keys!5184 thiss!1248)) (index!3843 lt!82660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51379 (= lt!82660 e!107620)))

(declare-fun c!30165 () Bool)

(assert (=> d!51379 (= c!30165 (and ((_ is Intermediate!418) lt!82662) (undefined!1230 lt!82662)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6313 (_ BitVec 32)) SeekEntryResult!418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51379 (= lt!82662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8043 thiss!1248)) key!828 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(assert (=> d!51379 (validMask!0 (mask!8043 thiss!1248))))

(assert (=> d!51379 (= (seekEntryOrOpen!0 key!828 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)) lt!82660)))

(declare-fun b!164038 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6313 (_ BitVec 32)) SeekEntryResult!418)

(assert (=> b!164038 (= e!107622 (seekKeyOrZeroReturnVacant!0 (x!18205 lt!82662) (index!3842 lt!82662) (index!3842 lt!82662) key!828 (_keys!5184 thiss!1248) (mask!8043 thiss!1248)))))

(assert (= (and d!51379 c!30165) b!164035))

(assert (= (and d!51379 (not c!30165)) b!164036))

(assert (= (and b!164036 c!30166) b!164037))

(assert (= (and b!164036 (not c!30166)) b!164033))

(assert (= (and b!164033 c!30167) b!164034))

(assert (= (and b!164033 (not c!30167)) b!164038))

(declare-fun m!193875 () Bool)

(assert (=> b!164036 m!193875))

(declare-fun m!193877 () Bool)

(assert (=> d!51379 m!193877))

(declare-fun m!193879 () Bool)

(assert (=> d!51379 m!193879))

(declare-fun m!193881 () Bool)

(assert (=> d!51379 m!193881))

(declare-fun m!193883 () Bool)

(assert (=> d!51379 m!193883))

(assert (=> d!51379 m!193883))

(declare-fun m!193885 () Bool)

(assert (=> d!51379 m!193885))

(assert (=> d!51379 m!193811))

(declare-fun m!193887 () Bool)

(assert (=> b!164038 m!193887))

(assert (=> b!163908 d!51379))

(declare-fun condMapEmpty!6153 () Bool)

(declare-fun mapDefault!6153 () ValueCell!1466)

(assert (=> mapNonEmpty!6144 (= condMapEmpty!6153 (= mapRest!6144 ((as const (Array (_ BitVec 32) ValueCell!1466)) mapDefault!6153)))))

(declare-fun e!107628 () Bool)

(declare-fun mapRes!6153 () Bool)

(assert (=> mapNonEmpty!6144 (= tp!14049 (and e!107628 mapRes!6153))))

(declare-fun mapIsEmpty!6153 () Bool)

(assert (=> mapIsEmpty!6153 mapRes!6153))

(declare-fun b!164045 () Bool)

(declare-fun e!107627 () Bool)

(assert (=> b!164045 (= e!107627 tp_is_empty!3619)))

(declare-fun mapNonEmpty!6153 () Bool)

(declare-fun tp!14064 () Bool)

(assert (=> mapNonEmpty!6153 (= mapRes!6153 (and tp!14064 e!107627))))

(declare-fun mapKey!6153 () (_ BitVec 32))

(declare-fun mapRest!6153 () (Array (_ BitVec 32) ValueCell!1466))

(declare-fun mapValue!6153 () ValueCell!1466)

(assert (=> mapNonEmpty!6153 (= mapRest!6144 (store mapRest!6153 mapKey!6153 mapValue!6153))))

(declare-fun b!164046 () Bool)

(assert (=> b!164046 (= e!107628 tp_is_empty!3619)))

(assert (= (and mapNonEmpty!6144 condMapEmpty!6153) mapIsEmpty!6153))

(assert (= (and mapNonEmpty!6144 (not condMapEmpty!6153)) mapNonEmpty!6153))

(assert (= (and mapNonEmpty!6153 ((_ is ValueCellFull!1466) mapValue!6153)) b!164045))

(assert (= (and mapNonEmpty!6144 ((_ is ValueCellFull!1466) mapDefault!6153)) b!164046))

(declare-fun m!193889 () Bool)

(assert (=> mapNonEmpty!6153 m!193889))

(check-sat (not b!163992) (not mapNonEmpty!6153) (not b_next!3817) (not bm!17305) (not d!51379) (not b!163991) (not d!51373) (not b!164038) (not b!164020) (not b!164002) (not bm!17308) (not b!164016) (not b!164003) (not b!164018) tp_is_empty!3619 b_and!10205 (not b!163993))
(check-sat b_and!10205 (not b_next!3817))
