; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11114 () Bool)

(assert start!11114)

(declare-fun b!90979 () Bool)

(declare-fun b_free!2321 () Bool)

(declare-fun b_next!2321 () Bool)

(assert (=> b!90979 (= b_free!2321 (not b_next!2321))))

(declare-fun tp!9211 () Bool)

(declare-fun b_and!5507 () Bool)

(assert (=> b!90979 (= tp!9211 b_and!5507)))

(declare-fun b!90976 () Bool)

(declare-fun b_free!2323 () Bool)

(declare-fun b_next!2323 () Bool)

(assert (=> b!90976 (= b_free!2323 (not b_next!2323))))

(declare-fun tp!9212 () Bool)

(declare-fun b_and!5509 () Bool)

(assert (=> b!90976 (= tp!9212 b_and!5509)))

(declare-fun b!90960 () Bool)

(declare-fun e!59330 () Bool)

(declare-fun tp_is_empty!2577 () Bool)

(assert (=> b!90960 (= e!59330 tp_is_empty!2577)))

(declare-fun b!90961 () Bool)

(declare-fun e!59329 () Bool)

(declare-datatypes ((V!3083 0))(
  ( (V!3084 (val!1333 Int)) )
))
(declare-datatypes ((array!4121 0))(
  ( (array!4122 (arr!1961 (Array (_ BitVec 32) (_ BitVec 64))) (size!2208 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!945 0))(
  ( (ValueCellFull!945 (v!2712 V!3083)) (EmptyCell!945) )
))
(declare-datatypes ((array!4123 0))(
  ( (array!4124 (arr!1962 (Array (_ BitVec 32) ValueCell!945)) (size!2209 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!798 0))(
  ( (LongMapFixedSize!799 (defaultEntry!2400 Int) (mask!6458 (_ BitVec 32)) (extraKeys!2231 (_ BitVec 32)) (zeroValue!2288 V!3083) (minValue!2288 V!3083) (_size!448 (_ BitVec 32)) (_keys!4080 array!4121) (_values!2383 array!4123) (_vacant!448 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2254 0))(
  ( (tuple2!2255 (_1!1138 Bool) (_2!1138 LongMapFixedSize!798)) )
))
(declare-fun lt!44228 () tuple2!2254)

(declare-fun valid!349 (LongMapFixedSize!798) Bool)

(assert (=> b!90961 (= e!59329 (valid!349 (_2!1138 lt!44228)))))

(declare-fun b!90962 () Bool)

(declare-datatypes ((Unit!2706 0))(
  ( (Unit!2707) )
))
(declare-fun e!59339 () Unit!2706)

(declare-fun Unit!2708 () Unit!2706)

(assert (=> b!90962 (= e!59339 Unit!2708)))

(declare-fun lt!44225 () Unit!2706)

(declare-datatypes ((Cell!598 0))(
  ( (Cell!599 (v!2713 LongMapFixedSize!798)) )
))
(declare-datatypes ((LongMap!598 0))(
  ( (LongMap!599 (underlying!310 Cell!598)) )
))
(declare-fun thiss!992 () LongMap!598)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!77 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 64) (_ BitVec 32) Int) Unit!2706)

(assert (=> b!90962 (= lt!44225 (lemmaListMapContainsThenArrayContainsFrom!77 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90962 (arrayContainsKey!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44236 () Unit!2706)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4121 (_ BitVec 32) (_ BitVec 32)) Unit!2706)

(assert (=> b!90962 (= lt!44236 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1547 0))(
  ( (Nil!1544) (Cons!1543 (h!2135 (_ BitVec 64)) (t!5369 List!1547)) )
))
(declare-fun arrayNoDuplicates!0 (array!4121 (_ BitVec 32) List!1547) Bool)

(assert (=> b!90962 (arrayNoDuplicates!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) from!355 Nil!1544)))

(declare-fun lt!44239 () Unit!2706)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4121 (_ BitVec 32) (_ BitVec 64) List!1547) Unit!2706)

(assert (=> b!90962 (= lt!44239 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (Cons!1543 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) Nil!1544)))))

(assert (=> b!90962 false))

(declare-fun b!90963 () Bool)

(declare-fun e!59338 () Bool)

(declare-fun e!59335 () Bool)

(assert (=> b!90963 (= e!59338 e!59335)))

(declare-fun b!90964 () Bool)

(declare-fun e!59333 () Bool)

(assert (=> b!90964 (= e!59333 (not e!59329))))

(declare-fun res!46361 () Bool)

(assert (=> b!90964 (=> res!46361 e!59329)))

(declare-datatypes ((tuple2!2256 0))(
  ( (tuple2!2257 (_1!1139 (_ BitVec 64)) (_2!1139 V!3083)) )
))
(declare-datatypes ((List!1548 0))(
  ( (Nil!1545) (Cons!1544 (h!2136 tuple2!2256) (t!5370 List!1548)) )
))
(declare-datatypes ((ListLongMap!1493 0))(
  ( (ListLongMap!1494 (toList!762 List!1548)) )
))
(declare-fun getCurrentListMap!454 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 32) Int) ListLongMap!1493)

(declare-fun map!1217 (LongMapFixedSize!798) ListLongMap!1493)

(assert (=> b!90964 (= res!46361 (not (= (getCurrentListMap!454 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) (map!1217 (_2!1138 lt!44228)))))))

(declare-fun lt!44235 () ListLongMap!1493)

(declare-fun lt!44232 () tuple2!2256)

(declare-fun lt!44226 () tuple2!2256)

(declare-fun lt!44238 () ListLongMap!1493)

(declare-fun +!124 (ListLongMap!1493 tuple2!2256) ListLongMap!1493)

(assert (=> b!90964 (= (+!124 lt!44238 lt!44232) (+!124 (+!124 lt!44235 lt!44232) lt!44226))))

