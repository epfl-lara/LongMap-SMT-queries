; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8274 () Bool)

(assert start!8274)

(declare-fun b!53089 () Bool)

(declare-fun b_free!1705 () Bool)

(declare-fun b_next!1705 () Bool)

(assert (=> b!53089 (= b_free!1705 (not b_next!1705))))

(declare-fun tp!7217 () Bool)

(declare-fun b_and!2953 () Bool)

(assert (=> b!53089 (= tp!7217 b_and!2953)))

(declare-fun b!53091 () Bool)

(declare-fun b_free!1707 () Bool)

(declare-fun b_next!1707 () Bool)

(assert (=> b!53091 (= b_free!1707 (not b_next!1707))))

(declare-fun tp!7215 () Bool)

(declare-fun b_and!2955 () Bool)

(assert (=> b!53091 (= tp!7215 b_and!2955)))

(declare-fun b!53079 () Bool)

(declare-fun res!30134 () Bool)

(declare-fun e!34618 () Bool)

(assert (=> b!53079 (=> (not res!30134) (not e!34618))))

(declare-datatypes ((V!2673 0))(
  ( (V!2674 (val!1179 Int)) )
))
(declare-datatypes ((array!3441 0))(
  ( (array!3442 (arr!1642 (Array (_ BitVec 32) (_ BitVec 64))) (size!1872 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!791 0))(
  ( (ValueCellFull!791 (v!2244 V!2673)) (EmptyCell!791) )
))
(declare-datatypes ((array!3443 0))(
  ( (array!3444 (arr!1643 (Array (_ BitVec 32) ValueCell!791)) (size!1873 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!490 0))(
  ( (LongMapFixedSize!491 (defaultEntry!1959 Int) (mask!5791 (_ BitVec 32)) (extraKeys!1850 (_ BitVec 32)) (zeroValue!1877 V!2673) (minValue!1877 V!2673) (_size!294 (_ BitVec 32)) (_keys!3578 array!3441) (_values!1942 array!3443) (_vacant!294 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!490)

(declare-datatypes ((Cell!310 0))(
  ( (Cell!311 (v!2245 LongMapFixedSize!490)) )
))
(declare-datatypes ((LongMap!310 0))(
  ( (LongMap!311 (underlying!166 Cell!310)) )
))
(declare-fun thiss!992 () LongMap!310)

(assert (=> b!53079 (= res!30134 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5791 newMap!16)) (_size!294 (v!2245 (underlying!166 thiss!992)))))))

(declare-fun b!53080 () Bool)

(declare-fun e!34615 () Bool)

(declare-fun e!34611 () Bool)

(assert (=> b!53080 (= e!34615 e!34611)))

(declare-fun res!30132 () Bool)

(assert (=> b!53080 (=> (not res!30132) (not e!34611))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1884 0))(
  ( (tuple2!1885 (_1!953 (_ BitVec 64)) (_2!953 V!2673)) )
))
(declare-datatypes ((List!1351 0))(
  ( (Nil!1348) (Cons!1347 (h!1927 tuple2!1884) (t!4424 List!1351)) )
))
(declare-datatypes ((ListLongMap!1273 0))(
  ( (ListLongMap!1274 (toList!652 List!1351)) )
))
(declare-fun lt!21398 () ListLongMap!1273)

(declare-fun contains!629 (ListLongMap!1273 (_ BitVec 64)) Bool)

(assert (=> b!53080 (= res!30132 (contains!629 lt!21398 (select (arr!1642 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1886 0))(
  ( (tuple2!1887 (_1!954 Bool) (_2!954 LongMapFixedSize!490)) )
))
(declare-fun lt!21396 () tuple2!1886)

(declare-fun update!50 (LongMapFixedSize!490 (_ BitVec 64) V!2673) tuple2!1886)

(declare-fun get!992 (ValueCell!791 V!2673) V!2673)

(declare-fun dynLambda!274 (Int (_ BitVec 64)) V!2673)

(assert (=> b!53080 (= lt!21396 (update!50 newMap!16 (select (arr!1642 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) from!355) (get!992 (select (arr!1643 (_values!1942 (v!2245 (underlying!166 thiss!992)))) from!355) (dynLambda!274 (defaultEntry!1959 (v!2245 (underlying!166 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53081 () Bool)

(declare-fun e!34624 () Bool)

(declare-fun e!34617 () Bool)

(declare-fun mapRes!2477 () Bool)

(assert (=> b!53081 (= e!34624 (and e!34617 mapRes!2477))))

(declare-fun condMapEmpty!2478 () Bool)

(declare-fun mapDefault!2477 () ValueCell!791)

(assert (=> b!53081 (= condMapEmpty!2478 (= (arr!1643 (_values!1942 (v!2245 (underlying!166 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!791)) mapDefault!2477)))))

(declare-fun b!53082 () Bool)

(declare-fun res!30137 () Bool)

(assert (=> b!53082 (=> (not res!30137) (not e!34611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53082 (= res!30137 (validMask!0 (mask!5791 (v!2245 (underlying!166 thiss!992)))))))

(declare-fun mapNonEmpty!2477 () Bool)

(declare-fun mapRes!2478 () Bool)

(declare-fun tp!7218 () Bool)

(declare-fun e!34623 () Bool)

(assert (=> mapNonEmpty!2477 (= mapRes!2478 (and tp!7218 e!34623))))

(declare-fun mapKey!2477 () (_ BitVec 32))

(declare-fun mapValue!2478 () ValueCell!791)

(declare-fun mapRest!2478 () (Array (_ BitVec 32) ValueCell!791))

(assert (=> mapNonEmpty!2477 (= (arr!1643 (_values!1942 newMap!16)) (store mapRest!2478 mapKey!2477 mapValue!2478))))

(declare-fun b!53083 () Bool)

(declare-fun e!34612 () Bool)

(declare-fun tp_is_empty!2269 () Bool)

(assert (=> b!53083 (= e!34612 tp_is_empty!2269)))

(declare-fun b!53084 () Bool)

(declare-fun res!30136 () Bool)

(assert (=> b!53084 (=> (not res!30136) (not e!34618))))

(assert (=> b!53084 (= res!30136 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1872 (_keys!3578 (v!2245 (underlying!166 thiss!992)))))))))

(declare-fun b!53085 () Bool)

(declare-fun res!30129 () Bool)

(assert (=> b!53085 (=> (not res!30129) (not e!34618))))

(declare-fun valid!189 (LongMapFixedSize!490) Bool)

(assert (=> b!53085 (= res!30129 (valid!189 newMap!16))))

(declare-fun mapIsEmpty!2477 () Bool)

(assert (=> mapIsEmpty!2477 mapRes!2478))

(declare-fun b!53086 () Bool)

(declare-fun res!30138 () Bool)

(assert (=> b!53086 (=> (not res!30138) (not e!34611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3441 (_ BitVec 32)) Bool)

(assert (=> b!53086 (= res!30138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3578 (v!2245 (underlying!166 thiss!992))) (mask!5791 (v!2245 (underlying!166 thiss!992)))))))

(declare-fun b!53087 () Bool)

(declare-fun e!34613 () Bool)

(declare-fun e!34619 () Bool)

(assert (=> b!53087 (= e!34613 (and e!34619 mapRes!2478))))

(declare-fun condMapEmpty!2477 () Bool)

(declare-fun mapDefault!2478 () ValueCell!791)

(assert (=> b!53087 (= condMapEmpty!2477 (= (arr!1643 (_values!1942 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!791)) mapDefault!2478)))))

(declare-fun mapNonEmpty!2478 () Bool)

(declare-fun tp!7216 () Bool)

(assert (=> mapNonEmpty!2478 (= mapRes!2477 (and tp!7216 e!34612))))

(declare-fun mapKey!2478 () (_ BitVec 32))

(declare-fun mapValue!2477 () ValueCell!791)

(declare-fun mapRest!2477 () (Array (_ BitVec 32) ValueCell!791))

(assert (=> mapNonEmpty!2478 (= (arr!1643 (_values!1942 (v!2245 (underlying!166 thiss!992)))) (store mapRest!2477 mapKey!2478 mapValue!2477))))

(declare-fun b!53088 () Bool)

(assert (=> b!53088 (= e!34611 false)))

(declare-fun lt!21397 () Bool)

(declare-fun lt!21395 () ListLongMap!1273)

(assert (=> b!53088 (= lt!21397 (contains!629 lt!21395 (select (arr!1642 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) from!355)))))

(declare-fun e!34622 () Bool)

(declare-fun array_inv!1005 (array!3441) Bool)

(declare-fun array_inv!1006 (array!3443) Bool)

(assert (=> b!53089 (= e!34622 (and tp!7217 tp_is_empty!2269 (array_inv!1005 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) (array_inv!1006 (_values!1942 (v!2245 (underlying!166 thiss!992)))) e!34624))))

(declare-fun b!53090 () Bool)

(assert (=> b!53090 (= e!34617 tp_is_empty!2269)))

(declare-fun res!30135 () Bool)

(assert (=> start!8274 (=> (not res!30135) (not e!34618))))

(declare-fun valid!190 (LongMap!310) Bool)

(assert (=> start!8274 (= res!30135 (valid!190 thiss!992))))

(assert (=> start!8274 e!34618))

(declare-fun e!34610 () Bool)

(assert (=> start!8274 e!34610))

(assert (=> start!8274 true))

(declare-fun e!34620 () Bool)

(assert (=> start!8274 e!34620))

(assert (=> b!53091 (= e!34620 (and tp!7215 tp_is_empty!2269 (array_inv!1005 (_keys!3578 newMap!16)) (array_inv!1006 (_values!1942 newMap!16)) e!34613))))

(declare-fun b!53092 () Bool)

(declare-fun res!30128 () Bool)

(assert (=> b!53092 (=> (not res!30128) (not e!34611))))

(assert (=> b!53092 (= res!30128 (and (= (size!1873 (_values!1942 (v!2245 (underlying!166 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5791 (v!2245 (underlying!166 thiss!992))))) (= (size!1872 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) (size!1873 (_values!1942 (v!2245 (underlying!166 thiss!992))))) (bvsge (mask!5791 (v!2245 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1850 (v!2245 (underlying!166 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1850 (v!2245 (underlying!166 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53093 () Bool)

(declare-fun res!30131 () Bool)

(assert (=> b!53093 (=> (not res!30131) (not e!34611))))

(declare-datatypes ((List!1352 0))(
  ( (Nil!1349) (Cons!1348 (h!1928 (_ BitVec 64)) (t!4425 List!1352)) )
))
(declare-fun arrayNoDuplicates!0 (array!3441 (_ BitVec 32) List!1352) Bool)

(assert (=> b!53093 (= res!30131 (arrayNoDuplicates!0 (_keys!3578 (v!2245 (underlying!166 thiss!992))) #b00000000000000000000000000000000 Nil!1349))))

(declare-fun b!53094 () Bool)

(declare-fun e!34616 () Bool)

(assert (=> b!53094 (= e!34616 e!34622)))

(declare-fun b!53095 () Bool)

(assert (=> b!53095 (= e!34610 e!34616)))

(declare-fun b!53096 () Bool)

(assert (=> b!53096 (= e!34623 tp_is_empty!2269)))

(declare-fun b!53097 () Bool)

(assert (=> b!53097 (= e!34618 e!34615)))

(declare-fun res!30130 () Bool)

(assert (=> b!53097 (=> (not res!30130) (not e!34615))))

(assert (=> b!53097 (= res!30130 (and (= lt!21395 lt!21398) (not (= (select (arr!1642 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1642 (_keys!3578 (v!2245 (underlying!166 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1028 (LongMapFixedSize!490) ListLongMap!1273)

(assert (=> b!53097 (= lt!21398 (map!1028 newMap!16))))

(declare-fun getCurrentListMap!356 (array!3441 array!3443 (_ BitVec 32) (_ BitVec 32) V!2673 V!2673 (_ BitVec 32) Int) ListLongMap!1273)

(assert (=> b!53097 (= lt!21395 (getCurrentListMap!356 (_keys!3578 (v!2245 (underlying!166 thiss!992))) (_values!1942 (v!2245 (underlying!166 thiss!992))) (mask!5791 (v!2245 (underlying!166 thiss!992))) (extraKeys!1850 (v!2245 (underlying!166 thiss!992))) (zeroValue!1877 (v!2245 (underlying!166 thiss!992))) (minValue!1877 (v!2245 (underlying!166 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1959 (v!2245 (underlying!166 thiss!992)))))))

(declare-fun mapIsEmpty!2478 () Bool)

(assert (=> mapIsEmpty!2478 mapRes!2477))

(declare-fun b!53098 () Bool)

(assert (=> b!53098 (= e!34619 tp_is_empty!2269)))

(declare-fun b!53099 () Bool)

(declare-fun res!30133 () Bool)

(assert (=> b!53099 (=> (not res!30133) (not e!34611))))

(assert (=> b!53099 (= res!30133 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1872 (_keys!3578 (v!2245 (underlying!166 thiss!992)))))))))

(assert (= (and start!8274 res!30135) b!53084))

(assert (= (and b!53084 res!30136) b!53085))

(assert (= (and b!53085 res!30129) b!53079))

(assert (= (and b!53079 res!30134) b!53097))

(assert (= (and b!53097 res!30130) b!53080))

(assert (= (and b!53080 res!30132) b!53082))

(assert (= (and b!53082 res!30137) b!53092))

(assert (= (and b!53092 res!30128) b!53086))

(assert (= (and b!53086 res!30138) b!53093))

(assert (= (and b!53093 res!30131) b!53099))

(assert (= (and b!53099 res!30133) b!53088))

(assert (= (and b!53081 condMapEmpty!2478) mapIsEmpty!2478))

(assert (= (and b!53081 (not condMapEmpty!2478)) mapNonEmpty!2478))

(get-info :version)

(assert (= (and mapNonEmpty!2478 ((_ is ValueCellFull!791) mapValue!2477)) b!53083))

(assert (= (and b!53081 ((_ is ValueCellFull!791) mapDefault!2477)) b!53090))

(assert (= b!53089 b!53081))

(assert (= b!53094 b!53089))

(assert (= b!53095 b!53094))

(assert (= start!8274 b!53095))

(assert (= (and b!53087 condMapEmpty!2477) mapIsEmpty!2477))

(assert (= (and b!53087 (not condMapEmpty!2477)) mapNonEmpty!2477))

(assert (= (and mapNonEmpty!2477 ((_ is ValueCellFull!791) mapValue!2478)) b!53096))

(assert (= (and b!53087 ((_ is ValueCellFull!791) mapDefault!2478)) b!53098))

(assert (= b!53091 b!53087))

(assert (= start!8274 b!53091))

(declare-fun b_lambda!2367 () Bool)

(assert (=> (not b_lambda!2367) (not b!53080)))

(declare-fun t!4421 () Bool)

(declare-fun tb!1049 () Bool)

(assert (=> (and b!53089 (= (defaultEntry!1959 (v!2245 (underlying!166 thiss!992))) (defaultEntry!1959 (v!2245 (underlying!166 thiss!992)))) t!4421) tb!1049))

(declare-fun result!1971 () Bool)

(assert (=> tb!1049 (= result!1971 tp_is_empty!2269)))

(assert (=> b!53080 t!4421))

(declare-fun b_and!2957 () Bool)

(assert (= b_and!2953 (and (=> t!4421 result!1971) b_and!2957)))

(declare-fun t!4423 () Bool)

(declare-fun tb!1051 () Bool)

(assert (=> (and b!53091 (= (defaultEntry!1959 newMap!16) (defaultEntry!1959 (v!2245 (underlying!166 thiss!992)))) t!4423) tb!1051))

(declare-fun result!1975 () Bool)

(assert (= result!1975 result!1971))

(assert (=> b!53080 t!4423))

(declare-fun b_and!2959 () Bool)

(assert (= b_and!2955 (and (=> t!4423 result!1975) b_and!2959)))

(declare-fun m!45163 () Bool)

(assert (=> b!53089 m!45163))

(declare-fun m!45165 () Bool)

(assert (=> b!53089 m!45165))

(declare-fun m!45167 () Bool)

(assert (=> b!53085 m!45167))

(declare-fun m!45169 () Bool)

(assert (=> b!53091 m!45169))

(declare-fun m!45171 () Bool)

(assert (=> b!53091 m!45171))

(declare-fun m!45173 () Bool)

(assert (=> mapNonEmpty!2477 m!45173))

(declare-fun m!45175 () Bool)

(assert (=> b!53093 m!45175))

(declare-fun m!45177 () Bool)

(assert (=> start!8274 m!45177))

(declare-fun m!45179 () Bool)

(assert (=> b!53088 m!45179))

(assert (=> b!53088 m!45179))

(declare-fun m!45181 () Bool)

(assert (=> b!53088 m!45181))

(assert (=> b!53097 m!45179))

(declare-fun m!45183 () Bool)

(assert (=> b!53097 m!45183))

(declare-fun m!45185 () Bool)

(assert (=> b!53097 m!45185))

(declare-fun m!45187 () Bool)

(assert (=> mapNonEmpty!2478 m!45187))

(declare-fun m!45189 () Bool)

(assert (=> b!53082 m!45189))

(declare-fun m!45191 () Bool)

(assert (=> b!53080 m!45191))

(declare-fun m!45193 () Bool)

(assert (=> b!53080 m!45193))

(declare-fun m!45195 () Bool)

(assert (=> b!53080 m!45195))

(assert (=> b!53080 m!45179))

(declare-fun m!45197 () Bool)

(assert (=> b!53080 m!45197))

(assert (=> b!53080 m!45179))

(assert (=> b!53080 m!45193))

(assert (=> b!53080 m!45179))

(assert (=> b!53080 m!45195))

(declare-fun m!45199 () Bool)

(assert (=> b!53080 m!45199))

(assert (=> b!53080 m!45191))

(declare-fun m!45201 () Bool)

(assert (=> b!53086 m!45201))

(check-sat (not b_next!1707) (not b!53089) (not b!53085) (not b!53091) (not b!53088) (not mapNonEmpty!2477) (not b!53080) (not b_next!1705) tp_is_empty!2269 (not b_lambda!2367) (not b!53082) (not start!8274) (not b!53086) (not b!53093) b_and!2959 (not mapNonEmpty!2478) (not b!53097) b_and!2957)
(check-sat b_and!2957 b_and!2959 (not b_next!1705) (not b_next!1707))
