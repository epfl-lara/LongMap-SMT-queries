; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11058 () Bool)

(assert start!11058)

(declare-fun b!89720 () Bool)

(declare-fun b_free!2269 () Bool)

(declare-fun b_next!2269 () Bool)

(assert (=> b!89720 (= b_free!2269 (not b_next!2269))))

(declare-fun tp!9051 () Bool)

(declare-fun b_and!5377 () Bool)

(assert (=> b!89720 (= tp!9051 b_and!5377)))

(declare-fun b!89716 () Bool)

(declare-fun b_free!2271 () Bool)

(declare-fun b_next!2271 () Bool)

(assert (=> b!89716 (= b_free!2271 (not b_next!2271))))

(declare-fun tp!9054 () Bool)

(declare-fun b_and!5379 () Bool)

(assert (=> b!89716 (= tp!9054 b_and!5379)))

(declare-fun mapNonEmpty!3467 () Bool)

(declare-fun mapRes!3468 () Bool)

(declare-fun tp!9052 () Bool)

(declare-fun e!58383 () Bool)

(assert (=> mapNonEmpty!3467 (= mapRes!3468 (and tp!9052 e!58383))))

(declare-datatypes ((V!3049 0))(
  ( (V!3050 (val!1320 Int)) )
))
(declare-datatypes ((ValueCell!932 0))(
  ( (ValueCellFull!932 (v!2678 V!3049)) (EmptyCell!932) )
))
(declare-fun mapRest!3468 () (Array (_ BitVec 32) ValueCell!932))

