; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11648 () Bool)

(assert start!11648)

(declare-fun b!97072 () Bool)

(declare-fun b_free!2413 () Bool)

(declare-fun b_next!2413 () Bool)

(assert (=> b!97072 (= b_free!2413 (not b_next!2413))))

(declare-fun tp!9523 () Bool)

(declare-fun b_and!5933 () Bool)

(assert (=> b!97072 (= tp!9523 b_and!5933)))

(declare-fun b!97064 () Bool)

(declare-fun b_free!2415 () Bool)

(declare-fun b_next!2415 () Bool)

(assert (=> b!97064 (= b_free!2415 (not b_next!2415))))

(declare-fun tp!9522 () Bool)

(declare-fun b_and!5935 () Bool)

(assert (=> b!97064 (= tp!9522 b_and!5935)))

(declare-fun b!97062 () Bool)

(declare-fun e!63269 () Bool)

(declare-datatypes ((V!3145 0))(
  ( (V!3146 (val!1356 Int)) )
))
(declare-datatypes ((array!4205 0))(
  ( (array!4206 (arr!1996 (Array (_ BitVec 32) (_ BitVec 64))) (size!2247 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!968 0))(
  ( (ValueCellFull!968 (v!2784 V!3145)) (EmptyCell!968) )
))
(declare-datatypes ((array!4207 0))(
  ( (array!4208 (arr!1997 (Array (_ BitVec 32) ValueCell!968)) (size!2248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!844 0))(
  ( (LongMapFixedSize!845 (defaultEntry!2477 Int) (mask!6571 (_ BitVec 32)) (extraKeys!2298 (_ BitVec 32)) (zeroValue!2360 V!3145) (minValue!2360 V!3145) (_size!471 (_ BitVec 32)) (_keys!4166 array!4205) (_values!2460 array!4207) (_vacant!471 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!634 0))(
  ( (Cell!635 (v!2785 LongMapFixedSize!844)) )
))
(declare-datatypes ((LongMap!634 0))(
  ( (LongMap!635 (underlying!328 Cell!634)) )
))
(declare-fun thiss!992 () LongMap!634)

(assert (=> b!97062 (= e!63269 (and (= (size!2248 (_values!2460 (v!2785 (underlying!328 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6571 (v!2785 (underlying!328 thiss!992))))) (= (size!2247 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) (size!2248 (_values!2460 (v!2785 (underlying!328 thiss!992))))) (bvslt (mask!6571 (v!2785 (underlying!328 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!97063 () Bool)

(declare-datatypes ((Unit!2928 0))(
  ( (Unit!2929) )
))
(declare-fun e!63270 () Unit!2928)

(declare-fun Unit!2930 () Unit!2928)

(assert (=> b!97063 (= e!63270 Unit!2930)))

(declare-fun lt!48580 () Unit!2928)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!94 (array!4205 array!4207 (_ BitVec 32) (_ BitVec 32) V!3145 V!3145 (_ BitVec 64) (_ BitVec 32) Int) Unit!2928)

(assert (=> b!97063 (= lt!48580 (lemmaListMapContainsThenArrayContainsFrom!94 (_keys!4166 (v!2785 (underlying!328 thiss!992))) (_values!2460 (v!2785 (underlying!328 thiss!992))) (mask!6571 (v!2785 (underlying!328 thiss!992))) (extraKeys!2298 (v!2785 (underlying!328 thiss!992))) (zeroValue!2360 (v!2785 (underlying!328 thiss!992))) (minValue!2360 (v!2785 (underlying!328 thiss!992))) (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2477 (v!2785 (underlying!328 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!97063 (arrayContainsKey!0 (_keys!4166 (v!2785 (underlying!328 thiss!992))) (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!48582 () Unit!2928)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4205 (_ BitVec 32) (_ BitVec 32)) Unit!2928)

(assert (=> b!97063 (= lt!48582 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4166 (v!2785 (underlying!328 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1583 0))(
  ( (Nil!1580) (Cons!1579 (h!2173 (_ BitVec 64)) (t!5516 List!1583)) )
))
(declare-fun arrayNoDuplicates!0 (array!4205 (_ BitVec 32) List!1583) Bool)

(assert (=> b!97063 (arrayNoDuplicates!0 (_keys!4166 (v!2785 (underlying!328 thiss!992))) from!355 Nil!1580)))

(declare-fun lt!48577 () Unit!2928)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4205 (_ BitVec 32) (_ BitVec 64) List!1583) Unit!2928)

(assert (=> b!97063 (= lt!48577 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4166 (v!2785 (underlying!328 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) (Cons!1579 (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) Nil!1580)))))

(assert (=> b!97063 false))

(declare-fun e!63283 () Bool)

(declare-fun e!63278 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!844)

(declare-fun tp_is_empty!2623 () Bool)

(declare-fun array_inv!1251 (array!4205) Bool)

(declare-fun array_inv!1252 (array!4207) Bool)

(assert (=> b!97064 (= e!63283 (and tp!9522 tp_is_empty!2623 (array_inv!1251 (_keys!4166 newMap!16)) (array_inv!1252 (_values!2460 newMap!16)) e!63278))))

(declare-fun b!97065 () Bool)

(declare-fun e!63275 () Bool)

(declare-fun e!63271 () Bool)

(assert (=> b!97065 (= e!63275 e!63271)))

(declare-fun res!48948 () Bool)

(assert (=> b!97065 (=> (not res!48948) (not e!63271))))

(declare-datatypes ((tuple2!2318 0))(
  ( (tuple2!2319 (_1!1170 (_ BitVec 64)) (_2!1170 V!3145)) )
))
(declare-datatypes ((List!1584 0))(
  ( (Nil!1581) (Cons!1580 (h!2174 tuple2!2318) (t!5517 List!1584)) )
))
(declare-datatypes ((ListLongMap!1509 0))(
  ( (ListLongMap!1510 (toList!770 List!1584)) )
))
(declare-fun lt!48583 () ListLongMap!1509)

(declare-fun lt!48581 () ListLongMap!1509)

(assert (=> b!97065 (= res!48948 (and (= lt!48583 lt!48581) (not (= (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1240 (LongMapFixedSize!844) ListLongMap!1509)

(assert (=> b!97065 (= lt!48581 (map!1240 newMap!16))))

(declare-fun getCurrentListMap!452 (array!4205 array!4207 (_ BitVec 32) (_ BitVec 32) V!3145 V!3145 (_ BitVec 32) Int) ListLongMap!1509)

(assert (=> b!97065 (= lt!48583 (getCurrentListMap!452 (_keys!4166 (v!2785 (underlying!328 thiss!992))) (_values!2460 (v!2785 (underlying!328 thiss!992))) (mask!6571 (v!2785 (underlying!328 thiss!992))) (extraKeys!2298 (v!2785 (underlying!328 thiss!992))) (zeroValue!2360 (v!2785 (underlying!328 thiss!992))) (minValue!2360 (v!2785 (underlying!328 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2477 (v!2785 (underlying!328 thiss!992)))))))

(declare-fun b!97066 () Bool)

(declare-fun e!63272 () Bool)

(declare-fun mapRes!3722 () Bool)

(assert (=> b!97066 (= e!63278 (and e!63272 mapRes!3722))))

(declare-fun condMapEmpty!3722 () Bool)

(declare-fun mapDefault!3722 () ValueCell!968)

(assert (=> b!97066 (= condMapEmpty!3722 (= (arr!1997 (_values!2460 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!968)) mapDefault!3722)))))

(declare-fun b!97067 () Bool)

(declare-fun res!48950 () Bool)

(assert (=> b!97067 (=> (not res!48950) (not e!63275))))

(assert (=> b!97067 (= res!48950 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2247 (_keys!4166 (v!2785 (underlying!328 thiss!992)))))))))

(declare-fun b!97068 () Bool)

(declare-fun res!48947 () Bool)

(assert (=> b!97068 (=> (not res!48947) (not e!63275))))

(declare-fun valid!388 (LongMapFixedSize!844) Bool)

(assert (=> b!97068 (= res!48947 (valid!388 newMap!16))))

(declare-fun b!97069 () Bool)

(declare-fun e!63281 () Bool)

(declare-fun e!63274 () Bool)

(declare-fun mapRes!3721 () Bool)

(assert (=> b!97069 (= e!63281 (and e!63274 mapRes!3721))))

(declare-fun condMapEmpty!3721 () Bool)

(declare-fun mapDefault!3721 () ValueCell!968)

(assert (=> b!97069 (= condMapEmpty!3721 (= (arr!1997 (_values!2460 (v!2785 (underlying!328 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!968)) mapDefault!3721)))))

(declare-fun b!97070 () Bool)

(declare-fun res!48946 () Bool)

(assert (=> b!97070 (=> (not res!48946) (not e!63275))))

(assert (=> b!97070 (= res!48946 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6571 newMap!16)) (_size!471 (v!2785 (underlying!328 thiss!992)))))))

(declare-fun b!97071 () Bool)

(declare-fun e!63284 () Bool)

(declare-fun e!63282 () Bool)

(assert (=> b!97071 (= e!63284 e!63282)))

(declare-fun e!63280 () Bool)

(assert (=> b!97072 (= e!63280 (and tp!9523 tp_is_empty!2623 (array_inv!1251 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) (array_inv!1252 (_values!2460 (v!2785 (underlying!328 thiss!992)))) e!63281))))

(declare-fun mapIsEmpty!3721 () Bool)

(assert (=> mapIsEmpty!3721 mapRes!3722))

(declare-fun mapIsEmpty!3722 () Bool)

(assert (=> mapIsEmpty!3722 mapRes!3721))

(declare-fun res!48944 () Bool)

(assert (=> start!11648 (=> (not res!48944) (not e!63275))))

(declare-fun valid!389 (LongMap!634) Bool)

(assert (=> start!11648 (= res!48944 (valid!389 thiss!992))))

(assert (=> start!11648 e!63275))

(assert (=> start!11648 e!63284))

(assert (=> start!11648 true))

(assert (=> start!11648 e!63283))

(declare-fun b!97073 () Bool)

(declare-fun Unit!2931 () Unit!2928)

(assert (=> b!97073 (= e!63270 Unit!2931)))

(declare-fun mapNonEmpty!3721 () Bool)

(declare-fun tp!9524 () Bool)

(declare-fun e!63273 () Bool)

(assert (=> mapNonEmpty!3721 (= mapRes!3722 (and tp!9524 e!63273))))

(declare-fun mapKey!3721 () (_ BitVec 32))

(declare-fun mapRest!3722 () (Array (_ BitVec 32) ValueCell!968))

(declare-fun mapValue!3721 () ValueCell!968)

(assert (=> mapNonEmpty!3721 (= (arr!1997 (_values!2460 newMap!16)) (store mapRest!3722 mapKey!3721 mapValue!3721))))

(declare-fun b!97074 () Bool)

(assert (=> b!97074 (= e!63274 tp_is_empty!2623)))

(declare-fun b!97075 () Bool)

(assert (=> b!97075 (= e!63273 tp_is_empty!2623)))

(declare-fun b!97076 () Bool)

(assert (=> b!97076 (= e!63272 tp_is_empty!2623)))

(declare-fun mapNonEmpty!3722 () Bool)

(declare-fun tp!9521 () Bool)

(declare-fun e!63279 () Bool)

(assert (=> mapNonEmpty!3722 (= mapRes!3721 (and tp!9521 e!63279))))

(declare-fun mapValue!3722 () ValueCell!968)

(declare-fun mapKey!3722 () (_ BitVec 32))

(declare-fun mapRest!3721 () (Array (_ BitVec 32) ValueCell!968))

(assert (=> mapNonEmpty!3722 (= (arr!1997 (_values!2460 (v!2785 (underlying!328 thiss!992)))) (store mapRest!3721 mapKey!3722 mapValue!3722))))

(declare-fun b!97077 () Bool)

(assert (=> b!97077 (= e!63282 e!63280)))

(declare-fun b!97078 () Bool)

(declare-fun res!48945 () Bool)

(assert (=> b!97078 (=> (not res!48945) (not e!63269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!97078 (= res!48945 (validMask!0 (mask!6571 (v!2785 (underlying!328 thiss!992)))))))

(declare-fun b!97079 () Bool)

(assert (=> b!97079 (= e!63271 e!63269)))

(declare-fun res!48949 () Bool)

(assert (=> b!97079 (=> (not res!48949) (not e!63269))))

(declare-datatypes ((tuple2!2320 0))(
  ( (tuple2!2321 (_1!1171 Bool) (_2!1171 LongMapFixedSize!844)) )
))
(declare-fun lt!48579 () tuple2!2320)

(assert (=> b!97079 (= res!48949 (and (_1!1171 lt!48579) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!48578 () Unit!2928)

(assert (=> b!97079 (= lt!48578 e!63270)))

(declare-fun c!16430 () Bool)

(declare-fun contains!794 (ListLongMap!1509 (_ BitVec 64)) Bool)

(assert (=> b!97079 (= c!16430 (contains!794 lt!48581 (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355)))))

(declare-fun update!145 (LongMapFixedSize!844 (_ BitVec 64) V!3145) tuple2!2320)

(declare-fun get!1281 (ValueCell!968 V!3145) V!3145)

(declare-fun dynLambda!368 (Int (_ BitVec 64)) V!3145)

(assert (=> b!97079 (= lt!48579 (update!145 newMap!16 (select (arr!1996 (_keys!4166 (v!2785 (underlying!328 thiss!992)))) from!355) (get!1281 (select (arr!1997 (_values!2460 (v!2785 (underlying!328 thiss!992)))) from!355) (dynLambda!368 (defaultEntry!2477 (v!2785 (underlying!328 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!97080 () Bool)

(assert (=> b!97080 (= e!63279 tp_is_empty!2623)))

(assert (= (and start!11648 res!48944) b!97067))

(assert (= (and b!97067 res!48950) b!97068))

(assert (= (and b!97068 res!48947) b!97070))

(assert (= (and b!97070 res!48946) b!97065))

(assert (= (and b!97065 res!48948) b!97079))

(assert (= (and b!97079 c!16430) b!97063))

(assert (= (and b!97079 (not c!16430)) b!97073))

(assert (= (and b!97079 res!48949) b!97078))

(assert (= (and b!97078 res!48945) b!97062))

(assert (= (and b!97069 condMapEmpty!3721) mapIsEmpty!3722))

(assert (= (and b!97069 (not condMapEmpty!3721)) mapNonEmpty!3722))

(get-info :version)

(assert (= (and mapNonEmpty!3722 ((_ is ValueCellFull!968) mapValue!3722)) b!97080))

(assert (= (and b!97069 ((_ is ValueCellFull!968) mapDefault!3721)) b!97074))

(assert (= b!97072 b!97069))

(assert (= b!97077 b!97072))

(assert (= b!97071 b!97077))

(assert (= start!11648 b!97071))

(assert (= (and b!97066 condMapEmpty!3722) mapIsEmpty!3721))

(assert (= (and b!97066 (not condMapEmpty!3722)) mapNonEmpty!3721))

(assert (= (and mapNonEmpty!3721 ((_ is ValueCellFull!968) mapValue!3721)) b!97075))

(assert (= (and b!97066 ((_ is ValueCellFull!968) mapDefault!3722)) b!97076))

(assert (= b!97064 b!97066))

(assert (= start!11648 b!97064))

(declare-fun b_lambda!4311 () Bool)

(assert (=> (not b_lambda!4311) (not b!97079)))

(declare-fun t!5513 () Bool)

(declare-fun tb!1901 () Bool)

(assert (=> (and b!97072 (= (defaultEntry!2477 (v!2785 (underlying!328 thiss!992))) (defaultEntry!2477 (v!2785 (underlying!328 thiss!992)))) t!5513) tb!1901))

(declare-fun result!3233 () Bool)

(assert (=> tb!1901 (= result!3233 tp_is_empty!2623)))

(assert (=> b!97079 t!5513))

(declare-fun b_and!5937 () Bool)

(assert (= b_and!5933 (and (=> t!5513 result!3233) b_and!5937)))

(declare-fun tb!1903 () Bool)

(declare-fun t!5515 () Bool)

(assert (=> (and b!97064 (= (defaultEntry!2477 newMap!16) (defaultEntry!2477 (v!2785 (underlying!328 thiss!992)))) t!5515) tb!1903))

(declare-fun result!3237 () Bool)

(assert (= result!3237 result!3233))

(assert (=> b!97079 t!5515))

(declare-fun b_and!5939 () Bool)

(assert (= b_and!5935 (and (=> t!5515 result!3237) b_and!5939)))

(declare-fun m!105951 () Bool)

(assert (=> start!11648 m!105951))

(declare-fun m!105953 () Bool)

(assert (=> b!97072 m!105953))

(declare-fun m!105955 () Bool)

(assert (=> b!97072 m!105955))

(declare-fun m!105957 () Bool)

(assert (=> mapNonEmpty!3722 m!105957))

(declare-fun m!105959 () Bool)

(assert (=> b!97063 m!105959))

(declare-fun m!105961 () Bool)

(assert (=> b!97063 m!105961))

(declare-fun m!105963 () Bool)

(assert (=> b!97063 m!105963))

(declare-fun m!105965 () Bool)

(assert (=> b!97063 m!105965))

(assert (=> b!97063 m!105963))

(assert (=> b!97063 m!105963))

(declare-fun m!105967 () Bool)

(assert (=> b!97063 m!105967))

(assert (=> b!97063 m!105963))

(declare-fun m!105969 () Bool)

(assert (=> b!97063 m!105969))

(assert (=> b!97079 m!105963))

(declare-fun m!105971 () Bool)

(assert (=> b!97079 m!105971))

(assert (=> b!97079 m!105963))

(declare-fun m!105973 () Bool)

(assert (=> b!97079 m!105973))

(declare-fun m!105975 () Bool)

(assert (=> b!97079 m!105975))

(declare-fun m!105977 () Bool)

(assert (=> b!97079 m!105977))

(assert (=> b!97079 m!105963))

(declare-fun m!105979 () Bool)

(assert (=> b!97079 m!105979))

(assert (=> b!97079 m!105977))

(assert (=> b!97079 m!105971))

(assert (=> b!97079 m!105973))

(assert (=> b!97065 m!105963))

(declare-fun m!105981 () Bool)

(assert (=> b!97065 m!105981))

(declare-fun m!105983 () Bool)

(assert (=> b!97065 m!105983))

(declare-fun m!105985 () Bool)

(assert (=> b!97078 m!105985))

(declare-fun m!105987 () Bool)

(assert (=> b!97068 m!105987))

(declare-fun m!105989 () Bool)

(assert (=> mapNonEmpty!3721 m!105989))

(declare-fun m!105991 () Bool)

(assert (=> b!97064 m!105991))

(declare-fun m!105993 () Bool)

(assert (=> b!97064 m!105993))

(check-sat (not b_lambda!4311) (not mapNonEmpty!3721) (not b!97072) (not b_next!2413) (not b!97078) (not mapNonEmpty!3722) (not b!97063) (not b!97068) (not b_next!2415) (not b!97065) b_and!5937 (not start!11648) tp_is_empty!2623 (not b!97064) b_and!5939 (not b!97079))
(check-sat b_and!5937 b_and!5939 (not b_next!2413) (not b_next!2415))
