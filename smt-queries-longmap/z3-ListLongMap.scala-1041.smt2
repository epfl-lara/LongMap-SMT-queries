; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21932 () Bool)

(assert start!21932)

(declare-fun b!223299 () Bool)

(declare-fun b_free!5995 () Bool)

(declare-fun b_next!5995 () Bool)

(assert (=> b!223299 (= b_free!5995 (not b_next!5995))))

(declare-fun tp!21127 () Bool)

(declare-fun b_and!12907 () Bool)

(assert (=> b!223299 (= tp!21127 b_and!12907)))

(declare-fun b!223268 () Bool)

(declare-fun e!145058 () Bool)

(declare-fun e!145060 () Bool)

(assert (=> b!223268 (= e!145058 e!145060)))

(declare-fun res!109692 () Bool)

(assert (=> b!223268 (=> (not res!109692) (not e!145060))))

(declare-datatypes ((V!7457 0))(
  ( (V!7458 (val!2973 Int)) )
))
(declare-datatypes ((ValueCell!2585 0))(
  ( (ValueCellFull!2585 (v!4994 V!7457)) (EmptyCell!2585) )
))
(declare-datatypes ((array!10955 0))(
  ( (array!10956 (arr!5197 (Array (_ BitVec 32) ValueCell!2585)) (size!5530 (_ BitVec 32))) )
))
(declare-datatypes ((array!10957 0))(
  ( (array!10958 (arr!5198 (Array (_ BitVec 32) (_ BitVec 64))) (size!5531 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3070 0))(
  ( (LongMapFixedSize!3071 (defaultEntry!4194 Int) (mask!10020 (_ BitVec 32)) (extraKeys!3931 (_ BitVec 32)) (zeroValue!4035 V!7457) (minValue!4035 V!7457) (_size!1584 (_ BitVec 32)) (_keys!6248 array!10957) (_values!4177 array!10955) (_vacant!1584 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3070)

(assert (=> b!223268 (= res!109692 (and (bvslt (size!5531 (_keys!6248 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5531 (_keys!6248 thiss!1504)))))))

(declare-datatypes ((Unit!6662 0))(
  ( (Unit!6663) )
))
(declare-fun lt!112908 () Unit!6662)

(declare-fun e!145054 () Unit!6662)

(assert (=> b!223268 (= lt!112908 e!145054)))

(declare-fun c!37081 () Bool)

(declare-fun lt!112906 () Bool)

(assert (=> b!223268 (= c!37081 lt!112906)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223268 (= lt!112906 (arrayContainsKey!0 (_keys!6248 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223269 () Bool)

(declare-fun res!109695 () Bool)

(assert (=> b!223269 (=> (not res!109695) (not e!145060))))

(declare-fun e!145055 () Bool)

(assert (=> b!223269 (= res!109695 e!145055)))

(declare-fun res!109702 () Bool)

(assert (=> b!223269 (=> res!109702 e!145055)))

(declare-fun e!145052 () Bool)

(assert (=> b!223269 (= res!109702 e!145052)))

(declare-fun res!109705 () Bool)

(assert (=> b!223269 (=> (not res!109705) (not e!145052))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223269 (= res!109705 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun mapIsEmpty!9955 () Bool)

(declare-fun mapRes!9955 () Bool)

(assert (=> mapIsEmpty!9955 mapRes!9955))

(declare-fun b!223270 () Bool)

(declare-fun e!145046 () Bool)

(declare-datatypes ((SeekEntryResult!817 0))(
  ( (MissingZero!817 (index!5438 (_ BitVec 32))) (Found!817 (index!5439 (_ BitVec 32))) (Intermediate!817 (undefined!1629 Bool) (index!5440 (_ BitVec 32)) (x!23061 (_ BitVec 32))) (Undefined!817) (MissingVacant!817 (index!5441 (_ BitVec 32))) )
))
(declare-fun lt!112912 () SeekEntryResult!817)

(get-info :version)

(assert (=> b!223270 (= e!145046 ((_ is Undefined!817) lt!112912))))

(declare-fun b!223272 () Bool)

(declare-fun e!145049 () Bool)

(declare-fun tp_is_empty!5857 () Bool)

(assert (=> b!223272 (= e!145049 tp_is_empty!5857)))

(declare-fun b!223273 () Bool)

(declare-fun e!145050 () Unit!6662)

(declare-fun lt!112911 () Unit!6662)

(assert (=> b!223273 (= e!145050 lt!112911)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (array!10957 array!10955 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6662)

(assert (=> b!223273 (= lt!112911 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(declare-fun c!37079 () Bool)

(assert (=> b!223273 (= c!37079 ((_ is MissingZero!817) lt!112912))))

(declare-fun e!145048 () Bool)

(assert (=> b!223273 e!145048))

(declare-fun b!223274 () Bool)

(declare-fun res!109701 () Bool)

(assert (=> b!223274 (=> (not res!109701) (not e!145060))))

(declare-datatypes ((List!3222 0))(
  ( (Nil!3219) (Cons!3218 (h!3866 (_ BitVec 64)) (t!8173 List!3222)) )
))
(declare-fun arrayNoDuplicates!0 (array!10957 (_ BitVec 32) List!3222) Bool)

(assert (=> b!223274 (= res!109701 (arrayNoDuplicates!0 (_keys!6248 thiss!1504) #b00000000000000000000000000000000 Nil!3219))))

(declare-fun b!223275 () Bool)

(declare-fun res!109699 () Bool)

(declare-fun e!145053 () Bool)

(assert (=> b!223275 (=> (not res!109699) (not e!145053))))

(assert (=> b!223275 (= res!109699 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223276 () Bool)

(declare-fun res!109700 () Bool)

(assert (=> b!223276 (=> (not res!109700) (not e!145060))))

(declare-fun contains!1508 (List!3222 (_ BitVec 64)) Bool)

(assert (=> b!223276 (= res!109700 (not (contains!1508 Nil!3219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223277 () Bool)

(declare-fun res!109704 () Bool)

(assert (=> b!223277 (=> (not res!109704) (not e!145060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223277 (= res!109704 (validKeyInArray!0 key!932))))

(declare-fun bm!20804 () Bool)

(declare-fun call!20808 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20804 (= call!20808 (inRange!0 (ite c!37079 (index!5438 lt!112912) (index!5441 lt!112912)) (mask!10020 thiss!1504)))))

(declare-fun b!223278 () Bool)

(declare-fun res!109709 () Bool)

(assert (=> b!223278 (=> (not res!109709) (not e!145060))))

(assert (=> b!223278 (= res!109709 (not (contains!1508 Nil!3219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223279 () Bool)

(declare-fun e!145045 () Bool)

(declare-fun e!145044 () Bool)

(assert (=> b!223279 (= e!145045 (and e!145044 mapRes!9955))))

(declare-fun condMapEmpty!9955 () Bool)

(declare-fun mapDefault!9955 () ValueCell!2585)

(assert (=> b!223279 (= condMapEmpty!9955 (= (arr!5197 (_values!4177 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2585)) mapDefault!9955)))))

(declare-fun b!223280 () Bool)

(declare-fun res!109697 () Bool)

(assert (=> b!223280 (=> (not res!109697) (not e!145060))))

(assert (=> b!223280 (= res!109697 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5531 (_keys!6248 thiss!1504)))))))

(declare-fun b!223281 () Bool)

(declare-fun e!145056 () Bool)

(assert (=> b!223281 (= e!145056 e!145058)))

(declare-fun res!109708 () Bool)

(assert (=> b!223281 (=> (not res!109708) (not e!145058))))

(assert (=> b!223281 (= res!109708 (inRange!0 index!297 (mask!10020 thiss!1504)))))

(declare-fun lt!112909 () Unit!6662)

(assert (=> b!223281 (= lt!112909 e!145050)))

(declare-fun c!37078 () Bool)

(declare-datatypes ((tuple2!4322 0))(
  ( (tuple2!4323 (_1!2172 (_ BitVec 64)) (_2!2172 V!7457)) )
))
(declare-datatypes ((List!3223 0))(
  ( (Nil!3220) (Cons!3219 (h!3867 tuple2!4322) (t!8174 List!3223)) )
))
(declare-datatypes ((ListLongMap!3237 0))(
  ( (ListLongMap!3238 (toList!1634 List!3223)) )
))
(declare-fun contains!1509 (ListLongMap!3237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1166 (array!10957 array!10955 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 32) Int) ListLongMap!3237)

(assert (=> b!223281 (= c!37078 (contains!1509 (getCurrentListMap!1166 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4194 thiss!1504)) key!932))))

(declare-fun b!223282 () Bool)

(declare-fun e!145059 () Bool)

(declare-fun call!20807 () Bool)

(assert (=> b!223282 (= e!145059 (not call!20807))))

(declare-fun b!223283 () Bool)

(declare-fun Unit!6664 () Unit!6662)

(assert (=> b!223283 (= e!145050 Unit!6664)))

(declare-fun lt!112910 () Unit!6662)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!226 (array!10957 array!10955 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6662)

(assert (=> b!223283 (= lt!112910 (lemmaInListMapThenSeekEntryOrOpenFindsIt!226 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223283 false))

(declare-fun b!223284 () Bool)

(declare-fun res!109711 () Bool)

(assert (=> b!223284 (= res!109711 (= (select (arr!5198 (_keys!6248 thiss!1504)) (index!5441 lt!112912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145057 () Bool)

(assert (=> b!223284 (=> (not res!109711) (not e!145057))))

(declare-fun b!223285 () Bool)

(declare-fun res!109707 () Bool)

(assert (=> b!223285 (=> (not res!109707) (not e!145059))))

(assert (=> b!223285 (= res!109707 (= (select (arr!5198 (_keys!6248 thiss!1504)) (index!5438 lt!112912)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223286 () Bool)

(assert (=> b!223286 (= e!145046 e!145057)))

(declare-fun res!109693 () Bool)

(assert (=> b!223286 (= res!109693 call!20808)))

(assert (=> b!223286 (=> (not res!109693) (not e!145057))))

(declare-fun b!223271 () Bool)

(assert (=> b!223271 (= e!145057 (not call!20807))))

(declare-fun res!109694 () Bool)

(assert (=> start!21932 (=> (not res!109694) (not e!145053))))

(declare-fun valid!1244 (LongMapFixedSize!3070) Bool)

(assert (=> start!21932 (= res!109694 (valid!1244 thiss!1504))))

(assert (=> start!21932 e!145053))

(declare-fun e!145061 () Bool)

(assert (=> start!21932 e!145061))

(assert (=> start!21932 true))

(declare-fun b!223287 () Bool)

(assert (=> b!223287 (= e!145044 tp_is_empty!5857)))

(declare-fun b!223288 () Bool)

(declare-fun e!145047 () Bool)

(assert (=> b!223288 (= e!145047 (not (contains!1508 Nil!3219 key!932)))))

(declare-fun b!223289 () Bool)

(assert (=> b!223289 (= e!145055 e!145047)))

(declare-fun res!109706 () Bool)

(assert (=> b!223289 (=> (not res!109706) (not e!145047))))

(assert (=> b!223289 (= res!109706 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223290 () Bool)

(assert (=> b!223290 (= e!145060 false)))

(declare-fun lt!112907 () Bool)

(assert (=> b!223290 (= lt!112907 (contains!1508 Nil!3219 key!932))))

(declare-fun b!223291 () Bool)

(declare-fun res!109696 () Bool)

(assert (=> b!223291 (=> (not res!109696) (not e!145059))))

(assert (=> b!223291 (= res!109696 call!20808)))

(assert (=> b!223291 (= e!145048 e!145059)))

(declare-fun b!223292 () Bool)

(assert (=> b!223292 (= e!145053 e!145056)))

(declare-fun res!109703 () Bool)

(assert (=> b!223292 (=> (not res!109703) (not e!145056))))

(assert (=> b!223292 (= res!109703 (or (= lt!112912 (MissingZero!817 index!297)) (= lt!112912 (MissingVacant!817 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10957 (_ BitVec 32)) SeekEntryResult!817)

(assert (=> b!223292 (= lt!112912 (seekEntryOrOpen!0 key!932 (_keys!6248 thiss!1504) (mask!10020 thiss!1504)))))

(declare-fun bm!20805 () Bool)

(assert (=> bm!20805 (= call!20807 (arrayContainsKey!0 (_keys!6248 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223293 () Bool)

(declare-fun res!109710 () Bool)

(assert (=> b!223293 (=> (not res!109710) (not e!145060))))

(assert (=> b!223293 (= res!109710 (not lt!112906))))

(declare-fun b!223294 () Bool)

(declare-fun res!109698 () Bool)

(assert (=> b!223294 (=> (not res!109698) (not e!145060))))

(declare-fun noDuplicate!76 (List!3222) Bool)

(assert (=> b!223294 (= res!109698 (noDuplicate!76 Nil!3219))))

(declare-fun b!223295 () Bool)

(declare-fun Unit!6665 () Unit!6662)

(assert (=> b!223295 (= e!145054 Unit!6665)))

(declare-fun mapNonEmpty!9955 () Bool)

(declare-fun tp!21126 () Bool)

(assert (=> mapNonEmpty!9955 (= mapRes!9955 (and tp!21126 e!145049))))

(declare-fun mapValue!9955 () ValueCell!2585)

(declare-fun mapKey!9955 () (_ BitVec 32))

(declare-fun mapRest!9955 () (Array (_ BitVec 32) ValueCell!2585))

(assert (=> mapNonEmpty!9955 (= (arr!5197 (_values!4177 thiss!1504)) (store mapRest!9955 mapKey!9955 mapValue!9955))))

(declare-fun b!223296 () Bool)

(declare-fun c!37080 () Bool)

(assert (=> b!223296 (= c!37080 ((_ is MissingVacant!817) lt!112912))))

(assert (=> b!223296 (= e!145048 e!145046)))

(declare-fun b!223297 () Bool)

(declare-fun Unit!6666 () Unit!6662)

(assert (=> b!223297 (= e!145054 Unit!6666)))

(declare-fun lt!112905 () Unit!6662)

(declare-fun lemmaArrayContainsKeyThenInListMap!64 (array!10957 array!10955 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) (_ BitVec 32) Int) Unit!6662)

(assert (=> b!223297 (= lt!112905 (lemmaArrayContainsKeyThenInListMap!64 (_keys!6248 thiss!1504) (_values!4177 thiss!1504) (mask!10020 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223297 false))

(declare-fun b!223298 () Bool)

(assert (=> b!223298 (= e!145052 (contains!1508 Nil!3219 key!932))))

(declare-fun array_inv!3411 (array!10957) Bool)

(declare-fun array_inv!3412 (array!10955) Bool)

(assert (=> b!223299 (= e!145061 (and tp!21127 tp_is_empty!5857 (array_inv!3411 (_keys!6248 thiss!1504)) (array_inv!3412 (_values!4177 thiss!1504)) e!145045))))

(assert (= (and start!21932 res!109694) b!223275))

(assert (= (and b!223275 res!109699) b!223292))

(assert (= (and b!223292 res!109703) b!223281))

(assert (= (and b!223281 c!37078) b!223283))

(assert (= (and b!223281 (not c!37078)) b!223273))

(assert (= (and b!223273 c!37079) b!223291))

(assert (= (and b!223273 (not c!37079)) b!223296))

(assert (= (and b!223291 res!109696) b!223285))

(assert (= (and b!223285 res!109707) b!223282))

(assert (= (and b!223296 c!37080) b!223286))

(assert (= (and b!223296 (not c!37080)) b!223270))

(assert (= (and b!223286 res!109693) b!223284))

(assert (= (and b!223284 res!109711) b!223271))

(assert (= (or b!223291 b!223286) bm!20804))

(assert (= (or b!223282 b!223271) bm!20805))

(assert (= (and b!223281 res!109708) b!223268))

(assert (= (and b!223268 c!37081) b!223297))

(assert (= (and b!223268 (not c!37081)) b!223295))

(assert (= (and b!223268 res!109692) b!223294))

(assert (= (and b!223294 res!109698) b!223276))

(assert (= (and b!223276 res!109700) b!223278))

(assert (= (and b!223278 res!109709) b!223269))

(assert (= (and b!223269 res!109705) b!223298))

(assert (= (and b!223269 (not res!109702)) b!223289))

(assert (= (and b!223289 res!109706) b!223288))

(assert (= (and b!223269 res!109695) b!223274))

(assert (= (and b!223274 res!109701) b!223280))

(assert (= (and b!223280 res!109697) b!223277))

(assert (= (and b!223277 res!109704) b!223293))

(assert (= (and b!223293 res!109710) b!223290))

(assert (= (and b!223279 condMapEmpty!9955) mapIsEmpty!9955))

(assert (= (and b!223279 (not condMapEmpty!9955)) mapNonEmpty!9955))

(assert (= (and mapNonEmpty!9955 ((_ is ValueCellFull!2585) mapValue!9955)) b!223272))

(assert (= (and b!223279 ((_ is ValueCellFull!2585) mapDefault!9955)) b!223287))

(assert (= b!223299 b!223279))

(assert (= start!21932 b!223299))

(declare-fun m!247093 () Bool)

(assert (=> b!223277 m!247093))

(declare-fun m!247095 () Bool)

(assert (=> b!223288 m!247095))

(declare-fun m!247097 () Bool)

(assert (=> bm!20804 m!247097))

(declare-fun m!247099 () Bool)

(assert (=> b!223285 m!247099))

(declare-fun m!247101 () Bool)

(assert (=> b!223274 m!247101))

(declare-fun m!247103 () Bool)

(assert (=> b!223278 m!247103))

(declare-fun m!247105 () Bool)

(assert (=> b!223281 m!247105))

(declare-fun m!247107 () Bool)

(assert (=> b!223281 m!247107))

(assert (=> b!223281 m!247107))

(declare-fun m!247109 () Bool)

(assert (=> b!223281 m!247109))

(declare-fun m!247111 () Bool)

(assert (=> b!223283 m!247111))

(declare-fun m!247113 () Bool)

(assert (=> b!223292 m!247113))

(assert (=> b!223298 m!247095))

(declare-fun m!247115 () Bool)

(assert (=> b!223297 m!247115))

(declare-fun m!247117 () Bool)

(assert (=> b!223284 m!247117))

(declare-fun m!247119 () Bool)

(assert (=> b!223273 m!247119))

(assert (=> b!223290 m!247095))

(declare-fun m!247121 () Bool)

(assert (=> b!223299 m!247121))

(declare-fun m!247123 () Bool)

(assert (=> b!223299 m!247123))

(declare-fun m!247125 () Bool)

(assert (=> b!223276 m!247125))

(declare-fun m!247127 () Bool)

(assert (=> b!223268 m!247127))

(declare-fun m!247129 () Bool)

(assert (=> mapNonEmpty!9955 m!247129))

(declare-fun m!247131 () Bool)

(assert (=> b!223294 m!247131))

(declare-fun m!247133 () Bool)

(assert (=> start!21932 m!247133))

(assert (=> bm!20805 m!247127))

(check-sat (not b!223292) (not b!223277) (not bm!20805) (not mapNonEmpty!9955) (not b!223278) (not b!223288) (not b!223276) (not b!223290) (not b!223283) (not b!223298) b_and!12907 (not bm!20804) (not b!223274) (not b!223297) (not b!223268) (not b!223273) (not b!223281) (not b!223294) (not b_next!5995) (not start!21932) tp_is_empty!5857 (not b!223299))
(check-sat b_and!12907 (not b_next!5995))