(declare-datatypes ((array!4047 0))(
  ( (array!4048 (arr!1924 (Array (_ BitVec 32) (_ BitVec 64))) (size!2172 (_ BitVec 32))) )
))
(declare-datatypes ((array!4049 0))(
  ( (array!4050 (arr!1925 (Array (_ BitVec 32) ValueCell!932)) (size!2173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!772 0))(
  ( (LongMapFixedSize!773 (defaultEntry!2384 Int) (mask!6433 (_ BitVec 32)) (extraKeys!2215 (_ BitVec 32)) (zeroValue!2272 V!3049) (minValue!2272 V!3049) (_size!435 (_ BitVec 32)) (_keys!4063 array!4047) (_values!2367 array!4049) (_vacant!435 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!564 0))(
  ( (Cell!565 (v!2679 LongMapFixedSize!772)) )
))
(declare-datatypes ((LongMap!564 0))(
  ( (LongMap!565 (underlying!293 Cell!564)) )
))
(declare-fun thiss!992 () LongMap!564)

(declare-fun mapValue!3467 () ValueCell!932)

(declare-fun mapKey!3468 () (_ BitVec 32))

(assert (=> mapNonEmpty!3467 (= (arr!1925 (_values!2367 (v!2679 (underlying!293 thiss!992)))) (store mapRest!3468 mapKey!3468 mapValue!3467))))

(declare-fun b!89701 () Bool)

(declare-fun e!58393 () Bool)

(declare-fun e!58392 () Bool)

(declare-fun mapRes!3467 () Bool)

(assert (=> b!89701 (= e!58393 (and e!58392 mapRes!3467))))

(declare-fun condMapEmpty!3467 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!772)

(declare-fun mapDefault!3467 () ValueCell!932)

(assert (=> b!89701 (= condMapEmpty!3467 (= (arr!1925 (_values!2367 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!932)) mapDefault!3467)))))

(declare-fun b!89702 () Bool)

(declare-fun e!58380 () Bool)

(declare-fun e!58377 () Bool)

(assert (=> b!89702 (= e!58380 (and e!58377 mapRes!3468))))

(declare-fun condMapEmpty!3468 () Bool)

(declare-fun mapDefault!3468 () ValueCell!932)

(assert (=> b!89702 (= condMapEmpty!3468 (= (arr!1925 (_values!2367 (v!2679 (underlying!293 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!932)) mapDefault!3468)))))

(declare-fun b!89704 () Bool)

(declare-fun res!45852 () Bool)

(declare-fun e!58384 () Bool)

(assert (=> b!89704 (=> res!45852 e!58384)))

(declare-datatypes ((List!1538 0))(
  ( (Nil!1535) (Cons!1534 (h!2126 (_ BitVec 64)) (t!5303 List!1538)) )
))
(declare-fun arrayNoDuplicates!0 (array!4047 (_ BitVec 32) List!1538) Bool)

(assert (=> b!89704 (= res!45852 (not (arrayNoDuplicates!0 (_keys!4063 (v!2679 (underlying!293 thiss!992))) #b00000000000000000000000000000000 Nil!1535)))))

(declare-fun b!89705 () Bool)

(declare-datatypes ((Unit!2672 0))(
  ( (Unit!2673) )
))
(declare-fun e!58385 () Unit!2672)

(declare-fun Unit!2674 () Unit!2672)

(assert (=> b!89705 (= e!58385 Unit!2674)))

(declare-fun mapIsEmpty!3467 () Bool)

(assert (=> mapIsEmpty!3467 mapRes!3468))

(declare-fun b!89706 () Bool)

(declare-fun e!58391 () Bool)

(declare-fun tp_is_empty!2551 () Bool)

(assert (=> b!89706 (= e!58391 tp_is_empty!2551)))

(declare-fun b!89707 () Bool)

(declare-fun res!45856 () Bool)

(assert (=> b!89707 (=> res!45856 e!58384)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4047 (_ BitVec 32)) Bool)

(assert (=> b!89707 (= res!45856 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (mask!6433 (v!2679 (underlying!293 thiss!992))))))))

(declare-fun b!89708 () Bool)

(declare-fun res!45858 () Bool)

(declare-fun e!58386 () Bool)

(assert (=> b!89708 (=> (not res!45858) (not e!58386))))

(assert (=> b!89708 (= res!45858 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6433 newMap!16)) (_size!435 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun b!89709 () Bool)

(declare-fun e!58387 () Bool)

(assert (=> b!89709 (= e!58386 e!58387)))

(declare-fun res!45860 () Bool)

(assert (=> b!89709 (=> (not res!45860) (not e!58387))))

(declare-datatypes ((tuple2!2226 0))(
  ( (tuple2!2227 (_1!1124 (_ BitVec 64)) (_2!1124 V!3049)) )
))
(declare-datatypes ((List!1539 0))(
  ( (Nil!1536) (Cons!1535 (h!2127 tuple2!2226) (t!5304 List!1539)) )
))
(declare-datatypes ((ListLongMap!1463 0))(
  ( (ListLongMap!1464 (toList!747 List!1539)) )
))
(declare-fun lt!43191 () ListLongMap!1463)

(declare-fun lt!43187 () ListLongMap!1463)

(assert (=> b!89709 (= res!45860 (= lt!43191 lt!43187))))

(declare-fun map!1196 (LongMapFixedSize!772) ListLongMap!1463)

(assert (=> b!89709 (= lt!43187 (map!1196 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!430 (array!4047 array!4049 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!89709 (= lt!43191 (getCurrentListMap!430 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (_values!2367 (v!2679 (underlying!293 thiss!992))) (mask!6433 (v!2679 (underlying!293 thiss!992))) (extraKeys!2215 (v!2679 (underlying!293 thiss!992))) (zeroValue!2272 (v!2679 (underlying!293 thiss!992))) (minValue!2272 (v!2679 (underlying!293 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun b!89710 () Bool)

(declare-fun e!58379 () Bool)

(declare-fun e!58381 () Bool)

(assert (=> b!89710 (= e!58379 e!58381)))

(declare-fun mapNonEmpty!3468 () Bool)

(declare-fun tp!9053 () Bool)

(assert (=> mapNonEmpty!3468 (= mapRes!3467 (and tp!9053 e!58391))))

(declare-fun mapKey!3467 () (_ BitVec 32))

(declare-fun mapRest!3467 () (Array (_ BitVec 32) ValueCell!932))

(declare-fun mapValue!3468 () ValueCell!932)

(assert (=> mapNonEmpty!3468 (= (arr!1925 (_values!2367 newMap!16)) (store mapRest!3467 mapKey!3467 mapValue!3468))))

(declare-fun b!89711 () Bool)

(assert (=> b!89711 (= e!58377 tp_is_empty!2551)))

(declare-fun b!89712 () Bool)

(declare-fun e!58388 () Bool)

(assert (=> b!89712 (= e!58388 e!58379)))

(declare-fun mapIsEmpty!3468 () Bool)

(assert (=> mapIsEmpty!3468 mapRes!3467))

(declare-fun b!89713 () Bool)

(declare-fun res!45854 () Bool)

(assert (=> b!89713 (=> res!45854 e!58384)))

(assert (=> b!89713 (= res!45854 (or (not (= (size!2173 (_values!2367 (v!2679 (underlying!293 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6433 (v!2679 (underlying!293 thiss!992)))))) (not (= (size!2172 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) (size!2173 (_values!2367 (v!2679 (underlying!293 thiss!992)))))) (bvslt (mask!6433 (v!2679 (underlying!293 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2215 (v!2679 (underlying!293 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2215 (v!2679 (underlying!293 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!89714 () Bool)

(declare-fun e!58378 () Bool)

(assert (=> b!89714 (= e!58378 (not e!58384))))

(declare-fun res!45850 () Bool)

(assert (=> b!89714 (=> res!45850 e!58384)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!89714 (= res!45850 (not (validMask!0 (mask!6433 (v!2679 (underlying!293 thiss!992))))))))

(declare-fun lt!43190 () tuple2!2226)

(declare-fun lt!43185 () tuple2!2226)

(declare-fun lt!43186 () ListLongMap!1463)

(declare-fun lt!43176 () ListLongMap!1463)

(declare-fun +!113 (ListLongMap!1463 tuple2!2226) ListLongMap!1463)

(assert (=> b!89714 (= (+!113 lt!43186 lt!43185) (+!113 (+!113 lt!43176 lt!43185) lt!43190))))

(assert (=> b!89714 (= lt!43185 (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2272 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun lt!43192 () Unit!2672)

(declare-fun lt!43189 () V!3049)

(declare-fun addCommutativeForDiffKeys!32 (ListLongMap!1463 (_ BitVec 64) V!3049 (_ BitVec 64) V!3049) Unit!2672)

(assert (=> b!89714 (= lt!43192 (addCommutativeForDiffKeys!32 lt!43176 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) lt!43189 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2272 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun lt!43182 () ListLongMap!1463)

(assert (=> b!89714 (= lt!43182 lt!43186)))

(assert (=> b!89714 (= lt!43186 (+!113 lt!43176 lt!43190))))

(declare-fun lt!43183 () ListLongMap!1463)

(declare-fun lt!43178 () tuple2!2226)

(assert (=> b!89714 (= lt!43182 (+!113 lt!43183 lt!43178))))

(declare-fun lt!43184 () ListLongMap!1463)

(assert (=> b!89714 (= lt!43176 (+!113 lt!43184 lt!43178))))

(assert (=> b!89714 (= lt!43178 (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2272 (v!2679 (underlying!293 thiss!992)))))))

(assert (=> b!89714 (= lt!43183 (+!113 lt!43184 lt!43190))))

(assert (=> b!89714 (= lt!43190 (tuple2!2227 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) lt!43189))))

(declare-fun lt!43179 () Unit!2672)

(assert (=> b!89714 (= lt!43179 (addCommutativeForDiffKeys!32 lt!43184 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) lt!43189 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2272 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!77 (array!4047 array!4049 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!89714 (= lt!43184 (getCurrentListMapNoExtraKeys!77 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (_values!2367 (v!2679 (underlying!293 thiss!992))) (mask!6433 (v!2679 (underlying!293 thiss!992))) (extraKeys!2215 (v!2679 (underlying!293 thiss!992))) (zeroValue!2272 (v!2679 (underlying!293 thiss!992))) (minValue!2272 (v!2679 (underlying!293 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun b!89703 () Bool)

(declare-fun e!58390 () Bool)

(assert (=> b!89703 (= e!58387 e!58390)))

(declare-fun res!45851 () Bool)

(assert (=> b!89703 (=> (not res!45851) (not e!58390))))

(assert (=> b!89703 (= res!45851 (and (not (= (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1220 (ValueCell!932 V!3049) V!3049)

(declare-fun dynLambda!348 (Int (_ BitVec 64)) V!3049)

(assert (=> b!89703 (= lt!43189 (get!1220 (select (arr!1925 (_values!2367 (v!2679 (underlying!293 thiss!992)))) from!355) (dynLambda!348 (defaultEntry!2384 (v!2679 (underlying!293 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!45857 () Bool)

(assert (=> start!11058 (=> (not res!45857) (not e!58386))))

(declare-fun valid!346 (LongMap!564) Bool)

(assert (=> start!11058 (= res!45857 (valid!346 thiss!992))))

(assert (=> start!11058 e!58386))

(assert (=> start!11058 e!58388))

(assert (=> start!11058 true))

(declare-fun e!58389 () Bool)

(assert (=> start!11058 e!58389))

(declare-fun b!89715 () Bool)

(declare-fun Unit!2675 () Unit!2672)

(assert (=> b!89715 (= e!58385 Unit!2675)))

(declare-fun lt!43188 () Unit!2672)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!72 (array!4047 array!4049 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 64) (_ BitVec 32) Int) Unit!2672)

(assert (=> b!89715 (= lt!43188 (lemmaListMapContainsThenArrayContainsFrom!72 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (_values!2367 (v!2679 (underlying!293 thiss!992))) (mask!6433 (v!2679 (underlying!293 thiss!992))) (extraKeys!2215 (v!2679 (underlying!293 thiss!992))) (zeroValue!2272 (v!2679 (underlying!293 thiss!992))) (minValue!2272 (v!2679 (underlying!293 thiss!992))) (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2679 (underlying!293 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!89715 (arrayContainsKey!0 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43177 () Unit!2672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4047 (_ BitVec 32) (_ BitVec 32)) Unit!2672)

(assert (=> b!89715 (= lt!43177 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4063 (v!2679 (underlying!293 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!89715 (arrayNoDuplicates!0 (_keys!4063 (v!2679 (underlying!293 thiss!992))) from!355 Nil!1535)))

(declare-fun lt!43181 () Unit!2672)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4047 (_ BitVec 32) (_ BitVec 64) List!1538) Unit!2672)

(assert (=> b!89715 (= lt!43181 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4063 (v!2679 (underlying!293 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) (Cons!1534 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) Nil!1535)))))

(assert (=> b!89715 false))

(declare-fun array_inv!1207 (array!4047) Bool)

(declare-fun array_inv!1208 (array!4049) Bool)

(assert (=> b!89716 (= e!58389 (and tp!9054 tp_is_empty!2551 (array_inv!1207 (_keys!4063 newMap!16)) (array_inv!1208 (_values!2367 newMap!16)) e!58393))))

(declare-fun b!89717 () Bool)

(assert (=> b!89717 (= e!58392 tp_is_empty!2551)))

(declare-fun b!89718 () Bool)

(declare-fun res!45853 () Bool)

(assert (=> b!89718 (=> (not res!45853) (not e!58386))))

(declare-fun valid!347 (LongMapFixedSize!772) Bool)

(assert (=> b!89718 (= res!45853 (valid!347 newMap!16))))

(declare-fun b!89719 () Bool)

(assert (=> b!89719 (= e!58390 e!58378)))

(declare-fun res!45855 () Bool)

(assert (=> b!89719 (=> (not res!45855) (not e!58378))))

(declare-datatypes ((tuple2!2228 0))(
  ( (tuple2!2229 (_1!1125 Bool) (_2!1125 LongMapFixedSize!772)) )
))
(declare-fun lt!43193 () tuple2!2228)

(assert (=> b!89719 (= res!45855 (and (_1!1125 lt!43193) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43180 () Unit!2672)

(assert (=> b!89719 (= lt!43180 e!58385)))

(declare-fun c!14923 () Bool)

(declare-fun contains!762 (ListLongMap!1463 (_ BitVec 64)) Bool)

(assert (=> b!89719 (= c!14923 (contains!762 lt!43187 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355)))))

(declare-fun update!126 (LongMapFixedSize!772 (_ BitVec 64) V!3049) tuple2!2228)

(assert (=> b!89719 (= lt!43193 (update!126 newMap!16 (select (arr!1924 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) from!355) lt!43189))))

(assert (=> b!89720 (= e!58381 (and tp!9051 tp_is_empty!2551 (array_inv!1207 (_keys!4063 (v!2679 (underlying!293 thiss!992)))) (array_inv!1208 (_values!2367 (v!2679 (underlying!293 thiss!992)))) e!58380))))

(declare-fun b!89721 () Bool)

(assert (=> b!89721 (= e!58383 tp_is_empty!2551)))

(declare-fun b!89722 () Bool)

(assert (=> b!89722 (= e!58384 (bvsle from!355 (size!2172 (_keys!4063 (v!2679 (underlying!293 thiss!992))))))))

(declare-fun b!89723 () Bool)

(declare-fun res!45859 () Bool)

(assert (=> b!89723 (=> (not res!45859) (not e!58386))))

(assert (=> b!89723 (= res!45859 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2172 (_keys!4063 (v!2679 (underlying!293 thiss!992)))))))))

(assert (= (and start!11058 res!45857) b!89723))

(assert (= (and b!89723 res!45859) b!89718))

(assert (= (and b!89718 res!45853) b!89708))

(assert (= (and b!89708 res!45858) b!89709))

(assert (= (and b!89709 res!45860) b!89703))

(assert (= (and b!89703 res!45851) b!89719))

(assert (= (and b!89719 c!14923) b!89715))

(assert (= (and b!89719 (not c!14923)) b!89705))

(assert (= (and b!89719 res!45855) b!89714))

(assert (= (and b!89714 (not res!45850)) b!89713))

(assert (= (and b!89713 (not res!45854)) b!89707))

(assert (= (and b!89707 (not res!45856)) b!89704))

(assert (= (and b!89704 (not res!45852)) b!89722))

(assert (= (and b!89702 condMapEmpty!3468) mapIsEmpty!3467))

(assert (= (and b!89702 (not condMapEmpty!3468)) mapNonEmpty!3467))

(get-info :version)

(assert (= (and mapNonEmpty!3467 ((_ is ValueCellFull!932) mapValue!3467)) b!89721))

(assert (= (and b!89702 ((_ is ValueCellFull!932) mapDefault!3468)) b!89711))

(assert (= b!89720 b!89702))

(assert (= b!89710 b!89720))

(assert (= b!89712 b!89710))

(assert (= start!11058 b!89712))

(assert (= (and b!89701 condMapEmpty!3467) mapIsEmpty!3468))

(assert (= (and b!89701 (not condMapEmpty!3467)) mapNonEmpty!3468))

(assert (= (and mapNonEmpty!3468 ((_ is ValueCellFull!932) mapValue!3468)) b!89706))

(assert (= (and b!89701 ((_ is ValueCellFull!932) mapDefault!3467)) b!89717))

(assert (= b!89716 b!89701))

(assert (= start!11058 b!89716))

(declare-fun b_lambda!3963 () Bool)

(assert (=> (not b_lambda!3963) (not b!89703)))

(declare-fun t!5300 () Bool)

(declare-fun tb!1733 () Bool)

(assert (=> (and b!89720 (= (defaultEntry!2384 (v!2679 (underlying!293 thiss!992))) (defaultEntry!2384 (v!2679 (underlying!293 thiss!992)))) t!5300) tb!1733))

(declare-fun result!2979 () Bool)

(assert (=> tb!1733 (= result!2979 tp_is_empty!2551)))

(assert (=> b!89703 t!5300))

(declare-fun b_and!5381 () Bool)

(assert (= b_and!5377 (and (=> t!5300 result!2979) b_and!5381)))

(declare-fun t!5302 () Bool)

(declare-fun tb!1735 () Bool)

(assert (=> (and b!89716 (= (defaultEntry!2384 newMap!16) (defaultEntry!2384 (v!2679 (underlying!293 thiss!992)))) t!5302) tb!1735))

(declare-fun result!2983 () Bool)

(assert (= result!2983 result!2979))

(assert (=> b!89703 t!5302))

(declare-fun b_and!5383 () Bool)

(assert (= b_and!5379 (and (=> t!5302 result!2983) b_and!5383)))

(declare-fun m!96281 () Bool)

(assert (=> b!89709 m!96281))

(declare-fun m!96283 () Bool)

(assert (=> b!89709 m!96283))

(declare-fun m!96285 () Bool)

(assert (=> b!89707 m!96285))

(declare-fun m!96287 () Bool)

(assert (=> b!89719 m!96287))

(assert (=> b!89719 m!96287))

(declare-fun m!96289 () Bool)

(assert (=> b!89719 m!96289))

(assert (=> b!89719 m!96287))

(declare-fun m!96291 () Bool)

(assert (=> b!89719 m!96291))

(declare-fun m!96293 () Bool)

(assert (=> b!89718 m!96293))

(declare-fun m!96295 () Bool)

(assert (=> b!89716 m!96295))

(declare-fun m!96297 () Bool)

(assert (=> b!89716 m!96297))

(declare-fun m!96299 () Bool)

(assert (=> b!89704 m!96299))

(declare-fun m!96301 () Bool)

(assert (=> b!89714 m!96301))

(declare-fun m!96303 () Bool)

(assert (=> b!89714 m!96303))

(assert (=> b!89714 m!96303))

(declare-fun m!96305 () Bool)

(assert (=> b!89714 m!96305))

(declare-fun m!96307 () Bool)

(assert (=> b!89714 m!96307))

(assert (=> b!89714 m!96287))

(declare-fun m!96309 () Bool)

(assert (=> b!89714 m!96309))

(declare-fun m!96311 () Bool)

(assert (=> b!89714 m!96311))

(assert (=> b!89714 m!96287))

(declare-fun m!96313 () Bool)

(assert (=> b!89714 m!96313))

(declare-fun m!96315 () Bool)

(assert (=> b!89714 m!96315))

(declare-fun m!96317 () Bool)

(assert (=> b!89714 m!96317))

(assert (=> b!89714 m!96287))

(declare-fun m!96319 () Bool)

(assert (=> b!89714 m!96319))

(declare-fun m!96321 () Bool)

(assert (=> b!89714 m!96321))

(declare-fun m!96323 () Bool)

(assert (=> start!11058 m!96323))

(assert (=> b!89703 m!96287))

(declare-fun m!96325 () Bool)

(assert (=> b!89703 m!96325))

(declare-fun m!96327 () Bool)

(assert (=> b!89703 m!96327))

(assert (=> b!89703 m!96325))

(assert (=> b!89703 m!96327))

(declare-fun m!96329 () Bool)

(assert (=> b!89703 m!96329))

(declare-fun m!96331 () Bool)

(assert (=> b!89720 m!96331))

(declare-fun m!96333 () Bool)

(assert (=> b!89720 m!96333))

(declare-fun m!96335 () Bool)

(assert (=> mapNonEmpty!3468 m!96335))

(declare-fun m!96337 () Bool)

(assert (=> b!89715 m!96337))

(declare-fun m!96339 () Bool)

(assert (=> b!89715 m!96339))

(assert (=> b!89715 m!96287))

(declare-fun m!96341 () Bool)

(assert (=> b!89715 m!96341))

(assert (=> b!89715 m!96287))

(assert (=> b!89715 m!96287))

(declare-fun m!96343 () Bool)

(assert (=> b!89715 m!96343))

(assert (=> b!89715 m!96287))

(declare-fun m!96345 () Bool)

(assert (=> b!89715 m!96345))

(declare-fun m!96347 () Bool)

(assert (=> mapNonEmpty!3467 m!96347))

(check-sat (not b!89703) (not b!89707) b_and!5383 (not b_next!2269) (not b_next!2271) (not mapNonEmpty!3467) (not b_lambda!3963) (not b!89719) (not mapNonEmpty!3468) (not b!89709) (not b!89718) (not b!89716) (not b!89715) (not b!89720) b_and!5381 (not b!89714) tp_is_empty!2551 (not start!11058) (not b!89704))
(check-sat b_and!5381 b_and!5383 (not b_next!2269) (not b_next!2271))
