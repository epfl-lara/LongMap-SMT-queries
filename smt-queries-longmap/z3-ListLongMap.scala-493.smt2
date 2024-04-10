; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11108 () Bool)

(assert start!11108)

(declare-fun b!90783 () Bool)

(declare-fun b_free!2309 () Bool)

(declare-fun b_next!2309 () Bool)

(assert (=> b!90783 (= b_free!2309 (not b_next!2309))))

(declare-fun tp!9177 () Bool)

(declare-fun b_and!5483 () Bool)

(assert (=> b!90783 (= tp!9177 b_and!5483)))

(declare-fun b!90786 () Bool)

(declare-fun b_free!2311 () Bool)

(declare-fun b_next!2311 () Bool)

(assert (=> b!90786 (= b_free!2311 (not b_next!2311))))

(declare-fun tp!9175 () Bool)

(declare-fun b_and!5485 () Bool)

(assert (=> b!90786 (= tp!9175 b_and!5485)))

(declare-fun mapIsEmpty!3531 () Bool)

(declare-fun mapRes!3532 () Bool)

(assert (=> mapIsEmpty!3531 mapRes!3532))

(declare-fun b!90769 () Bool)

(declare-datatypes ((Unit!2697 0))(
  ( (Unit!2698) )
))
(declare-fun e!59179 () Unit!2697)

(declare-fun Unit!2699 () Unit!2697)

(assert (=> b!90769 (= e!59179 Unit!2699)))

(declare-fun b!90770 () Bool)

(declare-fun e!59169 () Bool)

(declare-fun tp_is_empty!2571 () Bool)

(assert (=> b!90770 (= e!59169 tp_is_empty!2571)))

(declare-fun b!90771 () Bool)

(declare-fun e!59173 () Bool)

(assert (=> b!90771 (= e!59173 tp_is_empty!2571)))

(declare-fun b!90772 () Bool)

(declare-fun res!46281 () Bool)

(declare-fun e!59175 () Bool)

(assert (=> b!90772 (=> (not res!46281) (not e!59175))))

