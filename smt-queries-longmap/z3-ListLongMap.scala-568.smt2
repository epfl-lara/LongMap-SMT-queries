; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15464 () Bool)

(assert start!15464)

(declare-fun b!153568 () Bool)

(declare-fun b_free!3205 () Bool)

(declare-fun b_next!3205 () Bool)

(assert (=> b!153568 (= b_free!3205 (not b_next!3205))))

(declare-fun tp!12133 () Bool)

(declare-fun b_and!9541 () Bool)

(assert (=> b!153568 (= tp!12133 b_and!9541)))

(declare-fun b!153564 () Bool)

(declare-fun b_free!3207 () Bool)

(declare-fun b_next!3207 () Bool)

(assert (=> b!153564 (= b_free!3207 (not b_next!3207))))

(declare-fun tp!12132 () Bool)

(declare-fun b_and!9543 () Bool)

(assert (=> b!153564 (= tp!12132 b_and!9543)))

(declare-fun b!153557 () Bool)

(declare-fun res!72528 () Bool)

(declare-fun e!100297 () Bool)

(assert (=> b!153557 (=> (not res!72528) (not e!100297))))

(declare-datatypes ((V!3673 0))(
  ( (V!3674 (val!1554 Int)) )
))
(declare-datatypes ((array!5067 0))(
  ( (array!5068 (arr!2392 (Array (_ BitVec 32) (_ BitVec 64))) (size!2670 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1166 0))(
  ( (ValueCellFull!1166 (v!3404 V!3673)) (EmptyCell!1166) )
))
(declare-datatypes ((array!5069 0))(
  ( (array!5070 (arr!2393 (Array (_ BitVec 32) ValueCell!1166)) (size!2671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1240 0))(
  ( (LongMapFixedSize!1241 (defaultEntry!3059 Int) (mask!7460 (_ BitVec 32)) (extraKeys!2800 (_ BitVec 32)) (zeroValue!2902 V!3673) (minValue!2902 V!3673) (_size!669 (_ BitVec 32)) (_keys!4831 array!5067) (_values!3042 array!5069) (_vacant!669 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1014 0))(
  ( (Cell!1015 (v!3405 LongMapFixedSize!1240)) )
))
(declare-datatypes ((LongMap!1014 0))(
  ( (LongMap!1015 (underlying!518 Cell!1014)) )
))
(declare-fun thiss!992 () LongMap!1014)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153557 (= res!72528 (and (or (= (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5144 () Bool)

(declare-fun mapRes!5143 () Bool)

(assert (=> mapIsEmpty!5144 mapRes!5143))

(declare-fun b!153558 () Bool)

(declare-fun e!100303 () Bool)

(declare-fun tp_is_empty!3019 () Bool)

(assert (=> b!153558 (= e!100303 tp_is_empty!3019)))

(declare-fun b!153559 () Bool)

(declare-fun res!72535 () Bool)

(assert (=> b!153559 (=> (not res!72535) (not e!100297))))

(declare-fun newMap!16 () LongMapFixedSize!1240)

(assert (=> b!153559 (= res!72535 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7460 newMap!16)) (_size!669 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun b!153560 () Bool)

(declare-fun e!100294 () Bool)

(declare-fun mapRes!5144 () Bool)

(assert (=> b!153560 (= e!100294 (and e!100303 mapRes!5144))))

(declare-fun condMapEmpty!5143 () Bool)

(declare-fun mapDefault!5143 () ValueCell!1166)

(assert (=> b!153560 (= condMapEmpty!5143 (= (arr!2393 (_values!3042 (v!3405 (underlying!518 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5143)))))

(declare-fun b!153561 () Bool)

(declare-fun e!100298 () Bool)

(assert (=> b!153561 (= e!100298 tp_is_empty!3019)))

(declare-fun b!153562 () Bool)

(declare-fun e!100295 () Bool)

(assert (=> b!153562 (= e!100297 e!100295)))

(declare-fun res!72534 () Bool)

(assert (=> b!153562 (=> (not res!72534) (not e!100295))))

(declare-datatypes ((tuple2!2790 0))(
  ( (tuple2!2791 (_1!1406 Bool) (_2!1406 LongMapFixedSize!1240)) )
))
(declare-fun lt!80489 () tuple2!2790)

(assert (=> b!153562 (= res!72534 (_1!1406 lt!80489))))

(declare-fun repackFrom!21 (LongMap!1014 LongMapFixedSize!1240 (_ BitVec 32)) tuple2!2790)

(assert (=> b!153562 (= lt!80489 (repackFrom!21 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!153563 () Bool)

(declare-fun e!100296 () Bool)

(declare-datatypes ((tuple2!2792 0))(
  ( (tuple2!2793 (_1!1407 (_ BitVec 64)) (_2!1407 V!3673)) )
))
(declare-datatypes ((List!1804 0))(
  ( (Nil!1801) (Cons!1800 (h!2409 tuple2!2792) (t!6585 List!1804)) )
))
(declare-datatypes ((ListLongMap!1783 0))(
  ( (ListLongMap!1784 (toList!907 List!1804)) )
))
(declare-fun map!1481 (LongMapFixedSize!1240) ListLongMap!1783)

(assert (=> b!153563 (= e!100296 (not (= (map!1481 (_2!1406 lt!80489)) (map!1481 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun e!100302 () Bool)

(declare-fun e!100300 () Bool)

(declare-fun array_inv!1531 (array!5067) Bool)

(declare-fun array_inv!1532 (array!5069) Bool)

(assert (=> b!153564 (= e!100300 (and tp!12132 tp_is_empty!3019 (array_inv!1531 (_keys!4831 newMap!16)) (array_inv!1532 (_values!3042 newMap!16)) e!100302))))

(declare-fun b!153565 () Bool)

(declare-fun e!100293 () Bool)

(declare-fun e!100292 () Bool)

(assert (=> b!153565 (= e!100293 e!100292)))

(declare-fun mapNonEmpty!5143 () Bool)

(declare-fun tp!12131 () Bool)

(declare-fun e!100291 () Bool)

(assert (=> mapNonEmpty!5143 (= mapRes!5143 (and tp!12131 e!100291))))

(declare-fun mapRest!5143 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapValue!5143 () ValueCell!1166)

(declare-fun mapKey!5143 () (_ BitVec 32))

(assert (=> mapNonEmpty!5143 (= (arr!2393 (_values!3042 newMap!16)) (store mapRest!5143 mapKey!5143 mapValue!5143))))

(declare-fun mapIsEmpty!5143 () Bool)

(assert (=> mapIsEmpty!5143 mapRes!5144))

(declare-fun res!72533 () Bool)

(assert (=> start!15464 (=> (not res!72533) (not e!100297))))

(declare-fun valid!617 (LongMap!1014) Bool)

(assert (=> start!15464 (= res!72533 (valid!617 thiss!992))))

(assert (=> start!15464 e!100297))

(declare-fun e!100304 () Bool)

(assert (=> start!15464 e!100304))

(assert (=> start!15464 true))

(assert (=> start!15464 e!100300))

(declare-fun b!153566 () Bool)

(declare-fun e!100301 () Bool)

(assert (=> b!153566 (= e!100301 tp_is_empty!3019)))

(declare-fun mapNonEmpty!5144 () Bool)

(declare-fun tp!12134 () Bool)

(assert (=> mapNonEmpty!5144 (= mapRes!5144 (and tp!12134 e!100298))))

(declare-fun mapKey!5144 () (_ BitVec 32))

(declare-fun mapValue!5144 () ValueCell!1166)

(declare-fun mapRest!5144 () (Array (_ BitVec 32) ValueCell!1166))

(assert (=> mapNonEmpty!5144 (= (arr!2393 (_values!3042 (v!3405 (underlying!518 thiss!992)))) (store mapRest!5144 mapKey!5144 mapValue!5144))))

(declare-fun b!153567 () Bool)

(assert (=> b!153567 (= e!100304 e!100293)))

(assert (=> b!153568 (= e!100292 (and tp!12133 tp_is_empty!3019 (array_inv!1531 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (array_inv!1532 (_values!3042 (v!3405 (underlying!518 thiss!992)))) e!100294))))

(declare-fun b!153569 () Bool)

(declare-fun res!72529 () Bool)

(assert (=> b!153569 (=> (not res!72529) (not e!100297))))

(declare-fun getCurrentListMap!559 (array!5067 array!5069 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 32) Int) ListLongMap!1783)

(assert (=> b!153569 (= res!72529 (= (getCurrentListMap!559 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))) (map!1481 newMap!16)))))

(declare-fun b!153570 () Bool)

(declare-fun res!72530 () Bool)

(assert (=> b!153570 (=> (not res!72530) (not e!100297))))

(assert (=> b!153570 (= res!72530 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun b!153571 () Bool)

(assert (=> b!153571 (= e!100295 e!100296)))

(declare-fun res!72531 () Bool)

(assert (=> b!153571 (=> res!72531 e!100296)))

(declare-fun valid!618 (LongMapFixedSize!1240) Bool)

(assert (=> b!153571 (= res!72531 (not (valid!618 (_2!1406 lt!80489))))))

(declare-fun b!153572 () Bool)

(declare-fun res!72532 () Bool)

(assert (=> b!153572 (=> (not res!72532) (not e!100297))))

(assert (=> b!153572 (= res!72532 (valid!618 newMap!16))))

(declare-fun b!153573 () Bool)

(assert (=> b!153573 (= e!100302 (and e!100301 mapRes!5143))))

(declare-fun condMapEmpty!5144 () Bool)

(declare-fun mapDefault!5144 () ValueCell!1166)

(assert (=> b!153573 (= condMapEmpty!5144 (= (arr!2393 (_values!3042 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5144)))))

(declare-fun b!153574 () Bool)

(assert (=> b!153574 (= e!100291 tp_is_empty!3019)))

(assert (= (and start!15464 res!72533) b!153570))

(assert (= (and b!153570 res!72530) b!153572))

(assert (= (and b!153572 res!72532) b!153559))

(assert (= (and b!153559 res!72535) b!153569))

(assert (= (and b!153569 res!72529) b!153557))

(assert (= (and b!153557 res!72528) b!153562))

(assert (= (and b!153562 res!72534) b!153571))

(assert (= (and b!153571 (not res!72531)) b!153563))

(assert (= (and b!153560 condMapEmpty!5143) mapIsEmpty!5143))

(assert (= (and b!153560 (not condMapEmpty!5143)) mapNonEmpty!5144))

(get-info :version)

(assert (= (and mapNonEmpty!5144 ((_ is ValueCellFull!1166) mapValue!5144)) b!153561))

(assert (= (and b!153560 ((_ is ValueCellFull!1166) mapDefault!5143)) b!153558))

(assert (= b!153568 b!153560))

(assert (= b!153565 b!153568))

(assert (= b!153567 b!153565))

(assert (= start!15464 b!153567))

(assert (= (and b!153573 condMapEmpty!5144) mapIsEmpty!5144))

(assert (= (and b!153573 (not condMapEmpty!5144)) mapNonEmpty!5143))

(assert (= (and mapNonEmpty!5143 ((_ is ValueCellFull!1166) mapValue!5143)) b!153574))

(assert (= (and b!153573 ((_ is ValueCellFull!1166) mapDefault!5144)) b!153566))

(assert (= b!153564 b!153573))

(assert (= start!15464 b!153564))

(declare-fun m!186905 () Bool)

(assert (=> b!153557 m!186905))

(declare-fun m!186907 () Bool)

(assert (=> b!153562 m!186907))

(declare-fun m!186909 () Bool)

(assert (=> start!15464 m!186909))

(declare-fun m!186911 () Bool)

(assert (=> b!153572 m!186911))

(declare-fun m!186913 () Bool)

(assert (=> b!153571 m!186913))

(declare-fun m!186915 () Bool)

(assert (=> mapNonEmpty!5143 m!186915))

(declare-fun m!186917 () Bool)

(assert (=> b!153568 m!186917))

(declare-fun m!186919 () Bool)

(assert (=> b!153568 m!186919))

(declare-fun m!186921 () Bool)

(assert (=> mapNonEmpty!5144 m!186921))

(declare-fun m!186923 () Bool)

(assert (=> b!153564 m!186923))

(declare-fun m!186925 () Bool)

(assert (=> b!153564 m!186925))

(declare-fun m!186927 () Bool)

(assert (=> b!153563 m!186927))

(declare-fun m!186929 () Bool)

(assert (=> b!153563 m!186929))

(declare-fun m!186931 () Bool)

(assert (=> b!153569 m!186931))

(declare-fun m!186933 () Bool)

(assert (=> b!153569 m!186933))

(check-sat b_and!9541 (not b!153563) (not b!153562) (not start!15464) (not b!153572) (not b!153564) (not b!153571) (not mapNonEmpty!5144) (not b!153569) (not mapNonEmpty!5143) tp_is_empty!3019 (not b!153568) (not b_next!3205) (not b_next!3207) b_and!9543)
(check-sat b_and!9541 b_and!9543 (not b_next!3205) (not b_next!3207))
(get-model)

(declare-fun bm!17063 () Bool)

(declare-fun call!17072 () ListLongMap!1783)

(declare-fun call!17069 () ListLongMap!1783)

(assert (=> bm!17063 (= call!17072 call!17069)))

(declare-fun b!153726 () Bool)

(declare-datatypes ((Unit!4882 0))(
  ( (Unit!4883) )
))
(declare-fun e!100434 () Unit!4882)

(declare-fun Unit!4884 () Unit!4882)

(assert (=> b!153726 (= e!100434 Unit!4884)))

(declare-fun bm!17064 () Bool)

(declare-fun call!17070 () ListLongMap!1783)

(declare-fun call!17067 () ListLongMap!1783)

(assert (=> bm!17064 (= call!17070 call!17067)))

(declare-fun b!153727 () Bool)

(declare-fun e!100431 () ListLongMap!1783)

(declare-fun call!17068 () ListLongMap!1783)

(assert (=> b!153727 (= e!100431 call!17068)))

(declare-fun bm!17065 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!148 (array!5067 array!5069 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 32) Int) ListLongMap!1783)

(assert (=> bm!17065 (= call!17067 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun b!153728 () Bool)

(declare-fun e!100428 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!153728 (= e!100428 (validKeyInArray!0 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!153729 () Bool)

(declare-fun e!100429 () Bool)

(declare-fun call!17071 () Bool)

(assert (=> b!153729 (= e!100429 (not call!17071))))

(declare-fun b!153730 () Bool)

(declare-fun e!100433 () Bool)

(declare-fun e!100430 () Bool)

(assert (=> b!153730 (= e!100433 e!100430)))

(declare-fun c!29449 () Bool)

(assert (=> b!153730 (= c!29449 (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!50405 () Bool)

(assert (=> d!50405 e!100433))

(declare-fun res!72608 () Bool)

(assert (=> d!50405 (=> (not res!72608) (not e!100433))))

(assert (=> d!50405 (= res!72608 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))))))))

(declare-fun lt!80553 () ListLongMap!1783)

(declare-fun lt!80544 () ListLongMap!1783)

(assert (=> d!50405 (= lt!80553 lt!80544)))

(declare-fun lt!80547 () Unit!4882)

(assert (=> d!50405 (= lt!80547 e!100434)))

(declare-fun c!29448 () Bool)

(declare-fun e!100427 () Bool)

(assert (=> d!50405 (= c!29448 e!100427)))

(declare-fun res!72604 () Bool)

(assert (=> d!50405 (=> (not res!72604) (not e!100427))))

(assert (=> d!50405 (= res!72604 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun e!100426 () ListLongMap!1783)

(assert (=> d!50405 (= lt!80544 e!100426)))

(declare-fun c!29450 () Bool)

(assert (=> d!50405 (= c!29450 (and (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50405 (validMask!0 (mask!7460 (v!3405 (underlying!518 thiss!992))))))

(assert (=> d!50405 (= (getCurrentListMap!559 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))) lt!80553)))

(declare-fun b!153725 () Bool)

(declare-fun e!100424 () Bool)

(declare-fun e!100423 () Bool)

(assert (=> b!153725 (= e!100424 e!100423)))

(declare-fun res!72607 () Bool)

(assert (=> b!153725 (=> (not res!72607) (not e!100423))))

(declare-fun contains!952 (ListLongMap!1783 (_ BitVec 64)) Bool)

(assert (=> b!153725 (= res!72607 (contains!952 lt!80553 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!153725 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun b!153731 () Bool)

(declare-fun res!72605 () Bool)

(assert (=> b!153731 (=> (not res!72605) (not e!100433))))

(assert (=> b!153731 (= res!72605 e!100424)))

(declare-fun res!72602 () Bool)

(assert (=> b!153731 (=> res!72602 e!100424)))

(assert (=> b!153731 (= res!72602 (not e!100428))))

(declare-fun res!72609 () Bool)

(assert (=> b!153731 (=> (not res!72609) (not e!100428))))

(assert (=> b!153731 (= res!72609 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun b!153732 () Bool)

(declare-fun e!100422 () Bool)

(declare-fun apply!127 (ListLongMap!1783 (_ BitVec 64)) V!3673)

(assert (=> b!153732 (= e!100422 (= (apply!127 lt!80553 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun b!153733 () Bool)

(declare-fun +!180 (ListLongMap!1783 tuple2!2792) ListLongMap!1783)

(assert (=> b!153733 (= e!100426 (+!180 call!17069 (tuple2!2793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2902 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun b!153734 () Bool)

(declare-fun c!29447 () Bool)

(assert (=> b!153734 (= c!29447 (and (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!100425 () ListLongMap!1783)

(assert (=> b!153734 (= e!100425 e!100431)))

(declare-fun bm!17066 () Bool)

(assert (=> bm!17066 (= call!17068 call!17070)))

(declare-fun b!153735 () Bool)

(declare-fun e!100432 () Bool)

(assert (=> b!153735 (= e!100430 e!100432)))

(declare-fun res!72606 () Bool)

(declare-fun call!17066 () Bool)

(assert (=> b!153735 (= res!72606 call!17066)))

(assert (=> b!153735 (=> (not res!72606) (not e!100432))))

(declare-fun b!153736 () Bool)

(assert (=> b!153736 (= e!100431 call!17072)))

(declare-fun bm!17067 () Bool)

(assert (=> bm!17067 (= call!17066 (contains!952 lt!80553 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153737 () Bool)

(assert (=> b!153737 (= e!100432 (= (apply!127 lt!80553 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2902 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun bm!17068 () Bool)

(assert (=> bm!17068 (= call!17071 (contains!952 lt!80553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153738 () Bool)

(declare-fun get!1599 (ValueCell!1166 V!3673) V!3673)

(declare-fun dynLambda!461 (Int (_ BitVec 64)) V!3673)

(assert (=> b!153738 (= e!100423 (= (apply!127 lt!80553 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1599 (select (arr!2393 (_values!3042 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!461 (defaultEntry!3059 (v!3405 (underlying!518 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!153738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2671 (_values!3042 (v!3405 (underlying!518 thiss!992))))))))

(assert (=> b!153738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun bm!17069 () Bool)

(declare-fun c!29451 () Bool)

(assert (=> bm!17069 (= call!17069 (+!180 (ite c!29450 call!17067 (ite c!29451 call!17070 call!17068)) (ite (or c!29450 c!29451) (tuple2!2793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun b!153739 () Bool)

(assert (=> b!153739 (= e!100429 e!100422)))

(declare-fun res!72603 () Bool)

(assert (=> b!153739 (= res!72603 call!17071)))

(assert (=> b!153739 (=> (not res!72603) (not e!100422))))

(declare-fun b!153740 () Bool)

(assert (=> b!153740 (= e!100425 call!17072)))

(declare-fun b!153741 () Bool)

(declare-fun res!72610 () Bool)

(assert (=> b!153741 (=> (not res!72610) (not e!100433))))

(assert (=> b!153741 (= res!72610 e!100429)))

(declare-fun c!29452 () Bool)

(assert (=> b!153741 (= c!29452 (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!153742 () Bool)

(declare-fun lt!80551 () Unit!4882)

(assert (=> b!153742 (= e!100434 lt!80551)))

(declare-fun lt!80543 () ListLongMap!1783)

(assert (=> b!153742 (= lt!80543 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun lt!80556 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80549 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80549 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80550 () Unit!4882)

(declare-fun addStillContains!103 (ListLongMap!1783 (_ BitVec 64) V!3673 (_ BitVec 64)) Unit!4882)

(assert (=> b!153742 (= lt!80550 (addStillContains!103 lt!80543 lt!80556 (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) lt!80549))))

(assert (=> b!153742 (contains!952 (+!180 lt!80543 (tuple2!2793 lt!80556 (zeroValue!2902 (v!3405 (underlying!518 thiss!992))))) lt!80549)))

(declare-fun lt!80548 () Unit!4882)

(assert (=> b!153742 (= lt!80548 lt!80550)))

(declare-fun lt!80557 () ListLongMap!1783)

(assert (=> b!153742 (= lt!80557 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun lt!80546 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80546 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80541 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80541 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80559 () Unit!4882)

(declare-fun addApplyDifferent!103 (ListLongMap!1783 (_ BitVec 64) V!3673 (_ BitVec 64)) Unit!4882)

(assert (=> b!153742 (= lt!80559 (addApplyDifferent!103 lt!80557 lt!80546 (minValue!2902 (v!3405 (underlying!518 thiss!992))) lt!80541))))

(assert (=> b!153742 (= (apply!127 (+!180 lt!80557 (tuple2!2793 lt!80546 (minValue!2902 (v!3405 (underlying!518 thiss!992))))) lt!80541) (apply!127 lt!80557 lt!80541))))

(declare-fun lt!80542 () Unit!4882)

(assert (=> b!153742 (= lt!80542 lt!80559)))

(declare-fun lt!80552 () ListLongMap!1783)

(assert (=> b!153742 (= lt!80552 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun lt!80540 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80545 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80545 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80560 () Unit!4882)

(assert (=> b!153742 (= lt!80560 (addApplyDifferent!103 lt!80552 lt!80540 (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) lt!80545))))

(assert (=> b!153742 (= (apply!127 (+!180 lt!80552 (tuple2!2793 lt!80540 (zeroValue!2902 (v!3405 (underlying!518 thiss!992))))) lt!80545) (apply!127 lt!80552 lt!80545))))

(declare-fun lt!80561 () Unit!4882)

(assert (=> b!153742 (= lt!80561 lt!80560)))

(declare-fun lt!80558 () ListLongMap!1783)

(assert (=> b!153742 (= lt!80558 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun lt!80555 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80555 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80554 () (_ BitVec 64))

(assert (=> b!153742 (= lt!80554 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!153742 (= lt!80551 (addApplyDifferent!103 lt!80558 lt!80555 (minValue!2902 (v!3405 (underlying!518 thiss!992))) lt!80554))))

(assert (=> b!153742 (= (apply!127 (+!180 lt!80558 (tuple2!2793 lt!80555 (minValue!2902 (v!3405 (underlying!518 thiss!992))))) lt!80554) (apply!127 lt!80558 lt!80554))))

(declare-fun b!153743 () Bool)

(assert (=> b!153743 (= e!100430 (not call!17066))))

(declare-fun b!153744 () Bool)

(assert (=> b!153744 (= e!100427 (validKeyInArray!0 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!153745 () Bool)

(assert (=> b!153745 (= e!100426 e!100425)))

(assert (=> b!153745 (= c!29451 (and (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!50405 c!29450) b!153733))

(assert (= (and d!50405 (not c!29450)) b!153745))

(assert (= (and b!153745 c!29451) b!153740))

(assert (= (and b!153745 (not c!29451)) b!153734))

(assert (= (and b!153734 c!29447) b!153736))

(assert (= (and b!153734 (not c!29447)) b!153727))

(assert (= (or b!153736 b!153727) bm!17066))

(assert (= (or b!153740 bm!17066) bm!17064))

(assert (= (or b!153740 b!153736) bm!17063))

(assert (= (or b!153733 bm!17064) bm!17065))

(assert (= (or b!153733 bm!17063) bm!17069))

(assert (= (and d!50405 res!72604) b!153744))

(assert (= (and d!50405 c!29448) b!153742))

(assert (= (and d!50405 (not c!29448)) b!153726))

(assert (= (and d!50405 res!72608) b!153731))

(assert (= (and b!153731 res!72609) b!153728))

(assert (= (and b!153731 (not res!72602)) b!153725))

(assert (= (and b!153725 res!72607) b!153738))

(assert (= (and b!153731 res!72605) b!153741))

(assert (= (and b!153741 c!29452) b!153739))

(assert (= (and b!153741 (not c!29452)) b!153729))

(assert (= (and b!153739 res!72603) b!153732))

(assert (= (or b!153739 b!153729) bm!17068))

(assert (= (and b!153741 res!72610) b!153730))

(assert (= (and b!153730 c!29449) b!153735))

(assert (= (and b!153730 (not c!29449)) b!153743))

(assert (= (and b!153735 res!72606) b!153737))

(assert (= (or b!153735 b!153743) bm!17067))

(declare-fun b_lambda!6817 () Bool)

(assert (=> (not b_lambda!6817) (not b!153738)))

(declare-fun t!6588 () Bool)

(declare-fun tb!2745 () Bool)

(assert (=> (and b!153568 (= (defaultEntry!3059 (v!3405 (underlying!518 thiss!992))) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))) t!6588) tb!2745))

(declare-fun result!4473 () Bool)

(assert (=> tb!2745 (= result!4473 tp_is_empty!3019)))

(assert (=> b!153738 t!6588))

(declare-fun b_and!9553 () Bool)

(assert (= b_and!9541 (and (=> t!6588 result!4473) b_and!9553)))

(declare-fun t!6590 () Bool)

(declare-fun tb!2747 () Bool)

(assert (=> (and b!153564 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))) t!6590) tb!2747))

(declare-fun result!4477 () Bool)

(assert (= result!4477 result!4473))

(assert (=> b!153738 t!6590))

(declare-fun b_and!9555 () Bool)

(assert (= b_and!9543 (and (=> t!6590 result!4477) b_and!9555)))

(declare-fun m!186995 () Bool)

(assert (=> b!153733 m!186995))

(declare-fun m!186997 () Bool)

(assert (=> b!153742 m!186997))

(declare-fun m!186999 () Bool)

(assert (=> b!153742 m!186999))

(declare-fun m!187001 () Bool)

(assert (=> b!153742 m!187001))

(declare-fun m!187003 () Bool)

(assert (=> b!153742 m!187003))

(declare-fun m!187005 () Bool)

(assert (=> b!153742 m!187005))

(declare-fun m!187007 () Bool)

(assert (=> b!153742 m!187007))

(declare-fun m!187009 () Bool)

(assert (=> b!153742 m!187009))

(declare-fun m!187011 () Bool)

(assert (=> b!153742 m!187011))

(declare-fun m!187013 () Bool)

(assert (=> b!153742 m!187013))

(declare-fun m!187015 () Bool)

(assert (=> b!153742 m!187015))

(assert (=> b!153742 m!187013))

(assert (=> b!153742 m!187001))

(declare-fun m!187017 () Bool)

(assert (=> b!153742 m!187017))

(declare-fun m!187019 () Bool)

(assert (=> b!153742 m!187019))

(declare-fun m!187021 () Bool)

(assert (=> b!153742 m!187021))

(assert (=> b!153742 m!187017))

(declare-fun m!187023 () Bool)

(assert (=> b!153742 m!187023))

(declare-fun m!187025 () Bool)

(assert (=> b!153742 m!187025))

(assert (=> b!153742 m!187005))

(declare-fun m!187027 () Bool)

(assert (=> b!153742 m!187027))

(declare-fun m!187029 () Bool)

(assert (=> b!153742 m!187029))

(assert (=> b!153738 m!187019))

(declare-fun m!187031 () Bool)

(assert (=> b!153738 m!187031))

(declare-fun m!187033 () Bool)

(assert (=> b!153738 m!187033))

(declare-fun m!187035 () Bool)

(assert (=> b!153738 m!187035))

(assert (=> b!153738 m!187033))

(assert (=> b!153738 m!187035))

(declare-fun m!187037 () Bool)

(assert (=> b!153738 m!187037))

(assert (=> b!153738 m!187019))

(declare-fun m!187039 () Bool)

(assert (=> bm!17068 m!187039))

(assert (=> bm!17065 m!186999))

(assert (=> b!153728 m!187019))

(assert (=> b!153728 m!187019))

(declare-fun m!187041 () Bool)

(assert (=> b!153728 m!187041))

(assert (=> b!153725 m!187019))

(assert (=> b!153725 m!187019))

(declare-fun m!187043 () Bool)

(assert (=> b!153725 m!187043))

(declare-fun m!187045 () Bool)

(assert (=> b!153737 m!187045))

(declare-fun m!187047 () Bool)

(assert (=> bm!17069 m!187047))

(assert (=> b!153744 m!187019))

(assert (=> b!153744 m!187019))

(assert (=> b!153744 m!187041))

(declare-fun m!187049 () Bool)

(assert (=> bm!17067 m!187049))

(declare-fun m!187051 () Bool)

(assert (=> b!153732 m!187051))

(declare-fun m!187053 () Bool)

(assert (=> d!50405 m!187053))

(assert (=> b!153569 d!50405))

(declare-fun d!50407 () Bool)

(assert (=> d!50407 (= (map!1481 newMap!16) (getCurrentListMap!559 (_keys!4831 newMap!16) (_values!3042 newMap!16) (mask!7460 newMap!16) (extraKeys!2800 newMap!16) (zeroValue!2902 newMap!16) (minValue!2902 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3059 newMap!16)))))

(declare-fun bs!6482 () Bool)

(assert (= bs!6482 d!50407))

(declare-fun m!187055 () Bool)

(assert (=> bs!6482 m!187055))

(assert (=> b!153569 d!50407))

(declare-fun d!50409 () Bool)

(assert (=> d!50409 (= (array_inv!1531 (_keys!4831 newMap!16)) (bvsge (size!2670 (_keys!4831 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153564 d!50409))

(declare-fun d!50411 () Bool)

(assert (=> d!50411 (= (array_inv!1532 (_values!3042 newMap!16)) (bvsge (size!2671 (_values!3042 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153564 d!50411))

(declare-fun d!50413 () Bool)

(assert (=> d!50413 (= (valid!617 thiss!992) (valid!618 (v!3405 (underlying!518 thiss!992))))))

(declare-fun bs!6483 () Bool)

(assert (= bs!6483 d!50413))

(declare-fun m!187057 () Bool)

(assert (=> bs!6483 m!187057))

(assert (=> start!15464 d!50413))

(declare-fun d!50415 () Bool)

(assert (=> d!50415 (= (array_inv!1531 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvsge (size!2670 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153568 d!50415))

(declare-fun d!50417 () Bool)

(assert (=> d!50417 (= (array_inv!1532 (_values!3042 (v!3405 (underlying!518 thiss!992)))) (bvsge (size!2671 (_values!3042 (v!3405 (underlying!518 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153568 d!50417))

(declare-fun d!50419 () Bool)

(assert (=> d!50419 (= (map!1481 (_2!1406 lt!80489)) (getCurrentListMap!559 (_keys!4831 (_2!1406 lt!80489)) (_values!3042 (_2!1406 lt!80489)) (mask!7460 (_2!1406 lt!80489)) (extraKeys!2800 (_2!1406 lt!80489)) (zeroValue!2902 (_2!1406 lt!80489)) (minValue!2902 (_2!1406 lt!80489)) #b00000000000000000000000000000000 (defaultEntry!3059 (_2!1406 lt!80489))))))

(declare-fun bs!6484 () Bool)

(assert (= bs!6484 d!50419))

(declare-fun m!187059 () Bool)

(assert (=> bs!6484 m!187059))

(assert (=> b!153563 d!50419))

(declare-fun d!50421 () Bool)

(assert (=> d!50421 (= (map!1481 (v!3405 (underlying!518 thiss!992))) (getCurrentListMap!559 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun bs!6485 () Bool)

(assert (= bs!6485 d!50421))

(declare-fun m!187061 () Bool)

(assert (=> bs!6485 m!187061))

(assert (=> b!153563 d!50421))

(declare-fun d!50423 () Bool)

(declare-fun res!72617 () Bool)

(declare-fun e!100437 () Bool)

(assert (=> d!50423 (=> (not res!72617) (not e!100437))))

(declare-fun simpleValid!103 (LongMapFixedSize!1240) Bool)

(assert (=> d!50423 (= res!72617 (simpleValid!103 newMap!16))))

(assert (=> d!50423 (= (valid!618 newMap!16) e!100437)))

(declare-fun b!153754 () Bool)

(declare-fun res!72618 () Bool)

(assert (=> b!153754 (=> (not res!72618) (not e!100437))))

(declare-fun arrayCountValidKeys!0 (array!5067 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!153754 (= res!72618 (= (arrayCountValidKeys!0 (_keys!4831 newMap!16) #b00000000000000000000000000000000 (size!2670 (_keys!4831 newMap!16))) (_size!669 newMap!16)))))

(declare-fun b!153755 () Bool)

(declare-fun res!72619 () Bool)

(assert (=> b!153755 (=> (not res!72619) (not e!100437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5067 (_ BitVec 32)) Bool)

(assert (=> b!153755 (= res!72619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4831 newMap!16) (mask!7460 newMap!16)))))

(declare-fun b!153756 () Bool)

(declare-datatypes ((List!1806 0))(
  ( (Nil!1803) (Cons!1802 (h!2411 (_ BitVec 64)) (t!6591 List!1806)) )
))
(declare-fun arrayNoDuplicates!0 (array!5067 (_ BitVec 32) List!1806) Bool)

(assert (=> b!153756 (= e!100437 (arrayNoDuplicates!0 (_keys!4831 newMap!16) #b00000000000000000000000000000000 Nil!1803))))

(assert (= (and d!50423 res!72617) b!153754))

(assert (= (and b!153754 res!72618) b!153755))

(assert (= (and b!153755 res!72619) b!153756))

(declare-fun m!187063 () Bool)

(assert (=> d!50423 m!187063))

(declare-fun m!187065 () Bool)

(assert (=> b!153754 m!187065))

(declare-fun m!187067 () Bool)

(assert (=> b!153755 m!187067))

(declare-fun m!187069 () Bool)

(assert (=> b!153756 m!187069))

(assert (=> b!153572 d!50423))

(declare-fun d!50425 () Bool)

(declare-fun res!72620 () Bool)

(declare-fun e!100438 () Bool)

(assert (=> d!50425 (=> (not res!72620) (not e!100438))))

(assert (=> d!50425 (= res!72620 (simpleValid!103 (_2!1406 lt!80489)))))

(assert (=> d!50425 (= (valid!618 (_2!1406 lt!80489)) e!100438)))

(declare-fun b!153757 () Bool)

(declare-fun res!72621 () Bool)

(assert (=> b!153757 (=> (not res!72621) (not e!100438))))

(assert (=> b!153757 (= res!72621 (= (arrayCountValidKeys!0 (_keys!4831 (_2!1406 lt!80489)) #b00000000000000000000000000000000 (size!2670 (_keys!4831 (_2!1406 lt!80489)))) (_size!669 (_2!1406 lt!80489))))))

(declare-fun b!153758 () Bool)

(declare-fun res!72622 () Bool)

(assert (=> b!153758 (=> (not res!72622) (not e!100438))))

(assert (=> b!153758 (= res!72622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4831 (_2!1406 lt!80489)) (mask!7460 (_2!1406 lt!80489))))))

(declare-fun b!153759 () Bool)

(assert (=> b!153759 (= e!100438 (arrayNoDuplicates!0 (_keys!4831 (_2!1406 lt!80489)) #b00000000000000000000000000000000 Nil!1803))))

(assert (= (and d!50425 res!72620) b!153757))

(assert (= (and b!153757 res!72621) b!153758))

(assert (= (and b!153758 res!72622) b!153759))

(declare-fun m!187071 () Bool)

(assert (=> d!50425 m!187071))

(declare-fun m!187073 () Bool)

(assert (=> b!153757 m!187073))

(declare-fun m!187075 () Bool)

(assert (=> b!153758 m!187075))

(declare-fun m!187077 () Bool)

(assert (=> b!153759 m!187077))

(assert (=> b!153571 d!50425))

(declare-fun lt!80655 () ListLongMap!1783)

(declare-fun lt!80654 () ListLongMap!1783)

(declare-fun c!29470 () Bool)

(declare-fun bm!17096 () Bool)

(declare-fun lt!80633 () V!3673)

(declare-fun lt!80635 () (_ BitVec 64))

(declare-fun lt!80629 () (_ BitVec 64))

(declare-fun lt!80634 () (_ BitVec 64))

(declare-fun call!17099 () Unit!4882)

(declare-fun addCommutativeForDiffKeys!73 (ListLongMap!1783 (_ BitVec 64) V!3673 (_ BitVec 64) V!3673) Unit!4882)

(assert (=> bm!17096 (= call!17099 (addCommutativeForDiffKeys!73 (ite c!29470 lt!80655 lt!80654) lt!80635 lt!80633 (ite c!29470 lt!80634 lt!80629) (ite c!29470 (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun call!17104 () ListLongMap!1783)

(declare-fun bm!17097 () Bool)

(declare-fun call!17100 () ListLongMap!1783)

(declare-fun call!17107 () ListLongMap!1783)

(assert (=> bm!17097 (= call!17100 (+!180 (ite c!29470 call!17104 call!17107) (ite c!29470 (tuple2!2793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 lt!80629 (minValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun call!17110 () ListLongMap!1783)

(declare-fun lt!80643 () (_ BitVec 64))

(declare-fun bm!17098 () Bool)

(declare-fun lt!80627 () ListLongMap!1783)

(assert (=> bm!17098 (= call!17110 (+!180 (ite c!29470 lt!80655 lt!80627) (ite c!29470 (tuple2!2793 lt!80634 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 lt!80643 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun call!17108 () ListLongMap!1783)

(declare-fun bm!17099 () Bool)

(assert (=> bm!17099 (= call!17108 (+!180 call!17110 (tuple2!2793 lt!80635 lt!80633)))))

(declare-fun call!17105 () ListLongMap!1783)

(declare-fun bm!17100 () Bool)

(assert (=> bm!17100 (= call!17105 (+!180 (ite c!29470 lt!80655 lt!80654) (ite c!29470 (tuple2!2793 lt!80635 lt!80633) (tuple2!2793 lt!80629 (minValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun b!153788 () Bool)

(assert (=> b!153788 false))

(declare-fun lt!80648 () Unit!4882)

(declare-fun lt!80644 () Unit!4882)

(assert (=> b!153788 (= lt!80648 lt!80644)))

(declare-fun lt!80646 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!5067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153788 (not (arrayContainsKey!0 (_keys!4831 (v!3405 (underlying!518 thiss!992))) lt!80635 lt!80646))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5067 (_ BitVec 32) (_ BitVec 64) List!1806) Unit!4882)

(assert (=> b!153788 (= lt!80644 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4831 (v!3405 (underlying!518 thiss!992))) lt!80646 lt!80635 (Cons!1802 lt!80635 Nil!1803)))))

(assert (=> b!153788 (= lt!80646 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!80652 () Unit!4882)

(declare-fun lt!80650 () Unit!4882)

(assert (=> b!153788 (= lt!80652 lt!80650)))

(assert (=> b!153788 (arrayNoDuplicates!0 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1803)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5067 (_ BitVec 32) (_ BitVec 32)) Unit!4882)

(assert (=> b!153788 (= lt!80650 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4831 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!80656 () Unit!4882)

(declare-fun lt!80642 () Unit!4882)

(assert (=> b!153788 (= lt!80656 lt!80642)))

(declare-fun e!100459 () Bool)

(assert (=> b!153788 e!100459))

(declare-fun c!29467 () Bool)

(assert (=> b!153788 (= c!29467 (and (not (= lt!80635 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80635 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80649 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!171 (array!5067 array!5069 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 64) (_ BitVec 32) Int) Unit!4882)

(assert (=> b!153788 (= lt!80642 (lemmaListMapContainsThenArrayContainsFrom!171 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) lt!80635 lt!80649 (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(assert (=> b!153788 (= lt!80649 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!100455 () Unit!4882)

(declare-fun Unit!4885 () Unit!4882)

(assert (=> b!153788 (= e!100455 Unit!4885)))

(declare-fun b!153789 () Bool)

(declare-fun e!100460 () tuple2!2790)

(declare-fun lt!80653 () tuple2!2790)

(assert (=> b!153789 (= e!100460 (tuple2!2791 (_1!1406 lt!80653) (_2!1406 lt!80653)))))

(assert (=> b!153789 (= lt!80655 call!17104)))

(assert (=> b!153789 (= lt!80634 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80632 () Unit!4882)

(assert (=> b!153789 (= lt!80632 call!17099)))

(declare-fun call!17111 () ListLongMap!1783)

(assert (=> b!153789 (= call!17111 call!17108)))

(declare-fun lt!80636 () Unit!4882)

(assert (=> b!153789 (= lt!80636 lt!80632)))

(declare-fun lt!80637 () ListLongMap!1783)

(assert (=> b!153789 (= lt!80637 call!17100)))

(declare-fun lt!80647 () (_ BitVec 64))

(assert (=> b!153789 (= lt!80647 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80630 () Unit!4882)

(declare-fun call!17109 () Unit!4882)

(assert (=> b!153789 (= lt!80630 call!17109)))

(declare-fun call!17102 () ListLongMap!1783)

(declare-fun call!17103 () ListLongMap!1783)

(assert (=> b!153789 (= call!17102 call!17103)))

(declare-fun lt!80651 () Unit!4882)

(assert (=> b!153789 (= lt!80651 lt!80630)))

(declare-fun call!17101 () tuple2!2790)

(assert (=> b!153789 (= lt!80653 call!17101)))

(declare-fun bm!17101 () Bool)

(declare-fun call!17106 () ListLongMap!1783)

(assert (=> bm!17101 (= call!17103 (+!180 (ite c!29470 call!17106 call!17105) (tuple2!2793 lt!80635 lt!80633)))))

(declare-fun bm!17102 () Bool)

(assert (=> bm!17102 (= call!17104 (getCurrentListMapNoExtraKeys!148 (_keys!4831 (v!3405 (underlying!518 thiss!992))) (_values!3042 (v!3405 (underlying!518 thiss!992))) (mask!7460 (v!3405 (underlying!518 thiss!992))) (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))) (minValue!2902 (v!3405 (underlying!518 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun b!153791 () Bool)

(declare-fun e!100456 () tuple2!2790)

(declare-fun e!100462 () tuple2!2790)

(assert (=> b!153791 (= e!100456 e!100462)))

(declare-fun lt!80640 () tuple2!2790)

(declare-fun update!235 (LongMapFixedSize!1240 (_ BitVec 64) V!3673) tuple2!2790)

(assert (=> b!153791 (= lt!80640 (update!235 newMap!16 lt!80635 lt!80633))))

(declare-fun c!29465 () Bool)

(declare-fun lt!80645 () ListLongMap!1783)

(assert (=> b!153791 (= c!29465 (contains!952 lt!80645 lt!80635))))

(declare-fun lt!80628 () Unit!4882)

(assert (=> b!153791 (= lt!80628 e!100455)))

(declare-fun c!29469 () Bool)

(assert (=> b!153791 (= c!29469 (_1!1406 lt!80640))))

(declare-fun b!153792 () Bool)

(declare-fun e!100458 () tuple2!2790)

(assert (=> b!153792 (= e!100458 (tuple2!2791 true newMap!16))))

(declare-fun b!153793 () Bool)

(declare-fun e!100461 () Bool)

(declare-fun lt!80641 () tuple2!2790)

(assert (=> b!153793 (= e!100461 (= (map!1481 (_2!1406 lt!80641)) (map!1481 (v!3405 (underlying!518 thiss!992)))))))

(declare-fun bm!17103 () Bool)

(assert (=> bm!17103 (= call!17111 (+!180 (ite c!29470 call!17105 call!17104) (ite c!29470 (tuple2!2793 lt!80634 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(declare-fun b!153794 () Bool)

(assert (=> b!153794 (= e!100460 (tuple2!2791 true (_2!1406 lt!80640)))))

(assert (=> b!153794 (= lt!80627 call!17104)))

(assert (=> b!153794 (= lt!80643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80639 () Unit!4882)

(assert (=> b!153794 (= lt!80639 call!17109)))

(assert (=> b!153794 (= call!17102 call!17108)))

(declare-fun lt!80626 () Unit!4882)

(assert (=> b!153794 (= lt!80626 lt!80639)))

(assert (=> b!153794 (= lt!80654 call!17111)))

(assert (=> b!153794 (= lt!80629 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80657 () Unit!4882)

(assert (=> b!153794 (= lt!80657 call!17099)))

(assert (=> b!153794 (= call!17100 call!17103)))

(declare-fun lt!80631 () Unit!4882)

(assert (=> b!153794 (= lt!80631 lt!80657)))

(declare-fun bm!17104 () Bool)

(assert (=> bm!17104 (= call!17109 (addCommutativeForDiffKeys!73 (ite c!29470 lt!80637 lt!80627) lt!80635 lt!80633 (ite c!29470 lt!80647 lt!80643) (ite c!29470 (minValue!2902 (v!3405 (underlying!518 thiss!992))) (zeroValue!2902 (v!3405 (underlying!518 thiss!992))))))))

(declare-fun b!153795 () Bool)

(assert (=> b!153795 (= c!29470 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!153795 (= e!100462 e!100460)))

(declare-fun c!29468 () Bool)

(declare-fun bm!17105 () Bool)

(assert (=> bm!17105 (= call!17101 (repackFrom!21 thiss!992 (ite c!29468 (_2!1406 lt!80640) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!17106 () Bool)

(assert (=> bm!17106 (= call!17106 (+!180 (ite c!29470 lt!80637 lt!80627) (ite c!29470 (tuple2!2793 lt!80647 (minValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 lt!80635 lt!80633))))))

(declare-fun bm!17107 () Bool)

(assert (=> bm!17107 (= call!17107 (+!180 (ite c!29470 lt!80637 lt!80654) (tuple2!2793 lt!80635 lt!80633)))))

(declare-fun b!153796 () Bool)

(declare-fun Unit!4886 () Unit!4882)

(assert (=> b!153796 (= e!100455 Unit!4886)))

(declare-fun d!50427 () Bool)

(declare-fun e!100457 () Bool)

(assert (=> d!50427 e!100457))

(declare-fun res!72627 () Bool)

(assert (=> d!50427 (=> res!72627 e!100457)))

(assert (=> d!50427 (= res!72627 (not (_1!1406 lt!80641)))))

(assert (=> d!50427 (= lt!80641 e!100456)))

(assert (=> d!50427 (= c!29468 (and (not (= lt!80635 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80635 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!50427 (= lt!80645 (map!1481 newMap!16))))

(assert (=> d!50427 (= lt!80633 (get!1599 (select (arr!2393 (_values!3042 (v!3405 (underlying!518 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!461 (defaultEntry!3059 (v!3405 (underlying!518 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50427 (= lt!80635 (select (arr!2392 (_keys!4831 (v!3405 (underlying!518 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!50427 (valid!617 thiss!992)))

(assert (=> d!50427 (= (repackFrom!21 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!80641)))

(declare-fun b!153790 () Bool)

(assert (=> b!153790 (= e!100462 (tuple2!2791 false (_2!1406 lt!80640)))))

(declare-fun b!153797 () Bool)

(assert (=> b!153797 (= e!100457 e!100461)))

(declare-fun res!72628 () Bool)

(assert (=> b!153797 (=> (not res!72628) (not e!100461))))

(assert (=> b!153797 (= res!72628 (valid!618 (_2!1406 lt!80641)))))

(declare-fun b!153798 () Bool)

(assert (=> b!153798 (= e!100459 (arrayContainsKey!0 (_keys!4831 (v!3405 (underlying!518 thiss!992))) lt!80635 lt!80649))))

(declare-fun b!153799 () Bool)

(declare-fun lt!80638 () tuple2!2790)

(assert (=> b!153799 (= lt!80638 call!17101)))

(assert (=> b!153799 (= e!100458 (tuple2!2791 (_1!1406 lt!80638) (_2!1406 lt!80638)))))

(declare-fun b!153800 () Bool)

(assert (=> b!153800 (= e!100456 e!100458)))

(declare-fun c!29466 () Bool)

(assert (=> b!153800 (= c!29466 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!153801 () Bool)

(assert (=> b!153801 (= e!100459 (ite (= lt!80635 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2800 (v!3405 (underlying!518 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!17108 () Bool)

(assert (=> bm!17108 (= call!17102 (+!180 (ite c!29470 call!17107 call!17106) (ite c!29470 (tuple2!2793 lt!80647 (minValue!2902 (v!3405 (underlying!518 thiss!992)))) (tuple2!2793 lt!80643 (zeroValue!2902 (v!3405 (underlying!518 thiss!992)))))))))

(assert (= (and d!50427 c!29468) b!153791))

(assert (= (and d!50427 (not c!29468)) b!153800))

(assert (= (and b!153791 c!29465) b!153788))

(assert (= (and b!153791 (not c!29465)) b!153796))

(assert (= (and b!153788 c!29467) b!153798))

(assert (= (and b!153788 (not c!29467)) b!153801))

(assert (= (and b!153791 c!29469) b!153795))

(assert (= (and b!153791 (not c!29469)) b!153790))

(assert (= (and b!153795 c!29470) b!153789))

(assert (= (and b!153795 (not c!29470)) b!153794))

(assert (= (or b!153789 b!153794) bm!17102))

(assert (= (or b!153789 b!153794) bm!17098))

(assert (= (or b!153789 b!153794) bm!17100))

(assert (= (or b!153789 b!153794) bm!17107))

(assert (= (or b!153789 b!153794) bm!17106))

(assert (= (or b!153789 b!153794) bm!17096))

(assert (= (or b!153789 b!153794) bm!17104))

(assert (= (or b!153789 b!153794) bm!17097))

(assert (= (or b!153789 b!153794) bm!17108))

(assert (= (or b!153789 b!153794) bm!17103))

(assert (= (or b!153789 b!153794) bm!17099))

(assert (= (or b!153789 b!153794) bm!17101))

(assert (= (and b!153800 c!29466) b!153799))

(assert (= (and b!153800 (not c!29466)) b!153792))

(assert (= (or b!153789 b!153799) bm!17105))

(assert (= (and d!50427 (not res!72627)) b!153797))

(assert (= (and b!153797 res!72628) b!153793))

(declare-fun b_lambda!6819 () Bool)

(assert (=> (not b_lambda!6819) (not d!50427)))

(assert (=> d!50427 t!6588))

(declare-fun b_and!9557 () Bool)

(assert (= b_and!9553 (and (=> t!6588 result!4473) b_and!9557)))

(assert (=> d!50427 t!6590))

(declare-fun b_and!9559 () Bool)

(assert (= b_and!9555 (and (=> t!6590 result!4477) b_and!9559)))

(declare-fun m!187079 () Bool)

(assert (=> bm!17099 m!187079))

(declare-fun m!187081 () Bool)

(assert (=> bm!17097 m!187081))

(declare-fun m!187083 () Bool)

(assert (=> bm!17098 m!187083))

(declare-fun m!187085 () Bool)

(assert (=> bm!17101 m!187085))

(declare-fun m!187087 () Bool)

(assert (=> b!153793 m!187087))

(assert (=> b!153793 m!186929))

(declare-fun m!187089 () Bool)

(assert (=> b!153788 m!187089))

(declare-fun m!187091 () Bool)

(assert (=> b!153788 m!187091))

(declare-fun m!187093 () Bool)

(assert (=> b!153788 m!187093))

(declare-fun m!187095 () Bool)

(assert (=> b!153788 m!187095))

(declare-fun m!187097 () Bool)

(assert (=> b!153788 m!187097))

(declare-fun m!187099 () Bool)

(assert (=> bm!17108 m!187099))

(declare-fun m!187101 () Bool)

(assert (=> bm!17105 m!187101))

(declare-fun m!187103 () Bool)

(assert (=> b!153791 m!187103))

(declare-fun m!187105 () Bool)

(assert (=> b!153791 m!187105))

(declare-fun m!187107 () Bool)

(assert (=> b!153798 m!187107))

(declare-fun m!187109 () Bool)

(assert (=> bm!17103 m!187109))

(declare-fun m!187111 () Bool)

(assert (=> bm!17096 m!187111))

(declare-fun m!187113 () Bool)

(assert (=> d!50427 m!187113))

(assert (=> d!50427 m!187035))

(declare-fun m!187115 () Bool)

(assert (=> d!50427 m!187115))

(assert (=> d!50427 m!186909))

(assert (=> d!50427 m!187113))

(declare-fun m!187117 () Bool)

(assert (=> d!50427 m!187117))

(assert (=> d!50427 m!186933))

(assert (=> d!50427 m!187035))

(declare-fun m!187119 () Bool)

(assert (=> bm!17100 m!187119))

(declare-fun m!187121 () Bool)

(assert (=> bm!17102 m!187121))

(declare-fun m!187123 () Bool)

(assert (=> bm!17107 m!187123))

(declare-fun m!187125 () Bool)

(assert (=> b!153797 m!187125))

(declare-fun m!187127 () Bool)

(assert (=> bm!17104 m!187127))

(declare-fun m!187129 () Bool)

(assert (=> bm!17106 m!187129))

(assert (=> b!153562 d!50427))

(declare-fun mapIsEmpty!5159 () Bool)

(declare-fun mapRes!5159 () Bool)

(assert (=> mapIsEmpty!5159 mapRes!5159))

(declare-fun b!153808 () Bool)

(declare-fun e!100468 () Bool)

(assert (=> b!153808 (= e!100468 tp_is_empty!3019)))

(declare-fun condMapEmpty!5159 () Bool)

(declare-fun mapDefault!5159 () ValueCell!1166)

(assert (=> mapNonEmpty!5143 (= condMapEmpty!5159 (= mapRest!5143 ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5159)))))

(declare-fun e!100467 () Bool)

(assert (=> mapNonEmpty!5143 (= tp!12131 (and e!100467 mapRes!5159))))

(declare-fun b!153809 () Bool)

(assert (=> b!153809 (= e!100467 tp_is_empty!3019)))

(declare-fun mapNonEmpty!5159 () Bool)

(declare-fun tp!12161 () Bool)

(assert (=> mapNonEmpty!5159 (= mapRes!5159 (and tp!12161 e!100468))))

(declare-fun mapKey!5159 () (_ BitVec 32))

(declare-fun mapRest!5159 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapValue!5159 () ValueCell!1166)

(assert (=> mapNonEmpty!5159 (= mapRest!5143 (store mapRest!5159 mapKey!5159 mapValue!5159))))

(assert (= (and mapNonEmpty!5143 condMapEmpty!5159) mapIsEmpty!5159))

(assert (= (and mapNonEmpty!5143 (not condMapEmpty!5159)) mapNonEmpty!5159))

(assert (= (and mapNonEmpty!5159 ((_ is ValueCellFull!1166) mapValue!5159)) b!153808))

(assert (= (and mapNonEmpty!5143 ((_ is ValueCellFull!1166) mapDefault!5159)) b!153809))

(declare-fun m!187131 () Bool)

(assert (=> mapNonEmpty!5159 m!187131))

(declare-fun mapIsEmpty!5160 () Bool)

(declare-fun mapRes!5160 () Bool)

(assert (=> mapIsEmpty!5160 mapRes!5160))

(declare-fun b!153810 () Bool)

(declare-fun e!100470 () Bool)

(assert (=> b!153810 (= e!100470 tp_is_empty!3019)))

(declare-fun condMapEmpty!5160 () Bool)

(declare-fun mapDefault!5160 () ValueCell!1166)

(assert (=> mapNonEmpty!5144 (= condMapEmpty!5160 (= mapRest!5144 ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5160)))))

(declare-fun e!100469 () Bool)

(assert (=> mapNonEmpty!5144 (= tp!12134 (and e!100469 mapRes!5160))))

(declare-fun b!153811 () Bool)

(assert (=> b!153811 (= e!100469 tp_is_empty!3019)))

(declare-fun mapNonEmpty!5160 () Bool)

(declare-fun tp!12162 () Bool)

(assert (=> mapNonEmpty!5160 (= mapRes!5160 (and tp!12162 e!100470))))

(declare-fun mapValue!5160 () ValueCell!1166)

(declare-fun mapRest!5160 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapKey!5160 () (_ BitVec 32))

(assert (=> mapNonEmpty!5160 (= mapRest!5144 (store mapRest!5160 mapKey!5160 mapValue!5160))))

(assert (= (and mapNonEmpty!5144 condMapEmpty!5160) mapIsEmpty!5160))

(assert (= (and mapNonEmpty!5144 (not condMapEmpty!5160)) mapNonEmpty!5160))

(assert (= (and mapNonEmpty!5160 ((_ is ValueCellFull!1166) mapValue!5160)) b!153810))

(assert (= (and mapNonEmpty!5144 ((_ is ValueCellFull!1166) mapDefault!5160)) b!153811))

(declare-fun m!187133 () Bool)

(assert (=> mapNonEmpty!5160 m!187133))

(declare-fun b_lambda!6821 () Bool)

(assert (= b_lambda!6817 (or (and b!153568 b_free!3205) (and b!153564 b_free!3207 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992))))) b_lambda!6821)))

(declare-fun b_lambda!6823 () Bool)

(assert (= b_lambda!6819 (or (and b!153568 b_free!3205) (and b!153564 b_free!3207 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3405 (underlying!518 thiss!992))))) b_lambda!6823)))

(check-sat (not bm!17108) (not b!153797) (not d!50423) (not b!153732) (not bm!17065) (not bm!17098) (not bm!17097) (not b_next!3205) (not b!153738) (not d!50419) (not b!153759) (not b!153788) (not mapNonEmpty!5160) (not bm!17107) (not b!153758) b_and!9557 (not b!153756) (not b_lambda!6821) (not b!153725) (not bm!17067) (not bm!17101) (not b_lambda!6823) (not d!50413) (not b!153742) (not bm!17068) (not b!153733) (not d!50407) (not bm!17106) (not b!153754) (not b!153744) (not b!153793) (not bm!17105) (not b!153798) (not b!153755) (not bm!17104) (not d!50405) (not bm!17096) (not d!50421) (not d!50425) (not b!153757) (not d!50427) b_and!9559 (not bm!17100) (not bm!17103) (not mapNonEmpty!5159) (not b!153737) (not bm!17102) (not bm!17099) (not b!153728) (not b_next!3207) (not b!153791) tp_is_empty!3019 (not bm!17069))
(check-sat b_and!9557 b_and!9559 (not b_next!3205) (not b_next!3207))
