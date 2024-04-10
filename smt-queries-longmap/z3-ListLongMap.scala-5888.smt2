; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75860 () Bool)

(assert start!75860)

(declare-fun b!892778 () Bool)

(declare-fun b_free!15831 () Bool)

(declare-fun b_next!15831 () Bool)

(assert (=> b!892778 (= b_free!15831 (not b_next!15831))))

(declare-fun tp!55461 () Bool)

(declare-fun b_and!26085 () Bool)

(assert (=> b!892778 (= tp!55461 b_and!26085)))

(declare-fun b!892764 () Bool)

(declare-fun e!498452 () Bool)

(declare-datatypes ((SeekEntryResult!8855 0))(
  ( (MissingZero!8855 (index!37791 (_ BitVec 32))) (Found!8855 (index!37792 (_ BitVec 32))) (Intermediate!8855 (undefined!9667 Bool) (index!37793 (_ BitVec 32)) (x!75887 (_ BitVec 32))) (Undefined!8855) (MissingVacant!8855 (index!37794 (_ BitVec 32))) )
))
(declare-fun lt!403331 () SeekEntryResult!8855)

(declare-datatypes ((array!52298 0))(
  ( (array!52299 (arr!25155 (Array (_ BitVec 32) (_ BitVec 64))) (size!25599 (_ BitVec 32))) )
))
(declare-datatypes ((V!29177 0))(
  ( (V!29178 (val!9130 Int)) )
))
(declare-datatypes ((ValueCell!8598 0))(
  ( (ValueCellFull!8598 (v!11608 V!29177)) (EmptyCell!8598) )
))
(declare-datatypes ((array!52300 0))(
  ( (array!52301 (arr!25156 (Array (_ BitVec 32) ValueCell!8598)) (size!25600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4212 0))(
  ( (LongMapFixedSize!4213 (defaultEntry!5303 Int) (mask!25820 (_ BitVec 32)) (extraKeys!4997 (_ BitVec 32)) (zeroValue!5101 V!29177) (minValue!5101 V!29177) (_size!2161 (_ BitVec 32)) (_keys!9986 array!52298) (_values!5288 array!52300) (_vacant!2161 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4212)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892764 (= e!498452 (inRange!0 (index!37792 lt!403331) (mask!25820 thiss!1181)))))

(declare-fun mapNonEmpty!28793 () Bool)

(declare-fun mapRes!28793 () Bool)

(declare-fun tp!55462 () Bool)

(declare-fun e!498451 () Bool)

(assert (=> mapNonEmpty!28793 (= mapRes!28793 (and tp!55462 e!498451))))

(declare-fun mapRest!28793 () (Array (_ BitVec 32) ValueCell!8598))

(declare-fun mapKey!28793 () (_ BitVec 32))

(declare-fun mapValue!28793 () ValueCell!8598)

(assert (=> mapNonEmpty!28793 (= (arr!25156 (_values!5288 thiss!1181)) (store mapRest!28793 mapKey!28793 mapValue!28793))))

(declare-fun call!39558 () V!29177)

(declare-fun e!498460 () Bool)

(declare-fun b!892765 () Bool)

(declare-fun get!13242 (ValueCell!8598 V!29177) V!29177)

(declare-fun dynLambda!1296 (Int (_ BitVec 64)) V!29177)

(assert (=> b!892765 (= e!498460 (= call!39558 (get!13242 (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331)) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!892766 () Bool)

(declare-fun e!498454 () Bool)

(declare-fun e!498461 () Bool)

(assert (=> b!892766 (= e!498454 (and e!498461 mapRes!28793))))

(declare-fun condMapEmpty!28793 () Bool)

(declare-fun mapDefault!28793 () ValueCell!8598)

(assert (=> b!892766 (= condMapEmpty!28793 (= (arr!25156 (_values!5288 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8598)) mapDefault!28793)))))

(declare-fun res!604763 () Bool)

(declare-fun e!498453 () Bool)

(assert (=> start!75860 (=> (not res!604763) (not e!498453))))

(declare-fun valid!1628 (LongMapFixedSize!4212) Bool)

(assert (=> start!75860 (= res!604763 (valid!1628 thiss!1181))))

(assert (=> start!75860 e!498453))

(declare-fun e!498462 () Bool)

(assert (=> start!75860 e!498462))

(assert (=> start!75860 true))

(declare-fun b!892767 () Bool)

(declare-fun e!498458 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!451 0))(
  ( (Some!450 (v!11609 V!29177)) (None!449) )
))
(declare-fun isDefined!324 (Option!451) Bool)

(declare-datatypes ((tuple2!12010 0))(
  ( (tuple2!12011 (_1!6016 (_ BitVec 64)) (_2!6016 V!29177)) )
))
(declare-datatypes ((List!17792 0))(
  ( (Nil!17789) (Cons!17788 (h!18919 tuple2!12010) (t!25107 List!17792)) )
))
(declare-fun getValueByKey!445 (List!17792 (_ BitVec 64)) Option!451)

(declare-datatypes ((ListLongMap!10707 0))(
  ( (ListLongMap!10708 (toList!5369 List!17792)) )
))
(declare-fun map!12204 (LongMapFixedSize!4212) ListLongMap!10707)

(assert (=> b!892767 (= e!498458 (isDefined!324 (getValueByKey!445 (toList!5369 (map!12204 thiss!1181)) key!785)))))

(declare-fun b!892768 () Bool)

(declare-fun tp_is_empty!18159 () Bool)

(assert (=> b!892768 (= e!498451 tp_is_empty!18159)))

(declare-fun b!892769 () Bool)

(declare-fun e!498459 () Bool)

(assert (=> b!892769 (= e!498459 e!498458)))

(declare-fun res!604766 () Bool)

(assert (=> b!892769 (=> res!604766 e!498458)))

(declare-fun contains!4373 (LongMapFixedSize!4212 (_ BitVec 64)) Bool)

(assert (=> b!892769 (= res!604766 (not (contains!4373 thiss!1181 key!785)))))

(declare-fun e!498457 () Bool)

(assert (=> b!892769 e!498457))

(declare-fun c!93992 () Bool)

(assert (=> b!892769 (= c!93992 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30404 0))(
  ( (Unit!30405) )
))
(declare-fun lt!403330 () Unit!30404)

(declare-fun lemmaKeyInListMapThenSameValueInArray!9 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 64) (_ BitVec 32) Int) Unit!30404)

(assert (=> b!892769 (= lt!403330 (lemmaKeyInListMapThenSameValueInArray!9 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785 (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403328 () ListLongMap!10707)

(declare-fun contains!4374 (ListLongMap!10707 (_ BitVec 64)) Bool)

(assert (=> b!892769 (contains!4374 lt!403328 (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331)))))

(declare-fun getCurrentListMap!2648 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 32) Int) ListLongMap!10707)

(assert (=> b!892769 (= lt!403328 (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403332 () Unit!30404)

(declare-fun lemmaValidKeyInArrayIsInListMap!237 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 32) Int) Unit!30404)

(assert (=> b!892769 (= lt!403332 (lemmaValidKeyInArrayIsInListMap!237 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892769 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403333 () Unit!30404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52298 (_ BitVec 64) (_ BitVec 32)) Unit!30404)

(assert (=> b!892769 (= lt!403333 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9986 thiss!1181) key!785 (index!37792 lt!403331)))))

(declare-fun mapIsEmpty!28793 () Bool)

(assert (=> mapIsEmpty!28793 mapRes!28793))

(declare-fun b!892770 () Bool)

(assert (=> b!892770 (= e!498461 tp_is_empty!18159)))

(declare-fun b!892771 () Bool)

(declare-fun res!604764 () Bool)

(declare-fun e!498456 () Bool)

(assert (=> b!892771 (=> (not res!604764) (not e!498456))))

(assert (=> b!892771 (= res!604764 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892771 (= e!498460 e!498456)))

(declare-fun b!892772 () Bool)

(assert (=> b!892772 (= e!498456 (= call!39558 (minValue!5101 thiss!1181)))))

(declare-fun b!892773 () Bool)

(declare-fun e!498455 () Bool)

(declare-fun call!39557 () V!29177)

(assert (=> b!892773 (= e!498455 (= call!39557 (zeroValue!5101 thiss!1181)))))

(declare-fun b!892774 () Bool)

(assert (=> b!892774 (= e!498457 e!498455)))

(declare-fun res!604768 () Bool)

(assert (=> b!892774 (= res!604768 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892774 (=> (not res!604768) (not e!498455))))

(declare-fun b!892775 () Bool)

(assert (=> b!892775 (= e!498453 (not e!498459))))

(declare-fun res!604765 () Bool)

(assert (=> b!892775 (=> res!604765 e!498459)))

(get-info :version)

(assert (=> b!892775 (= res!604765 (not ((_ is Found!8855) lt!403331)))))

(assert (=> b!892775 e!498452))

(declare-fun res!604769 () Bool)

(assert (=> b!892775 (=> res!604769 e!498452)))

(assert (=> b!892775 (= res!604769 (not ((_ is Found!8855) lt!403331)))))

(declare-fun lt!403329 () Unit!30404)

(declare-fun lemmaSeekEntryGivesInRangeIndex!54 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 64)) Unit!30404)

(assert (=> b!892775 (= lt!403329 (lemmaSeekEntryGivesInRangeIndex!54 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52298 (_ BitVec 32)) SeekEntryResult!8855)

(assert (=> b!892775 (= lt!403331 (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun bm!39554 () Bool)

(declare-fun apply!406 (ListLongMap!10707 (_ BitVec 64)) V!29177)

(assert (=> bm!39554 (= call!39557 (apply!406 lt!403328 key!785))))

(declare-fun b!892776 () Bool)

(assert (=> b!892776 (= e!498457 e!498460)))

(declare-fun c!93993 () Bool)

(assert (=> b!892776 (= c!93993 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892777 () Bool)

(declare-fun res!604767 () Bool)

(assert (=> b!892777 (=> (not res!604767) (not e!498453))))

(assert (=> b!892777 (= res!604767 (not (= key!785 (bvneg key!785))))))

(declare-fun bm!39555 () Bool)

(assert (=> bm!39555 (= call!39558 call!39557)))

(declare-fun array_inv!19756 (array!52298) Bool)

(declare-fun array_inv!19757 (array!52300) Bool)

(assert (=> b!892778 (= e!498462 (and tp!55461 tp_is_empty!18159 (array_inv!19756 (_keys!9986 thiss!1181)) (array_inv!19757 (_values!5288 thiss!1181)) e!498454))))

(assert (= (and start!75860 res!604763) b!892777))

(assert (= (and b!892777 res!604767) b!892775))

(assert (= (and b!892775 (not res!604769)) b!892764))

(assert (= (and b!892775 (not res!604765)) b!892769))

(assert (= (and b!892769 c!93992) b!892774))

(assert (= (and b!892769 (not c!93992)) b!892776))

(assert (= (and b!892774 res!604768) b!892773))

(assert (= (and b!892776 c!93993) b!892771))

(assert (= (and b!892776 (not c!93993)) b!892765))

(assert (= (and b!892771 res!604764) b!892772))

(assert (= (or b!892772 b!892765) bm!39555))

(assert (= (or b!892773 bm!39555) bm!39554))

(assert (= (and b!892769 (not res!604766)) b!892767))

(assert (= (and b!892766 condMapEmpty!28793) mapIsEmpty!28793))

(assert (= (and b!892766 (not condMapEmpty!28793)) mapNonEmpty!28793))

(assert (= (and mapNonEmpty!28793 ((_ is ValueCellFull!8598) mapValue!28793)) b!892768))

(assert (= (and b!892766 ((_ is ValueCellFull!8598) mapDefault!28793)) b!892770))

(assert (= b!892778 b!892766))

(assert (= start!75860 b!892778))

(declare-fun b_lambda!12897 () Bool)

(assert (=> (not b_lambda!12897) (not b!892765)))

(declare-fun t!25106 () Bool)

(declare-fun tb!5165 () Bool)

(assert (=> (and b!892778 (= (defaultEntry!5303 thiss!1181) (defaultEntry!5303 thiss!1181)) t!25106) tb!5165))

(declare-fun result!10041 () Bool)

(assert (=> tb!5165 (= result!10041 tp_is_empty!18159)))

(assert (=> b!892765 t!25106))

(declare-fun b_and!26087 () Bool)

(assert (= b_and!26085 (and (=> t!25106 result!10041) b_and!26087)))

(declare-fun m!830969 () Bool)

(assert (=> bm!39554 m!830969))

(declare-fun m!830971 () Bool)

(assert (=> b!892778 m!830971))

(declare-fun m!830973 () Bool)

(assert (=> b!892778 m!830973))

(declare-fun m!830975 () Bool)

(assert (=> b!892767 m!830975))

(declare-fun m!830977 () Bool)

(assert (=> b!892767 m!830977))

(assert (=> b!892767 m!830977))

(declare-fun m!830979 () Bool)

(assert (=> b!892767 m!830979))

(declare-fun m!830981 () Bool)

(assert (=> b!892764 m!830981))

(declare-fun m!830983 () Bool)

(assert (=> b!892769 m!830983))

(declare-fun m!830985 () Bool)

(assert (=> b!892769 m!830985))

(declare-fun m!830987 () Bool)

(assert (=> b!892769 m!830987))

(declare-fun m!830989 () Bool)

(assert (=> b!892769 m!830989))

(assert (=> b!892769 m!830985))

(declare-fun m!830991 () Bool)

(assert (=> b!892769 m!830991))

(declare-fun m!830993 () Bool)

(assert (=> b!892769 m!830993))

(declare-fun m!830995 () Bool)

(assert (=> b!892769 m!830995))

(declare-fun m!830997 () Bool)

(assert (=> b!892769 m!830997))

(declare-fun m!830999 () Bool)

(assert (=> b!892765 m!830999))

(declare-fun m!831001 () Bool)

(assert (=> b!892765 m!831001))

(assert (=> b!892765 m!830999))

(assert (=> b!892765 m!831001))

(declare-fun m!831003 () Bool)

(assert (=> b!892765 m!831003))

(declare-fun m!831005 () Bool)

(assert (=> b!892775 m!831005))

(declare-fun m!831007 () Bool)

(assert (=> b!892775 m!831007))

(declare-fun m!831009 () Bool)

(assert (=> mapNonEmpty!28793 m!831009))

(declare-fun m!831011 () Bool)

(assert (=> start!75860 m!831011))

(check-sat (not bm!39554) (not b!892767) (not b!892765) (not mapNonEmpty!28793) (not b!892769) (not b!892764) (not b!892775) (not b_lambda!12897) b_and!26087 (not b_next!15831) (not b!892778) (not start!75860) tp_is_empty!18159)
(check-sat b_and!26087 (not b_next!15831))
(get-model)

(declare-fun b_lambda!12901 () Bool)

(assert (= b_lambda!12897 (or (and b!892778 b_free!15831) b_lambda!12901)))

(check-sat (not bm!39554) (not b!892767) (not b!892765) (not mapNonEmpty!28793) (not b_lambda!12901) (not b!892769) (not b!892764) (not b!892775) b_and!26087 (not b_next!15831) (not b!892778) (not start!75860) tp_is_empty!18159)
(check-sat b_and!26087 (not b_next!15831))
(get-model)

(declare-fun d!110239 () Bool)

(declare-fun get!13243 (Option!451) V!29177)

(assert (=> d!110239 (= (apply!406 lt!403328 key!785) (get!13243 (getValueByKey!445 (toList!5369 lt!403328) key!785)))))

(declare-fun bs!25055 () Bool)

(assert (= bs!25055 d!110239))

(declare-fun m!831057 () Bool)

(assert (=> bs!25055 m!831057))

(assert (=> bs!25055 m!831057))

(declare-fun m!831059 () Bool)

(assert (=> bs!25055 m!831059))

(assert (=> bm!39554 d!110239))

(declare-fun d!110241 () Bool)

(declare-fun isEmpty!678 (Option!451) Bool)

(assert (=> d!110241 (= (isDefined!324 (getValueByKey!445 (toList!5369 (map!12204 thiss!1181)) key!785)) (not (isEmpty!678 (getValueByKey!445 (toList!5369 (map!12204 thiss!1181)) key!785))))))

(declare-fun bs!25056 () Bool)

(assert (= bs!25056 d!110241))

(assert (=> bs!25056 m!830977))

(declare-fun m!831061 () Bool)

(assert (=> bs!25056 m!831061))

(assert (=> b!892767 d!110241))

(declare-fun b!892838 () Bool)

(declare-fun e!498507 () Option!451)

(assert (=> b!892838 (= e!498507 (getValueByKey!445 (t!25107 (toList!5369 (map!12204 thiss!1181))) key!785))))

(declare-fun d!110243 () Bool)

(declare-fun c!94004 () Bool)

(assert (=> d!110243 (= c!94004 (and ((_ is Cons!17788) (toList!5369 (map!12204 thiss!1181))) (= (_1!6016 (h!18919 (toList!5369 (map!12204 thiss!1181)))) key!785)))))

(declare-fun e!498506 () Option!451)

(assert (=> d!110243 (= (getValueByKey!445 (toList!5369 (map!12204 thiss!1181)) key!785) e!498506)))

(declare-fun b!892837 () Bool)

(assert (=> b!892837 (= e!498506 e!498507)))

(declare-fun c!94005 () Bool)

(assert (=> b!892837 (= c!94005 (and ((_ is Cons!17788) (toList!5369 (map!12204 thiss!1181))) (not (= (_1!6016 (h!18919 (toList!5369 (map!12204 thiss!1181)))) key!785))))))

(declare-fun b!892836 () Bool)

(assert (=> b!892836 (= e!498506 (Some!450 (_2!6016 (h!18919 (toList!5369 (map!12204 thiss!1181))))))))

(declare-fun b!892839 () Bool)

(assert (=> b!892839 (= e!498507 None!449)))

(assert (= (and d!110243 c!94004) b!892836))

(assert (= (and d!110243 (not c!94004)) b!892837))

(assert (= (and b!892837 c!94005) b!892838))

(assert (= (and b!892837 (not c!94005)) b!892839))

(declare-fun m!831063 () Bool)

(assert (=> b!892838 m!831063))

(assert (=> b!892767 d!110243))

(declare-fun d!110245 () Bool)

(assert (=> d!110245 (= (map!12204 thiss!1181) (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun bs!25057 () Bool)

(assert (= bs!25057 d!110245))

(assert (=> bs!25057 m!830989))

(assert (=> b!892767 d!110245))

(declare-fun d!110247 () Bool)

(declare-fun c!94008 () Bool)

(assert (=> d!110247 (= c!94008 ((_ is ValueCellFull!8598) (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331))))))

(declare-fun e!498510 () V!29177)

(assert (=> d!110247 (= (get!13242 (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331)) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!498510)))

(declare-fun b!892844 () Bool)

(declare-fun get!13244 (ValueCell!8598 V!29177) V!29177)

(assert (=> b!892844 (= e!498510 (get!13244 (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331)) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!892845 () Bool)

(declare-fun get!13245 (ValueCell!8598 V!29177) V!29177)

(assert (=> b!892845 (= e!498510 (get!13245 (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331)) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110247 c!94008) b!892844))

(assert (= (and d!110247 (not c!94008)) b!892845))

(assert (=> b!892844 m!830999))

(assert (=> b!892844 m!831001))

(declare-fun m!831065 () Bool)

(assert (=> b!892844 m!831065))

(assert (=> b!892845 m!830999))

(assert (=> b!892845 m!831001))

(declare-fun m!831067 () Bool)

(assert (=> b!892845 m!831067))

(assert (=> b!892765 d!110247))

(declare-fun d!110249 () Bool)

(assert (=> d!110249 (= (array_inv!19756 (_keys!9986 thiss!1181)) (bvsge (size!25599 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892778 d!110249))

(declare-fun d!110251 () Bool)

(assert (=> d!110251 (= (array_inv!19757 (_values!5288 thiss!1181)) (bvsge (size!25600 (_values!5288 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892778 d!110251))

(declare-fun d!110253 () Bool)

(declare-fun e!498513 () Bool)

(assert (=> d!110253 e!498513))

(declare-fun res!604793 () Bool)

(assert (=> d!110253 (=> res!604793 e!498513)))

(declare-fun lt!403357 () SeekEntryResult!8855)

(assert (=> d!110253 (= res!604793 (not ((_ is Found!8855) lt!403357)))))

(assert (=> d!110253 (= lt!403357 (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun lt!403356 () Unit!30404)

(declare-fun choose!1460 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 64)) Unit!30404)

(assert (=> d!110253 (= lt!403356 (choose!1460 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110253 (validMask!0 (mask!25820 thiss!1181))))

(assert (=> d!110253 (= (lemmaSeekEntryGivesInRangeIndex!54 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785) lt!403356)))

(declare-fun b!892848 () Bool)

(assert (=> b!892848 (= e!498513 (inRange!0 (index!37792 lt!403357) (mask!25820 thiss!1181)))))

(assert (= (and d!110253 (not res!604793)) b!892848))

(assert (=> d!110253 m!831007))

(declare-fun m!831069 () Bool)

(assert (=> d!110253 m!831069))

(declare-fun m!831071 () Bool)

(assert (=> d!110253 m!831071))

(declare-fun m!831073 () Bool)

(assert (=> b!892848 m!831073))

(assert (=> b!892775 d!110253))

(declare-fun b!892861 () Bool)

(declare-fun c!94015 () Bool)

(declare-fun lt!403368 () (_ BitVec 64))

(assert (=> b!892861 (= c!94015 (= lt!403368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!498522 () SeekEntryResult!8855)

(declare-fun e!498521 () SeekEntryResult!8855)

(assert (=> b!892861 (= e!498522 e!498521)))

(declare-fun d!110255 () Bool)

(declare-fun lt!403367 () SeekEntryResult!8855)

(assert (=> d!110255 (and (or ((_ is MissingVacant!8855) lt!403367) (not ((_ is Found!8855) lt!403367)) (and (bvsge (index!37792 lt!403367) #b00000000000000000000000000000000) (bvslt (index!37792 lt!403367) (size!25599 (_keys!9986 thiss!1181))))) (not ((_ is MissingVacant!8855) lt!403367)) (or (not ((_ is Found!8855) lt!403367)) (= (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403367)) key!785)))))

(declare-fun e!498520 () SeekEntryResult!8855)

(assert (=> d!110255 (= lt!403367 e!498520)))

(declare-fun c!94016 () Bool)

(declare-fun lt!403369 () SeekEntryResult!8855)

(assert (=> d!110255 (= c!94016 (and ((_ is Intermediate!8855) lt!403369) (undefined!9667 lt!403369)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52298 (_ BitVec 32)) SeekEntryResult!8855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110255 (= lt!403369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25820 thiss!1181)) key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(assert (=> d!110255 (validMask!0 (mask!25820 thiss!1181))))

(assert (=> d!110255 (= (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)) lt!403367)))

(declare-fun b!892862 () Bool)

(assert (=> b!892862 (= e!498520 e!498522)))

(assert (=> b!892862 (= lt!403368 (select (arr!25155 (_keys!9986 thiss!1181)) (index!37793 lt!403369)))))

(declare-fun c!94017 () Bool)

(assert (=> b!892862 (= c!94017 (= lt!403368 key!785))))

(declare-fun b!892863 () Bool)

(assert (=> b!892863 (= e!498520 Undefined!8855)))

(declare-fun b!892864 () Bool)

(declare-fun lt!403366 () SeekEntryResult!8855)

(assert (=> b!892864 (= e!498521 (ite ((_ is MissingVacant!8855) lt!403366) (MissingZero!8855 (index!37794 lt!403366)) lt!403366))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52298 (_ BitVec 32)) SeekEntryResult!8855)

(assert (=> b!892864 (= lt!403366 (seekKeyOrZeroReturnVacant!0 (x!75887 lt!403369) (index!37793 lt!403369) (index!37793 lt!403369) key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun b!892865 () Bool)

(assert (=> b!892865 (= e!498522 (Found!8855 (index!37793 lt!403369)))))

(declare-fun b!892866 () Bool)

(assert (=> b!892866 (= e!498521 (MissingZero!8855 (index!37793 lt!403369)))))

(assert (= (and d!110255 c!94016) b!892863))

(assert (= (and d!110255 (not c!94016)) b!892862))

(assert (= (and b!892862 c!94017) b!892865))

(assert (= (and b!892862 (not c!94017)) b!892861))

(assert (= (and b!892861 c!94015) b!892866))

(assert (= (and b!892861 (not c!94015)) b!892864))

(declare-fun m!831075 () Bool)

(assert (=> d!110255 m!831075))

(declare-fun m!831077 () Bool)

(assert (=> d!110255 m!831077))

(assert (=> d!110255 m!831077))

(declare-fun m!831079 () Bool)

(assert (=> d!110255 m!831079))

(assert (=> d!110255 m!831071))

(declare-fun m!831081 () Bool)

(assert (=> b!892862 m!831081))

(declare-fun m!831083 () Bool)

(assert (=> b!892864 m!831083))

(assert (=> b!892775 d!110255))

(declare-fun d!110257 () Bool)

(assert (=> d!110257 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403372 () Unit!30404)

(declare-fun choose!13 (array!52298 (_ BitVec 64) (_ BitVec 32)) Unit!30404)

(assert (=> d!110257 (= lt!403372 (choose!13 (_keys!9986 thiss!1181) key!785 (index!37792 lt!403331)))))

(assert (=> d!110257 (bvsge (index!37792 lt!403331) #b00000000000000000000000000000000)))

(assert (=> d!110257 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9986 thiss!1181) key!785 (index!37792 lt!403331)) lt!403372)))

(declare-fun bs!25058 () Bool)

(assert (= bs!25058 d!110257))

(assert (=> bs!25058 m!830995))

(declare-fun m!831085 () Bool)

(assert (=> bs!25058 m!831085))

(assert (=> b!892769 d!110257))

(declare-fun d!110259 () Bool)

(declare-fun e!498527 () Bool)

(assert (=> d!110259 e!498527))

(declare-fun res!604796 () Bool)

(assert (=> d!110259 (=> res!604796 e!498527)))

(declare-fun lt!403381 () Bool)

(assert (=> d!110259 (= res!604796 (not lt!403381))))

(declare-fun lt!403382 () Bool)

(assert (=> d!110259 (= lt!403381 lt!403382)))

(declare-fun lt!403384 () Unit!30404)

(declare-fun e!498528 () Unit!30404)

(assert (=> d!110259 (= lt!403384 e!498528)))

(declare-fun c!94020 () Bool)

(assert (=> d!110259 (= c!94020 lt!403382)))

(declare-fun containsKey!421 (List!17792 (_ BitVec 64)) Bool)

(assert (=> d!110259 (= lt!403382 (containsKey!421 (toList!5369 lt!403328) (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331))))))

(assert (=> d!110259 (= (contains!4374 lt!403328 (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331))) lt!403381)))

(declare-fun b!892873 () Bool)

(declare-fun lt!403383 () Unit!30404)

(assert (=> b!892873 (= e!498528 lt!403383)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!317 (List!17792 (_ BitVec 64)) Unit!30404)

(assert (=> b!892873 (= lt!403383 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5369 lt!403328) (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331))))))

(assert (=> b!892873 (isDefined!324 (getValueByKey!445 (toList!5369 lt!403328) (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331))))))

(declare-fun b!892874 () Bool)

(declare-fun Unit!30406 () Unit!30404)

(assert (=> b!892874 (= e!498528 Unit!30406)))

(declare-fun b!892875 () Bool)

(assert (=> b!892875 (= e!498527 (isDefined!324 (getValueByKey!445 (toList!5369 lt!403328) (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331)))))))

(assert (= (and d!110259 c!94020) b!892873))

(assert (= (and d!110259 (not c!94020)) b!892874))

(assert (= (and d!110259 (not res!604796)) b!892875))

(assert (=> d!110259 m!830985))

(declare-fun m!831087 () Bool)

(assert (=> d!110259 m!831087))

(assert (=> b!892873 m!830985))

(declare-fun m!831089 () Bool)

(assert (=> b!892873 m!831089))

(assert (=> b!892873 m!830985))

(declare-fun m!831091 () Bool)

(assert (=> b!892873 m!831091))

(assert (=> b!892873 m!831091))

(declare-fun m!831093 () Bool)

(assert (=> b!892873 m!831093))

(assert (=> b!892875 m!830985))

(assert (=> b!892875 m!831091))

(assert (=> b!892875 m!831091))

(assert (=> b!892875 m!831093))

(assert (=> b!892769 d!110259))

(declare-fun d!110261 () Bool)

(declare-fun res!604801 () Bool)

(declare-fun e!498533 () Bool)

(assert (=> d!110261 (=> res!604801 e!498533)))

(assert (=> d!110261 (= res!604801 (= (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110261 (= (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000) e!498533)))

(declare-fun b!892880 () Bool)

(declare-fun e!498534 () Bool)

(assert (=> b!892880 (= e!498533 e!498534)))

(declare-fun res!604802 () Bool)

(assert (=> b!892880 (=> (not res!604802) (not e!498534))))

(assert (=> b!892880 (= res!604802 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25599 (_keys!9986 thiss!1181))))))

(declare-fun b!892881 () Bool)

(assert (=> b!892881 (= e!498534 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110261 (not res!604801)) b!892880))

(assert (= (and b!892880 res!604802) b!892881))

(declare-fun m!831095 () Bool)

(assert (=> d!110261 m!831095))

(declare-fun m!831097 () Bool)

(assert (=> b!892881 m!831097))

(assert (=> b!892769 d!110261))

(declare-fun d!110263 () Bool)

(declare-fun e!498537 () Bool)

(assert (=> d!110263 e!498537))

(declare-fun res!604805 () Bool)

(assert (=> d!110263 (=> (not res!604805) (not e!498537))))

(assert (=> d!110263 (= res!604805 (and (bvsge (index!37792 lt!403331) #b00000000000000000000000000000000) (bvslt (index!37792 lt!403331) (size!25599 (_keys!9986 thiss!1181)))))))

(declare-fun lt!403387 () Unit!30404)

(declare-fun choose!1461 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 32) Int) Unit!30404)

(assert (=> d!110263 (= lt!403387 (choose!1461 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)))))

(assert (=> d!110263 (validMask!0 (mask!25820 thiss!1181))))

(assert (=> d!110263 (= (lemmaValidKeyInArrayIsInListMap!237 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)) lt!403387)))

(declare-fun b!892884 () Bool)

(assert (=> b!892884 (= e!498537 (contains!4374 (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)) (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403331))))))

(assert (= (and d!110263 res!604805) b!892884))

(declare-fun m!831099 () Bool)

(assert (=> d!110263 m!831099))

(assert (=> d!110263 m!831071))

(assert (=> b!892884 m!830989))

(assert (=> b!892884 m!830985))

(assert (=> b!892884 m!830989))

(assert (=> b!892884 m!830985))

(declare-fun m!831101 () Bool)

(assert (=> b!892884 m!831101))

(assert (=> b!892769 d!110263))

(declare-fun b!892927 () Bool)

(declare-fun e!498567 () Bool)

(declare-fun e!498564 () Bool)

(assert (=> b!892927 (= e!498567 e!498564)))

(declare-fun res!604830 () Bool)

(declare-fun call!39584 () Bool)

(assert (=> b!892927 (= res!604830 call!39584)))

(assert (=> b!892927 (=> (not res!604830) (not e!498564))))

(declare-fun d!110265 () Bool)

(declare-fun e!498575 () Bool)

(assert (=> d!110265 e!498575))

(declare-fun res!604824 () Bool)

(assert (=> d!110265 (=> (not res!604824) (not e!498575))))

(assert (=> d!110265 (= res!604824 (or (bvsge #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))))))))

(declare-fun lt!403440 () ListLongMap!10707)

(declare-fun lt!403442 () ListLongMap!10707)

(assert (=> d!110265 (= lt!403440 lt!403442)))

(declare-fun lt!403433 () Unit!30404)

(declare-fun e!498571 () Unit!30404)

(assert (=> d!110265 (= lt!403433 e!498571)))

(declare-fun c!94033 () Bool)

(declare-fun e!498568 () Bool)

(assert (=> d!110265 (= c!94033 e!498568)))

(declare-fun res!604832 () Bool)

(assert (=> d!110265 (=> (not res!604832) (not e!498568))))

(assert (=> d!110265 (= res!604832 (bvslt #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))))))

(declare-fun e!498572 () ListLongMap!10707)

(assert (=> d!110265 (= lt!403442 e!498572)))

(declare-fun c!94035 () Bool)

(assert (=> d!110265 (= c!94035 (and (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110265 (validMask!0 (mask!25820 thiss!1181))))

(assert (=> d!110265 (= (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)) lt!403440)))

(declare-fun b!892928 () Bool)

(declare-fun e!498569 () ListLongMap!10707)

(assert (=> b!892928 (= e!498572 e!498569)))

(declare-fun c!94037 () Bool)

(assert (=> b!892928 (= c!94037 (and (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!892929 () Bool)

(declare-fun e!498565 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!892929 (= e!498565 (validKeyInArray!0 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!892930 () Bool)

(assert (=> b!892930 (= e!498567 (not call!39584))))

(declare-fun b!892931 () Bool)

(declare-fun lt!403436 () Unit!30404)

(assert (=> b!892931 (= e!498571 lt!403436)))

(declare-fun lt!403448 () ListLongMap!10707)

(declare-fun getCurrentListMapNoExtraKeys!3274 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 32) Int) ListLongMap!10707)

(assert (=> b!892931 (= lt!403448 (getCurrentListMapNoExtraKeys!3274 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403444 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403438 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403438 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403452 () Unit!30404)

(declare-fun addStillContains!328 (ListLongMap!10707 (_ BitVec 64) V!29177 (_ BitVec 64)) Unit!30404)

(assert (=> b!892931 (= lt!403452 (addStillContains!328 lt!403448 lt!403444 (zeroValue!5101 thiss!1181) lt!403438))))

(declare-fun +!2587 (ListLongMap!10707 tuple2!12010) ListLongMap!10707)

(assert (=> b!892931 (contains!4374 (+!2587 lt!403448 (tuple2!12011 lt!403444 (zeroValue!5101 thiss!1181))) lt!403438)))

(declare-fun lt!403432 () Unit!30404)

(assert (=> b!892931 (= lt!403432 lt!403452)))

(declare-fun lt!403451 () ListLongMap!10707)

(assert (=> b!892931 (= lt!403451 (getCurrentListMapNoExtraKeys!3274 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403447 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403447 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403437 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403437 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403439 () Unit!30404)

(declare-fun addApplyDifferent!328 (ListLongMap!10707 (_ BitVec 64) V!29177 (_ BitVec 64)) Unit!30404)

(assert (=> b!892931 (= lt!403439 (addApplyDifferent!328 lt!403451 lt!403447 (minValue!5101 thiss!1181) lt!403437))))

(assert (=> b!892931 (= (apply!406 (+!2587 lt!403451 (tuple2!12011 lt!403447 (minValue!5101 thiss!1181))) lt!403437) (apply!406 lt!403451 lt!403437))))

(declare-fun lt!403434 () Unit!30404)

(assert (=> b!892931 (= lt!403434 lt!403439)))

(declare-fun lt!403443 () ListLongMap!10707)

(assert (=> b!892931 (= lt!403443 (getCurrentListMapNoExtraKeys!3274 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403445 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403441 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403441 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403449 () Unit!30404)

(assert (=> b!892931 (= lt!403449 (addApplyDifferent!328 lt!403443 lt!403445 (zeroValue!5101 thiss!1181) lt!403441))))

(assert (=> b!892931 (= (apply!406 (+!2587 lt!403443 (tuple2!12011 lt!403445 (zeroValue!5101 thiss!1181))) lt!403441) (apply!406 lt!403443 lt!403441))))

(declare-fun lt!403446 () Unit!30404)

(assert (=> b!892931 (= lt!403446 lt!403449)))

(declare-fun lt!403435 () ListLongMap!10707)

(assert (=> b!892931 (= lt!403435 (getCurrentListMapNoExtraKeys!3274 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun lt!403450 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403450 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403453 () (_ BitVec 64))

(assert (=> b!892931 (= lt!403453 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892931 (= lt!403436 (addApplyDifferent!328 lt!403435 lt!403450 (minValue!5101 thiss!1181) lt!403453))))

(assert (=> b!892931 (= (apply!406 (+!2587 lt!403435 (tuple2!12011 lt!403450 (minValue!5101 thiss!1181))) lt!403453) (apply!406 lt!403435 lt!403453))))

(declare-fun b!892932 () Bool)

(declare-fun call!39583 () ListLongMap!10707)

(assert (=> b!892932 (= e!498572 (+!2587 call!39583 (tuple2!12011 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5101 thiss!1181))))))

(declare-fun b!892933 () Bool)

(declare-fun call!39581 () ListLongMap!10707)

(assert (=> b!892933 (= e!498569 call!39581)))

(declare-fun b!892934 () Bool)

(declare-fun e!498570 () Bool)

(assert (=> b!892934 (= e!498570 (= (apply!406 lt!403440 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000)) (get!13242 (select (arr!25156 (_values!5288 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!892934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25600 (_values!5288 thiss!1181))))))

(assert (=> b!892934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))))))

(declare-fun b!892935 () Bool)

(declare-fun res!604831 () Bool)

(assert (=> b!892935 (=> (not res!604831) (not e!498575))))

(declare-fun e!498576 () Bool)

(assert (=> b!892935 (= res!604831 e!498576)))

(declare-fun c!94038 () Bool)

(assert (=> b!892935 (= c!94038 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!892936 () Bool)

(assert (=> b!892936 (= e!498564 (= (apply!406 lt!403440 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5101 thiss!1181)))))

(declare-fun bm!39576 () Bool)

(declare-fun call!39580 () Bool)

(assert (=> bm!39576 (= call!39580 (contains!4374 lt!403440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892937 () Bool)

(declare-fun e!498573 () ListLongMap!10707)

(declare-fun call!39582 () ListLongMap!10707)

(assert (=> b!892937 (= e!498573 call!39582)))

(declare-fun b!892938 () Bool)

(declare-fun res!604829 () Bool)

(assert (=> b!892938 (=> (not res!604829) (not e!498575))))

(declare-fun e!498566 () Bool)

(assert (=> b!892938 (= res!604829 e!498566)))

(declare-fun res!604826 () Bool)

(assert (=> b!892938 (=> res!604826 e!498566)))

(assert (=> b!892938 (= res!604826 (not e!498565))))

(declare-fun res!604828 () Bool)

(assert (=> b!892938 (=> (not res!604828) (not e!498565))))

(assert (=> b!892938 (= res!604828 (bvslt #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))))))

(declare-fun b!892939 () Bool)

(declare-fun c!94036 () Bool)

(assert (=> b!892939 (= c!94036 (and (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892939 (= e!498569 e!498573)))

(declare-fun b!892940 () Bool)

(declare-fun e!498574 () Bool)

(assert (=> b!892940 (= e!498574 (= (apply!406 lt!403440 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5101 thiss!1181)))))

(declare-fun bm!39577 () Bool)

(declare-fun call!39585 () ListLongMap!10707)

(declare-fun call!39579 () ListLongMap!10707)

(assert (=> bm!39577 (= call!39585 call!39579)))

(declare-fun b!892941 () Bool)

(assert (=> b!892941 (= e!498566 e!498570)))

(declare-fun res!604825 () Bool)

(assert (=> b!892941 (=> (not res!604825) (not e!498570))))

(assert (=> b!892941 (= res!604825 (contains!4374 lt!403440 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!892941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))))))

(declare-fun b!892942 () Bool)

(assert (=> b!892942 (= e!498576 (not call!39580))))

(declare-fun b!892943 () Bool)

(assert (=> b!892943 (= e!498576 e!498574)))

(declare-fun res!604827 () Bool)

(assert (=> b!892943 (= res!604827 call!39580)))

(assert (=> b!892943 (=> (not res!604827) (not e!498574))))

(declare-fun bm!39578 () Bool)

(assert (=> bm!39578 (= call!39583 (+!2587 (ite c!94035 call!39579 (ite c!94037 call!39585 call!39582)) (ite (or c!94035 c!94037) (tuple2!12011 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5101 thiss!1181)) (tuple2!12011 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5101 thiss!1181)))))))

(declare-fun bm!39579 () Bool)

(assert (=> bm!39579 (= call!39579 (getCurrentListMapNoExtraKeys!3274 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun b!892944 () Bool)

(declare-fun Unit!30407 () Unit!30404)

(assert (=> b!892944 (= e!498571 Unit!30407)))

(declare-fun bm!39580 () Bool)

(assert (=> bm!39580 (= call!39582 call!39585)))

(declare-fun bm!39581 () Bool)

(assert (=> bm!39581 (= call!39584 (contains!4374 lt!403440 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892945 () Bool)

(assert (=> b!892945 (= e!498568 (validKeyInArray!0 (select (arr!25155 (_keys!9986 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!892946 () Bool)

(assert (=> b!892946 (= e!498575 e!498567)))

(declare-fun c!94034 () Bool)

(assert (=> b!892946 (= c!94034 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39582 () Bool)

(assert (=> bm!39582 (= call!39581 call!39583)))

(declare-fun b!892947 () Bool)

(assert (=> b!892947 (= e!498573 call!39581)))

(assert (= (and d!110265 c!94035) b!892932))

(assert (= (and d!110265 (not c!94035)) b!892928))

(assert (= (and b!892928 c!94037) b!892933))

(assert (= (and b!892928 (not c!94037)) b!892939))

(assert (= (and b!892939 c!94036) b!892947))

(assert (= (and b!892939 (not c!94036)) b!892937))

(assert (= (or b!892947 b!892937) bm!39580))

(assert (= (or b!892933 bm!39580) bm!39577))

(assert (= (or b!892933 b!892947) bm!39582))

(assert (= (or b!892932 bm!39577) bm!39579))

(assert (= (or b!892932 bm!39582) bm!39578))

(assert (= (and d!110265 res!604832) b!892945))

(assert (= (and d!110265 c!94033) b!892931))

(assert (= (and d!110265 (not c!94033)) b!892944))

(assert (= (and d!110265 res!604824) b!892938))

(assert (= (and b!892938 res!604828) b!892929))

(assert (= (and b!892938 (not res!604826)) b!892941))

(assert (= (and b!892941 res!604825) b!892934))

(assert (= (and b!892938 res!604829) b!892935))

(assert (= (and b!892935 c!94038) b!892943))

(assert (= (and b!892935 (not c!94038)) b!892942))

(assert (= (and b!892943 res!604827) b!892940))

(assert (= (or b!892943 b!892942) bm!39576))

(assert (= (and b!892935 res!604831) b!892946))

(assert (= (and b!892946 c!94034) b!892927))

(assert (= (and b!892946 (not c!94034)) b!892930))

(assert (= (and b!892927 res!604830) b!892936))

(assert (= (or b!892927 b!892930) bm!39581))

(declare-fun b_lambda!12903 () Bool)

(assert (=> (not b_lambda!12903) (not b!892934)))

(assert (=> b!892934 t!25106))

(declare-fun b_and!26093 () Bool)

(assert (= b_and!26087 (and (=> t!25106 result!10041) b_and!26093)))

(assert (=> d!110265 m!831071))

(declare-fun m!831103 () Bool)

(assert (=> bm!39579 m!831103))

(assert (=> b!892941 m!831095))

(assert (=> b!892941 m!831095))

(declare-fun m!831105 () Bool)

(assert (=> b!892941 m!831105))

(assert (=> b!892934 m!831095))

(assert (=> b!892934 m!831095))

(declare-fun m!831107 () Bool)

(assert (=> b!892934 m!831107))

(declare-fun m!831109 () Bool)

(assert (=> b!892934 m!831109))

(assert (=> b!892934 m!831109))

(assert (=> b!892934 m!831001))

(declare-fun m!831111 () Bool)

(assert (=> b!892934 m!831111))

(assert (=> b!892934 m!831001))

(assert (=> b!892929 m!831095))

(assert (=> b!892929 m!831095))

(declare-fun m!831113 () Bool)

(assert (=> b!892929 m!831113))

(declare-fun m!831115 () Bool)

(assert (=> b!892932 m!831115))

(assert (=> b!892945 m!831095))

(assert (=> b!892945 m!831095))

(assert (=> b!892945 m!831113))

(declare-fun m!831117 () Bool)

(assert (=> b!892931 m!831117))

(assert (=> b!892931 m!831095))

(declare-fun m!831119 () Bool)

(assert (=> b!892931 m!831119))

(declare-fun m!831121 () Bool)

(assert (=> b!892931 m!831121))

(declare-fun m!831123 () Bool)

(assert (=> b!892931 m!831123))

(declare-fun m!831125 () Bool)

(assert (=> b!892931 m!831125))

(declare-fun m!831127 () Bool)

(assert (=> b!892931 m!831127))

(declare-fun m!831129 () Bool)

(assert (=> b!892931 m!831129))

(assert (=> b!892931 m!831125))

(declare-fun m!831131 () Bool)

(assert (=> b!892931 m!831131))

(declare-fun m!831133 () Bool)

(assert (=> b!892931 m!831133))

(declare-fun m!831135 () Bool)

(assert (=> b!892931 m!831135))

(declare-fun m!831137 () Bool)

(assert (=> b!892931 m!831137))

(assert (=> b!892931 m!831103))

(declare-fun m!831139 () Bool)

(assert (=> b!892931 m!831139))

(declare-fun m!831141 () Bool)

(assert (=> b!892931 m!831141))

(declare-fun m!831143 () Bool)

(assert (=> b!892931 m!831143))

(declare-fun m!831145 () Bool)

(assert (=> b!892931 m!831145))

(assert (=> b!892931 m!831135))

(assert (=> b!892931 m!831127))

(assert (=> b!892931 m!831119))

(declare-fun m!831147 () Bool)

(assert (=> b!892940 m!831147))

(declare-fun m!831149 () Bool)

(assert (=> b!892936 m!831149))

(declare-fun m!831151 () Bool)

(assert (=> bm!39581 m!831151))

(declare-fun m!831153 () Bool)

(assert (=> bm!39576 m!831153))

(declare-fun m!831155 () Bool)

(assert (=> bm!39578 m!831155))

(assert (=> b!892769 d!110265))

(declare-fun bm!39591 () Bool)

(declare-fun call!39596 () ListLongMap!10707)

(declare-fun call!39595 () ListLongMap!10707)

(assert (=> bm!39591 (= call!39596 call!39595)))

(declare-fun bm!39592 () Bool)

(assert (=> bm!39592 (= call!39595 (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun bm!39593 () Bool)

(declare-fun call!39597 () V!29177)

(declare-fun call!39594 () V!29177)

(assert (=> bm!39593 (= call!39597 call!39594)))

(declare-fun b!892962 () Bool)

(declare-fun e!498590 () Bool)

(declare-fun e!498588 () Bool)

(assert (=> b!892962 (= e!498590 e!498588)))

(declare-fun c!94043 () Bool)

(assert (=> b!892962 (= c!94043 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892963 () Bool)

(declare-fun e!498587 () Bool)

(assert (=> b!892963 (= e!498590 e!498587)))

(declare-fun res!604839 () Bool)

(assert (=> b!892963 (= res!604839 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892963 (=> (not res!604839) (not e!498587))))

(declare-fun b!892964 () Bool)

(assert (=> b!892964 (= e!498587 (= call!39594 (zeroValue!5101 thiss!1181)))))

(declare-fun bm!39594 () Bool)

(declare-fun c!94044 () Bool)

(assert (=> bm!39594 (= call!39594 (apply!406 (ite c!94044 call!39595 call!39596) key!785))))

(declare-fun d!110267 () Bool)

(assert (=> d!110267 e!498590))

(assert (=> d!110267 (= c!94044 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403456 () Unit!30404)

(declare-fun choose!1462 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 64) (_ BitVec 32) Int) Unit!30404)

(assert (=> d!110267 (= lt!403456 (choose!1462 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785 (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)))))

(assert (=> d!110267 (validMask!0 (mask!25820 thiss!1181))))

(assert (=> d!110267 (= (lemmaKeyInListMapThenSameValueInArray!9 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785 (index!37792 lt!403331) (defaultEntry!5303 thiss!1181)) lt!403456)))

(declare-fun b!892965 () Bool)

(declare-fun res!604841 () Bool)

(declare-fun e!498589 () Bool)

(assert (=> b!892965 (=> (not res!604841) (not e!498589))))

(assert (=> b!892965 (= res!604841 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892965 (= e!498588 e!498589)))

(declare-fun b!892966 () Bool)

(declare-fun res!604840 () Bool)

(declare-fun e!498591 () Bool)

(assert (=> b!892966 (=> (not res!604840) (not e!498591))))

(assert (=> b!892966 (= res!604840 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!892966 (= e!498588 e!498591)))

(declare-fun b!892967 () Bool)

(assert (=> b!892967 (= e!498591 (= call!39597 (get!13242 (select (arr!25156 (_values!5288 thiss!1181)) (index!37792 lt!403331)) (dynLambda!1296 (defaultEntry!5303 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!892967 (and (bvsge (index!37792 lt!403331) #b00000000000000000000000000000000) (bvslt (index!37792 lt!403331) (size!25600 (_values!5288 thiss!1181))))))

(declare-fun b!892968 () Bool)

(assert (=> b!892968 (= e!498589 (= call!39597 (minValue!5101 thiss!1181)))))

(assert (= (and d!110267 c!94044) b!892963))

(assert (= (and d!110267 (not c!94044)) b!892962))

(assert (= (and b!892963 res!604839) b!892964))

(assert (= (and b!892962 c!94043) b!892965))

(assert (= (and b!892962 (not c!94043)) b!892966))

(assert (= (and b!892965 res!604841) b!892968))

(assert (= (and b!892966 res!604840) b!892967))

(assert (= (or b!892968 b!892967) bm!39591))

(assert (= (or b!892968 b!892967) bm!39593))

(assert (= (or b!892964 bm!39591) bm!39592))

(assert (= (or b!892964 bm!39593) bm!39594))

(declare-fun b_lambda!12905 () Bool)

(assert (=> (not b_lambda!12905) (not b!892967)))

(assert (=> b!892967 t!25106))

(declare-fun b_and!26095 () Bool)

(assert (= b_and!26093 (and (=> t!25106 result!10041) b_and!26095)))

(assert (=> b!892967 m!830999))

(assert (=> b!892967 m!831001))

(assert (=> b!892967 m!830999))

(assert (=> b!892967 m!831001))

(assert (=> b!892967 m!831003))

(assert (=> b!892966 m!830995))

(declare-fun m!831157 () Bool)

(assert (=> d!110267 m!831157))

(assert (=> d!110267 m!831071))

(declare-fun m!831159 () Bool)

(assert (=> bm!39594 m!831159))

(assert (=> bm!39592 m!830989))

(assert (=> b!892769 d!110267))

(declare-fun b!892989 () Bool)

(declare-fun e!498602 () Bool)

(declare-fun e!498603 () Bool)

(assert (=> b!892989 (= e!498602 e!498603)))

(declare-fun c!94059 () Bool)

(assert (=> b!892989 (= c!94059 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!110269 () Bool)

(declare-fun lt!403500 () Bool)

(assert (=> d!110269 (= lt!403500 (contains!4374 (map!12204 thiss!1181) key!785))))

(assert (=> d!110269 (= lt!403500 e!498602)))

(declare-fun c!94055 () Bool)

(assert (=> d!110269 (= c!94055 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110269 (valid!1628 thiss!1181)))

(assert (=> d!110269 (= (contains!4373 thiss!1181 key!785) lt!403500)))

(declare-fun b!892990 () Bool)

(assert (=> b!892990 (= e!498602 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!892991 () Bool)

(declare-fun e!498604 () Bool)

(declare-fun call!39604 () Bool)

(assert (=> b!892991 (= e!498604 call!39604)))

(declare-fun b!892992 () Bool)

(declare-fun e!498605 () Bool)

(assert (=> b!892992 (= e!498605 false)))

(declare-fun c!94056 () Bool)

(declare-fun call!39605 () Bool)

(assert (=> b!892992 (= c!94056 call!39605)))

(declare-fun lt!403487 () Unit!30404)

(declare-fun e!498606 () Unit!30404)

(assert (=> b!892992 (= lt!403487 e!498606)))

(declare-fun b!892993 () Bool)

(assert (=> b!892993 (= e!498605 true)))

(declare-fun lt!403496 () SeekEntryResult!8855)

(declare-fun lt!403494 () Unit!30404)

(assert (=> b!892993 (= lt!403494 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9986 thiss!1181) key!785 (index!37792 lt!403496)))))

(assert (=> b!892993 call!39604))

(declare-fun lt!403488 () Unit!30404)

(assert (=> b!892993 (= lt!403488 lt!403494)))

(declare-fun lt!403491 () Unit!30404)

(assert (=> b!892993 (= lt!403491 (lemmaValidKeyInArrayIsInListMap!237 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) (index!37792 lt!403496) (defaultEntry!5303 thiss!1181)))))

(assert (=> b!892993 call!39605))

(declare-fun lt!403501 () Unit!30404)

(assert (=> b!892993 (= lt!403501 lt!403491)))

(declare-fun b!892994 () Bool)

(assert (=> b!892994 (= e!498603 (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!94058 () Bool)

(declare-fun bm!39601 () Bool)

(declare-fun call!39606 () ListLongMap!10707)

(assert (=> bm!39601 (= call!39605 (contains!4374 call!39606 (ite c!94058 (select (arr!25155 (_keys!9986 thiss!1181)) (index!37792 lt!403496)) key!785)))))

(declare-fun b!892995 () Bool)

(assert (=> b!892995 false))

(declare-fun lt!403492 () Unit!30404)

(declare-fun lt!403489 () Unit!30404)

(assert (=> b!892995 (= lt!403492 lt!403489)))

(declare-fun lt!403495 () SeekEntryResult!8855)

(declare-fun lt!403499 () (_ BitVec 32))

(assert (=> b!892995 (and ((_ is Found!8855) lt!403495) (= (index!37792 lt!403495) lt!403499))))

(assert (=> b!892995 (= lt!403495 (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52298 (_ BitVec 32)) Unit!30404)

(assert (=> b!892995 (= lt!403489 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403499 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun lt!403498 () Unit!30404)

(declare-fun lt!403493 () Unit!30404)

(assert (=> b!892995 (= lt!403498 lt!403493)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52298 (_ BitVec 32)) Bool)

(assert (=> b!892995 (arrayForallSeekEntryOrOpenFound!0 lt!403499 (_keys!9986 thiss!1181) (mask!25820 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30404)

(assert (=> b!892995 (= lt!403493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9986 thiss!1181) (mask!25820 thiss!1181) #b00000000000000000000000000000000 lt!403499))))

(declare-fun arrayScanForKey!0 (array!52298 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!892995 (= lt!403499 (arrayScanForKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403497 () Unit!30404)

(declare-fun lt!403490 () Unit!30404)

(assert (=> b!892995 (= lt!403497 lt!403490)))

(assert (=> b!892995 e!498604))

(declare-fun c!94057 () Bool)

(assert (=> b!892995 (= c!94057 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!160 (array!52298 array!52300 (_ BitVec 32) (_ BitVec 32) V!29177 V!29177 (_ BitVec 64) Int) Unit!30404)

(assert (=> b!892995 (= lt!403490 (lemmaKeyInListMapIsInArray!160 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) key!785 (defaultEntry!5303 thiss!1181)))))

(declare-fun Unit!30408 () Unit!30404)

(assert (=> b!892995 (= e!498606 Unit!30408)))

(declare-fun b!892996 () Bool)

(assert (=> b!892996 (= c!94058 ((_ is Found!8855) lt!403496))))

(assert (=> b!892996 (= lt!403496 (seekEntry!0 key!785 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(assert (=> b!892996 (= e!498603 e!498605)))

(declare-fun b!892997 () Bool)

(assert (=> b!892997 (= e!498604 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4997 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!892998 () Bool)

(declare-fun Unit!30409 () Unit!30404)

(assert (=> b!892998 (= e!498606 Unit!30409)))

(declare-fun bm!39602 () Bool)

(assert (=> bm!39602 (= call!39606 (getCurrentListMap!2648 (_keys!9986 thiss!1181) (_values!5288 thiss!1181) (mask!25820 thiss!1181) (extraKeys!4997 thiss!1181) (zeroValue!5101 thiss!1181) (minValue!5101 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5303 thiss!1181)))))

(declare-fun bm!39603 () Bool)

(assert (=> bm!39603 (= call!39604 (arrayContainsKey!0 (_keys!9986 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (= (and d!110269 c!94055) b!892990))

(assert (= (and d!110269 (not c!94055)) b!892989))

(assert (= (and b!892989 c!94059) b!892994))

(assert (= (and b!892989 (not c!94059)) b!892996))

(assert (= (and b!892996 c!94058) b!892993))

(assert (= (and b!892996 (not c!94058)) b!892992))

(assert (= (and b!892992 c!94056) b!892995))

(assert (= (and b!892992 (not c!94056)) b!892998))

(assert (= (and b!892995 c!94057) b!892991))

(assert (= (and b!892995 (not c!94057)) b!892997))

(assert (= (or b!892993 b!892991) bm!39603))

(assert (= (or b!892993 b!892992) bm!39602))

(assert (= (or b!892993 b!892992) bm!39601))

(assert (=> b!892996 m!831007))

(assert (=> bm!39603 m!830995))

(declare-fun m!831161 () Bool)

(assert (=> b!892993 m!831161))

(declare-fun m!831163 () Bool)

(assert (=> b!892993 m!831163))

(declare-fun m!831165 () Bool)

(assert (=> b!892995 m!831165))

(declare-fun m!831167 () Bool)

(assert (=> b!892995 m!831167))

(assert (=> b!892995 m!831007))

(declare-fun m!831169 () Bool)

(assert (=> b!892995 m!831169))

(declare-fun m!831171 () Bool)

(assert (=> b!892995 m!831171))

(declare-fun m!831173 () Bool)

(assert (=> b!892995 m!831173))

(assert (=> d!110269 m!830975))

(assert (=> d!110269 m!830975))

(declare-fun m!831175 () Bool)

(assert (=> d!110269 m!831175))

(assert (=> d!110269 m!831011))

(assert (=> bm!39602 m!830989))

(declare-fun m!831177 () Bool)

(assert (=> bm!39601 m!831177))

(declare-fun m!831179 () Bool)

(assert (=> bm!39601 m!831179))

(assert (=> b!892769 d!110269))

(declare-fun d!110271 () Bool)

(declare-fun res!604848 () Bool)

(declare-fun e!498609 () Bool)

(assert (=> d!110271 (=> (not res!604848) (not e!498609))))

(declare-fun simpleValid!295 (LongMapFixedSize!4212) Bool)

(assert (=> d!110271 (= res!604848 (simpleValid!295 thiss!1181))))

(assert (=> d!110271 (= (valid!1628 thiss!1181) e!498609)))

(declare-fun b!893005 () Bool)

(declare-fun res!604849 () Bool)

(assert (=> b!893005 (=> (not res!604849) (not e!498609))))

(declare-fun arrayCountValidKeys!0 (array!52298 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893005 (= res!604849 (= (arrayCountValidKeys!0 (_keys!9986 thiss!1181) #b00000000000000000000000000000000 (size!25599 (_keys!9986 thiss!1181))) (_size!2161 thiss!1181)))))

(declare-fun b!893006 () Bool)

(declare-fun res!604850 () Bool)

(assert (=> b!893006 (=> (not res!604850) (not e!498609))))

(assert (=> b!893006 (= res!604850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9986 thiss!1181) (mask!25820 thiss!1181)))))

(declare-fun b!893007 () Bool)

(declare-datatypes ((List!17793 0))(
  ( (Nil!17790) (Cons!17789 (h!18920 (_ BitVec 64)) (t!25110 List!17793)) )
))
(declare-fun arrayNoDuplicates!0 (array!52298 (_ BitVec 32) List!17793) Bool)

(assert (=> b!893007 (= e!498609 (arrayNoDuplicates!0 (_keys!9986 thiss!1181) #b00000000000000000000000000000000 Nil!17790))))

(assert (= (and d!110271 res!604848) b!893005))

(assert (= (and b!893005 res!604849) b!893006))

(assert (= (and b!893006 res!604850) b!893007))

(declare-fun m!831181 () Bool)

(assert (=> d!110271 m!831181))

(declare-fun m!831183 () Bool)

(assert (=> b!893005 m!831183))

(declare-fun m!831185 () Bool)

(assert (=> b!893006 m!831185))

(declare-fun m!831187 () Bool)

(assert (=> b!893007 m!831187))

(assert (=> start!75860 d!110271))

(declare-fun d!110273 () Bool)

(assert (=> d!110273 (= (inRange!0 (index!37792 lt!403331) (mask!25820 thiss!1181)) (and (bvsge (index!37792 lt!403331) #b00000000000000000000000000000000) (bvslt (index!37792 lt!403331) (bvadd (mask!25820 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!892764 d!110273))

(declare-fun mapIsEmpty!28799 () Bool)

(declare-fun mapRes!28799 () Bool)

(assert (=> mapIsEmpty!28799 mapRes!28799))

(declare-fun condMapEmpty!28799 () Bool)

(declare-fun mapDefault!28799 () ValueCell!8598)

(assert (=> mapNonEmpty!28793 (= condMapEmpty!28799 (= mapRest!28793 ((as const (Array (_ BitVec 32) ValueCell!8598)) mapDefault!28799)))))

(declare-fun e!498615 () Bool)

(assert (=> mapNonEmpty!28793 (= tp!55462 (and e!498615 mapRes!28799))))

(declare-fun b!893015 () Bool)

(assert (=> b!893015 (= e!498615 tp_is_empty!18159)))

(declare-fun mapNonEmpty!28799 () Bool)

(declare-fun tp!55471 () Bool)

(declare-fun e!498614 () Bool)

(assert (=> mapNonEmpty!28799 (= mapRes!28799 (and tp!55471 e!498614))))

(declare-fun mapKey!28799 () (_ BitVec 32))

(declare-fun mapRest!28799 () (Array (_ BitVec 32) ValueCell!8598))

(declare-fun mapValue!28799 () ValueCell!8598)

(assert (=> mapNonEmpty!28799 (= mapRest!28793 (store mapRest!28799 mapKey!28799 mapValue!28799))))

(declare-fun b!893014 () Bool)

(assert (=> b!893014 (= e!498614 tp_is_empty!18159)))

(assert (= (and mapNonEmpty!28793 condMapEmpty!28799) mapIsEmpty!28799))

(assert (= (and mapNonEmpty!28793 (not condMapEmpty!28799)) mapNonEmpty!28799))

(assert (= (and mapNonEmpty!28799 ((_ is ValueCellFull!8598) mapValue!28799)) b!893014))

(assert (= (and mapNonEmpty!28793 ((_ is ValueCellFull!8598) mapDefault!28799)) b!893015))

(declare-fun m!831189 () Bool)

(assert (=> mapNonEmpty!28799 m!831189))

(declare-fun b_lambda!12907 () Bool)

(assert (= b_lambda!12903 (or (and b!892778 b_free!15831) b_lambda!12907)))

(declare-fun b_lambda!12909 () Bool)

(assert (= b_lambda!12905 (or (and b!892778 b_free!15831) b_lambda!12909)))

(check-sat (not b!892931) (not d!110257) (not d!110269) (not b!892932) (not b!892929) (not b!892845) (not b_lambda!12909) (not b!892967) (not bm!39581) (not b!892940) (not b!892934) (not b!892966) (not b!892848) (not b!892993) (not d!110239) (not bm!39579) (not b!892941) (not b!892936) (not b!892864) (not d!110271) b_and!26095 (not b_next!15831) (not b!893007) (not d!110245) (not b_lambda!12901) (not bm!39576) (not b!892881) (not d!110265) (not bm!39578) (not b_lambda!12907) (not d!110253) (not mapNonEmpty!28799) (not d!110255) (not b!892838) (not bm!39603) (not b!892875) (not d!110267) (not b!893006) (not b!892844) (not d!110259) (not b!892945) tp_is_empty!18159 (not bm!39592) (not b!892873) (not b!892995) (not bm!39594) (not b!892884) (not bm!39602) (not d!110263) (not d!110241) (not bm!39601) (not b!892996) (not b!893005))
(check-sat b_and!26095 (not b_next!15831))
