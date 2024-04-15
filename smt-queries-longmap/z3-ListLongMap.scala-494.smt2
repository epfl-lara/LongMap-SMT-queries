; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11116 () Bool)

(assert start!11116)

(declare-fun b!90765 () Bool)

(declare-fun b_free!2317 () Bool)

(declare-fun b_next!2317 () Bool)

(assert (=> b!90765 (= b_free!2317 (not b_next!2317))))

(declare-fun tp!9202 () Bool)

(declare-fun b_and!5485 () Bool)

(assert (=> b!90765 (= tp!9202 b_and!5485)))

(declare-fun b!90764 () Bool)

(declare-fun b_free!2319 () Bool)

(declare-fun b_next!2319 () Bool)

(assert (=> b!90764 (= b_free!2319 (not b_next!2319))))

(declare-fun tp!9200 () Bool)

(declare-fun b_and!5487 () Bool)

(assert (=> b!90764 (= tp!9200 b_and!5487)))

(declare-fun b!90758 () Bool)

(declare-fun res!46275 () Bool)

(declare-fun e!59199 () Bool)

(assert (=> b!90758 (=> (not res!46275) (not e!59199))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3081 0))(
  ( (V!3082 (val!1332 Int)) )
))
(declare-datatypes ((array!4097 0))(
  ( (array!4098 (arr!1948 (Array (_ BitVec 32) (_ BitVec 64))) (size!2196 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!944 0))(
  ( (ValueCellFull!944 (v!2704 V!3081)) (EmptyCell!944) )
))
(declare-datatypes ((array!4099 0))(
  ( (array!4100 (arr!1949 (Array (_ BitVec 32) ValueCell!944)) (size!2197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!796 0))(
  ( (LongMapFixedSize!797 (defaultEntry!2399 Int) (mask!6456 (_ BitVec 32)) (extraKeys!2230 (_ BitVec 32)) (zeroValue!2287 V!3081) (minValue!2287 V!3081) (_size!447 (_ BitVec 32)) (_keys!4078 array!4097) (_values!2382 array!4099) (_vacant!447 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!588 0))(
  ( (Cell!589 (v!2705 LongMapFixedSize!796)) )
))
(declare-datatypes ((LongMap!588 0))(
  ( (LongMap!589 (underlying!305 Cell!588)) )
))
(declare-fun thiss!992 () LongMap!588)

(assert (=> b!90758 (= res!46275 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992)))))))))

(declare-fun mapNonEmpty!3543 () Bool)

(declare-fun mapRes!3544 () Bool)

(declare-fun tp!9199 () Bool)

(declare-fun e!59186 () Bool)

(assert (=> mapNonEmpty!3543 (= mapRes!3544 (and tp!9199 e!59186))))

(declare-fun mapRest!3544 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapValue!3543 () ValueCell!944)

(declare-fun mapKey!3543 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!796)

(assert (=> mapNonEmpty!3543 (= (arr!1949 (_values!2382 newMap!16)) (store mapRest!3544 mapKey!3543 mapValue!3543))))

(declare-fun mapNonEmpty!3544 () Bool)

(declare-fun mapRes!3543 () Bool)

(declare-fun tp!9201 () Bool)

(declare-fun e!59187 () Bool)

(assert (=> mapNonEmpty!3544 (= mapRes!3543 (and tp!9201 e!59187))))

(declare-fun mapRest!3543 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapValue!3544 () ValueCell!944)

(declare-fun mapKey!3544 () (_ BitVec 32))

