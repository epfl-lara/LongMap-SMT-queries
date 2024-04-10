; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11104 () Bool)

(assert start!11104)

(declare-fun b!90646 () Bool)

(declare-fun b_free!2301 () Bool)

(declare-fun b_next!2301 () Bool)

(assert (=> b!90646 (= b_free!2301 (not b_next!2301))))

(declare-fun tp!9154 () Bool)

(declare-fun b_and!5467 () Bool)

(assert (=> b!90646 (= tp!9154 b_and!5467)))

(declare-fun b!90654 () Bool)

(declare-fun b_free!2303 () Bool)

(declare-fun b_next!2303 () Bool)

(assert (=> b!90654 (= b_free!2303 (not b_next!2303))))

(declare-fun tp!9153 () Bool)

(declare-fun b_and!5469 () Bool)

(assert (=> b!90654 (= tp!9153 b_and!5469)))

(declare-datatypes ((V!3069 0))(
  ( (V!3070 (val!1328 Int)) )
))
(declare-datatypes ((array!4101 0))(
  ( (array!4102 (arr!1951 (Array (_ BitVec 32) (_ BitVec 64))) (size!2198 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!940 0))(
  ( (ValueCellFull!940 (v!2702 V!3069)) (EmptyCell!940) )
))
(declare-datatypes ((array!4103 0))(
  ( (array!4104 (arr!1952 (Array (_ BitVec 32) ValueCell!940)) (size!2199 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!788 0))(
  ( (LongMapFixedSize!789 (defaultEntry!2395 Int) (mask!6449 (_ BitVec 32)) (extraKeys!2226 (_ BitVec 32)) (zeroValue!2283 V!3069) (minValue!2283 V!3069) (_size!443 (_ BitVec 32)) (_keys!4075 array!4101) (_values!2378 array!4103) (_vacant!443 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!588 0))(
  ( (Cell!589 (v!2703 LongMapFixedSize!788)) )
))
(declare-datatypes ((LongMap!588 0))(
  ( (LongMap!589 (underlying!305 Cell!588)) )
))
(declare-fun thiss!992 () LongMap!588)

(declare-fun tp_is_empty!2567 () Bool)

(declare-fun e!59071 () Bool)

(declare-fun e!59056 () Bool)

(declare-fun array_inv!1207 (array!4101) Bool)

(declare-fun array_inv!1208 (array!4103) Bool)

(assert (=> b!90646 (= e!59056 (and tp!9154 tp_is_empty!2567 (array_inv!1207 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) (array_inv!1208 (_values!2378 (v!2703 (underlying!305 thiss!992)))) e!59071))))

(declare-fun mapNonEmpty!3519 () Bool)

(declare-fun mapRes!3519 () Bool)

(declare-fun tp!9151 () Bool)

(declare-fun e!59069 () Bool)

(assert (=> mapNonEmpty!3519 (= mapRes!3519 (and tp!9151 e!59069))))

(declare-fun mapRest!3520 () (Array (_ BitVec 32) ValueCell!940))

(declare-fun mapValue!3520 () ValueCell!940)

(declare-fun mapKey!3520 () (_ BitVec 32))

(assert (=> mapNonEmpty!3519 (= (arr!1952 (_values!2378 (v!2703 (underlying!305 thiss!992)))) (store mapRest!3520 mapKey!3520 mapValue!3520))))

(declare-fun b!90647 () Bool)

(declare-fun e!59061 () Bool)

(declare-fun e!59059 () Bool)

(assert (=> b!90647 (= e!59061 e!59059)))

(declare-fun res!46238 () Bool)

(assert (=> b!90647 (=> (not res!46238) (not e!59059))))

(declare-datatypes ((tuple2!2234 0))(
  ( (tuple2!2235 (_1!1128 (_ BitVec 64)) (_2!1128 V!3069)) )
))
(declare-datatypes ((List!1539 0))(
  ( (Nil!1536) (Cons!1535 (h!2127 tuple2!2234) (t!5341 List!1539)) )
))
(declare-datatypes ((ListLongMap!1483 0))(
  ( (ListLongMap!1484 (toList!757 List!1539)) )
))
(declare-fun lt!43967 () ListLongMap!1483)

(declare-fun lt!43969 () ListLongMap!1483)

(assert (=> b!90647 (= res!46238 (= lt!43967 lt!43969))))

(declare-fun newMap!16 () LongMapFixedSize!788)

(declare-fun map!1208 (LongMapFixedSize!788) ListLongMap!1483)

(assert (=> b!90647 (= lt!43969 (map!1208 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!449 (array!4101 array!4103 (_ BitVec 32) (_ BitVec 32) V!3069 V!3069 (_ BitVec 32) Int) ListLongMap!1483)

(assert (=> b!90647 (= lt!43967 (getCurrentListMap!449 (_keys!4075 (v!2703 (underlying!305 thiss!992))) (_values!2378 (v!2703 (underlying!305 thiss!992))) (mask!6449 (v!2703 (underlying!305 thiss!992))) (extraKeys!2226 (v!2703 (underlying!305 thiss!992))) (zeroValue!2283 (v!2703 (underlying!305 thiss!992))) (minValue!2283 (v!2703 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2395 (v!2703 (underlying!305 thiss!992)))))))

(declare-fun b!90648 () Bool)

(declare-fun res!46237 () Bool)

(assert (=> b!90648 (=> (not res!46237) (not e!59061))))

(assert (=> b!90648 (= res!46237 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2198 (_keys!4075 (v!2703 (underlying!305 thiss!992)))))))))

(declare-fun b!90650 () Bool)

(declare-fun e!59066 () Bool)

(assert (=> b!90650 (= e!59066 (not true))))

(declare-fun lt!43958 () ListLongMap!1483)

(declare-datatypes ((tuple2!2236 0))(
  ( (tuple2!2237 (_1!1129 Bool) (_2!1129 LongMapFixedSize!788)) )
))
(declare-fun lt!43954 () tuple2!2236)

(assert (=> b!90650 (= lt!43958 (map!1208 (_2!1129 lt!43954)))))

(declare-fun lt!43952 () ListLongMap!1483)

(assert (=> b!90650 (= lt!43952 (getCurrentListMap!449 (_keys!4075 (v!2703 (underlying!305 thiss!992))) (_values!2378 (v!2703 (underlying!305 thiss!992))) (mask!6449 (v!2703 (underlying!305 thiss!992))) (extraKeys!2226 (v!2703 (underlying!305 thiss!992))) (zeroValue!2283 (v!2703 (underlying!305 thiss!992))) (minValue!2283 (v!2703 (underlying!305 thiss!992))) from!355 (defaultEntry!2395 (v!2703 (underlying!305 thiss!992)))))))

(declare-fun lt!43966 () tuple2!2234)

(declare-fun lt!43959 () ListLongMap!1483)

(declare-fun lt!43965 () ListLongMap!1483)

(declare-fun lt!43960 () tuple2!2234)

(declare-fun +!119 (ListLongMap!1483 tuple2!2234) ListLongMap!1483)

(assert (=> b!90650 (= (+!119 lt!43959 lt!43966) (+!119 (+!119 lt!43965 lt!43966) lt!43960))))

(assert (=> b!90650 (= lt!43966 (tuple2!2235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2283 (v!2703 (underlying!305 thiss!992)))))))

(declare-datatypes ((Unit!2691 0))(
  ( (Unit!2692) )
))
(declare-fun lt!43962 () Unit!2691)

(declare-fun lt!43968 () V!3069)

(declare-fun addCommutativeForDiffKeys!38 (ListLongMap!1483 (_ BitVec 64) V!3069 (_ BitVec 64) V!3069) Unit!2691)

(assert (=> b!90650 (= lt!43962 (addCommutativeForDiffKeys!38 lt!43965 (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) lt!43968 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2283 (v!2703 (underlying!305 thiss!992)))))))

(declare-fun lt!43955 () ListLongMap!1483)

(assert (=> b!90650 (= lt!43955 lt!43959)))

(assert (=> b!90650 (= lt!43959 (+!119 lt!43965 lt!43960))))

(declare-fun lt!43963 () ListLongMap!1483)

(declare-fun lt!43957 () tuple2!2234)

(assert (=> b!90650 (= lt!43955 (+!119 lt!43963 lt!43957))))

(declare-fun lt!43956 () ListLongMap!1483)

(assert (=> b!90650 (= lt!43965 (+!119 lt!43956 lt!43957))))

(assert (=> b!90650 (= lt!43957 (tuple2!2235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2283 (v!2703 (underlying!305 thiss!992)))))))

(assert (=> b!90650 (= lt!43963 (+!119 lt!43956 lt!43960))))

(assert (=> b!90650 (= lt!43960 (tuple2!2235 (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) lt!43968))))

(declare-fun lt!43964 () Unit!2691)

(assert (=> b!90650 (= lt!43964 (addCommutativeForDiffKeys!38 lt!43956 (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) lt!43968 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2283 (v!2703 (underlying!305 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!84 (array!4101 array!4103 (_ BitVec 32) (_ BitVec 32) V!3069 V!3069 (_ BitVec 32) Int) ListLongMap!1483)

(assert (=> b!90650 (= lt!43956 (getCurrentListMapNoExtraKeys!84 (_keys!4075 (v!2703 (underlying!305 thiss!992))) (_values!2378 (v!2703 (underlying!305 thiss!992))) (mask!6449 (v!2703 (underlying!305 thiss!992))) (extraKeys!2226 (v!2703 (underlying!305 thiss!992))) (zeroValue!2283 (v!2703 (underlying!305 thiss!992))) (minValue!2283 (v!2703 (underlying!305 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2395 (v!2703 (underlying!305 thiss!992)))))))

(declare-fun mapIsEmpty!3519 () Bool)

(assert (=> mapIsEmpty!3519 mapRes!3519))

(declare-fun b!90651 () Bool)

(declare-fun e!59065 () Bool)

(assert (=> b!90651 (= e!59065 tp_is_empty!2567)))

(declare-fun b!90652 () Bool)

(declare-fun e!59057 () Bool)

(assert (=> b!90652 (= e!59057 e!59066)))

(declare-fun res!46233 () Bool)

(assert (=> b!90652 (=> (not res!46233) (not e!59066))))

(assert (=> b!90652 (= res!46233 (and (_1!1129 lt!43954) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43970 () Unit!2691)

(declare-fun e!59068 () Unit!2691)

(assert (=> b!90652 (= lt!43970 e!59068)))

(declare-fun c!15071 () Bool)

(declare-fun contains!769 (ListLongMap!1483 (_ BitVec 64)) Bool)

(assert (=> b!90652 (= c!15071 (contains!769 lt!43969 (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355)))))

(declare-fun update!120 (LongMapFixedSize!788 (_ BitVec 64) V!3069) tuple2!2236)

(assert (=> b!90652 (= lt!43954 (update!120 newMap!16 (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) lt!43968))))

(declare-fun b!90653 () Bool)

(declare-fun Unit!2693 () Unit!2691)

(assert (=> b!90653 (= e!59068 Unit!2693)))

(declare-fun e!59067 () Bool)

(declare-fun e!59063 () Bool)

(assert (=> b!90654 (= e!59067 (and tp!9153 tp_is_empty!2567 (array_inv!1207 (_keys!4075 newMap!16)) (array_inv!1208 (_values!2378 newMap!16)) e!59063))))

(declare-fun b!90655 () Bool)

(declare-fun e!59062 () Bool)

(assert (=> b!90655 (= e!59062 tp_is_empty!2567)))

(declare-fun b!90656 () Bool)

(assert (=> b!90656 (= e!59059 e!59057)))

(declare-fun res!46236 () Bool)

(assert (=> b!90656 (=> (not res!46236) (not e!59057))))

(assert (=> b!90656 (= res!46236 (and (not (= (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1951 (_keys!4075 (v!2703 (underlying!305 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1224 (ValueCell!940 V!3069) V!3069)

(declare-fun dynLambda!349 (Int (_ BitVec 64)) V!3069)

(assert (=> b!90656 (= lt!43968 (get!1224 (select (arr!1952 (_values!2378 (v!2703 (underlying!305 thiss!992)))) from!355) (dynLambda!349 (defaultEntry!2395 (v!2703 (underlying!305 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3520 () Bool)

(declare-fun mapRes!3520 () Bool)

(assert (=> mapIsEmpty!3520 mapRes!3520))

(declare-fun res!46239 () Bool)

(assert (=> start!11104 (=> (not res!46239) (not e!59061))))

(declare-fun valid!342 (LongMap!588) Bool)

(assert (=> start!11104 (= res!46239 (valid!342 thiss!992))))

(assert (=> start!11104 e!59061))

(declare-fun e!59064 () Bool)

(assert (=> start!11104 e!59064))

(assert (=> start!11104 true))

(assert (=> start!11104 e!59067))

(declare-fun b!90649 () Bool)

(assert (=> b!90649 (= e!59069 tp_is_empty!2567)))

(declare-fun b!90657 () Bool)

(declare-fun e!59058 () Bool)

(assert (=> b!90657 (= e!59064 e!59058)))

(declare-fun b!90658 () Bool)

(declare-fun e!59072 () Bool)

(assert (=> b!90658 (= e!59063 (and e!59072 mapRes!3520))))

(declare-fun condMapEmpty!3519 () Bool)

(declare-fun mapDefault!3519 () ValueCell!940)

