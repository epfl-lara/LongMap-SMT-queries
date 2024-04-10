; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10138 () Bool)

(assert start!10138)

(declare-fun b!77196 () Bool)

(declare-fun b_free!2165 () Bool)

(declare-fun b_next!2165 () Bool)

(assert (=> b!77196 (= b_free!2165 (not b_next!2165))))

(declare-fun tp!8693 () Bool)

(declare-fun b_and!4731 () Bool)

(assert (=> b!77196 (= tp!8693 b_and!4731)))

(declare-fun b!77208 () Bool)

(declare-fun b_free!2167 () Bool)

(declare-fun b_next!2167 () Bool)

(assert (=> b!77208 (= b_free!2167 (not b_next!2167))))

(declare-fun tp!8691 () Bool)

(declare-fun b_and!4733 () Bool)

(assert (=> b!77208 (= tp!8691 b_and!4733)))

(declare-fun res!40566 () Bool)

(declare-fun e!50437 () Bool)

(assert (=> start!10138 (=> (not res!40566) (not e!50437))))

(declare-datatypes ((V!2979 0))(
  ( (V!2980 (val!1294 Int)) )
))
(declare-datatypes ((array!3949 0))(
  ( (array!3950 (arr!1883 (Array (_ BitVec 32) (_ BitVec 64))) (size!2124 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!906 0))(
  ( (ValueCellFull!906 (v!2577 V!2979)) (EmptyCell!906) )
))
(declare-datatypes ((array!3951 0))(
  ( (array!3952 (arr!1884 (Array (_ BitVec 32) ValueCell!906)) (size!2125 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!720 0))(
  ( (LongMapFixedSize!721 (defaultEntry!2263 Int) (mask!6254 (_ BitVec 32)) (extraKeys!2114 (_ BitVec 32)) (zeroValue!2161 V!2979) (minValue!2161 V!2979) (_size!409 (_ BitVec 32)) (_keys!3923 array!3949) (_values!2246 array!3951) (_vacant!409 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!522 0))(
  ( (Cell!523 (v!2578 LongMapFixedSize!720)) )
))
(declare-datatypes ((LongMap!522 0))(
  ( (LongMap!523 (underlying!272 Cell!522)) )
))
(declare-fun thiss!992 () LongMap!522)

(declare-fun valid!305 (LongMap!522) Bool)

(assert (=> start!10138 (= res!40566 (valid!305 thiss!992))))

(assert (=> start!10138 e!50437))

(declare-fun e!50445 () Bool)

(assert (=> start!10138 e!50445))

(assert (=> start!10138 true))

(declare-fun e!50444 () Bool)

(assert (=> start!10138 e!50444))

(declare-fun b!77193 () Bool)

(declare-datatypes ((Unit!2233 0))(
  ( (Unit!2234) )
))
(declare-fun e!50443 () Unit!2233)

(declare-fun Unit!2235 () Unit!2233)

(assert (=> b!77193 (= e!50443 Unit!2235)))

(declare-fun b!77194 () Bool)

(declare-fun e!50433 () Bool)

(declare-fun e!50438 () Bool)

(assert (=> b!77194 (= e!50433 e!50438)))

(declare-fun res!40565 () Bool)

(assert (=> b!77194 (=> (not res!40565) (not e!50438))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!77194 (= res!40565 (and (not (= (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35324 () V!2979)

(declare-fun get!1164 (ValueCell!906 V!2979) V!2979)

(declare-fun dynLambda!333 (Int (_ BitVec 64)) V!2979)

(assert (=> b!77194 (= lt!35324 (get!1164 (select (arr!1884 (_values!2246 (v!2578 (underlying!272 thiss!992)))) from!355) (dynLambda!333 (defaultEntry!2263 (v!2578 (underlying!272 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3263 () Bool)

(declare-fun mapRes!3263 () Bool)

(assert (=> mapIsEmpty!3263 mapRes!3263))

(declare-fun b!77195 () Bool)

(assert (=> b!77195 (= e!50437 e!50433)))

(declare-fun res!40569 () Bool)

(assert (=> b!77195 (=> (not res!40569) (not e!50433))))

(declare-datatypes ((tuple2!2156 0))(
  ( (tuple2!2157 (_1!1089 (_ BitVec 64)) (_2!1089 V!2979)) )
))
(declare-datatypes ((List!1498 0))(
  ( (Nil!1495) (Cons!1494 (h!2082 tuple2!2156) (t!5120 List!1498)) )
))
(declare-datatypes ((ListLongMap!1439 0))(
  ( (ListLongMap!1440 (toList!735 List!1498)) )
))
(declare-fun lt!35328 () ListLongMap!1439)

(declare-fun lt!35326 () ListLongMap!1439)

(assert (=> b!77195 (= res!40569 (= lt!35328 lt!35326))))

(declare-fun newMap!16 () LongMapFixedSize!720)

(declare-fun map!1167 (LongMapFixedSize!720) ListLongMap!1439)

(assert (=> b!77195 (= lt!35326 (map!1167 newMap!16))))

(declare-fun getCurrentListMap!430 (array!3949 array!3951 (_ BitVec 32) (_ BitVec 32) V!2979 V!2979 (_ BitVec 32) Int) ListLongMap!1439)

(assert (=> b!77195 (= lt!35328 (getCurrentListMap!430 (_keys!3923 (v!2578 (underlying!272 thiss!992))) (_values!2246 (v!2578 (underlying!272 thiss!992))) (mask!6254 (v!2578 (underlying!272 thiss!992))) (extraKeys!2114 (v!2578 (underlying!272 thiss!992))) (zeroValue!2161 (v!2578 (underlying!272 thiss!992))) (minValue!2161 (v!2578 (underlying!272 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2263 (v!2578 (underlying!272 thiss!992)))))))

(declare-fun e!50439 () Bool)

(declare-fun e!50436 () Bool)

(declare-fun tp_is_empty!2499 () Bool)

(declare-fun array_inv!1163 (array!3949) Bool)

(declare-fun array_inv!1164 (array!3951) Bool)

(assert (=> b!77196 (= e!50436 (and tp!8693 tp_is_empty!2499 (array_inv!1163 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) (array_inv!1164 (_values!2246 (v!2578 (underlying!272 thiss!992)))) e!50439))))

(declare-fun b!77197 () Bool)

(declare-fun e!50431 () Bool)

(assert (=> b!77197 (= e!50431 tp_is_empty!2499)))

(declare-fun b!77198 () Bool)

(declare-fun e!50441 () Bool)

(assert (=> b!77198 (= e!50441 tp_is_empty!2499)))

(declare-fun b!77199 () Bool)

(declare-fun e!50429 () Bool)

(assert (=> b!77199 (= e!50429 tp_is_empty!2499)))

(declare-fun b!77200 () Bool)

(declare-fun Unit!2236 () Unit!2233)

(assert (=> b!77200 (= e!50443 Unit!2236)))

(declare-fun lt!35325 () Unit!2233)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!57 (array!3949 array!3951 (_ BitVec 32) (_ BitVec 32) V!2979 V!2979 (_ BitVec 64) (_ BitVec 32) Int) Unit!2233)

(assert (=> b!77200 (= lt!35325 (lemmaListMapContainsThenArrayContainsFrom!57 (_keys!3923 (v!2578 (underlying!272 thiss!992))) (_values!2246 (v!2578 (underlying!272 thiss!992))) (mask!6254 (v!2578 (underlying!272 thiss!992))) (extraKeys!2114 (v!2578 (underlying!272 thiss!992))) (zeroValue!2161 (v!2578 (underlying!272 thiss!992))) (minValue!2161 (v!2578 (underlying!272 thiss!992))) (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2263 (v!2578 (underlying!272 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77200 (arrayContainsKey!0 (_keys!3923 (v!2578 (underlying!272 thiss!992))) (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35335 () Unit!2233)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3949 (_ BitVec 32) (_ BitVec 32)) Unit!2233)

(assert (=> b!77200 (= lt!35335 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3923 (v!2578 (underlying!272 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1499 0))(
  ( (Nil!1496) (Cons!1495 (h!2083 (_ BitVec 64)) (t!5121 List!1499)) )
))
(declare-fun arrayNoDuplicates!0 (array!3949 (_ BitVec 32) List!1499) Bool)

(assert (=> b!77200 (arrayNoDuplicates!0 (_keys!3923 (v!2578 (underlying!272 thiss!992))) from!355 Nil!1496)))

(declare-fun lt!35329 () Unit!2233)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3949 (_ BitVec 32) (_ BitVec 64) List!1499) Unit!2233)

(assert (=> b!77200 (= lt!35329 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3923 (v!2578 (underlying!272 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) (Cons!1495 (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) Nil!1496)))))

(assert (=> b!77200 false))

(declare-fun b!77201 () Bool)

(declare-fun e!50442 () Bool)

(assert (=> b!77201 (= e!50438 e!50442)))

(declare-fun res!40564 () Bool)

(assert (=> b!77201 (=> (not res!40564) (not e!50442))))

(declare-datatypes ((tuple2!2158 0))(
  ( (tuple2!2159 (_1!1090 Bool) (_2!1090 LongMapFixedSize!720)) )
))
(declare-fun lt!35327 () tuple2!2158)

(assert (=> b!77201 (= res!40564 (and (_1!1090 lt!35327) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35334 () Unit!2233)

(assert (=> b!77201 (= lt!35334 e!50443)))

(declare-fun c!11796 () Bool)

(declare-fun contains!736 (ListLongMap!1439 (_ BitVec 64)) Bool)

(assert (=> b!77201 (= c!11796 (contains!736 lt!35326 (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355)))))

(declare-fun update!103 (LongMapFixedSize!720 (_ BitVec 64) V!2979) tuple2!2158)

(assert (=> b!77201 (= lt!35327 (update!103 newMap!16 (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) lt!35324))))

(declare-fun mapIsEmpty!3264 () Bool)

(declare-fun mapRes!3264 () Bool)

(assert (=> mapIsEmpty!3264 mapRes!3264))

(declare-fun b!77202 () Bool)

(declare-fun e!50432 () Bool)

(declare-fun e!50435 () Bool)

(assert (=> b!77202 (= e!50432 (and e!50435 mapRes!3264))))

(declare-fun condMapEmpty!3263 () Bool)

(declare-fun mapDefault!3264 () ValueCell!906)

(assert (=> b!77202 (= condMapEmpty!3263 (= (arr!1884 (_values!2246 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!906)) mapDefault!3264)))))

(declare-fun b!77203 () Bool)

(declare-fun res!40567 () Bool)

(assert (=> b!77203 (=> (not res!40567) (not e!50437))))

(assert (=> b!77203 (= res!40567 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2124 (_keys!3923 (v!2578 (underlying!272 thiss!992)))))))))

(declare-fun mapNonEmpty!3263 () Bool)

(declare-fun tp!8692 () Bool)

(assert (=> mapNonEmpty!3263 (= mapRes!3264 (and tp!8692 e!50441))))

(declare-fun mapValue!3264 () ValueCell!906)

(declare-fun mapRest!3263 () (Array (_ BitVec 32) ValueCell!906))

(declare-fun mapKey!3264 () (_ BitVec 32))

(assert (=> mapNonEmpty!3263 (= (arr!1884 (_values!2246 newMap!16)) (store mapRest!3263 mapKey!3264 mapValue!3264))))

(declare-fun b!77204 () Bool)

(assert (=> b!77204 (= e!50442 (not true))))

(declare-fun lt!35333 () ListLongMap!1439)

(declare-fun lt!35332 () tuple2!2156)

(declare-fun lt!35331 () tuple2!2156)

(declare-fun +!101 (ListLongMap!1439 tuple2!2156) ListLongMap!1439)

(assert (=> b!77204 (= (+!101 (+!101 lt!35333 lt!35332) lt!35331) (+!101 (+!101 lt!35333 lt!35331) lt!35332))))

(assert (=> b!77204 (= lt!35331 (tuple2!2157 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2161 (v!2578 (underlying!272 thiss!992)))))))

(assert (=> b!77204 (= lt!35332 (tuple2!2157 (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) lt!35324))))

(declare-fun lt!35330 () Unit!2233)

(declare-fun addCommutativeForDiffKeys!20 (ListLongMap!1439 (_ BitVec 64) V!2979 (_ BitVec 64) V!2979) Unit!2233)

(assert (=> b!77204 (= lt!35330 (addCommutativeForDiffKeys!20 lt!35333 (select (arr!1883 (_keys!3923 (v!2578 (underlying!272 thiss!992)))) from!355) lt!35324 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2161 (v!2578 (underlying!272 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!66 (array!3949 array!3951 (_ BitVec 32) (_ BitVec 32) V!2979 V!2979 (_ BitVec 32) Int) ListLongMap!1439)

(assert (=> b!77204 (= lt!35333 (getCurrentListMapNoExtraKeys!66 (_keys!3923 (v!2578 (underlying!272 thiss!992))) (_values!2246 (v!2578 (underlying!272 thiss!992))) (mask!6254 (v!2578 (underlying!272 thiss!992))) (extraKeys!2114 (v!2578 (underlying!272 thiss!992))) (zeroValue!2161 (v!2578 (underlying!272 thiss!992))) (minValue!2161 (v!2578 (underlying!272 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2263 (v!2578 (underlying!272 thiss!992)))))))

(declare-fun b!77205 () Bool)

(assert (=> b!77205 (= e!50439 (and e!50431 mapRes!3263))))

(declare-fun condMapEmpty!3264 () Bool)

(declare-fun mapDefault!3263 () ValueCell!906)

(assert (=> b!77205 (= condMapEmpty!3264 (= (arr!1884 (_values!2246 (v!2578 (underlying!272 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!906)) mapDefault!3263)))))

(declare-fun b!77206 () Bool)

(declare-fun e!50430 () Bool)

(assert (=> b!77206 (= e!50445 e!50430)))

(declare-fun mapNonEmpty!3264 () Bool)

(declare-fun tp!8694 () Bool)

(assert (=> mapNonEmpty!3264 (= mapRes!3263 (and tp!8694 e!50429))))

(declare-fun mapRest!3264 () (Array (_ BitVec 32) ValueCell!906))

(declare-fun mapValue!3263 () ValueCell!906)

(declare-fun mapKey!3263 () (_ BitVec 32))

(assert (=> mapNonEmpty!3264 (= (arr!1884 (_values!2246 (v!2578 (underlying!272 thiss!992)))) (store mapRest!3264 mapKey!3263 mapValue!3263))))

(declare-fun b!77207 () Bool)

(assert (=> b!77207 (= e!50430 e!50436)))

(assert (=> b!77208 (= e!50444 (and tp!8691 tp_is_empty!2499 (array_inv!1163 (_keys!3923 newMap!16)) (array_inv!1164 (_values!2246 newMap!16)) e!50432))))

(declare-fun b!77209 () Bool)

(declare-fun res!40568 () Bool)

(assert (=> b!77209 (=> (not res!40568) (not e!50437))))

(assert (=> b!77209 (= res!40568 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6254 newMap!16)) (_size!409 (v!2578 (underlying!272 thiss!992)))))))

(declare-fun b!77210 () Bool)

(declare-fun res!40570 () Bool)

(assert (=> b!77210 (=> (not res!40570) (not e!50437))))

(declare-fun valid!306 (LongMapFixedSize!720) Bool)

(assert (=> b!77210 (= res!40570 (valid!306 newMap!16))))

(declare-fun b!77211 () Bool)

(assert (=> b!77211 (= e!50435 tp_is_empty!2499)))

(assert (= (and start!10138 res!40566) b!77203))

(assert (= (and b!77203 res!40567) b!77210))

(assert (= (and b!77210 res!40570) b!77209))

(assert (= (and b!77209 res!40568) b!77195))

(assert (= (and b!77195 res!40569) b!77194))

(assert (= (and b!77194 res!40565) b!77201))

(assert (= (and b!77201 c!11796) b!77200))

(assert (= (and b!77201 (not c!11796)) b!77193))

(assert (= (and b!77201 res!40564) b!77204))

(assert (= (and b!77205 condMapEmpty!3264) mapIsEmpty!3263))

(assert (= (and b!77205 (not condMapEmpty!3264)) mapNonEmpty!3264))

(get-info :version)

(assert (= (and mapNonEmpty!3264 ((_ is ValueCellFull!906) mapValue!3263)) b!77199))

(assert (= (and b!77205 ((_ is ValueCellFull!906) mapDefault!3263)) b!77197))

(assert (= b!77196 b!77205))

(assert (= b!77207 b!77196))

(assert (= b!77206 b!77207))

(assert (= start!10138 b!77206))

(assert (= (and b!77202 condMapEmpty!3263) mapIsEmpty!3264))

(assert (= (and b!77202 (not condMapEmpty!3263)) mapNonEmpty!3263))

(assert (= (and mapNonEmpty!3263 ((_ is ValueCellFull!906) mapValue!3264)) b!77198))

(assert (= (and b!77202 ((_ is ValueCellFull!906) mapDefault!3264)) b!77211))

(assert (= b!77208 b!77202))

(assert (= start!10138 b!77208))

(declare-fun b_lambda!3463 () Bool)

(assert (=> (not b_lambda!3463) (not b!77194)))

(declare-fun t!5117 () Bool)

(declare-fun tb!1593 () Bool)

(assert (=> (and b!77196 (= (defaultEntry!2263 (v!2578 (underlying!272 thiss!992))) (defaultEntry!2263 (v!2578 (underlying!272 thiss!992)))) t!5117) tb!1593))

(declare-fun result!2773 () Bool)

(assert (=> tb!1593 (= result!2773 tp_is_empty!2499)))

(assert (=> b!77194 t!5117))

(declare-fun b_and!4735 () Bool)

(assert (= b_and!4731 (and (=> t!5117 result!2773) b_and!4735)))

(declare-fun t!5119 () Bool)

(declare-fun tb!1595 () Bool)

(assert (=> (and b!77208 (= (defaultEntry!2263 newMap!16) (defaultEntry!2263 (v!2578 (underlying!272 thiss!992)))) t!5119) tb!1595))

(declare-fun result!2777 () Bool)

(assert (= result!2777 result!2773))

(assert (=> b!77194 t!5119))

(declare-fun b_and!4737 () Bool)

(assert (= b_and!4733 (and (=> t!5119 result!2777) b_and!4737)))

(declare-fun m!77319 () Bool)

(assert (=> mapNonEmpty!3263 m!77319))

(declare-fun m!77321 () Bool)

(assert (=> b!77195 m!77321))

(declare-fun m!77323 () Bool)

(assert (=> b!77195 m!77323))

(declare-fun m!77325 () Bool)

(assert (=> b!77200 m!77325))

(declare-fun m!77327 () Bool)

(assert (=> b!77200 m!77327))

(declare-fun m!77329 () Bool)

(assert (=> b!77200 m!77329))

(declare-fun m!77331 () Bool)

(assert (=> b!77200 m!77331))

(assert (=> b!77200 m!77329))

(assert (=> b!77200 m!77329))

(declare-fun m!77333 () Bool)

(assert (=> b!77200 m!77333))

(assert (=> b!77200 m!77329))

(declare-fun m!77335 () Bool)

(assert (=> b!77200 m!77335))

(assert (=> b!77201 m!77329))

(assert (=> b!77201 m!77329))

(declare-fun m!77337 () Bool)

(assert (=> b!77201 m!77337))

(assert (=> b!77201 m!77329))

(declare-fun m!77339 () Bool)

(assert (=> b!77201 m!77339))

(declare-fun m!77341 () Bool)

(assert (=> b!77208 m!77341))

(declare-fun m!77343 () Bool)

(assert (=> b!77208 m!77343))

(declare-fun m!77345 () Bool)

(assert (=> b!77196 m!77345))

(declare-fun m!77347 () Bool)

(assert (=> b!77196 m!77347))

(declare-fun m!77349 () Bool)

(assert (=> mapNonEmpty!3264 m!77349))

(assert (=> b!77194 m!77329))

(declare-fun m!77351 () Bool)

(assert (=> b!77194 m!77351))

(declare-fun m!77353 () Bool)

(assert (=> b!77194 m!77353))

(assert (=> b!77194 m!77351))

(assert (=> b!77194 m!77353))

(declare-fun m!77355 () Bool)

(assert (=> b!77194 m!77355))

(declare-fun m!77357 () Bool)

(assert (=> start!10138 m!77357))

(declare-fun m!77359 () Bool)

(assert (=> b!77210 m!77359))

(declare-fun m!77361 () Bool)

(assert (=> b!77204 m!77361))

(declare-fun m!77363 () Bool)

(assert (=> b!77204 m!77363))

(assert (=> b!77204 m!77329))

(declare-fun m!77365 () Bool)

(assert (=> b!77204 m!77365))

(assert (=> b!77204 m!77361))

(assert (=> b!77204 m!77329))

(declare-fun m!77367 () Bool)

(assert (=> b!77204 m!77367))

(declare-fun m!77369 () Bool)

(assert (=> b!77204 m!77369))

(assert (=> b!77204 m!77367))

(declare-fun m!77371 () Bool)

(assert (=> b!77204 m!77371))

(check-sat b_and!4735 (not b!77210) (not b!77204) (not b!77208) (not b_lambda!3463) (not b!77201) tp_is_empty!2499 b_and!4737 (not b!77194) (not b_next!2165) (not b_next!2167) (not mapNonEmpty!3264) (not b!77195) (not b!77200) (not start!10138) (not mapNonEmpty!3263) (not b!77196))
(check-sat b_and!4735 b_and!4737 (not b_next!2165) (not b_next!2167))
