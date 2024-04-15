; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21956 () Bool)

(assert start!21956)

(declare-fun b!224257 () Bool)

(declare-fun b_free!6019 () Bool)

(declare-fun b_next!6019 () Bool)

(assert (=> b!224257 (= b_free!6019 (not b_next!6019))))

(declare-fun tp!21199 () Bool)

(declare-fun b_and!12891 () Bool)

(assert (=> b!224257 (= tp!21199 b_and!12891)))

(declare-fun res!110303 () Bool)

(declare-fun e!145570 () Bool)

(assert (=> start!21956 (=> (not res!110303) (not e!145570))))

(declare-datatypes ((V!7489 0))(
  ( (V!7490 (val!2985 Int)) )
))
(declare-datatypes ((ValueCell!2597 0))(
  ( (ValueCellFull!2597 (v!4999 V!7489)) (EmptyCell!2597) )
))
(declare-datatypes ((array!10997 0))(
  ( (array!10998 (arr!5217 (Array (_ BitVec 32) ValueCell!2597)) (size!5551 (_ BitVec 32))) )
))
(declare-datatypes ((array!10999 0))(
  ( (array!11000 (arr!5218 (Array (_ BitVec 32) (_ BitVec 64))) (size!5552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3094 0))(
  ( (LongMapFixedSize!3095 (defaultEntry!4206 Int) (mask!10039 (_ BitVec 32)) (extraKeys!3943 (_ BitVec 32)) (zeroValue!4047 V!7489) (minValue!4047 V!7489) (_size!1596 (_ BitVec 32)) (_keys!6259 array!10999) (_values!4189 array!10997) (_vacant!1596 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3094)

(declare-fun valid!1260 (LongMapFixedSize!3094) Bool)

(assert (=> start!21956 (= res!110303 (valid!1260 thiss!1504))))

(assert (=> start!21956 e!145570))

(declare-fun e!145567 () Bool)

(assert (=> start!21956 e!145567))

(assert (=> start!21956 true))

(declare-fun b!224226 () Bool)

(declare-fun res!110304 () Bool)

(declare-fun e!145568 () Bool)

(assert (=> b!224226 (=> (not res!110304) (not e!145568))))

(declare-fun lt!112955 () Bool)

(assert (=> b!224226 (= res!110304 (not lt!112955))))

(declare-fun b!224227 () Bool)

(assert (=> b!224227 (= e!145568 false)))

(declare-fun lt!112959 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3318 0))(
  ( (Nil!3315) (Cons!3314 (h!3962 (_ BitVec 64)) (t!8268 List!3318)) )
))
(declare-fun contains!1534 (List!3318 (_ BitVec 64)) Bool)

(assert (=> b!224227 (= lt!112959 (contains!1534 Nil!3315 key!932))))

(declare-fun b!224228 () Bool)

(declare-fun e!145575 () Bool)

(declare-fun call!20868 () Bool)

(assert (=> b!224228 (= e!145575 (not call!20868))))

(declare-fun b!224229 () Bool)

(declare-fun e!145582 () Bool)

(assert (=> b!224229 (= e!145582 (contains!1534 Nil!3315 key!932))))

(declare-fun b!224230 () Bool)

(declare-fun e!145583 () Bool)

(assert (=> b!224230 (= e!145583 (not call!20868))))

(declare-fun b!224231 () Bool)

(declare-datatypes ((Unit!6693 0))(
  ( (Unit!6694) )
))
(declare-fun e!145573 () Unit!6693)

(declare-fun Unit!6695 () Unit!6693)

(assert (=> b!224231 (= e!145573 Unit!6695)))

(declare-fun lt!112956 () Unit!6693)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!232 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6693)

(assert (=> b!224231 (= lt!112956 (lemmaInListMapThenSeekEntryOrOpenFindsIt!232 (_keys!6259 thiss!1504) (_values!4189 thiss!1504) (mask!10039 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(assert (=> b!224231 false))

(declare-fun b!224232 () Bool)

(declare-fun e!145572 () Bool)

(declare-fun tp_is_empty!5881 () Bool)

(assert (=> b!224232 (= e!145572 tp_is_empty!5881)))

(declare-fun b!224233 () Bool)

(declare-fun res!110297 () Bool)

(assert (=> b!224233 (=> (not res!110297) (not e!145583))))

(declare-datatypes ((SeekEntryResult!853 0))(
  ( (MissingZero!853 (index!5582 (_ BitVec 32))) (Found!853 (index!5583 (_ BitVec 32))) (Intermediate!853 (undefined!1665 Bool) (index!5584 (_ BitVec 32)) (x!23128 (_ BitVec 32))) (Undefined!853) (MissingVacant!853 (index!5585 (_ BitVec 32))) )
))
(declare-fun lt!112954 () SeekEntryResult!853)

(assert (=> b!224233 (= res!110297 (= (select (arr!5218 (_keys!6259 thiss!1504)) (index!5582 lt!112954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224234 () Bool)

(declare-fun lt!112957 () Unit!6693)

(assert (=> b!224234 (= e!145573 lt!112957)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6693)

(assert (=> b!224234 (= lt!112957 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (_keys!6259 thiss!1504) (_values!4189 thiss!1504) (mask!10039 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(declare-fun c!37183 () Bool)

(get-info :version)

(assert (=> b!224234 (= c!37183 ((_ is MissingZero!853) lt!112954))))

(declare-fun e!145577 () Bool)

(assert (=> b!224234 e!145577))

(declare-fun b!224235 () Bool)

(declare-fun e!145584 () Bool)

(assert (=> b!224235 (= e!145570 e!145584)))

(declare-fun res!110305 () Bool)

(assert (=> b!224235 (=> (not res!110305) (not e!145584))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224235 (= res!110305 (or (= lt!112954 (MissingZero!853 index!297)) (= lt!112954 (MissingVacant!853 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10999 (_ BitVec 32)) SeekEntryResult!853)

(assert (=> b!224235 (= lt!112954 (seekEntryOrOpen!0 key!932 (_keys!6259 thiss!1504) (mask!10039 thiss!1504)))))

(declare-fun b!224236 () Bool)

(declare-fun c!37185 () Bool)

(assert (=> b!224236 (= c!37185 ((_ is MissingVacant!853) lt!112954))))

(declare-fun e!145581 () Bool)

(assert (=> b!224236 (= e!145577 e!145581)))

(declare-fun b!224237 () Bool)

(declare-fun res!110310 () Bool)

(assert (=> b!224237 (= res!110310 (= (select (arr!5218 (_keys!6259 thiss!1504)) (index!5585 lt!112954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224237 (=> (not res!110310) (not e!145575))))

(declare-fun b!224238 () Bool)

(declare-fun res!110312 () Bool)

(assert (=> b!224238 (=> (not res!110312) (not e!145568))))

(assert (=> b!224238 (= res!110312 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5552 (_keys!6259 thiss!1504)))))))

(declare-fun b!224239 () Bool)

(assert (=> b!224239 (= e!145581 ((_ is Undefined!853) lt!112954))))

(declare-fun b!224240 () Bool)

(declare-fun res!110308 () Bool)

(assert (=> b!224240 (=> (not res!110308) (not e!145568))))

(declare-fun arrayNoDuplicates!0 (array!10999 (_ BitVec 32) List!3318) Bool)

(assert (=> b!224240 (= res!110308 (arrayNoDuplicates!0 (_keys!6259 thiss!1504) #b00000000000000000000000000000000 Nil!3315))))

(declare-fun b!224241 () Bool)

(declare-fun res!110298 () Bool)

(assert (=> b!224241 (=> (not res!110298) (not e!145568))))

(declare-fun e!145569 () Bool)

(assert (=> b!224241 (= res!110298 e!145569)))

(declare-fun res!110315 () Bool)

(assert (=> b!224241 (=> res!110315 e!145569)))

(assert (=> b!224241 (= res!110315 e!145582)))

(declare-fun res!110311 () Bool)

(assert (=> b!224241 (=> (not res!110311) (not e!145582))))

(assert (=> b!224241 (= res!110311 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224242 () Bool)

(declare-fun e!145578 () Bool)

(assert (=> b!224242 (= e!145578 e!145568)))

(declare-fun res!110296 () Bool)

(assert (=> b!224242 (=> (not res!110296) (not e!145568))))

(assert (=> b!224242 (= res!110296 (and (bvslt (size!5552 (_keys!6259 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5552 (_keys!6259 thiss!1504)))))))

(declare-fun lt!112953 () Unit!6693)

(declare-fun e!145579 () Unit!6693)

(assert (=> b!224242 (= lt!112953 e!145579)))

(declare-fun c!37184 () Bool)

(assert (=> b!224242 (= c!37184 lt!112955)))

(declare-fun arrayContainsKey!0 (array!10999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224242 (= lt!112955 (arrayContainsKey!0 (_keys!6259 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224243 () Bool)

(declare-fun e!145576 () Bool)

(assert (=> b!224243 (= e!145576 (not (contains!1534 Nil!3315 key!932)))))

(declare-fun b!224244 () Bool)

(declare-fun res!110307 () Bool)

(assert (=> b!224244 (=> (not res!110307) (not e!145570))))

(assert (=> b!224244 (= res!110307 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224245 () Bool)

(declare-fun e!145580 () Bool)

(declare-fun e!145571 () Bool)

(declare-fun mapRes!9991 () Bool)

(assert (=> b!224245 (= e!145580 (and e!145571 mapRes!9991))))

(declare-fun condMapEmpty!9991 () Bool)

(declare-fun mapDefault!9991 () ValueCell!2597)

(assert (=> b!224245 (= condMapEmpty!9991 (= (arr!5217 (_values!4189 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2597)) mapDefault!9991)))))

(declare-fun b!224246 () Bool)

(declare-fun res!110300 () Bool)

(assert (=> b!224246 (=> (not res!110300) (not e!145583))))

(declare-fun call!20867 () Bool)

(assert (=> b!224246 (= res!110300 call!20867)))

(assert (=> b!224246 (= e!145577 e!145583)))

(declare-fun b!224247 () Bool)

(declare-fun res!110302 () Bool)

(assert (=> b!224247 (=> (not res!110302) (not e!145568))))

(assert (=> b!224247 (= res!110302 (not (contains!1534 Nil!3315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224248 () Bool)

(declare-fun Unit!6696 () Unit!6693)

(assert (=> b!224248 (= e!145579 Unit!6696)))

(declare-fun b!224249 () Bool)

(declare-fun res!110306 () Bool)

(assert (=> b!224249 (=> (not res!110306) (not e!145568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224249 (= res!110306 (validKeyInArray!0 key!932))))

(declare-fun bm!20864 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20864 (= call!20867 (inRange!0 (ite c!37183 (index!5582 lt!112954) (index!5585 lt!112954)) (mask!10039 thiss!1504)))))

(declare-fun b!224250 () Bool)

(declare-fun res!110314 () Bool)

(assert (=> b!224250 (=> (not res!110314) (not e!145568))))

(assert (=> b!224250 (= res!110314 (not (contains!1534 Nil!3315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20865 () Bool)

(assert (=> bm!20865 (= call!20868 (arrayContainsKey!0 (_keys!6259 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!9991 () Bool)

(assert (=> mapIsEmpty!9991 mapRes!9991))

(declare-fun b!224251 () Bool)

(assert (=> b!224251 (= e!145581 e!145575)))

(declare-fun res!110313 () Bool)

(assert (=> b!224251 (= res!110313 call!20867)))

(assert (=> b!224251 (=> (not res!110313) (not e!145575))))

(declare-fun b!224252 () Bool)

(declare-fun Unit!6697 () Unit!6693)

(assert (=> b!224252 (= e!145579 Unit!6697)))

(declare-fun lt!112960 () Unit!6693)

(declare-fun lemmaArrayContainsKeyThenInListMap!77 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) (_ BitVec 32) Int) Unit!6693)

(assert (=> b!224252 (= lt!112960 (lemmaArrayContainsKeyThenInListMap!77 (_keys!6259 thiss!1504) (_values!4189 thiss!1504) (mask!10039 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4206 thiss!1504)))))

(assert (=> b!224252 false))

(declare-fun b!224253 () Bool)

(assert (=> b!224253 (= e!145569 e!145576)))

(declare-fun res!110299 () Bool)

(assert (=> b!224253 (=> (not res!110299) (not e!145576))))

(assert (=> b!224253 (= res!110299 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!224254 () Bool)

(assert (=> b!224254 (= e!145584 e!145578)))

(declare-fun res!110309 () Bool)

(assert (=> b!224254 (=> (not res!110309) (not e!145578))))

(assert (=> b!224254 (= res!110309 (inRange!0 index!297 (mask!10039 thiss!1504)))))

(declare-fun lt!112958 () Unit!6693)

(assert (=> b!224254 (= lt!112958 e!145573)))

(declare-fun c!37186 () Bool)

(declare-datatypes ((tuple2!4390 0))(
  ( (tuple2!4391 (_1!2206 (_ BitVec 64)) (_2!2206 V!7489)) )
))
(declare-datatypes ((List!3319 0))(
  ( (Nil!3316) (Cons!3315 (h!3963 tuple2!4390) (t!8269 List!3319)) )
))
(declare-datatypes ((ListLongMap!3293 0))(
  ( (ListLongMap!3294 (toList!1662 List!3319)) )
))
(declare-fun contains!1535 (ListLongMap!3293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1171 (array!10999 array!10997 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 32) Int) ListLongMap!3293)

(assert (=> b!224254 (= c!37186 (contains!1535 (getCurrentListMap!1171 (_keys!6259 thiss!1504) (_values!4189 thiss!1504) (mask!10039 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4206 thiss!1504)) key!932))))

(declare-fun b!224255 () Bool)

(declare-fun res!110301 () Bool)

(assert (=> b!224255 (=> (not res!110301) (not e!145568))))

(declare-fun noDuplicate!85 (List!3318) Bool)

(assert (=> b!224255 (= res!110301 (noDuplicate!85 Nil!3315))))

(declare-fun b!224256 () Bool)

(assert (=> b!224256 (= e!145571 tp_is_empty!5881)))

(declare-fun mapNonEmpty!9991 () Bool)

(declare-fun tp!21198 () Bool)

(assert (=> mapNonEmpty!9991 (= mapRes!9991 (and tp!21198 e!145572))))

(declare-fun mapRest!9991 () (Array (_ BitVec 32) ValueCell!2597))

(declare-fun mapKey!9991 () (_ BitVec 32))

(declare-fun mapValue!9991 () ValueCell!2597)

(assert (=> mapNonEmpty!9991 (= (arr!5217 (_values!4189 thiss!1504)) (store mapRest!9991 mapKey!9991 mapValue!9991))))

(declare-fun array_inv!3441 (array!10999) Bool)

(declare-fun array_inv!3442 (array!10997) Bool)

(assert (=> b!224257 (= e!145567 (and tp!21199 tp_is_empty!5881 (array_inv!3441 (_keys!6259 thiss!1504)) (array_inv!3442 (_values!4189 thiss!1504)) e!145580))))

(assert (= (and start!21956 res!110303) b!224244))

(assert (= (and b!224244 res!110307) b!224235))

(assert (= (and b!224235 res!110305) b!224254))

(assert (= (and b!224254 c!37186) b!224231))

(assert (= (and b!224254 (not c!37186)) b!224234))

(assert (= (and b!224234 c!37183) b!224246))

(assert (= (and b!224234 (not c!37183)) b!224236))

(assert (= (and b!224246 res!110300) b!224233))

(assert (= (and b!224233 res!110297) b!224230))

(assert (= (and b!224236 c!37185) b!224251))

(assert (= (and b!224236 (not c!37185)) b!224239))

(assert (= (and b!224251 res!110313) b!224237))

(assert (= (and b!224237 res!110310) b!224228))

(assert (= (or b!224246 b!224251) bm!20864))

(assert (= (or b!224230 b!224228) bm!20865))

(assert (= (and b!224254 res!110309) b!224242))

(assert (= (and b!224242 c!37184) b!224252))

(assert (= (and b!224242 (not c!37184)) b!224248))

(assert (= (and b!224242 res!110296) b!224255))

(assert (= (and b!224255 res!110301) b!224247))

(assert (= (and b!224247 res!110302) b!224250))

(assert (= (and b!224250 res!110314) b!224241))

(assert (= (and b!224241 res!110311) b!224229))

(assert (= (and b!224241 (not res!110315)) b!224253))

(assert (= (and b!224253 res!110299) b!224243))

(assert (= (and b!224241 res!110298) b!224240))

(assert (= (and b!224240 res!110308) b!224238))

(assert (= (and b!224238 res!110312) b!224249))

(assert (= (and b!224249 res!110306) b!224226))

(assert (= (and b!224226 res!110304) b!224227))

(assert (= (and b!224245 condMapEmpty!9991) mapIsEmpty!9991))

(assert (= (and b!224245 (not condMapEmpty!9991)) mapNonEmpty!9991))

(assert (= (and mapNonEmpty!9991 ((_ is ValueCellFull!2597) mapValue!9991)) b!224232))

(assert (= (and b!224245 ((_ is ValueCellFull!2597) mapDefault!9991)) b!224256))

(assert (= b!224257 b!224245))

(assert (= start!21956 b!224257))

(declare-fun m!246799 () Bool)

(assert (=> b!224227 m!246799))

(declare-fun m!246801 () Bool)

(assert (=> b!224249 m!246801))

(declare-fun m!246803 () Bool)

(assert (=> b!224234 m!246803))

(declare-fun m!246805 () Bool)

(assert (=> b!224235 m!246805))

(declare-fun m!246807 () Bool)

(assert (=> b!224233 m!246807))

(declare-fun m!246809 () Bool)

(assert (=> b!224240 m!246809))

(declare-fun m!246811 () Bool)

(assert (=> b!224252 m!246811))

(declare-fun m!246813 () Bool)

(assert (=> mapNonEmpty!9991 m!246813))

(declare-fun m!246815 () Bool)

(assert (=> b!224255 m!246815))

(declare-fun m!246817 () Bool)

(assert (=> start!21956 m!246817))

(declare-fun m!246819 () Bool)

(assert (=> b!224250 m!246819))

(declare-fun m!246821 () Bool)

(assert (=> b!224257 m!246821))

(declare-fun m!246823 () Bool)

(assert (=> b!224257 m!246823))

(declare-fun m!246825 () Bool)

(assert (=> bm!20865 m!246825))

(declare-fun m!246827 () Bool)

(assert (=> b!224231 m!246827))

(declare-fun m!246829 () Bool)

(assert (=> b!224237 m!246829))

(assert (=> b!224242 m!246825))

(assert (=> b!224229 m!246799))

(declare-fun m!246831 () Bool)

(assert (=> bm!20864 m!246831))

(assert (=> b!224243 m!246799))

(declare-fun m!246833 () Bool)

(assert (=> b!224247 m!246833))

(declare-fun m!246835 () Bool)

(assert (=> b!224254 m!246835))

(declare-fun m!246837 () Bool)

(assert (=> b!224254 m!246837))

(assert (=> b!224254 m!246837))

(declare-fun m!246839 () Bool)

(assert (=> b!224254 m!246839))

(check-sat (not b!224234) (not b!224235) (not bm!20864) (not b!224240) (not b!224257) (not bm!20865) (not b_next!6019) (not b!224252) (not b!224227) (not start!21956) (not b!224255) (not b!224229) (not b!224250) (not b!224242) (not b!224231) (not b!224254) (not mapNonEmpty!9991) (not b!224249) tp_is_empty!5881 (not b!224247) b_and!12891 (not b!224243))
(check-sat b_and!12891 (not b_next!6019))