(declare-datatypes ((V!3075 0))(
  ( (V!3076 (val!1330 Int)) )
))
(declare-datatypes ((array!4109 0))(
  ( (array!4110 (arr!1955 (Array (_ BitVec 32) (_ BitVec 64))) (size!2202 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!942 0))(
  ( (ValueCellFull!942 (v!2706 V!3075)) (EmptyCell!942) )
))
(declare-datatypes ((array!4111 0))(
  ( (array!4112 (arr!1956 (Array (_ BitVec 32) ValueCell!942)) (size!2203 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!792 0))(
  ( (LongMapFixedSize!793 (defaultEntry!2397 Int) (mask!6453 (_ BitVec 32)) (extraKeys!2228 (_ BitVec 32)) (zeroValue!2285 V!3075) (minValue!2285 V!3075) (_size!445 (_ BitVec 32)) (_keys!4077 array!4109) (_values!2380 array!4111) (_vacant!445 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!792)

(declare-datatypes ((Cell!592 0))(
  ( (Cell!593 (v!2707 LongMapFixedSize!792)) )
))
(declare-datatypes ((LongMap!592 0))(
  ( (LongMap!593 (underlying!307 Cell!592)) )
))
(declare-fun thiss!992 () LongMap!592)

(assert (=> b!90772 (= res!46281 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6453 newMap!16)) (_size!445 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun b!90773 () Bool)

(declare-fun res!46287 () Bool)

(assert (=> b!90773 (=> (not res!46287) (not e!59175))))

(declare-fun valid!344 (LongMapFixedSize!792) Bool)

(assert (=> b!90773 (= res!46287 (valid!344 newMap!16))))

(declare-fun b!90774 () Bool)

(declare-fun e!59172 () Bool)

(assert (=> b!90774 (= e!59172 tp_is_empty!2571)))

(declare-fun b!90775 () Bool)

(declare-fun e!59180 () Bool)

(assert (=> b!90775 (= e!59175 e!59180)))

(declare-fun res!46283 () Bool)

(assert (=> b!90775 (=> (not res!46283) (not e!59180))))

(declare-datatypes ((tuple2!2242 0))(
  ( (tuple2!2243 (_1!1132 (_ BitVec 64)) (_2!1132 V!3075)) )
))
(declare-datatypes ((List!1542 0))(
  ( (Nil!1539) (Cons!1538 (h!2130 tuple2!2242) (t!5352 List!1542)) )
))
(declare-datatypes ((ListLongMap!1487 0))(
  ( (ListLongMap!1488 (toList!759 List!1542)) )
))
(declare-fun lt!44072 () ListLongMap!1487)

(declare-fun lt!44063 () ListLongMap!1487)

(assert (=> b!90775 (= res!46283 (= lt!44072 lt!44063))))

(declare-fun map!1212 (LongMapFixedSize!792) ListLongMap!1487)

(assert (=> b!90775 (= lt!44063 (map!1212 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!451 (array!4109 array!4111 (_ BitVec 32) (_ BitVec 32) V!3075 V!3075 (_ BitVec 32) Int) ListLongMap!1487)

(assert (=> b!90775 (= lt!44072 (getCurrentListMap!451 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (_values!2380 (v!2707 (underlying!307 thiss!992))) (mask!6453 (v!2707 (underlying!307 thiss!992))) (extraKeys!2228 (v!2707 (underlying!307 thiss!992))) (zeroValue!2285 (v!2707 (underlying!307 thiss!992))) (minValue!2285 (v!2707 (underlying!307 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun b!90776 () Bool)

(declare-fun e!59174 () Bool)

(assert (=> b!90776 (= e!59180 e!59174)))

(declare-fun res!46284 () Bool)

(assert (=> b!90776 (=> (not res!46284) (not e!59174))))

(assert (=> b!90776 (= res!46284 (and (not (= (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44070 () V!3075)

(declare-fun get!1228 (ValueCell!942 V!3075) V!3075)

(declare-fun dynLambda!351 (Int (_ BitVec 64)) V!3075)

(assert (=> b!90776 (= lt!44070 (get!1228 (select (arr!1956 (_values!2380 (v!2707 (underlying!307 thiss!992)))) from!355) (dynLambda!351 (defaultEntry!2397 (v!2707 (underlying!307 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90777 () Bool)

(declare-fun e!59166 () Bool)

(declare-fun e!59168 () Bool)

(assert (=> b!90777 (= e!59166 (not e!59168))))

(declare-fun res!46282 () Bool)

(assert (=> b!90777 (=> res!46282 e!59168)))

(declare-datatypes ((tuple2!2244 0))(
  ( (tuple2!2245 (_1!1133 Bool) (_2!1133 LongMapFixedSize!792)) )
))
(declare-fun lt!44076 () tuple2!2244)

(assert (=> b!90777 (= res!46282 (not (= (getCurrentListMap!451 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (_values!2380 (v!2707 (underlying!307 thiss!992))) (mask!6453 (v!2707 (underlying!307 thiss!992))) (extraKeys!2228 (v!2707 (underlying!307 thiss!992))) (zeroValue!2285 (v!2707 (underlying!307 thiss!992))) (minValue!2285 (v!2707 (underlying!307 thiss!992))) from!355 (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))) (map!1212 (_2!1133 lt!44076)))))))

(declare-fun lt!44071 () tuple2!2242)

(declare-fun lt!44079 () ListLongMap!1487)

(declare-fun lt!44067 () ListLongMap!1487)

(declare-fun lt!44068 () tuple2!2242)

(declare-fun +!121 (ListLongMap!1487 tuple2!2242) ListLongMap!1487)

(assert (=> b!90777 (= (+!121 lt!44079 lt!44068) (+!121 (+!121 lt!44067 lt!44068) lt!44071))))

(assert (=> b!90777 (= lt!44068 (tuple2!2243 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2285 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun lt!44077 () Unit!2697)

(declare-fun addCommutativeForDiffKeys!40 (ListLongMap!1487 (_ BitVec 64) V!3075 (_ BitVec 64) V!3075) Unit!2697)

(assert (=> b!90777 (= lt!44077 (addCommutativeForDiffKeys!40 lt!44067 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) lt!44070 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2285 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun lt!44073 () ListLongMap!1487)

(assert (=> b!90777 (= lt!44073 lt!44079)))

(assert (=> b!90777 (= lt!44079 (+!121 lt!44067 lt!44071))))

(declare-fun lt!44075 () ListLongMap!1487)

(declare-fun lt!44065 () tuple2!2242)

(assert (=> b!90777 (= lt!44073 (+!121 lt!44075 lt!44065))))

(declare-fun lt!44074 () ListLongMap!1487)

(assert (=> b!90777 (= lt!44067 (+!121 lt!44074 lt!44065))))

(assert (=> b!90777 (= lt!44065 (tuple2!2243 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2285 (v!2707 (underlying!307 thiss!992)))))))

(assert (=> b!90777 (= lt!44075 (+!121 lt!44074 lt!44071))))

(assert (=> b!90777 (= lt!44071 (tuple2!2243 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) lt!44070))))

(declare-fun lt!44064 () Unit!2697)

(assert (=> b!90777 (= lt!44064 (addCommutativeForDiffKeys!40 lt!44074 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) lt!44070 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2285 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!86 (array!4109 array!4111 (_ BitVec 32) (_ BitVec 32) V!3075 V!3075 (_ BitVec 32) Int) ListLongMap!1487)

(assert (=> b!90777 (= lt!44074 (getCurrentListMapNoExtraKeys!86 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (_values!2380 (v!2707 (underlying!307 thiss!992))) (mask!6453 (v!2707 (underlying!307 thiss!992))) (extraKeys!2228 (v!2707 (underlying!307 thiss!992))) (zeroValue!2285 (v!2707 (underlying!307 thiss!992))) (minValue!2285 (v!2707 (underlying!307 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun b!90778 () Bool)

(assert (=> b!90778 (= e!59168 (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2202 (_keys!4077 (v!2707 (underlying!307 thiss!992))))))))

(declare-fun mapIsEmpty!3532 () Bool)

(declare-fun mapRes!3531 () Bool)

(assert (=> mapIsEmpty!3532 mapRes!3531))

(declare-fun mapNonEmpty!3531 () Bool)

(declare-fun tp!9176 () Bool)

(assert (=> mapNonEmpty!3531 (= mapRes!3532 (and tp!9176 e!59172))))

(declare-fun mapValue!3532 () ValueCell!942)

(declare-fun mapRest!3531 () (Array (_ BitVec 32) ValueCell!942))

(declare-fun mapKey!3532 () (_ BitVec 32))

(assert (=> mapNonEmpty!3531 (= (arr!1956 (_values!2380 (v!2707 (underlying!307 thiss!992)))) (store mapRest!3531 mapKey!3532 mapValue!3532))))

(declare-fun res!46280 () Bool)

(assert (=> start!11108 (=> (not res!46280) (not e!59175))))

(declare-fun valid!345 (LongMap!592) Bool)

(assert (=> start!11108 (= res!46280 (valid!345 thiss!992))))

(assert (=> start!11108 e!59175))

(declare-fun e!59164 () Bool)

(assert (=> start!11108 e!59164))

(assert (=> start!11108 true))

(declare-fun e!59176 () Bool)

(assert (=> start!11108 e!59176))

(declare-fun b!90779 () Bool)

(declare-fun e!59167 () Bool)

(assert (=> b!90779 (= e!59167 tp_is_empty!2571)))

(declare-fun b!90780 () Bool)

(declare-fun Unit!2700 () Unit!2697)

(assert (=> b!90780 (= e!59179 Unit!2700)))

(declare-fun lt!44066 () Unit!2697)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!75 (array!4109 array!4111 (_ BitVec 32) (_ BitVec 32) V!3075 V!3075 (_ BitVec 64) (_ BitVec 32) Int) Unit!2697)

(assert (=> b!90780 (= lt!44066 (lemmaListMapContainsThenArrayContainsFrom!75 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (_values!2380 (v!2707 (underlying!307 thiss!992))) (mask!6453 (v!2707 (underlying!307 thiss!992))) (extraKeys!2228 (v!2707 (underlying!307 thiss!992))) (zeroValue!2285 (v!2707 (underlying!307 thiss!992))) (minValue!2285 (v!2707 (underlying!307 thiss!992))) (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90780 (arrayContainsKey!0 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44078 () Unit!2697)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4109 (_ BitVec 32) (_ BitVec 32)) Unit!2697)

(assert (=> b!90780 (= lt!44078 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4077 (v!2707 (underlying!307 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1543 0))(
  ( (Nil!1540) (Cons!1539 (h!2131 (_ BitVec 64)) (t!5353 List!1543)) )
))
(declare-fun arrayNoDuplicates!0 (array!4109 (_ BitVec 32) List!1543) Bool)

(assert (=> b!90780 (arrayNoDuplicates!0 (_keys!4077 (v!2707 (underlying!307 thiss!992))) from!355 Nil!1540)))

(declare-fun lt!44069 () Unit!2697)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4109 (_ BitVec 32) (_ BitVec 64) List!1543) Unit!2697)

(assert (=> b!90780 (= lt!44069 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4077 (v!2707 (underlying!307 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) (Cons!1539 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) Nil!1540)))))

(assert (=> b!90780 false))

(declare-fun b!90781 () Bool)

(declare-fun e!59165 () Bool)

(assert (=> b!90781 (= e!59164 e!59165)))

(declare-fun b!90782 () Bool)

(declare-fun res!46285 () Bool)

(assert (=> b!90782 (=> (not res!46285) (not e!59175))))

(assert (=> b!90782 (= res!46285 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2202 (_keys!4077 (v!2707 (underlying!307 thiss!992)))))))))

(declare-fun e!59177 () Bool)

(declare-fun e!59163 () Bool)

(declare-fun array_inv!1211 (array!4109) Bool)

(declare-fun array_inv!1212 (array!4111) Bool)

(assert (=> b!90783 (= e!59163 (and tp!9177 tp_is_empty!2571 (array_inv!1211 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) (array_inv!1212 (_values!2380 (v!2707 (underlying!307 thiss!992)))) e!59177))))

(declare-fun mapNonEmpty!3532 () Bool)

(declare-fun tp!9178 () Bool)

(assert (=> mapNonEmpty!3532 (= mapRes!3531 (and tp!9178 e!59167))))

(declare-fun mapRest!3532 () (Array (_ BitVec 32) ValueCell!942))

(declare-fun mapKey!3531 () (_ BitVec 32))

(declare-fun mapValue!3531 () ValueCell!942)

(assert (=> mapNonEmpty!3532 (= (arr!1956 (_values!2380 newMap!16)) (store mapRest!3532 mapKey!3531 mapValue!3531))))

(declare-fun b!90784 () Bool)

(assert (=> b!90784 (= e!59165 e!59163)))

(declare-fun b!90785 () Bool)

(assert (=> b!90785 (= e!59177 (and e!59173 mapRes!3532))))

(declare-fun condMapEmpty!3531 () Bool)

(declare-fun mapDefault!3531 () ValueCell!942)

(assert (=> b!90785 (= condMapEmpty!3531 (= (arr!1956 (_values!2380 (v!2707 (underlying!307 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!942)) mapDefault!3531)))))

(declare-fun e!59170 () Bool)

(assert (=> b!90786 (= e!59176 (and tp!9175 tp_is_empty!2571 (array_inv!1211 (_keys!4077 newMap!16)) (array_inv!1212 (_values!2380 newMap!16)) e!59170))))

(declare-fun b!90787 () Bool)

(assert (=> b!90787 (= e!59170 (and e!59169 mapRes!3531))))

(declare-fun condMapEmpty!3532 () Bool)

(declare-fun mapDefault!3532 () ValueCell!942)

(assert (=> b!90787 (= condMapEmpty!3532 (= (arr!1956 (_values!2380 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!942)) mapDefault!3532)))))

(declare-fun b!90788 () Bool)

(assert (=> b!90788 (= e!59174 e!59166)))

(declare-fun res!46286 () Bool)

(assert (=> b!90788 (=> (not res!46286) (not e!59166))))

(assert (=> b!90788 (= res!46286 (and (_1!1133 lt!44076) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44062 () Unit!2697)

(assert (=> b!90788 (= lt!44062 e!59179)))

(declare-fun c!15077 () Bool)

(declare-fun contains!770 (ListLongMap!1487 (_ BitVec 64)) Bool)

(assert (=> b!90788 (= c!15077 (contains!770 lt!44063 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355)))))

(declare-fun update!121 (LongMapFixedSize!792 (_ BitVec 64) V!3075) tuple2!2244)

(assert (=> b!90788 (= lt!44076 (update!121 newMap!16 (select (arr!1955 (_keys!4077 (v!2707 (underlying!307 thiss!992)))) from!355) lt!44070))))

(assert (= (and start!11108 res!46280) b!90782))

(assert (= (and b!90782 res!46285) b!90773))

(assert (= (and b!90773 res!46287) b!90772))

(assert (= (and b!90772 res!46281) b!90775))

(assert (= (and b!90775 res!46283) b!90776))

(assert (= (and b!90776 res!46284) b!90788))

(assert (= (and b!90788 c!15077) b!90780))

(assert (= (and b!90788 (not c!15077)) b!90769))

(assert (= (and b!90788 res!46286) b!90777))

(assert (= (and b!90777 (not res!46282)) b!90778))

(assert (= (and b!90785 condMapEmpty!3531) mapIsEmpty!3531))

(assert (= (and b!90785 (not condMapEmpty!3531)) mapNonEmpty!3531))

(get-info :version)

(assert (= (and mapNonEmpty!3531 ((_ is ValueCellFull!942) mapValue!3532)) b!90774))

(assert (= (and b!90785 ((_ is ValueCellFull!942) mapDefault!3531)) b!90771))

(assert (= b!90783 b!90785))

(assert (= b!90784 b!90783))

(assert (= b!90781 b!90784))

(assert (= start!11108 b!90781))

(assert (= (and b!90787 condMapEmpty!3532) mapIsEmpty!3532))

(assert (= (and b!90787 (not condMapEmpty!3532)) mapNonEmpty!3532))

(assert (= (and mapNonEmpty!3532 ((_ is ValueCellFull!942) mapValue!3531)) b!90779))

(assert (= (and b!90787 ((_ is ValueCellFull!942) mapDefault!3532)) b!90770))

(assert (= b!90786 b!90787))

(assert (= start!11108 b!90786))

(declare-fun b_lambda!4007 () Bool)

(assert (=> (not b_lambda!4007) (not b!90776)))

(declare-fun t!5349 () Bool)

(declare-fun tb!1777 () Bool)

(assert (=> (and b!90783 (= (defaultEntry!2397 (v!2707 (underlying!307 thiss!992))) (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))) t!5349) tb!1777))

(declare-fun result!3045 () Bool)

(assert (=> tb!1777 (= result!3045 tp_is_empty!2571)))

(assert (=> b!90776 t!5349))

(declare-fun b_and!5487 () Bool)

(assert (= b_and!5483 (and (=> t!5349 result!3045) b_and!5487)))

(declare-fun t!5351 () Bool)

(declare-fun tb!1779 () Bool)

(assert (=> (and b!90786 (= (defaultEntry!2397 newMap!16) (defaultEntry!2397 (v!2707 (underlying!307 thiss!992)))) t!5351) tb!1779))

(declare-fun result!3049 () Bool)

(assert (= result!3049 result!3045))

(assert (=> b!90776 t!5351))

(declare-fun b_and!5489 () Bool)

(assert (= b_and!5485 (and (=> t!5351 result!3049) b_and!5489)))

(declare-fun m!97567 () Bool)

(assert (=> mapNonEmpty!3532 m!97567))

(declare-fun m!97569 () Bool)

(assert (=> b!90777 m!97569))

(declare-fun m!97571 () Bool)

(assert (=> b!90777 m!97571))

(declare-fun m!97573 () Bool)

(assert (=> b!90777 m!97573))

(declare-fun m!97575 () Bool)

(assert (=> b!90777 m!97575))

(declare-fun m!97577 () Bool)

(assert (=> b!90777 m!97577))

(declare-fun m!97579 () Bool)

(assert (=> b!90777 m!97579))

(declare-fun m!97581 () Bool)

(assert (=> b!90777 m!97581))

(declare-fun m!97583 () Bool)

(assert (=> b!90777 m!97583))

(declare-fun m!97585 () Bool)

(assert (=> b!90777 m!97585))

(assert (=> b!90777 m!97585))

(declare-fun m!97587 () Bool)

(assert (=> b!90777 m!97587))

(declare-fun m!97589 () Bool)

(assert (=> b!90777 m!97589))

(assert (=> b!90777 m!97577))

(declare-fun m!97591 () Bool)

(assert (=> b!90777 m!97591))

(assert (=> b!90777 m!97577))

(declare-fun m!97593 () Bool)

(assert (=> b!90777 m!97593))

(declare-fun m!97595 () Bool)

(assert (=> b!90786 m!97595))

(declare-fun m!97597 () Bool)

(assert (=> b!90786 m!97597))

(declare-fun m!97599 () Bool)

(assert (=> b!90775 m!97599))

(declare-fun m!97601 () Bool)

(assert (=> b!90775 m!97601))

(declare-fun m!97603 () Bool)

(assert (=> b!90773 m!97603))

(declare-fun m!97605 () Bool)

(assert (=> start!11108 m!97605))

(declare-fun m!97607 () Bool)

(assert (=> b!90783 m!97607))

(declare-fun m!97609 () Bool)

(assert (=> b!90783 m!97609))

(declare-fun m!97611 () Bool)

(assert (=> b!90780 m!97611))

(declare-fun m!97613 () Bool)

(assert (=> b!90780 m!97613))

(assert (=> b!90780 m!97577))

(declare-fun m!97615 () Bool)

(assert (=> b!90780 m!97615))

(assert (=> b!90780 m!97577))

(assert (=> b!90780 m!97577))

(declare-fun m!97617 () Bool)

(assert (=> b!90780 m!97617))

(assert (=> b!90780 m!97577))

(declare-fun m!97619 () Bool)

(assert (=> b!90780 m!97619))

(declare-fun m!97621 () Bool)

(assert (=> mapNonEmpty!3531 m!97621))

(assert (=> b!90788 m!97577))

(assert (=> b!90788 m!97577))

(declare-fun m!97623 () Bool)

(assert (=> b!90788 m!97623))

(assert (=> b!90788 m!97577))

(declare-fun m!97625 () Bool)

(assert (=> b!90788 m!97625))

(assert (=> b!90776 m!97577))

(declare-fun m!97627 () Bool)

(assert (=> b!90776 m!97627))

(declare-fun m!97629 () Bool)

(assert (=> b!90776 m!97629))

(assert (=> b!90776 m!97627))

(assert (=> b!90776 m!97629))

(declare-fun m!97631 () Bool)

(assert (=> b!90776 m!97631))

(check-sat (not b!90783) (not b_next!2311) b_and!5489 tp_is_empty!2571 (not b!90786) (not b!90780) (not start!11108) (not b!90773) b_and!5487 (not b_lambda!4007) (not b!90777) (not mapNonEmpty!3532) (not b!90776) (not b!90775) (not b!90788) (not b_next!2309) (not mapNonEmpty!3531))
(check-sat b_and!5487 b_and!5489 (not b_next!2309) (not b_next!2311))
