; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15200 () Bool)

(assert start!15200)

(declare-fun b!146112 () Bool)

(declare-fun b_free!3097 () Bool)

(declare-fun b_next!3097 () Bool)

(assert (=> b!146112 (= b_free!3097 (not b_next!3097))))

(declare-fun tp!11793 () Bool)

(declare-fun b_and!9093 () Bool)

(assert (=> b!146112 (= tp!11793 b_and!9093)))

(declare-fun b!146100 () Bool)

(declare-fun b_free!3099 () Bool)

(declare-fun b_next!3099 () Bool)

(assert (=> b!146100 (= b_free!3099 (not b_next!3099))))

(declare-fun tp!11796 () Bool)

(declare-fun b_and!9095 () Bool)

(assert (=> b!146100 (= tp!11796 b_and!9095)))

(declare-fun mapNonEmpty!4967 () Bool)

(declare-fun mapRes!4967 () Bool)

(declare-fun tp!11794 () Bool)

(declare-fun e!95228 () Bool)

(assert (=> mapNonEmpty!4967 (= mapRes!4967 (and tp!11794 e!95228))))

(declare-datatypes ((V!3601 0))(
  ( (V!3602 (val!1527 Int)) )
))
(declare-datatypes ((ValueCell!1139 0))(
  ( (ValueCellFull!1139 (v!3339 V!3601)) (EmptyCell!1139) )
))
(declare-fun mapRest!4968 () (Array (_ BitVec 32) ValueCell!1139))

