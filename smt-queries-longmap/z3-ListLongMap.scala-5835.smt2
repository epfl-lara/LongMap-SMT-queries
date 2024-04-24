; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75480 () Bool)

(assert start!75480)

(declare-fun b!888105 () Bool)

(declare-fun b_free!15511 () Bool)

(declare-fun b_next!15511 () Bool)

(assert (=> b!888105 (= b_free!15511 (not b_next!15511))))

(declare-fun tp!54468 () Bool)

(declare-fun b_and!25727 () Bool)

(assert (=> b!888105 (= tp!54468 b_and!25727)))

(declare-fun b!888104 () Bool)

(declare-fun e!494620 () Bool)

(declare-datatypes ((V!28751 0))(
  ( (V!28752 (val!8970 Int)) )
))
(declare-datatypes ((ValueCell!8438 0))(
  ( (ValueCellFull!8438 (v!11420 V!28751)) (EmptyCell!8438) )
))
(declare-datatypes ((array!51677 0))(
  ( (array!51678 (arr!24850 (Array (_ BitVec 32) ValueCell!8438)) (size!25291 (_ BitVec 32))) )
))
(declare-datatypes ((array!51679 0))(
  ( (array!51680 (arr!24851 (Array (_ BitVec 32) (_ BitVec 64))) (size!25292 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3892 0))(
  ( (LongMapFixedSize!3893 (defaultEntry!5134 Int) (mask!25572 (_ BitVec 32)) (extraKeys!4827 (_ BitVec 32)) (zeroValue!4931 V!28751) (minValue!4931 V!28751) (_size!2001 (_ BitVec 32)) (_keys!9837 array!51679) (_values!5118 array!51677) (_vacant!2001 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1052 0))(
  ( (Cell!1053 (v!11421 LongMapFixedSize!3892)) )
))
(declare-datatypes ((LongMap!1052 0))(
  ( (LongMap!1053 (underlying!537 Cell!1052)) )
))
(declare-fun thiss!833 () LongMap!1052)

(declare-fun key!673 () (_ BitVec 64))

(declare-datatypes ((Option!439 0))(
  ( (Some!438 (v!11422 V!28751)) (None!437) )
))
(declare-fun isDefined!314 (Option!439) Bool)

(declare-datatypes ((tuple2!11846 0))(
  ( (tuple2!11847 (_1!5934 (_ BitVec 64)) (_2!5934 V!28751)) )
))
(declare-datatypes ((List!17633 0))(
  ( (Nil!17630) (Cons!17629 (h!18766 tuple2!11846) (t!24908 List!17633)) )
))
(declare-fun getValueByKey!433 (List!17633 (_ BitVec 64)) Option!439)

(declare-datatypes ((ListLongMap!10545 0))(
  ( (ListLongMap!10546 (toList!5288 List!17633)) )
))
(declare-fun map!12071 (LongMap!1052) ListLongMap!10545)

(assert (=> b!888104 (= e!494620 (not (isDefined!314 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673))))))

(declare-fun e!494623 () Bool)

(declare-fun tp_is_empty!17839 () Bool)

(declare-fun e!494625 () Bool)

(declare-fun array_inv!19602 (array!51679) Bool)

(declare-fun array_inv!19603 (array!51677) Bool)

(assert (=> b!888105 (= e!494623 (and tp!54468 tp_is_empty!17839 (array_inv!19602 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (array_inv!19603 (_values!5118 (v!11421 (underlying!537 thiss!833)))) e!494625))))

(declare-fun mapNonEmpty!28278 () Bool)

(declare-fun mapRes!28278 () Bool)

(declare-fun tp!54467 () Bool)

(declare-fun e!494618 () Bool)

(assert (=> mapNonEmpty!28278 (= mapRes!28278 (and tp!54467 e!494618))))

(declare-fun mapKey!28278 () (_ BitVec 32))

(declare-fun mapValue!28278 () ValueCell!8438)

(declare-fun mapRest!28278 () (Array (_ BitVec 32) ValueCell!8438))

(assert (=> mapNonEmpty!28278 (= (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (store mapRest!28278 mapKey!28278 mapValue!28278))))

(declare-fun b!888107 () Bool)

(declare-fun e!494622 () Bool)

(assert (=> b!888107 (= e!494622 e!494623)))

(declare-fun mapIsEmpty!28278 () Bool)

(assert (=> mapIsEmpty!28278 mapRes!28278))

(declare-fun b!888108 () Bool)

(declare-fun e!494619 () Bool)

(assert (=> b!888108 (= e!494619 e!494620)))

(declare-fun res!602421 () Bool)

(assert (=> b!888108 (=> (not res!602421) (not e!494620))))

(declare-fun contains!4282 (LongMap!1052 (_ BitVec 64)) Bool)

(assert (=> b!888108 (= res!602421 (contains!4282 thiss!833 key!673))))

(declare-fun lt!401573 () V!28751)

(declare-fun apply!390 (LongMapFixedSize!3892 (_ BitVec 64)) V!28751)

(assert (=> b!888108 (= lt!401573 (apply!390 (v!11421 (underlying!537 thiss!833)) key!673))))

(declare-fun b!888109 () Bool)

(declare-fun e!494624 () Bool)

(assert (=> b!888109 (= e!494624 tp_is_empty!17839)))

(declare-fun res!602420 () Bool)

(assert (=> start!75480 (=> (not res!602420) (not e!494619))))

(declare-fun valid!1525 (LongMap!1052) Bool)

(assert (=> start!75480 (= res!602420 (valid!1525 thiss!833))))

(assert (=> start!75480 e!494619))

(declare-fun e!494621 () Bool)

(assert (=> start!75480 e!494621))

(assert (=> start!75480 true))

(declare-fun b!888106 () Bool)

(assert (=> b!888106 (= e!494618 tp_is_empty!17839)))

(declare-fun b!888110 () Bool)

(assert (=> b!888110 (= e!494621 e!494622)))

(declare-fun b!888111 () Bool)

(assert (=> b!888111 (= e!494625 (and e!494624 mapRes!28278))))

(declare-fun condMapEmpty!28278 () Bool)

(declare-fun mapDefault!28278 () ValueCell!8438)

(assert (=> b!888111 (= condMapEmpty!28278 (= (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28278)))))

(assert (= (and start!75480 res!602420) b!888108))

(assert (= (and b!888108 res!602421) b!888104))

(assert (= (and b!888111 condMapEmpty!28278) mapIsEmpty!28278))

(assert (= (and b!888111 (not condMapEmpty!28278)) mapNonEmpty!28278))

(get-info :version)

(assert (= (and mapNonEmpty!28278 ((_ is ValueCellFull!8438) mapValue!28278)) b!888106))

(assert (= (and b!888111 ((_ is ValueCellFull!8438) mapDefault!28278)) b!888109))

(assert (= b!888105 b!888111))

(assert (= b!888107 b!888105))

(assert (= b!888110 b!888107))

(assert (= start!75480 b!888110))

(declare-fun m!828201 () Bool)

(assert (=> b!888108 m!828201))

(declare-fun m!828203 () Bool)

(assert (=> b!888108 m!828203))

(declare-fun m!828205 () Bool)

(assert (=> b!888105 m!828205))

(declare-fun m!828207 () Bool)

(assert (=> b!888105 m!828207))

(declare-fun m!828209 () Bool)

(assert (=> mapNonEmpty!28278 m!828209))

(declare-fun m!828211 () Bool)

(assert (=> start!75480 m!828211))

(declare-fun m!828213 () Bool)

(assert (=> b!888104 m!828213))

(declare-fun m!828215 () Bool)

(assert (=> b!888104 m!828215))

(assert (=> b!888104 m!828215))

(declare-fun m!828217 () Bool)

(assert (=> b!888104 m!828217))

(check-sat (not b!888104) (not b!888108) b_and!25727 tp_is_empty!17839 (not b!888105) (not mapNonEmpty!28278) (not start!75480) (not b_next!15511))
(check-sat b_and!25727 (not b_next!15511))
(get-model)

(declare-fun d!110209 () Bool)

(declare-fun isEmpty!680 (Option!439) Bool)

(assert (=> d!110209 (= (isDefined!314 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673)) (not (isEmpty!680 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673))))))

(declare-fun bs!24884 () Bool)

(assert (= bs!24884 d!110209))

(assert (=> bs!24884 m!828215))

(declare-fun m!828255 () Bool)

(assert (=> bs!24884 m!828255))

(assert (=> b!888104 d!110209))

(declare-fun d!110211 () Bool)

(declare-fun c!93901 () Bool)

(assert (=> d!110211 (= c!93901 (and ((_ is Cons!17629) (toList!5288 (map!12071 thiss!833))) (= (_1!5934 (h!18766 (toList!5288 (map!12071 thiss!833)))) key!673)))))

(declare-fun e!494684 () Option!439)

(assert (=> d!110211 (= (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673) e!494684)))

(declare-fun b!888171 () Bool)

(declare-fun e!494685 () Option!439)

(assert (=> b!888171 (= e!494685 None!437)))

(declare-fun b!888169 () Bool)

(assert (=> b!888169 (= e!494684 e!494685)))

(declare-fun c!93902 () Bool)

(assert (=> b!888169 (= c!93902 (and ((_ is Cons!17629) (toList!5288 (map!12071 thiss!833))) (not (= (_1!5934 (h!18766 (toList!5288 (map!12071 thiss!833)))) key!673))))))

(declare-fun b!888170 () Bool)

(assert (=> b!888170 (= e!494685 (getValueByKey!433 (t!24908 (toList!5288 (map!12071 thiss!833))) key!673))))

(declare-fun b!888168 () Bool)

(assert (=> b!888168 (= e!494684 (Some!438 (_2!5934 (h!18766 (toList!5288 (map!12071 thiss!833))))))))

(assert (= (and d!110211 c!93901) b!888168))

(assert (= (and d!110211 (not c!93901)) b!888169))

(assert (= (and b!888169 c!93902) b!888170))

(assert (= (and b!888169 (not c!93902)) b!888171))

(declare-fun m!828257 () Bool)

(assert (=> b!888170 m!828257))

(assert (=> b!888104 d!110211))

(declare-fun d!110213 () Bool)

(declare-fun map!12073 (LongMapFixedSize!3892) ListLongMap!10545)

(assert (=> d!110213 (= (map!12071 thiss!833) (map!12073 (v!11421 (underlying!537 thiss!833))))))

(declare-fun bs!24885 () Bool)

(assert (= bs!24885 d!110213))

(declare-fun m!828259 () Bool)

(assert (=> bs!24885 m!828259))

(assert (=> b!888104 d!110213))

(declare-fun d!110215 () Bool)

(declare-fun lt!401582 () Bool)

(declare-fun contains!4284 (ListLongMap!10545 (_ BitVec 64)) Bool)

(assert (=> d!110215 (= lt!401582 (contains!4284 (map!12071 thiss!833) key!673))))

(declare-fun contains!4285 (LongMapFixedSize!3892 (_ BitVec 64)) Bool)

(assert (=> d!110215 (= lt!401582 (contains!4285 (v!11421 (underlying!537 thiss!833)) key!673))))

(assert (=> d!110215 (valid!1525 thiss!833)))

(assert (=> d!110215 (= (contains!4282 thiss!833 key!673) lt!401582)))

(declare-fun bs!24886 () Bool)

(assert (= bs!24886 d!110215))

(assert (=> bs!24886 m!828213))

(assert (=> bs!24886 m!828213))

(declare-fun m!828261 () Bool)

(assert (=> bs!24886 m!828261))

(declare-fun m!828263 () Bool)

(assert (=> bs!24886 m!828263))

(assert (=> bs!24886 m!828211))

(assert (=> b!888108 d!110215))

(declare-fun b!888208 () Bool)

(declare-fun res!602443 () Bool)

(declare-fun e!494709 () Bool)

(assert (=> b!888208 (=> (not res!602443) (not e!494709))))

(declare-fun arrayContainsKey!0 (array!51679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!888208 (= res!602443 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun e!494711 () Bool)

(assert (=> b!888208 (= e!494711 e!494709)))

(declare-fun b!888209 () Bool)

(declare-fun res!602444 () Bool)

(declare-fun e!494713 () Bool)

(assert (=> b!888209 (=> (not res!602444) (not e!494713))))

(assert (=> b!888209 (= res!602444 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!888209 (= e!494711 e!494713)))

(declare-fun b!888210 () Bool)

(declare-fun c!93920 () Bool)

(assert (=> b!888210 (= c!93920 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!494708 () V!28751)

(declare-fun e!494710 () V!28751)

(assert (=> b!888210 (= e!494708 e!494710)))

(declare-fun b!888212 () Bool)

(declare-datatypes ((SeekEntryResult!8714 0))(
  ( (MissingZero!8714 (index!37227 (_ BitVec 32))) (Found!8714 (index!37228 (_ BitVec 32))) (Intermediate!8714 (undefined!9526 Bool) (index!37229 (_ BitVec 32)) (x!75208 (_ BitVec 32))) (Undefined!8714) (MissingVacant!8714 (index!37230 (_ BitVec 32))) )
))
(declare-fun lt!401614 () SeekEntryResult!8714)

(declare-fun call!39384 () V!28751)

(declare-fun get!13143 (ValueCell!8438 V!28751) V!28751)

(declare-fun dynLambda!1302 (Int (_ BitVec 64)) V!28751)

(assert (=> b!888212 (= e!494709 (= call!39384 (get!13143 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!888213 () Bool)

(declare-fun e!494715 () V!28751)

(assert (=> b!888213 (= e!494715 (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) key!673))))

(declare-fun b!888214 () Bool)

(declare-fun e!494716 () Bool)

(assert (=> b!888214 (= e!494716 e!494711)))

(declare-fun c!93919 () Bool)

(assert (=> b!888214 (= c!93919 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888215 () Bool)

(declare-datatypes ((Unit!30226 0))(
  ( (Unit!30227) )
))
(declare-fun lt!401611 () Unit!30226)

(declare-fun lt!401612 () Unit!30226)

(assert (=> b!888215 (= lt!401611 lt!401612)))

(assert (=> b!888215 e!494716))

(declare-fun c!93917 () Bool)

(assert (=> b!888215 (= c!93917 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!1 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) (_ BitVec 32) Int) Unit!30226)

(assert (=> b!888215 (= lt!401612 (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401606 () Unit!30226)

(declare-fun lt!401607 () Unit!30226)

(assert (=> b!888215 (= lt!401606 lt!401607)))

(declare-fun getCurrentListMap!2570 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) ListLongMap!10545)

(assert (=> b!888215 (contains!4284 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!200 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) Unit!30226)

(assert (=> b!888215 (= lt!401607 (lemmaValidKeyInArrayIsInListMap!200 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401615 () Unit!30226)

(declare-fun lt!401609 () Unit!30226)

(assert (=> b!888215 (= lt!401615 lt!401609)))

(assert (=> b!888215 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51679 (_ BitVec 64) (_ BitVec 32)) Unit!30226)

(assert (=> b!888215 (= lt!401609 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614)))))

(assert (=> b!888215 (= e!494715 (get!13143 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!888216 () Bool)

(declare-fun e!494717 () Bool)

(declare-fun call!39385 () V!28751)

(assert (=> b!888216 (= e!494717 (= call!39385 (zeroValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bm!39379 () Bool)

(declare-fun call!39383 () ListLongMap!10545)

(declare-fun call!39382 () ListLongMap!10545)

(assert (=> bm!39379 (= call!39383 call!39382)))

(declare-fun b!888217 () Bool)

(declare-fun e!494714 () V!28751)

(assert (=> b!888217 (= e!494714 e!494715)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51679 (_ BitVec 32)) SeekEntryResult!8714)

(assert (=> b!888217 (= lt!401614 (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401610 () Unit!30226)

(declare-fun lemmaSeekEntryGivesInRangeIndex!1 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64)) Unit!30226)

(assert (=> b!888217 (= lt!401610 (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673))))

(declare-fun lt!401608 () SeekEntryResult!8714)

(assert (=> b!888217 (= lt!401608 (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun res!602445 () Bool)

(assert (=> b!888217 (= res!602445 (not ((_ is Found!8714) lt!401608)))))

(declare-fun e!494718 () Bool)

(assert (=> b!888217 (=> res!602445 e!494718)))

(assert (=> b!888217 e!494718))

(declare-fun lt!401613 () Unit!30226)

(assert (=> b!888217 (= lt!401613 lt!401610)))

(declare-fun c!93918 () Bool)

(assert (=> b!888217 (= c!93918 ((_ is Found!8714) lt!401614))))

(declare-fun b!888218 () Bool)

(assert (=> b!888218 (= e!494714 e!494708)))

(declare-fun c!93922 () Bool)

(assert (=> b!888218 (= c!93922 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!888219 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!888219 (= e!494718 (inRange!0 (index!37228 lt!401608) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bm!39380 () Bool)

(declare-fun apply!392 (ListLongMap!10545 (_ BitVec 64)) V!28751)

(assert (=> bm!39380 (= call!39385 (apply!392 (ite c!93917 call!39382 call!39383) key!673))))

(declare-fun b!888220 () Bool)

(assert (=> b!888220 (= e!494710 (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) key!673))))

(declare-fun bm!39381 () Bool)

(assert (=> bm!39381 (= call!39384 call!39385)))

(declare-fun lt!401605 () V!28751)

(declare-fun e!494712 () Bool)

(declare-fun b!888211 () Bool)

(assert (=> b!888211 (= e!494712 (= lt!401605 (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) key!673)))))

(declare-fun d!110217 () Bool)

(assert (=> d!110217 e!494712))

(declare-fun c!93923 () Bool)

(assert (=> d!110217 (= c!93923 (contains!4285 (v!11421 (underlying!537 thiss!833)) key!673))))

(assert (=> d!110217 (= lt!401605 e!494714)))

(declare-fun c!93921 () Bool)

(assert (=> d!110217 (= c!93921 (= key!673 (bvneg key!673)))))

(declare-fun valid!1527 (LongMapFixedSize!3892) Bool)

(assert (=> d!110217 (valid!1527 (v!11421 (underlying!537 thiss!833)))))

(assert (=> d!110217 (= (apply!390 (v!11421 (underlying!537 thiss!833)) key!673) lt!401605)))

(declare-fun b!888221 () Bool)

(assert (=> b!888221 (= e!494716 e!494717)))

(declare-fun res!602442 () Bool)

(assert (=> b!888221 (= res!602442 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888221 (=> (not res!602442) (not e!494717))))

(declare-fun b!888222 () Bool)

(assert (=> b!888222 (= e!494710 (minValue!4931 (v!11421 (underlying!537 thiss!833))))))

(declare-fun bm!39382 () Bool)

(assert (=> bm!39382 (= call!39382 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888223 () Bool)

(assert (=> b!888223 (= e!494708 (zeroValue!4931 (v!11421 (underlying!537 thiss!833))))))

(declare-fun b!888224 () Bool)

(declare-fun get!13144 (Option!439) V!28751)

(assert (=> b!888224 (= e!494712 (= lt!401605 (get!13144 (getValueByKey!433 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))) key!673))))))

(declare-fun b!888225 () Bool)

(assert (=> b!888225 (= e!494713 (= call!39384 (minValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(assert (= (and d!110217 c!93921) b!888218))

(assert (= (and d!110217 (not c!93921)) b!888217))

(assert (= (and b!888218 c!93922) b!888223))

(assert (= (and b!888218 (not c!93922)) b!888210))

(assert (= (and b!888210 c!93920) b!888222))

(assert (= (and b!888210 (not c!93920)) b!888220))

(assert (= (and b!888217 (not res!602445)) b!888219))

(assert (= (and b!888217 c!93918) b!888215))

(assert (= (and b!888217 (not c!93918)) b!888213))

(assert (= (and b!888215 c!93917) b!888221))

(assert (= (and b!888215 (not c!93917)) b!888214))

(assert (= (and b!888221 res!602442) b!888216))

(assert (= (and b!888214 c!93919) b!888209))

(assert (= (and b!888214 (not c!93919)) b!888208))

(assert (= (and b!888209 res!602444) b!888225))

(assert (= (and b!888208 res!602443) b!888212))

(assert (= (or b!888225 b!888212) bm!39379))

(assert (= (or b!888225 b!888212) bm!39381))

(assert (= (or b!888216 bm!39379) bm!39382))

(assert (= (or b!888216 bm!39381) bm!39380))

(assert (= (and d!110217 c!93923) b!888224))

(assert (= (and d!110217 (not c!93923)) b!888211))

(declare-fun b_lambda!12833 () Bool)

(assert (=> (not b_lambda!12833) (not b!888215)))

(declare-fun t!24911 () Bool)

(declare-fun tb!5127 () Bool)

(assert (=> (and b!888105 (= (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) t!24911) tb!5127))

(declare-fun result!9957 () Bool)

(assert (=> tb!5127 (= result!9957 tp_is_empty!17839)))

(assert (=> b!888215 t!24911))

(declare-fun b_and!25733 () Bool)

(assert (= b_and!25727 (and (=> t!24911 result!9957) b_and!25733)))

(declare-fun b_lambda!12835 () Bool)

(assert (=> (not b_lambda!12835) (not b!888220)))

(declare-fun t!24913 () Bool)

(declare-fun tb!5129 () Bool)

(assert (=> (and b!888105 (= (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) t!24913) tb!5129))

(declare-fun result!9961 () Bool)

(assert (=> tb!5129 (= result!9961 tp_is_empty!17839)))

(assert (=> b!888220 t!24913))

(declare-fun b_and!25735 () Bool)

(assert (= b_and!25733 (and (=> t!24913 result!9961) b_and!25735)))

(declare-fun b_lambda!12837 () Bool)

(assert (=> (not b_lambda!12837) (not b!888212)))

(assert (=> b!888212 t!24911))

(declare-fun b_and!25737 () Bool)

(assert (= b_and!25735 (and (=> t!24911 result!9957) b_and!25737)))

(declare-fun b_lambda!12839 () Bool)

(assert (=> (not b_lambda!12839) (not b!888213)))

(assert (=> b!888213 t!24913))

(declare-fun b_and!25739 () Bool)

(assert (= b_and!25737 (and (=> t!24913 result!9961) b_and!25739)))

(declare-fun b_lambda!12841 () Bool)

(assert (=> (not b_lambda!12841) (not b!888211)))

(assert (=> b!888211 t!24913))

(declare-fun b_and!25741 () Bool)

(assert (= b_and!25739 (and (=> t!24913 result!9961) b_and!25741)))

(declare-fun m!828265 () Bool)

(assert (=> b!888213 m!828265))

(declare-fun m!828267 () Bool)

(assert (=> bm!39382 m!828267))

(assert (=> b!888224 m!828259))

(declare-fun m!828269 () Bool)

(assert (=> b!888224 m!828269))

(assert (=> b!888224 m!828269))

(declare-fun m!828271 () Bool)

(assert (=> b!888224 m!828271))

(declare-fun m!828273 () Bool)

(assert (=> b!888219 m!828273))

(declare-fun m!828275 () Bool)

(assert (=> b!888215 m!828275))

(declare-fun m!828277 () Bool)

(assert (=> b!888215 m!828277))

(assert (=> b!888215 m!828267))

(assert (=> b!888215 m!828267))

(assert (=> b!888215 m!828277))

(declare-fun m!828279 () Bool)

(assert (=> b!888215 m!828279))

(declare-fun m!828281 () Bool)

(assert (=> b!888215 m!828281))

(declare-fun m!828283 () Bool)

(assert (=> b!888215 m!828283))

(assert (=> b!888215 m!828275))

(declare-fun m!828285 () Bool)

(assert (=> b!888215 m!828285))

(declare-fun m!828287 () Bool)

(assert (=> b!888215 m!828287))

(declare-fun m!828289 () Bool)

(assert (=> b!888215 m!828289))

(assert (=> b!888215 m!828283))

(declare-fun m!828291 () Bool)

(assert (=> b!888215 m!828291))

(declare-fun m!828293 () Bool)

(assert (=> bm!39380 m!828293))

(assert (=> b!888211 m!828265))

(assert (=> b!888220 m!828265))

(declare-fun m!828295 () Bool)

(assert (=> b!888217 m!828295))

(declare-fun m!828297 () Bool)

(assert (=> b!888217 m!828297))

(assert (=> d!110217 m!828263))

(declare-fun m!828299 () Bool)

(assert (=> d!110217 m!828299))

(assert (=> b!888208 m!828289))

(assert (=> b!888212 m!828283))

(assert (=> b!888212 m!828275))

(assert (=> b!888212 m!828283))

(assert (=> b!888212 m!828275))

(assert (=> b!888212 m!828285))

(assert (=> b!888108 d!110217))

(declare-fun d!110219 () Bool)

(assert (=> d!110219 (= (array_inv!19602 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (bvsge (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!888105 d!110219))

(declare-fun d!110221 () Bool)

(assert (=> d!110221 (= (array_inv!19603 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (bvsge (size!25291 (_values!5118 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!888105 d!110221))

(declare-fun d!110223 () Bool)

(assert (=> d!110223 (= (valid!1525 thiss!833) (valid!1527 (v!11421 (underlying!537 thiss!833))))))

(declare-fun bs!24887 () Bool)

(assert (= bs!24887 d!110223))

(assert (=> bs!24887 m!828299))

(assert (=> start!75480 d!110223))

(declare-fun mapIsEmpty!28287 () Bool)

(declare-fun mapRes!28287 () Bool)

(assert (=> mapIsEmpty!28287 mapRes!28287))

(declare-fun mapNonEmpty!28287 () Bool)

(declare-fun tp!54483 () Bool)

(declare-fun e!494724 () Bool)

(assert (=> mapNonEmpty!28287 (= mapRes!28287 (and tp!54483 e!494724))))

(declare-fun mapRest!28287 () (Array (_ BitVec 32) ValueCell!8438))

(declare-fun mapKey!28287 () (_ BitVec 32))

(declare-fun mapValue!28287 () ValueCell!8438)

(assert (=> mapNonEmpty!28287 (= mapRest!28278 (store mapRest!28287 mapKey!28287 mapValue!28287))))

(declare-fun b!888235 () Bool)

(declare-fun e!494723 () Bool)

(assert (=> b!888235 (= e!494723 tp_is_empty!17839)))

(declare-fun b!888234 () Bool)

(assert (=> b!888234 (= e!494724 tp_is_empty!17839)))

(declare-fun condMapEmpty!28287 () Bool)

(declare-fun mapDefault!28287 () ValueCell!8438)

(assert (=> mapNonEmpty!28278 (= condMapEmpty!28287 (= mapRest!28278 ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28287)))))

(assert (=> mapNonEmpty!28278 (= tp!54467 (and e!494723 mapRes!28287))))

(assert (= (and mapNonEmpty!28278 condMapEmpty!28287) mapIsEmpty!28287))

(assert (= (and mapNonEmpty!28278 (not condMapEmpty!28287)) mapNonEmpty!28287))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8438) mapValue!28287)) b!888234))

(assert (= (and mapNonEmpty!28278 ((_ is ValueCellFull!8438) mapDefault!28287)) b!888235))

(declare-fun m!828301 () Bool)

(assert (=> mapNonEmpty!28287 m!828301))

(declare-fun b_lambda!12843 () Bool)

(assert (= b_lambda!12837 (or (and b!888105 b_free!15511) b_lambda!12843)))

(declare-fun b_lambda!12845 () Bool)

(assert (= b_lambda!12835 (or (and b!888105 b_free!15511) b_lambda!12845)))

(declare-fun b_lambda!12847 () Bool)

(assert (= b_lambda!12841 (or (and b!888105 b_free!15511) b_lambda!12847)))

(declare-fun b_lambda!12849 () Bool)

(assert (= b_lambda!12833 (or (and b!888105 b_free!15511) b_lambda!12849)))

(declare-fun b_lambda!12851 () Bool)

(assert (= b_lambda!12839 (or (and b!888105 b_free!15511) b_lambda!12851)))

(check-sat (not b_lambda!12851) (not b!888212) (not bm!39380) (not b!888208) (not b_lambda!12843) b_and!25741 (not b!888217) (not d!110217) (not b!888170) (not b!888224) (not d!110215) (not b!888219) (not d!110209) (not bm!39382) tp_is_empty!17839 (not d!110223) (not d!110213) (not b!888215) (not b_lambda!12845) (not b_lambda!12847) (not mapNonEmpty!28287) (not b_next!15511) (not b_lambda!12849))
(check-sat b_and!25741 (not b_next!15511))
(get-model)

(declare-fun b!888278 () Bool)

(declare-fun e!494751 () Bool)

(declare-fun lt!401677 () ListLongMap!10545)

(assert (=> b!888278 (= e!494751 (= (apply!392 lt!401677 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bm!39397 () Bool)

(declare-fun call!39400 () ListLongMap!10545)

(declare-fun call!39404 () ListLongMap!10545)

(assert (=> bm!39397 (= call!39400 call!39404)))

(declare-fun b!888279 () Bool)

(declare-fun e!494754 () Unit!30226)

(declare-fun Unit!30228 () Unit!30226)

(assert (=> b!888279 (= e!494754 Unit!30228)))

(declare-fun b!888280 () Bool)

(declare-fun e!494759 () ListLongMap!10545)

(declare-fun call!39406 () ListLongMap!10545)

(declare-fun +!2594 (ListLongMap!10545 tuple2!11846) ListLongMap!10545)

(assert (=> b!888280 (= e!494759 (+!2594 call!39406 (tuple2!11847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4931 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun b!888281 () Bool)

(declare-fun lt!401669 () Unit!30226)

(assert (=> b!888281 (= e!494754 lt!401669)))

(declare-fun lt!401662 () ListLongMap!10545)

(declare-fun getCurrentListMapNoExtraKeys!3315 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) ListLongMap!10545)

(assert (=> b!888281 (= lt!401662 (getCurrentListMapNoExtraKeys!3315 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401674 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401680 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401680 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401667 () Unit!30226)

(declare-fun addStillContains!325 (ListLongMap!10545 (_ BitVec 64) V!28751 (_ BitVec 64)) Unit!30226)

(assert (=> b!888281 (= lt!401667 (addStillContains!325 lt!401662 lt!401674 (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) lt!401680))))

(assert (=> b!888281 (contains!4284 (+!2594 lt!401662 (tuple2!11847 lt!401674 (zeroValue!4931 (v!11421 (underlying!537 thiss!833))))) lt!401680)))

(declare-fun lt!401671 () Unit!30226)

(assert (=> b!888281 (= lt!401671 lt!401667)))

(declare-fun lt!401672 () ListLongMap!10545)

(assert (=> b!888281 (= lt!401672 (getCurrentListMapNoExtraKeys!3315 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401675 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401675 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401660 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401660 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401676 () Unit!30226)

(declare-fun addApplyDifferent!325 (ListLongMap!10545 (_ BitVec 64) V!28751 (_ BitVec 64)) Unit!30226)

(assert (=> b!888281 (= lt!401676 (addApplyDifferent!325 lt!401672 lt!401675 (minValue!4931 (v!11421 (underlying!537 thiss!833))) lt!401660))))

(assert (=> b!888281 (= (apply!392 (+!2594 lt!401672 (tuple2!11847 lt!401675 (minValue!4931 (v!11421 (underlying!537 thiss!833))))) lt!401660) (apply!392 lt!401672 lt!401660))))

(declare-fun lt!401663 () Unit!30226)

(assert (=> b!888281 (= lt!401663 lt!401676)))

(declare-fun lt!401679 () ListLongMap!10545)

(assert (=> b!888281 (= lt!401679 (getCurrentListMapNoExtraKeys!3315 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401664 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401666 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401666 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401668 () Unit!30226)

(assert (=> b!888281 (= lt!401668 (addApplyDifferent!325 lt!401679 lt!401664 (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) lt!401666))))

(assert (=> b!888281 (= (apply!392 (+!2594 lt!401679 (tuple2!11847 lt!401664 (zeroValue!4931 (v!11421 (underlying!537 thiss!833))))) lt!401666) (apply!392 lt!401679 lt!401666))))

(declare-fun lt!401681 () Unit!30226)

(assert (=> b!888281 (= lt!401681 lt!401668)))

(declare-fun lt!401665 () ListLongMap!10545)

(assert (=> b!888281 (= lt!401665 (getCurrentListMapNoExtraKeys!3315 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401670 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401670 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401678 () (_ BitVec 64))

(assert (=> b!888281 (= lt!401678 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!888281 (= lt!401669 (addApplyDifferent!325 lt!401665 lt!401670 (minValue!4931 (v!11421 (underlying!537 thiss!833))) lt!401678))))

(assert (=> b!888281 (= (apply!392 (+!2594 lt!401665 (tuple2!11847 lt!401670 (minValue!4931 (v!11421 (underlying!537 thiss!833))))) lt!401678) (apply!392 lt!401665 lt!401678))))

(declare-fun b!888282 () Bool)

(declare-fun res!602465 () Bool)

(declare-fun e!494753 () Bool)

(assert (=> b!888282 (=> (not res!602465) (not e!494753))))

(declare-fun e!494763 () Bool)

(assert (=> b!888282 (= res!602465 e!494763)))

(declare-fun c!93937 () Bool)

(assert (=> b!888282 (= c!93937 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39398 () Bool)

(declare-fun call!39402 () ListLongMap!10545)

(assert (=> bm!39398 (= call!39402 (getCurrentListMapNoExtraKeys!3315 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bm!39399 () Bool)

(assert (=> bm!39399 (= call!39404 call!39402)))

(declare-fun b!888283 () Bool)

(declare-fun e!494752 () Bool)

(assert (=> b!888283 (= e!494752 (= (apply!392 lt!401677 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888284 () Bool)

(declare-fun e!494757 () Bool)

(assert (=> b!888284 (= e!494753 e!494757)))

(declare-fun c!93941 () Bool)

(assert (=> b!888284 (= c!93941 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888285 () Bool)

(declare-fun res!602469 () Bool)

(assert (=> b!888285 (=> (not res!602469) (not e!494753))))

(declare-fun e!494755 () Bool)

(assert (=> b!888285 (= res!602469 e!494755)))

(declare-fun res!602467 () Bool)

(assert (=> b!888285 (=> res!602467 e!494755)))

(declare-fun e!494758 () Bool)

(assert (=> b!888285 (= res!602467 (not e!494758))))

(declare-fun res!602466 () Bool)

(assert (=> b!888285 (=> (not res!602466) (not e!494758))))

(assert (=> b!888285 (= res!602466 (bvslt #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun b!888286 () Bool)

(declare-fun e!494762 () Bool)

(assert (=> b!888286 (= e!494755 e!494762)))

(declare-fun res!602472 () Bool)

(assert (=> b!888286 (=> (not res!602472) (not e!494762))))

(assert (=> b!888286 (= res!602472 (contains!4284 lt!401677 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000)))))

(assert (=> b!888286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun bm!39400 () Bool)

(declare-fun call!39405 () Bool)

(assert (=> bm!39400 (= call!39405 (contains!4284 lt!401677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888288 () Bool)

(declare-fun e!494760 () ListLongMap!10545)

(assert (=> b!888288 (= e!494759 e!494760)))

(declare-fun c!93940 () Bool)

(assert (=> b!888288 (= c!93940 (and (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888289 () Bool)

(assert (=> b!888289 (= e!494762 (= (apply!392 lt!401677 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000)) (get!13143 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25291 (_values!5118 (v!11421 (underlying!537 thiss!833))))))))

(assert (=> b!888289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun b!888290 () Bool)

(assert (=> b!888290 (= e!494763 e!494751)))

(declare-fun res!602470 () Bool)

(assert (=> b!888290 (= res!602470 call!39405)))

(assert (=> b!888290 (=> (not res!602470) (not e!494751))))

(declare-fun b!888291 () Bool)

(declare-fun e!494761 () ListLongMap!10545)

(assert (=> b!888291 (= e!494761 call!39400)))

(declare-fun b!888292 () Bool)

(declare-fun c!93939 () Bool)

(assert (=> b!888292 (= c!93939 (and (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888292 (= e!494760 e!494761)))

(declare-fun b!888293 () Bool)

(declare-fun call!39403 () Bool)

(assert (=> b!888293 (= e!494757 (not call!39403))))

(declare-fun c!93936 () Bool)

(declare-fun bm!39401 () Bool)

(assert (=> bm!39401 (= call!39406 (+!2594 (ite c!93936 call!39402 (ite c!93940 call!39404 call!39400)) (ite (or c!93936 c!93940) (tuple2!11847 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4931 (v!11421 (underlying!537 thiss!833)))) (tuple2!11847 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4931 (v!11421 (underlying!537 thiss!833)))))))))

(declare-fun b!888294 () Bool)

(declare-fun e!494756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888294 (= e!494756 (validKeyInArray!0 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun b!888295 () Bool)

(declare-fun call!39401 () ListLongMap!10545)

(assert (=> b!888295 (= e!494761 call!39401)))

(declare-fun b!888296 () Bool)

(assert (=> b!888296 (= e!494758 (validKeyInArray!0 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun bm!39402 () Bool)

(assert (=> bm!39402 (= call!39403 (contains!4284 lt!401677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888297 () Bool)

(assert (=> b!888297 (= e!494757 e!494752)))

(declare-fun res!602464 () Bool)

(assert (=> b!888297 (= res!602464 call!39403)))

(assert (=> b!888297 (=> (not res!602464) (not e!494752))))

(declare-fun b!888287 () Bool)

(assert (=> b!888287 (= e!494760 call!39401)))

(declare-fun d!110225 () Bool)

(assert (=> d!110225 e!494753))

(declare-fun res!602471 () Bool)

(assert (=> d!110225 (=> (not res!602471) (not e!494753))))

(assert (=> d!110225 (= res!602471 (or (bvsge #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))))

(declare-fun lt!401661 () ListLongMap!10545)

(assert (=> d!110225 (= lt!401677 lt!401661)))

(declare-fun lt!401673 () Unit!30226)

(assert (=> d!110225 (= lt!401673 e!494754)))

(declare-fun c!93938 () Bool)

(assert (=> d!110225 (= c!93938 e!494756)))

(declare-fun res!602468 () Bool)

(assert (=> d!110225 (=> (not res!602468) (not e!494756))))

(assert (=> d!110225 (= res!602468 (bvslt #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))

(assert (=> d!110225 (= lt!401661 e!494759)))

(assert (=> d!110225 (= c!93936 (and (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110225 (validMask!0 (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110225 (= (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) lt!401677)))

(declare-fun bm!39403 () Bool)

(assert (=> bm!39403 (= call!39401 call!39406)))

(declare-fun b!888298 () Bool)

(assert (=> b!888298 (= e!494763 (not call!39405))))

(assert (= (and d!110225 c!93936) b!888280))

(assert (= (and d!110225 (not c!93936)) b!888288))

(assert (= (and b!888288 c!93940) b!888287))

(assert (= (and b!888288 (not c!93940)) b!888292))

(assert (= (and b!888292 c!93939) b!888295))

(assert (= (and b!888292 (not c!93939)) b!888291))

(assert (= (or b!888295 b!888291) bm!39397))

(assert (= (or b!888287 bm!39397) bm!39399))

(assert (= (or b!888287 b!888295) bm!39403))

(assert (= (or b!888280 bm!39399) bm!39398))

(assert (= (or b!888280 bm!39403) bm!39401))

(assert (= (and d!110225 res!602468) b!888294))

(assert (= (and d!110225 c!93938) b!888281))

(assert (= (and d!110225 (not c!93938)) b!888279))

(assert (= (and d!110225 res!602471) b!888285))

(assert (= (and b!888285 res!602466) b!888296))

(assert (= (and b!888285 (not res!602467)) b!888286))

(assert (= (and b!888286 res!602472) b!888289))

(assert (= (and b!888285 res!602469) b!888282))

(assert (= (and b!888282 c!93937) b!888290))

(assert (= (and b!888282 (not c!93937)) b!888298))

(assert (= (and b!888290 res!602470) b!888278))

(assert (= (or b!888290 b!888298) bm!39400))

(assert (= (and b!888282 res!602465) b!888284))

(assert (= (and b!888284 c!93941) b!888297))

(assert (= (and b!888284 (not c!93941)) b!888293))

(assert (= (and b!888297 res!602464) b!888283))

(assert (= (or b!888297 b!888293) bm!39402))

(declare-fun b_lambda!12853 () Bool)

(assert (=> (not b_lambda!12853) (not b!888289)))

(assert (=> b!888289 t!24911))

(declare-fun b_and!25743 () Bool)

(assert (= b_and!25741 (and (=> t!24911 result!9957) b_and!25743)))

(declare-fun m!828303 () Bool)

(assert (=> b!888278 m!828303))

(declare-fun m!828305 () Bool)

(assert (=> b!888296 m!828305))

(assert (=> b!888296 m!828305))

(declare-fun m!828307 () Bool)

(assert (=> b!888296 m!828307))

(declare-fun m!828309 () Bool)

(assert (=> bm!39402 m!828309))

(declare-fun m!828311 () Bool)

(assert (=> b!888281 m!828311))

(declare-fun m!828313 () Bool)

(assert (=> b!888281 m!828313))

(declare-fun m!828315 () Bool)

(assert (=> b!888281 m!828315))

(declare-fun m!828317 () Bool)

(assert (=> b!888281 m!828317))

(declare-fun m!828319 () Bool)

(assert (=> b!888281 m!828319))

(declare-fun m!828321 () Bool)

(assert (=> b!888281 m!828321))

(declare-fun m!828323 () Bool)

(assert (=> b!888281 m!828323))

(declare-fun m!828325 () Bool)

(assert (=> b!888281 m!828325))

(declare-fun m!828327 () Bool)

(assert (=> b!888281 m!828327))

(declare-fun m!828329 () Bool)

(assert (=> b!888281 m!828329))

(declare-fun m!828331 () Bool)

(assert (=> b!888281 m!828331))

(assert (=> b!888281 m!828327))

(declare-fun m!828333 () Bool)

(assert (=> b!888281 m!828333))

(declare-fun m!828335 () Bool)

(assert (=> b!888281 m!828335))

(assert (=> b!888281 m!828331))

(declare-fun m!828337 () Bool)

(assert (=> b!888281 m!828337))

(assert (=> b!888281 m!828305))

(assert (=> b!888281 m!828325))

(declare-fun m!828339 () Bool)

(assert (=> b!888281 m!828339))

(assert (=> b!888281 m!828319))

(declare-fun m!828341 () Bool)

(assert (=> b!888281 m!828341))

(declare-fun m!828343 () Bool)

(assert (=> bm!39400 m!828343))

(declare-fun m!828345 () Bool)

(assert (=> b!888289 m!828345))

(assert (=> b!888289 m!828275))

(declare-fun m!828347 () Bool)

(assert (=> b!888289 m!828347))

(assert (=> b!888289 m!828275))

(assert (=> b!888289 m!828305))

(declare-fun m!828349 () Bool)

(assert (=> b!888289 m!828349))

(assert (=> b!888289 m!828305))

(assert (=> b!888289 m!828345))

(assert (=> bm!39398 m!828323))

(declare-fun m!828351 () Bool)

(assert (=> b!888280 m!828351))

(assert (=> b!888286 m!828305))

(assert (=> b!888286 m!828305))

(declare-fun m!828353 () Bool)

(assert (=> b!888286 m!828353))

(declare-fun m!828355 () Bool)

(assert (=> d!110225 m!828355))

(declare-fun m!828357 () Bool)

(assert (=> b!888283 m!828357))

(declare-fun m!828359 () Bool)

(assert (=> bm!39401 m!828359))

(assert (=> b!888294 m!828305))

(assert (=> b!888294 m!828305))

(assert (=> b!888294 m!828307))

(assert (=> bm!39382 d!110225))

(declare-fun d!110227 () Bool)

(declare-fun e!494769 () Bool)

(assert (=> d!110227 e!494769))

(declare-fun res!602475 () Bool)

(assert (=> d!110227 (=> res!602475 e!494769)))

(declare-fun lt!401691 () Bool)

(assert (=> d!110227 (= res!602475 (not lt!401691))))

(declare-fun lt!401690 () Bool)

(assert (=> d!110227 (= lt!401691 lt!401690)))

(declare-fun lt!401693 () Unit!30226)

(declare-fun e!494768 () Unit!30226)

(assert (=> d!110227 (= lt!401693 e!494768)))

(declare-fun c!93944 () Bool)

(assert (=> d!110227 (= c!93944 lt!401690)))

(declare-fun containsKey!419 (List!17633 (_ BitVec 64)) Bool)

(assert (=> d!110227 (= lt!401690 (containsKey!419 (toList!5288 (map!12071 thiss!833)) key!673))))

(assert (=> d!110227 (= (contains!4284 (map!12071 thiss!833) key!673) lt!401691)))

(declare-fun b!888305 () Bool)

(declare-fun lt!401692 () Unit!30226)

(assert (=> b!888305 (= e!494768 lt!401692)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!313 (List!17633 (_ BitVec 64)) Unit!30226)

(assert (=> b!888305 (= lt!401692 (lemmaContainsKeyImpliesGetValueByKeyDefined!313 (toList!5288 (map!12071 thiss!833)) key!673))))

(assert (=> b!888305 (isDefined!314 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673))))

(declare-fun b!888306 () Bool)

(declare-fun Unit!30229 () Unit!30226)

(assert (=> b!888306 (= e!494768 Unit!30229)))

(declare-fun b!888307 () Bool)

(assert (=> b!888307 (= e!494769 (isDefined!314 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673)))))

(assert (= (and d!110227 c!93944) b!888305))

(assert (= (and d!110227 (not c!93944)) b!888306))

(assert (= (and d!110227 (not res!602475)) b!888307))

(declare-fun m!828361 () Bool)

(assert (=> d!110227 m!828361))

(declare-fun m!828363 () Bool)

(assert (=> b!888305 m!828363))

(assert (=> b!888305 m!828215))

(assert (=> b!888305 m!828215))

(assert (=> b!888305 m!828217))

(assert (=> b!888307 m!828215))

(assert (=> b!888307 m!828215))

(assert (=> b!888307 m!828217))

(assert (=> d!110215 d!110227))

(assert (=> d!110215 d!110213))

(declare-fun b!888328 () Bool)

(declare-fun e!494783 () Bool)

(assert (=> b!888328 (= e!494783 true)))

(declare-fun lt!401725 () SeekEntryResult!8714)

(declare-fun lt!401738 () Unit!30226)

(assert (=> b!888328 (= lt!401738 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401725)))))

(declare-fun call!39415 () Bool)

(assert (=> b!888328 call!39415))

(declare-fun lt!401734 () Unit!30226)

(assert (=> b!888328 (= lt!401734 lt!401738)))

(declare-fun lt!401733 () Unit!30226)

(assert (=> b!888328 (= lt!401733 (lemmaValidKeyInArrayIsInListMap!200 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) (index!37228 lt!401725) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun call!39414 () Bool)

(assert (=> b!888328 call!39414))

(declare-fun lt!401732 () Unit!30226)

(assert (=> b!888328 (= lt!401732 lt!401733)))

(declare-fun bm!39410 () Bool)

(declare-fun call!39413 () ListLongMap!10545)

(assert (=> bm!39410 (= call!39413 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888330 () Bool)

(assert (=> b!888330 false))

(declare-fun lt!401735 () Unit!30226)

(declare-fun lt!401726 () Unit!30226)

(assert (=> b!888330 (= lt!401735 lt!401726)))

(declare-fun lt!401731 () SeekEntryResult!8714)

(declare-fun lt!401724 () (_ BitVec 32))

(assert (=> b!888330 (and ((_ is Found!8714) lt!401731) (= (index!37228 lt!401731) lt!401724))))

(assert (=> b!888330 (= lt!401731 (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51679 (_ BitVec 32)) Unit!30226)

(assert (=> b!888330 (= lt!401726 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!673 lt!401724 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401736 () Unit!30226)

(declare-fun lt!401730 () Unit!30226)

(assert (=> b!888330 (= lt!401736 lt!401730)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51679 (_ BitVec 32)) Bool)

(assert (=> b!888330 (arrayForallSeekEntryOrOpenFound!0 lt!401724 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30226)

(assert (=> b!888330 (= lt!401730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 lt!401724))))

(declare-fun arrayScanForKey!0 (array!51679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888330 (= lt!401724 (arrayScanForKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun lt!401727 () Unit!30226)

(declare-fun lt!401729 () Unit!30226)

(assert (=> b!888330 (= lt!401727 lt!401729)))

(declare-fun e!494780 () Bool)

(assert (=> b!888330 e!494780))

(declare-fun c!93955 () Bool)

(assert (=> b!888330 (= c!93955 (and (not (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!158 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) Int) Unit!30226)

(assert (=> b!888330 (= lt!401729 (lemmaKeyInListMapIsInArray!158 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun e!494784 () Unit!30226)

(declare-fun Unit!30230 () Unit!30226)

(assert (=> b!888330 (= e!494784 Unit!30230)))

(declare-fun bm!39411 () Bool)

(assert (=> bm!39411 (= call!39415 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun c!93958 () Bool)

(declare-fun bm!39412 () Bool)

(assert (=> bm!39412 (= call!39414 (contains!4284 call!39413 (ite c!93958 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401725)) key!673)))))

(declare-fun b!888331 () Bool)

(assert (=> b!888331 (= e!494780 call!39415)))

(declare-fun b!888332 () Bool)

(assert (=> b!888332 (= e!494780 (ite (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888333 () Bool)

(declare-fun e!494782 () Bool)

(assert (=> b!888333 (= e!494782 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!888334 () Bool)

(declare-fun e!494781 () Bool)

(assert (=> b!888334 (= e!494781 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888335 () Bool)

(declare-fun Unit!30231 () Unit!30226)

(assert (=> b!888335 (= e!494784 Unit!30231)))

(declare-fun d!110229 () Bool)

(declare-fun lt!401737 () Bool)

(assert (=> d!110229 (= lt!401737 (contains!4284 (map!12073 (v!11421 (underlying!537 thiss!833))) key!673))))

(assert (=> d!110229 (= lt!401737 e!494782)))

(declare-fun c!93956 () Bool)

(assert (=> d!110229 (= c!93956 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110229 (valid!1527 (v!11421 (underlying!537 thiss!833)))))

(assert (=> d!110229 (= (contains!4285 (v!11421 (underlying!537 thiss!833)) key!673) lt!401737)))

(declare-fun b!888329 () Bool)

(assert (=> b!888329 (= e!494783 false)))

(declare-fun c!93959 () Bool)

(assert (=> b!888329 (= c!93959 call!39414)))

(declare-fun lt!401728 () Unit!30226)

(assert (=> b!888329 (= lt!401728 e!494784)))

(declare-fun b!888336 () Bool)

(assert (=> b!888336 (= c!93958 ((_ is Found!8714) lt!401725))))

(assert (=> b!888336 (= lt!401725 (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(assert (=> b!888336 (= e!494781 e!494783)))

(declare-fun b!888337 () Bool)

(assert (=> b!888337 (= e!494782 e!494781)))

(declare-fun c!93957 () Bool)

(assert (=> b!888337 (= c!93957 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!110229 c!93956) b!888333))

(assert (= (and d!110229 (not c!93956)) b!888337))

(assert (= (and b!888337 c!93957) b!888334))

(assert (= (and b!888337 (not c!93957)) b!888336))

(assert (= (and b!888336 c!93958) b!888328))

(assert (= (and b!888336 (not c!93958)) b!888329))

(assert (= (and b!888329 c!93959) b!888330))

(assert (= (and b!888329 (not c!93959)) b!888335))

(assert (= (and b!888330 c!93955) b!888331))

(assert (= (and b!888330 (not c!93955)) b!888332))

(assert (= (or b!888328 b!888331) bm!39411))

(assert (= (or b!888328 b!888329) bm!39410))

(assert (= (or b!888328 b!888329) bm!39412))

(declare-fun m!828365 () Bool)

(assert (=> b!888328 m!828365))

(declare-fun m!828367 () Bool)

(assert (=> b!888328 m!828367))

(declare-fun m!828369 () Bool)

(assert (=> bm!39412 m!828369))

(declare-fun m!828371 () Bool)

(assert (=> bm!39412 m!828371))

(assert (=> bm!39410 m!828267))

(assert (=> d!110229 m!828259))

(assert (=> d!110229 m!828259))

(declare-fun m!828373 () Bool)

(assert (=> d!110229 m!828373))

(assert (=> d!110229 m!828299))

(declare-fun m!828375 () Bool)

(assert (=> b!888330 m!828375))

(assert (=> b!888330 m!828295))

(declare-fun m!828377 () Bool)

(assert (=> b!888330 m!828377))

(declare-fun m!828379 () Bool)

(assert (=> b!888330 m!828379))

(declare-fun m!828381 () Bool)

(assert (=> b!888330 m!828381))

(declare-fun m!828383 () Bool)

(assert (=> b!888330 m!828383))

(assert (=> bm!39411 m!828289))

(assert (=> b!888336 m!828295))

(assert (=> d!110215 d!110229))

(assert (=> d!110215 d!110223))

(declare-fun d!110231 () Bool)

(declare-fun e!494786 () Bool)

(assert (=> d!110231 e!494786))

(declare-fun res!602476 () Bool)

(assert (=> d!110231 (=> res!602476 e!494786)))

(declare-fun lt!401740 () Bool)

(assert (=> d!110231 (= res!602476 (not lt!401740))))

(declare-fun lt!401739 () Bool)

(assert (=> d!110231 (= lt!401740 lt!401739)))

(declare-fun lt!401742 () Unit!30226)

(declare-fun e!494785 () Unit!30226)

(assert (=> d!110231 (= lt!401742 e!494785)))

(declare-fun c!93960 () Bool)

(assert (=> d!110231 (= c!93960 lt!401739)))

(assert (=> d!110231 (= lt!401739 (containsKey!419 (toList!5288 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))))))

(assert (=> d!110231 (= (contains!4284 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))) lt!401740)))

(declare-fun b!888338 () Bool)

(declare-fun lt!401741 () Unit!30226)

(assert (=> b!888338 (= e!494785 lt!401741)))

(assert (=> b!888338 (= lt!401741 (lemmaContainsKeyImpliesGetValueByKeyDefined!313 (toList!5288 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))))))

(assert (=> b!888338 (isDefined!314 (getValueByKey!433 (toList!5288 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))))))

(declare-fun b!888339 () Bool)

(declare-fun Unit!30232 () Unit!30226)

(assert (=> b!888339 (= e!494785 Unit!30232)))

(declare-fun b!888340 () Bool)

(assert (=> b!888340 (= e!494786 (isDefined!314 (getValueByKey!433 (toList!5288 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)))))))

(assert (= (and d!110231 c!93960) b!888338))

(assert (= (and d!110231 (not c!93960)) b!888339))

(assert (= (and d!110231 (not res!602476)) b!888340))

(assert (=> d!110231 m!828277))

(declare-fun m!828385 () Bool)

(assert (=> d!110231 m!828385))

(assert (=> b!888338 m!828277))

(declare-fun m!828387 () Bool)

(assert (=> b!888338 m!828387))

(assert (=> b!888338 m!828277))

(declare-fun m!828389 () Bool)

(assert (=> b!888338 m!828389))

(assert (=> b!888338 m!828389))

(declare-fun m!828391 () Bool)

(assert (=> b!888338 m!828391))

(assert (=> b!888340 m!828277))

(assert (=> b!888340 m!828389))

(assert (=> b!888340 m!828389))

(assert (=> b!888340 m!828391))

(assert (=> b!888215 d!110231))

(declare-fun d!110233 () Bool)

(assert (=> d!110233 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lt!401745 () Unit!30226)

(declare-fun choose!13 (array!51679 (_ BitVec 64) (_ BitVec 32)) Unit!30226)

(assert (=> d!110233 (= lt!401745 (choose!13 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614)))))

(assert (=> d!110233 (bvsge (index!37228 lt!401614) #b00000000000000000000000000000000)))

(assert (=> d!110233 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614)) lt!401745)))

(declare-fun bs!24888 () Bool)

(assert (= bs!24888 d!110233))

(assert (=> bs!24888 m!828289))

(declare-fun m!828393 () Bool)

(assert (=> bs!24888 m!828393))

(assert (=> b!888215 d!110233))

(assert (=> b!888215 d!110225))

(declare-fun d!110235 () Bool)

(declare-fun res!602481 () Bool)

(declare-fun e!494791 () Bool)

(assert (=> d!110235 (=> res!602481 e!494791)))

(assert (=> d!110235 (= res!602481 (= (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) #b00000000000000000000000000000000) key!673))))

(assert (=> d!110235 (= (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000) e!494791)))

(declare-fun b!888345 () Bool)

(declare-fun e!494792 () Bool)

(assert (=> b!888345 (= e!494791 e!494792)))

(declare-fun res!602482 () Bool)

(assert (=> b!888345 (=> (not res!602482) (not e!494792))))

(assert (=> b!888345 (= res!602482 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun b!888346 () Bool)

(assert (=> b!888346 (= e!494792 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110235 (not res!602481)) b!888345))

(assert (= (and b!888345 res!602482) b!888346))

(assert (=> d!110235 m!828305))

(declare-fun m!828395 () Bool)

(assert (=> b!888346 m!828395))

(assert (=> b!888215 d!110235))

(declare-fun d!110237 () Bool)

(declare-fun e!494805 () Bool)

(assert (=> d!110237 e!494805))

(declare-fun c!93966 () Bool)

(assert (=> d!110237 (= c!93966 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!401748 () Unit!30226)

(declare-fun choose!1459 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) (_ BitVec 32) Int) Unit!30226)

(assert (=> d!110237 (= lt!401748 (choose!1459 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(assert (=> d!110237 (validMask!0 (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110237 (= (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673 (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) lt!401748)))

(declare-fun b!888361 () Bool)

(declare-fun e!494806 () Bool)

(assert (=> b!888361 (= e!494805 e!494806)))

(declare-fun c!93965 () Bool)

(assert (=> b!888361 (= c!93965 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888362 () Bool)

(declare-fun res!602489 () Bool)

(declare-fun e!494807 () Bool)

(assert (=> b!888362 (=> (not res!602489) (not e!494807))))

(assert (=> b!888362 (= res!602489 (arrayContainsKey!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!888362 (= e!494806 e!494807)))

(declare-fun bm!39421 () Bool)

(declare-fun call!39427 () ListLongMap!10545)

(declare-fun call!39424 () ListLongMap!10545)

(declare-fun call!39426 () V!28751)

(assert (=> bm!39421 (= call!39426 (apply!392 (ite c!93966 call!39424 call!39427) key!673))))

(declare-fun b!888363 () Bool)

(declare-fun call!39425 () V!28751)

(assert (=> b!888363 (= e!494807 (= call!39425 (get!13143 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888363 (and (bvsge (index!37228 lt!401614) #b00000000000000000000000000000000) (bvslt (index!37228 lt!401614) (size!25291 (_values!5118 (v!11421 (underlying!537 thiss!833))))))))

(declare-fun b!888364 () Bool)

(declare-fun res!602491 () Bool)

(declare-fun e!494803 () Bool)

(assert (=> b!888364 (=> (not res!602491) (not e!494803))))

(assert (=> b!888364 (= res!602491 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!888364 (= e!494806 e!494803)))

(declare-fun b!888365 () Bool)

(declare-fun e!494804 () Bool)

(assert (=> b!888365 (= e!494805 e!494804)))

(declare-fun res!602490 () Bool)

(assert (=> b!888365 (= res!602490 (not (= (bvand (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888365 (=> (not res!602490) (not e!494804))))

(declare-fun bm!39422 () Bool)

(assert (=> bm!39422 (= call!39425 call!39426)))

(declare-fun b!888366 () Bool)

(assert (=> b!888366 (= e!494803 (= call!39425 (minValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bm!39423 () Bool)

(assert (=> bm!39423 (= call!39427 call!39424)))

(declare-fun bm!39424 () Bool)

(assert (=> bm!39424 (= call!39424 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888367 () Bool)

(assert (=> b!888367 (= e!494804 (= call!39426 (zeroValue!4931 (v!11421 (underlying!537 thiss!833)))))))

(assert (= (and d!110237 c!93966) b!888365))

(assert (= (and d!110237 (not c!93966)) b!888361))

(assert (= (and b!888365 res!602490) b!888367))

(assert (= (and b!888361 c!93965) b!888364))

(assert (= (and b!888361 (not c!93965)) b!888362))

(assert (= (and b!888364 res!602491) b!888366))

(assert (= (and b!888362 res!602489) b!888363))

(assert (= (or b!888366 b!888363) bm!39423))

(assert (= (or b!888366 b!888363) bm!39422))

(assert (= (or b!888367 bm!39423) bm!39424))

(assert (= (or b!888367 bm!39422) bm!39421))

(declare-fun b_lambda!12855 () Bool)

(assert (=> (not b_lambda!12855) (not b!888363)))

(assert (=> b!888363 t!24911))

(declare-fun b_and!25745 () Bool)

(assert (= b_and!25743 (and (=> t!24911 result!9957) b_and!25745)))

(assert (=> bm!39424 m!828267))

(assert (=> b!888363 m!828283))

(assert (=> b!888363 m!828275))

(assert (=> b!888363 m!828283))

(assert (=> b!888363 m!828275))

(assert (=> b!888363 m!828285))

(declare-fun m!828397 () Bool)

(assert (=> bm!39421 m!828397))

(assert (=> b!888362 m!828289))

(declare-fun m!828399 () Bool)

(assert (=> d!110237 m!828399))

(assert (=> d!110237 m!828355))

(assert (=> b!888215 d!110237))

(declare-fun d!110239 () Bool)

(declare-fun e!494810 () Bool)

(assert (=> d!110239 e!494810))

(declare-fun res!602494 () Bool)

(assert (=> d!110239 (=> (not res!602494) (not e!494810))))

(assert (=> d!110239 (= res!602494 (and (bvsge (index!37228 lt!401614) #b00000000000000000000000000000000) (bvslt (index!37228 lt!401614) (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833)))))))))

(declare-fun lt!401751 () Unit!30226)

(declare-fun choose!1460 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) Unit!30226)

(assert (=> d!110239 (= lt!401751 (choose!1460 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(assert (=> d!110239 (validMask!0 (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110239 (= (lemmaValidKeyInArrayIsInListMap!200 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) (index!37228 lt!401614) (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) lt!401751)))

(declare-fun b!888370 () Bool)

(assert (=> b!888370 (= e!494810 (contains!4284 (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))) (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))))))

(assert (= (and d!110239 res!602494) b!888370))

(declare-fun m!828401 () Bool)

(assert (=> d!110239 m!828401))

(assert (=> d!110239 m!828355))

(assert (=> b!888370 m!828267))

(assert (=> b!888370 m!828277))

(assert (=> b!888370 m!828267))

(assert (=> b!888370 m!828277))

(assert (=> b!888370 m!828279))

(assert (=> b!888215 d!110239))

(declare-fun d!110241 () Bool)

(declare-fun c!93969 () Bool)

(assert (=> d!110241 (= c!93969 ((_ is ValueCellFull!8438) (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614))))))

(declare-fun e!494813 () V!28751)

(assert (=> d!110241 (= (get!13143 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!494813)))

(declare-fun b!888375 () Bool)

(declare-fun get!13145 (ValueCell!8438 V!28751) V!28751)

(assert (=> b!888375 (= e!494813 (get!13145 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!888376 () Bool)

(declare-fun get!13146 (ValueCell!8438 V!28751) V!28751)

(assert (=> b!888376 (= e!494813 (get!13146 (select (arr!24850 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401614)) (dynLambda!1302 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110241 c!93969) b!888375))

(assert (= (and d!110241 (not c!93969)) b!888376))

(assert (=> b!888375 m!828283))

(assert (=> b!888375 m!828275))

(declare-fun m!828403 () Bool)

(assert (=> b!888375 m!828403))

(assert (=> b!888376 m!828283))

(assert (=> b!888376 m!828275))

(declare-fun m!828405 () Bool)

(assert (=> b!888376 m!828405))

(assert (=> b!888215 d!110241))

(declare-fun d!110243 () Bool)

(declare-fun res!602501 () Bool)

(declare-fun e!494816 () Bool)

(assert (=> d!110243 (=> (not res!602501) (not e!494816))))

(declare-fun simpleValid!287 (LongMapFixedSize!3892) Bool)

(assert (=> d!110243 (= res!602501 (simpleValid!287 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110243 (= (valid!1527 (v!11421 (underlying!537 thiss!833))) e!494816)))

(declare-fun b!888383 () Bool)

(declare-fun res!602502 () Bool)

(assert (=> b!888383 (=> (not res!602502) (not e!494816))))

(declare-fun arrayCountValidKeys!0 (array!51679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888383 (= res!602502 (= (arrayCountValidKeys!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))) (_size!2001 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888384 () Bool)

(declare-fun res!602503 () Bool)

(assert (=> b!888384 (=> (not res!602503) (not e!494816))))

(assert (=> b!888384 (= res!602503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888385 () Bool)

(declare-datatypes ((List!17635 0))(
  ( (Nil!17632) (Cons!17631 (h!18768 (_ BitVec 64)) (t!24914 List!17635)) )
))
(declare-fun arrayNoDuplicates!0 (array!51679 (_ BitVec 32) List!17635) Bool)

(assert (=> b!888385 (= e!494816 (arrayNoDuplicates!0 (_keys!9837 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 Nil!17632))))

(assert (= (and d!110243 res!602501) b!888383))

(assert (= (and b!888383 res!602502) b!888384))

(assert (= (and b!888384 res!602503) b!888385))

(declare-fun m!828407 () Bool)

(assert (=> d!110243 m!828407))

(declare-fun m!828409 () Bool)

(assert (=> b!888383 m!828409))

(declare-fun m!828411 () Bool)

(assert (=> b!888384 m!828411))

(declare-fun m!828413 () Bool)

(assert (=> b!888385 m!828413))

(assert (=> d!110223 d!110243))

(assert (=> b!888208 d!110235))

(assert (=> d!110217 d!110229))

(assert (=> d!110217 d!110243))

(declare-fun d!110245 () Bool)

(declare-fun lt!401760 () SeekEntryResult!8714)

(assert (=> d!110245 (and (or ((_ is MissingVacant!8714) lt!401760) (not ((_ is Found!8714) lt!401760)) (and (bvsge (index!37228 lt!401760) #b00000000000000000000000000000000) (bvslt (index!37228 lt!401760) (size!25292 (_keys!9837 (v!11421 (underlying!537 thiss!833))))))) (not ((_ is MissingVacant!8714) lt!401760)) (or (not ((_ is Found!8714) lt!401760)) (= (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37228 lt!401760)) key!673)))))

(declare-fun e!494824 () SeekEntryResult!8714)

(assert (=> d!110245 (= lt!401760 e!494824)))

(declare-fun c!93977 () Bool)

(declare-fun lt!401763 () SeekEntryResult!8714)

(assert (=> d!110245 (= c!93977 (and ((_ is Intermediate!8714) lt!401763) (undefined!9526 lt!401763)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51679 (_ BitVec 32)) SeekEntryResult!8714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110245 (= lt!401763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!673 (mask!25572 (v!11421 (underlying!537 thiss!833)))) key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(assert (=> d!110245 (validMask!0 (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110245 (= (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))) lt!401760)))

(declare-fun b!888398 () Bool)

(assert (=> b!888398 (= e!494824 Undefined!8714)))

(declare-fun b!888399 () Bool)

(declare-fun e!494825 () SeekEntryResult!8714)

(assert (=> b!888399 (= e!494825 (MissingZero!8714 (index!37229 lt!401763)))))

(declare-fun b!888400 () Bool)

(declare-fun c!93976 () Bool)

(declare-fun lt!401761 () (_ BitVec 64))

(assert (=> b!888400 (= c!93976 (= lt!401761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!494823 () SeekEntryResult!8714)

(assert (=> b!888400 (= e!494823 e!494825)))

(declare-fun b!888401 () Bool)

(assert (=> b!888401 (= e!494823 (Found!8714 (index!37229 lt!401763)))))

(declare-fun b!888402 () Bool)

(declare-fun lt!401762 () SeekEntryResult!8714)

(assert (=> b!888402 (= e!494825 (ite ((_ is MissingVacant!8714) lt!401762) (MissingZero!8714 (index!37230 lt!401762)) lt!401762))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51679 (_ BitVec 32)) SeekEntryResult!8714)

(assert (=> b!888402 (= lt!401762 (seekKeyOrZeroReturnVacant!0 (x!75208 lt!401763) (index!37229 lt!401763) (index!37229 lt!401763) key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun b!888403 () Bool)

(assert (=> b!888403 (= e!494824 e!494823)))

(assert (=> b!888403 (= lt!401761 (select (arr!24851 (_keys!9837 (v!11421 (underlying!537 thiss!833)))) (index!37229 lt!401763)))))

(declare-fun c!93978 () Bool)

(assert (=> b!888403 (= c!93978 (= lt!401761 key!673))))

(assert (= (and d!110245 c!93977) b!888398))

(assert (= (and d!110245 (not c!93977)) b!888403))

(assert (= (and b!888403 c!93978) b!888401))

(assert (= (and b!888403 (not c!93978)) b!888400))

(assert (= (and b!888400 c!93976) b!888399))

(assert (= (and b!888400 (not c!93976)) b!888402))

(declare-fun m!828415 () Bool)

(assert (=> d!110245 m!828415))

(declare-fun m!828417 () Bool)

(assert (=> d!110245 m!828417))

(assert (=> d!110245 m!828417))

(declare-fun m!828419 () Bool)

(assert (=> d!110245 m!828419))

(assert (=> d!110245 m!828355))

(declare-fun m!828421 () Bool)

(assert (=> b!888402 m!828421))

(declare-fun m!828423 () Bool)

(assert (=> b!888403 m!828423))

(assert (=> b!888217 d!110245))

(declare-fun d!110247 () Bool)

(declare-fun e!494828 () Bool)

(assert (=> d!110247 e!494828))

(declare-fun res!602506 () Bool)

(assert (=> d!110247 (=> res!602506 e!494828)))

(declare-fun lt!401769 () SeekEntryResult!8714)

(assert (=> d!110247 (= res!602506 (not ((_ is Found!8714) lt!401769)))))

(assert (=> d!110247 (= lt!401769 (seekEntry!0 key!673 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun lt!401768 () Unit!30226)

(declare-fun choose!1461 (array!51679 array!51677 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64)) Unit!30226)

(assert (=> d!110247 (= lt!401768 (choose!1461 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673))))

(assert (=> d!110247 (validMask!0 (mask!25572 (v!11421 (underlying!537 thiss!833))))))

(assert (=> d!110247 (= (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) key!673) lt!401768)))

(declare-fun b!888406 () Bool)

(assert (=> b!888406 (= e!494828 (inRange!0 (index!37228 lt!401769) (mask!25572 (v!11421 (underlying!537 thiss!833)))))))

(assert (= (and d!110247 (not res!602506)) b!888406))

(assert (=> d!110247 m!828295))

(declare-fun m!828425 () Bool)

(assert (=> d!110247 m!828425))

(assert (=> d!110247 m!828355))

(declare-fun m!828427 () Bool)

(assert (=> b!888406 m!828427))

(assert (=> b!888217 d!110247))

(declare-fun d!110249 () Bool)

(assert (=> d!110249 (= (map!12073 (v!11421 (underlying!537 thiss!833))) (getCurrentListMap!2570 (_keys!9837 (v!11421 (underlying!537 thiss!833))) (_values!5118 (v!11421 (underlying!537 thiss!833))) (mask!25572 (v!11421 (underlying!537 thiss!833))) (extraKeys!4827 (v!11421 (underlying!537 thiss!833))) (zeroValue!4931 (v!11421 (underlying!537 thiss!833))) (minValue!4931 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11421 (underlying!537 thiss!833)))))))

(declare-fun bs!24889 () Bool)

(assert (= bs!24889 d!110249))

(assert (=> bs!24889 m!828267))

(assert (=> d!110213 d!110249))

(declare-fun d!110251 () Bool)

(assert (=> d!110251 (= (get!13144 (getValueByKey!433 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))) key!673)) (v!11422 (getValueByKey!433 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))) key!673)))))

(assert (=> b!888224 d!110251))

(declare-fun d!110253 () Bool)

(declare-fun c!93979 () Bool)

(assert (=> d!110253 (= c!93979 (and ((_ is Cons!17629) (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833))))) (= (_1!5934 (h!18766 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))))) key!673)))))

(declare-fun e!494829 () Option!439)

(assert (=> d!110253 (= (getValueByKey!433 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))) key!673) e!494829)))

(declare-fun b!888410 () Bool)

(declare-fun e!494830 () Option!439)

(assert (=> b!888410 (= e!494830 None!437)))

(declare-fun b!888408 () Bool)

(assert (=> b!888408 (= e!494829 e!494830)))

(declare-fun c!93980 () Bool)

(assert (=> b!888408 (= c!93980 (and ((_ is Cons!17629) (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833))))) (not (= (_1!5934 (h!18766 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833)))))) key!673))))))

(declare-fun b!888409 () Bool)

(assert (=> b!888409 (= e!494830 (getValueByKey!433 (t!24908 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833))))) key!673))))

(declare-fun b!888407 () Bool)

(assert (=> b!888407 (= e!494829 (Some!438 (_2!5934 (h!18766 (toList!5288 (map!12073 (v!11421 (underlying!537 thiss!833))))))))))

(assert (= (and d!110253 c!93979) b!888407))

(assert (= (and d!110253 (not c!93979)) b!888408))

(assert (= (and b!888408 c!93980) b!888409))

(assert (= (and b!888408 (not c!93980)) b!888410))

(declare-fun m!828429 () Bool)

(assert (=> b!888409 m!828429))

(assert (=> b!888224 d!110253))

(assert (=> b!888224 d!110249))

(declare-fun d!110255 () Bool)

(assert (=> d!110255 (= (apply!392 (ite c!93917 call!39382 call!39383) key!673) (get!13144 (getValueByKey!433 (toList!5288 (ite c!93917 call!39382 call!39383)) key!673)))))

(declare-fun bs!24890 () Bool)

(assert (= bs!24890 d!110255))

(declare-fun m!828431 () Bool)

(assert (=> bs!24890 m!828431))

(assert (=> bs!24890 m!828431))

(declare-fun m!828433 () Bool)

(assert (=> bs!24890 m!828433))

(assert (=> bm!39380 d!110255))

(declare-fun d!110257 () Bool)

(assert (=> d!110257 (= (isEmpty!680 (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673)) (not ((_ is Some!438) (getValueByKey!433 (toList!5288 (map!12071 thiss!833)) key!673))))))

(assert (=> d!110209 d!110257))

(declare-fun d!110259 () Bool)

(assert (=> d!110259 (= (inRange!0 (index!37228 lt!401608) (mask!25572 (v!11421 (underlying!537 thiss!833)))) (and (bvsge (index!37228 lt!401608) #b00000000000000000000000000000000) (bvslt (index!37228 lt!401608) (bvadd (mask!25572 (v!11421 (underlying!537 thiss!833))) #b00000000000000000000000000000001))))))

(assert (=> b!888219 d!110259))

(declare-fun d!110261 () Bool)

(declare-fun c!93981 () Bool)

(assert (=> d!110261 (= c!93981 (and ((_ is Cons!17629) (t!24908 (toList!5288 (map!12071 thiss!833)))) (= (_1!5934 (h!18766 (t!24908 (toList!5288 (map!12071 thiss!833))))) key!673)))))

(declare-fun e!494831 () Option!439)

(assert (=> d!110261 (= (getValueByKey!433 (t!24908 (toList!5288 (map!12071 thiss!833))) key!673) e!494831)))

(declare-fun b!888414 () Bool)

(declare-fun e!494832 () Option!439)

(assert (=> b!888414 (= e!494832 None!437)))

(declare-fun b!888412 () Bool)

(assert (=> b!888412 (= e!494831 e!494832)))

(declare-fun c!93982 () Bool)

(assert (=> b!888412 (= c!93982 (and ((_ is Cons!17629) (t!24908 (toList!5288 (map!12071 thiss!833)))) (not (= (_1!5934 (h!18766 (t!24908 (toList!5288 (map!12071 thiss!833))))) key!673))))))

(declare-fun b!888413 () Bool)

(assert (=> b!888413 (= e!494832 (getValueByKey!433 (t!24908 (t!24908 (toList!5288 (map!12071 thiss!833)))) key!673))))

(declare-fun b!888411 () Bool)

(assert (=> b!888411 (= e!494831 (Some!438 (_2!5934 (h!18766 (t!24908 (toList!5288 (map!12071 thiss!833)))))))))

(assert (= (and d!110261 c!93981) b!888411))

(assert (= (and d!110261 (not c!93981)) b!888412))

(assert (= (and b!888412 c!93982) b!888413))

(assert (= (and b!888412 (not c!93982)) b!888414))

(declare-fun m!828435 () Bool)

(assert (=> b!888413 m!828435))

(assert (=> b!888170 d!110261))

(assert (=> b!888212 d!110241))

(declare-fun mapIsEmpty!28288 () Bool)

(declare-fun mapRes!28288 () Bool)

(assert (=> mapIsEmpty!28288 mapRes!28288))

(declare-fun mapNonEmpty!28288 () Bool)

(declare-fun tp!54484 () Bool)

(declare-fun e!494834 () Bool)

(assert (=> mapNonEmpty!28288 (= mapRes!28288 (and tp!54484 e!494834))))

(declare-fun mapKey!28288 () (_ BitVec 32))

(declare-fun mapRest!28288 () (Array (_ BitVec 32) ValueCell!8438))

(declare-fun mapValue!28288 () ValueCell!8438)

(assert (=> mapNonEmpty!28288 (= mapRest!28287 (store mapRest!28288 mapKey!28288 mapValue!28288))))

(declare-fun b!888416 () Bool)

(declare-fun e!494833 () Bool)

(assert (=> b!888416 (= e!494833 tp_is_empty!17839)))

(declare-fun b!888415 () Bool)

(assert (=> b!888415 (= e!494834 tp_is_empty!17839)))

(declare-fun condMapEmpty!28288 () Bool)

(declare-fun mapDefault!28288 () ValueCell!8438)

(assert (=> mapNonEmpty!28287 (= condMapEmpty!28288 (= mapRest!28287 ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28288)))))

(assert (=> mapNonEmpty!28287 (= tp!54483 (and e!494833 mapRes!28288))))

(assert (= (and mapNonEmpty!28287 condMapEmpty!28288) mapIsEmpty!28288))

(assert (= (and mapNonEmpty!28287 (not condMapEmpty!28288)) mapNonEmpty!28288))

(assert (= (and mapNonEmpty!28288 ((_ is ValueCellFull!8438) mapValue!28288)) b!888415))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8438) mapDefault!28288)) b!888416))

(declare-fun m!828437 () Bool)

(assert (=> mapNonEmpty!28288 m!828437))

(declare-fun b_lambda!12857 () Bool)

(assert (= b_lambda!12855 (or (and b!888105 b_free!15511) b_lambda!12857)))

(declare-fun b_lambda!12859 () Bool)

(assert (= b_lambda!12853 (or (and b!888105 b_free!15511) b_lambda!12859)))

(check-sat (not b!888330) (not bm!39400) (not bm!39410) (not b!888376) (not b!888383) (not d!110225) (not mapNonEmpty!28288) (not b!888281) (not bm!39421) (not bm!39398) (not bm!39424) (not b!888336) (not d!110239) (not b_lambda!12851) (not b!888286) (not b!888340) (not b!888402) (not d!110255) (not b_lambda!12857) (not b!888406) (not b!888370) (not d!110249) (not b!888328) (not bm!39401) (not b!888385) (not b!888409) (not d!110233) (not b_lambda!12845) (not b_lambda!12847) (not b_lambda!12843) (not bm!39412) (not b!888363) (not d!110247) (not b_next!15511) (not b_lambda!12849) (not b!888362) (not b!888413) (not b_lambda!12859) (not b!888305) (not b!888375) (not bm!39402) (not b!888289) (not d!110229) (not b!888278) (not b!888283) b_and!25745 (not b!888346) (not d!110245) (not b!888307) (not b!888338) (not d!110227) tp_is_empty!17839 (not b!888296) (not bm!39411) (not b!888280) (not b!888384) (not d!110231) (not b!888294) (not d!110243) (not d!110237))
(check-sat b_and!25745 (not b_next!15511))
