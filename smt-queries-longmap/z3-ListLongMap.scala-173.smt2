; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3288 () Bool)

(assert start!3288)

(declare-fun b!20234 () Bool)

(declare-fun b_free!715 () Bool)

(declare-fun b_next!715 () Bool)

(assert (=> b!20234 (= b_free!715 (not b_next!715))))

(declare-fun tp!3372 () Bool)

(declare-fun b_and!1385 () Bool)

(assert (=> b!20234 (= tp!3372 b_and!1385)))

(declare-fun b!20224 () Bool)

(declare-datatypes ((V!1131 0))(
  ( (V!1132 (val!516 Int)) )
))
(declare-datatypes ((array!1165 0))(
  ( (array!1166 (arr!554 (Array (_ BitVec 32) (_ BitVec 64))) (size!647 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!290 0))(
  ( (ValueCellFull!290 (v!1548 V!1131)) (EmptyCell!290) )
))
(declare-datatypes ((array!1167 0))(
  ( (array!1168 (arr!555 (Array (_ BitVec 32) ValueCell!290)) (size!648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!166 0))(
  ( (LongMapFixedSize!167 (defaultEntry!1706 Int) (mask!4670 (_ BitVec 32)) (extraKeys!1612 (_ BitVec 32)) (zeroValue!1636 V!1131) (minValue!1636 V!1131) (_size!121 (_ BitVec 32)) (_keys!3130 array!1165) (_values!1698 array!1167) (_vacant!121 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!166 0))(
  ( (Cell!167 (v!1549 LongMapFixedSize!166)) )
))
(declare-datatypes ((tuple2!854 0))(
  ( (tuple2!855 (_1!430 Bool) (_2!430 Cell!166)) )
))
(declare-fun e!13213 () tuple2!854)

(declare-datatypes ((tuple2!856 0))(
  ( (tuple2!857 (_1!431 Bool) (_2!431 LongMapFixedSize!166)) )
))
(declare-fun lt!5921 () tuple2!856)

(declare-fun lt!5924 () tuple2!856)

(assert (=> b!20224 (= e!13213 (tuple2!855 (and (_1!431 lt!5921) (_1!431 lt!5924)) (Cell!167 (_2!431 lt!5924))))))

(declare-fun lt!5920 () LongMapFixedSize!166)

(declare-datatypes ((LongMap!166 0))(
  ( (LongMap!167 (underlying!94 Cell!166)) )
))
(declare-fun thiss!938 () LongMap!166)

(declare-fun update!20 (LongMapFixedSize!166 (_ BitVec 64) V!1131) tuple2!856)

(assert (=> b!20224 (= lt!5921 (update!20 lt!5920 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))))))

(declare-fun call!999 () tuple2!856)

(assert (=> b!20224 (= lt!5924 call!999)))

(declare-fun res!13389 () Bool)

(declare-fun e!13216 () Bool)

(assert (=> start!3288 (=> (not res!13389) (not e!13216))))

(declare-fun valid!92 (LongMap!166) Bool)

(assert (=> start!3288 (= res!13389 (valid!92 thiss!938))))

(assert (=> start!3288 e!13216))

(declare-fun e!13219 () Bool)

(assert (=> start!3288 e!13219))

(declare-fun b!20225 () Bool)

(declare-fun e!13217 () Bool)

(assert (=> b!20225 (= e!13219 e!13217)))

(declare-fun b!20226 () Bool)

(declare-fun e!13211 () Bool)

(assert (=> b!20226 (= e!13211 (and (= (size!647 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4670 (v!1549 (underlying!94 thiss!938))))) (bvsge (bvsub (size!647 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub (size!647 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) (size!647 (_keys!3130 (v!1549 (underlying!94 thiss!938)))))))))

(declare-fun bm!996 () Bool)

(declare-fun call!1000 () tuple2!856)

(assert (=> bm!996 (= call!1000 call!999)))

(declare-fun b!20227 () Bool)

(declare-fun lt!5919 () tuple2!856)

(assert (=> b!20227 (= lt!5919 call!1000)))

(declare-fun e!13209 () tuple2!854)

(assert (=> b!20227 (= e!13209 (tuple2!855 (_1!431 lt!5919) (Cell!167 (_2!431 lt!5919))))))

(declare-fun bm!997 () Bool)

(declare-fun c!2177 () Bool)

(declare-fun c!2178 () Bool)

(assert (=> bm!997 (= call!999 (update!20 (ite c!2177 (_2!431 lt!5921) lt!5920) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))))))

(declare-fun b!20228 () Bool)

(declare-fun e!13218 () Bool)

(declare-fun e!13208 () Bool)

(declare-fun mapRes!940 () Bool)

(assert (=> b!20228 (= e!13218 (and e!13208 mapRes!940))))

(declare-fun condMapEmpty!940 () Bool)

(declare-fun mapDefault!940 () ValueCell!290)

(assert (=> b!20228 (= condMapEmpty!940 (= (arr!555 (_values!1698 (v!1549 (underlying!94 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!290)) mapDefault!940)))))

(declare-fun b!20229 () Bool)

(declare-fun e!13212 () Bool)

(assert (=> b!20229 (= e!13217 e!13212)))

(declare-fun mapNonEmpty!940 () Bool)

(declare-fun tp!3373 () Bool)

(declare-fun e!13210 () Bool)

(assert (=> mapNonEmpty!940 (= mapRes!940 (and tp!3373 e!13210))))

(declare-fun mapRest!940 () (Array (_ BitVec 32) ValueCell!290))

(declare-fun mapValue!940 () ValueCell!290)

(declare-fun mapKey!940 () (_ BitVec 32))

(assert (=> mapNonEmpty!940 (= (arr!555 (_values!1698 (v!1549 (underlying!94 thiss!938)))) (store mapRest!940 mapKey!940 mapValue!940))))

(declare-fun b!20230 () Bool)

(declare-fun e!13214 () tuple2!854)

(assert (=> b!20230 (= e!13214 (tuple2!855 true (Cell!167 lt!5920)))))

(declare-fun mapIsEmpty!940 () Bool)

(assert (=> mapIsEmpty!940 mapRes!940))

(declare-fun b!20231 () Bool)

(assert (=> b!20231 (= e!13213 e!13209)))

(declare-fun lt!5923 () Bool)

(assert (=> b!20231 (= c!2178 (and (not lt!5923) (= (bvand (extraKeys!1612 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20232 () Bool)

(declare-fun c!2179 () Bool)

(assert (=> b!20232 (= c!2179 (and (not (= (bvand (extraKeys!1612 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5923))))

(assert (=> b!20232 (= e!13209 e!13214)))

(declare-fun b!20233 () Bool)

(declare-fun res!13390 () Bool)

(assert (=> b!20233 (=> (not res!13390) (not e!13211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20233 (= res!13390 (validMask!0 (mask!4670 (v!1549 (underlying!94 thiss!938)))))))

(declare-fun tp_is_empty!979 () Bool)

(declare-fun array_inv!391 (array!1165) Bool)

(declare-fun array_inv!392 (array!1167) Bool)

(assert (=> b!20234 (= e!13212 (and tp!3372 tp_is_empty!979 (array_inv!391 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) (array_inv!392 (_values!1698 (v!1549 (underlying!94 thiss!938)))) e!13218))))

(declare-fun b!20235 () Bool)

(assert (=> b!20235 (= e!13208 tp_is_empty!979)))

(declare-fun b!20236 () Bool)

(assert (=> b!20236 (= e!13210 tp_is_empty!979)))

(declare-fun b!20237 () Bool)

(assert (=> b!20237 (= e!13216 e!13211)))

(declare-fun res!13391 () Bool)

(assert (=> b!20237 (=> (not res!13391) (not e!13211))))

(assert (=> b!20237 (= res!13391 (_1!430 e!13213))))

(assert (=> b!20237 (= c!2177 (and (not lt!5923) (not (= (bvand (extraKeys!1612 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20237 (= lt!5923 (= (bvand (extraKeys!1612 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!19 ((_ BitVec 32) Int) LongMapFixedSize!166)

(declare-fun computeNewMask!16 (LongMap!166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20237 (= lt!5920 (getNewLongMapFixedSize!19 (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) (defaultEntry!1706 (v!1549 (underlying!94 thiss!938)))))))

(declare-fun b!20238 () Bool)

(declare-fun lt!5922 () tuple2!856)

(assert (=> b!20238 (= e!13214 (tuple2!855 (_1!431 lt!5922) (Cell!167 (_2!431 lt!5922))))))

(assert (=> b!20238 (= lt!5922 call!1000)))

(assert (= (and start!3288 res!13389) b!20237))

(assert (= (and b!20237 c!2177) b!20224))

(assert (= (and b!20237 (not c!2177)) b!20231))

(assert (= (and b!20231 c!2178) b!20227))

(assert (= (and b!20231 (not c!2178)) b!20232))

(assert (= (and b!20232 c!2179) b!20238))

(assert (= (and b!20232 (not c!2179)) b!20230))

(assert (= (or b!20227 b!20238) bm!996))

(assert (= (or b!20224 bm!996) bm!997))

(assert (= (and b!20237 res!13391) b!20233))

(assert (= (and b!20233 res!13390) b!20226))

(assert (= (and b!20228 condMapEmpty!940) mapIsEmpty!940))

(assert (= (and b!20228 (not condMapEmpty!940)) mapNonEmpty!940))

(get-info :version)

(assert (= (and mapNonEmpty!940 ((_ is ValueCellFull!290) mapValue!940)) b!20236))

(assert (= (and b!20228 ((_ is ValueCellFull!290) mapDefault!940)) b!20235))

(assert (= b!20234 b!20228))

(assert (= b!20229 b!20234))

(assert (= b!20225 b!20229))

(assert (= start!3288 b!20225))

(declare-fun m!14165 () Bool)

(assert (=> start!3288 m!14165))

(declare-fun m!14167 () Bool)

(assert (=> b!20224 m!14167))

(declare-fun m!14169 () Bool)

(assert (=> bm!997 m!14169))

(declare-fun m!14171 () Bool)

(assert (=> mapNonEmpty!940 m!14171))

(declare-fun m!14173 () Bool)

(assert (=> b!20234 m!14173))

(declare-fun m!14175 () Bool)

(assert (=> b!20234 m!14175))

(declare-fun m!14177 () Bool)

(assert (=> b!20233 m!14177))

(declare-fun m!14179 () Bool)

(assert (=> b!20237 m!14179))

(assert (=> b!20237 m!14179))

(declare-fun m!14181 () Bool)

(assert (=> b!20237 m!14181))

(check-sat (not start!3288) (not mapNonEmpty!940) tp_is_empty!979 (not b!20234) (not b!20224) (not b!20237) (not bm!997) (not b!20233) b_and!1385 (not b_next!715))
(check-sat b_and!1385 (not b_next!715))
(get-model)

(declare-fun d!3641 () Bool)

(assert (=> d!3641 (= (validMask!0 (mask!4670 (v!1549 (underlying!94 thiss!938)))) (and (or (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000001111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000011111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000001111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000011111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000001111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000011111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000001111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000011111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000001111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000011111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000001111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000011111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000001111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000011111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000001111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000011111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000111111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00001111111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00011111111111111111111111111111) (= (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20233 d!3641))

(declare-fun d!3643 () Bool)

(assert (=> d!3643 (= (array_inv!391 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) (bvsge (size!647 (_keys!3130 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20234 d!3643))

(declare-fun d!3645 () Bool)

(assert (=> d!3645 (= (array_inv!392 (_values!1698 (v!1549 (underlying!94 thiss!938)))) (bvsge (size!648 (_values!1698 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20234 d!3645))

(declare-fun bm!1058 () Bool)

(declare-fun c!2236 () Bool)

(declare-fun c!2237 () Bool)

(assert (=> bm!1058 (= c!2236 c!2237)))

(declare-fun call!1076 () Bool)

(declare-datatypes ((tuple2!866 0))(
  ( (tuple2!867 (_1!436 (_ BitVec 64)) (_2!436 V!1131)) )
))
(declare-datatypes ((List!551 0))(
  ( (Nil!548) (Cons!547 (h!1113 tuple2!866) (t!3197 List!551)) )
))
(declare-datatypes ((ListLongMap!549 0))(
  ( (ListLongMap!550 (toList!290 List!551)) )
))
(declare-fun e!13352 () ListLongMap!549)

(declare-fun contains!222 (ListLongMap!549 (_ BitVec 64)) Bool)

(assert (=> bm!1058 (= call!1076 (contains!222 e!13352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1059 () Bool)

(declare-fun call!1079 () Bool)

(declare-fun call!1070 () Bool)

(assert (=> bm!1059 (= call!1079 call!1070)))

(declare-fun b!20413 () Bool)

(declare-fun e!13344 () Bool)

(declare-fun e!13354 () Bool)

(assert (=> b!20413 (= e!13344 e!13354)))

(declare-fun c!2233 () Bool)

(declare-fun lt!6028 () tuple2!856)

(assert (=> b!20413 (= c!2233 (_1!431 lt!6028))))

(declare-fun bm!1060 () Bool)

(declare-fun call!1065 () ListLongMap!549)

(declare-fun call!1066 () ListLongMap!549)

(assert (=> bm!1060 (= call!1065 call!1066)))

(declare-fun bm!1061 () Bool)

(declare-fun call!1083 () Bool)

(declare-fun call!1074 () Bool)

(assert (=> bm!1061 (= call!1083 call!1074)))

(declare-fun b!20414 () Bool)

(declare-fun call!1064 () ListLongMap!549)

(declare-fun call!1081 () ListLongMap!549)

(declare-fun e!13351 () Bool)

(declare-fun +!39 (ListLongMap!549 tuple2!866) ListLongMap!549)

(assert (=> b!20414 (= e!13351 (= call!1064 (+!39 call!1081 (tuple2!867 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))))))))

(declare-fun b!20415 () Bool)

(declare-fun e!13340 () tuple2!856)

(declare-fun lt!6036 () tuple2!856)

(assert (=> b!20415 (= e!13340 (tuple2!857 (_1!431 lt!6036) (_2!431 lt!6036)))))

(declare-fun call!1072 () tuple2!856)

(assert (=> b!20415 (= lt!6036 call!1072)))

(declare-fun bm!1062 () Bool)

(declare-fun call!1062 () ListLongMap!549)

(assert (=> bm!1062 (= call!1062 call!1066)))

(declare-fun bm!1063 () Bool)

(declare-datatypes ((SeekEntryResult!49 0))(
  ( (MissingZero!49 (index!2316 (_ BitVec 32))) (Found!49 (index!2317 (_ BitVec 32))) (Intermediate!49 (undefined!861 Bool) (index!2318 (_ BitVec 32)) (x!4960 (_ BitVec 32))) (Undefined!49) (MissingVacant!49 (index!2319 (_ BitVec 32))) )
))
(declare-fun lt!6034 () SeekEntryResult!49)

(declare-fun c!2227 () Bool)

(declare-fun updateHelperNewKey!4 (LongMapFixedSize!166 (_ BitVec 64) V!1131 (_ BitVec 32)) tuple2!856)

(assert (=> bm!1063 (= call!1072 (updateHelperNewKey!4 lt!5920 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2227 (index!2319 lt!6034) (index!2316 lt!6034))))))

(declare-fun c!2234 () Bool)

(declare-fun c!2238 () Bool)

(declare-fun lt!6030 () SeekEntryResult!49)

(declare-fun c!2229 () Bool)

(declare-fun lt!6024 () SeekEntryResult!49)

(declare-fun lt!6016 () SeekEntryResult!49)

(declare-fun lt!6035 () SeekEntryResult!49)

(declare-fun c!2239 () Bool)

(declare-fun bm!1064 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1064 (= call!1070 (inRange!0 (ite c!2237 (ite c!2234 (index!2317 lt!6035) (ite c!2229 (index!2316 lt!6016) (index!2319 lt!6016))) (ite c!2238 (index!2317 lt!6030) (ite c!2239 (index!2316 lt!6024) (index!2319 lt!6024)))) (mask!4670 lt!5920)))))

(declare-fun b!20416 () Bool)

(declare-datatypes ((Unit!426 0))(
  ( (Unit!427) )
))
(declare-fun lt!6032 () Unit!426)

(declare-fun lt!6029 () Unit!426)

(assert (=> b!20416 (= lt!6032 lt!6029)))

(declare-fun call!1061 () ListLongMap!549)

(declare-fun call!1069 () ListLongMap!549)

(assert (=> b!20416 (= call!1061 call!1069)))

(declare-fun lt!6017 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 V!1131 Int) Unit!426)

(assert (=> b!20416 (= lt!6029 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) lt!6017 (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (defaultEntry!1706 lt!5920)))))

(assert (=> b!20416 (= lt!6017 (bvor (extraKeys!1612 lt!5920) #b00000000000000000000000000000010))))

(declare-fun e!13357 () tuple2!856)

(assert (=> b!20416 (= e!13357 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5920) (mask!4670 lt!5920) (bvor (extraKeys!1612 lt!5920) #b00000000000000000000000000000010) (zeroValue!1636 lt!5920) (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (_size!121 lt!5920) (_keys!3130 lt!5920) (_values!1698 lt!5920) (_vacant!121 lt!5920))))))

(declare-fun d!3647 () Bool)

(assert (=> d!3647 e!13344))

(declare-fun res!13451 () Bool)

(assert (=> d!3647 (=> (not res!13451) (not e!13344))))

(declare-fun valid!94 (LongMapFixedSize!166) Bool)

(assert (=> d!3647 (= res!13451 (valid!94 (_2!431 lt!6028)))))

(declare-fun e!13336 () tuple2!856)

(assert (=> d!3647 (= lt!6028 e!13336)))

(declare-fun c!2230 () Bool)

(assert (=> d!3647 (= c!2230 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3647 (valid!94 lt!5920)))

(assert (=> d!3647 (= (update!20 lt!5920 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))) lt!6028)))

(declare-fun b!20417 () Bool)

(declare-fun c!2235 () Bool)

(assert (=> b!20417 (= c!2235 ((_ is MissingVacant!49) lt!6016))))

(declare-fun e!13349 () Bool)

(declare-fun e!13348 () Bool)

(assert (=> b!20417 (= e!13349 e!13348)))

(declare-fun bm!1065 () Bool)

(declare-fun call!1063 () ListLongMap!549)

(assert (=> bm!1065 (= call!1069 call!1063)))

(declare-fun b!20418 () Bool)

(declare-fun c!2232 () Bool)

(assert (=> b!20418 (= c!2232 ((_ is MissingVacant!49) lt!6024))))

(declare-fun e!13355 () Bool)

(declare-fun e!13346 () Bool)

(assert (=> b!20418 (= e!13355 e!13346)))

(declare-fun bm!1066 () Bool)

(declare-fun call!1082 () Bool)

(assert (=> bm!1066 (= call!1082 call!1079)))

(declare-fun b!20419 () Bool)

(declare-fun lt!6037 () Unit!426)

(declare-fun e!13345 () Unit!426)

(assert (=> b!20419 (= lt!6037 e!13345)))

(assert (=> b!20419 (= c!2234 call!1076)))

(declare-fun e!13353 () tuple2!856)

(assert (=> b!20419 (= e!13353 (tuple2!857 false lt!5920))))

(declare-fun b!20420 () Bool)

(assert (=> b!20420 (= c!2227 ((_ is MissingVacant!49) lt!6034))))

(assert (=> b!20420 (= e!13353 e!13340)))

(declare-fun b!20421 () Bool)

(declare-fun e!13342 () Bool)

(assert (=> b!20421 (= e!13346 e!13342)))

(declare-fun res!13445 () Bool)

(assert (=> b!20421 (= res!13445 call!1082)))

(assert (=> b!20421 (=> (not res!13445) (not e!13342))))

(declare-fun b!20422 () Bool)

(declare-fun lt!6022 () Unit!426)

(declare-fun lt!6018 () Unit!426)

(assert (=> b!20422 (= lt!6022 lt!6018)))

(assert (=> b!20422 (contains!222 call!1063 (select (arr!554 (_keys!3130 lt!5920)) (index!2317 lt!6034)))))

(declare-fun lt!6040 () array!1167)

(declare-fun lemmaValidKeyInArrayIsInListMap!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) Int) Unit!426)

(assert (=> b!20422 (= lt!6018 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3130 lt!5920) lt!6040 (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) (index!2317 lt!6034) (defaultEntry!1706 lt!5920)))))

(assert (=> b!20422 (= lt!6040 (array!1168 (store (arr!555 (_values!1698 lt!5920)) (index!2317 lt!6034) (ValueCellFull!290 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))))) (size!648 (_values!1698 lt!5920))))))

(declare-fun lt!6038 () Unit!426)

(declare-fun lt!6031 () Unit!426)

(assert (=> b!20422 (= lt!6038 lt!6031)))

(declare-fun call!1078 () ListLongMap!549)

(assert (=> b!20422 (= call!1078 call!1065)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) (_ BitVec 64) V!1131 Int) Unit!426)

(assert (=> b!20422 (= lt!6031 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) (index!2317 lt!6034) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (defaultEntry!1706 lt!5920)))))

(declare-fun lt!6023 () Unit!426)

(declare-fun e!13356 () Unit!426)

(assert (=> b!20422 (= lt!6023 e!13356)))

(assert (=> b!20422 (= c!2238 call!1076)))

(declare-fun e!13341 () tuple2!856)

(assert (=> b!20422 (= e!13341 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) (_size!121 lt!5920) (_keys!3130 lt!5920) (array!1168 (store (arr!555 (_values!1698 lt!5920)) (index!2317 lt!6034) (ValueCellFull!290 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))))) (size!648 (_values!1698 lt!5920))) (_vacant!121 lt!5920))))))

(declare-fun b!20423 () Bool)

(declare-fun res!13441 () Bool)

(assert (=> b!20423 (= res!13441 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2319 lt!6016)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13347 () Bool)

(assert (=> b!20423 (=> (not res!13441) (not e!13347))))

(declare-fun b!20424 () Bool)

(assert (=> b!20424 (= e!13354 (= call!1064 call!1081))))

(declare-fun bm!1067 () Bool)

(declare-fun call!1067 () Bool)

(declare-fun call!1075 () Bool)

(assert (=> bm!1067 (= call!1067 call!1075)))

(declare-fun b!20425 () Bool)

(assert (=> b!20425 (= e!13340 e!13341)))

(declare-fun c!2228 () Bool)

(assert (=> b!20425 (= c!2228 ((_ is MissingZero!49) lt!6034))))

(declare-fun e!13339 () ListLongMap!549)

(declare-fun c!2231 () Bool)

(declare-fun bm!1068 () Bool)

(assert (=> bm!1068 (= call!1078 (+!39 e!13339 (ite c!2230 (ite c!2231 (tuple2!867 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))) (tuple2!867 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))))) (tuple2!867 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))))))))

(declare-fun c!2226 () Bool)

(assert (=> bm!1068 (= c!2226 c!2230)))

(declare-fun b!20426 () Bool)

(declare-fun res!13442 () Bool)

(declare-fun e!13338 () Bool)

(assert (=> b!20426 (=> (not res!13442) (not e!13338))))

(assert (=> b!20426 (= res!13442 call!1067)))

(assert (=> b!20426 (= e!13349 e!13338)))

(declare-fun b!20427 () Bool)

(declare-fun e!13337 () Bool)

(assert (=> b!20427 (= e!13337 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2317 lt!6035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20428 () Bool)

(declare-fun res!13449 () Bool)

(declare-fun e!13350 () Bool)

(assert (=> b!20428 (=> (not res!13449) (not e!13350))))

(assert (=> b!20428 (= res!13449 call!1082)))

(assert (=> b!20428 (= e!13355 e!13350)))

(declare-fun b!20429 () Bool)

(declare-fun getCurrentListMap!121 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) Int) ListLongMap!549)

(assert (=> b!20429 (= e!13352 (getCurrentListMap!121 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun bm!1069 () Bool)

(declare-fun arrayContainsKey!0 (array!1165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1069 (= call!1074 (arrayContainsKey!0 (_keys!3130 lt!5920) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!20430 () Bool)

(assert (=> b!20430 (= e!13346 ((_ is Undefined!49) lt!6024))))

(declare-fun b!20431 () Bool)

(declare-fun res!13439 () Bool)

(assert (=> b!20431 (= res!13439 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2319 lt!6024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20431 (=> (not res!13439) (not e!13342))))

(declare-fun bm!1070 () Bool)

(declare-fun map!386 (LongMapFixedSize!166) ListLongMap!549)

(assert (=> bm!1070 (= call!1081 (map!386 lt!5920))))

(declare-fun b!20432 () Bool)

(declare-fun lt!6027 () Unit!426)

(assert (=> b!20432 (= e!13356 lt!6027)))

(declare-fun call!1068 () Unit!426)

(assert (=> b!20432 (= lt!6027 call!1068)))

(declare-fun call!1077 () SeekEntryResult!49)

(assert (=> b!20432 (= lt!6030 call!1077)))

(declare-fun res!13444 () Bool)

(assert (=> b!20432 (= res!13444 ((_ is Found!49) lt!6030))))

(declare-fun e!13343 () Bool)

(assert (=> b!20432 (=> (not res!13444) (not e!13343))))

(assert (=> b!20432 e!13343))

(declare-fun bm!1071 () Bool)

(declare-fun lt!6026 () (_ BitVec 32))

(assert (=> bm!1071 (= call!1063 (getCurrentListMap!121 (_keys!3130 lt!5920) (ite c!2230 (_values!1698 lt!5920) lt!6040) (mask!4670 lt!5920) (ite c!2230 (ite c!2231 lt!6026 lt!6017) (extraKeys!1612 lt!5920)) (ite (and c!2230 c!2231) (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (zeroValue!1636 lt!5920)) (ite c!2230 (ite c!2231 (minValue!1636 lt!5920) (zeroValue!1636 (v!1549 (underlying!94 thiss!938)))) (minValue!1636 lt!5920)) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun bm!1072 () Bool)

(assert (=> bm!1072 (= call!1075 call!1070)))

(declare-fun bm!1073 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!426)

(assert (=> bm!1073 (= call!1068 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun b!20433 () Bool)

(assert (=> b!20433 (= e!13343 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2317 lt!6030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20434 () Bool)

(declare-fun res!13446 () Bool)

(assert (=> b!20434 (=> (not res!13446) (not e!13338))))

(assert (=> b!20434 (= res!13446 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2316 lt!6016)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1074 () Bool)

(assert (=> bm!1074 (= call!1066 (getCurrentListMap!121 (_keys!3130 lt!5920) (ite (or c!2230 c!2237) (_values!1698 lt!5920) (array!1168 (store (arr!555 (_values!1698 lt!5920)) (index!2317 lt!6034) (ValueCellFull!290 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))))) (size!648 (_values!1698 lt!5920)))) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun b!20435 () Bool)

(declare-fun lt!6019 () Unit!426)

(declare-fun lt!6021 () Unit!426)

(assert (=> b!20435 (= lt!6019 lt!6021)))

(assert (=> b!20435 (= call!1061 call!1069)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 V!1131 Int) Unit!426)

(assert (=> b!20435 (= lt!6021 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) lt!6026 (zeroValue!1636 lt!5920) (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 lt!5920) (defaultEntry!1706 lt!5920)))))

(assert (=> b!20435 (= lt!6026 (bvor (extraKeys!1612 lt!5920) #b00000000000000000000000000000001))))

(assert (=> b!20435 (= e!13357 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5920) (mask!4670 lt!5920) (bvor (extraKeys!1612 lt!5920) #b00000000000000000000000000000001) (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 lt!5920) (_size!121 lt!5920) (_keys!3130 lt!5920) (_values!1698 lt!5920) (_vacant!121 lt!5920))))))

(declare-fun b!20436 () Bool)

(declare-fun res!13438 () Bool)

(assert (=> b!20436 (= res!13438 call!1079)))

(assert (=> b!20436 (=> (not res!13438) (not e!13343))))

(declare-fun b!20437 () Bool)

(declare-fun Unit!428 () Unit!426)

(assert (=> b!20437 (= e!13356 Unit!428)))

(declare-fun lt!6039 () Unit!426)

(declare-fun call!1073 () Unit!426)

(assert (=> b!20437 (= lt!6039 call!1073)))

(assert (=> b!20437 (= lt!6024 call!1077)))

(assert (=> b!20437 (= c!2239 ((_ is MissingZero!49) lt!6024))))

(assert (=> b!20437 e!13355))

(declare-fun lt!6020 () Unit!426)

(assert (=> b!20437 (= lt!6020 lt!6039)))

(assert (=> b!20437 false))

(declare-fun b!20438 () Bool)

(assert (=> b!20438 (= e!13354 e!13351)))

(declare-fun res!13450 () Bool)

(assert (=> b!20438 (= res!13450 (contains!222 call!1064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20438 (=> (not res!13450) (not e!13351))))

(declare-fun b!20439 () Bool)

(assert (=> b!20439 (= e!13336 e!13353)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1165 (_ BitVec 32)) SeekEntryResult!49)

(assert (=> b!20439 (= lt!6034 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3130 lt!5920) (mask!4670 lt!5920)))))

(assert (=> b!20439 (= c!2237 ((_ is Undefined!49) lt!6034))))

(declare-fun bm!1075 () Bool)

(assert (=> bm!1075 (= call!1061 call!1078)))

(declare-fun b!20440 () Bool)

(assert (=> b!20440 (= e!13347 (not call!1083))))

(declare-fun b!20441 () Bool)

(assert (=> b!20441 (= e!13352 call!1065)))

(declare-fun b!20442 () Bool)

(declare-fun call!1080 () Bool)

(assert (=> b!20442 (= e!13350 (not call!1080))))

(declare-fun b!20443 () Bool)

(assert (=> b!20443 (= e!13342 (not call!1080))))

(declare-fun b!20444 () Bool)

(declare-fun lt!6033 () tuple2!856)

(assert (=> b!20444 (= lt!6033 call!1072)))

(assert (=> b!20444 (= e!13341 (tuple2!857 (_1!431 lt!6033) (_2!431 lt!6033)))))

(declare-fun b!20445 () Bool)

(assert (=> b!20445 (= e!13339 call!1062)))

(declare-fun b!20446 () Bool)

(declare-fun lt!6025 () Unit!426)

(assert (=> b!20446 (= e!13345 lt!6025)))

(assert (=> b!20446 (= lt!6025 call!1073)))

(declare-fun call!1084 () SeekEntryResult!49)

(assert (=> b!20446 (= lt!6016 call!1084)))

(assert (=> b!20446 (= c!2229 ((_ is MissingZero!49) lt!6016))))

(assert (=> b!20446 e!13349))

(declare-fun b!20447 () Bool)

(declare-fun Unit!429 () Unit!426)

(assert (=> b!20447 (= e!13345 Unit!429)))

(declare-fun lt!6041 () Unit!426)

(assert (=> b!20447 (= lt!6041 call!1068)))

(assert (=> b!20447 (= lt!6035 call!1084)))

(declare-fun res!13448 () Bool)

(assert (=> b!20447 (= res!13448 ((_ is Found!49) lt!6035))))

(assert (=> b!20447 (=> (not res!13448) (not e!13337))))

(assert (=> b!20447 e!13337))

(declare-fun lt!6015 () Unit!426)

(assert (=> b!20447 (= lt!6015 lt!6041)))

(assert (=> b!20447 false))

(declare-fun b!20448 () Bool)

(assert (=> b!20448 (= e!13348 e!13347)))

(declare-fun res!13443 () Bool)

(assert (=> b!20448 (= res!13443 call!1067)))

(assert (=> b!20448 (=> (not res!13443) (not e!13347))))

(declare-fun bm!1076 () Bool)

(assert (=> bm!1076 (= call!1080 call!1074)))

(declare-fun b!20449 () Bool)

(assert (=> b!20449 (= e!13348 ((_ is Undefined!49) lt!6016))))

(declare-fun b!20450 () Bool)

(declare-fun res!13447 () Bool)

(assert (=> b!20450 (=> (not res!13447) (not e!13350))))

(assert (=> b!20450 (= res!13447 (= (select (arr!554 (_keys!3130 lt!5920)) (index!2316 lt!6024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20451 () Bool)

(declare-fun res!13440 () Bool)

(assert (=> b!20451 (= res!13440 call!1075)))

(assert (=> b!20451 (=> (not res!13440) (not e!13337))))

(declare-fun bm!1077 () Bool)

(declare-fun call!1071 () SeekEntryResult!49)

(assert (=> bm!1077 (= call!1084 call!1071)))

(declare-fun b!20452 () Bool)

(assert (=> b!20452 (= e!13339 (getCurrentListMap!121 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun bm!1078 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!426)

(assert (=> bm!1078 (= call!1073 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3130 lt!5920) (_values!1698 lt!5920) (mask!4670 lt!5920) (extraKeys!1612 lt!5920) (zeroValue!1636 lt!5920) (minValue!1636 lt!5920) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1706 lt!5920)))))

(declare-fun b!20453 () Bool)

(assert (=> b!20453 (= e!13336 e!13357)))

(assert (=> b!20453 (= c!2231 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1079 () Bool)

(assert (=> bm!1079 (= call!1071 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3130 lt!5920) (mask!4670 lt!5920)))))

(declare-fun bm!1080 () Bool)

(assert (=> bm!1080 (= call!1077 call!1071)))

(declare-fun b!20454 () Bool)

(assert (=> b!20454 (= e!13338 (not call!1083))))

(declare-fun bm!1081 () Bool)

(assert (=> bm!1081 (= call!1064 (map!386 (_2!431 lt!6028)))))

(assert (= (and d!3647 c!2230) b!20453))

(assert (= (and d!3647 (not c!2230)) b!20439))

(assert (= (and b!20453 c!2231) b!20435))

(assert (= (and b!20453 (not c!2231)) b!20416))

(assert (= (or b!20435 b!20416) bm!1065))

(assert (= (or b!20435 b!20416) bm!1062))

(assert (= (or b!20435 b!20416) bm!1075))

(assert (= (and b!20439 c!2237) b!20419))

(assert (= (and b!20439 (not c!2237)) b!20420))

(assert (= (and b!20419 c!2234) b!20447))

(assert (= (and b!20419 (not c!2234)) b!20446))

(assert (= (and b!20447 res!13448) b!20451))

(assert (= (and b!20451 res!13440) b!20427))

(assert (= (and b!20446 c!2229) b!20426))

(assert (= (and b!20446 (not c!2229)) b!20417))

(assert (= (and b!20426 res!13442) b!20434))

(assert (= (and b!20434 res!13446) b!20454))

(assert (= (and b!20417 c!2235) b!20448))

(assert (= (and b!20417 (not c!2235)) b!20449))

(assert (= (and b!20448 res!13443) b!20423))

(assert (= (and b!20423 res!13441) b!20440))

(assert (= (or b!20426 b!20448) bm!1067))

(assert (= (or b!20454 b!20440) bm!1061))

(assert (= (or b!20451 bm!1067) bm!1072))

(assert (= (or b!20447 b!20446) bm!1077))

(assert (= (and b!20420 c!2227) b!20415))

(assert (= (and b!20420 (not c!2227)) b!20425))

(assert (= (and b!20425 c!2228) b!20444))

(assert (= (and b!20425 (not c!2228)) b!20422))

(assert (= (and b!20422 c!2238) b!20432))

(assert (= (and b!20422 (not c!2238)) b!20437))

(assert (= (and b!20432 res!13444) b!20436))

(assert (= (and b!20436 res!13438) b!20433))

(assert (= (and b!20437 c!2239) b!20428))

(assert (= (and b!20437 (not c!2239)) b!20418))

(assert (= (and b!20428 res!13449) b!20450))

(assert (= (and b!20450 res!13447) b!20442))

(assert (= (and b!20418 c!2232) b!20421))

(assert (= (and b!20418 (not c!2232)) b!20430))

(assert (= (and b!20421 res!13445) b!20431))

(assert (= (and b!20431 res!13439) b!20443))

(assert (= (or b!20428 b!20421) bm!1066))

(assert (= (or b!20442 b!20443) bm!1076))

(assert (= (or b!20436 bm!1066) bm!1059))

(assert (= (or b!20432 b!20437) bm!1080))

(assert (= (or b!20415 b!20444) bm!1063))

(assert (= (or b!20446 b!20437) bm!1078))

(assert (= (or bm!1072 bm!1059) bm!1064))

(assert (= (or b!20419 b!20422) bm!1060))

(assert (= (or b!20447 b!20432) bm!1073))

(assert (= (or bm!1077 bm!1080) bm!1079))

(assert (= (or bm!1061 bm!1076) bm!1069))

(assert (= (or b!20419 b!20422) bm!1058))

(assert (= (and bm!1058 c!2236) b!20441))

(assert (= (and bm!1058 (not c!2236)) b!20429))

(assert (= (or bm!1065 b!20422) bm!1071))

(assert (= (or bm!1062 bm!1060) bm!1074))

(assert (= (or bm!1075 b!20422) bm!1068))

(assert (= (and bm!1068 c!2226) b!20445))

(assert (= (and bm!1068 (not c!2226)) b!20452))

(assert (= (and d!3647 res!13451) b!20413))

(assert (= (and b!20413 c!2233) b!20438))

(assert (= (and b!20413 (not c!2233)) b!20424))

(assert (= (and b!20438 res!13450) b!20414))

(assert (= (or b!20414 b!20424) bm!1070))

(assert (= (or b!20438 b!20414 b!20424) bm!1081))

(declare-fun m!14219 () Bool)

(assert (=> b!20429 m!14219))

(declare-fun m!14221 () Bool)

(assert (=> bm!1071 m!14221))

(declare-fun m!14223 () Bool)

(assert (=> b!20423 m!14223))

(assert (=> b!20452 m!14219))

(declare-fun m!14225 () Bool)

(assert (=> b!20450 m!14225))

(declare-fun m!14227 () Bool)

(assert (=> b!20433 m!14227))

(declare-fun m!14229 () Bool)

(assert (=> bm!1073 m!14229))

(declare-fun m!14231 () Bool)

(assert (=> b!20422 m!14231))

(declare-fun m!14233 () Bool)

(assert (=> b!20422 m!14233))

(declare-fun m!14235 () Bool)

(assert (=> b!20422 m!14235))

(declare-fun m!14237 () Bool)

(assert (=> b!20422 m!14237))

(declare-fun m!14239 () Bool)

(assert (=> b!20422 m!14239))

(assert (=> b!20422 m!14233))

(declare-fun m!14241 () Bool)

(assert (=> b!20435 m!14241))

(declare-fun m!14243 () Bool)

(assert (=> b!20434 m!14243))

(declare-fun m!14245 () Bool)

(assert (=> b!20438 m!14245))

(declare-fun m!14247 () Bool)

(assert (=> bm!1079 m!14247))

(declare-fun m!14249 () Bool)

(assert (=> bm!1081 m!14249))

(declare-fun m!14251 () Bool)

(assert (=> bm!1063 m!14251))

(declare-fun m!14253 () Bool)

(assert (=> bm!1070 m!14253))

(assert (=> bm!1074 m!14231))

(declare-fun m!14255 () Bool)

(assert (=> bm!1074 m!14255))

(declare-fun m!14257 () Bool)

(assert (=> b!20416 m!14257))

(declare-fun m!14259 () Bool)

(assert (=> bm!1064 m!14259))

(declare-fun m!14261 () Bool)

(assert (=> bm!1068 m!14261))

(assert (=> b!20439 m!14247))

(declare-fun m!14263 () Bool)

(assert (=> d!3647 m!14263))

(declare-fun m!14265 () Bool)

(assert (=> d!3647 m!14265))

(declare-fun m!14267 () Bool)

(assert (=> bm!1069 m!14267))

(declare-fun m!14269 () Bool)

(assert (=> b!20414 m!14269))

(declare-fun m!14271 () Bool)

(assert (=> bm!1058 m!14271))

(declare-fun m!14273 () Bool)

(assert (=> bm!1078 m!14273))

(declare-fun m!14275 () Bool)

(assert (=> b!20431 m!14275))

(declare-fun m!14277 () Bool)

(assert (=> b!20427 m!14277))

(assert (=> b!20224 d!3647))

(declare-fun bm!1082 () Bool)

(declare-fun c!2250 () Bool)

(declare-fun c!2251 () Bool)

(assert (=> bm!1082 (= c!2250 c!2251)))

(declare-fun call!1100 () Bool)

(declare-fun e!13374 () ListLongMap!549)

(assert (=> bm!1082 (= call!1100 (contains!222 e!13374 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1083 () Bool)

(declare-fun call!1103 () Bool)

(declare-fun call!1094 () Bool)

(assert (=> bm!1083 (= call!1103 call!1094)))

(declare-fun b!20455 () Bool)

(declare-fun e!13366 () Bool)

(declare-fun e!13376 () Bool)

(assert (=> b!20455 (= e!13366 e!13376)))

(declare-fun c!2247 () Bool)

(declare-fun lt!6055 () tuple2!856)

(assert (=> b!20455 (= c!2247 (_1!431 lt!6055))))

(declare-fun bm!1084 () Bool)

(declare-fun call!1089 () ListLongMap!549)

(declare-fun call!1090 () ListLongMap!549)

(assert (=> bm!1084 (= call!1089 call!1090)))

(declare-fun bm!1085 () Bool)

(declare-fun call!1107 () Bool)

(declare-fun call!1098 () Bool)

(assert (=> bm!1085 (= call!1107 call!1098)))

(declare-fun call!1088 () ListLongMap!549)

(declare-fun e!13373 () Bool)

(declare-fun call!1105 () ListLongMap!549)

(declare-fun b!20456 () Bool)

(assert (=> b!20456 (= e!13373 (= call!1088 (+!39 call!1105 (tuple2!867 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))))))))

(declare-fun b!20457 () Bool)

(declare-fun e!13362 () tuple2!856)

(declare-fun lt!6063 () tuple2!856)

(assert (=> b!20457 (= e!13362 (tuple2!857 (_1!431 lt!6063) (_2!431 lt!6063)))))

(declare-fun call!1096 () tuple2!856)

(assert (=> b!20457 (= lt!6063 call!1096)))

(declare-fun bm!1086 () Bool)

(declare-fun call!1086 () ListLongMap!549)

(assert (=> bm!1086 (= call!1086 call!1090)))

(declare-fun lt!6061 () SeekEntryResult!49)

(declare-fun bm!1087 () Bool)

(declare-fun c!2241 () Bool)

(assert (=> bm!1087 (= call!1096 (updateHelperNewKey!4 (ite c!2177 (_2!431 lt!5921) lt!5920) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (ite c!2241 (index!2319 lt!6061) (index!2316 lt!6061))))))

(declare-fun c!2248 () Bool)

(declare-fun lt!6057 () SeekEntryResult!49)

(declare-fun c!2253 () Bool)

(declare-fun bm!1088 () Bool)

(declare-fun c!2243 () Bool)

(declare-fun lt!6051 () SeekEntryResult!49)

(declare-fun lt!6062 () SeekEntryResult!49)

(declare-fun lt!6043 () SeekEntryResult!49)

(declare-fun c!2252 () Bool)

(assert (=> bm!1088 (= call!1094 (inRange!0 (ite c!2251 (ite c!2248 (index!2317 lt!6062) (ite c!2243 (index!2316 lt!6043) (index!2319 lt!6043))) (ite c!2252 (index!2317 lt!6057) (ite c!2253 (index!2316 lt!6051) (index!2319 lt!6051)))) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun b!20458 () Bool)

(declare-fun lt!6059 () Unit!426)

(declare-fun lt!6056 () Unit!426)

(assert (=> b!20458 (= lt!6059 lt!6056)))

(declare-fun call!1085 () ListLongMap!549)

(declare-fun call!1093 () ListLongMap!549)

(assert (=> b!20458 (= call!1085 call!1093)))

(declare-fun lt!6044 () (_ BitVec 32))

(assert (=> b!20458 (= lt!6056 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) lt!6044 (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(assert (=> b!20458 (= lt!6044 (bvor (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000010))))

(declare-fun e!13379 () tuple2!856)

(assert (=> b!20458 (= e!13379 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (bvor (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000010) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (_size!121 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_vacant!121 (ite c!2177 (_2!431 lt!5921) lt!5920)))))))

(declare-fun d!3649 () Bool)

(assert (=> d!3649 e!13366))

(declare-fun res!13465 () Bool)

(assert (=> d!3649 (=> (not res!13465) (not e!13366))))

(assert (=> d!3649 (= res!13465 (valid!94 (_2!431 lt!6055)))))

(declare-fun e!13358 () tuple2!856)

(assert (=> d!3649 (= lt!6055 e!13358)))

(declare-fun c!2244 () Bool)

(assert (=> d!3649 (= c!2244 (= (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3649 (valid!94 (ite c!2177 (_2!431 lt!5921) lt!5920))))

(assert (=> d!3649 (= (update!20 (ite c!2177 (_2!431 lt!5921) lt!5920) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))) lt!6055)))

(declare-fun b!20459 () Bool)

(declare-fun c!2249 () Bool)

(assert (=> b!20459 (= c!2249 ((_ is MissingVacant!49) lt!6043))))

(declare-fun e!13371 () Bool)

(declare-fun e!13370 () Bool)

(assert (=> b!20459 (= e!13371 e!13370)))

(declare-fun bm!1089 () Bool)

(declare-fun call!1087 () ListLongMap!549)

(assert (=> bm!1089 (= call!1093 call!1087)))

(declare-fun b!20460 () Bool)

(declare-fun c!2246 () Bool)

(assert (=> b!20460 (= c!2246 ((_ is MissingVacant!49) lt!6051))))

(declare-fun e!13377 () Bool)

(declare-fun e!13368 () Bool)

(assert (=> b!20460 (= e!13377 e!13368)))

(declare-fun bm!1090 () Bool)

(declare-fun call!1106 () Bool)

(assert (=> bm!1090 (= call!1106 call!1103)))

(declare-fun b!20461 () Bool)

(declare-fun lt!6064 () Unit!426)

(declare-fun e!13367 () Unit!426)

(assert (=> b!20461 (= lt!6064 e!13367)))

(assert (=> b!20461 (= c!2248 call!1100)))

(declare-fun e!13375 () tuple2!856)

(assert (=> b!20461 (= e!13375 (tuple2!857 false (ite c!2177 (_2!431 lt!5921) lt!5920)))))

(declare-fun b!20462 () Bool)

(assert (=> b!20462 (= c!2241 ((_ is MissingVacant!49) lt!6061))))

(assert (=> b!20462 (= e!13375 e!13362)))

(declare-fun b!20463 () Bool)

(declare-fun e!13364 () Bool)

(assert (=> b!20463 (= e!13368 e!13364)))

(declare-fun res!13459 () Bool)

(assert (=> b!20463 (= res!13459 call!1106)))

(assert (=> b!20463 (=> (not res!13459) (not e!13364))))

(declare-fun b!20464 () Bool)

(declare-fun lt!6049 () Unit!426)

(declare-fun lt!6045 () Unit!426)

(assert (=> b!20464 (= lt!6049 lt!6045)))

(assert (=> b!20464 (contains!222 call!1087 (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6061)))))

(declare-fun lt!6067 () array!1167)

(assert (=> b!20464 (= lt!6045 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) lt!6067 (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (index!2317 lt!6061) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(assert (=> b!20464 (= lt!6067 (array!1168 (store (arr!555 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6061) (ValueCellFull!290 (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))))) (size!648 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)))))))

(declare-fun lt!6065 () Unit!426)

(declare-fun lt!6058 () Unit!426)

(assert (=> b!20464 (= lt!6065 lt!6058)))

(declare-fun call!1102 () ListLongMap!549)

(assert (=> b!20464 (= call!1102 call!1089)))

(assert (=> b!20464 (= lt!6058 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (index!2317 lt!6061) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun lt!6050 () Unit!426)

(declare-fun e!13378 () Unit!426)

(assert (=> b!20464 (= lt!6050 e!13378)))

(assert (=> b!20464 (= c!2252 call!1100)))

(declare-fun e!13363 () tuple2!856)

(assert (=> b!20464 (= e!13363 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_size!121 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (array!1168 (store (arr!555 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6061) (ValueCellFull!290 (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))))) (size!648 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)))) (_vacant!121 (ite c!2177 (_2!431 lt!5921) lt!5920)))))))

(declare-fun res!13455 () Bool)

(declare-fun b!20465 () Bool)

(assert (=> b!20465 (= res!13455 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2319 lt!6043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13369 () Bool)

(assert (=> b!20465 (=> (not res!13455) (not e!13369))))

(declare-fun b!20466 () Bool)

(assert (=> b!20466 (= e!13376 (= call!1088 call!1105))))

(declare-fun bm!1091 () Bool)

(declare-fun call!1091 () Bool)

(declare-fun call!1099 () Bool)

(assert (=> bm!1091 (= call!1091 call!1099)))

(declare-fun b!20467 () Bool)

(assert (=> b!20467 (= e!13362 e!13363)))

(declare-fun c!2242 () Bool)

(assert (=> b!20467 (= c!2242 ((_ is MissingZero!49) lt!6061))))

(declare-fun e!13361 () ListLongMap!549)

(declare-fun c!2245 () Bool)

(declare-fun bm!1092 () Bool)

(assert (=> bm!1092 (= call!1102 (+!39 e!13361 (ite c!2244 (ite c!2245 (tuple2!867 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))) (tuple2!867 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))))) (tuple2!867 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))))))))

(declare-fun c!2240 () Bool)

(assert (=> bm!1092 (= c!2240 c!2244)))

(declare-fun b!20468 () Bool)

(declare-fun res!13456 () Bool)

(declare-fun e!13360 () Bool)

(assert (=> b!20468 (=> (not res!13456) (not e!13360))))

(assert (=> b!20468 (= res!13456 call!1091)))

(assert (=> b!20468 (= e!13371 e!13360)))

(declare-fun b!20469 () Bool)

(declare-fun e!13359 () Bool)

(assert (=> b!20469 (= e!13359 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6062)) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20470 () Bool)

(declare-fun res!13463 () Bool)

(declare-fun e!13372 () Bool)

(assert (=> b!20470 (=> (not res!13463) (not e!13372))))

(assert (=> b!20470 (= res!13463 call!1106)))

(assert (=> b!20470 (= e!13377 e!13372)))

(declare-fun b!20471 () Bool)

(assert (=> b!20471 (= e!13374 (getCurrentListMap!121 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000000 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun bm!1093 () Bool)

(assert (=> bm!1093 (= call!1098 (arrayContainsKey!0 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!20472 () Bool)

(assert (=> b!20472 (= e!13368 ((_ is Undefined!49) lt!6051))))

(declare-fun res!13453 () Bool)

(declare-fun b!20473 () Bool)

(assert (=> b!20473 (= res!13453 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2319 lt!6051)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20473 (=> (not res!13453) (not e!13364))))

(declare-fun bm!1094 () Bool)

(assert (=> bm!1094 (= call!1105 (map!386 (ite c!2177 (_2!431 lt!5921) lt!5920)))))

(declare-fun b!20474 () Bool)

(declare-fun lt!6054 () Unit!426)

(assert (=> b!20474 (= e!13378 lt!6054)))

(declare-fun call!1092 () Unit!426)

(assert (=> b!20474 (= lt!6054 call!1092)))

(declare-fun call!1101 () SeekEntryResult!49)

(assert (=> b!20474 (= lt!6057 call!1101)))

(declare-fun res!13458 () Bool)

(assert (=> b!20474 (= res!13458 ((_ is Found!49) lt!6057))))

(declare-fun e!13365 () Bool)

(assert (=> b!20474 (=> (not res!13458) (not e!13365))))

(assert (=> b!20474 e!13365))

(declare-fun bm!1095 () Bool)

(declare-fun lt!6053 () (_ BitVec 32))

(assert (=> bm!1095 (= call!1087 (getCurrentListMap!121 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2244 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) lt!6067) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2244 (ite c!2245 lt!6053 lt!6044) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920))) (ite (and c!2244 c!2245) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920))) (ite c!2244 (ite c!2245 (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938)))))) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920))) #b00000000000000000000000000000000 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun bm!1096 () Bool)

(assert (=> bm!1096 (= call!1099 call!1094)))

(declare-fun bm!1097 () Bool)

(assert (=> bm!1097 (= call!1092 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun b!20475 () Bool)

(assert (=> b!20475 (= e!13365 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6057)) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20476 () Bool)

(declare-fun res!13460 () Bool)

(assert (=> b!20476 (=> (not res!13460) (not e!13360))))

(assert (=> b!20476 (= res!13460 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2316 lt!6043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1098 () Bool)

(assert (=> bm!1098 (= call!1090 (getCurrentListMap!121 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite (or c!2244 c!2251) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (array!1168 (store (arr!555 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2317 lt!6061) (ValueCellFull!290 (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))))) (size!648 (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920))))) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000000 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun b!20477 () Bool)

(declare-fun lt!6046 () Unit!426)

(declare-fun lt!6048 () Unit!426)

(assert (=> b!20477 (= lt!6046 lt!6048)))

(assert (=> b!20477 (= call!1085 call!1093)))

(assert (=> b!20477 (= lt!6048 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) lt!6053 (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(assert (=> b!20477 (= lt!6053 (bvor (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000001))))

(assert (=> b!20477 (= e!13379 (tuple2!857 true (LongMapFixedSize!167 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (bvor (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000001) (ite c!2177 (minValue!1636 (v!1549 (underlying!94 thiss!938))) (ite c!2178 (zeroValue!1636 (v!1549 (underlying!94 thiss!938))) (minValue!1636 (v!1549 (underlying!94 thiss!938))))) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_size!121 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_vacant!121 (ite c!2177 (_2!431 lt!5921) lt!5920)))))))

(declare-fun b!20478 () Bool)

(declare-fun res!13452 () Bool)

(assert (=> b!20478 (= res!13452 call!1103)))

(assert (=> b!20478 (=> (not res!13452) (not e!13365))))

(declare-fun b!20479 () Bool)

(declare-fun Unit!430 () Unit!426)

(assert (=> b!20479 (= e!13378 Unit!430)))

(declare-fun lt!6066 () Unit!426)

(declare-fun call!1097 () Unit!426)

(assert (=> b!20479 (= lt!6066 call!1097)))

(assert (=> b!20479 (= lt!6051 call!1101)))

(assert (=> b!20479 (= c!2253 ((_ is MissingZero!49) lt!6051))))

(assert (=> b!20479 e!13377))

(declare-fun lt!6047 () Unit!426)

(assert (=> b!20479 (= lt!6047 lt!6066)))

(assert (=> b!20479 false))

(declare-fun b!20480 () Bool)

(assert (=> b!20480 (= e!13376 e!13373)))

(declare-fun res!13464 () Bool)

(assert (=> b!20480 (= res!13464 (contains!222 call!1088 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20480 (=> (not res!13464) (not e!13373))))

(declare-fun b!20481 () Bool)

(assert (=> b!20481 (= e!13358 e!13375)))

(assert (=> b!20481 (= lt!6061 (seekEntryOrOpen!0 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(assert (=> b!20481 (= c!2251 ((_ is Undefined!49) lt!6061))))

(declare-fun bm!1099 () Bool)

(assert (=> bm!1099 (= call!1085 call!1102)))

(declare-fun b!20482 () Bool)

(assert (=> b!20482 (= e!13369 (not call!1107))))

(declare-fun b!20483 () Bool)

(assert (=> b!20483 (= e!13374 call!1089)))

(declare-fun b!20484 () Bool)

(declare-fun call!1104 () Bool)

(assert (=> b!20484 (= e!13372 (not call!1104))))

(declare-fun b!20485 () Bool)

(assert (=> b!20485 (= e!13364 (not call!1104))))

(declare-fun b!20486 () Bool)

(declare-fun lt!6060 () tuple2!856)

(assert (=> b!20486 (= lt!6060 call!1096)))

(assert (=> b!20486 (= e!13363 (tuple2!857 (_1!431 lt!6060) (_2!431 lt!6060)))))

(declare-fun b!20487 () Bool)

(assert (=> b!20487 (= e!13361 call!1086)))

(declare-fun b!20488 () Bool)

(declare-fun lt!6052 () Unit!426)

(assert (=> b!20488 (= e!13367 lt!6052)))

(assert (=> b!20488 (= lt!6052 call!1097)))

(declare-fun call!1108 () SeekEntryResult!49)

(assert (=> b!20488 (= lt!6043 call!1108)))

(assert (=> b!20488 (= c!2243 ((_ is MissingZero!49) lt!6043))))

(assert (=> b!20488 e!13371))

(declare-fun b!20489 () Bool)

(declare-fun Unit!431 () Unit!426)

(assert (=> b!20489 (= e!13367 Unit!431)))

(declare-fun lt!6068 () Unit!426)

(assert (=> b!20489 (= lt!6068 call!1092)))

(assert (=> b!20489 (= lt!6062 call!1108)))

(declare-fun res!13462 () Bool)

(assert (=> b!20489 (= res!13462 ((_ is Found!49) lt!6062))))

(assert (=> b!20489 (=> (not res!13462) (not e!13359))))

(assert (=> b!20489 e!13359))

(declare-fun lt!6042 () Unit!426)

(assert (=> b!20489 (= lt!6042 lt!6068)))

(assert (=> b!20489 false))

(declare-fun b!20490 () Bool)

(assert (=> b!20490 (= e!13370 e!13369)))

(declare-fun res!13457 () Bool)

(assert (=> b!20490 (= res!13457 call!1091)))

(assert (=> b!20490 (=> (not res!13457) (not e!13369))))

(declare-fun bm!1100 () Bool)

(assert (=> bm!1100 (= call!1104 call!1098)))

(declare-fun b!20491 () Bool)

(assert (=> b!20491 (= e!13370 ((_ is Undefined!49) lt!6043))))

(declare-fun b!20492 () Bool)

(declare-fun res!13461 () Bool)

(assert (=> b!20492 (=> (not res!13461) (not e!13372))))

(assert (=> b!20492 (= res!13461 (= (select (arr!554 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920))) (index!2316 lt!6051)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20493 () Bool)

(declare-fun res!13454 () Bool)

(assert (=> b!20493 (= res!13454 call!1099)))

(assert (=> b!20493 (=> (not res!13454) (not e!13359))))

(declare-fun bm!1101 () Bool)

(declare-fun call!1095 () SeekEntryResult!49)

(assert (=> bm!1101 (= call!1108 call!1095)))

(declare-fun b!20494 () Bool)

(assert (=> b!20494 (= e!13361 (getCurrentListMap!121 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) #b00000000000000000000000000000000 (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun bm!1102 () Bool)

(assert (=> bm!1102 (= call!1097 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (_values!1698 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920)) (extraKeys!1612 (ite c!2177 (_2!431 lt!5921) lt!5920)) (zeroValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (minValue!1636 (ite c!2177 (_2!431 lt!5921) lt!5920)) (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1706 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun b!20495 () Bool)

(assert (=> b!20495 (= e!13358 e!13379)))

(assert (=> b!20495 (= c!2245 (= (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1103 () Bool)

(assert (=> bm!1103 (= call!1095 (seekEntryOrOpen!0 (ite c!2177 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2178 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3130 (ite c!2177 (_2!431 lt!5921) lt!5920)) (mask!4670 (ite c!2177 (_2!431 lt!5921) lt!5920))))))

(declare-fun bm!1104 () Bool)

(assert (=> bm!1104 (= call!1101 call!1095)))

(declare-fun b!20496 () Bool)

(assert (=> b!20496 (= e!13360 (not call!1107))))

(declare-fun bm!1105 () Bool)

(assert (=> bm!1105 (= call!1088 (map!386 (_2!431 lt!6055)))))

(assert (= (and d!3649 c!2244) b!20495))

(assert (= (and d!3649 (not c!2244)) b!20481))

(assert (= (and b!20495 c!2245) b!20477))

(assert (= (and b!20495 (not c!2245)) b!20458))

(assert (= (or b!20477 b!20458) bm!1089))

(assert (= (or b!20477 b!20458) bm!1086))

(assert (= (or b!20477 b!20458) bm!1099))

(assert (= (and b!20481 c!2251) b!20461))

(assert (= (and b!20481 (not c!2251)) b!20462))

(assert (= (and b!20461 c!2248) b!20489))

(assert (= (and b!20461 (not c!2248)) b!20488))

(assert (= (and b!20489 res!13462) b!20493))

(assert (= (and b!20493 res!13454) b!20469))

(assert (= (and b!20488 c!2243) b!20468))

(assert (= (and b!20488 (not c!2243)) b!20459))

(assert (= (and b!20468 res!13456) b!20476))

(assert (= (and b!20476 res!13460) b!20496))

(assert (= (and b!20459 c!2249) b!20490))

(assert (= (and b!20459 (not c!2249)) b!20491))

(assert (= (and b!20490 res!13457) b!20465))

(assert (= (and b!20465 res!13455) b!20482))

(assert (= (or b!20468 b!20490) bm!1091))

(assert (= (or b!20496 b!20482) bm!1085))

(assert (= (or b!20493 bm!1091) bm!1096))

(assert (= (or b!20489 b!20488) bm!1101))

(assert (= (and b!20462 c!2241) b!20457))

(assert (= (and b!20462 (not c!2241)) b!20467))

(assert (= (and b!20467 c!2242) b!20486))

(assert (= (and b!20467 (not c!2242)) b!20464))

(assert (= (and b!20464 c!2252) b!20474))

(assert (= (and b!20464 (not c!2252)) b!20479))

(assert (= (and b!20474 res!13458) b!20478))

(assert (= (and b!20478 res!13452) b!20475))

(assert (= (and b!20479 c!2253) b!20470))

(assert (= (and b!20479 (not c!2253)) b!20460))

(assert (= (and b!20470 res!13463) b!20492))

(assert (= (and b!20492 res!13461) b!20484))

(assert (= (and b!20460 c!2246) b!20463))

(assert (= (and b!20460 (not c!2246)) b!20472))

(assert (= (and b!20463 res!13459) b!20473))

(assert (= (and b!20473 res!13453) b!20485))

(assert (= (or b!20470 b!20463) bm!1090))

(assert (= (or b!20484 b!20485) bm!1100))

(assert (= (or b!20478 bm!1090) bm!1083))

(assert (= (or b!20474 b!20479) bm!1104))

(assert (= (or b!20457 b!20486) bm!1087))

(assert (= (or b!20488 b!20479) bm!1102))

(assert (= (or bm!1096 bm!1083) bm!1088))

(assert (= (or b!20461 b!20464) bm!1084))

(assert (= (or b!20489 b!20474) bm!1097))

(assert (= (or bm!1101 bm!1104) bm!1103))

(assert (= (or bm!1085 bm!1100) bm!1093))

(assert (= (or b!20461 b!20464) bm!1082))

(assert (= (and bm!1082 c!2250) b!20483))

(assert (= (and bm!1082 (not c!2250)) b!20471))

(assert (= (or bm!1089 b!20464) bm!1095))

(assert (= (or bm!1086 bm!1084) bm!1098))

(assert (= (or bm!1099 b!20464) bm!1092))

(assert (= (and bm!1092 c!2240) b!20487))

(assert (= (and bm!1092 (not c!2240)) b!20494))

(assert (= (and d!3649 res!13465) b!20455))

(assert (= (and b!20455 c!2247) b!20480))

(assert (= (and b!20455 (not c!2247)) b!20466))

(assert (= (and b!20480 res!13464) b!20456))

(assert (= (or b!20456 b!20466) bm!1094))

(assert (= (or b!20480 b!20456 b!20466) bm!1105))

(declare-fun m!14279 () Bool)

(assert (=> b!20471 m!14279))

(declare-fun m!14281 () Bool)

(assert (=> bm!1095 m!14281))

(declare-fun m!14283 () Bool)

(assert (=> b!20465 m!14283))

(assert (=> b!20494 m!14279))

(declare-fun m!14285 () Bool)

(assert (=> b!20492 m!14285))

(declare-fun m!14287 () Bool)

(assert (=> b!20475 m!14287))

(declare-fun m!14289 () Bool)

(assert (=> bm!1097 m!14289))

(declare-fun m!14291 () Bool)

(assert (=> b!20464 m!14291))

(declare-fun m!14293 () Bool)

(assert (=> b!20464 m!14293))

(declare-fun m!14295 () Bool)

(assert (=> b!20464 m!14295))

(declare-fun m!14297 () Bool)

(assert (=> b!20464 m!14297))

(declare-fun m!14299 () Bool)

(assert (=> b!20464 m!14299))

(assert (=> b!20464 m!14293))

(declare-fun m!14301 () Bool)

(assert (=> b!20477 m!14301))

(declare-fun m!14303 () Bool)

(assert (=> b!20476 m!14303))

(declare-fun m!14305 () Bool)

(assert (=> b!20480 m!14305))

(declare-fun m!14307 () Bool)

(assert (=> bm!1103 m!14307))

(declare-fun m!14309 () Bool)

(assert (=> bm!1105 m!14309))

(declare-fun m!14311 () Bool)

(assert (=> bm!1087 m!14311))

(declare-fun m!14313 () Bool)

(assert (=> bm!1094 m!14313))

(assert (=> bm!1098 m!14291))

(declare-fun m!14315 () Bool)

(assert (=> bm!1098 m!14315))

(declare-fun m!14317 () Bool)

(assert (=> b!20458 m!14317))

(declare-fun m!14319 () Bool)

(assert (=> bm!1088 m!14319))

(declare-fun m!14321 () Bool)

(assert (=> bm!1092 m!14321))

(assert (=> b!20481 m!14307))

(declare-fun m!14323 () Bool)

(assert (=> d!3649 m!14323))

(declare-fun m!14325 () Bool)

(assert (=> d!3649 m!14325))

(declare-fun m!14327 () Bool)

(assert (=> bm!1093 m!14327))

(declare-fun m!14329 () Bool)

(assert (=> b!20456 m!14329))

(declare-fun m!14331 () Bool)

(assert (=> bm!1082 m!14331))

(declare-fun m!14333 () Bool)

(assert (=> bm!1102 m!14333))

(declare-fun m!14335 () Bool)

(assert (=> b!20473 m!14335))

(declare-fun m!14337 () Bool)

(assert (=> b!20469 m!14337))

(assert (=> bm!997 d!3649))

(declare-fun d!3651 () Bool)

(assert (=> d!3651 (= (valid!92 thiss!938) (valid!94 (v!1549 (underlying!94 thiss!938))))))

(declare-fun bs!895 () Bool)

(assert (= bs!895 d!3651))

(declare-fun m!14339 () Bool)

(assert (=> bs!895 m!14339))

(assert (=> start!3288 d!3651))

(declare-fun b!20509 () Bool)

(declare-fun e!13388 () Bool)

(declare-fun lt!6119 () tuple2!866)

(declare-fun lt!6131 () (_ BitVec 32))

(assert (=> b!20509 (= e!13388 (ite (= (_1!436 lt!6119) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6131 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6131 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20510 () Bool)

(declare-fun e!13387 () Unit!426)

(declare-fun Unit!432 () Unit!426)

(assert (=> b!20510 (= e!13387 Unit!432)))

(declare-fun b!20511 () Bool)

(declare-fun lt!6136 () array!1165)

(assert (=> b!20511 (= e!13388 (arrayContainsKey!0 lt!6136 (_1!436 lt!6119) #b00000000000000000000000000000000))))

(declare-fun b!20513 () Bool)

(declare-fun Unit!433 () Unit!426)

(assert (=> b!20513 (= e!13387 Unit!433)))

(declare-fun lt!6122 () LongMapFixedSize!166)

(declare-fun head!824 (List!551) tuple2!866)

(assert (=> b!20513 (= lt!6119 (head!824 (toList!290 (map!386 lt!6122))))))

(assert (=> b!20513 (= lt!6136 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!20513 (= lt!6131 #b00000000000000000000000000000000)))

(declare-fun lt!6127 () Unit!426)

(declare-fun lemmaKeyInListMapIsInArray!91 (array!1165 array!1167 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!426)

(declare-fun dynLambda!137 (Int (_ BitVec 64)) V!1131)

(assert (=> b!20513 (= lt!6127 (lemmaKeyInListMapIsInArray!91 lt!6136 (array!1168 ((as const (Array (_ BitVec 32) ValueCell!290)) EmptyCell!290) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) lt!6131 (dynLambda!137 (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!436 lt!6119) (defaultEntry!1706 (v!1549 (underlying!94 thiss!938)))))))

(declare-fun c!2259 () Bool)

(assert (=> b!20513 (= c!2259 (and (not (= (_1!436 lt!6119) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!436 lt!6119) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20513 e!13388))

(declare-fun lt!6115 () Unit!426)

(assert (=> b!20513 (= lt!6115 lt!6127)))

(declare-fun lt!6124 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1165 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20513 (= lt!6124 (arrayScanForKey!0 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (_1!436 lt!6119) #b00000000000000000000000000000000))))

(assert (=> b!20513 false))

(declare-fun b!20514 () Bool)

(declare-fun res!13470 () Bool)

(declare-fun e!13386 () Bool)

(assert (=> b!20514 (=> (not res!13470) (not e!13386))))

(declare-fun lt!6123 () LongMapFixedSize!166)

(assert (=> b!20514 (= res!13470 (= (mask!4670 lt!6123) (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938))))))))

(declare-fun d!3653 () Bool)

(assert (=> d!3653 e!13386))

(declare-fun res!13471 () Bool)

(assert (=> d!3653 (=> (not res!13471) (not e!13386))))

(assert (=> d!3653 (= res!13471 (valid!94 lt!6123))))

(assert (=> d!3653 (= lt!6123 lt!6122)))

(declare-fun lt!6116 () Unit!426)

(assert (=> d!3653 (= lt!6116 e!13387)))

(declare-fun c!2258 () Bool)

(assert (=> d!3653 (= c!2258 (not (= (map!386 lt!6122) (ListLongMap!550 Nil!548))))))

(declare-fun lt!6129 () Unit!426)

(declare-fun lt!6132 () Unit!426)

(assert (=> d!3653 (= lt!6129 lt!6132)))

(declare-fun lt!6117 () array!1165)

(declare-fun lt!6118 () (_ BitVec 32))

(declare-datatypes ((List!552 0))(
  ( (Nil!549) (Cons!548 (h!1114 (_ BitVec 64)) (t!3198 List!552)) )
))
(declare-fun lt!6128 () List!552)

(declare-fun arrayNoDuplicates!0 (array!1165 (_ BitVec 32) List!552) Bool)

(assert (=> d!3653 (arrayNoDuplicates!0 lt!6117 lt!6118 lt!6128)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1165 (_ BitVec 32) (_ BitVec 32) List!552) Unit!426)

(assert (=> d!3653 (= lt!6132 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6117 lt!6118 (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) lt!6128))))

(assert (=> d!3653 (= lt!6128 Nil!549)))

(assert (=> d!3653 (= lt!6118 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!6117 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6120 () Unit!426)

(declare-fun lt!6126 () Unit!426)

(assert (=> d!3653 (= lt!6120 lt!6126)))

(declare-fun lt!6135 () (_ BitVec 32))

(declare-fun lt!6130 () array!1165)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1165 (_ BitVec 32)) Bool)

(assert (=> d!3653 (arrayForallSeekEntryOrOpenFound!0 lt!6135 lt!6130 (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1165 (_ BitVec 32) (_ BitVec 32)) Unit!426)

(assert (=> d!3653 (= lt!6126 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6130 (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) lt!6135))))

(assert (=> d!3653 (= lt!6135 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!6130 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6121 () Unit!426)

(declare-fun lt!6133 () Unit!426)

(assert (=> d!3653 (= lt!6121 lt!6133)))

(declare-fun lt!6134 () array!1165)

(declare-fun lt!6125 () (_ BitVec 32))

(declare-fun lt!6137 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1165 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3653 (= (arrayCountValidKeys!0 lt!6134 lt!6125 lt!6137) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1165 (_ BitVec 32) (_ BitVec 32)) Unit!426)

(assert (=> d!3653 (= lt!6133 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6134 lt!6125 lt!6137))))

(assert (=> d!3653 (= lt!6137 (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3653 (= lt!6125 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!6134 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3653 (= lt!6122 (LongMapFixedSize!167 (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!137 (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1166 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (array!1168 ((as const (Array (_ BitVec 32) ValueCell!290)) EmptyCell!290) (bvadd (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3653 (validMask!0 (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))))))

(assert (=> d!3653 (= (getNewLongMapFixedSize!19 (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) (defaultEntry!1706 (v!1549 (underlying!94 thiss!938)))) lt!6123)))

(declare-fun b!20512 () Bool)

(assert (=> b!20512 (= e!13386 (= (map!386 lt!6123) (ListLongMap!550 Nil!548)))))

(assert (= (and d!3653 c!2258) b!20513))

(assert (= (and d!3653 (not c!2258)) b!20510))

(assert (= (and b!20513 c!2259) b!20511))

(assert (= (and b!20513 (not c!2259)) b!20509))

(assert (= (and d!3653 res!13471) b!20514))

(assert (= (and b!20514 res!13470) b!20512))

(declare-fun b_lambda!1485 () Bool)

(assert (=> (not b_lambda!1485) (not b!20513)))

(declare-fun t!3196 () Bool)

(declare-fun tb!633 () Bool)

(assert (=> (and b!20234 (= (defaultEntry!1706 (v!1549 (underlying!94 thiss!938))) (defaultEntry!1706 (v!1549 (underlying!94 thiss!938)))) t!3196) tb!633))

(declare-fun result!1045 () Bool)

(assert (=> tb!633 (= result!1045 tp_is_empty!979)))

(assert (=> b!20513 t!3196))

(declare-fun b_and!1391 () Bool)

(assert (= b_and!1385 (and (=> t!3196 result!1045) b_and!1391)))

(declare-fun b_lambda!1487 () Bool)

(assert (=> (not b_lambda!1487) (not d!3653)))

(assert (=> d!3653 t!3196))

(declare-fun b_and!1393 () Bool)

(assert (= b_and!1391 (and (=> t!3196 result!1045) b_and!1393)))

(declare-fun m!14341 () Bool)

(assert (=> b!20511 m!14341))

(declare-fun m!14343 () Bool)

(assert (=> b!20513 m!14343))

(declare-fun m!14345 () Bool)

(assert (=> b!20513 m!14345))

(declare-fun m!14347 () Bool)

(assert (=> b!20513 m!14347))

(declare-fun m!14349 () Bool)

(assert (=> b!20513 m!14349))

(assert (=> b!20513 m!14179))

(assert (=> b!20513 m!14345))

(assert (=> b!20513 m!14345))

(declare-fun m!14351 () Bool)

(assert (=> b!20513 m!14351))

(declare-fun m!14353 () Bool)

(assert (=> d!3653 m!14353))

(assert (=> d!3653 m!14179))

(declare-fun m!14355 () Bool)

(assert (=> d!3653 m!14355))

(declare-fun m!14357 () Bool)

(assert (=> d!3653 m!14357))

(assert (=> d!3653 m!14345))

(assert (=> d!3653 m!14347))

(assert (=> d!3653 m!14179))

(declare-fun m!14359 () Bool)

(assert (=> d!3653 m!14359))

(declare-fun m!14361 () Bool)

(assert (=> d!3653 m!14361))

(declare-fun m!14363 () Bool)

(assert (=> d!3653 m!14363))

(declare-fun m!14365 () Bool)

(assert (=> d!3653 m!14365))

(assert (=> d!3653 m!14179))

(declare-fun m!14367 () Bool)

(assert (=> d!3653 m!14367))

(declare-fun m!14369 () Bool)

(assert (=> b!20512 m!14369))

(assert (=> b!20237 d!3653))

(declare-fun d!3655 () Bool)

(declare-fun e!13393 () Bool)

(assert (=> d!3655 e!13393))

(declare-fun res!13474 () Bool)

(assert (=> d!3655 (=> (not res!13474) (not e!13393))))

(declare-fun lt!6142 () (_ BitVec 32))

(assert (=> d!3655 (= res!13474 (validMask!0 lt!6142))))

(declare-datatypes ((tuple2!868 0))(
  ( (tuple2!869 (_1!437 Unit!426) (_2!437 (_ BitVec 32))) )
))
(declare-fun e!13394 () tuple2!868)

(assert (=> d!3655 (= lt!6142 (_2!437 e!13394))))

(declare-fun c!2262 () Bool)

(declare-fun lt!6143 () tuple2!868)

(assert (=> d!3655 (= c!2262 (and (bvsgt (_2!437 lt!6143) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!121 (v!1549 (underlying!94 thiss!938)))) (_2!437 lt!6143)) (bvsge (bvadd (bvand (bvashr (_2!437 lt!6143) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!121 (v!1549 (underlying!94 thiss!938))))))))

(declare-fun Unit!434 () Unit!426)

(declare-fun Unit!435 () Unit!426)

(assert (=> d!3655 (= lt!6143 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!121 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))))) (mask!4670 (v!1549 (underlying!94 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!121 (v!1549 (underlying!94 thiss!938)))) (mask!4670 (v!1549 (underlying!94 thiss!938))))) (tuple2!869 Unit!434 (bvand (bvadd (bvshl (mask!4670 (v!1549 (underlying!94 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!869 Unit!435 (mask!4670 (v!1549 (underlying!94 thiss!938))))))))

(assert (=> d!3655 (validMask!0 (mask!4670 (v!1549 (underlying!94 thiss!938))))))

(assert (=> d!3655 (= (computeNewMask!16 thiss!938 (mask!4670 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (_size!121 (v!1549 (underlying!94 thiss!938)))) lt!6142)))

(declare-fun b!20523 () Bool)

(declare-fun computeNewMaskWhile!8 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!868)

(assert (=> b!20523 (= e!13394 (computeNewMaskWhile!8 (_size!121 (v!1549 (underlying!94 thiss!938))) (_vacant!121 (v!1549 (underlying!94 thiss!938))) (mask!4670 (v!1549 (underlying!94 thiss!938))) (_2!437 lt!6143)))))

(declare-fun b!20524 () Bool)

(declare-fun Unit!436 () Unit!426)

(assert (=> b!20524 (= e!13394 (tuple2!869 Unit!436 (_2!437 lt!6143)))))

(declare-fun b!20525 () Bool)

(assert (=> b!20525 (= e!13393 (bvsle (_size!121 (v!1549 (underlying!94 thiss!938))) (bvadd lt!6142 #b00000000000000000000000000000001)))))

(assert (= (and d!3655 c!2262) b!20523))

(assert (= (and d!3655 (not c!2262)) b!20524))

(assert (= (and d!3655 res!13474) b!20525))

(declare-fun m!14371 () Bool)

(assert (=> d!3655 m!14371))

(assert (=> d!3655 m!14177))

(declare-fun m!14373 () Bool)

(assert (=> b!20523 m!14373))

(assert (=> b!20237 d!3655))

(declare-fun b!20533 () Bool)

(declare-fun e!13400 () Bool)

(assert (=> b!20533 (= e!13400 tp_is_empty!979)))

(declare-fun condMapEmpty!949 () Bool)

(declare-fun mapDefault!949 () ValueCell!290)

(assert (=> mapNonEmpty!940 (= condMapEmpty!949 (= mapRest!940 ((as const (Array (_ BitVec 32) ValueCell!290)) mapDefault!949)))))

(declare-fun mapRes!949 () Bool)

(assert (=> mapNonEmpty!940 (= tp!3373 (and e!13400 mapRes!949))))

(declare-fun mapIsEmpty!949 () Bool)

(assert (=> mapIsEmpty!949 mapRes!949))

(declare-fun mapNonEmpty!949 () Bool)

(declare-fun tp!3388 () Bool)

(declare-fun e!13399 () Bool)

(assert (=> mapNonEmpty!949 (= mapRes!949 (and tp!3388 e!13399))))

(declare-fun mapKey!949 () (_ BitVec 32))

(declare-fun mapRest!949 () (Array (_ BitVec 32) ValueCell!290))

(declare-fun mapValue!949 () ValueCell!290)

(assert (=> mapNonEmpty!949 (= mapRest!940 (store mapRest!949 mapKey!949 mapValue!949))))

(declare-fun b!20532 () Bool)

(assert (=> b!20532 (= e!13399 tp_is_empty!979)))

(assert (= (and mapNonEmpty!940 condMapEmpty!949) mapIsEmpty!949))

(assert (= (and mapNonEmpty!940 (not condMapEmpty!949)) mapNonEmpty!949))

(assert (= (and mapNonEmpty!949 ((_ is ValueCellFull!290) mapValue!949)) b!20532))

(assert (= (and mapNonEmpty!940 ((_ is ValueCellFull!290) mapDefault!949)) b!20533))

(declare-fun m!14375 () Bool)

(assert (=> mapNonEmpty!949 m!14375))

(declare-fun b_lambda!1489 () Bool)

(assert (= b_lambda!1487 (or (and b!20234 b_free!715) b_lambda!1489)))

(declare-fun b_lambda!1491 () Bool)

(assert (= b_lambda!1485 (or (and b!20234 b_free!715) b_lambda!1491)))

(check-sat (not b!20435) (not b!20414) (not bm!1093) (not bm!1074) (not bm!1095) (not bm!1094) (not bm!1097) (not d!3651) (not d!3647) (not bm!1070) (not bm!1078) (not bm!1069) (not b!20438) (not b!20422) (not bm!1082) (not bm!1063) (not b_lambda!1491) (not bm!1087) (not b!20452) (not bm!1088) (not b!20429) (not bm!1064) (not b!20416) (not b!20464) (not d!3653) (not b!20511) (not bm!1079) (not bm!1071) (not b!20481) (not b!20512) tp_is_empty!979 (not bm!1058) (not b!20439) (not bm!1102) (not b!20513) (not bm!1068) (not b!20456) (not b!20458) (not b!20480) (not b!20477) (not d!3649) (not b!20494) (not bm!1081) (not mapNonEmpty!949) (not b_lambda!1489) (not b!20523) (not bm!1092) (not bm!1103) b_and!1393 (not bm!1098) (not bm!1105) (not bm!1073) (not b!20471) (not d!3655) (not b_next!715))
(check-sat b_and!1393 (not b_next!715))
