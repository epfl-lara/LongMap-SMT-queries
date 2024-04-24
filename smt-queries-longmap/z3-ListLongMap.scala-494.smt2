; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11116 () Bool)

(assert start!11116)

(declare-fun b!90842 () Bool)

(declare-fun b_free!2317 () Bool)

(declare-fun b_next!2317 () Bool)

(assert (=> b!90842 (= b_free!2317 (not b_next!2317))))

(declare-fun tp!9200 () Bool)

(declare-fun b_and!5493 () Bool)

(assert (=> b!90842 (= tp!9200 b_and!5493)))

(declare-fun b!90844 () Bool)

(declare-fun b_free!2319 () Bool)

(declare-fun b_next!2319 () Bool)

(assert (=> b!90844 (= b_free!2319 (not b_next!2319))))

(declare-fun tp!9199 () Bool)

(declare-fun b_and!5495 () Bool)

(assert (=> b!90844 (= tp!9199 b_and!5495)))

(declare-fun b!90841 () Bool)

(declare-fun res!46304 () Bool)

(declare-fun e!59234 () Bool)

(assert (=> b!90841 (=> (not res!46304) (not e!59234))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3081 0))(
  ( (V!3082 (val!1332 Int)) )
))
(declare-datatypes ((array!4103 0))(
  ( (array!4104 (arr!1952 (Array (_ BitVec 32) (_ BitVec 64))) (size!2199 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!944 0))(
  ( (ValueCellFull!944 (v!2714 V!3081)) (EmptyCell!944) )
))
(declare-datatypes ((array!4105 0))(
  ( (array!4106 (arr!1953 (Array (_ BitVec 32) ValueCell!944)) (size!2200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!796 0))(
  ( (LongMapFixedSize!797 (defaultEntry!2399 Int) (mask!6457 (_ BitVec 32)) (extraKeys!2230 (_ BitVec 32)) (zeroValue!2287 V!3081) (minValue!2287 V!3081) (_size!447 (_ BitVec 32)) (_keys!4079 array!4103) (_values!2382 array!4105) (_vacant!447 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!602 0))(
  ( (Cell!603 (v!2715 LongMapFixedSize!796)) )
))
(declare-datatypes ((LongMap!602 0))(
  ( (LongMap!603 (underlying!312 Cell!602)) )
))
(declare-fun thiss!992 () LongMap!602)

(assert (=> b!90841 (= res!46304 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))))))))

(declare-fun mapNonEmpty!3543 () Bool)

(declare-fun mapRes!3544 () Bool)

(declare-fun tp!9202 () Bool)

(declare-fun e!59238 () Bool)

(assert (=> mapNonEmpty!3543 (= mapRes!3544 (and tp!9202 e!59238))))

(declare-fun mapKey!3544 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!796)

(declare-fun mapRest!3543 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapValue!3543 () ValueCell!944)

(assert (=> mapNonEmpty!3543 (= (arr!1953 (_values!2382 newMap!16)) (store mapRest!3543 mapKey!3544 mapValue!3543))))

(declare-fun tp_is_empty!2575 () Bool)

(declare-fun e!59245 () Bool)

(declare-fun e!59239 () Bool)

(declare-fun array_inv!1199 (array!4103) Bool)

(declare-fun array_inv!1200 (array!4105) Bool)

(assert (=> b!90842 (= e!59239 (and tp!9200 tp_is_empty!2575 (array_inv!1199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (array_inv!1200 (_values!2382 (v!2715 (underlying!312 thiss!992)))) e!59245))))

(declare-fun e!59248 () Bool)

(declare-fun e!59236 () Bool)

(assert (=> b!90844 (= e!59236 (and tp!9199 tp_is_empty!2575 (array_inv!1199 (_keys!4079 newMap!16)) (array_inv!1200 (_values!2382 newMap!16)) e!59248))))

(declare-fun b!90845 () Bool)

(declare-fun e!59242 () Bool)

(assert (=> b!90845 (= e!59242 tp_is_empty!2575)))

(declare-fun b!90846 () Bool)

(declare-fun e!59247 () Bool)

(declare-fun e!59241 () Bool)

(assert (=> b!90846 (= e!59247 e!59241)))

(declare-fun res!46298 () Bool)

(assert (=> b!90846 (=> (not res!46298) (not e!59241))))

(assert (=> b!90846 (= res!46298 (and (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44124 () V!3081)

(declare-fun get!1240 (ValueCell!944 V!3081) V!3081)

(declare-fun dynLambda!355 (Int (_ BitVec 64)) V!3081)

(assert (=> b!90846 (= lt!44124 (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90847 () Bool)

(declare-fun e!59246 () Bool)

(assert (=> b!90847 (= e!59248 (and e!59246 mapRes!3544))))

(declare-fun condMapEmpty!3543 () Bool)

(declare-fun mapDefault!3544 () ValueCell!944)

(assert (=> b!90847 (= condMapEmpty!3543 (= (arr!1953 (_values!2382 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3544)))))

(declare-fun b!90848 () Bool)

(declare-fun e!59249 () Bool)

(declare-datatypes ((tuple2!2230 0))(
  ( (tuple2!2231 (_1!1126 Bool) (_2!1126 LongMapFixedSize!796)) )
))
(declare-fun lt!44130 () tuple2!2230)

(declare-fun valid!358 (LongMapFixedSize!796) Bool)

(assert (=> b!90848 (= e!59249 (valid!358 (_2!1126 lt!44130)))))

(declare-fun b!90849 () Bool)

(assert (=> b!90849 (= e!59238 tp_is_empty!2575)))

(declare-fun b!90850 () Bool)

(declare-fun res!46305 () Bool)

(assert (=> b!90850 (=> res!46305 e!59249)))

(assert (=> b!90850 (= res!46305 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!90851 () Bool)

(declare-fun res!46300 () Bool)

(assert (=> b!90851 (=> (not res!46300) (not e!59234))))

(assert (=> b!90851 (= res!46300 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6457 newMap!16)) (_size!447 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!90852 () Bool)

(declare-fun res!46306 () Bool)

(assert (=> b!90852 (=> (not res!46306) (not e!59234))))

(assert (=> b!90852 (= res!46306 (valid!358 newMap!16))))

(declare-fun b!90853 () Bool)

(declare-fun e!59240 () Bool)

(declare-fun mapRes!3543 () Bool)

(assert (=> b!90853 (= e!59245 (and e!59240 mapRes!3543))))

(declare-fun condMapEmpty!3544 () Bool)

(declare-fun mapDefault!3543 () ValueCell!944)

(assert (=> b!90853 (= condMapEmpty!3544 (= (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3543)))))

(declare-fun mapIsEmpty!3543 () Bool)

(assert (=> mapIsEmpty!3543 mapRes!3543))

(declare-fun b!90854 () Bool)

(declare-fun e!59244 () Bool)

(assert (=> b!90854 (= e!59241 e!59244)))

(declare-fun res!46302 () Bool)

(assert (=> b!90854 (=> (not res!46302) (not e!59244))))

(assert (=> b!90854 (= res!46302 (and (_1!1126 lt!44130) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2686 0))(
  ( (Unit!2687) )
))
(declare-fun lt!44118 () Unit!2686)

(declare-fun e!59250 () Unit!2686)

(assert (=> b!90854 (= lt!44118 e!59250)))

(declare-datatypes ((tuple2!2232 0))(
  ( (tuple2!2233 (_1!1127 (_ BitVec 64)) (_2!1127 V!3081)) )
))
(declare-datatypes ((List!1531 0))(
  ( (Nil!1528) (Cons!1527 (h!2119 tuple2!2232) (t!5345 List!1531)) )
))
(declare-datatypes ((ListLongMap!1465 0))(
  ( (ListLongMap!1466 (toList!748 List!1531)) )
))
(declare-fun lt!44121 () ListLongMap!1465)

(declare-fun c!15072 () Bool)

(declare-fun contains!765 (ListLongMap!1465 (_ BitVec 64)) Bool)

(assert (=> b!90854 (= c!15072 (contains!765 lt!44121 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun update!133 (LongMapFixedSize!796 (_ BitVec 64) V!3081) tuple2!2230)

(assert (=> b!90854 (= lt!44130 (update!133 newMap!16 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124))))

(declare-fun mapNonEmpty!3544 () Bool)

(declare-fun tp!9201 () Bool)

(assert (=> mapNonEmpty!3544 (= mapRes!3543 (and tp!9201 e!59242))))

(declare-fun mapValue!3544 () ValueCell!944)

(declare-fun mapRest!3544 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapKey!3543 () (_ BitVec 32))

(assert (=> mapNonEmpty!3544 (= (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (store mapRest!3544 mapKey!3543 mapValue!3544))))

(declare-fun b!90855 () Bool)

(assert (=> b!90855 (= e!59240 tp_is_empty!2575)))

(declare-fun b!90856 () Bool)

(declare-fun Unit!2688 () Unit!2686)

(assert (=> b!90856 (= e!59250 Unit!2688)))

(declare-fun lt!44129 () Unit!2686)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!70 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) (_ BitVec 32) Int) Unit!2686)

(assert (=> b!90856 (= lt!44129 (lemmaListMapContainsThenArrayContainsFrom!70 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90856 (arrayContainsKey!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44114 () Unit!2686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4103 (_ BitVec 32) (_ BitVec 32)) Unit!2686)

(assert (=> b!90856 (= lt!44114 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1532 0))(
  ( (Nil!1529) (Cons!1528 (h!2120 (_ BitVec 64)) (t!5346 List!1532)) )
))
(declare-fun arrayNoDuplicates!0 (array!4103 (_ BitVec 32) List!1532) Bool)

(assert (=> b!90856 (arrayNoDuplicates!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) from!355 Nil!1529)))

(declare-fun lt!44113 () Unit!2686)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4103 (_ BitVec 32) (_ BitVec 64) List!1532) Unit!2686)

(assert (=> b!90856 (= lt!44113 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (Cons!1528 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) Nil!1529)))))

(assert (=> b!90856 false))

(declare-fun b!90843 () Bool)

(declare-fun e!59251 () Bool)

(declare-fun e!59243 () Bool)

(assert (=> b!90843 (= e!59251 e!59243)))

(declare-fun res!46301 () Bool)

(assert (=> start!11116 (=> (not res!46301) (not e!59234))))

(declare-fun valid!359 (LongMap!602) Bool)

(assert (=> start!11116 (= res!46301 (valid!359 thiss!992))))

(assert (=> start!11116 e!59234))

(assert (=> start!11116 e!59251))

(assert (=> start!11116 true))

(assert (=> start!11116 e!59236))

(declare-fun b!90857 () Bool)

(assert (=> b!90857 (= e!59243 e!59239)))

(declare-fun b!90858 () Bool)

(assert (=> b!90858 (= e!59244 (not e!59249))))

(declare-fun res!46303 () Bool)

(assert (=> b!90858 (=> res!46303 e!59249)))

(declare-fun getCurrentListMap!438 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1465)

(declare-fun map!1218 (LongMapFixedSize!796) ListLongMap!1465)

(assert (=> b!90858 (= res!46303 (not (= (getCurrentListMap!438 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) (map!1218 (_2!1126 lt!44130)))))))

(declare-fun lt!44126 () ListLongMap!1465)

(declare-fun lt!44128 () tuple2!2232)

(declare-fun lt!44127 () tuple2!2232)

(declare-fun lt!44119 () ListLongMap!1465)

(declare-fun +!117 (ListLongMap!1465 tuple2!2232) ListLongMap!1465)

(assert (=> b!90858 (= (+!117 lt!44126 lt!44127) (+!117 (+!117 lt!44119 lt!44127) lt!44128))))

(assert (=> b!90858 (= lt!44127 (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44123 () Unit!2686)

(declare-fun addCommutativeForDiffKeys!37 (ListLongMap!1465 (_ BitVec 64) V!3081 (_ BitVec 64) V!3081) Unit!2686)

(assert (=> b!90858 (= lt!44123 (addCommutativeForDiffKeys!37 lt!44119 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44115 () ListLongMap!1465)

(assert (=> b!90858 (= lt!44115 lt!44126)))

(assert (=> b!90858 (= lt!44126 (+!117 lt!44119 lt!44128))))

(declare-fun lt!44120 () ListLongMap!1465)

(declare-fun lt!44125 () tuple2!2232)

(assert (=> b!90858 (= lt!44115 (+!117 lt!44120 lt!44125))))

(declare-fun lt!44116 () ListLongMap!1465)

(assert (=> b!90858 (= lt!44119 (+!117 lt!44116 lt!44125))))

(assert (=> b!90858 (= lt!44125 (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(assert (=> b!90858 (= lt!44120 (+!117 lt!44116 lt!44128))))

(assert (=> b!90858 (= lt!44128 (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124))))

(declare-fun lt!44117 () Unit!2686)

(assert (=> b!90858 (= lt!44117 (addCommutativeForDiffKeys!37 lt!44116 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!82 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1465)

(assert (=> b!90858 (= lt!44116 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!90859 () Bool)

(declare-fun Unit!2689 () Unit!2686)

(assert (=> b!90859 (= e!59250 Unit!2689)))

(declare-fun mapIsEmpty!3544 () Bool)

(assert (=> mapIsEmpty!3544 mapRes!3544))

(declare-fun b!90860 () Bool)

(assert (=> b!90860 (= e!59234 e!59247)))

(declare-fun res!46299 () Bool)

(assert (=> b!90860 (=> (not res!46299) (not e!59247))))

(declare-fun lt!44122 () ListLongMap!1465)

(assert (=> b!90860 (= res!46299 (= lt!44122 lt!44121))))

(assert (=> b!90860 (= lt!44121 (map!1218 newMap!16))))

(assert (=> b!90860 (= lt!44122 (getCurrentListMap!438 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!90861 () Bool)

(assert (=> b!90861 (= e!59246 tp_is_empty!2575)))

(assert (= (and start!11116 res!46301) b!90841))

(assert (= (and b!90841 res!46304) b!90852))

(assert (= (and b!90852 res!46306) b!90851))

(assert (= (and b!90851 res!46300) b!90860))

(assert (= (and b!90860 res!46299) b!90846))

(assert (= (and b!90846 res!46298) b!90854))

(assert (= (and b!90854 c!15072) b!90856))

(assert (= (and b!90854 (not c!15072)) b!90859))

(assert (= (and b!90854 res!46302) b!90858))

(assert (= (and b!90858 (not res!46303)) b!90850))

(assert (= (and b!90850 (not res!46305)) b!90848))

(assert (= (and b!90853 condMapEmpty!3544) mapIsEmpty!3543))

(assert (= (and b!90853 (not condMapEmpty!3544)) mapNonEmpty!3544))

(get-info :version)

(assert (= (and mapNonEmpty!3544 ((_ is ValueCellFull!944) mapValue!3544)) b!90845))

(assert (= (and b!90853 ((_ is ValueCellFull!944) mapDefault!3543)) b!90855))

(assert (= b!90842 b!90853))

(assert (= b!90857 b!90842))

(assert (= b!90843 b!90857))

(assert (= start!11116 b!90843))

(assert (= (and b!90847 condMapEmpty!3543) mapIsEmpty!3544))

(assert (= (and b!90847 (not condMapEmpty!3543)) mapNonEmpty!3543))

(assert (= (and mapNonEmpty!3543 ((_ is ValueCellFull!944) mapValue!3543)) b!90849))

(assert (= (and b!90847 ((_ is ValueCellFull!944) mapDefault!3544)) b!90861))

(assert (= b!90844 b!90847))

(assert (= start!11116 b!90844))

(declare-fun b_lambda!4009 () Bool)

(assert (=> (not b_lambda!4009) (not b!90846)))

(declare-fun t!5342 () Bool)

(declare-fun tb!1781 () Bool)

(assert (=> (and b!90842 (= (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) t!5342) tb!1781))

(declare-fun result!3053 () Bool)

(assert (=> tb!1781 (= result!3053 tp_is_empty!2575)))

(assert (=> b!90846 t!5342))

(declare-fun b_and!5497 () Bool)

(assert (= b_and!5493 (and (=> t!5342 result!3053) b_and!5497)))

(declare-fun tb!1783 () Bool)

(declare-fun t!5344 () Bool)

(assert (=> (and b!90844 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) t!5344) tb!1783))

(declare-fun result!3057 () Bool)

(assert (= result!3057 result!3053))

(assert (=> b!90846 t!5344))

(declare-fun b_and!5499 () Bool)

(assert (= b_and!5495 (and (=> t!5344 result!3057) b_and!5499)))

(declare-fun m!97519 () Bool)

(assert (=> b!90846 m!97519))

(declare-fun m!97521 () Bool)

(assert (=> b!90846 m!97521))

(declare-fun m!97523 () Bool)

(assert (=> b!90846 m!97523))

(assert (=> b!90846 m!97521))

(assert (=> b!90846 m!97523))

(declare-fun m!97525 () Bool)

(assert (=> b!90846 m!97525))

(declare-fun m!97527 () Bool)

(assert (=> start!11116 m!97527))

(declare-fun m!97529 () Bool)

(assert (=> b!90848 m!97529))

(declare-fun m!97531 () Bool)

(assert (=> b!90860 m!97531))

(declare-fun m!97533 () Bool)

(assert (=> b!90860 m!97533))

(declare-fun m!97535 () Bool)

(assert (=> mapNonEmpty!3544 m!97535))

(declare-fun m!97537 () Bool)

(assert (=> b!90856 m!97537))

(declare-fun m!97539 () Bool)

(assert (=> b!90856 m!97539))

(assert (=> b!90856 m!97519))

(declare-fun m!97541 () Bool)

(assert (=> b!90856 m!97541))

(assert (=> b!90856 m!97519))

(assert (=> b!90856 m!97519))

(declare-fun m!97543 () Bool)

(assert (=> b!90856 m!97543))

(assert (=> b!90856 m!97519))

(declare-fun m!97545 () Bool)

(assert (=> b!90856 m!97545))

(declare-fun m!97547 () Bool)

(assert (=> b!90852 m!97547))

(declare-fun m!97549 () Bool)

(assert (=> b!90844 m!97549))

(declare-fun m!97551 () Bool)

(assert (=> b!90844 m!97551))

(assert (=> b!90858 m!97519))

(declare-fun m!97553 () Bool)

(assert (=> b!90858 m!97553))

(declare-fun m!97555 () Bool)

(assert (=> b!90858 m!97555))

(declare-fun m!97557 () Bool)

(assert (=> b!90858 m!97557))

(declare-fun m!97559 () Bool)

(assert (=> b!90858 m!97559))

(declare-fun m!97561 () Bool)

(assert (=> b!90858 m!97561))

(assert (=> b!90858 m!97519))

(assert (=> b!90858 m!97519))

(declare-fun m!97563 () Bool)

(assert (=> b!90858 m!97563))

(assert (=> b!90858 m!97561))

(declare-fun m!97565 () Bool)

(assert (=> b!90858 m!97565))

(declare-fun m!97567 () Bool)

(assert (=> b!90858 m!97567))

(declare-fun m!97569 () Bool)

(assert (=> b!90858 m!97569))

(declare-fun m!97571 () Bool)

(assert (=> b!90858 m!97571))

(declare-fun m!97573 () Bool)

(assert (=> b!90858 m!97573))

(declare-fun m!97575 () Bool)

(assert (=> b!90858 m!97575))

(declare-fun m!97577 () Bool)

(assert (=> mapNonEmpty!3543 m!97577))

(declare-fun m!97579 () Bool)

(assert (=> b!90842 m!97579))

(declare-fun m!97581 () Bool)

(assert (=> b!90842 m!97581))

(assert (=> b!90854 m!97519))

(assert (=> b!90854 m!97519))

(declare-fun m!97583 () Bool)

(assert (=> b!90854 m!97583))

(assert (=> b!90854 m!97519))

(declare-fun m!97585 () Bool)

(assert (=> b!90854 m!97585))

(check-sat (not b!90858) b_and!5497 (not b!90856) (not b_next!2317) tp_is_empty!2575 (not mapNonEmpty!3544) (not b!90846) (not b_next!2319) (not b!90842) (not b!90844) (not b!90860) (not b!90854) (not mapNonEmpty!3543) b_and!5499 (not b!90852) (not b_lambda!4009) (not start!11116) (not b!90848))
(check-sat b_and!5497 b_and!5499 (not b_next!2317) (not b_next!2319))
(get-model)

(declare-fun b_lambda!4015 () Bool)

(assert (= b_lambda!4009 (or (and b!90842 b_free!2317) (and b!90844 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))) b_lambda!4015)))

(check-sat (not b!90858) b_and!5497 (not b!90856) (not b_next!2317) tp_is_empty!2575 (not mapNonEmpty!3544) (not b!90846) (not b_next!2319) (not b!90842) (not b!90844) (not b!90860) (not b!90854) (not mapNonEmpty!3543) b_and!5499 (not b!90852) (not b_lambda!4015) (not start!11116) (not b!90848))
(check-sat b_and!5497 b_and!5499 (not b_next!2317) (not b_next!2319))
(get-model)

(declare-fun d!24039 () Bool)

(declare-fun e!59365 () Bool)

(assert (=> d!24039 e!59365))

(declare-fun res!46363 () Bool)

(assert (=> d!24039 (=> res!46363 e!59365)))

(declare-fun lt!44249 () Bool)

(assert (=> d!24039 (= res!46363 (not lt!44249))))

(declare-fun lt!44248 () Bool)

(assert (=> d!24039 (= lt!44249 lt!44248)))

(declare-fun lt!44250 () Unit!2686)

(declare-fun e!59364 () Unit!2686)

(assert (=> d!24039 (= lt!44250 e!59364)))

(declare-fun c!15081 () Bool)

(assert (=> d!24039 (= c!15081 lt!44248)))

(declare-fun containsKey!148 (List!1531 (_ BitVec 64)) Bool)

(assert (=> d!24039 (= lt!44248 (containsKey!148 (toList!748 lt!44121) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(assert (=> d!24039 (= (contains!765 lt!44121 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)) lt!44249)))

(declare-fun b!91000 () Bool)

(declare-fun lt!44247 () Unit!2686)

(assert (=> b!91000 (= e!59364 lt!44247)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!96 (List!1531 (_ BitVec 64)) Unit!2686)

(assert (=> b!91000 (= lt!44247 (lemmaContainsKeyImpliesGetValueByKeyDefined!96 (toList!748 lt!44121) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-datatypes ((Option!151 0))(
  ( (Some!150 (v!2721 V!3081)) (None!149) )
))
(declare-fun isDefined!97 (Option!151) Bool)

(declare-fun getValueByKey!145 (List!1531 (_ BitVec 64)) Option!151)

(assert (=> b!91000 (isDefined!97 (getValueByKey!145 (toList!748 lt!44121) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91001 () Bool)

(declare-fun Unit!2697 () Unit!2686)

(assert (=> b!91001 (= e!59364 Unit!2697)))

(declare-fun b!91002 () Bool)

(assert (=> b!91002 (= e!59365 (isDefined!97 (getValueByKey!145 (toList!748 lt!44121) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))))

(assert (= (and d!24039 c!15081) b!91000))

(assert (= (and d!24039 (not c!15081)) b!91001))

(assert (= (and d!24039 (not res!46363)) b!91002))

(assert (=> d!24039 m!97519))

(declare-fun m!97723 () Bool)

(assert (=> d!24039 m!97723))

(assert (=> b!91000 m!97519))

(declare-fun m!97725 () Bool)

(assert (=> b!91000 m!97725))

(assert (=> b!91000 m!97519))

(declare-fun m!97727 () Bool)

(assert (=> b!91000 m!97727))

(assert (=> b!91000 m!97727))

(declare-fun m!97729 () Bool)

(assert (=> b!91000 m!97729))

(assert (=> b!91002 m!97519))

(assert (=> b!91002 m!97727))

(assert (=> b!91002 m!97727))

(assert (=> b!91002 m!97729))

(assert (=> b!90854 d!24039))

(declare-fun b!91079 () Bool)

(declare-fun lt!44308 () Unit!2686)

(declare-fun lt!44328 () Unit!2686)

(assert (=> b!91079 (= lt!44308 lt!44328)))

(declare-fun call!8863 () ListLongMap!1465)

(declare-fun call!8876 () ListLongMap!1465)

(assert (=> b!91079 (= call!8863 call!8876)))

(declare-fun lt!44313 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 V!3081 Int) Unit!2686)

(assert (=> b!91079 (= lt!44328 (lemmaChangeLongMinValueKeyThenAddPairToListMap!35 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) lt!44313 (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) lt!44124 (defaultEntry!2399 newMap!16)))))

(assert (=> b!91079 (= lt!44313 (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!59414 () tuple2!2230)

(assert (=> b!91079 (= e!59414 (tuple2!2231 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6457 newMap!16) (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000010) (zeroValue!2287 newMap!16) lt!44124 (_size!447 newMap!16) (_keys!4079 newMap!16) (_values!2382 newMap!16) (_vacant!447 newMap!16))))))

(declare-fun b!91080 () Bool)

(declare-fun e!59417 () Unit!2686)

(declare-fun Unit!2698 () Unit!2686)

(assert (=> b!91080 (= e!59417 Unit!2698)))

(declare-fun lt!44314 () Unit!2686)

(declare-fun call!8867 () Unit!2686)

(assert (=> b!91080 (= lt!44314 call!8867)))

(declare-datatypes ((SeekEntryResult!241 0))(
  ( (MissingZero!241 (index!3104 (_ BitVec 32))) (Found!241 (index!3105 (_ BitVec 32))) (Intermediate!241 (undefined!1053 Bool) (index!3106 (_ BitVec 32)) (x!12399 (_ BitVec 32))) (Undefined!241) (MissingVacant!241 (index!3107 (_ BitVec 32))) )
))
(declare-fun lt!44325 () SeekEntryResult!241)

(declare-fun call!8872 () SeekEntryResult!241)

(assert (=> b!91080 (= lt!44325 call!8872)))

(declare-fun res!46401 () Bool)

(assert (=> b!91080 (= res!46401 ((_ is Found!241) lt!44325))))

(declare-fun e!59420 () Bool)

(assert (=> b!91080 (=> (not res!46401) (not e!59420))))

(assert (=> b!91080 e!59420))

(declare-fun lt!44310 () Unit!2686)

(assert (=> b!91080 (= lt!44310 lt!44314)))

(assert (=> b!91080 false))

(declare-fun b!91081 () Bool)

(declare-fun lt!44326 () SeekEntryResult!241)

(declare-fun e!59415 () Bool)

(assert (=> b!91081 (= e!59415 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3105 lt!44326)) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91082 () Bool)

(declare-fun e!59424 () Bool)

(declare-fun e!59423 () Bool)

(assert (=> b!91082 (= e!59424 e!59423)))

(declare-fun call!8860 () ListLongMap!1465)

(declare-fun res!46396 () Bool)

(assert (=> b!91082 (= res!46396 (contains!765 call!8860 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(assert (=> b!91082 (=> (not res!46396) (not e!59423))))

(declare-fun b!91083 () Bool)

(declare-fun res!46394 () Bool)

(declare-fun call!8855 () Bool)

(assert (=> b!91083 (= res!46394 call!8855)))

(assert (=> b!91083 (=> (not res!46394) (not e!59415))))

(declare-fun b!91084 () Bool)

(declare-fun c!15115 () Bool)

(declare-fun lt!44330 () SeekEntryResult!241)

(assert (=> b!91084 (= c!15115 ((_ is MissingVacant!241) lt!44330))))

(declare-fun e!59416 () tuple2!2230)

(declare-fun e!59422 () tuple2!2230)

(assert (=> b!91084 (= e!59416 e!59422)))

(declare-fun bm!8852 () Bool)

(declare-fun c!15107 () Bool)

(declare-fun lt!44316 () (_ BitVec 32))

(declare-fun c!15109 () Bool)

(declare-fun call!8861 () ListLongMap!1465)

(assert (=> bm!8852 (= call!8861 (getCurrentListMap!438 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (ite (and c!15109 c!15107) lt!44316 (extraKeys!2230 newMap!16)) (ite (and c!15109 c!15107) lt!44124 (zeroValue!2287 newMap!16)) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun bm!8853 () Bool)

(declare-fun call!8866 () Bool)

(declare-fun call!8857 () Bool)

(assert (=> bm!8853 (= call!8866 call!8857)))

(declare-fun b!91085 () Bool)

(declare-fun res!46399 () Bool)

(declare-fun e!59412 () Bool)

(assert (=> b!91085 (=> (not res!46399) (not e!59412))))

(declare-fun lt!44323 () SeekEntryResult!241)

(assert (=> b!91085 (= res!46399 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3104 lt!44323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91086 () Bool)

(declare-fun e!59421 () Unit!2686)

(declare-fun lt!44315 () Unit!2686)

(assert (=> b!91086 (= e!59421 lt!44315)))

(assert (=> b!91086 (= lt!44315 call!8867)))

(declare-fun call!8871 () SeekEntryResult!241)

(assert (=> b!91086 (= lt!44326 call!8871)))

(declare-fun res!46392 () Bool)

(assert (=> b!91086 (= res!46392 ((_ is Found!241) lt!44326))))

(assert (=> b!91086 (=> (not res!46392) (not e!59415))))

(assert (=> b!91086 e!59415))

(declare-fun b!91087 () Bool)

(declare-fun res!46400 () Bool)

(declare-fun e!59413 () Bool)

(assert (=> b!91087 (=> (not res!46400) (not e!59413))))

(declare-fun call!8864 () Bool)

(assert (=> b!91087 (= res!46400 call!8864)))

(declare-fun e!59425 () Bool)

(assert (=> b!91087 (= e!59425 e!59413)))

(declare-fun b!91088 () Bool)

(declare-fun e!59407 () Bool)

(declare-fun e!59418 () Bool)

(assert (=> b!91088 (= e!59407 e!59418)))

(declare-fun res!46402 () Bool)

(declare-fun call!8865 () Bool)

(assert (=> b!91088 (= res!46402 call!8865)))

(assert (=> b!91088 (=> (not res!46402) (not e!59418))))

(declare-fun bm!8854 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) Int) Unit!2686)

(assert (=> bm!8854 (= call!8867 (lemmaInListMapThenSeekEntryOrOpenFindsIt!35 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (defaultEntry!2399 newMap!16)))))

(declare-fun bm!8855 () Bool)

(declare-fun call!8873 () ListLongMap!1465)

(assert (=> bm!8855 (= call!8873 (map!1218 newMap!16))))

(declare-fun b!91089 () Bool)

(declare-fun c!15116 () Bool)

(declare-fun lt!44319 () SeekEntryResult!241)

(assert (=> b!91089 (= c!15116 ((_ is MissingVacant!241) lt!44319))))

(declare-fun e!59411 () Bool)

(assert (=> b!91089 (= e!59425 e!59411)))

(declare-fun b!91090 () Bool)

(declare-fun e!59409 () tuple2!2230)

(assert (=> b!91090 (= e!59409 e!59414)))

(assert (=> b!91090 (= c!15107 (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91091 () Bool)

(assert (=> b!91091 (= e!59424 (= call!8860 call!8873))))

(declare-fun bm!8856 () Bool)

(declare-fun call!8878 () Bool)

(declare-fun c!15111 () Bool)

(declare-fun call!8869 () ListLongMap!1465)

(assert (=> bm!8856 (= call!8878 (contains!765 call!8869 (ite c!15111 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (select (arr!1952 (_keys!4079 newMap!16)) (index!3105 lt!44330)))))))

(declare-fun b!91092 () Bool)

(declare-fun res!46398 () Bool)

(assert (=> b!91092 (=> (not res!46398) (not e!59413))))

(assert (=> b!91092 (= res!46398 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3104 lt!44319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91093 () Bool)

(declare-fun lt!44305 () Unit!2686)

(assert (=> b!91093 (= e!59417 lt!44305)))

(declare-fun call!8877 () Unit!2686)

(assert (=> b!91093 (= lt!44305 call!8877)))

(assert (=> b!91093 (= lt!44319 call!8872)))

(declare-fun c!15114 () Bool)

(assert (=> b!91093 (= c!15114 ((_ is MissingZero!241) lt!44319))))

(assert (=> b!91093 e!59425))

(declare-fun bm!8857 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) Int) Unit!2686)

(assert (=> bm!8857 (= call!8877 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!35 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (defaultEntry!2399 newMap!16)))))

(declare-fun b!91094 () Bool)

(declare-fun Unit!2699 () Unit!2686)

(assert (=> b!91094 (= e!59421 Unit!2699)))

(declare-fun lt!44309 () Unit!2686)

(assert (=> b!91094 (= lt!44309 call!8877)))

(assert (=> b!91094 (= lt!44323 call!8871)))

(declare-fun c!15117 () Bool)

(assert (=> b!91094 (= c!15117 ((_ is MissingZero!241) lt!44323))))

(declare-fun e!59410 () Bool)

(assert (=> b!91094 e!59410))

(declare-fun lt!44329 () Unit!2686)

(assert (=> b!91094 (= lt!44329 lt!44309)))

(assert (=> b!91094 false))

(declare-fun b!91095 () Bool)

(declare-fun res!46393 () Bool)

(declare-fun call!8870 () Bool)

(assert (=> b!91095 (= res!46393 call!8870)))

(assert (=> b!91095 (=> (not res!46393) (not e!59420))))

(declare-fun d!24041 () Bool)

(declare-fun e!59406 () Bool)

(assert (=> d!24041 e!59406))

(declare-fun res!46397 () Bool)

(assert (=> d!24041 (=> (not res!46397) (not e!59406))))

(declare-fun lt!44317 () tuple2!2230)

(assert (=> d!24041 (= res!46397 (valid!358 (_2!1126 lt!44317)))))

(assert (=> d!24041 (= lt!44317 e!59409)))

(assert (=> d!24041 (= c!15109 (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvneg (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))))

(assert (=> d!24041 (valid!358 newMap!16)))

(assert (=> d!24041 (= (update!133 newMap!16 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124) lt!44317)))

(declare-fun b!91096 () Bool)

(assert (=> b!91096 (= e!59407 ((_ is Undefined!241) lt!44323))))

(declare-fun bm!8858 () Bool)

(declare-fun call!8856 () ListLongMap!1465)

(assert (=> bm!8858 (= call!8856 (getCurrentListMap!438 (_keys!4079 newMap!16) (ite c!15109 (_values!2382 newMap!16) (array!4106 (store (arr!1953 (_values!2382 newMap!16)) (index!3105 lt!44330) (ValueCellFull!944 lt!44124)) (size!2200 (_values!2382 newMap!16)))) (mask!6457 newMap!16) (ite c!15109 (ite c!15107 (extraKeys!2230 newMap!16) lt!44313) (extraKeys!2230 newMap!16)) (zeroValue!2287 newMap!16) (ite c!15109 (ite c!15107 (minValue!2287 newMap!16) lt!44124) (minValue!2287 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun b!91097 () Bool)

(declare-fun call!8858 () Bool)

(assert (=> b!91097 (= e!59413 (not call!8858))))

(declare-fun b!91098 () Bool)

(assert (=> b!91098 (= e!59406 e!59424)))

(declare-fun c!15112 () Bool)

(assert (=> b!91098 (= c!15112 (_1!1126 lt!44317))))

(declare-fun call!8859 () tuple2!2230)

(declare-fun bm!8859 () Bool)

(declare-fun updateHelperNewKey!35 (LongMapFixedSize!796 (_ BitVec 64) V!3081 (_ BitVec 32)) tuple2!2230)

(assert (=> bm!8859 (= call!8859 (updateHelperNewKey!35 newMap!16 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 (ite c!15115 (index!3107 lt!44330) (index!3104 lt!44330))))))

(declare-fun b!91099 () Bool)

(declare-fun res!46404 () Bool)

(assert (=> b!91099 (=> (not res!46404) (not e!59412))))

(assert (=> b!91099 (= res!46404 call!8865)))

(assert (=> b!91099 (= e!59410 e!59412)))

(declare-fun b!91100 () Bool)

(declare-fun res!46405 () Bool)

(assert (=> b!91100 (= res!46405 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3107 lt!44319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!59419 () Bool)

(assert (=> b!91100 (=> (not res!46405) (not e!59419))))

(declare-fun b!91101 () Bool)

(declare-fun lt!44307 () Unit!2686)

(assert (=> b!91101 (= lt!44307 e!59417)))

(declare-fun c!15113 () Bool)

(assert (=> b!91101 (= c!15113 call!8878)))

(assert (=> b!91101 (= e!59416 (tuple2!2231 false newMap!16))))

(declare-fun b!91102 () Bool)

(declare-fun lt!44324 () tuple2!2230)

(assert (=> b!91102 (= lt!44324 call!8859)))

(declare-fun e!59408 () tuple2!2230)

(assert (=> b!91102 (= e!59408 (tuple2!2231 (_1!1126 lt!44324) (_2!1126 lt!44324)))))

(declare-fun bm!8860 () Bool)

(assert (=> bm!8860 (= call!8865 call!8855)))

(declare-fun b!91103 () Bool)

(assert (=> b!91103 (= e!59412 (not call!8866))))

(declare-fun b!91104 () Bool)

(declare-fun lt!44320 () Unit!2686)

(declare-fun lt!44312 () Unit!2686)

(assert (=> b!91104 (= lt!44320 lt!44312)))

(assert (=> b!91104 call!8878))

(declare-fun lt!44318 () array!4105)

(declare-fun lemmaValidKeyInArrayIsInListMap!95 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) Unit!2686)

(assert (=> b!91104 (= lt!44312 (lemmaValidKeyInArrayIsInListMap!95 (_keys!4079 newMap!16) lt!44318 (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (index!3105 lt!44330) (defaultEntry!2399 newMap!16)))))

(assert (=> b!91104 (= lt!44318 (array!4106 (store (arr!1953 (_values!2382 newMap!16)) (index!3105 lt!44330) (ValueCellFull!944 lt!44124)) (size!2200 (_values!2382 newMap!16))))))

(declare-fun lt!44321 () Unit!2686)

(declare-fun lt!44322 () Unit!2686)

(assert (=> b!91104 (= lt!44321 lt!44322)))

(declare-fun call!8874 () ListLongMap!1465)

(assert (=> b!91104 (= call!8874 call!8856)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) (_ BitVec 64) V!3081 Int) Unit!2686)

(assert (=> b!91104 (= lt!44322 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!35 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (index!3105 lt!44330) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 (defaultEntry!2399 newMap!16)))))

(declare-fun lt!44306 () Unit!2686)

(assert (=> b!91104 (= lt!44306 e!59421)))

(declare-fun c!15106 () Bool)

(assert (=> b!91104 (= c!15106 (contains!765 call!8861 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(assert (=> b!91104 (= e!59408 (tuple2!2231 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) (_size!447 newMap!16) (_keys!4079 newMap!16) (array!4106 (store (arr!1953 (_values!2382 newMap!16)) (index!3105 lt!44330) (ValueCellFull!944 lt!44124)) (size!2200 (_values!2382 newMap!16))) (_vacant!447 newMap!16))))))

(declare-fun b!91105 () Bool)

(assert (=> b!91105 (= e!59418 (not call!8866))))

(declare-fun bm!8861 () Bool)

(declare-fun call!8862 () ListLongMap!1465)

(assert (=> bm!8861 (= call!8862 call!8861)))

(declare-fun bm!8862 () Bool)

(assert (=> bm!8862 (= call!8860 (map!1218 (_2!1126 lt!44317)))))

(declare-fun b!91106 () Bool)

(declare-fun lt!44311 () tuple2!2230)

(assert (=> b!91106 (= e!59422 (tuple2!2231 (_1!1126 lt!44311) (_2!1126 lt!44311)))))

(assert (=> b!91106 (= lt!44311 call!8859)))

(declare-fun bm!8863 () Bool)

(assert (=> bm!8863 (= call!8869 (getCurrentListMap!438 (_keys!4079 newMap!16) (ite c!15111 (_values!2382 newMap!16) lt!44318) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun b!91107 () Bool)

(assert (=> b!91107 (= e!59422 e!59408)))

(declare-fun c!15110 () Bool)

(assert (=> b!91107 (= c!15110 ((_ is MissingZero!241) lt!44330))))

(declare-fun bm!8864 () Bool)

(assert (=> bm!8864 (= call!8876 call!8856)))

(declare-fun b!91108 () Bool)

(declare-fun res!46395 () Bool)

(assert (=> b!91108 (= res!46395 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3107 lt!44323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91108 (=> (not res!46395) (not e!59418))))

(declare-fun bm!8865 () Bool)

(assert (=> bm!8865 (= call!8864 call!8870)))

(declare-fun b!91109 () Bool)

(assert (=> b!91109 (= e!59409 e!59416)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4103 (_ BitVec 32)) SeekEntryResult!241)

(assert (=> b!91109 (= lt!44330 (seekEntryOrOpen!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (_keys!4079 newMap!16) (mask!6457 newMap!16)))))

(assert (=> b!91109 (= c!15111 ((_ is Undefined!241) lt!44330))))

(declare-fun b!91110 () Bool)

(declare-fun c!15108 () Bool)

(assert (=> b!91110 (= c!15108 ((_ is MissingVacant!241) lt!44323))))

(assert (=> b!91110 (= e!59410 e!59407)))

(declare-fun b!91111 () Bool)

(declare-fun lt!44331 () Unit!2686)

(declare-fun lt!44327 () Unit!2686)

(assert (=> b!91111 (= lt!44331 lt!44327)))

(assert (=> b!91111 (= call!8863 call!8862)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!35 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 V!3081 Int) Unit!2686)

(assert (=> b!91111 (= lt!44327 (lemmaChangeZeroKeyThenAddPairToListMap!35 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) lt!44316 (zeroValue!2287 newMap!16) lt!44124 (minValue!2287 newMap!16) (defaultEntry!2399 newMap!16)))))

(assert (=> b!91111 (= lt!44316 (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!91111 (= e!59414 (tuple2!2231 true (LongMapFixedSize!797 (defaultEntry!2399 newMap!16) (mask!6457 newMap!16) (bvor (extraKeys!2230 newMap!16) #b00000000000000000000000000000001) lt!44124 (minValue!2287 newMap!16) (_size!447 newMap!16) (_keys!4079 newMap!16) (_values!2382 newMap!16) (_vacant!447 newMap!16))))))

(declare-fun bm!8866 () Bool)

(assert (=> bm!8866 (= call!8874 (+!117 (ite c!15109 (ite c!15107 call!8876 call!8862) call!8861) (ite c!15109 (ite c!15107 (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44124) (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44124)) (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124))))))

(declare-fun b!91112 () Bool)

(assert (=> b!91112 (= e!59411 ((_ is Undefined!241) lt!44319))))

(declare-fun bm!8867 () Bool)

(declare-fun call!8868 () Bool)

(assert (=> bm!8867 (= call!8855 call!8868)))

(declare-fun bm!8868 () Bool)

(declare-fun call!8875 () SeekEntryResult!241)

(assert (=> bm!8868 (= call!8871 call!8875)))

(declare-fun bm!8869 () Bool)

(assert (=> bm!8869 (= call!8857 (arrayContainsKey!0 (_keys!4079 newMap!16) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!8870 () Bool)

(assert (=> bm!8870 (= call!8872 call!8875)))

(declare-fun bm!8871 () Bool)

(assert (=> bm!8871 (= call!8870 call!8868)))

(declare-fun bm!8872 () Bool)

(assert (=> bm!8872 (= call!8863 call!8874)))

(declare-fun bm!8873 () Bool)

(assert (=> bm!8873 (= call!8858 call!8857)))

(declare-fun b!91113 () Bool)

(assert (=> b!91113 (= e!59420 (= (select (arr!1952 (_keys!4079 newMap!16)) (index!3105 lt!44325)) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91114 () Bool)

(assert (=> b!91114 (= e!59423 (= call!8860 (+!117 call!8873 (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124))))))

(declare-fun b!91115 () Bool)

(assert (=> b!91115 (= e!59419 (not call!8858))))

(declare-fun bm!8874 () Bool)

(assert (=> bm!8874 (= call!8875 (seekEntryOrOpen!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (_keys!4079 newMap!16) (mask!6457 newMap!16)))))

(declare-fun bm!8875 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8875 (= call!8868 (inRange!0 (ite c!15111 (ite c!15113 (index!3105 lt!44325) (ite c!15114 (index!3104 lt!44319) (index!3107 lt!44319))) (ite c!15106 (index!3105 lt!44326) (ite c!15117 (index!3104 lt!44323) (index!3107 lt!44323)))) (mask!6457 newMap!16)))))

(declare-fun b!91116 () Bool)

(assert (=> b!91116 (= e!59411 e!59419)))

(declare-fun res!46403 () Bool)

(assert (=> b!91116 (= res!46403 call!8864)))

(assert (=> b!91116 (=> (not res!46403) (not e!59419))))

(assert (= (and d!24041 c!15109) b!91090))

(assert (= (and d!24041 (not c!15109)) b!91109))

(assert (= (and b!91090 c!15107) b!91111))

(assert (= (and b!91090 (not c!15107)) b!91079))

(assert (= (or b!91111 b!91079) bm!8864))

(assert (= (or b!91111 b!91079) bm!8861))

(assert (= (or b!91111 b!91079) bm!8872))

(assert (= (and b!91109 c!15111) b!91101))

(assert (= (and b!91109 (not c!15111)) b!91084))

(assert (= (and b!91101 c!15113) b!91080))

(assert (= (and b!91101 (not c!15113)) b!91093))

(assert (= (and b!91080 res!46401) b!91095))

(assert (= (and b!91095 res!46393) b!91113))

(assert (= (and b!91093 c!15114) b!91087))

(assert (= (and b!91093 (not c!15114)) b!91089))

(assert (= (and b!91087 res!46400) b!91092))

(assert (= (and b!91092 res!46398) b!91097))

(assert (= (and b!91089 c!15116) b!91116))

(assert (= (and b!91089 (not c!15116)) b!91112))

(assert (= (and b!91116 res!46403) b!91100))

(assert (= (and b!91100 res!46405) b!91115))

(assert (= (or b!91087 b!91116) bm!8865))

(assert (= (or b!91097 b!91115) bm!8873))

(assert (= (or b!91095 bm!8865) bm!8871))

(assert (= (or b!91080 b!91093) bm!8870))

(assert (= (and b!91084 c!15115) b!91106))

(assert (= (and b!91084 (not c!15115)) b!91107))

(assert (= (and b!91107 c!15110) b!91102))

(assert (= (and b!91107 (not c!15110)) b!91104))

(assert (= (and b!91104 c!15106) b!91086))

(assert (= (and b!91104 (not c!15106)) b!91094))

(assert (= (and b!91086 res!46392) b!91083))

(assert (= (and b!91083 res!46394) b!91081))

(assert (= (and b!91094 c!15117) b!91099))

(assert (= (and b!91094 (not c!15117)) b!91110))

(assert (= (and b!91099 res!46404) b!91085))

(assert (= (and b!91085 res!46399) b!91103))

(assert (= (and b!91110 c!15108) b!91088))

(assert (= (and b!91110 (not c!15108)) b!91096))

(assert (= (and b!91088 res!46402) b!91108))

(assert (= (and b!91108 res!46395) b!91105))

(assert (= (or b!91099 b!91088) bm!8860))

(assert (= (or b!91103 b!91105) bm!8853))

(assert (= (or b!91083 bm!8860) bm!8867))

(assert (= (or b!91086 b!91094) bm!8868))

(assert (= (or b!91106 b!91102) bm!8859))

(assert (= (or b!91101 b!91104) bm!8863))

(assert (= (or bm!8870 bm!8868) bm!8874))

(assert (= (or bm!8873 bm!8853) bm!8869))

(assert (= (or b!91093 b!91094) bm!8857))

(assert (= (or bm!8871 bm!8867) bm!8875))

(assert (= (or b!91080 b!91086) bm!8854))

(assert (= (or b!91101 b!91104) bm!8856))

(assert (= (or bm!8864 b!91104) bm!8858))

(assert (= (or bm!8861 b!91104) bm!8852))

(assert (= (or bm!8872 b!91104) bm!8866))

(assert (= (and d!24041 res!46397) b!91098))

(assert (= (and b!91098 c!15112) b!91082))

(assert (= (and b!91098 (not c!15112)) b!91091))

(assert (= (and b!91082 res!46396) b!91114))

(assert (= (or b!91114 b!91091) bm!8855))

(assert (= (or b!91082 b!91114 b!91091) bm!8862))

(assert (=> b!91082 m!97519))

(declare-fun m!97731 () Bool)

(assert (=> b!91082 m!97731))

(assert (=> bm!8874 m!97519))

(declare-fun m!97733 () Bool)

(assert (=> bm!8874 m!97733))

(declare-fun m!97735 () Bool)

(assert (=> b!91104 m!97735))

(declare-fun m!97737 () Bool)

(assert (=> b!91104 m!97737))

(assert (=> b!91104 m!97519))

(declare-fun m!97739 () Bool)

(assert (=> b!91104 m!97739))

(assert (=> b!91104 m!97519))

(declare-fun m!97741 () Bool)

(assert (=> b!91104 m!97741))

(assert (=> bm!8858 m!97737))

(declare-fun m!97743 () Bool)

(assert (=> bm!8858 m!97743))

(assert (=> bm!8854 m!97519))

(declare-fun m!97745 () Bool)

(assert (=> bm!8854 m!97745))

(declare-fun m!97747 () Bool)

(assert (=> bm!8866 m!97747))

(assert (=> bm!8857 m!97519))

(declare-fun m!97749 () Bool)

(assert (=> bm!8857 m!97749))

(declare-fun m!97751 () Bool)

(assert (=> b!91092 m!97751))

(assert (=> b!91109 m!97519))

(assert (=> b!91109 m!97733))

(declare-fun m!97753 () Bool)

(assert (=> bm!8862 m!97753))

(declare-fun m!97755 () Bool)

(assert (=> bm!8852 m!97755))

(declare-fun m!97757 () Bool)

(assert (=> b!91085 m!97757))

(declare-fun m!97759 () Bool)

(assert (=> bm!8863 m!97759))

(declare-fun m!97761 () Bool)

(assert (=> b!91108 m!97761))

(declare-fun m!97763 () Bool)

(assert (=> b!91081 m!97763))

(assert (=> bm!8855 m!97531))

(declare-fun m!97765 () Bool)

(assert (=> b!91114 m!97765))

(assert (=> bm!8859 m!97519))

(declare-fun m!97767 () Bool)

(assert (=> bm!8859 m!97767))

(assert (=> bm!8869 m!97519))

(declare-fun m!97769 () Bool)

(assert (=> bm!8869 m!97769))

(declare-fun m!97771 () Bool)

(assert (=> b!91100 m!97771))

(declare-fun m!97773 () Bool)

(assert (=> b!91079 m!97773))

(declare-fun m!97775 () Bool)

(assert (=> bm!8875 m!97775))

(declare-fun m!97777 () Bool)

(assert (=> d!24041 m!97777))

(assert (=> d!24041 m!97547))

(declare-fun m!97779 () Bool)

(assert (=> b!91113 m!97779))

(declare-fun m!97781 () Bool)

(assert (=> bm!8856 m!97781))

(declare-fun m!97783 () Bool)

(assert (=> bm!8856 m!97783))

(declare-fun m!97785 () Bool)

(assert (=> b!91111 m!97785))

(assert (=> b!90854 d!24041))

(declare-fun d!24043 () Bool)

(assert (=> d!24043 (= (array_inv!1199 (_keys!4079 newMap!16)) (bvsge (size!2199 (_keys!4079 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90844 d!24043))

(declare-fun d!24045 () Bool)

(assert (=> d!24045 (= (array_inv!1200 (_values!2382 newMap!16)) (bvsge (size!2200 (_values!2382 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90844 d!24045))

(declare-fun d!24047 () Bool)

(declare-fun e!59428 () Bool)

(assert (=> d!24047 e!59428))

(declare-fun res!46410 () Bool)

(assert (=> d!24047 (=> (not res!46410) (not e!59428))))

(declare-fun lt!44343 () ListLongMap!1465)

(assert (=> d!24047 (= res!46410 (contains!765 lt!44343 (_1!1127 lt!44128)))))

(declare-fun lt!44340 () List!1531)

(assert (=> d!24047 (= lt!44343 (ListLongMap!1466 lt!44340))))

(declare-fun lt!44342 () Unit!2686)

(declare-fun lt!44341 () Unit!2686)

(assert (=> d!24047 (= lt!44342 lt!44341)))

(assert (=> d!24047 (= (getValueByKey!145 lt!44340 (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128)))))

(declare-fun lemmaContainsTupThenGetReturnValue!62 (List!1531 (_ BitVec 64) V!3081) Unit!2686)

(assert (=> d!24047 (= lt!44341 (lemmaContainsTupThenGetReturnValue!62 lt!44340 (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(declare-fun insertStrictlySorted!65 (List!1531 (_ BitVec 64) V!3081) List!1531)

(assert (=> d!24047 (= lt!44340 (insertStrictlySorted!65 (toList!748 (+!117 lt!44119 lt!44127)) (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(assert (=> d!24047 (= (+!117 (+!117 lt!44119 lt!44127) lt!44128) lt!44343)))

(declare-fun b!91121 () Bool)

(declare-fun res!46411 () Bool)

(assert (=> b!91121 (=> (not res!46411) (not e!59428))))

(assert (=> b!91121 (= res!46411 (= (getValueByKey!145 (toList!748 lt!44343) (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128))))))

(declare-fun b!91122 () Bool)

(declare-fun contains!767 (List!1531 tuple2!2232) Bool)

(assert (=> b!91122 (= e!59428 (contains!767 (toList!748 lt!44343) lt!44128))))

(assert (= (and d!24047 res!46410) b!91121))

(assert (= (and b!91121 res!46411) b!91122))

(declare-fun m!97787 () Bool)

(assert (=> d!24047 m!97787))

(declare-fun m!97789 () Bool)

(assert (=> d!24047 m!97789))

(declare-fun m!97791 () Bool)

(assert (=> d!24047 m!97791))

(declare-fun m!97793 () Bool)

(assert (=> d!24047 m!97793))

(declare-fun m!97795 () Bool)

(assert (=> b!91121 m!97795))

(declare-fun m!97797 () Bool)

(assert (=> b!91122 m!97797))

(assert (=> b!90858 d!24047))

(declare-fun d!24049 () Bool)

(declare-fun e!59429 () Bool)

(assert (=> d!24049 e!59429))

(declare-fun res!46412 () Bool)

(assert (=> d!24049 (=> (not res!46412) (not e!59429))))

(declare-fun lt!44347 () ListLongMap!1465)

(assert (=> d!24049 (= res!46412 (contains!765 lt!44347 (_1!1127 lt!44127)))))

(declare-fun lt!44344 () List!1531)

(assert (=> d!24049 (= lt!44347 (ListLongMap!1466 lt!44344))))

(declare-fun lt!44346 () Unit!2686)

(declare-fun lt!44345 () Unit!2686)

(assert (=> d!24049 (= lt!44346 lt!44345)))

(assert (=> d!24049 (= (getValueByKey!145 lt!44344 (_1!1127 lt!44127)) (Some!150 (_2!1127 lt!44127)))))

(assert (=> d!24049 (= lt!44345 (lemmaContainsTupThenGetReturnValue!62 lt!44344 (_1!1127 lt!44127) (_2!1127 lt!44127)))))

(assert (=> d!24049 (= lt!44344 (insertStrictlySorted!65 (toList!748 lt!44126) (_1!1127 lt!44127) (_2!1127 lt!44127)))))

(assert (=> d!24049 (= (+!117 lt!44126 lt!44127) lt!44347)))

(declare-fun b!91123 () Bool)

(declare-fun res!46413 () Bool)

(assert (=> b!91123 (=> (not res!46413) (not e!59429))))

(assert (=> b!91123 (= res!46413 (= (getValueByKey!145 (toList!748 lt!44347) (_1!1127 lt!44127)) (Some!150 (_2!1127 lt!44127))))))

(declare-fun b!91124 () Bool)

(assert (=> b!91124 (= e!59429 (contains!767 (toList!748 lt!44347) lt!44127))))

(assert (= (and d!24049 res!46412) b!91123))

(assert (= (and b!91123 res!46413) b!91124))

(declare-fun m!97799 () Bool)

(assert (=> d!24049 m!97799))

(declare-fun m!97801 () Bool)

(assert (=> d!24049 m!97801))

(declare-fun m!97803 () Bool)

(assert (=> d!24049 m!97803))

(declare-fun m!97805 () Bool)

(assert (=> d!24049 m!97805))

(declare-fun m!97807 () Bool)

(assert (=> b!91123 m!97807))

(declare-fun m!97809 () Bool)

(assert (=> b!91124 m!97809))

(assert (=> b!90858 d!24049))

(declare-fun d!24051 () Bool)

(declare-fun e!59430 () Bool)

(assert (=> d!24051 e!59430))

(declare-fun res!46414 () Bool)

(assert (=> d!24051 (=> (not res!46414) (not e!59430))))

(declare-fun lt!44351 () ListLongMap!1465)

(assert (=> d!24051 (= res!46414 (contains!765 lt!44351 (_1!1127 lt!44125)))))

(declare-fun lt!44348 () List!1531)

(assert (=> d!24051 (= lt!44351 (ListLongMap!1466 lt!44348))))

(declare-fun lt!44350 () Unit!2686)

(declare-fun lt!44349 () Unit!2686)

(assert (=> d!24051 (= lt!44350 lt!44349)))

(assert (=> d!24051 (= (getValueByKey!145 lt!44348 (_1!1127 lt!44125)) (Some!150 (_2!1127 lt!44125)))))

(assert (=> d!24051 (= lt!44349 (lemmaContainsTupThenGetReturnValue!62 lt!44348 (_1!1127 lt!44125) (_2!1127 lt!44125)))))

(assert (=> d!24051 (= lt!44348 (insertStrictlySorted!65 (toList!748 lt!44116) (_1!1127 lt!44125) (_2!1127 lt!44125)))))

(assert (=> d!24051 (= (+!117 lt!44116 lt!44125) lt!44351)))

(declare-fun b!91125 () Bool)

(declare-fun res!46415 () Bool)

(assert (=> b!91125 (=> (not res!46415) (not e!59430))))

(assert (=> b!91125 (= res!46415 (= (getValueByKey!145 (toList!748 lt!44351) (_1!1127 lt!44125)) (Some!150 (_2!1127 lt!44125))))))

(declare-fun b!91126 () Bool)

(assert (=> b!91126 (= e!59430 (contains!767 (toList!748 lt!44351) lt!44125))))

(assert (= (and d!24051 res!46414) b!91125))

(assert (= (and b!91125 res!46415) b!91126))

(declare-fun m!97811 () Bool)

(assert (=> d!24051 m!97811))

(declare-fun m!97813 () Bool)

(assert (=> d!24051 m!97813))

(declare-fun m!97815 () Bool)

(assert (=> d!24051 m!97815))

(declare-fun m!97817 () Bool)

(assert (=> d!24051 m!97817))

(declare-fun m!97819 () Bool)

(assert (=> b!91125 m!97819))

(declare-fun m!97821 () Bool)

(assert (=> b!91126 m!97821))

(assert (=> b!90858 d!24051))

(declare-fun b!91151 () Bool)

(declare-fun e!59449 () ListLongMap!1465)

(declare-fun e!59450 () ListLongMap!1465)

(assert (=> b!91151 (= e!59449 e!59450)))

(declare-fun c!15127 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!91151 (= c!15127 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91152 () Bool)

(declare-fun call!8881 () ListLongMap!1465)

(assert (=> b!91152 (= e!59450 call!8881)))

(declare-fun b!91153 () Bool)

(declare-fun lt!44371 () Unit!2686)

(declare-fun lt!44366 () Unit!2686)

(assert (=> b!91153 (= lt!44371 lt!44366)))

(declare-fun lt!44367 () (_ BitVec 64))

(declare-fun lt!44369 () (_ BitVec 64))

(declare-fun lt!44370 () V!3081)

(declare-fun lt!44372 () ListLongMap!1465)

(assert (=> b!91153 (not (contains!765 (+!117 lt!44372 (tuple2!2233 lt!44369 lt!44370)) lt!44367))))

(declare-fun addStillNotContains!37 (ListLongMap!1465 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2686)

(assert (=> b!91153 (= lt!44366 (addStillNotContains!37 lt!44372 lt!44369 lt!44370 lt!44367))))

(assert (=> b!91153 (= lt!44367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91153 (= lt!44370 (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91153 (= lt!44369 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91153 (= lt!44372 call!8881)))

(assert (=> b!91153 (= e!59450 (+!117 call!8881 (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!91155 () Bool)

(declare-fun e!59451 () Bool)

(declare-fun e!59447 () Bool)

(assert (=> b!91155 (= e!59451 e!59447)))

(declare-fun c!15126 () Bool)

(assert (=> b!91155 (= c!15126 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91156 () Bool)

(declare-fun res!46426 () Bool)

(declare-fun e!59446 () Bool)

(assert (=> b!91156 (=> (not res!46426) (not e!59446))))

(declare-fun lt!44368 () ListLongMap!1465)

(assert (=> b!91156 (= res!46426 (not (contains!765 lt!44368 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91157 () Bool)

(assert (=> b!91157 (= e!59447 (= lt!44368 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91154 () Bool)

(assert (=> b!91154 (= e!59446 e!59451)))

(declare-fun c!15128 () Bool)

(declare-fun e!59445 () Bool)

(assert (=> b!91154 (= c!15128 e!59445)))

(declare-fun res!46427 () Bool)

(assert (=> b!91154 (=> (not res!46427) (not e!59445))))

(assert (=> b!91154 (= res!46427 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun d!24053 () Bool)

(assert (=> d!24053 e!59446))

(declare-fun res!46425 () Bool)

(assert (=> d!24053 (=> (not res!46425) (not e!59446))))

(assert (=> d!24053 (= res!46425 (not (contains!765 lt!44368 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24053 (= lt!44368 e!59449)))

(declare-fun c!15129 () Bool)

(assert (=> d!24053 (= c!15129 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24053 (validMask!0 (mask!6457 (v!2715 (underlying!312 thiss!992))))))

(assert (=> d!24053 (= (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) lt!44368)))

(declare-fun bm!8878 () Bool)

(assert (=> bm!8878 (= call!8881 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!91158 () Bool)

(declare-fun e!59448 () Bool)

(assert (=> b!91158 (= e!59451 e!59448)))

(assert (=> b!91158 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun res!46424 () Bool)

(assert (=> b!91158 (= res!46424 (contains!765 lt!44368 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91158 (=> (not res!46424) (not e!59448))))

(declare-fun b!91159 () Bool)

(assert (=> b!91159 (= e!59449 (ListLongMap!1466 Nil!1528))))

(declare-fun b!91160 () Bool)

(assert (=> b!91160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(assert (=> b!91160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2200 (_values!2382 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun apply!86 (ListLongMap!1465 (_ BitVec 64)) V!3081)

(assert (=> b!91160 (= e!59448 (= (apply!86 lt!44368 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!91161 () Bool)

(declare-fun isEmpty!351 (ListLongMap!1465) Bool)

(assert (=> b!91161 (= e!59447 (isEmpty!351 lt!44368))))

(declare-fun b!91162 () Bool)

(assert (=> b!91162 (= e!59445 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91162 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(assert (= (and d!24053 c!15129) b!91159))

(assert (= (and d!24053 (not c!15129)) b!91151))

(assert (= (and b!91151 c!15127) b!91153))

(assert (= (and b!91151 (not c!15127)) b!91152))

(assert (= (or b!91153 b!91152) bm!8878))

(assert (= (and d!24053 res!46425) b!91156))

(assert (= (and b!91156 res!46426) b!91154))

(assert (= (and b!91154 res!46427) b!91162))

(assert (= (and b!91154 c!15128) b!91158))

(assert (= (and b!91154 (not c!15128)) b!91155))

(assert (= (and b!91158 res!46424) b!91160))

(assert (= (and b!91155 c!15126) b!91157))

(assert (= (and b!91155 (not c!15126)) b!91161))

(declare-fun b_lambda!4017 () Bool)

(assert (=> (not b_lambda!4017) (not b!91153)))

(assert (=> b!91153 t!5342))

(declare-fun b_and!5517 () Bool)

(assert (= b_and!5497 (and (=> t!5342 result!3053) b_and!5517)))

(assert (=> b!91153 t!5344))

(declare-fun b_and!5519 () Bool)

(assert (= b_and!5499 (and (=> t!5344 result!3057) b_and!5519)))

(declare-fun b_lambda!4019 () Bool)

(assert (=> (not b_lambda!4019) (not b!91160)))

(assert (=> b!91160 t!5342))

(declare-fun b_and!5521 () Bool)

(assert (= b_and!5517 (and (=> t!5342 result!3053) b_and!5521)))

(assert (=> b!91160 t!5344))

(declare-fun b_and!5523 () Bool)

(assert (= b_and!5519 (and (=> t!5344 result!3057) b_and!5523)))

(declare-fun m!97823 () Bool)

(assert (=> b!91162 m!97823))

(assert (=> b!91162 m!97823))

(declare-fun m!97825 () Bool)

(assert (=> b!91162 m!97825))

(assert (=> b!91151 m!97823))

(assert (=> b!91151 m!97823))

(assert (=> b!91151 m!97825))

(declare-fun m!97827 () Bool)

(assert (=> b!91156 m!97827))

(declare-fun m!97829 () Bool)

(assert (=> d!24053 m!97829))

(declare-fun m!97831 () Bool)

(assert (=> d!24053 m!97831))

(declare-fun m!97833 () Bool)

(assert (=> b!91157 m!97833))

(assert (=> b!91158 m!97823))

(assert (=> b!91158 m!97823))

(declare-fun m!97835 () Bool)

(assert (=> b!91158 m!97835))

(declare-fun m!97837 () Bool)

(assert (=> b!91153 m!97837))

(assert (=> b!91153 m!97823))

(declare-fun m!97839 () Bool)

(assert (=> b!91153 m!97839))

(declare-fun m!97841 () Bool)

(assert (=> b!91153 m!97841))

(assert (=> b!91153 m!97523))

(declare-fun m!97843 () Bool)

(assert (=> b!91153 m!97843))

(assert (=> b!91153 m!97841))

(assert (=> b!91153 m!97523))

(declare-fun m!97845 () Bool)

(assert (=> b!91153 m!97845))

(assert (=> b!91153 m!97843))

(declare-fun m!97847 () Bool)

(assert (=> b!91153 m!97847))

(declare-fun m!97849 () Bool)

(assert (=> b!91161 m!97849))

(assert (=> bm!8878 m!97833))

(assert (=> b!91160 m!97823))

(declare-fun m!97851 () Bool)

(assert (=> b!91160 m!97851))

(assert (=> b!91160 m!97823))

(assert (=> b!91160 m!97841))

(assert (=> b!91160 m!97841))

(assert (=> b!91160 m!97523))

(assert (=> b!91160 m!97845))

(assert (=> b!91160 m!97523))

(assert (=> b!90858 d!24053))

(declare-fun d!24055 () Bool)

(assert (=> d!24055 (= (+!117 (+!117 lt!44119 (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124)) (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) (+!117 (+!117 lt!44119 (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124)))))

(declare-fun lt!44375 () Unit!2686)

(declare-fun choose!548 (ListLongMap!1465 (_ BitVec 64) V!3081 (_ BitVec 64) V!3081) Unit!2686)

(assert (=> d!24055 (= lt!44375 (choose!548 lt!44119 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(assert (=> d!24055 (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24055 (= (addCommutativeForDiffKeys!37 lt!44119 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))) lt!44375)))

(declare-fun bs!3794 () Bool)

(assert (= bs!3794 d!24055))

(declare-fun m!97853 () Bool)

(assert (=> bs!3794 m!97853))

(declare-fun m!97855 () Bool)

(assert (=> bs!3794 m!97855))

(declare-fun m!97857 () Bool)

(assert (=> bs!3794 m!97857))

(assert (=> bs!3794 m!97853))

(declare-fun m!97859 () Bool)

(assert (=> bs!3794 m!97859))

(assert (=> bs!3794 m!97519))

(declare-fun m!97861 () Bool)

(assert (=> bs!3794 m!97861))

(assert (=> bs!3794 m!97855))

(assert (=> b!90858 d!24055))

(declare-fun d!24057 () Bool)

(assert (=> d!24057 (= (map!1218 (_2!1126 lt!44130)) (getCurrentListMap!438 (_keys!4079 (_2!1126 lt!44130)) (_values!2382 (_2!1126 lt!44130)) (mask!6457 (_2!1126 lt!44130)) (extraKeys!2230 (_2!1126 lt!44130)) (zeroValue!2287 (_2!1126 lt!44130)) (minValue!2287 (_2!1126 lt!44130)) #b00000000000000000000000000000000 (defaultEntry!2399 (_2!1126 lt!44130))))))

(declare-fun bs!3795 () Bool)

(assert (= bs!3795 d!24057))

(declare-fun m!97863 () Bool)

(assert (=> bs!3795 m!97863))

(assert (=> b!90858 d!24057))

(declare-fun d!24059 () Bool)

(declare-fun e!59452 () Bool)

(assert (=> d!24059 e!59452))

(declare-fun res!46428 () Bool)

(assert (=> d!24059 (=> (not res!46428) (not e!59452))))

(declare-fun lt!44379 () ListLongMap!1465)

(assert (=> d!24059 (= res!46428 (contains!765 lt!44379 (_1!1127 lt!44128)))))

(declare-fun lt!44376 () List!1531)

(assert (=> d!24059 (= lt!44379 (ListLongMap!1466 lt!44376))))

(declare-fun lt!44378 () Unit!2686)

(declare-fun lt!44377 () Unit!2686)

(assert (=> d!24059 (= lt!44378 lt!44377)))

(assert (=> d!24059 (= (getValueByKey!145 lt!44376 (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128)))))

(assert (=> d!24059 (= lt!44377 (lemmaContainsTupThenGetReturnValue!62 lt!44376 (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(assert (=> d!24059 (= lt!44376 (insertStrictlySorted!65 (toList!748 lt!44119) (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(assert (=> d!24059 (= (+!117 lt!44119 lt!44128) lt!44379)))

(declare-fun b!91163 () Bool)

(declare-fun res!46429 () Bool)

(assert (=> b!91163 (=> (not res!46429) (not e!59452))))

(assert (=> b!91163 (= res!46429 (= (getValueByKey!145 (toList!748 lt!44379) (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128))))))

(declare-fun b!91164 () Bool)

(assert (=> b!91164 (= e!59452 (contains!767 (toList!748 lt!44379) lt!44128))))

(assert (= (and d!24059 res!46428) b!91163))

(assert (= (and b!91163 res!46429) b!91164))

(declare-fun m!97865 () Bool)

(assert (=> d!24059 m!97865))

(declare-fun m!97867 () Bool)

(assert (=> d!24059 m!97867))

(declare-fun m!97869 () Bool)

(assert (=> d!24059 m!97869))

(declare-fun m!97871 () Bool)

(assert (=> d!24059 m!97871))

(declare-fun m!97873 () Bool)

(assert (=> b!91163 m!97873))

(declare-fun m!97875 () Bool)

(assert (=> b!91164 m!97875))

(assert (=> b!90858 d!24059))

(declare-fun d!24061 () Bool)

(declare-fun e!59453 () Bool)

(assert (=> d!24061 e!59453))

(declare-fun res!46430 () Bool)

(assert (=> d!24061 (=> (not res!46430) (not e!59453))))

(declare-fun lt!44383 () ListLongMap!1465)

(assert (=> d!24061 (= res!46430 (contains!765 lt!44383 (_1!1127 lt!44127)))))

(declare-fun lt!44380 () List!1531)

(assert (=> d!24061 (= lt!44383 (ListLongMap!1466 lt!44380))))

(declare-fun lt!44382 () Unit!2686)

(declare-fun lt!44381 () Unit!2686)

(assert (=> d!24061 (= lt!44382 lt!44381)))

(assert (=> d!24061 (= (getValueByKey!145 lt!44380 (_1!1127 lt!44127)) (Some!150 (_2!1127 lt!44127)))))

(assert (=> d!24061 (= lt!44381 (lemmaContainsTupThenGetReturnValue!62 lt!44380 (_1!1127 lt!44127) (_2!1127 lt!44127)))))

(assert (=> d!24061 (= lt!44380 (insertStrictlySorted!65 (toList!748 lt!44119) (_1!1127 lt!44127) (_2!1127 lt!44127)))))

(assert (=> d!24061 (= (+!117 lt!44119 lt!44127) lt!44383)))

(declare-fun b!91165 () Bool)

(declare-fun res!46431 () Bool)

(assert (=> b!91165 (=> (not res!46431) (not e!59453))))

(assert (=> b!91165 (= res!46431 (= (getValueByKey!145 (toList!748 lt!44383) (_1!1127 lt!44127)) (Some!150 (_2!1127 lt!44127))))))

(declare-fun b!91166 () Bool)

(assert (=> b!91166 (= e!59453 (contains!767 (toList!748 lt!44383) lt!44127))))

(assert (= (and d!24061 res!46430) b!91165))

(assert (= (and b!91165 res!46431) b!91166))

(declare-fun m!97877 () Bool)

(assert (=> d!24061 m!97877))

(declare-fun m!97879 () Bool)

(assert (=> d!24061 m!97879))

(declare-fun m!97881 () Bool)

(assert (=> d!24061 m!97881))

(declare-fun m!97883 () Bool)

(assert (=> d!24061 m!97883))

(declare-fun m!97885 () Bool)

(assert (=> b!91165 m!97885))

(declare-fun m!97887 () Bool)

(assert (=> b!91166 m!97887))

(assert (=> b!90858 d!24061))

(declare-fun bm!8893 () Bool)

(declare-fun call!8902 () Bool)

(declare-fun lt!44443 () ListLongMap!1465)

(assert (=> bm!8893 (= call!8902 (contains!765 lt!44443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!24063 () Bool)

(declare-fun e!59483 () Bool)

(assert (=> d!24063 e!59483))

(declare-fun res!46457 () Bool)

(assert (=> d!24063 (=> (not res!46457) (not e!59483))))

(assert (=> d!24063 (= res!46457 (or (bvsge from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))))

(declare-fun lt!44432 () ListLongMap!1465)

(assert (=> d!24063 (= lt!44443 lt!44432)))

(declare-fun lt!44444 () Unit!2686)

(declare-fun e!59482 () Unit!2686)

(assert (=> d!24063 (= lt!44444 e!59482)))

(declare-fun c!15147 () Bool)

(declare-fun e!59481 () Bool)

(assert (=> d!24063 (= c!15147 e!59481)))

(declare-fun res!46454 () Bool)

(assert (=> d!24063 (=> (not res!46454) (not e!59481))))

(assert (=> d!24063 (= res!46454 (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun e!59486 () ListLongMap!1465)

(assert (=> d!24063 (= lt!44432 e!59486)))

(declare-fun c!15142 () Bool)

(assert (=> d!24063 (= c!15142 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24063 (validMask!0 (mask!6457 (v!2715 (underlying!312 thiss!992))))))

(assert (=> d!24063 (= (getCurrentListMap!438 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) lt!44443)))

(declare-fun b!91209 () Bool)

(declare-fun call!8898 () ListLongMap!1465)

(assert (=> b!91209 (= e!59486 (+!117 call!8898 (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91210 () Bool)

(declare-fun e!59491 () Bool)

(assert (=> b!91210 (= e!59491 (= (apply!86 lt!44443 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!91211 () Bool)

(declare-fun e!59489 () Bool)

(assert (=> b!91211 (= e!59483 e!59489)))

(declare-fun c!15144 () Bool)

(assert (=> b!91211 (= c!15144 (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91212 () Bool)

(declare-fun call!8897 () Bool)

(assert (=> b!91212 (= e!59489 (not call!8897))))

(declare-fun b!91213 () Bool)

(declare-fun e!59488 () Bool)

(assert (=> b!91213 (= e!59488 e!59491)))

(declare-fun res!46456 () Bool)

(assert (=> b!91213 (= res!46456 call!8902)))

(assert (=> b!91213 (=> (not res!46456) (not e!59491))))

(declare-fun b!91214 () Bool)

(declare-fun e!59487 () Bool)

(declare-fun e!59480 () Bool)

(assert (=> b!91214 (= e!59487 e!59480)))

(declare-fun res!46455 () Bool)

(assert (=> b!91214 (=> (not res!46455) (not e!59480))))

(assert (=> b!91214 (= res!46455 (contains!765 lt!44443 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(assert (=> b!91214 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91215 () Bool)

(declare-fun lt!44433 () Unit!2686)

(assert (=> b!91215 (= e!59482 lt!44433)))

(declare-fun lt!44428 () ListLongMap!1465)

(assert (=> b!91215 (= lt!44428 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44441 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44442 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44442 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))

(declare-fun lt!44440 () Unit!2686)

(declare-fun addStillContains!62 (ListLongMap!1465 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2686)

(assert (=> b!91215 (= lt!44440 (addStillContains!62 lt!44428 lt!44441 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44442))))

(assert (=> b!91215 (contains!765 (+!117 lt!44428 (tuple2!2233 lt!44441 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44442)))

(declare-fun lt!44431 () Unit!2686)

(assert (=> b!91215 (= lt!44431 lt!44440)))

(declare-fun lt!44449 () ListLongMap!1465)

(assert (=> b!91215 (= lt!44449 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44429 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44436 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44436 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))

(declare-fun lt!44438 () Unit!2686)

(declare-fun addApplyDifferent!62 (ListLongMap!1465 (_ BitVec 64) V!3081 (_ BitVec 64)) Unit!2686)

(assert (=> b!91215 (= lt!44438 (addApplyDifferent!62 lt!44449 lt!44429 (minValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44436))))

(assert (=> b!91215 (= (apply!86 (+!117 lt!44449 (tuple2!2233 lt!44429 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44436) (apply!86 lt!44449 lt!44436))))

(declare-fun lt!44435 () Unit!2686)

(assert (=> b!91215 (= lt!44435 lt!44438)))

(declare-fun lt!44445 () ListLongMap!1465)

(assert (=> b!91215 (= lt!44445 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44434 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44446 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44446 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))

(declare-fun lt!44439 () Unit!2686)

(assert (=> b!91215 (= lt!44439 (addApplyDifferent!62 lt!44445 lt!44434 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44446))))

(assert (=> b!91215 (= (apply!86 (+!117 lt!44445 (tuple2!2233 lt!44434 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44446) (apply!86 lt!44445 lt!44446))))

(declare-fun lt!44448 () Unit!2686)

(assert (=> b!91215 (= lt!44448 lt!44439)))

(declare-fun lt!44437 () ListLongMap!1465)

(assert (=> b!91215 (= lt!44437 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44430 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44447 () (_ BitVec 64))

(assert (=> b!91215 (= lt!44447 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355))))

(assert (=> b!91215 (= lt!44433 (addApplyDifferent!62 lt!44437 lt!44430 (minValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44447))))

(assert (=> b!91215 (= (apply!86 (+!117 lt!44437 (tuple2!2233 lt!44430 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44447) (apply!86 lt!44437 lt!44447))))

(declare-fun b!91216 () Bool)

(declare-fun e!59485 () Bool)

(assert (=> b!91216 (= e!59489 e!59485)))

(declare-fun res!46451 () Bool)

(assert (=> b!91216 (= res!46451 call!8897)))

(assert (=> b!91216 (=> (not res!46451) (not e!59485))))

(declare-fun b!91217 () Bool)

(declare-fun e!59484 () ListLongMap!1465)

(declare-fun call!8900 () ListLongMap!1465)

(assert (=> b!91217 (= e!59484 call!8900)))

(declare-fun call!8899 () ListLongMap!1465)

(declare-fun c!15146 () Bool)

(declare-fun bm!8894 () Bool)

(declare-fun call!8901 () ListLongMap!1465)

(assert (=> bm!8894 (= call!8898 (+!117 (ite c!15142 call!8899 (ite c!15146 call!8901 call!8900)) (ite (or c!15142 c!15146) (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))) (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))))

(declare-fun bm!8895 () Bool)

(assert (=> bm!8895 (= call!8899 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) from!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!91218 () Bool)

(assert (=> b!91218 (= e!59481 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91219 () Bool)

(declare-fun Unit!2700 () Unit!2686)

(assert (=> b!91219 (= e!59482 Unit!2700)))

(declare-fun b!91220 () Bool)

(declare-fun call!8896 () ListLongMap!1465)

(assert (=> b!91220 (= e!59484 call!8896)))

(declare-fun b!91221 () Bool)

(assert (=> b!91221 (= e!59488 (not call!8902))))

(declare-fun b!91222 () Bool)

(declare-fun e!59492 () ListLongMap!1465)

(assert (=> b!91222 (= e!59486 e!59492)))

(assert (=> b!91222 (= c!15146 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91223 () Bool)

(declare-fun c!15143 () Bool)

(assert (=> b!91223 (= c!15143 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91223 (= e!59492 e!59484)))

(declare-fun b!91224 () Bool)

(assert (=> b!91224 (= e!59492 call!8896)))

(declare-fun b!91225 () Bool)

(assert (=> b!91225 (= e!59480 (= (apply!86 lt!44443 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)) (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91225 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2200 (_values!2382 (v!2715 (underlying!312 thiss!992))))))))

(assert (=> b!91225 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91226 () Bool)

(declare-fun e!59490 () Bool)

(assert (=> b!91226 (= e!59490 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun bm!8896 () Bool)

(assert (=> bm!8896 (= call!8896 call!8898)))

(declare-fun b!91227 () Bool)

(assert (=> b!91227 (= e!59485 (= (apply!86 lt!44443 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun bm!8897 () Bool)

(assert (=> bm!8897 (= call!8897 (contains!765 lt!44443 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91228 () Bool)

(declare-fun res!46450 () Bool)

(assert (=> b!91228 (=> (not res!46450) (not e!59483))))

(assert (=> b!91228 (= res!46450 e!59488)))

(declare-fun c!15145 () Bool)

(assert (=> b!91228 (= c!15145 (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8898 () Bool)

(assert (=> bm!8898 (= call!8901 call!8899)))

(declare-fun bm!8899 () Bool)

(assert (=> bm!8899 (= call!8900 call!8901)))

(declare-fun b!91229 () Bool)

(declare-fun res!46453 () Bool)

(assert (=> b!91229 (=> (not res!46453) (not e!59483))))

(assert (=> b!91229 (= res!46453 e!59487)))

(declare-fun res!46458 () Bool)

(assert (=> b!91229 (=> res!46458 e!59487)))

(assert (=> b!91229 (= res!46458 (not e!59490))))

(declare-fun res!46452 () Bool)

(assert (=> b!91229 (=> (not res!46452) (not e!59490))))

(assert (=> b!91229 (= res!46452 (bvslt from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(assert (= (and d!24063 c!15142) b!91209))

(assert (= (and d!24063 (not c!15142)) b!91222))

(assert (= (and b!91222 c!15146) b!91224))

(assert (= (and b!91222 (not c!15146)) b!91223))

(assert (= (and b!91223 c!15143) b!91220))

(assert (= (and b!91223 (not c!15143)) b!91217))

(assert (= (or b!91220 b!91217) bm!8899))

(assert (= (or b!91224 bm!8899) bm!8898))

(assert (= (or b!91224 b!91220) bm!8896))

(assert (= (or b!91209 bm!8898) bm!8895))

(assert (= (or b!91209 bm!8896) bm!8894))

(assert (= (and d!24063 res!46454) b!91218))

(assert (= (and d!24063 c!15147) b!91215))

(assert (= (and d!24063 (not c!15147)) b!91219))

(assert (= (and d!24063 res!46457) b!91229))

(assert (= (and b!91229 res!46452) b!91226))

(assert (= (and b!91229 (not res!46458)) b!91214))

(assert (= (and b!91214 res!46455) b!91225))

(assert (= (and b!91229 res!46453) b!91228))

(assert (= (and b!91228 c!15145) b!91213))

(assert (= (and b!91228 (not c!15145)) b!91221))

(assert (= (and b!91213 res!46456) b!91210))

(assert (= (or b!91213 b!91221) bm!8893))

(assert (= (and b!91228 res!46450) b!91211))

(assert (= (and b!91211 c!15144) b!91216))

(assert (= (and b!91211 (not c!15144)) b!91212))

(assert (= (and b!91216 res!46451) b!91227))

(assert (= (or b!91216 b!91212) bm!8897))

(declare-fun b_lambda!4021 () Bool)

(assert (=> (not b_lambda!4021) (not b!91225)))

(assert (=> b!91225 t!5342))

(declare-fun b_and!5525 () Bool)

(assert (= b_and!5521 (and (=> t!5342 result!3053) b_and!5525)))

(assert (=> b!91225 t!5344))

(declare-fun b_and!5527 () Bool)

(assert (= b_and!5523 (and (=> t!5344 result!3057) b_and!5527)))

(declare-fun m!97889 () Bool)

(assert (=> bm!8895 m!97889))

(assert (=> b!91226 m!97519))

(assert (=> b!91226 m!97519))

(declare-fun m!97891 () Bool)

(assert (=> b!91226 m!97891))

(declare-fun m!97893 () Bool)

(assert (=> b!91209 m!97893))

(declare-fun m!97895 () Bool)

(assert (=> bm!8897 m!97895))

(declare-fun m!97897 () Bool)

(assert (=> bm!8894 m!97897))

(declare-fun m!97899 () Bool)

(assert (=> b!91210 m!97899))

(assert (=> d!24063 m!97831))

(assert (=> b!91215 m!97889))

(declare-fun m!97901 () Bool)

(assert (=> b!91215 m!97901))

(declare-fun m!97903 () Bool)

(assert (=> b!91215 m!97903))

(declare-fun m!97905 () Bool)

(assert (=> b!91215 m!97905))

(declare-fun m!97907 () Bool)

(assert (=> b!91215 m!97907))

(declare-fun m!97909 () Bool)

(assert (=> b!91215 m!97909))

(declare-fun m!97911 () Bool)

(assert (=> b!91215 m!97911))

(declare-fun m!97913 () Bool)

(assert (=> b!91215 m!97913))

(assert (=> b!91215 m!97519))

(assert (=> b!91215 m!97907))

(declare-fun m!97915 () Bool)

(assert (=> b!91215 m!97915))

(assert (=> b!91215 m!97909))

(declare-fun m!97917 () Bool)

(assert (=> b!91215 m!97917))

(declare-fun m!97919 () Bool)

(assert (=> b!91215 m!97919))

(declare-fun m!97921 () Bool)

(assert (=> b!91215 m!97921))

(declare-fun m!97923 () Bool)

(assert (=> b!91215 m!97923))

(declare-fun m!97925 () Bool)

(assert (=> b!91215 m!97925))

(assert (=> b!91215 m!97919))

(declare-fun m!97927 () Bool)

(assert (=> b!91215 m!97927))

(assert (=> b!91215 m!97923))

(declare-fun m!97929 () Bool)

(assert (=> b!91215 m!97929))

(declare-fun m!97931 () Bool)

(assert (=> b!91227 m!97931))

(assert (=> b!91214 m!97519))

(assert (=> b!91214 m!97519))

(declare-fun m!97933 () Bool)

(assert (=> b!91214 m!97933))

(assert (=> b!91218 m!97519))

(assert (=> b!91218 m!97519))

(assert (=> b!91218 m!97891))

(assert (=> b!91225 m!97521))

(assert (=> b!91225 m!97523))

(assert (=> b!91225 m!97525))

(assert (=> b!91225 m!97521))

(assert (=> b!91225 m!97519))

(declare-fun m!97935 () Bool)

(assert (=> b!91225 m!97935))

(assert (=> b!91225 m!97523))

(assert (=> b!91225 m!97519))

(declare-fun m!97937 () Bool)

(assert (=> bm!8893 m!97937))

(assert (=> b!90858 d!24063))

(declare-fun d!24065 () Bool)

(declare-fun e!59493 () Bool)

(assert (=> d!24065 e!59493))

(declare-fun res!46459 () Bool)

(assert (=> d!24065 (=> (not res!46459) (not e!59493))))

(declare-fun lt!44453 () ListLongMap!1465)

(assert (=> d!24065 (= res!46459 (contains!765 lt!44453 (_1!1127 lt!44125)))))

(declare-fun lt!44450 () List!1531)

(assert (=> d!24065 (= lt!44453 (ListLongMap!1466 lt!44450))))

(declare-fun lt!44452 () Unit!2686)

(declare-fun lt!44451 () Unit!2686)

(assert (=> d!24065 (= lt!44452 lt!44451)))

(assert (=> d!24065 (= (getValueByKey!145 lt!44450 (_1!1127 lt!44125)) (Some!150 (_2!1127 lt!44125)))))

(assert (=> d!24065 (= lt!44451 (lemmaContainsTupThenGetReturnValue!62 lt!44450 (_1!1127 lt!44125) (_2!1127 lt!44125)))))

(assert (=> d!24065 (= lt!44450 (insertStrictlySorted!65 (toList!748 lt!44120) (_1!1127 lt!44125) (_2!1127 lt!44125)))))

(assert (=> d!24065 (= (+!117 lt!44120 lt!44125) lt!44453)))

(declare-fun b!91230 () Bool)

(declare-fun res!46460 () Bool)

(assert (=> b!91230 (=> (not res!46460) (not e!59493))))

(assert (=> b!91230 (= res!46460 (= (getValueByKey!145 (toList!748 lt!44453) (_1!1127 lt!44125)) (Some!150 (_2!1127 lt!44125))))))

(declare-fun b!91231 () Bool)

(assert (=> b!91231 (= e!59493 (contains!767 (toList!748 lt!44453) lt!44125))))

(assert (= (and d!24065 res!46459) b!91230))

(assert (= (and b!91230 res!46460) b!91231))

(declare-fun m!97939 () Bool)

(assert (=> d!24065 m!97939))

(declare-fun m!97941 () Bool)

(assert (=> d!24065 m!97941))

(declare-fun m!97943 () Bool)

(assert (=> d!24065 m!97943))

(declare-fun m!97945 () Bool)

(assert (=> d!24065 m!97945))

(declare-fun m!97947 () Bool)

(assert (=> b!91230 m!97947))

(declare-fun m!97949 () Bool)

(assert (=> b!91231 m!97949))

(assert (=> b!90858 d!24065))

(declare-fun d!24067 () Bool)

(assert (=> d!24067 (= (+!117 (+!117 lt!44116 (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124)) (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) (+!117 (+!117 lt!44116 (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) (tuple2!2233 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124)))))

(declare-fun lt!44454 () Unit!2686)

(assert (=> d!24067 (= lt!44454 (choose!548 lt!44116 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(assert (=> d!24067 (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24067 (= (addCommutativeForDiffKeys!37 lt!44116 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) lt!44124 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))) lt!44454)))

(declare-fun bs!3796 () Bool)

(assert (= bs!3796 d!24067))

(declare-fun m!97951 () Bool)

(assert (=> bs!3796 m!97951))

(declare-fun m!97953 () Bool)

(assert (=> bs!3796 m!97953))

(declare-fun m!97955 () Bool)

(assert (=> bs!3796 m!97955))

(assert (=> bs!3796 m!97951))

(declare-fun m!97957 () Bool)

(assert (=> bs!3796 m!97957))

(assert (=> bs!3796 m!97519))

(declare-fun m!97959 () Bool)

(assert (=> bs!3796 m!97959))

(assert (=> bs!3796 m!97953))

(assert (=> b!90858 d!24067))

(declare-fun d!24069 () Bool)

(declare-fun e!59494 () Bool)

(assert (=> d!24069 e!59494))

(declare-fun res!46461 () Bool)

(assert (=> d!24069 (=> (not res!46461) (not e!59494))))

(declare-fun lt!44458 () ListLongMap!1465)

(assert (=> d!24069 (= res!46461 (contains!765 lt!44458 (_1!1127 lt!44128)))))

(declare-fun lt!44455 () List!1531)

(assert (=> d!24069 (= lt!44458 (ListLongMap!1466 lt!44455))))

(declare-fun lt!44457 () Unit!2686)

(declare-fun lt!44456 () Unit!2686)

(assert (=> d!24069 (= lt!44457 lt!44456)))

(assert (=> d!24069 (= (getValueByKey!145 lt!44455 (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128)))))

(assert (=> d!24069 (= lt!44456 (lemmaContainsTupThenGetReturnValue!62 lt!44455 (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(assert (=> d!24069 (= lt!44455 (insertStrictlySorted!65 (toList!748 lt!44116) (_1!1127 lt!44128) (_2!1127 lt!44128)))))

(assert (=> d!24069 (= (+!117 lt!44116 lt!44128) lt!44458)))

(declare-fun b!91232 () Bool)

(declare-fun res!46462 () Bool)

(assert (=> b!91232 (=> (not res!46462) (not e!59494))))

(assert (=> b!91232 (= res!46462 (= (getValueByKey!145 (toList!748 lt!44458) (_1!1127 lt!44128)) (Some!150 (_2!1127 lt!44128))))))

(declare-fun b!91233 () Bool)

(assert (=> b!91233 (= e!59494 (contains!767 (toList!748 lt!44458) lt!44128))))

(assert (= (and d!24069 res!46461) b!91232))

(assert (= (and b!91232 res!46462) b!91233))

(declare-fun m!97961 () Bool)

(assert (=> d!24069 m!97961))

(declare-fun m!97963 () Bool)

(assert (=> d!24069 m!97963))

(declare-fun m!97965 () Bool)

(assert (=> d!24069 m!97965))

(declare-fun m!97967 () Bool)

(assert (=> d!24069 m!97967))

(declare-fun m!97969 () Bool)

(assert (=> b!91232 m!97969))

(declare-fun m!97971 () Bool)

(assert (=> b!91233 m!97971))

(assert (=> b!90858 d!24069))

(declare-fun d!24071 () Bool)

(declare-fun res!46469 () Bool)

(declare-fun e!59497 () Bool)

(assert (=> d!24071 (=> (not res!46469) (not e!59497))))

(declare-fun simpleValid!62 (LongMapFixedSize!796) Bool)

(assert (=> d!24071 (= res!46469 (simpleValid!62 (_2!1126 lt!44130)))))

(assert (=> d!24071 (= (valid!358 (_2!1126 lt!44130)) e!59497)))

(declare-fun b!91240 () Bool)

(declare-fun res!46470 () Bool)

(assert (=> b!91240 (=> (not res!46470) (not e!59497))))

(declare-fun arrayCountValidKeys!0 (array!4103 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91240 (= res!46470 (= (arrayCountValidKeys!0 (_keys!4079 (_2!1126 lt!44130)) #b00000000000000000000000000000000 (size!2199 (_keys!4079 (_2!1126 lt!44130)))) (_size!447 (_2!1126 lt!44130))))))

(declare-fun b!91241 () Bool)

(declare-fun res!46471 () Bool)

(assert (=> b!91241 (=> (not res!46471) (not e!59497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4103 (_ BitVec 32)) Bool)

(assert (=> b!91241 (= res!46471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4079 (_2!1126 lt!44130)) (mask!6457 (_2!1126 lt!44130))))))

(declare-fun b!91242 () Bool)

(assert (=> b!91242 (= e!59497 (arrayNoDuplicates!0 (_keys!4079 (_2!1126 lt!44130)) #b00000000000000000000000000000000 Nil!1529))))

(assert (= (and d!24071 res!46469) b!91240))

(assert (= (and b!91240 res!46470) b!91241))

(assert (= (and b!91241 res!46471) b!91242))

(declare-fun m!97973 () Bool)

(assert (=> d!24071 m!97973))

(declare-fun m!97975 () Bool)

(assert (=> b!91240 m!97975))

(declare-fun m!97977 () Bool)

(assert (=> b!91241 m!97977))

(declare-fun m!97979 () Bool)

(assert (=> b!91242 m!97979))

(assert (=> b!90848 d!24071))

(declare-fun d!24073 () Bool)

(assert (=> d!24073 (= (array_inv!1199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvsge (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90842 d!24073))

(declare-fun d!24075 () Bool)

(assert (=> d!24075 (= (array_inv!1200 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (bvsge (size!2200 (_values!2382 (v!2715 (underlying!312 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90842 d!24075))

(declare-fun d!24077 () Bool)

(assert (=> d!24077 (not (arrayContainsKey!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44461 () Unit!2686)

(declare-fun choose!68 (array!4103 (_ BitVec 32) (_ BitVec 64) List!1532) Unit!2686)

(assert (=> d!24077 (= lt!44461 (choose!68 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (Cons!1528 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) Nil!1529)))))

(assert (=> d!24077 (bvslt (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24077 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (Cons!1528 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) Nil!1529)) lt!44461)))

(declare-fun bs!3797 () Bool)

(assert (= bs!3797 d!24077))

(assert (=> bs!3797 m!97519))

(assert (=> bs!3797 m!97543))

(assert (=> bs!3797 m!97519))

(declare-fun m!97981 () Bool)

(assert (=> bs!3797 m!97981))

(assert (=> b!90856 d!24077))

(declare-fun d!24079 () Bool)

(assert (=> d!24079 (arrayNoDuplicates!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) from!355 Nil!1529)))

(declare-fun lt!44464 () Unit!2686)

(declare-fun choose!39 (array!4103 (_ BitVec 32) (_ BitVec 32)) Unit!2686)

(assert (=> d!24079 (= lt!44464 (choose!39 (_keys!4079 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24079 (bvslt (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24079 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44464)))

(declare-fun bs!3798 () Bool)

(assert (= bs!3798 d!24079))

(assert (=> bs!3798 m!97539))

(declare-fun m!97983 () Bool)

(assert (=> bs!3798 m!97983))

(assert (=> b!90856 d!24079))

(declare-fun d!24081 () Bool)

(declare-fun res!46476 () Bool)

(declare-fun e!59502 () Bool)

(assert (=> d!24081 (=> res!46476 e!59502)))

(assert (=> d!24081 (= res!46476 (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(assert (=> d!24081 (= (arrayContainsKey!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59502)))

(declare-fun b!91247 () Bool)

(declare-fun e!59503 () Bool)

(assert (=> b!91247 (= e!59502 e!59503)))

(declare-fun res!46477 () Bool)

(assert (=> b!91247 (=> (not res!46477) (not e!59503))))

(assert (=> b!91247 (= res!46477 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91248 () Bool)

(assert (=> b!91248 (= e!59503 (arrayContainsKey!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24081 (not res!46476)) b!91247))

(assert (= (and b!91247 res!46477) b!91248))

(assert (=> d!24081 m!97823))

(assert (=> b!91248 m!97519))

(declare-fun m!97985 () Bool)

(assert (=> b!91248 m!97985))

(assert (=> b!90856 d!24081))

(declare-fun d!24083 () Bool)

(declare-fun e!59506 () Bool)

(assert (=> d!24083 e!59506))

(declare-fun c!15150 () Bool)

(assert (=> d!24083 (= c!15150 (and (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44467 () Unit!2686)

(declare-fun choose!549 (array!4103 array!4105 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) (_ BitVec 32) Int) Unit!2686)

(assert (=> d!24083 (= lt!44467 (choose!549 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(assert (=> d!24083 (validMask!0 (mask!6457 (v!2715 (underlying!312 thiss!992))))))

(assert (=> d!24083 (= (lemmaListMapContainsThenArrayContainsFrom!70 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) lt!44467)))

(declare-fun b!91253 () Bool)

(assert (=> b!91253 (= e!59506 (arrayContainsKey!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91254 () Bool)

(assert (=> b!91254 (= e!59506 (ite (= (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24083 c!15150) b!91253))

(assert (= (and d!24083 (not c!15150)) b!91254))

(assert (=> d!24083 m!97519))

(declare-fun m!97987 () Bool)

(assert (=> d!24083 m!97987))

(assert (=> d!24083 m!97831))

(assert (=> b!91253 m!97519))

(assert (=> b!91253 m!97543))

(assert (=> b!90856 d!24083))

(declare-fun b!91265 () Bool)

(declare-fun e!59516 () Bool)

(declare-fun contains!768 (List!1532 (_ BitVec 64)) Bool)

(assert (=> b!91265 (= e!59516 (contains!768 Nil!1529 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun d!24085 () Bool)

(declare-fun res!46486 () Bool)

(declare-fun e!59515 () Bool)

(assert (=> d!24085 (=> res!46486 e!59515)))

(assert (=> d!24085 (= res!46486 (bvsge from!355 (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(assert (=> d!24085 (= (arrayNoDuplicates!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) from!355 Nil!1529) e!59515)))

(declare-fun bm!8902 () Bool)

(declare-fun c!15153 () Bool)

(declare-fun call!8905 () Bool)

(assert (=> bm!8902 (= call!8905 (arrayNoDuplicates!0 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15153 (Cons!1528 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355) Nil!1529) Nil!1529)))))

(declare-fun b!91266 () Bool)

(declare-fun e!59518 () Bool)

(declare-fun e!59517 () Bool)

(assert (=> b!91266 (= e!59518 e!59517)))

(assert (=> b!91266 (= c!15153 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91267 () Bool)

(assert (=> b!91267 (= e!59517 call!8905)))

(declare-fun b!91268 () Bool)

(assert (=> b!91268 (= e!59515 e!59518)))

(declare-fun res!46484 () Bool)

(assert (=> b!91268 (=> (not res!46484) (not e!59518))))

(assert (=> b!91268 (= res!46484 (not e!59516))))

(declare-fun res!46485 () Bool)

(assert (=> b!91268 (=> (not res!46485) (not e!59516))))

(assert (=> b!91268 (= res!46485 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun b!91269 () Bool)

(assert (=> b!91269 (= e!59517 call!8905)))

(assert (= (and d!24085 (not res!46486)) b!91268))

(assert (= (and b!91268 res!46485) b!91265))

(assert (= (and b!91268 res!46484) b!91266))

(assert (= (and b!91266 c!15153) b!91269))

(assert (= (and b!91266 (not c!15153)) b!91267))

(assert (= (or b!91269 b!91267) bm!8902))

(assert (=> b!91265 m!97519))

(assert (=> b!91265 m!97519))

(declare-fun m!97989 () Bool)

(assert (=> b!91265 m!97989))

(assert (=> bm!8902 m!97519))

(declare-fun m!97991 () Bool)

(assert (=> bm!8902 m!97991))

(assert (=> b!91266 m!97519))

(assert (=> b!91266 m!97519))

(assert (=> b!91266 m!97891))

(assert (=> b!91268 m!97519))

(assert (=> b!91268 m!97519))

(assert (=> b!91268 m!97891))

(assert (=> b!90856 d!24085))

(declare-fun d!24087 () Bool)

(assert (=> d!24087 (= (map!1218 newMap!16) (getCurrentListMap!438 (_keys!4079 newMap!16) (_values!2382 newMap!16) (mask!6457 newMap!16) (extraKeys!2230 newMap!16) (zeroValue!2287 newMap!16) (minValue!2287 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2399 newMap!16)))))

(declare-fun bs!3799 () Bool)

(assert (= bs!3799 d!24087))

(declare-fun m!97993 () Bool)

(assert (=> bs!3799 m!97993))

(assert (=> b!90860 d!24087))

(declare-fun bm!8903 () Bool)

(declare-fun call!8912 () Bool)

(declare-fun lt!44483 () ListLongMap!1465)

(assert (=> bm!8903 (= call!8912 (contains!765 lt!44483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!24089 () Bool)

(declare-fun e!59522 () Bool)

(assert (=> d!24089 e!59522))

(declare-fun res!46494 () Bool)

(assert (=> d!24089 (=> (not res!46494) (not e!59522))))

(assert (=> d!24089 (= res!46494 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))))

(declare-fun lt!44472 () ListLongMap!1465)

(assert (=> d!24089 (= lt!44483 lt!44472)))

(declare-fun lt!44484 () Unit!2686)

(declare-fun e!59521 () Unit!2686)

(assert (=> d!24089 (= lt!44484 e!59521)))

(declare-fun c!15159 () Bool)

(declare-fun e!59520 () Bool)

(assert (=> d!24089 (= c!15159 e!59520)))

(declare-fun res!46491 () Bool)

(assert (=> d!24089 (=> (not res!46491) (not e!59520))))

(assert (=> d!24089 (= res!46491 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun e!59525 () ListLongMap!1465)

(assert (=> d!24089 (= lt!44472 e!59525)))

(declare-fun c!15154 () Bool)

(assert (=> d!24089 (= c!15154 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24089 (validMask!0 (mask!6457 (v!2715 (underlying!312 thiss!992))))))

(assert (=> d!24089 (= (getCurrentListMap!438 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))) lt!44483)))

(declare-fun b!91270 () Bool)

(declare-fun call!8908 () ListLongMap!1465)

(assert (=> b!91270 (= e!59525 (+!117 call!8908 (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91271 () Bool)

(declare-fun e!59530 () Bool)

(assert (=> b!91271 (= e!59530 (= (apply!86 lt!44483 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!91272 () Bool)

(declare-fun e!59528 () Bool)

(assert (=> b!91272 (= e!59522 e!59528)))

(declare-fun c!15156 () Bool)

(assert (=> b!91272 (= c!15156 (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91273 () Bool)

(declare-fun call!8907 () Bool)

(assert (=> b!91273 (= e!59528 (not call!8907))))

(declare-fun b!91274 () Bool)

(declare-fun e!59527 () Bool)

(assert (=> b!91274 (= e!59527 e!59530)))

(declare-fun res!46493 () Bool)

(assert (=> b!91274 (= res!46493 call!8912)))

(assert (=> b!91274 (=> (not res!46493) (not e!59530))))

(declare-fun b!91275 () Bool)

(declare-fun e!59526 () Bool)

(declare-fun e!59519 () Bool)

(assert (=> b!91275 (= e!59526 e!59519)))

(declare-fun res!46492 () Bool)

(assert (=> b!91275 (=> (not res!46492) (not e!59519))))

(assert (=> b!91275 (= res!46492 (contains!765 lt!44483 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91276 () Bool)

(declare-fun lt!44473 () Unit!2686)

(assert (=> b!91276 (= e!59521 lt!44473)))

(declare-fun lt!44468 () ListLongMap!1465)

(assert (=> b!91276 (= lt!44468 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44481 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44482 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44482 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44480 () Unit!2686)

(assert (=> b!91276 (= lt!44480 (addStillContains!62 lt!44468 lt!44481 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44482))))

(assert (=> b!91276 (contains!765 (+!117 lt!44468 (tuple2!2233 lt!44481 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44482)))

(declare-fun lt!44471 () Unit!2686)

(assert (=> b!91276 (= lt!44471 lt!44480)))

(declare-fun lt!44489 () ListLongMap!1465)

(assert (=> b!91276 (= lt!44489 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44469 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44476 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44476 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44478 () Unit!2686)

(assert (=> b!91276 (= lt!44478 (addApplyDifferent!62 lt!44489 lt!44469 (minValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44476))))

(assert (=> b!91276 (= (apply!86 (+!117 lt!44489 (tuple2!2233 lt!44469 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44476) (apply!86 lt!44489 lt!44476))))

(declare-fun lt!44475 () Unit!2686)

(assert (=> b!91276 (= lt!44475 lt!44478)))

(declare-fun lt!44485 () ListLongMap!1465)

(assert (=> b!91276 (= lt!44485 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44474 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44486 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44486 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44479 () Unit!2686)

(assert (=> b!91276 (= lt!44479 (addApplyDifferent!62 lt!44485 lt!44474 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44486))))

(assert (=> b!91276 (= (apply!86 (+!117 lt!44485 (tuple2!2233 lt!44474 (zeroValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44486) (apply!86 lt!44485 lt!44486))))

(declare-fun lt!44488 () Unit!2686)

(assert (=> b!91276 (= lt!44488 lt!44479)))

(declare-fun lt!44477 () ListLongMap!1465)

(assert (=> b!91276 (= lt!44477 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun lt!44470 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44470 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44487 () (_ BitVec 64))

(assert (=> b!91276 (= lt!44487 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91276 (= lt!44473 (addApplyDifferent!62 lt!44477 lt!44470 (minValue!2287 (v!2715 (underlying!312 thiss!992))) lt!44487))))

(assert (=> b!91276 (= (apply!86 (+!117 lt!44477 (tuple2!2233 lt!44470 (minValue!2287 (v!2715 (underlying!312 thiss!992))))) lt!44487) (apply!86 lt!44477 lt!44487))))

(declare-fun b!91277 () Bool)

(declare-fun e!59524 () Bool)

(assert (=> b!91277 (= e!59528 e!59524)))

(declare-fun res!46488 () Bool)

(assert (=> b!91277 (= res!46488 call!8907)))

(assert (=> b!91277 (=> (not res!46488) (not e!59524))))

(declare-fun b!91278 () Bool)

(declare-fun e!59523 () ListLongMap!1465)

(declare-fun call!8910 () ListLongMap!1465)

(assert (=> b!91278 (= e!59523 call!8910)))

(declare-fun call!8909 () ListLongMap!1465)

(declare-fun bm!8904 () Bool)

(declare-fun call!8911 () ListLongMap!1465)

(declare-fun c!15158 () Bool)

(assert (=> bm!8904 (= call!8908 (+!117 (ite c!15154 call!8909 (ite c!15158 call!8911 call!8910)) (ite (or c!15154 c!15158) (tuple2!2233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2715 (underlying!312 thiss!992)))) (tuple2!2233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))))

(declare-fun bm!8905 () Bool)

(assert (=> bm!8905 (= call!8909 (getCurrentListMapNoExtraKeys!82 (_keys!4079 (v!2715 (underlying!312 thiss!992))) (_values!2382 (v!2715 (underlying!312 thiss!992))) (mask!6457 (v!2715 (underlying!312 thiss!992))) (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) (zeroValue!2287 (v!2715 (underlying!312 thiss!992))) (minValue!2287 (v!2715 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun b!91279 () Bool)

(assert (=> b!91279 (= e!59520 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91280 () Bool)

(declare-fun Unit!2701 () Unit!2686)

(assert (=> b!91280 (= e!59521 Unit!2701)))

(declare-fun b!91281 () Bool)

(declare-fun call!8906 () ListLongMap!1465)

(assert (=> b!91281 (= e!59523 call!8906)))

(declare-fun b!91282 () Bool)

(assert (=> b!91282 (= e!59527 (not call!8912))))

(declare-fun b!91283 () Bool)

(declare-fun e!59531 () ListLongMap!1465)

(assert (=> b!91283 (= e!59525 e!59531)))

(assert (=> b!91283 (= c!15158 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91284 () Bool)

(declare-fun c!15155 () Bool)

(assert (=> b!91284 (= c!15155 (and (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!91284 (= e!59531 e!59523)))

(declare-fun b!91285 () Bool)

(assert (=> b!91285 (= e!59531 call!8906)))

(declare-fun b!91286 () Bool)

(assert (=> b!91286 (= e!59519 (= (apply!86 lt!44483 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2200 (_values!2382 (v!2715 (underlying!312 thiss!992))))))))

(assert (=> b!91286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(declare-fun b!91287 () Bool)

(declare-fun e!59529 () Bool)

(assert (=> b!91287 (= e!59529 (validKeyInArray!0 (select (arr!1952 (_keys!4079 (v!2715 (underlying!312 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8906 () Bool)

(assert (=> bm!8906 (= call!8906 call!8908)))

(declare-fun b!91288 () Bool)

(assert (=> b!91288 (= e!59524 (= (apply!86 lt!44483 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2287 (v!2715 (underlying!312 thiss!992)))))))

(declare-fun bm!8907 () Bool)

(assert (=> bm!8907 (= call!8907 (contains!765 lt!44483 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91289 () Bool)

(declare-fun res!46487 () Bool)

(assert (=> b!91289 (=> (not res!46487) (not e!59522))))

(assert (=> b!91289 (= res!46487 e!59527)))

(declare-fun c!15157 () Bool)

(assert (=> b!91289 (= c!15157 (not (= (bvand (extraKeys!2230 (v!2715 (underlying!312 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8908 () Bool)

(assert (=> bm!8908 (= call!8911 call!8909)))

(declare-fun bm!8909 () Bool)

(assert (=> bm!8909 (= call!8910 call!8911)))

(declare-fun b!91290 () Bool)

(declare-fun res!46490 () Bool)

(assert (=> b!91290 (=> (not res!46490) (not e!59522))))

(assert (=> b!91290 (= res!46490 e!59526)))

(declare-fun res!46495 () Bool)

(assert (=> b!91290 (=> res!46495 e!59526)))

(assert (=> b!91290 (= res!46495 (not e!59529))))

(declare-fun res!46489 () Bool)

(assert (=> b!91290 (=> (not res!46489) (not e!59529))))

(assert (=> b!91290 (= res!46489 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2199 (_keys!4079 (v!2715 (underlying!312 thiss!992))))))))

(assert (= (and d!24089 c!15154) b!91270))

(assert (= (and d!24089 (not c!15154)) b!91283))

(assert (= (and b!91283 c!15158) b!91285))

(assert (= (and b!91283 (not c!15158)) b!91284))

(assert (= (and b!91284 c!15155) b!91281))

(assert (= (and b!91284 (not c!15155)) b!91278))

(assert (= (or b!91281 b!91278) bm!8909))

(assert (= (or b!91285 bm!8909) bm!8908))

(assert (= (or b!91285 b!91281) bm!8906))

(assert (= (or b!91270 bm!8908) bm!8905))

(assert (= (or b!91270 bm!8906) bm!8904))

(assert (= (and d!24089 res!46491) b!91279))

(assert (= (and d!24089 c!15159) b!91276))

(assert (= (and d!24089 (not c!15159)) b!91280))

(assert (= (and d!24089 res!46494) b!91290))

(assert (= (and b!91290 res!46489) b!91287))

(assert (= (and b!91290 (not res!46495)) b!91275))

(assert (= (and b!91275 res!46492) b!91286))

(assert (= (and b!91290 res!46490) b!91289))

(assert (= (and b!91289 c!15157) b!91274))

(assert (= (and b!91289 (not c!15157)) b!91282))

(assert (= (and b!91274 res!46493) b!91271))

(assert (= (or b!91274 b!91282) bm!8903))

(assert (= (and b!91289 res!46487) b!91272))

(assert (= (and b!91272 c!15156) b!91277))

(assert (= (and b!91272 (not c!15156)) b!91273))

(assert (= (and b!91277 res!46488) b!91288))

(assert (= (or b!91277 b!91273) bm!8907))

(declare-fun b_lambda!4023 () Bool)

(assert (=> (not b_lambda!4023) (not b!91286)))

(assert (=> b!91286 t!5342))

(declare-fun b_and!5529 () Bool)

(assert (= b_and!5525 (and (=> t!5342 result!3053) b_and!5529)))

(assert (=> b!91286 t!5344))

(declare-fun b_and!5531 () Bool)

(assert (= b_and!5527 (and (=> t!5344 result!3057) b_and!5531)))

(assert (=> bm!8905 m!97575))

(assert (=> b!91287 m!97823))

(assert (=> b!91287 m!97823))

(assert (=> b!91287 m!97825))

(declare-fun m!97995 () Bool)

(assert (=> b!91270 m!97995))

(declare-fun m!97997 () Bool)

(assert (=> bm!8907 m!97997))

(declare-fun m!97999 () Bool)

(assert (=> bm!8904 m!97999))

(declare-fun m!98001 () Bool)

(assert (=> b!91271 m!98001))

(assert (=> d!24089 m!97831))

(assert (=> b!91276 m!97575))

(declare-fun m!98003 () Bool)

(assert (=> b!91276 m!98003))

(declare-fun m!98005 () Bool)

(assert (=> b!91276 m!98005))

(declare-fun m!98007 () Bool)

(assert (=> b!91276 m!98007))

(declare-fun m!98009 () Bool)

(assert (=> b!91276 m!98009))

(declare-fun m!98011 () Bool)

(assert (=> b!91276 m!98011))

(declare-fun m!98013 () Bool)

(assert (=> b!91276 m!98013))

(declare-fun m!98015 () Bool)

(assert (=> b!91276 m!98015))

(assert (=> b!91276 m!97823))

(assert (=> b!91276 m!98009))

(declare-fun m!98017 () Bool)

(assert (=> b!91276 m!98017))

(assert (=> b!91276 m!98011))

(declare-fun m!98019 () Bool)

(assert (=> b!91276 m!98019))

(declare-fun m!98021 () Bool)

(assert (=> b!91276 m!98021))

(declare-fun m!98023 () Bool)

(assert (=> b!91276 m!98023))

(declare-fun m!98025 () Bool)

(assert (=> b!91276 m!98025))

(declare-fun m!98027 () Bool)

(assert (=> b!91276 m!98027))

(assert (=> b!91276 m!98021))

(declare-fun m!98029 () Bool)

(assert (=> b!91276 m!98029))

(assert (=> b!91276 m!98025))

(declare-fun m!98031 () Bool)

(assert (=> b!91276 m!98031))

(declare-fun m!98033 () Bool)

(assert (=> b!91288 m!98033))

(assert (=> b!91275 m!97823))

(assert (=> b!91275 m!97823))

(declare-fun m!98035 () Bool)

(assert (=> b!91275 m!98035))

(assert (=> b!91279 m!97823))

(assert (=> b!91279 m!97823))

(assert (=> b!91279 m!97825))

(assert (=> b!91286 m!97841))

(assert (=> b!91286 m!97523))

(assert (=> b!91286 m!97845))

(assert (=> b!91286 m!97841))

(assert (=> b!91286 m!97823))

(declare-fun m!98037 () Bool)

(assert (=> b!91286 m!98037))

(assert (=> b!91286 m!97523))

(assert (=> b!91286 m!97823))

(declare-fun m!98039 () Bool)

(assert (=> bm!8903 m!98039))

(assert (=> b!90860 d!24089))

(declare-fun d!24091 () Bool)

(declare-fun res!46496 () Bool)

(declare-fun e!59532 () Bool)

(assert (=> d!24091 (=> (not res!46496) (not e!59532))))

(assert (=> d!24091 (= res!46496 (simpleValid!62 newMap!16))))

(assert (=> d!24091 (= (valid!358 newMap!16) e!59532)))

(declare-fun b!91291 () Bool)

(declare-fun res!46497 () Bool)

(assert (=> b!91291 (=> (not res!46497) (not e!59532))))

(assert (=> b!91291 (= res!46497 (= (arrayCountValidKeys!0 (_keys!4079 newMap!16) #b00000000000000000000000000000000 (size!2199 (_keys!4079 newMap!16))) (_size!447 newMap!16)))))

(declare-fun b!91292 () Bool)

(declare-fun res!46498 () Bool)

(assert (=> b!91292 (=> (not res!46498) (not e!59532))))

(assert (=> b!91292 (= res!46498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4079 newMap!16) (mask!6457 newMap!16)))))

(declare-fun b!91293 () Bool)

(assert (=> b!91293 (= e!59532 (arrayNoDuplicates!0 (_keys!4079 newMap!16) #b00000000000000000000000000000000 Nil!1529))))

(assert (= (and d!24091 res!46496) b!91291))

(assert (= (and b!91291 res!46497) b!91292))

(assert (= (and b!91292 res!46498) b!91293))

(declare-fun m!98041 () Bool)

(assert (=> d!24091 m!98041))

(declare-fun m!98043 () Bool)

(assert (=> b!91291 m!98043))

(declare-fun m!98045 () Bool)

(assert (=> b!91292 m!98045))

(declare-fun m!98047 () Bool)

(assert (=> b!91293 m!98047))

(assert (=> b!90852 d!24091))

(declare-fun d!24093 () Bool)

(assert (=> d!24093 (= (valid!359 thiss!992) (valid!358 (v!2715 (underlying!312 thiss!992))))))

(declare-fun bs!3800 () Bool)

(assert (= bs!3800 d!24093))

(declare-fun m!98049 () Bool)

(assert (=> bs!3800 m!98049))

(assert (=> start!11116 d!24093))

(declare-fun d!24095 () Bool)

(declare-fun c!15162 () Bool)

(assert (=> d!24095 (= c!15162 ((_ is ValueCellFull!944) (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355)))))

(declare-fun e!59535 () V!3081)

(assert (=> d!24095 (= (get!1240 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59535)))

(declare-fun b!91298 () Bool)

(declare-fun get!1243 (ValueCell!944 V!3081) V!3081)

(assert (=> b!91298 (= e!59535 (get!1243 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91299 () Bool)

(declare-fun get!1244 (ValueCell!944 V!3081) V!3081)

(assert (=> b!91299 (= e!59535 (get!1244 (select (arr!1953 (_values!2382 (v!2715 (underlying!312 thiss!992)))) from!355) (dynLambda!355 (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24095 c!15162) b!91298))

(assert (= (and d!24095 (not c!15162)) b!91299))

(assert (=> b!91298 m!97521))

(assert (=> b!91298 m!97523))

(declare-fun m!98051 () Bool)

(assert (=> b!91298 m!98051))

(assert (=> b!91299 m!97521))

(assert (=> b!91299 m!97523))

(declare-fun m!98053 () Bool)

(assert (=> b!91299 m!98053))

(assert (=> b!90846 d!24095))

(declare-fun mapNonEmpty!3559 () Bool)

(declare-fun mapRes!3559 () Bool)

(declare-fun tp!9229 () Bool)

(declare-fun e!59540 () Bool)

(assert (=> mapNonEmpty!3559 (= mapRes!3559 (and tp!9229 e!59540))))

(declare-fun mapRest!3559 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapValue!3559 () ValueCell!944)

(declare-fun mapKey!3559 () (_ BitVec 32))

(assert (=> mapNonEmpty!3559 (= mapRest!3543 (store mapRest!3559 mapKey!3559 mapValue!3559))))

(declare-fun mapIsEmpty!3559 () Bool)

(assert (=> mapIsEmpty!3559 mapRes!3559))

(declare-fun b!91306 () Bool)

(assert (=> b!91306 (= e!59540 tp_is_empty!2575)))

(declare-fun b!91307 () Bool)

(declare-fun e!59541 () Bool)

(assert (=> b!91307 (= e!59541 tp_is_empty!2575)))

(declare-fun condMapEmpty!3559 () Bool)

(declare-fun mapDefault!3559 () ValueCell!944)

(assert (=> mapNonEmpty!3543 (= condMapEmpty!3559 (= mapRest!3543 ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3559)))))

(assert (=> mapNonEmpty!3543 (= tp!9202 (and e!59541 mapRes!3559))))

(assert (= (and mapNonEmpty!3543 condMapEmpty!3559) mapIsEmpty!3559))

(assert (= (and mapNonEmpty!3543 (not condMapEmpty!3559)) mapNonEmpty!3559))

(assert (= (and mapNonEmpty!3559 ((_ is ValueCellFull!944) mapValue!3559)) b!91306))

(assert (= (and mapNonEmpty!3543 ((_ is ValueCellFull!944) mapDefault!3559)) b!91307))

(declare-fun m!98055 () Bool)

(assert (=> mapNonEmpty!3559 m!98055))

(declare-fun mapNonEmpty!3560 () Bool)

(declare-fun mapRes!3560 () Bool)

(declare-fun tp!9230 () Bool)

(declare-fun e!59542 () Bool)

(assert (=> mapNonEmpty!3560 (= mapRes!3560 (and tp!9230 e!59542))))

(declare-fun mapValue!3560 () ValueCell!944)

(declare-fun mapRest!3560 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapKey!3560 () (_ BitVec 32))

(assert (=> mapNonEmpty!3560 (= mapRest!3544 (store mapRest!3560 mapKey!3560 mapValue!3560))))

(declare-fun mapIsEmpty!3560 () Bool)

(assert (=> mapIsEmpty!3560 mapRes!3560))

(declare-fun b!91308 () Bool)

(assert (=> b!91308 (= e!59542 tp_is_empty!2575)))

(declare-fun b!91309 () Bool)

(declare-fun e!59543 () Bool)

(assert (=> b!91309 (= e!59543 tp_is_empty!2575)))

(declare-fun condMapEmpty!3560 () Bool)

(declare-fun mapDefault!3560 () ValueCell!944)

(assert (=> mapNonEmpty!3544 (= condMapEmpty!3560 (= mapRest!3544 ((as const (Array (_ BitVec 32) ValueCell!944)) mapDefault!3560)))))

(assert (=> mapNonEmpty!3544 (= tp!9201 (and e!59543 mapRes!3560))))

(assert (= (and mapNonEmpty!3544 condMapEmpty!3560) mapIsEmpty!3560))

(assert (= (and mapNonEmpty!3544 (not condMapEmpty!3560)) mapNonEmpty!3560))

(assert (= (and mapNonEmpty!3560 ((_ is ValueCellFull!944) mapValue!3560)) b!91308))

(assert (= (and mapNonEmpty!3544 ((_ is ValueCellFull!944) mapDefault!3560)) b!91309))

(declare-fun m!98057 () Bool)

(assert (=> mapNonEmpty!3560 m!98057))

(declare-fun b_lambda!4025 () Bool)

(assert (= b_lambda!4019 (or (and b!90842 b_free!2317) (and b!90844 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))) b_lambda!4025)))

(declare-fun b_lambda!4027 () Bool)

(assert (= b_lambda!4023 (or (and b!90842 b_free!2317) (and b!90844 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))) b_lambda!4027)))

(declare-fun b_lambda!4029 () Bool)

(assert (= b_lambda!4017 (or (and b!90842 b_free!2317) (and b!90844 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))) b_lambda!4029)))

(declare-fun b_lambda!4031 () Bool)

(assert (= b_lambda!4021 (or (and b!90842 b_free!2317) (and b!90844 b_free!2319 (= (defaultEntry!2399 newMap!16) (defaultEntry!2399 (v!2715 (underlying!312 thiss!992))))) b_lambda!4031)))

(check-sat (not b!91124) (not b!91253) (not b!91165) (not bm!8894) (not b!91158) (not b_lambda!4025) (not b!91079) (not b!91248) (not b!91123) (not bm!8856) (not bm!8897) (not b!91163) (not d!24063) (not d!24083) (not b!91126) (not b!91225) (not bm!8862) (not b!91161) (not d!24057) (not b!91002) (not mapNonEmpty!3559) (not b!91275) (not b!91214) (not b!91293) (not b!91160) (not b!91232) (not d!24061) (not b!91151) (not b!91233) (not b!91298) (not b!91241) b_and!5529 (not b!91286) tp_is_empty!2575 (not d!24091) (not b!91125) (not b!91292) (not d!24067) (not b!91240) (not bm!8863) (not bm!8859) (not b_lambda!4031) (not bm!8866) (not b!91266) (not b!91121) (not b!91268) (not bm!8875) (not mapNonEmpty!3560) (not b!91265) (not bm!8893) (not bm!8854) (not bm!8855) (not bm!8852) (not b_next!2319) (not b!91279) (not b!91157) (not b!91242) (not b_lambda!4027) (not b!91291) (not d!24055) (not b!91218) (not bm!8878) (not d!24089) (not b!91122) (not d!24079) (not bm!8902) (not b!91299) (not b!91109) (not d!24071) (not b!91114) (not d!24059) (not d!24065) (not b!91270) (not d!24047) (not b!91082) (not b!91164) (not b_lambda!4029) (not d!24041) (not bm!8874) (not b_lambda!4015) (not b!91156) (not b!91288) (not d!24051) (not b!91111) (not b!91210) (not b!91209) (not b!91166) (not b!91153) (not d!24039) (not bm!8895) (not bm!8858) (not b!91104) (not d!24069) (not b!91227) (not d!24077) b_and!5531 (not b!91230) (not b!91000) (not bm!8903) (not d!24087) (not bm!8907) (not bm!8904) (not b!91215) (not bm!8857) (not b_next!2317) (not d!24049) (not b!91287) (not d!24093) (not b!91162) (not b!91271) (not b!91226) (not b!91276) (not d!24053) (not bm!8905) (not b!91231) (not bm!8869))
(check-sat b_and!5529 b_and!5531 (not b_next!2317) (not b_next!2319))
