; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15452 () Bool)

(assert start!15452)

(declare-fun b!153275 () Bool)

(declare-fun b_free!3181 () Bool)

(declare-fun b_next!3181 () Bool)

(assert (=> b!153275 (= b_free!3181 (not b_next!3181))))

(declare-fun tp!12062 () Bool)

(declare-fun b_and!9505 () Bool)

(assert (=> b!153275 (= tp!12062 b_and!9505)))

(declare-fun b!153276 () Bool)

(declare-fun b_free!3183 () Bool)

(declare-fun b_next!3183 () Bool)

(assert (=> b!153276 (= b_free!3183 (not b_next!3183))))

(declare-fun tp!12059 () Bool)

(declare-fun b_and!9507 () Bool)

(assert (=> b!153276 (= tp!12059 b_and!9507)))

(declare-fun mapNonEmpty!5107 () Bool)

(declare-fun mapRes!5108 () Bool)

(declare-fun tp!12060 () Bool)

(declare-fun e!100040 () Bool)

(assert (=> mapNonEmpty!5107 (= mapRes!5108 (and tp!12060 e!100040))))

(declare-datatypes ((V!3657 0))(
  ( (V!3658 (val!1548 Int)) )
))
(declare-datatypes ((array!5043 0))(
  ( (array!5044 (arr!2380 (Array (_ BitVec 32) (_ BitVec 64))) (size!2658 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1160 0))(
  ( (ValueCellFull!1160 (v!3392 V!3657)) (EmptyCell!1160) )
))
(declare-datatypes ((array!5045 0))(
  ( (array!5046 (arr!2381 (Array (_ BitVec 32) ValueCell!1160)) (size!2659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1228 0))(
  ( (LongMapFixedSize!1229 (defaultEntry!3053 Int) (mask!7450 (_ BitVec 32)) (extraKeys!2794 (_ BitVec 32)) (zeroValue!2896 V!3657) (minValue!2896 V!3657) (_size!663 (_ BitVec 32)) (_keys!4825 array!5043) (_values!3036 array!5045) (_vacant!663 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1002 0))(
  ( (Cell!1003 (v!3393 LongMapFixedSize!1228)) )
))
(declare-datatypes ((LongMap!1002 0))(
  ( (LongMap!1003 (underlying!512 Cell!1002)) )
))
(declare-fun thiss!992 () LongMap!1002)

(declare-fun mapValue!5107 () ValueCell!1160)

(declare-fun mapKey!5107 () (_ BitVec 32))

(declare-fun mapRest!5107 () (Array (_ BitVec 32) ValueCell!1160))

(assert (=> mapNonEmpty!5107 (= (arr!2381 (_values!3036 (v!3393 (underlying!512 thiss!992)))) (store mapRest!5107 mapKey!5107 mapValue!5107))))

(declare-fun b!153261 () Bool)

(declare-fun e!100039 () Bool)

(declare-fun tp_is_empty!3007 () Bool)

(assert (=> b!153261 (= e!100039 tp_is_empty!3007)))

(declare-fun b!153262 () Bool)

(declare-fun e!100047 () Bool)

(assert (=> b!153262 (= e!100047 tp_is_empty!3007)))

(declare-fun b!153263 () Bool)

(declare-fun e!100043 () Bool)

(declare-fun e!100046 () Bool)

(assert (=> b!153263 (= e!100043 e!100046)))

(declare-fun b!153264 () Bool)

(declare-fun res!72436 () Bool)

(declare-fun e!100044 () Bool)

(assert (=> b!153264 (=> (not res!72436) (not e!100044))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153264 (= res!72436 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2658 (_keys!4825 (v!3393 (underlying!512 thiss!992)))))))))

(declare-fun mapIsEmpty!5107 () Bool)

(declare-fun mapRes!5107 () Bool)

(assert (=> mapIsEmpty!5107 mapRes!5107))

(declare-fun b!153265 () Bool)

(declare-fun res!72432 () Bool)

(assert (=> b!153265 (=> (not res!72432) (not e!100044))))

(declare-fun newMap!16 () LongMapFixedSize!1228)

(declare-fun valid!608 (LongMapFixedSize!1228) Bool)

(assert (=> b!153265 (= res!72432 (valid!608 newMap!16))))

(declare-fun res!72434 () Bool)

(assert (=> start!15452 (=> (not res!72434) (not e!100044))))

(declare-fun valid!609 (LongMap!1002) Bool)

(assert (=> start!15452 (= res!72434 (valid!609 thiss!992))))

(assert (=> start!15452 e!100044))

(declare-fun e!100042 () Bool)

(assert (=> start!15452 e!100042))

(assert (=> start!15452 true))

(declare-fun e!100048 () Bool)

(assert (=> start!15452 e!100048))

(declare-fun b!153266 () Bool)

(declare-datatypes ((Unit!4874 0))(
  ( (Unit!4875) )
))
(declare-fun e!100049 () Unit!4874)

(declare-fun Unit!4876 () Unit!4874)

(assert (=> b!153266 (= e!100049 Unit!4876)))

(declare-fun mapNonEmpty!5108 () Bool)

(declare-fun tp!12061 () Bool)

(declare-fun e!100053 () Bool)

(assert (=> mapNonEmpty!5108 (= mapRes!5107 (and tp!12061 e!100053))))

(declare-fun mapValue!5108 () ValueCell!1160)

(declare-fun mapKey!5108 () (_ BitVec 32))

(declare-fun mapRest!5108 () (Array (_ BitVec 32) ValueCell!1160))

(assert (=> mapNonEmpty!5108 (= (arr!2381 (_values!3036 newMap!16)) (store mapRest!5108 mapKey!5108 mapValue!5108))))

(declare-fun b!153267 () Bool)

(assert (=> b!153267 (= e!100040 tp_is_empty!3007)))

(declare-fun b!153268 () Bool)

(declare-fun res!72435 () Bool)

(assert (=> b!153268 (=> (not res!72435) (not e!100044))))

(assert (=> b!153268 (= res!72435 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7450 newMap!16)) (_size!663 (v!3393 (underlying!512 thiss!992)))))))

