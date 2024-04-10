; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13064 () Bool)

(assert start!13064)

(declare-fun b!113963 () Bool)

(declare-fun b_free!2605 () Bool)

(declare-fun b_next!2605 () Bool)

(assert (=> b!113963 (= b_free!2605 (not b_next!2605))))

(declare-fun tp!10174 () Bool)

(declare-fun b_and!7003 () Bool)

(assert (=> b!113963 (= tp!10174 b_and!7003)))

(declare-fun b!113960 () Bool)

(declare-fun b_free!2607 () Bool)

(declare-fun b_next!2607 () Bool)

(assert (=> b!113960 (= b_free!2607 (not b_next!2607))))

(declare-fun tp!10176 () Bool)

(declare-fun b_and!7005 () Bool)

(assert (=> b!113960 (= tp!10176 b_and!7005)))

(declare-fun b!113947 () Bool)

(declare-fun e!74064 () Bool)

(declare-fun tp_is_empty!2719 () Bool)

(assert (=> b!113947 (= e!74064 tp_is_empty!2719)))

(declare-fun mapIsEmpty!4085 () Bool)

(declare-fun mapRes!4086 () Bool)

(assert (=> mapIsEmpty!4085 mapRes!4086))

(declare-fun b!113948 () Bool)

(declare-fun e!74075 () Bool)

(assert (=> b!113948 (= e!74075 tp_is_empty!2719)))

(declare-fun b!113950 () Bool)

(declare-fun e!74073 () Bool)

(declare-fun e!74065 () Bool)

(assert (=> b!113950 (= e!74073 e!74065)))

(declare-fun res!56131 () Bool)

(assert (=> b!113950 (=> (not res!56131) (not e!74065))))

(declare-datatypes ((V!3273 0))(
  ( (V!3274 (val!1404 Int)) )
))
(declare-datatypes ((tuple2!2466 0))(
  ( (tuple2!2467 (_1!1244 (_ BitVec 64)) (_2!1244 V!3273)) )
))
(declare-datatypes ((List!1646 0))(
  ( (Nil!1643) (Cons!1642 (h!2242 tuple2!2466) (t!5844 List!1646)) )
))
(declare-datatypes ((ListLongMap!1607 0))(
  ( (ListLongMap!1608 (toList!819 List!1646)) )
))
(declare-fun lt!59198 () ListLongMap!1607)

(declare-fun lt!59196 () ListLongMap!1607)

(assert (=> b!113950 (= res!56131 (= lt!59198 lt!59196))))

