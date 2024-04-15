; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3226 () Bool)

(assert start!3226)

(declare-fun b!19620 () Bool)

(declare-fun b_free!691 () Bool)

(declare-fun b_next!691 () Bool)

(assert (=> b!19620 (= b_free!691 (not b_next!691))))

(declare-fun tp!3291 () Bool)

(declare-fun b_and!1349 () Bool)

(assert (=> b!19620 (= tp!3291 b_and!1349)))

(declare-fun b!19619 () Bool)

(declare-fun e!12729 () Bool)

(declare-fun e!12725 () Bool)

(assert (=> b!19619 (= e!12729 e!12725)))

(declare-fun tp_is_empty!955 () Bool)

(declare-fun e!12726 () Bool)

(declare-fun e!12732 () Bool)

(declare-datatypes ((V!1099 0))(
  ( (V!1100 (val!504 Int)) )
))
(declare-datatypes ((ValueCell!278 0))(
  ( (ValueCellFull!278 (v!1523 V!1099)) (EmptyCell!278) )
))
(declare-datatypes ((array!1111 0))(
  ( (array!1112 (arr!530 (Array (_ BitVec 32) ValueCell!278)) (size!623 (_ BitVec 32))) )
))
(declare-datatypes ((array!1113 0))(
  ( (array!1114 (arr!531 (Array (_ BitVec 32) (_ BitVec 64))) (size!624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!142 0))(
  ( (LongMapFixedSize!143 (defaultEntry!1691 Int) (mask!4647 (_ BitVec 32)) (extraKeys!1600 (_ BitVec 32)) (zeroValue!1624 V!1099) (minValue!1624 V!1099) (_size!106 (_ BitVec 32)) (_keys!3118 array!1113) (_values!1686 array!1111) (_vacant!106 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!142 0))(
  ( (Cell!143 (v!1524 LongMapFixedSize!142)) )
))
(declare-datatypes ((LongMap!142 0))(
  ( (LongMap!143 (underlying!82 Cell!142)) )
))
(declare-fun thiss!938 () LongMap!142)

(declare-fun array_inv!373 (array!1113) Bool)

(declare-fun array_inv!374 (array!1111) Bool)

(assert (=> b!19620 (= e!12732 (and tp!3291 tp_is_empty!955 (array_inv!373 (_keys!3118 (v!1524 (underlying!82 thiss!938)))) (array_inv!374 (_values!1686 (v!1524 (underlying!82 thiss!938)))) e!12726))))

(declare-fun b!19621 () Bool)

(declare-fun e!12733 () Bool)

(assert (=> b!19621 (= e!12733 tp_is_empty!955)))

(declare-fun mapIsEmpty!895 () Bool)

(declare-fun mapRes!895 () Bool)

(assert (=> mapIsEmpty!895 mapRes!895))

(declare-fun b!19622 () Bool)

(assert (=> b!19622 (= e!12726 (and e!12733 mapRes!895))))

(declare-fun condMapEmpty!895 () Bool)

(declare-fun mapDefault!895 () ValueCell!278)

(assert (=> b!19622 (= condMapEmpty!895 (= (arr!530 (_values!1686 (v!1524 (underlying!82 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!278)) mapDefault!895)))))

(declare-fun b!19623 () Bool)

(assert (=> b!19623 (= e!12725 e!12732)))

(declare-fun b!19624 () Bool)

(declare-fun e!12727 () Bool)

(declare-fun e!12731 () Bool)

(assert (=> b!19624 (= e!12727 e!12731)))

(declare-fun res!13228 () Bool)

(assert (=> b!19624 (=> (not res!13228) (not e!12731))))

(assert (=> b!19624 (= res!13228 (and (not (= (bvand (extraKeys!1600 (v!1524 (underlying!82 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1600 (v!1524 (underlying!82 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5513 () LongMapFixedSize!142)

(declare-fun getNewLongMapFixedSize!12 ((_ BitVec 32) Int) LongMapFixedSize!142)

(declare-fun computeNewMask!9 (LongMap!142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19624 (= lt!5513 (getNewLongMapFixedSize!12 (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) (defaultEntry!1691 (v!1524 (underlying!82 thiss!938)))))))

(declare-fun b!19625 () Bool)

(declare-fun valid!78 (LongMapFixedSize!142) Bool)

(declare-datatypes ((tuple2!828 0))(
  ( (tuple2!829 (_1!417 Bool) (_2!417 LongMapFixedSize!142)) )
))
(declare-fun update!17 (LongMapFixedSize!142 (_ BitVec 64) V!1099) tuple2!828)

(assert (=> b!19625 (= e!12731 (not (valid!78 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))))))))

(declare-fun b!19626 () Bool)

(declare-fun e!12728 () Bool)

(assert (=> b!19626 (= e!12728 tp_is_empty!955)))

(declare-fun res!13229 () Bool)

(assert (=> start!3226 (=> (not res!13229) (not e!12727))))

(declare-fun valid!79 (LongMap!142) Bool)

(assert (=> start!3226 (= res!13229 (valid!79 thiss!938))))

(assert (=> start!3226 e!12727))

(assert (=> start!3226 e!12729))

(declare-fun mapNonEmpty!895 () Bool)

(declare-fun tp!3292 () Bool)

(assert (=> mapNonEmpty!895 (= mapRes!895 (and tp!3292 e!12728))))

(declare-fun mapRest!895 () (Array (_ BitVec 32) ValueCell!278))

(declare-fun mapKey!895 () (_ BitVec 32))

(declare-fun mapValue!895 () ValueCell!278)

(assert (=> mapNonEmpty!895 (= (arr!530 (_values!1686 (v!1524 (underlying!82 thiss!938)))) (store mapRest!895 mapKey!895 mapValue!895))))

(assert (= (and start!3226 res!13229) b!19624))

(assert (= (and b!19624 res!13228) b!19625))

(assert (= (and b!19622 condMapEmpty!895) mapIsEmpty!895))

(assert (= (and b!19622 (not condMapEmpty!895)) mapNonEmpty!895))

(get-info :version)

(assert (= (and mapNonEmpty!895 ((_ is ValueCellFull!278) mapValue!895)) b!19626))

(assert (= (and b!19622 ((_ is ValueCellFull!278) mapDefault!895)) b!19621))

(assert (= b!19620 b!19622))

(assert (= b!19623 b!19620))

(assert (= b!19619 b!19623))

(assert (= start!3226 b!19619))

(declare-fun m!13781 () Bool)

(assert (=> mapNonEmpty!895 m!13781))

(declare-fun m!13783 () Bool)

(assert (=> b!19625 m!13783))

(declare-fun m!13785 () Bool)

(assert (=> b!19625 m!13785))

(declare-fun m!13787 () Bool)

(assert (=> b!19624 m!13787))

(assert (=> b!19624 m!13787))

(declare-fun m!13789 () Bool)

(assert (=> b!19624 m!13789))

(declare-fun m!13791 () Bool)

(assert (=> b!19620 m!13791))

(declare-fun m!13793 () Bool)

(assert (=> b!19620 m!13793))

(declare-fun m!13795 () Bool)

(assert (=> start!3226 m!13795))

(check-sat tp_is_empty!955 (not b!19625) (not b!19620) (not b!19624) (not mapNonEmpty!895) (not b_next!691) (not start!3226) b_and!1349)
(check-sat b_and!1349 (not b_next!691))
(get-model)

(declare-fun d!3595 () Bool)

(declare-fun res!13248 () Bool)

(declare-fun e!12790 () Bool)

(assert (=> d!3595 (=> (not res!13248) (not e!12790))))

(declare-fun simpleValid!14 (LongMapFixedSize!142) Bool)

(assert (=> d!3595 (= res!13248 (simpleValid!14 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))))))

(assert (=> d!3595 (= (valid!78 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))) e!12790)))

(declare-fun b!19681 () Bool)

(declare-fun res!13249 () Bool)

(assert (=> b!19681 (=> (not res!13249) (not e!12790))))

(declare-fun arrayCountValidKeys!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19681 (= res!13249 (= (arrayCountValidKeys!0 (_keys!3118 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))) #b00000000000000000000000000000000 (size!624 (_keys!3118 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))))) (_size!106 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))))))))

(declare-fun b!19682 () Bool)

(declare-fun res!13250 () Bool)

(assert (=> b!19682 (=> (not res!13250) (not e!12790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1113 (_ BitVec 32)) Bool)

(assert (=> b!19682 (= res!13250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3118 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))) (mask!4647 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))))))))

(declare-fun b!19683 () Bool)

(declare-datatypes ((List!545 0))(
  ( (Nil!542) (Cons!541 (h!1107 (_ BitVec 64)) (t!3185 List!545)) )
))
(declare-fun arrayNoDuplicates!0 (array!1113 (_ BitVec 32) List!545) Bool)

(assert (=> b!19683 (= e!12790 (arrayNoDuplicates!0 (_keys!3118 (_2!417 (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))) #b00000000000000000000000000000000 Nil!542))))

(assert (= (and d!3595 res!13248) b!19681))

(assert (= (and b!19681 res!13249) b!19682))

(assert (= (and b!19682 res!13250) b!19683))

(declare-fun m!13829 () Bool)

(assert (=> d!3595 m!13829))

(declare-fun m!13831 () Bool)

(assert (=> b!19681 m!13831))

(declare-fun m!13833 () Bool)

(assert (=> b!19682 m!13833))

(declare-fun m!13835 () Bool)

(assert (=> b!19683 m!13835))

(assert (=> b!19625 d!3595))

(declare-fun b!19764 () Bool)

(declare-fun e!12833 () tuple2!828)

(declare-fun lt!5585 () tuple2!828)

(assert (=> b!19764 (= e!12833 (tuple2!829 (_1!417 lt!5585) (_2!417 lt!5585)))))

(declare-fun call!968 () tuple2!828)

(assert (=> b!19764 (= lt!5585 call!968)))

(declare-fun b!19765 () Bool)

(declare-fun e!12848 () Bool)

(declare-datatypes ((SeekEntryResult!48 0))(
  ( (MissingZero!48 (index!2312 (_ BitVec 32))) (Found!48 (index!2313 (_ BitVec 32))) (Intermediate!48 (undefined!860 Bool) (index!2314 (_ BitVec 32)) (x!4827 (_ BitVec 32))) (Undefined!48) (MissingVacant!48 (index!2315 (_ BitVec 32))) )
))
(declare-fun lt!5594 () SeekEntryResult!48)

(assert (=> b!19765 (= e!12848 ((_ is Undefined!48) lt!5594))))

(declare-fun bm!950 () Bool)

(declare-fun call!974 () Bool)

(declare-fun call!970 () Bool)

(assert (=> bm!950 (= call!974 call!970)))

(declare-fun lt!5576 () (_ BitVec 32))

(declare-fun lt!5582 () (_ BitVec 32))

(declare-fun bm!951 () Bool)

(declare-fun c!2106 () Bool)

(declare-fun c!2111 () Bool)

(declare-datatypes ((tuple2!830 0))(
  ( (tuple2!831 (_1!418 (_ BitVec 64)) (_2!418 V!1099)) )
))
(declare-datatypes ((List!546 0))(
  ( (Nil!543) (Cons!542 (h!1108 tuple2!830) (t!3186 List!546)) )
))
(declare-datatypes ((ListLongMap!543 0))(
  ( (ListLongMap!544 (toList!287 List!546)) )
))
(declare-fun call!966 () ListLongMap!543)

(declare-fun c!2108 () Bool)

(declare-fun lt!5591 () array!1111)

(declare-fun getCurrentListMap!120 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) Int) ListLongMap!543)

(assert (=> bm!951 (= call!966 (getCurrentListMap!120 (_keys!3118 lt!5513) (ite (or c!2106 c!2111) (_values!1686 lt!5513) lt!5591) (mask!4647 lt!5513) (ite c!2106 (ite c!2108 lt!5582 lt!5576) (extraKeys!1600 lt!5513)) (ite (and c!2106 c!2108) (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (zeroValue!1624 lt!5513)) (ite c!2106 (ite c!2108 (minValue!1624 lt!5513) (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))) (minValue!1624 lt!5513)) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5513)))))

(declare-fun call!965 () ListLongMap!543)

(declare-fun bm!952 () Bool)

(declare-fun e!12844 () ListLongMap!543)

(declare-fun +!38 (ListLongMap!543 tuple2!830) ListLongMap!543)

(assert (=> bm!952 (= call!965 (+!38 e!12844 (ite c!2106 (ite c!2108 (tuple2!831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))) (tuple2!831 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))) (tuple2!831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))))))

(declare-fun c!2110 () Bool)

(assert (=> bm!952 (= c!2110 c!2106)))

(declare-fun b!19766 () Bool)

(declare-datatypes ((Unit!403 0))(
  ( (Unit!404) )
))
(declare-fun lt!5590 () Unit!403)

(declare-fun lt!5584 () Unit!403)

(assert (=> b!19766 (= lt!5590 lt!5584)))

(declare-fun call!962 () Bool)

(assert (=> b!19766 call!962))

(declare-fun lt!5583 () SeekEntryResult!48)

(declare-fun lemmaValidKeyInArrayIsInListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) Int) Unit!403)

(assert (=> b!19766 (= lt!5584 (lemmaValidKeyInArrayIsInListMap!3 (_keys!3118 lt!5513) lt!5591 (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) (index!2313 lt!5583) (defaultEntry!1691 lt!5513)))))

(assert (=> b!19766 (= lt!5591 (array!1112 (store (arr!530 (_values!1686 lt!5513)) (index!2313 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5513))))))

(declare-fun lt!5600 () Unit!403)

(declare-fun lt!5577 () Unit!403)

(assert (=> b!19766 (= lt!5600 lt!5577)))

(declare-fun call!976 () ListLongMap!543)

(assert (=> b!19766 (= call!965 call!976)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) (_ BitVec 64) V!1099 Int) Unit!403)

(assert (=> b!19766 (= lt!5577 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) (index!2313 lt!5583) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (defaultEntry!1691 lt!5513)))))

