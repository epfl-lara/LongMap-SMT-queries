; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11056 () Bool)

(assert start!11056)

(declare-fun b!89938 () Bool)

(declare-fun b_free!2273 () Bool)

(declare-fun b_next!2273 () Bool)

(assert (=> b!89938 (= b_free!2273 (not b_next!2273))))

(declare-fun tp!9064 () Bool)

(declare-fun b_and!5399 () Bool)

(assert (=> b!89938 (= tp!9064 b_and!5399)))

(declare-fun b!89934 () Bool)

(declare-fun b_free!2275 () Bool)

(declare-fun b_next!2275 () Bool)

(assert (=> b!89934 (= b_free!2275 (not b_next!2275))))

(declare-fun tp!9065 () Bool)

(declare-fun b_and!5401 () Bool)

(assert (=> b!89934 (= tp!9065 b_and!5401)))

(declare-fun b!89916 () Bool)

(declare-fun e!58535 () Bool)

(declare-fun tp_is_empty!2553 () Bool)

(assert (=> b!89916 (= e!58535 tp_is_empty!2553)))

(declare-fun b!89917 () Bool)

(declare-fun e!58530 () Bool)

(declare-fun e!58531 () Bool)

(assert (=> b!89917 (= e!58530 e!58531)))

(declare-fun res!45945 () Bool)

(assert (=> b!89917 (=> (not res!45945) (not e!58531))))

(declare-datatypes ((V!3051 0))(
  ( (V!3052 (val!1321 Int)) )
))
(declare-datatypes ((tuple2!2216 0))(
  ( (tuple2!2217 (_1!1119 (_ BitVec 64)) (_2!1119 V!3051)) )
))
(declare-datatypes ((List!1530 0))(
  ( (Nil!1527) (Cons!1526 (h!2118 tuple2!2216) (t!5304 List!1530)) )
))
(declare-datatypes ((ListLongMap!1473 0))(
  ( (ListLongMap!1474 (toList!752 List!1530)) )
))
(declare-fun lt!43341 () ListLongMap!1473)

(declare-fun lt!43336 () ListLongMap!1473)

(assert (=> b!89917 (= res!45945 (= lt!43341 lt!43336))))