(declare-fun b!153269 () Bool)

(declare-fun e!100045 () Bool)

(assert (=> b!153269 (= e!100044 e!100045)))

(declare-fun res!72433 () Bool)

(assert (=> b!153269 (=> (not res!72433) (not e!100045))))

(declare-datatypes ((tuple2!2776 0))(
  ( (tuple2!2777 (_1!1399 (_ BitVec 64)) (_2!1399 V!3657)) )
))
(declare-datatypes ((List!1797 0))(
  ( (Nil!1794) (Cons!1793 (h!2402 tuple2!2776) (t!6570 List!1797)) )
))
(declare-datatypes ((ListLongMap!1773 0))(
  ( (ListLongMap!1774 (toList!902 List!1797)) )
))
(declare-fun lt!80441 () ListLongMap!1773)

(declare-fun lt!80440 () ListLongMap!1773)

(assert (=> b!153269 (= res!72433 (and (= lt!80440 lt!80441) (not (= (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1473 (LongMapFixedSize!1228) ListLongMap!1773)

(assert (=> b!153269 (= lt!80441 (map!1473 newMap!16))))

(declare-fun getCurrentListMap!555 (array!5043 array!5045 (_ BitVec 32) (_ BitVec 32) V!3657 V!3657 (_ BitVec 32) Int) ListLongMap!1773)

(assert (=> b!153269 (= lt!80440 (getCurrentListMap!555 (_keys!4825 (v!3393 (underlying!512 thiss!992))) (_values!3036 (v!3393 (underlying!512 thiss!992))) (mask!7450 (v!3393 (underlying!512 thiss!992))) (extraKeys!2794 (v!3393 (underlying!512 thiss!992))) (zeroValue!2896 (v!3393 (underlying!512 thiss!992))) (minValue!2896 (v!3393 (underlying!512 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3053 (v!3393 (underlying!512 thiss!992)))))))

(declare-fun b!153270 () Bool)

(assert (=> b!153270 (= e!100042 e!100043)))

(declare-fun mapIsEmpty!5108 () Bool)

(assert (=> mapIsEmpty!5108 mapRes!5108))

(declare-fun b!153271 () Bool)

(assert (=> b!153271 (= e!100045 false)))

(declare-fun lt!80442 () Unit!4874)

(assert (=> b!153271 (= lt!80442 e!100049)))

(declare-fun c!29428 () Bool)

(declare-fun contains!950 (ListLongMap!1773 (_ BitVec 64)) Bool)

(assert (=> b!153271 (= c!29428 (contains!950 lt!80441 (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2778 0))(
  ( (tuple2!2779 (_1!1400 Bool) (_2!1400 LongMapFixedSize!1228)) )
))
(declare-fun lt!80438 () tuple2!2778)

(declare-fun update!233 (LongMapFixedSize!1228 (_ BitVec 64) V!3657) tuple2!2778)

(declare-fun get!1593 (ValueCell!1160 V!3657) V!3657)

(declare-fun dynLambda!459 (Int (_ BitVec 64)) V!3657)

(assert (=> b!153271 (= lt!80438 (update!233 newMap!16 (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) (get!1593 (select (arr!2381 (_values!3036 (v!3393 (underlying!512 thiss!992)))) from!355) (dynLambda!459 (defaultEntry!3053 (v!3393 (underlying!512 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!153272 () Bool)

(declare-fun Unit!4877 () Unit!4874)

(assert (=> b!153272 (= e!100049 Unit!4877)))

(declare-fun lt!80443 () Unit!4874)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!169 (array!5043 array!5045 (_ BitVec 32) (_ BitVec 32) V!3657 V!3657 (_ BitVec 64) (_ BitVec 32) Int) Unit!4874)

(assert (=> b!153272 (= lt!80443 (lemmaListMapContainsThenArrayContainsFrom!169 (_keys!4825 (v!3393 (underlying!512 thiss!992))) (_values!3036 (v!3393 (underlying!512 thiss!992))) (mask!7450 (v!3393 (underlying!512 thiss!992))) (extraKeys!2794 (v!3393 (underlying!512 thiss!992))) (zeroValue!2896 (v!3393 (underlying!512 thiss!992))) (minValue!2896 (v!3393 (underlying!512 thiss!992))) (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3053 (v!3393 (underlying!512 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153272 (arrayContainsKey!0 (_keys!4825 (v!3393 (underlying!512 thiss!992))) (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!80439 () Unit!4874)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5043 (_ BitVec 32) (_ BitVec 32)) Unit!4874)

(assert (=> b!153272 (= lt!80439 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4825 (v!3393 (underlying!512 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1798 0))(
  ( (Nil!1795) (Cons!1794 (h!2403 (_ BitVec 64)) (t!6571 List!1798)) )
))
(declare-fun arrayNoDuplicates!0 (array!5043 (_ BitVec 32) List!1798) Bool)

(assert (=> b!153272 (arrayNoDuplicates!0 (_keys!4825 (v!3393 (underlying!512 thiss!992))) from!355 Nil!1795)))

(declare-fun lt!80444 () Unit!4874)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5043 (_ BitVec 32) (_ BitVec 64) List!1798) Unit!4874)

(assert (=> b!153272 (= lt!80444 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4825 (v!3393 (underlying!512 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) (Cons!1794 (select (arr!2380 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) from!355) Nil!1795)))))

(assert (=> b!153272 false))

(declare-fun b!153273 () Bool)

(assert (=> b!153273 (= e!100053 tp_is_empty!3007)))

(declare-fun b!153274 () Bool)

(declare-fun e!100050 () Bool)

(assert (=> b!153274 (= e!100050 (and e!100047 mapRes!5107))))

(declare-fun condMapEmpty!5107 () Bool)

(declare-fun mapDefault!5108 () ValueCell!1160)

(assert (=> b!153274 (= condMapEmpty!5107 (= (arr!2381 (_values!3036 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1160)) mapDefault!5108)))))

(declare-fun e!100052 () Bool)

(declare-fun array_inv!1523 (array!5043) Bool)

(declare-fun array_inv!1524 (array!5045) Bool)

(assert (=> b!153275 (= e!100046 (and tp!12062 tp_is_empty!3007 (array_inv!1523 (_keys!4825 (v!3393 (underlying!512 thiss!992)))) (array_inv!1524 (_values!3036 (v!3393 (underlying!512 thiss!992)))) e!100052))))

(assert (=> b!153276 (= e!100048 (and tp!12059 tp_is_empty!3007 (array_inv!1523 (_keys!4825 newMap!16)) (array_inv!1524 (_values!3036 newMap!16)) e!100050))))

(declare-fun b!153277 () Bool)

(assert (=> b!153277 (= e!100052 (and e!100039 mapRes!5108))))

(declare-fun condMapEmpty!5108 () Bool)

(declare-fun mapDefault!5107 () ValueCell!1160)

(assert (=> b!153277 (= condMapEmpty!5108 (= (arr!2381 (_values!3036 (v!3393 (underlying!512 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1160)) mapDefault!5107)))))

(assert (= (and start!15452 res!72434) b!153264))

(assert (= (and b!153264 res!72436) b!153265))

(assert (= (and b!153265 res!72432) b!153268))

(assert (= (and b!153268 res!72435) b!153269))

(assert (= (and b!153269 res!72433) b!153271))

(assert (= (and b!153271 c!29428) b!153272))

(assert (= (and b!153271 (not c!29428)) b!153266))

(assert (= (and b!153277 condMapEmpty!5108) mapIsEmpty!5108))

(assert (= (and b!153277 (not condMapEmpty!5108)) mapNonEmpty!5107))

(get-info :version)

(assert (= (and mapNonEmpty!5107 ((_ is ValueCellFull!1160) mapValue!5107)) b!153267))

(assert (= (and b!153277 ((_ is ValueCellFull!1160) mapDefault!5107)) b!153261))

(assert (= b!153275 b!153277))

(assert (= b!153263 b!153275))

(assert (= b!153270 b!153263))

(assert (= start!15452 b!153270))

(assert (= (and b!153274 condMapEmpty!5107) mapIsEmpty!5107))

(assert (= (and b!153274 (not condMapEmpty!5107)) mapNonEmpty!5108))

(assert (= (and mapNonEmpty!5108 ((_ is ValueCellFull!1160) mapValue!5108)) b!153273))

(assert (= (and b!153274 ((_ is ValueCellFull!1160) mapDefault!5108)) b!153262))

(assert (= b!153276 b!153274))

(assert (= start!15452 b!153276))

(declare-fun b_lambda!6811 () Bool)

(assert (=> (not b_lambda!6811) (not b!153271)))

(declare-fun t!6567 () Bool)

(declare-fun tb!2733 () Bool)

(assert (=> (and b!153275 (= (defaultEntry!3053 (v!3393 (underlying!512 thiss!992))) (defaultEntry!3053 (v!3393 (underlying!512 thiss!992)))) t!6567) tb!2733))

(declare-fun result!4455 () Bool)

(assert (=> tb!2733 (= result!4455 tp_is_empty!3007)))

(assert (=> b!153271 t!6567))

(declare-fun b_and!9509 () Bool)

(assert (= b_and!9505 (and (=> t!6567 result!4455) b_and!9509)))

(declare-fun t!6569 () Bool)

(declare-fun tb!2735 () Bool)

(assert (=> (and b!153276 (= (defaultEntry!3053 newMap!16) (defaultEntry!3053 (v!3393 (underlying!512 thiss!992)))) t!6569) tb!2735))

(declare-fun result!4459 () Bool)

(assert (= result!4459 result!4455))

(assert (=> b!153271 t!6569))

(declare-fun b_and!9511 () Bool)

(assert (= b_and!9507 (and (=> t!6569 result!4459) b_and!9511)))

(declare-fun m!186713 () Bool)

(assert (=> b!153272 m!186713))

(declare-fun m!186715 () Bool)

(assert (=> b!153272 m!186715))

(declare-fun m!186717 () Bool)

(assert (=> b!153272 m!186717))

(declare-fun m!186719 () Bool)

(assert (=> b!153272 m!186719))

(assert (=> b!153272 m!186717))

(assert (=> b!153272 m!186717))

(declare-fun m!186721 () Bool)

(assert (=> b!153272 m!186721))

(assert (=> b!153272 m!186717))

(declare-fun m!186723 () Bool)

(assert (=> b!153272 m!186723))

(assert (=> b!153269 m!186717))

(declare-fun m!186725 () Bool)

(assert (=> b!153269 m!186725))

(declare-fun m!186727 () Bool)

(assert (=> b!153269 m!186727))

(declare-fun m!186729 () Bool)

(assert (=> mapNonEmpty!5107 m!186729))

(assert (=> b!153271 m!186717))

(declare-fun m!186731 () Bool)

(assert (=> b!153271 m!186731))

(declare-fun m!186733 () Bool)

(assert (=> b!153271 m!186733))

(declare-fun m!186735 () Bool)

(assert (=> b!153271 m!186735))

(declare-fun m!186737 () Bool)

(assert (=> b!153271 m!186737))

(assert (=> b!153271 m!186717))

(assert (=> b!153271 m!186735))

(assert (=> b!153271 m!186717))

(assert (=> b!153271 m!186737))

(declare-fun m!186739 () Bool)

(assert (=> b!153271 m!186739))

(assert (=> b!153271 m!186733))

(declare-fun m!186741 () Bool)

(assert (=> b!153265 m!186741))

(declare-fun m!186743 () Bool)

(assert (=> b!153275 m!186743))

(declare-fun m!186745 () Bool)

(assert (=> b!153275 m!186745))

(declare-fun m!186747 () Bool)

(assert (=> mapNonEmpty!5108 m!186747))

(declare-fun m!186749 () Bool)

(assert (=> start!15452 m!186749))

(declare-fun m!186751 () Bool)

(assert (=> b!153276 m!186751))

(declare-fun m!186753 () Bool)

(assert (=> b!153276 m!186753))

(check-sat (not b!153269) (not b_next!3183) (not b!153272) b_and!9511 (not b!153276) (not b_next!3181) (not b!153271) (not mapNonEmpty!5107) (not start!15452) (not mapNonEmpty!5108) (not b!153275) (not b!153265) (not b_lambda!6811) tp_is_empty!3007 b_and!9509)
(check-sat b_and!9509 b_and!9511 (not b_next!3181) (not b_next!3183))
