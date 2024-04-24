; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10146 () Bool)

(assert start!10146)

(declare-fun b!77317 () Bool)

(declare-fun b_free!2173 () Bool)

(declare-fun b_next!2173 () Bool)

(assert (=> b!77317 (= b_free!2173 (not b_next!2173))))

(declare-fun tp!8718 () Bool)

(declare-fun b_and!4749 () Bool)

(assert (=> b!77317 (= tp!8718 b_and!4749)))

(declare-fun b!77305 () Bool)

(declare-fun b_free!2175 () Bool)

(declare-fun b_next!2175 () Bool)

(assert (=> b!77305 (= b_free!2175 (not b_next!2175))))

(declare-fun tp!8715 () Bool)

(declare-fun b_and!4751 () Bool)

(assert (=> b!77305 (= tp!8715 b_and!4751)))

(declare-fun mapIsEmpty!3275 () Bool)

(declare-fun mapRes!3275 () Bool)

(assert (=> mapIsEmpty!3275 mapRes!3275))

(declare-fun b!77299 () Bool)

(declare-fun e!50522 () Bool)

(declare-fun tp_is_empty!2503 () Bool)

(assert (=> b!77299 (= e!50522 tp_is_empty!2503)))

(declare-fun b!77300 () Bool)

(declare-fun e!50534 () Bool)

(assert (=> b!77300 (= e!50534 tp_is_empty!2503)))

(declare-fun b!77301 () Bool)

(declare-fun e!50527 () Bool)

(declare-fun e!50530 () Bool)

(assert (=> b!77301 (= e!50527 e!50530)))

(declare-fun res!40597 () Bool)

(assert (=> b!77301 (=> (not res!40597) (not e!50530))))

(declare-datatypes ((V!2985 0))(
  ( (V!2986 (val!1296 Int)) )
))
(declare-datatypes ((tuple2!2158 0))(
  ( (tuple2!2159 (_1!1090 (_ BitVec 64)) (_2!1090 V!2985)) )
))
(declare-datatypes ((List!1492 0))(
  ( (Nil!1489) (Cons!1488 (h!2076 tuple2!2158) (t!5118 List!1492)) )
))
(declare-datatypes ((ListLongMap!1425 0))(
  ( (ListLongMap!1426 (toList!728 List!1492)) )
))
(declare-fun lt!35400 () ListLongMap!1425)

(declare-fun lt!35410 () ListLongMap!1425)

(assert (=> b!77301 (= res!40597 (= lt!35400 lt!35410))))

