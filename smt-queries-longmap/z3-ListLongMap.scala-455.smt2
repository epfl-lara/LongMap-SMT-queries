; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8346 () Bool)

(assert start!8346)

(declare-fun b!55267 () Bool)

(declare-fun b_free!1849 () Bool)

(declare-fun b_next!1849 () Bool)

(assert (=> b!55267 (= b_free!1849 (not b_next!1849))))

(declare-fun tp!7650 () Bool)

(declare-fun b_and!3237 () Bool)

(assert (=> b!55267 (= tp!7650 b_and!3237)))

(declare-fun b!55251 () Bool)

(declare-fun b_free!1851 () Bool)

(declare-fun b_next!1851 () Bool)

(assert (=> b!55251 (= b_free!1851 (not b_next!1851))))

(declare-fun tp!7648 () Bool)

(declare-fun b_and!3239 () Bool)

(assert (=> b!55251 (= tp!7648 b_and!3239)))

(declare-fun b!55248 () Bool)

(declare-fun res!31131 () Bool)

(declare-fun e!36283 () Bool)

(assert (=> b!55248 (=> res!31131 e!36283)))

(declare-datatypes ((List!1385 0))(
  ( (Nil!1382) (Cons!1381 (h!1961 (_ BitVec 64)) (t!4603 List!1385)) )
))
(declare-fun lt!21853 () List!1385)

(declare-fun noDuplicate!37 (List!1385) Bool)

(assert (=> b!55248 (= res!31131 (not (noDuplicate!37 lt!21853)))))

(declare-fun b!55249 () Bool)

(declare-fun e!36286 () Bool)

(declare-fun tp_is_empty!2341 () Bool)

(assert (=> b!55249 (= e!36286 tp_is_empty!2341)))

(declare-fun b!55250 () Bool)

(declare-fun res!31137 () Bool)

(declare-fun e!36289 () Bool)

