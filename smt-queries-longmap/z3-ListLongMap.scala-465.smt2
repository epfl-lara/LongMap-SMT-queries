; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8720 () Bool)

(assert start!8720)

(declare-fun b!60262 () Bool)

(declare-fun b_free!1969 () Bool)

(declare-fun b_next!1969 () Bool)

(assert (=> b!60262 (= b_free!1969 (not b_next!1969))))

(declare-fun tp!8030 () Bool)

(declare-fun b_and!3649 () Bool)

(assert (=> b!60262 (= tp!8030 b_and!3649)))

(declare-fun b!60265 () Bool)

(declare-fun b_free!1971 () Bool)

(declare-fun b_next!1971 () Bool)

(assert (=> b!60265 (= b_free!1971 (not b_next!1971))))

(declare-fun tp!8029 () Bool)

(declare-fun b_and!3651 () Bool)

(assert (=> b!60265 (= tp!8029 b_and!3651)))

(declare-fun b!60258 () Bool)

(declare-fun e!39596 () Bool)

(declare-fun tp_is_empty!2401 () Bool)

(assert (=> b!60258 (= e!39596 tp_is_empty!2401)))

(declare-fun b!60259 () Bool)

(declare-fun e!39605 () Bool)

(declare-fun e!39592 () Bool)

(assert (=> b!60259 (= e!39605 e!39592)))

(declare-fun b!60260 () Bool)

(declare-fun e!39603 () Bool)

(assert (=> b!60260 (= e!39603 tp_is_empty!2401)))

(declare-fun mapIsEmpty!2893 () Bool)

(declare-fun mapRes!2894 () Bool)

(assert (=> mapIsEmpty!2893 mapRes!2894))

(declare-fun b!60261 () Bool)

(declare-fun e!39604 () Bool)

(declare-fun e!39595 () Bool)

(assert (=> b!60261 (= e!39604 (and e!39595 mapRes!2894))))

(declare-fun condMapEmpty!2894 () Bool)

