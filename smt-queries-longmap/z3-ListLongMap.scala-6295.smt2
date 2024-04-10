; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80478 () Bool)

(assert start!80478)

(declare-fun b!945265 () Bool)

(declare-fun b_free!18093 () Bool)

(declare-fun b_next!18093 () Bool)

(assert (=> b!945265 (= b_free!18093 (not b_next!18093))))

(declare-fun tp!62793 () Bool)

(declare-fun b_and!29513 () Bool)

(assert (=> b!945265 (= tp!62793 b_and!29513)))

(declare-datatypes ((V!32433 0))(
  ( (V!32434 (val!10351 Int)) )
))
(declare-datatypes ((ValueCell!9819 0))(
  ( (ValueCellFull!9819 (v!12884 V!32433)) (EmptyCell!9819) )
))
(declare-datatypes ((array!57172 0))(
  ( (array!57173 (arr!27510 (Array (_ BitVec 32) ValueCell!9819)) (size!27977 (_ BitVec 32))) )
))
(declare-datatypes ((array!57174 0))(
  ( (array!57175 (arr!27511 (Array (_ BitVec 32) (_ BitVec 64))) (size!27978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4788 0))(
  ( (LongMapFixedSize!4789 (defaultEntry!5690 Int) (mask!27355 (_ BitVec 32)) (extraKeys!5422 (_ BitVec 32)) (zeroValue!5526 V!32433) (minValue!5526 V!32433) (_size!2449 (_ BitVec 32)) (_keys!10569 array!57174) (_values!5713 array!57172) (_vacant!2449 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4788)

(declare-fun e!531641 () Bool)

(declare-fun e!531642 () Bool)

(declare-fun tp_is_empty!20601 () Bool)

(declare-fun array_inv!21372 (array!57174) Bool)

(declare-fun array_inv!21373 (array!57172) Bool)

(assert (=> b!945265 (= e!531642 (and tp!62793 tp_is_empty!20601 (array_inv!21372 (_keys!10569 thiss!1141)) (array_inv!21373 (_values!5713 thiss!1141)) e!531641))))

(declare-fun b!945266 () Bool)

(declare-fun e!531645 () Bool)

(assert (=> b!945266 (= e!531645 tp_is_empty!20601)))

(declare-fun res!634911 () Bool)

(declare-fun e!531643 () Bool)

(assert (=> start!80478 (=> (not res!634911) (not e!531643))))

(declare-fun valid!1830 (LongMapFixedSize!4788) Bool)

(assert (=> start!80478 (= res!634911 (valid!1830 thiss!1141))))

(assert (=> start!80478 e!531643))

(assert (=> start!80478 e!531642))

(assert (=> start!80478 true))

(declare-fun mapNonEmpty!32731 () Bool)

(declare-fun mapRes!32731 () Bool)

(declare-fun tp!62792 () Bool)

(assert (=> mapNonEmpty!32731 (= mapRes!32731 (and tp!62792 e!531645))))

(declare-fun mapValue!32731 () ValueCell!9819)

(declare-fun mapRest!32731 () (Array (_ BitVec 32) ValueCell!9819))

(declare-fun mapKey!32731 () (_ BitVec 32))

(assert (=> mapNonEmpty!32731 (= (arr!27510 (_values!5713 thiss!1141)) (store mapRest!32731 mapKey!32731 mapValue!32731))))

(declare-fun b!945267 () Bool)

(declare-fun res!634910 () Bool)

(assert (=> b!945267 (=> (not res!634910) (not e!531643))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945267 (= res!634910 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!32731 () Bool)

(assert (=> mapIsEmpty!32731 mapRes!32731))

(declare-fun b!945268 () Bool)

(declare-fun e!531644 () Bool)

(assert (=> b!945268 (= e!531644 tp_is_empty!20601)))

(declare-fun b!945269 () Bool)

(declare-datatypes ((tuple2!13508 0))(
  ( (tuple2!13509 (_1!6765 (_ BitVec 64)) (_2!6765 V!32433)) )
))
(declare-datatypes ((List!19289 0))(
  ( (Nil!19286) (Cons!19285 (h!20436 tuple2!13508) (t!27608 List!19289)) )
))
(declare-datatypes ((ListLongMap!12205 0))(
  ( (ListLongMap!12206 (toList!6118 List!19289)) )
))
(declare-fun contains!5191 (ListLongMap!12205 (_ BitVec 64)) Bool)

(declare-fun map!13033 (LongMapFixedSize!4788) ListLongMap!12205)

(assert (=> b!945269 (= e!531643 (not (= (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (contains!5191 (map!13033 thiss!1141) key!756))))))

(declare-fun b!945270 () Bool)

(assert (=> b!945270 (= e!531641 (and e!531644 mapRes!32731))))

(declare-fun condMapEmpty!32731 () Bool)

(declare-fun mapDefault!32731 () ValueCell!9819)

(assert (=> b!945270 (= condMapEmpty!32731 (= (arr!27510 (_values!5713 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9819)) mapDefault!32731)))))

(assert (= (and start!80478 res!634911) b!945267))

(assert (= (and b!945267 res!634910) b!945269))

(assert (= (and b!945270 condMapEmpty!32731) mapIsEmpty!32731))

(assert (= (and b!945270 (not condMapEmpty!32731)) mapNonEmpty!32731))

(get-info :version)

(assert (= (and mapNonEmpty!32731 ((_ is ValueCellFull!9819) mapValue!32731)) b!945266))

(assert (= (and b!945270 ((_ is ValueCellFull!9819) mapDefault!32731)) b!945268))

(assert (= b!945265 b!945270))

(assert (= start!80478 b!945265))

(declare-fun m!879135 () Bool)

(assert (=> b!945265 m!879135))

(declare-fun m!879137 () Bool)

(assert (=> b!945265 m!879137))

(declare-fun m!879139 () Bool)

(assert (=> start!80478 m!879139))

(declare-fun m!879141 () Bool)

(assert (=> mapNonEmpty!32731 m!879141))

(declare-fun m!879143 () Bool)

(assert (=> b!945269 m!879143))

(assert (=> b!945269 m!879143))

(declare-fun m!879145 () Bool)

(assert (=> b!945269 m!879145))

(check-sat tp_is_empty!20601 b_and!29513 (not start!80478) (not b!945269) (not mapNonEmpty!32731) (not b!945265) (not b_next!18093))
(check-sat b_and!29513 (not b_next!18093))
(get-model)

(declare-fun d!114375 () Bool)

(assert (=> d!114375 (= (array_inv!21372 (_keys!10569 thiss!1141)) (bvsge (size!27978 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945265 d!114375))

(declare-fun d!114377 () Bool)

(assert (=> d!114377 (= (array_inv!21373 (_values!5713 thiss!1141)) (bvsge (size!27977 (_values!5713 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945265 d!114377))

(declare-fun d!114379 () Bool)

(declare-fun e!531668 () Bool)

(assert (=> d!114379 e!531668))

(declare-fun res!634920 () Bool)

(assert (=> d!114379 (=> res!634920 e!531668)))

(declare-fun lt!425940 () Bool)

(assert (=> d!114379 (= res!634920 (not lt!425940))))

(declare-fun lt!425941 () Bool)

(assert (=> d!114379 (= lt!425940 lt!425941)))

(declare-datatypes ((Unit!31886 0))(
  ( (Unit!31887) )
))
(declare-fun lt!425942 () Unit!31886)

(declare-fun e!531669 () Unit!31886)

(assert (=> d!114379 (= lt!425942 e!531669)))

(declare-fun c!98384 () Bool)

(assert (=> d!114379 (= c!98384 lt!425941)))

(declare-fun containsKey!454 (List!19289 (_ BitVec 64)) Bool)

(assert (=> d!114379 (= lt!425941 (containsKey!454 (toList!6118 (map!13033 thiss!1141)) key!756))))

(assert (=> d!114379 (= (contains!5191 (map!13033 thiss!1141) key!756) lt!425940)))

(declare-fun b!945295 () Bool)

(declare-fun lt!425943 () Unit!31886)

(assert (=> b!945295 (= e!531669 lt!425943)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!350 (List!19289 (_ BitVec 64)) Unit!31886)

(assert (=> b!945295 (= lt!425943 (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6118 (map!13033 thiss!1141)) key!756))))

(declare-datatypes ((Option!493 0))(
  ( (Some!492 (v!12886 V!32433)) (None!491) )
))
(declare-fun isDefined!359 (Option!493) Bool)

(declare-fun getValueByKey!487 (List!19289 (_ BitVec 64)) Option!493)

(assert (=> b!945295 (isDefined!359 (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756))))

(declare-fun b!945296 () Bool)

(declare-fun Unit!31888 () Unit!31886)

(assert (=> b!945296 (= e!531669 Unit!31888)))

(declare-fun b!945297 () Bool)

(assert (=> b!945297 (= e!531668 (isDefined!359 (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756)))))

(assert (= (and d!114379 c!98384) b!945295))

(assert (= (and d!114379 (not c!98384)) b!945296))

(assert (= (and d!114379 (not res!634920)) b!945297))

(declare-fun m!879159 () Bool)

(assert (=> d!114379 m!879159))

(declare-fun m!879161 () Bool)

(assert (=> b!945295 m!879161))

(declare-fun m!879163 () Bool)

(assert (=> b!945295 m!879163))

(assert (=> b!945295 m!879163))

(declare-fun m!879165 () Bool)

(assert (=> b!945295 m!879165))

(assert (=> b!945297 m!879163))

(assert (=> b!945297 m!879163))

(assert (=> b!945297 m!879165))

(assert (=> b!945269 d!114379))

(declare-fun d!114381 () Bool)

(declare-fun getCurrentListMap!3351 (array!57174 array!57172 (_ BitVec 32) (_ BitVec 32) V!32433 V!32433 (_ BitVec 32) Int) ListLongMap!12205)

(assert (=> d!114381 (= (map!13033 thiss!1141) (getCurrentListMap!3351 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun bs!26575 () Bool)

(assert (= bs!26575 d!114381))

(declare-fun m!879167 () Bool)

(assert (=> bs!26575 m!879167))

(assert (=> b!945269 d!114381))

(declare-fun d!114383 () Bool)

(declare-fun res!634927 () Bool)

(declare-fun e!531672 () Bool)

(assert (=> d!114383 (=> (not res!634927) (not e!531672))))

(declare-fun simpleValid!350 (LongMapFixedSize!4788) Bool)

(assert (=> d!114383 (= res!634927 (simpleValid!350 thiss!1141))))

(assert (=> d!114383 (= (valid!1830 thiss!1141) e!531672)))

(declare-fun b!945304 () Bool)

(declare-fun res!634928 () Bool)

(assert (=> b!945304 (=> (not res!634928) (not e!531672))))

(declare-fun arrayCountValidKeys!0 (array!57174 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945304 (= res!634928 (= (arrayCountValidKeys!0 (_keys!10569 thiss!1141) #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))) (_size!2449 thiss!1141)))))

(declare-fun b!945305 () Bool)

(declare-fun res!634929 () Bool)

(assert (=> b!945305 (=> (not res!634929) (not e!531672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57174 (_ BitVec 32)) Bool)

(assert (=> b!945305 (= res!634929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10569 thiss!1141) (mask!27355 thiss!1141)))))

(declare-fun b!945306 () Bool)

(declare-datatypes ((List!19290 0))(
  ( (Nil!19287) (Cons!19286 (h!20437 (_ BitVec 64)) (t!27609 List!19290)) )
))
(declare-fun arrayNoDuplicates!0 (array!57174 (_ BitVec 32) List!19290) Bool)

(assert (=> b!945306 (= e!531672 (arrayNoDuplicates!0 (_keys!10569 thiss!1141) #b00000000000000000000000000000000 Nil!19287))))

(assert (= (and d!114383 res!634927) b!945304))

(assert (= (and b!945304 res!634928) b!945305))

(assert (= (and b!945305 res!634929) b!945306))

(declare-fun m!879169 () Bool)

(assert (=> d!114383 m!879169))

(declare-fun m!879171 () Bool)

(assert (=> b!945304 m!879171))

(declare-fun m!879173 () Bool)

(assert (=> b!945305 m!879173))

(declare-fun m!879175 () Bool)

(assert (=> b!945306 m!879175))

(assert (=> start!80478 d!114383))

(declare-fun b!945313 () Bool)

(declare-fun e!531678 () Bool)

(assert (=> b!945313 (= e!531678 tp_is_empty!20601)))

(declare-fun b!945314 () Bool)

(declare-fun e!531677 () Bool)

(assert (=> b!945314 (= e!531677 tp_is_empty!20601)))

(declare-fun mapIsEmpty!32737 () Bool)

(declare-fun mapRes!32737 () Bool)

(assert (=> mapIsEmpty!32737 mapRes!32737))

(declare-fun condMapEmpty!32737 () Bool)

(declare-fun mapDefault!32737 () ValueCell!9819)

(assert (=> mapNonEmpty!32731 (= condMapEmpty!32737 (= mapRest!32731 ((as const (Array (_ BitVec 32) ValueCell!9819)) mapDefault!32737)))))

(assert (=> mapNonEmpty!32731 (= tp!62792 (and e!531677 mapRes!32737))))

(declare-fun mapNonEmpty!32737 () Bool)

(declare-fun tp!62802 () Bool)

(assert (=> mapNonEmpty!32737 (= mapRes!32737 (and tp!62802 e!531678))))

(declare-fun mapRest!32737 () (Array (_ BitVec 32) ValueCell!9819))

(declare-fun mapKey!32737 () (_ BitVec 32))

(declare-fun mapValue!32737 () ValueCell!9819)

(assert (=> mapNonEmpty!32737 (= mapRest!32731 (store mapRest!32737 mapKey!32737 mapValue!32737))))

(assert (= (and mapNonEmpty!32731 condMapEmpty!32737) mapIsEmpty!32737))

(assert (= (and mapNonEmpty!32731 (not condMapEmpty!32737)) mapNonEmpty!32737))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9819) mapValue!32737)) b!945313))

(assert (= (and mapNonEmpty!32731 ((_ is ValueCellFull!9819) mapDefault!32737)) b!945314))

(declare-fun m!879177 () Bool)

(assert (=> mapNonEmpty!32737 m!879177))

(check-sat (not b_next!18093) (not b!945295) b_and!29513 (not b!945304) (not mapNonEmpty!32737) (not b!945306) (not d!114381) (not b!945297) tp_is_empty!20601 (not b!945305) (not d!114379) (not d!114383))
(check-sat b_and!29513 (not b_next!18093))
(get-model)

(declare-fun bm!41028 () Bool)

(declare-fun call!41031 () (_ BitVec 32))

(assert (=> bm!41028 (= call!41031 (arrayCountValidKeys!0 (_keys!10569 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27978 (_keys!10569 thiss!1141))))))

(declare-fun b!945323 () Bool)

(declare-fun e!531683 () (_ BitVec 32))

(assert (=> b!945323 (= e!531683 (bvadd #b00000000000000000000000000000001 call!41031))))

(declare-fun b!945324 () Bool)

(declare-fun e!531684 () (_ BitVec 32))

(assert (=> b!945324 (= e!531684 e!531683)))

(declare-fun c!98389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945324 (= c!98389 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114385 () Bool)

(declare-fun lt!425946 () (_ BitVec 32))

(assert (=> d!114385 (and (bvsge lt!425946 #b00000000000000000000000000000000) (bvsle lt!425946 (bvsub (size!27978 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114385 (= lt!425946 e!531684)))

(declare-fun c!98390 () Bool)

(assert (=> d!114385 (= c!98390 (bvsge #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(assert (=> d!114385 (and (bvsle #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27978 (_keys!10569 thiss!1141)) (size!27978 (_keys!10569 thiss!1141))))))

(assert (=> d!114385 (= (arrayCountValidKeys!0 (_keys!10569 thiss!1141) #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))) lt!425946)))

(declare-fun b!945325 () Bool)

(assert (=> b!945325 (= e!531684 #b00000000000000000000000000000000)))

(declare-fun b!945326 () Bool)

(assert (=> b!945326 (= e!531683 call!41031)))

(assert (= (and d!114385 c!98390) b!945325))

(assert (= (and d!114385 (not c!98390)) b!945324))

(assert (= (and b!945324 c!98389) b!945323))

(assert (= (and b!945324 (not c!98389)) b!945326))

(assert (= (or b!945323 b!945326) bm!41028))

(declare-fun m!879179 () Bool)

(assert (=> bm!41028 m!879179))

(declare-fun m!879181 () Bool)

(assert (=> b!945324 m!879181))

(assert (=> b!945324 m!879181))

(declare-fun m!879183 () Bool)

(assert (=> b!945324 m!879183))

(assert (=> b!945304 d!114385))

(declare-fun d!114387 () Bool)

(assert (=> d!114387 (isDefined!359 (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756))))

(declare-fun lt!425949 () Unit!31886)

(declare-fun choose!1570 (List!19289 (_ BitVec 64)) Unit!31886)

(assert (=> d!114387 (= lt!425949 (choose!1570 (toList!6118 (map!13033 thiss!1141)) key!756))))

(declare-fun e!531687 () Bool)

(assert (=> d!114387 e!531687))

(declare-fun res!634932 () Bool)

(assert (=> d!114387 (=> (not res!634932) (not e!531687))))

(declare-fun isStrictlySorted!507 (List!19289) Bool)

(assert (=> d!114387 (= res!634932 (isStrictlySorted!507 (toList!6118 (map!13033 thiss!1141))))))

(assert (=> d!114387 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6118 (map!13033 thiss!1141)) key!756) lt!425949)))

(declare-fun b!945329 () Bool)

(assert (=> b!945329 (= e!531687 (containsKey!454 (toList!6118 (map!13033 thiss!1141)) key!756))))

(assert (= (and d!114387 res!634932) b!945329))

(assert (=> d!114387 m!879163))

(assert (=> d!114387 m!879163))

(assert (=> d!114387 m!879165))

(declare-fun m!879185 () Bool)

(assert (=> d!114387 m!879185))

(declare-fun m!879187 () Bool)

(assert (=> d!114387 m!879187))

(assert (=> b!945329 m!879159))

(assert (=> b!945295 d!114387))

(declare-fun d!114389 () Bool)

(declare-fun isEmpty!703 (Option!493) Bool)

(assert (=> d!114389 (= (isDefined!359 (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756)) (not (isEmpty!703 (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756))))))

(declare-fun bs!26576 () Bool)

(assert (= bs!26576 d!114389))

(assert (=> bs!26576 m!879163))

(declare-fun m!879189 () Bool)

(assert (=> bs!26576 m!879189))

(assert (=> b!945295 d!114389))

(declare-fun b!945338 () Bool)

(declare-fun e!531692 () Option!493)

(assert (=> b!945338 (= e!531692 (Some!492 (_2!6765 (h!20436 (toList!6118 (map!13033 thiss!1141))))))))

(declare-fun b!945340 () Bool)

(declare-fun e!531693 () Option!493)

(assert (=> b!945340 (= e!531693 (getValueByKey!487 (t!27608 (toList!6118 (map!13033 thiss!1141))) key!756))))

(declare-fun b!945339 () Bool)

(assert (=> b!945339 (= e!531692 e!531693)))

(declare-fun c!98396 () Bool)

(assert (=> b!945339 (= c!98396 (and ((_ is Cons!19285) (toList!6118 (map!13033 thiss!1141))) (not (= (_1!6765 (h!20436 (toList!6118 (map!13033 thiss!1141)))) key!756))))))

(declare-fun d!114391 () Bool)

(declare-fun c!98395 () Bool)

(assert (=> d!114391 (= c!98395 (and ((_ is Cons!19285) (toList!6118 (map!13033 thiss!1141))) (= (_1!6765 (h!20436 (toList!6118 (map!13033 thiss!1141)))) key!756)))))

(assert (=> d!114391 (= (getValueByKey!487 (toList!6118 (map!13033 thiss!1141)) key!756) e!531692)))

(declare-fun b!945341 () Bool)

(assert (=> b!945341 (= e!531693 None!491)))

(assert (= (and d!114391 c!98395) b!945338))

(assert (= (and d!114391 (not c!98395)) b!945339))

(assert (= (and b!945339 c!98396) b!945340))

(assert (= (and b!945339 (not c!98396)) b!945341))

(declare-fun m!879191 () Bool)

(assert (=> b!945340 m!879191))

(assert (=> b!945295 d!114391))

(declare-fun bm!41031 () Bool)

(declare-fun call!41034 () Bool)

(assert (=> bm!41031 (= call!41034 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10569 thiss!1141) (mask!27355 thiss!1141)))))

(declare-fun b!945351 () Bool)

(declare-fun e!531702 () Bool)

(assert (=> b!945351 (= e!531702 call!41034)))

(declare-fun b!945352 () Bool)

(declare-fun e!531701 () Bool)

(assert (=> b!945352 (= e!531701 e!531702)))

(declare-fun lt!425956 () (_ BitVec 64))

(assert (=> b!945352 (= lt!425956 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425957 () Unit!31886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57174 (_ BitVec 64) (_ BitVec 32)) Unit!31886)

(assert (=> b!945352 (= lt!425957 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10569 thiss!1141) lt!425956 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945352 (arrayContainsKey!0 (_keys!10569 thiss!1141) lt!425956 #b00000000000000000000000000000000)))

(declare-fun lt!425958 () Unit!31886)

(assert (=> b!945352 (= lt!425958 lt!425957)))

(declare-fun res!634938 () Bool)

(declare-datatypes ((SeekEntryResult!9084 0))(
  ( (MissingZero!9084 (index!38707 (_ BitVec 32))) (Found!9084 (index!38708 (_ BitVec 32))) (Intermediate!9084 (undefined!9896 Bool) (index!38709 (_ BitVec 32)) (x!81223 (_ BitVec 32))) (Undefined!9084) (MissingVacant!9084 (index!38710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57174 (_ BitVec 32)) SeekEntryResult!9084)

(assert (=> b!945352 (= res!634938 (= (seekEntryOrOpen!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000) (_keys!10569 thiss!1141) (mask!27355 thiss!1141)) (Found!9084 #b00000000000000000000000000000000)))))

(assert (=> b!945352 (=> (not res!634938) (not e!531702))))

(declare-fun b!945353 () Bool)

(declare-fun e!531700 () Bool)

(assert (=> b!945353 (= e!531700 e!531701)))

(declare-fun c!98399 () Bool)

(assert (=> b!945353 (= c!98399 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114393 () Bool)

(declare-fun res!634937 () Bool)

(assert (=> d!114393 (=> res!634937 e!531700)))

(assert (=> d!114393 (= res!634937 (bvsge #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(assert (=> d!114393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10569 thiss!1141) (mask!27355 thiss!1141)) e!531700)))

(declare-fun b!945350 () Bool)

(assert (=> b!945350 (= e!531701 call!41034)))

(assert (= (and d!114393 (not res!634937)) b!945353))

(assert (= (and b!945353 c!98399) b!945352))

(assert (= (and b!945353 (not c!98399)) b!945350))

(assert (= (and b!945352 res!634938) b!945351))

(assert (= (or b!945351 b!945350) bm!41031))

(declare-fun m!879193 () Bool)

(assert (=> bm!41031 m!879193))

(assert (=> b!945352 m!879181))

(declare-fun m!879195 () Bool)

(assert (=> b!945352 m!879195))

(declare-fun m!879197 () Bool)

(assert (=> b!945352 m!879197))

(assert (=> b!945352 m!879181))

(declare-fun m!879199 () Bool)

(assert (=> b!945352 m!879199))

(assert (=> b!945353 m!879181))

(assert (=> b!945353 m!879181))

(assert (=> b!945353 m!879183))

(assert (=> b!945305 d!114393))

(declare-fun b!945364 () Bool)

(declare-fun e!531712 () Bool)

(declare-fun contains!5192 (List!19290 (_ BitVec 64)) Bool)

(assert (=> b!945364 (= e!531712 (contains!5192 Nil!19287 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114395 () Bool)

(declare-fun res!634945 () Bool)

(declare-fun e!531714 () Bool)

(assert (=> d!114395 (=> res!634945 e!531714)))

(assert (=> d!114395 (= res!634945 (bvsge #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(assert (=> d!114395 (= (arrayNoDuplicates!0 (_keys!10569 thiss!1141) #b00000000000000000000000000000000 Nil!19287) e!531714)))

(declare-fun bm!41034 () Bool)

(declare-fun call!41037 () Bool)

(declare-fun c!98402 () Bool)

(assert (=> bm!41034 (= call!41037 (arrayNoDuplicates!0 (_keys!10569 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98402 (Cons!19286 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000) Nil!19287) Nil!19287)))))

(declare-fun b!945365 () Bool)

(declare-fun e!531711 () Bool)

(declare-fun e!531713 () Bool)

(assert (=> b!945365 (= e!531711 e!531713)))

(assert (=> b!945365 (= c!98402 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945366 () Bool)

(assert (=> b!945366 (= e!531713 call!41037)))

(declare-fun b!945367 () Bool)

(assert (=> b!945367 (= e!531714 e!531711)))

(declare-fun res!634946 () Bool)

(assert (=> b!945367 (=> (not res!634946) (not e!531711))))

(assert (=> b!945367 (= res!634946 (not e!531712))))

(declare-fun res!634947 () Bool)

(assert (=> b!945367 (=> (not res!634947) (not e!531712))))

(assert (=> b!945367 (= res!634947 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945368 () Bool)

(assert (=> b!945368 (= e!531713 call!41037)))

(assert (= (and d!114395 (not res!634945)) b!945367))

(assert (= (and b!945367 res!634947) b!945364))

(assert (= (and b!945367 res!634946) b!945365))

(assert (= (and b!945365 c!98402) b!945366))

(assert (= (and b!945365 (not c!98402)) b!945368))

(assert (= (or b!945366 b!945368) bm!41034))

(assert (=> b!945364 m!879181))

(assert (=> b!945364 m!879181))

(declare-fun m!879201 () Bool)

(assert (=> b!945364 m!879201))

(assert (=> bm!41034 m!879181))

(declare-fun m!879203 () Bool)

(assert (=> bm!41034 m!879203))

(assert (=> b!945365 m!879181))

(assert (=> b!945365 m!879181))

(assert (=> b!945365 m!879183))

(assert (=> b!945367 m!879181))

(assert (=> b!945367 m!879181))

(assert (=> b!945367 m!879183))

(assert (=> b!945306 d!114395))

(declare-fun b!945411 () Bool)

(declare-fun e!531741 () Bool)

(declare-fun e!531745 () Bool)

(assert (=> b!945411 (= e!531741 e!531745)))

(declare-fun c!98419 () Bool)

(assert (=> b!945411 (= c!98419 (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41049 () Bool)

(declare-fun call!41057 () ListLongMap!12205)

(declare-fun call!41058 () ListLongMap!12205)

(assert (=> bm!41049 (= call!41057 call!41058)))

(declare-fun b!945412 () Bool)

(declare-fun e!531750 () Bool)

(declare-fun e!531753 () Bool)

(assert (=> b!945412 (= e!531750 e!531753)))

(declare-fun res!634973 () Bool)

(assert (=> b!945412 (=> (not res!634973) (not e!531753))))

(declare-fun lt!426007 () ListLongMap!12205)

(assert (=> b!945412 (= res!634973 (contains!5191 lt!426007 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!945412 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(declare-fun call!41054 () ListLongMap!12205)

(declare-fun call!41052 () ListLongMap!12205)

(declare-fun c!98420 () Bool)

(declare-fun c!98417 () Bool)

(declare-fun bm!41050 () Bool)

(declare-fun call!41056 () ListLongMap!12205)

(declare-fun +!2852 (ListLongMap!12205 tuple2!13508) ListLongMap!12205)

(assert (=> bm!41050 (= call!41058 (+!2852 (ite c!98420 call!41054 (ite c!98417 call!41056 call!41052)) (ite (or c!98420 c!98417) (tuple2!13509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5526 thiss!1141)) (tuple2!13509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5526 thiss!1141)))))))

(declare-fun bm!41051 () Bool)

(declare-fun call!41055 () Bool)

(assert (=> bm!41051 (= call!41055 (contains!5191 lt!426007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945414 () Bool)

(declare-fun e!531751 () Bool)

(assert (=> b!945414 (= e!531751 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945415 () Bool)

(declare-fun e!531749 () ListLongMap!12205)

(declare-fun e!531744 () ListLongMap!12205)

(assert (=> b!945415 (= e!531749 e!531744)))

(assert (=> b!945415 (= c!98417 (and (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!945416 () Bool)

(declare-fun e!531752 () Unit!31886)

(declare-fun lt!426019 () Unit!31886)

(assert (=> b!945416 (= e!531752 lt!426019)))

(declare-fun lt!426024 () ListLongMap!12205)

(declare-fun getCurrentListMapNoExtraKeys!3307 (array!57174 array!57172 (_ BitVec 32) (_ BitVec 32) V!32433 V!32433 (_ BitVec 32) Int) ListLongMap!12205)

(assert (=> b!945416 (= lt!426024 (getCurrentListMapNoExtraKeys!3307 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun lt!426010 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426004 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426004 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426022 () Unit!31886)

(declare-fun addStillContains!571 (ListLongMap!12205 (_ BitVec 64) V!32433 (_ BitVec 64)) Unit!31886)

(assert (=> b!945416 (= lt!426022 (addStillContains!571 lt!426024 lt!426010 (zeroValue!5526 thiss!1141) lt!426004))))

(assert (=> b!945416 (contains!5191 (+!2852 lt!426024 (tuple2!13509 lt!426010 (zeroValue!5526 thiss!1141))) lt!426004)))

(declare-fun lt!426016 () Unit!31886)

(assert (=> b!945416 (= lt!426016 lt!426022)))

(declare-fun lt!426020 () ListLongMap!12205)

(assert (=> b!945416 (= lt!426020 (getCurrentListMapNoExtraKeys!3307 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun lt!426013 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426017 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426017 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426023 () Unit!31886)

(declare-fun addApplyDifferent!451 (ListLongMap!12205 (_ BitVec 64) V!32433 (_ BitVec 64)) Unit!31886)

(assert (=> b!945416 (= lt!426023 (addApplyDifferent!451 lt!426020 lt!426013 (minValue!5526 thiss!1141) lt!426017))))

(declare-fun apply!868 (ListLongMap!12205 (_ BitVec 64)) V!32433)

(assert (=> b!945416 (= (apply!868 (+!2852 lt!426020 (tuple2!13509 lt!426013 (minValue!5526 thiss!1141))) lt!426017) (apply!868 lt!426020 lt!426017))))

(declare-fun lt!426015 () Unit!31886)

(assert (=> b!945416 (= lt!426015 lt!426023)))

(declare-fun lt!426018 () ListLongMap!12205)

(assert (=> b!945416 (= lt!426018 (getCurrentListMapNoExtraKeys!3307 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun lt!426009 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426011 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426011 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426006 () Unit!31886)

(assert (=> b!945416 (= lt!426006 (addApplyDifferent!451 lt!426018 lt!426009 (zeroValue!5526 thiss!1141) lt!426011))))

(assert (=> b!945416 (= (apply!868 (+!2852 lt!426018 (tuple2!13509 lt!426009 (zeroValue!5526 thiss!1141))) lt!426011) (apply!868 lt!426018 lt!426011))))

(declare-fun lt!426021 () Unit!31886)

(assert (=> b!945416 (= lt!426021 lt!426006)))

(declare-fun lt!426003 () ListLongMap!12205)

(assert (=> b!945416 (= lt!426003 (getCurrentListMapNoExtraKeys!3307 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun lt!426005 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426014 () (_ BitVec 64))

(assert (=> b!945416 (= lt!426014 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945416 (= lt!426019 (addApplyDifferent!451 lt!426003 lt!426005 (minValue!5526 thiss!1141) lt!426014))))

(assert (=> b!945416 (= (apply!868 (+!2852 lt!426003 (tuple2!13509 lt!426005 (minValue!5526 thiss!1141))) lt!426014) (apply!868 lt!426003 lt!426014))))

(declare-fun b!945417 () Bool)

(declare-fun c!98415 () Bool)

(assert (=> b!945417 (= c!98415 (and (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!531748 () ListLongMap!12205)

(assert (=> b!945417 (= e!531744 e!531748)))

(declare-fun bm!41052 () Bool)

(assert (=> bm!41052 (= call!41056 call!41054)))

(declare-fun b!945418 () Bool)

(assert (=> b!945418 (= e!531744 call!41057)))

(declare-fun b!945419 () Bool)

(declare-fun res!634968 () Bool)

(assert (=> b!945419 (=> (not res!634968) (not e!531741))))

(assert (=> b!945419 (= res!634968 e!531750)))

(declare-fun res!634972 () Bool)

(assert (=> b!945419 (=> res!634972 e!531750)))

(assert (=> b!945419 (= res!634972 (not e!531751))))

(declare-fun res!634967 () Bool)

(assert (=> b!945419 (=> (not res!634967) (not e!531751))))

(assert (=> b!945419 (= res!634967 (bvslt #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(declare-fun b!945420 () Bool)

(assert (=> b!945420 (= e!531748 call!41052)))

(declare-fun b!945421 () Bool)

(declare-fun e!531742 () Bool)

(assert (=> b!945421 (= e!531742 (= (apply!868 lt!426007 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5526 thiss!1141)))))

(declare-fun bm!41053 () Bool)

(assert (=> bm!41053 (= call!41052 call!41056)))

(declare-fun b!945422 () Bool)

(declare-fun e!531746 () Bool)

(declare-fun e!531743 () Bool)

(assert (=> b!945422 (= e!531746 e!531743)))

(declare-fun res!634974 () Bool)

(assert (=> b!945422 (= res!634974 call!41055)))

(assert (=> b!945422 (=> (not res!634974) (not e!531743))))

(declare-fun b!945423 () Bool)

(assert (=> b!945423 (= e!531748 call!41057)))

(declare-fun b!945424 () Bool)

(assert (=> b!945424 (= e!531749 (+!2852 call!41058 (tuple2!13509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5526 thiss!1141))))))

(declare-fun d!114397 () Bool)

(assert (=> d!114397 e!531741))

(declare-fun res!634966 () Bool)

(assert (=> d!114397 (=> (not res!634966) (not e!531741))))

(assert (=> d!114397 (= res!634966 (or (bvsge #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))))

(declare-fun lt!426008 () ListLongMap!12205)

(assert (=> d!114397 (= lt!426007 lt!426008)))

(declare-fun lt!426012 () Unit!31886)

(assert (=> d!114397 (= lt!426012 e!531752)))

(declare-fun c!98416 () Bool)

(declare-fun e!531747 () Bool)

(assert (=> d!114397 (= c!98416 e!531747)))

(declare-fun res!634970 () Bool)

(assert (=> d!114397 (=> (not res!634970) (not e!531747))))

(assert (=> d!114397 (= res!634970 (bvslt #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(assert (=> d!114397 (= lt!426008 e!531749)))

(assert (=> d!114397 (= c!98420 (and (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114397 (validMask!0 (mask!27355 thiss!1141))))

(assert (=> d!114397 (= (getCurrentListMap!3351 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)) lt!426007)))

(declare-fun b!945413 () Bool)

(assert (=> b!945413 (= e!531743 (= (apply!868 lt!426007 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5526 thiss!1141)))))

(declare-fun b!945425 () Bool)

(declare-fun call!41053 () Bool)

(assert (=> b!945425 (= e!531745 (not call!41053))))

(declare-fun b!945426 () Bool)

(declare-fun Unit!31889 () Unit!31886)

(assert (=> b!945426 (= e!531752 Unit!31889)))

(declare-fun b!945427 () Bool)

(assert (=> b!945427 (= e!531746 (not call!41055))))

(declare-fun b!945428 () Bool)

(assert (=> b!945428 (= e!531745 e!531742)))

(declare-fun res!634971 () Bool)

(assert (=> b!945428 (= res!634971 call!41053)))

(assert (=> b!945428 (=> (not res!634971) (not e!531742))))

(declare-fun bm!41054 () Bool)

(assert (=> bm!41054 (= call!41053 (contains!5191 lt!426007 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41055 () Bool)

(assert (=> bm!41055 (= call!41054 (getCurrentListMapNoExtraKeys!3307 (_keys!10569 thiss!1141) (_values!5713 thiss!1141) (mask!27355 thiss!1141) (extraKeys!5422 thiss!1141) (zeroValue!5526 thiss!1141) (minValue!5526 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5690 thiss!1141)))))

(declare-fun b!945429 () Bool)

(declare-fun res!634969 () Bool)

(assert (=> b!945429 (=> (not res!634969) (not e!531741))))

(assert (=> b!945429 (= res!634969 e!531746)))

(declare-fun c!98418 () Bool)

(assert (=> b!945429 (= c!98418 (not (= (bvand (extraKeys!5422 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!945430 () Bool)

(assert (=> b!945430 (= e!531747 (validKeyInArray!0 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945431 () Bool)

(declare-fun get!14463 (ValueCell!9819 V!32433) V!32433)

(declare-fun dynLambda!1641 (Int (_ BitVec 64)) V!32433)

(assert (=> b!945431 (= e!531753 (= (apply!868 lt!426007 (select (arr!27511 (_keys!10569 thiss!1141)) #b00000000000000000000000000000000)) (get!14463 (select (arr!27510 (_values!5713 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1641 (defaultEntry!5690 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!945431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27977 (_values!5713 thiss!1141))))))

(assert (=> b!945431 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27978 (_keys!10569 thiss!1141))))))

(assert (= (and d!114397 c!98420) b!945424))

(assert (= (and d!114397 (not c!98420)) b!945415))

(assert (= (and b!945415 c!98417) b!945418))

(assert (= (and b!945415 (not c!98417)) b!945417))

(assert (= (and b!945417 c!98415) b!945423))

(assert (= (and b!945417 (not c!98415)) b!945420))

(assert (= (or b!945423 b!945420) bm!41053))

(assert (= (or b!945418 bm!41053) bm!41052))

(assert (= (or b!945418 b!945423) bm!41049))

(assert (= (or b!945424 bm!41052) bm!41055))

(assert (= (or b!945424 bm!41049) bm!41050))

(assert (= (and d!114397 res!634970) b!945430))

(assert (= (and d!114397 c!98416) b!945416))

(assert (= (and d!114397 (not c!98416)) b!945426))

(assert (= (and d!114397 res!634966) b!945419))

(assert (= (and b!945419 res!634967) b!945414))

(assert (= (and b!945419 (not res!634972)) b!945412))

(assert (= (and b!945412 res!634973) b!945431))

(assert (= (and b!945419 res!634968) b!945429))

(assert (= (and b!945429 c!98418) b!945422))

(assert (= (and b!945429 (not c!98418)) b!945427))

(assert (= (and b!945422 res!634974) b!945413))

(assert (= (or b!945422 b!945427) bm!41051))

(assert (= (and b!945429 res!634969) b!945411))

(assert (= (and b!945411 c!98419) b!945428))

(assert (= (and b!945411 (not c!98419)) b!945425))

(assert (= (and b!945428 res!634971) b!945421))

(assert (= (or b!945428 b!945425) bm!41054))

(declare-fun b_lambda!14295 () Bool)

(assert (=> (not b_lambda!14295) (not b!945431)))

(declare-fun t!27611 () Bool)

(declare-fun tb!6171 () Bool)

(assert (=> (and b!945265 (= (defaultEntry!5690 thiss!1141) (defaultEntry!5690 thiss!1141)) t!27611) tb!6171))

(declare-fun result!12209 () Bool)

(assert (=> tb!6171 (= result!12209 tp_is_empty!20601)))

(assert (=> b!945431 t!27611))

(declare-fun b_and!29517 () Bool)

(assert (= b_and!29513 (and (=> t!27611 result!12209) b_and!29517)))

(declare-fun m!879205 () Bool)

(assert (=> bm!41050 m!879205))

(assert (=> b!945414 m!879181))

(assert (=> b!945414 m!879181))

(assert (=> b!945414 m!879183))

(declare-fun m!879207 () Bool)

(assert (=> b!945416 m!879207))

(declare-fun m!879209 () Bool)

(assert (=> b!945416 m!879209))

(declare-fun m!879211 () Bool)

(assert (=> b!945416 m!879211))

(declare-fun m!879213 () Bool)

(assert (=> b!945416 m!879213))

(declare-fun m!879215 () Bool)

(assert (=> b!945416 m!879215))

(declare-fun m!879217 () Bool)

(assert (=> b!945416 m!879217))

(declare-fun m!879219 () Bool)

(assert (=> b!945416 m!879219))

(declare-fun m!879221 () Bool)

(assert (=> b!945416 m!879221))

(assert (=> b!945416 m!879181))

(declare-fun m!879223 () Bool)

(assert (=> b!945416 m!879223))

(declare-fun m!879225 () Bool)

(assert (=> b!945416 m!879225))

(declare-fun m!879227 () Bool)

(assert (=> b!945416 m!879227))

(assert (=> b!945416 m!879211))

(declare-fun m!879229 () Bool)

(assert (=> b!945416 m!879229))

(assert (=> b!945416 m!879223))

(assert (=> b!945416 m!879217))

(declare-fun m!879231 () Bool)

(assert (=> b!945416 m!879231))

(assert (=> b!945416 m!879209))

(declare-fun m!879233 () Bool)

(assert (=> b!945416 m!879233))

(declare-fun m!879235 () Bool)

(assert (=> b!945416 m!879235))

(declare-fun m!879237 () Bool)

(assert (=> b!945416 m!879237))

(assert (=> bm!41055 m!879207))

(declare-fun m!879239 () Bool)

(assert (=> b!945431 m!879239))

(declare-fun m!879241 () Bool)

(assert (=> b!945431 m!879241))

(declare-fun m!879243 () Bool)

(assert (=> b!945431 m!879243))

(assert (=> b!945431 m!879181))

(declare-fun m!879245 () Bool)

(assert (=> b!945431 m!879245))

(assert (=> b!945431 m!879181))

(assert (=> b!945431 m!879239))

(assert (=> b!945431 m!879241))

(declare-fun m!879247 () Bool)

(assert (=> b!945413 m!879247))

(declare-fun m!879249 () Bool)

(assert (=> bm!41054 m!879249))

(assert (=> b!945430 m!879181))

(assert (=> b!945430 m!879181))

(assert (=> b!945430 m!879183))

(declare-fun m!879251 () Bool)

(assert (=> b!945424 m!879251))

(declare-fun m!879253 () Bool)

(assert (=> d!114397 m!879253))

(declare-fun m!879255 () Bool)

(assert (=> bm!41051 m!879255))

(assert (=> b!945412 m!879181))

(assert (=> b!945412 m!879181))

(declare-fun m!879257 () Bool)

(assert (=> b!945412 m!879257))

(declare-fun m!879259 () Bool)

(assert (=> b!945421 m!879259))

(assert (=> d!114381 d!114397))

(assert (=> b!945297 d!114389))

(assert (=> b!945297 d!114391))

(declare-fun d!114399 () Bool)

(declare-fun res!634979 () Bool)

(declare-fun e!531758 () Bool)

(assert (=> d!114399 (=> res!634979 e!531758)))

(assert (=> d!114399 (= res!634979 (and ((_ is Cons!19285) (toList!6118 (map!13033 thiss!1141))) (= (_1!6765 (h!20436 (toList!6118 (map!13033 thiss!1141)))) key!756)))))

(assert (=> d!114399 (= (containsKey!454 (toList!6118 (map!13033 thiss!1141)) key!756) e!531758)))

(declare-fun b!945438 () Bool)

(declare-fun e!531759 () Bool)

(assert (=> b!945438 (= e!531758 e!531759)))

(declare-fun res!634980 () Bool)

(assert (=> b!945438 (=> (not res!634980) (not e!531759))))

(assert (=> b!945438 (= res!634980 (and (or (not ((_ is Cons!19285) (toList!6118 (map!13033 thiss!1141)))) (bvsle (_1!6765 (h!20436 (toList!6118 (map!13033 thiss!1141)))) key!756)) ((_ is Cons!19285) (toList!6118 (map!13033 thiss!1141))) (bvslt (_1!6765 (h!20436 (toList!6118 (map!13033 thiss!1141)))) key!756)))))

(declare-fun b!945439 () Bool)

(assert (=> b!945439 (= e!531759 (containsKey!454 (t!27608 (toList!6118 (map!13033 thiss!1141))) key!756))))

(assert (= (and d!114399 (not res!634979)) b!945438))

(assert (= (and b!945438 res!634980) b!945439))

(declare-fun m!879261 () Bool)

(assert (=> b!945439 m!879261))

(assert (=> d!114379 d!114399))

(declare-fun b!945448 () Bool)

(declare-fun res!634989 () Bool)

(declare-fun e!531762 () Bool)

(assert (=> b!945448 (=> (not res!634989) (not e!531762))))

(assert (=> b!945448 (= res!634989 (and (= (size!27977 (_values!5713 thiss!1141)) (bvadd (mask!27355 thiss!1141) #b00000000000000000000000000000001)) (= (size!27978 (_keys!10569 thiss!1141)) (size!27977 (_values!5713 thiss!1141))) (bvsge (_size!2449 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2449 thiss!1141) (bvadd (mask!27355 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114401 () Bool)

(declare-fun res!634992 () Bool)

(assert (=> d!114401 (=> (not res!634992) (not e!531762))))

(assert (=> d!114401 (= res!634992 (validMask!0 (mask!27355 thiss!1141)))))

(assert (=> d!114401 (= (simpleValid!350 thiss!1141) e!531762)))

(declare-fun b!945450 () Bool)

(declare-fun res!634990 () Bool)

(assert (=> b!945450 (=> (not res!634990) (not e!531762))))

(declare-fun size!27981 (LongMapFixedSize!4788) (_ BitVec 32))

(assert (=> b!945450 (= res!634990 (= (size!27981 thiss!1141) (bvadd (_size!2449 thiss!1141) (bvsdiv (bvadd (extraKeys!5422 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945449 () Bool)

(declare-fun res!634991 () Bool)

(assert (=> b!945449 (=> (not res!634991) (not e!531762))))

(assert (=> b!945449 (= res!634991 (bvsge (size!27981 thiss!1141) (_size!2449 thiss!1141)))))

(declare-fun b!945451 () Bool)

(assert (=> b!945451 (= e!531762 (and (bvsge (extraKeys!5422 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5422 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2449 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114401 res!634992) b!945448))

(assert (= (and b!945448 res!634989) b!945449))

(assert (= (and b!945449 res!634991) b!945450))

(assert (= (and b!945450 res!634990) b!945451))

(assert (=> d!114401 m!879253))

(declare-fun m!879263 () Bool)

(assert (=> b!945450 m!879263))

(assert (=> b!945449 m!879263))

(assert (=> d!114383 d!114401))

(declare-fun b!945452 () Bool)

(declare-fun e!531764 () Bool)

(assert (=> b!945452 (= e!531764 tp_is_empty!20601)))

(declare-fun b!945453 () Bool)

(declare-fun e!531763 () Bool)

(assert (=> b!945453 (= e!531763 tp_is_empty!20601)))

(declare-fun mapIsEmpty!32738 () Bool)

(declare-fun mapRes!32738 () Bool)

(assert (=> mapIsEmpty!32738 mapRes!32738))

(declare-fun condMapEmpty!32738 () Bool)

(declare-fun mapDefault!32738 () ValueCell!9819)

(assert (=> mapNonEmpty!32737 (= condMapEmpty!32738 (= mapRest!32737 ((as const (Array (_ BitVec 32) ValueCell!9819)) mapDefault!32738)))))

(assert (=> mapNonEmpty!32737 (= tp!62802 (and e!531763 mapRes!32738))))

(declare-fun mapNonEmpty!32738 () Bool)

(declare-fun tp!62803 () Bool)

(assert (=> mapNonEmpty!32738 (= mapRes!32738 (and tp!62803 e!531764))))

(declare-fun mapKey!32738 () (_ BitVec 32))

(declare-fun mapRest!32738 () (Array (_ BitVec 32) ValueCell!9819))

(declare-fun mapValue!32738 () ValueCell!9819)

(assert (=> mapNonEmpty!32738 (= mapRest!32737 (store mapRest!32738 mapKey!32738 mapValue!32738))))

(assert (= (and mapNonEmpty!32737 condMapEmpty!32738) mapIsEmpty!32738))

(assert (= (and mapNonEmpty!32737 (not condMapEmpty!32738)) mapNonEmpty!32738))

(assert (= (and mapNonEmpty!32738 ((_ is ValueCellFull!9819) mapValue!32738)) b!945452))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9819) mapDefault!32738)) b!945453))

(declare-fun m!879265 () Bool)

(assert (=> mapNonEmpty!32738 m!879265))

(declare-fun b_lambda!14297 () Bool)

(assert (= b_lambda!14295 (or (and b!945265 b_free!18093) b_lambda!14297)))

(check-sat (not bm!41028) (not b!945449) (not b!945324) (not d!114401) (not bm!41050) (not bm!41051) (not b!945353) (not d!114389) (not b!945340) (not b!945367) (not b!945430) (not b!945421) (not b!945439) (not b!945414) (not b!945352) tp_is_empty!20601 (not b!945413) (not b_next!18093) (not b!945365) (not d!114387) (not mapNonEmpty!32738) (not bm!41055) (not bm!41034) (not b!945450) (not d!114397) (not b!945364) (not b!945416) (not b!945424) (not bm!41054) b_and!29517 (not b_lambda!14297) (not b!945431) (not bm!41031) (not b!945329) (not b!945412))
(check-sat b_and!29517 (not b_next!18093))