(assert (=> b!55250 (=> (not res!31137) (not e!36289))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2769 0))(
  ( (V!2770 (val!1215 Int)) )
))
(declare-datatypes ((array!3591 0))(
  ( (array!3592 (arr!1718 (Array (_ BitVec 32) (_ BitVec 64))) (size!1947 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!827 0))(
  ( (ValueCellFull!827 (v!2318 V!2769)) (EmptyCell!827) )
))
(declare-datatypes ((array!3593 0))(
  ( (array!3594 (arr!1719 (Array (_ BitVec 32) ValueCell!827)) (size!1948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!562 0))(
  ( (LongMapFixedSize!563 (defaultEntry!1995 Int) (mask!5852 (_ BitVec 32)) (extraKeys!1886 (_ BitVec 32)) (zeroValue!1913 V!2769) (minValue!1913 V!2769) (_size!330 (_ BitVec 32)) (_keys!3615 array!3591) (_values!1978 array!3593) (_vacant!330 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!380 0))(
  ( (Cell!381 (v!2319 LongMapFixedSize!562)) )
))
(declare-datatypes ((LongMap!380 0))(
  ( (LongMap!381 (underlying!201 Cell!380)) )
))
(declare-fun thiss!992 () LongMap!380)

(assert (=> b!55250 (= res!31137 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1947 (_keys!3615 (v!2319 (underlying!201 thiss!992)))))))))

(declare-fun e!36298 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!562)

(declare-fun e!36297 () Bool)

(declare-fun array_inv!1057 (array!3591) Bool)

(declare-fun array_inv!1058 (array!3593) Bool)

(assert (=> b!55251 (= e!36297 (and tp!7648 tp_is_empty!2341 (array_inv!1057 (_keys!3615 newMap!16)) (array_inv!1058 (_values!1978 newMap!16)) e!36298))))

(declare-fun mapNonEmpty!2693 () Bool)

(declare-fun mapRes!2694 () Bool)

(declare-fun tp!7649 () Bool)

(declare-fun e!36296 () Bool)

(assert (=> mapNonEmpty!2693 (= mapRes!2694 (and tp!7649 e!36296))))

(declare-fun mapValue!2694 () ValueCell!827)

(declare-fun mapKey!2693 () (_ BitVec 32))

(declare-fun mapRest!2693 () (Array (_ BitVec 32) ValueCell!827))

(assert (=> mapNonEmpty!2693 (= (arr!1719 (_values!1978 (v!2319 (underlying!201 thiss!992)))) (store mapRest!2693 mapKey!2693 mapValue!2694))))

(declare-fun b!55252 () Bool)

(declare-fun res!31133 () Bool)

(assert (=> b!55252 (=> res!31133 e!36283)))

(declare-fun contains!646 (List!1385 (_ BitVec 64)) Bool)

(assert (=> b!55252 (= res!31133 (contains!646 lt!21853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!31139 () Bool)

(assert (=> start!8346 (=> (not res!31139) (not e!36289))))

(declare-fun valid!236 (LongMap!380) Bool)

(assert (=> start!8346 (= res!31139 (valid!236 thiss!992))))

(assert (=> start!8346 e!36289))

(declare-fun e!36291 () Bool)

(assert (=> start!8346 e!36291))

(assert (=> start!8346 true))

(assert (=> start!8346 e!36297))

(declare-fun b!55253 () Bool)

(declare-fun e!36287 () Bool)

(declare-fun e!36294 () Bool)

(assert (=> b!55253 (= e!36287 e!36294)))

(declare-fun res!31136 () Bool)

(assert (=> b!55253 (=> (not res!31136) (not e!36294))))

(declare-datatypes ((tuple2!1954 0))(
  ( (tuple2!1955 (_1!988 (_ BitVec 64)) (_2!988 V!2769)) )
))
(declare-datatypes ((List!1386 0))(
  ( (Nil!1383) (Cons!1382 (h!1962 tuple2!1954) (t!4604 List!1386)) )
))
(declare-datatypes ((ListLongMap!1309 0))(
  ( (ListLongMap!1310 (toList!670 List!1386)) )
))
(declare-fun lt!21857 () ListLongMap!1309)

(declare-fun contains!647 (ListLongMap!1309 (_ BitVec 64)) Bool)

(assert (=> b!55253 (= res!31136 (contains!647 lt!21857 (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1956 0))(
  ( (tuple2!1957 (_1!989 Bool) (_2!989 LongMapFixedSize!562)) )
))
(declare-fun lt!21856 () tuple2!1956)

(declare-fun update!73 (LongMapFixedSize!562 (_ BitVec 64) V!2769) tuple2!1956)

(declare-fun get!1036 (ValueCell!827 V!2769) V!2769)

(declare-fun dynLambda!291 (Int (_ BitVec 64)) V!2769)

(assert (=> b!55253 (= lt!21856 (update!73 newMap!16 (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) (get!1036 (select (arr!1719 (_values!1978 (v!2319 (underlying!201 thiss!992)))) from!355) (dynLambda!291 (defaultEntry!1995 (v!2319 (underlying!201 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55254 () Bool)

(declare-fun e!36290 () Bool)

(assert (=> b!55254 (= e!36291 e!36290)))

(declare-fun mapIsEmpty!2693 () Bool)

(assert (=> mapIsEmpty!2693 mapRes!2694))

(declare-fun b!55255 () Bool)

(declare-fun res!31135 () Bool)

(assert (=> b!55255 (=> res!31135 e!36283)))

(declare-fun arrayNoDuplicates!0 (array!3591 (_ BitVec 32) List!1385) Bool)

(assert (=> b!55255 (= res!31135 (not (arrayNoDuplicates!0 (_keys!3615 (v!2319 (underlying!201 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21853)))))

(declare-fun b!55256 () Bool)

(assert (=> b!55256 (= e!36289 e!36287)))

(declare-fun res!31132 () Bool)

(assert (=> b!55256 (=> (not res!31132) (not e!36287))))

(declare-fun lt!21851 () ListLongMap!1309)

(assert (=> b!55256 (= res!31132 (and (= lt!21851 lt!21857) (not (= (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1075 (LongMapFixedSize!562) ListLongMap!1309)

(assert (=> b!55256 (= lt!21857 (map!1075 newMap!16))))

(declare-fun getCurrentListMap!373 (array!3591 array!3593 (_ BitVec 32) (_ BitVec 32) V!2769 V!2769 (_ BitVec 32) Int) ListLongMap!1309)

(assert (=> b!55256 (= lt!21851 (getCurrentListMap!373 (_keys!3615 (v!2319 (underlying!201 thiss!992))) (_values!1978 (v!2319 (underlying!201 thiss!992))) (mask!5852 (v!2319 (underlying!201 thiss!992))) (extraKeys!1886 (v!2319 (underlying!201 thiss!992))) (zeroValue!1913 (v!2319 (underlying!201 thiss!992))) (minValue!1913 (v!2319 (underlying!201 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1995 (v!2319 (underlying!201 thiss!992)))))))

(declare-fun mapIsEmpty!2694 () Bool)

(declare-fun mapRes!2693 () Bool)

(assert (=> mapIsEmpty!2694 mapRes!2693))

(declare-fun b!55257 () Bool)

(declare-fun res!31138 () Bool)

(assert (=> b!55257 (=> res!31138 e!36283)))

(assert (=> b!55257 (= res!31138 (contains!646 lt!21853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55258 () Bool)

(assert (=> b!55258 (= e!36283 true)))

(declare-fun lt!21855 () Bool)

(assert (=> b!55258 (= lt!21855 (contains!646 lt!21853 (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355)))))

(declare-fun b!55259 () Bool)

(declare-fun res!31140 () Bool)

(assert (=> b!55259 (=> (not res!31140) (not e!36289))))

(assert (=> b!55259 (= res!31140 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5852 newMap!16)) (_size!330 (v!2319 (underlying!201 thiss!992)))))))

(declare-fun b!55260 () Bool)

(assert (=> b!55260 (= e!36296 tp_is_empty!2341)))

(declare-fun b!55261 () Bool)

(declare-fun e!36292 () Bool)

(assert (=> b!55261 (= e!36298 (and e!36292 mapRes!2693))))

(declare-fun condMapEmpty!2693 () Bool)

(declare-fun mapDefault!2694 () ValueCell!827)

(assert (=> b!55261 (= condMapEmpty!2693 (= (arr!1719 (_values!1978 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!827)) mapDefault!2694)))))

(declare-fun b!55262 () Bool)

(declare-fun e!36284 () Bool)

(assert (=> b!55262 (= e!36284 tp_is_empty!2341)))

(declare-fun mapNonEmpty!2694 () Bool)

(declare-fun tp!7647 () Bool)

(assert (=> mapNonEmpty!2694 (= mapRes!2693 (and tp!7647 e!36284))))

(declare-fun mapKey!2694 () (_ BitVec 32))

(declare-fun mapValue!2693 () ValueCell!827)

(declare-fun mapRest!2694 () (Array (_ BitVec 32) ValueCell!827))

(assert (=> mapNonEmpty!2694 (= (arr!1719 (_values!1978 newMap!16)) (store mapRest!2694 mapKey!2694 mapValue!2693))))

(declare-fun b!55263 () Bool)

(declare-fun res!31141 () Bool)

(assert (=> b!55263 (=> (not res!31141) (not e!36289))))

(declare-fun valid!237 (LongMapFixedSize!562) Bool)

(assert (=> b!55263 (= res!31141 (valid!237 newMap!16))))

(declare-fun b!55264 () Bool)

(declare-fun e!36288 () Bool)

(assert (=> b!55264 (= e!36288 (and e!36286 mapRes!2694))))

(declare-fun condMapEmpty!2694 () Bool)

(declare-fun mapDefault!2693 () ValueCell!827)

(assert (=> b!55264 (= condMapEmpty!2694 (= (arr!1719 (_values!1978 (v!2319 (underlying!201 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!827)) mapDefault!2693)))))

(declare-fun b!55265 () Bool)

(declare-fun e!36295 () Bool)

(assert (=> b!55265 (= e!36290 e!36295)))

(declare-fun b!55266 () Bool)

(assert (=> b!55266 (= e!36294 (not e!36283))))

(declare-fun res!31134 () Bool)

(assert (=> b!55266 (=> res!31134 e!36283)))

(assert (=> b!55266 (= res!31134 (or (bvsge (size!1947 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1947 (_keys!3615 (v!2319 (underlying!201 thiss!992)))))))))

(assert (=> b!55266 (= lt!21853 (Cons!1381 (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) Nil!1382))))

(assert (=> b!55266 (arrayNoDuplicates!0 (_keys!3615 (v!2319 (underlying!201 thiss!992))) from!355 Nil!1382)))

(declare-datatypes ((Unit!1456 0))(
  ( (Unit!1457) )
))
(declare-fun lt!21854 () Unit!1456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3591 (_ BitVec 32) (_ BitVec 32)) Unit!1456)

(assert (=> b!55266 (= lt!21854 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3615 (v!2319 (underlying!201 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55266 (arrayContainsKey!0 (_keys!3615 (v!2319 (underlying!201 thiss!992))) (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21852 () Unit!1456)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!12 (array!3591 array!3593 (_ BitVec 32) (_ BitVec 32) V!2769 V!2769 (_ BitVec 64) (_ BitVec 32) Int) Unit!1456)

(assert (=> b!55266 (= lt!21852 (lemmaListMapContainsThenArrayContainsFrom!12 (_keys!3615 (v!2319 (underlying!201 thiss!992))) (_values!1978 (v!2319 (underlying!201 thiss!992))) (mask!5852 (v!2319 (underlying!201 thiss!992))) (extraKeys!1886 (v!2319 (underlying!201 thiss!992))) (zeroValue!1913 (v!2319 (underlying!201 thiss!992))) (minValue!1913 (v!2319 (underlying!201 thiss!992))) (select (arr!1718 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1995 (v!2319 (underlying!201 thiss!992)))))))

(assert (=> b!55267 (= e!36295 (and tp!7650 tp_is_empty!2341 (array_inv!1057 (_keys!3615 (v!2319 (underlying!201 thiss!992)))) (array_inv!1058 (_values!1978 (v!2319 (underlying!201 thiss!992)))) e!36288))))

(declare-fun b!55268 () Bool)

(assert (=> b!55268 (= e!36292 tp_is_empty!2341)))

(assert (= (and start!8346 res!31139) b!55250))

(assert (= (and b!55250 res!31137) b!55263))

(assert (= (and b!55263 res!31141) b!55259))

(assert (= (and b!55259 res!31140) b!55256))

(assert (= (and b!55256 res!31132) b!55253))

(assert (= (and b!55253 res!31136) b!55266))

(assert (= (and b!55266 (not res!31134)) b!55248))

(assert (= (and b!55248 (not res!31131)) b!55257))

(assert (= (and b!55257 (not res!31138)) b!55252))

(assert (= (and b!55252 (not res!31133)) b!55255))

(assert (= (and b!55255 (not res!31135)) b!55258))

(assert (= (and b!55264 condMapEmpty!2694) mapIsEmpty!2693))

(assert (= (and b!55264 (not condMapEmpty!2694)) mapNonEmpty!2693))

(get-info :version)

(assert (= (and mapNonEmpty!2693 ((_ is ValueCellFull!827) mapValue!2694)) b!55260))

(assert (= (and b!55264 ((_ is ValueCellFull!827) mapDefault!2693)) b!55249))

(assert (= b!55267 b!55264))

(assert (= b!55265 b!55267))

(assert (= b!55254 b!55265))

(assert (= start!8346 b!55254))

(assert (= (and b!55261 condMapEmpty!2693) mapIsEmpty!2694))

(assert (= (and b!55261 (not condMapEmpty!2693)) mapNonEmpty!2694))

(assert (= (and mapNonEmpty!2694 ((_ is ValueCellFull!827) mapValue!2693)) b!55262))

(assert (= (and b!55261 ((_ is ValueCellFull!827) mapDefault!2694)) b!55268))

(assert (= b!55251 b!55261))

(assert (= start!8346 b!55251))

(declare-fun b_lambda!2435 () Bool)

(assert (=> (not b_lambda!2435) (not b!55253)))

(declare-fun t!4600 () Bool)

(declare-fun tb!1193 () Bool)

(assert (=> (and b!55267 (= (defaultEntry!1995 (v!2319 (underlying!201 thiss!992))) (defaultEntry!1995 (v!2319 (underlying!201 thiss!992)))) t!4600) tb!1193))

(declare-fun result!2187 () Bool)

(assert (=> tb!1193 (= result!2187 tp_is_empty!2341)))

(assert (=> b!55253 t!4600))

(declare-fun b_and!3241 () Bool)

(assert (= b_and!3237 (and (=> t!4600 result!2187) b_and!3241)))

(declare-fun t!4602 () Bool)

(declare-fun tb!1195 () Bool)

(assert (=> (and b!55251 (= (defaultEntry!1995 newMap!16) (defaultEntry!1995 (v!2319 (underlying!201 thiss!992)))) t!4602) tb!1195))

(declare-fun result!2191 () Bool)

(assert (= result!2191 result!2187))

(assert (=> b!55253 t!4602))

(declare-fun b_and!3243 () Bool)

(assert (= b_and!3239 (and (=> t!4602 result!2191) b_and!3243)))

(declare-fun m!46531 () Bool)

(assert (=> mapNonEmpty!2694 m!46531))

(declare-fun m!46533 () Bool)

(assert (=> b!55263 m!46533))

(declare-fun m!46535 () Bool)

(assert (=> b!55267 m!46535))

(declare-fun m!46537 () Bool)

(assert (=> b!55267 m!46537))

(declare-fun m!46539 () Bool)

(assert (=> b!55251 m!46539))

(declare-fun m!46541 () Bool)

(assert (=> b!55251 m!46541))

(declare-fun m!46543 () Bool)

(assert (=> start!8346 m!46543))

(declare-fun m!46545 () Bool)

(assert (=> b!55252 m!46545))

(declare-fun m!46547 () Bool)

(assert (=> b!55266 m!46547))

(declare-fun m!46549 () Bool)

(assert (=> b!55266 m!46549))

(declare-fun m!46551 () Bool)

(assert (=> b!55266 m!46551))

(declare-fun m!46553 () Bool)

(assert (=> b!55266 m!46553))

(assert (=> b!55266 m!46551))

(assert (=> b!55266 m!46551))

(declare-fun m!46555 () Bool)

(assert (=> b!55266 m!46555))

(declare-fun m!46557 () Bool)

(assert (=> mapNonEmpty!2693 m!46557))

(declare-fun m!46559 () Bool)

(assert (=> b!55255 m!46559))

(assert (=> b!55256 m!46551))

(declare-fun m!46561 () Bool)

(assert (=> b!55256 m!46561))

(declare-fun m!46563 () Bool)

(assert (=> b!55256 m!46563))

(declare-fun m!46565 () Bool)

(assert (=> b!55248 m!46565))

(declare-fun m!46567 () Bool)

(assert (=> b!55253 m!46567))

(declare-fun m!46569 () Bool)

(assert (=> b!55253 m!46569))

(declare-fun m!46571 () Bool)

(assert (=> b!55253 m!46571))

(assert (=> b!55253 m!46551))

(assert (=> b!55253 m!46551))

(declare-fun m!46573 () Bool)

(assert (=> b!55253 m!46573))

(assert (=> b!55253 m!46569))

(assert (=> b!55253 m!46551))

(assert (=> b!55253 m!46571))

(declare-fun m!46575 () Bool)

(assert (=> b!55253 m!46575))

(assert (=> b!55253 m!46567))

(assert (=> b!55258 m!46551))

(assert (=> b!55258 m!46551))

(declare-fun m!46577 () Bool)

(assert (=> b!55258 m!46577))

(declare-fun m!46579 () Bool)

(assert (=> b!55257 m!46579))

(check-sat (not b!55253) (not b!55258) (not b!55267) (not b!55251) (not b!55252) (not b!55248) (not mapNonEmpty!2694) (not b_next!1851) (not b!55256) (not b!55263) (not b_lambda!2435) (not b_next!1849) tp_is_empty!2341 (not b!55255) (not b!55266) b_and!3243 (not start!8346) b_and!3241 (not mapNonEmpty!2693) (not b!55257))
(check-sat b_and!3241 b_and!3243 (not b_next!1849) (not b_next!1851))