(declare-datatypes ((V!2849 0))(
  ( (V!2850 (val!1245 Int)) )
))
(declare-datatypes ((array!3717 0))(
  ( (array!3718 (arr!1778 (Array (_ BitVec 32) (_ BitVec 64))) (size!2009 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!857 0))(
  ( (ValueCellFull!857 (v!2396 V!2849)) (EmptyCell!857) )
))
(declare-datatypes ((array!3719 0))(
  ( (array!3720 (arr!1779 (Array (_ BitVec 32) ValueCell!857)) (size!2010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!622 0))(
  ( (LongMapFixedSize!623 (defaultEntry!2063 Int) (mask!5957 (_ BitVec 32)) (extraKeys!1946 (_ BitVec 32)) (zeroValue!1977 V!2849) (minValue!1977 V!2849) (_size!360 (_ BitVec 32)) (_keys!3691 array!3717) (_values!2046 array!3719) (_vacant!360 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!432 0))(
  ( (Cell!433 (v!2397 LongMapFixedSize!622)) )
))
(declare-datatypes ((LongMap!432 0))(
  ( (LongMap!433 (underlying!227 Cell!432)) )
))
(declare-fun thiss!992 () LongMap!432)

(declare-fun mapDefault!2893 () ValueCell!857)

(assert (=> b!60261 (= condMapEmpty!2894 (= (arr!1779 (_values!2046 (v!2397 (underlying!227 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!857)) mapDefault!2893)))))

(declare-fun array_inv!1091 (array!3717) Bool)

(declare-fun array_inv!1092 (array!3719) Bool)

(assert (=> b!60262 (= e!39592 (and tp!8030 tp_is_empty!2401 (array_inv!1091 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) (array_inv!1092 (_values!2046 (v!2397 (underlying!227 thiss!992)))) e!39604))))

(declare-fun b!60263 () Bool)

(declare-datatypes ((Unit!1606 0))(
  ( (Unit!1607) )
))
(declare-fun e!39591 () Unit!1606)

(declare-fun Unit!1608 () Unit!1606)

(assert (=> b!60263 (= e!39591 Unit!1608)))

(declare-fun b!60264 () Bool)

(declare-fun e!39599 () Bool)

(assert (=> b!60264 (= e!39599 e!39605)))

(declare-fun mapNonEmpty!2893 () Bool)

(declare-fun tp!8027 () Bool)

(declare-fun e!39601 () Bool)

(assert (=> mapNonEmpty!2893 (= mapRes!2894 (and tp!8027 e!39601))))

(declare-fun mapValue!2894 () ValueCell!857)

(declare-fun mapRest!2894 () (Array (_ BitVec 32) ValueCell!857))

(declare-fun mapKey!2893 () (_ BitVec 32))

(assert (=> mapNonEmpty!2893 (= (arr!1779 (_values!2046 (v!2397 (underlying!227 thiss!992)))) (store mapRest!2894 mapKey!2893 mapValue!2894))))

(declare-fun e!39590 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!622)

(declare-fun e!39598 () Bool)

(assert (=> b!60265 (= e!39598 (and tp!8029 tp_is_empty!2401 (array_inv!1091 (_keys!3691 newMap!16)) (array_inv!1092 (_values!2046 newMap!16)) e!39590))))

(declare-fun res!33352 () Bool)

(declare-fun e!39597 () Bool)

(assert (=> start!8720 (=> (not res!33352) (not e!39597))))

(declare-fun valid!264 (LongMap!432) Bool)

(assert (=> start!8720 (= res!33352 (valid!264 thiss!992))))

(assert (=> start!8720 e!39597))

(assert (=> start!8720 e!39599))

(assert (=> start!8720 true))

(assert (=> start!8720 e!39598))

(declare-fun b!60266 () Bool)

(declare-fun e!39602 () Bool)

(assert (=> b!60266 (= e!39597 e!39602)))

(declare-fun res!33350 () Bool)

(assert (=> b!60266 (=> (not res!33350) (not e!39602))))

(declare-datatypes ((tuple2!2018 0))(
  ( (tuple2!2019 (_1!1020 (_ BitVec 64)) (_2!1020 V!2849)) )
))
(declare-datatypes ((List!1424 0))(
  ( (Nil!1421) (Cons!1420 (h!2002 tuple2!2018) (t!4778 List!1424)) )
))
(declare-datatypes ((ListLongMap!1345 0))(
  ( (ListLongMap!1346 (toList!688 List!1424)) )
))
(declare-fun lt!24644 () ListLongMap!1345)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!24647 () ListLongMap!1345)

(assert (=> b!60266 (= res!33350 (and (= lt!24647 lt!24644) (not (= (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1111 (LongMapFixedSize!622) ListLongMap!1345)

(assert (=> b!60266 (= lt!24644 (map!1111 newMap!16))))

(declare-fun getCurrentListMap!389 (array!3717 array!3719 (_ BitVec 32) (_ BitVec 32) V!2849 V!2849 (_ BitVec 32) Int) ListLongMap!1345)

(assert (=> b!60266 (= lt!24647 (getCurrentListMap!389 (_keys!3691 (v!2397 (underlying!227 thiss!992))) (_values!2046 (v!2397 (underlying!227 thiss!992))) (mask!5957 (v!2397 (underlying!227 thiss!992))) (extraKeys!1946 (v!2397 (underlying!227 thiss!992))) (zeroValue!1977 (v!2397 (underlying!227 thiss!992))) (minValue!1977 (v!2397 (underlying!227 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2063 (v!2397 (underlying!227 thiss!992)))))))

(declare-fun b!60267 () Bool)

(assert (=> b!60267 (= e!39595 tp_is_empty!2401)))

(declare-fun b!60268 () Bool)

(declare-fun res!33353 () Bool)

(declare-fun e!39593 () Bool)

(assert (=> b!60268 (=> (not res!33353) (not e!39593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!60268 (= res!33353 (validMask!0 (mask!5957 (v!2397 (underlying!227 thiss!992)))))))

(declare-fun b!60269 () Bool)

(declare-fun Unit!1609 () Unit!1606)

(assert (=> b!60269 (= e!39591 Unit!1609)))

(declare-fun lt!24645 () Unit!1606)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!25 (array!3717 array!3719 (_ BitVec 32) (_ BitVec 32) V!2849 V!2849 (_ BitVec 64) (_ BitVec 32) Int) Unit!1606)

(assert (=> b!60269 (= lt!24645 (lemmaListMapContainsThenArrayContainsFrom!25 (_keys!3691 (v!2397 (underlying!227 thiss!992))) (_values!2046 (v!2397 (underlying!227 thiss!992))) (mask!5957 (v!2397 (underlying!227 thiss!992))) (extraKeys!1946 (v!2397 (underlying!227 thiss!992))) (zeroValue!1977 (v!2397 (underlying!227 thiss!992))) (minValue!1977 (v!2397 (underlying!227 thiss!992))) (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2063 (v!2397 (underlying!227 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!60269 (arrayContainsKey!0 (_keys!3691 (v!2397 (underlying!227 thiss!992))) (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!24648 () Unit!1606)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3717 (_ BitVec 32) (_ BitVec 32)) Unit!1606)

(assert (=> b!60269 (= lt!24648 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3691 (v!2397 (underlying!227 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1425 0))(
  ( (Nil!1422) (Cons!1421 (h!2003 (_ BitVec 64)) (t!4779 List!1425)) )
))
(declare-fun arrayNoDuplicates!0 (array!3717 (_ BitVec 32) List!1425) Bool)

(assert (=> b!60269 (arrayNoDuplicates!0 (_keys!3691 (v!2397 (underlying!227 thiss!992))) from!355 Nil!1422)))

(declare-fun lt!24649 () Unit!1606)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3717 (_ BitVec 32) (_ BitVec 64) List!1425) Unit!1606)

(assert (=> b!60269 (= lt!24649 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3691 (v!2397 (underlying!227 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) (Cons!1421 (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) Nil!1422)))))

(assert (=> b!60269 false))

(declare-fun b!60270 () Bool)

(assert (=> b!60270 (= e!39602 e!39593)))

(declare-fun res!33354 () Bool)

(assert (=> b!60270 (=> (not res!33354) (not e!39593))))

(declare-datatypes ((tuple2!2020 0))(
  ( (tuple2!2021 (_1!1021 Bool) (_2!1021 LongMapFixedSize!622)) )
))
(declare-fun lt!24646 () tuple2!2020)

(assert (=> b!60270 (= res!33354 (and (_1!1021 lt!24646) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!24643 () Unit!1606)

(assert (=> b!60270 (= lt!24643 e!39591)))

(declare-fun c!7826 () Bool)

(declare-fun contains!681 (ListLongMap!1345 (_ BitVec 64)) Bool)

(assert (=> b!60270 (= c!7826 (contains!681 lt!24644 (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355)))))

(declare-fun update!87 (LongMapFixedSize!622 (_ BitVec 64) V!2849) tuple2!2020)

(declare-fun get!1078 (ValueCell!857 V!2849) V!2849)

(declare-fun dynLambda!305 (Int (_ BitVec 64)) V!2849)

(assert (=> b!60270 (= lt!24646 (update!87 newMap!16 (select (arr!1778 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) from!355) (get!1078 (select (arr!1779 (_values!2046 (v!2397 (underlying!227 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2063 (v!2397 (underlying!227 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!2894 () Bool)

(declare-fun mapRes!2893 () Bool)

(declare-fun tp!8028 () Bool)

(assert (=> mapNonEmpty!2894 (= mapRes!2893 (and tp!8028 e!39596))))

(declare-fun mapValue!2893 () ValueCell!857)

(declare-fun mapKey!2894 () (_ BitVec 32))

(declare-fun mapRest!2893 () (Array (_ BitVec 32) ValueCell!857))

(assert (=> mapNonEmpty!2894 (= (arr!1779 (_values!2046 newMap!16)) (store mapRest!2893 mapKey!2894 mapValue!2893))))

(declare-fun b!60271 () Bool)

(assert (=> b!60271 (= e!39590 (and e!39603 mapRes!2893))))

(declare-fun condMapEmpty!2893 () Bool)

(declare-fun mapDefault!2894 () ValueCell!857)

(assert (=> b!60271 (= condMapEmpty!2893 (= (arr!1779 (_values!2046 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!857)) mapDefault!2894)))))

(declare-fun b!60272 () Bool)

(declare-fun res!33355 () Bool)

(assert (=> b!60272 (=> (not res!33355) (not e!39597))))

(assert (=> b!60272 (= res!33355 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2009 (_keys!3691 (v!2397 (underlying!227 thiss!992)))))))))

(declare-fun b!60273 () Bool)

(declare-fun res!33349 () Bool)

(assert (=> b!60273 (=> (not res!33349) (not e!39597))))

(declare-fun valid!265 (LongMapFixedSize!622) Bool)

(assert (=> b!60273 (= res!33349 (valid!265 newMap!16))))

(declare-fun mapIsEmpty!2894 () Bool)

(assert (=> mapIsEmpty!2894 mapRes!2893))

(declare-fun b!60274 () Bool)

(assert (=> b!60274 (= e!39601 tp_is_empty!2401)))

(declare-fun b!60275 () Bool)

(assert (=> b!60275 (= e!39593 (and (= (size!2010 (_values!2046 (v!2397 (underlying!227 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5957 (v!2397 (underlying!227 thiss!992))))) (= (size!2009 (_keys!3691 (v!2397 (underlying!227 thiss!992)))) (size!2010 (_values!2046 (v!2397 (underlying!227 thiss!992))))) (bvslt (mask!5957 (v!2397 (underlying!227 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!60276 () Bool)

(declare-fun res!33351 () Bool)

(assert (=> b!60276 (=> (not res!33351) (not e!39597))))

(assert (=> b!60276 (= res!33351 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5957 newMap!16)) (_size!360 (v!2397 (underlying!227 thiss!992)))))))

(assert (= (and start!8720 res!33352) b!60272))

(assert (= (and b!60272 res!33355) b!60273))

(assert (= (and b!60273 res!33349) b!60276))

(assert (= (and b!60276 res!33351) b!60266))

(assert (= (and b!60266 res!33350) b!60270))

(assert (= (and b!60270 c!7826) b!60269))

(assert (= (and b!60270 (not c!7826)) b!60263))

(assert (= (and b!60270 res!33354) b!60268))

(assert (= (and b!60268 res!33353) b!60275))

(assert (= (and b!60261 condMapEmpty!2894) mapIsEmpty!2893))

(assert (= (and b!60261 (not condMapEmpty!2894)) mapNonEmpty!2893))

(get-info :version)

(assert (= (and mapNonEmpty!2893 ((_ is ValueCellFull!857) mapValue!2894)) b!60274))

(assert (= (and b!60261 ((_ is ValueCellFull!857) mapDefault!2893)) b!60267))

(assert (= b!60262 b!60261))

(assert (= b!60259 b!60262))

(assert (= b!60264 b!60259))

(assert (= start!8720 b!60264))

(assert (= (and b!60271 condMapEmpty!2893) mapIsEmpty!2894))

(assert (= (and b!60271 (not condMapEmpty!2893)) mapNonEmpty!2894))

(assert (= (and mapNonEmpty!2894 ((_ is ValueCellFull!857) mapValue!2893)) b!60258))

(assert (= (and b!60271 ((_ is ValueCellFull!857) mapDefault!2894)) b!60260))

(assert (= b!60265 b!60271))

(assert (= start!8720 b!60265))

(declare-fun b_lambda!2669 () Bool)

(assert (=> (not b_lambda!2669) (not b!60270)))

(declare-fun t!4775 () Bool)

(declare-fun tb!1329 () Bool)

(assert (=> (and b!60262 (= (defaultEntry!2063 (v!2397 (underlying!227 thiss!992))) (defaultEntry!2063 (v!2397 (underlying!227 thiss!992)))) t!4775) tb!1329))

(declare-fun result!2389 () Bool)

(assert (=> tb!1329 (= result!2389 tp_is_empty!2401)))

(assert (=> b!60270 t!4775))

(declare-fun b_and!3653 () Bool)

(assert (= b_and!3649 (and (=> t!4775 result!2389) b_and!3653)))

(declare-fun tb!1331 () Bool)

(declare-fun t!4777 () Bool)

(assert (=> (and b!60265 (= (defaultEntry!2063 newMap!16) (defaultEntry!2063 (v!2397 (underlying!227 thiss!992)))) t!4777) tb!1331))

(declare-fun result!2393 () Bool)

(assert (= result!2393 result!2389))

(assert (=> b!60270 t!4777))

(declare-fun b_and!3655 () Bool)

(assert (= b_and!3651 (and (=> t!4777 result!2393) b_and!3655)))

(declare-fun m!52847 () Bool)

(assert (=> b!60266 m!52847))

(declare-fun m!52849 () Bool)

(assert (=> b!60266 m!52849))

(declare-fun m!52851 () Bool)

(assert (=> b!60266 m!52851))

(declare-fun m!52853 () Bool)

(assert (=> b!60269 m!52853))

(declare-fun m!52855 () Bool)

(assert (=> b!60269 m!52855))

(assert (=> b!60269 m!52847))

(declare-fun m!52857 () Bool)

(assert (=> b!60269 m!52857))

(assert (=> b!60269 m!52847))

(assert (=> b!60269 m!52847))

(declare-fun m!52859 () Bool)

(assert (=> b!60269 m!52859))

(assert (=> b!60269 m!52847))

(declare-fun m!52861 () Bool)

(assert (=> b!60269 m!52861))

(declare-fun m!52863 () Bool)

(assert (=> start!8720 m!52863))

(declare-fun m!52865 () Bool)

(assert (=> mapNonEmpty!2893 m!52865))

(declare-fun m!52867 () Bool)

(assert (=> mapNonEmpty!2894 m!52867))

(assert (=> b!60270 m!52847))

(declare-fun m!52869 () Bool)

(assert (=> b!60270 m!52869))

(declare-fun m!52871 () Bool)

(assert (=> b!60270 m!52871))

(declare-fun m!52873 () Bool)

(assert (=> b!60270 m!52873))

(declare-fun m!52875 () Bool)

(assert (=> b!60270 m!52875))

(assert (=> b!60270 m!52847))

(assert (=> b!60270 m!52873))

(assert (=> b!60270 m!52847))

(assert (=> b!60270 m!52875))

(declare-fun m!52877 () Bool)

(assert (=> b!60270 m!52877))

(assert (=> b!60270 m!52871))

(declare-fun m!52879 () Bool)

(assert (=> b!60265 m!52879))

(declare-fun m!52881 () Bool)

(assert (=> b!60265 m!52881))

(declare-fun m!52883 () Bool)

(assert (=> b!60262 m!52883))

(declare-fun m!52885 () Bool)

(assert (=> b!60262 m!52885))

(declare-fun m!52887 () Bool)

(assert (=> b!60273 m!52887))

(declare-fun m!52889 () Bool)

(assert (=> b!60268 m!52889))

(check-sat b_and!3655 (not b!60262) (not b!60270) (not b_next!1969) (not b!60268) tp_is_empty!2401 b_and!3653 (not start!8720) (not b!60269) (not b!60265) (not b_next!1971) (not mapNonEmpty!2894) (not mapNonEmpty!2893) (not b!60273) (not b!60266) (not b_lambda!2669))
(check-sat b_and!3653 b_and!3655 (not b_next!1969) (not b_next!1971))
