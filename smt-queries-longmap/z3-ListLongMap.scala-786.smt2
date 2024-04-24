; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18730 () Bool)

(assert start!18730)

(declare-fun b!185099 () Bool)

(declare-fun b_free!4555 () Bool)

(declare-fun b_next!4555 () Bool)

(assert (=> b!185099 (= b_free!4555 (not b_next!4555))))

(declare-fun tp!16455 () Bool)

(declare-fun b_and!11165 () Bool)

(assert (=> b!185099 (= tp!16455 b_and!11165)))

(declare-fun b!185093 () Bool)

(declare-fun e!121805 () Bool)

(declare-fun e!121810 () Bool)

(assert (=> b!185093 (= e!121805 e!121810)))

(declare-fun res!87545 () Bool)

(assert (=> b!185093 (=> (not res!87545) (not e!121810))))

(declare-datatypes ((SeekEntryResult!619 0))(
  ( (MissingZero!619 (index!4646 (_ BitVec 32))) (Found!619 (index!4647 (_ BitVec 32))) (Intermediate!619 (undefined!1431 Bool) (index!4648 (_ BitVec 32)) (x!20095 (_ BitVec 32))) (Undefined!619) (MissingVacant!619 (index!4649 (_ BitVec 32))) )
))
(declare-fun lt!91598 () SeekEntryResult!619)

(get-info :version)

