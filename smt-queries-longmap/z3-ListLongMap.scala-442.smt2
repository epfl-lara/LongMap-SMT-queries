; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8266 () Bool)

(assert start!8266)

(declare-fun b!53032 () Bool)

(declare-fun b_free!1697 () Bool)

(declare-fun b_next!1697 () Bool)

(assert (=> b!53032 (= b_free!1697 (not b_next!1697))))

(declare-fun tp!7192 () Bool)

(declare-fun b_and!2935 () Bool)

(assert (=> b!53032 (= tp!7192 b_and!2935)))

(declare-fun b!53018 () Bool)

(declare-fun b_free!1699 () Bool)

(declare-fun b_next!1699 () Bool)

(assert (=> b!53018 (= b_free!1699 (not b_next!1699))))

(declare-fun tp!7194 () Bool)

(declare-fun b_and!2937 () Bool)

(assert (=> b!53018 (= tp!7194 b_and!2937)))

(declare-fun res!30084 () Bool)

(declare-fun e!34569 () Bool)

(assert (=> start!8266 (=> (not res!30084) (not e!34569))))

(declare-datatypes ((V!2667 0))(
  ( (V!2668 (val!1177 Int)) )
))
(declare-datatypes ((array!3453 0))(
  ( (array!3454 (arr!1649 (Array (_ BitVec 32) (_ BitVec 64))) (size!1878 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!789 0))(
  ( (ValueCellFull!789 (v!2243 V!2667)) (EmptyCell!789) )
))
(declare-datatypes ((array!3455 0))(
  ( (array!3456 (arr!1650 (Array (_ BitVec 32) ValueCell!789)) (size!1879 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!486 0))(
  ( (LongMapFixedSize!487 (defaultEntry!1957 Int) (mask!5788 (_ BitVec 32)) (extraKeys!1848 (_ BitVec 32)) (zeroValue!1875 V!2667) (minValue!1875 V!2667) (_size!292 (_ BitVec 32)) (_keys!3577 array!3453) (_values!1940 array!3455) (_vacant!292 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!308 0))(
  ( (Cell!309 (v!2244 LongMapFixedSize!486)) )
))
(declare-datatypes ((LongMap!308 0))(
  ( (LongMap!309 (underlying!165 Cell!308)) )
))
(declare-fun thiss!992 () LongMap!308)

(declare-fun valid!182 (LongMap!308) Bool)

(assert (=> start!8266 (= res!30084 (valid!182 thiss!992))))

(assert (=> start!8266 e!34569))

(declare-fun e!34566 () Bool)

(assert (=> start!8266 e!34566))

(assert (=> start!8266 true))

(declare-fun e!34577 () Bool)

(assert (=> start!8266 e!34577))

(declare-fun mapIsEmpty!2465 () Bool)

(declare-fun mapRes!2466 () Bool)

(assert (=> mapIsEmpty!2465 mapRes!2466))

(declare-fun b!53015 () Bool)

(declare-fun e!34575 () Bool)

(declare-fun e!34565 () Bool)

(assert (=> b!53015 (= e!34575 e!34565)))

(declare-fun b!53016 () Bool)

(declare-fun res!30086 () Bool)

(declare-fun e!34573 () Bool)

(assert (=> b!53016 (=> (not res!30086) (not e!34573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3453 (_ BitVec 32)) Bool)

(assert (=> b!53016 (= res!30086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3577 (v!2244 (underlying!165 thiss!992))) (mask!5788 (v!2244 (underlying!165 thiss!992)))))))

(declare-fun b!53017 () Bool)

(declare-fun e!34574 () Bool)

(declare-fun tp_is_empty!2265 () Bool)

(assert (=> b!53017 (= e!34574 tp_is_empty!2265)))

(declare-fun newMap!16 () LongMapFixedSize!486)

(declare-fun e!34563 () Bool)

(declare-fun array_inv!1021 (array!3453) Bool)

(declare-fun array_inv!1022 (array!3455) Bool)

(assert (=> b!53018 (= e!34577 (and tp!7194 tp_is_empty!2265 (array_inv!1021 (_keys!3577 newMap!16)) (array_inv!1022 (_values!1940 newMap!16)) e!34563))))

(declare-fun b!53019 () Bool)

(declare-fun e!34568 () Bool)

(assert (=> b!53019 (= e!34563 (and e!34568 mapRes!2466))))

(declare-fun condMapEmpty!2465 () Bool)

(declare-fun mapDefault!2466 () ValueCell!789)

(assert (=> b!53019 (= condMapEmpty!2465 (= (arr!1650 (_values!1940 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!789)) mapDefault!2466)))))

(declare-fun b!53020 () Bool)

(declare-fun res!30083 () Bool)

(assert (=> b!53020 (=> (not res!30083) (not e!34573))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53020 (= res!30083 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1878 (_keys!3577 (v!2244 (underlying!165 thiss!992)))))))))

(declare-fun mapNonEmpty!2465 () Bool)

(declare-fun tp!7193 () Bool)

(assert (=> mapNonEmpty!2465 (= mapRes!2466 (and tp!7193 e!34574))))

(declare-fun mapRest!2465 () (Array (_ BitVec 32) ValueCell!789))

(declare-fun mapValue!2465 () ValueCell!789)

(declare-fun mapKey!2466 () (_ BitVec 32))

(assert (=> mapNonEmpty!2465 (= (arr!1650 (_values!1940 newMap!16)) (store mapRest!2465 mapKey!2466 mapValue!2465))))

(declare-fun b!53021 () Bool)

(assert (=> b!53021 (= e!34566 e!34575)))

(declare-fun b!53022 () Bool)

(declare-fun e!34572 () Bool)

(declare-fun e!34567 () Bool)

(declare-fun mapRes!2465 () Bool)

(assert (=> b!53022 (= e!34572 (and e!34567 mapRes!2465))))

(declare-fun condMapEmpty!2466 () Bool)

(declare-fun mapDefault!2465 () ValueCell!789)

(assert (=> b!53022 (= condMapEmpty!2466 (= (arr!1650 (_values!1940 (v!2244 (underlying!165 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!789)) mapDefault!2465)))))

(declare-fun b!53023 () Bool)

(declare-fun res!30092 () Bool)

(assert (=> b!53023 (=> (not res!30092) (not e!34573))))

(assert (=> b!53023 (= res!30092 (and (= (size!1879 (_values!1940 (v!2244 (underlying!165 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5788 (v!2244 (underlying!165 thiss!992))))) (= (size!1878 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) (size!1879 (_values!1940 (v!2244 (underlying!165 thiss!992))))) (bvsge (mask!5788 (v!2244 (underlying!165 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1848 (v!2244 (underlying!165 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1848 (v!2244 (underlying!165 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53024 () Bool)

(declare-fun res!30085 () Bool)

(assert (=> b!53024 (=> (not res!30085) (not e!34573))))

(declare-datatypes ((List!1351 0))(
  ( (Nil!1348) (Cons!1347 (h!1927 (_ BitVec 64)) (t!4417 List!1351)) )
))
(declare-fun arrayNoDuplicates!0 (array!3453 (_ BitVec 32) List!1351) Bool)

(assert (=> b!53024 (= res!30085 (arrayNoDuplicates!0 (_keys!3577 (v!2244 (underlying!165 thiss!992))) #b00000000000000000000000000000000 Nil!1348))))

(declare-fun b!53025 () Bool)

(assert (=> b!53025 (= e!34568 tp_is_empty!2265)))

(declare-fun b!53026 () Bool)

(declare-fun res!30088 () Bool)

(assert (=> b!53026 (=> (not res!30088) (not e!34569))))

(assert (=> b!53026 (= res!30088 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5788 newMap!16)) (_size!292 (v!2244 (underlying!165 thiss!992)))))))

(declare-fun b!53027 () Bool)

(assert (=> b!53027 (= e!34567 tp_is_empty!2265)))

(declare-fun b!53028 () Bool)

(assert (=> b!53028 (= e!34573 false)))

(declare-datatypes ((tuple2!1872 0))(
  ( (tuple2!1873 (_1!947 (_ BitVec 64)) (_2!947 V!2667)) )
))
(declare-datatypes ((List!1352 0))(
  ( (Nil!1349) (Cons!1348 (h!1928 tuple2!1872) (t!4418 List!1352)) )
))
(declare-datatypes ((ListLongMap!1279 0))(
  ( (ListLongMap!1280 (toList!655 List!1352)) )
))
(declare-fun lt!21390 () ListLongMap!1279)

(declare-fun lt!21387 () Bool)

(declare-fun contains!630 (ListLongMap!1279 (_ BitVec 64)) Bool)

(assert (=> b!53028 (= lt!21387 (contains!630 lt!21390 (select (arr!1649 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) from!355)))))

(declare-fun b!53029 () Bool)

(declare-fun e!34571 () Bool)

(assert (=> b!53029 (= e!34571 e!34573)))

(declare-fun res!30082 () Bool)

(assert (=> b!53029 (=> (not res!30082) (not e!34573))))

(declare-fun lt!21389 () ListLongMap!1279)

(assert (=> b!53029 (= res!30082 (contains!630 lt!21389 (select (arr!1649 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1874 0))(
  ( (tuple2!1875 (_1!948 Bool) (_2!948 LongMapFixedSize!486)) )
))
(declare-fun lt!21388 () tuple2!1874)

(declare-fun update!41 (LongMapFixedSize!486 (_ BitVec 64) V!2667) tuple2!1874)

(declare-fun get!985 (ValueCell!789 V!2667) V!2667)

(declare-fun dynLambda!272 (Int (_ BitVec 64)) V!2667)

(assert (=> b!53029 (= lt!21388 (update!41 newMap!16 (select (arr!1649 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) from!355) (get!985 (select (arr!1650 (_values!1940 (v!2244 (underlying!165 thiss!992)))) from!355) (dynLambda!272 (defaultEntry!1957 (v!2244 (underlying!165 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53030 () Bool)

(declare-fun e!34564 () Bool)

(assert (=> b!53030 (= e!34564 tp_is_empty!2265)))

(declare-fun mapIsEmpty!2466 () Bool)

(assert (=> mapIsEmpty!2466 mapRes!2465))

(declare-fun b!53031 () Bool)

(declare-fun res!30087 () Bool)

(assert (=> b!53031 (=> (not res!30087) (not e!34573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53031 (= res!30087 (validMask!0 (mask!5788 (v!2244 (underlying!165 thiss!992)))))))

(assert (=> b!53032 (= e!34565 (and tp!7192 tp_is_empty!2265 (array_inv!1021 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) (array_inv!1022 (_values!1940 (v!2244 (underlying!165 thiss!992)))) e!34572))))

(declare-fun b!53033 () Bool)

(declare-fun res!30090 () Bool)

(assert (=> b!53033 (=> (not res!30090) (not e!34569))))

(assert (=> b!53033 (= res!30090 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1878 (_keys!3577 (v!2244 (underlying!165 thiss!992)))))))))

(declare-fun mapNonEmpty!2466 () Bool)

(declare-fun tp!7191 () Bool)

(assert (=> mapNonEmpty!2466 (= mapRes!2465 (and tp!7191 e!34564))))

(declare-fun mapRest!2466 () (Array (_ BitVec 32) ValueCell!789))

(declare-fun mapValue!2466 () ValueCell!789)

(declare-fun mapKey!2465 () (_ BitVec 32))

(assert (=> mapNonEmpty!2466 (= (arr!1650 (_values!1940 (v!2244 (underlying!165 thiss!992)))) (store mapRest!2466 mapKey!2465 mapValue!2466))))

(declare-fun b!53034 () Bool)

(declare-fun res!30089 () Bool)

(assert (=> b!53034 (=> (not res!30089) (not e!34569))))

(declare-fun valid!183 (LongMapFixedSize!486) Bool)

(assert (=> b!53034 (= res!30089 (valid!183 newMap!16))))

(declare-fun b!53035 () Bool)

(assert (=> b!53035 (= e!34569 e!34571)))

(declare-fun res!30091 () Bool)

(assert (=> b!53035 (=> (not res!30091) (not e!34571))))

(assert (=> b!53035 (= res!30091 (and (= lt!21390 lt!21389) (not (= (select (arr!1649 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1649 (_keys!3577 (v!2244 (underlying!165 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1026 (LongMapFixedSize!486) ListLongMap!1279)

(assert (=> b!53035 (= lt!21389 (map!1026 newMap!16))))

(declare-fun getCurrentListMap!367 (array!3453 array!3455 (_ BitVec 32) (_ BitVec 32) V!2667 V!2667 (_ BitVec 32) Int) ListLongMap!1279)

(assert (=> b!53035 (= lt!21390 (getCurrentListMap!367 (_keys!3577 (v!2244 (underlying!165 thiss!992))) (_values!1940 (v!2244 (underlying!165 thiss!992))) (mask!5788 (v!2244 (underlying!165 thiss!992))) (extraKeys!1848 (v!2244 (underlying!165 thiss!992))) (zeroValue!1875 (v!2244 (underlying!165 thiss!992))) (minValue!1875 (v!2244 (underlying!165 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1957 (v!2244 (underlying!165 thiss!992)))))))

(assert (= (and start!8266 res!30084) b!53033))

(assert (= (and b!53033 res!30090) b!53034))

(assert (= (and b!53034 res!30089) b!53026))

(assert (= (and b!53026 res!30088) b!53035))

(assert (= (and b!53035 res!30091) b!53029))

(assert (= (and b!53029 res!30082) b!53031))

(assert (= (and b!53031 res!30087) b!53023))

(assert (= (and b!53023 res!30092) b!53016))

(assert (= (and b!53016 res!30086) b!53024))

(assert (= (and b!53024 res!30085) b!53020))

(assert (= (and b!53020 res!30083) b!53028))

(assert (= (and b!53022 condMapEmpty!2466) mapIsEmpty!2466))

(assert (= (and b!53022 (not condMapEmpty!2466)) mapNonEmpty!2466))

(get-info :version)

(assert (= (and mapNonEmpty!2466 ((_ is ValueCellFull!789) mapValue!2466)) b!53030))

(assert (= (and b!53022 ((_ is ValueCellFull!789) mapDefault!2465)) b!53027))

(assert (= b!53032 b!53022))

(assert (= b!53015 b!53032))

(assert (= b!53021 b!53015))

(assert (= start!8266 b!53021))

(assert (= (and b!53019 condMapEmpty!2465) mapIsEmpty!2465))

(assert (= (and b!53019 (not condMapEmpty!2465)) mapNonEmpty!2465))

(assert (= (and mapNonEmpty!2465 ((_ is ValueCellFull!789) mapValue!2465)) b!53017))

(assert (= (and b!53019 ((_ is ValueCellFull!789) mapDefault!2466)) b!53025))

(assert (= b!53018 b!53019))

(assert (= start!8266 b!53018))

(declare-fun b_lambda!2359 () Bool)

(assert (=> (not b_lambda!2359) (not b!53029)))

(declare-fun t!4414 () Bool)

(declare-fun tb!1041 () Bool)

(assert (=> (and b!53032 (= (defaultEntry!1957 (v!2244 (underlying!165 thiss!992))) (defaultEntry!1957 (v!2244 (underlying!165 thiss!992)))) t!4414) tb!1041))

(declare-fun result!1959 () Bool)

(assert (=> tb!1041 (= result!1959 tp_is_empty!2265)))

(assert (=> b!53029 t!4414))

(declare-fun b_and!2939 () Bool)

(assert (= b_and!2935 (and (=> t!4414 result!1959) b_and!2939)))

(declare-fun tb!1043 () Bool)

(declare-fun t!4416 () Bool)

(assert (=> (and b!53018 (= (defaultEntry!1957 newMap!16) (defaultEntry!1957 (v!2244 (underlying!165 thiss!992)))) t!4416) tb!1043))

(declare-fun result!1963 () Bool)

(assert (= result!1963 result!1959))

(assert (=> b!53029 t!4416))

(declare-fun b_and!2941 () Bool)

(assert (= b_and!2937 (and (=> t!4416 result!1963) b_and!2941)))

(declare-fun m!45165 () Bool)

(assert (=> mapNonEmpty!2466 m!45165))

(declare-fun m!45167 () Bool)

(assert (=> b!53032 m!45167))

(declare-fun m!45169 () Bool)

(assert (=> b!53032 m!45169))

(declare-fun m!45171 () Bool)

(assert (=> b!53029 m!45171))

(declare-fun m!45173 () Bool)

(assert (=> b!53029 m!45173))

(declare-fun m!45175 () Bool)

(assert (=> b!53029 m!45175))

(declare-fun m!45177 () Bool)

(assert (=> b!53029 m!45177))

(assert (=> b!53029 m!45173))

(assert (=> b!53029 m!45177))

(declare-fun m!45179 () Bool)

(assert (=> b!53029 m!45179))

(assert (=> b!53029 m!45177))

(assert (=> b!53029 m!45175))

(declare-fun m!45181 () Bool)

(assert (=> b!53029 m!45181))

(assert (=> b!53029 m!45171))

(declare-fun m!45183 () Bool)

(assert (=> b!53034 m!45183))

(assert (=> b!53028 m!45177))

(assert (=> b!53028 m!45177))

(declare-fun m!45185 () Bool)

(assert (=> b!53028 m!45185))

(declare-fun m!45187 () Bool)

(assert (=> mapNonEmpty!2465 m!45187))

(declare-fun m!45189 () Bool)

(assert (=> start!8266 m!45189))

(declare-fun m!45191 () Bool)

(assert (=> b!53016 m!45191))

(declare-fun m!45193 () Bool)

(assert (=> b!53031 m!45193))

(declare-fun m!45195 () Bool)

(assert (=> b!53024 m!45195))

(declare-fun m!45197 () Bool)

(assert (=> b!53018 m!45197))

(declare-fun m!45199 () Bool)

(assert (=> b!53018 m!45199))

(assert (=> b!53035 m!45177))

(declare-fun m!45201 () Bool)

(assert (=> b!53035 m!45201))

(declare-fun m!45203 () Bool)

(assert (=> b!53035 m!45203))

(check-sat (not b!53029) (not mapNonEmpty!2466) (not b!53018) b_and!2941 (not b!53035) tp_is_empty!2265 (not b!53034) (not b!53016) (not b_next!1697) (not b!53028) (not b_next!1699) (not start!8266) (not mapNonEmpty!2465) (not b!53024) (not b!53032) (not b!53031) (not b_lambda!2359) b_and!2939)
(check-sat b_and!2939 b_and!2941 (not b_next!1697) (not b_next!1699))
