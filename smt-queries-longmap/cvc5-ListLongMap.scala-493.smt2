; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11106 () Bool)

(assert start!11106)

(declare-fun b!90707 () Bool)

(declare-fun b_free!2305 () Bool)

(declare-fun b_next!2305 () Bool)

(assert (=> b!90707 (= b_free!2305 (not b_next!2305))))

(declare-fun tp!9165 () Bool)

(declare-fun b_and!5475 () Bool)

(assert (=> b!90707 (= tp!9165 b_and!5475)))

(declare-fun b!90713 () Bool)

(declare-fun b_free!2307 () Bool)

(declare-fun b_next!2307 () Bool)

(assert (=> b!90713 (= b_free!2307 (not b_next!2307))))

(declare-fun tp!9164 () Bool)

(declare-fun b_and!5477 () Bool)

(assert (=> b!90713 (= tp!9164 b_and!5477)))

(declare-datatypes ((V!3073 0))(
  ( (V!3074 (val!1329 Int)) )
))
(declare-datatypes ((array!4105 0))(
  ( (array!4106 (arr!1953 (Array (_ BitVec 32) (_ BitVec 64))) (size!2200 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!941 0))(
  ( (ValueCellFull!941 (v!2704 V!3073)) (EmptyCell!941) )
))
(declare-datatypes ((array!4107 0))(
  ( (array!4108 (arr!1954 (Array (_ BitVec 32) ValueCell!941)) (size!2201 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!790 0))(
  ( (LongMapFixedSize!791 (defaultEntry!2396 Int) (mask!6452 (_ BitVec 32)) (extraKeys!2227 (_ BitVec 32)) (zeroValue!2284 V!3073) (minValue!2284 V!3073) (_size!444 (_ BitVec 32)) (_keys!4076 array!4105) (_values!2379 array!4107) (_vacant!444 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!590 0))(
  ( (Cell!591 (v!2705 LongMapFixedSize!790)) )
))
(declare-datatypes ((LongMap!590 0))(
  ( (LongMap!591 (underlying!306 Cell!590)) )
))
(declare-fun thiss!992 () LongMap!590)

(declare-fun e!59123 () Bool)

(declare-fun e!59109 () Bool)

(declare-fun tp_is_empty!2569 () Bool)

(declare-fun array_inv!1209 (array!4105) Bool)

(declare-fun array_inv!1210 (array!4107) Bool)

(assert (=> b!90707 (= e!59123 (and tp!9165 tp_is_empty!2569 (array_inv!1209 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) (array_inv!1210 (_values!2379 (v!2705 (underlying!306 thiss!992)))) e!59109))))

(declare-fun mapIsEmpty!3525 () Bool)

(declare-fun mapRes!3526 () Bool)

(assert (=> mapIsEmpty!3525 mapRes!3526))

(declare-fun b!90708 () Bool)

(declare-datatypes ((Unit!2694 0))(
  ( (Unit!2695) )
))
(declare-fun e!59125 () Unit!2694)

(declare-fun Unit!2696 () Unit!2694)

(assert (=> b!90708 (= e!59125 Unit!2696)))

(declare-fun lt!44024 () Unit!2694)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!74 (array!4105 array!4107 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 64) (_ BitVec 32) Int) Unit!2694)

(assert (=> b!90708 (= lt!44024 (lemmaListMapContainsThenArrayContainsFrom!74 (_keys!4076 (v!2705 (underlying!306 thiss!992))) (_values!2379 (v!2705 (underlying!306 thiss!992))) (mask!6452 (v!2705 (underlying!306 thiss!992))) (extraKeys!2227 (v!2705 (underlying!306 thiss!992))) (zeroValue!2284 (v!2705 (underlying!306 thiss!992))) (minValue!2284 (v!2705 (underlying!306 thiss!992))) (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2705 (underlying!306 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90708 (arrayContainsKey!0 (_keys!4076 (v!2705 (underlying!306 thiss!992))) (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44023 () Unit!2694)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4105 (_ BitVec 32) (_ BitVec 32)) Unit!2694)

(assert (=> b!90708 (= lt!44023 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4076 (v!2705 (underlying!306 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1540 0))(
  ( (Nil!1537) (Cons!1536 (h!2128 (_ BitVec 64)) (t!5346 List!1540)) )
))
(declare-fun arrayNoDuplicates!0 (array!4105 (_ BitVec 32) List!1540) Bool)

(assert (=> b!90708 (arrayNoDuplicates!0 (_keys!4076 (v!2705 (underlying!306 thiss!992))) from!355 Nil!1537)))

(declare-fun lt!44017 () Unit!2694)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4105 (_ BitVec 32) (_ BitVec 64) List!1540) Unit!2694)

(assert (=> b!90708 (= lt!44017 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4076 (v!2705 (underlying!306 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) (Cons!1536 (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) Nil!1537)))))

(assert (=> b!90708 false))

(declare-fun b!90709 () Bool)

(declare-fun e!59124 () Bool)

(declare-fun e!59117 () Bool)

(assert (=> b!90709 (= e!59124 e!59117)))

(declare-fun res!46261 () Bool)

(assert (=> b!90709 (=> (not res!46261) (not e!59117))))

(assert (=> b!90709 (= res!46261 (and (not (= (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44011 () V!3073)

(declare-fun get!1227 (ValueCell!941 V!3073) V!3073)

(declare-fun dynLambda!350 (Int (_ BitVec 64)) V!3073)

(assert (=> b!90709 (= lt!44011 (get!1227 (select (arr!1954 (_values!2379 (v!2705 (underlying!306 thiss!992)))) from!355) (dynLambda!350 (defaultEntry!2396 (v!2705 (underlying!306 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90710 () Bool)

(declare-fun e!59113 () Bool)

(assert (=> b!90710 (= e!59113 tp_is_empty!2569)))

(declare-fun mapNonEmpty!3525 () Bool)

(declare-fun tp!9166 () Bool)

(declare-fun e!59121 () Bool)

(assert (=> mapNonEmpty!3525 (= mapRes!3526 (and tp!9166 e!59121))))

(declare-fun mapKey!3525 () (_ BitVec 32))

(declare-fun mapRest!3525 () (Array (_ BitVec 32) ValueCell!941))

(declare-fun newMap!16 () LongMapFixedSize!790)

(declare-fun mapValue!3526 () ValueCell!941)

(assert (=> mapNonEmpty!3525 (= (arr!1954 (_values!2379 newMap!16)) (store mapRest!3525 mapKey!3525 mapValue!3526))))

(declare-fun b!90711 () Bool)

(declare-fun e!59118 () Bool)

(assert (=> b!90711 (= e!59118 tp_is_empty!2569)))

(declare-fun mapIsEmpty!3526 () Bool)

(declare-fun mapRes!3525 () Bool)

(assert (=> mapIsEmpty!3526 mapRes!3525))

(declare-fun b!90712 () Bool)

(declare-fun e!59110 () Bool)

(assert (=> b!90712 (= e!59110 e!59123)))

(declare-fun res!46258 () Bool)

(declare-fun e!59111 () Bool)

(assert (=> start!11106 (=> (not res!46258) (not e!59111))))

(declare-fun valid!343 (LongMap!590) Bool)

(assert (=> start!11106 (= res!46258 (valid!343 thiss!992))))

(assert (=> start!11106 e!59111))

(declare-fun e!59116 () Bool)

(assert (=> start!11106 e!59116))

(assert (=> start!11106 true))

(declare-fun e!59120 () Bool)

(assert (=> start!11106 e!59120))

(declare-fun e!59126 () Bool)

(assert (=> b!90713 (= e!59120 (and tp!9164 tp_is_empty!2569 (array_inv!1209 (_keys!4076 newMap!16)) (array_inv!1210 (_values!2379 newMap!16)) e!59126))))

(declare-fun b!90714 () Bool)

(declare-fun e!59115 () Bool)

(assert (=> b!90714 (= e!59115 (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2200 (_keys!4076 (v!2705 (underlying!306 thiss!992))))))))

(declare-fun b!90715 () Bool)

(declare-fun e!59114 () Bool)

(assert (=> b!90715 (= e!59114 (not e!59115))))

(declare-fun res!46256 () Bool)

(assert (=> b!90715 (=> res!46256 e!59115)))

(declare-datatypes ((tuple2!2238 0))(
  ( (tuple2!2239 (_1!1130 Bool) (_2!1130 LongMapFixedSize!790)) )
))
(declare-fun lt!44019 () tuple2!2238)

(declare-datatypes ((tuple2!2240 0))(
  ( (tuple2!2241 (_1!1131 (_ BitVec 64)) (_2!1131 V!3073)) )
))
(declare-datatypes ((List!1541 0))(
  ( (Nil!1538) (Cons!1537 (h!2129 tuple2!2240) (t!5347 List!1541)) )
))
(declare-datatypes ((ListLongMap!1485 0))(
  ( (ListLongMap!1486 (toList!758 List!1541)) )
))
(declare-fun getCurrentListMap!450 (array!4105 array!4107 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1485)

(declare-fun map!1211 (LongMapFixedSize!790) ListLongMap!1485)

(assert (=> b!90715 (= res!46256 (not (= (getCurrentListMap!450 (_keys!4076 (v!2705 (underlying!306 thiss!992))) (_values!2379 (v!2705 (underlying!306 thiss!992))) (mask!6452 (v!2705 (underlying!306 thiss!992))) (extraKeys!2227 (v!2705 (underlying!306 thiss!992))) (zeroValue!2284 (v!2705 (underlying!306 thiss!992))) (minValue!2284 (v!2705 (underlying!306 thiss!992))) from!355 (defaultEntry!2396 (v!2705 (underlying!306 thiss!992)))) (map!1211 (_2!1130 lt!44019)))))))

(declare-fun lt!44010 () tuple2!2240)

(declare-fun lt!44016 () tuple2!2240)

(declare-fun lt!44012 () ListLongMap!1485)

(declare-fun lt!44014 () ListLongMap!1485)

(declare-fun +!120 (ListLongMap!1485 tuple2!2240) ListLongMap!1485)

(assert (=> b!90715 (= (+!120 lt!44014 lt!44010) (+!120 (+!120 lt!44012 lt!44010) lt!44016))))

(assert (=> b!90715 (= lt!44010 (tuple2!2241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2705 (underlying!306 thiss!992)))))))

(declare-fun lt!44013 () Unit!2694)

(declare-fun addCommutativeForDiffKeys!39 (ListLongMap!1485 (_ BitVec 64) V!3073 (_ BitVec 64) V!3073) Unit!2694)

(assert (=> b!90715 (= lt!44013 (addCommutativeForDiffKeys!39 lt!44012 (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) lt!44011 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2705 (underlying!306 thiss!992)))))))

(declare-fun lt!44020 () ListLongMap!1485)

(assert (=> b!90715 (= lt!44020 lt!44014)))

(assert (=> b!90715 (= lt!44014 (+!120 lt!44012 lt!44016))))

(declare-fun lt!44015 () ListLongMap!1485)

(declare-fun lt!44018 () tuple2!2240)

(assert (=> b!90715 (= lt!44020 (+!120 lt!44015 lt!44018))))

(declare-fun lt!44025 () ListLongMap!1485)

(assert (=> b!90715 (= lt!44012 (+!120 lt!44025 lt!44018))))

(assert (=> b!90715 (= lt!44018 (tuple2!2241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2705 (underlying!306 thiss!992)))))))

(assert (=> b!90715 (= lt!44015 (+!120 lt!44025 lt!44016))))

(assert (=> b!90715 (= lt!44016 (tuple2!2241 (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) lt!44011))))

(declare-fun lt!44008 () Unit!2694)

(assert (=> b!90715 (= lt!44008 (addCommutativeForDiffKeys!39 lt!44025 (select (arr!1953 (_keys!4076 (v!2705 (underlying!306 thiss!992)))) from!355) lt!44011 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2705 (underlying!306 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!85 (array!4105 array!4107 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1485)

(assert (=> b!90715 (= lt!44025 (getCurrentListMapNoExtraKeys!85 (_keys!4076 (v!2705 (underlying!306 thiss!992))) (_values!2379 (v!2705 (underlying!306 thiss!992))) (mask!6452 (v!2705 (underlying!306 thiss!992))) (extraKeys!2227 (v!2705 (underlying!306 thiss!992))) (zeroValue!2284 (v!2705 (underlying!306 thiss!992))) (minValue!2284 (v!2705 (underlying!306 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2705 (underlying!306 thiss!992)))))))

(declare-fun b!90716 () Bool)

(declare-fun e!59112 () Bool)

(assert (=> b!90716 (= e!59126 (and e!59112 mapRes!3526))))

(declare-fun condMapEmpty!3525 () Bool)

(declare-fun mapDefault!3525 () ValueCell!941)

