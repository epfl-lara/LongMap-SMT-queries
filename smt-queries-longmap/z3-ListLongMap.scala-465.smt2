; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8720 () Bool)

(assert start!8720)

(declare-fun b!60230 () Bool)

(declare-fun b_free!1969 () Bool)

(declare-fun b_next!1969 () Bool)

(assert (=> b!60230 (= b_free!1969 (not b_next!1969))))

(declare-fun tp!8028 () Bool)

(declare-fun b_and!3649 () Bool)

(assert (=> b!60230 (= tp!8028 b_and!3649)))

(declare-fun b!60225 () Bool)

(declare-fun b_free!1971 () Bool)

(declare-fun b_next!1971 () Bool)

(assert (=> b!60225 (= b_free!1971 (not b_next!1971))))

(declare-fun tp!8029 () Bool)

(declare-fun b_and!3651 () Bool)

(assert (=> b!60225 (= tp!8029 b_and!3651)))

(declare-fun e!39572 () Bool)

(declare-fun e!39577 () Bool)

(declare-datatypes ((V!2849 0))(
  ( (V!2850 (val!1245 Int)) )
))
(declare-datatypes ((array!3711 0))(
  ( (array!3712 (arr!1774 (Array (_ BitVec 32) (_ BitVec 64))) (size!2006 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!857 0))(
  ( (ValueCellFull!857 (v!2391 V!2849)) (EmptyCell!857) )
))
(declare-datatypes ((array!3713 0))(
  ( (array!3714 (arr!1775 (Array (_ BitVec 32) ValueCell!857)) (size!2007 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!622 0))(
  ( (LongMapFixedSize!623 (defaultEntry!2063 Int) (mask!5956 (_ BitVec 32)) (extraKeys!1946 (_ BitVec 32)) (zeroValue!1977 V!2849) (minValue!1977 V!2849) (_size!360 (_ BitVec 32)) (_keys!3690 array!3711) (_values!2046 array!3713) (_vacant!360 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!622)

(declare-fun tp_is_empty!2401 () Bool)

(declare-fun array_inv!1101 (array!3711) Bool)

(declare-fun array_inv!1102 (array!3713) Bool)

(assert (=> b!60225 (= e!39572 (and tp!8029 tp_is_empty!2401 (array_inv!1101 (_keys!3690 newMap!16)) (array_inv!1102 (_values!2046 newMap!16)) e!39577))))

(declare-fun b!60226 () Bool)

(declare-fun e!39585 () Bool)

(assert (=> b!60226 (= e!39585 tp_is_empty!2401)))

(declare-fun b!60227 () Bool)

(declare-fun e!39573 () Bool)

(assert (=> b!60227 (= e!39573 tp_is_empty!2401)))

(declare-fun b!60228 () Bool)

(declare-fun res!33346 () Bool)

(declare-fun e!39576 () Bool)

(assert (=> b!60228 (=> (not res!33346) (not e!39576))))

(declare-datatypes ((Cell!428 0))(
  ( (Cell!429 (v!2392 LongMapFixedSize!622)) )
))
(declare-datatypes ((LongMap!428 0))(
  ( (LongMap!429 (underlying!225 Cell!428)) )
))
(declare-fun thiss!992 () LongMap!428)

(assert (=> b!60228 (= res!33346 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5956 newMap!16)) (_size!360 (v!2392 (underlying!225 thiss!992)))))))

(declare-fun b!60229 () Bool)

(declare-datatypes ((Unit!1613 0))(
  ( (Unit!1614) )
))
(declare-fun e!39580 () Unit!1613)

(declare-fun Unit!1615 () Unit!1613)

(assert (=> b!60229 (= e!39580 Unit!1615)))

(declare-fun res!33352 () Bool)

(assert (=> start!8720 (=> (not res!33352) (not e!39576))))

(declare-fun valid!258 (LongMap!428) Bool)

(assert (=> start!8720 (= res!33352 (valid!258 thiss!992))))

(assert (=> start!8720 e!39576))

(declare-fun e!39575 () Bool)

(assert (=> start!8720 e!39575))

(assert (=> start!8720 true))

(assert (=> start!8720 e!39572))

(declare-fun e!39574 () Bool)

(declare-fun e!39579 () Bool)

(assert (=> b!60230 (= e!39579 (and tp!8028 tp_is_empty!2401 (array_inv!1101 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) (array_inv!1102 (_values!2046 (v!2392 (underlying!225 thiss!992)))) e!39574))))

(declare-fun b!60231 () Bool)

(declare-fun res!33350 () Bool)

(declare-fun e!39583 () Bool)

(assert (=> b!60231 (=> (not res!33350) (not e!39583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!60231 (= res!33350 (validMask!0 (mask!5956 (v!2392 (underlying!225 thiss!992)))))))

(declare-fun b!60232 () Bool)

(declare-fun e!39582 () Bool)

(declare-fun mapRes!2893 () Bool)

(assert (=> b!60232 (= e!39574 (and e!39582 mapRes!2893))))

(declare-fun condMapEmpty!2894 () Bool)

(declare-fun mapDefault!2893 () ValueCell!857)

(assert (=> b!60232 (= condMapEmpty!2894 (= (arr!1775 (_values!2046 (v!2392 (underlying!225 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!857)) mapDefault!2893)))))

(declare-fun mapNonEmpty!2893 () Bool)

(declare-fun tp!8027 () Bool)

(assert (=> mapNonEmpty!2893 (= mapRes!2893 (and tp!8027 e!39573))))

(declare-fun mapValue!2894 () ValueCell!857)

(declare-fun mapKey!2894 () (_ BitVec 32))

(declare-fun mapRest!2893 () (Array (_ BitVec 32) ValueCell!857))

(assert (=> mapNonEmpty!2893 (= (arr!1775 (_values!2046 (v!2392 (underlying!225 thiss!992)))) (store mapRest!2893 mapKey!2894 mapValue!2894))))

(declare-fun b!60233 () Bool)

(declare-fun res!33347 () Bool)

(assert (=> b!60233 (=> (not res!33347) (not e!39576))))

(declare-fun valid!259 (LongMapFixedSize!622) Bool)

(assert (=> b!60233 (= res!33347 (valid!259 newMap!16))))

(declare-fun b!60234 () Bool)

(declare-fun e!39578 () Bool)

(assert (=> b!60234 (= e!39578 e!39583)))

(declare-fun res!33349 () Bool)

(assert (=> b!60234 (=> (not res!33349) (not e!39583))))

(declare-datatypes ((tuple2!2038 0))(
  ( (tuple2!2039 (_1!1030 Bool) (_2!1030 LongMapFixedSize!622)) )
))
(declare-fun lt!24653 () tuple2!2038)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!60234 (= res!33349 (and (_1!1030 lt!24653) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!24656 () Unit!1613)

(assert (=> b!60234 (= lt!24656 e!39580)))

(declare-fun c!7811 () Bool)

(declare-datatypes ((tuple2!2040 0))(
  ( (tuple2!2041 (_1!1031 (_ BitVec 64)) (_2!1031 V!2849)) )
))
(declare-datatypes ((List!1439 0))(
  ( (Nil!1436) (Cons!1435 (h!2017 tuple2!2040) (t!4792 List!1439)) )
))
(declare-datatypes ((ListLongMap!1357 0))(
  ( (ListLongMap!1358 (toList!694 List!1439)) )
))
(declare-fun lt!24658 () ListLongMap!1357)

(declare-fun contains!685 (ListLongMap!1357 (_ BitVec 64)) Bool)

(assert (=> b!60234 (= c!7811 (contains!685 lt!24658 (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355)))))

(declare-fun update!85 (LongMapFixedSize!622 (_ BitVec 64) V!2849) tuple2!2038)

(declare-fun get!1079 (ValueCell!857 V!2849) V!2849)

(declare-fun dynLambda!309 (Int (_ BitVec 64)) V!2849)

(assert (=> b!60234 (= lt!24653 (update!85 newMap!16 (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) (get!1079 (select (arr!1775 (_values!2046 (v!2392 (underlying!225 thiss!992)))) from!355) (dynLambda!309 (defaultEntry!2063 (v!2392 (underlying!225 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!60235 () Bool)

(declare-fun e!39581 () Bool)

(assert (=> b!60235 (= e!39581 e!39579)))

(declare-fun b!60236 () Bool)

(declare-fun Unit!1616 () Unit!1613)

(assert (=> b!60236 (= e!39580 Unit!1616)))

(declare-fun lt!24654 () Unit!1613)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!30 (array!3711 array!3713 (_ BitVec 32) (_ BitVec 32) V!2849 V!2849 (_ BitVec 64) (_ BitVec 32) Int) Unit!1613)

(assert (=> b!60236 (= lt!24654 (lemmaListMapContainsThenArrayContainsFrom!30 (_keys!3690 (v!2392 (underlying!225 thiss!992))) (_values!2046 (v!2392 (underlying!225 thiss!992))) (mask!5956 (v!2392 (underlying!225 thiss!992))) (extraKeys!1946 (v!2392 (underlying!225 thiss!992))) (zeroValue!1977 (v!2392 (underlying!225 thiss!992))) (minValue!1977 (v!2392 (underlying!225 thiss!992))) (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2063 (v!2392 (underlying!225 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!60236 (arrayContainsKey!0 (_keys!3690 (v!2392 (underlying!225 thiss!992))) (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!24652 () Unit!1613)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3711 (_ BitVec 32) (_ BitVec 32)) Unit!1613)

(assert (=> b!60236 (= lt!24652 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3690 (v!2392 (underlying!225 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1440 0))(
  ( (Nil!1437) (Cons!1436 (h!2018 (_ BitVec 64)) (t!4793 List!1440)) )
))
(declare-fun arrayNoDuplicates!0 (array!3711 (_ BitVec 32) List!1440) Bool)

(assert (=> b!60236 (arrayNoDuplicates!0 (_keys!3690 (v!2392 (underlying!225 thiss!992))) from!355 Nil!1437)))

(declare-fun lt!24655 () Unit!1613)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3711 (_ BitVec 32) (_ BitVec 64) List!1440) Unit!1613)

(assert (=> b!60236 (= lt!24655 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3690 (v!2392 (underlying!225 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) (Cons!1436 (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) Nil!1437)))))

(assert (=> b!60236 false))

(declare-fun b!60237 () Bool)

(assert (=> b!60237 (= e!39582 tp_is_empty!2401)))

(declare-fun mapIsEmpty!2893 () Bool)

(assert (=> mapIsEmpty!2893 mapRes!2893))

(declare-fun b!60238 () Bool)

(assert (=> b!60238 (= e!39575 e!39581)))

(declare-fun b!60239 () Bool)

(declare-fun e!39570 () Bool)

(declare-fun mapRes!2894 () Bool)

(assert (=> b!60239 (= e!39577 (and e!39570 mapRes!2894))))

(declare-fun condMapEmpty!2893 () Bool)

(declare-fun mapDefault!2894 () ValueCell!857)

(assert (=> b!60239 (= condMapEmpty!2893 (= (arr!1775 (_values!2046 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!857)) mapDefault!2894)))))

(declare-fun b!60240 () Bool)

(assert (=> b!60240 (= e!39576 e!39578)))

(declare-fun res!33348 () Bool)

(assert (=> b!60240 (=> (not res!33348) (not e!39578))))

(declare-fun lt!24657 () ListLongMap!1357)

(assert (=> b!60240 (= res!33348 (and (= lt!24657 lt!24658) (not (= (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1774 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1106 (LongMapFixedSize!622) ListLongMap!1357)

(assert (=> b!60240 (= lt!24658 (map!1106 newMap!16))))

(declare-fun getCurrentListMap!390 (array!3711 array!3713 (_ BitVec 32) (_ BitVec 32) V!2849 V!2849 (_ BitVec 32) Int) ListLongMap!1357)

(assert (=> b!60240 (= lt!24657 (getCurrentListMap!390 (_keys!3690 (v!2392 (underlying!225 thiss!992))) (_values!2046 (v!2392 (underlying!225 thiss!992))) (mask!5956 (v!2392 (underlying!225 thiss!992))) (extraKeys!1946 (v!2392 (underlying!225 thiss!992))) (zeroValue!1977 (v!2392 (underlying!225 thiss!992))) (minValue!1977 (v!2392 (underlying!225 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2063 (v!2392 (underlying!225 thiss!992)))))))

(declare-fun mapNonEmpty!2894 () Bool)

(declare-fun tp!8030 () Bool)

(assert (=> mapNonEmpty!2894 (= mapRes!2894 (and tp!8030 e!39585))))

(declare-fun mapRest!2894 () (Array (_ BitVec 32) ValueCell!857))

(declare-fun mapKey!2893 () (_ BitVec 32))

(declare-fun mapValue!2893 () ValueCell!857)

(assert (=> mapNonEmpty!2894 (= (arr!1775 (_values!2046 newMap!16)) (store mapRest!2894 mapKey!2893 mapValue!2893))))

(declare-fun b!60241 () Bool)

(declare-fun res!33351 () Bool)

(assert (=> b!60241 (=> (not res!33351) (not e!39576))))

(assert (=> b!60241 (= res!33351 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2006 (_keys!3690 (v!2392 (underlying!225 thiss!992)))))))))

(declare-fun mapIsEmpty!2894 () Bool)

(assert (=> mapIsEmpty!2894 mapRes!2894))

(declare-fun b!60242 () Bool)

(assert (=> b!60242 (= e!39583 (and (= (size!2007 (_values!2046 (v!2392 (underlying!225 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5956 (v!2392 (underlying!225 thiss!992))))) (= (size!2006 (_keys!3690 (v!2392 (underlying!225 thiss!992)))) (size!2007 (_values!2046 (v!2392 (underlying!225 thiss!992))))) (bvslt (mask!5956 (v!2392 (underlying!225 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!60243 () Bool)

(assert (=> b!60243 (= e!39570 tp_is_empty!2401)))

(assert (= (and start!8720 res!33352) b!60241))

(assert (= (and b!60241 res!33351) b!60233))

(assert (= (and b!60233 res!33347) b!60228))

(assert (= (and b!60228 res!33346) b!60240))

(assert (= (and b!60240 res!33348) b!60234))

(assert (= (and b!60234 c!7811) b!60236))

(assert (= (and b!60234 (not c!7811)) b!60229))

(assert (= (and b!60234 res!33349) b!60231))

(assert (= (and b!60231 res!33350) b!60242))

(assert (= (and b!60232 condMapEmpty!2894) mapIsEmpty!2893))

(assert (= (and b!60232 (not condMapEmpty!2894)) mapNonEmpty!2893))

(get-info :version)

(assert (= (and mapNonEmpty!2893 ((_ is ValueCellFull!857) mapValue!2894)) b!60227))

(assert (= (and b!60232 ((_ is ValueCellFull!857) mapDefault!2893)) b!60237))

(assert (= b!60230 b!60232))

(assert (= b!60235 b!60230))

(assert (= b!60238 b!60235))

(assert (= start!8720 b!60238))

(assert (= (and b!60239 condMapEmpty!2893) mapIsEmpty!2894))

(assert (= (and b!60239 (not condMapEmpty!2893)) mapNonEmpty!2894))

(assert (= (and mapNonEmpty!2894 ((_ is ValueCellFull!857) mapValue!2893)) b!60226))

(assert (= (and b!60239 ((_ is ValueCellFull!857) mapDefault!2894)) b!60243))

(assert (= b!60225 b!60239))

(assert (= start!8720 b!60225))

(declare-fun b_lambda!2669 () Bool)

(assert (=> (not b_lambda!2669) (not b!60234)))

(declare-fun t!4789 () Bool)

(declare-fun tb!1329 () Bool)

(assert (=> (and b!60230 (= (defaultEntry!2063 (v!2392 (underlying!225 thiss!992))) (defaultEntry!2063 (v!2392 (underlying!225 thiss!992)))) t!4789) tb!1329))

(declare-fun result!2389 () Bool)

(assert (=> tb!1329 (= result!2389 tp_is_empty!2401)))

(assert (=> b!60234 t!4789))

(declare-fun b_and!3653 () Bool)

(assert (= b_and!3649 (and (=> t!4789 result!2389) b_and!3653)))

(declare-fun t!4791 () Bool)

(declare-fun tb!1331 () Bool)

(assert (=> (and b!60225 (= (defaultEntry!2063 newMap!16) (defaultEntry!2063 (v!2392 (underlying!225 thiss!992)))) t!4791) tb!1331))

(declare-fun result!2393 () Bool)

(assert (= result!2393 result!2389))

(assert (=> b!60234 t!4791))

(declare-fun b_and!3655 () Bool)

(assert (= b_and!3651 (and (=> t!4791 result!2393) b_and!3655)))

(declare-fun m!52845 () Bool)

(assert (=> b!60236 m!52845))

(declare-fun m!52847 () Bool)

(assert (=> b!60236 m!52847))

(declare-fun m!52849 () Bool)

(assert (=> b!60236 m!52849))

(declare-fun m!52851 () Bool)

(assert (=> b!60236 m!52851))

(assert (=> b!60236 m!52849))

(assert (=> b!60236 m!52849))

(declare-fun m!52853 () Bool)

(assert (=> b!60236 m!52853))

(assert (=> b!60236 m!52849))

(declare-fun m!52855 () Bool)

(assert (=> b!60236 m!52855))

(assert (=> b!60240 m!52849))

(declare-fun m!52857 () Bool)

(assert (=> b!60240 m!52857))

(declare-fun m!52859 () Bool)

(assert (=> b!60240 m!52859))

(declare-fun m!52861 () Bool)

(assert (=> b!60230 m!52861))

(declare-fun m!52863 () Bool)

(assert (=> b!60230 m!52863))

(declare-fun m!52865 () Bool)

(assert (=> b!60233 m!52865))

(declare-fun m!52867 () Bool)

(assert (=> start!8720 m!52867))

(declare-fun m!52869 () Bool)

(assert (=> b!60225 m!52869))

(declare-fun m!52871 () Bool)

(assert (=> b!60225 m!52871))

(declare-fun m!52873 () Bool)

(assert (=> b!60231 m!52873))

(declare-fun m!52875 () Bool)

(assert (=> b!60234 m!52875))

(declare-fun m!52877 () Bool)

(assert (=> b!60234 m!52877))

(declare-fun m!52879 () Bool)

(assert (=> b!60234 m!52879))

(assert (=> b!60234 m!52849))

(assert (=> b!60234 m!52877))

(assert (=> b!60234 m!52849))

(declare-fun m!52881 () Bool)

(assert (=> b!60234 m!52881))

(assert (=> b!60234 m!52849))

(assert (=> b!60234 m!52879))

(declare-fun m!52883 () Bool)

(assert (=> b!60234 m!52883))

(assert (=> b!60234 m!52875))

(declare-fun m!52885 () Bool)

(assert (=> mapNonEmpty!2894 m!52885))

(declare-fun m!52887 () Bool)

(assert (=> mapNonEmpty!2893 m!52887))

(check-sat (not mapNonEmpty!2893) b_and!3655 (not mapNonEmpty!2894) (not b!60225) (not b!60233) b_and!3653 tp_is_empty!2401 (not b!60234) (not b!60240) (not b_next!1971) (not b!60230) (not b_lambda!2669) (not b!60231) (not b!60236) (not b_next!1969) (not start!8720))
(check-sat b_and!3653 b_and!3655 (not b_next!1969) (not b_next!1971))