(declare-datatypes ((array!4955 0))(
  ( (array!4956 (arr!2338 (Array (_ BitVec 32) (_ BitVec 64))) (size!2615 (_ BitVec 32))) )
))
(declare-datatypes ((array!4957 0))(
  ( (array!4958 (arr!2339 (Array (_ BitVec 32) ValueCell!1139)) (size!2616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1186 0))(
  ( (LongMapFixedSize!1187 (defaultEntry!3009 Int) (mask!7382 (_ BitVec 32)) (extraKeys!2754 (_ BitVec 32)) (zeroValue!2854 V!3601) (minValue!2854 V!3601) (_size!642 (_ BitVec 32)) (_keys!4777 array!4955) (_values!2992 array!4957) (_vacant!642 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1186)

(declare-fun mapKey!4967 () (_ BitVec 32))

(declare-fun mapValue!4967 () ValueCell!1139)

(assert (=> mapNonEmpty!4967 (= (arr!2339 (_values!2992 newMap!16)) (store mapRest!4968 mapKey!4967 mapValue!4967))))

(declare-fun b!146095 () Bool)

(declare-fun e!95225 () Bool)

(assert (=> b!146095 (= e!95225 false)))

(declare-datatypes ((tuple2!2712 0))(
  ( (tuple2!2713 (_1!1367 (_ BitVec 64)) (_2!1367 V!3601)) )
))
(declare-datatypes ((List!1768 0))(
  ( (Nil!1765) (Cons!1764 (h!2372 tuple2!2712) (t!6440 List!1768)) )
))
(declare-datatypes ((ListLongMap!1741 0))(
  ( (ListLongMap!1742 (toList!886 List!1768)) )
))
(declare-fun lt!76693 () ListLongMap!1741)

(declare-datatypes ((Cell!964 0))(
  ( (Cell!965 (v!3340 LongMapFixedSize!1186)) )
))
(declare-datatypes ((LongMap!964 0))(
  ( (LongMap!965 (underlying!493 Cell!964)) )
))
(declare-fun thiss!992 () LongMap!964)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!137 (array!4955 array!4957 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1741)

(assert (=> b!146095 (= lt!76693 (getCurrentListMapNoExtraKeys!137 (_keys!4777 (v!3340 (underlying!493 thiss!992))) (_values!2992 (v!3340 (underlying!493 thiss!992))) (mask!7382 (v!3340 (underlying!493 thiss!992))) (extraKeys!2754 (v!3340 (underlying!493 thiss!992))) (zeroValue!2854 (v!3340 (underlying!493 thiss!992))) (minValue!2854 (v!3340 (underlying!493 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3340 (underlying!493 thiss!992)))))))

(declare-fun b!146096 () Bool)

(declare-fun res!69491 () Bool)

(declare-fun e!95235 () Bool)

(assert (=> b!146096 (=> (not res!69491) (not e!95235))))

(assert (=> b!146096 (= res!69491 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7382 newMap!16)) (_size!642 (v!3340 (underlying!493 thiss!992)))))))

(declare-fun b!146097 () Bool)

(declare-fun e!95224 () Bool)

(declare-fun tp_is_empty!2965 () Bool)

(assert (=> b!146097 (= e!95224 tp_is_empty!2965)))

(declare-fun mapIsEmpty!4967 () Bool)

(assert (=> mapIsEmpty!4967 mapRes!4967))

(declare-fun mapIsEmpty!4968 () Bool)

(declare-fun mapRes!4968 () Bool)

(assert (=> mapIsEmpty!4968 mapRes!4968))

(declare-fun res!69492 () Bool)

(assert (=> start!15200 (=> (not res!69492) (not e!95235))))

(declare-fun valid!581 (LongMap!964) Bool)

(assert (=> start!15200 (= res!69492 (valid!581 thiss!992))))

(assert (=> start!15200 e!95235))

(declare-fun e!95227 () Bool)

(assert (=> start!15200 e!95227))

(assert (=> start!15200 true))

(declare-fun e!95234 () Bool)

(assert (=> start!15200 e!95234))

(declare-fun b!146098 () Bool)

(declare-fun e!95232 () Bool)

(assert (=> b!146098 (= e!95227 e!95232)))

(declare-fun b!146099 () Bool)

(assert (=> b!146099 (= e!95228 tp_is_empty!2965)))

(declare-fun mapNonEmpty!4968 () Bool)

(declare-fun tp!11795 () Bool)

(declare-fun e!95229 () Bool)

(assert (=> mapNonEmpty!4968 (= mapRes!4968 (and tp!11795 e!95229))))

(declare-fun mapRest!4967 () (Array (_ BitVec 32) ValueCell!1139))

(declare-fun mapValue!4968 () ValueCell!1139)

(declare-fun mapKey!4968 () (_ BitVec 32))

(assert (=> mapNonEmpty!4968 (= (arr!2339 (_values!2992 (v!3340 (underlying!493 thiss!992)))) (store mapRest!4967 mapKey!4968 mapValue!4968))))

(declare-fun e!95237 () Bool)

(declare-fun array_inv!1499 (array!4955) Bool)

(declare-fun array_inv!1500 (array!4957) Bool)

(assert (=> b!146100 (= e!95234 (and tp!11796 tp_is_empty!2965 (array_inv!1499 (_keys!4777 newMap!16)) (array_inv!1500 (_values!2992 newMap!16)) e!95237))))

(declare-fun b!146101 () Bool)

(declare-fun res!69495 () Bool)

(assert (=> b!146101 (=> (not res!69495) (not e!95235))))

(assert (=> b!146101 (= res!69495 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2615 (_keys!4777 (v!3340 (underlying!493 thiss!992)))))))))

(declare-fun b!146102 () Bool)

(declare-datatypes ((Unit!4612 0))(
  ( (Unit!4613) )
))
(declare-fun e!95226 () Unit!4612)

(declare-fun Unit!4614 () Unit!4612)

(assert (=> b!146102 (= e!95226 Unit!4614)))

(declare-fun b!146103 () Bool)

(declare-fun e!95231 () Bool)

(assert (=> b!146103 (= e!95231 (and e!95224 mapRes!4968))))

(declare-fun condMapEmpty!4968 () Bool)

(declare-fun mapDefault!4968 () ValueCell!1139)

(assert (=> b!146103 (= condMapEmpty!4968 (= (arr!2339 (_values!2992 (v!3340 (underlying!493 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1139)) mapDefault!4968)))))

(declare-fun b!146104 () Bool)

(declare-fun e!95236 () Bool)

(assert (=> b!146104 (= e!95236 e!95225)))

(declare-fun res!69494 () Bool)

(assert (=> b!146104 (=> (not res!69494) (not e!95225))))

(declare-datatypes ((tuple2!2714 0))(
  ( (tuple2!2715 (_1!1368 Bool) (_2!1368 LongMapFixedSize!1186)) )
))
(declare-fun lt!76691 () tuple2!2714)

(assert (=> b!146104 (= res!69494 (and (_1!1368 lt!76691) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76692 () Unit!4612)

(assert (=> b!146104 (= lt!76692 e!95226)))

(declare-fun lt!76687 () ListLongMap!1741)

(declare-fun c!27670 () Bool)

(declare-fun contains!934 (ListLongMap!1741 (_ BitVec 64)) Bool)

(assert (=> b!146104 (= c!27670 (contains!934 lt!76687 (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355)))))

(declare-fun update!221 (LongMapFixedSize!1186 (_ BitVec 64) V!3601) tuple2!2714)

(declare-fun get!1562 (ValueCell!1139 V!3601) V!3601)

(declare-fun dynLambda!447 (Int (_ BitVec 64)) V!3601)

(assert (=> b!146104 (= lt!76691 (update!221 newMap!16 (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) (get!1562 (select (arr!2339 (_values!2992 (v!3340 (underlying!493 thiss!992)))) from!355) (dynLambda!447 (defaultEntry!3009 (v!3340 (underlying!493 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!146105 () Bool)

(declare-fun e!95223 () Bool)

(assert (=> b!146105 (= e!95232 e!95223)))

(declare-fun b!146106 () Bool)

(assert (=> b!146106 (= e!95229 tp_is_empty!2965)))

(declare-fun b!146107 () Bool)

(declare-fun Unit!4615 () Unit!4612)

(assert (=> b!146107 (= e!95226 Unit!4615)))

(declare-fun lt!76688 () Unit!4612)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!156 (array!4955 array!4957 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 64) (_ BitVec 32) Int) Unit!4612)

(assert (=> b!146107 (= lt!76688 (lemmaListMapContainsThenArrayContainsFrom!156 (_keys!4777 (v!3340 (underlying!493 thiss!992))) (_values!2992 (v!3340 (underlying!493 thiss!992))) (mask!7382 (v!3340 (underlying!493 thiss!992))) (extraKeys!2754 (v!3340 (underlying!493 thiss!992))) (zeroValue!2854 (v!3340 (underlying!493 thiss!992))) (minValue!2854 (v!3340 (underlying!493 thiss!992))) (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3340 (underlying!493 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146107 (arrayContainsKey!0 (_keys!4777 (v!3340 (underlying!493 thiss!992))) (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76686 () Unit!4612)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4955 (_ BitVec 32) (_ BitVec 32)) Unit!4612)

(assert (=> b!146107 (= lt!76686 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4777 (v!3340 (underlying!493 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1769 0))(
  ( (Nil!1766) (Cons!1765 (h!2373 (_ BitVec 64)) (t!6441 List!1769)) )
))
(declare-fun arrayNoDuplicates!0 (array!4955 (_ BitVec 32) List!1769) Bool)

(assert (=> b!146107 (arrayNoDuplicates!0 (_keys!4777 (v!3340 (underlying!493 thiss!992))) from!355 Nil!1766)))

(declare-fun lt!76690 () Unit!4612)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4955 (_ BitVec 32) (_ BitVec 64) List!1769) Unit!4612)

(assert (=> b!146107 (= lt!76690 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4777 (v!3340 (underlying!493 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) (Cons!1765 (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) Nil!1766)))))

(assert (=> b!146107 false))

(declare-fun b!146108 () Bool)

(declare-fun e!95230 () Bool)

(assert (=> b!146108 (= e!95237 (and e!95230 mapRes!4967))))

(declare-fun condMapEmpty!4967 () Bool)

(declare-fun mapDefault!4967 () ValueCell!1139)

(assert (=> b!146108 (= condMapEmpty!4967 (= (arr!2339 (_values!2992 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1139)) mapDefault!4967)))))

(declare-fun b!146109 () Bool)

(assert (=> b!146109 (= e!95235 e!95236)))

(declare-fun res!69493 () Bool)

(assert (=> b!146109 (=> (not res!69493) (not e!95236))))

(declare-fun lt!76689 () ListLongMap!1741)

(assert (=> b!146109 (= res!69493 (and (= lt!76689 lt!76687) (not (= (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2338 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1447 (LongMapFixedSize!1186) ListLongMap!1741)

(assert (=> b!146109 (= lt!76687 (map!1447 newMap!16))))

(declare-fun getCurrentListMap!545 (array!4955 array!4957 (_ BitVec 32) (_ BitVec 32) V!3601 V!3601 (_ BitVec 32) Int) ListLongMap!1741)

(assert (=> b!146109 (= lt!76689 (getCurrentListMap!545 (_keys!4777 (v!3340 (underlying!493 thiss!992))) (_values!2992 (v!3340 (underlying!493 thiss!992))) (mask!7382 (v!3340 (underlying!493 thiss!992))) (extraKeys!2754 (v!3340 (underlying!493 thiss!992))) (zeroValue!2854 (v!3340 (underlying!493 thiss!992))) (minValue!2854 (v!3340 (underlying!493 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3009 (v!3340 (underlying!493 thiss!992)))))))

(declare-fun b!146110 () Bool)

(assert (=> b!146110 (= e!95230 tp_is_empty!2965)))

(declare-fun b!146111 () Bool)

(declare-fun res!69496 () Bool)

(assert (=> b!146111 (=> (not res!69496) (not e!95235))))

(declare-fun valid!582 (LongMapFixedSize!1186) Bool)

(assert (=> b!146111 (= res!69496 (valid!582 newMap!16))))

(assert (=> b!146112 (= e!95223 (and tp!11793 tp_is_empty!2965 (array_inv!1499 (_keys!4777 (v!3340 (underlying!493 thiss!992)))) (array_inv!1500 (_values!2992 (v!3340 (underlying!493 thiss!992)))) e!95231))))

(assert (= (and start!15200 res!69492) b!146101))

(assert (= (and b!146101 res!69495) b!146111))

(assert (= (and b!146111 res!69496) b!146096))

(assert (= (and b!146096 res!69491) b!146109))

(assert (= (and b!146109 res!69493) b!146104))

(assert (= (and b!146104 c!27670) b!146107))

(assert (= (and b!146104 (not c!27670)) b!146102))

(assert (= (and b!146104 res!69494) b!146095))

(assert (= (and b!146103 condMapEmpty!4968) mapIsEmpty!4968))

(assert (= (and b!146103 (not condMapEmpty!4968)) mapNonEmpty!4968))

(get-info :version)

(assert (= (and mapNonEmpty!4968 ((_ is ValueCellFull!1139) mapValue!4968)) b!146106))

(assert (= (and b!146103 ((_ is ValueCellFull!1139) mapDefault!4968)) b!146097))

(assert (= b!146112 b!146103))

(assert (= b!146105 b!146112))

(assert (= b!146098 b!146105))

(assert (= start!15200 b!146098))

(assert (= (and b!146108 condMapEmpty!4967) mapIsEmpty!4967))

(assert (= (and b!146108 (not condMapEmpty!4967)) mapNonEmpty!4967))

(assert (= (and mapNonEmpty!4967 ((_ is ValueCellFull!1139) mapValue!4967)) b!146099))

(assert (= (and b!146108 ((_ is ValueCellFull!1139) mapDefault!4967)) b!146110))

(assert (= b!146100 b!146108))

(assert (= start!15200 b!146100))

(declare-fun b_lambda!6531 () Bool)

(assert (=> (not b_lambda!6531) (not b!146104)))

(declare-fun t!6437 () Bool)

(declare-fun tb!2633 () Bool)

(assert (=> (and b!146112 (= (defaultEntry!3009 (v!3340 (underlying!493 thiss!992))) (defaultEntry!3009 (v!3340 (underlying!493 thiss!992)))) t!6437) tb!2633))

(declare-fun result!4309 () Bool)

(assert (=> tb!2633 (= result!4309 tp_is_empty!2965)))

(assert (=> b!146104 t!6437))

(declare-fun b_and!9097 () Bool)

(assert (= b_and!9093 (and (=> t!6437 result!4309) b_and!9097)))

(declare-fun t!6439 () Bool)

(declare-fun tb!2635 () Bool)

(assert (=> (and b!146100 (= (defaultEntry!3009 newMap!16) (defaultEntry!3009 (v!3340 (underlying!493 thiss!992)))) t!6439) tb!2635))

(declare-fun result!4313 () Bool)

(assert (= result!4313 result!4309))

(assert (=> b!146104 t!6439))

(declare-fun b_and!9099 () Bool)

(assert (= b_and!9095 (and (=> t!6439 result!4313) b_and!9099)))

(declare-fun m!175591 () Bool)

(assert (=> b!146100 m!175591))

(declare-fun m!175593 () Bool)

(assert (=> b!146100 m!175593))

(declare-fun m!175595 () Bool)

(assert (=> mapNonEmpty!4968 m!175595))

(declare-fun m!175597 () Bool)

(assert (=> b!146112 m!175597))

(declare-fun m!175599 () Bool)

(assert (=> b!146112 m!175599))

(declare-fun m!175601 () Bool)

(assert (=> b!146095 m!175601))

(declare-fun m!175603 () Bool)

(assert (=> start!15200 m!175603))

(declare-fun m!175605 () Bool)

(assert (=> b!146109 m!175605))

(declare-fun m!175607 () Bool)

(assert (=> b!146109 m!175607))

(declare-fun m!175609 () Bool)

(assert (=> b!146109 m!175609))

(declare-fun m!175611 () Bool)

(assert (=> mapNonEmpty!4967 m!175611))

(declare-fun m!175613 () Bool)

(assert (=> b!146111 m!175613))

(declare-fun m!175615 () Bool)

(assert (=> b!146107 m!175615))

(declare-fun m!175617 () Bool)

(assert (=> b!146107 m!175617))

(assert (=> b!146107 m!175605))

(declare-fun m!175619 () Bool)

(assert (=> b!146107 m!175619))

(assert (=> b!146107 m!175605))

(assert (=> b!146107 m!175605))

(declare-fun m!175621 () Bool)

(assert (=> b!146107 m!175621))

(assert (=> b!146107 m!175605))

(declare-fun m!175623 () Bool)

(assert (=> b!146107 m!175623))

(declare-fun m!175625 () Bool)

(assert (=> b!146104 m!175625))

(declare-fun m!175627 () Bool)

(assert (=> b!146104 m!175627))

(declare-fun m!175629 () Bool)

(assert (=> b!146104 m!175629))

(assert (=> b!146104 m!175605))

(assert (=> b!146104 m!175627))

(assert (=> b!146104 m!175605))

(declare-fun m!175631 () Bool)

(assert (=> b!146104 m!175631))

(assert (=> b!146104 m!175605))

(assert (=> b!146104 m!175629))

(declare-fun m!175633 () Bool)

(assert (=> b!146104 m!175633))

(assert (=> b!146104 m!175625))

(check-sat (not b!146107) (not b!146109) b_and!9097 (not b_lambda!6531) (not b!146111) (not b_next!3097) (not start!15200) (not b_next!3099) (not mapNonEmpty!4968) tp_is_empty!2965 (not b!146112) (not b!146104) (not b!146095) (not mapNonEmpty!4967) (not b!146100) b_and!9099)
(check-sat b_and!9097 b_and!9099 (not b_next!3097) (not b_next!3099))
