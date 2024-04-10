; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3300 () Bool)

(assert start!3300)

(declare-fun b!20329 () Bool)

(declare-fun b_free!717 () Bool)

(declare-fun b_next!717 () Bool)

(assert (=> b!20329 (= b_free!717 (not b_next!717))))

(declare-fun tp!3379 () Bool)

(declare-fun b_and!1393 () Bool)

(assert (=> b!20329 (= tp!3379 b_and!1393)))

(declare-fun b!20323 () Bool)

(declare-datatypes ((V!1133 0))(
  ( (V!1134 (val!517 Int)) )
))
(declare-datatypes ((array!1187 0))(
  ( (array!1188 (arr!565 (Array (_ BitVec 32) (_ BitVec 64))) (size!658 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!291 0))(
  ( (ValueCellFull!291 (v!1551 V!1133)) (EmptyCell!291) )
))
(declare-datatypes ((array!1189 0))(
  ( (array!1190 (arr!566 (Array (_ BitVec 32) ValueCell!291)) (size!659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!168 0))(
  ( (LongMapFixedSize!169 (defaultEntry!1707 Int) (mask!4671 (_ BitVec 32)) (extraKeys!1613 (_ BitVec 32)) (zeroValue!1637 V!1133) (minValue!1637 V!1133) (_size!122 (_ BitVec 32)) (_keys!3131 array!1187) (_values!1699 array!1189) (_vacant!122 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!168 0))(
  ( (Cell!169 (v!1552 LongMapFixedSize!168)) )
))
(declare-datatypes ((tuple2!854 0))(
  ( (tuple2!855 (_1!430 Bool) (_2!430 Cell!168)) )
))
(declare-fun e!13297 () tuple2!854)

(declare-datatypes ((tuple2!856 0))(
  ( (tuple2!857 (_1!431 Bool) (_2!431 LongMapFixedSize!168)) )
))
(declare-fun lt!5944 () tuple2!856)

(assert (=> b!20323 (= e!13297 (tuple2!855 (_1!431 lt!5944) (Cell!169 (_2!431 lt!5944))))))

(declare-fun call!1005 () tuple2!856)

(assert (=> b!20323 (= lt!5944 call!1005)))

(declare-fun b!20324 () Bool)

(declare-fun e!13289 () Bool)

(declare-fun e!13295 () Bool)

(assert (=> b!20324 (= e!13289 e!13295)))

(declare-fun b!20325 () Bool)

(declare-fun e!13296 () Bool)

(declare-fun e!13294 () Bool)

(declare-fun mapRes!943 () Bool)

(assert (=> b!20325 (= e!13296 (and e!13294 mapRes!943))))

(declare-fun condMapEmpty!943 () Bool)

(declare-datatypes ((LongMap!168 0))(
  ( (LongMap!169 (underlying!95 Cell!168)) )
))
(declare-fun thiss!938 () LongMap!168)

(declare-fun mapDefault!943 () ValueCell!291)

(assert (=> b!20325 (= condMapEmpty!943 (= (arr!566 (_values!1699 (v!1552 (underlying!95 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!291)) mapDefault!943)))))

(declare-fun b!20326 () Bool)

(declare-fun e!13290 () Bool)

(assert (=> b!20326 (= e!13290 (and (= (size!658 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4671 (v!1552 (underlying!95 thiss!938))))) (bvsge (bvsub (size!658 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub (size!658 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001) (size!658 (_keys!3131 (v!1552 (underlying!95 thiss!938)))))))))

(declare-fun mapIsEmpty!943 () Bool)

(assert (=> mapIsEmpty!943 mapRes!943))

(declare-fun b!20327 () Bool)

(declare-fun lt!5946 () tuple2!856)

(assert (=> b!20327 (= lt!5946 call!1005)))

(declare-fun e!13293 () tuple2!854)

(assert (=> b!20327 (= e!13293 (tuple2!855 (_1!431 lt!5946) (Cell!169 (_2!431 lt!5946))))))

(declare-fun mapNonEmpty!943 () Bool)

(declare-fun tp!3378 () Bool)

(declare-fun e!13287 () Bool)

(assert (=> mapNonEmpty!943 (= mapRes!943 (and tp!3378 e!13287))))

(declare-fun mapKey!943 () (_ BitVec 32))

(declare-fun mapValue!943 () ValueCell!291)

(declare-fun mapRest!943 () (Array (_ BitVec 32) ValueCell!291))

(assert (=> mapNonEmpty!943 (= (arr!566 (_values!1699 (v!1552 (underlying!95 thiss!938)))) (store mapRest!943 mapKey!943 mapValue!943))))

(declare-fun b!20328 () Bool)

(declare-fun e!13291 () tuple2!854)

(assert (=> b!20328 (= e!13291 e!13293)))

(declare-fun c!2199 () Bool)

(declare-fun lt!5942 () Bool)

(assert (=> b!20328 (= c!2199 (and (not lt!5942) (= (bvand (extraKeys!1613 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!981 () Bool)

(declare-fun array_inv!383 (array!1187) Bool)

(declare-fun array_inv!384 (array!1189) Bool)

(assert (=> b!20329 (= e!13295 (and tp!3379 tp_is_empty!981 (array_inv!383 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) (array_inv!384 (_values!1699 (v!1552 (underlying!95 thiss!938)))) e!13296))))

(declare-fun b!20330 () Bool)

(declare-fun c!2198 () Bool)

(assert (=> b!20330 (= c!2198 (and (not (= (bvand (extraKeys!1613 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5942))))

(assert (=> b!20330 (= e!13293 e!13297)))

(declare-fun b!20331 () Bool)

(declare-fun e!13292 () Bool)

(assert (=> b!20331 (= e!13292 e!13289)))

(declare-fun b!20332 () Bool)

(assert (=> b!20332 (= e!13294 tp_is_empty!981)))

(declare-fun res!13431 () Bool)

(declare-fun e!13298 () Bool)

(assert (=> start!3300 (=> (not res!13431) (not e!13298))))

(declare-fun valid!82 (LongMap!168) Bool)

(assert (=> start!3300 (= res!13431 (valid!82 thiss!938))))

(assert (=> start!3300 e!13298))

(assert (=> start!3300 e!13292))

(declare-fun bm!1002 () Bool)

(declare-fun lt!5941 () LongMapFixedSize!168)

(declare-fun call!1006 () tuple2!856)

(declare-fun c!2197 () Bool)

(declare-fun update!18 (LongMapFixedSize!168 (_ BitVec 64) V!1133) tuple2!856)

(assert (=> bm!1002 (= call!1006 (update!18 lt!5941 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))))))

(declare-fun bm!1003 () Bool)

(assert (=> bm!1003 (= call!1005 call!1006)))

(declare-fun b!20333 () Bool)

(assert (=> b!20333 (= e!13298 e!13290)))

(declare-fun res!13432 () Bool)

(assert (=> b!20333 (=> (not res!13432) (not e!13290))))

(assert (=> b!20333 (= res!13432 (_1!430 e!13291))))

(assert (=> b!20333 (= c!2197 (and (not lt!5942) (not (= (bvand (extraKeys!1613 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20333 (= lt!5942 (= (bvand (extraKeys!1613 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!22 ((_ BitVec 32) Int) LongMapFixedSize!168)

(declare-fun computeNewMask!18 (LongMap!168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20333 (= lt!5941 (getNewLongMapFixedSize!22 (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) (defaultEntry!1707 (v!1552 (underlying!95 thiss!938)))))))

(declare-fun b!20334 () Bool)

(declare-fun lt!5945 () tuple2!856)

(declare-fun lt!5943 () tuple2!856)

(assert (=> b!20334 (= e!13291 (tuple2!855 (and (_1!431 lt!5945) (_1!431 lt!5943)) (Cell!169 (_2!431 lt!5943))))))

(assert (=> b!20334 (= lt!5945 call!1006)))

(assert (=> b!20334 (= lt!5943 (update!18 (_2!431 lt!5945) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938)))))))

(declare-fun b!20335 () Bool)

(assert (=> b!20335 (= e!13297 (tuple2!855 true (Cell!169 lt!5941)))))

(declare-fun b!20336 () Bool)

(declare-fun res!13430 () Bool)

(assert (=> b!20336 (=> (not res!13430) (not e!13290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20336 (= res!13430 (validMask!0 (mask!4671 (v!1552 (underlying!95 thiss!938)))))))

(declare-fun b!20337 () Bool)

(assert (=> b!20337 (= e!13287 tp_is_empty!981)))

(assert (= (and start!3300 res!13431) b!20333))

(assert (= (and b!20333 c!2197) b!20334))

(assert (= (and b!20333 (not c!2197)) b!20328))

(assert (= (and b!20328 c!2199) b!20327))

(assert (= (and b!20328 (not c!2199)) b!20330))

(assert (= (and b!20330 c!2198) b!20323))

(assert (= (and b!20330 (not c!2198)) b!20335))

(assert (= (or b!20327 b!20323) bm!1003))

(assert (= (or b!20334 bm!1003) bm!1002))

(assert (= (and b!20333 res!13432) b!20336))

(assert (= (and b!20336 res!13430) b!20326))

(assert (= (and b!20325 condMapEmpty!943) mapIsEmpty!943))

(assert (= (and b!20325 (not condMapEmpty!943)) mapNonEmpty!943))

(get-info :version)

(assert (= (and mapNonEmpty!943 ((_ is ValueCellFull!291) mapValue!943)) b!20337))

(assert (= (and b!20325 ((_ is ValueCellFull!291) mapDefault!943)) b!20332))

(assert (= b!20329 b!20325))

(assert (= b!20324 b!20329))

(assert (= b!20331 b!20324))

(assert (= start!3300 b!20331))

(declare-fun m!14245 () Bool)

(assert (=> b!20329 m!14245))

(declare-fun m!14247 () Bool)

(assert (=> b!20329 m!14247))

(declare-fun m!14249 () Bool)

(assert (=> b!20336 m!14249))

(declare-fun m!14251 () Bool)

(assert (=> start!3300 m!14251))

(declare-fun m!14253 () Bool)

(assert (=> mapNonEmpty!943 m!14253))

(declare-fun m!14255 () Bool)

(assert (=> bm!1002 m!14255))

(declare-fun m!14257 () Bool)

(assert (=> b!20333 m!14257))

(assert (=> b!20333 m!14257))

(declare-fun m!14259 () Bool)

(assert (=> b!20333 m!14259))

(declare-fun m!14261 () Bool)

(assert (=> b!20334 m!14261))

(check-sat (not bm!1002) (not b!20329) b_and!1393 (not mapNonEmpty!943) (not b!20336) (not b!20333) tp_is_empty!981 (not b_next!717) (not start!3300) (not b!20334))
(check-sat b_and!1393 (not b_next!717))
(get-model)

(declare-fun b!20463 () Bool)

(declare-fun e!13392 () Bool)

(declare-fun e!13382 () Bool)

(assert (=> b!20463 (= e!13392 e!13382)))

(declare-fun res!13477 () Bool)

(declare-datatypes ((tuple2!858 0))(
  ( (tuple2!859 (_1!432 (_ BitVec 64)) (_2!432 V!1133)) )
))
(declare-datatypes ((List!555 0))(
  ( (Nil!552) (Cons!551 (h!1117 tuple2!858) (t!3208 List!555)) )
))
(declare-datatypes ((ListLongMap!553 0))(
  ( (ListLongMap!554 (toList!292 List!555)) )
))
(declare-fun call!1065 () ListLongMap!553)

(declare-fun contains!222 (ListLongMap!553 (_ BitVec 64)) Bool)

(assert (=> b!20463 (= res!13477 (contains!222 call!1065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20463 (=> (not res!13477) (not e!13382))))

(declare-fun bm!1058 () Bool)

(declare-datatypes ((Unit!419 0))(
  ( (Unit!420) )
))
(declare-fun call!1074 () Unit!419)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 64) Int) Unit!419)

(assert (=> bm!1058 (= call!1074 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun bm!1059 () Bool)

(declare-datatypes ((SeekEntryResult!48 0))(
  ( (MissingZero!48 (index!2312 (_ BitVec 32))) (Found!48 (index!2313 (_ BitVec 32))) (Intermediate!48 (undefined!860 Bool) (index!2314 (_ BitVec 32)) (x!4959 (_ BitVec 32))) (Undefined!48) (MissingVacant!48 (index!2315 (_ BitVec 32))) )
))
(declare-fun call!1075 () SeekEntryResult!48)

(declare-fun call!1064 () SeekEntryResult!48)

(assert (=> bm!1059 (= call!1075 call!1064)))

(declare-fun b!20464 () Bool)

(declare-fun lt!6021 () Unit!419)

(declare-fun e!13387 () Unit!419)

(assert (=> b!20464 (= lt!6021 e!13387)))

(declare-fun c!2236 () Bool)

(declare-fun call!1082 () Bool)

(assert (=> b!20464 (= c!2236 call!1082)))

(declare-fun e!13378 () tuple2!856)

(assert (=> b!20464 (= e!13378 (tuple2!857 false (_2!431 lt!5945)))))

(declare-fun bm!1060 () Bool)

(declare-fun call!1068 () Unit!419)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 64) Int) Unit!419)

(assert (=> bm!1060 (= call!1068 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) #b1000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun bm!1061 () Bool)

(declare-fun call!1066 () ListLongMap!553)

(declare-fun call!1069 () ListLongMap!553)

(assert (=> bm!1061 (= call!1066 call!1069)))

(declare-fun b!20465 () Bool)

(declare-fun res!13481 () Bool)

(declare-fun e!13394 () Bool)

(assert (=> b!20465 (=> (not res!13481) (not e!13394))))

(declare-fun lt!6045 () SeekEntryResult!48)

(assert (=> b!20465 (= res!13481 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2312 lt!6045)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20467 () Bool)

(declare-fun e!13385 () tuple2!856)

(declare-fun e!13389 () tuple2!856)

(assert (=> b!20467 (= e!13385 e!13389)))

(declare-fun c!2245 () Bool)

(assert (=> b!20467 (= c!2245 (= #b1000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20468 () Bool)

(declare-fun e!13396 () ListLongMap!553)

(assert (=> b!20468 (= e!13396 call!1069)))

(declare-fun b!20469 () Bool)

(declare-fun e!13380 () Bool)

(declare-fun e!13395 () Bool)

(assert (=> b!20469 (= e!13380 e!13395)))

(declare-fun res!13480 () Bool)

(declare-fun call!1079 () Bool)

(assert (=> b!20469 (= res!13480 call!1079)))

(assert (=> b!20469 (=> (not res!13480) (not e!13395))))

(declare-fun bm!1062 () Bool)

(declare-fun c!2240 () Bool)

(declare-fun c!2242 () Bool)

(assert (=> bm!1062 (= c!2240 c!2242)))

(assert (=> bm!1062 (= call!1082 (contains!222 e!13396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20470 () Bool)

(declare-fun res!13471 () Bool)

(declare-fun e!13383 () Bool)

(assert (=> b!20470 (=> (not res!13471) (not e!13383))))

(declare-fun call!1076 () Bool)

(assert (=> b!20470 (= res!13471 call!1076)))

(declare-fun e!13391 () Bool)

(assert (=> b!20470 (= e!13391 e!13383)))

(declare-fun b!20471 () Bool)

(declare-fun res!13472 () Bool)

(declare-fun lt!6027 () SeekEntryResult!48)

(assert (=> b!20471 (= res!13472 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2315 lt!6027)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13386 () Bool)

(assert (=> b!20471 (=> (not res!13472) (not e!13386))))

(declare-fun b!20472 () Bool)

(declare-fun c!2235 () Bool)

(assert (=> b!20472 (= c!2235 ((_ is MissingVacant!48) lt!6045))))

(declare-fun e!13393 () Bool)

(assert (=> b!20472 (= e!13393 e!13380)))

(declare-fun b!20473 () Bool)

(declare-fun e!13390 () Bool)

(declare-fun lt!6033 () SeekEntryResult!48)

(assert (=> b!20473 (= e!13390 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2313 lt!6033)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20474 () Bool)

(declare-fun Unit!421 () Unit!419)

(assert (=> b!20474 (= e!13387 Unit!421)))

(declare-fun lt!6034 () Unit!419)

(assert (=> b!20474 (= lt!6034 call!1074)))

(assert (=> b!20474 (= lt!6033 call!1075)))

(declare-fun res!13475 () Bool)

(assert (=> b!20474 (= res!13475 ((_ is Found!48) lt!6033))))

(assert (=> b!20474 (=> (not res!13475) (not e!13390))))

(assert (=> b!20474 e!13390))

(declare-fun lt!6019 () Unit!419)

(assert (=> b!20474 (= lt!6019 lt!6034)))

(assert (=> b!20474 false))

(declare-fun c!2243 () Bool)

(declare-fun c!2237 () Bool)

(declare-fun call!1083 () Bool)

(declare-fun bm!1063 () Bool)

(declare-fun c!2239 () Bool)

(declare-fun lt!6038 () SeekEntryResult!48)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1063 (= call!1083 (inRange!0 (ite c!2242 (ite c!2236 (index!2313 lt!6033) (ite c!2239 (index!2312 lt!6045) (index!2315 lt!6045))) (ite c!2243 (index!2313 lt!6038) (ite c!2237 (index!2312 lt!6027) (index!2315 lt!6027)))) (mask!4671 (_2!431 lt!5945))))))

(declare-fun b!20475 () Bool)

(declare-fun e!13388 () Unit!419)

(declare-fun lt!6043 () Unit!419)

(assert (=> b!20475 (= e!13388 lt!6043)))

(assert (=> b!20475 (= lt!6043 call!1074)))

(declare-fun call!1084 () SeekEntryResult!48)

(assert (=> b!20475 (= lt!6038 call!1084)))

(declare-fun res!13478 () Bool)

(assert (=> b!20475 (= res!13478 ((_ is Found!48) lt!6038))))

(declare-fun e!13379 () Bool)

(assert (=> b!20475 (=> (not res!13478) (not e!13379))))

(assert (=> b!20475 e!13379))

(declare-fun call!1081 () ListLongMap!553)

(declare-fun b!20476 () Bool)

(declare-fun +!39 (ListLongMap!553 tuple2!858) ListLongMap!553)

(assert (=> b!20476 (= e!13382 (= call!1065 (+!39 call!1081 (tuple2!859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938)))))))))

(declare-fun b!20477 () Bool)

(declare-fun e!13384 () tuple2!856)

(declare-fun lt!6025 () tuple2!856)

(assert (=> b!20477 (= e!13384 (tuple2!857 (_1!431 lt!6025) (_2!431 lt!6025)))))

(declare-fun call!1070 () tuple2!856)

(assert (=> b!20477 (= lt!6025 call!1070)))

(declare-fun b!20478 () Bool)

(declare-fun c!2246 () Bool)

(declare-fun lt!6029 () SeekEntryResult!48)

(assert (=> b!20478 (= c!2246 ((_ is MissingVacant!48) lt!6029))))

(assert (=> b!20478 (= e!13378 e!13384)))

(declare-fun b!20479 () Bool)

(declare-fun res!13483 () Bool)

(assert (=> b!20479 (=> (not res!13483) (not e!13383))))

(assert (=> b!20479 (= res!13483 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2312 lt!6027)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1064 () Bool)

(declare-fun lt!6028 () tuple2!856)

(declare-fun map!386 (LongMapFixedSize!168) ListLongMap!553)

(assert (=> bm!1064 (= call!1065 (map!386 (_2!431 lt!6028)))))

(declare-fun bm!1065 () Bool)

(declare-fun call!1072 () Bool)

(assert (=> bm!1065 (= call!1076 call!1072)))

(declare-fun b!20480 () Bool)

(declare-fun res!13482 () Bool)

(assert (=> b!20480 (=> (not res!13482) (not e!13394))))

(assert (=> b!20480 (= res!13482 call!1079)))

(assert (=> b!20480 (= e!13393 e!13394)))

(declare-fun b!20466 () Bool)

(declare-fun Unit!422 () Unit!419)

(assert (=> b!20466 (= e!13388 Unit!422)))

(declare-fun lt!6022 () Unit!419)

(assert (=> b!20466 (= lt!6022 call!1068)))

(assert (=> b!20466 (= lt!6027 call!1084)))

(assert (=> b!20466 (= c!2237 ((_ is MissingZero!48) lt!6027))))

(assert (=> b!20466 e!13391))

(declare-fun lt!6040 () Unit!419)

(assert (=> b!20466 (= lt!6040 lt!6022)))

(assert (=> b!20466 false))

(declare-fun d!3679 () Bool)

(declare-fun e!13397 () Bool)

(assert (=> d!3679 e!13397))

(declare-fun res!13474 () Bool)

(assert (=> d!3679 (=> (not res!13474) (not e!13397))))

(declare-fun valid!83 (LongMapFixedSize!168) Bool)

(assert (=> d!3679 (= res!13474 (valid!83 (_2!431 lt!6028)))))

(assert (=> d!3679 (= lt!6028 e!13385)))

(declare-fun c!2241 () Bool)

(assert (=> d!3679 (= c!2241 (= #b1000000000000000000000000000000000000000000000000000000000000000 (bvneg #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3679 (valid!83 (_2!431 lt!5945))))

(assert (=> d!3679 (= (update!18 (_2!431 lt!5945) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938)))) lt!6028)))

(declare-fun b!20481 () Bool)

(declare-fun call!1073 () ListLongMap!553)

(assert (=> b!20481 (= e!13396 call!1073)))

(declare-fun bm!1066 () Bool)

(assert (=> bm!1066 (= call!1084 call!1064)))

(declare-fun bm!1067 () Bool)

(declare-fun call!1067 () ListLongMap!553)

(declare-fun getCurrentListMap!123 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 32) Int) ListLongMap!553)

(assert (=> bm!1067 (= call!1067 (getCurrentListMap!123 (_keys!3131 (_2!431 lt!5945)) (ite c!2241 (_values!1699 (_2!431 lt!5945)) (array!1190 (store (arr!566 (_values!1699 (_2!431 lt!5945))) (index!2313 lt!6029) (ValueCellFull!291 (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (size!659 (_values!1699 (_2!431 lt!5945))))) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) #b00000000000000000000000000000000 (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun b!20482 () Bool)

(declare-fun call!1080 () Bool)

(assert (=> b!20482 (= e!13395 (not call!1080))))

(declare-fun b!20483 () Bool)

(declare-fun res!13479 () Bool)

(assert (=> b!20483 (= res!13479 call!1072)))

(assert (=> b!20483 (=> (not res!13479) (not e!13379))))

(declare-fun lt!6024 () (_ BitVec 32))

(declare-fun lt!6042 () (_ BitVec 32))

(declare-fun bm!1068 () Bool)

(assert (=> bm!1068 (= call!1069 (getCurrentListMap!123 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (ite c!2241 (ite c!2245 lt!6024 lt!6042) (extraKeys!1613 (_2!431 lt!5945))) (ite (and c!2241 c!2245) (minValue!1637 (v!1552 (underlying!95 thiss!938))) (zeroValue!1637 (_2!431 lt!5945))) (ite c!2241 (ite c!2245 (minValue!1637 (_2!431 lt!5945)) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (minValue!1637 (_2!431 lt!5945))) #b00000000000000000000000000000000 (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun bm!1069 () Bool)

(declare-fun call!1077 () ListLongMap!553)

(assert (=> bm!1069 (= call!1077 call!1067)))

(declare-fun bm!1070 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1187 (_ BitVec 32)) SeekEntryResult!48)

(assert (=> bm!1070 (= call!1064 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3131 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945))))))

(declare-fun b!20484 () Bool)

(declare-fun res!13473 () Bool)

(declare-fun call!1071 () Bool)

(assert (=> b!20484 (= res!13473 call!1071)))

(assert (=> b!20484 (=> (not res!13473) (not e!13390))))

(declare-fun lt!6026 () array!1189)

(declare-fun bm!1071 () Bool)

(assert (=> bm!1071 (= call!1073 (getCurrentListMap!123 (_keys!3131 (_2!431 lt!5945)) (ite c!2242 (_values!1699 (_2!431 lt!5945)) lt!6026) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) #b00000000000000000000000000000000 (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun bm!1072 () Bool)

(declare-fun call!1063 () ListLongMap!553)

(declare-fun call!1061 () ListLongMap!553)

(assert (=> bm!1072 (= call!1063 call!1061)))

(declare-fun b!20485 () Bool)

(declare-fun lt!6037 () Unit!419)

(assert (=> b!20485 (= e!13387 lt!6037)))

(assert (=> b!20485 (= lt!6037 call!1068)))

(assert (=> b!20485 (= lt!6045 call!1075)))

(assert (=> b!20485 (= c!2239 ((_ is MissingZero!48) lt!6045))))

(assert (=> b!20485 e!13393))

(declare-fun b!20486 () Bool)

(assert (=> b!20486 (= e!13380 ((_ is Undefined!48) lt!6045))))

(declare-fun bm!1073 () Bool)

(assert (=> bm!1073 (= call!1072 call!1083)))

(declare-fun bm!1074 () Bool)

(declare-fun updateHelperNewKey!4 (LongMapFixedSize!168 (_ BitVec 64) V!1133 (_ BitVec 32)) tuple2!856)

(assert (=> bm!1074 (= call!1070 (updateHelperNewKey!4 (_2!431 lt!5945) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938))) (ite c!2246 (index!2315 lt!6029) (index!2312 lt!6029))))))

(declare-fun b!20487 () Bool)

(assert (=> b!20487 (= e!13392 (= call!1065 call!1081))))

(declare-fun b!20488 () Bool)

(declare-fun lt!6023 () Unit!419)

(declare-fun lt!6041 () Unit!419)

(assert (=> b!20488 (= lt!6023 lt!6041)))

(assert (=> b!20488 (contains!222 call!1073 (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2313 lt!6029)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 32) Int) Unit!419)

(assert (=> b!20488 (= lt!6041 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3131 (_2!431 lt!5945)) lt!6026 (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) (index!2313 lt!6029) (defaultEntry!1707 (_2!431 lt!5945))))))

(assert (=> b!20488 (= lt!6026 (array!1190 (store (arr!566 (_values!1699 (_2!431 lt!5945))) (index!2313 lt!6029) (ValueCellFull!291 (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (size!659 (_values!1699 (_2!431 lt!5945)))))))

(declare-fun lt!6035 () Unit!419)

(declare-fun lt!6030 () Unit!419)

(assert (=> b!20488 (= lt!6035 lt!6030)))

(assert (=> b!20488 (= call!1061 call!1067)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 32) (_ BitVec 64) V!1133 Int) Unit!419)

(assert (=> b!20488 (= lt!6030 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) (index!2313 lt!6029) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938))) (defaultEntry!1707 (_2!431 lt!5945))))))

(declare-fun lt!6044 () Unit!419)

(assert (=> b!20488 (= lt!6044 e!13388)))

(assert (=> b!20488 (= c!2243 call!1082)))

(declare-fun e!13381 () tuple2!856)

(assert (=> b!20488 (= e!13381 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) (_size!122 (_2!431 lt!5945)) (_keys!3131 (_2!431 lt!5945)) (array!1190 (store (arr!566 (_values!1699 (_2!431 lt!5945))) (index!2313 lt!6029) (ValueCellFull!291 (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (size!659 (_values!1699 (_2!431 lt!5945)))) (_vacant!122 (_2!431 lt!5945)))))))

(declare-fun bm!1075 () Bool)

(assert (=> bm!1075 (= call!1079 call!1071)))

(declare-fun b!20489 () Bool)

(assert (=> b!20489 (= e!13384 e!13381)))

(declare-fun c!2244 () Bool)

(assert (=> b!20489 (= c!2244 ((_ is MissingZero!48) lt!6029))))

(declare-fun b!20490 () Bool)

(assert (=> b!20490 (= e!13397 e!13392)))

(declare-fun c!2247 () Bool)

(assert (=> b!20490 (= c!2247 (_1!431 lt!6028))))

(declare-fun b!20491 () Bool)

(declare-fun call!1062 () Bool)

(assert (=> b!20491 (= e!13386 (not call!1062))))

(declare-fun bm!1076 () Bool)

(assert (=> bm!1076 (= call!1081 (map!386 (_2!431 lt!5945)))))

(declare-fun bm!1077 () Bool)

(assert (=> bm!1077 (= call!1071 call!1083)))

(declare-fun b!20492 () Bool)

(assert (=> b!20492 (= e!13394 (not call!1080))))

(declare-fun bm!1078 () Bool)

(assert (=> bm!1078 (= call!1061 (+!39 (ite c!2241 call!1077 call!1069) (ite c!2241 (ite c!2245 (tuple2!859 #b0000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (tuple2!859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (tuple2!859 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1637 (v!1552 (underlying!95 thiss!938)))))))))

(declare-fun b!20493 () Bool)

(declare-fun lt!6020 () Unit!419)

(declare-fun lt!6039 () Unit!419)

(assert (=> b!20493 (= lt!6020 lt!6039)))

(assert (=> b!20493 (= call!1063 call!1066)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 V!1133 Int) Unit!419)

(assert (=> b!20493 (= lt!6039 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) lt!6042 (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (_2!431 lt!5945)) (minValue!1637 (v!1552 (underlying!95 thiss!938))) (defaultEntry!1707 (_2!431 lt!5945))))))

(assert (=> b!20493 (= lt!6042 (bvor (extraKeys!1613 (_2!431 lt!5945)) #b00000000000000000000000000000010))))

(assert (=> b!20493 (= e!13389 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (bvor (extraKeys!1613 (_2!431 lt!5945)) #b00000000000000000000000000000010) (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (v!1552 (underlying!95 thiss!938))) (_size!122 (_2!431 lt!5945)) (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (_vacant!122 (_2!431 lt!5945)))))))

(declare-fun b!20494 () Bool)

(declare-fun e!13377 () Bool)

(assert (=> b!20494 (= e!13377 e!13386)))

(declare-fun res!13470 () Bool)

(assert (=> b!20494 (= res!13470 call!1076)))

(assert (=> b!20494 (=> (not res!13470) (not e!13386))))

(declare-fun b!20495 () Bool)

(declare-fun lt!6031 () Unit!419)

(declare-fun lt!6036 () Unit!419)

(assert (=> b!20495 (= lt!6031 lt!6036)))

(assert (=> b!20495 (= call!1063 call!1066)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!4 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 V!1133 Int) Unit!419)

(assert (=> b!20495 (= lt!6036 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (extraKeys!1613 (_2!431 lt!5945)) lt!6024 (zeroValue!1637 (_2!431 lt!5945)) (minValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (_2!431 lt!5945)) (defaultEntry!1707 (_2!431 lt!5945))))))

(assert (=> b!20495 (= lt!6024 (bvor (extraKeys!1613 (_2!431 lt!5945)) #b00000000000000000000000000000001))))

(assert (=> b!20495 (= e!13389 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945)) (bvor (extraKeys!1613 (_2!431 lt!5945)) #b00000000000000000000000000000001) (minValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (_2!431 lt!5945)) (_size!122 (_2!431 lt!5945)) (_keys!3131 (_2!431 lt!5945)) (_values!1699 (_2!431 lt!5945)) (_vacant!122 (_2!431 lt!5945)))))))

(declare-fun b!20496 () Bool)

(assert (=> b!20496 (= e!13383 (not call!1062))))

(declare-fun b!20497 () Bool)

(declare-fun c!2238 () Bool)

(assert (=> b!20497 (= c!2238 ((_ is MissingVacant!48) lt!6027))))

(assert (=> b!20497 (= e!13391 e!13377)))

(declare-fun bm!1079 () Bool)

(declare-fun call!1078 () Bool)

(assert (=> bm!1079 (= call!1080 call!1078)))

(declare-fun b!20498 () Bool)

(assert (=> b!20498 (= e!13379 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2313 lt!6038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20499 () Bool)

(assert (=> b!20499 (= e!13385 e!13378)))

(assert (=> b!20499 (= lt!6029 (seekEntryOrOpen!0 #b1000000000000000000000000000000000000000000000000000000000000000 (_keys!3131 (_2!431 lt!5945)) (mask!4671 (_2!431 lt!5945))))))

(assert (=> b!20499 (= c!2242 ((_ is Undefined!48) lt!6029))))

(declare-fun b!20500 () Bool)

(assert (=> b!20500 (= e!13377 ((_ is Undefined!48) lt!6027))))

(declare-fun b!20501 () Bool)

(declare-fun res!13476 () Bool)

(assert (=> b!20501 (= res!13476 (= (select (arr!565 (_keys!3131 (_2!431 lt!5945))) (index!2315 lt!6045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20501 (=> (not res!13476) (not e!13395))))

(declare-fun b!20502 () Bool)

(declare-fun lt!6032 () tuple2!856)

(assert (=> b!20502 (= lt!6032 call!1070)))

(assert (=> b!20502 (= e!13381 (tuple2!857 (_1!431 lt!6032) (_2!431 lt!6032)))))

(declare-fun bm!1080 () Bool)

(assert (=> bm!1080 (= call!1062 call!1078)))

(declare-fun bm!1081 () Bool)

(declare-fun arrayContainsKey!0 (array!1187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1081 (= call!1078 (arrayContainsKey!0 (_keys!3131 (_2!431 lt!5945)) #b1000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and d!3679 c!2241) b!20467))

(assert (= (and d!3679 (not c!2241)) b!20499))

(assert (= (and b!20467 c!2245) b!20495))

(assert (= (and b!20467 (not c!2245)) b!20493))

(assert (= (or b!20495 b!20493) bm!1069))

(assert (= (or b!20495 b!20493) bm!1061))

(assert (= (or b!20495 b!20493) bm!1072))

(assert (= (and b!20499 c!2242) b!20464))

(assert (= (and b!20499 (not c!2242)) b!20478))

(assert (= (and b!20464 c!2236) b!20474))

(assert (= (and b!20464 (not c!2236)) b!20485))

(assert (= (and b!20474 res!13475) b!20484))

(assert (= (and b!20484 res!13473) b!20473))

(assert (= (and b!20485 c!2239) b!20480))

(assert (= (and b!20485 (not c!2239)) b!20472))

(assert (= (and b!20480 res!13482) b!20465))

(assert (= (and b!20465 res!13481) b!20492))

(assert (= (and b!20472 c!2235) b!20469))

(assert (= (and b!20472 (not c!2235)) b!20486))

(assert (= (and b!20469 res!13480) b!20501))

(assert (= (and b!20501 res!13476) b!20482))

(assert (= (or b!20480 b!20469) bm!1075))

(assert (= (or b!20492 b!20482) bm!1079))

(assert (= (or b!20484 bm!1075) bm!1077))

(assert (= (or b!20474 b!20485) bm!1059))

(assert (= (and b!20478 c!2246) b!20477))

(assert (= (and b!20478 (not c!2246)) b!20489))

(assert (= (and b!20489 c!2244) b!20502))

(assert (= (and b!20489 (not c!2244)) b!20488))

(assert (= (and b!20488 c!2243) b!20475))

(assert (= (and b!20488 (not c!2243)) b!20466))

(assert (= (and b!20475 res!13478) b!20483))

(assert (= (and b!20483 res!13479) b!20498))

(assert (= (and b!20466 c!2237) b!20470))

(assert (= (and b!20466 (not c!2237)) b!20497))

(assert (= (and b!20470 res!13471) b!20479))

(assert (= (and b!20479 res!13483) b!20496))

(assert (= (and b!20497 c!2238) b!20494))

(assert (= (and b!20497 (not c!2238)) b!20500))

(assert (= (and b!20494 res!13470) b!20471))

(assert (= (and b!20471 res!13472) b!20491))

(assert (= (or b!20470 b!20494) bm!1065))

(assert (= (or b!20496 b!20491) bm!1080))

(assert (= (or b!20483 bm!1065) bm!1073))

(assert (= (or b!20475 b!20466) bm!1066))

(assert (= (or b!20477 b!20502) bm!1074))

(assert (= (or bm!1079 bm!1080) bm!1081))

(assert (= (or b!20474 b!20475) bm!1058))

(assert (= (or b!20464 b!20488) bm!1071))

(assert (= (or bm!1059 bm!1066) bm!1070))

(assert (= (or b!20485 b!20466) bm!1060))

(assert (= (or bm!1077 bm!1073) bm!1063))

(assert (= (or b!20464 b!20488) bm!1062))

(assert (= (and bm!1062 c!2240) b!20481))

(assert (= (and bm!1062 (not c!2240)) b!20468))

(assert (= (or bm!1069 b!20488) bm!1067))

(assert (= (or bm!1061 b!20468 b!20488) bm!1068))

(assert (= (or bm!1072 b!20488) bm!1078))

(assert (= (and d!3679 res!13474) b!20490))

(assert (= (and b!20490 c!2247) b!20463))

(assert (= (and b!20490 (not c!2247)) b!20487))

(assert (= (and b!20463 res!13477) b!20476))

(assert (= (or b!20463 b!20476 b!20487) bm!1064))

(assert (= (or b!20476 b!20487) bm!1076))

(declare-fun m!14281 () Bool)

(assert (=> b!20498 m!14281))

(declare-fun m!14283 () Bool)

(assert (=> b!20488 m!14283))

(declare-fun m!14285 () Bool)

(assert (=> b!20488 m!14285))

(declare-fun m!14287 () Bool)

(assert (=> b!20488 m!14287))

(assert (=> b!20488 m!14283))

(declare-fun m!14289 () Bool)

(assert (=> b!20488 m!14289))

(declare-fun m!14291 () Bool)

(assert (=> b!20488 m!14291))

(assert (=> bm!1067 m!14285))

(declare-fun m!14293 () Bool)

(assert (=> bm!1067 m!14293))

(declare-fun m!14295 () Bool)

(assert (=> bm!1076 m!14295))

(declare-fun m!14297 () Bool)

(assert (=> bm!1074 m!14297))

(declare-fun m!14299 () Bool)

(assert (=> b!20495 m!14299))

(declare-fun m!14301 () Bool)

(assert (=> bm!1068 m!14301))

(declare-fun m!14303 () Bool)

(assert (=> bm!1070 m!14303))

(declare-fun m!14305 () Bool)

(assert (=> d!3679 m!14305))

(declare-fun m!14307 () Bool)

(assert (=> d!3679 m!14307))

(declare-fun m!14309 () Bool)

(assert (=> b!20493 m!14309))

(declare-fun m!14311 () Bool)

(assert (=> bm!1078 m!14311))

(declare-fun m!14313 () Bool)

(assert (=> bm!1060 m!14313))

(declare-fun m!14315 () Bool)

(assert (=> b!20471 m!14315))

(declare-fun m!14317 () Bool)

(assert (=> bm!1064 m!14317))

(assert (=> b!20499 m!14303))

(declare-fun m!14319 () Bool)

(assert (=> bm!1081 m!14319))

(declare-fun m!14321 () Bool)

(assert (=> b!20501 m!14321))

(declare-fun m!14323 () Bool)

(assert (=> b!20465 m!14323))

(declare-fun m!14325 () Bool)

(assert (=> b!20479 m!14325))

(declare-fun m!14327 () Bool)

(assert (=> b!20476 m!14327))

(declare-fun m!14329 () Bool)

(assert (=> bm!1058 m!14329))

(declare-fun m!14331 () Bool)

(assert (=> b!20463 m!14331))

(declare-fun m!14333 () Bool)

(assert (=> bm!1063 m!14333))

(declare-fun m!14335 () Bool)

(assert (=> b!20473 m!14335))

(declare-fun m!14337 () Bool)

(assert (=> bm!1071 m!14337))

(declare-fun m!14339 () Bool)

(assert (=> bm!1062 m!14339))

(assert (=> b!20334 d!3679))

(declare-fun d!3681 () Bool)

(assert (=> d!3681 (= (array_inv!383 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) (bvsge (size!658 (_keys!3131 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20329 d!3681))

(declare-fun d!3683 () Bool)

(assert (=> d!3683 (= (array_inv!384 (_values!1699 (v!1552 (underlying!95 thiss!938)))) (bvsge (size!659 (_values!1699 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20329 d!3683))

(declare-fun d!3685 () Bool)

(assert (=> d!3685 (= (validMask!0 (mask!4671 (v!1552 (underlying!95 thiss!938)))) (and (or (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000001111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000011111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000001111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000011111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000001111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000011111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000001111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000011111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000001111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000011111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000001111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000011111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000001111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000011111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000001111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000011111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000111111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00001111111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00011111111111111111111111111111) (= (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20336 d!3685))

(declare-fun d!3687 () Bool)

(assert (=> d!3687 (= (valid!82 thiss!938) (valid!83 (v!1552 (underlying!95 thiss!938))))))

(declare-fun bs!897 () Bool)

(assert (= bs!897 d!3687))

(declare-fun m!14341 () Bool)

(assert (=> bs!897 m!14341))

(assert (=> start!3300 d!3687))

(declare-fun b!20515 () Bool)

(declare-fun res!13488 () Bool)

(declare-fun e!13405 () Bool)

(assert (=> b!20515 (=> (not res!13488) (not e!13405))))

(declare-fun lt!6093 () LongMapFixedSize!168)

(assert (=> b!20515 (= res!13488 (= (mask!4671 lt!6093) (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938))))))))

(declare-fun b!20516 () Bool)

(assert (=> b!20516 (= e!13405 (= (map!386 lt!6093) (ListLongMap!554 Nil!552)))))

(declare-fun b!20517 () Bool)

(declare-fun e!13406 () Unit!419)

(declare-fun Unit!423 () Unit!419)

(assert (=> b!20517 (= e!13406 Unit!423)))

(declare-fun lt!6105 () tuple2!858)

(declare-fun lt!6101 () LongMapFixedSize!168)

(declare-fun head!824 (List!555) tuple2!858)

(assert (=> b!20517 (= lt!6105 (head!824 (toList!292 (map!386 lt!6101))))))

(declare-fun lt!6108 () array!1187)

(assert (=> b!20517 (= lt!6108 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6099 () (_ BitVec 32))

(assert (=> b!20517 (= lt!6099 #b00000000000000000000000000000000)))

(declare-fun lt!6110 () Unit!419)

(declare-fun lemmaKeyInListMapIsInArray!85 (array!1187 array!1189 (_ BitVec 32) (_ BitVec 32) V!1133 V!1133 (_ BitVec 64) Int) Unit!419)

(declare-fun dynLambda!138 (Int (_ BitVec 64)) V!1133)

(assert (=> b!20517 (= lt!6110 (lemmaKeyInListMapIsInArray!85 lt!6108 (array!1190 ((as const (Array (_ BitVec 32) ValueCell!291)) EmptyCell!291) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) lt!6099 (dynLambda!138 (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!432 lt!6105) (defaultEntry!1707 (v!1552 (underlying!95 thiss!938)))))))

(declare-fun c!2252 () Bool)

(assert (=> b!20517 (= c!2252 (and (not (= (_1!432 lt!6105) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!432 lt!6105) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13404 () Bool)

(assert (=> b!20517 e!13404))

(declare-fun lt!6104 () Unit!419)

(assert (=> b!20517 (= lt!6104 lt!6110)))

(declare-fun lt!6095 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1187 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20517 (= lt!6095 (arrayScanForKey!0 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)) (_1!432 lt!6105) #b00000000000000000000000000000000))))

(assert (=> b!20517 false))

(declare-fun b!20518 () Bool)

(assert (=> b!20518 (= e!13404 (arrayContainsKey!0 lt!6108 (_1!432 lt!6105) #b00000000000000000000000000000000))))

(declare-fun b!20519 () Bool)

(assert (=> b!20519 (= e!13404 (ite (= (_1!432 lt!6105) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6099 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6099 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3689 () Bool)

(assert (=> d!3689 e!13405))

(declare-fun res!13489 () Bool)

(assert (=> d!3689 (=> (not res!13489) (not e!13405))))

(assert (=> d!3689 (= res!13489 (valid!83 lt!6093))))

(assert (=> d!3689 (= lt!6093 lt!6101)))

(declare-fun lt!6103 () Unit!419)

(assert (=> d!3689 (= lt!6103 e!13406)))

(declare-fun c!2253 () Bool)

(assert (=> d!3689 (= c!2253 (not (= (map!386 lt!6101) (ListLongMap!554 Nil!552))))))

(declare-fun lt!6114 () Unit!419)

(declare-fun lt!6102 () Unit!419)

(assert (=> d!3689 (= lt!6114 lt!6102)))

(declare-fun lt!6106 () array!1187)

(declare-fun lt!6097 () (_ BitVec 32))

(declare-datatypes ((List!556 0))(
  ( (Nil!553) (Cons!552 (h!1118 (_ BitVec 64)) (t!3209 List!556)) )
))
(declare-fun lt!6109 () List!556)

(declare-fun arrayNoDuplicates!0 (array!1187 (_ BitVec 32) List!556) Bool)

(assert (=> d!3689 (arrayNoDuplicates!0 lt!6106 lt!6097 lt!6109)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1187 (_ BitVec 32) (_ BitVec 32) List!556) Unit!419)

(assert (=> d!3689 (= lt!6102 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6106 lt!6097 (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001) lt!6109))))

(assert (=> d!3689 (= lt!6109 Nil!553)))

(assert (=> d!3689 (= lt!6097 #b00000000000000000000000000000000)))

(assert (=> d!3689 (= lt!6106 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6096 () Unit!419)

(declare-fun lt!6100 () Unit!419)

(assert (=> d!3689 (= lt!6096 lt!6100)))

(declare-fun lt!6092 () (_ BitVec 32))

(declare-fun lt!6107 () array!1187)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1187 (_ BitVec 32)) Bool)

(assert (=> d!3689 (arrayForallSeekEntryOrOpenFound!0 lt!6092 lt!6107 (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1187 (_ BitVec 32) (_ BitVec 32)) Unit!419)

(assert (=> d!3689 (= lt!6100 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6107 (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) lt!6092))))

(assert (=> d!3689 (= lt!6092 #b00000000000000000000000000000000)))

(assert (=> d!3689 (= lt!6107 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6111 () Unit!419)

(declare-fun lt!6094 () Unit!419)

(assert (=> d!3689 (= lt!6111 lt!6094)))

(declare-fun lt!6113 () array!1187)

(declare-fun lt!6098 () (_ BitVec 32))

(declare-fun lt!6112 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1187 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3689 (= (arrayCountValidKeys!0 lt!6113 lt!6098 lt!6112) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1187 (_ BitVec 32) (_ BitVec 32)) Unit!419)

(assert (=> d!3689 (= lt!6094 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6113 lt!6098 lt!6112))))

(assert (=> d!3689 (= lt!6112 (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3689 (= lt!6098 #b00000000000000000000000000000000)))

(assert (=> d!3689 (= lt!6113 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3689 (= lt!6101 (LongMapFixedSize!169 (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!138 (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!138 (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1188 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)) (array!1190 ((as const (Array (_ BitVec 32) ValueCell!291)) EmptyCell!291) (bvadd (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3689 (validMask!0 (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))))))

(assert (=> d!3689 (= (getNewLongMapFixedSize!22 (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) (defaultEntry!1707 (v!1552 (underlying!95 thiss!938)))) lt!6093)))

(declare-fun b!20520 () Bool)

(declare-fun Unit!424 () Unit!419)

(assert (=> b!20520 (= e!13406 Unit!424)))

(assert (= (and d!3689 c!2253) b!20517))

(assert (= (and d!3689 (not c!2253)) b!20520))

(assert (= (and b!20517 c!2252) b!20518))

(assert (= (and b!20517 (not c!2252)) b!20519))

(assert (= (and d!3689 res!13489) b!20515))

(assert (= (and b!20515 res!13488) b!20516))

(declare-fun b_lambda!1497 () Bool)

(assert (=> (not b_lambda!1497) (not b!20517)))

(declare-fun t!3207 () Bool)

(declare-fun tb!639 () Bool)

(assert (=> (and b!20329 (= (defaultEntry!1707 (v!1552 (underlying!95 thiss!938))) (defaultEntry!1707 (v!1552 (underlying!95 thiss!938)))) t!3207) tb!639))

(declare-fun result!1051 () Bool)

(assert (=> tb!639 (= result!1051 tp_is_empty!981)))

(assert (=> b!20517 t!3207))

(declare-fun b_and!1397 () Bool)

(assert (= b_and!1393 (and (=> t!3207 result!1051) b_and!1397)))

(declare-fun b_lambda!1499 () Bool)

(assert (=> (not b_lambda!1499) (not d!3689)))

(assert (=> d!3689 t!3207))

(declare-fun b_and!1399 () Bool)

(assert (= b_and!1397 (and (=> t!3207 result!1051) b_and!1399)))

(declare-fun m!14343 () Bool)

(assert (=> b!20516 m!14343))

(declare-fun m!14345 () Bool)

(assert (=> b!20517 m!14345))

(assert (=> b!20517 m!14257))

(declare-fun m!14347 () Bool)

(assert (=> b!20517 m!14347))

(assert (=> b!20517 m!14347))

(declare-fun m!14349 () Bool)

(assert (=> b!20517 m!14349))

(declare-fun m!14351 () Bool)

(assert (=> b!20517 m!14351))

(declare-fun m!14353 () Bool)

(assert (=> b!20517 m!14353))

(assert (=> b!20517 m!14347))

(declare-fun m!14355 () Bool)

(assert (=> b!20518 m!14355))

(declare-fun m!14357 () Bool)

(assert (=> d!3689 m!14357))

(declare-fun m!14359 () Bool)

(assert (=> d!3689 m!14359))

(assert (=> d!3689 m!14257))

(declare-fun m!14361 () Bool)

(assert (=> d!3689 m!14361))

(declare-fun m!14363 () Bool)

(assert (=> d!3689 m!14363))

(assert (=> d!3689 m!14257))

(declare-fun m!14365 () Bool)

(assert (=> d!3689 m!14365))

(declare-fun m!14367 () Bool)

(assert (=> d!3689 m!14367))

(assert (=> d!3689 m!14347))

(assert (=> d!3689 m!14257))

(declare-fun m!14369 () Bool)

(assert (=> d!3689 m!14369))

(declare-fun m!14371 () Bool)

(assert (=> d!3689 m!14371))

(assert (=> d!3689 m!14351))

(assert (=> b!20333 d!3689))

(declare-fun d!3691 () Bool)

(declare-fun e!13412 () Bool)

(assert (=> d!3691 e!13412))

(declare-fun res!13492 () Bool)

(assert (=> d!3691 (=> (not res!13492) (not e!13412))))

(declare-fun lt!6120 () (_ BitVec 32))

(assert (=> d!3691 (= res!13492 (validMask!0 lt!6120))))

(declare-datatypes ((tuple2!860 0))(
  ( (tuple2!861 (_1!433 Unit!419) (_2!433 (_ BitVec 32))) )
))
(declare-fun e!13411 () tuple2!860)

(assert (=> d!3691 (= lt!6120 (_2!433 e!13411))))

(declare-fun c!2256 () Bool)

(declare-fun lt!6119 () tuple2!860)

(assert (=> d!3691 (= c!2256 (and (bvsgt (_2!433 lt!6119) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!122 (v!1552 (underlying!95 thiss!938)))) (_2!433 lt!6119)) (bvsge (bvadd (bvand (bvashr (_2!433 lt!6119) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!122 (v!1552 (underlying!95 thiss!938))))))))

(declare-fun Unit!425 () Unit!419)

(declare-fun Unit!426 () Unit!419)

(assert (=> d!3691 (= lt!6119 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!122 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))))) (mask!4671 (v!1552 (underlying!95 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!122 (v!1552 (underlying!95 thiss!938)))) (mask!4671 (v!1552 (underlying!95 thiss!938))))) (tuple2!861 Unit!425 (bvand (bvadd (bvshl (mask!4671 (v!1552 (underlying!95 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!861 Unit!426 (mask!4671 (v!1552 (underlying!95 thiss!938))))))))

(assert (=> d!3691 (validMask!0 (mask!4671 (v!1552 (underlying!95 thiss!938))))))

(assert (=> d!3691 (= (computeNewMask!18 thiss!938 (mask!4671 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (_size!122 (v!1552 (underlying!95 thiss!938)))) lt!6120)))

(declare-fun b!20529 () Bool)

(declare-fun computeNewMaskWhile!8 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!860)

(assert (=> b!20529 (= e!13411 (computeNewMaskWhile!8 (_size!122 (v!1552 (underlying!95 thiss!938))) (_vacant!122 (v!1552 (underlying!95 thiss!938))) (mask!4671 (v!1552 (underlying!95 thiss!938))) (_2!433 lt!6119)))))

(declare-fun b!20530 () Bool)

(declare-fun Unit!427 () Unit!419)

(assert (=> b!20530 (= e!13411 (tuple2!861 Unit!427 (_2!433 lt!6119)))))

(declare-fun b!20531 () Bool)

(assert (=> b!20531 (= e!13412 (bvsle (_size!122 (v!1552 (underlying!95 thiss!938))) (bvadd lt!6120 #b00000000000000000000000000000001)))))

(assert (= (and d!3691 c!2256) b!20529))

(assert (= (and d!3691 (not c!2256)) b!20530))

(assert (= (and d!3691 res!13492) b!20531))

(declare-fun m!14373 () Bool)

(assert (=> d!3691 m!14373))

(assert (=> d!3691 m!14249))

(declare-fun m!14375 () Bool)

(assert (=> b!20529 m!14375))

(assert (=> b!20333 d!3691))

(declare-fun b!20532 () Bool)

(declare-fun e!13428 () Bool)

(declare-fun e!13418 () Bool)

(assert (=> b!20532 (= e!13428 e!13418)))

(declare-fun res!13500 () Bool)

(declare-fun call!1089 () ListLongMap!553)

(assert (=> b!20532 (= res!13500 (contains!222 call!1089 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20532 (=> (not res!13500) (not e!13418))))

(declare-fun call!1098 () Unit!419)

(declare-fun bm!1082 () Bool)

(assert (=> bm!1082 (= call!1098 (lemmaInListMapThenSeekEntryOrOpenFindsIt!4 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1707 lt!5941)))))

(declare-fun bm!1083 () Bool)

(declare-fun call!1099 () SeekEntryResult!48)

(declare-fun call!1088 () SeekEntryResult!48)

(assert (=> bm!1083 (= call!1099 call!1088)))

(declare-fun b!20533 () Bool)

(declare-fun lt!6123 () Unit!419)

(declare-fun e!13423 () Unit!419)

(assert (=> b!20533 (= lt!6123 e!13423)))

(declare-fun c!2258 () Bool)

(declare-fun call!1106 () Bool)

(assert (=> b!20533 (= c!2258 call!1106)))

(declare-fun e!13414 () tuple2!856)

(assert (=> b!20533 (= e!13414 (tuple2!857 false lt!5941))))

(declare-fun call!1092 () Unit!419)

(declare-fun bm!1084 () Bool)

(assert (=> bm!1084 (= call!1092 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!4 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (defaultEntry!1707 lt!5941)))))

(declare-fun bm!1085 () Bool)

(declare-fun call!1090 () ListLongMap!553)

(declare-fun call!1093 () ListLongMap!553)

(assert (=> bm!1085 (= call!1090 call!1093)))

(declare-fun b!20534 () Bool)

(declare-fun res!13504 () Bool)

(declare-fun e!13430 () Bool)

(assert (=> b!20534 (=> (not res!13504) (not e!13430))))

(declare-fun lt!6147 () SeekEntryResult!48)

(assert (=> b!20534 (= res!13504 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2312 lt!6147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20536 () Bool)

(declare-fun e!13421 () tuple2!856)

(declare-fun e!13425 () tuple2!856)

(assert (=> b!20536 (= e!13421 e!13425)))

(declare-fun c!2267 () Bool)

(assert (=> b!20536 (= c!2267 (= (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20537 () Bool)

(declare-fun e!13432 () ListLongMap!553)

(assert (=> b!20537 (= e!13432 call!1093)))

(declare-fun b!20538 () Bool)

(declare-fun e!13416 () Bool)

(declare-fun e!13431 () Bool)

(assert (=> b!20538 (= e!13416 e!13431)))

(declare-fun res!13503 () Bool)

(declare-fun call!1103 () Bool)

(assert (=> b!20538 (= res!13503 call!1103)))

(assert (=> b!20538 (=> (not res!13503) (not e!13431))))

(declare-fun bm!1086 () Bool)

(declare-fun c!2262 () Bool)

(declare-fun c!2264 () Bool)

(assert (=> bm!1086 (= c!2262 c!2264)))

(assert (=> bm!1086 (= call!1106 (contains!222 e!13432 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20539 () Bool)

(declare-fun res!13494 () Bool)

(declare-fun e!13419 () Bool)

(assert (=> b!20539 (=> (not res!13494) (not e!13419))))

(declare-fun call!1100 () Bool)

(assert (=> b!20539 (= res!13494 call!1100)))

(declare-fun e!13427 () Bool)

(assert (=> b!20539 (= e!13427 e!13419)))

(declare-fun b!20540 () Bool)

(declare-fun res!13495 () Bool)

(declare-fun lt!6129 () SeekEntryResult!48)

(assert (=> b!20540 (= res!13495 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2315 lt!6129)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13422 () Bool)

(assert (=> b!20540 (=> (not res!13495) (not e!13422))))

(declare-fun b!20541 () Bool)

(declare-fun c!2257 () Bool)

(assert (=> b!20541 (= c!2257 ((_ is MissingVacant!48) lt!6147))))

(declare-fun e!13429 () Bool)

(assert (=> b!20541 (= e!13429 e!13416)))

(declare-fun b!20542 () Bool)

(declare-fun lt!6135 () SeekEntryResult!48)

(declare-fun e!13426 () Bool)

(assert (=> b!20542 (= e!13426 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2313 lt!6135)) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20543 () Bool)

(declare-fun Unit!428 () Unit!419)

(assert (=> b!20543 (= e!13423 Unit!428)))

(declare-fun lt!6136 () Unit!419)

(assert (=> b!20543 (= lt!6136 call!1098)))

(assert (=> b!20543 (= lt!6135 call!1099)))

(declare-fun res!13498 () Bool)

(assert (=> b!20543 (= res!13498 ((_ is Found!48) lt!6135))))

(assert (=> b!20543 (=> (not res!13498) (not e!13426))))

(assert (=> b!20543 e!13426))

(declare-fun lt!6121 () Unit!419)

(assert (=> b!20543 (= lt!6121 lt!6136)))

(assert (=> b!20543 false))

(declare-fun c!2261 () Bool)

(declare-fun c!2259 () Bool)

(declare-fun c!2265 () Bool)

(declare-fun call!1107 () Bool)

(declare-fun bm!1087 () Bool)

(declare-fun lt!6140 () SeekEntryResult!48)

(assert (=> bm!1087 (= call!1107 (inRange!0 (ite c!2264 (ite c!2258 (index!2313 lt!6135) (ite c!2261 (index!2312 lt!6147) (index!2315 lt!6147))) (ite c!2265 (index!2313 lt!6140) (ite c!2259 (index!2312 lt!6129) (index!2315 lt!6129)))) (mask!4671 lt!5941)))))

(declare-fun b!20544 () Bool)

(declare-fun e!13424 () Unit!419)

(declare-fun lt!6145 () Unit!419)

(assert (=> b!20544 (= e!13424 lt!6145)))

(assert (=> b!20544 (= lt!6145 call!1098)))

(declare-fun call!1108 () SeekEntryResult!48)

(assert (=> b!20544 (= lt!6140 call!1108)))

(declare-fun res!13501 () Bool)

(assert (=> b!20544 (= res!13501 ((_ is Found!48) lt!6140))))

(declare-fun e!13415 () Bool)

(assert (=> b!20544 (=> (not res!13501) (not e!13415))))

(assert (=> b!20544 e!13415))

(declare-fun b!20545 () Bool)

(declare-fun call!1105 () ListLongMap!553)

(assert (=> b!20545 (= e!13418 (= call!1089 (+!39 call!1105 (tuple2!859 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))))))))

(declare-fun b!20546 () Bool)

(declare-fun e!13420 () tuple2!856)

(declare-fun lt!6127 () tuple2!856)

(assert (=> b!20546 (= e!13420 (tuple2!857 (_1!431 lt!6127) (_2!431 lt!6127)))))

(declare-fun call!1094 () tuple2!856)

(assert (=> b!20546 (= lt!6127 call!1094)))

(declare-fun b!20547 () Bool)

(declare-fun c!2268 () Bool)

(declare-fun lt!6131 () SeekEntryResult!48)

(assert (=> b!20547 (= c!2268 ((_ is MissingVacant!48) lt!6131))))

(assert (=> b!20547 (= e!13414 e!13420)))

(declare-fun b!20548 () Bool)

(declare-fun res!13506 () Bool)

(assert (=> b!20548 (=> (not res!13506) (not e!13419))))

(assert (=> b!20548 (= res!13506 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2312 lt!6129)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1088 () Bool)

(declare-fun lt!6130 () tuple2!856)

(assert (=> bm!1088 (= call!1089 (map!386 (_2!431 lt!6130)))))

(declare-fun bm!1089 () Bool)

(declare-fun call!1096 () Bool)

(assert (=> bm!1089 (= call!1100 call!1096)))

(declare-fun b!20549 () Bool)

(declare-fun res!13505 () Bool)

(assert (=> b!20549 (=> (not res!13505) (not e!13430))))

(assert (=> b!20549 (= res!13505 call!1103)))

(assert (=> b!20549 (= e!13429 e!13430)))

(declare-fun b!20535 () Bool)

(declare-fun Unit!429 () Unit!419)

(assert (=> b!20535 (= e!13424 Unit!429)))

(declare-fun lt!6124 () Unit!419)

(assert (=> b!20535 (= lt!6124 call!1092)))

(assert (=> b!20535 (= lt!6129 call!1108)))

(assert (=> b!20535 (= c!2259 ((_ is MissingZero!48) lt!6129))))

(assert (=> b!20535 e!13427))

(declare-fun lt!6142 () Unit!419)

(assert (=> b!20535 (= lt!6142 lt!6124)))

(assert (=> b!20535 false))

(declare-fun d!3693 () Bool)

(declare-fun e!13433 () Bool)

(assert (=> d!3693 e!13433))

(declare-fun res!13497 () Bool)

(assert (=> d!3693 (=> (not res!13497) (not e!13433))))

(assert (=> d!3693 (= res!13497 (valid!83 (_2!431 lt!6130)))))

(assert (=> d!3693 (= lt!6130 e!13421)))

(declare-fun c!2263 () Bool)

(assert (=> d!3693 (= c!2263 (= (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvneg (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3693 (valid!83 lt!5941)))

(assert (=> d!3693 (= (update!18 lt!5941 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))) lt!6130)))

(declare-fun b!20550 () Bool)

(declare-fun call!1097 () ListLongMap!553)

(assert (=> b!20550 (= e!13432 call!1097)))

(declare-fun bm!1090 () Bool)

(assert (=> bm!1090 (= call!1108 call!1088)))

(declare-fun bm!1091 () Bool)

(declare-fun call!1091 () ListLongMap!553)

(assert (=> bm!1091 (= call!1091 (getCurrentListMap!123 (_keys!3131 lt!5941) (ite c!2263 (_values!1699 lt!5941) (array!1190 (store (arr!566 (_values!1699 lt!5941)) (index!2313 lt!6131) (ValueCellFull!291 (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))))) (size!659 (_values!1699 lt!5941)))) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) #b00000000000000000000000000000000 (defaultEntry!1707 lt!5941)))))

(declare-fun b!20551 () Bool)

(declare-fun call!1104 () Bool)

(assert (=> b!20551 (= e!13431 (not call!1104))))

(declare-fun b!20552 () Bool)

(declare-fun res!13502 () Bool)

(assert (=> b!20552 (= res!13502 call!1096)))

(assert (=> b!20552 (=> (not res!13502) (not e!13415))))

(declare-fun lt!6144 () (_ BitVec 32))

(declare-fun lt!6126 () (_ BitVec 32))

(declare-fun bm!1092 () Bool)

(assert (=> bm!1092 (= call!1093 (getCurrentListMap!123 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (ite c!2263 (ite c!2267 lt!6126 lt!6144) (extraKeys!1613 lt!5941)) (ite (and c!2263 c!2267) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (zeroValue!1637 lt!5941)) (ite c!2263 (ite c!2267 (minValue!1637 lt!5941) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (minValue!1637 lt!5941)) #b00000000000000000000000000000000 (defaultEntry!1707 lt!5941)))))

(declare-fun bm!1093 () Bool)

(declare-fun call!1101 () ListLongMap!553)

(assert (=> bm!1093 (= call!1101 call!1091)))

(declare-fun bm!1094 () Bool)

(assert (=> bm!1094 (= call!1088 (seekEntryOrOpen!0 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3131 lt!5941) (mask!4671 lt!5941)))))

(declare-fun b!20553 () Bool)

(declare-fun res!13496 () Bool)

(declare-fun call!1095 () Bool)

(assert (=> b!20553 (= res!13496 call!1095)))

(assert (=> b!20553 (=> (not res!13496) (not e!13426))))

(declare-fun bm!1095 () Bool)

(declare-fun lt!6128 () array!1189)

(assert (=> bm!1095 (= call!1097 (getCurrentListMap!123 (_keys!3131 lt!5941) (ite c!2264 (_values!1699 lt!5941) lt!6128) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) #b00000000000000000000000000000000 (defaultEntry!1707 lt!5941)))))

(declare-fun bm!1096 () Bool)

(declare-fun call!1087 () ListLongMap!553)

(declare-fun call!1085 () ListLongMap!553)

(assert (=> bm!1096 (= call!1087 call!1085)))

(declare-fun b!20554 () Bool)

(declare-fun lt!6139 () Unit!419)

(assert (=> b!20554 (= e!13423 lt!6139)))

(assert (=> b!20554 (= lt!6139 call!1092)))

(assert (=> b!20554 (= lt!6147 call!1099)))

(assert (=> b!20554 (= c!2261 ((_ is MissingZero!48) lt!6147))))

(assert (=> b!20554 e!13429))

(declare-fun b!20555 () Bool)

(assert (=> b!20555 (= e!13416 ((_ is Undefined!48) lt!6147))))

(declare-fun bm!1097 () Bool)

(assert (=> bm!1097 (= call!1096 call!1107)))

(declare-fun bm!1098 () Bool)

(assert (=> bm!1098 (= call!1094 (updateHelperNewKey!4 lt!5941 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (ite c!2268 (index!2315 lt!6131) (index!2312 lt!6131))))))

(declare-fun b!20556 () Bool)

(assert (=> b!20556 (= e!13428 (= call!1089 call!1105))))

(declare-fun b!20557 () Bool)

(declare-fun lt!6125 () Unit!419)

(declare-fun lt!6143 () Unit!419)

(assert (=> b!20557 (= lt!6125 lt!6143)))

(assert (=> b!20557 (contains!222 call!1097 (select (arr!565 (_keys!3131 lt!5941)) (index!2313 lt!6131)))))

(assert (=> b!20557 (= lt!6143 (lemmaValidKeyInArrayIsInListMap!4 (_keys!3131 lt!5941) lt!6128 (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (index!2313 lt!6131) (defaultEntry!1707 lt!5941)))))

(assert (=> b!20557 (= lt!6128 (array!1190 (store (arr!566 (_values!1699 lt!5941)) (index!2313 lt!6131) (ValueCellFull!291 (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))))) (size!659 (_values!1699 lt!5941))))))

(declare-fun lt!6137 () Unit!419)

(declare-fun lt!6132 () Unit!419)

(assert (=> b!20557 (= lt!6137 lt!6132)))

(assert (=> b!20557 (= call!1085 call!1091)))

(assert (=> b!20557 (= lt!6132 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!4 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (index!2313 lt!6131) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (defaultEntry!1707 lt!5941)))))

(declare-fun lt!6146 () Unit!419)

(assert (=> b!20557 (= lt!6146 e!13424)))

(assert (=> b!20557 (= c!2265 call!1106)))

(declare-fun e!13417 () tuple2!856)

(assert (=> b!20557 (= e!13417 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (_size!122 lt!5941) (_keys!3131 lt!5941) (array!1190 (store (arr!566 (_values!1699 lt!5941)) (index!2313 lt!6131) (ValueCellFull!291 (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))))) (size!659 (_values!1699 lt!5941))) (_vacant!122 lt!5941))))))

(declare-fun bm!1099 () Bool)

(assert (=> bm!1099 (= call!1103 call!1095)))

(declare-fun b!20558 () Bool)

(assert (=> b!20558 (= e!13420 e!13417)))

(declare-fun c!2266 () Bool)

(assert (=> b!20558 (= c!2266 ((_ is MissingZero!48) lt!6131))))

(declare-fun b!20559 () Bool)

(assert (=> b!20559 (= e!13433 e!13428)))

(declare-fun c!2269 () Bool)

(assert (=> b!20559 (= c!2269 (_1!431 lt!6130))))

(declare-fun b!20560 () Bool)

(declare-fun call!1086 () Bool)

(assert (=> b!20560 (= e!13422 (not call!1086))))

(declare-fun bm!1100 () Bool)

(assert (=> bm!1100 (= call!1105 (map!386 lt!5941))))

(declare-fun bm!1101 () Bool)

(assert (=> bm!1101 (= call!1095 call!1107)))

(declare-fun b!20561 () Bool)

(assert (=> b!20561 (= e!13430 (not call!1104))))

(declare-fun bm!1102 () Bool)

(assert (=> bm!1102 (= call!1085 (+!39 (ite c!2263 call!1101 call!1093) (ite c!2263 (ite c!2267 (tuple2!859 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))) (tuple2!859 #b1000000000000000000000000000000000000000000000000000000000000000 (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))))) (tuple2!859 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938))))))))))

(declare-fun b!20562 () Bool)

(declare-fun lt!6122 () Unit!419)

(declare-fun lt!6141 () Unit!419)

(assert (=> b!20562 (= lt!6122 lt!6141)))

(assert (=> b!20562 (= call!1087 call!1090)))

(assert (=> b!20562 (= lt!6141 (lemmaChangeLongMinValueKeyThenAddPairToListMap!4 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) lt!6144 (zeroValue!1637 lt!5941) (minValue!1637 lt!5941) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (defaultEntry!1707 lt!5941)))))

(assert (=> b!20562 (= lt!6144 (bvor (extraKeys!1613 lt!5941) #b00000000000000000000000000000010))))

(assert (=> b!20562 (= e!13425 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 lt!5941) (mask!4671 lt!5941) (bvor (extraKeys!1613 lt!5941) #b00000000000000000000000000000010) (zeroValue!1637 lt!5941) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (_size!122 lt!5941) (_keys!3131 lt!5941) (_values!1699 lt!5941) (_vacant!122 lt!5941))))))

(declare-fun b!20563 () Bool)

(declare-fun e!13413 () Bool)

(assert (=> b!20563 (= e!13413 e!13422)))

(declare-fun res!13493 () Bool)

(assert (=> b!20563 (= res!13493 call!1100)))

(assert (=> b!20563 (=> (not res!13493) (not e!13422))))

(declare-fun b!20564 () Bool)

(declare-fun lt!6133 () Unit!419)

(declare-fun lt!6138 () Unit!419)

(assert (=> b!20564 (= lt!6133 lt!6138)))

(assert (=> b!20564 (= call!1087 call!1090)))

(assert (=> b!20564 (= lt!6138 (lemmaChangeZeroKeyThenAddPairToListMap!4 (_keys!3131 lt!5941) (_values!1699 lt!5941) (mask!4671 lt!5941) (extraKeys!1613 lt!5941) lt!6126 (zeroValue!1637 lt!5941) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (minValue!1637 lt!5941) (defaultEntry!1707 lt!5941)))))

(assert (=> b!20564 (= lt!6126 (bvor (extraKeys!1613 lt!5941) #b00000000000000000000000000000001))))

(assert (=> b!20564 (= e!13425 (tuple2!857 true (LongMapFixedSize!169 (defaultEntry!1707 lt!5941) (mask!4671 lt!5941) (bvor (extraKeys!1613 lt!5941) #b00000000000000000000000000000001) (ite (or c!2197 c!2199) (zeroValue!1637 (v!1552 (underlying!95 thiss!938))) (minValue!1637 (v!1552 (underlying!95 thiss!938)))) (minValue!1637 lt!5941) (_size!122 lt!5941) (_keys!3131 lt!5941) (_values!1699 lt!5941) (_vacant!122 lt!5941))))))

(declare-fun b!20565 () Bool)

(assert (=> b!20565 (= e!13419 (not call!1086))))

(declare-fun b!20566 () Bool)

(declare-fun c!2260 () Bool)

(assert (=> b!20566 (= c!2260 ((_ is MissingVacant!48) lt!6129))))

(assert (=> b!20566 (= e!13427 e!13413)))

(declare-fun bm!1103 () Bool)

(declare-fun call!1102 () Bool)

(assert (=> bm!1103 (= call!1104 call!1102)))

(declare-fun b!20567 () Bool)

(assert (=> b!20567 (= e!13415 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2313 lt!6140)) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!20568 () Bool)

(assert (=> b!20568 (= e!13421 e!13414)))

(assert (=> b!20568 (= lt!6131 (seekEntryOrOpen!0 (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (_keys!3131 lt!5941) (mask!4671 lt!5941)))))

(assert (=> b!20568 (= c!2264 ((_ is Undefined!48) lt!6131))))

(declare-fun b!20569 () Bool)

(assert (=> b!20569 (= e!13413 ((_ is Undefined!48) lt!6129))))

(declare-fun b!20570 () Bool)

(declare-fun res!13499 () Bool)

(assert (=> b!20570 (= res!13499 (= (select (arr!565 (_keys!3131 lt!5941)) (index!2315 lt!6147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20570 (=> (not res!13499) (not e!13431))))

(declare-fun b!20571 () Bool)

(declare-fun lt!6134 () tuple2!856)

(assert (=> b!20571 (= lt!6134 call!1094)))

(assert (=> b!20571 (= e!13417 (tuple2!857 (_1!431 lt!6134) (_2!431 lt!6134)))))

(declare-fun bm!1104 () Bool)

(assert (=> bm!1104 (= call!1086 call!1102)))

(declare-fun bm!1105 () Bool)

(assert (=> bm!1105 (= call!1102 (arrayContainsKey!0 (_keys!3131 lt!5941) (ite (or c!2197 c!2199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000))))

(assert (= (and d!3693 c!2263) b!20536))

(assert (= (and d!3693 (not c!2263)) b!20568))

(assert (= (and b!20536 c!2267) b!20564))

(assert (= (and b!20536 (not c!2267)) b!20562))

(assert (= (or b!20564 b!20562) bm!1093))

(assert (= (or b!20564 b!20562) bm!1085))

(assert (= (or b!20564 b!20562) bm!1096))

(assert (= (and b!20568 c!2264) b!20533))

(assert (= (and b!20568 (not c!2264)) b!20547))

(assert (= (and b!20533 c!2258) b!20543))

(assert (= (and b!20533 (not c!2258)) b!20554))

(assert (= (and b!20543 res!13498) b!20553))

(assert (= (and b!20553 res!13496) b!20542))

(assert (= (and b!20554 c!2261) b!20549))

(assert (= (and b!20554 (not c!2261)) b!20541))

(assert (= (and b!20549 res!13505) b!20534))

(assert (= (and b!20534 res!13504) b!20561))

(assert (= (and b!20541 c!2257) b!20538))

(assert (= (and b!20541 (not c!2257)) b!20555))

(assert (= (and b!20538 res!13503) b!20570))

(assert (= (and b!20570 res!13499) b!20551))

(assert (= (or b!20549 b!20538) bm!1099))

(assert (= (or b!20561 b!20551) bm!1103))

(assert (= (or b!20553 bm!1099) bm!1101))

(assert (= (or b!20543 b!20554) bm!1083))

(assert (= (and b!20547 c!2268) b!20546))

(assert (= (and b!20547 (not c!2268)) b!20558))

(assert (= (and b!20558 c!2266) b!20571))

(assert (= (and b!20558 (not c!2266)) b!20557))

(assert (= (and b!20557 c!2265) b!20544))

(assert (= (and b!20557 (not c!2265)) b!20535))

(assert (= (and b!20544 res!13501) b!20552))

(assert (= (and b!20552 res!13502) b!20567))

(assert (= (and b!20535 c!2259) b!20539))

(assert (= (and b!20535 (not c!2259)) b!20566))

(assert (= (and b!20539 res!13494) b!20548))

(assert (= (and b!20548 res!13506) b!20565))

(assert (= (and b!20566 c!2260) b!20563))

(assert (= (and b!20566 (not c!2260)) b!20569))

(assert (= (and b!20563 res!13493) b!20540))

(assert (= (and b!20540 res!13495) b!20560))

(assert (= (or b!20539 b!20563) bm!1089))

(assert (= (or b!20565 b!20560) bm!1104))

(assert (= (or b!20552 bm!1089) bm!1097))

(assert (= (or b!20544 b!20535) bm!1090))

(assert (= (or b!20546 b!20571) bm!1098))

(assert (= (or bm!1103 bm!1104) bm!1105))

(assert (= (or b!20543 b!20544) bm!1082))

(assert (= (or b!20533 b!20557) bm!1095))

(assert (= (or bm!1083 bm!1090) bm!1094))

(assert (= (or b!20554 b!20535) bm!1084))

(assert (= (or bm!1101 bm!1097) bm!1087))

(assert (= (or b!20533 b!20557) bm!1086))

(assert (= (and bm!1086 c!2262) b!20550))

(assert (= (and bm!1086 (not c!2262)) b!20537))

(assert (= (or bm!1093 b!20557) bm!1091))

(assert (= (or bm!1085 b!20537 b!20557) bm!1092))

(assert (= (or bm!1096 b!20557) bm!1102))

(assert (= (and d!3693 res!13497) b!20559))

(assert (= (and b!20559 c!2269) b!20532))

(assert (= (and b!20559 (not c!2269)) b!20556))

(assert (= (and b!20532 res!13500) b!20545))

(assert (= (or b!20532 b!20545 b!20556) bm!1088))

(assert (= (or b!20545 b!20556) bm!1100))

(declare-fun m!14377 () Bool)

(assert (=> b!20567 m!14377))

(declare-fun m!14379 () Bool)

(assert (=> b!20557 m!14379))

(declare-fun m!14381 () Bool)

(assert (=> b!20557 m!14381))

(declare-fun m!14383 () Bool)

(assert (=> b!20557 m!14383))

(assert (=> b!20557 m!14379))

(declare-fun m!14385 () Bool)

(assert (=> b!20557 m!14385))

(declare-fun m!14387 () Bool)

(assert (=> b!20557 m!14387))

(assert (=> bm!1091 m!14381))

(declare-fun m!14389 () Bool)

(assert (=> bm!1091 m!14389))

(declare-fun m!14391 () Bool)

(assert (=> bm!1100 m!14391))

(declare-fun m!14393 () Bool)

(assert (=> bm!1098 m!14393))

(declare-fun m!14395 () Bool)

(assert (=> b!20564 m!14395))

(declare-fun m!14397 () Bool)

(assert (=> bm!1092 m!14397))

(declare-fun m!14399 () Bool)

(assert (=> bm!1094 m!14399))

(declare-fun m!14401 () Bool)

(assert (=> d!3693 m!14401))

(declare-fun m!14403 () Bool)

(assert (=> d!3693 m!14403))

(declare-fun m!14405 () Bool)

(assert (=> b!20562 m!14405))

(declare-fun m!14407 () Bool)

(assert (=> bm!1102 m!14407))

(declare-fun m!14409 () Bool)

(assert (=> bm!1084 m!14409))

(declare-fun m!14411 () Bool)

(assert (=> b!20540 m!14411))

(declare-fun m!14413 () Bool)

(assert (=> bm!1088 m!14413))

(assert (=> b!20568 m!14399))

(declare-fun m!14415 () Bool)

(assert (=> bm!1105 m!14415))

(declare-fun m!14417 () Bool)

(assert (=> b!20570 m!14417))

(declare-fun m!14419 () Bool)

(assert (=> b!20534 m!14419))

(declare-fun m!14421 () Bool)

(assert (=> b!20548 m!14421))

(declare-fun m!14423 () Bool)

(assert (=> b!20545 m!14423))

(declare-fun m!14425 () Bool)

(assert (=> bm!1082 m!14425))

(declare-fun m!14427 () Bool)

(assert (=> b!20532 m!14427))

(declare-fun m!14429 () Bool)

(assert (=> bm!1087 m!14429))

(declare-fun m!14431 () Bool)

(assert (=> b!20542 m!14431))

(declare-fun m!14433 () Bool)

(assert (=> bm!1095 m!14433))

(declare-fun m!14435 () Bool)

(assert (=> bm!1086 m!14435))

(assert (=> bm!1002 d!3693))

(declare-fun b!20578 () Bool)

(declare-fun e!13438 () Bool)

(assert (=> b!20578 (= e!13438 tp_is_empty!981)))

(declare-fun b!20579 () Bool)

(declare-fun e!13439 () Bool)

(assert (=> b!20579 (= e!13439 tp_is_empty!981)))

(declare-fun condMapEmpty!949 () Bool)

(declare-fun mapDefault!949 () ValueCell!291)

(assert (=> mapNonEmpty!943 (= condMapEmpty!949 (= mapRest!943 ((as const (Array (_ BitVec 32) ValueCell!291)) mapDefault!949)))))

(declare-fun mapRes!949 () Bool)

(assert (=> mapNonEmpty!943 (= tp!3378 (and e!13439 mapRes!949))))

(declare-fun mapNonEmpty!949 () Bool)

(declare-fun tp!3388 () Bool)

(assert (=> mapNonEmpty!949 (= mapRes!949 (and tp!3388 e!13438))))

(declare-fun mapKey!949 () (_ BitVec 32))

(declare-fun mapRest!949 () (Array (_ BitVec 32) ValueCell!291))

(declare-fun mapValue!949 () ValueCell!291)

(assert (=> mapNonEmpty!949 (= mapRest!943 (store mapRest!949 mapKey!949 mapValue!949))))

(declare-fun mapIsEmpty!949 () Bool)

(assert (=> mapIsEmpty!949 mapRes!949))

(assert (= (and mapNonEmpty!943 condMapEmpty!949) mapIsEmpty!949))

(assert (= (and mapNonEmpty!943 (not condMapEmpty!949)) mapNonEmpty!949))

(assert (= (and mapNonEmpty!949 ((_ is ValueCellFull!291) mapValue!949)) b!20578))

(assert (= (and mapNonEmpty!943 ((_ is ValueCellFull!291) mapDefault!949)) b!20579))

(declare-fun m!14437 () Bool)

(assert (=> mapNonEmpty!949 m!14437))

(declare-fun b_lambda!1501 () Bool)

(assert (= b_lambda!1499 (or (and b!20329 b_free!717) b_lambda!1501)))

(declare-fun b_lambda!1503 () Bool)

(assert (= b_lambda!1497 (or (and b!20329 b_free!717) b_lambda!1503)))

(check-sat (not bm!1092) (not d!3689) (not mapNonEmpty!949) (not b_lambda!1501) (not d!3679) b_and!1399 (not bm!1062) (not b!20518) (not bm!1076) (not d!3691) (not bm!1070) (not bm!1084) (not b!20532) (not bm!1105) (not d!3687) (not b!20495) (not b!20463) (not b!20545) (not b!20493) (not b!20568) (not b!20562) (not bm!1074) (not b!20516) (not b!20517) (not bm!1081) (not bm!1067) (not b!20488) (not bm!1071) (not b!20557) (not bm!1086) (not bm!1098) (not bm!1095) (not bm!1063) (not bm!1102) tp_is_empty!981 (not b_next!717) (not bm!1088) (not d!3693) (not bm!1082) (not bm!1064) (not b!20476) (not bm!1078) (not bm!1058) (not b!20529) (not bm!1094) (not bm!1068) (not bm!1091) (not bm!1087) (not bm!1100) (not b_lambda!1503) (not bm!1060) (not b!20564) (not b!20499))
(check-sat b_and!1399 (not b_next!717))