(declare-datatypes ((array!4071 0))(
  ( (array!4072 (arr!1937 (Array (_ BitVec 32) (_ BitVec 64))) (size!2184 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!933 0))(
  ( (ValueCellFull!933 (v!2686 V!3051)) (EmptyCell!933) )
))
(declare-datatypes ((array!4073 0))(
  ( (array!4074 (arr!1938 (Array (_ BitVec 32) ValueCell!933)) (size!2185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!774 0))(
  ( (LongMapFixedSize!775 (defaultEntry!2385 Int) (mask!6435 (_ BitVec 32)) (extraKeys!2216 (_ BitVec 32)) (zeroValue!2273 V!3051) (minValue!2273 V!3051) (_size!436 (_ BitVec 32)) (_keys!4065 array!4071) (_values!2368 array!4073) (_vacant!436 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!774)

(declare-fun map!1200 (LongMapFixedSize!774) ListLongMap!1473)

(assert (=> b!89917 (= lt!43336 (map!1200 newMap!16))))

(declare-datatypes ((Cell!574 0))(
  ( (Cell!575 (v!2687 LongMapFixedSize!774)) )
))
(declare-datatypes ((LongMap!574 0))(
  ( (LongMap!575 (underlying!298 Cell!574)) )
))
(declare-fun thiss!992 () LongMap!574)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!445 (array!4071 array!4073 (_ BitVec 32) (_ BitVec 32) V!3051 V!3051 (_ BitVec 32) Int) ListLongMap!1473)

(assert (=> b!89917 (= lt!43341 (getCurrentListMap!445 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (_values!2368 (v!2687 (underlying!298 thiss!992))) (mask!6435 (v!2687 (underlying!298 thiss!992))) (extraKeys!2216 (v!2687 (underlying!298 thiss!992))) (zeroValue!2273 (v!2687 (underlying!298 thiss!992))) (minValue!2273 (v!2687 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2385 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun b!89918 () Bool)

(declare-fun e!58527 () Bool)

(declare-fun mapRes!3473 () Bool)

(assert (=> b!89918 (= e!58527 (and e!58535 mapRes!3473))))

(declare-fun condMapEmpty!3474 () Bool)

(declare-fun mapDefault!3474 () ValueCell!933)

(assert (=> b!89918 (= condMapEmpty!3474 (= (arr!1938 (_values!2368 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!933)) mapDefault!3474)))))

(declare-fun b!89919 () Bool)

(declare-fun e!58534 () Bool)

(assert (=> b!89919 (= e!58534 (bvsle from!355 (size!2184 (_keys!4065 (v!2687 (underlying!298 thiss!992))))))))

(declare-fun b!89920 () Bool)

(declare-datatypes ((Unit!2670 0))(
  ( (Unit!2671) )
))
(declare-fun e!58536 () Unit!2670)

(declare-fun Unit!2672 () Unit!2670)

(assert (=> b!89920 (= e!58536 Unit!2672)))

(declare-fun lt!43338 () Unit!2670)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!71 (array!4071 array!4073 (_ BitVec 32) (_ BitVec 32) V!3051 V!3051 (_ BitVec 64) (_ BitVec 32) Int) Unit!2670)

(assert (=> b!89920 (= lt!43338 (lemmaListMapContainsThenArrayContainsFrom!71 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (_values!2368 (v!2687 (underlying!298 thiss!992))) (mask!6435 (v!2687 (underlying!298 thiss!992))) (extraKeys!2216 (v!2687 (underlying!298 thiss!992))) (zeroValue!2273 (v!2687 (underlying!298 thiss!992))) (minValue!2273 (v!2687 (underlying!298 thiss!992))) (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2385 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!89920 (arrayContainsKey!0 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43330 () Unit!2670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4071 (_ BitVec 32) (_ BitVec 32)) Unit!2670)

(assert (=> b!89920 (= lt!43330 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4065 (v!2687 (underlying!298 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1531 0))(
  ( (Nil!1528) (Cons!1527 (h!2119 (_ BitVec 64)) (t!5305 List!1531)) )
))
(declare-fun arrayNoDuplicates!0 (array!4071 (_ BitVec 32) List!1531) Bool)

(assert (=> b!89920 (arrayNoDuplicates!0 (_keys!4065 (v!2687 (underlying!298 thiss!992))) from!355 Nil!1528)))

(declare-fun lt!43342 () Unit!2670)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4071 (_ BitVec 32) (_ BitVec 64) List!1531) Unit!2670)

(assert (=> b!89920 (= lt!43342 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) (Cons!1527 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) Nil!1528)))))

(assert (=> b!89920 false))

(declare-fun res!45951 () Bool)

(assert (=> start!11056 (=> (not res!45951) (not e!58530))))

(declare-fun valid!333 (LongMap!574) Bool)

(assert (=> start!11056 (= res!45951 (valid!333 thiss!992))))

(assert (=> start!11056 e!58530))

(declare-fun e!58532 () Bool)

(assert (=> start!11056 e!58532))

(assert (=> start!11056 true))

(declare-fun e!58533 () Bool)

(assert (=> start!11056 e!58533))

(declare-fun b!89921 () Bool)

(declare-fun e!58523 () Bool)

(assert (=> b!89921 (= e!58523 tp_is_empty!2553)))

(declare-fun b!89922 () Bool)

(declare-fun res!45948 () Bool)

(assert (=> b!89922 (=> res!45948 e!58534)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4071 (_ BitVec 32)) Bool)

(assert (=> b!89922 (= res!45948 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (mask!6435 (v!2687 (underlying!298 thiss!992))))))))

(declare-fun b!89923 () Bool)

(declare-fun e!58537 () Bool)

(assert (=> b!89923 (= e!58531 e!58537)))

(declare-fun res!45946 () Bool)

(assert (=> b!89923 (=> (not res!45946) (not e!58537))))

(assert (=> b!89923 (= res!45946 (and (not (= (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43339 () V!3051)

(declare-fun get!1214 (ValueCell!933 V!3051) V!3051)

(declare-fun dynLambda!345 (Int (_ BitVec 64)) V!3051)

(assert (=> b!89923 (= lt!43339 (get!1214 (select (arr!1938 (_values!2368 (v!2687 (underlying!298 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2385 (v!2687 (underlying!298 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89924 () Bool)

(declare-fun res!45947 () Bool)

(assert (=> b!89924 (=> res!45947 e!58534)))

(assert (=> b!89924 (= res!45947 (not (arrayNoDuplicates!0 (_keys!4065 (v!2687 (underlying!298 thiss!992))) #b00000000000000000000000000000000 Nil!1528)))))

(declare-fun b!89925 () Bool)

(declare-fun e!58521 () Bool)

(declare-fun e!58526 () Bool)

(declare-fun mapRes!3474 () Bool)

(assert (=> b!89925 (= e!58521 (and e!58526 mapRes!3474))))

(declare-fun condMapEmpty!3473 () Bool)

(declare-fun mapDefault!3473 () ValueCell!933)

(assert (=> b!89925 (= condMapEmpty!3473 (= (arr!1938 (_values!2368 (v!2687 (underlying!298 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!933)) mapDefault!3473)))))

(declare-fun b!89926 () Bool)

(declare-fun e!58528 () Bool)

(assert (=> b!89926 (= e!58528 (not e!58534))))

(declare-fun res!45944 () Bool)

(assert (=> b!89926 (=> res!45944 e!58534)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!89926 (= res!45944 (not (validMask!0 (mask!6435 (v!2687 (underlying!298 thiss!992))))))))

(declare-fun lt!43333 () tuple2!2216)

(declare-fun lt!43337 () ListLongMap!1473)

(declare-fun lt!43331 () tuple2!2216)

(declare-fun lt!43332 () ListLongMap!1473)

(declare-fun +!115 (ListLongMap!1473 tuple2!2216) ListLongMap!1473)

(assert (=> b!89926 (= (+!115 lt!43332 lt!43331) (+!115 (+!115 lt!43337 lt!43331) lt!43333))))

(assert (=> b!89926 (= lt!43331 (tuple2!2217 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2273 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun lt!43340 () Unit!2670)

(declare-fun addCommutativeForDiffKeys!34 (ListLongMap!1473 (_ BitVec 64) V!3051 (_ BitVec 64) V!3051) Unit!2670)

(assert (=> b!89926 (= lt!43340 (addCommutativeForDiffKeys!34 lt!43337 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) lt!43339 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2273 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun lt!43344 () ListLongMap!1473)

(assert (=> b!89926 (= lt!43344 lt!43332)))

(assert (=> b!89926 (= lt!43332 (+!115 lt!43337 lt!43333))))

(declare-fun lt!43346 () ListLongMap!1473)

(declare-fun lt!43345 () tuple2!2216)

(assert (=> b!89926 (= lt!43344 (+!115 lt!43346 lt!43345))))

(declare-fun lt!43335 () ListLongMap!1473)

(assert (=> b!89926 (= lt!43337 (+!115 lt!43335 lt!43345))))

(assert (=> b!89926 (= lt!43345 (tuple2!2217 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2273 (v!2687 (underlying!298 thiss!992)))))))

(assert (=> b!89926 (= lt!43346 (+!115 lt!43335 lt!43333))))

(assert (=> b!89926 (= lt!43333 (tuple2!2217 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) lt!43339))))

(declare-fun lt!43334 () Unit!2670)

(assert (=> b!89926 (= lt!43334 (addCommutativeForDiffKeys!34 lt!43335 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) lt!43339 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2273 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!80 (array!4071 array!4073 (_ BitVec 32) (_ BitVec 32) V!3051 V!3051 (_ BitVec 32) Int) ListLongMap!1473)

(assert (=> b!89926 (= lt!43335 (getCurrentListMapNoExtraKeys!80 (_keys!4065 (v!2687 (underlying!298 thiss!992))) (_values!2368 (v!2687 (underlying!298 thiss!992))) (mask!6435 (v!2687 (underlying!298 thiss!992))) (extraKeys!2216 (v!2687 (underlying!298 thiss!992))) (zeroValue!2273 (v!2687 (underlying!298 thiss!992))) (minValue!2273 (v!2687 (underlying!298 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2385 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun b!89927 () Bool)

(declare-fun e!58524 () Bool)

(assert (=> b!89927 (= e!58524 tp_is_empty!2553)))

(declare-fun b!89928 () Bool)

(assert (=> b!89928 (= e!58537 e!58528)))

(declare-fun res!45943 () Bool)

(assert (=> b!89928 (=> (not res!45943) (not e!58528))))

(declare-datatypes ((tuple2!2218 0))(
  ( (tuple2!2219 (_1!1120 Bool) (_2!1120 LongMapFixedSize!774)) )
))
(declare-fun lt!43343 () tuple2!2218)

(assert (=> b!89928 (= res!45943 (and (_1!1120 lt!43343) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43329 () Unit!2670)

(assert (=> b!89928 (= lt!43329 e!58536)))

(declare-fun c!14969 () Bool)

(declare-fun contains!763 (ListLongMap!1473 (_ BitVec 64)) Bool)

(assert (=> b!89928 (= c!14969 (contains!763 lt!43336 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355)))))

(declare-fun update!116 (LongMapFixedSize!774 (_ BitVec 64) V!3051) tuple2!2218)

(assert (=> b!89928 (= lt!43343 (update!116 newMap!16 (select (arr!1937 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) from!355) lt!43339))))

(declare-fun mapIsEmpty!3473 () Bool)

(assert (=> mapIsEmpty!3473 mapRes!3473))

(declare-fun b!89929 () Bool)

(declare-fun res!45949 () Bool)

(assert (=> b!89929 (=> (not res!45949) (not e!58530))))

(assert (=> b!89929 (= res!45949 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2184 (_keys!4065 (v!2687 (underlying!298 thiss!992)))))))))

(declare-fun mapNonEmpty!3473 () Bool)

(declare-fun tp!9066 () Bool)

(assert (=> mapNonEmpty!3473 (= mapRes!3474 (and tp!9066 e!58523))))

(declare-fun mapRest!3473 () (Array (_ BitVec 32) ValueCell!933))

(declare-fun mapKey!3473 () (_ BitVec 32))

(declare-fun mapValue!3474 () ValueCell!933)

(assert (=> mapNonEmpty!3473 (= (arr!1938 (_values!2368 (v!2687 (underlying!298 thiss!992)))) (store mapRest!3473 mapKey!3473 mapValue!3474))))

(declare-fun b!89930 () Bool)

(declare-fun Unit!2673 () Unit!2670)

(assert (=> b!89930 (= e!58536 Unit!2673)))

(declare-fun b!89931 () Bool)

(declare-fun res!45942 () Bool)

(assert (=> b!89931 (=> (not res!45942) (not e!58530))))

(declare-fun valid!334 (LongMapFixedSize!774) Bool)

(assert (=> b!89931 (= res!45942 (valid!334 newMap!16))))

(declare-fun b!89932 () Bool)

(declare-fun e!58525 () Bool)

(assert (=> b!89932 (= e!58532 e!58525)))

(declare-fun b!89933 () Bool)

(declare-fun res!45950 () Bool)

(assert (=> b!89933 (=> (not res!45950) (not e!58530))))

(assert (=> b!89933 (= res!45950 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6435 newMap!16)) (_size!436 (v!2687 (underlying!298 thiss!992)))))))

(declare-fun mapIsEmpty!3474 () Bool)

(assert (=> mapIsEmpty!3474 mapRes!3474))

(declare-fun array_inv!1199 (array!4071) Bool)

(declare-fun array_inv!1200 (array!4073) Bool)

(assert (=> b!89934 (= e!58533 (and tp!9065 tp_is_empty!2553 (array_inv!1199 (_keys!4065 newMap!16)) (array_inv!1200 (_values!2368 newMap!16)) e!58527))))

(declare-fun b!89935 () Bool)

(declare-fun res!45941 () Bool)

(assert (=> b!89935 (=> res!45941 e!58534)))

(assert (=> b!89935 (= res!45941 (or (not (= (size!2185 (_values!2368 (v!2687 (underlying!298 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6435 (v!2687 (underlying!298 thiss!992)))))) (not (= (size!2184 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) (size!2185 (_values!2368 (v!2687 (underlying!298 thiss!992)))))) (bvslt (mask!6435 (v!2687 (underlying!298 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2216 (v!2687 (underlying!298 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2216 (v!2687 (underlying!298 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!89936 () Bool)

(assert (=> b!89936 (= e!58526 tp_is_empty!2553)))

(declare-fun mapNonEmpty!3474 () Bool)

(declare-fun tp!9063 () Bool)

(assert (=> mapNonEmpty!3474 (= mapRes!3473 (and tp!9063 e!58524))))

(declare-fun mapRest!3474 () (Array (_ BitVec 32) ValueCell!933))

(declare-fun mapKey!3474 () (_ BitVec 32))

(declare-fun mapValue!3473 () ValueCell!933)

(assert (=> mapNonEmpty!3474 (= (arr!1938 (_values!2368 newMap!16)) (store mapRest!3474 mapKey!3474 mapValue!3473))))

(declare-fun b!89937 () Bool)

(declare-fun e!58538 () Bool)

(assert (=> b!89937 (= e!58525 e!58538)))

(assert (=> b!89938 (= e!58538 (and tp!9064 tp_is_empty!2553 (array_inv!1199 (_keys!4065 (v!2687 (underlying!298 thiss!992)))) (array_inv!1200 (_values!2368 (v!2687 (underlying!298 thiss!992)))) e!58521))))

(assert (= (and start!11056 res!45951) b!89929))

(assert (= (and b!89929 res!45949) b!89931))

(assert (= (and b!89931 res!45942) b!89933))

(assert (= (and b!89933 res!45950) b!89917))

(assert (= (and b!89917 res!45945) b!89923))

(assert (= (and b!89923 res!45946) b!89928))

(assert (= (and b!89928 c!14969) b!89920))

(assert (= (and b!89928 (not c!14969)) b!89930))

(assert (= (and b!89928 res!45943) b!89926))

(assert (= (and b!89926 (not res!45944)) b!89935))

(assert (= (and b!89935 (not res!45941)) b!89922))

(assert (= (and b!89922 (not res!45948)) b!89924))

(assert (= (and b!89924 (not res!45947)) b!89919))

(assert (= (and b!89925 condMapEmpty!3473) mapIsEmpty!3474))

(assert (= (and b!89925 (not condMapEmpty!3473)) mapNonEmpty!3473))

(get-info :version)

(assert (= (and mapNonEmpty!3473 ((_ is ValueCellFull!933) mapValue!3474)) b!89921))

(assert (= (and b!89925 ((_ is ValueCellFull!933) mapDefault!3473)) b!89936))

(assert (= b!89938 b!89925))

(assert (= b!89937 b!89938))

(assert (= b!89932 b!89937))

(assert (= start!11056 b!89932))

(assert (= (and b!89918 condMapEmpty!3474) mapIsEmpty!3473))

(assert (= (and b!89918 (not condMapEmpty!3474)) mapNonEmpty!3474))

(assert (= (and mapNonEmpty!3474 ((_ is ValueCellFull!933) mapValue!3473)) b!89927))

(assert (= (and b!89918 ((_ is ValueCellFull!933) mapDefault!3474)) b!89916))

(assert (= b!89934 b!89918))

(assert (= start!11056 b!89934))

(declare-fun b_lambda!3975 () Bool)

(assert (=> (not b_lambda!3975) (not b!89923)))

(declare-fun t!5301 () Bool)

(declare-fun tb!1741 () Bool)

(assert (=> (and b!89938 (= (defaultEntry!2385 (v!2687 (underlying!298 thiss!992))) (defaultEntry!2385 (v!2687 (underlying!298 thiss!992)))) t!5301) tb!1741))

(declare-fun result!2989 () Bool)

(assert (=> tb!1741 (= result!2989 tp_is_empty!2553)))

(assert (=> b!89923 t!5301))

(declare-fun b_and!5403 () Bool)

(assert (= b_and!5399 (and (=> t!5301 result!2989) b_and!5403)))

(declare-fun tb!1743 () Bool)

(declare-fun t!5303 () Bool)

(assert (=> (and b!89934 (= (defaultEntry!2385 newMap!16) (defaultEntry!2385 (v!2687 (underlying!298 thiss!992)))) t!5303) tb!1743))

(declare-fun result!2993 () Bool)

(assert (= result!2993 result!2989))

(assert (=> b!89923 t!5303))

(declare-fun b_and!5405 () Bool)

(assert (= b_and!5401 (and (=> t!5303 result!2993) b_and!5405)))

(declare-fun m!96689 () Bool)

(assert (=> mapNonEmpty!3474 m!96689))

(declare-fun m!96691 () Bool)

(assert (=> b!89934 m!96691))

(declare-fun m!96693 () Bool)

(assert (=> b!89934 m!96693))

(declare-fun m!96695 () Bool)

(assert (=> b!89924 m!96695))

(declare-fun m!96697 () Bool)

(assert (=> b!89928 m!96697))

(assert (=> b!89928 m!96697))

(declare-fun m!96699 () Bool)

(assert (=> b!89928 m!96699))

(assert (=> b!89928 m!96697))

(declare-fun m!96701 () Bool)

(assert (=> b!89928 m!96701))

(declare-fun m!96703 () Bool)

(assert (=> start!11056 m!96703))

(declare-fun m!96705 () Bool)

(assert (=> b!89938 m!96705))

(declare-fun m!96707 () Bool)

(assert (=> b!89938 m!96707))

(declare-fun m!96709 () Bool)

(assert (=> b!89917 m!96709))

(declare-fun m!96711 () Bool)

(assert (=> b!89917 m!96711))

(declare-fun m!96713 () Bool)

(assert (=> mapNonEmpty!3473 m!96713))

(declare-fun m!96715 () Bool)

(assert (=> b!89926 m!96715))

(assert (=> b!89926 m!96697))

(declare-fun m!96717 () Bool)

(assert (=> b!89926 m!96717))

(declare-fun m!96719 () Bool)

(assert (=> b!89926 m!96719))

(declare-fun m!96721 () Bool)

(assert (=> b!89926 m!96721))

(declare-fun m!96723 () Bool)

(assert (=> b!89926 m!96723))

(declare-fun m!96725 () Bool)

(assert (=> b!89926 m!96725))

(declare-fun m!96727 () Bool)

(assert (=> b!89926 m!96727))

(declare-fun m!96729 () Bool)

(assert (=> b!89926 m!96729))

(assert (=> b!89926 m!96697))

(assert (=> b!89926 m!96721))

(declare-fun m!96731 () Bool)

(assert (=> b!89926 m!96731))

(assert (=> b!89926 m!96697))

(declare-fun m!96733 () Bool)

(assert (=> b!89926 m!96733))

(declare-fun m!96735 () Bool)

(assert (=> b!89926 m!96735))

(declare-fun m!96737 () Bool)

(assert (=> b!89922 m!96737))

(declare-fun m!96739 () Bool)

(assert (=> b!89931 m!96739))

(assert (=> b!89923 m!96697))

(declare-fun m!96741 () Bool)

(assert (=> b!89923 m!96741))

(declare-fun m!96743 () Bool)

(assert (=> b!89923 m!96743))

(assert (=> b!89923 m!96741))

(assert (=> b!89923 m!96743))

(declare-fun m!96745 () Bool)

(assert (=> b!89923 m!96745))

(declare-fun m!96747 () Bool)

(assert (=> b!89920 m!96747))

(declare-fun m!96749 () Bool)

(assert (=> b!89920 m!96749))

(assert (=> b!89920 m!96697))

(declare-fun m!96751 () Bool)

(assert (=> b!89920 m!96751))

(assert (=> b!89920 m!96697))

(assert (=> b!89920 m!96697))

(declare-fun m!96753 () Bool)

(assert (=> b!89920 m!96753))

(assert (=> b!89920 m!96697))

(declare-fun m!96755 () Bool)

(assert (=> b!89920 m!96755))

(check-sat (not b!89922) (not b!89934) b_and!5405 (not b!89931) (not b!89920) (not b_next!2273) tp_is_empty!2553 (not b!89926) (not b!89924) (not start!11056) (not b!89923) (not b!89938) b_and!5403 (not mapNonEmpty!3473) (not b!89917) (not b!89928) (not b_lambda!3975) (not mapNonEmpty!3474) (not b_next!2275))
(check-sat b_and!5403 b_and!5405 (not b_next!2273) (not b_next!2275))