(assert (=> b!90964 (= lt!44232 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44241 () Unit!2706)

(declare-fun lt!44233 () V!3083)

(declare-fun addCommutativeForDiffKeys!43 (ListLongMap!1493 (_ BitVec 64) V!3083 (_ BitVec 64) V!3083) Unit!2706)

(assert (=> b!90964 (= lt!44241 (addCommutativeForDiffKeys!43 lt!44235 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44240 () ListLongMap!1493)

(assert (=> b!90964 (= lt!44240 lt!44238)))

(assert (=> b!90964 (= lt!44238 (+!124 lt!44235 lt!44226))))

(declare-fun lt!44229 () ListLongMap!1493)

(declare-fun lt!44234 () tuple2!2256)

(assert (=> b!90964 (= lt!44240 (+!124 lt!44229 lt!44234))))

(declare-fun lt!44231 () ListLongMap!1493)

(assert (=> b!90964 (= lt!44235 (+!124 lt!44231 lt!44234))))

(assert (=> b!90964 (= lt!44234 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(assert (=> b!90964 (= lt!44229 (+!124 lt!44231 lt!44226))))

(assert (=> b!90964 (= lt!44226 (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233))))

(declare-fun lt!44224 () Unit!2706)

(assert (=> b!90964 (= lt!44224 (addCommutativeForDiffKeys!43 lt!44231 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!89 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 32) Int) ListLongMap!1493)

(assert (=> b!90964 (= lt!44231 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!90965 () Bool)

(declare-fun e!59336 () Bool)

(assert (=> b!90965 (= e!59336 e!59333)))

(declare-fun res!46357 () Bool)

(assert (=> b!90965 (=> (not res!46357) (not e!59333))))

(assert (=> b!90965 (= res!46357 (and (_1!1138 lt!44228) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44230 () Unit!2706)

(assert (=> b!90965 (= lt!44230 e!59339)))

(declare-fun c!15086 () Bool)

(declare-fun lt!44227 () ListLongMap!1493)

(declare-fun contains!773 (ListLongMap!1493 (_ BitVec 64)) Bool)

(assert (=> b!90965 (= c!15086 (contains!773 lt!44227 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!798)

(declare-fun update!124 (LongMapFixedSize!798 (_ BitVec 64) V!3083) tuple2!2254)

(assert (=> b!90965 (= lt!44228 (update!124 newMap!16 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233))))

(declare-fun b!90966 () Bool)

(declare-fun e!59331 () Bool)

(assert (=> b!90966 (= e!59331 tp_is_empty!2577)))

(declare-fun b!90967 () Bool)

(declare-fun e!59326 () Bool)

(assert (=> b!90967 (= e!59326 e!59336)))

(declare-fun res!46365 () Bool)

(assert (=> b!90967 (=> (not res!46365) (not e!59336))))

(assert (=> b!90967 (= res!46365 (and (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1232 (ValueCell!945 V!3083) V!3083)

(declare-fun dynLambda!353 (Int (_ BitVec 64)) V!3083)

(assert (=> b!90967 (= lt!44233 (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90968 () Bool)

(declare-fun res!46358 () Bool)

(declare-fun e!59325 () Bool)

(assert (=> b!90968 (=> (not res!46358) (not e!59325))))

(assert (=> b!90968 (= res!46358 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992)))))))))

(declare-fun b!90969 () Bool)

(declare-fun e!59328 () Bool)

(declare-fun mapRes!3550 () Bool)

(assert (=> b!90969 (= e!59328 (and e!59330 mapRes!3550))))

(declare-fun condMapEmpty!3549 () Bool)

(declare-fun mapDefault!3550 () ValueCell!945)

(assert (=> b!90969 (= condMapEmpty!3549 (= (arr!1962 (_values!2383 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!945)) mapDefault!3550)))))

(declare-fun mapIsEmpty!3549 () Bool)

(assert (=> mapIsEmpty!3549 mapRes!3550))

(declare-fun b!90970 () Bool)

(declare-fun e!59334 () Bool)

(assert (=> b!90970 (= e!59334 e!59338)))

(declare-fun b!90971 () Bool)

(declare-fun Unit!2709 () Unit!2706)

(assert (=> b!90971 (= e!59339 Unit!2709)))

(declare-fun mapIsEmpty!3550 () Bool)

(declare-fun mapRes!3549 () Bool)

(assert (=> mapIsEmpty!3550 mapRes!3549))

(declare-fun b!90972 () Bool)

(declare-fun e!59342 () Bool)

(assert (=> b!90972 (= e!59342 tp_is_empty!2577)))

(declare-fun b!90973 () Bool)

(declare-fun res!46362 () Bool)

(assert (=> b!90973 (=> res!46362 e!59329)))

(assert (=> b!90973 (= res!46362 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!90974 () Bool)

(declare-fun res!46363 () Bool)

(assert (=> b!90974 (=> (not res!46363) (not e!59325))))

(assert (=> b!90974 (= res!46363 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6458 newMap!16)) (_size!448 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!90975 () Bool)

(declare-fun res!46364 () Bool)

(assert (=> b!90975 (=> (not res!46364) (not e!59325))))

(assert (=> b!90975 (= res!46364 (valid!349 newMap!16))))

(declare-fun res!46360 () Bool)

(assert (=> start!11114 (=> (not res!46360) (not e!59325))))

(declare-fun valid!350 (LongMap!598) Bool)

(assert (=> start!11114 (= res!46360 (valid!350 thiss!992))))

(assert (=> start!11114 e!59325))

(assert (=> start!11114 e!59334))

(assert (=> start!11114 true))

(declare-fun e!59340 () Bool)

(assert (=> start!11114 e!59340))

(declare-fun array_inv!1215 (array!4121) Bool)

(declare-fun array_inv!1216 (array!4123) Bool)

(assert (=> b!90976 (= e!59340 (and tp!9212 tp_is_empty!2577 (array_inv!1215 (_keys!4080 newMap!16)) (array_inv!1216 (_values!2383 newMap!16)) e!59328))))

(declare-fun mapNonEmpty!3549 () Bool)

(declare-fun tp!9213 () Bool)

(assert (=> mapNonEmpty!3549 (= mapRes!3549 (and tp!9213 e!59331))))

(declare-fun mapValue!3549 () ValueCell!945)

(declare-fun mapKey!3550 () (_ BitVec 32))

(declare-fun mapRest!3549 () (Array (_ BitVec 32) ValueCell!945))

(assert (=> mapNonEmpty!3549 (= (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (store mapRest!3549 mapKey!3550 mapValue!3549))))

(declare-fun mapNonEmpty!3550 () Bool)

(declare-fun tp!9214 () Bool)

(declare-fun e!59341 () Bool)

(assert (=> mapNonEmpty!3550 (= mapRes!3550 (and tp!9214 e!59341))))

(declare-fun mapRest!3550 () (Array (_ BitVec 32) ValueCell!945))

(declare-fun mapKey!3549 () (_ BitVec 32))

(declare-fun mapValue!3550 () ValueCell!945)

(assert (=> mapNonEmpty!3550 (= (arr!1962 (_values!2383 newMap!16)) (store mapRest!3550 mapKey!3549 mapValue!3550))))

(declare-fun b!90977 () Bool)

(assert (=> b!90977 (= e!59341 tp_is_empty!2577)))

(declare-fun b!90978 () Bool)

(assert (=> b!90978 (= e!59325 e!59326)))

(declare-fun res!46359 () Bool)

(assert (=> b!90978 (=> (not res!46359) (not e!59326))))

(declare-fun lt!44237 () ListLongMap!1493)

(assert (=> b!90978 (= res!46359 (= lt!44237 lt!44227))))

(assert (=> b!90978 (= lt!44227 (map!1217 newMap!16))))

(assert (=> b!90978 (= lt!44237 (getCurrentListMap!454 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun e!59327 () Bool)

(assert (=> b!90979 (= e!59335 (and tp!9211 tp_is_empty!2577 (array_inv!1215 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (array_inv!1216 (_values!2383 (v!2713 (underlying!310 thiss!992)))) e!59327))))

(declare-fun b!90980 () Bool)

(assert (=> b!90980 (= e!59327 (and e!59342 mapRes!3549))))

(declare-fun condMapEmpty!3550 () Bool)

(declare-fun mapDefault!3549 () ValueCell!945)

(assert (=> b!90980 (= condMapEmpty!3550 (= (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!945)) mapDefault!3549)))))

(assert (= (and start!11114 res!46360) b!90968))

(assert (= (and b!90968 res!46358) b!90975))

(assert (= (and b!90975 res!46364) b!90974))

(assert (= (and b!90974 res!46363) b!90978))

(assert (= (and b!90978 res!46359) b!90967))

(assert (= (and b!90967 res!46365) b!90965))

(assert (= (and b!90965 c!15086) b!90962))

(assert (= (and b!90965 (not c!15086)) b!90971))

(assert (= (and b!90965 res!46357) b!90964))

(assert (= (and b!90964 (not res!46361)) b!90973))

(assert (= (and b!90973 (not res!46362)) b!90961))

(assert (= (and b!90980 condMapEmpty!3550) mapIsEmpty!3550))

(assert (= (and b!90980 (not condMapEmpty!3550)) mapNonEmpty!3549))

(get-info :version)

(assert (= (and mapNonEmpty!3549 ((_ is ValueCellFull!945) mapValue!3549)) b!90966))

(assert (= (and b!90980 ((_ is ValueCellFull!945) mapDefault!3549)) b!90972))

(assert (= b!90979 b!90980))

(assert (= b!90963 b!90979))

(assert (= b!90970 b!90963))

(assert (= start!11114 b!90970))

(assert (= (and b!90969 condMapEmpty!3549) mapIsEmpty!3549))

(assert (= (and b!90969 (not condMapEmpty!3549)) mapNonEmpty!3550))

(assert (= (and mapNonEmpty!3550 ((_ is ValueCellFull!945) mapValue!3550)) b!90977))

(assert (= (and b!90969 ((_ is ValueCellFull!945) mapDefault!3550)) b!90960))

(assert (= b!90976 b!90969))

(assert (= start!11114 b!90976))

(declare-fun b_lambda!4013 () Bool)

(assert (=> (not b_lambda!4013) (not b!90967)))

(declare-fun t!5366 () Bool)

(declare-fun tb!1789 () Bool)

(assert (=> (and b!90979 (= (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) t!5366) tb!1789))

(declare-fun result!3063 () Bool)

(assert (=> tb!1789 (= result!3063 tp_is_empty!2577)))

(assert (=> b!90967 t!5366))

(declare-fun b_and!5511 () Bool)

(assert (= b_and!5507 (and (=> t!5366 result!3063) b_and!5511)))

(declare-fun t!5368 () Bool)

(declare-fun tb!1791 () Bool)

(assert (=> (and b!90976 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) t!5368) tb!1791))

(declare-fun result!3067 () Bool)

(assert (= result!3067 result!3063))

(assert (=> b!90967 t!5368))

(declare-fun b_and!5513 () Bool)

(assert (= b_and!5509 (and (=> t!5368 result!3067) b_and!5513)))

(declare-fun m!97767 () Bool)

(assert (=> b!90962 m!97767))

(declare-fun m!97769 () Bool)

(assert (=> b!90962 m!97769))

(declare-fun m!97771 () Bool)

(assert (=> b!90962 m!97771))

(declare-fun m!97773 () Bool)

(assert (=> b!90962 m!97773))

(assert (=> b!90962 m!97771))

(assert (=> b!90962 m!97771))

(declare-fun m!97775 () Bool)

(assert (=> b!90962 m!97775))

(assert (=> b!90962 m!97771))

(declare-fun m!97777 () Bool)

(assert (=> b!90962 m!97777))

(declare-fun m!97779 () Bool)

(assert (=> start!11114 m!97779))

(declare-fun m!97781 () Bool)

(assert (=> b!90976 m!97781))

(declare-fun m!97783 () Bool)

(assert (=> b!90976 m!97783))

(declare-fun m!97785 () Bool)

(assert (=> b!90978 m!97785))

(declare-fun m!97787 () Bool)

(assert (=> b!90978 m!97787))

(declare-fun m!97789 () Bool)

(assert (=> mapNonEmpty!3549 m!97789))

(declare-fun m!97791 () Bool)

(assert (=> b!90975 m!97791))

(declare-fun m!97793 () Bool)

(assert (=> b!90979 m!97793))

(declare-fun m!97795 () Bool)

(assert (=> b!90979 m!97795))

(declare-fun m!97797 () Bool)

(assert (=> b!90964 m!97797))

(declare-fun m!97799 () Bool)

(assert (=> b!90964 m!97799))

(declare-fun m!97801 () Bool)

(assert (=> b!90964 m!97801))

(assert (=> b!90964 m!97771))

(assert (=> b!90964 m!97771))

(declare-fun m!97803 () Bool)

(assert (=> b!90964 m!97803))

(declare-fun m!97805 () Bool)

(assert (=> b!90964 m!97805))

(declare-fun m!97807 () Bool)

(assert (=> b!90964 m!97807))

(declare-fun m!97809 () Bool)

(assert (=> b!90964 m!97809))

(declare-fun m!97811 () Bool)

(assert (=> b!90964 m!97811))

(declare-fun m!97813 () Bool)

(assert (=> b!90964 m!97813))

(declare-fun m!97815 () Bool)

(assert (=> b!90964 m!97815))

(assert (=> b!90964 m!97771))

(declare-fun m!97817 () Bool)

(assert (=> b!90964 m!97817))

(assert (=> b!90964 m!97797))

(declare-fun m!97819 () Bool)

(assert (=> b!90964 m!97819))

(assert (=> b!90967 m!97771))

(declare-fun m!97821 () Bool)

(assert (=> b!90967 m!97821))

(declare-fun m!97823 () Bool)

(assert (=> b!90967 m!97823))

(assert (=> b!90967 m!97821))

(assert (=> b!90967 m!97823))

(declare-fun m!97825 () Bool)

(assert (=> b!90967 m!97825))

(assert (=> b!90965 m!97771))

(assert (=> b!90965 m!97771))

(declare-fun m!97827 () Bool)

(assert (=> b!90965 m!97827))

(assert (=> b!90965 m!97771))

(declare-fun m!97829 () Bool)

(assert (=> b!90965 m!97829))

(declare-fun m!97831 () Bool)

(assert (=> mapNonEmpty!3550 m!97831))

(declare-fun m!97833 () Bool)

(assert (=> b!90961 m!97833))

(check-sat (not mapNonEmpty!3550) (not mapNonEmpty!3549) (not b_next!2323) (not b!90978) (not b!90967) (not b_lambda!4013) tp_is_empty!2577 (not b!90962) (not b!90979) (not b!90975) (not start!11114) (not b!90961) (not b_next!2321) b_and!5513 (not b!90964) (not b!90976) (not b!90965) b_and!5511)
(check-sat b_and!5511 b_and!5513 (not b_next!2321) (not b_next!2323))
(get-model)

(declare-fun b_lambda!4017 () Bool)

(assert (= b_lambda!4013 (or (and b!90979 b_free!2321) (and b!90976 b_free!2323 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))) b_lambda!4017)))

(check-sat (not mapNonEmpty!3550) (not mapNonEmpty!3549) (not b_next!2323) (not b!90978) (not b!90967) tp_is_empty!2577 (not b!90962) (not b!90975) (not start!11114) (not b!90961) (not b_next!2321) b_and!5513 (not b!90964) (not b!90979) (not b_lambda!4017) (not b!90976) (not b!90965) b_and!5511)
(check-sat b_and!5511 b_and!5513 (not b_next!2321) (not b_next!2323))
(get-model)

(declare-fun d!24053 () Bool)

(declare-fun res!46399 () Bool)

(declare-fun e!59399 () Bool)

(assert (=> d!24053 (=> (not res!46399) (not e!59399))))

(declare-fun simpleValid!62 (LongMapFixedSize!798) Bool)

(assert (=> d!24053 (= res!46399 (simpleValid!62 newMap!16))))

(assert (=> d!24053 (= (valid!349 newMap!16) e!59399)))

(declare-fun b!91054 () Bool)

(declare-fun res!46400 () Bool)

(assert (=> b!91054 (=> (not res!46400) (not e!59399))))

(declare-fun arrayCountValidKeys!0 (array!4121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91054 (= res!46400 (= (arrayCountValidKeys!0 (_keys!4080 newMap!16) #b00000000000000000000000000000000 (size!2208 (_keys!4080 newMap!16))) (_size!448 newMap!16)))))

(declare-fun b!91055 () Bool)

(declare-fun res!46401 () Bool)

(assert (=> b!91055 (=> (not res!46401) (not e!59399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4121 (_ BitVec 32)) Bool)

(assert (=> b!91055 (= res!46401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4080 newMap!16) (mask!6458 newMap!16)))))

(declare-fun b!91056 () Bool)

(assert (=> b!91056 (= e!59399 (arrayNoDuplicates!0 (_keys!4080 newMap!16) #b00000000000000000000000000000000 Nil!1544))))

(assert (= (and d!24053 res!46399) b!91054))

(assert (= (and b!91054 res!46400) b!91055))

(assert (= (and b!91055 res!46401) b!91056))

(declare-fun m!97903 () Bool)

(assert (=> d!24053 m!97903))

(declare-fun m!97905 () Bool)

(assert (=> b!91054 m!97905))

(declare-fun m!97907 () Bool)

(assert (=> b!91055 m!97907))

(declare-fun m!97909 () Bool)

(assert (=> b!91056 m!97909))

(assert (=> b!90975 d!24053))

(declare-fun d!24055 () Bool)

(declare-fun res!46402 () Bool)

(declare-fun e!59400 () Bool)

(assert (=> d!24055 (=> (not res!46402) (not e!59400))))

(assert (=> d!24055 (= res!46402 (simpleValid!62 (_2!1138 lt!44228)))))

(assert (=> d!24055 (= (valid!349 (_2!1138 lt!44228)) e!59400)))

(declare-fun b!91057 () Bool)

(declare-fun res!46403 () Bool)

(assert (=> b!91057 (=> (not res!46403) (not e!59400))))

(assert (=> b!91057 (= res!46403 (= (arrayCountValidKeys!0 (_keys!4080 (_2!1138 lt!44228)) #b00000000000000000000000000000000 (size!2208 (_keys!4080 (_2!1138 lt!44228)))) (_size!448 (_2!1138 lt!44228))))))

(declare-fun b!91058 () Bool)

(declare-fun res!46404 () Bool)

(assert (=> b!91058 (=> (not res!46404) (not e!59400))))

(assert (=> b!91058 (= res!46404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4080 (_2!1138 lt!44228)) (mask!6458 (_2!1138 lt!44228))))))

(declare-fun b!91059 () Bool)

(assert (=> b!91059 (= e!59400 (arrayNoDuplicates!0 (_keys!4080 (_2!1138 lt!44228)) #b00000000000000000000000000000000 Nil!1544))))

(assert (= (and d!24055 res!46402) b!91057))

(assert (= (and b!91057 res!46403) b!91058))

(assert (= (and b!91058 res!46404) b!91059))

(declare-fun m!97911 () Bool)

(assert (=> d!24055 m!97911))

(declare-fun m!97913 () Bool)

(assert (=> b!91057 m!97913))

(declare-fun m!97915 () Bool)

(assert (=> b!91058 m!97915))

(declare-fun m!97917 () Bool)

(assert (=> b!91059 m!97917))

(assert (=> b!90961 d!24055))

(declare-fun d!24057 () Bool)

(assert (=> d!24057 (= (valid!350 thiss!992) (valid!349 (v!2713 (underlying!310 thiss!992))))))

(declare-fun bs!3795 () Bool)

(assert (= bs!3795 d!24057))

(declare-fun m!97919 () Bool)

(assert (=> bs!3795 m!97919))

(assert (=> start!11114 d!24057))

(declare-fun d!24059 () Bool)

(assert (=> d!24059 (= (map!1217 newMap!16) (getCurrentListMap!454 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2400 newMap!16)))))

(declare-fun bs!3796 () Bool)

(assert (= bs!3796 d!24059))

(declare-fun m!97921 () Bool)

(assert (=> bs!3796 m!97921))

(assert (=> b!90978 d!24059))

(declare-fun b!91102 () Bool)

(declare-fun e!59432 () Bool)

(declare-fun call!8846 () Bool)

(assert (=> b!91102 (= e!59432 (not call!8846))))

(declare-fun bm!8839 () Bool)

(declare-fun call!8848 () ListLongMap!1493)

(declare-fun call!8842 () ListLongMap!1493)

(assert (=> bm!8839 (= call!8848 call!8842)))

(declare-fun b!91103 () Bool)

(declare-fun e!59431 () Bool)

(declare-fun lt!44343 () ListLongMap!1493)

(declare-fun apply!86 (ListLongMap!1493 (_ BitVec 64)) V!3083)

(assert (=> b!91103 (= e!59431 (= (apply!86 lt!44343 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun d!24061 () Bool)

(declare-fun e!59434 () Bool)

(assert (=> d!24061 e!59434))

(declare-fun res!46426 () Bool)

(assert (=> d!24061 (=> (not res!46426) (not e!59434))))

(assert (=> d!24061 (= res!46426 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))))

(declare-fun lt!44351 () ListLongMap!1493)

(assert (=> d!24061 (= lt!44343 lt!44351)))

(declare-fun lt!44341 () Unit!2706)

(declare-fun e!59429 () Unit!2706)

(assert (=> d!24061 (= lt!44341 e!59429)))

(declare-fun c!15106 () Bool)

(declare-fun e!59439 () Bool)

(assert (=> d!24061 (= c!15106 e!59439)))

(declare-fun res!46424 () Bool)

(assert (=> d!24061 (=> (not res!46424) (not e!59439))))

(assert (=> d!24061 (= res!46424 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun e!59435 () ListLongMap!1493)

(assert (=> d!24061 (= lt!44351 e!59435)))

(declare-fun c!15103 () Bool)

(assert (=> d!24061 (= c!15103 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24061 (validMask!0 (mask!6458 (v!2713 (underlying!310 thiss!992))))))

(assert (=> d!24061 (= (getCurrentListMap!454 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) lt!44343)))

(declare-fun b!91104 () Bool)

(declare-fun res!46430 () Bool)

(assert (=> b!91104 (=> (not res!46430) (not e!59434))))

(assert (=> b!91104 (= res!46430 e!59432)))

(declare-fun c!15102 () Bool)

(assert (=> b!91104 (= c!15102 (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91105 () Bool)

(declare-fun e!59427 () Bool)

(assert (=> b!91105 (= e!59427 (= (apply!86 lt!44343 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!91106 () Bool)

(declare-fun e!59436 () ListLongMap!1493)

(assert (=> b!91106 (= e!59435 e!59436)))

(declare-fun c!15104 () Bool)

(assert (=> b!91106 (= c!15104 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91107 () Bool)

(declare-fun e!59437 () ListLongMap!1493)

(declare-fun call!8843 () ListLongMap!1493)

(assert (=> b!91107 (= e!59437 call!8843)))

(declare-fun e!59430 () Bool)

(declare-fun b!91108 () Bool)

(assert (=> b!91108 (= e!59430 (= (apply!86 lt!44343 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91108 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2209 (_values!2383 (v!2713 (underlying!310 thiss!992))))))))

(assert (=> b!91108 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91109 () Bool)

(assert (=> b!91109 (= e!59432 e!59431)))

(declare-fun res!46423 () Bool)

(assert (=> b!91109 (= res!46423 call!8846)))

(assert (=> b!91109 (=> (not res!46423) (not e!59431))))

(declare-fun bm!8840 () Bool)

(declare-fun call!8847 () ListLongMap!1493)

(assert (=> bm!8840 (= call!8843 call!8847)))

(declare-fun b!91110 () Bool)

(declare-fun lt!44360 () Unit!2706)

(assert (=> b!91110 (= e!59429 lt!44360)))

(declare-fun lt!44344 () ListLongMap!1493)

(assert (=> b!91110 (= lt!44344 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44354 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44352 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44352 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44355 () Unit!2706)

(declare-fun addStillContains!62 (ListLongMap!1493 (_ BitVec 64) V!3083 (_ BitVec 64)) Unit!2706)

(assert (=> b!91110 (= lt!44355 (addStillContains!62 lt!44344 lt!44354 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44352))))

(assert (=> b!91110 (contains!773 (+!124 lt!44344 (tuple2!2257 lt!44354 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44352)))

(declare-fun lt!44349 () Unit!2706)

(assert (=> b!91110 (= lt!44349 lt!44355)))

(declare-fun lt!44347 () ListLongMap!1493)

(assert (=> b!91110 (= lt!44347 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44353 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44353 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44340 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44340 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44357 () Unit!2706)

(declare-fun addApplyDifferent!62 (ListLongMap!1493 (_ BitVec 64) V!3083 (_ BitVec 64)) Unit!2706)

(assert (=> b!91110 (= lt!44357 (addApplyDifferent!62 lt!44347 lt!44353 (minValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44340))))

(assert (=> b!91110 (= (apply!86 (+!124 lt!44347 (tuple2!2257 lt!44353 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44340) (apply!86 lt!44347 lt!44340))))

(declare-fun lt!44358 () Unit!2706)

(assert (=> b!91110 (= lt!44358 lt!44357)))

(declare-fun lt!44356 () ListLongMap!1493)

(assert (=> b!91110 (= lt!44356 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44342 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44342 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44359 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44359 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44346 () Unit!2706)

(assert (=> b!91110 (= lt!44346 (addApplyDifferent!62 lt!44356 lt!44342 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44359))))

(assert (=> b!91110 (= (apply!86 (+!124 lt!44356 (tuple2!2257 lt!44342 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44359) (apply!86 lt!44356 lt!44359))))

(declare-fun lt!44361 () Unit!2706)

(assert (=> b!91110 (= lt!44361 lt!44346)))

(declare-fun lt!44348 () ListLongMap!1493)

(assert (=> b!91110 (= lt!44348 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44345 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44350 () (_ BitVec 64))

(assert (=> b!91110 (= lt!44350 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91110 (= lt!44360 (addApplyDifferent!62 lt!44348 lt!44345 (minValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44350))))

(assert (=> b!91110 (= (apply!86 (+!124 lt!44348 (tuple2!2257 lt!44345 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44350) (apply!86 lt!44348 lt!44350))))

(declare-fun b!91111 () Bool)

(declare-fun e!59428 () Bool)

(declare-fun call!8845 () Bool)

(assert (=> b!91111 (= e!59428 (not call!8845))))

(declare-fun bm!8841 () Bool)

(declare-fun call!8844 () ListLongMap!1493)

(assert (=> bm!8841 (= call!8844 call!8848)))

(declare-fun bm!8842 () Bool)

(assert (=> bm!8842 (= call!8842 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!91112 () Bool)

(assert (=> b!91112 (= e!59434 e!59428)))

(declare-fun c!15107 () Bool)

(assert (=> b!91112 (= c!15107 (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91113 () Bool)

(declare-fun c!15105 () Bool)

(assert (=> b!91113 (= c!15105 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91113 (= e!59436 e!59437)))

(declare-fun b!91114 () Bool)

(assert (=> b!91114 (= e!59437 call!8844)))

(declare-fun b!91115 () Bool)

(declare-fun Unit!2712 () Unit!2706)

(assert (=> b!91115 (= e!59429 Unit!2712)))

(declare-fun b!91116 () Bool)

(declare-fun e!59438 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!91116 (= e!59438 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8843 () Bool)

(assert (=> bm!8843 (= call!8847 (+!124 (ite c!15103 call!8842 (ite c!15104 call!8848 call!8844)) (ite (or c!15103 c!15104) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))))

(declare-fun bm!8844 () Bool)

(assert (=> bm!8844 (= call!8845 (contains!773 lt!44343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91117 () Bool)

(assert (=> b!91117 (= e!59428 e!59427)))

(declare-fun res!46431 () Bool)

(assert (=> b!91117 (= res!46431 call!8845)))

(assert (=> b!91117 (=> (not res!46431) (not e!59427))))

(declare-fun b!91118 () Bool)

(assert (=> b!91118 (= e!59439 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8845 () Bool)

(assert (=> bm!8845 (= call!8846 (contains!773 lt!44343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91119 () Bool)

(assert (=> b!91119 (= e!59435 (+!124 call!8847 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91120 () Bool)

(assert (=> b!91120 (= e!59436 call!8843)))

(declare-fun b!91121 () Bool)

(declare-fun e!59433 () Bool)

(assert (=> b!91121 (= e!59433 e!59430)))

(declare-fun res!46427 () Bool)

(assert (=> b!91121 (=> (not res!46427) (not e!59430))))

(assert (=> b!91121 (= res!46427 (contains!773 lt!44343 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91121 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91122 () Bool)

(declare-fun res!46425 () Bool)

(assert (=> b!91122 (=> (not res!46425) (not e!59434))))

(assert (=> b!91122 (= res!46425 e!59433)))

(declare-fun res!46428 () Bool)

(assert (=> b!91122 (=> res!46428 e!59433)))

(assert (=> b!91122 (= res!46428 (not e!59438))))

(declare-fun res!46429 () Bool)

(assert (=> b!91122 (=> (not res!46429) (not e!59438))))

(assert (=> b!91122 (= res!46429 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(assert (= (and d!24061 c!15103) b!91119))

(assert (= (and d!24061 (not c!15103)) b!91106))

(assert (= (and b!91106 c!15104) b!91120))

(assert (= (and b!91106 (not c!15104)) b!91113))

(assert (= (and b!91113 c!15105) b!91107))

(assert (= (and b!91113 (not c!15105)) b!91114))

(assert (= (or b!91107 b!91114) bm!8841))

(assert (= (or b!91120 bm!8841) bm!8839))

(assert (= (or b!91120 b!91107) bm!8840))

(assert (= (or b!91119 bm!8839) bm!8842))

(assert (= (or b!91119 bm!8840) bm!8843))

(assert (= (and d!24061 res!46424) b!91118))

(assert (= (and d!24061 c!15106) b!91110))

(assert (= (and d!24061 (not c!15106)) b!91115))

(assert (= (and d!24061 res!46426) b!91122))

(assert (= (and b!91122 res!46429) b!91116))

(assert (= (and b!91122 (not res!46428)) b!91121))

(assert (= (and b!91121 res!46427) b!91108))

(assert (= (and b!91122 res!46425) b!91104))

(assert (= (and b!91104 c!15102) b!91109))

(assert (= (and b!91104 (not c!15102)) b!91102))

(assert (= (and b!91109 res!46423) b!91103))

(assert (= (or b!91109 b!91102) bm!8845))

(assert (= (and b!91104 res!46430) b!91112))

(assert (= (and b!91112 c!15107) b!91117))

(assert (= (and b!91112 (not c!15107)) b!91111))

(assert (= (and b!91117 res!46431) b!91105))

(assert (= (or b!91117 b!91111) bm!8844))

(declare-fun b_lambda!4019 () Bool)

(assert (=> (not b_lambda!4019) (not b!91108)))

(assert (=> b!91108 t!5366))

(declare-fun b_and!5523 () Bool)

(assert (= b_and!5511 (and (=> t!5366 result!3063) b_and!5523)))

(assert (=> b!91108 t!5368))

(declare-fun b_and!5525 () Bool)

(assert (= b_and!5513 (and (=> t!5368 result!3067) b_and!5525)))

(declare-fun m!97923 () Bool)

(assert (=> b!91119 m!97923))

(declare-fun m!97925 () Bool)

(assert (=> bm!8845 m!97925))

(declare-fun m!97927 () Bool)

(assert (=> b!91116 m!97927))

(assert (=> b!91116 m!97927))

(declare-fun m!97929 () Bool)

(assert (=> b!91116 m!97929))

(declare-fun m!97931 () Bool)

(assert (=> bm!8843 m!97931))

(declare-fun m!97933 () Bool)

(assert (=> b!91103 m!97933))

(declare-fun m!97935 () Bool)

(assert (=> b!91110 m!97935))

(declare-fun m!97937 () Bool)

(assert (=> b!91110 m!97937))

(declare-fun m!97939 () Bool)

(assert (=> b!91110 m!97939))

(declare-fun m!97941 () Bool)

(assert (=> b!91110 m!97941))

(declare-fun m!97943 () Bool)

(assert (=> b!91110 m!97943))

(declare-fun m!97945 () Bool)

(assert (=> b!91110 m!97945))

(declare-fun m!97947 () Bool)

(assert (=> b!91110 m!97947))

(assert (=> b!91110 m!97941))

(declare-fun m!97949 () Bool)

(assert (=> b!91110 m!97949))

(declare-fun m!97951 () Bool)

(assert (=> b!91110 m!97951))

(declare-fun m!97953 () Bool)

(assert (=> b!91110 m!97953))

(assert (=> b!91110 m!97937))

(assert (=> b!91110 m!97809))

(declare-fun m!97955 () Bool)

(assert (=> b!91110 m!97955))

(declare-fun m!97957 () Bool)

(assert (=> b!91110 m!97957))

(declare-fun m!97959 () Bool)

(assert (=> b!91110 m!97959))

(assert (=> b!91110 m!97927))

(assert (=> b!91110 m!97945))

(declare-fun m!97961 () Bool)

(assert (=> b!91110 m!97961))

(declare-fun m!97963 () Bool)

(assert (=> b!91110 m!97963))

(assert (=> b!91110 m!97957))

(declare-fun m!97965 () Bool)

(assert (=> d!24061 m!97965))

(assert (=> b!91121 m!97927))

(assert (=> b!91121 m!97927))

(declare-fun m!97967 () Bool)

(assert (=> b!91121 m!97967))

(declare-fun m!97969 () Bool)

(assert (=> bm!8844 m!97969))

(declare-fun m!97971 () Bool)

(assert (=> b!91105 m!97971))

(declare-fun m!97973 () Bool)

(assert (=> b!91108 m!97973))

(assert (=> b!91108 m!97823))

(declare-fun m!97975 () Bool)

(assert (=> b!91108 m!97975))

(assert (=> b!91108 m!97973))

(assert (=> b!91108 m!97927))

(declare-fun m!97977 () Bool)

(assert (=> b!91108 m!97977))

(assert (=> b!91108 m!97927))

(assert (=> b!91108 m!97823))

(assert (=> bm!8842 m!97809))

(assert (=> b!91118 m!97927))

(assert (=> b!91118 m!97927))

(assert (=> b!91118 m!97929))

(assert (=> b!90978 d!24061))

(declare-fun d!24063 () Bool)

(declare-fun e!59444 () Bool)

(assert (=> d!24063 e!59444))

(declare-fun res!46434 () Bool)

(assert (=> d!24063 (=> res!46434 e!59444)))

(declare-fun lt!44372 () Bool)

(assert (=> d!24063 (= res!46434 (not lt!44372))))

(declare-fun lt!44373 () Bool)

(assert (=> d!24063 (= lt!44372 lt!44373)))

(declare-fun lt!44370 () Unit!2706)

(declare-fun e!59445 () Unit!2706)

(assert (=> d!24063 (= lt!44370 e!59445)))

(declare-fun c!15110 () Bool)

(assert (=> d!24063 (= c!15110 lt!44373)))

(declare-fun containsKey!148 (List!1548 (_ BitVec 64)) Bool)

(assert (=> d!24063 (= lt!44373 (containsKey!148 (toList!762 lt!44227) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(assert (=> d!24063 (= (contains!773 lt!44227 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)) lt!44372)))

(declare-fun b!91129 () Bool)

(declare-fun lt!44371 () Unit!2706)

(assert (=> b!91129 (= e!59445 lt!44371)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!96 (List!1548 (_ BitVec 64)) Unit!2706)

(assert (=> b!91129 (= lt!44371 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!762 lt!44227) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-datatypes ((Option!150 0))(
  ( (Some!149 (v!2717 V!3083)) (None!148) )
))
(declare-fun isDefined!97 (Option!150) Bool)

(declare-fun getValueByKey!144 (List!1548 (_ BitVec 64)) Option!150)

(assert (=> b!91129 (isDefined!97 (getValueByKey!144 (toList!762 lt!44227) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun b!91130 () Bool)

(declare-fun Unit!2713 () Unit!2706)

(assert (=> b!91130 (= e!59445 Unit!2713)))

(declare-fun b!91131 () Bool)

(assert (=> b!91131 (= e!59444 (isDefined!97 (getValueByKey!144 (toList!762 lt!44227) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))))

(assert (= (and d!24063 c!15110) b!91129))

(assert (= (and d!24063 (not c!15110)) b!91130))

(assert (= (and d!24063 (not res!46434)) b!91131))

(assert (=> d!24063 m!97771))

(declare-fun m!97979 () Bool)

(assert (=> d!24063 m!97979))

(assert (=> b!91129 m!97771))

(declare-fun m!97981 () Bool)

(assert (=> b!91129 m!97981))

(assert (=> b!91129 m!97771))

(declare-fun m!97983 () Bool)

(assert (=> b!91129 m!97983))

(assert (=> b!91129 m!97983))

(declare-fun m!97985 () Bool)

(assert (=> b!91129 m!97985))

(assert (=> b!91131 m!97771))

(assert (=> b!91131 m!97983))

(assert (=> b!91131 m!97983))

(assert (=> b!91131 m!97985))

(assert (=> b!90965 d!24063))

(declare-datatypes ((SeekEntryResult!247 0))(
  ( (MissingZero!247 (index!3128 (_ BitVec 32))) (Found!247 (index!3129 (_ BitVec 32))) (Intermediate!247 (undefined!1059 Bool) (index!3130 (_ BitVec 32)) (x!12405 (_ BitVec 32))) (Undefined!247) (MissingVacant!247 (index!3131 (_ BitVec 32))) )
))
(declare-fun call!8906 () SeekEntryResult!247)

(declare-fun bm!8894 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4121 (_ BitVec 32)) SeekEntryResult!247)

(assert (=> bm!8894 (= call!8906 (seekEntryOrOpen!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (_keys!4080 newMap!16) (mask!6458 newMap!16)))))

(declare-fun bm!8895 () Bool)

(declare-fun call!8917 () SeekEntryResult!247)

(assert (=> bm!8895 (= call!8917 call!8906)))

(declare-fun b!91212 () Bool)

(declare-fun e!59504 () ListLongMap!1493)

(assert (=> b!91212 (= e!59504 (getCurrentListMap!454 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2400 newMap!16)))))

(declare-fun bm!8896 () Bool)

(declare-fun call!8909 () ListLongMap!1493)

(declare-fun call!8899 () ListLongMap!1493)

(assert (=> bm!8896 (= call!8909 call!8899)))

(declare-fun b!91213 () Bool)

(declare-fun e!59500 () Bool)

(declare-fun e!59507 () Bool)

(assert (=> b!91213 (= e!59500 e!59507)))

(declare-fun res!46464 () Bool)

(declare-fun call!8905 () Bool)

(assert (=> b!91213 (= res!46464 call!8905)))

(assert (=> b!91213 (=> (not res!46464) (not e!59507))))

(declare-fun lt!44434 () SeekEntryResult!247)

(declare-fun b!91214 () Bool)

(declare-fun e!59492 () Bool)

(assert (=> b!91214 (= e!59492 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3129 lt!44434)) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun bm!8897 () Bool)

(declare-fun call!8907 () Bool)

(declare-fun call!8910 () Bool)

(assert (=> bm!8897 (= call!8907 call!8910)))

(declare-fun bm!8898 () Bool)

(declare-fun call!8916 () Bool)

(assert (=> bm!8898 (= call!8916 (arrayContainsKey!0 (_keys!4080 newMap!16) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!91215 () Bool)

(declare-fun e!59499 () Bool)

(declare-fun e!59489 () Bool)

(assert (=> b!91215 (= e!59499 e!59489)))

(declare-fun c!15138 () Bool)

(declare-fun lt!44440 () tuple2!2254)

(assert (=> b!91215 (= c!15138 (_1!1138 lt!44440))))

(declare-fun bm!8899 () Bool)

(declare-fun call!8913 () ListLongMap!1493)

(declare-fun call!8900 () ListLongMap!1493)

(assert (=> bm!8899 (= call!8913 call!8900)))

(declare-fun bm!8900 () Bool)

(declare-fun call!8914 () Bool)

(assert (=> bm!8900 (= call!8914 call!8916)))

(declare-fun call!8901 () tuple2!2254)

(declare-fun lt!44430 () SeekEntryResult!247)

(declare-fun c!15140 () Bool)

(declare-fun bm!8901 () Bool)

(declare-fun updateHelperNewKey!35 (LongMapFixedSize!798 (_ BitVec 64) V!3083 (_ BitVec 32)) tuple2!2254)

(assert (=> bm!8901 (= call!8901 (updateHelperNewKey!35 newMap!16 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 (ite c!15140 (index!3131 lt!44430) (index!3128 lt!44430))))))

(declare-fun b!91216 () Bool)

(declare-fun res!46473 () Bool)

(declare-fun e!59503 () Bool)

(assert (=> b!91216 (=> (not res!46473) (not e!59503))))

(declare-fun call!8920 () Bool)

(assert (=> b!91216 (= res!46473 call!8920)))

(declare-fun e!59493 () Bool)

(assert (=> b!91216 (= e!59493 e!59503)))

(declare-fun bm!8902 () Bool)

(declare-fun call!8919 () ListLongMap!1493)

(declare-fun call!8898 () ListLongMap!1493)

(assert (=> bm!8902 (= call!8919 call!8898)))

(declare-fun b!91217 () Bool)

(declare-fun lt!44433 () Unit!2706)

(declare-fun lt!44439 () Unit!2706)

(assert (=> b!91217 (= lt!44433 lt!44439)))

(declare-fun call!8897 () Bool)

(assert (=> b!91217 call!8897))

(declare-fun lt!44429 () array!4123)

(declare-fun lemmaValidKeyInArrayIsInListMap!96 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 32) Int) Unit!2706)

(assert (=> b!91217 (= lt!44439 (lemmaValidKeyInArrayIsInListMap!96 (_keys!4080 newMap!16) lt!44429 (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) (index!3129 lt!44430) (defaultEntry!2400 newMap!16)))))

(assert (=> b!91217 (= lt!44429 (array!4124 (store (arr!1962 (_values!2383 newMap!16)) (index!3129 lt!44430) (ValueCellFull!945 lt!44233)) (size!2209 (_values!2383 newMap!16))))))

(declare-fun lt!44449 () Unit!2706)

(declare-fun lt!44454 () Unit!2706)

(assert (=> b!91217 (= lt!44449 lt!44454)))

(assert (=> b!91217 (= call!8899 call!8898)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 32) (_ BitVec 64) V!3083 Int) Unit!2706)

(assert (=> b!91217 (= lt!44454 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) (index!3129 lt!44430) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 (defaultEntry!2400 newMap!16)))))

(declare-fun lt!44428 () Unit!2706)

(declare-fun e!59495 () Unit!2706)

(assert (=> b!91217 (= lt!44428 e!59495)))

(declare-fun c!15149 () Bool)

(assert (=> b!91217 (= c!15149 (contains!773 (getCurrentListMap!454 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2400 newMap!16)) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun e!59502 () tuple2!2254)

(assert (=> b!91217 (= e!59502 (tuple2!2255 true (LongMapFixedSize!799 (defaultEntry!2400 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) (_size!448 newMap!16) (_keys!4080 newMap!16) (array!4124 (store (arr!1962 (_values!2383 newMap!16)) (index!3129 lt!44430) (ValueCellFull!945 lt!44233)) (size!2209 (_values!2383 newMap!16))) (_vacant!448 newMap!16))))))

(declare-fun b!91218 () Bool)

(declare-fun e!59505 () tuple2!2254)

(declare-fun e!59491 () tuple2!2254)

(assert (=> b!91218 (= e!59505 e!59491)))

(declare-fun c!15143 () Bool)

(assert (=> b!91218 (= c!15143 (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8903 () Bool)

(declare-fun call!8911 () Unit!2706)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 64) Int) Unit!2706)

(assert (=> bm!8903 (= call!8911 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (defaultEntry!2400 newMap!16)))))

(declare-fun b!91219 () Bool)

(declare-fun e!59488 () tuple2!2254)

(declare-fun lt!44445 () tuple2!2254)

(assert (=> b!91219 (= e!59488 (tuple2!2255 (_1!1138 lt!44445) (_2!1138 lt!44445)))))

(assert (=> b!91219 (= lt!44445 call!8901)))

(declare-fun b!91220 () Bool)

(assert (=> b!91220 (= e!59504 (ite c!15143 call!8913 call!8919))))

(declare-fun b!91221 () Bool)

(declare-fun call!8912 () Bool)

(assert (=> b!91221 (= e!59507 (not call!8912))))

(declare-fun b!91222 () Bool)

(declare-fun e!59508 () Unit!2706)

(declare-fun Unit!2714 () Unit!2706)

(assert (=> b!91222 (= e!59508 Unit!2714)))

(declare-fun lt!44438 () Unit!2706)

(declare-fun call!8918 () Unit!2706)

(assert (=> b!91222 (= lt!44438 call!8918)))

(declare-fun lt!44448 () SeekEntryResult!247)

(declare-fun call!8915 () SeekEntryResult!247)

(assert (=> b!91222 (= lt!44448 call!8915)))

(declare-fun res!46472 () Bool)

(assert (=> b!91222 (= res!46472 ((_ is Found!247) lt!44448))))

(declare-fun e!59501 () Bool)

(assert (=> b!91222 (=> (not res!46472) (not e!59501))))

(assert (=> b!91222 e!59501))

(declare-fun lt!44444 () Unit!2706)

(assert (=> b!91222 (= lt!44444 lt!44438)))

(assert (=> b!91222 false))

(declare-fun b!91223 () Bool)

(declare-fun lt!44447 () SeekEntryResult!247)

(assert (=> b!91223 (= e!59500 ((_ is Undefined!247) lt!44447))))

(declare-fun bm!8904 () Bool)

(assert (=> bm!8904 (= call!8912 call!8916)))

(declare-fun b!91224 () Bool)

(declare-fun Unit!2715 () Unit!2706)

(assert (=> b!91224 (= e!59495 Unit!2715)))

(declare-fun lt!44453 () Unit!2706)

(assert (=> b!91224 (= lt!44453 call!8911)))

(assert (=> b!91224 (= lt!44447 call!8917)))

(declare-fun c!15139 () Bool)

(assert (=> b!91224 (= c!15139 ((_ is MissingZero!247) lt!44447))))

(declare-fun e!59494 () Bool)

(assert (=> b!91224 e!59494))

(declare-fun lt!44450 () Unit!2706)

(assert (=> b!91224 (= lt!44450 lt!44453)))

(assert (=> b!91224 false))

(declare-fun b!91225 () Bool)

(declare-fun lt!44441 () Unit!2706)

(declare-fun lt!44452 () Unit!2706)

(assert (=> b!91225 (= lt!44441 lt!44452)))

(assert (=> b!91225 (= call!8909 call!8913)))

(declare-fun lt!44432 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 V!3083 Int) Unit!2706)

(assert (=> b!91225 (= lt!44452 (lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) lt!44432 (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) lt!44233 (defaultEntry!2400 newMap!16)))))

(assert (=> b!91225 (= lt!44432 (bvor (extraKeys!2231 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!91225 (= e!59491 (tuple2!2255 true (LongMapFixedSize!799 (defaultEntry!2400 newMap!16) (mask!6458 newMap!16) (bvor (extraKeys!2231 newMap!16) #b00000000000000000000000000000010) (zeroValue!2288 newMap!16) lt!44233 (_size!448 newMap!16) (_keys!4080 newMap!16) (_values!2383 newMap!16) (_vacant!448 newMap!16))))))

(declare-fun b!91226 () Bool)

(declare-fun lt!44435 () Unit!2706)

(assert (=> b!91226 (= e!59508 lt!44435)))

(assert (=> b!91226 (= lt!44435 call!8911)))

(declare-fun lt!44436 () SeekEntryResult!247)

(assert (=> b!91226 (= lt!44436 call!8915)))

(declare-fun c!15142 () Bool)

(assert (=> b!91226 (= c!15142 ((_ is MissingZero!247) lt!44436))))

(assert (=> b!91226 e!59493))

(declare-fun b!91227 () Bool)

(assert (=> b!91227 (= e!59488 e!59502)))

(declare-fun c!15141 () Bool)

(assert (=> b!91227 (= c!15141 ((_ is MissingZero!247) lt!44430))))

(declare-fun b!91228 () Bool)

(declare-fun lt!44446 () tuple2!2254)

(assert (=> b!91228 (= lt!44446 call!8901)))

(assert (=> b!91228 (= e!59502 (tuple2!2255 (_1!1138 lt!44446) (_2!1138 lt!44446)))))

(declare-fun b!91229 () Bool)

(declare-fun c!15145 () Bool)

(assert (=> b!91229 (= c!15145 ((_ is MissingVacant!247) lt!44436))))

(declare-fun e!59496 () Bool)

(assert (=> b!91229 (= e!59493 e!59496)))

(declare-fun c!15144 () Bool)

(declare-fun bm!8905 () Bool)

(declare-fun c!15147 () Bool)

(assert (=> bm!8905 (= call!8900 (getCurrentListMap!454 (_keys!4080 newMap!16) (ite (or c!15144 c!15147) (_values!2383 newMap!16) lt!44429) (mask!6458 newMap!16) (ite c!15144 (ite c!15143 (extraKeys!2231 newMap!16) lt!44432) (extraKeys!2231 newMap!16)) (zeroValue!2288 newMap!16) (ite c!15144 (ite c!15143 (minValue!2288 newMap!16) lt!44233) (minValue!2288 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2400 newMap!16)))))

(declare-fun call!8904 () ListLongMap!1493)

(declare-fun b!91230 () Bool)

(declare-fun call!8902 () ListLongMap!1493)

(declare-fun e!59506 () Bool)

(assert (=> b!91230 (= e!59506 (= call!8902 (+!124 call!8904 (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233))))))

(declare-fun b!91231 () Bool)

(assert (=> b!91231 (= c!15140 ((_ is MissingVacant!247) lt!44430))))

(declare-fun e!59497 () tuple2!2254)

(assert (=> b!91231 (= e!59497 e!59488)))

(declare-fun b!91232 () Bool)

(declare-fun e!59498 () Bool)

(assert (=> b!91232 (= e!59496 e!59498)))

(declare-fun res!46465 () Bool)

(assert (=> b!91232 (= res!46465 call!8920)))

(assert (=> b!91232 (=> (not res!46465) (not e!59498))))

(declare-fun b!91233 () Bool)

(declare-fun res!46463 () Bool)

(declare-fun e!59490 () Bool)

(assert (=> b!91233 (=> (not res!46463) (not e!59490))))

(assert (=> b!91233 (= res!46463 call!8905)))

(assert (=> b!91233 (= e!59494 e!59490)))

(declare-fun b!91234 () Bool)

(declare-fun res!46476 () Bool)

(assert (=> b!91234 (=> (not res!46476) (not e!59490))))

(assert (=> b!91234 (= res!46476 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3128 lt!44447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91235 () Bool)

(assert (=> b!91235 (= e!59498 (not call!8914))))

(declare-fun b!91236 () Bool)

(assert (=> b!91236 (= e!59503 (not call!8914))))

(declare-fun b!91237 () Bool)

(declare-fun c!15146 () Bool)

(assert (=> b!91237 (= c!15146 ((_ is MissingVacant!247) lt!44447))))

(assert (=> b!91237 (= e!59494 e!59500)))

(declare-fun c!15137 () Bool)

(declare-fun bm!8906 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8906 (= call!8910 (inRange!0 (ite c!15147 (ite c!15137 (index!3129 lt!44448) (ite c!15142 (index!3128 lt!44436) (index!3131 lt!44436))) (ite c!15149 (index!3129 lt!44434) (ite c!15139 (index!3128 lt!44447) (index!3131 lt!44447)))) (mask!6458 newMap!16)))))

(declare-fun bm!8907 () Bool)

(assert (=> bm!8907 (= call!8915 call!8906)))

(declare-fun bm!8908 () Bool)

(assert (=> bm!8908 (= call!8904 (map!1217 newMap!16))))

(declare-fun d!24065 () Bool)

(assert (=> d!24065 e!59499))

(declare-fun res!46471 () Bool)

(assert (=> d!24065 (=> (not res!46471) (not e!59499))))

(assert (=> d!24065 (= res!46471 (valid!349 (_2!1138 lt!44440)))))

(assert (=> d!24065 (= lt!44440 e!59505)))

(assert (=> d!24065 (= c!15144 (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvneg (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))))

(assert (=> d!24065 (valid!349 newMap!16)))

(assert (=> d!24065 (= (update!124 newMap!16 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233) lt!44440)))

(declare-fun b!91238 () Bool)

(declare-fun res!46466 () Bool)

(assert (=> b!91238 (= res!46466 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3131 lt!44436)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91238 (=> (not res!46466) (not e!59498))))

(declare-fun b!91239 () Bool)

(declare-fun lt!44443 () Unit!2706)

(assert (=> b!91239 (= lt!44443 e!59508)))

(assert (=> b!91239 (= c!15137 call!8897)))

(assert (=> b!91239 (= e!59497 (tuple2!2255 false newMap!16))))

(declare-fun b!91240 () Bool)

(declare-fun res!46475 () Bool)

(assert (=> b!91240 (=> (not res!46475) (not e!59503))))

(assert (=> b!91240 (= res!46475 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3128 lt!44436)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8909 () Bool)

(declare-fun call!8903 () Bool)

(assert (=> bm!8909 (= call!8905 call!8903)))

(declare-fun b!91241 () Bool)

(declare-fun lt!44442 () Unit!2706)

(declare-fun lt!44437 () Unit!2706)

(assert (=> b!91241 (= lt!44442 lt!44437)))

(assert (=> b!91241 (= call!8909 call!8919)))

(declare-fun lt!44451 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!35 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 V!3083 Int) Unit!2706)

(assert (=> b!91241 (= lt!44437 (lemmaChangeZeroKeyThenAddPairToListMap!35 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) lt!44451 (zeroValue!2288 newMap!16) lt!44233 (minValue!2288 newMap!16) (defaultEntry!2400 newMap!16)))))

(assert (=> b!91241 (= lt!44451 (bvor (extraKeys!2231 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!91241 (= e!59491 (tuple2!2255 true (LongMapFixedSize!799 (defaultEntry!2400 newMap!16) (mask!6458 newMap!16) (bvor (extraKeys!2231 newMap!16) #b00000000000000000000000000000001) lt!44233 (minValue!2288 newMap!16) (_size!448 newMap!16) (_keys!4080 newMap!16) (_values!2383 newMap!16) (_vacant!448 newMap!16))))))

(declare-fun bm!8910 () Bool)

(assert (=> bm!8910 (= call!8920 call!8907)))

(declare-fun b!91242 () Bool)

(assert (=> b!91242 (= e!59505 e!59497)))

(assert (=> b!91242 (= lt!44430 (seekEntryOrOpen!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (_keys!4080 newMap!16) (mask!6458 newMap!16)))))

(assert (=> b!91242 (= c!15147 ((_ is Undefined!247) lt!44430))))

(declare-fun b!91243 () Bool)

(assert (=> b!91243 (= e!59489 e!59506)))

(declare-fun res!46468 () Bool)

(assert (=> b!91243 (= res!46468 (contains!773 call!8902 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(assert (=> b!91243 (=> (not res!46468) (not e!59506))))

(declare-fun bm!8911 () Bool)

(assert (=> bm!8911 (= call!8903 call!8910)))

(declare-fun b!91244 () Bool)

(declare-fun lt!44431 () Unit!2706)

(assert (=> b!91244 (= e!59495 lt!44431)))

(assert (=> b!91244 (= lt!44431 call!8918)))

(assert (=> b!91244 (= lt!44434 call!8917)))

(declare-fun res!46467 () Bool)

(assert (=> b!91244 (= res!46467 ((_ is Found!247) lt!44434))))

(assert (=> b!91244 (=> (not res!46467) (not e!59492))))

(assert (=> b!91244 e!59492))

(declare-fun bm!8912 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 64) Int) Unit!2706)

(assert (=> bm!8912 (= call!8918 (lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (_keys!4080 newMap!16) (_values!2383 newMap!16) (mask!6458 newMap!16) (extraKeys!2231 newMap!16) (zeroValue!2288 newMap!16) (minValue!2288 newMap!16) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (defaultEntry!2400 newMap!16)))))

(declare-fun b!91245 () Bool)

(assert (=> b!91245 (= e!59490 (not call!8912))))

(declare-fun bm!8913 () Bool)

(declare-fun call!8908 () ListLongMap!1493)

(assert (=> bm!8913 (= call!8908 call!8900)))

(declare-fun bm!8914 () Bool)

(assert (=> bm!8914 (= call!8898 (getCurrentListMap!454 (_keys!4080 newMap!16) (ite c!15144 (_values!2383 newMap!16) (array!4124 (store (arr!1962 (_values!2383 newMap!16)) (index!3129 lt!44430) (ValueCellFull!945 lt!44233)) (size!2209 (_values!2383 newMap!16)))) (mask!6458 newMap!16) (ite (and c!15144 c!15143) lt!44451 (extraKeys!2231 newMap!16)) (ite (and c!15144 c!15143) lt!44233 (zeroValue!2288 newMap!16)) (minValue!2288 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2400 newMap!16)))))

(declare-fun b!91246 () Bool)

(declare-fun res!46470 () Bool)

(assert (=> b!91246 (= res!46470 call!8907)))

(assert (=> b!91246 (=> (not res!46470) (not e!59501))))

(declare-fun b!91247 () Bool)

(declare-fun res!46474 () Bool)

(assert (=> b!91247 (= res!46474 call!8903)))

(assert (=> b!91247 (=> (not res!46474) (not e!59492))))

(declare-fun b!91248 () Bool)

(assert (=> b!91248 (= e!59501 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3129 lt!44448)) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun bm!8915 () Bool)

(assert (=> bm!8915 (= call!8902 (map!1217 (_2!1138 lt!44440)))))

(declare-fun bm!8916 () Bool)

(assert (=> bm!8916 (= call!8897 (contains!773 call!8908 (ite c!15147 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (select (arr!1961 (_keys!4080 newMap!16)) (index!3129 lt!44430)))))))

(declare-fun bm!8917 () Bool)

(assert (=> bm!8917 (= call!8899 (+!124 e!59504 (ite c!15144 (ite c!15143 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44233) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44233)) (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233))))))

(declare-fun c!15148 () Bool)

(assert (=> bm!8917 (= c!15148 c!15144)))

(declare-fun b!91249 () Bool)

(assert (=> b!91249 (= e!59489 (= call!8902 call!8904))))

(declare-fun b!91250 () Bool)

(declare-fun res!46469 () Bool)

(assert (=> b!91250 (= res!46469 (= (select (arr!1961 (_keys!4080 newMap!16)) (index!3131 lt!44447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91250 (=> (not res!46469) (not e!59507))))

(declare-fun b!91251 () Bool)

(assert (=> b!91251 (= e!59496 ((_ is Undefined!247) lt!44436))))

(assert (= (and d!24065 c!15144) b!91218))

(assert (= (and d!24065 (not c!15144)) b!91242))

(assert (= (and b!91218 c!15143) b!91241))

(assert (= (and b!91218 (not c!15143)) b!91225))

(assert (= (or b!91241 b!91225) bm!8899))

(assert (= (or b!91241 b!91225) bm!8902))

(assert (= (or b!91241 b!91225) bm!8896))

(assert (= (and b!91242 c!15147) b!91239))

(assert (= (and b!91242 (not c!15147)) b!91231))

(assert (= (and b!91239 c!15137) b!91222))

(assert (= (and b!91239 (not c!15137)) b!91226))

(assert (= (and b!91222 res!46472) b!91246))

(assert (= (and b!91246 res!46470) b!91248))

(assert (= (and b!91226 c!15142) b!91216))

(assert (= (and b!91226 (not c!15142)) b!91229))

(assert (= (and b!91216 res!46473) b!91240))

(assert (= (and b!91240 res!46475) b!91236))

(assert (= (and b!91229 c!15145) b!91232))

(assert (= (and b!91229 (not c!15145)) b!91251))

(assert (= (and b!91232 res!46465) b!91238))

(assert (= (and b!91238 res!46466) b!91235))

(assert (= (or b!91216 b!91232) bm!8910))

(assert (= (or b!91236 b!91235) bm!8900))

(assert (= (or b!91246 bm!8910) bm!8897))

(assert (= (or b!91222 b!91226) bm!8907))

(assert (= (and b!91231 c!15140) b!91219))

(assert (= (and b!91231 (not c!15140)) b!91227))

(assert (= (and b!91227 c!15141) b!91228))

(assert (= (and b!91227 (not c!15141)) b!91217))

(assert (= (and b!91217 c!15149) b!91244))

(assert (= (and b!91217 (not c!15149)) b!91224))

(assert (= (and b!91244 res!46467) b!91247))

(assert (= (and b!91247 res!46474) b!91214))

(assert (= (and b!91224 c!15139) b!91233))

(assert (= (and b!91224 (not c!15139)) b!91237))

(assert (= (and b!91233 res!46463) b!91234))

(assert (= (and b!91234 res!46476) b!91245))

(assert (= (and b!91237 c!15146) b!91213))

(assert (= (and b!91237 (not c!15146)) b!91223))

(assert (= (and b!91213 res!46464) b!91250))

(assert (= (and b!91250 res!46469) b!91221))

(assert (= (or b!91233 b!91213) bm!8909))

(assert (= (or b!91245 b!91221) bm!8904))

(assert (= (or b!91247 bm!8909) bm!8911))

(assert (= (or b!91244 b!91224) bm!8895))

(assert (= (or b!91219 b!91228) bm!8901))

(assert (= (or b!91222 b!91244) bm!8912))

(assert (= (or bm!8897 bm!8911) bm!8906))

(assert (= (or b!91226 b!91224) bm!8903))

(assert (= (or b!91239 b!91217) bm!8913))

(assert (= (or bm!8907 bm!8895) bm!8894))

(assert (= (or bm!8900 bm!8904) bm!8898))

(assert (= (or b!91239 b!91217) bm!8916))

(assert (= (or bm!8899 bm!8913) bm!8905))

(assert (= (or bm!8902 b!91217) bm!8914))

(assert (= (or bm!8896 b!91217) bm!8917))

(assert (= (and bm!8917 c!15148) b!91220))

(assert (= (and bm!8917 (not c!15148)) b!91212))

(assert (= (and d!24065 res!46471) b!91215))

(assert (= (and b!91215 c!15138) b!91243))

(assert (= (and b!91215 (not c!15138)) b!91249))

(assert (= (and b!91243 res!46468) b!91230))

(assert (= (or b!91243 b!91230 b!91249) bm!8915))

(assert (= (or b!91230 b!91249) bm!8908))

(declare-fun m!97987 () Bool)

(assert (=> b!91225 m!97987))

(assert (=> bm!8898 m!97771))

(declare-fun m!97989 () Bool)

(assert (=> bm!8898 m!97989))

(assert (=> bm!8894 m!97771))

(declare-fun m!97991 () Bool)

(assert (=> bm!8894 m!97991))

(declare-fun m!97993 () Bool)

(assert (=> bm!8906 m!97993))

(declare-fun m!97995 () Bool)

(assert (=> b!91214 m!97995))

(assert (=> b!91217 m!97771))

(declare-fun m!97997 () Bool)

(assert (=> b!91217 m!97997))

(assert (=> b!91217 m!97921))

(declare-fun m!97999 () Bool)

(assert (=> b!91217 m!97999))

(declare-fun m!98001 () Bool)

(assert (=> b!91217 m!98001))

(assert (=> b!91217 m!97921))

(assert (=> b!91217 m!97771))

(declare-fun m!98003 () Bool)

(assert (=> b!91217 m!98003))

(declare-fun m!98005 () Bool)

(assert (=> b!91250 m!98005))

(declare-fun m!98007 () Bool)

(assert (=> bm!8905 m!98007))

(declare-fun m!98009 () Bool)

(assert (=> d!24065 m!98009))

(assert (=> d!24065 m!97791))

(declare-fun m!98011 () Bool)

(assert (=> bm!8916 m!98011))

(declare-fun m!98013 () Bool)

(assert (=> bm!8916 m!98013))

(assert (=> bm!8912 m!97771))

(declare-fun m!98015 () Bool)

(assert (=> bm!8912 m!98015))

(declare-fun m!98017 () Bool)

(assert (=> b!91234 m!98017))

(assert (=> b!91243 m!97771))

(declare-fun m!98019 () Bool)

(assert (=> b!91243 m!98019))

(declare-fun m!98021 () Bool)

(assert (=> b!91230 m!98021))

(assert (=> b!91242 m!97771))

(assert (=> b!91242 m!97991))

(assert (=> bm!8903 m!97771))

(declare-fun m!98023 () Bool)

(assert (=> bm!8903 m!98023))

(assert (=> bm!8901 m!97771))

(declare-fun m!98025 () Bool)

(assert (=> bm!8901 m!98025))

(assert (=> b!91212 m!97921))

(declare-fun m!98027 () Bool)

(assert (=> b!91238 m!98027))

(declare-fun m!98029 () Bool)

(assert (=> b!91248 m!98029))

(assert (=> bm!8908 m!97785))

(declare-fun m!98031 () Bool)

(assert (=> b!91240 m!98031))

(declare-fun m!98033 () Bool)

(assert (=> bm!8915 m!98033))

(assert (=> bm!8914 m!97999))

(declare-fun m!98035 () Bool)

(assert (=> bm!8914 m!98035))

(declare-fun m!98037 () Bool)

(assert (=> b!91241 m!98037))

(declare-fun m!98039 () Bool)

(assert (=> bm!8917 m!98039))

(assert (=> b!90965 d!24065))

(declare-fun d!24067 () Bool)

(declare-fun e!59511 () Bool)

(assert (=> d!24067 e!59511))

(declare-fun res!46482 () Bool)

(assert (=> d!24067 (=> (not res!46482) (not e!59511))))

(declare-fun lt!44464 () ListLongMap!1493)

(assert (=> d!24067 (= res!46482 (contains!773 lt!44464 (_1!1139 lt!44234)))))

(declare-fun lt!44463 () List!1548)

(assert (=> d!24067 (= lt!44464 (ListLongMap!1494 lt!44463))))

(declare-fun lt!44465 () Unit!2706)

(declare-fun lt!44466 () Unit!2706)

(assert (=> d!24067 (= lt!44465 lt!44466)))

(assert (=> d!24067 (= (getValueByKey!144 lt!44463 (_1!1139 lt!44234)) (Some!149 (_2!1139 lt!44234)))))

(declare-fun lemmaContainsTupThenGetReturnValue!61 (List!1548 (_ BitVec 64) V!3083) Unit!2706)

(assert (=> d!24067 (= lt!44466 (lemmaContainsTupThenGetReturnValue!61 lt!44463 (_1!1139 lt!44234) (_2!1139 lt!44234)))))

(declare-fun insertStrictlySorted!64 (List!1548 (_ BitVec 64) V!3083) List!1548)

(assert (=> d!24067 (= lt!44463 (insertStrictlySorted!64 (toList!762 lt!44229) (_1!1139 lt!44234) (_2!1139 lt!44234)))))

(assert (=> d!24067 (= (+!124 lt!44229 lt!44234) lt!44464)))

(declare-fun b!91256 () Bool)

(declare-fun res!46481 () Bool)

(assert (=> b!91256 (=> (not res!46481) (not e!59511))))

(assert (=> b!91256 (= res!46481 (= (getValueByKey!144 (toList!762 lt!44464) (_1!1139 lt!44234)) (Some!149 (_2!1139 lt!44234))))))

(declare-fun b!91257 () Bool)

(declare-fun contains!775 (List!1548 tuple2!2256) Bool)

(assert (=> b!91257 (= e!59511 (contains!775 (toList!762 lt!44464) lt!44234))))

(assert (= (and d!24067 res!46482) b!91256))

(assert (= (and b!91256 res!46481) b!91257))

(declare-fun m!98041 () Bool)

(assert (=> d!24067 m!98041))

(declare-fun m!98043 () Bool)

(assert (=> d!24067 m!98043))

(declare-fun m!98045 () Bool)

(assert (=> d!24067 m!98045))

(declare-fun m!98047 () Bool)

(assert (=> d!24067 m!98047))

(declare-fun m!98049 () Bool)

(assert (=> b!91256 m!98049))

(declare-fun m!98051 () Bool)

(assert (=> b!91257 m!98051))

(assert (=> b!90964 d!24067))

(declare-fun d!24069 () Bool)

(declare-fun e!59512 () Bool)

(assert (=> d!24069 e!59512))

(declare-fun res!46484 () Bool)

(assert (=> d!24069 (=> (not res!46484) (not e!59512))))

(declare-fun lt!44468 () ListLongMap!1493)

(assert (=> d!24069 (= res!46484 (contains!773 lt!44468 (_1!1139 lt!44232)))))

(declare-fun lt!44467 () List!1548)

(assert (=> d!24069 (= lt!44468 (ListLongMap!1494 lt!44467))))

(declare-fun lt!44469 () Unit!2706)

(declare-fun lt!44470 () Unit!2706)

(assert (=> d!24069 (= lt!44469 lt!44470)))

(assert (=> d!24069 (= (getValueByKey!144 lt!44467 (_1!1139 lt!44232)) (Some!149 (_2!1139 lt!44232)))))

(assert (=> d!24069 (= lt!44470 (lemmaContainsTupThenGetReturnValue!61 lt!44467 (_1!1139 lt!44232) (_2!1139 lt!44232)))))

(assert (=> d!24069 (= lt!44467 (insertStrictlySorted!64 (toList!762 lt!44238) (_1!1139 lt!44232) (_2!1139 lt!44232)))))

(assert (=> d!24069 (= (+!124 lt!44238 lt!44232) lt!44468)))

(declare-fun b!91258 () Bool)

(declare-fun res!46483 () Bool)

(assert (=> b!91258 (=> (not res!46483) (not e!59512))))

(assert (=> b!91258 (= res!46483 (= (getValueByKey!144 (toList!762 lt!44468) (_1!1139 lt!44232)) (Some!149 (_2!1139 lt!44232))))))

(declare-fun b!91259 () Bool)

(assert (=> b!91259 (= e!59512 (contains!775 (toList!762 lt!44468) lt!44232))))

(assert (= (and d!24069 res!46484) b!91258))

(assert (= (and b!91258 res!46483) b!91259))

(declare-fun m!98053 () Bool)

(assert (=> d!24069 m!98053))

(declare-fun m!98055 () Bool)

(assert (=> d!24069 m!98055))

(declare-fun m!98057 () Bool)

(assert (=> d!24069 m!98057))

(declare-fun m!98059 () Bool)

(assert (=> d!24069 m!98059))

(declare-fun m!98061 () Bool)

(assert (=> b!91258 m!98061))

(declare-fun m!98063 () Bool)

(assert (=> b!91259 m!98063))

(assert (=> b!90964 d!24069))

(declare-fun b!91260 () Bool)

(declare-fun e!59518 () Bool)

(declare-fun call!8925 () Bool)

(assert (=> b!91260 (= e!59518 (not call!8925))))

(declare-fun bm!8918 () Bool)

(declare-fun call!8927 () ListLongMap!1493)

(declare-fun call!8921 () ListLongMap!1493)

(assert (=> bm!8918 (= call!8927 call!8921)))

(declare-fun b!91261 () Bool)

(declare-fun e!59517 () Bool)

(declare-fun lt!44474 () ListLongMap!1493)

(assert (=> b!91261 (= e!59517 (= (apply!86 lt!44474 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun d!24071 () Bool)

(declare-fun e!59520 () Bool)

(assert (=> d!24071 e!59520))

(declare-fun res!46488 () Bool)

(assert (=> d!24071 (=> (not res!46488) (not e!59520))))

(assert (=> d!24071 (= res!46488 (or (bvsge from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))))

(declare-fun lt!44482 () ListLongMap!1493)

(assert (=> d!24071 (= lt!44474 lt!44482)))

(declare-fun lt!44472 () Unit!2706)

(declare-fun e!59515 () Unit!2706)

(assert (=> d!24071 (= lt!44472 e!59515)))

(declare-fun c!15154 () Bool)

(declare-fun e!59525 () Bool)

(assert (=> d!24071 (= c!15154 e!59525)))

(declare-fun res!46486 () Bool)

(assert (=> d!24071 (=> (not res!46486) (not e!59525))))

(assert (=> d!24071 (= res!46486 (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun e!59521 () ListLongMap!1493)

(assert (=> d!24071 (= lt!44482 e!59521)))

(declare-fun c!15151 () Bool)

(assert (=> d!24071 (= c!15151 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24071 (validMask!0 (mask!6458 (v!2713 (underlying!310 thiss!992))))))

(assert (=> d!24071 (= (getCurrentListMap!454 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) lt!44474)))

(declare-fun b!91262 () Bool)

(declare-fun res!46492 () Bool)

(assert (=> b!91262 (=> (not res!46492) (not e!59520))))

(assert (=> b!91262 (= res!46492 e!59518)))

(declare-fun c!15150 () Bool)

(assert (=> b!91262 (= c!15150 (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91263 () Bool)

(declare-fun e!59513 () Bool)

(assert (=> b!91263 (= e!59513 (= (apply!86 lt!44474 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!91264 () Bool)

(declare-fun e!59522 () ListLongMap!1493)

(assert (=> b!91264 (= e!59521 e!59522)))

(declare-fun c!15152 () Bool)

(assert (=> b!91264 (= c!15152 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91265 () Bool)

(declare-fun e!59523 () ListLongMap!1493)

(declare-fun call!8922 () ListLongMap!1493)

(assert (=> b!91265 (= e!59523 call!8922)))

(declare-fun e!59516 () Bool)

(declare-fun b!91266 () Bool)

(assert (=> b!91266 (= e!59516 (= (apply!86 lt!44474 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)) (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91266 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2209 (_values!2383 (v!2713 (underlying!310 thiss!992))))))))

(assert (=> b!91266 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91267 () Bool)

(assert (=> b!91267 (= e!59518 e!59517)))

(declare-fun res!46485 () Bool)

(assert (=> b!91267 (= res!46485 call!8925)))

(assert (=> b!91267 (=> (not res!46485) (not e!59517))))

(declare-fun bm!8919 () Bool)

(declare-fun call!8926 () ListLongMap!1493)

(assert (=> bm!8919 (= call!8922 call!8926)))

(declare-fun b!91268 () Bool)

(declare-fun lt!44491 () Unit!2706)

(assert (=> b!91268 (= e!59515 lt!44491)))

(declare-fun lt!44475 () ListLongMap!1493)

(assert (=> b!91268 (= lt!44475 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44485 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44483 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44483 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))

(declare-fun lt!44486 () Unit!2706)

(assert (=> b!91268 (= lt!44486 (addStillContains!62 lt!44475 lt!44485 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44483))))

(assert (=> b!91268 (contains!773 (+!124 lt!44475 (tuple2!2257 lt!44485 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44483)))

(declare-fun lt!44480 () Unit!2706)

(assert (=> b!91268 (= lt!44480 lt!44486)))

(declare-fun lt!44478 () ListLongMap!1493)

(assert (=> b!91268 (= lt!44478 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44484 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44484 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44471 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44471 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))

(declare-fun lt!44488 () Unit!2706)

(assert (=> b!91268 (= lt!44488 (addApplyDifferent!62 lt!44478 lt!44484 (minValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44471))))

(assert (=> b!91268 (= (apply!86 (+!124 lt!44478 (tuple2!2257 lt!44484 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44471) (apply!86 lt!44478 lt!44471))))

(declare-fun lt!44489 () Unit!2706)

(assert (=> b!91268 (= lt!44489 lt!44488)))

(declare-fun lt!44487 () ListLongMap!1493)

(assert (=> b!91268 (= lt!44487 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44473 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44490 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44490 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))

(declare-fun lt!44477 () Unit!2706)

(assert (=> b!91268 (= lt!44477 (addApplyDifferent!62 lt!44487 lt!44473 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44490))))

(assert (=> b!91268 (= (apply!86 (+!124 lt!44487 (tuple2!2257 lt!44473 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44490) (apply!86 lt!44487 lt!44490))))

(declare-fun lt!44492 () Unit!2706)

(assert (=> b!91268 (= lt!44492 lt!44477)))

(declare-fun lt!44479 () ListLongMap!1493)

(assert (=> b!91268 (= lt!44479 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun lt!44476 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44476 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44481 () (_ BitVec 64))

(assert (=> b!91268 (= lt!44481 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355))))

(assert (=> b!91268 (= lt!44491 (addApplyDifferent!62 lt!44479 lt!44476 (minValue!2288 (v!2713 (underlying!310 thiss!992))) lt!44481))))

(assert (=> b!91268 (= (apply!86 (+!124 lt!44479 (tuple2!2257 lt!44476 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) lt!44481) (apply!86 lt!44479 lt!44481))))

(declare-fun b!91269 () Bool)

(declare-fun e!59514 () Bool)

(declare-fun call!8924 () Bool)

(assert (=> b!91269 (= e!59514 (not call!8924))))

(declare-fun bm!8920 () Bool)

(declare-fun call!8923 () ListLongMap!1493)

(assert (=> bm!8920 (= call!8923 call!8927)))

(declare-fun bm!8921 () Bool)

(assert (=> bm!8921 (= call!8921 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) from!355 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!91270 () Bool)

(assert (=> b!91270 (= e!59520 e!59514)))

(declare-fun c!15155 () Bool)

(assert (=> b!91270 (= c!15155 (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91271 () Bool)

(declare-fun c!15153 () Bool)

(assert (=> b!91271 (= c!15153 (and (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91271 (= e!59522 e!59523)))

(declare-fun b!91272 () Bool)

(assert (=> b!91272 (= e!59523 call!8923)))

(declare-fun b!91273 () Bool)

(declare-fun Unit!2716 () Unit!2706)

(assert (=> b!91273 (= e!59515 Unit!2716)))

(declare-fun b!91274 () Bool)

(declare-fun e!59524 () Bool)

(assert (=> b!91274 (= e!59524 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun bm!8922 () Bool)

(assert (=> bm!8922 (= call!8926 (+!124 (ite c!15151 call!8921 (ite c!15152 call!8927 call!8923)) (ite (or c!15151 c!15152) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))))

(declare-fun bm!8923 () Bool)

(assert (=> bm!8923 (= call!8924 (contains!773 lt!44474 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91275 () Bool)

(assert (=> b!91275 (= e!59514 e!59513)))

(declare-fun res!46493 () Bool)

(assert (=> b!91275 (= res!46493 call!8924)))

(assert (=> b!91275 (=> (not res!46493) (not e!59513))))

(declare-fun b!91276 () Bool)

(assert (=> b!91276 (= e!59525 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun bm!8924 () Bool)

(assert (=> bm!8924 (= call!8925 (contains!773 lt!44474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91277 () Bool)

(assert (=> b!91277 (= e!59521 (+!124 call!8926 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91278 () Bool)

(assert (=> b!91278 (= e!59522 call!8922)))

(declare-fun b!91279 () Bool)

(declare-fun e!59519 () Bool)

(assert (=> b!91279 (= e!59519 e!59516)))

(declare-fun res!46489 () Bool)

(assert (=> b!91279 (=> (not res!46489) (not e!59516))))

(assert (=> b!91279 (= res!46489 (contains!773 lt!44474 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(assert (=> b!91279 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91280 () Bool)

(declare-fun res!46487 () Bool)

(assert (=> b!91280 (=> (not res!46487) (not e!59520))))

(assert (=> b!91280 (= res!46487 e!59519)))

(declare-fun res!46490 () Bool)

(assert (=> b!91280 (=> res!46490 e!59519)))

(assert (=> b!91280 (= res!46490 (not e!59524))))

(declare-fun res!46491 () Bool)

(assert (=> b!91280 (=> (not res!46491) (not e!59524))))

(assert (=> b!91280 (= res!46491 (bvslt from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(assert (= (and d!24071 c!15151) b!91277))

(assert (= (and d!24071 (not c!15151)) b!91264))

(assert (= (and b!91264 c!15152) b!91278))

(assert (= (and b!91264 (not c!15152)) b!91271))

(assert (= (and b!91271 c!15153) b!91265))

(assert (= (and b!91271 (not c!15153)) b!91272))

(assert (= (or b!91265 b!91272) bm!8920))

(assert (= (or b!91278 bm!8920) bm!8918))

(assert (= (or b!91278 b!91265) bm!8919))

(assert (= (or b!91277 bm!8918) bm!8921))

(assert (= (or b!91277 bm!8919) bm!8922))

(assert (= (and d!24071 res!46486) b!91276))

(assert (= (and d!24071 c!15154) b!91268))

(assert (= (and d!24071 (not c!15154)) b!91273))

(assert (= (and d!24071 res!46488) b!91280))

(assert (= (and b!91280 res!46491) b!91274))

(assert (= (and b!91280 (not res!46490)) b!91279))

(assert (= (and b!91279 res!46489) b!91266))

(assert (= (and b!91280 res!46487) b!91262))

(assert (= (and b!91262 c!15150) b!91267))

(assert (= (and b!91262 (not c!15150)) b!91260))

(assert (= (and b!91267 res!46485) b!91261))

(assert (= (or b!91267 b!91260) bm!8924))

(assert (= (and b!91262 res!46492) b!91270))

(assert (= (and b!91270 c!15155) b!91275))

(assert (= (and b!91270 (not c!15155)) b!91269))

(assert (= (and b!91275 res!46493) b!91263))

(assert (= (or b!91275 b!91269) bm!8923))

(declare-fun b_lambda!4021 () Bool)

(assert (=> (not b_lambda!4021) (not b!91266)))

(assert (=> b!91266 t!5366))

(declare-fun b_and!5527 () Bool)

(assert (= b_and!5523 (and (=> t!5366 result!3063) b_and!5527)))

(assert (=> b!91266 t!5368))

(declare-fun b_and!5529 () Bool)

(assert (= b_and!5525 (and (=> t!5368 result!3067) b_and!5529)))

(declare-fun m!98065 () Bool)

(assert (=> b!91277 m!98065))

(declare-fun m!98067 () Bool)

(assert (=> bm!8924 m!98067))

(assert (=> b!91274 m!97771))

(assert (=> b!91274 m!97771))

(declare-fun m!98069 () Bool)

(assert (=> b!91274 m!98069))

(declare-fun m!98071 () Bool)

(assert (=> bm!8922 m!98071))

(declare-fun m!98073 () Bool)

(assert (=> b!91261 m!98073))

(declare-fun m!98075 () Bool)

(assert (=> b!91268 m!98075))

(declare-fun m!98077 () Bool)

(assert (=> b!91268 m!98077))

(declare-fun m!98079 () Bool)

(assert (=> b!91268 m!98079))

(declare-fun m!98081 () Bool)

(assert (=> b!91268 m!98081))

(declare-fun m!98083 () Bool)

(assert (=> b!91268 m!98083))

(declare-fun m!98085 () Bool)

(assert (=> b!91268 m!98085))

(declare-fun m!98087 () Bool)

(assert (=> b!91268 m!98087))

(assert (=> b!91268 m!98081))

(declare-fun m!98089 () Bool)

(assert (=> b!91268 m!98089))

(declare-fun m!98091 () Bool)

(assert (=> b!91268 m!98091))

(declare-fun m!98093 () Bool)

(assert (=> b!91268 m!98093))

(assert (=> b!91268 m!98077))

(declare-fun m!98095 () Bool)

(assert (=> b!91268 m!98095))

(declare-fun m!98097 () Bool)

(assert (=> b!91268 m!98097))

(declare-fun m!98099 () Bool)

(assert (=> b!91268 m!98099))

(declare-fun m!98101 () Bool)

(assert (=> b!91268 m!98101))

(assert (=> b!91268 m!97771))

(assert (=> b!91268 m!98085))

(declare-fun m!98103 () Bool)

(assert (=> b!91268 m!98103))

(declare-fun m!98105 () Bool)

(assert (=> b!91268 m!98105))

(assert (=> b!91268 m!98099))

(assert (=> d!24071 m!97965))

(assert (=> b!91279 m!97771))

(assert (=> b!91279 m!97771))

(declare-fun m!98107 () Bool)

(assert (=> b!91279 m!98107))

(declare-fun m!98109 () Bool)

(assert (=> bm!8923 m!98109))

(declare-fun m!98111 () Bool)

(assert (=> b!91263 m!98111))

(assert (=> b!91266 m!97821))

(assert (=> b!91266 m!97823))

(assert (=> b!91266 m!97825))

(assert (=> b!91266 m!97821))

(assert (=> b!91266 m!97771))

(declare-fun m!98113 () Bool)

(assert (=> b!91266 m!98113))

(assert (=> b!91266 m!97771))

(assert (=> b!91266 m!97823))

(assert (=> bm!8921 m!98095))

(assert (=> b!91276 m!97771))

(assert (=> b!91276 m!97771))

(assert (=> b!91276 m!98069))

(assert (=> b!90964 d!24071))

(declare-fun d!24073 () Bool)

(declare-fun e!59526 () Bool)

(assert (=> d!24073 e!59526))

(declare-fun res!46495 () Bool)

(assert (=> d!24073 (=> (not res!46495) (not e!59526))))

(declare-fun lt!44494 () ListLongMap!1493)

(assert (=> d!24073 (= res!46495 (contains!773 lt!44494 (_1!1139 lt!44234)))))

(declare-fun lt!44493 () List!1548)

(assert (=> d!24073 (= lt!44494 (ListLongMap!1494 lt!44493))))

(declare-fun lt!44495 () Unit!2706)

(declare-fun lt!44496 () Unit!2706)

(assert (=> d!24073 (= lt!44495 lt!44496)))

(assert (=> d!24073 (= (getValueByKey!144 lt!44493 (_1!1139 lt!44234)) (Some!149 (_2!1139 lt!44234)))))

(assert (=> d!24073 (= lt!44496 (lemmaContainsTupThenGetReturnValue!61 lt!44493 (_1!1139 lt!44234) (_2!1139 lt!44234)))))

(assert (=> d!24073 (= lt!44493 (insertStrictlySorted!64 (toList!762 lt!44231) (_1!1139 lt!44234) (_2!1139 lt!44234)))))

(assert (=> d!24073 (= (+!124 lt!44231 lt!44234) lt!44494)))

(declare-fun b!91281 () Bool)

(declare-fun res!46494 () Bool)

(assert (=> b!91281 (=> (not res!46494) (not e!59526))))

(assert (=> b!91281 (= res!46494 (= (getValueByKey!144 (toList!762 lt!44494) (_1!1139 lt!44234)) (Some!149 (_2!1139 lt!44234))))))

(declare-fun b!91282 () Bool)

(assert (=> b!91282 (= e!59526 (contains!775 (toList!762 lt!44494) lt!44234))))

(assert (= (and d!24073 res!46495) b!91281))

(assert (= (and b!91281 res!46494) b!91282))

(declare-fun m!98115 () Bool)

(assert (=> d!24073 m!98115))

(declare-fun m!98117 () Bool)

(assert (=> d!24073 m!98117))

(declare-fun m!98119 () Bool)

(assert (=> d!24073 m!98119))

(declare-fun m!98121 () Bool)

(assert (=> d!24073 m!98121))

(declare-fun m!98123 () Bool)

(assert (=> b!91281 m!98123))

(declare-fun m!98125 () Bool)

(assert (=> b!91282 m!98125))

(assert (=> b!90964 d!24073))

(declare-fun d!24075 () Bool)

(declare-fun e!59527 () Bool)

(assert (=> d!24075 e!59527))

(declare-fun res!46497 () Bool)

(assert (=> d!24075 (=> (not res!46497) (not e!59527))))

(declare-fun lt!44498 () ListLongMap!1493)

(assert (=> d!24075 (= res!46497 (contains!773 lt!44498 (_1!1139 lt!44226)))))

(declare-fun lt!44497 () List!1548)

(assert (=> d!24075 (= lt!44498 (ListLongMap!1494 lt!44497))))

(declare-fun lt!44499 () Unit!2706)

(declare-fun lt!44500 () Unit!2706)

(assert (=> d!24075 (= lt!44499 lt!44500)))

(assert (=> d!24075 (= (getValueByKey!144 lt!44497 (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226)))))

(assert (=> d!24075 (= lt!44500 (lemmaContainsTupThenGetReturnValue!61 lt!44497 (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24075 (= lt!44497 (insertStrictlySorted!64 (toList!762 lt!44235) (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24075 (= (+!124 lt!44235 lt!44226) lt!44498)))

(declare-fun b!91283 () Bool)

(declare-fun res!46496 () Bool)

(assert (=> b!91283 (=> (not res!46496) (not e!59527))))

(assert (=> b!91283 (= res!46496 (= (getValueByKey!144 (toList!762 lt!44498) (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226))))))

(declare-fun b!91284 () Bool)

(assert (=> b!91284 (= e!59527 (contains!775 (toList!762 lt!44498) lt!44226))))

(assert (= (and d!24075 res!46497) b!91283))

(assert (= (and b!91283 res!46496) b!91284))

(declare-fun m!98127 () Bool)

(assert (=> d!24075 m!98127))

(declare-fun m!98129 () Bool)

(assert (=> d!24075 m!98129))

(declare-fun m!98131 () Bool)

(assert (=> d!24075 m!98131))

(declare-fun m!98133 () Bool)

(assert (=> d!24075 m!98133))

(declare-fun m!98135 () Bool)

(assert (=> b!91283 m!98135))

(declare-fun m!98137 () Bool)

(assert (=> b!91284 m!98137))

(assert (=> b!90964 d!24075))

(declare-fun d!24077 () Bool)

(declare-fun e!59528 () Bool)

(assert (=> d!24077 e!59528))

(declare-fun res!46499 () Bool)

(assert (=> d!24077 (=> (not res!46499) (not e!59528))))

(declare-fun lt!44502 () ListLongMap!1493)

(assert (=> d!24077 (= res!46499 (contains!773 lt!44502 (_1!1139 lt!44232)))))

(declare-fun lt!44501 () List!1548)

(assert (=> d!24077 (= lt!44502 (ListLongMap!1494 lt!44501))))

(declare-fun lt!44503 () Unit!2706)

(declare-fun lt!44504 () Unit!2706)

(assert (=> d!24077 (= lt!44503 lt!44504)))

(assert (=> d!24077 (= (getValueByKey!144 lt!44501 (_1!1139 lt!44232)) (Some!149 (_2!1139 lt!44232)))))

(assert (=> d!24077 (= lt!44504 (lemmaContainsTupThenGetReturnValue!61 lt!44501 (_1!1139 lt!44232) (_2!1139 lt!44232)))))

(assert (=> d!24077 (= lt!44501 (insertStrictlySorted!64 (toList!762 lt!44235) (_1!1139 lt!44232) (_2!1139 lt!44232)))))

(assert (=> d!24077 (= (+!124 lt!44235 lt!44232) lt!44502)))

(declare-fun b!91285 () Bool)

(declare-fun res!46498 () Bool)

(assert (=> b!91285 (=> (not res!46498) (not e!59528))))

(assert (=> b!91285 (= res!46498 (= (getValueByKey!144 (toList!762 lt!44502) (_1!1139 lt!44232)) (Some!149 (_2!1139 lt!44232))))))

(declare-fun b!91286 () Bool)

(assert (=> b!91286 (= e!59528 (contains!775 (toList!762 lt!44502) lt!44232))))

(assert (= (and d!24077 res!46499) b!91285))

(assert (= (and b!91285 res!46498) b!91286))

(declare-fun m!98139 () Bool)

(assert (=> d!24077 m!98139))

(declare-fun m!98141 () Bool)

(assert (=> d!24077 m!98141))

(declare-fun m!98143 () Bool)

(assert (=> d!24077 m!98143))

(declare-fun m!98145 () Bool)

(assert (=> d!24077 m!98145))

(declare-fun m!98147 () Bool)

(assert (=> b!91285 m!98147))

(declare-fun m!98149 () Bool)

(assert (=> b!91286 m!98149))

(assert (=> b!90964 d!24077))

(declare-fun d!24079 () Bool)

(declare-fun e!59529 () Bool)

(assert (=> d!24079 e!59529))

(declare-fun res!46501 () Bool)

(assert (=> d!24079 (=> (not res!46501) (not e!59529))))

(declare-fun lt!44506 () ListLongMap!1493)

(assert (=> d!24079 (= res!46501 (contains!773 lt!44506 (_1!1139 lt!44226)))))

(declare-fun lt!44505 () List!1548)

(assert (=> d!24079 (= lt!44506 (ListLongMap!1494 lt!44505))))

(declare-fun lt!44507 () Unit!2706)

(declare-fun lt!44508 () Unit!2706)

(assert (=> d!24079 (= lt!44507 lt!44508)))

(assert (=> d!24079 (= (getValueByKey!144 lt!44505 (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226)))))

(assert (=> d!24079 (= lt!44508 (lemmaContainsTupThenGetReturnValue!61 lt!44505 (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24079 (= lt!44505 (insertStrictlySorted!64 (toList!762 (+!124 lt!44235 lt!44232)) (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24079 (= (+!124 (+!124 lt!44235 lt!44232) lt!44226) lt!44506)))

(declare-fun b!91287 () Bool)

(declare-fun res!46500 () Bool)

(assert (=> b!91287 (=> (not res!46500) (not e!59529))))

(assert (=> b!91287 (= res!46500 (= (getValueByKey!144 (toList!762 lt!44506) (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226))))))

(declare-fun b!91288 () Bool)

(assert (=> b!91288 (= e!59529 (contains!775 (toList!762 lt!44506) lt!44226))))

(assert (= (and d!24079 res!46501) b!91287))

(assert (= (and b!91287 res!46500) b!91288))

(declare-fun m!98151 () Bool)

(assert (=> d!24079 m!98151))

(declare-fun m!98153 () Bool)

(assert (=> d!24079 m!98153))

(declare-fun m!98155 () Bool)

(assert (=> d!24079 m!98155))

(declare-fun m!98157 () Bool)

(assert (=> d!24079 m!98157))

(declare-fun m!98159 () Bool)

(assert (=> b!91287 m!98159))

(declare-fun m!98161 () Bool)

(assert (=> b!91288 m!98161))

(assert (=> b!90964 d!24079))

(declare-fun d!24081 () Bool)

(declare-fun e!59530 () Bool)

(assert (=> d!24081 e!59530))

(declare-fun res!46503 () Bool)

(assert (=> d!24081 (=> (not res!46503) (not e!59530))))

(declare-fun lt!44510 () ListLongMap!1493)

(assert (=> d!24081 (= res!46503 (contains!773 lt!44510 (_1!1139 lt!44226)))))

(declare-fun lt!44509 () List!1548)

(assert (=> d!24081 (= lt!44510 (ListLongMap!1494 lt!44509))))

(declare-fun lt!44511 () Unit!2706)

(declare-fun lt!44512 () Unit!2706)

(assert (=> d!24081 (= lt!44511 lt!44512)))

(assert (=> d!24081 (= (getValueByKey!144 lt!44509 (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226)))))

(assert (=> d!24081 (= lt!44512 (lemmaContainsTupThenGetReturnValue!61 lt!44509 (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24081 (= lt!44509 (insertStrictlySorted!64 (toList!762 lt!44231) (_1!1139 lt!44226) (_2!1139 lt!44226)))))

(assert (=> d!24081 (= (+!124 lt!44231 lt!44226) lt!44510)))

(declare-fun b!91289 () Bool)

(declare-fun res!46502 () Bool)

(assert (=> b!91289 (=> (not res!46502) (not e!59530))))

(assert (=> b!91289 (= res!46502 (= (getValueByKey!144 (toList!762 lt!44510) (_1!1139 lt!44226)) (Some!149 (_2!1139 lt!44226))))))

(declare-fun b!91290 () Bool)

(assert (=> b!91290 (= e!59530 (contains!775 (toList!762 lt!44510) lt!44226))))

(assert (= (and d!24081 res!46503) b!91289))

(assert (= (and b!91289 res!46502) b!91290))

(declare-fun m!98163 () Bool)

(assert (=> d!24081 m!98163))

(declare-fun m!98165 () Bool)

(assert (=> d!24081 m!98165))

(declare-fun m!98167 () Bool)

(assert (=> d!24081 m!98167))

(declare-fun m!98169 () Bool)

(assert (=> d!24081 m!98169))

(declare-fun m!98171 () Bool)

(assert (=> b!91289 m!98171))

(declare-fun m!98173 () Bool)

(assert (=> b!91290 m!98173))

(assert (=> b!90964 d!24081))

(declare-fun b!91315 () Bool)

(declare-fun e!59547 () Bool)

(declare-fun e!59550 () Bool)

(assert (=> b!91315 (= e!59547 e!59550)))

(declare-fun c!15166 () Bool)

(declare-fun e!59549 () Bool)

(assert (=> b!91315 (= c!15166 e!59549)))

(declare-fun res!46514 () Bool)

(assert (=> b!91315 (=> (not res!46514) (not e!59549))))

(assert (=> b!91315 (= res!46514 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91316 () Bool)

(declare-fun e!59545 () Bool)

(declare-fun lt!44531 () ListLongMap!1493)

(declare-fun isEmpty!345 (ListLongMap!1493) Bool)

(assert (=> b!91316 (= e!59545 (isEmpty!345 lt!44531))))

(declare-fun b!91317 () Bool)

(assert (=> b!91317 (= e!59549 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91317 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!91318 () Bool)

(assert (=> b!91318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(assert (=> b!91318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2209 (_values!2383 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun e!59548 () Bool)

(assert (=> b!91318 (= e!59548 (= (apply!86 lt!44531 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91319 () Bool)

(assert (=> b!91319 (= e!59550 e!59548)))

(assert (=> b!91319 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun res!46513 () Bool)

(assert (=> b!91319 (= res!46513 (contains!773 lt!44531 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91319 (=> (not res!46513) (not e!59548))))

(declare-fun bm!8927 () Bool)

(declare-fun call!8930 () ListLongMap!1493)

(assert (=> bm!8927 (= call!8930 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(declare-fun b!91320 () Bool)

(declare-fun e!59546 () ListLongMap!1493)

(declare-fun e!59551 () ListLongMap!1493)

(assert (=> b!91320 (= e!59546 e!59551)))

(declare-fun c!15164 () Bool)

(assert (=> b!91320 (= c!15164 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91321 () Bool)

(assert (=> b!91321 (= e!59551 call!8930)))

(declare-fun b!91322 () Bool)

(declare-fun lt!44532 () Unit!2706)

(declare-fun lt!44529 () Unit!2706)

(assert (=> b!91322 (= lt!44532 lt!44529)))

(declare-fun lt!44533 () (_ BitVec 64))

(declare-fun lt!44530 () V!3083)

(declare-fun lt!44527 () (_ BitVec 64))

(declare-fun lt!44528 () ListLongMap!1493)

(assert (=> b!91322 (not (contains!773 (+!124 lt!44528 (tuple2!2257 lt!44527 lt!44530)) lt!44533))))

(declare-fun addStillNotContains!35 (ListLongMap!1493 (_ BitVec 64) V!3083 (_ BitVec 64)) Unit!2706)

(assert (=> b!91322 (= lt!44529 (addStillNotContains!35 lt!44528 lt!44527 lt!44530 lt!44533))))

(assert (=> b!91322 (= lt!44533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91322 (= lt!44530 (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91322 (= lt!44527 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91322 (= lt!44528 call!8930)))

(assert (=> b!91322 (= e!59551 (+!124 call!8930 (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!91324 () Bool)

(declare-fun res!46515 () Bool)

(assert (=> b!91324 (=> (not res!46515) (not e!59547))))

(assert (=> b!91324 (= res!46515 (not (contains!773 lt!44531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91325 () Bool)

(assert (=> b!91325 (= e!59546 (ListLongMap!1494 Nil!1545))))

(declare-fun b!91326 () Bool)

(assert (=> b!91326 (= e!59550 e!59545)))

(declare-fun c!15167 () Bool)

(assert (=> b!91326 (= c!15167 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91323 () Bool)

(assert (=> b!91323 (= e!59545 (= lt!44531 (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun d!24083 () Bool)

(assert (=> d!24083 e!59547))

(declare-fun res!46512 () Bool)

(assert (=> d!24083 (=> (not res!46512) (not e!59547))))

(assert (=> d!24083 (= res!46512 (not (contains!773 lt!44531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24083 (= lt!44531 e!59546)))

(declare-fun c!15165 () Bool)

(assert (=> d!24083 (= c!15165 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(assert (=> d!24083 (validMask!0 (mask!6458 (v!2713 (underlying!310 thiss!992))))))

(assert (=> d!24083 (= (getCurrentListMapNoExtraKeys!89 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) lt!44531)))

(assert (= (and d!24083 c!15165) b!91325))

(assert (= (and d!24083 (not c!15165)) b!91320))

(assert (= (and b!91320 c!15164) b!91322))

(assert (= (and b!91320 (not c!15164)) b!91321))

(assert (= (or b!91322 b!91321) bm!8927))

(assert (= (and d!24083 res!46512) b!91324))

(assert (= (and b!91324 res!46515) b!91315))

(assert (= (and b!91315 res!46514) b!91317))

(assert (= (and b!91315 c!15166) b!91319))

(assert (= (and b!91315 (not c!15166)) b!91326))

(assert (= (and b!91319 res!46513) b!91318))

(assert (= (and b!91326 c!15167) b!91323))

(assert (= (and b!91326 (not c!15167)) b!91316))

(declare-fun b_lambda!4023 () Bool)

(assert (=> (not b_lambda!4023) (not b!91318)))

(assert (=> b!91318 t!5366))

(declare-fun b_and!5531 () Bool)

(assert (= b_and!5527 (and (=> t!5366 result!3063) b_and!5531)))

(assert (=> b!91318 t!5368))

(declare-fun b_and!5533 () Bool)

(assert (= b_and!5529 (and (=> t!5368 result!3067) b_and!5533)))

(declare-fun b_lambda!4025 () Bool)

(assert (=> (not b_lambda!4025) (not b!91322)))

(assert (=> b!91322 t!5366))

(declare-fun b_and!5535 () Bool)

(assert (= b_and!5531 (and (=> t!5366 result!3063) b_and!5535)))

(assert (=> b!91322 t!5368))

(declare-fun b_and!5537 () Bool)

(assert (= b_and!5533 (and (=> t!5368 result!3067) b_and!5537)))

(assert (=> b!91319 m!97927))

(assert (=> b!91319 m!97927))

(declare-fun m!98175 () Bool)

(assert (=> b!91319 m!98175))

(declare-fun m!98177 () Bool)

(assert (=> bm!8927 m!98177))

(assert (=> b!91318 m!97973))

(assert (=> b!91318 m!97823))

(assert (=> b!91318 m!97975))

(assert (=> b!91318 m!97973))

(assert (=> b!91318 m!97927))

(declare-fun m!98179 () Bool)

(assert (=> b!91318 m!98179))

(assert (=> b!91318 m!97823))

(assert (=> b!91318 m!97927))

(assert (=> b!91320 m!97927))

(assert (=> b!91320 m!97927))

(assert (=> b!91320 m!97929))

(assert (=> b!91323 m!98177))

(assert (=> b!91322 m!97973))

(assert (=> b!91322 m!97823))

(assert (=> b!91322 m!97975))

(declare-fun m!98181 () Bool)

(assert (=> b!91322 m!98181))

(declare-fun m!98183 () Bool)

(assert (=> b!91322 m!98183))

(declare-fun m!98185 () Bool)

(assert (=> b!91322 m!98185))

(declare-fun m!98187 () Bool)

(assert (=> b!91322 m!98187))

(assert (=> b!91322 m!98181))

(assert (=> b!91322 m!97973))

(assert (=> b!91322 m!97823))

(assert (=> b!91322 m!97927))

(declare-fun m!98189 () Bool)

(assert (=> b!91324 m!98189))

(assert (=> b!91317 m!97927))

(assert (=> b!91317 m!97927))

(assert (=> b!91317 m!97929))

(declare-fun m!98191 () Bool)

(assert (=> b!91316 m!98191))

(declare-fun m!98193 () Bool)

(assert (=> d!24083 m!98193))

(assert (=> d!24083 m!97965))

(assert (=> b!90964 d!24083))

(declare-fun d!24085 () Bool)

(assert (=> d!24085 (= (map!1217 (_2!1138 lt!44228)) (getCurrentListMap!454 (_keys!4080 (_2!1138 lt!44228)) (_values!2383 (_2!1138 lt!44228)) (mask!6458 (_2!1138 lt!44228)) (extraKeys!2231 (_2!1138 lt!44228)) (zeroValue!2288 (_2!1138 lt!44228)) (minValue!2288 (_2!1138 lt!44228)) #b00000000000000000000000000000000 (defaultEntry!2400 (_2!1138 lt!44228))))))

(declare-fun bs!3797 () Bool)

(assert (= bs!3797 d!24085))

(declare-fun m!98195 () Bool)

(assert (=> bs!3797 m!98195))

(assert (=> b!90964 d!24085))

(declare-fun d!24087 () Bool)

(assert (=> d!24087 (= (+!124 (+!124 lt!44235 (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233)) (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) (+!124 (+!124 lt!44235 (tuple2!2257 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992))))) (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233)))))

(declare-fun lt!44536 () Unit!2706)

(declare-fun choose!541 (ListLongMap!1493 (_ BitVec 64) V!3083 (_ BitVec 64) V!3083) Unit!2706)

(assert (=> d!24087 (= lt!44536 (choose!541 lt!44235 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(assert (=> d!24087 (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24087 (= (addCommutativeForDiffKeys!43 lt!44235 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2288 (v!2713 (underlying!310 thiss!992)))) lt!44536)))

(declare-fun bs!3798 () Bool)

(assert (= bs!3798 d!24087))

(declare-fun m!98197 () Bool)

(assert (=> bs!3798 m!98197))

(declare-fun m!98199 () Bool)

(assert (=> bs!3798 m!98199))

(declare-fun m!98201 () Bool)

(assert (=> bs!3798 m!98201))

(declare-fun m!98203 () Bool)

(assert (=> bs!3798 m!98203))

(assert (=> bs!3798 m!98197))

(assert (=> bs!3798 m!98201))

(assert (=> bs!3798 m!97771))

(declare-fun m!98205 () Bool)

(assert (=> bs!3798 m!98205))

(assert (=> b!90964 d!24087))

(declare-fun d!24089 () Bool)

(assert (=> d!24089 (= (+!124 (+!124 lt!44231 (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233)) (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) (+!124 (+!124 lt!44231 (tuple2!2257 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992))))) (tuple2!2257 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233)))))

(declare-fun lt!44537 () Unit!2706)

(assert (=> d!24089 (= lt!44537 (choose!541 lt!44231 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))))))

(assert (=> d!24089 (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24089 (= (addCommutativeForDiffKeys!43 lt!44231 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) lt!44233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2288 (v!2713 (underlying!310 thiss!992)))) lt!44537)))

(declare-fun bs!3799 () Bool)

(assert (= bs!3799 d!24089))

(declare-fun m!98207 () Bool)

(assert (=> bs!3799 m!98207))

(declare-fun m!98209 () Bool)

(assert (=> bs!3799 m!98209))

(declare-fun m!98211 () Bool)

(assert (=> bs!3799 m!98211))

(declare-fun m!98213 () Bool)

(assert (=> bs!3799 m!98213))

(assert (=> bs!3799 m!98207))

(assert (=> bs!3799 m!98211))

(assert (=> bs!3799 m!97771))

(declare-fun m!98215 () Bool)

(assert (=> bs!3799 m!98215))

(assert (=> b!90964 d!24089))

(declare-fun d!24091 () Bool)

(declare-fun c!15170 () Bool)

(assert (=> d!24091 (= c!15170 ((_ is ValueCellFull!945) (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun e!59554 () V!3083)

(assert (=> d!24091 (= (get!1232 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59554)))

(declare-fun b!91331 () Bool)

(declare-fun get!1233 (ValueCell!945 V!3083) V!3083)

(assert (=> b!91331 (= e!59554 (get!1233 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91332 () Bool)

(declare-fun get!1234 (ValueCell!945 V!3083) V!3083)

(assert (=> b!91332 (= e!59554 (get!1234 (select (arr!1962 (_values!2383 (v!2713 (underlying!310 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24091 c!15170) b!91331))

(assert (= (and d!24091 (not c!15170)) b!91332))

(assert (=> b!91331 m!97821))

(assert (=> b!91331 m!97823))

(declare-fun m!98217 () Bool)

(assert (=> b!91331 m!98217))

(assert (=> b!91332 m!97821))

(assert (=> b!91332 m!97823))

(declare-fun m!98219 () Bool)

(assert (=> b!91332 m!98219))

(assert (=> b!90967 d!24091))

(declare-fun d!24093 () Bool)

(assert (=> d!24093 (= (array_inv!1215 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvsge (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90979 d!24093))

(declare-fun d!24095 () Bool)

(assert (=> d!24095 (= (array_inv!1216 (_values!2383 (v!2713 (underlying!310 thiss!992)))) (bvsge (size!2209 (_values!2383 (v!2713 (underlying!310 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90979 d!24095))

(declare-fun d!24097 () Bool)

(assert (=> d!24097 (= (array_inv!1215 (_keys!4080 newMap!16)) (bvsge (size!2208 (_keys!4080 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90976 d!24097))

(declare-fun d!24099 () Bool)

(assert (=> d!24099 (= (array_inv!1216 (_values!2383 newMap!16)) (bvsge (size!2209 (_values!2383 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90976 d!24099))

(declare-fun d!24101 () Bool)

(assert (=> d!24101 (not (arrayContainsKey!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44540 () Unit!2706)

(declare-fun choose!68 (array!4121 (_ BitVec 32) (_ BitVec 64) List!1547) Unit!2706)

(assert (=> d!24101 (= lt!44540 (choose!68 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (Cons!1543 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) Nil!1544)))))

(assert (=> d!24101 (bvslt (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24101 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (Cons!1543 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) Nil!1544)) lt!44540)))

(declare-fun bs!3800 () Bool)

(assert (= bs!3800 d!24101))

(assert (=> bs!3800 m!97771))

(assert (=> bs!3800 m!97775))

(assert (=> bs!3800 m!97771))

(declare-fun m!98221 () Bool)

(assert (=> bs!3800 m!98221))

(assert (=> b!90962 d!24101))

(declare-fun d!24103 () Bool)

(assert (=> d!24103 (arrayNoDuplicates!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) from!355 Nil!1544)))

(declare-fun lt!44543 () Unit!2706)

(declare-fun choose!39 (array!4121 (_ BitVec 32) (_ BitVec 32)) Unit!2706)

(assert (=> d!24103 (= lt!44543 (choose!39 (_keys!4080 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24103 (bvslt (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24103 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44543)))

(declare-fun bs!3801 () Bool)

(assert (= bs!3801 d!24103))

(assert (=> bs!3801 m!97769))

(declare-fun m!98223 () Bool)

(assert (=> bs!3801 m!98223))

(assert (=> b!90962 d!24103))

(declare-fun d!24105 () Bool)

(declare-fun res!46520 () Bool)

(declare-fun e!59559 () Bool)

(assert (=> d!24105 (=> res!46520 e!59559)))

(assert (=> d!24105 (= res!46520 (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(assert (=> d!24105 (= (arrayContainsKey!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59559)))

(declare-fun b!91337 () Bool)

(declare-fun e!59560 () Bool)

(assert (=> b!91337 (= e!59559 e!59560)))

(declare-fun res!46521 () Bool)

(assert (=> b!91337 (=> (not res!46521) (not e!59560))))

(assert (=> b!91337 (= res!46521 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(declare-fun b!91338 () Bool)

(assert (=> b!91338 (= e!59560 (arrayContainsKey!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24105 (not res!46520)) b!91337))

(assert (= (and b!91337 res!46521) b!91338))

(assert (=> d!24105 m!97927))

(assert (=> b!91338 m!97771))

(declare-fun m!98225 () Bool)

(assert (=> b!91338 m!98225))

(assert (=> b!90962 d!24105))

(declare-fun d!24107 () Bool)

(declare-fun e!59563 () Bool)

(assert (=> d!24107 e!59563))

(declare-fun c!15173 () Bool)

(assert (=> d!24107 (= c!15173 (and (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44546 () Unit!2706)

(declare-fun choose!542 (array!4121 array!4123 (_ BitVec 32) (_ BitVec 32) V!3083 V!3083 (_ BitVec 64) (_ BitVec 32) Int) Unit!2706)

(assert (=> d!24107 (= lt!44546 (choose!542 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))))))

(assert (=> d!24107 (validMask!0 (mask!6458 (v!2713 (underlying!310 thiss!992))))))

(assert (=> d!24107 (= (lemmaListMapContainsThenArrayContainsFrom!77 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (_values!2383 (v!2713 (underlying!310 thiss!992))) (mask!6458 (v!2713 (underlying!310 thiss!992))) (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) (zeroValue!2288 (v!2713 (underlying!310 thiss!992))) (minValue!2288 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992)))) lt!44546)))

(declare-fun b!91343 () Bool)

(assert (=> b!91343 (= e!59563 (arrayContainsKey!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91344 () Bool)

(assert (=> b!91344 (= e!59563 (ite (= (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2231 (v!2713 (underlying!310 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24107 c!15173) b!91343))

(assert (= (and d!24107 (not c!15173)) b!91344))

(assert (=> d!24107 m!97771))

(declare-fun m!98227 () Bool)

(assert (=> d!24107 m!98227))

(assert (=> d!24107 m!97965))

(assert (=> b!91343 m!97771))

(assert (=> b!91343 m!97775))

(assert (=> b!90962 d!24107))

(declare-fun b!91355 () Bool)

(declare-fun e!59572 () Bool)

(declare-fun e!59575 () Bool)

(assert (=> b!91355 (= e!59572 e!59575)))

(declare-fun c!15176 () Bool)

(assert (=> b!91355 (= c!15176 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun call!8933 () Bool)

(declare-fun bm!8930 () Bool)

(assert (=> bm!8930 (= call!8933 (arrayNoDuplicates!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15176 (Cons!1543 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355) Nil!1544) Nil!1544)))))

(declare-fun d!24109 () Bool)

(declare-fun res!46528 () Bool)

(declare-fun e!59574 () Bool)

(assert (=> d!24109 (=> res!46528 e!59574)))

(assert (=> d!24109 (= res!46528 (bvsge from!355 (size!2208 (_keys!4080 (v!2713 (underlying!310 thiss!992))))))))

(assert (=> d!24109 (= (arrayNoDuplicates!0 (_keys!4080 (v!2713 (underlying!310 thiss!992))) from!355 Nil!1544) e!59574)))

(declare-fun b!91356 () Bool)

(declare-fun e!59573 () Bool)

(declare-fun contains!776 (List!1547 (_ BitVec 64)) Bool)

(assert (=> b!91356 (= e!59573 (contains!776 Nil!1544 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun b!91357 () Bool)

(assert (=> b!91357 (= e!59574 e!59572)))

(declare-fun res!46530 () Bool)

(assert (=> b!91357 (=> (not res!46530) (not e!59572))))

(assert (=> b!91357 (= res!46530 (not e!59573))))

(declare-fun res!46529 () Bool)

(assert (=> b!91357 (=> (not res!46529) (not e!59573))))

(assert (=> b!91357 (= res!46529 (validKeyInArray!0 (select (arr!1961 (_keys!4080 (v!2713 (underlying!310 thiss!992)))) from!355)))))

(declare-fun b!91358 () Bool)

(assert (=> b!91358 (= e!59575 call!8933)))

(declare-fun b!91359 () Bool)

(assert (=> b!91359 (= e!59575 call!8933)))

(assert (= (and d!24109 (not res!46528)) b!91357))

(assert (= (and b!91357 res!46529) b!91356))

(assert (= (and b!91357 res!46530) b!91355))

(assert (= (and b!91355 c!15176) b!91358))

(assert (= (and b!91355 (not c!15176)) b!91359))

(assert (= (or b!91358 b!91359) bm!8930))

(assert (=> b!91355 m!97771))

(assert (=> b!91355 m!97771))

(assert (=> b!91355 m!98069))

(assert (=> bm!8930 m!97771))

(declare-fun m!98229 () Bool)

(assert (=> bm!8930 m!98229))

(assert (=> b!91356 m!97771))

(assert (=> b!91356 m!97771))

(declare-fun m!98231 () Bool)

(assert (=> b!91356 m!98231))

(assert (=> b!91357 m!97771))

(assert (=> b!91357 m!97771))

(assert (=> b!91357 m!98069))

(assert (=> b!90962 d!24109))

(declare-fun b!91367 () Bool)

(declare-fun e!59580 () Bool)

(assert (=> b!91367 (= e!59580 tp_is_empty!2577)))

(declare-fun mapIsEmpty!3559 () Bool)

(declare-fun mapRes!3559 () Bool)

(assert (=> mapIsEmpty!3559 mapRes!3559))

(declare-fun condMapEmpty!3559 () Bool)

(declare-fun mapDefault!3559 () ValueCell!945)

(assert (=> mapNonEmpty!3550 (= condMapEmpty!3559 (= mapRest!3550 ((as const (Array (_ BitVec 32) ValueCell!945)) mapDefault!3559)))))

(assert (=> mapNonEmpty!3550 (= tp!9214 (and e!59580 mapRes!3559))))

(declare-fun mapNonEmpty!3559 () Bool)

(declare-fun tp!9229 () Bool)

(declare-fun e!59581 () Bool)

(assert (=> mapNonEmpty!3559 (= mapRes!3559 (and tp!9229 e!59581))))

(declare-fun mapValue!3559 () ValueCell!945)

(declare-fun mapKey!3559 () (_ BitVec 32))

(declare-fun mapRest!3559 () (Array (_ BitVec 32) ValueCell!945))

(assert (=> mapNonEmpty!3559 (= mapRest!3550 (store mapRest!3559 mapKey!3559 mapValue!3559))))

(declare-fun b!91366 () Bool)

(assert (=> b!91366 (= e!59581 tp_is_empty!2577)))

(assert (= (and mapNonEmpty!3550 condMapEmpty!3559) mapIsEmpty!3559))

(assert (= (and mapNonEmpty!3550 (not condMapEmpty!3559)) mapNonEmpty!3559))

(assert (= (and mapNonEmpty!3559 ((_ is ValueCellFull!945) mapValue!3559)) b!91366))

(assert (= (and mapNonEmpty!3550 ((_ is ValueCellFull!945) mapDefault!3559)) b!91367))

(declare-fun m!98233 () Bool)

(assert (=> mapNonEmpty!3559 m!98233))

(declare-fun b!91369 () Bool)

(declare-fun e!59582 () Bool)

(assert (=> b!91369 (= e!59582 tp_is_empty!2577)))

(declare-fun mapIsEmpty!3560 () Bool)

(declare-fun mapRes!3560 () Bool)

(assert (=> mapIsEmpty!3560 mapRes!3560))

(declare-fun condMapEmpty!3560 () Bool)

(declare-fun mapDefault!3560 () ValueCell!945)

(assert (=> mapNonEmpty!3549 (= condMapEmpty!3560 (= mapRest!3549 ((as const (Array (_ BitVec 32) ValueCell!945)) mapDefault!3560)))))

(assert (=> mapNonEmpty!3549 (= tp!9213 (and e!59582 mapRes!3560))))

(declare-fun mapNonEmpty!3560 () Bool)

(declare-fun tp!9230 () Bool)

(declare-fun e!59583 () Bool)

(assert (=> mapNonEmpty!3560 (= mapRes!3560 (and tp!9230 e!59583))))

(declare-fun mapKey!3560 () (_ BitVec 32))

(declare-fun mapValue!3560 () ValueCell!945)

(declare-fun mapRest!3560 () (Array (_ BitVec 32) ValueCell!945))

(assert (=> mapNonEmpty!3560 (= mapRest!3549 (store mapRest!3560 mapKey!3560 mapValue!3560))))

(declare-fun b!91368 () Bool)

(assert (=> b!91368 (= e!59583 tp_is_empty!2577)))

(assert (= (and mapNonEmpty!3549 condMapEmpty!3560) mapIsEmpty!3560))

(assert (= (and mapNonEmpty!3549 (not condMapEmpty!3560)) mapNonEmpty!3560))

(assert (= (and mapNonEmpty!3560 ((_ is ValueCellFull!945) mapValue!3560)) b!91368))

(assert (= (and mapNonEmpty!3549 ((_ is ValueCellFull!945) mapDefault!3560)) b!91369))

(declare-fun m!98235 () Bool)

(assert (=> mapNonEmpty!3560 m!98235))

(declare-fun b_lambda!4027 () Bool)

(assert (= b_lambda!4019 (or (and b!90979 b_free!2321) (and b!90976 b_free!2323 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))) b_lambda!4027)))

(declare-fun b_lambda!4029 () Bool)

(assert (= b_lambda!4025 (or (and b!90979 b_free!2321) (and b!90976 b_free!2323 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))) b_lambda!4029)))

(declare-fun b_lambda!4031 () Bool)

(assert (= b_lambda!4021 (or (and b!90979 b_free!2321) (and b!90976 b_free!2323 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))) b_lambda!4031)))

(declare-fun b_lambda!4033 () Bool)

(assert (= b_lambda!4023 (or (and b!90979 b_free!2321) (and b!90976 b_free!2323 (= (defaultEntry!2400 newMap!16) (defaultEntry!2400 (v!2713 (underlying!310 thiss!992))))) b_lambda!4033)))

(check-sat (not b!91118) (not b!91316) (not b!91324) (not b!91108) (not d!24059) (not bm!8898) (not d!24079) (not d!24107) (not d!24075) (not b!91338) (not b!91257) (not bm!8901) (not d!24065) (not b!91317) (not bm!8930) (not b!91105) (not b!91284) (not b!91323) (not b_next!2323) (not bm!8916) (not d!24073) (not b!91290) (not bm!8844) (not bm!8915) (not b!91357) (not b!91054) (not bm!8894) (not mapNonEmpty!3559) (not bm!8843) (not d!24081) (not b!91121) (not b!91318) (not b_next!2321) (not bm!8912) (not b!91241) (not bm!8917) (not b!91343) (not d!24053) (not b!91242) (not d!24077) (not b!91110) (not b!91322) (not b!91282) (not bm!8914) (not b!91319) (not b!91355) (not b!91263) (not b!91103) (not bm!8845) (not b!91281) (not bm!8908) (not b!91116) (not b!91266) (not d!24067) (not d!24057) (not b!91277) (not b!91283) (not d!24101) (not b!91243) (not d!24085) (not b!91331) (not d!24055) (not b!91055) (not b!91131) (not b!91217) (not b!91259) (not b!91332) (not b!91279) (not b!91274) (not b!91286) (not b!91230) (not b!91129) (not b!91212) (not d!24069) (not bm!8842) (not b!91288) (not b!91059) (not b!91056) (not d!24071) (not b!91285) (not b_lambda!4029) (not bm!8921) (not d!24087) (not bm!8924) (not b!91225) (not bm!8906) (not d!24063) (not bm!8903) (not b_lambda!4033) (not d!24103) (not bm!8923) (not b!91261) (not d!24083) (not b!91320) (not b!91276) (not bm!8922) (not b!91119) (not b!91289) (not b_lambda!4027) (not b!91256) (not b!91356) (not b!91268) b_and!5535 b_and!5537 (not mapNonEmpty!3560) (not b!91258) tp_is_empty!2577 (not b!91057) (not b!91287) (not b!91058) (not d!24089) (not bm!8927) (not d!24061) (not bm!8905) (not b_lambda!4017) (not b_lambda!4031))
(check-sat b_and!5535 b_and!5537 (not b_next!2321) (not b_next!2323))
