; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13206 () Bool)

(assert start!13206)

(declare-fun b!116142 () Bool)

(declare-fun b_free!2737 () Bool)

(declare-fun b_next!2737 () Bool)

(assert (=> b!116142 (= b_free!2737 (not b_next!2737))))

(declare-fun tp!10579 () Bool)

(declare-fun b_and!7229 () Bool)

(assert (=> b!116142 (= tp!10579 b_and!7229)))

(declare-fun b!116140 () Bool)

(declare-fun b_free!2739 () Bool)

(declare-fun b_next!2739 () Bool)

(assert (=> b!116140 (= b_free!2739 (not b_next!2739))))

(declare-fun tp!10580 () Bool)

(declare-fun b_and!7231 () Bool)

(assert (=> b!116140 (= tp!10580 b_and!7231)))

(declare-fun mapIsEmpty!4293 () Bool)

(declare-fun mapRes!4293 () Bool)

(assert (=> mapIsEmpty!4293 mapRes!4293))

(declare-fun res!56934 () Bool)

(declare-fun e!75830 () Bool)

(assert (=> start!13206 (=> (not res!56934) (not e!75830))))

(declare-datatypes ((V!3361 0))(
  ( (V!3362 (val!1437 Int)) )
))
(declare-datatypes ((array!4561 0))(
  ( (array!4562 (arr!2162 (Array (_ BitVec 32) (_ BitVec 64))) (size!2423 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1049 0))(
  ( (ValueCellFull!1049 (v!3045 V!3361)) (EmptyCell!1049) )
))
(declare-datatypes ((array!4563 0))(
  ( (array!4564 (arr!2163 (Array (_ BitVec 32) ValueCell!1049)) (size!2424 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1006 0))(
  ( (LongMapFixedSize!1007 (defaultEntry!2714 Int) (mask!6930 (_ BitVec 32)) (extraKeys!2503 (_ BitVec 32)) (zeroValue!2581 V!3361) (minValue!2581 V!3361) (_size!552 (_ BitVec 32)) (_keys!4437 array!4561) (_values!2697 array!4563) (_vacant!552 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!806 0))(
  ( (Cell!807 (v!3046 LongMapFixedSize!1006)) )
))
(declare-datatypes ((LongMap!806 0))(
  ( (LongMap!807 (underlying!414 Cell!806)) )
))
(declare-fun thiss!992 () LongMap!806)

(declare-fun valid!486 (LongMap!806) Bool)

(assert (=> start!13206 (= res!56934 (valid!486 thiss!992))))

(assert (=> start!13206 e!75830))

(declare-fun e!75827 () Bool)

(assert (=> start!13206 e!75827))

(assert (=> start!13206 true))

(declare-fun e!75831 () Bool)

(assert (=> start!13206 e!75831))

(declare-fun b!116138 () Bool)

(declare-fun e!75834 () Bool)

(declare-fun e!75825 () Bool)

(assert (=> b!116138 (= e!75834 e!75825)))

(declare-fun mapNonEmpty!4293 () Bool)

(declare-fun mapRes!4294 () Bool)

(declare-fun tp!10581 () Bool)

(declare-fun e!75837 () Bool)

(assert (=> mapNonEmpty!4293 (= mapRes!4294 (and tp!10581 e!75837))))

(declare-fun mapValue!4294 () ValueCell!1049)

(declare-fun mapKey!4294 () (_ BitVec 32))

(declare-fun mapRest!4294 () (Array (_ BitVec 32) ValueCell!1049))

(assert (=> mapNonEmpty!4293 (= (arr!2163 (_values!2697 (v!3046 (underlying!414 thiss!992)))) (store mapRest!4294 mapKey!4294 mapValue!4294))))

(declare-fun b!116139 () Bool)

(declare-fun e!75838 () Bool)

(declare-fun e!75835 () Bool)

(assert (=> b!116139 (= e!75838 (and e!75835 mapRes!4293))))

(declare-fun condMapEmpty!4294 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1006)

(declare-fun mapDefault!4293 () ValueCell!1049)

(assert (=> b!116139 (= condMapEmpty!4294 (= (arr!2163 (_values!2697 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4293)))))

(declare-fun tp_is_empty!2785 () Bool)

(declare-fun array_inv!1353 (array!4561) Bool)

(declare-fun array_inv!1354 (array!4563) Bool)

(assert (=> b!116140 (= e!75831 (and tp!10580 tp_is_empty!2785 (array_inv!1353 (_keys!4437 newMap!16)) (array_inv!1354 (_values!2697 newMap!16)) e!75838))))

(declare-fun b!116141 () Bool)

(declare-fun e!75833 () Bool)

(declare-fun valid!487 (LongMapFixedSize!1006) Bool)

(assert (=> b!116141 (= e!75833 (not (valid!487 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun e!75826 () Bool)

(assert (=> b!116142 (= e!75825 (and tp!10579 tp_is_empty!2785 (array_inv!1353 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (array_inv!1354 (_values!2697 (v!3046 (underlying!414 thiss!992)))) e!75826))))

(declare-fun b!116143 () Bool)

(declare-fun res!56931 () Bool)

(assert (=> b!116143 (=> (not res!56931) (not e!75830))))

(assert (=> b!116143 (= res!56931 (valid!487 newMap!16))))

(declare-fun b!116144 () Bool)

(assert (=> b!116144 (= e!75827 e!75834)))

(declare-fun mapIsEmpty!4294 () Bool)

(assert (=> mapIsEmpty!4294 mapRes!4294))

(declare-fun b!116145 () Bool)

(declare-fun e!75832 () Bool)

(assert (=> b!116145 (= e!75826 (and e!75832 mapRes!4294))))

(declare-fun condMapEmpty!4293 () Bool)

(declare-fun mapDefault!4294 () ValueCell!1049)

(assert (=> b!116145 (= condMapEmpty!4293 (= (arr!2163 (_values!2697 (v!3046 (underlying!414 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4294)))))

(declare-fun b!116146 () Bool)

(declare-fun res!56932 () Bool)

(assert (=> b!116146 (=> (not res!56932) (not e!75830))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2482 0))(
  ( (tuple2!2483 (_1!1252 (_ BitVec 64)) (_2!1252 V!3361)) )
))
(declare-datatypes ((List!1655 0))(
  ( (Nil!1652) (Cons!1651 (h!2251 tuple2!2482) (t!5913 List!1655)) )
))
(declare-datatypes ((ListLongMap!1603 0))(
  ( (ListLongMap!1604 (toList!817 List!1655)) )
))
(declare-fun getCurrentListMap!498 (array!4561 array!4563 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 32) Int) ListLongMap!1603)

(declare-fun map!1348 (LongMapFixedSize!1006) ListLongMap!1603)

(assert (=> b!116146 (= res!56932 (= (getCurrentListMap!498 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))) (map!1348 newMap!16)))))

(declare-fun b!116147 () Bool)

(declare-fun res!56929 () Bool)

(assert (=> b!116147 (=> (not res!56929) (not e!75830))))

(assert (=> b!116147 (= res!56929 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116148 () Bool)

(assert (=> b!116148 (= e!75837 tp_is_empty!2785)))

(declare-fun b!116149 () Bool)

(declare-fun e!75828 () Bool)

(assert (=> b!116149 (= e!75828 tp_is_empty!2785)))

(declare-fun b!116150 () Bool)

(assert (=> b!116150 (= e!75830 e!75833)))

(declare-fun res!56933 () Bool)

(assert (=> b!116150 (=> (not res!56933) (not e!75833))))

(declare-datatypes ((tuple2!2484 0))(
  ( (tuple2!2485 (_1!1253 Bool) (_2!1253 LongMapFixedSize!1006)) )
))
(declare-fun lt!60252 () tuple2!2484)

(assert (=> b!116150 (= res!56933 (_1!1253 lt!60252))))

(declare-fun repackFrom!14 (LongMap!806 LongMapFixedSize!1006 (_ BitVec 32)) tuple2!2484)

(assert (=> b!116150 (= lt!60252 (repackFrom!14 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!116151 () Bool)

(declare-fun res!56928 () Bool)

(assert (=> b!116151 (=> (not res!56928) (not e!75830))))

(assert (=> b!116151 (= res!56928 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6930 newMap!16)) (_size!552 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116152 () Bool)

(declare-fun res!56935 () Bool)

(assert (=> b!116152 (=> (not res!56935) (not e!75833))))

(assert (=> b!116152 (= res!56935 (valid!487 (_2!1253 lt!60252)))))

(declare-fun b!116153 () Bool)

(assert (=> b!116153 (= e!75832 tp_is_empty!2785)))

(declare-fun b!116154 () Bool)

(declare-fun res!56930 () Bool)

(assert (=> b!116154 (=> (not res!56930) (not e!75830))))

(assert (=> b!116154 (= res!56930 (and (or (= (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!4294 () Bool)

(declare-fun tp!10582 () Bool)

(assert (=> mapNonEmpty!4294 (= mapRes!4293 (and tp!10582 e!75828))))

(declare-fun mapValue!4293 () ValueCell!1049)

(declare-fun mapRest!4293 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapKey!4293 () (_ BitVec 32))

(assert (=> mapNonEmpty!4294 (= (arr!2163 (_values!2697 newMap!16)) (store mapRest!4293 mapKey!4293 mapValue!4293))))

(declare-fun b!116155 () Bool)

(assert (=> b!116155 (= e!75835 tp_is_empty!2785)))

(assert (= (and start!13206 res!56934) b!116147))

(assert (= (and b!116147 res!56929) b!116143))

(assert (= (and b!116143 res!56931) b!116151))

(assert (= (and b!116151 res!56928) b!116146))

(assert (= (and b!116146 res!56932) b!116154))

(assert (= (and b!116154 res!56930) b!116150))

(assert (= (and b!116150 res!56933) b!116152))

(assert (= (and b!116152 res!56935) b!116141))

(assert (= (and b!116145 condMapEmpty!4293) mapIsEmpty!4294))

(assert (= (and b!116145 (not condMapEmpty!4293)) mapNonEmpty!4293))

(get-info :version)

(assert (= (and mapNonEmpty!4293 ((_ is ValueCellFull!1049) mapValue!4294)) b!116148))

(assert (= (and b!116145 ((_ is ValueCellFull!1049) mapDefault!4294)) b!116153))

(assert (= b!116142 b!116145))

(assert (= b!116138 b!116142))

(assert (= b!116144 b!116138))

(assert (= start!13206 b!116144))

(assert (= (and b!116139 condMapEmpty!4294) mapIsEmpty!4293))

(assert (= (and b!116139 (not condMapEmpty!4294)) mapNonEmpty!4294))

(assert (= (and mapNonEmpty!4294 ((_ is ValueCellFull!1049) mapValue!4293)) b!116149))

(assert (= (and b!116139 ((_ is ValueCellFull!1049) mapDefault!4293)) b!116155))

(assert (= b!116140 b!116139))

(assert (= start!13206 b!116140))

(declare-fun m!132187 () Bool)

(assert (=> mapNonEmpty!4294 m!132187))

(declare-fun m!132189 () Bool)

(assert (=> b!116140 m!132189))

(declare-fun m!132191 () Bool)

(assert (=> b!116140 m!132191))

(declare-fun m!132193 () Bool)

(assert (=> mapNonEmpty!4293 m!132193))

(declare-fun m!132195 () Bool)

(assert (=> b!116150 m!132195))

(declare-fun m!132197 () Bool)

(assert (=> b!116146 m!132197))

(declare-fun m!132199 () Bool)

(assert (=> b!116146 m!132199))

(declare-fun m!132201 () Bool)

(assert (=> b!116142 m!132201))

(declare-fun m!132203 () Bool)

(assert (=> b!116142 m!132203))

(declare-fun m!132205 () Bool)

(assert (=> b!116152 m!132205))

(declare-fun m!132207 () Bool)

(assert (=> start!13206 m!132207))

(declare-fun m!132209 () Bool)

(assert (=> b!116154 m!132209))

(declare-fun m!132211 () Bool)

(assert (=> b!116143 m!132211))

(declare-fun m!132213 () Bool)

(assert (=> b!116141 m!132213))

(check-sat tp_is_empty!2785 (not b!116152) b_and!7231 (not mapNonEmpty!4293) (not b_next!2739) (not mapNonEmpty!4294) (not b!116141) (not b_next!2737) (not start!13206) (not b!116140) (not b!116143) (not b!116150) (not b!116146) (not b!116142) b_and!7229)
(check-sat b_and!7229 b_and!7231 (not b_next!2737) (not b_next!2739))
(get-model)

(declare-fun d!32575 () Bool)

(declare-fun res!56990 () Bool)

(declare-fun e!75925 () Bool)

(assert (=> d!32575 (=> (not res!56990) (not e!75925))))

(declare-fun simpleValid!81 (LongMapFixedSize!1006) Bool)

(assert (=> d!32575 (= res!56990 (simpleValid!81 newMap!16))))

(assert (=> d!32575 (= (valid!487 newMap!16) e!75925)))

(declare-fun b!116270 () Bool)

(declare-fun res!56991 () Bool)

(assert (=> b!116270 (=> (not res!56991) (not e!75925))))

(declare-fun arrayCountValidKeys!0 (array!4561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116270 (= res!56991 (= (arrayCountValidKeys!0 (_keys!4437 newMap!16) #b00000000000000000000000000000000 (size!2423 (_keys!4437 newMap!16))) (_size!552 newMap!16)))))

(declare-fun b!116271 () Bool)

(declare-fun res!56992 () Bool)

(assert (=> b!116271 (=> (not res!56992) (not e!75925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4561 (_ BitVec 32)) Bool)

(assert (=> b!116271 (= res!56992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4437 newMap!16) (mask!6930 newMap!16)))))

(declare-fun b!116272 () Bool)

(declare-datatypes ((List!1657 0))(
  ( (Nil!1654) (Cons!1653 (h!2253 (_ BitVec 64)) (t!5919 List!1657)) )
))
(declare-fun arrayNoDuplicates!0 (array!4561 (_ BitVec 32) List!1657) Bool)

(assert (=> b!116272 (= e!75925 (arrayNoDuplicates!0 (_keys!4437 newMap!16) #b00000000000000000000000000000000 Nil!1654))))

(assert (= (and d!32575 res!56990) b!116270))

(assert (= (and b!116270 res!56991) b!116271))

(assert (= (and b!116271 res!56992) b!116272))

(declare-fun m!132271 () Bool)

(assert (=> d!32575 m!132271))

(declare-fun m!132273 () Bool)

(assert (=> b!116270 m!132273))

(declare-fun m!132275 () Bool)

(assert (=> b!116271 m!132275))

(declare-fun m!132277 () Bool)

(assert (=> b!116272 m!132277))

(assert (=> b!116143 d!32575))

(declare-fun d!32577 () Bool)

(assert (=> d!32577 (= (valid!486 thiss!992) (valid!487 (v!3046 (underlying!414 thiss!992))))))

(declare-fun bs!4734 () Bool)

(assert (= bs!4734 d!32577))

(assert (=> bs!4734 m!132213))

(assert (=> start!13206 d!32577))

(declare-fun d!32579 () Bool)

(declare-fun res!56993 () Bool)

(declare-fun e!75926 () Bool)

(assert (=> d!32579 (=> (not res!56993) (not e!75926))))

(assert (=> d!32579 (= res!56993 (simpleValid!81 (_2!1253 lt!60252)))))

(assert (=> d!32579 (= (valid!487 (_2!1253 lt!60252)) e!75926)))

(declare-fun b!116273 () Bool)

(declare-fun res!56994 () Bool)

(assert (=> b!116273 (=> (not res!56994) (not e!75926))))

(assert (=> b!116273 (= res!56994 (= (arrayCountValidKeys!0 (_keys!4437 (_2!1253 lt!60252)) #b00000000000000000000000000000000 (size!2423 (_keys!4437 (_2!1253 lt!60252)))) (_size!552 (_2!1253 lt!60252))))))

(declare-fun b!116274 () Bool)

(declare-fun res!56995 () Bool)

(assert (=> b!116274 (=> (not res!56995) (not e!75926))))

(assert (=> b!116274 (= res!56995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4437 (_2!1253 lt!60252)) (mask!6930 (_2!1253 lt!60252))))))

(declare-fun b!116275 () Bool)

(assert (=> b!116275 (= e!75926 (arrayNoDuplicates!0 (_keys!4437 (_2!1253 lt!60252)) #b00000000000000000000000000000000 Nil!1654))))

(assert (= (and d!32579 res!56993) b!116273))

(assert (= (and b!116273 res!56994) b!116274))

(assert (= (and b!116274 res!56995) b!116275))

(declare-fun m!132279 () Bool)

(assert (=> d!32579 m!132279))

(declare-fun m!132281 () Bool)

(assert (=> b!116273 m!132281))

(declare-fun m!132283 () Bool)

(assert (=> b!116274 m!132283))

(declare-fun m!132285 () Bool)

(assert (=> b!116275 m!132285))

(assert (=> b!116152 d!32579))

(declare-fun b!116304 () Bool)

(declare-fun e!75943 () tuple2!2484)

(declare-fun lt!60347 () tuple2!2484)

(assert (=> b!116304 (= e!75943 (tuple2!2485 true (_2!1253 lt!60347)))))

(declare-fun lt!60328 () ListLongMap!1603)

(declare-fun call!12432 () ListLongMap!1603)

(assert (=> b!116304 (= lt!60328 call!12432)))

(declare-fun lt!60341 () (_ BitVec 64))

(assert (=> b!116304 (= lt!60341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!3596 0))(
  ( (Unit!3597) )
))
(declare-fun lt!60331 () Unit!3596)

(declare-fun call!12426 () Unit!3596)

(assert (=> b!116304 (= lt!60331 call!12426)))

(declare-fun call!12431 () ListLongMap!1603)

(declare-fun call!12428 () ListLongMap!1603)

(assert (=> b!116304 (= call!12431 call!12428)))

(declare-fun lt!60348 () Unit!3596)

(assert (=> b!116304 (= lt!60348 lt!60331)))

(declare-fun lt!60342 () ListLongMap!1603)

(declare-fun call!12436 () ListLongMap!1603)

(assert (=> b!116304 (= lt!60342 call!12436)))

(declare-fun lt!60344 () (_ BitVec 64))

(assert (=> b!116304 (= lt!60344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60337 () Unit!3596)

(declare-fun call!12430 () Unit!3596)

(assert (=> b!116304 (= lt!60337 call!12430)))

(declare-fun call!12429 () ListLongMap!1603)

(declare-fun call!12435 () ListLongMap!1603)

(assert (=> b!116304 (= call!12429 call!12435)))

(declare-fun lt!60343 () Unit!3596)

(assert (=> b!116304 (= lt!60343 lt!60337)))

(declare-fun b!116305 () Bool)

(declare-fun e!75949 () tuple2!2484)

(declare-fun e!75945 () tuple2!2484)

(assert (=> b!116305 (= e!75949 e!75945)))

(declare-fun lt!60346 () V!3361)

(declare-fun lt!60326 () (_ BitVec 64))

(declare-fun update!181 (LongMapFixedSize!1006 (_ BitVec 64) V!3361) tuple2!2484)

(assert (=> b!116305 (= lt!60347 (update!181 newMap!16 lt!60326 lt!60346))))

(declare-fun c!20595 () Bool)

(declare-fun lt!60350 () ListLongMap!1603)

(declare-fun contains!851 (ListLongMap!1603 (_ BitVec 64)) Bool)

(assert (=> b!116305 (= c!20595 (contains!851 lt!60350 lt!60326))))

(declare-fun lt!60338 () Unit!3596)

(declare-fun e!75946 () Unit!3596)

(assert (=> b!116305 (= lt!60338 e!75946)))

(declare-fun c!20592 () Bool)

(assert (=> b!116305 (= c!20592 (_1!1253 lt!60347))))

(declare-fun b!116306 () Bool)

(declare-fun e!75950 () Bool)

(declare-fun lt!60339 () tuple2!2484)

(assert (=> b!116306 (= e!75950 (= (map!1348 (_2!1253 lt!60339)) (map!1348 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116307 () Bool)

(declare-fun e!75947 () tuple2!2484)

(assert (=> b!116307 (= e!75947 (tuple2!2485 true newMap!16))))

(declare-fun d!32581 () Bool)

(declare-fun e!75948 () Bool)

(assert (=> d!32581 e!75948))

(declare-fun res!57000 () Bool)

(assert (=> d!32581 (=> res!57000 e!75948)))

(assert (=> d!32581 (= res!57000 (not (_1!1253 lt!60339)))))

(assert (=> d!32581 (= lt!60339 e!75949)))

(declare-fun c!20591 () Bool)

(assert (=> d!32581 (= c!20591 (and (not (= lt!60326 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60326 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32581 (= lt!60350 (map!1348 newMap!16))))

(declare-fun get!1416 (ValueCell!1049 V!3361) V!3361)

(declare-fun dynLambda!409 (Int (_ BitVec 64)) V!3361)

(assert (=> d!32581 (= lt!60346 (get!1416 (select (arr!2163 (_values!2697 (v!3046 (underlying!414 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2714 (v!3046 (underlying!414 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32581 (= lt!60326 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!32581 (valid!486 thiss!992)))

(assert (=> d!32581 (= (repackFrom!14 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!60339)))

(declare-fun b!116308 () Bool)

(declare-fun c!20593 () Bool)

(assert (=> b!116308 (= c!20593 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!116308 (= e!75945 e!75943)))

(declare-fun lt!60349 () ListLongMap!1603)

(declare-fun bm!12421 () Bool)

(declare-fun call!12433 () ListLongMap!1603)

(declare-fun +!158 (ListLongMap!1603 tuple2!2482) ListLongMap!1603)

(assert (=> bm!12421 (= call!12433 (+!158 (ite c!20593 lt!60349 lt!60328) (ite c!20593 (tuple2!2483 lt!60326 lt!60346) (tuple2!2483 lt!60341 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116309 () Bool)

(declare-fun lt!60334 () tuple2!2484)

(assert (=> b!116309 (= e!75943 (tuple2!2485 (_1!1253 lt!60334) (_2!1253 lt!60334)))))

(declare-fun lt!60323 () ListLongMap!1603)

(assert (=> b!116309 (= lt!60323 call!12432)))

(declare-fun lt!60325 () (_ BitVec 64))

(assert (=> b!116309 (= lt!60325 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60327 () Unit!3596)

(assert (=> b!116309 (= lt!60327 call!12426)))

(assert (=> b!116309 (= call!12435 call!12429)))

(declare-fun lt!60333 () Unit!3596)

(assert (=> b!116309 (= lt!60333 lt!60327)))

(assert (=> b!116309 (= lt!60349 call!12428)))

(declare-fun lt!60330 () (_ BitVec 64))

(assert (=> b!116309 (= lt!60330 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60354 () Unit!3596)

(assert (=> b!116309 (= lt!60354 call!12430)))

(assert (=> b!116309 (= call!12436 call!12431)))

(declare-fun lt!60340 () Unit!3596)

(assert (=> b!116309 (= lt!60340 lt!60354)))

(declare-fun call!12434 () tuple2!2484)

(assert (=> b!116309 (= lt!60334 call!12434)))

(declare-fun bm!12422 () Bool)

(declare-fun call!12424 () ListLongMap!1603)

(declare-fun call!12427 () ListLongMap!1603)

(assert (=> bm!12422 (= call!12429 (+!158 (ite c!20593 call!12427 call!12424) (ite c!20593 (tuple2!2483 lt!60326 lt!60346) (tuple2!2483 lt!60344 (minValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116310 () Bool)

(declare-fun e!75944 () Bool)

(assert (=> b!116310 (= e!75944 (ite (= lt!60326 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!12423 () Bool)

(declare-fun call!12425 () ListLongMap!1603)

(assert (=> bm!12423 (= call!12425 (+!158 (ite c!20593 lt!60349 lt!60342) (ite c!20593 (tuple2!2483 lt!60330 (minValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 lt!60344 (minValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun bm!12424 () Bool)

(assert (=> bm!12424 (= call!12424 (+!158 (ite c!20593 lt!60323 lt!60342) (tuple2!2483 lt!60326 lt!60346)))))

(declare-fun bm!12425 () Bool)

(assert (=> bm!12425 (= call!12436 (+!158 (ite c!20593 call!12433 call!12432) (ite c!20593 (tuple2!2483 lt!60330 (minValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116311 () Bool)

(declare-fun lt!60332 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!4561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!116311 (= e!75944 (arrayContainsKey!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) lt!60326 lt!60332))))

(declare-fun b!116312 () Bool)

(assert (=> b!116312 (= e!75948 e!75950)))

(declare-fun res!57001 () Bool)

(assert (=> b!116312 (=> (not res!57001) (not e!75950))))

(assert (=> b!116312 (= res!57001 (valid!487 (_2!1253 lt!60339)))))

(declare-fun b!116313 () Bool)

(assert (=> b!116313 false))

(declare-fun lt!60329 () Unit!3596)

(declare-fun lt!60335 () Unit!3596)

(assert (=> b!116313 (= lt!60329 lt!60335)))

(declare-fun lt!60352 () (_ BitVec 32))

(assert (=> b!116313 (not (arrayContainsKey!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) lt!60326 lt!60352))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4561 (_ BitVec 32) (_ BitVec 64) List!1657) Unit!3596)

(assert (=> b!116313 (= lt!60335 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) lt!60352 lt!60326 (Cons!1653 lt!60326 Nil!1654)))))

(assert (=> b!116313 (= lt!60352 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!60351 () Unit!3596)

(declare-fun lt!60353 () Unit!3596)

(assert (=> b!116313 (= lt!60351 lt!60353)))

(assert (=> b!116313 (arrayNoDuplicates!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1654)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4561 (_ BitVec 32) (_ BitVec 32)) Unit!3596)

(assert (=> b!116313 (= lt!60353 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!60336 () Unit!3596)

(declare-fun lt!60345 () Unit!3596)

(assert (=> b!116313 (= lt!60336 lt!60345)))

(assert (=> b!116313 e!75944))

(declare-fun c!20590 () Bool)

(assert (=> b!116313 (= c!20590 (and (not (= lt!60326 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60326 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!121 (array!4561 array!4563 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 64) (_ BitVec 32) Int) Unit!3596)

(assert (=> b!116313 (= lt!60345 (lemmaListMapContainsThenArrayContainsFrom!121 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) lt!60326 lt!60332 (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(assert (=> b!116313 (= lt!60332 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!3598 () Unit!3596)

(assert (=> b!116313 (= e!75946 Unit!3598)))

(declare-fun bm!12426 () Bool)

(assert (=> bm!12426 (= call!12428 (+!158 (ite c!20593 call!12432 call!12433) (ite c!20593 (tuple2!2483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 lt!60326 lt!60346))))))

(declare-fun bm!12427 () Bool)

(assert (=> bm!12427 (= call!12435 (+!158 (ite c!20593 call!12424 call!12425) (ite c!20593 (tuple2!2483 lt!60325 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 lt!60326 lt!60346))))))

(declare-fun b!116314 () Bool)

(declare-fun lt!60324 () tuple2!2484)

(assert (=> b!116314 (= lt!60324 call!12434)))

(assert (=> b!116314 (= e!75947 (tuple2!2485 (_1!1253 lt!60324) (_2!1253 lt!60324)))))

(declare-fun b!116315 () Bool)

(assert (=> b!116315 (= e!75945 (tuple2!2485 false (_2!1253 lt!60347)))))

(declare-fun bm!12428 () Bool)

(assert (=> bm!12428 (= call!12427 (+!158 (ite c!20593 lt!60323 lt!60328) (ite c!20593 (tuple2!2483 lt!60325 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 lt!60326 lt!60346))))))

(declare-fun bm!12429 () Bool)

(assert (=> bm!12429 (= call!12431 (+!158 (ite c!20593 call!12425 call!12427) (ite c!20593 (tuple2!2483 lt!60326 lt!60346) (tuple2!2483 lt!60341 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116316 () Bool)

(assert (=> b!116316 (= e!75949 e!75947)))

(declare-fun c!20594 () Bool)

(assert (=> b!116316 (= c!20594 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!12430 () Bool)

(assert (=> bm!12430 (= call!12434 (repackFrom!14 thiss!992 (ite c!20591 (_2!1253 lt!60347) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!12431 () Bool)

(declare-fun addCommutativeForDiffKeys!70 (ListLongMap!1603 (_ BitVec 64) V!3361 (_ BitVec 64) V!3361) Unit!3596)

(assert (=> bm!12431 (= call!12430 (addCommutativeForDiffKeys!70 (ite c!20593 lt!60349 lt!60342) lt!60326 lt!60346 (ite c!20593 lt!60330 lt!60344) (minValue!2581 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun bm!12432 () Bool)

(assert (=> bm!12432 (= call!12426 (addCommutativeForDiffKeys!70 (ite c!20593 lt!60323 lt!60328) lt!60326 lt!60346 (ite c!20593 lt!60325 lt!60341) (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun bm!12433 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!125 (array!4561 array!4563 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 32) Int) ListLongMap!1603)

(assert (=> bm!12433 (= call!12432 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116317 () Bool)

(declare-fun Unit!3599 () Unit!3596)

(assert (=> b!116317 (= e!75946 Unit!3599)))

(assert (= (and d!32581 c!20591) b!116305))

(assert (= (and d!32581 (not c!20591)) b!116316))

(assert (= (and b!116305 c!20595) b!116313))

(assert (= (and b!116305 (not c!20595)) b!116317))

(assert (= (and b!116313 c!20590) b!116311))

(assert (= (and b!116313 (not c!20590)) b!116310))

(assert (= (and b!116305 c!20592) b!116308))

(assert (= (and b!116305 (not c!20592)) b!116315))

(assert (= (and b!116308 c!20593) b!116309))

(assert (= (and b!116308 (not c!20593)) b!116304))

(assert (= (or b!116309 b!116304) bm!12432))

(assert (= (or b!116309 b!116304) bm!12421))

(assert (= (or b!116309 b!116304) bm!12423))

(assert (= (or b!116309 b!116304) bm!12433))

(assert (= (or b!116309 b!116304) bm!12424))

(assert (= (or b!116309 b!116304) bm!12431))

(assert (= (or b!116309 b!116304) bm!12428))

(assert (= (or b!116309 b!116304) bm!12429))

(assert (= (or b!116309 b!116304) bm!12422))

(assert (= (or b!116309 b!116304) bm!12427))

(assert (= (or b!116309 b!116304) bm!12426))

(assert (= (or b!116309 b!116304) bm!12425))

(assert (= (and b!116316 c!20594) b!116314))

(assert (= (and b!116316 (not c!20594)) b!116307))

(assert (= (or b!116309 b!116314) bm!12430))

(assert (= (and d!32581 (not res!57000)) b!116312))

(assert (= (and b!116312 res!57001) b!116306))

(declare-fun b_lambda!5169 () Bool)

(assert (=> (not b_lambda!5169) (not d!32581)))

(declare-fun t!5916 () Bool)

(declare-fun tb!2225 () Bool)

(assert (=> (and b!116142 (= (defaultEntry!2714 (v!3046 (underlying!414 thiss!992))) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))) t!5916) tb!2225))

(declare-fun result!3711 () Bool)

(assert (=> tb!2225 (= result!3711 tp_is_empty!2785)))

(assert (=> d!32581 t!5916))

(declare-fun b_and!7241 () Bool)

(assert (= b_and!7229 (and (=> t!5916 result!3711) b_and!7241)))

(declare-fun t!5918 () Bool)

(declare-fun tb!2227 () Bool)

(assert (=> (and b!116140 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))) t!5918) tb!2227))

(declare-fun result!3715 () Bool)

(assert (= result!3715 result!3711))

(assert (=> d!32581 t!5918))

(declare-fun b_and!7243 () Bool)

(assert (= b_and!7231 (and (=> t!5918 result!3715) b_and!7243)))

(declare-fun m!132287 () Bool)

(assert (=> b!116313 m!132287))

(declare-fun m!132289 () Bool)

(assert (=> b!116313 m!132289))

(declare-fun m!132291 () Bool)

(assert (=> b!116313 m!132291))

(declare-fun m!132293 () Bool)

(assert (=> b!116313 m!132293))

(declare-fun m!132295 () Bool)

(assert (=> b!116313 m!132295))

(declare-fun m!132297 () Bool)

(assert (=> bm!12421 m!132297))

(declare-fun m!132299 () Bool)

(assert (=> bm!12433 m!132299))

(declare-fun m!132301 () Bool)

(assert (=> b!116306 m!132301))

(declare-fun m!132303 () Bool)

(assert (=> b!116306 m!132303))

(declare-fun m!132305 () Bool)

(assert (=> bm!12430 m!132305))

(declare-fun m!132307 () Bool)

(assert (=> bm!12423 m!132307))

(declare-fun m!132309 () Bool)

(assert (=> bm!12429 m!132309))

(declare-fun m!132311 () Bool)

(assert (=> d!32581 m!132311))

(declare-fun m!132313 () Bool)

(assert (=> d!32581 m!132313))

(assert (=> d!32581 m!132311))

(declare-fun m!132315 () Bool)

(assert (=> d!32581 m!132315))

(declare-fun m!132317 () Bool)

(assert (=> d!32581 m!132317))

(assert (=> d!32581 m!132207))

(assert (=> d!32581 m!132315))

(assert (=> d!32581 m!132199))

(declare-fun m!132319 () Bool)

(assert (=> bm!12427 m!132319))

(declare-fun m!132321 () Bool)

(assert (=> bm!12428 m!132321))

(declare-fun m!132323 () Bool)

(assert (=> bm!12432 m!132323))

(declare-fun m!132325 () Bool)

(assert (=> bm!12422 m!132325))

(declare-fun m!132327 () Bool)

(assert (=> bm!12424 m!132327))

(declare-fun m!132329 () Bool)

(assert (=> bm!12425 m!132329))

(declare-fun m!132331 () Bool)

(assert (=> b!116305 m!132331))

(declare-fun m!132333 () Bool)

(assert (=> b!116305 m!132333))

(declare-fun m!132335 () Bool)

(assert (=> bm!12426 m!132335))

(declare-fun m!132337 () Bool)

(assert (=> bm!12431 m!132337))

(declare-fun m!132339 () Bool)

(assert (=> b!116311 m!132339))

(declare-fun m!132341 () Bool)

(assert (=> b!116312 m!132341))

(assert (=> b!116150 d!32581))

(declare-fun d!32583 () Bool)

(assert (=> d!32583 (= (array_inv!1353 (_keys!4437 newMap!16)) (bvsge (size!2423 (_keys!4437 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116140 d!32583))

(declare-fun d!32585 () Bool)

(assert (=> d!32585 (= (array_inv!1354 (_values!2697 newMap!16)) (bvsge (size!2424 (_values!2697 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116140 d!32585))

(declare-fun d!32587 () Bool)

(assert (=> d!32587 (= (array_inv!1353 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvsge (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116142 d!32587))

(declare-fun d!32589 () Bool)

(assert (=> d!32589 (= (array_inv!1354 (_values!2697 (v!3046 (underlying!414 thiss!992)))) (bvsge (size!2424 (_values!2697 (v!3046 (underlying!414 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116142 d!32589))

(declare-fun b!116362 () Bool)

(declare-fun e!75979 () Bool)

(declare-fun e!75984 () Bool)

(assert (=> b!116362 (= e!75979 e!75984)))

(declare-fun res!57026 () Bool)

(declare-fun call!12456 () Bool)

(assert (=> b!116362 (= res!57026 call!12456)))

(assert (=> b!116362 (=> (not res!57026) (not e!75984))))

(declare-fun b!116363 () Bool)

(declare-fun e!75986 () ListLongMap!1603)

(declare-fun call!12451 () ListLongMap!1603)

(assert (=> b!116363 (= e!75986 call!12451)))

(declare-fun b!116364 () Bool)

(declare-fun e!75989 () Bool)

(declare-fun e!75981 () Bool)

(assert (=> b!116364 (= e!75989 e!75981)))

(declare-fun res!57023 () Bool)

(assert (=> b!116364 (=> (not res!57023) (not e!75981))))

(declare-fun lt!60411 () ListLongMap!1603)

(assert (=> b!116364 (= res!57023 (contains!851 lt!60411 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116364 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116365 () Bool)

(declare-fun e!75983 () Bool)

(declare-fun e!75987 () Bool)

(assert (=> b!116365 (= e!75983 e!75987)))

(declare-fun res!57022 () Bool)

(declare-fun call!12455 () Bool)

(assert (=> b!116365 (= res!57022 call!12455)))

(assert (=> b!116365 (=> (not res!57022) (not e!75987))))

(declare-fun b!116366 () Bool)

(declare-fun apply!105 (ListLongMap!1603 (_ BitVec 64)) V!3361)

(assert (=> b!116366 (= e!75984 (= (apply!105 lt!60411 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2581 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116368 () Bool)

(declare-fun e!75977 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116368 (= e!75977 (validKeyInArray!0 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116369 () Bool)

(declare-fun e!75980 () ListLongMap!1603)

(assert (=> b!116369 (= e!75980 e!75986)))

(declare-fun c!20612 () Bool)

(assert (=> b!116369 (= c!20612 (and (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116370 () Bool)

(declare-fun e!75988 () Bool)

(assert (=> b!116370 (= e!75988 (validKeyInArray!0 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116371 () Bool)

(declare-fun res!57028 () Bool)

(declare-fun e!75985 () Bool)

(assert (=> b!116371 (=> (not res!57028) (not e!75985))))

(assert (=> b!116371 (= res!57028 e!75989)))

(declare-fun res!57024 () Bool)

(assert (=> b!116371 (=> res!57024 e!75989)))

(assert (=> b!116371 (= res!57024 (not e!75977))))

(declare-fun res!57027 () Bool)

(assert (=> b!116371 (=> (not res!57027) (not e!75977))))

(assert (=> b!116371 (= res!57027 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun b!116372 () Bool)

(declare-fun e!75982 () Unit!3596)

(declare-fun Unit!3600 () Unit!3596)

(assert (=> b!116372 (= e!75982 Unit!3600)))

(declare-fun b!116373 () Bool)

(declare-fun c!20609 () Bool)

(assert (=> b!116373 (= c!20609 (and (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!75978 () ListLongMap!1603)

(assert (=> b!116373 (= e!75986 e!75978)))

(declare-fun bm!12448 () Bool)

(declare-fun call!12452 () ListLongMap!1603)

(declare-fun call!12453 () ListLongMap!1603)

(assert (=> bm!12448 (= call!12452 call!12453)))

(declare-fun bm!12449 () Bool)

(declare-fun call!12454 () ListLongMap!1603)

(declare-fun c!20611 () Bool)

(declare-fun call!12457 () ListLongMap!1603)

(assert (=> bm!12449 (= call!12457 (+!158 (ite c!20611 call!12453 (ite c!20612 call!12452 call!12454)) (ite (or c!20611 c!20612) (tuple2!2483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))) (tuple2!2483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2581 (v!3046 (underlying!414 thiss!992)))))))))

(declare-fun b!116374 () Bool)

(assert (=> b!116374 (= e!75983 (not call!12455))))

(declare-fun b!116375 () Bool)

(assert (=> b!116375 (= e!75985 e!75979)))

(declare-fun c!20613 () Bool)

(assert (=> b!116375 (= c!20613 (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116376 () Bool)

(assert (=> b!116376 (= e!75978 call!12454)))

(declare-fun bm!12450 () Bool)

(assert (=> bm!12450 (= call!12454 call!12452)))

(declare-fun bm!12451 () Bool)

(assert (=> bm!12451 (= call!12456 (contains!851 lt!60411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116377 () Bool)

(declare-fun lt!60419 () Unit!3596)

(assert (=> b!116377 (= e!75982 lt!60419)))

(declare-fun lt!60416 () ListLongMap!1603)

(assert (=> b!116377 (= lt!60416 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60414 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60405 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60405 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60413 () Unit!3596)

(declare-fun addStillContains!81 (ListLongMap!1603 (_ BitVec 64) V!3361 (_ BitVec 64)) Unit!3596)

(assert (=> b!116377 (= lt!60413 (addStillContains!81 lt!60416 lt!60414 (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) lt!60405))))

(assert (=> b!116377 (contains!851 (+!158 lt!60416 (tuple2!2483 lt!60414 (zeroValue!2581 (v!3046 (underlying!414 thiss!992))))) lt!60405)))

(declare-fun lt!60408 () Unit!3596)

(assert (=> b!116377 (= lt!60408 lt!60413)))

(declare-fun lt!60412 () ListLongMap!1603)

(assert (=> b!116377 (= lt!60412 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60399 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60399 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60403 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60403 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60400 () Unit!3596)

(declare-fun addApplyDifferent!81 (ListLongMap!1603 (_ BitVec 64) V!3361 (_ BitVec 64)) Unit!3596)

(assert (=> b!116377 (= lt!60400 (addApplyDifferent!81 lt!60412 lt!60399 (minValue!2581 (v!3046 (underlying!414 thiss!992))) lt!60403))))

(assert (=> b!116377 (= (apply!105 (+!158 lt!60412 (tuple2!2483 lt!60399 (minValue!2581 (v!3046 (underlying!414 thiss!992))))) lt!60403) (apply!105 lt!60412 lt!60403))))

(declare-fun lt!60406 () Unit!3596)

(assert (=> b!116377 (= lt!60406 lt!60400)))

(declare-fun lt!60409 () ListLongMap!1603)

(assert (=> b!116377 (= lt!60409 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60410 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60418 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60418 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60401 () Unit!3596)

(assert (=> b!116377 (= lt!60401 (addApplyDifferent!81 lt!60409 lt!60410 (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) lt!60418))))

(assert (=> b!116377 (= (apply!105 (+!158 lt!60409 (tuple2!2483 lt!60410 (zeroValue!2581 (v!3046 (underlying!414 thiss!992))))) lt!60418) (apply!105 lt!60409 lt!60418))))

(declare-fun lt!60415 () Unit!3596)

(assert (=> b!116377 (= lt!60415 lt!60401)))

(declare-fun lt!60420 () ListLongMap!1603)

(assert (=> b!116377 (= lt!60420 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun lt!60417 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60404 () (_ BitVec 64))

(assert (=> b!116377 (= lt!60404 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116377 (= lt!60419 (addApplyDifferent!81 lt!60420 lt!60417 (minValue!2581 (v!3046 (underlying!414 thiss!992))) lt!60404))))

(assert (=> b!116377 (= (apply!105 (+!158 lt!60420 (tuple2!2483 lt!60417 (minValue!2581 (v!3046 (underlying!414 thiss!992))))) lt!60404) (apply!105 lt!60420 lt!60404))))

(declare-fun b!116378 () Bool)

(assert (=> b!116378 (= e!75987 (= (apply!105 lt!60411 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2581 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116379 () Bool)

(assert (=> b!116379 (= e!75978 call!12451)))

(declare-fun b!116380 () Bool)

(declare-fun res!57020 () Bool)

(assert (=> b!116380 (=> (not res!57020) (not e!75985))))

(assert (=> b!116380 (= res!57020 e!75983)))

(declare-fun c!20610 () Bool)

(assert (=> b!116380 (= c!20610 (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12452 () Bool)

(assert (=> bm!12452 (= call!12455 (contains!851 lt!60411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116381 () Bool)

(assert (=> b!116381 (= e!75981 (= (apply!105 lt!60411 (select (arr!2162 (_keys!4437 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1416 (select (arr!2163 (_values!2697 (v!3046 (underlying!414 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2714 (v!3046 (underlying!414 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2424 (_values!2697 (v!3046 (underlying!414 thiss!992))))))))

(assert (=> b!116381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))))))

(declare-fun bm!12453 () Bool)

(assert (=> bm!12453 (= call!12453 (getCurrentListMapNoExtraKeys!125 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun bm!12454 () Bool)

(assert (=> bm!12454 (= call!12451 call!12457)))

(declare-fun b!116382 () Bool)

(assert (=> b!116382 (= e!75979 (not call!12456))))

(declare-fun d!32591 () Bool)

(assert (=> d!32591 e!75985))

(declare-fun res!57021 () Bool)

(assert (=> d!32591 (=> (not res!57021) (not e!75985))))

(assert (=> d!32591 (= res!57021 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))))))))

(declare-fun lt!60402 () ListLongMap!1603)

(assert (=> d!32591 (= lt!60411 lt!60402)))

(declare-fun lt!60407 () Unit!3596)

(assert (=> d!32591 (= lt!60407 e!75982)))

(declare-fun c!20608 () Bool)

(assert (=> d!32591 (= c!20608 e!75988)))

(declare-fun res!57025 () Bool)

(assert (=> d!32591 (=> (not res!57025) (not e!75988))))

(assert (=> d!32591 (= res!57025 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))))))

(assert (=> d!32591 (= lt!60402 e!75980)))

(assert (=> d!32591 (= c!20611 (and (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32591 (validMask!0 (mask!6930 (v!3046 (underlying!414 thiss!992))))))

(assert (=> d!32591 (= (getCurrentListMap!498 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (_values!2697 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992))) (extraKeys!2503 (v!3046 (underlying!414 thiss!992))) (zeroValue!2581 (v!3046 (underlying!414 thiss!992))) (minValue!2581 (v!3046 (underlying!414 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992)))) lt!60411)))

(declare-fun b!116367 () Bool)

(assert (=> b!116367 (= e!75980 (+!158 call!12457 (tuple2!2483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2581 (v!3046 (underlying!414 thiss!992))))))))

(assert (= (and d!32591 c!20611) b!116367))

(assert (= (and d!32591 (not c!20611)) b!116369))

(assert (= (and b!116369 c!20612) b!116363))

(assert (= (and b!116369 (not c!20612)) b!116373))

(assert (= (and b!116373 c!20609) b!116379))

(assert (= (and b!116373 (not c!20609)) b!116376))

(assert (= (or b!116379 b!116376) bm!12450))

(assert (= (or b!116363 bm!12450) bm!12448))

(assert (= (or b!116363 b!116379) bm!12454))

(assert (= (or b!116367 bm!12448) bm!12453))

(assert (= (or b!116367 bm!12454) bm!12449))

(assert (= (and d!32591 res!57025) b!116370))

(assert (= (and d!32591 c!20608) b!116377))

(assert (= (and d!32591 (not c!20608)) b!116372))

(assert (= (and d!32591 res!57021) b!116371))

(assert (= (and b!116371 res!57027) b!116368))

(assert (= (and b!116371 (not res!57024)) b!116364))

(assert (= (and b!116364 res!57023) b!116381))

(assert (= (and b!116371 res!57028) b!116380))

(assert (= (and b!116380 c!20610) b!116365))

(assert (= (and b!116380 (not c!20610)) b!116374))

(assert (= (and b!116365 res!57022) b!116378))

(assert (= (or b!116365 b!116374) bm!12452))

(assert (= (and b!116380 res!57020) b!116375))

(assert (= (and b!116375 c!20613) b!116362))

(assert (= (and b!116375 (not c!20613)) b!116382))

(assert (= (and b!116362 res!57026) b!116366))

(assert (= (or b!116362 b!116382) bm!12451))

(declare-fun b_lambda!5171 () Bool)

(assert (=> (not b_lambda!5171) (not b!116381)))

(assert (=> b!116381 t!5916))

(declare-fun b_and!7245 () Bool)

(assert (= b_and!7241 (and (=> t!5916 result!3711) b_and!7245)))

(assert (=> b!116381 t!5918))

(declare-fun b_and!7247 () Bool)

(assert (= b_and!7243 (and (=> t!5918 result!3715) b_and!7247)))

(declare-fun m!132343 () Bool)

(assert (=> b!116381 m!132343))

(declare-fun m!132345 () Bool)

(assert (=> b!116381 m!132345))

(assert (=> b!116381 m!132315))

(assert (=> b!116381 m!132343))

(declare-fun m!132347 () Bool)

(assert (=> b!116381 m!132347))

(assert (=> b!116381 m!132347))

(assert (=> b!116381 m!132315))

(declare-fun m!132349 () Bool)

(assert (=> b!116381 m!132349))

(declare-fun m!132351 () Bool)

(assert (=> b!116367 m!132351))

(declare-fun m!132353 () Bool)

(assert (=> bm!12453 m!132353))

(assert (=> b!116370 m!132343))

(assert (=> b!116370 m!132343))

(declare-fun m!132355 () Bool)

(assert (=> b!116370 m!132355))

(declare-fun m!132357 () Bool)

(assert (=> b!116377 m!132357))

(declare-fun m!132359 () Bool)

(assert (=> b!116377 m!132359))

(declare-fun m!132361 () Bool)

(assert (=> b!116377 m!132361))

(declare-fun m!132363 () Bool)

(assert (=> b!116377 m!132363))

(declare-fun m!132365 () Bool)

(assert (=> b!116377 m!132365))

(declare-fun m!132367 () Bool)

(assert (=> b!116377 m!132367))

(declare-fun m!132369 () Bool)

(assert (=> b!116377 m!132369))

(declare-fun m!132371 () Bool)

(assert (=> b!116377 m!132371))

(assert (=> b!116377 m!132363))

(assert (=> b!116377 m!132369))

(assert (=> b!116377 m!132343))

(assert (=> b!116377 m!132353))

(declare-fun m!132373 () Bool)

(assert (=> b!116377 m!132373))

(declare-fun m!132375 () Bool)

(assert (=> b!116377 m!132375))

(assert (=> b!116377 m!132359))

(assert (=> b!116377 m!132373))

(declare-fun m!132377 () Bool)

(assert (=> b!116377 m!132377))

(declare-fun m!132379 () Bool)

(assert (=> b!116377 m!132379))

(declare-fun m!132381 () Bool)

(assert (=> b!116377 m!132381))

(declare-fun m!132383 () Bool)

(assert (=> b!116377 m!132383))

(declare-fun m!132385 () Bool)

(assert (=> b!116377 m!132385))

(declare-fun m!132387 () Bool)

(assert (=> bm!12452 m!132387))

(assert (=> b!116368 m!132343))

(assert (=> b!116368 m!132343))

(assert (=> b!116368 m!132355))

(declare-fun m!132389 () Bool)

(assert (=> b!116366 m!132389))

(declare-fun m!132391 () Bool)

(assert (=> b!116378 m!132391))

(declare-fun m!132393 () Bool)

(assert (=> bm!12451 m!132393))

(declare-fun m!132395 () Bool)

(assert (=> d!32591 m!132395))

(assert (=> b!116364 m!132343))

(assert (=> b!116364 m!132343))

(declare-fun m!132397 () Bool)

(assert (=> b!116364 m!132397))

(declare-fun m!132399 () Bool)

(assert (=> bm!12449 m!132399))

(assert (=> b!116146 d!32591))

(declare-fun d!32593 () Bool)

(assert (=> d!32593 (= (map!1348 newMap!16) (getCurrentListMap!498 (_keys!4437 newMap!16) (_values!2697 newMap!16) (mask!6930 newMap!16) (extraKeys!2503 newMap!16) (zeroValue!2581 newMap!16) (minValue!2581 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2714 newMap!16)))))

(declare-fun bs!4735 () Bool)

(assert (= bs!4735 d!32593))

(declare-fun m!132401 () Bool)

(assert (=> bs!4735 m!132401))

(assert (=> b!116146 d!32593))

(declare-fun d!32595 () Bool)

(declare-fun res!57029 () Bool)

(declare-fun e!75990 () Bool)

(assert (=> d!32595 (=> (not res!57029) (not e!75990))))

(assert (=> d!32595 (= res!57029 (simpleValid!81 (v!3046 (underlying!414 thiss!992))))))

(assert (=> d!32595 (= (valid!487 (v!3046 (underlying!414 thiss!992))) e!75990)))

(declare-fun b!116383 () Bool)

(declare-fun res!57030 () Bool)

(assert (=> b!116383 (=> (not res!57030) (not e!75990))))

(assert (=> b!116383 (= res!57030 (= (arrayCountValidKeys!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 (size!2423 (_keys!4437 (v!3046 (underlying!414 thiss!992))))) (_size!552 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116384 () Bool)

(declare-fun res!57031 () Bool)

(assert (=> b!116384 (=> (not res!57031) (not e!75990))))

(assert (=> b!116384 (= res!57031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4437 (v!3046 (underlying!414 thiss!992))) (mask!6930 (v!3046 (underlying!414 thiss!992)))))))

(declare-fun b!116385 () Bool)

(assert (=> b!116385 (= e!75990 (arrayNoDuplicates!0 (_keys!4437 (v!3046 (underlying!414 thiss!992))) #b00000000000000000000000000000000 Nil!1654))))

(assert (= (and d!32595 res!57029) b!116383))

(assert (= (and b!116383 res!57030) b!116384))

(assert (= (and b!116384 res!57031) b!116385))

(declare-fun m!132403 () Bool)

(assert (=> d!32595 m!132403))

(declare-fun m!132405 () Bool)

(assert (=> b!116383 m!132405))

(declare-fun m!132407 () Bool)

(assert (=> b!116384 m!132407))

(declare-fun m!132409 () Bool)

(assert (=> b!116385 m!132409))

(assert (=> b!116141 d!32595))

(declare-fun b!116393 () Bool)

(declare-fun e!75996 () Bool)

(assert (=> b!116393 (= e!75996 tp_is_empty!2785)))

(declare-fun b!116392 () Bool)

(declare-fun e!75995 () Bool)

(assert (=> b!116392 (= e!75995 tp_is_empty!2785)))

(declare-fun mapNonEmpty!4309 () Bool)

(declare-fun mapRes!4309 () Bool)

(declare-fun tp!10609 () Bool)

(assert (=> mapNonEmpty!4309 (= mapRes!4309 (and tp!10609 e!75995))))

(declare-fun mapValue!4309 () ValueCell!1049)

(declare-fun mapKey!4309 () (_ BitVec 32))

(declare-fun mapRest!4309 () (Array (_ BitVec 32) ValueCell!1049))

(assert (=> mapNonEmpty!4309 (= mapRest!4294 (store mapRest!4309 mapKey!4309 mapValue!4309))))

(declare-fun condMapEmpty!4309 () Bool)

(declare-fun mapDefault!4309 () ValueCell!1049)

(assert (=> mapNonEmpty!4293 (= condMapEmpty!4309 (= mapRest!4294 ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4309)))))

(assert (=> mapNonEmpty!4293 (= tp!10581 (and e!75996 mapRes!4309))))

(declare-fun mapIsEmpty!4309 () Bool)

(assert (=> mapIsEmpty!4309 mapRes!4309))

(assert (= (and mapNonEmpty!4293 condMapEmpty!4309) mapIsEmpty!4309))

(assert (= (and mapNonEmpty!4293 (not condMapEmpty!4309)) mapNonEmpty!4309))

(assert (= (and mapNonEmpty!4309 ((_ is ValueCellFull!1049) mapValue!4309)) b!116392))

(assert (= (and mapNonEmpty!4293 ((_ is ValueCellFull!1049) mapDefault!4309)) b!116393))

(declare-fun m!132411 () Bool)

(assert (=> mapNonEmpty!4309 m!132411))

(declare-fun b!116395 () Bool)

(declare-fun e!75998 () Bool)

(assert (=> b!116395 (= e!75998 tp_is_empty!2785)))

(declare-fun b!116394 () Bool)

(declare-fun e!75997 () Bool)

(assert (=> b!116394 (= e!75997 tp_is_empty!2785)))

(declare-fun mapNonEmpty!4310 () Bool)

(declare-fun mapRes!4310 () Bool)

(declare-fun tp!10610 () Bool)

(assert (=> mapNonEmpty!4310 (= mapRes!4310 (and tp!10610 e!75997))))

(declare-fun mapRest!4310 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapKey!4310 () (_ BitVec 32))

(declare-fun mapValue!4310 () ValueCell!1049)

(assert (=> mapNonEmpty!4310 (= mapRest!4293 (store mapRest!4310 mapKey!4310 mapValue!4310))))

(declare-fun condMapEmpty!4310 () Bool)

(declare-fun mapDefault!4310 () ValueCell!1049)

(assert (=> mapNonEmpty!4294 (= condMapEmpty!4310 (= mapRest!4293 ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4310)))))

(assert (=> mapNonEmpty!4294 (= tp!10582 (and e!75998 mapRes!4310))))

(declare-fun mapIsEmpty!4310 () Bool)

(assert (=> mapIsEmpty!4310 mapRes!4310))

(assert (= (and mapNonEmpty!4294 condMapEmpty!4310) mapIsEmpty!4310))

(assert (= (and mapNonEmpty!4294 (not condMapEmpty!4310)) mapNonEmpty!4310))

(assert (= (and mapNonEmpty!4310 ((_ is ValueCellFull!1049) mapValue!4310)) b!116394))

(assert (= (and mapNonEmpty!4294 ((_ is ValueCellFull!1049) mapDefault!4310)) b!116395))

(declare-fun m!132413 () Bool)

(assert (=> mapNonEmpty!4310 m!132413))

(declare-fun b_lambda!5173 () Bool)

(assert (= b_lambda!5171 (or (and b!116142 b_free!2737) (and b!116140 b_free!2739 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992))))) b_lambda!5173)))

(declare-fun b_lambda!5175 () Bool)

(assert (= b_lambda!5169 (or (and b!116142 b_free!2737) (and b!116140 b_free!2739 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3046 (underlying!414 thiss!992))))) b_lambda!5175)))

(check-sat (not bm!12429) (not b!116381) (not bm!12422) (not b!116272) (not bm!12427) (not bm!12453) (not b!116383) (not bm!12452) (not bm!12430) (not b!116384) tp_is_empty!2785 (not b!116275) (not b!116271) (not b_next!2737) (not b!116378) (not b!116306) (not b_lambda!5175) (not b_lambda!5173) (not b!116313) (not bm!12451) (not b!116367) (not mapNonEmpty!4310) (not b!116274) (not d!32581) (not bm!12431) (not b!116311) (not bm!12428) (not b!116368) (not d!32595) (not b!116364) (not b!116305) (not d!32577) (not bm!12425) (not b_next!2739) b_and!7245 (not b!116370) (not b!116377) (not bm!12424) b_and!7247 (not bm!12449) (not bm!12433) (not d!32591) (not b!116273) (not d!32575) (not bm!12432) (not b!116366) (not bm!12423) (not b!116385) (not bm!12426) (not b!116312) (not b!116270) (not bm!12421) (not d!32593) (not mapNonEmpty!4309) (not d!32579))
(check-sat b_and!7245 b_and!7247 (not b_next!2737) (not b_next!2739))
