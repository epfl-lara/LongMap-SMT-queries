; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8274 () Bool)

(assert start!8274)

(declare-fun b!53099 () Bool)

(declare-fun b_free!1705 () Bool)

(declare-fun b_next!1705 () Bool)

(assert (=> b!53099 (= b_free!1705 (not b_next!1705))))

(declare-fun tp!7218 () Bool)

(declare-fun b_and!2949 () Bool)

(assert (=> b!53099 (= tp!7218 b_and!2949)))

(declare-fun b!53093 () Bool)

(declare-fun b_free!1707 () Bool)

(declare-fun b_next!1707 () Bool)

(assert (=> b!53093 (= b_free!1707 (not b_next!1707))))

(declare-fun tp!7216 () Bool)

(declare-fun b_and!2951 () Bool)

(assert (=> b!53093 (= tp!7216 b_and!2951)))

(declare-fun b!53088 () Bool)

(declare-fun e!34622 () Bool)

(assert (=> b!53088 (= e!34622 false)))

(declare-datatypes ((V!2673 0))(
  ( (V!2674 (val!1179 Int)) )
))
(declare-datatypes ((array!3447 0))(
  ( (array!3448 (arr!1646 (Array (_ BitVec 32) (_ BitVec 64))) (size!1875 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!791 0))(
  ( (ValueCellFull!791 (v!2247 V!2673)) (EmptyCell!791) )
))
(declare-datatypes ((array!3449 0))(
  ( (array!3450 (arr!1647 (Array (_ BitVec 32) ValueCell!791)) (size!1876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!490 0))(
  ( (LongMapFixedSize!491 (defaultEntry!1959 Int) (mask!5792 (_ BitVec 32)) (extraKeys!1850 (_ BitVec 32)) (zeroValue!1877 V!2673) (minValue!1877 V!2673) (_size!294 (_ BitVec 32)) (_keys!3579 array!3447) (_values!1942 array!3449) (_vacant!294 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!310 0))(
  ( (Cell!311 (v!2248 LongMapFixedSize!490)) )
))
(declare-datatypes ((LongMap!310 0))(
  ( (LongMap!311 (underlying!166 Cell!310)) )
))
(declare-fun thiss!992 () LongMap!310)

(declare-fun lt!21370 () Bool)

(declare-datatypes ((tuple2!1854 0))(
  ( (tuple2!1855 (_1!938 (_ BitVec 64)) (_2!938 V!2673)) )
))
(declare-datatypes ((List!1335 0))(
  ( (Nil!1332) (Cons!1331 (h!1911 tuple2!1854) (t!4409 List!1335)) )
))
(declare-datatypes ((ListLongMap!1253 0))(
  ( (ListLongMap!1254 (toList!642 List!1335)) )
))
(declare-fun lt!21368 () ListLongMap!1253)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!621 (ListLongMap!1253 (_ BitVec 64)) Bool)

(assert (=> b!53088 (= lt!21370 (contains!621 lt!21368 (select (arr!1646 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) from!355)))))

(declare-fun res!30124 () Bool)

(declare-fun e!34623 () Bool)

(assert (=> start!8274 (=> (not res!30124) (not e!34623))))

(declare-fun valid!189 (LongMap!310) Bool)

(assert (=> start!8274 (= res!30124 (valid!189 thiss!992))))

(assert (=> start!8274 e!34623))

(declare-fun e!34630 () Bool)

(assert (=> start!8274 e!34630))

(assert (=> start!8274 true))

(declare-fun e!34628 () Bool)

(assert (=> start!8274 e!34628))

(declare-fun b!53089 () Bool)

(declare-fun e!34627 () Bool)

(declare-fun tp_is_empty!2269 () Bool)

(assert (=> b!53089 (= e!34627 tp_is_empty!2269)))

(declare-fun mapNonEmpty!2477 () Bool)

(declare-fun mapRes!2478 () Bool)

(declare-fun tp!7215 () Bool)

(declare-fun e!34619 () Bool)

(assert (=> mapNonEmpty!2477 (= mapRes!2478 (and tp!7215 e!34619))))

(declare-fun mapRest!2477 () (Array (_ BitVec 32) ValueCell!791))

(declare-fun newMap!16 () LongMapFixedSize!490)

(declare-fun mapKey!2478 () (_ BitVec 32))

(declare-fun mapValue!2478 () ValueCell!791)

(assert (=> mapNonEmpty!2477 (= (arr!1647 (_values!1942 newMap!16)) (store mapRest!2477 mapKey!2478 mapValue!2478))))

(declare-fun b!53090 () Bool)

(declare-fun e!34626 () Bool)

(assert (=> b!53090 (= e!34626 tp_is_empty!2269)))

(declare-fun b!53091 () Bool)

(declare-fun e!34616 () Bool)

(declare-fun mapRes!2477 () Bool)

(assert (=> b!53091 (= e!34616 (and e!34626 mapRes!2477))))

(declare-fun condMapEmpty!2477 () Bool)

(declare-fun mapDefault!2478 () ValueCell!791)

(assert (=> b!53091 (= condMapEmpty!2477 (= (arr!1647 (_values!1942 (v!2248 (underlying!166 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!791)) mapDefault!2478)))))

(declare-fun b!53092 () Bool)

(declare-fun e!34621 () Bool)

(assert (=> b!53092 (= e!34623 e!34621)))

(declare-fun res!30125 () Bool)

(assert (=> b!53092 (=> (not res!30125) (not e!34621))))

(declare-fun lt!21371 () ListLongMap!1253)

(assert (=> b!53092 (= res!30125 (and (= lt!21368 lt!21371) (not (= (select (arr!1646 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1646 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1027 (LongMapFixedSize!490) ListLongMap!1253)

(assert (=> b!53092 (= lt!21371 (map!1027 newMap!16))))

(declare-fun getCurrentListMap!349 (array!3447 array!3449 (_ BitVec 32) (_ BitVec 32) V!2673 V!2673 (_ BitVec 32) Int) ListLongMap!1253)

(assert (=> b!53092 (= lt!21368 (getCurrentListMap!349 (_keys!3579 (v!2248 (underlying!166 thiss!992))) (_values!1942 (v!2248 (underlying!166 thiss!992))) (mask!5792 (v!2248 (underlying!166 thiss!992))) (extraKeys!1850 (v!2248 (underlying!166 thiss!992))) (zeroValue!1877 (v!2248 (underlying!166 thiss!992))) (minValue!1877 (v!2248 (underlying!166 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1959 (v!2248 (underlying!166 thiss!992)))))))

(declare-fun e!34618 () Bool)

(declare-fun array_inv!999 (array!3447) Bool)

(declare-fun array_inv!1000 (array!3449) Bool)

(assert (=> b!53093 (= e!34628 (and tp!7216 tp_is_empty!2269 (array_inv!999 (_keys!3579 newMap!16)) (array_inv!1000 (_values!1942 newMap!16)) e!34618))))

(declare-fun b!53094 () Bool)

(declare-fun res!30127 () Bool)

(assert (=> b!53094 (=> (not res!30127) (not e!34622))))

(assert (=> b!53094 (= res!30127 (and (= (size!1876 (_values!1942 (v!2248 (underlying!166 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5792 (v!2248 (underlying!166 thiss!992))))) (= (size!1875 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) (size!1876 (_values!1942 (v!2248 (underlying!166 thiss!992))))) (bvsge (mask!5792 (v!2248 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1850 (v!2248 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1850 (v!2248 (underlying!166 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53095 () Bool)

(declare-fun res!30123 () Bool)

(assert (=> b!53095 (=> (not res!30123) (not e!34622))))

(assert (=> b!53095 (= res!30123 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1875 (_keys!3579 (v!2248 (underlying!166 thiss!992)))))))))

(declare-fun b!53096 () Bool)

(declare-fun res!30126 () Bool)

(assert (=> b!53096 (=> (not res!30126) (not e!34623))))

(declare-fun valid!190 (LongMapFixedSize!490) Bool)

(assert (=> b!53096 (= res!30126 (valid!190 newMap!16))))

(declare-fun b!53097 () Bool)

(assert (=> b!53097 (= e!34618 (and e!34627 mapRes!2478))))

(declare-fun condMapEmpty!2478 () Bool)

(declare-fun mapDefault!2477 () ValueCell!791)

(assert (=> b!53097 (= condMapEmpty!2478 (= (arr!1647 (_values!1942 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!791)) mapDefault!2477)))))

(declare-fun b!53098 () Bool)

(declare-fun e!34617 () Bool)

(assert (=> b!53098 (= e!34617 tp_is_empty!2269)))

(declare-fun e!34624 () Bool)

(assert (=> b!53099 (= e!34624 (and tp!7218 tp_is_empty!2269 (array_inv!999 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) (array_inv!1000 (_values!1942 (v!2248 (underlying!166 thiss!992)))) e!34616))))

(declare-fun b!53100 () Bool)

(declare-fun res!30130 () Bool)

(assert (=> b!53100 (=> (not res!30130) (not e!34623))))

(assert (=> b!53100 (= res!30130 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5792 newMap!16)) (_size!294 (v!2248 (underlying!166 thiss!992)))))))

(declare-fun b!53101 () Bool)

(declare-fun res!30129 () Bool)

(assert (=> b!53101 (=> (not res!30129) (not e!34622))))

(declare-datatypes ((List!1336 0))(
  ( (Nil!1333) (Cons!1332 (h!1912 (_ BitVec 64)) (t!4410 List!1336)) )
))
(declare-fun arrayNoDuplicates!0 (array!3447 (_ BitVec 32) List!1336) Bool)

(assert (=> b!53101 (= res!30129 (arrayNoDuplicates!0 (_keys!3579 (v!2248 (underlying!166 thiss!992))) #b00000000000000000000000000000000 Nil!1333))))

(declare-fun b!53102 () Bool)

(declare-fun e!34629 () Bool)

(assert (=> b!53102 (= e!34630 e!34629)))

(declare-fun mapNonEmpty!2478 () Bool)

(declare-fun tp!7217 () Bool)

(assert (=> mapNonEmpty!2478 (= mapRes!2477 (and tp!7217 e!34617))))

(declare-fun mapKey!2477 () (_ BitVec 32))

(declare-fun mapRest!2478 () (Array (_ BitVec 32) ValueCell!791))

(declare-fun mapValue!2477 () ValueCell!791)

(assert (=> mapNonEmpty!2478 (= (arr!1647 (_values!1942 (v!2248 (underlying!166 thiss!992)))) (store mapRest!2478 mapKey!2477 mapValue!2477))))

(declare-fun b!53103 () Bool)

(declare-fun res!30132 () Bool)

(assert (=> b!53103 (=> (not res!30132) (not e!34623))))

(assert (=> b!53103 (= res!30132 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1875 (_keys!3579 (v!2248 (underlying!166 thiss!992)))))))))

(declare-fun mapIsEmpty!2477 () Bool)

(assert (=> mapIsEmpty!2477 mapRes!2477))

(declare-fun b!53104 () Bool)

(assert (=> b!53104 (= e!34621 e!34622)))

(declare-fun res!30133 () Bool)

(assert (=> b!53104 (=> (not res!30133) (not e!34622))))

(assert (=> b!53104 (= res!30133 (contains!621 lt!21371 (select (arr!1646 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1856 0))(
  ( (tuple2!1857 (_1!939 Bool) (_2!939 LongMapFixedSize!490)) )
))
(declare-fun lt!21369 () tuple2!1856)

(declare-fun update!51 (LongMapFixedSize!490 (_ BitVec 64) V!2673) tuple2!1856)

(declare-fun get!990 (ValueCell!791 V!2673) V!2673)

(declare-fun dynLambda!269 (Int (_ BitVec 64)) V!2673)

(assert (=> b!53104 (= lt!21369 (update!51 newMap!16 (select (arr!1646 (_keys!3579 (v!2248 (underlying!166 thiss!992)))) from!355) (get!990 (select (arr!1647 (_values!1942 (v!2248 (underlying!166 thiss!992)))) from!355) (dynLambda!269 (defaultEntry!1959 (v!2248 (underlying!166 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53105 () Bool)

(assert (=> b!53105 (= e!34619 tp_is_empty!2269)))

(declare-fun b!53106 () Bool)

(declare-fun res!30128 () Bool)

(assert (=> b!53106 (=> (not res!30128) (not e!34622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3447 (_ BitVec 32)) Bool)

(assert (=> b!53106 (= res!30128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3579 (v!2248 (underlying!166 thiss!992))) (mask!5792 (v!2248 (underlying!166 thiss!992)))))))

(declare-fun b!53107 () Bool)

(assert (=> b!53107 (= e!34629 e!34624)))

(declare-fun mapIsEmpty!2478 () Bool)

(assert (=> mapIsEmpty!2478 mapRes!2478))

(declare-fun b!53108 () Bool)

(declare-fun res!30131 () Bool)

(assert (=> b!53108 (=> (not res!30131) (not e!34622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53108 (= res!30131 (validMask!0 (mask!5792 (v!2248 (underlying!166 thiss!992)))))))

(assert (= (and start!8274 res!30124) b!53103))

(assert (= (and b!53103 res!30132) b!53096))

(assert (= (and b!53096 res!30126) b!53100))

(assert (= (and b!53100 res!30130) b!53092))

(assert (= (and b!53092 res!30125) b!53104))

(assert (= (and b!53104 res!30133) b!53108))

(assert (= (and b!53108 res!30131) b!53094))

(assert (= (and b!53094 res!30127) b!53106))

(assert (= (and b!53106 res!30128) b!53101))

(assert (= (and b!53101 res!30129) b!53095))

(assert (= (and b!53095 res!30123) b!53088))

(assert (= (and b!53091 condMapEmpty!2477) mapIsEmpty!2477))

(assert (= (and b!53091 (not condMapEmpty!2477)) mapNonEmpty!2478))

(get-info :version)

(assert (= (and mapNonEmpty!2478 ((_ is ValueCellFull!791) mapValue!2477)) b!53098))

(assert (= (and b!53091 ((_ is ValueCellFull!791) mapDefault!2478)) b!53090))

(assert (= b!53099 b!53091))

(assert (= b!53107 b!53099))

(assert (= b!53102 b!53107))

(assert (= start!8274 b!53102))

(assert (= (and b!53097 condMapEmpty!2478) mapIsEmpty!2478))

(assert (= (and b!53097 (not condMapEmpty!2478)) mapNonEmpty!2477))

(assert (= (and mapNonEmpty!2477 ((_ is ValueCellFull!791) mapValue!2478)) b!53105))

(assert (= (and b!53097 ((_ is ValueCellFull!791) mapDefault!2477)) b!53089))

(assert (= b!53093 b!53097))

(assert (= start!8274 b!53093))

(declare-fun b_lambda!2363 () Bool)

(assert (=> (not b_lambda!2363) (not b!53104)))

(declare-fun t!4406 () Bool)

(declare-fun tb!1049 () Bool)

(assert (=> (and b!53099 (= (defaultEntry!1959 (v!2248 (underlying!166 thiss!992))) (defaultEntry!1959 (v!2248 (underlying!166 thiss!992)))) t!4406) tb!1049))

(declare-fun result!1971 () Bool)

(assert (=> tb!1049 (= result!1971 tp_is_empty!2269)))

(assert (=> b!53104 t!4406))

(declare-fun b_and!2953 () Bool)

(assert (= b_and!2949 (and (=> t!4406 result!1971) b_and!2953)))

(declare-fun t!4408 () Bool)

(declare-fun tb!1051 () Bool)

(assert (=> (and b!53093 (= (defaultEntry!1959 newMap!16) (defaultEntry!1959 (v!2248 (underlying!166 thiss!992)))) t!4408) tb!1051))

(declare-fun result!1975 () Bool)

(assert (= result!1975 result!1971))

(assert (=> b!53104 t!4408))

(declare-fun b_and!2955 () Bool)

(assert (= b_and!2951 (and (=> t!4408 result!1975) b_and!2955)))

(declare-fun m!45121 () Bool)

(assert (=> b!53101 m!45121))

(declare-fun m!45123 () Bool)

(assert (=> b!53092 m!45123))

(declare-fun m!45125 () Bool)

(assert (=> b!53092 m!45125))

(declare-fun m!45127 () Bool)

(assert (=> b!53092 m!45127))

(declare-fun m!45129 () Bool)

(assert (=> b!53104 m!45129))

(declare-fun m!45131 () Bool)

(assert (=> b!53104 m!45131))

(declare-fun m!45133 () Bool)

(assert (=> b!53104 m!45133))

(assert (=> b!53104 m!45123))

(declare-fun m!45135 () Bool)

(assert (=> b!53104 m!45135))

(assert (=> b!53104 m!45123))

(assert (=> b!53104 m!45131))

(assert (=> b!53104 m!45123))

(assert (=> b!53104 m!45133))

(declare-fun m!45137 () Bool)

(assert (=> b!53104 m!45137))

(assert (=> b!53104 m!45129))

(declare-fun m!45139 () Bool)

(assert (=> mapNonEmpty!2478 m!45139))

(declare-fun m!45141 () Bool)

(assert (=> b!53106 m!45141))

(assert (=> b!53088 m!45123))

(assert (=> b!53088 m!45123))

(declare-fun m!45143 () Bool)

(assert (=> b!53088 m!45143))

(declare-fun m!45145 () Bool)

(assert (=> b!53108 m!45145))

(declare-fun m!45147 () Bool)

(assert (=> mapNonEmpty!2477 m!45147))

(declare-fun m!45149 () Bool)

(assert (=> b!53099 m!45149))

(declare-fun m!45151 () Bool)

(assert (=> b!53099 m!45151))

(declare-fun m!45153 () Bool)

(assert (=> start!8274 m!45153))

(declare-fun m!45155 () Bool)

(assert (=> b!53093 m!45155))

(declare-fun m!45157 () Bool)

(assert (=> b!53093 m!45157))

(declare-fun m!45159 () Bool)

(assert (=> b!53096 m!45159))

(check-sat b_and!2955 (not b_next!1705) (not start!8274) (not b!53096) (not mapNonEmpty!2477) (not b!53099) (not b_lambda!2363) (not b!53108) (not b!53104) (not b!53106) (not b!53092) (not mapNonEmpty!2478) (not b_next!1707) tp_is_empty!2269 b_and!2953 (not b!53093) (not b!53101) (not b!53088))
(check-sat b_and!2953 b_and!2955 (not b_next!1705) (not b_next!1707))
