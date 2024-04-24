; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9116 () Bool)

(assert start!9116)

(declare-fun b!64572 () Bool)

(declare-fun b_free!2017 () Bool)

(declare-fun b_next!2017 () Bool)

(assert (=> b!64572 (= b_free!2017 (not b_next!2017))))

(declare-fun tp!8193 () Bool)

(declare-fun b_and!3957 () Bool)

(assert (=> b!64572 (= tp!8193 b_and!3957)))

(declare-fun b!64565 () Bool)

(declare-fun b_free!2019 () Bool)

(declare-fun b_next!2019 () Bool)

(assert (=> b!64565 (= b_free!2019 (not b_next!2019))))

(declare-fun tp!8194 () Bool)

(declare-fun b_and!3959 () Bool)

(assert (=> b!64565 (= tp!8194 b_and!3959)))

(declare-fun e!42309 () Bool)

(declare-fun e!42314 () Bool)

(declare-fun tp_is_empty!2425 () Bool)

(declare-datatypes ((V!2881 0))(
  ( (V!2882 (val!1257 Int)) )
))
(declare-datatypes ((array!3771 0))(
  ( (array!3772 (arr!1802 (Array (_ BitVec 32) (_ BitVec 64))) (size!2036 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!869 0))(
  ( (ValueCellFull!869 (v!2446 V!2881)) (EmptyCell!869) )
))
(declare-datatypes ((array!3773 0))(
  ( (array!3774 (arr!1803 (Array (_ BitVec 32) ValueCell!869)) (size!2037 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!646 0))(
  ( (LongMapFixedSize!647 (defaultEntry!2121 Int) (mask!6043 (_ BitVec 32)) (extraKeys!1994 (_ BitVec 32)) (zeroValue!2030 V!2881) (minValue!2030 V!2881) (_size!372 (_ BitVec 32)) (_keys!3759 array!3771) (_values!2104 array!3773) (_vacant!372 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!646)

(declare-fun array_inv!1105 (array!3771) Bool)

(declare-fun array_inv!1106 (array!3773) Bool)

(assert (=> b!64565 (= e!42309 (and tp!8194 tp_is_empty!2425 (array_inv!1105 (_keys!3759 newMap!16)) (array_inv!1106 (_values!2104 newMap!16)) e!42314))))

(declare-fun b!64566 () Bool)

(declare-fun e!42319 () Bool)

(assert (=> b!64566 (= e!42319 tp_is_empty!2425)))

(declare-fun b!64567 () Bool)

(declare-fun res!35204 () Bool)

(declare-fun e!42311 () Bool)

(assert (=> b!64567 (=> (not res!35204) (not e!42311))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!456 0))(
  ( (Cell!457 (v!2447 LongMapFixedSize!646)) )
))
(declare-datatypes ((LongMap!456 0))(
  ( (LongMap!457 (underlying!239 Cell!456)) )
))
(declare-fun thiss!992 () LongMap!456)

(assert (=> b!64567 (= res!35204 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun b!64568 () Bool)

(declare-fun e!42312 () Bool)

(declare-fun e!42315 () Bool)

(assert (=> b!64568 (= e!42312 e!42315)))

(declare-fun mapIsEmpty!2987 () Bool)

(declare-fun mapRes!2987 () Bool)

(assert (=> mapIsEmpty!2987 mapRes!2987))

(declare-fun mapNonEmpty!2987 () Bool)

(declare-fun tp!8196 () Bool)

(declare-fun e!42323 () Bool)

(assert (=> mapNonEmpty!2987 (= mapRes!2987 (and tp!8196 e!42323))))

(declare-fun mapKey!2988 () (_ BitVec 32))

(declare-fun mapValue!2987 () ValueCell!869)

(declare-fun mapRest!2987 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!2987 (= (arr!1803 (_values!2104 newMap!16)) (store mapRest!2987 mapKey!2988 mapValue!2987))))

(declare-fun b!64569 () Bool)

(declare-fun res!35200 () Bool)

(declare-fun e!42322 () Bool)

(assert (=> b!64569 (=> (not res!35200) (not e!42322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!64569 (= res!35200 (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64570 () Bool)

(declare-fun e!42321 () Bool)

(assert (=> b!64570 (= e!42321 tp_is_empty!2425)))

(declare-fun b!64571 () Bool)

(declare-fun e!42320 () Bool)

(assert (=> b!64571 (= e!42311 e!42320)))

(declare-fun res!35207 () Bool)

(assert (=> b!64571 (=> (not res!35207) (not e!42320))))

(declare-datatypes ((tuple2!2048 0))(
  ( (tuple2!2049 (_1!1035 (_ BitVec 64)) (_2!1035 V!2881)) )
))
(declare-datatypes ((List!1438 0))(
  ( (Nil!1435) (Cons!1434 (h!2018 tuple2!2048) (t!4860 List!1438)) )
))
(declare-datatypes ((ListLongMap!1361 0))(
  ( (ListLongMap!1362 (toList!696 List!1438)) )
))
(declare-fun lt!27506 () ListLongMap!1361)

(declare-fun lt!27503 () ListLongMap!1361)

(assert (=> b!64571 (= res!35207 (and (= lt!27506 lt!27503) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1126 (LongMapFixedSize!646) ListLongMap!1361)

(assert (=> b!64571 (= lt!27503 (map!1126 newMap!16))))

(declare-fun getCurrentListMap!396 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) ListLongMap!1361)

(assert (=> b!64571 (= lt!27506 (getCurrentListMap!396 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun e!42316 () Bool)

(assert (=> b!64572 (= e!42315 (and tp!8193 tp_is_empty!2425 (array_inv!1105 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (array_inv!1106 (_values!2104 (v!2447 (underlying!239 thiss!992)))) e!42316))))

(declare-fun b!64573 () Bool)

(assert (=> b!64573 (= e!42314 (and e!42321 mapRes!2987))))

(declare-fun condMapEmpty!2987 () Bool)

(declare-fun mapDefault!2987 () ValueCell!869)

(assert (=> b!64573 (= condMapEmpty!2987 (= (arr!1803 (_values!2104 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!2987)))))

(declare-fun b!64574 () Bool)

(declare-datatypes ((List!1439 0))(
  ( (Nil!1436) (Cons!1435 (h!2019 (_ BitVec 64)) (t!4861 List!1439)) )
))
(declare-fun arrayNoDuplicates!0 (array!3771 (_ BitVec 32) List!1439) Bool)

(assert (=> b!64574 (= e!42322 (not (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1436)))))

(declare-fun b!64575 () Bool)

(declare-fun res!35205 () Bool)

(assert (=> b!64575 (=> (not res!35205) (not e!42322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3771 (_ BitVec 32)) Bool)

(assert (=> b!64575 (= res!35205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64576 () Bool)

(declare-fun e!42313 () Bool)

(declare-fun mapRes!2988 () Bool)

(assert (=> b!64576 (= e!42316 (and e!42313 mapRes!2988))))

(declare-fun condMapEmpty!2988 () Bool)

(declare-fun mapDefault!2988 () ValueCell!869)

(assert (=> b!64576 (= condMapEmpty!2988 (= (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!2988)))))

(declare-fun b!64577 () Bool)

(declare-fun res!35203 () Bool)

(assert (=> b!64577 (=> (not res!35203) (not e!42311))))

(assert (=> b!64577 (= res!35203 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6043 newMap!16)) (_size!372 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64578 () Bool)

(assert (=> b!64578 (= e!42320 e!42322)))

(declare-fun res!35201 () Bool)

(assert (=> b!64578 (=> (not res!35201) (not e!42322))))

(declare-datatypes ((tuple2!2050 0))(
  ( (tuple2!2051 (_1!1036 Bool) (_2!1036 LongMapFixedSize!646)) )
))
(declare-fun lt!27505 () tuple2!2050)

(assert (=> b!64578 (= res!35201 (and (_1!1036 lt!27505) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1776 0))(
  ( (Unit!1777) )
))
(declare-fun lt!27502 () Unit!1776)

(declare-fun e!42317 () Unit!1776)

(assert (=> b!64578 (= lt!27502 e!42317)))

(declare-fun c!8832 () Bool)

(declare-fun contains!694 (ListLongMap!1361 (_ BitVec 64)) Bool)

(assert (=> b!64578 (= c!8832 (contains!694 lt!27503 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun update!94 (LongMapFixedSize!646 (_ BitVec 64) V!2881) tuple2!2050)

(declare-fun get!1102 (ValueCell!869 V!2881) V!2881)

(declare-fun dynLambda!312 (Int (_ BitVec 64)) V!2881)

(assert (=> b!64578 (= lt!27505 (update!94 newMap!16 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64579 () Bool)

(assert (=> b!64579 (= e!42323 tp_is_empty!2425)))

(declare-fun mapNonEmpty!2988 () Bool)

(declare-fun tp!8195 () Bool)

(assert (=> mapNonEmpty!2988 (= mapRes!2988 (and tp!8195 e!42319))))

(declare-fun mapRest!2988 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapKey!2987 () (_ BitVec 32))

(declare-fun mapValue!2988 () ValueCell!869)

(assert (=> mapNonEmpty!2988 (= (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (store mapRest!2988 mapKey!2987 mapValue!2988))))

(declare-fun b!64580 () Bool)

(declare-fun res!35208 () Bool)

(assert (=> b!64580 (=> (not res!35208) (not e!42322))))

(assert (=> b!64580 (= res!35208 (and (= (size!2037 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6043 (v!2447 (underlying!239 thiss!992))))) (= (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (size!2037 (_values!2104 (v!2447 (underlying!239 thiss!992))))) (bvsge (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!64581 () Bool)

(declare-fun Unit!1778 () Unit!1776)

(assert (=> b!64581 (= e!42317 Unit!1778)))

(declare-fun b!64582 () Bool)

(declare-fun res!35206 () Bool)

(assert (=> b!64582 (=> (not res!35206) (not e!42311))))

(declare-fun valid!276 (LongMapFixedSize!646) Bool)

(assert (=> b!64582 (= res!35206 (valid!276 newMap!16))))

(declare-fun b!64583 () Bool)

(assert (=> b!64583 (= e!42313 tp_is_empty!2425)))

(declare-fun res!35202 () Bool)

(assert (=> start!9116 (=> (not res!35202) (not e!42311))))

(declare-fun valid!277 (LongMap!456) Bool)

(assert (=> start!9116 (= res!35202 (valid!277 thiss!992))))

(assert (=> start!9116 e!42311))

(declare-fun e!42310 () Bool)

(assert (=> start!9116 e!42310))

(assert (=> start!9116 true))

(assert (=> start!9116 e!42309))

(declare-fun b!64584 () Bool)

(assert (=> b!64584 (= e!42310 e!42312)))

(declare-fun b!64585 () Bool)

(declare-fun Unit!1779 () Unit!1776)

(assert (=> b!64585 (= e!42317 Unit!1779)))

(declare-fun lt!27504 () Unit!1776)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!31 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1776)

(assert (=> b!64585 (= lt!27504 (lemmaListMapContainsThenArrayContainsFrom!31 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!64585 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27507 () Unit!1776)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3771 (_ BitVec 32) (_ BitVec 32)) Unit!1776)

(assert (=> b!64585 (= lt!27507 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!64585 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1436)))

(declare-fun lt!27501 () Unit!1776)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3771 (_ BitVec 32) (_ BitVec 64) List!1439) Unit!1776)

(assert (=> b!64585 (= lt!27501 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436)))))

(assert (=> b!64585 false))

(declare-fun mapIsEmpty!2988 () Bool)

(assert (=> mapIsEmpty!2988 mapRes!2988))

(assert (= (and start!9116 res!35202) b!64567))

(assert (= (and b!64567 res!35204) b!64582))

(assert (= (and b!64582 res!35206) b!64577))

(assert (= (and b!64577 res!35203) b!64571))

(assert (= (and b!64571 res!35207) b!64578))

(assert (= (and b!64578 c!8832) b!64585))

(assert (= (and b!64578 (not c!8832)) b!64581))

(assert (= (and b!64578 res!35201) b!64569))

(assert (= (and b!64569 res!35200) b!64580))

(assert (= (and b!64580 res!35208) b!64575))

(assert (= (and b!64575 res!35205) b!64574))

(assert (= (and b!64576 condMapEmpty!2988) mapIsEmpty!2988))

(assert (= (and b!64576 (not condMapEmpty!2988)) mapNonEmpty!2988))

(get-info :version)

(assert (= (and mapNonEmpty!2988 ((_ is ValueCellFull!869) mapValue!2988)) b!64566))

(assert (= (and b!64576 ((_ is ValueCellFull!869) mapDefault!2988)) b!64583))

(assert (= b!64572 b!64576))

(assert (= b!64568 b!64572))

(assert (= b!64584 b!64568))

(assert (= start!9116 b!64584))

(assert (= (and b!64573 condMapEmpty!2987) mapIsEmpty!2987))

(assert (= (and b!64573 (not condMapEmpty!2987)) mapNonEmpty!2987))

(assert (= (and mapNonEmpty!2987 ((_ is ValueCellFull!869) mapValue!2987)) b!64579))

(assert (= (and b!64573 ((_ is ValueCellFull!869) mapDefault!2987)) b!64570))

(assert (= b!64565 b!64573))

(assert (= start!9116 b!64565))

(declare-fun b_lambda!2907 () Bool)

(assert (=> (not b_lambda!2907) (not b!64578)))

(declare-fun t!4857 () Bool)

(declare-fun tb!1397 () Bool)

(assert (=> (and b!64572 (= (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) t!4857) tb!1397))

(declare-fun result!2487 () Bool)

(assert (=> tb!1397 (= result!2487 tp_is_empty!2425)))

(assert (=> b!64578 t!4857))

(declare-fun b_and!3961 () Bool)

(assert (= b_and!3957 (and (=> t!4857 result!2487) b_and!3961)))

(declare-fun tb!1399 () Bool)

(declare-fun t!4859 () Bool)

(assert (=> (and b!64565 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) t!4859) tb!1399))

(declare-fun result!2491 () Bool)

(assert (= result!2491 result!2487))

(assert (=> b!64578 t!4859))

(declare-fun b_and!3963 () Bool)

(assert (= b_and!3959 (and (=> t!4859 result!2491) b_and!3963)))

(declare-fun m!59249 () Bool)

(assert (=> b!64569 m!59249))

(declare-fun m!59251 () Bool)

(assert (=> b!64585 m!59251))

(declare-fun m!59253 () Bool)

(assert (=> b!64585 m!59253))

(declare-fun m!59255 () Bool)

(assert (=> b!64585 m!59255))

(declare-fun m!59257 () Bool)

(assert (=> b!64585 m!59257))

(assert (=> b!64585 m!59255))

(assert (=> b!64585 m!59255))

(declare-fun m!59259 () Bool)

(assert (=> b!64585 m!59259))

(assert (=> b!64585 m!59255))

(declare-fun m!59261 () Bool)

(assert (=> b!64585 m!59261))

(declare-fun m!59263 () Bool)

(assert (=> b!64572 m!59263))

(declare-fun m!59265 () Bool)

(assert (=> b!64572 m!59265))

(declare-fun m!59267 () Bool)

(assert (=> b!64575 m!59267))

(declare-fun m!59269 () Bool)

(assert (=> b!64574 m!59269))

(declare-fun m!59271 () Bool)

(assert (=> b!64582 m!59271))

(assert (=> b!64571 m!59255))

(declare-fun m!59273 () Bool)

(assert (=> b!64571 m!59273))

(declare-fun m!59275 () Bool)

(assert (=> b!64571 m!59275))

(declare-fun m!59277 () Bool)

(assert (=> start!9116 m!59277))

(declare-fun m!59279 () Bool)

(assert (=> mapNonEmpty!2988 m!59279))

(declare-fun m!59281 () Bool)

(assert (=> mapNonEmpty!2987 m!59281))

(declare-fun m!59283 () Bool)

(assert (=> b!64565 m!59283))

(declare-fun m!59285 () Bool)

(assert (=> b!64565 m!59285))

(declare-fun m!59287 () Bool)

(assert (=> b!64578 m!59287))

(declare-fun m!59289 () Bool)

(assert (=> b!64578 m!59289))

(declare-fun m!59291 () Bool)

(assert (=> b!64578 m!59291))

(assert (=> b!64578 m!59255))

(declare-fun m!59293 () Bool)

(assert (=> b!64578 m!59293))

(assert (=> b!64578 m!59255))

(assert (=> b!64578 m!59289))

(assert (=> b!64578 m!59255))

(assert (=> b!64578 m!59291))

(declare-fun m!59295 () Bool)

(assert (=> b!64578 m!59295))

(assert (=> b!64578 m!59287))

(check-sat (not b!64569) (not b_next!2019) (not b!64565) b_and!3963 tp_is_empty!2425 (not b_lambda!2907) (not b!64572) (not b!64574) (not b!64582) (not b!64585) (not mapNonEmpty!2988) (not b_next!2017) (not b!64575) (not b!64571) (not mapNonEmpty!2987) b_and!3961 (not b!64578) (not start!9116))
(check-sat b_and!3961 b_and!3963 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun b_lambda!2913 () Bool)

(assert (= b_lambda!2907 (or (and b!64572 b_free!2017) (and b!64565 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))))) b_lambda!2913)))

(check-sat (not b!64569) (not b_next!2019) (not b!64565) b_and!3963 tp_is_empty!2425 (not b_lambda!2913) (not b!64572) (not b!64574) (not b!64582) (not b!64585) (not mapNonEmpty!2988) (not b_next!2017) (not b!64575) (not b!64571) (not mapNonEmpty!2987) b_and!3961 (not b!64578) (not start!9116))
(check-sat b_and!3961 b_and!3963 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun d!13509 () Bool)

(declare-fun res!35269 () Bool)

(declare-fun e!42422 () Bool)

(assert (=> d!13509 (=> (not res!35269) (not e!42422))))

(declare-fun simpleValid!46 (LongMapFixedSize!646) Bool)

(assert (=> d!13509 (= res!35269 (simpleValid!46 newMap!16))))

(assert (=> d!13509 (= (valid!276 newMap!16) e!42422)))

(declare-fun b!64724 () Bool)

(declare-fun res!35270 () Bool)

(assert (=> b!64724 (=> (not res!35270) (not e!42422))))

(declare-fun arrayCountValidKeys!0 (array!3771 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!64724 (= res!35270 (= (arrayCountValidKeys!0 (_keys!3759 newMap!16) #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (_size!372 newMap!16)))))

(declare-fun b!64725 () Bool)

(declare-fun res!35271 () Bool)

(assert (=> b!64725 (=> (not res!35271) (not e!42422))))

(assert (=> b!64725 (= res!35271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun b!64726 () Bool)

(assert (=> b!64726 (= e!42422 (arrayNoDuplicates!0 (_keys!3759 newMap!16) #b00000000000000000000000000000000 Nil!1436))))

(assert (= (and d!13509 res!35269) b!64724))

(assert (= (and b!64724 res!35270) b!64725))

(assert (= (and b!64725 res!35271) b!64726))

(declare-fun m!59393 () Bool)

(assert (=> d!13509 m!59393))

(declare-fun m!59395 () Bool)

(assert (=> b!64724 m!59395))

(declare-fun m!59397 () Bool)

(assert (=> b!64725 m!59397))

(declare-fun m!59399 () Bool)

(assert (=> b!64726 m!59399))

(assert (=> b!64582 d!13509))

(declare-fun d!13511 () Bool)

(declare-fun e!42428 () Bool)

(assert (=> d!13511 e!42428))

(declare-fun res!35274 () Bool)

(assert (=> d!13511 (=> res!35274 e!42428)))

(declare-fun lt!27561 () Bool)

(assert (=> d!13511 (= res!35274 (not lt!27561))))

(declare-fun lt!27560 () Bool)

(assert (=> d!13511 (= lt!27561 lt!27560)))

(declare-fun lt!27558 () Unit!1776)

(declare-fun e!42427 () Unit!1776)

(assert (=> d!13511 (= lt!27558 e!42427)))

(declare-fun c!8841 () Bool)

(assert (=> d!13511 (= c!8841 lt!27560)))

(declare-fun containsKey!132 (List!1438 (_ BitVec 64)) Bool)

(assert (=> d!13511 (= lt!27560 (containsKey!132 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13511 (= (contains!694 lt!27503 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27561)))

(declare-fun b!64733 () Bool)

(declare-fun lt!27559 () Unit!1776)

(assert (=> b!64733 (= e!42427 lt!27559)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!80 (List!1438 (_ BitVec 64)) Unit!1776)

(assert (=> b!64733 (= lt!27559 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-datatypes ((Option!135 0))(
  ( (Some!134 (v!2453 V!2881)) (None!133) )
))
(declare-fun isDefined!81 (Option!135) Bool)

(declare-fun getValueByKey!129 (List!1438 (_ BitVec 64)) Option!135)

(assert (=> b!64733 (isDefined!81 (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64734 () Bool)

(declare-fun Unit!1783 () Unit!1776)

(assert (=> b!64734 (= e!42427 Unit!1783)))

(declare-fun b!64735 () Bool)

(assert (=> b!64735 (= e!42428 (isDefined!81 (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13511 c!8841) b!64733))

(assert (= (and d!13511 (not c!8841)) b!64734))

(assert (= (and d!13511 (not res!35274)) b!64735))

(assert (=> d!13511 m!59255))

(declare-fun m!59401 () Bool)

(assert (=> d!13511 m!59401))

(assert (=> b!64733 m!59255))

(declare-fun m!59403 () Bool)

(assert (=> b!64733 m!59403))

(assert (=> b!64733 m!59255))

(declare-fun m!59405 () Bool)

(assert (=> b!64733 m!59405))

(assert (=> b!64733 m!59405))

(declare-fun m!59407 () Bool)

(assert (=> b!64733 m!59407))

(assert (=> b!64735 m!59255))

(assert (=> b!64735 m!59405))

(assert (=> b!64735 m!59405))

(assert (=> b!64735 m!59407))

(assert (=> b!64578 d!13511))

(declare-fun b!64820 () Bool)

(declare-fun e!42476 () ListLongMap!1361)

(declare-fun call!5267 () ListLongMap!1361)

(assert (=> b!64820 (= e!42476 call!5267)))

(declare-fun b!64821 () Bool)

(declare-fun res!35307 () Bool)

(declare-datatypes ((SeekEntryResult!225 0))(
  ( (MissingZero!225 (index!3027 (_ BitVec 32))) (Found!225 (index!3028 (_ BitVec 32))) (Intermediate!225 (undefined!1037 Bool) (index!3029 (_ BitVec 32)) (x!10536 (_ BitVec 32))) (Undefined!225) (MissingVacant!225 (index!3030 (_ BitVec 32))) )
))
(declare-fun lt!27627 () SeekEntryResult!225)

(assert (=> b!64821 (= res!35307 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3030 lt!27627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42485 () Bool)

(assert (=> b!64821 (=> (not res!35307) (not e!42485))))

(declare-fun bm!5251 () Bool)

(declare-fun call!5263 () Bool)

(declare-fun call!5257 () Bool)

(assert (=> bm!5251 (= call!5263 call!5257)))

(declare-fun bm!5252 () Bool)

(declare-fun call!5260 () Bool)

(declare-fun call!5277 () Bool)

(assert (=> bm!5252 (= call!5260 call!5277)))

(declare-fun bm!5253 () Bool)

(declare-fun call!5269 () ListLongMap!1361)

(assert (=> bm!5253 (= call!5267 call!5269)))

(declare-fun b!64822 () Bool)

(declare-fun e!42479 () tuple2!2050)

(declare-fun e!42483 () tuple2!2050)

(assert (=> b!64822 (= e!42479 e!42483)))

(declare-fun c!8880 () Bool)

(declare-fun lt!27623 () SeekEntryResult!225)

(assert (=> b!64822 (= c!8880 ((_ is MissingZero!225) lt!27623))))

(declare-fun lt!27620 () SeekEntryResult!225)

(declare-fun c!8872 () Bool)

(declare-fun lt!27635 () SeekEntryResult!225)

(declare-fun c!8879 () Bool)

(declare-fun lt!27618 () SeekEntryResult!225)

(declare-fun c!8878 () Bool)

(declare-fun bm!5254 () Bool)

(declare-fun c!8877 () Bool)

(declare-fun c!8881 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5254 (= call!5257 (inRange!0 (ite c!8872 (ite c!8878 (index!3028 lt!27635) (ite c!8879 (index!3027 lt!27618) (index!3030 lt!27618))) (ite c!8877 (index!3028 lt!27620) (ite c!8881 (index!3027 lt!27627) (index!3030 lt!27627)))) (mask!6043 newMap!16)))))

(declare-fun bm!5255 () Bool)

(declare-fun call!5266 () Bool)

(assert (=> bm!5255 (= call!5266 call!5263)))

(declare-fun b!64823 () Bool)

(declare-fun res!35314 () Bool)

(declare-fun e!42477 () Bool)

(assert (=> b!64823 (=> (not res!35314) (not e!42477))))

(assert (=> b!64823 (= res!35314 call!5260)))

(declare-fun e!42494 () Bool)

(assert (=> b!64823 (= e!42494 e!42477)))

(declare-fun b!64824 () Bool)

(declare-fun res!35305 () Bool)

(assert (=> b!64824 (= res!35305 call!5263)))

(declare-fun e!42480 () Bool)

(assert (=> b!64824 (=> (not res!35305) (not e!42480))))

(declare-fun b!64825 () Bool)

(declare-fun e!42489 () Bool)

(declare-fun e!42491 () Bool)

(assert (=> b!64825 (= e!42489 e!42491)))

(declare-fun res!35315 () Bool)

(assert (=> b!64825 (= res!35315 call!5266)))

(assert (=> b!64825 (=> (not res!35315) (not e!42491))))

(declare-fun b!64826 () Bool)

(declare-fun call!5258 () Bool)

(assert (=> b!64826 (= e!42477 (not call!5258))))

(declare-fun b!64827 () Bool)

(declare-fun e!42486 () tuple2!2050)

(declare-fun e!42482 () tuple2!2050)

(assert (=> b!64827 (= e!42486 e!42482)))

(declare-fun c!8875 () Bool)

(assert (=> b!64827 (= c!8875 (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64828 () Bool)

(declare-fun lt!27640 () Unit!1776)

(declare-fun lt!27639 () Unit!1776)

(assert (=> b!64828 (= lt!27640 lt!27639)))

(declare-fun call!5262 () Bool)

(assert (=> b!64828 call!5262))

(declare-fun lt!27630 () array!3773)

(declare-fun lemmaValidKeyInArrayIsInListMap!79 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) Unit!1776)

(assert (=> b!64828 (= lt!27639 (lemmaValidKeyInArrayIsInListMap!79 (_keys!3759 newMap!16) lt!27630 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64828 (= lt!27630 (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))))))

(declare-fun lt!27619 () Unit!1776)

(declare-fun lt!27624 () Unit!1776)

(assert (=> b!64828 (= lt!27619 lt!27624)))

(declare-fun call!5264 () ListLongMap!1361)

(assert (=> b!64828 (= call!5264 call!5267)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1776)

(assert (=> b!64828 (= lt!27624 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27637 () Unit!1776)

(declare-fun e!42478 () Unit!1776)

(assert (=> b!64828 (= lt!27637 e!42478)))

(assert (=> b!64828 (= c!8877 (contains!694 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!64828 (= e!42483 (tuple2!2051 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (_size!372 newMap!16) (_keys!3759 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))) (_vacant!372 newMap!16))))))

(declare-fun b!64829 () Bool)

(assert (=> b!64829 (= e!42485 (not call!5258))))

(declare-fun bm!5256 () Bool)

(declare-fun call!5276 () ListLongMap!1361)

(assert (=> bm!5256 (= call!5276 call!5264)))

(declare-fun b!64830 () Bool)

(declare-fun lt!27638 () tuple2!2050)

(declare-fun call!5256 () tuple2!2050)

(assert (=> b!64830 (= lt!27638 call!5256)))

(assert (=> b!64830 (= e!42483 (tuple2!2051 (_1!1036 lt!27638) (_2!1036 lt!27638)))))

(declare-fun b!64831 () Bool)

(declare-fun e!42490 () tuple2!2050)

(assert (=> b!64831 (= e!42486 e!42490)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3771 (_ BitVec 32)) SeekEntryResult!225)

(assert (=> b!64831 (= lt!27623 (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(assert (=> b!64831 (= c!8872 ((_ is Undefined!225) lt!27623))))

(declare-fun b!64832 () Bool)

(declare-fun lt!27633 () Unit!1776)

(declare-fun lt!27617 () Unit!1776)

(assert (=> b!64832 (= lt!27633 lt!27617)))

(declare-fun call!5261 () ListLongMap!1361)

(assert (=> b!64832 (= call!5276 call!5261)))

(declare-fun lt!27636 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1776)

(assert (=> b!64832 (= lt!27617 (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27636 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64832 (= lt!27636 (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!64832 (= e!42482 (tuple2!2051 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6043 newMap!16) (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) (zeroValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!372 newMap!16) (_keys!3759 newMap!16) (_values!2104 newMap!16) (_vacant!372 newMap!16))))))

(declare-fun bm!5257 () Bool)

(assert (=> bm!5257 (= call!5277 call!5257)))

(declare-fun b!64833 () Bool)

(declare-fun e!42473 () Bool)

(declare-fun call!5255 () Bool)

(assert (=> b!64833 (= e!42473 (not call!5255))))

(declare-fun b!64834 () Bool)

(declare-fun res!35311 () Bool)

(assert (=> b!64834 (=> (not res!35311) (not e!42477))))

(assert (=> b!64834 (= res!35311 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3027 lt!27627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64835 () Bool)

(declare-fun e!42481 () Bool)

(declare-fun call!5268 () ListLongMap!1361)

(declare-fun call!5265 () ListLongMap!1361)

(assert (=> b!64835 (= e!42481 (= call!5268 call!5265))))

(declare-fun b!64836 () Bool)

(assert (=> b!64836 (= e!42489 ((_ is Undefined!225) lt!27618))))

(declare-fun b!64837 () Bool)

(assert (=> b!64837 (= e!42491 (not call!5255))))

(declare-fun b!64838 () Bool)

(declare-fun c!8874 () Bool)

(assert (=> b!64838 (= c!8874 ((_ is MissingVacant!225) lt!27627))))

(declare-fun e!42488 () Bool)

(assert (=> b!64838 (= e!42494 e!42488)))

(declare-fun bm!5258 () Bool)

(declare-fun call!5259 () Bool)

(assert (=> bm!5258 (= call!5259 (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!5259 () Bool)

(assert (=> bm!5259 (= call!5261 call!5269)))

(declare-fun b!64839 () Bool)

(declare-fun e!42475 () ListLongMap!1361)

(assert (=> b!64839 (= e!42475 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!64840 () Bool)

(declare-fun e!42493 () Bool)

(assert (=> b!64840 (= e!42493 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27620)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64841 () Bool)

(declare-fun Unit!1784 () Unit!1776)

(assert (=> b!64841 (= e!42478 Unit!1784)))

(declare-fun lt!27642 () Unit!1776)

(declare-fun call!5270 () Unit!1776)

(assert (=> b!64841 (= lt!27642 call!5270)))

(declare-fun call!5275 () SeekEntryResult!225)

(assert (=> b!64841 (= lt!27627 call!5275)))

(assert (=> b!64841 (= c!8881 ((_ is MissingZero!225) lt!27627))))

(assert (=> b!64841 e!42494))

(declare-fun lt!27625 () Unit!1776)

(assert (=> b!64841 (= lt!27625 lt!27642)))

(assert (=> b!64841 false))

(declare-fun b!64842 () Bool)

(declare-fun lt!27629 () tuple2!2050)

(assert (=> b!64842 (= e!42479 (tuple2!2051 (_1!1036 lt!27629) (_2!1036 lt!27629)))))

(assert (=> b!64842 (= lt!27629 call!5256)))

(declare-fun bm!5260 () Bool)

(declare-fun c!8871 () Bool)

(assert (=> bm!5260 (= call!5269 (getCurrentListMap!396 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun bm!5261 () Bool)

(assert (=> bm!5261 (= call!5258 call!5259)))

(declare-fun b!64843 () Bool)

(declare-fun res!35316 () Bool)

(assert (=> b!64843 (= res!35316 call!5277)))

(assert (=> b!64843 (=> (not res!35316) (not e!42493))))

(declare-fun b!64844 () Bool)

(declare-fun lt!27632 () Unit!1776)

(declare-fun lt!27622 () Unit!1776)

(assert (=> b!64844 (= lt!27632 lt!27622)))

(declare-fun call!5273 () ListLongMap!1361)

(assert (=> b!64844 (= call!5276 call!5273)))

(declare-fun lt!27634 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!19 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1776)

(assert (=> b!64844 (= lt!27622 (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27634 (zeroValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)))))

(assert (=> b!64844 (= lt!27634 (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!64844 (= e!42482 (tuple2!2051 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6043 newMap!16) (bvor (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (_size!372 newMap!16) (_keys!3759 newMap!16) (_values!2104 newMap!16) (_vacant!372 newMap!16))))))

(declare-fun b!64845 () Bool)

(assert (=> b!64845 (= e!42488 ((_ is Undefined!225) lt!27627))))

(declare-fun b!64846 () Bool)

(declare-fun lt!27616 () Unit!1776)

(declare-fun e!42474 () Unit!1776)

(assert (=> b!64846 (= lt!27616 e!42474)))

(assert (=> b!64846 (= c!8878 call!5262)))

(assert (=> b!64846 (= e!42490 (tuple2!2051 false newMap!16))))

(declare-fun b!64847 () Bool)

(declare-fun res!35304 () Bool)

(assert (=> b!64847 (= res!35304 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3030 lt!27618)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64847 (=> (not res!35304) (not e!42491))))

(declare-fun b!64848 () Bool)

(declare-fun c!8873 () Bool)

(assert (=> b!64848 (= c!8873 ((_ is MissingVacant!225) lt!27623))))

(assert (=> b!64848 (= e!42490 e!42479)))

(declare-fun b!64849 () Bool)

(declare-fun call!5254 () ListLongMap!1361)

(assert (=> b!64849 (= e!42476 call!5254)))

(declare-fun bm!5262 () Bool)

(declare-fun lt!27641 () tuple2!2050)

(assert (=> bm!5262 (= call!5268 (map!1126 (_2!1036 lt!27641)))))

(declare-fun d!13513 () Bool)

(declare-fun e!42487 () Bool)

(assert (=> d!13513 e!42487))

(declare-fun res!35313 () Bool)

(assert (=> d!13513 (=> (not res!35313) (not e!42487))))

(assert (=> d!13513 (= res!35313 (valid!276 (_2!1036 lt!27641)))))

(assert (=> d!13513 (= lt!27641 e!42486)))

(assert (=> d!13513 (= c!8871 (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvneg (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (=> d!13513 (valid!276 newMap!16)))

(assert (=> d!13513 (= (update!94 newMap!16 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!27641)))

(declare-fun b!64850 () Bool)

(declare-fun res!35303 () Bool)

(assert (=> b!64850 (=> (not res!35303) (not e!42473))))

(assert (=> b!64850 (= res!35303 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3027 lt!27618)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64851 () Bool)

(declare-fun e!42492 () Bool)

(declare-fun +!84 (ListLongMap!1361 tuple2!2048) ListLongMap!1361)

(assert (=> b!64851 (= e!42492 (= call!5268 (+!84 call!5265 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64852 () Bool)

(declare-fun Unit!1785 () Unit!1776)

(assert (=> b!64852 (= e!42474 Unit!1785)))

(declare-fun lt!27631 () Unit!1776)

(declare-fun call!5274 () Unit!1776)

(assert (=> b!64852 (= lt!27631 call!5274)))

(declare-fun call!5272 () SeekEntryResult!225)

(assert (=> b!64852 (= lt!27635 call!5272)))

(declare-fun res!35309 () Bool)

(assert (=> b!64852 (= res!35309 ((_ is Found!225) lt!27635))))

(assert (=> b!64852 (=> (not res!35309) (not e!42480))))

(assert (=> b!64852 e!42480))

(declare-fun lt!27628 () Unit!1776)

(assert (=> b!64852 (= lt!27628 lt!27631)))

(assert (=> b!64852 false))

(declare-fun b!64853 () Bool)

(declare-fun c!8882 () Bool)

(assert (=> b!64853 (= c!8882 ((_ is MissingVacant!225) lt!27618))))

(declare-fun e!42484 () Bool)

(assert (=> b!64853 (= e!42484 e!42489)))

(declare-fun bm!5263 () Bool)

(declare-fun c!8870 () Bool)

(assert (=> bm!5263 (= c!8870 c!8872)))

(assert (=> bm!5263 (= call!5262 (contains!694 e!42476 (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623)))))))

(declare-fun b!64854 () Bool)

(assert (=> b!64854 (= e!42487 e!42481)))

(declare-fun c!8876 () Bool)

(assert (=> b!64854 (= c!8876 (_1!1036 lt!27641))))

(declare-fun bm!5264 () Bool)

(assert (=> bm!5264 (= call!5273 call!5254)))

(declare-fun b!64855 () Bool)

(declare-fun lt!27626 () Unit!1776)

(assert (=> b!64855 (= e!42478 lt!27626)))

(assert (=> b!64855 (= lt!27626 call!5274)))

(assert (=> b!64855 (= lt!27620 call!5275)))

(declare-fun res!35306 () Bool)

(assert (=> b!64855 (= res!35306 ((_ is Found!225) lt!27620))))

(assert (=> b!64855 (=> (not res!35306) (not e!42493))))

(assert (=> b!64855 e!42493))

(declare-fun b!64856 () Bool)

(assert (=> b!64856 (= e!42488 e!42485)))

(declare-fun res!35308 () Bool)

(assert (=> b!64856 (= res!35308 call!5260)))

(assert (=> b!64856 (=> (not res!35308) (not e!42485))))

(declare-fun bm!5265 () Bool)

(assert (=> bm!5265 (= call!5255 call!5259)))

(declare-fun bm!5266 () Bool)

(assert (=> bm!5266 (= call!5265 (map!1126 newMap!16))))

(declare-fun b!64857 () Bool)

(assert (=> b!64857 (= e!42481 e!42492)))

(declare-fun res!35310 () Bool)

(assert (=> b!64857 (= res!35310 (contains!694 call!5268 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!64857 (=> (not res!35310) (not e!42492))))

(declare-fun bm!5267 () Bool)

(assert (=> bm!5267 (= call!5254 (getCurrentListMap!396 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun bm!5268 () Bool)

(declare-fun call!5271 () SeekEntryResult!225)

(assert (=> bm!5268 (= call!5272 call!5271)))

(declare-fun bm!5269 () Bool)

(declare-fun updateHelperNewKey!19 (LongMapFixedSize!646 (_ BitVec 64) V!2881 (_ BitVec 32)) tuple2!2050)

(assert (=> bm!5269 (= call!5256 (updateHelperNewKey!19 newMap!16 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623))))))

(declare-fun bm!5270 () Bool)

(assert (=> bm!5270 (= call!5264 (+!84 e!42475 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!8883 () Bool)

(assert (=> bm!5270 (= c!8883 c!8871)))

(declare-fun bm!5271 () Bool)

(assert (=> bm!5271 (= call!5271 (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun b!64858 () Bool)

(declare-fun res!35312 () Bool)

(assert (=> b!64858 (=> (not res!35312) (not e!42473))))

(assert (=> b!64858 (= res!35312 call!5266)))

(assert (=> b!64858 (= e!42484 e!42473)))

(declare-fun bm!5272 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1776)

(assert (=> bm!5272 (= call!5274 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(declare-fun b!64859 () Bool)

(assert (=> b!64859 (= e!42480 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27635)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64860 () Bool)

(declare-fun lt!27621 () Unit!1776)

(assert (=> b!64860 (= e!42474 lt!27621)))

(assert (=> b!64860 (= lt!27621 call!5270)))

(assert (=> b!64860 (= lt!27618 call!5272)))

(assert (=> b!64860 (= c!8879 ((_ is MissingZero!225) lt!27618))))

(assert (=> b!64860 e!42484))

(declare-fun bm!5273 () Bool)

(assert (=> bm!5273 (= call!5275 call!5271)))

(declare-fun b!64861 () Bool)

(assert (=> b!64861 (= e!42475 (ite c!8875 call!5261 call!5273))))

(declare-fun bm!5274 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1776)

(assert (=> bm!5274 (= call!5270 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (= (and d!13513 c!8871) b!64827))

(assert (= (and d!13513 (not c!8871)) b!64831))

(assert (= (and b!64827 c!8875) b!64844))

(assert (= (and b!64827 (not c!8875)) b!64832))

(assert (= (or b!64844 b!64832) bm!5264))

(assert (= (or b!64844 b!64832) bm!5259))

(assert (= (or b!64844 b!64832) bm!5256))

(assert (= (and b!64831 c!8872) b!64846))

(assert (= (and b!64831 (not c!8872)) b!64848))

(assert (= (and b!64846 c!8878) b!64852))

(assert (= (and b!64846 (not c!8878)) b!64860))

(assert (= (and b!64852 res!35309) b!64824))

(assert (= (and b!64824 res!35305) b!64859))

(assert (= (and b!64860 c!8879) b!64858))

(assert (= (and b!64860 (not c!8879)) b!64853))

(assert (= (and b!64858 res!35312) b!64850))

(assert (= (and b!64850 res!35303) b!64833))

(assert (= (and b!64853 c!8882) b!64825))

(assert (= (and b!64853 (not c!8882)) b!64836))

(assert (= (and b!64825 res!35315) b!64847))

(assert (= (and b!64847 res!35304) b!64837))

(assert (= (or b!64858 b!64825) bm!5255))

(assert (= (or b!64833 b!64837) bm!5265))

(assert (= (or b!64824 bm!5255) bm!5251))

(assert (= (or b!64852 b!64860) bm!5268))

(assert (= (and b!64848 c!8873) b!64842))

(assert (= (and b!64848 (not c!8873)) b!64822))

(assert (= (and b!64822 c!8880) b!64830))

(assert (= (and b!64822 (not c!8880)) b!64828))

(assert (= (and b!64828 c!8877) b!64855))

(assert (= (and b!64828 (not c!8877)) b!64841))

(assert (= (and b!64855 res!35306) b!64843))

(assert (= (and b!64843 res!35316) b!64840))

(assert (= (and b!64841 c!8881) b!64823))

(assert (= (and b!64841 (not c!8881)) b!64838))

(assert (= (and b!64823 res!35314) b!64834))

(assert (= (and b!64834 res!35311) b!64826))

(assert (= (and b!64838 c!8874) b!64856))

(assert (= (and b!64838 (not c!8874)) b!64845))

(assert (= (and b!64856 res!35308) b!64821))

(assert (= (and b!64821 res!35307) b!64829))

(assert (= (or b!64823 b!64856) bm!5252))

(assert (= (or b!64826 b!64829) bm!5261))

(assert (= (or b!64843 bm!5252) bm!5257))

(assert (= (or b!64855 b!64841) bm!5273))

(assert (= (or b!64842 b!64830) bm!5269))

(assert (= (or b!64860 b!64841) bm!5274))

(assert (= (or bm!5268 bm!5273) bm!5271))

(assert (= (or b!64852 b!64855) bm!5272))

(assert (= (or b!64846 b!64828) bm!5253))

(assert (= (or bm!5251 bm!5257) bm!5254))

(assert (= (or bm!5265 bm!5261) bm!5258))

(assert (= (or b!64846 b!64828) bm!5263))

(assert (= (and bm!5263 c!8870) b!64820))

(assert (= (and bm!5263 (not c!8870)) b!64849))

(assert (= (or bm!5264 b!64849) bm!5267))

(assert (= (or bm!5259 bm!5253) bm!5260))

(assert (= (or bm!5256 b!64828) bm!5270))

(assert (= (and bm!5270 c!8883) b!64861))

(assert (= (and bm!5270 (not c!8883)) b!64839))

(assert (= (and d!13513 res!35313) b!64854))

(assert (= (and b!64854 c!8876) b!64857))

(assert (= (and b!64854 (not c!8876)) b!64835))

(assert (= (and b!64857 res!35310) b!64851))

(assert (= (or b!64857 b!64851 b!64835) bm!5262))

(assert (= (or b!64851 b!64835) bm!5266))

(declare-fun m!59409 () Bool)

(assert (=> bm!5263 m!59409))

(declare-fun m!59411 () Bool)

(assert (=> bm!5263 m!59411))

(declare-fun m!59413 () Bool)

(assert (=> b!64850 m!59413))

(declare-fun m!59415 () Bool)

(assert (=> bm!5267 m!59415))

(declare-fun m!59417 () Bool)

(assert (=> b!64839 m!59417))

(assert (=> b!64832 m!59291))

(declare-fun m!59419 () Bool)

(assert (=> b!64832 m!59419))

(declare-fun m!59421 () Bool)

(assert (=> b!64834 m!59421))

(declare-fun m!59423 () Bool)

(assert (=> b!64851 m!59423))

(declare-fun m!59425 () Bool)

(assert (=> b!64821 m!59425))

(declare-fun m!59427 () Bool)

(assert (=> bm!5254 m!59427))

(assert (=> b!64857 m!59255))

(declare-fun m!59429 () Bool)

(assert (=> b!64857 m!59429))

(declare-fun m!59431 () Bool)

(assert (=> b!64859 m!59431))

(assert (=> bm!5269 m!59255))

(assert (=> bm!5269 m!59291))

(declare-fun m!59433 () Bool)

(assert (=> bm!5269 m!59433))

(declare-fun m!59435 () Bool)

(assert (=> d!13513 m!59435))

(assert (=> d!13513 m!59271))

(assert (=> bm!5266 m!59273))

(assert (=> bm!5258 m!59255))

(declare-fun m!59437 () Bool)

(assert (=> bm!5258 m!59437))

(assert (=> b!64831 m!59255))

(declare-fun m!59439 () Bool)

(assert (=> b!64831 m!59439))

(assert (=> b!64844 m!59291))

(declare-fun m!59441 () Bool)

(assert (=> b!64844 m!59441))

(declare-fun m!59443 () Bool)

(assert (=> bm!5260 m!59443))

(declare-fun m!59445 () Bool)

(assert (=> bm!5260 m!59445))

(assert (=> bm!5272 m!59255))

(declare-fun m!59447 () Bool)

(assert (=> bm!5272 m!59447))

(declare-fun m!59449 () Bool)

(assert (=> bm!5262 m!59449))

(assert (=> bm!5271 m!59255))

(assert (=> bm!5271 m!59439))

(declare-fun m!59451 () Bool)

(assert (=> b!64840 m!59451))

(assert (=> b!64828 m!59443))

(declare-fun m!59453 () Bool)

(assert (=> b!64828 m!59453))

(assert (=> b!64828 m!59255))

(assert (=> b!64828 m!59291))

(declare-fun m!59455 () Bool)

(assert (=> b!64828 m!59455))

(assert (=> b!64828 m!59417))

(assert (=> b!64828 m!59417))

(assert (=> b!64828 m!59255))

(declare-fun m!59457 () Bool)

(assert (=> b!64828 m!59457))

(declare-fun m!59459 () Bool)

(assert (=> b!64847 m!59459))

(assert (=> bm!5274 m!59255))

(declare-fun m!59461 () Bool)

(assert (=> bm!5274 m!59461))

(declare-fun m!59463 () Bool)

(assert (=> bm!5270 m!59463))

(assert (=> b!64578 d!13513))

(declare-fun d!13515 () Bool)

(declare-fun c!8886 () Bool)

(assert (=> d!13515 (= c!8886 ((_ is ValueCellFull!869) (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42497 () V!2881)

(assert (=> d!13515 (= (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42497)))

(declare-fun b!64866 () Bool)

(declare-fun get!1104 (ValueCell!869 V!2881) V!2881)

(assert (=> b!64866 (= e!42497 (get!1104 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64867 () Bool)

(declare-fun get!1105 (ValueCell!869 V!2881) V!2881)

(assert (=> b!64867 (= e!42497 (get!1105 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13515 c!8886) b!64866))

(assert (= (and d!13515 (not c!8886)) b!64867))

(assert (=> b!64866 m!59287))

(assert (=> b!64866 m!59289))

(declare-fun m!59465 () Bool)

(assert (=> b!64866 m!59465))

(assert (=> b!64867 m!59287))

(assert (=> b!64867 m!59289))

(declare-fun m!59467 () Bool)

(assert (=> b!64867 m!59467))

(assert (=> b!64578 d!13515))

(declare-fun d!13517 () Bool)

(assert (=> d!13517 (= (array_inv!1105 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvsge (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64572 d!13517))

(declare-fun d!13519 () Bool)

(assert (=> d!13519 (= (array_inv!1106 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvsge (size!2037 (_values!2104 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!64572 d!13519))

(declare-fun d!13521 () Bool)

(assert (=> d!13521 (= (map!1126 newMap!16) (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun bs!2823 () Bool)

(assert (= bs!2823 d!13521))

(assert (=> bs!2823 m!59417))

(assert (=> b!64571 d!13521))

(declare-fun bm!5289 () Bool)

(declare-fun call!5293 () ListLongMap!1361)

(declare-fun call!5298 () ListLongMap!1361)

(assert (=> bm!5289 (= call!5293 call!5298)))

(declare-fun c!8903 () Bool)

(declare-fun call!5294 () ListLongMap!1361)

(declare-fun call!5295 () ListLongMap!1361)

(declare-fun c!8902 () Bool)

(declare-fun bm!5290 () Bool)

(assert (=> bm!5290 (= call!5295 (+!84 (ite c!8902 call!5294 (ite c!8903 call!5298 call!5293)) (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun bm!5291 () Bool)

(declare-fun call!5292 () Bool)

(declare-fun lt!27698 () ListLongMap!1361)

(assert (=> bm!5291 (= call!5292 (contains!694 lt!27698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64910 () Bool)

(declare-fun e!42527 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!64910 (= e!42527 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!13523 () Bool)

(declare-fun e!42524 () Bool)

(assert (=> d!13523 e!42524))

(declare-fun res!35335 () Bool)

(assert (=> d!13523 (=> (not res!35335) (not e!42524))))

(assert (=> d!13523 (= res!35335 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun lt!27689 () ListLongMap!1361)

(assert (=> d!13523 (= lt!27698 lt!27689)))

(declare-fun lt!27688 () Unit!1776)

(declare-fun e!42528 () Unit!1776)

(assert (=> d!13523 (= lt!27688 e!42528)))

(declare-fun c!8901 () Bool)

(assert (=> d!13523 (= c!8901 e!42527)))

(declare-fun res!35337 () Bool)

(assert (=> d!13523 (=> (not res!35337) (not e!42527))))

(assert (=> d!13523 (= res!35337 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun e!42532 () ListLongMap!1361)

(assert (=> d!13523 (= lt!27689 e!42532)))

(assert (=> d!13523 (= c!8902 (and (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13523 (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13523 (= (getCurrentListMap!396 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) lt!27698)))

(declare-fun bm!5292 () Bool)

(declare-fun call!5297 () ListLongMap!1361)

(assert (=> bm!5292 (= call!5297 call!5295)))

(declare-fun b!64911 () Bool)

(declare-fun lt!27691 () Unit!1776)

(assert (=> b!64911 (= e!42528 lt!27691)))

(declare-fun lt!27687 () ListLongMap!1361)

(declare-fun getCurrentListMapNoExtraKeys!48 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) ListLongMap!1361)

(assert (=> b!64911 (= lt!27687 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27697 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27697 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27704 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27704 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27705 () Unit!1776)

(declare-fun addStillContains!46 (ListLongMap!1361 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1776)

(assert (=> b!64911 (= lt!27705 (addStillContains!46 lt!27687 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27704))))

(assert (=> b!64911 (contains!694 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27704)))

(declare-fun lt!27707 () Unit!1776)

(assert (=> b!64911 (= lt!27707 lt!27705)))

(declare-fun lt!27703 () ListLongMap!1361)

(assert (=> b!64911 (= lt!27703 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27696 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27696 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27692 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27692 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27694 () Unit!1776)

(declare-fun addApplyDifferent!46 (ListLongMap!1361 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1776)

(assert (=> b!64911 (= lt!27694 (addApplyDifferent!46 lt!27703 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27692))))

(declare-fun apply!70 (ListLongMap!1361 (_ BitVec 64)) V!2881)

(assert (=> b!64911 (= (apply!70 (+!84 lt!27703 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27692) (apply!70 lt!27703 lt!27692))))

(declare-fun lt!27706 () Unit!1776)

(assert (=> b!64911 (= lt!27706 lt!27694)))

(declare-fun lt!27701 () ListLongMap!1361)

(assert (=> b!64911 (= lt!27701 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27700 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27690 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27690 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27695 () Unit!1776)

(assert (=> b!64911 (= lt!27695 (addApplyDifferent!46 lt!27701 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27690))))

(assert (=> b!64911 (= (apply!70 (+!84 lt!27701 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27690) (apply!70 lt!27701 lt!27690))))

(declare-fun lt!27708 () Unit!1776)

(assert (=> b!64911 (= lt!27708 lt!27695)))

(declare-fun lt!27699 () ListLongMap!1361)

(assert (=> b!64911 (= lt!27699 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun lt!27693 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27693 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27702 () (_ BitVec 64))

(assert (=> b!64911 (= lt!27702 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64911 (= lt!27691 (addApplyDifferent!46 lt!27699 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27702))))

(assert (=> b!64911 (= (apply!70 (+!84 lt!27699 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27702) (apply!70 lt!27699 lt!27702))))

(declare-fun b!64912 () Bool)

(declare-fun e!42526 () Bool)

(assert (=> b!64912 (= e!42526 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64913 () Bool)

(declare-fun e!42536 () Bool)

(declare-fun call!5296 () Bool)

(assert (=> b!64913 (= e!42536 (not call!5296))))

(declare-fun b!64914 () Bool)

(declare-fun e!42525 () Bool)

(assert (=> b!64914 (= e!42536 e!42525)))

(declare-fun res!35338 () Bool)

(assert (=> b!64914 (= res!35338 call!5296)))

(assert (=> b!64914 (=> (not res!35338) (not e!42525))))

(declare-fun b!64915 () Bool)

(declare-fun e!42530 () Bool)

(assert (=> b!64915 (= e!42530 (= (apply!70 lt!27698 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64915 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2037 (_values!2104 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> b!64915 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64916 () Bool)

(declare-fun res!35341 () Bool)

(assert (=> b!64916 (=> (not res!35341) (not e!42524))))

(declare-fun e!42529 () Bool)

(assert (=> b!64916 (= res!35341 e!42529)))

(declare-fun res!35339 () Bool)

(assert (=> b!64916 (=> res!35339 e!42529)))

(assert (=> b!64916 (= res!35339 (not e!42526))))

(declare-fun res!35342 () Bool)

(assert (=> b!64916 (=> (not res!35342) (not e!42526))))

(assert (=> b!64916 (= res!35342 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64917 () Bool)

(declare-fun e!42531 () ListLongMap!1361)

(assert (=> b!64917 (= e!42531 call!5293)))

(declare-fun b!64918 () Bool)

(declare-fun e!42535 () Bool)

(assert (=> b!64918 (= e!42535 (not call!5292))))

(declare-fun b!64919 () Bool)

(declare-fun e!42533 () ListLongMap!1361)

(assert (=> b!64919 (= e!42533 call!5297)))

(declare-fun b!64920 () Bool)

(assert (=> b!64920 (= e!42532 e!42533)))

(assert (=> b!64920 (= c!8903 (and (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64921 () Bool)

(declare-fun c!8900 () Bool)

(assert (=> b!64921 (= c!8900 (and (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!64921 (= e!42533 e!42531)))

(declare-fun b!64922 () Bool)

(assert (=> b!64922 (= e!42532 (+!84 call!5295 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64923 () Bool)

(assert (=> b!64923 (= e!42524 e!42536)))

(declare-fun c!8904 () Bool)

(assert (=> b!64923 (= c!8904 (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64924 () Bool)

(assert (=> b!64924 (= e!42525 (= (apply!70 lt!27698 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64925 () Bool)

(declare-fun Unit!1786 () Unit!1776)

(assert (=> b!64925 (= e!42528 Unit!1786)))

(declare-fun bm!5293 () Bool)

(assert (=> bm!5293 (= call!5296 (contains!694 lt!27698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64926 () Bool)

(declare-fun e!42534 () Bool)

(assert (=> b!64926 (= e!42535 e!42534)))

(declare-fun res!35343 () Bool)

(assert (=> b!64926 (= res!35343 call!5292)))

(assert (=> b!64926 (=> (not res!35343) (not e!42534))))

(declare-fun b!64927 () Bool)

(assert (=> b!64927 (= e!42531 call!5297)))

(declare-fun b!64928 () Bool)

(assert (=> b!64928 (= e!42534 (= (apply!70 lt!27698 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun bm!5294 () Bool)

(assert (=> bm!5294 (= call!5298 call!5294)))

(declare-fun b!64929 () Bool)

(assert (=> b!64929 (= e!42529 e!42530)))

(declare-fun res!35340 () Bool)

(assert (=> b!64929 (=> (not res!35340) (not e!42530))))

(assert (=> b!64929 (= res!35340 (contains!694 lt!27698 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64929 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun bm!5295 () Bool)

(assert (=> bm!5295 (= call!5294 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64930 () Bool)

(declare-fun res!35336 () Bool)

(assert (=> b!64930 (=> (not res!35336) (not e!42524))))

(assert (=> b!64930 (= res!35336 e!42535)))

(declare-fun c!8899 () Bool)

(assert (=> b!64930 (= c!8899 (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!13523 c!8902) b!64922))

(assert (= (and d!13523 (not c!8902)) b!64920))

(assert (= (and b!64920 c!8903) b!64919))

(assert (= (and b!64920 (not c!8903)) b!64921))

(assert (= (and b!64921 c!8900) b!64927))

(assert (= (and b!64921 (not c!8900)) b!64917))

(assert (= (or b!64927 b!64917) bm!5289))

(assert (= (or b!64919 bm!5289) bm!5294))

(assert (= (or b!64919 b!64927) bm!5292))

(assert (= (or b!64922 bm!5294) bm!5295))

(assert (= (or b!64922 bm!5292) bm!5290))

(assert (= (and d!13523 res!35337) b!64910))

(assert (= (and d!13523 c!8901) b!64911))

(assert (= (and d!13523 (not c!8901)) b!64925))

(assert (= (and d!13523 res!35335) b!64916))

(assert (= (and b!64916 res!35342) b!64912))

(assert (= (and b!64916 (not res!35339)) b!64929))

(assert (= (and b!64929 res!35340) b!64915))

(assert (= (and b!64916 res!35341) b!64930))

(assert (= (and b!64930 c!8899) b!64926))

(assert (= (and b!64930 (not c!8899)) b!64918))

(assert (= (and b!64926 res!35343) b!64928))

(assert (= (or b!64926 b!64918) bm!5291))

(assert (= (and b!64930 res!35336) b!64923))

(assert (= (and b!64923 c!8904) b!64914))

(assert (= (and b!64923 (not c!8904)) b!64913))

(assert (= (and b!64914 res!35338) b!64924))

(assert (= (or b!64914 b!64913) bm!5293))

(declare-fun b_lambda!2915 () Bool)

(assert (=> (not b_lambda!2915) (not b!64915)))

(assert (=> b!64915 t!4857))

(declare-fun b_and!3981 () Bool)

(assert (= b_and!3961 (and (=> t!4857 result!2487) b_and!3981)))

(assert (=> b!64915 t!4859))

(declare-fun b_and!3983 () Bool)

(assert (= b_and!3963 (and (=> t!4859 result!2491) b_and!3983)))

(declare-fun m!59469 () Bool)

(assert (=> b!64910 m!59469))

(assert (=> b!64910 m!59469))

(declare-fun m!59471 () Bool)

(assert (=> b!64910 m!59471))

(assert (=> b!64912 m!59469))

(assert (=> b!64912 m!59469))

(assert (=> b!64912 m!59471))

(declare-fun m!59473 () Bool)

(assert (=> bm!5290 m!59473))

(declare-fun m!59475 () Bool)

(assert (=> b!64922 m!59475))

(assert (=> b!64929 m!59469))

(assert (=> b!64929 m!59469))

(declare-fun m!59477 () Bool)

(assert (=> b!64929 m!59477))

(declare-fun m!59479 () Bool)

(assert (=> bm!5293 m!59479))

(declare-fun m!59481 () Bool)

(assert (=> bm!5291 m!59481))

(assert (=> d!13523 m!59249))

(assert (=> b!64915 m!59469))

(assert (=> b!64915 m!59289))

(assert (=> b!64915 m!59469))

(declare-fun m!59483 () Bool)

(assert (=> b!64915 m!59483))

(declare-fun m!59485 () Bool)

(assert (=> b!64915 m!59485))

(assert (=> b!64915 m!59289))

(declare-fun m!59487 () Bool)

(assert (=> b!64915 m!59487))

(assert (=> b!64915 m!59485))

(declare-fun m!59489 () Bool)

(assert (=> b!64928 m!59489))

(declare-fun m!59491 () Bool)

(assert (=> b!64924 m!59491))

(declare-fun m!59493 () Bool)

(assert (=> bm!5295 m!59493))

(declare-fun m!59495 () Bool)

(assert (=> b!64911 m!59495))

(declare-fun m!59497 () Bool)

(assert (=> b!64911 m!59497))

(assert (=> b!64911 m!59469))

(declare-fun m!59499 () Bool)

(assert (=> b!64911 m!59499))

(declare-fun m!59501 () Bool)

(assert (=> b!64911 m!59501))

(declare-fun m!59503 () Bool)

(assert (=> b!64911 m!59503))

(declare-fun m!59505 () Bool)

(assert (=> b!64911 m!59505))

(assert (=> b!64911 m!59503))

(declare-fun m!59507 () Bool)

(assert (=> b!64911 m!59507))

(declare-fun m!59509 () Bool)

(assert (=> b!64911 m!59509))

(assert (=> b!64911 m!59493))

(assert (=> b!64911 m!59499))

(declare-fun m!59511 () Bool)

(assert (=> b!64911 m!59511))

(declare-fun m!59513 () Bool)

(assert (=> b!64911 m!59513))

(assert (=> b!64911 m!59497))

(declare-fun m!59515 () Bool)

(assert (=> b!64911 m!59515))

(declare-fun m!59517 () Bool)

(assert (=> b!64911 m!59517))

(assert (=> b!64911 m!59513))

(declare-fun m!59519 () Bool)

(assert (=> b!64911 m!59519))

(declare-fun m!59521 () Bool)

(assert (=> b!64911 m!59521))

(declare-fun m!59523 () Bool)

(assert (=> b!64911 m!59523))

(assert (=> b!64571 d!13523))

(declare-fun d!13525 () Bool)

(assert (=> d!13525 (= (valid!277 thiss!992) (valid!276 (v!2447 (underlying!239 thiss!992))))))

(declare-fun bs!2824 () Bool)

(assert (= bs!2824 d!13525))

(declare-fun m!59525 () Bool)

(assert (=> bs!2824 m!59525))

(assert (=> start!9116 d!13525))

(declare-fun d!13527 () Bool)

(declare-fun res!35349 () Bool)

(declare-fun e!42545 () Bool)

(assert (=> d!13527 (=> res!35349 e!42545)))

(assert (=> d!13527 (= res!35349 (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))) e!42545)))

(declare-fun b!64939 () Bool)

(declare-fun e!42543 () Bool)

(declare-fun e!42544 () Bool)

(assert (=> b!64939 (= e!42543 e!42544)))

(declare-fun lt!27717 () (_ BitVec 64))

(assert (=> b!64939 (= lt!27717 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!27715 () Unit!1776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3771 (_ BitVec 64) (_ BitVec 32)) Unit!1776)

(assert (=> b!64939 (= lt!27715 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000))))

(assert (=> b!64939 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000)))

(declare-fun lt!27716 () Unit!1776)

(assert (=> b!64939 (= lt!27716 lt!27715)))

(declare-fun res!35348 () Bool)

(assert (=> b!64939 (= res!35348 (= (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))) (Found!225 #b00000000000000000000000000000000)))))

(assert (=> b!64939 (=> (not res!35348) (not e!42544))))

(declare-fun b!64940 () Bool)

(declare-fun call!5301 () Bool)

(assert (=> b!64940 (= e!42543 call!5301)))

(declare-fun b!64941 () Bool)

(assert (=> b!64941 (= e!42545 e!42543)))

(declare-fun c!8907 () Bool)

(assert (=> b!64941 (= c!8907 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!5298 () Bool)

(assert (=> bm!5298 (= call!5301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64942 () Bool)

(assert (=> b!64942 (= e!42544 call!5301)))

(assert (= (and d!13527 (not res!35349)) b!64941))

(assert (= (and b!64941 c!8907) b!64939))

(assert (= (and b!64941 (not c!8907)) b!64940))

(assert (= (and b!64939 res!35348) b!64942))

(assert (= (or b!64942 b!64940) bm!5298))

(declare-fun m!59527 () Bool)

(assert (=> b!64939 m!59527))

(declare-fun m!59529 () Bool)

(assert (=> b!64939 m!59529))

(declare-fun m!59531 () Bool)

(assert (=> b!64939 m!59531))

(assert (=> b!64939 m!59527))

(declare-fun m!59533 () Bool)

(assert (=> b!64939 m!59533))

(assert (=> b!64941 m!59527))

(assert (=> b!64941 m!59527))

(declare-fun m!59535 () Bool)

(assert (=> b!64941 m!59535))

(declare-fun m!59537 () Bool)

(assert (=> bm!5298 m!59537))

(assert (=> b!64575 d!13527))

(declare-fun d!13529 () Bool)

(assert (=> d!13529 (not (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27720 () Unit!1776)

(declare-fun choose!68 (array!3771 (_ BitVec 32) (_ BitVec 64) List!1439) Unit!1776)

(assert (=> d!13529 (= lt!27720 (choose!68 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436)))))

(assert (=> d!13529 (bvslt (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13529 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436)) lt!27720)))

(declare-fun bs!2825 () Bool)

(assert (= bs!2825 d!13529))

(assert (=> bs!2825 m!59255))

(assert (=> bs!2825 m!59259))

(assert (=> bs!2825 m!59255))

(declare-fun m!59539 () Bool)

(assert (=> bs!2825 m!59539))

(assert (=> b!64585 d!13529))

(declare-fun d!13531 () Bool)

(assert (=> d!13531 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1436)))

(declare-fun lt!27723 () Unit!1776)

(declare-fun choose!39 (array!3771 (_ BitVec 32) (_ BitVec 32)) Unit!1776)

(assert (=> d!13531 (= lt!27723 (choose!39 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13531 (bvslt (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13531 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355) lt!27723)))

(declare-fun bs!2826 () Bool)

(assert (= bs!2826 d!13531))

(assert (=> bs!2826 m!59253))

(declare-fun m!59541 () Bool)

(assert (=> bs!2826 m!59541))

(assert (=> b!64585 d!13531))

(declare-fun d!13533 () Bool)

(declare-fun res!35354 () Bool)

(declare-fun e!42550 () Bool)

(assert (=> d!13533 (=> res!35354 e!42550)))

(assert (=> d!13533 (= res!35354 (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13533 (= (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!42550)))

(declare-fun b!64947 () Bool)

(declare-fun e!42551 () Bool)

(assert (=> b!64947 (= e!42550 e!42551)))

(declare-fun res!35355 () Bool)

(assert (=> b!64947 (=> (not res!35355) (not e!42551))))

(assert (=> b!64947 (= res!35355 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!64948 () Bool)

(assert (=> b!64948 (= e!42551 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13533 (not res!35354)) b!64947))

(assert (= (and b!64947 res!35355) b!64948))

(assert (=> d!13533 m!59469))

(assert (=> b!64948 m!59255))

(declare-fun m!59543 () Bool)

(assert (=> b!64948 m!59543))

(assert (=> b!64585 d!13533))

(declare-fun d!13535 () Bool)

(declare-fun e!42554 () Bool)

(assert (=> d!13535 e!42554))

(declare-fun c!8910 () Bool)

(assert (=> d!13535 (= c!8910 (and (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27726 () Unit!1776)

(declare-fun choose!360 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1776)

(assert (=> d!13535 (= lt!27726 (choose!360 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(assert (=> d!13535 (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13535 (= (lemmaListMapContainsThenArrayContainsFrom!31 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) lt!27726)))

(declare-fun b!64953 () Bool)

(assert (=> b!64953 (= e!42554 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64954 () Bool)

(assert (=> b!64954 (= e!42554 (ite (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13535 c!8910) b!64953))

(assert (= (and d!13535 (not c!8910)) b!64954))

(assert (=> d!13535 m!59255))

(declare-fun m!59545 () Bool)

(assert (=> d!13535 m!59545))

(assert (=> d!13535 m!59249))

(assert (=> b!64953 m!59255))

(assert (=> b!64953 m!59259))

(assert (=> b!64585 d!13535))

(declare-fun b!64965 () Bool)

(declare-fun e!42564 () Bool)

(declare-fun e!42566 () Bool)

(assert (=> b!64965 (= e!42564 e!42566)))

(declare-fun c!8913 () Bool)

(assert (=> b!64965 (= c!8913 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64966 () Bool)

(declare-fun call!5304 () Bool)

(assert (=> b!64966 (= e!42566 call!5304)))

(declare-fun b!64967 () Bool)

(declare-fun e!42563 () Bool)

(assert (=> b!64967 (= e!42563 e!42564)))

(declare-fun res!35364 () Bool)

(assert (=> b!64967 (=> (not res!35364) (not e!42564))))

(declare-fun e!42565 () Bool)

(assert (=> b!64967 (= res!35364 (not e!42565))))

(declare-fun res!35363 () Bool)

(assert (=> b!64967 (=> (not res!35363) (not e!42565))))

(assert (=> b!64967 (= res!35363 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun bm!5301 () Bool)

(assert (=> bm!5301 (= call!5304 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8913 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436) Nil!1436)))))

(declare-fun b!64969 () Bool)

(declare-fun contains!696 (List!1439 (_ BitVec 64)) Bool)

(assert (=> b!64969 (= e!42565 (contains!696 Nil!1436 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64968 () Bool)

(assert (=> b!64968 (= e!42566 call!5304)))

(declare-fun d!13537 () Bool)

(declare-fun res!35362 () Bool)

(assert (=> d!13537 (=> res!35362 e!42563)))

(assert (=> d!13537 (= res!35362 (bvsge from!355 (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13537 (= (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1436) e!42563)))

(assert (= (and d!13537 (not res!35362)) b!64967))

(assert (= (and b!64967 res!35363) b!64969))

(assert (= (and b!64967 res!35364) b!64965))

(assert (= (and b!64965 c!8913) b!64966))

(assert (= (and b!64965 (not c!8913)) b!64968))

(assert (= (or b!64966 b!64968) bm!5301))

(assert (=> b!64965 m!59255))

(assert (=> b!64965 m!59255))

(declare-fun m!59547 () Bool)

(assert (=> b!64965 m!59547))

(assert (=> b!64967 m!59255))

(assert (=> b!64967 m!59255))

(assert (=> b!64967 m!59547))

(assert (=> bm!5301 m!59255))

(declare-fun m!59549 () Bool)

(assert (=> bm!5301 m!59549))

(assert (=> b!64969 m!59255))

(assert (=> b!64969 m!59255))

(declare-fun m!59551 () Bool)

(assert (=> b!64969 m!59551))

(assert (=> b!64585 d!13537))

(declare-fun d!13539 () Bool)

(assert (=> d!13539 (= (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992)))) (and (or (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000001111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000011111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000001111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000011111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000001111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000011111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000001111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000011111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000000111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000001111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000011111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000000111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000001111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000011111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000000111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000001111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000011111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000000111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000001111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000011111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00000111111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00001111111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00011111111111111111111111111111) (= (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6043 (v!2447 (underlying!239 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!64569 d!13539))

(declare-fun d!13541 () Bool)

(assert (=> d!13541 (= (array_inv!1105 (_keys!3759 newMap!16)) (bvsge (size!2036 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64565 d!13541))

(declare-fun d!13543 () Bool)

(assert (=> d!13543 (= (array_inv!1106 (_values!2104 newMap!16)) (bvsge (size!2037 (_values!2104 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64565 d!13543))

(declare-fun b!64970 () Bool)

(declare-fun e!42568 () Bool)

(declare-fun e!42570 () Bool)

(assert (=> b!64970 (= e!42568 e!42570)))

(declare-fun c!8914 () Bool)

(assert (=> b!64970 (= c!8914 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64971 () Bool)

(declare-fun call!5305 () Bool)

(assert (=> b!64971 (= e!42570 call!5305)))

(declare-fun b!64972 () Bool)

(declare-fun e!42567 () Bool)

(assert (=> b!64972 (= e!42567 e!42568)))

(declare-fun res!35367 () Bool)

(assert (=> b!64972 (=> (not res!35367) (not e!42568))))

(declare-fun e!42569 () Bool)

(assert (=> b!64972 (= res!35367 (not e!42569))))

(declare-fun res!35366 () Bool)

(assert (=> b!64972 (=> (not res!35366) (not e!42569))))

(assert (=> b!64972 (= res!35366 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!5302 () Bool)

(assert (=> bm!5302 (= call!5305 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8914 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1436) Nil!1436)))))

(declare-fun b!64974 () Bool)

(assert (=> b!64974 (= e!42569 (contains!696 Nil!1436 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!64973 () Bool)

(assert (=> b!64973 (= e!42570 call!5305)))

(declare-fun d!13545 () Bool)

(declare-fun res!35365 () Bool)

(assert (=> d!13545 (=> res!35365 e!42567)))

(assert (=> d!13545 (= res!35365 (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13545 (= (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1436) e!42567)))

(assert (= (and d!13545 (not res!35365)) b!64972))

(assert (= (and b!64972 res!35366) b!64974))

(assert (= (and b!64972 res!35367) b!64970))

(assert (= (and b!64970 c!8914) b!64971))

(assert (= (and b!64970 (not c!8914)) b!64973))

(assert (= (or b!64971 b!64973) bm!5302))

(assert (=> b!64970 m!59527))

(assert (=> b!64970 m!59527))

(assert (=> b!64970 m!59535))

(assert (=> b!64972 m!59527))

(assert (=> b!64972 m!59527))

(assert (=> b!64972 m!59535))

(assert (=> bm!5302 m!59527))

(declare-fun m!59553 () Bool)

(assert (=> bm!5302 m!59553))

(assert (=> b!64974 m!59527))

(assert (=> b!64974 m!59527))

(declare-fun m!59555 () Bool)

(assert (=> b!64974 m!59555))

(assert (=> b!64574 d!13545))

(declare-fun mapIsEmpty!3003 () Bool)

(declare-fun mapRes!3003 () Bool)

(assert (=> mapIsEmpty!3003 mapRes!3003))

(declare-fun b!64982 () Bool)

(declare-fun e!42575 () Bool)

(assert (=> b!64982 (= e!42575 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3003 () Bool)

(declare-fun tp!8223 () Bool)

(declare-fun e!42576 () Bool)

(assert (=> mapNonEmpty!3003 (= mapRes!3003 (and tp!8223 e!42576))))

(declare-fun mapRest!3003 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapKey!3003 () (_ BitVec 32))

(declare-fun mapValue!3003 () ValueCell!869)

(assert (=> mapNonEmpty!3003 (= mapRest!2987 (store mapRest!3003 mapKey!3003 mapValue!3003))))

(declare-fun condMapEmpty!3003 () Bool)

(declare-fun mapDefault!3003 () ValueCell!869)

(assert (=> mapNonEmpty!2987 (= condMapEmpty!3003 (= mapRest!2987 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3003)))))

(assert (=> mapNonEmpty!2987 (= tp!8196 (and e!42575 mapRes!3003))))

(declare-fun b!64981 () Bool)

(assert (=> b!64981 (= e!42576 tp_is_empty!2425)))

(assert (= (and mapNonEmpty!2987 condMapEmpty!3003) mapIsEmpty!3003))

(assert (= (and mapNonEmpty!2987 (not condMapEmpty!3003)) mapNonEmpty!3003))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!869) mapValue!3003)) b!64981))

(assert (= (and mapNonEmpty!2987 ((_ is ValueCellFull!869) mapDefault!3003)) b!64982))

(declare-fun m!59557 () Bool)

(assert (=> mapNonEmpty!3003 m!59557))

(declare-fun mapIsEmpty!3004 () Bool)

(declare-fun mapRes!3004 () Bool)

(assert (=> mapIsEmpty!3004 mapRes!3004))

(declare-fun b!64984 () Bool)

(declare-fun e!42577 () Bool)

(assert (=> b!64984 (= e!42577 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3004 () Bool)

(declare-fun tp!8224 () Bool)

(declare-fun e!42578 () Bool)

(assert (=> mapNonEmpty!3004 (= mapRes!3004 (and tp!8224 e!42578))))

(declare-fun mapRest!3004 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapValue!3004 () ValueCell!869)

(declare-fun mapKey!3004 () (_ BitVec 32))

(assert (=> mapNonEmpty!3004 (= mapRest!2988 (store mapRest!3004 mapKey!3004 mapValue!3004))))

(declare-fun condMapEmpty!3004 () Bool)

(declare-fun mapDefault!3004 () ValueCell!869)

(assert (=> mapNonEmpty!2988 (= condMapEmpty!3004 (= mapRest!2988 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3004)))))

(assert (=> mapNonEmpty!2988 (= tp!8195 (and e!42577 mapRes!3004))))

(declare-fun b!64983 () Bool)

(assert (=> b!64983 (= e!42578 tp_is_empty!2425)))

(assert (= (and mapNonEmpty!2988 condMapEmpty!3004) mapIsEmpty!3004))

(assert (= (and mapNonEmpty!2988 (not condMapEmpty!3004)) mapNonEmpty!3004))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!869) mapValue!3004)) b!64983))

(assert (= (and mapNonEmpty!2988 ((_ is ValueCellFull!869) mapDefault!3004)) b!64984))

(declare-fun m!59559 () Bool)

(assert (=> mapNonEmpty!3004 m!59559))

(declare-fun b_lambda!2917 () Bool)

(assert (= b_lambda!2915 (or (and b!64572 b_free!2017) (and b!64565 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))))) b_lambda!2917)))

(check-sat (not bm!5272) (not b_next!2019) (not bm!5298) (not b!64867) (not bm!5270) (not b!64831) (not d!13535) (not b!64911) (not b!64967) (not b!64725) (not b!64953) (not b!64941) (not bm!5254) (not b!64965) (not b!64828) (not bm!5295) (not b!64970) (not d!13523) (not d!13531) (not b!64733) (not b!64724) (not d!13511) (not b_lambda!2917) (not bm!5291) (not b!64972) (not mapNonEmpty!3003) (not b!64832) (not b!64844) (not d!13513) (not bm!5258) (not d!13509) b_and!3981 (not bm!5262) (not b!64910) (not bm!5266) (not b!64735) tp_is_empty!2425 (not bm!5269) (not b!64948) (not b_lambda!2913) (not bm!5271) (not d!13525) (not bm!5290) (not bm!5267) (not b!64969) (not b!64915) (not b!64928) (not b!64939) (not b!64851) (not bm!5302) (not b!64839) (not bm!5260) (not bm!5293) (not b!64912) (not d!13521) (not bm!5301) (not b!64857) (not mapNonEmpty!3004) (not b!64866) (not b!64922) b_and!3983 (not bm!5274) (not b!64924) (not d!13529) (not bm!5263) (not b_next!2017) (not b!64929) (not b!64974) (not b!64726))
(check-sat b_and!3981 b_and!3983 (not b_next!2017) (not b_next!2019))
(get-model)

(declare-fun d!13547 () Bool)

(declare-fun res!35369 () Bool)

(declare-fun e!42581 () Bool)

(assert (=> d!13547 (=> res!35369 e!42581)))

(assert (=> d!13547 (= res!35369 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13547 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))) e!42581)))

(declare-fun b!64985 () Bool)

(declare-fun e!42579 () Bool)

(declare-fun e!42580 () Bool)

(assert (=> b!64985 (= e!42579 e!42580)))

(declare-fun lt!27729 () (_ BitVec 64))

(assert (=> b!64985 (= lt!27729 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27727 () Unit!1776)

(assert (=> b!64985 (= lt!27727 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27729 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!64985 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27729 #b00000000000000000000000000000000)))

(declare-fun lt!27728 () Unit!1776)

(assert (=> b!64985 (= lt!27728 lt!27727)))

(declare-fun res!35368 () Bool)

(assert (=> b!64985 (= res!35368 (= (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))) (Found!225 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!64985 (=> (not res!35368) (not e!42580))))

(declare-fun b!64986 () Bool)

(declare-fun call!5306 () Bool)

(assert (=> b!64986 (= e!42579 call!5306)))

(declare-fun b!64987 () Bool)

(assert (=> b!64987 (= e!42581 e!42579)))

(declare-fun c!8915 () Bool)

(assert (=> b!64987 (= c!8915 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!5303 () Bool)

(assert (=> bm!5303 (= call!5306 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!64988 () Bool)

(assert (=> b!64988 (= e!42580 call!5306)))

(assert (= (and d!13547 (not res!35369)) b!64987))

(assert (= (and b!64987 c!8915) b!64985))

(assert (= (and b!64987 (not c!8915)) b!64986))

(assert (= (and b!64985 res!35368) b!64988))

(assert (= (or b!64988 b!64986) bm!5303))

(declare-fun m!59561 () Bool)

(assert (=> b!64985 m!59561))

(declare-fun m!59563 () Bool)

(assert (=> b!64985 m!59563))

(declare-fun m!59565 () Bool)

(assert (=> b!64985 m!59565))

(assert (=> b!64985 m!59561))

(declare-fun m!59567 () Bool)

(assert (=> b!64985 m!59567))

(assert (=> b!64987 m!59561))

(assert (=> b!64987 m!59561))

(declare-fun m!59569 () Bool)

(assert (=> b!64987 m!59569))

(declare-fun m!59571 () Bool)

(assert (=> bm!5303 m!59571))

(assert (=> bm!5298 d!13547))

(declare-fun d!13549 () Bool)

(declare-fun e!42583 () Bool)

(assert (=> d!13549 e!42583))

(declare-fun res!35370 () Bool)

(assert (=> d!13549 (=> res!35370 e!42583)))

(declare-fun lt!27733 () Bool)

(assert (=> d!13549 (= res!35370 (not lt!27733))))

(declare-fun lt!27732 () Bool)

(assert (=> d!13549 (= lt!27733 lt!27732)))

(declare-fun lt!27730 () Unit!1776)

(declare-fun e!42582 () Unit!1776)

(assert (=> d!13549 (= lt!27730 e!42582)))

(declare-fun c!8916 () Bool)

(assert (=> d!13549 (= c!8916 lt!27732)))

(assert (=> d!13549 (= lt!27732 (containsKey!132 (toList!696 lt!27698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13549 (= (contains!694 lt!27698 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27733)))

(declare-fun b!64989 () Bool)

(declare-fun lt!27731 () Unit!1776)

(assert (=> b!64989 (= e!42582 lt!27731)))

(assert (=> b!64989 (= lt!27731 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 lt!27698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64989 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64990 () Bool)

(declare-fun Unit!1787 () Unit!1776)

(assert (=> b!64990 (= e!42582 Unit!1787)))

(declare-fun b!64991 () Bool)

(assert (=> b!64991 (= e!42583 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13549 c!8916) b!64989))

(assert (= (and d!13549 (not c!8916)) b!64990))

(assert (= (and d!13549 (not res!35370)) b!64991))

(declare-fun m!59573 () Bool)

(assert (=> d!13549 m!59573))

(declare-fun m!59575 () Bool)

(assert (=> b!64989 m!59575))

(declare-fun m!59577 () Bool)

(assert (=> b!64989 m!59577))

(assert (=> b!64989 m!59577))

(declare-fun m!59579 () Bool)

(assert (=> b!64989 m!59579))

(assert (=> b!64991 m!59577))

(assert (=> b!64991 m!59577))

(assert (=> b!64991 m!59579))

(assert (=> bm!5293 d!13549))

(declare-fun d!13551 () Bool)

(assert (=> d!13551 (= (+!84 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) lt!27634 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27736 () Unit!1776)

(declare-fun choose!361 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1776)

(assert (=> d!13551 (= lt!27736 (choose!361 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27634 (zeroValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13551 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13551 (= (lemmaChangeZeroKeyThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27634 (zeroValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2030 newMap!16) (defaultEntry!2121 newMap!16)) lt!27736)))

(declare-fun bs!2827 () Bool)

(assert (= bs!2827 d!13551))

(declare-fun m!59581 () Bool)

(assert (=> bs!2827 m!59581))

(assert (=> bs!2827 m!59291))

(declare-fun m!59583 () Bool)

(assert (=> bs!2827 m!59583))

(assert (=> bs!2827 m!59417))

(declare-fun m!59585 () Bool)

(assert (=> bs!2827 m!59585))

(assert (=> bs!2827 m!59417))

(assert (=> bs!2827 m!59291))

(declare-fun m!59587 () Bool)

(assert (=> bs!2827 m!59587))

(assert (=> b!64844 d!13551))

(declare-fun d!13553 () Bool)

(declare-fun lt!27739 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!71 (List!1439) (InoxSet (_ BitVec 64)))

(assert (=> d!13553 (= lt!27739 (select (content!71 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42589 () Bool)

(assert (=> d!13553 (= lt!27739 e!42589)))

(declare-fun res!35376 () Bool)

(assert (=> d!13553 (=> (not res!35376) (not e!42589))))

(assert (=> d!13553 (= res!35376 ((_ is Cons!1435) Nil!1436))))

(assert (=> d!13553 (= (contains!696 Nil!1436 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27739)))

(declare-fun b!64996 () Bool)

(declare-fun e!42588 () Bool)

(assert (=> b!64996 (= e!42589 e!42588)))

(declare-fun res!35375 () Bool)

(assert (=> b!64996 (=> res!35375 e!42588)))

(assert (=> b!64996 (= res!35375 (= (h!2019 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!64997 () Bool)

(assert (=> b!64997 (= e!42588 (contains!696 (t!4861 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13553 res!35376) b!64996))

(assert (= (and b!64996 (not res!35375)) b!64997))

(declare-fun m!59589 () Bool)

(assert (=> d!13553 m!59589))

(assert (=> d!13553 m!59255))

(declare-fun m!59591 () Bool)

(assert (=> d!13553 m!59591))

(assert (=> b!64997 m!59255))

(declare-fun m!59593 () Bool)

(assert (=> b!64997 m!59593))

(assert (=> b!64969 d!13553))

(declare-fun b!65032 () Bool)

(declare-fun e!42606 () Bool)

(declare-fun lt!27820 () SeekEntryResult!225)

(assert (=> b!65032 (= e!42606 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27820)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65033 () Bool)

(declare-fun res!35397 () Bool)

(declare-fun e!42607 () Bool)

(assert (=> b!65033 (=> (not res!35397) (not e!42607))))

(declare-fun lt!27803 () tuple2!2050)

(assert (=> b!65033 (= res!35397 (valid!276 (_2!1036 lt!27803)))))

(declare-fun b!65034 () Bool)

(declare-fun e!42609 () Bool)

(declare-fun call!5315 () Bool)

(assert (=> b!65034 (= e!42609 (not call!5315))))

(declare-fun b!65036 () Bool)

(declare-fun e!42611 () Bool)

(assert (=> b!65036 (= e!42611 e!42609)))

(declare-fun res!35401 () Bool)

(declare-fun call!5318 () Bool)

(assert (=> b!65036 (= res!35401 call!5318)))

(assert (=> b!65036 (=> (not res!35401) (not e!42609))))

(declare-fun b!65037 () Bool)

(declare-fun res!35395 () Bool)

(assert (=> b!65037 (=> (not res!35395) (not e!42607))))

(assert (=> b!65037 (= res!35395 (contains!694 (map!1126 (_2!1036 lt!27803)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65038 () Bool)

(assert (=> b!65038 (= e!42607 (= (map!1126 (_2!1036 lt!27803)) (+!84 (map!1126 newMap!16) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!65039 () Bool)

(declare-fun e!42612 () Unit!1776)

(declare-fun lt!27827 () Unit!1776)

(assert (=> b!65039 (= e!42612 lt!27827)))

(assert (=> b!65039 (= lt!27827 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27817 () SeekEntryResult!225)

(declare-fun call!5316 () SeekEntryResult!225)

(assert (=> b!65039 (= lt!27817 call!5316)))

(declare-fun c!8925 () Bool)

(assert (=> b!65039 (= c!8925 ((_ is MissingZero!225) lt!27817))))

(declare-fun e!42608 () Bool)

(assert (=> b!65039 e!42608))

(declare-fun b!65040 () Bool)

(declare-fun Unit!1788 () Unit!1776)

(assert (=> b!65040 (= e!42612 Unit!1788)))

(declare-fun lt!27802 () Unit!1776)

(assert (=> b!65040 (= lt!27802 (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> b!65040 (= lt!27820 call!5316)))

(declare-fun res!35400 () Bool)

(assert (=> b!65040 (= res!35400 ((_ is Found!225) lt!27820))))

(assert (=> b!65040 (=> (not res!35400) (not e!42606))))

(assert (=> b!65040 e!42606))

(declare-fun lt!27824 () Unit!1776)

(assert (=> b!65040 (= lt!27824 lt!27802)))

(assert (=> b!65040 false))

(declare-fun b!65041 () Bool)

(declare-fun e!42613 () Unit!1776)

(declare-fun Unit!1789 () Unit!1776)

(assert (=> b!65041 (= e!42613 Unit!1789)))

(declare-fun call!5317 () Bool)

(declare-fun c!8926 () Bool)

(declare-fun bm!5312 () Bool)

(assert (=> bm!5312 (= call!5317 (inRange!0 (ite c!8926 (index!3028 lt!27820) (ite c!8925 (index!3027 lt!27817) (index!3030 lt!27817))) (mask!6043 newMap!16)))))

(declare-fun bm!5313 () Bool)

(assert (=> bm!5313 (= call!5315 (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!65042 () Bool)

(declare-fun c!8927 () Bool)

(assert (=> b!65042 (= c!8927 ((_ is MissingVacant!225) lt!27817))))

(assert (=> b!65042 (= e!42608 e!42611)))

(declare-fun b!65043 () Bool)

(declare-fun res!35399 () Bool)

(assert (=> b!65043 (= res!35399 call!5317)))

(assert (=> b!65043 (=> (not res!35399) (not e!42606))))

(declare-fun b!65044 () Bool)

(declare-fun e!42610 () Bool)

(assert (=> b!65044 (= e!42610 (not call!5315))))

(declare-fun b!65045 () Bool)

(declare-fun Unit!1790 () Unit!1776)

(assert (=> b!65045 (= e!42613 Unit!1790)))

(declare-fun lt!27813 () Unit!1776)

(declare-fun lemmaArrayContainsKeyThenInListMap!9 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) (_ BitVec 32) Int) Unit!1776)

(assert (=> b!65045 (= lt!27813 (lemmaArrayContainsKeyThenInListMap!9 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(assert (=> b!65045 (contains!694 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))

(declare-fun lt!27811 () Unit!1776)

(assert (=> b!65045 (= lt!27811 lt!27813)))

(assert (=> b!65045 false))

(declare-fun bm!5314 () Bool)

(assert (=> bm!5314 (= call!5316 (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun d!13555 () Bool)

(assert (=> d!13555 e!42607))

(declare-fun res!35402 () Bool)

(assert (=> d!13555 (=> (not res!35402) (not e!42607))))

(assert (=> d!13555 (= res!35402 (_1!1036 lt!27803))))

(assert (=> d!13555 (= lt!27803 (tuple2!2051 true (LongMapFixedSize!647 (defaultEntry!2121 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (bvadd (_size!372 newMap!16) #b00000000000000000000000000000001) (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))) (_vacant!372 newMap!16))))))

(declare-fun lt!27800 () Unit!1776)

(declare-fun lt!27821 () Unit!1776)

(assert (=> d!13555 (= lt!27800 lt!27821)))

(declare-fun lt!27806 () array!3771)

(declare-fun lt!27815 () array!3773)

(assert (=> d!13555 (contains!694 (getCurrentListMap!396 lt!27806 lt!27815 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623))))))

(assert (=> d!13555 (= lt!27821 (lemmaValidKeyInArrayIsInListMap!79 lt!27806 lt!27815 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13555 (= lt!27815 (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))))))

(assert (=> d!13555 (= lt!27806 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun lt!27826 () Unit!1776)

(declare-fun lt!27818 () Unit!1776)

(assert (=> d!13555 (= lt!27826 lt!27818)))

(declare-fun lt!27829 () array!3771)

(assert (=> d!13555 (= (arrayCountValidKeys!0 lt!27829 (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (bvadd (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3771 (_ BitVec 32)) Unit!1776)

(assert (=> d!13555 (= lt!27818 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!27829 (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623))))))

(assert (=> d!13555 (= lt!27829 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun lt!27809 () Unit!1776)

(declare-fun lt!27823 () Unit!1776)

(assert (=> d!13555 (= lt!27809 lt!27823)))

(declare-fun lt!27812 () array!3771)

(assert (=> d!13555 (arrayContainsKey!0 lt!27812 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13555 (= lt!27823 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!27812 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623))))))

(assert (=> d!13555 (= lt!27812 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun lt!27819 () Unit!1776)

(declare-fun lt!27808 () Unit!1776)

(assert (=> d!13555 (= lt!27819 lt!27808)))

(assert (=> d!13555 (= (+!84 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!9 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1776)

(assert (=> d!13555 (= lt!27808 (lemmaAddValidKeyToArrayThenAddPairToListMap!9 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27816 () Unit!1776)

(declare-fun lt!27814 () Unit!1776)

(assert (=> d!13555 (= lt!27816 lt!27814)))

(assert (=> d!13555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))) (mask!6043 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3771 (_ BitVec 32) (_ BitVec 32)) Unit!1776)

(assert (=> d!13555 (= lt!27814 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (mask!6043 newMap!16)))))

(declare-fun lt!27825 () Unit!1776)

(declare-fun lt!27822 () Unit!1776)

(assert (=> d!13555 (= lt!27825 lt!27822)))

(assert (=> d!13555 (= (arrayCountValidKeys!0 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))) #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3759 newMap!16) #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3771 (_ BitVec 32) (_ BitVec 64)) Unit!1776)

(assert (=> d!13555 (= lt!27822 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3759 newMap!16) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun lt!27828 () Unit!1776)

(declare-fun lt!27805 () Unit!1776)

(assert (=> d!13555 (= lt!27828 lt!27805)))

(declare-fun lt!27804 () List!1439)

(declare-fun lt!27810 () (_ BitVec 32))

(assert (=> d!13555 (arrayNoDuplicates!0 (array!3772 (store (arr!1802 (_keys!3759 newMap!16)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (size!2036 (_keys!3759 newMap!16))) lt!27810 lt!27804)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3771 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1439) Unit!1776)

(assert (=> d!13555 (= lt!27805 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623)) lt!27810 lt!27804))))

(assert (=> d!13555 (= lt!27804 Nil!1436)))

(assert (=> d!13555 (= lt!27810 #b00000000000000000000000000000000)))

(declare-fun lt!27801 () Unit!1776)

(assert (=> d!13555 (= lt!27801 e!42613)))

(declare-fun c!8928 () Bool)

(assert (=> d!13555 (= c!8928 (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!27807 () Unit!1776)

(assert (=> d!13555 (= lt!27807 e!42612)))

(assert (=> d!13555 (= c!8926 (contains!694 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13555 (valid!276 newMap!16)))

(assert (=> d!13555 (= (updateHelperNewKey!19 newMap!16 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8873 (index!3030 lt!27623) (index!3027 lt!27623))) lt!27803)))

(declare-fun b!65035 () Bool)

(declare-fun res!35403 () Bool)

(assert (=> b!65035 (= res!35403 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3030 lt!27817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65035 (=> (not res!35403) (not e!42609))))

(declare-fun b!65046 () Bool)

(assert (=> b!65046 (= e!42611 ((_ is Undefined!225) lt!27817))))

(declare-fun b!65047 () Bool)

(declare-fun res!35396 () Bool)

(assert (=> b!65047 (=> (not res!35396) (not e!42610))))

(assert (=> b!65047 (= res!35396 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3027 lt!27817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5315 () Bool)

(assert (=> bm!5315 (= call!5318 call!5317)))

(declare-fun b!65048 () Bool)

(declare-fun res!35398 () Bool)

(assert (=> b!65048 (=> (not res!35398) (not e!42610))))

(assert (=> b!65048 (= res!35398 call!5318)))

(assert (=> b!65048 (= e!42608 e!42610)))

(assert (= (and d!13555 c!8926) b!65040))

(assert (= (and d!13555 (not c!8926)) b!65039))

(assert (= (and b!65040 res!35400) b!65043))

(assert (= (and b!65043 res!35399) b!65032))

(assert (= (and b!65039 c!8925) b!65048))

(assert (= (and b!65039 (not c!8925)) b!65042))

(assert (= (and b!65048 res!35398) b!65047))

(assert (= (and b!65047 res!35396) b!65044))

(assert (= (and b!65042 c!8927) b!65036))

(assert (= (and b!65042 (not c!8927)) b!65046))

(assert (= (and b!65036 res!35401) b!65035))

(assert (= (and b!65035 res!35403) b!65034))

(assert (= (or b!65048 b!65036) bm!5315))

(assert (= (or b!65044 b!65034) bm!5313))

(assert (= (or b!65043 bm!5315) bm!5312))

(assert (= (or b!65040 b!65039) bm!5314))

(assert (= (and d!13555 c!8928) b!65045))

(assert (= (and d!13555 (not c!8928)) b!65041))

(assert (= (and d!13555 res!35402) b!65033))

(assert (= (and b!65033 res!35397) b!65037))

(assert (= (and b!65037 res!35395) b!65038))

(assert (=> bm!5314 m!59255))

(assert (=> bm!5314 m!59439))

(declare-fun m!59595 () Bool)

(assert (=> b!65037 m!59595))

(assert (=> b!65037 m!59595))

(assert (=> b!65037 m!59255))

(declare-fun m!59597 () Bool)

(assert (=> b!65037 m!59597))

(declare-fun m!59599 () Bool)

(assert (=> b!65033 m!59599))

(declare-fun m!59601 () Bool)

(assert (=> b!65035 m!59601))

(assert (=> b!65040 m!59255))

(assert (=> b!65040 m!59447))

(assert (=> b!65045 m!59255))

(declare-fun m!59603 () Bool)

(assert (=> b!65045 m!59603))

(assert (=> b!65045 m!59417))

(assert (=> b!65045 m!59417))

(assert (=> b!65045 m!59255))

(assert (=> b!65045 m!59457))

(declare-fun m!59605 () Bool)

(assert (=> d!13555 m!59605))

(assert (=> d!13555 m!59255))

(declare-fun m!59607 () Bool)

(assert (=> d!13555 m!59607))

(declare-fun m!59609 () Bool)

(assert (=> d!13555 m!59609))

(assert (=> d!13555 m!59417))

(assert (=> d!13555 m!59255))

(assert (=> d!13555 m!59457))

(declare-fun m!59611 () Bool)

(assert (=> d!13555 m!59611))

(declare-fun m!59613 () Bool)

(assert (=> d!13555 m!59613))

(assert (=> d!13555 m!59417))

(declare-fun m!59615 () Bool)

(assert (=> d!13555 m!59615))

(assert (=> d!13555 m!59613))

(declare-fun m!59617 () Bool)

(assert (=> d!13555 m!59617))

(assert (=> d!13555 m!59271))

(assert (=> d!13555 m!59255))

(declare-fun m!59619 () Bool)

(assert (=> d!13555 m!59619))

(assert (=> d!13555 m!59615))

(declare-fun m!59621 () Bool)

(assert (=> d!13555 m!59621))

(declare-fun m!59623 () Bool)

(assert (=> d!13555 m!59623))

(declare-fun m!59625 () Bool)

(assert (=> d!13555 m!59625))

(declare-fun m!59627 () Bool)

(assert (=> d!13555 m!59627))

(assert (=> d!13555 m!59255))

(assert (=> d!13555 m!59437))

(declare-fun m!59629 () Bool)

(assert (=> d!13555 m!59629))

(assert (=> d!13555 m!59255))

(declare-fun m!59631 () Bool)

(assert (=> d!13555 m!59631))

(assert (=> d!13555 m!59255))

(assert (=> d!13555 m!59291))

(declare-fun m!59633 () Bool)

(assert (=> d!13555 m!59633))

(assert (=> d!13555 m!59255))

(declare-fun m!59635 () Bool)

(assert (=> d!13555 m!59635))

(assert (=> d!13555 m!59417))

(declare-fun m!59637 () Bool)

(assert (=> d!13555 m!59637))

(assert (=> d!13555 m!59255))

(declare-fun m!59639 () Bool)

(assert (=> d!13555 m!59639))

(declare-fun m!59641 () Bool)

(assert (=> d!13555 m!59641))

(assert (=> d!13555 m!59395))

(assert (=> b!65038 m!59595))

(assert (=> b!65038 m!59273))

(assert (=> b!65038 m!59273))

(declare-fun m!59643 () Bool)

(assert (=> b!65038 m!59643))

(assert (=> bm!5313 m!59255))

(assert (=> bm!5313 m!59437))

(declare-fun m!59645 () Bool)

(assert (=> b!65047 m!59645))

(declare-fun m!59647 () Bool)

(assert (=> b!65032 m!59647))

(assert (=> b!65039 m!59255))

(assert (=> b!65039 m!59461))

(declare-fun m!59649 () Bool)

(assert (=> bm!5312 m!59649))

(assert (=> bm!5269 d!13555))

(declare-fun bm!5318 () Bool)

(declare-fun call!5321 () (_ BitVec 32))

(assert (=> bm!5318 (= call!5321 (arrayCountValidKeys!0 (_keys!3759 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65057 () Bool)

(declare-fun e!42619 () (_ BitVec 32))

(declare-fun e!42618 () (_ BitVec 32))

(assert (=> b!65057 (= e!42619 e!42618)))

(declare-fun c!8933 () Bool)

(assert (=> b!65057 (= c!8933 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13557 () Bool)

(declare-fun lt!27832 () (_ BitVec 32))

(assert (=> d!13557 (and (bvsge lt!27832 #b00000000000000000000000000000000) (bvsle lt!27832 (bvsub (size!2036 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13557 (= lt!27832 e!42619)))

(declare-fun c!8934 () Bool)

(assert (=> d!13557 (= c!8934 (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(assert (=> d!13557 (and (bvsle #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2036 (_keys!3759 newMap!16)) (size!2036 (_keys!3759 newMap!16))))))

(assert (=> d!13557 (= (arrayCountValidKeys!0 (_keys!3759 newMap!16) #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) lt!27832)))

(declare-fun b!65058 () Bool)

(assert (=> b!65058 (= e!42618 call!5321)))

(declare-fun b!65059 () Bool)

(assert (=> b!65059 (= e!42619 #b00000000000000000000000000000000)))

(declare-fun b!65060 () Bool)

(assert (=> b!65060 (= e!42618 (bvadd #b00000000000000000000000000000001 call!5321))))

(assert (= (and d!13557 c!8934) b!65059))

(assert (= (and d!13557 (not c!8934)) b!65057))

(assert (= (and b!65057 c!8933) b!65060))

(assert (= (and b!65057 (not c!8933)) b!65058))

(assert (= (or b!65060 b!65058) bm!5318))

(declare-fun m!59651 () Bool)

(assert (=> bm!5318 m!59651))

(declare-fun m!59653 () Bool)

(assert (=> b!65057 m!59653))

(assert (=> b!65057 m!59653))

(declare-fun m!59655 () Bool)

(assert (=> b!65057 m!59655))

(assert (=> b!64724 d!13557))

(declare-fun d!13559 () Bool)

(declare-fun get!1106 (Option!135) V!2881)

(assert (=> d!13559 (= (apply!70 lt!27698 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1106 (getValueByKey!129 (toList!696 lt!27698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2828 () Bool)

(assert (= bs!2828 d!13559))

(assert (=> bs!2828 m!59577))

(assert (=> bs!2828 m!59577))

(declare-fun m!59657 () Bool)

(assert (=> bs!2828 m!59657))

(assert (=> b!64924 d!13559))

(assert (=> d!13523 d!13539))

(declare-fun bm!5319 () Bool)

(declare-fun call!5323 () ListLongMap!1361)

(declare-fun call!5328 () ListLongMap!1361)

(assert (=> bm!5319 (= call!5323 call!5328)))

(declare-fun call!5325 () ListLongMap!1361)

(declare-fun c!8938 () Bool)

(declare-fun call!5324 () ListLongMap!1361)

(declare-fun bm!5320 () Bool)

(declare-fun c!8939 () Bool)

(assert (=> bm!5320 (= call!5325 (+!84 (ite c!8938 call!5324 (ite c!8939 call!5328 call!5323)) (ite (or c!8938 c!8939) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16)))))))

(declare-fun bm!5321 () Bool)

(declare-fun call!5322 () Bool)

(declare-fun lt!27844 () ListLongMap!1361)

(assert (=> bm!5321 (= call!5322 (contains!694 lt!27844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65061 () Bool)

(declare-fun e!42623 () Bool)

(assert (=> b!65061 (= e!42623 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13561 () Bool)

(declare-fun e!42620 () Bool)

(assert (=> d!13561 e!42620))

(declare-fun res!35404 () Bool)

(assert (=> d!13561 (=> (not res!35404) (not e!42620))))

(assert (=> d!13561 (= res!35404 (or (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))))

(declare-fun lt!27835 () ListLongMap!1361)

(assert (=> d!13561 (= lt!27844 lt!27835)))

(declare-fun lt!27834 () Unit!1776)

(declare-fun e!42624 () Unit!1776)

(assert (=> d!13561 (= lt!27834 e!42624)))

(declare-fun c!8937 () Bool)

(assert (=> d!13561 (= c!8937 e!42623)))

(declare-fun res!35406 () Bool)

(assert (=> d!13561 (=> (not res!35406) (not e!42623))))

(assert (=> d!13561 (= res!35406 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun e!42628 () ListLongMap!1361)

(assert (=> d!13561 (= lt!27835 e!42628)))

(assert (=> d!13561 (= c!8938 (and (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13561 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13561 (= (getCurrentListMap!396 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!27844)))

(declare-fun bm!5322 () Bool)

(declare-fun call!5327 () ListLongMap!1361)

(assert (=> bm!5322 (= call!5327 call!5325)))

(declare-fun b!65062 () Bool)

(declare-fun lt!27837 () Unit!1776)

(assert (=> b!65062 (= e!42624 lt!27837)))

(declare-fun lt!27833 () ListLongMap!1361)

(assert (=> b!65062 (= lt!27833 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27843 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27850 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27850 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27851 () Unit!1776)

(assert (=> b!65062 (= lt!27851 (addStillContains!46 lt!27833 lt!27843 (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) lt!27850))))

(assert (=> b!65062 (contains!694 (+!84 lt!27833 (tuple2!2049 lt!27843 (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)))) lt!27850)))

(declare-fun lt!27853 () Unit!1776)

(assert (=> b!65062 (= lt!27853 lt!27851)))

(declare-fun lt!27849 () ListLongMap!1361)

(assert (=> b!65062 (= lt!27849 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27842 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27838 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27838 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27840 () Unit!1776)

(assert (=> b!65062 (= lt!27840 (addApplyDifferent!46 lt!27849 lt!27842 (minValue!2030 newMap!16) lt!27838))))

(assert (=> b!65062 (= (apply!70 (+!84 lt!27849 (tuple2!2049 lt!27842 (minValue!2030 newMap!16))) lt!27838) (apply!70 lt!27849 lt!27838))))

(declare-fun lt!27852 () Unit!1776)

(assert (=> b!65062 (= lt!27852 lt!27840)))

(declare-fun lt!27847 () ListLongMap!1361)

(assert (=> b!65062 (= lt!27847 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27846 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27836 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27836 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27841 () Unit!1776)

(assert (=> b!65062 (= lt!27841 (addApplyDifferent!46 lt!27847 lt!27846 (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) lt!27836))))

(assert (=> b!65062 (= (apply!70 (+!84 lt!27847 (tuple2!2049 lt!27846 (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)))) lt!27836) (apply!70 lt!27847 lt!27836))))

(declare-fun lt!27854 () Unit!1776)

(assert (=> b!65062 (= lt!27854 lt!27841)))

(declare-fun lt!27845 () ListLongMap!1361)

(assert (=> b!65062 (= lt!27845 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27839 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27848 () (_ BitVec 64))

(assert (=> b!65062 (= lt!27848 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65062 (= lt!27837 (addApplyDifferent!46 lt!27845 lt!27839 (minValue!2030 newMap!16) lt!27848))))

(assert (=> b!65062 (= (apply!70 (+!84 lt!27845 (tuple2!2049 lt!27839 (minValue!2030 newMap!16))) lt!27848) (apply!70 lt!27845 lt!27848))))

(declare-fun b!65063 () Bool)

(declare-fun e!42622 () Bool)

(assert (=> b!65063 (= e!42622 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65064 () Bool)

(declare-fun e!42632 () Bool)

(declare-fun call!5326 () Bool)

(assert (=> b!65064 (= e!42632 (not call!5326))))

(declare-fun b!65065 () Bool)

(declare-fun e!42621 () Bool)

(assert (=> b!65065 (= e!42632 e!42621)))

(declare-fun res!35407 () Bool)

(assert (=> b!65065 (= res!35407 call!5326)))

(assert (=> b!65065 (=> (not res!35407) (not e!42621))))

(declare-fun b!65066 () Bool)

(declare-fun e!42626 () Bool)

(assert (=> b!65066 (= e!42626 (= (apply!70 lt!27844 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)) (get!1102 (select (arr!1803 (ite c!8871 (_values!2104 newMap!16) lt!27630)) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2037 (ite c!8871 (_values!2104 newMap!16) lt!27630))))))

(assert (=> b!65066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65067 () Bool)

(declare-fun res!35410 () Bool)

(assert (=> b!65067 (=> (not res!35410) (not e!42620))))

(declare-fun e!42625 () Bool)

(assert (=> b!65067 (= res!35410 e!42625)))

(declare-fun res!35408 () Bool)

(assert (=> b!65067 (=> res!35408 e!42625)))

(assert (=> b!65067 (= res!35408 (not e!42622))))

(declare-fun res!35411 () Bool)

(assert (=> b!65067 (=> (not res!35411) (not e!42622))))

(assert (=> b!65067 (= res!35411 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65068 () Bool)

(declare-fun e!42627 () ListLongMap!1361)

(assert (=> b!65068 (= e!42627 call!5323)))

(declare-fun b!65069 () Bool)

(declare-fun e!42631 () Bool)

(assert (=> b!65069 (= e!42631 (not call!5322))))

(declare-fun b!65070 () Bool)

(declare-fun e!42629 () ListLongMap!1361)

(assert (=> b!65070 (= e!42629 call!5327)))

(declare-fun b!65071 () Bool)

(assert (=> b!65071 (= e!42628 e!42629)))

(assert (=> b!65071 (= c!8939 (and (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65072 () Bool)

(declare-fun c!8936 () Bool)

(assert (=> b!65072 (= c!8936 (and (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65072 (= e!42629 e!42627)))

(declare-fun b!65073 () Bool)

(assert (=> b!65073 (= e!42628 (+!84 call!5325 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16))))))

(declare-fun b!65074 () Bool)

(assert (=> b!65074 (= e!42620 e!42632)))

(declare-fun c!8940 () Bool)

(assert (=> b!65074 (= c!8940 (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65075 () Bool)

(assert (=> b!65075 (= e!42621 (= (apply!70 lt!27844 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 newMap!16)))))

(declare-fun b!65076 () Bool)

(declare-fun Unit!1791 () Unit!1776)

(assert (=> b!65076 (= e!42624 Unit!1791)))

(declare-fun bm!5323 () Bool)

(assert (=> bm!5323 (= call!5326 (contains!694 lt!27844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65077 () Bool)

(declare-fun e!42630 () Bool)

(assert (=> b!65077 (= e!42631 e!42630)))

(declare-fun res!35412 () Bool)

(assert (=> b!65077 (= res!35412 call!5322)))

(assert (=> b!65077 (=> (not res!35412) (not e!42630))))

(declare-fun b!65078 () Bool)

(assert (=> b!65078 (= e!42627 call!5327)))

(declare-fun b!65079 () Bool)

(assert (=> b!65079 (= e!42630 (= (apply!70 lt!27844 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16))))))

(declare-fun bm!5324 () Bool)

(assert (=> bm!5324 (= call!5328 call!5324)))

(declare-fun b!65080 () Bool)

(assert (=> b!65080 (= e!42625 e!42626)))

(declare-fun res!35409 () Bool)

(assert (=> b!65080 (=> (not res!35409) (not e!42626))))

(assert (=> b!65080 (= res!35409 (contains!694 lt!27844 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun bm!5325 () Bool)

(assert (=> bm!5325 (= call!5324 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite c!8871 (_values!2104 newMap!16) lt!27630) (mask!6043 newMap!16) (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) (ite (and c!8871 c!8875) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2030 newMap!16)) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65081 () Bool)

(declare-fun res!35405 () Bool)

(assert (=> b!65081 (=> (not res!35405) (not e!42620))))

(assert (=> b!65081 (= res!35405 e!42631)))

(declare-fun c!8935 () Bool)

(assert (=> b!65081 (= c!8935 (not (= (bvand (ite (and c!8871 c!8875) lt!27634 (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!13561 c!8938) b!65073))

(assert (= (and d!13561 (not c!8938)) b!65071))

(assert (= (and b!65071 c!8939) b!65070))

(assert (= (and b!65071 (not c!8939)) b!65072))

(assert (= (and b!65072 c!8936) b!65078))

(assert (= (and b!65072 (not c!8936)) b!65068))

(assert (= (or b!65078 b!65068) bm!5319))

(assert (= (or b!65070 bm!5319) bm!5324))

(assert (= (or b!65070 b!65078) bm!5322))

(assert (= (or b!65073 bm!5324) bm!5325))

(assert (= (or b!65073 bm!5322) bm!5320))

(assert (= (and d!13561 res!35406) b!65061))

(assert (= (and d!13561 c!8937) b!65062))

(assert (= (and d!13561 (not c!8937)) b!65076))

(assert (= (and d!13561 res!35404) b!65067))

(assert (= (and b!65067 res!35411) b!65063))

(assert (= (and b!65067 (not res!35408)) b!65080))

(assert (= (and b!65080 res!35409) b!65066))

(assert (= (and b!65067 res!35410) b!65081))

(assert (= (and b!65081 c!8935) b!65077))

(assert (= (and b!65081 (not c!8935)) b!65069))

(assert (= (and b!65077 res!35412) b!65079))

(assert (= (or b!65077 b!65069) bm!5321))

(assert (= (and b!65081 res!35405) b!65074))

(assert (= (and b!65074 c!8940) b!65065))

(assert (= (and b!65074 (not c!8940)) b!65064))

(assert (= (and b!65065 res!35407) b!65075))

(assert (= (or b!65065 b!65064) bm!5323))

(declare-fun b_lambda!2919 () Bool)

(assert (=> (not b_lambda!2919) (not b!65066)))

(declare-fun tb!1409 () Bool)

(declare-fun t!4873 () Bool)

(assert (=> (and b!64572 (= (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2121 newMap!16)) t!4873) tb!1409))

(declare-fun result!2507 () Bool)

(assert (=> tb!1409 (= result!2507 tp_is_empty!2425)))

(assert (=> b!65066 t!4873))

(declare-fun b_and!3985 () Bool)

(assert (= b_and!3981 (and (=> t!4873 result!2507) b_and!3985)))

(declare-fun t!4875 () Bool)

(declare-fun tb!1411 () Bool)

(assert (=> (and b!64565 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 newMap!16)) t!4875) tb!1411))

(declare-fun result!2509 () Bool)

(assert (= result!2509 result!2507))

(assert (=> b!65066 t!4875))

(declare-fun b_and!3987 () Bool)

(assert (= b_and!3983 (and (=> t!4875 result!2509) b_and!3987)))

(assert (=> b!65061 m!59653))

(assert (=> b!65061 m!59653))

(assert (=> b!65061 m!59655))

(assert (=> b!65063 m!59653))

(assert (=> b!65063 m!59653))

(assert (=> b!65063 m!59655))

(declare-fun m!59659 () Bool)

(assert (=> bm!5320 m!59659))

(declare-fun m!59661 () Bool)

(assert (=> b!65073 m!59661))

(assert (=> b!65080 m!59653))

(assert (=> b!65080 m!59653))

(declare-fun m!59663 () Bool)

(assert (=> b!65080 m!59663))

(declare-fun m!59665 () Bool)

(assert (=> bm!5323 m!59665))

(declare-fun m!59667 () Bool)

(assert (=> bm!5321 m!59667))

(assert (=> d!13561 m!59581))

(assert (=> b!65066 m!59653))

(declare-fun m!59669 () Bool)

(assert (=> b!65066 m!59669))

(assert (=> b!65066 m!59653))

(declare-fun m!59671 () Bool)

(assert (=> b!65066 m!59671))

(declare-fun m!59673 () Bool)

(assert (=> b!65066 m!59673))

(assert (=> b!65066 m!59669))

(declare-fun m!59675 () Bool)

(assert (=> b!65066 m!59675))

(assert (=> b!65066 m!59673))

(declare-fun m!59677 () Bool)

(assert (=> b!65079 m!59677))

(declare-fun m!59679 () Bool)

(assert (=> b!65075 m!59679))

(declare-fun m!59681 () Bool)

(assert (=> bm!5325 m!59681))

(declare-fun m!59683 () Bool)

(assert (=> b!65062 m!59683))

(declare-fun m!59685 () Bool)

(assert (=> b!65062 m!59685))

(assert (=> b!65062 m!59653))

(declare-fun m!59687 () Bool)

(assert (=> b!65062 m!59687))

(declare-fun m!59689 () Bool)

(assert (=> b!65062 m!59689))

(declare-fun m!59691 () Bool)

(assert (=> b!65062 m!59691))

(declare-fun m!59693 () Bool)

(assert (=> b!65062 m!59693))

(assert (=> b!65062 m!59691))

(declare-fun m!59695 () Bool)

(assert (=> b!65062 m!59695))

(declare-fun m!59697 () Bool)

(assert (=> b!65062 m!59697))

(assert (=> b!65062 m!59681))

(assert (=> b!65062 m!59687))

(declare-fun m!59699 () Bool)

(assert (=> b!65062 m!59699))

(declare-fun m!59701 () Bool)

(assert (=> b!65062 m!59701))

(assert (=> b!65062 m!59685))

(declare-fun m!59703 () Bool)

(assert (=> b!65062 m!59703))

(declare-fun m!59705 () Bool)

(assert (=> b!65062 m!59705))

(assert (=> b!65062 m!59701))

(declare-fun m!59707 () Bool)

(assert (=> b!65062 m!59707))

(declare-fun m!59709 () Bool)

(assert (=> b!65062 m!59709))

(declare-fun m!59711 () Bool)

(assert (=> b!65062 m!59711))

(assert (=> bm!5267 d!13561))

(declare-fun d!13563 () Bool)

(assert (=> d!13563 (= (get!1104 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2446 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!64866 d!13563))

(declare-fun d!13565 () Bool)

(declare-fun e!42635 () Bool)

(assert (=> d!13565 e!42635))

(declare-fun res!35417 () Bool)

(assert (=> d!13565 (=> (not res!35417) (not e!42635))))

(declare-fun lt!27863 () ListLongMap!1361)

(assert (=> d!13565 (= res!35417 (contains!694 lt!27863 (_1!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27865 () List!1438)

(assert (=> d!13565 (= lt!27863 (ListLongMap!1362 lt!27865))))

(declare-fun lt!27864 () Unit!1776)

(declare-fun lt!27866 () Unit!1776)

(assert (=> d!13565 (= lt!27864 lt!27866)))

(assert (=> d!13565 (= (getValueByKey!129 lt!27865 (_1!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!46 (List!1438 (_ BitVec 64) V!2881) Unit!1776)

(assert (=> d!13565 (= lt!27866 (lemmaContainsTupThenGetReturnValue!46 lt!27865 (_1!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun insertStrictlySorted!49 (List!1438 (_ BitVec 64) V!2881) List!1438)

(assert (=> d!13565 (= lt!27865 (insertStrictlySorted!49 (toList!696 call!5295) (_1!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13565 (= (+!84 call!5295 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27863)))

(declare-fun b!65086 () Bool)

(declare-fun res!35418 () Bool)

(assert (=> b!65086 (=> (not res!35418) (not e!42635))))

(assert (=> b!65086 (= res!35418 (= (getValueByKey!129 (toList!696 lt!27863) (_1!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65087 () Bool)

(declare-fun contains!697 (List!1438 tuple2!2048) Bool)

(assert (=> b!65087 (= e!42635 (contains!697 (toList!696 lt!27863) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13565 res!35417) b!65086))

(assert (= (and b!65086 res!35418) b!65087))

(declare-fun m!59713 () Bool)

(assert (=> d!13565 m!59713))

(declare-fun m!59715 () Bool)

(assert (=> d!13565 m!59715))

(declare-fun m!59717 () Bool)

(assert (=> d!13565 m!59717))

(declare-fun m!59719 () Bool)

(assert (=> d!13565 m!59719))

(declare-fun m!59721 () Bool)

(assert (=> b!65086 m!59721))

(declare-fun m!59723 () Bool)

(assert (=> b!65087 m!59723))

(assert (=> b!64922 d!13565))

(assert (=> bm!5266 d!13521))

(assert (=> d!13529 d!13533))

(declare-fun d!13567 () Bool)

(assert (=> d!13567 (not (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13567 true))

(declare-fun _$68!43 () Unit!1776)

(assert (=> d!13567 (= (choose!68 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436)) _$68!43)))

(declare-fun bs!2829 () Bool)

(assert (= bs!2829 d!13567))

(assert (=> bs!2829 m!59255))

(assert (=> bs!2829 m!59259))

(assert (=> d!13529 d!13567))

(declare-fun d!13569 () Bool)

(assert (=> d!13569 (= (inRange!0 (ite c!8872 (ite c!8878 (index!3028 lt!27635) (ite c!8879 (index!3027 lt!27618) (index!3030 lt!27618))) (ite c!8877 (index!3028 lt!27620) (ite c!8881 (index!3027 lt!27627) (index!3030 lt!27627)))) (mask!6043 newMap!16)) (and (bvsge (ite c!8872 (ite c!8878 (index!3028 lt!27635) (ite c!8879 (index!3027 lt!27618) (index!3030 lt!27618))) (ite c!8877 (index!3028 lt!27620) (ite c!8881 (index!3027 lt!27627) (index!3030 lt!27627)))) #b00000000000000000000000000000000) (bvslt (ite c!8872 (ite c!8878 (index!3028 lt!27635) (ite c!8879 (index!3027 lt!27618) (index!3030 lt!27618))) (ite c!8877 (index!3028 lt!27620) (ite c!8881 (index!3027 lt!27627) (index!3030 lt!27627)))) (bvadd (mask!6043 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5254 d!13569))

(declare-fun d!13571 () Bool)

(declare-fun res!35419 () Bool)

(declare-fun e!42636 () Bool)

(assert (=> d!13571 (=> (not res!35419) (not e!42636))))

(assert (=> d!13571 (= res!35419 (simpleValid!46 (_2!1036 lt!27641)))))

(assert (=> d!13571 (= (valid!276 (_2!1036 lt!27641)) e!42636)))

(declare-fun b!65088 () Bool)

(declare-fun res!35420 () Bool)

(assert (=> b!65088 (=> (not res!35420) (not e!42636))))

(assert (=> b!65088 (= res!35420 (= (arrayCountValidKeys!0 (_keys!3759 (_2!1036 lt!27641)) #b00000000000000000000000000000000 (size!2036 (_keys!3759 (_2!1036 lt!27641)))) (_size!372 (_2!1036 lt!27641))))))

(declare-fun b!65089 () Bool)

(declare-fun res!35421 () Bool)

(assert (=> b!65089 (=> (not res!35421) (not e!42636))))

(assert (=> b!65089 (= res!35421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 (_2!1036 lt!27641)) (mask!6043 (_2!1036 lt!27641))))))

(declare-fun b!65090 () Bool)

(assert (=> b!65090 (= e!42636 (arrayNoDuplicates!0 (_keys!3759 (_2!1036 lt!27641)) #b00000000000000000000000000000000 Nil!1436))))

(assert (= (and d!13571 res!35419) b!65088))

(assert (= (and b!65088 res!35420) b!65089))

(assert (= (and b!65089 res!35421) b!65090))

(declare-fun m!59725 () Bool)

(assert (=> d!13571 m!59725))

(declare-fun m!59727 () Bool)

(assert (=> b!65088 m!59727))

(declare-fun m!59729 () Bool)

(assert (=> b!65089 m!59729))

(declare-fun m!59731 () Bool)

(assert (=> b!65090 m!59731))

(assert (=> d!13513 d!13571))

(assert (=> d!13513 d!13509))

(declare-fun bm!5326 () Bool)

(declare-fun call!5330 () ListLongMap!1361)

(declare-fun call!5335 () ListLongMap!1361)

(assert (=> bm!5326 (= call!5330 call!5335)))

(declare-fun bm!5327 () Bool)

(declare-fun call!5332 () ListLongMap!1361)

(declare-fun c!8944 () Bool)

(declare-fun c!8945 () Bool)

(declare-fun call!5331 () ListLongMap!1361)

(assert (=> bm!5327 (= call!5332 (+!84 (ite c!8944 call!5331 (ite c!8945 call!5335 call!5330)) (ite (or c!8944 c!8945) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 newMap!16)) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16)))))))

(declare-fun bm!5328 () Bool)

(declare-fun call!5329 () Bool)

(declare-fun lt!27878 () ListLongMap!1361)

(assert (=> bm!5328 (= call!5329 (contains!694 lt!27878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65091 () Bool)

(declare-fun e!42640 () Bool)

(assert (=> b!65091 (= e!42640 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13573 () Bool)

(declare-fun e!42637 () Bool)

(assert (=> d!13573 e!42637))

(declare-fun res!35422 () Bool)

(assert (=> d!13573 (=> (not res!35422) (not e!42637))))

(assert (=> d!13573 (= res!35422 (or (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))))

(declare-fun lt!27869 () ListLongMap!1361)

(assert (=> d!13573 (= lt!27878 lt!27869)))

(declare-fun lt!27868 () Unit!1776)

(declare-fun e!42641 () Unit!1776)

(assert (=> d!13573 (= lt!27868 e!42641)))

(declare-fun c!8943 () Bool)

(assert (=> d!13573 (= c!8943 e!42640)))

(declare-fun res!35424 () Bool)

(assert (=> d!13573 (=> (not res!35424) (not e!42640))))

(assert (=> d!13573 (= res!35424 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun e!42645 () ListLongMap!1361)

(assert (=> d!13573 (= lt!27869 e!42645)))

(assert (=> d!13573 (= c!8944 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13573 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13573 (= (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!27878)))

(declare-fun bm!5329 () Bool)

(declare-fun call!5334 () ListLongMap!1361)

(assert (=> bm!5329 (= call!5334 call!5332)))

(declare-fun b!65092 () Bool)

(declare-fun lt!27871 () Unit!1776)

(assert (=> b!65092 (= e!42641 lt!27871)))

(declare-fun lt!27867 () ListLongMap!1361)

(assert (=> b!65092 (= lt!27867 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27877 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27884 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27884 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27885 () Unit!1776)

(assert (=> b!65092 (= lt!27885 (addStillContains!46 lt!27867 lt!27877 (zeroValue!2030 newMap!16) lt!27884))))

(assert (=> b!65092 (contains!694 (+!84 lt!27867 (tuple2!2049 lt!27877 (zeroValue!2030 newMap!16))) lt!27884)))

(declare-fun lt!27887 () Unit!1776)

(assert (=> b!65092 (= lt!27887 lt!27885)))

(declare-fun lt!27883 () ListLongMap!1361)

(assert (=> b!65092 (= lt!27883 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27876 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27872 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27872 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27874 () Unit!1776)

(assert (=> b!65092 (= lt!27874 (addApplyDifferent!46 lt!27883 lt!27876 (minValue!2030 newMap!16) lt!27872))))

(assert (=> b!65092 (= (apply!70 (+!84 lt!27883 (tuple2!2049 lt!27876 (minValue!2030 newMap!16))) lt!27872) (apply!70 lt!27883 lt!27872))))

(declare-fun lt!27886 () Unit!1776)

(assert (=> b!65092 (= lt!27886 lt!27874)))

(declare-fun lt!27881 () ListLongMap!1361)

(assert (=> b!65092 (= lt!27881 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27880 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27870 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27870 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27875 () Unit!1776)

(assert (=> b!65092 (= lt!27875 (addApplyDifferent!46 lt!27881 lt!27880 (zeroValue!2030 newMap!16) lt!27870))))

(assert (=> b!65092 (= (apply!70 (+!84 lt!27881 (tuple2!2049 lt!27880 (zeroValue!2030 newMap!16))) lt!27870) (apply!70 lt!27881 lt!27870))))

(declare-fun lt!27888 () Unit!1776)

(assert (=> b!65092 (= lt!27888 lt!27875)))

(declare-fun lt!27879 () ListLongMap!1361)

(assert (=> b!65092 (= lt!27879 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27873 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27873 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27882 () (_ BitVec 64))

(assert (=> b!65092 (= lt!27882 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65092 (= lt!27871 (addApplyDifferent!46 lt!27879 lt!27873 (minValue!2030 newMap!16) lt!27882))))

(assert (=> b!65092 (= (apply!70 (+!84 lt!27879 (tuple2!2049 lt!27873 (minValue!2030 newMap!16))) lt!27882) (apply!70 lt!27879 lt!27882))))

(declare-fun b!65093 () Bool)

(declare-fun e!42639 () Bool)

(assert (=> b!65093 (= e!42639 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65094 () Bool)

(declare-fun e!42649 () Bool)

(declare-fun call!5333 () Bool)

(assert (=> b!65094 (= e!42649 (not call!5333))))

(declare-fun b!65095 () Bool)

(declare-fun e!42638 () Bool)

(assert (=> b!65095 (= e!42649 e!42638)))

(declare-fun res!35425 () Bool)

(assert (=> b!65095 (= res!35425 call!5333)))

(assert (=> b!65095 (=> (not res!35425) (not e!42638))))

(declare-fun b!65096 () Bool)

(declare-fun e!42643 () Bool)

(assert (=> b!65096 (= e!42643 (= (apply!70 lt!27878 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)) (get!1102 (select (arr!1803 (_values!2104 newMap!16)) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2037 (_values!2104 newMap!16))))))

(assert (=> b!65096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65097 () Bool)

(declare-fun res!35428 () Bool)

(assert (=> b!65097 (=> (not res!35428) (not e!42637))))

(declare-fun e!42642 () Bool)

(assert (=> b!65097 (= res!35428 e!42642)))

(declare-fun res!35426 () Bool)

(assert (=> b!65097 (=> res!35426 e!42642)))

(assert (=> b!65097 (= res!35426 (not e!42639))))

(declare-fun res!35429 () Bool)

(assert (=> b!65097 (=> (not res!35429) (not e!42639))))

(assert (=> b!65097 (= res!35429 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65098 () Bool)

(declare-fun e!42644 () ListLongMap!1361)

(assert (=> b!65098 (= e!42644 call!5330)))

(declare-fun b!65099 () Bool)

(declare-fun e!42648 () Bool)

(assert (=> b!65099 (= e!42648 (not call!5329))))

(declare-fun b!65100 () Bool)

(declare-fun e!42646 () ListLongMap!1361)

(assert (=> b!65100 (= e!42646 call!5334)))

(declare-fun b!65101 () Bool)

(assert (=> b!65101 (= e!42645 e!42646)))

(assert (=> b!65101 (= c!8945 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65102 () Bool)

(declare-fun c!8942 () Bool)

(assert (=> b!65102 (= c!8942 (and (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65102 (= e!42646 e!42644)))

(declare-fun b!65103 () Bool)

(assert (=> b!65103 (= e!42645 (+!84 call!5332 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 newMap!16))))))

(declare-fun b!65104 () Bool)

(assert (=> b!65104 (= e!42637 e!42649)))

(declare-fun c!8946 () Bool)

(assert (=> b!65104 (= c!8946 (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65105 () Bool)

(assert (=> b!65105 (= e!42638 (= (apply!70 lt!27878 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2030 newMap!16)))))

(declare-fun b!65106 () Bool)

(declare-fun Unit!1792 () Unit!1776)

(assert (=> b!65106 (= e!42641 Unit!1792)))

(declare-fun bm!5330 () Bool)

(assert (=> bm!5330 (= call!5333 (contains!694 lt!27878 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65107 () Bool)

(declare-fun e!42647 () Bool)

(assert (=> b!65107 (= e!42648 e!42647)))

(declare-fun res!35430 () Bool)

(assert (=> b!65107 (= res!35430 call!5329)))

(assert (=> b!65107 (=> (not res!35430) (not e!42647))))

(declare-fun b!65108 () Bool)

(assert (=> b!65108 (= e!42644 call!5334)))

(declare-fun b!65109 () Bool)

(assert (=> b!65109 (= e!42647 (= (apply!70 lt!27878 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 newMap!16)))))

(declare-fun bm!5331 () Bool)

(assert (=> bm!5331 (= call!5335 call!5331)))

(declare-fun b!65110 () Bool)

(assert (=> b!65110 (= e!42642 e!42643)))

(declare-fun res!35427 () Bool)

(assert (=> b!65110 (=> (not res!35427) (not e!42643))))

(assert (=> b!65110 (= res!35427 (contains!694 lt!27878 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65110 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun bm!5332 () Bool)

(assert (=> bm!5332 (= call!5331 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65111 () Bool)

(declare-fun res!35423 () Bool)

(assert (=> b!65111 (=> (not res!35423) (not e!42637))))

(assert (=> b!65111 (= res!35423 e!42648)))

(declare-fun c!8941 () Bool)

(assert (=> b!65111 (= c!8941 (not (= (bvand (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!13573 c!8944) b!65103))

(assert (= (and d!13573 (not c!8944)) b!65101))

(assert (= (and b!65101 c!8945) b!65100))

(assert (= (and b!65101 (not c!8945)) b!65102))

(assert (= (and b!65102 c!8942) b!65108))

(assert (= (and b!65102 (not c!8942)) b!65098))

(assert (= (or b!65108 b!65098) bm!5326))

(assert (= (or b!65100 bm!5326) bm!5331))

(assert (= (or b!65100 b!65108) bm!5329))

(assert (= (or b!65103 bm!5331) bm!5332))

(assert (= (or b!65103 bm!5329) bm!5327))

(assert (= (and d!13573 res!35424) b!65091))

(assert (= (and d!13573 c!8943) b!65092))

(assert (= (and d!13573 (not c!8943)) b!65106))

(assert (= (and d!13573 res!35422) b!65097))

(assert (= (and b!65097 res!35429) b!65093))

(assert (= (and b!65097 (not res!35426)) b!65110))

(assert (= (and b!65110 res!35427) b!65096))

(assert (= (and b!65097 res!35428) b!65111))

(assert (= (and b!65111 c!8941) b!65107))

(assert (= (and b!65111 (not c!8941)) b!65099))

(assert (= (and b!65107 res!35430) b!65109))

(assert (= (or b!65107 b!65099) bm!5328))

(assert (= (and b!65111 res!35423) b!65104))

(assert (= (and b!65104 c!8946) b!65095))

(assert (= (and b!65104 (not c!8946)) b!65094))

(assert (= (and b!65095 res!35425) b!65105))

(assert (= (or b!65095 b!65094) bm!5330))

(declare-fun b_lambda!2921 () Bool)

(assert (=> (not b_lambda!2921) (not b!65096)))

(assert (=> b!65096 t!4873))

(declare-fun b_and!3989 () Bool)

(assert (= b_and!3985 (and (=> t!4873 result!2507) b_and!3989)))

(assert (=> b!65096 t!4875))

(declare-fun b_and!3991 () Bool)

(assert (= b_and!3987 (and (=> t!4875 result!2509) b_and!3991)))

(assert (=> b!65091 m!59653))

(assert (=> b!65091 m!59653))

(assert (=> b!65091 m!59655))

(assert (=> b!65093 m!59653))

(assert (=> b!65093 m!59653))

(assert (=> b!65093 m!59655))

(declare-fun m!59733 () Bool)

(assert (=> bm!5327 m!59733))

(declare-fun m!59735 () Bool)

(assert (=> b!65103 m!59735))

(assert (=> b!65110 m!59653))

(assert (=> b!65110 m!59653))

(declare-fun m!59737 () Bool)

(assert (=> b!65110 m!59737))

(declare-fun m!59739 () Bool)

(assert (=> bm!5330 m!59739))

(declare-fun m!59741 () Bool)

(assert (=> bm!5328 m!59741))

(assert (=> d!13573 m!59581))

(assert (=> b!65096 m!59653))

(assert (=> b!65096 m!59669))

(assert (=> b!65096 m!59653))

(declare-fun m!59743 () Bool)

(assert (=> b!65096 m!59743))

(declare-fun m!59745 () Bool)

(assert (=> b!65096 m!59745))

(assert (=> b!65096 m!59669))

(declare-fun m!59747 () Bool)

(assert (=> b!65096 m!59747))

(assert (=> b!65096 m!59745))

(declare-fun m!59749 () Bool)

(assert (=> b!65109 m!59749))

(declare-fun m!59751 () Bool)

(assert (=> b!65105 m!59751))

(declare-fun m!59753 () Bool)

(assert (=> bm!5332 m!59753))

(declare-fun m!59755 () Bool)

(assert (=> b!65092 m!59755))

(declare-fun m!59757 () Bool)

(assert (=> b!65092 m!59757))

(assert (=> b!65092 m!59653))

(declare-fun m!59759 () Bool)

(assert (=> b!65092 m!59759))

(declare-fun m!59761 () Bool)

(assert (=> b!65092 m!59761))

(declare-fun m!59763 () Bool)

(assert (=> b!65092 m!59763))

(declare-fun m!59765 () Bool)

(assert (=> b!65092 m!59765))

(assert (=> b!65092 m!59763))

(declare-fun m!59767 () Bool)

(assert (=> b!65092 m!59767))

(declare-fun m!59769 () Bool)

(assert (=> b!65092 m!59769))

(assert (=> b!65092 m!59753))

(assert (=> b!65092 m!59759))

(declare-fun m!59771 () Bool)

(assert (=> b!65092 m!59771))

(declare-fun m!59773 () Bool)

(assert (=> b!65092 m!59773))

(assert (=> b!65092 m!59757))

(declare-fun m!59775 () Bool)

(assert (=> b!65092 m!59775))

(declare-fun m!59777 () Bool)

(assert (=> b!65092 m!59777))

(assert (=> b!65092 m!59773))

(declare-fun m!59779 () Bool)

(assert (=> b!65092 m!59779))

(declare-fun m!59781 () Bool)

(assert (=> b!65092 m!59781))

(declare-fun m!59783 () Bool)

(assert (=> b!65092 m!59783))

(assert (=> d!13521 d!13573))

(declare-fun d!13575 () Bool)

(declare-fun e!42651 () Bool)

(assert (=> d!13575 e!42651))

(declare-fun res!35431 () Bool)

(assert (=> d!13575 (=> res!35431 e!42651)))

(declare-fun lt!27892 () Bool)

(assert (=> d!13575 (= res!35431 (not lt!27892))))

(declare-fun lt!27891 () Bool)

(assert (=> d!13575 (= lt!27892 lt!27891)))

(declare-fun lt!27889 () Unit!1776)

(declare-fun e!42650 () Unit!1776)

(assert (=> d!13575 (= lt!27889 e!42650)))

(declare-fun c!8947 () Bool)

(assert (=> d!13575 (= c!8947 lt!27891)))

(assert (=> d!13575 (= lt!27891 (containsKey!132 (toList!696 e!42476) (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623)))))))

(assert (=> d!13575 (= (contains!694 e!42476 (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623)))) lt!27892)))

(declare-fun b!65112 () Bool)

(declare-fun lt!27890 () Unit!1776)

(assert (=> b!65112 (= e!42650 lt!27890)))

(assert (=> b!65112 (= lt!27890 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 e!42476) (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623)))))))

(assert (=> b!65112 (isDefined!81 (getValueByKey!129 (toList!696 e!42476) (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623)))))))

(declare-fun b!65113 () Bool)

(declare-fun Unit!1793 () Unit!1776)

(assert (=> b!65113 (= e!42650 Unit!1793)))

(declare-fun b!65114 () Bool)

(assert (=> b!65114 (= e!42651 (isDefined!81 (getValueByKey!129 (toList!696 e!42476) (ite c!8872 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623))))))))

(assert (= (and d!13575 c!8947) b!65112))

(assert (= (and d!13575 (not c!8947)) b!65113))

(assert (= (and d!13575 (not res!35431)) b!65114))

(declare-fun m!59785 () Bool)

(assert (=> d!13575 m!59785))

(declare-fun m!59787 () Bool)

(assert (=> b!65112 m!59787))

(declare-fun m!59789 () Bool)

(assert (=> b!65112 m!59789))

(assert (=> b!65112 m!59789))

(declare-fun m!59791 () Bool)

(assert (=> b!65112 m!59791))

(assert (=> b!65114 m!59789))

(assert (=> b!65114 m!59789))

(assert (=> b!65114 m!59791))

(assert (=> bm!5263 d!13575))

(declare-fun d!13577 () Bool)

(declare-fun res!35436 () Bool)

(declare-fun e!42656 () Bool)

(assert (=> d!13577 (=> res!35436 e!42656)))

(assert (=> d!13577 (= res!35436 (and ((_ is Cons!1434) (toList!696 lt!27503)) (= (_1!1035 (h!2018 (toList!696 lt!27503))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (=> d!13577 (= (containsKey!132 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) e!42656)))

(declare-fun b!65119 () Bool)

(declare-fun e!42657 () Bool)

(assert (=> b!65119 (= e!42656 e!42657)))

(declare-fun res!35437 () Bool)

(assert (=> b!65119 (=> (not res!35437) (not e!42657))))

(assert (=> b!65119 (= res!35437 (and (or (not ((_ is Cons!1434) (toList!696 lt!27503))) (bvsle (_1!1035 (h!2018 (toList!696 lt!27503))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))) ((_ is Cons!1434) (toList!696 lt!27503)) (bvslt (_1!1035 (h!2018 (toList!696 lt!27503))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(declare-fun b!65120 () Bool)

(assert (=> b!65120 (= e!42657 (containsKey!132 (t!4860 (toList!696 lt!27503)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13577 (not res!35436)) b!65119))

(assert (= (and b!65119 res!35437) b!65120))

(assert (=> b!65120 m!59255))

(declare-fun m!59793 () Bool)

(assert (=> b!65120 m!59793))

(assert (=> d!13511 d!13577))

(declare-fun d!13579 () Bool)

(assert (=> d!13579 (= (apply!70 lt!27698 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1106 (getValueByKey!129 (toList!696 lt!27698) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2830 () Bool)

(assert (= bs!2830 d!13579))

(assert (=> bs!2830 m!59469))

(declare-fun m!59795 () Bool)

(assert (=> bs!2830 m!59795))

(assert (=> bs!2830 m!59795))

(declare-fun m!59797 () Bool)

(assert (=> bs!2830 m!59797))

(assert (=> b!64915 d!13579))

(declare-fun d!13581 () Bool)

(declare-fun c!8948 () Bool)

(assert (=> d!13581 (= c!8948 ((_ is ValueCellFull!869) (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42658 () V!2881)

(assert (=> d!13581 (= (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42658)))

(declare-fun b!65121 () Bool)

(assert (=> b!65121 (= e!42658 (get!1104 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65122 () Bool)

(assert (=> b!65122 (= e!42658 (get!1105 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13581 c!8948) b!65121))

(assert (= (and d!13581 (not c!8948)) b!65122))

(assert (=> b!65121 m!59485))

(assert (=> b!65121 m!59289))

(declare-fun m!59799 () Bool)

(assert (=> b!65121 m!59799))

(assert (=> b!65122 m!59485))

(assert (=> b!65122 m!59289))

(declare-fun m!59801 () Bool)

(assert (=> b!65122 m!59801))

(assert (=> b!64915 d!13581))

(assert (=> b!64953 d!13533))

(declare-fun b!65123 () Bool)

(declare-fun e!42660 () Bool)

(declare-fun e!42662 () Bool)

(assert (=> b!65123 (= e!42660 e!42662)))

(declare-fun c!8949 () Bool)

(assert (=> b!65123 (= c!8949 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!65124 () Bool)

(declare-fun call!5336 () Bool)

(assert (=> b!65124 (= e!42662 call!5336)))

(declare-fun b!65125 () Bool)

(declare-fun e!42659 () Bool)

(assert (=> b!65125 (= e!42659 e!42660)))

(declare-fun res!35440 () Bool)

(assert (=> b!65125 (=> (not res!35440) (not e!42660))))

(declare-fun e!42661 () Bool)

(assert (=> b!65125 (= res!35440 (not e!42661))))

(declare-fun res!35439 () Bool)

(assert (=> b!65125 (=> (not res!35439) (not e!42661))))

(assert (=> b!65125 (= res!35439 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!5333 () Bool)

(assert (=> bm!5333 (= call!5336 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8949 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!8914 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1436) Nil!1436)) (ite c!8914 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1436) Nil!1436))))))

(declare-fun b!65127 () Bool)

(assert (=> b!65127 (= e!42661 (contains!696 (ite c!8914 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1436) Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!65126 () Bool)

(assert (=> b!65126 (= e!42662 call!5336)))

(declare-fun d!13583 () Bool)

(declare-fun res!35438 () Bool)

(assert (=> d!13583 (=> res!35438 e!42659)))

(assert (=> d!13583 (= res!35438 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13583 (= (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8914 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) Nil!1436) Nil!1436)) e!42659)))

(assert (= (and d!13583 (not res!35438)) b!65125))

(assert (= (and b!65125 res!35439) b!65127))

(assert (= (and b!65125 res!35440) b!65123))

(assert (= (and b!65123 c!8949) b!65124))

(assert (= (and b!65123 (not c!8949)) b!65126))

(assert (= (or b!65124 b!65126) bm!5333))

(assert (=> b!65123 m!59561))

(assert (=> b!65123 m!59561))

(assert (=> b!65123 m!59569))

(assert (=> b!65125 m!59561))

(assert (=> b!65125 m!59561))

(assert (=> b!65125 m!59569))

(assert (=> bm!5333 m!59561))

(declare-fun m!59803 () Bool)

(assert (=> bm!5333 m!59803))

(assert (=> b!65127 m!59561))

(assert (=> b!65127 m!59561))

(declare-fun m!59805 () Bool)

(assert (=> b!65127 m!59805))

(assert (=> bm!5302 d!13583))

(declare-fun d!13585 () Bool)

(declare-fun res!35441 () Bool)

(declare-fun e!42663 () Bool)

(assert (=> d!13585 (=> (not res!35441) (not e!42663))))

(assert (=> d!13585 (= res!35441 (simpleValid!46 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13585 (= (valid!276 (v!2447 (underlying!239 thiss!992))) e!42663)))

(declare-fun b!65128 () Bool)

(declare-fun res!35442 () Bool)

(assert (=> b!65128 (=> (not res!35442) (not e!42663))))

(assert (=> b!65128 (= res!35442 (= (arrayCountValidKeys!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))) (_size!372 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65129 () Bool)

(declare-fun res!35443 () Bool)

(assert (=> b!65129 (=> (not res!35443) (not e!42663))))

(assert (=> b!65129 (= res!35443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65130 () Bool)

(assert (=> b!65130 (= e!42663 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 Nil!1436))))

(assert (= (and d!13585 res!35441) b!65128))

(assert (= (and b!65128 res!35442) b!65129))

(assert (= (and b!65129 res!35443) b!65130))

(declare-fun m!59807 () Bool)

(assert (=> d!13585 m!59807))

(declare-fun m!59809 () Bool)

(assert (=> b!65128 m!59809))

(assert (=> b!65129 m!59267))

(assert (=> b!65130 m!59269))

(assert (=> d!13525 d!13585))

(declare-fun d!13587 () Bool)

(assert (=> d!13587 (= (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64972 d!13587))

(declare-fun d!13589 () Bool)

(declare-fun e!42664 () Bool)

(assert (=> d!13589 e!42664))

(declare-fun res!35444 () Bool)

(assert (=> d!13589 (=> (not res!35444) (not e!42664))))

(declare-fun lt!27893 () ListLongMap!1361)

(assert (=> d!13589 (= res!35444 (contains!694 lt!27893 (_1!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!27895 () List!1438)

(assert (=> d!13589 (= lt!27893 (ListLongMap!1362 lt!27895))))

(declare-fun lt!27894 () Unit!1776)

(declare-fun lt!27896 () Unit!1776)

(assert (=> d!13589 (= lt!27894 lt!27896)))

(assert (=> d!13589 (= (getValueByKey!129 lt!27895 (_1!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!134 (_2!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13589 (= lt!27896 (lemmaContainsTupThenGetReturnValue!46 lt!27895 (_1!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13589 (= lt!27895 (insertStrictlySorted!49 (toList!696 call!5265) (_1!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13589 (= (+!84 call!5265 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!27893)))

(declare-fun b!65131 () Bool)

(declare-fun res!35445 () Bool)

(assert (=> b!65131 (=> (not res!35445) (not e!42664))))

(assert (=> b!65131 (= res!35445 (= (getValueByKey!129 (toList!696 lt!27893) (_1!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!134 (_2!1035 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!65132 () Bool)

(assert (=> b!65132 (= e!42664 (contains!697 (toList!696 lt!27893) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13589 res!35444) b!65131))

(assert (= (and b!65131 res!35445) b!65132))

(declare-fun m!59811 () Bool)

(assert (=> d!13589 m!59811))

(declare-fun m!59813 () Bool)

(assert (=> d!13589 m!59813))

(declare-fun m!59815 () Bool)

(assert (=> d!13589 m!59815))

(declare-fun m!59817 () Bool)

(assert (=> d!13589 m!59817))

(declare-fun m!59819 () Bool)

(assert (=> b!65131 m!59819))

(declare-fun m!59821 () Bool)

(assert (=> b!65132 m!59821))

(assert (=> b!64851 d!13589))

(assert (=> d!13531 d!13537))

(declare-fun d!13591 () Bool)

(assert (=> d!13591 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) from!355 Nil!1436)))

(assert (=> d!13591 true))

(declare-fun _$71!84 () Unit!1776)

(assert (=> d!13591 (= (choose!39 (_keys!3759 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!84)))

(declare-fun bs!2831 () Bool)

(assert (= bs!2831 d!13591))

(assert (=> bs!2831 m!59253))

(assert (=> d!13531 d!13591))

(declare-fun b!65158 () Bool)

(declare-fun res!35456 () Bool)

(declare-fun e!42682 () Bool)

(assert (=> b!65158 (=> (not res!35456) (not e!42682))))

(declare-fun lt!27913 () ListLongMap!1361)

(assert (=> b!65158 (= res!35456 (not (contains!694 lt!27913 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65159 () Bool)

(declare-fun e!42684 () ListLongMap!1361)

(declare-fun call!5339 () ListLongMap!1361)

(assert (=> b!65159 (= e!42684 call!5339)))

(declare-fun b!65160 () Bool)

(declare-fun e!42685 () Bool)

(assert (=> b!65160 (= e!42685 (= lt!27913 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65161 () Bool)

(declare-fun e!42681 () Bool)

(declare-fun e!42683 () Bool)

(assert (=> b!65161 (= e!42681 e!42683)))

(assert (=> b!65161 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun res!35457 () Bool)

(assert (=> b!65161 (= res!35457 (contains!694 lt!27913 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65161 (=> (not res!35457) (not e!42683))))

(declare-fun bm!5336 () Bool)

(assert (=> bm!5336 (= call!5339 (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65162 () Bool)

(assert (=> b!65162 (= e!42681 e!42685)))

(declare-fun c!8958 () Bool)

(assert (=> b!65162 (= c!8958 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65163 () Bool)

(declare-fun e!42679 () ListLongMap!1361)

(assert (=> b!65163 (= e!42679 e!42684)))

(declare-fun c!8959 () Bool)

(assert (=> b!65163 (= c!8959 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65164 () Bool)

(assert (=> b!65164 (= e!42682 e!42681)))

(declare-fun c!8961 () Bool)

(declare-fun e!42680 () Bool)

(assert (=> b!65164 (= c!8961 e!42680)))

(declare-fun res!35454 () Bool)

(assert (=> b!65164 (=> (not res!35454) (not e!42680))))

(assert (=> b!65164 (= res!35454 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65157 () Bool)

(declare-fun lt!27914 () Unit!1776)

(declare-fun lt!27912 () Unit!1776)

(assert (=> b!65157 (= lt!27914 lt!27912)))

(declare-fun lt!27916 () V!2881)

(declare-fun lt!27917 () (_ BitVec 64))

(declare-fun lt!27915 () (_ BitVec 64))

(declare-fun lt!27911 () ListLongMap!1361)

(assert (=> b!65157 (not (contains!694 (+!84 lt!27911 (tuple2!2049 lt!27915 lt!27916)) lt!27917))))

(declare-fun addStillNotContains!21 (ListLongMap!1361 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1776)

(assert (=> b!65157 (= lt!27912 (addStillNotContains!21 lt!27911 lt!27915 lt!27916 lt!27917))))

(assert (=> b!65157 (= lt!27917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!65157 (= lt!27916 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65157 (= lt!27915 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65157 (= lt!27911 call!5339)))

(assert (=> b!65157 (= e!42684 (+!84 call!5339 (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!13593 () Bool)

(assert (=> d!13593 e!42682))

(declare-fun res!35455 () Bool)

(assert (=> d!13593 (=> (not res!35455) (not e!42682))))

(assert (=> d!13593 (= res!35455 (not (contains!694 lt!27913 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13593 (= lt!27913 e!42679)))

(declare-fun c!8960 () Bool)

(assert (=> d!13593 (= c!8960 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13593 (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13593 (= (getCurrentListMapNoExtraKeys!48 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) lt!27913)))

(declare-fun b!65165 () Bool)

(declare-fun isEmpty!310 (ListLongMap!1361) Bool)

(assert (=> b!65165 (= e!42685 (isEmpty!310 lt!27913))))

(declare-fun b!65166 () Bool)

(assert (=> b!65166 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> b!65166 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2037 (_values!2104 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> b!65166 (= e!42683 (= (apply!70 lt!27913 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65167 () Bool)

(assert (=> b!65167 (= e!42680 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65167 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!65168 () Bool)

(assert (=> b!65168 (= e!42679 (ListLongMap!1362 Nil!1435))))

(assert (= (and d!13593 c!8960) b!65168))

(assert (= (and d!13593 (not c!8960)) b!65163))

(assert (= (and b!65163 c!8959) b!65157))

(assert (= (and b!65163 (not c!8959)) b!65159))

(assert (= (or b!65157 b!65159) bm!5336))

(assert (= (and d!13593 res!35455) b!65158))

(assert (= (and b!65158 res!35456) b!65164))

(assert (= (and b!65164 res!35454) b!65167))

(assert (= (and b!65164 c!8961) b!65161))

(assert (= (and b!65164 (not c!8961)) b!65162))

(assert (= (and b!65161 res!35457) b!65166))

(assert (= (and b!65162 c!8958) b!65160))

(assert (= (and b!65162 (not c!8958)) b!65165))

(declare-fun b_lambda!2923 () Bool)

(assert (=> (not b_lambda!2923) (not b!65157)))

(assert (=> b!65157 t!4857))

(declare-fun b_and!3993 () Bool)

(assert (= b_and!3989 (and (=> t!4857 result!2487) b_and!3993)))

(assert (=> b!65157 t!4859))

(declare-fun b_and!3995 () Bool)

(assert (= b_and!3991 (and (=> t!4859 result!2491) b_and!3995)))

(declare-fun b_lambda!2925 () Bool)

(assert (=> (not b_lambda!2925) (not b!65166)))

(assert (=> b!65166 t!4857))

(declare-fun b_and!3997 () Bool)

(assert (= b_and!3993 (and (=> t!4857 result!2487) b_and!3997)))

(assert (=> b!65166 t!4859))

(declare-fun b_and!3999 () Bool)

(assert (= b_and!3995 (and (=> t!4859 result!2491) b_and!3999)))

(assert (=> b!65157 m!59469))

(declare-fun m!59823 () Bool)

(assert (=> b!65157 m!59823))

(declare-fun m!59825 () Bool)

(assert (=> b!65157 m!59825))

(assert (=> b!65157 m!59485))

(declare-fun m!59827 () Bool)

(assert (=> b!65157 m!59827))

(declare-fun m!59829 () Bool)

(assert (=> b!65157 m!59829))

(assert (=> b!65157 m!59485))

(assert (=> b!65157 m!59289))

(assert (=> b!65157 m!59487))

(assert (=> b!65157 m!59289))

(assert (=> b!65157 m!59827))

(assert (=> b!65166 m!59469))

(assert (=> b!65166 m!59469))

(declare-fun m!59831 () Bool)

(assert (=> b!65166 m!59831))

(assert (=> b!65166 m!59289))

(assert (=> b!65166 m!59485))

(assert (=> b!65166 m!59485))

(assert (=> b!65166 m!59289))

(assert (=> b!65166 m!59487))

(declare-fun m!59833 () Bool)

(assert (=> d!13593 m!59833))

(assert (=> d!13593 m!59249))

(declare-fun m!59835 () Bool)

(assert (=> b!65158 m!59835))

(declare-fun m!59837 () Bool)

(assert (=> bm!5336 m!59837))

(assert (=> b!65167 m!59469))

(assert (=> b!65167 m!59469))

(assert (=> b!65167 m!59471))

(declare-fun m!59839 () Bool)

(assert (=> b!65165 m!59839))

(assert (=> b!65161 m!59469))

(assert (=> b!65161 m!59469))

(declare-fun m!59841 () Bool)

(assert (=> b!65161 m!59841))

(assert (=> b!65163 m!59469))

(assert (=> b!65163 m!59469))

(assert (=> b!65163 m!59471))

(assert (=> b!65160 m!59837))

(assert (=> bm!5295 d!13593))

(declare-fun d!13595 () Bool)

(assert (=> d!13595 (= (map!1126 (_2!1036 lt!27641)) (getCurrentListMap!396 (_keys!3759 (_2!1036 lt!27641)) (_values!2104 (_2!1036 lt!27641)) (mask!6043 (_2!1036 lt!27641)) (extraKeys!1994 (_2!1036 lt!27641)) (zeroValue!2030 (_2!1036 lt!27641)) (minValue!2030 (_2!1036 lt!27641)) #b00000000000000000000000000000000 (defaultEntry!2121 (_2!1036 lt!27641))))))

(declare-fun bs!2832 () Bool)

(assert (= bs!2832 d!13595))

(declare-fun m!59843 () Bool)

(assert (=> bs!2832 m!59843))

(assert (=> bm!5262 d!13595))

(declare-fun d!13597 () Bool)

(assert (=> d!13597 (= (apply!70 (+!84 lt!27701 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27690) (get!1106 (getValueByKey!129 (toList!696 (+!84 lt!27701 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27690)))))

(declare-fun bs!2833 () Bool)

(assert (= bs!2833 d!13597))

(declare-fun m!59845 () Bool)

(assert (=> bs!2833 m!59845))

(assert (=> bs!2833 m!59845))

(declare-fun m!59847 () Bool)

(assert (=> bs!2833 m!59847))

(assert (=> b!64911 d!13597))

(declare-fun d!13599 () Bool)

(assert (=> d!13599 (= (apply!70 lt!27703 lt!27692) (get!1106 (getValueByKey!129 (toList!696 lt!27703) lt!27692)))))

(declare-fun bs!2834 () Bool)

(assert (= bs!2834 d!13599))

(declare-fun m!59849 () Bool)

(assert (=> bs!2834 m!59849))

(assert (=> bs!2834 m!59849))

(declare-fun m!59851 () Bool)

(assert (=> bs!2834 m!59851))

(assert (=> b!64911 d!13599))

(declare-fun d!13601 () Bool)

(assert (=> d!13601 (= (apply!70 (+!84 lt!27703 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27692) (get!1106 (getValueByKey!129 (toList!696 (+!84 lt!27703 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27692)))))

(declare-fun bs!2835 () Bool)

(assert (= bs!2835 d!13601))

(declare-fun m!59853 () Bool)

(assert (=> bs!2835 m!59853))

(assert (=> bs!2835 m!59853))

(declare-fun m!59855 () Bool)

(assert (=> bs!2835 m!59855))

(assert (=> b!64911 d!13601))

(assert (=> b!64911 d!13593))

(declare-fun d!13603 () Bool)

(assert (=> d!13603 (= (apply!70 (+!84 lt!27699 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27702) (apply!70 lt!27699 lt!27702))))

(declare-fun lt!27920 () Unit!1776)

(declare-fun choose!362 (ListLongMap!1361 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1776)

(assert (=> d!13603 (= lt!27920 (choose!362 lt!27699 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27702))))

(declare-fun e!42688 () Bool)

(assert (=> d!13603 e!42688))

(declare-fun res!35460 () Bool)

(assert (=> d!13603 (=> (not res!35460) (not e!42688))))

(assert (=> d!13603 (= res!35460 (contains!694 lt!27699 lt!27702))))

(assert (=> d!13603 (= (addApplyDifferent!46 lt!27699 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27702) lt!27920)))

(declare-fun b!65172 () Bool)

(assert (=> b!65172 (= e!42688 (not (= lt!27702 lt!27693)))))

(assert (= (and d!13603 res!35460) b!65172))

(declare-fun m!59857 () Bool)

(assert (=> d!13603 m!59857))

(assert (=> d!13603 m!59513))

(declare-fun m!59859 () Bool)

(assert (=> d!13603 m!59859))

(assert (=> d!13603 m!59501))

(assert (=> d!13603 m!59513))

(assert (=> d!13603 m!59519))

(assert (=> b!64911 d!13603))

(declare-fun d!13605 () Bool)

(assert (=> d!13605 (contains!694 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27704)))

(declare-fun lt!27923 () Unit!1776)

(declare-fun choose!363 (ListLongMap!1361 (_ BitVec 64) V!2881 (_ BitVec 64)) Unit!1776)

(assert (=> d!13605 (= lt!27923 (choose!363 lt!27687 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27704))))

(assert (=> d!13605 (contains!694 lt!27687 lt!27704)))

(assert (=> d!13605 (= (addStillContains!46 lt!27687 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27704) lt!27923)))

(declare-fun bs!2836 () Bool)

(assert (= bs!2836 d!13605))

(assert (=> bs!2836 m!59497))

(assert (=> bs!2836 m!59497))

(assert (=> bs!2836 m!59515))

(declare-fun m!59861 () Bool)

(assert (=> bs!2836 m!59861))

(declare-fun m!59863 () Bool)

(assert (=> bs!2836 m!59863))

(assert (=> b!64911 d!13605))

(declare-fun d!13607 () Bool)

(assert (=> d!13607 (= (apply!70 (+!84 lt!27701 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27690) (apply!70 lt!27701 lt!27690))))

(declare-fun lt!27924 () Unit!1776)

(assert (=> d!13607 (= lt!27924 (choose!362 lt!27701 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27690))))

(declare-fun e!42689 () Bool)

(assert (=> d!13607 e!42689))

(declare-fun res!35461 () Bool)

(assert (=> d!13607 (=> (not res!35461) (not e!42689))))

(assert (=> d!13607 (= res!35461 (contains!694 lt!27701 lt!27690))))

(assert (=> d!13607 (= (addApplyDifferent!46 lt!27701 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27690) lt!27924)))

(declare-fun b!65174 () Bool)

(assert (=> b!65174 (= e!42689 (not (= lt!27690 lt!27700)))))

(assert (= (and d!13607 res!35461) b!65174))

(declare-fun m!59865 () Bool)

(assert (=> d!13607 m!59865))

(assert (=> d!13607 m!59503))

(declare-fun m!59867 () Bool)

(assert (=> d!13607 m!59867))

(assert (=> d!13607 m!59517))

(assert (=> d!13607 m!59503))

(assert (=> d!13607 m!59507))

(assert (=> b!64911 d!13607))

(declare-fun d!13609 () Bool)

(declare-fun e!42690 () Bool)

(assert (=> d!13609 e!42690))

(declare-fun res!35462 () Bool)

(assert (=> d!13609 (=> (not res!35462) (not e!42690))))

(declare-fun lt!27925 () ListLongMap!1361)

(assert (=> d!13609 (= res!35462 (contains!694 lt!27925 (_1!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27927 () List!1438)

(assert (=> d!13609 (= lt!27925 (ListLongMap!1362 lt!27927))))

(declare-fun lt!27926 () Unit!1776)

(declare-fun lt!27928 () Unit!1776)

(assert (=> d!13609 (= lt!27926 lt!27928)))

(assert (=> d!13609 (= (getValueByKey!129 lt!27927 (_1!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13609 (= lt!27928 (lemmaContainsTupThenGetReturnValue!46 lt!27927 (_1!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13609 (= lt!27927 (insertStrictlySorted!49 (toList!696 lt!27701) (_1!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13609 (= (+!84 lt!27701 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27925)))

(declare-fun b!65175 () Bool)

(declare-fun res!35463 () Bool)

(assert (=> b!65175 (=> (not res!35463) (not e!42690))))

(assert (=> b!65175 (= res!35463 (= (getValueByKey!129 (toList!696 lt!27925) (_1!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65176 () Bool)

(assert (=> b!65176 (= e!42690 (contains!697 (toList!696 lt!27925) (tuple2!2049 lt!27700 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13609 res!35462) b!65175))

(assert (= (and b!65175 res!35463) b!65176))

(declare-fun m!59869 () Bool)

(assert (=> d!13609 m!59869))

(declare-fun m!59871 () Bool)

(assert (=> d!13609 m!59871))

(declare-fun m!59873 () Bool)

(assert (=> d!13609 m!59873))

(declare-fun m!59875 () Bool)

(assert (=> d!13609 m!59875))

(declare-fun m!59877 () Bool)

(assert (=> b!65175 m!59877))

(declare-fun m!59879 () Bool)

(assert (=> b!65176 m!59879))

(assert (=> b!64911 d!13609))

(declare-fun d!13611 () Bool)

(declare-fun e!42691 () Bool)

(assert (=> d!13611 e!42691))

(declare-fun res!35464 () Bool)

(assert (=> d!13611 (=> (not res!35464) (not e!42691))))

(declare-fun lt!27929 () ListLongMap!1361)

(assert (=> d!13611 (= res!35464 (contains!694 lt!27929 (_1!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27931 () List!1438)

(assert (=> d!13611 (= lt!27929 (ListLongMap!1362 lt!27931))))

(declare-fun lt!27930 () Unit!1776)

(declare-fun lt!27932 () Unit!1776)

(assert (=> d!13611 (= lt!27930 lt!27932)))

(assert (=> d!13611 (= (getValueByKey!129 lt!27931 (_1!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13611 (= lt!27932 (lemmaContainsTupThenGetReturnValue!46 lt!27931 (_1!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13611 (= lt!27931 (insertStrictlySorted!49 (toList!696 lt!27699) (_1!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13611 (= (+!84 lt!27699 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27929)))

(declare-fun b!65177 () Bool)

(declare-fun res!35465 () Bool)

(assert (=> b!65177 (=> (not res!35465) (not e!42691))))

(assert (=> b!65177 (= res!35465 (= (getValueByKey!129 (toList!696 lt!27929) (_1!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65178 () Bool)

(assert (=> b!65178 (= e!42691 (contains!697 (toList!696 lt!27929) (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13611 res!35464) b!65177))

(assert (= (and b!65177 res!35465) b!65178))

(declare-fun m!59881 () Bool)

(assert (=> d!13611 m!59881))

(declare-fun m!59883 () Bool)

(assert (=> d!13611 m!59883))

(declare-fun m!59885 () Bool)

(assert (=> d!13611 m!59885))

(declare-fun m!59887 () Bool)

(assert (=> d!13611 m!59887))

(declare-fun m!59889 () Bool)

(assert (=> b!65177 m!59889))

(declare-fun m!59891 () Bool)

(assert (=> b!65178 m!59891))

(assert (=> b!64911 d!13611))

(declare-fun d!13613 () Bool)

(assert (=> d!13613 (= (apply!70 lt!27699 lt!27702) (get!1106 (getValueByKey!129 (toList!696 lt!27699) lt!27702)))))

(declare-fun bs!2837 () Bool)

(assert (= bs!2837 d!13613))

(declare-fun m!59893 () Bool)

(assert (=> bs!2837 m!59893))

(assert (=> bs!2837 m!59893))

(declare-fun m!59895 () Bool)

(assert (=> bs!2837 m!59895))

(assert (=> b!64911 d!13613))

(declare-fun d!13615 () Bool)

(declare-fun e!42693 () Bool)

(assert (=> d!13615 e!42693))

(declare-fun res!35466 () Bool)

(assert (=> d!13615 (=> res!35466 e!42693)))

(declare-fun lt!27936 () Bool)

(assert (=> d!13615 (= res!35466 (not lt!27936))))

(declare-fun lt!27935 () Bool)

(assert (=> d!13615 (= lt!27936 lt!27935)))

(declare-fun lt!27933 () Unit!1776)

(declare-fun e!42692 () Unit!1776)

(assert (=> d!13615 (= lt!27933 e!42692)))

(declare-fun c!8962 () Bool)

(assert (=> d!13615 (= c!8962 lt!27935)))

(assert (=> d!13615 (= lt!27935 (containsKey!132 (toList!696 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27704))))

(assert (=> d!13615 (= (contains!694 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27704) lt!27936)))

(declare-fun b!65179 () Bool)

(declare-fun lt!27934 () Unit!1776)

(assert (=> b!65179 (= e!42692 lt!27934)))

(assert (=> b!65179 (= lt!27934 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27704))))

(assert (=> b!65179 (isDefined!81 (getValueByKey!129 (toList!696 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27704))))

(declare-fun b!65180 () Bool)

(declare-fun Unit!1794 () Unit!1776)

(assert (=> b!65180 (= e!42692 Unit!1794)))

(declare-fun b!65181 () Bool)

(assert (=> b!65181 (= e!42693 (isDefined!81 (getValueByKey!129 (toList!696 (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27704)))))

(assert (= (and d!13615 c!8962) b!65179))

(assert (= (and d!13615 (not c!8962)) b!65180))

(assert (= (and d!13615 (not res!35466)) b!65181))

(declare-fun m!59897 () Bool)

(assert (=> d!13615 m!59897))

(declare-fun m!59899 () Bool)

(assert (=> b!65179 m!59899))

(declare-fun m!59901 () Bool)

(assert (=> b!65179 m!59901))

(assert (=> b!65179 m!59901))

(declare-fun m!59903 () Bool)

(assert (=> b!65179 m!59903))

(assert (=> b!65181 m!59901))

(assert (=> b!65181 m!59901))

(assert (=> b!65181 m!59903))

(assert (=> b!64911 d!13615))

(declare-fun d!13617 () Bool)

(declare-fun e!42694 () Bool)

(assert (=> d!13617 e!42694))

(declare-fun res!35467 () Bool)

(assert (=> d!13617 (=> (not res!35467) (not e!42694))))

(declare-fun lt!27937 () ListLongMap!1361)

(assert (=> d!13617 (= res!35467 (contains!694 lt!27937 (_1!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27939 () List!1438)

(assert (=> d!13617 (= lt!27937 (ListLongMap!1362 lt!27939))))

(declare-fun lt!27938 () Unit!1776)

(declare-fun lt!27940 () Unit!1776)

(assert (=> d!13617 (= lt!27938 lt!27940)))

(assert (=> d!13617 (= (getValueByKey!129 lt!27939 (_1!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13617 (= lt!27940 (lemmaContainsTupThenGetReturnValue!46 lt!27939 (_1!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13617 (= lt!27939 (insertStrictlySorted!49 (toList!696 lt!27687) (_1!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13617 (= (+!84 lt!27687 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27937)))

(declare-fun b!65182 () Bool)

(declare-fun res!35468 () Bool)

(assert (=> b!65182 (=> (not res!35468) (not e!42694))))

(assert (=> b!65182 (= res!35468 (= (getValueByKey!129 (toList!696 lt!27937) (_1!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65183 () Bool)

(assert (=> b!65183 (= e!42694 (contains!697 (toList!696 lt!27937) (tuple2!2049 lt!27697 (zeroValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13617 res!35467) b!65182))

(assert (= (and b!65182 res!35468) b!65183))

(declare-fun m!59905 () Bool)

(assert (=> d!13617 m!59905))

(declare-fun m!59907 () Bool)

(assert (=> d!13617 m!59907))

(declare-fun m!59909 () Bool)

(assert (=> d!13617 m!59909))

(declare-fun m!59911 () Bool)

(assert (=> d!13617 m!59911))

(declare-fun m!59913 () Bool)

(assert (=> b!65182 m!59913))

(declare-fun m!59915 () Bool)

(assert (=> b!65183 m!59915))

(assert (=> b!64911 d!13617))

(declare-fun d!13619 () Bool)

(assert (=> d!13619 (= (apply!70 lt!27701 lt!27690) (get!1106 (getValueByKey!129 (toList!696 lt!27701) lt!27690)))))

(declare-fun bs!2838 () Bool)

(assert (= bs!2838 d!13619))

(declare-fun m!59917 () Bool)

(assert (=> bs!2838 m!59917))

(assert (=> bs!2838 m!59917))

(declare-fun m!59919 () Bool)

(assert (=> bs!2838 m!59919))

(assert (=> b!64911 d!13619))

(declare-fun d!13621 () Bool)

(declare-fun e!42695 () Bool)

(assert (=> d!13621 e!42695))

(declare-fun res!35469 () Bool)

(assert (=> d!13621 (=> (not res!35469) (not e!42695))))

(declare-fun lt!27941 () ListLongMap!1361)

(assert (=> d!13621 (= res!35469 (contains!694 lt!27941 (_1!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(declare-fun lt!27943 () List!1438)

(assert (=> d!13621 (= lt!27941 (ListLongMap!1362 lt!27943))))

(declare-fun lt!27942 () Unit!1776)

(declare-fun lt!27944 () Unit!1776)

(assert (=> d!13621 (= lt!27942 lt!27944)))

(assert (=> d!13621 (= (getValueByKey!129 lt!27943 (_1!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13621 (= lt!27944 (lemmaContainsTupThenGetReturnValue!46 lt!27943 (_1!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13621 (= lt!27943 (insertStrictlySorted!49 (toList!696 lt!27703) (_1!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) (_2!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (=> d!13621 (= (+!84 lt!27703 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27941)))

(declare-fun b!65184 () Bool)

(declare-fun res!35470 () Bool)

(assert (=> b!65184 (=> (not res!35470) (not e!42695))))

(assert (=> b!65184 (= res!35470 (= (getValueByKey!129 (toList!696 lt!27941) (_1!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (Some!134 (_2!1035 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun b!65185 () Bool)

(assert (=> b!65185 (= e!42695 (contains!697 (toList!696 lt!27941) (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))

(assert (= (and d!13621 res!35469) b!65184))

(assert (= (and b!65184 res!35470) b!65185))

(declare-fun m!59921 () Bool)

(assert (=> d!13621 m!59921))

(declare-fun m!59923 () Bool)

(assert (=> d!13621 m!59923))

(declare-fun m!59925 () Bool)

(assert (=> d!13621 m!59925))

(declare-fun m!59927 () Bool)

(assert (=> d!13621 m!59927))

(declare-fun m!59929 () Bool)

(assert (=> b!65184 m!59929))

(declare-fun m!59931 () Bool)

(assert (=> b!65185 m!59931))

(assert (=> b!64911 d!13621))

(declare-fun d!13623 () Bool)

(assert (=> d!13623 (= (apply!70 (+!84 lt!27703 (tuple2!2049 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27692) (apply!70 lt!27703 lt!27692))))

(declare-fun lt!27945 () Unit!1776)

(assert (=> d!13623 (= lt!27945 (choose!362 lt!27703 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27692))))

(declare-fun e!42696 () Bool)

(assert (=> d!13623 e!42696))

(declare-fun res!35471 () Bool)

(assert (=> d!13623 (=> (not res!35471) (not e!42696))))

(assert (=> d!13623 (= res!35471 (contains!694 lt!27703 lt!27692))))

(assert (=> d!13623 (= (addApplyDifferent!46 lt!27703 lt!27696 (minValue!2030 (v!2447 (underlying!239 thiss!992))) lt!27692) lt!27945)))

(declare-fun b!65186 () Bool)

(assert (=> b!65186 (= e!42696 (not (= lt!27692 lt!27696)))))

(assert (= (and d!13623 res!35471) b!65186))

(declare-fun m!59933 () Bool)

(assert (=> d!13623 m!59933))

(assert (=> d!13623 m!59499))

(declare-fun m!59935 () Bool)

(assert (=> d!13623 m!59935))

(assert (=> d!13623 m!59523))

(assert (=> d!13623 m!59499))

(assert (=> d!13623 m!59511))

(assert (=> b!64911 d!13623))

(declare-fun d!13625 () Bool)

(assert (=> d!13625 (= (apply!70 (+!84 lt!27699 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992))))) lt!27702) (get!1106 (getValueByKey!129 (toList!696 (+!84 lt!27699 (tuple2!2049 lt!27693 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27702)))))

(declare-fun bs!2839 () Bool)

(assert (= bs!2839 d!13625))

(declare-fun m!59937 () Bool)

(assert (=> bs!2839 m!59937))

(assert (=> bs!2839 m!59937))

(declare-fun m!59939 () Bool)

(assert (=> bs!2839 m!59939))

(assert (=> b!64911 d!13625))

(declare-fun d!13627 () Bool)

(assert (=> d!13627 (= (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64910 d!13627))

(declare-fun d!13629 () Bool)

(assert (=> d!13629 (= (+!84 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) lt!27636 (zeroValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27948 () Unit!1776)

(declare-fun choose!364 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 V!2881 Int) Unit!1776)

(assert (=> d!13629 (= lt!27948 (choose!364 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27636 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13629 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13629 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) lt!27636 (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)) lt!27948)))

(declare-fun bs!2840 () Bool)

(assert (= bs!2840 d!13629))

(assert (=> bs!2840 m!59291))

(declare-fun m!59941 () Bool)

(assert (=> bs!2840 m!59941))

(assert (=> bs!2840 m!59417))

(assert (=> bs!2840 m!59417))

(declare-fun m!59943 () Bool)

(assert (=> bs!2840 m!59943))

(assert (=> bs!2840 m!59291))

(declare-fun m!59945 () Bool)

(assert (=> bs!2840 m!59945))

(assert (=> bs!2840 m!59581))

(assert (=> b!64832 d!13629))

(declare-fun d!13631 () Bool)

(declare-fun e!42699 () Bool)

(assert (=> d!13631 e!42699))

(declare-fun c!8965 () Bool)

(assert (=> d!13631 (= c!8965 (and (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13631 true))

(declare-fun _$29!78 () Unit!1776)

(assert (=> d!13631 (= (choose!360 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (_values!2104 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992))) (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) (zeroValue!2030 (v!2447 (underlying!239 thiss!992))) (minValue!2030 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992)))) _$29!78)))

(declare-fun b!65191 () Bool)

(assert (=> b!65191 (= e!42699 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!65192 () Bool)

(assert (=> b!65192 (= e!42699 (ite (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1994 (v!2447 (underlying!239 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13631 c!8965) b!65191))

(assert (= (and d!13631 (not c!8965)) b!65192))

(assert (=> b!65191 m!59255))

(assert (=> b!65191 m!59259))

(assert (=> d!13535 d!13631))

(assert (=> d!13535 d!13539))

(assert (=> b!64970 d!13587))

(declare-fun d!13633 () Bool)

(declare-fun e!42702 () Bool)

(assert (=> d!13633 e!42702))

(declare-fun res!35477 () Bool)

(assert (=> d!13633 (=> (not res!35477) (not e!42702))))

(declare-fun lt!27954 () SeekEntryResult!225)

(assert (=> d!13633 (= res!35477 ((_ is Found!225) lt!27954))))

(assert (=> d!13633 (= lt!27954 (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun lt!27953 () Unit!1776)

(declare-fun choose!365 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1776)

(assert (=> d!13633 (= lt!27953 (choose!365 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13633 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13633 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)) lt!27953)))

(declare-fun b!65197 () Bool)

(declare-fun res!35476 () Bool)

(assert (=> b!65197 (=> (not res!35476) (not e!42702))))

(assert (=> b!65197 (= res!35476 (inRange!0 (index!3028 lt!27954) (mask!6043 newMap!16)))))

(declare-fun b!65198 () Bool)

(assert (=> b!65198 (= e!42702 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27954)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65198 (and (bvsge (index!3028 lt!27954) #b00000000000000000000000000000000) (bvslt (index!3028 lt!27954) (size!2036 (_keys!3759 newMap!16))))))

(assert (= (and d!13633 res!35477) b!65197))

(assert (= (and b!65197 res!35476) b!65198))

(assert (=> d!13633 m!59255))

(assert (=> d!13633 m!59439))

(assert (=> d!13633 m!59255))

(declare-fun m!59947 () Bool)

(assert (=> d!13633 m!59947))

(assert (=> d!13633 m!59581))

(declare-fun m!59949 () Bool)

(assert (=> b!65197 m!59949))

(declare-fun m!59951 () Bool)

(assert (=> b!65198 m!59951))

(assert (=> bm!5272 d!13633))

(declare-fun b!65211 () Bool)

(declare-fun e!42711 () SeekEntryResult!225)

(declare-fun e!42709 () SeekEntryResult!225)

(assert (=> b!65211 (= e!42711 e!42709)))

(declare-fun lt!27962 () (_ BitVec 64))

(declare-fun lt!27961 () SeekEntryResult!225)

(assert (=> b!65211 (= lt!27962 (select (arr!1802 (_keys!3759 newMap!16)) (index!3029 lt!27961)))))

(declare-fun c!8973 () Bool)

(assert (=> b!65211 (= c!8973 (= lt!27962 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65212 () Bool)

(assert (=> b!65212 (= e!42709 (Found!225 (index!3029 lt!27961)))))

(declare-fun b!65213 () Bool)

(declare-fun e!42710 () SeekEntryResult!225)

(assert (=> b!65213 (= e!42710 (MissingZero!225 (index!3029 lt!27961)))))

(declare-fun lt!27963 () SeekEntryResult!225)

(declare-fun d!13635 () Bool)

(assert (=> d!13635 (and (or ((_ is Undefined!225) lt!27963) (not ((_ is Found!225) lt!27963)) (and (bvsge (index!3028 lt!27963) #b00000000000000000000000000000000) (bvslt (index!3028 lt!27963) (size!2036 (_keys!3759 newMap!16))))) (or ((_ is Undefined!225) lt!27963) ((_ is Found!225) lt!27963) (not ((_ is MissingZero!225) lt!27963)) (and (bvsge (index!3027 lt!27963) #b00000000000000000000000000000000) (bvslt (index!3027 lt!27963) (size!2036 (_keys!3759 newMap!16))))) (or ((_ is Undefined!225) lt!27963) ((_ is Found!225) lt!27963) ((_ is MissingZero!225) lt!27963) (not ((_ is MissingVacant!225) lt!27963)) (and (bvsge (index!3030 lt!27963) #b00000000000000000000000000000000) (bvslt (index!3030 lt!27963) (size!2036 (_keys!3759 newMap!16))))) (or ((_ is Undefined!225) lt!27963) (ite ((_ is Found!225) lt!27963) (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27963)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (ite ((_ is MissingZero!225) lt!27963) (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3027 lt!27963)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!225) lt!27963) (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3030 lt!27963)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13635 (= lt!27963 e!42711)))

(declare-fun c!8972 () Bool)

(assert (=> d!13635 (= c!8972 (and ((_ is Intermediate!225) lt!27961) (undefined!1037 lt!27961)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3771 (_ BitVec 32)) SeekEntryResult!225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13635 (= lt!27961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (mask!6043 newMap!16)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(assert (=> d!13635 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13635 (= (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)) lt!27963)))

(declare-fun b!65214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3771 (_ BitVec 32)) SeekEntryResult!225)

(assert (=> b!65214 (= e!42710 (seekKeyOrZeroReturnVacant!0 (x!10536 lt!27961) (index!3029 lt!27961) (index!3029 lt!27961) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun b!65215 () Bool)

(assert (=> b!65215 (= e!42711 Undefined!225)))

(declare-fun b!65216 () Bool)

(declare-fun c!8974 () Bool)

(assert (=> b!65216 (= c!8974 (= lt!27962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65216 (= e!42709 e!42710)))

(assert (= (and d!13635 c!8972) b!65215))

(assert (= (and d!13635 (not c!8972)) b!65211))

(assert (= (and b!65211 c!8973) b!65212))

(assert (= (and b!65211 (not c!8973)) b!65216))

(assert (= (and b!65216 c!8974) b!65213))

(assert (= (and b!65216 (not c!8974)) b!65214))

(declare-fun m!59953 () Bool)

(assert (=> b!65211 m!59953))

(declare-fun m!59955 () Bool)

(assert (=> d!13635 m!59955))

(assert (=> d!13635 m!59581))

(declare-fun m!59957 () Bool)

(assert (=> d!13635 m!59957))

(assert (=> d!13635 m!59255))

(declare-fun m!59959 () Bool)

(assert (=> d!13635 m!59959))

(declare-fun m!59961 () Bool)

(assert (=> d!13635 m!59961))

(assert (=> d!13635 m!59255))

(assert (=> d!13635 m!59957))

(declare-fun m!59963 () Bool)

(assert (=> d!13635 m!59963))

(assert (=> b!65214 m!59255))

(declare-fun m!59965 () Bool)

(assert (=> b!65214 m!59965))

(assert (=> bm!5271 d!13635))

(declare-fun d!13637 () Bool)

(declare-fun e!42712 () Bool)

(assert (=> d!13637 e!42712))

(declare-fun res!35478 () Bool)

(assert (=> d!13637 (=> (not res!35478) (not e!42712))))

(declare-fun lt!27964 () ListLongMap!1361)

(assert (=> d!13637 (= res!35478 (contains!694 lt!27964 (_1!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(declare-fun lt!27966 () List!1438)

(assert (=> d!13637 (= lt!27964 (ListLongMap!1362 lt!27966))))

(declare-fun lt!27965 () Unit!1776)

(declare-fun lt!27967 () Unit!1776)

(assert (=> d!13637 (= lt!27965 lt!27967)))

(assert (=> d!13637 (= (getValueByKey!129 lt!27966 (_1!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))) (Some!134 (_2!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13637 (= lt!27967 (lemmaContainsTupThenGetReturnValue!46 lt!27966 (_1!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (_2!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13637 (= lt!27966 (insertStrictlySorted!49 (toList!696 (ite c!8902 call!5294 (ite c!8903 call!5298 call!5293))) (_1!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) (_2!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))))))

(assert (=> d!13637 (= (+!84 (ite c!8902 call!5294 (ite c!8903 call!5298 call!5293)) (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))) lt!27964)))

(declare-fun b!65217 () Bool)

(declare-fun res!35479 () Bool)

(assert (=> b!65217 (=> (not res!35479) (not e!42712))))

(assert (=> b!65217 (= res!35479 (= (getValueByKey!129 (toList!696 lt!27964) (_1!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992))))))) (Some!134 (_2!1035 (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))))

(declare-fun b!65218 () Bool)

(assert (=> b!65218 (= e!42712 (contains!697 (toList!696 lt!27964) (ite (or c!8902 c!8903) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 (v!2447 (underlying!239 thiss!992)))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2030 (v!2447 (underlying!239 thiss!992)))))))))

(assert (= (and d!13637 res!35478) b!65217))

(assert (= (and b!65217 res!35479) b!65218))

(declare-fun m!59967 () Bool)

(assert (=> d!13637 m!59967))

(declare-fun m!59969 () Bool)

(assert (=> d!13637 m!59969))

(declare-fun m!59971 () Bool)

(assert (=> d!13637 m!59971))

(declare-fun m!59973 () Bool)

(assert (=> d!13637 m!59973))

(declare-fun m!59975 () Bool)

(assert (=> b!65217 m!59975))

(declare-fun m!59977 () Bool)

(assert (=> b!65218 m!59977))

(assert (=> bm!5290 d!13637))

(declare-fun b!65219 () Bool)

(declare-fun e!42714 () Bool)

(declare-fun e!42716 () Bool)

(assert (=> b!65219 (= e!42714 e!42716)))

(declare-fun c!8975 () Bool)

(assert (=> b!65219 (= c!8975 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65220 () Bool)

(declare-fun call!5340 () Bool)

(assert (=> b!65220 (= e!42716 call!5340)))

(declare-fun b!65221 () Bool)

(declare-fun e!42713 () Bool)

(assert (=> b!65221 (= e!42713 e!42714)))

(declare-fun res!35482 () Bool)

(assert (=> b!65221 (=> (not res!35482) (not e!42714))))

(declare-fun e!42715 () Bool)

(assert (=> b!65221 (= res!35482 (not e!42715))))

(declare-fun res!35481 () Bool)

(assert (=> b!65221 (=> (not res!35481) (not e!42715))))

(assert (=> b!65221 (= res!35481 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5337 () Bool)

(assert (=> bm!5337 (= call!5340 (arrayNoDuplicates!0 (_keys!3759 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8975 (Cons!1435 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000) Nil!1436) Nil!1436)))))

(declare-fun b!65223 () Bool)

(assert (=> b!65223 (= e!42715 (contains!696 Nil!1436 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65222 () Bool)

(assert (=> b!65222 (= e!42716 call!5340)))

(declare-fun d!13639 () Bool)

(declare-fun res!35480 () Bool)

(assert (=> d!13639 (=> res!35480 e!42713)))

(assert (=> d!13639 (= res!35480 (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(assert (=> d!13639 (= (arrayNoDuplicates!0 (_keys!3759 newMap!16) #b00000000000000000000000000000000 Nil!1436) e!42713)))

(assert (= (and d!13639 (not res!35480)) b!65221))

(assert (= (and b!65221 res!35481) b!65223))

(assert (= (and b!65221 res!35482) b!65219))

(assert (= (and b!65219 c!8975) b!65220))

(assert (= (and b!65219 (not c!8975)) b!65222))

(assert (= (or b!65220 b!65222) bm!5337))

(assert (=> b!65219 m!59653))

(assert (=> b!65219 m!59653))

(assert (=> b!65219 m!59655))

(assert (=> b!65221 m!59653))

(assert (=> b!65221 m!59653))

(assert (=> b!65221 m!59655))

(assert (=> bm!5337 m!59653))

(declare-fun m!59979 () Bool)

(assert (=> bm!5337 m!59979))

(assert (=> b!65223 m!59653))

(assert (=> b!65223 m!59653))

(declare-fun m!59981 () Bool)

(assert (=> b!65223 m!59981))

(assert (=> b!64726 d!13639))

(declare-fun d!13641 () Bool)

(declare-fun res!35483 () Bool)

(declare-fun e!42717 () Bool)

(assert (=> d!13641 (=> res!35483 e!42717)))

(assert (=> d!13641 (= res!35483 (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13641 (= (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42717)))

(declare-fun b!65224 () Bool)

(declare-fun e!42718 () Bool)

(assert (=> b!65224 (= e!42717 e!42718)))

(declare-fun res!35484 () Bool)

(assert (=> b!65224 (=> (not res!35484) (not e!42718))))

(assert (=> b!65224 (= res!35484 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65225 () Bool)

(assert (=> b!65225 (= e!42718 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13641 (not res!35483)) b!65224))

(assert (= (and b!65224 res!35484) b!65225))

(declare-fun m!59983 () Bool)

(assert (=> d!13641 m!59983))

(assert (=> b!65225 m!59255))

(declare-fun m!59985 () Bool)

(assert (=> b!65225 m!59985))

(assert (=> b!64948 d!13641))

(declare-fun d!13643 () Bool)

(declare-fun e!42721 () Bool)

(assert (=> d!13643 e!42721))

(declare-fun res!35487 () Bool)

(assert (=> d!13643 (=> (not res!35487) (not e!42721))))

(assert (=> d!13643 (= res!35487 (and (bvsge (index!3028 lt!27623) #b00000000000000000000000000000000) (bvslt (index!3028 lt!27623) (size!2036 (_keys!3759 newMap!16)))))))

(declare-fun lt!27970 () Unit!1776)

(declare-fun choose!366 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) Int) Unit!1776)

(assert (=> d!13643 (= lt!27970 (choose!366 (_keys!3759 newMap!16) lt!27630 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13643 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13643 (= (lemmaValidKeyInArrayIsInListMap!79 (_keys!3759 newMap!16) lt!27630 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (defaultEntry!2121 newMap!16)) lt!27970)))

(declare-fun b!65228 () Bool)

(assert (=> b!65228 (= e!42721 (contains!694 (getCurrentListMap!396 (_keys!3759 newMap!16) lt!27630 (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1802 (_keys!3759 newMap!16)) (index!3028 lt!27623))))))

(assert (= (and d!13643 res!35487) b!65228))

(declare-fun m!59987 () Bool)

(assert (=> d!13643 m!59987))

(assert (=> d!13643 m!59581))

(declare-fun m!59989 () Bool)

(assert (=> b!65228 m!59989))

(assert (=> b!65228 m!59409))

(assert (=> b!65228 m!59989))

(assert (=> b!65228 m!59409))

(declare-fun m!59991 () Bool)

(assert (=> b!65228 m!59991))

(assert (=> b!64828 d!13643))

(declare-fun d!13645 () Bool)

(declare-fun e!42724 () Bool)

(assert (=> d!13645 e!42724))

(declare-fun res!35490 () Bool)

(assert (=> d!13645 (=> (not res!35490) (not e!42724))))

(assert (=> d!13645 (= res!35490 (and (bvsge (index!3028 lt!27623) #b00000000000000000000000000000000) (bvslt (index!3028 lt!27623) (size!2037 (_values!2104 newMap!16)))))))

(declare-fun lt!27973 () Unit!1776)

(declare-fun choose!367 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 32) (_ BitVec 64) V!2881 Int) Unit!1776)

(assert (=> d!13645 (= lt!27973 (choose!367 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13645 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13645 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (index!3028 lt!27623) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2121 newMap!16)) lt!27973)))

(declare-fun b!65231 () Bool)

(assert (=> b!65231 (= e!42724 (= (+!84 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!396 (_keys!3759 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))))))

(assert (= (and d!13645 res!35490) b!65231))

(assert (=> d!13645 m!59255))

(assert (=> d!13645 m!59291))

(declare-fun m!59993 () Bool)

(assert (=> d!13645 m!59993))

(assert (=> d!13645 m!59581))

(assert (=> b!65231 m!59417))

(assert (=> b!65231 m!59417))

(assert (=> b!65231 m!59637))

(assert (=> b!65231 m!59443))

(declare-fun m!59995 () Bool)

(assert (=> b!65231 m!59995))

(assert (=> b!64828 d!13645))

(declare-fun d!13647 () Bool)

(declare-fun e!42726 () Bool)

(assert (=> d!13647 e!42726))

(declare-fun res!35491 () Bool)

(assert (=> d!13647 (=> res!35491 e!42726)))

(declare-fun lt!27977 () Bool)

(assert (=> d!13647 (= res!35491 (not lt!27977))))

(declare-fun lt!27976 () Bool)

(assert (=> d!13647 (= lt!27977 lt!27976)))

(declare-fun lt!27974 () Unit!1776)

(declare-fun e!42725 () Unit!1776)

(assert (=> d!13647 (= lt!27974 e!42725)))

(declare-fun c!8976 () Bool)

(assert (=> d!13647 (= c!8976 lt!27976)))

(assert (=> d!13647 (= lt!27976 (containsKey!132 (toList!696 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13647 (= (contains!694 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27977)))

(declare-fun b!65232 () Bool)

(declare-fun lt!27975 () Unit!1776)

(assert (=> b!65232 (= e!42725 lt!27975)))

(assert (=> b!65232 (= lt!27975 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65232 (isDefined!81 (getValueByKey!129 (toList!696 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65233 () Bool)

(declare-fun Unit!1795 () Unit!1776)

(assert (=> b!65233 (= e!42725 Unit!1795)))

(declare-fun b!65234 () Bool)

(assert (=> b!65234 (= e!42726 (isDefined!81 (getValueByKey!129 (toList!696 (getCurrentListMap!396 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13647 c!8976) b!65232))

(assert (= (and d!13647 (not c!8976)) b!65233))

(assert (= (and d!13647 (not res!35491)) b!65234))

(assert (=> d!13647 m!59255))

(declare-fun m!59997 () Bool)

(assert (=> d!13647 m!59997))

(assert (=> b!65232 m!59255))

(declare-fun m!59999 () Bool)

(assert (=> b!65232 m!59999))

(assert (=> b!65232 m!59255))

(declare-fun m!60001 () Bool)

(assert (=> b!65232 m!60001))

(assert (=> b!65232 m!60001))

(declare-fun m!60003 () Bool)

(assert (=> b!65232 m!60003))

(assert (=> b!65234 m!59255))

(assert (=> b!65234 m!60001))

(assert (=> b!65234 m!60001))

(assert (=> b!65234 m!60003))

(assert (=> b!64828 d!13647))

(assert (=> b!64828 d!13573))

(assert (=> b!64941 d!13587))

(declare-fun d!13649 () Bool)

(declare-fun res!35493 () Bool)

(declare-fun e!42729 () Bool)

(assert (=> d!13649 (=> res!35493 e!42729)))

(assert (=> d!13649 (= res!35493 (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(assert (=> d!13649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3759 newMap!16) (mask!6043 newMap!16)) e!42729)))

(declare-fun b!65235 () Bool)

(declare-fun e!42727 () Bool)

(declare-fun e!42728 () Bool)

(assert (=> b!65235 (= e!42727 e!42728)))

(declare-fun lt!27980 () (_ BitVec 64))

(assert (=> b!65235 (= lt!27980 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27978 () Unit!1776)

(assert (=> b!65235 (= lt!27978 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3759 newMap!16) lt!27980 #b00000000000000000000000000000000))))

(assert (=> b!65235 (arrayContainsKey!0 (_keys!3759 newMap!16) lt!27980 #b00000000000000000000000000000000)))

(declare-fun lt!27979 () Unit!1776)

(assert (=> b!65235 (= lt!27979 lt!27978)))

(declare-fun res!35492 () Bool)

(assert (=> b!65235 (= res!35492 (= (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000) (_keys!3759 newMap!16) (mask!6043 newMap!16)) (Found!225 #b00000000000000000000000000000000)))))

(assert (=> b!65235 (=> (not res!35492) (not e!42728))))

(declare-fun b!65236 () Bool)

(declare-fun call!5341 () Bool)

(assert (=> b!65236 (= e!42727 call!5341)))

(declare-fun b!65237 () Bool)

(assert (=> b!65237 (= e!42729 e!42727)))

(declare-fun c!8977 () Bool)

(assert (=> b!65237 (= c!8977 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5338 () Bool)

(assert (=> bm!5338 (= call!5341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun b!65238 () Bool)

(assert (=> b!65238 (= e!42728 call!5341)))

(assert (= (and d!13649 (not res!35493)) b!65237))

(assert (= (and b!65237 c!8977) b!65235))

(assert (= (and b!65237 (not c!8977)) b!65236))

(assert (= (and b!65235 res!35492) b!65238))

(assert (= (or b!65238 b!65236) bm!5338))

(assert (=> b!65235 m!59653))

(declare-fun m!60005 () Bool)

(assert (=> b!65235 m!60005))

(declare-fun m!60007 () Bool)

(assert (=> b!65235 m!60007))

(assert (=> b!65235 m!59653))

(declare-fun m!60009 () Bool)

(assert (=> b!65235 m!60009))

(assert (=> b!65237 m!59653))

(assert (=> b!65237 m!59653))

(assert (=> b!65237 m!59655))

(declare-fun m!60011 () Bool)

(assert (=> bm!5338 m!60011))

(assert (=> b!64725 d!13649))

(declare-fun b!65248 () Bool)

(declare-fun res!35504 () Bool)

(declare-fun e!42732 () Bool)

(assert (=> b!65248 (=> (not res!35504) (not e!42732))))

(declare-fun size!2042 (LongMapFixedSize!646) (_ BitVec 32))

(assert (=> b!65248 (= res!35504 (bvsge (size!2042 newMap!16) (_size!372 newMap!16)))))

(declare-fun b!65249 () Bool)

(declare-fun res!35502 () Bool)

(assert (=> b!65249 (=> (not res!35502) (not e!42732))))

(assert (=> b!65249 (= res!35502 (= (size!2042 newMap!16) (bvadd (_size!372 newMap!16) (bvsdiv (bvadd (extraKeys!1994 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!13651 () Bool)

(declare-fun res!35505 () Bool)

(assert (=> d!13651 (=> (not res!35505) (not e!42732))))

(assert (=> d!13651 (= res!35505 (validMask!0 (mask!6043 newMap!16)))))

(assert (=> d!13651 (= (simpleValid!46 newMap!16) e!42732)))

(declare-fun b!65247 () Bool)

(declare-fun res!35503 () Bool)

(assert (=> b!65247 (=> (not res!35503) (not e!42732))))

(assert (=> b!65247 (= res!35503 (and (= (size!2037 (_values!2104 newMap!16)) (bvadd (mask!6043 newMap!16) #b00000000000000000000000000000001)) (= (size!2036 (_keys!3759 newMap!16)) (size!2037 (_values!2104 newMap!16))) (bvsge (_size!372 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!372 newMap!16) (bvadd (mask!6043 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!65250 () Bool)

(assert (=> b!65250 (= e!42732 (and (bvsge (extraKeys!1994 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1994 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!372 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!13651 res!35505) b!65247))

(assert (= (and b!65247 res!35503) b!65248))

(assert (= (and b!65248 res!35504) b!65249))

(assert (= (and b!65249 res!35502) b!65250))

(declare-fun m!60013 () Bool)

(assert (=> b!65248 m!60013))

(assert (=> b!65249 m!60013))

(assert (=> d!13651 m!59581))

(assert (=> d!13509 d!13651))

(declare-fun b!65251 () Bool)

(declare-fun e!42734 () Bool)

(declare-fun e!42736 () Bool)

(assert (=> b!65251 (= e!42734 e!42736)))

(declare-fun c!8978 () Bool)

(assert (=> b!65251 (= c!8978 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!65252 () Bool)

(declare-fun call!5342 () Bool)

(assert (=> b!65252 (= e!42736 call!5342)))

(declare-fun b!65253 () Bool)

(declare-fun e!42733 () Bool)

(assert (=> b!65253 (= e!42733 e!42734)))

(declare-fun res!35508 () Bool)

(assert (=> b!65253 (=> (not res!35508) (not e!42734))))

(declare-fun e!42735 () Bool)

(assert (=> b!65253 (= res!35508 (not e!42735))))

(declare-fun res!35507 () Bool)

(assert (=> b!65253 (=> (not res!35507) (not e!42735))))

(assert (=> b!65253 (= res!35507 (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!5339 () Bool)

(assert (=> bm!5339 (= call!5342 (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8978 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8913 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436) Nil!1436)) (ite c!8913 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436) Nil!1436))))))

(declare-fun b!65255 () Bool)

(assert (=> b!65255 (= e!42735 (contains!696 (ite c!8913 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436) Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!65254 () Bool)

(assert (=> b!65254 (= e!42736 call!5342)))

(declare-fun d!13653 () Bool)

(declare-fun res!35506 () Bool)

(assert (=> d!13653 (=> res!35506 e!42733)))

(assert (=> d!13653 (= res!35506 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(assert (=> d!13653 (= (arrayNoDuplicates!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8913 (Cons!1435 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) Nil!1436) Nil!1436)) e!42733)))

(assert (= (and d!13653 (not res!35506)) b!65253))

(assert (= (and b!65253 res!35507) b!65255))

(assert (= (and b!65253 res!35508) b!65251))

(assert (= (and b!65251 c!8978) b!65252))

(assert (= (and b!65251 (not c!8978)) b!65254))

(assert (= (or b!65252 b!65254) bm!5339))

(declare-fun m!60015 () Bool)

(assert (=> b!65251 m!60015))

(assert (=> b!65251 m!60015))

(declare-fun m!60017 () Bool)

(assert (=> b!65251 m!60017))

(assert (=> b!65253 m!60015))

(assert (=> b!65253 m!60015))

(assert (=> b!65253 m!60017))

(assert (=> bm!5339 m!60015))

(declare-fun m!60019 () Bool)

(assert (=> bm!5339 m!60019))

(assert (=> b!65255 m!60015))

(assert (=> b!65255 m!60015))

(declare-fun m!60021 () Bool)

(assert (=> b!65255 m!60021))

(assert (=> bm!5301 d!13653))

(declare-fun d!13655 () Bool)

(declare-fun e!42738 () Bool)

(assert (=> d!13655 e!42738))

(declare-fun res!35509 () Bool)

(assert (=> d!13655 (=> res!35509 e!42738)))

(declare-fun lt!27984 () Bool)

(assert (=> d!13655 (= res!35509 (not lt!27984))))

(declare-fun lt!27983 () Bool)

(assert (=> d!13655 (= lt!27984 lt!27983)))

(declare-fun lt!27981 () Unit!1776)

(declare-fun e!42737 () Unit!1776)

(assert (=> d!13655 (= lt!27981 e!42737)))

(declare-fun c!8979 () Bool)

(assert (=> d!13655 (= c!8979 lt!27983)))

(assert (=> d!13655 (= lt!27983 (containsKey!132 (toList!696 call!5268) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13655 (= (contains!694 call!5268 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!27984)))

(declare-fun b!65256 () Bool)

(declare-fun lt!27982 () Unit!1776)

(assert (=> b!65256 (= e!42737 lt!27982)))

(assert (=> b!65256 (= lt!27982 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 call!5268) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> b!65256 (isDefined!81 (getValueByKey!129 (toList!696 call!5268) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65257 () Bool)

(declare-fun Unit!1796 () Unit!1776)

(assert (=> b!65257 (= e!42737 Unit!1796)))

(declare-fun b!65258 () Bool)

(assert (=> b!65258 (= e!42738 (isDefined!81 (getValueByKey!129 (toList!696 call!5268) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (= (and d!13655 c!8979) b!65256))

(assert (= (and d!13655 (not c!8979)) b!65257))

(assert (= (and d!13655 (not res!35509)) b!65258))

(assert (=> d!13655 m!59255))

(declare-fun m!60023 () Bool)

(assert (=> d!13655 m!60023))

(assert (=> b!65256 m!59255))

(declare-fun m!60025 () Bool)

(assert (=> b!65256 m!60025))

(assert (=> b!65256 m!59255))

(declare-fun m!60027 () Bool)

(assert (=> b!65256 m!60027))

(assert (=> b!65256 m!60027))

(declare-fun m!60029 () Bool)

(assert (=> b!65256 m!60029))

(assert (=> b!65258 m!59255))

(assert (=> b!65258 m!60027))

(assert (=> b!65258 m!60027))

(assert (=> b!65258 m!60029))

(assert (=> b!64857 d!13655))

(declare-fun d!13657 () Bool)

(assert (=> d!13657 (= (validKeyInArray!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) (and (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64967 d!13657))

(declare-fun d!13659 () Bool)

(assert (=> d!13659 (= (get!1105 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64867 d!13659))

(declare-fun d!13661 () Bool)

(assert (=> d!13661 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000)))

(declare-fun lt!27987 () Unit!1776)

(declare-fun choose!13 (array!3771 (_ BitVec 64) (_ BitVec 32)) Unit!1776)

(assert (=> d!13661 (= lt!27987 (choose!13 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000))))

(assert (=> d!13661 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13661 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000) lt!27987)))

(declare-fun bs!2841 () Bool)

(assert (= bs!2841 d!13661))

(assert (=> bs!2841 m!59531))

(declare-fun m!60031 () Bool)

(assert (=> bs!2841 m!60031))

(assert (=> b!64939 d!13661))

(declare-fun d!13663 () Bool)

(declare-fun res!35510 () Bool)

(declare-fun e!42739 () Bool)

(assert (=> d!13663 (=> res!35510 e!42739)))

(assert (=> d!13663 (= res!35510 (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) lt!27717))))

(assert (=> d!13663 (= (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 #b00000000000000000000000000000000) e!42739)))

(declare-fun b!65259 () Bool)

(declare-fun e!42740 () Bool)

(assert (=> b!65259 (= e!42739 e!42740)))

(declare-fun res!35511 () Bool)

(assert (=> b!65259 (=> (not res!35511) (not e!42740))))

(assert (=> b!65259 (= res!35511 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))))

(declare-fun b!65260 () Bool)

(assert (=> b!65260 (= e!42740 (arrayContainsKey!0 (_keys!3759 (v!2447 (underlying!239 thiss!992))) lt!27717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13663 (not res!35510)) b!65259))

(assert (= (and b!65259 res!35511) b!65260))

(assert (=> d!13663 m!59527))

(declare-fun m!60033 () Bool)

(assert (=> b!65260 m!60033))

(assert (=> b!64939 d!13663))

(declare-fun b!65261 () Bool)

(declare-fun e!42743 () SeekEntryResult!225)

(declare-fun e!42741 () SeekEntryResult!225)

(assert (=> b!65261 (= e!42743 e!42741)))

(declare-fun lt!27989 () (_ BitVec 64))

(declare-fun lt!27988 () SeekEntryResult!225)

(assert (=> b!65261 (= lt!27989 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (index!3029 lt!27988)))))

(declare-fun c!8981 () Bool)

(assert (=> b!65261 (= c!8981 (= lt!27989 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65262 () Bool)

(assert (=> b!65262 (= e!42741 (Found!225 (index!3029 lt!27988)))))

(declare-fun b!65263 () Bool)

(declare-fun e!42742 () SeekEntryResult!225)

(assert (=> b!65263 (= e!42742 (MissingZero!225 (index!3029 lt!27988)))))

(declare-fun d!13665 () Bool)

(declare-fun lt!27990 () SeekEntryResult!225)

(assert (=> d!13665 (and (or ((_ is Undefined!225) lt!27990) (not ((_ is Found!225) lt!27990)) (and (bvsge (index!3028 lt!27990) #b00000000000000000000000000000000) (bvslt (index!3028 lt!27990) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!225) lt!27990) ((_ is Found!225) lt!27990) (not ((_ is MissingZero!225) lt!27990)) (and (bvsge (index!3027 lt!27990) #b00000000000000000000000000000000) (bvslt (index!3027 lt!27990) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!225) lt!27990) ((_ is Found!225) lt!27990) ((_ is MissingZero!225) lt!27990) (not ((_ is MissingVacant!225) lt!27990)) (and (bvsge (index!3030 lt!27990) #b00000000000000000000000000000000) (bvslt (index!3030 lt!27990) (size!2036 (_keys!3759 (v!2447 (underlying!239 thiss!992))))))) (or ((_ is Undefined!225) lt!27990) (ite ((_ is Found!225) lt!27990) (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (index!3028 lt!27990)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!225) lt!27990) (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (index!3027 lt!27990)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!225) lt!27990) (= (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (index!3030 lt!27990)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13665 (= lt!27990 e!42743)))

(declare-fun c!8980 () Bool)

(assert (=> d!13665 (= c!8980 (and ((_ is Intermediate!225) lt!27988) (undefined!1037 lt!27988)))))

(assert (=> d!13665 (= lt!27988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (mask!6043 (v!2447 (underlying!239 thiss!992)))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(assert (=> d!13665 (validMask!0 (mask!6043 (v!2447 (underlying!239 thiss!992))))))

(assert (=> d!13665 (= (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))) lt!27990)))

(declare-fun b!65264 () Bool)

(assert (=> b!65264 (= e!42742 (seekKeyOrZeroReturnVacant!0 (x!10536 lt!27988) (index!3029 lt!27988) (index!3029 lt!27988) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000) (_keys!3759 (v!2447 (underlying!239 thiss!992))) (mask!6043 (v!2447 (underlying!239 thiss!992)))))))

(declare-fun b!65265 () Bool)

(assert (=> b!65265 (= e!42743 Undefined!225)))

(declare-fun b!65266 () Bool)

(declare-fun c!8982 () Bool)

(assert (=> b!65266 (= c!8982 (= lt!27989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65266 (= e!42741 e!42742)))

(assert (= (and d!13665 c!8980) b!65265))

(assert (= (and d!13665 (not c!8980)) b!65261))

(assert (= (and b!65261 c!8981) b!65262))

(assert (= (and b!65261 (not c!8981)) b!65266))

(assert (= (and b!65266 c!8982) b!65263))

(assert (= (and b!65266 (not c!8982)) b!65264))

(declare-fun m!60035 () Bool)

(assert (=> b!65261 m!60035))

(declare-fun m!60037 () Bool)

(assert (=> d!13665 m!60037))

(assert (=> d!13665 m!59249))

(declare-fun m!60039 () Bool)

(assert (=> d!13665 m!60039))

(assert (=> d!13665 m!59527))

(declare-fun m!60041 () Bool)

(assert (=> d!13665 m!60041))

(declare-fun m!60043 () Bool)

(assert (=> d!13665 m!60043))

(assert (=> d!13665 m!59527))

(assert (=> d!13665 m!60039))

(declare-fun m!60045 () Bool)

(assert (=> d!13665 m!60045))

(assert (=> b!65264 m!59527))

(declare-fun m!60047 () Bool)

(assert (=> b!65264 m!60047))

(assert (=> b!64939 d!13665))

(declare-fun bm!5340 () Bool)

(declare-fun call!5344 () ListLongMap!1361)

(declare-fun call!5349 () ListLongMap!1361)

(assert (=> bm!5340 (= call!5344 call!5349)))

(declare-fun call!5346 () ListLongMap!1361)

(declare-fun bm!5341 () Bool)

(declare-fun call!5345 () ListLongMap!1361)

(declare-fun c!8987 () Bool)

(declare-fun c!8986 () Bool)

(assert (=> bm!5341 (= call!5346 (+!84 (ite c!8986 call!5345 (ite c!8987 call!5349 call!5344)) (ite (or c!8986 c!8987) (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2030 newMap!16)) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16))))))))

(declare-fun bm!5342 () Bool)

(declare-fun call!5343 () Bool)

(declare-fun lt!28002 () ListLongMap!1361)

(assert (=> bm!5342 (= call!5343 (contains!694 lt!28002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65267 () Bool)

(declare-fun e!42747 () Bool)

(assert (=> b!65267 (= e!42747 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13667 () Bool)

(declare-fun e!42744 () Bool)

(assert (=> d!13667 e!42744))

(declare-fun res!35512 () Bool)

(assert (=> d!13667 (=> (not res!35512) (not e!42744))))

(assert (=> d!13667 (= res!35512 (or (bvsge #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))))

(declare-fun lt!27993 () ListLongMap!1361)

(assert (=> d!13667 (= lt!28002 lt!27993)))

(declare-fun lt!27992 () Unit!1776)

(declare-fun e!42748 () Unit!1776)

(assert (=> d!13667 (= lt!27992 e!42748)))

(declare-fun c!8985 () Bool)

(assert (=> d!13667 (= c!8985 e!42747)))

(declare-fun res!35514 () Bool)

(assert (=> d!13667 (=> (not res!35514) (not e!42747))))

(assert (=> d!13667 (= res!35514 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun e!42752 () ListLongMap!1361)

(assert (=> d!13667 (= lt!27993 e!42752)))

(assert (=> d!13667 (= c!8986 (and (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13667 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13667 (= (getCurrentListMap!396 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)) lt!28002)))

(declare-fun bm!5343 () Bool)

(declare-fun call!5348 () ListLongMap!1361)

(assert (=> bm!5343 (= call!5348 call!5346)))

(declare-fun b!65268 () Bool)

(declare-fun lt!27995 () Unit!1776)

(assert (=> b!65268 (= e!42748 lt!27995)))

(declare-fun lt!27991 () ListLongMap!1361)

(assert (=> b!65268 (= lt!27991 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!28001 () (_ BitVec 64))

(assert (=> b!65268 (= lt!28001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28008 () (_ BitVec 64))

(assert (=> b!65268 (= lt!28008 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!28009 () Unit!1776)

(assert (=> b!65268 (= lt!28009 (addStillContains!46 lt!27991 lt!28001 (zeroValue!2030 newMap!16) lt!28008))))

(assert (=> b!65268 (contains!694 (+!84 lt!27991 (tuple2!2049 lt!28001 (zeroValue!2030 newMap!16))) lt!28008)))

(declare-fun lt!28011 () Unit!1776)

(assert (=> b!65268 (= lt!28011 lt!28009)))

(declare-fun lt!28007 () ListLongMap!1361)

(assert (=> b!65268 (= lt!28007 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!28000 () (_ BitVec 64))

(assert (=> b!65268 (= lt!28000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27996 () (_ BitVec 64))

(assert (=> b!65268 (= lt!27996 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27998 () Unit!1776)

(assert (=> b!65268 (= lt!27998 (addApplyDifferent!46 lt!28007 lt!28000 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) lt!27996))))

(assert (=> b!65268 (= (apply!70 (+!84 lt!28007 (tuple2!2049 lt!28000 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))) lt!27996) (apply!70 lt!28007 lt!27996))))

(declare-fun lt!28010 () Unit!1776)

(assert (=> b!65268 (= lt!28010 lt!27998)))

(declare-fun lt!28005 () ListLongMap!1361)

(assert (=> b!65268 (= lt!28005 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!28004 () (_ BitVec 64))

(assert (=> b!65268 (= lt!28004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27994 () (_ BitVec 64))

(assert (=> b!65268 (= lt!27994 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27999 () Unit!1776)

(assert (=> b!65268 (= lt!27999 (addApplyDifferent!46 lt!28005 lt!28004 (zeroValue!2030 newMap!16) lt!27994))))

(assert (=> b!65268 (= (apply!70 (+!84 lt!28005 (tuple2!2049 lt!28004 (zeroValue!2030 newMap!16))) lt!27994) (apply!70 lt!28005 lt!27994))))

(declare-fun lt!28012 () Unit!1776)

(assert (=> b!65268 (= lt!28012 lt!27999)))

(declare-fun lt!28003 () ListLongMap!1361)

(assert (=> b!65268 (= lt!28003 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun lt!27997 () (_ BitVec 64))

(assert (=> b!65268 (= lt!27997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28006 () (_ BitVec 64))

(assert (=> b!65268 (= lt!28006 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65268 (= lt!27995 (addApplyDifferent!46 lt!28003 lt!27997 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) lt!28006))))

(assert (=> b!65268 (= (apply!70 (+!84 lt!28003 (tuple2!2049 lt!27997 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))) lt!28006) (apply!70 lt!28003 lt!28006))))

(declare-fun b!65269 () Bool)

(declare-fun e!42746 () Bool)

(assert (=> b!65269 (= e!42746 (validKeyInArray!0 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!65270 () Bool)

(declare-fun e!42756 () Bool)

(declare-fun call!5347 () Bool)

(assert (=> b!65270 (= e!42756 (not call!5347))))

(declare-fun b!65271 () Bool)

(declare-fun e!42745 () Bool)

(assert (=> b!65271 (= e!42756 e!42745)))

(declare-fun res!35515 () Bool)

(assert (=> b!65271 (= res!35515 call!5347)))

(assert (=> b!65271 (=> (not res!35515) (not e!42745))))

(declare-fun b!65272 () Bool)

(declare-fun e!42750 () Bool)

(assert (=> b!65272 (= e!42750 (= (apply!70 lt!28002 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)) (get!1102 (select (arr!1803 (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!312 (defaultEntry!2121 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!65272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2037 (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))))))))

(assert (=> b!65272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65273 () Bool)

(declare-fun res!35518 () Bool)

(assert (=> b!65273 (=> (not res!35518) (not e!42744))))

(declare-fun e!42749 () Bool)

(assert (=> b!65273 (= res!35518 e!42749)))

(declare-fun res!35516 () Bool)

(assert (=> b!65273 (=> res!35516 e!42749)))

(assert (=> b!65273 (= res!35516 (not e!42746))))

(declare-fun res!35519 () Bool)

(assert (=> b!65273 (=> (not res!35519) (not e!42746))))

(assert (=> b!65273 (= res!35519 (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65274 () Bool)

(declare-fun e!42751 () ListLongMap!1361)

(assert (=> b!65274 (= e!42751 call!5344)))

(declare-fun b!65275 () Bool)

(declare-fun e!42755 () Bool)

(assert (=> b!65275 (= e!42755 (not call!5343))))

(declare-fun b!65276 () Bool)

(declare-fun e!42753 () ListLongMap!1361)

(assert (=> b!65276 (= e!42753 call!5348)))

(declare-fun b!65277 () Bool)

(assert (=> b!65277 (= e!42752 e!42753)))

(assert (=> b!65277 (= c!8987 (and (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65278 () Bool)

(declare-fun c!8984 () Bool)

(assert (=> b!65278 (= c!8984 (and (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!65278 (= e!42753 e!42751)))

(declare-fun b!65279 () Bool)

(assert (=> b!65279 (= e!42752 (+!84 call!5346 (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)))))))

(declare-fun b!65280 () Bool)

(assert (=> b!65280 (= e!42744 e!42756)))

(declare-fun c!8988 () Bool)

(assert (=> b!65280 (= c!8988 (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!65281 () Bool)

(assert (=> b!65281 (= e!42745 (= (apply!70 lt!28002 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16))))))

(declare-fun b!65282 () Bool)

(declare-fun Unit!1797 () Unit!1776)

(assert (=> b!65282 (= e!42748 Unit!1797)))

(declare-fun bm!5344 () Bool)

(assert (=> bm!5344 (= call!5347 (contains!694 lt!28002 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65283 () Bool)

(declare-fun e!42754 () Bool)

(assert (=> b!65283 (= e!42755 e!42754)))

(declare-fun res!35520 () Bool)

(assert (=> b!65283 (= res!35520 call!5343)))

(assert (=> b!65283 (=> (not res!35520) (not e!42754))))

(declare-fun b!65284 () Bool)

(assert (=> b!65284 (= e!42751 call!5348)))

(declare-fun b!65285 () Bool)

(assert (=> b!65285 (= e!42754 (= (apply!70 lt!28002 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2030 newMap!16)))))

(declare-fun bm!5345 () Bool)

(assert (=> bm!5345 (= call!5349 call!5345)))

(declare-fun b!65286 () Bool)

(assert (=> b!65286 (= e!42749 e!42750)))

(declare-fun res!35517 () Bool)

(assert (=> b!65286 (=> (not res!35517) (not e!42750))))

(assert (=> b!65286 (= res!35517 (contains!694 lt!28002 (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!65286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2036 (_keys!3759 newMap!16))))))

(declare-fun bm!5346 () Bool)

(assert (=> bm!5346 (= call!5345 (getCurrentListMapNoExtraKeys!48 (_keys!3759 newMap!16) (ite (or c!8871 c!8872) (_values!2104 newMap!16) (array!3774 (store (arr!1803 (_values!2104 newMap!16)) (index!3028 lt!27623) (ValueCellFull!869 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2037 (_values!2104 newMap!16)))) (mask!6043 newMap!16) (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) (zeroValue!2030 newMap!16) (ite c!8871 (ite c!8875 (minValue!2030 newMap!16) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2030 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2121 newMap!16)))))

(declare-fun b!65287 () Bool)

(declare-fun res!35513 () Bool)

(assert (=> b!65287 (=> (not res!35513) (not e!42744))))

(assert (=> b!65287 (= res!35513 e!42755)))

(declare-fun c!8983 () Bool)

(assert (=> b!65287 (= c!8983 (not (= (bvand (ite c!8871 (ite c!8875 (extraKeys!1994 newMap!16) lt!27636) (extraKeys!1994 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!13667 c!8986) b!65279))

(assert (= (and d!13667 (not c!8986)) b!65277))

(assert (= (and b!65277 c!8987) b!65276))

(assert (= (and b!65277 (not c!8987)) b!65278))

(assert (= (and b!65278 c!8984) b!65284))

(assert (= (and b!65278 (not c!8984)) b!65274))

(assert (= (or b!65284 b!65274) bm!5340))

(assert (= (or b!65276 bm!5340) bm!5345))

(assert (= (or b!65276 b!65284) bm!5343))

(assert (= (or b!65279 bm!5345) bm!5346))

(assert (= (or b!65279 bm!5343) bm!5341))

(assert (= (and d!13667 res!35514) b!65267))

(assert (= (and d!13667 c!8985) b!65268))

(assert (= (and d!13667 (not c!8985)) b!65282))

(assert (= (and d!13667 res!35512) b!65273))

(assert (= (and b!65273 res!35519) b!65269))

(assert (= (and b!65273 (not res!35516)) b!65286))

(assert (= (and b!65286 res!35517) b!65272))

(assert (= (and b!65273 res!35518) b!65287))

(assert (= (and b!65287 c!8983) b!65283))

(assert (= (and b!65287 (not c!8983)) b!65275))

(assert (= (and b!65283 res!35520) b!65285))

(assert (= (or b!65283 b!65275) bm!5342))

(assert (= (and b!65287 res!35513) b!65280))

(assert (= (and b!65280 c!8988) b!65271))

(assert (= (and b!65280 (not c!8988)) b!65270))

(assert (= (and b!65271 res!35515) b!65281))

(assert (= (or b!65271 b!65270) bm!5344))

(declare-fun b_lambda!2927 () Bool)

(assert (=> (not b_lambda!2927) (not b!65272)))

(assert (=> b!65272 t!4873))

(declare-fun b_and!4001 () Bool)

(assert (= b_and!3997 (and (=> t!4873 result!2507) b_and!4001)))

(assert (=> b!65272 t!4875))

(declare-fun b_and!4003 () Bool)

(assert (= b_and!3999 (and (=> t!4875 result!2509) b_and!4003)))

(assert (=> b!65267 m!59653))

(assert (=> b!65267 m!59653))

(assert (=> b!65267 m!59655))

(assert (=> b!65269 m!59653))

(assert (=> b!65269 m!59653))

(assert (=> b!65269 m!59655))

(declare-fun m!60049 () Bool)

(assert (=> bm!5341 m!60049))

(declare-fun m!60051 () Bool)

(assert (=> b!65279 m!60051))

(assert (=> b!65286 m!59653))

(assert (=> b!65286 m!59653))

(declare-fun m!60053 () Bool)

(assert (=> b!65286 m!60053))

(declare-fun m!60055 () Bool)

(assert (=> bm!5344 m!60055))

(declare-fun m!60057 () Bool)

(assert (=> bm!5342 m!60057))

(assert (=> d!13667 m!59581))

(assert (=> b!65272 m!59653))

(assert (=> b!65272 m!59669))

(assert (=> b!65272 m!59653))

(declare-fun m!60059 () Bool)

(assert (=> b!65272 m!60059))

(declare-fun m!60061 () Bool)

(assert (=> b!65272 m!60061))

(assert (=> b!65272 m!59669))

(declare-fun m!60063 () Bool)

(assert (=> b!65272 m!60063))

(assert (=> b!65272 m!60061))

(declare-fun m!60065 () Bool)

(assert (=> b!65285 m!60065))

(declare-fun m!60067 () Bool)

(assert (=> b!65281 m!60067))

(declare-fun m!60069 () Bool)

(assert (=> bm!5346 m!60069))

(declare-fun m!60071 () Bool)

(assert (=> b!65268 m!60071))

(declare-fun m!60073 () Bool)

(assert (=> b!65268 m!60073))

(assert (=> b!65268 m!59653))

(declare-fun m!60075 () Bool)

(assert (=> b!65268 m!60075))

(declare-fun m!60077 () Bool)

(assert (=> b!65268 m!60077))

(declare-fun m!60079 () Bool)

(assert (=> b!65268 m!60079))

(declare-fun m!60081 () Bool)

(assert (=> b!65268 m!60081))

(assert (=> b!65268 m!60079))

(declare-fun m!60083 () Bool)

(assert (=> b!65268 m!60083))

(declare-fun m!60085 () Bool)

(assert (=> b!65268 m!60085))

(assert (=> b!65268 m!60069))

(assert (=> b!65268 m!60075))

(declare-fun m!60087 () Bool)

(assert (=> b!65268 m!60087))

(declare-fun m!60089 () Bool)

(assert (=> b!65268 m!60089))

(assert (=> b!65268 m!60073))

(declare-fun m!60091 () Bool)

(assert (=> b!65268 m!60091))

(declare-fun m!60093 () Bool)

(assert (=> b!65268 m!60093))

(assert (=> b!65268 m!60089))

(declare-fun m!60095 () Bool)

(assert (=> b!65268 m!60095))

(declare-fun m!60097 () Bool)

(assert (=> b!65268 m!60097))

(declare-fun m!60099 () Bool)

(assert (=> b!65268 m!60099))

(assert (=> bm!5260 d!13667))

(assert (=> b!64965 d!13657))

(assert (=> b!64839 d!13573))

(declare-fun d!13669 () Bool)

(declare-fun res!35521 () Bool)

(declare-fun e!42757 () Bool)

(assert (=> d!13669 (=> res!35521 e!42757)))

(assert (=> d!13669 (= res!35521 (= (select (arr!1802 (_keys!3759 newMap!16)) #b00000000000000000000000000000000) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (=> d!13669 (= (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42757)))

(declare-fun b!65288 () Bool)

(declare-fun e!42758 () Bool)

(assert (=> b!65288 (= e!42757 e!42758)))

(declare-fun res!35522 () Bool)

(assert (=> b!65288 (=> (not res!35522) (not e!42758))))

(assert (=> b!65288 (= res!35522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65289 () Bool)

(assert (=> b!65289 (= e!42758 (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13669 (not res!35521)) b!65288))

(assert (= (and b!65288 res!35522) b!65289))

(assert (=> d!13669 m!59653))

(assert (=> b!65289 m!59255))

(declare-fun m!60101 () Bool)

(assert (=> b!65289 m!60101))

(assert (=> bm!5258 d!13669))

(declare-fun d!13671 () Bool)

(declare-fun lt!28013 () Bool)

(assert (=> d!13671 (= lt!28013 (select (content!71 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!42760 () Bool)

(assert (=> d!13671 (= lt!28013 e!42760)))

(declare-fun res!35524 () Bool)

(assert (=> d!13671 (=> (not res!35524) (not e!42760))))

(assert (=> d!13671 (= res!35524 ((_ is Cons!1435) Nil!1436))))

(assert (=> d!13671 (= (contains!696 Nil!1436 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)) lt!28013)))

(declare-fun b!65290 () Bool)

(declare-fun e!42759 () Bool)

(assert (=> b!65290 (= e!42760 e!42759)))

(declare-fun res!35523 () Bool)

(assert (=> b!65290 (=> res!35523 e!42759)))

(assert (=> b!65290 (= res!35523 (= (h!2019 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!65291 () Bool)

(assert (=> b!65291 (= e!42759 (contains!696 (t!4861 Nil!1436) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!13671 res!35524) b!65290))

(assert (= (and b!65290 (not res!35523)) b!65291))

(assert (=> d!13671 m!59589))

(assert (=> d!13671 m!59527))

(declare-fun m!60103 () Bool)

(assert (=> d!13671 m!60103))

(assert (=> b!65291 m!59527))

(declare-fun m!60105 () Bool)

(assert (=> b!65291 m!60105))

(assert (=> b!64974 d!13671))

(declare-fun b!65308 () Bool)

(declare-fun res!35536 () Bool)

(declare-fun e!42769 () Bool)

(assert (=> b!65308 (=> (not res!35536) (not e!42769))))

(declare-fun lt!28019 () SeekEntryResult!225)

(assert (=> b!65308 (= res!35536 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3030 lt!28019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65308 (and (bvsge (index!3030 lt!28019) #b00000000000000000000000000000000) (bvslt (index!3030 lt!28019) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun b!65309 () Bool)

(declare-fun e!42770 () Bool)

(declare-fun e!42772 () Bool)

(assert (=> b!65309 (= e!42770 e!42772)))

(declare-fun c!8994 () Bool)

(assert (=> b!65309 (= c!8994 ((_ is MissingVacant!225) lt!28019))))

(declare-fun bm!5351 () Bool)

(declare-fun call!5355 () Bool)

(declare-fun c!8993 () Bool)

(assert (=> bm!5351 (= call!5355 (inRange!0 (ite c!8993 (index!3027 lt!28019) (index!3030 lt!28019)) (mask!6043 newMap!16)))))

(declare-fun b!65310 () Bool)

(declare-fun res!35535 () Bool)

(assert (=> b!65310 (=> (not res!35535) (not e!42769))))

(assert (=> b!65310 (= res!35535 call!5355)))

(assert (=> b!65310 (= e!42772 e!42769)))

(declare-fun bm!5352 () Bool)

(declare-fun call!5354 () Bool)

(assert (=> bm!5352 (= call!5354 (arrayContainsKey!0 (_keys!3759 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!65312 () Bool)

(assert (=> b!65312 (= e!42772 ((_ is Undefined!225) lt!28019))))

(declare-fun b!65313 () Bool)

(declare-fun e!42771 () Bool)

(assert (=> b!65313 (= e!42770 e!42771)))

(declare-fun res!35533 () Bool)

(assert (=> b!65313 (= res!35533 call!5355)))

(assert (=> b!65313 (=> (not res!35533) (not e!42771))))

(declare-fun b!65314 () Bool)

(assert (=> b!65314 (and (bvsge (index!3027 lt!28019) #b00000000000000000000000000000000) (bvslt (index!3027 lt!28019) (size!2036 (_keys!3759 newMap!16))))))

(declare-fun res!35534 () Bool)

(assert (=> b!65314 (= res!35534 (= (select (arr!1802 (_keys!3759 newMap!16)) (index!3027 lt!28019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65314 (=> (not res!35534) (not e!42771))))

(declare-fun b!65315 () Bool)

(assert (=> b!65315 (= e!42769 (not call!5354))))

(declare-fun b!65311 () Bool)

(assert (=> b!65311 (= e!42771 (not call!5354))))

(declare-fun d!13673 () Bool)

(assert (=> d!13673 e!42770))

(assert (=> d!13673 (= c!8993 ((_ is MissingZero!225) lt!28019))))

(assert (=> d!13673 (= lt!28019 (seekEntryOrOpen!0 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (_keys!3759 newMap!16) (mask!6043 newMap!16)))))

(declare-fun lt!28018 () Unit!1776)

(declare-fun choose!368 (array!3771 array!3773 (_ BitVec 32) (_ BitVec 32) V!2881 V!2881 (_ BitVec 64) Int) Unit!1776)

(assert (=> d!13673 (= lt!28018 (choose!368 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)))))

(assert (=> d!13673 (validMask!0 (mask!6043 newMap!16))))

(assert (=> d!13673 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!19 (_keys!3759 newMap!16) (_values!2104 newMap!16) (mask!6043 newMap!16) (extraKeys!1994 newMap!16) (zeroValue!2030 newMap!16) (minValue!2030 newMap!16) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (defaultEntry!2121 newMap!16)) lt!28018)))

(assert (= (and d!13673 c!8993) b!65313))

(assert (= (and d!13673 (not c!8993)) b!65309))

(assert (= (and b!65313 res!35533) b!65314))

(assert (= (and b!65314 res!35534) b!65311))

(assert (= (and b!65309 c!8994) b!65310))

(assert (= (and b!65309 (not c!8994)) b!65312))

(assert (= (and b!65310 res!35535) b!65308))

(assert (= (and b!65308 res!35536) b!65315))

(assert (= (or b!65313 b!65310) bm!5351))

(assert (= (or b!65311 b!65315) bm!5352))

(assert (=> d!13673 m!59255))

(assert (=> d!13673 m!59439))

(assert (=> d!13673 m!59255))

(declare-fun m!60107 () Bool)

(assert (=> d!13673 m!60107))

(assert (=> d!13673 m!59581))

(declare-fun m!60109 () Bool)

(assert (=> bm!5351 m!60109))

(declare-fun m!60111 () Bool)

(assert (=> b!65308 m!60111))

(declare-fun m!60113 () Bool)

(assert (=> b!65314 m!60113))

(assert (=> bm!5352 m!59255))

(assert (=> bm!5352 m!59437))

(assert (=> bm!5274 d!13673))

(assert (=> b!64912 d!13627))

(declare-fun d!13675 () Bool)

(declare-fun isEmpty!311 (Option!135) Bool)

(assert (=> d!13675 (= (isDefined!81 (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))) (not (isEmpty!311 (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))))

(declare-fun bs!2842 () Bool)

(assert (= bs!2842 d!13675))

(assert (=> bs!2842 m!59405))

(declare-fun m!60115 () Bool)

(assert (=> bs!2842 m!60115))

(assert (=> b!64735 d!13675))

(declare-fun b!65325 () Bool)

(declare-fun e!42777 () Option!135)

(declare-fun e!42778 () Option!135)

(assert (=> b!65325 (= e!42777 e!42778)))

(declare-fun c!9000 () Bool)

(assert (=> b!65325 (= c!9000 (and ((_ is Cons!1434) (toList!696 lt!27503)) (not (= (_1!1035 (h!2018 (toList!696 lt!27503))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))))

(declare-fun b!65326 () Bool)

(assert (=> b!65326 (= e!42778 (getValueByKey!129 (t!4860 (toList!696 lt!27503)) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun b!65327 () Bool)

(assert (=> b!65327 (= e!42778 None!133)))

(declare-fun b!65324 () Bool)

(assert (=> b!65324 (= e!42777 (Some!134 (_2!1035 (h!2018 (toList!696 lt!27503)))))))

(declare-fun c!8999 () Bool)

(declare-fun d!13677 () Bool)

(assert (=> d!13677 (= c!8999 (and ((_ is Cons!1434) (toList!696 lt!27503)) (= (_1!1035 (h!2018 (toList!696 lt!27503))) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355))))))

(assert (=> d!13677 (= (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) e!42777)))

(assert (= (and d!13677 c!8999) b!65324))

(assert (= (and d!13677 (not c!8999)) b!65325))

(assert (= (and b!65325 c!9000) b!65326))

(assert (= (and b!65325 (not c!9000)) b!65327))

(assert (=> b!65326 m!59255))

(declare-fun m!60117 () Bool)

(assert (=> b!65326 m!60117))

(assert (=> b!64735 d!13677))

(declare-fun d!13679 () Bool)

(declare-fun e!42780 () Bool)

(assert (=> d!13679 e!42780))

(declare-fun res!35537 () Bool)

(assert (=> d!13679 (=> res!35537 e!42780)))

(declare-fun lt!28023 () Bool)

(assert (=> d!13679 (= res!35537 (not lt!28023))))

(declare-fun lt!28022 () Bool)

(assert (=> d!13679 (= lt!28023 lt!28022)))

(declare-fun lt!28020 () Unit!1776)

(declare-fun e!42779 () Unit!1776)

(assert (=> d!13679 (= lt!28020 e!42779)))

(declare-fun c!9001 () Bool)

(assert (=> d!13679 (= c!9001 lt!28022)))

(assert (=> d!13679 (= lt!28022 (containsKey!132 (toList!696 lt!27698) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13679 (= (contains!694 lt!27698 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!28023)))

(declare-fun b!65328 () Bool)

(declare-fun lt!28021 () Unit!1776)

(assert (=> b!65328 (= e!42779 lt!28021)))

(assert (=> b!65328 (= lt!28021 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 lt!27698) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65328 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!65329 () Bool)

(declare-fun Unit!1798 () Unit!1776)

(assert (=> b!65329 (= e!42779 Unit!1798)))

(declare-fun b!65330 () Bool)

(assert (=> b!65330 (= e!42780 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13679 c!9001) b!65328))

(assert (= (and d!13679 (not c!9001)) b!65329))

(assert (= (and d!13679 (not res!35537)) b!65330))

(assert (=> d!13679 m!59469))

(declare-fun m!60119 () Bool)

(assert (=> d!13679 m!60119))

(assert (=> b!65328 m!59469))

(declare-fun m!60121 () Bool)

(assert (=> b!65328 m!60121))

(assert (=> b!65328 m!59469))

(assert (=> b!65328 m!59795))

(assert (=> b!65328 m!59795))

(declare-fun m!60123 () Bool)

(assert (=> b!65328 m!60123))

(assert (=> b!65330 m!59469))

(assert (=> b!65330 m!59795))

(assert (=> b!65330 m!59795))

(assert (=> b!65330 m!60123))

(assert (=> b!64929 d!13679))

(declare-fun d!13681 () Bool)

(declare-fun e!42782 () Bool)

(assert (=> d!13681 e!42782))

(declare-fun res!35538 () Bool)

(assert (=> d!13681 (=> res!35538 e!42782)))

(declare-fun lt!28027 () Bool)

(assert (=> d!13681 (= res!35538 (not lt!28027))))

(declare-fun lt!28026 () Bool)

(assert (=> d!13681 (= lt!28027 lt!28026)))

(declare-fun lt!28024 () Unit!1776)

(declare-fun e!42781 () Unit!1776)

(assert (=> d!13681 (= lt!28024 e!42781)))

(declare-fun c!9002 () Bool)

(assert (=> d!13681 (= c!9002 lt!28026)))

(assert (=> d!13681 (= lt!28026 (containsKey!132 (toList!696 lt!27698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13681 (= (contains!694 lt!27698 #b0000000000000000000000000000000000000000000000000000000000000000) lt!28027)))

(declare-fun b!65331 () Bool)

(declare-fun lt!28025 () Unit!1776)

(assert (=> b!65331 (= e!42781 lt!28025)))

(assert (=> b!65331 (= lt!28025 (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 lt!27698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!65331 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!65332 () Bool)

(declare-fun Unit!1799 () Unit!1776)

(assert (=> b!65332 (= e!42781 Unit!1799)))

(declare-fun b!65333 () Bool)

(assert (=> b!65333 (= e!42782 (isDefined!81 (getValueByKey!129 (toList!696 lt!27698) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13681 c!9002) b!65331))

(assert (= (and d!13681 (not c!9002)) b!65332))

(assert (= (and d!13681 (not res!35538)) b!65333))

(declare-fun m!60125 () Bool)

(assert (=> d!13681 m!60125))

(declare-fun m!60127 () Bool)

(assert (=> b!65331 m!60127))

(declare-fun m!60129 () Bool)

(assert (=> b!65331 m!60129))

(assert (=> b!65331 m!60129))

(declare-fun m!60131 () Bool)

(assert (=> b!65331 m!60131))

(assert (=> b!65333 m!60129))

(assert (=> b!65333 m!60129))

(assert (=> b!65333 m!60131))

(assert (=> bm!5291 d!13681))

(assert (=> b!64831 d!13635))

(declare-fun d!13683 () Bool)

(assert (=> d!13683 (= (apply!70 lt!27698 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1106 (getValueByKey!129 (toList!696 lt!27698) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2843 () Bool)

(assert (= bs!2843 d!13683))

(assert (=> bs!2843 m!60129))

(assert (=> bs!2843 m!60129))

(declare-fun m!60133 () Bool)

(assert (=> bs!2843 m!60133))

(assert (=> b!64928 d!13683))

(declare-fun d!13685 () Bool)

(assert (=> d!13685 (isDefined!81 (getValueByKey!129 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun lt!28030 () Unit!1776)

(declare-fun choose!369 (List!1438 (_ BitVec 64)) Unit!1776)

(assert (=> d!13685 (= lt!28030 (choose!369 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(declare-fun e!42785 () Bool)

(assert (=> d!13685 e!42785))

(declare-fun res!35541 () Bool)

(assert (=> d!13685 (=> (not res!35541) (not e!42785))))

(declare-fun isStrictlySorted!275 (List!1438) Bool)

(assert (=> d!13685 (= res!35541 (isStrictlySorted!275 (toList!696 lt!27503)))))

(assert (=> d!13685 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!80 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)) lt!28030)))

(declare-fun b!65336 () Bool)

(assert (=> b!65336 (= e!42785 (containsKey!132 (toList!696 lt!27503) (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355)))))

(assert (= (and d!13685 res!35541) b!65336))

(assert (=> d!13685 m!59255))

(assert (=> d!13685 m!59405))

(assert (=> d!13685 m!59405))

(assert (=> d!13685 m!59407))

(assert (=> d!13685 m!59255))

(declare-fun m!60135 () Bool)

(assert (=> d!13685 m!60135))

(declare-fun m!60137 () Bool)

(assert (=> d!13685 m!60137))

(assert (=> b!65336 m!59255))

(assert (=> b!65336 m!59401))

(assert (=> b!64733 d!13685))

(assert (=> b!64733 d!13675))

(assert (=> b!64733 d!13677))

(declare-fun d!13687 () Bool)

(declare-fun e!42786 () Bool)

(assert (=> d!13687 e!42786))

(declare-fun res!35542 () Bool)

(assert (=> d!13687 (=> (not res!35542) (not e!42786))))

(declare-fun lt!28031 () ListLongMap!1361)

(assert (=> d!13687 (= res!35542 (contains!694 lt!28031 (_1!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!28033 () List!1438)

(assert (=> d!13687 (= lt!28031 (ListLongMap!1362 lt!28033))))

(declare-fun lt!28032 () Unit!1776)

(declare-fun lt!28034 () Unit!1776)

(assert (=> d!13687 (= lt!28032 lt!28034)))

(assert (=> d!13687 (= (getValueByKey!129 lt!28033 (_1!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!134 (_2!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13687 (= lt!28034 (lemmaContainsTupThenGetReturnValue!46 lt!28033 (_1!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13687 (= lt!28033 (insertStrictlySorted!49 (toList!696 e!42475) (_1!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13687 (= (+!84 e!42475 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!28031)))

(declare-fun b!65337 () Bool)

(declare-fun res!35543 () Bool)

(assert (=> b!65337 (=> (not res!35543) (not e!42786))))

(assert (=> b!65337 (= res!35543 (= (getValueByKey!129 (toList!696 lt!28031) (_1!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!134 (_2!1035 (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!65338 () Bool)

(assert (=> b!65338 (= e!42786 (contains!697 (toList!696 lt!28031) (ite c!8871 (ite c!8875 (tuple2!2049 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2049 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2049 (select (arr!1802 (_keys!3759 (v!2447 (underlying!239 thiss!992)))) from!355) (get!1102 (select (arr!1803 (_values!2104 (v!2447 (underlying!239 thiss!992)))) from!355) (dynLambda!312 (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13687 res!35542) b!65337))

(assert (= (and b!65337 res!35543) b!65338))

(declare-fun m!60139 () Bool)

(assert (=> d!13687 m!60139))

(declare-fun m!60141 () Bool)

(assert (=> d!13687 m!60141))

(declare-fun m!60143 () Bool)

(assert (=> d!13687 m!60143))

(declare-fun m!60145 () Bool)

(assert (=> d!13687 m!60145))

(declare-fun m!60147 () Bool)

(assert (=> b!65337 m!60147))

(declare-fun m!60149 () Bool)

(assert (=> b!65338 m!60149))

(assert (=> bm!5270 d!13687))

(declare-fun mapIsEmpty!3005 () Bool)

(declare-fun mapRes!3005 () Bool)

(assert (=> mapIsEmpty!3005 mapRes!3005))

(declare-fun b!65340 () Bool)

(declare-fun e!42787 () Bool)

(assert (=> b!65340 (= e!42787 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3005 () Bool)

(declare-fun tp!8225 () Bool)

(declare-fun e!42788 () Bool)

(assert (=> mapNonEmpty!3005 (= mapRes!3005 (and tp!8225 e!42788))))

(declare-fun mapRest!3005 () (Array (_ BitVec 32) ValueCell!869))

(declare-fun mapKey!3005 () (_ BitVec 32))

(declare-fun mapValue!3005 () ValueCell!869)

(assert (=> mapNonEmpty!3005 (= mapRest!3004 (store mapRest!3005 mapKey!3005 mapValue!3005))))

(declare-fun condMapEmpty!3005 () Bool)

(declare-fun mapDefault!3005 () ValueCell!869)

(assert (=> mapNonEmpty!3004 (= condMapEmpty!3005 (= mapRest!3004 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3005)))))

(assert (=> mapNonEmpty!3004 (= tp!8224 (and e!42787 mapRes!3005))))

(declare-fun b!65339 () Bool)

(assert (=> b!65339 (= e!42788 tp_is_empty!2425)))

(assert (= (and mapNonEmpty!3004 condMapEmpty!3005) mapIsEmpty!3005))

(assert (= (and mapNonEmpty!3004 (not condMapEmpty!3005)) mapNonEmpty!3005))

(assert (= (and mapNonEmpty!3005 ((_ is ValueCellFull!869) mapValue!3005)) b!65339))

(assert (= (and mapNonEmpty!3004 ((_ is ValueCellFull!869) mapDefault!3005)) b!65340))

(declare-fun m!60151 () Bool)

(assert (=> mapNonEmpty!3005 m!60151))

(declare-fun mapIsEmpty!3006 () Bool)

(declare-fun mapRes!3006 () Bool)

(assert (=> mapIsEmpty!3006 mapRes!3006))

(declare-fun b!65342 () Bool)

(declare-fun e!42789 () Bool)

(assert (=> b!65342 (= e!42789 tp_is_empty!2425)))

(declare-fun mapNonEmpty!3006 () Bool)

(declare-fun tp!8226 () Bool)

(declare-fun e!42790 () Bool)

(assert (=> mapNonEmpty!3006 (= mapRes!3006 (and tp!8226 e!42790))))

(declare-fun mapKey!3006 () (_ BitVec 32))

(declare-fun mapValue!3006 () ValueCell!869)

(declare-fun mapRest!3006 () (Array (_ BitVec 32) ValueCell!869))

(assert (=> mapNonEmpty!3006 (= mapRest!3003 (store mapRest!3006 mapKey!3006 mapValue!3006))))

(declare-fun condMapEmpty!3006 () Bool)

(declare-fun mapDefault!3006 () ValueCell!869)

(assert (=> mapNonEmpty!3003 (= condMapEmpty!3006 (= mapRest!3003 ((as const (Array (_ BitVec 32) ValueCell!869)) mapDefault!3006)))))

(assert (=> mapNonEmpty!3003 (= tp!8223 (and e!42789 mapRes!3006))))

(declare-fun b!65341 () Bool)

(assert (=> b!65341 (= e!42790 tp_is_empty!2425)))

(assert (= (and mapNonEmpty!3003 condMapEmpty!3006) mapIsEmpty!3006))

(assert (= (and mapNonEmpty!3003 (not condMapEmpty!3006)) mapNonEmpty!3006))

(assert (= (and mapNonEmpty!3006 ((_ is ValueCellFull!869) mapValue!3006)) b!65341))

(assert (= (and mapNonEmpty!3003 ((_ is ValueCellFull!869) mapDefault!3006)) b!65342))

(declare-fun m!60153 () Bool)

(assert (=> mapNonEmpty!3006 m!60153))

(declare-fun b_lambda!2929 () Bool)

(assert (= b_lambda!2927 (or (and b!64572 b_free!2017 (= (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64565 b_free!2019) b_lambda!2929)))

(declare-fun b_lambda!2931 () Bool)

(assert (= b_lambda!2919 (or (and b!64572 b_free!2017 (= (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64565 b_free!2019) b_lambda!2931)))

(declare-fun b_lambda!2933 () Bool)

(assert (= b_lambda!2921 (or (and b!64572 b_free!2017 (= (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))) (defaultEntry!2121 newMap!16))) (and b!64565 b_free!2019) b_lambda!2933)))

(declare-fun b_lambda!2935 () Bool)

(assert (= b_lambda!2925 (or (and b!64572 b_free!2017) (and b!64565 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))))) b_lambda!2935)))

(declare-fun b_lambda!2937 () Bool)

(assert (= b_lambda!2923 (or (and b!64572 b_free!2017) (and b!64565 b_free!2019 (= (defaultEntry!2121 newMap!16) (defaultEntry!2121 (v!2447 (underlying!239 thiss!992))))) b_lambda!2937)))

(check-sat (not b!65093) (not b!65249) b_and!4001 (not b!65158) (not b!64989) (not b!65179) (not d!13661) (not b!65131) (not b!65258) (not b!64987) (not bm!5352) (not b!65221) (not b!65160) (not b_lambda!2917) (not d!13679) (not d!13681) (not b!65336) b_and!4003 (not b!65279) (not b!65285) (not b!65057) (not d!13559) (not d!13633) (not b!64991) (not b_lambda!2935) (not d!13683) (not bm!5325) (not d!13687) (not b!65092) (not d!13571) (not d!13675) (not d!13561) (not b_next!2019) (not b!65256) (not d!13603) (not d!13567) (not b!64997) (not b!65039) (not bm!5313) (not d!13605) (not d!13599) (not b!65110) (not d!13619) (not b!65037) (not bm!5323) (not b!65331) (not b!65286) (not b!65328) (not b!65090) (not b!65232) (not b!65176) (not d!13635) (not d!13645) (not bm!5332) (not bm!5330) (not b!65185) (not b!64985) (not bm!5327) (not bm!5341) (not b!65075) (not d!13597) (not b!65079) (not bm!5338) (not b!65177) (not b!65268) (not d!13613) (not bm!5337) (not b!65218) (not b!65281) (not bm!5342) (not b!65333) (not b!65269) (not b!65121) (not d!13615) (not b!65289) (not b!65191) (not b!65161) (not b!65163) (not bm!5346) (not b!65127) (not bm!5351) (not b!65120) (not b!65234) (not b!65330) (not d!13609) (not d!13667) (not b!65251) (not b!65183) tp_is_empty!2425 (not d!13671) (not b!65237) (not b!65122) (not d!13591) (not d!13601) (not b!65086) (not b!65129) (not b!65231) (not b!65061) (not b_lambda!2913) (not b!65165) (not b!65112) (not b!65178) (not b_lambda!2931) (not b!65291) (not d!13629) (not bm!5339) (not b!65264) (not b!65235) (not b!65157) (not d!13565) (not b!65109) (not b!65096) (not d!13611) (not b!65225) (not b!65338) (not b!65125) (not b!65197) (not b!65181) (not d!13579) (not d!13625) (not b_lambda!2933) (not b!65105) (not d!13593) (not b!65217) (not b!65219) (not d!13573) (not b!65066) (not b!65132) (not b!65062) (not d!13673) (not d!13595) (not d!13665) (not b!65088) (not bm!5344) (not b!65040) (not b!65326) (not d!13607) (not d!13617) (not d!13621) (not b!65253) (not b!65166) (not b!65073) (not d!13551) (not b!65272) (not b!65167) (not b!65089) (not bm!5328) (not d!13685) (not bm!5318) (not b!65123) (not b!65267) (not d!13555) (not d!13623) (not d!13655) (not b!65214) (not b!65087) (not b!65128) (not d!13575) (not mapNonEmpty!3005) (not b!65228) (not b!65184) (not d!13647) (not b!65248) (not d!13549) (not b!65114) (not mapNonEmpty!3006) (not bm!5303) (not b!65045) (not bm!5312) (not b!65038) (not b!65260) (not bm!5333) (not b!65182) (not b!65337) (not d!13585) (not b!65033) (not b!65080) (not b!65175) (not b!65103) (not bm!5320) (not b!65063) (not bm!5321) (not b_lambda!2929) (not d!13637) (not d!13589) (not b!65223) (not bm!5336) (not b_lambda!2937) (not b!65091) (not b_next!2017) (not b!65255) (not b!65130) (not d!13651) (not d!13643) (not bm!5314) (not d!13553))
(check-sat b_and!4001 b_and!4003 (not b_next!2017) (not b_next!2019))
