; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17536 () Bool)

(assert start!17536)

(declare-fun b!175655 () Bool)

(declare-fun b_free!4339 () Bool)

(declare-fun b_next!4339 () Bool)

(assert (=> b!175655 (= b_free!4339 (not b_next!4339))))

(declare-fun tp!15700 () Bool)

(declare-fun b_and!10835 () Bool)

(assert (=> b!175655 (= tp!15700 b_and!10835)))

(declare-fun b!175648 () Bool)

(declare-fun res!83266 () Bool)

(declare-fun e!115930 () Bool)

(assert (=> b!175648 (=> (not res!83266) (not e!115930))))

(declare-datatypes ((V!5129 0))(
  ( (V!5130 (val!2100 Int)) )
))
(declare-datatypes ((ValueCell!1712 0))(
  ( (ValueCellFull!1712 (v!3976 V!5129)) (EmptyCell!1712) )
))
(declare-datatypes ((array!7349 0))(
  ( (array!7350 (arr!3488 (Array (_ BitVec 32) (_ BitVec 64))) (size!3790 (_ BitVec 32))) )
))
(declare-datatypes ((array!7351 0))(
  ( (array!7352 (arr!3489 (Array (_ BitVec 32) ValueCell!1712)) (size!3791 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2332 0))(
  ( (LongMapFixedSize!2333 (defaultEntry!3622 Int) (mask!8523 (_ BitVec 32)) (extraKeys!3359 (_ BitVec 32)) (zeroValue!3463 V!5129) (minValue!3463 V!5129) (_size!1215 (_ BitVec 32)) (_keys!5475 array!7349) (_values!3605 array!7351) (_vacant!1215 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2332)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175648 (= res!83266 (validMask!0 (mask!8523 thiss!1248)))))

(declare-fun b!175649 () Bool)

(declare-fun e!115929 () Bool)

(declare-fun e!115928 () Bool)

(declare-fun mapRes!7012 () Bool)

(assert (=> b!175649 (= e!115929 (and e!115928 mapRes!7012))))

(declare-fun condMapEmpty!7012 () Bool)

(declare-fun mapDefault!7012 () ValueCell!1712)

(assert (=> b!175649 (= condMapEmpty!7012 (= (arr!3489 (_values!3605 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7012)))))

(declare-fun b!175650 () Bool)

(declare-fun tp_is_empty!4111 () Bool)

(assert (=> b!175650 (= e!115928 tp_is_empty!4111)))

(declare-fun res!83262 () Bool)

(assert (=> start!17536 (=> (not res!83262) (not e!115930))))

(declare-fun valid!999 (LongMapFixedSize!2332) Bool)

(assert (=> start!17536 (= res!83262 (valid!999 thiss!1248))))

(assert (=> start!17536 e!115930))

(declare-fun e!115927 () Bool)

(assert (=> start!17536 e!115927))

(assert (=> start!17536 true))

(declare-fun b!175651 () Bool)

(declare-fun res!83265 () Bool)

(assert (=> b!175651 (=> (not res!83265) (not e!115930))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!175651 (= res!83265 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175652 () Bool)

(assert (=> b!175652 (= e!115930 (and (= (size!3791 (_values!3605 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8523 thiss!1248))) (= (size!3790 (_keys!5475 thiss!1248)) (size!3791 (_values!3605 thiss!1248))) (bvsge (mask!8523 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3359 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175653 () Bool)

(declare-fun res!83264 () Bool)

(assert (=> b!175653 (=> (not res!83264) (not e!115930))))

(declare-datatypes ((tuple2!3224 0))(
  ( (tuple2!3225 (_1!1623 (_ BitVec 64)) (_2!1623 V!5129)) )
))
(declare-datatypes ((List!2204 0))(
  ( (Nil!2201) (Cons!2200 (h!2819 tuple2!3224) (t!7016 List!2204)) )
))
(declare-datatypes ((ListLongMap!2157 0))(
  ( (ListLongMap!2158 (toList!1094 List!2204)) )
))
(declare-fun contains!1165 (ListLongMap!2157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!749 (array!7349 array!7351 (_ BitVec 32) (_ BitVec 32) V!5129 V!5129 (_ BitVec 32) Int) ListLongMap!2157)

(assert (=> b!175653 (= res!83264 (contains!1165 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7012 () Bool)

(declare-fun tp!15699 () Bool)

(declare-fun e!115925 () Bool)

(assert (=> mapNonEmpty!7012 (= mapRes!7012 (and tp!15699 e!115925))))

(declare-fun mapRest!7012 () (Array (_ BitVec 32) ValueCell!1712))

(declare-fun mapValue!7012 () ValueCell!1712)

(declare-fun mapKey!7012 () (_ BitVec 32))

(assert (=> mapNonEmpty!7012 (= (arr!3489 (_values!3605 thiss!1248)) (store mapRest!7012 mapKey!7012 mapValue!7012))))

(declare-fun b!175654 () Bool)

(assert (=> b!175654 (= e!115925 tp_is_empty!4111)))

(declare-fun array_inv!2251 (array!7349) Bool)

(declare-fun array_inv!2252 (array!7351) Bool)

(assert (=> b!175655 (= e!115927 (and tp!15700 tp_is_empty!4111 (array_inv!2251 (_keys!5475 thiss!1248)) (array_inv!2252 (_values!3605 thiss!1248)) e!115929))))

(declare-fun b!175656 () Bool)

(declare-fun res!83263 () Bool)

(assert (=> b!175656 (=> (not res!83263) (not e!115930))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!546 0))(
  ( (MissingZero!546 (index!4352 (_ BitVec 32))) (Found!546 (index!4353 (_ BitVec 32))) (Intermediate!546 (undefined!1358 Bool) (index!4354 (_ BitVec 32)) (x!19304 (_ BitVec 32))) (Undefined!546) (MissingVacant!546 (index!4355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7349 (_ BitVec 32)) SeekEntryResult!546)

(assert (=> b!175656 (= res!83263 ((_ is Undefined!546) (seekEntryOrOpen!0 key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248))))))

(declare-fun mapIsEmpty!7012 () Bool)

(assert (=> mapIsEmpty!7012 mapRes!7012))

(assert (= (and start!17536 res!83262) b!175651))

(assert (= (and b!175651 res!83265) b!175656))

(assert (= (and b!175656 res!83263) b!175653))

(assert (= (and b!175653 res!83264) b!175648))

(assert (= (and b!175648 res!83266) b!175652))

(assert (= (and b!175649 condMapEmpty!7012) mapIsEmpty!7012))

(assert (= (and b!175649 (not condMapEmpty!7012)) mapNonEmpty!7012))

(assert (= (and mapNonEmpty!7012 ((_ is ValueCellFull!1712) mapValue!7012)) b!175654))

(assert (= (and b!175649 ((_ is ValueCellFull!1712) mapDefault!7012)) b!175650))

(assert (= b!175655 b!175649))

(assert (= start!17536 b!175655))

(declare-fun m!204683 () Bool)

(assert (=> mapNonEmpty!7012 m!204683))

(declare-fun m!204685 () Bool)

(assert (=> b!175655 m!204685))

(declare-fun m!204687 () Bool)

(assert (=> b!175655 m!204687))

(declare-fun m!204689 () Bool)

(assert (=> b!175648 m!204689))

(declare-fun m!204691 () Bool)

(assert (=> b!175653 m!204691))

(assert (=> b!175653 m!204691))

(declare-fun m!204693 () Bool)

(assert (=> b!175653 m!204693))

(declare-fun m!204695 () Bool)

(assert (=> b!175656 m!204695))

(declare-fun m!204697 () Bool)

(assert (=> start!17536 m!204697))

(check-sat (not mapNonEmpty!7012) (not b_next!4339) tp_is_empty!4111 b_and!10835 (not b!175656) (not start!17536) (not b!175653) (not b!175655) (not b!175648))
(check-sat b_and!10835 (not b_next!4339))
(get-model)

(declare-fun d!53563 () Bool)

(assert (=> d!53563 (= (array_inv!2251 (_keys!5475 thiss!1248)) (bvsge (size!3790 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175655 d!53563))

(declare-fun d!53565 () Bool)

(assert (=> d!53565 (= (array_inv!2252 (_values!3605 thiss!1248)) (bvsge (size!3791 (_values!3605 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175655 d!53565))

(declare-fun d!53567 () Bool)

(declare-fun e!115971 () Bool)

(assert (=> d!53567 e!115971))

(declare-fun res!83299 () Bool)

(assert (=> d!53567 (=> res!83299 e!115971)))

(declare-fun lt!86955 () Bool)

(assert (=> d!53567 (= res!83299 (not lt!86955))))

(declare-fun lt!86953 () Bool)

(assert (=> d!53567 (= lt!86955 lt!86953)))

(declare-datatypes ((Unit!5389 0))(
  ( (Unit!5390) )
))
(declare-fun lt!86956 () Unit!5389)

(declare-fun e!115972 () Unit!5389)

(assert (=> d!53567 (= lt!86956 e!115972)))

(declare-fun c!31473 () Bool)

(assert (=> d!53567 (= c!31473 lt!86953)))

(declare-fun containsKey!194 (List!2204 (_ BitVec 64)) Bool)

(assert (=> d!53567 (= lt!86953 (containsKey!194 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(assert (=> d!53567 (= (contains!1165 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) key!828) lt!86955)))

(declare-fun b!175717 () Bool)

(declare-fun lt!86954 () Unit!5389)

(assert (=> b!175717 (= e!115972 lt!86954)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!142 (List!2204 (_ BitVec 64)) Unit!5389)

(assert (=> b!175717 (= lt!86954 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-datatypes ((Option!197 0))(
  ( (Some!196 (v!3979 V!5129)) (None!195) )
))
(declare-fun isDefined!143 (Option!197) Bool)

(declare-fun getValueByKey!191 (List!2204 (_ BitVec 64)) Option!197)

(assert (=> b!175717 (isDefined!143 (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun b!175718 () Bool)

(declare-fun Unit!5391 () Unit!5389)

(assert (=> b!175718 (= e!115972 Unit!5391)))

(declare-fun b!175719 () Bool)

(assert (=> b!175719 (= e!115971 (isDefined!143 (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828)))))

(assert (= (and d!53567 c!31473) b!175717))

(assert (= (and d!53567 (not c!31473)) b!175718))

(assert (= (and d!53567 (not res!83299)) b!175719))

(declare-fun m!204731 () Bool)

(assert (=> d!53567 m!204731))

(declare-fun m!204733 () Bool)

(assert (=> b!175717 m!204733))

(declare-fun m!204735 () Bool)

(assert (=> b!175717 m!204735))

(assert (=> b!175717 m!204735))

(declare-fun m!204737 () Bool)

(assert (=> b!175717 m!204737))

(assert (=> b!175719 m!204735))

(assert (=> b!175719 m!204735))

(assert (=> b!175719 m!204737))

(assert (=> b!175653 d!53567))

(declare-fun b!175762 () Bool)

(declare-fun e!116004 () ListLongMap!2157)

(declare-fun call!17783 () ListLongMap!2157)

(assert (=> b!175762 (= e!116004 call!17783)))

(declare-fun b!175763 () Bool)

(declare-fun e!116003 () Unit!5389)

(declare-fun Unit!5392 () Unit!5389)

(assert (=> b!175763 (= e!116003 Unit!5392)))

(declare-fun b!175764 () Bool)

(declare-fun e!116000 () ListLongMap!2157)

(declare-fun call!17786 () ListLongMap!2157)

(assert (=> b!175764 (= e!116000 call!17786)))

(declare-fun b!175765 () Bool)

(declare-fun e!116010 () Bool)

(declare-fun e!116002 () Bool)

(assert (=> b!175765 (= e!116010 e!116002)))

(declare-fun c!31488 () Bool)

(assert (=> b!175765 (= c!31488 (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175766 () Bool)

(declare-fun e!116001 () Bool)

(declare-fun lt!87004 () ListLongMap!2157)

(declare-fun apply!135 (ListLongMap!2157 (_ BitVec 64)) V!5129)

(assert (=> b!175766 (= e!116001 (= (apply!135 lt!87004 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3463 thiss!1248)))))

(declare-fun b!175767 () Bool)

(declare-fun e!116011 () Bool)

(declare-fun e!115999 () Bool)

(assert (=> b!175767 (= e!116011 e!115999)))

(declare-fun res!83325 () Bool)

(assert (=> b!175767 (=> (not res!83325) (not e!115999))))

(assert (=> b!175767 (= res!83325 (contains!1165 lt!87004 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun b!175768 () Bool)

(declare-fun e!116005 () Bool)

(assert (=> b!175768 (= e!116005 e!116001)))

(declare-fun res!83326 () Bool)

(declare-fun call!17787 () Bool)

(assert (=> b!175768 (= res!83326 call!17787)))

(assert (=> b!175768 (=> (not res!83326) (not e!116001))))

(declare-fun bm!17779 () Bool)

(declare-fun call!17785 () ListLongMap!2157)

(declare-fun call!17782 () ListLongMap!2157)

(assert (=> bm!17779 (= call!17785 call!17782)))

(declare-fun d!53569 () Bool)

(assert (=> d!53569 e!116010))

(declare-fun res!83321 () Bool)

(assert (=> d!53569 (=> (not res!83321) (not e!116010))))

(assert (=> d!53569 (= res!83321 (or (bvsge #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))))

(declare-fun lt!87010 () ListLongMap!2157)

(assert (=> d!53569 (= lt!87004 lt!87010)))

(declare-fun lt!87001 () Unit!5389)

(assert (=> d!53569 (= lt!87001 e!116003)))

(declare-fun c!31486 () Bool)

(declare-fun e!116007 () Bool)

(assert (=> d!53569 (= c!31486 e!116007)))

(declare-fun res!83324 () Bool)

(assert (=> d!53569 (=> (not res!83324) (not e!116007))))

(assert (=> d!53569 (= res!83324 (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun e!116006 () ListLongMap!2157)

(assert (=> d!53569 (= lt!87010 e!116006)))

(declare-fun c!31490 () Bool)

(assert (=> d!53569 (= c!31490 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53569 (validMask!0 (mask!8523 thiss!1248))))

(assert (=> d!53569 (= (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) lt!87004)))

(declare-fun b!175769 () Bool)

(assert (=> b!175769 (= e!116004 call!17786)))

(declare-fun b!175770 () Bool)

(declare-fun e!116009 () Bool)

(assert (=> b!175770 (= e!116009 (= (apply!135 lt!87004 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3463 thiss!1248)))))

(declare-fun bm!17780 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!166 (array!7349 array!7351 (_ BitVec 32) (_ BitVec 32) V!5129 V!5129 (_ BitVec 32) Int) ListLongMap!2157)

(assert (=> bm!17780 (= call!17782 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun b!175771 () Bool)

(declare-fun get!1998 (ValueCell!1712 V!5129) V!5129)

(declare-fun dynLambda!478 (Int (_ BitVec 64)) V!5129)

(assert (=> b!175771 (= e!115999 (= (apply!135 lt!87004 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)) (get!1998 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3791 (_values!3605 thiss!1248))))))

(assert (=> b!175771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun b!175772 () Bool)

(declare-fun res!83319 () Bool)

(assert (=> b!175772 (=> (not res!83319) (not e!116010))))

(assert (=> b!175772 (= res!83319 e!116005)))

(declare-fun c!31491 () Bool)

(assert (=> b!175772 (= c!31491 (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17781 () Bool)

(declare-fun call!17788 () Bool)

(assert (=> bm!17781 (= call!17788 (contains!1165 lt!87004 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17782 () Bool)

(declare-fun call!17784 () ListLongMap!2157)

(declare-fun c!31489 () Bool)

(declare-fun +!252 (ListLongMap!2157 tuple2!3224) ListLongMap!2157)

(assert (=> bm!17782 (= call!17784 (+!252 (ite c!31490 call!17782 (ite c!31489 call!17785 call!17783)) (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun b!175773 () Bool)

(assert (=> b!175773 (= e!116006 (+!252 call!17784 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))

(declare-fun b!175774 () Bool)

(assert (=> b!175774 (= e!116002 e!116009)))

(declare-fun res!83320 () Bool)

(assert (=> b!175774 (= res!83320 call!17788)))

(assert (=> b!175774 (=> (not res!83320) (not e!116009))))

(declare-fun b!175775 () Bool)

(assert (=> b!175775 (= e!116006 e!116000)))

(assert (=> b!175775 (= c!31489 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175776 () Bool)

(declare-fun lt!87011 () Unit!5389)

(assert (=> b!175776 (= e!116003 lt!87011)))

(declare-fun lt!87008 () ListLongMap!2157)

(assert (=> b!175776 (= lt!87008 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!87022 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87020 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87020 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87016 () Unit!5389)

(declare-fun addStillContains!111 (ListLongMap!2157 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5389)

(assert (=> b!175776 (= lt!87016 (addStillContains!111 lt!87008 lt!87022 (zeroValue!3463 thiss!1248) lt!87020))))

(assert (=> b!175776 (contains!1165 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) lt!87020)))

(declare-fun lt!87013 () Unit!5389)

(assert (=> b!175776 (= lt!87013 lt!87016)))

(declare-fun lt!87003 () ListLongMap!2157)

(assert (=> b!175776 (= lt!87003 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!87007 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87007 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87014 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87014 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87012 () Unit!5389)

(declare-fun addApplyDifferent!111 (ListLongMap!2157 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5389)

(assert (=> b!175776 (= lt!87012 (addApplyDifferent!111 lt!87003 lt!87007 (minValue!3463 thiss!1248) lt!87014))))

(assert (=> b!175776 (= (apply!135 (+!252 lt!87003 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) lt!87014) (apply!135 lt!87003 lt!87014))))

(declare-fun lt!87018 () Unit!5389)

(assert (=> b!175776 (= lt!87018 lt!87012)))

(declare-fun lt!87019 () ListLongMap!2157)

(assert (=> b!175776 (= lt!87019 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!87009 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87005 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87005 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87017 () Unit!5389)

(assert (=> b!175776 (= lt!87017 (addApplyDifferent!111 lt!87019 lt!87009 (zeroValue!3463 thiss!1248) lt!87005))))

(assert (=> b!175776 (= (apply!135 (+!252 lt!87019 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) lt!87005) (apply!135 lt!87019 lt!87005))))

(declare-fun lt!87006 () Unit!5389)

(assert (=> b!175776 (= lt!87006 lt!87017)))

(declare-fun lt!87015 () ListLongMap!2157)

(assert (=> b!175776 (= lt!87015 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))

(declare-fun lt!87002 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87021 () (_ BitVec 64))

(assert (=> b!175776 (= lt!87021 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175776 (= lt!87011 (addApplyDifferent!111 lt!87015 lt!87002 (minValue!3463 thiss!1248) lt!87021))))

(assert (=> b!175776 (= (apply!135 (+!252 lt!87015 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) lt!87021) (apply!135 lt!87015 lt!87021))))

(declare-fun b!175777 () Bool)

(declare-fun c!31487 () Bool)

(assert (=> b!175777 (= c!31487 (and (not (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175777 (= e!116000 e!116004)))

(declare-fun bm!17783 () Bool)

(assert (=> bm!17783 (= call!17787 (contains!1165 lt!87004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17784 () Bool)

(assert (=> bm!17784 (= call!17786 call!17784)))

(declare-fun b!175778 () Bool)

(declare-fun res!83323 () Bool)

(assert (=> b!175778 (=> (not res!83323) (not e!116010))))

(assert (=> b!175778 (= res!83323 e!116011)))

(declare-fun res!83318 () Bool)

(assert (=> b!175778 (=> res!83318 e!116011)))

(declare-fun e!116008 () Bool)

(assert (=> b!175778 (= res!83318 (not e!116008))))

(declare-fun res!83322 () Bool)

(assert (=> b!175778 (=> (not res!83322) (not e!116008))))

(assert (=> b!175778 (= res!83322 (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun b!175779 () Bool)

(assert (=> b!175779 (= e!116002 (not call!17788))))

(declare-fun b!175780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175780 (= e!116007 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175781 () Bool)

(assert (=> b!175781 (= e!116008 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175782 () Bool)

(assert (=> b!175782 (= e!116005 (not call!17787))))

(declare-fun bm!17785 () Bool)

(assert (=> bm!17785 (= call!17783 call!17785)))

(assert (= (and d!53569 c!31490) b!175773))

(assert (= (and d!53569 (not c!31490)) b!175775))

(assert (= (and b!175775 c!31489) b!175764))

(assert (= (and b!175775 (not c!31489)) b!175777))

(assert (= (and b!175777 c!31487) b!175769))

(assert (= (and b!175777 (not c!31487)) b!175762))

(assert (= (or b!175769 b!175762) bm!17785))

(assert (= (or b!175764 bm!17785) bm!17779))

(assert (= (or b!175764 b!175769) bm!17784))

(assert (= (or b!175773 bm!17779) bm!17780))

(assert (= (or b!175773 bm!17784) bm!17782))

(assert (= (and d!53569 res!83324) b!175780))

(assert (= (and d!53569 c!31486) b!175776))

(assert (= (and d!53569 (not c!31486)) b!175763))

(assert (= (and d!53569 res!83321) b!175778))

(assert (= (and b!175778 res!83322) b!175781))

(assert (= (and b!175778 (not res!83318)) b!175767))

(assert (= (and b!175767 res!83325) b!175771))

(assert (= (and b!175778 res!83323) b!175772))

(assert (= (and b!175772 c!31491) b!175768))

(assert (= (and b!175772 (not c!31491)) b!175782))

(assert (= (and b!175768 res!83326) b!175766))

(assert (= (or b!175768 b!175782) bm!17783))

(assert (= (and b!175772 res!83319) b!175765))

(assert (= (and b!175765 c!31488) b!175774))

(assert (= (and b!175765 (not c!31488)) b!175779))

(assert (= (and b!175774 res!83320) b!175770))

(assert (= (or b!175774 b!175779) bm!17781))

(declare-fun b_lambda!7037 () Bool)

(assert (=> (not b_lambda!7037) (not b!175771)))

(declare-fun t!7019 () Bool)

(declare-fun tb!2773 () Bool)

(assert (=> (and b!175655 (= (defaultEntry!3622 thiss!1248) (defaultEntry!3622 thiss!1248)) t!7019) tb!2773))

(declare-fun result!4609 () Bool)

(assert (=> tb!2773 (= result!4609 tp_is_empty!4111)))

(assert (=> b!175771 t!7019))

(declare-fun b_and!10841 () Bool)

(assert (= b_and!10835 (and (=> t!7019 result!4609) b_and!10841)))

(declare-fun m!204739 () Bool)

(assert (=> bm!17783 m!204739))

(declare-fun m!204741 () Bool)

(assert (=> b!175770 m!204741))

(assert (=> d!53569 m!204689))

(declare-fun m!204743 () Bool)

(assert (=> b!175773 m!204743))

(declare-fun m!204745 () Bool)

(assert (=> b!175781 m!204745))

(assert (=> b!175781 m!204745))

(declare-fun m!204747 () Bool)

(assert (=> b!175781 m!204747))

(declare-fun m!204749 () Bool)

(assert (=> b!175771 m!204749))

(assert (=> b!175771 m!204745))

(declare-fun m!204751 () Bool)

(assert (=> b!175771 m!204751))

(assert (=> b!175771 m!204745))

(assert (=> b!175771 m!204749))

(declare-fun m!204753 () Bool)

(assert (=> b!175771 m!204753))

(declare-fun m!204755 () Bool)

(assert (=> b!175771 m!204755))

(assert (=> b!175771 m!204753))

(declare-fun m!204757 () Bool)

(assert (=> bm!17781 m!204757))

(declare-fun m!204759 () Bool)

(assert (=> b!175766 m!204759))

(declare-fun m!204761 () Bool)

(assert (=> b!175776 m!204761))

(declare-fun m!204763 () Bool)

(assert (=> b!175776 m!204763))

(declare-fun m!204765 () Bool)

(assert (=> b!175776 m!204765))

(assert (=> b!175776 m!204761))

(declare-fun m!204767 () Bool)

(assert (=> b!175776 m!204767))

(declare-fun m!204769 () Bool)

(assert (=> b!175776 m!204769))

(declare-fun m!204771 () Bool)

(assert (=> b!175776 m!204771))

(declare-fun m!204773 () Bool)

(assert (=> b!175776 m!204773))

(declare-fun m!204775 () Bool)

(assert (=> b!175776 m!204775))

(declare-fun m!204777 () Bool)

(assert (=> b!175776 m!204777))

(declare-fun m!204779 () Bool)

(assert (=> b!175776 m!204779))

(assert (=> b!175776 m!204765))

(declare-fun m!204781 () Bool)

(assert (=> b!175776 m!204781))

(declare-fun m!204783 () Bool)

(assert (=> b!175776 m!204783))

(assert (=> b!175776 m!204745))

(assert (=> b!175776 m!204775))

(declare-fun m!204785 () Bool)

(assert (=> b!175776 m!204785))

(declare-fun m!204787 () Bool)

(assert (=> b!175776 m!204787))

(declare-fun m!204789 () Bool)

(assert (=> b!175776 m!204789))

(assert (=> b!175776 m!204779))

(declare-fun m!204791 () Bool)

(assert (=> b!175776 m!204791))

(assert (=> bm!17780 m!204787))

(assert (=> b!175767 m!204745))

(assert (=> b!175767 m!204745))

(declare-fun m!204793 () Bool)

(assert (=> b!175767 m!204793))

(assert (=> b!175780 m!204745))

(assert (=> b!175780 m!204745))

(assert (=> b!175780 m!204747))

(declare-fun m!204795 () Bool)

(assert (=> bm!17782 m!204795))

(assert (=> b!175653 d!53569))

(declare-fun d!53571 () Bool)

(assert (=> d!53571 (= (validMask!0 (mask!8523 thiss!1248)) (and (or (= (mask!8523 thiss!1248) #b00000000000000000000000000000111) (= (mask!8523 thiss!1248) #b00000000000000000000000000001111) (= (mask!8523 thiss!1248) #b00000000000000000000000000011111) (= (mask!8523 thiss!1248) #b00000000000000000000000000111111) (= (mask!8523 thiss!1248) #b00000000000000000000000001111111) (= (mask!8523 thiss!1248) #b00000000000000000000000011111111) (= (mask!8523 thiss!1248) #b00000000000000000000000111111111) (= (mask!8523 thiss!1248) #b00000000000000000000001111111111) (= (mask!8523 thiss!1248) #b00000000000000000000011111111111) (= (mask!8523 thiss!1248) #b00000000000000000000111111111111) (= (mask!8523 thiss!1248) #b00000000000000000001111111111111) (= (mask!8523 thiss!1248) #b00000000000000000011111111111111) (= (mask!8523 thiss!1248) #b00000000000000000111111111111111) (= (mask!8523 thiss!1248) #b00000000000000001111111111111111) (= (mask!8523 thiss!1248) #b00000000000000011111111111111111) (= (mask!8523 thiss!1248) #b00000000000000111111111111111111) (= (mask!8523 thiss!1248) #b00000000000001111111111111111111) (= (mask!8523 thiss!1248) #b00000000000011111111111111111111) (= (mask!8523 thiss!1248) #b00000000000111111111111111111111) (= (mask!8523 thiss!1248) #b00000000001111111111111111111111) (= (mask!8523 thiss!1248) #b00000000011111111111111111111111) (= (mask!8523 thiss!1248) #b00000000111111111111111111111111) (= (mask!8523 thiss!1248) #b00000001111111111111111111111111) (= (mask!8523 thiss!1248) #b00000011111111111111111111111111) (= (mask!8523 thiss!1248) #b00000111111111111111111111111111) (= (mask!8523 thiss!1248) #b00001111111111111111111111111111) (= (mask!8523 thiss!1248) #b00011111111111111111111111111111) (= (mask!8523 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8523 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175648 d!53571))

(declare-fun d!53573 () Bool)

(declare-fun res!83333 () Bool)

(declare-fun e!116014 () Bool)

(assert (=> d!53573 (=> (not res!83333) (not e!116014))))

(declare-fun simpleValid!149 (LongMapFixedSize!2332) Bool)

(assert (=> d!53573 (= res!83333 (simpleValid!149 thiss!1248))))

(assert (=> d!53573 (= (valid!999 thiss!1248) e!116014)))

(declare-fun b!175791 () Bool)

(declare-fun res!83334 () Bool)

(assert (=> b!175791 (=> (not res!83334) (not e!116014))))

(declare-fun arrayCountValidKeys!0 (array!7349 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175791 (= res!83334 (= (arrayCountValidKeys!0 (_keys!5475 thiss!1248) #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))) (_size!1215 thiss!1248)))))

(declare-fun b!175792 () Bool)

(declare-fun res!83335 () Bool)

(assert (=> b!175792 (=> (not res!83335) (not e!116014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7349 (_ BitVec 32)) Bool)

(assert (=> b!175792 (= res!83335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(declare-fun b!175793 () Bool)

(declare-datatypes ((List!2206 0))(
  ( (Nil!2203) (Cons!2202 (h!2821 (_ BitVec 64)) (t!7020 List!2206)) )
))
(declare-fun arrayNoDuplicates!0 (array!7349 (_ BitVec 32) List!2206) Bool)

(assert (=> b!175793 (= e!116014 (arrayNoDuplicates!0 (_keys!5475 thiss!1248) #b00000000000000000000000000000000 Nil!2203))))

(assert (= (and d!53573 res!83333) b!175791))

(assert (= (and b!175791 res!83334) b!175792))

(assert (= (and b!175792 res!83335) b!175793))

(declare-fun m!204797 () Bool)

(assert (=> d!53573 m!204797))

(declare-fun m!204799 () Bool)

(assert (=> b!175791 m!204799))

(declare-fun m!204801 () Bool)

(assert (=> b!175792 m!204801))

(declare-fun m!204803 () Bool)

(assert (=> b!175793 m!204803))

(assert (=> start!17536 d!53573))

(declare-fun d!53575 () Bool)

(declare-fun lt!87029 () SeekEntryResult!546)

(assert (=> d!53575 (and (or ((_ is Undefined!546) lt!87029) (not ((_ is Found!546) lt!87029)) (and (bvsge (index!4353 lt!87029) #b00000000000000000000000000000000) (bvslt (index!4353 lt!87029) (size!3790 (_keys!5475 thiss!1248))))) (or ((_ is Undefined!546) lt!87029) ((_ is Found!546) lt!87029) (not ((_ is MissingZero!546) lt!87029)) (and (bvsge (index!4352 lt!87029) #b00000000000000000000000000000000) (bvslt (index!4352 lt!87029) (size!3790 (_keys!5475 thiss!1248))))) (or ((_ is Undefined!546) lt!87029) ((_ is Found!546) lt!87029) ((_ is MissingZero!546) lt!87029) (not ((_ is MissingVacant!546) lt!87029)) (and (bvsge (index!4355 lt!87029) #b00000000000000000000000000000000) (bvslt (index!4355 lt!87029) (size!3790 (_keys!5475 thiss!1248))))) (or ((_ is Undefined!546) lt!87029) (ite ((_ is Found!546) lt!87029) (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4353 lt!87029)) key!828) (ite ((_ is MissingZero!546) lt!87029) (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4352 lt!87029)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!546) lt!87029) (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4355 lt!87029)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116021 () SeekEntryResult!546)

(assert (=> d!53575 (= lt!87029 e!116021)))

(declare-fun c!31500 () Bool)

(declare-fun lt!87030 () SeekEntryResult!546)

(assert (=> d!53575 (= c!31500 (and ((_ is Intermediate!546) lt!87030) (undefined!1358 lt!87030)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7349 (_ BitVec 32)) SeekEntryResult!546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53575 (= lt!87030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8523 thiss!1248)) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(assert (=> d!53575 (validMask!0 (mask!8523 thiss!1248))))

(assert (=> d!53575 (= (seekEntryOrOpen!0 key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)) lt!87029)))

(declare-fun b!175806 () Bool)

(declare-fun e!116022 () SeekEntryResult!546)

(assert (=> b!175806 (= e!116022 (MissingZero!546 (index!4354 lt!87030)))))

(declare-fun b!175807 () Bool)

(declare-fun e!116023 () SeekEntryResult!546)

(assert (=> b!175807 (= e!116021 e!116023)))

(declare-fun lt!87031 () (_ BitVec 64))

(assert (=> b!175807 (= lt!87031 (select (arr!3488 (_keys!5475 thiss!1248)) (index!4354 lt!87030)))))

(declare-fun c!31499 () Bool)

(assert (=> b!175807 (= c!31499 (= lt!87031 key!828))))

(declare-fun b!175808 () Bool)

(declare-fun c!31498 () Bool)

(assert (=> b!175808 (= c!31498 (= lt!87031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175808 (= e!116023 e!116022)))

(declare-fun b!175809 () Bool)

(assert (=> b!175809 (= e!116021 Undefined!546)))

(declare-fun b!175810 () Bool)

(assert (=> b!175810 (= e!116023 (Found!546 (index!4354 lt!87030)))))

(declare-fun b!175811 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7349 (_ BitVec 32)) SeekEntryResult!546)

(assert (=> b!175811 (= e!116022 (seekKeyOrZeroReturnVacant!0 (x!19304 lt!87030) (index!4354 lt!87030) (index!4354 lt!87030) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(assert (= (and d!53575 c!31500) b!175809))

(assert (= (and d!53575 (not c!31500)) b!175807))

(assert (= (and b!175807 c!31499) b!175810))

(assert (= (and b!175807 (not c!31499)) b!175808))

(assert (= (and b!175808 c!31498) b!175806))

(assert (= (and b!175808 (not c!31498)) b!175811))

(declare-fun m!204805 () Bool)

(assert (=> d!53575 m!204805))

(declare-fun m!204807 () Bool)

(assert (=> d!53575 m!204807))

(declare-fun m!204809 () Bool)

(assert (=> d!53575 m!204809))

(declare-fun m!204811 () Bool)

(assert (=> d!53575 m!204811))

(assert (=> d!53575 m!204805))

(declare-fun m!204813 () Bool)

(assert (=> d!53575 m!204813))

(assert (=> d!53575 m!204689))

(declare-fun m!204815 () Bool)

(assert (=> b!175807 m!204815))

(declare-fun m!204817 () Bool)

(assert (=> b!175811 m!204817))

(assert (=> b!175656 d!53575))

(declare-fun mapNonEmpty!7021 () Bool)

(declare-fun mapRes!7021 () Bool)

(declare-fun tp!15715 () Bool)

(declare-fun e!116029 () Bool)

(assert (=> mapNonEmpty!7021 (= mapRes!7021 (and tp!15715 e!116029))))

(declare-fun mapValue!7021 () ValueCell!1712)

(declare-fun mapKey!7021 () (_ BitVec 32))

(declare-fun mapRest!7021 () (Array (_ BitVec 32) ValueCell!1712))

(assert (=> mapNonEmpty!7021 (= mapRest!7012 (store mapRest!7021 mapKey!7021 mapValue!7021))))

(declare-fun mapIsEmpty!7021 () Bool)

(assert (=> mapIsEmpty!7021 mapRes!7021))

(declare-fun b!175818 () Bool)

(assert (=> b!175818 (= e!116029 tp_is_empty!4111)))

(declare-fun condMapEmpty!7021 () Bool)

(declare-fun mapDefault!7021 () ValueCell!1712)

(assert (=> mapNonEmpty!7012 (= condMapEmpty!7021 (= mapRest!7012 ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7021)))))

(declare-fun e!116028 () Bool)

(assert (=> mapNonEmpty!7012 (= tp!15699 (and e!116028 mapRes!7021))))

(declare-fun b!175819 () Bool)

(assert (=> b!175819 (= e!116028 tp_is_empty!4111)))

(assert (= (and mapNonEmpty!7012 condMapEmpty!7021) mapIsEmpty!7021))

(assert (= (and mapNonEmpty!7012 (not condMapEmpty!7021)) mapNonEmpty!7021))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1712) mapValue!7021)) b!175818))

(assert (= (and mapNonEmpty!7012 ((_ is ValueCellFull!1712) mapDefault!7021)) b!175819))

(declare-fun m!204819 () Bool)

(assert (=> mapNonEmpty!7021 m!204819))

(declare-fun b_lambda!7039 () Bool)

(assert (= b_lambda!7037 (or (and b!175655 b_free!4339) b_lambda!7039)))

(check-sat (not bm!17781) (not b!175776) (not b!175717) (not mapNonEmpty!7021) (not b!175766) b_and!10841 (not b_next!4339) (not b!175781) (not b!175767) tp_is_empty!4111 (not b!175792) (not b!175719) (not b_lambda!7039) (not d!53575) (not d!53567) (not d!53573) (not bm!17782) (not b!175791) (not b!175793) (not bm!17783) (not b!175771) (not b!175811) (not b!175780) (not d!53569) (not bm!17780) (not b!175773) (not b!175770))
(check-sat b_and!10841 (not b_next!4339))
(get-model)

(declare-fun d!53577 () Bool)

(declare-fun e!116030 () Bool)

(assert (=> d!53577 e!116030))

(declare-fun res!83336 () Bool)

(assert (=> d!53577 (=> res!83336 e!116030)))

(declare-fun lt!87034 () Bool)

(assert (=> d!53577 (= res!83336 (not lt!87034))))

(declare-fun lt!87032 () Bool)

(assert (=> d!53577 (= lt!87034 lt!87032)))

(declare-fun lt!87035 () Unit!5389)

(declare-fun e!116031 () Unit!5389)

(assert (=> d!53577 (= lt!87035 e!116031)))

(declare-fun c!31501 () Bool)

(assert (=> d!53577 (= c!31501 lt!87032)))

(assert (=> d!53577 (= lt!87032 (containsKey!194 (toList!1094 lt!87004) (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53577 (= (contains!1165 lt!87004 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)) lt!87034)))

(declare-fun b!175820 () Bool)

(declare-fun lt!87033 () Unit!5389)

(assert (=> b!175820 (= e!116031 lt!87033)))

(assert (=> b!175820 (= lt!87033 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 lt!87004) (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175820 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175821 () Bool)

(declare-fun Unit!5393 () Unit!5389)

(assert (=> b!175821 (= e!116031 Unit!5393)))

(declare-fun b!175822 () Bool)

(assert (=> b!175822 (= e!116030 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53577 c!31501) b!175820))

(assert (= (and d!53577 (not c!31501)) b!175821))

(assert (= (and d!53577 (not res!83336)) b!175822))

(assert (=> d!53577 m!204745))

(declare-fun m!204821 () Bool)

(assert (=> d!53577 m!204821))

(assert (=> b!175820 m!204745))

(declare-fun m!204823 () Bool)

(assert (=> b!175820 m!204823))

(assert (=> b!175820 m!204745))

(declare-fun m!204825 () Bool)

(assert (=> b!175820 m!204825))

(assert (=> b!175820 m!204825))

(declare-fun m!204827 () Bool)

(assert (=> b!175820 m!204827))

(assert (=> b!175822 m!204745))

(assert (=> b!175822 m!204825))

(assert (=> b!175822 m!204825))

(assert (=> b!175822 m!204827))

(assert (=> b!175767 d!53577))

(declare-fun d!53579 () Bool)

(declare-fun e!116034 () Bool)

(assert (=> d!53579 e!116034))

(declare-fun res!83342 () Bool)

(assert (=> d!53579 (=> (not res!83342) (not e!116034))))

(declare-fun lt!87047 () ListLongMap!2157)

(assert (=> d!53579 (= res!83342 (contains!1165 lt!87047 (_1!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun lt!87046 () List!2204)

(assert (=> d!53579 (= lt!87047 (ListLongMap!2158 lt!87046))))

(declare-fun lt!87044 () Unit!5389)

(declare-fun lt!87045 () Unit!5389)

(assert (=> d!53579 (= lt!87044 lt!87045)))

(assert (=> d!53579 (= (getValueByKey!191 lt!87046 (_1!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!102 (List!2204 (_ BitVec 64) V!5129) Unit!5389)

(assert (=> d!53579 (= lt!87045 (lemmaContainsTupThenGetReturnValue!102 lt!87046 (_1!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(declare-fun insertStrictlySorted!105 (List!2204 (_ BitVec 64) V!5129) List!2204)

(assert (=> d!53579 (= lt!87046 (insertStrictlySorted!105 (toList!1094 call!17784) (_1!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(assert (=> d!53579 (= (+!252 call!17784 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))) lt!87047)))

(declare-fun b!175827 () Bool)

(declare-fun res!83341 () Bool)

(assert (=> b!175827 (=> (not res!83341) (not e!116034))))

(assert (=> b!175827 (= res!83341 (= (getValueByKey!191 (toList!1094 lt!87047) (_1!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(declare-fun b!175828 () Bool)

(declare-fun contains!1167 (List!2204 tuple2!3224) Bool)

(assert (=> b!175828 (= e!116034 (contains!1167 (toList!1094 lt!87047) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))

(assert (= (and d!53579 res!83342) b!175827))

(assert (= (and b!175827 res!83341) b!175828))

(declare-fun m!204829 () Bool)

(assert (=> d!53579 m!204829))

(declare-fun m!204831 () Bool)

(assert (=> d!53579 m!204831))

(declare-fun m!204833 () Bool)

(assert (=> d!53579 m!204833))

(declare-fun m!204835 () Bool)

(assert (=> d!53579 m!204835))

(declare-fun m!204837 () Bool)

(assert (=> b!175827 m!204837))

(declare-fun m!204839 () Bool)

(assert (=> b!175828 m!204839))

(assert (=> b!175773 d!53579))

(declare-fun b!175839 () Bool)

(declare-fun e!116044 () Bool)

(declare-fun e!116043 () Bool)

(assert (=> b!175839 (= e!116044 e!116043)))

(declare-fun res!83349 () Bool)

(assert (=> b!175839 (=> (not res!83349) (not e!116043))))

(declare-fun e!116046 () Bool)

(assert (=> b!175839 (= res!83349 (not e!116046))))

(declare-fun res!83351 () Bool)

(assert (=> b!175839 (=> (not res!83351) (not e!116046))))

(assert (=> b!175839 (= res!83351 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175840 () Bool)

(declare-fun contains!1168 (List!2206 (_ BitVec 64)) Bool)

(assert (=> b!175840 (= e!116046 (contains!1168 Nil!2203 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175841 () Bool)

(declare-fun e!116045 () Bool)

(assert (=> b!175841 (= e!116043 e!116045)))

(declare-fun c!31504 () Bool)

(assert (=> b!175841 (= c!31504 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17788 () Bool)

(declare-fun call!17791 () Bool)

(assert (=> bm!17788 (= call!17791 (arrayNoDuplicates!0 (_keys!5475 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31504 (Cons!2202 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000) Nil!2203) Nil!2203)))))

(declare-fun b!175843 () Bool)

(assert (=> b!175843 (= e!116045 call!17791)))

(declare-fun b!175842 () Bool)

(assert (=> b!175842 (= e!116045 call!17791)))

(declare-fun d!53581 () Bool)

(declare-fun res!83350 () Bool)

(assert (=> d!53581 (=> res!83350 e!116044)))

(assert (=> d!53581 (= res!83350 (bvsge #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> d!53581 (= (arrayNoDuplicates!0 (_keys!5475 thiss!1248) #b00000000000000000000000000000000 Nil!2203) e!116044)))

(assert (= (and d!53581 (not res!83350)) b!175839))

(assert (= (and b!175839 res!83351) b!175840))

(assert (= (and b!175839 res!83349) b!175841))

(assert (= (and b!175841 c!31504) b!175842))

(assert (= (and b!175841 (not c!31504)) b!175843))

(assert (= (or b!175842 b!175843) bm!17788))

(assert (=> b!175839 m!204745))

(assert (=> b!175839 m!204745))

(assert (=> b!175839 m!204747))

(assert (=> b!175840 m!204745))

(assert (=> b!175840 m!204745))

(declare-fun m!204841 () Bool)

(assert (=> b!175840 m!204841))

(assert (=> b!175841 m!204745))

(assert (=> b!175841 m!204745))

(assert (=> b!175841 m!204747))

(assert (=> bm!17788 m!204745))

(declare-fun m!204843 () Bool)

(assert (=> bm!17788 m!204843))

(assert (=> b!175793 d!53581))

(declare-fun d!53583 () Bool)

(declare-fun get!1999 (Option!197) V!5129)

(assert (=> d!53583 (= (apply!135 lt!87004 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1999 (getValueByKey!191 (toList!1094 lt!87004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7266 () Bool)

(assert (= bs!7266 d!53583))

(declare-fun m!204845 () Bool)

(assert (=> bs!7266 m!204845))

(assert (=> bs!7266 m!204845))

(declare-fun m!204847 () Bool)

(assert (=> bs!7266 m!204847))

(assert (=> b!175766 d!53583))

(declare-fun d!53585 () Bool)

(assert (=> d!53585 (isDefined!143 (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun lt!87050 () Unit!5389)

(declare-fun choose!947 (List!2204 (_ BitVec 64)) Unit!5389)

(assert (=> d!53585 (= lt!87050 (choose!947 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(declare-fun e!116049 () Bool)

(assert (=> d!53585 e!116049))

(declare-fun res!83354 () Bool)

(assert (=> d!53585 (=> (not res!83354) (not e!116049))))

(declare-fun isStrictlySorted!322 (List!2204) Bool)

(assert (=> d!53585 (= res!83354 (isStrictlySorted!322 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))))

(assert (=> d!53585 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) lt!87050)))

(declare-fun b!175846 () Bool)

(assert (=> b!175846 (= e!116049 (containsKey!194 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))

(assert (= (and d!53585 res!83354) b!175846))

(assert (=> d!53585 m!204735))

(assert (=> d!53585 m!204735))

(assert (=> d!53585 m!204737))

(declare-fun m!204849 () Bool)

(assert (=> d!53585 m!204849))

(declare-fun m!204851 () Bool)

(assert (=> d!53585 m!204851))

(assert (=> b!175846 m!204731))

(assert (=> b!175717 d!53585))

(declare-fun d!53587 () Bool)

(declare-fun isEmpty!449 (Option!197) Bool)

(assert (=> d!53587 (= (isDefined!143 (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828)) (not (isEmpty!449 (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828))))))

(declare-fun bs!7267 () Bool)

(assert (= bs!7267 d!53587))

(assert (=> bs!7267 m!204735))

(declare-fun m!204853 () Bool)

(assert (=> bs!7267 m!204853))

(assert (=> b!175717 d!53587))

(declare-fun b!175855 () Bool)

(declare-fun e!116054 () Option!197)

(assert (=> b!175855 (= e!116054 (Some!196 (_2!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))))))))

(declare-fun d!53589 () Bool)

(declare-fun c!31509 () Bool)

(assert (=> d!53589 (= c!31509 (and ((_ is Cons!2200) (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (= (_1!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(assert (=> d!53589 (= (getValueByKey!191 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) e!116054)))

(declare-fun b!175858 () Bool)

(declare-fun e!116055 () Option!197)

(assert (=> b!175858 (= e!116055 None!195)))

(declare-fun b!175856 () Bool)

(assert (=> b!175856 (= e!116054 e!116055)))

(declare-fun c!31510 () Bool)

(assert (=> b!175856 (= c!31510 (and ((_ is Cons!2200) (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (not (= (_1!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828))))))

(declare-fun b!175857 () Bool)

(assert (=> b!175857 (= e!116055 (getValueByKey!191 (t!7016 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) key!828))))

(assert (= (and d!53589 c!31509) b!175855))

(assert (= (and d!53589 (not c!31509)) b!175856))

(assert (= (and b!175856 c!31510) b!175857))

(assert (= (and b!175856 (not c!31510)) b!175858))

(declare-fun m!204855 () Bool)

(assert (=> b!175857 m!204855))

(assert (=> b!175717 d!53589))

(declare-fun d!53591 () Bool)

(declare-fun e!116056 () Bool)

(assert (=> d!53591 e!116056))

(declare-fun res!83355 () Bool)

(assert (=> d!53591 (=> res!83355 e!116056)))

(declare-fun lt!87053 () Bool)

(assert (=> d!53591 (= res!83355 (not lt!87053))))

(declare-fun lt!87051 () Bool)

(assert (=> d!53591 (= lt!87053 lt!87051)))

(declare-fun lt!87054 () Unit!5389)

(declare-fun e!116057 () Unit!5389)

(assert (=> d!53591 (= lt!87054 e!116057)))

(declare-fun c!31511 () Bool)

(assert (=> d!53591 (= c!31511 lt!87051)))

(assert (=> d!53591 (= lt!87051 (containsKey!194 (toList!1094 lt!87004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53591 (= (contains!1165 lt!87004 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87053)))

(declare-fun b!175859 () Bool)

(declare-fun lt!87052 () Unit!5389)

(assert (=> b!175859 (= e!116057 lt!87052)))

(assert (=> b!175859 (= lt!87052 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 lt!87004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175859 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175860 () Bool)

(declare-fun Unit!5394 () Unit!5389)

(assert (=> b!175860 (= e!116057 Unit!5394)))

(declare-fun b!175861 () Bool)

(assert (=> b!175861 (= e!116056 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53591 c!31511) b!175859))

(assert (= (and d!53591 (not c!31511)) b!175860))

(assert (= (and d!53591 (not res!83355)) b!175861))

(declare-fun m!204857 () Bool)

(assert (=> d!53591 m!204857))

(declare-fun m!204859 () Bool)

(assert (=> b!175859 m!204859))

(declare-fun m!204861 () Bool)

(assert (=> b!175859 m!204861))

(assert (=> b!175859 m!204861))

(declare-fun m!204863 () Bool)

(assert (=> b!175859 m!204863))

(assert (=> b!175861 m!204861))

(assert (=> b!175861 m!204861))

(assert (=> b!175861 m!204863))

(assert (=> bm!17781 d!53591))

(declare-fun bm!17791 () Bool)

(declare-fun call!17794 () (_ BitVec 32))

(assert (=> bm!17791 (= call!17794 (arrayCountValidKeys!0 (_keys!5475 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun b!175870 () Bool)

(declare-fun e!116062 () (_ BitVec 32))

(declare-fun e!116063 () (_ BitVec 32))

(assert (=> b!175870 (= e!116062 e!116063)))

(declare-fun c!31516 () Bool)

(assert (=> b!175870 (= c!31516 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175871 () Bool)

(assert (=> b!175871 (= e!116062 #b00000000000000000000000000000000)))

(declare-fun b!175872 () Bool)

(assert (=> b!175872 (= e!116063 (bvadd #b00000000000000000000000000000001 call!17794))))

(declare-fun d!53593 () Bool)

(declare-fun lt!87057 () (_ BitVec 32))

(assert (=> d!53593 (and (bvsge lt!87057 #b00000000000000000000000000000000) (bvsle lt!87057 (bvsub (size!3790 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53593 (= lt!87057 e!116062)))

(declare-fun c!31517 () Bool)

(assert (=> d!53593 (= c!31517 (bvsge #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> d!53593 (and (bvsle #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3790 (_keys!5475 thiss!1248)) (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> d!53593 (= (arrayCountValidKeys!0 (_keys!5475 thiss!1248) #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))) lt!87057)))

(declare-fun b!175873 () Bool)

(assert (=> b!175873 (= e!116063 call!17794)))

(assert (= (and d!53593 c!31517) b!175871))

(assert (= (and d!53593 (not c!31517)) b!175870))

(assert (= (and b!175870 c!31516) b!175872))

(assert (= (and b!175870 (not c!31516)) b!175873))

(assert (= (or b!175872 b!175873) bm!17791))

(declare-fun m!204865 () Bool)

(assert (=> bm!17791 m!204865))

(assert (=> b!175870 m!204745))

(assert (=> b!175870 m!204745))

(assert (=> b!175870 m!204747))

(assert (=> b!175791 d!53593))

(declare-fun b!175883 () Bool)

(declare-fun res!83366 () Bool)

(declare-fun e!116066 () Bool)

(assert (=> b!175883 (=> (not res!83366) (not e!116066))))

(declare-fun size!3796 (LongMapFixedSize!2332) (_ BitVec 32))

(assert (=> b!175883 (= res!83366 (bvsge (size!3796 thiss!1248) (_size!1215 thiss!1248)))))

(declare-fun b!175885 () Bool)

(assert (=> b!175885 (= e!116066 (and (bvsge (extraKeys!3359 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3359 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1215 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175882 () Bool)

(declare-fun res!83365 () Bool)

(assert (=> b!175882 (=> (not res!83365) (not e!116066))))

(assert (=> b!175882 (= res!83365 (and (= (size!3791 (_values!3605 thiss!1248)) (bvadd (mask!8523 thiss!1248) #b00000000000000000000000000000001)) (= (size!3790 (_keys!5475 thiss!1248)) (size!3791 (_values!3605 thiss!1248))) (bvsge (_size!1215 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1215 thiss!1248) (bvadd (mask!8523 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!175884 () Bool)

(declare-fun res!83364 () Bool)

(assert (=> b!175884 (=> (not res!83364) (not e!116066))))

(assert (=> b!175884 (= res!83364 (= (size!3796 thiss!1248) (bvadd (_size!1215 thiss!1248) (bvsdiv (bvadd (extraKeys!3359 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!53595 () Bool)

(declare-fun res!83367 () Bool)

(assert (=> d!53595 (=> (not res!83367) (not e!116066))))

(assert (=> d!53595 (= res!83367 (validMask!0 (mask!8523 thiss!1248)))))

(assert (=> d!53595 (= (simpleValid!149 thiss!1248) e!116066)))

(assert (= (and d!53595 res!83367) b!175882))

(assert (= (and b!175882 res!83365) b!175883))

(assert (= (and b!175883 res!83366) b!175884))

(assert (= (and b!175884 res!83364) b!175885))

(declare-fun m!204867 () Bool)

(assert (=> b!175883 m!204867))

(assert (=> b!175884 m!204867))

(assert (=> d!53595 m!204689))

(assert (=> d!53573 d!53595))

(declare-fun d!53597 () Bool)

(assert (=> d!53597 (= (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175781 d!53597))

(declare-fun b!175904 () Bool)

(declare-fun e!116079 () SeekEntryResult!546)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175904 (= e!116079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8523 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8523 thiss!1248)) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(declare-fun b!175905 () Bool)

(declare-fun e!116078 () SeekEntryResult!546)

(assert (=> b!175905 (= e!116078 e!116079)))

(declare-fun c!31525 () Bool)

(declare-fun lt!87063 () (_ BitVec 64))

(assert (=> b!175905 (= c!31525 (or (= lt!87063 key!828) (= (bvadd lt!87063 lt!87063) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175906 () Bool)

(declare-fun lt!87062 () SeekEntryResult!546)

(assert (=> b!175906 (and (bvsge (index!4354 lt!87062) #b00000000000000000000000000000000) (bvslt (index!4354 lt!87062) (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun res!83376 () Bool)

(assert (=> b!175906 (= res!83376 (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4354 lt!87062)) key!828))))

(declare-fun e!116077 () Bool)

(assert (=> b!175906 (=> res!83376 e!116077)))

(declare-fun e!116080 () Bool)

(assert (=> b!175906 (= e!116080 e!116077)))

(declare-fun b!175907 () Bool)

(declare-fun e!116081 () Bool)

(assert (=> b!175907 (= e!116081 (bvsge (x!19304 lt!87062) #b01111111111111111111111111111110))))

(declare-fun b!175908 () Bool)

(assert (=> b!175908 (= e!116081 e!116080)))

(declare-fun res!83374 () Bool)

(assert (=> b!175908 (= res!83374 (and ((_ is Intermediate!546) lt!87062) (not (undefined!1358 lt!87062)) (bvslt (x!19304 lt!87062) #b01111111111111111111111111111110) (bvsge (x!19304 lt!87062) #b00000000000000000000000000000000) (bvsge (x!19304 lt!87062) #b00000000000000000000000000000000)))))

(assert (=> b!175908 (=> (not res!83374) (not e!116080))))

(declare-fun b!175909 () Bool)

(assert (=> b!175909 (= e!116078 (Intermediate!546 true (toIndex!0 key!828 (mask!8523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175910 () Bool)

(assert (=> b!175910 (and (bvsge (index!4354 lt!87062) #b00000000000000000000000000000000) (bvslt (index!4354 lt!87062) (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> b!175910 (= e!116077 (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4354 lt!87062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175911 () Bool)

(assert (=> b!175911 (= e!116079 (Intermediate!546 false (toIndex!0 key!828 (mask!8523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175912 () Bool)

(assert (=> b!175912 (and (bvsge (index!4354 lt!87062) #b00000000000000000000000000000000) (bvslt (index!4354 lt!87062) (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun res!83375 () Bool)

(assert (=> b!175912 (= res!83375 (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4354 lt!87062)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175912 (=> res!83375 e!116077)))

(declare-fun d!53599 () Bool)

(assert (=> d!53599 e!116081))

(declare-fun c!31524 () Bool)

(assert (=> d!53599 (= c!31524 (and ((_ is Intermediate!546) lt!87062) (undefined!1358 lt!87062)))))

(assert (=> d!53599 (= lt!87062 e!116078)))

(declare-fun c!31526 () Bool)

(assert (=> d!53599 (= c!31526 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53599 (= lt!87063 (select (arr!3488 (_keys!5475 thiss!1248)) (toIndex!0 key!828 (mask!8523 thiss!1248))))))

(assert (=> d!53599 (validMask!0 (mask!8523 thiss!1248))))

(assert (=> d!53599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8523 thiss!1248)) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)) lt!87062)))

(assert (= (and d!53599 c!31526) b!175909))

(assert (= (and d!53599 (not c!31526)) b!175905))

(assert (= (and b!175905 c!31525) b!175911))

(assert (= (and b!175905 (not c!31525)) b!175904))

(assert (= (and d!53599 c!31524) b!175907))

(assert (= (and d!53599 (not c!31524)) b!175908))

(assert (= (and b!175908 res!83374) b!175906))

(assert (= (and b!175906 (not res!83376)) b!175912))

(assert (= (and b!175912 (not res!83375)) b!175910))

(assert (=> d!53599 m!204805))

(declare-fun m!204869 () Bool)

(assert (=> d!53599 m!204869))

(assert (=> d!53599 m!204689))

(declare-fun m!204871 () Bool)

(assert (=> b!175906 m!204871))

(assert (=> b!175912 m!204871))

(assert (=> b!175910 m!204871))

(assert (=> b!175904 m!204805))

(declare-fun m!204873 () Bool)

(assert (=> b!175904 m!204873))

(assert (=> b!175904 m!204873))

(declare-fun m!204875 () Bool)

(assert (=> b!175904 m!204875))

(assert (=> d!53575 d!53599))

(declare-fun d!53601 () Bool)

(declare-fun lt!87069 () (_ BitVec 32))

(declare-fun lt!87068 () (_ BitVec 32))

(assert (=> d!53601 (= lt!87069 (bvmul (bvxor lt!87068 (bvlshr lt!87068 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53601 (= lt!87068 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53601 (and (bvsge (mask!8523 thiss!1248) #b00000000000000000000000000000000) (let ((res!83377 (let ((h!2822 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19321 (bvmul (bvxor h!2822 (bvlshr h!2822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19321 (bvlshr x!19321 #b00000000000000000000000000001101)) (mask!8523 thiss!1248)))))) (and (bvslt res!83377 (bvadd (mask!8523 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83377 #b00000000000000000000000000000000))))))

(assert (=> d!53601 (= (toIndex!0 key!828 (mask!8523 thiss!1248)) (bvand (bvxor lt!87069 (bvlshr lt!87069 #b00000000000000000000000000001101)) (mask!8523 thiss!1248)))))

(assert (=> d!53575 d!53601))

(assert (=> d!53575 d!53571))

(declare-fun d!53603 () Bool)

(declare-fun e!116082 () Bool)

(assert (=> d!53603 e!116082))

(declare-fun res!83379 () Bool)

(assert (=> d!53603 (=> (not res!83379) (not e!116082))))

(declare-fun lt!87073 () ListLongMap!2157)

(assert (=> d!53603 (= res!83379 (contains!1165 lt!87073 (_1!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(declare-fun lt!87072 () List!2204)

(assert (=> d!53603 (= lt!87073 (ListLongMap!2158 lt!87072))))

(declare-fun lt!87070 () Unit!5389)

(declare-fun lt!87071 () Unit!5389)

(assert (=> d!53603 (= lt!87070 lt!87071)))

(assert (=> d!53603 (= (getValueByKey!191 lt!87072 (_1!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))) (Some!196 (_2!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53603 (= lt!87071 (lemmaContainsTupThenGetReturnValue!102 lt!87072 (_1!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (_2!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53603 (= lt!87072 (insertStrictlySorted!105 (toList!1094 (ite c!31490 call!17782 (ite c!31489 call!17785 call!17783))) (_1!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) (_2!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))))))

(assert (=> d!53603 (= (+!252 (ite c!31490 call!17782 (ite c!31489 call!17785 call!17783)) (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))) lt!87073)))

(declare-fun b!175913 () Bool)

(declare-fun res!83378 () Bool)

(assert (=> b!175913 (=> (not res!83378) (not e!116082))))

(assert (=> b!175913 (= res!83378 (= (getValueByKey!191 (toList!1094 lt!87073) (_1!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248))))) (Some!196 (_2!1623 (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))))

(declare-fun b!175914 () Bool)

(assert (=> b!175914 (= e!116082 (contains!1167 (toList!1094 lt!87073) (ite (or c!31490 c!31489) (tuple2!3225 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3463 thiss!1248)) (tuple2!3225 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3463 thiss!1248)))))))

(assert (= (and d!53603 res!83379) b!175913))

(assert (= (and b!175913 res!83378) b!175914))

(declare-fun m!204877 () Bool)

(assert (=> d!53603 m!204877))

(declare-fun m!204879 () Bool)

(assert (=> d!53603 m!204879))

(declare-fun m!204881 () Bool)

(assert (=> d!53603 m!204881))

(declare-fun m!204883 () Bool)

(assert (=> d!53603 m!204883))

(declare-fun m!204885 () Bool)

(assert (=> b!175913 m!204885))

(declare-fun m!204887 () Bool)

(assert (=> b!175914 m!204887))

(assert (=> bm!17782 d!53603))

(declare-fun b!175928 () Bool)

(declare-fun c!31535 () Bool)

(declare-fun lt!87078 () (_ BitVec 64))

(assert (=> b!175928 (= c!31535 (= lt!87078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116090 () SeekEntryResult!546)

(declare-fun e!116091 () SeekEntryResult!546)

(assert (=> b!175928 (= e!116090 e!116091)))

(declare-fun b!175929 () Bool)

(assert (=> b!175929 (= e!116090 (Found!546 (index!4354 lt!87030)))))

(declare-fun b!175930 () Bool)

(assert (=> b!175930 (= e!116091 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19304 lt!87030) #b00000000000000000000000000000001) (nextIndex!0 (index!4354 lt!87030) (bvadd (x!19304 lt!87030) #b00000000000000000000000000000001) (mask!8523 thiss!1248)) (index!4354 lt!87030) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(declare-fun b!175931 () Bool)

(assert (=> b!175931 (= e!116091 (MissingVacant!546 (index!4354 lt!87030)))))

(declare-fun b!175932 () Bool)

(declare-fun e!116089 () SeekEntryResult!546)

(assert (=> b!175932 (= e!116089 e!116090)))

(declare-fun c!31533 () Bool)

(assert (=> b!175932 (= c!31533 (= lt!87078 key!828))))

(declare-fun d!53605 () Bool)

(declare-fun lt!87079 () SeekEntryResult!546)

(assert (=> d!53605 (and (or ((_ is Undefined!546) lt!87079) (not ((_ is Found!546) lt!87079)) (and (bvsge (index!4353 lt!87079) #b00000000000000000000000000000000) (bvslt (index!4353 lt!87079) (size!3790 (_keys!5475 thiss!1248))))) (or ((_ is Undefined!546) lt!87079) ((_ is Found!546) lt!87079) (not ((_ is MissingVacant!546) lt!87079)) (not (= (index!4355 lt!87079) (index!4354 lt!87030))) (and (bvsge (index!4355 lt!87079) #b00000000000000000000000000000000) (bvslt (index!4355 lt!87079) (size!3790 (_keys!5475 thiss!1248))))) (or ((_ is Undefined!546) lt!87079) (ite ((_ is Found!546) lt!87079) (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4353 lt!87079)) key!828) (and ((_ is MissingVacant!546) lt!87079) (= (index!4355 lt!87079) (index!4354 lt!87030)) (= (select (arr!3488 (_keys!5475 thiss!1248)) (index!4355 lt!87079)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53605 (= lt!87079 e!116089)))

(declare-fun c!31534 () Bool)

(assert (=> d!53605 (= c!31534 (bvsge (x!19304 lt!87030) #b01111111111111111111111111111110))))

(assert (=> d!53605 (= lt!87078 (select (arr!3488 (_keys!5475 thiss!1248)) (index!4354 lt!87030)))))

(assert (=> d!53605 (validMask!0 (mask!8523 thiss!1248))))

(assert (=> d!53605 (= (seekKeyOrZeroReturnVacant!0 (x!19304 lt!87030) (index!4354 lt!87030) (index!4354 lt!87030) key!828 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)) lt!87079)))

(declare-fun b!175927 () Bool)

(assert (=> b!175927 (= e!116089 Undefined!546)))

(assert (= (and d!53605 c!31534) b!175927))

(assert (= (and d!53605 (not c!31534)) b!175932))

(assert (= (and b!175932 c!31533) b!175929))

(assert (= (and b!175932 (not c!31533)) b!175928))

(assert (= (and b!175928 c!31535) b!175931))

(assert (= (and b!175928 (not c!31535)) b!175930))

(declare-fun m!204889 () Bool)

(assert (=> b!175930 m!204889))

(assert (=> b!175930 m!204889))

(declare-fun m!204891 () Bool)

(assert (=> b!175930 m!204891))

(declare-fun m!204893 () Bool)

(assert (=> d!53605 m!204893))

(declare-fun m!204895 () Bool)

(assert (=> d!53605 m!204895))

(assert (=> d!53605 m!204815))

(assert (=> d!53605 m!204689))

(assert (=> b!175811 d!53605))

(declare-fun b!175941 () Bool)

(declare-fun e!116098 () Bool)

(declare-fun call!17797 () Bool)

(assert (=> b!175941 (= e!116098 call!17797)))

(declare-fun b!175942 () Bool)

(declare-fun e!116099 () Bool)

(assert (=> b!175942 (= e!116098 e!116099)))

(declare-fun lt!87087 () (_ BitVec 64))

(assert (=> b!175942 (= lt!87087 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87086 () Unit!5389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7349 (_ BitVec 64) (_ BitVec 32)) Unit!5389)

(assert (=> b!175942 (= lt!87086 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5475 thiss!1248) lt!87087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175942 (arrayContainsKey!0 (_keys!5475 thiss!1248) lt!87087 #b00000000000000000000000000000000)))

(declare-fun lt!87088 () Unit!5389)

(assert (=> b!175942 (= lt!87088 lt!87086)))

(declare-fun res!83385 () Bool)

(assert (=> b!175942 (= res!83385 (= (seekEntryOrOpen!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000) (_keys!5475 thiss!1248) (mask!8523 thiss!1248)) (Found!546 #b00000000000000000000000000000000)))))

(assert (=> b!175942 (=> (not res!83385) (not e!116099))))

(declare-fun d!53607 () Bool)

(declare-fun res!83384 () Bool)

(declare-fun e!116100 () Bool)

(assert (=> d!53607 (=> res!83384 e!116100)))

(assert (=> d!53607 (= res!83384 (bvsge #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> d!53607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5475 thiss!1248) (mask!8523 thiss!1248)) e!116100)))

(declare-fun b!175943 () Bool)

(assert (=> b!175943 (= e!116100 e!116098)))

(declare-fun c!31538 () Bool)

(assert (=> b!175943 (= c!31538 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175944 () Bool)

(assert (=> b!175944 (= e!116099 call!17797)))

(declare-fun bm!17794 () Bool)

(assert (=> bm!17794 (= call!17797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5475 thiss!1248) (mask!8523 thiss!1248)))))

(assert (= (and d!53607 (not res!83384)) b!175943))

(assert (= (and b!175943 c!31538) b!175942))

(assert (= (and b!175943 (not c!31538)) b!175941))

(assert (= (and b!175942 res!83385) b!175944))

(assert (= (or b!175944 b!175941) bm!17794))

(assert (=> b!175942 m!204745))

(declare-fun m!204897 () Bool)

(assert (=> b!175942 m!204897))

(declare-fun m!204899 () Bool)

(assert (=> b!175942 m!204899))

(assert (=> b!175942 m!204745))

(declare-fun m!204901 () Bool)

(assert (=> b!175942 m!204901))

(assert (=> b!175943 m!204745))

(assert (=> b!175943 m!204745))

(assert (=> b!175943 m!204747))

(declare-fun m!204903 () Bool)

(assert (=> bm!17794 m!204903))

(assert (=> b!175792 d!53607))

(declare-fun d!53609 () Bool)

(declare-fun res!83390 () Bool)

(declare-fun e!116105 () Bool)

(assert (=> d!53609 (=> res!83390 e!116105)))

(assert (=> d!53609 (= res!83390 (and ((_ is Cons!2200) (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (= (_1!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(assert (=> d!53609 (= (containsKey!194 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))) key!828) e!116105)))

(declare-fun b!175949 () Bool)

(declare-fun e!116106 () Bool)

(assert (=> b!175949 (= e!116105 e!116106)))

(declare-fun res!83391 () Bool)

(assert (=> b!175949 (=> (not res!83391) (not e!116106))))

(assert (=> b!175949 (= res!83391 (and (or (not ((_ is Cons!2200) (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) (bvsle (_1!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)) ((_ is Cons!2200) (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) (bvslt (_1!1623 (h!2819 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248))))) key!828)))))

(declare-fun b!175950 () Bool)

(assert (=> b!175950 (= e!116106 (containsKey!194 (t!7016 (toList!1094 (getCurrentListMap!749 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)))) key!828))))

(assert (= (and d!53609 (not res!83390)) b!175949))

(assert (= (and b!175949 res!83391) b!175950))

(declare-fun m!204905 () Bool)

(assert (=> b!175950 m!204905))

(assert (=> d!53567 d!53609))

(assert (=> b!175780 d!53597))

(declare-fun b!175975 () Bool)

(declare-fun e!116123 () ListLongMap!2157)

(declare-fun call!17800 () ListLongMap!2157)

(assert (=> b!175975 (= e!116123 call!17800)))

(declare-fun b!175976 () Bool)

(declare-fun e!116126 () ListLongMap!2157)

(assert (=> b!175976 (= e!116126 e!116123)))

(declare-fun c!31548 () Bool)

(assert (=> b!175976 (= c!31548 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175977 () Bool)

(assert (=> b!175977 (= e!116126 (ListLongMap!2158 Nil!2201))))

(declare-fun b!175978 () Bool)

(declare-fun e!116122 () Bool)

(assert (=> b!175978 (= e!116122 (validKeyInArray!0 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175978 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175979 () Bool)

(declare-fun res!83400 () Bool)

(declare-fun e!116124 () Bool)

(assert (=> b!175979 (=> (not res!83400) (not e!116124))))

(declare-fun lt!87103 () ListLongMap!2157)

(assert (=> b!175979 (= res!83400 (not (contains!1165 lt!87103 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53611 () Bool)

(assert (=> d!53611 e!116124))

(declare-fun res!83401 () Bool)

(assert (=> d!53611 (=> (not res!83401) (not e!116124))))

(assert (=> d!53611 (= res!83401 (not (contains!1165 lt!87103 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53611 (= lt!87103 e!116126)))

(declare-fun c!31550 () Bool)

(assert (=> d!53611 (= c!31550 (bvsge #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> d!53611 (validMask!0 (mask!8523 thiss!1248))))

(assert (=> d!53611 (= (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3622 thiss!1248)) lt!87103)))

(declare-fun b!175980 () Bool)

(assert (=> b!175980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (=> b!175980 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3791 (_values!3605 thiss!1248))))))

(declare-fun e!116127 () Bool)

(assert (=> b!175980 (= e!116127 (= (apply!135 lt!87103 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)) (get!1998 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17797 () Bool)

(assert (=> bm!17797 (= call!17800 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3622 thiss!1248)))))

(declare-fun b!175981 () Bool)

(declare-fun e!116121 () Bool)

(assert (=> b!175981 (= e!116124 e!116121)))

(declare-fun c!31549 () Bool)

(assert (=> b!175981 (= c!31549 e!116122)))

(declare-fun res!83403 () Bool)

(assert (=> b!175981 (=> (not res!83403) (not e!116122))))

(assert (=> b!175981 (= res!83403 (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun b!175982 () Bool)

(assert (=> b!175982 (= e!116121 e!116127)))

(assert (=> b!175982 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(declare-fun res!83402 () Bool)

(assert (=> b!175982 (= res!83402 (contains!1165 lt!87103 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175982 (=> (not res!83402) (not e!116127))))

(declare-fun b!175983 () Bool)

(declare-fun e!116125 () Bool)

(declare-fun isEmpty!450 (ListLongMap!2157) Bool)

(assert (=> b!175983 (= e!116125 (isEmpty!450 lt!87103))))

(declare-fun b!175984 () Bool)

(assert (=> b!175984 (= e!116125 (= lt!87103 (getCurrentListMapNoExtraKeys!166 (_keys!5475 thiss!1248) (_values!3605 thiss!1248) (mask!8523 thiss!1248) (extraKeys!3359 thiss!1248) (zeroValue!3463 thiss!1248) (minValue!3463 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3622 thiss!1248))))))

(declare-fun b!175985 () Bool)

(declare-fun lt!87104 () Unit!5389)

(declare-fun lt!87106 () Unit!5389)

(assert (=> b!175985 (= lt!87104 lt!87106)))

(declare-fun lt!87108 () ListLongMap!2157)

(declare-fun lt!87107 () (_ BitVec 64))

(declare-fun lt!87109 () V!5129)

(declare-fun lt!87105 () (_ BitVec 64))

(assert (=> b!175985 (not (contains!1165 (+!252 lt!87108 (tuple2!3225 lt!87105 lt!87109)) lt!87107))))

(declare-fun addStillNotContains!77 (ListLongMap!2157 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5389)

(assert (=> b!175985 (= lt!87106 (addStillNotContains!77 lt!87108 lt!87105 lt!87109 lt!87107))))

(assert (=> b!175985 (= lt!87107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175985 (= lt!87109 (get!1998 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175985 (= lt!87105 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175985 (= lt!87108 call!17800)))

(assert (=> b!175985 (= e!116123 (+!252 call!17800 (tuple2!3225 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000) (get!1998 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175986 () Bool)

(assert (=> b!175986 (= e!116121 e!116125)))

(declare-fun c!31547 () Bool)

(assert (=> b!175986 (= c!31547 (bvslt #b00000000000000000000000000000000 (size!3790 (_keys!5475 thiss!1248))))))

(assert (= (and d!53611 c!31550) b!175977))

(assert (= (and d!53611 (not c!31550)) b!175976))

(assert (= (and b!175976 c!31548) b!175985))

(assert (= (and b!175976 (not c!31548)) b!175975))

(assert (= (or b!175985 b!175975) bm!17797))

(assert (= (and d!53611 res!83401) b!175979))

(assert (= (and b!175979 res!83400) b!175981))

(assert (= (and b!175981 res!83403) b!175978))

(assert (= (and b!175981 c!31549) b!175982))

(assert (= (and b!175981 (not c!31549)) b!175986))

(assert (= (and b!175982 res!83402) b!175980))

(assert (= (and b!175986 c!31547) b!175984))

(assert (= (and b!175986 (not c!31547)) b!175983))

(declare-fun b_lambda!7041 () Bool)

(assert (=> (not b_lambda!7041) (not b!175980)))

(assert (=> b!175980 t!7019))

(declare-fun b_and!10843 () Bool)

(assert (= b_and!10841 (and (=> t!7019 result!4609) b_and!10843)))

(declare-fun b_lambda!7043 () Bool)

(assert (=> (not b_lambda!7043) (not b!175985)))

(assert (=> b!175985 t!7019))

(declare-fun b_and!10845 () Bool)

(assert (= b_and!10843 (and (=> t!7019 result!4609) b_and!10845)))

(assert (=> b!175976 m!204745))

(assert (=> b!175976 m!204745))

(assert (=> b!175976 m!204747))

(assert (=> b!175978 m!204745))

(assert (=> b!175978 m!204745))

(assert (=> b!175978 m!204747))

(declare-fun m!204907 () Bool)

(assert (=> b!175979 m!204907))

(assert (=> b!175985 m!204745))

(declare-fun m!204909 () Bool)

(assert (=> b!175985 m!204909))

(assert (=> b!175985 m!204753))

(assert (=> b!175985 m!204749))

(assert (=> b!175985 m!204753))

(assert (=> b!175985 m!204755))

(declare-fun m!204911 () Bool)

(assert (=> b!175985 m!204911))

(assert (=> b!175985 m!204911))

(declare-fun m!204913 () Bool)

(assert (=> b!175985 m!204913))

(declare-fun m!204915 () Bool)

(assert (=> b!175985 m!204915))

(assert (=> b!175985 m!204749))

(assert (=> b!175982 m!204745))

(assert (=> b!175982 m!204745))

(declare-fun m!204917 () Bool)

(assert (=> b!175982 m!204917))

(assert (=> b!175980 m!204745))

(assert (=> b!175980 m!204753))

(assert (=> b!175980 m!204749))

(assert (=> b!175980 m!204749))

(assert (=> b!175980 m!204753))

(assert (=> b!175980 m!204755))

(assert (=> b!175980 m!204745))

(declare-fun m!204919 () Bool)

(assert (=> b!175980 m!204919))

(declare-fun m!204921 () Bool)

(assert (=> b!175983 m!204921))

(declare-fun m!204923 () Bool)

(assert (=> d!53611 m!204923))

(assert (=> d!53611 m!204689))

(declare-fun m!204925 () Bool)

(assert (=> b!175984 m!204925))

(assert (=> bm!17797 m!204925))

(assert (=> bm!17780 d!53611))

(declare-fun d!53613 () Bool)

(declare-fun e!116128 () Bool)

(assert (=> d!53613 e!116128))

(declare-fun res!83404 () Bool)

(assert (=> d!53613 (=> res!83404 e!116128)))

(declare-fun lt!87112 () Bool)

(assert (=> d!53613 (= res!83404 (not lt!87112))))

(declare-fun lt!87110 () Bool)

(assert (=> d!53613 (= lt!87112 lt!87110)))

(declare-fun lt!87113 () Unit!5389)

(declare-fun e!116129 () Unit!5389)

(assert (=> d!53613 (= lt!87113 e!116129)))

(declare-fun c!31551 () Bool)

(assert (=> d!53613 (= c!31551 lt!87110)))

(assert (=> d!53613 (= lt!87110 (containsKey!194 (toList!1094 lt!87004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53613 (= (contains!1165 lt!87004 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87112)))

(declare-fun b!175987 () Bool)

(declare-fun lt!87111 () Unit!5389)

(assert (=> b!175987 (= e!116129 lt!87111)))

(assert (=> b!175987 (= lt!87111 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 lt!87004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175987 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175988 () Bool)

(declare-fun Unit!5395 () Unit!5389)

(assert (=> b!175988 (= e!116129 Unit!5395)))

(declare-fun b!175989 () Bool)

(assert (=> b!175989 (= e!116128 (isDefined!143 (getValueByKey!191 (toList!1094 lt!87004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53613 c!31551) b!175987))

(assert (= (and d!53613 (not c!31551)) b!175988))

(assert (= (and d!53613 (not res!83404)) b!175989))

(declare-fun m!204927 () Bool)

(assert (=> d!53613 m!204927))

(declare-fun m!204929 () Bool)

(assert (=> b!175987 m!204929))

(assert (=> b!175987 m!204845))

(assert (=> b!175987 m!204845))

(declare-fun m!204931 () Bool)

(assert (=> b!175987 m!204931))

(assert (=> b!175989 m!204845))

(assert (=> b!175989 m!204845))

(assert (=> b!175989 m!204931))

(assert (=> bm!17783 d!53613))

(declare-fun d!53615 () Bool)

(assert (=> d!53615 (= (apply!135 lt!87004 (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000)) (get!1999 (getValueByKey!191 (toList!1094 lt!87004) (select (arr!3488 (_keys!5475 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7268 () Bool)

(assert (= bs!7268 d!53615))

(assert (=> bs!7268 m!204745))

(assert (=> bs!7268 m!204825))

(assert (=> bs!7268 m!204825))

(declare-fun m!204933 () Bool)

(assert (=> bs!7268 m!204933))

(assert (=> b!175771 d!53615))

(declare-fun d!53617 () Bool)

(declare-fun c!31554 () Bool)

(assert (=> d!53617 (= c!31554 ((_ is ValueCellFull!1712) (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116132 () V!5129)

(assert (=> d!53617 (= (get!1998 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116132)))

(declare-fun b!175994 () Bool)

(declare-fun get!2000 (ValueCell!1712 V!5129) V!5129)

(assert (=> b!175994 (= e!116132 (get!2000 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175995 () Bool)

(declare-fun get!2001 (ValueCell!1712 V!5129) V!5129)

(assert (=> b!175995 (= e!116132 (get!2001 (select (arr!3489 (_values!3605 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3622 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53617 c!31554) b!175994))

(assert (= (and d!53617 (not c!31554)) b!175995))

(assert (=> b!175994 m!204749))

(assert (=> b!175994 m!204753))

(declare-fun m!204935 () Bool)

(assert (=> b!175994 m!204935))

(assert (=> b!175995 m!204749))

(assert (=> b!175995 m!204753))

(declare-fun m!204937 () Bool)

(assert (=> b!175995 m!204937))

(assert (=> b!175771 d!53617))

(assert (=> b!175776 d!53611))

(declare-fun d!53619 () Bool)

(assert (=> d!53619 (= (apply!135 lt!87019 lt!87005) (get!1999 (getValueByKey!191 (toList!1094 lt!87019) lt!87005)))))

(declare-fun bs!7269 () Bool)

(assert (= bs!7269 d!53619))

(declare-fun m!204939 () Bool)

(assert (=> bs!7269 m!204939))

(assert (=> bs!7269 m!204939))

(declare-fun m!204941 () Bool)

(assert (=> bs!7269 m!204941))

(assert (=> b!175776 d!53619))

(declare-fun d!53621 () Bool)

(assert (=> d!53621 (= (apply!135 (+!252 lt!87003 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) lt!87014) (apply!135 lt!87003 lt!87014))))

(declare-fun lt!87116 () Unit!5389)

(declare-fun choose!948 (ListLongMap!2157 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5389)

(assert (=> d!53621 (= lt!87116 (choose!948 lt!87003 lt!87007 (minValue!3463 thiss!1248) lt!87014))))

(declare-fun e!116135 () Bool)

(assert (=> d!53621 e!116135))

(declare-fun res!83407 () Bool)

(assert (=> d!53621 (=> (not res!83407) (not e!116135))))

(assert (=> d!53621 (= res!83407 (contains!1165 lt!87003 lt!87014))))

(assert (=> d!53621 (= (addApplyDifferent!111 lt!87003 lt!87007 (minValue!3463 thiss!1248) lt!87014) lt!87116)))

(declare-fun b!175999 () Bool)

(assert (=> b!175999 (= e!116135 (not (= lt!87014 lt!87007)))))

(assert (= (and d!53621 res!83407) b!175999))

(declare-fun m!204943 () Bool)

(assert (=> d!53621 m!204943))

(assert (=> d!53621 m!204765))

(assert (=> d!53621 m!204777))

(declare-fun m!204945 () Bool)

(assert (=> d!53621 m!204945))

(assert (=> d!53621 m!204765))

(assert (=> d!53621 m!204781))

(assert (=> b!175776 d!53621))

(declare-fun d!53623 () Bool)

(assert (=> d!53623 (= (apply!135 (+!252 lt!87003 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) lt!87014) (get!1999 (getValueByKey!191 (toList!1094 (+!252 lt!87003 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))) lt!87014)))))

(declare-fun bs!7270 () Bool)

(assert (= bs!7270 d!53623))

(declare-fun m!204947 () Bool)

(assert (=> bs!7270 m!204947))

(assert (=> bs!7270 m!204947))

(declare-fun m!204949 () Bool)

(assert (=> bs!7270 m!204949))

(assert (=> b!175776 d!53623))

(declare-fun d!53625 () Bool)

(declare-fun e!116136 () Bool)

(assert (=> d!53625 e!116136))

(declare-fun res!83409 () Bool)

(assert (=> d!53625 (=> (not res!83409) (not e!116136))))

(declare-fun lt!87120 () ListLongMap!2157)

(assert (=> d!53625 (= res!83409 (contains!1165 lt!87120 (_1!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))))))

(declare-fun lt!87119 () List!2204)

(assert (=> d!53625 (= lt!87120 (ListLongMap!2158 lt!87119))))

(declare-fun lt!87117 () Unit!5389)

(declare-fun lt!87118 () Unit!5389)

(assert (=> d!53625 (= lt!87117 lt!87118)))

(assert (=> d!53625 (= (getValueByKey!191 lt!87119 (_1!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53625 (= lt!87118 (lemmaContainsTupThenGetReturnValue!102 lt!87119 (_1!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53625 (= lt!87119 (insertStrictlySorted!105 (toList!1094 lt!87019) (_1!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53625 (= (+!252 lt!87019 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) lt!87120)))

(declare-fun b!176000 () Bool)

(declare-fun res!83408 () Bool)

(assert (=> b!176000 (=> (not res!83408) (not e!116136))))

(assert (=> b!176000 (= res!83408 (= (getValueByKey!191 (toList!1094 lt!87120) (_1!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))))))))

(declare-fun b!176001 () Bool)

(assert (=> b!176001 (= e!116136 (contains!1167 (toList!1094 lt!87120) (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))))))

(assert (= (and d!53625 res!83409) b!176000))

(assert (= (and b!176000 res!83408) b!176001))

(declare-fun m!204951 () Bool)

(assert (=> d!53625 m!204951))

(declare-fun m!204953 () Bool)

(assert (=> d!53625 m!204953))

(declare-fun m!204955 () Bool)

(assert (=> d!53625 m!204955))

(declare-fun m!204957 () Bool)

(assert (=> d!53625 m!204957))

(declare-fun m!204959 () Bool)

(assert (=> b!176000 m!204959))

(declare-fun m!204961 () Bool)

(assert (=> b!176001 m!204961))

(assert (=> b!175776 d!53625))

(declare-fun d!53627 () Bool)

(assert (=> d!53627 (= (apply!135 lt!87015 lt!87021) (get!1999 (getValueByKey!191 (toList!1094 lt!87015) lt!87021)))))

(declare-fun bs!7271 () Bool)

(assert (= bs!7271 d!53627))

(declare-fun m!204963 () Bool)

(assert (=> bs!7271 m!204963))

(assert (=> bs!7271 m!204963))

(declare-fun m!204965 () Bool)

(assert (=> bs!7271 m!204965))

(assert (=> b!175776 d!53627))

(declare-fun d!53629 () Bool)

(assert (=> d!53629 (contains!1165 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) lt!87020)))

(declare-fun lt!87123 () Unit!5389)

(declare-fun choose!949 (ListLongMap!2157 (_ BitVec 64) V!5129 (_ BitVec 64)) Unit!5389)

(assert (=> d!53629 (= lt!87123 (choose!949 lt!87008 lt!87022 (zeroValue!3463 thiss!1248) lt!87020))))

(assert (=> d!53629 (contains!1165 lt!87008 lt!87020)))

(assert (=> d!53629 (= (addStillContains!111 lt!87008 lt!87022 (zeroValue!3463 thiss!1248) lt!87020) lt!87123)))

(declare-fun bs!7272 () Bool)

(assert (= bs!7272 d!53629))

(assert (=> bs!7272 m!204761))

(assert (=> bs!7272 m!204761))

(assert (=> bs!7272 m!204767))

(declare-fun m!204967 () Bool)

(assert (=> bs!7272 m!204967))

(declare-fun m!204969 () Bool)

(assert (=> bs!7272 m!204969))

(assert (=> b!175776 d!53629))

(declare-fun d!53631 () Bool)

(assert (=> d!53631 (= (apply!135 (+!252 lt!87015 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) lt!87021) (apply!135 lt!87015 lt!87021))))

(declare-fun lt!87124 () Unit!5389)

(assert (=> d!53631 (= lt!87124 (choose!948 lt!87015 lt!87002 (minValue!3463 thiss!1248) lt!87021))))

(declare-fun e!116137 () Bool)

(assert (=> d!53631 e!116137))

(declare-fun res!83410 () Bool)

(assert (=> d!53631 (=> (not res!83410) (not e!116137))))

(assert (=> d!53631 (= res!83410 (contains!1165 lt!87015 lt!87021))))

(assert (=> d!53631 (= (addApplyDifferent!111 lt!87015 lt!87002 (minValue!3463 thiss!1248) lt!87021) lt!87124)))

(declare-fun b!176003 () Bool)

(assert (=> b!176003 (= e!116137 (not (= lt!87021 lt!87002)))))

(assert (= (and d!53631 res!83410) b!176003))

(declare-fun m!204971 () Bool)

(assert (=> d!53631 m!204971))

(assert (=> d!53631 m!204779))

(assert (=> d!53631 m!204771))

(declare-fun m!204973 () Bool)

(assert (=> d!53631 m!204973))

(assert (=> d!53631 m!204779))

(assert (=> d!53631 m!204791))

(assert (=> b!175776 d!53631))

(declare-fun d!53633 () Bool)

(assert (=> d!53633 (= (apply!135 (+!252 lt!87019 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) lt!87005) (apply!135 lt!87019 lt!87005))))

(declare-fun lt!87125 () Unit!5389)

(assert (=> d!53633 (= lt!87125 (choose!948 lt!87019 lt!87009 (zeroValue!3463 thiss!1248) lt!87005))))

(declare-fun e!116138 () Bool)

(assert (=> d!53633 e!116138))

(declare-fun res!83411 () Bool)

(assert (=> d!53633 (=> (not res!83411) (not e!116138))))

(assert (=> d!53633 (= res!83411 (contains!1165 lt!87019 lt!87005))))

(assert (=> d!53633 (= (addApplyDifferent!111 lt!87019 lt!87009 (zeroValue!3463 thiss!1248) lt!87005) lt!87125)))

(declare-fun b!176004 () Bool)

(assert (=> b!176004 (= e!116138 (not (= lt!87005 lt!87009)))))

(assert (= (and d!53633 res!83411) b!176004))

(declare-fun m!204975 () Bool)

(assert (=> d!53633 m!204975))

(assert (=> d!53633 m!204775))

(assert (=> d!53633 m!204769))

(declare-fun m!204977 () Bool)

(assert (=> d!53633 m!204977))

(assert (=> d!53633 m!204775))

(assert (=> d!53633 m!204785))

(assert (=> b!175776 d!53633))

(declare-fun d!53635 () Bool)

(declare-fun e!116139 () Bool)

(assert (=> d!53635 e!116139))

(declare-fun res!83413 () Bool)

(assert (=> d!53635 (=> (not res!83413) (not e!116139))))

(declare-fun lt!87129 () ListLongMap!2157)

(assert (=> d!53635 (= res!83413 (contains!1165 lt!87129 (_1!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))))))

(declare-fun lt!87128 () List!2204)

(assert (=> d!53635 (= lt!87129 (ListLongMap!2158 lt!87128))))

(declare-fun lt!87126 () Unit!5389)

(declare-fun lt!87127 () Unit!5389)

(assert (=> d!53635 (= lt!87126 lt!87127)))

(assert (=> d!53635 (= (getValueByKey!191 lt!87128 (_1!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))))))

(assert (=> d!53635 (= lt!87127 (lemmaContainsTupThenGetReturnValue!102 lt!87128 (_1!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))))))

(assert (=> d!53635 (= lt!87128 (insertStrictlySorted!105 (toList!1094 lt!87015) (_1!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))))))

(assert (=> d!53635 (= (+!252 lt!87015 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) lt!87129)))

(declare-fun b!176005 () Bool)

(declare-fun res!83412 () Bool)

(assert (=> b!176005 (=> (not res!83412) (not e!116139))))

(assert (=> b!176005 (= res!83412 (= (getValueByKey!191 (toList!1094 lt!87129) (_1!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))))))))

(declare-fun b!176006 () Bool)

(assert (=> b!176006 (= e!116139 (contains!1167 (toList!1094 lt!87129) (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))))))

(assert (= (and d!53635 res!83413) b!176005))

(assert (= (and b!176005 res!83412) b!176006))

(declare-fun m!204979 () Bool)

(assert (=> d!53635 m!204979))

(declare-fun m!204981 () Bool)

(assert (=> d!53635 m!204981))

(declare-fun m!204983 () Bool)

(assert (=> d!53635 m!204983))

(declare-fun m!204985 () Bool)

(assert (=> d!53635 m!204985))

(declare-fun m!204987 () Bool)

(assert (=> b!176005 m!204987))

(declare-fun m!204989 () Bool)

(assert (=> b!176006 m!204989))

(assert (=> b!175776 d!53635))

(declare-fun d!53637 () Bool)

(declare-fun e!116140 () Bool)

(assert (=> d!53637 e!116140))

(declare-fun res!83415 () Bool)

(assert (=> d!53637 (=> (not res!83415) (not e!116140))))

(declare-fun lt!87133 () ListLongMap!2157)

(assert (=> d!53637 (= res!83415 (contains!1165 lt!87133 (_1!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))))))

(declare-fun lt!87132 () List!2204)

(assert (=> d!53637 (= lt!87133 (ListLongMap!2158 lt!87132))))

(declare-fun lt!87130 () Unit!5389)

(declare-fun lt!87131 () Unit!5389)

(assert (=> d!53637 (= lt!87130 lt!87131)))

(assert (=> d!53637 (= (getValueByKey!191 lt!87132 (_1!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))))))

(assert (=> d!53637 (= lt!87131 (lemmaContainsTupThenGetReturnValue!102 lt!87132 (_1!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))))))

(assert (=> d!53637 (= lt!87132 (insertStrictlySorted!105 (toList!1094 lt!87003) (_1!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))))))

(assert (=> d!53637 (= (+!252 lt!87003 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))) lt!87133)))

(declare-fun b!176007 () Bool)

(declare-fun res!83414 () Bool)

(assert (=> b!176007 (=> (not res!83414) (not e!116140))))

(assert (=> b!176007 (= res!83414 (= (getValueByKey!191 (toList!1094 lt!87133) (_1!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))))))))

(declare-fun b!176008 () Bool)

(assert (=> b!176008 (= e!116140 (contains!1167 (toList!1094 lt!87133) (tuple2!3225 lt!87007 (minValue!3463 thiss!1248))))))

(assert (= (and d!53637 res!83415) b!176007))

(assert (= (and b!176007 res!83414) b!176008))

(declare-fun m!204991 () Bool)

(assert (=> d!53637 m!204991))

(declare-fun m!204993 () Bool)

(assert (=> d!53637 m!204993))

(declare-fun m!204995 () Bool)

(assert (=> d!53637 m!204995))

(declare-fun m!204997 () Bool)

(assert (=> d!53637 m!204997))

(declare-fun m!204999 () Bool)

(assert (=> b!176007 m!204999))

(declare-fun m!205001 () Bool)

(assert (=> b!176008 m!205001))

(assert (=> b!175776 d!53637))

(declare-fun d!53639 () Bool)

(declare-fun e!116141 () Bool)

(assert (=> d!53639 e!116141))

(declare-fun res!83416 () Bool)

(assert (=> d!53639 (=> res!83416 e!116141)))

(declare-fun lt!87136 () Bool)

(assert (=> d!53639 (= res!83416 (not lt!87136))))

(declare-fun lt!87134 () Bool)

(assert (=> d!53639 (= lt!87136 lt!87134)))

(declare-fun lt!87137 () Unit!5389)

(declare-fun e!116142 () Unit!5389)

(assert (=> d!53639 (= lt!87137 e!116142)))

(declare-fun c!31555 () Bool)

(assert (=> d!53639 (= c!31555 lt!87134)))

(assert (=> d!53639 (= lt!87134 (containsKey!194 (toList!1094 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) lt!87020))))

(assert (=> d!53639 (= (contains!1165 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) lt!87020) lt!87136)))

(declare-fun b!176009 () Bool)

(declare-fun lt!87135 () Unit!5389)

(assert (=> b!176009 (= e!116142 lt!87135)))

(assert (=> b!176009 (= lt!87135 (lemmaContainsKeyImpliesGetValueByKeyDefined!142 (toList!1094 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) lt!87020))))

(assert (=> b!176009 (isDefined!143 (getValueByKey!191 (toList!1094 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) lt!87020))))

(declare-fun b!176010 () Bool)

(declare-fun Unit!5396 () Unit!5389)

(assert (=> b!176010 (= e!116142 Unit!5396)))

(declare-fun b!176011 () Bool)

(assert (=> b!176011 (= e!116141 (isDefined!143 (getValueByKey!191 (toList!1094 (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) lt!87020)))))

(assert (= (and d!53639 c!31555) b!176009))

(assert (= (and d!53639 (not c!31555)) b!176010))

(assert (= (and d!53639 (not res!83416)) b!176011))

(declare-fun m!205003 () Bool)

(assert (=> d!53639 m!205003))

(declare-fun m!205005 () Bool)

(assert (=> b!176009 m!205005))

(declare-fun m!205007 () Bool)

(assert (=> b!176009 m!205007))

(assert (=> b!176009 m!205007))

(declare-fun m!205009 () Bool)

(assert (=> b!176009 m!205009))

(assert (=> b!176011 m!205007))

(assert (=> b!176011 m!205007))

(assert (=> b!176011 m!205009))

(assert (=> b!175776 d!53639))

(declare-fun d!53641 () Bool)

(assert (=> d!53641 (= (apply!135 lt!87003 lt!87014) (get!1999 (getValueByKey!191 (toList!1094 lt!87003) lt!87014)))))

(declare-fun bs!7273 () Bool)

(assert (= bs!7273 d!53641))

(declare-fun m!205011 () Bool)

(assert (=> bs!7273 m!205011))

(assert (=> bs!7273 m!205011))

(declare-fun m!205013 () Bool)

(assert (=> bs!7273 m!205013))

(assert (=> b!175776 d!53641))

(declare-fun d!53643 () Bool)

(assert (=> d!53643 (= (apply!135 (+!252 lt!87015 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248))) lt!87021) (get!1999 (getValueByKey!191 (toList!1094 (+!252 lt!87015 (tuple2!3225 lt!87002 (minValue!3463 thiss!1248)))) lt!87021)))))

(declare-fun bs!7274 () Bool)

(assert (= bs!7274 d!53643))

(declare-fun m!205015 () Bool)

(assert (=> bs!7274 m!205015))

(assert (=> bs!7274 m!205015))

(declare-fun m!205017 () Bool)

(assert (=> bs!7274 m!205017))

(assert (=> b!175776 d!53643))

(declare-fun d!53645 () Bool)

(declare-fun e!116143 () Bool)

(assert (=> d!53645 e!116143))

(declare-fun res!83418 () Bool)

(assert (=> d!53645 (=> (not res!83418) (not e!116143))))

(declare-fun lt!87141 () ListLongMap!2157)

(assert (=> d!53645 (= res!83418 (contains!1165 lt!87141 (_1!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))))))

(declare-fun lt!87140 () List!2204)

(assert (=> d!53645 (= lt!87141 (ListLongMap!2158 lt!87140))))

(declare-fun lt!87138 () Unit!5389)

(declare-fun lt!87139 () Unit!5389)

(assert (=> d!53645 (= lt!87138 lt!87139)))

(assert (=> d!53645 (= (getValueByKey!191 lt!87140 (_1!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53645 (= lt!87139 (lemmaContainsTupThenGetReturnValue!102 lt!87140 (_1!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53645 (= lt!87140 (insertStrictlySorted!105 (toList!1094 lt!87008) (_1!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) (_2!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))))))

(assert (=> d!53645 (= (+!252 lt!87008 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))) lt!87141)))

(declare-fun b!176012 () Bool)

(declare-fun res!83417 () Bool)

(assert (=> b!176012 (=> (not res!83417) (not e!116143))))

(assert (=> b!176012 (= res!83417 (= (getValueByKey!191 (toList!1094 lt!87141) (_1!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248)))) (Some!196 (_2!1623 (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))))))))

(declare-fun b!176013 () Bool)

(assert (=> b!176013 (= e!116143 (contains!1167 (toList!1094 lt!87141) (tuple2!3225 lt!87022 (zeroValue!3463 thiss!1248))))))

(assert (= (and d!53645 res!83418) b!176012))

(assert (= (and b!176012 res!83417) b!176013))

(declare-fun m!205019 () Bool)

(assert (=> d!53645 m!205019))

(declare-fun m!205021 () Bool)

(assert (=> d!53645 m!205021))

(declare-fun m!205023 () Bool)

(assert (=> d!53645 m!205023))

(declare-fun m!205025 () Bool)

(assert (=> d!53645 m!205025))

(declare-fun m!205027 () Bool)

(assert (=> b!176012 m!205027))

(declare-fun m!205029 () Bool)

(assert (=> b!176013 m!205029))

(assert (=> b!175776 d!53645))

(declare-fun d!53647 () Bool)

(assert (=> d!53647 (= (apply!135 (+!252 lt!87019 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248))) lt!87005) (get!1999 (getValueByKey!191 (toList!1094 (+!252 lt!87019 (tuple2!3225 lt!87009 (zeroValue!3463 thiss!1248)))) lt!87005)))))

(declare-fun bs!7275 () Bool)

(assert (= bs!7275 d!53647))

(declare-fun m!205031 () Bool)

(assert (=> bs!7275 m!205031))

(assert (=> bs!7275 m!205031))

(declare-fun m!205033 () Bool)

(assert (=> bs!7275 m!205033))

(assert (=> b!175776 d!53647))

(assert (=> d!53569 d!53571))

(declare-fun d!53649 () Bool)

(assert (=> d!53649 (= (apply!135 lt!87004 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1999 (getValueByKey!191 (toList!1094 lt!87004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7276 () Bool)

(assert (= bs!7276 d!53649))

(assert (=> bs!7276 m!204861))

(assert (=> bs!7276 m!204861))

(declare-fun m!205035 () Bool)

(assert (=> bs!7276 m!205035))

(assert (=> b!175770 d!53649))

(assert (=> b!175719 d!53587))

(assert (=> b!175719 d!53589))

(declare-fun mapNonEmpty!7022 () Bool)

(declare-fun mapRes!7022 () Bool)

(declare-fun tp!15716 () Bool)

(declare-fun e!116145 () Bool)

(assert (=> mapNonEmpty!7022 (= mapRes!7022 (and tp!15716 e!116145))))

(declare-fun mapKey!7022 () (_ BitVec 32))

(declare-fun mapValue!7022 () ValueCell!1712)

(declare-fun mapRest!7022 () (Array (_ BitVec 32) ValueCell!1712))

(assert (=> mapNonEmpty!7022 (= mapRest!7021 (store mapRest!7022 mapKey!7022 mapValue!7022))))

(declare-fun mapIsEmpty!7022 () Bool)

(assert (=> mapIsEmpty!7022 mapRes!7022))

(declare-fun b!176014 () Bool)

(assert (=> b!176014 (= e!116145 tp_is_empty!4111)))

(declare-fun condMapEmpty!7022 () Bool)

(declare-fun mapDefault!7022 () ValueCell!1712)

(assert (=> mapNonEmpty!7021 (= condMapEmpty!7022 (= mapRest!7021 ((as const (Array (_ BitVec 32) ValueCell!1712)) mapDefault!7022)))))

(declare-fun e!116144 () Bool)

(assert (=> mapNonEmpty!7021 (= tp!15715 (and e!116144 mapRes!7022))))

(declare-fun b!176015 () Bool)

(assert (=> b!176015 (= e!116144 tp_is_empty!4111)))

(assert (= (and mapNonEmpty!7021 condMapEmpty!7022) mapIsEmpty!7022))

(assert (= (and mapNonEmpty!7021 (not condMapEmpty!7022)) mapNonEmpty!7022))

(assert (= (and mapNonEmpty!7022 ((_ is ValueCellFull!1712) mapValue!7022)) b!176014))

(assert (= (and mapNonEmpty!7021 ((_ is ValueCellFull!1712) mapDefault!7022)) b!176015))

(declare-fun m!205037 () Bool)

(assert (=> mapNonEmpty!7022 m!205037))

(declare-fun b_lambda!7045 () Bool)

(assert (= b_lambda!7043 (or (and b!175655 b_free!4339) b_lambda!7045)))

(declare-fun b_lambda!7047 () Bool)

(assert (= b_lambda!7041 (or (and b!175655 b_free!4339) b_lambda!7047)))

(check-sat (not b!176007) (not b!175979) (not b!176013) (not b!176012) (not b!175995) (not bm!17797) (not d!53585) (not b!175914) (not d!53629) (not b!175930) (not d!53643) (not b!175989) (not b!176005) (not d!53587) (not d!53621) (not b!175870) (not b!175857) (not d!53591) (not b!175859) (not b!175978) (not d!53623) (not d!53625) (not b_lambda!7047) (not b!175884) (not b!176000) (not d!53605) (not d!53631) (not b!175841) (not b!175846) (not b!175827) (not d!53611) (not b!175942) (not d!53577) (not b!175985) (not d!53595) (not b!175994) (not bm!17794) (not b_next!4339) (not b!175828) (not d!53613) (not b!175982) (not b!175943) (not d!53647) (not bm!17791) (not d!53579) (not b!175950) (not bm!17788) (not d!53639) (not b!175883) tp_is_empty!4111 (not d!53583) (not b!175839) (not b!175976) (not d!53637) (not b!176011) (not b!175840) (not b!175987) (not d!53603) (not b!175984) (not b!176008) (not d!53649) b_and!10845 (not d!53615) (not b!175904) (not b!175822) (not d!53627) (not b_lambda!7039) (not b!176001) (not d!53641) (not d!53599) (not b!175913) (not b!176009) (not d!53619) (not b!175861) (not b!176006) (not b!175980) (not d!53645) (not b!175983) (not mapNonEmpty!7022) (not d!53635) (not d!53633) (not b_lambda!7045) (not b!175820))
(check-sat b_and!10845 (not b_next!4339))
