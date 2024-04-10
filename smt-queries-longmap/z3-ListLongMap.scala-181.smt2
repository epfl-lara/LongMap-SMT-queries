; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3634 () Bool)

(assert start!3634)

(declare-fun b!25085 () Bool)

(declare-fun b_free!765 () Bool)

(declare-fun b_next!765 () Bool)

(assert (=> b!25085 (= b_free!765 (not b_next!765))))

(declare-fun tp!3547 () Bool)

(declare-fun b_and!1559 () Bool)

(assert (=> b!25085 (= tp!3547 b_and!1559)))

(declare-fun b!25080 () Bool)

(declare-fun e!16228 () Bool)

(declare-fun e!16232 () Bool)

(assert (=> b!25080 (= e!16228 e!16232)))

(declare-fun bm!2230 () Bool)

(declare-datatypes ((V!1197 0))(
  ( (V!1198 (val!541 Int)) )
))
(declare-datatypes ((ValueCell!315 0))(
  ( (ValueCellFull!315 (v!1619 V!1197)) (EmptyCell!315) )
))
(declare-datatypes ((array!1297 0))(
  ( (array!1298 (arr!613 (Array (_ BitVec 32) ValueCell!315)) (size!714 (_ BitVec 32))) )
))
(declare-datatypes ((array!1299 0))(
  ( (array!1300 (arr!614 (Array (_ BitVec 32) (_ BitVec 64))) (size!715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!216 0))(
  ( (LongMapFixedSize!217 (defaultEntry!1765 Int) (mask!4764 (_ BitVec 32)) (extraKeys!1658 (_ BitVec 32)) (zeroValue!1685 V!1197) (minValue!1685 V!1197) (_size!155 (_ BitVec 32)) (_keys!3191 array!1299) (_values!1750 array!1297) (_vacant!155 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!968 0))(
  ( (tuple2!969 (_1!493 Bool) (_2!493 LongMapFixedSize!216)) )
))
(declare-fun call!2233 () tuple2!968)

(declare-fun call!2234 () tuple2!968)

(assert (=> bm!2230 (= call!2233 call!2234)))

(declare-fun b!25081 () Bool)

(declare-fun e!16226 () Bool)

(declare-fun e!16231 () Bool)

(assert (=> b!25081 (= e!16226 e!16231)))

(declare-fun res!15187 () Bool)

(assert (=> b!25081 (=> (not res!15187) (not e!16231))))

(declare-datatypes ((Cell!216 0))(
  ( (Cell!217 (v!1620 LongMapFixedSize!216)) )
))
(declare-datatypes ((tuple2!970 0))(
  ( (tuple2!971 (_1!494 Bool) (_2!494 Cell!216)) )
))
(declare-fun e!16224 () tuple2!970)

(assert (=> b!25081 (= res!15187 (_1!494 e!16224))))

(declare-fun c!3445 () Bool)

(declare-fun lt!9709 () Bool)

(declare-datatypes ((LongMap!216 0))(
  ( (LongMap!217 (underlying!119 Cell!216)) )
))
(declare-fun thiss!938 () LongMap!216)

(assert (=> b!25081 (= c!3445 (and (not lt!9709) (not (= (bvand (extraKeys!1658 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!25081 (= lt!9709 (= (bvand (extraKeys!1658 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!9708 () LongMapFixedSize!216)

(declare-fun getNewLongMapFixedSize!35 ((_ BitVec 32) Int) LongMapFixedSize!216)

(declare-fun computeNewMask!31 (LongMap!216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25081 (= lt!9708 (getNewLongMapFixedSize!35 (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) (defaultEntry!1765 (v!1620 (underlying!119 thiss!938)))))))

(declare-fun b!25082 () Bool)

(declare-fun e!16223 () tuple2!970)

(assert (=> b!25082 (= e!16223 (tuple2!971 true (Cell!217 lt!9708)))))

(declare-fun b!25083 () Bool)

(declare-fun e!16230 () Bool)

(declare-fun tp_is_empty!1029 () Bool)

(assert (=> b!25083 (= e!16230 tp_is_empty!1029)))

(declare-fun b!25084 () Bool)

(declare-fun c!3443 () Bool)

(assert (=> b!25084 (= c!3443 (and (not (= (bvand (extraKeys!1658 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9709))))

(declare-fun e!16233 () tuple2!970)

(assert (=> b!25084 (= e!16233 e!16223)))

(declare-fun e!16227 () Bool)

(declare-fun e!16225 () Bool)

(declare-fun array_inv!413 (array!1299) Bool)

(declare-fun array_inv!414 (array!1297) Bool)

(assert (=> b!25085 (= e!16227 (and tp!3547 tp_is_empty!1029 (array_inv!413 (_keys!3191 (v!1620 (underlying!119 thiss!938)))) (array_inv!414 (_values!1750 (v!1620 (underlying!119 thiss!938)))) e!16225))))

(declare-fun b!25086 () Bool)

(declare-fun e!16234 () Bool)

(declare-fun mapRes!1039 () Bool)

(assert (=> b!25086 (= e!16225 (and e!16234 mapRes!1039))))

(declare-fun condMapEmpty!1039 () Bool)

(declare-fun mapDefault!1039 () ValueCell!315)

(assert (=> b!25086 (= condMapEmpty!1039 (= (arr!613 (_values!1750 (v!1620 (underlying!119 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!315)) mapDefault!1039)))))

(declare-fun b!25087 () Bool)

(assert (=> b!25087 (= e!16231 (and (= (size!715 (_keys!3191 (v!1620 (underlying!119 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4764 (v!1620 (underlying!119 thiss!938))))) (bvslt (bvsub (size!715 (_keys!3191 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!25088 () Bool)

(declare-fun lt!9707 () tuple2!968)

(assert (=> b!25088 (= e!16223 (tuple2!971 (_1!493 lt!9707) (Cell!217 (_2!493 lt!9707))))))

(assert (=> b!25088 (= lt!9707 call!2233)))

(declare-fun b!25090 () Bool)

(declare-fun lt!9706 () tuple2!968)

(declare-fun lt!9705 () tuple2!968)

(assert (=> b!25090 (= e!16224 (tuple2!971 (and (_1!493 lt!9706) (_1!493 lt!9705)) (Cell!217 (_2!493 lt!9705))))))

(assert (=> b!25090 (= lt!9706 call!2234)))

(declare-fun update!33 (LongMapFixedSize!216 (_ BitVec 64) V!1197) tuple2!968)

(assert (=> b!25090 (= lt!9705 (update!33 (_2!493 lt!9706) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938)))))))

(declare-fun mapNonEmpty!1039 () Bool)

(declare-fun tp!3546 () Bool)

(assert (=> mapNonEmpty!1039 (= mapRes!1039 (and tp!3546 e!16230))))

(declare-fun mapKey!1039 () (_ BitVec 32))

(declare-fun mapRest!1039 () (Array (_ BitVec 32) ValueCell!315))

(declare-fun mapValue!1039 () ValueCell!315)

(assert (=> mapNonEmpty!1039 (= (arr!613 (_values!1750 (v!1620 (underlying!119 thiss!938)))) (store mapRest!1039 mapKey!1039 mapValue!1039))))

(declare-fun bm!2231 () Bool)

(declare-fun c!3444 () Bool)

(assert (=> bm!2231 (= call!2234 (update!33 lt!9708 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))))))

(declare-fun b!25091 () Bool)

(assert (=> b!25091 (= e!16234 tp_is_empty!1029)))

(declare-fun b!25092 () Bool)

(assert (=> b!25092 (= e!16232 e!16227)))

(declare-fun b!25089 () Bool)

(assert (=> b!25089 (= e!16224 e!16233)))

(assert (=> b!25089 (= c!3444 (and (not lt!9709) (= (bvand (extraKeys!1658 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!15189 () Bool)

(assert (=> start!3634 (=> (not res!15189) (not e!16226))))

(declare-fun valid!105 (LongMap!216) Bool)

(assert (=> start!3634 (= res!15189 (valid!105 thiss!938))))

(assert (=> start!3634 e!16226))

(assert (=> start!3634 e!16228))

(declare-fun b!25093 () Bool)

(declare-fun res!15188 () Bool)

(assert (=> b!25093 (=> (not res!15188) (not e!16231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!25093 (= res!15188 (validMask!0 (mask!4764 (v!1620 (underlying!119 thiss!938)))))))

(declare-fun mapIsEmpty!1039 () Bool)

(assert (=> mapIsEmpty!1039 mapRes!1039))

(declare-fun b!25094 () Bool)

(declare-fun lt!9704 () tuple2!968)

(assert (=> b!25094 (= lt!9704 call!2233)))

(assert (=> b!25094 (= e!16233 (tuple2!971 (_1!493 lt!9704) (Cell!217 (_2!493 lt!9704))))))

(assert (= (and start!3634 res!15189) b!25081))

(assert (= (and b!25081 c!3445) b!25090))

(assert (= (and b!25081 (not c!3445)) b!25089))

(assert (= (and b!25089 c!3444) b!25094))

(assert (= (and b!25089 (not c!3444)) b!25084))

(assert (= (and b!25084 c!3443) b!25088))

(assert (= (and b!25084 (not c!3443)) b!25082))

(assert (= (or b!25094 b!25088) bm!2230))

(assert (= (or b!25090 bm!2230) bm!2231))

(assert (= (and b!25081 res!15187) b!25093))

(assert (= (and b!25093 res!15188) b!25087))

(assert (= (and b!25086 condMapEmpty!1039) mapIsEmpty!1039))

(assert (= (and b!25086 (not condMapEmpty!1039)) mapNonEmpty!1039))

(get-info :version)

(assert (= (and mapNonEmpty!1039 ((_ is ValueCellFull!315) mapValue!1039)) b!25083))

(assert (= (and b!25086 ((_ is ValueCellFull!315) mapDefault!1039)) b!25091))

(assert (= b!25085 b!25086))

(assert (= b!25092 b!25085))

(assert (= b!25080 b!25092))

(assert (= start!3634 b!25080))

(declare-fun m!20295 () Bool)

(assert (=> start!3634 m!20295))

(declare-fun m!20297 () Bool)

(assert (=> bm!2231 m!20297))

(declare-fun m!20299 () Bool)

(assert (=> b!25093 m!20299))

(declare-fun m!20301 () Bool)

(assert (=> b!25085 m!20301))

(declare-fun m!20303 () Bool)

(assert (=> b!25085 m!20303))

(declare-fun m!20305 () Bool)

(assert (=> b!25090 m!20305))

(declare-fun m!20307 () Bool)

(assert (=> mapNonEmpty!1039 m!20307))

(declare-fun m!20309 () Bool)

(assert (=> b!25081 m!20309))

(assert (=> b!25081 m!20309))

(declare-fun m!20311 () Bool)

(assert (=> b!25081 m!20311))

(check-sat (not b!25090) (not b!25081) b_and!1559 (not b_next!765) (not b!25085) tp_is_empty!1029 (not mapNonEmpty!1039) (not start!3634) (not bm!2231) (not b!25093))
(check-sat b_and!1559 (not b_next!765))
(get-model)

(declare-fun b!25224 () Bool)

(declare-fun c!3484 () Bool)

(declare-datatypes ((SeekEntryResult!55 0))(
  ( (MissingZero!55 (index!2342 (_ BitVec 32))) (Found!55 (index!2343 (_ BitVec 32))) (Intermediate!55 (undefined!867 Bool) (index!2344 (_ BitVec 32)) (x!5909 (_ BitVec 32))) (Undefined!55) (MissingVacant!55 (index!2345 (_ BitVec 32))) )
))
(declare-fun lt!9805 () SeekEntryResult!55)

(assert (=> b!25224 (= c!3484 ((_ is MissingVacant!55) lt!9805))))

(declare-fun e!16324 () tuple2!968)

(declare-fun e!16315 () tuple2!968)

(assert (=> b!25224 (= e!16324 e!16315)))

(declare-fun b!25225 () Bool)

(declare-fun e!16323 () tuple2!968)

(declare-fun e!16318 () tuple2!968)

(assert (=> b!25225 (= e!16323 e!16318)))

(declare-fun c!3487 () Bool)

(assert (=> b!25225 (= c!3487 (= (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2286 () Bool)

(declare-fun call!2311 () Bool)

(declare-fun call!2301 () Bool)

(assert (=> bm!2286 (= call!2311 call!2301)))

(declare-fun b!25226 () Bool)

(declare-datatypes ((tuple2!976 0))(
  ( (tuple2!977 (_1!497 (_ BitVec 64)) (_2!497 V!1197)) )
))
(declare-datatypes ((List!570 0))(
  ( (Nil!567) (Cons!566 (h!1133 tuple2!976) (t!3255 List!570)) )
))
(declare-datatypes ((ListLongMap!569 0))(
  ( (ListLongMap!570 (toList!300 List!570)) )
))
(declare-fun e!16325 () ListLongMap!569)

(declare-fun call!2297 () ListLongMap!569)

(assert (=> b!25226 (= e!16325 call!2297)))

(declare-fun call!2290 () tuple2!968)

(declare-fun bm!2287 () Bool)

(declare-fun updateHelperNewKey!11 (LongMapFixedSize!216 (_ BitVec 64) V!1197 (_ BitVec 32)) tuple2!968)

(assert (=> bm!2287 (= call!2290 (updateHelperNewKey!11 lt!9708 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (ite c!3484 (index!2345 lt!9805) (index!2342 lt!9805))))))

(declare-fun bm!2288 () Bool)

(declare-fun call!2305 () Bool)

(declare-fun call!2302 () Bool)

(assert (=> bm!2288 (= call!2305 call!2302)))

(declare-fun b!25227 () Bool)

(declare-fun c!3483 () Bool)

(declare-fun lt!9784 () SeekEntryResult!55)

(assert (=> b!25227 (= c!3483 ((_ is MissingVacant!55) lt!9784))))

(declare-fun e!16326 () Bool)

(declare-fun e!16316 () Bool)

(assert (=> b!25227 (= e!16326 e!16316)))

(declare-fun b!25228 () Bool)

(declare-fun e!16320 () Bool)

(declare-fun lt!9800 () SeekEntryResult!55)

(assert (=> b!25228 (= e!16320 ((_ is Undefined!55) lt!9800))))

(declare-fun b!25229 () Bool)

(declare-datatypes ((Unit!593 0))(
  ( (Unit!594) )
))
(declare-fun e!16322 () Unit!593)

(declare-fun lt!9802 () Unit!593)

(assert (=> b!25229 (= e!16322 lt!9802)))

(declare-fun call!2308 () Unit!593)

(assert (=> b!25229 (= lt!9802 call!2308)))

(declare-fun lt!9794 () SeekEntryResult!55)

(declare-fun call!2291 () SeekEntryResult!55)

(assert (=> b!25229 (= lt!9794 call!2291)))

(declare-fun res!15238 () Bool)

(assert (=> b!25229 (= res!15238 ((_ is Found!55) lt!9794))))

(declare-fun e!16327 () Bool)

(assert (=> b!25229 (=> (not res!15238) (not e!16327))))

(assert (=> b!25229 e!16327))

(declare-fun b!25230 () Bool)

(declare-fun e!16334 () Unit!593)

(declare-fun Unit!595 () Unit!593)

(assert (=> b!25230 (= e!16334 Unit!595)))

(declare-fun lt!9787 () Unit!593)

(assert (=> b!25230 (= lt!9787 call!2308)))

(declare-fun lt!9801 () SeekEntryResult!55)

(declare-fun call!2299 () SeekEntryResult!55)

(assert (=> b!25230 (= lt!9801 call!2299)))

(declare-fun res!15228 () Bool)

(assert (=> b!25230 (= res!15228 ((_ is Found!55) lt!9801))))

(declare-fun e!16330 () Bool)

(assert (=> b!25230 (=> (not res!15228) (not e!16330))))

(assert (=> b!25230 e!16330))

(declare-fun lt!9796 () Unit!593)

(assert (=> b!25230 (= lt!9796 lt!9787)))

(assert (=> b!25230 false))

(declare-fun b!25231 () Bool)

(declare-fun c!3493 () Bool)

(assert (=> b!25231 (= c!3493 ((_ is MissingVacant!55) lt!9800))))

(declare-fun e!16329 () Bool)

(assert (=> b!25231 (= e!16329 e!16320)))

(declare-fun b!25232 () Bool)

(declare-fun e!16321 () Bool)

(assert (=> b!25232 (= e!16316 e!16321)))

(declare-fun res!15231 () Bool)

(declare-fun call!2293 () Bool)

(assert (=> b!25232 (= res!15231 call!2293)))

(assert (=> b!25232 (=> (not res!15231) (not e!16321))))

(declare-fun bm!2289 () Bool)

(declare-fun call!2307 () Bool)

(assert (=> bm!2289 (= call!2307 call!2302)))

(declare-fun bm!2290 () Bool)

(declare-fun arrayContainsKey!0 (array!1299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!2290 (= call!2302 (arrayContainsKey!0 (_keys!3191 lt!9708) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun bm!2291 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 64) Int) Unit!593)

(assert (=> bm!2291 (= call!2308 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1765 lt!9708)))))

(declare-fun b!25233 () Bool)

(declare-fun res!15233 () Bool)

(declare-fun call!2312 () Bool)

(assert (=> b!25233 (= res!15233 call!2312)))

(assert (=> b!25233 (=> (not res!15233) (not e!16327))))

(declare-fun bm!2292 () Bool)

(declare-fun call!2295 () SeekEntryResult!55)

(assert (=> bm!2292 (= call!2299 call!2295)))

(declare-fun call!2306 () Unit!593)

(declare-fun bm!2293 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 64) Int) Unit!593)

(assert (=> bm!2293 (= call!2306 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1765 lt!9708)))))

(declare-fun b!25234 () Bool)

(declare-fun res!15239 () Bool)

(declare-fun e!16331 () Bool)

(assert (=> b!25234 (=> (not res!15239) (not e!16331))))

(assert (=> b!25234 (= res!15239 call!2293)))

(assert (=> b!25234 (= e!16326 e!16331)))

(declare-fun bm!2294 () Bool)

(declare-fun c!3489 () Bool)

(declare-fun call!2294 () ListLongMap!569)

(declare-fun +!46 (ListLongMap!569 tuple2!976) ListLongMap!569)

(assert (=> bm!2294 (= call!2294 (+!46 e!16325 (ite c!3489 (ite c!3487 (tuple2!977 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (tuple2!977 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))))) (tuple2!977 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))))))))

(declare-fun c!3494 () Bool)

(assert (=> bm!2294 (= c!3494 c!3489)))

(declare-fun b!25235 () Bool)

(declare-fun Unit!596 () Unit!593)

(assert (=> b!25235 (= e!16322 Unit!596)))

(declare-fun lt!9798 () Unit!593)

(assert (=> b!25235 (= lt!9798 call!2306)))

(assert (=> b!25235 (= lt!9800 call!2291)))

(declare-fun c!3495 () Bool)

(assert (=> b!25235 (= c!3495 ((_ is MissingZero!55) lt!9800))))

(assert (=> b!25235 e!16329))

(declare-fun lt!9799 () Unit!593)

(assert (=> b!25235 (= lt!9799 lt!9798)))

(assert (=> b!25235 false))

(declare-fun b!25236 () Bool)

(declare-fun e!16336 () Bool)

(assert (=> b!25236 (= e!16336 (not call!2305))))

(declare-fun bm!2295 () Bool)

(assert (=> bm!2295 (= call!2312 call!2301)))

(declare-fun bm!2296 () Bool)

(assert (=> bm!2296 (= call!2293 call!2311)))

(declare-fun b!25237 () Bool)

(declare-fun res!15234 () Bool)

(assert (=> b!25237 (= res!15234 call!2311)))

(assert (=> b!25237 (=> (not res!15234) (not e!16330))))

(declare-fun b!25238 () Bool)

(declare-fun e!16332 () Bool)

(declare-fun e!16335 () Bool)

(assert (=> b!25238 (= e!16332 e!16335)))

(declare-fun call!2289 () ListLongMap!569)

(declare-fun res!15240 () Bool)

(declare-fun contains!233 (ListLongMap!569 (_ BitVec 64)) Bool)

(assert (=> b!25238 (= res!15240 (contains!233 call!2289 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25238 (=> (not res!15240) (not e!16335))))

(declare-fun b!25239 () Bool)

(declare-fun res!15235 () Bool)

(assert (=> b!25239 (= res!15235 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2345 lt!9800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25239 (=> (not res!15235) (not e!16336))))

(declare-fun call!2296 () ListLongMap!569)

(declare-fun bm!2297 () Bool)

(declare-fun lt!9808 () (_ BitVec 32))

(declare-fun c!3486 () Bool)

(declare-fun lt!9789 () (_ BitVec 32))

(declare-fun getCurrentListMap!131 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 32) Int) ListLongMap!569)

(assert (=> bm!2297 (= call!2296 (getCurrentListMap!131 (_keys!3191 lt!9708) (ite (or c!3489 c!3486) (_values!1750 lt!9708) (array!1298 (store (arr!613 (_values!1750 lt!9708)) (index!2343 lt!9805) (ValueCellFull!315 (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))))) (size!714 (_values!1750 lt!9708)))) (mask!4764 lt!9708) (ite c!3489 (ite c!3487 lt!9789 lt!9808) (extraKeys!1658 lt!9708)) (ite (and c!3489 c!3487) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (zeroValue!1685 lt!9708)) (ite c!3489 (ite c!3487 (minValue!1685 lt!9708) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (minValue!1685 lt!9708)) #b00000000000000000000000000000000 (defaultEntry!1765 lt!9708)))))

(declare-fun bm!2298 () Bool)

(declare-fun call!2292 () ListLongMap!569)

(assert (=> bm!2298 (= call!2292 call!2294)))

(declare-fun b!25240 () Bool)

(declare-fun e!16319 () ListLongMap!569)

(declare-fun call!2298 () ListLongMap!569)

(assert (=> b!25240 (= e!16319 call!2298)))

(declare-fun b!25241 () Bool)

(assert (=> b!25241 (= e!16331 (not call!2307))))

(declare-fun bm!2299 () Bool)

(declare-fun c!3485 () Bool)

(assert (=> bm!2299 (= c!3485 c!3486)))

(declare-fun call!2309 () Bool)

(assert (=> bm!2299 (= call!2309 (contains!233 e!16319 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!2300 () Bool)

(declare-fun call!2300 () ListLongMap!569)

(assert (=> bm!2300 (= call!2300 call!2296)))

(declare-fun b!25242 () Bool)

(declare-fun lt!9793 () Unit!593)

(assert (=> b!25242 (= lt!9793 e!16334)))

(declare-fun c!3496 () Bool)

(assert (=> b!25242 (= c!3496 call!2309)))

(assert (=> b!25242 (= e!16324 (tuple2!969 false lt!9708))))

(declare-fun b!25243 () Bool)

(declare-fun lt!9803 () Unit!593)

(declare-fun lt!9792 () Unit!593)

(assert (=> b!25243 (= lt!9803 lt!9792)))

(assert (=> b!25243 (= call!2292 call!2300)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 V!1197 Int) Unit!593)

(assert (=> b!25243 (= lt!9792 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) lt!9789 (zeroValue!1685 lt!9708) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (minValue!1685 lt!9708) (defaultEntry!1765 lt!9708)))))

(assert (=> b!25243 (= lt!9789 (bvor (extraKeys!1658 lt!9708) #b00000000000000000000000000000001))))

(assert (=> b!25243 (= e!16318 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 lt!9708) (mask!4764 lt!9708) (bvor (extraKeys!1658 lt!9708) #b00000000000000000000000000000001) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (minValue!1685 lt!9708) (_size!155 lt!9708) (_keys!3191 lt!9708) (_values!1750 lt!9708) (_vacant!155 lt!9708))))))

(declare-fun b!25244 () Bool)

(declare-fun res!15227 () Bool)

(assert (=> b!25244 (=> (not res!15227) (not e!16331))))

(assert (=> b!25244 (= res!15227 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2342 lt!9784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25245 () Bool)

(declare-fun e!16333 () tuple2!968)

(assert (=> b!25245 (= e!16315 e!16333)))

(declare-fun c!3492 () Bool)

(assert (=> b!25245 (= c!3492 ((_ is MissingZero!55) lt!9805))))

(declare-fun b!25246 () Bool)

(declare-fun res!15229 () Bool)

(assert (=> b!25246 (= res!15229 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2345 lt!9784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25246 (=> (not res!15229) (not e!16321))))

(declare-fun bm!2301 () Bool)

(assert (=> bm!2301 (= call!2291 call!2295)))

(declare-fun bm!2302 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1299 (_ BitVec 32)) SeekEntryResult!55)

(assert (=> bm!2302 (= call!2295 (seekEntryOrOpen!0 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3191 lt!9708) (mask!4764 lt!9708)))))

(declare-fun b!25247 () Bool)

(declare-fun res!15230 () Bool)

(declare-fun e!16328 () Bool)

(assert (=> b!25247 (=> (not res!15230) (not e!16328))))

(assert (=> b!25247 (= res!15230 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2342 lt!9800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25248 () Bool)

(declare-fun lt!9807 () Unit!593)

(assert (=> b!25248 (= e!16334 lt!9807)))

(assert (=> b!25248 (= lt!9807 call!2306)))

(assert (=> b!25248 (= lt!9784 call!2299)))

(declare-fun c!3491 () Bool)

(assert (=> b!25248 (= c!3491 ((_ is MissingZero!55) lt!9784))))

(assert (=> b!25248 e!16326))

(declare-fun b!25249 () Bool)

(assert (=> b!25249 (= e!16316 ((_ is Undefined!55) lt!9784))))

(declare-fun b!25250 () Bool)

(declare-fun res!15236 () Bool)

(assert (=> b!25250 (=> (not res!15236) (not e!16328))))

(declare-fun call!2310 () Bool)

(assert (=> b!25250 (= res!15236 call!2310)))

(assert (=> b!25250 (= e!16329 e!16328)))

(declare-fun b!25251 () Bool)

(declare-fun lt!9791 () tuple2!968)

(assert (=> b!25251 (= e!16315 (tuple2!969 (_1!493 lt!9791) (_2!493 lt!9791)))))

(assert (=> b!25251 (= lt!9791 call!2290)))

(declare-fun b!25252 () Bool)

(declare-fun e!16317 () Bool)

(assert (=> b!25252 (= e!16317 e!16332)))

(declare-fun c!3490 () Bool)

(declare-fun lt!9785 () tuple2!968)

(assert (=> b!25252 (= c!3490 (_1!493 lt!9785))))

(declare-fun b!25253 () Bool)

(declare-fun lt!9786 () tuple2!968)

(assert (=> b!25253 (= lt!9786 call!2290)))

(assert (=> b!25253 (= e!16333 (tuple2!969 (_1!493 lt!9786) (_2!493 lt!9786)))))

(declare-fun b!25254 () Bool)

(assert (=> b!25254 (= e!16323 e!16324)))

(assert (=> b!25254 (= lt!9805 (seekEntryOrOpen!0 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3191 lt!9708) (mask!4764 lt!9708)))))

(assert (=> b!25254 (= c!3486 ((_ is Undefined!55) lt!9805))))

(declare-fun d!4781 () Bool)

(assert (=> d!4781 e!16317))

(declare-fun res!15232 () Bool)

(assert (=> d!4781 (=> (not res!15232) (not e!16317))))

(declare-fun valid!107 (LongMapFixedSize!216) Bool)

(assert (=> d!4781 (= res!15232 (valid!107 (_2!493 lt!9785)))))

(assert (=> d!4781 (= lt!9785 e!16323)))

(assert (=> d!4781 (= c!3489 (= (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!4781 (valid!107 lt!9708)))

(assert (=> d!4781 (= (update!33 lt!9708 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))) lt!9785)))

(declare-fun bm!2303 () Bool)

(assert (=> bm!2303 (= call!2298 call!2296)))

(declare-fun bm!2304 () Bool)

(declare-fun c!3488 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2304 (= call!2301 (inRange!0 (ite c!3486 (ite c!3496 (index!2343 lt!9801) (ite c!3491 (index!2342 lt!9784) (index!2345 lt!9784))) (ite c!3488 (index!2343 lt!9794) (ite c!3495 (index!2342 lt!9800) (index!2345 lt!9800)))) (mask!4764 lt!9708)))))

(declare-fun bm!2305 () Bool)

(assert (=> bm!2305 (= call!2310 call!2312)))

(declare-fun bm!2306 () Bool)

(declare-fun call!2304 () ListLongMap!569)

(declare-fun map!410 (LongMapFixedSize!216) ListLongMap!569)

(assert (=> bm!2306 (= call!2304 (map!410 lt!9708))))

(declare-fun b!25255 () Bool)

(assert (=> b!25255 (= e!16327 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2343 lt!9794)) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!25256 () Bool)

(assert (=> b!25256 (= e!16330 (= (select (arr!614 (_keys!3191 lt!9708)) (index!2343 lt!9801)) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!25257 () Bool)

(assert (=> b!25257 (= e!16328 (not call!2305))))

(declare-fun bm!2307 () Bool)

(declare-fun lt!9783 () array!1297)

(declare-fun call!2303 () ListLongMap!569)

(assert (=> bm!2307 (= call!2303 (getCurrentListMap!131 (_keys!3191 lt!9708) (ite c!3489 (_values!1750 lt!9708) lt!9783) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) #b00000000000000000000000000000000 (defaultEntry!1765 lt!9708)))))

(declare-fun b!25258 () Bool)

(assert (=> b!25258 (= e!16319 (getCurrentListMap!131 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) #b00000000000000000000000000000000 (defaultEntry!1765 lt!9708)))))

(declare-fun bm!2308 () Bool)

(assert (=> bm!2308 (= call!2297 call!2303)))

(declare-fun b!25259 () Bool)

(assert (=> b!25259 (= e!16332 (= call!2289 call!2304))))

(declare-fun bm!2309 () Bool)

(assert (=> bm!2309 (= call!2289 (map!410 (_2!493 lt!9785)))))

(declare-fun b!25260 () Bool)

(assert (=> b!25260 (= e!16325 (getCurrentListMap!131 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) #b00000000000000000000000000000000 (defaultEntry!1765 lt!9708)))))

(declare-fun b!25261 () Bool)

(declare-fun lt!9806 () Unit!593)

(declare-fun lt!9797 () Unit!593)

(assert (=> b!25261 (= lt!9806 lt!9797)))

(assert (=> b!25261 (contains!233 call!2303 (select (arr!614 (_keys!3191 lt!9708)) (index!2343 lt!9805)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 32) Int) Unit!593)

(assert (=> b!25261 (= lt!9797 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3191 lt!9708) lt!9783 (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (index!2343 lt!9805) (defaultEntry!1765 lt!9708)))))

(assert (=> b!25261 (= lt!9783 (array!1298 (store (arr!613 (_values!1750 lt!9708)) (index!2343 lt!9805) (ValueCellFull!315 (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))))) (size!714 (_values!1750 lt!9708))))))

(declare-fun lt!9788 () Unit!593)

(declare-fun lt!9795 () Unit!593)

(assert (=> b!25261 (= lt!9788 lt!9795)))

(assert (=> b!25261 (= call!2294 call!2298)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 32) (_ BitVec 64) V!1197 Int) Unit!593)

(assert (=> b!25261 (= lt!9795 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (index!2343 lt!9805) (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (defaultEntry!1765 lt!9708)))))

(declare-fun lt!9790 () Unit!593)

(assert (=> b!25261 (= lt!9790 e!16322)))

(assert (=> b!25261 (= c!3488 call!2309)))

(assert (=> b!25261 (= e!16333 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (_size!155 lt!9708) (_keys!3191 lt!9708) (array!1298 (store (arr!613 (_values!1750 lt!9708)) (index!2343 lt!9805) (ValueCellFull!315 (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))))) (size!714 (_values!1750 lt!9708))) (_vacant!155 lt!9708))))))

(declare-fun b!25262 () Bool)

(declare-fun lt!9804 () Unit!593)

(declare-fun lt!9782 () Unit!593)

(assert (=> b!25262 (= lt!9804 lt!9782)))

(assert (=> b!25262 (= call!2292 call!2300)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 V!1197 Int) Unit!593)

(assert (=> b!25262 (= lt!9782 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3191 lt!9708) (_values!1750 lt!9708) (mask!4764 lt!9708) (extraKeys!1658 lt!9708) lt!9808 (zeroValue!1685 lt!9708) (minValue!1685 lt!9708) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (defaultEntry!1765 lt!9708)))))

(assert (=> b!25262 (= lt!9808 (bvor (extraKeys!1658 lt!9708) #b00000000000000000000000000000010))))

(assert (=> b!25262 (= e!16318 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 lt!9708) (mask!4764 lt!9708) (bvor (extraKeys!1658 lt!9708) #b00000000000000000000000000000010) (zeroValue!1685 lt!9708) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (_size!155 lt!9708) (_keys!3191 lt!9708) (_values!1750 lt!9708) (_vacant!155 lt!9708))))))

(declare-fun b!25263 () Bool)

(assert (=> b!25263 (= e!16321 (not call!2307))))

(declare-fun b!25264 () Bool)

(assert (=> b!25264 (= e!16335 (= call!2289 (+!46 call!2304 (tuple2!977 (ite (or c!3445 c!3444) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3445 c!3444) (zeroValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (v!1620 (underlying!119 thiss!938))))))))))

(declare-fun b!25265 () Bool)

(assert (=> b!25265 (= e!16320 e!16336)))

(declare-fun res!15237 () Bool)

(assert (=> b!25265 (= res!15237 call!2310)))

(assert (=> b!25265 (=> (not res!15237) (not e!16336))))

(assert (= (and d!4781 c!3489) b!25225))

(assert (= (and d!4781 (not c!3489)) b!25254))

(assert (= (and b!25225 c!3487) b!25243))

(assert (= (and b!25225 (not c!3487)) b!25262))

(assert (= (or b!25243 b!25262) bm!2300))

(assert (= (or b!25243 b!25262) bm!2308))

(assert (= (or b!25243 b!25262) bm!2298))

(assert (= (and b!25254 c!3486) b!25242))

(assert (= (and b!25254 (not c!3486)) b!25224))

(assert (= (and b!25242 c!3496) b!25230))

(assert (= (and b!25242 (not c!3496)) b!25248))

(assert (= (and b!25230 res!15228) b!25237))

(assert (= (and b!25237 res!15234) b!25256))

(assert (= (and b!25248 c!3491) b!25234))

(assert (= (and b!25248 (not c!3491)) b!25227))

(assert (= (and b!25234 res!15239) b!25244))

(assert (= (and b!25244 res!15227) b!25241))

(assert (= (and b!25227 c!3483) b!25232))

(assert (= (and b!25227 (not c!3483)) b!25249))

(assert (= (and b!25232 res!15231) b!25246))

(assert (= (and b!25246 res!15229) b!25263))

(assert (= (or b!25234 b!25232) bm!2296))

(assert (= (or b!25241 b!25263) bm!2289))

(assert (= (or b!25237 bm!2296) bm!2286))

(assert (= (or b!25230 b!25248) bm!2292))

(assert (= (and b!25224 c!3484) b!25251))

(assert (= (and b!25224 (not c!3484)) b!25245))

(assert (= (and b!25245 c!3492) b!25253))

(assert (= (and b!25245 (not c!3492)) b!25261))

(assert (= (and b!25261 c!3488) b!25229))

(assert (= (and b!25261 (not c!3488)) b!25235))

(assert (= (and b!25229 res!15238) b!25233))

(assert (= (and b!25233 res!15233) b!25255))

(assert (= (and b!25235 c!3495) b!25250))

(assert (= (and b!25235 (not c!3495)) b!25231))

(assert (= (and b!25250 res!15236) b!25247))

(assert (= (and b!25247 res!15230) b!25257))

(assert (= (and b!25231 c!3493) b!25265))

(assert (= (and b!25231 (not c!3493)) b!25228))

(assert (= (and b!25265 res!15237) b!25239))

(assert (= (and b!25239 res!15235) b!25236))

(assert (= (or b!25250 b!25265) bm!2305))

(assert (= (or b!25257 b!25236) bm!2288))

(assert (= (or b!25233 bm!2305) bm!2295))

(assert (= (or b!25229 b!25235) bm!2301))

(assert (= (or b!25251 b!25253) bm!2287))

(assert (= (or b!25248 b!25235) bm!2293))

(assert (= (or b!25242 b!25261) bm!2303))

(assert (= (or b!25230 b!25229) bm!2291))

(assert (= (or bm!2289 bm!2288) bm!2290))

(assert (= (or bm!2286 bm!2295) bm!2304))

(assert (= (or bm!2292 bm!2301) bm!2302))

(assert (= (or b!25242 b!25261) bm!2299))

(assert (= (and bm!2299 c!3485) b!25240))

(assert (= (and bm!2299 (not c!3485)) b!25258))

(assert (= (or bm!2308 b!25261) bm!2307))

(assert (= (or bm!2300 bm!2303) bm!2297))

(assert (= (or bm!2298 b!25261) bm!2294))

(assert (= (and bm!2294 c!3494) b!25226))

(assert (= (and bm!2294 (not c!3494)) b!25260))

(assert (= (and d!4781 res!15232) b!25252))

(assert (= (and b!25252 c!3490) b!25238))

(assert (= (and b!25252 (not c!3490)) b!25259))

(assert (= (and b!25238 res!15240) b!25264))

(assert (= (or b!25264 b!25259) bm!2306))

(assert (= (or b!25238 b!25264 b!25259) bm!2309))

(declare-fun m!20331 () Bool)

(assert (=> b!25247 m!20331))

(declare-fun m!20333 () Bool)

(assert (=> b!25254 m!20333))

(declare-fun m!20335 () Bool)

(assert (=> b!25243 m!20335))

(declare-fun m!20337 () Bool)

(assert (=> b!25260 m!20337))

(declare-fun m!20339 () Bool)

(assert (=> b!25261 m!20339))

(declare-fun m!20341 () Bool)

(assert (=> b!25261 m!20341))

(declare-fun m!20343 () Bool)

(assert (=> b!25261 m!20343))

(declare-fun m!20345 () Bool)

(assert (=> b!25261 m!20345))

(assert (=> b!25261 m!20339))

(declare-fun m!20347 () Bool)

(assert (=> b!25261 m!20347))

(assert (=> bm!2297 m!20347))

(declare-fun m!20349 () Bool)

(assert (=> bm!2297 m!20349))

(declare-fun m!20351 () Bool)

(assert (=> b!25255 m!20351))

(declare-fun m!20353 () Bool)

(assert (=> b!25244 m!20353))

(declare-fun m!20355 () Bool)

(assert (=> b!25262 m!20355))

(declare-fun m!20357 () Bool)

(assert (=> d!4781 m!20357))

(declare-fun m!20359 () Bool)

(assert (=> d!4781 m!20359))

(declare-fun m!20361 () Bool)

(assert (=> b!25246 m!20361))

(declare-fun m!20363 () Bool)

(assert (=> bm!2290 m!20363))

(declare-fun m!20365 () Bool)

(assert (=> b!25238 m!20365))

(declare-fun m!20367 () Bool)

(assert (=> bm!2299 m!20367))

(declare-fun m!20369 () Bool)

(assert (=> bm!2306 m!20369))

(declare-fun m!20371 () Bool)

(assert (=> bm!2307 m!20371))

(declare-fun m!20373 () Bool)

(assert (=> b!25239 m!20373))

(declare-fun m!20375 () Bool)

(assert (=> bm!2287 m!20375))

(declare-fun m!20377 () Bool)

(assert (=> bm!2291 m!20377))

(declare-fun m!20379 () Bool)

(assert (=> bm!2304 m!20379))

(declare-fun m!20381 () Bool)

(assert (=> bm!2294 m!20381))

(declare-fun m!20383 () Bool)

(assert (=> b!25256 m!20383))

(declare-fun m!20385 () Bool)

(assert (=> bm!2293 m!20385))

(assert (=> b!25258 m!20337))

(declare-fun m!20387 () Bool)

(assert (=> bm!2309 m!20387))

(declare-fun m!20389 () Bool)

(assert (=> b!25264 m!20389))

(assert (=> bm!2302 m!20333))

(assert (=> bm!2231 d!4781))

(declare-fun b!25278 () Bool)

(declare-fun e!16344 () Unit!593)

(declare-fun Unit!597 () Unit!593)

(assert (=> b!25278 (= e!16344 Unit!597)))

(declare-fun lt!9856 () tuple2!976)

(declare-fun lt!9871 () LongMapFixedSize!216)

(declare-fun head!831 (List!570) tuple2!976)

(assert (=> b!25278 (= lt!9856 (head!831 (toList!300 (map!410 lt!9871))))))

(declare-fun lt!9874 () array!1299)

(assert (=> b!25278 (= lt!9874 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9876 () (_ BitVec 32))

(assert (=> b!25278 (= lt!9876 #b00000000000000000000000000000000)))

(declare-fun lt!9855 () Unit!593)

(declare-fun lemmaKeyInListMapIsInArray!92 (array!1299 array!1297 (_ BitVec 32) (_ BitVec 32) V!1197 V!1197 (_ BitVec 64) Int) Unit!593)

(declare-fun dynLambda!145 (Int (_ BitVec 64)) V!1197)

(assert (=> b!25278 (= lt!9855 (lemmaKeyInListMapIsInArray!92 lt!9874 (array!1298 ((as const (Array (_ BitVec 32) ValueCell!315)) EmptyCell!315) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) lt!9876 (dynLambda!145 (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!145 (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!497 lt!9856) (defaultEntry!1765 (v!1620 (underlying!119 thiss!938)))))))

(declare-fun c!3501 () Bool)

(assert (=> b!25278 (= c!3501 (and (not (= (_1!497 lt!9856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!497 lt!9856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!16343 () Bool)

(assert (=> b!25278 e!16343))

(declare-fun lt!9873 () Unit!593)

(assert (=> b!25278 (= lt!9873 lt!9855)))

(declare-fun lt!9877 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1299 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!25278 (= lt!9877 (arrayScanForKey!0 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)) (_1!497 lt!9856) #b00000000000000000000000000000000))))

(assert (=> b!25278 false))

(declare-fun b!25279 () Bool)

(declare-fun res!15245 () Bool)

(declare-fun e!16345 () Bool)

(assert (=> b!25279 (=> (not res!15245) (not e!16345))))

(declare-fun lt!9858 () LongMapFixedSize!216)

(assert (=> b!25279 (= res!15245 (= (mask!4764 lt!9858) (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938))))))))

(declare-fun b!25280 () Bool)

(assert (=> b!25280 (= e!16343 (arrayContainsKey!0 lt!9874 (_1!497 lt!9856) #b00000000000000000000000000000000))))

(declare-fun b!25282 () Bool)

(assert (=> b!25282 (= e!16345 (= (map!410 lt!9858) (ListLongMap!570 Nil!567)))))

(declare-fun b!25283 () Bool)

(assert (=> b!25283 (= e!16343 (ite (= (_1!497 lt!9856) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!9876 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!9876 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!4783 () Bool)

(assert (=> d!4783 e!16345))

(declare-fun res!15246 () Bool)

(assert (=> d!4783 (=> (not res!15246) (not e!16345))))

(assert (=> d!4783 (= res!15246 (valid!107 lt!9858))))

(assert (=> d!4783 (= lt!9858 lt!9871)))

(declare-fun lt!9857 () Unit!593)

(assert (=> d!4783 (= lt!9857 e!16344)))

(declare-fun c!3502 () Bool)

(assert (=> d!4783 (= c!3502 (not (= (map!410 lt!9871) (ListLongMap!570 Nil!567))))))

(declare-fun lt!9863 () Unit!593)

(declare-fun lt!9866 () Unit!593)

(assert (=> d!4783 (= lt!9863 lt!9866)))

(declare-fun lt!9868 () array!1299)

(declare-fun lt!9862 () (_ BitVec 32))

(declare-datatypes ((List!571 0))(
  ( (Nil!568) (Cons!567 (h!1134 (_ BitVec 64)) (t!3256 List!571)) )
))
(declare-fun lt!9865 () List!571)

(declare-fun arrayNoDuplicates!0 (array!1299 (_ BitVec 32) List!571) Bool)

(assert (=> d!4783 (arrayNoDuplicates!0 lt!9868 lt!9862 lt!9865)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1299 (_ BitVec 32) (_ BitVec 32) List!571) Unit!593)

(assert (=> d!4783 (= lt!9866 (lemmaArrayNoDuplicatesInAll0Array!0 lt!9868 lt!9862 (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001) lt!9865))))

(assert (=> d!4783 (= lt!9865 Nil!568)))

(assert (=> d!4783 (= lt!9862 #b00000000000000000000000000000000)))

(assert (=> d!4783 (= lt!9868 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9875 () Unit!593)

(declare-fun lt!9872 () Unit!593)

(assert (=> d!4783 (= lt!9875 lt!9872)))

(declare-fun lt!9861 () (_ BitVec 32))

(declare-fun lt!9860 () array!1299)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1299 (_ BitVec 32)) Bool)

(assert (=> d!4783 (arrayForallSeekEntryOrOpenFound!0 lt!9861 lt!9860 (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1299 (_ BitVec 32) (_ BitVec 32)) Unit!593)

(assert (=> d!4783 (= lt!9872 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!9860 (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) lt!9861))))

(assert (=> d!4783 (= lt!9861 #b00000000000000000000000000000000)))

(assert (=> d!4783 (= lt!9860 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!9864 () Unit!593)

(declare-fun lt!9869 () Unit!593)

(assert (=> d!4783 (= lt!9864 lt!9869)))

(declare-fun lt!9870 () array!1299)

(declare-fun lt!9867 () (_ BitVec 32))

(declare-fun lt!9859 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!4783 (= (arrayCountValidKeys!0 lt!9870 lt!9867 lt!9859) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1299 (_ BitVec 32) (_ BitVec 32)) Unit!593)

(assert (=> d!4783 (= lt!9869 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!9870 lt!9867 lt!9859))))

(assert (=> d!4783 (= lt!9859 (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!4783 (= lt!9867 #b00000000000000000000000000000000)))

(assert (=> d!4783 (= lt!9870 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!4783 (= lt!9871 (LongMapFixedSize!217 (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!145 (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!145 (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1300 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)) (array!1298 ((as const (Array (_ BitVec 32) ValueCell!315)) EmptyCell!315) (bvadd (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!4783 (validMask!0 (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))))))

(assert (=> d!4783 (= (getNewLongMapFixedSize!35 (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) (defaultEntry!1765 (v!1620 (underlying!119 thiss!938)))) lt!9858)))

(declare-fun b!25281 () Bool)

(declare-fun Unit!598 () Unit!593)

(assert (=> b!25281 (= e!16344 Unit!598)))

(assert (= (and d!4783 c!3502) b!25278))

(assert (= (and d!4783 (not c!3502)) b!25281))

(assert (= (and b!25278 c!3501) b!25280))

(assert (= (and b!25278 (not c!3501)) b!25283))

(assert (= (and d!4783 res!15246) b!25279))

(assert (= (and b!25279 res!15245) b!25282))

(declare-fun b_lambda!1663 () Bool)

(assert (=> (not b_lambda!1663) (not b!25278)))

(declare-fun t!3254 () Bool)

(declare-fun tb!671 () Bool)

(assert (=> (and b!25085 (= (defaultEntry!1765 (v!1620 (underlying!119 thiss!938))) (defaultEntry!1765 (v!1620 (underlying!119 thiss!938)))) t!3254) tb!671))

(declare-fun result!1111 () Bool)

(assert (=> tb!671 (= result!1111 tp_is_empty!1029)))

(assert (=> b!25278 t!3254))

(declare-fun b_and!1563 () Bool)

(assert (= b_and!1559 (and (=> t!3254 result!1111) b_and!1563)))

(declare-fun b_lambda!1665 () Bool)

(assert (=> (not b_lambda!1665) (not d!4783)))

(assert (=> d!4783 t!3254))

(declare-fun b_and!1565 () Bool)

(assert (= b_and!1563 (and (=> t!3254 result!1111) b_and!1565)))

(assert (=> b!25278 m!20309))

(declare-fun m!20391 () Bool)

(assert (=> b!25278 m!20391))

(assert (=> b!25278 m!20391))

(declare-fun m!20393 () Bool)

(assert (=> b!25278 m!20393))

(declare-fun m!20395 () Bool)

(assert (=> b!25278 m!20395))

(declare-fun m!20397 () Bool)

(assert (=> b!25278 m!20397))

(assert (=> b!25278 m!20391))

(declare-fun m!20399 () Bool)

(assert (=> b!25278 m!20399))

(declare-fun m!20401 () Bool)

(assert (=> b!25280 m!20401))

(declare-fun m!20403 () Bool)

(assert (=> b!25282 m!20403))

(declare-fun m!20405 () Bool)

(assert (=> d!4783 m!20405))

(declare-fun m!20407 () Bool)

(assert (=> d!4783 m!20407))

(assert (=> d!4783 m!20309))

(declare-fun m!20409 () Bool)

(assert (=> d!4783 m!20409))

(declare-fun m!20411 () Bool)

(assert (=> d!4783 m!20411))

(assert (=> d!4783 m!20309))

(declare-fun m!20413 () Bool)

(assert (=> d!4783 m!20413))

(assert (=> d!4783 m!20309))

(declare-fun m!20415 () Bool)

(assert (=> d!4783 m!20415))

(assert (=> d!4783 m!20391))

(declare-fun m!20417 () Bool)

(assert (=> d!4783 m!20417))

(assert (=> d!4783 m!20399))

(declare-fun m!20419 () Bool)

(assert (=> d!4783 m!20419))

(assert (=> b!25081 d!4783))

(declare-fun d!4785 () Bool)

(declare-fun e!16351 () Bool)

(assert (=> d!4785 e!16351))

(declare-fun res!15249 () Bool)

(assert (=> d!4785 (=> (not res!15249) (not e!16351))))

(declare-fun lt!9883 () (_ BitVec 32))

(assert (=> d!4785 (= res!15249 (validMask!0 lt!9883))))

(declare-datatypes ((tuple2!978 0))(
  ( (tuple2!979 (_1!498 Unit!593) (_2!498 (_ BitVec 32))) )
))
(declare-fun e!16350 () tuple2!978)

(assert (=> d!4785 (= lt!9883 (_2!498 e!16350))))

(declare-fun c!3505 () Bool)

(declare-fun lt!9882 () tuple2!978)

(assert (=> d!4785 (= c!3505 (and (bvsgt (_2!498 lt!9882) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!155 (v!1620 (underlying!119 thiss!938)))) (_2!498 lt!9882)) (bvsge (bvadd (bvand (bvashr (_2!498 lt!9882) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!155 (v!1620 (underlying!119 thiss!938))))))))

(declare-fun Unit!599 () Unit!593)

(declare-fun Unit!600 () Unit!593)

(assert (=> d!4785 (= lt!9882 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!155 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))))) (mask!4764 (v!1620 (underlying!119 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!155 (v!1620 (underlying!119 thiss!938)))) (mask!4764 (v!1620 (underlying!119 thiss!938))))) (tuple2!979 Unit!599 (bvand (bvadd (bvshl (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!979 Unit!600 (mask!4764 (v!1620 (underlying!119 thiss!938))))))))

(assert (=> d!4785 (validMask!0 (mask!4764 (v!1620 (underlying!119 thiss!938))))))

(assert (=> d!4785 (= (computeNewMask!31 thiss!938 (mask!4764 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (_size!155 (v!1620 (underlying!119 thiss!938)))) lt!9883)))

(declare-fun b!25292 () Bool)

(declare-fun computeNewMaskWhile!15 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!978)

(assert (=> b!25292 (= e!16350 (computeNewMaskWhile!15 (_size!155 (v!1620 (underlying!119 thiss!938))) (_vacant!155 (v!1620 (underlying!119 thiss!938))) (mask!4764 (v!1620 (underlying!119 thiss!938))) (_2!498 lt!9882)))))

(declare-fun b!25293 () Bool)

(declare-fun Unit!601 () Unit!593)

(assert (=> b!25293 (= e!16350 (tuple2!979 Unit!601 (_2!498 lt!9882)))))

(declare-fun b!25294 () Bool)

(assert (=> b!25294 (= e!16351 (bvsle (_size!155 (v!1620 (underlying!119 thiss!938))) (bvadd lt!9883 #b00000000000000000000000000000001)))))

(assert (= (and d!4785 c!3505) b!25292))

(assert (= (and d!4785 (not c!3505)) b!25293))

(assert (= (and d!4785 res!15249) b!25294))

(declare-fun m!20421 () Bool)

(assert (=> d!4785 m!20421))

(assert (=> d!4785 m!20299))

(declare-fun m!20423 () Bool)

(assert (=> b!25292 m!20423))

(assert (=> b!25081 d!4785))

(declare-fun d!4787 () Bool)

(assert (=> d!4787 (= (valid!105 thiss!938) (valid!107 (v!1620 (underlying!119 thiss!938))))))

(declare-fun bs!1050 () Bool)

(assert (= bs!1050 d!4787))

(declare-fun m!20425 () Bool)

(assert (=> bs!1050 m!20425))

(assert (=> start!3634 d!4787))

(declare-fun b!25295 () Bool)

(declare-fun c!3507 () Bool)

(declare-fun lt!9907 () SeekEntryResult!55)

(assert (=> b!25295 (= c!3507 ((_ is MissingVacant!55) lt!9907))))

(declare-fun e!16361 () tuple2!968)

(declare-fun e!16352 () tuple2!968)

(assert (=> b!25295 (= e!16361 e!16352)))

(declare-fun b!25296 () Bool)

(declare-fun e!16360 () tuple2!968)

(declare-fun e!16355 () tuple2!968)

(assert (=> b!25296 (= e!16360 e!16355)))

(declare-fun c!3510 () Bool)

(assert (=> b!25296 (= c!3510 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2310 () Bool)

(declare-fun call!2335 () Bool)

(declare-fun call!2325 () Bool)

(assert (=> bm!2310 (= call!2335 call!2325)))

(declare-fun b!25297 () Bool)

(declare-fun e!16362 () ListLongMap!569)

(declare-fun call!2321 () ListLongMap!569)

(assert (=> b!25297 (= e!16362 call!2321)))

(declare-fun bm!2311 () Bool)

(declare-fun call!2314 () tuple2!968)

(assert (=> bm!2311 (= call!2314 (updateHelperNewKey!11 (_2!493 lt!9706) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938))) (ite c!3507 (index!2345 lt!9907) (index!2342 lt!9907))))))

(declare-fun bm!2312 () Bool)

(declare-fun call!2329 () Bool)

(declare-fun call!2326 () Bool)

(assert (=> bm!2312 (= call!2329 call!2326)))

(declare-fun b!25298 () Bool)

(declare-fun c!3506 () Bool)

(declare-fun lt!9886 () SeekEntryResult!55)

(assert (=> b!25298 (= c!3506 ((_ is MissingVacant!55) lt!9886))))

(declare-fun e!16363 () Bool)

(declare-fun e!16353 () Bool)

(assert (=> b!25298 (= e!16363 e!16353)))

(declare-fun b!25299 () Bool)

(declare-fun e!16357 () Bool)

(declare-fun lt!9902 () SeekEntryResult!55)

(assert (=> b!25299 (= e!16357 ((_ is Undefined!55) lt!9902))))

(declare-fun b!25300 () Bool)

(declare-fun e!16359 () Unit!593)

(declare-fun lt!9904 () Unit!593)

(assert (=> b!25300 (= e!16359 lt!9904)))

(declare-fun call!2332 () Unit!593)

(assert (=> b!25300 (= lt!9904 call!2332)))

(declare-fun lt!9896 () SeekEntryResult!55)

(declare-fun call!2315 () SeekEntryResult!55)

(assert (=> b!25300 (= lt!9896 call!2315)))

(declare-fun res!15261 () Bool)

(assert (=> b!25300 (= res!15261 ((_ is Found!55) lt!9896))))

(declare-fun e!16364 () Bool)

(assert (=> b!25300 (=> (not res!15261) (not e!16364))))

(assert (=> b!25300 e!16364))

(declare-fun b!25301 () Bool)

(declare-fun e!16371 () Unit!593)

(declare-fun Unit!602 () Unit!593)

(assert (=> b!25301 (= e!16371 Unit!602)))

(declare-fun lt!9889 () Unit!593)

(assert (=> b!25301 (= lt!9889 call!2332)))

(declare-fun lt!9903 () SeekEntryResult!55)

(declare-fun call!2323 () SeekEntryResult!55)

(assert (=> b!25301 (= lt!9903 call!2323)))

(declare-fun res!15251 () Bool)

(assert (=> b!25301 (= res!15251 ((_ is Found!55) lt!9903))))

(declare-fun e!16367 () Bool)

(assert (=> b!25301 (=> (not res!15251) (not e!16367))))

(assert (=> b!25301 e!16367))

(declare-fun lt!9898 () Unit!593)

(assert (=> b!25301 (= lt!9898 lt!9889)))

(assert (=> b!25301 false))

(declare-fun b!25302 () Bool)

(declare-fun c!3516 () Bool)

(assert (=> b!25302 (= c!3516 ((_ is MissingVacant!55) lt!9902))))

(declare-fun e!16366 () Bool)

(assert (=> b!25302 (= e!16366 e!16357)))

(declare-fun b!25303 () Bool)

(declare-fun e!16358 () Bool)

(assert (=> b!25303 (= e!16353 e!16358)))

(declare-fun res!15254 () Bool)

(declare-fun call!2317 () Bool)

(assert (=> b!25303 (= res!15254 call!2317)))

(assert (=> b!25303 (=> (not res!15254) (not e!16358))))

(declare-fun bm!2313 () Bool)

(declare-fun call!2331 () Bool)

(assert (=> bm!2313 (= call!2331 call!2326)))

(declare-fun bm!2314 () Bool)

(assert (=> bm!2314 (= call!2326 (arrayContainsKey!0 (_keys!3191 (_2!493 lt!9706)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!2315 () Bool)

(assert (=> bm!2315 (= call!2332 (lemmaInListMapThenSeekEntryOrOpenFindsIt!11 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun b!25304 () Bool)

(declare-fun res!15256 () Bool)

(declare-fun call!2336 () Bool)

(assert (=> b!25304 (= res!15256 call!2336)))

(assert (=> b!25304 (=> (not res!15256) (not e!16364))))

(declare-fun bm!2316 () Bool)

(declare-fun call!2319 () SeekEntryResult!55)

(assert (=> bm!2316 (= call!2323 call!2319)))

(declare-fun bm!2317 () Bool)

(declare-fun call!2330 () Unit!593)

(assert (=> bm!2317 (= call!2330 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!11 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun b!25305 () Bool)

(declare-fun res!15262 () Bool)

(declare-fun e!16368 () Bool)

(assert (=> b!25305 (=> (not res!15262) (not e!16368))))

(assert (=> b!25305 (= res!15262 call!2317)))

(assert (=> b!25305 (= e!16363 e!16368)))

(declare-fun call!2318 () ListLongMap!569)

(declare-fun bm!2318 () Bool)

(declare-fun c!3512 () Bool)

(assert (=> bm!2318 (= call!2318 (+!46 e!16362 (ite c!3512 (ite c!3510 (tuple2!977 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (tuple2!977 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (tuple2!977 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938)))))))))

(declare-fun c!3517 () Bool)

(assert (=> bm!2318 (= c!3517 c!3512)))

(declare-fun b!25306 () Bool)

(declare-fun Unit!603 () Unit!593)

(assert (=> b!25306 (= e!16359 Unit!603)))

(declare-fun lt!9900 () Unit!593)

(assert (=> b!25306 (= lt!9900 call!2330)))

(assert (=> b!25306 (= lt!9902 call!2315)))

(declare-fun c!3518 () Bool)

(assert (=> b!25306 (= c!3518 ((_ is MissingZero!55) lt!9902))))

(assert (=> b!25306 e!16366))

(declare-fun lt!9901 () Unit!593)

(assert (=> b!25306 (= lt!9901 lt!9900)))

(assert (=> b!25306 false))

(declare-fun b!25307 () Bool)

(declare-fun e!16373 () Bool)

(assert (=> b!25307 (= e!16373 (not call!2329))))

(declare-fun bm!2319 () Bool)

(assert (=> bm!2319 (= call!2336 call!2325)))

(declare-fun bm!2320 () Bool)

(assert (=> bm!2320 (= call!2317 call!2335)))

(declare-fun b!25308 () Bool)

(declare-fun res!15257 () Bool)

(assert (=> b!25308 (= res!15257 call!2335)))

(assert (=> b!25308 (=> (not res!15257) (not e!16367))))

(declare-fun b!25309 () Bool)

(declare-fun e!16369 () Bool)

(declare-fun e!16372 () Bool)

(assert (=> b!25309 (= e!16369 e!16372)))

(declare-fun res!15263 () Bool)

(declare-fun call!2313 () ListLongMap!569)

(assert (=> b!25309 (= res!15263 (contains!233 call!2313 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25309 (=> (not res!15263) (not e!16372))))

(declare-fun b!25310 () Bool)

(declare-fun res!15258 () Bool)

(assert (=> b!25310 (= res!15258 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2345 lt!9902)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25310 (=> (not res!15258) (not e!16373))))

(declare-fun lt!9910 () (_ BitVec 32))

(declare-fun bm!2321 () Bool)

(declare-fun call!2320 () ListLongMap!569)

(declare-fun lt!9891 () (_ BitVec 32))

(declare-fun c!3509 () Bool)

(assert (=> bm!2321 (= call!2320 (getCurrentListMap!131 (_keys!3191 (_2!493 lt!9706)) (ite (or c!3512 c!3509) (_values!1750 (_2!493 lt!9706)) (array!1298 (store (arr!613 (_values!1750 (_2!493 lt!9706))) (index!2343 lt!9907) (ValueCellFull!315 (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (size!714 (_values!1750 (_2!493 lt!9706))))) (mask!4764 (_2!493 lt!9706)) (ite c!3512 (ite c!3510 lt!9891 lt!9910) (extraKeys!1658 (_2!493 lt!9706))) (ite (and c!3512 c!3510) (minValue!1685 (v!1620 (underlying!119 thiss!938))) (zeroValue!1685 (_2!493 lt!9706))) (ite c!3512 (ite c!3510 (minValue!1685 (_2!493 lt!9706)) (minValue!1685 (v!1620 (underlying!119 thiss!938)))) (minValue!1685 (_2!493 lt!9706))) #b00000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun bm!2322 () Bool)

(declare-fun call!2316 () ListLongMap!569)

(assert (=> bm!2322 (= call!2316 call!2318)))

(declare-fun b!25311 () Bool)

(declare-fun e!16356 () ListLongMap!569)

(declare-fun call!2322 () ListLongMap!569)

(assert (=> b!25311 (= e!16356 call!2322)))

(declare-fun b!25312 () Bool)

(assert (=> b!25312 (= e!16368 (not call!2331))))

(declare-fun bm!2323 () Bool)

(declare-fun c!3508 () Bool)

(assert (=> bm!2323 (= c!3508 c!3509)))

(declare-fun call!2333 () Bool)

(assert (=> bm!2323 (= call!2333 (contains!233 e!16356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2324 () Bool)

(declare-fun call!2324 () ListLongMap!569)

(assert (=> bm!2324 (= call!2324 call!2320)))

(declare-fun b!25313 () Bool)

(declare-fun lt!9895 () Unit!593)

(assert (=> b!25313 (= lt!9895 e!16371)))

(declare-fun c!3519 () Bool)

(assert (=> b!25313 (= c!3519 call!2333)))

(assert (=> b!25313 (= e!16361 (tuple2!969 false (_2!493 lt!9706)))))

(declare-fun b!25314 () Bool)

(declare-fun lt!9905 () Unit!593)

(declare-fun lt!9894 () Unit!593)

(assert (=> b!25314 (= lt!9905 lt!9894)))

(assert (=> b!25314 (= call!2316 call!2324)))

(assert (=> b!25314 (= lt!9894 (lemmaChangeZeroKeyThenAddPairToListMap!11 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) lt!9891 (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (_2!493 lt!9706)) (defaultEntry!1765 (_2!493 lt!9706))))))

(assert (=> b!25314 (= lt!9891 (bvor (extraKeys!1658 (_2!493 lt!9706)) #b00000000000000000000000000000001))))

(assert (=> b!25314 (= e!16355 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (bvor (extraKeys!1658 (_2!493 lt!9706)) #b00000000000000000000000000000001) (minValue!1685 (v!1620 (underlying!119 thiss!938))) (minValue!1685 (_2!493 lt!9706)) (_size!155 (_2!493 lt!9706)) (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (_vacant!155 (_2!493 lt!9706)))))))

(declare-fun b!25315 () Bool)

(declare-fun res!15250 () Bool)

(assert (=> b!25315 (=> (not res!15250) (not e!16368))))

(assert (=> b!25315 (= res!15250 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2342 lt!9886)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25316 () Bool)

(declare-fun e!16370 () tuple2!968)

(assert (=> b!25316 (= e!16352 e!16370)))

(declare-fun c!3515 () Bool)

(assert (=> b!25316 (= c!3515 ((_ is MissingZero!55) lt!9907))))

(declare-fun b!25317 () Bool)

(declare-fun res!15252 () Bool)

(assert (=> b!25317 (= res!15252 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2345 lt!9886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!25317 (=> (not res!15252) (not e!16358))))

(declare-fun bm!2325 () Bool)

(assert (=> bm!2325 (= call!2315 call!2319)))

(declare-fun bm!2326 () Bool)

(assert (=> bm!2326 (= call!2319 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3191 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706))))))

(declare-fun b!25318 () Bool)

(declare-fun res!15253 () Bool)

(declare-fun e!16365 () Bool)

(assert (=> b!25318 (=> (not res!15253) (not e!16365))))

(assert (=> b!25318 (= res!15253 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2342 lt!9902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25319 () Bool)

(declare-fun lt!9909 () Unit!593)

(assert (=> b!25319 (= e!16371 lt!9909)))

(assert (=> b!25319 (= lt!9909 call!2330)))

(assert (=> b!25319 (= lt!9886 call!2323)))

(declare-fun c!3514 () Bool)

(assert (=> b!25319 (= c!3514 ((_ is MissingZero!55) lt!9886))))

(assert (=> b!25319 e!16363))

(declare-fun b!25320 () Bool)

(assert (=> b!25320 (= e!16353 ((_ is Undefined!55) lt!9886))))

(declare-fun b!25321 () Bool)

(declare-fun res!15259 () Bool)

(assert (=> b!25321 (=> (not res!15259) (not e!16365))))

(declare-fun call!2334 () Bool)

(assert (=> b!25321 (= res!15259 call!2334)))

(assert (=> b!25321 (= e!16366 e!16365)))

(declare-fun b!25322 () Bool)

(declare-fun lt!9893 () tuple2!968)

(assert (=> b!25322 (= e!16352 (tuple2!969 (_1!493 lt!9893) (_2!493 lt!9893)))))

(assert (=> b!25322 (= lt!9893 call!2314)))

(declare-fun b!25323 () Bool)

(declare-fun e!16354 () Bool)

(assert (=> b!25323 (= e!16354 e!16369)))

(declare-fun c!3513 () Bool)

(declare-fun lt!9887 () tuple2!968)

(assert (=> b!25323 (= c!3513 (_1!493 lt!9887))))

(declare-fun b!25324 () Bool)

(declare-fun lt!9888 () tuple2!968)

(assert (=> b!25324 (= lt!9888 call!2314)))

(assert (=> b!25324 (= e!16370 (tuple2!969 (_1!493 lt!9888) (_2!493 lt!9888)))))

(declare-fun b!25325 () Bool)

(assert (=> b!25325 (= e!16360 e!16361)))

(assert (=> b!25325 (= lt!9907 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3191 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706))))))

(assert (=> b!25325 (= c!3509 ((_ is Undefined!55) lt!9907))))

(declare-fun d!4789 () Bool)

(assert (=> d!4789 e!16354))

(declare-fun res!15255 () Bool)

(assert (=> d!4789 (=> (not res!15255) (not e!16354))))

(assert (=> d!4789 (= res!15255 (valid!107 (_2!493 lt!9887)))))

(assert (=> d!4789 (= lt!9887 e!16360)))

(assert (=> d!4789 (= c!3512 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4789 (valid!107 (_2!493 lt!9706))))

(assert (=> d!4789 (= (update!33 (_2!493 lt!9706) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938)))) lt!9887)))

(declare-fun bm!2327 () Bool)

(assert (=> bm!2327 (= call!2322 call!2320)))

(declare-fun bm!2328 () Bool)

(declare-fun c!3511 () Bool)

(assert (=> bm!2328 (= call!2325 (inRange!0 (ite c!3509 (ite c!3519 (index!2343 lt!9903) (ite c!3514 (index!2342 lt!9886) (index!2345 lt!9886))) (ite c!3511 (index!2343 lt!9896) (ite c!3518 (index!2342 lt!9902) (index!2345 lt!9902)))) (mask!4764 (_2!493 lt!9706))))))

(declare-fun bm!2329 () Bool)

(assert (=> bm!2329 (= call!2334 call!2336)))

(declare-fun bm!2330 () Bool)

(declare-fun call!2328 () ListLongMap!569)

(assert (=> bm!2330 (= call!2328 (map!410 (_2!493 lt!9706)))))

(declare-fun b!25326 () Bool)

(assert (=> b!25326 (= e!16364 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2343 lt!9896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25327 () Bool)

(assert (=> b!25327 (= e!16367 (= (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2343 lt!9903)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25328 () Bool)

(assert (=> b!25328 (= e!16365 (not call!2329))))

(declare-fun bm!2331 () Bool)

(declare-fun call!2327 () ListLongMap!569)

(declare-fun lt!9885 () array!1297)

(assert (=> bm!2331 (= call!2327 (getCurrentListMap!131 (_keys!3191 (_2!493 lt!9706)) (ite c!3512 (_values!1750 (_2!493 lt!9706)) lt!9885) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) #b00000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun b!25329 () Bool)

(assert (=> b!25329 (= e!16356 (getCurrentListMap!131 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) #b00000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun bm!2332 () Bool)

(assert (=> bm!2332 (= call!2321 call!2327)))

(declare-fun b!25330 () Bool)

(assert (=> b!25330 (= e!16369 (= call!2313 call!2328))))

(declare-fun bm!2333 () Bool)

(assert (=> bm!2333 (= call!2313 (map!410 (_2!493 lt!9887)))))

(declare-fun b!25331 () Bool)

(assert (=> b!25331 (= e!16362 (getCurrentListMap!131 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) #b00000000000000000000000000000000 (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun b!25332 () Bool)

(declare-fun lt!9908 () Unit!593)

(declare-fun lt!9899 () Unit!593)

(assert (=> b!25332 (= lt!9908 lt!9899)))

(assert (=> b!25332 (contains!233 call!2327 (select (arr!614 (_keys!3191 (_2!493 lt!9706))) (index!2343 lt!9907)))))

(assert (=> b!25332 (= lt!9899 (lemmaValidKeyInArrayIsInListMap!11 (_keys!3191 (_2!493 lt!9706)) lt!9885 (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) (index!2343 lt!9907) (defaultEntry!1765 (_2!493 lt!9706))))))

(assert (=> b!25332 (= lt!9885 (array!1298 (store (arr!613 (_values!1750 (_2!493 lt!9706))) (index!2343 lt!9907) (ValueCellFull!315 (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (size!714 (_values!1750 (_2!493 lt!9706)))))))

(declare-fun lt!9890 () Unit!593)

(declare-fun lt!9897 () Unit!593)

(assert (=> b!25332 (= lt!9890 lt!9897)))

(assert (=> b!25332 (= call!2318 call!2322)))

(assert (=> b!25332 (= lt!9897 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!11 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) (index!2343 lt!9907) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938))) (defaultEntry!1765 (_2!493 lt!9706))))))

(declare-fun lt!9892 () Unit!593)

(assert (=> b!25332 (= lt!9892 e!16359)))

(assert (=> b!25332 (= c!3511 call!2333)))

(assert (=> b!25332 (= e!16370 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) (_size!155 (_2!493 lt!9706)) (_keys!3191 (_2!493 lt!9706)) (array!1298 (store (arr!613 (_values!1750 (_2!493 lt!9706))) (index!2343 lt!9907) (ValueCellFull!315 (minValue!1685 (v!1620 (underlying!119 thiss!938))))) (size!714 (_values!1750 (_2!493 lt!9706)))) (_vacant!155 (_2!493 lt!9706)))))))

(declare-fun b!25333 () Bool)

(declare-fun lt!9906 () Unit!593)

(declare-fun lt!9884 () Unit!593)

(assert (=> b!25333 (= lt!9906 lt!9884)))

(assert (=> b!25333 (= call!2316 call!2324)))

(assert (=> b!25333 (= lt!9884 (lemmaChangeLongMinValueKeyThenAddPairToListMap!11 (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (extraKeys!1658 (_2!493 lt!9706)) lt!9910 (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (_2!493 lt!9706)) (minValue!1685 (v!1620 (underlying!119 thiss!938))) (defaultEntry!1765 (_2!493 lt!9706))))))

(assert (=> b!25333 (= lt!9910 (bvor (extraKeys!1658 (_2!493 lt!9706)) #b00000000000000000000000000000010))))

(assert (=> b!25333 (= e!16355 (tuple2!969 true (LongMapFixedSize!217 (defaultEntry!1765 (_2!493 lt!9706)) (mask!4764 (_2!493 lt!9706)) (bvor (extraKeys!1658 (_2!493 lt!9706)) #b00000000000000000000000000000010) (zeroValue!1685 (_2!493 lt!9706)) (minValue!1685 (v!1620 (underlying!119 thiss!938))) (_size!155 (_2!493 lt!9706)) (_keys!3191 (_2!493 lt!9706)) (_values!1750 (_2!493 lt!9706)) (_vacant!155 (_2!493 lt!9706)))))))

(declare-fun b!25334 () Bool)

(assert (=> b!25334 (= e!16358 (not call!2331))))

(declare-fun b!25335 () Bool)

(assert (=> b!25335 (= e!16372 (= call!2313 (+!46 call!2328 (tuple2!977 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1685 (v!1620 (underlying!119 thiss!938)))))))))

(declare-fun b!25336 () Bool)

(assert (=> b!25336 (= e!16357 e!16373)))

(declare-fun res!15260 () Bool)

(assert (=> b!25336 (= res!15260 call!2334)))

(assert (=> b!25336 (=> (not res!15260) (not e!16373))))

(assert (= (and d!4789 c!3512) b!25296))

(assert (= (and d!4789 (not c!3512)) b!25325))

(assert (= (and b!25296 c!3510) b!25314))

(assert (= (and b!25296 (not c!3510)) b!25333))

(assert (= (or b!25314 b!25333) bm!2324))

(assert (= (or b!25314 b!25333) bm!2332))

(assert (= (or b!25314 b!25333) bm!2322))

(assert (= (and b!25325 c!3509) b!25313))

(assert (= (and b!25325 (not c!3509)) b!25295))

(assert (= (and b!25313 c!3519) b!25301))

(assert (= (and b!25313 (not c!3519)) b!25319))

(assert (= (and b!25301 res!15251) b!25308))

(assert (= (and b!25308 res!15257) b!25327))

(assert (= (and b!25319 c!3514) b!25305))

(assert (= (and b!25319 (not c!3514)) b!25298))

(assert (= (and b!25305 res!15262) b!25315))

(assert (= (and b!25315 res!15250) b!25312))

(assert (= (and b!25298 c!3506) b!25303))

(assert (= (and b!25298 (not c!3506)) b!25320))

(assert (= (and b!25303 res!15254) b!25317))

(assert (= (and b!25317 res!15252) b!25334))

(assert (= (or b!25305 b!25303) bm!2320))

(assert (= (or b!25312 b!25334) bm!2313))

(assert (= (or b!25308 bm!2320) bm!2310))

(assert (= (or b!25301 b!25319) bm!2316))

(assert (= (and b!25295 c!3507) b!25322))

(assert (= (and b!25295 (not c!3507)) b!25316))

(assert (= (and b!25316 c!3515) b!25324))

(assert (= (and b!25316 (not c!3515)) b!25332))

(assert (= (and b!25332 c!3511) b!25300))

(assert (= (and b!25332 (not c!3511)) b!25306))

(assert (= (and b!25300 res!15261) b!25304))

(assert (= (and b!25304 res!15256) b!25326))

(assert (= (and b!25306 c!3518) b!25321))

(assert (= (and b!25306 (not c!3518)) b!25302))

(assert (= (and b!25321 res!15259) b!25318))

(assert (= (and b!25318 res!15253) b!25328))

(assert (= (and b!25302 c!3516) b!25336))

(assert (= (and b!25302 (not c!3516)) b!25299))

(assert (= (and b!25336 res!15260) b!25310))

(assert (= (and b!25310 res!15258) b!25307))

(assert (= (or b!25321 b!25336) bm!2329))

(assert (= (or b!25328 b!25307) bm!2312))

(assert (= (or b!25304 bm!2329) bm!2319))

(assert (= (or b!25300 b!25306) bm!2325))

(assert (= (or b!25322 b!25324) bm!2311))

(assert (= (or b!25319 b!25306) bm!2317))

(assert (= (or b!25313 b!25332) bm!2327))

(assert (= (or b!25301 b!25300) bm!2315))

(assert (= (or bm!2313 bm!2312) bm!2314))

(assert (= (or bm!2310 bm!2319) bm!2328))

(assert (= (or bm!2316 bm!2325) bm!2326))

(assert (= (or b!25313 b!25332) bm!2323))

(assert (= (and bm!2323 c!3508) b!25311))

(assert (= (and bm!2323 (not c!3508)) b!25329))

(assert (= (or bm!2332 b!25332) bm!2331))

(assert (= (or bm!2324 bm!2327) bm!2321))

(assert (= (or bm!2322 b!25332) bm!2318))

(assert (= (and bm!2318 c!3517) b!25297))

(assert (= (and bm!2318 (not c!3517)) b!25331))

(assert (= (and d!4789 res!15255) b!25323))

(assert (= (and b!25323 c!3513) b!25309))

(assert (= (and b!25323 (not c!3513)) b!25330))

(assert (= (and b!25309 res!15263) b!25335))

(assert (= (or b!25335 b!25330) bm!2330))

(assert (= (or b!25309 b!25335 b!25330) bm!2333))

(declare-fun m!20427 () Bool)

(assert (=> b!25318 m!20427))

(declare-fun m!20429 () Bool)

(assert (=> b!25325 m!20429))

(declare-fun m!20431 () Bool)

(assert (=> b!25314 m!20431))

(declare-fun m!20433 () Bool)

(assert (=> b!25331 m!20433))

(declare-fun m!20435 () Bool)

(assert (=> b!25332 m!20435))

(declare-fun m!20437 () Bool)

(assert (=> b!25332 m!20437))

(declare-fun m!20439 () Bool)

(assert (=> b!25332 m!20439))

(declare-fun m!20441 () Bool)

(assert (=> b!25332 m!20441))

(assert (=> b!25332 m!20435))

(declare-fun m!20443 () Bool)

(assert (=> b!25332 m!20443))

(assert (=> bm!2321 m!20443))

(declare-fun m!20445 () Bool)

(assert (=> bm!2321 m!20445))

(declare-fun m!20447 () Bool)

(assert (=> b!25326 m!20447))

(declare-fun m!20449 () Bool)

(assert (=> b!25315 m!20449))

(declare-fun m!20451 () Bool)

(assert (=> b!25333 m!20451))

(declare-fun m!20453 () Bool)

(assert (=> d!4789 m!20453))

(declare-fun m!20455 () Bool)

(assert (=> d!4789 m!20455))

(declare-fun m!20457 () Bool)

(assert (=> b!25317 m!20457))

(declare-fun m!20459 () Bool)

(assert (=> bm!2314 m!20459))

(declare-fun m!20461 () Bool)

(assert (=> b!25309 m!20461))

(declare-fun m!20463 () Bool)

(assert (=> bm!2323 m!20463))

(declare-fun m!20465 () Bool)

(assert (=> bm!2330 m!20465))

(declare-fun m!20467 () Bool)

(assert (=> bm!2331 m!20467))

(declare-fun m!20469 () Bool)

(assert (=> b!25310 m!20469))

(declare-fun m!20471 () Bool)

(assert (=> bm!2311 m!20471))

(declare-fun m!20473 () Bool)

(assert (=> bm!2315 m!20473))

(declare-fun m!20475 () Bool)

(assert (=> bm!2328 m!20475))

(declare-fun m!20477 () Bool)

(assert (=> bm!2318 m!20477))

(declare-fun m!20479 () Bool)

(assert (=> b!25327 m!20479))

(declare-fun m!20481 () Bool)

(assert (=> bm!2317 m!20481))

(assert (=> b!25329 m!20433))

(declare-fun m!20483 () Bool)

(assert (=> bm!2333 m!20483))

(declare-fun m!20485 () Bool)

(assert (=> b!25335 m!20485))

(assert (=> bm!2326 m!20429))

(assert (=> b!25090 d!4789))

(declare-fun d!4791 () Bool)

(assert (=> d!4791 (= (array_inv!413 (_keys!3191 (v!1620 (underlying!119 thiss!938)))) (bvsge (size!715 (_keys!3191 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25085 d!4791))

(declare-fun d!4793 () Bool)

(assert (=> d!4793 (= (array_inv!414 (_values!1750 (v!1620 (underlying!119 thiss!938)))) (bvsge (size!714 (_values!1750 (v!1620 (underlying!119 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!25085 d!4793))

(declare-fun d!4795 () Bool)

(assert (=> d!4795 (= (validMask!0 (mask!4764 (v!1620 (underlying!119 thiss!938)))) (and (or (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000000111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000001111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000011111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000000111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000001111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000011111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000000111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000001111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000011111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000000111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000001111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000011111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000000111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000001111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000011111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000000111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000001111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000011111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000000111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000001111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000011111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000000111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000001111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000011111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00000111111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00001111111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00011111111111111111111111111111) (= (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4764 (v!1620 (underlying!119 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!25093 d!4795))

(declare-fun condMapEmpty!1045 () Bool)

(declare-fun mapDefault!1045 () ValueCell!315)

(assert (=> mapNonEmpty!1039 (= condMapEmpty!1045 (= mapRest!1039 ((as const (Array (_ BitVec 32) ValueCell!315)) mapDefault!1045)))))

(declare-fun e!16379 () Bool)

(declare-fun mapRes!1045 () Bool)

(assert (=> mapNonEmpty!1039 (= tp!3546 (and e!16379 mapRes!1045))))

(declare-fun b!25343 () Bool)

(declare-fun e!16378 () Bool)

(assert (=> b!25343 (= e!16378 tp_is_empty!1029)))

(declare-fun mapNonEmpty!1045 () Bool)

(declare-fun tp!3556 () Bool)

(assert (=> mapNonEmpty!1045 (= mapRes!1045 (and tp!3556 e!16378))))

(declare-fun mapKey!1045 () (_ BitVec 32))

(declare-fun mapValue!1045 () ValueCell!315)

(declare-fun mapRest!1045 () (Array (_ BitVec 32) ValueCell!315))

(assert (=> mapNonEmpty!1045 (= mapRest!1039 (store mapRest!1045 mapKey!1045 mapValue!1045))))

(declare-fun mapIsEmpty!1045 () Bool)

(assert (=> mapIsEmpty!1045 mapRes!1045))

(declare-fun b!25344 () Bool)

(assert (=> b!25344 (= e!16379 tp_is_empty!1029)))

(assert (= (and mapNonEmpty!1039 condMapEmpty!1045) mapIsEmpty!1045))

(assert (= (and mapNonEmpty!1039 (not condMapEmpty!1045)) mapNonEmpty!1045))

(assert (= (and mapNonEmpty!1045 ((_ is ValueCellFull!315) mapValue!1045)) b!25343))

(assert (= (and mapNonEmpty!1039 ((_ is ValueCellFull!315) mapDefault!1045)) b!25344))

(declare-fun m!20487 () Bool)

(assert (=> mapNonEmpty!1045 m!20487))

(declare-fun b_lambda!1667 () Bool)

(assert (= b_lambda!1663 (or (and b!25085 b_free!765) b_lambda!1667)))

(declare-fun b_lambda!1669 () Bool)

(assert (= b_lambda!1665 (or (and b!25085 b_free!765) b_lambda!1669)))

(check-sat (not b!25314) (not mapNonEmpty!1045) (not b!25335) (not b_lambda!1669) (not bm!2321) (not b!25243) (not d!4787) (not bm!2326) (not b!25280) (not b!25332) (not bm!2302) (not d!4789) (not bm!2330) (not b!25325) (not b!25262) (not b!25331) (not b_lambda!1667) (not b!25258) (not bm!2328) (not bm!2317) (not b!25238) (not b!25329) (not b!25333) (not bm!2299) (not d!4785) (not bm!2294) (not bm!2333) (not b!25260) (not bm!2309) (not b_next!765) (not bm!2307) (not bm!2306) (not b!25261) (not b!25278) (not bm!2291) (not bm!2304) (not bm!2331) (not bm!2311) (not bm!2293) (not bm!2290) (not bm!2297) (not b!25292) (not bm!2323) (not d!4781) b_and!1565 (not bm!2318) (not b!25264) (not bm!2287) (not b!25309) (not bm!2314) (not bm!2315) (not b!25282) (not b!25254) tp_is_empty!1029 (not d!4783))
(check-sat b_and!1565 (not b_next!765))
