; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18440 () Bool)

(assert start!18440)

(declare-fun b!182945 () Bool)

(declare-fun b_free!4513 () Bool)

(declare-fun b_next!4513 () Bool)

(assert (=> b!182945 (= b_free!4513 (not b_next!4513))))

(declare-fun tp!16303 () Bool)

(declare-fun b_and!11093 () Bool)

(assert (=> b!182945 (= tp!16303 b_and!11093)))

(declare-fun b!182938 () Bool)

(declare-fun res!86598 () Bool)

(declare-fun e!120437 () Bool)

(assert (=> b!182938 (=> (not res!86598) (not e!120437))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182938 (= res!86598 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182939 () Bool)

(declare-fun e!120443 () Bool)

(assert (=> b!182939 (= e!120437 e!120443)))

(declare-fun res!86595 () Bool)

(assert (=> b!182939 (=> (not res!86595) (not e!120443))))

(declare-datatypes ((SeekEntryResult!603 0))(
  ( (MissingZero!603 (index!4582 (_ BitVec 32))) (Found!603 (index!4583 (_ BitVec 32))) (Intermediate!603 (undefined!1415 Bool) (index!4584 (_ BitVec 32)) (x!19921 (_ BitVec 32))) (Undefined!603) (MissingVacant!603 (index!4585 (_ BitVec 32))) )
))
(declare-fun lt!90477 () SeekEntryResult!603)

(get-info :version)

(assert (=> b!182939 (= res!86595 (and (not ((_ is Undefined!603) lt!90477)) (not ((_ is MissingVacant!603) lt!90477)) (not ((_ is MissingZero!603) lt!90477)) ((_ is Found!603) lt!90477)))))

(declare-datatypes ((V!5361 0))(
  ( (V!5362 (val!2187 Int)) )
))
(declare-datatypes ((ValueCell!1799 0))(
  ( (ValueCellFull!1799 (v!4089 V!5361)) (EmptyCell!1799) )
))
(declare-datatypes ((array!7745 0))(
  ( (array!7746 (arr!3662 (Array (_ BitVec 32) (_ BitVec 64))) (size!3974 (_ BitVec 32))) )
))
(declare-datatypes ((array!7747 0))(
  ( (array!7748 (arr!3663 (Array (_ BitVec 32) ValueCell!1799)) (size!3975 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2506 0))(
  ( (LongMapFixedSize!2507 (defaultEntry!3741 Int) (mask!8794 (_ BitVec 32)) (extraKeys!3478 (_ BitVec 32)) (zeroValue!3582 V!5361) (minValue!3582 V!5361) (_size!1302 (_ BitVec 32)) (_keys!5656 array!7745) (_values!3724 array!7747) (_vacant!1302 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2506)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7745 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!182939 (= lt!90477 (seekEntryOrOpen!0 key!828 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!182940 () Bool)

(declare-fun res!86599 () Bool)

(assert (=> b!182940 (=> (not res!86599) (not e!120443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7745 (_ BitVec 32)) Bool)

(assert (=> b!182940 (= res!86599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!182941 () Bool)

(declare-fun res!86597 () Bool)

(assert (=> b!182941 (=> (not res!86597) (not e!120443))))

(declare-datatypes ((tuple2!3352 0))(
  ( (tuple2!3353 (_1!1687 (_ BitVec 64)) (_2!1687 V!5361)) )
))
(declare-datatypes ((List!2292 0))(
  ( (Nil!2289) (Cons!2288 (h!2917 tuple2!3352) (t!7148 List!2292)) )
))
(declare-datatypes ((ListLongMap!2273 0))(
  ( (ListLongMap!2274 (toList!1152 List!2292)) )
))
(declare-fun contains!1249 (ListLongMap!2273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!804 (array!7745 array!7747 (_ BitVec 32) (_ BitVec 32) V!5361 V!5361 (_ BitVec 32) Int) ListLongMap!2273)

(assert (=> b!182941 (= res!86597 (contains!1249 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7355 () Bool)

(declare-fun mapRes!7355 () Bool)

(declare-fun tp!16304 () Bool)

(declare-fun e!120438 () Bool)

(assert (=> mapNonEmpty!7355 (= mapRes!7355 (and tp!16304 e!120438))))

(declare-fun mapKey!7355 () (_ BitVec 32))

(declare-fun mapValue!7355 () ValueCell!1799)

(declare-fun mapRest!7355 () (Array (_ BitVec 32) ValueCell!1799))

(assert (=> mapNonEmpty!7355 (= (arr!3663 (_values!3724 thiss!1248)) (store mapRest!7355 mapKey!7355 mapValue!7355))))

(declare-fun b!182942 () Bool)

(declare-fun e!120440 () Bool)

(declare-fun tp_is_empty!4285 () Bool)

(assert (=> b!182942 (= e!120440 tp_is_empty!4285)))

(declare-fun b!182943 () Bool)

(assert (=> b!182943 (= e!120438 tp_is_empty!4285)))

(declare-fun mapIsEmpty!7355 () Bool)

(assert (=> mapIsEmpty!7355 mapRes!7355))

(declare-fun res!86601 () Bool)

(assert (=> start!18440 (=> (not res!86601) (not e!120437))))

(declare-fun valid!1060 (LongMapFixedSize!2506) Bool)

(assert (=> start!18440 (= res!86601 (valid!1060 thiss!1248))))

(assert (=> start!18440 e!120437))

(declare-fun e!120441 () Bool)

(assert (=> start!18440 e!120441))

(assert (=> start!18440 true))

(declare-fun b!182944 () Bool)

(declare-fun res!86596 () Bool)

(assert (=> b!182944 (=> (not res!86596) (not e!120443))))

(assert (=> b!182944 (= res!86596 (and (= (size!3975 (_values!3724 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8794 thiss!1248))) (= (size!3974 (_keys!5656 thiss!1248)) (size!3975 (_values!3724 thiss!1248))) (bvsge (mask!8794 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3478 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3478 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!120442 () Bool)

(declare-fun array_inv!2365 (array!7745) Bool)

(declare-fun array_inv!2366 (array!7747) Bool)

(assert (=> b!182945 (= e!120441 (and tp!16303 tp_is_empty!4285 (array_inv!2365 (_keys!5656 thiss!1248)) (array_inv!2366 (_values!3724 thiss!1248)) e!120442))))

(declare-fun b!182946 () Bool)

(declare-fun res!86594 () Bool)

(assert (=> b!182946 (=> (not res!86594) (not e!120443))))

(declare-datatypes ((List!2293 0))(
  ( (Nil!2290) (Cons!2289 (h!2918 (_ BitVec 64)) (t!7149 List!2293)) )
))
(declare-fun arrayNoDuplicates!0 (array!7745 (_ BitVec 32) List!2293) Bool)

(assert (=> b!182946 (= res!86594 (arrayNoDuplicates!0 (_keys!5656 thiss!1248) #b00000000000000000000000000000000 Nil!2290))))

(declare-fun b!182947 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182947 (= e!120443 (not (validKeyInArray!0 key!828)))))

(declare-fun b!182948 () Bool)

(assert (=> b!182948 (= e!120442 (and e!120440 mapRes!7355))))

(declare-fun condMapEmpty!7355 () Bool)

(declare-fun mapDefault!7355 () ValueCell!1799)

(assert (=> b!182948 (= condMapEmpty!7355 (= (arr!3663 (_values!3724 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1799)) mapDefault!7355)))))

(declare-fun b!182949 () Bool)

(declare-fun res!86600 () Bool)

(assert (=> b!182949 (=> (not res!86600) (not e!120443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182949 (= res!86600 (validMask!0 (mask!8794 thiss!1248)))))

(assert (= (and start!18440 res!86601) b!182938))

(assert (= (and b!182938 res!86598) b!182939))

(assert (= (and b!182939 res!86595) b!182941))

(assert (= (and b!182941 res!86597) b!182949))

(assert (= (and b!182949 res!86600) b!182944))

(assert (= (and b!182944 res!86596) b!182940))

(assert (= (and b!182940 res!86599) b!182946))

(assert (= (and b!182946 res!86594) b!182947))

(assert (= (and b!182948 condMapEmpty!7355) mapIsEmpty!7355))

(assert (= (and b!182948 (not condMapEmpty!7355)) mapNonEmpty!7355))

(assert (= (and mapNonEmpty!7355 ((_ is ValueCellFull!1799) mapValue!7355)) b!182943))

(assert (= (and b!182948 ((_ is ValueCellFull!1799) mapDefault!7355)) b!182942))

(assert (= b!182945 b!182948))

(assert (= start!18440 b!182945))

(declare-fun m!210711 () Bool)

(assert (=> b!182946 m!210711))

(declare-fun m!210713 () Bool)

(assert (=> mapNonEmpty!7355 m!210713))

(declare-fun m!210715 () Bool)

(assert (=> b!182945 m!210715))

(declare-fun m!210717 () Bool)

(assert (=> b!182945 m!210717))

(declare-fun m!210719 () Bool)

(assert (=> start!18440 m!210719))

(declare-fun m!210721 () Bool)

(assert (=> b!182949 m!210721))

(declare-fun m!210723 () Bool)

(assert (=> b!182940 m!210723))

(declare-fun m!210725 () Bool)

(assert (=> b!182947 m!210725))

(declare-fun m!210727 () Bool)

(assert (=> b!182941 m!210727))

(assert (=> b!182941 m!210727))

(declare-fun m!210729 () Bool)

(assert (=> b!182941 m!210729))

(declare-fun m!210731 () Bool)

(assert (=> b!182939 m!210731))

(check-sat (not b!182946) (not start!18440) b_and!11093 (not b!182947) (not mapNonEmpty!7355) (not b_next!4513) (not b!182940) (not b!182941) (not b!182949) (not b!182945) (not b!182939) tp_is_empty!4285)
(check-sat b_and!11093 (not b_next!4513))
(get-model)

(declare-fun b!183030 () Bool)

(declare-fun e!120492 () Bool)

(declare-fun call!18451 () Bool)

(assert (=> b!183030 (= e!120492 call!18451)))

(declare-fun b!183031 () Bool)

(declare-fun e!120494 () Bool)

(assert (=> b!183031 (= e!120494 e!120492)))

(declare-fun c!32797 () Bool)

(assert (=> b!183031 (= c!32797 (validKeyInArray!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54739 () Bool)

(declare-fun res!86654 () Bool)

(assert (=> d!54739 (=> res!86654 e!120494)))

(assert (=> d!54739 (= res!86654 (bvsge #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(assert (=> d!54739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)) e!120494)))

(declare-fun bm!18448 () Bool)

(assert (=> bm!18448 (= call!18451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!183032 () Bool)

(declare-fun e!120493 () Bool)

(assert (=> b!183032 (= e!120492 e!120493)))

(declare-fun lt!90491 () (_ BitVec 64))

(assert (=> b!183032 (= lt!90491 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5540 0))(
  ( (Unit!5541) )
))
(declare-fun lt!90490 () Unit!5540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7745 (_ BitVec 64) (_ BitVec 32)) Unit!5540)

(assert (=> b!183032 (= lt!90490 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5656 thiss!1248) lt!90491 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183032 (arrayContainsKey!0 (_keys!5656 thiss!1248) lt!90491 #b00000000000000000000000000000000)))

(declare-fun lt!90492 () Unit!5540)

(assert (=> b!183032 (= lt!90492 lt!90490)))

(declare-fun res!86655 () Bool)

(assert (=> b!183032 (= res!86655 (= (seekEntryOrOpen!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000) (_keys!5656 thiss!1248) (mask!8794 thiss!1248)) (Found!603 #b00000000000000000000000000000000)))))

(assert (=> b!183032 (=> (not res!86655) (not e!120493))))

(declare-fun b!183033 () Bool)

(assert (=> b!183033 (= e!120493 call!18451)))

(assert (= (and d!54739 (not res!86654)) b!183031))

(assert (= (and b!183031 c!32797) b!183032))

(assert (= (and b!183031 (not c!32797)) b!183030))

(assert (= (and b!183032 res!86655) b!183033))

(assert (= (or b!183033 b!183030) bm!18448))

(declare-fun m!210777 () Bool)

(assert (=> b!183031 m!210777))

(assert (=> b!183031 m!210777))

(declare-fun m!210779 () Bool)

(assert (=> b!183031 m!210779))

(declare-fun m!210781 () Bool)

(assert (=> bm!18448 m!210781))

(assert (=> b!183032 m!210777))

(declare-fun m!210783 () Bool)

(assert (=> b!183032 m!210783))

(declare-fun m!210785 () Bool)

(assert (=> b!183032 m!210785))

(assert (=> b!183032 m!210777))

(declare-fun m!210787 () Bool)

(assert (=> b!183032 m!210787))

(assert (=> b!182940 d!54739))

(declare-fun b!183046 () Bool)

(declare-fun c!32805 () Bool)

(declare-fun lt!90500 () (_ BitVec 64))

(assert (=> b!183046 (= c!32805 (= lt!90500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120502 () SeekEntryResult!603)

(declare-fun e!120503 () SeekEntryResult!603)

(assert (=> b!183046 (= e!120502 e!120503)))

(declare-fun lt!90501 () SeekEntryResult!603)

(declare-fun b!183047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7745 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!183047 (= e!120503 (seekKeyOrZeroReturnVacant!0 (x!19921 lt!90501) (index!4584 lt!90501) (index!4584 lt!90501) key!828 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!183048 () Bool)

(declare-fun e!120501 () SeekEntryResult!603)

(assert (=> b!183048 (= e!120501 Undefined!603)))

(declare-fun d!54741 () Bool)

(declare-fun lt!90499 () SeekEntryResult!603)

(assert (=> d!54741 (and (or ((_ is Undefined!603) lt!90499) (not ((_ is Found!603) lt!90499)) (and (bvsge (index!4583 lt!90499) #b00000000000000000000000000000000) (bvslt (index!4583 lt!90499) (size!3974 (_keys!5656 thiss!1248))))) (or ((_ is Undefined!603) lt!90499) ((_ is Found!603) lt!90499) (not ((_ is MissingZero!603) lt!90499)) (and (bvsge (index!4582 lt!90499) #b00000000000000000000000000000000) (bvslt (index!4582 lt!90499) (size!3974 (_keys!5656 thiss!1248))))) (or ((_ is Undefined!603) lt!90499) ((_ is Found!603) lt!90499) ((_ is MissingZero!603) lt!90499) (not ((_ is MissingVacant!603) lt!90499)) (and (bvsge (index!4585 lt!90499) #b00000000000000000000000000000000) (bvslt (index!4585 lt!90499) (size!3974 (_keys!5656 thiss!1248))))) (or ((_ is Undefined!603) lt!90499) (ite ((_ is Found!603) lt!90499) (= (select (arr!3662 (_keys!5656 thiss!1248)) (index!4583 lt!90499)) key!828) (ite ((_ is MissingZero!603) lt!90499) (= (select (arr!3662 (_keys!5656 thiss!1248)) (index!4582 lt!90499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!603) lt!90499) (= (select (arr!3662 (_keys!5656 thiss!1248)) (index!4585 lt!90499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54741 (= lt!90499 e!120501)))

(declare-fun c!32806 () Bool)

(assert (=> d!54741 (= c!32806 (and ((_ is Intermediate!603) lt!90501) (undefined!1415 lt!90501)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7745 (_ BitVec 32)) SeekEntryResult!603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54741 (= lt!90501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8794 thiss!1248)) key!828 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(assert (=> d!54741 (validMask!0 (mask!8794 thiss!1248))))

(assert (=> d!54741 (= (seekEntryOrOpen!0 key!828 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)) lt!90499)))

(declare-fun b!183049 () Bool)

(assert (=> b!183049 (= e!120502 (Found!603 (index!4584 lt!90501)))))

(declare-fun b!183050 () Bool)

(assert (=> b!183050 (= e!120501 e!120502)))

(assert (=> b!183050 (= lt!90500 (select (arr!3662 (_keys!5656 thiss!1248)) (index!4584 lt!90501)))))

(declare-fun c!32804 () Bool)

(assert (=> b!183050 (= c!32804 (= lt!90500 key!828))))

(declare-fun b!183051 () Bool)

(assert (=> b!183051 (= e!120503 (MissingZero!603 (index!4584 lt!90501)))))

(assert (= (and d!54741 c!32806) b!183048))

(assert (= (and d!54741 (not c!32806)) b!183050))

(assert (= (and b!183050 c!32804) b!183049))

(assert (= (and b!183050 (not c!32804)) b!183046))

(assert (= (and b!183046 c!32805) b!183051))

(assert (= (and b!183046 (not c!32805)) b!183047))

(declare-fun m!210789 () Bool)

(assert (=> b!183047 m!210789))

(declare-fun m!210791 () Bool)

(assert (=> d!54741 m!210791))

(assert (=> d!54741 m!210721))

(declare-fun m!210793 () Bool)

(assert (=> d!54741 m!210793))

(declare-fun m!210795 () Bool)

(assert (=> d!54741 m!210795))

(declare-fun m!210797 () Bool)

(assert (=> d!54741 m!210797))

(assert (=> d!54741 m!210793))

(declare-fun m!210799 () Bool)

(assert (=> d!54741 m!210799))

(declare-fun m!210801 () Bool)

(assert (=> b!183050 m!210801))

(assert (=> b!182939 d!54741))

(declare-fun d!54743 () Bool)

(declare-fun e!120508 () Bool)

(assert (=> d!54743 e!120508))

(declare-fun res!86658 () Bool)

(assert (=> d!54743 (=> res!86658 e!120508)))

(declare-fun lt!90511 () Bool)

(assert (=> d!54743 (= res!86658 (not lt!90511))))

(declare-fun lt!90513 () Bool)

(assert (=> d!54743 (= lt!90511 lt!90513)))

(declare-fun lt!90510 () Unit!5540)

(declare-fun e!120509 () Unit!5540)

(assert (=> d!54743 (= lt!90510 e!120509)))

(declare-fun c!32809 () Bool)

(assert (=> d!54743 (= c!32809 lt!90513)))

(declare-fun containsKey!218 (List!2292 (_ BitVec 64)) Bool)

(assert (=> d!54743 (= lt!90513 (containsKey!218 (toList!1152 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(assert (=> d!54743 (= (contains!1249 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) key!828) lt!90511)))

(declare-fun b!183058 () Bool)

(declare-fun lt!90512 () Unit!5540)

(assert (=> b!183058 (= e!120509 lt!90512)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!166 (List!2292 (_ BitVec 64)) Unit!5540)

(assert (=> b!183058 (= lt!90512 (lemmaContainsKeyImpliesGetValueByKeyDefined!166 (toList!1152 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(declare-datatypes ((Option!221 0))(
  ( (Some!220 (v!4092 V!5361)) (None!219) )
))
(declare-fun isDefined!167 (Option!221) Bool)

(declare-fun getValueByKey!215 (List!2292 (_ BitVec 64)) Option!221)

(assert (=> b!183058 (isDefined!167 (getValueByKey!215 (toList!1152 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828))))

(declare-fun b!183059 () Bool)

(declare-fun Unit!5542 () Unit!5540)

(assert (=> b!183059 (= e!120509 Unit!5542)))

(declare-fun b!183060 () Bool)

(assert (=> b!183060 (= e!120508 (isDefined!167 (getValueByKey!215 (toList!1152 (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248))) key!828)))))

(assert (= (and d!54743 c!32809) b!183058))

(assert (= (and d!54743 (not c!32809)) b!183059))

(assert (= (and d!54743 (not res!86658)) b!183060))

(declare-fun m!210803 () Bool)

(assert (=> d!54743 m!210803))

(declare-fun m!210805 () Bool)

(assert (=> b!183058 m!210805))

(declare-fun m!210807 () Bool)

(assert (=> b!183058 m!210807))

(assert (=> b!183058 m!210807))

(declare-fun m!210809 () Bool)

(assert (=> b!183058 m!210809))

(assert (=> b!183060 m!210807))

(assert (=> b!183060 m!210807))

(assert (=> b!183060 m!210809))

(assert (=> b!182941 d!54743))

(declare-fun b!183104 () Bool)

(declare-fun res!86677 () Bool)

(declare-fun e!120538 () Bool)

(assert (=> b!183104 (=> (not res!86677) (not e!120538))))

(declare-fun e!120543 () Bool)

(assert (=> b!183104 (= res!86677 e!120543)))

(declare-fun res!86680 () Bool)

(assert (=> b!183104 (=> res!86680 e!120543)))

(declare-fun e!120540 () Bool)

(assert (=> b!183104 (= res!86680 (not e!120540))))

(declare-fun res!86681 () Bool)

(assert (=> b!183104 (=> (not res!86681) (not e!120540))))

(assert (=> b!183104 (= res!86681 (bvslt #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(declare-fun bm!18463 () Bool)

(declare-fun call!18466 () ListLongMap!2273)

(declare-fun getCurrentListMapNoExtraKeys!188 (array!7745 array!7747 (_ BitVec 32) (_ BitVec 32) V!5361 V!5361 (_ BitVec 32) Int) ListLongMap!2273)

(assert (=> bm!18463 (= call!18466 (getCurrentListMapNoExtraKeys!188 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun b!183105 () Bool)

(declare-fun e!120536 () Unit!5540)

(declare-fun lt!90577 () Unit!5540)

(assert (=> b!183105 (= e!120536 lt!90577)))

(declare-fun lt!90565 () ListLongMap!2273)

(assert (=> b!183105 (= lt!90565 (getCurrentListMapNoExtraKeys!188 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90561 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90567 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90567 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90568 () Unit!5540)

(declare-fun addStillContains!133 (ListLongMap!2273 (_ BitVec 64) V!5361 (_ BitVec 64)) Unit!5540)

(assert (=> b!183105 (= lt!90568 (addStillContains!133 lt!90565 lt!90561 (zeroValue!3582 thiss!1248) lt!90567))))

(declare-fun +!277 (ListLongMap!2273 tuple2!3352) ListLongMap!2273)

(assert (=> b!183105 (contains!1249 (+!277 lt!90565 (tuple2!3353 lt!90561 (zeroValue!3582 thiss!1248))) lt!90567)))

(declare-fun lt!90562 () Unit!5540)

(assert (=> b!183105 (= lt!90562 lt!90568)))

(declare-fun lt!90572 () ListLongMap!2273)

(assert (=> b!183105 (= lt!90572 (getCurrentListMapNoExtraKeys!188 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90558 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90564 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90564 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90571 () Unit!5540)

(declare-fun addApplyDifferent!133 (ListLongMap!2273 (_ BitVec 64) V!5361 (_ BitVec 64)) Unit!5540)

(assert (=> b!183105 (= lt!90571 (addApplyDifferent!133 lt!90572 lt!90558 (minValue!3582 thiss!1248) lt!90564))))

(declare-fun apply!157 (ListLongMap!2273 (_ BitVec 64)) V!5361)

(assert (=> b!183105 (= (apply!157 (+!277 lt!90572 (tuple2!3353 lt!90558 (minValue!3582 thiss!1248))) lt!90564) (apply!157 lt!90572 lt!90564))))

(declare-fun lt!90566 () Unit!5540)

(assert (=> b!183105 (= lt!90566 lt!90571)))

(declare-fun lt!90569 () ListLongMap!2273)

(assert (=> b!183105 (= lt!90569 (getCurrentListMapNoExtraKeys!188 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90574 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90560 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90560 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90570 () Unit!5540)

(assert (=> b!183105 (= lt!90570 (addApplyDifferent!133 lt!90569 lt!90574 (zeroValue!3582 thiss!1248) lt!90560))))

(assert (=> b!183105 (= (apply!157 (+!277 lt!90569 (tuple2!3353 lt!90574 (zeroValue!3582 thiss!1248))) lt!90560) (apply!157 lt!90569 lt!90560))))

(declare-fun lt!90575 () Unit!5540)

(assert (=> b!183105 (= lt!90575 lt!90570)))

(declare-fun lt!90573 () ListLongMap!2273)

(assert (=> b!183105 (= lt!90573 (getCurrentListMapNoExtraKeys!188 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)))))

(declare-fun lt!90578 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90579 () (_ BitVec 64))

(assert (=> b!183105 (= lt!90579 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183105 (= lt!90577 (addApplyDifferent!133 lt!90573 lt!90578 (minValue!3582 thiss!1248) lt!90579))))

(assert (=> b!183105 (= (apply!157 (+!277 lt!90573 (tuple2!3353 lt!90578 (minValue!3582 thiss!1248))) lt!90579) (apply!157 lt!90573 lt!90579))))

(declare-fun b!183106 () Bool)

(declare-fun e!120548 () Bool)

(declare-fun call!18469 () Bool)

(assert (=> b!183106 (= e!120548 (not call!18469))))

(declare-fun b!183107 () Bool)

(declare-fun e!120547 () ListLongMap!2273)

(declare-fun call!18468 () ListLongMap!2273)

(assert (=> b!183107 (= e!120547 call!18468)))

(declare-fun b!183108 () Bool)

(declare-fun e!120542 () Bool)

(declare-fun lt!90563 () ListLongMap!2273)

(declare-fun get!2108 (ValueCell!1799 V!5361) V!5361)

(declare-fun dynLambda!500 (Int (_ BitVec 64)) V!5361)

(assert (=> b!183108 (= e!120542 (= (apply!157 lt!90563 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)) (get!2108 (select (arr!3663 (_values!3724 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!500 (defaultEntry!3741 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3975 (_values!3724 thiss!1248))))))

(assert (=> b!183108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(declare-fun b!183109 () Bool)

(declare-fun e!120541 () Bool)

(declare-fun e!120539 () Bool)

(assert (=> b!183109 (= e!120541 e!120539)))

(declare-fun res!86678 () Bool)

(declare-fun call!18470 () Bool)

(assert (=> b!183109 (= res!86678 call!18470)))

(assert (=> b!183109 (=> (not res!86678) (not e!120539))))

(declare-fun bm!18464 () Bool)

(declare-fun call!18472 () ListLongMap!2273)

(assert (=> bm!18464 (= call!18472 call!18466)))

(declare-fun b!183110 () Bool)

(declare-fun c!32826 () Bool)

(assert (=> b!183110 (= c!32826 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120544 () ListLongMap!2273)

(assert (=> b!183110 (= e!120547 e!120544)))

(declare-fun bm!18465 () Bool)

(declare-fun call!18467 () ListLongMap!2273)

(assert (=> bm!18465 (= call!18468 call!18467)))

(declare-fun d!54745 () Bool)

(assert (=> d!54745 e!120538))

(declare-fun res!86682 () Bool)

(assert (=> d!54745 (=> (not res!86682) (not e!120538))))

(assert (=> d!54745 (= res!86682 (or (bvsge #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))))

(declare-fun lt!90576 () ListLongMap!2273)

(assert (=> d!54745 (= lt!90563 lt!90576)))

(declare-fun lt!90559 () Unit!5540)

(assert (=> d!54745 (= lt!90559 e!120536)))

(declare-fun c!32825 () Bool)

(declare-fun e!120537 () Bool)

(assert (=> d!54745 (= c!32825 e!120537)))

(declare-fun res!86683 () Bool)

(assert (=> d!54745 (=> (not res!86683) (not e!120537))))

(assert (=> d!54745 (= res!86683 (bvslt #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(declare-fun e!120546 () ListLongMap!2273)

(assert (=> d!54745 (= lt!90576 e!120546)))

(declare-fun c!32827 () Bool)

(assert (=> d!54745 (= c!32827 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54745 (validMask!0 (mask!8794 thiss!1248))))

(assert (=> d!54745 (= (getCurrentListMap!804 (_keys!5656 thiss!1248) (_values!3724 thiss!1248) (mask!8794 thiss!1248) (extraKeys!3478 thiss!1248) (zeroValue!3582 thiss!1248) (minValue!3582 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3741 thiss!1248)) lt!90563)))

(declare-fun b!183103 () Bool)

(declare-fun e!120545 () Bool)

(assert (=> b!183103 (= e!120548 e!120545)))

(declare-fun res!86684 () Bool)

(assert (=> b!183103 (= res!86684 call!18469)))

(assert (=> b!183103 (=> (not res!86684) (not e!120545))))

(declare-fun b!183111 () Bool)

(assert (=> b!183111 (= e!120538 e!120541)))

(declare-fun c!32823 () Bool)

(assert (=> b!183111 (= c!32823 (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183112 () Bool)

(assert (=> b!183112 (= e!120546 (+!277 call!18467 (tuple2!3353 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3582 thiss!1248))))))

(declare-fun bm!18466 () Bool)

(declare-fun call!18471 () ListLongMap!2273)

(assert (=> bm!18466 (= call!18471 call!18472)))

(declare-fun b!183113 () Bool)

(declare-fun res!86685 () Bool)

(assert (=> b!183113 (=> (not res!86685) (not e!120538))))

(assert (=> b!183113 (= res!86685 e!120548)))

(declare-fun c!32822 () Bool)

(assert (=> b!183113 (= c!32822 (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183114 () Bool)

(assert (=> b!183114 (= e!120544 call!18471)))

(declare-fun b!183115 () Bool)

(assert (=> b!183115 (= e!120540 (validKeyInArray!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183116 () Bool)

(assert (=> b!183116 (= e!120545 (= (apply!157 lt!90563 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3582 thiss!1248)))))

(declare-fun b!183117 () Bool)

(assert (=> b!183117 (= e!120541 (not call!18470))))

(declare-fun bm!18467 () Bool)

(declare-fun c!32824 () Bool)

(assert (=> bm!18467 (= call!18467 (+!277 (ite c!32827 call!18466 (ite c!32824 call!18472 call!18471)) (ite (or c!32827 c!32824) (tuple2!3353 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3582 thiss!1248)) (tuple2!3353 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3582 thiss!1248)))))))

(declare-fun b!183118 () Bool)

(assert (=> b!183118 (= e!120539 (= (apply!157 lt!90563 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3582 thiss!1248)))))

(declare-fun b!183119 () Bool)

(assert (=> b!183119 (= e!120537 (validKeyInArray!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183120 () Bool)

(assert (=> b!183120 (= e!120546 e!120547)))

(assert (=> b!183120 (= c!32824 (and (not (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3478 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18468 () Bool)

(assert (=> bm!18468 (= call!18469 (contains!1249 lt!90563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18469 () Bool)

(assert (=> bm!18469 (= call!18470 (contains!1249 lt!90563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183121 () Bool)

(assert (=> b!183121 (= e!120543 e!120542)))

(declare-fun res!86679 () Bool)

(assert (=> b!183121 (=> (not res!86679) (not e!120542))))

(assert (=> b!183121 (= res!86679 (contains!1249 lt!90563 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(declare-fun b!183122 () Bool)

(declare-fun Unit!5543 () Unit!5540)

(assert (=> b!183122 (= e!120536 Unit!5543)))

(declare-fun b!183123 () Bool)

(assert (=> b!183123 (= e!120544 call!18468)))

(assert (= (and d!54745 c!32827) b!183112))

(assert (= (and d!54745 (not c!32827)) b!183120))

(assert (= (and b!183120 c!32824) b!183107))

(assert (= (and b!183120 (not c!32824)) b!183110))

(assert (= (and b!183110 c!32826) b!183123))

(assert (= (and b!183110 (not c!32826)) b!183114))

(assert (= (or b!183123 b!183114) bm!18466))

(assert (= (or b!183107 bm!18466) bm!18464))

(assert (= (or b!183107 b!183123) bm!18465))

(assert (= (or b!183112 bm!18464) bm!18463))

(assert (= (or b!183112 bm!18465) bm!18467))

(assert (= (and d!54745 res!86683) b!183119))

(assert (= (and d!54745 c!32825) b!183105))

(assert (= (and d!54745 (not c!32825)) b!183122))

(assert (= (and d!54745 res!86682) b!183104))

(assert (= (and b!183104 res!86681) b!183115))

(assert (= (and b!183104 (not res!86680)) b!183121))

(assert (= (and b!183121 res!86679) b!183108))

(assert (= (and b!183104 res!86677) b!183113))

(assert (= (and b!183113 c!32822) b!183103))

(assert (= (and b!183113 (not c!32822)) b!183106))

(assert (= (and b!183103 res!86684) b!183116))

(assert (= (or b!183103 b!183106) bm!18468))

(assert (= (and b!183113 res!86685) b!183111))

(assert (= (and b!183111 c!32823) b!183109))

(assert (= (and b!183111 (not c!32823)) b!183117))

(assert (= (and b!183109 res!86678) b!183118))

(assert (= (or b!183109 b!183117) bm!18469))

(declare-fun b_lambda!7205 () Bool)

(assert (=> (not b_lambda!7205) (not b!183108)))

(declare-fun t!7154 () Bool)

(declare-fun tb!2817 () Bool)

(assert (=> (and b!182945 (= (defaultEntry!3741 thiss!1248) (defaultEntry!3741 thiss!1248)) t!7154) tb!2817))

(declare-fun result!4745 () Bool)

(assert (=> tb!2817 (= result!4745 tp_is_empty!4285)))

(assert (=> b!183108 t!7154))

(declare-fun b_and!11099 () Bool)

(assert (= b_and!11093 (and (=> t!7154 result!4745) b_and!11099)))

(declare-fun m!210811 () Bool)

(assert (=> b!183118 m!210811))

(declare-fun m!210813 () Bool)

(assert (=> b!183112 m!210813))

(declare-fun m!210815 () Bool)

(assert (=> bm!18469 m!210815))

(declare-fun m!210817 () Bool)

(assert (=> b!183116 m!210817))

(assert (=> b!183119 m!210777))

(assert (=> b!183119 m!210777))

(assert (=> b!183119 m!210779))

(declare-fun m!210819 () Bool)

(assert (=> b!183108 m!210819))

(assert (=> b!183108 m!210777))

(declare-fun m!210821 () Bool)

(assert (=> b!183108 m!210821))

(declare-fun m!210823 () Bool)

(assert (=> b!183108 m!210823))

(assert (=> b!183108 m!210819))

(assert (=> b!183108 m!210823))

(declare-fun m!210825 () Bool)

(assert (=> b!183108 m!210825))

(assert (=> b!183108 m!210777))

(declare-fun m!210827 () Bool)

(assert (=> b!183105 m!210827))

(declare-fun m!210829 () Bool)

(assert (=> b!183105 m!210829))

(declare-fun m!210831 () Bool)

(assert (=> b!183105 m!210831))

(declare-fun m!210833 () Bool)

(assert (=> b!183105 m!210833))

(declare-fun m!210835 () Bool)

(assert (=> b!183105 m!210835))

(declare-fun m!210837 () Bool)

(assert (=> b!183105 m!210837))

(declare-fun m!210839 () Bool)

(assert (=> b!183105 m!210839))

(assert (=> b!183105 m!210777))

(declare-fun m!210841 () Bool)

(assert (=> b!183105 m!210841))

(assert (=> b!183105 m!210831))

(declare-fun m!210843 () Bool)

(assert (=> b!183105 m!210843))

(declare-fun m!210845 () Bool)

(assert (=> b!183105 m!210845))

(declare-fun m!210847 () Bool)

(assert (=> b!183105 m!210847))

(declare-fun m!210849 () Bool)

(assert (=> b!183105 m!210849))

(assert (=> b!183105 m!210837))

(declare-fun m!210851 () Bool)

(assert (=> b!183105 m!210851))

(declare-fun m!210853 () Bool)

(assert (=> b!183105 m!210853))

(assert (=> b!183105 m!210835))

(declare-fun m!210855 () Bool)

(assert (=> b!183105 m!210855))

(declare-fun m!210857 () Bool)

(assert (=> b!183105 m!210857))

(assert (=> b!183105 m!210851))

(declare-fun m!210859 () Bool)

(assert (=> bm!18468 m!210859))

(assert (=> b!183121 m!210777))

(assert (=> b!183121 m!210777))

(declare-fun m!210861 () Bool)

(assert (=> b!183121 m!210861))

(assert (=> d!54745 m!210721))

(declare-fun m!210863 () Bool)

(assert (=> bm!18467 m!210863))

(assert (=> bm!18463 m!210827))

(assert (=> b!183115 m!210777))

(assert (=> b!183115 m!210777))

(assert (=> b!183115 m!210779))

(assert (=> b!182941 d!54745))

(declare-fun d!54747 () Bool)

(assert (=> d!54747 (= (validMask!0 (mask!8794 thiss!1248)) (and (or (= (mask!8794 thiss!1248) #b00000000000000000000000000000111) (= (mask!8794 thiss!1248) #b00000000000000000000000000001111) (= (mask!8794 thiss!1248) #b00000000000000000000000000011111) (= (mask!8794 thiss!1248) #b00000000000000000000000000111111) (= (mask!8794 thiss!1248) #b00000000000000000000000001111111) (= (mask!8794 thiss!1248) #b00000000000000000000000011111111) (= (mask!8794 thiss!1248) #b00000000000000000000000111111111) (= (mask!8794 thiss!1248) #b00000000000000000000001111111111) (= (mask!8794 thiss!1248) #b00000000000000000000011111111111) (= (mask!8794 thiss!1248) #b00000000000000000000111111111111) (= (mask!8794 thiss!1248) #b00000000000000000001111111111111) (= (mask!8794 thiss!1248) #b00000000000000000011111111111111) (= (mask!8794 thiss!1248) #b00000000000000000111111111111111) (= (mask!8794 thiss!1248) #b00000000000000001111111111111111) (= (mask!8794 thiss!1248) #b00000000000000011111111111111111) (= (mask!8794 thiss!1248) #b00000000000000111111111111111111) (= (mask!8794 thiss!1248) #b00000000000001111111111111111111) (= (mask!8794 thiss!1248) #b00000000000011111111111111111111) (= (mask!8794 thiss!1248) #b00000000000111111111111111111111) (= (mask!8794 thiss!1248) #b00000000001111111111111111111111) (= (mask!8794 thiss!1248) #b00000000011111111111111111111111) (= (mask!8794 thiss!1248) #b00000000111111111111111111111111) (= (mask!8794 thiss!1248) #b00000001111111111111111111111111) (= (mask!8794 thiss!1248) #b00000011111111111111111111111111) (= (mask!8794 thiss!1248) #b00000111111111111111111111111111) (= (mask!8794 thiss!1248) #b00001111111111111111111111111111) (= (mask!8794 thiss!1248) #b00011111111111111111111111111111) (= (mask!8794 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8794 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182949 d!54747))

(declare-fun b!183136 () Bool)

(declare-fun e!120559 () Bool)

(declare-fun call!18475 () Bool)

(assert (=> b!183136 (= e!120559 call!18475)))

(declare-fun b!183137 () Bool)

(declare-fun e!120557 () Bool)

(declare-fun contains!1251 (List!2293 (_ BitVec 64)) Bool)

(assert (=> b!183137 (= e!120557 (contains!1251 Nil!2290 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183138 () Bool)

(declare-fun e!120560 () Bool)

(declare-fun e!120558 () Bool)

(assert (=> b!183138 (= e!120560 e!120558)))

(declare-fun res!86694 () Bool)

(assert (=> b!183138 (=> (not res!86694) (not e!120558))))

(assert (=> b!183138 (= res!86694 (not e!120557))))

(declare-fun res!86693 () Bool)

(assert (=> b!183138 (=> (not res!86693) (not e!120557))))

(assert (=> b!183138 (= res!86693 (validKeyInArray!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183139 () Bool)

(assert (=> b!183139 (= e!120558 e!120559)))

(declare-fun c!32830 () Bool)

(assert (=> b!183139 (= c!32830 (validKeyInArray!0 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54749 () Bool)

(declare-fun res!86692 () Bool)

(assert (=> d!54749 (=> res!86692 e!120560)))

(assert (=> d!54749 (= res!86692 (bvsge #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))))))

(assert (=> d!54749 (= (arrayNoDuplicates!0 (_keys!5656 thiss!1248) #b00000000000000000000000000000000 Nil!2290) e!120560)))

(declare-fun b!183140 () Bool)

(assert (=> b!183140 (= e!120559 call!18475)))

(declare-fun bm!18472 () Bool)

(assert (=> bm!18472 (= call!18475 (arrayNoDuplicates!0 (_keys!5656 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32830 (Cons!2289 (select (arr!3662 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000) Nil!2290) Nil!2290)))))

(assert (= (and d!54749 (not res!86692)) b!183138))

(assert (= (and b!183138 res!86693) b!183137))

(assert (= (and b!183138 res!86694) b!183139))

(assert (= (and b!183139 c!32830) b!183136))

(assert (= (and b!183139 (not c!32830)) b!183140))

(assert (= (or b!183136 b!183140) bm!18472))

(assert (=> b!183137 m!210777))

(assert (=> b!183137 m!210777))

(declare-fun m!210865 () Bool)

(assert (=> b!183137 m!210865))

(assert (=> b!183138 m!210777))

(assert (=> b!183138 m!210777))

(assert (=> b!183138 m!210779))

(assert (=> b!183139 m!210777))

(assert (=> b!183139 m!210777))

(assert (=> b!183139 m!210779))

(assert (=> bm!18472 m!210777))

(declare-fun m!210867 () Bool)

(assert (=> bm!18472 m!210867))

(assert (=> b!182946 d!54749))

(declare-fun d!54751 () Bool)

(assert (=> d!54751 (= (array_inv!2365 (_keys!5656 thiss!1248)) (bvsge (size!3974 (_keys!5656 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182945 d!54751))

(declare-fun d!54753 () Bool)

(assert (=> d!54753 (= (array_inv!2366 (_values!3724 thiss!1248)) (bvsge (size!3975 (_values!3724 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182945 d!54753))

(declare-fun d!54755 () Bool)

(declare-fun res!86701 () Bool)

(declare-fun e!120563 () Bool)

(assert (=> d!54755 (=> (not res!86701) (not e!120563))))

(declare-fun simpleValid!173 (LongMapFixedSize!2506) Bool)

(assert (=> d!54755 (= res!86701 (simpleValid!173 thiss!1248))))

(assert (=> d!54755 (= (valid!1060 thiss!1248) e!120563)))

(declare-fun b!183147 () Bool)

(declare-fun res!86702 () Bool)

(assert (=> b!183147 (=> (not res!86702) (not e!120563))))

(declare-fun arrayCountValidKeys!0 (array!7745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183147 (= res!86702 (= (arrayCountValidKeys!0 (_keys!5656 thiss!1248) #b00000000000000000000000000000000 (size!3974 (_keys!5656 thiss!1248))) (_size!1302 thiss!1248)))))

(declare-fun b!183148 () Bool)

(declare-fun res!86703 () Bool)

(assert (=> b!183148 (=> (not res!86703) (not e!120563))))

(assert (=> b!183148 (= res!86703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!183149 () Bool)

(assert (=> b!183149 (= e!120563 (arrayNoDuplicates!0 (_keys!5656 thiss!1248) #b00000000000000000000000000000000 Nil!2290))))

(assert (= (and d!54755 res!86701) b!183147))

(assert (= (and b!183147 res!86702) b!183148))

(assert (= (and b!183148 res!86703) b!183149))

(declare-fun m!210869 () Bool)

(assert (=> d!54755 m!210869))

(declare-fun m!210871 () Bool)

(assert (=> b!183147 m!210871))

(assert (=> b!183148 m!210723))

(assert (=> b!183149 m!210711))

(assert (=> start!18440 d!54755))

(declare-fun d!54757 () Bool)

(assert (=> d!54757 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182947 d!54757))

(declare-fun b!183156 () Bool)

(declare-fun e!120568 () Bool)

(assert (=> b!183156 (= e!120568 tp_is_empty!4285)))

(declare-fun mapIsEmpty!7364 () Bool)

(declare-fun mapRes!7364 () Bool)

(assert (=> mapIsEmpty!7364 mapRes!7364))

(declare-fun b!183157 () Bool)

(declare-fun e!120569 () Bool)

(assert (=> b!183157 (= e!120569 tp_is_empty!4285)))

(declare-fun condMapEmpty!7364 () Bool)

(declare-fun mapDefault!7364 () ValueCell!1799)

(assert (=> mapNonEmpty!7355 (= condMapEmpty!7364 (= mapRest!7355 ((as const (Array (_ BitVec 32) ValueCell!1799)) mapDefault!7364)))))

(assert (=> mapNonEmpty!7355 (= tp!16304 (and e!120569 mapRes!7364))))

(declare-fun mapNonEmpty!7364 () Bool)

(declare-fun tp!16319 () Bool)

(assert (=> mapNonEmpty!7364 (= mapRes!7364 (and tp!16319 e!120568))))

(declare-fun mapKey!7364 () (_ BitVec 32))

(declare-fun mapRest!7364 () (Array (_ BitVec 32) ValueCell!1799))

(declare-fun mapValue!7364 () ValueCell!1799)

(assert (=> mapNonEmpty!7364 (= mapRest!7355 (store mapRest!7364 mapKey!7364 mapValue!7364))))

(assert (= (and mapNonEmpty!7355 condMapEmpty!7364) mapIsEmpty!7364))

(assert (= (and mapNonEmpty!7355 (not condMapEmpty!7364)) mapNonEmpty!7364))

(assert (= (and mapNonEmpty!7364 ((_ is ValueCellFull!1799) mapValue!7364)) b!183156))

(assert (= (and mapNonEmpty!7355 ((_ is ValueCellFull!1799) mapDefault!7364)) b!183157))

(declare-fun m!210873 () Bool)

(assert (=> mapNonEmpty!7364 m!210873))

(declare-fun b_lambda!7207 () Bool)

(assert (= b_lambda!7205 (or (and b!182945 b_free!4513) b_lambda!7207)))

(check-sat (not d!54741) b_and!11099 (not b!183060) (not mapNonEmpty!7364) tp_is_empty!4285 (not b_next!4513) (not b!183149) (not b!183147) (not b!183112) (not d!54745) (not b!183115) (not bm!18472) (not b!183047) (not b!183058) (not bm!18463) (not d!54755) (not b_lambda!7207) (not bm!18467) (not d!54743) (not b!183108) (not b!183121) (not b!183138) (not b!183137) (not bm!18468) (not bm!18469) (not b!183118) (not b!183119) (not bm!18448) (not b!183139) (not b!183031) (not b!183148) (not b!183116) (not b!183105) (not b!183032))
(check-sat b_and!11099 (not b_next!4513))
