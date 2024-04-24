; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14100 () Bool)

(assert start!14100)

(declare-fun b!130982 () Bool)

(declare-fun b_free!2893 () Bool)

(declare-fun b_next!2893 () Bool)

(assert (=> b!130982 (= b_free!2893 (not b_next!2893))))

(declare-fun tp!11110 () Bool)

(declare-fun b_and!8113 () Bool)

(assert (=> b!130982 (= tp!11110 b_and!8113)))

(declare-fun b!130979 () Bool)

(declare-fun b_free!2895 () Bool)

(declare-fun b_next!2895 () Bool)

(assert (=> b!130979 (= b_free!2895 (not b_next!2895))))

(declare-fun tp!11112 () Bool)

(declare-fun b_and!8115 () Bool)

(assert (=> b!130979 (= tp!11112 b_and!8115)))

(declare-fun b!130969 () Bool)

(declare-fun e!85425 () Bool)

(declare-fun e!85426 () Bool)

(assert (=> b!130969 (= e!85425 e!85426)))

(declare-fun res!63115 () Bool)

(assert (=> b!130969 (=> (not res!63115) (not e!85426))))

(declare-datatypes ((V!3465 0))(
  ( (V!3466 (val!1476 Int)) )
))
(declare-datatypes ((tuple2!2552 0))(
  ( (tuple2!2553 (_1!1287 (_ BitVec 64)) (_2!1287 V!3465)) )
))
(declare-datatypes ((List!1688 0))(
  ( (Nil!1685) (Cons!1684 (h!2289 tuple2!2552) (t!6099 List!1688)) )
))
(declare-datatypes ((ListLongMap!1647 0))(
  ( (ListLongMap!1648 (toList!839 List!1688)) )
))
(declare-fun lt!68165 () ListLongMap!1647)

