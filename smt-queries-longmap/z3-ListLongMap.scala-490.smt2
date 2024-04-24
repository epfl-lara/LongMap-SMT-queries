; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11058 () Bool)

(assert start!11058)

(declare-fun b!89804 () Bool)

(declare-fun b_free!2269 () Bool)

(declare-fun b_next!2269 () Bool)

(assert (=> b!89804 (= b_free!2269 (not b_next!2269))))

(declare-fun tp!9054 () Bool)

(declare-fun b_and!5385 () Bool)

(assert (=> b!89804 (= tp!9054 b_and!5385)))

(declare-fun b!89800 () Bool)

(declare-fun b_free!2271 () Bool)

(declare-fun b_next!2271 () Bool)

(assert (=> b!89800 (= b_free!2271 (not b_next!2271))))

(declare-fun tp!9051 () Bool)

(declare-fun b_and!5387 () Bool)

(assert (=> b!89800 (= tp!9051 b_and!5387)))

(declare-fun b!89791 () Bool)

(declare-fun res!45884 () Bool)

(declare-fun e!58436 () Bool)

(assert (=> b!89791 (=> res!45884 e!58436)))

(declare-datatypes ((V!3049 0))(
  ( (V!3050 (val!1320 Int)) )
))
(declare-datatypes ((array!4053 0))(
  ( (array!4054 (arr!1928 (Array (_ BitVec 32) (_ BitVec 64))) (size!2175 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!932 0))(
  ( (ValueCellFull!932 (v!2688 V!3049)) (EmptyCell!932) )
))
(declare-datatypes ((array!4055 0))(
  ( (array!4056 (arr!1929 (Array (_ BitVec 32) ValueCell!932)) (size!2176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!772 0))(
  ( (LongMapFixedSize!773 (defaultEntry!2384 Int) (mask!6434 (_ BitVec 32)) (extraKeys!2215 (_ BitVec 32)) (zeroValue!2272 V!3049) (minValue!2272 V!3049) (_size!435 (_ BitVec 32)) (_keys!4064 array!4053) (_values!2367 array!4055) (_vacant!435 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!578 0))(
  ( (Cell!579 (v!2689 LongMapFixedSize!772)) )
))
(declare-datatypes ((LongMap!578 0))(
  ( (LongMap!579 (underlying!300 Cell!578)) )
))
(declare-fun thiss!992 () LongMap!578)

(assert (=> b!89791 (= res!45884 (or (not (= (size!2176 (_values!2367 (v!2689 (underlying!300 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6434 (v!2689 (underlying!300 thiss!992)))))) (not (= (size!2175 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) (size!2176 (_values!2367 (v!2689 (underlying!300 thiss!992)))))) (bvslt (mask!6434 (v!2689 (underlying!300 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2215 (v!2689 (underlying!300 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2215 (v!2689 (underlying!300 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!89792 () Bool)

(declare-fun e!58443 () Bool)

(declare-fun e!58444 () Bool)

(assert (=> b!89792 (= e!58443 e!58444)))

(declare-fun b!89793 () Bool)

(declare-fun res!45876 () Bool)

(declare-fun e!58430 () Bool)

(assert (=> b!89793 (=> (not res!45876) (not e!58430))))

(declare-fun newMap!16 () LongMapFixedSize!772)

(assert (=> b!89793 (= res!45876 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6434 newMap!16)) (_size!435 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun b!89794 () Bool)

(declare-fun e!58445 () Bool)

(declare-fun tp_is_empty!2551 () Bool)

(assert (=> b!89794 (= e!58445 tp_is_empty!2551)))

(declare-fun b!89795 () Bool)

(declare-datatypes ((Unit!2655 0))(
  ( (Unit!2656) )
))
(declare-fun e!58439 () Unit!2655)

(declare-fun Unit!2657 () Unit!2655)

(assert (=> b!89795 (= e!58439 Unit!2657)))

(declare-fun lt!43218 () Unit!2655)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!64 (array!4053 array!4055 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 64) (_ BitVec 32) Int) Unit!2655)

(assert (=> b!89795 (= lt!43218 (lemmaListMapContainsThenArrayContainsFrom!64 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (_values!2367 (v!2689 (underlying!300 thiss!992))) (mask!6434 (v!2689 (underlying!300 thiss!992))) (extraKeys!2215 (v!2689 (underlying!300 thiss!992))) (zeroValue!2272 (v!2689 (underlying!300 thiss!992))) (minValue!2272 (v!2689 (underlying!300 thiss!992))) (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!89795 (arrayContainsKey!0 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43227 () Unit!2655)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4053 (_ BitVec 32) (_ BitVec 32)) Unit!2655)

(assert (=> b!89795 (= lt!43227 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4064 (v!2689 (underlying!300 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1519 0))(
  ( (Nil!1516) (Cons!1515 (h!2107 (_ BitVec 64)) (t!5285 List!1519)) )
))
(declare-fun arrayNoDuplicates!0 (array!4053 (_ BitVec 32) List!1519) Bool)

(assert (=> b!89795 (arrayNoDuplicates!0 (_keys!4064 (v!2689 (underlying!300 thiss!992))) from!355 Nil!1516)))

(declare-fun lt!43232 () Unit!2655)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4053 (_ BitVec 32) (_ BitVec 64) List!1519) Unit!2655)

(assert (=> b!89795 (= lt!43232 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) (Cons!1515 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) Nil!1516)))))

(assert (=> b!89795 false))

(declare-fun b!89796 () Bool)

(declare-fun e!58442 () Bool)

(declare-fun e!58446 () Bool)

(assert (=> b!89796 (= e!58442 e!58446)))

(declare-fun res!45883 () Bool)

(assert (=> b!89796 (=> (not res!45883) (not e!58446))))

(assert (=> b!89796 (= res!45883 (and (not (= (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43224 () V!3049)

(declare-fun get!1223 (ValueCell!932 V!3049) V!3049)

(declare-fun dynLambda!348 (Int (_ BitVec 64)) V!3049)

(assert (=> b!89796 (= lt!43224 (get!1223 (select (arr!1929 (_values!2367 (v!2689 (underlying!300 thiss!992)))) from!355) (dynLambda!348 (defaultEntry!2384 (v!2689 (underlying!300 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89797 () Bool)

(assert (=> b!89797 (= e!58436 (bvsle from!355 (size!2175 (_keys!4064 (v!2689 (underlying!300 thiss!992))))))))

(declare-fun b!89798 () Bool)

(assert (=> b!89798 (= e!58430 e!58442)))

(declare-fun res!45885 () Bool)

(assert (=> b!89798 (=> (not res!45885) (not e!58442))))

(declare-datatypes ((tuple2!2206 0))(
  ( (tuple2!2207 (_1!1114 (_ BitVec 64)) (_2!1114 V!3049)) )
))
(declare-datatypes ((List!1520 0))(
  ( (Nil!1517) (Cons!1516 (h!2108 tuple2!2206) (t!5286 List!1520)) )
))
(declare-datatypes ((ListLongMap!1453 0))(
  ( (ListLongMap!1454 (toList!742 List!1520)) )
))
(declare-fun lt!43233 () ListLongMap!1453)

(declare-fun lt!43225 () ListLongMap!1453)

(assert (=> b!89798 (= res!45885 (= lt!43233 lt!43225))))

(declare-fun map!1206 (LongMapFixedSize!772) ListLongMap!1453)

(assert (=> b!89798 (= lt!43225 (map!1206 newMap!16))))

(declare-fun getCurrentListMap!434 (array!4053 array!4055 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!89798 (= lt!43233 (getCurrentListMap!434 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (_values!2367 (v!2689 (underlying!300 thiss!992))) (mask!6434 (v!2689 (underlying!300 thiss!992))) (extraKeys!2215 (v!2689 (underlying!300 thiss!992))) (zeroValue!2272 (v!2689 (underlying!300 thiss!992))) (minValue!2272 (v!2689 (underlying!300 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun mapIsEmpty!3467 () Bool)

(declare-fun mapRes!3467 () Bool)

(assert (=> mapIsEmpty!3467 mapRes!3467))

(declare-fun mapNonEmpty!3467 () Bool)

(declare-fun mapRes!3468 () Bool)

(declare-fun tp!9052 () Bool)

(assert (=> mapNonEmpty!3467 (= mapRes!3468 (and tp!9052 e!58445))))

(declare-fun mapKey!3467 () (_ BitVec 32))

(declare-fun mapValue!3467 () ValueCell!932)

(declare-fun mapRest!3468 () (Array (_ BitVec 32) ValueCell!932))

(assert (=> mapNonEmpty!3467 (= (arr!1929 (_values!2367 newMap!16)) (store mapRest!3468 mapKey!3467 mapValue!3467))))

(declare-fun b!89799 () Bool)

(declare-fun e!58441 () Bool)

(assert (=> b!89799 (= e!58441 (not e!58436))))

(declare-fun res!45882 () Bool)

(assert (=> b!89799 (=> res!45882 e!58436)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!89799 (= res!45882 (not (validMask!0 (mask!6434 (v!2689 (underlying!300 thiss!992))))))))

(declare-fun lt!43228 () ListLongMap!1453)

(declare-fun lt!43226 () tuple2!2206)

(declare-fun lt!43235 () ListLongMap!1453)

(declare-fun lt!43221 () tuple2!2206)

(declare-fun +!113 (ListLongMap!1453 tuple2!2206) ListLongMap!1453)

(assert (=> b!89799 (= (+!113 lt!43235 lt!43221) (+!113 (+!113 lt!43228 lt!43221) lt!43226))))

(assert (=> b!89799 (= lt!43221 (tuple2!2207 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2272 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun lt!43229 () Unit!2655)

(declare-fun addCommutativeForDiffKeys!33 (ListLongMap!1453 (_ BitVec 64) V!3049 (_ BitVec 64) V!3049) Unit!2655)

(assert (=> b!89799 (= lt!43229 (addCommutativeForDiffKeys!33 lt!43228 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) lt!43224 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2272 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun lt!43230 () ListLongMap!1453)

(assert (=> b!89799 (= lt!43230 lt!43235)))

(assert (=> b!89799 (= lt!43235 (+!113 lt!43228 lt!43226))))

(declare-fun lt!43220 () ListLongMap!1453)

(declare-fun lt!43231 () tuple2!2206)

(assert (=> b!89799 (= lt!43230 (+!113 lt!43220 lt!43231))))

(declare-fun lt!43223 () ListLongMap!1453)

(assert (=> b!89799 (= lt!43228 (+!113 lt!43223 lt!43231))))

(assert (=> b!89799 (= lt!43231 (tuple2!2207 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2272 (v!2689 (underlying!300 thiss!992)))))))

(assert (=> b!89799 (= lt!43220 (+!113 lt!43223 lt!43226))))

(assert (=> b!89799 (= lt!43226 (tuple2!2207 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) lt!43224))))

(declare-fun lt!43234 () Unit!2655)

(assert (=> b!89799 (= lt!43234 (addCommutativeForDiffKeys!33 lt!43223 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) lt!43224 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2272 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!78 (array!4053 array!4055 (_ BitVec 32) (_ BitVec 32) V!3049 V!3049 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!89799 (= lt!43223 (getCurrentListMapNoExtraKeys!78 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (_values!2367 (v!2689 (underlying!300 thiss!992))) (mask!6434 (v!2689 (underlying!300 thiss!992))) (extraKeys!2215 (v!2689 (underlying!300 thiss!992))) (zeroValue!2272 (v!2689 (underlying!300 thiss!992))) (minValue!2272 (v!2689 (underlying!300 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2384 (v!2689 (underlying!300 thiss!992)))))))

(declare-fun b!89801 () Bool)

(declare-fun res!45877 () Bool)

(assert (=> b!89801 (=> res!45877 e!58436)))

(assert (=> b!89801 (= res!45877 (not (arrayNoDuplicates!0 (_keys!4064 (v!2689 (underlying!300 thiss!992))) #b00000000000000000000000000000000 Nil!1516)))))

(declare-fun b!89802 () Bool)

(assert (=> b!89802 (= e!58446 e!58441)))

(declare-fun res!45880 () Bool)

(assert (=> b!89802 (=> (not res!45880) (not e!58441))))

(declare-datatypes ((tuple2!2208 0))(
  ( (tuple2!2209 (_1!1115 Bool) (_2!1115 LongMapFixedSize!772)) )
))
(declare-fun lt!43222 () tuple2!2208)

(assert (=> b!89802 (= res!45880 (and (_1!1115 lt!43222) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43219 () Unit!2655)

(assert (=> b!89802 (= lt!43219 e!58439)))

(declare-fun c!14955 () Bool)

(declare-fun contains!757 (ListLongMap!1453 (_ BitVec 64)) Bool)

(assert (=> b!89802 (= c!14955 (contains!757 lt!43225 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355)))))

(declare-fun update!127 (LongMapFixedSize!772 (_ BitVec 64) V!3049) tuple2!2208)

(assert (=> b!89802 (= lt!43222 (update!127 newMap!16 (select (arr!1928 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) from!355) lt!43224))))

(declare-fun mapIsEmpty!3468 () Bool)

(assert (=> mapIsEmpty!3468 mapRes!3468))

(declare-fun b!89803 () Bool)

(declare-fun res!45881 () Bool)

(assert (=> b!89803 (=> (not res!45881) (not e!58430))))

(assert (=> b!89803 (= res!45881 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2175 (_keys!4064 (v!2689 (underlying!300 thiss!992)))))))))

(declare-fun e!58440 () Bool)

(declare-fun e!58447 () Bool)

(declare-fun array_inv!1187 (array!4053) Bool)

(declare-fun array_inv!1188 (array!4055) Bool)

(assert (=> b!89804 (= e!58440 (and tp!9054 tp_is_empty!2551 (array_inv!1187 (_keys!4064 (v!2689 (underlying!300 thiss!992)))) (array_inv!1188 (_values!2367 (v!2689 (underlying!300 thiss!992)))) e!58447))))

(declare-fun b!89805 () Bool)

(declare-fun e!58433 () Bool)

(declare-fun e!58431 () Bool)

(assert (=> b!89805 (= e!58433 (and e!58431 mapRes!3468))))

(declare-fun condMapEmpty!3468 () Bool)

(declare-fun mapDefault!3468 () ValueCell!932)

(assert (=> b!89805 (= condMapEmpty!3468 (= (arr!1929 (_values!2367 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!932)) mapDefault!3468)))))

(declare-fun b!89806 () Bool)

(declare-fun Unit!2658 () Unit!2655)

(assert (=> b!89806 (= e!58439 Unit!2658)))

(declare-fun mapNonEmpty!3468 () Bool)

(declare-fun tp!9053 () Bool)

(declare-fun e!58435 () Bool)

(assert (=> mapNonEmpty!3468 (= mapRes!3467 (and tp!9053 e!58435))))

(declare-fun mapKey!3468 () (_ BitVec 32))

(declare-fun mapValue!3468 () ValueCell!932)

(declare-fun mapRest!3467 () (Array (_ BitVec 32) ValueCell!932))

(assert (=> mapNonEmpty!3468 (= (arr!1929 (_values!2367 (v!2689 (underlying!300 thiss!992)))) (store mapRest!3467 mapKey!3468 mapValue!3468))))

(declare-fun b!89807 () Bool)

(assert (=> b!89807 (= e!58435 tp_is_empty!2551)))

(declare-fun b!89808 () Bool)

(declare-fun e!58434 () Bool)

(assert (=> b!89808 (= e!58434 tp_is_empty!2551)))

(declare-fun e!58437 () Bool)

(assert (=> b!89800 (= e!58437 (and tp!9051 tp_is_empty!2551 (array_inv!1187 (_keys!4064 newMap!16)) (array_inv!1188 (_values!2367 newMap!16)) e!58433))))

(declare-fun res!45879 () Bool)

(assert (=> start!11058 (=> (not res!45879) (not e!58430))))

(declare-fun valid!344 (LongMap!578) Bool)

(assert (=> start!11058 (= res!45879 (valid!344 thiss!992))))

(assert (=> start!11058 e!58430))

(assert (=> start!11058 e!58443))

(assert (=> start!11058 true))

(assert (=> start!11058 e!58437))

(declare-fun b!89809 () Bool)

(assert (=> b!89809 (= e!58444 e!58440)))

(declare-fun b!89810 () Bool)

(assert (=> b!89810 (= e!58447 (and e!58434 mapRes!3467))))

(declare-fun condMapEmpty!3467 () Bool)

(declare-fun mapDefault!3467 () ValueCell!932)

(assert (=> b!89810 (= condMapEmpty!3467 (= (arr!1929 (_values!2367 (v!2689 (underlying!300 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!932)) mapDefault!3467)))))

(declare-fun b!89811 () Bool)

(declare-fun res!45886 () Bool)

(assert (=> b!89811 (=> res!45886 e!58436)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4053 (_ BitVec 32)) Bool)

(assert (=> b!89811 (= res!45886 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4064 (v!2689 (underlying!300 thiss!992))) (mask!6434 (v!2689 (underlying!300 thiss!992))))))))

(declare-fun b!89812 () Bool)

(assert (=> b!89812 (= e!58431 tp_is_empty!2551)))

(declare-fun b!89813 () Bool)

(declare-fun res!45878 () Bool)

(assert (=> b!89813 (=> (not res!45878) (not e!58430))))

(declare-fun valid!345 (LongMapFixedSize!772) Bool)

(assert (=> b!89813 (= res!45878 (valid!345 newMap!16))))

(assert (= (and start!11058 res!45879) b!89803))

(assert (= (and b!89803 res!45881) b!89813))

(assert (= (and b!89813 res!45878) b!89793))

(assert (= (and b!89793 res!45876) b!89798))

(assert (= (and b!89798 res!45885) b!89796))

(assert (= (and b!89796 res!45883) b!89802))

(assert (= (and b!89802 c!14955) b!89795))

(assert (= (and b!89802 (not c!14955)) b!89806))

(assert (= (and b!89802 res!45880) b!89799))

(assert (= (and b!89799 (not res!45882)) b!89791))

(assert (= (and b!89791 (not res!45884)) b!89811))

(assert (= (and b!89811 (not res!45886)) b!89801))

(assert (= (and b!89801 (not res!45877)) b!89797))

(assert (= (and b!89810 condMapEmpty!3467) mapIsEmpty!3467))

(assert (= (and b!89810 (not condMapEmpty!3467)) mapNonEmpty!3468))

(get-info :version)

(assert (= (and mapNonEmpty!3468 ((_ is ValueCellFull!932) mapValue!3468)) b!89807))

(assert (= (and b!89810 ((_ is ValueCellFull!932) mapDefault!3467)) b!89808))

(assert (= b!89804 b!89810))

(assert (= b!89809 b!89804))

(assert (= b!89792 b!89809))

(assert (= start!11058 b!89792))

(assert (= (and b!89805 condMapEmpty!3468) mapIsEmpty!3468))

(assert (= (and b!89805 (not condMapEmpty!3468)) mapNonEmpty!3467))

(assert (= (and mapNonEmpty!3467 ((_ is ValueCellFull!932) mapValue!3467)) b!89794))

(assert (= (and b!89805 ((_ is ValueCellFull!932) mapDefault!3468)) b!89812))

(assert (= b!89800 b!89805))

(assert (= start!11058 b!89800))

(declare-fun b_lambda!3971 () Bool)

(assert (=> (not b_lambda!3971) (not b!89796)))

(declare-fun t!5282 () Bool)

(declare-fun tb!1733 () Bool)

(assert (=> (and b!89804 (= (defaultEntry!2384 (v!2689 (underlying!300 thiss!992))) (defaultEntry!2384 (v!2689 (underlying!300 thiss!992)))) t!5282) tb!1733))

(declare-fun result!2979 () Bool)

(assert (=> tb!1733 (= result!2979 tp_is_empty!2551)))

(assert (=> b!89796 t!5282))

(declare-fun b_and!5389 () Bool)

(assert (= b_and!5385 (and (=> t!5282 result!2979) b_and!5389)))

(declare-fun tb!1735 () Bool)

(declare-fun t!5284 () Bool)

(assert (=> (and b!89800 (= (defaultEntry!2384 newMap!16) (defaultEntry!2384 (v!2689 (underlying!300 thiss!992)))) t!5284) tb!1735))

(declare-fun result!2983 () Bool)

(assert (= result!2983 result!2979))

(assert (=> b!89796 t!5284))

(declare-fun b_and!5391 () Bool)

(assert (= b_and!5387 (and (=> t!5284 result!2983) b_and!5391)))

(declare-fun m!96443 () Bool)

(assert (=> b!89799 m!96443))

(declare-fun m!96445 () Bool)

(assert (=> b!89799 m!96445))

(declare-fun m!96447 () Bool)

(assert (=> b!89799 m!96447))

(assert (=> b!89799 m!96447))

(declare-fun m!96449 () Bool)

(assert (=> b!89799 m!96449))

(declare-fun m!96451 () Bool)

(assert (=> b!89799 m!96451))

(declare-fun m!96453 () Bool)

(assert (=> b!89799 m!96453))

(declare-fun m!96455 () Bool)

(assert (=> b!89799 m!96455))

(declare-fun m!96457 () Bool)

(assert (=> b!89799 m!96457))

(declare-fun m!96459 () Bool)

(assert (=> b!89799 m!96459))

(declare-fun m!96461 () Bool)

(assert (=> b!89799 m!96461))

(assert (=> b!89799 m!96455))

(declare-fun m!96463 () Bool)

(assert (=> b!89799 m!96463))

(assert (=> b!89799 m!96455))

(declare-fun m!96465 () Bool)

(assert (=> b!89799 m!96465))

(assert (=> b!89796 m!96455))

(declare-fun m!96467 () Bool)

(assert (=> b!89796 m!96467))

(declare-fun m!96469 () Bool)

(assert (=> b!89796 m!96469))

(assert (=> b!89796 m!96467))

(assert (=> b!89796 m!96469))

(declare-fun m!96471 () Bool)

(assert (=> b!89796 m!96471))

(declare-fun m!96473 () Bool)

(assert (=> b!89801 m!96473))

(declare-fun m!96475 () Bool)

(assert (=> b!89800 m!96475))

(declare-fun m!96477 () Bool)

(assert (=> b!89800 m!96477))

(declare-fun m!96479 () Bool)

(assert (=> b!89795 m!96479))

(declare-fun m!96481 () Bool)

(assert (=> b!89795 m!96481))

(assert (=> b!89795 m!96455))

(declare-fun m!96483 () Bool)

(assert (=> b!89795 m!96483))

(assert (=> b!89795 m!96455))

(assert (=> b!89795 m!96455))

(declare-fun m!96485 () Bool)

(assert (=> b!89795 m!96485))

(assert (=> b!89795 m!96455))

(declare-fun m!96487 () Bool)

(assert (=> b!89795 m!96487))

(declare-fun m!96489 () Bool)

(assert (=> b!89804 m!96489))

(declare-fun m!96491 () Bool)

(assert (=> b!89804 m!96491))

(declare-fun m!96493 () Bool)

(assert (=> mapNonEmpty!3467 m!96493))

(declare-fun m!96495 () Bool)

(assert (=> b!89813 m!96495))

(declare-fun m!96497 () Bool)

(assert (=> mapNonEmpty!3468 m!96497))

(assert (=> b!89802 m!96455))

(assert (=> b!89802 m!96455))

(declare-fun m!96499 () Bool)

(assert (=> b!89802 m!96499))

(assert (=> b!89802 m!96455))

(declare-fun m!96501 () Bool)

(assert (=> b!89802 m!96501))

(declare-fun m!96503 () Bool)

(assert (=> b!89811 m!96503))

(declare-fun m!96505 () Bool)

(assert (=> b!89798 m!96505))

(declare-fun m!96507 () Bool)

(assert (=> b!89798 m!96507))

(declare-fun m!96509 () Bool)

(assert (=> start!11058 m!96509))

(check-sat (not b!89799) (not b!89798) (not b!89801) (not b!89802) (not mapNonEmpty!3467) (not b_next!2271) b_and!5389 (not b!89804) (not start!11058) tp_is_empty!2551 (not b!89795) (not b_lambda!3971) b_and!5391 (not b!89811) (not b_next!2269) (not b!89796) (not mapNonEmpty!3468) (not b!89813) (not b!89800))
(check-sat b_and!5389 b_and!5391 (not b_next!2269) (not b_next!2271))