(declare-fun lt!5574 () Unit!403)

(declare-fun e!12847 () Unit!403)

(assert (=> b!19766 (= lt!5574 e!12847)))

(declare-fun c!2104 () Bool)

(declare-fun contains!221 (ListLongMap!543 (_ BitVec 64)) Bool)

(assert (=> b!19766 (= c!2104 (contains!221 (getCurrentListMap!120 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5513)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12841 () tuple2!828)

(assert (=> b!19766 (= e!12841 (tuple2!829 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) (_size!106 lt!5513) (_keys!3118 lt!5513) (array!1112 (store (arr!530 (_values!1686 lt!5513)) (index!2313 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5513))) (_vacant!106 lt!5513))))))

(declare-fun bm!953 () Bool)

(declare-fun call!961 () ListLongMap!543)

(assert (=> bm!953 (= call!961 call!965)))

(declare-fun b!19767 () Bool)

(declare-fun e!12843 () Bool)

(declare-fun lt!5596 () SeekEntryResult!48)

(assert (=> b!19767 (= e!12843 ((_ is Undefined!48) lt!5596))))

(declare-fun b!19768 () Bool)

(declare-fun e!12842 () Bool)

(declare-fun e!12834 () Bool)

(assert (=> b!19768 (= e!12842 e!12834)))

(declare-fun res!13289 () Bool)

(declare-fun call!971 () ListLongMap!543)

(assert (=> b!19768 (= res!13289 (contains!221 call!971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19768 (=> (not res!13289) (not e!12834))))

(declare-fun b!19769 () Bool)

(declare-fun e!12845 () Bool)

(declare-fun call!957 () Bool)

(assert (=> b!19769 (= e!12845 (not call!957))))

(declare-fun bm!954 () Bool)

(declare-fun call!955 () ListLongMap!543)

(assert (=> bm!954 (= call!955 call!966)))

(declare-fun b!19770 () Bool)

(declare-fun e!12846 () Bool)

(assert (=> b!19770 (= e!12846 (not call!957))))

(declare-fun b!19771 () Bool)

(declare-fun e!12837 () Bool)

(declare-fun call!972 () Bool)

(assert (=> b!19771 (= e!12837 (not call!972))))

(declare-fun b!19772 () Bool)

(declare-fun lt!5597 () Unit!403)

(declare-fun lt!5578 () Unit!403)

(assert (=> b!19772 (= lt!5597 lt!5578)))

(declare-fun call!967 () ListLongMap!543)

(assert (=> b!19772 (= call!961 call!967)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 V!1099 Int) Unit!403)

(assert (=> b!19772 (= lt!5578 (lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) lt!5576 (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (defaultEntry!1691 lt!5513)))))

(assert (=> b!19772 (= lt!5576 (bvor (extraKeys!1600 lt!5513) #b00000000000000000000000000000010))))

(declare-fun e!12836 () tuple2!828)

(assert (=> b!19772 (= e!12836 (tuple2!829 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5513) (mask!4647 lt!5513) (bvor (extraKeys!1600 lt!5513) #b00000000000000000000000000000010) (zeroValue!1624 lt!5513) (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (_size!106 lt!5513) (_keys!3118 lt!5513) (_values!1686 lt!5513) (_vacant!106 lt!5513))))))

(declare-fun bm!955 () Bool)

(declare-fun call!960 () SeekEntryResult!48)

(declare-fun call!953 () SeekEntryResult!48)

(assert (=> bm!955 (= call!960 call!953)))

(declare-fun b!19773 () Bool)

(declare-fun call!958 () ListLongMap!543)

(assert (=> b!19773 (= e!12844 call!958)))

(declare-fun b!19774 () Bool)

(declare-fun call!963 () ListLongMap!543)

(assert (=> b!19774 (= e!12842 (= call!971 call!963))))

(declare-fun b!19775 () Bool)

(declare-fun Unit!405 () Unit!403)

(assert (=> b!19775 (= e!12847 Unit!405)))

(declare-fun lt!5580 () Unit!403)

(declare-fun call!959 () Unit!403)

(assert (=> b!19775 (= lt!5580 call!959)))

(declare-fun call!969 () SeekEntryResult!48)

(assert (=> b!19775 (= lt!5594 call!969)))

(declare-fun c!2112 () Bool)

(assert (=> b!19775 (= c!2112 ((_ is MissingZero!48) lt!5594))))

(declare-fun e!12852 () Bool)

(assert (=> b!19775 e!12852))

(declare-fun lt!5579 () Unit!403)

(assert (=> b!19775 (= lt!5579 lt!5580)))

(assert (=> b!19775 false))

(declare-fun lt!5598 () SeekEntryResult!48)

(declare-fun bm!956 () Bool)

(declare-fun lt!5593 () SeekEntryResult!48)

(declare-fun call!954 () Bool)

(declare-fun c!2114 () Bool)

(declare-fun c!2116 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!956 (= call!954 (inRange!0 (ite c!2111 (ite c!2116 (index!2313 lt!5593) (ite c!2114 (index!2312 lt!5596) (index!2315 lt!5596))) (ite c!2104 (index!2313 lt!5598) (ite c!2112 (index!2312 lt!5594) (index!2315 lt!5594)))) (mask!4647 lt!5513)))))

(declare-fun bm!957 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1113 (_ BitVec 32)) SeekEntryResult!48)

(assert (=> bm!957 (= call!953 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3118 lt!5513) (mask!4647 lt!5513)))))

(declare-fun b!19776 () Bool)

(declare-fun e!12839 () tuple2!828)

(assert (=> b!19776 (= e!12839 e!12836)))

(assert (=> b!19776 (= c!2108 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19777 () Bool)

(declare-fun e!12853 () Bool)

(assert (=> b!19777 (= e!12853 e!12842)))

(declare-fun c!2115 () Bool)

(declare-fun lt!5575 () tuple2!828)

(assert (=> b!19777 (= c!2115 (_1!417 lt!5575))))

(declare-fun b!19778 () Bool)

(declare-fun res!13280 () Bool)

(assert (=> b!19778 (=> (not res!13280) (not e!12837))))

(assert (=> b!19778 (= res!13280 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2312 lt!5594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19779 () Bool)

(assert (=> b!19779 (= e!12833 e!12841)))

(declare-fun c!2113 () Bool)

(assert (=> b!19779 (= c!2113 ((_ is MissingZero!48) lt!5583))))

(declare-fun bm!958 () Bool)

(declare-fun call!973 () Bool)

(assert (=> bm!958 (= call!972 call!973)))

(declare-fun b!19780 () Bool)

(declare-fun res!13283 () Bool)

(assert (=> b!19780 (= res!13283 call!970)))

(declare-fun e!12840 () Bool)

(assert (=> b!19780 (=> (not res!13283) (not e!12840))))

(declare-fun b!19781 () Bool)

(assert (=> b!19781 (= e!12843 e!12846)))

(declare-fun res!13290 () Bool)

(assert (=> b!19781 (= res!13290 call!974)))

(assert (=> b!19781 (=> (not res!13290) (not e!12846))))

(declare-fun b!19782 () Bool)

(declare-fun e!12835 () Bool)

(assert (=> b!19782 (= e!12835 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2313 lt!5598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19783 () Bool)

(declare-fun res!13279 () Bool)

(assert (=> b!19783 (= res!13279 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2315 lt!5596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19783 (=> (not res!13279) (not e!12846))))

(declare-fun b!19784 () Bool)

(declare-fun lt!5589 () Unit!403)

(declare-fun lt!5587 () Unit!403)

(assert (=> b!19784 (= lt!5589 lt!5587)))

(assert (=> b!19784 (= call!961 call!967)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 V!1099 Int) Unit!403)

(assert (=> b!19784 (= lt!5587 (lemmaChangeZeroKeyThenAddPairToListMap!3 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) lt!5582 (zeroValue!1624 lt!5513) (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (minValue!1624 lt!5513) (defaultEntry!1691 lt!5513)))))

(assert (=> b!19784 (= lt!5582 (bvor (extraKeys!1600 lt!5513) #b00000000000000000000000000000001))))

(assert (=> b!19784 (= e!12836 (tuple2!829 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5513) (mask!4647 lt!5513) (bvor (extraKeys!1600 lt!5513) #b00000000000000000000000000000001) (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (minValue!1624 lt!5513) (_size!106 lt!5513) (_keys!3118 lt!5513) (_values!1686 lt!5513) (_vacant!106 lt!5513))))))

(declare-fun b!19785 () Bool)

(declare-fun lt!5586 () Unit!403)

(assert (=> b!19785 (= e!12847 lt!5586)))

(declare-fun call!975 () Unit!403)

(assert (=> b!19785 (= lt!5586 call!975)))

(assert (=> b!19785 (= lt!5598 call!969)))

(declare-fun res!13292 () Bool)

(assert (=> b!19785 (= res!13292 ((_ is Found!48) lt!5598))))

(assert (=> b!19785 (=> (not res!13292) (not e!12835))))

(assert (=> b!19785 e!12835))

(declare-fun bm!959 () Bool)

(assert (=> bm!959 (= call!967 call!966)))

(declare-fun bm!960 () Bool)

(declare-fun map!375 (LongMapFixedSize!142) ListLongMap!543)

(assert (=> bm!960 (= call!963 (map!375 lt!5513))))

(declare-fun d!3597 () Bool)

(assert (=> d!3597 e!12853))

(declare-fun res!13282 () Bool)

(assert (=> d!3597 (=> (not res!13282) (not e!12853))))

(assert (=> d!3597 (= res!13282 (valid!78 (_2!417 lt!5575)))))

(assert (=> d!3597 (= lt!5575 e!12839)))

(assert (=> d!3597 (= c!2106 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3597 (valid!78 lt!5513)))

(assert (=> d!3597 (= (update!17 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))) lt!5575)))

(declare-fun b!19786 () Bool)

(declare-fun res!13287 () Bool)

(assert (=> b!19786 (= res!13287 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2315 lt!5594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12850 () Bool)

(assert (=> b!19786 (=> (not res!13287) (not e!12850))))

(declare-fun b!19787 () Bool)

(assert (=> b!19787 (= e!12850 (not call!972))))

(declare-fun bm!961 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!403)

(assert (=> bm!961 (= call!959 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1691 lt!5513)))))

(declare-fun b!19788 () Bool)

(declare-fun c!2105 () Bool)

(assert (=> b!19788 (= c!2105 ((_ is MissingVacant!48) lt!5596))))

(declare-fun e!12838 () Bool)

(assert (=> b!19788 (= e!12838 e!12843)))

(declare-fun b!19789 () Bool)

(declare-fun e!12851 () Unit!403)

(declare-fun Unit!406 () Unit!403)

(assert (=> b!19789 (= e!12851 Unit!406)))

(declare-fun lt!5588 () Unit!403)

(assert (=> b!19789 (= lt!5588 call!975)))

(assert (=> b!19789 (= lt!5593 call!960)))

(declare-fun res!13288 () Bool)

(assert (=> b!19789 (= res!13288 ((_ is Found!48) lt!5593))))

(assert (=> b!19789 (=> (not res!13288) (not e!12840))))

(assert (=> b!19789 e!12840))

(declare-fun lt!5595 () Unit!403)

(assert (=> b!19789 (= lt!5595 lt!5588)))

(assert (=> b!19789 false))

(declare-fun b!19790 () Bool)

(declare-fun res!13286 () Bool)

(assert (=> b!19790 (=> (not res!13286) (not e!12845))))

(assert (=> b!19790 (= res!13286 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2312 lt!5596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19791 () Bool)

(declare-fun lt!5599 () Unit!403)

(assert (=> b!19791 (= lt!5599 e!12851)))

(assert (=> b!19791 (= c!2116 call!962)))

(declare-fun e!12849 () tuple2!828)

(assert (=> b!19791 (= e!12849 (tuple2!829 false lt!5513))))

(declare-fun bm!962 () Bool)

(assert (=> bm!962 (= call!970 call!954)))

(declare-fun b!19792 () Bool)

(declare-fun res!13285 () Bool)

(declare-fun call!956 () Bool)

(assert (=> b!19792 (= res!13285 call!956)))

(assert (=> b!19792 (=> (not res!13285) (not e!12835))))

(declare-fun b!19793 () Bool)

(assert (=> b!19793 (= e!12848 e!12850)))

(declare-fun res!13281 () Bool)

(declare-fun call!964 () Bool)

(assert (=> b!19793 (= res!13281 call!964)))

(assert (=> b!19793 (=> (not res!13281) (not e!12850))))

(declare-fun bm!963 () Bool)

(assert (=> bm!963 (= call!971 (map!375 (_2!417 lt!5575)))))

(declare-fun c!2107 () Bool)

(declare-fun bm!964 () Bool)

(declare-fun updateHelperNewKey!3 (LongMapFixedSize!142 (_ BitVec 64) V!1099 (_ BitVec 32)) tuple2!828)

(assert (=> bm!964 (= call!968 (updateHelperNewKey!3 lt!5513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))) (ite c!2107 (index!2315 lt!5583) (index!2312 lt!5583))))))

(declare-fun b!19794 () Bool)

(assert (=> b!19794 (= e!12840 (= (select (arr!531 (_keys!3118 lt!5513)) (index!2313 lt!5593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!965 () Bool)

(assert (=> bm!965 (= call!962 (contains!221 call!955 (ite c!2111 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!531 (_keys!3118 lt!5513)) (index!2313 lt!5583)))))))

(declare-fun b!19795 () Bool)

(assert (=> b!19795 (= e!12834 (= call!971 (+!38 call!963 (tuple2!831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1524 (underlying!82 thiss!938)))))))))

(declare-fun bm!966 () Bool)

(assert (=> bm!966 (= call!958 call!976)))

(declare-fun b!19796 () Bool)

(declare-fun c!2109 () Bool)

(assert (=> b!19796 (= c!2109 ((_ is MissingVacant!48) lt!5594))))

(assert (=> b!19796 (= e!12852 e!12848)))

(declare-fun bm!967 () Bool)

(assert (=> bm!967 (= call!969 call!953)))

(declare-fun b!19797 () Bool)

(declare-fun lt!5581 () Unit!403)

(assert (=> b!19797 (= e!12851 lt!5581)))

(assert (=> b!19797 (= lt!5581 call!959)))

(assert (=> b!19797 (= lt!5596 call!960)))

(assert (=> b!19797 (= c!2114 ((_ is MissingZero!48) lt!5596))))

(assert (=> b!19797 e!12838))

(declare-fun bm!968 () Bool)

(assert (=> bm!968 (= call!964 call!956)))

(declare-fun b!19798 () Bool)

(assert (=> b!19798 (= e!12844 (getCurrentListMap!120 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5513)))))

(declare-fun bm!969 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!403)

(assert (=> bm!969 (= call!975 (lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (_keys!3118 lt!5513) (_values!1686 lt!5513) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1691 lt!5513)))))

(declare-fun b!19799 () Bool)

(declare-fun lt!5592 () tuple2!828)

(assert (=> b!19799 (= lt!5592 call!968)))

(assert (=> b!19799 (= e!12841 (tuple2!829 (_1!417 lt!5592) (_2!417 lt!5592)))))

(declare-fun b!19800 () Bool)

(declare-fun res!13291 () Bool)

(assert (=> b!19800 (=> (not res!13291) (not e!12845))))

(assert (=> b!19800 (= res!13291 call!974)))

(assert (=> b!19800 (= e!12838 e!12845)))

(declare-fun b!19801 () Bool)

(assert (=> b!19801 (= c!2107 ((_ is MissingVacant!48) lt!5583))))

(assert (=> b!19801 (= e!12849 e!12833)))

(declare-fun bm!970 () Bool)

(assert (=> bm!970 (= call!976 (getCurrentListMap!120 (_keys!3118 lt!5513) (ite c!2106 (_values!1686 lt!5513) (array!1112 (store (arr!530 (_values!1686 lt!5513)) (index!2313 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1524 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5513)))) (mask!4647 lt!5513) (extraKeys!1600 lt!5513) (zeroValue!1624 lt!5513) (minValue!1624 lt!5513) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5513)))))

(declare-fun bm!971 () Bool)

(assert (=> bm!971 (= call!956 call!954)))

(declare-fun bm!972 () Bool)

(declare-fun arrayContainsKey!0 (array!1113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!972 (= call!973 (arrayContainsKey!0 (_keys!3118 lt!5513) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!19802 () Bool)

(declare-fun res!13284 () Bool)

(assert (=> b!19802 (=> (not res!13284) (not e!12837))))

(assert (=> b!19802 (= res!13284 call!964)))

(assert (=> b!19802 (= e!12852 e!12837)))

(declare-fun b!19803 () Bool)

(assert (=> b!19803 (= e!12839 e!12849)))

(assert (=> b!19803 (= lt!5583 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3118 lt!5513) (mask!4647 lt!5513)))))

(assert (=> b!19803 (= c!2111 ((_ is Undefined!48) lt!5583))))

(declare-fun bm!973 () Bool)

(assert (=> bm!973 (= call!957 call!973)))

(assert (= (and d!3597 c!2106) b!19776))

(assert (= (and d!3597 (not c!2106)) b!19803))

(assert (= (and b!19776 c!2108) b!19784))

(assert (= (and b!19776 (not c!2108)) b!19772))

(assert (= (or b!19784 b!19772) bm!959))

(assert (= (or b!19784 b!19772) bm!966))

(assert (= (or b!19784 b!19772) bm!953))

(assert (= (and b!19803 c!2111) b!19791))

(assert (= (and b!19803 (not c!2111)) b!19801))

(assert (= (and b!19791 c!2116) b!19789))

(assert (= (and b!19791 (not c!2116)) b!19797))

(assert (= (and b!19789 res!13288) b!19780))

(assert (= (and b!19780 res!13283) b!19794))

(assert (= (and b!19797 c!2114) b!19800))

(assert (= (and b!19797 (not c!2114)) b!19788))

(assert (= (and b!19800 res!13291) b!19790))

(assert (= (and b!19790 res!13286) b!19769))

(assert (= (and b!19788 c!2105) b!19781))

(assert (= (and b!19788 (not c!2105)) b!19767))

(assert (= (and b!19781 res!13290) b!19783))

(assert (= (and b!19783 res!13279) b!19770))

(assert (= (or b!19800 b!19781) bm!950))

(assert (= (or b!19769 b!19770) bm!973))

(assert (= (or b!19780 bm!950) bm!962))

(assert (= (or b!19789 b!19797) bm!955))

(assert (= (and b!19801 c!2107) b!19764))

(assert (= (and b!19801 (not c!2107)) b!19779))

(assert (= (and b!19779 c!2113) b!19799))

(assert (= (and b!19779 (not c!2113)) b!19766))

(assert (= (and b!19766 c!2104) b!19785))

(assert (= (and b!19766 (not c!2104)) b!19775))

(assert (= (and b!19785 res!13292) b!19792))

(assert (= (and b!19792 res!13285) b!19782))

(assert (= (and b!19775 c!2112) b!19802))

(assert (= (and b!19775 (not c!2112)) b!19796))

(assert (= (and b!19802 res!13284) b!19778))

(assert (= (and b!19778 res!13280) b!19771))

(assert (= (and b!19796 c!2109) b!19793))

(assert (= (and b!19796 (not c!2109)) b!19765))

(assert (= (and b!19793 res!13281) b!19786))

(assert (= (and b!19786 res!13287) b!19787))

(assert (= (or b!19802 b!19793) bm!968))

(assert (= (or b!19771 b!19787) bm!958))

(assert (= (or b!19792 bm!968) bm!971))

(assert (= (or b!19785 b!19775) bm!967))

(assert (= (or b!19764 b!19799) bm!964))

(assert (= (or bm!973 bm!958) bm!972))

(assert (= (or b!19789 b!19785) bm!969))

(assert (= (or bm!955 bm!967) bm!957))

(assert (= (or b!19797 b!19775) bm!961))

(assert (= (or bm!962 bm!971) bm!956))

(assert (= (or b!19791 b!19766) bm!954))

(assert (= (or b!19791 b!19766) bm!965))

(assert (= (or bm!959 bm!954) bm!951))

(assert (= (or bm!966 b!19766) bm!970))

(assert (= (or bm!953 b!19766) bm!952))

(assert (= (and bm!952 c!2110) b!19773))

(assert (= (and bm!952 (not c!2110)) b!19798))

(assert (= (and d!3597 res!13282) b!19777))

(assert (= (and b!19777 c!2115) b!19768))

(assert (= (and b!19777 (not c!2115)) b!19774))

(assert (= (and b!19768 res!13289) b!19795))

(assert (= (or b!19795 b!19774) bm!960))

(assert (= (or b!19768 b!19795 b!19774) bm!963))

(declare-fun m!13837 () Bool)

(assert (=> bm!964 m!13837))

(declare-fun m!13839 () Bool)

(assert (=> b!19772 m!13839))

(declare-fun m!13841 () Bool)

(assert (=> bm!956 m!13841))

(declare-fun m!13843 () Bool)

(assert (=> bm!969 m!13843))

(declare-fun m!13845 () Bool)

(assert (=> bm!965 m!13845))

(declare-fun m!13847 () Bool)

(assert (=> bm!965 m!13847))

(declare-fun m!13849 () Bool)

(assert (=> b!19798 m!13849))

(declare-fun m!13851 () Bool)

(assert (=> b!19794 m!13851))

(declare-fun m!13853 () Bool)

(assert (=> bm!960 m!13853))

(declare-fun m!13855 () Bool)

(assert (=> bm!951 m!13855))

(declare-fun m!13857 () Bool)

(assert (=> b!19784 m!13857))

(declare-fun m!13859 () Bool)

(assert (=> b!19768 m!13859))

(declare-fun m!13861 () Bool)

(assert (=> bm!957 m!13861))

(declare-fun m!13863 () Bool)

(assert (=> bm!972 m!13863))

(declare-fun m!13865 () Bool)

(assert (=> b!19766 m!13865))

(declare-fun m!13867 () Bool)

(assert (=> b!19766 m!13867))

(declare-fun m!13869 () Bool)

(assert (=> b!19766 m!13869))

(assert (=> b!19766 m!13849))

(declare-fun m!13871 () Bool)

(assert (=> b!19766 m!13871))

(assert (=> b!19766 m!13849))

(declare-fun m!13873 () Bool)

(assert (=> b!19778 m!13873))

(assert (=> b!19803 m!13861))

(declare-fun m!13875 () Bool)

(assert (=> b!19786 m!13875))

(declare-fun m!13877 () Bool)

(assert (=> b!19783 m!13877))

(declare-fun m!13879 () Bool)

(assert (=> d!3597 m!13879))

(declare-fun m!13881 () Bool)

(assert (=> d!3597 m!13881))

(declare-fun m!13883 () Bool)

(assert (=> bm!963 m!13883))

(declare-fun m!13885 () Bool)

(assert (=> b!19782 m!13885))

(declare-fun m!13887 () Bool)

(assert (=> bm!961 m!13887))

(declare-fun m!13889 () Bool)

(assert (=> b!19795 m!13889))

(assert (=> bm!970 m!13865))

(declare-fun m!13891 () Bool)

(assert (=> bm!970 m!13891))

(declare-fun m!13893 () Bool)

(assert (=> b!19790 m!13893))

(declare-fun m!13895 () Bool)

(assert (=> bm!952 m!13895))

(assert (=> b!19625 d!3597))

(declare-fun b!19816 () Bool)

(declare-fun e!12861 () Bool)

(declare-fun lt!5666 () LongMapFixedSize!142)

(assert (=> b!19816 (= e!12861 (= (map!375 lt!5666) (ListLongMap!544 Nil!543)))))

(declare-fun b!19817 () Bool)

(declare-fun e!12860 () Bool)

(declare-fun lt!5662 () array!1113)

(declare-fun lt!5661 () tuple2!830)

(assert (=> b!19817 (= e!12860 (arrayContainsKey!0 lt!5662 (_1!418 lt!5661) #b00000000000000000000000000000000))))

(declare-fun b!19818 () Bool)

(declare-fun e!12862 () Unit!403)

(declare-fun Unit!407 () Unit!403)

(assert (=> b!19818 (= e!12862 Unit!407)))

(declare-fun b!19820 () Bool)

(declare-fun res!13298 () Bool)

(assert (=> b!19820 (=> (not res!13298) (not e!12861))))

(assert (=> b!19820 (= res!13298 (= (mask!4647 lt!5666) (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938))))))))

(declare-fun b!19821 () Bool)

(declare-fun lt!5652 () (_ BitVec 32))

(assert (=> b!19821 (= e!12860 (ite (= (_1!418 lt!5661) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5652 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5652 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3599 () Bool)

(assert (=> d!3599 e!12861))

(declare-fun res!13297 () Bool)

(assert (=> d!3599 (=> (not res!13297) (not e!12861))))

(assert (=> d!3599 (= res!13297 (valid!78 lt!5666))))

(declare-fun lt!5647 () LongMapFixedSize!142)

(assert (=> d!3599 (= lt!5666 lt!5647)))

(declare-fun lt!5664 () Unit!403)

(assert (=> d!3599 (= lt!5664 e!12862)))

(declare-fun c!2122 () Bool)

(assert (=> d!3599 (= c!2122 (not (= (map!375 lt!5647) (ListLongMap!544 Nil!543))))))

(declare-fun lt!5660 () Unit!403)

(declare-fun lt!5649 () Unit!403)

(assert (=> d!3599 (= lt!5660 lt!5649)))

(declare-fun lt!5655 () array!1113)

(declare-fun lt!5653 () (_ BitVec 32))

(declare-fun lt!5669 () List!545)

(assert (=> d!3599 (arrayNoDuplicates!0 lt!5655 lt!5653 lt!5669)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1113 (_ BitVec 32) (_ BitVec 32) List!545) Unit!403)

(assert (=> d!3599 (= lt!5649 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5655 lt!5653 (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001) lt!5669))))

(assert (=> d!3599 (= lt!5669 Nil!542)))

(assert (=> d!3599 (= lt!5653 #b00000000000000000000000000000000)))

(assert (=> d!3599 (= lt!5655 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5657 () Unit!403)

(declare-fun lt!5648 () Unit!403)

(assert (=> d!3599 (= lt!5657 lt!5648)))

(declare-fun lt!5668 () (_ BitVec 32))

(declare-fun lt!5650 () array!1113)

(assert (=> d!3599 (arrayForallSeekEntryOrOpenFound!0 lt!5668 lt!5650 (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) Unit!403)

(assert (=> d!3599 (= lt!5648 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5650 (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) lt!5668))))

(assert (=> d!3599 (= lt!5668 #b00000000000000000000000000000000)))

(assert (=> d!3599 (= lt!5650 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5654 () Unit!403)

(declare-fun lt!5667 () Unit!403)

(assert (=> d!3599 (= lt!5654 lt!5667)))

(declare-fun lt!5651 () array!1113)

(declare-fun lt!5665 () (_ BitVec 32))

(declare-fun lt!5656 () (_ BitVec 32))

(assert (=> d!3599 (= (arrayCountValidKeys!0 lt!5651 lt!5665 lt!5656) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) Unit!403)

(assert (=> d!3599 (= lt!5667 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5651 lt!5665 lt!5656))))

(assert (=> d!3599 (= lt!5656 (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3599 (= lt!5665 #b00000000000000000000000000000000)))

(assert (=> d!3599 (= lt!5651 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!134 (Int (_ BitVec 64)) V!1099)

(assert (=> d!3599 (= lt!5647 (LongMapFixedSize!143 (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!134 (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (array!1112 ((as const (Array (_ BitVec 32) ValueCell!278)) EmptyCell!278) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3599 (validMask!0 (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))))))

(assert (=> d!3599 (= (getNewLongMapFixedSize!12 (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) (defaultEntry!1691 (v!1524 (underlying!82 thiss!938)))) lt!5666)))

(declare-fun b!19819 () Bool)

(declare-fun Unit!408 () Unit!403)

(assert (=> b!19819 (= e!12862 Unit!408)))

(declare-fun head!821 (List!546) tuple2!830)

(assert (=> b!19819 (= lt!5661 (head!821 (toList!287 (map!375 lt!5647))))))

(assert (=> b!19819 (= lt!5662 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!19819 (= lt!5652 #b00000000000000000000000000000000)))

(declare-fun lt!5663 () Unit!403)

(declare-fun lemmaKeyInListMapIsInArray!88 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!403)

(assert (=> b!19819 (= lt!5663 (lemmaKeyInListMapIsInArray!88 lt!5662 (array!1112 ((as const (Array (_ BitVec 32) ValueCell!278)) EmptyCell!278) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) lt!5652 (dynLambda!134 (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!418 lt!5661) (defaultEntry!1691 (v!1524 (underlying!82 thiss!938)))))))

(declare-fun c!2121 () Bool)

(assert (=> b!19819 (= c!2121 (and (not (= (_1!418 lt!5661) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!418 lt!5661) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!19819 e!12860))

(declare-fun lt!5659 () Unit!403)

(assert (=> b!19819 (= lt!5659 lt!5663)))

(declare-fun lt!5658 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1113 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19819 (= lt!5658 (arrayScanForKey!0 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (_1!418 lt!5661) #b00000000000000000000000000000000))))

(assert (=> b!19819 false))

(assert (= (and d!3599 c!2122) b!19819))

(assert (= (and d!3599 (not c!2122)) b!19818))

(assert (= (and b!19819 c!2121) b!19817))

(assert (= (and b!19819 (not c!2121)) b!19821))

(assert (= (and d!3599 res!13297) b!19820))

(assert (= (and b!19820 res!13298) b!19816))

(declare-fun b_lambda!1461 () Bool)

(assert (=> (not b_lambda!1461) (not d!3599)))

(declare-fun t!3184 () Bool)

(declare-fun tb!627 () Bool)

(assert (=> (and b!19620 (= (defaultEntry!1691 (v!1524 (underlying!82 thiss!938))) (defaultEntry!1691 (v!1524 (underlying!82 thiss!938)))) t!3184) tb!627))

(declare-fun result!1027 () Bool)

(assert (=> tb!627 (= result!1027 tp_is_empty!955)))

(assert (=> d!3599 t!3184))

(declare-fun b_and!1355 () Bool)

(assert (= b_and!1349 (and (=> t!3184 result!1027) b_and!1355)))

(declare-fun b_lambda!1463 () Bool)

(assert (=> (not b_lambda!1463) (not b!19819)))

(assert (=> b!19819 t!3184))

(declare-fun b_and!1357 () Bool)

(assert (= b_and!1355 (and (=> t!3184 result!1027) b_and!1357)))

(declare-fun m!13897 () Bool)

(assert (=> b!19816 m!13897))

(declare-fun m!13899 () Bool)

(assert (=> b!19817 m!13899))

(declare-fun m!13901 () Bool)

(assert (=> d!3599 m!13901))

(assert (=> d!3599 m!13787))

(declare-fun m!13903 () Bool)

(assert (=> d!3599 m!13903))

(declare-fun m!13905 () Bool)

(assert (=> d!3599 m!13905))

(declare-fun m!13907 () Bool)

(assert (=> d!3599 m!13907))

(assert (=> d!3599 m!13787))

(declare-fun m!13909 () Bool)

(assert (=> d!3599 m!13909))

(declare-fun m!13911 () Bool)

(assert (=> d!3599 m!13911))

(assert (=> d!3599 m!13787))

(declare-fun m!13913 () Bool)

(assert (=> d!3599 m!13913))

(declare-fun m!13915 () Bool)

(assert (=> d!3599 m!13915))

(declare-fun m!13917 () Bool)

(assert (=> d!3599 m!13917))

(declare-fun m!13919 () Bool)

(assert (=> d!3599 m!13919))

(declare-fun m!13921 () Bool)

(assert (=> b!19819 m!13921))

(assert (=> b!19819 m!13787))

(assert (=> b!19819 m!13905))

(assert (=> b!19819 m!13905))

(declare-fun m!13923 () Bool)

(assert (=> b!19819 m!13923))

(assert (=> b!19819 m!13905))

(declare-fun m!13925 () Bool)

(assert (=> b!19819 m!13925))

(assert (=> b!19819 m!13915))

(assert (=> b!19624 d!3599))

(declare-fun d!3601 () Bool)

(declare-fun e!12868 () Bool)

(assert (=> d!3601 e!12868))

(declare-fun res!13301 () Bool)

(assert (=> d!3601 (=> (not res!13301) (not e!12868))))

(declare-fun lt!5675 () (_ BitVec 32))

(assert (=> d!3601 (= res!13301 (validMask!0 lt!5675))))

(declare-datatypes ((tuple2!832 0))(
  ( (tuple2!833 (_1!419 Unit!403) (_2!419 (_ BitVec 32))) )
))
(declare-fun e!12867 () tuple2!832)

(assert (=> d!3601 (= lt!5675 (_2!419 e!12867))))

(declare-fun c!2125 () Bool)

(declare-fun lt!5674 () tuple2!832)

(assert (=> d!3601 (= c!2125 (and (bvsgt (_2!419 lt!5674) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!106 (v!1524 (underlying!82 thiss!938)))) (_2!419 lt!5674)) (bvsge (bvadd (bvand (bvashr (_2!419 lt!5674) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!106 (v!1524 (underlying!82 thiss!938))))))))

(declare-fun Unit!409 () Unit!403)

(declare-fun Unit!410 () Unit!403)

(assert (=> d!3601 (= lt!5674 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!106 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))))) (mask!4647 (v!1524 (underlying!82 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!106 (v!1524 (underlying!82 thiss!938)))) (mask!4647 (v!1524 (underlying!82 thiss!938))))) (tuple2!833 Unit!409 (bvand (bvadd (bvshl (mask!4647 (v!1524 (underlying!82 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!833 Unit!410 (mask!4647 (v!1524 (underlying!82 thiss!938))))))))

(assert (=> d!3601 (validMask!0 (mask!4647 (v!1524 (underlying!82 thiss!938))))))

(assert (=> d!3601 (= (computeNewMask!9 thiss!938 (mask!4647 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (_size!106 (v!1524 (underlying!82 thiss!938)))) lt!5675)))

(declare-fun b!19830 () Bool)

(declare-fun computeNewMaskWhile!5 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!832)

(assert (=> b!19830 (= e!12867 (computeNewMaskWhile!5 (_size!106 (v!1524 (underlying!82 thiss!938))) (_vacant!106 (v!1524 (underlying!82 thiss!938))) (mask!4647 (v!1524 (underlying!82 thiss!938))) (_2!419 lt!5674)))))

(declare-fun b!19831 () Bool)

(declare-fun Unit!411 () Unit!403)

(assert (=> b!19831 (= e!12867 (tuple2!833 Unit!411 (_2!419 lt!5674)))))

(declare-fun b!19832 () Bool)

(assert (=> b!19832 (= e!12868 (bvsle (_size!106 (v!1524 (underlying!82 thiss!938))) (bvadd lt!5675 #b00000000000000000000000000000001)))))

(assert (= (and d!3601 c!2125) b!19830))

(assert (= (and d!3601 (not c!2125)) b!19831))

(assert (= (and d!3601 res!13301) b!19832))

(declare-fun m!13927 () Bool)

(assert (=> d!3601 m!13927))

(declare-fun m!13929 () Bool)

(assert (=> d!3601 m!13929))

(declare-fun m!13931 () Bool)

(assert (=> b!19830 m!13931))

(assert (=> b!19624 d!3601))

(declare-fun d!3603 () Bool)

(assert (=> d!3603 (= (valid!79 thiss!938) (valid!78 (v!1524 (underlying!82 thiss!938))))))

(declare-fun bs!880 () Bool)

(assert (= bs!880 d!3603))

(declare-fun m!13933 () Bool)

(assert (=> bs!880 m!13933))

(assert (=> start!3226 d!3603))

(declare-fun d!3605 () Bool)

(assert (=> d!3605 (= (array_inv!373 (_keys!3118 (v!1524 (underlying!82 thiss!938)))) (bvsge (size!624 (_keys!3118 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19620 d!3605))

(declare-fun d!3607 () Bool)

(assert (=> d!3607 (= (array_inv!374 (_values!1686 (v!1524 (underlying!82 thiss!938)))) (bvsge (size!623 (_values!1686 (v!1524 (underlying!82 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19620 d!3607))

(declare-fun b!19840 () Bool)

(declare-fun e!12874 () Bool)

(assert (=> b!19840 (= e!12874 tp_is_empty!955)))

(declare-fun b!19839 () Bool)

(declare-fun e!12873 () Bool)

(assert (=> b!19839 (= e!12873 tp_is_empty!955)))

(declare-fun mapIsEmpty!904 () Bool)

(declare-fun mapRes!904 () Bool)

(assert (=> mapIsEmpty!904 mapRes!904))

(declare-fun condMapEmpty!904 () Bool)

(declare-fun mapDefault!904 () ValueCell!278)

(assert (=> mapNonEmpty!895 (= condMapEmpty!904 (= mapRest!895 ((as const (Array (_ BitVec 32) ValueCell!278)) mapDefault!904)))))

(assert (=> mapNonEmpty!895 (= tp!3292 (and e!12874 mapRes!904))))

(declare-fun mapNonEmpty!904 () Bool)

(declare-fun tp!3307 () Bool)

(assert (=> mapNonEmpty!904 (= mapRes!904 (and tp!3307 e!12873))))

(declare-fun mapRest!904 () (Array (_ BitVec 32) ValueCell!278))

(declare-fun mapValue!904 () ValueCell!278)

(declare-fun mapKey!904 () (_ BitVec 32))

(assert (=> mapNonEmpty!904 (= mapRest!895 (store mapRest!904 mapKey!904 mapValue!904))))

(assert (= (and mapNonEmpty!895 condMapEmpty!904) mapIsEmpty!904))

(assert (= (and mapNonEmpty!895 (not condMapEmpty!904)) mapNonEmpty!904))

(assert (= (and mapNonEmpty!904 ((_ is ValueCellFull!278) mapValue!904)) b!19839))

(assert (= (and mapNonEmpty!895 ((_ is ValueCellFull!278) mapDefault!904)) b!19840))

(declare-fun m!13935 () Bool)

(assert (=> mapNonEmpty!904 m!13935))

(declare-fun b_lambda!1465 () Bool)

(assert (= b_lambda!1461 (or (and b!19620 b_free!691) b_lambda!1465)))

(declare-fun b_lambda!1467 () Bool)

(assert (= b_lambda!1463 (or (and b!19620 b_free!691) b_lambda!1467)))

(check-sat (not b!19768) (not b!19816) tp_is_empty!955 (not b!19803) (not b!19830) (not bm!951) (not d!3599) (not b_next!691) (not d!3601) (not b!19772) (not b!19681) (not b!19817) (not bm!961) (not bm!956) (not bm!965) (not b!19795) (not d!3603) b_and!1357 (not b!19682) (not b!19798) (not bm!963) (not mapNonEmpty!904) (not bm!969) (not b!19784) (not bm!964) (not b_lambda!1467) (not bm!960) (not b!19683) (not b!19766) (not d!3595) (not bm!957) (not b!19819) (not b_lambda!1465) (not bm!952) (not bm!970) (not d!3597) (not bm!972))
(check-sat b_and!1357 (not b_next!691))
