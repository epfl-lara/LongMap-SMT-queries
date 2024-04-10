; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80310 () Bool)

(assert start!80310)

(declare-fun b!943521 () Bool)

(declare-fun b_free!18009 () Bool)

(declare-fun b_next!18009 () Bool)

(assert (=> b!943521 (= b_free!18009 (not b_next!18009))))

(declare-fun tp!62532 () Bool)

(declare-fun b_and!29421 () Bool)

(assert (=> b!943521 (= tp!62532 b_and!29421)))

(declare-fun b!943516 () Bool)

(declare-fun e!530491 () Bool)

(declare-datatypes ((V!32321 0))(
  ( (V!32322 (val!10309 Int)) )
))
(declare-datatypes ((ValueCell!9777 0))(
  ( (ValueCellFull!9777 (v!12840 V!32321)) (EmptyCell!9777) )
))
(declare-datatypes ((array!57000 0))(
  ( (array!57001 (arr!27426 (Array (_ BitVec 32) ValueCell!9777)) (size!27891 (_ BitVec 32))) )
))
(declare-datatypes ((array!57002 0))(
  ( (array!57003 (arr!27427 (Array (_ BitVec 32) (_ BitVec 64))) (size!27892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4704 0))(
  ( (LongMapFixedSize!4705 (defaultEntry!5643 Int) (mask!27273 (_ BitVec 32)) (extraKeys!5375 (_ BitVec 32)) (zeroValue!5479 V!32321) (minValue!5479 V!32321) (_size!2407 (_ BitVec 32)) (_keys!10517 array!57002) (_values!5666 array!57000) (_vacant!2407 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4704)

(assert (=> b!943516 (= e!530491 (not (and (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))) (bvslt (size!27892 (_keys!10517 thiss!1141)) #b01111111111111111111111111111111))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943516 (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31816 0))(
  ( (Unit!31817) )
))
(declare-fun lt!425263 () Unit!31816)

(declare-fun lemmaKeyInListMapIsInArray!291 (array!57002 array!57000 (_ BitVec 32) (_ BitVec 32) V!32321 V!32321 (_ BitVec 64) Int) Unit!31816)

(assert (=> b!943516 (= lt!425263 (lemmaKeyInListMapIsInArray!291 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) key!756 (defaultEntry!5643 thiss!1141)))))

(declare-fun b!943517 () Bool)

(declare-fun e!530495 () Bool)

(declare-fun e!530493 () Bool)

(declare-fun mapRes!32597 () Bool)

(assert (=> b!943517 (= e!530495 (and e!530493 mapRes!32597))))

(declare-fun condMapEmpty!32597 () Bool)

(declare-fun mapDefault!32597 () ValueCell!9777)

(assert (=> b!943517 (= condMapEmpty!32597 (= (arr!27426 (_values!5666 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9777)) mapDefault!32597)))))

(declare-fun res!633969 () Bool)

(assert (=> start!80310 (=> (not res!633969) (not e!530491))))

(declare-fun valid!1799 (LongMapFixedSize!4704) Bool)

(assert (=> start!80310 (= res!633969 (valid!1799 thiss!1141))))

(assert (=> start!80310 e!530491))

(declare-fun e!530492 () Bool)

(assert (=> start!80310 e!530492))

(assert (=> start!80310 true))

(declare-fun b!943518 () Bool)

(declare-fun res!633971 () Bool)

(assert (=> b!943518 (=> (not res!633971) (not e!530491))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9054 0))(
  ( (MissingZero!9054 (index!38587 (_ BitVec 32))) (Found!9054 (index!38588 (_ BitVec 32))) (Intermediate!9054 (undefined!9866 Bool) (index!38589 (_ BitVec 32)) (x!81031 (_ BitVec 32))) (Undefined!9054) (MissingVacant!9054 (index!38590 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57002 (_ BitVec 32)) SeekEntryResult!9054)

(assert (=> b!943518 (= res!633971 (not ((_ is Found!9054) (seekEntry!0 key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))))

(declare-fun mapIsEmpty!32597 () Bool)

(assert (=> mapIsEmpty!32597 mapRes!32597))

(declare-fun b!943519 () Bool)

(declare-fun res!633970 () Bool)

(assert (=> b!943519 (=> (not res!633970) (not e!530491))))

(declare-datatypes ((tuple2!13446 0))(
  ( (tuple2!13447 (_1!6734 (_ BitVec 64)) (_2!6734 V!32321)) )
))
(declare-datatypes ((List!19256 0))(
  ( (Nil!19253) (Cons!19252 (h!20402 tuple2!13446) (t!27571 List!19256)) )
))
(declare-datatypes ((ListLongMap!12143 0))(
  ( (ListLongMap!12144 (toList!6087 List!19256)) )
))
(declare-fun contains!5157 (ListLongMap!12143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3321 (array!57002 array!57000 (_ BitVec 32) (_ BitVec 32) V!32321 V!32321 (_ BitVec 32) Int) ListLongMap!12143)

(assert (=> b!943519 (= res!633970 (contains!5157 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)) key!756))))

(declare-fun b!943520 () Bool)

(declare-fun tp_is_empty!20517 () Bool)

(assert (=> b!943520 (= e!530493 tp_is_empty!20517)))

(declare-fun array_inv!21312 (array!57002) Bool)

(declare-fun array_inv!21313 (array!57000) Bool)

(assert (=> b!943521 (= e!530492 (and tp!62532 tp_is_empty!20517 (array_inv!21312 (_keys!10517 thiss!1141)) (array_inv!21313 (_values!5666 thiss!1141)) e!530495))))

(declare-fun mapNonEmpty!32597 () Bool)

(declare-fun tp!62533 () Bool)

(declare-fun e!530494 () Bool)

(assert (=> mapNonEmpty!32597 (= mapRes!32597 (and tp!62533 e!530494))))

(declare-fun mapKey!32597 () (_ BitVec 32))

(declare-fun mapValue!32597 () ValueCell!9777)

(declare-fun mapRest!32597 () (Array (_ BitVec 32) ValueCell!9777))

(assert (=> mapNonEmpty!32597 (= (arr!27426 (_values!5666 thiss!1141)) (store mapRest!32597 mapKey!32597 mapValue!32597))))

(declare-fun b!943522 () Bool)

(declare-fun res!633968 () Bool)

(assert (=> b!943522 (=> (not res!633968) (not e!530491))))

(assert (=> b!943522 (= res!633968 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943523 () Bool)

(assert (=> b!943523 (= e!530494 tp_is_empty!20517)))

(assert (= (and start!80310 res!633969) b!943522))

(assert (= (and b!943522 res!633968) b!943518))

(assert (= (and b!943518 res!633971) b!943519))

(assert (= (and b!943519 res!633970) b!943516))

(assert (= (and b!943517 condMapEmpty!32597) mapIsEmpty!32597))

(assert (= (and b!943517 (not condMapEmpty!32597)) mapNonEmpty!32597))

(assert (= (and mapNonEmpty!32597 ((_ is ValueCellFull!9777) mapValue!32597)) b!943523))

(assert (= (and b!943517 ((_ is ValueCellFull!9777) mapDefault!32597)) b!943520))

(assert (= b!943521 b!943517))

(assert (= start!80310 b!943521))

(declare-fun m!877657 () Bool)

(assert (=> start!80310 m!877657))

(declare-fun m!877659 () Bool)

(assert (=> b!943516 m!877659))

(declare-fun m!877661 () Bool)

(assert (=> b!943516 m!877661))

(declare-fun m!877663 () Bool)

(assert (=> b!943518 m!877663))

(declare-fun m!877665 () Bool)

(assert (=> mapNonEmpty!32597 m!877665))

(declare-fun m!877667 () Bool)

(assert (=> b!943521 m!877667))

(declare-fun m!877669 () Bool)

(assert (=> b!943521 m!877669))

(declare-fun m!877671 () Bool)

(assert (=> b!943519 m!877671))

(assert (=> b!943519 m!877671))

(declare-fun m!877673 () Bool)

(assert (=> b!943519 m!877673))

(check-sat (not b!943516) (not b_next!18009) (not b!943521) tp_is_empty!20517 (not mapNonEmpty!32597) (not b!943518) (not b!943519) (not start!80310) b_and!29421)
(check-sat b_and!29421 (not b_next!18009))
(get-model)

(declare-fun d!114223 () Bool)

(declare-fun e!530519 () Bool)

(assert (=> d!114223 e!530519))

(declare-fun res!633986 () Bool)

(assert (=> d!114223 (=> res!633986 e!530519)))

(declare-fun lt!425276 () Bool)

(assert (=> d!114223 (= res!633986 (not lt!425276))))

(declare-fun lt!425277 () Bool)

(assert (=> d!114223 (= lt!425276 lt!425277)))

(declare-fun lt!425278 () Unit!31816)

(declare-fun e!530520 () Unit!31816)

(assert (=> d!114223 (= lt!425278 e!530520)))

(declare-fun c!98245 () Bool)

(assert (=> d!114223 (= c!98245 lt!425277)))

(declare-fun containsKey!452 (List!19256 (_ BitVec 64)) Bool)

(assert (=> d!114223 (= lt!425277 (containsKey!452 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(assert (=> d!114223 (= (contains!5157 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)) key!756) lt!425276)))

(declare-fun b!943554 () Bool)

(declare-fun lt!425275 () Unit!31816)

(assert (=> b!943554 (= e!530520 lt!425275)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!348 (List!19256 (_ BitVec 64)) Unit!31816)

(assert (=> b!943554 (= lt!425275 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(declare-datatypes ((Option!491 0))(
  ( (Some!490 (v!12842 V!32321)) (None!489) )
))
(declare-fun isDefined!357 (Option!491) Bool)

(declare-fun getValueByKey!485 (List!19256 (_ BitVec 64)) Option!491)

(assert (=> b!943554 (isDefined!357 (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(declare-fun b!943555 () Bool)

(declare-fun Unit!31820 () Unit!31816)

(assert (=> b!943555 (= e!530520 Unit!31820)))

(declare-fun b!943556 () Bool)

(assert (=> b!943556 (= e!530519 (isDefined!357 (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756)))))

(assert (= (and d!114223 c!98245) b!943554))

(assert (= (and d!114223 (not c!98245)) b!943555))

(assert (= (and d!114223 (not res!633986)) b!943556))

(declare-fun m!877693 () Bool)

(assert (=> d!114223 m!877693))

(declare-fun m!877695 () Bool)

(assert (=> b!943554 m!877695))

(declare-fun m!877697 () Bool)

(assert (=> b!943554 m!877697))

(assert (=> b!943554 m!877697))

(declare-fun m!877699 () Bool)

(assert (=> b!943554 m!877699))

(assert (=> b!943556 m!877697))

(assert (=> b!943556 m!877697))

(assert (=> b!943556 m!877699))

(assert (=> b!943519 d!114223))

(declare-fun b!943599 () Bool)

(declare-fun e!530555 () Bool)

(declare-fun lt!425329 () ListLongMap!12143)

(declare-fun apply!866 (ListLongMap!12143 (_ BitVec 64)) V!32321)

(assert (=> b!943599 (= e!530555 (= (apply!866 lt!425329 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5479 thiss!1141)))))

(declare-fun b!943600 () Bool)

(declare-fun e!530547 () Bool)

(declare-fun e!530548 () Bool)

(assert (=> b!943600 (= e!530547 e!530548)))

(declare-fun res!634007 () Bool)

(assert (=> b!943600 (=> (not res!634007) (not e!530548))))

(assert (=> b!943600 (= res!634007 (contains!5157 lt!425329 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943601 () Bool)

(declare-fun e!530552 () ListLongMap!12143)

(declare-fun e!530556 () ListLongMap!12143)

(assert (=> b!943601 (= e!530552 e!530556)))

(declare-fun c!98263 () Bool)

(assert (=> b!943601 (= c!98263 (and (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!943602 () Bool)

(declare-fun e!530559 () Bool)

(declare-fun call!40983 () Bool)

(assert (=> b!943602 (= e!530559 (not call!40983))))

(declare-fun b!943603 () Bool)

(declare-fun call!40982 () ListLongMap!12143)

(assert (=> b!943603 (= e!530556 call!40982)))

(declare-fun b!943605 () Bool)

(declare-fun e!530557 () Bool)

(declare-fun e!530558 () Bool)

(assert (=> b!943605 (= e!530557 e!530558)))

(declare-fun res!634008 () Bool)

(declare-fun call!40980 () Bool)

(assert (=> b!943605 (= res!634008 call!40980)))

(assert (=> b!943605 (=> (not res!634008) (not e!530558))))

(declare-fun b!943606 () Bool)

(declare-fun e!530551 () Unit!31816)

(declare-fun Unit!31821 () Unit!31816)

(assert (=> b!943606 (= e!530551 Unit!31821)))

(declare-fun b!943607 () Bool)

(declare-fun e!530554 () Bool)

(assert (=> b!943607 (= e!530554 e!530559)))

(declare-fun c!98258 () Bool)

(assert (=> b!943607 (= c!98258 (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!943608 () Bool)

(declare-fun res!634005 () Bool)

(assert (=> b!943608 (=> (not res!634005) (not e!530554))))

(assert (=> b!943608 (= res!634005 e!530557)))

(declare-fun c!98262 () Bool)

(assert (=> b!943608 (= c!98262 (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!943609 () Bool)

(declare-fun e!530550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!943609 (= e!530550 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40977 () Bool)

(declare-fun call!40986 () ListLongMap!12143)

(assert (=> bm!40977 (= call!40982 call!40986)))

(declare-fun bm!40978 () Bool)

(declare-fun c!98261 () Bool)

(declare-fun call!40984 () ListLongMap!12143)

(declare-fun call!40981 () ListLongMap!12143)

(declare-fun call!40985 () ListLongMap!12143)

(declare-fun +!2850 (ListLongMap!12143 tuple2!13446) ListLongMap!12143)

(assert (=> bm!40978 (= call!40986 (+!2850 (ite c!98261 call!40984 (ite c!98263 call!40985 call!40981)) (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(declare-fun b!943610 () Bool)

(assert (=> b!943610 (= e!530558 (= (apply!866 lt!425329 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5479 thiss!1141)))))

(declare-fun b!943611 () Bool)

(declare-fun c!98260 () Bool)

(assert (=> b!943611 (= c!98260 (and (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!530549 () ListLongMap!12143)

(assert (=> b!943611 (= e!530556 e!530549)))

(declare-fun b!943612 () Bool)

(declare-fun e!530553 () Bool)

(assert (=> b!943612 (= e!530553 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40979 () Bool)

(assert (=> bm!40979 (= call!40985 call!40984)))

(declare-fun b!943613 () Bool)

(assert (=> b!943613 (= e!530552 (+!2850 call!40986 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))

(declare-fun b!943614 () Bool)

(declare-fun res!634012 () Bool)

(assert (=> b!943614 (=> (not res!634012) (not e!530554))))

(assert (=> b!943614 (= res!634012 e!530547)))

(declare-fun res!634013 () Bool)

(assert (=> b!943614 (=> res!634013 e!530547)))

(assert (=> b!943614 (= res!634013 (not e!530550))))

(declare-fun res!634009 () Bool)

(assert (=> b!943614 (=> (not res!634009) (not e!530550))))

(assert (=> b!943614 (= res!634009 (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943615 () Bool)

(assert (=> b!943615 (= e!530557 (not call!40980))))

(declare-fun bm!40980 () Bool)

(assert (=> bm!40980 (= call!40983 (contains!5157 lt!425329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40981 () Bool)

(assert (=> bm!40981 (= call!40980 (contains!5157 lt!425329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943616 () Bool)

(assert (=> b!943616 (= e!530549 call!40981)))

(declare-fun d!114225 () Bool)

(assert (=> d!114225 e!530554))

(declare-fun res!634010 () Bool)

(assert (=> d!114225 (=> (not res!634010) (not e!530554))))

(assert (=> d!114225 (= res!634010 (or (bvsge #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))))

(declare-fun lt!425333 () ListLongMap!12143)

(assert (=> d!114225 (= lt!425329 lt!425333)))

(declare-fun lt!425334 () Unit!31816)

(assert (=> d!114225 (= lt!425334 e!530551)))

(declare-fun c!98259 () Bool)

(assert (=> d!114225 (= c!98259 e!530553)))

(declare-fun res!634011 () Bool)

(assert (=> d!114225 (=> (not res!634011) (not e!530553))))

(assert (=> d!114225 (= res!634011 (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114225 (= lt!425333 e!530552)))

(assert (=> d!114225 (= c!98261 (and (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114225 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114225 (= (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)) lt!425329)))

(declare-fun b!943604 () Bool)

(assert (=> b!943604 (= e!530549 call!40982)))

(declare-fun b!943617 () Bool)

(declare-fun lt!425324 () Unit!31816)

(assert (=> b!943617 (= e!530551 lt!425324)))

(declare-fun lt!425328 () ListLongMap!12143)

(declare-fun getCurrentListMapNoExtraKeys!3305 (array!57002 array!57000 (_ BitVec 32) (_ BitVec 32) V!32321 V!32321 (_ BitVec 32) Int) ListLongMap!12143)

(assert (=> b!943617 (= lt!425328 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))

(declare-fun lt!425326 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425337 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425337 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425330 () Unit!31816)

(declare-fun addStillContains!569 (ListLongMap!12143 (_ BitVec 64) V!32321 (_ BitVec 64)) Unit!31816)

(assert (=> b!943617 (= lt!425330 (addStillContains!569 lt!425328 lt!425326 (zeroValue!5479 thiss!1141) lt!425337))))

(assert (=> b!943617 (contains!5157 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) lt!425337)))

(declare-fun lt!425325 () Unit!31816)

(assert (=> b!943617 (= lt!425325 lt!425330)))

(declare-fun lt!425343 () ListLongMap!12143)

(assert (=> b!943617 (= lt!425343 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))

(declare-fun lt!425332 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425338 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425338 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425341 () Unit!31816)

(declare-fun addApplyDifferent!449 (ListLongMap!12143 (_ BitVec 64) V!32321 (_ BitVec 64)) Unit!31816)

(assert (=> b!943617 (= lt!425341 (addApplyDifferent!449 lt!425343 lt!425332 (minValue!5479 thiss!1141) lt!425338))))

(assert (=> b!943617 (= (apply!866 (+!2850 lt!425343 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) lt!425338) (apply!866 lt!425343 lt!425338))))

(declare-fun lt!425335 () Unit!31816)

(assert (=> b!943617 (= lt!425335 lt!425341)))

(declare-fun lt!425339 () ListLongMap!12143)

(assert (=> b!943617 (= lt!425339 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))

(declare-fun lt!425344 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425323 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425323 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425327 () Unit!31816)

(assert (=> b!943617 (= lt!425327 (addApplyDifferent!449 lt!425339 lt!425344 (zeroValue!5479 thiss!1141) lt!425323))))

(assert (=> b!943617 (= (apply!866 (+!2850 lt!425339 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) lt!425323) (apply!866 lt!425339 lt!425323))))

(declare-fun lt!425340 () Unit!31816)

(assert (=> b!943617 (= lt!425340 lt!425327)))

(declare-fun lt!425331 () ListLongMap!12143)

(assert (=> b!943617 (= lt!425331 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))

(declare-fun lt!425336 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425336 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425342 () (_ BitVec 64))

(assert (=> b!943617 (= lt!425342 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943617 (= lt!425324 (addApplyDifferent!449 lt!425331 lt!425336 (minValue!5479 thiss!1141) lt!425342))))

(assert (=> b!943617 (= (apply!866 (+!2850 lt!425331 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) lt!425342) (apply!866 lt!425331 lt!425342))))

(declare-fun b!943618 () Bool)

(assert (=> b!943618 (= e!530559 e!530555)))

(declare-fun res!634006 () Bool)

(assert (=> b!943618 (= res!634006 call!40983)))

(assert (=> b!943618 (=> (not res!634006) (not e!530555))))

(declare-fun bm!40982 () Bool)

(assert (=> bm!40982 (= call!40981 call!40985)))

(declare-fun bm!40983 () Bool)

(assert (=> bm!40983 (= call!40984 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))

(declare-fun b!943619 () Bool)

(declare-fun get!14430 (ValueCell!9777 V!32321) V!32321)

(declare-fun dynLambda!1639 (Int (_ BitVec 64)) V!32321)

(assert (=> b!943619 (= e!530548 (= (apply!866 lt!425329 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)) (get!14430 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!943619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27891 (_values!5666 thiss!1141))))))

(assert (=> b!943619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (= (and d!114225 c!98261) b!943613))

(assert (= (and d!114225 (not c!98261)) b!943601))

(assert (= (and b!943601 c!98263) b!943603))

(assert (= (and b!943601 (not c!98263)) b!943611))

(assert (= (and b!943611 c!98260) b!943604))

(assert (= (and b!943611 (not c!98260)) b!943616))

(assert (= (or b!943604 b!943616) bm!40982))

(assert (= (or b!943603 bm!40982) bm!40979))

(assert (= (or b!943603 b!943604) bm!40977))

(assert (= (or b!943613 bm!40979) bm!40983))

(assert (= (or b!943613 bm!40977) bm!40978))

(assert (= (and d!114225 res!634011) b!943612))

(assert (= (and d!114225 c!98259) b!943617))

(assert (= (and d!114225 (not c!98259)) b!943606))

(assert (= (and d!114225 res!634010) b!943614))

(assert (= (and b!943614 res!634009) b!943609))

(assert (= (and b!943614 (not res!634013)) b!943600))

(assert (= (and b!943600 res!634007) b!943619))

(assert (= (and b!943614 res!634012) b!943608))

(assert (= (and b!943608 c!98262) b!943605))

(assert (= (and b!943608 (not c!98262)) b!943615))

(assert (= (and b!943605 res!634008) b!943610))

(assert (= (or b!943605 b!943615) bm!40981))

(assert (= (and b!943608 res!634005) b!943607))

(assert (= (and b!943607 c!98258) b!943618))

(assert (= (and b!943607 (not c!98258)) b!943602))

(assert (= (and b!943618 res!634006) b!943599))

(assert (= (or b!943618 b!943602) bm!40980))

(declare-fun b_lambda!14279 () Bool)

(assert (=> (not b_lambda!14279) (not b!943619)))

(declare-fun t!27574 () Bool)

(declare-fun tb!6167 () Bool)

(assert (=> (and b!943521 (= (defaultEntry!5643 thiss!1141) (defaultEntry!5643 thiss!1141)) t!27574) tb!6167))

(declare-fun result!12195 () Bool)

(assert (=> tb!6167 (= result!12195 tp_is_empty!20517)))

(assert (=> b!943619 t!27574))

(declare-fun b_and!29425 () Bool)

(assert (= b_and!29421 (and (=> t!27574 result!12195) b_and!29425)))

(declare-fun m!877701 () Bool)

(assert (=> b!943617 m!877701))

(declare-fun m!877703 () Bool)

(assert (=> b!943617 m!877703))

(declare-fun m!877705 () Bool)

(assert (=> b!943617 m!877705))

(declare-fun m!877707 () Bool)

(assert (=> b!943617 m!877707))

(declare-fun m!877709 () Bool)

(assert (=> b!943617 m!877709))

(declare-fun m!877711 () Bool)

(assert (=> b!943617 m!877711))

(declare-fun m!877713 () Bool)

(assert (=> b!943617 m!877713))

(declare-fun m!877715 () Bool)

(assert (=> b!943617 m!877715))

(declare-fun m!877717 () Bool)

(assert (=> b!943617 m!877717))

(declare-fun m!877719 () Bool)

(assert (=> b!943617 m!877719))

(assert (=> b!943617 m!877701))

(declare-fun m!877721 () Bool)

(assert (=> b!943617 m!877721))

(declare-fun m!877723 () Bool)

(assert (=> b!943617 m!877723))

(declare-fun m!877725 () Bool)

(assert (=> b!943617 m!877725))

(declare-fun m!877727 () Bool)

(assert (=> b!943617 m!877727))

(declare-fun m!877729 () Bool)

(assert (=> b!943617 m!877729))

(assert (=> b!943617 m!877703))

(assert (=> b!943617 m!877707))

(assert (=> b!943617 m!877729))

(declare-fun m!877731 () Bool)

(assert (=> b!943617 m!877731))

(declare-fun m!877733 () Bool)

(assert (=> b!943617 m!877733))

(assert (=> b!943609 m!877713))

(assert (=> b!943609 m!877713))

(declare-fun m!877735 () Bool)

(assert (=> b!943609 m!877735))

(declare-fun m!877737 () Bool)

(assert (=> b!943599 m!877737))

(declare-fun m!877739 () Bool)

(assert (=> bm!40980 m!877739))

(assert (=> bm!40983 m!877733))

(declare-fun m!877741 () Bool)

(assert (=> b!943613 m!877741))

(assert (=> b!943619 m!877713))

(declare-fun m!877743 () Bool)

(assert (=> b!943619 m!877743))

(declare-fun m!877745 () Bool)

(assert (=> b!943619 m!877745))

(declare-fun m!877747 () Bool)

(assert (=> b!943619 m!877747))

(assert (=> b!943619 m!877745))

(declare-fun m!877749 () Bool)

(assert (=> b!943619 m!877749))

(assert (=> b!943619 m!877713))

(assert (=> b!943619 m!877747))

(declare-fun m!877751 () Bool)

(assert (=> b!943610 m!877751))

(declare-fun m!877753 () Bool)

(assert (=> bm!40978 m!877753))

(declare-fun m!877755 () Bool)

(assert (=> d!114225 m!877755))

(assert (=> b!943600 m!877713))

(assert (=> b!943600 m!877713))

(declare-fun m!877757 () Bool)

(assert (=> b!943600 m!877757))

(declare-fun m!877759 () Bool)

(assert (=> bm!40981 m!877759))

(assert (=> b!943612 m!877713))

(assert (=> b!943612 m!877713))

(assert (=> b!943612 m!877735))

(assert (=> b!943519 d!114225))

(declare-fun d!114227 () Bool)

(declare-fun lt!425355 () SeekEntryResult!9054)

(assert (=> d!114227 (and (or ((_ is MissingVacant!9054) lt!425355) (not ((_ is Found!9054) lt!425355)) (and (bvsge (index!38588 lt!425355) #b00000000000000000000000000000000) (bvslt (index!38588 lt!425355) (size!27892 (_keys!10517 thiss!1141))))) (not ((_ is MissingVacant!9054) lt!425355)) (or (not ((_ is Found!9054) lt!425355)) (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38588 lt!425355)) key!756)))))

(declare-fun e!530567 () SeekEntryResult!9054)

(assert (=> d!114227 (= lt!425355 e!530567)))

(declare-fun c!98272 () Bool)

(declare-fun lt!425354 () SeekEntryResult!9054)

(assert (=> d!114227 (= c!98272 (and ((_ is Intermediate!9054) lt!425354) (undefined!9866 lt!425354)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57002 (_ BitVec 32)) SeekEntryResult!9054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114227 (= lt!425354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27273 thiss!1141)) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(assert (=> d!114227 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114227 (= (seekEntry!0 key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)) lt!425355)))

(declare-fun b!943634 () Bool)

(declare-fun e!530568 () SeekEntryResult!9054)

(assert (=> b!943634 (= e!530568 (Found!9054 (index!38589 lt!425354)))))

(declare-fun b!943635 () Bool)

(declare-fun c!98270 () Bool)

(declare-fun lt!425356 () (_ BitVec 64))

(assert (=> b!943635 (= c!98270 (= lt!425356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530566 () SeekEntryResult!9054)

(assert (=> b!943635 (= e!530568 e!530566)))

(declare-fun b!943636 () Bool)

(assert (=> b!943636 (= e!530566 (MissingZero!9054 (index!38589 lt!425354)))))

(declare-fun b!943637 () Bool)

(assert (=> b!943637 (= e!530567 e!530568)))

(assert (=> b!943637 (= lt!425356 (select (arr!27427 (_keys!10517 thiss!1141)) (index!38589 lt!425354)))))

(declare-fun c!98271 () Bool)

(assert (=> b!943637 (= c!98271 (= lt!425356 key!756))))

(declare-fun b!943638 () Bool)

(assert (=> b!943638 (= e!530567 Undefined!9054)))

(declare-fun b!943639 () Bool)

(declare-fun lt!425353 () SeekEntryResult!9054)

(assert (=> b!943639 (= e!530566 (ite ((_ is MissingVacant!9054) lt!425353) (MissingZero!9054 (index!38590 lt!425353)) lt!425353))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57002 (_ BitVec 32)) SeekEntryResult!9054)

(assert (=> b!943639 (= lt!425353 (seekKeyOrZeroReturnVacant!0 (x!81031 lt!425354) (index!38589 lt!425354) (index!38589 lt!425354) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(assert (= (and d!114227 c!98272) b!943638))

(assert (= (and d!114227 (not c!98272)) b!943637))

(assert (= (and b!943637 c!98271) b!943634))

(assert (= (and b!943637 (not c!98271)) b!943635))

(assert (= (and b!943635 c!98270) b!943636))

(assert (= (and b!943635 (not c!98270)) b!943639))

(declare-fun m!877761 () Bool)

(assert (=> d!114227 m!877761))

(declare-fun m!877763 () Bool)

(assert (=> d!114227 m!877763))

(assert (=> d!114227 m!877763))

(declare-fun m!877765 () Bool)

(assert (=> d!114227 m!877765))

(assert (=> d!114227 m!877755))

(declare-fun m!877767 () Bool)

(assert (=> b!943637 m!877767))

(declare-fun m!877769 () Bool)

(assert (=> b!943639 m!877769))

(assert (=> b!943518 d!114227))

(declare-fun d!114229 () Bool)

(declare-fun res!634018 () Bool)

(declare-fun e!530573 () Bool)

(assert (=> d!114229 (=> res!634018 e!530573)))

(assert (=> d!114229 (= res!634018 (= (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114229 (= (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 #b00000000000000000000000000000000) e!530573)))

(declare-fun b!943644 () Bool)

(declare-fun e!530574 () Bool)

(assert (=> b!943644 (= e!530573 e!530574)))

(declare-fun res!634019 () Bool)

(assert (=> b!943644 (=> (not res!634019) (not e!530574))))

(assert (=> b!943644 (= res!634019 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943645 () Bool)

(assert (=> b!943645 (= e!530574 (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114229 (not res!634018)) b!943644))

(assert (= (and b!943644 res!634019) b!943645))

(assert (=> d!114229 m!877713))

(declare-fun m!877771 () Bool)

(assert (=> b!943645 m!877771))

(assert (=> b!943516 d!114229))

(declare-fun d!114231 () Bool)

(declare-fun e!530577 () Bool)

(assert (=> d!114231 e!530577))

(declare-fun c!98275 () Bool)

(assert (=> d!114231 (= c!98275 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!425359 () Unit!31816)

(declare-fun choose!1565 (array!57002 array!57000 (_ BitVec 32) (_ BitVec 32) V!32321 V!32321 (_ BitVec 64) Int) Unit!31816)

(assert (=> d!114231 (= lt!425359 (choose!1565 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) key!756 (defaultEntry!5643 thiss!1141)))))

(assert (=> d!114231 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114231 (= (lemmaKeyInListMapIsInArray!291 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) key!756 (defaultEntry!5643 thiss!1141)) lt!425359)))

(declare-fun b!943650 () Bool)

(assert (=> b!943650 (= e!530577 (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!943651 () Bool)

(assert (=> b!943651 (= e!530577 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114231 c!98275) b!943650))

(assert (= (and d!114231 (not c!98275)) b!943651))

(declare-fun m!877773 () Bool)

(assert (=> d!114231 m!877773))

(assert (=> d!114231 m!877755))

(assert (=> b!943650 m!877659))

(assert (=> b!943516 d!114231))

(declare-fun d!114233 () Bool)

(declare-fun res!634026 () Bool)

(declare-fun e!530580 () Bool)

(assert (=> d!114233 (=> (not res!634026) (not e!530580))))

(declare-fun simpleValid!348 (LongMapFixedSize!4704) Bool)

(assert (=> d!114233 (= res!634026 (simpleValid!348 thiss!1141))))

(assert (=> d!114233 (= (valid!1799 thiss!1141) e!530580)))

(declare-fun b!943658 () Bool)

(declare-fun res!634027 () Bool)

(assert (=> b!943658 (=> (not res!634027) (not e!530580))))

(declare-fun arrayCountValidKeys!0 (array!57002 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943658 (= res!634027 (= (arrayCountValidKeys!0 (_keys!10517 thiss!1141) #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))) (_size!2407 thiss!1141)))))

(declare-fun b!943659 () Bool)

(declare-fun res!634028 () Bool)

(assert (=> b!943659 (=> (not res!634028) (not e!530580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57002 (_ BitVec 32)) Bool)

(assert (=> b!943659 (= res!634028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(declare-fun b!943660 () Bool)

(declare-datatypes ((List!19258 0))(
  ( (Nil!19255) (Cons!19254 (h!20404 (_ BitVec 64)) (t!27575 List!19258)) )
))
(declare-fun arrayNoDuplicates!0 (array!57002 (_ BitVec 32) List!19258) Bool)

(assert (=> b!943660 (= e!530580 (arrayNoDuplicates!0 (_keys!10517 thiss!1141) #b00000000000000000000000000000000 Nil!19255))))

(assert (= (and d!114233 res!634026) b!943658))

(assert (= (and b!943658 res!634027) b!943659))

(assert (= (and b!943659 res!634028) b!943660))

(declare-fun m!877775 () Bool)

(assert (=> d!114233 m!877775))

(declare-fun m!877777 () Bool)

(assert (=> b!943658 m!877777))

(declare-fun m!877779 () Bool)

(assert (=> b!943659 m!877779))

(declare-fun m!877781 () Bool)

(assert (=> b!943660 m!877781))

(assert (=> start!80310 d!114233))

(declare-fun d!114235 () Bool)

(assert (=> d!114235 (= (array_inv!21312 (_keys!10517 thiss!1141)) (bvsge (size!27892 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943521 d!114235))

(declare-fun d!114237 () Bool)

(assert (=> d!114237 (= (array_inv!21313 (_values!5666 thiss!1141)) (bvsge (size!27891 (_values!5666 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943521 d!114237))

(declare-fun mapNonEmpty!32603 () Bool)

(declare-fun mapRes!32603 () Bool)

(declare-fun tp!62542 () Bool)

(declare-fun e!530586 () Bool)

(assert (=> mapNonEmpty!32603 (= mapRes!32603 (and tp!62542 e!530586))))

(declare-fun mapKey!32603 () (_ BitVec 32))

(declare-fun mapValue!32603 () ValueCell!9777)

(declare-fun mapRest!32603 () (Array (_ BitVec 32) ValueCell!9777))

(assert (=> mapNonEmpty!32603 (= mapRest!32597 (store mapRest!32603 mapKey!32603 mapValue!32603))))

(declare-fun b!943667 () Bool)

(assert (=> b!943667 (= e!530586 tp_is_empty!20517)))

(declare-fun b!943668 () Bool)

(declare-fun e!530585 () Bool)

(assert (=> b!943668 (= e!530585 tp_is_empty!20517)))

(declare-fun condMapEmpty!32603 () Bool)

(declare-fun mapDefault!32603 () ValueCell!9777)

(assert (=> mapNonEmpty!32597 (= condMapEmpty!32603 (= mapRest!32597 ((as const (Array (_ BitVec 32) ValueCell!9777)) mapDefault!32603)))))

(assert (=> mapNonEmpty!32597 (= tp!62533 (and e!530585 mapRes!32603))))

(declare-fun mapIsEmpty!32603 () Bool)

(assert (=> mapIsEmpty!32603 mapRes!32603))

(assert (= (and mapNonEmpty!32597 condMapEmpty!32603) mapIsEmpty!32603))

(assert (= (and mapNonEmpty!32597 (not condMapEmpty!32603)) mapNonEmpty!32603))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9777) mapValue!32603)) b!943667))

(assert (= (and mapNonEmpty!32597 ((_ is ValueCellFull!9777) mapDefault!32603)) b!943668))

(declare-fun m!877783 () Bool)

(assert (=> mapNonEmpty!32603 m!877783))

(declare-fun b_lambda!14281 () Bool)

(assert (= b_lambda!14279 (or (and b!943521 b_free!18009) b_lambda!14281)))

(check-sat (not mapNonEmpty!32603) (not b!943599) (not b!943617) (not b!943610) (not b!943612) (not d!114233) (not b!943609) (not d!114231) (not d!114227) (not b!943556) b_and!29425 (not bm!40980) tp_is_empty!20517 (not b!943554) (not b!943659) (not d!114225) (not b_next!18009) (not b!943600) (not b!943645) (not b!943660) (not b!943650) (not d!114223) (not b!943619) (not bm!40981) (not b!943613) (not b_lambda!14281) (not b!943639) (not bm!40983) (not b!943658) (not bm!40978))
(check-sat b_and!29425 (not b_next!18009))
(get-model)

(declare-fun d!114239 () Bool)

(assert (=> d!114239 (= (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!943609 d!114239))

(declare-fun b!943681 () Bool)

(declare-fun e!530594 () SeekEntryResult!9054)

(assert (=> b!943681 (= e!530594 (MissingVacant!9054 (index!38589 lt!425354)))))

(declare-fun b!943682 () Bool)

(declare-fun e!530593 () SeekEntryResult!9054)

(declare-fun e!530595 () SeekEntryResult!9054)

(assert (=> b!943682 (= e!530593 e!530595)))

(declare-fun c!98282 () Bool)

(declare-fun lt!425364 () (_ BitVec 64))

(assert (=> b!943682 (= c!98282 (= lt!425364 key!756))))

(declare-fun b!943683 () Bool)

(assert (=> b!943683 (= e!530593 Undefined!9054)))

(declare-fun b!943684 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943684 (= e!530594 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81031 lt!425354) #b00000000000000000000000000000001) (nextIndex!0 (index!38589 lt!425354) (x!81031 lt!425354) (mask!27273 thiss!1141)) (index!38589 lt!425354) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(declare-fun b!943685 () Bool)

(declare-fun c!98283 () Bool)

(assert (=> b!943685 (= c!98283 (= lt!425364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943685 (= e!530595 e!530594)))

(declare-fun d!114241 () Bool)

(declare-fun lt!425365 () SeekEntryResult!9054)

(assert (=> d!114241 (and (or ((_ is Undefined!9054) lt!425365) (not ((_ is Found!9054) lt!425365)) (and (bvsge (index!38588 lt!425365) #b00000000000000000000000000000000) (bvslt (index!38588 lt!425365) (size!27892 (_keys!10517 thiss!1141))))) (or ((_ is Undefined!9054) lt!425365) ((_ is Found!9054) lt!425365) (not ((_ is MissingVacant!9054) lt!425365)) (not (= (index!38590 lt!425365) (index!38589 lt!425354))) (and (bvsge (index!38590 lt!425365) #b00000000000000000000000000000000) (bvslt (index!38590 lt!425365) (size!27892 (_keys!10517 thiss!1141))))) (or ((_ is Undefined!9054) lt!425365) (ite ((_ is Found!9054) lt!425365) (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38588 lt!425365)) key!756) (and ((_ is MissingVacant!9054) lt!425365) (= (index!38590 lt!425365) (index!38589 lt!425354)) (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38590 lt!425365)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114241 (= lt!425365 e!530593)))

(declare-fun c!98284 () Bool)

(assert (=> d!114241 (= c!98284 (bvsge (x!81031 lt!425354) #b01111111111111111111111111111110))))

(assert (=> d!114241 (= lt!425364 (select (arr!27427 (_keys!10517 thiss!1141)) (index!38589 lt!425354)))))

(assert (=> d!114241 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114241 (= (seekKeyOrZeroReturnVacant!0 (x!81031 lt!425354) (index!38589 lt!425354) (index!38589 lt!425354) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)) lt!425365)))

(declare-fun b!943686 () Bool)

(assert (=> b!943686 (= e!530595 (Found!9054 (index!38589 lt!425354)))))

(assert (= (and d!114241 c!98284) b!943683))

(assert (= (and d!114241 (not c!98284)) b!943682))

(assert (= (and b!943682 c!98282) b!943686))

(assert (= (and b!943682 (not c!98282)) b!943685))

(assert (= (and b!943685 c!98283) b!943681))

(assert (= (and b!943685 (not c!98283)) b!943684))

(declare-fun m!877785 () Bool)

(assert (=> b!943684 m!877785))

(assert (=> b!943684 m!877785))

(declare-fun m!877787 () Bool)

(assert (=> b!943684 m!877787))

(declare-fun m!877789 () Bool)

(assert (=> d!114241 m!877789))

(declare-fun m!877791 () Bool)

(assert (=> d!114241 m!877791))

(assert (=> d!114241 m!877767))

(assert (=> d!114241 m!877755))

(assert (=> b!943639 d!114241))

(assert (=> b!943650 d!114229))

(declare-fun d!114243 () Bool)

(declare-fun isEmpty!700 (Option!491) Bool)

(assert (=> d!114243 (= (isDefined!357 (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756)) (not (isEmpty!700 (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))))

(declare-fun bs!26520 () Bool)

(assert (= bs!26520 d!114243))

(assert (=> bs!26520 m!877697))

(declare-fun m!877793 () Bool)

(assert (=> bs!26520 m!877793))

(assert (=> b!943556 d!114243))

(declare-fun d!114245 () Bool)

(declare-fun c!98289 () Bool)

(assert (=> d!114245 (= c!98289 (and ((_ is Cons!19252) (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) (= (_1!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) key!756)))))

(declare-fun e!530600 () Option!491)

(assert (=> d!114245 (= (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756) e!530600)))

(declare-fun b!943696 () Bool)

(declare-fun e!530601 () Option!491)

(assert (=> b!943696 (= e!530600 e!530601)))

(declare-fun c!98290 () Bool)

(assert (=> b!943696 (= c!98290 (and ((_ is Cons!19252) (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) (not (= (_1!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) key!756))))))

(declare-fun b!943698 () Bool)

(assert (=> b!943698 (= e!530601 None!489)))

(declare-fun b!943695 () Bool)

(assert (=> b!943695 (= e!530600 (Some!490 (_2!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))))))

(declare-fun b!943697 () Bool)

(assert (=> b!943697 (= e!530601 (getValueByKey!485 (t!27571 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) key!756))))

(assert (= (and d!114245 c!98289) b!943695))

(assert (= (and d!114245 (not c!98289)) b!943696))

(assert (= (and b!943696 c!98290) b!943697))

(assert (= (and b!943696 (not c!98290)) b!943698))

(declare-fun m!877795 () Bool)

(assert (=> b!943697 m!877795))

(assert (=> b!943556 d!114245))

(declare-fun b!943723 () Bool)

(declare-fun e!530620 () ListLongMap!12143)

(declare-fun call!40989 () ListLongMap!12143)

(assert (=> b!943723 (= e!530620 call!40989)))

(declare-fun b!943724 () Bool)

(declare-fun e!530622 () Bool)

(declare-fun lt!425384 () ListLongMap!12143)

(declare-fun isEmpty!701 (ListLongMap!12143) Bool)

(assert (=> b!943724 (= e!530622 (isEmpty!701 lt!425384))))

(declare-fun b!943725 () Bool)

(declare-fun e!530618 () Bool)

(declare-fun e!530617 () Bool)

(assert (=> b!943725 (= e!530618 e!530617)))

(declare-fun c!98300 () Bool)

(declare-fun e!530621 () Bool)

(assert (=> b!943725 (= c!98300 e!530621)))

(declare-fun res!634040 () Bool)

(assert (=> b!943725 (=> (not res!634040) (not e!530621))))

(assert (=> b!943725 (= res!634040 (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943726 () Bool)

(assert (=> b!943726 (= e!530622 (= lt!425384 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5643 thiss!1141))))))

(declare-fun b!943727 () Bool)

(assert (=> b!943727 (= e!530621 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943727 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!943728 () Bool)

(declare-fun lt!425382 () Unit!31816)

(declare-fun lt!425385 () Unit!31816)

(assert (=> b!943728 (= lt!425382 lt!425385)))

(declare-fun lt!425380 () (_ BitVec 64))

(declare-fun lt!425381 () ListLongMap!12143)

(declare-fun lt!425383 () (_ BitVec 64))

(declare-fun lt!425386 () V!32321)

(assert (=> b!943728 (not (contains!5157 (+!2850 lt!425381 (tuple2!13447 lt!425383 lt!425386)) lt!425380))))

(declare-fun addStillNotContains!222 (ListLongMap!12143 (_ BitVec 64) V!32321 (_ BitVec 64)) Unit!31816)

(assert (=> b!943728 (= lt!425385 (addStillNotContains!222 lt!425381 lt!425383 lt!425386 lt!425380))))

(assert (=> b!943728 (= lt!425380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!943728 (= lt!425386 (get!14430 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!943728 (= lt!425383 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943728 (= lt!425381 call!40989)))

(assert (=> b!943728 (= e!530620 (+!2850 call!40989 (tuple2!13447 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) (get!14430 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!943729 () Bool)

(assert (=> b!943729 (= e!530617 e!530622)))

(declare-fun c!98302 () Bool)

(assert (=> b!943729 (= c!98302 (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943730 () Bool)

(declare-fun e!530616 () Bool)

(assert (=> b!943730 (= e!530617 e!530616)))

(assert (=> b!943730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun res!634037 () Bool)

(assert (=> b!943730 (= res!634037 (contains!5157 lt!425384 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943730 (=> (not res!634037) (not e!530616))))

(declare-fun b!943731 () Bool)

(declare-fun e!530619 () ListLongMap!12143)

(assert (=> b!943731 (= e!530619 e!530620)))

(declare-fun c!98299 () Bool)

(assert (=> b!943731 (= c!98299 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943732 () Bool)

(declare-fun res!634038 () Bool)

(assert (=> b!943732 (=> (not res!634038) (not e!530618))))

(assert (=> b!943732 (= res!634038 (not (contains!5157 lt!425384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!40986 () Bool)

(assert (=> bm!40986 (= call!40989 (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5643 thiss!1141)))))

(declare-fun d!114247 () Bool)

(assert (=> d!114247 e!530618))

(declare-fun res!634039 () Bool)

(assert (=> d!114247 (=> (not res!634039) (not e!530618))))

(assert (=> d!114247 (= res!634039 (not (contains!5157 lt!425384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114247 (= lt!425384 e!530619)))

(declare-fun c!98301 () Bool)

(assert (=> d!114247 (= c!98301 (bvsge #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114247 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114247 (= (getCurrentListMapNoExtraKeys!3305 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)) lt!425384)))

(declare-fun b!943733 () Bool)

(assert (=> b!943733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> b!943733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27891 (_values!5666 thiss!1141))))))

(assert (=> b!943733 (= e!530616 (= (apply!866 lt!425384 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)) (get!14430 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943734 () Bool)

(assert (=> b!943734 (= e!530619 (ListLongMap!12144 Nil!19253))))

(assert (= (and d!114247 c!98301) b!943734))

(assert (= (and d!114247 (not c!98301)) b!943731))

(assert (= (and b!943731 c!98299) b!943728))

(assert (= (and b!943731 (not c!98299)) b!943723))

(assert (= (or b!943728 b!943723) bm!40986))

(assert (= (and d!114247 res!634039) b!943732))

(assert (= (and b!943732 res!634038) b!943725))

(assert (= (and b!943725 res!634040) b!943727))

(assert (= (and b!943725 c!98300) b!943730))

(assert (= (and b!943725 (not c!98300)) b!943729))

(assert (= (and b!943730 res!634037) b!943733))

(assert (= (and b!943729 c!98302) b!943726))

(assert (= (and b!943729 (not c!98302)) b!943724))

(declare-fun b_lambda!14283 () Bool)

(assert (=> (not b_lambda!14283) (not b!943728)))

(assert (=> b!943728 t!27574))

(declare-fun b_and!29427 () Bool)

(assert (= b_and!29425 (and (=> t!27574 result!12195) b_and!29427)))

(declare-fun b_lambda!14285 () Bool)

(assert (=> (not b_lambda!14285) (not b!943733)))

(assert (=> b!943733 t!27574))

(declare-fun b_and!29429 () Bool)

(assert (= b_and!29427 (and (=> t!27574 result!12195) b_and!29429)))

(assert (=> b!943733 m!877747))

(assert (=> b!943733 m!877745))

(assert (=> b!943733 m!877713))

(declare-fun m!877797 () Bool)

(assert (=> b!943733 m!877797))

(assert (=> b!943733 m!877747))

(assert (=> b!943733 m!877745))

(assert (=> b!943733 m!877749))

(assert (=> b!943733 m!877713))

(assert (=> b!943731 m!877713))

(assert (=> b!943731 m!877713))

(assert (=> b!943731 m!877735))

(assert (=> b!943730 m!877713))

(assert (=> b!943730 m!877713))

(declare-fun m!877799 () Bool)

(assert (=> b!943730 m!877799))

(declare-fun m!877801 () Bool)

(assert (=> b!943732 m!877801))

(declare-fun m!877803 () Bool)

(assert (=> b!943726 m!877803))

(declare-fun m!877805 () Bool)

(assert (=> b!943724 m!877805))

(assert (=> b!943727 m!877713))

(assert (=> b!943727 m!877713))

(assert (=> b!943727 m!877735))

(declare-fun m!877807 () Bool)

(assert (=> d!114247 m!877807))

(assert (=> d!114247 m!877755))

(assert (=> bm!40986 m!877803))

(assert (=> b!943728 m!877747))

(assert (=> b!943728 m!877745))

(declare-fun m!877809 () Bool)

(assert (=> b!943728 m!877809))

(declare-fun m!877811 () Bool)

(assert (=> b!943728 m!877811))

(assert (=> b!943728 m!877809))

(declare-fun m!877813 () Bool)

(assert (=> b!943728 m!877813))

(assert (=> b!943728 m!877713))

(assert (=> b!943728 m!877747))

(assert (=> b!943728 m!877745))

(assert (=> b!943728 m!877749))

(declare-fun m!877815 () Bool)

(assert (=> b!943728 m!877815))

(assert (=> bm!40983 d!114247))

(declare-fun d!114249 () Bool)

(declare-fun e!530625 () Bool)

(assert (=> d!114249 e!530625))

(declare-fun c!98305 () Bool)

(assert (=> d!114249 (= c!98305 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!114249 true))

(declare-fun _$15!101 () Unit!31816)

(assert (=> d!114249 (= (choose!1565 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) key!756 (defaultEntry!5643 thiss!1141)) _$15!101)))

(declare-fun b!943739 () Bool)

(assert (=> b!943739 (= e!530625 (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!943740 () Bool)

(assert (=> b!943740 (= e!530625 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5375 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114249 c!98305) b!943739))

(assert (= (and d!114249 (not c!98305)) b!943740))

(assert (=> b!943739 m!877659))

(assert (=> d!114231 d!114249))

(declare-fun d!114251 () Bool)

(assert (=> d!114251 (= (validMask!0 (mask!27273 thiss!1141)) (and (or (= (mask!27273 thiss!1141) #b00000000000000000000000000000111) (= (mask!27273 thiss!1141) #b00000000000000000000000000001111) (= (mask!27273 thiss!1141) #b00000000000000000000000000011111) (= (mask!27273 thiss!1141) #b00000000000000000000000000111111) (= (mask!27273 thiss!1141) #b00000000000000000000000001111111) (= (mask!27273 thiss!1141) #b00000000000000000000000011111111) (= (mask!27273 thiss!1141) #b00000000000000000000000111111111) (= (mask!27273 thiss!1141) #b00000000000000000000001111111111) (= (mask!27273 thiss!1141) #b00000000000000000000011111111111) (= (mask!27273 thiss!1141) #b00000000000000000000111111111111) (= (mask!27273 thiss!1141) #b00000000000000000001111111111111) (= (mask!27273 thiss!1141) #b00000000000000000011111111111111) (= (mask!27273 thiss!1141) #b00000000000000000111111111111111) (= (mask!27273 thiss!1141) #b00000000000000001111111111111111) (= (mask!27273 thiss!1141) #b00000000000000011111111111111111) (= (mask!27273 thiss!1141) #b00000000000000111111111111111111) (= (mask!27273 thiss!1141) #b00000000000001111111111111111111) (= (mask!27273 thiss!1141) #b00000000000011111111111111111111) (= (mask!27273 thiss!1141) #b00000000000111111111111111111111) (= (mask!27273 thiss!1141) #b00000000001111111111111111111111) (= (mask!27273 thiss!1141) #b00000000011111111111111111111111) (= (mask!27273 thiss!1141) #b00000000111111111111111111111111) (= (mask!27273 thiss!1141) #b00000001111111111111111111111111) (= (mask!27273 thiss!1141) #b00000011111111111111111111111111) (= (mask!27273 thiss!1141) #b00000111111111111111111111111111) (= (mask!27273 thiss!1141) #b00001111111111111111111111111111) (= (mask!27273 thiss!1141) #b00011111111111111111111111111111) (= (mask!27273 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27273 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114231 d!114251))

(declare-fun d!114253 () Bool)

(assert (=> d!114253 (isDefined!357 (getValueByKey!485 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(declare-fun lt!425389 () Unit!31816)

(declare-fun choose!1566 (List!19256 (_ BitVec 64)) Unit!31816)

(assert (=> d!114253 (= lt!425389 (choose!1566 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(declare-fun e!530628 () Bool)

(assert (=> d!114253 e!530628))

(declare-fun res!634043 () Bool)

(assert (=> d!114253 (=> (not res!634043) (not e!530628))))

(declare-fun isStrictlySorted!505 (List!19256) Bool)

(assert (=> d!114253 (= res!634043 (isStrictlySorted!505 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))))))

(assert (=> d!114253 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756) lt!425389)))

(declare-fun b!943743 () Bool)

(assert (=> b!943743 (= e!530628 (containsKey!452 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756))))

(assert (= (and d!114253 res!634043) b!943743))

(assert (=> d!114253 m!877697))

(assert (=> d!114253 m!877697))

(assert (=> d!114253 m!877699))

(declare-fun m!877817 () Bool)

(assert (=> d!114253 m!877817))

(declare-fun m!877819 () Bool)

(assert (=> d!114253 m!877819))

(assert (=> b!943743 m!877693))

(assert (=> b!943554 d!114253))

(assert (=> b!943554 d!114243))

(assert (=> b!943554 d!114245))

(declare-fun d!114255 () Bool)

(declare-fun get!14431 (Option!491) V!32321)

(assert (=> d!114255 (= (apply!866 lt!425329 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)) (get!14431 (getValueByKey!485 (toList!6087 lt!425329) (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26521 () Bool)

(assert (= bs!26521 d!114255))

(assert (=> bs!26521 m!877713))

(declare-fun m!877821 () Bool)

(assert (=> bs!26521 m!877821))

(assert (=> bs!26521 m!877821))

(declare-fun m!877823 () Bool)

(assert (=> bs!26521 m!877823))

(assert (=> b!943619 d!114255))

(declare-fun d!114257 () Bool)

(declare-fun c!98308 () Bool)

(assert (=> d!114257 (= c!98308 ((_ is ValueCellFull!9777) (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!530631 () V!32321)

(assert (=> d!114257 (= (get!14430 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!530631)))

(declare-fun b!943748 () Bool)

(declare-fun get!14432 (ValueCell!9777 V!32321) V!32321)

(assert (=> b!943748 (= e!530631 (get!14432 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!943749 () Bool)

(declare-fun get!14433 (ValueCell!9777 V!32321) V!32321)

(assert (=> b!943749 (= e!530631 (get!14433 (select (arr!27426 (_values!5666 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5643 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114257 c!98308) b!943748))

(assert (= (and d!114257 (not c!98308)) b!943749))

(assert (=> b!943748 m!877747))

(assert (=> b!943748 m!877745))

(declare-fun m!877825 () Bool)

(assert (=> b!943748 m!877825))

(assert (=> b!943749 m!877747))

(assert (=> b!943749 m!877745))

(declare-fun m!877827 () Bool)

(assert (=> b!943749 m!877827))

(assert (=> b!943619 d!114257))

(declare-fun d!114259 () Bool)

(declare-fun res!634044 () Bool)

(declare-fun e!530632 () Bool)

(assert (=> d!114259 (=> res!634044 e!530632)))

(assert (=> d!114259 (= res!634044 (= (select (arr!27427 (_keys!10517 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114259 (= (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!530632)))

(declare-fun b!943750 () Bool)

(declare-fun e!530633 () Bool)

(assert (=> b!943750 (= e!530632 e!530633)))

(declare-fun res!634045 () Bool)

(assert (=> b!943750 (=> (not res!634045) (not e!530633))))

(assert (=> b!943750 (= res!634045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943751 () Bool)

(assert (=> b!943751 (= e!530633 (arrayContainsKey!0 (_keys!10517 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114259 (not res!634044)) b!943750))

(assert (= (and b!943750 res!634045) b!943751))

(declare-fun m!877829 () Bool)

(assert (=> d!114259 m!877829))

(declare-fun m!877831 () Bool)

(assert (=> b!943751 m!877831))

(assert (=> b!943645 d!114259))

(declare-fun d!114261 () Bool)

(assert (=> d!114261 (= (apply!866 (+!2850 lt!425343 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) lt!425338) (get!14431 (getValueByKey!485 (toList!6087 (+!2850 lt!425343 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))) lt!425338)))))

(declare-fun bs!26522 () Bool)

(assert (= bs!26522 d!114261))

(declare-fun m!877833 () Bool)

(assert (=> bs!26522 m!877833))

(assert (=> bs!26522 m!877833))

(declare-fun m!877835 () Bool)

(assert (=> bs!26522 m!877835))

(assert (=> b!943617 d!114261))

(declare-fun d!114263 () Bool)

(declare-fun e!530636 () Bool)

(assert (=> d!114263 e!530636))

(declare-fun res!634051 () Bool)

(assert (=> d!114263 (=> (not res!634051) (not e!530636))))

(declare-fun lt!425400 () ListLongMap!12143)

(assert (=> d!114263 (= res!634051 (contains!5157 lt!425400 (_1!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))))))

(declare-fun lt!425399 () List!19256)

(assert (=> d!114263 (= lt!425400 (ListLongMap!12144 lt!425399))))

(declare-fun lt!425401 () Unit!31816)

(declare-fun lt!425398 () Unit!31816)

(assert (=> d!114263 (= lt!425401 lt!425398)))

(assert (=> d!114263 (= (getValueByKey!485 lt!425399 (_1!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!261 (List!19256 (_ BitVec 64) V!32321) Unit!31816)

(assert (=> d!114263 (= lt!425398 (lemmaContainsTupThenGetReturnValue!261 lt!425399 (_1!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))))))

(declare-fun insertStrictlySorted!318 (List!19256 (_ BitVec 64) V!32321) List!19256)

(assert (=> d!114263 (= lt!425399 (insertStrictlySorted!318 (toList!6087 lt!425331) (_1!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))))))

(assert (=> d!114263 (= (+!2850 lt!425331 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) lt!425400)))

(declare-fun b!943756 () Bool)

(declare-fun res!634050 () Bool)

(assert (=> b!943756 (=> (not res!634050) (not e!530636))))

(assert (=> b!943756 (= res!634050 (= (getValueByKey!485 (toList!6087 lt!425400) (_1!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))))))))

(declare-fun b!943757 () Bool)

(declare-fun contains!5159 (List!19256 tuple2!13446) Bool)

(assert (=> b!943757 (= e!530636 (contains!5159 (toList!6087 lt!425400) (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))))))

(assert (= (and d!114263 res!634051) b!943756))

(assert (= (and b!943756 res!634050) b!943757))

(declare-fun m!877837 () Bool)

(assert (=> d!114263 m!877837))

(declare-fun m!877839 () Bool)

(assert (=> d!114263 m!877839))

(declare-fun m!877841 () Bool)

(assert (=> d!114263 m!877841))

(declare-fun m!877843 () Bool)

(assert (=> d!114263 m!877843))

(declare-fun m!877845 () Bool)

(assert (=> b!943756 m!877845))

(declare-fun m!877847 () Bool)

(assert (=> b!943757 m!877847))

(assert (=> b!943617 d!114263))

(declare-fun d!114265 () Bool)

(declare-fun e!530637 () Bool)

(assert (=> d!114265 e!530637))

(declare-fun res!634052 () Bool)

(assert (=> d!114265 (=> res!634052 e!530637)))

(declare-fun lt!425403 () Bool)

(assert (=> d!114265 (= res!634052 (not lt!425403))))

(declare-fun lt!425404 () Bool)

(assert (=> d!114265 (= lt!425403 lt!425404)))

(declare-fun lt!425405 () Unit!31816)

(declare-fun e!530638 () Unit!31816)

(assert (=> d!114265 (= lt!425405 e!530638)))

(declare-fun c!98309 () Bool)

(assert (=> d!114265 (= c!98309 lt!425404)))

(assert (=> d!114265 (= lt!425404 (containsKey!452 (toList!6087 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) lt!425337))))

(assert (=> d!114265 (= (contains!5157 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) lt!425337) lt!425403)))

(declare-fun b!943758 () Bool)

(declare-fun lt!425402 () Unit!31816)

(assert (=> b!943758 (= e!530638 lt!425402)))

(assert (=> b!943758 (= lt!425402 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) lt!425337))))

(assert (=> b!943758 (isDefined!357 (getValueByKey!485 (toList!6087 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) lt!425337))))

(declare-fun b!943759 () Bool)

(declare-fun Unit!31822 () Unit!31816)

(assert (=> b!943759 (= e!530638 Unit!31822)))

(declare-fun b!943760 () Bool)

(assert (=> b!943760 (= e!530637 (isDefined!357 (getValueByKey!485 (toList!6087 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) lt!425337)))))

(assert (= (and d!114265 c!98309) b!943758))

(assert (= (and d!114265 (not c!98309)) b!943759))

(assert (= (and d!114265 (not res!634052)) b!943760))

(declare-fun m!877849 () Bool)

(assert (=> d!114265 m!877849))

(declare-fun m!877851 () Bool)

(assert (=> b!943758 m!877851))

(declare-fun m!877853 () Bool)

(assert (=> b!943758 m!877853))

(assert (=> b!943758 m!877853))

(declare-fun m!877855 () Bool)

(assert (=> b!943758 m!877855))

(assert (=> b!943760 m!877853))

(assert (=> b!943760 m!877853))

(assert (=> b!943760 m!877855))

(assert (=> b!943617 d!114265))

(declare-fun d!114267 () Bool)

(assert (=> d!114267 (= (apply!866 (+!2850 lt!425343 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) lt!425338) (apply!866 lt!425343 lt!425338))))

(declare-fun lt!425408 () Unit!31816)

(declare-fun choose!1567 (ListLongMap!12143 (_ BitVec 64) V!32321 (_ BitVec 64)) Unit!31816)

(assert (=> d!114267 (= lt!425408 (choose!1567 lt!425343 lt!425332 (minValue!5479 thiss!1141) lt!425338))))

(declare-fun e!530641 () Bool)

(assert (=> d!114267 e!530641))

(declare-fun res!634055 () Bool)

(assert (=> d!114267 (=> (not res!634055) (not e!530641))))

(assert (=> d!114267 (= res!634055 (contains!5157 lt!425343 lt!425338))))

(assert (=> d!114267 (= (addApplyDifferent!449 lt!425343 lt!425332 (minValue!5479 thiss!1141) lt!425338) lt!425408)))

(declare-fun b!943764 () Bool)

(assert (=> b!943764 (= e!530641 (not (= lt!425338 lt!425332)))))

(assert (= (and d!114267 res!634055) b!943764))

(declare-fun m!877857 () Bool)

(assert (=> d!114267 m!877857))

(assert (=> d!114267 m!877729))

(assert (=> d!114267 m!877731))

(assert (=> d!114267 m!877729))

(assert (=> d!114267 m!877717))

(declare-fun m!877859 () Bool)

(assert (=> d!114267 m!877859))

(assert (=> b!943617 d!114267))

(declare-fun d!114269 () Bool)

(assert (=> d!114269 (= (apply!866 lt!425339 lt!425323) (get!14431 (getValueByKey!485 (toList!6087 lt!425339) lt!425323)))))

(declare-fun bs!26523 () Bool)

(assert (= bs!26523 d!114269))

(declare-fun m!877861 () Bool)

(assert (=> bs!26523 m!877861))

(assert (=> bs!26523 m!877861))

(declare-fun m!877863 () Bool)

(assert (=> bs!26523 m!877863))

(assert (=> b!943617 d!114269))

(declare-fun d!114271 () Bool)

(assert (=> d!114271 (= (apply!866 (+!2850 lt!425331 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) lt!425342) (get!14431 (getValueByKey!485 (toList!6087 (+!2850 lt!425331 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141)))) lt!425342)))))

(declare-fun bs!26524 () Bool)

(assert (= bs!26524 d!114271))

(declare-fun m!877865 () Bool)

(assert (=> bs!26524 m!877865))

(assert (=> bs!26524 m!877865))

(declare-fun m!877867 () Bool)

(assert (=> bs!26524 m!877867))

(assert (=> b!943617 d!114271))

(declare-fun d!114273 () Bool)

(assert (=> d!114273 (= (apply!866 lt!425343 lt!425338) (get!14431 (getValueByKey!485 (toList!6087 lt!425343) lt!425338)))))

(declare-fun bs!26525 () Bool)

(assert (= bs!26525 d!114273))

(declare-fun m!877869 () Bool)

(assert (=> bs!26525 m!877869))

(assert (=> bs!26525 m!877869))

(declare-fun m!877871 () Bool)

(assert (=> bs!26525 m!877871))

(assert (=> b!943617 d!114273))

(declare-fun d!114275 () Bool)

(assert (=> d!114275 (= (apply!866 (+!2850 lt!425331 (tuple2!13447 lt!425336 (minValue!5479 thiss!1141))) lt!425342) (apply!866 lt!425331 lt!425342))))

(declare-fun lt!425409 () Unit!31816)

(assert (=> d!114275 (= lt!425409 (choose!1567 lt!425331 lt!425336 (minValue!5479 thiss!1141) lt!425342))))

(declare-fun e!530642 () Bool)

(assert (=> d!114275 e!530642))

(declare-fun res!634056 () Bool)

(assert (=> d!114275 (=> (not res!634056) (not e!530642))))

(assert (=> d!114275 (= res!634056 (contains!5157 lt!425331 lt!425342))))

(assert (=> d!114275 (= (addApplyDifferent!449 lt!425331 lt!425336 (minValue!5479 thiss!1141) lt!425342) lt!425409)))

(declare-fun b!943765 () Bool)

(assert (=> b!943765 (= e!530642 (not (= lt!425342 lt!425336)))))

(assert (= (and d!114275 res!634056) b!943765))

(declare-fun m!877873 () Bool)

(assert (=> d!114275 m!877873))

(assert (=> d!114275 m!877703))

(assert (=> d!114275 m!877705))

(assert (=> d!114275 m!877703))

(assert (=> d!114275 m!877719))

(declare-fun m!877875 () Bool)

(assert (=> d!114275 m!877875))

(assert (=> b!943617 d!114275))

(declare-fun d!114277 () Bool)

(assert (=> d!114277 (= (apply!866 (+!2850 lt!425339 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) lt!425323) (get!14431 (getValueByKey!485 (toList!6087 (+!2850 lt!425339 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))) lt!425323)))))

(declare-fun bs!26526 () Bool)

(assert (= bs!26526 d!114277))

(declare-fun m!877877 () Bool)

(assert (=> bs!26526 m!877877))

(assert (=> bs!26526 m!877877))

(declare-fun m!877879 () Bool)

(assert (=> bs!26526 m!877879))

(assert (=> b!943617 d!114277))

(declare-fun d!114279 () Bool)

(assert (=> d!114279 (contains!5157 (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) lt!425337)))

(declare-fun lt!425412 () Unit!31816)

(declare-fun choose!1568 (ListLongMap!12143 (_ BitVec 64) V!32321 (_ BitVec 64)) Unit!31816)

(assert (=> d!114279 (= lt!425412 (choose!1568 lt!425328 lt!425326 (zeroValue!5479 thiss!1141) lt!425337))))

(assert (=> d!114279 (contains!5157 lt!425328 lt!425337)))

(assert (=> d!114279 (= (addStillContains!569 lt!425328 lt!425326 (zeroValue!5479 thiss!1141) lt!425337) lt!425412)))

(declare-fun bs!26527 () Bool)

(assert (= bs!26527 d!114279))

(assert (=> bs!26527 m!877701))

(assert (=> bs!26527 m!877701))

(assert (=> bs!26527 m!877721))

(declare-fun m!877881 () Bool)

(assert (=> bs!26527 m!877881))

(declare-fun m!877883 () Bool)

(assert (=> bs!26527 m!877883))

(assert (=> b!943617 d!114279))

(declare-fun d!114281 () Bool)

(declare-fun e!530643 () Bool)

(assert (=> d!114281 e!530643))

(declare-fun res!634058 () Bool)

(assert (=> d!114281 (=> (not res!634058) (not e!530643))))

(declare-fun lt!425415 () ListLongMap!12143)

(assert (=> d!114281 (= res!634058 (contains!5157 lt!425415 (_1!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))))))

(declare-fun lt!425414 () List!19256)

(assert (=> d!114281 (= lt!425415 (ListLongMap!12144 lt!425414))))

(declare-fun lt!425416 () Unit!31816)

(declare-fun lt!425413 () Unit!31816)

(assert (=> d!114281 (= lt!425416 lt!425413)))

(assert (=> d!114281 (= (getValueByKey!485 lt!425414 (_1!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114281 (= lt!425413 (lemmaContainsTupThenGetReturnValue!261 lt!425414 (_1!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114281 (= lt!425414 (insertStrictlySorted!318 (toList!6087 lt!425328) (_1!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114281 (= (+!2850 lt!425328 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))) lt!425415)))

(declare-fun b!943767 () Bool)

(declare-fun res!634057 () Bool)

(assert (=> b!943767 (=> (not res!634057) (not e!530643))))

(assert (=> b!943767 (= res!634057 (= (getValueByKey!485 (toList!6087 lt!425415) (_1!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))))))))

(declare-fun b!943768 () Bool)

(assert (=> b!943768 (= e!530643 (contains!5159 (toList!6087 lt!425415) (tuple2!13447 lt!425326 (zeroValue!5479 thiss!1141))))))

(assert (= (and d!114281 res!634058) b!943767))

(assert (= (and b!943767 res!634057) b!943768))

(declare-fun m!877885 () Bool)

(assert (=> d!114281 m!877885))

(declare-fun m!877887 () Bool)

(assert (=> d!114281 m!877887))

(declare-fun m!877889 () Bool)

(assert (=> d!114281 m!877889))

(declare-fun m!877891 () Bool)

(assert (=> d!114281 m!877891))

(declare-fun m!877893 () Bool)

(assert (=> b!943767 m!877893))

(declare-fun m!877895 () Bool)

(assert (=> b!943768 m!877895))

(assert (=> b!943617 d!114281))

(assert (=> b!943617 d!114247))

(declare-fun d!114283 () Bool)

(assert (=> d!114283 (= (apply!866 lt!425331 lt!425342) (get!14431 (getValueByKey!485 (toList!6087 lt!425331) lt!425342)))))

(declare-fun bs!26528 () Bool)

(assert (= bs!26528 d!114283))

(declare-fun m!877897 () Bool)

(assert (=> bs!26528 m!877897))

(assert (=> bs!26528 m!877897))

(declare-fun m!877899 () Bool)

(assert (=> bs!26528 m!877899))

(assert (=> b!943617 d!114283))

(declare-fun d!114285 () Bool)

(declare-fun e!530644 () Bool)

(assert (=> d!114285 e!530644))

(declare-fun res!634060 () Bool)

(assert (=> d!114285 (=> (not res!634060) (not e!530644))))

(declare-fun lt!425419 () ListLongMap!12143)

(assert (=> d!114285 (= res!634060 (contains!5157 lt!425419 (_1!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))))))

(declare-fun lt!425418 () List!19256)

(assert (=> d!114285 (= lt!425419 (ListLongMap!12144 lt!425418))))

(declare-fun lt!425420 () Unit!31816)

(declare-fun lt!425417 () Unit!31816)

(assert (=> d!114285 (= lt!425420 lt!425417)))

(assert (=> d!114285 (= (getValueByKey!485 lt!425418 (_1!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114285 (= lt!425417 (lemmaContainsTupThenGetReturnValue!261 lt!425418 (_1!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114285 (= lt!425418 (insertStrictlySorted!318 (toList!6087 lt!425339) (_1!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))))))

(assert (=> d!114285 (= (+!2850 lt!425339 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) lt!425419)))

(declare-fun b!943769 () Bool)

(declare-fun res!634059 () Bool)

(assert (=> b!943769 (=> (not res!634059) (not e!530644))))

(assert (=> b!943769 (= res!634059 (= (getValueByKey!485 (toList!6087 lt!425419) (_1!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))))))))

(declare-fun b!943770 () Bool)

(assert (=> b!943770 (= e!530644 (contains!5159 (toList!6087 lt!425419) (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))))))

(assert (= (and d!114285 res!634060) b!943769))

(assert (= (and b!943769 res!634059) b!943770))

(declare-fun m!877901 () Bool)

(assert (=> d!114285 m!877901))

(declare-fun m!877903 () Bool)

(assert (=> d!114285 m!877903))

(declare-fun m!877905 () Bool)

(assert (=> d!114285 m!877905))

(declare-fun m!877907 () Bool)

(assert (=> d!114285 m!877907))

(declare-fun m!877909 () Bool)

(assert (=> b!943769 m!877909))

(declare-fun m!877911 () Bool)

(assert (=> b!943770 m!877911))

(assert (=> b!943617 d!114285))

(declare-fun d!114287 () Bool)

(declare-fun e!530645 () Bool)

(assert (=> d!114287 e!530645))

(declare-fun res!634062 () Bool)

(assert (=> d!114287 (=> (not res!634062) (not e!530645))))

(declare-fun lt!425423 () ListLongMap!12143)

(assert (=> d!114287 (= res!634062 (contains!5157 lt!425423 (_1!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))))))

(declare-fun lt!425422 () List!19256)

(assert (=> d!114287 (= lt!425423 (ListLongMap!12144 lt!425422))))

(declare-fun lt!425424 () Unit!31816)

(declare-fun lt!425421 () Unit!31816)

(assert (=> d!114287 (= lt!425424 lt!425421)))

(assert (=> d!114287 (= (getValueByKey!485 lt!425422 (_1!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))))))

(assert (=> d!114287 (= lt!425421 (lemmaContainsTupThenGetReturnValue!261 lt!425422 (_1!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))))))

(assert (=> d!114287 (= lt!425422 (insertStrictlySorted!318 (toList!6087 lt!425343) (_1!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))))))

(assert (=> d!114287 (= (+!2850 lt!425343 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))) lt!425423)))

(declare-fun b!943771 () Bool)

(declare-fun res!634061 () Bool)

(assert (=> b!943771 (=> (not res!634061) (not e!530645))))

(assert (=> b!943771 (= res!634061 (= (getValueByKey!485 (toList!6087 lt!425423) (_1!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))))))))

(declare-fun b!943772 () Bool)

(assert (=> b!943772 (= e!530645 (contains!5159 (toList!6087 lt!425423) (tuple2!13447 lt!425332 (minValue!5479 thiss!1141))))))

(assert (= (and d!114287 res!634062) b!943771))

(assert (= (and b!943771 res!634061) b!943772))

(declare-fun m!877913 () Bool)

(assert (=> d!114287 m!877913))

(declare-fun m!877915 () Bool)

(assert (=> d!114287 m!877915))

(declare-fun m!877917 () Bool)

(assert (=> d!114287 m!877917))

(declare-fun m!877919 () Bool)

(assert (=> d!114287 m!877919))

(declare-fun m!877921 () Bool)

(assert (=> b!943771 m!877921))

(declare-fun m!877923 () Bool)

(assert (=> b!943772 m!877923))

(assert (=> b!943617 d!114287))

(declare-fun d!114289 () Bool)

(assert (=> d!114289 (= (apply!866 (+!2850 lt!425339 (tuple2!13447 lt!425344 (zeroValue!5479 thiss!1141))) lt!425323) (apply!866 lt!425339 lt!425323))))

(declare-fun lt!425425 () Unit!31816)

(assert (=> d!114289 (= lt!425425 (choose!1567 lt!425339 lt!425344 (zeroValue!5479 thiss!1141) lt!425323))))

(declare-fun e!530646 () Bool)

(assert (=> d!114289 e!530646))

(declare-fun res!634063 () Bool)

(assert (=> d!114289 (=> (not res!634063) (not e!530646))))

(assert (=> d!114289 (= res!634063 (contains!5157 lt!425339 lt!425323))))

(assert (=> d!114289 (= (addApplyDifferent!449 lt!425339 lt!425344 (zeroValue!5479 thiss!1141) lt!425323) lt!425425)))

(declare-fun b!943773 () Bool)

(assert (=> b!943773 (= e!530646 (not (= lt!425323 lt!425344)))))

(assert (= (and d!114289 res!634063) b!943773))

(declare-fun m!877925 () Bool)

(assert (=> d!114289 m!877925))

(assert (=> d!114289 m!877707))

(assert (=> d!114289 m!877709))

(assert (=> d!114289 m!877707))

(assert (=> d!114289 m!877725))

(declare-fun m!877927 () Bool)

(assert (=> d!114289 m!877927))

(assert (=> b!943617 d!114289))

(declare-fun d!114291 () Bool)

(declare-fun e!530647 () Bool)

(assert (=> d!114291 e!530647))

(declare-fun res!634064 () Bool)

(assert (=> d!114291 (=> res!634064 e!530647)))

(declare-fun lt!425427 () Bool)

(assert (=> d!114291 (= res!634064 (not lt!425427))))

(declare-fun lt!425428 () Bool)

(assert (=> d!114291 (= lt!425427 lt!425428)))

(declare-fun lt!425429 () Unit!31816)

(declare-fun e!530648 () Unit!31816)

(assert (=> d!114291 (= lt!425429 e!530648)))

(declare-fun c!98310 () Bool)

(assert (=> d!114291 (= c!98310 lt!425428)))

(assert (=> d!114291 (= lt!425428 (containsKey!452 (toList!6087 lt!425329) (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114291 (= (contains!5157 lt!425329 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)) lt!425427)))

(declare-fun b!943774 () Bool)

(declare-fun lt!425426 () Unit!31816)

(assert (=> b!943774 (= e!530648 lt!425426)))

(assert (=> b!943774 (= lt!425426 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 lt!425329) (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943774 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943775 () Bool)

(declare-fun Unit!31823 () Unit!31816)

(assert (=> b!943775 (= e!530648 Unit!31823)))

(declare-fun b!943776 () Bool)

(assert (=> b!943776 (= e!530647 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114291 c!98310) b!943774))

(assert (= (and d!114291 (not c!98310)) b!943775))

(assert (= (and d!114291 (not res!634064)) b!943776))

(assert (=> d!114291 m!877713))

(declare-fun m!877929 () Bool)

(assert (=> d!114291 m!877929))

(assert (=> b!943774 m!877713))

(declare-fun m!877931 () Bool)

(assert (=> b!943774 m!877931))

(assert (=> b!943774 m!877713))

(assert (=> b!943774 m!877821))

(assert (=> b!943774 m!877821))

(declare-fun m!877933 () Bool)

(assert (=> b!943774 m!877933))

(assert (=> b!943776 m!877713))

(assert (=> b!943776 m!877821))

(assert (=> b!943776 m!877821))

(assert (=> b!943776 m!877933))

(assert (=> b!943600 d!114291))

(declare-fun d!114293 () Bool)

(declare-fun e!530649 () Bool)

(assert (=> d!114293 e!530649))

(declare-fun res!634065 () Bool)

(assert (=> d!114293 (=> res!634065 e!530649)))

(declare-fun lt!425431 () Bool)

(assert (=> d!114293 (= res!634065 (not lt!425431))))

(declare-fun lt!425432 () Bool)

(assert (=> d!114293 (= lt!425431 lt!425432)))

(declare-fun lt!425433 () Unit!31816)

(declare-fun e!530650 () Unit!31816)

(assert (=> d!114293 (= lt!425433 e!530650)))

(declare-fun c!98311 () Bool)

(assert (=> d!114293 (= c!98311 lt!425432)))

(assert (=> d!114293 (= lt!425432 (containsKey!452 (toList!6087 lt!425329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114293 (= (contains!5157 lt!425329 #b1000000000000000000000000000000000000000000000000000000000000000) lt!425431)))

(declare-fun b!943777 () Bool)

(declare-fun lt!425430 () Unit!31816)

(assert (=> b!943777 (= e!530650 lt!425430)))

(assert (=> b!943777 (= lt!425430 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 lt!425329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943777 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943778 () Bool)

(declare-fun Unit!31824 () Unit!31816)

(assert (=> b!943778 (= e!530650 Unit!31824)))

(declare-fun b!943779 () Bool)

(assert (=> b!943779 (= e!530649 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114293 c!98311) b!943777))

(assert (= (and d!114293 (not c!98311)) b!943778))

(assert (= (and d!114293 (not res!634065)) b!943779))

(declare-fun m!877935 () Bool)

(assert (=> d!114293 m!877935))

(declare-fun m!877937 () Bool)

(assert (=> b!943777 m!877937))

(declare-fun m!877939 () Bool)

(assert (=> b!943777 m!877939))

(assert (=> b!943777 m!877939))

(declare-fun m!877941 () Bool)

(assert (=> b!943777 m!877941))

(assert (=> b!943779 m!877939))

(assert (=> b!943779 m!877939))

(assert (=> b!943779 m!877941))

(assert (=> bm!40980 d!114293))

(declare-fun b!943798 () Bool)

(declare-fun lt!425438 () SeekEntryResult!9054)

(assert (=> b!943798 (and (bvsge (index!38589 lt!425438) #b00000000000000000000000000000000) (bvslt (index!38589 lt!425438) (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun res!634074 () Bool)

(assert (=> b!943798 (= res!634074 (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38589 lt!425438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530661 () Bool)

(assert (=> b!943798 (=> res!634074 e!530661)))

(declare-fun b!943799 () Bool)

(declare-fun e!530665 () Bool)

(assert (=> b!943799 (= e!530665 (bvsge (x!81031 lt!425438) #b01111111111111111111111111111110))))

(declare-fun d!114295 () Bool)

(assert (=> d!114295 e!530665))

(declare-fun c!98320 () Bool)

(assert (=> d!114295 (= c!98320 (and ((_ is Intermediate!9054) lt!425438) (undefined!9866 lt!425438)))))

(declare-fun e!530664 () SeekEntryResult!9054)

(assert (=> d!114295 (= lt!425438 e!530664)))

(declare-fun c!98319 () Bool)

(assert (=> d!114295 (= c!98319 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425439 () (_ BitVec 64))

(assert (=> d!114295 (= lt!425439 (select (arr!27427 (_keys!10517 thiss!1141)) (toIndex!0 key!756 (mask!27273 thiss!1141))))))

(assert (=> d!114295 (validMask!0 (mask!27273 thiss!1141))))

(assert (=> d!114295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27273 thiss!1141)) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)) lt!425438)))

(declare-fun b!943800 () Bool)

(declare-fun e!530662 () SeekEntryResult!9054)

(assert (=> b!943800 (= e!530664 e!530662)))

(declare-fun c!98318 () Bool)

(assert (=> b!943800 (= c!98318 (or (= lt!425439 key!756) (= (bvadd lt!425439 lt!425439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!943801 () Bool)

(assert (=> b!943801 (= e!530664 (Intermediate!9054 true (toIndex!0 key!756 (mask!27273 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!943802 () Bool)

(assert (=> b!943802 (and (bvsge (index!38589 lt!425438) #b00000000000000000000000000000000) (bvslt (index!38589 lt!425438) (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> b!943802 (= e!530661 (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38589 lt!425438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943803 () Bool)

(assert (=> b!943803 (= e!530662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27273 thiss!1141)) #b00000000000000000000000000000000 (mask!27273 thiss!1141)) key!756 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(declare-fun b!943804 () Bool)

(assert (=> b!943804 (and (bvsge (index!38589 lt!425438) #b00000000000000000000000000000000) (bvslt (index!38589 lt!425438) (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun res!634072 () Bool)

(assert (=> b!943804 (= res!634072 (= (select (arr!27427 (_keys!10517 thiss!1141)) (index!38589 lt!425438)) key!756))))

(assert (=> b!943804 (=> res!634072 e!530661)))

(declare-fun e!530663 () Bool)

(assert (=> b!943804 (= e!530663 e!530661)))

(declare-fun b!943805 () Bool)

(assert (=> b!943805 (= e!530665 e!530663)))

(declare-fun res!634073 () Bool)

(assert (=> b!943805 (= res!634073 (and ((_ is Intermediate!9054) lt!425438) (not (undefined!9866 lt!425438)) (bvslt (x!81031 lt!425438) #b01111111111111111111111111111110) (bvsge (x!81031 lt!425438) #b00000000000000000000000000000000) (bvsge (x!81031 lt!425438) #b00000000000000000000000000000000)))))

(assert (=> b!943805 (=> (not res!634073) (not e!530663))))

(declare-fun b!943806 () Bool)

(assert (=> b!943806 (= e!530662 (Intermediate!9054 false (toIndex!0 key!756 (mask!27273 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114295 c!98319) b!943801))

(assert (= (and d!114295 (not c!98319)) b!943800))

(assert (= (and b!943800 c!98318) b!943806))

(assert (= (and b!943800 (not c!98318)) b!943803))

(assert (= (and d!114295 c!98320) b!943799))

(assert (= (and d!114295 (not c!98320)) b!943805))

(assert (= (and b!943805 res!634073) b!943804))

(assert (= (and b!943804 (not res!634072)) b!943798))

(assert (= (and b!943798 (not res!634074)) b!943802))

(assert (=> d!114295 m!877763))

(declare-fun m!877943 () Bool)

(assert (=> d!114295 m!877943))

(assert (=> d!114295 m!877755))

(assert (=> b!943803 m!877763))

(declare-fun m!877945 () Bool)

(assert (=> b!943803 m!877945))

(assert (=> b!943803 m!877945))

(declare-fun m!877947 () Bool)

(assert (=> b!943803 m!877947))

(declare-fun m!877949 () Bool)

(assert (=> b!943802 m!877949))

(assert (=> b!943804 m!877949))

(assert (=> b!943798 m!877949))

(assert (=> d!114227 d!114295))

(declare-fun d!114297 () Bool)

(declare-fun lt!425445 () (_ BitVec 32))

(declare-fun lt!425444 () (_ BitVec 32))

(assert (=> d!114297 (= lt!425445 (bvmul (bvxor lt!425444 (bvlshr lt!425444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114297 (= lt!425444 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114297 (and (bvsge (mask!27273 thiss!1141) #b00000000000000000000000000000000) (let ((res!634075 (let ((h!20405 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81050 (bvmul (bvxor h!20405 (bvlshr h!20405 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81050 (bvlshr x!81050 #b00000000000000000000000000001101)) (mask!27273 thiss!1141)))))) (and (bvslt res!634075 (bvadd (mask!27273 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!634075 #b00000000000000000000000000000000))))))

(assert (=> d!114297 (= (toIndex!0 key!756 (mask!27273 thiss!1141)) (bvand (bvxor lt!425445 (bvlshr lt!425445 #b00000000000000000000000000001101)) (mask!27273 thiss!1141)))))

(assert (=> d!114227 d!114297))

(assert (=> d!114227 d!114251))

(declare-fun d!114299 () Bool)

(assert (=> d!114299 (= (apply!866 lt!425329 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14431 (getValueByKey!485 (toList!6087 lt!425329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26529 () Bool)

(assert (= bs!26529 d!114299))

(assert (=> bs!26529 m!877939))

(assert (=> bs!26529 m!877939))

(declare-fun m!877951 () Bool)

(assert (=> bs!26529 m!877951))

(assert (=> b!943599 d!114299))

(declare-fun d!114301 () Bool)

(declare-fun e!530666 () Bool)

(assert (=> d!114301 e!530666))

(declare-fun res!634076 () Bool)

(assert (=> d!114301 (=> res!634076 e!530666)))

(declare-fun lt!425447 () Bool)

(assert (=> d!114301 (= res!634076 (not lt!425447))))

(declare-fun lt!425448 () Bool)

(assert (=> d!114301 (= lt!425447 lt!425448)))

(declare-fun lt!425449 () Unit!31816)

(declare-fun e!530667 () Unit!31816)

(assert (=> d!114301 (= lt!425449 e!530667)))

(declare-fun c!98321 () Bool)

(assert (=> d!114301 (= c!98321 lt!425448)))

(assert (=> d!114301 (= lt!425448 (containsKey!452 (toList!6087 lt!425329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114301 (= (contains!5157 lt!425329 #b0000000000000000000000000000000000000000000000000000000000000000) lt!425447)))

(declare-fun b!943807 () Bool)

(declare-fun lt!425446 () Unit!31816)

(assert (=> b!943807 (= e!530667 lt!425446)))

(assert (=> b!943807 (= lt!425446 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6087 lt!425329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943807 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943808 () Bool)

(declare-fun Unit!31825 () Unit!31816)

(assert (=> b!943808 (= e!530667 Unit!31825)))

(declare-fun b!943809 () Bool)

(assert (=> b!943809 (= e!530666 (isDefined!357 (getValueByKey!485 (toList!6087 lt!425329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114301 c!98321) b!943807))

(assert (= (and d!114301 (not c!98321)) b!943808))

(assert (= (and d!114301 (not res!634076)) b!943809))

(declare-fun m!877953 () Bool)

(assert (=> d!114301 m!877953))

(declare-fun m!877955 () Bool)

(assert (=> b!943807 m!877955))

(declare-fun m!877957 () Bool)

(assert (=> b!943807 m!877957))

(assert (=> b!943807 m!877957))

(declare-fun m!877959 () Bool)

(assert (=> b!943807 m!877959))

(assert (=> b!943809 m!877957))

(assert (=> b!943809 m!877957))

(assert (=> b!943809 m!877959))

(assert (=> bm!40981 d!114301))

(assert (=> d!114225 d!114251))

(declare-fun d!114303 () Bool)

(declare-fun e!530668 () Bool)

(assert (=> d!114303 e!530668))

(declare-fun res!634078 () Bool)

(assert (=> d!114303 (=> (not res!634078) (not e!530668))))

(declare-fun lt!425452 () ListLongMap!12143)

(assert (=> d!114303 (= res!634078 (contains!5157 lt!425452 (_1!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(declare-fun lt!425451 () List!19256)

(assert (=> d!114303 (= lt!425452 (ListLongMap!12144 lt!425451))))

(declare-fun lt!425453 () Unit!31816)

(declare-fun lt!425450 () Unit!31816)

(assert (=> d!114303 (= lt!425453 lt!425450)))

(assert (=> d!114303 (= (getValueByKey!485 lt!425451 (_1!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(assert (=> d!114303 (= lt!425450 (lemmaContainsTupThenGetReturnValue!261 lt!425451 (_1!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(assert (=> d!114303 (= lt!425451 (insertStrictlySorted!318 (toList!6087 call!40986) (_1!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))) (_2!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(assert (=> d!114303 (= (+!2850 call!40986 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))) lt!425452)))

(declare-fun b!943810 () Bool)

(declare-fun res!634077 () Bool)

(assert (=> b!943810 (=> (not res!634077) (not e!530668))))

(assert (=> b!943810 (= res!634077 (= (getValueByKey!485 (toList!6087 lt!425452) (_1!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))) (Some!490 (_2!6734 (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))))

(declare-fun b!943811 () Bool)

(assert (=> b!943811 (= e!530668 (contains!5159 (toList!6087 lt!425452) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))

(assert (= (and d!114303 res!634078) b!943810))

(assert (= (and b!943810 res!634077) b!943811))

(declare-fun m!877961 () Bool)

(assert (=> d!114303 m!877961))

(declare-fun m!877963 () Bool)

(assert (=> d!114303 m!877963))

(declare-fun m!877965 () Bool)

(assert (=> d!114303 m!877965))

(declare-fun m!877967 () Bool)

(assert (=> d!114303 m!877967))

(declare-fun m!877969 () Bool)

(assert (=> b!943810 m!877969))

(declare-fun m!877971 () Bool)

(assert (=> b!943811 m!877971))

(assert (=> b!943613 d!114303))

(declare-fun b!943820 () Bool)

(declare-fun e!530677 () Bool)

(declare-fun call!40992 () Bool)

(assert (=> b!943820 (= e!530677 call!40992)))

(declare-fun d!114305 () Bool)

(declare-fun res!634083 () Bool)

(declare-fun e!530676 () Bool)

(assert (=> d!114305 (=> res!634083 e!530676)))

(assert (=> d!114305 (= res!634083 (bvsge #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10517 thiss!1141) (mask!27273 thiss!1141)) e!530676)))

(declare-fun b!943821 () Bool)

(declare-fun e!530675 () Bool)

(assert (=> b!943821 (= e!530675 call!40992)))

(declare-fun bm!40989 () Bool)

(assert (=> bm!40989 (= call!40992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10517 thiss!1141) (mask!27273 thiss!1141)))))

(declare-fun b!943822 () Bool)

(assert (=> b!943822 (= e!530675 e!530677)))

(declare-fun lt!425461 () (_ BitVec 64))

(assert (=> b!943822 (= lt!425461 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425462 () Unit!31816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57002 (_ BitVec 64) (_ BitVec 32)) Unit!31816)

(assert (=> b!943822 (= lt!425462 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10517 thiss!1141) lt!425461 #b00000000000000000000000000000000))))

(assert (=> b!943822 (arrayContainsKey!0 (_keys!10517 thiss!1141) lt!425461 #b00000000000000000000000000000000)))

(declare-fun lt!425460 () Unit!31816)

(assert (=> b!943822 (= lt!425460 lt!425462)))

(declare-fun res!634084 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57002 (_ BitVec 32)) SeekEntryResult!9054)

(assert (=> b!943822 (= res!634084 (= (seekEntryOrOpen!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) (_keys!10517 thiss!1141) (mask!27273 thiss!1141)) (Found!9054 #b00000000000000000000000000000000)))))

(assert (=> b!943822 (=> (not res!634084) (not e!530677))))

(declare-fun b!943823 () Bool)

(assert (=> b!943823 (= e!530676 e!530675)))

(declare-fun c!98324 () Bool)

(assert (=> b!943823 (= c!98324 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114305 (not res!634083)) b!943823))

(assert (= (and b!943823 c!98324) b!943822))

(assert (= (and b!943823 (not c!98324)) b!943821))

(assert (= (and b!943822 res!634084) b!943820))

(assert (= (or b!943820 b!943821) bm!40989))

(declare-fun m!877973 () Bool)

(assert (=> bm!40989 m!877973))

(assert (=> b!943822 m!877713))

(declare-fun m!877975 () Bool)

(assert (=> b!943822 m!877975))

(declare-fun m!877977 () Bool)

(assert (=> b!943822 m!877977))

(assert (=> b!943822 m!877713))

(declare-fun m!877979 () Bool)

(assert (=> b!943822 m!877979))

(assert (=> b!943823 m!877713))

(assert (=> b!943823 m!877713))

(assert (=> b!943823 m!877735))

(assert (=> b!943659 d!114305))

(assert (=> b!943612 d!114239))

(declare-fun b!943832 () Bool)

(declare-fun e!530683 () (_ BitVec 32))

(assert (=> b!943832 (= e!530683 #b00000000000000000000000000000000)))

(declare-fun b!943833 () Bool)

(declare-fun e!530682 () (_ BitVec 32))

(declare-fun call!40995 () (_ BitVec 32))

(assert (=> b!943833 (= e!530682 (bvadd #b00000000000000000000000000000001 call!40995))))

(declare-fun b!943834 () Bool)

(assert (=> b!943834 (= e!530682 call!40995)))

(declare-fun bm!40992 () Bool)

(assert (=> bm!40992 (= call!40995 (arrayCountValidKeys!0 (_keys!10517 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27892 (_keys!10517 thiss!1141))))))

(declare-fun b!943835 () Bool)

(assert (=> b!943835 (= e!530683 e!530682)))

(declare-fun c!98330 () Bool)

(assert (=> b!943835 (= c!98330 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114307 () Bool)

(declare-fun lt!425465 () (_ BitVec 32))

(assert (=> d!114307 (and (bvsge lt!425465 #b00000000000000000000000000000000) (bvsle lt!425465 (bvsub (size!27892 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114307 (= lt!425465 e!530683)))

(declare-fun c!98329 () Bool)

(assert (=> d!114307 (= c!98329 (bvsge #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114307 (and (bvsle #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27892 (_keys!10517 thiss!1141)) (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114307 (= (arrayCountValidKeys!0 (_keys!10517 thiss!1141) #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))) lt!425465)))

(assert (= (and d!114307 c!98329) b!943832))

(assert (= (and d!114307 (not c!98329)) b!943835))

(assert (= (and b!943835 c!98330) b!943833))

(assert (= (and b!943835 (not c!98330)) b!943834))

(assert (= (or b!943833 b!943834) bm!40992))

(declare-fun m!877981 () Bool)

(assert (=> bm!40992 m!877981))

(assert (=> b!943835 m!877713))

(assert (=> b!943835 m!877713))

(assert (=> b!943835 m!877735))

(assert (=> b!943658 d!114307))

(declare-fun b!943846 () Bool)

(declare-fun e!530695 () Bool)

(declare-fun e!530692 () Bool)

(assert (=> b!943846 (= e!530695 e!530692)))

(declare-fun res!634092 () Bool)

(assert (=> b!943846 (=> (not res!634092) (not e!530692))))

(declare-fun e!530693 () Bool)

(assert (=> b!943846 (= res!634092 (not e!530693))))

(declare-fun res!634091 () Bool)

(assert (=> b!943846 (=> (not res!634091) (not e!530693))))

(assert (=> b!943846 (= res!634091 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943847 () Bool)

(declare-fun e!530694 () Bool)

(declare-fun call!40998 () Bool)

(assert (=> b!943847 (= e!530694 call!40998)))

(declare-fun b!943848 () Bool)

(assert (=> b!943848 (= e!530692 e!530694)))

(declare-fun c!98333 () Bool)

(assert (=> b!943848 (= c!98333 (validKeyInArray!0 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943849 () Bool)

(declare-fun contains!5160 (List!19258 (_ BitVec 64)) Bool)

(assert (=> b!943849 (= e!530693 (contains!5160 Nil!19255 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943850 () Bool)

(assert (=> b!943850 (= e!530694 call!40998)))

(declare-fun d!114309 () Bool)

(declare-fun res!634093 () Bool)

(assert (=> d!114309 (=> res!634093 e!530695)))

(assert (=> d!114309 (= res!634093 (bvsge #b00000000000000000000000000000000 (size!27892 (_keys!10517 thiss!1141))))))

(assert (=> d!114309 (= (arrayNoDuplicates!0 (_keys!10517 thiss!1141) #b00000000000000000000000000000000 Nil!19255) e!530695)))

(declare-fun bm!40995 () Bool)

(assert (=> bm!40995 (= call!40998 (arrayNoDuplicates!0 (_keys!10517 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98333 (Cons!19254 (select (arr!27427 (_keys!10517 thiss!1141)) #b00000000000000000000000000000000) Nil!19255) Nil!19255)))))

(assert (= (and d!114309 (not res!634093)) b!943846))

(assert (= (and b!943846 res!634091) b!943849))

(assert (= (and b!943846 res!634092) b!943848))

(assert (= (and b!943848 c!98333) b!943847))

(assert (= (and b!943848 (not c!98333)) b!943850))

(assert (= (or b!943847 b!943850) bm!40995))

(assert (=> b!943846 m!877713))

(assert (=> b!943846 m!877713))

(assert (=> b!943846 m!877735))

(assert (=> b!943848 m!877713))

(assert (=> b!943848 m!877713))

(assert (=> b!943848 m!877735))

(assert (=> b!943849 m!877713))

(assert (=> b!943849 m!877713))

(declare-fun m!877983 () Bool)

(assert (=> b!943849 m!877983))

(assert (=> bm!40995 m!877713))

(declare-fun m!877985 () Bool)

(assert (=> bm!40995 m!877985))

(assert (=> b!943660 d!114309))

(declare-fun d!114311 () Bool)

(declare-fun e!530696 () Bool)

(assert (=> d!114311 e!530696))

(declare-fun res!634095 () Bool)

(assert (=> d!114311 (=> (not res!634095) (not e!530696))))

(declare-fun lt!425468 () ListLongMap!12143)

(assert (=> d!114311 (= res!634095 (contains!5157 lt!425468 (_1!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))))

(declare-fun lt!425467 () List!19256)

(assert (=> d!114311 (= lt!425468 (ListLongMap!12144 lt!425467))))

(declare-fun lt!425469 () Unit!31816)

(declare-fun lt!425466 () Unit!31816)

(assert (=> d!114311 (= lt!425469 lt!425466)))

(assert (=> d!114311 (= (getValueByKey!485 lt!425467 (_1!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))) (Some!490 (_2!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))))

(assert (=> d!114311 (= lt!425466 (lemmaContainsTupThenGetReturnValue!261 lt!425467 (_1!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))) (_2!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))))

(assert (=> d!114311 (= lt!425467 (insertStrictlySorted!318 (toList!6087 (ite c!98261 call!40984 (ite c!98263 call!40985 call!40981))) (_1!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))) (_2!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))))))

(assert (=> d!114311 (= (+!2850 (ite c!98261 call!40984 (ite c!98263 call!40985 call!40981)) (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))) lt!425468)))

(declare-fun b!943851 () Bool)

(declare-fun res!634094 () Bool)

(assert (=> b!943851 (=> (not res!634094) (not e!530696))))

(assert (=> b!943851 (= res!634094 (= (getValueByKey!485 (toList!6087 lt!425468) (_1!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141))))) (Some!490 (_2!6734 (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))))

(declare-fun b!943852 () Bool)

(assert (=> b!943852 (= e!530696 (contains!5159 (toList!6087 lt!425468) (ite (or c!98261 c!98263) (tuple2!13447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5479 thiss!1141)) (tuple2!13447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5479 thiss!1141)))))))

(assert (= (and d!114311 res!634095) b!943851))

(assert (= (and b!943851 res!634094) b!943852))

(declare-fun m!877987 () Bool)

(assert (=> d!114311 m!877987))

(declare-fun m!877989 () Bool)

(assert (=> d!114311 m!877989))

(declare-fun m!877991 () Bool)

(assert (=> d!114311 m!877991))

(declare-fun m!877993 () Bool)

(assert (=> d!114311 m!877993))

(declare-fun m!877995 () Bool)

(assert (=> b!943851 m!877995))

(declare-fun m!877997 () Bool)

(assert (=> b!943852 m!877997))

(assert (=> bm!40978 d!114311))

(declare-fun b!943861 () Bool)

(declare-fun res!634107 () Bool)

(declare-fun e!530699 () Bool)

(assert (=> b!943861 (=> (not res!634107) (not e!530699))))

(assert (=> b!943861 (= res!634107 (and (= (size!27891 (_values!5666 thiss!1141)) (bvadd (mask!27273 thiss!1141) #b00000000000000000000000000000001)) (= (size!27892 (_keys!10517 thiss!1141)) (size!27891 (_values!5666 thiss!1141))) (bvsge (_size!2407 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2407 thiss!1141) (bvadd (mask!27273 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114313 () Bool)

(declare-fun res!634105 () Bool)

(assert (=> d!114313 (=> (not res!634105) (not e!530699))))

(assert (=> d!114313 (= res!634105 (validMask!0 (mask!27273 thiss!1141)))))

(assert (=> d!114313 (= (simpleValid!348 thiss!1141) e!530699)))

(declare-fun b!943863 () Bool)

(declare-fun res!634104 () Bool)

(assert (=> b!943863 (=> (not res!634104) (not e!530699))))

(declare-fun size!27895 (LongMapFixedSize!4704) (_ BitVec 32))

(assert (=> b!943863 (= res!634104 (= (size!27895 thiss!1141) (bvadd (_size!2407 thiss!1141) (bvsdiv (bvadd (extraKeys!5375 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!943862 () Bool)

(declare-fun res!634106 () Bool)

(assert (=> b!943862 (=> (not res!634106) (not e!530699))))

(assert (=> b!943862 (= res!634106 (bvsge (size!27895 thiss!1141) (_size!2407 thiss!1141)))))

(declare-fun b!943864 () Bool)

(assert (=> b!943864 (= e!530699 (and (bvsge (extraKeys!5375 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5375 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2407 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114313 res!634105) b!943861))

(assert (= (and b!943861 res!634107) b!943862))

(assert (= (and b!943862 res!634106) b!943863))

(assert (= (and b!943863 res!634104) b!943864))

(assert (=> d!114313 m!877755))

(declare-fun m!877999 () Bool)

(assert (=> b!943863 m!877999))

(assert (=> b!943862 m!877999))

(assert (=> d!114233 d!114313))

(declare-fun d!114315 () Bool)

(declare-fun res!634112 () Bool)

(declare-fun e!530704 () Bool)

(assert (=> d!114315 (=> res!634112 e!530704)))

(assert (=> d!114315 (= res!634112 (and ((_ is Cons!19252) (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) (= (_1!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) key!756)))))

(assert (=> d!114315 (= (containsKey!452 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))) key!756) e!530704)))

(declare-fun b!943869 () Bool)

(declare-fun e!530705 () Bool)

(assert (=> b!943869 (= e!530704 e!530705)))

(declare-fun res!634113 () Bool)

(assert (=> b!943869 (=> (not res!634113) (not e!530705))))

(assert (=> b!943869 (= res!634113 (and (or (not ((_ is Cons!19252) (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) (bvsle (_1!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) key!756)) ((_ is Cons!19252) (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) (bvslt (_1!6734 (h!20402 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141))))) key!756)))))

(declare-fun b!943870 () Bool)

(assert (=> b!943870 (= e!530705 (containsKey!452 (t!27571 (toList!6087 (getCurrentListMap!3321 (_keys!10517 thiss!1141) (_values!5666 thiss!1141) (mask!27273 thiss!1141) (extraKeys!5375 thiss!1141) (zeroValue!5479 thiss!1141) (minValue!5479 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5643 thiss!1141)))) key!756))))

(assert (= (and d!114315 (not res!634112)) b!943869))

(assert (= (and b!943869 res!634113) b!943870))

(declare-fun m!878001 () Bool)

(assert (=> b!943870 m!878001))

(assert (=> d!114223 d!114315))

(declare-fun d!114317 () Bool)

(assert (=> d!114317 (= (apply!866 lt!425329 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14431 (getValueByKey!485 (toList!6087 lt!425329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26530 () Bool)

(assert (= bs!26530 d!114317))

(assert (=> bs!26530 m!877957))

(assert (=> bs!26530 m!877957))

(declare-fun m!878003 () Bool)

(assert (=> bs!26530 m!878003))

(assert (=> b!943610 d!114317))

(declare-fun mapNonEmpty!32604 () Bool)

(declare-fun mapRes!32604 () Bool)

(declare-fun tp!62543 () Bool)

(declare-fun e!530707 () Bool)

(assert (=> mapNonEmpty!32604 (= mapRes!32604 (and tp!62543 e!530707))))

(declare-fun mapValue!32604 () ValueCell!9777)

(declare-fun mapKey!32604 () (_ BitVec 32))

(declare-fun mapRest!32604 () (Array (_ BitVec 32) ValueCell!9777))

(assert (=> mapNonEmpty!32604 (= mapRest!32603 (store mapRest!32604 mapKey!32604 mapValue!32604))))

(declare-fun b!943871 () Bool)

(assert (=> b!943871 (= e!530707 tp_is_empty!20517)))

(declare-fun b!943872 () Bool)

(declare-fun e!530706 () Bool)

(assert (=> b!943872 (= e!530706 tp_is_empty!20517)))

(declare-fun condMapEmpty!32604 () Bool)

(declare-fun mapDefault!32604 () ValueCell!9777)

(assert (=> mapNonEmpty!32603 (= condMapEmpty!32604 (= mapRest!32603 ((as const (Array (_ BitVec 32) ValueCell!9777)) mapDefault!32604)))))

(assert (=> mapNonEmpty!32603 (= tp!62542 (and e!530706 mapRes!32604))))

(declare-fun mapIsEmpty!32604 () Bool)

(assert (=> mapIsEmpty!32604 mapRes!32604))

(assert (= (and mapNonEmpty!32603 condMapEmpty!32604) mapIsEmpty!32604))

(assert (= (and mapNonEmpty!32603 (not condMapEmpty!32604)) mapNonEmpty!32604))

(assert (= (and mapNonEmpty!32604 ((_ is ValueCellFull!9777) mapValue!32604)) b!943871))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9777) mapDefault!32604)) b!943872))

(declare-fun m!878005 () Bool)

(assert (=> mapNonEmpty!32604 m!878005))

(declare-fun b_lambda!14287 () Bool)

(assert (= b_lambda!14283 (or (and b!943521 b_free!18009) b_lambda!14287)))

(declare-fun b_lambda!14289 () Bool)

(assert (= b_lambda!14285 (or (and b!943521 b_free!18009) b_lambda!14289)))

(check-sat (not b!943809) (not b!943777) (not b!943743) (not d!114271) (not b!943732) (not b!943769) (not b!943733) (not bm!40989) (not d!114273) (not b!943848) (not b!943739) (not d!114243) (not d!114275) (not b!943803) (not d!114263) (not b!943749) (not b!943724) (not b!943756) (not bm!40992) (not d!114253) (not b!943760) (not mapNonEmpty!32604) (not b!943758) (not d!114287) (not d!114269) (not b!943770) (not b!943863) (not d!114317) (not d!114299) (not b!943768) b_and!29429 (not d!114293) (not b_next!18009) (not d!114247) (not d!114291) (not b!943774) (not b!943835) (not d!114265) (not d!114295) (not b!943862) (not b!943697) (not b!943730) (not b!943751) (not b!943776) (not bm!40995) (not d!114255) (not d!114283) (not d!114301) (not b!943851) (not d!114313) (not d!114241) (not d!114311) (not b!943852) (not d!114277) (not b!943684) (not b!943849) (not bm!40986) (not b!943772) (not b!943846) (not b!943767) (not b_lambda!14289) (not b!943731) (not d!114261) tp_is_empty!20517 (not d!114279) (not b!943727) (not b!943807) (not b_lambda!14281) (not b_lambda!14287) (not d!114289) (not d!114281) (not b!943757) (not b!943822) (not b!943811) (not b!943779) (not b!943870) (not b!943810) (not b!943823) (not d!114267) (not b!943728) (not b!943726) (not d!114303) (not b!943771) (not d!114285) (not b!943748))
(check-sat b_and!29429 (not b_next!18009))
