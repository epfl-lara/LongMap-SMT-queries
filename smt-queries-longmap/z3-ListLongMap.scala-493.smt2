; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11110 () Bool)

(assert start!11110)

(declare-fun b!90586 () Bool)

(declare-fun b_free!2305 () Bool)

(declare-fun b_next!2305 () Bool)

(assert (=> b!90586 (= b_free!2305 (not b_next!2305))))

(declare-fun tp!9165 () Bool)

(declare-fun b_and!5461 () Bool)

(assert (=> b!90586 (= tp!9165 b_and!5461)))

(declare-fun b!90582 () Bool)

(declare-fun b_free!2307 () Bool)

(declare-fun b_next!2307 () Bool)

(assert (=> b!90582 (= b_free!2307 (not b_next!2307))))

(declare-fun tp!9163 () Bool)

(declare-fun b_and!5463 () Bool)

(assert (=> b!90582 (= tp!9163 b_and!5463)))

(declare-fun b!90569 () Bool)

(declare-fun e!59038 () Bool)

(declare-fun e!59029 () Bool)

(assert (=> b!90569 (= e!59038 e!59029)))

(declare-fun res!46199 () Bool)

(assert (=> b!90569 (=> (not res!46199) (not e!59029))))

(declare-datatypes ((V!3073 0))(
  ( (V!3074 (val!1329 Int)) )
))
(declare-datatypes ((array!4085 0))(
  ( (array!4086 (arr!1942 (Array (_ BitVec 32) (_ BitVec 64))) (size!2190 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!941 0))(
  ( (ValueCellFull!941 (v!2698 V!3073)) (EmptyCell!941) )
))
(declare-datatypes ((array!4087 0))(
  ( (array!4088 (arr!1943 (Array (_ BitVec 32) ValueCell!941)) (size!2191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!790 0))(
  ( (LongMapFixedSize!791 (defaultEntry!2396 Int) (mask!6451 (_ BitVec 32)) (extraKeys!2227 (_ BitVec 32)) (zeroValue!2284 V!3073) (minValue!2284 V!3073) (_size!444 (_ BitVec 32)) (_keys!4075 array!4085) (_values!2379 array!4087) (_vacant!444 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2244 0))(
  ( (tuple2!2245 (_1!1133 Bool) (_2!1133 LongMapFixedSize!790)) )
))
(declare-fun lt!43916 () tuple2!2244)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!90569 (= res!46199 (and (_1!1133 lt!43916) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2698 0))(
  ( (Unit!2699) )
))
(declare-fun lt!43922 () Unit!2698)

(declare-fun e!59025 () Unit!2698)

(assert (=> b!90569 (= lt!43922 e!59025)))

(declare-datatypes ((Cell!582 0))(
  ( (Cell!583 (v!2699 LongMapFixedSize!790)) )
))
(declare-datatypes ((LongMap!582 0))(
  ( (LongMap!583 (underlying!302 Cell!582)) )
))
(declare-fun thiss!992 () LongMap!582)

(declare-fun c!15034 () Bool)

(declare-datatypes ((tuple2!2246 0))(
  ( (tuple2!2247 (_1!1134 (_ BitVec 64)) (_2!1134 V!3073)) )
))
(declare-datatypes ((List!1549 0))(
  ( (Nil!1546) (Cons!1545 (h!2137 tuple2!2246) (t!5350 List!1549)) )
))
(declare-datatypes ((ListLongMap!1473 0))(
  ( (ListLongMap!1474 (toList!752 List!1549)) )
))
(declare-fun lt!43921 () ListLongMap!1473)

(declare-fun contains!768 (ListLongMap!1473 (_ BitVec 64)) Bool)

(assert (=> b!90569 (= c!15034 (contains!768 lt!43921 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355)))))

(declare-fun lt!43917 () V!3073)

(declare-fun newMap!16 () LongMapFixedSize!790)

(declare-fun update!130 (LongMapFixedSize!790 (_ BitVec 64) V!3073) tuple2!2244)

(assert (=> b!90569 (= lt!43916 (update!130 newMap!16 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) lt!43917))))

(declare-fun b!90570 () Bool)

(declare-fun res!46205 () Bool)

(declare-fun e!59033 () Bool)

(assert (=> b!90570 (=> (not res!46205) (not e!59033))))

(assert (=> b!90570 (= res!46205 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6451 newMap!16)) (_size!444 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun mapNonEmpty!3525 () Bool)

(declare-fun mapRes!3526 () Bool)

(declare-fun tp!9166 () Bool)

(declare-fun e!59035 () Bool)

(assert (=> mapNonEmpty!3525 (= mapRes!3526 (and tp!9166 e!59035))))

(declare-fun mapKey!3525 () (_ BitVec 32))

(declare-fun mapValue!3525 () ValueCell!941)

(declare-fun mapRest!3525 () (Array (_ BitVec 32) ValueCell!941))

(assert (=> mapNonEmpty!3525 (= (arr!1943 (_values!2379 newMap!16)) (store mapRest!3525 mapKey!3525 mapValue!3525))))

(declare-fun b!90572 () Bool)

(declare-fun e!59027 () Bool)

(declare-fun e!59036 () Bool)

(assert (=> b!90572 (= e!59027 e!59036)))

(declare-fun b!90573 () Bool)

(declare-fun e!59026 () Bool)

(assert (=> b!90573 (= e!59029 (not e!59026))))

(declare-fun res!46200 () Bool)

(assert (=> b!90573 (=> res!46200 e!59026)))

(declare-fun getCurrentListMap!435 (array!4085 array!4087 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1473)

(declare-fun map!1207 (LongMapFixedSize!790) ListLongMap!1473)

(assert (=> b!90573 (= res!46200 (not (= (getCurrentListMap!435 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (_values!2379 (v!2699 (underlying!302 thiss!992))) (mask!6451 (v!2699 (underlying!302 thiss!992))) (extraKeys!2227 (v!2699 (underlying!302 thiss!992))) (zeroValue!2284 (v!2699 (underlying!302 thiss!992))) (minValue!2284 (v!2699 (underlying!302 thiss!992))) from!355 (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))) (map!1207 (_2!1133 lt!43916)))))))

(declare-fun lt!43910 () tuple2!2246)

(declare-fun lt!43924 () ListLongMap!1473)

(declare-fun lt!43914 () ListLongMap!1473)

(declare-fun lt!43925 () tuple2!2246)

(declare-fun +!117 (ListLongMap!1473 tuple2!2246) ListLongMap!1473)

(assert (=> b!90573 (= (+!117 lt!43914 lt!43925) (+!117 (+!117 lt!43924 lt!43925) lt!43910))))

(assert (=> b!90573 (= lt!43925 (tuple2!2247 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun lt!43923 () Unit!2698)

(declare-fun addCommutativeForDiffKeys!36 (ListLongMap!1473 (_ BitVec 64) V!3073 (_ BitVec 64) V!3073) Unit!2698)

(assert (=> b!90573 (= lt!43923 (addCommutativeForDiffKeys!36 lt!43924 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) lt!43917 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun lt!43920 () ListLongMap!1473)

(assert (=> b!90573 (= lt!43920 lt!43914)))

(assert (=> b!90573 (= lt!43914 (+!117 lt!43924 lt!43910))))

(declare-fun lt!43918 () ListLongMap!1473)

(declare-fun lt!43911 () tuple2!2246)

(assert (=> b!90573 (= lt!43920 (+!117 lt!43918 lt!43911))))

(declare-fun lt!43912 () ListLongMap!1473)

(assert (=> b!90573 (= lt!43924 (+!117 lt!43912 lt!43911))))

(assert (=> b!90573 (= lt!43911 (tuple2!2247 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2699 (underlying!302 thiss!992)))))))

(assert (=> b!90573 (= lt!43918 (+!117 lt!43912 lt!43910))))

(assert (=> b!90573 (= lt!43910 (tuple2!2247 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) lt!43917))))

(declare-fun lt!43919 () Unit!2698)

(assert (=> b!90573 (= lt!43919 (addCommutativeForDiffKeys!36 lt!43912 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) lt!43917 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!81 (array!4085 array!4087 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1473)

(assert (=> b!90573 (= lt!43912 (getCurrentListMapNoExtraKeys!81 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (_values!2379 (v!2699 (underlying!302 thiss!992))) (mask!6451 (v!2699 (underlying!302 thiss!992))) (extraKeys!2227 (v!2699 (underlying!302 thiss!992))) (zeroValue!2284 (v!2699 (underlying!302 thiss!992))) (minValue!2284 (v!2699 (underlying!302 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun b!90574 () Bool)

(declare-fun Unit!2700 () Unit!2698)

(assert (=> b!90574 (= e!59025 Unit!2700)))

(declare-fun lt!43909 () Unit!2698)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!78 (array!4085 array!4087 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 64) (_ BitVec 32) Int) Unit!2698)

(assert (=> b!90574 (= lt!43909 (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (_values!2379 (v!2699 (underlying!302 thiss!992))) (mask!6451 (v!2699 (underlying!302 thiss!992))) (extraKeys!2227 (v!2699 (underlying!302 thiss!992))) (zeroValue!2284 (v!2699 (underlying!302 thiss!992))) (minValue!2284 (v!2699 (underlying!302 thiss!992))) (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90574 (arrayContainsKey!0 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43913 () Unit!2698)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4085 (_ BitVec 32) (_ BitVec 32)) Unit!2698)

(assert (=> b!90574 (= lt!43913 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4075 (v!2699 (underlying!302 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1550 0))(
  ( (Nil!1547) (Cons!1546 (h!2138 (_ BitVec 64)) (t!5351 List!1550)) )
))
(declare-fun arrayNoDuplicates!0 (array!4085 (_ BitVec 32) List!1550) Bool)

(assert (=> b!90574 (arrayNoDuplicates!0 (_keys!4075 (v!2699 (underlying!302 thiss!992))) from!355 Nil!1547)))

(declare-fun lt!43926 () Unit!2698)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4085 (_ BitVec 32) (_ BitVec 64) List!1550) Unit!2698)

(assert (=> b!90574 (= lt!43926 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) (Cons!1546 (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) Nil!1547)))))

(assert (=> b!90574 false))

(declare-fun b!90575 () Bool)

(declare-fun res!46198 () Bool)

(assert (=> b!90575 (=> (not res!46198) (not e!59033))))

(assert (=> b!90575 (= res!46198 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2190 (_keys!4075 (v!2699 (underlying!302 thiss!992)))))))))

(declare-fun b!90576 () Bool)

(declare-fun e!59028 () Bool)

(assert (=> b!90576 (= e!59028 e!59027)))

(declare-fun b!90577 () Bool)

(declare-fun e!59039 () Bool)

(assert (=> b!90577 (= e!59039 e!59038)))

(declare-fun res!46203 () Bool)

(assert (=> b!90577 (=> (not res!46203) (not e!59038))))

(assert (=> b!90577 (= res!46203 (and (not (= (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1942 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1233 (ValueCell!941 V!3073) V!3073)

(declare-fun dynLambda!353 (Int (_ BitVec 64)) V!3073)

(assert (=> b!90577 (= lt!43917 (get!1233 (select (arr!1943 (_values!2379 (v!2699 (underlying!302 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2396 (v!2699 (underlying!302 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90578 () Bool)

(declare-fun res!46204 () Bool)

(assert (=> b!90578 (=> (not res!46204) (not e!59033))))

(declare-fun valid!355 (LongMapFixedSize!790) Bool)

(assert (=> b!90578 (= res!46204 (valid!355 newMap!16))))

(declare-fun b!90579 () Bool)

(assert (=> b!90579 (= e!59033 e!59039)))

(declare-fun res!46202 () Bool)

(assert (=> b!90579 (=> (not res!46202) (not e!59039))))

(declare-fun lt!43915 () ListLongMap!1473)

(assert (=> b!90579 (= res!46202 (= lt!43915 lt!43921))))

(assert (=> b!90579 (= lt!43921 (map!1207 newMap!16))))

(assert (=> b!90579 (= lt!43915 (getCurrentListMap!435 (_keys!4075 (v!2699 (underlying!302 thiss!992))) (_values!2379 (v!2699 (underlying!302 thiss!992))) (mask!6451 (v!2699 (underlying!302 thiss!992))) (extraKeys!2227 (v!2699 (underlying!302 thiss!992))) (zeroValue!2284 (v!2699 (underlying!302 thiss!992))) (minValue!2284 (v!2699 (underlying!302 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))))))

(declare-fun b!90580 () Bool)

(declare-fun Unit!2701 () Unit!2698)

(assert (=> b!90580 (= e!59025 Unit!2701)))

(declare-fun b!90581 () Bool)

(declare-fun tp_is_empty!2569 () Bool)

(assert (=> b!90581 (= e!59035 tp_is_empty!2569)))

(declare-fun e!59022 () Bool)

(declare-fun e!59024 () Bool)

(declare-fun array_inv!1217 (array!4085) Bool)

(declare-fun array_inv!1218 (array!4087) Bool)

(assert (=> b!90582 (= e!59022 (and tp!9163 tp_is_empty!2569 (array_inv!1217 (_keys!4075 newMap!16)) (array_inv!1218 (_values!2379 newMap!16)) e!59024))))

(declare-fun b!90571 () Bool)

(declare-fun e!59034 () Bool)

(assert (=> b!90571 (= e!59034 tp_is_empty!2569)))

(declare-fun res!46201 () Bool)

(assert (=> start!11110 (=> (not res!46201) (not e!59033))))

(declare-fun valid!356 (LongMap!582) Bool)

(assert (=> start!11110 (= res!46201 (valid!356 thiss!992))))

(assert (=> start!11110 e!59033))

(assert (=> start!11110 e!59028))

(assert (=> start!11110 true))

(assert (=> start!11110 e!59022))

(declare-fun b!90583 () Bool)

(assert (=> b!90583 (= e!59026 (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2190 (_keys!4075 (v!2699 (underlying!302 thiss!992))))))))

(declare-fun b!90584 () Bool)

(assert (=> b!90584 (= e!59024 (and e!59034 mapRes!3526))))

(declare-fun condMapEmpty!3525 () Bool)

(declare-fun mapDefault!3525 () ValueCell!941)

(assert (=> b!90584 (= condMapEmpty!3525 (= (arr!1943 (_values!2379 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!941)) mapDefault!3525)))))

(declare-fun mapNonEmpty!3526 () Bool)

(declare-fun mapRes!3525 () Bool)

(declare-fun tp!9164 () Bool)

(declare-fun e!59037 () Bool)

(assert (=> mapNonEmpty!3526 (= mapRes!3525 (and tp!9164 e!59037))))

(declare-fun mapRest!3526 () (Array (_ BitVec 32) ValueCell!941))

(declare-fun mapValue!3526 () ValueCell!941)

(declare-fun mapKey!3526 () (_ BitVec 32))

(assert (=> mapNonEmpty!3526 (= (arr!1943 (_values!2379 (v!2699 (underlying!302 thiss!992)))) (store mapRest!3526 mapKey!3526 mapValue!3526))))

(declare-fun mapIsEmpty!3525 () Bool)

(assert (=> mapIsEmpty!3525 mapRes!3526))

(declare-fun b!90585 () Bool)

(assert (=> b!90585 (= e!59037 tp_is_empty!2569)))

(declare-fun mapIsEmpty!3526 () Bool)

(assert (=> mapIsEmpty!3526 mapRes!3525))

(declare-fun e!59031 () Bool)

(assert (=> b!90586 (= e!59036 (and tp!9165 tp_is_empty!2569 (array_inv!1217 (_keys!4075 (v!2699 (underlying!302 thiss!992)))) (array_inv!1218 (_values!2379 (v!2699 (underlying!302 thiss!992)))) e!59031))))

(declare-fun b!90587 () Bool)

(declare-fun e!59023 () Bool)

(assert (=> b!90587 (= e!59023 tp_is_empty!2569)))

(declare-fun b!90588 () Bool)

(assert (=> b!90588 (= e!59031 (and e!59023 mapRes!3525))))

(declare-fun condMapEmpty!3526 () Bool)

(declare-fun mapDefault!3526 () ValueCell!941)

(assert (=> b!90588 (= condMapEmpty!3526 (= (arr!1943 (_values!2379 (v!2699 (underlying!302 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!941)) mapDefault!3526)))))

(assert (= (and start!11110 res!46201) b!90575))

(assert (= (and b!90575 res!46198) b!90578))

(assert (= (and b!90578 res!46204) b!90570))

(assert (= (and b!90570 res!46205) b!90579))

(assert (= (and b!90579 res!46202) b!90577))

(assert (= (and b!90577 res!46203) b!90569))

(assert (= (and b!90569 c!15034) b!90574))

(assert (= (and b!90569 (not c!15034)) b!90580))

(assert (= (and b!90569 res!46199) b!90573))

(assert (= (and b!90573 (not res!46200)) b!90583))

(assert (= (and b!90588 condMapEmpty!3526) mapIsEmpty!3526))

(assert (= (and b!90588 (not condMapEmpty!3526)) mapNonEmpty!3526))

(get-info :version)

(assert (= (and mapNonEmpty!3526 ((_ is ValueCellFull!941) mapValue!3526)) b!90585))

(assert (= (and b!90588 ((_ is ValueCellFull!941) mapDefault!3526)) b!90587))

(assert (= b!90586 b!90588))

(assert (= b!90572 b!90586))

(assert (= b!90576 b!90572))

(assert (= start!11110 b!90576))

(assert (= (and b!90584 condMapEmpty!3525) mapIsEmpty!3525))

(assert (= (and b!90584 (not condMapEmpty!3525)) mapNonEmpty!3525))

(assert (= (and mapNonEmpty!3525 ((_ is ValueCellFull!941) mapValue!3525)) b!90581))

(assert (= (and b!90584 ((_ is ValueCellFull!941) mapDefault!3525)) b!90571))

(assert (= b!90582 b!90584))

(assert (= start!11110 b!90582))

(declare-fun b_lambda!3995 () Bool)

(assert (=> (not b_lambda!3995) (not b!90577)))

(declare-fun t!5347 () Bool)

(declare-fun tb!1769 () Bool)

(assert (=> (and b!90586 (= (defaultEntry!2396 (v!2699 (underlying!302 thiss!992))) (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))) t!5347) tb!1769))

(declare-fun result!3035 () Bool)

(assert (=> tb!1769 (= result!3035 tp_is_empty!2569)))

(assert (=> b!90577 t!5347))

(declare-fun b_and!5465 () Bool)

(assert (= b_and!5461 (and (=> t!5347 result!3035) b_and!5465)))

(declare-fun t!5349 () Bool)

(declare-fun tb!1771 () Bool)

(assert (=> (and b!90582 (= (defaultEntry!2396 newMap!16) (defaultEntry!2396 (v!2699 (underlying!302 thiss!992)))) t!5349) tb!1771))

(declare-fun result!3039 () Bool)

(assert (= result!3039 result!3035))

(assert (=> b!90577 t!5349))

(declare-fun b_and!5467 () Bool)

(assert (= b_and!5463 (and (=> t!5349 result!3039) b_and!5467)))

(declare-fun m!97159 () Bool)

(assert (=> b!90578 m!97159))

(declare-fun m!97161 () Bool)

(assert (=> b!90569 m!97161))

(assert (=> b!90569 m!97161))

(declare-fun m!97163 () Bool)

(assert (=> b!90569 m!97163))

(assert (=> b!90569 m!97161))

(declare-fun m!97165 () Bool)

(assert (=> b!90569 m!97165))

(declare-fun m!97167 () Bool)

(assert (=> b!90582 m!97167))

(declare-fun m!97169 () Bool)

(assert (=> b!90582 m!97169))

(declare-fun m!97171 () Bool)

(assert (=> b!90579 m!97171))

(declare-fun m!97173 () Bool)

(assert (=> b!90579 m!97173))

(declare-fun m!97175 () Bool)

(assert (=> mapNonEmpty!3525 m!97175))

(assert (=> b!90577 m!97161))

(declare-fun m!97177 () Bool)

(assert (=> b!90577 m!97177))

(declare-fun m!97179 () Bool)

(assert (=> b!90577 m!97179))

(assert (=> b!90577 m!97177))

(assert (=> b!90577 m!97179))

(declare-fun m!97181 () Bool)

(assert (=> b!90577 m!97181))

(declare-fun m!97183 () Bool)

(assert (=> start!11110 m!97183))

(declare-fun m!97185 () Bool)

(assert (=> b!90586 m!97185))

(declare-fun m!97187 () Bool)

(assert (=> b!90586 m!97187))

(declare-fun m!97189 () Bool)

(assert (=> b!90573 m!97189))

(assert (=> b!90573 m!97161))

(declare-fun m!97191 () Bool)

(assert (=> b!90573 m!97191))

(declare-fun m!97193 () Bool)

(assert (=> b!90573 m!97193))

(assert (=> b!90573 m!97161))

(declare-fun m!97195 () Bool)

(assert (=> b!90573 m!97195))

(declare-fun m!97197 () Bool)

(assert (=> b!90573 m!97197))

(assert (=> b!90573 m!97161))

(declare-fun m!97199 () Bool)

(assert (=> b!90573 m!97199))

(declare-fun m!97201 () Bool)

(assert (=> b!90573 m!97201))

(declare-fun m!97203 () Bool)

(assert (=> b!90573 m!97203))

(declare-fun m!97205 () Bool)

(assert (=> b!90573 m!97205))

(declare-fun m!97207 () Bool)

(assert (=> b!90573 m!97207))

(declare-fun m!97209 () Bool)

(assert (=> b!90573 m!97209))

(assert (=> b!90573 m!97205))

(declare-fun m!97211 () Bool)

(assert (=> b!90573 m!97211))

(declare-fun m!97213 () Bool)

(assert (=> mapNonEmpty!3526 m!97213))

(declare-fun m!97215 () Bool)

(assert (=> b!90574 m!97215))

(declare-fun m!97217 () Bool)

(assert (=> b!90574 m!97217))

(assert (=> b!90574 m!97161))

(declare-fun m!97219 () Bool)

(assert (=> b!90574 m!97219))

(assert (=> b!90574 m!97161))

(assert (=> b!90574 m!97161))

(declare-fun m!97221 () Bool)

(assert (=> b!90574 m!97221))

(assert (=> b!90574 m!97161))

(declare-fun m!97223 () Bool)

(assert (=> b!90574 m!97223))

(check-sat (not b!90577) (not b_next!2305) (not b!90573) (not b!90579) (not start!11110) (not b_next!2307) (not b!90586) (not b_lambda!3995) b_and!5467 (not mapNonEmpty!3525) b_and!5465 (not b!90569) tp_is_empty!2569 (not mapNonEmpty!3526) (not b!90578) (not b!90582) (not b!90574))
(check-sat b_and!5465 b_and!5467 (not b_next!2305) (not b_next!2307))