(assert (=> mapNonEmpty!3544 (= (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (store mapRest!3543 mapKey!3544 mapValue!3544))))

(declare-fun mapIsEmpty!3543 () Bool)

(assert (=> mapIsEmpty!3543 mapRes!3543))

(declare-fun b!90759 () Bool)

(declare-fun e!59185 () Bool)

(declare-fun e!59200 () Bool)

(assert (=> b!90759 (= e!59185 (and e!59200 mapRes!3544))))

(declare-fun condMapEmpty!3544 () Bool)

(declare-fun mapDefault!3543 () ValueCell!944)

(assert (=> b!90759 (= condMapEmpty!3544 (= (arr!1949 (_values!2382 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3543)))))

(declare-fun b!90760 () Bool)

(declare-fun e!59192 () Bool)

(declare-fun e!59195 () Bool)

(assert (=> b!90760 (= e!59192 e!59195)))

(declare-fun b!90761 () Bool)

(declare-fun tp_is_empty!2575 () Bool)

(assert (=> b!90761 (= e!59187 tp_is_empty!2575)))

(declare-fun b!90762 () Bool)

(declare-fun e!59201 () Bool)

(declare-fun e!59198 () Bool)

(assert (=> b!90762 (= e!59201 e!59198)))

(declare-fun res!46280 () Bool)

(assert (=> b!90762 (=> (not res!46280) (not e!59198))))

(assert (=> b!90762 (= res!46280 (and (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44080 () V!3081)

(declare-fun get!1236 (ValueCell!944 V!3081) V!3081)

(declare-fun dynLambda!354 (Int (_ BitVec 64)) V!3081)

(assert (=> b!90762 (= lt!44080 (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90763 () Bool)

(assert (=> b!90763 (= e!59186 tp_is_empty!2575)))

(declare-fun b!90757 () Bool)

(declare-fun e!59193 () Bool)

(assert (=> b!90757 (= e!59193 tp_is_empty!2575)))

(declare-fun res!46278 () Bool)

(assert (=> start!11116 (=> (not res!46278) (not e!59199))))

(declare-fun valid!358 (LongMap!588) Bool)

(assert (=> start!11116 (= res!46278 (valid!358 thiss!992))))

(assert (=> start!11116 e!59199))

(declare-fun e!59188 () Bool)

(assert (=> start!11116 e!59188))

(assert (=> start!11116 true))

(declare-fun e!59194 () Bool)

(assert (=> start!11116 e!59194))

(declare-fun array_inv!1221 (array!4097) Bool)

(declare-fun array_inv!1222 (array!4099) Bool)

(assert (=> b!90764 (= e!59194 (and tp!9200 tp_is_empty!2575 (array_inv!1221 (_keys!4078 newMap!16)) (array_inv!1222 (_values!2382 newMap!16)) e!59185))))

(declare-fun mapIsEmpty!3544 () Bool)

(assert (=> mapIsEmpty!3544 mapRes!3544))

(declare-fun e!59189 () Bool)

(assert (=> b!90765 (= e!59195 (and tp!9202 tp_is_empty!2575 (array_inv!1221 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (array_inv!1222 (_values!2382 (v!2705 (underlying!305 thiss!992)))) e!59189))))

(declare-fun b!90766 () Bool)

(declare-fun res!46272 () Bool)

(assert (=> b!90766 (=> (not res!46272) (not e!59199))))

(assert (=> b!90766 (= res!46272 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6456 newMap!16)) (_size!447 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!90767 () Bool)

(assert (=> b!90767 (= e!59199 e!59201)))

(declare-fun res!46274 () Bool)

(assert (=> b!90767 (=> (not res!46274) (not e!59201))))

(declare-datatypes ((tuple2!2248 0))(
  ( (tuple2!2249 (_1!1135 (_ BitVec 64)) (_2!1135 V!3081)) )
))
(declare-datatypes ((List!1552 0))(
  ( (Nil!1549) (Cons!1548 (h!2140 tuple2!2248) (t!5365 List!1552)) )
))
(declare-datatypes ((ListLongMap!1475 0))(
  ( (ListLongMap!1476 (toList!753 List!1552)) )
))
(declare-fun lt!44084 () ListLongMap!1475)

(declare-fun lt!44086 () ListLongMap!1475)

(assert (=> b!90767 (= res!46274 (= lt!44084 lt!44086))))

(declare-fun map!1210 (LongMapFixedSize!796) ListLongMap!1475)

(assert (=> b!90767 (= lt!44086 (map!1210 newMap!16))))

(declare-fun getCurrentListMap!436 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!90767 (= lt!44084 (getCurrentListMap!436 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!90768 () Bool)

(declare-fun e!59196 () Bool)

(declare-datatypes ((tuple2!2250 0))(
  ( (tuple2!2251 (_1!1136 Bool) (_2!1136 LongMapFixedSize!796)) )
))
(declare-fun lt!44082 () tuple2!2250)

(declare-fun valid!359 (LongMapFixedSize!796) Bool)

(assert (=> b!90768 (= e!59196 (valid!359 (_2!1136 lt!44082)))))

(declare-fun b!90769 () Bool)

(assert (=> b!90769 (= e!59188 e!59192)))

(declare-fun b!90770 () Bool)

(declare-fun res!46279 () Bool)

(assert (=> b!90770 (=> res!46279 e!59196)))

(assert (=> b!90770 (= res!46279 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!90771 () Bool)

(declare-fun res!46276 () Bool)

(assert (=> b!90771 (=> (not res!46276) (not e!59199))))

(assert (=> b!90771 (= res!46276 (valid!359 newMap!16))))

(declare-fun b!90772 () Bool)

(declare-datatypes ((Unit!2705 0))(
  ( (Unit!2706) )
))
(declare-fun e!59191 () Unit!2705)

(declare-fun Unit!2707 () Unit!2705)

(assert (=> b!90772 (= e!59191 Unit!2707)))

(declare-fun lt!44076 () Unit!2705)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!80 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) (_ BitVec 32) Int) Unit!2705)

(assert (=> b!90772 (= lt!44076 (lemmaListMapContainsThenArrayContainsFrom!80 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90772 (arrayContainsKey!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44087 () Unit!2705)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4097 (_ BitVec 32) (_ BitVec 32)) Unit!2705)

(assert (=> b!90772 (= lt!44087 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1553 0))(
  ( (Nil!1550) (Cons!1549 (h!2141 (_ BitVec 64)) (t!5366 List!1553)) )
))
(declare-fun arrayNoDuplicates!0 (array!4097 (_ BitVec 32) List!1553) Bool)

(assert (=> b!90772 (arrayNoDuplicates!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) from!355 Nil!1550)))

(declare-fun lt!44088 () Unit!2705)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4097 (_ BitVec 32) (_ BitVec 64) List!1553) Unit!2705)

(assert (=> b!90772 (= lt!44088 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (Cons!1549 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) Nil!1550)))))

(assert (=> b!90772 false))

(declare-fun b!90773 () Bool)

(assert (=> b!90773 (= e!59200 tp_is_empty!2575)))

(declare-fun b!90774 () Bool)

(declare-fun e!59190 () Bool)

(assert (=> b!90774 (= e!59198 e!59190)))

(declare-fun res!46277 () Bool)

(assert (=> b!90774 (=> (not res!46277) (not e!59190))))

(assert (=> b!90774 (= res!46277 (and (_1!1136 lt!44082) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44081 () Unit!2705)

(assert (=> b!90774 (= lt!44081 e!59191)))

(declare-fun c!15043 () Bool)

(declare-fun contains!769 (ListLongMap!1475 (_ BitVec 64)) Bool)

(assert (=> b!90774 (= c!15043 (contains!769 lt!44086 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun update!131 (LongMapFixedSize!796 (_ BitVec 64) V!3081) tuple2!2250)

(assert (=> b!90774 (= lt!44082 (update!131 newMap!16 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080))))

(declare-fun b!90775 () Bool)

(assert (=> b!90775 (= e!59190 (not e!59196))))

(declare-fun res!46273 () Bool)

(assert (=> b!90775 (=> res!46273 e!59196)))

(assert (=> b!90775 (= res!46273 (not (= (getCurrentListMap!436 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) (map!1210 (_2!1136 lt!44082)))))))

(declare-fun lt!44074 () tuple2!2248)

(declare-fun lt!44079 () ListLongMap!1475)

(declare-fun lt!44075 () tuple2!2248)

(declare-fun lt!44072 () ListLongMap!1475)

(declare-fun +!118 (ListLongMap!1475 tuple2!2248) ListLongMap!1475)

(assert (=> b!90775 (= (+!118 lt!44072 lt!44074) (+!118 (+!118 lt!44079 lt!44074) lt!44075))))

(assert (=> b!90775 (= lt!44074 (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44078 () Unit!2705)

(declare-fun addCommutativeForDiffKeys!37 (ListLongMap!1475 (_ BitVec 64) V!3081 (_ BitVec 64) V!3081) Unit!2705)

(assert (=> b!90775 (= lt!44078 (addCommutativeForDiffKeys!37 lt!44079 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44071 () ListLongMap!1475)

(assert (=> b!90775 (= lt!44071 lt!44072)))

(assert (=> b!90775 (= lt!44072 (+!118 lt!44079 lt!44075))))

(declare-fun lt!44077 () ListLongMap!1475)

(declare-fun lt!44073 () tuple2!2248)

(assert (=> b!90775 (= lt!44071 (+!118 lt!44077 lt!44073))))

(declare-fun lt!44083 () ListLongMap!1475)

(assert (=> b!90775 (= lt!44079 (+!118 lt!44083 lt!44073))))

(assert (=> b!90775 (= lt!44073 (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(assert (=> b!90775 (= lt!44077 (+!118 lt!44083 lt!44075))))

(assert (=> b!90775 (= lt!44075 (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080))))

(declare-fun lt!44085 () Unit!2705)

(assert (=> b!90775 (= lt!44085 (addCommutativeForDiffKeys!37 lt!44083 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!82 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!90775 (= lt!44083 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!90776 () Bool)

(assert (=> b!90776 (= e!59189 (and e!59193 mapRes!3543))))

(declare-fun condMapEmpty!3543 () Bool)

(declare-fun mapDefault!3544 () ValueCell!944)

(assert (=> b!90776 (= condMapEmpty!3543 (= (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3544)))))

(declare-fun b!90777 () Bool)

(declare-fun Unit!2708 () Unit!2705)

(assert (=> b!90777 (= e!59191 Unit!2708)))

(assert (= (and start!11116 res!46278) b!90758))

(assert (= (and b!90758 res!46275) b!90771))

(assert (= (and b!90771 res!46276) b!90766))

(assert (= (and b!90766 res!46272) b!90767))

(assert (= (and b!90767 res!46274) b!90762))

(assert (= (and b!90762 res!46280) b!90774))

(assert (= (and b!90774 c!15043) b!90772))

(assert (= (and b!90774 (not c!15043)) b!90777))

(assert (= (and b!90774 res!46277) b!90775))

(assert (= (and b!90775 (not res!46273)) b!90770))

(assert (= (and b!90770 (not res!46279)) b!90768))

(assert (= (and b!90776 condMapEmpty!3543) mapIsEmpty!3543))

(assert (= (and b!90776 (not condMapEmpty!3543)) mapNonEmpty!3544))

(get-info :version)

(assert (= (and mapNonEmpty!3544 ((_ is ValueCellFull!944) mapValue!3544)) b!90761))

(assert (= (and b!90776 ((_ is ValueCellFull!944) mapDefault!3544)) b!90757))

(assert (= b!90765 b!90776))

(assert (= b!90760 b!90765))

(assert (= b!90769 b!90760))

(assert (= start!11116 b!90769))

(assert (= (and b!90759 condMapEmpty!3544) mapIsEmpty!3544))

(assert (= (and b!90759 (not condMapEmpty!3544)) mapNonEmpty!3543))

(assert (= (and mapNonEmpty!3543 ((_ is ValueCellFull!944) mapValue!3543)) b!90763))

(assert (= (and b!90759 ((_ is ValueCellFull!944) mapDefault!3543)) b!90773))

(assert (= b!90764 b!90759))

(assert (= start!11116 b!90764))

(declare-fun b_lambda!4001 () Bool)

(assert (=> (not b_lambda!4001) (not b!90762)))

(declare-fun t!5362 () Bool)

(declare-fun tb!1781 () Bool)

(assert (=> (and b!90765 (= (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) t!5362) tb!1781))

(declare-fun result!3053 () Bool)

(assert (=> tb!1781 (= result!3053 tp_is_empty!2575)))

(assert (=> b!90762 t!5362))

(declare-fun b_and!5489 () Bool)

(assert (= b_and!5485 (and (=> t!5362 result!3053) b_and!5489)))

(declare-fun tb!1783 () Bool)

(declare-fun t!5364 () Bool)

(assert (=> (and b!90764 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) t!5364) tb!1783))

(declare-fun result!3057 () Bool)

(assert (= result!3057 result!3053))

(assert (=> b!90762 t!5364))

(declare-fun b_and!5491 () Bool)

(assert (= b_and!5487 (and (=> t!5364 result!3057) b_and!5491)))

(declare-fun m!97357 () Bool)

(assert (=> b!90762 m!97357))

(declare-fun m!97359 () Bool)

(assert (=> b!90762 m!97359))

(declare-fun m!97361 () Bool)

(assert (=> b!90762 m!97361))

(assert (=> b!90762 m!97359))

(assert (=> b!90762 m!97361))

(declare-fun m!97363 () Bool)

(assert (=> b!90762 m!97363))

(declare-fun m!97365 () Bool)

(assert (=> b!90767 m!97365))

(declare-fun m!97367 () Bool)

(assert (=> b!90767 m!97367))

(declare-fun m!97369 () Bool)

(assert (=> b!90771 m!97369))

(declare-fun m!97371 () Bool)

(assert (=> mapNonEmpty!3543 m!97371))

(declare-fun m!97373 () Bool)

(assert (=> b!90775 m!97373))

(declare-fun m!97375 () Bool)

(assert (=> b!90775 m!97375))

(declare-fun m!97377 () Bool)

(assert (=> b!90775 m!97377))

(assert (=> b!90775 m!97357))

(declare-fun m!97379 () Bool)

(assert (=> b!90775 m!97379))

(assert (=> b!90775 m!97357))

(declare-fun m!97381 () Bool)

(assert (=> b!90775 m!97381))

(declare-fun m!97383 () Bool)

(assert (=> b!90775 m!97383))

(declare-fun m!97385 () Bool)

(assert (=> b!90775 m!97385))

(assert (=> b!90775 m!97385))

(declare-fun m!97387 () Bool)

(assert (=> b!90775 m!97387))

(declare-fun m!97389 () Bool)

(assert (=> b!90775 m!97389))

(assert (=> b!90775 m!97357))

(declare-fun m!97391 () Bool)

(assert (=> b!90775 m!97391))

(declare-fun m!97393 () Bool)

(assert (=> b!90775 m!97393))

(declare-fun m!97395 () Bool)

(assert (=> b!90775 m!97395))

(declare-fun m!97397 () Bool)

(assert (=> mapNonEmpty!3544 m!97397))

(declare-fun m!97399 () Bool)

(assert (=> b!90772 m!97399))

(declare-fun m!97401 () Bool)

(assert (=> b!90772 m!97401))

(assert (=> b!90772 m!97357))

(declare-fun m!97403 () Bool)

(assert (=> b!90772 m!97403))

(assert (=> b!90772 m!97357))

(assert (=> b!90772 m!97357))

(declare-fun m!97405 () Bool)

(assert (=> b!90772 m!97405))

(assert (=> b!90772 m!97357))

(declare-fun m!97407 () Bool)

(assert (=> b!90772 m!97407))

(declare-fun m!97409 () Bool)

(assert (=> b!90768 m!97409))

(declare-fun m!97411 () Bool)

(assert (=> start!11116 m!97411))

(declare-fun m!97413 () Bool)

(assert (=> b!90765 m!97413))

(declare-fun m!97415 () Bool)

(assert (=> b!90765 m!97415))

(declare-fun m!97417 () Bool)

(assert (=> b!90764 m!97417))

(declare-fun m!97419 () Bool)

(assert (=> b!90764 m!97419))

(assert (=> b!90774 m!97357))

(assert (=> b!90774 m!97357))

(declare-fun m!97421 () Bool)

(assert (=> b!90774 m!97421))

(assert (=> b!90774 m!97357))

(declare-fun m!97423 () Bool)

(assert (=> b!90774 m!97423))

(check-sat (not b!90772) (not mapNonEmpty!3543) (not b!90771) (not mapNonEmpty!3544) (not b!90764) tp_is_empty!2575 (not start!11116) b_and!5489 (not b!90765) (not b!90762) (not b!90768) (not b!90767) (not b_lambda!4001) (not b_next!2317) (not b!90775) (not b_next!2319) (not b!90774) b_and!5491)
(check-sat b_and!5489 b_and!5491 (not b_next!2317) (not b_next!2319))
(get-model)

(declare-fun b_lambda!4007 () Bool)

(assert (= b_lambda!4001 (or (and b!90765 b_free!2317) (and b!90764 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))) b_lambda!4007)))

(check-sat (not b!90772) (not mapNonEmpty!3543) (not b!90771) (not mapNonEmpty!3544) tp_is_empty!2575 (not start!11116) b_and!5489 (not b_next!2317) (not b!90765) (not b!90762) (not b_lambda!4007) (not b!90764) (not b!90768) (not b!90767) (not b!90775) (not b_next!2319) (not b!90774) b_and!5491)
(check-sat b_and!5489 b_and!5491 (not b_next!2317) (not b_next!2319))
(get-model)

(declare-fun d!23981 () Bool)

(assert (=> d!23981 (= (array_inv!1221 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvsge (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90765 d!23981))

(declare-fun d!23983 () Bool)

(assert (=> d!23983 (= (array_inv!1222 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (bvsge (size!2197 (_values!2382 (v!2705 (underlying!305 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90765 d!23983))

(declare-fun d!23985 () Bool)

(declare-fun e!59312 () Bool)

(assert (=> d!23985 e!59312))

(declare-fun res!46339 () Bool)

(assert (=> d!23985 (=> (not res!46339) (not e!59312))))

(declare-fun lt!44207 () ListLongMap!1475)

(assert (=> d!23985 (= res!46339 (contains!769 lt!44207 (_1!1135 lt!44074)))))

(declare-fun lt!44206 () List!1552)

(assert (=> d!23985 (= lt!44207 (ListLongMap!1476 lt!44206))))

(declare-fun lt!44208 () Unit!2705)

(declare-fun lt!44205 () Unit!2705)

(assert (=> d!23985 (= lt!44208 lt!44205)))

(declare-datatypes ((Option!148 0))(
  ( (Some!147 (v!2711 V!3081)) (None!146) )
))
(declare-fun getValueByKey!142 (List!1552 (_ BitVec 64)) Option!148)

(assert (=> d!23985 (= (getValueByKey!142 lt!44206 (_1!1135 lt!44074)) (Some!147 (_2!1135 lt!44074)))))

(declare-fun lemmaContainsTupThenGetReturnValue!62 (List!1552 (_ BitVec 64) V!3081) Unit!2705)

(assert (=> d!23985 (= lt!44205 (lemmaContainsTupThenGetReturnValue!62 lt!44206 (_1!1135 lt!44074) (_2!1135 lt!44074)))))

(declare-fun insertStrictlySorted!65 (List!1552 (_ BitVec 64) V!3081) List!1552)

(assert (=> d!23985 (= lt!44206 (insertStrictlySorted!65 (toList!753 lt!44079) (_1!1135 lt!44074) (_2!1135 lt!44074)))))

(assert (=> d!23985 (= (+!118 lt!44079 lt!44074) lt!44207)))

(declare-fun b!90914 () Bool)

(declare-fun res!46340 () Bool)

(assert (=> b!90914 (=> (not res!46340) (not e!59312))))

(assert (=> b!90914 (= res!46340 (= (getValueByKey!142 (toList!753 lt!44207) (_1!1135 lt!44074)) (Some!147 (_2!1135 lt!44074))))))

(declare-fun b!90915 () Bool)

(declare-fun contains!770 (List!1552 tuple2!2248) Bool)

(assert (=> b!90915 (= e!59312 (contains!770 (toList!753 lt!44207) lt!44074))))

(assert (= (and d!23985 res!46339) b!90914))

(assert (= (and b!90914 res!46340) b!90915))

(declare-fun m!97561 () Bool)

(assert (=> d!23985 m!97561))

(declare-fun m!97563 () Bool)

(assert (=> d!23985 m!97563))

(declare-fun m!97565 () Bool)

(assert (=> d!23985 m!97565))

(declare-fun m!97567 () Bool)

(assert (=> d!23985 m!97567))

(declare-fun m!97569 () Bool)

(assert (=> b!90914 m!97569))

(declare-fun m!97571 () Bool)

(assert (=> b!90915 m!97571))

(assert (=> b!90775 d!23985))

(declare-fun d!23987 () Bool)

(declare-fun e!59313 () Bool)

(assert (=> d!23987 e!59313))

(declare-fun res!46341 () Bool)

(assert (=> d!23987 (=> (not res!46341) (not e!59313))))

(declare-fun lt!44211 () ListLongMap!1475)

(assert (=> d!23987 (= res!46341 (contains!769 lt!44211 (_1!1135 lt!44073)))))

(declare-fun lt!44210 () List!1552)

(assert (=> d!23987 (= lt!44211 (ListLongMap!1476 lt!44210))))

(declare-fun lt!44212 () Unit!2705)

(declare-fun lt!44209 () Unit!2705)

(assert (=> d!23987 (= lt!44212 lt!44209)))

(assert (=> d!23987 (= (getValueByKey!142 lt!44210 (_1!1135 lt!44073)) (Some!147 (_2!1135 lt!44073)))))

(assert (=> d!23987 (= lt!44209 (lemmaContainsTupThenGetReturnValue!62 lt!44210 (_1!1135 lt!44073) (_2!1135 lt!44073)))))

(assert (=> d!23987 (= lt!44210 (insertStrictlySorted!65 (toList!753 lt!44077) (_1!1135 lt!44073) (_2!1135 lt!44073)))))

(assert (=> d!23987 (= (+!118 lt!44077 lt!44073) lt!44211)))

(declare-fun b!90916 () Bool)

(declare-fun res!46342 () Bool)

(assert (=> b!90916 (=> (not res!46342) (not e!59313))))

(assert (=> b!90916 (= res!46342 (= (getValueByKey!142 (toList!753 lt!44211) (_1!1135 lt!44073)) (Some!147 (_2!1135 lt!44073))))))

(declare-fun b!90917 () Bool)

(assert (=> b!90917 (= e!59313 (contains!770 (toList!753 lt!44211) lt!44073))))

(assert (= (and d!23987 res!46341) b!90916))

(assert (= (and b!90916 res!46342) b!90917))

(declare-fun m!97573 () Bool)

(assert (=> d!23987 m!97573))

(declare-fun m!97575 () Bool)

(assert (=> d!23987 m!97575))

(declare-fun m!97577 () Bool)

(assert (=> d!23987 m!97577))

(declare-fun m!97579 () Bool)

(assert (=> d!23987 m!97579))

(declare-fun m!97581 () Bool)

(assert (=> b!90916 m!97581))

(declare-fun m!97583 () Bool)

(assert (=> b!90917 m!97583))

(assert (=> b!90775 d!23987))

(declare-fun b!90942 () Bool)

(declare-fun e!59334 () Bool)

(declare-fun e!59331 () Bool)

(assert (=> b!90942 (= e!59334 e!59331)))

(assert (=> b!90942 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun lt!44229 () ListLongMap!1475)

(declare-fun res!46354 () Bool)

(assert (=> b!90942 (= res!46354 (contains!769 lt!44229 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90942 (=> (not res!46354) (not e!59331))))

(declare-fun b!90943 () Bool)

(assert (=> b!90943 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> b!90943 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2197 (_values!2382 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun apply!86 (ListLongMap!1475 (_ BitVec 64)) V!3081)

(assert (=> b!90943 (= e!59331 (= (apply!86 lt!44229 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!90944 () Bool)

(declare-fun e!59333 () Bool)

(declare-fun isEmpty!349 (ListLongMap!1475) Bool)

(assert (=> b!90944 (= e!59333 (isEmpty!349 lt!44229))))

(declare-fun b!90945 () Bool)

(declare-fun e!59330 () ListLongMap!1475)

(declare-fun call!8814 () ListLongMap!1475)

(assert (=> b!90945 (= e!59330 call!8814)))

(declare-fun b!90946 () Bool)

(assert (=> b!90946 (= e!59334 e!59333)))

(declare-fun c!15061 () Bool)

(assert (=> b!90946 (= c!15061 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!90947 () Bool)

(declare-fun e!59332 () ListLongMap!1475)

(assert (=> b!90947 (= e!59332 e!59330)))

(declare-fun c!15060 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!90947 (= c!15060 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!23989 () Bool)

(declare-fun e!59328 () Bool)

(assert (=> d!23989 e!59328))

(declare-fun res!46351 () Bool)

(assert (=> d!23989 (=> (not res!46351) (not e!59328))))

(assert (=> d!23989 (= res!46351 (not (contains!769 lt!44229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23989 (= lt!44229 e!59332)))

(declare-fun c!15058 () Bool)

(assert (=> d!23989 (= c!15058 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!23989 (validMask!0 (mask!6456 (v!2705 (underlying!305 thiss!992))))))

(assert (=> d!23989 (= (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) lt!44229)))

(declare-fun b!90948 () Bool)

(declare-fun lt!44232 () Unit!2705)

(declare-fun lt!44231 () Unit!2705)

(assert (=> b!90948 (= lt!44232 lt!44231)))

(declare-fun lt!44228 () (_ BitVec 64))

(declare-fun lt!44230 () ListLongMap!1475)

(declare-fun lt!44227 () V!3081)

(declare-fun lt!44233 () (_ BitVec 64))

(assert (=> b!90948 (not (contains!769 (+!118 lt!44230 (tuple2!2249 lt!44228 lt!44227)) lt!44233))))

(declare-fun addStillNotContains!36 (ListLongMap!1475 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2705)

(assert (=> b!90948 (= lt!44231 (addStillNotContains!36 lt!44230 lt!44228 lt!44227 lt!44233))))

(assert (=> b!90948 (= lt!44233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!90948 (= lt!44227 (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90948 (= lt!44228 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!90948 (= lt!44230 call!8814)))

(assert (=> b!90948 (= e!59330 (+!118 call!8814 (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!8811 () Bool)

(assert (=> bm!8811 (= call!8814 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!90949 () Bool)

(assert (=> b!90949 (= e!59333 (= lt!44229 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!90950 () Bool)

(declare-fun res!46352 () Bool)

(assert (=> b!90950 (=> (not res!46352) (not e!59328))))

(assert (=> b!90950 (= res!46352 (not (contains!769 lt!44229 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90951 () Bool)

(assert (=> b!90951 (= e!59328 e!59334)))

(declare-fun c!15059 () Bool)

(declare-fun e!59329 () Bool)

(assert (=> b!90951 (= c!15059 e!59329)))

(declare-fun res!46353 () Bool)

(assert (=> b!90951 (=> (not res!46353) (not e!59329))))

(assert (=> b!90951 (= res!46353 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!90952 () Bool)

(assert (=> b!90952 (= e!59332 (ListLongMap!1476 Nil!1549))))

(declare-fun b!90953 () Bool)

(assert (=> b!90953 (= e!59329 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90953 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(assert (= (and d!23989 c!15058) b!90952))

(assert (= (and d!23989 (not c!15058)) b!90947))

(assert (= (and b!90947 c!15060) b!90948))

(assert (= (and b!90947 (not c!15060)) b!90945))

(assert (= (or b!90948 b!90945) bm!8811))

(assert (= (and d!23989 res!46351) b!90950))

(assert (= (and b!90950 res!46352) b!90951))

(assert (= (and b!90951 res!46353) b!90953))

(assert (= (and b!90951 c!15059) b!90942))

(assert (= (and b!90951 (not c!15059)) b!90946))

(assert (= (and b!90942 res!46354) b!90943))

(assert (= (and b!90946 c!15061) b!90949))

(assert (= (and b!90946 (not c!15061)) b!90944))

(declare-fun b_lambda!4009 () Bool)

(assert (=> (not b_lambda!4009) (not b!90943)))

(assert (=> b!90943 t!5362))

(declare-fun b_and!5509 () Bool)

(assert (= b_and!5489 (and (=> t!5362 result!3053) b_and!5509)))

(assert (=> b!90943 t!5364))

(declare-fun b_and!5511 () Bool)

(assert (= b_and!5491 (and (=> t!5364 result!3057) b_and!5511)))

(declare-fun b_lambda!4011 () Bool)

(assert (=> (not b_lambda!4011) (not b!90948)))

(assert (=> b!90948 t!5362))

(declare-fun b_and!5513 () Bool)

(assert (= b_and!5509 (and (=> t!5362 result!3053) b_and!5513)))

(assert (=> b!90948 t!5364))

(declare-fun b_and!5515 () Bool)

(assert (= b_and!5511 (and (=> t!5364 result!3057) b_and!5515)))

(declare-fun m!97585 () Bool)

(assert (=> b!90947 m!97585))

(assert (=> b!90947 m!97585))

(declare-fun m!97587 () Bool)

(assert (=> b!90947 m!97587))

(declare-fun m!97589 () Bool)

(assert (=> d!23989 m!97589))

(declare-fun m!97591 () Bool)

(assert (=> d!23989 m!97591))

(declare-fun m!97593 () Bool)

(assert (=> b!90944 m!97593))

(assert (=> b!90942 m!97585))

(assert (=> b!90942 m!97585))

(declare-fun m!97595 () Bool)

(assert (=> b!90942 m!97595))

(assert (=> b!90943 m!97361))

(declare-fun m!97597 () Bool)

(assert (=> b!90943 m!97597))

(assert (=> b!90943 m!97585))

(assert (=> b!90943 m!97597))

(assert (=> b!90943 m!97361))

(declare-fun m!97599 () Bool)

(assert (=> b!90943 m!97599))

(assert (=> b!90943 m!97585))

(declare-fun m!97601 () Bool)

(assert (=> b!90943 m!97601))

(declare-fun m!97603 () Bool)

(assert (=> bm!8811 m!97603))

(declare-fun m!97605 () Bool)

(assert (=> b!90950 m!97605))

(assert (=> b!90948 m!97361))

(declare-fun m!97607 () Bool)

(assert (=> b!90948 m!97607))

(assert (=> b!90948 m!97585))

(assert (=> b!90948 m!97597))

(assert (=> b!90948 m!97361))

(assert (=> b!90948 m!97599))

(assert (=> b!90948 m!97607))

(declare-fun m!97609 () Bool)

(assert (=> b!90948 m!97609))

(declare-fun m!97611 () Bool)

(assert (=> b!90948 m!97611))

(assert (=> b!90948 m!97597))

(declare-fun m!97613 () Bool)

(assert (=> b!90948 m!97613))

(assert (=> b!90949 m!97603))

(assert (=> b!90953 m!97585))

(assert (=> b!90953 m!97585))

(assert (=> b!90953 m!97587))

(assert (=> b!90775 d!23989))

(declare-fun d!23991 () Bool)

(assert (=> d!23991 (= (+!118 (+!118 lt!44083 (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080)) (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) (+!118 (+!118 lt!44083 (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080)))))

(declare-fun lt!44236 () Unit!2705)

(declare-fun choose!548 (ListLongMap!1475 (_ BitVec 64) V!3081 (_ BitVec 64) V!3081) Unit!2705)

(assert (=> d!23991 (= lt!44236 (choose!548 lt!44083 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(assert (=> d!23991 (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23991 (= (addCommutativeForDiffKeys!37 lt!44083 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))) lt!44236)))

(declare-fun bs!3783 () Bool)

(assert (= bs!3783 d!23991))

(declare-fun m!97615 () Bool)

(assert (=> bs!3783 m!97615))

(declare-fun m!97617 () Bool)

(assert (=> bs!3783 m!97617))

(assert (=> bs!3783 m!97617))

(declare-fun m!97619 () Bool)

(assert (=> bs!3783 m!97619))

(assert (=> bs!3783 m!97615))

(declare-fun m!97621 () Bool)

(assert (=> bs!3783 m!97621))

(assert (=> bs!3783 m!97357))

(declare-fun m!97623 () Bool)

(assert (=> bs!3783 m!97623))

(assert (=> b!90775 d!23991))

(declare-fun d!23993 () Bool)

(declare-fun e!59335 () Bool)

(assert (=> d!23993 e!59335))

(declare-fun res!46355 () Bool)

(assert (=> d!23993 (=> (not res!46355) (not e!59335))))

(declare-fun lt!44239 () ListLongMap!1475)

(assert (=> d!23993 (= res!46355 (contains!769 lt!44239 (_1!1135 lt!44075)))))

(declare-fun lt!44238 () List!1552)

(assert (=> d!23993 (= lt!44239 (ListLongMap!1476 lt!44238))))

(declare-fun lt!44240 () Unit!2705)

(declare-fun lt!44237 () Unit!2705)

(assert (=> d!23993 (= lt!44240 lt!44237)))

(assert (=> d!23993 (= (getValueByKey!142 lt!44238 (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075)))))

(assert (=> d!23993 (= lt!44237 (lemmaContainsTupThenGetReturnValue!62 lt!44238 (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!23993 (= lt!44238 (insertStrictlySorted!65 (toList!753 lt!44079) (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!23993 (= (+!118 lt!44079 lt!44075) lt!44239)))

(declare-fun b!90954 () Bool)

(declare-fun res!46356 () Bool)

(assert (=> b!90954 (=> (not res!46356) (not e!59335))))

(assert (=> b!90954 (= res!46356 (= (getValueByKey!142 (toList!753 lt!44239) (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075))))))

(declare-fun b!90955 () Bool)

(assert (=> b!90955 (= e!59335 (contains!770 (toList!753 lt!44239) lt!44075))))

(assert (= (and d!23993 res!46355) b!90954))

(assert (= (and b!90954 res!46356) b!90955))

(declare-fun m!97625 () Bool)

(assert (=> d!23993 m!97625))

(declare-fun m!97627 () Bool)

(assert (=> d!23993 m!97627))

(declare-fun m!97629 () Bool)

(assert (=> d!23993 m!97629))

(declare-fun m!97631 () Bool)

(assert (=> d!23993 m!97631))

(declare-fun m!97633 () Bool)

(assert (=> b!90954 m!97633))

(declare-fun m!97635 () Bool)

(assert (=> b!90955 m!97635))

(assert (=> b!90775 d!23993))

(declare-fun bm!8826 () Bool)

(declare-fun call!8831 () ListLongMap!1475)

(declare-fun call!8835 () ListLongMap!1475)

(assert (=> bm!8826 (= call!8831 call!8835)))

(declare-fun b!90999 () Bool)

(declare-fun res!46377 () Bool)

(declare-fun e!59373 () Bool)

(assert (=> b!90999 (=> (not res!46377) (not e!59373))))

(declare-fun e!59374 () Bool)

(assert (=> b!90999 (= res!46377 e!59374)))

(declare-fun res!46382 () Bool)

(assert (=> b!90999 (=> res!46382 e!59374)))

(declare-fun e!59368 () Bool)

(assert (=> b!90999 (= res!46382 (not e!59368))))

(declare-fun res!46376 () Bool)

(assert (=> b!90999 (=> (not res!46376) (not e!59368))))

(assert (=> b!90999 (= res!46376 (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91000 () Bool)

(declare-fun e!59362 () ListLongMap!1475)

(assert (=> b!91000 (= e!59362 call!8831)))

(declare-fun b!91001 () Bool)

(declare-fun e!59363 () Unit!2705)

(declare-fun Unit!2713 () Unit!2705)

(assert (=> b!91001 (= e!59363 Unit!2713)))

(declare-fun bm!8827 () Bool)

(declare-fun call!8832 () ListLongMap!1475)

(assert (=> bm!8827 (= call!8835 call!8832)))

(declare-fun b!91002 () Bool)

(declare-fun e!59367 () ListLongMap!1475)

(declare-fun call!8829 () ListLongMap!1475)

(assert (=> b!91002 (= e!59367 call!8829)))

(declare-fun bm!8828 () Bool)

(declare-fun call!8830 () ListLongMap!1475)

(assert (=> bm!8828 (= call!8829 call!8830)))

(declare-fun b!91003 () Bool)

(declare-fun e!59366 () Bool)

(declare-fun lt!44294 () ListLongMap!1475)

(assert (=> b!91003 (= e!59366 (= (apply!86 lt!44294 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91004 () Bool)

(assert (=> b!91004 (= e!59368 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun b!91005 () Bool)

(declare-fun e!59369 () ListLongMap!1475)

(assert (=> b!91005 (= e!59369 (+!118 call!8830 (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91006 () Bool)

(declare-fun c!15077 () Bool)

(assert (=> b!91006 (= c!15077 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91006 (= e!59367 e!59362)))

(declare-fun b!91007 () Bool)

(declare-fun e!59372 () Bool)

(assert (=> b!91007 (= e!59372 (= (apply!86 lt!44294 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91008 () Bool)

(declare-fun res!46375 () Bool)

(assert (=> b!91008 (=> (not res!46375) (not e!59373))))

(declare-fun e!59364 () Bool)

(assert (=> b!91008 (= res!46375 e!59364)))

(declare-fun c!15079 () Bool)

(assert (=> b!91008 (= c!15079 (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!23995 () Bool)

(assert (=> d!23995 e!59373))

(declare-fun res!46380 () Bool)

(assert (=> d!23995 (=> (not res!46380) (not e!59373))))

(assert (=> d!23995 (= res!46380 (or (bvsge from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))))

(declare-fun lt!44304 () ListLongMap!1475)

(assert (=> d!23995 (= lt!44294 lt!44304)))

(declare-fun lt!44299 () Unit!2705)

(assert (=> d!23995 (= lt!44299 e!59363)))

(declare-fun c!15078 () Bool)

(declare-fun e!59370 () Bool)

(assert (=> d!23995 (= c!15078 e!59370)))

(declare-fun res!46379 () Bool)

(assert (=> d!23995 (=> (not res!46379) (not e!59370))))

(assert (=> d!23995 (= res!46379 (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> d!23995 (= lt!44304 e!59369)))

(declare-fun c!15075 () Bool)

(assert (=> d!23995 (= c!15075 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23995 (validMask!0 (mask!6456 (v!2705 (underlying!305 thiss!992))))))

(assert (=> d!23995 (= (getCurrentListMap!436 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) lt!44294)))

(declare-fun b!90998 () Bool)

(assert (=> b!90998 (= e!59362 call!8829)))

(declare-fun b!91009 () Bool)

(declare-fun lt!44287 () Unit!2705)

(assert (=> b!91009 (= e!59363 lt!44287)))

(declare-fun lt!44302 () ListLongMap!1475)

(assert (=> b!91009 (= lt!44302 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44297 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44292 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44292 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))

(declare-fun lt!44295 () Unit!2705)

(declare-fun addStillContains!62 (ListLongMap!1475 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2705)

(assert (=> b!91009 (= lt!44295 (addStillContains!62 lt!44302 lt!44297 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44292))))

(assert (=> b!91009 (contains!769 (+!118 lt!44302 (tuple2!2249 lt!44297 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44292)))

(declare-fun lt!44298 () Unit!2705)

(assert (=> b!91009 (= lt!44298 lt!44295)))

(declare-fun lt!44296 () ListLongMap!1475)

(assert (=> b!91009 (= lt!44296 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44291 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44291 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44290 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44290 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))

(declare-fun lt!44293 () Unit!2705)

(declare-fun addApplyDifferent!62 (ListLongMap!1475 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2705)

(assert (=> b!91009 (= lt!44293 (addApplyDifferent!62 lt!44296 lt!44291 (minValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44290))))

(assert (=> b!91009 (= (apply!86 (+!118 lt!44296 (tuple2!2249 lt!44291 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44290) (apply!86 lt!44296 lt!44290))))

(declare-fun lt!44303 () Unit!2705)

(assert (=> b!91009 (= lt!44303 lt!44293)))

(declare-fun lt!44306 () ListLongMap!1475)

(assert (=> b!91009 (= lt!44306 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44301 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44305 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44305 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))

(declare-fun lt!44300 () Unit!2705)

(assert (=> b!91009 (= lt!44300 (addApplyDifferent!62 lt!44306 lt!44301 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44305))))

(assert (=> b!91009 (= (apply!86 (+!118 lt!44306 (tuple2!2249 lt!44301 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44305) (apply!86 lt!44306 lt!44305))))

(declare-fun lt!44286 () Unit!2705)

(assert (=> b!91009 (= lt!44286 lt!44300)))

(declare-fun lt!44289 () ListLongMap!1475)

(assert (=> b!91009 (= lt!44289 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44285 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44288 () (_ BitVec 64))

(assert (=> b!91009 (= lt!44288 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))

(assert (=> b!91009 (= lt!44287 (addApplyDifferent!62 lt!44289 lt!44285 (minValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44288))))

(assert (=> b!91009 (= (apply!86 (+!118 lt!44289 (tuple2!2249 lt!44285 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44288) (apply!86 lt!44289 lt!44288))))

(declare-fun b!91010 () Bool)

(assert (=> b!91010 (= e!59364 e!59366)))

(declare-fun res!46381 () Bool)

(declare-fun call!8833 () Bool)

(assert (=> b!91010 (= res!46381 call!8833)))

(assert (=> b!91010 (=> (not res!46381) (not e!59366))))

(declare-fun b!91011 () Bool)

(declare-fun e!59371 () Bool)

(assert (=> b!91011 (= e!59371 e!59372)))

(declare-fun res!46383 () Bool)

(declare-fun call!8834 () Bool)

(assert (=> b!91011 (= res!46383 call!8834)))

(assert (=> b!91011 (=> (not res!46383) (not e!59372))))

(declare-fun b!91012 () Bool)

(declare-fun e!59365 () Bool)

(assert (=> b!91012 (= e!59365 (= (apply!86 lt!44294 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)) (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91012 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2197 (_values!2382 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> b!91012 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91013 () Bool)

(assert (=> b!91013 (= e!59369 e!59367)))

(declare-fun c!15076 () Bool)

(assert (=> b!91013 (= c!15076 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8829 () Bool)

(assert (=> bm!8829 (= call!8834 (contains!769 lt!44294 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91014 () Bool)

(assert (=> b!91014 (= e!59374 e!59365)))

(declare-fun res!46378 () Bool)

(assert (=> b!91014 (=> (not res!46378) (not e!59365))))

(assert (=> b!91014 (= res!46378 (contains!769 lt!44294 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(assert (=> b!91014 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91015 () Bool)

(assert (=> b!91015 (= e!59364 (not call!8833))))

(declare-fun bm!8830 () Bool)

(assert (=> bm!8830 (= call!8830 (+!118 (ite c!15075 call!8832 (ite c!15076 call!8835 call!8831)) (ite (or c!15075 c!15076) (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))) (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))))

(declare-fun bm!8831 () Bool)

(assert (=> bm!8831 (= call!8832 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) from!355 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91016 () Bool)

(assert (=> b!91016 (= e!59371 (not call!8834))))

(declare-fun bm!8832 () Bool)

(assert (=> bm!8832 (= call!8833 (contains!769 lt!44294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91017 () Bool)

(assert (=> b!91017 (= e!59373 e!59371)))

(declare-fun c!15074 () Bool)

(assert (=> b!91017 (= c!15074 (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91018 () Bool)

(assert (=> b!91018 (= e!59370 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(assert (= (and d!23995 c!15075) b!91005))

(assert (= (and d!23995 (not c!15075)) b!91013))

(assert (= (and b!91013 c!15076) b!91002))

(assert (= (and b!91013 (not c!15076)) b!91006))

(assert (= (and b!91006 c!15077) b!90998))

(assert (= (and b!91006 (not c!15077)) b!91000))

(assert (= (or b!90998 b!91000) bm!8826))

(assert (= (or b!91002 bm!8826) bm!8827))

(assert (= (or b!91002 b!90998) bm!8828))

(assert (= (or b!91005 bm!8827) bm!8831))

(assert (= (or b!91005 bm!8828) bm!8830))

(assert (= (and d!23995 res!46379) b!91018))

(assert (= (and d!23995 c!15078) b!91009))

(assert (= (and d!23995 (not c!15078)) b!91001))

(assert (= (and d!23995 res!46380) b!90999))

(assert (= (and b!90999 res!46376) b!91004))

(assert (= (and b!90999 (not res!46382)) b!91014))

(assert (= (and b!91014 res!46378) b!91012))

(assert (= (and b!90999 res!46377) b!91008))

(assert (= (and b!91008 c!15079) b!91010))

(assert (= (and b!91008 (not c!15079)) b!91015))

(assert (= (and b!91010 res!46381) b!91003))

(assert (= (or b!91010 b!91015) bm!8832))

(assert (= (and b!91008 res!46375) b!91017))

(assert (= (and b!91017 c!15074) b!91011))

(assert (= (and b!91017 (not c!15074)) b!91016))

(assert (= (and b!91011 res!46383) b!91007))

(assert (= (or b!91011 b!91016) bm!8829))

(declare-fun b_lambda!4013 () Bool)

(assert (=> (not b_lambda!4013) (not b!91012)))

(assert (=> b!91012 t!5362))

(declare-fun b_and!5517 () Bool)

(assert (= b_and!5513 (and (=> t!5362 result!3053) b_and!5517)))

(assert (=> b!91012 t!5364))

(declare-fun b_and!5519 () Bool)

(assert (= b_and!5515 (and (=> t!5364 result!3057) b_and!5519)))

(declare-fun m!97637 () Bool)

(assert (=> bm!8832 m!97637))

(declare-fun m!97639 () Bool)

(assert (=> b!91007 m!97639))

(declare-fun m!97641 () Bool)

(assert (=> b!91009 m!97641))

(declare-fun m!97643 () Bool)

(assert (=> b!91009 m!97643))

(declare-fun m!97645 () Bool)

(assert (=> b!91009 m!97645))

(declare-fun m!97647 () Bool)

(assert (=> b!91009 m!97647))

(declare-fun m!97649 () Bool)

(assert (=> b!91009 m!97649))

(declare-fun m!97651 () Bool)

(assert (=> b!91009 m!97651))

(declare-fun m!97653 () Bool)

(assert (=> b!91009 m!97653))

(declare-fun m!97655 () Bool)

(assert (=> b!91009 m!97655))

(assert (=> b!91009 m!97645))

(declare-fun m!97657 () Bool)

(assert (=> b!91009 m!97657))

(declare-fun m!97659 () Bool)

(assert (=> b!91009 m!97659))

(assert (=> b!91009 m!97357))

(declare-fun m!97661 () Bool)

(assert (=> b!91009 m!97661))

(declare-fun m!97663 () Bool)

(assert (=> b!91009 m!97663))

(assert (=> b!91009 m!97663))

(declare-fun m!97665 () Bool)

(assert (=> b!91009 m!97665))

(assert (=> b!91009 m!97641))

(declare-fun m!97667 () Bool)

(assert (=> b!91009 m!97667))

(assert (=> b!91009 m!97651))

(declare-fun m!97669 () Bool)

(assert (=> b!91009 m!97669))

(declare-fun m!97671 () Bool)

(assert (=> b!91009 m!97671))

(assert (=> bm!8831 m!97643))

(assert (=> b!91004 m!97357))

(assert (=> b!91004 m!97357))

(declare-fun m!97673 () Bool)

(assert (=> b!91004 m!97673))

(assert (=> b!91012 m!97357))

(declare-fun m!97675 () Bool)

(assert (=> b!91012 m!97675))

(assert (=> b!91012 m!97359))

(assert (=> b!91012 m!97361))

(assert (=> b!91012 m!97363))

(assert (=> b!91012 m!97359))

(assert (=> b!91012 m!97357))

(assert (=> b!91012 m!97361))

(assert (=> b!91018 m!97357))

(assert (=> b!91018 m!97357))

(assert (=> b!91018 m!97673))

(declare-fun m!97677 () Bool)

(assert (=> bm!8830 m!97677))

(assert (=> b!91014 m!97357))

(assert (=> b!91014 m!97357))

(declare-fun m!97679 () Bool)

(assert (=> b!91014 m!97679))

(declare-fun m!97681 () Bool)

(assert (=> b!91003 m!97681))

(assert (=> d!23995 m!97591))

(declare-fun m!97683 () Bool)

(assert (=> bm!8829 m!97683))

(declare-fun m!97685 () Bool)

(assert (=> b!91005 m!97685))

(assert (=> b!90775 d!23995))

(declare-fun d!23997 () Bool)

(assert (=> d!23997 (= (map!1210 (_2!1136 lt!44082)) (getCurrentListMap!436 (_keys!4078 (_2!1136 lt!44082)) (_values!2382 (_2!1136 lt!44082)) (mask!6456 (_2!1136 lt!44082)) (extraKeys!2230 (_2!1136 lt!44082)) (zeroValue!2287 (_2!1136 lt!44082)) (minValue!2287 (_2!1136 lt!44082)) #b00000000000000000000000000000000 (defaultEntry!2399 (_2!1136 lt!44082))))))

(declare-fun bs!3784 () Bool)

(assert (= bs!3784 d!23997))

(declare-fun m!97687 () Bool)

(assert (=> bs!3784 m!97687))

(assert (=> b!90775 d!23997))

(declare-fun d!23999 () Bool)

(declare-fun e!59375 () Bool)

(assert (=> d!23999 e!59375))

(declare-fun res!46384 () Bool)

(assert (=> d!23999 (=> (not res!46384) (not e!59375))))

(declare-fun lt!44309 () ListLongMap!1475)

(assert (=> d!23999 (= res!46384 (contains!769 lt!44309 (_1!1135 lt!44074)))))

(declare-fun lt!44308 () List!1552)

(assert (=> d!23999 (= lt!44309 (ListLongMap!1476 lt!44308))))

(declare-fun lt!44310 () Unit!2705)

(declare-fun lt!44307 () Unit!2705)

(assert (=> d!23999 (= lt!44310 lt!44307)))

(assert (=> d!23999 (= (getValueByKey!142 lt!44308 (_1!1135 lt!44074)) (Some!147 (_2!1135 lt!44074)))))

(assert (=> d!23999 (= lt!44307 (lemmaContainsTupThenGetReturnValue!62 lt!44308 (_1!1135 lt!44074) (_2!1135 lt!44074)))))

(assert (=> d!23999 (= lt!44308 (insertStrictlySorted!65 (toList!753 lt!44072) (_1!1135 lt!44074) (_2!1135 lt!44074)))))

(assert (=> d!23999 (= (+!118 lt!44072 lt!44074) lt!44309)))

(declare-fun b!91019 () Bool)

(declare-fun res!46385 () Bool)

(assert (=> b!91019 (=> (not res!46385) (not e!59375))))

(assert (=> b!91019 (= res!46385 (= (getValueByKey!142 (toList!753 lt!44309) (_1!1135 lt!44074)) (Some!147 (_2!1135 lt!44074))))))

(declare-fun b!91020 () Bool)

(assert (=> b!91020 (= e!59375 (contains!770 (toList!753 lt!44309) lt!44074))))

(assert (= (and d!23999 res!46384) b!91019))

(assert (= (and b!91019 res!46385) b!91020))

(declare-fun m!97689 () Bool)

(assert (=> d!23999 m!97689))

(declare-fun m!97691 () Bool)

(assert (=> d!23999 m!97691))

(declare-fun m!97693 () Bool)

(assert (=> d!23999 m!97693))

(declare-fun m!97695 () Bool)

(assert (=> d!23999 m!97695))

(declare-fun m!97697 () Bool)

(assert (=> b!91019 m!97697))

(declare-fun m!97699 () Bool)

(assert (=> b!91020 m!97699))

(assert (=> b!90775 d!23999))

(declare-fun d!24001 () Bool)

(declare-fun e!59376 () Bool)

(assert (=> d!24001 e!59376))

(declare-fun res!46386 () Bool)

(assert (=> d!24001 (=> (not res!46386) (not e!59376))))

(declare-fun lt!44313 () ListLongMap!1475)

(assert (=> d!24001 (= res!46386 (contains!769 lt!44313 (_1!1135 lt!44075)))))

(declare-fun lt!44312 () List!1552)

(assert (=> d!24001 (= lt!44313 (ListLongMap!1476 lt!44312))))

(declare-fun lt!44314 () Unit!2705)

(declare-fun lt!44311 () Unit!2705)

(assert (=> d!24001 (= lt!44314 lt!44311)))

(assert (=> d!24001 (= (getValueByKey!142 lt!44312 (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075)))))

(assert (=> d!24001 (= lt!44311 (lemmaContainsTupThenGetReturnValue!62 lt!44312 (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!24001 (= lt!44312 (insertStrictlySorted!65 (toList!753 lt!44083) (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!24001 (= (+!118 lt!44083 lt!44075) lt!44313)))

(declare-fun b!91021 () Bool)

(declare-fun res!46387 () Bool)

(assert (=> b!91021 (=> (not res!46387) (not e!59376))))

(assert (=> b!91021 (= res!46387 (= (getValueByKey!142 (toList!753 lt!44313) (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075))))))

(declare-fun b!91022 () Bool)

(assert (=> b!91022 (= e!59376 (contains!770 (toList!753 lt!44313) lt!44075))))

(assert (= (and d!24001 res!46386) b!91021))

(assert (= (and b!91021 res!46387) b!91022))

(declare-fun m!97701 () Bool)

(assert (=> d!24001 m!97701))

(declare-fun m!97703 () Bool)

(assert (=> d!24001 m!97703))

(declare-fun m!97705 () Bool)

(assert (=> d!24001 m!97705))

(declare-fun m!97707 () Bool)

(assert (=> d!24001 m!97707))

(declare-fun m!97709 () Bool)

(assert (=> b!91021 m!97709))

(declare-fun m!97711 () Bool)

(assert (=> b!91022 m!97711))

(assert (=> b!90775 d!24001))

(declare-fun d!24003 () Bool)

(declare-fun e!59377 () Bool)

(assert (=> d!24003 e!59377))

(declare-fun res!46388 () Bool)

(assert (=> d!24003 (=> (not res!46388) (not e!59377))))

(declare-fun lt!44317 () ListLongMap!1475)

(assert (=> d!24003 (= res!46388 (contains!769 lt!44317 (_1!1135 lt!44073)))))

(declare-fun lt!44316 () List!1552)

(assert (=> d!24003 (= lt!44317 (ListLongMap!1476 lt!44316))))

(declare-fun lt!44318 () Unit!2705)

(declare-fun lt!44315 () Unit!2705)

(assert (=> d!24003 (= lt!44318 lt!44315)))

(assert (=> d!24003 (= (getValueByKey!142 lt!44316 (_1!1135 lt!44073)) (Some!147 (_2!1135 lt!44073)))))

(assert (=> d!24003 (= lt!44315 (lemmaContainsTupThenGetReturnValue!62 lt!44316 (_1!1135 lt!44073) (_2!1135 lt!44073)))))

(assert (=> d!24003 (= lt!44316 (insertStrictlySorted!65 (toList!753 lt!44083) (_1!1135 lt!44073) (_2!1135 lt!44073)))))

(assert (=> d!24003 (= (+!118 lt!44083 lt!44073) lt!44317)))

(declare-fun b!91023 () Bool)

(declare-fun res!46389 () Bool)

(assert (=> b!91023 (=> (not res!46389) (not e!59377))))

(assert (=> b!91023 (= res!46389 (= (getValueByKey!142 (toList!753 lt!44317) (_1!1135 lt!44073)) (Some!147 (_2!1135 lt!44073))))))

(declare-fun b!91024 () Bool)

(assert (=> b!91024 (= e!59377 (contains!770 (toList!753 lt!44317) lt!44073))))

(assert (= (and d!24003 res!46388) b!91023))

(assert (= (and b!91023 res!46389) b!91024))

(declare-fun m!97713 () Bool)

(assert (=> d!24003 m!97713))

(declare-fun m!97715 () Bool)

(assert (=> d!24003 m!97715))

(declare-fun m!97717 () Bool)

(assert (=> d!24003 m!97717))

(declare-fun m!97719 () Bool)

(assert (=> d!24003 m!97719))

(declare-fun m!97721 () Bool)

(assert (=> b!91023 m!97721))

(declare-fun m!97723 () Bool)

(assert (=> b!91024 m!97723))

(assert (=> b!90775 d!24003))

(declare-fun d!24005 () Bool)

(assert (=> d!24005 (= (+!118 (+!118 lt!44079 (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080)) (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) (+!118 (+!118 lt!44079 (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080)))))

(declare-fun lt!44319 () Unit!2705)

(assert (=> d!24005 (= lt!44319 (choose!548 lt!44079 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(assert (=> d!24005 (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24005 (= (addCommutativeForDiffKeys!37 lt!44079 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))) lt!44319)))

(declare-fun bs!3785 () Bool)

(assert (= bs!3785 d!24005))

(declare-fun m!97725 () Bool)

(assert (=> bs!3785 m!97725))

(declare-fun m!97727 () Bool)

(assert (=> bs!3785 m!97727))

(assert (=> bs!3785 m!97727))

(declare-fun m!97729 () Bool)

(assert (=> bs!3785 m!97729))

(assert (=> bs!3785 m!97725))

(declare-fun m!97731 () Bool)

(assert (=> bs!3785 m!97731))

(assert (=> bs!3785 m!97357))

(declare-fun m!97733 () Bool)

(assert (=> bs!3785 m!97733))

(assert (=> b!90775 d!24005))

(declare-fun d!24007 () Bool)

(declare-fun e!59378 () Bool)

(assert (=> d!24007 e!59378))

(declare-fun res!46390 () Bool)

(assert (=> d!24007 (=> (not res!46390) (not e!59378))))

(declare-fun lt!44322 () ListLongMap!1475)

(assert (=> d!24007 (= res!46390 (contains!769 lt!44322 (_1!1135 lt!44075)))))

(declare-fun lt!44321 () List!1552)

(assert (=> d!24007 (= lt!44322 (ListLongMap!1476 lt!44321))))

(declare-fun lt!44323 () Unit!2705)

(declare-fun lt!44320 () Unit!2705)

(assert (=> d!24007 (= lt!44323 lt!44320)))

(assert (=> d!24007 (= (getValueByKey!142 lt!44321 (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075)))))

(assert (=> d!24007 (= lt!44320 (lemmaContainsTupThenGetReturnValue!62 lt!44321 (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!24007 (= lt!44321 (insertStrictlySorted!65 (toList!753 (+!118 lt!44079 lt!44074)) (_1!1135 lt!44075) (_2!1135 lt!44075)))))

(assert (=> d!24007 (= (+!118 (+!118 lt!44079 lt!44074) lt!44075) lt!44322)))

(declare-fun b!91025 () Bool)

(declare-fun res!46391 () Bool)

(assert (=> b!91025 (=> (not res!46391) (not e!59378))))

(assert (=> b!91025 (= res!46391 (= (getValueByKey!142 (toList!753 lt!44322) (_1!1135 lt!44075)) (Some!147 (_2!1135 lt!44075))))))

(declare-fun b!91026 () Bool)

(assert (=> b!91026 (= e!59378 (contains!770 (toList!753 lt!44322) lt!44075))))

(assert (= (and d!24007 res!46390) b!91025))

(assert (= (and b!91025 res!46391) b!91026))

(declare-fun m!97735 () Bool)

(assert (=> d!24007 m!97735))

(declare-fun m!97737 () Bool)

(assert (=> d!24007 m!97737))

(declare-fun m!97739 () Bool)

(assert (=> d!24007 m!97739))

(declare-fun m!97741 () Bool)

(assert (=> d!24007 m!97741))

(declare-fun m!97743 () Bool)

(assert (=> b!91025 m!97743))

(declare-fun m!97745 () Bool)

(assert (=> b!91026 m!97745))

(assert (=> b!90775 d!24007))

(declare-fun d!24009 () Bool)

(declare-fun e!59383 () Bool)

(assert (=> d!24009 e!59383))

(declare-fun res!46394 () Bool)

(assert (=> d!24009 (=> res!46394 e!59383)))

(declare-fun lt!44335 () Bool)

(assert (=> d!24009 (= res!46394 (not lt!44335))))

(declare-fun lt!44334 () Bool)

(assert (=> d!24009 (= lt!44335 lt!44334)))

(declare-fun lt!44332 () Unit!2705)

(declare-fun e!59384 () Unit!2705)

(assert (=> d!24009 (= lt!44332 e!59384)))

(declare-fun c!15082 () Bool)

(assert (=> d!24009 (= c!15082 lt!44334)))

(declare-fun containsKey!146 (List!1552 (_ BitVec 64)) Bool)

(assert (=> d!24009 (= lt!44334 (containsKey!146 (toList!753 lt!44086) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(assert (=> d!24009 (= (contains!769 lt!44086 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)) lt!44335)))

(declare-fun b!91033 () Bool)

(declare-fun lt!44333 () Unit!2705)

(assert (=> b!91033 (= e!59384 lt!44333)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!95 (List!1552 (_ BitVec 64)) Unit!2705)

(assert (=> b!91033 (= lt!44333 (lemmaContainsKeyImpliesGetValueByKeyDefined!95 (toList!753 lt!44086) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun isDefined!96 (Option!148) Bool)

(assert (=> b!91033 (isDefined!96 (getValueByKey!142 (toList!753 lt!44086) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun b!91034 () Bool)

(declare-fun Unit!2714 () Unit!2705)

(assert (=> b!91034 (= e!59384 Unit!2714)))

(declare-fun b!91035 () Bool)

(assert (=> b!91035 (= e!59383 (isDefined!96 (getValueByKey!142 (toList!753 lt!44086) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))))

(assert (= (and d!24009 c!15082) b!91033))

(assert (= (and d!24009 (not c!15082)) b!91034))

(assert (= (and d!24009 (not res!46394)) b!91035))

(assert (=> d!24009 m!97357))

(declare-fun m!97747 () Bool)

(assert (=> d!24009 m!97747))

(assert (=> b!91033 m!97357))

(declare-fun m!97749 () Bool)

(assert (=> b!91033 m!97749))

(assert (=> b!91033 m!97357))

(declare-fun m!97751 () Bool)

(assert (=> b!91033 m!97751))

(assert (=> b!91033 m!97751))

(declare-fun m!97753 () Bool)

(assert (=> b!91033 m!97753))

(assert (=> b!91035 m!97357))

(assert (=> b!91035 m!97751))

(assert (=> b!91035 m!97751))

(assert (=> b!91035 m!97753))

(assert (=> b!90774 d!24009))

(declare-fun b!91116 () Bool)

(declare-fun lt!44416 () Unit!2705)

(declare-fun lt!44401 () Unit!2705)

(assert (=> b!91116 (= lt!44416 lt!44401)))

(declare-fun call!8885 () Bool)

(assert (=> b!91116 call!8885))

(declare-datatypes ((SeekEntryResult!250 0))(
  ( (MissingZero!250 (index!3140 (_ BitVec 32))) (Found!250 (index!3141 (_ BitVec 32))) (Intermediate!250 (undefined!1062 Bool) (index!3142 (_ BitVec 32)) (x!12407 (_ BitVec 32))) (Undefined!250) (MissingVacant!250 (index!3143 (_ BitVec 32))) )
))
(declare-fun lt!44415 () SeekEntryResult!250)

(declare-fun lt!44413 () array!4099)

(declare-fun lemmaValidKeyInArrayIsInListMap!94 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) Unit!2705)

(assert (=> b!91116 (= lt!44401 (lemmaValidKeyInArrayIsInListMap!94 (_keys!4078 newMap!16) lt!44413 (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (index!3141 lt!44415) (defaultEntry!2399 newMap!16)))))

(assert (=> b!91116 (= lt!44413 (array!4100 (store (arr!1949 (_values!2382 newMap!16)) (index!3141 lt!44415) (ValueCellFull!944 lt!44080)) (size!2197 (_values!2382 newMap!16))))))

(declare-fun lt!44414 () Unit!2705)

(declare-fun lt!44404 () Unit!2705)

(assert (=> b!91116 (= lt!44414 lt!44404)))

(declare-fun call!8900 () ListLongMap!1475)

(declare-fun call!8894 () ListLongMap!1475)

(assert (=> b!91116 (= call!8900 call!8894)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) (_ BitVec 64) V!3081 Int) Unit!2705)

(assert (=> b!91116 (= lt!44404 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (index!3141 lt!44415) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 (defaultEntry!2399 newMap!16)))))

(declare-fun lt!44400 () Unit!2705)

(declare-fun e!59437 () Unit!2705)

(assert (=> b!91116 (= lt!44400 e!59437)))

(declare-fun c!15115 () Bool)

(declare-fun call!8897 () ListLongMap!1475)

(assert (=> b!91116 (= c!15115 (contains!769 call!8897 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun e!59427 () tuple2!2250)

(assert (=> b!91116 (= e!59427 (tuple2!2251 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (_size!447 newMap!16) (_keys!4078 newMap!16) (array!4100 (store (arr!1949 (_values!2382 newMap!16)) (index!3141 lt!44415) (ValueCellFull!944 lt!44080)) (size!2197 (_values!2382 newMap!16))) (_vacant!447 newMap!16))))))

(declare-fun b!91117 () Bool)

(declare-fun e!59439 () Bool)

(declare-fun e!59443 () Bool)

(assert (=> b!91117 (= e!59439 e!59443)))

(declare-fun res!46427 () Bool)

(declare-fun call!8886 () Bool)

(assert (=> b!91117 (= res!46427 call!8886)))

(assert (=> b!91117 (=> (not res!46427) (not e!59443))))

(declare-fun call!8891 () ListLongMap!1475)

(declare-fun call!8888 () ListLongMap!1475)

(declare-fun b!91118 () Bool)

(declare-fun e!59432 () Bool)

(assert (=> b!91118 (= e!59432 (= call!8891 (+!118 call!8888 (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080))))))

(declare-fun b!91119 () Bool)

(declare-fun call!8904 () Bool)

(assert (=> b!91119 (= e!59443 (not call!8904))))

(declare-fun b!91120 () Bool)

(declare-fun e!59434 () tuple2!2250)

(declare-fun e!59435 () tuple2!2250)

(assert (=> b!91120 (= e!59434 e!59435)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4097 (_ BitVec 32)) SeekEntryResult!250)

(assert (=> b!91120 (= lt!44415 (seekEntryOrOpen!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (_keys!4078 newMap!16) (mask!6456 newMap!16)))))

(declare-fun c!15114 () Bool)

(assert (=> b!91120 (= c!15114 ((_ is Undefined!250) lt!44415))))

(declare-fun bm!8881 () Bool)

(declare-fun call!8890 () Bool)

(declare-fun call!8907 () Bool)

(assert (=> bm!8881 (= call!8890 call!8907)))

(declare-fun c!15118 () Bool)

(declare-fun bm!8882 () Bool)

(declare-fun lt!44397 () (_ BitVec 32))

(declare-fun call!8887 () ListLongMap!1475)

(declare-fun c!15120 () Bool)

(declare-fun lt!44398 () (_ BitVec 32))

(assert (=> bm!8882 (= call!8887 (getCurrentListMap!436 (_keys!4078 newMap!16) (ite (or c!15118 c!15114) (_values!2382 newMap!16) (array!4100 (store (arr!1949 (_values!2382 newMap!16)) (index!3141 lt!44415) (ValueCellFull!944 lt!44080)) (size!2197 (_values!2382 newMap!16)))) (mask!6456 newMap!16) (ite c!15118 (ite c!15120 lt!44398 lt!44397) (extraKeys!2230 newMap!16)) (ite (and c!15118 c!15120) lt!44080 (zeroValue!2287 newMap!16)) (ite c!15118 (ite c!15120 (minValue!2287 newMap!16) lt!44080) (minValue!2287 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun b!91121 () Bool)

(declare-fun res!46430 () Bool)

(declare-fun call!8899 () Bool)

(assert (=> b!91121 (= res!46430 call!8899)))

(declare-fun e!59440 () Bool)

(assert (=> b!91121 (=> (not res!46430) (not e!59440))))

(declare-fun bm!8883 () Bool)

(declare-fun call!8905 () SeekEntryResult!250)

(assert (=> bm!8883 (= call!8905 (seekEntryOrOpen!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (_keys!4078 newMap!16) (mask!6456 newMap!16)))))

(declare-fun b!91122 () Bool)

(declare-fun c!15116 () Bool)

(assert (=> b!91122 (= c!15116 ((_ is MissingVacant!250) lt!44415))))

(declare-fun e!59431 () tuple2!2250)

(assert (=> b!91122 (= e!59435 e!59431)))

(declare-fun b!91123 () Bool)

(declare-fun res!46425 () Bool)

(declare-fun e!59445 () Bool)

(assert (=> b!91123 (=> (not res!46425) (not e!59445))))

(declare-fun lt!44394 () SeekEntryResult!250)

(assert (=> b!91123 (= res!46425 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3140 lt!44394)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8884 () Bool)

(declare-fun c!15119 () Bool)

(assert (=> bm!8884 (= c!15119 c!15114)))

(declare-fun e!59436 () ListLongMap!1475)

(assert (=> bm!8884 (= call!8885 (contains!769 e!59436 (ite c!15114 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (select (arr!1948 (_keys!4078 newMap!16)) (index!3141 lt!44415)))))))

(declare-fun b!91124 () Bool)

(declare-fun lt!44390 () Unit!2705)

(declare-fun lt!44412 () Unit!2705)

(assert (=> b!91124 (= lt!44390 lt!44412)))

(declare-fun call!8903 () ListLongMap!1475)

(declare-fun call!8896 () ListLongMap!1475)

(assert (=> b!91124 (= call!8903 call!8896)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 V!3081 Int) Unit!2705)

(assert (=> b!91124 (= lt!44412 (lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) lt!44397 (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) lt!44080 (defaultEntry!2399 newMap!16)))))

(assert (=> b!91124 (= lt!44397 (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!59428 () tuple2!2250)

(assert (=> b!91124 (= e!59428 (tuple2!2251 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6456 newMap!16) (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000010) (zeroValue!2287 newMap!16) lt!44080 (_size!447 newMap!16) (_keys!4078 newMap!16) (_values!2382 newMap!16) (_vacant!447 newMap!16))))))

(declare-fun b!91125 () Bool)

(declare-fun e!59446 () Bool)

(declare-fun e!59441 () Bool)

(assert (=> b!91125 (= e!59446 e!59441)))

(declare-fun res!46423 () Bool)

(declare-fun call!8884 () Bool)

(assert (=> b!91125 (= res!46423 call!8884)))

(assert (=> b!91125 (=> (not res!46423) (not e!59441))))

(declare-fun b!91126 () Bool)

(declare-fun res!46433 () Bool)

(declare-fun lt!44407 () SeekEntryResult!250)

(assert (=> b!91126 (= res!46433 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3143 lt!44407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91126 (=> (not res!46433) (not e!59443))))

(declare-fun b!91127 () Bool)

(declare-fun e!59433 () Bool)

(assert (=> b!91127 (= e!59433 e!59432)))

(declare-fun res!46428 () Bool)

(assert (=> b!91127 (= res!46428 (contains!769 call!8891 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(assert (=> b!91127 (=> (not res!46428) (not e!59432))))

(declare-fun b!91128 () Bool)

(declare-fun Unit!2715 () Unit!2705)

(assert (=> b!91128 (= e!59437 Unit!2715)))

(declare-fun lt!44411 () Unit!2705)

(declare-fun call!8895 () Unit!2705)

(assert (=> b!91128 (= lt!44411 call!8895)))

(declare-fun call!8901 () SeekEntryResult!250)

(assert (=> b!91128 (= lt!44407 call!8901)))

(declare-fun c!15110 () Bool)

(assert (=> b!91128 (= c!15110 ((_ is MissingZero!250) lt!44407))))

(declare-fun e!59442 () Bool)

(assert (=> b!91128 e!59442))

(declare-fun lt!44409 () Unit!2705)

(assert (=> b!91128 (= lt!44409 lt!44411)))

(assert (=> b!91128 false))

(declare-fun b!91129 () Bool)

(declare-fun lt!44402 () tuple2!2250)

(declare-fun call!8902 () tuple2!2250)

(assert (=> b!91129 (= lt!44402 call!8902)))

(assert (=> b!91129 (= e!59427 (tuple2!2251 (_1!1136 lt!44402) (_2!1136 lt!44402)))))

(declare-fun bm!8885 () Bool)

(declare-fun call!8898 () SeekEntryResult!250)

(assert (=> bm!8885 (= call!8898 call!8905)))

(declare-fun bm!8886 () Bool)

(assert (=> bm!8886 (= call!8886 call!8899)))

(declare-fun bm!8887 () Bool)

(declare-fun call!8889 () Bool)

(declare-fun call!8906 () Bool)

(assert (=> bm!8887 (= call!8889 call!8906)))

(declare-fun bm!8888 () Bool)

(declare-fun c!15112 () Bool)

(declare-fun c!15111 () Bool)

(declare-fun lt!44395 () SeekEntryResult!250)

(declare-fun lt!44392 () SeekEntryResult!250)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8888 (= call!8906 (inRange!0 (ite c!15114 (ite c!15112 (index!3141 lt!44395) (ite c!15111 (index!3140 lt!44394) (index!3143 lt!44394))) (ite c!15115 (index!3141 lt!44392) (ite c!15110 (index!3140 lt!44407) (index!3143 lt!44407)))) (mask!6456 newMap!16)))))

(declare-fun bm!8889 () Bool)

(assert (=> bm!8889 (= call!8901 call!8905)))

(declare-fun b!91130 () Bool)

(assert (=> b!91130 (= e!59446 ((_ is Undefined!250) lt!44394))))

(declare-fun b!91131 () Bool)

(assert (=> b!91131 (= e!59434 e!59428)))

(assert (=> b!91131 (= c!15120 (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91132 () Bool)

(assert (=> b!91132 (= e!59439 ((_ is Undefined!250) lt!44407))))

(declare-fun b!91133 () Bool)

(assert (=> b!91133 (= e!59436 call!8894)))

(declare-fun bm!8890 () Bool)

(assert (=> bm!8890 (= call!8896 call!8887)))

(declare-fun b!91134 () Bool)

(declare-fun c!15117 () Bool)

(assert (=> b!91134 (= c!15117 ((_ is MissingVacant!250) lt!44394))))

(declare-fun e!59447 () Bool)

(assert (=> b!91134 (= e!59447 e!59446)))

(declare-fun e!59430 () Bool)

(declare-fun b!91135 () Bool)

(assert (=> b!91135 (= e!59430 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3141 lt!44395)) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun b!91136 () Bool)

(declare-fun res!46436 () Bool)

(declare-fun e!59429 () Bool)

(assert (=> b!91136 (=> (not res!46436) (not e!59429))))

(assert (=> b!91136 (= res!46436 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3140 lt!44407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8891 () Bool)

(declare-fun call!8892 () ListLongMap!1475)

(assert (=> bm!8891 (= call!8900 (+!118 (ite c!15118 call!8892 call!8897) (ite c!15118 (ite c!15120 (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44080) (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44080)) (tuple2!2249 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080))))))

(declare-fun b!91137 () Bool)

(declare-fun res!46431 () Bool)

(assert (=> b!91137 (= res!46431 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3143 lt!44394)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91137 (=> (not res!46431) (not e!59441))))

(declare-fun bm!8892 () Bool)

(assert (=> bm!8892 (= call!8888 (map!1210 newMap!16))))

(declare-fun b!91138 () Bool)

(declare-fun lt!44408 () tuple2!2250)

(assert (=> b!91138 (= e!59431 (tuple2!2251 (_1!1136 lt!44408) (_2!1136 lt!44408)))))

(assert (=> b!91138 (= lt!44408 call!8902)))

(declare-fun bm!8893 () Bool)

(assert (=> bm!8893 (= call!8903 call!8900)))

(declare-fun b!91139 () Bool)

(declare-fun lt!44406 () Unit!2705)

(declare-fun lt!44410 () Unit!2705)

(assert (=> b!91139 (= lt!44406 lt!44410)))

(assert (=> b!91139 (= call!8903 call!8896)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!35 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 V!3081 Int) Unit!2705)

(assert (=> b!91139 (= lt!44410 (lemmaChangeZeroKeyThenAddPairToListMap!35 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) lt!44398 (zeroValue!2287 newMap!16) lt!44080 (minValue!2287 newMap!16) (defaultEntry!2399 newMap!16)))))

(assert (=> b!91139 (= lt!44398 (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!91139 (= e!59428 (tuple2!2251 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6456 newMap!16) (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000001) lt!44080 (minValue!2287 newMap!16) (_size!447 newMap!16) (_keys!4078 newMap!16) (_values!2382 newMap!16) (_vacant!447 newMap!16))))))

(declare-fun b!91140 () Bool)

(declare-fun c!15109 () Bool)

(assert (=> b!91140 (= c!15109 ((_ is MissingVacant!250) lt!44407))))

(assert (=> b!91140 (= e!59442 e!59439)))

(declare-fun bm!8894 () Bool)

(declare-fun call!8893 () Unit!2705)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) Int) Unit!2705)

(assert (=> bm!8894 (= call!8893 (lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (defaultEntry!2399 newMap!16)))))

(declare-fun b!91141 () Bool)

(declare-fun e!59438 () Bool)

(assert (=> b!91141 (= e!59438 e!59433)))

(declare-fun c!15121 () Bool)

(declare-fun lt!44391 () tuple2!2250)

(assert (=> b!91141 (= c!15121 (_1!1136 lt!44391))))

(declare-fun bm!8895 () Bool)

(declare-fun updateHelperNewKey!35 (LongMapFixedSize!796 (_ BitVec 64) V!3081 (_ BitVec 32)) tuple2!2250)

(assert (=> bm!8895 (= call!8902 (updateHelperNewKey!35 newMap!16 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080 (ite c!15116 (index!3143 lt!44415) (index!3140 lt!44415))))))

(declare-fun b!91142 () Bool)

(declare-fun res!46424 () Bool)

(assert (=> b!91142 (=> (not res!46424) (not e!59429))))

(assert (=> b!91142 (= res!46424 call!8886)))

(assert (=> b!91142 (= e!59442 e!59429)))

(declare-fun bm!8896 () Bool)

(assert (=> bm!8896 (= call!8884 call!8889)))

(declare-fun bm!8897 () Bool)

(assert (=> bm!8897 (= call!8891 (map!1210 (_2!1136 lt!44391)))))

(declare-fun b!91143 () Bool)

(assert (=> b!91143 (= e!59445 (not call!8890))))

(declare-fun b!91144 () Bool)

(assert (=> b!91144 (= e!59436 (getCurrentListMap!436 (_keys!4078 newMap!16) lt!44413 (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun bm!8898 () Bool)

(assert (=> bm!8898 (= call!8907 (arrayContainsKey!0 (_keys!4078 newMap!16) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!91145 () Bool)

(assert (=> b!91145 (= e!59429 (not call!8904))))

(declare-fun b!91146 () Bool)

(assert (=> b!91146 (= e!59433 (= call!8891 call!8888))))

(declare-fun d!24011 () Bool)

(assert (=> d!24011 e!59438))

(declare-fun res!46435 () Bool)

(assert (=> d!24011 (=> (not res!46435) (not e!59438))))

(assert (=> d!24011 (= res!46435 (valid!359 (_2!1136 lt!44391)))))

(assert (=> d!24011 (= lt!44391 e!59434)))

(assert (=> d!24011 (= c!15118 (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvneg (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355))))))

(assert (=> d!24011 (valid!359 newMap!16)))

(assert (=> d!24011 (= (update!131 newMap!16 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) lt!44080) lt!44391)))

(declare-fun b!91147 () Bool)

(declare-fun lt!44393 () Unit!2705)

(declare-fun e!59444 () Unit!2705)

(assert (=> b!91147 (= lt!44393 e!59444)))

(assert (=> b!91147 (= c!15112 call!8885)))

(assert (=> b!91147 (= e!59435 (tuple2!2251 false newMap!16))))

(declare-fun b!91148 () Bool)

(declare-fun lt!44399 () Unit!2705)

(assert (=> b!91148 (= e!59437 lt!44399)))

(assert (=> b!91148 (= lt!44399 call!8893)))

(assert (=> b!91148 (= lt!44392 call!8901)))

(declare-fun res!46429 () Bool)

(assert (=> b!91148 (= res!46429 ((_ is Found!250) lt!44392))))

(assert (=> b!91148 (=> (not res!46429) (not e!59440))))

(assert (=> b!91148 e!59440))

(declare-fun b!91149 () Bool)

(declare-fun Unit!2716 () Unit!2705)

(assert (=> b!91149 (= e!59444 Unit!2716)))

(declare-fun lt!44403 () Unit!2705)

(assert (=> b!91149 (= lt!44403 call!8893)))

(assert (=> b!91149 (= lt!44395 call!8898)))

(declare-fun res!46434 () Bool)

(assert (=> b!91149 (= res!46434 ((_ is Found!250) lt!44395))))

(assert (=> b!91149 (=> (not res!46434) (not e!59430))))

(assert (=> b!91149 e!59430))

(declare-fun lt!44396 () Unit!2705)

(assert (=> b!91149 (= lt!44396 lt!44403)))

(assert (=> b!91149 false))

(declare-fun bm!8899 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) Int) Unit!2705)

(assert (=> bm!8899 (= call!8895 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (defaultEntry!2399 newMap!16)))))

(declare-fun b!91150 () Bool)

(assert (=> b!91150 (= e!59441 (not call!8890))))

(declare-fun b!91151 () Bool)

(declare-fun res!46432 () Bool)

(assert (=> b!91151 (= res!46432 call!8889)))

(assert (=> b!91151 (=> (not res!46432) (not e!59430))))

(declare-fun bm!8900 () Bool)

(assert (=> bm!8900 (= call!8899 call!8906)))

(declare-fun b!91152 () Bool)

(assert (=> b!91152 (= e!59440 (= (select (arr!1948 (_keys!4078 newMap!16)) (index!3141 lt!44392)) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun bm!8901 () Bool)

(assert (=> bm!8901 (= call!8892 call!8897)))

(declare-fun bm!8902 () Bool)

(assert (=> bm!8902 (= call!8897 (getCurrentListMap!436 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun bm!8903 () Bool)

(assert (=> bm!8903 (= call!8894 call!8887)))

(declare-fun bm!8904 () Bool)

(assert (=> bm!8904 (= call!8904 call!8907)))

(declare-fun b!91153 () Bool)

(declare-fun lt!44405 () Unit!2705)

(assert (=> b!91153 (= e!59444 lt!44405)))

(assert (=> b!91153 (= lt!44405 call!8895)))

(assert (=> b!91153 (= lt!44394 call!8898)))

(assert (=> b!91153 (= c!15111 ((_ is MissingZero!250) lt!44394))))

(assert (=> b!91153 e!59447))

(declare-fun b!91154 () Bool)

(assert (=> b!91154 (= e!59431 e!59427)))

(declare-fun c!15113 () Bool)

(assert (=> b!91154 (= c!15113 ((_ is MissingZero!250) lt!44415))))

(declare-fun b!91155 () Bool)

(declare-fun res!46426 () Bool)

(assert (=> b!91155 (=> (not res!46426) (not e!59445))))

(assert (=> b!91155 (= res!46426 call!8884)))

(assert (=> b!91155 (= e!59447 e!59445)))

(assert (= (and d!24011 c!15118) b!91131))

(assert (= (and d!24011 (not c!15118)) b!91120))

(assert (= (and b!91131 c!15120) b!91139))

(assert (= (and b!91131 (not c!15120)) b!91124))

(assert (= (or b!91139 b!91124) bm!8890))

(assert (= (or b!91139 b!91124) bm!8901))

(assert (= (or b!91139 b!91124) bm!8893))

(assert (= (and b!91120 c!15114) b!91147))

(assert (= (and b!91120 (not c!15114)) b!91122))

(assert (= (and b!91147 c!15112) b!91149))

(assert (= (and b!91147 (not c!15112)) b!91153))

(assert (= (and b!91149 res!46434) b!91151))

(assert (= (and b!91151 res!46432) b!91135))

(assert (= (and b!91153 c!15111) b!91155))

(assert (= (and b!91153 (not c!15111)) b!91134))

(assert (= (and b!91155 res!46426) b!91123))

(assert (= (and b!91123 res!46425) b!91143))

(assert (= (and b!91134 c!15117) b!91125))

(assert (= (and b!91134 (not c!15117)) b!91130))

(assert (= (and b!91125 res!46423) b!91137))

(assert (= (and b!91137 res!46431) b!91150))

(assert (= (or b!91155 b!91125) bm!8896))

(assert (= (or b!91143 b!91150) bm!8881))

(assert (= (or b!91151 bm!8896) bm!8887))

(assert (= (or b!91149 b!91153) bm!8885))

(assert (= (and b!91122 c!15116) b!91138))

(assert (= (and b!91122 (not c!15116)) b!91154))

(assert (= (and b!91154 c!15113) b!91129))

(assert (= (and b!91154 (not c!15113)) b!91116))

(assert (= (and b!91116 c!15115) b!91148))

(assert (= (and b!91116 (not c!15115)) b!91128))

(assert (= (and b!91148 res!46429) b!91121))

(assert (= (and b!91121 res!46430) b!91152))

(assert (= (and b!91128 c!15110) b!91142))

(assert (= (and b!91128 (not c!15110)) b!91140))

(assert (= (and b!91142 res!46424) b!91136))

(assert (= (and b!91136 res!46436) b!91145))

(assert (= (and b!91140 c!15109) b!91117))

(assert (= (and b!91140 (not c!15109)) b!91132))

(assert (= (and b!91117 res!46427) b!91126))

(assert (= (and b!91126 res!46433) b!91119))

(assert (= (or b!91142 b!91117) bm!8886))

(assert (= (or b!91145 b!91119) bm!8904))

(assert (= (or b!91121 bm!8886) bm!8900))

(assert (= (or b!91148 b!91128) bm!8889))

(assert (= (or b!91138 b!91129) bm!8895))

(assert (= (or b!91147 b!91116) bm!8903))

(assert (= (or b!91153 b!91128) bm!8899))

(assert (= (or bm!8881 bm!8904) bm!8898))

(assert (= (or b!91149 b!91148) bm!8894))

(assert (= (or bm!8887 bm!8900) bm!8888))

(assert (= (or bm!8885 bm!8889) bm!8883))

(assert (= (or b!91147 b!91116) bm!8884))

(assert (= (and bm!8884 c!15119) b!91133))

(assert (= (and bm!8884 (not c!15119)) b!91144))

(assert (= (or bm!8890 bm!8903) bm!8882))

(assert (= (or bm!8901 b!91116) bm!8902))

(assert (= (or bm!8893 b!91116) bm!8891))

(assert (= (and d!24011 res!46435) b!91141))

(assert (= (and b!91141 c!15121) b!91127))

(assert (= (and b!91141 (not c!15121)) b!91146))

(assert (= (and b!91127 res!46428) b!91118))

(assert (= (or b!91127 b!91118 b!91146) bm!8897))

(assert (= (or b!91118 b!91146) bm!8892))

(declare-fun m!97755 () Bool)

(assert (=> bm!8902 m!97755))

(declare-fun m!97757 () Bool)

(assert (=> b!91124 m!97757))

(assert (=> bm!8899 m!97357))

(declare-fun m!97759 () Bool)

(assert (=> bm!8899 m!97759))

(declare-fun m!97761 () Bool)

(assert (=> b!91152 m!97761))

(assert (=> bm!8892 m!97365))

(declare-fun m!97763 () Bool)

(assert (=> bm!8891 m!97763))

(assert (=> bm!8898 m!97357))

(declare-fun m!97765 () Bool)

(assert (=> bm!8898 m!97765))

(declare-fun m!97767 () Bool)

(assert (=> b!91118 m!97767))

(declare-fun m!97769 () Bool)

(assert (=> bm!8884 m!97769))

(declare-fun m!97771 () Bool)

(assert (=> bm!8884 m!97771))

(declare-fun m!97773 () Bool)

(assert (=> bm!8897 m!97773))

(assert (=> bm!8894 m!97357))

(declare-fun m!97775 () Bool)

(assert (=> bm!8894 m!97775))

(declare-fun m!97777 () Bool)

(assert (=> b!91135 m!97777))

(assert (=> bm!8895 m!97357))

(declare-fun m!97779 () Bool)

(assert (=> bm!8895 m!97779))

(declare-fun m!97781 () Bool)

(assert (=> d!24011 m!97781))

(assert (=> d!24011 m!97369))

(declare-fun m!97783 () Bool)

(assert (=> b!91139 m!97783))

(assert (=> b!91127 m!97357))

(declare-fun m!97785 () Bool)

(assert (=> b!91127 m!97785))

(declare-fun m!97787 () Bool)

(assert (=> b!91116 m!97787))

(declare-fun m!97789 () Bool)

(assert (=> b!91116 m!97789))

(assert (=> b!91116 m!97357))

(declare-fun m!97791 () Bool)

(assert (=> b!91116 m!97791))

(assert (=> b!91116 m!97357))

(declare-fun m!97793 () Bool)

(assert (=> b!91116 m!97793))

(declare-fun m!97795 () Bool)

(assert (=> b!91126 m!97795))

(declare-fun m!97797 () Bool)

(assert (=> b!91136 m!97797))

(declare-fun m!97799 () Bool)

(assert (=> b!91137 m!97799))

(declare-fun m!97801 () Bool)

(assert (=> b!91123 m!97801))

(declare-fun m!97803 () Bool)

(assert (=> bm!8888 m!97803))

(assert (=> b!91120 m!97357))

(declare-fun m!97805 () Bool)

(assert (=> b!91120 m!97805))

(assert (=> bm!8883 m!97357))

(assert (=> bm!8883 m!97805))

(assert (=> bm!8882 m!97789))

(declare-fun m!97807 () Bool)

(assert (=> bm!8882 m!97807))

(declare-fun m!97809 () Bool)

(assert (=> b!91144 m!97809))

(assert (=> b!90774 d!24011))

(declare-fun d!24013 () Bool)

(assert (=> d!24013 (= (array_inv!1221 (_keys!4078 newMap!16)) (bvsge (size!2196 (_keys!4078 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90764 d!24013))

(declare-fun d!24015 () Bool)

(assert (=> d!24015 (= (array_inv!1222 (_values!2382 newMap!16)) (bvsge (size!2197 (_values!2382 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90764 d!24015))

(declare-fun d!24017 () Bool)

(declare-fun res!46443 () Bool)

(declare-fun e!59450 () Bool)

(assert (=> d!24017 (=> (not res!46443) (not e!59450))))

(declare-fun simpleValid!62 (LongMapFixedSize!796) Bool)

(assert (=> d!24017 (= res!46443 (simpleValid!62 (_2!1136 lt!44082)))))

(assert (=> d!24017 (= (valid!359 (_2!1136 lt!44082)) e!59450)))

(declare-fun b!91162 () Bool)

(declare-fun res!46444 () Bool)

(assert (=> b!91162 (=> (not res!46444) (not e!59450))))

(declare-fun arrayCountValidKeys!0 (array!4097 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91162 (= res!46444 (= (arrayCountValidKeys!0 (_keys!4078 (_2!1136 lt!44082)) #b00000000000000000000000000000000 (size!2196 (_keys!4078 (_2!1136 lt!44082)))) (_size!447 (_2!1136 lt!44082))))))

(declare-fun b!91163 () Bool)

(declare-fun res!46445 () Bool)

(assert (=> b!91163 (=> (not res!46445) (not e!59450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4097 (_ BitVec 32)) Bool)

(assert (=> b!91163 (= res!46445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4078 (_2!1136 lt!44082)) (mask!6456 (_2!1136 lt!44082))))))

(declare-fun b!91164 () Bool)

(assert (=> b!91164 (= e!59450 (arrayNoDuplicates!0 (_keys!4078 (_2!1136 lt!44082)) #b00000000000000000000000000000000 Nil!1550))))

(assert (= (and d!24017 res!46443) b!91162))

(assert (= (and b!91162 res!46444) b!91163))

(assert (= (and b!91163 res!46445) b!91164))

(declare-fun m!97811 () Bool)

(assert (=> d!24017 m!97811))

(declare-fun m!97813 () Bool)

(assert (=> b!91162 m!97813))

(declare-fun m!97815 () Bool)

(assert (=> b!91163 m!97815))

(declare-fun m!97817 () Bool)

(assert (=> b!91164 m!97817))

(assert (=> b!90768 d!24017))

(declare-fun d!24019 () Bool)

(assert (=> d!24019 (= (map!1210 newMap!16) (getCurrentListMap!436 (_keys!4078 newMap!16) (_values!2382 newMap!16) (mask!6456 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun bs!3786 () Bool)

(assert (= bs!3786 d!24019))

(assert (=> bs!3786 m!97755))

(assert (=> b!90767 d!24019))

(declare-fun bm!8905 () Bool)

(declare-fun call!8910 () ListLongMap!1475)

(declare-fun call!8914 () ListLongMap!1475)

(assert (=> bm!8905 (= call!8910 call!8914)))

(declare-fun b!91166 () Bool)

(declare-fun res!46448 () Bool)

(declare-fun e!59462 () Bool)

(assert (=> b!91166 (=> (not res!46448) (not e!59462))))

(declare-fun e!59463 () Bool)

(assert (=> b!91166 (= res!46448 e!59463)))

(declare-fun res!46453 () Bool)

(assert (=> b!91166 (=> res!46453 e!59463)))

(declare-fun e!59457 () Bool)

(assert (=> b!91166 (= res!46453 (not e!59457))))

(declare-fun res!46447 () Bool)

(assert (=> b!91166 (=> (not res!46447) (not e!59457))))

(assert (=> b!91166 (= res!46447 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91167 () Bool)

(declare-fun e!59451 () ListLongMap!1475)

(assert (=> b!91167 (= e!59451 call!8910)))

(declare-fun b!91168 () Bool)

(declare-fun e!59452 () Unit!2705)

(declare-fun Unit!2717 () Unit!2705)

(assert (=> b!91168 (= e!59452 Unit!2717)))

(declare-fun bm!8906 () Bool)

(declare-fun call!8911 () ListLongMap!1475)

(assert (=> bm!8906 (= call!8914 call!8911)))

(declare-fun b!91169 () Bool)

(declare-fun e!59456 () ListLongMap!1475)

(declare-fun call!8908 () ListLongMap!1475)

(assert (=> b!91169 (= e!59456 call!8908)))

(declare-fun bm!8907 () Bool)

(declare-fun call!8909 () ListLongMap!1475)

(assert (=> bm!8907 (= call!8908 call!8909)))

(declare-fun b!91170 () Bool)

(declare-fun e!59455 () Bool)

(declare-fun lt!44426 () ListLongMap!1475)

(assert (=> b!91170 (= e!59455 (= (apply!86 lt!44426 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91171 () Bool)

(assert (=> b!91171 (= e!59457 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91172 () Bool)

(declare-fun e!59458 () ListLongMap!1475)

(assert (=> b!91172 (= e!59458 (+!118 call!8909 (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91173 () Bool)

(declare-fun c!15125 () Bool)

(assert (=> b!91173 (= c!15125 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91173 (= e!59456 e!59451)))

(declare-fun b!91174 () Bool)

(declare-fun e!59461 () Bool)

(assert (=> b!91174 (= e!59461 (= (apply!86 lt!44426 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91175 () Bool)

(declare-fun res!46446 () Bool)

(assert (=> b!91175 (=> (not res!46446) (not e!59462))))

(declare-fun e!59453 () Bool)

(assert (=> b!91175 (= res!46446 e!59453)))

(declare-fun c!15127 () Bool)

(assert (=> b!91175 (= c!15127 (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!24021 () Bool)

(assert (=> d!24021 e!59462))

(declare-fun res!46451 () Bool)

(assert (=> d!24021 (=> (not res!46451) (not e!59462))))

(assert (=> d!24021 (= res!46451 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))))

(declare-fun lt!44436 () ListLongMap!1475)

(assert (=> d!24021 (= lt!44426 lt!44436)))

(declare-fun lt!44431 () Unit!2705)

(assert (=> d!24021 (= lt!44431 e!59452)))

(declare-fun c!15126 () Bool)

(declare-fun e!59459 () Bool)

(assert (=> d!24021 (= c!15126 e!59459)))

(declare-fun res!46450 () Bool)

(assert (=> d!24021 (=> (not res!46450) (not e!59459))))

(assert (=> d!24021 (= res!46450 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> d!24021 (= lt!44436 e!59458)))

(declare-fun c!15123 () Bool)

(assert (=> d!24021 (= c!15123 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24021 (validMask!0 (mask!6456 (v!2705 (underlying!305 thiss!992))))))

(assert (=> d!24021 (= (getCurrentListMap!436 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) lt!44426)))

(declare-fun b!91165 () Bool)

(assert (=> b!91165 (= e!59451 call!8908)))

(declare-fun b!91176 () Bool)

(declare-fun lt!44419 () Unit!2705)

(assert (=> b!91176 (= e!59452 lt!44419)))

(declare-fun lt!44434 () ListLongMap!1475)

(assert (=> b!91176 (= lt!44434 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44429 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44424 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44424 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44427 () Unit!2705)

(assert (=> b!91176 (= lt!44427 (addStillContains!62 lt!44434 lt!44429 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44424))))

(assert (=> b!91176 (contains!769 (+!118 lt!44434 (tuple2!2249 lt!44429 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44424)))

(declare-fun lt!44430 () Unit!2705)

(assert (=> b!91176 (= lt!44430 lt!44427)))

(declare-fun lt!44428 () ListLongMap!1475)

(assert (=> b!91176 (= lt!44428 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44423 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44423 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44422 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44422 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44425 () Unit!2705)

(assert (=> b!91176 (= lt!44425 (addApplyDifferent!62 lt!44428 lt!44423 (minValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44422))))

(assert (=> b!91176 (= (apply!86 (+!118 lt!44428 (tuple2!2249 lt!44423 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44422) (apply!86 lt!44428 lt!44422))))

(declare-fun lt!44435 () Unit!2705)

(assert (=> b!91176 (= lt!44435 lt!44425)))

(declare-fun lt!44438 () ListLongMap!1475)

(assert (=> b!91176 (= lt!44438 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44433 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44433 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44437 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44437 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44432 () Unit!2705)

(assert (=> b!91176 (= lt!44432 (addApplyDifferent!62 lt!44438 lt!44433 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44437))))

(assert (=> b!91176 (= (apply!86 (+!118 lt!44438 (tuple2!2249 lt!44433 (zeroValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44437) (apply!86 lt!44438 lt!44437))))

(declare-fun lt!44418 () Unit!2705)

(assert (=> b!91176 (= lt!44418 lt!44432)))

(declare-fun lt!44421 () ListLongMap!1475)

(assert (=> b!91176 (= lt!44421 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun lt!44417 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44420 () (_ BitVec 64))

(assert (=> b!91176 (= lt!44420 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91176 (= lt!44419 (addApplyDifferent!62 lt!44421 lt!44417 (minValue!2287 (v!2705 (underlying!305 thiss!992))) lt!44420))))

(assert (=> b!91176 (= (apply!86 (+!118 lt!44421 (tuple2!2249 lt!44417 (minValue!2287 (v!2705 (underlying!305 thiss!992))))) lt!44420) (apply!86 lt!44421 lt!44420))))

(declare-fun b!91177 () Bool)

(assert (=> b!91177 (= e!59453 e!59455)))

(declare-fun res!46452 () Bool)

(declare-fun call!8912 () Bool)

(assert (=> b!91177 (= res!46452 call!8912)))

(assert (=> b!91177 (=> (not res!46452) (not e!59455))))

(declare-fun b!91178 () Bool)

(declare-fun e!59460 () Bool)

(assert (=> b!91178 (= e!59460 e!59461)))

(declare-fun res!46454 () Bool)

(declare-fun call!8913 () Bool)

(assert (=> b!91178 (= res!46454 call!8913)))

(assert (=> b!91178 (=> (not res!46454) (not e!59461))))

(declare-fun e!59454 () Bool)

(declare-fun b!91179 () Bool)

(assert (=> b!91179 (= e!59454 (= (apply!86 lt!44426 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91179 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2197 (_values!2382 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> b!91179 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91180 () Bool)

(assert (=> b!91180 (= e!59458 e!59456)))

(declare-fun c!15124 () Bool)

(assert (=> b!91180 (= c!15124 (and (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8908 () Bool)

(assert (=> bm!8908 (= call!8913 (contains!769 lt!44426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91181 () Bool)

(assert (=> b!91181 (= e!59463 e!59454)))

(declare-fun res!46449 () Bool)

(assert (=> b!91181 (=> (not res!46449) (not e!59454))))

(assert (=> b!91181 (= res!46449 (contains!769 lt!44426 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91181 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91182 () Bool)

(assert (=> b!91182 (= e!59453 (not call!8912))))

(declare-fun bm!8909 () Bool)

(assert (=> bm!8909 (= call!8909 (+!118 (ite c!15123 call!8911 (ite c!15124 call!8914 call!8910)) (ite (or c!15123 c!15124) (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2705 (underlying!305 thiss!992)))) (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2705 (underlying!305 thiss!992)))))))))

(declare-fun bm!8910 () Bool)

(assert (=> bm!8910 (= call!8911 (getCurrentListMapNoExtraKeys!82 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(declare-fun b!91183 () Bool)

(assert (=> b!91183 (= e!59460 (not call!8913))))

(declare-fun bm!8911 () Bool)

(assert (=> bm!8911 (= call!8912 (contains!769 lt!44426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91184 () Bool)

(assert (=> b!91184 (= e!59462 e!59460)))

(declare-fun c!15122 () Bool)

(assert (=> b!91184 (= c!15122 (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91185 () Bool)

(assert (=> b!91185 (= e!59459 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!24021 c!15123) b!91172))

(assert (= (and d!24021 (not c!15123)) b!91180))

(assert (= (and b!91180 c!15124) b!91169))

(assert (= (and b!91180 (not c!15124)) b!91173))

(assert (= (and b!91173 c!15125) b!91165))

(assert (= (and b!91173 (not c!15125)) b!91167))

(assert (= (or b!91165 b!91167) bm!8905))

(assert (= (or b!91169 bm!8905) bm!8906))

(assert (= (or b!91169 b!91165) bm!8907))

(assert (= (or b!91172 bm!8906) bm!8910))

(assert (= (or b!91172 bm!8907) bm!8909))

(assert (= (and d!24021 res!46450) b!91185))

(assert (= (and d!24021 c!15126) b!91176))

(assert (= (and d!24021 (not c!15126)) b!91168))

(assert (= (and d!24021 res!46451) b!91166))

(assert (= (and b!91166 res!46447) b!91171))

(assert (= (and b!91166 (not res!46453)) b!91181))

(assert (= (and b!91181 res!46449) b!91179))

(assert (= (and b!91166 res!46448) b!91175))

(assert (= (and b!91175 c!15127) b!91177))

(assert (= (and b!91175 (not c!15127)) b!91182))

(assert (= (and b!91177 res!46452) b!91170))

(assert (= (or b!91177 b!91182) bm!8911))

(assert (= (and b!91175 res!46446) b!91184))

(assert (= (and b!91184 c!15122) b!91178))

(assert (= (and b!91184 (not c!15122)) b!91183))

(assert (= (and b!91178 res!46454) b!91174))

(assert (= (or b!91178 b!91183) bm!8908))

(declare-fun b_lambda!4015 () Bool)

(assert (=> (not b_lambda!4015) (not b!91179)))

(assert (=> b!91179 t!5362))

(declare-fun b_and!5521 () Bool)

(assert (= b_and!5517 (and (=> t!5362 result!3053) b_and!5521)))

(assert (=> b!91179 t!5364))

(declare-fun b_and!5523 () Bool)

(assert (= b_and!5519 (and (=> t!5364 result!3057) b_and!5523)))

(declare-fun m!97819 () Bool)

(assert (=> bm!8911 m!97819))

(declare-fun m!97821 () Bool)

(assert (=> b!91174 m!97821))

(declare-fun m!97823 () Bool)

(assert (=> b!91176 m!97823))

(assert (=> b!91176 m!97389))

(declare-fun m!97825 () Bool)

(assert (=> b!91176 m!97825))

(declare-fun m!97827 () Bool)

(assert (=> b!91176 m!97827))

(declare-fun m!97829 () Bool)

(assert (=> b!91176 m!97829))

(declare-fun m!97831 () Bool)

(assert (=> b!91176 m!97831))

(declare-fun m!97833 () Bool)

(assert (=> b!91176 m!97833))

(declare-fun m!97835 () Bool)

(assert (=> b!91176 m!97835))

(assert (=> b!91176 m!97825))

(declare-fun m!97837 () Bool)

(assert (=> b!91176 m!97837))

(declare-fun m!97839 () Bool)

(assert (=> b!91176 m!97839))

(assert (=> b!91176 m!97585))

(declare-fun m!97841 () Bool)

(assert (=> b!91176 m!97841))

(declare-fun m!97843 () Bool)

(assert (=> b!91176 m!97843))

(assert (=> b!91176 m!97843))

(declare-fun m!97845 () Bool)

(assert (=> b!91176 m!97845))

(assert (=> b!91176 m!97823))

(declare-fun m!97847 () Bool)

(assert (=> b!91176 m!97847))

(assert (=> b!91176 m!97831))

(declare-fun m!97849 () Bool)

(assert (=> b!91176 m!97849))

(declare-fun m!97851 () Bool)

(assert (=> b!91176 m!97851))

(assert (=> bm!8910 m!97389))

(assert (=> b!91171 m!97585))

(assert (=> b!91171 m!97585))

(assert (=> b!91171 m!97587))

(assert (=> b!91179 m!97585))

(declare-fun m!97853 () Bool)

(assert (=> b!91179 m!97853))

(assert (=> b!91179 m!97597))

(assert (=> b!91179 m!97361))

(assert (=> b!91179 m!97599))

(assert (=> b!91179 m!97597))

(assert (=> b!91179 m!97585))

(assert (=> b!91179 m!97361))

(assert (=> b!91185 m!97585))

(assert (=> b!91185 m!97585))

(assert (=> b!91185 m!97587))

(declare-fun m!97855 () Bool)

(assert (=> bm!8909 m!97855))

(assert (=> b!91181 m!97585))

(assert (=> b!91181 m!97585))

(declare-fun m!97857 () Bool)

(assert (=> b!91181 m!97857))

(declare-fun m!97859 () Bool)

(assert (=> b!91170 m!97859))

(assert (=> d!24021 m!97591))

(declare-fun m!97861 () Bool)

(assert (=> bm!8908 m!97861))

(declare-fun m!97863 () Bool)

(assert (=> b!91172 m!97863))

(assert (=> b!90767 d!24021))

(declare-fun d!24023 () Bool)

(assert (=> d!24023 (not (arrayContainsKey!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44441 () Unit!2705)

(declare-fun choose!68 (array!4097 (_ BitVec 32) (_ BitVec 64) List!1553) Unit!2705)

(assert (=> d!24023 (= lt!44441 (choose!68 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (Cons!1549 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) Nil!1550)))))

(assert (=> d!24023 (bvslt (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24023 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (Cons!1549 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) Nil!1550)) lt!44441)))

(declare-fun bs!3787 () Bool)

(assert (= bs!3787 d!24023))

(assert (=> bs!3787 m!97357))

(assert (=> bs!3787 m!97405))

(assert (=> bs!3787 m!97357))

(declare-fun m!97865 () Bool)

(assert (=> bs!3787 m!97865))

(assert (=> b!90772 d!24023))

(declare-fun d!24025 () Bool)

(assert (=> d!24025 (arrayNoDuplicates!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) from!355 Nil!1550)))

(declare-fun lt!44444 () Unit!2705)

(declare-fun choose!39 (array!4097 (_ BitVec 32) (_ BitVec 32)) Unit!2705)

(assert (=> d!24025 (= lt!44444 (choose!39 (_keys!4078 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24025 (bvslt (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24025 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44444)))

(declare-fun bs!3788 () Bool)

(assert (= bs!3788 d!24025))

(assert (=> bs!3788 m!97401))

(declare-fun m!97867 () Bool)

(assert (=> bs!3788 m!97867))

(assert (=> b!90772 d!24025))

(declare-fun d!24027 () Bool)

(declare-fun res!46459 () Bool)

(declare-fun e!59468 () Bool)

(assert (=> d!24027 (=> res!46459 e!59468)))

(assert (=> d!24027 (= res!46459 (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(assert (=> d!24027 (= (arrayContainsKey!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59468)))

(declare-fun b!91190 () Bool)

(declare-fun e!59469 () Bool)

(assert (=> b!91190 (= e!59468 e!59469)))

(declare-fun res!46460 () Bool)

(assert (=> b!91190 (=> (not res!46460) (not e!59469))))

(assert (=> b!91190 (= res!46460 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(declare-fun b!91191 () Bool)

(assert (=> b!91191 (= e!59469 (arrayContainsKey!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24027 (not res!46459)) b!91190))

(assert (= (and b!91190 res!46460) b!91191))

(assert (=> d!24027 m!97585))

(assert (=> b!91191 m!97357))

(declare-fun m!97869 () Bool)

(assert (=> b!91191 m!97869))

(assert (=> b!90772 d!24027))

(declare-fun d!24029 () Bool)

(declare-fun e!59472 () Bool)

(assert (=> d!24029 e!59472))

(declare-fun c!15130 () Bool)

(assert (=> d!24029 (= c!15130 (and (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44447 () Unit!2705)

(declare-fun choose!549 (array!4097 array!4099 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) (_ BitVec 32) Int) Unit!2705)

(assert (=> d!24029 (= lt!44447 (choose!549 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))))))

(assert (=> d!24029 (validMask!0 (mask!6456 (v!2705 (underlying!305 thiss!992))))))

(assert (=> d!24029 (= (lemmaListMapContainsThenArrayContainsFrom!80 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (_values!2382 (v!2705 (underlying!305 thiss!992))) (mask!6456 (v!2705 (underlying!305 thiss!992))) (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) (zeroValue!2287 (v!2705 (underlying!305 thiss!992))) (minValue!2287 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992)))) lt!44447)))

(declare-fun b!91196 () Bool)

(assert (=> b!91196 (= e!59472 (arrayContainsKey!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91197 () Bool)

(assert (=> b!91197 (= e!59472 (ite (= (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2705 (underlying!305 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24029 c!15130) b!91196))

(assert (= (and d!24029 (not c!15130)) b!91197))

(assert (=> d!24029 m!97357))

(declare-fun m!97871 () Bool)

(assert (=> d!24029 m!97871))

(assert (=> d!24029 m!97591))

(assert (=> b!91196 m!97357))

(assert (=> b!91196 m!97405))

(assert (=> b!90772 d!24029))

(declare-fun b!91208 () Bool)

(declare-fun e!59481 () Bool)

(declare-fun contains!771 (List!1553 (_ BitVec 64)) Bool)

(assert (=> b!91208 (= e!59481 (contains!771 Nil!1550 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun b!91209 () Bool)

(declare-fun e!59483 () Bool)

(declare-fun call!8917 () Bool)

(assert (=> b!91209 (= e!59483 call!8917)))

(declare-fun b!91210 () Bool)

(declare-fun e!59482 () Bool)

(declare-fun e!59484 () Bool)

(assert (=> b!91210 (= e!59482 e!59484)))

(declare-fun res!46467 () Bool)

(assert (=> b!91210 (=> (not res!46467) (not e!59484))))

(assert (=> b!91210 (= res!46467 (not e!59481))))

(declare-fun res!46468 () Bool)

(assert (=> b!91210 (=> (not res!46468) (not e!59481))))

(assert (=> b!91210 (= res!46468 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun c!15133 () Bool)

(declare-fun bm!8914 () Bool)

(assert (=> bm!8914 (= call!8917 (arrayNoDuplicates!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15133 (Cons!1549 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355) Nil!1550) Nil!1550)))))

(declare-fun b!91211 () Bool)

(assert (=> b!91211 (= e!59484 e!59483)))

(assert (=> b!91211 (= c!15133 (validKeyInArray!0 (select (arr!1948 (_keys!4078 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun d!24031 () Bool)

(declare-fun res!46469 () Bool)

(assert (=> d!24031 (=> res!46469 e!59482)))

(assert (=> d!24031 (= res!46469 (bvsge from!355 (size!2196 (_keys!4078 (v!2705 (underlying!305 thiss!992))))))))

(assert (=> d!24031 (= (arrayNoDuplicates!0 (_keys!4078 (v!2705 (underlying!305 thiss!992))) from!355 Nil!1550) e!59482)))

(declare-fun b!91212 () Bool)

(assert (=> b!91212 (= e!59483 call!8917)))

(assert (= (and d!24031 (not res!46469)) b!91210))

(assert (= (and b!91210 res!46468) b!91208))

(assert (= (and b!91210 res!46467) b!91211))

(assert (= (and b!91211 c!15133) b!91212))

(assert (= (and b!91211 (not c!15133)) b!91209))

(assert (= (or b!91212 b!91209) bm!8914))

(assert (=> b!91208 m!97357))

(assert (=> b!91208 m!97357))

(declare-fun m!97873 () Bool)

(assert (=> b!91208 m!97873))

(assert (=> b!91210 m!97357))

(assert (=> b!91210 m!97357))

(assert (=> b!91210 m!97673))

(assert (=> bm!8914 m!97357))

(declare-fun m!97875 () Bool)

(assert (=> bm!8914 m!97875))

(assert (=> b!91211 m!97357))

(assert (=> b!91211 m!97357))

(assert (=> b!91211 m!97673))

(assert (=> b!90772 d!24031))

(declare-fun d!24033 () Bool)

(declare-fun c!15136 () Bool)

(assert (=> d!24033 (= c!15136 ((_ is ValueCellFull!944) (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355)))))

(declare-fun e!59487 () V!3081)

(assert (=> d!24033 (= (get!1236 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59487)))

(declare-fun b!91217 () Bool)

(declare-fun get!1237 (ValueCell!944 V!3081) V!3081)

(assert (=> b!91217 (= e!59487 (get!1237 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91218 () Bool)

(declare-fun get!1238 (ValueCell!944 V!3081) V!3081)

(assert (=> b!91218 (= e!59487 (get!1238 (select (arr!1949 (_values!2382 (v!2705 (underlying!305 thiss!992)))) from!355) (dynLambda!354 (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24033 c!15136) b!91217))

(assert (= (and d!24033 (not c!15136)) b!91218))

(assert (=> b!91217 m!97359))

(assert (=> b!91217 m!97361))

(declare-fun m!97877 () Bool)

(assert (=> b!91217 m!97877))

(assert (=> b!91218 m!97359))

(assert (=> b!91218 m!97361))

(declare-fun m!97879 () Bool)

(assert (=> b!91218 m!97879))

(assert (=> b!90762 d!24033))

(declare-fun d!24035 () Bool)

(assert (=> d!24035 (= (valid!358 thiss!992) (valid!359 (v!2705 (underlying!305 thiss!992))))))

(declare-fun bs!3789 () Bool)

(assert (= bs!3789 d!24035))

(declare-fun m!97881 () Bool)

(assert (=> bs!3789 m!97881))

(assert (=> start!11116 d!24035))

(declare-fun d!24037 () Bool)

(declare-fun res!46470 () Bool)

(declare-fun e!59488 () Bool)

(assert (=> d!24037 (=> (not res!46470) (not e!59488))))

(assert (=> d!24037 (= res!46470 (simpleValid!62 newMap!16))))

(assert (=> d!24037 (= (valid!359 newMap!16) e!59488)))

(declare-fun b!91219 () Bool)

(declare-fun res!46471 () Bool)

(assert (=> b!91219 (=> (not res!46471) (not e!59488))))

(assert (=> b!91219 (= res!46471 (= (arrayCountValidKeys!0 (_keys!4078 newMap!16) #b00000000000000000000000000000000 (size!2196 (_keys!4078 newMap!16))) (_size!447 newMap!16)))))

(declare-fun b!91220 () Bool)

(declare-fun res!46472 () Bool)

(assert (=> b!91220 (=> (not res!46472) (not e!59488))))

(assert (=> b!91220 (= res!46472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4078 newMap!16) (mask!6456 newMap!16)))))

(declare-fun b!91221 () Bool)

(assert (=> b!91221 (= e!59488 (arrayNoDuplicates!0 (_keys!4078 newMap!16) #b00000000000000000000000000000000 Nil!1550))))

(assert (= (and d!24037 res!46470) b!91219))

(assert (= (and b!91219 res!46471) b!91220))

(assert (= (and b!91220 res!46472) b!91221))

(declare-fun m!97883 () Bool)

(assert (=> d!24037 m!97883))

(declare-fun m!97885 () Bool)

(assert (=> b!91219 m!97885))

(declare-fun m!97887 () Bool)

(assert (=> b!91220 m!97887))

(declare-fun m!97889 () Bool)

(assert (=> b!91221 m!97889))

(assert (=> b!90771 d!24037))

(declare-fun mapIsEmpty!3559 () Bool)

(declare-fun mapRes!3559 () Bool)

(assert (=> mapIsEmpty!3559 mapRes!3559))

(declare-fun mapNonEmpty!3559 () Bool)

(declare-fun tp!9229 () Bool)

(declare-fun e!59493 () Bool)

(assert (=> mapNonEmpty!3559 (= mapRes!3559 (and tp!9229 e!59493))))

(declare-fun mapRest!3559 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapKey!3559 () (_ BitVec 32))

(declare-fun mapValue!3559 () ValueCell!944)

(assert (=> mapNonEmpty!3559 (= mapRest!3543 (store mapRest!3559 mapKey!3559 mapValue!3559))))

(declare-fun b!91229 () Bool)

(declare-fun e!59494 () Bool)

(assert (=> b!91229 (= e!59494 tp_is_empty!2575)))

(declare-fun condMapEmpty!3559 () Bool)

(declare-fun mapDefault!3559 () ValueCell!944)

(assert (=> mapNonEmpty!3544 (= condMapEmpty!3559 (= mapRest!3543 ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3559)))))

(assert (=> mapNonEmpty!3544 (= tp!9201 (and e!59494 mapRes!3559))))

(declare-fun b!91228 () Bool)

(assert (=> b!91228 (= e!59493 tp_is_empty!2575)))

(assert (= (and mapNonEmpty!3544 condMapEmpty!3559) mapIsEmpty!3559))

(assert (= (and mapNonEmpty!3544 (not condMapEmpty!3559)) mapNonEmpty!3559))

(assert (= (and mapNonEmpty!3559 ((_ is ValueCellFull!944) mapValue!3559)) b!91228))

(assert (= (and mapNonEmpty!3544 ((_ is ValueCellFull!944) mapDefault!3559)) b!91229))

(declare-fun m!97891 () Bool)

(assert (=> mapNonEmpty!3559 m!97891))

(declare-fun mapIsEmpty!3560 () Bool)

(declare-fun mapRes!3560 () Bool)

(assert (=> mapIsEmpty!3560 mapRes!3560))

(declare-fun mapNonEmpty!3560 () Bool)

(declare-fun tp!9230 () Bool)

(declare-fun e!59495 () Bool)

(assert (=> mapNonEmpty!3560 (= mapRes!3560 (and tp!9230 e!59495))))

(declare-fun mapKey!3560 () (_ BitVec 32))

(declare-fun mapValue!3560 () ValueCell!944)

(declare-fun mapRest!3560 () (Array (_ BitVec 32) ValueCell!944))

(assert (=> mapNonEmpty!3560 (= mapRest!3544 (store mapRest!3560 mapKey!3560 mapValue!3560))))

(declare-fun b!91231 () Bool)

(declare-fun e!59496 () Bool)

(assert (=> b!91231 (= e!59496 tp_is_empty!2575)))

(declare-fun condMapEmpty!3560 () Bool)

(declare-fun mapDefault!3560 () ValueCell!944)

(assert (=> mapNonEmpty!3543 (= condMapEmpty!3560 (= mapRest!3544 ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3560)))))

(assert (=> mapNonEmpty!3543 (= tp!9199 (and e!59496 mapRes!3560))))

(declare-fun b!91230 () Bool)

(assert (=> b!91230 (= e!59495 tp_is_empty!2575)))

(assert (= (and mapNonEmpty!3543 condMapEmpty!3560) mapIsEmpty!3560))

(assert (= (and mapNonEmpty!3543 (not condMapEmpty!3560)) mapNonEmpty!3560))

(assert (= (and mapNonEmpty!3560 ((_ is ValueCellFull!944) mapValue!3560)) b!91230))

(assert (= (and mapNonEmpty!3543 ((_ is ValueCellFull!944) mapDefault!3560)) b!91231))

(declare-fun m!97893 () Bool)

(assert (=> mapNonEmpty!3560 m!97893))

(declare-fun b_lambda!4017 () Bool)

(assert (= b_lambda!4011 (or (and b!90765 b_free!2317) (and b!90764 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))) b_lambda!4017)))

(declare-fun b_lambda!4019 () Bool)

(assert (= b_lambda!4009 (or (and b!90765 b_free!2317) (and b!90764 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))) b_lambda!4019)))

(declare-fun b_lambda!4021 () Bool)

(assert (= b_lambda!4013 (or (and b!90765 b_free!2317) (and b!90764 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))) b_lambda!4021)))

(declare-fun b_lambda!4023 () Bool)

(assert (= b_lambda!4015 (or (and b!90765 b_free!2317) (and b!90764 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2705 (underlying!305 thiss!992))))) b_lambda!4023)))

(check-sat (not d!23991) (not bm!8895) (not b!91118) (not b!91220) (not bm!8891) (not d!23997) (not bm!8898) (not b!91217) (not mapNonEmpty!3560) (not b!91219) (not d!23999) (not bm!8914) (not b!91172) (not bm!8888) (not b!91170) (not b!91035) (not bm!8882) (not bm!8829) (not bm!8831) (not b!91022) (not bm!8909) (not b!91144) (not b!91176) (not b!91018) (not bm!8899) (not d!24009) (not bm!8897) (not b!91124) (not b_lambda!4007) (not b!90917) (not bm!8884) (not d!23989) (not d!23985) (not b!90915) (not b!91191) (not b!91020) (not d!24001) (not b!90953) (not b!91211) (not b!91218) (not b!90914) (not d!23995) (not b!91033) (not b!91007) (not d!23993) (not b_lambda!4019) (not d!24017) (not bm!8910) (not b!90955) (not b!91023) (not b!91179) (not b!90916) (not b!91210) tp_is_empty!2575 (not b!90948) (not d!24005) (not d!24021) (not d!23987) (not b_lambda!4023) (not b!90947) (not bm!8894) (not b!91127) (not b!91004) b_and!5523 (not d!24035) (not bm!8830) (not b!91196) (not b!91025) (not b!91012) (not b!91014) (not b!91005) (not b!91162) (not bm!8811) (not b!90943) b_and!5521 (not b!91021) (not b!91116) (not b!91003) (not bm!8908) (not bm!8883) (not b_next!2317) (not bm!8911) (not b!91164) (not b_lambda!4017) (not d!24003) (not b!91185) (not mapNonEmpty!3559) (not d!24037) (not bm!8892) (not b!91174) (not b!91026) (not b!90949) (not d!24029) (not bm!8832) (not b!90944) (not b!91208) (not d!24011) (not b!91221) (not d!24023) (not b!91120) (not b_next!2319) (not b!91139) (not bm!8902) (not b!91009) (not b!90942) (not d!24025) (not b!91181) (not d!24019) (not b_lambda!4021) (not b!91163) (not b!91024) (not b!91019) (not b!90954) (not b!90950) (not b!91171) (not d!24007))
(check-sat b_and!5521 b_and!5523 (not b_next!2317) (not b_next!2319))
