; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13120 () Bool)

(assert start!13120)

(declare-fun b!114712 () Bool)

(declare-fun b_free!2641 () Bool)

(declare-fun b_next!2641 () Bool)

(assert (=> b!114712 (= b_free!2641 (not b_next!2641))))

(declare-fun tp!10288 () Bool)

(declare-fun b_and!7081 () Bool)

(assert (=> b!114712 (= tp!10288 b_and!7081)))

(declare-fun b!114709 () Bool)

(declare-fun b_free!2643 () Bool)

(declare-fun b_next!2643 () Bool)

(assert (=> b!114709 (= b_free!2643 (not b_next!2643))))

(declare-fun tp!10287 () Bool)

(declare-fun b_and!7083 () Bool)

(assert (=> b!114709 (= tp!10287 b_and!7083)))

(declare-fun mapIsEmpty!4143 () Bool)

(declare-fun mapRes!4144 () Bool)

(assert (=> mapIsEmpty!4143 mapRes!4144))

(declare-fun e!74653 () Bool)

(declare-datatypes ((V!3297 0))(
  ( (V!3298 (val!1413 Int)) )
))
(declare-datatypes ((array!4463 0))(
  ( (array!4464 (arr!2114 (Array (_ BitVec 32) (_ BitVec 64))) (size!2374 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1025 0))(
  ( (ValueCellFull!1025 (v!2997 V!3297)) (EmptyCell!1025) )
))
(declare-datatypes ((array!4465 0))(
  ( (array!4466 (arr!2115 (Array (_ BitVec 32) ValueCell!1025)) (size!2375 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!958 0))(
  ( (LongMapFixedSize!959 (defaultEntry!2688 Int) (mask!6886 (_ BitVec 32)) (extraKeys!2477 (_ BitVec 32)) (zeroValue!2555 V!3297) (minValue!2555 V!3297) (_size!528 (_ BitVec 32)) (_keys!4410 array!4463) (_values!2671 array!4465) (_vacant!528 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!958)

(declare-fun e!74661 () Bool)

(declare-fun tp_is_empty!2737 () Bool)

(declare-fun array_inv!1315 (array!4463) Bool)

(declare-fun array_inv!1316 (array!4465) Bool)

(assert (=> b!114709 (= e!74653 (and tp!10287 tp_is_empty!2737 (array_inv!1315 (_keys!4410 newMap!16)) (array_inv!1316 (_values!2671 newMap!16)) e!74661))))

(declare-fun b!114710 () Bool)

(declare-fun res!56426 () Bool)

(declare-fun e!74664 () Bool)

(assert (=> b!114710 (=> (not res!56426) (not e!74664))))

(declare-datatypes ((Cell!760 0))(
  ( (Cell!761 (v!2998 LongMapFixedSize!958)) )
))
(declare-datatypes ((LongMap!760 0))(
  ( (LongMap!761 (underlying!391 Cell!760)) )
))
(declare-fun thiss!992 () LongMap!760)

(assert (=> b!114710 (= res!56426 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6886 newMap!16)) (_size!528 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun b!114711 () Bool)

(declare-fun e!74652 () Bool)

(declare-fun e!74659 () Bool)

(assert (=> b!114711 (= e!74652 e!74659)))

(declare-fun e!74666 () Bool)

(assert (=> b!114712 (= e!74659 (and tp!10288 tp_is_empty!2737 (array_inv!1315 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) (array_inv!1316 (_values!2671 (v!2998 (underlying!391 thiss!992)))) e!74666))))

(declare-fun b!114713 () Bool)

(declare-fun res!56425 () Bool)

(assert (=> b!114713 (=> (not res!56425) (not e!74664))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!114713 (= res!56425 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2374 (_keys!4410 (v!2998 (underlying!391 thiss!992)))))))))

(declare-fun b!114714 () Bool)

(declare-fun e!74662 () Bool)

(assert (=> b!114714 (= e!74662 e!74652)))

(declare-fun b!114716 () Bool)

(declare-datatypes ((Unit!3563 0))(
  ( (Unit!3564) )
))
(declare-fun e!74656 () Unit!3563)

(declare-fun Unit!3565 () Unit!3563)

(assert (=> b!114716 (= e!74656 Unit!3565)))

(declare-fun lt!59791 () Unit!3563)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!116 (array!4463 array!4465 (_ BitVec 32) (_ BitVec 32) V!3297 V!3297 (_ BitVec 64) (_ BitVec 32) Int) Unit!3563)

(assert (=> b!114716 (= lt!59791 (lemmaListMapContainsThenArrayContainsFrom!116 (_keys!4410 (v!2998 (underlying!391 thiss!992))) (_values!2671 (v!2998 (underlying!391 thiss!992))) (mask!6886 (v!2998 (underlying!391 thiss!992))) (extraKeys!2477 (v!2998 (underlying!391 thiss!992))) (zeroValue!2555 (v!2998 (underlying!391 thiss!992))) (minValue!2555 (v!2998 (underlying!391 thiss!992))) (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2688 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114716 (arrayContainsKey!0 (_keys!4410 (v!2998 (underlying!391 thiss!992))) (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59790 () Unit!3563)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4463 (_ BitVec 32) (_ BitVec 32)) Unit!3563)

(assert (=> b!114716 (= lt!59790 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4410 (v!2998 (underlying!391 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1637 0))(
  ( (Nil!1634) (Cons!1633 (h!2233 (_ BitVec 64)) (t!5867 List!1637)) )
))
(declare-fun arrayNoDuplicates!0 (array!4463 (_ BitVec 32) List!1637) Bool)

(assert (=> b!114716 (arrayNoDuplicates!0 (_keys!4410 (v!2998 (underlying!391 thiss!992))) from!355 Nil!1634)))

(declare-fun lt!59793 () Unit!3563)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4463 (_ BitVec 32) (_ BitVec 64) List!1637) Unit!3563)

(assert (=> b!114716 (= lt!59793 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4410 (v!2998 (underlying!391 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) (Cons!1633 (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) Nil!1634)))))

(assert (=> b!114716 false))

(declare-fun b!114717 () Bool)

(declare-fun e!74654 () Bool)

(declare-fun mapRes!4143 () Bool)

(assert (=> b!114717 (= e!74661 (and e!74654 mapRes!4143))))

(declare-fun condMapEmpty!4143 () Bool)

(declare-fun mapDefault!4144 () ValueCell!1025)

(assert (=> b!114717 (= condMapEmpty!4143 (= (arr!2115 (_values!2671 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1025)) mapDefault!4144)))))

(declare-fun b!114718 () Bool)

(declare-fun e!74665 () Bool)

(assert (=> b!114718 (= e!74665 false)))

(declare-fun lt!59794 () Unit!3563)

(assert (=> b!114718 (= lt!59794 e!74656)))

(declare-datatypes ((tuple2!2444 0))(
  ( (tuple2!2445 (_1!1233 (_ BitVec 64)) (_2!1233 V!3297)) )
))
(declare-datatypes ((List!1638 0))(
  ( (Nil!1635) (Cons!1634 (h!2234 tuple2!2444) (t!5868 List!1638)) )
))
(declare-datatypes ((ListLongMap!1579 0))(
  ( (ListLongMap!1580 (toList!805 List!1638)) )
))
(declare-fun lt!59795 () ListLongMap!1579)

(declare-fun c!20490 () Bool)

(declare-fun contains!844 (ListLongMap!1579 (_ BitVec 64)) Bool)

(assert (=> b!114718 (= c!20490 (contains!844 lt!59795 (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2446 0))(
  ( (tuple2!2447 (_1!1234 Bool) (_2!1234 LongMapFixedSize!958)) )
))
(declare-fun lt!59792 () tuple2!2446)

(declare-fun update!177 (LongMapFixedSize!958 (_ BitVec 64) V!3297) tuple2!2446)

(declare-fun get!1392 (ValueCell!1025 V!3297) V!3297)

(declare-fun dynLambda!404 (Int (_ BitVec 64)) V!3297)

(assert (=> b!114718 (= lt!59792 (update!177 newMap!16 (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) (get!1392 (select (arr!2115 (_values!2671 (v!2998 (underlying!391 thiss!992)))) from!355) (dynLambda!404 (defaultEntry!2688 (v!2998 (underlying!391 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4143 () Bool)

(declare-fun tp!10286 () Bool)

(declare-fun e!74655 () Bool)

(assert (=> mapNonEmpty!4143 (= mapRes!4143 (and tp!10286 e!74655))))

(declare-fun mapRest!4143 () (Array (_ BitVec 32) ValueCell!1025))

(declare-fun mapKey!4144 () (_ BitVec 32))

(declare-fun mapValue!4144 () ValueCell!1025)

(assert (=> mapNonEmpty!4143 (= (arr!2115 (_values!2671 newMap!16)) (store mapRest!4143 mapKey!4144 mapValue!4144))))

(declare-fun mapIsEmpty!4144 () Bool)

(assert (=> mapIsEmpty!4144 mapRes!4143))

(declare-fun b!114719 () Bool)

(assert (=> b!114719 (= e!74664 e!74665)))

(declare-fun res!56428 () Bool)

(assert (=> b!114719 (=> (not res!56428) (not e!74665))))

(declare-fun lt!59796 () ListLongMap!1579)

(assert (=> b!114719 (= res!56428 (and (= lt!59796 lt!59795) (not (= (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2114 (_keys!4410 (v!2998 (underlying!391 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1321 (LongMapFixedSize!958) ListLongMap!1579)

(assert (=> b!114719 (= lt!59795 (map!1321 newMap!16))))

(declare-fun getCurrentListMap!487 (array!4463 array!4465 (_ BitVec 32) (_ BitVec 32) V!3297 V!3297 (_ BitVec 32) Int) ListLongMap!1579)

(assert (=> b!114719 (= lt!59796 (getCurrentListMap!487 (_keys!4410 (v!2998 (underlying!391 thiss!992))) (_values!2671 (v!2998 (underlying!391 thiss!992))) (mask!6886 (v!2998 (underlying!391 thiss!992))) (extraKeys!2477 (v!2998 (underlying!391 thiss!992))) (zeroValue!2555 (v!2998 (underlying!391 thiss!992))) (minValue!2555 (v!2998 (underlying!391 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2688 (v!2998 (underlying!391 thiss!992)))))))

(declare-fun b!114720 () Bool)

(declare-fun e!74660 () Bool)

(assert (=> b!114720 (= e!74660 tp_is_empty!2737)))

(declare-fun res!56429 () Bool)

(assert (=> start!13120 (=> (not res!56429) (not e!74664))))

(declare-fun valid!455 (LongMap!760) Bool)

(assert (=> start!13120 (= res!56429 (valid!455 thiss!992))))

(assert (=> start!13120 e!74664))

(assert (=> start!13120 e!74662))

(assert (=> start!13120 true))

(assert (=> start!13120 e!74653))

(declare-fun b!114715 () Bool)

(declare-fun Unit!3566 () Unit!3563)

(assert (=> b!114715 (= e!74656 Unit!3566)))

(declare-fun b!114721 () Bool)

(assert (=> b!114721 (= e!74654 tp_is_empty!2737)))

(declare-fun mapNonEmpty!4144 () Bool)

(declare-fun tp!10285 () Bool)

(assert (=> mapNonEmpty!4144 (= mapRes!4144 (and tp!10285 e!74660))))

(declare-fun mapValue!4143 () ValueCell!1025)

(declare-fun mapRest!4144 () (Array (_ BitVec 32) ValueCell!1025))

(declare-fun mapKey!4143 () (_ BitVec 32))

(assert (=> mapNonEmpty!4144 (= (arr!2115 (_values!2671 (v!2998 (underlying!391 thiss!992)))) (store mapRest!4144 mapKey!4143 mapValue!4143))))

(declare-fun b!114722 () Bool)

(declare-fun e!74657 () Bool)

(assert (=> b!114722 (= e!74657 tp_is_empty!2737)))

(declare-fun b!114723 () Bool)

(assert (=> b!114723 (= e!74666 (and e!74657 mapRes!4144))))

(declare-fun condMapEmpty!4144 () Bool)

(declare-fun mapDefault!4143 () ValueCell!1025)

(assert (=> b!114723 (= condMapEmpty!4144 (= (arr!2115 (_values!2671 (v!2998 (underlying!391 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1025)) mapDefault!4143)))))

(declare-fun b!114724 () Bool)

(declare-fun res!56427 () Bool)

(assert (=> b!114724 (=> (not res!56427) (not e!74664))))

(declare-fun valid!456 (LongMapFixedSize!958) Bool)

(assert (=> b!114724 (= res!56427 (valid!456 newMap!16))))

(declare-fun b!114725 () Bool)

(assert (=> b!114725 (= e!74655 tp_is_empty!2737)))

(assert (= (and start!13120 res!56429) b!114713))

(assert (= (and b!114713 res!56425) b!114724))

(assert (= (and b!114724 res!56427) b!114710))

(assert (= (and b!114710 res!56426) b!114719))

(assert (= (and b!114719 res!56428) b!114718))

(assert (= (and b!114718 c!20490) b!114716))

(assert (= (and b!114718 (not c!20490)) b!114715))

(assert (= (and b!114723 condMapEmpty!4144) mapIsEmpty!4143))

(assert (= (and b!114723 (not condMapEmpty!4144)) mapNonEmpty!4144))

(get-info :version)

(assert (= (and mapNonEmpty!4144 ((_ is ValueCellFull!1025) mapValue!4143)) b!114720))

(assert (= (and b!114723 ((_ is ValueCellFull!1025) mapDefault!4143)) b!114722))

(assert (= b!114712 b!114723))

(assert (= b!114711 b!114712))

(assert (= b!114714 b!114711))

(assert (= start!13120 b!114714))

(assert (= (and b!114717 condMapEmpty!4143) mapIsEmpty!4144))

(assert (= (and b!114717 (not condMapEmpty!4143)) mapNonEmpty!4143))

(assert (= (and mapNonEmpty!4143 ((_ is ValueCellFull!1025) mapValue!4144)) b!114725))

(assert (= (and b!114717 ((_ is ValueCellFull!1025) mapDefault!4144)) b!114721))

(assert (= b!114709 b!114717))

(assert (= start!13120 b!114709))

(declare-fun b_lambda!5129 () Bool)

(assert (=> (not b_lambda!5129) (not b!114718)))

(declare-fun t!5864 () Bool)

(declare-fun tb!2193 () Bool)

(assert (=> (and b!114712 (= (defaultEntry!2688 (v!2998 (underlying!391 thiss!992))) (defaultEntry!2688 (v!2998 (underlying!391 thiss!992)))) t!5864) tb!2193))

(declare-fun result!3663 () Bool)

(assert (=> tb!2193 (= result!3663 tp_is_empty!2737)))

(assert (=> b!114718 t!5864))

(declare-fun b_and!7085 () Bool)

(assert (= b_and!7081 (and (=> t!5864 result!3663) b_and!7085)))

(declare-fun t!5866 () Bool)

(declare-fun tb!2195 () Bool)

(assert (=> (and b!114709 (= (defaultEntry!2688 newMap!16) (defaultEntry!2688 (v!2998 (underlying!391 thiss!992)))) t!5866) tb!2195))

(declare-fun result!3667 () Bool)

(assert (= result!3667 result!3663))

(assert (=> b!114718 t!5866))

(declare-fun b_and!7087 () Bool)

(assert (= b_and!7083 (and (=> t!5866 result!3667) b_and!7087)))

(declare-fun m!130971 () Bool)

(assert (=> b!114712 m!130971))

(declare-fun m!130973 () Bool)

(assert (=> b!114712 m!130973))

(declare-fun m!130975 () Bool)

(assert (=> mapNonEmpty!4143 m!130975))

(declare-fun m!130977 () Bool)

(assert (=> start!13120 m!130977))

(declare-fun m!130979 () Bool)

(assert (=> b!114709 m!130979))

(declare-fun m!130981 () Bool)

(assert (=> b!114709 m!130981))

(declare-fun m!130983 () Bool)

(assert (=> mapNonEmpty!4144 m!130983))

(declare-fun m!130985 () Bool)

(assert (=> b!114716 m!130985))

(declare-fun m!130987 () Bool)

(assert (=> b!114716 m!130987))

(declare-fun m!130989 () Bool)

(assert (=> b!114716 m!130989))

(declare-fun m!130991 () Bool)

(assert (=> b!114716 m!130991))

(assert (=> b!114716 m!130989))

(assert (=> b!114716 m!130989))

(declare-fun m!130993 () Bool)

(assert (=> b!114716 m!130993))

(assert (=> b!114716 m!130989))

(declare-fun m!130995 () Bool)

(assert (=> b!114716 m!130995))

(assert (=> b!114719 m!130989))

(declare-fun m!130997 () Bool)

(assert (=> b!114719 m!130997))

(declare-fun m!130999 () Bool)

(assert (=> b!114719 m!130999))

(declare-fun m!131001 () Bool)

(assert (=> b!114724 m!131001))

(declare-fun m!131003 () Bool)

(assert (=> b!114718 m!131003))

(declare-fun m!131005 () Bool)

(assert (=> b!114718 m!131005))

(declare-fun m!131007 () Bool)

(assert (=> b!114718 m!131007))

(assert (=> b!114718 m!130989))

(assert (=> b!114718 m!131005))

(assert (=> b!114718 m!130989))

(declare-fun m!131009 () Bool)

(assert (=> b!114718 m!131009))

(assert (=> b!114718 m!130989))

(assert (=> b!114718 m!131007))

(declare-fun m!131011 () Bool)

(assert (=> b!114718 m!131011))

(assert (=> b!114718 m!131003))

(check-sat b_and!7085 (not b!114712) (not start!13120) (not b_next!2641) (not mapNonEmpty!4143) (not mapNonEmpty!4144) (not b!114716) (not b!114718) b_and!7087 (not b_lambda!5129) (not b!114709) tp_is_empty!2737 (not b!114719) (not b!114724) (not b_next!2643))
(check-sat b_and!7085 b_and!7087 (not b_next!2641) (not b_next!2643))
