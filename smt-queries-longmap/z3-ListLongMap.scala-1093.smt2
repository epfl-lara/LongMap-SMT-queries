; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22372 () Bool)

(assert start!22372)

(declare-fun b!234126 () Bool)

(declare-fun b_free!6307 () Bool)

(declare-fun b_next!6307 () Bool)

(assert (=> b!234126 (= b_free!6307 (not b_next!6307))))

(declare-fun tp!22076 () Bool)

(declare-fun b_and!13195 () Bool)

(assert (=> b!234126 (= tp!22076 b_and!13195)))

(declare-fun res!114831 () Bool)

(declare-fun e!152073 () Bool)

(assert (=> start!22372 (=> (not res!114831) (not e!152073))))

(declare-datatypes ((V!7873 0))(
  ( (V!7874 (val!3129 Int)) )
))
(declare-datatypes ((ValueCell!2741 0))(
  ( (ValueCellFull!2741 (v!5147 V!7873)) (EmptyCell!2741) )
))
(declare-datatypes ((array!11581 0))(
  ( (array!11582 (arr!5505 (Array (_ BitVec 32) ValueCell!2741)) (size!5841 (_ BitVec 32))) )
))
(declare-datatypes ((array!11583 0))(
  ( (array!11584 (arr!5506 (Array (_ BitVec 32) (_ BitVec 64))) (size!5842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3382 0))(
  ( (LongMapFixedSize!3383 (defaultEntry!4356 Int) (mask!10301 (_ BitVec 32)) (extraKeys!4093 (_ BitVec 32)) (zeroValue!4197 V!7873) (minValue!4197 V!7873) (_size!1740 (_ BitVec 32)) (_keys!6419 array!11583) (_values!4339 array!11581) (_vacant!1740 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3382)

(declare-fun valid!1351 (LongMapFixedSize!3382) Bool)

(assert (=> start!22372 (= res!114831 (valid!1351 thiss!1504))))

(assert (=> start!22372 e!152073))

(declare-fun e!152074 () Bool)

(assert (=> start!22372 e!152074))

(assert (=> start!22372 true))

(declare-fun b!234125 () Bool)

(declare-fun res!114829 () Bool)

(assert (=> b!234125 (=> (not res!114829) (not e!152073))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!234125 (= res!114829 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!6169 () Bool)

(declare-fun e!152071 () Bool)

(declare-fun array_inv!3635 (array!11583) Bool)

(declare-fun array_inv!3636 (array!11581) Bool)

(assert (=> b!234126 (= e!152074 (and tp!22076 tp_is_empty!6169 (array_inv!3635 (_keys!6419 thiss!1504)) (array_inv!3636 (_values!4339 thiss!1504)) e!152071))))

(declare-fun b!234127 () Bool)

(declare-fun e!152072 () Bool)

(assert (=> b!234127 (= e!152072 (and (= (size!5841 (_values!4339 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10301 thiss!1504))) (= (size!5842 (_keys!6419 thiss!1504)) (size!5841 (_values!4339 thiss!1504))) (bvsge (mask!10301 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4093 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234128 () Bool)

(declare-fun e!152069 () Bool)

(assert (=> b!234128 (= e!152069 tp_is_empty!6169)))

(declare-fun b!234129 () Bool)

(assert (=> b!234129 (= e!152073 e!152072)))

(declare-fun res!114827 () Bool)

(assert (=> b!234129 (=> (not res!114827) (not e!152072))))

(declare-datatypes ((SeekEntryResult!985 0))(
  ( (MissingZero!985 (index!6110 (_ BitVec 32))) (Found!985 (index!6111 (_ BitVec 32))) (Intermediate!985 (undefined!1797 Bool) (index!6112 (_ BitVec 32)) (x!23700 (_ BitVec 32))) (Undefined!985) (MissingVacant!985 (index!6113 (_ BitVec 32))) )
))
(declare-fun lt!118331 () SeekEntryResult!985)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234129 (= res!114827 (or (= lt!118331 (MissingZero!985 index!297)) (= lt!118331 (MissingVacant!985 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11583 (_ BitVec 32)) SeekEntryResult!985)

(assert (=> b!234129 (= lt!118331 (seekEntryOrOpen!0 key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(declare-fun b!234130 () Bool)

(declare-fun res!114830 () Bool)

(assert (=> b!234130 (=> (not res!114830) (not e!152072))))

(declare-datatypes ((tuple2!4594 0))(
  ( (tuple2!4595 (_1!2308 (_ BitVec 64)) (_2!2308 V!7873)) )
))
(declare-datatypes ((List!3522 0))(
  ( (Nil!3519) (Cons!3518 (h!4168 tuple2!4594) (t!8480 List!3522)) )
))
(declare-datatypes ((ListLongMap!3497 0))(
  ( (ListLongMap!3498 (toList!1764 List!3522)) )
))
(declare-fun contains!1639 (ListLongMap!3497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1273 (array!11583 array!11581 (_ BitVec 32) (_ BitVec 32) V!7873 V!7873 (_ BitVec 32) Int) ListLongMap!3497)

(assert (=> b!234130 (= res!114830 (contains!1639 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10437 () Bool)

(declare-fun mapRes!10437 () Bool)

(assert (=> mapIsEmpty!10437 mapRes!10437))

(declare-fun mapNonEmpty!10437 () Bool)

(declare-fun tp!22077 () Bool)

(declare-fun e!152068 () Bool)

(assert (=> mapNonEmpty!10437 (= mapRes!10437 (and tp!22077 e!152068))))

(declare-fun mapRest!10437 () (Array (_ BitVec 32) ValueCell!2741))

(declare-fun mapKey!10437 () (_ BitVec 32))

(declare-fun mapValue!10437 () ValueCell!2741)

(assert (=> mapNonEmpty!10437 (= (arr!5505 (_values!4339 thiss!1504)) (store mapRest!10437 mapKey!10437 mapValue!10437))))

(declare-fun b!234131 () Bool)

(assert (=> b!234131 (= e!152068 tp_is_empty!6169)))

(declare-fun b!234132 () Bool)

(declare-fun res!114828 () Bool)

(assert (=> b!234132 (=> (not res!114828) (not e!152072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234132 (= res!114828 (validMask!0 (mask!10301 thiss!1504)))))

(declare-fun b!234133 () Bool)

(assert (=> b!234133 (= e!152071 (and e!152069 mapRes!10437))))

(declare-fun condMapEmpty!10437 () Bool)

(declare-fun mapDefault!10437 () ValueCell!2741)

(assert (=> b!234133 (= condMapEmpty!10437 (= (arr!5505 (_values!4339 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10437)))))

(assert (= (and start!22372 res!114831) b!234125))

(assert (= (and b!234125 res!114829) b!234129))

(assert (= (and b!234129 res!114827) b!234130))

(assert (= (and b!234130 res!114830) b!234132))

(assert (= (and b!234132 res!114828) b!234127))

(assert (= (and b!234133 condMapEmpty!10437) mapIsEmpty!10437))

(assert (= (and b!234133 (not condMapEmpty!10437)) mapNonEmpty!10437))

(get-info :version)

(assert (= (and mapNonEmpty!10437 ((_ is ValueCellFull!2741) mapValue!10437)) b!234131))

(assert (= (and b!234133 ((_ is ValueCellFull!2741) mapDefault!10437)) b!234128))

(assert (= b!234126 b!234133))

(assert (= start!22372 b!234126))

(declare-fun m!254957 () Bool)

(assert (=> start!22372 m!254957))

(declare-fun m!254959 () Bool)

(assert (=> b!234126 m!254959))

(declare-fun m!254961 () Bool)

(assert (=> b!234126 m!254961))

(declare-fun m!254963 () Bool)

(assert (=> mapNonEmpty!10437 m!254963))

(declare-fun m!254965 () Bool)

(assert (=> b!234129 m!254965))

(declare-fun m!254967 () Bool)

(assert (=> b!234130 m!254967))

(assert (=> b!234130 m!254967))

(declare-fun m!254969 () Bool)

(assert (=> b!234130 m!254969))

(declare-fun m!254971 () Bool)

(assert (=> b!234132 m!254971))

(check-sat (not b!234130) (not b_next!6307) (not mapNonEmpty!10437) (not b!234126) tp_is_empty!6169 (not start!22372) (not b!234132) b_and!13195 (not b!234129))
(check-sat b_and!13195 (not b_next!6307))
(get-model)

(declare-fun d!58927 () Bool)

(assert (=> d!58927 (= (validMask!0 (mask!10301 thiss!1504)) (and (or (= (mask!10301 thiss!1504) #b00000000000000000000000000000111) (= (mask!10301 thiss!1504) #b00000000000000000000000000001111) (= (mask!10301 thiss!1504) #b00000000000000000000000000011111) (= (mask!10301 thiss!1504) #b00000000000000000000000000111111) (= (mask!10301 thiss!1504) #b00000000000000000000000001111111) (= (mask!10301 thiss!1504) #b00000000000000000000000011111111) (= (mask!10301 thiss!1504) #b00000000000000000000000111111111) (= (mask!10301 thiss!1504) #b00000000000000000000001111111111) (= (mask!10301 thiss!1504) #b00000000000000000000011111111111) (= (mask!10301 thiss!1504) #b00000000000000000000111111111111) (= (mask!10301 thiss!1504) #b00000000000000000001111111111111) (= (mask!10301 thiss!1504) #b00000000000000000011111111111111) (= (mask!10301 thiss!1504) #b00000000000000000111111111111111) (= (mask!10301 thiss!1504) #b00000000000000001111111111111111) (= (mask!10301 thiss!1504) #b00000000000000011111111111111111) (= (mask!10301 thiss!1504) #b00000000000000111111111111111111) (= (mask!10301 thiss!1504) #b00000000000001111111111111111111) (= (mask!10301 thiss!1504) #b00000000000011111111111111111111) (= (mask!10301 thiss!1504) #b00000000000111111111111111111111) (= (mask!10301 thiss!1504) #b00000000001111111111111111111111) (= (mask!10301 thiss!1504) #b00000000011111111111111111111111) (= (mask!10301 thiss!1504) #b00000000111111111111111111111111) (= (mask!10301 thiss!1504) #b00000001111111111111111111111111) (= (mask!10301 thiss!1504) #b00000011111111111111111111111111) (= (mask!10301 thiss!1504) #b00000111111111111111111111111111) (= (mask!10301 thiss!1504) #b00001111111111111111111111111111) (= (mask!10301 thiss!1504) #b00011111111111111111111111111111) (= (mask!10301 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10301 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234132 d!58927))

(declare-fun d!58929 () Bool)

(declare-fun res!114868 () Bool)

(declare-fun e!152119 () Bool)

(assert (=> d!58929 (=> (not res!114868) (not e!152119))))

(declare-fun simpleValid!230 (LongMapFixedSize!3382) Bool)

(assert (=> d!58929 (= res!114868 (simpleValid!230 thiss!1504))))

(assert (=> d!58929 (= (valid!1351 thiss!1504) e!152119)))

(declare-fun b!234194 () Bool)

(declare-fun res!114869 () Bool)

(assert (=> b!234194 (=> (not res!114869) (not e!152119))))

(declare-fun arrayCountValidKeys!0 (array!11583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234194 (= res!114869 (= (arrayCountValidKeys!0 (_keys!6419 thiss!1504) #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))) (_size!1740 thiss!1504)))))

(declare-fun b!234195 () Bool)

(declare-fun res!114870 () Bool)

(assert (=> b!234195 (=> (not res!114870) (not e!152119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11583 (_ BitVec 32)) Bool)

(assert (=> b!234195 (= res!114870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(declare-fun b!234196 () Bool)

(declare-datatypes ((List!3523 0))(
  ( (Nil!3520) (Cons!3519 (h!4169 (_ BitVec 64)) (t!8483 List!3523)) )
))
(declare-fun arrayNoDuplicates!0 (array!11583 (_ BitVec 32) List!3523) Bool)

(assert (=> b!234196 (= e!152119 (arrayNoDuplicates!0 (_keys!6419 thiss!1504) #b00000000000000000000000000000000 Nil!3520))))

(assert (= (and d!58929 res!114868) b!234194))

(assert (= (and b!234194 res!114869) b!234195))

(assert (= (and b!234195 res!114870) b!234196))

(declare-fun m!255005 () Bool)

(assert (=> d!58929 m!255005))

(declare-fun m!255007 () Bool)

(assert (=> b!234194 m!255007))

(declare-fun m!255009 () Bool)

(assert (=> b!234195 m!255009))

(declare-fun m!255011 () Bool)

(assert (=> b!234196 m!255011))

(assert (=> start!22372 d!58929))

(declare-fun d!58931 () Bool)

(declare-fun e!152125 () Bool)

(assert (=> d!58931 e!152125))

(declare-fun res!114873 () Bool)

(assert (=> d!58931 (=> res!114873 e!152125)))

(declare-fun lt!118346 () Bool)

(assert (=> d!58931 (= res!114873 (not lt!118346))))

(declare-fun lt!118349 () Bool)

(assert (=> d!58931 (= lt!118346 lt!118349)))

(declare-datatypes ((Unit!7230 0))(
  ( (Unit!7231) )
))
(declare-fun lt!118347 () Unit!7230)

(declare-fun e!152124 () Unit!7230)

(assert (=> d!58931 (= lt!118347 e!152124)))

(declare-fun c!38982 () Bool)

(assert (=> d!58931 (= c!38982 lt!118349)))

(declare-fun containsKey!255 (List!3522 (_ BitVec 64)) Bool)

(assert (=> d!58931 (= lt!118349 (containsKey!255 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(assert (=> d!58931 (= (contains!1639 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) key!932) lt!118346)))

(declare-fun b!234203 () Bool)

(declare-fun lt!118348 () Unit!7230)

(assert (=> b!234203 (= e!152124 lt!118348)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!204 (List!3522 (_ BitVec 64)) Unit!7230)

(assert (=> b!234203 (= lt!118348 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-datatypes ((Option!269 0))(
  ( (Some!268 (v!5150 V!7873)) (None!267) )
))
(declare-fun isDefined!205 (Option!269) Bool)

(declare-fun getValueByKey!263 (List!3522 (_ BitVec 64)) Option!269)

(assert (=> b!234203 (isDefined!205 (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun b!234204 () Bool)

(declare-fun Unit!7232 () Unit!7230)

(assert (=> b!234204 (= e!152124 Unit!7232)))

(declare-fun b!234205 () Bool)

(assert (=> b!234205 (= e!152125 (isDefined!205 (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932)))))

(assert (= (and d!58931 c!38982) b!234203))

(assert (= (and d!58931 (not c!38982)) b!234204))

(assert (= (and d!58931 (not res!114873)) b!234205))

(declare-fun m!255013 () Bool)

(assert (=> d!58931 m!255013))

(declare-fun m!255015 () Bool)

(assert (=> b!234203 m!255015))

(declare-fun m!255017 () Bool)

(assert (=> b!234203 m!255017))

(assert (=> b!234203 m!255017))

(declare-fun m!255019 () Bool)

(assert (=> b!234203 m!255019))

(assert (=> b!234205 m!255017))

(assert (=> b!234205 m!255017))

(assert (=> b!234205 m!255019))

(assert (=> b!234130 d!58931))

(declare-fun b!234248 () Bool)

(declare-fun e!152154 () ListLongMap!3497)

(declare-fun e!152155 () ListLongMap!3497)

(assert (=> b!234248 (= e!152154 e!152155)))

(declare-fun c!38998 () Bool)

(assert (=> b!234248 (= c!38998 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234249 () Bool)

(declare-fun e!152159 () Bool)

(declare-fun lt!118413 () ListLongMap!3497)

(declare-fun apply!207 (ListLongMap!3497 (_ BitVec 64)) V!7873)

(assert (=> b!234249 (= e!152159 (= (apply!207 lt!118413 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4197 thiss!1504)))))

(declare-fun bm!21774 () Bool)

(declare-fun call!21780 () Bool)

(assert (=> bm!21774 (= call!21780 (contains!1639 lt!118413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234250 () Bool)

(declare-fun e!152163 () Bool)

(declare-fun call!21783 () Bool)

(assert (=> b!234250 (= e!152163 (not call!21783))))

(declare-fun b!234251 () Bool)

(declare-fun e!152157 () Bool)

(assert (=> b!234251 (= e!152157 e!152159)))

(declare-fun res!114900 () Bool)

(assert (=> b!234251 (= res!114900 call!21780)))

(assert (=> b!234251 (=> (not res!114900) (not e!152159))))

(declare-fun b!234252 () Bool)

(declare-fun e!152152 () Bool)

(assert (=> b!234252 (= e!152152 e!152163)))

(declare-fun c!38997 () Bool)

(assert (=> b!234252 (= c!38997 (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234253 () Bool)

(declare-fun e!152164 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234253 (= e!152164 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234254 () Bool)

(declare-fun e!152161 () Bool)

(declare-fun e!152153 () Bool)

(assert (=> b!234254 (= e!152161 e!152153)))

(declare-fun res!114894 () Bool)

(assert (=> b!234254 (=> (not res!114894) (not e!152153))))

(assert (=> b!234254 (= res!114894 (contains!1639 lt!118413 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun b!234255 () Bool)

(declare-fun e!152162 () ListLongMap!3497)

(declare-fun call!21778 () ListLongMap!3497)

(assert (=> b!234255 (= e!152162 call!21778)))

(declare-fun b!234256 () Bool)

(declare-fun res!114899 () Bool)

(assert (=> b!234256 (=> (not res!114899) (not e!152152))))

(assert (=> b!234256 (= res!114899 e!152161)))

(declare-fun res!114897 () Bool)

(assert (=> b!234256 (=> res!114897 e!152161)))

(assert (=> b!234256 (= res!114897 (not e!152164))))

(declare-fun res!114892 () Bool)

(assert (=> b!234256 (=> (not res!114892) (not e!152164))))

(assert (=> b!234256 (= res!114892 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun bm!21775 () Bool)

(assert (=> bm!21775 (= call!21783 (contains!1639 lt!118413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234257 () Bool)

(declare-fun e!152156 () Bool)

(assert (=> b!234257 (= e!152163 e!152156)))

(declare-fun res!114895 () Bool)

(assert (=> b!234257 (= res!114895 call!21783)))

(assert (=> b!234257 (=> (not res!114895) (not e!152156))))

(declare-fun b!234258 () Bool)

(declare-fun e!152158 () Bool)

(assert (=> b!234258 (= e!152158 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21776 () Bool)

(declare-fun call!21782 () ListLongMap!3497)

(declare-fun call!21781 () ListLongMap!3497)

(assert (=> bm!21776 (= call!21782 call!21781)))

(declare-fun b!234260 () Bool)

(assert (=> b!234260 (= e!152155 call!21778)))

(declare-fun b!234261 () Bool)

(declare-fun call!21777 () ListLongMap!3497)

(declare-fun +!640 (ListLongMap!3497 tuple2!4594) ListLongMap!3497)

(assert (=> b!234261 (= e!152154 (+!640 call!21777 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))

(declare-fun b!234262 () Bool)

(declare-fun e!152160 () Unit!7230)

(declare-fun Unit!7233 () Unit!7230)

(assert (=> b!234262 (= e!152160 Unit!7233)))

(declare-fun bm!21777 () Bool)

(declare-fun call!21779 () ListLongMap!3497)

(assert (=> bm!21777 (= call!21781 call!21779)))

(declare-fun bm!21778 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!523 (array!11583 array!11581 (_ BitVec 32) (_ BitVec 32) V!7873 V!7873 (_ BitVec 32) Int) ListLongMap!3497)

(assert (=> bm!21778 (= call!21779 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun d!58933 () Bool)

(assert (=> d!58933 e!152152))

(declare-fun res!114896 () Bool)

(assert (=> d!58933 (=> (not res!114896) (not e!152152))))

(assert (=> d!58933 (= res!114896 (or (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))))

(declare-fun lt!118400 () ListLongMap!3497)

(assert (=> d!58933 (= lt!118413 lt!118400)))

(declare-fun lt!118407 () Unit!7230)

(assert (=> d!58933 (= lt!118407 e!152160)))

(declare-fun c!38999 () Bool)

(assert (=> d!58933 (= c!38999 e!152158)))

(declare-fun res!114893 () Bool)

(assert (=> d!58933 (=> (not res!114893) (not e!152158))))

(assert (=> d!58933 (= res!114893 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!58933 (= lt!118400 e!152154)))

(declare-fun c!39000 () Bool)

(assert (=> d!58933 (= c!39000 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58933 (validMask!0 (mask!10301 thiss!1504))))

(assert (=> d!58933 (= (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) lt!118413)))

(declare-fun b!234259 () Bool)

(declare-fun res!114898 () Bool)

(assert (=> b!234259 (=> (not res!114898) (not e!152152))))

(assert (=> b!234259 (= res!114898 e!152157)))

(declare-fun c!38996 () Bool)

(assert (=> b!234259 (= c!38996 (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234263 () Bool)

(assert (=> b!234263 (= e!152156 (= (apply!207 lt!118413 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4197 thiss!1504)))))

(declare-fun bm!21779 () Bool)

(assert (=> bm!21779 (= call!21777 (+!640 (ite c!39000 call!21779 (ite c!38998 call!21781 call!21782)) (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun b!234264 () Bool)

(declare-fun lt!118405 () Unit!7230)

(assert (=> b!234264 (= e!152160 lt!118405)))

(declare-fun lt!118399 () ListLongMap!3497)

(assert (=> b!234264 (= lt!118399 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118397 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118406 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118406 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118409 () Unit!7230)

(declare-fun addStillContains!183 (ListLongMap!3497 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7230)

(assert (=> b!234264 (= lt!118409 (addStillContains!183 lt!118399 lt!118397 (zeroValue!4197 thiss!1504) lt!118406))))

(assert (=> b!234264 (contains!1639 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) lt!118406)))

(declare-fun lt!118410 () Unit!7230)

(assert (=> b!234264 (= lt!118410 lt!118409)))

(declare-fun lt!118408 () ListLongMap!3497)

(assert (=> b!234264 (= lt!118408 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118398 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118403 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118403 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118401 () Unit!7230)

(declare-fun addApplyDifferent!183 (ListLongMap!3497 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7230)

(assert (=> b!234264 (= lt!118401 (addApplyDifferent!183 lt!118408 lt!118398 (minValue!4197 thiss!1504) lt!118403))))

(assert (=> b!234264 (= (apply!207 (+!640 lt!118408 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) lt!118403) (apply!207 lt!118408 lt!118403))))

(declare-fun lt!118395 () Unit!7230)

(assert (=> b!234264 (= lt!118395 lt!118401)))

(declare-fun lt!118415 () ListLongMap!3497)

(assert (=> b!234264 (= lt!118415 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118404 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118404 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118411 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118411 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118412 () Unit!7230)

(assert (=> b!234264 (= lt!118412 (addApplyDifferent!183 lt!118415 lt!118404 (zeroValue!4197 thiss!1504) lt!118411))))

(assert (=> b!234264 (= (apply!207 (+!640 lt!118415 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) lt!118411) (apply!207 lt!118415 lt!118411))))

(declare-fun lt!118394 () Unit!7230)

(assert (=> b!234264 (= lt!118394 lt!118412)))

(declare-fun lt!118414 () ListLongMap!3497)

(assert (=> b!234264 (= lt!118414 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))

(declare-fun lt!118402 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118402 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118396 () (_ BitVec 64))

(assert (=> b!234264 (= lt!118396 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234264 (= lt!118405 (addApplyDifferent!183 lt!118414 lt!118402 (minValue!4197 thiss!1504) lt!118396))))

(assert (=> b!234264 (= (apply!207 (+!640 lt!118414 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) lt!118396) (apply!207 lt!118414 lt!118396))))

(declare-fun b!234265 () Bool)

(declare-fun get!2822 (ValueCell!2741 V!7873) V!7873)

(declare-fun dynLambda!541 (Int (_ BitVec 64)) V!7873)

(assert (=> b!234265 (= e!152153 (= (apply!207 lt!118413 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)) (get!2822 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5841 (_values!4339 thiss!1504))))))

(assert (=> b!234265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun bm!21780 () Bool)

(assert (=> bm!21780 (= call!21778 call!21777)))

(declare-fun b!234266 () Bool)

(declare-fun c!38995 () Bool)

(assert (=> b!234266 (= c!38995 (and (not (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!234266 (= e!152155 e!152162)))

(declare-fun b!234267 () Bool)

(assert (=> b!234267 (= e!152157 (not call!21780))))

(declare-fun b!234268 () Bool)

(assert (=> b!234268 (= e!152162 call!21782)))

(assert (= (and d!58933 c!39000) b!234261))

(assert (= (and d!58933 (not c!39000)) b!234248))

(assert (= (and b!234248 c!38998) b!234260))

(assert (= (and b!234248 (not c!38998)) b!234266))

(assert (= (and b!234266 c!38995) b!234255))

(assert (= (and b!234266 (not c!38995)) b!234268))

(assert (= (or b!234255 b!234268) bm!21776))

(assert (= (or b!234260 bm!21776) bm!21777))

(assert (= (or b!234260 b!234255) bm!21780))

(assert (= (or b!234261 bm!21777) bm!21778))

(assert (= (or b!234261 bm!21780) bm!21779))

(assert (= (and d!58933 res!114893) b!234258))

(assert (= (and d!58933 c!38999) b!234264))

(assert (= (and d!58933 (not c!38999)) b!234262))

(assert (= (and d!58933 res!114896) b!234256))

(assert (= (and b!234256 res!114892) b!234253))

(assert (= (and b!234256 (not res!114897)) b!234254))

(assert (= (and b!234254 res!114894) b!234265))

(assert (= (and b!234256 res!114899) b!234259))

(assert (= (and b!234259 c!38996) b!234251))

(assert (= (and b!234259 (not c!38996)) b!234267))

(assert (= (and b!234251 res!114900) b!234249))

(assert (= (or b!234251 b!234267) bm!21774))

(assert (= (and b!234259 res!114898) b!234252))

(assert (= (and b!234252 c!38997) b!234257))

(assert (= (and b!234252 (not c!38997)) b!234250))

(assert (= (and b!234257 res!114895) b!234263))

(assert (= (or b!234257 b!234250) bm!21775))

(declare-fun b_lambda!7857 () Bool)

(assert (=> (not b_lambda!7857) (not b!234265)))

(declare-fun t!8482 () Bool)

(declare-fun tb!2919 () Bool)

(assert (=> (and b!234126 (= (defaultEntry!4356 thiss!1504) (defaultEntry!4356 thiss!1504)) t!8482) tb!2919))

(declare-fun result!5095 () Bool)

(assert (=> tb!2919 (= result!5095 tp_is_empty!6169)))

(assert (=> b!234265 t!8482))

(declare-fun b_and!13201 () Bool)

(assert (= b_and!13195 (and (=> t!8482 result!5095) b_and!13201)))

(declare-fun m!255021 () Bool)

(assert (=> bm!21779 m!255021))

(declare-fun m!255023 () Bool)

(assert (=> b!234261 m!255023))

(declare-fun m!255025 () Bool)

(assert (=> b!234265 m!255025))

(declare-fun m!255027 () Bool)

(assert (=> b!234265 m!255027))

(declare-fun m!255029 () Bool)

(assert (=> b!234265 m!255029))

(declare-fun m!255031 () Bool)

(assert (=> b!234265 m!255031))

(assert (=> b!234265 m!255029))

(assert (=> b!234265 m!255027))

(assert (=> b!234265 m!255025))

(declare-fun m!255033 () Bool)

(assert (=> b!234265 m!255033))

(assert (=> b!234264 m!255025))

(declare-fun m!255035 () Bool)

(assert (=> b!234264 m!255035))

(declare-fun m!255037 () Bool)

(assert (=> b!234264 m!255037))

(declare-fun m!255039 () Bool)

(assert (=> b!234264 m!255039))

(declare-fun m!255041 () Bool)

(assert (=> b!234264 m!255041))

(declare-fun m!255043 () Bool)

(assert (=> b!234264 m!255043))

(assert (=> b!234264 m!255039))

(declare-fun m!255045 () Bool)

(assert (=> b!234264 m!255045))

(declare-fun m!255047 () Bool)

(assert (=> b!234264 m!255047))

(declare-fun m!255049 () Bool)

(assert (=> b!234264 m!255049))

(declare-fun m!255051 () Bool)

(assert (=> b!234264 m!255051))

(declare-fun m!255053 () Bool)

(assert (=> b!234264 m!255053))

(assert (=> b!234264 m!255053))

(declare-fun m!255055 () Bool)

(assert (=> b!234264 m!255055))

(declare-fun m!255057 () Bool)

(assert (=> b!234264 m!255057))

(assert (=> b!234264 m!255037))

(declare-fun m!255059 () Bool)

(assert (=> b!234264 m!255059))

(declare-fun m!255061 () Bool)

(assert (=> b!234264 m!255061))

(assert (=> b!234264 m!255049))

(declare-fun m!255063 () Bool)

(assert (=> b!234264 m!255063))

(declare-fun m!255065 () Bool)

(assert (=> b!234264 m!255065))

(assert (=> bm!21778 m!255041))

(assert (=> b!234258 m!255025))

(assert (=> b!234258 m!255025))

(declare-fun m!255067 () Bool)

(assert (=> b!234258 m!255067))

(declare-fun m!255069 () Bool)

(assert (=> bm!21775 m!255069))

(assert (=> b!234254 m!255025))

(assert (=> b!234254 m!255025))

(declare-fun m!255071 () Bool)

(assert (=> b!234254 m!255071))

(assert (=> d!58933 m!254971))

(declare-fun m!255073 () Bool)

(assert (=> b!234263 m!255073))

(declare-fun m!255075 () Bool)

(assert (=> bm!21774 m!255075))

(assert (=> b!234253 m!255025))

(assert (=> b!234253 m!255025))

(assert (=> b!234253 m!255067))

(declare-fun m!255077 () Bool)

(assert (=> b!234249 m!255077))

(assert (=> b!234130 d!58933))

(declare-fun b!234283 () Bool)

(declare-fun e!152171 () SeekEntryResult!985)

(declare-fun e!152172 () SeekEntryResult!985)

(assert (=> b!234283 (= e!152171 e!152172)))

(declare-fun lt!118424 () (_ BitVec 64))

(declare-fun lt!118423 () SeekEntryResult!985)

(assert (=> b!234283 (= lt!118424 (select (arr!5506 (_keys!6419 thiss!1504)) (index!6112 lt!118423)))))

(declare-fun c!39007 () Bool)

(assert (=> b!234283 (= c!39007 (= lt!118424 key!932))))

(declare-fun b!234284 () Bool)

(assert (=> b!234284 (= e!152172 (Found!985 (index!6112 lt!118423)))))

(declare-fun b!234285 () Bool)

(declare-fun e!152173 () SeekEntryResult!985)

(assert (=> b!234285 (= e!152173 (MissingZero!985 (index!6112 lt!118423)))))

(declare-fun d!58935 () Bool)

(declare-fun lt!118422 () SeekEntryResult!985)

(assert (=> d!58935 (and (or ((_ is Undefined!985) lt!118422) (not ((_ is Found!985) lt!118422)) (and (bvsge (index!6111 lt!118422) #b00000000000000000000000000000000) (bvslt (index!6111 lt!118422) (size!5842 (_keys!6419 thiss!1504))))) (or ((_ is Undefined!985) lt!118422) ((_ is Found!985) lt!118422) (not ((_ is MissingZero!985) lt!118422)) (and (bvsge (index!6110 lt!118422) #b00000000000000000000000000000000) (bvslt (index!6110 lt!118422) (size!5842 (_keys!6419 thiss!1504))))) (or ((_ is Undefined!985) lt!118422) ((_ is Found!985) lt!118422) ((_ is MissingZero!985) lt!118422) (not ((_ is MissingVacant!985) lt!118422)) (and (bvsge (index!6113 lt!118422) #b00000000000000000000000000000000) (bvslt (index!6113 lt!118422) (size!5842 (_keys!6419 thiss!1504))))) (or ((_ is Undefined!985) lt!118422) (ite ((_ is Found!985) lt!118422) (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6111 lt!118422)) key!932) (ite ((_ is MissingZero!985) lt!118422) (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6110 lt!118422)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!985) lt!118422) (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6113 lt!118422)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58935 (= lt!118422 e!152171)))

(declare-fun c!39009 () Bool)

(assert (=> d!58935 (= c!39009 (and ((_ is Intermediate!985) lt!118423) (undefined!1797 lt!118423)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11583 (_ BitVec 32)) SeekEntryResult!985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58935 (= lt!118423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10301 thiss!1504)) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(assert (=> d!58935 (validMask!0 (mask!10301 thiss!1504))))

(assert (=> d!58935 (= (seekEntryOrOpen!0 key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)) lt!118422)))

(declare-fun b!234286 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11583 (_ BitVec 32)) SeekEntryResult!985)

(assert (=> b!234286 (= e!152173 (seekKeyOrZeroReturnVacant!0 (x!23700 lt!118423) (index!6112 lt!118423) (index!6112 lt!118423) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(declare-fun b!234287 () Bool)

(assert (=> b!234287 (= e!152171 Undefined!985)))

(declare-fun b!234288 () Bool)

(declare-fun c!39008 () Bool)

(assert (=> b!234288 (= c!39008 (= lt!118424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234288 (= e!152172 e!152173)))

(assert (= (and d!58935 c!39009) b!234287))

(assert (= (and d!58935 (not c!39009)) b!234283))

(assert (= (and b!234283 c!39007) b!234284))

(assert (= (and b!234283 (not c!39007)) b!234288))

(assert (= (and b!234288 c!39008) b!234285))

(assert (= (and b!234288 (not c!39008)) b!234286))

(declare-fun m!255079 () Bool)

(assert (=> b!234283 m!255079))

(declare-fun m!255081 () Bool)

(assert (=> d!58935 m!255081))

(declare-fun m!255083 () Bool)

(assert (=> d!58935 m!255083))

(assert (=> d!58935 m!254971))

(declare-fun m!255085 () Bool)

(assert (=> d!58935 m!255085))

(declare-fun m!255087 () Bool)

(assert (=> d!58935 m!255087))

(declare-fun m!255089 () Bool)

(assert (=> d!58935 m!255089))

(assert (=> d!58935 m!255087))

(declare-fun m!255091 () Bool)

(assert (=> b!234286 m!255091))

(assert (=> b!234129 d!58935))

(declare-fun d!58937 () Bool)

(assert (=> d!58937 (= (array_inv!3635 (_keys!6419 thiss!1504)) (bvsge (size!5842 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234126 d!58937))

(declare-fun d!58939 () Bool)

(assert (=> d!58939 (= (array_inv!3636 (_values!4339 thiss!1504)) (bvsge (size!5841 (_values!4339 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234126 d!58939))

(declare-fun b!234295 () Bool)

(declare-fun e!152179 () Bool)

(assert (=> b!234295 (= e!152179 tp_is_empty!6169)))

(declare-fun condMapEmpty!10446 () Bool)

(declare-fun mapDefault!10446 () ValueCell!2741)

(assert (=> mapNonEmpty!10437 (= condMapEmpty!10446 (= mapRest!10437 ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10446)))))

(declare-fun e!152178 () Bool)

(declare-fun mapRes!10446 () Bool)

(assert (=> mapNonEmpty!10437 (= tp!22077 (and e!152178 mapRes!10446))))

(declare-fun mapIsEmpty!10446 () Bool)

(assert (=> mapIsEmpty!10446 mapRes!10446))

(declare-fun mapNonEmpty!10446 () Bool)

(declare-fun tp!22092 () Bool)

(assert (=> mapNonEmpty!10446 (= mapRes!10446 (and tp!22092 e!152179))))

(declare-fun mapValue!10446 () ValueCell!2741)

(declare-fun mapRest!10446 () (Array (_ BitVec 32) ValueCell!2741))

(declare-fun mapKey!10446 () (_ BitVec 32))

(assert (=> mapNonEmpty!10446 (= mapRest!10437 (store mapRest!10446 mapKey!10446 mapValue!10446))))

(declare-fun b!234296 () Bool)

(assert (=> b!234296 (= e!152178 tp_is_empty!6169)))

(assert (= (and mapNonEmpty!10437 condMapEmpty!10446) mapIsEmpty!10446))

(assert (= (and mapNonEmpty!10437 (not condMapEmpty!10446)) mapNonEmpty!10446))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2741) mapValue!10446)) b!234295))

(assert (= (and mapNonEmpty!10437 ((_ is ValueCellFull!2741) mapDefault!10446)) b!234296))

(declare-fun m!255093 () Bool)

(assert (=> mapNonEmpty!10446 m!255093))

(declare-fun b_lambda!7859 () Bool)

(assert (= b_lambda!7857 (or (and b!234126 b_free!6307) b_lambda!7859)))

(check-sat (not b!234263) (not d!58933) (not b!234264) (not d!58935) (not b!234286) (not b!234194) (not bm!21778) (not bm!21779) (not b!234203) (not b!234258) (not b!234254) (not bm!21774) (not b!234253) (not b_next!6307) (not d!58929) (not mapNonEmpty!10446) (not b!234195) (not d!58931) tp_is_empty!6169 (not b!234196) (not b!234205) (not b!234265) b_and!13201 (not bm!21775) (not b!234249) (not b!234261) (not b_lambda!7859))
(check-sat b_and!13201 (not b_next!6307))
(get-model)

(declare-fun d!58941 () Bool)

(assert (=> d!58941 (= (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234253 d!58941))

(declare-fun d!58943 () Bool)

(assert (=> d!58943 (isDefined!205 (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun lt!118427 () Unit!7230)

(declare-fun choose!1105 (List!3522 (_ BitVec 64)) Unit!7230)

(assert (=> d!58943 (= lt!118427 (choose!1105 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(declare-fun e!152182 () Bool)

(assert (=> d!58943 e!152182))

(declare-fun res!114903 () Bool)

(assert (=> d!58943 (=> (not res!114903) (not e!152182))))

(declare-fun isStrictlySorted!356 (List!3522) Bool)

(assert (=> d!58943 (= res!114903 (isStrictlySorted!356 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))))

(assert (=> d!58943 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) lt!118427)))

(declare-fun b!234299 () Bool)

(assert (=> b!234299 (= e!152182 (containsKey!255 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))

(assert (= (and d!58943 res!114903) b!234299))

(assert (=> d!58943 m!255017))

(assert (=> d!58943 m!255017))

(assert (=> d!58943 m!255019))

(declare-fun m!255095 () Bool)

(assert (=> d!58943 m!255095))

(declare-fun m!255097 () Bool)

(assert (=> d!58943 m!255097))

(assert (=> b!234299 m!255013))

(assert (=> b!234203 d!58943))

(declare-fun d!58945 () Bool)

(declare-fun isEmpty!512 (Option!269) Bool)

(assert (=> d!58945 (= (isDefined!205 (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932)) (not (isEmpty!512 (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932))))))

(declare-fun bs!8656 () Bool)

(assert (= bs!8656 d!58945))

(assert (=> bs!8656 m!255017))

(declare-fun m!255099 () Bool)

(assert (=> bs!8656 m!255099))

(assert (=> b!234203 d!58945))

(declare-fun b!234311 () Bool)

(declare-fun e!152188 () Option!269)

(assert (=> b!234311 (= e!152188 None!267)))

(declare-fun b!234308 () Bool)

(declare-fun e!152187 () Option!269)

(assert (=> b!234308 (= e!152187 (Some!268 (_2!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))))))))

(declare-fun b!234309 () Bool)

(assert (=> b!234309 (= e!152187 e!152188)))

(declare-fun c!39015 () Bool)

(assert (=> b!234309 (= c!39015 (and ((_ is Cons!3518) (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (not (= (_1!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932))))))

(declare-fun b!234310 () Bool)

(assert (=> b!234310 (= e!152188 (getValueByKey!263 (t!8480 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) key!932))))

(declare-fun d!58947 () Bool)

(declare-fun c!39014 () Bool)

(assert (=> d!58947 (= c!39014 (and ((_ is Cons!3518) (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (= (_1!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(assert (=> d!58947 (= (getValueByKey!263 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) e!152187)))

(assert (= (and d!58947 c!39014) b!234308))

(assert (= (and d!58947 (not c!39014)) b!234309))

(assert (= (and b!234309 c!39015) b!234310))

(assert (= (and b!234309 (not c!39015)) b!234311))

(declare-fun m!255101 () Bool)

(assert (=> b!234310 m!255101))

(assert (=> b!234203 d!58947))

(assert (=> b!234205 d!58945))

(assert (=> b!234205 d!58947))

(assert (=> d!58933 d!58927))

(declare-fun b!234330 () Bool)

(declare-fun lt!118433 () SeekEntryResult!985)

(assert (=> b!234330 (and (bvsge (index!6112 lt!118433) #b00000000000000000000000000000000) (bvslt (index!6112 lt!118433) (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun e!152203 () Bool)

(assert (=> b!234330 (= e!152203 (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6112 lt!118433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234331 () Bool)

(declare-fun e!152199 () SeekEntryResult!985)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234331 (= e!152199 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10301 thiss!1504)) #b00000000000000000000000000000000 (mask!10301 thiss!1504)) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(declare-fun b!234332 () Bool)

(assert (=> b!234332 (and (bvsge (index!6112 lt!118433) #b00000000000000000000000000000000) (bvslt (index!6112 lt!118433) (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun res!114910 () Bool)

(assert (=> b!234332 (= res!114910 (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6112 lt!118433)) key!932))))

(assert (=> b!234332 (=> res!114910 e!152203)))

(declare-fun e!152202 () Bool)

(assert (=> b!234332 (= e!152202 e!152203)))

(declare-fun b!234333 () Bool)

(declare-fun e!152201 () Bool)

(assert (=> b!234333 (= e!152201 e!152202)))

(declare-fun res!114912 () Bool)

(assert (=> b!234333 (= res!114912 (and ((_ is Intermediate!985) lt!118433) (not (undefined!1797 lt!118433)) (bvslt (x!23700 lt!118433) #b01111111111111111111111111111110) (bvsge (x!23700 lt!118433) #b00000000000000000000000000000000) (bvsge (x!23700 lt!118433) #b00000000000000000000000000000000)))))

(assert (=> b!234333 (=> (not res!114912) (not e!152202))))

(declare-fun d!58949 () Bool)

(assert (=> d!58949 e!152201))

(declare-fun c!39022 () Bool)

(assert (=> d!58949 (= c!39022 (and ((_ is Intermediate!985) lt!118433) (undefined!1797 lt!118433)))))

(declare-fun e!152200 () SeekEntryResult!985)

(assert (=> d!58949 (= lt!118433 e!152200)))

(declare-fun c!39023 () Bool)

(assert (=> d!58949 (= c!39023 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118432 () (_ BitVec 64))

(assert (=> d!58949 (= lt!118432 (select (arr!5506 (_keys!6419 thiss!1504)) (toIndex!0 key!932 (mask!10301 thiss!1504))))))

(assert (=> d!58949 (validMask!0 (mask!10301 thiss!1504))))

(assert (=> d!58949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10301 thiss!1504)) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)) lt!118433)))

(declare-fun b!234334 () Bool)

(assert (=> b!234334 (= e!152200 e!152199)))

(declare-fun c!39024 () Bool)

(assert (=> b!234334 (= c!39024 (or (= lt!118432 key!932) (= (bvadd lt!118432 lt!118432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234335 () Bool)

(assert (=> b!234335 (= e!152199 (Intermediate!985 false (toIndex!0 key!932 (mask!10301 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234336 () Bool)

(assert (=> b!234336 (and (bvsge (index!6112 lt!118433) #b00000000000000000000000000000000) (bvslt (index!6112 lt!118433) (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun res!114911 () Bool)

(assert (=> b!234336 (= res!114911 (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6112 lt!118433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234336 (=> res!114911 e!152203)))

(declare-fun b!234337 () Bool)

(assert (=> b!234337 (= e!152200 (Intermediate!985 true (toIndex!0 key!932 (mask!10301 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234338 () Bool)

(assert (=> b!234338 (= e!152201 (bvsge (x!23700 lt!118433) #b01111111111111111111111111111110))))

(assert (= (and d!58949 c!39023) b!234337))

(assert (= (and d!58949 (not c!39023)) b!234334))

(assert (= (and b!234334 c!39024) b!234335))

(assert (= (and b!234334 (not c!39024)) b!234331))

(assert (= (and d!58949 c!39022) b!234338))

(assert (= (and d!58949 (not c!39022)) b!234333))

(assert (= (and b!234333 res!114912) b!234332))

(assert (= (and b!234332 (not res!114910)) b!234336))

(assert (= (and b!234336 (not res!114911)) b!234330))

(assert (=> d!58949 m!255087))

(declare-fun m!255103 () Bool)

(assert (=> d!58949 m!255103))

(assert (=> d!58949 m!254971))

(declare-fun m!255105 () Bool)

(assert (=> b!234332 m!255105))

(assert (=> b!234330 m!255105))

(assert (=> b!234336 m!255105))

(assert (=> b!234331 m!255087))

(declare-fun m!255107 () Bool)

(assert (=> b!234331 m!255107))

(assert (=> b!234331 m!255107))

(declare-fun m!255109 () Bool)

(assert (=> b!234331 m!255109))

(assert (=> d!58935 d!58949))

(declare-fun d!58951 () Bool)

(declare-fun lt!118439 () (_ BitVec 32))

(declare-fun lt!118438 () (_ BitVec 32))

(assert (=> d!58951 (= lt!118439 (bvmul (bvxor lt!118438 (bvlshr lt!118438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58951 (= lt!118438 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58951 (and (bvsge (mask!10301 thiss!1504) #b00000000000000000000000000000000) (let ((res!114913 (let ((h!4170 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23716 (bvmul (bvxor h!4170 (bvlshr h!4170 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23716 (bvlshr x!23716 #b00000000000000000000000000001101)) (mask!10301 thiss!1504)))))) (and (bvslt res!114913 (bvadd (mask!10301 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114913 #b00000000000000000000000000000000))))))

(assert (=> d!58951 (= (toIndex!0 key!932 (mask!10301 thiss!1504)) (bvand (bvxor lt!118439 (bvlshr lt!118439 #b00000000000000000000000000001101)) (mask!10301 thiss!1504)))))

(assert (=> d!58935 d!58951))

(assert (=> d!58935 d!58927))

(declare-fun d!58953 () Bool)

(declare-fun e!152205 () Bool)

(assert (=> d!58953 e!152205))

(declare-fun res!114914 () Bool)

(assert (=> d!58953 (=> res!114914 e!152205)))

(declare-fun lt!118440 () Bool)

(assert (=> d!58953 (= res!114914 (not lt!118440))))

(declare-fun lt!118443 () Bool)

(assert (=> d!58953 (= lt!118440 lt!118443)))

(declare-fun lt!118441 () Unit!7230)

(declare-fun e!152204 () Unit!7230)

(assert (=> d!58953 (= lt!118441 e!152204)))

(declare-fun c!39025 () Bool)

(assert (=> d!58953 (= c!39025 lt!118443)))

(assert (=> d!58953 (= lt!118443 (containsKey!255 (toList!1764 lt!118413) (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58953 (= (contains!1639 lt!118413 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)) lt!118440)))

(declare-fun b!234339 () Bool)

(declare-fun lt!118442 () Unit!7230)

(assert (=> b!234339 (= e!152204 lt!118442)))

(assert (=> b!234339 (= lt!118442 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 lt!118413) (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234339 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234340 () Bool)

(declare-fun Unit!7234 () Unit!7230)

(assert (=> b!234340 (= e!152204 Unit!7234)))

(declare-fun b!234341 () Bool)

(assert (=> b!234341 (= e!152205 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58953 c!39025) b!234339))

(assert (= (and d!58953 (not c!39025)) b!234340))

(assert (= (and d!58953 (not res!114914)) b!234341))

(assert (=> d!58953 m!255025))

(declare-fun m!255111 () Bool)

(assert (=> d!58953 m!255111))

(assert (=> b!234339 m!255025))

(declare-fun m!255113 () Bool)

(assert (=> b!234339 m!255113))

(assert (=> b!234339 m!255025))

(declare-fun m!255115 () Bool)

(assert (=> b!234339 m!255115))

(assert (=> b!234339 m!255115))

(declare-fun m!255117 () Bool)

(assert (=> b!234339 m!255117))

(assert (=> b!234341 m!255025))

(assert (=> b!234341 m!255115))

(assert (=> b!234341 m!255115))

(assert (=> b!234341 m!255117))

(assert (=> b!234254 d!58953))

(declare-fun bm!21783 () Bool)

(declare-fun call!21786 () Bool)

(declare-fun c!39028 () Bool)

(assert (=> bm!21783 (= call!21786 (arrayNoDuplicates!0 (_keys!6419 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39028 (Cons!3519 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000) Nil!3520) Nil!3520)))))

(declare-fun b!234352 () Bool)

(declare-fun e!152217 () Bool)

(assert (=> b!234352 (= e!152217 call!21786)))

(declare-fun b!234353 () Bool)

(assert (=> b!234353 (= e!152217 call!21786)))

(declare-fun b!234354 () Bool)

(declare-fun e!152215 () Bool)

(declare-fun e!152214 () Bool)

(assert (=> b!234354 (= e!152215 e!152214)))

(declare-fun res!114923 () Bool)

(assert (=> b!234354 (=> (not res!114923) (not e!152214))))

(declare-fun e!152216 () Bool)

(assert (=> b!234354 (= res!114923 (not e!152216))))

(declare-fun res!114921 () Bool)

(assert (=> b!234354 (=> (not res!114921) (not e!152216))))

(assert (=> b!234354 (= res!114921 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234355 () Bool)

(declare-fun contains!1640 (List!3523 (_ BitVec 64)) Bool)

(assert (=> b!234355 (= e!152216 (contains!1640 Nil!3520 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58955 () Bool)

(declare-fun res!114922 () Bool)

(assert (=> d!58955 (=> res!114922 e!152215)))

(assert (=> d!58955 (= res!114922 (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!58955 (= (arrayNoDuplicates!0 (_keys!6419 thiss!1504) #b00000000000000000000000000000000 Nil!3520) e!152215)))

(declare-fun b!234356 () Bool)

(assert (=> b!234356 (= e!152214 e!152217)))

(assert (=> b!234356 (= c!39028 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58955 (not res!114922)) b!234354))

(assert (= (and b!234354 res!114921) b!234355))

(assert (= (and b!234354 res!114923) b!234356))

(assert (= (and b!234356 c!39028) b!234353))

(assert (= (and b!234356 (not c!39028)) b!234352))

(assert (= (or b!234353 b!234352) bm!21783))

(assert (=> bm!21783 m!255025))

(declare-fun m!255119 () Bool)

(assert (=> bm!21783 m!255119))

(assert (=> b!234354 m!255025))

(assert (=> b!234354 m!255025))

(assert (=> b!234354 m!255067))

(assert (=> b!234355 m!255025))

(assert (=> b!234355 m!255025))

(declare-fun m!255121 () Bool)

(assert (=> b!234355 m!255121))

(assert (=> b!234356 m!255025))

(assert (=> b!234356 m!255025))

(assert (=> b!234356 m!255067))

(assert (=> b!234196 d!58955))

(declare-fun d!58957 () Bool)

(declare-fun res!114928 () Bool)

(declare-fun e!152222 () Bool)

(assert (=> d!58957 (=> res!114928 e!152222)))

(assert (=> d!58957 (= res!114928 (and ((_ is Cons!3518) (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (= (_1!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(assert (=> d!58957 (= (containsKey!255 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))) key!932) e!152222)))

(declare-fun b!234361 () Bool)

(declare-fun e!152223 () Bool)

(assert (=> b!234361 (= e!152222 e!152223)))

(declare-fun res!114929 () Bool)

(assert (=> b!234361 (=> (not res!114929) (not e!152223))))

(assert (=> b!234361 (= res!114929 (and (or (not ((_ is Cons!3518) (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) (bvsle (_1!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)) ((_ is Cons!3518) (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) (bvslt (_1!2308 (h!4168 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504))))) key!932)))))

(declare-fun b!234362 () Bool)

(assert (=> b!234362 (= e!152223 (containsKey!255 (t!8480 (toList!1764 (getCurrentListMap!1273 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)))) key!932))))

(assert (= (and d!58957 (not res!114928)) b!234361))

(assert (= (and b!234361 res!114929) b!234362))

(declare-fun m!255123 () Bool)

(assert (=> b!234362 m!255123))

(assert (=> d!58931 d!58957))

(declare-fun d!58959 () Bool)

(declare-fun e!152226 () Bool)

(assert (=> d!58959 e!152226))

(declare-fun res!114934 () Bool)

(assert (=> d!58959 (=> (not res!114934) (not e!152226))))

(declare-fun lt!118454 () ListLongMap!3497)

(assert (=> d!58959 (= res!114934 (contains!1639 lt!118454 (_1!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118455 () List!3522)

(assert (=> d!58959 (= lt!118454 (ListLongMap!3498 lt!118455))))

(declare-fun lt!118453 () Unit!7230)

(declare-fun lt!118452 () Unit!7230)

(assert (=> d!58959 (= lt!118453 lt!118452)))

(assert (=> d!58959 (= (getValueByKey!263 lt!118455 (_1!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!150 (List!3522 (_ BitVec 64) V!7873) Unit!7230)

(assert (=> d!58959 (= lt!118452 (lemmaContainsTupThenGetReturnValue!150 lt!118455 (_1!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(declare-fun insertStrictlySorted!153 (List!3522 (_ BitVec 64) V!7873) List!3522)

(assert (=> d!58959 (= lt!118455 (insertStrictlySorted!153 (toList!1764 call!21777) (_1!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (=> d!58959 (= (+!640 call!21777 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))) lt!118454)))

(declare-fun b!234367 () Bool)

(declare-fun res!114935 () Bool)

(assert (=> b!234367 (=> (not res!114935) (not e!152226))))

(assert (=> b!234367 (= res!114935 (= (getValueByKey!263 (toList!1764 lt!118454) (_1!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(declare-fun b!234368 () Bool)

(declare-fun contains!1641 (List!3522 tuple2!4594) Bool)

(assert (=> b!234368 (= e!152226 (contains!1641 (toList!1764 lt!118454) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))

(assert (= (and d!58959 res!114934) b!234367))

(assert (= (and b!234367 res!114935) b!234368))

(declare-fun m!255125 () Bool)

(assert (=> d!58959 m!255125))

(declare-fun m!255127 () Bool)

(assert (=> d!58959 m!255127))

(declare-fun m!255129 () Bool)

(assert (=> d!58959 m!255129))

(declare-fun m!255131 () Bool)

(assert (=> d!58959 m!255131))

(declare-fun m!255133 () Bool)

(assert (=> b!234367 m!255133))

(declare-fun m!255135 () Bool)

(assert (=> b!234368 m!255135))

(assert (=> b!234261 d!58959))

(declare-fun lt!118460 () SeekEntryResult!985)

(declare-fun d!58961 () Bool)

(assert (=> d!58961 (and (or ((_ is Undefined!985) lt!118460) (not ((_ is Found!985) lt!118460)) (and (bvsge (index!6111 lt!118460) #b00000000000000000000000000000000) (bvslt (index!6111 lt!118460) (size!5842 (_keys!6419 thiss!1504))))) (or ((_ is Undefined!985) lt!118460) ((_ is Found!985) lt!118460) (not ((_ is MissingVacant!985) lt!118460)) (not (= (index!6113 lt!118460) (index!6112 lt!118423))) (and (bvsge (index!6113 lt!118460) #b00000000000000000000000000000000) (bvslt (index!6113 lt!118460) (size!5842 (_keys!6419 thiss!1504))))) (or ((_ is Undefined!985) lt!118460) (ite ((_ is Found!985) lt!118460) (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6111 lt!118460)) key!932) (and ((_ is MissingVacant!985) lt!118460) (= (index!6113 lt!118460) (index!6112 lt!118423)) (= (select (arr!5506 (_keys!6419 thiss!1504)) (index!6113 lt!118460)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!152235 () SeekEntryResult!985)

(assert (=> d!58961 (= lt!118460 e!152235)))

(declare-fun c!39037 () Bool)

(assert (=> d!58961 (= c!39037 (bvsge (x!23700 lt!118423) #b01111111111111111111111111111110))))

(declare-fun lt!118461 () (_ BitVec 64))

(assert (=> d!58961 (= lt!118461 (select (arr!5506 (_keys!6419 thiss!1504)) (index!6112 lt!118423)))))

(assert (=> d!58961 (validMask!0 (mask!10301 thiss!1504))))

(assert (=> d!58961 (= (seekKeyOrZeroReturnVacant!0 (x!23700 lt!118423) (index!6112 lt!118423) (index!6112 lt!118423) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)) lt!118460)))

(declare-fun b!234381 () Bool)

(declare-fun e!152233 () SeekEntryResult!985)

(assert (=> b!234381 (= e!152233 (MissingVacant!985 (index!6112 lt!118423)))))

(declare-fun b!234382 () Bool)

(declare-fun c!39035 () Bool)

(assert (=> b!234382 (= c!39035 (= lt!118461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152234 () SeekEntryResult!985)

(assert (=> b!234382 (= e!152234 e!152233)))

(declare-fun b!234383 () Bool)

(assert (=> b!234383 (= e!152234 (Found!985 (index!6112 lt!118423)))))

(declare-fun b!234384 () Bool)

(assert (=> b!234384 (= e!152233 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23700 lt!118423) #b00000000000000000000000000000001) (nextIndex!0 (index!6112 lt!118423) (x!23700 lt!118423) (mask!10301 thiss!1504)) (index!6112 lt!118423) key!932 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(declare-fun b!234385 () Bool)

(assert (=> b!234385 (= e!152235 e!152234)))

(declare-fun c!39036 () Bool)

(assert (=> b!234385 (= c!39036 (= lt!118461 key!932))))

(declare-fun b!234386 () Bool)

(assert (=> b!234386 (= e!152235 Undefined!985)))

(assert (= (and d!58961 c!39037) b!234386))

(assert (= (and d!58961 (not c!39037)) b!234385))

(assert (= (and b!234385 c!39036) b!234383))

(assert (= (and b!234385 (not c!39036)) b!234382))

(assert (= (and b!234382 c!39035) b!234381))

(assert (= (and b!234382 (not c!39035)) b!234384))

(declare-fun m!255137 () Bool)

(assert (=> d!58961 m!255137))

(declare-fun m!255139 () Bool)

(assert (=> d!58961 m!255139))

(assert (=> d!58961 m!255079))

(assert (=> d!58961 m!254971))

(declare-fun m!255141 () Bool)

(assert (=> b!234384 m!255141))

(assert (=> b!234384 m!255141))

(declare-fun m!255143 () Bool)

(assert (=> b!234384 m!255143))

(assert (=> b!234286 d!58961))

(assert (=> b!234258 d!58941))

(declare-fun d!58963 () Bool)

(declare-fun get!2823 (Option!269) V!7873)

(assert (=> d!58963 (= (apply!207 lt!118413 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2823 (getValueByKey!263 (toList!1764 lt!118413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8657 () Bool)

(assert (= bs!8657 d!58963))

(declare-fun m!255145 () Bool)

(assert (=> bs!8657 m!255145))

(assert (=> bs!8657 m!255145))

(declare-fun m!255147 () Bool)

(assert (=> bs!8657 m!255147))

(assert (=> b!234249 d!58963))

(declare-fun d!58965 () Bool)

(declare-fun res!114944 () Bool)

(declare-fun e!152238 () Bool)

(assert (=> d!58965 (=> (not res!114944) (not e!152238))))

(assert (=> d!58965 (= res!114944 (validMask!0 (mask!10301 thiss!1504)))))

(assert (=> d!58965 (= (simpleValid!230 thiss!1504) e!152238)))

(declare-fun b!234395 () Bool)

(declare-fun res!114945 () Bool)

(assert (=> b!234395 (=> (not res!114945) (not e!152238))))

(assert (=> b!234395 (= res!114945 (and (= (size!5841 (_values!4339 thiss!1504)) (bvadd (mask!10301 thiss!1504) #b00000000000000000000000000000001)) (= (size!5842 (_keys!6419 thiss!1504)) (size!5841 (_values!4339 thiss!1504))) (bvsge (_size!1740 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1740 thiss!1504) (bvadd (mask!10301 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!234398 () Bool)

(assert (=> b!234398 (= e!152238 (and (bvsge (extraKeys!4093 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4093 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1740 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234396 () Bool)

(declare-fun res!114947 () Bool)

(assert (=> b!234396 (=> (not res!114947) (not e!152238))))

(declare-fun size!5847 (LongMapFixedSize!3382) (_ BitVec 32))

(assert (=> b!234396 (= res!114947 (bvsge (size!5847 thiss!1504) (_size!1740 thiss!1504)))))

(declare-fun b!234397 () Bool)

(declare-fun res!114946 () Bool)

(assert (=> b!234397 (=> (not res!114946) (not e!152238))))

(assert (=> b!234397 (= res!114946 (= (size!5847 thiss!1504) (bvadd (_size!1740 thiss!1504) (bvsdiv (bvadd (extraKeys!4093 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58965 res!114944) b!234395))

(assert (= (and b!234395 res!114945) b!234396))

(assert (= (and b!234396 res!114947) b!234397))

(assert (= (and b!234397 res!114946) b!234398))

(assert (=> d!58965 m!254971))

(declare-fun m!255149 () Bool)

(assert (=> b!234396 m!255149))

(assert (=> b!234397 m!255149))

(assert (=> d!58929 d!58965))

(declare-fun d!58967 () Bool)

(declare-fun e!152239 () Bool)

(assert (=> d!58967 e!152239))

(declare-fun res!114948 () Bool)

(assert (=> d!58967 (=> (not res!114948) (not e!152239))))

(declare-fun lt!118464 () ListLongMap!3497)

(assert (=> d!58967 (= res!114948 (contains!1639 lt!118464 (_1!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118465 () List!3522)

(assert (=> d!58967 (= lt!118464 (ListLongMap!3498 lt!118465))))

(declare-fun lt!118463 () Unit!7230)

(declare-fun lt!118462 () Unit!7230)

(assert (=> d!58967 (= lt!118463 lt!118462)))

(assert (=> d!58967 (= (getValueByKey!263 lt!118465 (_1!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))))))

(assert (=> d!58967 (= lt!118462 (lemmaContainsTupThenGetReturnValue!150 lt!118465 (_1!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))))))

(assert (=> d!58967 (= lt!118465 (insertStrictlySorted!153 (toList!1764 lt!118408) (_1!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))))))

(assert (=> d!58967 (= (+!640 lt!118408 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) lt!118464)))

(declare-fun b!234399 () Bool)

(declare-fun res!114949 () Bool)

(assert (=> b!234399 (=> (not res!114949) (not e!152239))))

(assert (=> b!234399 (= res!114949 (= (getValueByKey!263 (toList!1764 lt!118464) (_1!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))))))))

(declare-fun b!234400 () Bool)

(assert (=> b!234400 (= e!152239 (contains!1641 (toList!1764 lt!118464) (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))))))

(assert (= (and d!58967 res!114948) b!234399))

(assert (= (and b!234399 res!114949) b!234400))

(declare-fun m!255151 () Bool)

(assert (=> d!58967 m!255151))

(declare-fun m!255153 () Bool)

(assert (=> d!58967 m!255153))

(declare-fun m!255155 () Bool)

(assert (=> d!58967 m!255155))

(declare-fun m!255157 () Bool)

(assert (=> d!58967 m!255157))

(declare-fun m!255159 () Bool)

(assert (=> b!234399 m!255159))

(declare-fun m!255161 () Bool)

(assert (=> b!234400 m!255161))

(assert (=> b!234264 d!58967))

(declare-fun d!58969 () Bool)

(declare-fun e!152241 () Bool)

(assert (=> d!58969 e!152241))

(declare-fun res!114950 () Bool)

(assert (=> d!58969 (=> res!114950 e!152241)))

(declare-fun lt!118466 () Bool)

(assert (=> d!58969 (= res!114950 (not lt!118466))))

(declare-fun lt!118469 () Bool)

(assert (=> d!58969 (= lt!118466 lt!118469)))

(declare-fun lt!118467 () Unit!7230)

(declare-fun e!152240 () Unit!7230)

(assert (=> d!58969 (= lt!118467 e!152240)))

(declare-fun c!39038 () Bool)

(assert (=> d!58969 (= c!39038 lt!118469)))

(assert (=> d!58969 (= lt!118469 (containsKey!255 (toList!1764 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) lt!118406))))

(assert (=> d!58969 (= (contains!1639 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) lt!118406) lt!118466)))

(declare-fun b!234401 () Bool)

(declare-fun lt!118468 () Unit!7230)

(assert (=> b!234401 (= e!152240 lt!118468)))

(assert (=> b!234401 (= lt!118468 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) lt!118406))))

(assert (=> b!234401 (isDefined!205 (getValueByKey!263 (toList!1764 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) lt!118406))))

(declare-fun b!234402 () Bool)

(declare-fun Unit!7235 () Unit!7230)

(assert (=> b!234402 (= e!152240 Unit!7235)))

(declare-fun b!234403 () Bool)

(assert (=> b!234403 (= e!152241 (isDefined!205 (getValueByKey!263 (toList!1764 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) lt!118406)))))

(assert (= (and d!58969 c!39038) b!234401))

(assert (= (and d!58969 (not c!39038)) b!234402))

(assert (= (and d!58969 (not res!114950)) b!234403))

(declare-fun m!255163 () Bool)

(assert (=> d!58969 m!255163))

(declare-fun m!255165 () Bool)

(assert (=> b!234401 m!255165))

(declare-fun m!255167 () Bool)

(assert (=> b!234401 m!255167))

(assert (=> b!234401 m!255167))

(declare-fun m!255169 () Bool)

(assert (=> b!234401 m!255169))

(assert (=> b!234403 m!255167))

(assert (=> b!234403 m!255167))

(assert (=> b!234403 m!255169))

(assert (=> b!234264 d!58969))

(declare-fun d!58971 () Bool)

(assert (=> d!58971 (= (apply!207 lt!118414 lt!118396) (get!2823 (getValueByKey!263 (toList!1764 lt!118414) lt!118396)))))

(declare-fun bs!8658 () Bool)

(assert (= bs!8658 d!58971))

(declare-fun m!255171 () Bool)

(assert (=> bs!8658 m!255171))

(assert (=> bs!8658 m!255171))

(declare-fun m!255173 () Bool)

(assert (=> bs!8658 m!255173))

(assert (=> b!234264 d!58971))

(declare-fun d!58973 () Bool)

(assert (=> d!58973 (= (apply!207 (+!640 lt!118415 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) lt!118411) (apply!207 lt!118415 lt!118411))))

(declare-fun lt!118472 () Unit!7230)

(declare-fun choose!1106 (ListLongMap!3497 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7230)

(assert (=> d!58973 (= lt!118472 (choose!1106 lt!118415 lt!118404 (zeroValue!4197 thiss!1504) lt!118411))))

(declare-fun e!152244 () Bool)

(assert (=> d!58973 e!152244))

(declare-fun res!114953 () Bool)

(assert (=> d!58973 (=> (not res!114953) (not e!152244))))

(assert (=> d!58973 (= res!114953 (contains!1639 lt!118415 lt!118411))))

(assert (=> d!58973 (= (addApplyDifferent!183 lt!118415 lt!118404 (zeroValue!4197 thiss!1504) lt!118411) lt!118472)))

(declare-fun b!234407 () Bool)

(assert (=> b!234407 (= e!152244 (not (= lt!118411 lt!118404)))))

(assert (= (and d!58973 res!114953) b!234407))

(declare-fun m!255175 () Bool)

(assert (=> d!58973 m!255175))

(assert (=> d!58973 m!255039))

(assert (=> d!58973 m!255065))

(declare-fun m!255177 () Bool)

(assert (=> d!58973 m!255177))

(assert (=> d!58973 m!255039))

(assert (=> d!58973 m!255045))

(assert (=> b!234264 d!58973))

(declare-fun d!58975 () Bool)

(declare-fun e!152245 () Bool)

(assert (=> d!58975 e!152245))

(declare-fun res!114954 () Bool)

(assert (=> d!58975 (=> (not res!114954) (not e!152245))))

(declare-fun lt!118475 () ListLongMap!3497)

(assert (=> d!58975 (= res!114954 (contains!1639 lt!118475 (_1!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))))))

(declare-fun lt!118476 () List!3522)

(assert (=> d!58975 (= lt!118475 (ListLongMap!3498 lt!118476))))

(declare-fun lt!118474 () Unit!7230)

(declare-fun lt!118473 () Unit!7230)

(assert (=> d!58975 (= lt!118474 lt!118473)))

(assert (=> d!58975 (= (getValueByKey!263 lt!118476 (_1!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))))))

(assert (=> d!58975 (= lt!118473 (lemmaContainsTupThenGetReturnValue!150 lt!118476 (_1!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))))))

(assert (=> d!58975 (= lt!118476 (insertStrictlySorted!153 (toList!1764 lt!118414) (_1!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))))))

(assert (=> d!58975 (= (+!640 lt!118414 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) lt!118475)))

(declare-fun b!234408 () Bool)

(declare-fun res!114955 () Bool)

(assert (=> b!234408 (=> (not res!114955) (not e!152245))))

(assert (=> b!234408 (= res!114955 (= (getValueByKey!263 (toList!1764 lt!118475) (_1!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))))))))

(declare-fun b!234409 () Bool)

(assert (=> b!234409 (= e!152245 (contains!1641 (toList!1764 lt!118475) (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))))))

(assert (= (and d!58975 res!114954) b!234408))

(assert (= (and b!234408 res!114955) b!234409))

(declare-fun m!255179 () Bool)

(assert (=> d!58975 m!255179))

(declare-fun m!255181 () Bool)

(assert (=> d!58975 m!255181))

(declare-fun m!255183 () Bool)

(assert (=> d!58975 m!255183))

(declare-fun m!255185 () Bool)

(assert (=> d!58975 m!255185))

(declare-fun m!255187 () Bool)

(assert (=> b!234408 m!255187))

(declare-fun m!255189 () Bool)

(assert (=> b!234409 m!255189))

(assert (=> b!234264 d!58975))

(declare-fun d!58977 () Bool)

(assert (=> d!58977 (= (apply!207 (+!640 lt!118414 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) lt!118396) (get!2823 (getValueByKey!263 (toList!1764 (+!640 lt!118414 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504)))) lt!118396)))))

(declare-fun bs!8659 () Bool)

(assert (= bs!8659 d!58977))

(declare-fun m!255191 () Bool)

(assert (=> bs!8659 m!255191))

(assert (=> bs!8659 m!255191))

(declare-fun m!255193 () Bool)

(assert (=> bs!8659 m!255193))

(assert (=> b!234264 d!58977))

(declare-fun d!58979 () Bool)

(assert (=> d!58979 (= (apply!207 lt!118415 lt!118411) (get!2823 (getValueByKey!263 (toList!1764 lt!118415) lt!118411)))))

(declare-fun bs!8660 () Bool)

(assert (= bs!8660 d!58979))

(declare-fun m!255195 () Bool)

(assert (=> bs!8660 m!255195))

(assert (=> bs!8660 m!255195))

(declare-fun m!255197 () Bool)

(assert (=> bs!8660 m!255197))

(assert (=> b!234264 d!58979))

(declare-fun d!58981 () Bool)

(assert (=> d!58981 (= (apply!207 (+!640 lt!118408 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) lt!118403) (get!2823 (getValueByKey!263 (toList!1764 (+!640 lt!118408 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504)))) lt!118403)))))

(declare-fun bs!8661 () Bool)

(assert (= bs!8661 d!58981))

(declare-fun m!255199 () Bool)

(assert (=> bs!8661 m!255199))

(assert (=> bs!8661 m!255199))

(declare-fun m!255201 () Bool)

(assert (=> bs!8661 m!255201))

(assert (=> b!234264 d!58981))

(declare-fun bm!21786 () Bool)

(declare-fun call!21789 () ListLongMap!3497)

(assert (=> bm!21786 (= call!21789 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4356 thiss!1504)))))

(declare-fun b!234434 () Bool)

(declare-fun e!152265 () Bool)

(declare-fun lt!118492 () ListLongMap!3497)

(declare-fun isEmpty!513 (ListLongMap!3497) Bool)

(assert (=> b!234434 (= e!152265 (isEmpty!513 lt!118492))))

(declare-fun b!234435 () Bool)

(declare-fun e!152264 () Bool)

(declare-fun e!152260 () Bool)

(assert (=> b!234435 (= e!152264 e!152260)))

(declare-fun c!39048 () Bool)

(declare-fun e!152266 () Bool)

(assert (=> b!234435 (= c!39048 e!152266)))

(declare-fun res!114965 () Bool)

(assert (=> b!234435 (=> (not res!114965) (not e!152266))))

(assert (=> b!234435 (= res!114965 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun b!234436 () Bool)

(assert (=> b!234436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> b!234436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5841 (_values!4339 thiss!1504))))))

(declare-fun e!152263 () Bool)

(assert (=> b!234436 (= e!152263 (= (apply!207 lt!118492 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)) (get!2822 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234437 () Bool)

(assert (=> b!234437 (= e!152260 e!152263)))

(assert (=> b!234437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun res!114966 () Bool)

(assert (=> b!234437 (= res!114966 (contains!1639 lt!118492 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234437 (=> (not res!114966) (not e!152263))))

(declare-fun b!234438 () Bool)

(assert (=> b!234438 (= e!152266 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234438 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234439 () Bool)

(declare-fun e!152261 () ListLongMap!3497)

(assert (=> b!234439 (= e!152261 call!21789)))

(declare-fun d!58983 () Bool)

(assert (=> d!58983 e!152264))

(declare-fun res!114964 () Bool)

(assert (=> d!58983 (=> (not res!114964) (not e!152264))))

(assert (=> d!58983 (= res!114964 (not (contains!1639 lt!118492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!152262 () ListLongMap!3497)

(assert (=> d!58983 (= lt!118492 e!152262)))

(declare-fun c!39050 () Bool)

(assert (=> d!58983 (= c!39050 (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!58983 (validMask!0 (mask!10301 thiss!1504))))

(assert (=> d!58983 (= (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4356 thiss!1504)) lt!118492)))

(declare-fun b!234440 () Bool)

(assert (=> b!234440 (= e!152265 (= lt!118492 (getCurrentListMapNoExtraKeys!523 (_keys!6419 thiss!1504) (_values!4339 thiss!1504) (mask!10301 thiss!1504) (extraKeys!4093 thiss!1504) (zeroValue!4197 thiss!1504) (minValue!4197 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4356 thiss!1504))))))

(declare-fun b!234441 () Bool)

(assert (=> b!234441 (= e!152260 e!152265)))

(declare-fun c!39047 () Bool)

(assert (=> b!234441 (= c!39047 (bvslt #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun b!234442 () Bool)

(declare-fun lt!118493 () Unit!7230)

(declare-fun lt!118495 () Unit!7230)

(assert (=> b!234442 (= lt!118493 lt!118495)))

(declare-fun lt!118491 () ListLongMap!3497)

(declare-fun lt!118497 () V!7873)

(declare-fun lt!118494 () (_ BitVec 64))

(declare-fun lt!118496 () (_ BitVec 64))

(assert (=> b!234442 (not (contains!1639 (+!640 lt!118491 (tuple2!4595 lt!118494 lt!118497)) lt!118496))))

(declare-fun addStillNotContains!114 (ListLongMap!3497 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7230)

(assert (=> b!234442 (= lt!118495 (addStillNotContains!114 lt!118491 lt!118494 lt!118497 lt!118496))))

(assert (=> b!234442 (= lt!118496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234442 (= lt!118497 (get!2822 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234442 (= lt!118494 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234442 (= lt!118491 call!21789)))

(assert (=> b!234442 (= e!152261 (+!640 call!21789 (tuple2!4595 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000) (get!2822 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234443 () Bool)

(assert (=> b!234443 (= e!152262 e!152261)))

(declare-fun c!39049 () Bool)

(assert (=> b!234443 (= c!39049 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234444 () Bool)

(declare-fun res!114967 () Bool)

(assert (=> b!234444 (=> (not res!114967) (not e!152264))))

(assert (=> b!234444 (= res!114967 (not (contains!1639 lt!118492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234445 () Bool)

(assert (=> b!234445 (= e!152262 (ListLongMap!3498 Nil!3519))))

(assert (= (and d!58983 c!39050) b!234445))

(assert (= (and d!58983 (not c!39050)) b!234443))

(assert (= (and b!234443 c!39049) b!234442))

(assert (= (and b!234443 (not c!39049)) b!234439))

(assert (= (or b!234442 b!234439) bm!21786))

(assert (= (and d!58983 res!114964) b!234444))

(assert (= (and b!234444 res!114967) b!234435))

(assert (= (and b!234435 res!114965) b!234438))

(assert (= (and b!234435 c!39048) b!234437))

(assert (= (and b!234435 (not c!39048)) b!234441))

(assert (= (and b!234437 res!114966) b!234436))

(assert (= (and b!234441 c!39047) b!234440))

(assert (= (and b!234441 (not c!39047)) b!234434))

(declare-fun b_lambda!7861 () Bool)

(assert (=> (not b_lambda!7861) (not b!234436)))

(assert (=> b!234436 t!8482))

(declare-fun b_and!13203 () Bool)

(assert (= b_and!13201 (and (=> t!8482 result!5095) b_and!13203)))

(declare-fun b_lambda!7863 () Bool)

(assert (=> (not b_lambda!7863) (not b!234442)))

(assert (=> b!234442 t!8482))

(declare-fun b_and!13205 () Bool)

(assert (= b_and!13203 (and (=> t!8482 result!5095) b_and!13205)))

(declare-fun m!255203 () Bool)

(assert (=> b!234444 m!255203))

(assert (=> b!234438 m!255025))

(assert (=> b!234438 m!255025))

(assert (=> b!234438 m!255067))

(assert (=> b!234436 m!255027))

(assert (=> b!234436 m!255025))

(assert (=> b!234436 m!255025))

(declare-fun m!255205 () Bool)

(assert (=> b!234436 m!255205))

(assert (=> b!234436 m!255027))

(assert (=> b!234436 m!255029))

(assert (=> b!234436 m!255031))

(assert (=> b!234436 m!255029))

(declare-fun m!255207 () Bool)

(assert (=> bm!21786 m!255207))

(assert (=> b!234437 m!255025))

(assert (=> b!234437 m!255025))

(declare-fun m!255209 () Bool)

(assert (=> b!234437 m!255209))

(declare-fun m!255211 () Bool)

(assert (=> b!234434 m!255211))

(assert (=> b!234443 m!255025))

(assert (=> b!234443 m!255025))

(assert (=> b!234443 m!255067))

(assert (=> b!234442 m!255027))

(assert (=> b!234442 m!255025))

(declare-fun m!255213 () Bool)

(assert (=> b!234442 m!255213))

(declare-fun m!255215 () Bool)

(assert (=> b!234442 m!255215))

(assert (=> b!234442 m!255027))

(assert (=> b!234442 m!255029))

(assert (=> b!234442 m!255031))

(assert (=> b!234442 m!255029))

(declare-fun m!255217 () Bool)

(assert (=> b!234442 m!255217))

(declare-fun m!255219 () Bool)

(assert (=> b!234442 m!255219))

(assert (=> b!234442 m!255213))

(declare-fun m!255221 () Bool)

(assert (=> d!58983 m!255221))

(assert (=> d!58983 m!254971))

(assert (=> b!234440 m!255207))

(assert (=> b!234264 d!58983))

(declare-fun d!58985 () Bool)

(declare-fun e!152267 () Bool)

(assert (=> d!58985 e!152267))

(declare-fun res!114968 () Bool)

(assert (=> d!58985 (=> (not res!114968) (not e!152267))))

(declare-fun lt!118500 () ListLongMap!3497)

(assert (=> d!58985 (= res!114968 (contains!1639 lt!118500 (_1!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))))))

(declare-fun lt!118501 () List!3522)

(assert (=> d!58985 (= lt!118500 (ListLongMap!3498 lt!118501))))

(declare-fun lt!118499 () Unit!7230)

(declare-fun lt!118498 () Unit!7230)

(assert (=> d!58985 (= lt!118499 lt!118498)))

(assert (=> d!58985 (= (getValueByKey!263 lt!118501 (_1!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58985 (= lt!118498 (lemmaContainsTupThenGetReturnValue!150 lt!118501 (_1!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58985 (= lt!118501 (insertStrictlySorted!153 (toList!1764 lt!118399) (_1!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58985 (= (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) lt!118500)))

(declare-fun b!234446 () Bool)

(declare-fun res!114969 () Bool)

(assert (=> b!234446 (=> (not res!114969) (not e!152267))))

(assert (=> b!234446 (= res!114969 (= (getValueByKey!263 (toList!1764 lt!118500) (_1!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))))))))

(declare-fun b!234447 () Bool)

(assert (=> b!234447 (= e!152267 (contains!1641 (toList!1764 lt!118500) (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))))))

(assert (= (and d!58985 res!114968) b!234446))

(assert (= (and b!234446 res!114969) b!234447))

(declare-fun m!255223 () Bool)

(assert (=> d!58985 m!255223))

(declare-fun m!255225 () Bool)

(assert (=> d!58985 m!255225))

(declare-fun m!255227 () Bool)

(assert (=> d!58985 m!255227))

(declare-fun m!255229 () Bool)

(assert (=> d!58985 m!255229))

(declare-fun m!255231 () Bool)

(assert (=> b!234446 m!255231))

(declare-fun m!255233 () Bool)

(assert (=> b!234447 m!255233))

(assert (=> b!234264 d!58985))

(declare-fun d!58987 () Bool)

(assert (=> d!58987 (= (apply!207 lt!118408 lt!118403) (get!2823 (getValueByKey!263 (toList!1764 lt!118408) lt!118403)))))

(declare-fun bs!8662 () Bool)

(assert (= bs!8662 d!58987))

(declare-fun m!255235 () Bool)

(assert (=> bs!8662 m!255235))

(assert (=> bs!8662 m!255235))

(declare-fun m!255237 () Bool)

(assert (=> bs!8662 m!255237))

(assert (=> b!234264 d!58987))

(declare-fun d!58989 () Bool)

(assert (=> d!58989 (= (apply!207 (+!640 lt!118408 (tuple2!4595 lt!118398 (minValue!4197 thiss!1504))) lt!118403) (apply!207 lt!118408 lt!118403))))

(declare-fun lt!118502 () Unit!7230)

(assert (=> d!58989 (= lt!118502 (choose!1106 lt!118408 lt!118398 (minValue!4197 thiss!1504) lt!118403))))

(declare-fun e!152268 () Bool)

(assert (=> d!58989 e!152268))

(declare-fun res!114970 () Bool)

(assert (=> d!58989 (=> (not res!114970) (not e!152268))))

(assert (=> d!58989 (= res!114970 (contains!1639 lt!118408 lt!118403))))

(assert (=> d!58989 (= (addApplyDifferent!183 lt!118408 lt!118398 (minValue!4197 thiss!1504) lt!118403) lt!118502)))

(declare-fun b!234448 () Bool)

(assert (=> b!234448 (= e!152268 (not (= lt!118403 lt!118398)))))

(assert (= (and d!58989 res!114970) b!234448))

(declare-fun m!255239 () Bool)

(assert (=> d!58989 m!255239))

(assert (=> d!58989 m!255053))

(assert (=> d!58989 m!255035))

(declare-fun m!255241 () Bool)

(assert (=> d!58989 m!255241))

(assert (=> d!58989 m!255053))

(assert (=> d!58989 m!255055))

(assert (=> b!234264 d!58989))

(declare-fun d!58991 () Bool)

(assert (=> d!58991 (= (apply!207 (+!640 lt!118414 (tuple2!4595 lt!118402 (minValue!4197 thiss!1504))) lt!118396) (apply!207 lt!118414 lt!118396))))

(declare-fun lt!118503 () Unit!7230)

(assert (=> d!58991 (= lt!118503 (choose!1106 lt!118414 lt!118402 (minValue!4197 thiss!1504) lt!118396))))

(declare-fun e!152269 () Bool)

(assert (=> d!58991 e!152269))

(declare-fun res!114971 () Bool)

(assert (=> d!58991 (=> (not res!114971) (not e!152269))))

(assert (=> d!58991 (= res!114971 (contains!1639 lt!118414 lt!118396))))

(assert (=> d!58991 (= (addApplyDifferent!183 lt!118414 lt!118402 (minValue!4197 thiss!1504) lt!118396) lt!118503)))

(declare-fun b!234449 () Bool)

(assert (=> b!234449 (= e!152269 (not (= lt!118396 lt!118402)))))

(assert (= (and d!58991 res!114971) b!234449))

(declare-fun m!255243 () Bool)

(assert (=> d!58991 m!255243))

(assert (=> d!58991 m!255049))

(assert (=> d!58991 m!255051))

(declare-fun m!255245 () Bool)

(assert (=> d!58991 m!255245))

(assert (=> d!58991 m!255049))

(assert (=> d!58991 m!255063))

(assert (=> b!234264 d!58991))

(declare-fun d!58993 () Bool)

(assert (=> d!58993 (contains!1639 (+!640 lt!118399 (tuple2!4595 lt!118397 (zeroValue!4197 thiss!1504))) lt!118406)))

(declare-fun lt!118506 () Unit!7230)

(declare-fun choose!1107 (ListLongMap!3497 (_ BitVec 64) V!7873 (_ BitVec 64)) Unit!7230)

(assert (=> d!58993 (= lt!118506 (choose!1107 lt!118399 lt!118397 (zeroValue!4197 thiss!1504) lt!118406))))

(assert (=> d!58993 (contains!1639 lt!118399 lt!118406)))

(assert (=> d!58993 (= (addStillContains!183 lt!118399 lt!118397 (zeroValue!4197 thiss!1504) lt!118406) lt!118506)))

(declare-fun bs!8663 () Bool)

(assert (= bs!8663 d!58993))

(assert (=> bs!8663 m!255037))

(assert (=> bs!8663 m!255037))

(assert (=> bs!8663 m!255059))

(declare-fun m!255247 () Bool)

(assert (=> bs!8663 m!255247))

(declare-fun m!255249 () Bool)

(assert (=> bs!8663 m!255249))

(assert (=> b!234264 d!58993))

(declare-fun d!58995 () Bool)

(declare-fun e!152270 () Bool)

(assert (=> d!58995 e!152270))

(declare-fun res!114972 () Bool)

(assert (=> d!58995 (=> (not res!114972) (not e!152270))))

(declare-fun lt!118509 () ListLongMap!3497)

(assert (=> d!58995 (= res!114972 (contains!1639 lt!118509 (_1!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))))))

(declare-fun lt!118510 () List!3522)

(assert (=> d!58995 (= lt!118509 (ListLongMap!3498 lt!118510))))

(declare-fun lt!118508 () Unit!7230)

(declare-fun lt!118507 () Unit!7230)

(assert (=> d!58995 (= lt!118508 lt!118507)))

(assert (=> d!58995 (= (getValueByKey!263 lt!118510 (_1!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58995 (= lt!118507 (lemmaContainsTupThenGetReturnValue!150 lt!118510 (_1!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58995 (= lt!118510 (insertStrictlySorted!153 (toList!1764 lt!118415) (_1!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) (_2!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))))))

(assert (=> d!58995 (= (+!640 lt!118415 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) lt!118509)))

(declare-fun b!234451 () Bool)

(declare-fun res!114973 () Bool)

(assert (=> b!234451 (=> (not res!114973) (not e!152270))))

(assert (=> b!234451 (= res!114973 (= (getValueByKey!263 (toList!1764 lt!118509) (_1!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))) (Some!268 (_2!2308 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))))))))

(declare-fun b!234452 () Bool)

(assert (=> b!234452 (= e!152270 (contains!1641 (toList!1764 lt!118509) (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))))))

(assert (= (and d!58995 res!114972) b!234451))

(assert (= (and b!234451 res!114973) b!234452))

(declare-fun m!255251 () Bool)

(assert (=> d!58995 m!255251))

(declare-fun m!255253 () Bool)

(assert (=> d!58995 m!255253))

(declare-fun m!255255 () Bool)

(assert (=> d!58995 m!255255))

(declare-fun m!255257 () Bool)

(assert (=> d!58995 m!255257))

(declare-fun m!255259 () Bool)

(assert (=> b!234451 m!255259))

(declare-fun m!255261 () Bool)

(assert (=> b!234452 m!255261))

(assert (=> b!234264 d!58995))

(declare-fun d!58997 () Bool)

(assert (=> d!58997 (= (apply!207 (+!640 lt!118415 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504))) lt!118411) (get!2823 (getValueByKey!263 (toList!1764 (+!640 lt!118415 (tuple2!4595 lt!118404 (zeroValue!4197 thiss!1504)))) lt!118411)))))

(declare-fun bs!8664 () Bool)

(assert (= bs!8664 d!58997))

(declare-fun m!255263 () Bool)

(assert (=> bs!8664 m!255263))

(assert (=> bs!8664 m!255263))

(declare-fun m!255265 () Bool)

(assert (=> bs!8664 m!255265))

(assert (=> b!234264 d!58997))

(declare-fun b!234461 () Bool)

(declare-fun e!152279 () Bool)

(declare-fun call!21792 () Bool)

(assert (=> b!234461 (= e!152279 call!21792)))

(declare-fun d!58999 () Bool)

(declare-fun res!114978 () Bool)

(declare-fun e!152278 () Bool)

(assert (=> d!58999 (=> res!114978 e!152278)))

(assert (=> d!58999 (= res!114978 (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!58999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6419 thiss!1504) (mask!10301 thiss!1504)) e!152278)))

(declare-fun b!234462 () Bool)

(assert (=> b!234462 (= e!152278 e!152279)))

(declare-fun c!39053 () Bool)

(assert (=> b!234462 (= c!39053 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234463 () Bool)

(declare-fun e!152277 () Bool)

(assert (=> b!234463 (= e!152277 call!21792)))

(declare-fun b!234464 () Bool)

(assert (=> b!234464 (= e!152279 e!152277)))

(declare-fun lt!118519 () (_ BitVec 64))

(assert (=> b!234464 (= lt!118519 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118517 () Unit!7230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11583 (_ BitVec 64) (_ BitVec 32)) Unit!7230)

(assert (=> b!234464 (= lt!118517 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6419 thiss!1504) lt!118519 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234464 (arrayContainsKey!0 (_keys!6419 thiss!1504) lt!118519 #b00000000000000000000000000000000)))

(declare-fun lt!118518 () Unit!7230)

(assert (=> b!234464 (= lt!118518 lt!118517)))

(declare-fun res!114979 () Bool)

(assert (=> b!234464 (= res!114979 (= (seekEntryOrOpen!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000) (_keys!6419 thiss!1504) (mask!10301 thiss!1504)) (Found!985 #b00000000000000000000000000000000)))))

(assert (=> b!234464 (=> (not res!114979) (not e!152277))))

(declare-fun bm!21789 () Bool)

(assert (=> bm!21789 (= call!21792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6419 thiss!1504) (mask!10301 thiss!1504)))))

(assert (= (and d!58999 (not res!114978)) b!234462))

(assert (= (and b!234462 c!39053) b!234464))

(assert (= (and b!234462 (not c!39053)) b!234461))

(assert (= (and b!234464 res!114979) b!234463))

(assert (= (or b!234463 b!234461) bm!21789))

(assert (=> b!234462 m!255025))

(assert (=> b!234462 m!255025))

(assert (=> b!234462 m!255067))

(assert (=> b!234464 m!255025))

(declare-fun m!255267 () Bool)

(assert (=> b!234464 m!255267))

(declare-fun m!255269 () Bool)

(assert (=> b!234464 m!255269))

(assert (=> b!234464 m!255025))

(declare-fun m!255271 () Bool)

(assert (=> b!234464 m!255271))

(declare-fun m!255273 () Bool)

(assert (=> bm!21789 m!255273))

(assert (=> b!234195 d!58999))

(declare-fun d!59001 () Bool)

(declare-fun e!152281 () Bool)

(assert (=> d!59001 e!152281))

(declare-fun res!114980 () Bool)

(assert (=> d!59001 (=> res!114980 e!152281)))

(declare-fun lt!118520 () Bool)

(assert (=> d!59001 (= res!114980 (not lt!118520))))

(declare-fun lt!118523 () Bool)

(assert (=> d!59001 (= lt!118520 lt!118523)))

(declare-fun lt!118521 () Unit!7230)

(declare-fun e!152280 () Unit!7230)

(assert (=> d!59001 (= lt!118521 e!152280)))

(declare-fun c!39054 () Bool)

(assert (=> d!59001 (= c!39054 lt!118523)))

(assert (=> d!59001 (= lt!118523 (containsKey!255 (toList!1764 lt!118413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59001 (= (contains!1639 lt!118413 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118520)))

(declare-fun b!234465 () Bool)

(declare-fun lt!118522 () Unit!7230)

(assert (=> b!234465 (= e!152280 lt!118522)))

(assert (=> b!234465 (= lt!118522 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 lt!118413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234465 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234466 () Bool)

(declare-fun Unit!7236 () Unit!7230)

(assert (=> b!234466 (= e!152280 Unit!7236)))

(declare-fun b!234467 () Bool)

(assert (=> b!234467 (= e!152281 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59001 c!39054) b!234465))

(assert (= (and d!59001 (not c!39054)) b!234466))

(assert (= (and d!59001 (not res!114980)) b!234467))

(declare-fun m!255275 () Bool)

(assert (=> d!59001 m!255275))

(declare-fun m!255277 () Bool)

(assert (=> b!234465 m!255277))

(assert (=> b!234465 m!255145))

(assert (=> b!234465 m!255145))

(declare-fun m!255279 () Bool)

(assert (=> b!234465 m!255279))

(assert (=> b!234467 m!255145))

(assert (=> b!234467 m!255145))

(assert (=> b!234467 m!255279))

(assert (=> bm!21774 d!59001))

(declare-fun d!59003 () Bool)

(assert (=> d!59003 (= (apply!207 lt!118413 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)) (get!2823 (getValueByKey!263 (toList!1764 lt!118413) (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8665 () Bool)

(assert (= bs!8665 d!59003))

(assert (=> bs!8665 m!255025))

(assert (=> bs!8665 m!255115))

(assert (=> bs!8665 m!255115))

(declare-fun m!255281 () Bool)

(assert (=> bs!8665 m!255281))

(assert (=> b!234265 d!59003))

(declare-fun d!59005 () Bool)

(declare-fun c!39057 () Bool)

(assert (=> d!59005 (= c!39057 ((_ is ValueCellFull!2741) (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152284 () V!7873)

(assert (=> d!59005 (= (get!2822 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152284)))

(declare-fun b!234472 () Bool)

(declare-fun get!2824 (ValueCell!2741 V!7873) V!7873)

(assert (=> b!234472 (= e!152284 (get!2824 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234473 () Bool)

(declare-fun get!2825 (ValueCell!2741 V!7873) V!7873)

(assert (=> b!234473 (= e!152284 (get!2825 (select (arr!5505 (_values!4339 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!541 (defaultEntry!4356 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59005 c!39057) b!234472))

(assert (= (and d!59005 (not c!39057)) b!234473))

(assert (=> b!234472 m!255027))

(assert (=> b!234472 m!255029))

(declare-fun m!255283 () Bool)

(assert (=> b!234472 m!255283))

(assert (=> b!234473 m!255027))

(assert (=> b!234473 m!255029))

(declare-fun m!255285 () Bool)

(assert (=> b!234473 m!255285))

(assert (=> b!234265 d!59005))

(declare-fun b!234482 () Bool)

(declare-fun e!152290 () (_ BitVec 32))

(declare-fun e!152289 () (_ BitVec 32))

(assert (=> b!234482 (= e!152290 e!152289)))

(declare-fun c!39062 () Bool)

(assert (=> b!234482 (= c!39062 (validKeyInArray!0 (select (arr!5506 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59007 () Bool)

(declare-fun lt!118526 () (_ BitVec 32))

(assert (=> d!59007 (and (bvsge lt!118526 #b00000000000000000000000000000000) (bvsle lt!118526 (bvsub (size!5842 (_keys!6419 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59007 (= lt!118526 e!152290)))

(declare-fun c!39063 () Bool)

(assert (=> d!59007 (= c!39063 (bvsge #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!59007 (and (bvsle #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5842 (_keys!6419 thiss!1504)) (size!5842 (_keys!6419 thiss!1504))))))

(assert (=> d!59007 (= (arrayCountValidKeys!0 (_keys!6419 thiss!1504) #b00000000000000000000000000000000 (size!5842 (_keys!6419 thiss!1504))) lt!118526)))

(declare-fun b!234483 () Bool)

(declare-fun call!21795 () (_ BitVec 32))

(assert (=> b!234483 (= e!152289 call!21795)))

(declare-fun bm!21792 () Bool)

(assert (=> bm!21792 (= call!21795 (arrayCountValidKeys!0 (_keys!6419 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5842 (_keys!6419 thiss!1504))))))

(declare-fun b!234484 () Bool)

(assert (=> b!234484 (= e!152289 (bvadd #b00000000000000000000000000000001 call!21795))))

(declare-fun b!234485 () Bool)

(assert (=> b!234485 (= e!152290 #b00000000000000000000000000000000)))

(assert (= (and d!59007 c!39063) b!234485))

(assert (= (and d!59007 (not c!39063)) b!234482))

(assert (= (and b!234482 c!39062) b!234484))

(assert (= (and b!234482 (not c!39062)) b!234483))

(assert (= (or b!234484 b!234483) bm!21792))

(assert (=> b!234482 m!255025))

(assert (=> b!234482 m!255025))

(assert (=> b!234482 m!255067))

(declare-fun m!255287 () Bool)

(assert (=> bm!21792 m!255287))

(assert (=> b!234194 d!59007))

(declare-fun d!59009 () Bool)

(assert (=> d!59009 (= (apply!207 lt!118413 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2823 (getValueByKey!263 (toList!1764 lt!118413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8666 () Bool)

(assert (= bs!8666 d!59009))

(declare-fun m!255289 () Bool)

(assert (=> bs!8666 m!255289))

(assert (=> bs!8666 m!255289))

(declare-fun m!255291 () Bool)

(assert (=> bs!8666 m!255291))

(assert (=> b!234263 d!59009))

(assert (=> bm!21778 d!58983))

(declare-fun d!59011 () Bool)

(declare-fun e!152291 () Bool)

(assert (=> d!59011 e!152291))

(declare-fun res!114981 () Bool)

(assert (=> d!59011 (=> (not res!114981) (not e!152291))))

(declare-fun lt!118529 () ListLongMap!3497)

(assert (=> d!59011 (= res!114981 (contains!1639 lt!118529 (_1!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(declare-fun lt!118530 () List!3522)

(assert (=> d!59011 (= lt!118529 (ListLongMap!3498 lt!118530))))

(declare-fun lt!118528 () Unit!7230)

(declare-fun lt!118527 () Unit!7230)

(assert (=> d!59011 (= lt!118528 lt!118527)))

(assert (=> d!59011 (= (getValueByKey!263 lt!118530 (_1!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))) (Some!268 (_2!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59011 (= lt!118527 (lemmaContainsTupThenGetReturnValue!150 lt!118530 (_1!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (_2!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59011 (= lt!118530 (insertStrictlySorted!153 (toList!1764 (ite c!39000 call!21779 (ite c!38998 call!21781 call!21782))) (_1!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) (_2!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))))))

(assert (=> d!59011 (= (+!640 (ite c!39000 call!21779 (ite c!38998 call!21781 call!21782)) (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))) lt!118529)))

(declare-fun b!234486 () Bool)

(declare-fun res!114982 () Bool)

(assert (=> b!234486 (=> (not res!114982) (not e!152291))))

(assert (=> b!234486 (= res!114982 (= (getValueByKey!263 (toList!1764 lt!118529) (_1!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504))))) (Some!268 (_2!2308 (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))))

(declare-fun b!234487 () Bool)

(assert (=> b!234487 (= e!152291 (contains!1641 (toList!1764 lt!118529) (ite (or c!39000 c!38998) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4197 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4197 thiss!1504)))))))

(assert (= (and d!59011 res!114981) b!234486))

(assert (= (and b!234486 res!114982) b!234487))

(declare-fun m!255293 () Bool)

(assert (=> d!59011 m!255293))

(declare-fun m!255295 () Bool)

(assert (=> d!59011 m!255295))

(declare-fun m!255297 () Bool)

(assert (=> d!59011 m!255297))

(declare-fun m!255299 () Bool)

(assert (=> d!59011 m!255299))

(declare-fun m!255301 () Bool)

(assert (=> b!234486 m!255301))

(declare-fun m!255303 () Bool)

(assert (=> b!234487 m!255303))

(assert (=> bm!21779 d!59011))

(declare-fun d!59013 () Bool)

(declare-fun e!152293 () Bool)

(assert (=> d!59013 e!152293))

(declare-fun res!114983 () Bool)

(assert (=> d!59013 (=> res!114983 e!152293)))

(declare-fun lt!118531 () Bool)

(assert (=> d!59013 (= res!114983 (not lt!118531))))

(declare-fun lt!118534 () Bool)

(assert (=> d!59013 (= lt!118531 lt!118534)))

(declare-fun lt!118532 () Unit!7230)

(declare-fun e!152292 () Unit!7230)

(assert (=> d!59013 (= lt!118532 e!152292)))

(declare-fun c!39064 () Bool)

(assert (=> d!59013 (= c!39064 lt!118534)))

(assert (=> d!59013 (= lt!118534 (containsKey!255 (toList!1764 lt!118413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59013 (= (contains!1639 lt!118413 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118531)))

(declare-fun b!234488 () Bool)

(declare-fun lt!118533 () Unit!7230)

(assert (=> b!234488 (= e!152292 lt!118533)))

(assert (=> b!234488 (= lt!118533 (lemmaContainsKeyImpliesGetValueByKeyDefined!204 (toList!1764 lt!118413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234488 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234489 () Bool)

(declare-fun Unit!7237 () Unit!7230)

(assert (=> b!234489 (= e!152292 Unit!7237)))

(declare-fun b!234490 () Bool)

(assert (=> b!234490 (= e!152293 (isDefined!205 (getValueByKey!263 (toList!1764 lt!118413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59013 c!39064) b!234488))

(assert (= (and d!59013 (not c!39064)) b!234489))

(assert (= (and d!59013 (not res!114983)) b!234490))

(declare-fun m!255305 () Bool)

(assert (=> d!59013 m!255305))

(declare-fun m!255307 () Bool)

(assert (=> b!234488 m!255307))

(assert (=> b!234488 m!255289))

(assert (=> b!234488 m!255289))

(declare-fun m!255309 () Bool)

(assert (=> b!234488 m!255309))

(assert (=> b!234490 m!255289))

(assert (=> b!234490 m!255289))

(assert (=> b!234490 m!255309))

(assert (=> bm!21775 d!59013))

(declare-fun b!234491 () Bool)

(declare-fun e!152295 () Bool)

(assert (=> b!234491 (= e!152295 tp_is_empty!6169)))

(declare-fun condMapEmpty!10447 () Bool)

(declare-fun mapDefault!10447 () ValueCell!2741)

(assert (=> mapNonEmpty!10446 (= condMapEmpty!10447 (= mapRest!10446 ((as const (Array (_ BitVec 32) ValueCell!2741)) mapDefault!10447)))))

(declare-fun e!152294 () Bool)

(declare-fun mapRes!10447 () Bool)

(assert (=> mapNonEmpty!10446 (= tp!22092 (and e!152294 mapRes!10447))))

(declare-fun mapIsEmpty!10447 () Bool)

(assert (=> mapIsEmpty!10447 mapRes!10447))

(declare-fun mapNonEmpty!10447 () Bool)

(declare-fun tp!22093 () Bool)

(assert (=> mapNonEmpty!10447 (= mapRes!10447 (and tp!22093 e!152295))))

(declare-fun mapKey!10447 () (_ BitVec 32))

(declare-fun mapValue!10447 () ValueCell!2741)

(declare-fun mapRest!10447 () (Array (_ BitVec 32) ValueCell!2741))

(assert (=> mapNonEmpty!10447 (= mapRest!10446 (store mapRest!10447 mapKey!10447 mapValue!10447))))

(declare-fun b!234492 () Bool)

(assert (=> b!234492 (= e!152294 tp_is_empty!6169)))

(assert (= (and mapNonEmpty!10446 condMapEmpty!10447) mapIsEmpty!10447))

(assert (= (and mapNonEmpty!10446 (not condMapEmpty!10447)) mapNonEmpty!10447))

(assert (= (and mapNonEmpty!10447 ((_ is ValueCellFull!2741) mapValue!10447)) b!234491))

(assert (= (and mapNonEmpty!10446 ((_ is ValueCellFull!2741) mapDefault!10447)) b!234492))

(declare-fun m!255311 () Bool)

(assert (=> mapNonEmpty!10447 m!255311))

(declare-fun b_lambda!7865 () Bool)

(assert (= b_lambda!7863 (or (and b!234126 b_free!6307) b_lambda!7865)))

(declare-fun b_lambda!7867 () Bool)

(assert (= b_lambda!7861 (or (and b!234126 b_free!6307) b_lambda!7867)))

(check-sat (not bm!21783) (not d!59001) (not b!234397) (not b!234356) (not b!234341) (not d!58949) (not d!59009) (not b!234462) (not d!58965) (not b_next!6307) (not d!58985) (not d!58963) b_and!13205 (not b!234442) (not b!234473) (not b!234488) (not d!58943) (not b!234452) (not b!234400) (not b!234354) (not b!234436) (not b!234443) (not b!234487) (not d!58959) (not b!234438) (not d!59003) (not b!234465) (not b!234310) (not d!58945) (not bm!21786) (not b!234299) (not b!234451) (not d!58971) (not d!58983) (not d!58991) (not d!58969) (not b!234467) (not b!234409) (not b_lambda!7865) (not b!234434) (not d!59011) (not b!234368) (not d!58953) (not d!58987) (not b!234444) (not b!234403) (not d!58981) (not b!234367) (not b!234446) (not b!234408) tp_is_empty!6169 (not b!234486) (not d!58977) (not d!58975) (not d!58967) (not d!58973) (not d!58979) (not mapNonEmpty!10447) (not b!234384) (not bm!21792) (not d!58993) (not d!58997) (not b!234331) (not d!58989) (not b!234339) (not bm!21789) (not b!234437) (not b!234482) (not b!234447) (not b!234464) (not d!58961) (not b!234355) (not b_lambda!7867) (not b!234399) (not b!234490) (not b!234396) (not d!58995) (not b!234362) (not b_lambda!7859) (not b!234472) (not b!234440) (not d!59013) (not b!234401))
(check-sat b_and!13205 (not b_next!6307))
