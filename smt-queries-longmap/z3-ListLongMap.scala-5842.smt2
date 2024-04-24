; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75606 () Bool)

(assert start!75606)

(declare-fun b!888938 () Bool)

(declare-fun b_free!15553 () Bool)

(declare-fun b_next!15553 () Bool)

(assert (=> b!888938 (= b_free!15553 (not b_next!15553))))

(declare-fun tp!54607 () Bool)

(declare-fun b_and!25799 () Bool)

(assert (=> b!888938 (= tp!54607 b_and!25799)))

(declare-fun b!888935 () Bool)

(declare-fun e!495327 () Bool)

(declare-datatypes ((array!51769 0))(
  ( (array!51770 (arr!24892 (Array (_ BitVec 32) (_ BitVec 64))) (size!25333 (_ BitVec 32))) )
))
(declare-datatypes ((V!28807 0))(
  ( (V!28808 (val!8991 Int)) )
))
(declare-datatypes ((ValueCell!8459 0))(
  ( (ValueCellFull!8459 (v!11460 V!28807)) (EmptyCell!8459) )
))
(declare-datatypes ((array!51771 0))(
  ( (array!51772 (arr!24893 (Array (_ BitVec 32) ValueCell!8459)) (size!25334 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3934 0))(
  ( (LongMapFixedSize!3935 (defaultEntry!5158 Int) (mask!25613 (_ BitVec 32)) (extraKeys!4852 (_ BitVec 32)) (zeroValue!4956 V!28807) (minValue!4956 V!28807) (_size!2022 (_ BitVec 32)) (_keys!9863 array!51769) (_values!5143 array!51771) (_vacant!2022 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3934)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!443 0))(
  ( (Some!442 (v!11461 V!28807)) (None!441) )
))
(declare-fun isDefined!317 (Option!443) Bool)

(declare-datatypes ((tuple2!11854 0))(
  ( (tuple2!11855 (_1!5938 (_ BitVec 64)) (_2!5938 V!28807)) )
))
(declare-datatypes ((List!17639 0))(
  ( (Nil!17636) (Cons!17635 (h!18772 tuple2!11854) (t!24926 List!17639)) )
))
(declare-fun getValueByKey!437 (List!17639 (_ BitVec 64)) Option!443)

(declare-datatypes ((ListLongMap!10553 0))(
  ( (ListLongMap!10554 (toList!5292 List!17639)) )
))
(declare-fun map!12092 (LongMapFixedSize!3934) ListLongMap!10553)

(assert (=> b!888935 (= e!495327 (not (isDefined!317 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785))))))

(declare-fun b!888936 () Bool)

(declare-fun res!602592 () Bool)

(assert (=> b!888936 (=> (not res!602592) (not e!495327))))

(declare-fun contains!4294 (LongMapFixedSize!3934 (_ BitVec 64)) Bool)

(assert (=> b!888936 (= res!602592 (contains!4294 thiss!1181 key!785))))

(declare-fun b!888937 () Bool)

(declare-fun e!495329 () Bool)

(declare-fun tp_is_empty!17881 () Bool)

(assert (=> b!888937 (= e!495329 tp_is_empty!17881)))

(declare-fun e!495325 () Bool)

(declare-fun e!495328 () Bool)

(declare-fun array_inv!19626 (array!51769) Bool)

(declare-fun array_inv!19627 (array!51771) Bool)

(assert (=> b!888938 (= e!495328 (and tp!54607 tp_is_empty!17881 (array_inv!19626 (_keys!9863 thiss!1181)) (array_inv!19627 (_values!5143 thiss!1181)) e!495325))))

(declare-fun b!888939 () Bool)

(declare-fun e!495324 () Bool)

(declare-fun mapRes!28354 () Bool)

(assert (=> b!888939 (= e!495325 (and e!495324 mapRes!28354))))

(declare-fun condMapEmpty!28354 () Bool)

(declare-fun mapDefault!28354 () ValueCell!8459)

(assert (=> b!888939 (= condMapEmpty!28354 (= (arr!24893 (_values!5143 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28354)))))

(declare-fun mapIsEmpty!28354 () Bool)

(assert (=> mapIsEmpty!28354 mapRes!28354))

(declare-fun b!888940 () Bool)

(declare-fun res!602593 () Bool)

(assert (=> b!888940 (=> (not res!602593) (not e!495327))))

(assert (=> b!888940 (= res!602593 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!888941 () Bool)

(assert (=> b!888941 (= e!495324 tp_is_empty!17881)))

(declare-fun mapNonEmpty!28354 () Bool)

(declare-fun tp!54606 () Bool)

(assert (=> mapNonEmpty!28354 (= mapRes!28354 (and tp!54606 e!495329))))

(declare-fun mapKey!28354 () (_ BitVec 32))

(declare-fun mapValue!28354 () ValueCell!8459)

(declare-fun mapRest!28354 () (Array (_ BitVec 32) ValueCell!8459))

(assert (=> mapNonEmpty!28354 (= (arr!24893 (_values!5143 thiss!1181)) (store mapRest!28354 mapKey!28354 mapValue!28354))))

(declare-fun res!602591 () Bool)

(assert (=> start!75606 (=> (not res!602591) (not e!495327))))

(declare-fun valid!1544 (LongMapFixedSize!3934) Bool)

(assert (=> start!75606 (= res!602591 (valid!1544 thiss!1181))))

(assert (=> start!75606 e!495327))

(assert (=> start!75606 e!495328))

(assert (=> start!75606 true))

(assert (= (and start!75606 res!602591) b!888940))

(assert (= (and b!888940 res!602593) b!888936))

(assert (= (and b!888936 res!602592) b!888935))

(assert (= (and b!888939 condMapEmpty!28354) mapIsEmpty!28354))

(assert (= (and b!888939 (not condMapEmpty!28354)) mapNonEmpty!28354))

(get-info :version)

(assert (= (and mapNonEmpty!28354 ((_ is ValueCellFull!8459) mapValue!28354)) b!888937))

(assert (= (and b!888939 ((_ is ValueCellFull!8459) mapDefault!28354)) b!888941))

(assert (= b!888938 b!888939))

(assert (= start!75606 b!888938))

(declare-fun m!828749 () Bool)

(assert (=> start!75606 m!828749))

(declare-fun m!828751 () Bool)

(assert (=> b!888938 m!828751))

(declare-fun m!828753 () Bool)

(assert (=> b!888938 m!828753))

(declare-fun m!828755 () Bool)

(assert (=> b!888935 m!828755))

(declare-fun m!828757 () Bool)

(assert (=> b!888935 m!828757))

(assert (=> b!888935 m!828757))

(declare-fun m!828759 () Bool)

(assert (=> b!888935 m!828759))

(declare-fun m!828761 () Bool)

(assert (=> mapNonEmpty!28354 m!828761))

(declare-fun m!828763 () Bool)

(assert (=> b!888936 m!828763))

(check-sat (not b!888936) (not b!888938) b_and!25799 (not start!75606) (not b_next!15553) (not b!888935) tp_is_empty!17881 (not mapNonEmpty!28354))
(check-sat b_and!25799 (not b_next!15553))
(get-model)

(declare-fun d!110313 () Bool)

(assert (=> d!110313 (= (array_inv!19626 (_keys!9863 thiss!1181)) (bvsge (size!25333 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888938 d!110313))

(declare-fun d!110315 () Bool)

(assert (=> d!110315 (= (array_inv!19627 (_values!5143 thiss!1181)) (bvsge (size!25334 (_values!5143 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888938 d!110315))

(declare-fun d!110317 () Bool)

(declare-fun isEmpty!681 (Option!443) Bool)

(assert (=> d!110317 (= (isDefined!317 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785)) (not (isEmpty!681 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785))))))

(declare-fun bs!24918 () Bool)

(assert (= bs!24918 d!110317))

(assert (=> bs!24918 m!828757))

(declare-fun m!828797 () Bool)

(assert (=> bs!24918 m!828797))

(assert (=> b!888935 d!110317))

(declare-fun b!888994 () Bool)

(declare-fun e!495371 () Option!443)

(assert (=> b!888994 (= e!495371 (getValueByKey!437 (t!24926 (toList!5292 (map!12092 thiss!1181))) key!785))))

(declare-fun b!888993 () Bool)

(declare-fun e!495370 () Option!443)

(assert (=> b!888993 (= e!495370 e!495371)))

(declare-fun c!94042 () Bool)

(assert (=> b!888993 (= c!94042 (and ((_ is Cons!17635) (toList!5292 (map!12092 thiss!1181))) (not (= (_1!5938 (h!18772 (toList!5292 (map!12092 thiss!1181)))) key!785))))))

(declare-fun b!888995 () Bool)

(assert (=> b!888995 (= e!495371 None!441)))

(declare-fun d!110319 () Bool)

(declare-fun c!94041 () Bool)

(assert (=> d!110319 (= c!94041 (and ((_ is Cons!17635) (toList!5292 (map!12092 thiss!1181))) (= (_1!5938 (h!18772 (toList!5292 (map!12092 thiss!1181)))) key!785)))))

(assert (=> d!110319 (= (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785) e!495370)))

(declare-fun b!888992 () Bool)

(assert (=> b!888992 (= e!495370 (Some!442 (_2!5938 (h!18772 (toList!5292 (map!12092 thiss!1181))))))))

(assert (= (and d!110319 c!94041) b!888992))

(assert (= (and d!110319 (not c!94041)) b!888993))

(assert (= (and b!888993 c!94042) b!888994))

(assert (= (and b!888993 (not c!94042)) b!888995))

(declare-fun m!828799 () Bool)

(assert (=> b!888994 m!828799))

(assert (=> b!888935 d!110319))

(declare-fun d!110321 () Bool)

(declare-fun getCurrentListMap!2573 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) ListLongMap!10553)

(assert (=> d!110321 (= (map!12092 thiss!1181) (getCurrentListMap!2573 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun bs!24919 () Bool)

(assert (= bs!24919 d!110321))

(declare-fun m!828801 () Bool)

(assert (=> bs!24919 m!828801))

(assert (=> b!888935 d!110321))

(declare-fun b!889016 () Bool)

(declare-fun e!495386 () Bool)

(declare-fun e!495384 () Bool)

(assert (=> b!889016 (= e!495386 e!495384)))

(declare-fun c!94055 () Bool)

(assert (=> b!889016 (= c!94055 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889017 () Bool)

(declare-fun e!495383 () Bool)

(assert (=> b!889017 (= e!495383 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!889019 () Bool)

(declare-datatypes ((Unit!30240 0))(
  ( (Unit!30241) )
))
(declare-fun e!495385 () Unit!30240)

(declare-fun Unit!30242 () Unit!30240)

(assert (=> b!889019 (= e!495385 Unit!30242)))

(declare-fun b!889020 () Bool)

(assert (=> b!889020 (= e!495386 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39452 () Bool)

(declare-fun call!39456 () ListLongMap!10553)

(assert (=> bm!39452 (= call!39456 (getCurrentListMap!2573 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun b!889021 () Bool)

(declare-fun c!94054 () Bool)

(declare-datatypes ((SeekEntryResult!8717 0))(
  ( (MissingZero!8717 (index!37239 (_ BitVec 32))) (Found!8717 (index!37240 (_ BitVec 32))) (Intermediate!8717 (undefined!9529 Bool) (index!37241 (_ BitVec 32)) (x!75311 (_ BitVec 32))) (Undefined!8717) (MissingVacant!8717 (index!37242 (_ BitVec 32))) )
))
(declare-fun lt!401935 () SeekEntryResult!8717)

(assert (=> b!889021 (= c!94054 ((_ is Found!8717) lt!401935))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51769 (_ BitVec 32)) SeekEntryResult!8717)

(assert (=> b!889021 (= lt!401935 (seekEntry!0 key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun e!495382 () Bool)

(assert (=> b!889021 (= e!495384 e!495382)))

(declare-fun b!889022 () Bool)

(declare-fun call!39455 () Bool)

(assert (=> b!889022 (= e!495383 call!39455)))

(declare-fun bm!39453 () Bool)

(declare-fun arrayContainsKey!0 (array!51769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39453 (= call!39455 (arrayContainsKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!889023 () Bool)

(assert (=> b!889023 (= e!495382 false)))

(declare-fun c!94057 () Bool)

(declare-fun call!39457 () Bool)

(assert (=> b!889023 (= c!94057 call!39457)))

(declare-fun lt!401938 () Unit!30240)

(assert (=> b!889023 (= lt!401938 e!495385)))

(declare-fun b!889024 () Bool)

(assert (=> b!889024 false))

(declare-fun lt!401929 () Unit!30240)

(declare-fun lt!401931 () Unit!30240)

(assert (=> b!889024 (= lt!401929 lt!401931)))

(declare-fun lt!401943 () SeekEntryResult!8717)

(declare-fun lt!401936 () (_ BitVec 32))

(assert (=> b!889024 (and ((_ is Found!8717) lt!401943) (= (index!37240 lt!401943) lt!401936))))

(assert (=> b!889024 (= lt!401943 (seekEntry!0 key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51769 (_ BitVec 32)) Unit!30240)

(assert (=> b!889024 (= lt!401931 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun lt!401930 () Unit!30240)

(declare-fun lt!401942 () Unit!30240)

(assert (=> b!889024 (= lt!401930 lt!401942)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51769 (_ BitVec 32)) Bool)

(assert (=> b!889024 (arrayForallSeekEntryOrOpenFound!0 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30240)

(assert (=> b!889024 (= lt!401942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9863 thiss!1181) (mask!25613 thiss!1181) #b00000000000000000000000000000000 lt!401936))))

(declare-fun arrayScanForKey!0 (array!51769 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889024 (= lt!401936 (arrayScanForKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401941 () Unit!30240)

(declare-fun lt!401940 () Unit!30240)

(assert (=> b!889024 (= lt!401941 lt!401940)))

(assert (=> b!889024 e!495383))

(declare-fun c!94053 () Bool)

(assert (=> b!889024 (= c!94053 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!160 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 64) Int) Unit!30240)

(assert (=> b!889024 (= lt!401940 (lemmaKeyInListMapIsInArray!160 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)))))

(declare-fun Unit!30243 () Unit!30240)

(assert (=> b!889024 (= e!495385 Unit!30243)))

(declare-fun b!889025 () Bool)

(assert (=> b!889025 (= e!495384 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39454 () Bool)

(declare-fun contains!4296 (ListLongMap!10553 (_ BitVec 64)) Bool)

(assert (=> bm!39454 (= call!39457 (contains!4296 call!39456 (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785)))))

(declare-fun b!889018 () Bool)

(assert (=> b!889018 (= e!495382 true)))

(declare-fun lt!401932 () Unit!30240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51769 (_ BitVec 64) (_ BitVec 32)) Unit!30240)

(assert (=> b!889018 (= lt!401932 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9863 thiss!1181) key!785 (index!37240 lt!401935)))))

(assert (=> b!889018 call!39455))

(declare-fun lt!401934 () Unit!30240)

(assert (=> b!889018 (= lt!401934 lt!401932)))

(declare-fun lt!401939 () Unit!30240)

(declare-fun lemmaValidKeyInArrayIsInListMap!203 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) Unit!30240)

(assert (=> b!889018 (= lt!401939 (lemmaValidKeyInArrayIsInListMap!203 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37240 lt!401935) (defaultEntry!5158 thiss!1181)))))

(assert (=> b!889018 call!39457))

(declare-fun lt!401937 () Unit!30240)

(assert (=> b!889018 (= lt!401937 lt!401939)))

(declare-fun d!110323 () Bool)

(declare-fun lt!401933 () Bool)

(assert (=> d!110323 (= lt!401933 (contains!4296 (map!12092 thiss!1181) key!785))))

(assert (=> d!110323 (= lt!401933 e!495386)))

(declare-fun c!94056 () Bool)

(assert (=> d!110323 (= c!94056 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110323 (valid!1544 thiss!1181)))

(assert (=> d!110323 (= (contains!4294 thiss!1181 key!785) lt!401933)))

(assert (= (and d!110323 c!94056) b!889020))

(assert (= (and d!110323 (not c!94056)) b!889016))

(assert (= (and b!889016 c!94055) b!889025))

(assert (= (and b!889016 (not c!94055)) b!889021))

(assert (= (and b!889021 c!94054) b!889018))

(assert (= (and b!889021 (not c!94054)) b!889023))

(assert (= (and b!889023 c!94057) b!889024))

(assert (= (and b!889023 (not c!94057)) b!889019))

(assert (= (and b!889024 c!94053) b!889022))

(assert (= (and b!889024 (not c!94053)) b!889017))

(assert (= (or b!889018 b!889022) bm!39453))

(assert (= (or b!889018 b!889023) bm!39452))

(assert (= (or b!889018 b!889023) bm!39454))

(declare-fun m!828803 () Bool)

(assert (=> bm!39453 m!828803))

(assert (=> bm!39452 m!828801))

(declare-fun m!828805 () Bool)

(assert (=> b!889021 m!828805))

(assert (=> d!110323 m!828755))

(assert (=> d!110323 m!828755))

(declare-fun m!828807 () Bool)

(assert (=> d!110323 m!828807))

(assert (=> d!110323 m!828749))

(declare-fun m!828809 () Bool)

(assert (=> bm!39454 m!828809))

(declare-fun m!828811 () Bool)

(assert (=> bm!39454 m!828811))

(declare-fun m!828813 () Bool)

(assert (=> b!889018 m!828813))

(declare-fun m!828815 () Bool)

(assert (=> b!889018 m!828815))

(assert (=> b!889024 m!828805))

(declare-fun m!828817 () Bool)

(assert (=> b!889024 m!828817))

(declare-fun m!828819 () Bool)

(assert (=> b!889024 m!828819))

(declare-fun m!828821 () Bool)

(assert (=> b!889024 m!828821))

(declare-fun m!828823 () Bool)

(assert (=> b!889024 m!828823))

(declare-fun m!828825 () Bool)

(assert (=> b!889024 m!828825))

(assert (=> b!888936 d!110323))

(declare-fun d!110325 () Bool)

(declare-fun res!602618 () Bool)

(declare-fun e!495389 () Bool)

(assert (=> d!110325 (=> (not res!602618) (not e!495389))))

(declare-fun simpleValid!289 (LongMapFixedSize!3934) Bool)

(assert (=> d!110325 (= res!602618 (simpleValid!289 thiss!1181))))

(assert (=> d!110325 (= (valid!1544 thiss!1181) e!495389)))

(declare-fun b!889032 () Bool)

(declare-fun res!602619 () Bool)

(assert (=> b!889032 (=> (not res!602619) (not e!495389))))

(declare-fun arrayCountValidKeys!0 (array!51769 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889032 (= res!602619 (= (arrayCountValidKeys!0 (_keys!9863 thiss!1181) #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))) (_size!2022 thiss!1181)))))

(declare-fun b!889033 () Bool)

(declare-fun res!602620 () Bool)

(assert (=> b!889033 (=> (not res!602620) (not e!495389))))

(assert (=> b!889033 (= res!602620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun b!889034 () Bool)

(declare-datatypes ((List!17640 0))(
  ( (Nil!17637) (Cons!17636 (h!18773 (_ BitVec 64)) (t!24927 List!17640)) )
))
(declare-fun arrayNoDuplicates!0 (array!51769 (_ BitVec 32) List!17640) Bool)

(assert (=> b!889034 (= e!495389 (arrayNoDuplicates!0 (_keys!9863 thiss!1181) #b00000000000000000000000000000000 Nil!17637))))

(assert (= (and d!110325 res!602618) b!889032))

(assert (= (and b!889032 res!602619) b!889033))

(assert (= (and b!889033 res!602620) b!889034))

(declare-fun m!828827 () Bool)

(assert (=> d!110325 m!828827))

(declare-fun m!828829 () Bool)

(assert (=> b!889032 m!828829))

(declare-fun m!828831 () Bool)

(assert (=> b!889033 m!828831))

(declare-fun m!828833 () Bool)

(assert (=> b!889034 m!828833))

(assert (=> start!75606 d!110325))

(declare-fun b!889041 () Bool)

(declare-fun e!495394 () Bool)

(assert (=> b!889041 (= e!495394 tp_is_empty!17881)))

(declare-fun mapIsEmpty!28363 () Bool)

(declare-fun mapRes!28363 () Bool)

(assert (=> mapIsEmpty!28363 mapRes!28363))

(declare-fun condMapEmpty!28363 () Bool)

(declare-fun mapDefault!28363 () ValueCell!8459)

(assert (=> mapNonEmpty!28354 (= condMapEmpty!28363 (= mapRest!28354 ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28363)))))

(declare-fun e!495395 () Bool)

(assert (=> mapNonEmpty!28354 (= tp!54606 (and e!495395 mapRes!28363))))

(declare-fun mapNonEmpty!28363 () Bool)

(declare-fun tp!54622 () Bool)

(assert (=> mapNonEmpty!28363 (= mapRes!28363 (and tp!54622 e!495394))))

(declare-fun mapValue!28363 () ValueCell!8459)

(declare-fun mapRest!28363 () (Array (_ BitVec 32) ValueCell!8459))

(declare-fun mapKey!28363 () (_ BitVec 32))

(assert (=> mapNonEmpty!28363 (= mapRest!28354 (store mapRest!28363 mapKey!28363 mapValue!28363))))

(declare-fun b!889042 () Bool)

(assert (=> b!889042 (= e!495395 tp_is_empty!17881)))

(assert (= (and mapNonEmpty!28354 condMapEmpty!28363) mapIsEmpty!28363))

(assert (= (and mapNonEmpty!28354 (not condMapEmpty!28363)) mapNonEmpty!28363))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8459) mapValue!28363)) b!889041))

(assert (= (and mapNonEmpty!28354 ((_ is ValueCellFull!8459) mapDefault!28363)) b!889042))

(declare-fun m!828835 () Bool)

(assert (=> mapNonEmpty!28363 m!828835))

(check-sat (not bm!39452) tp_is_empty!17881 (not b!889024) (not b!889021) (not b_next!15553) (not b!889018) (not d!110325) (not b!889032) (not bm!39453) (not mapNonEmpty!28363) (not bm!39454) (not b!889034) (not d!110317) (not d!110321) (not d!110323) b_and!25799 (not b!888994) (not b!889033))
(check-sat b_and!25799 (not b_next!15553))
(get-model)

(declare-fun d!110327 () Bool)

(assert (=> d!110327 (arrayContainsKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!401946 () Unit!30240)

(declare-fun choose!13 (array!51769 (_ BitVec 64) (_ BitVec 32)) Unit!30240)

(assert (=> d!110327 (= lt!401946 (choose!13 (_keys!9863 thiss!1181) key!785 (index!37240 lt!401935)))))

(assert (=> d!110327 (bvsge (index!37240 lt!401935) #b00000000000000000000000000000000)))

(assert (=> d!110327 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9863 thiss!1181) key!785 (index!37240 lt!401935)) lt!401946)))

(declare-fun bs!24920 () Bool)

(assert (= bs!24920 d!110327))

(assert (=> bs!24920 m!828803))

(declare-fun m!828837 () Bool)

(assert (=> bs!24920 m!828837))

(assert (=> b!889018 d!110327))

(declare-fun d!110329 () Bool)

(declare-fun e!495398 () Bool)

(assert (=> d!110329 e!495398))

(declare-fun res!602623 () Bool)

(assert (=> d!110329 (=> (not res!602623) (not e!495398))))

(assert (=> d!110329 (= res!602623 (and (bvsge (index!37240 lt!401935) #b00000000000000000000000000000000) (bvslt (index!37240 lt!401935) (size!25333 (_keys!9863 thiss!1181)))))))

(declare-fun lt!401949 () Unit!30240)

(declare-fun choose!1462 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) Unit!30240)

(assert (=> d!110329 (= lt!401949 (choose!1462 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37240 lt!401935) (defaultEntry!5158 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110329 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110329 (= (lemmaValidKeyInArrayIsInListMap!203 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37240 lt!401935) (defaultEntry!5158 thiss!1181)) lt!401949)))

(declare-fun b!889045 () Bool)

(assert (=> b!889045 (= e!495398 (contains!4296 (getCurrentListMap!2573 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)) (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935))))))

(assert (= (and d!110329 res!602623) b!889045))

(declare-fun m!828839 () Bool)

(assert (=> d!110329 m!828839))

(declare-fun m!828841 () Bool)

(assert (=> d!110329 m!828841))

(assert (=> b!889045 m!828801))

(assert (=> b!889045 m!828809))

(assert (=> b!889045 m!828801))

(assert (=> b!889045 m!828809))

(declare-fun m!828843 () Bool)

(assert (=> b!889045 m!828843))

(assert (=> b!889018 d!110329))

(declare-fun d!110331 () Bool)

(declare-fun e!495404 () Bool)

(assert (=> d!110331 e!495404))

(declare-fun res!602626 () Bool)

(assert (=> d!110331 (=> res!602626 e!495404)))

(declare-fun lt!401961 () Bool)

(assert (=> d!110331 (= res!602626 (not lt!401961))))

(declare-fun lt!401958 () Bool)

(assert (=> d!110331 (= lt!401961 lt!401958)))

(declare-fun lt!401959 () Unit!30240)

(declare-fun e!495403 () Unit!30240)

(assert (=> d!110331 (= lt!401959 e!495403)))

(declare-fun c!94060 () Bool)

(assert (=> d!110331 (= c!94060 lt!401958)))

(declare-fun containsKey!421 (List!17639 (_ BitVec 64)) Bool)

(assert (=> d!110331 (= lt!401958 (containsKey!421 (toList!5292 (map!12092 thiss!1181)) key!785))))

(assert (=> d!110331 (= (contains!4296 (map!12092 thiss!1181) key!785) lt!401961)))

(declare-fun b!889052 () Bool)

(declare-fun lt!401960 () Unit!30240)

(assert (=> b!889052 (= e!495403 lt!401960)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!315 (List!17639 (_ BitVec 64)) Unit!30240)

(assert (=> b!889052 (= lt!401960 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5292 (map!12092 thiss!1181)) key!785))))

(assert (=> b!889052 (isDefined!317 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785))))

(declare-fun b!889053 () Bool)

(declare-fun Unit!30244 () Unit!30240)

(assert (=> b!889053 (= e!495403 Unit!30244)))

(declare-fun b!889054 () Bool)

(assert (=> b!889054 (= e!495404 (isDefined!317 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785)))))

(assert (= (and d!110331 c!94060) b!889052))

(assert (= (and d!110331 (not c!94060)) b!889053))

(assert (= (and d!110331 (not res!602626)) b!889054))

(declare-fun m!828845 () Bool)

(assert (=> d!110331 m!828845))

(declare-fun m!828847 () Bool)

(assert (=> b!889052 m!828847))

(assert (=> b!889052 m!828757))

(assert (=> b!889052 m!828757))

(assert (=> b!889052 m!828759))

(assert (=> b!889054 m!828757))

(assert (=> b!889054 m!828757))

(assert (=> b!889054 m!828759))

(assert (=> d!110323 d!110331))

(assert (=> d!110323 d!110321))

(assert (=> d!110323 d!110325))

(declare-fun bm!39469 () Bool)

(declare-fun call!39478 () ListLongMap!10553)

(declare-fun call!39472 () ListLongMap!10553)

(assert (=> bm!39469 (= call!39478 call!39472)))

(declare-fun b!889097 () Bool)

(declare-fun res!602646 () Bool)

(declare-fun e!495440 () Bool)

(assert (=> b!889097 (=> (not res!602646) (not e!495440))))

(declare-fun e!495437 () Bool)

(assert (=> b!889097 (= res!602646 e!495437)))

(declare-fun res!602647 () Bool)

(assert (=> b!889097 (=> res!602647 e!495437)))

(declare-fun e!495439 () Bool)

(assert (=> b!889097 (= res!602647 (not e!495439))))

(declare-fun res!602651 () Bool)

(assert (=> b!889097 (=> (not res!602651) (not e!495439))))

(assert (=> b!889097 (= res!602651 (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(declare-fun b!889098 () Bool)

(declare-fun e!495441 () ListLongMap!10553)

(declare-fun e!495433 () ListLongMap!10553)

(assert (=> b!889098 (= e!495441 e!495433)))

(declare-fun c!94074 () Bool)

(assert (=> b!889098 (= c!94074 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!889099 () Bool)

(declare-fun e!495443 () Bool)

(assert (=> b!889099 (= e!495440 e!495443)))

(declare-fun c!94073 () Bool)

(assert (=> b!889099 (= c!94073 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39470 () Bool)

(declare-fun call!39476 () ListLongMap!10553)

(declare-fun call!39477 () ListLongMap!10553)

(assert (=> bm!39470 (= call!39476 call!39477)))

(declare-fun bm!39471 () Bool)

(declare-fun call!39473 () Bool)

(declare-fun lt!402018 () ListLongMap!10553)

(assert (=> bm!39471 (= call!39473 (contains!4296 lt!402018 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889100 () Bool)

(declare-fun e!495436 () ListLongMap!10553)

(assert (=> b!889100 (= e!495436 call!39478)))

(declare-fun b!889101 () Bool)

(declare-fun +!2595 (ListLongMap!10553 tuple2!11854) ListLongMap!10553)

(assert (=> b!889101 (= e!495441 (+!2595 call!39477 (tuple2!11855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4956 thiss!1181))))))

(declare-fun c!94076 () Bool)

(declare-fun bm!39472 () Bool)

(declare-fun call!39474 () ListLongMap!10553)

(assert (=> bm!39472 (= call!39477 (+!2595 (ite c!94076 call!39474 (ite c!94074 call!39472 call!39478)) (ite (or c!94076 c!94074) (tuple2!11855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4956 thiss!1181)) (tuple2!11855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4956 thiss!1181)))))))

(declare-fun b!889102 () Bool)

(declare-fun e!495438 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!889102 (= e!495438 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889103 () Bool)

(declare-fun c!94078 () Bool)

(assert (=> b!889103 (= c!94078 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!889103 (= e!495433 e!495436)))

(declare-fun b!889104 () Bool)

(assert (=> b!889104 (= e!495436 call!39476)))

(declare-fun b!889105 () Bool)

(declare-fun e!495442 () Bool)

(declare-fun apply!395 (ListLongMap!10553 (_ BitVec 64)) V!28807)

(assert (=> b!889105 (= e!495442 (= (apply!395 lt!402018 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4956 thiss!1181)))))

(declare-fun bm!39473 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3316 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) ListLongMap!10553)

(assert (=> bm!39473 (= call!39474 (getCurrentListMapNoExtraKeys!3316 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun b!889106 () Bool)

(declare-fun e!495432 () Bool)

(assert (=> b!889106 (= e!495437 e!495432)))

(declare-fun res!602648 () Bool)

(assert (=> b!889106 (=> (not res!602648) (not e!495432))))

(assert (=> b!889106 (= res!602648 (contains!4296 lt!402018 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!889106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(declare-fun b!889107 () Bool)

(declare-fun e!495434 () Bool)

(declare-fun e!495435 () Bool)

(assert (=> b!889107 (= e!495434 e!495435)))

(declare-fun res!602645 () Bool)

(declare-fun call!39475 () Bool)

(assert (=> b!889107 (= res!602645 call!39475)))

(assert (=> b!889107 (=> (not res!602645) (not e!495435))))

(declare-fun b!889108 () Bool)

(assert (=> b!889108 (= e!495443 e!495442)))

(declare-fun res!602653 () Bool)

(assert (=> b!889108 (= res!602653 call!39473)))

(assert (=> b!889108 (=> (not res!602653) (not e!495442))))

(declare-fun b!889109 () Bool)

(declare-fun get!13163 (ValueCell!8459 V!28807) V!28807)

(declare-fun dynLambda!1304 (Int (_ BitVec 64)) V!28807)

(assert (=> b!889109 (= e!495432 (= (apply!395 lt!402018 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)) (get!13163 (select (arr!24893 (_values!5143 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5158 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!889109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25334 (_values!5143 thiss!1181))))))

(assert (=> b!889109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(declare-fun d!110333 () Bool)

(assert (=> d!110333 e!495440))

(declare-fun res!602650 () Bool)

(assert (=> d!110333 (=> (not res!602650) (not e!495440))))

(assert (=> d!110333 (= res!602650 (or (bvsge #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))))

(declare-fun lt!402011 () ListLongMap!10553)

(assert (=> d!110333 (= lt!402018 lt!402011)))

(declare-fun lt!402019 () Unit!30240)

(declare-fun e!495431 () Unit!30240)

(assert (=> d!110333 (= lt!402019 e!495431)))

(declare-fun c!94077 () Bool)

(assert (=> d!110333 (= c!94077 e!495438)))

(declare-fun res!602649 () Bool)

(assert (=> d!110333 (=> (not res!602649) (not e!495438))))

(assert (=> d!110333 (= res!602649 (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110333 (= lt!402011 e!495441)))

(assert (=> d!110333 (= c!94076 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110333 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110333 (= (getCurrentListMap!2573 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)) lt!402018)))

(declare-fun b!889110 () Bool)

(assert (=> b!889110 (= e!495439 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889111 () Bool)

(assert (=> b!889111 (= e!495435 (= (apply!395 lt!402018 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4956 thiss!1181)))))

(declare-fun b!889112 () Bool)

(assert (=> b!889112 (= e!495434 (not call!39475))))

(declare-fun b!889113 () Bool)

(declare-fun Unit!30245 () Unit!30240)

(assert (=> b!889113 (= e!495431 Unit!30245)))

(declare-fun bm!39474 () Bool)

(assert (=> bm!39474 (= call!39475 (contains!4296 lt!402018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889114 () Bool)

(assert (=> b!889114 (= e!495443 (not call!39473))))

(declare-fun b!889115 () Bool)

(assert (=> b!889115 (= e!495433 call!39476)))

(declare-fun b!889116 () Bool)

(declare-fun lt!402020 () Unit!30240)

(assert (=> b!889116 (= e!495431 lt!402020)))

(declare-fun lt!402017 () ListLongMap!10553)

(assert (=> b!889116 (= lt!402017 (getCurrentListMapNoExtraKeys!3316 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!402026 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402014 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402014 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402009 () Unit!30240)

(declare-fun addStillContains!326 (ListLongMap!10553 (_ BitVec 64) V!28807 (_ BitVec 64)) Unit!30240)

(assert (=> b!889116 (= lt!402009 (addStillContains!326 lt!402017 lt!402026 (zeroValue!4956 thiss!1181) lt!402014))))

(assert (=> b!889116 (contains!4296 (+!2595 lt!402017 (tuple2!11855 lt!402026 (zeroValue!4956 thiss!1181))) lt!402014)))

(declare-fun lt!402012 () Unit!30240)

(assert (=> b!889116 (= lt!402012 lt!402009)))

(declare-fun lt!402025 () ListLongMap!10553)

(assert (=> b!889116 (= lt!402025 (getCurrentListMapNoExtraKeys!3316 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!402024 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402021 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402021 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402022 () Unit!30240)

(declare-fun addApplyDifferent!326 (ListLongMap!10553 (_ BitVec 64) V!28807 (_ BitVec 64)) Unit!30240)

(assert (=> b!889116 (= lt!402022 (addApplyDifferent!326 lt!402025 lt!402024 (minValue!4956 thiss!1181) lt!402021))))

(assert (=> b!889116 (= (apply!395 (+!2595 lt!402025 (tuple2!11855 lt!402024 (minValue!4956 thiss!1181))) lt!402021) (apply!395 lt!402025 lt!402021))))

(declare-fun lt!402007 () Unit!30240)

(assert (=> b!889116 (= lt!402007 lt!402022)))

(declare-fun lt!402016 () ListLongMap!10553)

(assert (=> b!889116 (= lt!402016 (getCurrentListMapNoExtraKeys!3316 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!402015 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402023 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402023 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402010 () Unit!30240)

(assert (=> b!889116 (= lt!402010 (addApplyDifferent!326 lt!402016 lt!402015 (zeroValue!4956 thiss!1181) lt!402023))))

(assert (=> b!889116 (= (apply!395 (+!2595 lt!402016 (tuple2!11855 lt!402015 (zeroValue!4956 thiss!1181))) lt!402023) (apply!395 lt!402016 lt!402023))))

(declare-fun lt!402027 () Unit!30240)

(assert (=> b!889116 (= lt!402027 lt!402010)))

(declare-fun lt!402006 () ListLongMap!10553)

(assert (=> b!889116 (= lt!402006 (getCurrentListMapNoExtraKeys!3316 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!402013 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402008 () (_ BitVec 64))

(assert (=> b!889116 (= lt!402008 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889116 (= lt!402020 (addApplyDifferent!326 lt!402006 lt!402013 (minValue!4956 thiss!1181) lt!402008))))

(assert (=> b!889116 (= (apply!395 (+!2595 lt!402006 (tuple2!11855 lt!402013 (minValue!4956 thiss!1181))) lt!402008) (apply!395 lt!402006 lt!402008))))

(declare-fun b!889117 () Bool)

(declare-fun res!602652 () Bool)

(assert (=> b!889117 (=> (not res!602652) (not e!495440))))

(assert (=> b!889117 (= res!602652 e!495434)))

(declare-fun c!94075 () Bool)

(assert (=> b!889117 (= c!94075 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39475 () Bool)

(assert (=> bm!39475 (= call!39472 call!39474)))

(assert (= (and d!110333 c!94076) b!889101))

(assert (= (and d!110333 (not c!94076)) b!889098))

(assert (= (and b!889098 c!94074) b!889115))

(assert (= (and b!889098 (not c!94074)) b!889103))

(assert (= (and b!889103 c!94078) b!889104))

(assert (= (and b!889103 (not c!94078)) b!889100))

(assert (= (or b!889104 b!889100) bm!39469))

(assert (= (or b!889115 bm!39469) bm!39475))

(assert (= (or b!889115 b!889104) bm!39470))

(assert (= (or b!889101 bm!39475) bm!39473))

(assert (= (or b!889101 bm!39470) bm!39472))

(assert (= (and d!110333 res!602649) b!889102))

(assert (= (and d!110333 c!94077) b!889116))

(assert (= (and d!110333 (not c!94077)) b!889113))

(assert (= (and d!110333 res!602650) b!889097))

(assert (= (and b!889097 res!602651) b!889110))

(assert (= (and b!889097 (not res!602647)) b!889106))

(assert (= (and b!889106 res!602648) b!889109))

(assert (= (and b!889097 res!602646) b!889117))

(assert (= (and b!889117 c!94075) b!889107))

(assert (= (and b!889117 (not c!94075)) b!889112))

(assert (= (and b!889107 res!602645) b!889111))

(assert (= (or b!889107 b!889112) bm!39474))

(assert (= (and b!889117 res!602652) b!889099))

(assert (= (and b!889099 c!94073) b!889108))

(assert (= (and b!889099 (not c!94073)) b!889114))

(assert (= (and b!889108 res!602653) b!889105))

(assert (= (or b!889108 b!889114) bm!39471))

(declare-fun b_lambda!12889 () Bool)

(assert (=> (not b_lambda!12889) (not b!889109)))

(declare-fun t!24929 () Bool)

(declare-fun tb!5139 () Bool)

(assert (=> (and b!888938 (= (defaultEntry!5158 thiss!1181) (defaultEntry!5158 thiss!1181)) t!24929) tb!5139))

(declare-fun result!9987 () Bool)

(assert (=> tb!5139 (= result!9987 tp_is_empty!17881)))

(assert (=> b!889109 t!24929))

(declare-fun b_and!25805 () Bool)

(assert (= b_and!25799 (and (=> t!24929 result!9987) b_and!25805)))

(declare-fun m!828849 () Bool)

(assert (=> b!889116 m!828849))

(declare-fun m!828851 () Bool)

(assert (=> b!889116 m!828851))

(declare-fun m!828853 () Bool)

(assert (=> b!889116 m!828853))

(declare-fun m!828855 () Bool)

(assert (=> b!889116 m!828855))

(declare-fun m!828857 () Bool)

(assert (=> b!889116 m!828857))

(declare-fun m!828859 () Bool)

(assert (=> b!889116 m!828859))

(declare-fun m!828861 () Bool)

(assert (=> b!889116 m!828861))

(declare-fun m!828863 () Bool)

(assert (=> b!889116 m!828863))

(assert (=> b!889116 m!828855))

(declare-fun m!828865 () Bool)

(assert (=> b!889116 m!828865))

(declare-fun m!828867 () Bool)

(assert (=> b!889116 m!828867))

(declare-fun m!828869 () Bool)

(assert (=> b!889116 m!828869))

(assert (=> b!889116 m!828849))

(declare-fun m!828871 () Bool)

(assert (=> b!889116 m!828871))

(declare-fun m!828873 () Bool)

(assert (=> b!889116 m!828873))

(declare-fun m!828875 () Bool)

(assert (=> b!889116 m!828875))

(declare-fun m!828877 () Bool)

(assert (=> b!889116 m!828877))

(assert (=> b!889116 m!828867))

(declare-fun m!828879 () Bool)

(assert (=> b!889116 m!828879))

(assert (=> b!889116 m!828859))

(declare-fun m!828881 () Bool)

(assert (=> b!889116 m!828881))

(assert (=> b!889110 m!828879))

(assert (=> b!889110 m!828879))

(declare-fun m!828883 () Bool)

(assert (=> b!889110 m!828883))

(assert (=> d!110333 m!828841))

(assert (=> b!889109 m!828879))

(declare-fun m!828885 () Bool)

(assert (=> b!889109 m!828885))

(declare-fun m!828887 () Bool)

(assert (=> b!889109 m!828887))

(declare-fun m!828889 () Bool)

(assert (=> b!889109 m!828889))

(assert (=> b!889109 m!828887))

(assert (=> b!889109 m!828889))

(declare-fun m!828891 () Bool)

(assert (=> b!889109 m!828891))

(assert (=> b!889109 m!828879))

(assert (=> b!889106 m!828879))

(assert (=> b!889106 m!828879))

(declare-fun m!828893 () Bool)

(assert (=> b!889106 m!828893))

(assert (=> bm!39473 m!828851))

(declare-fun m!828895 () Bool)

(assert (=> b!889111 m!828895))

(declare-fun m!828897 () Bool)

(assert (=> b!889105 m!828897))

(declare-fun m!828899 () Bool)

(assert (=> bm!39471 m!828899))

(declare-fun m!828901 () Bool)

(assert (=> bm!39474 m!828901))

(assert (=> b!889102 m!828879))

(assert (=> b!889102 m!828879))

(assert (=> b!889102 m!828883))

(declare-fun m!828903 () Bool)

(assert (=> bm!39472 m!828903))

(declare-fun m!828905 () Bool)

(assert (=> b!889101 m!828905))

(assert (=> bm!39452 d!110333))

(assert (=> d!110321 d!110333))

(declare-fun b!889128 () Bool)

(declare-fun e!495449 () (_ BitVec 32))

(assert (=> b!889128 (= e!495449 #b00000000000000000000000000000000)))

(declare-fun bm!39478 () Bool)

(declare-fun call!39481 () (_ BitVec 32))

(assert (=> bm!39478 (= call!39481 (arrayCountValidKeys!0 (_keys!9863 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25333 (_keys!9863 thiss!1181))))))

(declare-fun b!889129 () Bool)

(declare-fun e!495448 () (_ BitVec 32))

(assert (=> b!889129 (= e!495448 (bvadd #b00000000000000000000000000000001 call!39481))))

(declare-fun d!110335 () Bool)

(declare-fun lt!402030 () (_ BitVec 32))

(assert (=> d!110335 (and (bvsge lt!402030 #b00000000000000000000000000000000) (bvsle lt!402030 (bvsub (size!25333 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110335 (= lt!402030 e!495449)))

(declare-fun c!94083 () Bool)

(assert (=> d!110335 (= c!94083 (bvsge #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110335 (and (bvsle #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25333 (_keys!9863 thiss!1181)) (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110335 (= (arrayCountValidKeys!0 (_keys!9863 thiss!1181) #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))) lt!402030)))

(declare-fun b!889130 () Bool)

(assert (=> b!889130 (= e!495449 e!495448)))

(declare-fun c!94084 () Bool)

(assert (=> b!889130 (= c!94084 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889131 () Bool)

(assert (=> b!889131 (= e!495448 call!39481)))

(assert (= (and d!110335 c!94083) b!889128))

(assert (= (and d!110335 (not c!94083)) b!889130))

(assert (= (and b!889130 c!94084) b!889129))

(assert (= (and b!889130 (not c!94084)) b!889131))

(assert (= (or b!889129 b!889131) bm!39478))

(declare-fun m!828907 () Bool)

(assert (=> bm!39478 m!828907))

(assert (=> b!889130 m!828879))

(assert (=> b!889130 m!828879))

(assert (=> b!889130 m!828883))

(assert (=> b!889032 d!110335))

(declare-fun b!889142 () Bool)

(declare-fun res!602663 () Bool)

(declare-fun e!495452 () Bool)

(assert (=> b!889142 (=> (not res!602663) (not e!495452))))

(declare-fun size!25339 (LongMapFixedSize!3934) (_ BitVec 32))

(assert (=> b!889142 (= res!602663 (= (size!25339 thiss!1181) (bvadd (_size!2022 thiss!1181) (bvsdiv (bvadd (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!889143 () Bool)

(assert (=> b!889143 (= e!495452 (and (bvsge (extraKeys!4852 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4852 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2022 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!889140 () Bool)

(declare-fun res!602665 () Bool)

(assert (=> b!889140 (=> (not res!602665) (not e!495452))))

(assert (=> b!889140 (= res!602665 (and (= (size!25334 (_values!5143 thiss!1181)) (bvadd (mask!25613 thiss!1181) #b00000000000000000000000000000001)) (= (size!25333 (_keys!9863 thiss!1181)) (size!25334 (_values!5143 thiss!1181))) (bvsge (_size!2022 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2022 thiss!1181) (bvadd (mask!25613 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!889141 () Bool)

(declare-fun res!602664 () Bool)

(assert (=> b!889141 (=> (not res!602664) (not e!495452))))

(assert (=> b!889141 (= res!602664 (bvsge (size!25339 thiss!1181) (_size!2022 thiss!1181)))))

(declare-fun d!110337 () Bool)

(declare-fun res!602662 () Bool)

(assert (=> d!110337 (=> (not res!602662) (not e!495452))))

(assert (=> d!110337 (= res!602662 (validMask!0 (mask!25613 thiss!1181)))))

(assert (=> d!110337 (= (simpleValid!289 thiss!1181) e!495452)))

(assert (= (and d!110337 res!602662) b!889140))

(assert (= (and b!889140 res!602665) b!889141))

(assert (= (and b!889141 res!602664) b!889142))

(assert (= (and b!889142 res!602663) b!889143))

(declare-fun m!828909 () Bool)

(assert (=> b!889142 m!828909))

(assert (=> b!889141 m!828909))

(assert (=> d!110337 m!828841))

(assert (=> d!110325 d!110337))

(declare-fun b!889156 () Bool)

(declare-fun e!495459 () SeekEntryResult!8717)

(declare-fun lt!402041 () SeekEntryResult!8717)

(assert (=> b!889156 (= e!495459 (Found!8717 (index!37241 lt!402041)))))

(declare-fun b!889157 () Bool)

(declare-fun e!495461 () SeekEntryResult!8717)

(declare-fun lt!402042 () SeekEntryResult!8717)

(assert (=> b!889157 (= e!495461 (ite ((_ is MissingVacant!8717) lt!402042) (MissingZero!8717 (index!37242 lt!402042)) lt!402042))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51769 (_ BitVec 32)) SeekEntryResult!8717)

(assert (=> b!889157 (= lt!402042 (seekKeyOrZeroReturnVacant!0 (x!75311 lt!402041) (index!37241 lt!402041) (index!37241 lt!402041) key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun b!889158 () Bool)

(declare-fun c!94091 () Bool)

(declare-fun lt!402039 () (_ BitVec 64))

(assert (=> b!889158 (= c!94091 (= lt!402039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!889158 (= e!495459 e!495461)))

(declare-fun b!889159 () Bool)

(assert (=> b!889159 (= e!495461 (MissingZero!8717 (index!37241 lt!402041)))))

(declare-fun b!889160 () Bool)

(declare-fun e!495460 () SeekEntryResult!8717)

(assert (=> b!889160 (= e!495460 e!495459)))

(assert (=> b!889160 (= lt!402039 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37241 lt!402041)))))

(declare-fun c!94092 () Bool)

(assert (=> b!889160 (= c!94092 (= lt!402039 key!785))))

(declare-fun d!110339 () Bool)

(declare-fun lt!402040 () SeekEntryResult!8717)

(assert (=> d!110339 (and (or ((_ is MissingVacant!8717) lt!402040) (not ((_ is Found!8717) lt!402040)) (and (bvsge (index!37240 lt!402040) #b00000000000000000000000000000000) (bvslt (index!37240 lt!402040) (size!25333 (_keys!9863 thiss!1181))))) (not ((_ is MissingVacant!8717) lt!402040)) (or (not ((_ is Found!8717) lt!402040)) (= (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!402040)) key!785)))))

(assert (=> d!110339 (= lt!402040 e!495460)))

(declare-fun c!94093 () Bool)

(assert (=> d!110339 (= c!94093 (and ((_ is Intermediate!8717) lt!402041) (undefined!9529 lt!402041)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51769 (_ BitVec 32)) SeekEntryResult!8717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110339 (= lt!402041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25613 thiss!1181)) key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(assert (=> d!110339 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110339 (= (seekEntry!0 key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) lt!402040)))

(declare-fun b!889161 () Bool)

(assert (=> b!889161 (= e!495460 Undefined!8717)))

(assert (= (and d!110339 c!94093) b!889161))

(assert (= (and d!110339 (not c!94093)) b!889160))

(assert (= (and b!889160 c!94092) b!889156))

(assert (= (and b!889160 (not c!94092)) b!889158))

(assert (= (and b!889158 c!94091) b!889159))

(assert (= (and b!889158 (not c!94091)) b!889157))

(declare-fun m!828911 () Bool)

(assert (=> b!889157 m!828911))

(declare-fun m!828913 () Bool)

(assert (=> b!889160 m!828913))

(declare-fun m!828915 () Bool)

(assert (=> d!110339 m!828915))

(declare-fun m!828917 () Bool)

(assert (=> d!110339 m!828917))

(assert (=> d!110339 m!828917))

(declare-fun m!828919 () Bool)

(assert (=> d!110339 m!828919))

(assert (=> d!110339 m!828841))

(assert (=> b!889021 d!110339))

(declare-fun d!110341 () Bool)

(declare-fun res!602670 () Bool)

(declare-fun e!495466 () Bool)

(assert (=> d!110341 (=> res!602670 e!495466)))

(assert (=> d!110341 (= res!602670 (= (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110341 (= (arrayContainsKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000) e!495466)))

(declare-fun b!889166 () Bool)

(declare-fun e!495467 () Bool)

(assert (=> b!889166 (= e!495466 e!495467)))

(declare-fun res!602671 () Bool)

(assert (=> b!889166 (=> (not res!602671) (not e!495467))))

(assert (=> b!889166 (= res!602671 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25333 (_keys!9863 thiss!1181))))))

(declare-fun b!889167 () Bool)

(assert (=> b!889167 (= e!495467 (arrayContainsKey!0 (_keys!9863 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110341 (not res!602670)) b!889166))

(assert (= (and b!889166 res!602671) b!889167))

(assert (=> d!110341 m!828879))

(declare-fun m!828921 () Bool)

(assert (=> b!889167 m!828921))

(assert (=> bm!39453 d!110341))

(declare-fun bm!39481 () Bool)

(declare-fun call!39484 () Bool)

(assert (=> bm!39481 (= call!39484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun b!889176 () Bool)

(declare-fun e!495476 () Bool)

(declare-fun e!495475 () Bool)

(assert (=> b!889176 (= e!495476 e!495475)))

(declare-fun c!94096 () Bool)

(assert (=> b!889176 (= c!94096 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889177 () Bool)

(assert (=> b!889177 (= e!495475 call!39484)))

(declare-fun b!889178 () Bool)

(declare-fun e!495474 () Bool)

(assert (=> b!889178 (= e!495474 call!39484)))

(declare-fun b!889179 () Bool)

(assert (=> b!889179 (= e!495475 e!495474)))

(declare-fun lt!402050 () (_ BitVec 64))

(assert (=> b!889179 (= lt!402050 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402051 () Unit!30240)

(assert (=> b!889179 (= lt!402051 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9863 thiss!1181) lt!402050 #b00000000000000000000000000000000))))

(assert (=> b!889179 (arrayContainsKey!0 (_keys!9863 thiss!1181) lt!402050 #b00000000000000000000000000000000)))

(declare-fun lt!402049 () Unit!30240)

(assert (=> b!889179 (= lt!402049 lt!402051)))

(declare-fun res!602676 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51769 (_ BitVec 32)) SeekEntryResult!8717)

(assert (=> b!889179 (= res!602676 (= (seekEntryOrOpen!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000) (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) (Found!8717 #b00000000000000000000000000000000)))))

(assert (=> b!889179 (=> (not res!602676) (not e!495474))))

(declare-fun d!110343 () Bool)

(declare-fun res!602677 () Bool)

(assert (=> d!110343 (=> res!602677 e!495476)))

(assert (=> d!110343 (= res!602677 (bvsge #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) e!495476)))

(assert (= (and d!110343 (not res!602677)) b!889176))

(assert (= (and b!889176 c!94096) b!889179))

(assert (= (and b!889176 (not c!94096)) b!889177))

(assert (= (and b!889179 res!602676) b!889178))

(assert (= (or b!889178 b!889177) bm!39481))

(declare-fun m!828923 () Bool)

(assert (=> bm!39481 m!828923))

(assert (=> b!889176 m!828879))

(assert (=> b!889176 m!828879))

(assert (=> b!889176 m!828883))

(assert (=> b!889179 m!828879))

(declare-fun m!828925 () Bool)

(assert (=> b!889179 m!828925))

(declare-fun m!828927 () Bool)

(assert (=> b!889179 m!828927))

(assert (=> b!889179 m!828879))

(declare-fun m!828929 () Bool)

(assert (=> b!889179 m!828929))

(assert (=> b!889033 d!110343))

(declare-fun d!110345 () Bool)

(assert (=> d!110345 (= (isEmpty!681 (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785)) (not ((_ is Some!442) (getValueByKey!437 (toList!5292 (map!12092 thiss!1181)) key!785))))))

(assert (=> d!110317 d!110345))

(declare-fun b!889190 () Bool)

(declare-fun e!495486 () Bool)

(declare-fun contains!4297 (List!17640 (_ BitVec 64)) Bool)

(assert (=> b!889190 (= e!495486 (contains!4297 Nil!17637 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889191 () Bool)

(declare-fun e!495488 () Bool)

(declare-fun call!39487 () Bool)

(assert (=> b!889191 (= e!495488 call!39487)))

(declare-fun d!110347 () Bool)

(declare-fun res!602686 () Bool)

(declare-fun e!495487 () Bool)

(assert (=> d!110347 (=> res!602686 e!495487)))

(assert (=> d!110347 (= res!602686 (bvsge #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110347 (= (arrayNoDuplicates!0 (_keys!9863 thiss!1181) #b00000000000000000000000000000000 Nil!17637) e!495487)))

(declare-fun bm!39484 () Bool)

(declare-fun c!94099 () Bool)

(assert (=> bm!39484 (= call!39487 (arrayNoDuplicates!0 (_keys!9863 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94099 (Cons!17636 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000) Nil!17637) Nil!17637)))))

(declare-fun b!889192 () Bool)

(declare-fun e!495485 () Bool)

(assert (=> b!889192 (= e!495485 e!495488)))

(assert (=> b!889192 (= c!94099 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889193 () Bool)

(assert (=> b!889193 (= e!495488 call!39487)))

(declare-fun b!889194 () Bool)

(assert (=> b!889194 (= e!495487 e!495485)))

(declare-fun res!602684 () Bool)

(assert (=> b!889194 (=> (not res!602684) (not e!495485))))

(assert (=> b!889194 (= res!602684 (not e!495486))))

(declare-fun res!602685 () Bool)

(assert (=> b!889194 (=> (not res!602685) (not e!495486))))

(assert (=> b!889194 (= res!602685 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110347 (not res!602686)) b!889194))

(assert (= (and b!889194 res!602685) b!889190))

(assert (= (and b!889194 res!602684) b!889192))

(assert (= (and b!889192 c!94099) b!889191))

(assert (= (and b!889192 (not c!94099)) b!889193))

(assert (= (or b!889191 b!889193) bm!39484))

(assert (=> b!889190 m!828879))

(assert (=> b!889190 m!828879))

(declare-fun m!828931 () Bool)

(assert (=> b!889190 m!828931))

(assert (=> bm!39484 m!828879))

(declare-fun m!828933 () Bool)

(assert (=> bm!39484 m!828933))

(assert (=> b!889192 m!828879))

(assert (=> b!889192 m!828879))

(assert (=> b!889192 m!828883))

(assert (=> b!889194 m!828879))

(assert (=> b!889194 m!828879))

(assert (=> b!889194 m!828883))

(assert (=> b!889034 d!110347))

(declare-fun b!889197 () Bool)

(declare-fun e!495490 () Option!443)

(assert (=> b!889197 (= e!495490 (getValueByKey!437 (t!24926 (t!24926 (toList!5292 (map!12092 thiss!1181)))) key!785))))

(declare-fun b!889196 () Bool)

(declare-fun e!495489 () Option!443)

(assert (=> b!889196 (= e!495489 e!495490)))

(declare-fun c!94101 () Bool)

(assert (=> b!889196 (= c!94101 (and ((_ is Cons!17635) (t!24926 (toList!5292 (map!12092 thiss!1181)))) (not (= (_1!5938 (h!18772 (t!24926 (toList!5292 (map!12092 thiss!1181))))) key!785))))))

(declare-fun b!889198 () Bool)

(assert (=> b!889198 (= e!495490 None!441)))

(declare-fun d!110349 () Bool)

(declare-fun c!94100 () Bool)

(assert (=> d!110349 (= c!94100 (and ((_ is Cons!17635) (t!24926 (toList!5292 (map!12092 thiss!1181)))) (= (_1!5938 (h!18772 (t!24926 (toList!5292 (map!12092 thiss!1181))))) key!785)))))

(assert (=> d!110349 (= (getValueByKey!437 (t!24926 (toList!5292 (map!12092 thiss!1181))) key!785) e!495489)))

(declare-fun b!889195 () Bool)

(assert (=> b!889195 (= e!495489 (Some!442 (_2!5938 (h!18772 (t!24926 (toList!5292 (map!12092 thiss!1181)))))))))

(assert (= (and d!110349 c!94100) b!889195))

(assert (= (and d!110349 (not c!94100)) b!889196))

(assert (= (and b!889196 c!94101) b!889197))

(assert (= (and b!889196 (not c!94101)) b!889198))

(declare-fun m!828935 () Bool)

(assert (=> b!889197 m!828935))

(assert (=> b!888994 d!110349))

(declare-fun d!110351 () Bool)

(declare-fun e!495493 () Bool)

(assert (=> d!110351 e!495493))

(declare-fun c!94104 () Bool)

(assert (=> d!110351 (= c!94104 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402054 () Unit!30240)

(declare-fun choose!1463 (array!51769 array!51771 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 64) Int) Unit!30240)

(assert (=> d!110351 (= lt!402054 (choose!1463 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)))))

(assert (=> d!110351 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110351 (= (lemmaKeyInListMapIsInArray!160 (_keys!9863 thiss!1181) (_values!5143 thiss!1181) (mask!25613 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)) lt!402054)))

(declare-fun b!889203 () Bool)

(assert (=> b!889203 (= e!495493 (arrayContainsKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!889204 () Bool)

(assert (=> b!889204 (= e!495493 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110351 c!94104) b!889203))

(assert (= (and d!110351 (not c!94104)) b!889204))

(declare-fun m!828937 () Bool)

(assert (=> d!110351 m!828937))

(assert (=> d!110351 m!828841))

(assert (=> b!889203 m!828803))

(assert (=> b!889024 d!110351))

(declare-fun d!110353 () Bool)

(assert (=> d!110353 (arrayForallSeekEntryOrOpenFound!0 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181))))

(declare-fun lt!402057 () Unit!30240)

(declare-fun choose!38 (array!51769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30240)

(assert (=> d!110353 (= lt!402057 (choose!38 (_keys!9863 thiss!1181) (mask!25613 thiss!1181) #b00000000000000000000000000000000 lt!401936))))

(assert (=> d!110353 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110353 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9863 thiss!1181) (mask!25613 thiss!1181) #b00000000000000000000000000000000 lt!401936) lt!402057)))

(declare-fun bs!24921 () Bool)

(assert (= bs!24921 d!110353))

(assert (=> bs!24921 m!828817))

(declare-fun m!828939 () Bool)

(assert (=> bs!24921 m!828939))

(assert (=> bs!24921 m!828841))

(assert (=> b!889024 d!110353))

(assert (=> b!889024 d!110339))

(declare-fun d!110355 () Bool)

(declare-fun lt!402063 () SeekEntryResult!8717)

(assert (=> d!110355 (and ((_ is Found!8717) lt!402063) (= (index!37240 lt!402063) lt!401936))))

(assert (=> d!110355 (= lt!402063 (seekEntry!0 key!785 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun lt!402062 () Unit!30240)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51769 (_ BitVec 32)) Unit!30240)

(assert (=> d!110355 (= lt!402062 (choose!0 key!785 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(assert (=> d!110355 (validMask!0 (mask!25613 thiss!1181))))

(assert (=> d!110355 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) lt!402062)))

(declare-fun bs!24922 () Bool)

(assert (= bs!24922 d!110355))

(assert (=> bs!24922 m!828805))

(declare-fun m!828941 () Bool)

(assert (=> bs!24922 m!828941))

(assert (=> bs!24922 m!828841))

(assert (=> b!889024 d!110355))

(declare-fun d!110357 () Bool)

(declare-fun lt!402066 () (_ BitVec 32))

(assert (=> d!110357 (and (or (bvslt lt!402066 #b00000000000000000000000000000000) (bvsge lt!402066 (size!25333 (_keys!9863 thiss!1181))) (and (bvsge lt!402066 #b00000000000000000000000000000000) (bvslt lt!402066 (size!25333 (_keys!9863 thiss!1181))))) (bvsge lt!402066 #b00000000000000000000000000000000) (bvslt lt!402066 (size!25333 (_keys!9863 thiss!1181))) (= (select (arr!24892 (_keys!9863 thiss!1181)) lt!402066) key!785))))

(declare-fun e!495496 () (_ BitVec 32))

(assert (=> d!110357 (= lt!402066 e!495496)))

(declare-fun c!94107 () Bool)

(assert (=> d!110357 (= c!94107 (= (select (arr!24892 (_keys!9863 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25333 (_keys!9863 thiss!1181))) (bvslt (size!25333 (_keys!9863 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110357 (= (arrayScanForKey!0 (_keys!9863 thiss!1181) key!785 #b00000000000000000000000000000000) lt!402066)))

(declare-fun b!889209 () Bool)

(assert (=> b!889209 (= e!495496 #b00000000000000000000000000000000)))

(declare-fun b!889210 () Bool)

(assert (=> b!889210 (= e!495496 (arrayScanForKey!0 (_keys!9863 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110357 c!94107) b!889209))

(assert (= (and d!110357 (not c!94107)) b!889210))

(declare-fun m!828943 () Bool)

(assert (=> d!110357 m!828943))

(assert (=> d!110357 m!828879))

(declare-fun m!828945 () Bool)

(assert (=> b!889210 m!828945))

(assert (=> b!889024 d!110357))

(declare-fun bm!39485 () Bool)

(declare-fun call!39488 () Bool)

(assert (=> bm!39485 (= call!39488 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!401936 #b00000000000000000000000000000001) (_keys!9863 thiss!1181) (mask!25613 thiss!1181)))))

(declare-fun b!889211 () Bool)

(declare-fun e!495499 () Bool)

(declare-fun e!495498 () Bool)

(assert (=> b!889211 (= e!495499 e!495498)))

(declare-fun c!94108 () Bool)

(assert (=> b!889211 (= c!94108 (validKeyInArray!0 (select (arr!24892 (_keys!9863 thiss!1181)) lt!401936)))))

(declare-fun b!889212 () Bool)

(assert (=> b!889212 (= e!495498 call!39488)))

(declare-fun b!889213 () Bool)

(declare-fun e!495497 () Bool)

(assert (=> b!889213 (= e!495497 call!39488)))

(declare-fun b!889214 () Bool)

(assert (=> b!889214 (= e!495498 e!495497)))

(declare-fun lt!402068 () (_ BitVec 64))

(assert (=> b!889214 (= lt!402068 (select (arr!24892 (_keys!9863 thiss!1181)) lt!401936))))

(declare-fun lt!402069 () Unit!30240)

(assert (=> b!889214 (= lt!402069 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9863 thiss!1181) lt!402068 lt!401936))))

(assert (=> b!889214 (arrayContainsKey!0 (_keys!9863 thiss!1181) lt!402068 #b00000000000000000000000000000000)))

(declare-fun lt!402067 () Unit!30240)

(assert (=> b!889214 (= lt!402067 lt!402069)))

(declare-fun res!602687 () Bool)

(assert (=> b!889214 (= res!602687 (= (seekEntryOrOpen!0 (select (arr!24892 (_keys!9863 thiss!1181)) lt!401936) (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) (Found!8717 lt!401936)))))

(assert (=> b!889214 (=> (not res!602687) (not e!495497))))

(declare-fun d!110359 () Bool)

(declare-fun res!602688 () Bool)

(assert (=> d!110359 (=> res!602688 e!495499)))

(assert (=> d!110359 (= res!602688 (bvsge lt!401936 (size!25333 (_keys!9863 thiss!1181))))))

(assert (=> d!110359 (= (arrayForallSeekEntryOrOpenFound!0 lt!401936 (_keys!9863 thiss!1181) (mask!25613 thiss!1181)) e!495499)))

(assert (= (and d!110359 (not res!602688)) b!889211))

(assert (= (and b!889211 c!94108) b!889214))

(assert (= (and b!889211 (not c!94108)) b!889212))

(assert (= (and b!889214 res!602687) b!889213))

(assert (= (or b!889213 b!889212) bm!39485))

(declare-fun m!828947 () Bool)

(assert (=> bm!39485 m!828947))

(declare-fun m!828949 () Bool)

(assert (=> b!889211 m!828949))

(assert (=> b!889211 m!828949))

(declare-fun m!828951 () Bool)

(assert (=> b!889211 m!828951))

(assert (=> b!889214 m!828949))

(declare-fun m!828953 () Bool)

(assert (=> b!889214 m!828953))

(declare-fun m!828955 () Bool)

(assert (=> b!889214 m!828955))

(assert (=> b!889214 m!828949))

(declare-fun m!828957 () Bool)

(assert (=> b!889214 m!828957))

(assert (=> b!889024 d!110359))

(declare-fun d!110361 () Bool)

(declare-fun e!495501 () Bool)

(assert (=> d!110361 e!495501))

(declare-fun res!602689 () Bool)

(assert (=> d!110361 (=> res!602689 e!495501)))

(declare-fun lt!402073 () Bool)

(assert (=> d!110361 (= res!602689 (not lt!402073))))

(declare-fun lt!402070 () Bool)

(assert (=> d!110361 (= lt!402073 lt!402070)))

(declare-fun lt!402071 () Unit!30240)

(declare-fun e!495500 () Unit!30240)

(assert (=> d!110361 (= lt!402071 e!495500)))

(declare-fun c!94109 () Bool)

(assert (=> d!110361 (= c!94109 lt!402070)))

(assert (=> d!110361 (= lt!402070 (containsKey!421 (toList!5292 call!39456) (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785)))))

(assert (=> d!110361 (= (contains!4296 call!39456 (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785)) lt!402073)))

(declare-fun b!889215 () Bool)

(declare-fun lt!402072 () Unit!30240)

(assert (=> b!889215 (= e!495500 lt!402072)))

(assert (=> b!889215 (= lt!402072 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5292 call!39456) (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785)))))

(assert (=> b!889215 (isDefined!317 (getValueByKey!437 (toList!5292 call!39456) (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785)))))

(declare-fun b!889216 () Bool)

(declare-fun Unit!30246 () Unit!30240)

(assert (=> b!889216 (= e!495500 Unit!30246)))

(declare-fun b!889217 () Bool)

(assert (=> b!889217 (= e!495501 (isDefined!317 (getValueByKey!437 (toList!5292 call!39456) (ite c!94054 (select (arr!24892 (_keys!9863 thiss!1181)) (index!37240 lt!401935)) key!785))))))

(assert (= (and d!110361 c!94109) b!889215))

(assert (= (and d!110361 (not c!94109)) b!889216))

(assert (= (and d!110361 (not res!602689)) b!889217))

(declare-fun m!828959 () Bool)

(assert (=> d!110361 m!828959))

(declare-fun m!828961 () Bool)

(assert (=> b!889215 m!828961))

(declare-fun m!828963 () Bool)

(assert (=> b!889215 m!828963))

(assert (=> b!889215 m!828963))

(declare-fun m!828965 () Bool)

(assert (=> b!889215 m!828965))

(assert (=> b!889217 m!828963))

(assert (=> b!889217 m!828963))

(assert (=> b!889217 m!828965))

(assert (=> bm!39454 d!110361))

(declare-fun b!889218 () Bool)

(declare-fun e!495502 () Bool)

(assert (=> b!889218 (= e!495502 tp_is_empty!17881)))

(declare-fun mapIsEmpty!28364 () Bool)

(declare-fun mapRes!28364 () Bool)

(assert (=> mapIsEmpty!28364 mapRes!28364))

(declare-fun condMapEmpty!28364 () Bool)

(declare-fun mapDefault!28364 () ValueCell!8459)

(assert (=> mapNonEmpty!28363 (= condMapEmpty!28364 (= mapRest!28363 ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28364)))))

(declare-fun e!495503 () Bool)

(assert (=> mapNonEmpty!28363 (= tp!54622 (and e!495503 mapRes!28364))))

(declare-fun mapNonEmpty!28364 () Bool)

(declare-fun tp!54623 () Bool)

(assert (=> mapNonEmpty!28364 (= mapRes!28364 (and tp!54623 e!495502))))

(declare-fun mapRest!28364 () (Array (_ BitVec 32) ValueCell!8459))

(declare-fun mapValue!28364 () ValueCell!8459)

(declare-fun mapKey!28364 () (_ BitVec 32))

(assert (=> mapNonEmpty!28364 (= mapRest!28363 (store mapRest!28364 mapKey!28364 mapValue!28364))))

(declare-fun b!889219 () Bool)

(assert (=> b!889219 (= e!495503 tp_is_empty!17881)))

(assert (= (and mapNonEmpty!28363 condMapEmpty!28364) mapIsEmpty!28364))

(assert (= (and mapNonEmpty!28363 (not condMapEmpty!28364)) mapNonEmpty!28364))

(assert (= (and mapNonEmpty!28364 ((_ is ValueCellFull!8459) mapValue!28364)) b!889218))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8459) mapDefault!28364)) b!889219))

(declare-fun m!828967 () Bool)

(assert (=> mapNonEmpty!28364 m!828967))

(declare-fun b_lambda!12891 () Bool)

(assert (= b_lambda!12889 (or (and b!888938 b_free!15553) b_lambda!12891)))

(check-sat (not bm!39478) b_and!25805 (not d!110351) (not b!889052) (not bm!39471) (not bm!39472) (not b!889142) (not b!889194) (not b_next!15553) (not b!889190) (not bm!39485) (not d!110327) (not b!889106) (not b!889102) (not d!110339) (not b!889045) tp_is_empty!17881 (not b!889157) (not b!889110) (not b!889192) (not b!889211) (not d!110353) (not b!889116) (not b!889197) (not b!889130) (not b!889105) (not b!889176) (not b!889215) (not b!889101) (not b!889054) (not d!110333) (not bm!39481) (not b!889210) (not bm!39484) (not b!889203) (not d!110337) (not d!110329) (not b!889167) (not b!889111) (not b!889179) (not b_lambda!12891) (not b!889109) (not mapNonEmpty!28364) (not b!889141) (not d!110361) (not d!110355) (not bm!39473) (not d!110331) (not b!889214) (not bm!39474) (not b!889217))
(check-sat b_and!25805 (not b_next!15553))
