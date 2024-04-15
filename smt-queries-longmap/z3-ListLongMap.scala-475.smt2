; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9588 () Bool)

(assert start!9588)

(declare-fun b!70362 () Bool)

(declare-fun b_free!2089 () Bool)

(declare-fun b_next!2089 () Bool)

(assert (=> b!70362 (= b_free!2089 (not b_next!2089))))

(declare-fun tp!8436 () Bool)

(declare-fun b_and!4309 () Bool)

(assert (=> b!70362 (= tp!8436 b_and!4309)))

(declare-fun b!70379 () Bool)

(declare-fun b_free!2091 () Bool)

(declare-fun b_next!2091 () Bool)

(assert (=> b!70379 (= b_free!2091 (not b_next!2091))))

(declare-fun tp!8435 () Bool)

(declare-fun b_and!4311 () Bool)

(assert (=> b!70379 (= tp!8435 b_and!4311)))

(declare-fun b!70360 () Bool)

(declare-fun e!46048 () Bool)

(declare-fun e!46054 () Bool)

(assert (=> b!70360 (= e!46048 e!46054)))

(declare-fun res!37643 () Bool)

(assert (=> b!70360 (=> (not res!37643) (not e!46054))))

(declare-datatypes ((V!2929 0))(
  ( (V!2930 (val!1275 Int)) )
))
(declare-datatypes ((array!3845 0))(
  ( (array!3846 (arr!1834 (Array (_ BitVec 32) (_ BitVec 64))) (size!2072 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!887 0))(
  ( (ValueCellFull!887 (v!2500 V!2929)) (EmptyCell!887) )
))
(declare-datatypes ((array!3847 0))(
  ( (array!3848 (arr!1835 (Array (_ BitVec 32) ValueCell!887)) (size!2073 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!682 0))(
  ( (LongMapFixedSize!683 (defaultEntry!2188 Int) (mask!6142 (_ BitVec 32)) (extraKeys!2051 (_ BitVec 32)) (zeroValue!2092 V!2929) (minValue!2092 V!2929) (_size!390 (_ BitVec 32)) (_keys!3835 array!3845) (_values!2171 array!3847) (_vacant!390 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!478 0))(
  ( (Cell!479 (v!2501 LongMapFixedSize!682)) )
))
(declare-datatypes ((LongMap!478 0))(
  ( (LongMap!479 (underlying!250 Cell!478)) )
))
(declare-fun thiss!992 () LongMap!478)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!70360 (= res!37643 (and (not (= (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!30996 () V!2929)

(declare-fun get!1132 (ValueCell!887 V!2929) V!2929)

(declare-fun dynLambda!322 (Int (_ BitVec 64)) V!2929)

(assert (=> b!70360 (= lt!30996 (get!1132 (select (arr!1835 (_values!2171 (v!2501 (underlying!250 thiss!992)))) from!355) (dynLambda!322 (defaultEntry!2188 (v!2501 (underlying!250 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!70361 () Bool)

(declare-fun e!46053 () Bool)

(declare-fun tp_is_empty!2461 () Bool)

(assert (=> b!70361 (= e!46053 tp_is_empty!2461)))

(declare-fun b!70363 () Bool)

(declare-fun res!37642 () Bool)

(declare-fun e!46050 () Bool)

(assert (=> b!70363 (=> (not res!37642) (not e!46050))))

(assert (=> b!70363 (= res!37642 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2072 (_keys!3835 (v!2501 (underlying!250 thiss!992)))))))))

(declare-fun b!70364 () Bool)

(declare-fun e!46055 () Bool)

(declare-fun mapRes!3121 () Bool)

(assert (=> b!70364 (= e!46055 (and e!46053 mapRes!3121))))

(declare-fun condMapEmpty!3121 () Bool)

(declare-fun mapDefault!3121 () ValueCell!887)

(assert (=> b!70364 (= condMapEmpty!3121 (= (arr!1835 (_values!2171 (v!2501 (underlying!250 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!887)) mapDefault!3121)))))

(declare-fun b!70365 () Bool)

(declare-fun e!46045 () Bool)

(assert (=> b!70365 (= e!46045 tp_is_empty!2461)))

(declare-fun b!70366 () Bool)

(declare-fun e!46039 () Bool)

(assert (=> b!70366 (= e!46039 tp_is_empty!2461)))

(declare-fun b!70367 () Bool)

(declare-fun e!46044 () Bool)

(declare-fun e!46047 () Bool)

(assert (=> b!70367 (= e!46044 e!46047)))

(declare-fun mapIsEmpty!3121 () Bool)

(assert (=> mapIsEmpty!3121 mapRes!3121))

(declare-fun b!70368 () Bool)

(declare-fun e!46052 () Bool)

(declare-fun e!46043 () Bool)

(assert (=> b!70368 (= e!46052 (not e!46043))))

(declare-fun res!37647 () Bool)

(assert (=> b!70368 (=> res!37647 e!46043)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!70368 (= res!37647 (not (validMask!0 (mask!6142 (v!2501 (underlying!250 thiss!992))))))))

(declare-datatypes ((tuple2!2100 0))(
  ( (tuple2!2101 (_1!1061 (_ BitVec 64)) (_2!1061 V!2929)) )
))
(declare-datatypes ((List!1475 0))(
  ( (Nil!1472) (Cons!1471 (h!2057 tuple2!2100) (t!4990 List!1475)) )
))
(declare-datatypes ((ListLongMap!1391 0))(
  ( (ListLongMap!1392 (toList!711 List!1475)) )
))
(declare-fun lt!31002 () ListLongMap!1391)

(declare-fun lt!30994 () tuple2!2100)

(declare-fun lt!30995 () tuple2!2100)

(declare-fun +!90 (ListLongMap!1391 tuple2!2100) ListLongMap!1391)

(assert (=> b!70368 (= (+!90 (+!90 lt!31002 lt!30994) lt!30995) (+!90 (+!90 lt!31002 lt!30995) lt!30994))))

(assert (=> b!70368 (= lt!30995 (tuple2!2101 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2092 (v!2501 (underlying!250 thiss!992)))))))

(assert (=> b!70368 (= lt!30994 (tuple2!2101 (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) lt!30996))))

(declare-datatypes ((Unit!1981 0))(
  ( (Unit!1982) )
))
(declare-fun lt!31005 () Unit!1981)

(declare-fun addCommutativeForDiffKeys!9 (ListLongMap!1391 (_ BitVec 64) V!2929 (_ BitVec 64) V!2929) Unit!1981)

(assert (=> b!70368 (= lt!31005 (addCommutativeForDiffKeys!9 lt!31002 (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) lt!30996 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2092 (v!2501 (underlying!250 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!54 (array!3845 array!3847 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 32) Int) ListLongMap!1391)

(assert (=> b!70368 (= lt!31002 (getCurrentListMapNoExtraKeys!54 (_keys!3835 (v!2501 (underlying!250 thiss!992))) (_values!2171 (v!2501 (underlying!250 thiss!992))) (mask!6142 (v!2501 (underlying!250 thiss!992))) (extraKeys!2051 (v!2501 (underlying!250 thiss!992))) (zeroValue!2092 (v!2501 (underlying!250 thiss!992))) (minValue!2092 (v!2501 (underlying!250 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2501 (underlying!250 thiss!992)))))))

(declare-fun b!70369 () Bool)

(assert (=> b!70369 (= e!46050 e!46048)))

(declare-fun res!37641 () Bool)

(assert (=> b!70369 (=> (not res!37641) (not e!46048))))

(declare-fun lt!31003 () ListLongMap!1391)

(declare-fun lt!30998 () ListLongMap!1391)

(assert (=> b!70369 (= res!37641 (= lt!31003 lt!30998))))

(declare-fun newMap!16 () LongMapFixedSize!682)

(declare-fun map!1142 (LongMapFixedSize!682) ListLongMap!1391)

(assert (=> b!70369 (= lt!30998 (map!1142 newMap!16))))

(declare-fun getCurrentListMap!406 (array!3845 array!3847 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 32) Int) ListLongMap!1391)

(assert (=> b!70369 (= lt!31003 (getCurrentListMap!406 (_keys!3835 (v!2501 (underlying!250 thiss!992))) (_values!2171 (v!2501 (underlying!250 thiss!992))) (mask!6142 (v!2501 (underlying!250 thiss!992))) (extraKeys!2051 (v!2501 (underlying!250 thiss!992))) (zeroValue!2092 (v!2501 (underlying!250 thiss!992))) (minValue!2092 (v!2501 (underlying!250 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2501 (underlying!250 thiss!992)))))))

(declare-fun b!70370 () Bool)

(declare-fun e!46049 () Bool)

(assert (=> b!70370 (= e!46049 tp_is_empty!2461)))

(declare-fun res!37646 () Bool)

(assert (=> start!9588 (=> (not res!37646) (not e!46050))))

(declare-fun valid!293 (LongMap!478) Bool)

(assert (=> start!9588 (= res!37646 (valid!293 thiss!992))))

(assert (=> start!9588 e!46050))

(declare-fun e!46041 () Bool)

(assert (=> start!9588 e!46041))

(assert (=> start!9588 true))

(declare-fun e!46051 () Bool)

(assert (=> start!9588 e!46051))

(declare-fun array_inv!1145 (array!3845) Bool)

(declare-fun array_inv!1146 (array!3847) Bool)

(assert (=> b!70362 (= e!46047 (and tp!8436 tp_is_empty!2461 (array_inv!1145 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) (array_inv!1146 (_values!2171 (v!2501 (underlying!250 thiss!992)))) e!46055))))

(declare-fun b!70371 () Bool)

(declare-fun e!46040 () Bool)

(declare-fun mapRes!3122 () Bool)

(assert (=> b!70371 (= e!46040 (and e!46039 mapRes!3122))))

(declare-fun condMapEmpty!3122 () Bool)

(declare-fun mapDefault!3122 () ValueCell!887)

(assert (=> b!70371 (= condMapEmpty!3122 (= (arr!1835 (_values!2171 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!887)) mapDefault!3122)))))

(declare-fun b!70372 () Bool)

(assert (=> b!70372 (= e!46043 (or (not (= (size!2073 (_values!2171 (v!2501 (underlying!250 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6142 (v!2501 (underlying!250 thiss!992)))))) (not (= (size!2072 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) (size!2073 (_values!2171 (v!2501 (underlying!250 thiss!992)))))) (bvsge (mask!6142 (v!2501 (underlying!250 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3122 () Bool)

(assert (=> mapIsEmpty!3122 mapRes!3122))

(declare-fun b!70373 () Bool)

(assert (=> b!70373 (= e!46041 e!46044)))

(declare-fun mapNonEmpty!3121 () Bool)

(declare-fun tp!8438 () Bool)

(assert (=> mapNonEmpty!3121 (= mapRes!3122 (and tp!8438 e!46045))))

(declare-fun mapKey!3121 () (_ BitVec 32))

(declare-fun mapRest!3121 () (Array (_ BitVec 32) ValueCell!887))

(declare-fun mapValue!3122 () ValueCell!887)

(assert (=> mapNonEmpty!3121 (= (arr!1835 (_values!2171 newMap!16)) (store mapRest!3121 mapKey!3121 mapValue!3122))))

(declare-fun mapNonEmpty!3122 () Bool)

(declare-fun tp!8437 () Bool)

(assert (=> mapNonEmpty!3122 (= mapRes!3121 (and tp!8437 e!46049))))

(declare-fun mapRest!3122 () (Array (_ BitVec 32) ValueCell!887))

(declare-fun mapKey!3122 () (_ BitVec 32))

(declare-fun mapValue!3121 () ValueCell!887)

(assert (=> mapNonEmpty!3122 (= (arr!1835 (_values!2171 (v!2501 (underlying!250 thiss!992)))) (store mapRest!3122 mapKey!3122 mapValue!3121))))

(declare-fun b!70374 () Bool)

(declare-fun res!37645 () Bool)

(assert (=> b!70374 (=> (not res!37645) (not e!46050))))

(declare-fun valid!294 (LongMapFixedSize!682) Bool)

(assert (=> b!70374 (= res!37645 (valid!294 newMap!16))))

(declare-fun b!70375 () Bool)

(declare-fun res!37648 () Bool)

(assert (=> b!70375 (=> (not res!37648) (not e!46050))))

(assert (=> b!70375 (= res!37648 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6142 newMap!16)) (_size!390 (v!2501 (underlying!250 thiss!992)))))))

(declare-fun b!70376 () Bool)

(declare-fun e!46046 () Unit!1981)

(declare-fun Unit!1983 () Unit!1981)

(assert (=> b!70376 (= e!46046 Unit!1983)))

(declare-fun b!70377 () Bool)

(declare-fun Unit!1984 () Unit!1981)

(assert (=> b!70377 (= e!46046 Unit!1984)))

(declare-fun lt!31004 () Unit!1981)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!46 (array!3845 array!3847 (_ BitVec 32) (_ BitVec 32) V!2929 V!2929 (_ BitVec 64) (_ BitVec 32) Int) Unit!1981)

(assert (=> b!70377 (= lt!31004 (lemmaListMapContainsThenArrayContainsFrom!46 (_keys!3835 (v!2501 (underlying!250 thiss!992))) (_values!2171 (v!2501 (underlying!250 thiss!992))) (mask!6142 (v!2501 (underlying!250 thiss!992))) (extraKeys!2051 (v!2501 (underlying!250 thiss!992))) (zeroValue!2092 (v!2501 (underlying!250 thiss!992))) (minValue!2092 (v!2501 (underlying!250 thiss!992))) (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2188 (v!2501 (underlying!250 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!70377 (arrayContainsKey!0 (_keys!3835 (v!2501 (underlying!250 thiss!992))) (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!31001 () Unit!1981)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3845 (_ BitVec 32) (_ BitVec 32)) Unit!1981)

(assert (=> b!70377 (= lt!31001 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3835 (v!2501 (underlying!250 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1476 0))(
  ( (Nil!1473) (Cons!1472 (h!2058 (_ BitVec 64)) (t!4991 List!1476)) )
))
(declare-fun arrayNoDuplicates!0 (array!3845 (_ BitVec 32) List!1476) Bool)

(assert (=> b!70377 (arrayNoDuplicates!0 (_keys!3835 (v!2501 (underlying!250 thiss!992))) from!355 Nil!1473)))

(declare-fun lt!30999 () Unit!1981)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3845 (_ BitVec 32) (_ BitVec 64) List!1476) Unit!1981)

(assert (=> b!70377 (= lt!30999 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3835 (v!2501 (underlying!250 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) (Cons!1472 (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) Nil!1473)))))

(assert (=> b!70377 false))

(declare-fun b!70378 () Bool)

(assert (=> b!70378 (= e!46054 e!46052)))

(declare-fun res!37644 () Bool)

(assert (=> b!70378 (=> (not res!37644) (not e!46052))))

(declare-datatypes ((tuple2!2102 0))(
  ( (tuple2!2103 (_1!1062 Bool) (_2!1062 LongMapFixedSize!682)) )
))
(declare-fun lt!30997 () tuple2!2102)

(assert (=> b!70378 (= res!37644 (and (_1!1062 lt!30997) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!31000 () Unit!1981)

(assert (=> b!70378 (= lt!31000 e!46046)))

(declare-fun c!10185 () Bool)

(declare-fun contains!713 (ListLongMap!1391 (_ BitVec 64)) Bool)

(assert (=> b!70378 (= c!10185 (contains!713 lt!30998 (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355)))))

(declare-fun update!99 (LongMapFixedSize!682 (_ BitVec 64) V!2929) tuple2!2102)

(assert (=> b!70378 (= lt!30997 (update!99 newMap!16 (select (arr!1834 (_keys!3835 (v!2501 (underlying!250 thiss!992)))) from!355) lt!30996))))

(assert (=> b!70379 (= e!46051 (and tp!8435 tp_is_empty!2461 (array_inv!1145 (_keys!3835 newMap!16)) (array_inv!1146 (_values!2171 newMap!16)) e!46040))))

(assert (= (and start!9588 res!37646) b!70363))

(assert (= (and b!70363 res!37642) b!70374))

(assert (= (and b!70374 res!37645) b!70375))

(assert (= (and b!70375 res!37648) b!70369))

(assert (= (and b!70369 res!37641) b!70360))

(assert (= (and b!70360 res!37643) b!70378))

(assert (= (and b!70378 c!10185) b!70377))

(assert (= (and b!70378 (not c!10185)) b!70376))

(assert (= (and b!70378 res!37644) b!70368))

(assert (= (and b!70368 (not res!37647)) b!70372))

(assert (= (and b!70364 condMapEmpty!3121) mapIsEmpty!3121))

(assert (= (and b!70364 (not condMapEmpty!3121)) mapNonEmpty!3122))

(get-info :version)

(assert (= (and mapNonEmpty!3122 ((_ is ValueCellFull!887) mapValue!3121)) b!70370))

(assert (= (and b!70364 ((_ is ValueCellFull!887) mapDefault!3121)) b!70361))

(assert (= b!70362 b!70364))

(assert (= b!70367 b!70362))

(assert (= b!70373 b!70367))

(assert (= start!9588 b!70373))

(assert (= (and b!70371 condMapEmpty!3122) mapIsEmpty!3122))

(assert (= (and b!70371 (not condMapEmpty!3122)) mapNonEmpty!3121))

(assert (= (and mapNonEmpty!3121 ((_ is ValueCellFull!887) mapValue!3122)) b!70365))

(assert (= (and b!70371 ((_ is ValueCellFull!887) mapDefault!3122)) b!70366))

(assert (= b!70379 b!70371))

(assert (= start!9588 b!70379))

(declare-fun b_lambda!3155 () Bool)

(assert (=> (not b_lambda!3155) (not b!70360)))

(declare-fun t!4987 () Bool)

(declare-fun tb!1489 () Bool)

(assert (=> (and b!70362 (= (defaultEntry!2188 (v!2501 (underlying!250 thiss!992))) (defaultEntry!2188 (v!2501 (underlying!250 thiss!992)))) t!4987) tb!1489))

(declare-fun result!2623 () Bool)

(assert (=> tb!1489 (= result!2623 tp_is_empty!2461)))

(assert (=> b!70360 t!4987))

(declare-fun b_and!4313 () Bool)

(assert (= b_and!4309 (and (=> t!4987 result!2623) b_and!4313)))

(declare-fun tb!1491 () Bool)

(declare-fun t!4989 () Bool)

(assert (=> (and b!70379 (= (defaultEntry!2188 newMap!16) (defaultEntry!2188 (v!2501 (underlying!250 thiss!992)))) t!4989) tb!1491))

(declare-fun result!2627 () Bool)

(assert (= result!2627 result!2623))

(assert (=> b!70360 t!4989))

(declare-fun b_and!4315 () Bool)

(assert (= b_and!4311 (and (=> t!4989 result!2627) b_and!4315)))

(declare-fun m!67267 () Bool)

(assert (=> b!70379 m!67267))

(declare-fun m!67269 () Bool)

(assert (=> b!70379 m!67269))

(declare-fun m!67271 () Bool)

(assert (=> b!70377 m!67271))

(declare-fun m!67273 () Bool)

(assert (=> b!70377 m!67273))

(declare-fun m!67275 () Bool)

(assert (=> b!70377 m!67275))

(declare-fun m!67277 () Bool)

(assert (=> b!70377 m!67277))

(assert (=> b!70377 m!67275))

(assert (=> b!70377 m!67275))

(declare-fun m!67279 () Bool)

(assert (=> b!70377 m!67279))

(assert (=> b!70377 m!67275))

(declare-fun m!67281 () Bool)

(assert (=> b!70377 m!67281))

(assert (=> b!70360 m!67275))

(declare-fun m!67283 () Bool)

(assert (=> b!70360 m!67283))

(declare-fun m!67285 () Bool)

(assert (=> b!70360 m!67285))

(assert (=> b!70360 m!67283))

(assert (=> b!70360 m!67285))

(declare-fun m!67287 () Bool)

(assert (=> b!70360 m!67287))

(declare-fun m!67289 () Bool)

(assert (=> b!70362 m!67289))

(declare-fun m!67291 () Bool)

(assert (=> b!70362 m!67291))

(assert (=> b!70378 m!67275))

(assert (=> b!70378 m!67275))

(declare-fun m!67293 () Bool)

(assert (=> b!70378 m!67293))

(assert (=> b!70378 m!67275))

(declare-fun m!67295 () Bool)

(assert (=> b!70378 m!67295))

(declare-fun m!67297 () Bool)

(assert (=> start!9588 m!67297))

(declare-fun m!67299 () Bool)

(assert (=> b!70368 m!67299))

(declare-fun m!67301 () Bool)

(assert (=> b!70368 m!67301))

(declare-fun m!67303 () Bool)

(assert (=> b!70368 m!67303))

(declare-fun m!67305 () Bool)

(assert (=> b!70368 m!67305))

(assert (=> b!70368 m!67301))

(declare-fun m!67307 () Bool)

(assert (=> b!70368 m!67307))

(declare-fun m!67309 () Bool)

(assert (=> b!70368 m!67309))

(assert (=> b!70368 m!67275))

(declare-fun m!67311 () Bool)

(assert (=> b!70368 m!67311))

(assert (=> b!70368 m!67275))

(assert (=> b!70368 m!67303))

(declare-fun m!67313 () Bool)

(assert (=> b!70374 m!67313))

(declare-fun m!67315 () Bool)

(assert (=> mapNonEmpty!3122 m!67315))

(declare-fun m!67317 () Bool)

(assert (=> mapNonEmpty!3121 m!67317))

(declare-fun m!67319 () Bool)

(assert (=> b!70369 m!67319))

(declare-fun m!67321 () Bool)

(assert (=> b!70369 m!67321))

(check-sat (not b!70369) (not b!70377) (not b!70360) b_and!4313 (not start!9588) b_and!4315 tp_is_empty!2461 (not b_next!2089) (not mapNonEmpty!3121) (not b!70378) (not mapNonEmpty!3122) (not b!70362) (not b_lambda!3155) (not b!70379) (not b!70374) (not b_next!2091) (not b!70368))
(check-sat b_and!4313 b_and!4315 (not b_next!2089) (not b_next!2091))
