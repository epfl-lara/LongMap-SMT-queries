; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15266 () Bool)

(assert start!15266)

(declare-fun b!147269 () Bool)

(declare-fun b_free!3157 () Bool)

(declare-fun b_next!3157 () Bool)

(assert (=> b!147269 (= b_free!3157 (not b_next!3157))))

(declare-fun tp!11980 () Bool)

(declare-fun b_and!9253 () Bool)

(assert (=> b!147269 (= tp!11980 b_and!9253)))

(declare-fun b!147257 () Bool)

(declare-fun b_free!3159 () Bool)

(declare-fun b_next!3159 () Bool)

(assert (=> b!147257 (= b_free!3159 (not b_next!3159))))

(declare-fun tp!11977 () Bool)

(declare-fun b_and!9255 () Bool)

(assert (=> b!147257 (= tp!11977 b_and!9255)))

(declare-fun tp_is_empty!2995 () Bool)

(declare-datatypes ((V!3641 0))(
  ( (V!3642 (val!1542 Int)) )
))
(declare-datatypes ((array!5023 0))(
  ( (array!5024 (arr!2372 (Array (_ BitVec 32) (_ BitVec 64))) (size!2648 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1154 0))(
  ( (ValueCellFull!1154 (v!3377 V!3641)) (EmptyCell!1154) )
))
(declare-datatypes ((array!5025 0))(
  ( (array!5026 (arr!2373 (Array (_ BitVec 32) ValueCell!1154)) (size!2649 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1216 0))(
  ( (LongMapFixedSize!1217 (defaultEntry!3027 Int) (mask!7411 (_ BitVec 32)) (extraKeys!2772 (_ BitVec 32)) (zeroValue!2872 V!3641) (minValue!2872 V!3641) (_size!657 (_ BitVec 32)) (_keys!4796 array!5023) (_values!3010 array!5025) (_vacant!657 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1216)

(declare-fun e!96167 () Bool)

(declare-fun e!96166 () Bool)

(declare-fun array_inv!1489 (array!5023) Bool)

(declare-fun array_inv!1490 (array!5025) Bool)

(assert (=> b!147257 (= e!96167 (and tp!11977 tp_is_empty!2995 (array_inv!1489 (_keys!4796 newMap!16)) (array_inv!1490 (_values!3010 newMap!16)) e!96166))))

(declare-fun mapIsEmpty!5061 () Bool)

(declare-fun mapRes!5062 () Bool)

(assert (=> mapIsEmpty!5061 mapRes!5062))

(declare-fun b!147258 () Bool)

(declare-fun e!96176 () Bool)

(declare-fun e!96171 () Bool)

(assert (=> b!147258 (= e!96176 e!96171)))

(declare-fun res!69980 () Bool)

(assert (=> b!147258 (=> (not res!69980) (not e!96171))))

(declare-datatypes ((Cell!1000 0))(
  ( (Cell!1001 (v!3378 LongMapFixedSize!1216)) )
))
(declare-datatypes ((LongMap!1000 0))(
  ( (LongMap!1001 (underlying!511 Cell!1000)) )
))
(declare-fun thiss!992 () LongMap!1000)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147258 (= res!69980 (and (not (= (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77698 () V!3641)

(declare-fun get!1593 (ValueCell!1154 V!3641) V!3641)

(declare-fun dynLambda!463 (Int (_ BitVec 64)) V!3641)

(assert (=> b!147258 (= lt!77698 (get!1593 (select (arr!2373 (_values!3010 (v!3378 (underlying!511 thiss!992)))) from!355) (dynLambda!463 (defaultEntry!3027 (v!3378 (underlying!511 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!69979 () Bool)

(declare-fun e!96169 () Bool)

(assert (=> start!15266 (=> (not res!69979) (not e!96169))))

(declare-fun valid!614 (LongMap!1000) Bool)

(assert (=> start!15266 (= res!69979 (valid!614 thiss!992))))

(assert (=> start!15266 e!96169))

(declare-fun e!96172 () Bool)

(assert (=> start!15266 e!96172))

(assert (=> start!15266 true))

(assert (=> start!15266 e!96167))

(declare-fun b!147259 () Bool)

(assert (=> b!147259 (= e!96169 e!96176)))

(declare-fun res!69984 () Bool)

(assert (=> b!147259 (=> (not res!69984) (not e!96176))))

(declare-datatypes ((tuple2!2718 0))(
  ( (tuple2!2719 (_1!1370 (_ BitVec 64)) (_2!1370 V!3641)) )
))
(declare-datatypes ((List!1771 0))(
  ( (Nil!1768) (Cons!1767 (h!2375 tuple2!2718) (t!6504 List!1771)) )
))
(declare-datatypes ((ListLongMap!1737 0))(
  ( (ListLongMap!1738 (toList!884 List!1771)) )
))
(declare-fun lt!77705 () ListLongMap!1737)

(declare-fun lt!77704 () ListLongMap!1737)

(assert (=> b!147259 (= res!69984 (= lt!77705 lt!77704))))

(declare-fun map!1474 (LongMapFixedSize!1216) ListLongMap!1737)

(assert (=> b!147259 (= lt!77704 (map!1474 newMap!16))))

(declare-fun getCurrentListMap!554 (array!5023 array!5025 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 32) Int) ListLongMap!1737)

(assert (=> b!147259 (= lt!77705 (getCurrentListMap!554 (_keys!4796 (v!3378 (underlying!511 thiss!992))) (_values!3010 (v!3378 (underlying!511 thiss!992))) (mask!7411 (v!3378 (underlying!511 thiss!992))) (extraKeys!2772 (v!3378 (underlying!511 thiss!992))) (zeroValue!2872 (v!3378 (underlying!511 thiss!992))) (minValue!2872 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun b!147260 () Bool)

(declare-fun e!96178 () Bool)

(assert (=> b!147260 (= e!96172 e!96178)))

(declare-fun b!147261 () Bool)

(declare-fun e!96180 () Bool)

(assert (=> b!147261 (= e!96180 tp_is_empty!2995)))

(declare-fun b!147262 () Bool)

(declare-datatypes ((Unit!4657 0))(
  ( (Unit!4658) )
))
(declare-fun e!96179 () Unit!4657)

(declare-fun Unit!4659 () Unit!4657)

(assert (=> b!147262 (= e!96179 Unit!4659)))

(declare-fun lt!77703 () Unit!4657)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!159 (array!5023 array!5025 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 64) (_ BitVec 32) Int) Unit!4657)

(assert (=> b!147262 (= lt!77703 (lemmaListMapContainsThenArrayContainsFrom!159 (_keys!4796 (v!3378 (underlying!511 thiss!992))) (_values!3010 (v!3378 (underlying!511 thiss!992))) (mask!7411 (v!3378 (underlying!511 thiss!992))) (extraKeys!2772 (v!3378 (underlying!511 thiss!992))) (zeroValue!2872 (v!3378 (underlying!511 thiss!992))) (minValue!2872 (v!3378 (underlying!511 thiss!992))) (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147262 (arrayContainsKey!0 (_keys!4796 (v!3378 (underlying!511 thiss!992))) (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77696 () Unit!4657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5023 (_ BitVec 32) (_ BitVec 32)) Unit!4657)

(assert (=> b!147262 (= lt!77696 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4796 (v!3378 (underlying!511 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1772 0))(
  ( (Nil!1769) (Cons!1768 (h!2376 (_ BitVec 64)) (t!6505 List!1772)) )
))
(declare-fun arrayNoDuplicates!0 (array!5023 (_ BitVec 32) List!1772) Bool)

(assert (=> b!147262 (arrayNoDuplicates!0 (_keys!4796 (v!3378 (underlying!511 thiss!992))) from!355 Nil!1769)))

(declare-fun lt!77701 () Unit!4657)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5023 (_ BitVec 32) (_ BitVec 64) List!1772) Unit!4657)

(assert (=> b!147262 (= lt!77701 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4796 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) (Cons!1768 (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) Nil!1769)))))

(assert (=> b!147262 false))

(declare-fun b!147263 () Bool)

(declare-fun e!96174 () Bool)

(assert (=> b!147263 (= e!96174 tp_is_empty!2995)))

(declare-fun b!147264 () Bool)

(declare-fun res!69981 () Bool)

(assert (=> b!147264 (=> (not res!69981) (not e!96169))))

(assert (=> b!147264 (= res!69981 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7411 newMap!16)) (_size!657 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun b!147265 () Bool)

(declare-fun e!96165 () Bool)

(declare-fun mapRes!5061 () Bool)

(assert (=> b!147265 (= e!96166 (and e!96165 mapRes!5061))))

(declare-fun condMapEmpty!5061 () Bool)

(declare-fun mapDefault!5061 () ValueCell!1154)

(assert (=> b!147265 (= condMapEmpty!5061 (= (arr!2373 (_values!3010 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1154)) mapDefault!5061)))))

(declare-fun b!147266 () Bool)

(declare-fun e!96177 () Bool)

(assert (=> b!147266 (= e!96171 e!96177)))

(declare-fun res!69983 () Bool)

(assert (=> b!147266 (=> (not res!69983) (not e!96177))))

(declare-datatypes ((tuple2!2720 0))(
  ( (tuple2!2721 (_1!1371 Bool) (_2!1371 LongMapFixedSize!1216)) )
))
(declare-fun lt!77702 () tuple2!2720)

(assert (=> b!147266 (= res!69983 (and (_1!1371 lt!77702) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77700 () Unit!4657)

(assert (=> b!147266 (= lt!77700 e!96179)))

(declare-fun c!27762 () Bool)

(declare-fun contains!939 (ListLongMap!1737 (_ BitVec 64)) Bool)

(assert (=> b!147266 (= c!27762 (contains!939 lt!77704 (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355)))))

(declare-fun update!230 (LongMapFixedSize!1216 (_ BitVec 64) V!3641) tuple2!2720)

(assert (=> b!147266 (= lt!77702 (update!230 newMap!16 (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77698))))

(declare-fun b!147267 () Bool)

(declare-fun res!69985 () Bool)

(assert (=> b!147267 (=> (not res!69985) (not e!96169))))

(assert (=> b!147267 (= res!69985 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2648 (_keys!4796 (v!3378 (underlying!511 thiss!992)))))))))

(declare-fun b!147268 () Bool)

(declare-fun e!96164 () Bool)

(assert (=> b!147268 (= e!96178 e!96164)))

(declare-fun e!96168 () Bool)

(assert (=> b!147269 (= e!96164 (and tp!11980 tp_is_empty!2995 (array_inv!1489 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) (array_inv!1490 (_values!3010 (v!3378 (underlying!511 thiss!992)))) e!96168))))

(declare-fun b!147270 () Bool)

(declare-fun e!96170 () Bool)

(assert (=> b!147270 (= e!96170 tp_is_empty!2995)))

(declare-fun b!147271 () Bool)

(declare-fun Unit!4660 () Unit!4657)

(assert (=> b!147271 (= e!96179 Unit!4660)))

(declare-fun mapIsEmpty!5062 () Bool)

(assert (=> mapIsEmpty!5062 mapRes!5061))

(declare-fun b!147272 () Bool)

(assert (=> b!147272 (= e!96165 tp_is_empty!2995)))

(declare-fun mapNonEmpty!5061 () Bool)

(declare-fun tp!11978 () Bool)

(assert (=> mapNonEmpty!5061 (= mapRes!5062 (and tp!11978 e!96174))))

(declare-fun mapKey!5062 () (_ BitVec 32))

(declare-fun mapValue!5061 () ValueCell!1154)

(declare-fun mapRest!5061 () (Array (_ BitVec 32) ValueCell!1154))

(assert (=> mapNonEmpty!5061 (= (arr!2373 (_values!3010 (v!3378 (underlying!511 thiss!992)))) (store mapRest!5061 mapKey!5062 mapValue!5061))))

(declare-fun b!147273 () Bool)

(assert (=> b!147273 (= e!96177 (not true))))

(declare-fun lt!77695 () ListLongMap!1737)

(declare-fun lt!77694 () tuple2!2718)

(declare-fun lt!77699 () tuple2!2718)

(declare-fun +!185 (ListLongMap!1737 tuple2!2718) ListLongMap!1737)

(assert (=> b!147273 (= (+!185 (+!185 lt!77695 lt!77694) lt!77699) (+!185 (+!185 lt!77695 lt!77699) lt!77694))))

(assert (=> b!147273 (= lt!77699 (tuple2!2719 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2872 (v!3378 (underlying!511 thiss!992)))))))

(assert (=> b!147273 (= lt!77694 (tuple2!2719 (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77698))))

(declare-fun lt!77697 () Unit!4657)

(declare-fun addCommutativeForDiffKeys!79 (ListLongMap!1737 (_ BitVec 64) V!3641 (_ BitVec 64) V!3641) Unit!4657)

(assert (=> b!147273 (= lt!77697 (addCommutativeForDiffKeys!79 lt!77695 (select (arr!2372 (_keys!4796 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77698 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2872 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!155 (array!5023 array!5025 (_ BitVec 32) (_ BitVec 32) V!3641 V!3641 (_ BitVec 32) Int) ListLongMap!1737)

(assert (=> b!147273 (= lt!77695 (getCurrentListMapNoExtraKeys!155 (_keys!4796 (v!3378 (underlying!511 thiss!992))) (_values!3010 (v!3378 (underlying!511 thiss!992))) (mask!7411 (v!3378 (underlying!511 thiss!992))) (extraKeys!2772 (v!3378 (underlying!511 thiss!992))) (zeroValue!2872 (v!3378 (underlying!511 thiss!992))) (minValue!2872 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3027 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun b!147274 () Bool)

(declare-fun res!69982 () Bool)

(assert (=> b!147274 (=> (not res!69982) (not e!96169))))

(declare-fun valid!615 (LongMapFixedSize!1216) Bool)

(assert (=> b!147274 (= res!69982 (valid!615 newMap!16))))

(declare-fun b!147275 () Bool)

(assert (=> b!147275 (= e!96168 (and e!96180 mapRes!5062))))

(declare-fun condMapEmpty!5062 () Bool)

(declare-fun mapDefault!5062 () ValueCell!1154)

(assert (=> b!147275 (= condMapEmpty!5062 (= (arr!2373 (_values!3010 (v!3378 (underlying!511 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1154)) mapDefault!5062)))))

(declare-fun mapNonEmpty!5062 () Bool)

(declare-fun tp!11979 () Bool)

(assert (=> mapNonEmpty!5062 (= mapRes!5061 (and tp!11979 e!96170))))

(declare-fun mapKey!5061 () (_ BitVec 32))

(declare-fun mapValue!5062 () ValueCell!1154)

(declare-fun mapRest!5062 () (Array (_ BitVec 32) ValueCell!1154))

(assert (=> mapNonEmpty!5062 (= (arr!2373 (_values!3010 newMap!16)) (store mapRest!5062 mapKey!5061 mapValue!5062))))

(assert (= (and start!15266 res!69979) b!147267))

(assert (= (and b!147267 res!69985) b!147274))

(assert (= (and b!147274 res!69982) b!147264))

(assert (= (and b!147264 res!69981) b!147259))

(assert (= (and b!147259 res!69984) b!147258))

(assert (= (and b!147258 res!69980) b!147266))

(assert (= (and b!147266 c!27762) b!147262))

(assert (= (and b!147266 (not c!27762)) b!147271))

(assert (= (and b!147266 res!69983) b!147273))

(assert (= (and b!147275 condMapEmpty!5062) mapIsEmpty!5061))

(assert (= (and b!147275 (not condMapEmpty!5062)) mapNonEmpty!5061))

(get-info :version)

(assert (= (and mapNonEmpty!5061 ((_ is ValueCellFull!1154) mapValue!5061)) b!147263))

(assert (= (and b!147275 ((_ is ValueCellFull!1154) mapDefault!5062)) b!147261))

(assert (= b!147269 b!147275))

(assert (= b!147268 b!147269))

(assert (= b!147260 b!147268))

(assert (= start!15266 b!147260))

(assert (= (and b!147265 condMapEmpty!5061) mapIsEmpty!5062))

(assert (= (and b!147265 (not condMapEmpty!5061)) mapNonEmpty!5062))

(assert (= (and mapNonEmpty!5062 ((_ is ValueCellFull!1154) mapValue!5062)) b!147270))

(assert (= (and b!147265 ((_ is ValueCellFull!1154) mapDefault!5061)) b!147272))

(assert (= b!147257 b!147265))

(assert (= start!15266 b!147257))

(declare-fun b_lambda!6603 () Bool)

(assert (=> (not b_lambda!6603) (not b!147258)))

(declare-fun t!6501 () Bool)

(declare-fun tb!2693 () Bool)

(assert (=> (and b!147269 (= (defaultEntry!3027 (v!3378 (underlying!511 thiss!992))) (defaultEntry!3027 (v!3378 (underlying!511 thiss!992)))) t!6501) tb!2693))

(declare-fun result!4401 () Bool)

(assert (=> tb!2693 (= result!4401 tp_is_empty!2995)))

(assert (=> b!147258 t!6501))

(declare-fun b_and!9257 () Bool)

(assert (= b_and!9253 (and (=> t!6501 result!4401) b_and!9257)))

(declare-fun t!6503 () Bool)

(declare-fun tb!2695 () Bool)

(assert (=> (and b!147257 (= (defaultEntry!3027 newMap!16) (defaultEntry!3027 (v!3378 (underlying!511 thiss!992)))) t!6503) tb!2695))

(declare-fun result!4405 () Bool)

(assert (= result!4405 result!4401))

(assert (=> b!147258 t!6503))

(declare-fun b_and!9259 () Bool)

(assert (= b_and!9255 (and (=> t!6503 result!4405) b_and!9259)))

(declare-fun m!177015 () Bool)

(assert (=> b!147262 m!177015))

(declare-fun m!177017 () Bool)

(assert (=> b!147262 m!177017))

(declare-fun m!177019 () Bool)

(assert (=> b!147262 m!177019))

(declare-fun m!177021 () Bool)

(assert (=> b!147262 m!177021))

(assert (=> b!147262 m!177019))

(assert (=> b!147262 m!177019))

(declare-fun m!177023 () Bool)

(assert (=> b!147262 m!177023))

(assert (=> b!147262 m!177019))

(declare-fun m!177025 () Bool)

(assert (=> b!147262 m!177025))

(declare-fun m!177027 () Bool)

(assert (=> b!147259 m!177027))

(declare-fun m!177029 () Bool)

(assert (=> b!147259 m!177029))

(declare-fun m!177031 () Bool)

(assert (=> start!15266 m!177031))

(declare-fun m!177033 () Bool)

(assert (=> b!147274 m!177033))

(declare-fun m!177035 () Bool)

(assert (=> b!147257 m!177035))

(declare-fun m!177037 () Bool)

(assert (=> b!147257 m!177037))

(declare-fun m!177039 () Bool)

(assert (=> mapNonEmpty!5061 m!177039))

(assert (=> b!147266 m!177019))

(assert (=> b!147266 m!177019))

(declare-fun m!177041 () Bool)

(assert (=> b!147266 m!177041))

(assert (=> b!147266 m!177019))

(declare-fun m!177043 () Bool)

(assert (=> b!147266 m!177043))

(assert (=> b!147258 m!177019))

(declare-fun m!177045 () Bool)

(assert (=> b!147258 m!177045))

(declare-fun m!177047 () Bool)

(assert (=> b!147258 m!177047))

(assert (=> b!147258 m!177045))

(assert (=> b!147258 m!177047))

(declare-fun m!177049 () Bool)

(assert (=> b!147258 m!177049))

(declare-fun m!177051 () Bool)

(assert (=> b!147273 m!177051))

(assert (=> b!147273 m!177019))

(declare-fun m!177053 () Bool)

(assert (=> b!147273 m!177053))

(assert (=> b!147273 m!177019))

(declare-fun m!177055 () Bool)

(assert (=> b!147273 m!177055))

(declare-fun m!177057 () Bool)

(assert (=> b!147273 m!177057))

(declare-fun m!177059 () Bool)

(assert (=> b!147273 m!177059))

(assert (=> b!147273 m!177055))

(assert (=> b!147273 m!177051))

(declare-fun m!177061 () Bool)

(assert (=> b!147273 m!177061))

(declare-fun m!177063 () Bool)

(assert (=> b!147269 m!177063))

(declare-fun m!177065 () Bool)

(assert (=> b!147269 m!177065))

(declare-fun m!177067 () Bool)

(assert (=> mapNonEmpty!5062 m!177067))

(check-sat b_and!9259 (not b_next!3157) (not b!147262) (not b!147274) (not mapNonEmpty!5062) (not b_next!3159) (not b_lambda!6603) (not b!147266) (not b!147269) tp_is_empty!2995 b_and!9257 (not b!147259) (not start!15266) (not b!147273) (not b!147258) (not mapNonEmpty!5061) (not b!147257))
(check-sat b_and!9257 b_and!9259 (not b_next!3157) (not b_next!3159))
