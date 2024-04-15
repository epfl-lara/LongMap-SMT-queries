; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80424 () Bool)

(assert start!80424)

(declare-fun b!944790 () Bool)

(declare-fun b_free!18085 () Bool)

(declare-fun b_next!18085 () Bool)

(assert (=> b!944790 (= b_free!18085 (not b_next!18085))))

(declare-fun tp!62765 () Bool)

(declare-fun b_and!29477 () Bool)

(assert (=> b!944790 (= tp!62765 b_and!29477)))

(declare-fun mapNonEmpty!32715 () Bool)

(declare-fun mapRes!32715 () Bool)

(declare-fun tp!62766 () Bool)

(declare-fun e!531324 () Bool)

(assert (=> mapNonEmpty!32715 (= mapRes!32715 (and tp!62766 e!531324))))

(declare-datatypes ((V!32423 0))(
  ( (V!32424 (val!10347 Int)) )
))
(declare-datatypes ((ValueCell!9815 0))(
  ( (ValueCellFull!9815 (v!12878 V!32423)) (EmptyCell!9815) )
))
(declare-fun mapValue!32715 () ValueCell!9815)

(declare-datatypes ((array!57119 0))(
  ( (array!57120 (arr!27485 (Array (_ BitVec 32) ValueCell!9815)) (size!27953 (_ BitVec 32))) )
))
(declare-datatypes ((array!57121 0))(
  ( (array!57122 (arr!27486 (Array (_ BitVec 32) (_ BitVec 64))) (size!27954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4780 0))(
  ( (LongMapFixedSize!4781 (defaultEntry!5685 Int) (mask!27340 (_ BitVec 32)) (extraKeys!5417 (_ BitVec 32)) (zeroValue!5521 V!32423) (minValue!5521 V!32423) (_size!2445 (_ BitVec 32)) (_keys!10558 array!57121) (_values!5708 array!57119) (_vacant!2445 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4780)

(declare-fun mapRest!32715 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapKey!32715 () (_ BitVec 32))

(assert (=> mapNonEmpty!32715 (= (arr!27485 (_values!5708 thiss!1141)) (store mapRest!32715 mapKey!32715 mapValue!32715))))

(declare-fun mapIsEmpty!32715 () Bool)

(assert (=> mapIsEmpty!32715 mapRes!32715))

(declare-fun b!944789 () Bool)

(declare-fun tp_is_empty!20593 () Bool)

(assert (=> b!944789 (= e!531324 tp_is_empty!20593)))

(declare-fun e!531322 () Bool)

(declare-fun e!531320 () Bool)

(declare-fun array_inv!21406 (array!57121) Bool)

(declare-fun array_inv!21407 (array!57119) Bool)

(assert (=> b!944790 (= e!531320 (and tp!62765 tp_is_empty!20593 (array_inv!21406 (_keys!10558 thiss!1141)) (array_inv!21407 (_values!5708 thiss!1141)) e!531322))))

(declare-fun b!944791 () Bool)

(declare-fun e!531321 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13552 0))(
  ( (tuple2!13553 (_1!6787 (_ BitVec 64)) (_2!6787 V!32423)) )
))
(declare-datatypes ((List!19291 0))(
  ( (Nil!19288) (Cons!19287 (h!20438 tuple2!13552) (t!27599 List!19291)) )
))
(declare-datatypes ((ListLongMap!12239 0))(
  ( (ListLongMap!12240 (toList!6135 List!19291)) )
))
(declare-fun contains!5150 (ListLongMap!12239 (_ BitVec 64)) Bool)

(declare-fun map!13015 (LongMapFixedSize!4780) ListLongMap!12239)

(assert (=> b!944791 (= e!531321 (not (= (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (contains!5150 (map!13015 thiss!1141) key!756))))))

(declare-fun res!634701 () Bool)

(assert (=> start!80424 (=> (not res!634701) (not e!531321))))

(declare-fun valid!1827 (LongMapFixedSize!4780) Bool)

(assert (=> start!80424 (= res!634701 (valid!1827 thiss!1141))))

(assert (=> start!80424 e!531321))

(assert (=> start!80424 e!531320))

(assert (=> start!80424 true))

(declare-fun b!944792 () Bool)

(declare-fun e!531319 () Bool)

(assert (=> b!944792 (= e!531322 (and e!531319 mapRes!32715))))

(declare-fun condMapEmpty!32715 () Bool)

(declare-fun mapDefault!32715 () ValueCell!9815)

(assert (=> b!944792 (= condMapEmpty!32715 (= (arr!27485 (_values!5708 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32715)))))

(declare-fun b!944793 () Bool)

(assert (=> b!944793 (= e!531319 tp_is_empty!20593)))

(declare-fun b!944794 () Bool)

(declare-fun res!634702 () Bool)

(assert (=> b!944794 (=> (not res!634702) (not e!531321))))

(assert (=> b!944794 (= res!634702 (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!80424 res!634701) b!944794))

(assert (= (and b!944794 res!634702) b!944791))

(assert (= (and b!944792 condMapEmpty!32715) mapIsEmpty!32715))

(assert (= (and b!944792 (not condMapEmpty!32715)) mapNonEmpty!32715))

(get-info :version)

(assert (= (and mapNonEmpty!32715 ((_ is ValueCellFull!9815) mapValue!32715)) b!944789))

(assert (= (and b!944792 ((_ is ValueCellFull!9815) mapDefault!32715)) b!944793))

(assert (= b!944790 b!944792))

(assert (= start!80424 b!944790))

(declare-fun m!878221 () Bool)

(assert (=> mapNonEmpty!32715 m!878221))

(declare-fun m!878223 () Bool)

(assert (=> b!944790 m!878223))

(declare-fun m!878225 () Bool)

(assert (=> b!944790 m!878225))

(declare-fun m!878227 () Bool)

(assert (=> b!944791 m!878227))

(assert (=> b!944791 m!878227))

(declare-fun m!878229 () Bool)

(assert (=> b!944791 m!878229))

(declare-fun m!878231 () Bool)

(assert (=> start!80424 m!878231))

(check-sat (not start!80424) (not b!944790) tp_is_empty!20593 (not b!944791) b_and!29477 (not mapNonEmpty!32715) (not b_next!18085))
(check-sat b_and!29477 (not b_next!18085))
(get-model)

(declare-fun d!114147 () Bool)

(declare-fun res!634721 () Bool)

(declare-fun e!531363 () Bool)

(assert (=> d!114147 (=> (not res!634721) (not e!531363))))

(declare-fun simpleValid!349 (LongMapFixedSize!4780) Bool)

(assert (=> d!114147 (= res!634721 (simpleValid!349 thiss!1141))))

(assert (=> d!114147 (= (valid!1827 thiss!1141) e!531363)))

(declare-fun b!944837 () Bool)

(declare-fun res!634722 () Bool)

(assert (=> b!944837 (=> (not res!634722) (not e!531363))))

(declare-fun arrayCountValidKeys!0 (array!57121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944837 (= res!634722 (= (arrayCountValidKeys!0 (_keys!10558 thiss!1141) #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))) (_size!2445 thiss!1141)))))

(declare-fun b!944838 () Bool)

(declare-fun res!634723 () Bool)

(assert (=> b!944838 (=> (not res!634723) (not e!531363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57121 (_ BitVec 32)) Bool)

(assert (=> b!944838 (= res!634723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10558 thiss!1141) (mask!27340 thiss!1141)))))

(declare-fun b!944839 () Bool)

(declare-datatypes ((List!19292 0))(
  ( (Nil!19289) (Cons!19288 (h!20439 (_ BitVec 64)) (t!27600 List!19292)) )
))
(declare-fun arrayNoDuplicates!0 (array!57121 (_ BitVec 32) List!19292) Bool)

(assert (=> b!944839 (= e!531363 (arrayNoDuplicates!0 (_keys!10558 thiss!1141) #b00000000000000000000000000000000 Nil!19289))))

(assert (= (and d!114147 res!634721) b!944837))

(assert (= (and b!944837 res!634722) b!944838))

(assert (= (and b!944838 res!634723) b!944839))

(declare-fun m!878257 () Bool)

(assert (=> d!114147 m!878257))

(declare-fun m!878259 () Bool)

(assert (=> b!944837 m!878259))

(declare-fun m!878261 () Bool)

(assert (=> b!944838 m!878261))

(declare-fun m!878263 () Bool)

(assert (=> b!944839 m!878263))

(assert (=> start!80424 d!114147))

(declare-fun d!114149 () Bool)

(assert (=> d!114149 (= (array_inv!21406 (_keys!10558 thiss!1141)) (bvsge (size!27954 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944790 d!114149))

(declare-fun d!114151 () Bool)

(assert (=> d!114151 (= (array_inv!21407 (_values!5708 thiss!1141)) (bvsge (size!27953 (_values!5708 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944790 d!114151))

(declare-fun d!114153 () Bool)

(declare-fun e!531369 () Bool)

(assert (=> d!114153 e!531369))

(declare-fun res!634726 () Bool)

(assert (=> d!114153 (=> res!634726 e!531369)))

(declare-fun lt!425614 () Bool)

(assert (=> d!114153 (= res!634726 (not lt!425614))))

(declare-fun lt!425612 () Bool)

(assert (=> d!114153 (= lt!425614 lt!425612)))

(declare-datatypes ((Unit!31756 0))(
  ( (Unit!31757) )
))
(declare-fun lt!425613 () Unit!31756)

(declare-fun e!531368 () Unit!31756)

(assert (=> d!114153 (= lt!425613 e!531368)))

(declare-fun c!98280 () Bool)

(assert (=> d!114153 (= c!98280 lt!425612)))

(declare-fun containsKey!453 (List!19291 (_ BitVec 64)) Bool)

(assert (=> d!114153 (= lt!425612 (containsKey!453 (toList!6135 (map!13015 thiss!1141)) key!756))))

(assert (=> d!114153 (= (contains!5150 (map!13015 thiss!1141) key!756) lt!425614)))

(declare-fun b!944846 () Bool)

(declare-fun lt!425611 () Unit!31756)

(assert (=> b!944846 (= e!531368 lt!425611)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!348 (List!19291 (_ BitVec 64)) Unit!31756)

(assert (=> b!944846 (= lt!425611 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6135 (map!13015 thiss!1141)) key!756))))

(declare-datatypes ((Option!495 0))(
  ( (Some!494 (v!12881 V!32423)) (None!493) )
))
(declare-fun isDefined!361 (Option!495) Bool)

(declare-fun getValueByKey!489 (List!19291 (_ BitVec 64)) Option!495)

(assert (=> b!944846 (isDefined!361 (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756))))

(declare-fun b!944847 () Bool)

(declare-fun Unit!31758 () Unit!31756)

(assert (=> b!944847 (= e!531368 Unit!31758)))

(declare-fun b!944848 () Bool)

(assert (=> b!944848 (= e!531369 (isDefined!361 (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756)))))

(assert (= (and d!114153 c!98280) b!944846))

(assert (= (and d!114153 (not c!98280)) b!944847))

(assert (= (and d!114153 (not res!634726)) b!944848))

(declare-fun m!878265 () Bool)

(assert (=> d!114153 m!878265))

(declare-fun m!878267 () Bool)

(assert (=> b!944846 m!878267))

(declare-fun m!878269 () Bool)

(assert (=> b!944846 m!878269))

(assert (=> b!944846 m!878269))

(declare-fun m!878271 () Bool)

(assert (=> b!944846 m!878271))

(assert (=> b!944848 m!878269))

(assert (=> b!944848 m!878269))

(assert (=> b!944848 m!878271))

(assert (=> b!944791 d!114153))

(declare-fun d!114155 () Bool)

(declare-fun getCurrentListMap!3298 (array!57121 array!57119 (_ BitVec 32) (_ BitVec 32) V!32423 V!32423 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> d!114155 (= (map!13015 thiss!1141) (getCurrentListMap!3298 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun bs!26537 () Bool)

(assert (= bs!26537 d!114155))

(declare-fun m!878273 () Bool)

(assert (=> bs!26537 m!878273))

(assert (=> b!944791 d!114155))

(declare-fun mapIsEmpty!32724 () Bool)

(declare-fun mapRes!32724 () Bool)

(assert (=> mapIsEmpty!32724 mapRes!32724))

(declare-fun b!944856 () Bool)

(declare-fun e!531374 () Bool)

(assert (=> b!944856 (= e!531374 tp_is_empty!20593)))

(declare-fun b!944855 () Bool)

(declare-fun e!531375 () Bool)

(assert (=> b!944855 (= e!531375 tp_is_empty!20593)))

(declare-fun mapNonEmpty!32724 () Bool)

(declare-fun tp!62781 () Bool)

(assert (=> mapNonEmpty!32724 (= mapRes!32724 (and tp!62781 e!531375))))

(declare-fun mapKey!32724 () (_ BitVec 32))

(declare-fun mapRest!32724 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapValue!32724 () ValueCell!9815)

(assert (=> mapNonEmpty!32724 (= mapRest!32715 (store mapRest!32724 mapKey!32724 mapValue!32724))))

(declare-fun condMapEmpty!32724 () Bool)

(declare-fun mapDefault!32724 () ValueCell!9815)

(assert (=> mapNonEmpty!32715 (= condMapEmpty!32724 (= mapRest!32715 ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32724)))))

(assert (=> mapNonEmpty!32715 (= tp!62766 (and e!531374 mapRes!32724))))

(assert (= (and mapNonEmpty!32715 condMapEmpty!32724) mapIsEmpty!32724))

(assert (= (and mapNonEmpty!32715 (not condMapEmpty!32724)) mapNonEmpty!32724))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9815) mapValue!32724)) b!944855))

(assert (= (and mapNonEmpty!32715 ((_ is ValueCellFull!9815) mapDefault!32724)) b!944856))

(declare-fun m!878275 () Bool)

(assert (=> mapNonEmpty!32724 m!878275))

(check-sat (not d!114153) (not b!944837) tp_is_empty!20593 (not d!114147) (not b!944848) b_and!29477 (not d!114155) (not mapNonEmpty!32724) (not b!944839) (not b!944838) (not b_next!18085) (not b!944846))
(check-sat b_and!29477 (not b_next!18085))
(get-model)

(declare-fun b!944868 () Bool)

(declare-fun e!531384 () Bool)

(declare-fun call!40975 () Bool)

(assert (=> b!944868 (= e!531384 call!40975)))

(declare-fun bm!40972 () Bool)

(declare-fun c!98283 () Bool)

(assert (=> bm!40972 (= call!40975 (arrayNoDuplicates!0 (_keys!10558 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98283 (Cons!19288 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000) Nil!19289) Nil!19289)))))

(declare-fun b!944869 () Bool)

(declare-fun e!531386 () Bool)

(declare-fun contains!5151 (List!19292 (_ BitVec 64)) Bool)

(assert (=> b!944869 (= e!531386 (contains!5151 Nil!19289 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944870 () Bool)

(assert (=> b!944870 (= e!531384 call!40975)))

(declare-fun b!944871 () Bool)

(declare-fun e!531385 () Bool)

(declare-fun e!531387 () Bool)

(assert (=> b!944871 (= e!531385 e!531387)))

(declare-fun res!634734 () Bool)

(assert (=> b!944871 (=> (not res!634734) (not e!531387))))

(assert (=> b!944871 (= res!634734 (not e!531386))))

(declare-fun res!634733 () Bool)

(assert (=> b!944871 (=> (not res!634733) (not e!531386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944871 (= res!634733 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114157 () Bool)

(declare-fun res!634735 () Bool)

(assert (=> d!114157 (=> res!634735 e!531385)))

(assert (=> d!114157 (= res!634735 (bvsge #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(assert (=> d!114157 (= (arrayNoDuplicates!0 (_keys!10558 thiss!1141) #b00000000000000000000000000000000 Nil!19289) e!531385)))

(declare-fun b!944867 () Bool)

(assert (=> b!944867 (= e!531387 e!531384)))

(assert (=> b!944867 (= c!98283 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114157 (not res!634735)) b!944871))

(assert (= (and b!944871 res!634733) b!944869))

(assert (= (and b!944871 res!634734) b!944867))

(assert (= (and b!944867 c!98283) b!944870))

(assert (= (and b!944867 (not c!98283)) b!944868))

(assert (= (or b!944870 b!944868) bm!40972))

(declare-fun m!878277 () Bool)

(assert (=> bm!40972 m!878277))

(declare-fun m!878279 () Bool)

(assert (=> bm!40972 m!878279))

(assert (=> b!944869 m!878277))

(assert (=> b!944869 m!878277))

(declare-fun m!878281 () Bool)

(assert (=> b!944869 m!878281))

(assert (=> b!944871 m!878277))

(assert (=> b!944871 m!878277))

(declare-fun m!878283 () Bool)

(assert (=> b!944871 m!878283))

(assert (=> b!944867 m!878277))

(assert (=> b!944867 m!878277))

(assert (=> b!944867 m!878283))

(assert (=> b!944839 d!114157))

(declare-fun d!114159 () Bool)

(assert (=> d!114159 (isDefined!361 (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756))))

(declare-fun lt!425617 () Unit!31756)

(declare-fun choose!1578 (List!19291 (_ BitVec 64)) Unit!31756)

(assert (=> d!114159 (= lt!425617 (choose!1578 (toList!6135 (map!13015 thiss!1141)) key!756))))

(declare-fun e!531390 () Bool)

(assert (=> d!114159 e!531390))

(declare-fun res!634738 () Bool)

(assert (=> d!114159 (=> (not res!634738) (not e!531390))))

(declare-fun isStrictlySorted!502 (List!19291) Bool)

(assert (=> d!114159 (= res!634738 (isStrictlySorted!502 (toList!6135 (map!13015 thiss!1141))))))

(assert (=> d!114159 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6135 (map!13015 thiss!1141)) key!756) lt!425617)))

(declare-fun b!944874 () Bool)

(assert (=> b!944874 (= e!531390 (containsKey!453 (toList!6135 (map!13015 thiss!1141)) key!756))))

(assert (= (and d!114159 res!634738) b!944874))

(assert (=> d!114159 m!878269))

(assert (=> d!114159 m!878269))

(assert (=> d!114159 m!878271))

(declare-fun m!878285 () Bool)

(assert (=> d!114159 m!878285))

(declare-fun m!878287 () Bool)

(assert (=> d!114159 m!878287))

(assert (=> b!944874 m!878265))

(assert (=> b!944846 d!114159))

(declare-fun d!114161 () Bool)

(declare-fun isEmpty!707 (Option!495) Bool)

(assert (=> d!114161 (= (isDefined!361 (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756)) (not (isEmpty!707 (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756))))))

(declare-fun bs!26538 () Bool)

(assert (= bs!26538 d!114161))

(assert (=> bs!26538 m!878269))

(declare-fun m!878289 () Bool)

(assert (=> bs!26538 m!878289))

(assert (=> b!944846 d!114161))

(declare-fun b!944883 () Bool)

(declare-fun e!531395 () Option!495)

(assert (=> b!944883 (= e!531395 (Some!494 (_2!6787 (h!20438 (toList!6135 (map!13015 thiss!1141))))))))

(declare-fun d!114163 () Bool)

(declare-fun c!98288 () Bool)

(assert (=> d!114163 (= c!98288 (and ((_ is Cons!19287) (toList!6135 (map!13015 thiss!1141))) (= (_1!6787 (h!20438 (toList!6135 (map!13015 thiss!1141)))) key!756)))))

(assert (=> d!114163 (= (getValueByKey!489 (toList!6135 (map!13015 thiss!1141)) key!756) e!531395)))

(declare-fun b!944886 () Bool)

(declare-fun e!531396 () Option!495)

(assert (=> b!944886 (= e!531396 None!493)))

(declare-fun b!944885 () Bool)

(assert (=> b!944885 (= e!531396 (getValueByKey!489 (t!27599 (toList!6135 (map!13015 thiss!1141))) key!756))))

(declare-fun b!944884 () Bool)

(assert (=> b!944884 (= e!531395 e!531396)))

(declare-fun c!98289 () Bool)

(assert (=> b!944884 (= c!98289 (and ((_ is Cons!19287) (toList!6135 (map!13015 thiss!1141))) (not (= (_1!6787 (h!20438 (toList!6135 (map!13015 thiss!1141)))) key!756))))))

(assert (= (and d!114163 c!98288) b!944883))

(assert (= (and d!114163 (not c!98288)) b!944884))

(assert (= (and b!944884 c!98289) b!944885))

(assert (= (and b!944884 (not c!98289)) b!944886))

(declare-fun m!878291 () Bool)

(assert (=> b!944885 m!878291))

(assert (=> b!944846 d!114163))

(declare-fun b!944929 () Bool)

(declare-fun e!531429 () Bool)

(declare-fun e!531425 () Bool)

(assert (=> b!944929 (= e!531429 e!531425)))

(declare-fun c!98302 () Bool)

(assert (=> b!944929 (= c!98302 (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!944930 () Bool)

(declare-fun e!531433 () Bool)

(assert (=> b!944930 (= e!531425 e!531433)))

(declare-fun res!634765 () Bool)

(declare-fun call!40995 () Bool)

(assert (=> b!944930 (= res!634765 call!40995)))

(assert (=> b!944930 (=> (not res!634765) (not e!531433))))

(declare-fun b!944932 () Bool)

(declare-fun e!531423 () Unit!31756)

(declare-fun Unit!31759 () Unit!31756)

(assert (=> b!944932 (= e!531423 Unit!31759)))

(declare-fun b!944933 () Bool)

(assert (=> b!944933 (= e!531425 (not call!40995))))

(declare-fun b!944934 () Bool)

(declare-fun e!531434 () Bool)

(assert (=> b!944934 (= e!531434 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944935 () Bool)

(declare-fun res!634760 () Bool)

(assert (=> b!944935 (=> (not res!634760) (not e!531429))))

(declare-fun e!531431 () Bool)

(assert (=> b!944935 (= res!634760 e!531431)))

(declare-fun c!98304 () Bool)

(assert (=> b!944935 (= c!98304 (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40987 () Bool)

(declare-fun call!40994 () ListLongMap!12239)

(declare-fun call!40992 () ListLongMap!12239)

(assert (=> bm!40987 (= call!40994 call!40992)))

(declare-fun b!944936 () Bool)

(declare-fun res!634764 () Bool)

(assert (=> b!944936 (=> (not res!634764) (not e!531429))))

(declare-fun e!531428 () Bool)

(assert (=> b!944936 (= res!634764 e!531428)))

(declare-fun res!634763 () Bool)

(assert (=> b!944936 (=> res!634763 e!531428)))

(declare-fun e!531430 () Bool)

(assert (=> b!944936 (= res!634763 (not e!531430))))

(declare-fun res!634757 () Bool)

(assert (=> b!944936 (=> (not res!634757) (not e!531430))))

(assert (=> b!944936 (= res!634757 (bvslt #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(declare-fun b!944931 () Bool)

(declare-fun e!531426 () Bool)

(assert (=> b!944931 (= e!531428 e!531426)))

(declare-fun res!634761 () Bool)

(assert (=> b!944931 (=> (not res!634761) (not e!531426))))

(declare-fun lt!425679 () ListLongMap!12239)

(assert (=> b!944931 (= res!634761 (contains!5150 lt!425679 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!944931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(declare-fun d!114165 () Bool)

(assert (=> d!114165 e!531429))

(declare-fun res!634762 () Bool)

(assert (=> d!114165 (=> (not res!634762) (not e!531429))))

(assert (=> d!114165 (= res!634762 (or (bvsge #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))))

(declare-fun lt!425673 () ListLongMap!12239)

(assert (=> d!114165 (= lt!425679 lt!425673)))

(declare-fun lt!425662 () Unit!31756)

(assert (=> d!114165 (= lt!425662 e!531423)))

(declare-fun c!98306 () Bool)

(assert (=> d!114165 (= c!98306 e!531434)))

(declare-fun res!634758 () Bool)

(assert (=> d!114165 (=> (not res!634758) (not e!531434))))

(assert (=> d!114165 (= res!634758 (bvslt #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(declare-fun e!531424 () ListLongMap!12239)

(assert (=> d!114165 (= lt!425673 e!531424)))

(declare-fun c!98303 () Bool)

(assert (=> d!114165 (= c!98303 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114165 (validMask!0 (mask!27340 thiss!1141))))

(assert (=> d!114165 (= (getCurrentListMap!3298 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)) lt!425679)))

(declare-fun bm!40988 () Bool)

(declare-fun call!40991 () ListLongMap!12239)

(assert (=> bm!40988 (= call!40991 call!40994)))

(declare-fun b!944937 () Bool)

(declare-fun e!531427 () ListLongMap!12239)

(assert (=> b!944937 (= e!531424 e!531427)))

(declare-fun c!98305 () Bool)

(assert (=> b!944937 (= c!98305 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!944938 () Bool)

(declare-fun e!531435 () Bool)

(declare-fun apply!860 (ListLongMap!12239 (_ BitVec 64)) V!32423)

(assert (=> b!944938 (= e!531435 (= (apply!860 lt!425679 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5521 thiss!1141)))))

(declare-fun b!944939 () Bool)

(assert (=> b!944939 (= e!531433 (= (apply!860 lt!425679 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5521 thiss!1141)))))

(declare-fun bm!40989 () Bool)

(assert (=> bm!40989 (= call!40995 (contains!5150 lt!425679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!944940 () Bool)

(declare-fun get!14451 (ValueCell!9815 V!32423) V!32423)

(declare-fun dynLambda!1626 (Int (_ BitVec 64)) V!32423)

(assert (=> b!944940 (= e!531426 (= (apply!860 lt!425679 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)) (get!14451 (select (arr!27485 (_values!5708 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1626 (defaultEntry!5685 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!944940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27953 (_values!5708 thiss!1141))))))

(assert (=> b!944940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(declare-fun b!944941 () Bool)

(declare-fun call!40996 () ListLongMap!12239)

(assert (=> b!944941 (= e!531427 call!40996)))

(declare-fun bm!40990 () Bool)

(declare-fun call!40993 () ListLongMap!12239)

(assert (=> bm!40990 (= call!40996 call!40993)))

(declare-fun b!944942 () Bool)

(declare-fun e!531432 () ListLongMap!12239)

(assert (=> b!944942 (= e!531432 call!40991)))

(declare-fun bm!40991 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3342 (array!57121 array!57119 (_ BitVec 32) (_ BitVec 32) V!32423 V!32423 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> bm!40991 (= call!40992 (getCurrentListMapNoExtraKeys!3342 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun b!944943 () Bool)

(declare-fun lt!425663 () Unit!31756)

(assert (=> b!944943 (= e!531423 lt!425663)))

(declare-fun lt!425671 () ListLongMap!12239)

(assert (=> b!944943 (= lt!425671 (getCurrentListMapNoExtraKeys!3342 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!425680 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425682 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425682 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425677 () Unit!31756)

(declare-fun addStillContains!559 (ListLongMap!12239 (_ BitVec 64) V!32423 (_ BitVec 64)) Unit!31756)

(assert (=> b!944943 (= lt!425677 (addStillContains!559 lt!425671 lt!425680 (zeroValue!5521 thiss!1141) lt!425682))))

(declare-fun +!2870 (ListLongMap!12239 tuple2!13552) ListLongMap!12239)

(assert (=> b!944943 (contains!5150 (+!2870 lt!425671 (tuple2!13553 lt!425680 (zeroValue!5521 thiss!1141))) lt!425682)))

(declare-fun lt!425676 () Unit!31756)

(assert (=> b!944943 (= lt!425676 lt!425677)))

(declare-fun lt!425674 () ListLongMap!12239)

(assert (=> b!944943 (= lt!425674 (getCurrentListMapNoExtraKeys!3342 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!425669 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425675 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425675 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425670 () Unit!31756)

(declare-fun addApplyDifferent!439 (ListLongMap!12239 (_ BitVec 64) V!32423 (_ BitVec 64)) Unit!31756)

(assert (=> b!944943 (= lt!425670 (addApplyDifferent!439 lt!425674 lt!425669 (minValue!5521 thiss!1141) lt!425675))))

(assert (=> b!944943 (= (apply!860 (+!2870 lt!425674 (tuple2!13553 lt!425669 (minValue!5521 thiss!1141))) lt!425675) (apply!860 lt!425674 lt!425675))))

(declare-fun lt!425665 () Unit!31756)

(assert (=> b!944943 (= lt!425665 lt!425670)))

(declare-fun lt!425666 () ListLongMap!12239)

(assert (=> b!944943 (= lt!425666 (getCurrentListMapNoExtraKeys!3342 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!425672 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425668 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425668 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425681 () Unit!31756)

(assert (=> b!944943 (= lt!425681 (addApplyDifferent!439 lt!425666 lt!425672 (zeroValue!5521 thiss!1141) lt!425668))))

(assert (=> b!944943 (= (apply!860 (+!2870 lt!425666 (tuple2!13553 lt!425672 (zeroValue!5521 thiss!1141))) lt!425668) (apply!860 lt!425666 lt!425668))))

(declare-fun lt!425683 () Unit!31756)

(assert (=> b!944943 (= lt!425683 lt!425681)))

(declare-fun lt!425678 () ListLongMap!12239)

(assert (=> b!944943 (= lt!425678 (getCurrentListMapNoExtraKeys!3342 (_keys!10558 thiss!1141) (_values!5708 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!425667 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425664 () (_ BitVec 64))

(assert (=> b!944943 (= lt!425664 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944943 (= lt!425663 (addApplyDifferent!439 lt!425678 lt!425667 (minValue!5521 thiss!1141) lt!425664))))

(assert (=> b!944943 (= (apply!860 (+!2870 lt!425678 (tuple2!13553 lt!425667 (minValue!5521 thiss!1141))) lt!425664) (apply!860 lt!425678 lt!425664))))

(declare-fun b!944944 () Bool)

(declare-fun call!40990 () Bool)

(assert (=> b!944944 (= e!531431 (not call!40990))))

(declare-fun b!944945 () Bool)

(assert (=> b!944945 (= e!531432 call!40996)))

(declare-fun b!944946 () Bool)

(assert (=> b!944946 (= e!531431 e!531435)))

(declare-fun res!634759 () Bool)

(assert (=> b!944946 (= res!634759 call!40990)))

(assert (=> b!944946 (=> (not res!634759) (not e!531435))))

(declare-fun b!944947 () Bool)

(declare-fun c!98307 () Bool)

(assert (=> b!944947 (= c!98307 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!944947 (= e!531427 e!531432)))

(declare-fun bm!40992 () Bool)

(assert (=> bm!40992 (= call!40993 (+!2870 (ite c!98303 call!40992 (ite c!98305 call!40994 call!40991)) (ite (or c!98303 c!98305) (tuple2!13553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5521 thiss!1141)) (tuple2!13553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5521 thiss!1141)))))))

(declare-fun bm!40993 () Bool)

(assert (=> bm!40993 (= call!40990 (contains!5150 lt!425679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!944948 () Bool)

(assert (=> b!944948 (= e!531424 (+!2870 call!40993 (tuple2!13553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5521 thiss!1141))))))

(declare-fun b!944949 () Bool)

(assert (=> b!944949 (= e!531430 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114165 c!98303) b!944948))

(assert (= (and d!114165 (not c!98303)) b!944937))

(assert (= (and b!944937 c!98305) b!944941))

(assert (= (and b!944937 (not c!98305)) b!944947))

(assert (= (and b!944947 c!98307) b!944945))

(assert (= (and b!944947 (not c!98307)) b!944942))

(assert (= (or b!944945 b!944942) bm!40988))

(assert (= (or b!944941 bm!40988) bm!40987))

(assert (= (or b!944941 b!944945) bm!40990))

(assert (= (or b!944948 bm!40987) bm!40991))

(assert (= (or b!944948 bm!40990) bm!40992))

(assert (= (and d!114165 res!634758) b!944934))

(assert (= (and d!114165 c!98306) b!944943))

(assert (= (and d!114165 (not c!98306)) b!944932))

(assert (= (and d!114165 res!634762) b!944936))

(assert (= (and b!944936 res!634757) b!944949))

(assert (= (and b!944936 (not res!634763)) b!944931))

(assert (= (and b!944931 res!634761) b!944940))

(assert (= (and b!944936 res!634764) b!944935))

(assert (= (and b!944935 c!98304) b!944946))

(assert (= (and b!944935 (not c!98304)) b!944944))

(assert (= (and b!944946 res!634759) b!944938))

(assert (= (or b!944946 b!944944) bm!40993))

(assert (= (and b!944935 res!634760) b!944929))

(assert (= (and b!944929 c!98302) b!944930))

(assert (= (and b!944929 (not c!98302)) b!944933))

(assert (= (and b!944930 res!634765) b!944939))

(assert (= (or b!944930 b!944933) bm!40989))

(declare-fun b_lambda!14273 () Bool)

(assert (=> (not b_lambda!14273) (not b!944940)))

(declare-fun t!27602 () Bool)

(declare-fun tb!6161 () Bool)

(assert (=> (and b!944790 (= (defaultEntry!5685 thiss!1141) (defaultEntry!5685 thiss!1141)) t!27602) tb!6161))

(declare-fun result!12195 () Bool)

(assert (=> tb!6161 (= result!12195 tp_is_empty!20593)))

(assert (=> b!944940 t!27602))

(declare-fun b_and!29483 () Bool)

(assert (= b_and!29477 (and (=> t!27602 result!12195) b_and!29483)))

(assert (=> b!944949 m!878277))

(assert (=> b!944949 m!878277))

(assert (=> b!944949 m!878283))

(declare-fun m!878293 () Bool)

(assert (=> bm!40989 m!878293))

(declare-fun m!878295 () Bool)

(assert (=> d!114165 m!878295))

(declare-fun m!878297 () Bool)

(assert (=> bm!40991 m!878297))

(declare-fun m!878299 () Bool)

(assert (=> b!944938 m!878299))

(assert (=> b!944931 m!878277))

(assert (=> b!944931 m!878277))

(declare-fun m!878301 () Bool)

(assert (=> b!944931 m!878301))

(declare-fun m!878303 () Bool)

(assert (=> b!944940 m!878303))

(assert (=> b!944940 m!878303))

(declare-fun m!878305 () Bool)

(assert (=> b!944940 m!878305))

(declare-fun m!878307 () Bool)

(assert (=> b!944940 m!878307))

(assert (=> b!944940 m!878305))

(assert (=> b!944940 m!878277))

(declare-fun m!878309 () Bool)

(assert (=> b!944940 m!878309))

(assert (=> b!944940 m!878277))

(assert (=> b!944934 m!878277))

(assert (=> b!944934 m!878277))

(assert (=> b!944934 m!878283))

(declare-fun m!878311 () Bool)

(assert (=> b!944948 m!878311))

(declare-fun m!878313 () Bool)

(assert (=> b!944939 m!878313))

(declare-fun m!878315 () Bool)

(assert (=> b!944943 m!878315))

(declare-fun m!878317 () Bool)

(assert (=> b!944943 m!878317))

(declare-fun m!878319 () Bool)

(assert (=> b!944943 m!878319))

(declare-fun m!878321 () Bool)

(assert (=> b!944943 m!878321))

(declare-fun m!878323 () Bool)

(assert (=> b!944943 m!878323))

(declare-fun m!878325 () Bool)

(assert (=> b!944943 m!878325))

(declare-fun m!878327 () Bool)

(assert (=> b!944943 m!878327))

(assert (=> b!944943 m!878297))

(assert (=> b!944943 m!878315))

(declare-fun m!878329 () Bool)

(assert (=> b!944943 m!878329))

(declare-fun m!878331 () Bool)

(assert (=> b!944943 m!878331))

(declare-fun m!878333 () Bool)

(assert (=> b!944943 m!878333))

(declare-fun m!878335 () Bool)

(assert (=> b!944943 m!878335))

(declare-fun m!878337 () Bool)

(assert (=> b!944943 m!878337))

(assert (=> b!944943 m!878319))

(assert (=> b!944943 m!878325))

(declare-fun m!878339 () Bool)

(assert (=> b!944943 m!878339))

(declare-fun m!878341 () Bool)

(assert (=> b!944943 m!878341))

(assert (=> b!944943 m!878277))

(assert (=> b!944943 m!878341))

(declare-fun m!878343 () Bool)

(assert (=> b!944943 m!878343))

(declare-fun m!878345 () Bool)

(assert (=> bm!40992 m!878345))

(declare-fun m!878347 () Bool)

(assert (=> bm!40993 m!878347))

(assert (=> d!114155 d!114165))

(declare-fun b!944961 () Bool)

(declare-fun res!634777 () Bool)

(declare-fun e!531438 () Bool)

(assert (=> b!944961 (=> (not res!634777) (not e!531438))))

(declare-fun size!27959 (LongMapFixedSize!4780) (_ BitVec 32))

(assert (=> b!944961 (= res!634777 (bvsge (size!27959 thiss!1141) (_size!2445 thiss!1141)))))

(declare-fun b!944960 () Bool)

(declare-fun res!634776 () Bool)

(assert (=> b!944960 (=> (not res!634776) (not e!531438))))

(assert (=> b!944960 (= res!634776 (and (= (size!27953 (_values!5708 thiss!1141)) (bvadd (mask!27340 thiss!1141) #b00000000000000000000000000000001)) (= (size!27954 (_keys!10558 thiss!1141)) (size!27953 (_values!5708 thiss!1141))) (bvsge (_size!2445 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2445 thiss!1141) (bvadd (mask!27340 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!944963 () Bool)

(assert (=> b!944963 (= e!531438 (and (bvsge (extraKeys!5417 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5417 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2445 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!944962 () Bool)

(declare-fun res!634775 () Bool)

(assert (=> b!944962 (=> (not res!634775) (not e!531438))))

(assert (=> b!944962 (= res!634775 (= (size!27959 thiss!1141) (bvadd (_size!2445 thiss!1141) (bvsdiv (bvadd (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114167 () Bool)

(declare-fun res!634774 () Bool)

(assert (=> d!114167 (=> (not res!634774) (not e!531438))))

(assert (=> d!114167 (= res!634774 (validMask!0 (mask!27340 thiss!1141)))))

(assert (=> d!114167 (= (simpleValid!349 thiss!1141) e!531438)))

(assert (= (and d!114167 res!634774) b!944960))

(assert (= (and b!944960 res!634776) b!944961))

(assert (= (and b!944961 res!634777) b!944962))

(assert (= (and b!944962 res!634775) b!944963))

(declare-fun m!878349 () Bool)

(assert (=> b!944961 m!878349))

(assert (=> b!944962 m!878349))

(assert (=> d!114167 m!878295))

(assert (=> d!114147 d!114167))

(declare-fun bm!40996 () Bool)

(declare-fun call!40999 () Bool)

(assert (=> bm!40996 (= call!40999 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10558 thiss!1141) (mask!27340 thiss!1141)))))

(declare-fun b!944972 () Bool)

(declare-fun e!531446 () Bool)

(assert (=> b!944972 (= e!531446 call!40999)))

(declare-fun b!944973 () Bool)

(declare-fun e!531447 () Bool)

(assert (=> b!944973 (= e!531447 e!531446)))

(declare-fun c!98310 () Bool)

(assert (=> b!944973 (= c!98310 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114169 () Bool)

(declare-fun res!634782 () Bool)

(assert (=> d!114169 (=> res!634782 e!531447)))

(assert (=> d!114169 (= res!634782 (bvsge #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(assert (=> d!114169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10558 thiss!1141) (mask!27340 thiss!1141)) e!531447)))

(declare-fun b!944974 () Bool)

(declare-fun e!531445 () Bool)

(assert (=> b!944974 (= e!531446 e!531445)))

(declare-fun lt!425691 () (_ BitVec 64))

(assert (=> b!944974 (= lt!425691 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425690 () Unit!31756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57121 (_ BitVec 64) (_ BitVec 32)) Unit!31756)

(assert (=> b!944974 (= lt!425690 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10558 thiss!1141) lt!425691 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944974 (arrayContainsKey!0 (_keys!10558 thiss!1141) lt!425691 #b00000000000000000000000000000000)))

(declare-fun lt!425692 () Unit!31756)

(assert (=> b!944974 (= lt!425692 lt!425690)))

(declare-fun res!634783 () Bool)

(declare-datatypes ((SeekEntryResult!9077 0))(
  ( (MissingZero!9077 (index!38679 (_ BitVec 32))) (Found!9077 (index!38680 (_ BitVec 32))) (Intermediate!9077 (undefined!9889 Bool) (index!38681 (_ BitVec 32)) (x!81187 (_ BitVec 32))) (Undefined!9077) (MissingVacant!9077 (index!38682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57121 (_ BitVec 32)) SeekEntryResult!9077)

(assert (=> b!944974 (= res!634783 (= (seekEntryOrOpen!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000) (_keys!10558 thiss!1141) (mask!27340 thiss!1141)) (Found!9077 #b00000000000000000000000000000000)))))

(assert (=> b!944974 (=> (not res!634783) (not e!531445))))

(declare-fun b!944975 () Bool)

(assert (=> b!944975 (= e!531445 call!40999)))

(assert (= (and d!114169 (not res!634782)) b!944973))

(assert (= (and b!944973 c!98310) b!944974))

(assert (= (and b!944973 (not c!98310)) b!944972))

(assert (= (and b!944974 res!634783) b!944975))

(assert (= (or b!944975 b!944972) bm!40996))

(declare-fun m!878351 () Bool)

(assert (=> bm!40996 m!878351))

(assert (=> b!944973 m!878277))

(assert (=> b!944973 m!878277))

(assert (=> b!944973 m!878283))

(assert (=> b!944974 m!878277))

(declare-fun m!878353 () Bool)

(assert (=> b!944974 m!878353))

(declare-fun m!878355 () Bool)

(assert (=> b!944974 m!878355))

(assert (=> b!944974 m!878277))

(declare-fun m!878357 () Bool)

(assert (=> b!944974 m!878357))

(assert (=> b!944838 d!114169))

(declare-fun d!114171 () Bool)

(declare-fun res!634788 () Bool)

(declare-fun e!531452 () Bool)

(assert (=> d!114171 (=> res!634788 e!531452)))

(assert (=> d!114171 (= res!634788 (and ((_ is Cons!19287) (toList!6135 (map!13015 thiss!1141))) (= (_1!6787 (h!20438 (toList!6135 (map!13015 thiss!1141)))) key!756)))))

(assert (=> d!114171 (= (containsKey!453 (toList!6135 (map!13015 thiss!1141)) key!756) e!531452)))

(declare-fun b!944980 () Bool)

(declare-fun e!531453 () Bool)

(assert (=> b!944980 (= e!531452 e!531453)))

(declare-fun res!634789 () Bool)

(assert (=> b!944980 (=> (not res!634789) (not e!531453))))

(assert (=> b!944980 (= res!634789 (and (or (not ((_ is Cons!19287) (toList!6135 (map!13015 thiss!1141)))) (bvsle (_1!6787 (h!20438 (toList!6135 (map!13015 thiss!1141)))) key!756)) ((_ is Cons!19287) (toList!6135 (map!13015 thiss!1141))) (bvslt (_1!6787 (h!20438 (toList!6135 (map!13015 thiss!1141)))) key!756)))))

(declare-fun b!944981 () Bool)

(assert (=> b!944981 (= e!531453 (containsKey!453 (t!27599 (toList!6135 (map!13015 thiss!1141))) key!756))))

(assert (= (and d!114171 (not res!634788)) b!944980))

(assert (= (and b!944980 res!634789) b!944981))

(declare-fun m!878359 () Bool)

(assert (=> b!944981 m!878359))

(assert (=> d!114153 d!114171))

(assert (=> b!944848 d!114161))

(assert (=> b!944848 d!114163))

(declare-fun b!944990 () Bool)

(declare-fun e!531458 () (_ BitVec 32))

(declare-fun call!41002 () (_ BitVec 32))

(assert (=> b!944990 (= e!531458 call!41002)))

(declare-fun b!944991 () Bool)

(declare-fun e!531459 () (_ BitVec 32))

(assert (=> b!944991 (= e!531459 e!531458)))

(declare-fun c!98316 () Bool)

(assert (=> b!944991 (= c!98316 (validKeyInArray!0 (select (arr!27486 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944992 () Bool)

(assert (=> b!944992 (= e!531458 (bvadd #b00000000000000000000000000000001 call!41002))))

(declare-fun b!944993 () Bool)

(assert (=> b!944993 (= e!531459 #b00000000000000000000000000000000)))

(declare-fun bm!40999 () Bool)

(assert (=> bm!40999 (= call!41002 (arrayCountValidKeys!0 (_keys!10558 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27954 (_keys!10558 thiss!1141))))))

(declare-fun d!114173 () Bool)

(declare-fun lt!425695 () (_ BitVec 32))

(assert (=> d!114173 (and (bvsge lt!425695 #b00000000000000000000000000000000) (bvsle lt!425695 (bvsub (size!27954 (_keys!10558 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114173 (= lt!425695 e!531459)))

(declare-fun c!98315 () Bool)

(assert (=> d!114173 (= c!98315 (bvsge #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))))))

(assert (=> d!114173 (and (bvsle #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27954 (_keys!10558 thiss!1141)) (size!27954 (_keys!10558 thiss!1141))))))

(assert (=> d!114173 (= (arrayCountValidKeys!0 (_keys!10558 thiss!1141) #b00000000000000000000000000000000 (size!27954 (_keys!10558 thiss!1141))) lt!425695)))

(assert (= (and d!114173 c!98315) b!944993))

(assert (= (and d!114173 (not c!98315)) b!944991))

(assert (= (and b!944991 c!98316) b!944992))

(assert (= (and b!944991 (not c!98316)) b!944990))

(assert (= (or b!944992 b!944990) bm!40999))

(assert (=> b!944991 m!878277))

(assert (=> b!944991 m!878277))

(assert (=> b!944991 m!878283))

(declare-fun m!878361 () Bool)

(assert (=> bm!40999 m!878361))

(assert (=> b!944837 d!114173))

(declare-fun mapIsEmpty!32725 () Bool)

(declare-fun mapRes!32725 () Bool)

(assert (=> mapIsEmpty!32725 mapRes!32725))

(declare-fun b!944995 () Bool)

(declare-fun e!531460 () Bool)

(assert (=> b!944995 (= e!531460 tp_is_empty!20593)))

(declare-fun b!944994 () Bool)

(declare-fun e!531461 () Bool)

(assert (=> b!944994 (= e!531461 tp_is_empty!20593)))

(declare-fun mapNonEmpty!32725 () Bool)

(declare-fun tp!62782 () Bool)

(assert (=> mapNonEmpty!32725 (= mapRes!32725 (and tp!62782 e!531461))))

(declare-fun mapValue!32725 () ValueCell!9815)

(declare-fun mapRest!32725 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapKey!32725 () (_ BitVec 32))

(assert (=> mapNonEmpty!32725 (= mapRest!32724 (store mapRest!32725 mapKey!32725 mapValue!32725))))

(declare-fun condMapEmpty!32725 () Bool)

(declare-fun mapDefault!32725 () ValueCell!9815)

(assert (=> mapNonEmpty!32724 (= condMapEmpty!32725 (= mapRest!32724 ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32725)))))

(assert (=> mapNonEmpty!32724 (= tp!62781 (and e!531460 mapRes!32725))))

(assert (= (and mapNonEmpty!32724 condMapEmpty!32725) mapIsEmpty!32725))

(assert (= (and mapNonEmpty!32724 (not condMapEmpty!32725)) mapNonEmpty!32725))

(assert (= (and mapNonEmpty!32725 ((_ is ValueCellFull!9815) mapValue!32725)) b!944994))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9815) mapDefault!32725)) b!944995))

(declare-fun m!878363 () Bool)

(assert (=> mapNonEmpty!32725 m!878363))

(declare-fun b_lambda!14275 () Bool)

(assert (= b_lambda!14273 (or (and b!944790 b_free!18085) b_lambda!14275)))

(check-sat (not b!944949) (not d!114165) (not b!944934) b_and!29483 (not b!944981) (not d!114159) (not b!944867) (not bm!40992) (not b!944939) (not d!114167) (not bm!40991) (not b!944948) (not bm!40999) (not b!944938) (not b_lambda!14275) (not b!944931) tp_is_empty!20593 (not bm!40989) (not mapNonEmpty!32725) (not bm!40972) (not b!944973) (not b!944961) (not b!944869) (not bm!40993) (not d!114161) (not b!944991) (not b!944871) (not b!944943) (not b!944940) (not b!944885) (not bm!40996) (not b!944974) (not b!944874) (not b_next!18085) (not b!944962))
(check-sat b_and!29483 (not b_next!18085))