(declare-datatypes ((array!4735 0))(
  ( (array!4736 (arr!2240 (Array (_ BitVec 32) (_ BitVec 64))) (size!2507 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1088 0))(
  ( (ValueCellFull!1088 (v!3175 V!3465)) (EmptyCell!1088) )
))
(declare-datatypes ((array!4737 0))(
  ( (array!4738 (arr!2241 (Array (_ BitVec 32) ValueCell!1088)) (size!2508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1084 0))(
  ( (LongMapFixedSize!1085 (defaultEntry!2842 Int) (mask!7130 (_ BitVec 32)) (extraKeys!2611 (_ BitVec 32)) (zeroValue!2699 V!3465) (minValue!2699 V!3465) (_size!591 (_ BitVec 32)) (_keys!4587 array!4735) (_values!2825 array!4737) (_vacant!591 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!876 0))(
  ( (Cell!877 (v!3176 LongMapFixedSize!1084)) )
))
(declare-datatypes ((LongMap!876 0))(
  ( (LongMap!877 (underlying!449 Cell!876)) )
))
(declare-fun thiss!992 () LongMap!876)

(declare-fun lt!68164 () ListLongMap!1647)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!130969 (= res!63115 (and (= lt!68165 lt!68164) (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1084)

(declare-fun map!1392 (LongMapFixedSize!1084) ListLongMap!1647)

(assert (=> b!130969 (= lt!68164 (map!1392 newMap!16))))

(declare-fun getCurrentListMap!516 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> b!130969 (= lt!68165 (getCurrentListMap!516 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun mapNonEmpty!4589 () Bool)

(declare-fun mapRes!4590 () Bool)

(declare-fun tp!11109 () Bool)

(declare-fun e!85421 () Bool)

(assert (=> mapNonEmpty!4589 (= mapRes!4590 (and tp!11109 e!85421))))

(declare-fun mapKey!4590 () (_ BitVec 32))

(declare-fun mapRest!4589 () (Array (_ BitVec 32) ValueCell!1088))

(declare-fun mapValue!4590 () ValueCell!1088)

(assert (=> mapNonEmpty!4589 (= (arr!2241 (_values!2825 newMap!16)) (store mapRest!4589 mapKey!4590 mapValue!4590))))

(declare-fun res!63117 () Bool)

(assert (=> start!14100 (=> (not res!63117) (not e!85425))))

(declare-fun valid!535 (LongMap!876) Bool)

(assert (=> start!14100 (= res!63117 (valid!535 thiss!992))))

(assert (=> start!14100 e!85425))

(declare-fun e!85424 () Bool)

(assert (=> start!14100 e!85424))

(assert (=> start!14100 true))

(declare-fun e!85415 () Bool)

(assert (=> start!14100 e!85415))

(declare-fun mapNonEmpty!4590 () Bool)

(declare-fun mapRes!4589 () Bool)

(declare-fun tp!11111 () Bool)

(declare-fun e!85417 () Bool)

(assert (=> mapNonEmpty!4590 (= mapRes!4589 (and tp!11111 e!85417))))

(declare-fun mapKey!4589 () (_ BitVec 32))

(declare-fun mapValue!4589 () ValueCell!1088)

(declare-fun mapRest!4590 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4590 (= (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (store mapRest!4590 mapKey!4589 mapValue!4589))))

(declare-fun mapIsEmpty!4589 () Bool)

(assert (=> mapIsEmpty!4589 mapRes!4590))

(declare-fun b!130970 () Bool)

(declare-fun e!85422 () Bool)

(declare-fun e!85420 () Bool)

(assert (=> b!130970 (= e!85422 e!85420)))

(declare-fun b!130971 () Bool)

(declare-fun res!63116 () Bool)

(assert (=> b!130971 (=> (not res!63116) (not e!85425))))

(assert (=> b!130971 (= res!63116 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7130 newMap!16)) (_size!591 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!130972 () Bool)

(declare-fun tp_is_empty!2863 () Bool)

(assert (=> b!130972 (= e!85421 tp_is_empty!2863)))

(declare-fun b!130973 () Bool)

(assert (=> b!130973 (= e!85424 e!85422)))

(declare-fun b!130974 () Bool)

(declare-fun e!85419 () Bool)

(assert (=> b!130974 (= e!85419 tp_is_empty!2863)))

(declare-fun b!130975 () Bool)

(declare-fun e!85416 () Bool)

(assert (=> b!130975 (= e!85426 e!85416)))

(declare-fun res!63113 () Bool)

(assert (=> b!130975 (=> (not res!63113) (not e!85416))))

(declare-fun contains!877 (ListLongMap!1647 (_ BitVec 64)) Bool)

(assert (=> b!130975 (= res!63113 (contains!877 lt!68164 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2554 0))(
  ( (tuple2!2555 (_1!1288 Bool) (_2!1288 LongMapFixedSize!1084)) )
))
(declare-fun lt!68166 () tuple2!2554)

(declare-fun update!193 (LongMapFixedSize!1084 (_ BitVec 64) V!3465) tuple2!2554)

(declare-fun get!1476 (ValueCell!1088 V!3465) V!3465)

(declare-fun dynLambda!423 (Int (_ BitVec 64)) V!3465)

(assert (=> b!130975 (= lt!68166 (update!193 newMap!16 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130976 () Bool)

(declare-fun e!85418 () Bool)

(assert (=> b!130976 (= e!85418 tp_is_empty!2863)))

(declare-fun b!130977 () Bool)

(declare-fun e!85423 () Bool)

(assert (=> b!130977 (= e!85423 (and e!85418 mapRes!4590))))

(declare-fun condMapEmpty!4590 () Bool)

(declare-fun mapDefault!4590 () ValueCell!1088)

(assert (=> b!130977 (= condMapEmpty!4590 (= (arr!2241 (_values!2825 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4590)))))

(declare-fun b!130978 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4735 (_ BitVec 32)) Bool)

(assert (=> b!130978 (= e!85416 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun array_inv!1403 (array!4735) Bool)

(declare-fun array_inv!1404 (array!4737) Bool)

(assert (=> b!130979 (= e!85415 (and tp!11112 tp_is_empty!2863 (array_inv!1403 (_keys!4587 newMap!16)) (array_inv!1404 (_values!2825 newMap!16)) e!85423))))

(declare-fun mapIsEmpty!4590 () Bool)

(assert (=> mapIsEmpty!4590 mapRes!4589))

(declare-fun b!130980 () Bool)

(declare-fun e!85413 () Bool)

(assert (=> b!130980 (= e!85413 (and e!85419 mapRes!4589))))

(declare-fun condMapEmpty!4589 () Bool)

(declare-fun mapDefault!4589 () ValueCell!1088)

(assert (=> b!130980 (= condMapEmpty!4589 (= (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4589)))))

(declare-fun b!130981 () Bool)

(declare-fun res!63118 () Bool)

(assert (=> b!130981 (=> (not res!63118) (not e!85416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!130981 (= res!63118 (validMask!0 (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(assert (=> b!130982 (= e!85420 (and tp!11110 tp_is_empty!2863 (array_inv!1403 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (array_inv!1404 (_values!2825 (v!3176 (underlying!449 thiss!992)))) e!85413))))

(declare-fun b!130983 () Bool)

(declare-fun res!63120 () Bool)

(assert (=> b!130983 (=> (not res!63120) (not e!85425))))

(assert (=> b!130983 (= res!63120 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun b!130984 () Bool)

(declare-fun res!63119 () Bool)

(assert (=> b!130984 (=> (not res!63119) (not e!85425))))

(declare-fun valid!536 (LongMapFixedSize!1084) Bool)

(assert (=> b!130984 (= res!63119 (valid!536 newMap!16))))

(declare-fun b!130985 () Bool)

(declare-fun res!63114 () Bool)

(assert (=> b!130985 (=> (not res!63114) (not e!85416))))

(assert (=> b!130985 (= res!63114 (and (= (size!2508 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7130 (v!3176 (underlying!449 thiss!992))))) (= (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (size!2508 (_values!2825 (v!3176 (underlying!449 thiss!992))))) (bvsge (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!130986 () Bool)

(assert (=> b!130986 (= e!85417 tp_is_empty!2863)))

(assert (= (and start!14100 res!63117) b!130983))

(assert (= (and b!130983 res!63120) b!130984))

(assert (= (and b!130984 res!63119) b!130971))

(assert (= (and b!130971 res!63116) b!130969))

(assert (= (and b!130969 res!63115) b!130975))

(assert (= (and b!130975 res!63113) b!130981))

(assert (= (and b!130981 res!63118) b!130985))

(assert (= (and b!130985 res!63114) b!130978))

(assert (= (and b!130980 condMapEmpty!4589) mapIsEmpty!4590))

(assert (= (and b!130980 (not condMapEmpty!4589)) mapNonEmpty!4590))

(get-info :version)

(assert (= (and mapNonEmpty!4590 ((_ is ValueCellFull!1088) mapValue!4589)) b!130986))

(assert (= (and b!130980 ((_ is ValueCellFull!1088) mapDefault!4589)) b!130974))

(assert (= b!130982 b!130980))

(assert (= b!130970 b!130982))

(assert (= b!130973 b!130970))

(assert (= start!14100 b!130973))

(assert (= (and b!130977 condMapEmpty!4590) mapIsEmpty!4589))

(assert (= (and b!130977 (not condMapEmpty!4590)) mapNonEmpty!4589))

(assert (= (and mapNonEmpty!4589 ((_ is ValueCellFull!1088) mapValue!4590)) b!130972))

(assert (= (and b!130977 ((_ is ValueCellFull!1088) mapDefault!4590)) b!130976))

(assert (= b!130979 b!130977))

(assert (= start!14100 b!130979))

(declare-fun b_lambda!5849 () Bool)

(assert (=> (not b_lambda!5849) (not b!130975)))

(declare-fun t!6096 () Bool)

(declare-fun tb!2373 () Bool)

(assert (=> (and b!130982 (= (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))) t!6096) tb!2373))

(declare-fun result!3925 () Bool)

(assert (=> tb!2373 (= result!3925 tp_is_empty!2863)))

(assert (=> b!130975 t!6096))

(declare-fun b_and!8117 () Bool)

(assert (= b_and!8113 (and (=> t!6096 result!3925) b_and!8117)))

(declare-fun t!6098 () Bool)

(declare-fun tb!2375 () Bool)

(assert (=> (and b!130979 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))) t!6098) tb!2375))

(declare-fun result!3929 () Bool)

(assert (= result!3929 result!3925))

(assert (=> b!130975 t!6098))

(declare-fun b_and!8119 () Bool)

(assert (= b_and!8115 (and (=> t!6098 result!3929) b_and!8119)))

(declare-fun m!154705 () Bool)

(assert (=> b!130969 m!154705))

(declare-fun m!154707 () Bool)

(assert (=> b!130969 m!154707))

(declare-fun m!154709 () Bool)

(assert (=> b!130969 m!154709))

(declare-fun m!154711 () Bool)

(assert (=> b!130978 m!154711))

(declare-fun m!154713 () Bool)

(assert (=> mapNonEmpty!4590 m!154713))

(declare-fun m!154715 () Bool)

(assert (=> b!130981 m!154715))

(declare-fun m!154717 () Bool)

(assert (=> b!130982 m!154717))

(declare-fun m!154719 () Bool)

(assert (=> b!130982 m!154719))

(declare-fun m!154721 () Bool)

(assert (=> b!130975 m!154721))

(declare-fun m!154723 () Bool)

(assert (=> b!130975 m!154723))

(declare-fun m!154725 () Bool)

(assert (=> b!130975 m!154725))

(assert (=> b!130975 m!154705))

(assert (=> b!130975 m!154705))

(declare-fun m!154727 () Bool)

(assert (=> b!130975 m!154727))

(assert (=> b!130975 m!154723))

(assert (=> b!130975 m!154705))

(assert (=> b!130975 m!154725))

(declare-fun m!154729 () Bool)

(assert (=> b!130975 m!154729))

(assert (=> b!130975 m!154721))

(declare-fun m!154731 () Bool)

(assert (=> start!14100 m!154731))

(declare-fun m!154733 () Bool)

(assert (=> b!130979 m!154733))

(declare-fun m!154735 () Bool)

(assert (=> b!130979 m!154735))

(declare-fun m!154737 () Bool)

(assert (=> mapNonEmpty!4589 m!154737))

(declare-fun m!154739 () Bool)

(assert (=> b!130984 m!154739))

(check-sat (not b!130981) b_and!8117 (not b!130979) (not b_lambda!5849) tp_is_empty!2863 (not start!14100) (not mapNonEmpty!4589) (not b!130969) (not b!130984) (not b_next!2893) (not b!130982) (not b!130978) (not mapNonEmpty!4590) (not b!130975) b_and!8119 (not b_next!2895))
(check-sat b_and!8117 b_and!8119 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun b_lambda!5855 () Bool)

(assert (= b_lambda!5849 (or (and b!130982 b_free!2893) (and b!130979 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))))) b_lambda!5855)))

(check-sat (not b_lambda!5855) (not b!130981) b_and!8117 (not b!130979) tp_is_empty!2863 (not start!14100) (not mapNonEmpty!4589) (not b!130969) (not b!130984) (not b_next!2893) (not b!130982) (not b!130978) (not mapNonEmpty!4590) (not b!130975) b_and!8119 (not b_next!2895))
(check-sat b_and!8117 b_and!8119 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun d!40111 () Bool)

(declare-fun e!85523 () Bool)

(assert (=> d!40111 e!85523))

(declare-fun res!63171 () Bool)

(assert (=> d!40111 (=> res!63171 e!85523)))

(declare-fun lt!68194 () Bool)

(assert (=> d!40111 (= res!63171 (not lt!68194))))

(declare-fun lt!68193 () Bool)

(assert (=> d!40111 (= lt!68194 lt!68193)))

(declare-datatypes ((Unit!4103 0))(
  ( (Unit!4104) )
))
(declare-fun lt!68196 () Unit!4103)

(declare-fun e!85522 () Unit!4103)

(assert (=> d!40111 (= lt!68196 e!85522)))

(declare-fun c!24210 () Bool)

(assert (=> d!40111 (= c!24210 lt!68193)))

(declare-fun containsKey!174 (List!1688 (_ BitVec 64)) Bool)

(assert (=> d!40111 (= lt!68193 (containsKey!174 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> d!40111 (= (contains!877 lt!68164 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) lt!68194)))

(declare-fun b!131107 () Bool)

(declare-fun lt!68195 () Unit!4103)

(assert (=> b!131107 (= e!85522 lt!68195)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!122 (List!1688 (_ BitVec 64)) Unit!4103)

(assert (=> b!131107 (= lt!68195 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-datatypes ((Option!177 0))(
  ( (Some!176 (v!3182 V!3465)) (None!175) )
))
(declare-fun isDefined!123 (Option!177) Bool)

(declare-fun getValueByKey!171 (List!1688 (_ BitVec 64)) Option!177)

(assert (=> b!131107 (isDefined!123 (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131108 () Bool)

(declare-fun Unit!4105 () Unit!4103)

(assert (=> b!131108 (= e!85522 Unit!4105)))

(declare-fun b!131109 () Bool)

(assert (=> b!131109 (= e!85523 (isDefined!123 (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(assert (= (and d!40111 c!24210) b!131107))

(assert (= (and d!40111 (not c!24210)) b!131108))

(assert (= (and d!40111 (not res!63171)) b!131109))

(assert (=> d!40111 m!154705))

(declare-fun m!154813 () Bool)

(assert (=> d!40111 m!154813))

(assert (=> b!131107 m!154705))

(declare-fun m!154815 () Bool)

(assert (=> b!131107 m!154815))

(assert (=> b!131107 m!154705))

(declare-fun m!154817 () Bool)

(assert (=> b!131107 m!154817))

(assert (=> b!131107 m!154817))

(declare-fun m!154819 () Bool)

(assert (=> b!131107 m!154819))

(assert (=> b!131109 m!154705))

(assert (=> b!131109 m!154817))

(assert (=> b!131109 m!154817))

(assert (=> b!131109 m!154819))

(assert (=> b!130975 d!40111))

(declare-datatypes ((SeekEntryResult!267 0))(
  ( (MissingZero!267 (index!3226 (_ BitVec 32))) (Found!267 (index!3227 (_ BitVec 32))) (Intermediate!267 (undefined!1079 Bool) (index!3228 (_ BitVec 32)) (x!15406 (_ BitVec 32))) (Undefined!267) (MissingVacant!267 (index!3229 (_ BitVec 32))) )
))
(declare-fun call!14290 () SeekEntryResult!267)

(declare-fun bm!14284 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4735 (_ BitVec 32)) SeekEntryResult!267)

(assert (=> bm!14284 (= call!14290 (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun b!131194 () Bool)

(declare-fun res!63209 () Bool)

(declare-fun lt!68272 () SeekEntryResult!267)

(assert (=> b!131194 (= res!63209 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3229 lt!68272)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85580 () Bool)

(assert (=> b!131194 (=> (not res!63209) (not e!85580))))

(declare-fun bm!14285 () Bool)

(declare-fun call!14297 () Bool)

(declare-fun call!14299 () Bool)

(assert (=> bm!14285 (= call!14297 call!14299)))

(declare-fun b!131195 () Bool)

(declare-fun e!85568 () Unit!4103)

(declare-fun lt!68256 () Unit!4103)

(assert (=> b!131195 (= e!85568 lt!68256)))

(declare-fun call!14298 () Unit!4103)

(assert (=> b!131195 (= lt!68256 call!14298)))

(declare-fun lt!68260 () SeekEntryResult!267)

(declare-fun call!14310 () SeekEntryResult!267)

(assert (=> b!131195 (= lt!68260 call!14310)))

(declare-fun c!24241 () Bool)

(assert (=> b!131195 (= c!24241 ((_ is MissingZero!267) lt!68260))))

(declare-fun e!85569 () Bool)

(assert (=> b!131195 e!85569))

(declare-fun e!85573 () Bool)

(declare-fun lt!68277 () SeekEntryResult!267)

(declare-fun b!131196 () Bool)

(assert (=> b!131196 (= e!85573 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68277)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131197 () Bool)

(declare-fun lt!68262 () Unit!4103)

(declare-fun lt!68258 () Unit!4103)

(assert (=> b!131197 (= lt!68262 lt!68258)))

(declare-fun call!14291 () ListLongMap!1647)

(declare-fun call!14295 () ListLongMap!1647)

(assert (=> b!131197 (= call!14291 call!14295)))

(declare-fun lt!68265 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!59 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4103)

(assert (=> b!131197 (= lt!68258 (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68265 (zeroValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131197 (= lt!68265 (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!85581 () tuple2!2554)

(assert (=> b!131197 (= e!85581 (tuple2!2555 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7130 newMap!16) (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (_size!591 newMap!16) (_keys!4587 newMap!16) (_values!2825 newMap!16) (_vacant!591 newMap!16))))))

(declare-fun b!131198 () Bool)

(declare-fun res!63207 () Bool)

(declare-fun call!14294 () Bool)

(assert (=> b!131198 (= res!63207 call!14294)))

(assert (=> b!131198 (=> (not res!63207) (not e!85573))))

(declare-fun bm!14286 () Bool)

(declare-fun call!14303 () Bool)

(declare-fun call!14309 () Bool)

(assert (=> bm!14286 (= call!14303 call!14309)))

(declare-fun d!40113 () Bool)

(declare-fun e!85587 () Bool)

(assert (=> d!40113 e!85587))

(declare-fun res!63202 () Bool)

(assert (=> d!40113 (=> (not res!63202) (not e!85587))))

(declare-fun lt!68273 () tuple2!2554)

(assert (=> d!40113 (= res!63202 (valid!536 (_2!1288 lt!68273)))))

(declare-fun e!85582 () tuple2!2554)

(assert (=> d!40113 (= lt!68273 e!85582)))

(declare-fun c!24249 () Bool)

(assert (=> d!40113 (= c!24249 (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (bvneg (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(assert (=> d!40113 (valid!536 newMap!16)))

(assert (=> d!40113 (= (update!193 newMap!16 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68273)))

(declare-fun b!131199 () Bool)

(declare-fun c!24245 () Bool)

(assert (=> b!131199 (= c!24245 ((_ is MissingVacant!267) lt!68272))))

(declare-fun e!85583 () Bool)

(declare-fun e!85586 () Bool)

(assert (=> b!131199 (= e!85583 e!85586)))

(declare-fun b!131200 () Bool)

(declare-fun e!85576 () Bool)

(assert (=> b!131200 (= e!85576 (not call!14303))))

(declare-fun b!131201 () Bool)

(declare-fun e!85577 () ListLongMap!1647)

(assert (=> b!131201 (= e!85577 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131202 () Bool)

(declare-fun call!14305 () ListLongMap!1647)

(assert (=> b!131202 (= e!85577 call!14305)))

(declare-fun b!131203 () Bool)

(declare-fun e!85579 () Bool)

(declare-fun e!85574 () Bool)

(assert (=> b!131203 (= e!85579 e!85574)))

(declare-fun res!63206 () Bool)

(declare-fun call!14306 () ListLongMap!1647)

(assert (=> b!131203 (= res!63206 (contains!877 call!14306 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> b!131203 (=> (not res!63206) (not e!85574))))

(declare-fun bm!14287 () Bool)

(declare-fun call!14300 () ListLongMap!1647)

(assert (=> bm!14287 (= call!14300 (map!1392 newMap!16))))

(declare-fun b!131204 () Bool)

(declare-fun e!85588 () Bool)

(declare-fun call!14308 () Bool)

(assert (=> b!131204 (= e!85588 (not call!14308))))

(declare-fun b!131205 () Bool)

(assert (=> b!131205 (= e!85586 ((_ is Undefined!267) lt!68272))))

(declare-fun bm!14288 () Bool)

(declare-fun c!24252 () Bool)

(declare-fun c!24248 () Bool)

(assert (=> bm!14288 (= c!24252 c!24248)))

(declare-fun call!14287 () Bool)

(assert (=> bm!14288 (= call!14287 (contains!877 e!85577 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun bm!14289 () Bool)

(declare-fun call!14292 () ListLongMap!1647)

(assert (=> bm!14289 (= call!14305 call!14292)))

(declare-fun b!131206 () Bool)

(declare-fun e!85571 () ListLongMap!1647)

(declare-fun call!14288 () ListLongMap!1647)

(assert (=> b!131206 (= e!85571 call!14288)))

(declare-fun b!131207 () Bool)

(declare-fun c!24242 () Bool)

(assert (=> b!131207 (= c!24242 ((_ is MissingVacant!267) lt!68260))))

(declare-fun e!85589 () Bool)

(assert (=> b!131207 (= e!85569 e!85589)))

(declare-fun bm!14290 () Bool)

(assert (=> bm!14290 (= call!14294 call!14299)))

(declare-fun bm!14291 () Bool)

(assert (=> bm!14291 (= call!14308 call!14309)))

(declare-fun b!131208 () Bool)

(declare-fun lt!68269 () Unit!4103)

(declare-fun lt!68271 () Unit!4103)

(assert (=> b!131208 (= lt!68269 lt!68271)))

(declare-fun lt!68267 () SeekEntryResult!267)

(assert (=> b!131208 (contains!877 call!14305 (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267)))))

(declare-fun lt!68268 () array!4737)

(declare-fun lemmaValidKeyInArrayIsInListMap!119 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) Unit!4103)

(assert (=> b!131208 (= lt!68271 (lemmaValidKeyInArrayIsInListMap!119 (_keys!4587 newMap!16) lt!68268 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131208 (= lt!68268 (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))))))

(declare-fun lt!68263 () Unit!4103)

(declare-fun lt!68254 () Unit!4103)

(assert (=> b!131208 (= lt!68263 lt!68254)))

(declare-fun call!14293 () ListLongMap!1647)

(declare-fun call!14289 () ListLongMap!1647)

(assert (=> b!131208 (= call!14293 call!14289)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4103)

(assert (=> b!131208 (= lt!68254 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68255 () Unit!4103)

(declare-fun e!85575 () Unit!4103)

(assert (=> b!131208 (= lt!68255 e!85575)))

(declare-fun c!24239 () Bool)

(assert (=> b!131208 (= c!24239 call!14287)))

(declare-fun e!85584 () tuple2!2554)

(assert (=> b!131208 (= e!85584 (tuple2!2555 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (_size!591 newMap!16) (_keys!4587 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))) (_vacant!591 newMap!16))))))

(declare-fun b!131209 () Bool)

(assert (=> b!131209 (= e!85589 ((_ is Undefined!267) lt!68260))))

(declare-fun call!14296 () tuple2!2554)

(declare-fun bm!14292 () Bool)

(declare-fun c!24243 () Bool)

(declare-fun updateHelperNewKey!59 (LongMapFixedSize!1084 (_ BitVec 64) V!3465 (_ BitVec 32)) tuple2!2554)

(assert (=> bm!14292 (= call!14296 (updateHelperNewKey!59 newMap!16 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267))))))

(declare-fun b!131210 () Bool)

(declare-fun e!85570 () tuple2!2554)

(declare-fun lt!68266 () tuple2!2554)

(assert (=> b!131210 (= e!85570 (tuple2!2555 (_1!1288 lt!68266) (_2!1288 lt!68266)))))

(assert (=> b!131210 (= lt!68266 call!14296)))

(declare-fun b!131211 () Bool)

(assert (=> b!131211 (= c!24243 ((_ is MissingVacant!267) lt!68267))))

(declare-fun e!85572 () tuple2!2554)

(assert (=> b!131211 (= e!85572 e!85570)))

(declare-fun b!131212 () Bool)

(declare-fun lt!68264 () Unit!4103)

(declare-fun lt!68270 () Unit!4103)

(assert (=> b!131212 (= lt!68264 lt!68270)))

(assert (=> b!131212 (= call!14291 call!14295)))

(declare-fun lt!68252 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4103)

(assert (=> b!131212 (= lt!68270 (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68252 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131212 (= lt!68252 (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!131212 (= e!85581 (tuple2!2555 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7130 newMap!16) (bvor (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) (zeroValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!591 newMap!16) (_keys!4587 newMap!16) (_values!2825 newMap!16) (_vacant!591 newMap!16))))))

(declare-fun bm!14293 () Bool)

(declare-fun call!14302 () Bool)

(assert (=> bm!14293 (= call!14302 call!14294)))

(declare-fun bm!14294 () Bool)

(declare-fun call!14301 () Bool)

(assert (=> bm!14294 (= call!14301 call!14297)))

(declare-fun bm!14295 () Bool)

(assert (=> bm!14295 (= call!14288 call!14289)))

(declare-fun b!131213 () Bool)

(declare-fun res!63200 () Bool)

(assert (=> b!131213 (=> (not res!63200) (not e!85588))))

(assert (=> b!131213 (= res!63200 call!14302)))

(assert (=> b!131213 (= e!85583 e!85588)))

(declare-fun b!131214 () Bool)

(declare-fun Unit!4106 () Unit!4103)

(assert (=> b!131214 (= e!85568 Unit!4106)))

(declare-fun lt!68261 () Unit!4103)

(declare-fun call!14304 () Unit!4103)

(assert (=> b!131214 (= lt!68261 call!14304)))

(declare-fun lt!68251 () SeekEntryResult!267)

(assert (=> b!131214 (= lt!68251 call!14310)))

(declare-fun res!63208 () Bool)

(assert (=> b!131214 (= res!63208 ((_ is Found!267) lt!68251))))

(declare-fun e!85585 () Bool)

(assert (=> b!131214 (=> (not res!63208) (not e!85585))))

(assert (=> b!131214 e!85585))

(declare-fun lt!68253 () Unit!4103)

(assert (=> b!131214 (= lt!68253 lt!68261)))

(assert (=> b!131214 false))

(declare-fun b!131215 () Bool)

(declare-fun res!63213 () Bool)

(assert (=> b!131215 (= res!63213 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3229 lt!68260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85578 () Bool)

(assert (=> b!131215 (=> (not res!63213) (not e!85578))))

(declare-fun b!131216 () Bool)

(assert (=> b!131216 (= e!85586 e!85580)))

(declare-fun res!63205 () Bool)

(assert (=> b!131216 (= res!63205 call!14302)))

(assert (=> b!131216 (=> (not res!63205) (not e!85580))))

(declare-fun b!131217 () Bool)

(assert (=> b!131217 (= e!85587 e!85579)))

(declare-fun c!24251 () Bool)

(assert (=> b!131217 (= c!24251 (_1!1288 lt!68273))))

(declare-fun bm!14296 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4103)

(assert (=> bm!14296 (= call!14304 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(declare-fun b!131218 () Bool)

(assert (=> b!131218 (= e!85570 e!85584)))

(declare-fun c!24250 () Bool)

(assert (=> b!131218 (= c!24250 ((_ is MissingZero!267) lt!68267))))

(declare-fun b!131219 () Bool)

(declare-fun lt!68259 () Unit!4103)

(assert (=> b!131219 (= e!85575 lt!68259)))

(assert (=> b!131219 (= lt!68259 call!14304)))

(declare-fun call!14307 () SeekEntryResult!267)

(assert (=> b!131219 (= lt!68277 call!14307)))

(declare-fun res!63211 () Bool)

(assert (=> b!131219 (= res!63211 ((_ is Found!267) lt!68277))))

(assert (=> b!131219 (=> (not res!63211) (not e!85573))))

(assert (=> b!131219 e!85573))

(declare-fun b!131220 () Bool)

(assert (=> b!131220 (= e!85578 (not call!14303))))

(declare-fun b!131221 () Bool)

(declare-fun lt!68274 () Unit!4103)

(assert (=> b!131221 (= lt!68274 e!85568)))

(declare-fun c!24240 () Bool)

(assert (=> b!131221 (= c!24240 call!14287)))

(assert (=> b!131221 (= e!85572 (tuple2!2555 false newMap!16))))

(declare-fun c!24246 () Bool)

(declare-fun bm!14297 () Bool)

(assert (=> bm!14297 (= call!14292 (getCurrentListMap!516 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131222 () Bool)

(assert (=> b!131222 (= e!85585 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68251)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131223 () Bool)

(assert (=> b!131223 (= e!85580 (not call!14308))))

(declare-fun b!131224 () Bool)

(declare-fun lt!68257 () tuple2!2554)

(assert (=> b!131224 (= lt!68257 call!14296)))

(assert (=> b!131224 (= e!85584 (tuple2!2555 (_1!1288 lt!68257) (_2!1288 lt!68257)))))

(declare-fun bm!14298 () Bool)

(assert (=> bm!14298 (= call!14306 (map!1392 (_2!1288 lt!68273)))))

(declare-fun b!131225 () Bool)

(assert (=> b!131225 (= e!85579 (= call!14306 call!14300))))

(declare-fun b!131226 () Bool)

(assert (=> b!131226 (= e!85582 e!85581)))

(assert (=> b!131226 (= c!24246 (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!24244 () Bool)

(declare-fun bm!14299 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14299 (= call!14299 (inRange!0 (ite c!24248 (ite c!24240 (index!3227 lt!68251) (ite c!24241 (index!3226 lt!68260) (index!3229 lt!68260))) (ite c!24239 (index!3227 lt!68277) (ite c!24244 (index!3226 lt!68272) (index!3229 lt!68272)))) (mask!7130 newMap!16)))))

(declare-fun b!131227 () Bool)

(declare-fun res!63203 () Bool)

(assert (=> b!131227 (=> (not res!63203) (not e!85576))))

(assert (=> b!131227 (= res!63203 call!14301)))

(assert (=> b!131227 (= e!85569 e!85576)))

(declare-fun bm!14300 () Bool)

(declare-fun +!167 (ListLongMap!1647 tuple2!2552) ListLongMap!1647)

(assert (=> bm!14300 (= call!14293 (+!167 e!85571 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24247 () Bool)

(assert (=> bm!14300 (= c!24247 c!24249)))

(declare-fun b!131228 () Bool)

(assert (=> b!131228 (= e!85571 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14301 () Bool)

(assert (=> bm!14301 (= call!14310 call!14290)))

(declare-fun b!131229 () Bool)

(assert (=> b!131229 (= e!85589 e!85578)))

(declare-fun res!63204 () Bool)

(assert (=> b!131229 (= res!63204 call!14301)))

(assert (=> b!131229 (=> (not res!63204) (not e!85578))))

(declare-fun b!131230 () Bool)

(declare-fun Unit!4107 () Unit!4103)

(assert (=> b!131230 (= e!85575 Unit!4107)))

(declare-fun lt!68276 () Unit!4103)

(assert (=> b!131230 (= lt!68276 call!14298)))

(assert (=> b!131230 (= lt!68272 call!14307)))

(assert (=> b!131230 (= c!24244 ((_ is MissingZero!267) lt!68272))))

(assert (=> b!131230 e!85583))

(declare-fun lt!68275 () Unit!4103)

(assert (=> b!131230 (= lt!68275 lt!68276)))

(assert (=> b!131230 false))

(declare-fun b!131231 () Bool)

(declare-fun res!63210 () Bool)

(assert (=> b!131231 (= res!63210 call!14297)))

(assert (=> b!131231 (=> (not res!63210) (not e!85585))))

(declare-fun bm!14302 () Bool)

(assert (=> bm!14302 (= call!14289 (getCurrentListMap!516 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14303 () Bool)

(assert (=> bm!14303 (= call!14291 call!14293)))

(declare-fun b!131232 () Bool)

(declare-fun res!63212 () Bool)

(assert (=> b!131232 (=> (not res!63212) (not e!85588))))

(assert (=> b!131232 (= res!63212 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3226 lt!68272)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14304 () Bool)

(declare-fun arrayContainsKey!0 (array!4735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14304 (= call!14309 (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!14305 () Bool)

(assert (=> bm!14305 (= call!14295 call!14292)))

(declare-fun b!131233 () Bool)

(assert (=> b!131233 (= e!85574 (= call!14306 (+!167 call!14300 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!131234 () Bool)

(declare-fun res!63201 () Bool)

(assert (=> b!131234 (=> (not res!63201) (not e!85576))))

(assert (=> b!131234 (= res!63201 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3226 lt!68260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14306 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4103)

(assert (=> bm!14306 (= call!14298 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(declare-fun bm!14307 () Bool)

(assert (=> bm!14307 (= call!14307 call!14290)))

(declare-fun b!131235 () Bool)

(assert (=> b!131235 (= e!85582 e!85572)))

(assert (=> b!131235 (= lt!68267 (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(assert (=> b!131235 (= c!24248 ((_ is Undefined!267) lt!68267))))

(assert (= (and d!40113 c!24249) b!131226))

(assert (= (and d!40113 (not c!24249)) b!131235))

(assert (= (and b!131226 c!24246) b!131197))

(assert (= (and b!131226 (not c!24246)) b!131212))

(assert (= (or b!131197 b!131212) bm!14295))

(assert (= (or b!131197 b!131212) bm!14305))

(assert (= (or b!131197 b!131212) bm!14303))

(assert (= (and b!131235 c!24248) b!131221))

(assert (= (and b!131235 (not c!24248)) b!131211))

(assert (= (and b!131221 c!24240) b!131214))

(assert (= (and b!131221 (not c!24240)) b!131195))

(assert (= (and b!131214 res!63208) b!131231))

(assert (= (and b!131231 res!63210) b!131222))

(assert (= (and b!131195 c!24241) b!131227))

(assert (= (and b!131195 (not c!24241)) b!131207))

(assert (= (and b!131227 res!63203) b!131234))

(assert (= (and b!131234 res!63201) b!131200))

(assert (= (and b!131207 c!24242) b!131229))

(assert (= (and b!131207 (not c!24242)) b!131209))

(assert (= (and b!131229 res!63204) b!131215))

(assert (= (and b!131215 res!63213) b!131220))

(assert (= (or b!131227 b!131229) bm!14294))

(assert (= (or b!131200 b!131220) bm!14286))

(assert (= (or b!131231 bm!14294) bm!14285))

(assert (= (or b!131214 b!131195) bm!14301))

(assert (= (and b!131211 c!24243) b!131210))

(assert (= (and b!131211 (not c!24243)) b!131218))

(assert (= (and b!131218 c!24250) b!131224))

(assert (= (and b!131218 (not c!24250)) b!131208))

(assert (= (and b!131208 c!24239) b!131219))

(assert (= (and b!131208 (not c!24239)) b!131230))

(assert (= (and b!131219 res!63211) b!131198))

(assert (= (and b!131198 res!63207) b!131196))

(assert (= (and b!131230 c!24244) b!131213))

(assert (= (and b!131230 (not c!24244)) b!131199))

(assert (= (and b!131213 res!63200) b!131232))

(assert (= (and b!131232 res!63212) b!131204))

(assert (= (and b!131199 c!24245) b!131216))

(assert (= (and b!131199 (not c!24245)) b!131205))

(assert (= (and b!131216 res!63205) b!131194))

(assert (= (and b!131194 res!63209) b!131223))

(assert (= (or b!131213 b!131216) bm!14293))

(assert (= (or b!131204 b!131223) bm!14291))

(assert (= (or b!131198 bm!14293) bm!14290))

(assert (= (or b!131219 b!131230) bm!14307))

(assert (= (or b!131210 b!131224) bm!14292))

(assert (= (or bm!14285 bm!14290) bm!14299))

(assert (= (or b!131221 b!131208) bm!14289))

(assert (= (or bm!14286 bm!14291) bm!14304))

(assert (= (or b!131195 b!131230) bm!14306))

(assert (= (or b!131214 b!131219) bm!14296))

(assert (= (or bm!14301 bm!14307) bm!14284))

(assert (= (or b!131221 b!131208) bm!14288))

(assert (= (and bm!14288 c!24252) b!131202))

(assert (= (and bm!14288 (not c!24252)) b!131201))

(assert (= (or bm!14305 bm!14289) bm!14297))

(assert (= (or bm!14295 b!131208) bm!14302))

(assert (= (or bm!14303 b!131208) bm!14300))

(assert (= (and bm!14300 c!24247) b!131206))

(assert (= (and bm!14300 (not c!24247)) b!131228))

(assert (= (and d!40113 res!63202) b!131217))

(assert (= (and b!131217 c!24251) b!131203))

(assert (= (and b!131217 (not c!24251)) b!131225))

(assert (= (and b!131203 res!63206) b!131233))

(assert (= (or b!131203 b!131233 b!131225) bm!14298))

(assert (= (or b!131233 b!131225) bm!14287))

(declare-fun m!154821 () Bool)

(assert (=> bm!14299 m!154821))

(declare-fun m!154823 () Bool)

(assert (=> b!131233 m!154823))

(assert (=> b!131212 m!154725))

(declare-fun m!154825 () Bool)

(assert (=> b!131212 m!154825))

(declare-fun m!154827 () Bool)

(assert (=> bm!14297 m!154827))

(assert (=> b!131235 m!154705))

(declare-fun m!154829 () Bool)

(assert (=> b!131235 m!154829))

(declare-fun m!154831 () Bool)

(assert (=> b!131222 m!154831))

(assert (=> bm!14296 m!154705))

(declare-fun m!154833 () Bool)

(assert (=> bm!14296 m!154833))

(assert (=> bm!14292 m!154705))

(assert (=> bm!14292 m!154725))

(declare-fun m!154835 () Bool)

(assert (=> bm!14292 m!154835))

(declare-fun m!154837 () Bool)

(assert (=> bm!14300 m!154837))

(declare-fun m!154839 () Bool)

(assert (=> b!131194 m!154839))

(assert (=> bm!14288 m!154705))

(declare-fun m!154841 () Bool)

(assert (=> bm!14288 m!154841))

(declare-fun m!154843 () Bool)

(assert (=> b!131215 m!154843))

(assert (=> b!131197 m!154725))

(declare-fun m!154845 () Bool)

(assert (=> b!131197 m!154845))

(assert (=> b!131203 m!154705))

(declare-fun m!154847 () Bool)

(assert (=> b!131203 m!154847))

(assert (=> bm!14304 m!154705))

(declare-fun m!154849 () Bool)

(assert (=> bm!14304 m!154849))

(assert (=> bm!14287 m!154707))

(declare-fun m!154851 () Bool)

(assert (=> b!131228 m!154851))

(assert (=> b!131201 m!154851))

(declare-fun m!154853 () Bool)

(assert (=> d!40113 m!154853))

(assert (=> d!40113 m!154739))

(declare-fun m!154855 () Bool)

(assert (=> bm!14298 m!154855))

(declare-fun m!154857 () Bool)

(assert (=> b!131234 m!154857))

(declare-fun m!154859 () Bool)

(assert (=> b!131232 m!154859))

(assert (=> bm!14284 m!154705))

(assert (=> bm!14284 m!154829))

(assert (=> bm!14306 m!154705))

(declare-fun m!154861 () Bool)

(assert (=> bm!14306 m!154861))

(declare-fun m!154863 () Bool)

(assert (=> b!131208 m!154863))

(assert (=> b!131208 m!154863))

(declare-fun m!154865 () Bool)

(assert (=> b!131208 m!154865))

(declare-fun m!154867 () Bool)

(assert (=> b!131208 m!154867))

(declare-fun m!154869 () Bool)

(assert (=> b!131208 m!154869))

(assert (=> b!131208 m!154705))

(assert (=> b!131208 m!154725))

(declare-fun m!154871 () Bool)

(assert (=> b!131208 m!154871))

(declare-fun m!154873 () Bool)

(assert (=> b!131196 m!154873))

(assert (=> bm!14302 m!154869))

(declare-fun m!154875 () Bool)

(assert (=> bm!14302 m!154875))

(assert (=> b!130975 d!40113))

(declare-fun d!40115 () Bool)

(declare-fun c!24255 () Bool)

(assert (=> d!40115 (= c!24255 ((_ is ValueCellFull!1088) (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun e!85592 () V!3465)

(assert (=> d!40115 (= (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85592)))

(declare-fun b!131240 () Bool)

(declare-fun get!1478 (ValueCell!1088 V!3465) V!3465)

(assert (=> b!131240 (= e!85592 (get!1478 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131241 () Bool)

(declare-fun get!1479 (ValueCell!1088 V!3465) V!3465)

(assert (=> b!131241 (= e!85592 (get!1479 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40115 c!24255) b!131240))

(assert (= (and d!40115 (not c!24255)) b!131241))

(assert (=> b!131240 m!154721))

(assert (=> b!131240 m!154723))

(declare-fun m!154877 () Bool)

(assert (=> b!131240 m!154877))

(assert (=> b!131241 m!154721))

(assert (=> b!131241 m!154723))

(declare-fun m!154879 () Bool)

(assert (=> b!131241 m!154879))

(assert (=> b!130975 d!40115))

(declare-fun d!40117 () Bool)

(declare-fun res!63220 () Bool)

(declare-fun e!85595 () Bool)

(assert (=> d!40117 (=> (not res!63220) (not e!85595))))

(declare-fun simpleValid!90 (LongMapFixedSize!1084) Bool)

(assert (=> d!40117 (= res!63220 (simpleValid!90 newMap!16))))

(assert (=> d!40117 (= (valid!536 newMap!16) e!85595)))

(declare-fun b!131248 () Bool)

(declare-fun res!63221 () Bool)

(assert (=> b!131248 (=> (not res!63221) (not e!85595))))

(declare-fun arrayCountValidKeys!0 (array!4735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!131248 (= res!63221 (= (arrayCountValidKeys!0 (_keys!4587 newMap!16) #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (_size!591 newMap!16)))))

(declare-fun b!131249 () Bool)

(declare-fun res!63222 () Bool)

(assert (=> b!131249 (=> (not res!63222) (not e!85595))))

(assert (=> b!131249 (= res!63222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun b!131250 () Bool)

(declare-datatypes ((List!1690 0))(
  ( (Nil!1687) (Cons!1686 (h!2291 (_ BitVec 64)) (t!6109 List!1690)) )
))
(declare-fun arrayNoDuplicates!0 (array!4735 (_ BitVec 32) List!1690) Bool)

(assert (=> b!131250 (= e!85595 (arrayNoDuplicates!0 (_keys!4587 newMap!16) #b00000000000000000000000000000000 Nil!1687))))

(assert (= (and d!40117 res!63220) b!131248))

(assert (= (and b!131248 res!63221) b!131249))

(assert (= (and b!131249 res!63222) b!131250))

(declare-fun m!154881 () Bool)

(assert (=> d!40117 m!154881))

(declare-fun m!154883 () Bool)

(assert (=> b!131248 m!154883))

(declare-fun m!154885 () Bool)

(assert (=> b!131249 m!154885))

(declare-fun m!154887 () Bool)

(assert (=> b!131250 m!154887))

(assert (=> b!130984 d!40117))

(declare-fun d!40119 () Bool)

(assert (=> d!40119 (= (valid!535 thiss!992) (valid!536 (v!3176 (underlying!449 thiss!992))))))

(declare-fun bs!5464 () Bool)

(assert (= bs!5464 d!40119))

(declare-fun m!154889 () Bool)

(assert (=> bs!5464 m!154889))

(assert (=> start!14100 d!40119))

(declare-fun d!40121 () Bool)

(assert (=> d!40121 (= (array_inv!1403 (_keys!4587 newMap!16)) (bvsge (size!2507 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130979 d!40121))

(declare-fun d!40123 () Bool)

(assert (=> d!40123 (= (array_inv!1404 (_values!2825 newMap!16)) (bvsge (size!2508 (_values!2825 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130979 d!40123))

(declare-fun d!40125 () Bool)

(assert (=> d!40125 (= (array_inv!1403 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvsge (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130982 d!40125))

(declare-fun d!40127 () Bool)

(assert (=> d!40127 (= (array_inv!1404 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvsge (size!2508 (_values!2825 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!130982 d!40127))

(declare-fun b!131259 () Bool)

(declare-fun e!85603 () Bool)

(declare-fun call!14313 () Bool)

(assert (=> b!131259 (= e!85603 call!14313)))

(declare-fun bm!14310 () Bool)

(assert (=> bm!14310 (= call!14313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131260 () Bool)

(declare-fun e!85602 () Bool)

(assert (=> b!131260 (= e!85603 e!85602)))

(declare-fun lt!68284 () (_ BitVec 64))

(assert (=> b!131260 (= lt!68284 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68285 () Unit!4103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4735 (_ BitVec 64) (_ BitVec 32)) Unit!4103)

(assert (=> b!131260 (= lt!68285 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000))))

(assert (=> b!131260 (arrayContainsKey!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000)))

(declare-fun lt!68286 () Unit!4103)

(assert (=> b!131260 (= lt!68286 lt!68285)))

(declare-fun res!63227 () Bool)

(assert (=> b!131260 (= res!63227 (= (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))) (Found!267 #b00000000000000000000000000000000)))))

(assert (=> b!131260 (=> (not res!63227) (not e!85602))))

(declare-fun b!131261 () Bool)

(declare-fun e!85604 () Bool)

(assert (=> b!131261 (= e!85604 e!85603)))

(declare-fun c!24258 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131261 (= c!24258 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!40129 () Bool)

(declare-fun res!63228 () Bool)

(assert (=> d!40129 (=> res!63228 e!85604)))

(assert (=> d!40129 (= res!63228 (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(assert (=> d!40129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))) e!85604)))

(declare-fun b!131262 () Bool)

(assert (=> b!131262 (= e!85602 call!14313)))

(assert (= (and d!40129 (not res!63228)) b!131261))

(assert (= (and b!131261 c!24258) b!131260))

(assert (= (and b!131261 (not c!24258)) b!131259))

(assert (= (and b!131260 res!63227) b!131262))

(assert (= (or b!131262 b!131259) bm!14310))

(declare-fun m!154891 () Bool)

(assert (=> bm!14310 m!154891))

(declare-fun m!154893 () Bool)

(assert (=> b!131260 m!154893))

(declare-fun m!154895 () Bool)

(assert (=> b!131260 m!154895))

(declare-fun m!154897 () Bool)

(assert (=> b!131260 m!154897))

(assert (=> b!131260 m!154893))

(declare-fun m!154899 () Bool)

(assert (=> b!131260 m!154899))

(assert (=> b!131261 m!154893))

(assert (=> b!131261 m!154893))

(declare-fun m!154901 () Bool)

(assert (=> b!131261 m!154901))

(assert (=> b!130978 d!40129))

(declare-fun d!40131 () Bool)

(assert (=> d!40131 (= (map!1392 newMap!16) (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun bs!5465 () Bool)

(assert (= bs!5465 d!40131))

(assert (=> bs!5465 m!154851))

(assert (=> b!130969 d!40131))

(declare-fun b!131305 () Bool)

(declare-fun res!63251 () Bool)

(declare-fun e!85635 () Bool)

(assert (=> b!131305 (=> (not res!63251) (not e!85635))))

(declare-fun e!85641 () Bool)

(assert (=> b!131305 (= res!63251 e!85641)))

(declare-fun res!63247 () Bool)

(assert (=> b!131305 (=> res!63247 e!85641)))

(declare-fun e!85639 () Bool)

(assert (=> b!131305 (= res!63247 (not e!85639))))

(declare-fun res!63253 () Bool)

(assert (=> b!131305 (=> (not res!63253) (not e!85639))))

(assert (=> b!131305 (= res!63253 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131306 () Bool)

(declare-fun e!85640 () Bool)

(assert (=> b!131306 (= e!85635 e!85640)))

(declare-fun c!24273 () Bool)

(assert (=> b!131306 (= c!24273 (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131307 () Bool)

(declare-fun res!63255 () Bool)

(assert (=> b!131307 (=> (not res!63255) (not e!85635))))

(declare-fun e!85642 () Bool)

(assert (=> b!131307 (= res!63255 e!85642)))

(declare-fun c!24272 () Bool)

(assert (=> b!131307 (= c!24272 (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131308 () Bool)

(declare-fun e!85636 () Bool)

(assert (=> b!131308 (= e!85640 e!85636)))

(declare-fun res!63254 () Bool)

(declare-fun call!14330 () Bool)

(assert (=> b!131308 (= res!63254 call!14330)))

(assert (=> b!131308 (=> (not res!63254) (not e!85636))))

(declare-fun b!131309 () Bool)

(declare-fun e!85632 () ListLongMap!1647)

(declare-fun call!14328 () ListLongMap!1647)

(assert (=> b!131309 (= e!85632 call!14328)))

(declare-fun b!131310 () Bool)

(declare-fun call!14333 () ListLongMap!1647)

(assert (=> b!131310 (= e!85632 call!14333)))

(declare-fun b!131311 () Bool)

(declare-fun e!85631 () Bool)

(declare-fun lt!68351 () ListLongMap!1647)

(declare-fun apply!114 (ListLongMap!1647 (_ BitVec 64)) V!3465)

(assert (=> b!131311 (= e!85631 (= (apply!114 lt!68351 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131312 () Bool)

(assert (=> b!131312 (= e!85642 e!85631)))

(declare-fun res!63248 () Bool)

(declare-fun call!14332 () Bool)

(assert (=> b!131312 (= res!63248 call!14332)))

(assert (=> b!131312 (=> (not res!63248) (not e!85631))))

(declare-fun c!24274 () Bool)

(declare-fun bm!14325 () Bool)

(declare-fun call!14331 () ListLongMap!1647)

(declare-fun c!24275 () Bool)

(declare-fun call!14334 () ListLongMap!1647)

(declare-fun call!14329 () ListLongMap!1647)

(assert (=> bm!14325 (= call!14329 (+!167 (ite c!24274 call!14331 (ite c!24275 call!14334 call!14333)) (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun b!131313 () Bool)

(declare-fun e!85634 () ListLongMap!1647)

(assert (=> b!131313 (= e!85634 call!14328)))

(declare-fun bm!14326 () Bool)

(assert (=> bm!14326 (= call!14332 (contains!877 lt!68351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131314 () Bool)

(declare-fun e!85643 () Unit!4103)

(declare-fun Unit!4108 () Unit!4103)

(assert (=> b!131314 (= e!85643 Unit!4108)))

(declare-fun b!131315 () Bool)

(declare-fun c!24271 () Bool)

(assert (=> b!131315 (= c!24271 (and (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131315 (= e!85634 e!85632)))

(declare-fun bm!14327 () Bool)

(assert (=> bm!14327 (= call!14334 call!14331)))

(declare-fun d!40133 () Bool)

(assert (=> d!40133 e!85635))

(declare-fun res!63252 () Bool)

(assert (=> d!40133 (=> (not res!63252) (not e!85635))))

(assert (=> d!40133 (= res!63252 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun lt!68342 () ListLongMap!1647)

(assert (=> d!40133 (= lt!68351 lt!68342)))

(declare-fun lt!68337 () Unit!4103)

(assert (=> d!40133 (= lt!68337 e!85643)))

(declare-fun c!24276 () Bool)

(declare-fun e!85633 () Bool)

(assert (=> d!40133 (= c!24276 e!85633)))

(declare-fun res!63249 () Bool)

(assert (=> d!40133 (=> (not res!63249) (not e!85633))))

(assert (=> d!40133 (= res!63249 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun e!85637 () ListLongMap!1647)

(assert (=> d!40133 (= lt!68342 e!85637)))

(assert (=> d!40133 (= c!24274 (and (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40133 (validMask!0 (mask!7130 (v!3176 (underlying!449 thiss!992))))))

(assert (=> d!40133 (= (getCurrentListMap!516 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))) lt!68351)))

(declare-fun b!131316 () Bool)

(assert (=> b!131316 (= e!85642 (not call!14332))))

(declare-fun b!131317 () Bool)

(declare-fun e!85638 () Bool)

(assert (=> b!131317 (= e!85638 (= (apply!114 lt!68351 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2508 (_values!2825 (v!3176 (underlying!449 thiss!992))))))))

(assert (=> b!131317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun bm!14328 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!134 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) ListLongMap!1647)

(assert (=> bm!14328 (= call!14331 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131318 () Bool)

(assert (=> b!131318 (= e!85639 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131319 () Bool)

(assert (=> b!131319 (= e!85641 e!85638)))

(declare-fun res!63250 () Bool)

(assert (=> b!131319 (=> (not res!63250) (not e!85638))))

(assert (=> b!131319 (= res!63250 (contains!877 lt!68351 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131319 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun bm!14329 () Bool)

(assert (=> bm!14329 (= call!14333 call!14334)))

(declare-fun bm!14330 () Bool)

(assert (=> bm!14330 (= call!14328 call!14329)))

(declare-fun b!131320 () Bool)

(assert (=> b!131320 (= e!85633 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131321 () Bool)

(assert (=> b!131321 (= e!85637 (+!167 call!14329 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131322 () Bool)

(assert (=> b!131322 (= e!85636 (= (apply!114 lt!68351 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131323 () Bool)

(assert (=> b!131323 (= e!85640 (not call!14330))))

(declare-fun b!131324 () Bool)

(assert (=> b!131324 (= e!85637 e!85634)))

(assert (=> b!131324 (= c!24275 (and (not (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131325 () Bool)

(declare-fun lt!68340 () Unit!4103)

(assert (=> b!131325 (= e!85643 lt!68340)))

(declare-fun lt!68331 () ListLongMap!1647)

(assert (=> b!131325 (= lt!68331 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun lt!68350 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68347 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68347 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68334 () Unit!4103)

(declare-fun addStillContains!90 (ListLongMap!1647 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4103)

(assert (=> b!131325 (= lt!68334 (addStillContains!90 lt!68331 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68347))))

(assert (=> b!131325 (contains!877 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68347)))

(declare-fun lt!68346 () Unit!4103)

(assert (=> b!131325 (= lt!68346 lt!68334)))

(declare-fun lt!68349 () ListLongMap!1647)

(assert (=> b!131325 (= lt!68349 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun lt!68338 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68338 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68348 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68348 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68345 () Unit!4103)

(declare-fun addApplyDifferent!90 (ListLongMap!1647 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4103)

(assert (=> b!131325 (= lt!68345 (addApplyDifferent!90 lt!68349 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68348))))

(assert (=> b!131325 (= (apply!114 (+!167 lt!68349 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68348) (apply!114 lt!68349 lt!68348))))

(declare-fun lt!68344 () Unit!4103)

(assert (=> b!131325 (= lt!68344 lt!68345)))

(declare-fun lt!68333 () ListLongMap!1647)

(assert (=> b!131325 (= lt!68333 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun lt!68341 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68339 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68339 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68343 () Unit!4103)

(assert (=> b!131325 (= lt!68343 (addApplyDifferent!90 lt!68333 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68339))))

(assert (=> b!131325 (= (apply!114 (+!167 lt!68333 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68339) (apply!114 lt!68333 lt!68339))))

(declare-fun lt!68332 () Unit!4103)

(assert (=> b!131325 (= lt!68332 lt!68343)))

(declare-fun lt!68335 () ListLongMap!1647)

(assert (=> b!131325 (= lt!68335 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun lt!68352 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68352 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68336 () (_ BitVec 64))

(assert (=> b!131325 (= lt!68336 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131325 (= lt!68340 (addApplyDifferent!90 lt!68335 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68336))))

(assert (=> b!131325 (= (apply!114 (+!167 lt!68335 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68336) (apply!114 lt!68335 lt!68336))))

(declare-fun bm!14331 () Bool)

(assert (=> bm!14331 (= call!14330 (contains!877 lt!68351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!40133 c!24274) b!131321))

(assert (= (and d!40133 (not c!24274)) b!131324))

(assert (= (and b!131324 c!24275) b!131313))

(assert (= (and b!131324 (not c!24275)) b!131315))

(assert (= (and b!131315 c!24271) b!131309))

(assert (= (and b!131315 (not c!24271)) b!131310))

(assert (= (or b!131309 b!131310) bm!14329))

(assert (= (or b!131313 bm!14329) bm!14327))

(assert (= (or b!131313 b!131309) bm!14330))

(assert (= (or b!131321 bm!14327) bm!14328))

(assert (= (or b!131321 bm!14330) bm!14325))

(assert (= (and d!40133 res!63249) b!131320))

(assert (= (and d!40133 c!24276) b!131325))

(assert (= (and d!40133 (not c!24276)) b!131314))

(assert (= (and d!40133 res!63252) b!131305))

(assert (= (and b!131305 res!63253) b!131318))

(assert (= (and b!131305 (not res!63247)) b!131319))

(assert (= (and b!131319 res!63250) b!131317))

(assert (= (and b!131305 res!63251) b!131307))

(assert (= (and b!131307 c!24272) b!131312))

(assert (= (and b!131307 (not c!24272)) b!131316))

(assert (= (and b!131312 res!63248) b!131311))

(assert (= (or b!131312 b!131316) bm!14326))

(assert (= (and b!131307 res!63255) b!131306))

(assert (= (and b!131306 c!24273) b!131308))

(assert (= (and b!131306 (not c!24273)) b!131323))

(assert (= (and b!131308 res!63254) b!131322))

(assert (= (or b!131308 b!131323) bm!14331))

(declare-fun b_lambda!5857 () Bool)

(assert (=> (not b_lambda!5857) (not b!131317)))

(assert (=> b!131317 t!6096))

(declare-fun b_and!8137 () Bool)

(assert (= b_and!8117 (and (=> t!6096 result!3925) b_and!8137)))

(assert (=> b!131317 t!6098))

(declare-fun b_and!8139 () Bool)

(assert (= b_and!8119 (and (=> t!6098 result!3929) b_and!8139)))

(declare-fun m!154903 () Bool)

(assert (=> b!131321 m!154903))

(declare-fun m!154905 () Bool)

(assert (=> b!131317 m!154905))

(assert (=> b!131317 m!154723))

(declare-fun m!154907 () Bool)

(assert (=> b!131317 m!154907))

(assert (=> b!131317 m!154723))

(declare-fun m!154909 () Bool)

(assert (=> b!131317 m!154909))

(assert (=> b!131317 m!154905))

(declare-fun m!154911 () Bool)

(assert (=> b!131317 m!154911))

(assert (=> b!131317 m!154907))

(declare-fun m!154913 () Bool)

(assert (=> bm!14325 m!154913))

(declare-fun m!154915 () Bool)

(assert (=> bm!14331 m!154915))

(assert (=> d!40133 m!154715))

(declare-fun m!154917 () Bool)

(assert (=> bm!14328 m!154917))

(declare-fun m!154919 () Bool)

(assert (=> b!131322 m!154919))

(declare-fun m!154921 () Bool)

(assert (=> bm!14326 m!154921))

(declare-fun m!154923 () Bool)

(assert (=> b!131311 m!154923))

(assert (=> b!131319 m!154905))

(assert (=> b!131319 m!154905))

(declare-fun m!154925 () Bool)

(assert (=> b!131319 m!154925))

(assert (=> b!131318 m!154905))

(assert (=> b!131318 m!154905))

(declare-fun m!154927 () Bool)

(assert (=> b!131318 m!154927))

(assert (=> b!131325 m!154905))

(declare-fun m!154929 () Bool)

(assert (=> b!131325 m!154929))

(assert (=> b!131325 m!154917))

(declare-fun m!154931 () Bool)

(assert (=> b!131325 m!154931))

(declare-fun m!154933 () Bool)

(assert (=> b!131325 m!154933))

(declare-fun m!154935 () Bool)

(assert (=> b!131325 m!154935))

(declare-fun m!154937 () Bool)

(assert (=> b!131325 m!154937))

(declare-fun m!154939 () Bool)

(assert (=> b!131325 m!154939))

(declare-fun m!154941 () Bool)

(assert (=> b!131325 m!154941))

(declare-fun m!154943 () Bool)

(assert (=> b!131325 m!154943))

(assert (=> b!131325 m!154933))

(declare-fun m!154945 () Bool)

(assert (=> b!131325 m!154945))

(declare-fun m!154947 () Bool)

(assert (=> b!131325 m!154947))

(declare-fun m!154949 () Bool)

(assert (=> b!131325 m!154949))

(declare-fun m!154951 () Bool)

(assert (=> b!131325 m!154951))

(declare-fun m!154953 () Bool)

(assert (=> b!131325 m!154953))

(assert (=> b!131325 m!154947))

(declare-fun m!154955 () Bool)

(assert (=> b!131325 m!154955))

(assert (=> b!131325 m!154941))

(declare-fun m!154957 () Bool)

(assert (=> b!131325 m!154957))

(assert (=> b!131325 m!154935))

(assert (=> b!131320 m!154905))

(assert (=> b!131320 m!154905))

(assert (=> b!131320 m!154927))

(assert (=> b!130969 d!40133))

(declare-fun d!40135 () Bool)

(assert (=> d!40135 (= (validMask!0 (mask!7130 (v!3176 (underlying!449 thiss!992)))) (and (or (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000001111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000011111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000001111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000011111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000001111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000011111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000001111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000011111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000000111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000001111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000011111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000000111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000001111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000011111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000000111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000001111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000011111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000000111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000001111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000011111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00000111111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00001111111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00011111111111111111111111111111) (= (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7130 (v!3176 (underlying!449 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!130981 d!40135))

(declare-fun mapNonEmpty!4605 () Bool)

(declare-fun mapRes!4605 () Bool)

(declare-fun tp!11139 () Bool)

(declare-fun e!85649 () Bool)

(assert (=> mapNonEmpty!4605 (= mapRes!4605 (and tp!11139 e!85649))))

(declare-fun mapKey!4605 () (_ BitVec 32))

(declare-fun mapRest!4605 () (Array (_ BitVec 32) ValueCell!1088))

(declare-fun mapValue!4605 () ValueCell!1088)

(assert (=> mapNonEmpty!4605 (= mapRest!4590 (store mapRest!4605 mapKey!4605 mapValue!4605))))

(declare-fun mapIsEmpty!4605 () Bool)

(assert (=> mapIsEmpty!4605 mapRes!4605))

(declare-fun b!131333 () Bool)

(declare-fun e!85648 () Bool)

(assert (=> b!131333 (= e!85648 tp_is_empty!2863)))

(declare-fun condMapEmpty!4605 () Bool)

(declare-fun mapDefault!4605 () ValueCell!1088)

(assert (=> mapNonEmpty!4590 (= condMapEmpty!4605 (= mapRest!4590 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4605)))))

(assert (=> mapNonEmpty!4590 (= tp!11111 (and e!85648 mapRes!4605))))

(declare-fun b!131332 () Bool)

(assert (=> b!131332 (= e!85649 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4590 condMapEmpty!4605) mapIsEmpty!4605))

(assert (= (and mapNonEmpty!4590 (not condMapEmpty!4605)) mapNonEmpty!4605))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1088) mapValue!4605)) b!131332))

(assert (= (and mapNonEmpty!4590 ((_ is ValueCellFull!1088) mapDefault!4605)) b!131333))

(declare-fun m!154959 () Bool)

(assert (=> mapNonEmpty!4605 m!154959))

(declare-fun mapNonEmpty!4606 () Bool)

(declare-fun mapRes!4606 () Bool)

(declare-fun tp!11140 () Bool)

(declare-fun e!85651 () Bool)

(assert (=> mapNonEmpty!4606 (= mapRes!4606 (and tp!11140 e!85651))))

(declare-fun mapValue!4606 () ValueCell!1088)

(declare-fun mapKey!4606 () (_ BitVec 32))

(declare-fun mapRest!4606 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4606 (= mapRest!4589 (store mapRest!4606 mapKey!4606 mapValue!4606))))

(declare-fun mapIsEmpty!4606 () Bool)

(assert (=> mapIsEmpty!4606 mapRes!4606))

(declare-fun b!131335 () Bool)

(declare-fun e!85650 () Bool)

(assert (=> b!131335 (= e!85650 tp_is_empty!2863)))

(declare-fun condMapEmpty!4606 () Bool)

(declare-fun mapDefault!4606 () ValueCell!1088)

(assert (=> mapNonEmpty!4589 (= condMapEmpty!4606 (= mapRest!4589 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4606)))))

(assert (=> mapNonEmpty!4589 (= tp!11109 (and e!85650 mapRes!4606))))

(declare-fun b!131334 () Bool)

(assert (=> b!131334 (= e!85651 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4589 condMapEmpty!4606) mapIsEmpty!4606))

(assert (= (and mapNonEmpty!4589 (not condMapEmpty!4606)) mapNonEmpty!4606))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1088) mapValue!4606)) b!131334))

(assert (= (and mapNonEmpty!4589 ((_ is ValueCellFull!1088) mapDefault!4606)) b!131335))

(declare-fun m!154961 () Bool)

(assert (=> mapNonEmpty!4606 m!154961))

(declare-fun b_lambda!5859 () Bool)

(assert (= b_lambda!5857 (or (and b!130982 b_free!2893) (and b!130979 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))))) b_lambda!5859)))

(check-sat (not b!131261) (not bm!14306) (not bm!14292) (not mapNonEmpty!4605) tp_is_empty!2863 (not b!131319) (not b!131260) (not b!131228) (not bm!14284) (not d!40117) (not bm!14300) (not d!40131) (not bm!14296) (not bm!14328) (not bm!14298) (not b!131322) (not bm!14297) (not bm!14288) (not b_next!2893) (not b!131250) (not mapNonEmpty!4606) (not bm!14287) (not b_lambda!5855) b_and!8139 (not d!40119) (not b!131235) (not b!131240) (not bm!14304) (not b!131317) (not b!131248) (not d!40111) b_and!8137 (not b_next!2895) (not bm!14325) (not b!131109) (not b!131208) (not d!40113) (not b_lambda!5859) (not d!40133) (not b!131241) (not b!131249) (not b!131325) (not b!131197) (not b!131320) (not b!131203) (not b!131321) (not bm!14331) (not b!131212) (not b!131311) (not bm!14326) (not bm!14302) (not b!131318) (not bm!14310) (not b!131107) (not b!131201) (not bm!14299) (not b!131233))
(check-sat b_and!8137 b_and!8139 (not b_next!2893) (not b_next!2895))
(get-model)

(declare-fun b!131344 () Bool)

(declare-fun e!85657 () (_ BitVec 32))

(declare-fun call!14337 () (_ BitVec 32))

(assert (=> b!131344 (= e!85657 call!14337)))

(declare-fun bm!14334 () Bool)

(assert (=> bm!14334 (= call!14337 (arrayCountValidKeys!0 (_keys!4587 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun d!40137 () Bool)

(declare-fun lt!68355 () (_ BitVec 32))

(assert (=> d!40137 (and (bvsge lt!68355 #b00000000000000000000000000000000) (bvsle lt!68355 (bvsub (size!2507 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85656 () (_ BitVec 32))

(assert (=> d!40137 (= lt!68355 e!85656)))

(declare-fun c!24281 () Bool)

(assert (=> d!40137 (= c!24281 (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(assert (=> d!40137 (and (bvsle #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2507 (_keys!4587 newMap!16)) (size!2507 (_keys!4587 newMap!16))))))

(assert (=> d!40137 (= (arrayCountValidKeys!0 (_keys!4587 newMap!16) #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) lt!68355)))

(declare-fun b!131345 () Bool)

(assert (=> b!131345 (= e!85657 (bvadd #b00000000000000000000000000000001 call!14337))))

(declare-fun b!131346 () Bool)

(assert (=> b!131346 (= e!85656 e!85657)))

(declare-fun c!24282 () Bool)

(assert (=> b!131346 (= c!24282 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131347 () Bool)

(assert (=> b!131347 (= e!85656 #b00000000000000000000000000000000)))

(assert (= (and d!40137 c!24281) b!131347))

(assert (= (and d!40137 (not c!24281)) b!131346))

(assert (= (and b!131346 c!24282) b!131345))

(assert (= (and b!131346 (not c!24282)) b!131344))

(assert (= (or b!131345 b!131344) bm!14334))

(declare-fun m!154963 () Bool)

(assert (=> bm!14334 m!154963))

(declare-fun m!154965 () Bool)

(assert (=> b!131346 m!154965))

(assert (=> b!131346 m!154965))

(declare-fun m!154967 () Bool)

(assert (=> b!131346 m!154967))

(assert (=> b!131248 d!40137))

(declare-fun d!40139 () Bool)

(assert (=> d!40139 (= (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131320 d!40139))

(declare-fun d!40141 () Bool)

(declare-fun e!85659 () Bool)

(assert (=> d!40141 e!85659))

(declare-fun res!63256 () Bool)

(assert (=> d!40141 (=> res!63256 e!85659)))

(declare-fun lt!68357 () Bool)

(assert (=> d!40141 (= res!63256 (not lt!68357))))

(declare-fun lt!68356 () Bool)

(assert (=> d!40141 (= lt!68357 lt!68356)))

(declare-fun lt!68359 () Unit!4103)

(declare-fun e!85658 () Unit!4103)

(assert (=> d!40141 (= lt!68359 e!85658)))

(declare-fun c!24283 () Bool)

(assert (=> d!40141 (= c!24283 lt!68356)))

(assert (=> d!40141 (= lt!68356 (containsKey!174 (toList!839 e!85577) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> d!40141 (= (contains!877 e!85577 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) lt!68357)))

(declare-fun b!131348 () Bool)

(declare-fun lt!68358 () Unit!4103)

(assert (=> b!131348 (= e!85658 lt!68358)))

(assert (=> b!131348 (= lt!68358 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 e!85577) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> b!131348 (isDefined!123 (getValueByKey!171 (toList!839 e!85577) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131349 () Bool)

(declare-fun Unit!4109 () Unit!4103)

(assert (=> b!131349 (= e!85658 Unit!4109)))

(declare-fun b!131350 () Bool)

(assert (=> b!131350 (= e!85659 (isDefined!123 (getValueByKey!171 (toList!839 e!85577) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(assert (= (and d!40141 c!24283) b!131348))

(assert (= (and d!40141 (not c!24283)) b!131349))

(assert (= (and d!40141 (not res!63256)) b!131350))

(assert (=> d!40141 m!154705))

(declare-fun m!154969 () Bool)

(assert (=> d!40141 m!154969))

(assert (=> b!131348 m!154705))

(declare-fun m!154971 () Bool)

(assert (=> b!131348 m!154971))

(assert (=> b!131348 m!154705))

(declare-fun m!154973 () Bool)

(assert (=> b!131348 m!154973))

(assert (=> b!131348 m!154973))

(declare-fun m!154975 () Bool)

(assert (=> b!131348 m!154975))

(assert (=> b!131350 m!154705))

(assert (=> b!131350 m!154973))

(assert (=> b!131350 m!154973))

(assert (=> b!131350 m!154975))

(assert (=> bm!14288 d!40141))

(declare-fun b!131351 () Bool)

(declare-fun res!63261 () Bool)

(declare-fun e!85664 () Bool)

(assert (=> b!131351 (=> (not res!63261) (not e!85664))))

(declare-fun e!85670 () Bool)

(assert (=> b!131351 (= res!63261 e!85670)))

(declare-fun res!63257 () Bool)

(assert (=> b!131351 (=> res!63257 e!85670)))

(declare-fun e!85668 () Bool)

(assert (=> b!131351 (= res!63257 (not e!85668))))

(declare-fun res!63263 () Bool)

(assert (=> b!131351 (=> (not res!63263) (not e!85668))))

(assert (=> b!131351 (= res!63263 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun b!131352 () Bool)

(declare-fun e!85669 () Bool)

(assert (=> b!131352 (= e!85664 e!85669)))

(declare-fun c!24286 () Bool)

(assert (=> b!131352 (= c!24286 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131353 () Bool)

(declare-fun res!63265 () Bool)

(assert (=> b!131353 (=> (not res!63265) (not e!85664))))

(declare-fun e!85671 () Bool)

(assert (=> b!131353 (= res!63265 e!85671)))

(declare-fun c!24285 () Bool)

(assert (=> b!131353 (= c!24285 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131354 () Bool)

(declare-fun e!85665 () Bool)

(assert (=> b!131354 (= e!85669 e!85665)))

(declare-fun res!63264 () Bool)

(declare-fun call!14340 () Bool)

(assert (=> b!131354 (= res!63264 call!14340)))

(assert (=> b!131354 (=> (not res!63264) (not e!85665))))

(declare-fun b!131355 () Bool)

(declare-fun e!85661 () ListLongMap!1647)

(declare-fun call!14338 () ListLongMap!1647)

(assert (=> b!131355 (= e!85661 call!14338)))

(declare-fun b!131356 () Bool)

(declare-fun call!14343 () ListLongMap!1647)

(assert (=> b!131356 (= e!85661 call!14343)))

(declare-fun b!131357 () Bool)

(declare-fun e!85660 () Bool)

(declare-fun lt!68380 () ListLongMap!1647)

(assert (=> b!131357 (= e!85660 (= (apply!114 lt!68380 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 newMap!16)))))

(declare-fun b!131358 () Bool)

(assert (=> b!131358 (= e!85671 e!85660)))

(declare-fun res!63258 () Bool)

(declare-fun call!14342 () Bool)

(assert (=> b!131358 (= res!63258 call!14342)))

(assert (=> b!131358 (=> (not res!63258) (not e!85660))))

(declare-fun call!14344 () ListLongMap!1647)

(declare-fun call!14341 () ListLongMap!1647)

(declare-fun call!14339 () ListLongMap!1647)

(declare-fun bm!14335 () Bool)

(declare-fun c!24287 () Bool)

(declare-fun c!24288 () Bool)

(assert (=> bm!14335 (= call!14339 (+!167 (ite c!24287 call!14341 (ite c!24288 call!14344 call!14343)) (ite (or c!24287 c!24288) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 newMap!16)) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16)))))))

(declare-fun b!131359 () Bool)

(declare-fun e!85663 () ListLongMap!1647)

(assert (=> b!131359 (= e!85663 call!14338)))

(declare-fun bm!14336 () Bool)

(assert (=> bm!14336 (= call!14342 (contains!877 lt!68380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131360 () Bool)

(declare-fun e!85672 () Unit!4103)

(declare-fun Unit!4110 () Unit!4103)

(assert (=> b!131360 (= e!85672 Unit!4110)))

(declare-fun b!131361 () Bool)

(declare-fun c!24284 () Bool)

(assert (=> b!131361 (= c!24284 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131361 (= e!85663 e!85661)))

(declare-fun bm!14337 () Bool)

(assert (=> bm!14337 (= call!14344 call!14341)))

(declare-fun d!40143 () Bool)

(assert (=> d!40143 e!85664))

(declare-fun res!63262 () Bool)

(assert (=> d!40143 (=> (not res!63262) (not e!85664))))

(assert (=> d!40143 (= res!63262 (or (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))))

(declare-fun lt!68371 () ListLongMap!1647)

(assert (=> d!40143 (= lt!68380 lt!68371)))

(declare-fun lt!68366 () Unit!4103)

(assert (=> d!40143 (= lt!68366 e!85672)))

(declare-fun c!24289 () Bool)

(declare-fun e!85662 () Bool)

(assert (=> d!40143 (= c!24289 e!85662)))

(declare-fun res!63259 () Bool)

(assert (=> d!40143 (=> (not res!63259) (not e!85662))))

(assert (=> d!40143 (= res!63259 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun e!85666 () ListLongMap!1647)

(assert (=> d!40143 (= lt!68371 e!85666)))

(assert (=> d!40143 (= c!24287 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40143 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40143 (= (getCurrentListMap!516 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68380)))

(declare-fun b!131362 () Bool)

(assert (=> b!131362 (= e!85671 (not call!14342))))

(declare-fun e!85667 () Bool)

(declare-fun b!131363 () Bool)

(assert (=> b!131363 (= e!85667 (= (apply!114 lt!68380 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)) (get!1476 (select (arr!2241 (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2508 (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))))))))

(assert (=> b!131363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14338 () Bool)

(assert (=> bm!14338 (= call!14341 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131364 () Bool)

(assert (=> b!131364 (= e!85668 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131365 () Bool)

(assert (=> b!131365 (= e!85670 e!85667)))

(declare-fun res!63260 () Bool)

(assert (=> b!131365 (=> (not res!63260) (not e!85667))))

(assert (=> b!131365 (= res!63260 (contains!877 lt!68380 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131365 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14339 () Bool)

(assert (=> bm!14339 (= call!14343 call!14344)))

(declare-fun bm!14340 () Bool)

(assert (=> bm!14340 (= call!14338 call!14339)))

(declare-fun b!131366 () Bool)

(assert (=> b!131366 (= e!85662 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131367 () Bool)

(assert (=> b!131367 (= e!85666 (+!167 call!14339 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16))))))

(declare-fun b!131368 () Bool)

(assert (=> b!131368 (= e!85665 (= (apply!114 lt!68380 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 newMap!16)))))

(declare-fun b!131369 () Bool)

(assert (=> b!131369 (= e!85669 (not call!14340))))

(declare-fun b!131370 () Bool)

(assert (=> b!131370 (= e!85666 e!85663)))

(assert (=> b!131370 (= c!24288 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131371 () Bool)

(declare-fun lt!68369 () Unit!4103)

(assert (=> b!131371 (= e!85672 lt!68369)))

(declare-fun lt!68360 () ListLongMap!1647)

(assert (=> b!131371 (= lt!68360 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68379 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68376 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68376 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68363 () Unit!4103)

(assert (=> b!131371 (= lt!68363 (addStillContains!90 lt!68360 lt!68379 (zeroValue!2699 newMap!16) lt!68376))))

(assert (=> b!131371 (contains!877 (+!167 lt!68360 (tuple2!2553 lt!68379 (zeroValue!2699 newMap!16))) lt!68376)))

(declare-fun lt!68375 () Unit!4103)

(assert (=> b!131371 (= lt!68375 lt!68363)))

(declare-fun lt!68378 () ListLongMap!1647)

(assert (=> b!131371 (= lt!68378 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68367 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68367 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68377 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68377 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68374 () Unit!4103)

(assert (=> b!131371 (= lt!68374 (addApplyDifferent!90 lt!68378 lt!68367 (minValue!2699 newMap!16) lt!68377))))

(assert (=> b!131371 (= (apply!114 (+!167 lt!68378 (tuple2!2553 lt!68367 (minValue!2699 newMap!16))) lt!68377) (apply!114 lt!68378 lt!68377))))

(declare-fun lt!68373 () Unit!4103)

(assert (=> b!131371 (= lt!68373 lt!68374)))

(declare-fun lt!68362 () ListLongMap!1647)

(assert (=> b!131371 (= lt!68362 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68370 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68368 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68368 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68372 () Unit!4103)

(assert (=> b!131371 (= lt!68372 (addApplyDifferent!90 lt!68362 lt!68370 (zeroValue!2699 newMap!16) lt!68368))))

(assert (=> b!131371 (= (apply!114 (+!167 lt!68362 (tuple2!2553 lt!68370 (zeroValue!2699 newMap!16))) lt!68368) (apply!114 lt!68362 lt!68368))))

(declare-fun lt!68361 () Unit!4103)

(assert (=> b!131371 (= lt!68361 lt!68372)))

(declare-fun lt!68364 () ListLongMap!1647)

(assert (=> b!131371 (= lt!68364 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite c!24249 (_values!2825 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16)))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68381 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68365 () (_ BitVec 64))

(assert (=> b!131371 (= lt!68365 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131371 (= lt!68369 (addApplyDifferent!90 lt!68364 lt!68381 (minValue!2699 newMap!16) lt!68365))))

(assert (=> b!131371 (= (apply!114 (+!167 lt!68364 (tuple2!2553 lt!68381 (minValue!2699 newMap!16))) lt!68365) (apply!114 lt!68364 lt!68365))))

(declare-fun bm!14341 () Bool)

(assert (=> bm!14341 (= call!14340 (contains!877 lt!68380 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!40143 c!24287) b!131367))

(assert (= (and d!40143 (not c!24287)) b!131370))

(assert (= (and b!131370 c!24288) b!131359))

(assert (= (and b!131370 (not c!24288)) b!131361))

(assert (= (and b!131361 c!24284) b!131355))

(assert (= (and b!131361 (not c!24284)) b!131356))

(assert (= (or b!131355 b!131356) bm!14339))

(assert (= (or b!131359 bm!14339) bm!14337))

(assert (= (or b!131359 b!131355) bm!14340))

(assert (= (or b!131367 bm!14337) bm!14338))

(assert (= (or b!131367 bm!14340) bm!14335))

(assert (= (and d!40143 res!63259) b!131366))

(assert (= (and d!40143 c!24289) b!131371))

(assert (= (and d!40143 (not c!24289)) b!131360))

(assert (= (and d!40143 res!63262) b!131351))

(assert (= (and b!131351 res!63263) b!131364))

(assert (= (and b!131351 (not res!63257)) b!131365))

(assert (= (and b!131365 res!63260) b!131363))

(assert (= (and b!131351 res!63261) b!131353))

(assert (= (and b!131353 c!24285) b!131358))

(assert (= (and b!131353 (not c!24285)) b!131362))

(assert (= (and b!131358 res!63258) b!131357))

(assert (= (or b!131358 b!131362) bm!14336))

(assert (= (and b!131353 res!63265) b!131352))

(assert (= (and b!131352 c!24286) b!131354))

(assert (= (and b!131352 (not c!24286)) b!131369))

(assert (= (and b!131354 res!63264) b!131368))

(assert (= (or b!131354 b!131369) bm!14341))

(declare-fun b_lambda!5861 () Bool)

(assert (=> (not b_lambda!5861) (not b!131363)))

(declare-fun tb!2385 () Bool)

(declare-fun t!6111 () Bool)

(assert (=> (and b!130982 (= (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) (defaultEntry!2842 newMap!16)) t!6111) tb!2385))

(declare-fun result!3945 () Bool)

(assert (=> tb!2385 (= result!3945 tp_is_empty!2863)))

(assert (=> b!131363 t!6111))

(declare-fun b_and!8141 () Bool)

(assert (= b_and!8137 (and (=> t!6111 result!3945) b_and!8141)))

(declare-fun t!6113 () Bool)

(declare-fun tb!2387 () Bool)

(assert (=> (and b!130979 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 newMap!16)) t!6113) tb!2387))

(declare-fun result!3947 () Bool)

(assert (= result!3947 result!3945))

(assert (=> b!131363 t!6113))

(declare-fun b_and!8143 () Bool)

(assert (= b_and!8139 (and (=> t!6113 result!3947) b_and!8143)))

(declare-fun m!154977 () Bool)

(assert (=> b!131367 m!154977))

(assert (=> b!131363 m!154965))

(declare-fun m!154979 () Bool)

(assert (=> b!131363 m!154979))

(declare-fun m!154981 () Bool)

(assert (=> b!131363 m!154981))

(assert (=> b!131363 m!154979))

(declare-fun m!154983 () Bool)

(assert (=> b!131363 m!154983))

(assert (=> b!131363 m!154965))

(declare-fun m!154985 () Bool)

(assert (=> b!131363 m!154985))

(assert (=> b!131363 m!154981))

(declare-fun m!154987 () Bool)

(assert (=> bm!14335 m!154987))

(declare-fun m!154989 () Bool)

(assert (=> bm!14341 m!154989))

(declare-fun m!154991 () Bool)

(assert (=> d!40143 m!154991))

(declare-fun m!154993 () Bool)

(assert (=> bm!14338 m!154993))

(declare-fun m!154995 () Bool)

(assert (=> b!131368 m!154995))

(declare-fun m!154997 () Bool)

(assert (=> bm!14336 m!154997))

(declare-fun m!154999 () Bool)

(assert (=> b!131357 m!154999))

(assert (=> b!131365 m!154965))

(assert (=> b!131365 m!154965))

(declare-fun m!155001 () Bool)

(assert (=> b!131365 m!155001))

(assert (=> b!131364 m!154965))

(assert (=> b!131364 m!154965))

(assert (=> b!131364 m!154967))

(assert (=> b!131371 m!154965))

(declare-fun m!155003 () Bool)

(assert (=> b!131371 m!155003))

(assert (=> b!131371 m!154993))

(declare-fun m!155005 () Bool)

(assert (=> b!131371 m!155005))

(declare-fun m!155007 () Bool)

(assert (=> b!131371 m!155007))

(declare-fun m!155009 () Bool)

(assert (=> b!131371 m!155009))

(declare-fun m!155011 () Bool)

(assert (=> b!131371 m!155011))

(declare-fun m!155013 () Bool)

(assert (=> b!131371 m!155013))

(declare-fun m!155015 () Bool)

(assert (=> b!131371 m!155015))

(declare-fun m!155017 () Bool)

(assert (=> b!131371 m!155017))

(assert (=> b!131371 m!155007))

(declare-fun m!155019 () Bool)

(assert (=> b!131371 m!155019))

(declare-fun m!155021 () Bool)

(assert (=> b!131371 m!155021))

(declare-fun m!155023 () Bool)

(assert (=> b!131371 m!155023))

(declare-fun m!155025 () Bool)

(assert (=> b!131371 m!155025))

(declare-fun m!155027 () Bool)

(assert (=> b!131371 m!155027))

(assert (=> b!131371 m!155021))

(declare-fun m!155029 () Bool)

(assert (=> b!131371 m!155029))

(assert (=> b!131371 m!155015))

(declare-fun m!155031 () Bool)

(assert (=> b!131371 m!155031))

(assert (=> b!131371 m!155009))

(assert (=> b!131366 m!154965))

(assert (=> b!131366 m!154965))

(assert (=> b!131366 m!154967))

(assert (=> bm!14302 d!40143))

(declare-fun d!40145 () Bool)

(assert (=> d!40145 (arrayContainsKey!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000)))

(declare-fun lt!68384 () Unit!4103)

(declare-fun choose!13 (array!4735 (_ BitVec 64) (_ BitVec 32)) Unit!4103)

(assert (=> d!40145 (= lt!68384 (choose!13 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000))))

(assert (=> d!40145 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!40145 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000) lt!68384)))

(declare-fun bs!5466 () Bool)

(assert (= bs!5466 d!40145))

(assert (=> bs!5466 m!154897))

(declare-fun m!155033 () Bool)

(assert (=> bs!5466 m!155033))

(assert (=> b!131260 d!40145))

(declare-fun d!40147 () Bool)

(declare-fun res!63270 () Bool)

(declare-fun e!85677 () Bool)

(assert (=> d!40147 (=> res!63270 e!85677)))

(assert (=> d!40147 (= res!63270 (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) lt!68284))))

(assert (=> d!40147 (= (arrayContainsKey!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 #b00000000000000000000000000000000) e!85677)))

(declare-fun b!131376 () Bool)

(declare-fun e!85678 () Bool)

(assert (=> b!131376 (= e!85677 e!85678)))

(declare-fun res!63271 () Bool)

(assert (=> b!131376 (=> (not res!63271) (not e!85678))))

(assert (=> b!131376 (= res!63271 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131377 () Bool)

(assert (=> b!131377 (= e!85678 (arrayContainsKey!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68284 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40147 (not res!63270)) b!131376))

(assert (= (and b!131376 res!63271) b!131377))

(assert (=> d!40147 m!154893))

(declare-fun m!155035 () Bool)

(assert (=> b!131377 m!155035))

(assert (=> b!131260 d!40147))

(declare-fun b!131390 () Bool)

(declare-fun c!24296 () Bool)

(declare-fun lt!68391 () (_ BitVec 64))

(assert (=> b!131390 (= c!24296 (= lt!68391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85687 () SeekEntryResult!267)

(declare-fun e!85686 () SeekEntryResult!267)

(assert (=> b!131390 (= e!85687 e!85686)))

(declare-fun b!131391 () Bool)

(declare-fun lt!68393 () SeekEntryResult!267)

(assert (=> b!131391 (= e!85687 (Found!267 (index!3228 lt!68393)))))

(declare-fun b!131392 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4735 (_ BitVec 32)) SeekEntryResult!267)

(assert (=> b!131392 (= e!85686 (seekKeyOrZeroReturnVacant!0 (x!15406 lt!68393) (index!3228 lt!68393) (index!3228 lt!68393) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun d!40149 () Bool)

(declare-fun lt!68392 () SeekEntryResult!267)

(assert (=> d!40149 (and (or ((_ is Undefined!267) lt!68392) (not ((_ is Found!267) lt!68392)) (and (bvsge (index!3227 lt!68392) #b00000000000000000000000000000000) (bvslt (index!3227 lt!68392) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))) (or ((_ is Undefined!267) lt!68392) ((_ is Found!267) lt!68392) (not ((_ is MissingZero!267) lt!68392)) (and (bvsge (index!3226 lt!68392) #b00000000000000000000000000000000) (bvslt (index!3226 lt!68392) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))) (or ((_ is Undefined!267) lt!68392) ((_ is Found!267) lt!68392) ((_ is MissingZero!267) lt!68392) (not ((_ is MissingVacant!267) lt!68392)) (and (bvsge (index!3229 lt!68392) #b00000000000000000000000000000000) (bvslt (index!3229 lt!68392) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))) (or ((_ is Undefined!267) lt!68392) (ite ((_ is Found!267) lt!68392) (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (index!3227 lt!68392)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!267) lt!68392) (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (index!3226 lt!68392)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!267) lt!68392) (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (index!3229 lt!68392)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!85685 () SeekEntryResult!267)

(assert (=> d!40149 (= lt!68392 e!85685)))

(declare-fun c!24297 () Bool)

(assert (=> d!40149 (= c!24297 (and ((_ is Intermediate!267) lt!68393) (undefined!1079 lt!68393)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4735 (_ BitVec 32)) SeekEntryResult!267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!40149 (= lt!68393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) (mask!7130 (v!3176 (underlying!449 thiss!992)))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(assert (=> d!40149 (validMask!0 (mask!7130 (v!3176 (underlying!449 thiss!992))))))

(assert (=> d!40149 (= (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))) lt!68392)))

(declare-fun b!131393 () Bool)

(assert (=> b!131393 (= e!85685 e!85687)))

(assert (=> b!131393 (= lt!68391 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (index!3228 lt!68393)))))

(declare-fun c!24298 () Bool)

(assert (=> b!131393 (= c!24298 (= lt!68391 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131394 () Bool)

(assert (=> b!131394 (= e!85686 (MissingZero!267 (index!3228 lt!68393)))))

(declare-fun b!131395 () Bool)

(assert (=> b!131395 (= e!85685 Undefined!267)))

(assert (= (and d!40149 c!24297) b!131395))

(assert (= (and d!40149 (not c!24297)) b!131393))

(assert (= (and b!131393 c!24298) b!131391))

(assert (= (and b!131393 (not c!24298)) b!131390))

(assert (= (and b!131390 c!24296) b!131394))

(assert (= (and b!131390 (not c!24296)) b!131392))

(assert (=> b!131392 m!154893))

(declare-fun m!155037 () Bool)

(assert (=> b!131392 m!155037))

(assert (=> d!40149 m!154893))

(declare-fun m!155039 () Bool)

(assert (=> d!40149 m!155039))

(assert (=> d!40149 m!154715))

(declare-fun m!155041 () Bool)

(assert (=> d!40149 m!155041))

(assert (=> d!40149 m!155039))

(assert (=> d!40149 m!154893))

(declare-fun m!155043 () Bool)

(assert (=> d!40149 m!155043))

(declare-fun m!155045 () Bool)

(assert (=> d!40149 m!155045))

(declare-fun m!155047 () Bool)

(assert (=> d!40149 m!155047))

(declare-fun m!155049 () Bool)

(assert (=> b!131393 m!155049))

(assert (=> b!131260 d!40149))

(assert (=> b!131318 d!40139))

(declare-fun d!40151 () Bool)

(declare-fun get!1480 (Option!177) V!3465)

(assert (=> d!40151 (= (apply!114 lt!68351 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1480 (getValueByKey!171 (toList!839 lt!68351) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5467 () Bool)

(assert (= bs!5467 d!40151))

(assert (=> bs!5467 m!154905))

(declare-fun m!155051 () Bool)

(assert (=> bs!5467 m!155051))

(assert (=> bs!5467 m!155051))

(declare-fun m!155053 () Bool)

(assert (=> bs!5467 m!155053))

(assert (=> b!131317 d!40151))

(declare-fun d!40153 () Bool)

(declare-fun c!24299 () Bool)

(assert (=> d!40153 (= c!24299 ((_ is ValueCellFull!1088) (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!85688 () V!3465)

(assert (=> d!40153 (= (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85688)))

(declare-fun b!131396 () Bool)

(assert (=> b!131396 (= e!85688 (get!1478 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131397 () Bool)

(assert (=> b!131397 (= e!85688 (get!1479 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40153 c!24299) b!131396))

(assert (= (and d!40153 (not c!24299)) b!131397))

(assert (=> b!131396 m!154907))

(assert (=> b!131396 m!154723))

(declare-fun m!155055 () Bool)

(assert (=> b!131396 m!155055))

(assert (=> b!131397 m!154907))

(assert (=> b!131397 m!154723))

(declare-fun m!155057 () Bool)

(assert (=> b!131397 m!155057))

(assert (=> b!131317 d!40153))

(declare-fun d!40155 () Bool)

(declare-fun e!85690 () Bool)

(assert (=> d!40155 e!85690))

(declare-fun res!63272 () Bool)

(assert (=> d!40155 (=> res!63272 e!85690)))

(declare-fun lt!68395 () Bool)

(assert (=> d!40155 (= res!63272 (not lt!68395))))

(declare-fun lt!68394 () Bool)

(assert (=> d!40155 (= lt!68395 lt!68394)))

(declare-fun lt!68397 () Unit!4103)

(declare-fun e!85689 () Unit!4103)

(assert (=> d!40155 (= lt!68397 e!85689)))

(declare-fun c!24300 () Bool)

(assert (=> d!40155 (= c!24300 lt!68394)))

(assert (=> d!40155 (= lt!68394 (containsKey!174 (toList!839 call!14306) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> d!40155 (= (contains!877 call!14306 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) lt!68395)))

(declare-fun b!131398 () Bool)

(declare-fun lt!68396 () Unit!4103)

(assert (=> b!131398 (= e!85689 lt!68396)))

(assert (=> b!131398 (= lt!68396 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 call!14306) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> b!131398 (isDefined!123 (getValueByKey!171 (toList!839 call!14306) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131399 () Bool)

(declare-fun Unit!4111 () Unit!4103)

(assert (=> b!131399 (= e!85689 Unit!4111)))

(declare-fun b!131400 () Bool)

(assert (=> b!131400 (= e!85690 (isDefined!123 (getValueByKey!171 (toList!839 call!14306) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(assert (= (and d!40155 c!24300) b!131398))

(assert (= (and d!40155 (not c!24300)) b!131399))

(assert (= (and d!40155 (not res!63272)) b!131400))

(assert (=> d!40155 m!154705))

(declare-fun m!155059 () Bool)

(assert (=> d!40155 m!155059))

(assert (=> b!131398 m!154705))

(declare-fun m!155061 () Bool)

(assert (=> b!131398 m!155061))

(assert (=> b!131398 m!154705))

(declare-fun m!155063 () Bool)

(assert (=> b!131398 m!155063))

(assert (=> b!131398 m!155063))

(declare-fun m!155065 () Bool)

(assert (=> b!131398 m!155065))

(assert (=> b!131400 m!154705))

(assert (=> b!131400 m!155063))

(assert (=> b!131400 m!155063))

(assert (=> b!131400 m!155065))

(assert (=> b!131203 d!40155))

(declare-fun d!40157 () Bool)

(assert (=> d!40157 (= (get!1478 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3175 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> b!131240 d!40157))

(declare-fun b!131401 () Bool)

(declare-fun res!63277 () Bool)

(declare-fun e!85695 () Bool)

(assert (=> b!131401 (=> (not res!63277) (not e!85695))))

(declare-fun e!85701 () Bool)

(assert (=> b!131401 (= res!63277 e!85701)))

(declare-fun res!63273 () Bool)

(assert (=> b!131401 (=> res!63273 e!85701)))

(declare-fun e!85699 () Bool)

(assert (=> b!131401 (= res!63273 (not e!85699))))

(declare-fun res!63279 () Bool)

(assert (=> b!131401 (=> (not res!63279) (not e!85699))))

(assert (=> b!131401 (= res!63279 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun b!131402 () Bool)

(declare-fun e!85700 () Bool)

(assert (=> b!131402 (= e!85695 e!85700)))

(declare-fun c!24303 () Bool)

(assert (=> b!131402 (= c!24303 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131403 () Bool)

(declare-fun res!63281 () Bool)

(assert (=> b!131403 (=> (not res!63281) (not e!85695))))

(declare-fun e!85702 () Bool)

(assert (=> b!131403 (= res!63281 e!85702)))

(declare-fun c!24302 () Bool)

(assert (=> b!131403 (= c!24302 (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131404 () Bool)

(declare-fun e!85696 () Bool)

(assert (=> b!131404 (= e!85700 e!85696)))

(declare-fun res!63280 () Bool)

(declare-fun call!14347 () Bool)

(assert (=> b!131404 (= res!63280 call!14347)))

(assert (=> b!131404 (=> (not res!63280) (not e!85696))))

(declare-fun b!131405 () Bool)

(declare-fun e!85692 () ListLongMap!1647)

(declare-fun call!14345 () ListLongMap!1647)

(assert (=> b!131405 (= e!85692 call!14345)))

(declare-fun b!131406 () Bool)

(declare-fun call!14350 () ListLongMap!1647)

(assert (=> b!131406 (= e!85692 call!14350)))

(declare-fun b!131407 () Bool)

(declare-fun e!85691 () Bool)

(declare-fun lt!68418 () ListLongMap!1647)

(assert (=> b!131407 (= e!85691 (= (apply!114 lt!68418 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2699 newMap!16)))))

(declare-fun b!131408 () Bool)

(assert (=> b!131408 (= e!85702 e!85691)))

(declare-fun res!63274 () Bool)

(declare-fun call!14349 () Bool)

(assert (=> b!131408 (= res!63274 call!14349)))

(assert (=> b!131408 (=> (not res!63274) (not e!85691))))

(declare-fun call!14351 () ListLongMap!1647)

(declare-fun call!14346 () ListLongMap!1647)

(declare-fun bm!14342 () Bool)

(declare-fun c!24305 () Bool)

(declare-fun call!14348 () ListLongMap!1647)

(declare-fun c!24304 () Bool)

(assert (=> bm!14342 (= call!14346 (+!167 (ite c!24304 call!14348 (ite c!24305 call!14351 call!14350)) (ite (or c!24304 c!24305) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 newMap!16)) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16)))))))

(declare-fun b!131409 () Bool)

(declare-fun e!85694 () ListLongMap!1647)

(assert (=> b!131409 (= e!85694 call!14345)))

(declare-fun bm!14343 () Bool)

(assert (=> bm!14343 (= call!14349 (contains!877 lt!68418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131410 () Bool)

(declare-fun e!85703 () Unit!4103)

(declare-fun Unit!4112 () Unit!4103)

(assert (=> b!131410 (= e!85703 Unit!4112)))

(declare-fun b!131411 () Bool)

(declare-fun c!24301 () Bool)

(assert (=> b!131411 (= c!24301 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131411 (= e!85694 e!85692)))

(declare-fun bm!14344 () Bool)

(assert (=> bm!14344 (= call!14351 call!14348)))

(declare-fun d!40159 () Bool)

(assert (=> d!40159 e!85695))

(declare-fun res!63278 () Bool)

(assert (=> d!40159 (=> (not res!63278) (not e!85695))))

(assert (=> d!40159 (= res!63278 (or (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))))

(declare-fun lt!68409 () ListLongMap!1647)

(assert (=> d!40159 (= lt!68418 lt!68409)))

(declare-fun lt!68404 () Unit!4103)

(assert (=> d!40159 (= lt!68404 e!85703)))

(declare-fun c!24306 () Bool)

(declare-fun e!85693 () Bool)

(assert (=> d!40159 (= c!24306 e!85693)))

(declare-fun res!63275 () Bool)

(assert (=> d!40159 (=> (not res!63275) (not e!85693))))

(assert (=> d!40159 (= res!63275 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun e!85697 () ListLongMap!1647)

(assert (=> d!40159 (= lt!68409 e!85697)))

(assert (=> d!40159 (= c!24304 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40159 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40159 (= (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68418)))

(declare-fun b!131412 () Bool)

(assert (=> b!131412 (= e!85702 (not call!14349))))

(declare-fun b!131413 () Bool)

(declare-fun e!85698 () Bool)

(assert (=> b!131413 (= e!85698 (= (apply!114 lt!68418 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)) (get!1476 (select (arr!2241 (_values!2825 newMap!16)) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2508 (_values!2825 newMap!16))))))

(assert (=> b!131413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14345 () Bool)

(assert (=> bm!14345 (= call!14348 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131414 () Bool)

(assert (=> b!131414 (= e!85699 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131415 () Bool)

(assert (=> b!131415 (= e!85701 e!85698)))

(declare-fun res!63276 () Bool)

(assert (=> b!131415 (=> (not res!63276) (not e!85698))))

(assert (=> b!131415 (= res!63276 (contains!877 lt!68418 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14346 () Bool)

(assert (=> bm!14346 (= call!14350 call!14351)))

(declare-fun bm!14347 () Bool)

(assert (=> bm!14347 (= call!14345 call!14346)))

(declare-fun b!131416 () Bool)

(assert (=> b!131416 (= e!85693 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131417 () Bool)

(assert (=> b!131417 (= e!85697 (+!167 call!14346 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 newMap!16))))))

(declare-fun b!131418 () Bool)

(assert (=> b!131418 (= e!85696 (= (apply!114 lt!68418 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2699 newMap!16)))))

(declare-fun b!131419 () Bool)

(assert (=> b!131419 (= e!85700 (not call!14347))))

(declare-fun b!131420 () Bool)

(assert (=> b!131420 (= e!85697 e!85694)))

(assert (=> b!131420 (= c!24305 (and (not (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2611 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131421 () Bool)

(declare-fun lt!68407 () Unit!4103)

(assert (=> b!131421 (= e!85703 lt!68407)))

(declare-fun lt!68398 () ListLongMap!1647)

(assert (=> b!131421 (= lt!68398 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68417 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68417 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68414 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68414 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68401 () Unit!4103)

(assert (=> b!131421 (= lt!68401 (addStillContains!90 lt!68398 lt!68417 (zeroValue!2699 newMap!16) lt!68414))))

(assert (=> b!131421 (contains!877 (+!167 lt!68398 (tuple2!2553 lt!68417 (zeroValue!2699 newMap!16))) lt!68414)))

(declare-fun lt!68413 () Unit!4103)

(assert (=> b!131421 (= lt!68413 lt!68401)))

(declare-fun lt!68416 () ListLongMap!1647)

(assert (=> b!131421 (= lt!68416 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68405 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68415 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68415 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68412 () Unit!4103)

(assert (=> b!131421 (= lt!68412 (addApplyDifferent!90 lt!68416 lt!68405 (minValue!2699 newMap!16) lt!68415))))

(assert (=> b!131421 (= (apply!114 (+!167 lt!68416 (tuple2!2553 lt!68405 (minValue!2699 newMap!16))) lt!68415) (apply!114 lt!68416 lt!68415))))

(declare-fun lt!68411 () Unit!4103)

(assert (=> b!131421 (= lt!68411 lt!68412)))

(declare-fun lt!68400 () ListLongMap!1647)

(assert (=> b!131421 (= lt!68400 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68408 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68408 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68406 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68406 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68410 () Unit!4103)

(assert (=> b!131421 (= lt!68410 (addApplyDifferent!90 lt!68400 lt!68408 (zeroValue!2699 newMap!16) lt!68406))))

(assert (=> b!131421 (= (apply!114 (+!167 lt!68400 (tuple2!2553 lt!68408 (zeroValue!2699 newMap!16))) lt!68406) (apply!114 lt!68400 lt!68406))))

(declare-fun lt!68399 () Unit!4103)

(assert (=> b!131421 (= lt!68399 lt!68410)))

(declare-fun lt!68402 () ListLongMap!1647)

(assert (=> b!131421 (= lt!68402 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68419 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68419 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68403 () (_ BitVec 64))

(assert (=> b!131421 (= lt!68403 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131421 (= lt!68407 (addApplyDifferent!90 lt!68402 lt!68419 (minValue!2699 newMap!16) lt!68403))))

(assert (=> b!131421 (= (apply!114 (+!167 lt!68402 (tuple2!2553 lt!68419 (minValue!2699 newMap!16))) lt!68403) (apply!114 lt!68402 lt!68403))))

(declare-fun bm!14348 () Bool)

(assert (=> bm!14348 (= call!14347 (contains!877 lt!68418 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!40159 c!24304) b!131417))

(assert (= (and d!40159 (not c!24304)) b!131420))

(assert (= (and b!131420 c!24305) b!131409))

(assert (= (and b!131420 (not c!24305)) b!131411))

(assert (= (and b!131411 c!24301) b!131405))

(assert (= (and b!131411 (not c!24301)) b!131406))

(assert (= (or b!131405 b!131406) bm!14346))

(assert (= (or b!131409 bm!14346) bm!14344))

(assert (= (or b!131409 b!131405) bm!14347))

(assert (= (or b!131417 bm!14344) bm!14345))

(assert (= (or b!131417 bm!14347) bm!14342))

(assert (= (and d!40159 res!63275) b!131416))

(assert (= (and d!40159 c!24306) b!131421))

(assert (= (and d!40159 (not c!24306)) b!131410))

(assert (= (and d!40159 res!63278) b!131401))

(assert (= (and b!131401 res!63279) b!131414))

(assert (= (and b!131401 (not res!63273)) b!131415))

(assert (= (and b!131415 res!63276) b!131413))

(assert (= (and b!131401 res!63277) b!131403))

(assert (= (and b!131403 c!24302) b!131408))

(assert (= (and b!131403 (not c!24302)) b!131412))

(assert (= (and b!131408 res!63274) b!131407))

(assert (= (or b!131408 b!131412) bm!14343))

(assert (= (and b!131403 res!63281) b!131402))

(assert (= (and b!131402 c!24303) b!131404))

(assert (= (and b!131402 (not c!24303)) b!131419))

(assert (= (and b!131404 res!63280) b!131418))

(assert (= (or b!131404 b!131419) bm!14348))

(declare-fun b_lambda!5863 () Bool)

(assert (=> (not b_lambda!5863) (not b!131413)))

(assert (=> b!131413 t!6111))

(declare-fun b_and!8145 () Bool)

(assert (= b_and!8141 (and (=> t!6111 result!3945) b_and!8145)))

(assert (=> b!131413 t!6113))

(declare-fun b_and!8147 () Bool)

(assert (= b_and!8143 (and (=> t!6113 result!3947) b_and!8147)))

(declare-fun m!155067 () Bool)

(assert (=> b!131417 m!155067))

(assert (=> b!131413 m!154965))

(assert (=> b!131413 m!154979))

(declare-fun m!155069 () Bool)

(assert (=> b!131413 m!155069))

(assert (=> b!131413 m!154979))

(declare-fun m!155071 () Bool)

(assert (=> b!131413 m!155071))

(assert (=> b!131413 m!154965))

(declare-fun m!155073 () Bool)

(assert (=> b!131413 m!155073))

(assert (=> b!131413 m!155069))

(declare-fun m!155075 () Bool)

(assert (=> bm!14342 m!155075))

(declare-fun m!155077 () Bool)

(assert (=> bm!14348 m!155077))

(assert (=> d!40159 m!154991))

(declare-fun m!155079 () Bool)

(assert (=> bm!14345 m!155079))

(declare-fun m!155081 () Bool)

(assert (=> b!131418 m!155081))

(declare-fun m!155083 () Bool)

(assert (=> bm!14343 m!155083))

(declare-fun m!155085 () Bool)

(assert (=> b!131407 m!155085))

(assert (=> b!131415 m!154965))

(assert (=> b!131415 m!154965))

(declare-fun m!155087 () Bool)

(assert (=> b!131415 m!155087))

(assert (=> b!131414 m!154965))

(assert (=> b!131414 m!154965))

(assert (=> b!131414 m!154967))

(assert (=> b!131421 m!154965))

(declare-fun m!155089 () Bool)

(assert (=> b!131421 m!155089))

(assert (=> b!131421 m!155079))

(declare-fun m!155091 () Bool)

(assert (=> b!131421 m!155091))

(declare-fun m!155093 () Bool)

(assert (=> b!131421 m!155093))

(declare-fun m!155095 () Bool)

(assert (=> b!131421 m!155095))

(declare-fun m!155097 () Bool)

(assert (=> b!131421 m!155097))

(declare-fun m!155099 () Bool)

(assert (=> b!131421 m!155099))

(declare-fun m!155101 () Bool)

(assert (=> b!131421 m!155101))

(declare-fun m!155103 () Bool)

(assert (=> b!131421 m!155103))

(assert (=> b!131421 m!155093))

(declare-fun m!155105 () Bool)

(assert (=> b!131421 m!155105))

(declare-fun m!155107 () Bool)

(assert (=> b!131421 m!155107))

(declare-fun m!155109 () Bool)

(assert (=> b!131421 m!155109))

(declare-fun m!155111 () Bool)

(assert (=> b!131421 m!155111))

(declare-fun m!155113 () Bool)

(assert (=> b!131421 m!155113))

(assert (=> b!131421 m!155107))

(declare-fun m!155115 () Bool)

(assert (=> b!131421 m!155115))

(assert (=> b!131421 m!155101))

(declare-fun m!155117 () Bool)

(assert (=> b!131421 m!155117))

(assert (=> b!131421 m!155095))

(assert (=> b!131416 m!154965))

(assert (=> b!131416 m!154965))

(assert (=> b!131416 m!154967))

(assert (=> b!131201 d!40159))

(declare-fun d!40161 () Bool)

(declare-fun e!85705 () Bool)

(assert (=> d!40161 e!85705))

(declare-fun res!63282 () Bool)

(assert (=> d!40161 (=> res!63282 e!85705)))

(declare-fun lt!68421 () Bool)

(assert (=> d!40161 (= res!63282 (not lt!68421))))

(declare-fun lt!68420 () Bool)

(assert (=> d!40161 (= lt!68421 lt!68420)))

(declare-fun lt!68423 () Unit!4103)

(declare-fun e!85704 () Unit!4103)

(assert (=> d!40161 (= lt!68423 e!85704)))

(declare-fun c!24307 () Bool)

(assert (=> d!40161 (= c!24307 lt!68420)))

(assert (=> d!40161 (= lt!68420 (containsKey!174 (toList!839 lt!68351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40161 (= (contains!877 lt!68351 #b0000000000000000000000000000000000000000000000000000000000000000) lt!68421)))

(declare-fun b!131422 () Bool)

(declare-fun lt!68422 () Unit!4103)

(assert (=> b!131422 (= e!85704 lt!68422)))

(assert (=> b!131422 (= lt!68422 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 lt!68351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131422 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131423 () Bool)

(declare-fun Unit!4113 () Unit!4103)

(assert (=> b!131423 (= e!85704 Unit!4113)))

(declare-fun b!131424 () Bool)

(assert (=> b!131424 (= e!85705 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40161 c!24307) b!131422))

(assert (= (and d!40161 (not c!24307)) b!131423))

(assert (= (and d!40161 (not res!63282)) b!131424))

(declare-fun m!155119 () Bool)

(assert (=> d!40161 m!155119))

(declare-fun m!155121 () Bool)

(assert (=> b!131422 m!155121))

(declare-fun m!155123 () Bool)

(assert (=> b!131422 m!155123))

(assert (=> b!131422 m!155123))

(declare-fun m!155125 () Bool)

(assert (=> b!131422 m!155125))

(assert (=> b!131424 m!155123))

(assert (=> b!131424 m!155123))

(assert (=> b!131424 m!155125))

(assert (=> bm!14326 d!40161))

(declare-fun d!40163 () Bool)

(declare-fun e!85708 () Bool)

(assert (=> d!40163 e!85708))

(declare-fun res!63288 () Bool)

(assert (=> d!40163 (=> (not res!63288) (not e!85708))))

(declare-fun lt!68434 () ListLongMap!1647)

(assert (=> d!40163 (= res!63288 (contains!877 lt!68434 (_1!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun lt!68432 () List!1688)

(assert (=> d!40163 (= lt!68434 (ListLongMap!1648 lt!68432))))

(declare-fun lt!68435 () Unit!4103)

(declare-fun lt!68433 () Unit!4103)

(assert (=> d!40163 (= lt!68435 lt!68433)))

(assert (=> d!40163 (= (getValueByKey!171 lt!68432 (_1!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))) (Some!176 (_2!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!86 (List!1688 (_ BitVec 64) V!3465) Unit!4103)

(assert (=> d!40163 (= lt!68433 (lemmaContainsTupThenGetReturnValue!86 lt!68432 (_1!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (_2!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun insertStrictlySorted!89 (List!1688 (_ BitVec 64) V!3465) List!1688)

(assert (=> d!40163 (= lt!68432 (insertStrictlySorted!89 (toList!839 (ite c!24274 call!14331 (ite c!24275 call!14334 call!14333))) (_1!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (_2!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(assert (=> d!40163 (= (+!167 (ite c!24274 call!14331 (ite c!24275 call!14334 call!14333)) (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68434)))

(declare-fun b!131429 () Bool)

(declare-fun res!63287 () Bool)

(assert (=> b!131429 (=> (not res!63287) (not e!85708))))

(assert (=> b!131429 (= res!63287 (= (getValueByKey!171 (toList!839 lt!68434) (_1!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))) (Some!176 (_2!1287 (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))))

(declare-fun b!131430 () Bool)

(declare-fun contains!879 (List!1688 tuple2!2552) Bool)

(assert (=> b!131430 (= e!85708 (contains!879 (toList!839 lt!68434) (ite (or c!24274 c!24275) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (= (and d!40163 res!63288) b!131429))

(assert (= (and b!131429 res!63287) b!131430))

(declare-fun m!155127 () Bool)

(assert (=> d!40163 m!155127))

(declare-fun m!155129 () Bool)

(assert (=> d!40163 m!155129))

(declare-fun m!155131 () Bool)

(assert (=> d!40163 m!155131))

(declare-fun m!155133 () Bool)

(assert (=> d!40163 m!155133))

(declare-fun m!155135 () Bool)

(assert (=> b!131429 m!155135))

(declare-fun m!155137 () Bool)

(assert (=> b!131430 m!155137))

(assert (=> bm!14325 d!40163))

(declare-fun d!40165 () Bool)

(assert (=> d!40165 (= (+!167 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) lt!68265 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68438 () Unit!4103)

(declare-fun choose!806 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4103)

(assert (=> d!40165 (= lt!68438 (choose!806 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68265 (zeroValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40165 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40165 (= (lemmaChangeZeroKeyThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68265 (zeroValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2699 newMap!16) (defaultEntry!2842 newMap!16)) lt!68438)))

(declare-fun bs!5468 () Bool)

(assert (= bs!5468 d!40165))

(assert (=> bs!5468 m!154851))

(declare-fun m!155139 () Bool)

(assert (=> bs!5468 m!155139))

(assert (=> bs!5468 m!154991))

(assert (=> bs!5468 m!154851))

(assert (=> bs!5468 m!154725))

(declare-fun m!155141 () Bool)

(assert (=> bs!5468 m!155141))

(assert (=> bs!5468 m!154725))

(declare-fun m!155143 () Bool)

(assert (=> bs!5468 m!155143))

(assert (=> b!131197 d!40165))

(declare-fun d!40167 () Bool)

(assert (=> d!40167 (= (apply!114 lt!68351 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1480 (getValueByKey!171 (toList!839 lt!68351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5469 () Bool)

(assert (= bs!5469 d!40167))

(assert (=> bs!5469 m!155123))

(assert (=> bs!5469 m!155123))

(declare-fun m!155145 () Bool)

(assert (=> bs!5469 m!155145))

(assert (=> b!131311 d!40167))

(declare-fun d!40169 () Bool)

(declare-fun e!85710 () Bool)

(assert (=> d!40169 e!85710))

(declare-fun res!63289 () Bool)

(assert (=> d!40169 (=> res!63289 e!85710)))

(declare-fun lt!68440 () Bool)

(assert (=> d!40169 (= res!63289 (not lt!68440))))

(declare-fun lt!68439 () Bool)

(assert (=> d!40169 (= lt!68440 lt!68439)))

(declare-fun lt!68442 () Unit!4103)

(declare-fun e!85709 () Unit!4103)

(assert (=> d!40169 (= lt!68442 e!85709)))

(declare-fun c!24308 () Bool)

(assert (=> d!40169 (= c!24308 lt!68439)))

(assert (=> d!40169 (= lt!68439 (containsKey!174 (toList!839 lt!68351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40169 (= (contains!877 lt!68351 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68440)))

(declare-fun b!131431 () Bool)

(declare-fun lt!68441 () Unit!4103)

(assert (=> b!131431 (= e!85709 lt!68441)))

(assert (=> b!131431 (= lt!68441 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 lt!68351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131431 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131432 () Bool)

(declare-fun Unit!4114 () Unit!4103)

(assert (=> b!131432 (= e!85709 Unit!4114)))

(declare-fun b!131433 () Bool)

(assert (=> b!131433 (= e!85710 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40169 c!24308) b!131431))

(assert (= (and d!40169 (not c!24308)) b!131432))

(assert (= (and d!40169 (not res!63289)) b!131433))

(declare-fun m!155147 () Bool)

(assert (=> d!40169 m!155147))

(declare-fun m!155149 () Bool)

(assert (=> b!131431 m!155149))

(declare-fun m!155151 () Bool)

(assert (=> b!131431 m!155151))

(assert (=> b!131431 m!155151))

(declare-fun m!155153 () Bool)

(assert (=> b!131431 m!155153))

(assert (=> b!131433 m!155151))

(assert (=> b!131433 m!155151))

(assert (=> b!131433 m!155153))

(assert (=> bm!14331 d!40169))

(declare-fun c!24317 () Bool)

(declare-fun c!24318 () Bool)

(declare-fun lt!68510 () SeekEntryResult!267)

(declare-fun call!14363 () Bool)

(declare-fun bm!14357 () Bool)

(declare-fun lt!68532 () SeekEntryResult!267)

(assert (=> bm!14357 (= call!14363 (inRange!0 (ite c!24318 (index!3227 lt!68532) (ite c!24317 (index!3226 lt!68510) (index!3229 lt!68510))) (mask!7130 newMap!16)))))

(declare-fun b!131469 () Bool)

(declare-fun res!63309 () Bool)

(assert (=> b!131469 (= res!63309 call!14363)))

(declare-fun e!85733 () Bool)

(assert (=> b!131469 (=> (not res!63309) (not e!85733))))

(declare-fun bm!14358 () Bool)

(declare-fun call!14360 () Bool)

(assert (=> bm!14358 (= call!14360 call!14363)))

(declare-fun b!131470 () Bool)

(declare-fun e!85732 () Unit!4103)

(declare-fun Unit!4115 () Unit!4103)

(assert (=> b!131470 (= e!85732 Unit!4115)))

(declare-fun b!131471 () Bool)

(declare-fun res!63315 () Bool)

(declare-fun e!85727 () Bool)

(assert (=> b!131471 (=> (not res!63315) (not e!85727))))

(declare-fun lt!68530 () tuple2!2554)

(assert (=> b!131471 (= res!63315 (contains!877 (map!1392 (_2!1288 lt!68530)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131472 () Bool)

(declare-fun res!63311 () Bool)

(declare-fun e!85730 () Bool)

(assert (=> b!131472 (=> (not res!63311) (not e!85730))))

(assert (=> b!131472 (= res!63311 call!14360)))

(declare-fun e!85731 () Bool)

(assert (=> b!131472 (= e!85731 e!85730)))

(declare-fun b!131473 () Bool)

(declare-fun c!24319 () Bool)

(assert (=> b!131473 (= c!24319 ((_ is MissingVacant!267) lt!68510))))

(declare-fun e!85734 () Bool)

(assert (=> b!131473 (= e!85731 e!85734)))

(declare-fun b!131468 () Bool)

(assert (=> b!131468 (= e!85734 ((_ is Undefined!267) lt!68510))))

(declare-fun d!40171 () Bool)

(assert (=> d!40171 e!85727))

(declare-fun res!63314 () Bool)

(assert (=> d!40171 (=> (not res!63314) (not e!85727))))

(assert (=> d!40171 (= res!63314 (_1!1288 lt!68530))))

(assert (=> d!40171 (= lt!68530 (tuple2!2555 true (LongMapFixedSize!1085 (defaultEntry!2842 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (bvadd (_size!591 newMap!16) #b00000000000000000000000000000001) (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))) (_vacant!591 newMap!16))))))

(declare-fun lt!68524 () Unit!4103)

(declare-fun lt!68511 () Unit!4103)

(assert (=> d!40171 (= lt!68524 lt!68511)))

(declare-fun lt!68527 () array!4737)

(declare-fun lt!68516 () array!4735)

(assert (=> d!40171 (contains!877 (getCurrentListMap!516 lt!68516 lt!68527 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267))))))

(assert (=> d!40171 (= lt!68511 (lemmaValidKeyInArrayIsInListMap!119 lt!68516 lt!68527 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40171 (= lt!68527 (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))))))

(assert (=> d!40171 (= lt!68516 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun lt!68507 () Unit!4103)

(declare-fun lt!68505 () Unit!4103)

(assert (=> d!40171 (= lt!68507 lt!68505)))

(declare-fun lt!68519 () array!4735)

(assert (=> d!40171 (= (arrayCountValidKeys!0 lt!68519 (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (bvadd (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4735 (_ BitVec 32)) Unit!4103)

(assert (=> d!40171 (= lt!68505 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68519 (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267))))))

(assert (=> d!40171 (= lt!68519 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun lt!68503 () Unit!4103)

(declare-fun lt!68517 () Unit!4103)

(assert (=> d!40171 (= lt!68503 lt!68517)))

(declare-fun lt!68518 () array!4735)

(assert (=> d!40171 (arrayContainsKey!0 lt!68518 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!40171 (= lt!68517 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68518 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267))))))

(assert (=> d!40171 (= lt!68518 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun lt!68529 () Unit!4103)

(declare-fun lt!68525 () Unit!4103)

(assert (=> d!40171 (= lt!68529 lt!68525)))

(assert (=> d!40171 (= (+!167 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!40 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4103)

(assert (=> d!40171 (= lt!68525 (lemmaAddValidKeyToArrayThenAddPairToListMap!40 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68526 () Unit!4103)

(declare-fun lt!68528 () Unit!4103)

(assert (=> d!40171 (= lt!68526 lt!68528)))

(assert (=> d!40171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))) (mask!7130 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4735 (_ BitVec 32) (_ BitVec 32)) Unit!4103)

(assert (=> d!40171 (= lt!68528 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (mask!7130 newMap!16)))))

(declare-fun lt!68521 () Unit!4103)

(declare-fun lt!68523 () Unit!4103)

(assert (=> d!40171 (= lt!68521 lt!68523)))

(assert (=> d!40171 (= (arrayCountValidKeys!0 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))) #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4587 newMap!16) #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4735 (_ BitVec 32) (_ BitVec 64)) Unit!4103)

(assert (=> d!40171 (= lt!68523 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4587 newMap!16) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun lt!68531 () Unit!4103)

(declare-fun lt!68509 () Unit!4103)

(assert (=> d!40171 (= lt!68531 lt!68509)))

(declare-fun lt!68515 () List!1690)

(declare-fun lt!68522 () (_ BitVec 32))

(assert (=> d!40171 (arrayNoDuplicates!0 (array!4736 (store (arr!2240 (_keys!4587 newMap!16)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (size!2507 (_keys!4587 newMap!16))) lt!68522 lt!68515)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1690) Unit!4103)

(assert (=> d!40171 (= lt!68509 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267)) lt!68522 lt!68515))))

(assert (=> d!40171 (= lt!68515 Nil!1687)))

(assert (=> d!40171 (= lt!68522 #b00000000000000000000000000000000)))

(declare-fun lt!68514 () Unit!4103)

(assert (=> d!40171 (= lt!68514 e!85732)))

(declare-fun c!24320 () Bool)

(assert (=> d!40171 (= c!24320 (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68513 () Unit!4103)

(declare-fun e!85729 () Unit!4103)

(assert (=> d!40171 (= lt!68513 e!85729)))

(assert (=> d!40171 (= c!24318 (contains!877 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> d!40171 (valid!536 newMap!16)))

(assert (=> d!40171 (= (updateHelperNewKey!59 newMap!16 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24243 (index!3229 lt!68267) (index!3226 lt!68267))) lt!68530)))

(declare-fun b!131474 () Bool)

(declare-fun Unit!4116 () Unit!4103)

(assert (=> b!131474 (= e!85732 Unit!4116)))

(declare-fun lt!68508 () Unit!4103)

(declare-fun lemmaArrayContainsKeyThenInListMap!40 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) (_ BitVec 32) Int) Unit!4103)

(assert (=> b!131474 (= lt!68508 (lemmaArrayContainsKeyThenInListMap!40 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(assert (=> b!131474 (contains!877 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))

(declare-fun lt!68512 () Unit!4103)

(assert (=> b!131474 (= lt!68512 lt!68508)))

(assert (=> b!131474 false))

(declare-fun b!131475 () Bool)

(declare-fun e!85728 () Bool)

(assert (=> b!131475 (= e!85734 e!85728)))

(declare-fun res!63310 () Bool)

(assert (=> b!131475 (= res!63310 call!14360)))

(assert (=> b!131475 (=> (not res!63310) (not e!85728))))

(declare-fun bm!14359 () Bool)

(declare-fun call!14362 () SeekEntryResult!267)

(assert (=> bm!14359 (= call!14362 (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun b!131476 () Bool)

(declare-fun lt!68506 () Unit!4103)

(assert (=> b!131476 (= e!85729 lt!68506)))

(assert (=> b!131476 (= lt!68506 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131476 (= lt!68510 call!14362)))

(assert (=> b!131476 (= c!24317 ((_ is MissingZero!267) lt!68510))))

(assert (=> b!131476 e!85731))

(declare-fun b!131477 () Bool)

(declare-fun res!63313 () Bool)

(assert (=> b!131477 (=> (not res!63313) (not e!85727))))

(assert (=> b!131477 (= res!63313 (valid!536 (_2!1288 lt!68530)))))

(declare-fun b!131478 () Bool)

(declare-fun call!14361 () Bool)

(assert (=> b!131478 (= e!85728 (not call!14361))))

(declare-fun b!131479 () Bool)

(assert (=> b!131479 (= e!85727 (= (map!1392 (_2!1288 lt!68530)) (+!167 (map!1392 newMap!16) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!14360 () Bool)

(assert (=> bm!14360 (= call!14361 (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131480 () Bool)

(assert (=> b!131480 (= e!85730 (not call!14361))))

(declare-fun b!131481 () Bool)

(declare-fun res!63308 () Bool)

(assert (=> b!131481 (= res!63308 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3229 lt!68510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131481 (=> (not res!63308) (not e!85728))))

(declare-fun b!131482 () Bool)

(declare-fun Unit!4117 () Unit!4103)

(assert (=> b!131482 (= e!85729 Unit!4117)))

(declare-fun lt!68504 () Unit!4103)

(assert (=> b!131482 (= lt!68504 (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> b!131482 (= lt!68532 call!14362)))

(declare-fun res!63316 () Bool)

(assert (=> b!131482 (= res!63316 ((_ is Found!267) lt!68532))))

(assert (=> b!131482 (=> (not res!63316) (not e!85733))))

(assert (=> b!131482 e!85733))

(declare-fun lt!68520 () Unit!4103)

(assert (=> b!131482 (= lt!68520 lt!68504)))

(assert (=> b!131482 false))

(declare-fun b!131483 () Bool)

(declare-fun res!63312 () Bool)

(assert (=> b!131483 (=> (not res!63312) (not e!85730))))

(assert (=> b!131483 (= res!63312 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3226 lt!68510)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131484 () Bool)

(assert (=> b!131484 (= e!85733 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68532)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (= (and d!40171 c!24318) b!131482))

(assert (= (and d!40171 (not c!24318)) b!131476))

(assert (= (and b!131482 res!63316) b!131469))

(assert (= (and b!131469 res!63309) b!131484))

(assert (= (and b!131476 c!24317) b!131472))

(assert (= (and b!131476 (not c!24317)) b!131473))

(assert (= (and b!131472 res!63311) b!131483))

(assert (= (and b!131483 res!63312) b!131480))

(assert (= (and b!131473 c!24319) b!131475))

(assert (= (and b!131473 (not c!24319)) b!131468))

(assert (= (and b!131475 res!63310) b!131481))

(assert (= (and b!131481 res!63308) b!131478))

(assert (= (or b!131472 b!131475) bm!14358))

(assert (= (or b!131480 b!131478) bm!14360))

(assert (= (or b!131469 bm!14358) bm!14357))

(assert (= (or b!131482 b!131476) bm!14359))

(assert (= (and d!40171 c!24320) b!131474))

(assert (= (and d!40171 (not c!24320)) b!131470))

(assert (= (and d!40171 res!63314) b!131477))

(assert (= (and b!131477 res!63313) b!131471))

(assert (= (and b!131471 res!63315) b!131479))

(declare-fun m!155155 () Bool)

(assert (=> b!131483 m!155155))

(declare-fun m!155157 () Bool)

(assert (=> b!131471 m!155157))

(assert (=> b!131471 m!155157))

(assert (=> b!131471 m!154705))

(declare-fun m!155159 () Bool)

(assert (=> b!131471 m!155159))

(assert (=> b!131482 m!154705))

(assert (=> b!131482 m!154833))

(declare-fun m!155161 () Bool)

(assert (=> b!131481 m!155161))

(assert (=> b!131479 m!155157))

(assert (=> b!131479 m!154707))

(assert (=> b!131479 m!154707))

(declare-fun m!155163 () Bool)

(assert (=> b!131479 m!155163))

(declare-fun m!155165 () Bool)

(assert (=> b!131477 m!155165))

(declare-fun m!155167 () Bool)

(assert (=> b!131484 m!155167))

(declare-fun m!155169 () Bool)

(assert (=> bm!14357 m!155169))

(assert (=> bm!14360 m!154705))

(assert (=> bm!14360 m!154849))

(assert (=> b!131476 m!154705))

(assert (=> b!131476 m!154861))

(assert (=> bm!14359 m!154705))

(assert (=> bm!14359 m!154829))

(declare-fun m!155171 () Bool)

(assert (=> d!40171 m!155171))

(assert (=> d!40171 m!154705))

(declare-fun m!155173 () Bool)

(assert (=> d!40171 m!155173))

(assert (=> d!40171 m!154705))

(declare-fun m!155175 () Bool)

(assert (=> d!40171 m!155175))

(assert (=> d!40171 m!155171))

(declare-fun m!155177 () Bool)

(assert (=> d!40171 m!155177))

(declare-fun m!155179 () Bool)

(assert (=> d!40171 m!155179))

(declare-fun m!155181 () Bool)

(assert (=> d!40171 m!155181))

(assert (=> d!40171 m!154705))

(declare-fun m!155183 () Bool)

(assert (=> d!40171 m!155183))

(assert (=> d!40171 m!154705))

(declare-fun m!155185 () Bool)

(assert (=> d!40171 m!155185))

(declare-fun m!155187 () Bool)

(assert (=> d!40171 m!155187))

(assert (=> d!40171 m!154851))

(declare-fun m!155189 () Bool)

(assert (=> d!40171 m!155189))

(assert (=> d!40171 m!154705))

(declare-fun m!155191 () Bool)

(assert (=> d!40171 m!155191))

(declare-fun m!155193 () Bool)

(assert (=> d!40171 m!155193))

(declare-fun m!155195 () Bool)

(assert (=> d!40171 m!155195))

(assert (=> d!40171 m!154851))

(assert (=> d!40171 m!154705))

(declare-fun m!155197 () Bool)

(assert (=> d!40171 m!155197))

(assert (=> d!40171 m!154883))

(assert (=> d!40171 m!154705))

(assert (=> d!40171 m!154849))

(assert (=> d!40171 m!155177))

(assert (=> d!40171 m!154705))

(assert (=> d!40171 m!154725))

(declare-fun m!155199 () Bool)

(assert (=> d!40171 m!155199))

(declare-fun m!155201 () Bool)

(assert (=> d!40171 m!155201))

(assert (=> d!40171 m!154739))

(declare-fun m!155203 () Bool)

(assert (=> d!40171 m!155203))

(declare-fun m!155205 () Bool)

(assert (=> d!40171 m!155205))

(assert (=> d!40171 m!154851))

(declare-fun m!155207 () Bool)

(assert (=> d!40171 m!155207))

(declare-fun m!155209 () Bool)

(assert (=> d!40171 m!155209))

(assert (=> b!131474 m!154705))

(declare-fun m!155211 () Bool)

(assert (=> b!131474 m!155211))

(assert (=> b!131474 m!154851))

(assert (=> b!131474 m!154851))

(assert (=> b!131474 m!154705))

(assert (=> b!131474 m!155197))

(assert (=> bm!14292 d!40171))

(declare-fun d!40173 () Bool)

(declare-fun res!63321 () Bool)

(declare-fun e!85739 () Bool)

(assert (=> d!40173 (=> res!63321 e!85739)))

(assert (=> d!40173 (= res!63321 (and ((_ is Cons!1684) (toList!839 lt!68164)) (= (_1!1287 (h!2289 (toList!839 lt!68164))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(assert (=> d!40173 (= (containsKey!174 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) e!85739)))

(declare-fun b!131489 () Bool)

(declare-fun e!85740 () Bool)

(assert (=> b!131489 (= e!85739 e!85740)))

(declare-fun res!63322 () Bool)

(assert (=> b!131489 (=> (not res!63322) (not e!85740))))

(assert (=> b!131489 (= res!63322 (and (or (not ((_ is Cons!1684) (toList!839 lt!68164))) (bvsle (_1!1287 (h!2289 (toList!839 lt!68164))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))) ((_ is Cons!1684) (toList!839 lt!68164)) (bvslt (_1!1287 (h!2289 (toList!839 lt!68164))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(declare-fun b!131490 () Bool)

(assert (=> b!131490 (= e!85740 (containsKey!174 (t!6099 (toList!839 lt!68164)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (= (and d!40173 (not res!63321)) b!131489))

(assert (= (and b!131489 res!63322) b!131490))

(assert (=> b!131490 m!154705))

(declare-fun m!155213 () Bool)

(assert (=> b!131490 m!155213))

(assert (=> d!40111 d!40173))

(declare-fun d!40175 () Bool)

(assert (=> d!40175 (= (map!1392 (_2!1288 lt!68273)) (getCurrentListMap!516 (_keys!4587 (_2!1288 lt!68273)) (_values!2825 (_2!1288 lt!68273)) (mask!7130 (_2!1288 lt!68273)) (extraKeys!2611 (_2!1288 lt!68273)) (zeroValue!2699 (_2!1288 lt!68273)) (minValue!2699 (_2!1288 lt!68273)) #b00000000000000000000000000000000 (defaultEntry!2842 (_2!1288 lt!68273))))))

(declare-fun bs!5470 () Bool)

(assert (= bs!5470 d!40175))

(declare-fun m!155215 () Bool)

(assert (=> bs!5470 m!155215))

(assert (=> bm!14298 d!40175))

(declare-fun d!40177 () Bool)

(declare-fun e!85742 () Bool)

(assert (=> d!40177 e!85742))

(declare-fun res!63323 () Bool)

(assert (=> d!40177 (=> res!63323 e!85742)))

(declare-fun lt!68534 () Bool)

(assert (=> d!40177 (= res!63323 (not lt!68534))))

(declare-fun lt!68533 () Bool)

(assert (=> d!40177 (= lt!68534 lt!68533)))

(declare-fun lt!68536 () Unit!4103)

(declare-fun e!85741 () Unit!4103)

(assert (=> d!40177 (= lt!68536 e!85741)))

(declare-fun c!24321 () Bool)

(assert (=> d!40177 (= c!24321 lt!68533)))

(assert (=> d!40177 (= lt!68533 (containsKey!174 (toList!839 call!14305) (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267))))))

(assert (=> d!40177 (= (contains!877 call!14305 (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267))) lt!68534)))

(declare-fun b!131491 () Bool)

(declare-fun lt!68535 () Unit!4103)

(assert (=> b!131491 (= e!85741 lt!68535)))

(assert (=> b!131491 (= lt!68535 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 call!14305) (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267))))))

(assert (=> b!131491 (isDefined!123 (getValueByKey!171 (toList!839 call!14305) (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267))))))

(declare-fun b!131492 () Bool)

(declare-fun Unit!4118 () Unit!4103)

(assert (=> b!131492 (= e!85741 Unit!4118)))

(declare-fun b!131493 () Bool)

(assert (=> b!131493 (= e!85742 (isDefined!123 (getValueByKey!171 (toList!839 call!14305) (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267)))))))

(assert (= (and d!40177 c!24321) b!131491))

(assert (= (and d!40177 (not c!24321)) b!131492))

(assert (= (and d!40177 (not res!63323)) b!131493))

(assert (=> d!40177 m!154863))

(declare-fun m!155217 () Bool)

(assert (=> d!40177 m!155217))

(assert (=> b!131491 m!154863))

(declare-fun m!155219 () Bool)

(assert (=> b!131491 m!155219))

(assert (=> b!131491 m!154863))

(declare-fun m!155221 () Bool)

(assert (=> b!131491 m!155221))

(assert (=> b!131491 m!155221))

(declare-fun m!155223 () Bool)

(assert (=> b!131491 m!155223))

(assert (=> b!131493 m!154863))

(assert (=> b!131493 m!155221))

(assert (=> b!131493 m!155221))

(assert (=> b!131493 m!155223))

(assert (=> b!131208 d!40177))

(declare-fun d!40179 () Bool)

(declare-fun e!85745 () Bool)

(assert (=> d!40179 e!85745))

(declare-fun res!63326 () Bool)

(assert (=> d!40179 (=> (not res!63326) (not e!85745))))

(assert (=> d!40179 (= res!63326 (and (bvsge (index!3227 lt!68267) #b00000000000000000000000000000000) (bvslt (index!3227 lt!68267) (size!2507 (_keys!4587 newMap!16)))))))

(declare-fun lt!68539 () Unit!4103)

(declare-fun choose!807 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) Int) Unit!4103)

(assert (=> d!40179 (= lt!68539 (choose!807 (_keys!4587 newMap!16) lt!68268 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40179 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40179 (= (lemmaValidKeyInArrayIsInListMap!119 (_keys!4587 newMap!16) lt!68268 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (defaultEntry!2842 newMap!16)) lt!68539)))

(declare-fun b!131496 () Bool)

(assert (=> b!131496 (= e!85745 (contains!877 (getCurrentListMap!516 (_keys!4587 newMap!16) lt!68268 (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68267))))))

(assert (= (and d!40179 res!63326) b!131496))

(declare-fun m!155225 () Bool)

(assert (=> d!40179 m!155225))

(assert (=> d!40179 m!154991))

(declare-fun m!155227 () Bool)

(assert (=> b!131496 m!155227))

(assert (=> b!131496 m!154863))

(assert (=> b!131496 m!155227))

(assert (=> b!131496 m!154863))

(declare-fun m!155229 () Bool)

(assert (=> b!131496 m!155229))

(assert (=> b!131208 d!40179))

(declare-fun d!40181 () Bool)

(declare-fun e!85748 () Bool)

(assert (=> d!40181 e!85748))

(declare-fun res!63329 () Bool)

(assert (=> d!40181 (=> (not res!63329) (not e!85748))))

(assert (=> d!40181 (= res!63329 (and (bvsge (index!3227 lt!68267) #b00000000000000000000000000000000) (bvslt (index!3227 lt!68267) (size!2508 (_values!2825 newMap!16)))))))

(declare-fun lt!68542 () Unit!4103)

(declare-fun choose!808 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 32) (_ BitVec 64) V!3465 Int) Unit!4103)

(assert (=> d!40181 (= lt!68542 (choose!808 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40181 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40181 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (index!3227 lt!68267) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)) lt!68542)))

(declare-fun b!131499 () Bool)

(assert (=> b!131499 (= e!85748 (= (+!167 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4587 newMap!16) (array!4738 (store (arr!2241 (_values!2825 newMap!16)) (index!3227 lt!68267) (ValueCellFull!1088 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2508 (_values!2825 newMap!16))) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16))))))

(assert (= (and d!40181 res!63329) b!131499))

(assert (=> d!40181 m!154705))

(assert (=> d!40181 m!154725))

(declare-fun m!155231 () Bool)

(assert (=> d!40181 m!155231))

(assert (=> d!40181 m!154991))

(assert (=> b!131499 m!154851))

(assert (=> b!131499 m!154851))

(assert (=> b!131499 m!155207))

(assert (=> b!131499 m!154869))

(declare-fun m!155233 () Bool)

(assert (=> b!131499 m!155233))

(assert (=> b!131208 d!40181))

(declare-fun d!40183 () Bool)

(assert (=> d!40183 (= (apply!114 lt!68351 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1480 (getValueByKey!171 (toList!839 lt!68351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5471 () Bool)

(assert (= bs!5471 d!40183))

(assert (=> bs!5471 m!155151))

(assert (=> bs!5471 m!155151))

(declare-fun m!155235 () Bool)

(assert (=> bs!5471 m!155235))

(assert (=> b!131322 d!40183))

(declare-fun b!131510 () Bool)

(declare-fun e!85757 () Bool)

(declare-fun call!14366 () Bool)

(assert (=> b!131510 (= e!85757 call!14366)))

(declare-fun bm!14363 () Bool)

(declare-fun c!24324 () Bool)

(assert (=> bm!14363 (= call!14366 (arrayNoDuplicates!0 (_keys!4587 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24324 (Cons!1686 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000) Nil!1687) Nil!1687)))))

(declare-fun b!131511 () Bool)

(declare-fun e!85760 () Bool)

(declare-fun e!85758 () Bool)

(assert (=> b!131511 (= e!85760 e!85758)))

(declare-fun res!63337 () Bool)

(assert (=> b!131511 (=> (not res!63337) (not e!85758))))

(declare-fun e!85759 () Bool)

(assert (=> b!131511 (= res!63337 (not e!85759))))

(declare-fun res!63336 () Bool)

(assert (=> b!131511 (=> (not res!63336) (not e!85759))))

(assert (=> b!131511 (= res!63336 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131512 () Bool)

(assert (=> b!131512 (= e!85757 call!14366)))

(declare-fun d!40185 () Bool)

(declare-fun res!63338 () Bool)

(assert (=> d!40185 (=> res!63338 e!85760)))

(assert (=> d!40185 (= res!63338 (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(assert (=> d!40185 (= (arrayNoDuplicates!0 (_keys!4587 newMap!16) #b00000000000000000000000000000000 Nil!1687) e!85760)))

(declare-fun b!131513 () Bool)

(declare-fun contains!880 (List!1690 (_ BitVec 64)) Bool)

(assert (=> b!131513 (= e!85759 (contains!880 Nil!1687 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131514 () Bool)

(assert (=> b!131514 (= e!85758 e!85757)))

(assert (=> b!131514 (= c!24324 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!40185 (not res!63338)) b!131511))

(assert (= (and b!131511 res!63336) b!131513))

(assert (= (and b!131511 res!63337) b!131514))

(assert (= (and b!131514 c!24324) b!131512))

(assert (= (and b!131514 (not c!24324)) b!131510))

(assert (= (or b!131512 b!131510) bm!14363))

(assert (=> bm!14363 m!154965))

(declare-fun m!155237 () Bool)

(assert (=> bm!14363 m!155237))

(assert (=> b!131511 m!154965))

(assert (=> b!131511 m!154965))

(assert (=> b!131511 m!154967))

(assert (=> b!131513 m!154965))

(assert (=> b!131513 m!154965))

(declare-fun m!155239 () Bool)

(assert (=> b!131513 m!155239))

(assert (=> b!131514 m!154965))

(assert (=> b!131514 m!154965))

(assert (=> b!131514 m!154967))

(assert (=> b!131250 d!40185))

(declare-fun b!131515 () Bool)

(declare-fun res!63343 () Bool)

(declare-fun e!85765 () Bool)

(assert (=> b!131515 (=> (not res!63343) (not e!85765))))

(declare-fun e!85771 () Bool)

(assert (=> b!131515 (= res!63343 e!85771)))

(declare-fun res!63339 () Bool)

(assert (=> b!131515 (=> res!63339 e!85771)))

(declare-fun e!85769 () Bool)

(assert (=> b!131515 (= res!63339 (not e!85769))))

(declare-fun res!63345 () Bool)

(assert (=> b!131515 (=> (not res!63345) (not e!85769))))

(assert (=> b!131515 (= res!63345 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun b!131516 () Bool)

(declare-fun e!85770 () Bool)

(assert (=> b!131516 (= e!85765 e!85770)))

(declare-fun c!24327 () Bool)

(assert (=> b!131516 (= c!24327 (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131517 () Bool)

(declare-fun res!63347 () Bool)

(assert (=> b!131517 (=> (not res!63347) (not e!85765))))

(declare-fun e!85772 () Bool)

(assert (=> b!131517 (= res!63347 e!85772)))

(declare-fun c!24326 () Bool)

(assert (=> b!131517 (= c!24326 (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131518 () Bool)

(declare-fun e!85766 () Bool)

(assert (=> b!131518 (= e!85770 e!85766)))

(declare-fun res!63346 () Bool)

(declare-fun call!14369 () Bool)

(assert (=> b!131518 (= res!63346 call!14369)))

(assert (=> b!131518 (=> (not res!63346) (not e!85766))))

(declare-fun b!131519 () Bool)

(declare-fun e!85762 () ListLongMap!1647)

(declare-fun call!14367 () ListLongMap!1647)

(assert (=> b!131519 (= e!85762 call!14367)))

(declare-fun b!131520 () Bool)

(declare-fun call!14372 () ListLongMap!1647)

(assert (=> b!131520 (= e!85762 call!14372)))

(declare-fun lt!68563 () ListLongMap!1647)

(declare-fun b!131521 () Bool)

(declare-fun e!85761 () Bool)

(assert (=> b!131521 (= e!85761 (= (apply!114 lt!68563 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16))))))

(declare-fun b!131522 () Bool)

(assert (=> b!131522 (= e!85772 e!85761)))

(declare-fun res!63340 () Bool)

(declare-fun call!14371 () Bool)

(assert (=> b!131522 (= res!63340 call!14371)))

(assert (=> b!131522 (=> (not res!63340) (not e!85761))))

(declare-fun call!14368 () ListLongMap!1647)

(declare-fun call!14370 () ListLongMap!1647)

(declare-fun c!24329 () Bool)

(declare-fun bm!14364 () Bool)

(declare-fun c!24328 () Bool)

(declare-fun call!14373 () ListLongMap!1647)

(assert (=> bm!14364 (= call!14368 (+!167 (ite c!24328 call!14370 (ite c!24329 call!14373 call!14372)) (ite (or c!24328 c!24329) (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16))))))))

(declare-fun b!131523 () Bool)

(declare-fun e!85764 () ListLongMap!1647)

(assert (=> b!131523 (= e!85764 call!14367)))

(declare-fun bm!14365 () Bool)

(assert (=> bm!14365 (= call!14371 (contains!877 lt!68563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131524 () Bool)

(declare-fun e!85773 () Unit!4103)

(declare-fun Unit!4119 () Unit!4103)

(assert (=> b!131524 (= e!85773 Unit!4119)))

(declare-fun b!131525 () Bool)

(declare-fun c!24325 () Bool)

(assert (=> b!131525 (= c!24325 (and (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131525 (= e!85764 e!85762)))

(declare-fun bm!14366 () Bool)

(assert (=> bm!14366 (= call!14373 call!14370)))

(declare-fun d!40187 () Bool)

(assert (=> d!40187 e!85765))

(declare-fun res!63344 () Bool)

(assert (=> d!40187 (=> (not res!63344) (not e!85765))))

(assert (=> d!40187 (= res!63344 (or (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))))

(declare-fun lt!68554 () ListLongMap!1647)

(assert (=> d!40187 (= lt!68563 lt!68554)))

(declare-fun lt!68549 () Unit!4103)

(assert (=> d!40187 (= lt!68549 e!85773)))

(declare-fun c!24330 () Bool)

(declare-fun e!85763 () Bool)

(assert (=> d!40187 (= c!24330 e!85763)))

(declare-fun res!63341 () Bool)

(assert (=> d!40187 (=> (not res!63341) (not e!85763))))

(assert (=> d!40187 (= res!63341 (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun e!85767 () ListLongMap!1647)

(assert (=> d!40187 (= lt!68554 e!85767)))

(assert (=> d!40187 (= c!24328 (and (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40187 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40187 (= (getCurrentListMap!516 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) lt!68563)))

(declare-fun b!131526 () Bool)

(assert (=> b!131526 (= e!85772 (not call!14371))))

(declare-fun e!85768 () Bool)

(declare-fun b!131527 () Bool)

(assert (=> b!131527 (= e!85768 (= (apply!114 lt!68563 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)) (get!1476 (select (arr!2241 (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268)) #b00000000000000000000000000000000) (dynLambda!423 (defaultEntry!2842 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2508 (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268))))))

(assert (=> b!131527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14367 () Bool)

(assert (=> bm!14367 (= call!14370 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun b!131528 () Bool)

(assert (=> b!131528 (= e!85769 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131529 () Bool)

(assert (=> b!131529 (= e!85771 e!85768)))

(declare-fun res!63342 () Bool)

(assert (=> b!131529 (=> (not res!63342) (not e!85768))))

(assert (=> b!131529 (= res!63342 (contains!877 lt!68563 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!131529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(declare-fun bm!14368 () Bool)

(assert (=> bm!14368 (= call!14372 call!14373)))

(declare-fun bm!14369 () Bool)

(assert (=> bm!14369 (= call!14367 call!14368)))

(declare-fun b!131530 () Bool)

(assert (=> b!131530 (= e!85763 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!131531 () Bool)

(assert (=> b!131531 (= e!85767 (+!167 call!14368 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))))))

(declare-fun b!131532 () Bool)

(assert (=> b!131532 (= e!85766 (= (apply!114 lt!68563 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16))))))

(declare-fun b!131533 () Bool)

(assert (=> b!131533 (= e!85770 (not call!14369))))

(declare-fun b!131534 () Bool)

(assert (=> b!131534 (= e!85767 e!85764)))

(assert (=> b!131534 (= c!24329 (and (not (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131535 () Bool)

(declare-fun lt!68552 () Unit!4103)

(assert (=> b!131535 (= e!85773 lt!68552)))

(declare-fun lt!68543 () ListLongMap!1647)

(assert (=> b!131535 (= lt!68543 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68562 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68559 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68559 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68546 () Unit!4103)

(assert (=> b!131535 (= lt!68546 (addStillContains!90 lt!68543 lt!68562 (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) lt!68559))))

(assert (=> b!131535 (contains!877 (+!167 lt!68543 (tuple2!2553 lt!68562 (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)))) lt!68559)))

(declare-fun lt!68558 () Unit!4103)

(assert (=> b!131535 (= lt!68558 lt!68546)))

(declare-fun lt!68561 () ListLongMap!1647)

(assert (=> b!131535 (= lt!68561 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68550 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68560 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68560 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68557 () Unit!4103)

(assert (=> b!131535 (= lt!68557 (addApplyDifferent!90 lt!68561 lt!68550 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) lt!68560))))

(assert (=> b!131535 (= (apply!114 (+!167 lt!68561 (tuple2!2553 lt!68550 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))) lt!68560) (apply!114 lt!68561 lt!68560))))

(declare-fun lt!68556 () Unit!4103)

(assert (=> b!131535 (= lt!68556 lt!68557)))

(declare-fun lt!68545 () ListLongMap!1647)

(assert (=> b!131535 (= lt!68545 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68553 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68551 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68551 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68555 () Unit!4103)

(assert (=> b!131535 (= lt!68555 (addApplyDifferent!90 lt!68545 lt!68553 (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) lt!68551))))

(assert (=> b!131535 (= (apply!114 (+!167 lt!68545 (tuple2!2553 lt!68553 (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)))) lt!68551) (apply!114 lt!68545 lt!68551))))

(declare-fun lt!68544 () Unit!4103)

(assert (=> b!131535 (= lt!68544 lt!68555)))

(declare-fun lt!68547 () ListLongMap!1647)

(assert (=> b!131535 (= lt!68547 (getCurrentListMapNoExtraKeys!134 (_keys!4587 newMap!16) (ite (or c!24249 c!24248) (_values!2825 newMap!16) lt!68268) (mask!7130 newMap!16) (ite c!24249 (ite c!24246 lt!68265 lt!68252) (extraKeys!2611 newMap!16)) (ite (and c!24249 c!24246) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2699 newMap!16)) (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68564 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68548 () (_ BitVec 64))

(assert (=> b!131535 (= lt!68548 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131535 (= lt!68552 (addApplyDifferent!90 lt!68547 lt!68564 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)) lt!68548))))

(assert (=> b!131535 (= (apply!114 (+!167 lt!68547 (tuple2!2553 lt!68564 (ite c!24249 (ite c!24246 (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2699 newMap!16)))) lt!68548) (apply!114 lt!68547 lt!68548))))

(declare-fun bm!14370 () Bool)

(assert (=> bm!14370 (= call!14369 (contains!877 lt!68563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!40187 c!24328) b!131531))

(assert (= (and d!40187 (not c!24328)) b!131534))

(assert (= (and b!131534 c!24329) b!131523))

(assert (= (and b!131534 (not c!24329)) b!131525))

(assert (= (and b!131525 c!24325) b!131519))

(assert (= (and b!131525 (not c!24325)) b!131520))

(assert (= (or b!131519 b!131520) bm!14368))

(assert (= (or b!131523 bm!14368) bm!14366))

(assert (= (or b!131523 b!131519) bm!14369))

(assert (= (or b!131531 bm!14366) bm!14367))

(assert (= (or b!131531 bm!14369) bm!14364))

(assert (= (and d!40187 res!63341) b!131530))

(assert (= (and d!40187 c!24330) b!131535))

(assert (= (and d!40187 (not c!24330)) b!131524))

(assert (= (and d!40187 res!63344) b!131515))

(assert (= (and b!131515 res!63345) b!131528))

(assert (= (and b!131515 (not res!63339)) b!131529))

(assert (= (and b!131529 res!63342) b!131527))

(assert (= (and b!131515 res!63343) b!131517))

(assert (= (and b!131517 c!24326) b!131522))

(assert (= (and b!131517 (not c!24326)) b!131526))

(assert (= (and b!131522 res!63340) b!131521))

(assert (= (or b!131522 b!131526) bm!14365))

(assert (= (and b!131517 res!63347) b!131516))

(assert (= (and b!131516 c!24327) b!131518))

(assert (= (and b!131516 (not c!24327)) b!131533))

(assert (= (and b!131518 res!63346) b!131532))

(assert (= (or b!131518 b!131533) bm!14370))

(declare-fun b_lambda!5865 () Bool)

(assert (=> (not b_lambda!5865) (not b!131527)))

(assert (=> b!131527 t!6111))

(declare-fun b_and!8149 () Bool)

(assert (= b_and!8145 (and (=> t!6111 result!3945) b_and!8149)))

(assert (=> b!131527 t!6113))

(declare-fun b_and!8151 () Bool)

(assert (= b_and!8147 (and (=> t!6113 result!3947) b_and!8151)))

(declare-fun m!155241 () Bool)

(assert (=> b!131531 m!155241))

(assert (=> b!131527 m!154965))

(assert (=> b!131527 m!154979))

(declare-fun m!155243 () Bool)

(assert (=> b!131527 m!155243))

(assert (=> b!131527 m!154979))

(declare-fun m!155245 () Bool)

(assert (=> b!131527 m!155245))

(assert (=> b!131527 m!154965))

(declare-fun m!155247 () Bool)

(assert (=> b!131527 m!155247))

(assert (=> b!131527 m!155243))

(declare-fun m!155249 () Bool)

(assert (=> bm!14364 m!155249))

(declare-fun m!155251 () Bool)

(assert (=> bm!14370 m!155251))

(assert (=> d!40187 m!154991))

(declare-fun m!155253 () Bool)

(assert (=> bm!14367 m!155253))

(declare-fun m!155255 () Bool)

(assert (=> b!131532 m!155255))

(declare-fun m!155257 () Bool)

(assert (=> bm!14365 m!155257))

(declare-fun m!155259 () Bool)

(assert (=> b!131521 m!155259))

(assert (=> b!131529 m!154965))

(assert (=> b!131529 m!154965))

(declare-fun m!155261 () Bool)

(assert (=> b!131529 m!155261))

(assert (=> b!131528 m!154965))

(assert (=> b!131528 m!154965))

(assert (=> b!131528 m!154967))

(assert (=> b!131535 m!154965))

(declare-fun m!155263 () Bool)

(assert (=> b!131535 m!155263))

(assert (=> b!131535 m!155253))

(declare-fun m!155265 () Bool)

(assert (=> b!131535 m!155265))

(declare-fun m!155267 () Bool)

(assert (=> b!131535 m!155267))

(declare-fun m!155269 () Bool)

(assert (=> b!131535 m!155269))

(declare-fun m!155271 () Bool)

(assert (=> b!131535 m!155271))

(declare-fun m!155273 () Bool)

(assert (=> b!131535 m!155273))

(declare-fun m!155275 () Bool)

(assert (=> b!131535 m!155275))

(declare-fun m!155277 () Bool)

(assert (=> b!131535 m!155277))

(assert (=> b!131535 m!155267))

(declare-fun m!155279 () Bool)

(assert (=> b!131535 m!155279))

(declare-fun m!155281 () Bool)

(assert (=> b!131535 m!155281))

(declare-fun m!155283 () Bool)

(assert (=> b!131535 m!155283))

(declare-fun m!155285 () Bool)

(assert (=> b!131535 m!155285))

(declare-fun m!155287 () Bool)

(assert (=> b!131535 m!155287))

(assert (=> b!131535 m!155281))

(declare-fun m!155289 () Bool)

(assert (=> b!131535 m!155289))

(assert (=> b!131535 m!155275))

(declare-fun m!155291 () Bool)

(assert (=> b!131535 m!155291))

(assert (=> b!131535 m!155269))

(assert (=> b!131530 m!154965))

(assert (=> b!131530 m!154965))

(assert (=> b!131530 m!154967))

(assert (=> bm!14297 d!40187))

(declare-fun d!40189 () Bool)

(declare-fun isEmpty!411 (Option!177) Bool)

(assert (=> d!40189 (= (isDefined!123 (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))) (not (isEmpty!411 (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))))

(declare-fun bs!5472 () Bool)

(assert (= bs!5472 d!40189))

(assert (=> bs!5472 m!154817))

(declare-fun m!155293 () Bool)

(assert (=> bs!5472 m!155293))

(assert (=> b!131109 d!40189))

(declare-fun d!40191 () Bool)

(declare-fun c!24335 () Bool)

(assert (=> d!40191 (= c!24335 (and ((_ is Cons!1684) (toList!839 lt!68164)) (= (_1!1287 (h!2289 (toList!839 lt!68164))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355))))))

(declare-fun e!85778 () Option!177)

(assert (=> d!40191 (= (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) e!85778)))

(declare-fun b!131546 () Bool)

(declare-fun e!85779 () Option!177)

(assert (=> b!131546 (= e!85779 (getValueByKey!171 (t!6099 (toList!839 lt!68164)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131545 () Bool)

(assert (=> b!131545 (= e!85778 e!85779)))

(declare-fun c!24336 () Bool)

(assert (=> b!131545 (= c!24336 (and ((_ is Cons!1684) (toList!839 lt!68164)) (not (= (_1!1287 (h!2289 (toList!839 lt!68164))) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))))

(declare-fun b!131544 () Bool)

(assert (=> b!131544 (= e!85778 (Some!176 (_2!1287 (h!2289 (toList!839 lt!68164)))))))

(declare-fun b!131547 () Bool)

(assert (=> b!131547 (= e!85779 None!175)))

(assert (= (and d!40191 c!24335) b!131544))

(assert (= (and d!40191 (not c!24335)) b!131545))

(assert (= (and b!131545 c!24336) b!131546))

(assert (= (and b!131545 (not c!24336)) b!131547))

(assert (=> b!131546 m!154705))

(declare-fun m!155295 () Bool)

(assert (=> b!131546 m!155295))

(assert (=> b!131109 d!40191))

(declare-fun d!40193 () Bool)

(declare-fun e!85780 () Bool)

(assert (=> d!40193 e!85780))

(declare-fun res!63349 () Bool)

(assert (=> d!40193 (=> (not res!63349) (not e!85780))))

(declare-fun lt!68567 () ListLongMap!1647)

(assert (=> d!40193 (= res!63349 (contains!877 lt!68567 (_1!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68565 () List!1688)

(assert (=> d!40193 (= lt!68567 (ListLongMap!1648 lt!68565))))

(declare-fun lt!68568 () Unit!4103)

(declare-fun lt!68566 () Unit!4103)

(assert (=> d!40193 (= lt!68568 lt!68566)))

(assert (=> d!40193 (= (getValueByKey!171 lt!68565 (_1!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!176 (_2!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40193 (= lt!68566 (lemmaContainsTupThenGetReturnValue!86 lt!68565 (_1!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40193 (= lt!68565 (insertStrictlySorted!89 (toList!839 call!14300) (_1!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40193 (= (+!167 call!14300 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!68567)))

(declare-fun b!131548 () Bool)

(declare-fun res!63348 () Bool)

(assert (=> b!131548 (=> (not res!63348) (not e!85780))))

(assert (=> b!131548 (= res!63348 (= (getValueByKey!171 (toList!839 lt!68567) (_1!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!176 (_2!1287 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!131549 () Bool)

(assert (=> b!131549 (= e!85780 (contains!879 (toList!839 lt!68567) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40193 res!63349) b!131548))

(assert (= (and b!131548 res!63348) b!131549))

(declare-fun m!155297 () Bool)

(assert (=> d!40193 m!155297))

(declare-fun m!155299 () Bool)

(assert (=> d!40193 m!155299))

(declare-fun m!155301 () Bool)

(assert (=> d!40193 m!155301))

(declare-fun m!155303 () Bool)

(assert (=> d!40193 m!155303))

(declare-fun m!155305 () Bool)

(assert (=> b!131548 m!155305))

(declare-fun m!155307 () Bool)

(assert (=> b!131549 m!155307))

(assert (=> b!131233 d!40193))

(declare-fun d!40195 () Bool)

(declare-fun res!63350 () Bool)

(declare-fun e!85781 () Bool)

(assert (=> d!40195 (=> res!63350 e!85781)))

(assert (=> d!40195 (= res!63350 (= (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> d!40195 (= (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000) e!85781)))

(declare-fun b!131550 () Bool)

(declare-fun e!85782 () Bool)

(assert (=> b!131550 (= e!85781 e!85782)))

(declare-fun res!63351 () Bool)

(assert (=> b!131550 (=> (not res!63351) (not e!85782))))

(assert (=> b!131550 (= res!63351 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun b!131551 () Bool)

(assert (=> b!131551 (= e!85782 (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40195 (not res!63350)) b!131550))

(assert (= (and b!131550 res!63351) b!131551))

(assert (=> d!40195 m!154965))

(assert (=> b!131551 m!154705))

(declare-fun m!155309 () Bool)

(assert (=> b!131551 m!155309))

(assert (=> bm!14304 d!40195))

(declare-fun b!131562 () Bool)

(declare-fun res!63360 () Bool)

(declare-fun e!85785 () Bool)

(assert (=> b!131562 (=> (not res!63360) (not e!85785))))

(declare-fun size!2513 (LongMapFixedSize!1084) (_ BitVec 32))

(assert (=> b!131562 (= res!63360 (= (size!2513 newMap!16) (bvadd (_size!591 newMap!16) (bvsdiv (bvadd (extraKeys!2611 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!40197 () Bool)

(declare-fun res!63363 () Bool)

(assert (=> d!40197 (=> (not res!63363) (not e!85785))))

(assert (=> d!40197 (= res!63363 (validMask!0 (mask!7130 newMap!16)))))

(assert (=> d!40197 (= (simpleValid!90 newMap!16) e!85785)))

(declare-fun b!131560 () Bool)

(declare-fun res!63361 () Bool)

(assert (=> b!131560 (=> (not res!63361) (not e!85785))))

(assert (=> b!131560 (= res!63361 (and (= (size!2508 (_values!2825 newMap!16)) (bvadd (mask!7130 newMap!16) #b00000000000000000000000000000001)) (= (size!2507 (_keys!4587 newMap!16)) (size!2508 (_values!2825 newMap!16))) (bvsge (_size!591 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!591 newMap!16) (bvadd (mask!7130 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!131563 () Bool)

(assert (=> b!131563 (= e!85785 (and (bvsge (extraKeys!2611 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2611 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!591 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!131561 () Bool)

(declare-fun res!63362 () Bool)

(assert (=> b!131561 (=> (not res!63362) (not e!85785))))

(assert (=> b!131561 (= res!63362 (bvsge (size!2513 newMap!16) (_size!591 newMap!16)))))

(assert (= (and d!40197 res!63363) b!131560))

(assert (= (and b!131560 res!63361) b!131561))

(assert (= (and b!131561 res!63362) b!131562))

(assert (= (and b!131562 res!63360) b!131563))

(declare-fun m!155311 () Bool)

(assert (=> b!131562 m!155311))

(assert (=> d!40197 m!154991))

(assert (=> b!131561 m!155311))

(assert (=> d!40117 d!40197))

(declare-fun d!40199 () Bool)

(assert (=> d!40199 (isDefined!123 (getValueByKey!171 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun lt!68571 () Unit!4103)

(declare-fun choose!809 (List!1688 (_ BitVec 64)) Unit!4103)

(assert (=> d!40199 (= lt!68571 (choose!809 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun e!85788 () Bool)

(assert (=> d!40199 e!85788))

(declare-fun res!63366 () Bool)

(assert (=> d!40199 (=> (not res!63366) (not e!85788))))

(declare-fun isStrictlySorted!307 (List!1688) Bool)

(assert (=> d!40199 (= res!63366 (isStrictlySorted!307 (toList!839 lt!68164)))))

(assert (=> d!40199 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) lt!68571)))

(declare-fun b!131566 () Bool)

(assert (=> b!131566 (= e!85788 (containsKey!174 (toList!839 lt!68164) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (= (and d!40199 res!63366) b!131566))

(assert (=> d!40199 m!154705))

(assert (=> d!40199 m!154817))

(assert (=> d!40199 m!154817))

(assert (=> d!40199 m!154819))

(assert (=> d!40199 m!154705))

(declare-fun m!155313 () Bool)

(assert (=> d!40199 m!155313))

(declare-fun m!155315 () Bool)

(assert (=> d!40199 m!155315))

(assert (=> b!131566 m!154705))

(assert (=> b!131566 m!154813))

(assert (=> b!131107 d!40199))

(assert (=> b!131107 d!40189))

(assert (=> b!131107 d!40191))

(declare-fun d!40201 () Bool)

(declare-fun e!85790 () Bool)

(assert (=> d!40201 e!85790))

(declare-fun res!63367 () Bool)

(assert (=> d!40201 (=> res!63367 e!85790)))

(declare-fun lt!68573 () Bool)

(assert (=> d!40201 (= res!63367 (not lt!68573))))

(declare-fun lt!68572 () Bool)

(assert (=> d!40201 (= lt!68573 lt!68572)))

(declare-fun lt!68575 () Unit!4103)

(declare-fun e!85789 () Unit!4103)

(assert (=> d!40201 (= lt!68575 e!85789)))

(declare-fun c!24337 () Bool)

(assert (=> d!40201 (= c!24337 lt!68572)))

(assert (=> d!40201 (= lt!68572 (containsKey!174 (toList!839 lt!68351) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!40201 (= (contains!877 lt!68351 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68573)))

(declare-fun b!131567 () Bool)

(declare-fun lt!68574 () Unit!4103)

(assert (=> b!131567 (= e!85789 lt!68574)))

(assert (=> b!131567 (= lt!68574 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 lt!68351) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131567 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!131568 () Bool)

(declare-fun Unit!4120 () Unit!4103)

(assert (=> b!131568 (= e!85789 Unit!4120)))

(declare-fun b!131569 () Bool)

(assert (=> b!131569 (= e!85790 (isDefined!123 (getValueByKey!171 (toList!839 lt!68351) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!40201 c!24337) b!131567))

(assert (= (and d!40201 (not c!24337)) b!131568))

(assert (= (and d!40201 (not res!63367)) b!131569))

(assert (=> d!40201 m!154905))

(declare-fun m!155317 () Bool)

(assert (=> d!40201 m!155317))

(assert (=> b!131567 m!154905))

(declare-fun m!155319 () Bool)

(assert (=> b!131567 m!155319))

(assert (=> b!131567 m!154905))

(assert (=> b!131567 m!155051))

(assert (=> b!131567 m!155051))

(declare-fun m!155321 () Bool)

(assert (=> b!131567 m!155321))

(assert (=> b!131569 m!154905))

(assert (=> b!131569 m!155051))

(assert (=> b!131569 m!155051))

(assert (=> b!131569 m!155321))

(assert (=> b!131319 d!40201))

(assert (=> d!40133 d!40135))

(declare-fun d!40203 () Bool)

(declare-fun e!85793 () Bool)

(assert (=> d!40203 e!85793))

(declare-fun res!63372 () Bool)

(assert (=> d!40203 (=> (not res!63372) (not e!85793))))

(declare-fun lt!68580 () SeekEntryResult!267)

(assert (=> d!40203 (= res!63372 ((_ is Found!267) lt!68580))))

(assert (=> d!40203 (= lt!68580 (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun lt!68581 () Unit!4103)

(declare-fun choose!810 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4103)

(assert (=> d!40203 (= lt!68581 (choose!810 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40203 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40203 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)) lt!68581)))

(declare-fun b!131574 () Bool)

(declare-fun res!63373 () Bool)

(assert (=> b!131574 (=> (not res!63373) (not e!85793))))

(assert (=> b!131574 (= res!63373 (inRange!0 (index!3227 lt!68580) (mask!7130 newMap!16)))))

(declare-fun b!131575 () Bool)

(assert (=> b!131575 (= e!85793 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68580)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(assert (=> b!131575 (and (bvsge (index!3227 lt!68580) #b00000000000000000000000000000000) (bvslt (index!3227 lt!68580) (size!2507 (_keys!4587 newMap!16))))))

(assert (= (and d!40203 res!63372) b!131574))

(assert (= (and b!131574 res!63373) b!131575))

(assert (=> d!40203 m!154705))

(assert (=> d!40203 m!154829))

(assert (=> d!40203 m!154705))

(declare-fun m!155323 () Bool)

(assert (=> d!40203 m!155323))

(assert (=> d!40203 m!154991))

(declare-fun m!155325 () Bool)

(assert (=> b!131574 m!155325))

(declare-fun m!155327 () Bool)

(assert (=> b!131575 m!155327))

(assert (=> bm!14296 d!40203))

(declare-fun d!40205 () Bool)

(assert (=> d!40205 (= (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131261 d!40205))

(declare-fun b!131576 () Bool)

(declare-fun e!85795 () Bool)

(declare-fun call!14374 () Bool)

(assert (=> b!131576 (= e!85795 call!14374)))

(declare-fun bm!14371 () Bool)

(assert (=> bm!14371 (= call!14374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131577 () Bool)

(declare-fun e!85794 () Bool)

(assert (=> b!131577 (= e!85795 e!85794)))

(declare-fun lt!68582 () (_ BitVec 64))

(assert (=> b!131577 (= lt!68582 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!68583 () Unit!4103)

(assert (=> b!131577 (= lt!68583 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!131577 (arrayContainsKey!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) lt!68582 #b00000000000000000000000000000000)))

(declare-fun lt!68584 () Unit!4103)

(assert (=> b!131577 (= lt!68584 lt!68583)))

(declare-fun res!63374 () Bool)

(assert (=> b!131577 (= res!63374 (= (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))) (Found!267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!131577 (=> (not res!63374) (not e!85794))))

(declare-fun b!131578 () Bool)

(declare-fun e!85796 () Bool)

(assert (=> b!131578 (= e!85796 e!85795)))

(declare-fun c!24338 () Bool)

(assert (=> b!131578 (= c!24338 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!40207 () Bool)

(declare-fun res!63375 () Bool)

(assert (=> d!40207 (=> res!63375 e!85796)))

(assert (=> d!40207 (= res!63375 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(assert (=> d!40207 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))) e!85796)))

(declare-fun b!131579 () Bool)

(assert (=> b!131579 (= e!85794 call!14374)))

(assert (= (and d!40207 (not res!63375)) b!131578))

(assert (= (and b!131578 c!24338) b!131577))

(assert (= (and b!131578 (not c!24338)) b!131576))

(assert (= (and b!131577 res!63374) b!131579))

(assert (= (or b!131579 b!131576) bm!14371))

(declare-fun m!155329 () Bool)

(assert (=> bm!14371 m!155329))

(declare-fun m!155331 () Bool)

(assert (=> b!131577 m!155331))

(declare-fun m!155333 () Bool)

(assert (=> b!131577 m!155333))

(declare-fun m!155335 () Bool)

(assert (=> b!131577 m!155335))

(assert (=> b!131577 m!155331))

(declare-fun m!155337 () Bool)

(assert (=> b!131577 m!155337))

(assert (=> b!131578 m!155331))

(assert (=> b!131578 m!155331))

(declare-fun m!155339 () Bool)

(assert (=> b!131578 m!155339))

(assert (=> bm!14310 d!40207))

(declare-fun e!85816 () Bool)

(declare-fun b!131604 () Bool)

(declare-fun lt!68600 () ListLongMap!1647)

(assert (=> b!131604 (= e!85816 (= lt!68600 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131605 () Bool)

(declare-fun e!85811 () Bool)

(assert (=> b!131605 (= e!85811 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131605 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!131606 () Bool)

(declare-fun e!85812 () ListLongMap!1647)

(assert (=> b!131606 (= e!85812 (ListLongMap!1648 Nil!1685))))

(declare-fun b!131607 () Bool)

(declare-fun lt!68603 () Unit!4103)

(declare-fun lt!68605 () Unit!4103)

(assert (=> b!131607 (= lt!68603 lt!68605)))

(declare-fun lt!68601 () (_ BitVec 64))

(declare-fun lt!68599 () ListLongMap!1647)

(declare-fun lt!68604 () V!3465)

(declare-fun lt!68602 () (_ BitVec 64))

(assert (=> b!131607 (not (contains!877 (+!167 lt!68599 (tuple2!2553 lt!68601 lt!68604)) lt!68602))))

(declare-fun addStillNotContains!61 (ListLongMap!1647 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4103)

(assert (=> b!131607 (= lt!68605 (addStillNotContains!61 lt!68599 lt!68601 lt!68604 lt!68602))))

(assert (=> b!131607 (= lt!68602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!131607 (= lt!68604 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131607 (= lt!68601 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!14377 () ListLongMap!1647)

(assert (=> b!131607 (= lt!68599 call!14377)))

(declare-fun e!85813 () ListLongMap!1647)

(assert (=> b!131607 (= e!85813 (+!167 call!14377 (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!131608 () Bool)

(declare-fun isEmpty!412 (ListLongMap!1647) Bool)

(assert (=> b!131608 (= e!85816 (isEmpty!412 lt!68600))))

(declare-fun b!131609 () Bool)

(declare-fun e!85815 () Bool)

(assert (=> b!131609 (= e!85815 e!85816)))

(declare-fun c!24349 () Bool)

(assert (=> b!131609 (= c!24349 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131610 () Bool)

(declare-fun res!63385 () Bool)

(declare-fun e!85817 () Bool)

(assert (=> b!131610 (=> (not res!63385) (not e!85817))))

(assert (=> b!131610 (= res!63385 (not (contains!877 lt!68600 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!40209 () Bool)

(assert (=> d!40209 e!85817))

(declare-fun res!63386 () Bool)

(assert (=> d!40209 (=> (not res!63386) (not e!85817))))

(assert (=> d!40209 (= res!63386 (not (contains!877 lt!68600 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40209 (= lt!68600 e!85812)))

(declare-fun c!24348 () Bool)

(assert (=> d!40209 (= c!24348 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(assert (=> d!40209 (validMask!0 (mask!7130 (v!3176 (underlying!449 thiss!992))))))

(assert (=> d!40209 (= (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))) lt!68600)))

(declare-fun b!131611 () Bool)

(assert (=> b!131611 (= e!85817 e!85815)))

(declare-fun c!24350 () Bool)

(assert (=> b!131611 (= c!24350 e!85811)))

(declare-fun res!63384 () Bool)

(assert (=> b!131611 (=> (not res!63384) (not e!85811))))

(assert (=> b!131611 (= res!63384 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun b!131612 () Bool)

(assert (=> b!131612 (= e!85813 call!14377)))

(declare-fun bm!14374 () Bool)

(assert (=> bm!14374 (= call!14377 (getCurrentListMapNoExtraKeys!134 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (_values!2825 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992))) (extraKeys!2611 (v!3176 (underlying!449 thiss!992))) (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) (minValue!2699 (v!3176 (underlying!449 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131613 () Bool)

(assert (=> b!131613 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(assert (=> b!131613 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2508 (_values!2825 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun e!85814 () Bool)

(assert (=> b!131613 (= e!85814 (= (apply!114 lt!68600 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!131614 () Bool)

(assert (=> b!131614 (= e!85815 e!85814)))

(assert (=> b!131614 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))))))

(declare-fun res!63387 () Bool)

(assert (=> b!131614 (= res!63387 (contains!877 lt!68600 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131614 (=> (not res!63387) (not e!85814))))

(declare-fun b!131615 () Bool)

(assert (=> b!131615 (= e!85812 e!85813)))

(declare-fun c!24347 () Bool)

(assert (=> b!131615 (= c!24347 (validKeyInArray!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!40209 c!24348) b!131606))

(assert (= (and d!40209 (not c!24348)) b!131615))

(assert (= (and b!131615 c!24347) b!131607))

(assert (= (and b!131615 (not c!24347)) b!131612))

(assert (= (or b!131607 b!131612) bm!14374))

(assert (= (and d!40209 res!63386) b!131610))

(assert (= (and b!131610 res!63385) b!131611))

(assert (= (and b!131611 res!63384) b!131605))

(assert (= (and b!131611 c!24350) b!131614))

(assert (= (and b!131611 (not c!24350)) b!131609))

(assert (= (and b!131614 res!63387) b!131613))

(assert (= (and b!131609 c!24349) b!131604))

(assert (= (and b!131609 (not c!24349)) b!131608))

(declare-fun b_lambda!5867 () Bool)

(assert (=> (not b_lambda!5867) (not b!131607)))

(assert (=> b!131607 t!6096))

(declare-fun b_and!8153 () Bool)

(assert (= b_and!8149 (and (=> t!6096 result!3925) b_and!8153)))

(assert (=> b!131607 t!6098))

(declare-fun b_and!8155 () Bool)

(assert (= b_and!8151 (and (=> t!6098 result!3929) b_and!8155)))

(declare-fun b_lambda!5869 () Bool)

(assert (=> (not b_lambda!5869) (not b!131613)))

(assert (=> b!131613 t!6096))

(declare-fun b_and!8157 () Bool)

(assert (= b_and!8153 (and (=> t!6096 result!3925) b_and!8157)))

(assert (=> b!131613 t!6098))

(declare-fun b_and!8159 () Bool)

(assert (= b_and!8155 (and (=> t!6098 result!3929) b_and!8159)))

(declare-fun m!155341 () Bool)

(assert (=> d!40209 m!155341))

(assert (=> d!40209 m!154715))

(assert (=> b!131607 m!154723))

(declare-fun m!155343 () Bool)

(assert (=> b!131607 m!155343))

(declare-fun m!155345 () Bool)

(assert (=> b!131607 m!155345))

(declare-fun m!155347 () Bool)

(assert (=> b!131607 m!155347))

(assert (=> b!131607 m!154907))

(declare-fun m!155349 () Bool)

(assert (=> b!131607 m!155349))

(assert (=> b!131607 m!155343))

(assert (=> b!131607 m!154905))

(assert (=> b!131607 m!154907))

(assert (=> b!131607 m!154723))

(assert (=> b!131607 m!154909))

(declare-fun m!155351 () Bool)

(assert (=> b!131608 m!155351))

(assert (=> b!131614 m!154905))

(assert (=> b!131614 m!154905))

(declare-fun m!155353 () Bool)

(assert (=> b!131614 m!155353))

(assert (=> b!131613 m!154723))

(assert (=> b!131613 m!154907))

(assert (=> b!131613 m!154905))

(assert (=> b!131613 m!154905))

(declare-fun m!155355 () Bool)

(assert (=> b!131613 m!155355))

(assert (=> b!131613 m!154907))

(assert (=> b!131613 m!154723))

(assert (=> b!131613 m!154909))

(declare-fun m!155357 () Bool)

(assert (=> b!131610 m!155357))

(declare-fun m!155359 () Bool)

(assert (=> b!131604 m!155359))

(assert (=> b!131615 m!154905))

(assert (=> b!131615 m!154905))

(assert (=> b!131615 m!154927))

(assert (=> b!131605 m!154905))

(assert (=> b!131605 m!154905))

(assert (=> b!131605 m!154927))

(assert (=> bm!14374 m!155359))

(assert (=> bm!14328 d!40209))

(assert (=> bm!14287 d!40131))

(declare-fun d!40211 () Bool)

(assert (=> d!40211 (= (get!1479 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131241 d!40211))

(declare-fun d!40213 () Bool)

(declare-fun res!63388 () Bool)

(declare-fun e!85818 () Bool)

(assert (=> d!40213 (=> (not res!63388) (not e!85818))))

(assert (=> d!40213 (= res!63388 (simpleValid!90 (v!3176 (underlying!449 thiss!992))))))

(assert (=> d!40213 (= (valid!536 (v!3176 (underlying!449 thiss!992))) e!85818)))

(declare-fun b!131616 () Bool)

(declare-fun res!63389 () Bool)

(assert (=> b!131616 (=> (not res!63389) (not e!85818))))

(assert (=> b!131616 (= res!63389 (= (arrayCountValidKeys!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000000 (size!2507 (_keys!4587 (v!3176 (underlying!449 thiss!992))))) (_size!591 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131617 () Bool)

(declare-fun res!63390 () Bool)

(assert (=> b!131617 (=> (not res!63390) (not e!85818))))

(assert (=> b!131617 (= res!63390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 (v!3176 (underlying!449 thiss!992))) (mask!7130 (v!3176 (underlying!449 thiss!992)))))))

(declare-fun b!131618 () Bool)

(assert (=> b!131618 (= e!85818 (arrayNoDuplicates!0 (_keys!4587 (v!3176 (underlying!449 thiss!992))) #b00000000000000000000000000000000 Nil!1687))))

(assert (= (and d!40213 res!63388) b!131616))

(assert (= (and b!131616 res!63389) b!131617))

(assert (= (and b!131617 res!63390) b!131618))

(declare-fun m!155361 () Bool)

(assert (=> d!40213 m!155361))

(declare-fun m!155363 () Bool)

(assert (=> b!131616 m!155363))

(assert (=> b!131617 m!154711))

(declare-fun m!155365 () Bool)

(assert (=> b!131618 m!155365))

(assert (=> d!40119 d!40213))

(assert (=> b!131228 d!40159))

(assert (=> d!40131 d!40159))

(declare-fun d!40215 () Bool)

(declare-fun res!63391 () Bool)

(declare-fun e!85819 () Bool)

(assert (=> d!40215 (=> (not res!63391) (not e!85819))))

(assert (=> d!40215 (= res!63391 (simpleValid!90 (_2!1288 lt!68273)))))

(assert (=> d!40215 (= (valid!536 (_2!1288 lt!68273)) e!85819)))

(declare-fun b!131619 () Bool)

(declare-fun res!63392 () Bool)

(assert (=> b!131619 (=> (not res!63392) (not e!85819))))

(assert (=> b!131619 (= res!63392 (= (arrayCountValidKeys!0 (_keys!4587 (_2!1288 lt!68273)) #b00000000000000000000000000000000 (size!2507 (_keys!4587 (_2!1288 lt!68273)))) (_size!591 (_2!1288 lt!68273))))))

(declare-fun b!131620 () Bool)

(declare-fun res!63393 () Bool)

(assert (=> b!131620 (=> (not res!63393) (not e!85819))))

(assert (=> b!131620 (= res!63393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 (_2!1288 lt!68273)) (mask!7130 (_2!1288 lt!68273))))))

(declare-fun b!131621 () Bool)

(assert (=> b!131621 (= e!85819 (arrayNoDuplicates!0 (_keys!4587 (_2!1288 lt!68273)) #b00000000000000000000000000000000 Nil!1687))))

(assert (= (and d!40215 res!63391) b!131619))

(assert (= (and b!131619 res!63392) b!131620))

(assert (= (and b!131620 res!63393) b!131621))

(declare-fun m!155367 () Bool)

(assert (=> d!40215 m!155367))

(declare-fun m!155369 () Bool)

(assert (=> b!131619 m!155369))

(declare-fun m!155371 () Bool)

(assert (=> b!131620 m!155371))

(declare-fun m!155373 () Bool)

(assert (=> b!131621 m!155373))

(assert (=> d!40113 d!40215))

(assert (=> d!40113 d!40117))

(declare-fun d!40217 () Bool)

(declare-fun e!85820 () Bool)

(assert (=> d!40217 e!85820))

(declare-fun res!63395 () Bool)

(assert (=> d!40217 (=> (not res!63395) (not e!85820))))

(declare-fun lt!68608 () ListLongMap!1647)

(assert (=> d!40217 (= res!63395 (contains!877 lt!68608 (_1!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!68606 () List!1688)

(assert (=> d!40217 (= lt!68608 (ListLongMap!1648 lt!68606))))

(declare-fun lt!68609 () Unit!4103)

(declare-fun lt!68607 () Unit!4103)

(assert (=> d!40217 (= lt!68609 lt!68607)))

(assert (=> d!40217 (= (getValueByKey!171 lt!68606 (_1!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!176 (_2!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40217 (= lt!68607 (lemmaContainsTupThenGetReturnValue!86 lt!68606 (_1!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40217 (= lt!68606 (insertStrictlySorted!89 (toList!839 e!85571) (_1!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40217 (= (+!167 e!85571 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!68608)))

(declare-fun b!131622 () Bool)

(declare-fun res!63394 () Bool)

(assert (=> b!131622 (=> (not res!63394) (not e!85820))))

(assert (=> b!131622 (= res!63394 (= (getValueByKey!171 (toList!839 lt!68608) (_1!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!176 (_2!1287 (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!131623 () Bool)

(assert (=> b!131623 (= e!85820 (contains!879 (toList!839 lt!68608) (ite c!24249 (ite c!24246 (tuple2!2553 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2553 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!40217 res!63395) b!131622))

(assert (= (and b!131622 res!63394) b!131623))

(declare-fun m!155375 () Bool)

(assert (=> d!40217 m!155375))

(declare-fun m!155377 () Bool)

(assert (=> d!40217 m!155377))

(declare-fun m!155379 () Bool)

(assert (=> d!40217 m!155379))

(declare-fun m!155381 () Bool)

(assert (=> d!40217 m!155381))

(declare-fun m!155383 () Bool)

(assert (=> b!131622 m!155383))

(declare-fun m!155385 () Bool)

(assert (=> b!131623 m!155385))

(assert (=> bm!14300 d!40217))

(declare-fun d!40219 () Bool)

(assert (=> d!40219 (= (+!167 (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!516 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) lt!68252 (zeroValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2842 newMap!16)))))

(declare-fun lt!68612 () Unit!4103)

(declare-fun choose!811 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 V!3465 Int) Unit!4103)

(assert (=> d!40219 (= lt!68612 (choose!811 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68252 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40219 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40219 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) lt!68252 (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (get!1476 (select (arr!2241 (_values!2825 (v!3176 (underlying!449 thiss!992)))) from!355) (dynLambda!423 (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2842 newMap!16)) lt!68612)))

(declare-fun bs!5473 () Bool)

(assert (= bs!5473 d!40219))

(assert (=> bs!5473 m!154725))

(declare-fun m!155387 () Bool)

(assert (=> bs!5473 m!155387))

(assert (=> bs!5473 m!154851))

(assert (=> bs!5473 m!154851))

(declare-fun m!155389 () Bool)

(assert (=> bs!5473 m!155389))

(assert (=> bs!5473 m!154725))

(declare-fun m!155391 () Bool)

(assert (=> bs!5473 m!155391))

(assert (=> bs!5473 m!154991))

(assert (=> b!131212 d!40219))

(declare-fun d!40221 () Bool)

(assert (=> d!40221 (= (inRange!0 (ite c!24248 (ite c!24240 (index!3227 lt!68251) (ite c!24241 (index!3226 lt!68260) (index!3229 lt!68260))) (ite c!24239 (index!3227 lt!68277) (ite c!24244 (index!3226 lt!68272) (index!3229 lt!68272)))) (mask!7130 newMap!16)) (and (bvsge (ite c!24248 (ite c!24240 (index!3227 lt!68251) (ite c!24241 (index!3226 lt!68260) (index!3229 lt!68260))) (ite c!24239 (index!3227 lt!68277) (ite c!24244 (index!3226 lt!68272) (index!3229 lt!68272)))) #b00000000000000000000000000000000) (bvslt (ite c!24248 (ite c!24240 (index!3227 lt!68251) (ite c!24241 (index!3226 lt!68260) (index!3229 lt!68260))) (ite c!24239 (index!3227 lt!68277) (ite c!24244 (index!3226 lt!68272) (index!3229 lt!68272)))) (bvadd (mask!7130 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14299 d!40221))

(declare-fun d!40223 () Bool)

(assert (=> d!40223 (= (apply!114 (+!167 lt!68335 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68336) (get!1480 (getValueByKey!171 (toList!839 (+!167 lt!68335 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68336)))))

(declare-fun bs!5474 () Bool)

(assert (= bs!5474 d!40223))

(declare-fun m!155393 () Bool)

(assert (=> bs!5474 m!155393))

(assert (=> bs!5474 m!155393))

(declare-fun m!155395 () Bool)

(assert (=> bs!5474 m!155395))

(assert (=> b!131325 d!40223))

(declare-fun d!40225 () Bool)

(declare-fun e!85822 () Bool)

(assert (=> d!40225 e!85822))

(declare-fun res!63396 () Bool)

(assert (=> d!40225 (=> res!63396 e!85822)))

(declare-fun lt!68614 () Bool)

(assert (=> d!40225 (= res!63396 (not lt!68614))))

(declare-fun lt!68613 () Bool)

(assert (=> d!40225 (= lt!68614 lt!68613)))

(declare-fun lt!68616 () Unit!4103)

(declare-fun e!85821 () Unit!4103)

(assert (=> d!40225 (= lt!68616 e!85821)))

(declare-fun c!24351 () Bool)

(assert (=> d!40225 (= c!24351 lt!68613)))

(assert (=> d!40225 (= lt!68613 (containsKey!174 (toList!839 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68347))))

(assert (=> d!40225 (= (contains!877 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68347) lt!68614)))

(declare-fun b!131624 () Bool)

(declare-fun lt!68615 () Unit!4103)

(assert (=> b!131624 (= e!85821 lt!68615)))

(assert (=> b!131624 (= lt!68615 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!839 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68347))))

(assert (=> b!131624 (isDefined!123 (getValueByKey!171 (toList!839 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68347))))

(declare-fun b!131625 () Bool)

(declare-fun Unit!4121 () Unit!4103)

(assert (=> b!131625 (= e!85821 Unit!4121)))

(declare-fun b!131626 () Bool)

(assert (=> b!131626 (= e!85822 (isDefined!123 (getValueByKey!171 (toList!839 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68347)))))

(assert (= (and d!40225 c!24351) b!131624))

(assert (= (and d!40225 (not c!24351)) b!131625))

(assert (= (and d!40225 (not res!63396)) b!131626))

(declare-fun m!155397 () Bool)

(assert (=> d!40225 m!155397))

(declare-fun m!155399 () Bool)

(assert (=> b!131624 m!155399))

(declare-fun m!155401 () Bool)

(assert (=> b!131624 m!155401))

(assert (=> b!131624 m!155401))

(declare-fun m!155403 () Bool)

(assert (=> b!131624 m!155403))

(assert (=> b!131626 m!155401))

(assert (=> b!131626 m!155401))

(assert (=> b!131626 m!155403))

(assert (=> b!131325 d!40225))

(declare-fun d!40227 () Bool)

(assert (=> d!40227 (= (apply!114 (+!167 lt!68349 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68348) (get!1480 (getValueByKey!171 (toList!839 (+!167 lt!68349 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68348)))))

(declare-fun bs!5475 () Bool)

(assert (= bs!5475 d!40227))

(declare-fun m!155405 () Bool)

(assert (=> bs!5475 m!155405))

(assert (=> bs!5475 m!155405))

(declare-fun m!155407 () Bool)

(assert (=> bs!5475 m!155407))

(assert (=> b!131325 d!40227))

(declare-fun d!40229 () Bool)

(assert (=> d!40229 (= (apply!114 (+!167 lt!68349 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68348) (apply!114 lt!68349 lt!68348))))

(declare-fun lt!68619 () Unit!4103)

(declare-fun choose!812 (ListLongMap!1647 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4103)

(assert (=> d!40229 (= lt!68619 (choose!812 lt!68349 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68348))))

(declare-fun e!85825 () Bool)

(assert (=> d!40229 e!85825))

(declare-fun res!63399 () Bool)

(assert (=> d!40229 (=> (not res!63399) (not e!85825))))

(assert (=> d!40229 (= res!63399 (contains!877 lt!68349 lt!68348))))

(assert (=> d!40229 (= (addApplyDifferent!90 lt!68349 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68348) lt!68619)))

(declare-fun b!131630 () Bool)

(assert (=> b!131630 (= e!85825 (not (= lt!68348 lt!68338)))))

(assert (= (and d!40229 res!63399) b!131630))

(declare-fun m!155409 () Bool)

(assert (=> d!40229 m!155409))

(assert (=> d!40229 m!154941))

(assert (=> d!40229 m!154957))

(declare-fun m!155411 () Bool)

(assert (=> d!40229 m!155411))

(assert (=> d!40229 m!154941))

(assert (=> d!40229 m!154931))

(assert (=> b!131325 d!40229))

(assert (=> b!131325 d!40209))

(declare-fun d!40231 () Bool)

(declare-fun e!85826 () Bool)

(assert (=> d!40231 e!85826))

(declare-fun res!63401 () Bool)

(assert (=> d!40231 (=> (not res!63401) (not e!85826))))

(declare-fun lt!68622 () ListLongMap!1647)

(assert (=> d!40231 (= res!63401 (contains!877 lt!68622 (_1!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun lt!68620 () List!1688)

(assert (=> d!40231 (= lt!68622 (ListLongMap!1648 lt!68620))))

(declare-fun lt!68623 () Unit!4103)

(declare-fun lt!68621 () Unit!4103)

(assert (=> d!40231 (= lt!68623 lt!68621)))

(assert (=> d!40231 (= (getValueByKey!171 lt!68620 (_1!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40231 (= lt!68621 (lemmaContainsTupThenGetReturnValue!86 lt!68620 (_1!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40231 (= lt!68620 (insertStrictlySorted!89 (toList!839 lt!68335) (_1!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40231 (= (+!167 lt!68335 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68622)))

(declare-fun b!131631 () Bool)

(declare-fun res!63400 () Bool)

(assert (=> b!131631 (=> (not res!63400) (not e!85826))))

(assert (=> b!131631 (= res!63400 (= (getValueByKey!171 (toList!839 lt!68622) (_1!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun b!131632 () Bool)

(assert (=> b!131632 (= e!85826 (contains!879 (toList!839 lt!68622) (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(assert (= (and d!40231 res!63401) b!131631))

(assert (= (and b!131631 res!63400) b!131632))

(declare-fun m!155413 () Bool)

(assert (=> d!40231 m!155413))

(declare-fun m!155415 () Bool)

(assert (=> d!40231 m!155415))

(declare-fun m!155417 () Bool)

(assert (=> d!40231 m!155417))

(declare-fun m!155419 () Bool)

(assert (=> d!40231 m!155419))

(declare-fun m!155421 () Bool)

(assert (=> b!131631 m!155421))

(declare-fun m!155423 () Bool)

(assert (=> b!131632 m!155423))

(assert (=> b!131325 d!40231))

(declare-fun d!40233 () Bool)

(declare-fun e!85827 () Bool)

(assert (=> d!40233 e!85827))

(declare-fun res!63403 () Bool)

(assert (=> d!40233 (=> (not res!63403) (not e!85827))))

(declare-fun lt!68626 () ListLongMap!1647)

(assert (=> d!40233 (= res!63403 (contains!877 lt!68626 (_1!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun lt!68624 () List!1688)

(assert (=> d!40233 (= lt!68626 (ListLongMap!1648 lt!68624))))

(declare-fun lt!68627 () Unit!4103)

(declare-fun lt!68625 () Unit!4103)

(assert (=> d!40233 (= lt!68627 lt!68625)))

(assert (=> d!40233 (= (getValueByKey!171 lt!68624 (_1!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40233 (= lt!68625 (lemmaContainsTupThenGetReturnValue!86 lt!68624 (_1!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40233 (= lt!68624 (insertStrictlySorted!89 (toList!839 lt!68331) (_1!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40233 (= (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68626)))

(declare-fun b!131633 () Bool)

(declare-fun res!63402 () Bool)

(assert (=> b!131633 (=> (not res!63402) (not e!85827))))

(assert (=> b!131633 (= res!63402 (= (getValueByKey!171 (toList!839 lt!68626) (_1!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun b!131634 () Bool)

(assert (=> b!131634 (= e!85827 (contains!879 (toList!839 lt!68626) (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(assert (= (and d!40233 res!63403) b!131633))

(assert (= (and b!131633 res!63402) b!131634))

(declare-fun m!155425 () Bool)

(assert (=> d!40233 m!155425))

(declare-fun m!155427 () Bool)

(assert (=> d!40233 m!155427))

(declare-fun m!155429 () Bool)

(assert (=> d!40233 m!155429))

(declare-fun m!155431 () Bool)

(assert (=> d!40233 m!155431))

(declare-fun m!155433 () Bool)

(assert (=> b!131633 m!155433))

(declare-fun m!155435 () Bool)

(assert (=> b!131634 m!155435))

(assert (=> b!131325 d!40233))

(declare-fun d!40235 () Bool)

(assert (=> d!40235 (contains!877 (+!167 lt!68331 (tuple2!2553 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68347)))

(declare-fun lt!68630 () Unit!4103)

(declare-fun choose!813 (ListLongMap!1647 (_ BitVec 64) V!3465 (_ BitVec 64)) Unit!4103)

(assert (=> d!40235 (= lt!68630 (choose!813 lt!68331 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68347))))

(assert (=> d!40235 (contains!877 lt!68331 lt!68347)))

(assert (=> d!40235 (= (addStillContains!90 lt!68331 lt!68350 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68347) lt!68630)))

(declare-fun bs!5476 () Bool)

(assert (= bs!5476 d!40235))

(assert (=> bs!5476 m!154935))

(assert (=> bs!5476 m!154935))

(assert (=> bs!5476 m!154937))

(declare-fun m!155437 () Bool)

(assert (=> bs!5476 m!155437))

(declare-fun m!155439 () Bool)

(assert (=> bs!5476 m!155439))

(assert (=> b!131325 d!40235))

(declare-fun d!40237 () Bool)

(assert (=> d!40237 (= (apply!114 lt!68349 lt!68348) (get!1480 (getValueByKey!171 (toList!839 lt!68349) lt!68348)))))

(declare-fun bs!5477 () Bool)

(assert (= bs!5477 d!40237))

(declare-fun m!155441 () Bool)

(assert (=> bs!5477 m!155441))

(assert (=> bs!5477 m!155441))

(declare-fun m!155443 () Bool)

(assert (=> bs!5477 m!155443))

(assert (=> b!131325 d!40237))

(declare-fun d!40239 () Bool)

(assert (=> d!40239 (= (apply!114 (+!167 lt!68333 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68339) (apply!114 lt!68333 lt!68339))))

(declare-fun lt!68631 () Unit!4103)

(assert (=> d!40239 (= lt!68631 (choose!812 lt!68333 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68339))))

(declare-fun e!85828 () Bool)

(assert (=> d!40239 e!85828))

(declare-fun res!63404 () Bool)

(assert (=> d!40239 (=> (not res!63404) (not e!85828))))

(assert (=> d!40239 (= res!63404 (contains!877 lt!68333 lt!68339))))

(assert (=> d!40239 (= (addApplyDifferent!90 lt!68333 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68339) lt!68631)))

(declare-fun b!131636 () Bool)

(assert (=> b!131636 (= e!85828 (not (= lt!68339 lt!68341)))))

(assert (= (and d!40239 res!63404) b!131636))

(declare-fun m!155445 () Bool)

(assert (=> d!40239 m!155445))

(assert (=> d!40239 m!154933))

(assert (=> d!40239 m!154945))

(declare-fun m!155447 () Bool)

(assert (=> d!40239 m!155447))

(assert (=> d!40239 m!154933))

(assert (=> d!40239 m!154939))

(assert (=> b!131325 d!40239))

(declare-fun d!40241 () Bool)

(assert (=> d!40241 (= (apply!114 lt!68335 lt!68336) (get!1480 (getValueByKey!171 (toList!839 lt!68335) lt!68336)))))

(declare-fun bs!5478 () Bool)

(assert (= bs!5478 d!40241))

(declare-fun m!155449 () Bool)

(assert (=> bs!5478 m!155449))

(assert (=> bs!5478 m!155449))

(declare-fun m!155451 () Bool)

(assert (=> bs!5478 m!155451))

(assert (=> b!131325 d!40241))

(declare-fun d!40243 () Bool)

(declare-fun e!85829 () Bool)

(assert (=> d!40243 e!85829))

(declare-fun res!63406 () Bool)

(assert (=> d!40243 (=> (not res!63406) (not e!85829))))

(declare-fun lt!68634 () ListLongMap!1647)

(assert (=> d!40243 (= res!63406 (contains!877 lt!68634 (_1!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun lt!68632 () List!1688)

(assert (=> d!40243 (= lt!68634 (ListLongMap!1648 lt!68632))))

(declare-fun lt!68635 () Unit!4103)

(declare-fun lt!68633 () Unit!4103)

(assert (=> d!40243 (= lt!68635 lt!68633)))

(assert (=> d!40243 (= (getValueByKey!171 lt!68632 (_1!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40243 (= lt!68633 (lemmaContainsTupThenGetReturnValue!86 lt!68632 (_1!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40243 (= lt!68632 (insertStrictlySorted!89 (toList!839 lt!68333) (_1!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40243 (= (+!167 lt!68333 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68634)))

(declare-fun b!131637 () Bool)

(declare-fun res!63405 () Bool)

(assert (=> b!131637 (=> (not res!63405) (not e!85829))))

(assert (=> b!131637 (= res!63405 (= (getValueByKey!171 (toList!839 lt!68634) (_1!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun b!131638 () Bool)

(assert (=> b!131638 (= e!85829 (contains!879 (toList!839 lt!68634) (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(assert (= (and d!40243 res!63406) b!131637))

(assert (= (and b!131637 res!63405) b!131638))

(declare-fun m!155453 () Bool)

(assert (=> d!40243 m!155453))

(declare-fun m!155455 () Bool)

(assert (=> d!40243 m!155455))

(declare-fun m!155457 () Bool)

(assert (=> d!40243 m!155457))

(declare-fun m!155459 () Bool)

(assert (=> d!40243 m!155459))

(declare-fun m!155461 () Bool)

(assert (=> b!131637 m!155461))

(declare-fun m!155463 () Bool)

(assert (=> b!131638 m!155463))

(assert (=> b!131325 d!40243))

(declare-fun d!40245 () Bool)

(declare-fun e!85830 () Bool)

(assert (=> d!40245 e!85830))

(declare-fun res!63408 () Bool)

(assert (=> d!40245 (=> (not res!63408) (not e!85830))))

(declare-fun lt!68638 () ListLongMap!1647)

(assert (=> d!40245 (= res!63408 (contains!877 lt!68638 (_1!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun lt!68636 () List!1688)

(assert (=> d!40245 (= lt!68638 (ListLongMap!1648 lt!68636))))

(declare-fun lt!68639 () Unit!4103)

(declare-fun lt!68637 () Unit!4103)

(assert (=> d!40245 (= lt!68639 lt!68637)))

(assert (=> d!40245 (= (getValueByKey!171 lt!68636 (_1!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40245 (= lt!68637 (lemmaContainsTupThenGetReturnValue!86 lt!68636 (_1!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40245 (= lt!68636 (insertStrictlySorted!89 (toList!839 lt!68349) (_1!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40245 (= (+!167 lt!68349 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68638)))

(declare-fun b!131639 () Bool)

(declare-fun res!63407 () Bool)

(assert (=> b!131639 (=> (not res!63407) (not e!85830))))

(assert (=> b!131639 (= res!63407 (= (getValueByKey!171 (toList!839 lt!68638) (_1!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun b!131640 () Bool)

(assert (=> b!131640 (= e!85830 (contains!879 (toList!839 lt!68638) (tuple2!2553 lt!68338 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(assert (= (and d!40245 res!63408) b!131639))

(assert (= (and b!131639 res!63407) b!131640))

(declare-fun m!155465 () Bool)

(assert (=> d!40245 m!155465))

(declare-fun m!155467 () Bool)

(assert (=> d!40245 m!155467))

(declare-fun m!155469 () Bool)

(assert (=> d!40245 m!155469))

(declare-fun m!155471 () Bool)

(assert (=> d!40245 m!155471))

(declare-fun m!155473 () Bool)

(assert (=> b!131639 m!155473))

(declare-fun m!155475 () Bool)

(assert (=> b!131640 m!155475))

(assert (=> b!131325 d!40245))

(declare-fun d!40247 () Bool)

(assert (=> d!40247 (= (apply!114 (+!167 lt!68333 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68339) (get!1480 (getValueByKey!171 (toList!839 (+!167 lt!68333 (tuple2!2553 lt!68341 (zeroValue!2699 (v!3176 (underlying!449 thiss!992)))))) lt!68339)))))

(declare-fun bs!5479 () Bool)

(assert (= bs!5479 d!40247))

(declare-fun m!155477 () Bool)

(assert (=> bs!5479 m!155477))

(assert (=> bs!5479 m!155477))

(declare-fun m!155479 () Bool)

(assert (=> bs!5479 m!155479))

(assert (=> b!131325 d!40247))

(declare-fun d!40249 () Bool)

(assert (=> d!40249 (= (apply!114 (+!167 lt!68335 (tuple2!2553 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68336) (apply!114 lt!68335 lt!68336))))

(declare-fun lt!68640 () Unit!4103)

(assert (=> d!40249 (= lt!68640 (choose!812 lt!68335 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68336))))

(declare-fun e!85831 () Bool)

(assert (=> d!40249 e!85831))

(declare-fun res!63409 () Bool)

(assert (=> d!40249 (=> (not res!63409) (not e!85831))))

(assert (=> d!40249 (= res!63409 (contains!877 lt!68335 lt!68336))))

(assert (=> d!40249 (= (addApplyDifferent!90 lt!68335 lt!68352 (minValue!2699 (v!3176 (underlying!449 thiss!992))) lt!68336) lt!68640)))

(declare-fun b!131641 () Bool)

(assert (=> b!131641 (= e!85831 (not (= lt!68336 lt!68352)))))

(assert (= (and d!40249 res!63409) b!131641))

(declare-fun m!155481 () Bool)

(assert (=> d!40249 m!155481))

(assert (=> d!40249 m!154947))

(assert (=> d!40249 m!154949))

(declare-fun m!155483 () Bool)

(assert (=> d!40249 m!155483))

(assert (=> d!40249 m!154947))

(assert (=> d!40249 m!154943))

(assert (=> b!131325 d!40249))

(declare-fun d!40251 () Bool)

(assert (=> d!40251 (= (apply!114 lt!68333 lt!68339) (get!1480 (getValueByKey!171 (toList!839 lt!68333) lt!68339)))))

(declare-fun bs!5480 () Bool)

(assert (= bs!5480 d!40251))

(declare-fun m!155485 () Bool)

(assert (=> bs!5480 m!155485))

(assert (=> bs!5480 m!155485))

(declare-fun m!155487 () Bool)

(assert (=> bs!5480 m!155487))

(assert (=> b!131325 d!40251))

(declare-fun b!131642 () Bool)

(declare-fun c!24352 () Bool)

(declare-fun lt!68641 () (_ BitVec 64))

(assert (=> b!131642 (= c!24352 (= lt!68641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85834 () SeekEntryResult!267)

(declare-fun e!85833 () SeekEntryResult!267)

(assert (=> b!131642 (= e!85834 e!85833)))

(declare-fun b!131643 () Bool)

(declare-fun lt!68643 () SeekEntryResult!267)

(assert (=> b!131643 (= e!85834 (Found!267 (index!3228 lt!68643)))))

(declare-fun b!131644 () Bool)

(assert (=> b!131644 (= e!85833 (seekKeyOrZeroReturnVacant!0 (x!15406 lt!68643) (index!3228 lt!68643) (index!3228 lt!68643) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun d!40253 () Bool)

(declare-fun lt!68642 () SeekEntryResult!267)

(assert (=> d!40253 (and (or ((_ is Undefined!267) lt!68642) (not ((_ is Found!267) lt!68642)) (and (bvsge (index!3227 lt!68642) #b00000000000000000000000000000000) (bvslt (index!3227 lt!68642) (size!2507 (_keys!4587 newMap!16))))) (or ((_ is Undefined!267) lt!68642) ((_ is Found!267) lt!68642) (not ((_ is MissingZero!267) lt!68642)) (and (bvsge (index!3226 lt!68642) #b00000000000000000000000000000000) (bvslt (index!3226 lt!68642) (size!2507 (_keys!4587 newMap!16))))) (or ((_ is Undefined!267) lt!68642) ((_ is Found!267) lt!68642) ((_ is MissingZero!267) lt!68642) (not ((_ is MissingVacant!267) lt!68642)) (and (bvsge (index!3229 lt!68642) #b00000000000000000000000000000000) (bvslt (index!3229 lt!68642) (size!2507 (_keys!4587 newMap!16))))) (or ((_ is Undefined!267) lt!68642) (ite ((_ is Found!267) lt!68642) (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3227 lt!68642)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)) (ite ((_ is MissingZero!267) lt!68642) (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3226 lt!68642)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!267) lt!68642) (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3229 lt!68642)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!85832 () SeekEntryResult!267)

(assert (=> d!40253 (= lt!68642 e!85832)))

(declare-fun c!24353 () Bool)

(assert (=> d!40253 (= c!24353 (and ((_ is Intermediate!267) lt!68643) (undefined!1079 lt!68643)))))

(assert (=> d!40253 (= lt!68643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (mask!7130 newMap!16)) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(assert (=> d!40253 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40253 (= (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)) lt!68642)))

(declare-fun b!131645 () Bool)

(assert (=> b!131645 (= e!85832 e!85834)))

(assert (=> b!131645 (= lt!68641 (select (arr!2240 (_keys!4587 newMap!16)) (index!3228 lt!68643)))))

(declare-fun c!24354 () Bool)

(assert (=> b!131645 (= c!24354 (= lt!68641 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355)))))

(declare-fun b!131646 () Bool)

(assert (=> b!131646 (= e!85833 (MissingZero!267 (index!3228 lt!68643)))))

(declare-fun b!131647 () Bool)

(assert (=> b!131647 (= e!85832 Undefined!267)))

(assert (= (and d!40253 c!24353) b!131647))

(assert (= (and d!40253 (not c!24353)) b!131645))

(assert (= (and b!131645 c!24354) b!131643))

(assert (= (and b!131645 (not c!24354)) b!131642))

(assert (= (and b!131642 c!24352) b!131646))

(assert (= (and b!131642 (not c!24352)) b!131644))

(assert (=> b!131644 m!154705))

(declare-fun m!155489 () Bool)

(assert (=> b!131644 m!155489))

(assert (=> d!40253 m!154705))

(declare-fun m!155491 () Bool)

(assert (=> d!40253 m!155491))

(assert (=> d!40253 m!154991))

(declare-fun m!155493 () Bool)

(assert (=> d!40253 m!155493))

(assert (=> d!40253 m!155491))

(assert (=> d!40253 m!154705))

(declare-fun m!155495 () Bool)

(assert (=> d!40253 m!155495))

(declare-fun m!155497 () Bool)

(assert (=> d!40253 m!155497))

(declare-fun m!155499 () Bool)

(assert (=> d!40253 m!155499))

(declare-fun m!155501 () Bool)

(assert (=> b!131645 m!155501))

(assert (=> bm!14284 d!40253))

(assert (=> b!131235 d!40253))

(declare-fun b!131664 () Bool)

(declare-fun e!85845 () Bool)

(declare-fun call!14383 () Bool)

(assert (=> b!131664 (= e!85845 (not call!14383))))

(declare-fun b!131665 () Bool)

(declare-fun e!85846 () Bool)

(declare-fun lt!68648 () SeekEntryResult!267)

(assert (=> b!131665 (= e!85846 ((_ is Undefined!267) lt!68648))))

(declare-fun b!131666 () Bool)

(declare-fun e!85844 () Bool)

(assert (=> b!131666 (= e!85844 e!85845)))

(declare-fun res!63419 () Bool)

(declare-fun call!14382 () Bool)

(assert (=> b!131666 (= res!63419 call!14382)))

(assert (=> b!131666 (=> (not res!63419) (not e!85845))))

(declare-fun b!131667 () Bool)

(declare-fun res!63420 () Bool)

(declare-fun e!85843 () Bool)

(assert (=> b!131667 (=> (not res!63420) (not e!85843))))

(assert (=> b!131667 (= res!63420 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3229 lt!68648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131667 (and (bvsge (index!3229 lt!68648) #b00000000000000000000000000000000) (bvslt (index!3229 lt!68648) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun c!24360 () Bool)

(declare-fun bm!14379 () Bool)

(assert (=> bm!14379 (= call!14382 (inRange!0 (ite c!24360 (index!3226 lt!68648) (index!3229 lt!68648)) (mask!7130 newMap!16)))))

(declare-fun d!40255 () Bool)

(assert (=> d!40255 e!85844))

(assert (=> d!40255 (= c!24360 ((_ is MissingZero!267) lt!68648))))

(assert (=> d!40255 (= lt!68648 (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun lt!68649 () Unit!4103)

(declare-fun choose!814 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3465 V!3465 (_ BitVec 64) Int) Unit!4103)

(assert (=> d!40255 (= lt!68649 (choose!814 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)))))

(assert (=> d!40255 (validMask!0 (mask!7130 newMap!16))))

(assert (=> d!40255 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!59 (_keys!4587 newMap!16) (_values!2825 newMap!16) (mask!7130 newMap!16) (extraKeys!2611 newMap!16) (zeroValue!2699 newMap!16) (minValue!2699 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) (defaultEntry!2842 newMap!16)) lt!68649)))

(declare-fun b!131668 () Bool)

(assert (=> b!131668 (= e!85844 e!85846)))

(declare-fun c!24359 () Bool)

(assert (=> b!131668 (= c!24359 ((_ is MissingVacant!267) lt!68648))))

(declare-fun b!131669 () Bool)

(assert (=> b!131669 (= e!85843 (not call!14383))))

(declare-fun b!131670 () Bool)

(declare-fun res!63421 () Bool)

(assert (=> b!131670 (=> (not res!63421) (not e!85843))))

(assert (=> b!131670 (= res!63421 call!14382)))

(assert (=> b!131670 (= e!85846 e!85843)))

(declare-fun b!131671 () Bool)

(assert (=> b!131671 (and (bvsge (index!3226 lt!68648) #b00000000000000000000000000000000) (bvslt (index!3226 lt!68648) (size!2507 (_keys!4587 newMap!16))))))

(declare-fun res!63418 () Bool)

(assert (=> b!131671 (= res!63418 (= (select (arr!2240 (_keys!4587 newMap!16)) (index!3226 lt!68648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131671 (=> (not res!63418) (not e!85845))))

(declare-fun bm!14380 () Bool)

(assert (=> bm!14380 (= call!14383 (arrayContainsKey!0 (_keys!4587 newMap!16) (select (arr!2240 (_keys!4587 (v!3176 (underlying!449 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!40255 c!24360) b!131666))

(assert (= (and d!40255 (not c!24360)) b!131668))

(assert (= (and b!131666 res!63419) b!131671))

(assert (= (and b!131671 res!63418) b!131664))

(assert (= (and b!131668 c!24359) b!131670))

(assert (= (and b!131668 (not c!24359)) b!131665))

(assert (= (and b!131670 res!63421) b!131667))

(assert (= (and b!131667 res!63420) b!131669))

(assert (= (or b!131666 b!131670) bm!14379))

(assert (= (or b!131664 b!131669) bm!14380))

(assert (=> bm!14380 m!154705))

(assert (=> bm!14380 m!154849))

(declare-fun m!155503 () Bool)

(assert (=> b!131671 m!155503))

(declare-fun m!155505 () Bool)

(assert (=> bm!14379 m!155505))

(assert (=> d!40255 m!154705))

(assert (=> d!40255 m!154829))

(assert (=> d!40255 m!154705))

(declare-fun m!155507 () Bool)

(assert (=> d!40255 m!155507))

(assert (=> d!40255 m!154991))

(declare-fun m!155509 () Bool)

(assert (=> b!131667 m!155509))

(assert (=> bm!14306 d!40255))

(declare-fun d!40257 () Bool)

(declare-fun e!85847 () Bool)

(assert (=> d!40257 e!85847))

(declare-fun res!63423 () Bool)

(assert (=> d!40257 (=> (not res!63423) (not e!85847))))

(declare-fun lt!68652 () ListLongMap!1647)

(assert (=> d!40257 (= res!63423 (contains!877 lt!68652 (_1!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(declare-fun lt!68650 () List!1688)

(assert (=> d!40257 (= lt!68652 (ListLongMap!1648 lt!68650))))

(declare-fun lt!68653 () Unit!4103)

(declare-fun lt!68651 () Unit!4103)

(assert (=> d!40257 (= lt!68653 lt!68651)))

(assert (=> d!40257 (= (getValueByKey!171 lt!68650 (_1!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40257 (= lt!68651 (lemmaContainsTupThenGetReturnValue!86 lt!68650 (_1!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40257 (= lt!68650 (insertStrictlySorted!89 (toList!839 call!14329) (_1!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) (_2!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))))))

(assert (=> d!40257 (= (+!167 call!14329 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))) lt!68652)))

(declare-fun b!131672 () Bool)

(declare-fun res!63422 () Bool)

(assert (=> b!131672 (=> (not res!63422) (not e!85847))))

(assert (=> b!131672 (= res!63422 (= (getValueByKey!171 (toList!839 lt!68652) (_1!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992)))))) (Some!176 (_2!1287 (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))))

(declare-fun b!131673 () Bool)

(assert (=> b!131673 (= e!85847 (contains!879 (toList!839 lt!68652) (tuple2!2553 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2699 (v!3176 (underlying!449 thiss!992))))))))

(assert (= (and d!40257 res!63423) b!131672))

(assert (= (and b!131672 res!63422) b!131673))

(declare-fun m!155511 () Bool)

(assert (=> d!40257 m!155511))

(declare-fun m!155513 () Bool)

(assert (=> d!40257 m!155513))

(declare-fun m!155515 () Bool)

(assert (=> d!40257 m!155515))

(declare-fun m!155517 () Bool)

(assert (=> d!40257 m!155517))

(declare-fun m!155519 () Bool)

(assert (=> b!131672 m!155519))

(declare-fun m!155521 () Bool)

(assert (=> b!131673 m!155521))

(assert (=> b!131321 d!40257))

(declare-fun b!131674 () Bool)

(declare-fun e!85849 () Bool)

(declare-fun call!14384 () Bool)

(assert (=> b!131674 (= e!85849 call!14384)))

(declare-fun bm!14381 () Bool)

(assert (=> bm!14381 (= call!14384 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4587 newMap!16) (mask!7130 newMap!16)))))

(declare-fun b!131675 () Bool)

(declare-fun e!85848 () Bool)

(assert (=> b!131675 (= e!85849 e!85848)))

(declare-fun lt!68654 () (_ BitVec 64))

(assert (=> b!131675 (= lt!68654 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68655 () Unit!4103)

(assert (=> b!131675 (= lt!68655 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4587 newMap!16) lt!68654 #b00000000000000000000000000000000))))

(assert (=> b!131675 (arrayContainsKey!0 (_keys!4587 newMap!16) lt!68654 #b00000000000000000000000000000000)))

(declare-fun lt!68656 () Unit!4103)

(assert (=> b!131675 (= lt!68656 lt!68655)))

(declare-fun res!63424 () Bool)

(assert (=> b!131675 (= res!63424 (= (seekEntryOrOpen!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000) (_keys!4587 newMap!16) (mask!7130 newMap!16)) (Found!267 #b00000000000000000000000000000000)))))

(assert (=> b!131675 (=> (not res!63424) (not e!85848))))

(declare-fun b!131676 () Bool)

(declare-fun e!85850 () Bool)

(assert (=> b!131676 (= e!85850 e!85849)))

(declare-fun c!24361 () Bool)

(assert (=> b!131676 (= c!24361 (validKeyInArray!0 (select (arr!2240 (_keys!4587 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40259 () Bool)

(declare-fun res!63425 () Bool)

(assert (=> d!40259 (=> res!63425 e!85850)))

(assert (=> d!40259 (= res!63425 (bvsge #b00000000000000000000000000000000 (size!2507 (_keys!4587 newMap!16))))))

(assert (=> d!40259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4587 newMap!16) (mask!7130 newMap!16)) e!85850)))

(declare-fun b!131677 () Bool)

(assert (=> b!131677 (= e!85848 call!14384)))

(assert (= (and d!40259 (not res!63425)) b!131676))

(assert (= (and b!131676 c!24361) b!131675))

(assert (= (and b!131676 (not c!24361)) b!131674))

(assert (= (and b!131675 res!63424) b!131677))

(assert (= (or b!131677 b!131674) bm!14381))

(declare-fun m!155523 () Bool)

(assert (=> bm!14381 m!155523))

(assert (=> b!131675 m!154965))

(declare-fun m!155525 () Bool)

(assert (=> b!131675 m!155525))

(declare-fun m!155527 () Bool)

(assert (=> b!131675 m!155527))

(assert (=> b!131675 m!154965))

(declare-fun m!155529 () Bool)

(assert (=> b!131675 m!155529))

(assert (=> b!131676 m!154965))

(assert (=> b!131676 m!154965))

(assert (=> b!131676 m!154967))

(assert (=> b!131249 d!40259))

(declare-fun mapNonEmpty!4607 () Bool)

(declare-fun mapRes!4607 () Bool)

(declare-fun tp!11141 () Bool)

(declare-fun e!85852 () Bool)

(assert (=> mapNonEmpty!4607 (= mapRes!4607 (and tp!11141 e!85852))))

(declare-fun mapValue!4607 () ValueCell!1088)

(declare-fun mapKey!4607 () (_ BitVec 32))

(declare-fun mapRest!4607 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4607 (= mapRest!4605 (store mapRest!4607 mapKey!4607 mapValue!4607))))

(declare-fun mapIsEmpty!4607 () Bool)

(assert (=> mapIsEmpty!4607 mapRes!4607))

(declare-fun b!131679 () Bool)

(declare-fun e!85851 () Bool)

(assert (=> b!131679 (= e!85851 tp_is_empty!2863)))

(declare-fun condMapEmpty!4607 () Bool)

(declare-fun mapDefault!4607 () ValueCell!1088)

(assert (=> mapNonEmpty!4605 (= condMapEmpty!4607 (= mapRest!4605 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4607)))))

(assert (=> mapNonEmpty!4605 (= tp!11139 (and e!85851 mapRes!4607))))

(declare-fun b!131678 () Bool)

(assert (=> b!131678 (= e!85852 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4605 condMapEmpty!4607) mapIsEmpty!4607))

(assert (= (and mapNonEmpty!4605 (not condMapEmpty!4607)) mapNonEmpty!4607))

(assert (= (and mapNonEmpty!4607 ((_ is ValueCellFull!1088) mapValue!4607)) b!131678))

(assert (= (and mapNonEmpty!4605 ((_ is ValueCellFull!1088) mapDefault!4607)) b!131679))

(declare-fun m!155531 () Bool)

(assert (=> mapNonEmpty!4607 m!155531))

(declare-fun mapNonEmpty!4608 () Bool)

(declare-fun mapRes!4608 () Bool)

(declare-fun tp!11142 () Bool)

(declare-fun e!85854 () Bool)

(assert (=> mapNonEmpty!4608 (= mapRes!4608 (and tp!11142 e!85854))))

(declare-fun mapKey!4608 () (_ BitVec 32))

(declare-fun mapValue!4608 () ValueCell!1088)

(declare-fun mapRest!4608 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4608 (= mapRest!4606 (store mapRest!4608 mapKey!4608 mapValue!4608))))

(declare-fun mapIsEmpty!4608 () Bool)

(assert (=> mapIsEmpty!4608 mapRes!4608))

(declare-fun b!131681 () Bool)

(declare-fun e!85853 () Bool)

(assert (=> b!131681 (= e!85853 tp_is_empty!2863)))

(declare-fun condMapEmpty!4608 () Bool)

(declare-fun mapDefault!4608 () ValueCell!1088)

(assert (=> mapNonEmpty!4606 (= condMapEmpty!4608 (= mapRest!4606 ((as const (Array (_ BitVec 32) ValueCell!1088)) mapDefault!4608)))))

(assert (=> mapNonEmpty!4606 (= tp!11140 (and e!85853 mapRes!4608))))

(declare-fun b!131680 () Bool)

(assert (=> b!131680 (= e!85854 tp_is_empty!2863)))

(assert (= (and mapNonEmpty!4606 condMapEmpty!4608) mapIsEmpty!4608))

(assert (= (and mapNonEmpty!4606 (not condMapEmpty!4608)) mapNonEmpty!4608))

(assert (= (and mapNonEmpty!4608 ((_ is ValueCellFull!1088) mapValue!4608)) b!131680))

(assert (= (and mapNonEmpty!4606 ((_ is ValueCellFull!1088) mapDefault!4608)) b!131681))

(declare-fun m!155533 () Bool)

(assert (=> mapNonEmpty!4608 m!155533))

(declare-fun b_lambda!5871 () Bool)

(assert (= b_lambda!5865 (or (and b!130982 b_free!2893 (= (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130979 b_free!2895) b_lambda!5871)))

(declare-fun b_lambda!5873 () Bool)

(assert (= b_lambda!5863 (or (and b!130982 b_free!2893 (= (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130979 b_free!2895) b_lambda!5873)))

(declare-fun b_lambda!5875 () Bool)

(assert (= b_lambda!5861 (or (and b!130982 b_free!2893 (= (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))) (defaultEntry!2842 newMap!16))) (and b!130979 b_free!2895) b_lambda!5875)))

(declare-fun b_lambda!5877 () Bool)

(assert (= b_lambda!5867 (or (and b!130982 b_free!2893) (and b!130979 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))))) b_lambda!5877)))

(declare-fun b_lambda!5879 () Bool)

(assert (= b_lambda!5869 (or (and b!130982 b_free!2893) (and b!130979 b_free!2895 (= (defaultEntry!2842 newMap!16) (defaultEntry!2842 (v!3176 (underlying!449 thiss!992))))) b_lambda!5879)))

(check-sat (not b!131407) (not b!131548) (not b!131431) (not b!131430) (not d!40247) (not b!131638) (not b!131578) (not d!40257) (not b!131622) (not d!40201) (not d!40159) (not d!40241) (not b!131499) (not bm!14379) (not b!131513) (not d!40217) (not d!40189) (not d!40181) (not d!40175) (not b!131604) (not b!131634) (not b!131493) (not d!40253) (not d!40149) (not d!40197) (not b!131421) (not b_next!2893) (not d!40187) (not d!40199) (not b_lambda!5877) (not d!40255) (not bm!14345) (not b_lambda!5855) (not b!131617) (not d!40167) (not b!131392) (not b!131561) (not b!131644) (not b!131348) (not b!131363) (not d!40243) (not bm!14342) (not b!131511) (not b!131620) (not b!131624) (not b!131623) (not b!131675) (not b!131530) (not d!40169) (not b!131416) (not b!131637) (not d!40239) (not d!40161) (not d!40213) (not d!40155) (not b!131422) (not b!131490) (not b!131614) (not b!131633) (not b!131477) (not b!131615) (not d!40165) (not b!131639) (not b_next!2895) (not b!131618) (not d!40219) (not b!131397) (not d!40235) (not bm!14338) (not b!131626) (not b!131551) (not d!40215) (not b!131366) (not b_lambda!5875) (not b_lambda!5879) (not b!131418) (not bm!14341) (not b_lambda!5859) (not b!131491) (not b!131673) (not bm!14380) (not b!131350) (not d!40183) (not b!131621) (not b!131413) (not b!131514) (not b!131535) (not b!131632) (not b!131476) (not b!131567) b_and!8159 (not d!40231) (not bm!14381) (not b_lambda!5873) (not b!131415) (not b!131616) (not bm!14334) (not d!40171) (not b!131527) (not b!131471) tp_is_empty!2863 (not b!131417) (not d!40163) (not bm!14364) (not b!131607) (not mapNonEmpty!4608) (not b!131610) (not b!131368) (not d!40225) (not b!131605) (not d!40177) (not d!40151) (not b!131371) (not bm!14363) (not b!131529) b_and!8157 (not b!131532) (not b!131433) (not bm!14374) (not b!131400) (not b!131672) (not b!131521) (not b!131429) (not b!131365) (not d!40227) (not d!40145) (not b!131474) (not d!40249) (not bm!14367) (not bm!14359) (not b!131531) (not b!131608) (not b!131364) (not d!40251) (not b!131549) (not b!131424) (not bm!14336) (not b!131577) (not b!131528) (not d!40141) (not b!131574) (not bm!14360) (not b!131676) (not b!131398) (not bm!14371) (not b!131479) (not bm!14370) (not d!40237) (not d!40229) (not b!131569) (not d!40143) (not d!40223) (not b!131566) (not b!131613) (not b!131546) (not b!131367) (not b!131619) (not b!131640) (not d!40233) (not bm!14335) (not bm!14357) (not d!40245) (not b!131396) (not b!131414) (not b!131482) (not d!40193) (not b!131631) (not b!131496) (not b!131346) (not bm!14348) (not b!131562) (not d!40179) (not b_lambda!5871) (not d!40203) (not d!40209) (not bm!14365) (not b!131357) (not bm!14343) (not b!131377) (not mapNonEmpty!4607))
(check-sat b_and!8157 b_and!8159 (not b_next!2893) (not b_next!2895))