(declare-datatypes ((array!4439 0))(
  ( (array!4440 (arr!2103 (Array (_ BitVec 32) (_ BitVec 64))) (size!2363 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1016 0))(
  ( (ValueCellFull!1016 (v!2975 V!3273)) (EmptyCell!1016) )
))
(declare-datatypes ((array!4441 0))(
  ( (array!4442 (arr!2104 (Array (_ BitVec 32) ValueCell!1016)) (size!2364 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!940 0))(
  ( (LongMapFixedSize!941 (defaultEntry!2676 Int) (mask!6868 (_ BitVec 32)) (extraKeys!2465 (_ BitVec 32)) (zeroValue!2543 V!3273) (minValue!2543 V!3273) (_size!519 (_ BitVec 32)) (_keys!4398 array!4439) (_values!2659 array!4441) (_vacant!519 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!940)

(declare-fun map!1313 (LongMapFixedSize!940) ListLongMap!1607)

(assert (=> b!113950 (= lt!59196 (map!1313 newMap!16))))

(declare-datatypes ((Cell!740 0))(
  ( (Cell!741 (v!2976 LongMapFixedSize!940)) )
))
(declare-datatypes ((LongMap!740 0))(
  ( (LongMap!741 (underlying!381 Cell!740)) )
))
(declare-fun thiss!992 () LongMap!740)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!502 (array!4439 array!4441 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1607)

(assert (=> b!113950 (= lt!59198 (getCurrentListMap!502 (_keys!4398 (v!2976 (underlying!381 thiss!992))) (_values!2659 (v!2976 (underlying!381 thiss!992))) (mask!6868 (v!2976 (underlying!381 thiss!992))) (extraKeys!2465 (v!2976 (underlying!381 thiss!992))) (zeroValue!2543 (v!2976 (underlying!381 thiss!992))) (minValue!2543 (v!2976 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2976 (underlying!381 thiss!992)))))))

(declare-fun b!113951 () Bool)

(declare-fun e!74062 () Bool)

(declare-fun e!74070 () Bool)

(assert (=> b!113951 (= e!74062 e!74070)))

(declare-fun b!113952 () Bool)

(declare-fun e!74068 () Bool)

(assert (=> b!113952 (= e!74068 tp_is_empty!2719)))

(declare-fun b!113953 () Bool)

(declare-fun res!56136 () Bool)

(assert (=> b!113953 (=> (not res!56136) (not e!74073))))

(declare-fun valid!442 (LongMapFixedSize!940) Bool)

(assert (=> b!113953 (= res!56136 (valid!442 newMap!16))))

(declare-fun mapNonEmpty!4085 () Bool)

(declare-fun mapRes!4085 () Bool)

(declare-fun tp!10175 () Bool)

(declare-fun e!74069 () Bool)

(assert (=> mapNonEmpty!4085 (= mapRes!4085 (and tp!10175 e!74069))))

(declare-fun mapValue!4086 () ValueCell!1016)

(declare-fun mapKey!4086 () (_ BitVec 32))

(declare-fun mapRest!4086 () (Array (_ BitVec 32) ValueCell!1016))

(assert (=> mapNonEmpty!4085 (= (arr!2104 (_values!2659 (v!2976 (underlying!381 thiss!992)))) (store mapRest!4086 mapKey!4086 mapValue!4086))))

(declare-fun b!113954 () Bool)

(declare-fun e!74066 () Bool)

(assert (=> b!113954 (= e!74066 (not true))))

(declare-fun lt!59192 () ListLongMap!1607)

(declare-fun lt!59195 () tuple2!2466)

(declare-fun lt!59191 () tuple2!2466)

(declare-fun +!157 (ListLongMap!1607 tuple2!2466) ListLongMap!1607)

(assert (=> b!113954 (= (+!157 (+!157 lt!59192 lt!59195) lt!59191) (+!157 (+!157 lt!59192 lt!59191) lt!59195))))

(assert (=> b!113954 (= lt!59191 (tuple2!2467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2976 (underlying!381 thiss!992)))))))

(declare-fun lt!59190 () V!3273)

(assert (=> b!113954 (= lt!59195 (tuple2!2467 (select (arr!2103 (_keys!4398 (v!2976 (underlying!381 thiss!992)))) from!355) lt!59190))))

(declare-datatypes ((Unit!3559 0))(
  ( (Unit!3560) )
))
(declare-fun lt!59189 () Unit!3559)

(declare-fun addCommutativeForDiffKeys!69 (ListLongMap!1607 (_ BitVec 64) V!3273 (_ BitVec 64) V!3273) Unit!3559)

(assert (=> b!113954 (= lt!59189 (addCommutativeForDiffKeys!69 lt!59192 (select (arr!2103 (_keys!4398 (v!2976 (underlying!381 thiss!992)))) from!355) lt!59190 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2976 (underlying!381 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!123 (array!4439 array!4441 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1607)

(assert (=> b!113954 (= lt!59192 (getCurrentListMapNoExtraKeys!123 (_keys!4398 (v!2976 (underlying!381 thiss!992))) (_values!2659 (v!2976 (underlying!381 thiss!992))) (mask!6868 (v!2976 (underlying!381 thiss!992))) (extraKeys!2465 (v!2976 (underlying!381 thiss!992))) (zeroValue!2543 (v!2976 (underlying!381 thiss!992))) (minValue!2543 (v!2976 (underlying!381 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2976 (underlying!381 thiss!992)))))))

(declare-fun b!113955 () Bool)

(declare-fun e!74078 () Bool)

(assert (=> b!113955 (= e!74078 e!74066)))

(declare-fun res!56135 () Bool)

(assert (=> b!113955 (=> (not res!56135) (not e!74066))))

(declare-datatypes ((tuple2!2468 0))(
  ( (tuple2!2469 (_1!1245 Bool) (_2!1245 LongMapFixedSize!940)) )
))
(declare-fun lt!59188 () tuple2!2468)

(assert (=> b!113955 (= res!56135 (and (_1!1245 lt!59188) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59194 () Unit!3559)

(declare-fun e!74067 () Unit!3559)

(assert (=> b!113955 (= lt!59194 e!74067)))

(declare-fun c!20405 () Bool)

(declare-fun contains!850 (ListLongMap!1607 (_ BitVec 64)) Bool)

(assert (=> b!113955 (= c!20405 (contains!850 lt!59196 (select (arr!2103 (_keys!4398 (v!2976 (underlying!381 thiss!992)))) from!355)))))

(declare-fun update!168 (LongMapFixedSize!940 (_ BitVec 64) V!3273) tuple2!2468)

(assert (=> b!113955 (= lt!59188 (update!168 newMap!16 (select (arr!2103 (_keys!4398 (v!2976 (underlying!381 thiss!992)))) from!355) lt!59190))))

(declare-fun b!113956 () Bool)

(declare-fun e!74074 () Bool)

(assert (=> b!113956 (= e!74074 (and e!74068 mapRes!4085))))

(declare-fun condMapEmpty!4085 () Bool)

(declare-fun mapDefault!4086 () ValueCell!1016)