(assert (=> b!185093 (= res!87545 (and (not ((_ is Undefined!619) lt!91598)) (not ((_ is MissingVacant!619) lt!91598)) (not ((_ is MissingZero!619) lt!91598)) ((_ is Found!619) lt!91598)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5417 0))(
  ( (V!5418 (val!2208 Int)) )
))
(declare-datatypes ((ValueCell!1820 0))(
  ( (ValueCellFull!1820 (v!4117 V!5417)) (EmptyCell!1820) )
))
(declare-datatypes ((array!7843 0))(
  ( (array!7844 (arr!3704 (Array (_ BitVec 32) (_ BitVec 64))) (size!4020 (_ BitVec 32))) )
))
(declare-datatypes ((array!7845 0))(
  ( (array!7846 (arr!3705 (Array (_ BitVec 32) ValueCell!1820)) (size!4021 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2548 0))(
  ( (LongMapFixedSize!2549 (defaultEntry!3773 Int) (mask!8871 (_ BitVec 32)) (extraKeys!3510 (_ BitVec 32)) (zeroValue!3614 V!5417) (minValue!3614 V!5417) (_size!1323 (_ BitVec 32)) (_keys!5708 array!7843) (_values!3756 array!7845) (_vacant!1323 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2548)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7843 (_ BitVec 32)) SeekEntryResult!619)

(assert (=> b!185093 (= lt!91598 (seekEntryOrOpen!0 key!828 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)))))

(declare-fun b!185094 () Bool)

(declare-fun e!121809 () Bool)

(declare-fun e!121807 () Bool)

(declare-fun mapRes!7443 () Bool)

(assert (=> b!185094 (= e!121809 (and e!121807 mapRes!7443))))

(declare-fun condMapEmpty!7443 () Bool)

(declare-fun mapDefault!7443 () ValueCell!1820)

(assert (=> b!185094 (= condMapEmpty!7443 (= (arr!3705 (_values!3756 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1820)) mapDefault!7443)))))

(declare-fun b!185095 () Bool)

(declare-fun res!87543 () Bool)

(assert (=> b!185095 (=> (not res!87543) (not e!121810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185095 (= res!87543 (validMask!0 (mask!8871 thiss!1248)))))

(declare-fun b!185096 () Bool)

(declare-fun res!87544 () Bool)

(assert (=> b!185096 (=> (not res!87544) (not e!121805))))

(assert (=> b!185096 (= res!87544 (not (= key!828 (bvneg key!828))))))

(declare-fun res!87548 () Bool)

(assert (=> start!18730 (=> (not res!87548) (not e!121805))))

(declare-fun valid!1074 (LongMapFixedSize!2548) Bool)

(assert (=> start!18730 (= res!87548 (valid!1074 thiss!1248))))

(assert (=> start!18730 e!121805))

(declare-fun e!121804 () Bool)

(assert (=> start!18730 e!121804))

(assert (=> start!18730 true))

(declare-fun b!185097 () Bool)

(declare-fun tp_is_empty!4327 () Bool)

(assert (=> b!185097 (= e!121807 tp_is_empty!4327)))

(declare-fun b!185098 () Bool)

(declare-fun res!87546 () Bool)

(assert (=> b!185098 (=> (not res!87546) (not e!121810))))

(assert (=> b!185098 (= res!87546 (and (= (size!4021 (_values!3756 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8871 thiss!1248))) (= (size!4020 (_keys!5708 thiss!1248)) (size!4021 (_values!3756 thiss!1248))) (bvsge (mask!8871 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3510 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3510 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7443 () Bool)

(declare-fun tp!16454 () Bool)

(declare-fun e!121808 () Bool)

(assert (=> mapNonEmpty!7443 (= mapRes!7443 (and tp!16454 e!121808))))

(declare-fun mapValue!7443 () ValueCell!1820)

(declare-fun mapKey!7443 () (_ BitVec 32))

(declare-fun mapRest!7443 () (Array (_ BitVec 32) ValueCell!1820))

(assert (=> mapNonEmpty!7443 (= (arr!3705 (_values!3756 thiss!1248)) (store mapRest!7443 mapKey!7443 mapValue!7443))))

(declare-fun array_inv!2389 (array!7843) Bool)

(declare-fun array_inv!2390 (array!7845) Bool)

(assert (=> b!185099 (= e!121804 (and tp!16455 tp_is_empty!4327 (array_inv!2389 (_keys!5708 thiss!1248)) (array_inv!2390 (_values!3756 thiss!1248)) e!121809))))

(declare-fun b!185100 () Bool)

(declare-fun res!87547 () Bool)

(assert (=> b!185100 (=> (not res!87547) (not e!121810))))

(declare-datatypes ((tuple2!3382 0))(
  ( (tuple2!3383 (_1!1702 (_ BitVec 64)) (_2!1702 V!5417)) )
))
(declare-datatypes ((List!2316 0))(
  ( (Nil!2313) (Cons!2312 (h!2945 tuple2!3382) (t!7186 List!2316)) )
))
(declare-datatypes ((ListLongMap!2303 0))(
  ( (ListLongMap!2304 (toList!1167 List!2316)) )
))
(declare-fun contains!1273 (ListLongMap!2303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!819 (array!7843 array!7845 (_ BitVec 32) (_ BitVec 32) V!5417 V!5417 (_ BitVec 32) Int) ListLongMap!2303)

(assert (=> b!185100 (= res!87547 (not (contains!1273 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) key!828)))))

(declare-fun b!185101 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7843 (_ BitVec 32)) Bool)

(assert (=> b!185101 (= e!121810 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5708 thiss!1248) (mask!8871 thiss!1248))))))

(declare-fun mapIsEmpty!7443 () Bool)

(assert (=> mapIsEmpty!7443 mapRes!7443))

(declare-fun b!185102 () Bool)

(assert (=> b!185102 (= e!121808 tp_is_empty!4327)))

(assert (= (and start!18730 res!87548) b!185096))

(assert (= (and b!185096 res!87544) b!185093))

(assert (= (and b!185093 res!87545) b!185100))

(assert (= (and b!185100 res!87547) b!185095))

(assert (= (and b!185095 res!87543) b!185098))

(assert (= (and b!185098 res!87546) b!185101))

(assert (= (and b!185094 condMapEmpty!7443) mapIsEmpty!7443))

(assert (= (and b!185094 (not condMapEmpty!7443)) mapNonEmpty!7443))

(assert (= (and mapNonEmpty!7443 ((_ is ValueCellFull!1820) mapValue!7443)) b!185102))

(assert (= (and b!185094 ((_ is ValueCellFull!1820) mapDefault!7443)) b!185097))

(assert (= b!185099 b!185094))

(assert (= start!18730 b!185099))

(declare-fun m!212575 () Bool)

(assert (=> b!185100 m!212575))

(assert (=> b!185100 m!212575))

(declare-fun m!212577 () Bool)

(assert (=> b!185100 m!212577))

(declare-fun m!212579 () Bool)

(assert (=> b!185095 m!212579))

(declare-fun m!212581 () Bool)

(assert (=> b!185093 m!212581))

(declare-fun m!212583 () Bool)

(assert (=> b!185099 m!212583))

(declare-fun m!212585 () Bool)

(assert (=> b!185099 m!212585))

(declare-fun m!212587 () Bool)

(assert (=> b!185101 m!212587))

(declare-fun m!212589 () Bool)

(assert (=> start!18730 m!212589))

(declare-fun m!212591 () Bool)

(assert (=> mapNonEmpty!7443 m!212591))

(check-sat (not b!185101) tp_is_empty!4327 b_and!11165 (not b!185100) (not mapNonEmpty!7443) (not start!18730) (not b!185093) (not b_next!4555) (not b!185099) (not b!185095))
(check-sat b_and!11165 (not b_next!4555))
(get-model)

(declare-fun bm!18649 () Bool)

(declare-fun call!18652 () Bool)

(assert (=> bm!18649 (= call!18652 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5708 thiss!1248) (mask!8871 thiss!1248)))))

(declare-fun b!185171 () Bool)

(declare-fun e!121860 () Bool)

(assert (=> b!185171 (= e!121860 call!18652)))

(declare-fun b!185172 () Bool)

(declare-fun e!121861 () Bool)

(assert (=> b!185172 (= e!121861 e!121860)))

(declare-fun lt!91611 () (_ BitVec 64))

(assert (=> b!185172 (= lt!91611 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5584 0))(
  ( (Unit!5585) )
))
(declare-fun lt!91612 () Unit!5584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7843 (_ BitVec 64) (_ BitVec 32)) Unit!5584)

(assert (=> b!185172 (= lt!91612 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5708 thiss!1248) lt!91611 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185172 (arrayContainsKey!0 (_keys!5708 thiss!1248) lt!91611 #b00000000000000000000000000000000)))

(declare-fun lt!91613 () Unit!5584)

(assert (=> b!185172 (= lt!91613 lt!91612)))

(declare-fun res!87590 () Bool)

(assert (=> b!185172 (= res!87590 (= (seekEntryOrOpen!0 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000) (_keys!5708 thiss!1248) (mask!8871 thiss!1248)) (Found!619 #b00000000000000000000000000000000)))))

(assert (=> b!185172 (=> (not res!87590) (not e!121860))))

(declare-fun b!185173 () Bool)

(assert (=> b!185173 (= e!121861 call!18652)))

(declare-fun b!185174 () Bool)

(declare-fun e!121859 () Bool)

(assert (=> b!185174 (= e!121859 e!121861)))

(declare-fun c!33233 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185174 (= c!33233 (validKeyInArray!0 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55153 () Bool)

(declare-fun res!87589 () Bool)

(assert (=> d!55153 (=> res!87589 e!121859)))

(assert (=> d!55153 (= res!87589 (bvsge #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))

(assert (=> d!55153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)) e!121859)))

(assert (= (and d!55153 (not res!87589)) b!185174))

(assert (= (and b!185174 c!33233) b!185172))

(assert (= (and b!185174 (not c!33233)) b!185173))

(assert (= (and b!185172 res!87590) b!185171))

(assert (= (or b!185171 b!185173) bm!18649))

(declare-fun m!212629 () Bool)

(assert (=> bm!18649 m!212629))

(declare-fun m!212631 () Bool)

(assert (=> b!185172 m!212631))

(declare-fun m!212633 () Bool)

(assert (=> b!185172 m!212633))

(declare-fun m!212635 () Bool)

(assert (=> b!185172 m!212635))

(assert (=> b!185172 m!212631))

(declare-fun m!212637 () Bool)

(assert (=> b!185172 m!212637))

(assert (=> b!185174 m!212631))

(assert (=> b!185174 m!212631))

(declare-fun m!212639 () Bool)

(assert (=> b!185174 m!212639))

(assert (=> b!185101 d!55153))

(declare-fun d!55155 () Bool)

(declare-fun res!87597 () Bool)

(declare-fun e!121864 () Bool)

(assert (=> d!55155 (=> (not res!87597) (not e!121864))))

(declare-fun simpleValid!180 (LongMapFixedSize!2548) Bool)

(assert (=> d!55155 (= res!87597 (simpleValid!180 thiss!1248))))

(assert (=> d!55155 (= (valid!1074 thiss!1248) e!121864)))

(declare-fun b!185181 () Bool)

(declare-fun res!87598 () Bool)

(assert (=> b!185181 (=> (not res!87598) (not e!121864))))

(declare-fun arrayCountValidKeys!0 (array!7843 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185181 (= res!87598 (= (arrayCountValidKeys!0 (_keys!5708 thiss!1248) #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))) (_size!1323 thiss!1248)))))

(declare-fun b!185182 () Bool)

(declare-fun res!87599 () Bool)

(assert (=> b!185182 (=> (not res!87599) (not e!121864))))

(assert (=> b!185182 (= res!87599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)))))

(declare-fun b!185183 () Bool)

(declare-datatypes ((List!2318 0))(
  ( (Nil!2315) (Cons!2314 (h!2947 (_ BitVec 64)) (t!7190 List!2318)) )
))
(declare-fun arrayNoDuplicates!0 (array!7843 (_ BitVec 32) List!2318) Bool)

(assert (=> b!185183 (= e!121864 (arrayNoDuplicates!0 (_keys!5708 thiss!1248) #b00000000000000000000000000000000 Nil!2315))))

(assert (= (and d!55155 res!87597) b!185181))

(assert (= (and b!185181 res!87598) b!185182))

(assert (= (and b!185182 res!87599) b!185183))

(declare-fun m!212641 () Bool)

(assert (=> d!55155 m!212641))

(declare-fun m!212643 () Bool)

(assert (=> b!185181 m!212643))

(assert (=> b!185182 m!212587))

(declare-fun m!212645 () Bool)

(assert (=> b!185183 m!212645))

(assert (=> start!18730 d!55155))

(declare-fun d!55157 () Bool)

(declare-fun e!121869 () Bool)

(assert (=> d!55157 e!121869))

(declare-fun res!87602 () Bool)

(assert (=> d!55157 (=> res!87602 e!121869)))

(declare-fun lt!91622 () Bool)

(assert (=> d!55157 (= res!87602 (not lt!91622))))

(declare-fun lt!91625 () Bool)

(assert (=> d!55157 (= lt!91622 lt!91625)))

(declare-fun lt!91623 () Unit!5584)

(declare-fun e!121870 () Unit!5584)

(assert (=> d!55157 (= lt!91623 e!121870)))

(declare-fun c!33236 () Bool)

(assert (=> d!55157 (= c!33236 lt!91625)))

(declare-fun containsKey!225 (List!2316 (_ BitVec 64)) Bool)

(assert (=> d!55157 (= lt!91625 (containsKey!225 (toList!1167 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(assert (=> d!55157 (= (contains!1273 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) key!828) lt!91622)))

(declare-fun b!185190 () Bool)

(declare-fun lt!91624 () Unit!5584)

(assert (=> b!185190 (= e!121870 lt!91624)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!173 (List!2316 (_ BitVec 64)) Unit!5584)

(assert (=> b!185190 (= lt!91624 (lemmaContainsKeyImpliesGetValueByKeyDefined!173 (toList!1167 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(declare-datatypes ((Option!228 0))(
  ( (Some!227 (v!4120 V!5417)) (None!226) )
))
(declare-fun isDefined!174 (Option!228) Bool)

(declare-fun getValueByKey!222 (List!2316 (_ BitVec 64)) Option!228)

(assert (=> b!185190 (isDefined!174 (getValueByKey!222 (toList!1167 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(declare-fun b!185191 () Bool)

(declare-fun Unit!5586 () Unit!5584)

(assert (=> b!185191 (= e!121870 Unit!5586)))

(declare-fun b!185192 () Bool)

(assert (=> b!185192 (= e!121869 (isDefined!174 (getValueByKey!222 (toList!1167 (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828)))))

(assert (= (and d!55157 c!33236) b!185190))

(assert (= (and d!55157 (not c!33236)) b!185191))

(assert (= (and d!55157 (not res!87602)) b!185192))

(declare-fun m!212647 () Bool)

(assert (=> d!55157 m!212647))

(declare-fun m!212649 () Bool)

(assert (=> b!185190 m!212649))

(declare-fun m!212651 () Bool)

(assert (=> b!185190 m!212651))

(assert (=> b!185190 m!212651))

(declare-fun m!212653 () Bool)

(assert (=> b!185190 m!212653))

(assert (=> b!185192 m!212651))

(assert (=> b!185192 m!212651))

(assert (=> b!185192 m!212653))

(assert (=> b!185100 d!55157))

(declare-fun b!185235 () Bool)

(declare-fun res!87629 () Bool)

(declare-fun e!121901 () Bool)

(assert (=> b!185235 (=> (not res!87629) (not e!121901))))

(declare-fun e!121908 () Bool)

(assert (=> b!185235 (= res!87629 e!121908)))

(declare-fun res!87626 () Bool)

(assert (=> b!185235 (=> res!87626 e!121908)))

(declare-fun e!121904 () Bool)

(assert (=> b!185235 (= res!87626 (not e!121904))))

(declare-fun res!87625 () Bool)

(assert (=> b!185235 (=> (not res!87625) (not e!121904))))

(assert (=> b!185235 (= res!87625 (bvslt #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))

(declare-fun b!185236 () Bool)

(declare-fun c!33254 () Bool)

(assert (=> b!185236 (= c!33254 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121907 () ListLongMap!2303)

(declare-fun e!121902 () ListLongMap!2303)

(assert (=> b!185236 (= e!121907 e!121902)))

(declare-fun b!185237 () Bool)

(declare-fun call!18672 () ListLongMap!2303)

(assert (=> b!185237 (= e!121902 call!18672)))

(declare-fun b!185238 () Bool)

(declare-fun e!121906 () Bool)

(declare-fun call!18668 () Bool)

(assert (=> b!185238 (= e!121906 (not call!18668))))

(declare-fun b!185239 () Bool)

(declare-fun e!121899 () Unit!5584)

(declare-fun Unit!5587 () Unit!5584)

(assert (=> b!185239 (= e!121899 Unit!5587)))

(declare-fun bm!18664 () Bool)

(declare-fun call!18673 () ListLongMap!2303)

(declare-fun call!18671 () ListLongMap!2303)

(assert (=> bm!18664 (= call!18673 call!18671)))

(declare-fun b!185240 () Bool)

(declare-fun e!121909 () Bool)

(declare-fun lt!91681 () ListLongMap!2303)

(declare-fun apply!164 (ListLongMap!2303 (_ BitVec 64)) V!5417)

(assert (=> b!185240 (= e!121909 (= (apply!164 lt!91681 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3614 thiss!1248)))))

(declare-fun b!185241 () Bool)

(declare-fun res!87622 () Bool)

(assert (=> b!185241 (=> (not res!87622) (not e!121901))))

(assert (=> b!185241 (= res!87622 e!121906)))

(declare-fun c!33252 () Bool)

(assert (=> b!185241 (= c!33252 (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!185242 () Bool)

(declare-fun e!121900 () ListLongMap!2303)

(assert (=> b!185242 (= e!121900 e!121907)))

(declare-fun c!33249 () Bool)

(assert (=> b!185242 (= c!33249 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18665 () Bool)

(declare-fun call!18667 () Bool)

(assert (=> bm!18665 (= call!18667 (contains!1273 lt!91681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185243 () Bool)

(declare-fun call!18669 () ListLongMap!2303)

(assert (=> b!185243 (= e!121907 call!18669)))

(declare-fun c!33251 () Bool)

(declare-fun call!18670 () ListLongMap!2303)

(declare-fun bm!18666 () Bool)

(declare-fun +!284 (ListLongMap!2303 tuple2!3382) ListLongMap!2303)

(assert (=> bm!18666 (= call!18670 (+!284 (ite c!33251 call!18671 (ite c!33249 call!18673 call!18672)) (ite (or c!33251 c!33249) (tuple2!3383 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3614 thiss!1248)) (tuple2!3383 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3614 thiss!1248)))))))

(declare-fun b!185244 () Bool)

(assert (=> b!185244 (= e!121904 (validKeyInArray!0 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185245 () Bool)

(declare-fun e!121898 () Bool)

(declare-fun get!2141 (ValueCell!1820 V!5417) V!5417)

(declare-fun dynLambda!507 (Int (_ BitVec 64)) V!5417)

(assert (=> b!185245 (= e!121898 (= (apply!164 lt!91681 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000)) (get!2141 (select (arr!3705 (_values!3756 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!507 (defaultEntry!3773 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4021 (_values!3756 thiss!1248))))))

(assert (=> b!185245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))

(declare-fun b!185246 () Bool)

(declare-fun e!121903 () Bool)

(assert (=> b!185246 (= e!121903 (not call!18667))))

(declare-fun b!185247 () Bool)

(declare-fun e!121905 () Bool)

(assert (=> b!185247 (= e!121905 (validKeyInArray!0 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185248 () Bool)

(declare-fun e!121897 () Bool)

(assert (=> b!185248 (= e!121903 e!121897)))

(declare-fun res!87624 () Bool)

(assert (=> b!185248 (= res!87624 call!18667)))

(assert (=> b!185248 (=> (not res!87624) (not e!121897))))

(declare-fun b!185249 () Bool)

(declare-fun lt!91689 () Unit!5584)

(assert (=> b!185249 (= e!121899 lt!91689)))

(declare-fun lt!91690 () ListLongMap!2303)

(declare-fun getCurrentListMapNoExtraKeys!195 (array!7843 array!7845 (_ BitVec 32) (_ BitVec 32) V!5417 V!5417 (_ BitVec 32) Int) ListLongMap!2303)

(assert (=> b!185249 (= lt!91690 (getCurrentListMapNoExtraKeys!195 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91684 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91685 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91685 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91670 () Unit!5584)

(declare-fun addStillContains!140 (ListLongMap!2303 (_ BitVec 64) V!5417 (_ BitVec 64)) Unit!5584)

(assert (=> b!185249 (= lt!91670 (addStillContains!140 lt!91690 lt!91684 (zeroValue!3614 thiss!1248) lt!91685))))

(assert (=> b!185249 (contains!1273 (+!284 lt!91690 (tuple2!3383 lt!91684 (zeroValue!3614 thiss!1248))) lt!91685)))

(declare-fun lt!91678 () Unit!5584)

(assert (=> b!185249 (= lt!91678 lt!91670)))

(declare-fun lt!91682 () ListLongMap!2303)

(assert (=> b!185249 (= lt!91682 (getCurrentListMapNoExtraKeys!195 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91671 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91688 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91688 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91687 () Unit!5584)

(declare-fun addApplyDifferent!140 (ListLongMap!2303 (_ BitVec 64) V!5417 (_ BitVec 64)) Unit!5584)

(assert (=> b!185249 (= lt!91687 (addApplyDifferent!140 lt!91682 lt!91671 (minValue!3614 thiss!1248) lt!91688))))

(assert (=> b!185249 (= (apply!164 (+!284 lt!91682 (tuple2!3383 lt!91671 (minValue!3614 thiss!1248))) lt!91688) (apply!164 lt!91682 lt!91688))))

(declare-fun lt!91676 () Unit!5584)

(assert (=> b!185249 (= lt!91676 lt!91687)))

(declare-fun lt!91673 () ListLongMap!2303)

(assert (=> b!185249 (= lt!91673 (getCurrentListMapNoExtraKeys!195 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91672 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91679 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91679 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91683 () Unit!5584)

(assert (=> b!185249 (= lt!91683 (addApplyDifferent!140 lt!91673 lt!91672 (zeroValue!3614 thiss!1248) lt!91679))))

(assert (=> b!185249 (= (apply!164 (+!284 lt!91673 (tuple2!3383 lt!91672 (zeroValue!3614 thiss!1248))) lt!91679) (apply!164 lt!91673 lt!91679))))

(declare-fun lt!91680 () Unit!5584)

(assert (=> b!185249 (= lt!91680 lt!91683)))

(declare-fun lt!91675 () ListLongMap!2303)

(assert (=> b!185249 (= lt!91675 (getCurrentListMapNoExtraKeys!195 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91674 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91677 () (_ BitVec 64))

(assert (=> b!185249 (= lt!91677 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185249 (= lt!91689 (addApplyDifferent!140 lt!91675 lt!91674 (minValue!3614 thiss!1248) lt!91677))))

(assert (=> b!185249 (= (apply!164 (+!284 lt!91675 (tuple2!3383 lt!91674 (minValue!3614 thiss!1248))) lt!91677) (apply!164 lt!91675 lt!91677))))

(declare-fun b!185250 () Bool)

(assert (=> b!185250 (= e!121902 call!18669)))

(declare-fun bm!18667 () Bool)

(assert (=> bm!18667 (= call!18672 call!18673)))

(declare-fun d!55159 () Bool)

(assert (=> d!55159 e!121901))

(declare-fun res!87621 () Bool)

(assert (=> d!55159 (=> (not res!87621) (not e!121901))))

(assert (=> d!55159 (= res!87621 (or (bvsge #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))))

(declare-fun lt!91691 () ListLongMap!2303)

(assert (=> d!55159 (= lt!91681 lt!91691)))

(declare-fun lt!91686 () Unit!5584)

(assert (=> d!55159 (= lt!91686 e!121899)))

(declare-fun c!33250 () Bool)

(assert (=> d!55159 (= c!33250 e!121905)))

(declare-fun res!87623 () Bool)

(assert (=> d!55159 (=> (not res!87623) (not e!121905))))

(assert (=> d!55159 (= res!87623 (bvslt #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))

(assert (=> d!55159 (= lt!91691 e!121900)))

(assert (=> d!55159 (= c!33251 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55159 (validMask!0 (mask!8871 thiss!1248))))

(assert (=> d!55159 (= (getCurrentListMap!819 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) lt!91681)))

(declare-fun bm!18668 () Bool)

(assert (=> bm!18668 (= call!18668 (contains!1273 lt!91681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185251 () Bool)

(assert (=> b!185251 (= e!121908 e!121898)))

(declare-fun res!87627 () Bool)

(assert (=> b!185251 (=> (not res!87627) (not e!121898))))

(assert (=> b!185251 (= res!87627 (contains!1273 lt!91681 (select (arr!3704 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4020 (_keys!5708 thiss!1248))))))

(declare-fun b!185252 () Bool)

(assert (=> b!185252 (= e!121901 e!121903)))

(declare-fun c!33253 () Bool)

(assert (=> b!185252 (= c!33253 (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18669 () Bool)

(assert (=> bm!18669 (= call!18671 (getCurrentListMapNoExtraKeys!195 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun b!185253 () Bool)

(assert (=> b!185253 (= e!121897 (= (apply!164 lt!91681 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3614 thiss!1248)))))

(declare-fun bm!18670 () Bool)

(assert (=> bm!18670 (= call!18669 call!18670)))

(declare-fun b!185254 () Bool)

(assert (=> b!185254 (= e!121900 (+!284 call!18670 (tuple2!3383 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3614 thiss!1248))))))

(declare-fun b!185255 () Bool)

(assert (=> b!185255 (= e!121906 e!121909)))

(declare-fun res!87628 () Bool)

(assert (=> b!185255 (= res!87628 call!18668)))

(assert (=> b!185255 (=> (not res!87628) (not e!121909))))

(assert (= (and d!55159 c!33251) b!185254))

(assert (= (and d!55159 (not c!33251)) b!185242))

(assert (= (and b!185242 c!33249) b!185243))

(assert (= (and b!185242 (not c!33249)) b!185236))

(assert (= (and b!185236 c!33254) b!185250))

(assert (= (and b!185236 (not c!33254)) b!185237))

(assert (= (or b!185250 b!185237) bm!18667))

(assert (= (or b!185243 bm!18667) bm!18664))

(assert (= (or b!185243 b!185250) bm!18670))

(assert (= (or b!185254 bm!18664) bm!18669))

(assert (= (or b!185254 bm!18670) bm!18666))

(assert (= (and d!55159 res!87623) b!185247))

(assert (= (and d!55159 c!33250) b!185249))

(assert (= (and d!55159 (not c!33250)) b!185239))

(assert (= (and d!55159 res!87621) b!185235))

(assert (= (and b!185235 res!87625) b!185244))

(assert (= (and b!185235 (not res!87626)) b!185251))

(assert (= (and b!185251 res!87627) b!185245))

(assert (= (and b!185235 res!87629) b!185241))

(assert (= (and b!185241 c!33252) b!185255))

(assert (= (and b!185241 (not c!33252)) b!185238))

(assert (= (and b!185255 res!87628) b!185240))

(assert (= (or b!185255 b!185238) bm!18668))

(assert (= (and b!185241 res!87622) b!185252))

(assert (= (and b!185252 c!33253) b!185248))

(assert (= (and b!185252 (not c!33253)) b!185246))

(assert (= (and b!185248 res!87624) b!185253))

(assert (= (or b!185248 b!185246) bm!18665))

(declare-fun b_lambda!7265 () Bool)

(assert (=> (not b_lambda!7265) (not b!185245)))

(declare-fun t!7189 () Bool)

(declare-fun tb!2831 () Bool)

(assert (=> (and b!185099 (= (defaultEntry!3773 thiss!1248) (defaultEntry!3773 thiss!1248)) t!7189) tb!2831))

(declare-fun result!4787 () Bool)

(assert (=> tb!2831 (= result!4787 tp_is_empty!4327)))

(assert (=> b!185245 t!7189))

(declare-fun b_and!11171 () Bool)

(assert (= b_and!11165 (and (=> t!7189 result!4787) b_and!11171)))

(declare-fun m!212655 () Bool)

(assert (=> b!185249 m!212655))

(declare-fun m!212657 () Bool)

(assert (=> b!185249 m!212657))

(declare-fun m!212659 () Bool)

(assert (=> b!185249 m!212659))

(declare-fun m!212661 () Bool)

(assert (=> b!185249 m!212661))

(declare-fun m!212663 () Bool)

(assert (=> b!185249 m!212663))

(assert (=> b!185249 m!212657))

(declare-fun m!212665 () Bool)

(assert (=> b!185249 m!212665))

(declare-fun m!212667 () Bool)

(assert (=> b!185249 m!212667))

(assert (=> b!185249 m!212655))

(declare-fun m!212669 () Bool)

(assert (=> b!185249 m!212669))

(declare-fun m!212671 () Bool)

(assert (=> b!185249 m!212671))

(declare-fun m!212673 () Bool)

(assert (=> b!185249 m!212673))

(assert (=> b!185249 m!212667))

(declare-fun m!212675 () Bool)

(assert (=> b!185249 m!212675))

(declare-fun m!212677 () Bool)

(assert (=> b!185249 m!212677))

(declare-fun m!212679 () Bool)

(assert (=> b!185249 m!212679))

(declare-fun m!212681 () Bool)

(assert (=> b!185249 m!212681))

(declare-fun m!212683 () Bool)

(assert (=> b!185249 m!212683))

(assert (=> b!185249 m!212671))

(declare-fun m!212685 () Bool)

(assert (=> b!185249 m!212685))

(assert (=> b!185249 m!212631))

(assert (=> b!185247 m!212631))

(assert (=> b!185247 m!212631))

(assert (=> b!185247 m!212639))

(declare-fun m!212687 () Bool)

(assert (=> b!185245 m!212687))

(declare-fun m!212689 () Bool)

(assert (=> b!185245 m!212689))

(declare-fun m!212691 () Bool)

(assert (=> b!185245 m!212691))

(assert (=> b!185245 m!212687))

(assert (=> b!185245 m!212689))

(assert (=> b!185245 m!212631))

(assert (=> b!185245 m!212631))

(declare-fun m!212693 () Bool)

(assert (=> b!185245 m!212693))

(declare-fun m!212695 () Bool)

(assert (=> bm!18666 m!212695))

(declare-fun m!212697 () Bool)

(assert (=> b!185253 m!212697))

(declare-fun m!212699 () Bool)

(assert (=> b!185254 m!212699))

(assert (=> b!185251 m!212631))

(assert (=> b!185251 m!212631))

(declare-fun m!212701 () Bool)

(assert (=> b!185251 m!212701))

(assert (=> bm!18669 m!212673))

(declare-fun m!212703 () Bool)

(assert (=> bm!18668 m!212703))

(assert (=> b!185244 m!212631))

(assert (=> b!185244 m!212631))

(assert (=> b!185244 m!212639))

(assert (=> d!55159 m!212579))

(declare-fun m!212705 () Bool)

(assert (=> b!185240 m!212705))

(declare-fun m!212707 () Bool)

(assert (=> bm!18665 m!212707))

(assert (=> b!185100 d!55159))

(declare-fun d!55161 () Bool)

(assert (=> d!55161 (= (validMask!0 (mask!8871 thiss!1248)) (and (or (= (mask!8871 thiss!1248) #b00000000000000000000000000000111) (= (mask!8871 thiss!1248) #b00000000000000000000000000001111) (= (mask!8871 thiss!1248) #b00000000000000000000000000011111) (= (mask!8871 thiss!1248) #b00000000000000000000000000111111) (= (mask!8871 thiss!1248) #b00000000000000000000000001111111) (= (mask!8871 thiss!1248) #b00000000000000000000000011111111) (= (mask!8871 thiss!1248) #b00000000000000000000000111111111) (= (mask!8871 thiss!1248) #b00000000000000000000001111111111) (= (mask!8871 thiss!1248) #b00000000000000000000011111111111) (= (mask!8871 thiss!1248) #b00000000000000000000111111111111) (= (mask!8871 thiss!1248) #b00000000000000000001111111111111) (= (mask!8871 thiss!1248) #b00000000000000000011111111111111) (= (mask!8871 thiss!1248) #b00000000000000000111111111111111) (= (mask!8871 thiss!1248) #b00000000000000001111111111111111) (= (mask!8871 thiss!1248) #b00000000000000011111111111111111) (= (mask!8871 thiss!1248) #b00000000000000111111111111111111) (= (mask!8871 thiss!1248) #b00000000000001111111111111111111) (= (mask!8871 thiss!1248) #b00000000000011111111111111111111) (= (mask!8871 thiss!1248) #b00000000000111111111111111111111) (= (mask!8871 thiss!1248) #b00000000001111111111111111111111) (= (mask!8871 thiss!1248) #b00000000011111111111111111111111) (= (mask!8871 thiss!1248) #b00000000111111111111111111111111) (= (mask!8871 thiss!1248) #b00000001111111111111111111111111) (= (mask!8871 thiss!1248) #b00000011111111111111111111111111) (= (mask!8871 thiss!1248) #b00000111111111111111111111111111) (= (mask!8871 thiss!1248) #b00001111111111111111111111111111) (= (mask!8871 thiss!1248) #b00011111111111111111111111111111) (= (mask!8871 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8871 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185095 d!55161))

(declare-fun d!55163 () Bool)

(assert (=> d!55163 (= (array_inv!2389 (_keys!5708 thiss!1248)) (bvsge (size!4020 (_keys!5708 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185099 d!55163))

(declare-fun d!55165 () Bool)

(assert (=> d!55165 (= (array_inv!2390 (_values!3756 thiss!1248)) (bvsge (size!4021 (_values!3756 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185099 d!55165))

(declare-fun b!185270 () Bool)

(declare-fun c!33261 () Bool)

(declare-fun lt!91699 () (_ BitVec 64))

(assert (=> b!185270 (= c!33261 (= lt!91699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121918 () SeekEntryResult!619)

(declare-fun e!121916 () SeekEntryResult!619)

(assert (=> b!185270 (= e!121918 e!121916)))

(declare-fun b!185272 () Bool)

(declare-fun e!121917 () SeekEntryResult!619)

(assert (=> b!185272 (= e!121917 Undefined!619)))

(declare-fun b!185273 () Bool)

(declare-fun lt!91698 () SeekEntryResult!619)

(assert (=> b!185273 (= e!121918 (Found!619 (index!4648 lt!91698)))))

(declare-fun b!185274 () Bool)

(assert (=> b!185274 (= e!121916 (MissingZero!619 (index!4648 lt!91698)))))

(declare-fun b!185275 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7843 (_ BitVec 32)) SeekEntryResult!619)

(assert (=> b!185275 (= e!121916 (seekKeyOrZeroReturnVacant!0 (x!20095 lt!91698) (index!4648 lt!91698) (index!4648 lt!91698) key!828 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)))))

(declare-fun d!55167 () Bool)

(declare-fun lt!91700 () SeekEntryResult!619)

(assert (=> d!55167 (and (or ((_ is Undefined!619) lt!91700) (not ((_ is Found!619) lt!91700)) (and (bvsge (index!4647 lt!91700) #b00000000000000000000000000000000) (bvslt (index!4647 lt!91700) (size!4020 (_keys!5708 thiss!1248))))) (or ((_ is Undefined!619) lt!91700) ((_ is Found!619) lt!91700) (not ((_ is MissingZero!619) lt!91700)) (and (bvsge (index!4646 lt!91700) #b00000000000000000000000000000000) (bvslt (index!4646 lt!91700) (size!4020 (_keys!5708 thiss!1248))))) (or ((_ is Undefined!619) lt!91700) ((_ is Found!619) lt!91700) ((_ is MissingZero!619) lt!91700) (not ((_ is MissingVacant!619) lt!91700)) (and (bvsge (index!4649 lt!91700) #b00000000000000000000000000000000) (bvslt (index!4649 lt!91700) (size!4020 (_keys!5708 thiss!1248))))) (or ((_ is Undefined!619) lt!91700) (ite ((_ is Found!619) lt!91700) (= (select (arr!3704 (_keys!5708 thiss!1248)) (index!4647 lt!91700)) key!828) (ite ((_ is MissingZero!619) lt!91700) (= (select (arr!3704 (_keys!5708 thiss!1248)) (index!4646 lt!91700)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!619) lt!91700) (= (select (arr!3704 (_keys!5708 thiss!1248)) (index!4649 lt!91700)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55167 (= lt!91700 e!121917)))

(declare-fun c!33262 () Bool)

(assert (=> d!55167 (= c!33262 (and ((_ is Intermediate!619) lt!91698) (undefined!1431 lt!91698)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7843 (_ BitVec 32)) SeekEntryResult!619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55167 (= lt!91698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8871 thiss!1248)) key!828 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)))))

(assert (=> d!55167 (validMask!0 (mask!8871 thiss!1248))))

(assert (=> d!55167 (= (seekEntryOrOpen!0 key!828 (_keys!5708 thiss!1248) (mask!8871 thiss!1248)) lt!91700)))

(declare-fun b!185271 () Bool)

(assert (=> b!185271 (= e!121917 e!121918)))

(assert (=> b!185271 (= lt!91699 (select (arr!3704 (_keys!5708 thiss!1248)) (index!4648 lt!91698)))))

(declare-fun c!33263 () Bool)

(assert (=> b!185271 (= c!33263 (= lt!91699 key!828))))

(assert (= (and d!55167 c!33262) b!185272))

(assert (= (and d!55167 (not c!33262)) b!185271))

(assert (= (and b!185271 c!33263) b!185273))

(assert (= (and b!185271 (not c!33263)) b!185270))

(assert (= (and b!185270 c!33261) b!185274))

(assert (= (and b!185270 (not c!33261)) b!185275))

(declare-fun m!212709 () Bool)

(assert (=> b!185275 m!212709))

(declare-fun m!212711 () Bool)

(assert (=> d!55167 m!212711))

(assert (=> d!55167 m!212579))

(declare-fun m!212713 () Bool)

(assert (=> d!55167 m!212713))

(assert (=> d!55167 m!212711))

(declare-fun m!212715 () Bool)

(assert (=> d!55167 m!212715))

(declare-fun m!212717 () Bool)

(assert (=> d!55167 m!212717))

(declare-fun m!212719 () Bool)

(assert (=> d!55167 m!212719))

(declare-fun m!212721 () Bool)

(assert (=> b!185271 m!212721))

(assert (=> b!185093 d!55167))

(declare-fun mapIsEmpty!7452 () Bool)

(declare-fun mapRes!7452 () Bool)

(assert (=> mapIsEmpty!7452 mapRes!7452))

(declare-fun mapNonEmpty!7452 () Bool)

(declare-fun tp!16470 () Bool)

(declare-fun e!121924 () Bool)

(assert (=> mapNonEmpty!7452 (= mapRes!7452 (and tp!16470 e!121924))))

(declare-fun mapValue!7452 () ValueCell!1820)

(declare-fun mapKey!7452 () (_ BitVec 32))

(declare-fun mapRest!7452 () (Array (_ BitVec 32) ValueCell!1820))

(assert (=> mapNonEmpty!7452 (= mapRest!7443 (store mapRest!7452 mapKey!7452 mapValue!7452))))

(declare-fun b!185282 () Bool)

(assert (=> b!185282 (= e!121924 tp_is_empty!4327)))

(declare-fun b!185283 () Bool)

(declare-fun e!121923 () Bool)

(assert (=> b!185283 (= e!121923 tp_is_empty!4327)))

(declare-fun condMapEmpty!7452 () Bool)

(declare-fun mapDefault!7452 () ValueCell!1820)

(assert (=> mapNonEmpty!7443 (= condMapEmpty!7452 (= mapRest!7443 ((as const (Array (_ BitVec 32) ValueCell!1820)) mapDefault!7452)))))

(assert (=> mapNonEmpty!7443 (= tp!16454 (and e!121923 mapRes!7452))))

(assert (= (and mapNonEmpty!7443 condMapEmpty!7452) mapIsEmpty!7452))

(assert (= (and mapNonEmpty!7443 (not condMapEmpty!7452)) mapNonEmpty!7452))

(assert (= (and mapNonEmpty!7452 ((_ is ValueCellFull!1820) mapValue!7452)) b!185282))

(assert (= (and mapNonEmpty!7443 ((_ is ValueCellFull!1820) mapDefault!7452)) b!185283))

(declare-fun m!212723 () Bool)

(assert (=> mapNonEmpty!7452 m!212723))

(declare-fun b_lambda!7267 () Bool)

(assert (= b_lambda!7265 (or (and b!185099 b_free!4555) b_lambda!7267)))

(check-sat (not b!185245) (not b!185174) (not b!185240) (not bm!18669) (not bm!18666) (not b!185192) (not d!55157) (not bm!18668) (not mapNonEmpty!7452) (not b!185251) (not b!185190) (not d!55159) (not b!185244) (not b!185275) (not bm!18649) (not b!185183) (not b!185182) b_and!11171 (not b!185172) (not b!185247) (not d!55155) tp_is_empty!4327 (not b!185181) (not b!185249) (not b_lambda!7267) (not b!185254) (not b!185253) (not bm!18665) (not d!55167) (not b_next!4555))
(check-sat b_and!11171 (not b_next!4555))