(declare-datatypes ((array!3943 0))(
  ( (array!3944 (arr!1880 (Array (_ BitVec 32) (_ BitVec 64))) (size!2121 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!908 0))(
  ( (ValueCellFull!908 (v!2585 V!2985)) (EmptyCell!908) )
))
(declare-datatypes ((array!3945 0))(
  ( (array!3946 (arr!1881 (Array (_ BitVec 32) ValueCell!908)) (size!2122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!724 0))(
  ( (LongMapFixedSize!725 (defaultEntry!2265 Int) (mask!6258 (_ BitVec 32)) (extraKeys!2116 (_ BitVec 32)) (zeroValue!2163 V!2985) (minValue!2163 V!2985) (_size!411 (_ BitVec 32)) (_keys!3925 array!3943) (_values!2248 array!3945) (_vacant!411 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!724)

(declare-fun map!1180 (LongMapFixedSize!724) ListLongMap!1425)

(assert (=> b!77301 (= lt!35410 (map!1180 newMap!16))))

(declare-datatypes ((Cell!532 0))(
  ( (Cell!533 (v!2586 LongMapFixedSize!724)) )
))
(declare-datatypes ((LongMap!532 0))(
  ( (LongMap!533 (underlying!277 Cell!532)) )
))
(declare-fun thiss!992 () LongMap!532)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!424 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!77301 (= lt!35400 (getCurrentListMap!424 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77302 () Bool)

(declare-fun res!40600 () Bool)

(assert (=> b!77302 (=> (not res!40600) (not e!50527))))

(declare-fun valid!319 (LongMapFixedSize!724) Bool)

(assert (=> b!77302 (= res!40600 (valid!319 newMap!16))))

(declare-fun b!77303 () Bool)

(declare-fun e!50531 () Bool)

(declare-fun e!50523 () Bool)

(assert (=> b!77303 (= e!50531 e!50523)))

(declare-fun b!77304 () Bool)

(declare-fun e!50528 () Bool)

(assert (=> b!77304 (= e!50528 tp_is_empty!2503)))

(declare-fun e!50526 () Bool)

(declare-fun e!50521 () Bool)

(declare-fun array_inv!1155 (array!3943) Bool)

(declare-fun array_inv!1156 (array!3945) Bool)

(assert (=> b!77305 (= e!50526 (and tp!8715 tp_is_empty!2503 (array_inv!1155 (_keys!3925 newMap!16)) (array_inv!1156 (_values!2248 newMap!16)) e!50521))))

(declare-fun res!40596 () Bool)

(assert (=> start!10146 (=> (not res!40596) (not e!50527))))

(declare-fun valid!320 (LongMap!532) Bool)

(assert (=> start!10146 (= res!40596 (valid!320 thiss!992))))

(assert (=> start!10146 e!50527))

(assert (=> start!10146 e!50531))

(assert (=> start!10146 true))

(assert (=> start!10146 e!50526))

(declare-fun b!77306 () Bool)

(declare-fun e!50520 () Bool)

(assert (=> b!77306 (= e!50530 e!50520)))

(declare-fun res!40602 () Bool)

(assert (=> b!77306 (=> (not res!40602) (not e!50520))))

(assert (=> b!77306 (= res!40602 (and (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35414 () V!2985)

(declare-fun get!1177 (ValueCell!908 V!2985) V!2985)

(declare-fun dynLambda!338 (Int (_ BitVec 64)) V!2985)

(assert (=> b!77306 (= lt!35414 (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) from!355) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77307 () Bool)

(declare-fun e!50529 () Bool)

(assert (=> b!77307 (= e!50529 tp_is_empty!2503)))

(declare-fun b!77308 () Bool)

(declare-datatypes ((Unit!2229 0))(
  ( (Unit!2230) )
))
(declare-fun e!50519 () Unit!2229)

(declare-fun Unit!2231 () Unit!2229)

(assert (=> b!77308 (= e!50519 Unit!2231)))

(declare-fun b!77309 () Bool)

(declare-fun mapRes!3276 () Bool)

(assert (=> b!77309 (= e!50521 (and e!50522 mapRes!3276))))

(declare-fun condMapEmpty!3275 () Bool)

(declare-fun mapDefault!3275 () ValueCell!908)

(assert (=> b!77309 (= condMapEmpty!3275 (= (arr!1881 (_values!2248 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3275)))))

(declare-fun mapNonEmpty!3275 () Bool)

(declare-fun tp!8716 () Bool)

(assert (=> mapNonEmpty!3275 (= mapRes!3275 (and tp!8716 e!50534))))

(declare-fun mapValue!3275 () ValueCell!908)

(declare-fun mapRest!3276 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapKey!3275 () (_ BitVec 32))

(assert (=> mapNonEmpty!3275 (= (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (store mapRest!3276 mapKey!3275 mapValue!3275))))

(declare-fun b!77310 () Bool)

(declare-fun Unit!2232 () Unit!2229)

(assert (=> b!77310 (= e!50519 Unit!2232)))

(declare-fun lt!35403 () Unit!2229)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!51 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) (_ BitVec 32) Int) Unit!2229)

(assert (=> b!77310 (= lt!35403 (lemmaListMapContainsThenArrayContainsFrom!51 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77310 (arrayContainsKey!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35404 () Unit!2229)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3943 (_ BitVec 32) (_ BitVec 32)) Unit!2229)

(assert (=> b!77310 (= lt!35404 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1493 0))(
  ( (Nil!1490) (Cons!1489 (h!2077 (_ BitVec 64)) (t!5119 List!1493)) )
))
(declare-fun arrayNoDuplicates!0 (array!3943 (_ BitVec 32) List!1493) Bool)

(assert (=> b!77310 (arrayNoDuplicates!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) from!355 Nil!1490)))

(declare-fun lt!35411 () Unit!2229)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3943 (_ BitVec 32) (_ BitVec 64) List!1493) Unit!2229)

(assert (=> b!77310 (= lt!35411 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (Cons!1489 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) Nil!1490)))))

(assert (=> b!77310 false))

(declare-fun mapIsEmpty!3276 () Bool)

(assert (=> mapIsEmpty!3276 mapRes!3276))

(declare-fun b!77311 () Bool)

(declare-fun e!50535 () Bool)

(assert (=> b!77311 (= e!50523 e!50535)))

(declare-fun b!77312 () Bool)

(declare-fun res!40598 () Bool)

(assert (=> b!77312 (=> (not res!40598) (not e!50527))))

(assert (=> b!77312 (= res!40598 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6258 newMap!16)) (_size!411 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77313 () Bool)

(declare-fun e!50532 () Bool)

(assert (=> b!77313 (= e!50532 (and e!50528 mapRes!3275))))

(declare-fun condMapEmpty!3276 () Bool)

(declare-fun mapDefault!3276 () ValueCell!908)

(assert (=> b!77313 (= condMapEmpty!3276 (= (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3276)))))

(declare-fun mapNonEmpty!3276 () Bool)

(declare-fun tp!8717 () Bool)

(assert (=> mapNonEmpty!3276 (= mapRes!3276 (and tp!8717 e!50529))))

(declare-fun mapRest!3275 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapValue!3276 () ValueCell!908)

(declare-fun mapKey!3276 () (_ BitVec 32))

(assert (=> mapNonEmpty!3276 (= (arr!1881 (_values!2248 newMap!16)) (store mapRest!3275 mapKey!3276 mapValue!3276))))

(declare-fun b!77314 () Bool)

(declare-fun e!50533 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77314 (= e!50533 (not (validMask!0 (mask!6258 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun lt!35401 () ListLongMap!1425)

(declare-fun lt!35415 () tuple2!2158)

(declare-fun lt!35399 () ListLongMap!1425)

(declare-fun lt!35413 () tuple2!2158)

(declare-fun +!99 (ListLongMap!1425 tuple2!2158) ListLongMap!1425)

(assert (=> b!77314 (= (+!99 lt!35401 lt!35415) (+!99 (+!99 lt!35399 lt!35415) lt!35413))))

(assert (=> b!77314 (= lt!35415 (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35405 () Unit!2229)

(declare-fun addCommutativeForDiffKeys!19 (ListLongMap!1425 (_ BitVec 64) V!2985 (_ BitVec 64) V!2985) Unit!2229)

(assert (=> b!77314 (= lt!35405 (addCommutativeForDiffKeys!19 lt!35399 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35402 () ListLongMap!1425)

(assert (=> b!77314 (= lt!35402 lt!35401)))

(assert (=> b!77314 (= lt!35401 (+!99 lt!35399 lt!35413))))

(declare-fun lt!35406 () ListLongMap!1425)

(declare-fun lt!35409 () tuple2!2158)

(assert (=> b!77314 (= lt!35402 (+!99 lt!35406 lt!35409))))

(declare-fun lt!35412 () ListLongMap!1425)

(assert (=> b!77314 (= lt!35399 (+!99 lt!35412 lt!35409))))

(assert (=> b!77314 (= lt!35409 (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(assert (=> b!77314 (= lt!35406 (+!99 lt!35412 lt!35413))))

(assert (=> b!77314 (= lt!35413 (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414))))

(declare-fun lt!35407 () Unit!2229)

(assert (=> b!77314 (= lt!35407 (addCommutativeForDiffKeys!19 lt!35412 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!64 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!77314 (= lt!35412 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77315 () Bool)

(assert (=> b!77315 (= e!50520 e!50533)))

(declare-fun res!40599 () Bool)

(assert (=> b!77315 (=> (not res!40599) (not e!50533))))

(declare-datatypes ((tuple2!2160 0))(
  ( (tuple2!2161 (_1!1091 Bool) (_2!1091 LongMapFixedSize!724)) )
))
(declare-fun lt!35398 () tuple2!2160)

(assert (=> b!77315 (= res!40599 (and (_1!1091 lt!35398) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35408 () Unit!2229)

(assert (=> b!77315 (= lt!35408 e!50519)))

(declare-fun c!11801 () Bool)

(declare-fun contains!733 (ListLongMap!1425 (_ BitVec 64)) Bool)

(assert (=> b!77315 (= c!11801 (contains!733 lt!35410 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun update!117 (LongMapFixedSize!724 (_ BitVec 64) V!2985) tuple2!2160)

(assert (=> b!77315 (= lt!35398 (update!117 newMap!16 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414))))

(declare-fun b!77316 () Bool)

(declare-fun res!40601 () Bool)

(assert (=> b!77316 (=> (not res!40601) (not e!50527))))

(assert (=> b!77316 (= res!40601 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992)))))))))

(assert (=> b!77317 (= e!50535 (and tp!8718 tp_is_empty!2503 (array_inv!1155 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (array_inv!1156 (_values!2248 (v!2586 (underlying!277 thiss!992)))) e!50532))))

(assert (= (and start!10146 res!40596) b!77316))

(assert (= (and b!77316 res!40601) b!77302))

(assert (= (and b!77302 res!40600) b!77312))

(assert (= (and b!77312 res!40598) b!77301))

(assert (= (and b!77301 res!40597) b!77306))

(assert (= (and b!77306 res!40602) b!77315))

(assert (= (and b!77315 c!11801) b!77310))

(assert (= (and b!77315 (not c!11801)) b!77308))

(assert (= (and b!77315 res!40599) b!77314))

(assert (= (and b!77313 condMapEmpty!3276) mapIsEmpty!3275))

(assert (= (and b!77313 (not condMapEmpty!3276)) mapNonEmpty!3275))

(get-info :version)

(assert (= (and mapNonEmpty!3275 ((_ is ValueCellFull!908) mapValue!3275)) b!77300))

(assert (= (and b!77313 ((_ is ValueCellFull!908) mapDefault!3276)) b!77304))

(assert (= b!77317 b!77313))

(assert (= b!77311 b!77317))

(assert (= b!77303 b!77311))

(assert (= start!10146 b!77303))

(assert (= (and b!77309 condMapEmpty!3275) mapIsEmpty!3276))

(assert (= (and b!77309 (not condMapEmpty!3275)) mapNonEmpty!3276))

(assert (= (and mapNonEmpty!3276 ((_ is ValueCellFull!908) mapValue!3276)) b!77307))

(assert (= (and b!77309 ((_ is ValueCellFull!908) mapDefault!3275)) b!77299))

(assert (= b!77305 b!77309))

(assert (= start!10146 b!77305))

(declare-fun b_lambda!3473 () Bool)

(assert (=> (not b_lambda!3473) (not b!77306)))

(declare-fun t!5115 () Bool)

(declare-fun tb!1597 () Bool)

(assert (=> (and b!77317 (= (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))) t!5115) tb!1597))

(declare-fun result!2781 () Bool)

(assert (=> tb!1597 (= result!2781 tp_is_empty!2503)))

(assert (=> b!77306 t!5115))

(declare-fun b_and!4753 () Bool)

(assert (= b_and!4749 (and (=> t!5115 result!2781) b_and!4753)))

(declare-fun tb!1599 () Bool)

(declare-fun t!5117 () Bool)

(assert (=> (and b!77305 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))) t!5117) tb!1599))

(declare-fun result!2785 () Bool)

(assert (= result!2785 result!2781))

(assert (=> b!77306 t!5117))

(declare-fun b_and!4755 () Bool)

(assert (= b_and!4751 (and (=> t!5117 result!2785) b_and!4755)))

(declare-fun m!77411 () Bool)

(assert (=> b!77315 m!77411))

(assert (=> b!77315 m!77411))

(declare-fun m!77413 () Bool)

(assert (=> b!77315 m!77413))

(assert (=> b!77315 m!77411))

(declare-fun m!77415 () Bool)

(assert (=> b!77315 m!77415))

(assert (=> b!77306 m!77411))

(declare-fun m!77417 () Bool)

(assert (=> b!77306 m!77417))

(declare-fun m!77419 () Bool)

(assert (=> b!77306 m!77419))

(assert (=> b!77306 m!77417))

(assert (=> b!77306 m!77419))

(declare-fun m!77421 () Bool)

(assert (=> b!77306 m!77421))

(declare-fun m!77423 () Bool)

(assert (=> mapNonEmpty!3275 m!77423))

(declare-fun m!77425 () Bool)

(assert (=> b!77305 m!77425))

(declare-fun m!77427 () Bool)

(assert (=> b!77305 m!77427))

(declare-fun m!77429 () Bool)

(assert (=> b!77314 m!77429))

(declare-fun m!77431 () Bool)

(assert (=> b!77314 m!77431))

(declare-fun m!77433 () Bool)

(assert (=> b!77314 m!77433))

(declare-fun m!77435 () Bool)

(assert (=> b!77314 m!77435))

(assert (=> b!77314 m!77411))

(declare-fun m!77437 () Bool)

(assert (=> b!77314 m!77437))

(declare-fun m!77439 () Bool)

(assert (=> b!77314 m!77439))

(assert (=> b!77314 m!77411))

(declare-fun m!77441 () Bool)

(assert (=> b!77314 m!77441))

(declare-fun m!77443 () Bool)

(assert (=> b!77314 m!77443))

(declare-fun m!77445 () Bool)

(assert (=> b!77314 m!77445))

(assert (=> b!77314 m!77411))

(declare-fun m!77447 () Bool)

(assert (=> b!77314 m!77447))

(assert (=> b!77314 m!77437))

(declare-fun m!77449 () Bool)

(assert (=> b!77314 m!77449))

(declare-fun m!77451 () Bool)

(assert (=> b!77301 m!77451))

(declare-fun m!77453 () Bool)

(assert (=> b!77301 m!77453))

(declare-fun m!77455 () Bool)

(assert (=> mapNonEmpty!3276 m!77455))

(declare-fun m!77457 () Bool)

(assert (=> b!77302 m!77457))

(declare-fun m!77459 () Bool)

(assert (=> b!77317 m!77459))

(declare-fun m!77461 () Bool)

(assert (=> b!77317 m!77461))

(declare-fun m!77463 () Bool)

(assert (=> start!10146 m!77463))

(declare-fun m!77465 () Bool)

(assert (=> b!77310 m!77465))

(declare-fun m!77467 () Bool)

(assert (=> b!77310 m!77467))

(assert (=> b!77310 m!77411))

(declare-fun m!77469 () Bool)

(assert (=> b!77310 m!77469))

(assert (=> b!77310 m!77411))

(assert (=> b!77310 m!77411))

(declare-fun m!77471 () Bool)

(assert (=> b!77310 m!77471))

(assert (=> b!77310 m!77411))

(declare-fun m!77473 () Bool)

(assert (=> b!77310 m!77473))

(check-sat (not b_lambda!3473) (not b_next!2175) (not mapNonEmpty!3276) (not b!77305) (not start!10146) b_and!4755 (not mapNonEmpty!3275) (not b!77315) (not b!77301) (not b!77317) (not b!77302) (not b!77306) tp_is_empty!2503 b_and!4753 (not b_next!2173) (not b!77314) (not b!77310))
(check-sat b_and!4753 b_and!4755 (not b_next!2173) (not b_next!2175))
(get-model)

(declare-fun b_lambda!3479 () Bool)

(assert (= b_lambda!3473 (or (and b!77317 b_free!2173) (and b!77305 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))))) b_lambda!3479)))

(check-sat (not b_lambda!3479) (not b_next!2175) (not mapNonEmpty!3276) (not b!77305) (not start!10146) b_and!4755 (not mapNonEmpty!3275) (not b!77315) (not b!77301) (not b!77317) (not b!77302) (not b!77306) tp_is_empty!2503 b_and!4753 (not b_next!2173) (not b!77314) (not b!77310))
(check-sat b_and!4753 b_and!4755 (not b_next!2173) (not b_next!2175))
(get-model)

(declare-fun d!18401 () Bool)

(assert (=> d!18401 (= (array_inv!1155 (_keys!3925 newMap!16)) (bvsge (size!2121 (_keys!3925 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77305 d!18401))

(declare-fun d!18403 () Bool)

(assert (=> d!18403 (= (array_inv!1156 (_values!2248 newMap!16)) (bvsge (size!2122 (_values!2248 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77305 d!18403))

(declare-fun d!18405 () Bool)

(declare-fun c!11810 () Bool)

(assert (=> d!18405 (= c!11810 ((_ is ValueCellFull!908) (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun e!50640 () V!2985)

(assert (=> d!18405 (= (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) from!355) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!50640)))

(declare-fun b!77442 () Bool)

(declare-fun get!1179 (ValueCell!908 V!2985) V!2985)

(assert (=> b!77442 (= e!50640 (get!1179 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) from!355) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77443 () Bool)

(declare-fun get!1180 (ValueCell!908 V!2985) V!2985)

(assert (=> b!77443 (= e!50640 (get!1180 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) from!355) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18405 c!11810) b!77442))

(assert (= (and d!18405 (not c!11810)) b!77443))

(assert (=> b!77442 m!77417))

(assert (=> b!77442 m!77419))

(declare-fun m!77603 () Bool)

(assert (=> b!77442 m!77603))

(assert (=> b!77443 m!77417))

(assert (=> b!77443 m!77419))

(declare-fun m!77605 () Bool)

(assert (=> b!77443 m!77605))

(assert (=> b!77306 d!18405))

(declare-fun d!18407 () Bool)

(assert (=> d!18407 (not (arrayContainsKey!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35526 () Unit!2229)

(declare-fun choose!68 (array!3943 (_ BitVec 32) (_ BitVec 64) List!1493) Unit!2229)

(assert (=> d!18407 (= lt!35526 (choose!68 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (Cons!1489 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) Nil!1490)))))

(assert (=> d!18407 (bvslt (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18407 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (Cons!1489 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) Nil!1490)) lt!35526)))

(declare-fun bs!3304 () Bool)

(assert (= bs!3304 d!18407))

(assert (=> bs!3304 m!77411))

(assert (=> bs!3304 m!77471))

(assert (=> bs!3304 m!77411))

(declare-fun m!77607 () Bool)

(assert (=> bs!3304 m!77607))

(assert (=> b!77310 d!18407))

(declare-fun d!18409 () Bool)

(assert (=> d!18409 (arrayNoDuplicates!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) from!355 Nil!1490)))

(declare-fun lt!35529 () Unit!2229)

(declare-fun choose!39 (array!3943 (_ BitVec 32) (_ BitVec 32)) Unit!2229)

(assert (=> d!18409 (= lt!35529 (choose!39 (_keys!3925 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18409 (bvslt (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18409 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000000 from!355) lt!35529)))

(declare-fun bs!3305 () Bool)

(assert (= bs!3305 d!18409))

(assert (=> bs!3305 m!77467))

(declare-fun m!77609 () Bool)

(assert (=> bs!3305 m!77609))

(assert (=> b!77310 d!18409))

(declare-fun d!18411 () Bool)

(declare-fun res!40649 () Bool)

(declare-fun e!50645 () Bool)

(assert (=> d!18411 (=> res!40649 e!50645)))

(assert (=> d!18411 (= res!40649 (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(assert (=> d!18411 (= (arrayContainsKey!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!50645)))

(declare-fun b!77448 () Bool)

(declare-fun e!50646 () Bool)

(assert (=> b!77448 (= e!50645 e!50646)))

(declare-fun res!40650 () Bool)

(assert (=> b!77448 (=> (not res!40650) (not e!50646))))

(assert (=> b!77448 (= res!40650 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun b!77449 () Bool)

(assert (=> b!77449 (= e!50646 (arrayContainsKey!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18411 (not res!40649)) b!77448))

(assert (= (and b!77448 res!40650) b!77449))

(declare-fun m!77611 () Bool)

(assert (=> d!18411 m!77611))

(assert (=> b!77449 m!77411))

(declare-fun m!77613 () Bool)

(assert (=> b!77449 m!77613))

(assert (=> b!77310 d!18411))

(declare-fun d!18413 () Bool)

(declare-fun e!50649 () Bool)

(assert (=> d!18413 e!50649))

(declare-fun c!11813 () Bool)

(assert (=> d!18413 (= c!11813 (and (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35532 () Unit!2229)

(declare-fun choose!458 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) (_ BitVec 32) Int) Unit!2229)

(assert (=> d!18413 (= lt!35532 (choose!458 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(assert (=> d!18413 (validMask!0 (mask!6258 (v!2586 (underlying!277 thiss!992))))))

(assert (=> d!18413 (= (lemmaListMapContainsThenArrayContainsFrom!51 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))) lt!35532)))

(declare-fun b!77454 () Bool)

(assert (=> b!77454 (= e!50649 (arrayContainsKey!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!77455 () Bool)

(assert (=> b!77455 (= e!50649 (ite (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18413 c!11813) b!77454))

(assert (= (and d!18413 (not c!11813)) b!77455))

(assert (=> d!18413 m!77411))

(declare-fun m!77615 () Bool)

(assert (=> d!18413 m!77615))

(assert (=> d!18413 m!77431))

(assert (=> b!77454 m!77411))

(assert (=> b!77454 m!77471))

(assert (=> b!77310 d!18413))

(declare-fun b!77466 () Bool)

(declare-fun e!50660 () Bool)

(declare-fun call!6969 () Bool)

(assert (=> b!77466 (= e!50660 call!6969)))

(declare-fun b!77467 () Bool)

(declare-fun e!50661 () Bool)

(declare-fun e!50659 () Bool)

(assert (=> b!77467 (= e!50661 e!50659)))

(declare-fun res!40658 () Bool)

(assert (=> b!77467 (=> (not res!40658) (not e!50659))))

(declare-fun e!50658 () Bool)

(assert (=> b!77467 (= res!40658 (not e!50658))))

(declare-fun res!40657 () Bool)

(assert (=> b!77467 (=> (not res!40657) (not e!50658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!77467 (= res!40657 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun bm!6966 () Bool)

(declare-fun c!11816 () Bool)

(assert (=> bm!6966 (= call!6969 (arrayNoDuplicates!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11816 (Cons!1489 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) Nil!1490) Nil!1490)))))

(declare-fun b!77468 () Bool)

(assert (=> b!77468 (= e!50659 e!50660)))

(assert (=> b!77468 (= c!11816 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun b!77469 () Bool)

(declare-fun contains!734 (List!1493 (_ BitVec 64)) Bool)

(assert (=> b!77469 (= e!50658 (contains!734 Nil!1490 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun b!77470 () Bool)

(assert (=> b!77470 (= e!50660 call!6969)))

(declare-fun d!18415 () Bool)

(declare-fun res!40659 () Bool)

(assert (=> d!18415 (=> res!40659 e!50661)))

(assert (=> d!18415 (= res!40659 (bvsge from!355 (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(assert (=> d!18415 (= (arrayNoDuplicates!0 (_keys!3925 (v!2586 (underlying!277 thiss!992))) from!355 Nil!1490) e!50661)))

(assert (= (and d!18415 (not res!40659)) b!77467))

(assert (= (and b!77467 res!40657) b!77469))

(assert (= (and b!77467 res!40658) b!77468))

(assert (= (and b!77468 c!11816) b!77466))

(assert (= (and b!77468 (not c!11816)) b!77470))

(assert (= (or b!77466 b!77470) bm!6966))

(assert (=> b!77467 m!77411))

(assert (=> b!77467 m!77411))

(declare-fun m!77617 () Bool)

(assert (=> b!77467 m!77617))

(assert (=> bm!6966 m!77411))

(declare-fun m!77619 () Bool)

(assert (=> bm!6966 m!77619))

(assert (=> b!77468 m!77411))

(assert (=> b!77468 m!77411))

(assert (=> b!77468 m!77617))

(assert (=> b!77469 m!77411))

(assert (=> b!77469 m!77411))

(declare-fun m!77621 () Bool)

(assert (=> b!77469 m!77621))

(assert (=> b!77310 d!18415))

(declare-fun d!18417 () Bool)

(assert (=> d!18417 (= (array_inv!1155 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvsge (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77317 d!18417))

(declare-fun d!18419 () Bool)

(assert (=> d!18419 (= (array_inv!1156 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (bvsge (size!2122 (_values!2248 (v!2586 (underlying!277 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77317 d!18419))

(declare-fun d!18421 () Bool)

(assert (=> d!18421 (= (valid!320 thiss!992) (valid!319 (v!2586 (underlying!277 thiss!992))))))

(declare-fun bs!3306 () Bool)

(assert (= bs!3306 d!18421))

(declare-fun m!77623 () Bool)

(assert (=> bs!3306 m!77623))

(assert (=> start!10146 d!18421))

(declare-fun d!18423 () Bool)

(assert (=> d!18423 (= (map!1180 newMap!16) (getCurrentListMap!424 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun bs!3307 () Bool)

(assert (= bs!3307 d!18423))

(declare-fun m!77625 () Bool)

(assert (=> bs!3307 m!77625))

(assert (=> b!77301 d!18423))

(declare-fun d!18425 () Bool)

(declare-fun e!50693 () Bool)

(assert (=> d!18425 e!50693))

(declare-fun res!40682 () Bool)

(assert (=> d!18425 (=> (not res!40682) (not e!50693))))

(assert (=> d!18425 (= res!40682 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))))

(declare-fun lt!35581 () ListLongMap!1425)

(declare-fun lt!35579 () ListLongMap!1425)

(assert (=> d!18425 (= lt!35581 lt!35579)))

(declare-fun lt!35592 () Unit!2229)

(declare-fun e!50697 () Unit!2229)

(assert (=> d!18425 (= lt!35592 e!50697)))

(declare-fun c!11831 () Bool)

(declare-fun e!50695 () Bool)

(assert (=> d!18425 (= c!11831 e!50695)))

(declare-fun res!40685 () Bool)

(assert (=> d!18425 (=> (not res!40685) (not e!50695))))

(assert (=> d!18425 (= res!40685 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun e!50696 () ListLongMap!1425)

(assert (=> d!18425 (= lt!35579 e!50696)))

(declare-fun c!11830 () Bool)

(assert (=> d!18425 (= c!11830 (and (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18425 (validMask!0 (mask!6258 (v!2586 (underlying!277 thiss!992))))))

(assert (=> d!18425 (= (getCurrentListMap!424 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))) lt!35581)))

(declare-fun b!77513 () Bool)

(declare-fun lt!35584 () Unit!2229)

(assert (=> b!77513 (= e!50697 lt!35584)))

(declare-fun lt!35589 () ListLongMap!1425)

(assert (=> b!77513 (= lt!35589 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35587 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35598 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35598 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35591 () Unit!2229)

(declare-fun addStillContains!54 (ListLongMap!1425 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2229)

(assert (=> b!77513 (= lt!35591 (addStillContains!54 lt!35589 lt!35587 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) lt!35598))))

(assert (=> b!77513 (contains!733 (+!99 lt!35589 (tuple2!2159 lt!35587 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))))) lt!35598)))

(declare-fun lt!35582 () Unit!2229)

(assert (=> b!77513 (= lt!35582 lt!35591)))

(declare-fun lt!35594 () ListLongMap!1425)

(assert (=> b!77513 (= lt!35594 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35588 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35597 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35597 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35585 () Unit!2229)

(declare-fun addApplyDifferent!54 (ListLongMap!1425 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2229)

(assert (=> b!77513 (= lt!35585 (addApplyDifferent!54 lt!35594 lt!35588 (minValue!2163 (v!2586 (underlying!277 thiss!992))) lt!35597))))

(declare-fun apply!78 (ListLongMap!1425 (_ BitVec 64)) V!2985)

(assert (=> b!77513 (= (apply!78 (+!99 lt!35594 (tuple2!2159 lt!35588 (minValue!2163 (v!2586 (underlying!277 thiss!992))))) lt!35597) (apply!78 lt!35594 lt!35597))))

(declare-fun lt!35586 () Unit!2229)

(assert (=> b!77513 (= lt!35586 lt!35585)))

(declare-fun lt!35577 () ListLongMap!1425)

(assert (=> b!77513 (= lt!35577 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35590 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35580 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35580 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35583 () Unit!2229)

(assert (=> b!77513 (= lt!35583 (addApplyDifferent!54 lt!35577 lt!35590 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) lt!35580))))

(assert (=> b!77513 (= (apply!78 (+!99 lt!35577 (tuple2!2159 lt!35590 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))))) lt!35580) (apply!78 lt!35577 lt!35580))))

(declare-fun lt!35578 () Unit!2229)

(assert (=> b!77513 (= lt!35578 lt!35583)))

(declare-fun lt!35595 () ListLongMap!1425)

(assert (=> b!77513 (= lt!35595 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun lt!35596 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35596 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35593 () (_ BitVec 64))

(assert (=> b!77513 (= lt!35593 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!77513 (= lt!35584 (addApplyDifferent!54 lt!35595 lt!35596 (minValue!2163 (v!2586 (underlying!277 thiss!992))) lt!35593))))

(assert (=> b!77513 (= (apply!78 (+!99 lt!35595 (tuple2!2159 lt!35596 (minValue!2163 (v!2586 (underlying!277 thiss!992))))) lt!35593) (apply!78 lt!35595 lt!35593))))

(declare-fun b!77514 () Bool)

(assert (=> b!77514 (= e!50695 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77515 () Bool)

(declare-fun e!50700 () Bool)

(declare-fun e!50699 () Bool)

(assert (=> b!77515 (= e!50700 e!50699)))

(declare-fun res!40680 () Bool)

(assert (=> b!77515 (=> (not res!40680) (not e!50699))))

(assert (=> b!77515 (= res!40680 (contains!733 lt!35581 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77515 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun bm!6981 () Bool)

(declare-fun call!6988 () ListLongMap!1425)

(declare-fun call!6989 () ListLongMap!1425)

(assert (=> bm!6981 (= call!6988 call!6989)))

(declare-fun bm!6982 () Bool)

(declare-fun call!6986 () ListLongMap!1425)

(assert (=> bm!6982 (= call!6989 call!6986)))

(declare-fun b!77516 () Bool)

(declare-fun e!50698 () Bool)

(declare-fun e!50691 () Bool)

(assert (=> b!77516 (= e!50698 e!50691)))

(declare-fun res!40679 () Bool)

(declare-fun call!6987 () Bool)

(assert (=> b!77516 (= res!40679 call!6987)))

(assert (=> b!77516 (=> (not res!40679) (not e!50691))))

(declare-fun b!77517 () Bool)

(declare-fun c!11832 () Bool)

(assert (=> b!77517 (= c!11832 (and (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50692 () ListLongMap!1425)

(declare-fun e!50690 () ListLongMap!1425)

(assert (=> b!77517 (= e!50692 e!50690)))

(declare-fun b!77518 () Bool)

(declare-fun Unit!2233 () Unit!2229)

(assert (=> b!77518 (= e!50697 Unit!2233)))

(declare-fun bm!6983 () Bool)

(assert (=> bm!6983 (= call!6986 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77519 () Bool)

(declare-fun call!6984 () ListLongMap!1425)

(assert (=> b!77519 (= e!50696 (+!99 call!6984 (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun b!77520 () Bool)

(declare-fun call!6985 () ListLongMap!1425)

(assert (=> b!77520 (= e!50692 call!6985)))

(declare-fun b!77521 () Bool)

(assert (=> b!77521 (= e!50699 (= (apply!78 lt!35581 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!77521 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2122 (_values!2248 (v!2586 (underlying!277 thiss!992))))))))

(assert (=> b!77521 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun b!77522 () Bool)

(assert (=> b!77522 (= e!50690 call!6988)))

(declare-fun b!77523 () Bool)

(declare-fun e!50688 () Bool)

(assert (=> b!77523 (= e!50688 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6984 () Bool)

(assert (=> bm!6984 (= call!6985 call!6984)))

(declare-fun b!77524 () Bool)

(declare-fun e!50689 () Bool)

(assert (=> b!77524 (= e!50693 e!50689)))

(declare-fun c!11829 () Bool)

(assert (=> b!77524 (= c!11829 (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!77525 () Bool)

(assert (=> b!77525 (= e!50698 (not call!6987))))

(declare-fun b!77526 () Bool)

(declare-fun e!50694 () Bool)

(assert (=> b!77526 (= e!50694 (= (apply!78 lt!35581 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun bm!6985 () Bool)

(assert (=> bm!6985 (= call!6987 (contains!733 lt!35581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77527 () Bool)

(declare-fun call!6990 () Bool)

(assert (=> b!77527 (= e!50689 (not call!6990))))

(declare-fun b!77528 () Bool)

(assert (=> b!77528 (= e!50690 call!6985)))

(declare-fun b!77529 () Bool)

(assert (=> b!77529 (= e!50689 e!50694)))

(declare-fun res!40681 () Bool)

(assert (=> b!77529 (= res!40681 call!6990)))

(assert (=> b!77529 (=> (not res!40681) (not e!50694))))

(declare-fun bm!6986 () Bool)

(declare-fun c!11833 () Bool)

(assert (=> bm!6986 (= call!6984 (+!99 (ite c!11830 call!6986 (ite c!11833 call!6989 call!6988)) (ite (or c!11830 c!11833) (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))) (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992)))))))))

(declare-fun bm!6987 () Bool)

(assert (=> bm!6987 (= call!6990 (contains!733 lt!35581 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77530 () Bool)

(declare-fun res!40683 () Bool)

(assert (=> b!77530 (=> (not res!40683) (not e!50693))))

(assert (=> b!77530 (= res!40683 e!50700)))

(declare-fun res!40684 () Bool)

(assert (=> b!77530 (=> res!40684 e!50700)))

(assert (=> b!77530 (= res!40684 (not e!50688))))

(declare-fun res!40686 () Bool)

(assert (=> b!77530 (=> (not res!40686) (not e!50688))))

(assert (=> b!77530 (= res!40686 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun b!77531 () Bool)

(declare-fun res!40678 () Bool)

(assert (=> b!77531 (=> (not res!40678) (not e!50693))))

(assert (=> b!77531 (= res!40678 e!50698)))

(declare-fun c!11834 () Bool)

(assert (=> b!77531 (= c!11834 (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!77532 () Bool)

(assert (=> b!77532 (= e!50691 (= (apply!78 lt!35581 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77533 () Bool)

(assert (=> b!77533 (= e!50696 e!50692)))

(assert (=> b!77533 (= c!11833 (and (not (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!18425 c!11830) b!77519))

(assert (= (and d!18425 (not c!11830)) b!77533))

(assert (= (and b!77533 c!11833) b!77520))

(assert (= (and b!77533 (not c!11833)) b!77517))

(assert (= (and b!77517 c!11832) b!77528))

(assert (= (and b!77517 (not c!11832)) b!77522))

(assert (= (or b!77528 b!77522) bm!6981))

(assert (= (or b!77520 bm!6981) bm!6982))

(assert (= (or b!77520 b!77528) bm!6984))

(assert (= (or b!77519 bm!6982) bm!6983))

(assert (= (or b!77519 bm!6984) bm!6986))

(assert (= (and d!18425 res!40685) b!77514))

(assert (= (and d!18425 c!11831) b!77513))

(assert (= (and d!18425 (not c!11831)) b!77518))

(assert (= (and d!18425 res!40682) b!77530))

(assert (= (and b!77530 res!40686) b!77523))

(assert (= (and b!77530 (not res!40684)) b!77515))

(assert (= (and b!77515 res!40680) b!77521))

(assert (= (and b!77530 res!40683) b!77531))

(assert (= (and b!77531 c!11834) b!77516))

(assert (= (and b!77531 (not c!11834)) b!77525))

(assert (= (and b!77516 res!40679) b!77532))

(assert (= (or b!77516 b!77525) bm!6985))

(assert (= (and b!77531 res!40678) b!77524))

(assert (= (and b!77524 c!11829) b!77529))

(assert (= (and b!77524 (not c!11829)) b!77527))

(assert (= (and b!77529 res!40681) b!77526))

(assert (= (or b!77529 b!77527) bm!6987))

(declare-fun b_lambda!3481 () Bool)

(assert (=> (not b_lambda!3481) (not b!77521)))

(assert (=> b!77521 t!5115))

(declare-fun b_and!4773 () Bool)

(assert (= b_and!4753 (and (=> t!5115 result!2781) b_and!4773)))

(assert (=> b!77521 t!5117))

(declare-fun b_and!4775 () Bool)

(assert (= b_and!4755 (and (=> t!5117 result!2785) b_and!4775)))

(assert (=> bm!6983 m!77445))

(assert (=> b!77515 m!77611))

(assert (=> b!77515 m!77611))

(declare-fun m!77627 () Bool)

(assert (=> b!77515 m!77627))

(assert (=> d!18425 m!77431))

(declare-fun m!77629 () Bool)

(assert (=> b!77532 m!77629))

(assert (=> b!77523 m!77611))

(assert (=> b!77523 m!77611))

(declare-fun m!77631 () Bool)

(assert (=> b!77523 m!77631))

(declare-fun m!77633 () Bool)

(assert (=> b!77519 m!77633))

(declare-fun m!77635 () Bool)

(assert (=> b!77513 m!77635))

(declare-fun m!77637 () Bool)

(assert (=> b!77513 m!77637))

(declare-fun m!77639 () Bool)

(assert (=> b!77513 m!77639))

(declare-fun m!77641 () Bool)

(assert (=> b!77513 m!77641))

(declare-fun m!77643 () Bool)

(assert (=> b!77513 m!77643))

(assert (=> b!77513 m!77445))

(declare-fun m!77645 () Bool)

(assert (=> b!77513 m!77645))

(assert (=> b!77513 m!77611))

(declare-fun m!77647 () Bool)

(assert (=> b!77513 m!77647))

(declare-fun m!77649 () Bool)

(assert (=> b!77513 m!77649))

(assert (=> b!77513 m!77645))

(declare-fun m!77651 () Bool)

(assert (=> b!77513 m!77651))

(declare-fun m!77653 () Bool)

(assert (=> b!77513 m!77653))

(declare-fun m!77655 () Bool)

(assert (=> b!77513 m!77655))

(assert (=> b!77513 m!77647))

(assert (=> b!77513 m!77635))

(declare-fun m!77657 () Bool)

(assert (=> b!77513 m!77657))

(declare-fun m!77659 () Bool)

(assert (=> b!77513 m!77659))

(assert (=> b!77513 m!77641))

(declare-fun m!77661 () Bool)

(assert (=> b!77513 m!77661))

(declare-fun m!77663 () Bool)

(assert (=> b!77513 m!77663))

(declare-fun m!77665 () Bool)

(assert (=> b!77526 m!77665))

(declare-fun m!77667 () Bool)

(assert (=> b!77521 m!77667))

(assert (=> b!77521 m!77611))

(declare-fun m!77669 () Bool)

(assert (=> b!77521 m!77669))

(assert (=> b!77521 m!77611))

(assert (=> b!77521 m!77667))

(assert (=> b!77521 m!77419))

(declare-fun m!77671 () Bool)

(assert (=> b!77521 m!77671))

(assert (=> b!77521 m!77419))

(assert (=> b!77514 m!77611))

(assert (=> b!77514 m!77611))

(assert (=> b!77514 m!77631))

(declare-fun m!77673 () Bool)

(assert (=> bm!6987 m!77673))

(declare-fun m!77675 () Bool)

(assert (=> bm!6986 m!77675))

(declare-fun m!77677 () Bool)

(assert (=> bm!6985 m!77677))

(assert (=> b!77301 d!18425))

(declare-fun d!18427 () Bool)

(assert (=> d!18427 (= (+!99 (+!99 lt!35412 (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414)) (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))))) (+!99 (+!99 lt!35412 (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992))))) (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414)))))

(declare-fun lt!35601 () Unit!2229)

(declare-fun choose!459 (ListLongMap!1425 (_ BitVec 64) V!2985 (_ BitVec 64) V!2985) Unit!2229)

(assert (=> d!18427 (= lt!35601 (choose!459 lt!35412 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(assert (=> d!18427 (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18427 (= (addCommutativeForDiffKeys!19 lt!35412 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2586 (underlying!277 thiss!992)))) lt!35601)))

(declare-fun bs!3308 () Bool)

(assert (= bs!3308 d!18427))

(declare-fun m!77679 () Bool)

(assert (=> bs!3308 m!77679))

(assert (=> bs!3308 m!77411))

(declare-fun m!77681 () Bool)

(assert (=> bs!3308 m!77681))

(declare-fun m!77683 () Bool)

(assert (=> bs!3308 m!77683))

(declare-fun m!77685 () Bool)

(assert (=> bs!3308 m!77685))

(assert (=> bs!3308 m!77683))

(assert (=> bs!3308 m!77679))

(declare-fun m!77687 () Bool)

(assert (=> bs!3308 m!77687))

(assert (=> b!77314 d!18427))

(declare-fun d!18429 () Bool)

(declare-fun e!50703 () Bool)

(assert (=> d!18429 e!50703))

(declare-fun res!40691 () Bool)

(assert (=> d!18429 (=> (not res!40691) (not e!50703))))

(declare-fun lt!35610 () ListLongMap!1425)

(assert (=> d!18429 (= res!40691 (contains!733 lt!35610 (_1!1090 lt!35413)))))

(declare-fun lt!35613 () List!1492)

(assert (=> d!18429 (= lt!35610 (ListLongMap!1426 lt!35613))))

(declare-fun lt!35611 () Unit!2229)

(declare-fun lt!35612 () Unit!2229)

(assert (=> d!18429 (= lt!35611 lt!35612)))

(declare-datatypes ((Option!143 0))(
  ( (Some!142 (v!2592 V!2985)) (None!141) )
))
(declare-fun getValueByKey!137 (List!1492 (_ BitVec 64)) Option!143)

(assert (=> d!18429 (= (getValueByKey!137 lt!35613 (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413)))))

(declare-fun lemmaContainsTupThenGetReturnValue!54 (List!1492 (_ BitVec 64) V!2985) Unit!2229)

(assert (=> d!18429 (= lt!35612 (lemmaContainsTupThenGetReturnValue!54 lt!35613 (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(declare-fun insertStrictlySorted!57 (List!1492 (_ BitVec 64) V!2985) List!1492)

(assert (=> d!18429 (= lt!35613 (insertStrictlySorted!57 (toList!728 (+!99 lt!35399 lt!35415)) (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(assert (=> d!18429 (= (+!99 (+!99 lt!35399 lt!35415) lt!35413) lt!35610)))

(declare-fun b!77538 () Bool)

(declare-fun res!40692 () Bool)

(assert (=> b!77538 (=> (not res!40692) (not e!50703))))

(assert (=> b!77538 (= res!40692 (= (getValueByKey!137 (toList!728 lt!35610) (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413))))))

(declare-fun b!77539 () Bool)

(declare-fun contains!735 (List!1492 tuple2!2158) Bool)

(assert (=> b!77539 (= e!50703 (contains!735 (toList!728 lt!35610) lt!35413))))

(assert (= (and d!18429 res!40691) b!77538))

(assert (= (and b!77538 res!40692) b!77539))

(declare-fun m!77689 () Bool)

(assert (=> d!18429 m!77689))

(declare-fun m!77691 () Bool)

(assert (=> d!18429 m!77691))

(declare-fun m!77693 () Bool)

(assert (=> d!18429 m!77693))

(declare-fun m!77695 () Bool)

(assert (=> d!18429 m!77695))

(declare-fun m!77697 () Bool)

(assert (=> b!77538 m!77697))

(declare-fun m!77699 () Bool)

(assert (=> b!77539 m!77699))

(assert (=> b!77314 d!18429))

(declare-fun b!77564 () Bool)

(declare-fun e!50719 () Bool)

(declare-fun e!50724 () Bool)

(assert (=> b!77564 (= e!50719 e!50724)))

(declare-fun c!11843 () Bool)

(assert (=> b!77564 (= c!11843 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun d!18431 () Bool)

(declare-fun e!50722 () Bool)

(assert (=> d!18431 e!50722))

(declare-fun res!40703 () Bool)

(assert (=> d!18431 (=> (not res!40703) (not e!50722))))

(declare-fun lt!35631 () ListLongMap!1425)

(assert (=> d!18431 (= res!40703 (not (contains!733 lt!35631 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!50723 () ListLongMap!1425)

(assert (=> d!18431 (= lt!35631 e!50723)))

(declare-fun c!11845 () Bool)

(assert (=> d!18431 (= c!11845 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(assert (=> d!18431 (validMask!0 (mask!6258 (v!2586 (underlying!277 thiss!992))))))

(assert (=> d!18431 (= (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))) lt!35631)))

(declare-fun b!77565 () Bool)

(declare-fun e!50721 () Bool)

(assert (=> b!77565 (= e!50719 e!50721)))

(assert (=> b!77565 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun res!40704 () Bool)

(assert (=> b!77565 (= res!40704 (contains!733 lt!35631 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77565 (=> (not res!40704) (not e!50721))))

(declare-fun b!77566 () Bool)

(assert (=> b!77566 (= e!50723 (ListLongMap!1426 Nil!1489))))

(declare-fun b!77567 () Bool)

(declare-fun lt!35634 () Unit!2229)

(declare-fun lt!35629 () Unit!2229)

(assert (=> b!77567 (= lt!35634 lt!35629)))

(declare-fun lt!35633 () ListLongMap!1425)

(declare-fun lt!35632 () V!2985)

(declare-fun lt!35628 () (_ BitVec 64))

(declare-fun lt!35630 () (_ BitVec 64))

(assert (=> b!77567 (not (contains!733 (+!99 lt!35633 (tuple2!2159 lt!35630 lt!35632)) lt!35628))))

(declare-fun addStillNotContains!29 (ListLongMap!1425 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2229)

(assert (=> b!77567 (= lt!35629 (addStillNotContains!29 lt!35633 lt!35630 lt!35632 lt!35628))))

(assert (=> b!77567 (= lt!35628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!77567 (= lt!35632 (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77567 (= lt!35630 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!6993 () ListLongMap!1425)

(assert (=> b!77567 (= lt!35633 call!6993)))

(declare-fun e!50720 () ListLongMap!1425)

(assert (=> b!77567 (= e!50720 (+!99 call!6993 (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!6990 () Bool)

(assert (=> bm!6990 (= call!6993 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992)))))))

(declare-fun b!77568 () Bool)

(declare-fun isEmpty!331 (ListLongMap!1425) Bool)

(assert (=> b!77568 (= e!50724 (isEmpty!331 lt!35631))))

(declare-fun b!77569 () Bool)

(assert (=> b!77569 (= e!50723 e!50720)))

(declare-fun c!11844 () Bool)

(assert (=> b!77569 (= c!11844 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77570 () Bool)

(declare-fun e!50718 () Bool)

(assert (=> b!77570 (= e!50718 (validKeyInArray!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77570 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!77571 () Bool)

(assert (=> b!77571 (= e!50722 e!50719)))

(declare-fun c!11846 () Bool)

(assert (=> b!77571 (= c!11846 e!50718)))

(declare-fun res!40702 () Bool)

(assert (=> b!77571 (=> (not res!40702) (not e!50718))))

(assert (=> b!77571 (= res!40702 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(declare-fun b!77572 () Bool)

(assert (=> b!77572 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2121 (_keys!3925 (v!2586 (underlying!277 thiss!992))))))))

(assert (=> b!77572 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2122 (_values!2248 (v!2586 (underlying!277 thiss!992))))))))

(assert (=> b!77572 (= e!50721 (= (apply!78 lt!35631 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1177 (select (arr!1881 (_values!2248 (v!2586 (underlying!277 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!338 (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!77573 () Bool)

(declare-fun res!40701 () Bool)

(assert (=> b!77573 (=> (not res!40701) (not e!50722))))

(assert (=> b!77573 (= res!40701 (not (contains!733 lt!35631 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77574 () Bool)

(assert (=> b!77574 (= e!50720 call!6993)))

(declare-fun b!77575 () Bool)

(assert (=> b!77575 (= e!50724 (= lt!35631 (getCurrentListMapNoExtraKeys!64 (_keys!3925 (v!2586 (underlying!277 thiss!992))) (_values!2248 (v!2586 (underlying!277 thiss!992))) (mask!6258 (v!2586 (underlying!277 thiss!992))) (extraKeys!2116 (v!2586 (underlying!277 thiss!992))) (zeroValue!2163 (v!2586 (underlying!277 thiss!992))) (minValue!2163 (v!2586 (underlying!277 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))))))))

(assert (= (and d!18431 c!11845) b!77566))

(assert (= (and d!18431 (not c!11845)) b!77569))

(assert (= (and b!77569 c!11844) b!77567))

(assert (= (and b!77569 (not c!11844)) b!77574))

(assert (= (or b!77567 b!77574) bm!6990))

(assert (= (and d!18431 res!40703) b!77573))

(assert (= (and b!77573 res!40701) b!77571))

(assert (= (and b!77571 res!40702) b!77570))

(assert (= (and b!77571 c!11846) b!77565))

(assert (= (and b!77571 (not c!11846)) b!77564))

(assert (= (and b!77565 res!40704) b!77572))

(assert (= (and b!77564 c!11843) b!77575))

(assert (= (and b!77564 (not c!11843)) b!77568))

(declare-fun b_lambda!3483 () Bool)

(assert (=> (not b_lambda!3483) (not b!77567)))

(assert (=> b!77567 t!5115))

(declare-fun b_and!4777 () Bool)

(assert (= b_and!4773 (and (=> t!5115 result!2781) b_and!4777)))

(assert (=> b!77567 t!5117))

(declare-fun b_and!4779 () Bool)

(assert (= b_and!4775 (and (=> t!5117 result!2785) b_and!4779)))

(declare-fun b_lambda!3485 () Bool)

(assert (=> (not b_lambda!3485) (not b!77572)))

(assert (=> b!77572 t!5115))

(declare-fun b_and!4781 () Bool)

(assert (= b_and!4777 (and (=> t!5115 result!2781) b_and!4781)))

(assert (=> b!77572 t!5117))

(declare-fun b_and!4783 () Bool)

(assert (= b_and!4779 (and (=> t!5117 result!2785) b_and!4783)))

(declare-fun m!77701 () Bool)

(assert (=> b!77567 m!77701))

(assert (=> b!77567 m!77667))

(assert (=> b!77567 m!77611))

(declare-fun m!77703 () Bool)

(assert (=> b!77567 m!77703))

(declare-fun m!77705 () Bool)

(assert (=> b!77567 m!77705))

(assert (=> b!77567 m!77703))

(declare-fun m!77707 () Bool)

(assert (=> b!77567 m!77707))

(assert (=> b!77567 m!77419))

(assert (=> b!77567 m!77667))

(assert (=> b!77567 m!77419))

(assert (=> b!77567 m!77671))

(assert (=> b!77569 m!77611))

(assert (=> b!77569 m!77611))

(assert (=> b!77569 m!77631))

(declare-fun m!77709 () Bool)

(assert (=> bm!6990 m!77709))

(assert (=> b!77570 m!77611))

(assert (=> b!77570 m!77611))

(assert (=> b!77570 m!77631))

(declare-fun m!77711 () Bool)

(assert (=> b!77573 m!77711))

(declare-fun m!77713 () Bool)

(assert (=> d!18431 m!77713))

(assert (=> d!18431 m!77431))

(declare-fun m!77715 () Bool)

(assert (=> b!77568 m!77715))

(assert (=> b!77575 m!77709))

(assert (=> b!77572 m!77611))

(declare-fun m!77717 () Bool)

(assert (=> b!77572 m!77717))

(assert (=> b!77572 m!77667))

(assert (=> b!77572 m!77611))

(assert (=> b!77572 m!77419))

(assert (=> b!77572 m!77667))

(assert (=> b!77572 m!77419))

(assert (=> b!77572 m!77671))

(assert (=> b!77565 m!77611))

(assert (=> b!77565 m!77611))

(declare-fun m!77719 () Bool)

(assert (=> b!77565 m!77719))

(assert (=> b!77314 d!18431))

(declare-fun d!18433 () Bool)

(declare-fun e!50725 () Bool)

(assert (=> d!18433 e!50725))

(declare-fun res!40705 () Bool)

(assert (=> d!18433 (=> (not res!40705) (not e!50725))))

(declare-fun lt!35635 () ListLongMap!1425)

(assert (=> d!18433 (= res!40705 (contains!733 lt!35635 (_1!1090 lt!35413)))))

(declare-fun lt!35638 () List!1492)

(assert (=> d!18433 (= lt!35635 (ListLongMap!1426 lt!35638))))

(declare-fun lt!35636 () Unit!2229)

(declare-fun lt!35637 () Unit!2229)

(assert (=> d!18433 (= lt!35636 lt!35637)))

(assert (=> d!18433 (= (getValueByKey!137 lt!35638 (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413)))))

(assert (=> d!18433 (= lt!35637 (lemmaContainsTupThenGetReturnValue!54 lt!35638 (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(assert (=> d!18433 (= lt!35638 (insertStrictlySorted!57 (toList!728 lt!35412) (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(assert (=> d!18433 (= (+!99 lt!35412 lt!35413) lt!35635)))

(declare-fun b!77576 () Bool)

(declare-fun res!40706 () Bool)

(assert (=> b!77576 (=> (not res!40706) (not e!50725))))

(assert (=> b!77576 (= res!40706 (= (getValueByKey!137 (toList!728 lt!35635) (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413))))))

(declare-fun b!77577 () Bool)

(assert (=> b!77577 (= e!50725 (contains!735 (toList!728 lt!35635) lt!35413))))

(assert (= (and d!18433 res!40705) b!77576))

(assert (= (and b!77576 res!40706) b!77577))

(declare-fun m!77721 () Bool)

(assert (=> d!18433 m!77721))

(declare-fun m!77723 () Bool)

(assert (=> d!18433 m!77723))

(declare-fun m!77725 () Bool)

(assert (=> d!18433 m!77725))

(declare-fun m!77727 () Bool)

(assert (=> d!18433 m!77727))

(declare-fun m!77729 () Bool)

(assert (=> b!77576 m!77729))

(declare-fun m!77731 () Bool)

(assert (=> b!77577 m!77731))

(assert (=> b!77314 d!18433))

(declare-fun d!18435 () Bool)

(declare-fun e!50726 () Bool)

(assert (=> d!18435 e!50726))

(declare-fun res!40707 () Bool)

(assert (=> d!18435 (=> (not res!40707) (not e!50726))))

(declare-fun lt!35639 () ListLongMap!1425)

(assert (=> d!18435 (= res!40707 (contains!733 lt!35639 (_1!1090 lt!35409)))))

(declare-fun lt!35642 () List!1492)

(assert (=> d!18435 (= lt!35639 (ListLongMap!1426 lt!35642))))

(declare-fun lt!35640 () Unit!2229)

(declare-fun lt!35641 () Unit!2229)

(assert (=> d!18435 (= lt!35640 lt!35641)))

(assert (=> d!18435 (= (getValueByKey!137 lt!35642 (_1!1090 lt!35409)) (Some!142 (_2!1090 lt!35409)))))

(assert (=> d!18435 (= lt!35641 (lemmaContainsTupThenGetReturnValue!54 lt!35642 (_1!1090 lt!35409) (_2!1090 lt!35409)))))

(assert (=> d!18435 (= lt!35642 (insertStrictlySorted!57 (toList!728 lt!35412) (_1!1090 lt!35409) (_2!1090 lt!35409)))))

(assert (=> d!18435 (= (+!99 lt!35412 lt!35409) lt!35639)))

(declare-fun b!77578 () Bool)

(declare-fun res!40708 () Bool)

(assert (=> b!77578 (=> (not res!40708) (not e!50726))))

(assert (=> b!77578 (= res!40708 (= (getValueByKey!137 (toList!728 lt!35639) (_1!1090 lt!35409)) (Some!142 (_2!1090 lt!35409))))))

(declare-fun b!77579 () Bool)

(assert (=> b!77579 (= e!50726 (contains!735 (toList!728 lt!35639) lt!35409))))

(assert (= (and d!18435 res!40707) b!77578))

(assert (= (and b!77578 res!40708) b!77579))

(declare-fun m!77733 () Bool)

(assert (=> d!18435 m!77733))

(declare-fun m!77735 () Bool)

(assert (=> d!18435 m!77735))

(declare-fun m!77737 () Bool)

(assert (=> d!18435 m!77737))

(declare-fun m!77739 () Bool)

(assert (=> d!18435 m!77739))

(declare-fun m!77741 () Bool)

(assert (=> b!77578 m!77741))

(declare-fun m!77743 () Bool)

(assert (=> b!77579 m!77743))

(assert (=> b!77314 d!18435))

(declare-fun d!18437 () Bool)

(declare-fun e!50727 () Bool)

(assert (=> d!18437 e!50727))

(declare-fun res!40709 () Bool)

(assert (=> d!18437 (=> (not res!40709) (not e!50727))))

(declare-fun lt!35643 () ListLongMap!1425)

(assert (=> d!18437 (= res!40709 (contains!733 lt!35643 (_1!1090 lt!35413)))))

(declare-fun lt!35646 () List!1492)

(assert (=> d!18437 (= lt!35643 (ListLongMap!1426 lt!35646))))

(declare-fun lt!35644 () Unit!2229)

(declare-fun lt!35645 () Unit!2229)

(assert (=> d!18437 (= lt!35644 lt!35645)))

(assert (=> d!18437 (= (getValueByKey!137 lt!35646 (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413)))))

(assert (=> d!18437 (= lt!35645 (lemmaContainsTupThenGetReturnValue!54 lt!35646 (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(assert (=> d!18437 (= lt!35646 (insertStrictlySorted!57 (toList!728 lt!35399) (_1!1090 lt!35413) (_2!1090 lt!35413)))))

(assert (=> d!18437 (= (+!99 lt!35399 lt!35413) lt!35643)))

(declare-fun b!77580 () Bool)

(declare-fun res!40710 () Bool)

(assert (=> b!77580 (=> (not res!40710) (not e!50727))))

(assert (=> b!77580 (= res!40710 (= (getValueByKey!137 (toList!728 lt!35643) (_1!1090 lt!35413)) (Some!142 (_2!1090 lt!35413))))))

(declare-fun b!77581 () Bool)

(assert (=> b!77581 (= e!50727 (contains!735 (toList!728 lt!35643) lt!35413))))

(assert (= (and d!18437 res!40709) b!77580))

(assert (= (and b!77580 res!40710) b!77581))

(declare-fun m!77745 () Bool)

(assert (=> d!18437 m!77745))

(declare-fun m!77747 () Bool)

(assert (=> d!18437 m!77747))

(declare-fun m!77749 () Bool)

(assert (=> d!18437 m!77749))

(declare-fun m!77751 () Bool)

(assert (=> d!18437 m!77751))

(declare-fun m!77753 () Bool)

(assert (=> b!77580 m!77753))

(declare-fun m!77755 () Bool)

(assert (=> b!77581 m!77755))

(assert (=> b!77314 d!18437))

(declare-fun d!18439 () Bool)

(declare-fun e!50728 () Bool)

(assert (=> d!18439 e!50728))

(declare-fun res!40711 () Bool)

(assert (=> d!18439 (=> (not res!40711) (not e!50728))))

(declare-fun lt!35647 () ListLongMap!1425)

(assert (=> d!18439 (= res!40711 (contains!733 lt!35647 (_1!1090 lt!35409)))))

(declare-fun lt!35650 () List!1492)

(assert (=> d!18439 (= lt!35647 (ListLongMap!1426 lt!35650))))

(declare-fun lt!35648 () Unit!2229)

(declare-fun lt!35649 () Unit!2229)

(assert (=> d!18439 (= lt!35648 lt!35649)))

(assert (=> d!18439 (= (getValueByKey!137 lt!35650 (_1!1090 lt!35409)) (Some!142 (_2!1090 lt!35409)))))

(assert (=> d!18439 (= lt!35649 (lemmaContainsTupThenGetReturnValue!54 lt!35650 (_1!1090 lt!35409) (_2!1090 lt!35409)))))

(assert (=> d!18439 (= lt!35650 (insertStrictlySorted!57 (toList!728 lt!35406) (_1!1090 lt!35409) (_2!1090 lt!35409)))))

(assert (=> d!18439 (= (+!99 lt!35406 lt!35409) lt!35647)))

(declare-fun b!77582 () Bool)

(declare-fun res!40712 () Bool)

(assert (=> b!77582 (=> (not res!40712) (not e!50728))))

(assert (=> b!77582 (= res!40712 (= (getValueByKey!137 (toList!728 lt!35647) (_1!1090 lt!35409)) (Some!142 (_2!1090 lt!35409))))))

(declare-fun b!77583 () Bool)

(assert (=> b!77583 (= e!50728 (contains!735 (toList!728 lt!35647) lt!35409))))

(assert (= (and d!18439 res!40711) b!77582))

(assert (= (and b!77582 res!40712) b!77583))

(declare-fun m!77757 () Bool)

(assert (=> d!18439 m!77757))

(declare-fun m!77759 () Bool)

(assert (=> d!18439 m!77759))

(declare-fun m!77761 () Bool)

(assert (=> d!18439 m!77761))

(declare-fun m!77763 () Bool)

(assert (=> d!18439 m!77763))

(declare-fun m!77765 () Bool)

(assert (=> b!77582 m!77765))

(declare-fun m!77767 () Bool)

(assert (=> b!77583 m!77767))

(assert (=> b!77314 d!18439))

(declare-fun d!18441 () Bool)

(declare-fun e!50729 () Bool)

(assert (=> d!18441 e!50729))

(declare-fun res!40713 () Bool)

(assert (=> d!18441 (=> (not res!40713) (not e!50729))))

(declare-fun lt!35651 () ListLongMap!1425)

(assert (=> d!18441 (= res!40713 (contains!733 lt!35651 (_1!1090 lt!35415)))))

(declare-fun lt!35654 () List!1492)

(assert (=> d!18441 (= lt!35651 (ListLongMap!1426 lt!35654))))

(declare-fun lt!35652 () Unit!2229)

(declare-fun lt!35653 () Unit!2229)

(assert (=> d!18441 (= lt!35652 lt!35653)))

(assert (=> d!18441 (= (getValueByKey!137 lt!35654 (_1!1090 lt!35415)) (Some!142 (_2!1090 lt!35415)))))

(assert (=> d!18441 (= lt!35653 (lemmaContainsTupThenGetReturnValue!54 lt!35654 (_1!1090 lt!35415) (_2!1090 lt!35415)))))

(assert (=> d!18441 (= lt!35654 (insertStrictlySorted!57 (toList!728 lt!35399) (_1!1090 lt!35415) (_2!1090 lt!35415)))))

(assert (=> d!18441 (= (+!99 lt!35399 lt!35415) lt!35651)))

(declare-fun b!77584 () Bool)

(declare-fun res!40714 () Bool)

(assert (=> b!77584 (=> (not res!40714) (not e!50729))))

(assert (=> b!77584 (= res!40714 (= (getValueByKey!137 (toList!728 lt!35651) (_1!1090 lt!35415)) (Some!142 (_2!1090 lt!35415))))))

(declare-fun b!77585 () Bool)

(assert (=> b!77585 (= e!50729 (contains!735 (toList!728 lt!35651) lt!35415))))

(assert (= (and d!18441 res!40713) b!77584))

(assert (= (and b!77584 res!40714) b!77585))

(declare-fun m!77769 () Bool)

(assert (=> d!18441 m!77769))

(declare-fun m!77771 () Bool)

(assert (=> d!18441 m!77771))

(declare-fun m!77773 () Bool)

(assert (=> d!18441 m!77773))

(declare-fun m!77775 () Bool)

(assert (=> d!18441 m!77775))

(declare-fun m!77777 () Bool)

(assert (=> b!77584 m!77777))

(declare-fun m!77779 () Bool)

(assert (=> b!77585 m!77779))

(assert (=> b!77314 d!18441))

(declare-fun d!18443 () Bool)

(declare-fun e!50730 () Bool)

(assert (=> d!18443 e!50730))

(declare-fun res!40715 () Bool)

(assert (=> d!18443 (=> (not res!40715) (not e!50730))))

(declare-fun lt!35655 () ListLongMap!1425)

(assert (=> d!18443 (= res!40715 (contains!733 lt!35655 (_1!1090 lt!35415)))))

(declare-fun lt!35658 () List!1492)

(assert (=> d!18443 (= lt!35655 (ListLongMap!1426 lt!35658))))

(declare-fun lt!35656 () Unit!2229)

(declare-fun lt!35657 () Unit!2229)

(assert (=> d!18443 (= lt!35656 lt!35657)))

(assert (=> d!18443 (= (getValueByKey!137 lt!35658 (_1!1090 lt!35415)) (Some!142 (_2!1090 lt!35415)))))

(assert (=> d!18443 (= lt!35657 (lemmaContainsTupThenGetReturnValue!54 lt!35658 (_1!1090 lt!35415) (_2!1090 lt!35415)))))

(assert (=> d!18443 (= lt!35658 (insertStrictlySorted!57 (toList!728 lt!35401) (_1!1090 lt!35415) (_2!1090 lt!35415)))))

(assert (=> d!18443 (= (+!99 lt!35401 lt!35415) lt!35655)))

(declare-fun b!77586 () Bool)

(declare-fun res!40716 () Bool)

(assert (=> b!77586 (=> (not res!40716) (not e!50730))))

(assert (=> b!77586 (= res!40716 (= (getValueByKey!137 (toList!728 lt!35655) (_1!1090 lt!35415)) (Some!142 (_2!1090 lt!35415))))))

(declare-fun b!77587 () Bool)

(assert (=> b!77587 (= e!50730 (contains!735 (toList!728 lt!35655) lt!35415))))

(assert (= (and d!18443 res!40715) b!77586))

(assert (= (and b!77586 res!40716) b!77587))

(declare-fun m!77781 () Bool)

(assert (=> d!18443 m!77781))

(declare-fun m!77783 () Bool)

(assert (=> d!18443 m!77783))

(declare-fun m!77785 () Bool)

(assert (=> d!18443 m!77785))

(declare-fun m!77787 () Bool)

(assert (=> d!18443 m!77787))

(declare-fun m!77789 () Bool)

(assert (=> b!77586 m!77789))

(declare-fun m!77791 () Bool)

(assert (=> b!77587 m!77791))

(assert (=> b!77314 d!18443))

(declare-fun d!18445 () Bool)

(assert (=> d!18445 (= (+!99 (+!99 lt!35399 (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414)) (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992))))) (+!99 (+!99 lt!35399 (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992))))) (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414)))))

(declare-fun lt!35659 () Unit!2229)

(assert (=> d!18445 (= lt!35659 (choose!459 lt!35399 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992)))))))

(assert (=> d!18445 (not (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18445 (= (addCommutativeForDiffKeys!19 lt!35399 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2586 (underlying!277 thiss!992)))) lt!35659)))

(declare-fun bs!3309 () Bool)

(assert (= bs!3309 d!18445))

(declare-fun m!77793 () Bool)

(assert (=> bs!3309 m!77793))

(assert (=> bs!3309 m!77411))

(declare-fun m!77795 () Bool)

(assert (=> bs!3309 m!77795))

(declare-fun m!77797 () Bool)

(assert (=> bs!3309 m!77797))

(declare-fun m!77799 () Bool)

(assert (=> bs!3309 m!77799))

(assert (=> bs!3309 m!77797))

(assert (=> bs!3309 m!77793))

(declare-fun m!77801 () Bool)

(assert (=> bs!3309 m!77801))

(assert (=> b!77314 d!18445))

(declare-fun d!18447 () Bool)

(assert (=> d!18447 (= (validMask!0 (mask!6258 (v!2586 (underlying!277 thiss!992)))) (and (or (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000000111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000001111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000011111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000000111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000001111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000011111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000000111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000001111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000011111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000000111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000001111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000011111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000000111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000001111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000011111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000000111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000001111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000011111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000000111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000001111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000011111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000000111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000001111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000011111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00000111111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00001111111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00011111111111111111111111111111) (= (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6258 (v!2586 (underlying!277 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!77314 d!18447))

(declare-fun d!18449 () Bool)

(declare-fun res!40723 () Bool)

(declare-fun e!50733 () Bool)

(assert (=> d!18449 (=> (not res!40723) (not e!50733))))

(declare-fun simpleValid!54 (LongMapFixedSize!724) Bool)

(assert (=> d!18449 (= res!40723 (simpleValid!54 newMap!16))))

(assert (=> d!18449 (= (valid!319 newMap!16) e!50733)))

(declare-fun b!77594 () Bool)

(declare-fun res!40724 () Bool)

(assert (=> b!77594 (=> (not res!40724) (not e!50733))))

(declare-fun arrayCountValidKeys!0 (array!3943 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!77594 (= res!40724 (= (arrayCountValidKeys!0 (_keys!3925 newMap!16) #b00000000000000000000000000000000 (size!2121 (_keys!3925 newMap!16))) (_size!411 newMap!16)))))

(declare-fun b!77595 () Bool)

(declare-fun res!40725 () Bool)

(assert (=> b!77595 (=> (not res!40725) (not e!50733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3943 (_ BitVec 32)) Bool)

(assert (=> b!77595 (= res!40725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3925 newMap!16) (mask!6258 newMap!16)))))

(declare-fun b!77596 () Bool)

(assert (=> b!77596 (= e!50733 (arrayNoDuplicates!0 (_keys!3925 newMap!16) #b00000000000000000000000000000000 Nil!1490))))

(assert (= (and d!18449 res!40723) b!77594))

(assert (= (and b!77594 res!40724) b!77595))

(assert (= (and b!77595 res!40725) b!77596))

(declare-fun m!77803 () Bool)

(assert (=> d!18449 m!77803))

(declare-fun m!77805 () Bool)

(assert (=> b!77594 m!77805))

(declare-fun m!77807 () Bool)

(assert (=> b!77595 m!77807))

(declare-fun m!77809 () Bool)

(assert (=> b!77596 m!77809))

(assert (=> b!77302 d!18449))

(declare-fun d!18451 () Bool)

(declare-fun e!50738 () Bool)

(assert (=> d!18451 e!50738))

(declare-fun res!40728 () Bool)

(assert (=> d!18451 (=> res!40728 e!50738)))

(declare-fun lt!35670 () Bool)

(assert (=> d!18451 (= res!40728 (not lt!35670))))

(declare-fun lt!35669 () Bool)

(assert (=> d!18451 (= lt!35670 lt!35669)))

(declare-fun lt!35668 () Unit!2229)

(declare-fun e!50739 () Unit!2229)

(assert (=> d!18451 (= lt!35668 e!50739)))

(declare-fun c!11849 () Bool)

(assert (=> d!18451 (= c!11849 lt!35669)))

(declare-fun containsKey!140 (List!1492 (_ BitVec 64)) Bool)

(assert (=> d!18451 (= lt!35669 (containsKey!140 (toList!728 lt!35410) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(assert (=> d!18451 (= (contains!733 lt!35410 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)) lt!35670)))

(declare-fun b!77603 () Bool)

(declare-fun lt!35671 () Unit!2229)

(assert (=> b!77603 (= e!50739 lt!35671)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!88 (List!1492 (_ BitVec 64)) Unit!2229)

(assert (=> b!77603 (= lt!35671 (lemmaContainsKeyImpliesGetValueByKeyDefined!88 (toList!728 lt!35410) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun isDefined!89 (Option!143) Bool)

(assert (=> b!77603 (isDefined!89 (getValueByKey!137 (toList!728 lt!35410) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun b!77604 () Bool)

(declare-fun Unit!2234 () Unit!2229)

(assert (=> b!77604 (= e!50739 Unit!2234)))

(declare-fun b!77605 () Bool)

(assert (=> b!77605 (= e!50738 (isDefined!89 (getValueByKey!137 (toList!728 lt!35410) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355))))))

(assert (= (and d!18451 c!11849) b!77603))

(assert (= (and d!18451 (not c!11849)) b!77604))

(assert (= (and d!18451 (not res!40728)) b!77605))

(assert (=> d!18451 m!77411))

(declare-fun m!77811 () Bool)

(assert (=> d!18451 m!77811))

(assert (=> b!77603 m!77411))

(declare-fun m!77813 () Bool)

(assert (=> b!77603 m!77813))

(assert (=> b!77603 m!77411))

(declare-fun m!77815 () Bool)

(assert (=> b!77603 m!77815))

(assert (=> b!77603 m!77815))

(declare-fun m!77817 () Bool)

(assert (=> b!77603 m!77817))

(assert (=> b!77605 m!77411))

(assert (=> b!77605 m!77815))

(assert (=> b!77605 m!77815))

(assert (=> b!77605 m!77817))

(assert (=> b!77315 d!18451))

(declare-fun bm!7039 () Bool)

(declare-datatypes ((SeekEntryResult!233 0))(
  ( (MissingZero!233 (index!3066 (_ BitVec 32))) (Found!233 (index!3067 (_ BitVec 32))) (Intermediate!233 (undefined!1045 Bool) (index!3068 (_ BitVec 32)) (x!11499 (_ BitVec 32))) (Undefined!233) (MissingVacant!233 (index!3069 (_ BitVec 32))) )
))
(declare-fun call!7062 () SeekEntryResult!233)

(declare-fun call!7060 () SeekEntryResult!233)

(assert (=> bm!7039 (= call!7062 call!7060)))

(declare-fun bm!7040 () Bool)

(declare-fun call!7061 () Bool)

(declare-fun call!7051 () Bool)

(assert (=> bm!7040 (= call!7061 call!7051)))

(declare-fun b!77686 () Bool)

(declare-fun e!50783 () ListLongMap!1425)

(declare-fun lt!35726 () array!3945)

(assert (=> b!77686 (= e!50783 (getCurrentListMap!424 (_keys!3925 newMap!16) lt!35726 (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun bm!7041 () Bool)

(declare-fun call!7046 () SeekEntryResult!233)

(assert (=> bm!7041 (= call!7046 call!7060)))

(declare-fun b!77687 () Bool)

(declare-fun lt!35752 () Unit!2229)

(declare-fun e!50785 () Unit!2229)

(assert (=> b!77687 (= lt!35752 e!50785)))

(declare-fun c!11883 () Bool)

(declare-fun call!7054 () Bool)

(assert (=> b!77687 (= c!11883 call!7054)))

(declare-fun e!50790 () tuple2!2160)

(assert (=> b!77687 (= e!50790 (tuple2!2161 false newMap!16))))

(declare-fun call!7047 () ListLongMap!1425)

(declare-fun call!7049 () ListLongMap!1425)

(declare-fun call!7050 () ListLongMap!1425)

(declare-fun call!7044 () ListLongMap!1425)

(declare-fun c!11877 () Bool)

(declare-fun c!11886 () Bool)

(declare-fun bm!7042 () Bool)

(assert (=> bm!7042 (= call!7047 (+!99 (ite c!11877 (ite c!11886 call!7049 call!7044) call!7050) (ite c!11877 (ite c!11886 (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 lt!35414) (tuple2!2159 #b1000000000000000000000000000000000000000000000000000000000000000 lt!35414)) (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414))))))

(declare-fun b!77688 () Bool)

(declare-fun lt!35739 () Unit!2229)

(declare-fun lt!35736 () Unit!2229)

(assert (=> b!77688 (= lt!35739 lt!35736)))

(declare-fun call!7064 () ListLongMap!1425)

(assert (=> b!77688 (= call!7064 call!7044)))

(declare-fun lt!35738 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!27 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 V!2985 Int) Unit!2229)

(assert (=> b!77688 (= lt!35736 (lemmaChangeZeroKeyThenAddPairToListMap!27 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) lt!35738 (zeroValue!2163 newMap!16) lt!35414 (minValue!2163 newMap!16) (defaultEntry!2265 newMap!16)))))

(assert (=> b!77688 (= lt!35738 (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!50793 () tuple2!2160)

(assert (=> b!77688 (= e!50793 (tuple2!2161 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6258 newMap!16) (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000001) lt!35414 (minValue!2163 newMap!16) (_size!411 newMap!16) (_keys!3925 newMap!16) (_values!2248 newMap!16) (_vacant!411 newMap!16))))))

(declare-fun bm!7043 () Bool)

(declare-fun call!7045 () Unit!2229)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) Int) Unit!2229)

(assert (=> bm!7043 (= call!7045 (lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (defaultEntry!2265 newMap!16)))))

(declare-fun bm!7044 () Bool)

(declare-fun call!7057 () ListLongMap!1425)

(assert (=> bm!7044 (= call!7049 call!7057)))

(declare-fun bm!7045 () Bool)

(declare-fun call!7065 () Bool)

(assert (=> bm!7045 (= call!7065 call!7051)))

(declare-fun b!77689 () Bool)

(declare-fun lt!35731 () Unit!2229)

(declare-fun lt!35743 () Unit!2229)

(assert (=> b!77689 (= lt!35731 lt!35743)))

(assert (=> b!77689 (= call!7064 call!7049)))

(declare-fun lt!35730 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 V!2985 Int) Unit!2229)

(assert (=> b!77689 (= lt!35743 (lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) lt!35730 (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) lt!35414 (defaultEntry!2265 newMap!16)))))

(assert (=> b!77689 (= lt!35730 (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!77689 (= e!50793 (tuple2!2161 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6258 newMap!16) (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000010) (zeroValue!2163 newMap!16) lt!35414 (_size!411 newMap!16) (_keys!3925 newMap!16) (_values!2248 newMap!16) (_vacant!411 newMap!16))))))

(declare-fun lt!35748 () SeekEntryResult!233)

(declare-fun lt!35741 () SeekEntryResult!233)

(declare-fun c!11880 () Bool)

(declare-fun bm!7046 () Bool)

(declare-fun c!11882 () Bool)

(declare-fun call!7063 () Bool)

(declare-fun c!11881 () Bool)

(declare-fun lt!35728 () SeekEntryResult!233)

(declare-fun c!11887 () Bool)

(declare-fun lt!35733 () SeekEntryResult!233)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!7046 (= call!7063 (inRange!0 (ite c!11887 (ite c!11883 (index!3067 lt!35733) (ite c!11880 (index!3066 lt!35741) (index!3069 lt!35741))) (ite c!11881 (index!3067 lt!35728) (ite c!11882 (index!3066 lt!35748) (index!3069 lt!35748)))) (mask!6258 newMap!16)))))

(declare-fun bm!7047 () Bool)

(declare-fun c!11879 () Bool)

(assert (=> bm!7047 (= c!11879 c!11887)))

(declare-fun lt!35750 () SeekEntryResult!233)

(assert (=> bm!7047 (= call!7054 (contains!733 e!50783 (ite c!11887 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (select (arr!1880 (_keys!3925 newMap!16)) (index!3067 lt!35750)))))))

(declare-fun b!77690 () Bool)

(declare-fun c!11888 () Bool)

(assert (=> b!77690 (= c!11888 ((_ is MissingVacant!233) lt!35748))))

(declare-fun e!50801 () Bool)

(declare-fun e!50796 () Bool)

(assert (=> b!77690 (= e!50801 e!50796)))

(declare-fun b!77691 () Bool)

(declare-fun e!50786 () Bool)

(declare-fun call!7055 () ListLongMap!1425)

(declare-fun call!7048 () ListLongMap!1425)

(assert (=> b!77691 (= e!50786 (= call!7055 call!7048))))

(declare-fun bm!7048 () Bool)

(declare-fun lt!35737 () tuple2!2160)

(assert (=> bm!7048 (= call!7055 (map!1180 (_2!1091 lt!35737)))))

(declare-fun b!77692 () Bool)

(declare-fun c!11878 () Bool)

(assert (=> b!77692 (= c!11878 ((_ is MissingVacant!233) lt!35750))))

(declare-fun e!50784 () tuple2!2160)

(assert (=> b!77692 (= e!50790 e!50784)))

(declare-fun b!77693 () Bool)

(assert (=> b!77693 (= e!50796 ((_ is Undefined!233) lt!35748))))

(declare-fun bm!7049 () Bool)

(declare-fun call!7053 () Bool)

(assert (=> bm!7049 (= call!7053 call!7063)))

(declare-fun e!50797 () Bool)

(declare-fun b!77694 () Bool)

(assert (=> b!77694 (= e!50797 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3067 lt!35728)) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun b!77695 () Bool)

(declare-fun e!50795 () tuple2!2160)

(assert (=> b!77695 (= e!50795 e!50790)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3943 (_ BitVec 32)) SeekEntryResult!233)

(assert (=> b!77695 (= lt!35750 (seekEntryOrOpen!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (_keys!3925 newMap!16) (mask!6258 newMap!16)))))

(assert (=> b!77695 (= c!11887 ((_ is Undefined!233) lt!35750))))

(declare-fun b!77696 () Bool)

(declare-fun e!50792 () Bool)

(assert (=> b!77696 (= e!50796 e!50792)))

(declare-fun res!40765 () Bool)

(declare-fun call!7056 () Bool)

(assert (=> b!77696 (= res!40765 call!7056)))

(assert (=> b!77696 (=> (not res!40765) (not e!50792))))

(declare-fun bm!7050 () Bool)

(declare-fun call!7058 () Bool)

(assert (=> bm!7050 (= call!7058 call!7063)))

(declare-fun b!77697 () Bool)

(declare-fun e!50788 () tuple2!2160)

(assert (=> b!77697 (= e!50784 e!50788)))

(declare-fun c!11885 () Bool)

(assert (=> b!77697 (= c!11885 ((_ is MissingZero!233) lt!35750))))

(declare-fun b!77698 () Bool)

(declare-fun res!40768 () Bool)

(declare-fun e!50802 () Bool)

(assert (=> b!77698 (=> (not res!40768) (not e!50802))))

(assert (=> b!77698 (= res!40768 call!7056)))

(assert (=> b!77698 (= e!50801 e!50802)))

(declare-fun b!77699 () Bool)

(declare-fun res!40763 () Bool)

(assert (=> b!77699 (= res!40763 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3069 lt!35741)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50798 () Bool)

(assert (=> b!77699 (=> (not res!40763) (not e!50798))))

(declare-fun b!77700 () Bool)

(declare-fun e!50799 () Unit!2229)

(declare-fun Unit!2235 () Unit!2229)

(assert (=> b!77700 (= e!50799 Unit!2235)))

(declare-fun lt!35745 () Unit!2229)

(declare-fun call!7052 () Unit!2229)

(assert (=> b!77700 (= lt!35745 call!7052)))

(assert (=> b!77700 (= lt!35748 call!7062)))

(assert (=> b!77700 (= c!11882 ((_ is MissingZero!233) lt!35748))))

(assert (=> b!77700 e!50801))

(declare-fun lt!35727 () Unit!2229)

(assert (=> b!77700 (= lt!35727 lt!35745)))

(assert (=> b!77700 false))

(declare-fun b!77701 () Bool)

(declare-fun e!50787 () Bool)

(assert (=> b!77701 (= e!50786 e!50787)))

(declare-fun res!40770 () Bool)

(assert (=> b!77701 (= res!40770 (contains!733 call!7055 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(assert (=> b!77701 (=> (not res!40770) (not e!50787))))

(declare-fun d!18453 () Bool)

(declare-fun e!50791 () Bool)

(assert (=> d!18453 e!50791))

(declare-fun res!40757 () Bool)

(assert (=> d!18453 (=> (not res!40757) (not e!50791))))

(assert (=> d!18453 (= res!40757 (valid!319 (_2!1091 lt!35737)))))

(assert (=> d!18453 (= lt!35737 e!50795)))

(assert (=> d!18453 (= c!11877 (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (bvneg (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355))))))

(assert (=> d!18453 (valid!319 newMap!16)))

(assert (=> d!18453 (= (update!117 newMap!16 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414) lt!35737)))

(declare-fun b!77702 () Bool)

(assert (=> b!77702 (= e!50792 (not call!7061))))

(declare-fun b!77703 () Bool)

(declare-fun lt!35740 () Unit!2229)

(declare-fun lt!35746 () Unit!2229)

(assert (=> b!77703 (= lt!35740 lt!35746)))

(assert (=> b!77703 call!7054))

(declare-fun lemmaValidKeyInArrayIsInListMap!87 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) Unit!2229)

(assert (=> b!77703 (= lt!35746 (lemmaValidKeyInArrayIsInListMap!87 (_keys!3925 newMap!16) lt!35726 (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (index!3067 lt!35750) (defaultEntry!2265 newMap!16)))))

(assert (=> b!77703 (= lt!35726 (array!3946 (store (arr!1881 (_values!2248 newMap!16)) (index!3067 lt!35750) (ValueCellFull!908 lt!35414)) (size!2122 (_values!2248 newMap!16))))))

(declare-fun lt!35729 () Unit!2229)

(declare-fun lt!35744 () Unit!2229)

(assert (=> b!77703 (= lt!35729 lt!35744)))

(declare-fun call!7059 () ListLongMap!1425)

(assert (=> b!77703 (= call!7047 call!7059)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) (_ BitVec 64) V!2985 Int) Unit!2229)

(assert (=> b!77703 (= lt!35744 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (index!3067 lt!35750) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 (defaultEntry!2265 newMap!16)))))

(declare-fun lt!35749 () Unit!2229)

(assert (=> b!77703 (= lt!35749 e!50799)))

(assert (=> b!77703 (= c!11881 (contains!733 call!7050 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(assert (=> b!77703 (= e!50788 (tuple2!2161 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (_size!411 newMap!16) (_keys!3925 newMap!16) (array!3946 (store (arr!1881 (_values!2248 newMap!16)) (index!3067 lt!35750) (ValueCellFull!908 lt!35414)) (size!2122 (_values!2248 newMap!16))) (_vacant!411 newMap!16))))))

(declare-fun b!77704 () Bool)

(declare-fun e!50794 () Bool)

(assert (=> b!77704 (= e!50794 e!50798)))

(declare-fun res!40767 () Bool)

(declare-fun call!7042 () Bool)

(assert (=> b!77704 (= res!40767 call!7042)))

(assert (=> b!77704 (=> (not res!40767) (not e!50798))))

(declare-fun b!77705 () Bool)

(declare-fun res!40762 () Bool)

(assert (=> b!77705 (= res!40762 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3069 lt!35748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77705 (=> (not res!40762) (not e!50792))))

(declare-fun bm!7051 () Bool)

(assert (=> bm!7051 (= call!7042 call!7053)))

(declare-fun b!77706 () Bool)

(assert (=> b!77706 (= e!50798 (not call!7065))))

(declare-fun b!77707 () Bool)

(assert (=> b!77707 (= e!50783 call!7059)))

(declare-fun bm!7052 () Bool)

(assert (=> bm!7052 (= call!7048 (map!1180 newMap!16))))

(declare-fun bm!7053 () Bool)

(declare-fun call!7043 () tuple2!2160)

(declare-fun updateHelperNewKey!27 (LongMapFixedSize!724 (_ BitVec 64) V!2985 (_ BitVec 32)) tuple2!2160)

(assert (=> bm!7053 (= call!7043 (updateHelperNewKey!27 newMap!16 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414 (ite c!11878 (index!3069 lt!35750) (index!3066 lt!35750))))))

(declare-fun b!77708 () Bool)

(assert (=> b!77708 (= e!50794 ((_ is Undefined!233) lt!35741))))

(declare-fun b!77709 () Bool)

(declare-fun lt!35732 () tuple2!2160)

(assert (=> b!77709 (= e!50784 (tuple2!2161 (_1!1091 lt!35732) (_2!1091 lt!35732)))))

(assert (=> b!77709 (= lt!35732 call!7043)))

(declare-fun b!77710 () Bool)

(assert (=> b!77710 (= e!50795 e!50793)))

(assert (=> b!77710 (= c!11886 (= (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7054 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (array!3943 array!3945 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) Int) Unit!2229)

(assert (=> bm!7054 (= call!7052 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (defaultEntry!2265 newMap!16)))))

(declare-fun b!77711 () Bool)

(declare-fun res!40769 () Bool)

(declare-fun e!50782 () Bool)

(assert (=> b!77711 (=> (not res!40769) (not e!50782))))

(assert (=> b!77711 (= res!40769 call!7042)))

(declare-fun e!50789 () Bool)

(assert (=> b!77711 (= e!50789 e!50782)))

(declare-fun b!77712 () Bool)

(declare-fun lt!35747 () Unit!2229)

(assert (=> b!77712 (= e!50785 lt!35747)))

(assert (=> b!77712 (= lt!35747 call!7052)))

(assert (=> b!77712 (= lt!35741 call!7046)))

(assert (=> b!77712 (= c!11880 ((_ is MissingZero!233) lt!35741))))

(assert (=> b!77712 e!50789))

(declare-fun b!77713 () Bool)

(declare-fun res!40764 () Bool)

(assert (=> b!77713 (= res!40764 call!7058)))

(assert (=> b!77713 (=> (not res!40764) (not e!50797))))

(declare-fun b!77714 () Bool)

(assert (=> b!77714 (= e!50802 (not call!7061))))

(declare-fun bm!7055 () Bool)

(assert (=> bm!7055 (= call!7060 (seekEntryOrOpen!0 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) (_keys!3925 newMap!16) (mask!6258 newMap!16)))))

(declare-fun b!77715 () Bool)

(assert (=> b!77715 (= e!50787 (= call!7055 (+!99 call!7048 (tuple2!2159 (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) lt!35414))))))

(declare-fun b!77716 () Bool)

(declare-fun res!40766 () Bool)

(assert (=> b!77716 (= res!40766 call!7053)))

(declare-fun e!50800 () Bool)

(assert (=> b!77716 (=> (not res!40766) (not e!50800))))

(declare-fun b!77717 () Bool)

(assert (=> b!77717 (= e!50791 e!50786)))

(declare-fun c!11876 () Bool)

(assert (=> b!77717 (= c!11876 (_1!1091 lt!35737))))

(declare-fun bm!7056 () Bool)

(assert (=> bm!7056 (= call!7059 call!7057)))

(declare-fun bm!7057 () Bool)

(assert (=> bm!7057 (= call!7064 call!7047)))

(declare-fun b!77718 () Bool)

(declare-fun Unit!2236 () Unit!2229)

(assert (=> b!77718 (= e!50785 Unit!2236)))

(declare-fun lt!35734 () Unit!2229)

(assert (=> b!77718 (= lt!35734 call!7045)))

(assert (=> b!77718 (= lt!35733 call!7046)))

(declare-fun res!40759 () Bool)

(assert (=> b!77718 (= res!40759 ((_ is Found!233) lt!35733))))

(assert (=> b!77718 (=> (not res!40759) (not e!50800))))

(assert (=> b!77718 e!50800))

(declare-fun lt!35742 () Unit!2229)

(assert (=> b!77718 (= lt!35742 lt!35734)))

(assert (=> b!77718 false))

(declare-fun bm!7058 () Bool)

(assert (=> bm!7058 (= call!7044 call!7050)))

(declare-fun b!77719 () Bool)

(assert (=> b!77719 (= e!50782 (not call!7065))))

(declare-fun bm!7059 () Bool)

(assert (=> bm!7059 (= call!7057 (getCurrentListMap!424 (_keys!3925 newMap!16) (ite (or c!11877 c!11887) (_values!2248 newMap!16) (array!3946 (store (arr!1881 (_values!2248 newMap!16)) (index!3067 lt!35750) (ValueCellFull!908 lt!35414)) (size!2122 (_values!2248 newMap!16)))) (mask!6258 newMap!16) (ite c!11877 (ite c!11886 (extraKeys!2116 newMap!16) lt!35730) (extraKeys!2116 newMap!16)) (zeroValue!2163 newMap!16) (ite c!11877 (ite c!11886 (minValue!2163 newMap!16) lt!35414) (minValue!2163 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun b!77720 () Bool)

(declare-fun c!11884 () Bool)

(assert (=> b!77720 (= c!11884 ((_ is MissingVacant!233) lt!35741))))

(assert (=> b!77720 (= e!50789 e!50794)))

(declare-fun bm!7060 () Bool)

(assert (=> bm!7060 (= call!7050 (getCurrentListMap!424 (_keys!3925 newMap!16) (_values!2248 newMap!16) (mask!6258 newMap!16) (ite (and c!11877 c!11886) lt!35738 (extraKeys!2116 newMap!16)) (ite (and c!11877 c!11886) lt!35414 (zeroValue!2163 newMap!16)) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun bm!7061 () Bool)

(assert (=> bm!7061 (= call!7056 call!7058)))

(declare-fun b!77721 () Bool)

(assert (=> b!77721 (= e!50800 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3067 lt!35733)) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355)))))

(declare-fun bm!7062 () Bool)

(assert (=> bm!7062 (= call!7051 (arrayContainsKey!0 (_keys!3925 newMap!16) (select (arr!1880 (_keys!3925 (v!2586 (underlying!277 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!77722 () Bool)

(declare-fun res!40760 () Bool)

(assert (=> b!77722 (=> (not res!40760) (not e!50802))))

(assert (=> b!77722 (= res!40760 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3066 lt!35748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77723 () Bool)

(declare-fun lt!35735 () Unit!2229)

(assert (=> b!77723 (= e!50799 lt!35735)))

(assert (=> b!77723 (= lt!35735 call!7045)))

(assert (=> b!77723 (= lt!35728 call!7062)))

(declare-fun res!40761 () Bool)

(assert (=> b!77723 (= res!40761 ((_ is Found!233) lt!35728))))

(assert (=> b!77723 (=> (not res!40761) (not e!50797))))

(assert (=> b!77723 e!50797))

(declare-fun b!77724 () Bool)

(declare-fun lt!35751 () tuple2!2160)

(assert (=> b!77724 (= lt!35751 call!7043)))

(assert (=> b!77724 (= e!50788 (tuple2!2161 (_1!1091 lt!35751) (_2!1091 lt!35751)))))

(declare-fun b!77725 () Bool)

(declare-fun res!40758 () Bool)

(assert (=> b!77725 (=> (not res!40758) (not e!50782))))

(assert (=> b!77725 (= res!40758 (= (select (arr!1880 (_keys!3925 newMap!16)) (index!3066 lt!35741)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!18453 c!11877) b!77710))

(assert (= (and d!18453 (not c!11877)) b!77695))

(assert (= (and b!77710 c!11886) b!77688))

(assert (= (and b!77710 (not c!11886)) b!77689))

(assert (= (or b!77688 b!77689) bm!7058))

(assert (= (or b!77688 b!77689) bm!7044))

(assert (= (or b!77688 b!77689) bm!7057))

(assert (= (and b!77695 c!11887) b!77687))

(assert (= (and b!77695 (not c!11887)) b!77692))

(assert (= (and b!77687 c!11883) b!77718))

(assert (= (and b!77687 (not c!11883)) b!77712))

(assert (= (and b!77718 res!40759) b!77716))

(assert (= (and b!77716 res!40766) b!77721))

(assert (= (and b!77712 c!11880) b!77711))

(assert (= (and b!77712 (not c!11880)) b!77720))

(assert (= (and b!77711 res!40769) b!77725))

(assert (= (and b!77725 res!40758) b!77719))

(assert (= (and b!77720 c!11884) b!77704))

(assert (= (and b!77720 (not c!11884)) b!77708))

(assert (= (and b!77704 res!40767) b!77699))

(assert (= (and b!77699 res!40763) b!77706))

(assert (= (or b!77711 b!77704) bm!7051))

(assert (= (or b!77719 b!77706) bm!7045))

(assert (= (or b!77716 bm!7051) bm!7049))

(assert (= (or b!77718 b!77712) bm!7041))

(assert (= (and b!77692 c!11878) b!77709))

(assert (= (and b!77692 (not c!11878)) b!77697))

(assert (= (and b!77697 c!11885) b!77724))

(assert (= (and b!77697 (not c!11885)) b!77703))

(assert (= (and b!77703 c!11881) b!77723))

(assert (= (and b!77703 (not c!11881)) b!77700))

(assert (= (and b!77723 res!40761) b!77713))

(assert (= (and b!77713 res!40764) b!77694))

(assert (= (and b!77700 c!11882) b!77698))

(assert (= (and b!77700 (not c!11882)) b!77690))

(assert (= (and b!77698 res!40768) b!77722))

(assert (= (and b!77722 res!40760) b!77714))

(assert (= (and b!77690 c!11888) b!77696))

(assert (= (and b!77690 (not c!11888)) b!77693))

(assert (= (and b!77696 res!40765) b!77705))

(assert (= (and b!77705 res!40762) b!77702))

(assert (= (or b!77698 b!77696) bm!7061))

(assert (= (or b!77714 b!77702) bm!7040))

(assert (= (or b!77713 bm!7061) bm!7050))

(assert (= (or b!77723 b!77700) bm!7039))

(assert (= (or b!77709 b!77724) bm!7053))

(assert (= (or bm!7045 bm!7040) bm!7062))

(assert (= (or b!77712 b!77700) bm!7054))

(assert (= (or bm!7041 bm!7039) bm!7055))

(assert (= (or b!77718 b!77723) bm!7043))

(assert (= (or b!77687 b!77703) bm!7056))

(assert (= (or bm!7049 bm!7050) bm!7046))

(assert (= (or b!77687 b!77703) bm!7047))

(assert (= (and bm!7047 c!11879) b!77707))

(assert (= (and bm!7047 (not c!11879)) b!77686))

(assert (= (or bm!7058 b!77703) bm!7060))

(assert (= (or bm!7044 bm!7056) bm!7059))

(assert (= (or bm!7057 b!77703) bm!7042))

(assert (= (and d!18453 res!40757) b!77717))

(assert (= (and b!77717 c!11876) b!77701))

(assert (= (and b!77717 (not c!11876)) b!77691))

(assert (= (and b!77701 res!40770) b!77715))

(assert (= (or b!77715 b!77691) bm!7052))

(assert (= (or b!77701 b!77715 b!77691) bm!7048))

(assert (=> bm!7052 m!77451))

(declare-fun m!77819 () Bool)

(assert (=> b!77694 m!77819))

(assert (=> bm!7043 m!77411))

(declare-fun m!77821 () Bool)

(assert (=> bm!7043 m!77821))

(declare-fun m!77823 () Bool)

(assert (=> b!77705 m!77823))

(declare-fun m!77825 () Bool)

(assert (=> d!18453 m!77825))

(assert (=> d!18453 m!77457))

(assert (=> b!77701 m!77411))

(declare-fun m!77827 () Bool)

(assert (=> b!77701 m!77827))

(declare-fun m!77829 () Bool)

(assert (=> b!77699 m!77829))

(declare-fun m!77831 () Bool)

(assert (=> bm!7047 m!77831))

(declare-fun m!77833 () Bool)

(assert (=> bm!7047 m!77833))

(declare-fun m!77835 () Bool)

(assert (=> b!77725 m!77835))

(declare-fun m!77837 () Bool)

(assert (=> bm!7042 m!77837))

(assert (=> bm!7053 m!77411))

(declare-fun m!77839 () Bool)

(assert (=> bm!7053 m!77839))

(assert (=> bm!7055 m!77411))

(declare-fun m!77841 () Bool)

(assert (=> bm!7055 m!77841))

(declare-fun m!77843 () Bool)

(assert (=> bm!7046 m!77843))

(declare-fun m!77845 () Bool)

(assert (=> bm!7059 m!77845))

(declare-fun m!77847 () Bool)

(assert (=> bm!7059 m!77847))

(declare-fun m!77849 () Bool)

(assert (=> b!77715 m!77849))

(assert (=> bm!7062 m!77411))

(declare-fun m!77851 () Bool)

(assert (=> bm!7062 m!77851))

(declare-fun m!77853 () Bool)

(assert (=> b!77688 m!77853))

(declare-fun m!77855 () Bool)

(assert (=> b!77722 m!77855))

(assert (=> b!77695 m!77411))

(assert (=> b!77695 m!77841))

(declare-fun m!77857 () Bool)

(assert (=> bm!7048 m!77857))

(declare-fun m!77859 () Bool)

(assert (=> b!77721 m!77859))

(declare-fun m!77861 () Bool)

(assert (=> bm!7060 m!77861))

(assert (=> bm!7054 m!77411))

(declare-fun m!77863 () Bool)

(assert (=> bm!7054 m!77863))

(declare-fun m!77865 () Bool)

(assert (=> b!77703 m!77865))

(assert (=> b!77703 m!77845))

(assert (=> b!77703 m!77411))

(declare-fun m!77867 () Bool)

(assert (=> b!77703 m!77867))

(assert (=> b!77703 m!77411))

(declare-fun m!77869 () Bool)

(assert (=> b!77703 m!77869))

(declare-fun m!77871 () Bool)

(assert (=> b!77689 m!77871))

(declare-fun m!77873 () Bool)

(assert (=> b!77686 m!77873))

(assert (=> b!77315 d!18453))

(declare-fun b!77733 () Bool)

(declare-fun e!50808 () Bool)

(assert (=> b!77733 (= e!50808 tp_is_empty!2503)))

(declare-fun mapIsEmpty!3291 () Bool)

(declare-fun mapRes!3291 () Bool)

(assert (=> mapIsEmpty!3291 mapRes!3291))

(declare-fun mapNonEmpty!3291 () Bool)

(declare-fun tp!8745 () Bool)

(declare-fun e!50807 () Bool)

(assert (=> mapNonEmpty!3291 (= mapRes!3291 (and tp!8745 e!50807))))

(declare-fun mapRest!3291 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapKey!3291 () (_ BitVec 32))

(declare-fun mapValue!3291 () ValueCell!908)

(assert (=> mapNonEmpty!3291 (= mapRest!3275 (store mapRest!3291 mapKey!3291 mapValue!3291))))

(declare-fun b!77732 () Bool)

(assert (=> b!77732 (= e!50807 tp_is_empty!2503)))

(declare-fun condMapEmpty!3291 () Bool)

(declare-fun mapDefault!3291 () ValueCell!908)

(assert (=> mapNonEmpty!3276 (= condMapEmpty!3291 (= mapRest!3275 ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3291)))))

(assert (=> mapNonEmpty!3276 (= tp!8717 (and e!50808 mapRes!3291))))

(assert (= (and mapNonEmpty!3276 condMapEmpty!3291) mapIsEmpty!3291))

(assert (= (and mapNonEmpty!3276 (not condMapEmpty!3291)) mapNonEmpty!3291))

(assert (= (and mapNonEmpty!3291 ((_ is ValueCellFull!908) mapValue!3291)) b!77732))

(assert (= (and mapNonEmpty!3276 ((_ is ValueCellFull!908) mapDefault!3291)) b!77733))

(declare-fun m!77875 () Bool)

(assert (=> mapNonEmpty!3291 m!77875))

(declare-fun b!77735 () Bool)

(declare-fun e!50810 () Bool)

(assert (=> b!77735 (= e!50810 tp_is_empty!2503)))

(declare-fun mapIsEmpty!3292 () Bool)

(declare-fun mapRes!3292 () Bool)

(assert (=> mapIsEmpty!3292 mapRes!3292))

(declare-fun mapNonEmpty!3292 () Bool)

(declare-fun tp!8746 () Bool)

(declare-fun e!50809 () Bool)

(assert (=> mapNonEmpty!3292 (= mapRes!3292 (and tp!8746 e!50809))))

(declare-fun mapRest!3292 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapValue!3292 () ValueCell!908)

(declare-fun mapKey!3292 () (_ BitVec 32))

(assert (=> mapNonEmpty!3292 (= mapRest!3276 (store mapRest!3292 mapKey!3292 mapValue!3292))))

(declare-fun b!77734 () Bool)

(assert (=> b!77734 (= e!50809 tp_is_empty!2503)))

(declare-fun condMapEmpty!3292 () Bool)

(declare-fun mapDefault!3292 () ValueCell!908)

(assert (=> mapNonEmpty!3275 (= condMapEmpty!3292 (= mapRest!3276 ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3292)))))

(assert (=> mapNonEmpty!3275 (= tp!8716 (and e!50810 mapRes!3292))))

(assert (= (and mapNonEmpty!3275 condMapEmpty!3292) mapIsEmpty!3292))

(assert (= (and mapNonEmpty!3275 (not condMapEmpty!3292)) mapNonEmpty!3292))

(assert (= (and mapNonEmpty!3292 ((_ is ValueCellFull!908) mapValue!3292)) b!77734))

(assert (= (and mapNonEmpty!3275 ((_ is ValueCellFull!908) mapDefault!3292)) b!77735))

(declare-fun m!77877 () Bool)

(assert (=> mapNonEmpty!3292 m!77877))

(declare-fun b_lambda!3487 () Bool)

(assert (= b_lambda!3485 (or (and b!77317 b_free!2173) (and b!77305 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))))) b_lambda!3487)))

(declare-fun b_lambda!3489 () Bool)

(assert (= b_lambda!3481 (or (and b!77317 b_free!2173) (and b!77305 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))))) b_lambda!3489)))

(declare-fun b_lambda!3491 () Bool)

(assert (= b_lambda!3483 (or (and b!77317 b_free!2173) (and b!77305 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2586 (underlying!277 thiss!992))))) b_lambda!3491)))

(check-sat (not b!77515) (not b!77686) (not b!77513) (not d!18431) (not b!77689) (not bm!7046) (not bm!6987) (not b!77578) (not mapNonEmpty!3291) (not bm!7054) (not b!77695) (not b!77595) (not b!77567) (not d!18449) (not mapNonEmpty!3292) (not d!18441) (not b_lambda!3479) (not b!77523) (not b!77596) (not b!77449) (not b!77605) (not d!18439) (not d!18443) (not b!77576) (not b!77519) (not bm!7059) (not d!18413) (not bm!7055) (not b!77575) (not b!77585) (not b_next!2175) b_and!4781 (not d!18423) (not b!77443) (not b!77538) (not b!77577) (not b!77454) (not b!77442) (not bm!7047) (not d!18435) (not d!18409) (not b!77580) (not bm!7052) (not b!77569) b_and!4783 (not bm!6990) (not d!18433) (not d!18445) (not b!77521) (not bm!6985) (not bm!7053) (not d!18451) (not d!18421) (not b!77469) (not bm!7062) (not b_lambda!3487) (not d!18427) (not b!77532) (not b!77586) (not b!77514) (not b!77584) (not b!77583) (not bm!7048) (not bm!6983) (not b_lambda!3491) (not b!77587) (not b!77581) (not b_lambda!3489) (not b!77603) (not d!18407) tp_is_empty!2503 (not b_next!2173) (not b!77565) (not b!77688) (not d!18425) (not bm!6986) (not d!18429) (not d!18437) (not b!77570) (not b!77568) (not b!77715) (not bm!7042) (not b!77579) (not b!77594) (not d!18453) (not b!77467) (not bm!7043) (not b!77539) (not bm!6966) (not b!77701) (not b!77572) (not b!77526) (not bm!7060) (not b!77582) (not b!77573) (not b!77703) (not b!77468))
(check-sat b_and!4781 b_and!4783 (not b_next!2173) (not b_next!2175))
