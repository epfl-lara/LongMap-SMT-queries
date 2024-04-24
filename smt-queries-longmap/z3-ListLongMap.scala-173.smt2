; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3294 () Bool)

(assert start!3294)

(declare-fun b!20250 () Bool)

(declare-fun b_free!715 () Bool)

(declare-fun b_next!715 () Bool)

(assert (=> b!20250 (= b_free!715 (not b_next!715))))

(declare-fun tp!3372 () Bool)

(declare-fun b_and!1385 () Bool)

(assert (=> b!20250 (= tp!3372 b_and!1385)))

(declare-fun b!20248 () Bool)

(declare-fun e!13226 () Bool)

(declare-fun e!13229 () Bool)

(declare-fun mapRes!940 () Bool)

(assert (=> b!20248 (= e!13226 (and e!13229 mapRes!940))))

(declare-fun condMapEmpty!940 () Bool)

(declare-datatypes ((V!1131 0))(
  ( (V!1132 (val!516 Int)) )
))
(declare-datatypes ((ValueCell!290 0))(
  ( (ValueCellFull!290 (v!1549 V!1131)) (EmptyCell!290) )
))
(declare-datatypes ((array!1165 0))(
  ( (array!1166 (arr!554 (Array (_ BitVec 32) ValueCell!290)) (size!647 (_ BitVec 32))) )
))
(declare-datatypes ((array!1167 0))(
  ( (array!1168 (arr!555 (Array (_ BitVec 32) (_ BitVec 64))) (size!648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!166 0))(
  ( (LongMapFixedSize!167 (defaultEntry!1706 Int) (mask!4670 (_ BitVec 32)) (extraKeys!1612 (_ BitVec 32)) (zeroValue!1636 V!1131) (minValue!1636 V!1131) (_size!121 (_ BitVec 32)) (_keys!3130 array!1167) (_values!1698 array!1165) (_vacant!121 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!166 0))(
  ( (Cell!167 (v!1550 LongMapFixedSize!166)) )
))
(declare-datatypes ((LongMap!166 0))(
  ( (LongMap!167 (underlying!94 Cell!166)) )
))
(declare-fun thiss!938 () LongMap!166)

(declare-fun mapDefault!940 () ValueCell!290)

(assert (=> b!20248 (= condMapEmpty!940 (= (arr!554 (_values!1698 (v!1550 (underlying!94 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!290)) mapDefault!940)))))

(declare-fun bm!996 () Bool)

(declare-datatypes ((tuple2!860 0))(
  ( (tuple2!861 (_1!433 Bool) (_2!433 LongMapFixedSize!166)) )
))
(declare-fun call!999 () tuple2!860)

(declare-fun call!1000 () tuple2!860)

(assert (=> bm!996 (= call!999 call!1000)))

(declare-fun b!20249 () Bool)

(declare-fun e!13230 () Bool)

(assert (=> b!20249 (= e!13230 (and (= (size!648 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4670 (v!1550 (underlying!94 thiss!938))))) (bvsge (bvsub (size!648 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub (size!648 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) (size!648 (_keys!3130 (v!1550 (underlying!94 thiss!938)))))))))

(declare-fun tp_is_empty!979 () Bool)

(declare-fun e!13235 () Bool)

(declare-fun array_inv!393 (array!1167) Bool)

(declare-fun array_inv!394 (array!1165) Bool)

(assert (=> b!20250 (= e!13235 (and tp!3372 tp_is_empty!979 (array_inv!393 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) (array_inv!394 (_values!1698 (v!1550 (underlying!94 thiss!938)))) e!13226))))

(declare-fun b!20251 () Bool)

(declare-fun lt!5924 () tuple2!860)

(assert (=> b!20251 (= lt!5924 call!999)))

(declare-datatypes ((tuple2!862 0))(
  ( (tuple2!863 (_1!434 Bool) (_2!434 Cell!166)) )
))
(declare-fun e!13234 () tuple2!862)

(assert (=> b!20251 (= e!13234 (tuple2!863 (_1!433 lt!5924) (Cell!167 (_2!433 lt!5924))))))

(declare-fun b!20252 () Bool)

(declare-fun e!13227 () tuple2!862)

(assert (=> b!20252 (= e!13227 e!13234)))

(declare-fun c!2186 () Bool)

(declare-fun lt!5926 () Bool)

(assert (=> b!20252 (= c!2186 (and (not lt!5926) (= (bvand (extraKeys!1612 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20253 () Bool)

(declare-fun e!13236 () tuple2!862)

(declare-fun lt!5925 () LongMapFixedSize!166)

(assert (=> b!20253 (= e!13236 (tuple2!863 true (Cell!167 lt!5925)))))

(declare-fun b!20254 () Bool)

(declare-fun c!2184 () Bool)

(assert (=> b!20254 (= c!2184 (and (not (= (bvand (extraKeys!1612 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5926))))

(assert (=> b!20254 (= e!13234 e!13236)))

(declare-fun b!20255 () Bool)

(declare-fun e!13233 () Bool)

(assert (=> b!20255 (= e!13233 tp_is_empty!979)))

(declare-fun b!20256 () Bool)

(declare-fun lt!5928 () tuple2!860)

(declare-fun lt!5927 () tuple2!860)

(assert (=> b!20256 (= e!13227 (tuple2!863 (and (_1!433 lt!5928) (_1!433 lt!5927)) (Cell!167 (_2!433 lt!5927))))))

(assert (=> b!20256 (= lt!5928 call!1000)))

(declare-fun update!22 (LongMapFixedSize!166 (_ BitVec 64) V!1131) tuple2!860)

(assert (=> b!20256 (= lt!5927 (update!22 (_2!433 lt!5928) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938)))))))

(declare-fun mapIsEmpty!940 () Bool)

(assert (=> mapIsEmpty!940 mapRes!940))

(declare-fun res!13401 () Bool)

(declare-fun e!13228 () Bool)

(assert (=> start!3294 (=> (not res!13401) (not e!13228))))

(declare-fun valid!95 (LongMap!166) Bool)

(assert (=> start!3294 (= res!13401 (valid!95 thiss!938))))

(assert (=> start!3294 e!13228))

(declare-fun e!13225 () Bool)

(assert (=> start!3294 e!13225))

(declare-fun b!20257 () Bool)

(declare-fun lt!5923 () tuple2!860)

(assert (=> b!20257 (= e!13236 (tuple2!863 (_1!433 lt!5923) (Cell!167 (_2!433 lt!5923))))))

(assert (=> b!20257 (= lt!5923 call!999)))

(declare-fun b!20258 () Bool)

(declare-fun res!13400 () Bool)

(assert (=> b!20258 (=> (not res!13400) (not e!13230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20258 (= res!13400 (validMask!0 (mask!4670 (v!1550 (underlying!94 thiss!938)))))))

(declare-fun bm!997 () Bool)

(declare-fun c!2185 () Bool)

(assert (=> bm!997 (= call!1000 (update!22 lt!5925 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))))))

(declare-fun b!20259 () Bool)

(declare-fun e!13231 () Bool)

(assert (=> b!20259 (= e!13231 e!13235)))

(declare-fun b!20260 () Bool)

(assert (=> b!20260 (= e!13229 tp_is_empty!979)))

(declare-fun mapNonEmpty!940 () Bool)

(declare-fun tp!3373 () Bool)

(assert (=> mapNonEmpty!940 (= mapRes!940 (and tp!3373 e!13233))))

(declare-fun mapRest!940 () (Array (_ BitVec 32) ValueCell!290))

(declare-fun mapValue!940 () ValueCell!290)

(declare-fun mapKey!940 () (_ BitVec 32))

(assert (=> mapNonEmpty!940 (= (arr!554 (_values!1698 (v!1550 (underlying!94 thiss!938)))) (store mapRest!940 mapKey!940 mapValue!940))))

(declare-fun b!20261 () Bool)

(assert (=> b!20261 (= e!13225 e!13231)))

(declare-fun b!20262 () Bool)

(assert (=> b!20262 (= e!13228 e!13230)))

(declare-fun res!13399 () Bool)

(assert (=> b!20262 (=> (not res!13399) (not e!13230))))

(assert (=> b!20262 (= res!13399 (_1!434 e!13227))))

(assert (=> b!20262 (= c!2185 (and (not lt!5926) (not (= (bvand (extraKeys!1612 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20262 (= lt!5926 (= (bvand (extraKeys!1612 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!23 ((_ BitVec 32) Int) LongMapFixedSize!166)

(declare-fun computeNewMask!18 (LongMap!166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20262 (= lt!5925 (getNewLongMapFixedSize!23 (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) (defaultEntry!1706 (v!1550 (underlying!94 thiss!938)))))))

(assert (= (and start!3294 res!13401) b!20262))

(assert (= (and b!20262 c!2185) b!20256))

(assert (= (and b!20262 (not c!2185)) b!20252))

(assert (= (and b!20252 c!2186) b!20251))

(assert (= (and b!20252 (not c!2186)) b!20254))

(assert (= (and b!20254 c!2184) b!20257))

(assert (= (and b!20254 (not c!2184)) b!20253))

(assert (= (or b!20251 b!20257) bm!996))

(assert (= (or b!20256 bm!996) bm!997))

(assert (= (and b!20262 res!13399) b!20258))

(assert (= (and b!20258 res!13400) b!20249))

(assert (= (and b!20248 condMapEmpty!940) mapIsEmpty!940))

(assert (= (and b!20248 (not condMapEmpty!940)) mapNonEmpty!940))

(get-info :version)

(assert (= (and mapNonEmpty!940 ((_ is ValueCellFull!290) mapValue!940)) b!20255))

(assert (= (and b!20248 ((_ is ValueCellFull!290) mapDefault!940)) b!20260))

(assert (= b!20250 b!20248))

(assert (= b!20259 b!20250))

(assert (= b!20261 b!20259))

(assert (= start!3294 b!20261))

(declare-fun m!14179 () Bool)

(assert (=> start!3294 m!14179))

(declare-fun m!14181 () Bool)

(assert (=> mapNonEmpty!940 m!14181))

(declare-fun m!14183 () Bool)

(assert (=> b!20258 m!14183))

(declare-fun m!14185 () Bool)

(assert (=> b!20256 m!14185))

(declare-fun m!14187 () Bool)

(assert (=> bm!997 m!14187))

(declare-fun m!14189 () Bool)

(assert (=> b!20262 m!14189))

(assert (=> b!20262 m!14189))

(declare-fun m!14191 () Bool)

(assert (=> b!20262 m!14191))

(declare-fun m!14193 () Bool)

(assert (=> b!20250 m!14193))

(declare-fun m!14195 () Bool)

(assert (=> b!20250 m!14195))

(check-sat (not mapNonEmpty!940) (not b!20262) tp_is_empty!979 (not b!20256) (not b!20250) (not b!20258) (not bm!997) (not b_next!715) b_and!1385 (not start!3294))
(check-sat b_and!1385 (not b_next!715))
(get-model)

(declare-fun b!20437 () Bool)

(declare-fun e!13358 () Bool)

(declare-datatypes ((SeekEntryResult!48 0))(
  ( (MissingZero!48 (index!2312 (_ BitVec 32))) (Found!48 (index!2313 (_ BitVec 32))) (Intermediate!48 (undefined!860 Bool) (index!2314 (_ BitVec 32)) (x!4959 (_ BitVec 32))) (Undefined!48) (MissingVacant!48 (index!2315 (_ BitVec 32))) )
))
(declare-fun lt!6038 () SeekEntryResult!48)

(assert (=> b!20437 (= e!13358 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2313 lt!6038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!2236 () Bool)

(declare-datatypes ((tuple2!872 0))(
  ( (tuple2!873 (_1!439 (_ BitVec 64)) (_2!439 V!1131)) )
))
(declare-datatypes ((List!552 0))(
  ( (Nil!549) (Cons!548 (h!1114 tuple2!872) (t!3199 List!552)) )
))
(declare-datatypes ((ListLongMap!551 0))(
  ( (ListLongMap!552 (toList!291 List!552)) )
))
(declare-fun call!1072 () ListLongMap!551)

(declare-fun c!2234 () Bool)

(declare-fun lt!6043 () (_ BitVec 32))

(declare-fun bm!1058 () Bool)

(declare-fun lt!6031 () SeekEntryResult!48)

(declare-fun c!2240 () Bool)

(declare-fun getCurrentListMap!121 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) Int) ListLongMap!551)

(assert (=> bm!1058 (= call!1072 (getCurrentListMap!121 (_keys!3130 (_2!433 lt!5928)) (ite (or c!2236 c!2240) (_values!1698 (_2!433 lt!5928)) (array!1166 (store (arr!554 (_values!1698 (_2!433 lt!5928))) (index!2313 lt!6031) (ValueCellFull!290 (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (size!647 (_values!1698 (_2!433 lt!5928))))) (mask!4670 (_2!433 lt!5928)) (ite (and c!2236 c!2234) lt!6043 (extraKeys!1612 (_2!433 lt!5928))) (ite (and c!2236 c!2234) (minValue!1636 (v!1550 (underlying!94 thiss!938))) (zeroValue!1636 (_2!433 lt!5928))) (minValue!1636 (_2!433 lt!5928)) #b00000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun b!20438 () Bool)

(declare-datatypes ((Unit!429 0))(
  ( (Unit!430) )
))
(declare-fun e!13359 () Unit!429)

(declare-fun lt!6036 () Unit!429)

(assert (=> b!20438 (= e!13359 lt!6036)))

(declare-fun call!1066 () Unit!429)

(assert (=> b!20438 (= lt!6036 call!1066)))

(declare-fun lt!6029 () SeekEntryResult!48)

(declare-fun call!1062 () SeekEntryResult!48)

(assert (=> b!20438 (= lt!6029 call!1062)))

(declare-fun res!13452 () Bool)

(assert (=> b!20438 (= res!13452 ((_ is Found!48) lt!6029))))

(declare-fun e!13362 () Bool)

(assert (=> b!20438 (=> (not res!13452) (not e!13362))))

(assert (=> b!20438 e!13362))

(declare-fun b!20439 () Bool)

(declare-fun e!13371 () tuple2!860)

(declare-fun e!13353 () tuple2!860)

(assert (=> b!20439 (= e!13371 e!13353)))

(declare-fun c!2235 () Bool)

(assert (=> b!20439 (= c!2235 ((_ is MissingZero!48) lt!6031))))

(declare-fun bm!1059 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!429)

(assert (=> bm!1059 (= call!1066 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun b!20440 () Bool)

(declare-fun e!13373 () Unit!429)

(declare-fun lt!6044 () Unit!429)

(assert (=> b!20440 (= e!13373 lt!6044)))

(declare-fun call!1084 () Unit!429)

(assert (=> b!20440 (= lt!6044 call!1084)))

(declare-fun lt!6026 () SeekEntryResult!48)

(declare-fun call!1076 () SeekEntryResult!48)

(assert (=> b!20440 (= lt!6026 call!1076)))

(declare-fun c!2246 () Bool)

(assert (=> b!20440 (= c!2246 ((_ is MissingZero!48) lt!6026))))

(declare-fun e!13372 () Bool)

(assert (=> b!20440 e!13372))

(declare-fun bm!1060 () Bool)

(declare-fun call!1082 () Bool)

(declare-fun arrayContainsKey!0 (array!1167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1060 (= call!1082 (arrayContainsKey!0 (_keys!3130 (_2!433 lt!5928)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!1061 () Bool)

(declare-fun call!1079 () Bool)

(assert (=> bm!1061 (= call!1079 call!1082)))

(declare-fun b!20441 () Bool)

(declare-fun lt!6022 () Unit!429)

(declare-fun lt!6045 () Unit!429)

(assert (=> b!20441 (= lt!6022 lt!6045)))

(declare-fun call!1075 () ListLongMap!551)

(declare-fun call!1063 () ListLongMap!551)

(assert (=> b!20441 (= call!1075 call!1063)))

(declare-fun lt!6032 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 V!1131 Int) Unit!429)

(assert (=> b!20441 (= lt!6045 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) lt!6032 (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) (minValue!1636 (v!1550 (underlying!94 thiss!938))) (defaultEntry!1706 (_2!433 lt!5928))))))

(assert (=> b!20441 (= lt!6032 (bvor (extraKeys!1612 (_2!433 lt!5928)) #b00000000000000000000000000000010))))

(declare-fun e!13369 () tuple2!860)

(assert (=> b!20441 (= e!13369 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (bvor (extraKeys!1612 (_2!433 lt!5928)) #b00000000000000000000000000000010) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (v!1550 (underlying!94 thiss!938))) (_size!121 (_2!433 lt!5928)) (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (_vacant!121 (_2!433 lt!5928)))))))

(declare-fun b!20442 () Bool)

(declare-fun lt!6024 () Unit!429)

(assert (=> b!20442 (= lt!6024 e!13373)))

(declare-fun c!2244 () Bool)

(declare-fun call!1067 () Bool)

(assert (=> b!20442 (= c!2244 call!1067)))

(declare-fun e!13370 () tuple2!860)

(assert (=> b!20442 (= e!13370 (tuple2!861 false (_2!433 lt!5928)))))

(declare-fun b!20443 () Bool)

(declare-fun res!13451 () Bool)

(declare-fun e!13354 () Bool)

(assert (=> b!20443 (=> (not res!13451) (not e!13354))))

(declare-fun call!1083 () Bool)

(assert (=> b!20443 (= res!13451 call!1083)))

(declare-fun e!13361 () Bool)

(assert (=> b!20443 (= e!13361 e!13354)))

(declare-fun b!20444 () Bool)

(declare-fun e!13364 () Bool)

(declare-fun e!13366 () Bool)

(assert (=> b!20444 (= e!13364 e!13366)))

(declare-fun res!13459 () Bool)

(declare-fun call!1077 () ListLongMap!551)

(declare-fun contains!221 (ListLongMap!551 (_ BitVec 64)) Bool)

(assert (=> b!20444 (= res!13459 (contains!221 call!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20444 (=> (not res!13459) (not e!13366))))

(declare-fun bm!1062 () Bool)

(declare-fun call!1064 () ListLongMap!551)

(assert (=> bm!1062 (= call!1064 call!1072)))

(declare-fun b!20445 () Bool)

(declare-fun res!13453 () Bool)

(declare-fun call!1078 () Bool)

(assert (=> b!20445 (= res!13453 call!1078)))

(assert (=> b!20445 (=> (not res!13453) (not e!13358))))

(declare-fun bm!1063 () Bool)

(declare-fun call!1073 () Bool)

(assert (=> bm!1063 (= call!1083 call!1073)))

(declare-fun bm!1064 () Bool)

(declare-fun call!1061 () ListLongMap!551)

(assert (=> bm!1064 (= call!1063 call!1061)))

(declare-fun b!20446 () Bool)

(declare-fun e!13367 () ListLongMap!551)

(declare-fun call!1068 () ListLongMap!551)

(assert (=> b!20446 (= e!13367 call!1068)))

(declare-fun lt!6025 () SeekEntryResult!48)

(declare-fun call!1074 () Bool)

(declare-fun bm!1065 () Bool)

(declare-fun c!2233 () Bool)

(declare-fun c!2242 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1065 (= call!1074 (inRange!0 (ite c!2240 (ite c!2244 (index!2313 lt!6038) (ite c!2246 (index!2312 lt!6026) (index!2315 lt!6026))) (ite c!2233 (index!2313 lt!6029) (ite c!2242 (index!2312 lt!6025) (index!2315 lt!6025)))) (mask!4670 (_2!433 lt!5928))))))

(declare-fun b!20447 () Bool)

(declare-fun call!1071 () ListLongMap!551)

(declare-fun +!38 (ListLongMap!551 tuple2!872) ListLongMap!551)

(assert (=> b!20447 (= e!13366 (= call!1077 (+!38 call!1071 (tuple2!873 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938)))))))))

(declare-fun b!20448 () Bool)

(declare-fun c!2239 () Bool)

(assert (=> b!20448 (= c!2239 ((_ is MissingVacant!48) lt!6026))))

(declare-fun e!13363 () Bool)

(assert (=> b!20448 (= e!13372 e!13363)))

(declare-fun b!20449 () Bool)

(declare-fun c!2243 () Bool)

(assert (=> b!20449 (= c!2243 ((_ is MissingVacant!48) lt!6025))))

(declare-fun e!13360 () Bool)

(assert (=> b!20449 (= e!13361 e!13360)))

(declare-fun bm!1066 () Bool)

(declare-fun call!1081 () Bool)

(assert (=> bm!1066 (= call!1081 call!1078)))

(declare-fun b!20450 () Bool)

(declare-fun c!2237 () Bool)

(assert (=> b!20450 (= c!2237 ((_ is MissingVacant!48) lt!6031))))

(assert (=> b!20450 (= e!13370 e!13371)))

(declare-fun b!20451 () Bool)

(declare-fun e!13357 () Bool)

(assert (=> b!20451 (= e!13363 e!13357)))

(declare-fun res!13454 () Bool)

(assert (=> b!20451 (= res!13454 call!1081)))

(assert (=> b!20451 (=> (not res!13454) (not e!13357))))

(declare-fun b!20452 () Bool)

(declare-fun e!13356 () tuple2!860)

(assert (=> b!20452 (= e!13356 e!13370)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1167 (_ BitVec 32)) SeekEntryResult!48)

(assert (=> b!20452 (= lt!6031 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3130 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928))))))

(assert (=> b!20452 (= c!2240 ((_ is Undefined!48) lt!6031))))

(declare-fun b!20453 () Bool)

(declare-fun e!13355 () Bool)

(assert (=> b!20453 (= e!13355 e!13364)))

(declare-fun c!2241 () Bool)

(declare-fun lt!6035 () tuple2!860)

(assert (=> b!20453 (= c!2241 (_1!433 lt!6035))))

(declare-fun b!20454 () Bool)

(declare-fun lt!6039 () Unit!429)

(declare-fun lt!6019 () Unit!429)

(assert (=> b!20454 (= lt!6039 lt!6019)))

(assert (=> b!20454 (= call!1075 call!1064)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 V!1131 Int) Unit!429)

(assert (=> b!20454 (= lt!6019 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) lt!6043 (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (_2!433 lt!5928)) (defaultEntry!1706 (_2!433 lt!5928))))))

(assert (=> b!20454 (= lt!6043 (bvor (extraKeys!1612 (_2!433 lt!5928)) #b00000000000000000000000000000001))))

(assert (=> b!20454 (= e!13369 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (bvor (extraKeys!1612 (_2!433 lt!5928)) #b00000000000000000000000000000001) (minValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (_2!433 lt!5928)) (_size!121 (_2!433 lt!5928)) (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (_vacant!121 (_2!433 lt!5928)))))))

(declare-fun bm!1067 () Bool)

(declare-fun call!1070 () SeekEntryResult!48)

(assert (=> bm!1067 (= call!1062 call!1070)))

(declare-fun b!20455 () Bool)

(declare-fun res!13458 () Bool)

(declare-fun e!13368 () Bool)

(assert (=> b!20455 (=> (not res!13458) (not e!13368))))

(assert (=> b!20455 (= res!13458 call!1081)))

(assert (=> b!20455 (= e!13372 e!13368)))

(declare-fun d!3647 () Bool)

(assert (=> d!3647 e!13355))

(declare-fun res!13457 () Bool)

(assert (=> d!3647 (=> (not res!13457) (not e!13355))))

(declare-fun valid!98 (LongMapFixedSize!166) Bool)

(assert (=> d!3647 (= res!13457 (valid!98 (_2!433 lt!6035)))))

(assert (=> d!3647 (= lt!6035 e!13356)))

(assert (=> d!3647 (= c!2236 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3647 (valid!98 (_2!433 lt!5928))))

(assert (=> d!3647 (= (update!22 (_2!433 lt!5928) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938)))) lt!6035)))

(declare-fun call!1069 () tuple2!860)

(declare-fun bm!1068 () Bool)

(declare-fun updateHelperNewKey!4 (LongMapFixedSize!166 (_ BitVec 64) V!1131 (_ BitVec 32)) tuple2!860)

(assert (=> bm!1068 (= call!1069 (updateHelperNewKey!4 (_2!433 lt!5928) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938))) (ite c!2237 (index!2315 lt!6031) (index!2312 lt!6031))))))

(declare-fun b!20456 () Bool)

(assert (=> b!20456 (= e!13363 ((_ is Undefined!48) lt!6026))))

(declare-fun b!20457 () Bool)

(declare-fun res!13450 () Bool)

(assert (=> b!20457 (= res!13450 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2315 lt!6026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20457 (=> (not res!13450) (not e!13357))))

(declare-fun bm!1069 () Bool)

(declare-fun call!1065 () Bool)

(assert (=> bm!1069 (= call!1065 call!1082)))

(declare-fun b!20458 () Bool)

(declare-fun lt!6033 () tuple2!860)

(assert (=> b!20458 (= lt!6033 call!1069)))

(assert (=> b!20458 (= e!13353 (tuple2!861 (_1!433 lt!6033) (_2!433 lt!6033)))))

(declare-fun b!20459 () Bool)

(assert (=> b!20459 (= e!13360 ((_ is Undefined!48) lt!6025))))

(declare-fun b!20460 () Bool)

(declare-fun Unit!431 () Unit!429)

(assert (=> b!20460 (= e!13373 Unit!431)))

(declare-fun lt!6028 () Unit!429)

(assert (=> b!20460 (= lt!6028 call!1066)))

(assert (=> b!20460 (= lt!6038 call!1076)))

(declare-fun res!13455 () Bool)

(assert (=> b!20460 (= res!13455 ((_ is Found!48) lt!6038))))

(assert (=> b!20460 (=> (not res!13455) (not e!13358))))

(assert (=> b!20460 e!13358))

(declare-fun lt!6027 () Unit!429)

(assert (=> b!20460 (= lt!6027 lt!6028)))

(assert (=> b!20460 false))

(declare-fun bm!1070 () Bool)

(assert (=> bm!1070 (= call!1068 call!1072)))

(declare-fun lt!6021 () array!1165)

(declare-fun bm!1071 () Bool)

(assert (=> bm!1071 (= call!1061 (getCurrentListMap!121 (_keys!3130 (_2!433 lt!5928)) (ite c!2236 (_values!1698 (_2!433 lt!5928)) lt!6021) (mask!4670 (_2!433 lt!5928)) (ite c!2236 (ite c!2234 (extraKeys!1612 (_2!433 lt!5928)) lt!6032) (extraKeys!1612 (_2!433 lt!5928))) (zeroValue!1636 (_2!433 lt!5928)) (ite c!2236 (ite c!2234 (minValue!1636 (_2!433 lt!5928)) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (minValue!1636 (_2!433 lt!5928))) #b00000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun bm!1072 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!429)

(assert (=> bm!1072 (= call!1084 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun b!20461 () Bool)

(assert (=> b!20461 (= e!13354 (not call!1065))))

(declare-fun b!20462 () Bool)

(assert (=> b!20462 (= e!13362 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2313 lt!6029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20463 () Bool)

(assert (=> b!20463 (= e!13368 (not call!1079))))

(declare-fun b!20464 () Bool)

(declare-fun e!13374 () ListLongMap!551)

(assert (=> b!20464 (= e!13374 (ite c!2234 call!1063 call!1064))))

(declare-fun bm!1073 () Bool)

(assert (=> bm!1073 (= call!1078 call!1074)))

(declare-fun bm!1074 () Bool)

(declare-fun call!1080 () ListLongMap!551)

(assert (=> bm!1074 (= call!1075 call!1080)))

(declare-fun b!20465 () Bool)

(assert (=> b!20465 (= e!13357 (not call!1079))))

(declare-fun bm!1075 () Bool)

(assert (=> bm!1075 (= call!1080 (+!38 e!13374 (ite c!2236 (ite c!2234 (tuple2!873 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (tuple2!873 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (tuple2!873 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938)))))))))

(declare-fun c!2245 () Bool)

(assert (=> bm!1075 (= c!2245 c!2236)))

(declare-fun b!20466 () Bool)

(declare-fun res!13461 () Bool)

(assert (=> b!20466 (=> (not res!13461) (not e!13354))))

(assert (=> b!20466 (= res!13461 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2312 lt!6025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1076 () Bool)

(declare-fun map!388 (LongMapFixedSize!166) ListLongMap!551)

(assert (=> bm!1076 (= call!1071 (map!388 (_2!433 lt!5928)))))

(declare-fun b!20467 () Bool)

(declare-fun res!13448 () Bool)

(assert (=> b!20467 (= res!13448 call!1073)))

(assert (=> b!20467 (=> (not res!13448) (not e!13362))))

(declare-fun b!20468 () Bool)

(declare-fun lt!6041 () tuple2!860)

(assert (=> b!20468 (= e!13371 (tuple2!861 (_1!433 lt!6041) (_2!433 lt!6041)))))

(assert (=> b!20468 (= lt!6041 call!1069)))

(declare-fun b!20469 () Bool)

(assert (=> b!20469 (= e!13367 (getCurrentListMap!121 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) #b00000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun b!20470 () Bool)

(declare-fun e!13365 () Bool)

(assert (=> b!20470 (= e!13365 (not call!1065))))

(declare-fun b!20471 () Bool)

(assert (=> b!20471 (= e!13364 (= call!1077 call!1071))))

(declare-fun bm!1077 () Bool)

(declare-fun c!2238 () Bool)

(assert (=> bm!1077 (= c!2238 c!2240)))

(assert (=> bm!1077 (= call!1067 (contains!221 e!13367 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1078 () Bool)

(assert (=> bm!1078 (= call!1070 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3130 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928))))))

(declare-fun b!20472 () Bool)

(declare-fun Unit!432 () Unit!429)

(assert (=> b!20472 (= e!13359 Unit!432)))

(declare-fun lt!6042 () Unit!429)

(assert (=> b!20472 (= lt!6042 call!1084)))

(assert (=> b!20472 (= lt!6025 call!1062)))

(assert (=> b!20472 (= c!2242 ((_ is MissingZero!48) lt!6025))))

(assert (=> b!20472 e!13361))

(declare-fun lt!6023 () Unit!429)

(assert (=> b!20472 (= lt!6023 lt!6042)))

(assert (=> b!20472 false))

(declare-fun b!20473 () Bool)

(declare-fun res!13456 () Bool)

(assert (=> b!20473 (=> (not res!13456) (not e!13368))))

(assert (=> b!20473 (= res!13456 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2312 lt!6026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20474 () Bool)

(declare-fun lt!6034 () Unit!429)

(declare-fun lt!6040 () Unit!429)

(assert (=> b!20474 (= lt!6034 lt!6040)))

(assert (=> b!20474 (contains!221 call!1061 (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2313 lt!6031)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) Int) Unit!429)

(assert (=> b!20474 (= lt!6040 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3130 (_2!433 lt!5928)) lt!6021 (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) (index!2313 lt!6031) (defaultEntry!1706 (_2!433 lt!5928))))))

(assert (=> b!20474 (= lt!6021 (array!1166 (store (arr!554 (_values!1698 (_2!433 lt!5928))) (index!2313 lt!6031) (ValueCellFull!290 (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (size!647 (_values!1698 (_2!433 lt!5928)))))))

(declare-fun lt!6037 () Unit!429)

(declare-fun lt!6020 () Unit!429)

(assert (=> b!20474 (= lt!6037 lt!6020)))

(assert (=> b!20474 (= call!1080 call!1068)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 32) (_ BitVec 64) V!1131 Int) Unit!429)

(assert (=> b!20474 (= lt!6020 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) (index!2313 lt!6031) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1636 (v!1550 (underlying!94 thiss!938))) (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun lt!6030 () Unit!429)

(assert (=> b!20474 (= lt!6030 e!13359)))

(assert (=> b!20474 (= c!2233 call!1067)))

(assert (=> b!20474 (= e!13353 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) (_size!121 (_2!433 lt!5928)) (_keys!3130 (_2!433 lt!5928)) (array!1166 (store (arr!554 (_values!1698 (_2!433 lt!5928))) (index!2313 lt!6031) (ValueCellFull!290 (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (size!647 (_values!1698 (_2!433 lt!5928)))) (_vacant!121 (_2!433 lt!5928)))))))

(declare-fun b!20475 () Bool)

(assert (=> b!20475 (= e!13356 e!13369)))

(assert (=> b!20475 (= c!2234 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20476 () Bool)

(declare-fun res!13449 () Bool)

(assert (=> b!20476 (= res!13449 (= (select (arr!555 (_keys!3130 (_2!433 lt!5928))) (index!2315 lt!6025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20476 (=> (not res!13449) (not e!13365))))

(declare-fun b!20477 () Bool)

(assert (=> b!20477 (= e!13374 (getCurrentListMap!121 (_keys!3130 (_2!433 lt!5928)) (_values!1698 (_2!433 lt!5928)) (mask!4670 (_2!433 lt!5928)) (extraKeys!1612 (_2!433 lt!5928)) (zeroValue!1636 (_2!433 lt!5928)) (minValue!1636 (_2!433 lt!5928)) #b00000000000000000000000000000000 (defaultEntry!1706 (_2!433 lt!5928))))))

(declare-fun bm!1079 () Bool)

(assert (=> bm!1079 (= call!1077 (map!388 (_2!433 lt!6035)))))

(declare-fun b!20478 () Bool)

(assert (=> b!20478 (= e!13360 e!13365)))

(declare-fun res!13460 () Bool)

(assert (=> b!20478 (= res!13460 call!1083)))

(assert (=> b!20478 (=> (not res!13460) (not e!13365))))

(declare-fun bm!1080 () Bool)

(assert (=> bm!1080 (= call!1076 call!1070)))

(declare-fun bm!1081 () Bool)

(assert (=> bm!1081 (= call!1073 call!1074)))

(assert (= (and d!3647 c!2236) b!20475))

(assert (= (and d!3647 (not c!2236)) b!20452))

(assert (= (and b!20475 c!2234) b!20454))

(assert (= (and b!20475 (not c!2234)) b!20441))

(assert (= (or b!20454 b!20441) bm!1064))

(assert (= (or b!20454 b!20441) bm!1062))

(assert (= (or b!20454 b!20441) bm!1074))

(assert (= (and b!20452 c!2240) b!20442))

(assert (= (and b!20452 (not c!2240)) b!20450))

(assert (= (and b!20442 c!2244) b!20460))

(assert (= (and b!20442 (not c!2244)) b!20440))

(assert (= (and b!20460 res!13455) b!20445))

(assert (= (and b!20445 res!13453) b!20437))

(assert (= (and b!20440 c!2246) b!20455))

(assert (= (and b!20440 (not c!2246)) b!20448))

(assert (= (and b!20455 res!13458) b!20473))

(assert (= (and b!20473 res!13456) b!20463))

(assert (= (and b!20448 c!2239) b!20451))

(assert (= (and b!20448 (not c!2239)) b!20456))

(assert (= (and b!20451 res!13454) b!20457))

(assert (= (and b!20457 res!13450) b!20465))

(assert (= (or b!20455 b!20451) bm!1066))

(assert (= (or b!20463 b!20465) bm!1061))

(assert (= (or b!20445 bm!1066) bm!1073))

(assert (= (or b!20460 b!20440) bm!1080))

(assert (= (and b!20450 c!2237) b!20468))

(assert (= (and b!20450 (not c!2237)) b!20439))

(assert (= (and b!20439 c!2235) b!20458))

(assert (= (and b!20439 (not c!2235)) b!20474))

(assert (= (and b!20474 c!2233) b!20438))

(assert (= (and b!20474 (not c!2233)) b!20472))

(assert (= (and b!20438 res!13452) b!20467))

(assert (= (and b!20467 res!13448) b!20462))

(assert (= (and b!20472 c!2242) b!20443))

(assert (= (and b!20472 (not c!2242)) b!20449))

(assert (= (and b!20443 res!13451) b!20466))

(assert (= (and b!20466 res!13461) b!20461))

(assert (= (and b!20449 c!2243) b!20478))

(assert (= (and b!20449 (not c!2243)) b!20459))

(assert (= (and b!20478 res!13460) b!20476))

(assert (= (and b!20476 res!13449) b!20470))

(assert (= (or b!20443 b!20478) bm!1063))

(assert (= (or b!20461 b!20470) bm!1069))

(assert (= (or b!20467 bm!1063) bm!1081))

(assert (= (or b!20438 b!20472) bm!1067))

(assert (= (or b!20468 b!20458) bm!1068))

(assert (= (or bm!1073 bm!1081) bm!1065))

(assert (= (or b!20440 b!20472) bm!1072))

(assert (= (or b!20442 b!20474) bm!1070))

(assert (= (or b!20460 b!20438) bm!1059))

(assert (= (or bm!1080 bm!1067) bm!1078))

(assert (= (or bm!1061 bm!1069) bm!1060))

(assert (= (or b!20442 b!20474) bm!1077))

(assert (= (and bm!1077 c!2238) b!20446))

(assert (= (and bm!1077 (not c!2238)) b!20469))

(assert (= (or bm!1062 bm!1070) bm!1058))

(assert (= (or bm!1064 b!20474) bm!1071))

(assert (= (or bm!1074 b!20474) bm!1075))

(assert (= (and bm!1075 c!2245) b!20464))

(assert (= (and bm!1075 (not c!2245)) b!20477))

(assert (= (and d!3647 res!13457) b!20453))

(assert (= (and b!20453 c!2241) b!20444))

(assert (= (and b!20453 (not c!2241)) b!20471))

(assert (= (and b!20444 res!13459) b!20447))

(assert (= (or b!20447 b!20471) bm!1076))

(assert (= (or b!20444 b!20447 b!20471) bm!1079))

(declare-fun m!14233 () Bool)

(assert (=> b!20469 m!14233))

(declare-fun m!14235 () Bool)

(assert (=> bm!1059 m!14235))

(declare-fun m!14237 () Bool)

(assert (=> bm!1072 m!14237))

(declare-fun m!14239 () Bool)

(assert (=> bm!1060 m!14239))

(declare-fun m!14241 () Bool)

(assert (=> bm!1071 m!14241))

(declare-fun m!14243 () Bool)

(assert (=> b!20452 m!14243))

(declare-fun m!14245 () Bool)

(assert (=> bm!1077 m!14245))

(declare-fun m!14247 () Bool)

(assert (=> b!20444 m!14247))

(declare-fun m!14249 () Bool)

(assert (=> b!20474 m!14249))

(declare-fun m!14251 () Bool)

(assert (=> b!20474 m!14251))

(declare-fun m!14253 () Bool)

(assert (=> b!20474 m!14253))

(declare-fun m!14255 () Bool)

(assert (=> b!20474 m!14255))

(assert (=> b!20474 m!14249))

(declare-fun m!14257 () Bool)

(assert (=> b!20474 m!14257))

(assert (=> b!20477 m!14233))

(declare-fun m!14259 () Bool)

(assert (=> b!20441 m!14259))

(declare-fun m!14261 () Bool)

(assert (=> b!20476 m!14261))

(declare-fun m!14263 () Bool)

(assert (=> bm!1068 m!14263))

(declare-fun m!14265 () Bool)

(assert (=> b!20457 m!14265))

(assert (=> bm!1078 m!14243))

(declare-fun m!14267 () Bool)

(assert (=> b!20466 m!14267))

(declare-fun m!14269 () Bool)

(assert (=> bm!1076 m!14269))

(assert (=> bm!1058 m!14251))

(declare-fun m!14271 () Bool)

(assert (=> bm!1058 m!14271))

(declare-fun m!14273 () Bool)

(assert (=> bm!1065 m!14273))

(declare-fun m!14275 () Bool)

(assert (=> b!20473 m!14275))

(declare-fun m!14277 () Bool)

(assert (=> b!20454 m!14277))

(declare-fun m!14279 () Bool)

(assert (=> bm!1075 m!14279))

(declare-fun m!14281 () Bool)

(assert (=> b!20437 m!14281))

(declare-fun m!14283 () Bool)

(assert (=> b!20447 m!14283))

(declare-fun m!14285 () Bool)

(assert (=> b!20462 m!14285))

(declare-fun m!14287 () Bool)

(assert (=> d!3647 m!14287))

(declare-fun m!14289 () Bool)

(assert (=> d!3647 m!14289))

(declare-fun m!14291 () Bool)

(assert (=> bm!1079 m!14291))

(assert (=> b!20256 d!3647))

(declare-fun d!3649 () Bool)

(assert (=> d!3649 (= (array_inv!393 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) (bvsge (size!648 (_keys!3130 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20250 d!3649))

(declare-fun d!3651 () Bool)

(assert (=> d!3651 (= (array_inv!394 (_values!1698 (v!1550 (underlying!94 thiss!938)))) (bvsge (size!647 (_values!1698 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20250 d!3651))

(declare-fun d!3653 () Bool)

(assert (=> d!3653 (= (validMask!0 (mask!4670 (v!1550 (underlying!94 thiss!938)))) (and (or (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000001111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000011111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000001111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000011111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000001111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000011111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000001111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000011111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000001111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000011111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000001111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000011111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000001111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000011111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000001111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000011111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000111111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00001111111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00011111111111111111111111111111) (= (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20258 d!3653))

(declare-fun b!20479 () Bool)

(declare-fun e!13380 () Bool)

(declare-fun lt!6065 () SeekEntryResult!48)

(assert (=> b!20479 (= e!13380 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2313 lt!6065)) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun c!2250 () Bool)

(declare-fun lt!6058 () SeekEntryResult!48)

(declare-fun c!2254 () Bool)

(declare-fun lt!6070 () (_ BitVec 32))

(declare-fun c!2248 () Bool)

(declare-fun call!1096 () ListLongMap!551)

(declare-fun bm!1082 () Bool)

(assert (=> bm!1082 (= call!1096 (getCurrentListMap!121 (_keys!3130 lt!5925) (ite (or c!2250 c!2254) (_values!1698 lt!5925) (array!1166 (store (arr!554 (_values!1698 lt!5925)) (index!2313 lt!6058) (ValueCellFull!290 (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))))) (size!647 (_values!1698 lt!5925)))) (mask!4670 lt!5925) (ite (and c!2250 c!2248) lt!6070 (extraKeys!1612 lt!5925)) (ite (and c!2250 c!2248) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (zeroValue!1636 lt!5925)) (minValue!1636 lt!5925) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5925)))))

(declare-fun b!20480 () Bool)

(declare-fun e!13381 () Unit!429)

(declare-fun lt!6063 () Unit!429)

(assert (=> b!20480 (= e!13381 lt!6063)))

(declare-fun call!1090 () Unit!429)

(assert (=> b!20480 (= lt!6063 call!1090)))

(declare-fun lt!6056 () SeekEntryResult!48)

(declare-fun call!1086 () SeekEntryResult!48)

(assert (=> b!20480 (= lt!6056 call!1086)))

(declare-fun res!13466 () Bool)

(assert (=> b!20480 (= res!13466 ((_ is Found!48) lt!6056))))

(declare-fun e!13384 () Bool)

(assert (=> b!20480 (=> (not res!13466) (not e!13384))))

(assert (=> b!20480 e!13384))

(declare-fun b!20481 () Bool)

(declare-fun e!13393 () tuple2!860)

(declare-fun e!13375 () tuple2!860)

(assert (=> b!20481 (= e!13393 e!13375)))

(declare-fun c!2249 () Bool)

(assert (=> b!20481 (= c!2249 ((_ is MissingZero!48) lt!6058))))

(declare-fun bm!1083 () Bool)

(assert (=> bm!1083 (= call!1090 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1706 lt!5925)))))

(declare-fun b!20482 () Bool)

(declare-fun e!13395 () Unit!429)

(declare-fun lt!6071 () Unit!429)

(assert (=> b!20482 (= e!13395 lt!6071)))

(declare-fun call!1108 () Unit!429)

(assert (=> b!20482 (= lt!6071 call!1108)))

(declare-fun lt!6053 () SeekEntryResult!48)

(declare-fun call!1100 () SeekEntryResult!48)

(assert (=> b!20482 (= lt!6053 call!1100)))

(declare-fun c!2260 () Bool)

(assert (=> b!20482 (= c!2260 ((_ is MissingZero!48) lt!6053))))

(declare-fun e!13394 () Bool)

(assert (=> b!20482 e!13394))

(declare-fun bm!1084 () Bool)

(declare-fun call!1106 () Bool)

(assert (=> bm!1084 (= call!1106 (arrayContainsKey!0 (_keys!3130 lt!5925) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(declare-fun bm!1085 () Bool)

(declare-fun call!1103 () Bool)

(assert (=> bm!1085 (= call!1103 call!1106)))

(declare-fun b!20483 () Bool)

(declare-fun lt!6049 () Unit!429)

(declare-fun lt!6072 () Unit!429)

(assert (=> b!20483 (= lt!6049 lt!6072)))

(declare-fun call!1099 () ListLongMap!551)

(declare-fun call!1087 () ListLongMap!551)

(assert (=> b!20483 (= call!1099 call!1087)))

(declare-fun lt!6059 () (_ BitVec 32))

(assert (=> b!20483 (= lt!6072 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) lt!6059 (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (defaultEntry!1706 lt!5925)))))

(assert (=> b!20483 (= lt!6059 (bvor (extraKeys!1612 lt!5925) #b00000000000000000000000000000010))))

(declare-fun e!13391 () tuple2!860)

(assert (=> b!20483 (= e!13391 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5925) (mask!4670 lt!5925) (bvor (extraKeys!1612 lt!5925) #b00000000000000000000000000000010) (zeroValue!1636 lt!5925) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (_size!121 lt!5925) (_keys!3130 lt!5925) (_values!1698 lt!5925) (_vacant!121 lt!5925))))))

(declare-fun b!20484 () Bool)

(declare-fun lt!6051 () Unit!429)

(assert (=> b!20484 (= lt!6051 e!13395)))

(declare-fun c!2258 () Bool)

(declare-fun call!1091 () Bool)

(assert (=> b!20484 (= c!2258 call!1091)))

(declare-fun e!13392 () tuple2!860)

(assert (=> b!20484 (= e!13392 (tuple2!861 false lt!5925))))

(declare-fun b!20485 () Bool)

(declare-fun res!13465 () Bool)

(declare-fun e!13376 () Bool)

(assert (=> b!20485 (=> (not res!13465) (not e!13376))))

(declare-fun call!1107 () Bool)

(assert (=> b!20485 (= res!13465 call!1107)))

(declare-fun e!13383 () Bool)

(assert (=> b!20485 (= e!13383 e!13376)))

(declare-fun b!20486 () Bool)

(declare-fun e!13386 () Bool)

(declare-fun e!13388 () Bool)

(assert (=> b!20486 (= e!13386 e!13388)))

(declare-fun res!13473 () Bool)

(declare-fun call!1101 () ListLongMap!551)

(assert (=> b!20486 (= res!13473 (contains!221 call!1101 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20486 (=> (not res!13473) (not e!13388))))

(declare-fun bm!1086 () Bool)

(declare-fun call!1088 () ListLongMap!551)

(assert (=> bm!1086 (= call!1088 call!1096)))

(declare-fun b!20487 () Bool)

(declare-fun res!13467 () Bool)

(declare-fun call!1102 () Bool)

(assert (=> b!20487 (= res!13467 call!1102)))

(assert (=> b!20487 (=> (not res!13467) (not e!13380))))

(declare-fun bm!1087 () Bool)

(declare-fun call!1097 () Bool)

(assert (=> bm!1087 (= call!1107 call!1097)))

(declare-fun bm!1088 () Bool)

(declare-fun call!1085 () ListLongMap!551)

(assert (=> bm!1088 (= call!1087 call!1085)))

(declare-fun b!20488 () Bool)

(declare-fun e!13389 () ListLongMap!551)

(declare-fun call!1092 () ListLongMap!551)

(assert (=> b!20488 (= e!13389 call!1092)))

(declare-fun c!2256 () Bool)

(declare-fun call!1098 () Bool)

(declare-fun lt!6052 () SeekEntryResult!48)

(declare-fun bm!1089 () Bool)

(declare-fun c!2247 () Bool)

(assert (=> bm!1089 (= call!1098 (inRange!0 (ite c!2254 (ite c!2258 (index!2313 lt!6065) (ite c!2260 (index!2312 lt!6053) (index!2315 lt!6053))) (ite c!2247 (index!2313 lt!6056) (ite c!2256 (index!2312 lt!6052) (index!2315 lt!6052)))) (mask!4670 lt!5925)))))

(declare-fun call!1095 () ListLongMap!551)

(declare-fun b!20489 () Bool)

(assert (=> b!20489 (= e!13388 (= call!1101 (+!38 call!1095 (tuple2!873 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))))))))

(declare-fun b!20490 () Bool)

(declare-fun c!2253 () Bool)

(assert (=> b!20490 (= c!2253 ((_ is MissingVacant!48) lt!6053))))

(declare-fun e!13385 () Bool)

(assert (=> b!20490 (= e!13394 e!13385)))

(declare-fun b!20491 () Bool)

(declare-fun c!2257 () Bool)

(assert (=> b!20491 (= c!2257 ((_ is MissingVacant!48) lt!6052))))

(declare-fun e!13382 () Bool)

(assert (=> b!20491 (= e!13383 e!13382)))

(declare-fun bm!1090 () Bool)

(declare-fun call!1105 () Bool)

(assert (=> bm!1090 (= call!1105 call!1102)))

(declare-fun b!20492 () Bool)

(declare-fun c!2251 () Bool)

(assert (=> b!20492 (= c!2251 ((_ is MissingVacant!48) lt!6058))))

(assert (=> b!20492 (= e!13392 e!13393)))

(declare-fun b!20493 () Bool)

(declare-fun e!13379 () Bool)

(assert (=> b!20493 (= e!13385 e!13379)))

(declare-fun res!13468 () Bool)

(assert (=> b!20493 (= res!13468 call!1105)))

(assert (=> b!20493 (=> (not res!13468) (not e!13379))))

(declare-fun b!20494 () Bool)

(declare-fun e!13378 () tuple2!860)

(assert (=> b!20494 (= e!13378 e!13392)))

(assert (=> b!20494 (= lt!6058 (seekEntryOrOpen!0 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3130 lt!5925) (mask!4670 lt!5925)))))

(assert (=> b!20494 (= c!2254 ((_ is Undefined!48) lt!6058))))

(declare-fun b!20495 () Bool)

(declare-fun e!13377 () Bool)

(assert (=> b!20495 (= e!13377 e!13386)))

(declare-fun c!2255 () Bool)

(declare-fun lt!6062 () tuple2!860)

(assert (=> b!20495 (= c!2255 (_1!433 lt!6062))))

(declare-fun b!20496 () Bool)

(declare-fun lt!6066 () Unit!429)

(declare-fun lt!6046 () Unit!429)

(assert (=> b!20496 (= lt!6066 lt!6046)))

(assert (=> b!20496 (= call!1099 call!1088)))

(assert (=> b!20496 (= lt!6046 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) lt!6070 (zeroValue!1636 lt!5925) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (minValue!1636 lt!5925) (defaultEntry!1706 lt!5925)))))

(assert (=> b!20496 (= lt!6070 (bvor (extraKeys!1612 lt!5925) #b00000000000000000000000000000001))))

(assert (=> b!20496 (= e!13391 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5925) (mask!4670 lt!5925) (bvor (extraKeys!1612 lt!5925) #b00000000000000000000000000000001) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (minValue!1636 lt!5925) (_size!121 lt!5925) (_keys!3130 lt!5925) (_values!1698 lt!5925) (_vacant!121 lt!5925))))))

(declare-fun bm!1091 () Bool)

(declare-fun call!1094 () SeekEntryResult!48)

(assert (=> bm!1091 (= call!1086 call!1094)))

(declare-fun b!20497 () Bool)

(declare-fun res!13472 () Bool)

(declare-fun e!13390 () Bool)

(assert (=> b!20497 (=> (not res!13472) (not e!13390))))

(assert (=> b!20497 (= res!13472 call!1105)))

(assert (=> b!20497 (= e!13394 e!13390)))

(declare-fun d!3655 () Bool)

(assert (=> d!3655 e!13377))

(declare-fun res!13471 () Bool)

(assert (=> d!3655 (=> (not res!13471) (not e!13377))))

(assert (=> d!3655 (= res!13471 (valid!98 (_2!433 lt!6062)))))

(assert (=> d!3655 (= lt!6062 e!13378)))

(assert (=> d!3655 (= c!2250 (= (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3655 (valid!98 lt!5925)))

(assert (=> d!3655 (= (update!22 lt!5925 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))) lt!6062)))

(declare-fun bm!1092 () Bool)

(declare-fun call!1093 () tuple2!860)

(assert (=> bm!1092 (= call!1093 (updateHelperNewKey!4 lt!5925 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (ite c!2251 (index!2315 lt!6058) (index!2312 lt!6058))))))

(declare-fun b!20498 () Bool)

(assert (=> b!20498 (= e!13385 ((_ is Undefined!48) lt!6053))))

(declare-fun b!20499 () Bool)

(declare-fun res!13464 () Bool)

(assert (=> b!20499 (= res!13464 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2315 lt!6053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20499 (=> (not res!13464) (not e!13379))))

(declare-fun bm!1093 () Bool)

(declare-fun call!1089 () Bool)

(assert (=> bm!1093 (= call!1089 call!1106)))

(declare-fun b!20500 () Bool)

(declare-fun lt!6060 () tuple2!860)

(assert (=> b!20500 (= lt!6060 call!1093)))

(assert (=> b!20500 (= e!13375 (tuple2!861 (_1!433 lt!6060) (_2!433 lt!6060)))))

(declare-fun b!20501 () Bool)

(assert (=> b!20501 (= e!13382 ((_ is Undefined!48) lt!6052))))

(declare-fun b!20502 () Bool)

(declare-fun Unit!433 () Unit!429)

(assert (=> b!20502 (= e!13395 Unit!433)))

(declare-fun lt!6055 () Unit!429)

(assert (=> b!20502 (= lt!6055 call!1090)))

(assert (=> b!20502 (= lt!6065 call!1100)))

(declare-fun res!13469 () Bool)

(assert (=> b!20502 (= res!13469 ((_ is Found!48) lt!6065))))

(assert (=> b!20502 (=> (not res!13469) (not e!13380))))

(assert (=> b!20502 e!13380))

(declare-fun lt!6054 () Unit!429)

(assert (=> b!20502 (= lt!6054 lt!6055)))

(assert (=> b!20502 false))

(declare-fun bm!1094 () Bool)

(assert (=> bm!1094 (= call!1092 call!1096)))

(declare-fun bm!1095 () Bool)

(declare-fun lt!6048 () array!1165)

(assert (=> bm!1095 (= call!1085 (getCurrentListMap!121 (_keys!3130 lt!5925) (ite c!2250 (_values!1698 lt!5925) lt!6048) (mask!4670 lt!5925) (ite c!2250 (ite c!2248 (extraKeys!1612 lt!5925) lt!6059) (extraKeys!1612 lt!5925)) (zeroValue!1636 lt!5925) (ite c!2250 (ite c!2248 (minValue!1636 lt!5925) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (minValue!1636 lt!5925)) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5925)))))

(declare-fun bm!1096 () Bool)

(assert (=> bm!1096 (= call!1108 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1706 lt!5925)))))

(declare-fun b!20503 () Bool)

(assert (=> b!20503 (= e!13376 (not call!1089))))

(declare-fun b!20504 () Bool)

(assert (=> b!20504 (= e!13384 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2313 lt!6056)) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20505 () Bool)

(assert (=> b!20505 (= e!13390 (not call!1103))))

(declare-fun b!20506 () Bool)

(declare-fun e!13396 () ListLongMap!551)

(assert (=> b!20506 (= e!13396 (ite c!2248 call!1087 call!1088))))

(declare-fun bm!1097 () Bool)

(assert (=> bm!1097 (= call!1102 call!1098)))

(declare-fun bm!1098 () Bool)

(declare-fun call!1104 () ListLongMap!551)

(assert (=> bm!1098 (= call!1099 call!1104)))

(declare-fun b!20507 () Bool)

(assert (=> b!20507 (= e!13379 (not call!1103))))

(declare-fun bm!1099 () Bool)

(assert (=> bm!1099 (= call!1104 (+!38 e!13396 (ite c!2250 (ite c!2248 (tuple2!873 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))) (tuple2!873 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))))) (tuple2!873 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938))))))))))

(declare-fun c!2259 () Bool)

(assert (=> bm!1099 (= c!2259 c!2250)))

(declare-fun b!20508 () Bool)

(declare-fun res!13475 () Bool)

(assert (=> b!20508 (=> (not res!13475) (not e!13376))))

(assert (=> b!20508 (= res!13475 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2312 lt!6052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1100 () Bool)

(assert (=> bm!1100 (= call!1095 (map!388 lt!5925))))

(declare-fun b!20509 () Bool)

(declare-fun res!13462 () Bool)

(assert (=> b!20509 (= res!13462 call!1097)))

(assert (=> b!20509 (=> (not res!13462) (not e!13384))))

(declare-fun b!20510 () Bool)

(declare-fun lt!6068 () tuple2!860)

(assert (=> b!20510 (= e!13393 (tuple2!861 (_1!433 lt!6068) (_2!433 lt!6068)))))

(assert (=> b!20510 (= lt!6068 call!1093)))

(declare-fun b!20511 () Bool)

(assert (=> b!20511 (= e!13389 (getCurrentListMap!121 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5925)))))

(declare-fun b!20512 () Bool)

(declare-fun e!13387 () Bool)

(assert (=> b!20512 (= e!13387 (not call!1089))))

(declare-fun b!20513 () Bool)

(assert (=> b!20513 (= e!13386 (= call!1101 call!1095))))

(declare-fun bm!1101 () Bool)

(declare-fun c!2252 () Bool)

(assert (=> bm!1101 (= c!2252 c!2254)))

(assert (=> bm!1101 (= call!1091 (contains!221 e!13389 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!1102 () Bool)

(assert (=> bm!1102 (= call!1094 (seekEntryOrOpen!0 (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3130 lt!5925) (mask!4670 lt!5925)))))

(declare-fun b!20514 () Bool)

(declare-fun Unit!434 () Unit!429)

(assert (=> b!20514 (= e!13381 Unit!434)))

(declare-fun lt!6069 () Unit!429)

(assert (=> b!20514 (= lt!6069 call!1108)))

(assert (=> b!20514 (= lt!6052 call!1086)))

(assert (=> b!20514 (= c!2256 ((_ is MissingZero!48) lt!6052))))

(assert (=> b!20514 e!13383))

(declare-fun lt!6050 () Unit!429)

(assert (=> b!20514 (= lt!6050 lt!6069)))

(assert (=> b!20514 false))

(declare-fun b!20515 () Bool)

(declare-fun res!13470 () Bool)

(assert (=> b!20515 (=> (not res!13470) (not e!13390))))

(assert (=> b!20515 (= res!13470 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2312 lt!6053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20516 () Bool)

(declare-fun lt!6061 () Unit!429)

(declare-fun lt!6067 () Unit!429)

(assert (=> b!20516 (= lt!6061 lt!6067)))

(assert (=> b!20516 (contains!221 call!1085 (select (arr!555 (_keys!3130 lt!5925)) (index!2313 lt!6058)))))

(assert (=> b!20516 (= lt!6067 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3130 lt!5925) lt!6048 (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (index!2313 lt!6058) (defaultEntry!1706 lt!5925)))))

(assert (=> b!20516 (= lt!6048 (array!1166 (store (arr!554 (_values!1698 lt!5925)) (index!2313 lt!6058) (ValueCellFull!290 (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))))) (size!647 (_values!1698 lt!5925))))))

(declare-fun lt!6064 () Unit!429)

(declare-fun lt!6047 () Unit!429)

(assert (=> b!20516 (= lt!6064 lt!6047)))

(assert (=> b!20516 (= call!1104 call!1092)))

(assert (=> b!20516 (= lt!6047 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (index!2313 lt!6058) (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))) (defaultEntry!1706 lt!5925)))))

(declare-fun lt!6057 () Unit!429)

(assert (=> b!20516 (= lt!6057 e!13381)))

(assert (=> b!20516 (= c!2247 call!1091)))

(assert (=> b!20516 (= e!13375 (tuple2!861 true (LongMapFixedSize!167 (defaultEntry!1706 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) (_size!121 lt!5925) (_keys!3130 lt!5925) (array!1166 (store (arr!554 (_values!1698 lt!5925)) (index!2313 lt!6058) (ValueCellFull!290 (ite (or c!2185 c!2186) (zeroValue!1636 (v!1550 (underlying!94 thiss!938))) (minValue!1636 (v!1550 (underlying!94 thiss!938)))))) (size!647 (_values!1698 lt!5925))) (_vacant!121 lt!5925))))))

(declare-fun b!20517 () Bool)

(assert (=> b!20517 (= e!13378 e!13391)))

(assert (=> b!20517 (= c!2248 (= (ite (or c!2185 c!2186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20518 () Bool)

(declare-fun res!13463 () Bool)

(assert (=> b!20518 (= res!13463 (= (select (arr!555 (_keys!3130 lt!5925)) (index!2315 lt!6052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20518 (=> (not res!13463) (not e!13387))))

(declare-fun b!20519 () Bool)

(assert (=> b!20519 (= e!13396 (getCurrentListMap!121 (_keys!3130 lt!5925) (_values!1698 lt!5925) (mask!4670 lt!5925) (extraKeys!1612 lt!5925) (zeroValue!1636 lt!5925) (minValue!1636 lt!5925) #b00000000000000000000000000000000 (defaultEntry!1706 lt!5925)))))

(declare-fun bm!1103 () Bool)

(assert (=> bm!1103 (= call!1101 (map!388 (_2!433 lt!6062)))))

(declare-fun b!20520 () Bool)

(assert (=> b!20520 (= e!13382 e!13387)))

(declare-fun res!13474 () Bool)

(assert (=> b!20520 (= res!13474 call!1107)))

(assert (=> b!20520 (=> (not res!13474) (not e!13387))))

(declare-fun bm!1104 () Bool)

(assert (=> bm!1104 (= call!1100 call!1094)))

(declare-fun bm!1105 () Bool)

(assert (=> bm!1105 (= call!1097 call!1098)))

(assert (= (and d!3655 c!2250) b!20517))

(assert (= (and d!3655 (not c!2250)) b!20494))

(assert (= (and b!20517 c!2248) b!20496))

(assert (= (and b!20517 (not c!2248)) b!20483))

(assert (= (or b!20496 b!20483) bm!1088))

(assert (= (or b!20496 b!20483) bm!1086))

(assert (= (or b!20496 b!20483) bm!1098))

(assert (= (and b!20494 c!2254) b!20484))

(assert (= (and b!20494 (not c!2254)) b!20492))

(assert (= (and b!20484 c!2258) b!20502))

(assert (= (and b!20484 (not c!2258)) b!20482))

(assert (= (and b!20502 res!13469) b!20487))

(assert (= (and b!20487 res!13467) b!20479))

(assert (= (and b!20482 c!2260) b!20497))

(assert (= (and b!20482 (not c!2260)) b!20490))

(assert (= (and b!20497 res!13472) b!20515))

(assert (= (and b!20515 res!13470) b!20505))

(assert (= (and b!20490 c!2253) b!20493))

(assert (= (and b!20490 (not c!2253)) b!20498))

(assert (= (and b!20493 res!13468) b!20499))

(assert (= (and b!20499 res!13464) b!20507))

(assert (= (or b!20497 b!20493) bm!1090))

(assert (= (or b!20505 b!20507) bm!1085))

(assert (= (or b!20487 bm!1090) bm!1097))

(assert (= (or b!20502 b!20482) bm!1104))

(assert (= (and b!20492 c!2251) b!20510))

(assert (= (and b!20492 (not c!2251)) b!20481))

(assert (= (and b!20481 c!2249) b!20500))

(assert (= (and b!20481 (not c!2249)) b!20516))

(assert (= (and b!20516 c!2247) b!20480))

(assert (= (and b!20516 (not c!2247)) b!20514))

(assert (= (and b!20480 res!13466) b!20509))

(assert (= (and b!20509 res!13462) b!20504))

(assert (= (and b!20514 c!2256) b!20485))

(assert (= (and b!20514 (not c!2256)) b!20491))

(assert (= (and b!20485 res!13465) b!20508))

(assert (= (and b!20508 res!13475) b!20503))

(assert (= (and b!20491 c!2257) b!20520))

(assert (= (and b!20491 (not c!2257)) b!20501))

(assert (= (and b!20520 res!13474) b!20518))

(assert (= (and b!20518 res!13463) b!20512))

(assert (= (or b!20485 b!20520) bm!1087))

(assert (= (or b!20503 b!20512) bm!1093))

(assert (= (or b!20509 bm!1087) bm!1105))

(assert (= (or b!20480 b!20514) bm!1091))

(assert (= (or b!20510 b!20500) bm!1092))

(assert (= (or bm!1097 bm!1105) bm!1089))

(assert (= (or b!20482 b!20514) bm!1096))

(assert (= (or b!20484 b!20516) bm!1094))

(assert (= (or b!20502 b!20480) bm!1083))

(assert (= (or bm!1104 bm!1091) bm!1102))

(assert (= (or bm!1085 bm!1093) bm!1084))

(assert (= (or b!20484 b!20516) bm!1101))

(assert (= (and bm!1101 c!2252) b!20488))

(assert (= (and bm!1101 (not c!2252)) b!20511))

(assert (= (or bm!1086 bm!1094) bm!1082))

(assert (= (or bm!1088 b!20516) bm!1095))

(assert (= (or bm!1098 b!20516) bm!1099))

(assert (= (and bm!1099 c!2259) b!20506))

(assert (= (and bm!1099 (not c!2259)) b!20519))

(assert (= (and d!3655 res!13471) b!20495))

(assert (= (and b!20495 c!2255) b!20486))

(assert (= (and b!20495 (not c!2255)) b!20513))

(assert (= (and b!20486 res!13473) b!20489))

(assert (= (or b!20489 b!20513) bm!1100))

(assert (= (or b!20486 b!20489 b!20513) bm!1103))

(declare-fun m!14293 () Bool)

(assert (=> b!20511 m!14293))

(declare-fun m!14295 () Bool)

(assert (=> bm!1083 m!14295))

(declare-fun m!14297 () Bool)

(assert (=> bm!1096 m!14297))

(declare-fun m!14299 () Bool)

(assert (=> bm!1084 m!14299))

(declare-fun m!14301 () Bool)

(assert (=> bm!1095 m!14301))

(declare-fun m!14303 () Bool)

(assert (=> b!20494 m!14303))

(declare-fun m!14305 () Bool)

(assert (=> bm!1101 m!14305))

(declare-fun m!14307 () Bool)

(assert (=> b!20486 m!14307))

(declare-fun m!14309 () Bool)

(assert (=> b!20516 m!14309))

(declare-fun m!14311 () Bool)

(assert (=> b!20516 m!14311))

(declare-fun m!14313 () Bool)

(assert (=> b!20516 m!14313))

(declare-fun m!14315 () Bool)

(assert (=> b!20516 m!14315))

(assert (=> b!20516 m!14309))

(declare-fun m!14317 () Bool)

(assert (=> b!20516 m!14317))

(assert (=> b!20519 m!14293))

(declare-fun m!14319 () Bool)

(assert (=> b!20483 m!14319))

(declare-fun m!14321 () Bool)

(assert (=> b!20518 m!14321))

(declare-fun m!14323 () Bool)

(assert (=> bm!1092 m!14323))

(declare-fun m!14325 () Bool)

(assert (=> b!20499 m!14325))

(assert (=> bm!1102 m!14303))

(declare-fun m!14327 () Bool)

(assert (=> b!20508 m!14327))

(declare-fun m!14329 () Bool)

(assert (=> bm!1100 m!14329))

(assert (=> bm!1082 m!14311))

(declare-fun m!14331 () Bool)

(assert (=> bm!1082 m!14331))

(declare-fun m!14333 () Bool)

(assert (=> bm!1089 m!14333))

(declare-fun m!14335 () Bool)

(assert (=> b!20515 m!14335))

(declare-fun m!14337 () Bool)

(assert (=> b!20496 m!14337))

(declare-fun m!14339 () Bool)

(assert (=> bm!1099 m!14339))

(declare-fun m!14341 () Bool)

(assert (=> b!20479 m!14341))

(declare-fun m!14343 () Bool)

(assert (=> b!20489 m!14343))

(declare-fun m!14345 () Bool)

(assert (=> b!20504 m!14345))

(declare-fun m!14347 () Bool)

(assert (=> d!3655 m!14347))

(declare-fun m!14349 () Bool)

(assert (=> d!3655 m!14349))

(declare-fun m!14351 () Bool)

(assert (=> bm!1103 m!14351))

(assert (=> bm!997 d!3655))

(declare-fun d!3657 () Bool)

(assert (=> d!3657 (= (valid!95 thiss!938) (valid!98 (v!1550 (underlying!94 thiss!938))))))

(declare-fun bs!895 () Bool)

(assert (= bs!895 d!3657))

(declare-fun m!14353 () Bool)

(assert (=> bs!895 m!14353))

(assert (=> start!3294 d!3657))

(declare-fun b!20533 () Bool)

(declare-fun e!13403 () Unit!429)

(declare-fun Unit!435 () Unit!429)

(assert (=> b!20533 (= e!13403 Unit!435)))

(declare-fun b!20534 () Bool)

(declare-fun e!13405 () Bool)

(declare-fun lt!6140 () tuple2!872)

(declare-fun lt!6129 () (_ BitVec 32))

(assert (=> b!20534 (= e!13405 (ite (= (_1!439 lt!6140) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6129 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6129 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3659 () Bool)

(declare-fun e!13404 () Bool)

(assert (=> d!3659 e!13404))

(declare-fun res!13481 () Bool)

(assert (=> d!3659 (=> (not res!13481) (not e!13404))))

(declare-fun lt!6121 () LongMapFixedSize!166)

(assert (=> d!3659 (= res!13481 (valid!98 lt!6121))))

(declare-fun lt!6135 () LongMapFixedSize!166)

(assert (=> d!3659 (= lt!6121 lt!6135)))

(declare-fun lt!6141 () Unit!429)

(assert (=> d!3659 (= lt!6141 e!13403)))

(declare-fun c!2266 () Bool)

(assert (=> d!3659 (= c!2266 (not (= (map!388 lt!6135) (ListLongMap!552 Nil!549))))))

(declare-fun lt!6136 () Unit!429)

(declare-fun lt!6119 () Unit!429)

(assert (=> d!3659 (= lt!6136 lt!6119)))

(declare-fun lt!6131 () array!1167)

(declare-fun lt!6139 () (_ BitVec 32))

(declare-datatypes ((List!553 0))(
  ( (Nil!550) (Cons!549 (h!1115 (_ BitVec 64)) (t!3200 List!553)) )
))
(declare-fun lt!6122 () List!553)

(declare-fun arrayNoDuplicates!0 (array!1167 (_ BitVec 32) List!553) Bool)

(assert (=> d!3659 (arrayNoDuplicates!0 lt!6131 lt!6139 lt!6122)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1167 (_ BitVec 32) (_ BitVec 32) List!553) Unit!429)

(assert (=> d!3659 (= lt!6119 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6131 lt!6139 (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001) lt!6122))))

(assert (=> d!3659 (= lt!6122 Nil!550)))

(assert (=> d!3659 (= lt!6139 #b00000000000000000000000000000000)))

(assert (=> d!3659 (= lt!6131 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6125 () Unit!429)

(declare-fun lt!6127 () Unit!429)

(assert (=> d!3659 (= lt!6125 lt!6127)))

(declare-fun lt!6120 () (_ BitVec 32))

(declare-fun lt!6133 () array!1167)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1167 (_ BitVec 32)) Bool)

(assert (=> d!3659 (arrayForallSeekEntryOrOpenFound!0 lt!6120 lt!6133 (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1167 (_ BitVec 32) (_ BitVec 32)) Unit!429)

(assert (=> d!3659 (= lt!6127 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6133 (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) lt!6120))))

(assert (=> d!3659 (= lt!6120 #b00000000000000000000000000000000)))

(assert (=> d!3659 (= lt!6133 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6134 () Unit!429)

(declare-fun lt!6123 () Unit!429)

(assert (=> d!3659 (= lt!6134 lt!6123)))

(declare-fun lt!6126 () array!1167)

(declare-fun lt!6137 () (_ BitVec 32))

(declare-fun lt!6130 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1167 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3659 (= (arrayCountValidKeys!0 lt!6126 lt!6137 lt!6130) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1167 (_ BitVec 32) (_ BitVec 32)) Unit!429)

(assert (=> d!3659 (= lt!6123 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6126 lt!6137 lt!6130))))

(assert (=> d!3659 (= lt!6130 (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3659 (= lt!6137 #b00000000000000000000000000000000)))

(assert (=> d!3659 (= lt!6126 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!134 (Int (_ BitVec 64)) V!1131)

(assert (=> d!3659 (= lt!6135 (LongMapFixedSize!167 (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!134 (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (array!1166 ((as const (Array (_ BitVec 32) ValueCell!290)) EmptyCell!290) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3659 (validMask!0 (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))))))

(assert (=> d!3659 (= (getNewLongMapFixedSize!23 (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) (defaultEntry!1706 (v!1550 (underlying!94 thiss!938)))) lt!6121)))

(declare-fun b!20535 () Bool)

(declare-fun lt!6132 () array!1167)

(assert (=> b!20535 (= e!13405 (arrayContainsKey!0 lt!6132 (_1!439 lt!6140) #b00000000000000000000000000000000))))

(declare-fun b!20536 () Bool)

(declare-fun Unit!436 () Unit!429)

(assert (=> b!20536 (= e!13403 Unit!436)))

(declare-fun head!822 (List!552) tuple2!872)

(assert (=> b!20536 (= lt!6140 (head!822 (toList!291 (map!388 lt!6135))))))

(assert (=> b!20536 (= lt!6132 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!20536 (= lt!6129 #b00000000000000000000000000000000)))

(declare-fun lt!6124 () Unit!429)

(declare-fun lemmaKeyInListMapIsInArray!91 (array!1167 array!1165 (_ BitVec 32) (_ BitVec 32) V!1131 V!1131 (_ BitVec 64) Int) Unit!429)

(assert (=> b!20536 (= lt!6124 (lemmaKeyInListMapIsInArray!91 lt!6132 (array!1166 ((as const (Array (_ BitVec 32) ValueCell!290)) EmptyCell!290) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) lt!6129 (dynLambda!134 (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!439 lt!6140) (defaultEntry!1706 (v!1550 (underlying!94 thiss!938)))))))

(declare-fun c!2265 () Bool)

(assert (=> b!20536 (= c!2265 (and (not (= (_1!439 lt!6140) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!439 lt!6140) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20536 e!13405))

(declare-fun lt!6138 () Unit!429)

(assert (=> b!20536 (= lt!6138 lt!6124)))

(declare-fun lt!6128 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1167 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20536 (= lt!6128 (arrayScanForKey!0 (array!1168 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) #b00000000000000000000000000000001)) (_1!439 lt!6140) #b00000000000000000000000000000000))))

(assert (=> b!20536 false))

(declare-fun b!20537 () Bool)

(declare-fun res!13480 () Bool)

(assert (=> b!20537 (=> (not res!13480) (not e!13404))))

(assert (=> b!20537 (= res!13480 (= (mask!4670 lt!6121) (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938))))))))

(declare-fun b!20538 () Bool)

(assert (=> b!20538 (= e!13404 (= (map!388 lt!6121) (ListLongMap!552 Nil!549)))))

(assert (= (and d!3659 c!2266) b!20536))

(assert (= (and d!3659 (not c!2266)) b!20533))

(assert (= (and b!20536 c!2265) b!20535))

(assert (= (and b!20536 (not c!2265)) b!20534))

(assert (= (and d!3659 res!13481) b!20537))

(assert (= (and b!20537 res!13480) b!20538))

(declare-fun b_lambda!1485 () Bool)

(assert (=> (not b_lambda!1485) (not d!3659)))

(declare-fun t!3198 () Bool)

(declare-fun tb!633 () Bool)

(assert (=> (and b!20250 (= (defaultEntry!1706 (v!1550 (underlying!94 thiss!938))) (defaultEntry!1706 (v!1550 (underlying!94 thiss!938)))) t!3198) tb!633))

(declare-fun result!1045 () Bool)

(assert (=> tb!633 (= result!1045 tp_is_empty!979)))

(assert (=> d!3659 t!3198))

(declare-fun b_and!1391 () Bool)

(assert (= b_and!1385 (and (=> t!3198 result!1045) b_and!1391)))

(declare-fun b_lambda!1487 () Bool)

(assert (=> (not b_lambda!1487) (not b!20536)))

(assert (=> b!20536 t!3198))

(declare-fun b_and!1393 () Bool)

(assert (= b_and!1391 (and (=> t!3198 result!1045) b_and!1393)))

(declare-fun m!14355 () Bool)

(assert (=> d!3659 m!14355))

(assert (=> d!3659 m!14189))

(declare-fun m!14357 () Bool)

(assert (=> d!3659 m!14357))

(assert (=> d!3659 m!14189))

(declare-fun m!14359 () Bool)

(assert (=> d!3659 m!14359))

(assert (=> d!3659 m!14189))

(declare-fun m!14361 () Bool)

(assert (=> d!3659 m!14361))

(declare-fun m!14363 () Bool)

(assert (=> d!3659 m!14363))

(declare-fun m!14365 () Bool)

(assert (=> d!3659 m!14365))

(declare-fun m!14367 () Bool)

(assert (=> d!3659 m!14367))

(declare-fun m!14369 () Bool)

(assert (=> d!3659 m!14369))

(declare-fun m!14371 () Bool)

(assert (=> d!3659 m!14371))

(declare-fun m!14373 () Bool)

(assert (=> d!3659 m!14373))

(declare-fun m!14375 () Bool)

(assert (=> b!20535 m!14375))

(assert (=> b!20536 m!14355))

(assert (=> b!20536 m!14189))

(assert (=> b!20536 m!14363))

(assert (=> b!20536 m!14363))

(declare-fun m!14377 () Bool)

(assert (=> b!20536 m!14377))

(declare-fun m!14379 () Bool)

(assert (=> b!20536 m!14379))

(assert (=> b!20536 m!14363))

(declare-fun m!14381 () Bool)

(assert (=> b!20536 m!14381))

(declare-fun m!14383 () Bool)

(assert (=> b!20538 m!14383))

(assert (=> b!20262 d!3659))

(declare-fun d!3661 () Bool)

(declare-fun e!13410 () Bool)

(assert (=> d!3661 e!13410))

(declare-fun res!13484 () Bool)

(assert (=> d!3661 (=> (not res!13484) (not e!13410))))

(declare-fun lt!6147 () (_ BitVec 32))

(assert (=> d!3661 (= res!13484 (validMask!0 lt!6147))))

(declare-datatypes ((tuple2!874 0))(
  ( (tuple2!875 (_1!440 Unit!429) (_2!440 (_ BitVec 32))) )
))
(declare-fun e!13411 () tuple2!874)

(assert (=> d!3661 (= lt!6147 (_2!440 e!13411))))

(declare-fun c!2269 () Bool)

(declare-fun lt!6146 () tuple2!874)

(assert (=> d!3661 (= c!2269 (and (bvsgt (_2!440 lt!6146) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!121 (v!1550 (underlying!94 thiss!938)))) (_2!440 lt!6146)) (bvsge (bvadd (bvand (bvashr (_2!440 lt!6146) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!121 (v!1550 (underlying!94 thiss!938))))))))

(declare-fun Unit!437 () Unit!429)

(declare-fun Unit!438 () Unit!429)

(assert (=> d!3661 (= lt!6146 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!121 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))))) (mask!4670 (v!1550 (underlying!94 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!121 (v!1550 (underlying!94 thiss!938)))) (mask!4670 (v!1550 (underlying!94 thiss!938))))) (tuple2!875 Unit!437 (bvand (bvadd (bvshl (mask!4670 (v!1550 (underlying!94 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!875 Unit!438 (mask!4670 (v!1550 (underlying!94 thiss!938))))))))

(assert (=> d!3661 (validMask!0 (mask!4670 (v!1550 (underlying!94 thiss!938))))))

(assert (=> d!3661 (= (computeNewMask!18 thiss!938 (mask!4670 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (_size!121 (v!1550 (underlying!94 thiss!938)))) lt!6147)))

(declare-fun b!20547 () Bool)

(declare-fun computeNewMaskWhile!8 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!874)

(assert (=> b!20547 (= e!13411 (computeNewMaskWhile!8 (_size!121 (v!1550 (underlying!94 thiss!938))) (_vacant!121 (v!1550 (underlying!94 thiss!938))) (mask!4670 (v!1550 (underlying!94 thiss!938))) (_2!440 lt!6146)))))

(declare-fun b!20548 () Bool)

(declare-fun Unit!439 () Unit!429)

(assert (=> b!20548 (= e!13411 (tuple2!875 Unit!439 (_2!440 lt!6146)))))

(declare-fun b!20549 () Bool)

(assert (=> b!20549 (= e!13410 (bvsle (_size!121 (v!1550 (underlying!94 thiss!938))) (bvadd lt!6147 #b00000000000000000000000000000001)))))

(assert (= (and d!3661 c!2269) b!20547))

(assert (= (and d!3661 (not c!2269)) b!20548))

(assert (= (and d!3661 res!13484) b!20549))

(declare-fun m!14385 () Bool)

(assert (=> d!3661 m!14385))

(assert (=> d!3661 m!14183))

(declare-fun m!14387 () Bool)

(assert (=> b!20547 m!14387))

(assert (=> b!20262 d!3661))

(declare-fun mapIsEmpty!949 () Bool)

(declare-fun mapRes!949 () Bool)

(assert (=> mapIsEmpty!949 mapRes!949))

(declare-fun b!20557 () Bool)

(declare-fun e!13417 () Bool)

(assert (=> b!20557 (= e!13417 tp_is_empty!979)))

(declare-fun b!20556 () Bool)

(declare-fun e!13416 () Bool)

(assert (=> b!20556 (= e!13416 tp_is_empty!979)))

(declare-fun mapNonEmpty!949 () Bool)

(declare-fun tp!3388 () Bool)

(assert (=> mapNonEmpty!949 (= mapRes!949 (and tp!3388 e!13416))))

(declare-fun mapRest!949 () (Array (_ BitVec 32) ValueCell!290))

(declare-fun mapValue!949 () ValueCell!290)

(declare-fun mapKey!949 () (_ BitVec 32))

(assert (=> mapNonEmpty!949 (= mapRest!940 (store mapRest!949 mapKey!949 mapValue!949))))

(declare-fun condMapEmpty!949 () Bool)

(declare-fun mapDefault!949 () ValueCell!290)

(assert (=> mapNonEmpty!940 (= condMapEmpty!949 (= mapRest!940 ((as const (Array (_ BitVec 32) ValueCell!290)) mapDefault!949)))))

(assert (=> mapNonEmpty!940 (= tp!3373 (and e!13417 mapRes!949))))

(assert (= (and mapNonEmpty!940 condMapEmpty!949) mapIsEmpty!949))

(assert (= (and mapNonEmpty!940 (not condMapEmpty!949)) mapNonEmpty!949))

(assert (= (and mapNonEmpty!949 ((_ is ValueCellFull!290) mapValue!949)) b!20556))

(assert (= (and mapNonEmpty!940 ((_ is ValueCellFull!290) mapDefault!949)) b!20557))

(declare-fun m!14389 () Bool)

(assert (=> mapNonEmpty!949 m!14389))

(declare-fun b_lambda!1489 () Bool)

(assert (= b_lambda!1487 (or (and b!20250 b_free!715) b_lambda!1489)))

(declare-fun b_lambda!1491 () Bool)

(assert (= b_lambda!1485 (or (and b!20250 b_free!715) b_lambda!1491)))

(check-sat (not bm!1076) (not b!20535) (not bm!1095) (not bm!1100) (not d!3647) (not bm!1077) (not b!20536) (not bm!1101) (not bm!1058) (not b!20447) (not bm!1065) (not d!3657) (not bm!1068) (not bm!1060) (not bm!1092) (not b!20441) (not d!3655) (not b!20483) (not bm!1078) (not b!20519) (not b!20454) (not b!20469) (not b!20452) (not b!20474) (not b!20511) (not b!20489) (not bm!1102) (not bm!1103) (not bm!1079) tp_is_empty!979 (not b_lambda!1491) (not d!3659) (not bm!1084) (not bm!1083) (not bm!1082) (not mapNonEmpty!949) (not b!20444) (not b!20547) (not b!20477) (not b!20494) (not b_lambda!1489) b_and!1393 (not b_next!715) (not b!20516) (not b!20496) (not bm!1071) (not d!3661) (not bm!1089) (not bm!1096) (not bm!1075) (not b!20538) (not bm!1072) (not bm!1099) (not bm!1059) (not b!20486))
(check-sat b_and!1393 (not b_next!715))
