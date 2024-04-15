; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17288 () Bool)

(assert start!17288)

(declare-fun b!173125 () Bool)

(declare-fun b_free!4309 () Bool)

(declare-fun b_next!4309 () Bool)

(assert (=> b!173125 (= b_free!4309 (not b_next!4309))))

(declare-fun tp!15591 () Bool)

(declare-fun b_and!10723 () Bool)

(assert (=> b!173125 (= tp!15591 b_and!10723)))

(declare-fun b!173118 () Bool)

(declare-fun e!114356 () Bool)

(declare-fun tp_is_empty!4081 () Bool)

(assert (=> b!173118 (= e!114356 tp_is_empty!4081)))

(declare-fun b!173119 () Bool)

(declare-fun res!82180 () Bool)

(declare-fun e!114350 () Bool)

(assert (=> b!173119 (=> (not res!82180) (not e!114350))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173119 (= res!82180 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173120 () Bool)

(declare-fun e!114357 () Bool)

(assert (=> b!173120 (= e!114357 tp_is_empty!4081)))

(declare-fun b!173121 () Bool)

(declare-fun e!114355 () Bool)

(declare-fun e!114351 () Bool)

(assert (=> b!173121 (= e!114355 e!114351)))

(declare-fun res!82177 () Bool)

(assert (=> b!173121 (=> (not res!82177) (not e!114351))))

(declare-datatypes ((V!5089 0))(
  ( (V!5090 (val!2085 Int)) )
))
(declare-datatypes ((tuple2!3236 0))(
  ( (tuple2!3237 (_1!1629 (_ BitVec 64)) (_2!1629 V!5089)) )
))
(declare-datatypes ((List!2214 0))(
  ( (Nil!2211) (Cons!2210 (h!2827 tuple2!3236) (t!7012 List!2214)) )
))
(declare-datatypes ((ListLongMap!2155 0))(
  ( (ListLongMap!2156 (toList!1093 List!2214)) )
))
(declare-fun lt!85537 () ListLongMap!2155)

(declare-fun contains!1152 (ListLongMap!2155 (_ BitVec 64)) Bool)

(assert (=> b!173121 (= res!82177 (contains!1152 lt!85537 key!828))))

(declare-datatypes ((ValueCell!1697 0))(
  ( (ValueCellFull!1697 (v!3947 V!5089)) (EmptyCell!1697) )
))
(declare-datatypes ((array!7273 0))(
  ( (array!7274 (arr!3454 (Array (_ BitVec 32) (_ BitVec 64))) (size!3754 (_ BitVec 32))) )
))
(declare-datatypes ((array!7275 0))(
  ( (array!7276 (arr!3455 (Array (_ BitVec 32) ValueCell!1697)) (size!3755 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2302 0))(
  ( (LongMapFixedSize!2303 (defaultEntry!3597 Int) (mask!8468 (_ BitVec 32)) (extraKeys!3336 (_ BitVec 32)) (zeroValue!3438 V!5089) (minValue!3440 V!5089) (_size!1200 (_ BitVec 32)) (_keys!5437 array!7273) (_values!3580 array!7275) (_vacant!1200 (_ BitVec 32))) )
))
(declare-fun lt!85539 () LongMapFixedSize!2302)

(declare-fun map!1862 (LongMapFixedSize!2302) ListLongMap!2155)

(assert (=> b!173121 (= lt!85537 (map!1862 lt!85539))))

(declare-fun b!173123 () Bool)

(assert (=> b!173123 (= e!114350 (not e!114355))))

(declare-fun res!82179 () Bool)

(assert (=> b!173123 (=> (not res!82179) (not e!114355))))

(declare-fun valid!990 (LongMapFixedSize!2302) Bool)

(assert (=> b!173123 (= res!82179 (valid!990 lt!85539))))

(declare-fun thiss!1248 () LongMapFixedSize!2302)

(declare-fun v!309 () V!5089)

(assert (=> b!173123 (= lt!85539 (LongMapFixedSize!2303 (defaultEntry!3597 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (_size!1200 thiss!1248) (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (_vacant!1200 thiss!1248)))))

(declare-fun +!240 (ListLongMap!2155 tuple2!3236) ListLongMap!2155)

(declare-fun getCurrentListMap!731 (array!7273 array!7275 (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 (_ BitVec 32) Int) ListLongMap!2155)

(assert (=> b!173123 (= (+!240 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-datatypes ((Unit!5291 0))(
  ( (Unit!5292) )
))
(declare-fun lt!85538 () Unit!5291)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (array!7273 array!7275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 V!5089 Int) Unit!5291)

(assert (=> b!173123 (= lt!85538 (lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173124 () Bool)

(declare-fun e!114353 () Bool)

(declare-fun mapRes!6948 () Bool)

(assert (=> b!173124 (= e!114353 (and e!114356 mapRes!6948))))

(declare-fun condMapEmpty!6948 () Bool)

(declare-fun mapDefault!6948 () ValueCell!1697)

(assert (=> b!173124 (= condMapEmpty!6948 (= (arr!3455 (_values!3580 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6948)))))

(declare-fun mapIsEmpty!6948 () Bool)

(assert (=> mapIsEmpty!6948 mapRes!6948))

(declare-fun e!114354 () Bool)

(declare-fun array_inv!2229 (array!7273) Bool)

(declare-fun array_inv!2230 (array!7275) Bool)

(assert (=> b!173125 (= e!114354 (and tp!15591 tp_is_empty!4081 (array_inv!2229 (_keys!5437 thiss!1248)) (array_inv!2230 (_values!3580 thiss!1248)) e!114353))))

(declare-fun mapNonEmpty!6948 () Bool)

(declare-fun tp!15590 () Bool)

(assert (=> mapNonEmpty!6948 (= mapRes!6948 (and tp!15590 e!114357))))

(declare-fun mapKey!6948 () (_ BitVec 32))

(declare-fun mapValue!6948 () ValueCell!1697)

(declare-fun mapRest!6948 () (Array (_ BitVec 32) ValueCell!1697))

(assert (=> mapNonEmpty!6948 (= (arr!3455 (_values!3580 thiss!1248)) (store mapRest!6948 mapKey!6948 mapValue!6948))))

(declare-fun b!173122 () Bool)

(assert (=> b!173122 (= e!114351 (= lt!85537 (+!240 (map!1862 thiss!1248) (tuple2!3237 key!828 v!309))))))

(declare-fun res!82178 () Bool)

(assert (=> start!17288 (=> (not res!82178) (not e!114350))))

(assert (=> start!17288 (= res!82178 (valid!990 thiss!1248))))

(assert (=> start!17288 e!114350))

(assert (=> start!17288 e!114354))

(assert (=> start!17288 true))

(assert (=> start!17288 tp_is_empty!4081))

(assert (= (and start!17288 res!82178) b!173119))

(assert (= (and b!173119 res!82180) b!173123))

(assert (= (and b!173123 res!82179) b!173121))

(assert (= (and b!173121 res!82177) b!173122))

(assert (= (and b!173124 condMapEmpty!6948) mapIsEmpty!6948))

(assert (= (and b!173124 (not condMapEmpty!6948)) mapNonEmpty!6948))

(get-info :version)

(assert (= (and mapNonEmpty!6948 ((_ is ValueCellFull!1697) mapValue!6948)) b!173120))

(assert (= (and b!173124 ((_ is ValueCellFull!1697) mapDefault!6948)) b!173118))

(assert (= b!173125 b!173124))

(assert (= start!17288 b!173125))

(declare-fun m!201013 () Bool)

(assert (=> b!173123 m!201013))

(declare-fun m!201015 () Bool)

(assert (=> b!173123 m!201015))

(declare-fun m!201017 () Bool)

(assert (=> b!173123 m!201017))

(declare-fun m!201019 () Bool)

(assert (=> b!173123 m!201019))

(declare-fun m!201021 () Bool)

(assert (=> b!173123 m!201021))

(assert (=> b!173123 m!201013))

(declare-fun m!201023 () Bool)

(assert (=> b!173121 m!201023))

(declare-fun m!201025 () Bool)

(assert (=> b!173121 m!201025))

(declare-fun m!201027 () Bool)

(assert (=> mapNonEmpty!6948 m!201027))

(declare-fun m!201029 () Bool)

(assert (=> start!17288 m!201029))

(declare-fun m!201031 () Bool)

(assert (=> b!173122 m!201031))

(assert (=> b!173122 m!201031))

(declare-fun m!201033 () Bool)

(assert (=> b!173122 m!201033))

(declare-fun m!201035 () Bool)

(assert (=> b!173125 m!201035))

(declare-fun m!201037 () Bool)

(assert (=> b!173125 m!201037))

(check-sat (not b_next!4309) (not b!173122) (not b!173125) tp_is_empty!4081 (not b!173123) (not start!17288) (not mapNonEmpty!6948) b_and!10723 (not b!173121))
(check-sat b_and!10723 (not b_next!4309))
(get-model)

(declare-fun d!52441 () Bool)

(assert (=> d!52441 (= (array_inv!2229 (_keys!5437 thiss!1248)) (bvsge (size!3754 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173125 d!52441))

(declare-fun d!52443 () Bool)

(assert (=> d!52443 (= (array_inv!2230 (_values!3580 thiss!1248)) (bvsge (size!3755 (_values!3580 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173125 d!52443))

(declare-fun d!52445 () Bool)

(declare-fun e!114411 () Bool)

(assert (=> d!52445 e!114411))

(declare-fun res!82207 () Bool)

(assert (=> d!52445 (=> res!82207 e!114411)))

(declare-fun lt!85567 () Bool)

(assert (=> d!52445 (= res!82207 (not lt!85567))))

(declare-fun lt!85566 () Bool)

(assert (=> d!52445 (= lt!85567 lt!85566)))

(declare-fun lt!85569 () Unit!5291)

(declare-fun e!114410 () Unit!5291)

(assert (=> d!52445 (= lt!85569 e!114410)))

(declare-fun c!30873 () Bool)

(assert (=> d!52445 (= c!30873 lt!85566)))

(declare-fun containsKey!187 (List!2214 (_ BitVec 64)) Bool)

(assert (=> d!52445 (= lt!85566 (containsKey!187 (toList!1093 lt!85537) key!828))))

(assert (=> d!52445 (= (contains!1152 lt!85537 key!828) lt!85567)))

(declare-fun b!173180 () Bool)

(declare-fun lt!85568 () Unit!5291)

(assert (=> b!173180 (= e!114410 lt!85568)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!136 (List!2214 (_ BitVec 64)) Unit!5291)

(assert (=> b!173180 (= lt!85568 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85537) key!828))))

(declare-datatypes ((Option!189 0))(
  ( (Some!188 (v!3950 V!5089)) (None!187) )
))
(declare-fun isDefined!137 (Option!189) Bool)

(declare-fun getValueByKey!183 (List!2214 (_ BitVec 64)) Option!189)

(assert (=> b!173180 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85537) key!828))))

(declare-fun b!173181 () Bool)

(declare-fun Unit!5293 () Unit!5291)

(assert (=> b!173181 (= e!114410 Unit!5293)))

(declare-fun b!173182 () Bool)

(assert (=> b!173182 (= e!114411 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85537) key!828)))))

(assert (= (and d!52445 c!30873) b!173180))

(assert (= (and d!52445 (not c!30873)) b!173181))

(assert (= (and d!52445 (not res!82207)) b!173182))

(declare-fun m!201091 () Bool)

(assert (=> d!52445 m!201091))

(declare-fun m!201093 () Bool)

(assert (=> b!173180 m!201093))

(declare-fun m!201095 () Bool)

(assert (=> b!173180 m!201095))

(assert (=> b!173180 m!201095))

(declare-fun m!201097 () Bool)

(assert (=> b!173180 m!201097))

(assert (=> b!173182 m!201095))

(assert (=> b!173182 m!201095))

(assert (=> b!173182 m!201097))

(assert (=> b!173121 d!52445))

(declare-fun d!52447 () Bool)

(assert (=> d!52447 (= (map!1862 lt!85539) (getCurrentListMap!731 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun bs!7123 () Bool)

(assert (= bs!7123 d!52447))

(declare-fun m!201099 () Bool)

(assert (=> bs!7123 m!201099))

(assert (=> b!173121 d!52447))

(declare-fun d!52449 () Bool)

(declare-fun res!82214 () Bool)

(declare-fun e!114414 () Bool)

(assert (=> d!52449 (=> (not res!82214) (not e!114414))))

(declare-fun simpleValid!144 (LongMapFixedSize!2302) Bool)

(assert (=> d!52449 (= res!82214 (simpleValid!144 thiss!1248))))

(assert (=> d!52449 (= (valid!990 thiss!1248) e!114414)))

(declare-fun b!173189 () Bool)

(declare-fun res!82215 () Bool)

(assert (=> b!173189 (=> (not res!82215) (not e!114414))))

(declare-fun arrayCountValidKeys!0 (array!7273 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173189 (= res!82215 (= (arrayCountValidKeys!0 (_keys!5437 thiss!1248) #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))) (_size!1200 thiss!1248)))))

(declare-fun b!173190 () Bool)

(declare-fun res!82216 () Bool)

(assert (=> b!173190 (=> (not res!82216) (not e!114414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7273 (_ BitVec 32)) Bool)

(assert (=> b!173190 (= res!82216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5437 thiss!1248) (mask!8468 thiss!1248)))))

(declare-fun b!173191 () Bool)

(declare-datatypes ((List!2217 0))(
  ( (Nil!2214) (Cons!2213 (h!2830 (_ BitVec 64)) (t!7017 List!2217)) )
))
(declare-fun arrayNoDuplicates!0 (array!7273 (_ BitVec 32) List!2217) Bool)

(assert (=> b!173191 (= e!114414 (arrayNoDuplicates!0 (_keys!5437 thiss!1248) #b00000000000000000000000000000000 Nil!2214))))

(assert (= (and d!52449 res!82214) b!173189))

(assert (= (and b!173189 res!82215) b!173190))

(assert (= (and b!173190 res!82216) b!173191))

(declare-fun m!201101 () Bool)

(assert (=> d!52449 m!201101))

(declare-fun m!201103 () Bool)

(assert (=> b!173189 m!201103))

(declare-fun m!201105 () Bool)

(assert (=> b!173190 m!201105))

(declare-fun m!201107 () Bool)

(assert (=> b!173191 m!201107))

(assert (=> start!17288 d!52449))

(declare-fun d!52451 () Bool)

(declare-fun e!114417 () Bool)

(assert (=> d!52451 e!114417))

(declare-fun res!82222 () Bool)

(assert (=> d!52451 (=> (not res!82222) (not e!114417))))

(declare-fun lt!85579 () ListLongMap!2155)

(assert (=> d!52451 (= res!82222 (contains!1152 lt!85579 (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun lt!85581 () List!2214)

(assert (=> d!52451 (= lt!85579 (ListLongMap!2156 lt!85581))))

(declare-fun lt!85580 () Unit!5291)

(declare-fun lt!85578 () Unit!5291)

(assert (=> d!52451 (= lt!85580 lt!85578)))

(assert (=> d!52451 (= (getValueByKey!183 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))) (Some!188 (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!99 (List!2214 (_ BitVec 64) V!5089) Unit!5291)

(assert (=> d!52451 (= lt!85578 (lemmaContainsTupThenGetReturnValue!99 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun insertStrictlySorted!102 (List!2214 (_ BitVec 64) V!5089) List!2214)

(assert (=> d!52451 (= lt!85581 (insertStrictlySorted!102 (toList!1093 (map!1862 thiss!1248)) (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))

(assert (=> d!52451 (= (+!240 (map!1862 thiss!1248) (tuple2!3237 key!828 v!309)) lt!85579)))

(declare-fun b!173196 () Bool)

(declare-fun res!82221 () Bool)

(assert (=> b!173196 (=> (not res!82221) (not e!114417))))

(assert (=> b!173196 (= res!82221 (= (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))) (Some!188 (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173197 () Bool)

(declare-fun contains!1155 (List!2214 tuple2!3236) Bool)

(assert (=> b!173197 (= e!114417 (contains!1155 (toList!1093 lt!85579) (tuple2!3237 key!828 v!309)))))

(assert (= (and d!52451 res!82222) b!173196))

(assert (= (and b!173196 res!82221) b!173197))

(declare-fun m!201109 () Bool)

(assert (=> d!52451 m!201109))

(declare-fun m!201111 () Bool)

(assert (=> d!52451 m!201111))

(declare-fun m!201113 () Bool)

(assert (=> d!52451 m!201113))

(declare-fun m!201115 () Bool)

(assert (=> d!52451 m!201115))

(declare-fun m!201117 () Bool)

(assert (=> b!173196 m!201117))

(declare-fun m!201119 () Bool)

(assert (=> b!173197 m!201119))

(assert (=> b!173122 d!52451))

(declare-fun d!52453 () Bool)

(assert (=> d!52453 (= (map!1862 thiss!1248) (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun bs!7124 () Bool)

(assert (= bs!7124 d!52453))

(assert (=> bs!7124 m!201013))

(assert (=> b!173122 d!52453))

(declare-fun d!52455 () Bool)

(assert (=> d!52455 (= (+!240 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85584 () Unit!5291)

(declare-fun choose!935 (array!7273 array!7275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 V!5089 Int) Unit!5291)

(assert (=> d!52455 (= lt!85584 (choose!935 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!52455 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52455 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)) lt!85584)))

(declare-fun bs!7125 () Bool)

(assert (= bs!7125 d!52455))

(declare-fun m!201121 () Bool)

(assert (=> bs!7125 m!201121))

(declare-fun m!201123 () Bool)

(assert (=> bs!7125 m!201123))

(assert (=> bs!7125 m!201013))

(assert (=> bs!7125 m!201021))

(assert (=> bs!7125 m!201013))

(assert (=> bs!7125 m!201015))

(assert (=> b!173123 d!52455))

(declare-fun bm!17545 () Bool)

(declare-fun call!17549 () ListLongMap!2155)

(declare-fun call!17554 () ListLongMap!2155)

(assert (=> bm!17545 (= call!17549 call!17554)))

(declare-fun b!173240 () Bool)

(declare-fun res!82244 () Bool)

(declare-fun e!114446 () Bool)

(assert (=> b!173240 (=> (not res!82244) (not e!114446))))

(declare-fun e!114452 () Bool)

(assert (=> b!173240 (= res!82244 e!114452)))

(declare-fun res!82247 () Bool)

(assert (=> b!173240 (=> res!82247 e!114452)))

(declare-fun e!114455 () Bool)

(assert (=> b!173240 (= res!82247 (not e!114455))))

(declare-fun res!82241 () Bool)

(assert (=> b!173240 (=> (not res!82241) (not e!114455))))

(assert (=> b!173240 (= res!82241 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun bm!17546 () Bool)

(declare-fun call!17550 () ListLongMap!2155)

(declare-fun call!17552 () ListLongMap!2155)

(assert (=> bm!17546 (= call!17550 call!17552)))

(declare-fun b!173241 () Bool)

(declare-fun e!114456 () Bool)

(assert (=> b!173241 (= e!114452 e!114456)))

(declare-fun res!82248 () Bool)

(assert (=> b!173241 (=> (not res!82248) (not e!114456))))

(declare-fun lt!85637 () ListLongMap!2155)

(assert (=> b!173241 (= res!82248 (contains!1152 lt!85637 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun bm!17547 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!151 (array!7273 array!7275 (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 (_ BitVec 32) Int) ListLongMap!2155)

(assert (=> bm!17547 (= call!17552 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173242 () Bool)

(declare-fun e!114454 () Bool)

(declare-fun apply!130 (ListLongMap!2155 (_ BitVec 64)) V!5089)

(assert (=> b!173242 (= e!114454 (= (apply!130 lt!85637 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 thiss!1248)))))

(declare-fun b!173243 () Bool)

(declare-fun e!114450 () Unit!5291)

(declare-fun lt!85629 () Unit!5291)

(assert (=> b!173243 (= e!114450 lt!85629)))

(declare-fun lt!85649 () ListLongMap!2155)

(assert (=> b!173243 (= lt!85649 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85640 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85640 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85641 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85641 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85633 () Unit!5291)

(declare-fun addStillContains!106 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> b!173243 (= lt!85633 (addStillContains!106 lt!85649 lt!85640 (zeroValue!3438 thiss!1248) lt!85641))))

(assert (=> b!173243 (contains!1152 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85641)))

(declare-fun lt!85632 () Unit!5291)

(assert (=> b!173243 (= lt!85632 lt!85633)))

(declare-fun lt!85635 () ListLongMap!2155)

(assert (=> b!173243 (= lt!85635 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85645 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85645 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85643 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85643 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85638 () Unit!5291)

(declare-fun addApplyDifferent!106 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> b!173243 (= lt!85638 (addApplyDifferent!106 lt!85635 lt!85645 (minValue!3440 thiss!1248) lt!85643))))

(assert (=> b!173243 (= (apply!130 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!85643) (apply!130 lt!85635 lt!85643))))

(declare-fun lt!85634 () Unit!5291)

(assert (=> b!173243 (= lt!85634 lt!85638)))

(declare-fun lt!85630 () ListLongMap!2155)

(assert (=> b!173243 (= lt!85630 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85631 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85647 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85647 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85644 () Unit!5291)

(assert (=> b!173243 (= lt!85644 (addApplyDifferent!106 lt!85630 lt!85631 (zeroValue!3438 thiss!1248) lt!85647))))

(assert (=> b!173243 (= (apply!130 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85647) (apply!130 lt!85630 lt!85647))))

(declare-fun lt!85650 () Unit!5291)

(assert (=> b!173243 (= lt!85650 lt!85644)))

(declare-fun lt!85636 () ListLongMap!2155)

(assert (=> b!173243 (= lt!85636 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85642 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85642 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85648 () (_ BitVec 64))

(assert (=> b!173243 (= lt!85648 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173243 (= lt!85629 (addApplyDifferent!106 lt!85636 lt!85642 (minValue!3440 thiss!1248) lt!85648))))

(assert (=> b!173243 (= (apply!130 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85648) (apply!130 lt!85636 lt!85648))))

(declare-fun b!173244 () Bool)

(declare-fun get!1962 (ValueCell!1697 V!5089) V!5089)

(declare-fun dynLambda!464 (Int (_ BitVec 64)) V!5089)

(assert (=> b!173244 (= e!114456 (= (apply!130 lt!85637 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173245 () Bool)

(declare-fun res!82245 () Bool)

(assert (=> b!173245 (=> (not res!82245) (not e!114446))))

(declare-fun e!114444 () Bool)

(assert (=> b!173245 (= res!82245 e!114444)))

(declare-fun c!30890 () Bool)

(assert (=> b!173245 (= c!30890 (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173246 () Bool)

(declare-fun Unit!5294 () Unit!5291)

(assert (=> b!173246 (= e!114450 Unit!5294)))

(declare-fun b!173247 () Bool)

(declare-fun e!114447 () Bool)

(assert (=> b!173247 (= e!114446 e!114447)))

(declare-fun c!30889 () Bool)

(assert (=> b!173247 (= c!30889 (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173248 () Bool)

(declare-fun e!114445 () ListLongMap!2155)

(assert (=> b!173248 (= e!114445 (+!240 call!17554 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun b!173249 () Bool)

(declare-fun e!114453 () Bool)

(assert (=> b!173249 (= e!114447 e!114453)))

(declare-fun res!82242 () Bool)

(declare-fun call!17548 () Bool)

(assert (=> b!173249 (= res!82242 call!17548)))

(assert (=> b!173249 (=> (not res!82242) (not e!114453))))

(declare-fun b!173250 () Bool)

(declare-fun e!114451 () ListLongMap!2155)

(assert (=> b!173250 (= e!114451 call!17549)))

(declare-fun call!17551 () ListLongMap!2155)

(declare-fun bm!17548 () Bool)

(declare-fun c!30888 () Bool)

(declare-fun c!30891 () Bool)

(assert (=> bm!17548 (= call!17554 (+!240 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173251 () Bool)

(assert (=> b!173251 (= e!114447 (not call!17548))))

(declare-fun b!173252 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173252 (= e!114455 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173253 () Bool)

(declare-fun call!17553 () Bool)

(assert (=> b!173253 (= e!114444 (not call!17553))))

(declare-fun bm!17549 () Bool)

(assert (=> bm!17549 (= call!17553 (contains!1152 lt!85637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173254 () Bool)

(assert (=> b!173254 (= e!114453 (= (apply!130 lt!85637 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3440 thiss!1248)))))

(declare-fun d!52457 () Bool)

(assert (=> d!52457 e!114446))

(declare-fun res!82243 () Bool)

(assert (=> d!52457 (=> (not res!82243) (not e!114446))))

(assert (=> d!52457 (= res!82243 (or (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))))

(declare-fun lt!85646 () ListLongMap!2155)

(assert (=> d!52457 (= lt!85637 lt!85646)))

(declare-fun lt!85639 () Unit!5291)

(assert (=> d!52457 (= lt!85639 e!114450)))

(declare-fun c!30886 () Bool)

(declare-fun e!114448 () Bool)

(assert (=> d!52457 (= c!30886 e!114448)))

(declare-fun res!82246 () Bool)

(assert (=> d!52457 (=> (not res!82246) (not e!114448))))

(assert (=> d!52457 (= res!82246 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52457 (= lt!85646 e!114445)))

(assert (=> d!52457 (= c!30888 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52457 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52457 (= (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85637)))

(declare-fun b!173255 () Bool)

(assert (=> b!173255 (= e!114451 call!17551)))

(declare-fun b!173256 () Bool)

(assert (=> b!173256 (= e!114444 e!114454)))

(declare-fun res!82249 () Bool)

(assert (=> b!173256 (= res!82249 call!17553)))

(assert (=> b!173256 (=> (not res!82249) (not e!114454))))

(declare-fun b!173257 () Bool)

(assert (=> b!173257 (= e!114448 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173258 () Bool)

(declare-fun e!114449 () ListLongMap!2155)

(assert (=> b!173258 (= e!114445 e!114449)))

(assert (=> b!173258 (= c!30891 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17550 () Bool)

(assert (=> bm!17550 (= call!17548 (contains!1152 lt!85637 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173259 () Bool)

(assert (=> b!173259 (= e!114449 call!17549)))

(declare-fun bm!17551 () Bool)

(assert (=> bm!17551 (= call!17551 call!17550)))

(declare-fun b!173260 () Bool)

(declare-fun c!30887 () Bool)

(assert (=> b!173260 (= c!30887 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173260 (= e!114449 e!114451)))

(assert (= (and d!52457 c!30888) b!173248))

(assert (= (and d!52457 (not c!30888)) b!173258))

(assert (= (and b!173258 c!30891) b!173259))

(assert (= (and b!173258 (not c!30891)) b!173260))

(assert (= (and b!173260 c!30887) b!173250))

(assert (= (and b!173260 (not c!30887)) b!173255))

(assert (= (or b!173250 b!173255) bm!17551))

(assert (= (or b!173259 bm!17551) bm!17546))

(assert (= (or b!173259 b!173250) bm!17545))

(assert (= (or b!173248 bm!17546) bm!17547))

(assert (= (or b!173248 bm!17545) bm!17548))

(assert (= (and d!52457 res!82246) b!173257))

(assert (= (and d!52457 c!30886) b!173243))

(assert (= (and d!52457 (not c!30886)) b!173246))

(assert (= (and d!52457 res!82243) b!173240))

(assert (= (and b!173240 res!82241) b!173252))

(assert (= (and b!173240 (not res!82247)) b!173241))

(assert (= (and b!173241 res!82248) b!173244))

(assert (= (and b!173240 res!82244) b!173245))

(assert (= (and b!173245 c!30890) b!173256))

(assert (= (and b!173245 (not c!30890)) b!173253))

(assert (= (and b!173256 res!82249) b!173242))

(assert (= (or b!173256 b!173253) bm!17549))

(assert (= (and b!173245 res!82245) b!173247))

(assert (= (and b!173247 c!30889) b!173249))

(assert (= (and b!173247 (not c!30889)) b!173251))

(assert (= (and b!173249 res!82242) b!173254))

(assert (= (or b!173249 b!173251) bm!17550))

(declare-fun b_lambda!6917 () Bool)

(assert (=> (not b_lambda!6917) (not b!173244)))

(declare-fun t!7016 () Bool)

(declare-fun tb!2761 () Bool)

(assert (=> (and b!173125 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 thiss!1248)) t!7016) tb!2761))

(declare-fun result!4577 () Bool)

(assert (=> tb!2761 (= result!4577 tp_is_empty!4081)))

(assert (=> b!173244 t!7016))

(declare-fun b_and!10729 () Bool)

(assert (= b_and!10723 (and (=> t!7016 result!4577) b_and!10729)))

(declare-fun m!201125 () Bool)

(assert (=> b!173248 m!201125))

(assert (=> d!52457 m!201121))

(declare-fun m!201127 () Bool)

(assert (=> b!173254 m!201127))

(declare-fun m!201129 () Bool)

(assert (=> bm!17547 m!201129))

(declare-fun m!201131 () Bool)

(assert (=> bm!17549 m!201131))

(declare-fun m!201133 () Bool)

(assert (=> b!173252 m!201133))

(assert (=> b!173252 m!201133))

(declare-fun m!201135 () Bool)

(assert (=> b!173252 m!201135))

(declare-fun m!201137 () Bool)

(assert (=> bm!17550 m!201137))

(declare-fun m!201139 () Bool)

(assert (=> b!173243 m!201139))

(declare-fun m!201141 () Bool)

(assert (=> b!173243 m!201141))

(assert (=> b!173243 m!201133))

(declare-fun m!201143 () Bool)

(assert (=> b!173243 m!201143))

(assert (=> b!173243 m!201129))

(declare-fun m!201145 () Bool)

(assert (=> b!173243 m!201145))

(declare-fun m!201147 () Bool)

(assert (=> b!173243 m!201147))

(declare-fun m!201149 () Bool)

(assert (=> b!173243 m!201149))

(declare-fun m!201151 () Bool)

(assert (=> b!173243 m!201151))

(declare-fun m!201153 () Bool)

(assert (=> b!173243 m!201153))

(declare-fun m!201155 () Bool)

(assert (=> b!173243 m!201155))

(declare-fun m!201157 () Bool)

(assert (=> b!173243 m!201157))

(declare-fun m!201159 () Bool)

(assert (=> b!173243 m!201159))

(assert (=> b!173243 m!201151))

(assert (=> b!173243 m!201139))

(declare-fun m!201161 () Bool)

(assert (=> b!173243 m!201161))

(declare-fun m!201163 () Bool)

(assert (=> b!173243 m!201163))

(assert (=> b!173243 m!201149))

(declare-fun m!201165 () Bool)

(assert (=> b!173243 m!201165))

(assert (=> b!173243 m!201155))

(declare-fun m!201167 () Bool)

(assert (=> b!173243 m!201167))

(assert (=> b!173244 m!201133))

(assert (=> b!173244 m!201133))

(declare-fun m!201169 () Bool)

(assert (=> b!173244 m!201169))

(declare-fun m!201171 () Bool)

(assert (=> b!173244 m!201171))

(declare-fun m!201173 () Bool)

(assert (=> b!173244 m!201173))

(assert (=> b!173244 m!201171))

(assert (=> b!173244 m!201173))

(declare-fun m!201175 () Bool)

(assert (=> b!173244 m!201175))

(declare-fun m!201177 () Bool)

(assert (=> bm!17548 m!201177))

(declare-fun m!201179 () Bool)

(assert (=> b!173242 m!201179))

(assert (=> b!173241 m!201133))

(assert (=> b!173241 m!201133))

(declare-fun m!201181 () Bool)

(assert (=> b!173241 m!201181))

(assert (=> b!173257 m!201133))

(assert (=> b!173257 m!201133))

(assert (=> b!173257 m!201135))

(assert (=> b!173123 d!52457))

(declare-fun d!52459 () Bool)

(declare-fun res!82250 () Bool)

(declare-fun e!114457 () Bool)

(assert (=> d!52459 (=> (not res!82250) (not e!114457))))

(assert (=> d!52459 (= res!82250 (simpleValid!144 lt!85539))))

(assert (=> d!52459 (= (valid!990 lt!85539) e!114457)))

(declare-fun b!173263 () Bool)

(declare-fun res!82251 () Bool)

(assert (=> b!173263 (=> (not res!82251) (not e!114457))))

(assert (=> b!173263 (= res!82251 (= (arrayCountValidKeys!0 (_keys!5437 lt!85539) #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))) (_size!1200 lt!85539)))))

(declare-fun b!173264 () Bool)

(declare-fun res!82252 () Bool)

(assert (=> b!173264 (=> (not res!82252) (not e!114457))))

(assert (=> b!173264 (= res!82252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5437 lt!85539) (mask!8468 lt!85539)))))

(declare-fun b!173265 () Bool)

(assert (=> b!173265 (= e!114457 (arrayNoDuplicates!0 (_keys!5437 lt!85539) #b00000000000000000000000000000000 Nil!2214))))

(assert (= (and d!52459 res!82250) b!173263))

(assert (= (and b!173263 res!82251) b!173264))

(assert (= (and b!173264 res!82252) b!173265))

(declare-fun m!201183 () Bool)

(assert (=> d!52459 m!201183))

(declare-fun m!201185 () Bool)

(assert (=> b!173263 m!201185))

(declare-fun m!201187 () Bool)

(assert (=> b!173264 m!201187))

(declare-fun m!201189 () Bool)

(assert (=> b!173265 m!201189))

(assert (=> b!173123 d!52459))

(declare-fun d!52461 () Bool)

(declare-fun e!114458 () Bool)

(assert (=> d!52461 e!114458))

(declare-fun res!82254 () Bool)

(assert (=> d!52461 (=> (not res!82254) (not e!114458))))

(declare-fun lt!85652 () ListLongMap!2155)

(assert (=> d!52461 (= res!82254 (contains!1152 lt!85652 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85654 () List!2214)

(assert (=> d!52461 (= lt!85652 (ListLongMap!2156 lt!85654))))

(declare-fun lt!85653 () Unit!5291)

(declare-fun lt!85651 () Unit!5291)

(assert (=> d!52461 (= lt!85653 lt!85651)))

(assert (=> d!52461 (= (getValueByKey!183 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52461 (= lt!85651 (lemmaContainsTupThenGetReturnValue!99 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52461 (= lt!85654 (insertStrictlySorted!102 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52461 (= (+!240 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85652)))

(declare-fun b!173266 () Bool)

(declare-fun res!82253 () Bool)

(assert (=> b!173266 (=> (not res!82253) (not e!114458))))

(assert (=> b!173266 (= res!82253 (= (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173267 () Bool)

(assert (=> b!173267 (= e!114458 (contains!1155 (toList!1093 lt!85652) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52461 res!82254) b!173266))

(assert (= (and b!173266 res!82253) b!173267))

(declare-fun m!201191 () Bool)

(assert (=> d!52461 m!201191))

(declare-fun m!201193 () Bool)

(assert (=> d!52461 m!201193))

(declare-fun m!201195 () Bool)

(assert (=> d!52461 m!201195))

(declare-fun m!201197 () Bool)

(assert (=> d!52461 m!201197))

(declare-fun m!201199 () Bool)

(assert (=> b!173266 m!201199))

(declare-fun m!201201 () Bool)

(assert (=> b!173267 m!201201))

(assert (=> b!173123 d!52461))

(declare-fun bm!17552 () Bool)

(declare-fun call!17556 () ListLongMap!2155)

(declare-fun call!17561 () ListLongMap!2155)

(assert (=> bm!17552 (= call!17556 call!17561)))

(declare-fun b!173268 () Bool)

(declare-fun res!82258 () Bool)

(declare-fun e!114461 () Bool)

(assert (=> b!173268 (=> (not res!82258) (not e!114461))))

(declare-fun e!114467 () Bool)

(assert (=> b!173268 (= res!82258 e!114467)))

(declare-fun res!82261 () Bool)

(assert (=> b!173268 (=> res!82261 e!114467)))

(declare-fun e!114470 () Bool)

(assert (=> b!173268 (= res!82261 (not e!114470))))

(declare-fun res!82255 () Bool)

(assert (=> b!173268 (=> (not res!82255) (not e!114470))))

(assert (=> b!173268 (= res!82255 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun bm!17553 () Bool)

(declare-fun call!17557 () ListLongMap!2155)

(declare-fun call!17559 () ListLongMap!2155)

(assert (=> bm!17553 (= call!17557 call!17559)))

(declare-fun b!173269 () Bool)

(declare-fun e!114471 () Bool)

(assert (=> b!173269 (= e!114467 e!114471)))

(declare-fun res!82262 () Bool)

(assert (=> b!173269 (=> (not res!82262) (not e!114471))))

(declare-fun lt!85663 () ListLongMap!2155)

(assert (=> b!173269 (= res!82262 (contains!1152 lt!85663 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun bm!17554 () Bool)

(assert (=> bm!17554 (= call!17559 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173270 () Bool)

(declare-fun e!114469 () Bool)

(assert (=> b!173270 (= e!114469 (= (apply!130 lt!85663 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 thiss!1248)))))

(declare-fun b!173271 () Bool)

(declare-fun e!114465 () Unit!5291)

(declare-fun lt!85655 () Unit!5291)

(assert (=> b!173271 (= e!114465 lt!85655)))

(declare-fun lt!85675 () ListLongMap!2155)

(assert (=> b!173271 (= lt!85675 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85666 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85667 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85667 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85659 () Unit!5291)

(assert (=> b!173271 (= lt!85659 (addStillContains!106 lt!85675 lt!85666 (zeroValue!3438 thiss!1248) lt!85667))))

(assert (=> b!173271 (contains!1152 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!85667)))

(declare-fun lt!85658 () Unit!5291)

(assert (=> b!173271 (= lt!85658 lt!85659)))

(declare-fun lt!85661 () ListLongMap!2155)

(assert (=> b!173271 (= lt!85661 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85671 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85669 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85669 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85664 () Unit!5291)

(assert (=> b!173271 (= lt!85664 (addApplyDifferent!106 lt!85661 lt!85671 v!309 lt!85669))))

(assert (=> b!173271 (= (apply!130 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)) lt!85669) (apply!130 lt!85661 lt!85669))))

(declare-fun lt!85660 () Unit!5291)

(assert (=> b!173271 (= lt!85660 lt!85664)))

(declare-fun lt!85656 () ListLongMap!2155)

(assert (=> b!173271 (= lt!85656 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85657 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85673 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85673 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85670 () Unit!5291)

(assert (=> b!173271 (= lt!85670 (addApplyDifferent!106 lt!85656 lt!85657 (zeroValue!3438 thiss!1248) lt!85673))))

(assert (=> b!173271 (= (apply!130 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85673) (apply!130 lt!85656 lt!85673))))

(declare-fun lt!85676 () Unit!5291)

(assert (=> b!173271 (= lt!85676 lt!85670)))

(declare-fun lt!85662 () ListLongMap!2155)

(assert (=> b!173271 (= lt!85662 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85668 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85668 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85674 () (_ BitVec 64))

(assert (=> b!173271 (= lt!85674 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173271 (= lt!85655 (addApplyDifferent!106 lt!85662 lt!85668 v!309 lt!85674))))

(assert (=> b!173271 (= (apply!130 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)) lt!85674) (apply!130 lt!85662 lt!85674))))

(declare-fun b!173272 () Bool)

(assert (=> b!173272 (= e!114471 (= (apply!130 lt!85663 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173273 () Bool)

(declare-fun res!82259 () Bool)

(assert (=> b!173273 (=> (not res!82259) (not e!114461))))

(declare-fun e!114459 () Bool)

(assert (=> b!173273 (= res!82259 e!114459)))

(declare-fun c!30896 () Bool)

(assert (=> b!173273 (= c!30896 (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173274 () Bool)

(declare-fun Unit!5295 () Unit!5291)

(assert (=> b!173274 (= e!114465 Unit!5295)))

(declare-fun b!173275 () Bool)

(declare-fun e!114462 () Bool)

(assert (=> b!173275 (= e!114461 e!114462)))

(declare-fun c!30895 () Bool)

(assert (=> b!173275 (= c!30895 (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173276 () Bool)

(declare-fun e!114460 () ListLongMap!2155)

(assert (=> b!173276 (= e!114460 (+!240 call!17561 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173277 () Bool)

(declare-fun e!114468 () Bool)

(assert (=> b!173277 (= e!114462 e!114468)))

(declare-fun res!82256 () Bool)

(declare-fun call!17555 () Bool)

(assert (=> b!173277 (= res!82256 call!17555)))

(assert (=> b!173277 (=> (not res!82256) (not e!114468))))

(declare-fun b!173278 () Bool)

(declare-fun e!114466 () ListLongMap!2155)

(assert (=> b!173278 (= e!114466 call!17556)))

(declare-fun c!30897 () Bool)

(declare-fun bm!17555 () Bool)

(declare-fun call!17558 () ListLongMap!2155)

(declare-fun c!30894 () Bool)

(assert (=> bm!17555 (= call!17561 (+!240 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173279 () Bool)

(assert (=> b!173279 (= e!114462 (not call!17555))))

(declare-fun b!173280 () Bool)

(assert (=> b!173280 (= e!114470 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173281 () Bool)

(declare-fun call!17560 () Bool)

(assert (=> b!173281 (= e!114459 (not call!17560))))

(declare-fun bm!17556 () Bool)

(assert (=> bm!17556 (= call!17560 (contains!1152 lt!85663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173282 () Bool)

(assert (=> b!173282 (= e!114468 (= (apply!130 lt!85663 #b1000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun d!52463 () Bool)

(assert (=> d!52463 e!114461))

(declare-fun res!82257 () Bool)

(assert (=> d!52463 (=> (not res!82257) (not e!114461))))

(assert (=> d!52463 (= res!82257 (or (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))))

(declare-fun lt!85672 () ListLongMap!2155)

(assert (=> d!52463 (= lt!85663 lt!85672)))

(declare-fun lt!85665 () Unit!5291)

(assert (=> d!52463 (= lt!85665 e!114465)))

(declare-fun c!30892 () Bool)

(declare-fun e!114463 () Bool)

(assert (=> d!52463 (= c!30892 e!114463)))

(declare-fun res!82260 () Bool)

(assert (=> d!52463 (=> (not res!82260) (not e!114463))))

(assert (=> d!52463 (= res!82260 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52463 (= lt!85672 e!114460)))

(assert (=> d!52463 (= c!30894 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52463 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52463 (= (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85663)))

(declare-fun b!173283 () Bool)

(assert (=> b!173283 (= e!114466 call!17558)))

(declare-fun b!173284 () Bool)

(assert (=> b!173284 (= e!114459 e!114469)))

(declare-fun res!82263 () Bool)

(assert (=> b!173284 (= res!82263 call!17560)))

(assert (=> b!173284 (=> (not res!82263) (not e!114469))))

(declare-fun b!173285 () Bool)

(assert (=> b!173285 (= e!114463 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173286 () Bool)

(declare-fun e!114464 () ListLongMap!2155)

(assert (=> b!173286 (= e!114460 e!114464)))

(assert (=> b!173286 (= c!30897 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17557 () Bool)

(assert (=> bm!17557 (= call!17555 (contains!1152 lt!85663 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173287 () Bool)

(assert (=> b!173287 (= e!114464 call!17556)))

(declare-fun bm!17558 () Bool)

(assert (=> bm!17558 (= call!17558 call!17557)))

(declare-fun b!173288 () Bool)

(declare-fun c!30893 () Bool)

(assert (=> b!173288 (= c!30893 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173288 (= e!114464 e!114466)))

(assert (= (and d!52463 c!30894) b!173276))

(assert (= (and d!52463 (not c!30894)) b!173286))

(assert (= (and b!173286 c!30897) b!173287))

(assert (= (and b!173286 (not c!30897)) b!173288))

(assert (= (and b!173288 c!30893) b!173278))

(assert (= (and b!173288 (not c!30893)) b!173283))

(assert (= (or b!173278 b!173283) bm!17558))

(assert (= (or b!173287 bm!17558) bm!17553))

(assert (= (or b!173287 b!173278) bm!17552))

(assert (= (or b!173276 bm!17553) bm!17554))

(assert (= (or b!173276 bm!17552) bm!17555))

(assert (= (and d!52463 res!82260) b!173285))

(assert (= (and d!52463 c!30892) b!173271))

(assert (= (and d!52463 (not c!30892)) b!173274))

(assert (= (and d!52463 res!82257) b!173268))

(assert (= (and b!173268 res!82255) b!173280))

(assert (= (and b!173268 (not res!82261)) b!173269))

(assert (= (and b!173269 res!82262) b!173272))

(assert (= (and b!173268 res!82258) b!173273))

(assert (= (and b!173273 c!30896) b!173284))

(assert (= (and b!173273 (not c!30896)) b!173281))

(assert (= (and b!173284 res!82263) b!173270))

(assert (= (or b!173284 b!173281) bm!17556))

(assert (= (and b!173273 res!82259) b!173275))

(assert (= (and b!173275 c!30895) b!173277))

(assert (= (and b!173275 (not c!30895)) b!173279))

(assert (= (and b!173277 res!82256) b!173282))

(assert (= (or b!173277 b!173279) bm!17557))

(declare-fun b_lambda!6919 () Bool)

(assert (=> (not b_lambda!6919) (not b!173272)))

(assert (=> b!173272 t!7016))

(declare-fun b_and!10731 () Bool)

(assert (= b_and!10729 (and (=> t!7016 result!4577) b_and!10731)))

(declare-fun m!201203 () Bool)

(assert (=> b!173276 m!201203))

(assert (=> d!52463 m!201121))

(declare-fun m!201205 () Bool)

(assert (=> b!173282 m!201205))

(declare-fun m!201207 () Bool)

(assert (=> bm!17554 m!201207))

(declare-fun m!201209 () Bool)

(assert (=> bm!17556 m!201209))

(assert (=> b!173280 m!201133))

(assert (=> b!173280 m!201133))

(assert (=> b!173280 m!201135))

(declare-fun m!201211 () Bool)

(assert (=> bm!17557 m!201211))

(declare-fun m!201213 () Bool)

(assert (=> b!173271 m!201213))

(declare-fun m!201215 () Bool)

(assert (=> b!173271 m!201215))

(assert (=> b!173271 m!201133))

(declare-fun m!201217 () Bool)

(assert (=> b!173271 m!201217))

(assert (=> b!173271 m!201207))

(declare-fun m!201219 () Bool)

(assert (=> b!173271 m!201219))

(declare-fun m!201221 () Bool)

(assert (=> b!173271 m!201221))

(declare-fun m!201223 () Bool)

(assert (=> b!173271 m!201223))

(declare-fun m!201225 () Bool)

(assert (=> b!173271 m!201225))

(declare-fun m!201227 () Bool)

(assert (=> b!173271 m!201227))

(declare-fun m!201229 () Bool)

(assert (=> b!173271 m!201229))

(declare-fun m!201231 () Bool)

(assert (=> b!173271 m!201231))

(declare-fun m!201233 () Bool)

(assert (=> b!173271 m!201233))

(assert (=> b!173271 m!201225))

(assert (=> b!173271 m!201213))

(declare-fun m!201235 () Bool)

(assert (=> b!173271 m!201235))

(declare-fun m!201237 () Bool)

(assert (=> b!173271 m!201237))

(assert (=> b!173271 m!201223))

(declare-fun m!201239 () Bool)

(assert (=> b!173271 m!201239))

(assert (=> b!173271 m!201229))

(declare-fun m!201241 () Bool)

(assert (=> b!173271 m!201241))

(assert (=> b!173272 m!201133))

(assert (=> b!173272 m!201133))

(declare-fun m!201243 () Bool)

(assert (=> b!173272 m!201243))

(assert (=> b!173272 m!201171))

(assert (=> b!173272 m!201173))

(assert (=> b!173272 m!201171))

(assert (=> b!173272 m!201173))

(assert (=> b!173272 m!201175))

(declare-fun m!201245 () Bool)

(assert (=> bm!17555 m!201245))

(declare-fun m!201247 () Bool)

(assert (=> b!173270 m!201247))

(assert (=> b!173269 m!201133))

(assert (=> b!173269 m!201133))

(declare-fun m!201249 () Bool)

(assert (=> b!173269 m!201249))

(assert (=> b!173285 m!201133))

(assert (=> b!173285 m!201133))

(assert (=> b!173285 m!201135))

(assert (=> b!173123 d!52463))

(declare-fun mapNonEmpty!6957 () Bool)

(declare-fun mapRes!6957 () Bool)

(declare-fun tp!15606 () Bool)

(declare-fun e!114476 () Bool)

(assert (=> mapNonEmpty!6957 (= mapRes!6957 (and tp!15606 e!114476))))

(declare-fun mapKey!6957 () (_ BitVec 32))

(declare-fun mapRest!6957 () (Array (_ BitVec 32) ValueCell!1697))

(declare-fun mapValue!6957 () ValueCell!1697)

(assert (=> mapNonEmpty!6957 (= mapRest!6948 (store mapRest!6957 mapKey!6957 mapValue!6957))))

(declare-fun b!173296 () Bool)

(declare-fun e!114477 () Bool)

(assert (=> b!173296 (= e!114477 tp_is_empty!4081)))

(declare-fun b!173295 () Bool)

(assert (=> b!173295 (= e!114476 tp_is_empty!4081)))

(declare-fun condMapEmpty!6957 () Bool)

(declare-fun mapDefault!6957 () ValueCell!1697)

(assert (=> mapNonEmpty!6948 (= condMapEmpty!6957 (= mapRest!6948 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6957)))))

(assert (=> mapNonEmpty!6948 (= tp!15590 (and e!114477 mapRes!6957))))

(declare-fun mapIsEmpty!6957 () Bool)

(assert (=> mapIsEmpty!6957 mapRes!6957))

(assert (= (and mapNonEmpty!6948 condMapEmpty!6957) mapIsEmpty!6957))

(assert (= (and mapNonEmpty!6948 (not condMapEmpty!6957)) mapNonEmpty!6957))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1697) mapValue!6957)) b!173295))

(assert (= (and mapNonEmpty!6948 ((_ is ValueCellFull!1697) mapDefault!6957)) b!173296))

(declare-fun m!201251 () Bool)

(assert (=> mapNonEmpty!6957 m!201251))

(declare-fun b_lambda!6921 () Bool)

(assert (= b_lambda!6919 (or (and b!173125 b_free!4309) b_lambda!6921)))

(declare-fun b_lambda!6923 () Bool)

(assert (= b_lambda!6917 (or (and b!173125 b_free!4309) b_lambda!6923)))

(check-sat (not b!173241) (not bm!17554) (not d!52455) (not b!173191) (not b!173270) (not b_lambda!6923) (not b!173189) (not b!173267) (not b!173272) (not bm!17557) (not b!173190) (not b!173285) (not b!173252) (not b_next!4309) (not d!52449) (not b!173276) (not b!173257) (not b!173254) (not d!52463) (not bm!17547) (not b!173197) (not b!173243) (not mapNonEmpty!6957) (not bm!17556) (not bm!17549) b_and!10731 (not bm!17555) (not d!52445) (not b!173265) (not b!173248) (not b!173263) (not b!173196) (not b!173264) (not b!173182) (not d!52457) (not b_lambda!6921) (not b!173180) (not b!173271) tp_is_empty!4081 (not d!52451) (not b!173269) (not b!173244) (not b!173242) (not bm!17548) (not d!52461) (not d!52447) (not b!173282) (not b!173266) (not b!173280) (not d!52453) (not bm!17550) (not d!52459))
(check-sat b_and!10731 (not b_next!4309))
(get-model)

(declare-fun d!52465 () Bool)

(declare-fun e!114479 () Bool)

(assert (=> d!52465 e!114479))

(declare-fun res!82264 () Bool)

(assert (=> d!52465 (=> res!82264 e!114479)))

(declare-fun lt!85678 () Bool)

(assert (=> d!52465 (= res!82264 (not lt!85678))))

(declare-fun lt!85677 () Bool)

(assert (=> d!52465 (= lt!85678 lt!85677)))

(declare-fun lt!85680 () Unit!5291)

(declare-fun e!114478 () Unit!5291)

(assert (=> d!52465 (= lt!85680 e!114478)))

(declare-fun c!30898 () Bool)

(assert (=> d!52465 (= c!30898 lt!85677)))

(assert (=> d!52465 (= lt!85677 (containsKey!187 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52465 (= (contains!1152 lt!85637 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85678)))

(declare-fun b!173297 () Bool)

(declare-fun lt!85679 () Unit!5291)

(assert (=> b!173297 (= e!114478 lt!85679)))

(assert (=> b!173297 (= lt!85679 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173297 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173298 () Bool)

(declare-fun Unit!5296 () Unit!5291)

(assert (=> b!173298 (= e!114478 Unit!5296)))

(declare-fun b!173299 () Bool)

(assert (=> b!173299 (= e!114479 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52465 c!30898) b!173297))

(assert (= (and d!52465 (not c!30898)) b!173298))

(assert (= (and d!52465 (not res!82264)) b!173299))

(declare-fun m!201253 () Bool)

(assert (=> d!52465 m!201253))

(declare-fun m!201255 () Bool)

(assert (=> b!173297 m!201255))

(declare-fun m!201257 () Bool)

(assert (=> b!173297 m!201257))

(assert (=> b!173297 m!201257))

(declare-fun m!201259 () Bool)

(assert (=> b!173297 m!201259))

(assert (=> b!173299 m!201257))

(assert (=> b!173299 m!201257))

(assert (=> b!173299 m!201259))

(assert (=> bm!17549 d!52465))

(declare-fun d!52467 () Bool)

(assert (=> d!52467 (= (validMask!0 (mask!8468 thiss!1248)) (and (or (= (mask!8468 thiss!1248) #b00000000000000000000000000000111) (= (mask!8468 thiss!1248) #b00000000000000000000000000001111) (= (mask!8468 thiss!1248) #b00000000000000000000000000011111) (= (mask!8468 thiss!1248) #b00000000000000000000000000111111) (= (mask!8468 thiss!1248) #b00000000000000000000000001111111) (= (mask!8468 thiss!1248) #b00000000000000000000000011111111) (= (mask!8468 thiss!1248) #b00000000000000000000000111111111) (= (mask!8468 thiss!1248) #b00000000000000000000001111111111) (= (mask!8468 thiss!1248) #b00000000000000000000011111111111) (= (mask!8468 thiss!1248) #b00000000000000000000111111111111) (= (mask!8468 thiss!1248) #b00000000000000000001111111111111) (= (mask!8468 thiss!1248) #b00000000000000000011111111111111) (= (mask!8468 thiss!1248) #b00000000000000000111111111111111) (= (mask!8468 thiss!1248) #b00000000000000001111111111111111) (= (mask!8468 thiss!1248) #b00000000000000011111111111111111) (= (mask!8468 thiss!1248) #b00000000000000111111111111111111) (= (mask!8468 thiss!1248) #b00000000000001111111111111111111) (= (mask!8468 thiss!1248) #b00000000000011111111111111111111) (= (mask!8468 thiss!1248) #b00000000000111111111111111111111) (= (mask!8468 thiss!1248) #b00000000001111111111111111111111) (= (mask!8468 thiss!1248) #b00000000011111111111111111111111) (= (mask!8468 thiss!1248) #b00000000111111111111111111111111) (= (mask!8468 thiss!1248) #b00000001111111111111111111111111) (= (mask!8468 thiss!1248) #b00000011111111111111111111111111) (= (mask!8468 thiss!1248) #b00000111111111111111111111111111) (= (mask!8468 thiss!1248) #b00001111111111111111111111111111) (= (mask!8468 thiss!1248) #b00011111111111111111111111111111) (= (mask!8468 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8468 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!52457 d!52467))

(declare-fun d!52469 () Bool)

(declare-fun get!1963 (Option!189) V!5089)

(assert (=> d!52469 (= (apply!130 lt!85637 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7126 () Bool)

(assert (= bs!7126 d!52469))

(declare-fun m!201261 () Bool)

(assert (=> bs!7126 m!201261))

(assert (=> bs!7126 m!201261))

(declare-fun m!201263 () Bool)

(assert (=> bs!7126 m!201263))

(assert (=> b!173254 d!52469))

(assert (=> d!52455 d!52467))

(declare-fun d!52471 () Bool)

(assert (=> d!52471 (= (+!240 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(assert (=> d!52471 true))

(declare-fun _$8!130 () Unit!5291)

(assert (=> d!52471 (= (choose!935 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)) _$8!130)))

(declare-fun bs!7127 () Bool)

(assert (= bs!7127 d!52471))

(assert (=> bs!7127 m!201013))

(assert (=> bs!7127 m!201013))

(assert (=> bs!7127 m!201015))

(assert (=> bs!7127 m!201021))

(assert (=> d!52455 d!52471))

(assert (=> d!52455 d!52457))

(assert (=> d!52455 d!52461))

(assert (=> d!52455 d!52463))

(declare-fun d!52473 () Bool)

(declare-fun e!114480 () Bool)

(assert (=> d!52473 e!114480))

(declare-fun res!82266 () Bool)

(assert (=> d!52473 (=> (not res!82266) (not e!114480))))

(declare-fun lt!85682 () ListLongMap!2155)

(assert (=> d!52473 (= res!82266 (contains!1152 lt!85682 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85684 () List!2214)

(assert (=> d!52473 (= lt!85682 (ListLongMap!2156 lt!85684))))

(declare-fun lt!85683 () Unit!5291)

(declare-fun lt!85681 () Unit!5291)

(assert (=> d!52473 (= lt!85683 lt!85681)))

(assert (=> d!52473 (= (getValueByKey!183 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52473 (= lt!85681 (lemmaContainsTupThenGetReturnValue!99 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52473 (= lt!85684 (insertStrictlySorted!102 (toList!1093 call!17561) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52473 (= (+!240 call!17561 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85682)))

(declare-fun b!173300 () Bool)

(declare-fun res!82265 () Bool)

(assert (=> b!173300 (=> (not res!82265) (not e!114480))))

(assert (=> b!173300 (= res!82265 (= (getValueByKey!183 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173301 () Bool)

(assert (=> b!173301 (= e!114480 (contains!1155 (toList!1093 lt!85682) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52473 res!82266) b!173300))

(assert (= (and b!173300 res!82265) b!173301))

(declare-fun m!201265 () Bool)

(assert (=> d!52473 m!201265))

(declare-fun m!201267 () Bool)

(assert (=> d!52473 m!201267))

(declare-fun m!201269 () Bool)

(assert (=> d!52473 m!201269))

(declare-fun m!201271 () Bool)

(assert (=> d!52473 m!201271))

(declare-fun m!201273 () Bool)

(assert (=> b!173300 m!201273))

(declare-fun m!201275 () Bool)

(assert (=> b!173301 m!201275))

(assert (=> b!173276 d!52473))

(assert (=> d!52453 d!52457))

(declare-fun d!52475 () Bool)

(assert (=> d!52475 (= (apply!130 lt!85663 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1963 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7128 () Bool)

(assert (= bs!7128 d!52475))

(assert (=> bs!7128 m!201133))

(declare-fun m!201277 () Bool)

(assert (=> bs!7128 m!201277))

(assert (=> bs!7128 m!201277))

(declare-fun m!201279 () Bool)

(assert (=> bs!7128 m!201279))

(assert (=> b!173272 d!52475))

(declare-fun d!52477 () Bool)

(declare-fun c!30901 () Bool)

(assert (=> d!52477 (= c!30901 ((_ is ValueCellFull!1697) (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114483 () V!5089)

(assert (=> d!52477 (= (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!114483)))

(declare-fun b!173306 () Bool)

(declare-fun get!1964 (ValueCell!1697 V!5089) V!5089)

(assert (=> b!173306 (= e!114483 (get!1964 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173307 () Bool)

(declare-fun get!1965 (ValueCell!1697 V!5089) V!5089)

(assert (=> b!173307 (= e!114483 (get!1965 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52477 c!30901) b!173306))

(assert (= (and d!52477 (not c!30901)) b!173307))

(assert (=> b!173306 m!201171))

(assert (=> b!173306 m!201173))

(declare-fun m!201281 () Bool)

(assert (=> b!173306 m!201281))

(assert (=> b!173307 m!201171))

(assert (=> b!173307 m!201173))

(declare-fun m!201283 () Bool)

(assert (=> b!173307 m!201283))

(assert (=> b!173272 d!52477))

(declare-fun d!52479 () Bool)

(assert (=> d!52479 (= (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173252 d!52479))

(declare-fun b!173317 () Bool)

(declare-fun res!82276 () Bool)

(declare-fun e!114486 () Bool)

(assert (=> b!173317 (=> (not res!82276) (not e!114486))))

(declare-fun size!3760 (LongMapFixedSize!2302) (_ BitVec 32))

(assert (=> b!173317 (= res!82276 (bvsge (size!3760 lt!85539) (_size!1200 lt!85539)))))

(declare-fun b!173319 () Bool)

(assert (=> b!173319 (= e!114486 (and (bvsge (extraKeys!3336 lt!85539) #b00000000000000000000000000000000) (bvsle (extraKeys!3336 lt!85539) #b00000000000000000000000000000011) (bvsge (_vacant!1200 lt!85539) #b00000000000000000000000000000000)))))

(declare-fun b!173318 () Bool)

(declare-fun res!82278 () Bool)

(assert (=> b!173318 (=> (not res!82278) (not e!114486))))

(assert (=> b!173318 (= res!82278 (= (size!3760 lt!85539) (bvadd (_size!1200 lt!85539) (bvsdiv (bvadd (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!173316 () Bool)

(declare-fun res!82277 () Bool)

(assert (=> b!173316 (=> (not res!82277) (not e!114486))))

(assert (=> b!173316 (= res!82277 (and (= (size!3755 (_values!3580 lt!85539)) (bvadd (mask!8468 lt!85539) #b00000000000000000000000000000001)) (= (size!3754 (_keys!5437 lt!85539)) (size!3755 (_values!3580 lt!85539))) (bvsge (_size!1200 lt!85539) #b00000000000000000000000000000000) (bvsle (_size!1200 lt!85539) (bvadd (mask!8468 lt!85539) #b00000000000000000000000000000001))))))

(declare-fun d!52481 () Bool)

(declare-fun res!82275 () Bool)

(assert (=> d!52481 (=> (not res!82275) (not e!114486))))

(assert (=> d!52481 (= res!82275 (validMask!0 (mask!8468 lt!85539)))))

(assert (=> d!52481 (= (simpleValid!144 lt!85539) e!114486)))

(assert (= (and d!52481 res!82275) b!173316))

(assert (= (and b!173316 res!82277) b!173317))

(assert (= (and b!173317 res!82276) b!173318))

(assert (= (and b!173318 res!82278) b!173319))

(declare-fun m!201285 () Bool)

(assert (=> b!173317 m!201285))

(assert (=> b!173318 m!201285))

(declare-fun m!201287 () Bool)

(assert (=> d!52481 m!201287))

(assert (=> d!52459 d!52481))

(declare-fun bm!17561 () Bool)

(declare-fun call!17564 () ListLongMap!2155)

(assert (=> bm!17561 (= call!17564 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173344 () Bool)

(declare-fun e!114502 () Bool)

(declare-fun e!114504 () Bool)

(assert (=> b!173344 (= e!114502 e!114504)))

(declare-fun c!30912 () Bool)

(assert (=> b!173344 (= c!30912 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173345 () Bool)

(declare-fun e!114505 () Bool)

(assert (=> b!173345 (= e!114502 e!114505)))

(assert (=> b!173345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun res!82290 () Bool)

(declare-fun lt!85704 () ListLongMap!2155)

(assert (=> b!173345 (= res!82290 (contains!1152 lt!85704 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173345 (=> (not res!82290) (not e!114505))))

(declare-fun b!173346 () Bool)

(declare-fun e!114506 () ListLongMap!2155)

(assert (=> b!173346 (= e!114506 call!17564)))

(declare-fun b!173347 () Bool)

(declare-fun e!114501 () ListLongMap!2155)

(assert (=> b!173347 (= e!114501 (ListLongMap!2156 Nil!2211))))

(declare-fun b!173348 () Bool)

(declare-fun lt!85700 () Unit!5291)

(declare-fun lt!85703 () Unit!5291)

(assert (=> b!173348 (= lt!85700 lt!85703)))

(declare-fun lt!85705 () V!5089)

(declare-fun lt!85702 () ListLongMap!2155)

(declare-fun lt!85701 () (_ BitVec 64))

(declare-fun lt!85699 () (_ BitVec 64))

(assert (=> b!173348 (not (contains!1152 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705)) lt!85701))))

(declare-fun addStillNotContains!73 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> b!173348 (= lt!85703 (addStillNotContains!73 lt!85702 lt!85699 lt!85705 lt!85701))))

(assert (=> b!173348 (= lt!85701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173348 (= lt!85705 (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173348 (= lt!85699 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173348 (= lt!85702 call!17564)))

(assert (=> b!173348 (= e!114506 (+!240 call!17564 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173349 () Bool)

(assert (=> b!173349 (= e!114501 e!114506)))

(declare-fun c!30911 () Bool)

(assert (=> b!173349 (= c!30911 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52483 () Bool)

(declare-fun e!114503 () Bool)

(assert (=> d!52483 e!114503))

(declare-fun res!82287 () Bool)

(assert (=> d!52483 (=> (not res!82287) (not e!114503))))

(assert (=> d!52483 (= res!82287 (not (contains!1152 lt!85704 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52483 (= lt!85704 e!114501)))

(declare-fun c!30910 () Bool)

(assert (=> d!52483 (= c!30910 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52483 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52483 (= (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85704)))

(declare-fun b!173350 () Bool)

(declare-fun e!114507 () Bool)

(assert (=> b!173350 (= e!114507 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173350 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!173351 () Bool)

(declare-fun isEmpty!440 (ListLongMap!2155) Bool)

(assert (=> b!173351 (= e!114504 (isEmpty!440 lt!85704))))

(declare-fun b!173352 () Bool)

(declare-fun res!82288 () Bool)

(assert (=> b!173352 (=> (not res!82288) (not e!114503))))

(assert (=> b!173352 (= res!82288 (not (contains!1152 lt!85704 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173353 () Bool)

(assert (=> b!173353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> b!173353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173353 (= e!114505 (= (apply!130 lt!85704 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173354 () Bool)

(assert (=> b!173354 (= e!114504 (= lt!85704 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173355 () Bool)

(assert (=> b!173355 (= e!114503 e!114502)))

(declare-fun c!30913 () Bool)

(assert (=> b!173355 (= c!30913 e!114507)))

(declare-fun res!82289 () Bool)

(assert (=> b!173355 (=> (not res!82289) (not e!114507))))

(assert (=> b!173355 (= res!82289 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (= (and d!52483 c!30910) b!173347))

(assert (= (and d!52483 (not c!30910)) b!173349))

(assert (= (and b!173349 c!30911) b!173348))

(assert (= (and b!173349 (not c!30911)) b!173346))

(assert (= (or b!173348 b!173346) bm!17561))

(assert (= (and d!52483 res!82287) b!173352))

(assert (= (and b!173352 res!82288) b!173355))

(assert (= (and b!173355 res!82289) b!173350))

(assert (= (and b!173355 c!30913) b!173345))

(assert (= (and b!173355 (not c!30913)) b!173344))

(assert (= (and b!173345 res!82290) b!173353))

(assert (= (and b!173344 c!30912) b!173354))

(assert (= (and b!173344 (not c!30912)) b!173351))

(declare-fun b_lambda!6925 () Bool)

(assert (=> (not b_lambda!6925) (not b!173348)))

(assert (=> b!173348 t!7016))

(declare-fun b_and!10733 () Bool)

(assert (= b_and!10731 (and (=> t!7016 result!4577) b_and!10733)))

(declare-fun b_lambda!6927 () Bool)

(assert (=> (not b_lambda!6927) (not b!173353)))

(assert (=> b!173353 t!7016))

(declare-fun b_and!10735 () Bool)

(assert (= b_and!10733 (and (=> t!7016 result!4577) b_and!10735)))

(assert (=> b!173345 m!201133))

(assert (=> b!173345 m!201133))

(declare-fun m!201289 () Bool)

(assert (=> b!173345 m!201289))

(assert (=> b!173349 m!201133))

(assert (=> b!173349 m!201133))

(assert (=> b!173349 m!201135))

(declare-fun m!201291 () Bool)

(assert (=> bm!17561 m!201291))

(assert (=> b!173353 m!201133))

(declare-fun m!201293 () Bool)

(assert (=> b!173353 m!201293))

(assert (=> b!173353 m!201133))

(assert (=> b!173353 m!201173))

(assert (=> b!173353 m!201171))

(assert (=> b!173353 m!201171))

(assert (=> b!173353 m!201173))

(assert (=> b!173353 m!201175))

(assert (=> b!173354 m!201291))

(assert (=> b!173348 m!201133))

(assert (=> b!173348 m!201173))

(declare-fun m!201295 () Bool)

(assert (=> b!173348 m!201295))

(assert (=> b!173348 m!201171))

(assert (=> b!173348 m!201171))

(assert (=> b!173348 m!201173))

(assert (=> b!173348 m!201175))

(declare-fun m!201297 () Bool)

(assert (=> b!173348 m!201297))

(assert (=> b!173348 m!201295))

(declare-fun m!201299 () Bool)

(assert (=> b!173348 m!201299))

(declare-fun m!201301 () Bool)

(assert (=> b!173348 m!201301))

(declare-fun m!201303 () Bool)

(assert (=> d!52483 m!201303))

(assert (=> d!52483 m!201121))

(declare-fun m!201305 () Bool)

(assert (=> b!173351 m!201305))

(assert (=> b!173350 m!201133))

(assert (=> b!173350 m!201133))

(assert (=> b!173350 m!201135))

(declare-fun m!201307 () Bool)

(assert (=> b!173352 m!201307))

(assert (=> bm!17554 d!52483))

(declare-fun bm!17562 () Bool)

(declare-fun call!17566 () ListLongMap!2155)

(declare-fun call!17571 () ListLongMap!2155)

(assert (=> bm!17562 (= call!17566 call!17571)))

(declare-fun b!173356 () Bool)

(declare-fun res!82294 () Bool)

(declare-fun e!114510 () Bool)

(assert (=> b!173356 (=> (not res!82294) (not e!114510))))

(declare-fun e!114516 () Bool)

(assert (=> b!173356 (= res!82294 e!114516)))

(declare-fun res!82297 () Bool)

(assert (=> b!173356 (=> res!82297 e!114516)))

(declare-fun e!114519 () Bool)

(assert (=> b!173356 (= res!82297 (not e!114519))))

(declare-fun res!82291 () Bool)

(assert (=> b!173356 (=> (not res!82291) (not e!114519))))

(assert (=> b!173356 (= res!82291 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(declare-fun bm!17563 () Bool)

(declare-fun call!17567 () ListLongMap!2155)

(declare-fun call!17569 () ListLongMap!2155)

(assert (=> bm!17563 (= call!17567 call!17569)))

(declare-fun b!173357 () Bool)

(declare-fun e!114520 () Bool)

(assert (=> b!173357 (= e!114516 e!114520)))

(declare-fun res!82298 () Bool)

(assert (=> b!173357 (=> (not res!82298) (not e!114520))))

(declare-fun lt!85714 () ListLongMap!2155)

(assert (=> b!173357 (= res!82298 (contains!1152 lt!85714 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> b!173357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(declare-fun bm!17564 () Bool)

(assert (=> bm!17564 (= call!17569 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun b!173358 () Bool)

(declare-fun e!114518 () Bool)

(assert (=> b!173358 (= e!114518 (= (apply!130 lt!85714 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 lt!85539)))))

(declare-fun b!173359 () Bool)

(declare-fun e!114514 () Unit!5291)

(declare-fun lt!85706 () Unit!5291)

(assert (=> b!173359 (= e!114514 lt!85706)))

(declare-fun lt!85726 () ListLongMap!2155)

(assert (=> b!173359 (= lt!85726 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun lt!85717 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85718 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85718 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(declare-fun lt!85710 () Unit!5291)

(assert (=> b!173359 (= lt!85710 (addStillContains!106 lt!85726 lt!85717 (zeroValue!3438 lt!85539) lt!85718))))

(assert (=> b!173359 (contains!1152 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) lt!85718)))

(declare-fun lt!85709 () Unit!5291)

(assert (=> b!173359 (= lt!85709 lt!85710)))

(declare-fun lt!85712 () ListLongMap!2155)

(assert (=> b!173359 (= lt!85712 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun lt!85722 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85722 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85720 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85720 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(declare-fun lt!85715 () Unit!5291)

(assert (=> b!173359 (= lt!85715 (addApplyDifferent!106 lt!85712 lt!85722 (minValue!3440 lt!85539) lt!85720))))

(assert (=> b!173359 (= (apply!130 (+!240 lt!85712 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) lt!85720) (apply!130 lt!85712 lt!85720))))

(declare-fun lt!85711 () Unit!5291)

(assert (=> b!173359 (= lt!85711 lt!85715)))

(declare-fun lt!85707 () ListLongMap!2155)

(assert (=> b!173359 (= lt!85707 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun lt!85708 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85724 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85724 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(declare-fun lt!85721 () Unit!5291)

(assert (=> b!173359 (= lt!85721 (addApplyDifferent!106 lt!85707 lt!85708 (zeroValue!3438 lt!85539) lt!85724))))

(assert (=> b!173359 (= (apply!130 (+!240 lt!85707 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) lt!85724) (apply!130 lt!85707 lt!85724))))

(declare-fun lt!85727 () Unit!5291)

(assert (=> b!173359 (= lt!85727 lt!85721)))

(declare-fun lt!85713 () ListLongMap!2155)

(assert (=> b!173359 (= lt!85713 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)))))

(declare-fun lt!85719 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85725 () (_ BitVec 64))

(assert (=> b!173359 (= lt!85725 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(assert (=> b!173359 (= lt!85706 (addApplyDifferent!106 lt!85713 lt!85719 (minValue!3440 lt!85539) lt!85725))))

(assert (=> b!173359 (= (apply!130 (+!240 lt!85713 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) lt!85725) (apply!130 lt!85713 lt!85725))))

(declare-fun b!173360 () Bool)

(assert (=> b!173360 (= e!114520 (= (apply!130 lt!85714 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 lt!85539))))))

(assert (=> b!173360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(declare-fun b!173361 () Bool)

(declare-fun res!82295 () Bool)

(assert (=> b!173361 (=> (not res!82295) (not e!114510))))

(declare-fun e!114508 () Bool)

(assert (=> b!173361 (= res!82295 e!114508)))

(declare-fun c!30918 () Bool)

(assert (=> b!173361 (= c!30918 (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173362 () Bool)

(declare-fun Unit!5297 () Unit!5291)

(assert (=> b!173362 (= e!114514 Unit!5297)))

(declare-fun b!173363 () Bool)

(declare-fun e!114511 () Bool)

(assert (=> b!173363 (= e!114510 e!114511)))

(declare-fun c!30917 () Bool)

(assert (=> b!173363 (= c!30917 (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173364 () Bool)

(declare-fun e!114509 () ListLongMap!2155)

(assert (=> b!173364 (= e!114509 (+!240 call!17571 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))

(declare-fun b!173365 () Bool)

(declare-fun e!114517 () Bool)

(assert (=> b!173365 (= e!114511 e!114517)))

(declare-fun res!82292 () Bool)

(declare-fun call!17565 () Bool)

(assert (=> b!173365 (= res!82292 call!17565)))

(assert (=> b!173365 (=> (not res!82292) (not e!114517))))

(declare-fun b!173366 () Bool)

(declare-fun e!114515 () ListLongMap!2155)

(assert (=> b!173366 (= e!114515 call!17566)))

(declare-fun bm!17565 () Bool)

(declare-fun c!30916 () Bool)

(declare-fun call!17568 () ListLongMap!2155)

(declare-fun c!30919 () Bool)

(assert (=> bm!17565 (= call!17571 (+!240 (ite c!30916 call!17569 (ite c!30919 call!17567 call!17568)) (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(declare-fun b!173367 () Bool)

(assert (=> b!173367 (= e!114511 (not call!17565))))

(declare-fun b!173368 () Bool)

(assert (=> b!173368 (= e!114519 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173369 () Bool)

(declare-fun call!17570 () Bool)

(assert (=> b!173369 (= e!114508 (not call!17570))))

(declare-fun bm!17566 () Bool)

(assert (=> bm!17566 (= call!17570 (contains!1152 lt!85714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173370 () Bool)

(assert (=> b!173370 (= e!114517 (= (apply!130 lt!85714 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3440 lt!85539)))))

(declare-fun d!52485 () Bool)

(assert (=> d!52485 e!114510))

(declare-fun res!82293 () Bool)

(assert (=> d!52485 (=> (not res!82293) (not e!114510))))

(assert (=> d!52485 (= res!82293 (or (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))))

(declare-fun lt!85723 () ListLongMap!2155)

(assert (=> d!52485 (= lt!85714 lt!85723)))

(declare-fun lt!85716 () Unit!5291)

(assert (=> d!52485 (= lt!85716 e!114514)))

(declare-fun c!30914 () Bool)

(declare-fun e!114512 () Bool)

(assert (=> d!52485 (= c!30914 e!114512)))

(declare-fun res!82296 () Bool)

(assert (=> d!52485 (=> (not res!82296) (not e!114512))))

(assert (=> d!52485 (= res!82296 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52485 (= lt!85723 e!114509)))

(assert (=> d!52485 (= c!30916 (and (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52485 (validMask!0 (mask!8468 lt!85539))))

(assert (=> d!52485 (= (getCurrentListMap!731 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)) lt!85714)))

(declare-fun b!173371 () Bool)

(assert (=> b!173371 (= e!114515 call!17568)))

(declare-fun b!173372 () Bool)

(assert (=> b!173372 (= e!114508 e!114518)))

(declare-fun res!82299 () Bool)

(assert (=> b!173372 (= res!82299 call!17570)))

(assert (=> b!173372 (=> (not res!82299) (not e!114518))))

(declare-fun b!173373 () Bool)

(assert (=> b!173373 (= e!114512 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173374 () Bool)

(declare-fun e!114513 () ListLongMap!2155)

(assert (=> b!173374 (= e!114509 e!114513)))

(assert (=> b!173374 (= c!30919 (and (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17567 () Bool)

(assert (=> bm!17567 (= call!17565 (contains!1152 lt!85714 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173375 () Bool)

(assert (=> b!173375 (= e!114513 call!17566)))

(declare-fun bm!17568 () Bool)

(assert (=> bm!17568 (= call!17568 call!17567)))

(declare-fun b!173376 () Bool)

(declare-fun c!30915 () Bool)

(assert (=> b!173376 (= c!30915 (and (not (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173376 (= e!114513 e!114515)))

(assert (= (and d!52485 c!30916) b!173364))

(assert (= (and d!52485 (not c!30916)) b!173374))

(assert (= (and b!173374 c!30919) b!173375))

(assert (= (and b!173374 (not c!30919)) b!173376))

(assert (= (and b!173376 c!30915) b!173366))

(assert (= (and b!173376 (not c!30915)) b!173371))

(assert (= (or b!173366 b!173371) bm!17568))

(assert (= (or b!173375 bm!17568) bm!17563))

(assert (= (or b!173375 b!173366) bm!17562))

(assert (= (or b!173364 bm!17563) bm!17564))

(assert (= (or b!173364 bm!17562) bm!17565))

(assert (= (and d!52485 res!82296) b!173373))

(assert (= (and d!52485 c!30914) b!173359))

(assert (= (and d!52485 (not c!30914)) b!173362))

(assert (= (and d!52485 res!82293) b!173356))

(assert (= (and b!173356 res!82291) b!173368))

(assert (= (and b!173356 (not res!82297)) b!173357))

(assert (= (and b!173357 res!82298) b!173360))

(assert (= (and b!173356 res!82294) b!173361))

(assert (= (and b!173361 c!30918) b!173372))

(assert (= (and b!173361 (not c!30918)) b!173369))

(assert (= (and b!173372 res!82299) b!173358))

(assert (= (or b!173372 b!173369) bm!17566))

(assert (= (and b!173361 res!82295) b!173363))

(assert (= (and b!173363 c!30917) b!173365))

(assert (= (and b!173363 (not c!30917)) b!173367))

(assert (= (and b!173365 res!82292) b!173370))

(assert (= (or b!173365 b!173367) bm!17567))

(declare-fun b_lambda!6929 () Bool)

(assert (=> (not b_lambda!6929) (not b!173360)))

(declare-fun t!7019 () Bool)

(declare-fun tb!2763 () Bool)

(assert (=> (and b!173125 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 lt!85539)) t!7019) tb!2763))

(declare-fun result!4583 () Bool)

(assert (=> tb!2763 (= result!4583 tp_is_empty!4081)))

(assert (=> b!173360 t!7019))

(declare-fun b_and!10737 () Bool)

(assert (= b_and!10735 (and (=> t!7019 result!4583) b_and!10737)))

(declare-fun m!201309 () Bool)

(assert (=> b!173364 m!201309))

(assert (=> d!52485 m!201287))

(declare-fun m!201311 () Bool)

(assert (=> b!173370 m!201311))

(declare-fun m!201313 () Bool)

(assert (=> bm!17564 m!201313))

(declare-fun m!201315 () Bool)

(assert (=> bm!17566 m!201315))

(declare-fun m!201317 () Bool)

(assert (=> b!173368 m!201317))

(assert (=> b!173368 m!201317))

(declare-fun m!201319 () Bool)

(assert (=> b!173368 m!201319))

(declare-fun m!201321 () Bool)

(assert (=> bm!17567 m!201321))

(declare-fun m!201323 () Bool)

(assert (=> b!173359 m!201323))

(declare-fun m!201325 () Bool)

(assert (=> b!173359 m!201325))

(assert (=> b!173359 m!201317))

(declare-fun m!201327 () Bool)

(assert (=> b!173359 m!201327))

(assert (=> b!173359 m!201313))

(declare-fun m!201329 () Bool)

(assert (=> b!173359 m!201329))

(declare-fun m!201331 () Bool)

(assert (=> b!173359 m!201331))

(declare-fun m!201333 () Bool)

(assert (=> b!173359 m!201333))

(declare-fun m!201335 () Bool)

(assert (=> b!173359 m!201335))

(declare-fun m!201337 () Bool)

(assert (=> b!173359 m!201337))

(declare-fun m!201339 () Bool)

(assert (=> b!173359 m!201339))

(declare-fun m!201341 () Bool)

(assert (=> b!173359 m!201341))

(declare-fun m!201343 () Bool)

(assert (=> b!173359 m!201343))

(assert (=> b!173359 m!201335))

(assert (=> b!173359 m!201323))

(declare-fun m!201345 () Bool)

(assert (=> b!173359 m!201345))

(declare-fun m!201347 () Bool)

(assert (=> b!173359 m!201347))

(assert (=> b!173359 m!201333))

(declare-fun m!201349 () Bool)

(assert (=> b!173359 m!201349))

(assert (=> b!173359 m!201339))

(declare-fun m!201351 () Bool)

(assert (=> b!173359 m!201351))

(assert (=> b!173360 m!201317))

(assert (=> b!173360 m!201317))

(declare-fun m!201353 () Bool)

(assert (=> b!173360 m!201353))

(declare-fun m!201355 () Bool)

(assert (=> b!173360 m!201355))

(declare-fun m!201357 () Bool)

(assert (=> b!173360 m!201357))

(assert (=> b!173360 m!201355))

(assert (=> b!173360 m!201357))

(declare-fun m!201359 () Bool)

(assert (=> b!173360 m!201359))

(declare-fun m!201361 () Bool)

(assert (=> bm!17565 m!201361))

(declare-fun m!201363 () Bool)

(assert (=> b!173358 m!201363))

(assert (=> b!173357 m!201317))

(assert (=> b!173357 m!201317))

(declare-fun m!201365 () Bool)

(assert (=> b!173357 m!201365))

(assert (=> b!173373 m!201317))

(assert (=> b!173373 m!201317))

(assert (=> b!173373 m!201319))

(assert (=> d!52447 d!52485))

(declare-fun d!52487 () Bool)

(declare-fun e!114522 () Bool)

(assert (=> d!52487 e!114522))

(declare-fun res!82300 () Bool)

(assert (=> d!52487 (=> res!82300 e!114522)))

(declare-fun lt!85729 () Bool)

(assert (=> d!52487 (= res!82300 (not lt!85729))))

(declare-fun lt!85728 () Bool)

(assert (=> d!52487 (= lt!85729 lt!85728)))

(declare-fun lt!85731 () Unit!5291)

(declare-fun e!114521 () Unit!5291)

(assert (=> d!52487 (= lt!85731 e!114521)))

(declare-fun c!30920 () Bool)

(assert (=> d!52487 (= c!30920 lt!85728)))

(assert (=> d!52487 (= lt!85728 (containsKey!187 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (=> d!52487 (= (contains!1152 lt!85579 (_1!1629 (tuple2!3237 key!828 v!309))) lt!85729)))

(declare-fun b!173377 () Bool)

(declare-fun lt!85730 () Unit!5291)

(assert (=> b!173377 (= e!114521 lt!85730)))

(assert (=> b!173377 (= lt!85730 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (=> b!173377 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173378 () Bool)

(declare-fun Unit!5298 () Unit!5291)

(assert (=> b!173378 (= e!114521 Unit!5298)))

(declare-fun b!173379 () Bool)

(assert (=> b!173379 (= e!114522 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (= (and d!52487 c!30920) b!173377))

(assert (= (and d!52487 (not c!30920)) b!173378))

(assert (= (and d!52487 (not res!82300)) b!173379))

(declare-fun m!201367 () Bool)

(assert (=> d!52487 m!201367))

(declare-fun m!201369 () Bool)

(assert (=> b!173377 m!201369))

(assert (=> b!173377 m!201117))

(assert (=> b!173377 m!201117))

(declare-fun m!201371 () Bool)

(assert (=> b!173377 m!201371))

(assert (=> b!173379 m!201117))

(assert (=> b!173379 m!201117))

(assert (=> b!173379 m!201371))

(assert (=> d!52451 d!52487))

(declare-fun b!173389 () Bool)

(declare-fun e!114527 () Option!189)

(declare-fun e!114528 () Option!189)

(assert (=> b!173389 (= e!114527 e!114528)))

(declare-fun c!30926 () Bool)

(assert (=> b!173389 (= c!30926 (and ((_ is Cons!2210) lt!85581) (not (= (_1!1629 (h!2827 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun b!173390 () Bool)

(assert (=> b!173390 (= e!114528 (getValueByKey!183 (t!7012 lt!85581) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173388 () Bool)

(assert (=> b!173388 (= e!114527 (Some!188 (_2!1629 (h!2827 lt!85581))))))

(declare-fun d!52489 () Bool)

(declare-fun c!30925 () Bool)

(assert (=> d!52489 (= c!30925 (and ((_ is Cons!2210) lt!85581) (= (_1!1629 (h!2827 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52489 (= (getValueByKey!183 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))) e!114527)))

(declare-fun b!173391 () Bool)

(assert (=> b!173391 (= e!114528 None!187)))

(assert (= (and d!52489 c!30925) b!173388))

(assert (= (and d!52489 (not c!30925)) b!173389))

(assert (= (and b!173389 c!30926) b!173390))

(assert (= (and b!173389 (not c!30926)) b!173391))

(declare-fun m!201373 () Bool)

(assert (=> b!173390 m!201373))

(assert (=> d!52451 d!52489))

(declare-fun d!52491 () Bool)

(assert (=> d!52491 (= (getValueByKey!183 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))) (Some!188 (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun lt!85734 () Unit!5291)

(declare-fun choose!936 (List!2214 (_ BitVec 64) V!5089) Unit!5291)

(assert (=> d!52491 (= lt!85734 (choose!936 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun e!114531 () Bool)

(assert (=> d!52491 e!114531))

(declare-fun res!82305 () Bool)

(assert (=> d!52491 (=> (not res!82305) (not e!114531))))

(declare-fun isStrictlySorted!327 (List!2214) Bool)

(assert (=> d!52491 (= res!82305 (isStrictlySorted!327 lt!85581))))

(assert (=> d!52491 (= (lemmaContainsTupThenGetReturnValue!99 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))) lt!85734)))

(declare-fun b!173396 () Bool)

(declare-fun res!82306 () Bool)

(assert (=> b!173396 (=> (not res!82306) (not e!114531))))

(assert (=> b!173396 (= res!82306 (containsKey!187 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173397 () Bool)

(assert (=> b!173397 (= e!114531 (contains!1155 lt!85581 (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(assert (= (and d!52491 res!82305) b!173396))

(assert (= (and b!173396 res!82306) b!173397))

(assert (=> d!52491 m!201111))

(declare-fun m!201375 () Bool)

(assert (=> d!52491 m!201375))

(declare-fun m!201377 () Bool)

(assert (=> d!52491 m!201377))

(declare-fun m!201379 () Bool)

(assert (=> b!173396 m!201379))

(declare-fun m!201381 () Bool)

(assert (=> b!173397 m!201381))

(assert (=> d!52451 d!52491))

(declare-fun b!173418 () Bool)

(declare-fun e!114544 () List!2214)

(declare-fun call!17579 () List!2214)

(assert (=> b!173418 (= e!114544 call!17579)))

(declare-fun b!173419 () Bool)

(declare-fun res!82312 () Bool)

(declare-fun e!114542 () Bool)

(assert (=> b!173419 (=> (not res!82312) (not e!114542))))

(declare-fun lt!85737 () List!2214)

(assert (=> b!173419 (= res!82312 (containsKey!187 lt!85737 (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun e!114546 () List!2214)

(declare-fun b!173420 () Bool)

(assert (=> b!173420 (= e!114546 (insertStrictlySorted!102 (t!7012 (toList!1093 (map!1862 thiss!1248))) (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173421 () Bool)

(assert (=> b!173421 (= e!114542 (contains!1155 lt!85737 (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun c!30937 () Bool)

(declare-fun b!173422 () Bool)

(declare-fun c!30936 () Bool)

(assert (=> b!173422 (= e!114546 (ite c!30937 (t!7012 (toList!1093 (map!1862 thiss!1248))) (ite c!30936 (Cons!2210 (h!2827 (toList!1093 (map!1862 thiss!1248))) (t!7012 (toList!1093 (map!1862 thiss!1248)))) Nil!2211)))))

(declare-fun call!17578 () List!2214)

(declare-fun bm!17575 () Bool)

(declare-fun c!30938 () Bool)

(declare-fun $colon$colon!97 (List!2214 tuple2!3236) List!2214)

(assert (=> bm!17575 (= call!17578 ($colon$colon!97 e!114546 (ite c!30938 (h!2827 (toList!1093 (map!1862 thiss!1248))) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun c!30935 () Bool)

(assert (=> bm!17575 (= c!30935 c!30938)))

(declare-fun b!173423 () Bool)

(assert (=> b!173423 (= c!30936 (and ((_ is Cons!2210) (toList!1093 (map!1862 thiss!1248))) (bvsgt (_1!1629 (h!2827 (toList!1093 (map!1862 thiss!1248)))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun e!114545 () List!2214)

(assert (=> b!173423 (= e!114545 e!114544)))

(declare-fun b!173424 () Bool)

(declare-fun e!114543 () List!2214)

(assert (=> b!173424 (= e!114543 call!17578)))

(declare-fun d!52493 () Bool)

(assert (=> d!52493 e!114542))

(declare-fun res!82311 () Bool)

(assert (=> d!52493 (=> (not res!82311) (not e!114542))))

(assert (=> d!52493 (= res!82311 (isStrictlySorted!327 lt!85737))))

(assert (=> d!52493 (= lt!85737 e!114543)))

(assert (=> d!52493 (= c!30938 (and ((_ is Cons!2210) (toList!1093 (map!1862 thiss!1248))) (bvslt (_1!1629 (h!2827 (toList!1093 (map!1862 thiss!1248)))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52493 (isStrictlySorted!327 (toList!1093 (map!1862 thiss!1248)))))

(assert (=> d!52493 (= (insertStrictlySorted!102 (toList!1093 (map!1862 thiss!1248)) (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))) lt!85737)))

(declare-fun bm!17576 () Bool)

(declare-fun call!17580 () List!2214)

(assert (=> bm!17576 (= call!17579 call!17580)))

(declare-fun b!173425 () Bool)

(assert (=> b!173425 (= e!114544 call!17579)))

(declare-fun bm!17577 () Bool)

(assert (=> bm!17577 (= call!17580 call!17578)))

(declare-fun b!173426 () Bool)

(assert (=> b!173426 (= e!114543 e!114545)))

(assert (=> b!173426 (= c!30937 (and ((_ is Cons!2210) (toList!1093 (map!1862 thiss!1248))) (= (_1!1629 (h!2827 (toList!1093 (map!1862 thiss!1248)))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173427 () Bool)

(assert (=> b!173427 (= e!114545 call!17580)))

(assert (= (and d!52493 c!30938) b!173424))

(assert (= (and d!52493 (not c!30938)) b!173426))

(assert (= (and b!173426 c!30937) b!173427))

(assert (= (and b!173426 (not c!30937)) b!173423))

(assert (= (and b!173423 c!30936) b!173418))

(assert (= (and b!173423 (not c!30936)) b!173425))

(assert (= (or b!173418 b!173425) bm!17576))

(assert (= (or b!173427 bm!17576) bm!17577))

(assert (= (or b!173424 bm!17577) bm!17575))

(assert (= (and bm!17575 c!30935) b!173420))

(assert (= (and bm!17575 (not c!30935)) b!173422))

(assert (= (and d!52493 res!82311) b!173419))

(assert (= (and b!173419 res!82312) b!173421))

(declare-fun m!201383 () Bool)

(assert (=> d!52493 m!201383))

(declare-fun m!201385 () Bool)

(assert (=> d!52493 m!201385))

(declare-fun m!201387 () Bool)

(assert (=> b!173421 m!201387))

(declare-fun m!201389 () Bool)

(assert (=> b!173420 m!201389))

(declare-fun m!201391 () Bool)

(assert (=> bm!17575 m!201391))

(declare-fun m!201393 () Bool)

(assert (=> b!173419 m!201393))

(assert (=> d!52451 d!52493))

(declare-fun d!52495 () Bool)

(declare-fun e!114548 () Bool)

(assert (=> d!52495 e!114548))

(declare-fun res!82313 () Bool)

(assert (=> d!52495 (=> res!82313 e!114548)))

(declare-fun lt!85739 () Bool)

(assert (=> d!52495 (= res!82313 (not lt!85739))))

(declare-fun lt!85738 () Bool)

(assert (=> d!52495 (= lt!85739 lt!85738)))

(declare-fun lt!85741 () Unit!5291)

(declare-fun e!114547 () Unit!5291)

(assert (=> d!52495 (= lt!85741 e!114547)))

(declare-fun c!30939 () Bool)

(assert (=> d!52495 (= c!30939 lt!85738)))

(assert (=> d!52495 (= lt!85738 (containsKey!187 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52495 (= (contains!1152 lt!85652 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85739)))

(declare-fun b!173428 () Bool)

(declare-fun lt!85740 () Unit!5291)

(assert (=> b!173428 (= e!114547 lt!85740)))

(assert (=> b!173428 (= lt!85740 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!173428 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173429 () Bool)

(declare-fun Unit!5299 () Unit!5291)

(assert (=> b!173429 (= e!114547 Unit!5299)))

(declare-fun b!173430 () Bool)

(assert (=> b!173430 (= e!114548 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52495 c!30939) b!173428))

(assert (= (and d!52495 (not c!30939)) b!173429))

(assert (= (and d!52495 (not res!82313)) b!173430))

(declare-fun m!201395 () Bool)

(assert (=> d!52495 m!201395))

(declare-fun m!201397 () Bool)

(assert (=> b!173428 m!201397))

(assert (=> b!173428 m!201199))

(assert (=> b!173428 m!201199))

(declare-fun m!201399 () Bool)

(assert (=> b!173428 m!201399))

(assert (=> b!173430 m!201199))

(assert (=> b!173430 m!201199))

(assert (=> b!173430 m!201399))

(assert (=> d!52461 d!52495))

(declare-fun b!173432 () Bool)

(declare-fun e!114549 () Option!189)

(declare-fun e!114550 () Option!189)

(assert (=> b!173432 (= e!114549 e!114550)))

(declare-fun c!30941 () Bool)

(assert (=> b!173432 (= c!30941 (and ((_ is Cons!2210) lt!85654) (not (= (_1!1629 (h!2827 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173433 () Bool)

(assert (=> b!173433 (= e!114550 (getValueByKey!183 (t!7012 lt!85654) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173431 () Bool)

(assert (=> b!173431 (= e!114549 (Some!188 (_2!1629 (h!2827 lt!85654))))))

(declare-fun d!52497 () Bool)

(declare-fun c!30940 () Bool)

(assert (=> d!52497 (= c!30940 (and ((_ is Cons!2210) lt!85654) (= (_1!1629 (h!2827 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52497 (= (getValueByKey!183 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114549)))

(declare-fun b!173434 () Bool)

(assert (=> b!173434 (= e!114550 None!187)))

(assert (= (and d!52497 c!30940) b!173431))

(assert (= (and d!52497 (not c!30940)) b!173432))

(assert (= (and b!173432 c!30941) b!173433))

(assert (= (and b!173432 (not c!30941)) b!173434))

(declare-fun m!201401 () Bool)

(assert (=> b!173433 m!201401))

(assert (=> d!52461 d!52497))

(declare-fun d!52499 () Bool)

(assert (=> d!52499 (= (getValueByKey!183 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85742 () Unit!5291)

(assert (=> d!52499 (= lt!85742 (choose!936 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114551 () Bool)

(assert (=> d!52499 e!114551))

(declare-fun res!82314 () Bool)

(assert (=> d!52499 (=> (not res!82314) (not e!114551))))

(assert (=> d!52499 (= res!82314 (isStrictlySorted!327 lt!85654))))

(assert (=> d!52499 (= (lemmaContainsTupThenGetReturnValue!99 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85742)))

(declare-fun b!173435 () Bool)

(declare-fun res!82315 () Bool)

(assert (=> b!173435 (=> (not res!82315) (not e!114551))))

(assert (=> b!173435 (= res!82315 (containsKey!187 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173436 () Bool)

(assert (=> b!173436 (= e!114551 (contains!1155 lt!85654 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52499 res!82314) b!173435))

(assert (= (and b!173435 res!82315) b!173436))

(assert (=> d!52499 m!201193))

(declare-fun m!201403 () Bool)

(assert (=> d!52499 m!201403))

(declare-fun m!201405 () Bool)

(assert (=> d!52499 m!201405))

(declare-fun m!201407 () Bool)

(assert (=> b!173435 m!201407))

(declare-fun m!201409 () Bool)

(assert (=> b!173436 m!201409))

(assert (=> d!52461 d!52499))

(declare-fun b!173437 () Bool)

(declare-fun e!114554 () List!2214)

(declare-fun call!17582 () List!2214)

(assert (=> b!173437 (= e!114554 call!17582)))

(declare-fun b!173438 () Bool)

(declare-fun res!82317 () Bool)

(declare-fun e!114552 () Bool)

(assert (=> b!173438 (=> (not res!82317) (not e!114552))))

(declare-fun lt!85743 () List!2214)

(assert (=> b!173438 (= res!82317 (containsKey!187 lt!85743 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173439 () Bool)

(declare-fun e!114556 () List!2214)

(assert (=> b!173439 (= e!114556 (insertStrictlySorted!102 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173440 () Bool)

(assert (=> b!173440 (= e!114552 (contains!1155 lt!85743 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!30944 () Bool)

(declare-fun c!30943 () Bool)

(declare-fun b!173441 () Bool)

(assert (=> b!173441 (= e!114556 (ite c!30944 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (ite c!30943 (Cons!2210 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) Nil!2211)))))

(declare-fun c!30945 () Bool)

(declare-fun call!17581 () List!2214)

(declare-fun bm!17578 () Bool)

(assert (=> bm!17578 (= call!17581 ($colon$colon!97 e!114556 (ite c!30945 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30942 () Bool)

(assert (=> bm!17578 (= c!30942 c!30945)))

(declare-fun b!173442 () Bool)

(assert (=> b!173442 (= c!30943 (and ((_ is Cons!2210) (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (bvsgt (_1!1629 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114555 () List!2214)

(assert (=> b!173442 (= e!114555 e!114554)))

(declare-fun b!173443 () Bool)

(declare-fun e!114553 () List!2214)

(assert (=> b!173443 (= e!114553 call!17581)))

(declare-fun d!52501 () Bool)

(assert (=> d!52501 e!114552))

(declare-fun res!82316 () Bool)

(assert (=> d!52501 (=> (not res!82316) (not e!114552))))

(assert (=> d!52501 (= res!82316 (isStrictlySorted!327 lt!85743))))

(assert (=> d!52501 (= lt!85743 e!114553)))

(assert (=> d!52501 (= c!30945 (and ((_ is Cons!2210) (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (bvslt (_1!1629 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52501 (isStrictlySorted!327 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))

(assert (=> d!52501 (= (insertStrictlySorted!102 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85743)))

(declare-fun bm!17579 () Bool)

(declare-fun call!17583 () List!2214)

(assert (=> bm!17579 (= call!17582 call!17583)))

(declare-fun b!173444 () Bool)

(assert (=> b!173444 (= e!114554 call!17582)))

(declare-fun bm!17580 () Bool)

(assert (=> bm!17580 (= call!17583 call!17581)))

(declare-fun b!173445 () Bool)

(assert (=> b!173445 (= e!114553 e!114555)))

(assert (=> b!173445 (= c!30944 (and ((_ is Cons!2210) (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (= (_1!1629 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173446 () Bool)

(assert (=> b!173446 (= e!114555 call!17583)))

(assert (= (and d!52501 c!30945) b!173443))

(assert (= (and d!52501 (not c!30945)) b!173445))

(assert (= (and b!173445 c!30944) b!173446))

(assert (= (and b!173445 (not c!30944)) b!173442))

(assert (= (and b!173442 c!30943) b!173437))

(assert (= (and b!173442 (not c!30943)) b!173444))

(assert (= (or b!173437 b!173444) bm!17579))

(assert (= (or b!173446 bm!17579) bm!17580))

(assert (= (or b!173443 bm!17580) bm!17578))

(assert (= (and bm!17578 c!30942) b!173439))

(assert (= (and bm!17578 (not c!30942)) b!173441))

(assert (= (and d!52501 res!82316) b!173438))

(assert (= (and b!173438 res!82317) b!173440))

(declare-fun m!201411 () Bool)

(assert (=> d!52501 m!201411))

(declare-fun m!201413 () Bool)

(assert (=> d!52501 m!201413))

(declare-fun m!201415 () Bool)

(assert (=> b!173440 m!201415))

(declare-fun m!201417 () Bool)

(assert (=> b!173439 m!201417))

(declare-fun m!201419 () Bool)

(assert (=> bm!17578 m!201419))

(declare-fun m!201421 () Bool)

(assert (=> b!173438 m!201421))

(assert (=> d!52461 d!52501))

(declare-fun d!52503 () Bool)

(assert (=> d!52503 (= (apply!130 lt!85663 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7129 () Bool)

(assert (= bs!7129 d!52503))

(declare-fun m!201423 () Bool)

(assert (=> bs!7129 m!201423))

(assert (=> bs!7129 m!201423))

(declare-fun m!201425 () Bool)

(assert (=> bs!7129 m!201425))

(assert (=> b!173270 d!52503))

(declare-fun d!52505 () Bool)

(declare-fun e!114557 () Bool)

(assert (=> d!52505 e!114557))

(declare-fun res!82319 () Bool)

(assert (=> d!52505 (=> (not res!82319) (not e!114557))))

(declare-fun lt!85745 () ListLongMap!2155)

(assert (=> d!52505 (= res!82319 (contains!1152 lt!85745 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun lt!85747 () List!2214)

(assert (=> d!52505 (= lt!85745 (ListLongMap!2156 lt!85747))))

(declare-fun lt!85746 () Unit!5291)

(declare-fun lt!85744 () Unit!5291)

(assert (=> d!52505 (= lt!85746 lt!85744)))

(assert (=> d!52505 (= (getValueByKey!183 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!188 (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52505 (= lt!85744 (lemmaContainsTupThenGetReturnValue!99 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52505 (= lt!85747 (insertStrictlySorted!102 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52505 (= (+!240 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!85745)))

(declare-fun b!173447 () Bool)

(declare-fun res!82318 () Bool)

(assert (=> b!173447 (=> (not res!82318) (not e!114557))))

(assert (=> b!173447 (= res!82318 (= (getValueByKey!183 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!188 (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173448 () Bool)

(assert (=> b!173448 (= e!114557 (contains!1155 (toList!1093 lt!85745) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (= (and d!52505 res!82319) b!173447))

(assert (= (and b!173447 res!82318) b!173448))

(declare-fun m!201427 () Bool)

(assert (=> d!52505 m!201427))

(declare-fun m!201429 () Bool)

(assert (=> d!52505 m!201429))

(declare-fun m!201431 () Bool)

(assert (=> d!52505 m!201431))

(declare-fun m!201433 () Bool)

(assert (=> d!52505 m!201433))

(declare-fun m!201435 () Bool)

(assert (=> b!173447 m!201435))

(declare-fun m!201437 () Bool)

(assert (=> b!173448 m!201437))

(assert (=> bm!17548 d!52505))

(assert (=> d!52463 d!52467))

(declare-fun d!52507 () Bool)

(declare-fun e!114558 () Bool)

(assert (=> d!52507 e!114558))

(declare-fun res!82321 () Bool)

(assert (=> d!52507 (=> (not res!82321) (not e!114558))))

(declare-fun lt!85749 () ListLongMap!2155)

(assert (=> d!52507 (= res!82321 (contains!1152 lt!85749 (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun lt!85751 () List!2214)

(assert (=> d!52507 (= lt!85749 (ListLongMap!2156 lt!85751))))

(declare-fun lt!85750 () Unit!5291)

(declare-fun lt!85748 () Unit!5291)

(assert (=> d!52507 (= lt!85750 lt!85748)))

(assert (=> d!52507 (= (getValueByKey!183 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(assert (=> d!52507 (= lt!85748 (lemmaContainsTupThenGetReturnValue!99 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(assert (=> d!52507 (= lt!85751 (insertStrictlySorted!102 (toList!1093 lt!85662) (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(assert (=> d!52507 (= (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)) lt!85749)))

(declare-fun b!173449 () Bool)

(declare-fun res!82320 () Bool)

(assert (=> b!173449 (=> (not res!82320) (not e!114558))))

(assert (=> b!173449 (= res!82320 (= (getValueByKey!183 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85668 v!309)))))))

(declare-fun b!173450 () Bool)

(assert (=> b!173450 (= e!114558 (contains!1155 (toList!1093 lt!85749) (tuple2!3237 lt!85668 v!309)))))

(assert (= (and d!52507 res!82321) b!173449))

(assert (= (and b!173449 res!82320) b!173450))

(declare-fun m!201439 () Bool)

(assert (=> d!52507 m!201439))

(declare-fun m!201441 () Bool)

(assert (=> d!52507 m!201441))

(declare-fun m!201443 () Bool)

(assert (=> d!52507 m!201443))

(declare-fun m!201445 () Bool)

(assert (=> d!52507 m!201445))

(declare-fun m!201447 () Bool)

(assert (=> b!173449 m!201447))

(declare-fun m!201449 () Bool)

(assert (=> b!173450 m!201449))

(assert (=> b!173271 d!52507))

(assert (=> b!173271 d!52483))

(declare-fun d!52509 () Bool)

(declare-fun e!114559 () Bool)

(assert (=> d!52509 e!114559))

(declare-fun res!82323 () Bool)

(assert (=> d!52509 (=> (not res!82323) (not e!114559))))

(declare-fun lt!85753 () ListLongMap!2155)

(assert (=> d!52509 (= res!82323 (contains!1152 lt!85753 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85755 () List!2214)

(assert (=> d!52509 (= lt!85753 (ListLongMap!2156 lt!85755))))

(declare-fun lt!85754 () Unit!5291)

(declare-fun lt!85752 () Unit!5291)

(assert (=> d!52509 (= lt!85754 lt!85752)))

(assert (=> d!52509 (= (getValueByKey!183 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52509 (= lt!85752 (lemmaContainsTupThenGetReturnValue!99 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52509 (= lt!85755 (insertStrictlySorted!102 (toList!1093 lt!85675) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52509 (= (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!85753)))

(declare-fun b!173451 () Bool)

(declare-fun res!82322 () Bool)

(assert (=> b!173451 (=> (not res!82322) (not e!114559))))

(assert (=> b!173451 (= res!82322 (= (getValueByKey!183 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173452 () Bool)

(assert (=> b!173452 (= e!114559 (contains!1155 (toList!1093 lt!85753) (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52509 res!82323) b!173451))

(assert (= (and b!173451 res!82322) b!173452))

(declare-fun m!201451 () Bool)

(assert (=> d!52509 m!201451))

(declare-fun m!201453 () Bool)

(assert (=> d!52509 m!201453))

(declare-fun m!201455 () Bool)

(assert (=> d!52509 m!201455))

(declare-fun m!201457 () Bool)

(assert (=> d!52509 m!201457))

(declare-fun m!201459 () Bool)

(assert (=> b!173451 m!201459))

(declare-fun m!201461 () Bool)

(assert (=> b!173452 m!201461))

(assert (=> b!173271 d!52509))

(declare-fun d!52511 () Bool)

(declare-fun e!114561 () Bool)

(assert (=> d!52511 e!114561))

(declare-fun res!82324 () Bool)

(assert (=> d!52511 (=> res!82324 e!114561)))

(declare-fun lt!85757 () Bool)

(assert (=> d!52511 (= res!82324 (not lt!85757))))

(declare-fun lt!85756 () Bool)

(assert (=> d!52511 (= lt!85757 lt!85756)))

(declare-fun lt!85759 () Unit!5291)

(declare-fun e!114560 () Unit!5291)

(assert (=> d!52511 (= lt!85759 e!114560)))

(declare-fun c!30946 () Bool)

(assert (=> d!52511 (= c!30946 lt!85756)))

(assert (=> d!52511 (= lt!85756 (containsKey!187 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(assert (=> d!52511 (= (contains!1152 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!85667) lt!85757)))

(declare-fun b!173453 () Bool)

(declare-fun lt!85758 () Unit!5291)

(assert (=> b!173453 (= e!114560 lt!85758)))

(assert (=> b!173453 (= lt!85758 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(assert (=> b!173453 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(declare-fun b!173454 () Bool)

(declare-fun Unit!5300 () Unit!5291)

(assert (=> b!173454 (= e!114560 Unit!5300)))

(declare-fun b!173455 () Bool)

(assert (=> b!173455 (= e!114561 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667)))))

(assert (= (and d!52511 c!30946) b!173453))

(assert (= (and d!52511 (not c!30946)) b!173454))

(assert (= (and d!52511 (not res!82324)) b!173455))

(declare-fun m!201463 () Bool)

(assert (=> d!52511 m!201463))

(declare-fun m!201465 () Bool)

(assert (=> b!173453 m!201465))

(declare-fun m!201467 () Bool)

(assert (=> b!173453 m!201467))

(assert (=> b!173453 m!201467))

(declare-fun m!201469 () Bool)

(assert (=> b!173453 m!201469))

(assert (=> b!173455 m!201467))

(assert (=> b!173455 m!201467))

(assert (=> b!173455 m!201469))

(assert (=> b!173271 d!52511))

(declare-fun d!52513 () Bool)

(declare-fun e!114562 () Bool)

(assert (=> d!52513 e!114562))

(declare-fun res!82326 () Bool)

(assert (=> d!52513 (=> (not res!82326) (not e!114562))))

(declare-fun lt!85761 () ListLongMap!2155)

(assert (=> d!52513 (= res!82326 (contains!1152 lt!85761 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85763 () List!2214)

(assert (=> d!52513 (= lt!85761 (ListLongMap!2156 lt!85763))))

(declare-fun lt!85762 () Unit!5291)

(declare-fun lt!85760 () Unit!5291)

(assert (=> d!52513 (= lt!85762 lt!85760)))

(assert (=> d!52513 (= (getValueByKey!183 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52513 (= lt!85760 (lemmaContainsTupThenGetReturnValue!99 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52513 (= lt!85763 (insertStrictlySorted!102 (toList!1093 lt!85656) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52513 (= (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85761)))

(declare-fun b!173456 () Bool)

(declare-fun res!82325 () Bool)

(assert (=> b!173456 (=> (not res!82325) (not e!114562))))

(assert (=> b!173456 (= res!82325 (= (getValueByKey!183 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173457 () Bool)

(assert (=> b!173457 (= e!114562 (contains!1155 (toList!1093 lt!85761) (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52513 res!82326) b!173456))

(assert (= (and b!173456 res!82325) b!173457))

(declare-fun m!201471 () Bool)

(assert (=> d!52513 m!201471))

(declare-fun m!201473 () Bool)

(assert (=> d!52513 m!201473))

(declare-fun m!201475 () Bool)

(assert (=> d!52513 m!201475))

(declare-fun m!201477 () Bool)

(assert (=> d!52513 m!201477))

(declare-fun m!201479 () Bool)

(assert (=> b!173456 m!201479))

(declare-fun m!201481 () Bool)

(assert (=> b!173457 m!201481))

(assert (=> b!173271 d!52513))

(declare-fun d!52515 () Bool)

(declare-fun e!114563 () Bool)

(assert (=> d!52515 e!114563))

(declare-fun res!82328 () Bool)

(assert (=> d!52515 (=> (not res!82328) (not e!114563))))

(declare-fun lt!85765 () ListLongMap!2155)

(assert (=> d!52515 (= res!82328 (contains!1152 lt!85765 (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun lt!85767 () List!2214)

(assert (=> d!52515 (= lt!85765 (ListLongMap!2156 lt!85767))))

(declare-fun lt!85766 () Unit!5291)

(declare-fun lt!85764 () Unit!5291)

(assert (=> d!52515 (= lt!85766 lt!85764)))

(assert (=> d!52515 (= (getValueByKey!183 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(assert (=> d!52515 (= lt!85764 (lemmaContainsTupThenGetReturnValue!99 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(assert (=> d!52515 (= lt!85767 (insertStrictlySorted!102 (toList!1093 lt!85661) (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(assert (=> d!52515 (= (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)) lt!85765)))

(declare-fun b!173458 () Bool)

(declare-fun res!82327 () Bool)

(assert (=> b!173458 (=> (not res!82327) (not e!114563))))

(assert (=> b!173458 (= res!82327 (= (getValueByKey!183 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85671 v!309)))))))

(declare-fun b!173459 () Bool)

(assert (=> b!173459 (= e!114563 (contains!1155 (toList!1093 lt!85765) (tuple2!3237 lt!85671 v!309)))))

(assert (= (and d!52515 res!82328) b!173458))

(assert (= (and b!173458 res!82327) b!173459))

(declare-fun m!201483 () Bool)

(assert (=> d!52515 m!201483))

(declare-fun m!201485 () Bool)

(assert (=> d!52515 m!201485))

(declare-fun m!201487 () Bool)

(assert (=> d!52515 m!201487))

(declare-fun m!201489 () Bool)

(assert (=> d!52515 m!201489))

(declare-fun m!201491 () Bool)

(assert (=> b!173458 m!201491))

(declare-fun m!201493 () Bool)

(assert (=> b!173459 m!201493))

(assert (=> b!173271 d!52515))

(declare-fun d!52517 () Bool)

(assert (=> d!52517 (= (apply!130 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)) lt!85669) (apply!130 lt!85661 lt!85669))))

(declare-fun lt!85770 () Unit!5291)

(declare-fun choose!937 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> d!52517 (= lt!85770 (choose!937 lt!85661 lt!85671 v!309 lt!85669))))

(declare-fun e!114566 () Bool)

(assert (=> d!52517 e!114566))

(declare-fun res!82331 () Bool)

(assert (=> d!52517 (=> (not res!82331) (not e!114566))))

(assert (=> d!52517 (= res!82331 (contains!1152 lt!85661 lt!85669))))

(assert (=> d!52517 (= (addApplyDifferent!106 lt!85661 lt!85671 v!309 lt!85669) lt!85770)))

(declare-fun b!173463 () Bool)

(assert (=> b!173463 (= e!114566 (not (= lt!85669 lt!85671)))))

(assert (= (and d!52517 res!82331) b!173463))

(declare-fun m!201495 () Bool)

(assert (=> d!52517 m!201495))

(assert (=> d!52517 m!201225))

(declare-fun m!201497 () Bool)

(assert (=> d!52517 m!201497))

(assert (=> d!52517 m!201221))

(assert (=> d!52517 m!201225))

(assert (=> d!52517 m!201227))

(assert (=> b!173271 d!52517))

(declare-fun d!52519 () Bool)

(assert (=> d!52519 (= (apply!130 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)) lt!85674) (apply!130 lt!85662 lt!85674))))

(declare-fun lt!85771 () Unit!5291)

(assert (=> d!52519 (= lt!85771 (choose!937 lt!85662 lt!85668 v!309 lt!85674))))

(declare-fun e!114567 () Bool)

(assert (=> d!52519 e!114567))

(declare-fun res!82332 () Bool)

(assert (=> d!52519 (=> (not res!82332) (not e!114567))))

(assert (=> d!52519 (= res!82332 (contains!1152 lt!85662 lt!85674))))

(assert (=> d!52519 (= (addApplyDifferent!106 lt!85662 lt!85668 v!309 lt!85674) lt!85771)))

(declare-fun b!173464 () Bool)

(assert (=> b!173464 (= e!114567 (not (= lt!85674 lt!85668)))))

(assert (= (and d!52519 res!82332) b!173464))

(declare-fun m!201499 () Bool)

(assert (=> d!52519 m!201499))

(assert (=> d!52519 m!201213))

(declare-fun m!201501 () Bool)

(assert (=> d!52519 m!201501))

(assert (=> d!52519 m!201219))

(assert (=> d!52519 m!201213))

(assert (=> d!52519 m!201235))

(assert (=> b!173271 d!52519))

(declare-fun d!52521 () Bool)

(assert (=> d!52521 (= (apply!130 lt!85661 lt!85669) (get!1963 (getValueByKey!183 (toList!1093 lt!85661) lt!85669)))))

(declare-fun bs!7130 () Bool)

(assert (= bs!7130 d!52521))

(declare-fun m!201503 () Bool)

(assert (=> bs!7130 m!201503))

(assert (=> bs!7130 m!201503))

(declare-fun m!201505 () Bool)

(assert (=> bs!7130 m!201505))

(assert (=> b!173271 d!52521))

(declare-fun d!52523 () Bool)

(assert (=> d!52523 (= (apply!130 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85673) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85673)))))

(declare-fun bs!7131 () Bool)

(assert (= bs!7131 d!52523))

(declare-fun m!201507 () Bool)

(assert (=> bs!7131 m!201507))

(assert (=> bs!7131 m!201507))

(declare-fun m!201509 () Bool)

(assert (=> bs!7131 m!201509))

(assert (=> b!173271 d!52523))

(declare-fun d!52525 () Bool)

(assert (=> d!52525 (= (apply!130 lt!85656 lt!85673) (get!1963 (getValueByKey!183 (toList!1093 lt!85656) lt!85673)))))

(declare-fun bs!7132 () Bool)

(assert (= bs!7132 d!52525))

(declare-fun m!201511 () Bool)

(assert (=> bs!7132 m!201511))

(assert (=> bs!7132 m!201511))

(declare-fun m!201513 () Bool)

(assert (=> bs!7132 m!201513))

(assert (=> b!173271 d!52525))

(declare-fun d!52527 () Bool)

(assert (=> d!52527 (= (apply!130 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85673) (apply!130 lt!85656 lt!85673))))

(declare-fun lt!85772 () Unit!5291)

(assert (=> d!52527 (= lt!85772 (choose!937 lt!85656 lt!85657 (zeroValue!3438 thiss!1248) lt!85673))))

(declare-fun e!114568 () Bool)

(assert (=> d!52527 e!114568))

(declare-fun res!82333 () Bool)

(assert (=> d!52527 (=> (not res!82333) (not e!114568))))

(assert (=> d!52527 (= res!82333 (contains!1152 lt!85656 lt!85673))))

(assert (=> d!52527 (= (addApplyDifferent!106 lt!85656 lt!85657 (zeroValue!3438 thiss!1248) lt!85673) lt!85772)))

(declare-fun b!173465 () Bool)

(assert (=> b!173465 (= e!114568 (not (= lt!85673 lt!85657)))))

(assert (= (and d!52527 res!82333) b!173465))

(declare-fun m!201515 () Bool)

(assert (=> d!52527 m!201515))

(assert (=> d!52527 m!201229))

(declare-fun m!201517 () Bool)

(assert (=> d!52527 m!201517))

(assert (=> d!52527 m!201217))

(assert (=> d!52527 m!201229))

(assert (=> d!52527 m!201231))

(assert (=> b!173271 d!52527))

(declare-fun d!52529 () Bool)

(assert (=> d!52529 (contains!1152 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!85667)))

(declare-fun lt!85775 () Unit!5291)

(declare-fun choose!938 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> d!52529 (= lt!85775 (choose!938 lt!85675 lt!85666 (zeroValue!3438 thiss!1248) lt!85667))))

(assert (=> d!52529 (contains!1152 lt!85675 lt!85667)))

(assert (=> d!52529 (= (addStillContains!106 lt!85675 lt!85666 (zeroValue!3438 thiss!1248) lt!85667) lt!85775)))

(declare-fun bs!7133 () Bool)

(assert (= bs!7133 d!52529))

(assert (=> bs!7133 m!201223))

(assert (=> bs!7133 m!201223))

(assert (=> bs!7133 m!201239))

(declare-fun m!201519 () Bool)

(assert (=> bs!7133 m!201519))

(declare-fun m!201521 () Bool)

(assert (=> bs!7133 m!201521))

(assert (=> b!173271 d!52529))

(declare-fun d!52531 () Bool)

(assert (=> d!52531 (= (apply!130 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)) lt!85669) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))) lt!85669)))))

(declare-fun bs!7134 () Bool)

(assert (= bs!7134 d!52531))

(declare-fun m!201523 () Bool)

(assert (=> bs!7134 m!201523))

(assert (=> bs!7134 m!201523))

(declare-fun m!201525 () Bool)

(assert (=> bs!7134 m!201525))

(assert (=> b!173271 d!52531))

(declare-fun d!52533 () Bool)

(assert (=> d!52533 (= (apply!130 lt!85662 lt!85674) (get!1963 (getValueByKey!183 (toList!1093 lt!85662) lt!85674)))))

(declare-fun bs!7135 () Bool)

(assert (= bs!7135 d!52533))

(declare-fun m!201527 () Bool)

(assert (=> bs!7135 m!201527))

(assert (=> bs!7135 m!201527))

(declare-fun m!201529 () Bool)

(assert (=> bs!7135 m!201529))

(assert (=> b!173271 d!52533))

(declare-fun d!52535 () Bool)

(assert (=> d!52535 (= (apply!130 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)) lt!85674) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))) lt!85674)))))

(declare-fun bs!7136 () Bool)

(assert (= bs!7136 d!52535))

(declare-fun m!201531 () Bool)

(assert (=> bs!7136 m!201531))

(assert (=> bs!7136 m!201531))

(declare-fun m!201533 () Bool)

(assert (=> bs!7136 m!201533))

(assert (=> b!173271 d!52535))

(declare-fun d!52537 () Bool)

(declare-fun e!114569 () Bool)

(assert (=> d!52537 e!114569))

(declare-fun res!82335 () Bool)

(assert (=> d!52537 (=> (not res!82335) (not e!114569))))

(declare-fun lt!85777 () ListLongMap!2155)

(assert (=> d!52537 (= res!82335 (contains!1152 lt!85777 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun lt!85779 () List!2214)

(assert (=> d!52537 (= lt!85777 (ListLongMap!2156 lt!85779))))

(declare-fun lt!85778 () Unit!5291)

(declare-fun lt!85776 () Unit!5291)

(assert (=> d!52537 (= lt!85778 lt!85776)))

(assert (=> d!52537 (= (getValueByKey!183 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52537 (= lt!85776 (lemmaContainsTupThenGetReturnValue!99 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52537 (= lt!85779 (insertStrictlySorted!102 (toList!1093 call!17554) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52537 (= (+!240 call!17554 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) lt!85777)))

(declare-fun b!173467 () Bool)

(declare-fun res!82334 () Bool)

(assert (=> b!173467 (=> (not res!82334) (not e!114569))))

(assert (=> b!173467 (= res!82334 (= (getValueByKey!183 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173468 () Bool)

(assert (=> b!173468 (= e!114569 (contains!1155 (toList!1093 lt!85777) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(assert (= (and d!52537 res!82335) b!173467))

(assert (= (and b!173467 res!82334) b!173468))

(declare-fun m!201535 () Bool)

(assert (=> d!52537 m!201535))

(declare-fun m!201537 () Bool)

(assert (=> d!52537 m!201537))

(declare-fun m!201539 () Bool)

(assert (=> d!52537 m!201539))

(declare-fun m!201541 () Bool)

(assert (=> d!52537 m!201541))

(declare-fun m!201543 () Bool)

(assert (=> b!173467 m!201543))

(declare-fun m!201545 () Bool)

(assert (=> b!173468 m!201545))

(assert (=> b!173248 d!52537))

(declare-fun d!52539 () Bool)

(declare-fun e!114571 () Bool)

(assert (=> d!52539 e!114571))

(declare-fun res!82336 () Bool)

(assert (=> d!52539 (=> res!82336 e!114571)))

(declare-fun lt!85781 () Bool)

(assert (=> d!52539 (= res!82336 (not lt!85781))))

(declare-fun lt!85780 () Bool)

(assert (=> d!52539 (= lt!85781 lt!85780)))

(declare-fun lt!85783 () Unit!5291)

(declare-fun e!114570 () Unit!5291)

(assert (=> d!52539 (= lt!85783 e!114570)))

(declare-fun c!30947 () Bool)

(assert (=> d!52539 (= c!30947 lt!85780)))

(assert (=> d!52539 (= lt!85780 (containsKey!187 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52539 (= (contains!1152 lt!85663 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85781)))

(declare-fun b!173469 () Bool)

(declare-fun lt!85782 () Unit!5291)

(assert (=> b!173469 (= e!114570 lt!85782)))

(assert (=> b!173469 (= lt!85782 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173469 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173470 () Bool)

(declare-fun Unit!5301 () Unit!5291)

(assert (=> b!173470 (= e!114570 Unit!5301)))

(declare-fun b!173471 () Bool)

(assert (=> b!173471 (= e!114571 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52539 c!30947) b!173469))

(assert (= (and d!52539 (not c!30947)) b!173470))

(assert (= (and d!52539 (not res!82336)) b!173471))

(declare-fun m!201547 () Bool)

(assert (=> d!52539 m!201547))

(declare-fun m!201549 () Bool)

(assert (=> b!173469 m!201549))

(declare-fun m!201551 () Bool)

(assert (=> b!173469 m!201551))

(assert (=> b!173469 m!201551))

(declare-fun m!201553 () Bool)

(assert (=> b!173469 m!201553))

(assert (=> b!173471 m!201551))

(assert (=> b!173471 m!201551))

(assert (=> b!173471 m!201553))

(assert (=> bm!17557 d!52539))

(declare-fun d!52541 () Bool)

(declare-fun e!114573 () Bool)

(assert (=> d!52541 e!114573))

(declare-fun res!82337 () Bool)

(assert (=> d!52541 (=> res!82337 e!114573)))

(declare-fun lt!85785 () Bool)

(assert (=> d!52541 (= res!82337 (not lt!85785))))

(declare-fun lt!85784 () Bool)

(assert (=> d!52541 (= lt!85785 lt!85784)))

(declare-fun lt!85787 () Unit!5291)

(declare-fun e!114572 () Unit!5291)

(assert (=> d!52541 (= lt!85787 e!114572)))

(declare-fun c!30948 () Bool)

(assert (=> d!52541 (= c!30948 lt!85784)))

(assert (=> d!52541 (= lt!85784 (containsKey!187 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52541 (= (contains!1152 lt!85663 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!85785)))

(declare-fun b!173472 () Bool)

(declare-fun lt!85786 () Unit!5291)

(assert (=> b!173472 (= e!114572 lt!85786)))

(assert (=> b!173472 (= lt!85786 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173472 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173473 () Bool)

(declare-fun Unit!5302 () Unit!5291)

(assert (=> b!173473 (= e!114572 Unit!5302)))

(declare-fun b!173474 () Bool)

(assert (=> b!173474 (= e!114573 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52541 c!30948) b!173472))

(assert (= (and d!52541 (not c!30948)) b!173473))

(assert (= (and d!52541 (not res!82337)) b!173474))

(assert (=> d!52541 m!201133))

(declare-fun m!201555 () Bool)

(assert (=> d!52541 m!201555))

(assert (=> b!173472 m!201133))

(declare-fun m!201557 () Bool)

(assert (=> b!173472 m!201557))

(assert (=> b!173472 m!201133))

(assert (=> b!173472 m!201277))

(assert (=> b!173472 m!201277))

(declare-fun m!201559 () Bool)

(assert (=> b!173472 m!201559))

(assert (=> b!173474 m!201133))

(assert (=> b!173474 m!201277))

(assert (=> b!173474 m!201277))

(assert (=> b!173474 m!201559))

(assert (=> b!173269 d!52541))

(declare-fun d!52543 () Bool)

(declare-fun res!82342 () Bool)

(declare-fun e!114578 () Bool)

(assert (=> d!52543 (=> res!82342 e!114578)))

(assert (=> d!52543 (= res!82342 (and ((_ is Cons!2210) (toList!1093 lt!85537)) (= (_1!1629 (h!2827 (toList!1093 lt!85537))) key!828)))))

(assert (=> d!52543 (= (containsKey!187 (toList!1093 lt!85537) key!828) e!114578)))

(declare-fun b!173479 () Bool)

(declare-fun e!114579 () Bool)

(assert (=> b!173479 (= e!114578 e!114579)))

(declare-fun res!82343 () Bool)

(assert (=> b!173479 (=> (not res!82343) (not e!114579))))

(assert (=> b!173479 (= res!82343 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85537))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85537))) key!828)) ((_ is Cons!2210) (toList!1093 lt!85537)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85537))) key!828)))))

(declare-fun b!173480 () Bool)

(assert (=> b!173480 (= e!114579 (containsKey!187 (t!7012 (toList!1093 lt!85537)) key!828))))

(assert (= (and d!52543 (not res!82342)) b!173479))

(assert (= (and b!173479 res!82343) b!173480))

(declare-fun m!201561 () Bool)

(assert (=> b!173480 m!201561))

(assert (=> d!52445 d!52543))

(assert (=> b!173285 d!52479))

(declare-fun d!52545 () Bool)

(assert (=> d!52545 (= (apply!130 lt!85637 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7137 () Bool)

(assert (= bs!7137 d!52545))

(assert (=> bs!7137 m!201257))

(assert (=> bs!7137 m!201257))

(declare-fun m!201563 () Bool)

(assert (=> bs!7137 m!201563))

(assert (=> b!173242 d!52545))

(declare-fun d!52547 () Bool)

(declare-fun e!114581 () Bool)

(assert (=> d!52547 e!114581))

(declare-fun res!82344 () Bool)

(assert (=> d!52547 (=> res!82344 e!114581)))

(declare-fun lt!85789 () Bool)

(assert (=> d!52547 (= res!82344 (not lt!85789))))

(declare-fun lt!85788 () Bool)

(assert (=> d!52547 (= lt!85789 lt!85788)))

(declare-fun lt!85791 () Unit!5291)

(declare-fun e!114580 () Unit!5291)

(assert (=> d!52547 (= lt!85791 e!114580)))

(declare-fun c!30949 () Bool)

(assert (=> d!52547 (= c!30949 lt!85788)))

(assert (=> d!52547 (= lt!85788 (containsKey!187 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52547 (= (contains!1152 lt!85663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85789)))

(declare-fun b!173481 () Bool)

(declare-fun lt!85790 () Unit!5291)

(assert (=> b!173481 (= e!114580 lt!85790)))

(assert (=> b!173481 (= lt!85790 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173481 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173482 () Bool)

(declare-fun Unit!5303 () Unit!5291)

(assert (=> b!173482 (= e!114580 Unit!5303)))

(declare-fun b!173483 () Bool)

(assert (=> b!173483 (= e!114581 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52547 c!30949) b!173481))

(assert (= (and d!52547 (not c!30949)) b!173482))

(assert (= (and d!52547 (not res!82344)) b!173483))

(declare-fun m!201565 () Bool)

(assert (=> d!52547 m!201565))

(declare-fun m!201567 () Bool)

(assert (=> b!173481 m!201567))

(assert (=> b!173481 m!201423))

(assert (=> b!173481 m!201423))

(declare-fun m!201569 () Bool)

(assert (=> b!173481 m!201569))

(assert (=> b!173483 m!201423))

(assert (=> b!173483 m!201423))

(assert (=> b!173483 m!201569))

(assert (=> bm!17556 d!52547))

(declare-fun d!52549 () Bool)

(assert (=> d!52549 (= (apply!130 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85648) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!85648)))))

(declare-fun bs!7138 () Bool)

(assert (= bs!7138 d!52549))

(declare-fun m!201571 () Bool)

(assert (=> bs!7138 m!201571))

(assert (=> bs!7138 m!201571))

(declare-fun m!201573 () Bool)

(assert (=> bs!7138 m!201573))

(assert (=> b!173243 d!52549))

(declare-fun d!52551 () Bool)

(assert (=> d!52551 (= (apply!130 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85647) (apply!130 lt!85630 lt!85647))))

(declare-fun lt!85792 () Unit!5291)

(assert (=> d!52551 (= lt!85792 (choose!937 lt!85630 lt!85631 (zeroValue!3438 thiss!1248) lt!85647))))

(declare-fun e!114582 () Bool)

(assert (=> d!52551 e!114582))

(declare-fun res!82345 () Bool)

(assert (=> d!52551 (=> (not res!82345) (not e!114582))))

(assert (=> d!52551 (= res!82345 (contains!1152 lt!85630 lt!85647))))

(assert (=> d!52551 (= (addApplyDifferent!106 lt!85630 lt!85631 (zeroValue!3438 thiss!1248) lt!85647) lt!85792)))

(declare-fun b!173484 () Bool)

(assert (=> b!173484 (= e!114582 (not (= lt!85647 lt!85631)))))

(assert (= (and d!52551 res!82345) b!173484))

(declare-fun m!201575 () Bool)

(assert (=> d!52551 m!201575))

(assert (=> d!52551 m!201155))

(declare-fun m!201577 () Bool)

(assert (=> d!52551 m!201577))

(assert (=> d!52551 m!201143))

(assert (=> d!52551 m!201155))

(assert (=> d!52551 m!201157))

(assert (=> b!173243 d!52551))

(declare-fun d!52553 () Bool)

(declare-fun e!114583 () Bool)

(assert (=> d!52553 e!114583))

(declare-fun res!82347 () Bool)

(assert (=> d!52553 (=> (not res!82347) (not e!114583))))

(declare-fun lt!85794 () ListLongMap!2155)

(assert (=> d!52553 (= res!82347 (contains!1152 lt!85794 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85796 () List!2214)

(assert (=> d!52553 (= lt!85794 (ListLongMap!2156 lt!85796))))

(declare-fun lt!85795 () Unit!5291)

(declare-fun lt!85793 () Unit!5291)

(assert (=> d!52553 (= lt!85795 lt!85793)))

(assert (=> d!52553 (= (getValueByKey!183 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52553 (= lt!85793 (lemmaContainsTupThenGetReturnValue!99 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52553 (= lt!85796 (insertStrictlySorted!102 (toList!1093 lt!85630) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52553 (= (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85794)))

(declare-fun b!173485 () Bool)

(declare-fun res!82346 () Bool)

(assert (=> b!173485 (=> (not res!82346) (not e!114583))))

(assert (=> b!173485 (= res!82346 (= (getValueByKey!183 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173486 () Bool)

(assert (=> b!173486 (= e!114583 (contains!1155 (toList!1093 lt!85794) (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52553 res!82347) b!173485))

(assert (= (and b!173485 res!82346) b!173486))

(declare-fun m!201579 () Bool)

(assert (=> d!52553 m!201579))

(declare-fun m!201581 () Bool)

(assert (=> d!52553 m!201581))

(declare-fun m!201583 () Bool)

(assert (=> d!52553 m!201583))

(declare-fun m!201585 () Bool)

(assert (=> d!52553 m!201585))

(declare-fun m!201587 () Bool)

(assert (=> b!173485 m!201587))

(declare-fun m!201589 () Bool)

(assert (=> b!173486 m!201589))

(assert (=> b!173243 d!52553))

(declare-fun d!52555 () Bool)

(assert (=> d!52555 (= (apply!130 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!85643) (apply!130 lt!85635 lt!85643))))

(declare-fun lt!85797 () Unit!5291)

(assert (=> d!52555 (= lt!85797 (choose!937 lt!85635 lt!85645 (minValue!3440 thiss!1248) lt!85643))))

(declare-fun e!114584 () Bool)

(assert (=> d!52555 e!114584))

(declare-fun res!82348 () Bool)

(assert (=> d!52555 (=> (not res!82348) (not e!114584))))

(assert (=> d!52555 (= res!82348 (contains!1152 lt!85635 lt!85643))))

(assert (=> d!52555 (= (addApplyDifferent!106 lt!85635 lt!85645 (minValue!3440 thiss!1248) lt!85643) lt!85797)))

(declare-fun b!173487 () Bool)

(assert (=> b!173487 (= e!114584 (not (= lt!85643 lt!85645)))))

(assert (= (and d!52555 res!82348) b!173487))

(declare-fun m!201591 () Bool)

(assert (=> d!52555 m!201591))

(assert (=> d!52555 m!201151))

(declare-fun m!201593 () Bool)

(assert (=> d!52555 m!201593))

(assert (=> d!52555 m!201147))

(assert (=> d!52555 m!201151))

(assert (=> d!52555 m!201153))

(assert (=> b!173243 d!52555))

(declare-fun d!52557 () Bool)

(assert (=> d!52557 (= (apply!130 lt!85635 lt!85643) (get!1963 (getValueByKey!183 (toList!1093 lt!85635) lt!85643)))))

(declare-fun bs!7139 () Bool)

(assert (= bs!7139 d!52557))

(declare-fun m!201595 () Bool)

(assert (=> bs!7139 m!201595))

(assert (=> bs!7139 m!201595))

(declare-fun m!201597 () Bool)

(assert (=> bs!7139 m!201597))

(assert (=> b!173243 d!52557))

(declare-fun d!52559 () Bool)

(declare-fun e!114585 () Bool)

(assert (=> d!52559 e!114585))

(declare-fun res!82350 () Bool)

(assert (=> d!52559 (=> (not res!82350) (not e!114585))))

(declare-fun lt!85799 () ListLongMap!2155)

(assert (=> d!52559 (= res!82350 (contains!1152 lt!85799 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun lt!85801 () List!2214)

(assert (=> d!52559 (= lt!85799 (ListLongMap!2156 lt!85801))))

(declare-fun lt!85800 () Unit!5291)

(declare-fun lt!85798 () Unit!5291)

(assert (=> d!52559 (= lt!85800 lt!85798)))

(assert (=> d!52559 (= (getValueByKey!183 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(assert (=> d!52559 (= lt!85798 (lemmaContainsTupThenGetReturnValue!99 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(assert (=> d!52559 (= lt!85801 (insertStrictlySorted!102 (toList!1093 lt!85636) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(assert (=> d!52559 (= (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85799)))

(declare-fun b!173488 () Bool)

(declare-fun res!82349 () Bool)

(assert (=> b!173488 (=> (not res!82349) (not e!114585))))

(assert (=> b!173488 (= res!82349 (= (getValueByKey!183 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(declare-fun b!173489 () Bool)

(assert (=> b!173489 (= e!114585 (contains!1155 (toList!1093 lt!85799) (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))

(assert (= (and d!52559 res!82350) b!173488))

(assert (= (and b!173488 res!82349) b!173489))

(declare-fun m!201599 () Bool)

(assert (=> d!52559 m!201599))

(declare-fun m!201601 () Bool)

(assert (=> d!52559 m!201601))

(declare-fun m!201603 () Bool)

(assert (=> d!52559 m!201603))

(declare-fun m!201605 () Bool)

(assert (=> d!52559 m!201605))

(declare-fun m!201607 () Bool)

(assert (=> b!173488 m!201607))

(declare-fun m!201609 () Bool)

(assert (=> b!173489 m!201609))

(assert (=> b!173243 d!52559))

(declare-fun d!52561 () Bool)

(declare-fun e!114586 () Bool)

(assert (=> d!52561 e!114586))

(declare-fun res!82352 () Bool)

(assert (=> d!52561 (=> (not res!82352) (not e!114586))))

(declare-fun lt!85803 () ListLongMap!2155)

(assert (=> d!52561 (= res!82352 (contains!1152 lt!85803 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85805 () List!2214)

(assert (=> d!52561 (= lt!85803 (ListLongMap!2156 lt!85805))))

(declare-fun lt!85804 () Unit!5291)

(declare-fun lt!85802 () Unit!5291)

(assert (=> d!52561 (= lt!85804 lt!85802)))

(assert (=> d!52561 (= (getValueByKey!183 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52561 (= lt!85802 (lemmaContainsTupThenGetReturnValue!99 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52561 (= lt!85805 (insertStrictlySorted!102 (toList!1093 lt!85649) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52561 (= (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85803)))

(declare-fun b!173490 () Bool)

(declare-fun res!82351 () Bool)

(assert (=> b!173490 (=> (not res!82351) (not e!114586))))

(assert (=> b!173490 (= res!82351 (= (getValueByKey!183 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173491 () Bool)

(assert (=> b!173491 (= e!114586 (contains!1155 (toList!1093 lt!85803) (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52561 res!82352) b!173490))

(assert (= (and b!173490 res!82351) b!173491))

(declare-fun m!201611 () Bool)

(assert (=> d!52561 m!201611))

(declare-fun m!201613 () Bool)

(assert (=> d!52561 m!201613))

(declare-fun m!201615 () Bool)

(assert (=> d!52561 m!201615))

(declare-fun m!201617 () Bool)

(assert (=> d!52561 m!201617))

(declare-fun m!201619 () Bool)

(assert (=> b!173490 m!201619))

(declare-fun m!201621 () Bool)

(assert (=> b!173491 m!201621))

(assert (=> b!173243 d!52561))

(declare-fun d!52563 () Bool)

(assert (=> d!52563 (contains!1152 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85641)))

(declare-fun lt!85806 () Unit!5291)

(assert (=> d!52563 (= lt!85806 (choose!938 lt!85649 lt!85640 (zeroValue!3438 thiss!1248) lt!85641))))

(assert (=> d!52563 (contains!1152 lt!85649 lt!85641)))

(assert (=> d!52563 (= (addStillContains!106 lt!85649 lt!85640 (zeroValue!3438 thiss!1248) lt!85641) lt!85806)))

(declare-fun bs!7140 () Bool)

(assert (= bs!7140 d!52563))

(assert (=> bs!7140 m!201149))

(assert (=> bs!7140 m!201149))

(assert (=> bs!7140 m!201165))

(declare-fun m!201623 () Bool)

(assert (=> bs!7140 m!201623))

(declare-fun m!201625 () Bool)

(assert (=> bs!7140 m!201625))

(assert (=> b!173243 d!52563))

(declare-fun d!52565 () Bool)

(assert (=> d!52565 (= (apply!130 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85647) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85647)))))

(declare-fun bs!7141 () Bool)

(assert (= bs!7141 d!52565))

(declare-fun m!201627 () Bool)

(assert (=> bs!7141 m!201627))

(assert (=> bs!7141 m!201627))

(declare-fun m!201629 () Bool)

(assert (=> bs!7141 m!201629))

(assert (=> b!173243 d!52565))

(declare-fun d!52567 () Bool)

(assert (=> d!52567 (= (apply!130 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!85643) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!85643)))))

(declare-fun bs!7142 () Bool)

(assert (= bs!7142 d!52567))

(declare-fun m!201631 () Bool)

(assert (=> bs!7142 m!201631))

(assert (=> bs!7142 m!201631))

(declare-fun m!201633 () Bool)

(assert (=> bs!7142 m!201633))

(assert (=> b!173243 d!52567))

(declare-fun d!52569 () Bool)

(declare-fun e!114588 () Bool)

(assert (=> d!52569 e!114588))

(declare-fun res!82353 () Bool)

(assert (=> d!52569 (=> res!82353 e!114588)))

(declare-fun lt!85808 () Bool)

(assert (=> d!52569 (= res!82353 (not lt!85808))))

(declare-fun lt!85807 () Bool)

(assert (=> d!52569 (= lt!85808 lt!85807)))

(declare-fun lt!85810 () Unit!5291)

(declare-fun e!114587 () Unit!5291)

(assert (=> d!52569 (= lt!85810 e!114587)))

(declare-fun c!30950 () Bool)

(assert (=> d!52569 (= c!30950 lt!85807)))

(assert (=> d!52569 (= lt!85807 (containsKey!187 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(assert (=> d!52569 (= (contains!1152 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85641) lt!85808)))

(declare-fun b!173492 () Bool)

(declare-fun lt!85809 () Unit!5291)

(assert (=> b!173492 (= e!114587 lt!85809)))

(assert (=> b!173492 (= lt!85809 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(assert (=> b!173492 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(declare-fun b!173493 () Bool)

(declare-fun Unit!5304 () Unit!5291)

(assert (=> b!173493 (= e!114587 Unit!5304)))

(declare-fun b!173494 () Bool)

(assert (=> b!173494 (= e!114588 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641)))))

(assert (= (and d!52569 c!30950) b!173492))

(assert (= (and d!52569 (not c!30950)) b!173493))

(assert (= (and d!52569 (not res!82353)) b!173494))

(declare-fun m!201635 () Bool)

(assert (=> d!52569 m!201635))

(declare-fun m!201637 () Bool)

(assert (=> b!173492 m!201637))

(declare-fun m!201639 () Bool)

(assert (=> b!173492 m!201639))

(assert (=> b!173492 m!201639))

(declare-fun m!201641 () Bool)

(assert (=> b!173492 m!201641))

(assert (=> b!173494 m!201639))

(assert (=> b!173494 m!201639))

(assert (=> b!173494 m!201641))

(assert (=> b!173243 d!52569))

(declare-fun d!52571 () Bool)

(assert (=> d!52571 (= (apply!130 lt!85636 lt!85648) (get!1963 (getValueByKey!183 (toList!1093 lt!85636) lt!85648)))))

(declare-fun bs!7143 () Bool)

(assert (= bs!7143 d!52571))

(declare-fun m!201643 () Bool)

(assert (=> bs!7143 m!201643))

(assert (=> bs!7143 m!201643))

(declare-fun m!201645 () Bool)

(assert (=> bs!7143 m!201645))

(assert (=> b!173243 d!52571))

(declare-fun bm!17581 () Bool)

(declare-fun call!17584 () ListLongMap!2155)

(assert (=> bm!17581 (= call!17584 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173495 () Bool)

(declare-fun e!114590 () Bool)

(declare-fun e!114592 () Bool)

(assert (=> b!173495 (= e!114590 e!114592)))

(declare-fun c!30953 () Bool)

(assert (=> b!173495 (= c!30953 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173496 () Bool)

(declare-fun e!114593 () Bool)

(assert (=> b!173496 (= e!114590 e!114593)))

(assert (=> b!173496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun res!82357 () Bool)

(declare-fun lt!85816 () ListLongMap!2155)

(assert (=> b!173496 (= res!82357 (contains!1152 lt!85816 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173496 (=> (not res!82357) (not e!114593))))

(declare-fun b!173497 () Bool)

(declare-fun e!114594 () ListLongMap!2155)

(assert (=> b!173497 (= e!114594 call!17584)))

(declare-fun b!173498 () Bool)

(declare-fun e!114589 () ListLongMap!2155)

(assert (=> b!173498 (= e!114589 (ListLongMap!2156 Nil!2211))))

(declare-fun b!173499 () Bool)

(declare-fun lt!85812 () Unit!5291)

(declare-fun lt!85815 () Unit!5291)

(assert (=> b!173499 (= lt!85812 lt!85815)))

(declare-fun lt!85811 () (_ BitVec 64))

(declare-fun lt!85813 () (_ BitVec 64))

(declare-fun lt!85814 () ListLongMap!2155)

(declare-fun lt!85817 () V!5089)

(assert (=> b!173499 (not (contains!1152 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817)) lt!85813))))

(assert (=> b!173499 (= lt!85815 (addStillNotContains!73 lt!85814 lt!85811 lt!85817 lt!85813))))

(assert (=> b!173499 (= lt!85813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173499 (= lt!85817 (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173499 (= lt!85811 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173499 (= lt!85814 call!17584)))

(assert (=> b!173499 (= e!114594 (+!240 call!17584 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173500 () Bool)

(assert (=> b!173500 (= e!114589 e!114594)))

(declare-fun c!30952 () Bool)

(assert (=> b!173500 (= c!30952 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52573 () Bool)

(declare-fun e!114591 () Bool)

(assert (=> d!52573 e!114591))

(declare-fun res!82354 () Bool)

(assert (=> d!52573 (=> (not res!82354) (not e!114591))))

(assert (=> d!52573 (= res!82354 (not (contains!1152 lt!85816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52573 (= lt!85816 e!114589)))

(declare-fun c!30951 () Bool)

(assert (=> d!52573 (= c!30951 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52573 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52573 (= (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85816)))

(declare-fun b!173501 () Bool)

(declare-fun e!114595 () Bool)

(assert (=> b!173501 (= e!114595 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173501 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!173502 () Bool)

(assert (=> b!173502 (= e!114592 (isEmpty!440 lt!85816))))

(declare-fun b!173503 () Bool)

(declare-fun res!82355 () Bool)

(assert (=> b!173503 (=> (not res!82355) (not e!114591))))

(assert (=> b!173503 (= res!82355 (not (contains!1152 lt!85816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173504 () Bool)

(assert (=> b!173504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> b!173504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173504 (= e!114593 (= (apply!130 lt!85816 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173505 () Bool)

(assert (=> b!173505 (= e!114592 (= lt!85816 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173506 () Bool)

(assert (=> b!173506 (= e!114591 e!114590)))

(declare-fun c!30954 () Bool)

(assert (=> b!173506 (= c!30954 e!114595)))

(declare-fun res!82356 () Bool)

(assert (=> b!173506 (=> (not res!82356) (not e!114595))))

(assert (=> b!173506 (= res!82356 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (= (and d!52573 c!30951) b!173498))

(assert (= (and d!52573 (not c!30951)) b!173500))

(assert (= (and b!173500 c!30952) b!173499))

(assert (= (and b!173500 (not c!30952)) b!173497))

(assert (= (or b!173499 b!173497) bm!17581))

(assert (= (and d!52573 res!82354) b!173503))

(assert (= (and b!173503 res!82355) b!173506))

(assert (= (and b!173506 res!82356) b!173501))

(assert (= (and b!173506 c!30954) b!173496))

(assert (= (and b!173506 (not c!30954)) b!173495))

(assert (= (and b!173496 res!82357) b!173504))

(assert (= (and b!173495 c!30953) b!173505))

(assert (= (and b!173495 (not c!30953)) b!173502))

(declare-fun b_lambda!6931 () Bool)

(assert (=> (not b_lambda!6931) (not b!173499)))

(assert (=> b!173499 t!7016))

(declare-fun b_and!10739 () Bool)

(assert (= b_and!10737 (and (=> t!7016 result!4577) b_and!10739)))

(declare-fun b_lambda!6933 () Bool)

(assert (=> (not b_lambda!6933) (not b!173504)))

(assert (=> b!173504 t!7016))

(declare-fun b_and!10741 () Bool)

(assert (= b_and!10739 (and (=> t!7016 result!4577) b_and!10741)))

(assert (=> b!173496 m!201133))

(assert (=> b!173496 m!201133))

(declare-fun m!201647 () Bool)

(assert (=> b!173496 m!201647))

(assert (=> b!173500 m!201133))

(assert (=> b!173500 m!201133))

(assert (=> b!173500 m!201135))

(declare-fun m!201649 () Bool)

(assert (=> bm!17581 m!201649))

(assert (=> b!173504 m!201133))

(declare-fun m!201651 () Bool)

(assert (=> b!173504 m!201651))

(assert (=> b!173504 m!201133))

(assert (=> b!173504 m!201173))

(assert (=> b!173504 m!201171))

(assert (=> b!173504 m!201171))

(assert (=> b!173504 m!201173))

(assert (=> b!173504 m!201175))

(assert (=> b!173505 m!201649))

(assert (=> b!173499 m!201133))

(assert (=> b!173499 m!201173))

(declare-fun m!201653 () Bool)

(assert (=> b!173499 m!201653))

(assert (=> b!173499 m!201171))

(assert (=> b!173499 m!201171))

(assert (=> b!173499 m!201173))

(assert (=> b!173499 m!201175))

(declare-fun m!201655 () Bool)

(assert (=> b!173499 m!201655))

(assert (=> b!173499 m!201653))

(declare-fun m!201657 () Bool)

(assert (=> b!173499 m!201657))

(declare-fun m!201659 () Bool)

(assert (=> b!173499 m!201659))

(declare-fun m!201661 () Bool)

(assert (=> d!52573 m!201661))

(assert (=> d!52573 m!201121))

(declare-fun m!201663 () Bool)

(assert (=> b!173502 m!201663))

(assert (=> b!173501 m!201133))

(assert (=> b!173501 m!201133))

(assert (=> b!173501 m!201135))

(declare-fun m!201665 () Bool)

(assert (=> b!173503 m!201665))

(assert (=> b!173243 d!52573))

(declare-fun d!52575 () Bool)

(assert (=> d!52575 (= (apply!130 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85648) (apply!130 lt!85636 lt!85648))))

(declare-fun lt!85818 () Unit!5291)

(assert (=> d!52575 (= lt!85818 (choose!937 lt!85636 lt!85642 (minValue!3440 thiss!1248) lt!85648))))

(declare-fun e!114596 () Bool)

(assert (=> d!52575 e!114596))

(declare-fun res!82358 () Bool)

(assert (=> d!52575 (=> (not res!82358) (not e!114596))))

(assert (=> d!52575 (= res!82358 (contains!1152 lt!85636 lt!85648))))

(assert (=> d!52575 (= (addApplyDifferent!106 lt!85636 lt!85642 (minValue!3440 thiss!1248) lt!85648) lt!85818)))

(declare-fun b!173507 () Bool)

(assert (=> b!173507 (= e!114596 (not (= lt!85648 lt!85642)))))

(assert (= (and d!52575 res!82358) b!173507))

(declare-fun m!201667 () Bool)

(assert (=> d!52575 m!201667))

(assert (=> d!52575 m!201139))

(declare-fun m!201669 () Bool)

(assert (=> d!52575 m!201669))

(assert (=> d!52575 m!201145))

(assert (=> d!52575 m!201139))

(assert (=> d!52575 m!201161))

(assert (=> b!173243 d!52575))

(declare-fun d!52577 () Bool)

(assert (=> d!52577 (= (apply!130 lt!85630 lt!85647) (get!1963 (getValueByKey!183 (toList!1093 lt!85630) lt!85647)))))

(declare-fun bs!7144 () Bool)

(assert (= bs!7144 d!52577))

(declare-fun m!201671 () Bool)

(assert (=> bs!7144 m!201671))

(assert (=> bs!7144 m!201671))

(declare-fun m!201673 () Bool)

(assert (=> bs!7144 m!201673))

(assert (=> b!173243 d!52577))

(declare-fun d!52579 () Bool)

(declare-fun e!114597 () Bool)

(assert (=> d!52579 e!114597))

(declare-fun res!82360 () Bool)

(assert (=> d!52579 (=> (not res!82360) (not e!114597))))

(declare-fun lt!85820 () ListLongMap!2155)

(assert (=> d!52579 (= res!82360 (contains!1152 lt!85820 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun lt!85822 () List!2214)

(assert (=> d!52579 (= lt!85820 (ListLongMap!2156 lt!85822))))

(declare-fun lt!85821 () Unit!5291)

(declare-fun lt!85819 () Unit!5291)

(assert (=> d!52579 (= lt!85821 lt!85819)))

(assert (=> d!52579 (= (getValueByKey!183 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(assert (=> d!52579 (= lt!85819 (lemmaContainsTupThenGetReturnValue!99 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(assert (=> d!52579 (= lt!85822 (insertStrictlySorted!102 (toList!1093 lt!85635) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(assert (=> d!52579 (= (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!85820)))

(declare-fun b!173508 () Bool)

(declare-fun res!82359 () Bool)

(assert (=> b!173508 (=> (not res!82359) (not e!114597))))

(assert (=> b!173508 (= res!82359 (= (getValueByKey!183 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(declare-fun b!173509 () Bool)

(assert (=> b!173509 (= e!114597 (contains!1155 (toList!1093 lt!85820) (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))

(assert (= (and d!52579 res!82360) b!173508))

(assert (= (and b!173508 res!82359) b!173509))

(declare-fun m!201675 () Bool)

(assert (=> d!52579 m!201675))

(declare-fun m!201677 () Bool)

(assert (=> d!52579 m!201677))

(declare-fun m!201679 () Bool)

(assert (=> d!52579 m!201679))

(declare-fun m!201681 () Bool)

(assert (=> d!52579 m!201681))

(declare-fun m!201683 () Bool)

(assert (=> b!173508 m!201683))

(declare-fun m!201685 () Bool)

(assert (=> b!173509 m!201685))

(assert (=> b!173243 d!52579))

(declare-fun d!52581 () Bool)

(assert (=> d!52581 (= (apply!130 lt!85637 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1963 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7145 () Bool)

(assert (= bs!7145 d!52581))

(assert (=> bs!7145 m!201133))

(declare-fun m!201687 () Bool)

(assert (=> bs!7145 m!201687))

(assert (=> bs!7145 m!201687))

(declare-fun m!201689 () Bool)

(assert (=> bs!7145 m!201689))

(assert (=> b!173244 d!52581))

(assert (=> b!173244 d!52477))

(declare-fun d!52583 () Bool)

(assert (=> d!52583 (= (apply!130 lt!85663 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7146 () Bool)

(assert (= bs!7146 d!52583))

(assert (=> bs!7146 m!201551))

(assert (=> bs!7146 m!201551))

(declare-fun m!201691 () Bool)

(assert (=> bs!7146 m!201691))

(assert (=> b!173282 d!52583))

(declare-fun b!173518 () Bool)

(declare-fun e!114604 () Bool)

(declare-fun e!114605 () Bool)

(assert (=> b!173518 (= e!114604 e!114605)))

(declare-fun c!30957 () Bool)

(assert (=> b!173518 (= c!30957 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun d!52585 () Bool)

(declare-fun res!82366 () Bool)

(assert (=> d!52585 (=> res!82366 e!114604)))

(assert (=> d!52585 (= res!82366 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5437 lt!85539) (mask!8468 lt!85539)) e!114604)))

(declare-fun b!173519 () Bool)

(declare-fun e!114606 () Bool)

(declare-fun call!17587 () Bool)

(assert (=> b!173519 (= e!114606 call!17587)))

(declare-fun b!173520 () Bool)

(assert (=> b!173520 (= e!114605 e!114606)))

(declare-fun lt!85831 () (_ BitVec 64))

(assert (=> b!173520 (= lt!85831 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(declare-fun lt!85830 () Unit!5291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7273 (_ BitVec 64) (_ BitVec 32)) Unit!5291)

(assert (=> b!173520 (= lt!85830 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173520 (arrayContainsKey!0 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000)))

(declare-fun lt!85829 () Unit!5291)

(assert (=> b!173520 (= lt!85829 lt!85830)))

(declare-fun res!82365 () Bool)

(declare-datatypes ((SeekEntryResult!553 0))(
  ( (MissingZero!553 (index!4380 (_ BitVec 32))) (Found!553 (index!4381 (_ BitVec 32))) (Intermediate!553 (undefined!1365 Bool) (index!4382 (_ BitVec 32)) (x!19206 (_ BitVec 32))) (Undefined!553) (MissingVacant!553 (index!4383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7273 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!173520 (= res!82365 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (_keys!5437 lt!85539) (mask!8468 lt!85539)) (Found!553 #b00000000000000000000000000000000)))))

(assert (=> b!173520 (=> (not res!82365) (not e!114606))))

(declare-fun b!173521 () Bool)

(assert (=> b!173521 (= e!114605 call!17587)))

(declare-fun bm!17584 () Bool)

(assert (=> bm!17584 (= call!17587 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5437 lt!85539) (mask!8468 lt!85539)))))

(assert (= (and d!52585 (not res!82366)) b!173518))

(assert (= (and b!173518 c!30957) b!173520))

(assert (= (and b!173518 (not c!30957)) b!173521))

(assert (= (and b!173520 res!82365) b!173519))

(assert (= (or b!173519 b!173521) bm!17584))

(assert (=> b!173518 m!201317))

(assert (=> b!173518 m!201317))

(assert (=> b!173518 m!201319))

(assert (=> b!173520 m!201317))

(declare-fun m!201693 () Bool)

(assert (=> b!173520 m!201693))

(declare-fun m!201695 () Bool)

(assert (=> b!173520 m!201695))

(assert (=> b!173520 m!201317))

(declare-fun m!201697 () Bool)

(assert (=> b!173520 m!201697))

(declare-fun m!201699 () Bool)

(assert (=> bm!17584 m!201699))

(assert (=> b!173264 d!52585))

(declare-fun d!52587 () Bool)

(declare-fun res!82373 () Bool)

(declare-fun e!114615 () Bool)

(assert (=> d!52587 (=> res!82373 e!114615)))

(assert (=> d!52587 (= res!82373 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52587 (= (arrayNoDuplicates!0 (_keys!5437 thiss!1248) #b00000000000000000000000000000000 Nil!2214) e!114615)))

(declare-fun b!173532 () Bool)

(declare-fun e!114617 () Bool)

(declare-fun contains!1156 (List!2217 (_ BitVec 64)) Bool)

(assert (=> b!173532 (= e!114617 (contains!1156 Nil!2214 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173533 () Bool)

(declare-fun e!114616 () Bool)

(assert (=> b!173533 (= e!114615 e!114616)))

(declare-fun res!82374 () Bool)

(assert (=> b!173533 (=> (not res!82374) (not e!114616))))

(assert (=> b!173533 (= res!82374 (not e!114617))))

(declare-fun res!82375 () Bool)

(assert (=> b!173533 (=> (not res!82375) (not e!114617))))

(assert (=> b!173533 (= res!82375 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173534 () Bool)

(declare-fun e!114618 () Bool)

(declare-fun call!17590 () Bool)

(assert (=> b!173534 (= e!114618 call!17590)))

(declare-fun b!173535 () Bool)

(assert (=> b!173535 (= e!114618 call!17590)))

(declare-fun bm!17587 () Bool)

(declare-fun c!30960 () Bool)

(assert (=> bm!17587 (= call!17590 (arrayNoDuplicates!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30960 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)))))

(declare-fun b!173536 () Bool)

(assert (=> b!173536 (= e!114616 e!114618)))

(assert (=> b!173536 (= c!30960 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52587 (not res!82373)) b!173533))

(assert (= (and b!173533 res!82375) b!173532))

(assert (= (and b!173533 res!82374) b!173536))

(assert (= (and b!173536 c!30960) b!173535))

(assert (= (and b!173536 (not c!30960)) b!173534))

(assert (= (or b!173535 b!173534) bm!17587))

(assert (=> b!173532 m!201133))

(assert (=> b!173532 m!201133))

(declare-fun m!201701 () Bool)

(assert (=> b!173532 m!201701))

(assert (=> b!173533 m!201133))

(assert (=> b!173533 m!201133))

(assert (=> b!173533 m!201135))

(assert (=> bm!17587 m!201133))

(declare-fun m!201703 () Bool)

(assert (=> bm!17587 m!201703))

(assert (=> b!173536 m!201133))

(assert (=> b!173536 m!201133))

(assert (=> b!173536 m!201135))

(assert (=> b!173191 d!52587))

(declare-fun b!173537 () Bool)

(declare-fun e!114619 () Bool)

(declare-fun e!114620 () Bool)

(assert (=> b!173537 (= e!114619 e!114620)))

(declare-fun c!30961 () Bool)

(assert (=> b!173537 (= c!30961 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52589 () Bool)

(declare-fun res!82377 () Bool)

(assert (=> d!52589 (=> res!82377 e!114619)))

(assert (=> d!52589 (= res!82377 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5437 thiss!1248) (mask!8468 thiss!1248)) e!114619)))

(declare-fun b!173538 () Bool)

(declare-fun e!114621 () Bool)

(declare-fun call!17591 () Bool)

(assert (=> b!173538 (= e!114621 call!17591)))

(declare-fun b!173539 () Bool)

(assert (=> b!173539 (= e!114620 e!114621)))

(declare-fun lt!85834 () (_ BitVec 64))

(assert (=> b!173539 (= lt!85834 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85833 () Unit!5291)

(assert (=> b!173539 (= lt!85833 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000))))

(assert (=> b!173539 (arrayContainsKey!0 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000)))

(declare-fun lt!85832 () Unit!5291)

(assert (=> b!173539 (= lt!85832 lt!85833)))

(declare-fun res!82376 () Bool)

(assert (=> b!173539 (= res!82376 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)) (Found!553 #b00000000000000000000000000000000)))))

(assert (=> b!173539 (=> (not res!82376) (not e!114621))))

(declare-fun b!173540 () Bool)

(assert (=> b!173540 (= e!114620 call!17591)))

(declare-fun bm!17588 () Bool)

(assert (=> bm!17588 (= call!17591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)))))

(assert (= (and d!52589 (not res!82377)) b!173537))

(assert (= (and b!173537 c!30961) b!173539))

(assert (= (and b!173537 (not c!30961)) b!173540))

(assert (= (and b!173539 res!82376) b!173538))

(assert (= (or b!173538 b!173540) bm!17588))

(assert (=> b!173537 m!201133))

(assert (=> b!173537 m!201133))

(assert (=> b!173537 m!201135))

(assert (=> b!173539 m!201133))

(declare-fun m!201705 () Bool)

(assert (=> b!173539 m!201705))

(declare-fun m!201707 () Bool)

(assert (=> b!173539 m!201707))

(assert (=> b!173539 m!201133))

(declare-fun m!201709 () Bool)

(assert (=> b!173539 m!201709))

(declare-fun m!201711 () Bool)

(assert (=> bm!17588 m!201711))

(assert (=> b!173190 d!52589))

(declare-fun d!52591 () Bool)

(declare-fun e!114623 () Bool)

(assert (=> d!52591 e!114623))

(declare-fun res!82378 () Bool)

(assert (=> d!52591 (=> res!82378 e!114623)))

(declare-fun lt!85836 () Bool)

(assert (=> d!52591 (= res!82378 (not lt!85836))))

(declare-fun lt!85835 () Bool)

(assert (=> d!52591 (= lt!85836 lt!85835)))

(declare-fun lt!85838 () Unit!5291)

(declare-fun e!114622 () Unit!5291)

(assert (=> d!52591 (= lt!85838 e!114622)))

(declare-fun c!30962 () Bool)

(assert (=> d!52591 (= c!30962 lt!85835)))

(assert (=> d!52591 (= lt!85835 (containsKey!187 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52591 (= (contains!1152 lt!85637 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!85836)))

(declare-fun b!173541 () Bool)

(declare-fun lt!85837 () Unit!5291)

(assert (=> b!173541 (= e!114622 lt!85837)))

(assert (=> b!173541 (= lt!85837 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173541 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173542 () Bool)

(declare-fun Unit!5305 () Unit!5291)

(assert (=> b!173542 (= e!114622 Unit!5305)))

(declare-fun b!173543 () Bool)

(assert (=> b!173543 (= e!114623 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52591 c!30962) b!173541))

(assert (= (and d!52591 (not c!30962)) b!173542))

(assert (= (and d!52591 (not res!82378)) b!173543))

(assert (=> d!52591 m!201133))

(declare-fun m!201713 () Bool)

(assert (=> d!52591 m!201713))

(assert (=> b!173541 m!201133))

(declare-fun m!201715 () Bool)

(assert (=> b!173541 m!201715))

(assert (=> b!173541 m!201133))

(assert (=> b!173541 m!201687))

(assert (=> b!173541 m!201687))

(declare-fun m!201717 () Bool)

(assert (=> b!173541 m!201717))

(assert (=> b!173543 m!201133))

(assert (=> b!173543 m!201687))

(assert (=> b!173543 m!201687))

(assert (=> b!173543 m!201717))

(assert (=> b!173241 d!52591))

(declare-fun d!52593 () Bool)

(declare-fun e!114625 () Bool)

(assert (=> d!52593 e!114625))

(declare-fun res!82379 () Bool)

(assert (=> d!52593 (=> res!82379 e!114625)))

(declare-fun lt!85840 () Bool)

(assert (=> d!52593 (= res!82379 (not lt!85840))))

(declare-fun lt!85839 () Bool)

(assert (=> d!52593 (= lt!85840 lt!85839)))

(declare-fun lt!85842 () Unit!5291)

(declare-fun e!114624 () Unit!5291)

(assert (=> d!52593 (= lt!85842 e!114624)))

(declare-fun c!30963 () Bool)

(assert (=> d!52593 (= c!30963 lt!85839)))

(assert (=> d!52593 (= lt!85839 (containsKey!187 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52593 (= (contains!1152 lt!85637 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85840)))

(declare-fun b!173544 () Bool)

(declare-fun lt!85841 () Unit!5291)

(assert (=> b!173544 (= e!114624 lt!85841)))

(assert (=> b!173544 (= lt!85841 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173544 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173545 () Bool)

(declare-fun Unit!5306 () Unit!5291)

(assert (=> b!173545 (= e!114624 Unit!5306)))

(declare-fun b!173546 () Bool)

(assert (=> b!173546 (= e!114625 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52593 c!30963) b!173544))

(assert (= (and d!52593 (not c!30963)) b!173545))

(assert (= (and d!52593 (not res!82379)) b!173546))

(declare-fun m!201719 () Bool)

(assert (=> d!52593 m!201719))

(declare-fun m!201721 () Bool)

(assert (=> b!173544 m!201721))

(assert (=> b!173544 m!201261))

(assert (=> b!173544 m!201261))

(declare-fun m!201723 () Bool)

(assert (=> b!173544 m!201723))

(assert (=> b!173546 m!201261))

(assert (=> b!173546 m!201261))

(assert (=> b!173546 m!201723))

(assert (=> bm!17550 d!52593))

(assert (=> b!173280 d!52479))

(declare-fun d!52595 () Bool)

(declare-fun res!82380 () Bool)

(declare-fun e!114626 () Bool)

(assert (=> d!52595 (=> res!82380 e!114626)))

(assert (=> d!52595 (= res!82380 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52595 (= (arrayNoDuplicates!0 (_keys!5437 lt!85539) #b00000000000000000000000000000000 Nil!2214) e!114626)))

(declare-fun b!173547 () Bool)

(declare-fun e!114628 () Bool)

(assert (=> b!173547 (= e!114628 (contains!1156 Nil!2214 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173548 () Bool)

(declare-fun e!114627 () Bool)

(assert (=> b!173548 (= e!114626 e!114627)))

(declare-fun res!82381 () Bool)

(assert (=> b!173548 (=> (not res!82381) (not e!114627))))

(assert (=> b!173548 (= res!82381 (not e!114628))))

(declare-fun res!82382 () Bool)

(assert (=> b!173548 (=> (not res!82382) (not e!114628))))

(assert (=> b!173548 (= res!82382 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173549 () Bool)

(declare-fun e!114629 () Bool)

(declare-fun call!17592 () Bool)

(assert (=> b!173549 (= e!114629 call!17592)))

(declare-fun b!173550 () Bool)

(assert (=> b!173550 (= e!114629 call!17592)))

(declare-fun bm!17589 () Bool)

(declare-fun c!30964 () Bool)

(assert (=> bm!17589 (= call!17592 (arrayNoDuplicates!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30964 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)))))

(declare-fun b!173551 () Bool)

(assert (=> b!173551 (= e!114627 e!114629)))

(assert (=> b!173551 (= c!30964 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (= (and d!52595 (not res!82380)) b!173548))

(assert (= (and b!173548 res!82382) b!173547))

(assert (= (and b!173548 res!82381) b!173551))

(assert (= (and b!173551 c!30964) b!173550))

(assert (= (and b!173551 (not c!30964)) b!173549))

(assert (= (or b!173550 b!173549) bm!17589))

(assert (=> b!173547 m!201317))

(assert (=> b!173547 m!201317))

(declare-fun m!201725 () Bool)

(assert (=> b!173547 m!201725))

(assert (=> b!173548 m!201317))

(assert (=> b!173548 m!201317))

(assert (=> b!173548 m!201319))

(assert (=> bm!17589 m!201317))

(declare-fun m!201727 () Bool)

(assert (=> bm!17589 m!201727))

(assert (=> b!173551 m!201317))

(assert (=> b!173551 m!201317))

(assert (=> b!173551 m!201319))

(assert (=> b!173265 d!52595))

(declare-fun d!52597 () Bool)

(declare-fun isEmpty!441 (Option!189) Bool)

(assert (=> d!52597 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85537) key!828)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85537) key!828))))))

(declare-fun bs!7147 () Bool)

(assert (= bs!7147 d!52597))

(assert (=> bs!7147 m!201095))

(declare-fun m!201729 () Bool)

(assert (=> bs!7147 m!201729))

(assert (=> b!173182 d!52597))

(declare-fun b!173553 () Bool)

(declare-fun e!114630 () Option!189)

(declare-fun e!114631 () Option!189)

(assert (=> b!173553 (= e!114630 e!114631)))

(declare-fun c!30966 () Bool)

(assert (=> b!173553 (= c!30966 (and ((_ is Cons!2210) (toList!1093 lt!85537)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85537))) key!828))))))

(declare-fun b!173554 () Bool)

(assert (=> b!173554 (= e!114631 (getValueByKey!183 (t!7012 (toList!1093 lt!85537)) key!828))))

(declare-fun b!173552 () Bool)

(assert (=> b!173552 (= e!114630 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85537)))))))

(declare-fun d!52599 () Bool)

(declare-fun c!30965 () Bool)

(assert (=> d!52599 (= c!30965 (and ((_ is Cons!2210) (toList!1093 lt!85537)) (= (_1!1629 (h!2827 (toList!1093 lt!85537))) key!828)))))

(assert (=> d!52599 (= (getValueByKey!183 (toList!1093 lt!85537) key!828) e!114630)))

(declare-fun b!173555 () Bool)

(assert (=> b!173555 (= e!114631 None!187)))

(assert (= (and d!52599 c!30965) b!173552))

(assert (= (and d!52599 (not c!30965)) b!173553))

(assert (= (and b!173553 c!30966) b!173554))

(assert (= (and b!173553 (not c!30966)) b!173555))

(declare-fun m!201731 () Bool)

(assert (=> b!173554 m!201731))

(assert (=> b!173182 d!52599))

(assert (=> bm!17547 d!52573))

(declare-fun b!173557 () Bool)

(declare-fun e!114632 () Option!189)

(declare-fun e!114633 () Option!189)

(assert (=> b!173557 (= e!114632 e!114633)))

(declare-fun c!30968 () Bool)

(assert (=> b!173557 (= c!30968 (and ((_ is Cons!2210) (toList!1093 lt!85579)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun b!173558 () Bool)

(assert (=> b!173558 (= e!114633 (getValueByKey!183 (t!7012 (toList!1093 lt!85579)) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173556 () Bool)

(assert (=> b!173556 (= e!114632 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85579)))))))

(declare-fun c!30967 () Bool)

(declare-fun d!52601 () Bool)

(assert (=> d!52601 (= c!30967 (and ((_ is Cons!2210) (toList!1093 lt!85579)) (= (_1!1629 (h!2827 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52601 (= (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))) e!114632)))

(declare-fun b!173559 () Bool)

(assert (=> b!173559 (= e!114633 None!187)))

(assert (= (and d!52601 c!30967) b!173556))

(assert (= (and d!52601 (not c!30967)) b!173557))

(assert (= (and b!173557 c!30968) b!173558))

(assert (= (and b!173557 (not c!30968)) b!173559))

(declare-fun m!201733 () Bool)

(assert (=> b!173558 m!201733))

(assert (=> b!173196 d!52601))

(declare-fun b!173561 () Bool)

(declare-fun res!82384 () Bool)

(declare-fun e!114634 () Bool)

(assert (=> b!173561 (=> (not res!82384) (not e!114634))))

(assert (=> b!173561 (= res!82384 (bvsge (size!3760 thiss!1248) (_size!1200 thiss!1248)))))

(declare-fun b!173563 () Bool)

(assert (=> b!173563 (= e!114634 (and (bvsge (extraKeys!3336 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3336 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1200 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!173562 () Bool)

(declare-fun res!82386 () Bool)

(assert (=> b!173562 (=> (not res!82386) (not e!114634))))

(assert (=> b!173562 (= res!82386 (= (size!3760 thiss!1248) (bvadd (_size!1200 thiss!1248) (bvsdiv (bvadd (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!173560 () Bool)

(declare-fun res!82385 () Bool)

(assert (=> b!173560 (=> (not res!82385) (not e!114634))))

(assert (=> b!173560 (= res!82385 (and (= (size!3755 (_values!3580 thiss!1248)) (bvadd (mask!8468 thiss!1248) #b00000000000000000000000000000001)) (= (size!3754 (_keys!5437 thiss!1248)) (size!3755 (_values!3580 thiss!1248))) (bvsge (_size!1200 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1200 thiss!1248) (bvadd (mask!8468 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!52603 () Bool)

(declare-fun res!82383 () Bool)

(assert (=> d!52603 (=> (not res!82383) (not e!114634))))

(assert (=> d!52603 (= res!82383 (validMask!0 (mask!8468 thiss!1248)))))

(assert (=> d!52603 (= (simpleValid!144 thiss!1248) e!114634)))

(assert (= (and d!52603 res!82383) b!173560))

(assert (= (and b!173560 res!82385) b!173561))

(assert (= (and b!173561 res!82384) b!173562))

(assert (= (and b!173562 res!82386) b!173563))

(declare-fun m!201735 () Bool)

(assert (=> b!173561 m!201735))

(assert (=> b!173562 m!201735))

(assert (=> d!52603 m!201121))

(assert (=> d!52449 d!52603))

(declare-fun b!173565 () Bool)

(declare-fun e!114635 () Option!189)

(declare-fun e!114636 () Option!189)

(assert (=> b!173565 (= e!114635 e!114636)))

(declare-fun c!30970 () Bool)

(assert (=> b!173565 (= c!30970 (and ((_ is Cons!2210) (toList!1093 lt!85652)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173566 () Bool)

(assert (=> b!173566 (= e!114636 (getValueByKey!183 (t!7012 (toList!1093 lt!85652)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173564 () Bool)

(assert (=> b!173564 (= e!114635 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85652)))))))

(declare-fun d!52605 () Bool)

(declare-fun c!30969 () Bool)

(assert (=> d!52605 (= c!30969 (and ((_ is Cons!2210) (toList!1093 lt!85652)) (= (_1!1629 (h!2827 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52605 (= (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114635)))

(declare-fun b!173567 () Bool)

(assert (=> b!173567 (= e!114636 None!187)))

(assert (= (and d!52605 c!30969) b!173564))

(assert (= (and d!52605 (not c!30969)) b!173565))

(assert (= (and b!173565 c!30970) b!173566))

(assert (= (and b!173565 (not c!30970)) b!173567))

(declare-fun m!201737 () Bool)

(assert (=> b!173566 m!201737))

(assert (=> b!173266 d!52605))

(declare-fun lt!85845 () Bool)

(declare-fun d!52607 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!149 (List!2214) (InoxSet tuple2!3236))

(assert (=> d!52607 (= lt!85845 (select (content!149 (toList!1093 lt!85579)) (tuple2!3237 key!828 v!309)))))

(declare-fun e!114642 () Bool)

(assert (=> d!52607 (= lt!85845 e!114642)))

(declare-fun res!82391 () Bool)

(assert (=> d!52607 (=> (not res!82391) (not e!114642))))

(assert (=> d!52607 (= res!82391 ((_ is Cons!2210) (toList!1093 lt!85579)))))

(assert (=> d!52607 (= (contains!1155 (toList!1093 lt!85579) (tuple2!3237 key!828 v!309)) lt!85845)))

(declare-fun b!173572 () Bool)

(declare-fun e!114641 () Bool)

(assert (=> b!173572 (= e!114642 e!114641)))

(declare-fun res!82392 () Bool)

(assert (=> b!173572 (=> res!82392 e!114641)))

(assert (=> b!173572 (= res!82392 (= (h!2827 (toList!1093 lt!85579)) (tuple2!3237 key!828 v!309)))))

(declare-fun b!173573 () Bool)

(assert (=> b!173573 (= e!114641 (contains!1155 (t!7012 (toList!1093 lt!85579)) (tuple2!3237 key!828 v!309)))))

(assert (= (and d!52607 res!82391) b!173572))

(assert (= (and b!173572 (not res!82392)) b!173573))

(declare-fun m!201739 () Bool)

(assert (=> d!52607 m!201739))

(declare-fun m!201741 () Bool)

(assert (=> d!52607 m!201741))

(declare-fun m!201743 () Bool)

(assert (=> b!173573 m!201743))

(assert (=> b!173197 d!52607))

(declare-fun d!52609 () Bool)

(declare-fun lt!85846 () Bool)

(assert (=> d!52609 (= lt!85846 (select (content!149 (toList!1093 lt!85652)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114644 () Bool)

(assert (=> d!52609 (= lt!85846 e!114644)))

(declare-fun res!82393 () Bool)

(assert (=> d!52609 (=> (not res!82393) (not e!114644))))

(assert (=> d!52609 (= res!82393 ((_ is Cons!2210) (toList!1093 lt!85652)))))

(assert (=> d!52609 (= (contains!1155 (toList!1093 lt!85652) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85846)))

(declare-fun b!173574 () Bool)

(declare-fun e!114643 () Bool)

(assert (=> b!173574 (= e!114644 e!114643)))

(declare-fun res!82394 () Bool)

(assert (=> b!173574 (=> res!82394 e!114643)))

(assert (=> b!173574 (= res!82394 (= (h!2827 (toList!1093 lt!85652)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173575 () Bool)

(assert (=> b!173575 (= e!114643 (contains!1155 (t!7012 (toList!1093 lt!85652)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52609 res!82393) b!173574))

(assert (= (and b!173574 (not res!82394)) b!173575))

(declare-fun m!201745 () Bool)

(assert (=> d!52609 m!201745))

(declare-fun m!201747 () Bool)

(assert (=> d!52609 m!201747))

(declare-fun m!201749 () Bool)

(assert (=> b!173575 m!201749))

(assert (=> b!173267 d!52609))

(declare-fun d!52611 () Bool)

(assert (=> d!52611 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85537) key!828))))

(declare-fun lt!85849 () Unit!5291)

(declare-fun choose!939 (List!2214 (_ BitVec 64)) Unit!5291)

(assert (=> d!52611 (= lt!85849 (choose!939 (toList!1093 lt!85537) key!828))))

(declare-fun e!114647 () Bool)

(assert (=> d!52611 e!114647))

(declare-fun res!82397 () Bool)

(assert (=> d!52611 (=> (not res!82397) (not e!114647))))

(assert (=> d!52611 (= res!82397 (isStrictlySorted!327 (toList!1093 lt!85537)))))

(assert (=> d!52611 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85537) key!828) lt!85849)))

(declare-fun b!173578 () Bool)

(assert (=> b!173578 (= e!114647 (containsKey!187 (toList!1093 lt!85537) key!828))))

(assert (= (and d!52611 res!82397) b!173578))

(assert (=> d!52611 m!201095))

(assert (=> d!52611 m!201095))

(assert (=> d!52611 m!201097))

(declare-fun m!201751 () Bool)

(assert (=> d!52611 m!201751))

(declare-fun m!201753 () Bool)

(assert (=> d!52611 m!201753))

(assert (=> b!173578 m!201091))

(assert (=> b!173180 d!52611))

(assert (=> b!173180 d!52597))

(assert (=> b!173180 d!52599))

(assert (=> b!173257 d!52479))

(declare-fun d!52613 () Bool)

(declare-fun e!114648 () Bool)

(assert (=> d!52613 e!114648))

(declare-fun res!82399 () Bool)

(assert (=> d!52613 (=> (not res!82399) (not e!114648))))

(declare-fun lt!85851 () ListLongMap!2155)

(assert (=> d!52613 (= res!82399 (contains!1152 lt!85851 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!85853 () List!2214)

(assert (=> d!52613 (= lt!85851 (ListLongMap!2156 lt!85853))))

(declare-fun lt!85852 () Unit!5291)

(declare-fun lt!85850 () Unit!5291)

(assert (=> d!52613 (= lt!85852 lt!85850)))

(assert (=> d!52613 (= (getValueByKey!183 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!188 (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52613 (= lt!85850 (lemmaContainsTupThenGetReturnValue!99 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52613 (= lt!85853 (insertStrictlySorted!102 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52613 (= (+!240 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85851)))

(declare-fun b!173579 () Bool)

(declare-fun res!82398 () Bool)

(assert (=> b!173579 (=> (not res!82398) (not e!114648))))

(assert (=> b!173579 (= res!82398 (= (getValueByKey!183 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!188 (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173580 () Bool)

(assert (=> b!173580 (= e!114648 (contains!1155 (toList!1093 lt!85851) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52613 res!82399) b!173579))

(assert (= (and b!173579 res!82398) b!173580))

(declare-fun m!201755 () Bool)

(assert (=> d!52613 m!201755))

(declare-fun m!201757 () Bool)

(assert (=> d!52613 m!201757))

(declare-fun m!201759 () Bool)

(assert (=> d!52613 m!201759))

(declare-fun m!201761 () Bool)

(assert (=> d!52613 m!201761))

(declare-fun m!201763 () Bool)

(assert (=> b!173579 m!201763))

(declare-fun m!201765 () Bool)

(assert (=> b!173580 m!201765))

(assert (=> bm!17555 d!52613))

(declare-fun b!173589 () Bool)

(declare-fun e!114653 () (_ BitVec 32))

(assert (=> b!173589 (= e!114653 #b00000000000000000000000000000000)))

(declare-fun b!173590 () Bool)

(declare-fun e!114654 () (_ BitVec 32))

(assert (=> b!173590 (= e!114653 e!114654)))

(declare-fun c!30975 () Bool)

(assert (=> b!173590 (= c!30975 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173591 () Bool)

(declare-fun call!17595 () (_ BitVec 32))

(assert (=> b!173591 (= e!114654 call!17595)))

(declare-fun bm!17592 () Bool)

(assert (=> bm!17592 (= call!17595 (arrayCountValidKeys!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun d!52615 () Bool)

(declare-fun lt!85856 () (_ BitVec 32))

(assert (=> d!52615 (and (bvsge lt!85856 #b00000000000000000000000000000000) (bvsle lt!85856 (bvsub (size!3754 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52615 (= lt!85856 e!114653)))

(declare-fun c!30976 () Bool)

(assert (=> d!52615 (= c!30976 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52615 (and (bvsle #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3754 (_keys!5437 thiss!1248)) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52615 (= (arrayCountValidKeys!0 (_keys!5437 thiss!1248) #b00000000000000000000000000000000 (size!3754 (_keys!5437 thiss!1248))) lt!85856)))

(declare-fun b!173592 () Bool)

(assert (=> b!173592 (= e!114654 (bvadd #b00000000000000000000000000000001 call!17595))))

(assert (= (and d!52615 c!30976) b!173589))

(assert (= (and d!52615 (not c!30976)) b!173590))

(assert (= (and b!173590 c!30975) b!173592))

(assert (= (and b!173590 (not c!30975)) b!173591))

(assert (= (or b!173592 b!173591) bm!17592))

(assert (=> b!173590 m!201133))

(assert (=> b!173590 m!201133))

(assert (=> b!173590 m!201135))

(declare-fun m!201767 () Bool)

(assert (=> bm!17592 m!201767))

(assert (=> b!173189 d!52615))

(declare-fun b!173593 () Bool)

(declare-fun e!114655 () (_ BitVec 32))

(assert (=> b!173593 (= e!114655 #b00000000000000000000000000000000)))

(declare-fun b!173594 () Bool)

(declare-fun e!114656 () (_ BitVec 32))

(assert (=> b!173594 (= e!114655 e!114656)))

(declare-fun c!30977 () Bool)

(assert (=> b!173594 (= c!30977 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173595 () Bool)

(declare-fun call!17596 () (_ BitVec 32))

(assert (=> b!173595 (= e!114656 call!17596)))

(declare-fun bm!17593 () Bool)

(assert (=> bm!17593 (= call!17596 (arrayCountValidKeys!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(declare-fun d!52617 () Bool)

(declare-fun lt!85857 () (_ BitVec 32))

(assert (=> d!52617 (and (bvsge lt!85857 #b00000000000000000000000000000000) (bvsle lt!85857 (bvsub (size!3754 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> d!52617 (= lt!85857 e!114655)))

(declare-fun c!30978 () Bool)

(assert (=> d!52617 (= c!30978 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52617 (and (bvsle #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3754 (_keys!5437 lt!85539)) (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52617 (= (arrayCountValidKeys!0 (_keys!5437 lt!85539) #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))) lt!85857)))

(declare-fun b!173596 () Bool)

(assert (=> b!173596 (= e!114656 (bvadd #b00000000000000000000000000000001 call!17596))))

(assert (= (and d!52617 c!30978) b!173593))

(assert (= (and d!52617 (not c!30978)) b!173594))

(assert (= (and b!173594 c!30977) b!173596))

(assert (= (and b!173594 (not c!30977)) b!173595))

(assert (= (or b!173596 b!173595) bm!17593))

(assert (=> b!173594 m!201317))

(assert (=> b!173594 m!201317))

(assert (=> b!173594 m!201319))

(declare-fun m!201769 () Bool)

(assert (=> bm!17593 m!201769))

(assert (=> b!173263 d!52617))

(declare-fun mapNonEmpty!6958 () Bool)

(declare-fun mapRes!6958 () Bool)

(declare-fun tp!15607 () Bool)

(declare-fun e!114657 () Bool)

(assert (=> mapNonEmpty!6958 (= mapRes!6958 (and tp!15607 e!114657))))

(declare-fun mapRest!6958 () (Array (_ BitVec 32) ValueCell!1697))

(declare-fun mapKey!6958 () (_ BitVec 32))

(declare-fun mapValue!6958 () ValueCell!1697)

(assert (=> mapNonEmpty!6958 (= mapRest!6957 (store mapRest!6958 mapKey!6958 mapValue!6958))))

(declare-fun b!173598 () Bool)

(declare-fun e!114658 () Bool)

(assert (=> b!173598 (= e!114658 tp_is_empty!4081)))

(declare-fun b!173597 () Bool)

(assert (=> b!173597 (= e!114657 tp_is_empty!4081)))

(declare-fun condMapEmpty!6958 () Bool)

(declare-fun mapDefault!6958 () ValueCell!1697)

(assert (=> mapNonEmpty!6957 (= condMapEmpty!6958 (= mapRest!6957 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6958)))))

(assert (=> mapNonEmpty!6957 (= tp!15606 (and e!114658 mapRes!6958))))

(declare-fun mapIsEmpty!6958 () Bool)

(assert (=> mapIsEmpty!6958 mapRes!6958))

(assert (= (and mapNonEmpty!6957 condMapEmpty!6958) mapIsEmpty!6958))

(assert (= (and mapNonEmpty!6957 (not condMapEmpty!6958)) mapNonEmpty!6958))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1697) mapValue!6958)) b!173597))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1697) mapDefault!6958)) b!173598))

(declare-fun m!201771 () Bool)

(assert (=> mapNonEmpty!6958 m!201771))

(declare-fun b_lambda!6935 () Bool)

(assert (= b_lambda!6927 (or (and b!173125 b_free!4309) b_lambda!6935)))

(declare-fun b_lambda!6937 () Bool)

(assert (= b_lambda!6925 (or (and b!173125 b_free!4309) b_lambda!6937)))

(declare-fun b_lambda!6939 () Bool)

(assert (= b_lambda!6933 (or (and b!173125 b_free!4309) b_lambda!6939)))

(declare-fun b_lambda!6941 () Bool)

(assert (= b_lambda!6931 (or (and b!173125 b_free!4309) b_lambda!6941)))

(check-sat (not b!173488) (not d!52557) (not d!52501) (not d!52537) (not b!173364) (not b!173368) (not d!52551) (not b!173458) (not bm!17561) (not d!52465) (not b!173486) (not b!173317) (not d!52513) (not d!52597) (not b!173578) (not b!173439) (not d!52613) (not b!173421) (not b!173489) (not b!173547) (not d!52603) (not b!173551) (not b!173396) (not d!52591) (not b_next!4309) (not d!52491) (not b!173373) (not d!52533) (not b!173546) (not b!173433) (not b!173397) (not b!173505) (not b!173467) (not d!52469) (not d!52515) (not b!173358) (not d!52527) (not b!173541) (not d!52611) (not d!52609) (not d!52475) (not bm!17581) (not b!173472) (not b!173420) (not b!173469) (not b!173554) (not b!173594) (not d!52565) (not b!173301) (not d!52517) (not b!173453) (not b!173349) (not b!173436) (not b!173307) (not bm!17588) (not d!52523) (not d!52505) (not d!52579) (not d!52547) (not b!173345) (not d!52531) (not bm!17589) (not b_lambda!6937) (not d!52555) (not bm!17584) (not b!173480) (not b!173451) (not b!173496) (not b!173481) (not b!173456) (not b!173450) (not b!173370) (not d!52567) (not d!52507) (not d!52503) (not b!173435) (not d!52607) (not b!173377) (not b!173455) (not b!173491) (not bm!17567) (not d!52593) (not d!52521) (not d!52553) (not d!52535) (not b!173499) (not b!173430) (not b!173504) (not b!173485) (not b!173543) (not d!52485) (not bm!17564) (not bm!17565) (not b!173490) (not b!173501) (not b!173471) (not d!52569) (not b!173351) (not b!173348) (not b!173500) (not d!52487) (not b!173449) (not b!173483) (not b!173539) (not b!173318) (not d!52571) (not d!52529) (not d!52473) (not b_lambda!6929) (not b!173566) (not bm!17587) b_and!10741 (not d!52519) (not b!173544) (not b!173440) (not d!52549) (not d!52573) (not b!173562) (not b!173360) (not b!173419) (not b!173520) (not d!52563) (not b!173518) (not b!173379) (not b!173468) (not b!173579) (not bm!17592) (not b_lambda!6921) (not d!52545) (not bm!17578) (not b!173532) (not d!52495) (not b!173508) (not b!173580) (not d!52499) (not b!173575) (not d!52575) (not b!173390) (not b!173428) (not b_lambda!6939) (not d!52541) (not b!173352) tp_is_empty!4081 (not bm!17566) (not b!173300) (not b!173457) (not b!173306) (not b!173502) (not d!52561) (not b!173533) (not mapNonEmpty!6958) (not b!173350) (not b!173474) (not b!173447) (not b!173503) (not d!52471) (not b!173299) (not b!173353) (not b!173438) (not d!52483) (not b!173558) (not b!173548) (not d!52509) (not d!52583) (not d!52559) (not d!52577) (not b!173448) (not d!52511) (not d!52581) (not b!173357) (not b!173452) (not b!173297) (not b!173354) (not b!173537) (not d!52493) (not b!173536) (not b!173561) (not d!52525) (not b!173459) (not bm!17593) (not b!173509) (not b_lambda!6935) (not b!173359) (not b_lambda!6941) (not b!173494) (not bm!17575) (not b!173573) (not b!173492) (not b!173590) (not b_lambda!6923) (not d!52481) (not d!52539))
(check-sat b_and!10741 (not b_next!4309))
(get-model)

(declare-fun d!52619 () Bool)

(assert (=> d!52619 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!85643)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!85643)))))

(assert (=> d!52567 d!52619))

(declare-fun b!173600 () Bool)

(declare-fun e!114659 () Option!189)

(declare-fun e!114660 () Option!189)

(assert (=> b!173600 (= e!114659 e!114660)))

(declare-fun c!30980 () Bool)

(assert (=> b!173600 (= c!30980 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))) lt!85643))))))

(declare-fun b!173601 () Bool)

(assert (=> b!173601 (= e!114660 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))) lt!85643))))

(declare-fun b!173599 () Bool)

(assert (=> b!173599 (= e!114659 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))))

(declare-fun d!52621 () Bool)

(declare-fun c!30979 () Bool)

(assert (=> d!52621 (= c!30979 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))) lt!85643)))))

(assert (=> d!52621 (= (getValueByKey!183 (toList!1093 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!85643) e!114659)))

(declare-fun b!173602 () Bool)

(assert (=> b!173602 (= e!114660 None!187)))

(assert (= (and d!52621 c!30979) b!173599))

(assert (= (and d!52621 (not c!30979)) b!173600))

(assert (= (and b!173600 c!30980) b!173601))

(assert (= (and b!173600 (not c!30980)) b!173602))

(declare-fun m!201773 () Bool)

(assert (=> b!173601 m!201773))

(assert (=> d!52567 d!52621))

(declare-fun d!52623 () Bool)

(declare-fun e!114662 () Bool)

(assert (=> d!52623 e!114662))

(declare-fun res!82400 () Bool)

(assert (=> d!52623 (=> res!82400 e!114662)))

(declare-fun lt!85859 () Bool)

(assert (=> d!52623 (= res!82400 (not lt!85859))))

(declare-fun lt!85858 () Bool)

(assert (=> d!52623 (= lt!85859 lt!85858)))

(declare-fun lt!85861 () Unit!5291)

(declare-fun e!114661 () Unit!5291)

(assert (=> d!52623 (= lt!85861 e!114661)))

(declare-fun c!30981 () Bool)

(assert (=> d!52623 (= c!30981 lt!85858)))

(assert (=> d!52623 (= lt!85858 (containsKey!187 (toList!1093 lt!85714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52623 (= (contains!1152 lt!85714 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85859)))

(declare-fun b!173603 () Bool)

(declare-fun lt!85860 () Unit!5291)

(assert (=> b!173603 (= e!114661 lt!85860)))

(assert (=> b!173603 (= lt!85860 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173603 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173604 () Bool)

(declare-fun Unit!5307 () Unit!5291)

(assert (=> b!173604 (= e!114661 Unit!5307)))

(declare-fun b!173605 () Bool)

(assert (=> b!173605 (= e!114662 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52623 c!30981) b!173603))

(assert (= (and d!52623 (not c!30981)) b!173604))

(assert (= (and d!52623 (not res!82400)) b!173605))

(declare-fun m!201775 () Bool)

(assert (=> d!52623 m!201775))

(declare-fun m!201777 () Bool)

(assert (=> b!173603 m!201777))

(declare-fun m!201779 () Bool)

(assert (=> b!173603 m!201779))

(assert (=> b!173603 m!201779))

(declare-fun m!201781 () Bool)

(assert (=> b!173603 m!201781))

(assert (=> b!173605 m!201779))

(assert (=> b!173605 m!201779))

(assert (=> b!173605 m!201781))

(assert (=> bm!17566 d!52623))

(declare-fun d!52625 () Bool)

(assert (=> d!52625 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7148 () Bool)

(assert (= bs!7148 d!52625))

(assert (=> bs!7148 m!201199))

(declare-fun m!201783 () Bool)

(assert (=> bs!7148 m!201783))

(assert (=> b!173430 d!52625))

(assert (=> b!173430 d!52605))

(declare-fun d!52627 () Bool)

(declare-fun e!114663 () Bool)

(assert (=> d!52627 e!114663))

(declare-fun res!82402 () Bool)

(assert (=> d!52627 (=> (not res!82402) (not e!114663))))

(declare-fun lt!85863 () ListLongMap!2155)

(assert (=> d!52627 (= res!82402 (contains!1152 lt!85863 (_1!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))))

(declare-fun lt!85865 () List!2214)

(assert (=> d!52627 (= lt!85863 (ListLongMap!2156 lt!85865))))

(declare-fun lt!85864 () Unit!5291)

(declare-fun lt!85862 () Unit!5291)

(assert (=> d!52627 (= lt!85864 lt!85862)))

(assert (=> d!52627 (= (getValueByKey!183 lt!85865 (_1!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))) (Some!188 (_2!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))))

(assert (=> d!52627 (= lt!85862 (lemmaContainsTupThenGetReturnValue!99 lt!85865 (_1!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))) (_2!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))))

(assert (=> d!52627 (= lt!85865 (insertStrictlySorted!102 (toList!1093 (ite c!30916 call!17569 (ite c!30919 call!17567 call!17568))) (_1!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))) (_2!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))))

(assert (=> d!52627 (= (+!240 (ite c!30916 call!17569 (ite c!30919 call!17567 call!17568)) (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))) lt!85863)))

(declare-fun b!173606 () Bool)

(declare-fun res!82401 () Bool)

(assert (=> b!173606 (=> (not res!82401) (not e!114663))))

(assert (=> b!173606 (= res!82401 (= (getValueByKey!183 (toList!1093 lt!85863) (_1!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))) (Some!188 (_2!1629 (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))))

(declare-fun b!173607 () Bool)

(assert (=> b!173607 (= e!114663 (contains!1155 (toList!1093 lt!85863) (ite (or c!30916 c!30919) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85539)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(assert (= (and d!52627 res!82402) b!173606))

(assert (= (and b!173606 res!82401) b!173607))

(declare-fun m!201785 () Bool)

(assert (=> d!52627 m!201785))

(declare-fun m!201787 () Bool)

(assert (=> d!52627 m!201787))

(declare-fun m!201789 () Bool)

(assert (=> d!52627 m!201789))

(declare-fun m!201791 () Bool)

(assert (=> d!52627 m!201791))

(declare-fun m!201793 () Bool)

(assert (=> b!173606 m!201793))

(declare-fun m!201795 () Bool)

(assert (=> b!173607 m!201795))

(assert (=> bm!17565 d!52627))

(declare-fun b!173609 () Bool)

(declare-fun e!114664 () Option!189)

(declare-fun e!114665 () Option!189)

(assert (=> b!173609 (= e!114664 e!114665)))

(declare-fun c!30983 () Bool)

(assert (=> b!173609 (= c!30983 (and ((_ is Cons!2210) (toList!1093 lt!85820)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85820))) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173610 () Bool)

(assert (=> b!173610 (= e!114665 (getValueByKey!183 (t!7012 (toList!1093 lt!85820)) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun b!173608 () Bool)

(assert (=> b!173608 (= e!114664 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85820)))))))

(declare-fun d!52629 () Bool)

(declare-fun c!30982 () Bool)

(assert (=> d!52629 (= c!30982 (and ((_ is Cons!2210) (toList!1093 lt!85820)) (= (_1!1629 (h!2827 (toList!1093 lt!85820))) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(assert (=> d!52629 (= (getValueByKey!183 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) e!114664)))

(declare-fun b!173611 () Bool)

(assert (=> b!173611 (= e!114665 None!187)))

(assert (= (and d!52629 c!30982) b!173608))

(assert (= (and d!52629 (not c!30982)) b!173609))

(assert (= (and b!173609 c!30983) b!173610))

(assert (= (and b!173609 (not c!30983)) b!173611))

(declare-fun m!201797 () Bool)

(assert (=> b!173610 m!201797))

(assert (=> b!173508 d!52629))

(declare-fun d!52631 () Bool)

(declare-fun e!114667 () Bool)

(assert (=> d!52631 e!114667))

(declare-fun res!82403 () Bool)

(assert (=> d!52631 (=> res!82403 e!114667)))

(declare-fun lt!85867 () Bool)

(assert (=> d!52631 (= res!82403 (not lt!85867))))

(declare-fun lt!85866 () Bool)

(assert (=> d!52631 (= lt!85867 lt!85866)))

(declare-fun lt!85869 () Unit!5291)

(declare-fun e!114666 () Unit!5291)

(assert (=> d!52631 (= lt!85869 e!114666)))

(declare-fun c!30984 () Bool)

(assert (=> d!52631 (= c!30984 lt!85866)))

(assert (=> d!52631 (= lt!85866 (containsKey!187 (toList!1093 lt!85704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52631 (= (contains!1152 lt!85704 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85867)))

(declare-fun b!173612 () Bool)

(declare-fun lt!85868 () Unit!5291)

(assert (=> b!173612 (= e!114666 lt!85868)))

(assert (=> b!173612 (= lt!85868 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173612 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173613 () Bool)

(declare-fun Unit!5308 () Unit!5291)

(assert (=> b!173613 (= e!114666 Unit!5308)))

(declare-fun b!173614 () Bool)

(assert (=> b!173614 (= e!114667 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52631 c!30984) b!173612))

(assert (= (and d!52631 (not c!30984)) b!173613))

(assert (= (and d!52631 (not res!82403)) b!173614))

(declare-fun m!201799 () Bool)

(assert (=> d!52631 m!201799))

(declare-fun m!201801 () Bool)

(assert (=> b!173612 m!201801))

(declare-fun m!201803 () Bool)

(assert (=> b!173612 m!201803))

(assert (=> b!173612 m!201803))

(declare-fun m!201805 () Bool)

(assert (=> b!173612 m!201805))

(assert (=> b!173614 m!201803))

(assert (=> b!173614 m!201803))

(assert (=> b!173614 m!201805))

(assert (=> b!173352 d!52631))

(assert (=> d!52575 d!52549))

(declare-fun d!52633 () Bool)

(declare-fun e!114669 () Bool)

(assert (=> d!52633 e!114669))

(declare-fun res!82404 () Bool)

(assert (=> d!52633 (=> res!82404 e!114669)))

(declare-fun lt!85871 () Bool)

(assert (=> d!52633 (= res!82404 (not lt!85871))))

(declare-fun lt!85870 () Bool)

(assert (=> d!52633 (= lt!85871 lt!85870)))

(declare-fun lt!85873 () Unit!5291)

(declare-fun e!114668 () Unit!5291)

(assert (=> d!52633 (= lt!85873 e!114668)))

(declare-fun c!30985 () Bool)

(assert (=> d!52633 (= c!30985 lt!85870)))

(assert (=> d!52633 (= lt!85870 (containsKey!187 (toList!1093 lt!85636) lt!85648))))

(assert (=> d!52633 (= (contains!1152 lt!85636 lt!85648) lt!85871)))

(declare-fun b!173615 () Bool)

(declare-fun lt!85872 () Unit!5291)

(assert (=> b!173615 (= e!114668 lt!85872)))

(assert (=> b!173615 (= lt!85872 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85636) lt!85648))))

(assert (=> b!173615 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85636) lt!85648))))

(declare-fun b!173616 () Bool)

(declare-fun Unit!5309 () Unit!5291)

(assert (=> b!173616 (= e!114668 Unit!5309)))

(declare-fun b!173617 () Bool)

(assert (=> b!173617 (= e!114669 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85636) lt!85648)))))

(assert (= (and d!52633 c!30985) b!173615))

(assert (= (and d!52633 (not c!30985)) b!173616))

(assert (= (and d!52633 (not res!82404)) b!173617))

(declare-fun m!201807 () Bool)

(assert (=> d!52633 m!201807))

(declare-fun m!201809 () Bool)

(assert (=> b!173615 m!201809))

(assert (=> b!173615 m!201643))

(assert (=> b!173615 m!201643))

(declare-fun m!201811 () Bool)

(assert (=> b!173615 m!201811))

(assert (=> b!173617 m!201643))

(assert (=> b!173617 m!201643))

(assert (=> b!173617 m!201811))

(assert (=> d!52575 d!52633))

(assert (=> d!52575 d!52559))

(declare-fun d!52635 () Bool)

(assert (=> d!52635 (= (apply!130 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85648) (apply!130 lt!85636 lt!85648))))

(assert (=> d!52635 true))

(declare-fun _$34!1055 () Unit!5291)

(assert (=> d!52635 (= (choose!937 lt!85636 lt!85642 (minValue!3440 thiss!1248) lt!85648) _$34!1055)))

(declare-fun bs!7149 () Bool)

(assert (= bs!7149 d!52635))

(assert (=> bs!7149 m!201139))

(assert (=> bs!7149 m!201139))

(assert (=> bs!7149 m!201161))

(assert (=> bs!7149 m!201145))

(assert (=> d!52575 d!52635))

(assert (=> d!52575 d!52571))

(declare-fun d!52637 () Bool)

(assert (=> d!52637 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7150 () Bool)

(assert (= bs!7150 d!52637))

(assert (=> bs!7150 m!201277))

(declare-fun m!201813 () Bool)

(assert (=> bs!7150 m!201813))

(assert (=> b!173474 d!52637))

(declare-fun b!173620 () Bool)

(declare-fun e!114670 () Option!189)

(declare-fun e!114671 () Option!189)

(assert (=> b!173620 (= e!114670 e!114671)))

(declare-fun c!30987 () Bool)

(assert (=> b!173620 (= c!30987 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85663))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!173621 () Bool)

(assert (=> b!173621 (= e!114671 (getValueByKey!183 (t!7012 (toList!1093 lt!85663)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173619 () Bool)

(assert (=> b!173619 (= e!114670 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85663)))))))

(declare-fun d!52639 () Bool)

(declare-fun c!30986 () Bool)

(assert (=> d!52639 (= c!30986 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52639 (= (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) e!114670)))

(declare-fun b!173622 () Bool)

(assert (=> b!173622 (= e!114671 None!187)))

(assert (= (and d!52639 c!30986) b!173619))

(assert (= (and d!52639 (not c!30986)) b!173620))

(assert (= (and b!173620 c!30987) b!173621))

(assert (= (and b!173620 (not c!30987)) b!173622))

(assert (=> b!173621 m!201133))

(declare-fun m!201815 () Bool)

(assert (=> b!173621 m!201815))

(assert (=> b!173474 d!52639))

(declare-fun d!52641 () Bool)

(declare-fun e!114672 () Bool)

(assert (=> d!52641 e!114672))

(declare-fun res!82406 () Bool)

(assert (=> d!52641 (=> (not res!82406) (not e!114672))))

(declare-fun lt!85875 () ListLongMap!2155)

(assert (=> d!52641 (= res!82406 (contains!1152 lt!85875 (_1!1629 (tuple2!3237 lt!85699 lt!85705))))))

(declare-fun lt!85877 () List!2214)

(assert (=> d!52641 (= lt!85875 (ListLongMap!2156 lt!85877))))

(declare-fun lt!85876 () Unit!5291)

(declare-fun lt!85874 () Unit!5291)

(assert (=> d!52641 (= lt!85876 lt!85874)))

(assert (=> d!52641 (= (getValueByKey!183 lt!85877 (_1!1629 (tuple2!3237 lt!85699 lt!85705))) (Some!188 (_2!1629 (tuple2!3237 lt!85699 lt!85705))))))

(assert (=> d!52641 (= lt!85874 (lemmaContainsTupThenGetReturnValue!99 lt!85877 (_1!1629 (tuple2!3237 lt!85699 lt!85705)) (_2!1629 (tuple2!3237 lt!85699 lt!85705))))))

(assert (=> d!52641 (= lt!85877 (insertStrictlySorted!102 (toList!1093 lt!85702) (_1!1629 (tuple2!3237 lt!85699 lt!85705)) (_2!1629 (tuple2!3237 lt!85699 lt!85705))))))

(assert (=> d!52641 (= (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705)) lt!85875)))

(declare-fun b!173623 () Bool)

(declare-fun res!82405 () Bool)

(assert (=> b!173623 (=> (not res!82405) (not e!114672))))

(assert (=> b!173623 (= res!82405 (= (getValueByKey!183 (toList!1093 lt!85875) (_1!1629 (tuple2!3237 lt!85699 lt!85705))) (Some!188 (_2!1629 (tuple2!3237 lt!85699 lt!85705)))))))

(declare-fun b!173624 () Bool)

(assert (=> b!173624 (= e!114672 (contains!1155 (toList!1093 lt!85875) (tuple2!3237 lt!85699 lt!85705)))))

(assert (= (and d!52641 res!82406) b!173623))

(assert (= (and b!173623 res!82405) b!173624))

(declare-fun m!201817 () Bool)

(assert (=> d!52641 m!201817))

(declare-fun m!201819 () Bool)

(assert (=> d!52641 m!201819))

(declare-fun m!201821 () Bool)

(assert (=> d!52641 m!201821))

(declare-fun m!201823 () Bool)

(assert (=> d!52641 m!201823))

(declare-fun m!201825 () Bool)

(assert (=> b!173623 m!201825))

(declare-fun m!201827 () Bool)

(assert (=> b!173624 m!201827))

(assert (=> b!173348 d!52641))

(declare-fun d!52643 () Bool)

(declare-fun e!114674 () Bool)

(assert (=> d!52643 e!114674))

(declare-fun res!82407 () Bool)

(assert (=> d!52643 (=> res!82407 e!114674)))

(declare-fun lt!85879 () Bool)

(assert (=> d!52643 (= res!82407 (not lt!85879))))

(declare-fun lt!85878 () Bool)

(assert (=> d!52643 (= lt!85879 lt!85878)))

(declare-fun lt!85881 () Unit!5291)

(declare-fun e!114673 () Unit!5291)

(assert (=> d!52643 (= lt!85881 e!114673)))

(declare-fun c!30988 () Bool)

(assert (=> d!52643 (= c!30988 lt!85878)))

(assert (=> d!52643 (= lt!85878 (containsKey!187 (toList!1093 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705))) lt!85701))))

(assert (=> d!52643 (= (contains!1152 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705)) lt!85701) lt!85879)))

(declare-fun b!173625 () Bool)

(declare-fun lt!85880 () Unit!5291)

(assert (=> b!173625 (= e!114673 lt!85880)))

(assert (=> b!173625 (= lt!85880 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705))) lt!85701))))

(assert (=> b!173625 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705))) lt!85701))))

(declare-fun b!173626 () Bool)

(declare-fun Unit!5310 () Unit!5291)

(assert (=> b!173626 (= e!114673 Unit!5310)))

(declare-fun b!173627 () Bool)

(assert (=> b!173627 (= e!114674 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705))) lt!85701)))))

(assert (= (and d!52643 c!30988) b!173625))

(assert (= (and d!52643 (not c!30988)) b!173626))

(assert (= (and d!52643 (not res!82407)) b!173627))

(declare-fun m!201829 () Bool)

(assert (=> d!52643 m!201829))

(declare-fun m!201831 () Bool)

(assert (=> b!173625 m!201831))

(declare-fun m!201833 () Bool)

(assert (=> b!173625 m!201833))

(assert (=> b!173625 m!201833))

(declare-fun m!201835 () Bool)

(assert (=> b!173625 m!201835))

(assert (=> b!173627 m!201833))

(assert (=> b!173627 m!201833))

(assert (=> b!173627 m!201835))

(assert (=> b!173348 d!52643))

(declare-fun d!52645 () Bool)

(declare-fun e!114675 () Bool)

(assert (=> d!52645 e!114675))

(declare-fun res!82409 () Bool)

(assert (=> d!52645 (=> (not res!82409) (not e!114675))))

(declare-fun lt!85883 () ListLongMap!2155)

(assert (=> d!52645 (= res!82409 (contains!1152 lt!85883 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85885 () List!2214)

(assert (=> d!52645 (= lt!85883 (ListLongMap!2156 lt!85885))))

(declare-fun lt!85884 () Unit!5291)

(declare-fun lt!85882 () Unit!5291)

(assert (=> d!52645 (= lt!85884 lt!85882)))

(assert (=> d!52645 (= (getValueByKey!183 lt!85885 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52645 (= lt!85882 (lemmaContainsTupThenGetReturnValue!99 lt!85885 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52645 (= lt!85885 (insertStrictlySorted!102 (toList!1093 call!17564) (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52645 (= (+!240 call!17564 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85883)))

(declare-fun b!173628 () Bool)

(declare-fun res!82408 () Bool)

(assert (=> b!173628 (=> (not res!82408) (not e!114675))))

(assert (=> b!173628 (= res!82408 (= (getValueByKey!183 (toList!1093 lt!85883) (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!173629 () Bool)

(assert (=> b!173629 (= e!114675 (contains!1155 (toList!1093 lt!85883) (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52645 res!82409) b!173628))

(assert (= (and b!173628 res!82408) b!173629))

(declare-fun m!201837 () Bool)

(assert (=> d!52645 m!201837))

(declare-fun m!201839 () Bool)

(assert (=> d!52645 m!201839))

(declare-fun m!201841 () Bool)

(assert (=> d!52645 m!201841))

(declare-fun m!201843 () Bool)

(assert (=> d!52645 m!201843))

(declare-fun m!201845 () Bool)

(assert (=> b!173628 m!201845))

(declare-fun m!201847 () Bool)

(assert (=> b!173629 m!201847))

(assert (=> b!173348 d!52645))

(assert (=> b!173348 d!52477))

(declare-fun d!52647 () Bool)

(assert (=> d!52647 (not (contains!1152 (+!240 lt!85702 (tuple2!3237 lt!85699 lt!85705)) lt!85701))))

(declare-fun lt!85888 () Unit!5291)

(declare-fun choose!940 (ListLongMap!2155 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5291)

(assert (=> d!52647 (= lt!85888 (choose!940 lt!85702 lt!85699 lt!85705 lt!85701))))

(declare-fun e!114678 () Bool)

(assert (=> d!52647 e!114678))

(declare-fun res!82412 () Bool)

(assert (=> d!52647 (=> (not res!82412) (not e!114678))))

(assert (=> d!52647 (= res!82412 (not (contains!1152 lt!85702 lt!85701)))))

(assert (=> d!52647 (= (addStillNotContains!73 lt!85702 lt!85699 lt!85705 lt!85701) lt!85888)))

(declare-fun b!173633 () Bool)

(assert (=> b!173633 (= e!114678 (not (= lt!85699 lt!85701)))))

(assert (= (and d!52647 res!82412) b!173633))

(assert (=> d!52647 m!201295))

(assert (=> d!52647 m!201295))

(assert (=> d!52647 m!201299))

(declare-fun m!201849 () Bool)

(assert (=> d!52647 m!201849))

(declare-fun m!201851 () Bool)

(assert (=> d!52647 m!201851))

(assert (=> b!173348 d!52647))

(declare-fun bm!17594 () Bool)

(declare-fun call!17597 () ListLongMap!2155)

(assert (=> bm!17594 (= call!17597 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173634 () Bool)

(declare-fun e!114680 () Bool)

(declare-fun e!114682 () Bool)

(assert (=> b!173634 (= e!114680 e!114682)))

(declare-fun c!30991 () Bool)

(assert (=> b!173634 (= c!30991 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173635 () Bool)

(declare-fun e!114683 () Bool)

(assert (=> b!173635 (= e!114680 e!114683)))

(assert (=> b!173635 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun res!82416 () Bool)

(declare-fun lt!85894 () ListLongMap!2155)

(assert (=> b!173635 (= res!82416 (contains!1152 lt!85894 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173635 (=> (not res!82416) (not e!114683))))

(declare-fun b!173636 () Bool)

(declare-fun e!114684 () ListLongMap!2155)

(assert (=> b!173636 (= e!114684 call!17597)))

(declare-fun b!173637 () Bool)

(declare-fun e!114679 () ListLongMap!2155)

(assert (=> b!173637 (= e!114679 (ListLongMap!2156 Nil!2211))))

(declare-fun b!173638 () Bool)

(declare-fun lt!85890 () Unit!5291)

(declare-fun lt!85893 () Unit!5291)

(assert (=> b!173638 (= lt!85890 lt!85893)))

(declare-fun lt!85895 () V!5089)

(declare-fun lt!85891 () (_ BitVec 64))

(declare-fun lt!85889 () (_ BitVec 64))

(declare-fun lt!85892 () ListLongMap!2155)

(assert (=> b!173638 (not (contains!1152 (+!240 lt!85892 (tuple2!3237 lt!85889 lt!85895)) lt!85891))))

(assert (=> b!173638 (= lt!85893 (addStillNotContains!73 lt!85892 lt!85889 lt!85895 lt!85891))))

(assert (=> b!173638 (= lt!85891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173638 (= lt!85895 (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173638 (= lt!85889 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!173638 (= lt!85892 call!17597)))

(assert (=> b!173638 (= e!114684 (+!240 call!17597 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173639 () Bool)

(assert (=> b!173639 (= e!114679 e!114684)))

(declare-fun c!30990 () Bool)

(assert (=> b!173639 (= c!30990 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52649 () Bool)

(declare-fun e!114681 () Bool)

(assert (=> d!52649 e!114681))

(declare-fun res!82413 () Bool)

(assert (=> d!52649 (=> (not res!82413) (not e!114681))))

(assert (=> d!52649 (= res!82413 (not (contains!1152 lt!85894 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52649 (= lt!85894 e!114679)))

(declare-fun c!30989 () Bool)

(assert (=> d!52649 (= c!30989 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52649 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52649 (= (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)) lt!85894)))

(declare-fun b!173640 () Bool)

(declare-fun e!114685 () Bool)

(assert (=> b!173640 (= e!114685 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173640 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!173641 () Bool)

(assert (=> b!173641 (= e!114682 (isEmpty!440 lt!85894))))

(declare-fun b!173642 () Bool)

(declare-fun res!82414 () Bool)

(assert (=> b!173642 (=> (not res!82414) (not e!114681))))

(assert (=> b!173642 (= res!82414 (not (contains!1152 lt!85894 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173643 () Bool)

(assert (=> b!173643 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> b!173643 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173643 (= e!114683 (= (apply!130 lt!85894 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173644 () Bool)

(assert (=> b!173644 (= e!114682 (= lt!85894 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173645 () Bool)

(assert (=> b!173645 (= e!114681 e!114680)))

(declare-fun c!30992 () Bool)

(assert (=> b!173645 (= c!30992 e!114685)))

(declare-fun res!82415 () Bool)

(assert (=> b!173645 (=> (not res!82415) (not e!114685))))

(assert (=> b!173645 (= res!82415 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (= (and d!52649 c!30989) b!173637))

(assert (= (and d!52649 (not c!30989)) b!173639))

(assert (= (and b!173639 c!30990) b!173638))

(assert (= (and b!173639 (not c!30990)) b!173636))

(assert (= (or b!173638 b!173636) bm!17594))

(assert (= (and d!52649 res!82413) b!173642))

(assert (= (and b!173642 res!82414) b!173645))

(assert (= (and b!173645 res!82415) b!173640))

(assert (= (and b!173645 c!30992) b!173635))

(assert (= (and b!173645 (not c!30992)) b!173634))

(assert (= (and b!173635 res!82416) b!173643))

(assert (= (and b!173634 c!30991) b!173644))

(assert (= (and b!173634 (not c!30991)) b!173641))

(declare-fun b_lambda!6943 () Bool)

(assert (=> (not b_lambda!6943) (not b!173638)))

(assert (=> b!173638 t!7016))

(declare-fun b_and!10743 () Bool)

(assert (= b_and!10741 (and (=> t!7016 result!4577) b_and!10743)))

(declare-fun b_lambda!6945 () Bool)

(assert (=> (not b_lambda!6945) (not b!173643)))

(assert (=> b!173643 t!7016))

(declare-fun b_and!10745 () Bool)

(assert (= b_and!10743 (and (=> t!7016 result!4577) b_and!10745)))

(declare-fun m!201853 () Bool)

(assert (=> b!173635 m!201853))

(assert (=> b!173635 m!201853))

(declare-fun m!201855 () Bool)

(assert (=> b!173635 m!201855))

(assert (=> b!173639 m!201853))

(assert (=> b!173639 m!201853))

(declare-fun m!201857 () Bool)

(assert (=> b!173639 m!201857))

(declare-fun m!201859 () Bool)

(assert (=> bm!17594 m!201859))

(assert (=> b!173643 m!201853))

(declare-fun m!201861 () Bool)

(assert (=> b!173643 m!201861))

(assert (=> b!173643 m!201853))

(assert (=> b!173643 m!201173))

(declare-fun m!201863 () Bool)

(assert (=> b!173643 m!201863))

(assert (=> b!173643 m!201863))

(assert (=> b!173643 m!201173))

(declare-fun m!201865 () Bool)

(assert (=> b!173643 m!201865))

(assert (=> b!173644 m!201859))

(assert (=> b!173638 m!201853))

(assert (=> b!173638 m!201173))

(declare-fun m!201867 () Bool)

(assert (=> b!173638 m!201867))

(assert (=> b!173638 m!201863))

(assert (=> b!173638 m!201863))

(assert (=> b!173638 m!201173))

(assert (=> b!173638 m!201865))

(declare-fun m!201869 () Bool)

(assert (=> b!173638 m!201869))

(assert (=> b!173638 m!201867))

(declare-fun m!201871 () Bool)

(assert (=> b!173638 m!201871))

(declare-fun m!201873 () Bool)

(assert (=> b!173638 m!201873))

(declare-fun m!201875 () Bool)

(assert (=> d!52649 m!201875))

(assert (=> d!52649 m!201121))

(declare-fun m!201877 () Bool)

(assert (=> b!173641 m!201877))

(assert (=> b!173640 m!201853))

(assert (=> b!173640 m!201853))

(assert (=> b!173640 m!201857))

(declare-fun m!201879 () Bool)

(assert (=> b!173642 m!201879))

(assert (=> bm!17581 d!52649))

(declare-fun d!52651 () Bool)

(assert (=> d!52651 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7151 () Bool)

(assert (= bs!7151 d!52651))

(assert (=> bs!7151 m!201551))

(declare-fun m!201881 () Bool)

(assert (=> bs!7151 m!201881))

(assert (=> b!173471 d!52651))

(declare-fun b!173647 () Bool)

(declare-fun e!114686 () Option!189)

(declare-fun e!114687 () Option!189)

(assert (=> b!173647 (= e!114686 e!114687)))

(declare-fun c!30994 () Bool)

(assert (=> b!173647 (= c!30994 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173648 () Bool)

(assert (=> b!173648 (= e!114687 (getValueByKey!183 (t!7012 (toList!1093 lt!85663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173646 () Bool)

(assert (=> b!173646 (= e!114686 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85663)))))))

(declare-fun d!52653 () Bool)

(declare-fun c!30993 () Bool)

(assert (=> d!52653 (= c!30993 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52653 (= (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000) e!114686)))

(declare-fun b!173649 () Bool)

(assert (=> b!173649 (= e!114687 None!187)))

(assert (= (and d!52653 c!30993) b!173646))

(assert (= (and d!52653 (not c!30993)) b!173647))

(assert (= (and b!173647 c!30994) b!173648))

(assert (= (and b!173647 (not c!30994)) b!173649))

(declare-fun m!201883 () Bool)

(assert (=> b!173648 m!201883))

(assert (=> b!173471 d!52653))

(declare-fun d!52655 () Bool)

(declare-fun res!82417 () Bool)

(declare-fun e!114688 () Bool)

(assert (=> d!52655 (=> res!82417 e!114688)))

(assert (=> d!52655 (= res!82417 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52655 (= (containsKey!187 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) e!114688)))

(declare-fun b!173650 () Bool)

(declare-fun e!114689 () Bool)

(assert (=> b!173650 (= e!114688 e!114689)))

(declare-fun res!82418 () Bool)

(assert (=> b!173650 (=> (not res!82418) (not e!114689))))

(assert (=> b!173650 (= res!82418 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85637))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85637))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2210) (toList!1093 lt!85637)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85637))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!173651 () Bool)

(assert (=> b!173651 (= e!114689 (containsKey!187 (t!7012 (toList!1093 lt!85637)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52655 (not res!82417)) b!173650))

(assert (= (and b!173650 res!82418) b!173651))

(assert (=> b!173651 m!201133))

(declare-fun m!201885 () Bool)

(assert (=> b!173651 m!201885))

(assert (=> d!52591 d!52655))

(declare-fun d!52657 () Bool)

(declare-fun lt!85896 () Bool)

(assert (=> d!52657 (= lt!85896 (select (content!149 (toList!1093 lt!85777)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun e!114691 () Bool)

(assert (=> d!52657 (= lt!85896 e!114691)))

(declare-fun res!82419 () Bool)

(assert (=> d!52657 (=> (not res!82419) (not e!114691))))

(assert (=> d!52657 (= res!82419 ((_ is Cons!2210) (toList!1093 lt!85777)))))

(assert (=> d!52657 (= (contains!1155 (toList!1093 lt!85777) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) lt!85896)))

(declare-fun b!173652 () Bool)

(declare-fun e!114690 () Bool)

(assert (=> b!173652 (= e!114691 e!114690)))

(declare-fun res!82420 () Bool)

(assert (=> b!173652 (=> res!82420 e!114690)))

(assert (=> b!173652 (= res!82420 (= (h!2827 (toList!1093 lt!85777)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun b!173653 () Bool)

(assert (=> b!173653 (= e!114690 (contains!1155 (t!7012 (toList!1093 lt!85777)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(assert (= (and d!52657 res!82419) b!173652))

(assert (= (and b!173652 (not res!82420)) b!173653))

(declare-fun m!201887 () Bool)

(assert (=> d!52657 m!201887))

(declare-fun m!201889 () Bool)

(assert (=> d!52657 m!201889))

(declare-fun m!201891 () Bool)

(assert (=> b!173653 m!201891))

(assert (=> b!173468 d!52657))

(declare-fun d!52659 () Bool)

(declare-fun lt!85897 () Bool)

(assert (=> d!52659 (= lt!85897 (select (content!149 lt!85743) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114693 () Bool)

(assert (=> d!52659 (= lt!85897 e!114693)))

(declare-fun res!82421 () Bool)

(assert (=> d!52659 (=> (not res!82421) (not e!114693))))

(assert (=> d!52659 (= res!82421 ((_ is Cons!2210) lt!85743))))

(assert (=> d!52659 (= (contains!1155 lt!85743 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85897)))

(declare-fun b!173654 () Bool)

(declare-fun e!114692 () Bool)

(assert (=> b!173654 (= e!114693 e!114692)))

(declare-fun res!82422 () Bool)

(assert (=> b!173654 (=> res!82422 e!114692)))

(assert (=> b!173654 (= res!82422 (= (h!2827 lt!85743) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173655 () Bool)

(assert (=> b!173655 (= e!114692 (contains!1155 (t!7012 lt!85743) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52659 res!82421) b!173654))

(assert (= (and b!173654 (not res!82422)) b!173655))

(declare-fun m!201893 () Bool)

(assert (=> d!52659 m!201893))

(declare-fun m!201895 () Bool)

(assert (=> d!52659 m!201895))

(declare-fun m!201897 () Bool)

(assert (=> b!173655 m!201897))

(assert (=> b!173440 d!52659))

(declare-fun d!52661 () Bool)

(declare-fun lt!85898 () Bool)

(assert (=> d!52661 (= lt!85898 (select (content!149 (toList!1093 lt!85803)) (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))

(declare-fun e!114695 () Bool)

(assert (=> d!52661 (= lt!85898 e!114695)))

(declare-fun res!82423 () Bool)

(assert (=> d!52661 (=> (not res!82423) (not e!114695))))

(assert (=> d!52661 (= res!82423 ((_ is Cons!2210) (toList!1093 lt!85803)))))

(assert (=> d!52661 (= (contains!1155 (toList!1093 lt!85803) (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85898)))

(declare-fun b!173656 () Bool)

(declare-fun e!114694 () Bool)

(assert (=> b!173656 (= e!114695 e!114694)))

(declare-fun res!82424 () Bool)

(assert (=> b!173656 (=> res!82424 e!114694)))

(assert (=> b!173656 (= res!82424 (= (h!2827 (toList!1093 lt!85803)) (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))

(declare-fun b!173657 () Bool)

(assert (=> b!173657 (= e!114694 (contains!1155 (t!7012 (toList!1093 lt!85803)) (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52661 res!82423) b!173656))

(assert (= (and b!173656 (not res!82424)) b!173657))

(declare-fun m!201899 () Bool)

(assert (=> d!52661 m!201899))

(declare-fun m!201901 () Bool)

(assert (=> d!52661 m!201901))

(declare-fun m!201903 () Bool)

(assert (=> b!173657 m!201903))

(assert (=> b!173491 d!52661))

(declare-fun d!52663 () Bool)

(assert (=> d!52663 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85656) lt!85673)) (v!3950 (getValueByKey!183 (toList!1093 lt!85656) lt!85673)))))

(assert (=> d!52525 d!52663))

(declare-fun b!173659 () Bool)

(declare-fun e!114696 () Option!189)

(declare-fun e!114697 () Option!189)

(assert (=> b!173659 (= e!114696 e!114697)))

(declare-fun c!30996 () Bool)

(assert (=> b!173659 (= c!30996 (and ((_ is Cons!2210) (toList!1093 lt!85656)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85656))) lt!85673))))))

(declare-fun b!173660 () Bool)

(assert (=> b!173660 (= e!114697 (getValueByKey!183 (t!7012 (toList!1093 lt!85656)) lt!85673))))

(declare-fun b!173658 () Bool)

(assert (=> b!173658 (= e!114696 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85656)))))))

(declare-fun d!52665 () Bool)

(declare-fun c!30995 () Bool)

(assert (=> d!52665 (= c!30995 (and ((_ is Cons!2210) (toList!1093 lt!85656)) (= (_1!1629 (h!2827 (toList!1093 lt!85656))) lt!85673)))))

(assert (=> d!52665 (= (getValueByKey!183 (toList!1093 lt!85656) lt!85673) e!114696)))

(declare-fun b!173661 () Bool)

(assert (=> b!173661 (= e!114697 None!187)))

(assert (= (and d!52665 c!30995) b!173658))

(assert (= (and d!52665 (not c!30995)) b!173659))

(assert (= (and b!173659 c!30996) b!173660))

(assert (= (and b!173659 (not c!30996)) b!173661))

(declare-fun m!201905 () Bool)

(assert (=> b!173660 m!201905))

(assert (=> d!52525 d!52665))

(declare-fun d!52667 () Bool)

(declare-fun lt!85899 () Bool)

(assert (=> d!52667 (= lt!85899 (select (content!149 (toList!1093 lt!85794)) (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))

(declare-fun e!114699 () Bool)

(assert (=> d!52667 (= lt!85899 e!114699)))

(declare-fun res!82425 () Bool)

(assert (=> d!52667 (=> (not res!82425) (not e!114699))))

(assert (=> d!52667 (= res!82425 ((_ is Cons!2210) (toList!1093 lt!85794)))))

(assert (=> d!52667 (= (contains!1155 (toList!1093 lt!85794) (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85899)))

(declare-fun b!173662 () Bool)

(declare-fun e!114698 () Bool)

(assert (=> b!173662 (= e!114699 e!114698)))

(declare-fun res!82426 () Bool)

(assert (=> b!173662 (=> res!82426 e!114698)))

(assert (=> b!173662 (= res!82426 (= (h!2827 (toList!1093 lt!85794)) (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))

(declare-fun b!173663 () Bool)

(assert (=> b!173663 (= e!114698 (contains!1155 (t!7012 (toList!1093 lt!85794)) (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52667 res!82425) b!173662))

(assert (= (and b!173662 (not res!82426)) b!173663))

(declare-fun m!201907 () Bool)

(assert (=> d!52667 m!201907))

(declare-fun m!201909 () Bool)

(assert (=> d!52667 m!201909))

(declare-fun m!201911 () Bool)

(assert (=> b!173663 m!201911))

(assert (=> b!173486 d!52667))

(declare-fun b!173665 () Bool)

(declare-fun e!114700 () Option!189)

(declare-fun e!114701 () Option!189)

(assert (=> b!173665 (= e!114700 e!114701)))

(declare-fun c!30998 () Bool)

(assert (=> b!173665 (= c!30998 (and ((_ is Cons!2210) (toList!1093 lt!85765)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85765))) (_1!1629 (tuple2!3237 lt!85671 v!309))))))))

(declare-fun b!173666 () Bool)

(assert (=> b!173666 (= e!114701 (getValueByKey!183 (t!7012 (toList!1093 lt!85765)) (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!173664 () Bool)

(assert (=> b!173664 (= e!114700 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85765)))))))

(declare-fun d!52669 () Bool)

(declare-fun c!30997 () Bool)

(assert (=> d!52669 (= c!30997 (and ((_ is Cons!2210) (toList!1093 lt!85765)) (= (_1!1629 (h!2827 (toList!1093 lt!85765))) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(assert (=> d!52669 (= (getValueByKey!183 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309))) e!114700)))

(declare-fun b!173667 () Bool)

(assert (=> b!173667 (= e!114701 None!187)))

(assert (= (and d!52669 c!30997) b!173664))

(assert (= (and d!52669 (not c!30997)) b!173665))

(assert (= (and b!173665 c!30998) b!173666))

(assert (= (and b!173665 (not c!30998)) b!173667))

(declare-fun m!201913 () Bool)

(assert (=> b!173666 m!201913))

(assert (=> b!173458 d!52669))

(declare-fun d!52671 () Bool)

(assert (=> d!52671 (= (validMask!0 (mask!8468 lt!85539)) (and (or (= (mask!8468 lt!85539) #b00000000000000000000000000000111) (= (mask!8468 lt!85539) #b00000000000000000000000000001111) (= (mask!8468 lt!85539) #b00000000000000000000000000011111) (= (mask!8468 lt!85539) #b00000000000000000000000000111111) (= (mask!8468 lt!85539) #b00000000000000000000000001111111) (= (mask!8468 lt!85539) #b00000000000000000000000011111111) (= (mask!8468 lt!85539) #b00000000000000000000000111111111) (= (mask!8468 lt!85539) #b00000000000000000000001111111111) (= (mask!8468 lt!85539) #b00000000000000000000011111111111) (= (mask!8468 lt!85539) #b00000000000000000000111111111111) (= (mask!8468 lt!85539) #b00000000000000000001111111111111) (= (mask!8468 lt!85539) #b00000000000000000011111111111111) (= (mask!8468 lt!85539) #b00000000000000000111111111111111) (= (mask!8468 lt!85539) #b00000000000000001111111111111111) (= (mask!8468 lt!85539) #b00000000000000011111111111111111) (= (mask!8468 lt!85539) #b00000000000000111111111111111111) (= (mask!8468 lt!85539) #b00000000000001111111111111111111) (= (mask!8468 lt!85539) #b00000000000011111111111111111111) (= (mask!8468 lt!85539) #b00000000000111111111111111111111) (= (mask!8468 lt!85539) #b00000000001111111111111111111111) (= (mask!8468 lt!85539) #b00000000011111111111111111111111) (= (mask!8468 lt!85539) #b00000000111111111111111111111111) (= (mask!8468 lt!85539) #b00000001111111111111111111111111) (= (mask!8468 lt!85539) #b00000011111111111111111111111111) (= (mask!8468 lt!85539) #b00000111111111111111111111111111) (= (mask!8468 lt!85539) #b00001111111111111111111111111111) (= (mask!8468 lt!85539) #b00011111111111111111111111111111) (= (mask!8468 lt!85539) #b00111111111111111111111111111111)) (bvsle (mask!8468 lt!85539) #b00111111111111111111111111111111)))))

(assert (=> d!52485 d!52671))

(declare-fun d!52673 () Bool)

(assert (=> d!52673 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!85648)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!85648)))))

(assert (=> d!52549 d!52673))

(declare-fun b!173669 () Bool)

(declare-fun e!114702 () Option!189)

(declare-fun e!114703 () Option!189)

(assert (=> b!173669 (= e!114702 e!114703)))

(declare-fun c!31000 () Bool)

(assert (=> b!173669 (= c!31000 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))) lt!85648))))))

(declare-fun b!173670 () Bool)

(assert (=> b!173670 (= e!114703 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))) lt!85648))))

(declare-fun b!173668 () Bool)

(assert (=> b!173668 (= e!114702 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))))

(declare-fun d!52675 () Bool)

(declare-fun c!30999 () Bool)

(assert (=> d!52675 (= c!30999 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))) lt!85648)))))

(assert (=> d!52675 (= (getValueByKey!183 (toList!1093 (+!240 lt!85636 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!85648) e!114702)))

(declare-fun b!173671 () Bool)

(assert (=> b!173671 (= e!114703 None!187)))

(assert (= (and d!52675 c!30999) b!173668))

(assert (= (and d!52675 (not c!30999)) b!173669))

(assert (= (and b!173669 c!31000) b!173670))

(assert (= (and b!173669 (not c!31000)) b!173671))

(declare-fun m!201915 () Bool)

(assert (=> b!173670 m!201915))

(assert (=> d!52549 d!52675))

(declare-fun bm!17595 () Bool)

(declare-fun call!17598 () ListLongMap!2155)

(assert (=> bm!17595 (= call!17598 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173672 () Bool)

(declare-fun e!114705 () Bool)

(declare-fun e!114707 () Bool)

(assert (=> b!173672 (= e!114705 e!114707)))

(declare-fun c!31003 () Bool)

(assert (=> b!173672 (= c!31003 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!173673 () Bool)

(declare-fun e!114708 () Bool)

(assert (=> b!173673 (= e!114705 e!114708)))

(assert (=> b!173673 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun res!82430 () Bool)

(declare-fun lt!85905 () ListLongMap!2155)

(assert (=> b!173673 (= res!82430 (contains!1152 lt!85905 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173673 (=> (not res!82430) (not e!114708))))

(declare-fun b!173674 () Bool)

(declare-fun e!114709 () ListLongMap!2155)

(assert (=> b!173674 (= e!114709 call!17598)))

(declare-fun b!173675 () Bool)

(declare-fun e!114704 () ListLongMap!2155)

(assert (=> b!173675 (= e!114704 (ListLongMap!2156 Nil!2211))))

(declare-fun b!173676 () Bool)

(declare-fun lt!85901 () Unit!5291)

(declare-fun lt!85904 () Unit!5291)

(assert (=> b!173676 (= lt!85901 lt!85904)))

(declare-fun lt!85903 () ListLongMap!2155)

(declare-fun lt!85902 () (_ BitVec 64))

(declare-fun lt!85900 () (_ BitVec 64))

(declare-fun lt!85906 () V!5089)

(assert (=> b!173676 (not (contains!1152 (+!240 lt!85903 (tuple2!3237 lt!85900 lt!85906)) lt!85902))))

(assert (=> b!173676 (= lt!85904 (addStillNotContains!73 lt!85903 lt!85900 lt!85906 lt!85902))))

(assert (=> b!173676 (= lt!85902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173676 (= lt!85906 (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173676 (= lt!85900 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!173676 (= lt!85903 call!17598)))

(assert (=> b!173676 (= e!114709 (+!240 call!17598 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173677 () Bool)

(assert (=> b!173677 (= e!114704 e!114709)))

(declare-fun c!31002 () Bool)

(assert (=> b!173677 (= c!31002 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52677 () Bool)

(declare-fun e!114706 () Bool)

(assert (=> d!52677 e!114706))

(declare-fun res!82427 () Bool)

(assert (=> d!52677 (=> (not res!82427) (not e!114706))))

(assert (=> d!52677 (= res!82427 (not (contains!1152 lt!85905 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52677 (= lt!85905 e!114704)))

(declare-fun c!31001 () Bool)

(assert (=> d!52677 (= c!31001 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52677 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!52677 (= (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)) lt!85905)))

(declare-fun b!173678 () Bool)

(declare-fun e!114710 () Bool)

(assert (=> b!173678 (= e!114710 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173678 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!173679 () Bool)

(assert (=> b!173679 (= e!114707 (isEmpty!440 lt!85905))))

(declare-fun b!173680 () Bool)

(declare-fun res!82428 () Bool)

(assert (=> b!173680 (=> (not res!82428) (not e!114706))))

(assert (=> b!173680 (= res!82428 (not (contains!1152 lt!85905 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173681 () Bool)

(assert (=> b!173681 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> b!173681 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3755 (_values!3580 thiss!1248))))))

(assert (=> b!173681 (= e!114708 (= (apply!130 lt!85905 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173682 () Bool)

(assert (=> b!173682 (= e!114707 (= lt!85905 (getCurrentListMapNoExtraKeys!151 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173683 () Bool)

(assert (=> b!173683 (= e!114706 e!114705)))

(declare-fun c!31004 () Bool)

(assert (=> b!173683 (= c!31004 e!114710)))

(declare-fun res!82429 () Bool)

(assert (=> b!173683 (=> (not res!82429) (not e!114710))))

(assert (=> b!173683 (= res!82429 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (= (and d!52677 c!31001) b!173675))

(assert (= (and d!52677 (not c!31001)) b!173677))

(assert (= (and b!173677 c!31002) b!173676))

(assert (= (and b!173677 (not c!31002)) b!173674))

(assert (= (or b!173676 b!173674) bm!17595))

(assert (= (and d!52677 res!82427) b!173680))

(assert (= (and b!173680 res!82428) b!173683))

(assert (= (and b!173683 res!82429) b!173678))

(assert (= (and b!173683 c!31004) b!173673))

(assert (= (and b!173683 (not c!31004)) b!173672))

(assert (= (and b!173673 res!82430) b!173681))

(assert (= (and b!173672 c!31003) b!173682))

(assert (= (and b!173672 (not c!31003)) b!173679))

(declare-fun b_lambda!6947 () Bool)

(assert (=> (not b_lambda!6947) (not b!173676)))

(assert (=> b!173676 t!7016))

(declare-fun b_and!10747 () Bool)

(assert (= b_and!10745 (and (=> t!7016 result!4577) b_and!10747)))

(declare-fun b_lambda!6949 () Bool)

(assert (=> (not b_lambda!6949) (not b!173681)))

(assert (=> b!173681 t!7016))

(declare-fun b_and!10749 () Bool)

(assert (= b_and!10747 (and (=> t!7016 result!4577) b_and!10749)))

(assert (=> b!173673 m!201853))

(assert (=> b!173673 m!201853))

(declare-fun m!201917 () Bool)

(assert (=> b!173673 m!201917))

(assert (=> b!173677 m!201853))

(assert (=> b!173677 m!201853))

(assert (=> b!173677 m!201857))

(declare-fun m!201919 () Bool)

(assert (=> bm!17595 m!201919))

(assert (=> b!173681 m!201853))

(declare-fun m!201921 () Bool)

(assert (=> b!173681 m!201921))

(assert (=> b!173681 m!201853))

(assert (=> b!173681 m!201173))

(assert (=> b!173681 m!201863))

(assert (=> b!173681 m!201863))

(assert (=> b!173681 m!201173))

(assert (=> b!173681 m!201865))

(assert (=> b!173682 m!201919))

(assert (=> b!173676 m!201853))

(assert (=> b!173676 m!201173))

(declare-fun m!201923 () Bool)

(assert (=> b!173676 m!201923))

(assert (=> b!173676 m!201863))

(assert (=> b!173676 m!201863))

(assert (=> b!173676 m!201173))

(assert (=> b!173676 m!201865))

(declare-fun m!201925 () Bool)

(assert (=> b!173676 m!201925))

(assert (=> b!173676 m!201923))

(declare-fun m!201927 () Bool)

(assert (=> b!173676 m!201927))

(declare-fun m!201929 () Bool)

(assert (=> b!173676 m!201929))

(declare-fun m!201931 () Bool)

(assert (=> d!52677 m!201931))

(assert (=> d!52677 m!201121))

(declare-fun m!201933 () Bool)

(assert (=> b!173679 m!201933))

(assert (=> b!173678 m!201853))

(assert (=> b!173678 m!201853))

(assert (=> b!173678 m!201857))

(declare-fun m!201935 () Bool)

(assert (=> b!173680 m!201935))

(assert (=> bm!17561 d!52677))

(declare-fun d!52679 () Bool)

(declare-fun lt!85907 () Bool)

(assert (=> d!52679 (= lt!85907 (select (content!149 (toList!1093 lt!85749)) (tuple2!3237 lt!85668 v!309)))))

(declare-fun e!114712 () Bool)

(assert (=> d!52679 (= lt!85907 e!114712)))

(declare-fun res!82431 () Bool)

(assert (=> d!52679 (=> (not res!82431) (not e!114712))))

(assert (=> d!52679 (= res!82431 ((_ is Cons!2210) (toList!1093 lt!85749)))))

(assert (=> d!52679 (= (contains!1155 (toList!1093 lt!85749) (tuple2!3237 lt!85668 v!309)) lt!85907)))

(declare-fun b!173684 () Bool)

(declare-fun e!114711 () Bool)

(assert (=> b!173684 (= e!114712 e!114711)))

(declare-fun res!82432 () Bool)

(assert (=> b!173684 (=> res!82432 e!114711)))

(assert (=> b!173684 (= res!82432 (= (h!2827 (toList!1093 lt!85749)) (tuple2!3237 lt!85668 v!309)))))

(declare-fun b!173685 () Bool)

(assert (=> b!173685 (= e!114711 (contains!1155 (t!7012 (toList!1093 lt!85749)) (tuple2!3237 lt!85668 v!309)))))

(assert (= (and d!52679 res!82431) b!173684))

(assert (= (and b!173684 (not res!82432)) b!173685))

(declare-fun m!201937 () Bool)

(assert (=> d!52679 m!201937))

(declare-fun m!201939 () Bool)

(assert (=> d!52679 m!201939))

(declare-fun m!201941 () Bool)

(assert (=> b!173685 m!201941))

(assert (=> b!173450 d!52679))

(declare-fun b!173687 () Bool)

(declare-fun e!114713 () Option!189)

(declare-fun e!114714 () Option!189)

(assert (=> b!173687 (= e!114713 e!114714)))

(declare-fun c!31006 () Bool)

(assert (=> b!173687 (= c!31006 (and ((_ is Cons!2210) (toList!1093 lt!85777)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85777))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173688 () Bool)

(assert (=> b!173688 (= e!114714 (getValueByKey!183 (t!7012 (toList!1093 lt!85777)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173686 () Bool)

(assert (=> b!173686 (= e!114713 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85777)))))))

(declare-fun d!52681 () Bool)

(declare-fun c!31005 () Bool)

(assert (=> d!52681 (= c!31005 (and ((_ is Cons!2210) (toList!1093 lt!85777)) (= (_1!1629 (h!2827 (toList!1093 lt!85777))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52681 (= (getValueByKey!183 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) e!114713)))

(declare-fun b!173689 () Bool)

(assert (=> b!173689 (= e!114714 None!187)))

(assert (= (and d!52681 c!31005) b!173686))

(assert (= (and d!52681 (not c!31005)) b!173687))

(assert (= (and b!173687 c!31006) b!173688))

(assert (= (and b!173687 (not c!31006)) b!173689))

(declare-fun m!201943 () Bool)

(assert (=> b!173688 m!201943))

(assert (=> b!173467 d!52681))

(declare-fun b!173690 () Bool)

(declare-fun e!114717 () List!2214)

(declare-fun call!17600 () List!2214)

(assert (=> b!173690 (= e!114717 call!17600)))

(declare-fun b!173691 () Bool)

(declare-fun res!82434 () Bool)

(declare-fun e!114715 () Bool)

(assert (=> b!173691 (=> (not res!82434) (not e!114715))))

(declare-fun lt!85908 () List!2214)

(assert (=> b!173691 (= res!82434 (containsKey!187 lt!85908 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173692 () Bool)

(declare-fun e!114719 () List!2214)

(assert (=> b!173692 (= e!114719 (insertStrictlySorted!102 (t!7012 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173693 () Bool)

(assert (=> b!173693 (= e!114715 (contains!1155 lt!85908 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!31009 () Bool)

(declare-fun c!31008 () Bool)

(declare-fun b!173694 () Bool)

(assert (=> b!173694 (= e!114719 (ite c!31009 (t!7012 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (ite c!31008 (Cons!2210 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (t!7012 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) Nil!2211)))))

(declare-fun c!31010 () Bool)

(declare-fun bm!17596 () Bool)

(declare-fun call!17599 () List!2214)

(assert (=> bm!17596 (= call!17599 ($colon$colon!97 e!114719 (ite c!31010 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31007 () Bool)

(assert (=> bm!17596 (= c!31007 c!31010)))

(declare-fun b!173695 () Bool)

(assert (=> b!173695 (= c!31008 (and ((_ is Cons!2210) (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (bvsgt (_1!1629 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114718 () List!2214)

(assert (=> b!173695 (= e!114718 e!114717)))

(declare-fun b!173696 () Bool)

(declare-fun e!114716 () List!2214)

(assert (=> b!173696 (= e!114716 call!17599)))

(declare-fun d!52683 () Bool)

(assert (=> d!52683 e!114715))

(declare-fun res!82433 () Bool)

(assert (=> d!52683 (=> (not res!82433) (not e!114715))))

(assert (=> d!52683 (= res!82433 (isStrictlySorted!327 lt!85908))))

(assert (=> d!52683 (= lt!85908 e!114716)))

(assert (=> d!52683 (= c!31010 (and ((_ is Cons!2210) (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (bvslt (_1!1629 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52683 (isStrictlySorted!327 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))))

(assert (=> d!52683 (= (insertStrictlySorted!102 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85908)))

(declare-fun bm!17597 () Bool)

(declare-fun call!17601 () List!2214)

(assert (=> bm!17597 (= call!17600 call!17601)))

(declare-fun b!173697 () Bool)

(assert (=> b!173697 (= e!114717 call!17600)))

(declare-fun bm!17598 () Bool)

(assert (=> bm!17598 (= call!17601 call!17599)))

(declare-fun b!173698 () Bool)

(assert (=> b!173698 (= e!114716 e!114718)))

(assert (=> b!173698 (= c!31009 (and ((_ is Cons!2210) (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173699 () Bool)

(assert (=> b!173699 (= e!114718 call!17601)))

(assert (= (and d!52683 c!31010) b!173696))

(assert (= (and d!52683 (not c!31010)) b!173698))

(assert (= (and b!173698 c!31009) b!173699))

(assert (= (and b!173698 (not c!31009)) b!173695))

(assert (= (and b!173695 c!31008) b!173690))

(assert (= (and b!173695 (not c!31008)) b!173697))

(assert (= (or b!173690 b!173697) bm!17597))

(assert (= (or b!173699 bm!17597) bm!17598))

(assert (= (or b!173696 bm!17598) bm!17596))

(assert (= (and bm!17596 c!31007) b!173692))

(assert (= (and bm!17596 (not c!31007)) b!173694))

(assert (= (and d!52683 res!82433) b!173691))

(assert (= (and b!173691 res!82434) b!173693))

(declare-fun m!201945 () Bool)

(assert (=> d!52683 m!201945))

(declare-fun m!201947 () Bool)

(assert (=> d!52683 m!201947))

(declare-fun m!201949 () Bool)

(assert (=> b!173693 m!201949))

(declare-fun m!201951 () Bool)

(assert (=> b!173692 m!201951))

(declare-fun m!201953 () Bool)

(assert (=> bm!17596 m!201953))

(declare-fun m!201955 () Bool)

(assert (=> b!173691 m!201955))

(assert (=> b!173439 d!52683))

(declare-fun d!52685 () Bool)

(assert (=> d!52685 (arrayContainsKey!0 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000)))

(declare-fun lt!85911 () Unit!5291)

(declare-fun choose!13 (array!7273 (_ BitVec 64) (_ BitVec 32)) Unit!5291)

(assert (=> d!52685 (= lt!85911 (choose!13 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000))))

(assert (=> d!52685 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52685 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000) lt!85911)))

(declare-fun bs!7152 () Bool)

(assert (= bs!7152 d!52685))

(assert (=> bs!7152 m!201695))

(declare-fun m!201957 () Bool)

(assert (=> bs!7152 m!201957))

(assert (=> b!173520 d!52685))

(declare-fun d!52687 () Bool)

(declare-fun res!82439 () Bool)

(declare-fun e!114724 () Bool)

(assert (=> d!52687 (=> res!82439 e!114724)))

(assert (=> d!52687 (= res!82439 (= (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) lt!85831))))

(assert (=> d!52687 (= (arrayContainsKey!0 (_keys!5437 lt!85539) lt!85831 #b00000000000000000000000000000000) e!114724)))

(declare-fun b!173704 () Bool)

(declare-fun e!114725 () Bool)

(assert (=> b!173704 (= e!114724 e!114725)))

(declare-fun res!82440 () Bool)

(assert (=> b!173704 (=> (not res!82440) (not e!114725))))

(assert (=> b!173704 (= res!82440 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(declare-fun b!173705 () Bool)

(assert (=> b!173705 (= e!114725 (arrayContainsKey!0 (_keys!5437 lt!85539) lt!85831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52687 (not res!82439)) b!173704))

(assert (= (and b!173704 res!82440) b!173705))

(assert (=> d!52687 m!201317))

(declare-fun m!201959 () Bool)

(assert (=> b!173705 m!201959))

(assert (=> b!173520 d!52687))

(declare-fun b!173718 () Bool)

(declare-fun e!114734 () SeekEntryResult!553)

(assert (=> b!173718 (= e!114734 Undefined!553)))

(declare-fun d!52689 () Bool)

(declare-fun lt!85919 () SeekEntryResult!553)

(assert (=> d!52689 (and (or ((_ is Undefined!553) lt!85919) (not ((_ is Found!553) lt!85919)) (and (bvsge (index!4381 lt!85919) #b00000000000000000000000000000000) (bvslt (index!4381 lt!85919) (size!3754 (_keys!5437 lt!85539))))) (or ((_ is Undefined!553) lt!85919) ((_ is Found!553) lt!85919) (not ((_ is MissingZero!553) lt!85919)) (and (bvsge (index!4380 lt!85919) #b00000000000000000000000000000000) (bvslt (index!4380 lt!85919) (size!3754 (_keys!5437 lt!85539))))) (or ((_ is Undefined!553) lt!85919) ((_ is Found!553) lt!85919) ((_ is MissingZero!553) lt!85919) (not ((_ is MissingVacant!553) lt!85919)) (and (bvsge (index!4383 lt!85919) #b00000000000000000000000000000000) (bvslt (index!4383 lt!85919) (size!3754 (_keys!5437 lt!85539))))) (or ((_ is Undefined!553) lt!85919) (ite ((_ is Found!553) lt!85919) (= (select (arr!3454 (_keys!5437 lt!85539)) (index!4381 lt!85919)) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!553) lt!85919) (= (select (arr!3454 (_keys!5437 lt!85539)) (index!4380 lt!85919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!553) lt!85919) (= (select (arr!3454 (_keys!5437 lt!85539)) (index!4383 lt!85919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52689 (= lt!85919 e!114734)))

(declare-fun c!31019 () Bool)

(declare-fun lt!85918 () SeekEntryResult!553)

(assert (=> d!52689 (= c!31019 (and ((_ is Intermediate!553) lt!85918) (undefined!1365 lt!85918)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7273 (_ BitVec 32)) SeekEntryResult!553)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!52689 (= lt!85918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (mask!8468 lt!85539)) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (_keys!5437 lt!85539) (mask!8468 lt!85539)))))

(assert (=> d!52689 (validMask!0 (mask!8468 lt!85539))))

(assert (=> d!52689 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (_keys!5437 lt!85539) (mask!8468 lt!85539)) lt!85919)))

(declare-fun b!173719 () Bool)

(declare-fun e!114732 () SeekEntryResult!553)

(assert (=> b!173719 (= e!114732 (Found!553 (index!4382 lt!85918)))))

(declare-fun b!173720 () Bool)

(declare-fun c!31017 () Bool)

(declare-fun lt!85920 () (_ BitVec 64))

(assert (=> b!173720 (= c!31017 (= lt!85920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114733 () SeekEntryResult!553)

(assert (=> b!173720 (= e!114732 e!114733)))

(declare-fun b!173721 () Bool)

(assert (=> b!173721 (= e!114734 e!114732)))

(assert (=> b!173721 (= lt!85920 (select (arr!3454 (_keys!5437 lt!85539)) (index!4382 lt!85918)))))

(declare-fun c!31018 () Bool)

(assert (=> b!173721 (= c!31018 (= lt!85920 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173722 () Bool)

(assert (=> b!173722 (= e!114733 (MissingZero!553 (index!4382 lt!85918)))))

(declare-fun b!173723 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7273 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!173723 (= e!114733 (seekKeyOrZeroReturnVacant!0 (x!19206 lt!85918) (index!4382 lt!85918) (index!4382 lt!85918) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (_keys!5437 lt!85539) (mask!8468 lt!85539)))))

(assert (= (and d!52689 c!31019) b!173718))

(assert (= (and d!52689 (not c!31019)) b!173721))

(assert (= (and b!173721 c!31018) b!173719))

(assert (= (and b!173721 (not c!31018)) b!173720))

(assert (= (and b!173720 c!31017) b!173722))

(assert (= (and b!173720 (not c!31017)) b!173723))

(assert (=> d!52689 m!201287))

(declare-fun m!201961 () Bool)

(assert (=> d!52689 m!201961))

(declare-fun m!201963 () Bool)

(assert (=> d!52689 m!201963))

(assert (=> d!52689 m!201317))

(declare-fun m!201965 () Bool)

(assert (=> d!52689 m!201965))

(declare-fun m!201967 () Bool)

(assert (=> d!52689 m!201967))

(declare-fun m!201969 () Bool)

(assert (=> d!52689 m!201969))

(assert (=> d!52689 m!201317))

(assert (=> d!52689 m!201963))

(declare-fun m!201971 () Bool)

(assert (=> b!173721 m!201971))

(assert (=> b!173723 m!201317))

(declare-fun m!201973 () Bool)

(assert (=> b!173723 m!201973))

(assert (=> b!173520 d!52689))

(declare-fun d!52691 () Bool)

(declare-fun lt!85921 () Bool)

(assert (=> d!52691 (= lt!85921 (select (content!149 lt!85737) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun e!114736 () Bool)

(assert (=> d!52691 (= lt!85921 e!114736)))

(declare-fun res!82441 () Bool)

(assert (=> d!52691 (=> (not res!82441) (not e!114736))))

(assert (=> d!52691 (= res!82441 ((_ is Cons!2210) lt!85737))))

(assert (=> d!52691 (= (contains!1155 lt!85737 (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))) lt!85921)))

(declare-fun b!173724 () Bool)

(declare-fun e!114735 () Bool)

(assert (=> b!173724 (= e!114736 e!114735)))

(declare-fun res!82442 () Bool)

(assert (=> b!173724 (=> res!82442 e!114735)))

(assert (=> b!173724 (= res!82442 (= (h!2827 lt!85737) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173725 () Bool)

(assert (=> b!173725 (= e!114735 (contains!1155 (t!7012 lt!85737) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(assert (= (and d!52691 res!82441) b!173724))

(assert (= (and b!173724 (not res!82442)) b!173725))

(declare-fun m!201975 () Bool)

(assert (=> d!52691 m!201975))

(declare-fun m!201977 () Bool)

(assert (=> d!52691 m!201977))

(declare-fun m!201979 () Bool)

(assert (=> b!173725 m!201979))

(assert (=> b!173421 d!52691))

(declare-fun d!52693 () Bool)

(assert (=> d!52693 (= (apply!130 lt!85714 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7153 () Bool)

(assert (= bs!7153 d!52693))

(assert (=> bs!7153 m!201779))

(assert (=> bs!7153 m!201779))

(declare-fun m!201981 () Bool)

(assert (=> bs!7153 m!201981))

(assert (=> b!173358 d!52693))

(declare-fun d!52695 () Bool)

(assert (=> d!52695 (= (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173373 d!52695))

(assert (=> b!173578 d!52543))

(declare-fun d!52697 () Bool)

(declare-fun e!114738 () Bool)

(assert (=> d!52697 e!114738))

(declare-fun res!82443 () Bool)

(assert (=> d!52697 (=> res!82443 e!114738)))

(declare-fun lt!85923 () Bool)

(assert (=> d!52697 (= res!82443 (not lt!85923))))

(declare-fun lt!85922 () Bool)

(assert (=> d!52697 (= lt!85923 lt!85922)))

(declare-fun lt!85925 () Unit!5291)

(declare-fun e!114737 () Unit!5291)

(assert (=> d!52697 (= lt!85925 e!114737)))

(declare-fun c!31020 () Bool)

(assert (=> d!52697 (= c!31020 lt!85922)))

(assert (=> d!52697 (= lt!85922 (containsKey!187 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52697 (= (contains!1152 lt!85803 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85923)))

(declare-fun b!173726 () Bool)

(declare-fun lt!85924 () Unit!5291)

(assert (=> b!173726 (= e!114737 lt!85924)))

(assert (=> b!173726 (= lt!85924 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173726 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173727 () Bool)

(declare-fun Unit!5311 () Unit!5291)

(assert (=> b!173727 (= e!114737 Unit!5311)))

(declare-fun b!173728 () Bool)

(assert (=> b!173728 (= e!114738 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52697 c!31020) b!173726))

(assert (= (and d!52697 (not c!31020)) b!173727))

(assert (= (and d!52697 (not res!82443)) b!173728))

(declare-fun m!201983 () Bool)

(assert (=> d!52697 m!201983))

(declare-fun m!201985 () Bool)

(assert (=> b!173726 m!201985))

(assert (=> b!173726 m!201619))

(assert (=> b!173726 m!201619))

(declare-fun m!201987 () Bool)

(assert (=> b!173726 m!201987))

(assert (=> b!173728 m!201619))

(assert (=> b!173728 m!201619))

(assert (=> b!173728 m!201987))

(assert (=> d!52561 d!52697))

(declare-fun b!173730 () Bool)

(declare-fun e!114739 () Option!189)

(declare-fun e!114740 () Option!189)

(assert (=> b!173730 (= e!114739 e!114740)))

(declare-fun c!31022 () Bool)

(assert (=> b!173730 (= c!31022 (and ((_ is Cons!2210) lt!85805) (not (= (_1!1629 (h!2827 lt!85805)) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173731 () Bool)

(assert (=> b!173731 (= e!114740 (getValueByKey!183 (t!7012 lt!85805) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173729 () Bool)

(assert (=> b!173729 (= e!114739 (Some!188 (_2!1629 (h!2827 lt!85805))))))

(declare-fun c!31021 () Bool)

(declare-fun d!52699 () Bool)

(assert (=> d!52699 (= c!31021 (and ((_ is Cons!2210) lt!85805) (= (_1!1629 (h!2827 lt!85805)) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52699 (= (getValueByKey!183 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) e!114739)))

(declare-fun b!173732 () Bool)

(assert (=> b!173732 (= e!114740 None!187)))

(assert (= (and d!52699 c!31021) b!173729))

(assert (= (and d!52699 (not c!31021)) b!173730))

(assert (= (and b!173730 c!31022) b!173731))

(assert (= (and b!173730 (not c!31022)) b!173732))

(declare-fun m!201989 () Bool)

(assert (=> b!173731 m!201989))

(assert (=> d!52561 d!52699))

(declare-fun d!52701 () Bool)

(assert (=> d!52701 (= (getValueByKey!183 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85926 () Unit!5291)

(assert (=> d!52701 (= lt!85926 (choose!936 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114741 () Bool)

(assert (=> d!52701 e!114741))

(declare-fun res!82444 () Bool)

(assert (=> d!52701 (=> (not res!82444) (not e!114741))))

(assert (=> d!52701 (= res!82444 (isStrictlySorted!327 lt!85805))))

(assert (=> d!52701 (= (lemmaContainsTupThenGetReturnValue!99 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85926)))

(declare-fun b!173733 () Bool)

(declare-fun res!82445 () Bool)

(assert (=> b!173733 (=> (not res!82445) (not e!114741))))

(assert (=> b!173733 (= res!82445 (containsKey!187 lt!85805 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173734 () Bool)

(assert (=> b!173734 (= e!114741 (contains!1155 lt!85805 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52701 res!82444) b!173733))

(assert (= (and b!173733 res!82445) b!173734))

(assert (=> d!52701 m!201613))

(declare-fun m!201991 () Bool)

(assert (=> d!52701 m!201991))

(declare-fun m!201993 () Bool)

(assert (=> d!52701 m!201993))

(declare-fun m!201995 () Bool)

(assert (=> b!173733 m!201995))

(declare-fun m!201997 () Bool)

(assert (=> b!173734 m!201997))

(assert (=> d!52561 d!52701))

(declare-fun b!173735 () Bool)

(declare-fun e!114744 () List!2214)

(declare-fun call!17603 () List!2214)

(assert (=> b!173735 (= e!114744 call!17603)))

(declare-fun b!173736 () Bool)

(declare-fun res!82447 () Bool)

(declare-fun e!114742 () Bool)

(assert (=> b!173736 (=> (not res!82447) (not e!114742))))

(declare-fun lt!85927 () List!2214)

(assert (=> b!173736 (= res!82447 (containsKey!187 lt!85927 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114746 () List!2214)

(declare-fun b!173737 () Bool)

(assert (=> b!173737 (= e!114746 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85649)) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173738 () Bool)

(assert (=> b!173738 (= e!114742 (contains!1155 lt!85927 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31024 () Bool)

(declare-fun c!31025 () Bool)

(declare-fun b!173739 () Bool)

(assert (=> b!173739 (= e!114746 (ite c!31025 (t!7012 (toList!1093 lt!85649)) (ite c!31024 (Cons!2210 (h!2827 (toList!1093 lt!85649)) (t!7012 (toList!1093 lt!85649))) Nil!2211)))))

(declare-fun bm!17599 () Bool)

(declare-fun c!31026 () Bool)

(declare-fun call!17602 () List!2214)

(assert (=> bm!17599 (= call!17602 ($colon$colon!97 e!114746 (ite c!31026 (h!2827 (toList!1093 lt!85649)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31023 () Bool)

(assert (=> bm!17599 (= c!31023 c!31026)))

(declare-fun b!173740 () Bool)

(assert (=> b!173740 (= c!31024 (and ((_ is Cons!2210) (toList!1093 lt!85649)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85649))) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(declare-fun e!114745 () List!2214)

(assert (=> b!173740 (= e!114745 e!114744)))

(declare-fun b!173741 () Bool)

(declare-fun e!114743 () List!2214)

(assert (=> b!173741 (= e!114743 call!17602)))

(declare-fun d!52703 () Bool)

(assert (=> d!52703 e!114742))

(declare-fun res!82446 () Bool)

(assert (=> d!52703 (=> (not res!82446) (not e!114742))))

(assert (=> d!52703 (= res!82446 (isStrictlySorted!327 lt!85927))))

(assert (=> d!52703 (= lt!85927 e!114743)))

(assert (=> d!52703 (= c!31026 (and ((_ is Cons!2210) (toList!1093 lt!85649)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85649))) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52703 (isStrictlySorted!327 (toList!1093 lt!85649))))

(assert (=> d!52703 (= (insertStrictlySorted!102 (toList!1093 lt!85649) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85927)))

(declare-fun bm!17600 () Bool)

(declare-fun call!17604 () List!2214)

(assert (=> bm!17600 (= call!17603 call!17604)))

(declare-fun b!173742 () Bool)

(assert (=> b!173742 (= e!114744 call!17603)))

(declare-fun bm!17601 () Bool)

(assert (=> bm!17601 (= call!17604 call!17602)))

(declare-fun b!173743 () Bool)

(assert (=> b!173743 (= e!114743 e!114745)))

(assert (=> b!173743 (= c!31025 (and ((_ is Cons!2210) (toList!1093 lt!85649)) (= (_1!1629 (h!2827 (toList!1093 lt!85649))) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173744 () Bool)

(assert (=> b!173744 (= e!114745 call!17604)))

(assert (= (and d!52703 c!31026) b!173741))

(assert (= (and d!52703 (not c!31026)) b!173743))

(assert (= (and b!173743 c!31025) b!173744))

(assert (= (and b!173743 (not c!31025)) b!173740))

(assert (= (and b!173740 c!31024) b!173735))

(assert (= (and b!173740 (not c!31024)) b!173742))

(assert (= (or b!173735 b!173742) bm!17600))

(assert (= (or b!173744 bm!17600) bm!17601))

(assert (= (or b!173741 bm!17601) bm!17599))

(assert (= (and bm!17599 c!31023) b!173737))

(assert (= (and bm!17599 (not c!31023)) b!173739))

(assert (= (and d!52703 res!82446) b!173736))

(assert (= (and b!173736 res!82447) b!173738))

(declare-fun m!201999 () Bool)

(assert (=> d!52703 m!201999))

(declare-fun m!202001 () Bool)

(assert (=> d!52703 m!202001))

(declare-fun m!202003 () Bool)

(assert (=> b!173738 m!202003))

(declare-fun m!202005 () Bool)

(assert (=> b!173737 m!202005))

(declare-fun m!202007 () Bool)

(assert (=> bm!17599 m!202007))

(declare-fun m!202009 () Bool)

(assert (=> b!173736 m!202009))

(assert (=> d!52561 d!52703))

(declare-fun d!52705 () Bool)

(assert (=> d!52705 (= (get!1964 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3947 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173306 d!52705))

(declare-fun d!52707 () Bool)

(declare-fun e!114748 () Bool)

(assert (=> d!52707 e!114748))

(declare-fun res!82448 () Bool)

(assert (=> d!52707 (=> res!82448 e!114748)))

(declare-fun lt!85929 () Bool)

(assert (=> d!52707 (= res!82448 (not lt!85929))))

(declare-fun lt!85928 () Bool)

(assert (=> d!52707 (= lt!85929 lt!85928)))

(declare-fun lt!85931 () Unit!5291)

(declare-fun e!114747 () Unit!5291)

(assert (=> d!52707 (= lt!85931 e!114747)))

(declare-fun c!31027 () Bool)

(assert (=> d!52707 (= c!31027 lt!85928)))

(assert (=> d!52707 (= lt!85928 (containsKey!187 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52707 (= (contains!1152 lt!85794 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85929)))

(declare-fun b!173745 () Bool)

(declare-fun lt!85930 () Unit!5291)

(assert (=> b!173745 (= e!114747 lt!85930)))

(assert (=> b!173745 (= lt!85930 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173745 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173746 () Bool)

(declare-fun Unit!5312 () Unit!5291)

(assert (=> b!173746 (= e!114747 Unit!5312)))

(declare-fun b!173747 () Bool)

(assert (=> b!173747 (= e!114748 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52707 c!31027) b!173745))

(assert (= (and d!52707 (not c!31027)) b!173746))

(assert (= (and d!52707 (not res!82448)) b!173747))

(declare-fun m!202011 () Bool)

(assert (=> d!52707 m!202011))

(declare-fun m!202013 () Bool)

(assert (=> b!173745 m!202013))

(assert (=> b!173745 m!201587))

(assert (=> b!173745 m!201587))

(declare-fun m!202015 () Bool)

(assert (=> b!173745 m!202015))

(assert (=> b!173747 m!201587))

(assert (=> b!173747 m!201587))

(assert (=> b!173747 m!202015))

(assert (=> d!52553 d!52707))

(declare-fun b!173749 () Bool)

(declare-fun e!114749 () Option!189)

(declare-fun e!114750 () Option!189)

(assert (=> b!173749 (= e!114749 e!114750)))

(declare-fun c!31029 () Bool)

(assert (=> b!173749 (= c!31029 (and ((_ is Cons!2210) lt!85796) (not (= (_1!1629 (h!2827 lt!85796)) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173750 () Bool)

(assert (=> b!173750 (= e!114750 (getValueByKey!183 (t!7012 lt!85796) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173748 () Bool)

(assert (=> b!173748 (= e!114749 (Some!188 (_2!1629 (h!2827 lt!85796))))))

(declare-fun c!31028 () Bool)

(declare-fun d!52709 () Bool)

(assert (=> d!52709 (= c!31028 (and ((_ is Cons!2210) lt!85796) (= (_1!1629 (h!2827 lt!85796)) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52709 (= (getValueByKey!183 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) e!114749)))

(declare-fun b!173751 () Bool)

(assert (=> b!173751 (= e!114750 None!187)))

(assert (= (and d!52709 c!31028) b!173748))

(assert (= (and d!52709 (not c!31028)) b!173749))

(assert (= (and b!173749 c!31029) b!173750))

(assert (= (and b!173749 (not c!31029)) b!173751))

(declare-fun m!202017 () Bool)

(assert (=> b!173750 m!202017))

(assert (=> d!52553 d!52709))

(declare-fun d!52711 () Bool)

(assert (=> d!52711 (= (getValueByKey!183 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85932 () Unit!5291)

(assert (=> d!52711 (= lt!85932 (choose!936 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114751 () Bool)

(assert (=> d!52711 e!114751))

(declare-fun res!82449 () Bool)

(assert (=> d!52711 (=> (not res!82449) (not e!114751))))

(assert (=> d!52711 (= res!82449 (isStrictlySorted!327 lt!85796))))

(assert (=> d!52711 (= (lemmaContainsTupThenGetReturnValue!99 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85932)))

(declare-fun b!173752 () Bool)

(declare-fun res!82450 () Bool)

(assert (=> b!173752 (=> (not res!82450) (not e!114751))))

(assert (=> b!173752 (= res!82450 (containsKey!187 lt!85796 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173753 () Bool)

(assert (=> b!173753 (= e!114751 (contains!1155 lt!85796 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52711 res!82449) b!173752))

(assert (= (and b!173752 res!82450) b!173753))

(assert (=> d!52711 m!201581))

(declare-fun m!202019 () Bool)

(assert (=> d!52711 m!202019))

(declare-fun m!202021 () Bool)

(assert (=> d!52711 m!202021))

(declare-fun m!202023 () Bool)

(assert (=> b!173752 m!202023))

(declare-fun m!202025 () Bool)

(assert (=> b!173753 m!202025))

(assert (=> d!52553 d!52711))

(declare-fun b!173754 () Bool)

(declare-fun e!114754 () List!2214)

(declare-fun call!17606 () List!2214)

(assert (=> b!173754 (= e!114754 call!17606)))

(declare-fun b!173755 () Bool)

(declare-fun res!82452 () Bool)

(declare-fun e!114752 () Bool)

(assert (=> b!173755 (=> (not res!82452) (not e!114752))))

(declare-fun lt!85933 () List!2214)

(assert (=> b!173755 (= res!82452 (containsKey!187 lt!85933 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173756 () Bool)

(declare-fun e!114756 () List!2214)

(assert (=> b!173756 (= e!114756 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85630)) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173757 () Bool)

(assert (=> b!173757 (= e!114752 (contains!1155 lt!85933 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31032 () Bool)

(declare-fun c!31031 () Bool)

(declare-fun b!173758 () Bool)

(assert (=> b!173758 (= e!114756 (ite c!31032 (t!7012 (toList!1093 lt!85630)) (ite c!31031 (Cons!2210 (h!2827 (toList!1093 lt!85630)) (t!7012 (toList!1093 lt!85630))) Nil!2211)))))

(declare-fun bm!17602 () Bool)

(declare-fun c!31033 () Bool)

(declare-fun call!17605 () List!2214)

(assert (=> bm!17602 (= call!17605 ($colon$colon!97 e!114756 (ite c!31033 (h!2827 (toList!1093 lt!85630)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31030 () Bool)

(assert (=> bm!17602 (= c!31030 c!31033)))

(declare-fun b!173759 () Bool)

(assert (=> b!173759 (= c!31031 (and ((_ is Cons!2210) (toList!1093 lt!85630)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85630))) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(declare-fun e!114755 () List!2214)

(assert (=> b!173759 (= e!114755 e!114754)))

(declare-fun b!173760 () Bool)

(declare-fun e!114753 () List!2214)

(assert (=> b!173760 (= e!114753 call!17605)))

(declare-fun d!52713 () Bool)

(assert (=> d!52713 e!114752))

(declare-fun res!82451 () Bool)

(assert (=> d!52713 (=> (not res!82451) (not e!114752))))

(assert (=> d!52713 (= res!82451 (isStrictlySorted!327 lt!85933))))

(assert (=> d!52713 (= lt!85933 e!114753)))

(assert (=> d!52713 (= c!31033 (and ((_ is Cons!2210) (toList!1093 lt!85630)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85630))) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52713 (isStrictlySorted!327 (toList!1093 lt!85630))))

(assert (=> d!52713 (= (insertStrictlySorted!102 (toList!1093 lt!85630) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85933)))

(declare-fun bm!17603 () Bool)

(declare-fun call!17607 () List!2214)

(assert (=> bm!17603 (= call!17606 call!17607)))

(declare-fun b!173761 () Bool)

(assert (=> b!173761 (= e!114754 call!17606)))

(declare-fun bm!17604 () Bool)

(assert (=> bm!17604 (= call!17607 call!17605)))

(declare-fun b!173762 () Bool)

(assert (=> b!173762 (= e!114753 e!114755)))

(assert (=> b!173762 (= c!31032 (and ((_ is Cons!2210) (toList!1093 lt!85630)) (= (_1!1629 (h!2827 (toList!1093 lt!85630))) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173763 () Bool)

(assert (=> b!173763 (= e!114755 call!17607)))

(assert (= (and d!52713 c!31033) b!173760))

(assert (= (and d!52713 (not c!31033)) b!173762))

(assert (= (and b!173762 c!31032) b!173763))

(assert (= (and b!173762 (not c!31032)) b!173759))

(assert (= (and b!173759 c!31031) b!173754))

(assert (= (and b!173759 (not c!31031)) b!173761))

(assert (= (or b!173754 b!173761) bm!17603))

(assert (= (or b!173763 bm!17603) bm!17604))

(assert (= (or b!173760 bm!17604) bm!17602))

(assert (= (and bm!17602 c!31030) b!173756))

(assert (= (and bm!17602 (not c!31030)) b!173758))

(assert (= (and d!52713 res!82451) b!173755))

(assert (= (and b!173755 res!82452) b!173757))

(declare-fun m!202027 () Bool)

(assert (=> d!52713 m!202027))

(declare-fun m!202029 () Bool)

(assert (=> d!52713 m!202029))

(declare-fun m!202031 () Bool)

(assert (=> b!173757 m!202031))

(declare-fun m!202033 () Bool)

(assert (=> b!173756 m!202033))

(declare-fun m!202035 () Bool)

(assert (=> bm!17602 m!202035))

(declare-fun m!202037 () Bool)

(assert (=> b!173755 m!202037))

(assert (=> d!52553 d!52713))

(declare-fun d!52715 () Bool)

(assert (=> d!52715 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7154 () Bool)

(assert (= bs!7154 d!52715))

(assert (=> bs!7154 m!201423))

(declare-fun m!202039 () Bool)

(assert (=> bs!7154 m!202039))

(assert (=> b!173483 d!52715))

(declare-fun b!173765 () Bool)

(declare-fun e!114757 () Option!189)

(declare-fun e!114758 () Option!189)

(assert (=> b!173765 (= e!114757 e!114758)))

(declare-fun c!31035 () Bool)

(assert (=> b!173765 (= c!31035 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173766 () Bool)

(assert (=> b!173766 (= e!114758 (getValueByKey!183 (t!7012 (toList!1093 lt!85663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173764 () Bool)

(assert (=> b!173764 (= e!114757 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85663)))))))

(declare-fun d!52717 () Bool)

(declare-fun c!31034 () Bool)

(assert (=> d!52717 (= c!31034 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52717 (= (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000) e!114757)))

(declare-fun b!173767 () Bool)

(assert (=> b!173767 (= e!114758 None!187)))

(assert (= (and d!52717 c!31034) b!173764))

(assert (= (and d!52717 (not c!31034)) b!173765))

(assert (= (and b!173765 c!31035) b!173766))

(assert (= (and b!173765 (not c!31035)) b!173767))

(declare-fun m!202041 () Bool)

(assert (=> b!173766 m!202041))

(assert (=> b!173483 d!52717))

(assert (=> d!52491 d!52489))

(declare-fun d!52719 () Bool)

(assert (=> d!52719 (= (getValueByKey!183 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))) (Some!188 (_2!1629 (tuple2!3237 key!828 v!309))))))

(assert (=> d!52719 true))

(declare-fun _$22!535 () Unit!5291)

(assert (=> d!52719 (= (choose!936 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))) _$22!535)))

(declare-fun bs!7155 () Bool)

(assert (= bs!7155 d!52719))

(assert (=> bs!7155 m!201111))

(assert (=> d!52491 d!52719))

(declare-fun d!52721 () Bool)

(declare-fun res!82457 () Bool)

(declare-fun e!114763 () Bool)

(assert (=> d!52721 (=> res!82457 e!114763)))

(assert (=> d!52721 (= res!82457 (or ((_ is Nil!2211) lt!85581) ((_ is Nil!2211) (t!7012 lt!85581))))))

(assert (=> d!52721 (= (isStrictlySorted!327 lt!85581) e!114763)))

(declare-fun b!173772 () Bool)

(declare-fun e!114764 () Bool)

(assert (=> b!173772 (= e!114763 e!114764)))

(declare-fun res!82458 () Bool)

(assert (=> b!173772 (=> (not res!82458) (not e!114764))))

(assert (=> b!173772 (= res!82458 (bvslt (_1!1629 (h!2827 lt!85581)) (_1!1629 (h!2827 (t!7012 lt!85581)))))))

(declare-fun b!173773 () Bool)

(assert (=> b!173773 (= e!114764 (isStrictlySorted!327 (t!7012 lt!85581)))))

(assert (= (and d!52721 (not res!82457)) b!173772))

(assert (= (and b!173772 res!82458) b!173773))

(declare-fun m!202043 () Bool)

(assert (=> b!173773 m!202043))

(assert (=> d!52491 d!52721))

(declare-fun d!52723 () Bool)

(assert (=> d!52723 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7156 () Bool)

(assert (= bs!7156 d!52723))

(assert (=> bs!7156 m!201257))

(declare-fun m!202045 () Bool)

(assert (=> bs!7156 m!202045))

(assert (=> b!173299 d!52723))

(declare-fun b!173775 () Bool)

(declare-fun e!114765 () Option!189)

(declare-fun e!114766 () Option!189)

(assert (=> b!173775 (= e!114765 e!114766)))

(declare-fun c!31037 () Bool)

(assert (=> b!173775 (= c!31037 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173776 () Bool)

(assert (=> b!173776 (= e!114766 (getValueByKey!183 (t!7012 (toList!1093 lt!85637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173774 () Bool)

(assert (=> b!173774 (= e!114765 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85637)))))))

(declare-fun d!52725 () Bool)

(declare-fun c!31036 () Bool)

(assert (=> d!52725 (= c!31036 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52725 (= (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000) e!114765)))

(declare-fun b!173777 () Bool)

(assert (=> b!173777 (= e!114766 None!187)))

(assert (= (and d!52725 c!31036) b!173774))

(assert (= (and d!52725 (not c!31036)) b!173775))

(assert (= (and b!173775 c!31037) b!173776))

(assert (= (and b!173775 (not c!31037)) b!173777))

(declare-fun m!202047 () Bool)

(assert (=> b!173776 m!202047))

(assert (=> b!173299 d!52725))

(declare-fun d!52727 () Bool)

(declare-fun isEmpty!442 (List!2214) Bool)

(assert (=> d!52727 (= (isEmpty!440 lt!85816) (isEmpty!442 (toList!1093 lt!85816)))))

(declare-fun bs!7157 () Bool)

(assert (= bs!7157 d!52727))

(declare-fun m!202049 () Bool)

(assert (=> bs!7157 m!202049))

(assert (=> b!173502 d!52727))

(declare-fun d!52729 () Bool)

(assert (=> d!52729 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun lt!85934 () Unit!5291)

(assert (=> d!52729 (= lt!85934 (choose!939 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun e!114767 () Bool)

(assert (=> d!52729 e!114767))

(declare-fun res!82459 () Bool)

(assert (=> d!52729 (=> (not res!82459) (not e!114767))))

(assert (=> d!52729 (= res!82459 (isStrictlySorted!327 (toList!1093 lt!85579)))))

(assert (=> d!52729 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))) lt!85934)))

(declare-fun b!173778 () Bool)

(assert (=> b!173778 (= e!114767 (containsKey!187 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (= (and d!52729 res!82459) b!173778))

(assert (=> d!52729 m!201117))

(assert (=> d!52729 m!201117))

(assert (=> d!52729 m!201371))

(declare-fun m!202051 () Bool)

(assert (=> d!52729 m!202051))

(declare-fun m!202053 () Bool)

(assert (=> d!52729 m!202053))

(assert (=> b!173778 m!201367))

(assert (=> b!173377 d!52729))

(declare-fun d!52731 () Bool)

(assert (=> d!52731 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309)))) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun bs!7158 () Bool)

(assert (= bs!7158 d!52731))

(assert (=> bs!7158 m!201117))

(declare-fun m!202055 () Bool)

(assert (=> bs!7158 m!202055))

(assert (=> b!173377 d!52731))

(assert (=> b!173377 d!52601))

(declare-fun d!52733 () Bool)

(declare-fun e!114769 () Bool)

(assert (=> d!52733 e!114769))

(declare-fun res!82460 () Bool)

(assert (=> d!52733 (=> res!82460 e!114769)))

(declare-fun lt!85936 () Bool)

(assert (=> d!52733 (= res!82460 (not lt!85936))))

(declare-fun lt!85935 () Bool)

(assert (=> d!52733 (= lt!85936 lt!85935)))

(declare-fun lt!85938 () Unit!5291)

(declare-fun e!114768 () Unit!5291)

(assert (=> d!52733 (= lt!85938 e!114768)))

(declare-fun c!31038 () Bool)

(assert (=> d!52733 (= c!31038 lt!85935)))

(assert (=> d!52733 (= lt!85935 (containsKey!187 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52733 (= (contains!1152 lt!85777 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!85936)))

(declare-fun b!173779 () Bool)

(declare-fun lt!85937 () Unit!5291)

(assert (=> b!173779 (= e!114768 lt!85937)))

(assert (=> b!173779 (= lt!85937 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> b!173779 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173780 () Bool)

(declare-fun Unit!5313 () Unit!5291)

(assert (=> b!173780 (= e!114768 Unit!5313)))

(declare-fun b!173781 () Bool)

(assert (=> b!173781 (= e!114769 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85777) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52733 c!31038) b!173779))

(assert (= (and d!52733 (not c!31038)) b!173780))

(assert (= (and d!52733 (not res!82460)) b!173781))

(declare-fun m!202057 () Bool)

(assert (=> d!52733 m!202057))

(declare-fun m!202059 () Bool)

(assert (=> b!173779 m!202059))

(assert (=> b!173779 m!201543))

(assert (=> b!173779 m!201543))

(declare-fun m!202061 () Bool)

(assert (=> b!173779 m!202061))

(assert (=> b!173781 m!201543))

(assert (=> b!173781 m!201543))

(assert (=> b!173781 m!202061))

(assert (=> d!52537 d!52733))

(declare-fun b!173783 () Bool)

(declare-fun e!114770 () Option!189)

(declare-fun e!114771 () Option!189)

(assert (=> b!173783 (= e!114770 e!114771)))

(declare-fun c!31040 () Bool)

(assert (=> b!173783 (= c!31040 (and ((_ is Cons!2210) lt!85779) (not (= (_1!1629 (h!2827 lt!85779)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173784 () Bool)

(assert (=> b!173784 (= e!114771 (getValueByKey!183 (t!7012 lt!85779) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173782 () Bool)

(assert (=> b!173782 (= e!114770 (Some!188 (_2!1629 (h!2827 lt!85779))))))

(declare-fun d!52735 () Bool)

(declare-fun c!31039 () Bool)

(assert (=> d!52735 (= c!31039 (and ((_ is Cons!2210) lt!85779) (= (_1!1629 (h!2827 lt!85779)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52735 (= (getValueByKey!183 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) e!114770)))

(declare-fun b!173785 () Bool)

(assert (=> b!173785 (= e!114771 None!187)))

(assert (= (and d!52735 c!31039) b!173782))

(assert (= (and d!52735 (not c!31039)) b!173783))

(assert (= (and b!173783 c!31040) b!173784))

(assert (= (and b!173783 (not c!31040)) b!173785))

(declare-fun m!202063 () Bool)

(assert (=> b!173784 m!202063))

(assert (=> d!52537 d!52735))

(declare-fun d!52737 () Bool)

(assert (=> d!52737 (= (getValueByKey!183 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun lt!85939 () Unit!5291)

(assert (=> d!52737 (= lt!85939 (choose!936 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun e!114772 () Bool)

(assert (=> d!52737 e!114772))

(declare-fun res!82461 () Bool)

(assert (=> d!52737 (=> (not res!82461) (not e!114772))))

(assert (=> d!52737 (= res!82461 (isStrictlySorted!327 lt!85779))))

(assert (=> d!52737 (= (lemmaContainsTupThenGetReturnValue!99 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!85939)))

(declare-fun b!173786 () Bool)

(declare-fun res!82462 () Bool)

(assert (=> b!173786 (=> (not res!82462) (not e!114772))))

(assert (=> b!173786 (= res!82462 (containsKey!187 lt!85779 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173787 () Bool)

(assert (=> b!173787 (= e!114772 (contains!1155 lt!85779 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52737 res!82461) b!173786))

(assert (= (and b!173786 res!82462) b!173787))

(assert (=> d!52737 m!201537))

(declare-fun m!202065 () Bool)

(assert (=> d!52737 m!202065))

(declare-fun m!202067 () Bool)

(assert (=> d!52737 m!202067))

(declare-fun m!202069 () Bool)

(assert (=> b!173786 m!202069))

(declare-fun m!202071 () Bool)

(assert (=> b!173787 m!202071))

(assert (=> d!52537 d!52737))

(declare-fun b!173788 () Bool)

(declare-fun e!114775 () List!2214)

(declare-fun call!17609 () List!2214)

(assert (=> b!173788 (= e!114775 call!17609)))

(declare-fun b!173789 () Bool)

(declare-fun res!82464 () Bool)

(declare-fun e!114773 () Bool)

(assert (=> b!173789 (=> (not res!82464) (not e!114773))))

(declare-fun lt!85940 () List!2214)

(assert (=> b!173789 (= res!82464 (containsKey!187 lt!85940 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173790 () Bool)

(declare-fun e!114777 () List!2214)

(assert (=> b!173790 (= e!114777 (insertStrictlySorted!102 (t!7012 (toList!1093 call!17554)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173791 () Bool)

(assert (=> b!173791 (= e!114773 (contains!1155 lt!85940 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173792 () Bool)

(declare-fun c!31042 () Bool)

(declare-fun c!31043 () Bool)

(assert (=> b!173792 (= e!114777 (ite c!31043 (t!7012 (toList!1093 call!17554)) (ite c!31042 (Cons!2210 (h!2827 (toList!1093 call!17554)) (t!7012 (toList!1093 call!17554))) Nil!2211)))))

(declare-fun c!31044 () Bool)

(declare-fun bm!17605 () Bool)

(declare-fun call!17608 () List!2214)

(assert (=> bm!17605 (= call!17608 ($colon$colon!97 e!114777 (ite c!31044 (h!2827 (toList!1093 call!17554)) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31041 () Bool)

(assert (=> bm!17605 (= c!31041 c!31044)))

(declare-fun b!173793 () Bool)

(assert (=> b!173793 (= c!31042 (and ((_ is Cons!2210) (toList!1093 call!17554)) (bvsgt (_1!1629 (h!2827 (toList!1093 call!17554))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun e!114776 () List!2214)

(assert (=> b!173793 (= e!114776 e!114775)))

(declare-fun b!173794 () Bool)

(declare-fun e!114774 () List!2214)

(assert (=> b!173794 (= e!114774 call!17608)))

(declare-fun d!52739 () Bool)

(assert (=> d!52739 e!114773))

(declare-fun res!82463 () Bool)

(assert (=> d!52739 (=> (not res!82463) (not e!114773))))

(assert (=> d!52739 (= res!82463 (isStrictlySorted!327 lt!85940))))

(assert (=> d!52739 (= lt!85940 e!114774)))

(assert (=> d!52739 (= c!31044 (and ((_ is Cons!2210) (toList!1093 call!17554)) (bvslt (_1!1629 (h!2827 (toList!1093 call!17554))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52739 (isStrictlySorted!327 (toList!1093 call!17554))))

(assert (=> d!52739 (= (insertStrictlySorted!102 (toList!1093 call!17554) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!85940)))

(declare-fun bm!17606 () Bool)

(declare-fun call!17610 () List!2214)

(assert (=> bm!17606 (= call!17609 call!17610)))

(declare-fun b!173795 () Bool)

(assert (=> b!173795 (= e!114775 call!17609)))

(declare-fun bm!17607 () Bool)

(assert (=> bm!17607 (= call!17610 call!17608)))

(declare-fun b!173796 () Bool)

(assert (=> b!173796 (= e!114774 e!114776)))

(assert (=> b!173796 (= c!31043 (and ((_ is Cons!2210) (toList!1093 call!17554)) (= (_1!1629 (h!2827 (toList!1093 call!17554))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173797 () Bool)

(assert (=> b!173797 (= e!114776 call!17610)))

(assert (= (and d!52739 c!31044) b!173794))

(assert (= (and d!52739 (not c!31044)) b!173796))

(assert (= (and b!173796 c!31043) b!173797))

(assert (= (and b!173796 (not c!31043)) b!173793))

(assert (= (and b!173793 c!31042) b!173788))

(assert (= (and b!173793 (not c!31042)) b!173795))

(assert (= (or b!173788 b!173795) bm!17606))

(assert (= (or b!173797 bm!17606) bm!17607))

(assert (= (or b!173794 bm!17607) bm!17605))

(assert (= (and bm!17605 c!31041) b!173790))

(assert (= (and bm!17605 (not c!31041)) b!173792))

(assert (= (and d!52739 res!82463) b!173789))

(assert (= (and b!173789 res!82464) b!173791))

(declare-fun m!202073 () Bool)

(assert (=> d!52739 m!202073))

(declare-fun m!202075 () Bool)

(assert (=> d!52739 m!202075))

(declare-fun m!202077 () Bool)

(assert (=> b!173791 m!202077))

(declare-fun m!202079 () Bool)

(assert (=> b!173790 m!202079))

(declare-fun m!202081 () Bool)

(assert (=> bm!17605 m!202081))

(declare-fun m!202083 () Bool)

(assert (=> b!173789 m!202083))

(assert (=> d!52537 d!52739))

(declare-fun d!52741 () Bool)

(declare-fun res!82465 () Bool)

(declare-fun e!114778 () Bool)

(assert (=> d!52741 (=> res!82465 e!114778)))

(assert (=> d!52741 (= res!82465 (and ((_ is Cons!2210) lt!85654) (= (_1!1629 (h!2827 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52741 (= (containsKey!187 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114778)))

(declare-fun b!173798 () Bool)

(declare-fun e!114779 () Bool)

(assert (=> b!173798 (= e!114778 e!114779)))

(declare-fun res!82466 () Bool)

(assert (=> b!173798 (=> (not res!82466) (not e!114779))))

(assert (=> b!173798 (= res!82466 (and (or (not ((_ is Cons!2210) lt!85654)) (bvsle (_1!1629 (h!2827 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2210) lt!85654) (bvslt (_1!1629 (h!2827 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173799 () Bool)

(assert (=> b!173799 (= e!114779 (containsKey!187 (t!7012 lt!85654) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52741 (not res!82465)) b!173798))

(assert (= (and b!173798 res!82466) b!173799))

(declare-fun m!202085 () Bool)

(assert (=> b!173799 m!202085))

(assert (=> b!173435 d!52741))

(declare-fun d!52743 () Bool)

(assert (=> d!52743 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))) lt!85669)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))) lt!85669)))))

(assert (=> d!52531 d!52743))

(declare-fun b!173801 () Bool)

(declare-fun e!114780 () Option!189)

(declare-fun e!114781 () Option!189)

(assert (=> b!173801 (= e!114780 e!114781)))

(declare-fun c!31046 () Bool)

(assert (=> b!173801 (= c!31046 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))))) lt!85669))))))

(declare-fun b!173802 () Bool)

(assert (=> b!173802 (= e!114781 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)))) lt!85669))))

(declare-fun b!173800 () Bool)

(assert (=> b!173800 (= e!114780 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)))))))))

(declare-fun c!31045 () Bool)

(declare-fun d!52745 () Bool)

(assert (=> d!52745 (= c!31045 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))))) lt!85669)))))

(assert (=> d!52745 (= (getValueByKey!183 (toList!1093 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309))) lt!85669) e!114780)))

(declare-fun b!173803 () Bool)

(assert (=> b!173803 (= e!114781 None!187)))

(assert (= (and d!52745 c!31045) b!173800))

(assert (= (and d!52745 (not c!31045)) b!173801))

(assert (= (and b!173801 c!31046) b!173802))

(assert (= (and b!173801 (not c!31046)) b!173803))

(declare-fun m!202087 () Bool)

(assert (=> b!173802 m!202087))

(assert (=> d!52531 d!52745))

(assert (=> d!52527 d!52525))

(assert (=> d!52527 d!52513))

(declare-fun d!52747 () Bool)

(assert (=> d!52747 (= (apply!130 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85673) (apply!130 lt!85656 lt!85673))))

(assert (=> d!52747 true))

(declare-fun _$34!1056 () Unit!5291)

(assert (=> d!52747 (= (choose!937 lt!85656 lt!85657 (zeroValue!3438 thiss!1248) lt!85673) _$34!1056)))

(declare-fun bs!7159 () Bool)

(assert (= bs!7159 d!52747))

(assert (=> bs!7159 m!201229))

(assert (=> bs!7159 m!201229))

(assert (=> bs!7159 m!201231))

(assert (=> bs!7159 m!201217))

(assert (=> d!52527 d!52747))

(declare-fun d!52749 () Bool)

(declare-fun e!114783 () Bool)

(assert (=> d!52749 e!114783))

(declare-fun res!82467 () Bool)

(assert (=> d!52749 (=> res!82467 e!114783)))

(declare-fun lt!85942 () Bool)

(assert (=> d!52749 (= res!82467 (not lt!85942))))

(declare-fun lt!85941 () Bool)

(assert (=> d!52749 (= lt!85942 lt!85941)))

(declare-fun lt!85944 () Unit!5291)

(declare-fun e!114782 () Unit!5291)

(assert (=> d!52749 (= lt!85944 e!114782)))

(declare-fun c!31047 () Bool)

(assert (=> d!52749 (= c!31047 lt!85941)))

(assert (=> d!52749 (= lt!85941 (containsKey!187 (toList!1093 lt!85656) lt!85673))))

(assert (=> d!52749 (= (contains!1152 lt!85656 lt!85673) lt!85942)))

(declare-fun b!173804 () Bool)

(declare-fun lt!85943 () Unit!5291)

(assert (=> b!173804 (= e!114782 lt!85943)))

(assert (=> b!173804 (= lt!85943 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85656) lt!85673))))

(assert (=> b!173804 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85656) lt!85673))))

(declare-fun b!173805 () Bool)

(declare-fun Unit!5314 () Unit!5291)

(assert (=> b!173805 (= e!114782 Unit!5314)))

(declare-fun b!173806 () Bool)

(assert (=> b!173806 (= e!114783 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85656) lt!85673)))))

(assert (= (and d!52749 c!31047) b!173804))

(assert (= (and d!52749 (not c!31047)) b!173805))

(assert (= (and d!52749 (not res!82467)) b!173806))

(declare-fun m!202089 () Bool)

(assert (=> d!52749 m!202089))

(declare-fun m!202091 () Bool)

(assert (=> b!173804 m!202091))

(assert (=> b!173804 m!201511))

(assert (=> b!173804 m!201511))

(declare-fun m!202093 () Bool)

(assert (=> b!173804 m!202093))

(assert (=> b!173806 m!201511))

(assert (=> b!173806 m!201511))

(assert (=> b!173806 m!202093))

(assert (=> d!52527 d!52749))

(assert (=> d!52527 d!52523))

(assert (=> d!52499 d!52497))

(declare-fun d!52751 () Bool)

(assert (=> d!52751 (= (getValueByKey!183 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52751 true))

(declare-fun _$22!536 () Unit!5291)

(assert (=> d!52751 (= (choose!936 lt!85654 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!536)))

(declare-fun bs!7160 () Bool)

(assert (= bs!7160 d!52751))

(assert (=> bs!7160 m!201193))

(assert (=> d!52499 d!52751))

(declare-fun d!52753 () Bool)

(declare-fun res!82468 () Bool)

(declare-fun e!114784 () Bool)

(assert (=> d!52753 (=> res!82468 e!114784)))

(assert (=> d!52753 (= res!82468 (or ((_ is Nil!2211) lt!85654) ((_ is Nil!2211) (t!7012 lt!85654))))))

(assert (=> d!52753 (= (isStrictlySorted!327 lt!85654) e!114784)))

(declare-fun b!173807 () Bool)

(declare-fun e!114785 () Bool)

(assert (=> b!173807 (= e!114784 e!114785)))

(declare-fun res!82469 () Bool)

(assert (=> b!173807 (=> (not res!82469) (not e!114785))))

(assert (=> b!173807 (= res!82469 (bvslt (_1!1629 (h!2827 lt!85654)) (_1!1629 (h!2827 (t!7012 lt!85654)))))))

(declare-fun b!173808 () Bool)

(assert (=> b!173808 (= e!114785 (isStrictlySorted!327 (t!7012 lt!85654)))))

(assert (= (and d!52753 (not res!82468)) b!173807))

(assert (= (and b!173807 res!82469) b!173808))

(declare-fun m!202095 () Bool)

(assert (=> b!173808 m!202095))

(assert (=> d!52499 d!52753))

(declare-fun d!52755 () Bool)

(assert (=> d!52755 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85661) lt!85669)) (v!3950 (getValueByKey!183 (toList!1093 lt!85661) lt!85669)))))

(assert (=> d!52521 d!52755))

(declare-fun b!173810 () Bool)

(declare-fun e!114786 () Option!189)

(declare-fun e!114787 () Option!189)

(assert (=> b!173810 (= e!114786 e!114787)))

(declare-fun c!31049 () Bool)

(assert (=> b!173810 (= c!31049 (and ((_ is Cons!2210) (toList!1093 lt!85661)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85661))) lt!85669))))))

(declare-fun b!173811 () Bool)

(assert (=> b!173811 (= e!114787 (getValueByKey!183 (t!7012 (toList!1093 lt!85661)) lt!85669))))

(declare-fun b!173809 () Bool)

(assert (=> b!173809 (= e!114786 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85661)))))))

(declare-fun d!52757 () Bool)

(declare-fun c!31048 () Bool)

(assert (=> d!52757 (= c!31048 (and ((_ is Cons!2210) (toList!1093 lt!85661)) (= (_1!1629 (h!2827 (toList!1093 lt!85661))) lt!85669)))))

(assert (=> d!52757 (= (getValueByKey!183 (toList!1093 lt!85661) lt!85669) e!114786)))

(declare-fun b!173812 () Bool)

(assert (=> b!173812 (= e!114787 None!187)))

(assert (= (and d!52757 c!31048) b!173809))

(assert (= (and d!52757 (not c!31048)) b!173810))

(assert (= (and b!173810 c!31049) b!173811))

(assert (= (and b!173810 (not c!31049)) b!173812))

(declare-fun m!202097 () Bool)

(assert (=> b!173811 m!202097))

(assert (=> d!52521 d!52757))

(assert (=> b!173594 d!52695))

(assert (=> d!52603 d!52467))

(assert (=> b!173548 d!52695))

(declare-fun d!52759 () Bool)

(assert (=> d!52759 (= (isEmpty!440 lt!85704) (isEmpty!442 (toList!1093 lt!85704)))))

(declare-fun bs!7161 () Bool)

(assert (= bs!7161 d!52759))

(declare-fun m!202099 () Bool)

(assert (=> bs!7161 m!202099))

(assert (=> b!173351 d!52759))

(declare-fun b!173814 () Bool)

(declare-fun e!114788 () Option!189)

(declare-fun e!114789 () Option!189)

(assert (=> b!173814 (= e!114788 e!114789)))

(declare-fun c!31051 () Bool)

(assert (=> b!173814 (= c!31051 (and ((_ is Cons!2210) (t!7012 lt!85581)) (not (= (_1!1629 (h!2827 (t!7012 lt!85581))) (_1!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun b!173815 () Bool)

(assert (=> b!173815 (= e!114789 (getValueByKey!183 (t!7012 (t!7012 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173813 () Bool)

(assert (=> b!173813 (= e!114788 (Some!188 (_2!1629 (h!2827 (t!7012 lt!85581)))))))

(declare-fun d!52761 () Bool)

(declare-fun c!31050 () Bool)

(assert (=> d!52761 (= c!31050 (and ((_ is Cons!2210) (t!7012 lt!85581)) (= (_1!1629 (h!2827 (t!7012 lt!85581))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52761 (= (getValueByKey!183 (t!7012 lt!85581) (_1!1629 (tuple2!3237 key!828 v!309))) e!114788)))

(declare-fun b!173816 () Bool)

(assert (=> b!173816 (= e!114789 None!187)))

(assert (= (and d!52761 c!31050) b!173813))

(assert (= (and d!52761 (not c!31050)) b!173814))

(assert (= (and b!173814 c!31051) b!173815))

(assert (= (and b!173814 (not c!31051)) b!173816))

(declare-fun m!202101 () Bool)

(assert (=> b!173815 m!202101))

(assert (=> b!173390 d!52761))

(declare-fun d!52763 () Bool)

(assert (=> d!52763 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(declare-fun lt!85945 () Unit!5291)

(assert (=> d!52763 (= lt!85945 (choose!939 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(declare-fun e!114790 () Bool)

(assert (=> d!52763 e!114790))

(declare-fun res!82470 () Bool)

(assert (=> d!52763 (=> (not res!82470) (not e!114790))))

(assert (=> d!52763 (= res!82470 (isStrictlySorted!327 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52763 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641) lt!85945)))

(declare-fun b!173817 () Bool)

(assert (=> b!173817 (= e!114790 (containsKey!187 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))

(assert (= (and d!52763 res!82470) b!173817))

(assert (=> d!52763 m!201639))

(assert (=> d!52763 m!201639))

(assert (=> d!52763 m!201641))

(declare-fun m!202103 () Bool)

(assert (=> d!52763 m!202103))

(declare-fun m!202105 () Bool)

(assert (=> d!52763 m!202105))

(assert (=> b!173817 m!201635))

(assert (=> b!173492 d!52763))

(declare-fun d!52765 () Bool)

(assert (=> d!52765 (= (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641))))))

(declare-fun bs!7162 () Bool)

(assert (= bs!7162 d!52765))

(assert (=> bs!7162 m!201639))

(declare-fun m!202107 () Bool)

(assert (=> bs!7162 m!202107))

(assert (=> b!173492 d!52765))

(declare-fun b!173819 () Bool)

(declare-fun e!114791 () Option!189)

(declare-fun e!114792 () Option!189)

(assert (=> b!173819 (= e!114791 e!114792)))

(declare-fun c!31053 () Bool)

(assert (=> b!173819 (= c!31053 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) lt!85641))))))

(declare-fun b!173820 () Bool)

(assert (=> b!173820 (= e!114792 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) lt!85641))))

(declare-fun b!173818 () Bool)

(assert (=> b!173818 (= e!114791 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))))

(declare-fun d!52767 () Bool)

(declare-fun c!31052 () Bool)

(assert (=> d!52767 (= c!31052 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) lt!85641)))))

(assert (=> d!52767 (= (getValueByKey!183 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641) e!114791)))

(declare-fun b!173821 () Bool)

(assert (=> b!173821 (= e!114792 None!187)))

(assert (= (and d!52767 c!31052) b!173818))

(assert (= (and d!52767 (not c!31052)) b!173819))

(assert (= (and b!173819 c!31053) b!173820))

(assert (= (and b!173819 (not c!31053)) b!173821))

(declare-fun m!202109 () Bool)

(assert (=> b!173820 m!202109))

(assert (=> b!173492 d!52767))

(declare-fun d!52769 () Bool)

(declare-fun res!82471 () Bool)

(declare-fun e!114793 () Bool)

(assert (=> d!52769 (=> res!82471 e!114793)))

(assert (=> d!52769 (= res!82471 (and ((_ is Cons!2210) (toList!1093 lt!85579)) (= (_1!1629 (h!2827 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52769 (= (containsKey!187 (toList!1093 lt!85579) (_1!1629 (tuple2!3237 key!828 v!309))) e!114793)))

(declare-fun b!173822 () Bool)

(declare-fun e!114794 () Bool)

(assert (=> b!173822 (= e!114793 e!114794)))

(declare-fun res!82472 () Bool)

(assert (=> b!173822 (=> (not res!82472) (not e!114794))))

(assert (=> b!173822 (= res!82472 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85579))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309)))) ((_ is Cons!2210) (toList!1093 lt!85579)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173823 () Bool)

(assert (=> b!173823 (= e!114794 (containsKey!187 (t!7012 (toList!1093 lt!85579)) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (= (and d!52769 (not res!82471)) b!173822))

(assert (= (and b!173822 res!82472) b!173823))

(declare-fun m!202111 () Bool)

(assert (=> b!173823 m!202111))

(assert (=> d!52487 d!52769))

(declare-fun d!52771 () Bool)

(assert (=> d!52771 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85635) lt!85643)) (v!3950 (getValueByKey!183 (toList!1093 lt!85635) lt!85643)))))

(assert (=> d!52557 d!52771))

(declare-fun b!173825 () Bool)

(declare-fun e!114795 () Option!189)

(declare-fun e!114796 () Option!189)

(assert (=> b!173825 (= e!114795 e!114796)))

(declare-fun c!31055 () Bool)

(assert (=> b!173825 (= c!31055 (and ((_ is Cons!2210) (toList!1093 lt!85635)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85635))) lt!85643))))))

(declare-fun b!173826 () Bool)

(assert (=> b!173826 (= e!114796 (getValueByKey!183 (t!7012 (toList!1093 lt!85635)) lt!85643))))

(declare-fun b!173824 () Bool)

(assert (=> b!173824 (= e!114795 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85635)))))))

(declare-fun d!52773 () Bool)

(declare-fun c!31054 () Bool)

(assert (=> d!52773 (= c!31054 (and ((_ is Cons!2210) (toList!1093 lt!85635)) (= (_1!1629 (h!2827 (toList!1093 lt!85635))) lt!85643)))))

(assert (=> d!52773 (= (getValueByKey!183 (toList!1093 lt!85635) lt!85643) e!114795)))

(declare-fun b!173827 () Bool)

(assert (=> b!173827 (= e!114796 None!187)))

(assert (= (and d!52773 c!31054) b!173824))

(assert (= (and d!52773 (not c!31054)) b!173825))

(assert (= (and b!173825 c!31055) b!173826))

(assert (= (and b!173825 (not c!31055)) b!173827))

(declare-fun m!202113 () Bool)

(assert (=> b!173826 m!202113))

(assert (=> d!52557 d!52773))

(assert (=> d!52481 d!52671))

(declare-fun b!173829 () Bool)

(declare-fun e!114797 () Option!189)

(declare-fun e!114798 () Option!189)

(assert (=> b!173829 (= e!114797 e!114798)))

(declare-fun c!31057 () Bool)

(assert (=> b!173829 (= c!31057 (and ((_ is Cons!2210) (toList!1093 lt!85803)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85803))) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173830 () Bool)

(assert (=> b!173830 (= e!114798 (getValueByKey!183 (t!7012 (toList!1093 lt!85803)) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173828 () Bool)

(assert (=> b!173828 (= e!114797 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85803)))))))

(declare-fun c!31056 () Bool)

(declare-fun d!52775 () Bool)

(assert (=> d!52775 (= c!31056 (and ((_ is Cons!2210) (toList!1093 lt!85803)) (= (_1!1629 (h!2827 (toList!1093 lt!85803))) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52775 (= (getValueByKey!183 (toList!1093 lt!85803) (_1!1629 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) e!114797)))

(declare-fun b!173831 () Bool)

(assert (=> b!173831 (= e!114798 None!187)))

(assert (= (and d!52775 c!31056) b!173828))

(assert (= (and d!52775 (not c!31056)) b!173829))

(assert (= (and b!173829 c!31057) b!173830))

(assert (= (and b!173829 (not c!31057)) b!173831))

(declare-fun m!202115 () Bool)

(assert (=> b!173830 m!202115))

(assert (=> b!173490 d!52775))

(declare-fun b!173833 () Bool)

(declare-fun e!114799 () Option!189)

(declare-fun e!114800 () Option!189)

(assert (=> b!173833 (= e!114799 e!114800)))

(declare-fun c!31059 () Bool)

(assert (=> b!173833 (= c!31059 (and ((_ is Cons!2210) (toList!1093 lt!85794)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85794))) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173834 () Bool)

(assert (=> b!173834 (= e!114800 (getValueByKey!183 (t!7012 (toList!1093 lt!85794)) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173832 () Bool)

(assert (=> b!173832 (= e!114799 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85794)))))))

(declare-fun c!31058 () Bool)

(declare-fun d!52777 () Bool)

(assert (=> d!52777 (= c!31058 (and ((_ is Cons!2210) (toList!1093 lt!85794)) (= (_1!1629 (h!2827 (toList!1093 lt!85794))) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52777 (= (getValueByKey!183 (toList!1093 lt!85794) (_1!1629 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) e!114799)))

(declare-fun b!173835 () Bool)

(assert (=> b!173835 (= e!114800 None!187)))

(assert (= (and d!52777 c!31058) b!173832))

(assert (= (and d!52777 (not c!31058)) b!173833))

(assert (= (and b!173833 c!31059) b!173834))

(assert (= (and b!173833 (not c!31059)) b!173835))

(declare-fun m!202117 () Bool)

(assert (=> b!173834 m!202117))

(assert (=> b!173485 d!52777))

(declare-fun d!52779 () Bool)

(declare-fun lt!85946 () Bool)

(assert (=> d!52779 (= lt!85946 (select (content!149 (toList!1093 lt!85761)) (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))

(declare-fun e!114802 () Bool)

(assert (=> d!52779 (= lt!85946 e!114802)))

(declare-fun res!82473 () Bool)

(assert (=> d!52779 (=> (not res!82473) (not e!114802))))

(assert (=> d!52779 (= res!82473 ((_ is Cons!2210) (toList!1093 lt!85761)))))

(assert (=> d!52779 (= (contains!1155 (toList!1093 lt!85761) (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) lt!85946)))

(declare-fun b!173836 () Bool)

(declare-fun e!114801 () Bool)

(assert (=> b!173836 (= e!114802 e!114801)))

(declare-fun res!82474 () Bool)

(assert (=> b!173836 (=> res!82474 e!114801)))

(assert (=> b!173836 (= res!82474 (= (h!2827 (toList!1093 lt!85761)) (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))

(declare-fun b!173837 () Bool)

(assert (=> b!173837 (= e!114801 (contains!1155 (t!7012 (toList!1093 lt!85761)) (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52779 res!82473) b!173836))

(assert (= (and b!173836 (not res!82474)) b!173837))

(declare-fun m!202119 () Bool)

(assert (=> d!52779 m!202119))

(declare-fun m!202121 () Bool)

(assert (=> d!52779 m!202121))

(declare-fun m!202123 () Bool)

(assert (=> b!173837 m!202123))

(assert (=> b!173457 d!52779))

(declare-fun d!52781 () Bool)

(assert (=> d!52781 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(declare-fun lt!85947 () Unit!5291)

(assert (=> d!52781 (= lt!85947 (choose!939 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(declare-fun e!114803 () Bool)

(assert (=> d!52781 e!114803))

(declare-fun res!82475 () Bool)

(assert (=> d!52781 (=> (not res!82475) (not e!114803))))

(assert (=> d!52781 (= res!82475 (isStrictlySorted!327 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52781 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667) lt!85947)))

(declare-fun b!173838 () Bool)

(assert (=> b!173838 (= e!114803 (containsKey!187 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))

(assert (= (and d!52781 res!82475) b!173838))

(assert (=> d!52781 m!201467))

(assert (=> d!52781 m!201467))

(assert (=> d!52781 m!201469))

(declare-fun m!202125 () Bool)

(assert (=> d!52781 m!202125))

(declare-fun m!202127 () Bool)

(assert (=> d!52781 m!202127))

(assert (=> b!173838 m!201463))

(assert (=> b!173453 d!52781))

(declare-fun d!52783 () Bool)

(assert (=> d!52783 (= (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667))))))

(declare-fun bs!7163 () Bool)

(assert (= bs!7163 d!52783))

(assert (=> bs!7163 m!201467))

(declare-fun m!202129 () Bool)

(assert (=> bs!7163 m!202129))

(assert (=> b!173453 d!52783))

(declare-fun b!173840 () Bool)

(declare-fun e!114804 () Option!189)

(declare-fun e!114805 () Option!189)

(assert (=> b!173840 (= e!114804 e!114805)))

(declare-fun c!31061 () Bool)

(assert (=> b!173840 (= c!31061 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) lt!85667))))))

(declare-fun b!173841 () Bool)

(assert (=> b!173841 (= e!114805 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) lt!85667))))

(declare-fun b!173839 () Bool)

(assert (=> b!173839 (= e!114804 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))))

(declare-fun d!52785 () Bool)

(declare-fun c!31060 () Bool)

(assert (=> d!52785 (= c!31060 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) lt!85667)))))

(assert (=> d!52785 (= (getValueByKey!183 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667) e!114804)))

(declare-fun b!173842 () Bool)

(assert (=> b!173842 (= e!114805 None!187)))

(assert (= (and d!52785 c!31060) b!173839))

(assert (= (and d!52785 (not c!31060)) b!173840))

(assert (= (and b!173840 c!31061) b!173841))

(assert (= (and b!173840 (not c!31061)) b!173842))

(declare-fun m!202131 () Bool)

(assert (=> b!173841 m!202131))

(assert (=> b!173453 d!52785))

(declare-fun d!52787 () Bool)

(declare-fun res!82476 () Bool)

(declare-fun e!114806 () Bool)

(assert (=> d!52787 (=> res!82476 e!114806)))

(assert (=> d!52787 (= res!82476 (or ((_ is Nil!2211) lt!85737) ((_ is Nil!2211) (t!7012 lt!85737))))))

(assert (=> d!52787 (= (isStrictlySorted!327 lt!85737) e!114806)))

(declare-fun b!173843 () Bool)

(declare-fun e!114807 () Bool)

(assert (=> b!173843 (= e!114806 e!114807)))

(declare-fun res!82477 () Bool)

(assert (=> b!173843 (=> (not res!82477) (not e!114807))))

(assert (=> b!173843 (= res!82477 (bvslt (_1!1629 (h!2827 lt!85737)) (_1!1629 (h!2827 (t!7012 lt!85737)))))))

(declare-fun b!173844 () Bool)

(assert (=> b!173844 (= e!114807 (isStrictlySorted!327 (t!7012 lt!85737)))))

(assert (= (and d!52787 (not res!82476)) b!173843))

(assert (= (and b!173843 res!82477) b!173844))

(declare-fun m!202133 () Bool)

(assert (=> b!173844 m!202133))

(assert (=> d!52493 d!52787))

(declare-fun d!52789 () Bool)

(declare-fun res!82478 () Bool)

(declare-fun e!114808 () Bool)

(assert (=> d!52789 (=> res!82478 e!114808)))

(assert (=> d!52789 (= res!82478 (or ((_ is Nil!2211) (toList!1093 (map!1862 thiss!1248))) ((_ is Nil!2211) (t!7012 (toList!1093 (map!1862 thiss!1248))))))))

(assert (=> d!52789 (= (isStrictlySorted!327 (toList!1093 (map!1862 thiss!1248))) e!114808)))

(declare-fun b!173845 () Bool)

(declare-fun e!114809 () Bool)

(assert (=> b!173845 (= e!114808 e!114809)))

(declare-fun res!82479 () Bool)

(assert (=> b!173845 (=> (not res!82479) (not e!114809))))

(assert (=> b!173845 (= res!82479 (bvslt (_1!1629 (h!2827 (toList!1093 (map!1862 thiss!1248)))) (_1!1629 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248)))))))))

(declare-fun b!173846 () Bool)

(assert (=> b!173846 (= e!114809 (isStrictlySorted!327 (t!7012 (toList!1093 (map!1862 thiss!1248)))))))

(assert (= (and d!52789 (not res!82478)) b!173845))

(assert (= (and b!173845 res!82479) b!173846))

(declare-fun m!202135 () Bool)

(assert (=> b!173846 m!202135))

(assert (=> d!52493 d!52789))

(declare-fun b!173848 () Bool)

(declare-fun e!114810 () Option!189)

(declare-fun e!114811 () Option!189)

(assert (=> b!173848 (= e!114810 e!114811)))

(declare-fun c!31063 () Bool)

(assert (=> b!173848 (= c!31063 (and ((_ is Cons!2210) (toList!1093 lt!85749)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85749))) (_1!1629 (tuple2!3237 lt!85668 v!309))))))))

(declare-fun b!173849 () Bool)

(assert (=> b!173849 (= e!114811 (getValueByKey!183 (t!7012 (toList!1093 lt!85749)) (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173847 () Bool)

(assert (=> b!173847 (= e!114810 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85749)))))))

(declare-fun d!52791 () Bool)

(declare-fun c!31062 () Bool)

(assert (=> d!52791 (= c!31062 (and ((_ is Cons!2210) (toList!1093 lt!85749)) (= (_1!1629 (h!2827 (toList!1093 lt!85749))) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(assert (=> d!52791 (= (getValueByKey!183 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309))) e!114810)))

(declare-fun b!173850 () Bool)

(assert (=> b!173850 (= e!114811 None!187)))

(assert (= (and d!52791 c!31062) b!173847))

(assert (= (and d!52791 (not c!31062)) b!173848))

(assert (= (and b!173848 c!31063) b!173849))

(assert (= (and b!173848 (not c!31063)) b!173850))

(declare-fun m!202137 () Bool)

(assert (=> b!173849 m!202137))

(assert (=> b!173449 d!52791))

(declare-fun d!52793 () Bool)

(assert (=> d!52793 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85662) lt!85674)) (v!3950 (getValueByKey!183 (toList!1093 lt!85662) lt!85674)))))

(assert (=> d!52533 d!52793))

(declare-fun b!173852 () Bool)

(declare-fun e!114812 () Option!189)

(declare-fun e!114813 () Option!189)

(assert (=> b!173852 (= e!114812 e!114813)))

(declare-fun c!31065 () Bool)

(assert (=> b!173852 (= c!31065 (and ((_ is Cons!2210) (toList!1093 lt!85662)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85662))) lt!85674))))))

(declare-fun b!173853 () Bool)

(assert (=> b!173853 (= e!114813 (getValueByKey!183 (t!7012 (toList!1093 lt!85662)) lt!85674))))

(declare-fun b!173851 () Bool)

(assert (=> b!173851 (= e!114812 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85662)))))))

(declare-fun d!52795 () Bool)

(declare-fun c!31064 () Bool)

(assert (=> d!52795 (= c!31064 (and ((_ is Cons!2210) (toList!1093 lt!85662)) (= (_1!1629 (h!2827 (toList!1093 lt!85662))) lt!85674)))))

(assert (=> d!52795 (= (getValueByKey!183 (toList!1093 lt!85662) lt!85674) e!114812)))

(declare-fun b!173854 () Bool)

(assert (=> b!173854 (= e!114813 None!187)))

(assert (= (and d!52795 c!31064) b!173851))

(assert (= (and d!52795 (not c!31064)) b!173852))

(assert (= (and b!173852 c!31065) b!173853))

(assert (= (and b!173852 (not c!31065)) b!173854))

(declare-fun m!202139 () Bool)

(assert (=> b!173853 m!202139))

(assert (=> d!52533 d!52795))

(declare-fun d!52797 () Bool)

(declare-fun res!82480 () Bool)

(declare-fun e!114814 () Bool)

(assert (=> d!52797 (=> res!82480 e!114814)))

(assert (=> d!52797 (= res!82480 (and ((_ is Cons!2210) lt!85743) (= (_1!1629 (h!2827 lt!85743)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52797 (= (containsKey!187 lt!85743 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114814)))

(declare-fun b!173855 () Bool)

(declare-fun e!114815 () Bool)

(assert (=> b!173855 (= e!114814 e!114815)))

(declare-fun res!82481 () Bool)

(assert (=> b!173855 (=> (not res!82481) (not e!114815))))

(assert (=> b!173855 (= res!82481 (and (or (not ((_ is Cons!2210) lt!85743)) (bvsle (_1!1629 (h!2827 lt!85743)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2210) lt!85743) (bvslt (_1!1629 (h!2827 lt!85743)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173856 () Bool)

(assert (=> b!173856 (= e!114815 (containsKey!187 (t!7012 lt!85743) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52797 (not res!82480)) b!173855))

(assert (= (and b!173855 res!82481) b!173856))

(declare-fun m!202141 () Bool)

(assert (=> b!173856 m!202141))

(assert (=> b!173438 d!52797))

(declare-fun lt!85948 () Bool)

(declare-fun d!52799 () Bool)

(assert (=> d!52799 (= lt!85948 (select (content!149 (toList!1093 lt!85799)) (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))

(declare-fun e!114817 () Bool)

(assert (=> d!52799 (= lt!85948 e!114817)))

(declare-fun res!82482 () Bool)

(assert (=> d!52799 (=> (not res!82482) (not e!114817))))

(assert (=> d!52799 (= res!82482 ((_ is Cons!2210) (toList!1093 lt!85799)))))

(assert (=> d!52799 (= (contains!1155 (toList!1093 lt!85799) (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) lt!85948)))

(declare-fun b!173857 () Bool)

(declare-fun e!114816 () Bool)

(assert (=> b!173857 (= e!114817 e!114816)))

(declare-fun res!82483 () Bool)

(assert (=> b!173857 (=> res!82483 e!114816)))

(assert (=> b!173857 (= res!82483 (= (h!2827 (toList!1093 lt!85799)) (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))

(declare-fun b!173858 () Bool)

(assert (=> b!173858 (= e!114816 (contains!1155 (t!7012 (toList!1093 lt!85799)) (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))

(assert (= (and d!52799 res!82482) b!173857))

(assert (= (and b!173857 (not res!82483)) b!173858))

(declare-fun m!202143 () Bool)

(assert (=> d!52799 m!202143))

(declare-fun m!202145 () Bool)

(assert (=> d!52799 m!202145))

(declare-fun m!202147 () Bool)

(assert (=> b!173858 m!202147))

(assert (=> b!173489 d!52799))

(declare-fun b!173859 () Bool)

(declare-fun e!114820 () List!2214)

(declare-fun call!17612 () List!2214)

(assert (=> b!173859 (= e!114820 call!17612)))

(declare-fun b!173860 () Bool)

(declare-fun res!82485 () Bool)

(declare-fun e!114818 () Bool)

(assert (=> b!173860 (=> (not res!82485) (not e!114818))))

(declare-fun lt!85949 () List!2214)

(assert (=> b!173860 (= res!82485 (containsKey!187 lt!85949 (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun e!114822 () List!2214)

(declare-fun b!173861 () Bool)

(assert (=> b!173861 (= e!114822 (insertStrictlySorted!102 (t!7012 (t!7012 (toList!1093 (map!1862 thiss!1248)))) (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173862 () Bool)

(assert (=> b!173862 (= e!114818 (contains!1155 lt!85949 (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173863 () Bool)

(declare-fun c!31067 () Bool)

(declare-fun c!31068 () Bool)

(assert (=> b!173863 (= e!114822 (ite c!31068 (t!7012 (t!7012 (toList!1093 (map!1862 thiss!1248)))) (ite c!31067 (Cons!2210 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248)))) (t!7012 (t!7012 (toList!1093 (map!1862 thiss!1248))))) Nil!2211)))))

(declare-fun call!17611 () List!2214)

(declare-fun bm!17608 () Bool)

(declare-fun c!31069 () Bool)

(assert (=> bm!17608 (= call!17611 ($colon$colon!97 e!114822 (ite c!31069 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248)))) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun c!31066 () Bool)

(assert (=> bm!17608 (= c!31066 c!31069)))

(declare-fun b!173864 () Bool)

(assert (=> b!173864 (= c!31067 (and ((_ is Cons!2210) (t!7012 (toList!1093 (map!1862 thiss!1248)))) (bvsgt (_1!1629 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248))))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun e!114821 () List!2214)

(assert (=> b!173864 (= e!114821 e!114820)))

(declare-fun b!173865 () Bool)

(declare-fun e!114819 () List!2214)

(assert (=> b!173865 (= e!114819 call!17611)))

(declare-fun d!52801 () Bool)

(assert (=> d!52801 e!114818))

(declare-fun res!82484 () Bool)

(assert (=> d!52801 (=> (not res!82484) (not e!114818))))

(assert (=> d!52801 (= res!82484 (isStrictlySorted!327 lt!85949))))

(assert (=> d!52801 (= lt!85949 e!114819)))

(assert (=> d!52801 (= c!31069 (and ((_ is Cons!2210) (t!7012 (toList!1093 (map!1862 thiss!1248)))) (bvslt (_1!1629 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248))))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52801 (isStrictlySorted!327 (t!7012 (toList!1093 (map!1862 thiss!1248))))))

(assert (=> d!52801 (= (insertStrictlySorted!102 (t!7012 (toList!1093 (map!1862 thiss!1248))) (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))) lt!85949)))

(declare-fun bm!17609 () Bool)

(declare-fun call!17613 () List!2214)

(assert (=> bm!17609 (= call!17612 call!17613)))

(declare-fun b!173866 () Bool)

(assert (=> b!173866 (= e!114820 call!17612)))

(declare-fun bm!17610 () Bool)

(assert (=> bm!17610 (= call!17613 call!17611)))

(declare-fun b!173867 () Bool)

(assert (=> b!173867 (= e!114819 e!114821)))

(assert (=> b!173867 (= c!31068 (and ((_ is Cons!2210) (t!7012 (toList!1093 (map!1862 thiss!1248)))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 (map!1862 thiss!1248))))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!173868 () Bool)

(assert (=> b!173868 (= e!114821 call!17613)))

(assert (= (and d!52801 c!31069) b!173865))

(assert (= (and d!52801 (not c!31069)) b!173867))

(assert (= (and b!173867 c!31068) b!173868))

(assert (= (and b!173867 (not c!31068)) b!173864))

(assert (= (and b!173864 c!31067) b!173859))

(assert (= (and b!173864 (not c!31067)) b!173866))

(assert (= (or b!173859 b!173866) bm!17609))

(assert (= (or b!173868 bm!17609) bm!17610))

(assert (= (or b!173865 bm!17610) bm!17608))

(assert (= (and bm!17608 c!31066) b!173861))

(assert (= (and bm!17608 (not c!31066)) b!173863))

(assert (= (and d!52801 res!82484) b!173860))

(assert (= (and b!173860 res!82485) b!173862))

(declare-fun m!202149 () Bool)

(assert (=> d!52801 m!202149))

(assert (=> d!52801 m!202135))

(declare-fun m!202151 () Bool)

(assert (=> b!173862 m!202151))

(declare-fun m!202153 () Bool)

(assert (=> b!173861 m!202153))

(declare-fun m!202155 () Bool)

(assert (=> bm!17608 m!202155))

(declare-fun m!202157 () Bool)

(assert (=> b!173860 m!202157))

(assert (=> b!173420 d!52801))

(declare-fun bm!17611 () Bool)

(declare-fun call!17614 () ListLongMap!2155)

(assert (=> bm!17611 (= call!17614 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 lt!85539)))))

(declare-fun b!173869 () Bool)

(declare-fun e!114824 () Bool)

(declare-fun e!114826 () Bool)

(assert (=> b!173869 (= e!114824 e!114826)))

(declare-fun c!31072 () Bool)

(assert (=> b!173869 (= c!31072 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(declare-fun b!173870 () Bool)

(declare-fun e!114827 () Bool)

(assert (=> b!173870 (= e!114824 e!114827)))

(assert (=> b!173870 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(declare-fun res!82489 () Bool)

(declare-fun lt!85955 () ListLongMap!2155)

(assert (=> b!173870 (= res!82489 (contains!1152 lt!85955 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> b!173870 (=> (not res!82489) (not e!114827))))

(declare-fun b!173871 () Bool)

(declare-fun e!114828 () ListLongMap!2155)

(assert (=> b!173871 (= e!114828 call!17614)))

(declare-fun b!173872 () Bool)

(declare-fun e!114823 () ListLongMap!2155)

(assert (=> b!173872 (= e!114823 (ListLongMap!2156 Nil!2211))))

(declare-fun b!173873 () Bool)

(declare-fun lt!85951 () Unit!5291)

(declare-fun lt!85954 () Unit!5291)

(assert (=> b!173873 (= lt!85951 lt!85954)))

(declare-fun lt!85950 () (_ BitVec 64))

(declare-fun lt!85956 () V!5089)

(declare-fun lt!85953 () ListLongMap!2155)

(declare-fun lt!85952 () (_ BitVec 64))

(assert (=> b!173873 (not (contains!1152 (+!240 lt!85953 (tuple2!3237 lt!85950 lt!85956)) lt!85952))))

(assert (=> b!173873 (= lt!85954 (addStillNotContains!73 lt!85953 lt!85950 lt!85956 lt!85952))))

(assert (=> b!173873 (= lt!85952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173873 (= lt!85956 (get!1962 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173873 (= lt!85950 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))

(assert (=> b!173873 (= lt!85953 call!17614)))

(assert (=> b!173873 (= e!114828 (+!240 call!17614 (tuple2!3237 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173874 () Bool)

(assert (=> b!173874 (= e!114823 e!114828)))

(declare-fun c!31071 () Bool)

(assert (=> b!173874 (= c!31071 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun d!52803 () Bool)

(declare-fun e!114825 () Bool)

(assert (=> d!52803 e!114825))

(declare-fun res!82486 () Bool)

(assert (=> d!52803 (=> (not res!82486) (not e!114825))))

(assert (=> d!52803 (= res!82486 (not (contains!1152 lt!85955 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52803 (= lt!85955 e!114823)))

(declare-fun c!31070 () Bool)

(assert (=> d!52803 (= c!31070 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52803 (validMask!0 (mask!8468 lt!85539))))

(assert (=> d!52803 (= (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85539)) lt!85955)))

(declare-fun b!173875 () Bool)

(declare-fun e!114829 () Bool)

(assert (=> b!173875 (= e!114829 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> b!173875 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!173876 () Bool)

(assert (=> b!173876 (= e!114826 (isEmpty!440 lt!85955))))

(declare-fun b!173877 () Bool)

(declare-fun res!82487 () Bool)

(assert (=> b!173877 (=> (not res!82487) (not e!114825))))

(assert (=> b!173877 (= res!82487 (not (contains!1152 lt!85955 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173878 () Bool)

(assert (=> b!173878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (=> b!173878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3755 (_values!3580 lt!85539))))))

(assert (=> b!173878 (= e!114827 (= (apply!130 lt!85955 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) (get!1962 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173879 () Bool)

(assert (=> b!173879 (= e!114826 (= lt!85955 (getCurrentListMapNoExtraKeys!151 (_keys!5437 lt!85539) (_values!3580 lt!85539) (mask!8468 lt!85539) (extraKeys!3336 lt!85539) (zeroValue!3438 lt!85539) (minValue!3440 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 lt!85539))))))

(declare-fun b!173880 () Bool)

(assert (=> b!173880 (= e!114825 e!114824)))

(declare-fun c!31073 () Bool)

(assert (=> b!173880 (= c!31073 e!114829)))

(declare-fun res!82488 () Bool)

(assert (=> b!173880 (=> (not res!82488) (not e!114829))))

(assert (=> b!173880 (= res!82488 (bvslt #b00000000000000000000000000000000 (size!3754 (_keys!5437 lt!85539))))))

(assert (= (and d!52803 c!31070) b!173872))

(assert (= (and d!52803 (not c!31070)) b!173874))

(assert (= (and b!173874 c!31071) b!173873))

(assert (= (and b!173874 (not c!31071)) b!173871))

(assert (= (or b!173873 b!173871) bm!17611))

(assert (= (and d!52803 res!82486) b!173877))

(assert (= (and b!173877 res!82487) b!173880))

(assert (= (and b!173880 res!82488) b!173875))

(assert (= (and b!173880 c!31073) b!173870))

(assert (= (and b!173880 (not c!31073)) b!173869))

(assert (= (and b!173870 res!82489) b!173878))

(assert (= (and b!173869 c!31072) b!173879))

(assert (= (and b!173869 (not c!31072)) b!173876))

(declare-fun b_lambda!6951 () Bool)

(assert (=> (not b_lambda!6951) (not b!173873)))

(assert (=> b!173873 t!7019))

(declare-fun b_and!10751 () Bool)

(assert (= b_and!10749 (and (=> t!7019 result!4583) b_and!10751)))

(declare-fun b_lambda!6953 () Bool)

(assert (=> (not b_lambda!6953) (not b!173878)))

(assert (=> b!173878 t!7019))

(declare-fun b_and!10753 () Bool)

(assert (= b_and!10751 (and (=> t!7019 result!4583) b_and!10753)))

(assert (=> b!173870 m!201317))

(assert (=> b!173870 m!201317))

(declare-fun m!202159 () Bool)

(assert (=> b!173870 m!202159))

(assert (=> b!173874 m!201317))

(assert (=> b!173874 m!201317))

(assert (=> b!173874 m!201319))

(declare-fun m!202161 () Bool)

(assert (=> bm!17611 m!202161))

(assert (=> b!173878 m!201317))

(declare-fun m!202163 () Bool)

(assert (=> b!173878 m!202163))

(assert (=> b!173878 m!201317))

(assert (=> b!173878 m!201357))

(assert (=> b!173878 m!201355))

(assert (=> b!173878 m!201355))

(assert (=> b!173878 m!201357))

(assert (=> b!173878 m!201359))

(assert (=> b!173879 m!202161))

(assert (=> b!173873 m!201317))

(assert (=> b!173873 m!201357))

(declare-fun m!202165 () Bool)

(assert (=> b!173873 m!202165))

(assert (=> b!173873 m!201355))

(assert (=> b!173873 m!201355))

(assert (=> b!173873 m!201357))

(assert (=> b!173873 m!201359))

(declare-fun m!202167 () Bool)

(assert (=> b!173873 m!202167))

(assert (=> b!173873 m!202165))

(declare-fun m!202169 () Bool)

(assert (=> b!173873 m!202169))

(declare-fun m!202171 () Bool)

(assert (=> b!173873 m!202171))

(declare-fun m!202173 () Bool)

(assert (=> d!52803 m!202173))

(assert (=> d!52803 m!201287))

(declare-fun m!202175 () Bool)

(assert (=> b!173876 m!202175))

(assert (=> b!173875 m!201317))

(assert (=> b!173875 m!201317))

(assert (=> b!173875 m!201319))

(declare-fun m!202177 () Bool)

(assert (=> b!173877 m!202177))

(assert (=> bm!17564 d!52803))

(declare-fun lt!85957 () Bool)

(declare-fun d!52805 () Bool)

(assert (=> d!52805 (= lt!85957 (select (content!149 (t!7012 (toList!1093 lt!85579))) (tuple2!3237 key!828 v!309)))))

(declare-fun e!114831 () Bool)

(assert (=> d!52805 (= lt!85957 e!114831)))

(declare-fun res!82490 () Bool)

(assert (=> d!52805 (=> (not res!82490) (not e!114831))))

(assert (=> d!52805 (= res!82490 ((_ is Cons!2210) (t!7012 (toList!1093 lt!85579))))))

(assert (=> d!52805 (= (contains!1155 (t!7012 (toList!1093 lt!85579)) (tuple2!3237 key!828 v!309)) lt!85957)))

(declare-fun b!173881 () Bool)

(declare-fun e!114830 () Bool)

(assert (=> b!173881 (= e!114831 e!114830)))

(declare-fun res!82491 () Bool)

(assert (=> b!173881 (=> res!82491 e!114830)))

(assert (=> b!173881 (= res!82491 (= (h!2827 (t!7012 (toList!1093 lt!85579))) (tuple2!3237 key!828 v!309)))))

(declare-fun b!173882 () Bool)

(assert (=> b!173882 (= e!114830 (contains!1155 (t!7012 (t!7012 (toList!1093 lt!85579))) (tuple2!3237 key!828 v!309)))))

(assert (= (and d!52805 res!82490) b!173881))

(assert (= (and b!173881 (not res!82491)) b!173882))

(declare-fun m!202179 () Bool)

(assert (=> d!52805 m!202179))

(declare-fun m!202181 () Bool)

(assert (=> d!52805 m!202181))

(declare-fun m!202183 () Bool)

(assert (=> b!173882 m!202183))

(assert (=> b!173573 d!52805))

(declare-fun d!52807 () Bool)

(declare-fun e!114833 () Bool)

(assert (=> d!52807 e!114833))

(declare-fun res!82492 () Bool)

(assert (=> d!52807 (=> res!82492 e!114833)))

(declare-fun lt!85959 () Bool)

(assert (=> d!52807 (= res!82492 (not lt!85959))))

(declare-fun lt!85958 () Bool)

(assert (=> d!52807 (= lt!85959 lt!85958)))

(declare-fun lt!85961 () Unit!5291)

(declare-fun e!114832 () Unit!5291)

(assert (=> d!52807 (= lt!85961 e!114832)))

(declare-fun c!31074 () Bool)

(assert (=> d!52807 (= c!31074 lt!85958)))

(assert (=> d!52807 (= lt!85958 (containsKey!187 (toList!1093 lt!85661) lt!85669))))

(assert (=> d!52807 (= (contains!1152 lt!85661 lt!85669) lt!85959)))

(declare-fun b!173883 () Bool)

(declare-fun lt!85960 () Unit!5291)

(assert (=> b!173883 (= e!114832 lt!85960)))

(assert (=> b!173883 (= lt!85960 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85661) lt!85669))))

(assert (=> b!173883 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85661) lt!85669))))

(declare-fun b!173884 () Bool)

(declare-fun Unit!5315 () Unit!5291)

(assert (=> b!173884 (= e!114832 Unit!5315)))

(declare-fun b!173885 () Bool)

(assert (=> b!173885 (= e!114833 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85661) lt!85669)))))

(assert (= (and d!52807 c!31074) b!173883))

(assert (= (and d!52807 (not c!31074)) b!173884))

(assert (= (and d!52807 (not res!82492)) b!173885))

(declare-fun m!202185 () Bool)

(assert (=> d!52807 m!202185))

(declare-fun m!202187 () Bool)

(assert (=> b!173883 m!202187))

(assert (=> b!173883 m!201503))

(assert (=> b!173883 m!201503))

(declare-fun m!202189 () Bool)

(assert (=> b!173883 m!202189))

(assert (=> b!173885 m!201503))

(assert (=> b!173885 m!201503))

(assert (=> b!173885 m!202189))

(assert (=> d!52517 d!52807))

(assert (=> d!52517 d!52531))

(assert (=> d!52517 d!52515))

(declare-fun d!52809 () Bool)

(assert (=> d!52809 (= (apply!130 (+!240 lt!85661 (tuple2!3237 lt!85671 v!309)) lt!85669) (apply!130 lt!85661 lt!85669))))

(assert (=> d!52809 true))

(declare-fun _$34!1057 () Unit!5291)

(assert (=> d!52809 (= (choose!937 lt!85661 lt!85671 v!309 lt!85669) _$34!1057)))

(declare-fun bs!7164 () Bool)

(assert (= bs!7164 d!52809))

(assert (=> bs!7164 m!201225))

(assert (=> bs!7164 m!201225))

(assert (=> bs!7164 m!201227))

(assert (=> bs!7164 m!201221))

(assert (=> d!52517 d!52809))

(assert (=> d!52517 d!52521))

(declare-fun d!52811 () Bool)

(assert (=> d!52811 (= (size!3760 thiss!1248) (bvadd (_size!1200 thiss!1248) (bvsdiv (bvadd (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173562 d!52811))

(declare-fun d!52813 () Bool)

(declare-fun c!31077 () Bool)

(assert (=> d!52813 (= c!31077 ((_ is Nil!2211) (toList!1093 lt!85579)))))

(declare-fun e!114836 () (InoxSet tuple2!3236))

(assert (=> d!52813 (= (content!149 (toList!1093 lt!85579)) e!114836)))

(declare-fun b!173890 () Bool)

(assert (=> b!173890 (= e!114836 ((as const (Array tuple2!3236 Bool)) false))))

(declare-fun b!173891 () Bool)

(assert (=> b!173891 (= e!114836 ((_ map or) (store ((as const (Array tuple2!3236 Bool)) false) (h!2827 (toList!1093 lt!85579)) true) (content!149 (t!7012 (toList!1093 lt!85579)))))))

(assert (= (and d!52813 c!31077) b!173890))

(assert (= (and d!52813 (not c!31077)) b!173891))

(declare-fun m!202191 () Bool)

(assert (=> b!173891 m!202191))

(assert (=> b!173891 m!202179))

(assert (=> d!52607 d!52813))

(declare-fun d!52815 () Bool)

(assert (=> d!52815 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) (v!3950 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52475 d!52815))

(assert (=> d!52475 d!52639))

(declare-fun d!52817 () Bool)

(declare-fun e!114838 () Bool)

(assert (=> d!52817 e!114838))

(declare-fun res!82493 () Bool)

(assert (=> d!52817 (=> res!82493 e!114838)))

(declare-fun lt!85963 () Bool)

(assert (=> d!52817 (= res!82493 (not lt!85963))))

(declare-fun lt!85962 () Bool)

(assert (=> d!52817 (= lt!85963 lt!85962)))

(declare-fun lt!85965 () Unit!5291)

(declare-fun e!114837 () Unit!5291)

(assert (=> d!52817 (= lt!85965 e!114837)))

(declare-fun c!31078 () Bool)

(assert (=> d!52817 (= c!31078 lt!85962)))

(assert (=> d!52817 (= lt!85962 (containsKey!187 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52817 (= (contains!1152 lt!85761 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85963)))

(declare-fun b!173892 () Bool)

(declare-fun lt!85964 () Unit!5291)

(assert (=> b!173892 (= e!114837 lt!85964)))

(assert (=> b!173892 (= lt!85964 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173892 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173893 () Bool)

(declare-fun Unit!5316 () Unit!5291)

(assert (=> b!173893 (= e!114837 Unit!5316)))

(declare-fun b!173894 () Bool)

(assert (=> b!173894 (= e!114838 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52817 c!31078) b!173892))

(assert (= (and d!52817 (not c!31078)) b!173893))

(assert (= (and d!52817 (not res!82493)) b!173894))

(declare-fun m!202193 () Bool)

(assert (=> d!52817 m!202193))

(declare-fun m!202195 () Bool)

(assert (=> b!173892 m!202195))

(assert (=> b!173892 m!201479))

(assert (=> b!173892 m!201479))

(declare-fun m!202197 () Bool)

(assert (=> b!173892 m!202197))

(assert (=> b!173894 m!201479))

(assert (=> b!173894 m!201479))

(assert (=> b!173894 m!202197))

(assert (=> d!52513 d!52817))

(declare-fun b!173896 () Bool)

(declare-fun e!114839 () Option!189)

(declare-fun e!114840 () Option!189)

(assert (=> b!173896 (= e!114839 e!114840)))

(declare-fun c!31080 () Bool)

(assert (=> b!173896 (= c!31080 (and ((_ is Cons!2210) lt!85763) (not (= (_1!1629 (h!2827 lt!85763)) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173897 () Bool)

(assert (=> b!173897 (= e!114840 (getValueByKey!183 (t!7012 lt!85763) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173895 () Bool)

(assert (=> b!173895 (= e!114839 (Some!188 (_2!1629 (h!2827 lt!85763))))))

(declare-fun d!52819 () Bool)

(declare-fun c!31079 () Bool)

(assert (=> d!52819 (= c!31079 (and ((_ is Cons!2210) lt!85763) (= (_1!1629 (h!2827 lt!85763)) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52819 (= (getValueByKey!183 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) e!114839)))

(declare-fun b!173898 () Bool)

(assert (=> b!173898 (= e!114840 None!187)))

(assert (= (and d!52819 c!31079) b!173895))

(assert (= (and d!52819 (not c!31079)) b!173896))

(assert (= (and b!173896 c!31080) b!173897))

(assert (= (and b!173896 (not c!31080)) b!173898))

(declare-fun m!202199 () Bool)

(assert (=> b!173897 m!202199))

(assert (=> d!52513 d!52819))

(declare-fun d!52821 () Bool)

(assert (=> d!52821 (= (getValueByKey!183 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!85966 () Unit!5291)

(assert (=> d!52821 (= lt!85966 (choose!936 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114841 () Bool)

(assert (=> d!52821 e!114841))

(declare-fun res!82494 () Bool)

(assert (=> d!52821 (=> (not res!82494) (not e!114841))))

(assert (=> d!52821 (= res!82494 (isStrictlySorted!327 lt!85763))))

(assert (=> d!52821 (= (lemmaContainsTupThenGetReturnValue!99 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85966)))

(declare-fun b!173899 () Bool)

(declare-fun res!82495 () Bool)

(assert (=> b!173899 (=> (not res!82495) (not e!114841))))

(assert (=> b!173899 (= res!82495 (containsKey!187 lt!85763 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173900 () Bool)

(assert (=> b!173900 (= e!114841 (contains!1155 lt!85763 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52821 res!82494) b!173899))

(assert (= (and b!173899 res!82495) b!173900))

(assert (=> d!52821 m!201473))

(declare-fun m!202201 () Bool)

(assert (=> d!52821 m!202201))

(declare-fun m!202203 () Bool)

(assert (=> d!52821 m!202203))

(declare-fun m!202205 () Bool)

(assert (=> b!173899 m!202205))

(declare-fun m!202207 () Bool)

(assert (=> b!173900 m!202207))

(assert (=> d!52513 d!52821))

(declare-fun b!173901 () Bool)

(declare-fun e!114844 () List!2214)

(declare-fun call!17616 () List!2214)

(assert (=> b!173901 (= e!114844 call!17616)))

(declare-fun b!173902 () Bool)

(declare-fun res!82497 () Bool)

(declare-fun e!114842 () Bool)

(assert (=> b!173902 (=> (not res!82497) (not e!114842))))

(declare-fun lt!85967 () List!2214)

(assert (=> b!173902 (= res!82497 (containsKey!187 lt!85967 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114846 () List!2214)

(declare-fun b!173903 () Bool)

(assert (=> b!173903 (= e!114846 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85656)) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173904 () Bool)

(assert (=> b!173904 (= e!114842 (contains!1155 lt!85967 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31082 () Bool)

(declare-fun c!31083 () Bool)

(declare-fun b!173905 () Bool)

(assert (=> b!173905 (= e!114846 (ite c!31083 (t!7012 (toList!1093 lt!85656)) (ite c!31082 (Cons!2210 (h!2827 (toList!1093 lt!85656)) (t!7012 (toList!1093 lt!85656))) Nil!2211)))))

(declare-fun c!31084 () Bool)

(declare-fun call!17615 () List!2214)

(declare-fun bm!17612 () Bool)

(assert (=> bm!17612 (= call!17615 ($colon$colon!97 e!114846 (ite c!31084 (h!2827 (toList!1093 lt!85656)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31081 () Bool)

(assert (=> bm!17612 (= c!31081 c!31084)))

(declare-fun b!173906 () Bool)

(assert (=> b!173906 (= c!31082 (and ((_ is Cons!2210) (toList!1093 lt!85656)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85656))) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(declare-fun e!114845 () List!2214)

(assert (=> b!173906 (= e!114845 e!114844)))

(declare-fun b!173907 () Bool)

(declare-fun e!114843 () List!2214)

(assert (=> b!173907 (= e!114843 call!17615)))

(declare-fun d!52823 () Bool)

(assert (=> d!52823 e!114842))

(declare-fun res!82496 () Bool)

(assert (=> d!52823 (=> (not res!82496) (not e!114842))))

(assert (=> d!52823 (= res!82496 (isStrictlySorted!327 lt!85967))))

(assert (=> d!52823 (= lt!85967 e!114843)))

(assert (=> d!52823 (= c!31084 (and ((_ is Cons!2210) (toList!1093 lt!85656)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85656))) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52823 (isStrictlySorted!327 (toList!1093 lt!85656))))

(assert (=> d!52823 (= (insertStrictlySorted!102 (toList!1093 lt!85656) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85967)))

(declare-fun bm!17613 () Bool)

(declare-fun call!17617 () List!2214)

(assert (=> bm!17613 (= call!17616 call!17617)))

(declare-fun b!173908 () Bool)

(assert (=> b!173908 (= e!114844 call!17616)))

(declare-fun bm!17614 () Bool)

(assert (=> bm!17614 (= call!17617 call!17615)))

(declare-fun b!173909 () Bool)

(assert (=> b!173909 (= e!114843 e!114845)))

(assert (=> b!173909 (= c!31083 (and ((_ is Cons!2210) (toList!1093 lt!85656)) (= (_1!1629 (h!2827 (toList!1093 lt!85656))) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173910 () Bool)

(assert (=> b!173910 (= e!114845 call!17617)))

(assert (= (and d!52823 c!31084) b!173907))

(assert (= (and d!52823 (not c!31084)) b!173909))

(assert (= (and b!173909 c!31083) b!173910))

(assert (= (and b!173909 (not c!31083)) b!173906))

(assert (= (and b!173906 c!31082) b!173901))

(assert (= (and b!173906 (not c!31082)) b!173908))

(assert (= (or b!173901 b!173908) bm!17613))

(assert (= (or b!173910 bm!17613) bm!17614))

(assert (= (or b!173907 bm!17614) bm!17612))

(assert (= (and bm!17612 c!31081) b!173903))

(assert (= (and bm!17612 (not c!31081)) b!173905))

(assert (= (and d!52823 res!82496) b!173902))

(assert (= (and b!173902 res!82497) b!173904))

(declare-fun m!202209 () Bool)

(assert (=> d!52823 m!202209))

(declare-fun m!202211 () Bool)

(assert (=> d!52823 m!202211))

(declare-fun m!202213 () Bool)

(assert (=> b!173904 m!202213))

(declare-fun m!202215 () Bool)

(assert (=> b!173903 m!202215))

(declare-fun m!202217 () Bool)

(assert (=> bm!17612 m!202217))

(declare-fun m!202219 () Bool)

(assert (=> b!173902 m!202219))

(assert (=> d!52513 d!52823))

(declare-fun b!173912 () Bool)

(declare-fun e!114847 () Option!189)

(declare-fun e!114848 () Option!189)

(assert (=> b!173912 (= e!114847 e!114848)))

(declare-fun c!31086 () Bool)

(assert (=> b!173912 (= c!31086 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85537))) (not (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537)))) key!828))))))

(declare-fun b!173913 () Bool)

(assert (=> b!173913 (= e!114848 (getValueByKey!183 (t!7012 (t!7012 (toList!1093 lt!85537))) key!828))))

(declare-fun b!173911 () Bool)

(assert (=> b!173911 (= e!114847 (Some!188 (_2!1629 (h!2827 (t!7012 (toList!1093 lt!85537))))))))

(declare-fun d!52825 () Bool)

(declare-fun c!31085 () Bool)

(assert (=> d!52825 (= c!31085 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85537))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537)))) key!828)))))

(assert (=> d!52825 (= (getValueByKey!183 (t!7012 (toList!1093 lt!85537)) key!828) e!114847)))

(declare-fun b!173914 () Bool)

(assert (=> b!173914 (= e!114848 None!187)))

(assert (= (and d!52825 c!31085) b!173911))

(assert (= (and d!52825 (not c!31085)) b!173912))

(assert (= (and b!173912 c!31086) b!173913))

(assert (= (and b!173912 (not c!31086)) b!173914))

(declare-fun m!202221 () Bool)

(assert (=> b!173913 m!202221))

(assert (=> b!173554 d!52825))

(declare-fun d!52827 () Bool)

(declare-fun res!82498 () Bool)

(declare-fun e!114849 () Bool)

(assert (=> d!52827 (=> res!82498 e!114849)))

(assert (=> d!52827 (= res!82498 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) lt!85667)))))

(assert (=> d!52827 (= (containsKey!187 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!85667) e!114849)))

(declare-fun b!173915 () Bool)

(declare-fun e!114850 () Bool)

(assert (=> b!173915 (= e!114849 e!114850)))

(declare-fun res!82499 () Bool)

(assert (=> b!173915 (=> (not res!82499) (not e!114850))))

(assert (=> b!173915 (= res!82499 (and (or (not ((_ is Cons!2210) (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) (bvsle (_1!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) lt!85667)) ((_ is Cons!2210) (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) (bvslt (_1!1629 (h!2827 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))) lt!85667)))))

(declare-fun b!173916 () Bool)

(assert (=> b!173916 (= e!114850 (containsKey!187 (t!7012 (toList!1093 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))) lt!85667))))

(assert (= (and d!52827 (not res!82498)) b!173915))

(assert (= (and b!173915 res!82499) b!173916))

(declare-fun m!202223 () Bool)

(assert (=> b!173916 m!202223))

(assert (=> d!52511 d!52827))

(assert (=> b!173551 d!52695))

(assert (=> b!173505 d!52649))

(declare-fun d!52829 () Bool)

(assert (=> d!52829 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7165 () Bool)

(assert (= bs!7165 d!52829))

(assert (=> bs!7165 m!201687))

(declare-fun m!202225 () Bool)

(assert (=> bs!7165 m!202225))

(assert (=> b!173543 d!52829))

(declare-fun b!173918 () Bool)

(declare-fun e!114851 () Option!189)

(declare-fun e!114852 () Option!189)

(assert (=> b!173918 (= e!114851 e!114852)))

(declare-fun c!31088 () Bool)

(assert (=> b!173918 (= c!31088 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85637))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!173919 () Bool)

(assert (=> b!173919 (= e!114852 (getValueByKey!183 (t!7012 (toList!1093 lt!85637)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173917 () Bool)

(assert (=> b!173917 (= e!114851 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85637)))))))

(declare-fun d!52831 () Bool)

(declare-fun c!31087 () Bool)

(assert (=> d!52831 (= c!31087 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52831 (= (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) e!114851)))

(declare-fun b!173920 () Bool)

(assert (=> b!173920 (= e!114852 None!187)))

(assert (= (and d!52831 c!31087) b!173917))

(assert (= (and d!52831 (not c!31087)) b!173918))

(assert (= (and b!173918 c!31088) b!173919))

(assert (= (and b!173918 (not c!31088)) b!173920))

(assert (=> b!173919 m!201133))

(declare-fun m!202227 () Bool)

(assert (=> b!173919 m!202227))

(assert (=> b!173543 d!52831))

(declare-fun b!173921 () Bool)

(declare-fun e!114853 () (_ BitVec 32))

(assert (=> b!173921 (= e!114853 #b00000000000000000000000000000000)))

(declare-fun b!173922 () Bool)

(declare-fun e!114854 () (_ BitVec 32))

(assert (=> b!173922 (= e!114853 e!114854)))

(declare-fun c!31089 () Bool)

(assert (=> b!173922 (= c!31089 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173923 () Bool)

(declare-fun call!17618 () (_ BitVec 32))

(assert (=> b!173923 (= e!114854 call!17618)))

(declare-fun bm!17615 () Bool)

(assert (=> bm!17615 (= call!17618 (arrayCountValidKeys!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun d!52833 () Bool)

(declare-fun lt!85968 () (_ BitVec 32))

(assert (=> d!52833 (and (bvsge lt!85968 #b00000000000000000000000000000000) (bvsle lt!85968 (bvsub (size!3754 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52833 (= lt!85968 e!114853)))

(declare-fun c!31090 () Bool)

(assert (=> d!52833 (= c!31090 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52833 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3754 (_keys!5437 thiss!1248)) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52833 (= (arrayCountValidKeys!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))) lt!85968)))

(declare-fun b!173924 () Bool)

(assert (=> b!173924 (= e!114854 (bvadd #b00000000000000000000000000000001 call!17618))))

(assert (= (and d!52833 c!31090) b!173921))

(assert (= (and d!52833 (not c!31090)) b!173922))

(assert (= (and b!173922 c!31089) b!173924))

(assert (= (and b!173922 (not c!31089)) b!173923))

(assert (= (or b!173924 b!173923) bm!17615))

(assert (=> b!173922 m!201853))

(assert (=> b!173922 m!201853))

(assert (=> b!173922 m!201857))

(declare-fun m!202229 () Bool)

(assert (=> bm!17615 m!202229))

(assert (=> bm!17592 d!52833))

(declare-fun b!173925 () Bool)

(declare-fun e!114855 () Bool)

(declare-fun e!114856 () Bool)

(assert (=> b!173925 (= e!114855 e!114856)))

(declare-fun c!31091 () Bool)

(assert (=> b!173925 (= c!31091 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52835 () Bool)

(declare-fun res!82501 () Bool)

(assert (=> d!52835 (=> res!82501 e!114855)))

(assert (=> d!52835 (= res!82501 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52835 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)) e!114855)))

(declare-fun b!173926 () Bool)

(declare-fun e!114857 () Bool)

(declare-fun call!17619 () Bool)

(assert (=> b!173926 (= e!114857 call!17619)))

(declare-fun b!173927 () Bool)

(assert (=> b!173927 (= e!114856 e!114857)))

(declare-fun lt!85971 () (_ BitVec 64))

(assert (=> b!173927 (= lt!85971 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85970 () Unit!5291)

(assert (=> b!173927 (= lt!85970 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 thiss!1248) lt!85971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!173927 (arrayContainsKey!0 (_keys!5437 thiss!1248) lt!85971 #b00000000000000000000000000000000)))

(declare-fun lt!85969 () Unit!5291)

(assert (=> b!173927 (= lt!85969 lt!85970)))

(declare-fun res!82500 () Bool)

(assert (=> b!173927 (= res!82500 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)) (Found!553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173927 (=> (not res!82500) (not e!114857))))

(declare-fun b!173928 () Bool)

(assert (=> b!173928 (= e!114856 call!17619)))

(declare-fun bm!17616 () Bool)

(assert (=> bm!17616 (= call!17619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)))))

(assert (= (and d!52835 (not res!82501)) b!173925))

(assert (= (and b!173925 c!31091) b!173927))

(assert (= (and b!173925 (not c!31091)) b!173928))

(assert (= (and b!173927 res!82500) b!173926))

(assert (= (or b!173926 b!173928) bm!17616))

(assert (=> b!173925 m!201853))

(assert (=> b!173925 m!201853))

(assert (=> b!173925 m!201857))

(assert (=> b!173927 m!201853))

(declare-fun m!202231 () Bool)

(assert (=> b!173927 m!202231))

(declare-fun m!202233 () Bool)

(assert (=> b!173927 m!202233))

(assert (=> b!173927 m!201853))

(declare-fun m!202235 () Bool)

(assert (=> b!173927 m!202235))

(declare-fun m!202237 () Bool)

(assert (=> bm!17616 m!202237))

(assert (=> bm!17588 d!52835))

(declare-fun d!52837 () Bool)

(assert (=> d!52837 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85636) lt!85648)) (v!3950 (getValueByKey!183 (toList!1093 lt!85636) lt!85648)))))

(assert (=> d!52571 d!52837))

(declare-fun b!173930 () Bool)

(declare-fun e!114858 () Option!189)

(declare-fun e!114859 () Option!189)

(assert (=> b!173930 (= e!114858 e!114859)))

(declare-fun c!31093 () Bool)

(assert (=> b!173930 (= c!31093 (and ((_ is Cons!2210) (toList!1093 lt!85636)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85636))) lt!85648))))))

(declare-fun b!173931 () Bool)

(assert (=> b!173931 (= e!114859 (getValueByKey!183 (t!7012 (toList!1093 lt!85636)) lt!85648))))

(declare-fun b!173929 () Bool)

(assert (=> b!173929 (= e!114858 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85636)))))))

(declare-fun d!52839 () Bool)

(declare-fun c!31092 () Bool)

(assert (=> d!52839 (= c!31092 (and ((_ is Cons!2210) (toList!1093 lt!85636)) (= (_1!1629 (h!2827 (toList!1093 lt!85636))) lt!85648)))))

(assert (=> d!52839 (= (getValueByKey!183 (toList!1093 lt!85636) lt!85648) e!114858)))

(declare-fun b!173932 () Bool)

(assert (=> b!173932 (= e!114859 None!187)))

(assert (= (and d!52839 c!31092) b!173929))

(assert (= (and d!52839 (not c!31092)) b!173930))

(assert (= (and b!173930 c!31093) b!173931))

(assert (= (and b!173930 (not c!31093)) b!173932))

(declare-fun m!202239 () Bool)

(assert (=> b!173931 m!202239))

(assert (=> d!52571 d!52839))

(assert (=> b!173536 d!52479))

(declare-fun d!52841 () Bool)

(declare-fun res!82502 () Bool)

(declare-fun e!114860 () Bool)

(assert (=> d!52841 (=> res!82502 e!114860)))

(assert (=> d!52841 (= res!82502 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) lt!85641)))))

(assert (=> d!52841 (= (containsKey!187 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))) lt!85641) e!114860)))

(declare-fun b!173933 () Bool)

(declare-fun e!114861 () Bool)

(assert (=> b!173933 (= e!114860 e!114861)))

(declare-fun res!82503 () Bool)

(assert (=> b!173933 (=> (not res!82503) (not e!114861))))

(assert (=> b!173933 (= res!82503 (and (or (not ((_ is Cons!2210) (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) (bvsle (_1!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) lt!85641)) ((_ is Cons!2210) (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) (bvslt (_1!1629 (h!2827 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248)))))) lt!85641)))))

(declare-fun b!173934 () Bool)

(assert (=> b!173934 (= e!114861 (containsKey!187 (t!7012 (toList!1093 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))))) lt!85641))))

(assert (= (and d!52841 (not res!82502)) b!173933))

(assert (= (and b!173933 res!82503) b!173934))

(declare-fun m!202241 () Bool)

(assert (=> b!173934 m!202241))

(assert (=> d!52569 d!52841))

(declare-fun d!52843 () Bool)

(assert (=> d!52843 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85972 () Unit!5291)

(assert (=> d!52843 (= lt!85972 (choose!939 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114862 () Bool)

(assert (=> d!52843 e!114862))

(declare-fun res!82504 () Bool)

(assert (=> d!52843 (=> (not res!82504) (not e!114862))))

(assert (=> d!52843 (= res!82504 (isStrictlySorted!327 (toList!1093 lt!85637)))))

(assert (=> d!52843 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85972)))

(declare-fun b!173935 () Bool)

(assert (=> b!173935 (= e!114862 (containsKey!187 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52843 res!82504) b!173935))

(assert (=> d!52843 m!201261))

(assert (=> d!52843 m!201261))

(assert (=> d!52843 m!201723))

(declare-fun m!202243 () Bool)

(assert (=> d!52843 m!202243))

(declare-fun m!202245 () Bool)

(assert (=> d!52843 m!202245))

(assert (=> b!173935 m!201719))

(assert (=> b!173544 d!52843))

(declare-fun d!52845 () Bool)

(assert (=> d!52845 (= (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7166 () Bool)

(assert (= bs!7166 d!52845))

(assert (=> bs!7166 m!201261))

(declare-fun m!202247 () Bool)

(assert (=> bs!7166 m!202247))

(assert (=> b!173544 d!52845))

(declare-fun b!173937 () Bool)

(declare-fun e!114863 () Option!189)

(declare-fun e!114864 () Option!189)

(assert (=> b!173937 (= e!114863 e!114864)))

(declare-fun c!31095 () Bool)

(assert (=> b!173937 (= c!31095 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173938 () Bool)

(assert (=> b!173938 (= e!114864 (getValueByKey!183 (t!7012 (toList!1093 lt!85637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173936 () Bool)

(assert (=> b!173936 (= e!114863 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85637)))))))

(declare-fun d!52847 () Bool)

(declare-fun c!31094 () Bool)

(assert (=> d!52847 (= c!31094 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52847 (= (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000) e!114863)))

(declare-fun b!173939 () Bool)

(assert (=> b!173939 (= e!114864 None!187)))

(assert (= (and d!52847 c!31094) b!173936))

(assert (= (and d!52847 (not c!31094)) b!173937))

(assert (= (and b!173937 c!31095) b!173938))

(assert (= (and b!173937 (not c!31095)) b!173939))

(declare-fun m!202249 () Bool)

(assert (=> b!173938 m!202249))

(assert (=> b!173544 d!52847))

(assert (=> b!173501 d!52479))

(declare-fun d!52849 () Bool)

(declare-fun e!114866 () Bool)

(assert (=> d!52849 e!114866))

(declare-fun res!82505 () Bool)

(assert (=> d!52849 (=> res!82505 e!114866)))

(declare-fun lt!85974 () Bool)

(assert (=> d!52849 (= res!82505 (not lt!85974))))

(declare-fun lt!85973 () Bool)

(assert (=> d!52849 (= lt!85974 lt!85973)))

(declare-fun lt!85976 () Unit!5291)

(declare-fun e!114865 () Unit!5291)

(assert (=> d!52849 (= lt!85976 e!114865)))

(declare-fun c!31096 () Bool)

(assert (=> d!52849 (= c!31096 lt!85973)))

(assert (=> d!52849 (= lt!85973 (containsKey!187 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(assert (=> d!52849 (= (contains!1152 lt!85749 (_1!1629 (tuple2!3237 lt!85668 v!309))) lt!85974)))

(declare-fun b!173940 () Bool)

(declare-fun lt!85975 () Unit!5291)

(assert (=> b!173940 (= e!114865 lt!85975)))

(assert (=> b!173940 (= lt!85975 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(assert (=> b!173940 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173941 () Bool)

(declare-fun Unit!5317 () Unit!5291)

(assert (=> b!173941 (= e!114865 Unit!5317)))

(declare-fun b!173942 () Bool)

(assert (=> b!173942 (= e!114866 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85749) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(assert (= (and d!52849 c!31096) b!173940))

(assert (= (and d!52849 (not c!31096)) b!173941))

(assert (= (and d!52849 (not res!82505)) b!173942))

(declare-fun m!202251 () Bool)

(assert (=> d!52849 m!202251))

(declare-fun m!202253 () Bool)

(assert (=> b!173940 m!202253))

(assert (=> b!173940 m!201447))

(assert (=> b!173940 m!201447))

(declare-fun m!202255 () Bool)

(assert (=> b!173940 m!202255))

(assert (=> b!173942 m!201447))

(assert (=> b!173942 m!201447))

(assert (=> b!173942 m!202255))

(assert (=> d!52507 d!52849))

(declare-fun b!173944 () Bool)

(declare-fun e!114867 () Option!189)

(declare-fun e!114868 () Option!189)

(assert (=> b!173944 (= e!114867 e!114868)))

(declare-fun c!31098 () Bool)

(assert (=> b!173944 (= c!31098 (and ((_ is Cons!2210) lt!85751) (not (= (_1!1629 (h!2827 lt!85751)) (_1!1629 (tuple2!3237 lt!85668 v!309))))))))

(declare-fun b!173945 () Bool)

(assert (=> b!173945 (= e!114868 (getValueByKey!183 (t!7012 lt!85751) (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173943 () Bool)

(assert (=> b!173943 (= e!114867 (Some!188 (_2!1629 (h!2827 lt!85751))))))

(declare-fun c!31097 () Bool)

(declare-fun d!52851 () Bool)

(assert (=> d!52851 (= c!31097 (and ((_ is Cons!2210) lt!85751) (= (_1!1629 (h!2827 lt!85751)) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(assert (=> d!52851 (= (getValueByKey!183 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309))) e!114867)))

(declare-fun b!173946 () Bool)

(assert (=> b!173946 (= e!114868 None!187)))

(assert (= (and d!52851 c!31097) b!173943))

(assert (= (and d!52851 (not c!31097)) b!173944))

(assert (= (and b!173944 c!31098) b!173945))

(assert (= (and b!173944 (not c!31098)) b!173946))

(declare-fun m!202257 () Bool)

(assert (=> b!173945 m!202257))

(assert (=> d!52507 d!52851))

(declare-fun d!52853 () Bool)

(assert (=> d!52853 (= (getValueByKey!183 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun lt!85977 () Unit!5291)

(assert (=> d!52853 (= lt!85977 (choose!936 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun e!114869 () Bool)

(assert (=> d!52853 e!114869))

(declare-fun res!82506 () Bool)

(assert (=> d!52853 (=> (not res!82506) (not e!114869))))

(assert (=> d!52853 (= res!82506 (isStrictlySorted!327 lt!85751))))

(assert (=> d!52853 (= (lemmaContainsTupThenGetReturnValue!99 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))) lt!85977)))

(declare-fun b!173947 () Bool)

(declare-fun res!82507 () Bool)

(assert (=> b!173947 (=> (not res!82507) (not e!114869))))

(assert (=> b!173947 (= res!82507 (containsKey!187 lt!85751 (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173948 () Bool)

(assert (=> b!173948 (= e!114869 (contains!1155 lt!85751 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309)))))))

(assert (= (and d!52853 res!82506) b!173947))

(assert (= (and b!173947 res!82507) b!173948))

(assert (=> d!52853 m!201441))

(declare-fun m!202259 () Bool)

(assert (=> d!52853 m!202259))

(declare-fun m!202261 () Bool)

(assert (=> d!52853 m!202261))

(declare-fun m!202263 () Bool)

(assert (=> b!173947 m!202263))

(declare-fun m!202265 () Bool)

(assert (=> b!173948 m!202265))

(assert (=> d!52507 d!52853))

(declare-fun b!173949 () Bool)

(declare-fun e!114872 () List!2214)

(declare-fun call!17621 () List!2214)

(assert (=> b!173949 (= e!114872 call!17621)))

(declare-fun b!173950 () Bool)

(declare-fun res!82509 () Bool)

(declare-fun e!114870 () Bool)

(assert (=> b!173950 (=> (not res!82509) (not e!114870))))

(declare-fun lt!85978 () List!2214)

(assert (=> b!173950 (= res!82509 (containsKey!187 lt!85978 (_1!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173951 () Bool)

(declare-fun e!114874 () List!2214)

(assert (=> b!173951 (= e!114874 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85662)) (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))))))

(declare-fun b!173952 () Bool)

(assert (=> b!173952 (= e!114870 (contains!1155 lt!85978 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309)))))))

(declare-fun c!31100 () Bool)

(declare-fun b!173953 () Bool)

(declare-fun c!31101 () Bool)

(assert (=> b!173953 (= e!114874 (ite c!31101 (t!7012 (toList!1093 lt!85662)) (ite c!31100 (Cons!2210 (h!2827 (toList!1093 lt!85662)) (t!7012 (toList!1093 lt!85662))) Nil!2211)))))

(declare-fun bm!17617 () Bool)

(declare-fun call!17620 () List!2214)

(declare-fun c!31102 () Bool)

(assert (=> bm!17617 (= call!17620 ($colon$colon!97 e!114874 (ite c!31102 (h!2827 (toList!1093 lt!85662)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))))))))

(declare-fun c!31099 () Bool)

(assert (=> bm!17617 (= c!31099 c!31102)))

(declare-fun b!173954 () Bool)

(assert (=> b!173954 (= c!31100 (and ((_ is Cons!2210) (toList!1093 lt!85662)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85662))) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(declare-fun e!114873 () List!2214)

(assert (=> b!173954 (= e!114873 e!114872)))

(declare-fun b!173955 () Bool)

(declare-fun e!114871 () List!2214)

(assert (=> b!173955 (= e!114871 call!17620)))

(declare-fun d!52855 () Bool)

(assert (=> d!52855 e!114870))

(declare-fun res!82508 () Bool)

(assert (=> d!52855 (=> (not res!82508) (not e!114870))))

(assert (=> d!52855 (= res!82508 (isStrictlySorted!327 lt!85978))))

(assert (=> d!52855 (= lt!85978 e!114871)))

(assert (=> d!52855 (= c!31102 (and ((_ is Cons!2210) (toList!1093 lt!85662)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85662))) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(assert (=> d!52855 (isStrictlySorted!327 (toList!1093 lt!85662))))

(assert (=> d!52855 (= (insertStrictlySorted!102 (toList!1093 lt!85662) (_1!1629 (tuple2!3237 lt!85668 v!309)) (_2!1629 (tuple2!3237 lt!85668 v!309))) lt!85978)))

(declare-fun bm!17618 () Bool)

(declare-fun call!17622 () List!2214)

(assert (=> bm!17618 (= call!17621 call!17622)))

(declare-fun b!173956 () Bool)

(assert (=> b!173956 (= e!114872 call!17621)))

(declare-fun bm!17619 () Bool)

(assert (=> bm!17619 (= call!17622 call!17620)))

(declare-fun b!173957 () Bool)

(assert (=> b!173957 (= e!114871 e!114873)))

(assert (=> b!173957 (= c!31101 (and ((_ is Cons!2210) (toList!1093 lt!85662)) (= (_1!1629 (h!2827 (toList!1093 lt!85662))) (_1!1629 (tuple2!3237 lt!85668 v!309)))))))

(declare-fun b!173958 () Bool)

(assert (=> b!173958 (= e!114873 call!17622)))

(assert (= (and d!52855 c!31102) b!173955))

(assert (= (and d!52855 (not c!31102)) b!173957))

(assert (= (and b!173957 c!31101) b!173958))

(assert (= (and b!173957 (not c!31101)) b!173954))

(assert (= (and b!173954 c!31100) b!173949))

(assert (= (and b!173954 (not c!31100)) b!173956))

(assert (= (or b!173949 b!173956) bm!17618))

(assert (= (or b!173958 bm!17618) bm!17619))

(assert (= (or b!173955 bm!17619) bm!17617))

(assert (= (and bm!17617 c!31099) b!173951))

(assert (= (and bm!17617 (not c!31099)) b!173953))

(assert (= (and d!52855 res!82508) b!173950))

(assert (= (and b!173950 res!82509) b!173952))

(declare-fun m!202267 () Bool)

(assert (=> d!52855 m!202267))

(declare-fun m!202269 () Bool)

(assert (=> d!52855 m!202269))

(declare-fun m!202271 () Bool)

(assert (=> b!173952 m!202271))

(declare-fun m!202273 () Bool)

(assert (=> b!173951 m!202273))

(declare-fun m!202275 () Bool)

(assert (=> bm!17617 m!202275))

(declare-fun m!202277 () Bool)

(assert (=> b!173950 m!202277))

(assert (=> d!52507 d!52855))

(assert (=> b!173537 d!52479))

(assert (=> b!173533 d!52479))

(declare-fun d!52857 () Bool)

(assert (=> d!52857 (= (size!3760 lt!85539) (bvadd (_size!1200 lt!85539) (bvsdiv (bvadd (extraKeys!3336 lt!85539) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173318 d!52857))

(declare-fun b!173960 () Bool)

(declare-fun e!114875 () Option!189)

(declare-fun e!114876 () Option!189)

(assert (=> b!173960 (= e!114875 e!114876)))

(declare-fun c!31104 () Bool)

(assert (=> b!173960 (= c!31104 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85652))) (not (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85652)))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173961 () Bool)

(assert (=> b!173961 (= e!114876 (getValueByKey!183 (t!7012 (t!7012 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173959 () Bool)

(assert (=> b!173959 (= e!114875 (Some!188 (_2!1629 (h!2827 (t!7012 (toList!1093 lt!85652))))))))

(declare-fun d!52859 () Bool)

(declare-fun c!31103 () Bool)

(assert (=> d!52859 (= c!31103 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85652))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85652)))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52859 (= (getValueByKey!183 (t!7012 (toList!1093 lt!85652)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114875)))

(declare-fun b!173962 () Bool)

(assert (=> b!173962 (= e!114876 None!187)))

(assert (= (and d!52859 c!31103) b!173959))

(assert (= (and d!52859 (not c!31103)) b!173960))

(assert (= (and b!173960 c!31104) b!173961))

(assert (= (and b!173960 (not c!31104)) b!173962))

(declare-fun m!202279 () Bool)

(assert (=> b!173961 m!202279))

(assert (=> b!173566 d!52859))

(declare-fun d!52861 () Bool)

(assert (=> d!52861 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85979 () Unit!5291)

(assert (=> d!52861 (= lt!85979 (choose!939 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114877 () Bool)

(assert (=> d!52861 e!114877))

(declare-fun res!82510 () Bool)

(assert (=> d!52861 (=> (not res!82510) (not e!114877))))

(assert (=> d!52861 (= res!82510 (isStrictlySorted!327 (toList!1093 lt!85663)))))

(assert (=> d!52861 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85979)))

(declare-fun b!173963 () Bool)

(assert (=> b!173963 (= e!114877 (containsKey!187 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52861 res!82510) b!173963))

(assert (=> d!52861 m!201423))

(assert (=> d!52861 m!201423))

(assert (=> d!52861 m!201569))

(declare-fun m!202281 () Bool)

(assert (=> d!52861 m!202281))

(declare-fun m!202283 () Bool)

(assert (=> d!52861 m!202283))

(assert (=> b!173963 m!201565))

(assert (=> b!173481 d!52861))

(assert (=> b!173481 d!52715))

(assert (=> b!173481 d!52717))

(declare-fun d!52863 () Bool)

(declare-fun lt!85982 () Bool)

(declare-fun content!150 (List!2217) (InoxSet (_ BitVec 64)))

(assert (=> d!52863 (= lt!85982 (select (content!150 Nil!2214) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun e!114882 () Bool)

(assert (=> d!52863 (= lt!85982 e!114882)))

(declare-fun res!82516 () Bool)

(assert (=> d!52863 (=> (not res!82516) (not e!114882))))

(assert (=> d!52863 (= res!82516 ((_ is Cons!2213) Nil!2214))))

(assert (=> d!52863 (= (contains!1156 Nil!2214 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) lt!85982)))

(declare-fun b!173968 () Bool)

(declare-fun e!114883 () Bool)

(assert (=> b!173968 (= e!114882 e!114883)))

(declare-fun res!82515 () Bool)

(assert (=> b!173968 (=> res!82515 e!114883)))

(assert (=> b!173968 (= res!82515 (= (h!2830 Nil!2214) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!173969 () Bool)

(assert (=> b!173969 (= e!114883 (contains!1156 (t!7017 Nil!2214) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (= (and d!52863 res!82516) b!173968))

(assert (= (and b!173968 (not res!82515)) b!173969))

(declare-fun m!202285 () Bool)

(assert (=> d!52863 m!202285))

(assert (=> d!52863 m!201317))

(declare-fun m!202287 () Bool)

(assert (=> d!52863 m!202287))

(assert (=> b!173969 m!201317))

(declare-fun m!202289 () Bool)

(assert (=> b!173969 m!202289))

(assert (=> b!173547 d!52863))

(assert (=> b!173354 d!52677))

(declare-fun d!52865 () Bool)

(assert (=> d!52865 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85983 () Unit!5291)

(assert (=> d!52865 (= lt!85983 (choose!939 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114884 () Bool)

(assert (=> d!52865 e!114884))

(declare-fun res!82517 () Bool)

(assert (=> d!52865 (=> (not res!82517) (not e!114884))))

(assert (=> d!52865 (= res!82517 (isStrictlySorted!327 (toList!1093 lt!85637)))))

(assert (=> d!52865 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85983)))

(declare-fun b!173970 () Bool)

(assert (=> b!173970 (= e!114884 (containsKey!187 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52865 res!82517) b!173970))

(assert (=> d!52865 m!201257))

(assert (=> d!52865 m!201257))

(assert (=> d!52865 m!201259))

(declare-fun m!202291 () Bool)

(assert (=> d!52865 m!202291))

(assert (=> d!52865 m!202245))

(assert (=> b!173970 m!201253))

(assert (=> b!173297 d!52865))

(assert (=> b!173297 d!52723))

(assert (=> b!173297 d!52725))

(assert (=> b!173500 d!52479))

(assert (=> b!173350 d!52479))

(declare-fun d!52867 () Bool)

(declare-fun e!114886 () Bool)

(assert (=> d!52867 e!114886))

(declare-fun res!82518 () Bool)

(assert (=> d!52867 (=> res!82518 e!114886)))

(declare-fun lt!85985 () Bool)

(assert (=> d!52867 (= res!82518 (not lt!85985))))

(declare-fun lt!85984 () Bool)

(assert (=> d!52867 (= lt!85985 lt!85984)))

(declare-fun lt!85987 () Unit!5291)

(declare-fun e!114885 () Unit!5291)

(assert (=> d!52867 (= lt!85987 e!114885)))

(declare-fun c!31105 () Bool)

(assert (=> d!52867 (= c!31105 lt!85984)))

(assert (=> d!52867 (= lt!85984 (containsKey!187 (toList!1093 lt!85816) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52867 (= (contains!1152 lt!85816 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!85985)))

(declare-fun b!173971 () Bool)

(declare-fun lt!85986 () Unit!5291)

(assert (=> b!173971 (= e!114885 lt!85986)))

(assert (=> b!173971 (= lt!85986 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85816) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173971 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173972 () Bool)

(declare-fun Unit!5318 () Unit!5291)

(assert (=> b!173972 (= e!114885 Unit!5318)))

(declare-fun b!173973 () Bool)

(assert (=> b!173973 (= e!114886 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52867 c!31105) b!173971))

(assert (= (and d!52867 (not c!31105)) b!173972))

(assert (= (and d!52867 (not res!82518)) b!173973))

(assert (=> d!52867 m!201133))

(declare-fun m!202293 () Bool)

(assert (=> d!52867 m!202293))

(assert (=> b!173971 m!201133))

(declare-fun m!202295 () Bool)

(assert (=> b!173971 m!202295))

(assert (=> b!173971 m!201133))

(declare-fun m!202297 () Bool)

(assert (=> b!173971 m!202297))

(assert (=> b!173971 m!202297))

(declare-fun m!202299 () Bool)

(assert (=> b!173971 m!202299))

(assert (=> b!173973 m!201133))

(assert (=> b!173973 m!202297))

(assert (=> b!173973 m!202297))

(assert (=> b!173973 m!202299))

(assert (=> b!173496 d!52867))

(declare-fun d!52869 () Bool)

(declare-fun lt!85988 () Bool)

(assert (=> d!52869 (= lt!85988 (select (content!149 (toList!1093 lt!85851)) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114888 () Bool)

(assert (=> d!52869 (= lt!85988 e!114888)))

(declare-fun res!82519 () Bool)

(assert (=> d!52869 (=> (not res!82519) (not e!114888))))

(assert (=> d!52869 (= res!82519 ((_ is Cons!2210) (toList!1093 lt!85851)))))

(assert (=> d!52869 (= (contains!1155 (toList!1093 lt!85851) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85988)))

(declare-fun b!173974 () Bool)

(declare-fun e!114887 () Bool)

(assert (=> b!173974 (= e!114888 e!114887)))

(declare-fun res!82520 () Bool)

(assert (=> b!173974 (=> res!82520 e!114887)))

(assert (=> b!173974 (= res!82520 (= (h!2827 (toList!1093 lt!85851)) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173975 () Bool)

(assert (=> b!173975 (= e!114887 (contains!1155 (t!7012 (toList!1093 lt!85851)) (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52869 res!82519) b!173974))

(assert (= (and b!173974 (not res!82520)) b!173975))

(declare-fun m!202301 () Bool)

(assert (=> d!52869 m!202301))

(declare-fun m!202303 () Bool)

(assert (=> d!52869 m!202303))

(declare-fun m!202305 () Bool)

(assert (=> b!173975 m!202305))

(assert (=> b!173580 d!52869))

(assert (=> b!173368 d!52695))

(declare-fun d!52871 () Bool)

(assert (=> d!52871 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85989 () Unit!5291)

(assert (=> d!52871 (= lt!85989 (choose!939 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114889 () Bool)

(assert (=> d!52871 e!114889))

(declare-fun res!82521 () Bool)

(assert (=> d!52871 (=> (not res!82521) (not e!114889))))

(assert (=> d!52871 (= res!82521 (isStrictlySorted!327 (toList!1093 lt!85652)))))

(assert (=> d!52871 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85989)))

(declare-fun b!173976 () Bool)

(assert (=> b!173976 (= e!114889 (containsKey!187 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52871 res!82521) b!173976))

(assert (=> d!52871 m!201199))

(assert (=> d!52871 m!201199))

(assert (=> d!52871 m!201399))

(declare-fun m!202307 () Bool)

(assert (=> d!52871 m!202307))

(declare-fun m!202309 () Bool)

(assert (=> d!52871 m!202309))

(assert (=> b!173976 m!201395))

(assert (=> b!173428 d!52871))

(assert (=> b!173428 d!52625))

(assert (=> b!173428 d!52605))

(declare-fun b!173978 () Bool)

(declare-fun e!114890 () Option!189)

(declare-fun e!114891 () Option!189)

(assert (=> b!173978 (= e!114890 e!114891)))

(declare-fun c!31107 () Bool)

(assert (=> b!173978 (= c!31107 (and ((_ is Cons!2210) (t!7012 lt!85654)) (not (= (_1!1629 (h!2827 (t!7012 lt!85654))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173979 () Bool)

(assert (=> b!173979 (= e!114891 (getValueByKey!183 (t!7012 (t!7012 lt!85654)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173977 () Bool)

(assert (=> b!173977 (= e!114890 (Some!188 (_2!1629 (h!2827 (t!7012 lt!85654)))))))

(declare-fun d!52873 () Bool)

(declare-fun c!31106 () Bool)

(assert (=> d!52873 (= c!31106 (and ((_ is Cons!2210) (t!7012 lt!85654)) (= (_1!1629 (h!2827 (t!7012 lt!85654))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52873 (= (getValueByKey!183 (t!7012 lt!85654) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114890)))

(declare-fun b!173980 () Bool)

(assert (=> b!173980 (= e!114891 None!187)))

(assert (= (and d!52873 c!31106) b!173977))

(assert (= (and d!52873 (not c!31106)) b!173978))

(assert (= (and b!173978 c!31107) b!173979))

(assert (= (and b!173978 (not c!31107)) b!173980))

(declare-fun m!202311 () Bool)

(assert (=> b!173979 m!202311))

(assert (=> b!173433 d!52873))

(declare-fun d!52875 () Bool)

(declare-fun res!82522 () Bool)

(declare-fun e!114892 () Bool)

(assert (=> d!52875 (=> res!82522 e!114892)))

(assert (=> d!52875 (= res!82522 (or ((_ is Nil!2211) lt!85743) ((_ is Nil!2211) (t!7012 lt!85743))))))

(assert (=> d!52875 (= (isStrictlySorted!327 lt!85743) e!114892)))

(declare-fun b!173981 () Bool)

(declare-fun e!114893 () Bool)

(assert (=> b!173981 (= e!114892 e!114893)))

(declare-fun res!82523 () Bool)

(assert (=> b!173981 (=> (not res!82523) (not e!114893))))

(assert (=> b!173981 (= res!82523 (bvslt (_1!1629 (h!2827 lt!85743)) (_1!1629 (h!2827 (t!7012 lt!85743)))))))

(declare-fun b!173982 () Bool)

(assert (=> b!173982 (= e!114893 (isStrictlySorted!327 (t!7012 lt!85743)))))

(assert (= (and d!52875 (not res!82522)) b!173981))

(assert (= (and b!173981 res!82523) b!173982))

(declare-fun m!202313 () Bool)

(assert (=> b!173982 m!202313))

(assert (=> d!52501 d!52875))

(declare-fun d!52877 () Bool)

(declare-fun res!82524 () Bool)

(declare-fun e!114894 () Bool)

(assert (=> d!52877 (=> res!82524 e!114894)))

(assert (=> d!52877 (= res!82524 (or ((_ is Nil!2211) (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) ((_ is Nil!2211) (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))))))

(assert (=> d!52877 (= (isStrictlySorted!327 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) e!114894)))

(declare-fun b!173983 () Bool)

(declare-fun e!114895 () Bool)

(assert (=> b!173983 (= e!114894 e!114895)))

(declare-fun res!82525 () Bool)

(assert (=> b!173983 (=> (not res!82525) (not e!114895))))

(assert (=> b!173983 (= res!82525 (bvslt (_1!1629 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1629 (h!2827 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))))))

(declare-fun b!173984 () Bool)

(assert (=> b!173984 (= e!114895 (isStrictlySorted!327 (t!7012 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))))

(assert (= (and d!52877 (not res!82524)) b!173983))

(assert (= (and b!173983 res!82525) b!173984))

(assert (=> b!173984 m!201947))

(assert (=> d!52501 d!52877))

(declare-fun d!52879 () Bool)

(declare-fun c!31108 () Bool)

(assert (=> d!52879 (= c!31108 ((_ is Nil!2211) (toList!1093 lt!85652)))))

(declare-fun e!114896 () (InoxSet tuple2!3236))

(assert (=> d!52879 (= (content!149 (toList!1093 lt!85652)) e!114896)))

(declare-fun b!173985 () Bool)

(assert (=> b!173985 (= e!114896 ((as const (Array tuple2!3236 Bool)) false))))

(declare-fun b!173986 () Bool)

(assert (=> b!173986 (= e!114896 ((_ map or) (store ((as const (Array tuple2!3236 Bool)) false) (h!2827 (toList!1093 lt!85652)) true) (content!149 (t!7012 (toList!1093 lt!85652)))))))

(assert (= (and d!52879 c!31108) b!173985))

(assert (= (and d!52879 (not c!31108)) b!173986))

(declare-fun m!202315 () Bool)

(assert (=> b!173986 m!202315))

(declare-fun m!202317 () Bool)

(assert (=> b!173986 m!202317))

(assert (=> d!52609 d!52879))

(assert (=> d!52551 d!52553))

(declare-fun d!52881 () Bool)

(assert (=> d!52881 (= (apply!130 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))) lt!85647) (apply!130 lt!85630 lt!85647))))

(assert (=> d!52881 true))

(declare-fun _$34!1058 () Unit!5291)

(assert (=> d!52881 (= (choose!937 lt!85630 lt!85631 (zeroValue!3438 thiss!1248) lt!85647) _$34!1058)))

(declare-fun bs!7167 () Bool)

(assert (= bs!7167 d!52881))

(assert (=> bs!7167 m!201155))

(assert (=> bs!7167 m!201155))

(assert (=> bs!7167 m!201157))

(assert (=> bs!7167 m!201143))

(assert (=> d!52551 d!52881))

(declare-fun d!52883 () Bool)

(declare-fun e!114898 () Bool)

(assert (=> d!52883 e!114898))

(declare-fun res!82526 () Bool)

(assert (=> d!52883 (=> res!82526 e!114898)))

(declare-fun lt!85991 () Bool)

(assert (=> d!52883 (= res!82526 (not lt!85991))))

(declare-fun lt!85990 () Bool)

(assert (=> d!52883 (= lt!85991 lt!85990)))

(declare-fun lt!85993 () Unit!5291)

(declare-fun e!114897 () Unit!5291)

(assert (=> d!52883 (= lt!85993 e!114897)))

(declare-fun c!31109 () Bool)

(assert (=> d!52883 (= c!31109 lt!85990)))

(assert (=> d!52883 (= lt!85990 (containsKey!187 (toList!1093 lt!85630) lt!85647))))

(assert (=> d!52883 (= (contains!1152 lt!85630 lt!85647) lt!85991)))

(declare-fun b!173987 () Bool)

(declare-fun lt!85992 () Unit!5291)

(assert (=> b!173987 (= e!114897 lt!85992)))

(assert (=> b!173987 (= lt!85992 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85630) lt!85647))))

(assert (=> b!173987 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85630) lt!85647))))

(declare-fun b!173988 () Bool)

(declare-fun Unit!5319 () Unit!5291)

(assert (=> b!173988 (= e!114897 Unit!5319)))

(declare-fun b!173989 () Bool)

(assert (=> b!173989 (= e!114898 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85630) lt!85647)))))

(assert (= (and d!52883 c!31109) b!173987))

(assert (= (and d!52883 (not c!31109)) b!173988))

(assert (= (and d!52883 (not res!82526)) b!173989))

(declare-fun m!202319 () Bool)

(assert (=> d!52883 m!202319))

(declare-fun m!202321 () Bool)

(assert (=> b!173987 m!202321))

(assert (=> b!173987 m!201671))

(assert (=> b!173987 m!201671))

(declare-fun m!202323 () Bool)

(assert (=> b!173987 m!202323))

(assert (=> b!173989 m!201671))

(assert (=> b!173989 m!201671))

(assert (=> b!173989 m!202323))

(assert (=> d!52551 d!52883))

(assert (=> d!52551 d!52577))

(assert (=> d!52551 d!52565))

(declare-fun d!52885 () Bool)

(assert (=> d!52885 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3950 (getValueByKey!183 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52469 d!52885))

(assert (=> d!52469 d!52847))

(declare-fun b!173991 () Bool)

(declare-fun e!114899 () Option!189)

(declare-fun e!114900 () Option!189)

(assert (=> b!173991 (= e!114899 e!114900)))

(declare-fun c!31111 () Bool)

(assert (=> b!173991 (= c!31111 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85579))) (not (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85579)))) (_1!1629 (tuple2!3237 key!828 v!309))))))))

(declare-fun b!173992 () Bool)

(assert (=> b!173992 (= e!114900 (getValueByKey!183 (t!7012 (t!7012 (toList!1093 lt!85579))) (_1!1629 (tuple2!3237 key!828 v!309))))))

(declare-fun b!173990 () Bool)

(assert (=> b!173990 (= e!114899 (Some!188 (_2!1629 (h!2827 (t!7012 (toList!1093 lt!85579))))))))

(declare-fun d!52887 () Bool)

(declare-fun c!31110 () Bool)

(assert (=> d!52887 (= c!31110 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85579))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85579)))) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52887 (= (getValueByKey!183 (t!7012 (toList!1093 lt!85579)) (_1!1629 (tuple2!3237 key!828 v!309))) e!114899)))

(declare-fun b!173993 () Bool)

(assert (=> b!173993 (= e!114900 None!187)))

(assert (= (and d!52887 c!31110) b!173990))

(assert (= (and d!52887 (not c!31110)) b!173991))

(assert (= (and b!173991 c!31111) b!173992))

(assert (= (and b!173991 (not c!31111)) b!173993))

(declare-fun m!202325 () Bool)

(assert (=> b!173992 m!202325))

(assert (=> b!173558 d!52887))

(declare-fun d!52889 () Bool)

(assert (=> d!52889 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) (v!3950 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52581 d!52889))

(assert (=> d!52581 d!52831))

(declare-fun b!173995 () Bool)

(declare-fun e!114901 () Option!189)

(declare-fun e!114902 () Option!189)

(assert (=> b!173995 (= e!114901 e!114902)))

(declare-fun c!31113 () Bool)

(assert (=> b!173995 (= c!31113 (and ((_ is Cons!2210) (toList!1093 lt!85761)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85761))) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173996 () Bool)

(assert (=> b!173996 (= e!114902 (getValueByKey!183 (t!7012 (toList!1093 lt!85761)) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173994 () Bool)

(assert (=> b!173994 (= e!114901 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85761)))))))

(declare-fun c!31112 () Bool)

(declare-fun d!52891 () Bool)

(assert (=> d!52891 (= c!31112 (and ((_ is Cons!2210) (toList!1093 lt!85761)) (= (_1!1629 (h!2827 (toList!1093 lt!85761))) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52891 (= (getValueByKey!183 (toList!1093 lt!85761) (_1!1629 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) e!114901)))

(declare-fun b!173997 () Bool)

(assert (=> b!173997 (= e!114902 None!187)))

(assert (= (and d!52891 c!31112) b!173994))

(assert (= (and d!52891 (not c!31112)) b!173995))

(assert (= (and b!173995 c!31113) b!173996))

(assert (= (and b!173995 (not c!31113)) b!173997))

(declare-fun m!202327 () Bool)

(assert (=> b!173996 m!202327))

(assert (=> b!173456 d!52891))

(declare-fun d!52893 () Bool)

(assert (=> d!52893 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85994 () Unit!5291)

(assert (=> d!52893 (= lt!85994 (choose!939 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114903 () Bool)

(assert (=> d!52893 e!114903))

(declare-fun res!82527 () Bool)

(assert (=> d!52893 (=> (not res!82527) (not e!114903))))

(assert (=> d!52893 (= res!82527 (isStrictlySorted!327 (toList!1093 lt!85663)))))

(assert (=> d!52893 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!85994)))

(declare-fun b!173998 () Bool)

(assert (=> b!173998 (= e!114903 (containsKey!187 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52893 res!82527) b!173998))

(assert (=> d!52893 m!201133))

(assert (=> d!52893 m!201277))

(assert (=> d!52893 m!201277))

(assert (=> d!52893 m!201559))

(assert (=> d!52893 m!201133))

(declare-fun m!202329 () Bool)

(assert (=> d!52893 m!202329))

(assert (=> d!52893 m!202283))

(assert (=> b!173998 m!201133))

(assert (=> b!173998 m!201555))

(assert (=> b!173472 d!52893))

(assert (=> b!173472 d!52637))

(assert (=> b!173472 d!52639))

(declare-fun d!52895 () Bool)

(declare-fun res!82528 () Bool)

(declare-fun e!114904 () Bool)

(assert (=> d!52895 (=> res!82528 e!114904)))

(assert (=> d!52895 (= res!82528 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52895 (= (containsKey!187 (toList!1093 lt!85637) #b1000000000000000000000000000000000000000000000000000000000000000) e!114904)))

(declare-fun b!173999 () Bool)

(declare-fun e!114905 () Bool)

(assert (=> b!173999 (= e!114904 e!114905)))

(declare-fun res!82529 () Bool)

(assert (=> b!173999 (=> (not res!82529) (not e!114905))))

(assert (=> b!173999 (= res!82529 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85637))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85637))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2210) (toList!1093 lt!85637)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85637))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174000 () Bool)

(assert (=> b!174000 (= e!114905 (containsKey!187 (t!7012 (toList!1093 lt!85637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52895 (not res!82528)) b!173999))

(assert (= (and b!173999 res!82529) b!174000))

(declare-fun m!202331 () Bool)

(assert (=> b!174000 m!202331))

(assert (=> d!52593 d!52895))

(declare-fun d!52897 () Bool)

(assert (=> d!52897 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85995 () Unit!5291)

(assert (=> d!52897 (= lt!85995 (choose!939 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114906 () Bool)

(assert (=> d!52897 e!114906))

(declare-fun res!82530 () Bool)

(assert (=> d!52897 (=> (not res!82530) (not e!114906))))

(assert (=> d!52897 (= res!82530 (isStrictlySorted!327 (toList!1093 lt!85663)))))

(assert (=> d!52897 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85995)))

(declare-fun b!174001 () Bool)

(assert (=> b!174001 (= e!114906 (containsKey!187 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52897 res!82530) b!174001))

(assert (=> d!52897 m!201551))

(assert (=> d!52897 m!201551))

(assert (=> d!52897 m!201553))

(declare-fun m!202333 () Bool)

(assert (=> d!52897 m!202333))

(assert (=> d!52897 m!202283))

(assert (=> b!174001 m!201547))

(assert (=> b!173469 d!52897))

(assert (=> b!173469 d!52651))

(assert (=> b!173469 d!52653))

(declare-fun d!52899 () Bool)

(assert (=> d!52899 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3950 (getValueByKey!183 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52503 d!52899))

(assert (=> d!52503 d!52717))

(declare-fun d!52901 () Bool)

(assert (=> d!52901 (= ($colon$colon!97 e!114556 (ite c!30945 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2210 (ite c!30945 (h!2827 (toList!1093 (getCurrentListMap!731 (_keys!5437 thiss!1248) (_values!3580 thiss!1248) (mask!8468 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!114556))))

(assert (=> bm!17578 d!52901))

(declare-fun d!52903 () Bool)

(declare-fun res!82531 () Bool)

(declare-fun e!114907 () Bool)

(assert (=> d!52903 (=> res!82531 e!114907)))

(assert (=> d!52903 (= res!82531 (and ((_ is Cons!2210) (toList!1093 lt!85652)) (= (_1!1629 (h!2827 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52903 (= (containsKey!187 (toList!1093 lt!85652) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114907)))

(declare-fun b!174002 () Bool)

(declare-fun e!114908 () Bool)

(assert (=> b!174002 (= e!114907 e!114908)))

(declare-fun res!82532 () Bool)

(assert (=> b!174002 (=> (not res!82532) (not e!114908))))

(assert (=> b!174002 (= res!82532 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85652))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2210) (toList!1093 lt!85652)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85652))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174003 () Bool)

(assert (=> b!174003 (= e!114908 (containsKey!187 (t!7012 (toList!1093 lt!85652)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52903 (not res!82531)) b!174002))

(assert (= (and b!174002 res!82532) b!174003))

(declare-fun m!202335 () Bool)

(assert (=> b!174003 m!202335))

(assert (=> d!52495 d!52903))

(declare-fun d!52905 () Bool)

(declare-fun e!114910 () Bool)

(assert (=> d!52905 e!114910))

(declare-fun res!82533 () Bool)

(assert (=> d!52905 (=> res!82533 e!114910)))

(declare-fun lt!85997 () Bool)

(assert (=> d!52905 (= res!82533 (not lt!85997))))

(declare-fun lt!85996 () Bool)

(assert (=> d!52905 (= lt!85997 lt!85996)))

(declare-fun lt!85999 () Unit!5291)

(declare-fun e!114909 () Unit!5291)

(assert (=> d!52905 (= lt!85999 e!114909)))

(declare-fun c!31114 () Bool)

(assert (=> d!52905 (= c!31114 lt!85996)))

(assert (=> d!52905 (= lt!85996 (containsKey!187 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52905 (= (contains!1152 lt!85851 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85997)))

(declare-fun b!174004 () Bool)

(declare-fun lt!85998 () Unit!5291)

(assert (=> b!174004 (= e!114909 lt!85998)))

(assert (=> b!174004 (= lt!85998 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!174004 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174005 () Bool)

(declare-fun Unit!5320 () Unit!5291)

(assert (=> b!174005 (= e!114909 Unit!5320)))

(declare-fun b!174006 () Bool)

(assert (=> b!174006 (= e!114910 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!52905 c!31114) b!174004))

(assert (= (and d!52905 (not c!31114)) b!174005))

(assert (= (and d!52905 (not res!82533)) b!174006))

(declare-fun m!202337 () Bool)

(assert (=> d!52905 m!202337))

(declare-fun m!202339 () Bool)

(assert (=> b!174004 m!202339))

(assert (=> b!174004 m!201763))

(assert (=> b!174004 m!201763))

(declare-fun m!202341 () Bool)

(assert (=> b!174004 m!202341))

(assert (=> b!174006 m!201763))

(assert (=> b!174006 m!201763))

(assert (=> b!174006 m!202341))

(assert (=> d!52613 d!52905))

(declare-fun b!174008 () Bool)

(declare-fun e!114911 () Option!189)

(declare-fun e!114912 () Option!189)

(assert (=> b!174008 (= e!114911 e!114912)))

(declare-fun c!31116 () Bool)

(assert (=> b!174008 (= c!31116 (and ((_ is Cons!2210) lt!85853) (not (= (_1!1629 (h!2827 lt!85853)) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174009 () Bool)

(assert (=> b!174009 (= e!114912 (getValueByKey!183 (t!7012 lt!85853) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174007 () Bool)

(assert (=> b!174007 (= e!114911 (Some!188 (_2!1629 (h!2827 lt!85853))))))

(declare-fun c!31115 () Bool)

(declare-fun d!52907 () Bool)

(assert (=> d!52907 (= c!31115 (and ((_ is Cons!2210) lt!85853) (= (_1!1629 (h!2827 lt!85853)) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!52907 (= (getValueByKey!183 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!114911)))

(declare-fun b!174010 () Bool)

(assert (=> b!174010 (= e!114912 None!187)))

(assert (= (and d!52907 c!31115) b!174007))

(assert (= (and d!52907 (not c!31115)) b!174008))

(assert (= (and b!174008 c!31116) b!174009))

(assert (= (and b!174008 (not c!31116)) b!174010))

(declare-fun m!202343 () Bool)

(assert (=> b!174009 m!202343))

(assert (=> d!52613 d!52907))

(declare-fun d!52909 () Bool)

(assert (=> d!52909 (= (getValueByKey!183 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!188 (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!86000 () Unit!5291)

(assert (=> d!52909 (= lt!86000 (choose!936 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114913 () Bool)

(assert (=> d!52909 e!114913))

(declare-fun res!82534 () Bool)

(assert (=> d!52909 (=> (not res!82534) (not e!114913))))

(assert (=> d!52909 (= res!82534 (isStrictlySorted!327 lt!85853))))

(assert (=> d!52909 (= (lemmaContainsTupThenGetReturnValue!99 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86000)))

(declare-fun b!174011 () Bool)

(declare-fun res!82535 () Bool)

(assert (=> b!174011 (=> (not res!82535) (not e!114913))))

(assert (=> b!174011 (= res!82535 (containsKey!187 lt!85853 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174012 () Bool)

(assert (=> b!174012 (= e!114913 (contains!1155 lt!85853 (tuple2!3237 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!52909 res!82534) b!174011))

(assert (= (and b!174011 res!82535) b!174012))

(assert (=> d!52909 m!201757))

(declare-fun m!202345 () Bool)

(assert (=> d!52909 m!202345))

(declare-fun m!202347 () Bool)

(assert (=> d!52909 m!202347))

(declare-fun m!202349 () Bool)

(assert (=> b!174011 m!202349))

(declare-fun m!202351 () Bool)

(assert (=> b!174012 m!202351))

(assert (=> d!52613 d!52909))

(declare-fun b!174013 () Bool)

(declare-fun e!114916 () List!2214)

(declare-fun call!17624 () List!2214)

(assert (=> b!174013 (= e!114916 call!17624)))

(declare-fun b!174014 () Bool)

(declare-fun res!82537 () Bool)

(declare-fun e!114914 () Bool)

(assert (=> b!174014 (=> (not res!82537) (not e!114914))))

(declare-fun lt!86001 () List!2214)

(assert (=> b!174014 (= res!82537 (containsKey!187 lt!86001 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114918 () List!2214)

(declare-fun b!174015 () Bool)

(assert (=> b!174015 (= e!114918 (insertStrictlySorted!102 (t!7012 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174016 () Bool)

(assert (=> b!174016 (= e!114914 (contains!1155 lt!86001 (tuple2!3237 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31118 () Bool)

(declare-fun c!31119 () Bool)

(declare-fun b!174017 () Bool)

(assert (=> b!174017 (= e!114918 (ite c!31119 (t!7012 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (ite c!31118 (Cons!2210 (h!2827 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (t!7012 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))))) Nil!2211)))))

(declare-fun c!31120 () Bool)

(declare-fun call!17623 () List!2214)

(declare-fun bm!17620 () Bool)

(assert (=> bm!17620 (= call!17623 ($colon$colon!97 e!114918 (ite c!31120 (h!2827 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (tuple2!3237 (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun c!31117 () Bool)

(assert (=> bm!17620 (= c!31117 c!31120)))

(declare-fun b!174018 () Bool)

(assert (=> b!174018 (= c!31118 (and ((_ is Cons!2210) (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (bvsgt (_1!1629 (h!2827 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun e!114917 () List!2214)

(assert (=> b!174018 (= e!114917 e!114916)))

(declare-fun b!174019 () Bool)

(declare-fun e!114915 () List!2214)

(assert (=> b!174019 (= e!114915 call!17623)))

(declare-fun d!52911 () Bool)

(assert (=> d!52911 e!114914))

(declare-fun res!82536 () Bool)

(assert (=> d!52911 (=> (not res!82536) (not e!114914))))

(assert (=> d!52911 (= res!82536 (isStrictlySorted!327 lt!86001))))

(assert (=> d!52911 (= lt!86001 e!114915)))

(assert (=> d!52911 (= c!31120 (and ((_ is Cons!2210) (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (bvslt (_1!1629 (h!2827 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!52911 (isStrictlySorted!327 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))))))

(assert (=> d!52911 (= (insertStrictlySorted!102 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86001)))

(declare-fun bm!17621 () Bool)

(declare-fun call!17625 () List!2214)

(assert (=> bm!17621 (= call!17624 call!17625)))

(declare-fun b!174020 () Bool)

(assert (=> b!174020 (= e!114916 call!17624)))

(declare-fun bm!17622 () Bool)

(assert (=> bm!17622 (= call!17625 call!17623)))

(declare-fun b!174021 () Bool)

(assert (=> b!174021 (= e!114915 e!114917)))

(assert (=> b!174021 (= c!31119 (and ((_ is Cons!2210) (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558)))) (= (_1!1629 (h!2827 (toList!1093 (ite c!30894 call!17559 (ite c!30897 call!17557 call!17558))))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174022 () Bool)

(assert (=> b!174022 (= e!114917 call!17625)))

(assert (= (and d!52911 c!31120) b!174019))

(assert (= (and d!52911 (not c!31120)) b!174021))

(assert (= (and b!174021 c!31119) b!174022))

(assert (= (and b!174021 (not c!31119)) b!174018))

(assert (= (and b!174018 c!31118) b!174013))

(assert (= (and b!174018 (not c!31118)) b!174020))

(assert (= (or b!174013 b!174020) bm!17621))

(assert (= (or b!174022 bm!17621) bm!17622))

(assert (= (or b!174019 bm!17622) bm!17620))

(assert (= (and bm!17620 c!31117) b!174015))

(assert (= (and bm!17620 (not c!31117)) b!174017))

(assert (= (and d!52911 res!82536) b!174014))

(assert (= (and b!174014 res!82537) b!174016))

(declare-fun m!202353 () Bool)

(assert (=> d!52911 m!202353))

(declare-fun m!202355 () Bool)

(assert (=> d!52911 m!202355))

(declare-fun m!202357 () Bool)

(assert (=> b!174016 m!202357))

(declare-fun m!202359 () Bool)

(assert (=> b!174015 m!202359))

(declare-fun m!202361 () Bool)

(assert (=> bm!17620 m!202361))

(declare-fun m!202363 () Bool)

(assert (=> b!174014 m!202363))

(assert (=> d!52613 d!52911))

(declare-fun d!52913 () Bool)

(declare-fun e!114920 () Bool)

(assert (=> d!52913 e!114920))

(declare-fun res!82538 () Bool)

(assert (=> d!52913 (=> res!82538 e!114920)))

(declare-fun lt!86003 () Bool)

(assert (=> d!52913 (= res!82538 (not lt!86003))))

(declare-fun lt!86002 () Bool)

(assert (=> d!52913 (= lt!86003 lt!86002)))

(declare-fun lt!86005 () Unit!5291)

(declare-fun e!114919 () Unit!5291)

(assert (=> d!52913 (= lt!86005 e!114919)))

(declare-fun c!31121 () Bool)

(assert (=> d!52913 (= c!31121 lt!86002)))

(assert (=> d!52913 (= lt!86002 (containsKey!187 (toList!1093 lt!85704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52913 (= (contains!1152 lt!85704 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86003)))

(declare-fun b!174023 () Bool)

(declare-fun lt!86004 () Unit!5291)

(assert (=> b!174023 (= e!114919 lt!86004)))

(assert (=> b!174023 (= lt!86004 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174023 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174024 () Bool)

(declare-fun Unit!5321 () Unit!5291)

(assert (=> b!174024 (= e!114919 Unit!5321)))

(declare-fun b!174025 () Bool)

(assert (=> b!174025 (= e!114920 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52913 c!31121) b!174023))

(assert (= (and d!52913 (not c!31121)) b!174024))

(assert (= (and d!52913 (not res!82538)) b!174025))

(declare-fun m!202365 () Bool)

(assert (=> d!52913 m!202365))

(declare-fun m!202367 () Bool)

(assert (=> b!174023 m!202367))

(declare-fun m!202369 () Bool)

(assert (=> b!174023 m!202369))

(assert (=> b!174023 m!202369))

(declare-fun m!202371 () Bool)

(assert (=> b!174023 m!202371))

(assert (=> b!174025 m!202369))

(assert (=> b!174025 m!202369))

(assert (=> b!174025 m!202371))

(assert (=> d!52483 d!52913))

(assert (=> d!52483 d!52467))

(declare-fun b!174026 () Bool)

(declare-fun e!114921 () Bool)

(declare-fun e!114922 () Bool)

(assert (=> b!174026 (= e!114921 e!114922)))

(declare-fun c!31122 () Bool)

(assert (=> b!174026 (= c!31122 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52915 () Bool)

(declare-fun res!82540 () Bool)

(assert (=> d!52915 (=> res!82540 e!114921)))

(assert (=> d!52915 (= res!82540 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52915 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5437 lt!85539) (mask!8468 lt!85539)) e!114921)))

(declare-fun b!174027 () Bool)

(declare-fun e!114923 () Bool)

(declare-fun call!17626 () Bool)

(assert (=> b!174027 (= e!114923 call!17626)))

(declare-fun b!174028 () Bool)

(assert (=> b!174028 (= e!114922 e!114923)))

(declare-fun lt!86008 () (_ BitVec 64))

(assert (=> b!174028 (= lt!86008 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!86007 () Unit!5291)

(assert (=> b!174028 (= lt!86007 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 lt!85539) lt!86008 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174028 (arrayContainsKey!0 (_keys!5437 lt!85539) lt!86008 #b00000000000000000000000000000000)))

(declare-fun lt!86006 () Unit!5291)

(assert (=> b!174028 (= lt!86006 lt!86007)))

(declare-fun res!82539 () Bool)

(assert (=> b!174028 (= res!82539 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5437 lt!85539) (mask!8468 lt!85539)) (Found!553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174028 (=> (not res!82539) (not e!114923))))

(declare-fun b!174029 () Bool)

(assert (=> b!174029 (= e!114922 call!17626)))

(declare-fun bm!17623 () Bool)

(assert (=> bm!17623 (= call!17626 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5437 lt!85539) (mask!8468 lt!85539)))))

(assert (= (and d!52915 (not res!82540)) b!174026))

(assert (= (and b!174026 c!31122) b!174028))

(assert (= (and b!174026 (not c!31122)) b!174029))

(assert (= (and b!174028 res!82539) b!174027))

(assert (= (or b!174027 b!174029) bm!17623))

(declare-fun m!202373 () Bool)

(assert (=> b!174026 m!202373))

(assert (=> b!174026 m!202373))

(declare-fun m!202375 () Bool)

(assert (=> b!174026 m!202375))

(assert (=> b!174028 m!202373))

(declare-fun m!202377 () Bool)

(assert (=> b!174028 m!202377))

(declare-fun m!202379 () Bool)

(assert (=> b!174028 m!202379))

(assert (=> b!174028 m!202373))

(declare-fun m!202381 () Bool)

(assert (=> b!174028 m!202381))

(declare-fun m!202383 () Bool)

(assert (=> bm!17623 m!202383))

(assert (=> bm!17584 d!52915))

(declare-fun b!174031 () Bool)

(declare-fun e!114924 () Option!189)

(declare-fun e!114925 () Option!189)

(assert (=> b!174031 (= e!114924 e!114925)))

(declare-fun c!31124 () Bool)

(assert (=> b!174031 (= c!31124 (and ((_ is Cons!2210) (toList!1093 lt!85799)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85799))) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174032 () Bool)

(assert (=> b!174032 (= e!114925 (getValueByKey!183 (t!7012 (toList!1093 lt!85799)) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174030 () Bool)

(assert (=> b!174030 (= e!114924 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85799)))))))

(declare-fun c!31123 () Bool)

(declare-fun d!52917 () Bool)

(assert (=> d!52917 (= c!31123 (and ((_ is Cons!2210) (toList!1093 lt!85799)) (= (_1!1629 (h!2827 (toList!1093 lt!85799))) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(assert (=> d!52917 (= (getValueByKey!183 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) e!114924)))

(declare-fun b!174033 () Bool)

(assert (=> b!174033 (= e!114925 None!187)))

(assert (= (and d!52917 c!31123) b!174030))

(assert (= (and d!52917 (not c!31123)) b!174031))

(assert (= (and b!174031 c!31124) b!174032))

(assert (= (and b!174031 (not c!31124)) b!174033))

(declare-fun m!202385 () Bool)

(assert (=> b!174032 m!202385))

(assert (=> b!173488 d!52917))

(declare-fun d!52919 () Bool)

(assert (=> d!52919 (= (apply!130 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)) lt!85674) (apply!130 lt!85662 lt!85674))))

(assert (=> d!52919 true))

(declare-fun _$34!1059 () Unit!5291)

(assert (=> d!52919 (= (choose!937 lt!85662 lt!85668 v!309 lt!85674) _$34!1059)))

(declare-fun bs!7168 () Bool)

(assert (= bs!7168 d!52919))

(assert (=> bs!7168 m!201213))

(assert (=> bs!7168 m!201213))

(assert (=> bs!7168 m!201235))

(assert (=> bs!7168 m!201219))

(assert (=> d!52519 d!52919))

(declare-fun d!52921 () Bool)

(declare-fun e!114927 () Bool)

(assert (=> d!52921 e!114927))

(declare-fun res!82541 () Bool)

(assert (=> d!52921 (=> res!82541 e!114927)))

(declare-fun lt!86010 () Bool)

(assert (=> d!52921 (= res!82541 (not lt!86010))))

(declare-fun lt!86009 () Bool)

(assert (=> d!52921 (= lt!86010 lt!86009)))

(declare-fun lt!86012 () Unit!5291)

(declare-fun e!114926 () Unit!5291)

(assert (=> d!52921 (= lt!86012 e!114926)))

(declare-fun c!31125 () Bool)

(assert (=> d!52921 (= c!31125 lt!86009)))

(assert (=> d!52921 (= lt!86009 (containsKey!187 (toList!1093 lt!85662) lt!85674))))

(assert (=> d!52921 (= (contains!1152 lt!85662 lt!85674) lt!86010)))

(declare-fun b!174034 () Bool)

(declare-fun lt!86011 () Unit!5291)

(assert (=> b!174034 (= e!114926 lt!86011)))

(assert (=> b!174034 (= lt!86011 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85662) lt!85674))))

(assert (=> b!174034 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85662) lt!85674))))

(declare-fun b!174035 () Bool)

(declare-fun Unit!5322 () Unit!5291)

(assert (=> b!174035 (= e!114926 Unit!5322)))

(declare-fun b!174036 () Bool)

(assert (=> b!174036 (= e!114927 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85662) lt!85674)))))

(assert (= (and d!52921 c!31125) b!174034))

(assert (= (and d!52921 (not c!31125)) b!174035))

(assert (= (and d!52921 (not res!82541)) b!174036))

(declare-fun m!202387 () Bool)

(assert (=> d!52921 m!202387))

(declare-fun m!202389 () Bool)

(assert (=> b!174034 m!202389))

(assert (=> b!174034 m!201527))

(assert (=> b!174034 m!201527))

(declare-fun m!202391 () Bool)

(assert (=> b!174034 m!202391))

(assert (=> b!174036 m!201527))

(assert (=> b!174036 m!201527))

(assert (=> b!174036 m!202391))

(assert (=> d!52519 d!52921))

(assert (=> d!52519 d!52507))

(assert (=> d!52519 d!52533))

(assert (=> d!52519 d!52535))

(declare-fun d!52923 () Bool)

(assert (=> d!52923 (= ($colon$colon!97 e!114546 (ite c!30938 (h!2827 (toList!1093 (map!1862 thiss!1248))) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309))))) (Cons!2210 (ite c!30938 (h!2827 (toList!1093 (map!1862 thiss!1248))) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))) e!114546))))

(assert (=> bm!17575 d!52923))

(declare-fun d!52925 () Bool)

(assert (=> d!52925 (= (apply!130 lt!85714 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) (get!1963 (getValueByKey!183 (toList!1093 lt!85714) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))))

(declare-fun bs!7169 () Bool)

(assert (= bs!7169 d!52925))

(assert (=> bs!7169 m!201317))

(declare-fun m!202393 () Bool)

(assert (=> bs!7169 m!202393))

(assert (=> bs!7169 m!202393))

(declare-fun m!202395 () Bool)

(assert (=> bs!7169 m!202395))

(assert (=> b!173360 d!52925))

(declare-fun d!52927 () Bool)

(declare-fun c!31126 () Bool)

(assert (=> d!52927 (= c!31126 ((_ is ValueCellFull!1697) (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun e!114928 () V!5089)

(assert (=> d!52927 (= (get!1962 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000)) e!114928)))

(declare-fun b!174037 () Bool)

(assert (=> b!174037 (= e!114928 (get!1964 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174038 () Bool)

(assert (=> b!174038 (= e!114928 (get!1965 (select (arr!3455 (_values!3580 lt!85539)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 lt!85539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52927 c!31126) b!174037))

(assert (= (and d!52927 (not c!31126)) b!174038))

(assert (=> b!174037 m!201355))

(assert (=> b!174037 m!201357))

(declare-fun m!202397 () Bool)

(assert (=> b!174037 m!202397))

(assert (=> b!174038 m!201355))

(assert (=> b!174038 m!201357))

(declare-fun m!202399 () Bool)

(assert (=> b!174038 m!202399))

(assert (=> b!173360 d!52927))

(declare-fun d!52929 () Bool)

(declare-fun lt!86013 () Bool)

(assert (=> d!52929 (= lt!86013 (select (content!149 (toList!1093 lt!85682)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114930 () Bool)

(assert (=> d!52929 (= lt!86013 e!114930)))

(declare-fun res!82542 () Bool)

(assert (=> d!52929 (=> (not res!82542) (not e!114930))))

(assert (=> d!52929 (= res!82542 ((_ is Cons!2210) (toList!1093 lt!85682)))))

(assert (=> d!52929 (= (contains!1155 (toList!1093 lt!85682) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86013)))

(declare-fun b!174039 () Bool)

(declare-fun e!114929 () Bool)

(assert (=> b!174039 (= e!114930 e!114929)))

(declare-fun res!82543 () Bool)

(assert (=> b!174039 (=> res!82543 e!114929)))

(assert (=> b!174039 (= res!82543 (= (h!2827 (toList!1093 lt!85682)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!174040 () Bool)

(assert (=> b!174040 (= e!114929 (contains!1155 (t!7012 (toList!1093 lt!85682)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52929 res!82542) b!174039))

(assert (= (and b!174039 (not res!82543)) b!174040))

(declare-fun m!202401 () Bool)

(assert (=> d!52929 m!202401))

(declare-fun m!202403 () Bool)

(assert (=> d!52929 m!202403))

(declare-fun m!202405 () Bool)

(assert (=> b!174040 m!202405))

(assert (=> b!173301 d!52929))

(declare-fun d!52931 () Bool)

(declare-fun res!82544 () Bool)

(declare-fun e!114931 () Bool)

(assert (=> d!52931 (=> res!82544 e!114931)))

(assert (=> d!52931 (= res!82544 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52931 (= (containsKey!187 (toList!1093 lt!85663) #b0000000000000000000000000000000000000000000000000000000000000000) e!114931)))

(declare-fun b!174041 () Bool)

(declare-fun e!114932 () Bool)

(assert (=> b!174041 (= e!114931 e!114932)))

(declare-fun res!82545 () Bool)

(assert (=> b!174041 (=> (not res!82545) (not e!114932))))

(assert (=> b!174041 (= res!82545 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85663))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85663))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2210) (toList!1093 lt!85663)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85663))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174042 () Bool)

(assert (=> b!174042 (= e!114932 (containsKey!187 (t!7012 (toList!1093 lt!85663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52931 (not res!82544)) b!174041))

(assert (= (and b!174041 res!82545) b!174042))

(declare-fun m!202407 () Bool)

(assert (=> b!174042 m!202407))

(assert (=> d!52547 d!52931))

(declare-fun d!52933 () Bool)

(assert (=> d!52933 (= (apply!130 (+!240 lt!85635 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!85643) (apply!130 lt!85635 lt!85643))))

(assert (=> d!52933 true))

(declare-fun _$34!1060 () Unit!5291)

(assert (=> d!52933 (= (choose!937 lt!85635 lt!85645 (minValue!3440 thiss!1248) lt!85643) _$34!1060)))

(declare-fun bs!7170 () Bool)

(assert (= bs!7170 d!52933))

(assert (=> bs!7170 m!201151))

(assert (=> bs!7170 m!201151))

(assert (=> bs!7170 m!201153))

(assert (=> bs!7170 m!201147))

(assert (=> d!52555 d!52933))

(assert (=> d!52555 d!52557))

(declare-fun d!52935 () Bool)

(declare-fun e!114934 () Bool)

(assert (=> d!52935 e!114934))

(declare-fun res!82546 () Bool)

(assert (=> d!52935 (=> res!82546 e!114934)))

(declare-fun lt!86015 () Bool)

(assert (=> d!52935 (= res!82546 (not lt!86015))))

(declare-fun lt!86014 () Bool)

(assert (=> d!52935 (= lt!86015 lt!86014)))

(declare-fun lt!86017 () Unit!5291)

(declare-fun e!114933 () Unit!5291)

(assert (=> d!52935 (= lt!86017 e!114933)))

(declare-fun c!31127 () Bool)

(assert (=> d!52935 (= c!31127 lt!86014)))

(assert (=> d!52935 (= lt!86014 (containsKey!187 (toList!1093 lt!85635) lt!85643))))

(assert (=> d!52935 (= (contains!1152 lt!85635 lt!85643) lt!86015)))

(declare-fun b!174043 () Bool)

(declare-fun lt!86016 () Unit!5291)

(assert (=> b!174043 (= e!114933 lt!86016)))

(assert (=> b!174043 (= lt!86016 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85635) lt!85643))))

(assert (=> b!174043 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85635) lt!85643))))

(declare-fun b!174044 () Bool)

(declare-fun Unit!5323 () Unit!5291)

(assert (=> b!174044 (= e!114933 Unit!5323)))

(declare-fun b!174045 () Bool)

(assert (=> b!174045 (= e!114934 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85635) lt!85643)))))

(assert (= (and d!52935 c!31127) b!174043))

(assert (= (and d!52935 (not c!31127)) b!174044))

(assert (= (and d!52935 (not res!82546)) b!174045))

(declare-fun m!202409 () Bool)

(assert (=> d!52935 m!202409))

(declare-fun m!202411 () Bool)

(assert (=> b!174043 m!202411))

(assert (=> b!174043 m!201595))

(assert (=> b!174043 m!201595))

(declare-fun m!202413 () Bool)

(assert (=> b!174043 m!202413))

(assert (=> b!174045 m!201595))

(assert (=> b!174045 m!201595))

(assert (=> b!174045 m!202413))

(assert (=> d!52555 d!52935))

(assert (=> d!52555 d!52579))

(assert (=> d!52555 d!52567))

(declare-fun d!52937 () Bool)

(declare-fun res!82547 () Bool)

(declare-fun e!114935 () Bool)

(assert (=> d!52937 (=> res!82547 e!114935)))

(assert (=> d!52937 (= res!82547 (and ((_ is Cons!2210) lt!85737) (= (_1!1629 (h!2827 lt!85737)) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!52937 (= (containsKey!187 lt!85737 (_1!1629 (tuple2!3237 key!828 v!309))) e!114935)))

(declare-fun b!174046 () Bool)

(declare-fun e!114936 () Bool)

(assert (=> b!174046 (= e!114935 e!114936)))

(declare-fun res!82548 () Bool)

(assert (=> b!174046 (=> (not res!82548) (not e!114936))))

(assert (=> b!174046 (= res!82548 (and (or (not ((_ is Cons!2210) lt!85737)) (bvsle (_1!1629 (h!2827 lt!85737)) (_1!1629 (tuple2!3237 key!828 v!309)))) ((_ is Cons!2210) lt!85737) (bvslt (_1!1629 (h!2827 lt!85737)) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!174047 () Bool)

(assert (=> b!174047 (= e!114936 (containsKey!187 (t!7012 lt!85737) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (= (and d!52937 (not res!82547)) b!174046))

(assert (= (and b!174046 res!82548) b!174047))

(declare-fun m!202415 () Bool)

(assert (=> b!174047 m!202415))

(assert (=> b!173419 d!52937))

(declare-fun d!52939 () Bool)

(declare-fun e!114938 () Bool)

(assert (=> d!52939 e!114938))

(declare-fun res!82549 () Bool)

(assert (=> d!52939 (=> res!82549 e!114938)))

(declare-fun lt!86019 () Bool)

(assert (=> d!52939 (= res!82549 (not lt!86019))))

(declare-fun lt!86018 () Bool)

(assert (=> d!52939 (= lt!86019 lt!86018)))

(declare-fun lt!86021 () Unit!5291)

(declare-fun e!114937 () Unit!5291)

(assert (=> d!52939 (= lt!86021 e!114937)))

(declare-fun c!31128 () Bool)

(assert (=> d!52939 (= c!31128 lt!86018)))

(assert (=> d!52939 (= lt!86018 (containsKey!187 (toList!1093 lt!85714) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> d!52939 (= (contains!1152 lt!85714 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)) lt!86019)))

(declare-fun b!174048 () Bool)

(declare-fun lt!86020 () Unit!5291)

(assert (=> b!174048 (= e!114937 lt!86020)))

(assert (=> b!174048 (= lt!86020 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85714) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(assert (=> b!174048 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000)))))

(declare-fun b!174049 () Bool)

(declare-fun Unit!5324 () Unit!5291)

(assert (=> b!174049 (= e!114937 Unit!5324)))

(declare-fun b!174050 () Bool)

(assert (=> b!174050 (= e!114938 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000))))))

(assert (= (and d!52939 c!31128) b!174048))

(assert (= (and d!52939 (not c!31128)) b!174049))

(assert (= (and d!52939 (not res!82549)) b!174050))

(assert (=> d!52939 m!201317))

(declare-fun m!202417 () Bool)

(assert (=> d!52939 m!202417))

(assert (=> b!174048 m!201317))

(declare-fun m!202419 () Bool)

(assert (=> b!174048 m!202419))

(assert (=> b!174048 m!201317))

(assert (=> b!174048 m!202393))

(assert (=> b!174048 m!202393))

(declare-fun m!202421 () Bool)

(assert (=> b!174048 m!202421))

(assert (=> b!174050 m!201317))

(assert (=> b!174050 m!202393))

(assert (=> b!174050 m!202393))

(assert (=> b!174050 m!202421))

(assert (=> b!173357 d!52939))

(assert (=> b!173561 d!52811))

(declare-fun lt!86022 () Bool)

(declare-fun d!52941 () Bool)

(assert (=> d!52941 (= lt!86022 (select (content!149 (toList!1093 lt!85745)) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun e!114940 () Bool)

(assert (=> d!52941 (= lt!86022 e!114940)))

(declare-fun res!82550 () Bool)

(assert (=> d!52941 (=> (not res!82550) (not e!114940))))

(assert (=> d!52941 (= res!82550 ((_ is Cons!2210) (toList!1093 lt!85745)))))

(assert (=> d!52941 (= (contains!1155 (toList!1093 lt!85745) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!86022)))

(declare-fun b!174051 () Bool)

(declare-fun e!114939 () Bool)

(assert (=> b!174051 (= e!114940 e!114939)))

(declare-fun res!82551 () Bool)

(assert (=> b!174051 (=> res!82551 e!114939)))

(assert (=> b!174051 (= res!82551 (= (h!2827 (toList!1093 lt!85745)) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!174052 () Bool)

(assert (=> b!174052 (= e!114939 (contains!1155 (t!7012 (toList!1093 lt!85745)) (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (= (and d!52941 res!82550) b!174051))

(assert (= (and b!174051 (not res!82551)) b!174052))

(declare-fun m!202423 () Bool)

(assert (=> d!52941 m!202423))

(declare-fun m!202425 () Bool)

(assert (=> d!52941 m!202425))

(declare-fun m!202427 () Bool)

(assert (=> b!174052 m!202427))

(assert (=> b!173448 d!52941))

(declare-fun d!52943 () Bool)

(declare-fun res!82552 () Bool)

(declare-fun e!114941 () Bool)

(assert (=> d!52943 (=> res!82552 e!114941)))

(assert (=> d!52943 (= res!82552 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!52943 (= (arrayNoDuplicates!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30964 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)) e!114941)))

(declare-fun b!174053 () Bool)

(declare-fun e!114943 () Bool)

(assert (=> b!174053 (= e!114943 (contains!1156 (ite c!30964 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) Nil!2214) Nil!2214) (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174054 () Bool)

(declare-fun e!114942 () Bool)

(assert (=> b!174054 (= e!114941 e!114942)))

(declare-fun res!82553 () Bool)

(assert (=> b!174054 (=> (not res!82553) (not e!114942))))

(assert (=> b!174054 (= res!82553 (not e!114943))))

(declare-fun res!82554 () Bool)

(assert (=> b!174054 (=> (not res!82554) (not e!114943))))

(assert (=> b!174054 (= res!82554 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174055 () Bool)

(declare-fun e!114944 () Bool)

(declare-fun call!17627 () Bool)

(assert (=> b!174055 (= e!114944 call!17627)))

(declare-fun b!174056 () Bool)

(assert (=> b!174056 (= e!114944 call!17627)))

(declare-fun c!31129 () Bool)

(declare-fun bm!17624 () Bool)

(assert (=> bm!17624 (= call!17627 (arrayNoDuplicates!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31129 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30964 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)) (ite c!30964 (Cons!2213 (select (arr!3454 (_keys!5437 lt!85539)) #b00000000000000000000000000000000) Nil!2214) Nil!2214))))))

(declare-fun b!174057 () Bool)

(assert (=> b!174057 (= e!114942 e!114944)))

(assert (=> b!174057 (= c!31129 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52943 (not res!82552)) b!174054))

(assert (= (and b!174054 res!82554) b!174053))

(assert (= (and b!174054 res!82553) b!174057))

(assert (= (and b!174057 c!31129) b!174056))

(assert (= (and b!174057 (not c!31129)) b!174055))

(assert (= (or b!174056 b!174055) bm!17624))

(assert (=> b!174053 m!202373))

(assert (=> b!174053 m!202373))

(declare-fun m!202429 () Bool)

(assert (=> b!174053 m!202429))

(assert (=> b!174054 m!202373))

(assert (=> b!174054 m!202373))

(assert (=> b!174054 m!202375))

(assert (=> bm!17624 m!202373))

(declare-fun m!202431 () Bool)

(assert (=> bm!17624 m!202431))

(assert (=> b!174057 m!202373))

(assert (=> b!174057 m!202373))

(assert (=> b!174057 m!202375))

(assert (=> bm!17589 d!52943))

(declare-fun d!52945 () Bool)

(declare-fun lt!86023 () Bool)

(assert (=> d!52945 (= lt!86023 (select (content!149 lt!85581) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun e!114946 () Bool)

(assert (=> d!52945 (= lt!86023 e!114946)))

(declare-fun res!82555 () Bool)

(assert (=> d!52945 (=> (not res!82555) (not e!114946))))

(assert (=> d!52945 (= res!82555 ((_ is Cons!2210) lt!85581))))

(assert (=> d!52945 (= (contains!1155 lt!85581 (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))) lt!86023)))

(declare-fun b!174058 () Bool)

(declare-fun e!114945 () Bool)

(assert (=> b!174058 (= e!114946 e!114945)))

(declare-fun res!82556 () Bool)

(assert (=> b!174058 (=> res!82556 e!114945)))

(assert (=> b!174058 (= res!82556 (= (h!2827 lt!85581) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!174059 () Bool)

(assert (=> b!174059 (= e!114945 (contains!1155 (t!7012 lt!85581) (tuple2!3237 (_1!1629 (tuple2!3237 key!828 v!309)) (_2!1629 (tuple2!3237 key!828 v!309)))))))

(assert (= (and d!52945 res!82555) b!174058))

(assert (= (and b!174058 (not res!82556)) b!174059))

(declare-fun m!202433 () Bool)

(assert (=> d!52945 m!202433))

(declare-fun m!202435 () Bool)

(assert (=> d!52945 m!202435))

(declare-fun m!202437 () Bool)

(assert (=> b!174059 m!202437))

(assert (=> b!173397 d!52945))

(declare-fun d!52947 () Bool)

(assert (=> d!52947 (= (apply!130 lt!85816 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1963 (getValueByKey!183 (toList!1093 lt!85816) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7171 () Bool)

(assert (= bs!7171 d!52947))

(assert (=> bs!7171 m!201133))

(assert (=> bs!7171 m!202297))

(assert (=> bs!7171 m!202297))

(declare-fun m!202439 () Bool)

(assert (=> bs!7171 m!202439))

(assert (=> b!173504 d!52947))

(assert (=> b!173504 d!52477))

(declare-fun d!52949 () Bool)

(declare-fun res!82557 () Bool)

(declare-fun e!114947 () Bool)

(assert (=> d!52949 (=> res!82557 e!114947)))

(assert (=> d!52949 (= res!82557 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52949 (= (containsKey!187 (toList!1093 lt!85663) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) e!114947)))

(declare-fun b!174060 () Bool)

(declare-fun e!114948 () Bool)

(assert (=> b!174060 (= e!114947 e!114948)))

(declare-fun res!82558 () Bool)

(assert (=> b!174060 (=> (not res!82558) (not e!114948))))

(assert (=> b!174060 (= res!82558 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85663))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85663))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2210) (toList!1093 lt!85663)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85663))) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!174061 () Bool)

(assert (=> b!174061 (= e!114948 (containsKey!187 (t!7012 (toList!1093 lt!85663)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52949 (not res!82557)) b!174060))

(assert (= (and b!174060 res!82558) b!174061))

(assert (=> b!174061 m!201133))

(declare-fun m!202441 () Bool)

(assert (=> b!174061 m!202441))

(assert (=> d!52541 d!52949))

(assert (=> b!173379 d!52731))

(assert (=> b!173379 d!52601))

(declare-fun d!52951 () Bool)

(declare-fun res!82559 () Bool)

(declare-fun e!114949 () Bool)

(assert (=> d!52951 (=> res!82559 e!114949)))

(assert (=> d!52951 (= res!82559 (and ((_ is Cons!2210) (toList!1093 lt!85663)) (= (_1!1629 (h!2827 (toList!1093 lt!85663))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52951 (= (containsKey!187 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000) e!114949)))

(declare-fun b!174062 () Bool)

(declare-fun e!114950 () Bool)

(assert (=> b!174062 (= e!114949 e!114950)))

(declare-fun res!82560 () Bool)

(assert (=> b!174062 (=> (not res!82560) (not e!114950))))

(assert (=> b!174062 (= res!82560 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85663))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85663))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2210) (toList!1093 lt!85663)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85663))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174063 () Bool)

(assert (=> b!174063 (= e!114950 (containsKey!187 (t!7012 (toList!1093 lt!85663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52951 (not res!82559)) b!174062))

(assert (= (and b!174062 res!82560) b!174063))

(declare-fun m!202443 () Bool)

(assert (=> b!174063 m!202443))

(assert (=> d!52539 d!52951))

(declare-fun d!52953 () Bool)

(declare-fun res!82561 () Bool)

(declare-fun e!114951 () Bool)

(assert (=> d!52953 (=> res!82561 e!114951)))

(assert (=> d!52953 (= res!82561 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(assert (=> d!52953 (= (arrayNoDuplicates!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30960 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)) e!114951)))

(declare-fun b!174064 () Bool)

(declare-fun e!114953 () Bool)

(assert (=> b!174064 (= e!114953 (contains!1156 (ite c!30960 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) Nil!2214) Nil!2214) (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174065 () Bool)

(declare-fun e!114952 () Bool)

(assert (=> b!174065 (= e!114951 e!114952)))

(declare-fun res!82562 () Bool)

(assert (=> b!174065 (=> (not res!82562) (not e!114952))))

(assert (=> b!174065 (= res!82562 (not e!114953))))

(declare-fun res!82563 () Bool)

(assert (=> b!174065 (=> (not res!82563) (not e!114953))))

(assert (=> b!174065 (= res!82563 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174066 () Bool)

(declare-fun e!114954 () Bool)

(declare-fun call!17628 () Bool)

(assert (=> b!174066 (= e!114954 call!17628)))

(declare-fun b!174067 () Bool)

(assert (=> b!174067 (= e!114954 call!17628)))

(declare-fun bm!17625 () Bool)

(declare-fun c!31130 () Bool)

(assert (=> bm!17625 (= call!17628 (arrayNoDuplicates!0 (_keys!5437 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31130 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30960 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) Nil!2214) Nil!2214)) (ite c!30960 (Cons!2213 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) Nil!2214) Nil!2214))))))

(declare-fun b!174068 () Bool)

(assert (=> b!174068 (= e!114952 e!114954)))

(assert (=> b!174068 (= c!31130 (validKeyInArray!0 (select (arr!3454 (_keys!5437 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52953 (not res!82561)) b!174065))

(assert (= (and b!174065 res!82563) b!174064))

(assert (= (and b!174065 res!82562) b!174068))

(assert (= (and b!174068 c!31130) b!174067))

(assert (= (and b!174068 (not c!31130)) b!174066))

(assert (= (or b!174067 b!174066) bm!17625))

(assert (=> b!174064 m!201853))

(assert (=> b!174064 m!201853))

(declare-fun m!202445 () Bool)

(assert (=> b!174064 m!202445))

(assert (=> b!174065 m!201853))

(assert (=> b!174065 m!201853))

(assert (=> b!174065 m!201857))

(assert (=> bm!17625 m!201853))

(declare-fun m!202447 () Bool)

(assert (=> bm!17625 m!202447))

(assert (=> b!174068 m!201853))

(assert (=> b!174068 m!201853))

(assert (=> b!174068 m!201857))

(assert (=> bm!17587 d!52953))

(assert (=> d!52563 d!52569))

(assert (=> d!52563 d!52561))

(declare-fun d!52955 () Bool)

(assert (=> d!52955 (contains!1152 (+!240 lt!85649 (tuple2!3237 lt!85640 (zeroValue!3438 thiss!1248))) lt!85641)))

(assert (=> d!52955 true))

(declare-fun _$35!412 () Unit!5291)

(assert (=> d!52955 (= (choose!938 lt!85649 lt!85640 (zeroValue!3438 thiss!1248) lt!85641) _$35!412)))

(declare-fun bs!7172 () Bool)

(assert (= bs!7172 d!52955))

(assert (=> bs!7172 m!201149))

(assert (=> bs!7172 m!201149))

(assert (=> bs!7172 m!201165))

(assert (=> d!52563 d!52955))

(declare-fun d!52957 () Bool)

(declare-fun e!114956 () Bool)

(assert (=> d!52957 e!114956))

(declare-fun res!82564 () Bool)

(assert (=> d!52957 (=> res!82564 e!114956)))

(declare-fun lt!86025 () Bool)

(assert (=> d!52957 (= res!82564 (not lt!86025))))

(declare-fun lt!86024 () Bool)

(assert (=> d!52957 (= lt!86025 lt!86024)))

(declare-fun lt!86027 () Unit!5291)

(declare-fun e!114955 () Unit!5291)

(assert (=> d!52957 (= lt!86027 e!114955)))

(declare-fun c!31131 () Bool)

(assert (=> d!52957 (= c!31131 lt!86024)))

(assert (=> d!52957 (= lt!86024 (containsKey!187 (toList!1093 lt!85649) lt!85641))))

(assert (=> d!52957 (= (contains!1152 lt!85649 lt!85641) lt!86025)))

(declare-fun b!174070 () Bool)

(declare-fun lt!86026 () Unit!5291)

(assert (=> b!174070 (= e!114955 lt!86026)))

(assert (=> b!174070 (= lt!86026 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85649) lt!85641))))

(assert (=> b!174070 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85649) lt!85641))))

(declare-fun b!174071 () Bool)

(declare-fun Unit!5325 () Unit!5291)

(assert (=> b!174071 (= e!114955 Unit!5325)))

(declare-fun b!174072 () Bool)

(assert (=> b!174072 (= e!114956 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85649) lt!85641)))))

(assert (= (and d!52957 c!31131) b!174070))

(assert (= (and d!52957 (not c!31131)) b!174071))

(assert (= (and d!52957 (not res!82564)) b!174072))

(declare-fun m!202449 () Bool)

(assert (=> d!52957 m!202449))

(declare-fun m!202451 () Bool)

(assert (=> b!174070 m!202451))

(declare-fun m!202453 () Bool)

(assert (=> b!174070 m!202453))

(assert (=> b!174070 m!202453))

(declare-fun m!202455 () Bool)

(assert (=> b!174070 m!202455))

(assert (=> b!174072 m!202453))

(assert (=> b!174072 m!202453))

(assert (=> b!174072 m!202455))

(assert (=> d!52563 d!52957))

(declare-fun d!52959 () Bool)

(declare-fun e!114958 () Bool)

(assert (=> d!52959 e!114958))

(declare-fun res!82565 () Bool)

(assert (=> d!52959 (=> res!82565 e!114958)))

(declare-fun lt!86029 () Bool)

(assert (=> d!52959 (= res!82565 (not lt!86029))))

(declare-fun lt!86028 () Bool)

(assert (=> d!52959 (= lt!86029 lt!86028)))

(declare-fun lt!86031 () Unit!5291)

(declare-fun e!114957 () Unit!5291)

(assert (=> d!52959 (= lt!86031 e!114957)))

(declare-fun c!31132 () Bool)

(assert (=> d!52959 (= c!31132 lt!86028)))

(assert (=> d!52959 (= lt!86028 (containsKey!187 (toList!1093 lt!85714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52959 (= (contains!1152 lt!85714 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86029)))

(declare-fun b!174073 () Bool)

(declare-fun lt!86030 () Unit!5291)

(assert (=> b!174073 (= e!114957 lt!86030)))

(assert (=> b!174073 (= lt!86030 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174073 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174074 () Bool)

(declare-fun Unit!5326 () Unit!5291)

(assert (=> b!174074 (= e!114957 Unit!5326)))

(declare-fun b!174075 () Bool)

(assert (=> b!174075 (= e!114958 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52959 c!31132) b!174073))

(assert (= (and d!52959 (not c!31132)) b!174074))

(assert (= (and d!52959 (not res!82565)) b!174075))

(declare-fun m!202457 () Bool)

(assert (=> d!52959 m!202457))

(declare-fun m!202459 () Bool)

(assert (=> b!174073 m!202459))

(declare-fun m!202461 () Bool)

(assert (=> b!174073 m!202461))

(assert (=> b!174073 m!202461))

(declare-fun m!202463 () Bool)

(assert (=> b!174073 m!202463))

(assert (=> b!174075 m!202461))

(assert (=> b!174075 m!202461))

(assert (=> b!174075 m!202463))

(assert (=> bm!17567 d!52959))

(declare-fun d!52961 () Bool)

(assert (=> d!52961 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85673)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85673)))))

(assert (=> d!52523 d!52961))

(declare-fun b!174077 () Bool)

(declare-fun e!114959 () Option!189)

(declare-fun e!114960 () Option!189)

(assert (=> b!174077 (= e!114959 e!114960)))

(declare-fun c!31134 () Bool)

(assert (=> b!174077 (= c!31134 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))) lt!85673))))))

(declare-fun b!174078 () Bool)

(assert (=> b!174078 (= e!114960 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))) lt!85673))))

(declare-fun b!174076 () Bool)

(assert (=> b!174076 (= e!114959 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))))))))

(declare-fun d!52963 () Bool)

(declare-fun c!31133 () Bool)

(assert (=> d!52963 (= c!31133 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))))) lt!85673)))))

(assert (=> d!52963 (= (getValueByKey!183 (toList!1093 (+!240 lt!85656 (tuple2!3237 lt!85657 (zeroValue!3438 thiss!1248)))) lt!85673) e!114959)))

(declare-fun b!174079 () Bool)

(assert (=> b!174079 (= e!114960 None!187)))

(assert (= (and d!52963 c!31133) b!174076))

(assert (= (and d!52963 (not c!31133)) b!174077))

(assert (= (and b!174077 c!31134) b!174078))

(assert (= (and b!174077 (not c!31134)) b!174079))

(declare-fun m!202465 () Bool)

(assert (=> b!174078 m!202465))

(assert (=> d!52523 d!52963))

(assert (=> b!173518 d!52695))

(declare-fun d!52965 () Bool)

(declare-fun lt!86032 () Bool)

(assert (=> d!52965 (= lt!86032 (select (content!150 Nil!2214) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114961 () Bool)

(assert (=> d!52965 (= lt!86032 e!114961)))

(declare-fun res!82567 () Bool)

(assert (=> d!52965 (=> (not res!82567) (not e!114961))))

(assert (=> d!52965 (= res!82567 ((_ is Cons!2213) Nil!2214))))

(assert (=> d!52965 (= (contains!1156 Nil!2214 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!86032)))

(declare-fun b!174080 () Bool)

(declare-fun e!114962 () Bool)

(assert (=> b!174080 (= e!114961 e!114962)))

(declare-fun res!82566 () Bool)

(assert (=> b!174080 (=> res!82566 e!114962)))

(assert (=> b!174080 (= res!82566 (= (h!2830 Nil!2214) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174081 () Bool)

(assert (=> b!174081 (= e!114962 (contains!1156 (t!7017 Nil!2214) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52965 res!82567) b!174080))

(assert (= (and b!174080 (not res!82566)) b!174081))

(assert (=> d!52965 m!202285))

(assert (=> d!52965 m!201133))

(declare-fun m!202467 () Bool)

(assert (=> d!52965 m!202467))

(assert (=> b!174081 m!201133))

(declare-fun m!202469 () Bool)

(assert (=> b!174081 m!202469))

(assert (=> b!173532 d!52965))

(assert (=> b!173317 d!52857))

(declare-fun d!52967 () Bool)

(declare-fun e!114964 () Bool)

(assert (=> d!52967 e!114964))

(declare-fun res!82568 () Bool)

(assert (=> d!52967 (=> res!82568 e!114964)))

(declare-fun lt!86034 () Bool)

(assert (=> d!52967 (= res!82568 (not lt!86034))))

(declare-fun lt!86033 () Bool)

(assert (=> d!52967 (= lt!86034 lt!86033)))

(declare-fun lt!86036 () Unit!5291)

(declare-fun e!114963 () Unit!5291)

(assert (=> d!52967 (= lt!86036 e!114963)))

(declare-fun c!31135 () Bool)

(assert (=> d!52967 (= c!31135 lt!86033)))

(assert (=> d!52967 (= lt!86033 (containsKey!187 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(assert (=> d!52967 (= (contains!1152 lt!85799 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!86034)))

(declare-fun b!174082 () Bool)

(declare-fun lt!86035 () Unit!5291)

(assert (=> b!174082 (= e!114963 lt!86035)))

(assert (=> b!174082 (= lt!86035 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(assert (=> b!174082 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174083 () Bool)

(declare-fun Unit!5327 () Unit!5291)

(assert (=> b!174083 (= e!114963 Unit!5327)))

(declare-fun b!174084 () Bool)

(assert (=> b!174084 (= e!114964 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85799) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52967 c!31135) b!174082))

(assert (= (and d!52967 (not c!31135)) b!174083))

(assert (= (and d!52967 (not res!82568)) b!174084))

(declare-fun m!202471 () Bool)

(assert (=> d!52967 m!202471))

(declare-fun m!202473 () Bool)

(assert (=> b!174082 m!202473))

(assert (=> b!174082 m!201607))

(assert (=> b!174082 m!201607))

(declare-fun m!202475 () Bool)

(assert (=> b!174082 m!202475))

(assert (=> b!174084 m!201607))

(assert (=> b!174084 m!201607))

(assert (=> b!174084 m!202475))

(assert (=> d!52559 d!52967))

(declare-fun b!174086 () Bool)

(declare-fun e!114965 () Option!189)

(declare-fun e!114966 () Option!189)

(assert (=> b!174086 (= e!114965 e!114966)))

(declare-fun c!31137 () Bool)

(assert (=> b!174086 (= c!31137 (and ((_ is Cons!2210) lt!85801) (not (= (_1!1629 (h!2827 lt!85801)) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174087 () Bool)

(assert (=> b!174087 (= e!114966 (getValueByKey!183 (t!7012 lt!85801) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174085 () Bool)

(assert (=> b!174085 (= e!114965 (Some!188 (_2!1629 (h!2827 lt!85801))))))

(declare-fun c!31136 () Bool)

(declare-fun d!52969 () Bool)

(assert (=> d!52969 (= c!31136 (and ((_ is Cons!2210) lt!85801) (= (_1!1629 (h!2827 lt!85801)) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(assert (=> d!52969 (= (getValueByKey!183 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) e!114965)))

(declare-fun b!174088 () Bool)

(assert (=> b!174088 (= e!114966 None!187)))

(assert (= (and d!52969 c!31136) b!174085))

(assert (= (and d!52969 (not c!31136)) b!174086))

(assert (= (and b!174086 c!31137) b!174087))

(assert (= (and b!174086 (not c!31137)) b!174088))

(declare-fun m!202477 () Bool)

(assert (=> b!174087 m!202477))

(assert (=> d!52559 d!52969))

(declare-fun d!52971 () Bool)

(assert (=> d!52971 (= (getValueByKey!183 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86037 () Unit!5291)

(assert (=> d!52971 (= lt!86037 (choose!936 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun e!114967 () Bool)

(assert (=> d!52971 e!114967))

(declare-fun res!82569 () Bool)

(assert (=> d!52971 (=> (not res!82569) (not e!114967))))

(assert (=> d!52971 (= res!82569 (isStrictlySorted!327 lt!85801))))

(assert (=> d!52971 (= (lemmaContainsTupThenGetReturnValue!99 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!86037)))

(declare-fun b!174089 () Bool)

(declare-fun res!82570 () Bool)

(assert (=> b!174089 (=> (not res!82570) (not e!114967))))

(assert (=> b!174089 (= res!82570 (containsKey!187 lt!85801 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174090 () Bool)

(assert (=> b!174090 (= e!114967 (contains!1155 lt!85801 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52971 res!82569) b!174089))

(assert (= (and b!174089 res!82570) b!174090))

(assert (=> d!52971 m!201601))

(declare-fun m!202479 () Bool)

(assert (=> d!52971 m!202479))

(declare-fun m!202481 () Bool)

(assert (=> d!52971 m!202481))

(declare-fun m!202483 () Bool)

(assert (=> b!174089 m!202483))

(declare-fun m!202485 () Bool)

(assert (=> b!174090 m!202485))

(assert (=> d!52559 d!52971))

(declare-fun b!174091 () Bool)

(declare-fun e!114970 () List!2214)

(declare-fun call!17630 () List!2214)

(assert (=> b!174091 (= e!114970 call!17630)))

(declare-fun b!174092 () Bool)

(declare-fun res!82572 () Bool)

(declare-fun e!114968 () Bool)

(assert (=> b!174092 (=> (not res!82572) (not e!114968))))

(declare-fun lt!86038 () List!2214)

(assert (=> b!174092 (= res!82572 (containsKey!187 lt!86038 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174093 () Bool)

(declare-fun e!114972 () List!2214)

(assert (=> b!174093 (= e!114972 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85636)) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))

(declare-fun b!174094 () Bool)

(assert (=> b!174094 (= e!114968 (contains!1155 lt!86038 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(declare-fun b!174095 () Bool)

(declare-fun c!31140 () Bool)

(declare-fun c!31139 () Bool)

(assert (=> b!174095 (= e!114972 (ite c!31140 (t!7012 (toList!1093 lt!85636)) (ite c!31139 (Cons!2210 (h!2827 (toList!1093 lt!85636)) (t!7012 (toList!1093 lt!85636))) Nil!2211)))))

(declare-fun call!17629 () List!2214)

(declare-fun bm!17626 () Bool)

(declare-fun c!31141 () Bool)

(assert (=> bm!17626 (= call!17629 ($colon$colon!97 e!114972 (ite c!31141 (h!2827 (toList!1093 lt!85636)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31138 () Bool)

(assert (=> bm!17626 (= c!31138 c!31141)))

(declare-fun b!174096 () Bool)

(assert (=> b!174096 (= c!31139 (and ((_ is Cons!2210) (toList!1093 lt!85636)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85636))) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(declare-fun e!114971 () List!2214)

(assert (=> b!174096 (= e!114971 e!114970)))

(declare-fun b!174097 () Bool)

(declare-fun e!114969 () List!2214)

(assert (=> b!174097 (= e!114969 call!17629)))

(declare-fun d!52973 () Bool)

(assert (=> d!52973 e!114968))

(declare-fun res!82571 () Bool)

(assert (=> d!52973 (=> (not res!82571) (not e!114968))))

(assert (=> d!52973 (= res!82571 (isStrictlySorted!327 lt!86038))))

(assert (=> d!52973 (= lt!86038 e!114969)))

(assert (=> d!52973 (= c!31141 (and ((_ is Cons!2210) (toList!1093 lt!85636)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85636))) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(assert (=> d!52973 (isStrictlySorted!327 (toList!1093 lt!85636))))

(assert (=> d!52973 (= (insertStrictlySorted!102 (toList!1093 lt!85636) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248)))) lt!86038)))

(declare-fun bm!17627 () Bool)

(declare-fun call!17631 () List!2214)

(assert (=> bm!17627 (= call!17630 call!17631)))

(declare-fun b!174098 () Bool)

(assert (=> b!174098 (= e!114970 call!17630)))

(declare-fun bm!17628 () Bool)

(assert (=> bm!17628 (= call!17631 call!17629)))

(declare-fun b!174099 () Bool)

(assert (=> b!174099 (= e!114969 e!114971)))

(assert (=> b!174099 (= c!31140 (and ((_ is Cons!2210) (toList!1093 lt!85636)) (= (_1!1629 (h!2827 (toList!1093 lt!85636))) (_1!1629 (tuple2!3237 lt!85642 (minValue!3440 thiss!1248))))))))

(declare-fun b!174100 () Bool)

(assert (=> b!174100 (= e!114971 call!17631)))

(assert (= (and d!52973 c!31141) b!174097))

(assert (= (and d!52973 (not c!31141)) b!174099))

(assert (= (and b!174099 c!31140) b!174100))

(assert (= (and b!174099 (not c!31140)) b!174096))

(assert (= (and b!174096 c!31139) b!174091))

(assert (= (and b!174096 (not c!31139)) b!174098))

(assert (= (or b!174091 b!174098) bm!17627))

(assert (= (or b!174100 bm!17627) bm!17628))

(assert (= (or b!174097 bm!17628) bm!17626))

(assert (= (and bm!17626 c!31138) b!174093))

(assert (= (and bm!17626 (not c!31138)) b!174095))

(assert (= (and d!52973 res!82571) b!174092))

(assert (= (and b!174092 res!82572) b!174094))

(declare-fun m!202487 () Bool)

(assert (=> d!52973 m!202487))

(declare-fun m!202489 () Bool)

(assert (=> d!52973 m!202489))

(declare-fun m!202491 () Bool)

(assert (=> b!174094 m!202491))

(declare-fun m!202493 () Bool)

(assert (=> b!174093 m!202493))

(declare-fun m!202495 () Bool)

(assert (=> bm!17626 m!202495))

(declare-fun m!202497 () Bool)

(assert (=> b!174092 m!202497))

(assert (=> d!52559 d!52973))

(declare-fun d!52975 () Bool)

(assert (=> d!52975 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85630) lt!85647)) (v!3950 (getValueByKey!183 (toList!1093 lt!85630) lt!85647)))))

(assert (=> d!52577 d!52975))

(declare-fun b!174102 () Bool)

(declare-fun e!114973 () Option!189)

(declare-fun e!114974 () Option!189)

(assert (=> b!174102 (= e!114973 e!114974)))

(declare-fun c!31143 () Bool)

(assert (=> b!174102 (= c!31143 (and ((_ is Cons!2210) (toList!1093 lt!85630)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85630))) lt!85647))))))

(declare-fun b!174103 () Bool)

(assert (=> b!174103 (= e!114974 (getValueByKey!183 (t!7012 (toList!1093 lt!85630)) lt!85647))))

(declare-fun b!174101 () Bool)

(assert (=> b!174101 (= e!114973 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85630)))))))

(declare-fun d!52977 () Bool)

(declare-fun c!31142 () Bool)

(assert (=> d!52977 (= c!31142 (and ((_ is Cons!2210) (toList!1093 lt!85630)) (= (_1!1629 (h!2827 (toList!1093 lt!85630))) lt!85647)))))

(assert (=> d!52977 (= (getValueByKey!183 (toList!1093 lt!85630) lt!85647) e!114973)))

(declare-fun b!174104 () Bool)

(assert (=> b!174104 (= e!114974 None!187)))

(assert (= (and d!52977 c!31142) b!174101))

(assert (= (and d!52977 (not c!31142)) b!174102))

(assert (= (and b!174102 c!31143) b!174103))

(assert (= (and b!174102 (not c!31143)) b!174104))

(declare-fun m!202499 () Bool)

(assert (=> b!174103 m!202499))

(assert (=> d!52577 d!52977))

(declare-fun d!52979 () Bool)

(assert (=> d!52979 (= (apply!130 lt!85704 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (get!1963 (getValueByKey!183 (toList!1093 lt!85704) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7173 () Bool)

(assert (= bs!7173 d!52979))

(assert (=> bs!7173 m!201133))

(declare-fun m!202501 () Bool)

(assert (=> bs!7173 m!202501))

(assert (=> bs!7173 m!202501))

(declare-fun m!202503 () Bool)

(assert (=> bs!7173 m!202503))

(assert (=> b!173353 d!52979))

(assert (=> b!173353 d!52477))

(declare-fun d!52981 () Bool)

(declare-fun e!114975 () Bool)

(assert (=> d!52981 e!114975))

(declare-fun res!82574 () Bool)

(assert (=> d!52981 (=> (not res!82574) (not e!114975))))

(declare-fun lt!86040 () ListLongMap!2155)

(assert (=> d!52981 (= res!82574 (contains!1152 lt!86040 (_1!1629 (tuple2!3237 lt!85811 lt!85817))))))

(declare-fun lt!86042 () List!2214)

(assert (=> d!52981 (= lt!86040 (ListLongMap!2156 lt!86042))))

(declare-fun lt!86041 () Unit!5291)

(declare-fun lt!86039 () Unit!5291)

(assert (=> d!52981 (= lt!86041 lt!86039)))

(assert (=> d!52981 (= (getValueByKey!183 lt!86042 (_1!1629 (tuple2!3237 lt!85811 lt!85817))) (Some!188 (_2!1629 (tuple2!3237 lt!85811 lt!85817))))))

(assert (=> d!52981 (= lt!86039 (lemmaContainsTupThenGetReturnValue!99 lt!86042 (_1!1629 (tuple2!3237 lt!85811 lt!85817)) (_2!1629 (tuple2!3237 lt!85811 lt!85817))))))

(assert (=> d!52981 (= lt!86042 (insertStrictlySorted!102 (toList!1093 lt!85814) (_1!1629 (tuple2!3237 lt!85811 lt!85817)) (_2!1629 (tuple2!3237 lt!85811 lt!85817))))))

(assert (=> d!52981 (= (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817)) lt!86040)))

(declare-fun b!174105 () Bool)

(declare-fun res!82573 () Bool)

(assert (=> b!174105 (=> (not res!82573) (not e!114975))))

(assert (=> b!174105 (= res!82573 (= (getValueByKey!183 (toList!1093 lt!86040) (_1!1629 (tuple2!3237 lt!85811 lt!85817))) (Some!188 (_2!1629 (tuple2!3237 lt!85811 lt!85817)))))))

(declare-fun b!174106 () Bool)

(assert (=> b!174106 (= e!114975 (contains!1155 (toList!1093 lt!86040) (tuple2!3237 lt!85811 lt!85817)))))

(assert (= (and d!52981 res!82574) b!174105))

(assert (= (and b!174105 res!82573) b!174106))

(declare-fun m!202505 () Bool)

(assert (=> d!52981 m!202505))

(declare-fun m!202507 () Bool)

(assert (=> d!52981 m!202507))

(declare-fun m!202509 () Bool)

(assert (=> d!52981 m!202509))

(declare-fun m!202511 () Bool)

(assert (=> d!52981 m!202511))

(declare-fun m!202513 () Bool)

(assert (=> b!174105 m!202513))

(declare-fun m!202515 () Bool)

(assert (=> b!174106 m!202515))

(assert (=> b!173499 d!52981))

(declare-fun d!52983 () Bool)

(declare-fun e!114976 () Bool)

(assert (=> d!52983 e!114976))

(declare-fun res!82576 () Bool)

(assert (=> d!52983 (=> (not res!82576) (not e!114976))))

(declare-fun lt!86044 () ListLongMap!2155)

(assert (=> d!52983 (= res!82576 (contains!1152 lt!86044 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!86046 () List!2214)

(assert (=> d!52983 (= lt!86044 (ListLongMap!2156 lt!86046))))

(declare-fun lt!86045 () Unit!5291)

(declare-fun lt!86043 () Unit!5291)

(assert (=> d!52983 (= lt!86045 lt!86043)))

(assert (=> d!52983 (= (getValueByKey!183 lt!86046 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52983 (= lt!86043 (lemmaContainsTupThenGetReturnValue!99 lt!86046 (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52983 (= lt!86046 (insertStrictlySorted!102 (toList!1093 call!17584) (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52983 (= (+!240 call!17584 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!86044)))

(declare-fun b!174107 () Bool)

(declare-fun res!82575 () Bool)

(assert (=> b!174107 (=> (not res!82575) (not e!114976))))

(assert (=> b!174107 (= res!82575 (= (getValueByKey!183 (toList!1093 lt!86044) (_1!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1629 (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!174108 () Bool)

(assert (=> b!174108 (= e!114976 (contains!1155 (toList!1093 lt!86044) (tuple2!3237 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (get!1962 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52983 res!82576) b!174107))

(assert (= (and b!174107 res!82575) b!174108))

(declare-fun m!202517 () Bool)

(assert (=> d!52983 m!202517))

(declare-fun m!202519 () Bool)

(assert (=> d!52983 m!202519))

(declare-fun m!202521 () Bool)

(assert (=> d!52983 m!202521))

(declare-fun m!202523 () Bool)

(assert (=> d!52983 m!202523))

(declare-fun m!202525 () Bool)

(assert (=> b!174107 m!202525))

(declare-fun m!202527 () Bool)

(assert (=> b!174108 m!202527))

(assert (=> b!173499 d!52983))

(declare-fun d!52985 () Bool)

(assert (=> d!52985 (not (contains!1152 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817)) lt!85813))))

(declare-fun lt!86047 () Unit!5291)

(assert (=> d!52985 (= lt!86047 (choose!940 lt!85814 lt!85811 lt!85817 lt!85813))))

(declare-fun e!114977 () Bool)

(assert (=> d!52985 e!114977))

(declare-fun res!82577 () Bool)

(assert (=> d!52985 (=> (not res!82577) (not e!114977))))

(assert (=> d!52985 (= res!82577 (not (contains!1152 lt!85814 lt!85813)))))

(assert (=> d!52985 (= (addStillNotContains!73 lt!85814 lt!85811 lt!85817 lt!85813) lt!86047)))

(declare-fun b!174109 () Bool)

(assert (=> b!174109 (= e!114977 (not (= lt!85811 lt!85813)))))

(assert (= (and d!52985 res!82577) b!174109))

(assert (=> d!52985 m!201653))

(assert (=> d!52985 m!201653))

(assert (=> d!52985 m!201657))

(declare-fun m!202529 () Bool)

(assert (=> d!52985 m!202529))

(declare-fun m!202531 () Bool)

(assert (=> d!52985 m!202531))

(assert (=> b!173499 d!52985))

(declare-fun d!52987 () Bool)

(declare-fun e!114979 () Bool)

(assert (=> d!52987 e!114979))

(declare-fun res!82578 () Bool)

(assert (=> d!52987 (=> res!82578 e!114979)))

(declare-fun lt!86049 () Bool)

(assert (=> d!52987 (= res!82578 (not lt!86049))))

(declare-fun lt!86048 () Bool)

(assert (=> d!52987 (= lt!86049 lt!86048)))

(declare-fun lt!86051 () Unit!5291)

(declare-fun e!114978 () Unit!5291)

(assert (=> d!52987 (= lt!86051 e!114978)))

(declare-fun c!31144 () Bool)

(assert (=> d!52987 (= c!31144 lt!86048)))

(assert (=> d!52987 (= lt!86048 (containsKey!187 (toList!1093 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817))) lt!85813))))

(assert (=> d!52987 (= (contains!1152 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817)) lt!85813) lt!86049)))

(declare-fun b!174110 () Bool)

(declare-fun lt!86050 () Unit!5291)

(assert (=> b!174110 (= e!114978 lt!86050)))

(assert (=> b!174110 (= lt!86050 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817))) lt!85813))))

(assert (=> b!174110 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817))) lt!85813))))

(declare-fun b!174111 () Bool)

(declare-fun Unit!5328 () Unit!5291)

(assert (=> b!174111 (= e!114978 Unit!5328)))

(declare-fun b!174112 () Bool)

(assert (=> b!174112 (= e!114979 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85814 (tuple2!3237 lt!85811 lt!85817))) lt!85813)))))

(assert (= (and d!52987 c!31144) b!174110))

(assert (= (and d!52987 (not c!31144)) b!174111))

(assert (= (and d!52987 (not res!82578)) b!174112))

(declare-fun m!202533 () Bool)

(assert (=> d!52987 m!202533))

(declare-fun m!202535 () Bool)

(assert (=> b!174110 m!202535))

(declare-fun m!202537 () Bool)

(assert (=> b!174110 m!202537))

(assert (=> b!174110 m!202537))

(declare-fun m!202539 () Bool)

(assert (=> b!174110 m!202539))

(assert (=> b!174112 m!202537))

(assert (=> b!174112 m!202537))

(assert (=> b!174112 m!202539))

(assert (=> b!173499 d!52987))

(assert (=> b!173499 d!52477))

(declare-fun d!52989 () Bool)

(declare-fun e!114981 () Bool)

(assert (=> d!52989 e!114981))

(declare-fun res!82579 () Bool)

(assert (=> d!52989 (=> res!82579 e!114981)))

(declare-fun lt!86053 () Bool)

(assert (=> d!52989 (= res!82579 (not lt!86053))))

(declare-fun lt!86052 () Bool)

(assert (=> d!52989 (= lt!86053 lt!86052)))

(declare-fun lt!86055 () Unit!5291)

(declare-fun e!114980 () Unit!5291)

(assert (=> d!52989 (= lt!86055 e!114980)))

(declare-fun c!31145 () Bool)

(assert (=> d!52989 (= c!31145 lt!86052)))

(assert (=> d!52989 (= lt!86052 (containsKey!187 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52989 (= (contains!1152 lt!85745 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86053)))

(declare-fun b!174113 () Bool)

(declare-fun lt!86054 () Unit!5291)

(assert (=> b!174113 (= e!114980 lt!86054)))

(assert (=> b!174113 (= lt!86054 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> b!174113 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174114 () Bool)

(declare-fun Unit!5329 () Unit!5291)

(assert (=> b!174114 (= e!114980 Unit!5329)))

(declare-fun b!174115 () Bool)

(assert (=> b!174115 (= e!114981 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (= (and d!52989 c!31145) b!174113))

(assert (= (and d!52989 (not c!31145)) b!174114))

(assert (= (and d!52989 (not res!82579)) b!174115))

(declare-fun m!202541 () Bool)

(assert (=> d!52989 m!202541))

(declare-fun m!202543 () Bool)

(assert (=> b!174113 m!202543))

(assert (=> b!174113 m!201435))

(assert (=> b!174113 m!201435))

(declare-fun m!202545 () Bool)

(assert (=> b!174113 m!202545))

(assert (=> b!174115 m!201435))

(assert (=> b!174115 m!201435))

(assert (=> b!174115 m!202545))

(assert (=> d!52505 d!52989))

(declare-fun b!174117 () Bool)

(declare-fun e!114982 () Option!189)

(declare-fun e!114983 () Option!189)

(assert (=> b!174117 (= e!114982 e!114983)))

(declare-fun c!31147 () Bool)

(assert (=> b!174117 (= c!31147 (and ((_ is Cons!2210) lt!85747) (not (= (_1!1629 (h!2827 lt!85747)) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174118 () Bool)

(assert (=> b!174118 (= e!114983 (getValueByKey!183 (t!7012 lt!85747) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174116 () Bool)

(assert (=> b!174116 (= e!114982 (Some!188 (_2!1629 (h!2827 lt!85747))))))

(declare-fun d!52991 () Bool)

(declare-fun c!31146 () Bool)

(assert (=> d!52991 (= c!31146 (and ((_ is Cons!2210) lt!85747) (= (_1!1629 (h!2827 lt!85747)) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!52991 (= (getValueByKey!183 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) e!114982)))

(declare-fun b!174119 () Bool)

(assert (=> b!174119 (= e!114983 None!187)))

(assert (= (and d!52991 c!31146) b!174116))

(assert (= (and d!52991 (not c!31146)) b!174117))

(assert (= (and b!174117 c!31147) b!174118))

(assert (= (and b!174117 (not c!31147)) b!174119))

(declare-fun m!202547 () Bool)

(assert (=> b!174118 m!202547))

(assert (=> d!52505 d!52991))

(declare-fun d!52993 () Bool)

(assert (=> d!52993 (= (getValueByKey!183 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!188 (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun lt!86056 () Unit!5291)

(assert (=> d!52993 (= lt!86056 (choose!936 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun e!114984 () Bool)

(assert (=> d!52993 e!114984))

(declare-fun res!82580 () Bool)

(assert (=> d!52993 (=> (not res!82580) (not e!114984))))

(assert (=> d!52993 (= res!82580 (isStrictlySorted!327 lt!85747))))

(assert (=> d!52993 (= (lemmaContainsTupThenGetReturnValue!99 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86056)))

(declare-fun b!174120 () Bool)

(declare-fun res!82581 () Bool)

(assert (=> b!174120 (=> (not res!82581) (not e!114984))))

(assert (=> b!174120 (= res!82581 (containsKey!187 lt!85747 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174121 () Bool)

(assert (=> b!174121 (= e!114984 (contains!1155 lt!85747 (tuple2!3237 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (= (and d!52993 res!82580) b!174120))

(assert (= (and b!174120 res!82581) b!174121))

(assert (=> d!52993 m!201429))

(declare-fun m!202549 () Bool)

(assert (=> d!52993 m!202549))

(declare-fun m!202551 () Bool)

(assert (=> d!52993 m!202551))

(declare-fun m!202553 () Bool)

(assert (=> b!174120 m!202553))

(declare-fun m!202555 () Bool)

(assert (=> b!174121 m!202555))

(assert (=> d!52505 d!52993))

(declare-fun b!174122 () Bool)

(declare-fun e!114987 () List!2214)

(declare-fun call!17633 () List!2214)

(assert (=> b!174122 (= e!114987 call!17633)))

(declare-fun b!174123 () Bool)

(declare-fun res!82583 () Bool)

(declare-fun e!114985 () Bool)

(assert (=> b!174123 (=> (not res!82583) (not e!114985))))

(declare-fun lt!86057 () List!2214)

(assert (=> b!174123 (= res!82583 (containsKey!187 lt!86057 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun e!114989 () List!2214)

(declare-fun b!174124 () Bool)

(assert (=> b!174124 (= e!114989 (insertStrictlySorted!102 (t!7012 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174125 () Bool)

(assert (=> b!174125 (= e!114985 (contains!1155 lt!86057 (tuple2!3237 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31150 () Bool)

(declare-fun c!31149 () Bool)

(declare-fun b!174126 () Bool)

(assert (=> b!174126 (= e!114989 (ite c!31150 (t!7012 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (ite c!31149 (Cons!2210 (h!2827 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (t!7012 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))))) Nil!2211)))))

(declare-fun call!17632 () List!2214)

(declare-fun bm!17629 () Bool)

(declare-fun c!31151 () Bool)

(assert (=> bm!17629 (= call!17632 ($colon$colon!97 e!114989 (ite c!31151 (h!2827 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (tuple2!3237 (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun c!31148 () Bool)

(assert (=> bm!17629 (= c!31148 c!31151)))

(declare-fun b!174127 () Bool)

(assert (=> b!174127 (= c!31149 (and ((_ is Cons!2210) (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (bvsgt (_1!1629 (h!2827 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun e!114988 () List!2214)

(assert (=> b!174127 (= e!114988 e!114987)))

(declare-fun b!174128 () Bool)

(declare-fun e!114986 () List!2214)

(assert (=> b!174128 (= e!114986 call!17632)))

(declare-fun d!52995 () Bool)

(assert (=> d!52995 e!114985))

(declare-fun res!82582 () Bool)

(assert (=> d!52995 (=> (not res!82582) (not e!114985))))

(assert (=> d!52995 (= res!82582 (isStrictlySorted!327 lt!86057))))

(assert (=> d!52995 (= lt!86057 e!114986)))

(assert (=> d!52995 (= c!31151 (and ((_ is Cons!2210) (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (bvslt (_1!1629 (h!2827 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!52995 (isStrictlySorted!327 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))))))

(assert (=> d!52995 (= (insertStrictlySorted!102 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86057)))

(declare-fun bm!17630 () Bool)

(declare-fun call!17634 () List!2214)

(assert (=> bm!17630 (= call!17633 call!17634)))

(declare-fun b!174129 () Bool)

(assert (=> b!174129 (= e!114987 call!17633)))

(declare-fun bm!17631 () Bool)

(assert (=> bm!17631 (= call!17634 call!17632)))

(declare-fun b!174130 () Bool)

(assert (=> b!174130 (= e!114986 e!114988)))

(assert (=> b!174130 (= c!31150 (and ((_ is Cons!2210) (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551)))) (= (_1!1629 (h!2827 (toList!1093 (ite c!30888 call!17552 (ite c!30891 call!17550 call!17551))))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174131 () Bool)

(assert (=> b!174131 (= e!114988 call!17634)))

(assert (= (and d!52995 c!31151) b!174128))

(assert (= (and d!52995 (not c!31151)) b!174130))

(assert (= (and b!174130 c!31150) b!174131))

(assert (= (and b!174130 (not c!31150)) b!174127))

(assert (= (and b!174127 c!31149) b!174122))

(assert (= (and b!174127 (not c!31149)) b!174129))

(assert (= (or b!174122 b!174129) bm!17630))

(assert (= (or b!174131 bm!17630) bm!17631))

(assert (= (or b!174128 bm!17631) bm!17629))

(assert (= (and bm!17629 c!31148) b!174124))

(assert (= (and bm!17629 (not c!31148)) b!174126))

(assert (= (and d!52995 res!82582) b!174123))

(assert (= (and b!174123 res!82583) b!174125))

(declare-fun m!202557 () Bool)

(assert (=> d!52995 m!202557))

(declare-fun m!202559 () Bool)

(assert (=> d!52995 m!202559))

(declare-fun m!202561 () Bool)

(assert (=> b!174125 m!202561))

(declare-fun m!202563 () Bool)

(assert (=> b!174124 m!202563))

(declare-fun m!202565 () Bool)

(assert (=> bm!17629 m!202565))

(declare-fun m!202567 () Bool)

(assert (=> b!174123 m!202567))

(assert (=> d!52505 d!52995))

(assert (=> b!173494 d!52765))

(assert (=> b!173494 d!52767))

(declare-fun d!52997 () Bool)

(assert (=> d!52997 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))) lt!85674)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))) lt!85674)))))

(assert (=> d!52535 d!52997))

(declare-fun b!174133 () Bool)

(declare-fun e!114990 () Option!189)

(declare-fun e!114991 () Option!189)

(assert (=> b!174133 (= e!114990 e!114991)))

(declare-fun c!31153 () Bool)

(assert (=> b!174133 (= c!31153 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))))) lt!85674))))))

(declare-fun b!174134 () Bool)

(assert (=> b!174134 (= e!114991 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)))) lt!85674))))

(declare-fun b!174132 () Bool)

(assert (=> b!174132 (= e!114990 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)))))))))

(declare-fun c!31152 () Bool)

(declare-fun d!52999 () Bool)

(assert (=> d!52999 (= c!31152 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309)))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))))) lt!85674)))))

(assert (=> d!52999 (= (getValueByKey!183 (toList!1093 (+!240 lt!85662 (tuple2!3237 lt!85668 v!309))) lt!85674) e!114990)))

(declare-fun b!174135 () Bool)

(assert (=> b!174135 (= e!114991 None!187)))

(assert (= (and d!52999 c!31152) b!174132))

(assert (= (and d!52999 (not c!31152)) b!174133))

(assert (= (and b!174133 c!31153) b!174134))

(assert (= (and b!174133 (not c!31153)) b!174135))

(declare-fun m!202569 () Bool)

(assert (=> b!174134 m!202569))

(assert (=> d!52535 d!52999))

(declare-fun b!174137 () Bool)

(declare-fun e!114992 () Option!189)

(declare-fun e!114993 () Option!189)

(assert (=> b!174137 (= e!114992 e!114993)))

(declare-fun c!31155 () Bool)

(assert (=> b!174137 (= c!31155 (and ((_ is Cons!2210) (toList!1093 lt!85851)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85851))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174138 () Bool)

(assert (=> b!174138 (= e!114993 (getValueByKey!183 (t!7012 (toList!1093 lt!85851)) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174136 () Bool)

(assert (=> b!174136 (= e!114992 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85851)))))))

(declare-fun c!31154 () Bool)

(declare-fun d!53001 () Bool)

(assert (=> d!53001 (= c!31154 (and ((_ is Cons!2210) (toList!1093 lt!85851)) (= (_1!1629 (h!2827 (toList!1093 lt!85851))) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53001 (= (getValueByKey!183 (toList!1093 lt!85851) (_1!1629 (ite (or c!30894 c!30897) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!114992)))

(declare-fun b!174139 () Bool)

(assert (=> b!174139 (= e!114993 None!187)))

(assert (= (and d!53001 c!31154) b!174136))

(assert (= (and d!53001 (not c!31154)) b!174137))

(assert (= (and b!174137 c!31155) b!174138))

(assert (= (and b!174137 (not c!31155)) b!174139))

(declare-fun m!202571 () Bool)

(assert (=> b!174138 m!202571))

(assert (=> b!173579 d!53001))

(declare-fun b!174140 () Bool)

(declare-fun e!114994 () (_ BitVec 32))

(assert (=> b!174140 (= e!114994 #b00000000000000000000000000000000)))

(declare-fun b!174141 () Bool)

(declare-fun e!114995 () (_ BitVec 32))

(assert (=> b!174141 (= e!114994 e!114995)))

(declare-fun c!31156 () Bool)

(assert (=> b!174141 (= c!31156 (validKeyInArray!0 (select (arr!3454 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174142 () Bool)

(declare-fun call!17635 () (_ BitVec 32))

(assert (=> b!174142 (= e!114995 call!17635)))

(declare-fun bm!17632 () Bool)

(assert (=> bm!17632 (= call!17635 (arrayCountValidKeys!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(declare-fun d!53003 () Bool)

(declare-fun lt!86058 () (_ BitVec 32))

(assert (=> d!53003 (and (bvsge lt!86058 #b00000000000000000000000000000000) (bvsle lt!86058 (bvsub (size!3754 (_keys!5437 lt!85539)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!53003 (= lt!86058 e!114994)))

(declare-fun c!31157 () Bool)

(assert (=> d!53003 (= c!31157 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!53003 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3754 (_keys!5437 lt!85539)) (size!3754 (_keys!5437 lt!85539))))))

(assert (=> d!53003 (= (arrayCountValidKeys!0 (_keys!5437 lt!85539) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 lt!85539))) lt!86058)))

(declare-fun b!174143 () Bool)

(assert (=> b!174143 (= e!114995 (bvadd #b00000000000000000000000000000001 call!17635))))

(assert (= (and d!53003 c!31157) b!174140))

(assert (= (and d!53003 (not c!31157)) b!174141))

(assert (= (and b!174141 c!31156) b!174143))

(assert (= (and b!174141 (not c!31156)) b!174142))

(assert (= (or b!174143 b!174142) bm!17632))

(assert (=> b!174141 m!202373))

(assert (=> b!174141 m!202373))

(assert (=> b!174141 m!202375))

(declare-fun m!202573 () Bool)

(assert (=> bm!17632 m!202573))

(assert (=> bm!17593 d!53003))

(declare-fun d!53005 () Bool)

(assert (=> d!53005 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3950 (getValueByKey!183 (toList!1093 lt!85663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52583 d!53005))

(assert (=> d!52583 d!52653))

(declare-fun d!53007 () Bool)

(declare-fun lt!86059 () Bool)

(assert (=> d!53007 (= lt!86059 (select (content!149 (toList!1093 lt!85820)) (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))

(declare-fun e!114997 () Bool)

(assert (=> d!53007 (= lt!86059 e!114997)))

(declare-fun res!82584 () Bool)

(assert (=> d!53007 (=> (not res!82584) (not e!114997))))

(assert (=> d!53007 (= res!82584 ((_ is Cons!2210) (toList!1093 lt!85820)))))

(assert (=> d!53007 (= (contains!1155 (toList!1093 lt!85820) (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) lt!86059)))

(declare-fun b!174144 () Bool)

(declare-fun e!114996 () Bool)

(assert (=> b!174144 (= e!114997 e!114996)))

(declare-fun res!82585 () Bool)

(assert (=> b!174144 (=> res!82585 e!114996)))

(assert (=> b!174144 (= res!82585 (= (h!2827 (toList!1093 lt!85820)) (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))

(declare-fun b!174145 () Bool)

(assert (=> b!174145 (= e!114996 (contains!1155 (t!7012 (toList!1093 lt!85820)) (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))

(assert (= (and d!53007 res!82584) b!174144))

(assert (= (and b!174144 (not res!82585)) b!174145))

(declare-fun m!202575 () Bool)

(assert (=> d!53007 m!202575))

(declare-fun m!202577 () Bool)

(assert (=> d!53007 m!202577))

(declare-fun m!202579 () Bool)

(assert (=> b!174145 m!202579))

(assert (=> b!173509 d!53007))

(declare-fun d!53009 () Bool)

(declare-fun e!114998 () Bool)

(assert (=> d!53009 e!114998))

(declare-fun res!82587 () Bool)

(assert (=> d!53009 (=> (not res!82587) (not e!114998))))

(declare-fun lt!86061 () ListLongMap!2155)

(assert (=> d!53009 (= res!82587 (contains!1152 lt!86061 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(declare-fun lt!86063 () List!2214)

(assert (=> d!53009 (= lt!86061 (ListLongMap!2156 lt!86063))))

(declare-fun lt!86062 () Unit!5291)

(declare-fun lt!86060 () Unit!5291)

(assert (=> d!53009 (= lt!86062 lt!86060)))

(assert (=> d!53009 (= (getValueByKey!183 lt!86063 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(assert (=> d!53009 (= lt!86060 (lemmaContainsTupThenGetReturnValue!99 lt!86063 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(assert (=> d!53009 (= lt!86063 (insertStrictlySorted!102 (toList!1093 call!17571) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))))))

(assert (=> d!53009 (= (+!240 call!17571 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))) lt!86061)))

(declare-fun b!174146 () Bool)

(declare-fun res!82586 () Bool)

(assert (=> b!174146 (=> (not res!82586) (not e!114998))))

(assert (=> b!174146 (= res!82586 (= (getValueByKey!183 (toList!1093 lt!86061) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))))

(declare-fun b!174147 () Bool)

(assert (=> b!174147 (= e!114998 (contains!1155 (toList!1093 lt!86061) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85539))))))

(assert (= (and d!53009 res!82587) b!174146))

(assert (= (and b!174146 res!82586) b!174147))

(declare-fun m!202581 () Bool)

(assert (=> d!53009 m!202581))

(declare-fun m!202583 () Bool)

(assert (=> d!53009 m!202583))

(declare-fun m!202585 () Bool)

(assert (=> d!53009 m!202585))

(declare-fun m!202587 () Bool)

(assert (=> d!53009 m!202587))

(declare-fun m!202589 () Bool)

(assert (=> b!174146 m!202589))

(declare-fun m!202591 () Bool)

(assert (=> b!174147 m!202591))

(assert (=> b!173364 d!53009))

(declare-fun lt!86064 () Bool)

(declare-fun d!53011 () Bool)

(assert (=> d!53011 (= lt!86064 (select (content!149 (toList!1093 lt!85765)) (tuple2!3237 lt!85671 v!309)))))

(declare-fun e!115000 () Bool)

(assert (=> d!53011 (= lt!86064 e!115000)))

(declare-fun res!82588 () Bool)

(assert (=> d!53011 (=> (not res!82588) (not e!115000))))

(assert (=> d!53011 (= res!82588 ((_ is Cons!2210) (toList!1093 lt!85765)))))

(assert (=> d!53011 (= (contains!1155 (toList!1093 lt!85765) (tuple2!3237 lt!85671 v!309)) lt!86064)))

(declare-fun b!174148 () Bool)

(declare-fun e!114999 () Bool)

(assert (=> b!174148 (= e!115000 e!114999)))

(declare-fun res!82589 () Bool)

(assert (=> b!174148 (=> res!82589 e!114999)))

(assert (=> b!174148 (= res!82589 (= (h!2827 (toList!1093 lt!85765)) (tuple2!3237 lt!85671 v!309)))))

(declare-fun b!174149 () Bool)

(assert (=> b!174149 (= e!114999 (contains!1155 (t!7012 (toList!1093 lt!85765)) (tuple2!3237 lt!85671 v!309)))))

(assert (= (and d!53011 res!82588) b!174148))

(assert (= (and b!174148 (not res!82589)) b!174149))

(declare-fun m!202593 () Bool)

(assert (=> d!53011 m!202593))

(declare-fun m!202595 () Bool)

(assert (=> d!53011 m!202595))

(declare-fun m!202597 () Bool)

(assert (=> b!174149 m!202597))

(assert (=> b!173459 d!53011))

(assert (=> b!173455 d!52783))

(assert (=> b!173455 d!52785))

(assert (=> b!173349 d!52479))

(declare-fun d!53013 () Bool)

(declare-fun e!115002 () Bool)

(assert (=> d!53013 e!115002))

(declare-fun res!82590 () Bool)

(assert (=> d!53013 (=> res!82590 e!115002)))

(declare-fun lt!86066 () Bool)

(assert (=> d!53013 (= res!82590 (not lt!86066))))

(declare-fun lt!86065 () Bool)

(assert (=> d!53013 (= lt!86066 lt!86065)))

(declare-fun lt!86068 () Unit!5291)

(declare-fun e!115001 () Unit!5291)

(assert (=> d!53013 (= lt!86068 e!115001)))

(declare-fun c!31158 () Bool)

(assert (=> d!53013 (= c!31158 lt!86065)))

(assert (=> d!53013 (= lt!86065 (containsKey!187 (toList!1093 lt!85704) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53013 (= (contains!1152 lt!85704 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!86066)))

(declare-fun b!174150 () Bool)

(declare-fun lt!86067 () Unit!5291)

(assert (=> b!174150 (= e!115001 lt!86067)))

(assert (=> b!174150 (= lt!86067 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85704) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174150 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174151 () Bool)

(declare-fun Unit!5330 () Unit!5291)

(assert (=> b!174151 (= e!115001 Unit!5330)))

(declare-fun b!174152 () Bool)

(assert (=> b!174152 (= e!115002 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85704) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53013 c!31158) b!174150))

(assert (= (and d!53013 (not c!31158)) b!174151))

(assert (= (and d!53013 (not res!82590)) b!174152))

(assert (=> d!53013 m!201133))

(declare-fun m!202599 () Bool)

(assert (=> d!53013 m!202599))

(assert (=> b!174150 m!201133))

(declare-fun m!202601 () Bool)

(assert (=> b!174150 m!202601))

(assert (=> b!174150 m!201133))

(assert (=> b!174150 m!202501))

(assert (=> b!174150 m!202501))

(declare-fun m!202603 () Bool)

(assert (=> b!174150 m!202603))

(assert (=> b!174152 m!201133))

(assert (=> b!174152 m!202501))

(assert (=> b!174152 m!202501))

(assert (=> b!174152 m!202603))

(assert (=> b!173345 d!53013))

(declare-fun d!53015 () Bool)

(declare-fun res!82591 () Bool)

(declare-fun e!115003 () Bool)

(assert (=> d!53015 (=> res!82591 e!115003)))

(assert (=> d!53015 (= res!82591 (and ((_ is Cons!2210) (toList!1093 lt!85637)) (= (_1!1629 (h!2827 (toList!1093 lt!85637))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53015 (= (containsKey!187 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000) e!115003)))

(declare-fun b!174153 () Bool)

(declare-fun e!115004 () Bool)

(assert (=> b!174153 (= e!115003 e!115004)))

(declare-fun res!82592 () Bool)

(assert (=> b!174153 (=> (not res!82592) (not e!115004))))

(assert (=> b!174153 (= res!82592 (and (or (not ((_ is Cons!2210) (toList!1093 lt!85637))) (bvsle (_1!1629 (h!2827 (toList!1093 lt!85637))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2210) (toList!1093 lt!85637)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85637))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174154 () Bool)

(assert (=> b!174154 (= e!115004 (containsKey!187 (t!7012 (toList!1093 lt!85637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53015 (not res!82591)) b!174153))

(assert (= (and b!174153 res!82592) b!174154))

(declare-fun m!202605 () Bool)

(assert (=> b!174154 m!202605))

(assert (=> d!52465 d!53015))

(declare-fun lt!86069 () Bool)

(declare-fun d!53017 () Bool)

(assert (=> d!53017 (= lt!86069 (select (content!149 (toList!1093 lt!85753)) (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))

(declare-fun e!115006 () Bool)

(assert (=> d!53017 (= lt!86069 e!115006)))

(declare-fun res!82593 () Bool)

(assert (=> d!53017 (=> (not res!82593) (not e!115006))))

(assert (=> d!53017 (= res!82593 ((_ is Cons!2210) (toList!1093 lt!85753)))))

(assert (=> d!53017 (= (contains!1155 (toList!1093 lt!85753) (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!86069)))

(declare-fun b!174155 () Bool)

(declare-fun e!115005 () Bool)

(assert (=> b!174155 (= e!115006 e!115005)))

(declare-fun res!82594 () Bool)

(assert (=> b!174155 (=> res!82594 e!115005)))

(assert (=> b!174155 (= res!82594 (= (h!2827 (toList!1093 lt!85753)) (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))

(declare-fun b!174156 () Bool)

(assert (=> b!174156 (= e!115005 (contains!1155 (t!7012 (toList!1093 lt!85753)) (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!53017 res!82593) b!174155))

(assert (= (and b!174155 (not res!82594)) b!174156))

(declare-fun m!202607 () Bool)

(assert (=> d!53017 m!202607))

(declare-fun m!202609 () Bool)

(assert (=> d!53017 m!202609))

(declare-fun m!202611 () Bool)

(assert (=> b!174156 m!202611))

(assert (=> b!173452 d!53017))

(declare-fun d!53019 () Bool)

(declare-fun e!115008 () Bool)

(assert (=> d!53019 e!115008))

(declare-fun res!82595 () Bool)

(assert (=> d!53019 (=> res!82595 e!115008)))

(declare-fun lt!86071 () Bool)

(assert (=> d!53019 (= res!82595 (not lt!86071))))

(declare-fun lt!86070 () Bool)

(assert (=> d!53019 (= lt!86071 lt!86070)))

(declare-fun lt!86073 () Unit!5291)

(declare-fun e!115007 () Unit!5291)

(assert (=> d!53019 (= lt!86073 e!115007)))

(declare-fun c!31159 () Bool)

(assert (=> d!53019 (= c!31159 lt!86070)))

(assert (=> d!53019 (= lt!86070 (containsKey!187 (toList!1093 lt!85816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53019 (= (contains!1152 lt!85816 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86071)))

(declare-fun b!174157 () Bool)

(declare-fun lt!86072 () Unit!5291)

(assert (=> b!174157 (= e!115007 lt!86072)))

(assert (=> b!174157 (= lt!86072 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174157 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174158 () Bool)

(declare-fun Unit!5331 () Unit!5291)

(assert (=> b!174158 (= e!115007 Unit!5331)))

(declare-fun b!174159 () Bool)

(assert (=> b!174159 (= e!115008 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53019 c!31159) b!174157))

(assert (= (and d!53019 (not c!31159)) b!174158))

(assert (= (and d!53019 (not res!82595)) b!174159))

(declare-fun m!202613 () Bool)

(assert (=> d!53019 m!202613))

(declare-fun m!202615 () Bool)

(assert (=> b!174157 m!202615))

(declare-fun m!202617 () Bool)

(assert (=> b!174157 m!202617))

(assert (=> b!174157 m!202617))

(declare-fun m!202619 () Bool)

(assert (=> b!174157 m!202619))

(assert (=> b!174159 m!202617))

(assert (=> b!174159 m!202617))

(assert (=> b!174159 m!202619))

(assert (=> d!52573 d!53019))

(assert (=> d!52573 d!52467))

(declare-fun d!53021 () Bool)

(assert (=> d!53021 (= (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85647)) (v!3950 (getValueByKey!183 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85647)))))

(assert (=> d!52565 d!53021))

(declare-fun b!174161 () Bool)

(declare-fun e!115009 () Option!189)

(declare-fun e!115010 () Option!189)

(assert (=> b!174161 (= e!115009 e!115010)))

(declare-fun c!31161 () Bool)

(assert (=> b!174161 (= c!31161 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))) (not (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))) lt!85647))))))

(declare-fun b!174162 () Bool)

(assert (=> b!174162 (= e!115010 (getValueByKey!183 (t!7012 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))) lt!85647))))

(declare-fun b!174160 () Bool)

(assert (=> b!174160 (= e!115009 (Some!188 (_2!1629 (h!2827 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))))))))

(declare-fun d!53023 () Bool)

(declare-fun c!31160 () Bool)

(assert (=> d!53023 (= c!31160 (and ((_ is Cons!2210) (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248))))) (= (_1!1629 (h!2827 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))))) lt!85647)))))

(assert (=> d!53023 (= (getValueByKey!183 (toList!1093 (+!240 lt!85630 (tuple2!3237 lt!85631 (zeroValue!3438 thiss!1248)))) lt!85647) e!115009)))

(declare-fun b!174163 () Bool)

(assert (=> b!174163 (= e!115010 None!187)))

(assert (= (and d!53023 c!31160) b!174160))

(assert (= (and d!53023 (not c!31160)) b!174161))

(assert (= (and b!174161 c!31161) b!174162))

(assert (= (and b!174161 (not c!31161)) b!174163))

(declare-fun m!202621 () Bool)

(assert (=> b!174162 m!202621))

(assert (=> d!52565 d!53023))

(declare-fun d!53025 () Bool)

(assert (=> d!53025 (= (apply!130 (+!240 lt!85713 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) lt!85725) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85713 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))) lt!85725)))))

(declare-fun bs!7174 () Bool)

(assert (= bs!7174 d!53025))

(declare-fun m!202623 () Bool)

(assert (=> bs!7174 m!202623))

(assert (=> bs!7174 m!202623))

(declare-fun m!202625 () Bool)

(assert (=> bs!7174 m!202625))

(assert (=> b!173359 d!53025))

(declare-fun d!53027 () Bool)

(assert (=> d!53027 (= (apply!130 lt!85707 lt!85724) (get!1963 (getValueByKey!183 (toList!1093 lt!85707) lt!85724)))))

(declare-fun bs!7175 () Bool)

(assert (= bs!7175 d!53027))

(declare-fun m!202627 () Bool)

(assert (=> bs!7175 m!202627))

(assert (=> bs!7175 m!202627))

(declare-fun m!202629 () Bool)

(assert (=> bs!7175 m!202629))

(assert (=> b!173359 d!53027))

(declare-fun d!53029 () Bool)

(assert (=> d!53029 (= (apply!130 lt!85712 lt!85720) (get!1963 (getValueByKey!183 (toList!1093 lt!85712) lt!85720)))))

(declare-fun bs!7176 () Bool)

(assert (= bs!7176 d!53029))

(declare-fun m!202631 () Bool)

(assert (=> bs!7176 m!202631))

(assert (=> bs!7176 m!202631))

(declare-fun m!202633 () Bool)

(assert (=> bs!7176 m!202633))

(assert (=> b!173359 d!53029))

(declare-fun d!53031 () Bool)

(assert (=> d!53031 (= (apply!130 (+!240 lt!85707 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) lt!85724) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85707 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))) lt!85724)))))

(declare-fun bs!7177 () Bool)

(assert (= bs!7177 d!53031))

(declare-fun m!202635 () Bool)

(assert (=> bs!7177 m!202635))

(assert (=> bs!7177 m!202635))

(declare-fun m!202637 () Bool)

(assert (=> bs!7177 m!202637))

(assert (=> b!173359 d!53031))

(declare-fun d!53033 () Bool)

(declare-fun e!115011 () Bool)

(assert (=> d!53033 e!115011))

(declare-fun res!82597 () Bool)

(assert (=> d!53033 (=> (not res!82597) (not e!115011))))

(declare-fun lt!86075 () ListLongMap!2155)

(assert (=> d!53033 (= res!82597 (contains!1152 lt!86075 (_1!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))))))

(declare-fun lt!86077 () List!2214)

(assert (=> d!53033 (= lt!86075 (ListLongMap!2156 lt!86077))))

(declare-fun lt!86076 () Unit!5291)

(declare-fun lt!86074 () Unit!5291)

(assert (=> d!53033 (= lt!86076 lt!86074)))

(assert (=> d!53033 (= (getValueByKey!183 lt!86077 (_1!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))))))

(assert (=> d!53033 (= lt!86074 (lemmaContainsTupThenGetReturnValue!99 lt!86077 (_1!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))))))

(assert (=> d!53033 (= lt!86077 (insertStrictlySorted!102 (toList!1093 lt!85713) (_1!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))))))

(assert (=> d!53033 (= (+!240 lt!85713 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) lt!86075)))

(declare-fun b!174164 () Bool)

(declare-fun res!82596 () Bool)

(assert (=> b!174164 (=> (not res!82596) (not e!115011))))

(assert (=> b!174164 (= res!82596 (= (getValueByKey!183 (toList!1093 lt!86075) (_1!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))))))))

(declare-fun b!174165 () Bool)

(assert (=> b!174165 (= e!115011 (contains!1155 (toList!1093 lt!86075) (tuple2!3237 lt!85719 (minValue!3440 lt!85539))))))

(assert (= (and d!53033 res!82597) b!174164))

(assert (= (and b!174164 res!82596) b!174165))

(declare-fun m!202639 () Bool)

(assert (=> d!53033 m!202639))

(declare-fun m!202641 () Bool)

(assert (=> d!53033 m!202641))

(declare-fun m!202643 () Bool)

(assert (=> d!53033 m!202643))

(declare-fun m!202645 () Bool)

(assert (=> d!53033 m!202645))

(declare-fun m!202647 () Bool)

(assert (=> b!174164 m!202647))

(declare-fun m!202649 () Bool)

(assert (=> b!174165 m!202649))

(assert (=> b!173359 d!53033))

(declare-fun d!53035 () Bool)

(declare-fun e!115012 () Bool)

(assert (=> d!53035 e!115012))

(declare-fun res!82599 () Bool)

(assert (=> d!53035 (=> (not res!82599) (not e!115012))))

(declare-fun lt!86079 () ListLongMap!2155)

(assert (=> d!53035 (= res!82599 (contains!1152 lt!86079 (_1!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))))))

(declare-fun lt!86081 () List!2214)

(assert (=> d!53035 (= lt!86079 (ListLongMap!2156 lt!86081))))

(declare-fun lt!86080 () Unit!5291)

(declare-fun lt!86078 () Unit!5291)

(assert (=> d!53035 (= lt!86080 lt!86078)))

(assert (=> d!53035 (= (getValueByKey!183 lt!86081 (_1!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53035 (= lt!86078 (lemmaContainsTupThenGetReturnValue!99 lt!86081 (_1!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) (_2!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53035 (= lt!86081 (insertStrictlySorted!102 (toList!1093 lt!85707) (_1!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) (_2!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53035 (= (+!240 lt!85707 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) lt!86079)))

(declare-fun b!174166 () Bool)

(declare-fun res!82598 () Bool)

(assert (=> b!174166 (=> (not res!82598) (not e!115012))))

(assert (=> b!174166 (= res!82598 (= (getValueByKey!183 (toList!1093 lt!86079) (_1!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))))))))

(declare-fun b!174167 () Bool)

(assert (=> b!174167 (= e!115012 (contains!1155 (toList!1093 lt!86079) (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))))))

(assert (= (and d!53035 res!82599) b!174166))

(assert (= (and b!174166 res!82598) b!174167))

(declare-fun m!202651 () Bool)

(assert (=> d!53035 m!202651))

(declare-fun m!202653 () Bool)

(assert (=> d!53035 m!202653))

(declare-fun m!202655 () Bool)

(assert (=> d!53035 m!202655))

(declare-fun m!202657 () Bool)

(assert (=> d!53035 m!202657))

(declare-fun m!202659 () Bool)

(assert (=> b!174166 m!202659))

(declare-fun m!202661 () Bool)

(assert (=> b!174167 m!202661))

(assert (=> b!173359 d!53035))

(declare-fun d!53037 () Bool)

(assert (=> d!53037 (= (apply!130 (+!240 lt!85712 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) lt!85720) (get!1963 (getValueByKey!183 (toList!1093 (+!240 lt!85712 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))) lt!85720)))))

(declare-fun bs!7178 () Bool)

(assert (= bs!7178 d!53037))

(declare-fun m!202663 () Bool)

(assert (=> bs!7178 m!202663))

(assert (=> bs!7178 m!202663))

(declare-fun m!202665 () Bool)

(assert (=> bs!7178 m!202665))

(assert (=> b!173359 d!53037))

(declare-fun d!53039 () Bool)

(declare-fun e!115014 () Bool)

(assert (=> d!53039 e!115014))

(declare-fun res!82600 () Bool)

(assert (=> d!53039 (=> res!82600 e!115014)))

(declare-fun lt!86083 () Bool)

(assert (=> d!53039 (= res!82600 (not lt!86083))))

(declare-fun lt!86082 () Bool)

(assert (=> d!53039 (= lt!86083 lt!86082)))

(declare-fun lt!86085 () Unit!5291)

(declare-fun e!115013 () Unit!5291)

(assert (=> d!53039 (= lt!86085 e!115013)))

(declare-fun c!31162 () Bool)

(assert (=> d!53039 (= c!31162 lt!86082)))

(assert (=> d!53039 (= lt!86082 (containsKey!187 (toList!1093 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) lt!85718))))

(assert (=> d!53039 (= (contains!1152 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) lt!85718) lt!86083)))

(declare-fun b!174168 () Bool)

(declare-fun lt!86084 () Unit!5291)

(assert (=> b!174168 (= e!115013 lt!86084)))

(assert (=> b!174168 (= lt!86084 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) lt!85718))))

(assert (=> b!174168 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) lt!85718))))

(declare-fun b!174169 () Bool)

(declare-fun Unit!5332 () Unit!5291)

(assert (=> b!174169 (= e!115013 Unit!5332)))

(declare-fun b!174170 () Bool)

(assert (=> b!174170 (= e!115014 (isDefined!137 (getValueByKey!183 (toList!1093 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) lt!85718)))))

(assert (= (and d!53039 c!31162) b!174168))

(assert (= (and d!53039 (not c!31162)) b!174169))

(assert (= (and d!53039 (not res!82600)) b!174170))

(declare-fun m!202667 () Bool)

(assert (=> d!53039 m!202667))

(declare-fun m!202669 () Bool)

(assert (=> b!174168 m!202669))

(declare-fun m!202671 () Bool)

(assert (=> b!174168 m!202671))

(assert (=> b!174168 m!202671))

(declare-fun m!202673 () Bool)

(assert (=> b!174168 m!202673))

(assert (=> b!174170 m!202671))

(assert (=> b!174170 m!202671))

(assert (=> b!174170 m!202673))

(assert (=> b!173359 d!53039))

(assert (=> b!173359 d!52803))

(declare-fun d!53041 () Bool)

(assert (=> d!53041 (= (apply!130 lt!85713 lt!85725) (get!1963 (getValueByKey!183 (toList!1093 lt!85713) lt!85725)))))

(declare-fun bs!7179 () Bool)

(assert (= bs!7179 d!53041))

(declare-fun m!202675 () Bool)

(assert (=> bs!7179 m!202675))

(assert (=> bs!7179 m!202675))

(declare-fun m!202677 () Bool)

(assert (=> bs!7179 m!202677))

(assert (=> b!173359 d!53041))

(declare-fun d!53043 () Bool)

(assert (=> d!53043 (= (apply!130 (+!240 lt!85712 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) lt!85720) (apply!130 lt!85712 lt!85720))))

(declare-fun lt!86086 () Unit!5291)

(assert (=> d!53043 (= lt!86086 (choose!937 lt!85712 lt!85722 (minValue!3440 lt!85539) lt!85720))))

(declare-fun e!115015 () Bool)

(assert (=> d!53043 e!115015))

(declare-fun res!82601 () Bool)

(assert (=> d!53043 (=> (not res!82601) (not e!115015))))

(assert (=> d!53043 (= res!82601 (contains!1152 lt!85712 lt!85720))))

(assert (=> d!53043 (= (addApplyDifferent!106 lt!85712 lt!85722 (minValue!3440 lt!85539) lt!85720) lt!86086)))

(declare-fun b!174171 () Bool)

(assert (=> b!174171 (= e!115015 (not (= lt!85720 lt!85722)))))

(assert (= (and d!53043 res!82601) b!174171))

(declare-fun m!202679 () Bool)

(assert (=> d!53043 m!202679))

(assert (=> d!53043 m!201335))

(declare-fun m!202681 () Bool)

(assert (=> d!53043 m!202681))

(assert (=> d!53043 m!201331))

(assert (=> d!53043 m!201335))

(assert (=> d!53043 m!201337))

(assert (=> b!173359 d!53043))

(declare-fun d!53045 () Bool)

(assert (=> d!53045 (= (apply!130 (+!240 lt!85707 (tuple2!3237 lt!85708 (zeroValue!3438 lt!85539))) lt!85724) (apply!130 lt!85707 lt!85724))))

(declare-fun lt!86087 () Unit!5291)

(assert (=> d!53045 (= lt!86087 (choose!937 lt!85707 lt!85708 (zeroValue!3438 lt!85539) lt!85724))))

(declare-fun e!115016 () Bool)

(assert (=> d!53045 e!115016))

(declare-fun res!82602 () Bool)

(assert (=> d!53045 (=> (not res!82602) (not e!115016))))

(assert (=> d!53045 (= res!82602 (contains!1152 lt!85707 lt!85724))))

(assert (=> d!53045 (= (addApplyDifferent!106 lt!85707 lt!85708 (zeroValue!3438 lt!85539) lt!85724) lt!86087)))

(declare-fun b!174172 () Bool)

(assert (=> b!174172 (= e!115016 (not (= lt!85724 lt!85708)))))

(assert (= (and d!53045 res!82602) b!174172))

(declare-fun m!202683 () Bool)

(assert (=> d!53045 m!202683))

(assert (=> d!53045 m!201339))

(declare-fun m!202685 () Bool)

(assert (=> d!53045 m!202685))

(assert (=> d!53045 m!201327))

(assert (=> d!53045 m!201339))

(assert (=> d!53045 m!201341))

(assert (=> b!173359 d!53045))

(declare-fun d!53047 () Bool)

(declare-fun e!115017 () Bool)

(assert (=> d!53047 e!115017))

(declare-fun res!82604 () Bool)

(assert (=> d!53047 (=> (not res!82604) (not e!115017))))

(declare-fun lt!86089 () ListLongMap!2155)

(assert (=> d!53047 (= res!82604 (contains!1152 lt!86089 (_1!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))))))

(declare-fun lt!86091 () List!2214)

(assert (=> d!53047 (= lt!86089 (ListLongMap!2156 lt!86091))))

(declare-fun lt!86090 () Unit!5291)

(declare-fun lt!86088 () Unit!5291)

(assert (=> d!53047 (= lt!86090 lt!86088)))

(assert (=> d!53047 (= (getValueByKey!183 lt!86091 (_1!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))))))

(assert (=> d!53047 (= lt!86088 (lemmaContainsTupThenGetReturnValue!99 lt!86091 (_1!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))))))

(assert (=> d!53047 (= lt!86091 (insertStrictlySorted!102 (toList!1093 lt!85712) (_1!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) (_2!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))))))

(assert (=> d!53047 (= (+!240 lt!85712 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))) lt!86089)))

(declare-fun b!174173 () Bool)

(declare-fun res!82603 () Bool)

(assert (=> b!174173 (=> (not res!82603) (not e!115017))))

(assert (=> b!174173 (= res!82603 (= (getValueByKey!183 (toList!1093 lt!86089) (_1!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85722 (minValue!3440 lt!85539))))))))

(declare-fun b!174174 () Bool)

(assert (=> b!174174 (= e!115017 (contains!1155 (toList!1093 lt!86089) (tuple2!3237 lt!85722 (minValue!3440 lt!85539))))))

(assert (= (and d!53047 res!82604) b!174173))

(assert (= (and b!174173 res!82603) b!174174))

(declare-fun m!202687 () Bool)

(assert (=> d!53047 m!202687))

(declare-fun m!202689 () Bool)

(assert (=> d!53047 m!202689))

(declare-fun m!202691 () Bool)

(assert (=> d!53047 m!202691))

(declare-fun m!202693 () Bool)

(assert (=> d!53047 m!202693))

(declare-fun m!202695 () Bool)

(assert (=> b!174173 m!202695))

(declare-fun m!202697 () Bool)

(assert (=> b!174174 m!202697))

(assert (=> b!173359 d!53047))

(declare-fun d!53049 () Bool)

(assert (=> d!53049 (= (apply!130 (+!240 lt!85713 (tuple2!3237 lt!85719 (minValue!3440 lt!85539))) lt!85725) (apply!130 lt!85713 lt!85725))))

(declare-fun lt!86092 () Unit!5291)

(assert (=> d!53049 (= lt!86092 (choose!937 lt!85713 lt!85719 (minValue!3440 lt!85539) lt!85725))))

(declare-fun e!115018 () Bool)

(assert (=> d!53049 e!115018))

(declare-fun res!82605 () Bool)

(assert (=> d!53049 (=> (not res!82605) (not e!115018))))

(assert (=> d!53049 (= res!82605 (contains!1152 lt!85713 lt!85725))))

(assert (=> d!53049 (= (addApplyDifferent!106 lt!85713 lt!85719 (minValue!3440 lt!85539) lt!85725) lt!86092)))

(declare-fun b!174175 () Bool)

(assert (=> b!174175 (= e!115018 (not (= lt!85725 lt!85719)))))

(assert (= (and d!53049 res!82605) b!174175))

(declare-fun m!202699 () Bool)

(assert (=> d!53049 m!202699))

(assert (=> d!53049 m!201323))

(declare-fun m!202701 () Bool)

(assert (=> d!53049 m!202701))

(assert (=> d!53049 m!201329))

(assert (=> d!53049 m!201323))

(assert (=> d!53049 m!201345))

(assert (=> b!173359 d!53049))

(declare-fun d!53051 () Bool)

(declare-fun e!115019 () Bool)

(assert (=> d!53051 e!115019))

(declare-fun res!82607 () Bool)

(assert (=> d!53051 (=> (not res!82607) (not e!115019))))

(declare-fun lt!86094 () ListLongMap!2155)

(assert (=> d!53051 (= res!82607 (contains!1152 lt!86094 (_1!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))))))

(declare-fun lt!86096 () List!2214)

(assert (=> d!53051 (= lt!86094 (ListLongMap!2156 lt!86096))))

(declare-fun lt!86095 () Unit!5291)

(declare-fun lt!86093 () Unit!5291)

(assert (=> d!53051 (= lt!86095 lt!86093)))

(assert (=> d!53051 (= (getValueByKey!183 lt!86096 (_1!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53051 (= lt!86093 (lemmaContainsTupThenGetReturnValue!99 lt!86096 (_1!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) (_2!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53051 (= lt!86096 (insertStrictlySorted!102 (toList!1093 lt!85726) (_1!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) (_2!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))))))

(assert (=> d!53051 (= (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) lt!86094)))

(declare-fun b!174176 () Bool)

(declare-fun res!82606 () Bool)

(assert (=> b!174176 (=> (not res!82606) (not e!115019))))

(assert (=> b!174176 (= res!82606 (= (getValueByKey!183 (toList!1093 lt!86094) (_1!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539)))) (Some!188 (_2!1629 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))))))))

(declare-fun b!174177 () Bool)

(assert (=> b!174177 (= e!115019 (contains!1155 (toList!1093 lt!86094) (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))))))

(assert (= (and d!53051 res!82607) b!174176))

(assert (= (and b!174176 res!82606) b!174177))

(declare-fun m!202703 () Bool)

(assert (=> d!53051 m!202703))

(declare-fun m!202705 () Bool)

(assert (=> d!53051 m!202705))

(declare-fun m!202707 () Bool)

(assert (=> d!53051 m!202707))

(declare-fun m!202709 () Bool)

(assert (=> d!53051 m!202709))

(declare-fun m!202711 () Bool)

(assert (=> b!174176 m!202711))

(declare-fun m!202713 () Bool)

(assert (=> b!174177 m!202713))

(assert (=> b!173359 d!53051))

(declare-fun d!53053 () Bool)

(assert (=> d!53053 (contains!1152 (+!240 lt!85726 (tuple2!3237 lt!85717 (zeroValue!3438 lt!85539))) lt!85718)))

(declare-fun lt!86097 () Unit!5291)

(assert (=> d!53053 (= lt!86097 (choose!938 lt!85726 lt!85717 (zeroValue!3438 lt!85539) lt!85718))))

(assert (=> d!53053 (contains!1152 lt!85726 lt!85718)))

(assert (=> d!53053 (= (addStillContains!106 lt!85726 lt!85717 (zeroValue!3438 lt!85539) lt!85718) lt!86097)))

(declare-fun bs!7180 () Bool)

(assert (= bs!7180 d!53053))

(assert (=> bs!7180 m!201333))

(assert (=> bs!7180 m!201333))

(assert (=> bs!7180 m!201349))

(declare-fun m!202715 () Bool)

(assert (=> bs!7180 m!202715))

(declare-fun m!202717 () Bool)

(assert (=> bs!7180 m!202717))

(assert (=> b!173359 d!53053))

(assert (=> d!52611 d!52597))

(assert (=> d!52611 d!52599))

(declare-fun d!53055 () Bool)

(assert (=> d!53055 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85537) key!828))))

(assert (=> d!53055 true))

(declare-fun _$12!446 () Unit!5291)

(assert (=> d!53055 (= (choose!939 (toList!1093 lt!85537) key!828) _$12!446)))

(declare-fun bs!7181 () Bool)

(assert (= bs!7181 d!53055))

(assert (=> bs!7181 m!201095))

(assert (=> bs!7181 m!201095))

(assert (=> bs!7181 m!201097))

(assert (=> d!52611 d!53055))

(declare-fun d!53057 () Bool)

(declare-fun res!82608 () Bool)

(declare-fun e!115020 () Bool)

(assert (=> d!53057 (=> res!82608 e!115020)))

(assert (=> d!53057 (= res!82608 (or ((_ is Nil!2211) (toList!1093 lt!85537)) ((_ is Nil!2211) (t!7012 (toList!1093 lt!85537)))))))

(assert (=> d!53057 (= (isStrictlySorted!327 (toList!1093 lt!85537)) e!115020)))

(declare-fun b!174178 () Bool)

(declare-fun e!115021 () Bool)

(assert (=> b!174178 (= e!115020 e!115021)))

(declare-fun res!82609 () Bool)

(assert (=> b!174178 (=> (not res!82609) (not e!115021))))

(assert (=> b!174178 (= res!82609 (bvslt (_1!1629 (h!2827 (toList!1093 lt!85537))) (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537))))))))

(declare-fun b!174179 () Bool)

(assert (=> b!174179 (= e!115021 (isStrictlySorted!327 (t!7012 (toList!1093 lt!85537))))))

(assert (= (and d!53057 (not res!82608)) b!174178))

(assert (= (and b!174178 res!82609) b!174179))

(declare-fun m!202719 () Bool)

(assert (=> b!174179 m!202719))

(assert (=> d!52611 d!53057))

(declare-fun b!174181 () Bool)

(declare-fun e!115022 () Option!189)

(declare-fun e!115023 () Option!189)

(assert (=> b!174181 (= e!115022 e!115023)))

(declare-fun c!31164 () Bool)

(assert (=> b!174181 (= c!31164 (and ((_ is Cons!2210) (toList!1093 lt!85682)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85682))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174182 () Bool)

(assert (=> b!174182 (= e!115023 (getValueByKey!183 (t!7012 (toList!1093 lt!85682)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174180 () Bool)

(assert (=> b!174180 (= e!115022 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85682)))))))

(declare-fun d!53059 () Bool)

(declare-fun c!31163 () Bool)

(assert (=> d!53059 (= c!31163 (and ((_ is Cons!2210) (toList!1093 lt!85682)) (= (_1!1629 (h!2827 (toList!1093 lt!85682))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53059 (= (getValueByKey!183 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115022)))

(declare-fun b!174183 () Bool)

(assert (=> b!174183 (= e!115023 None!187)))

(assert (= (and d!53059 c!31163) b!174180))

(assert (= (and d!53059 (not c!31163)) b!174181))

(assert (= (and b!174181 c!31164) b!174182))

(assert (= (and b!174181 (not c!31164)) b!174183))

(declare-fun m!202721 () Bool)

(assert (=> b!174182 m!202721))

(assert (=> b!173300 d!53059))

(declare-fun d!53061 () Bool)

(declare-fun e!115025 () Bool)

(assert (=> d!53061 e!115025))

(declare-fun res!82610 () Bool)

(assert (=> d!53061 (=> res!82610 e!115025)))

(declare-fun lt!86099 () Bool)

(assert (=> d!53061 (= res!82610 (not lt!86099))))

(declare-fun lt!86098 () Bool)

(assert (=> d!53061 (= lt!86099 lt!86098)))

(declare-fun lt!86101 () Unit!5291)

(declare-fun e!115024 () Unit!5291)

(assert (=> d!53061 (= lt!86101 e!115024)))

(declare-fun c!31165 () Bool)

(assert (=> d!53061 (= c!31165 lt!86098)))

(assert (=> d!53061 (= lt!86098 (containsKey!187 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(assert (=> d!53061 (= (contains!1152 lt!85820 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!86099)))

(declare-fun b!174184 () Bool)

(declare-fun lt!86100 () Unit!5291)

(assert (=> b!174184 (= e!115024 lt!86100)))

(assert (=> b!174184 (= lt!86100 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(assert (=> b!174184 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun b!174185 () Bool)

(declare-fun Unit!5333 () Unit!5291)

(assert (=> b!174185 (= e!115024 Unit!5333)))

(declare-fun b!174186 () Bool)

(assert (=> b!174186 (= e!115025 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85820) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53061 c!31165) b!174184))

(assert (= (and d!53061 (not c!31165)) b!174185))

(assert (= (and d!53061 (not res!82610)) b!174186))

(declare-fun m!202723 () Bool)

(assert (=> d!53061 m!202723))

(declare-fun m!202725 () Bool)

(assert (=> b!174184 m!202725))

(assert (=> b!174184 m!201683))

(assert (=> b!174184 m!201683))

(declare-fun m!202727 () Bool)

(assert (=> b!174184 m!202727))

(assert (=> b!174186 m!201683))

(assert (=> b!174186 m!201683))

(assert (=> b!174186 m!202727))

(assert (=> d!52579 d!53061))

(declare-fun b!174188 () Bool)

(declare-fun e!115026 () Option!189)

(declare-fun e!115027 () Option!189)

(assert (=> b!174188 (= e!115026 e!115027)))

(declare-fun c!31167 () Bool)

(assert (=> b!174188 (= c!31167 (and ((_ is Cons!2210) lt!85822) (not (= (_1!1629 (h!2827 lt!85822)) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174189 () Bool)

(assert (=> b!174189 (= e!115027 (getValueByKey!183 (t!7012 lt!85822) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun b!174187 () Bool)

(assert (=> b!174187 (= e!115026 (Some!188 (_2!1629 (h!2827 lt!85822))))))

(declare-fun c!31166 () Bool)

(declare-fun d!53063 () Bool)

(assert (=> d!53063 (= c!31166 (and ((_ is Cons!2210) lt!85822) (= (_1!1629 (h!2827 lt!85822)) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(assert (=> d!53063 (= (getValueByKey!183 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) e!115026)))

(declare-fun b!174190 () Bool)

(assert (=> b!174190 (= e!115027 None!187)))

(assert (= (and d!53063 c!31166) b!174187))

(assert (= (and d!53063 (not c!31166)) b!174188))

(assert (= (and b!174188 c!31167) b!174189))

(assert (= (and b!174188 (not c!31167)) b!174190))

(declare-fun m!202729 () Bool)

(assert (=> b!174189 m!202729))

(assert (=> d!52579 d!53063))

(declare-fun d!53065 () Bool)

(assert (=> d!53065 (= (getValueByKey!183 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86102 () Unit!5291)

(assert (=> d!53065 (= lt!86102 (choose!936 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun e!115028 () Bool)

(assert (=> d!53065 e!115028))

(declare-fun res!82611 () Bool)

(assert (=> d!53065 (=> (not res!82611) (not e!115028))))

(assert (=> d!53065 (= res!82611 (isStrictlySorted!327 lt!85822))))

(assert (=> d!53065 (= (lemmaContainsTupThenGetReturnValue!99 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!86102)))

(declare-fun b!174191 () Bool)

(declare-fun res!82612 () Bool)

(assert (=> b!174191 (=> (not res!82612) (not e!115028))))

(assert (=> b!174191 (= res!82612 (containsKey!187 lt!85822 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun b!174192 () Bool)

(assert (=> b!174192 (= e!115028 (contains!1155 lt!85822 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53065 res!82611) b!174191))

(assert (= (and b!174191 res!82612) b!174192))

(assert (=> d!53065 m!201677))

(declare-fun m!202731 () Bool)

(assert (=> d!53065 m!202731))

(declare-fun m!202733 () Bool)

(assert (=> d!53065 m!202733))

(declare-fun m!202735 () Bool)

(assert (=> b!174191 m!202735))

(declare-fun m!202737 () Bool)

(assert (=> b!174192 m!202737))

(assert (=> d!52579 d!53065))

(declare-fun b!174193 () Bool)

(declare-fun e!115031 () List!2214)

(declare-fun call!17637 () List!2214)

(assert (=> b!174193 (= e!115031 call!17637)))

(declare-fun b!174194 () Bool)

(declare-fun res!82614 () Bool)

(declare-fun e!115029 () Bool)

(assert (=> b!174194 (=> (not res!82614) (not e!115029))))

(declare-fun lt!86103 () List!2214)

(assert (=> b!174194 (= res!82614 (containsKey!187 lt!86103 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun e!115033 () List!2214)

(declare-fun b!174195 () Bool)

(assert (=> b!174195 (= e!115033 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85635)) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))

(declare-fun b!174196 () Bool)

(assert (=> b!174196 (= e!115029 (contains!1155 lt!86103 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(declare-fun b!174197 () Bool)

(declare-fun c!31169 () Bool)

(declare-fun c!31170 () Bool)

(assert (=> b!174197 (= e!115033 (ite c!31170 (t!7012 (toList!1093 lt!85635)) (ite c!31169 (Cons!2210 (h!2827 (toList!1093 lt!85635)) (t!7012 (toList!1093 lt!85635))) Nil!2211)))))

(declare-fun c!31171 () Bool)

(declare-fun bm!17633 () Bool)

(declare-fun call!17636 () List!2214)

(assert (=> bm!17633 (= call!17636 ($colon$colon!97 e!115033 (ite c!31171 (h!2827 (toList!1093 lt!85635)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31168 () Bool)

(assert (=> bm!17633 (= c!31168 c!31171)))

(declare-fun b!174198 () Bool)

(assert (=> b!174198 (= c!31169 (and ((_ is Cons!2210) (toList!1093 lt!85635)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85635))) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(declare-fun e!115032 () List!2214)

(assert (=> b!174198 (= e!115032 e!115031)))

(declare-fun b!174199 () Bool)

(declare-fun e!115030 () List!2214)

(assert (=> b!174199 (= e!115030 call!17636)))

(declare-fun d!53067 () Bool)

(assert (=> d!53067 e!115029))

(declare-fun res!82613 () Bool)

(assert (=> d!53067 (=> (not res!82613) (not e!115029))))

(assert (=> d!53067 (= res!82613 (isStrictlySorted!327 lt!86103))))

(assert (=> d!53067 (= lt!86103 e!115030)))

(assert (=> d!53067 (= c!31171 (and ((_ is Cons!2210) (toList!1093 lt!85635)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85635))) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(assert (=> d!53067 (isStrictlySorted!327 (toList!1093 lt!85635))))

(assert (=> d!53067 (= (insertStrictlySorted!102 (toList!1093 lt!85635) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))) (_2!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248)))) lt!86103)))

(declare-fun bm!17634 () Bool)

(declare-fun call!17638 () List!2214)

(assert (=> bm!17634 (= call!17637 call!17638)))

(declare-fun b!174200 () Bool)

(assert (=> b!174200 (= e!115031 call!17637)))

(declare-fun bm!17635 () Bool)

(assert (=> bm!17635 (= call!17638 call!17636)))

(declare-fun b!174201 () Bool)

(assert (=> b!174201 (= e!115030 e!115032)))

(assert (=> b!174201 (= c!31170 (and ((_ is Cons!2210) (toList!1093 lt!85635)) (= (_1!1629 (h!2827 (toList!1093 lt!85635))) (_1!1629 (tuple2!3237 lt!85645 (minValue!3440 thiss!1248))))))))

(declare-fun b!174202 () Bool)

(assert (=> b!174202 (= e!115032 call!17638)))

(assert (= (and d!53067 c!31171) b!174199))

(assert (= (and d!53067 (not c!31171)) b!174201))

(assert (= (and b!174201 c!31170) b!174202))

(assert (= (and b!174201 (not c!31170)) b!174198))

(assert (= (and b!174198 c!31169) b!174193))

(assert (= (and b!174198 (not c!31169)) b!174200))

(assert (= (or b!174193 b!174200) bm!17634))

(assert (= (or b!174202 bm!17634) bm!17635))

(assert (= (or b!174199 bm!17635) bm!17633))

(assert (= (and bm!17633 c!31168) b!174195))

(assert (= (and bm!17633 (not c!31168)) b!174197))

(assert (= (and d!53067 res!82613) b!174194))

(assert (= (and b!174194 res!82614) b!174196))

(declare-fun m!202739 () Bool)

(assert (=> d!53067 m!202739))

(declare-fun m!202741 () Bool)

(assert (=> d!53067 m!202741))

(declare-fun m!202743 () Bool)

(assert (=> b!174196 m!202743))

(declare-fun m!202745 () Bool)

(assert (=> b!174195 m!202745))

(declare-fun m!202747 () Bool)

(assert (=> bm!17633 m!202747))

(declare-fun m!202749 () Bool)

(assert (=> b!174194 m!202749))

(assert (=> d!52579 d!53067))

(declare-fun d!53069 () Bool)

(assert (=> d!53069 (= (isEmpty!441 (getValueByKey!183 (toList!1093 lt!85537) key!828)) (not ((_ is Some!188) (getValueByKey!183 (toList!1093 lt!85537) key!828))))))

(assert (=> d!52597 d!53069))

(declare-fun b!174204 () Bool)

(declare-fun e!115034 () Option!189)

(declare-fun e!115035 () Option!189)

(assert (=> b!174204 (= e!115034 e!115035)))

(declare-fun c!31173 () Bool)

(assert (=> b!174204 (= c!31173 (and ((_ is Cons!2210) (toList!1093 lt!85753)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85753))) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!174205 () Bool)

(assert (=> b!174205 (= e!115035 (getValueByKey!183 (t!7012 (toList!1093 lt!85753)) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174203 () Bool)

(assert (=> b!174203 (= e!115034 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85753)))))))

(declare-fun c!31172 () Bool)

(declare-fun d!53071 () Bool)

(assert (=> d!53071 (= c!31172 (and ((_ is Cons!2210) (toList!1093 lt!85753)) (= (_1!1629 (h!2827 (toList!1093 lt!85753))) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!53071 (= (getValueByKey!183 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) e!115034)))

(declare-fun b!174206 () Bool)

(assert (=> b!174206 (= e!115035 None!187)))

(assert (= (and d!53071 c!31172) b!174203))

(assert (= (and d!53071 (not c!31172)) b!174204))

(assert (= (and b!174204 c!31173) b!174205))

(assert (= (and b!174204 (not c!31173)) b!174206))

(declare-fun m!202751 () Bool)

(assert (=> b!174205 m!202751))

(assert (=> b!173451 d!53071))

(declare-fun d!53073 () Bool)

(assert (=> d!53073 (= (get!1963 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3950 (getValueByKey!183 (toList!1093 lt!85637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52545 d!53073))

(assert (=> d!52545 d!52725))

(assert (=> d!52471 d!52461))

(assert (=> d!52471 d!52457))

(assert (=> d!52471 d!52463))

(declare-fun b!174208 () Bool)

(declare-fun e!115036 () Option!189)

(declare-fun e!115037 () Option!189)

(assert (=> b!174208 (= e!115036 e!115037)))

(declare-fun c!31175 () Bool)

(assert (=> b!174208 (= c!31175 (and ((_ is Cons!2210) (toList!1093 lt!85745)) (not (= (_1!1629 (h!2827 (toList!1093 lt!85745))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174209 () Bool)

(assert (=> b!174209 (= e!115037 (getValueByKey!183 (t!7012 (toList!1093 lt!85745)) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174207 () Bool)

(assert (=> b!174207 (= e!115036 (Some!188 (_2!1629 (h!2827 (toList!1093 lt!85745)))))))

(declare-fun d!53075 () Bool)

(declare-fun c!31174 () Bool)

(assert (=> d!53075 (= c!31174 (and ((_ is Cons!2210) (toList!1093 lt!85745)) (= (_1!1629 (h!2827 (toList!1093 lt!85745))) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!53075 (= (getValueByKey!183 (toList!1093 lt!85745) (_1!1629 (ite (or c!30888 c!30891) (tuple2!3237 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) e!115036)))

(declare-fun b!174210 () Bool)

(assert (=> b!174210 (= e!115037 None!187)))

(assert (= (and d!53075 c!31174) b!174207))

(assert (= (and d!53075 (not c!31174)) b!174208))

(assert (= (and b!174208 c!31175) b!174209))

(assert (= (and b!174208 (not c!31175)) b!174210))

(declare-fun m!202753 () Bool)

(assert (=> b!174209 m!202753))

(assert (=> b!173447 d!53075))

(assert (=> d!52529 d!52511))

(assert (=> d!52529 d!52509))

(declare-fun d!53077 () Bool)

(assert (=> d!53077 (contains!1152 (+!240 lt!85675 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) lt!85667)))

(assert (=> d!53077 true))

(declare-fun _$35!413 () Unit!5291)

(assert (=> d!53077 (= (choose!938 lt!85675 lt!85666 (zeroValue!3438 thiss!1248) lt!85667) _$35!413)))

(declare-fun bs!7182 () Bool)

(assert (= bs!7182 d!53077))

(assert (=> bs!7182 m!201223))

(assert (=> bs!7182 m!201223))

(assert (=> bs!7182 m!201239))

(assert (=> d!52529 d!53077))

(declare-fun d!53079 () Bool)

(declare-fun e!115039 () Bool)

(assert (=> d!53079 e!115039))

(declare-fun res!82615 () Bool)

(assert (=> d!53079 (=> res!82615 e!115039)))

(declare-fun lt!86105 () Bool)

(assert (=> d!53079 (= res!82615 (not lt!86105))))

(declare-fun lt!86104 () Bool)

(assert (=> d!53079 (= lt!86105 lt!86104)))

(declare-fun lt!86107 () Unit!5291)

(declare-fun e!115038 () Unit!5291)

(assert (=> d!53079 (= lt!86107 e!115038)))

(declare-fun c!31176 () Bool)

(assert (=> d!53079 (= c!31176 lt!86104)))

(assert (=> d!53079 (= lt!86104 (containsKey!187 (toList!1093 lt!85675) lt!85667))))

(assert (=> d!53079 (= (contains!1152 lt!85675 lt!85667) lt!86105)))

(declare-fun b!174211 () Bool)

(declare-fun lt!86106 () Unit!5291)

(assert (=> b!174211 (= e!115038 lt!86106)))

(assert (=> b!174211 (= lt!86106 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85675) lt!85667))))

(assert (=> b!174211 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85675) lt!85667))))

(declare-fun b!174212 () Bool)

(declare-fun Unit!5334 () Unit!5291)

(assert (=> b!174212 (= e!115038 Unit!5334)))

(declare-fun b!174213 () Bool)

(assert (=> b!174213 (= e!115039 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85675) lt!85667)))))

(assert (= (and d!53079 c!31176) b!174211))

(assert (= (and d!53079 (not c!31176)) b!174212))

(assert (= (and d!53079 (not res!82615)) b!174213))

(declare-fun m!202755 () Bool)

(assert (=> d!53079 m!202755))

(declare-fun m!202757 () Bool)

(assert (=> b!174211 m!202757))

(declare-fun m!202759 () Bool)

(assert (=> b!174211 m!202759))

(assert (=> b!174211 m!202759))

(declare-fun m!202761 () Bool)

(assert (=> b!174211 m!202761))

(assert (=> b!174213 m!202759))

(assert (=> b!174213 m!202759))

(assert (=> b!174213 m!202761))

(assert (=> d!52529 d!53079))

(assert (=> b!173590 d!52479))

(declare-fun d!53081 () Bool)

(assert (=> d!53081 (arrayContainsKey!0 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000)))

(declare-fun lt!86108 () Unit!5291)

(assert (=> d!53081 (= lt!86108 (choose!13 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000))))

(assert (=> d!53081 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!53081 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000) lt!86108)))

(declare-fun bs!7183 () Bool)

(assert (= bs!7183 d!53081))

(assert (=> bs!7183 m!201707))

(declare-fun m!202763 () Bool)

(assert (=> bs!7183 m!202763))

(assert (=> b!173539 d!53081))

(declare-fun d!53083 () Bool)

(declare-fun res!82616 () Bool)

(declare-fun e!115040 () Bool)

(assert (=> d!53083 (=> res!82616 e!115040)))

(assert (=> d!53083 (= res!82616 (= (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) lt!85834))))

(assert (=> d!53083 (= (arrayContainsKey!0 (_keys!5437 thiss!1248) lt!85834 #b00000000000000000000000000000000) e!115040)))

(declare-fun b!174214 () Bool)

(declare-fun e!115041 () Bool)

(assert (=> b!174214 (= e!115040 e!115041)))

(declare-fun res!82617 () Bool)

(assert (=> b!174214 (=> (not res!82617) (not e!115041))))

(assert (=> b!174214 (= res!82617 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3754 (_keys!5437 thiss!1248))))))

(declare-fun b!174215 () Bool)

(assert (=> b!174215 (= e!115041 (arrayContainsKey!0 (_keys!5437 thiss!1248) lt!85834 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!53083 (not res!82616)) b!174214))

(assert (= (and b!174214 res!82617) b!174215))

(assert (=> d!53083 m!201133))

(declare-fun m!202765 () Bool)

(assert (=> b!174215 m!202765))

(assert (=> b!173539 d!53083))

(declare-fun b!174216 () Bool)

(declare-fun e!115044 () SeekEntryResult!553)

(assert (=> b!174216 (= e!115044 Undefined!553)))

(declare-fun d!53085 () Bool)

(declare-fun lt!86110 () SeekEntryResult!553)

(assert (=> d!53085 (and (or ((_ is Undefined!553) lt!86110) (not ((_ is Found!553) lt!86110)) (and (bvsge (index!4381 lt!86110) #b00000000000000000000000000000000) (bvslt (index!4381 lt!86110) (size!3754 (_keys!5437 thiss!1248))))) (or ((_ is Undefined!553) lt!86110) ((_ is Found!553) lt!86110) (not ((_ is MissingZero!553) lt!86110)) (and (bvsge (index!4380 lt!86110) #b00000000000000000000000000000000) (bvslt (index!4380 lt!86110) (size!3754 (_keys!5437 thiss!1248))))) (or ((_ is Undefined!553) lt!86110) ((_ is Found!553) lt!86110) ((_ is MissingZero!553) lt!86110) (not ((_ is MissingVacant!553) lt!86110)) (and (bvsge (index!4383 lt!86110) #b00000000000000000000000000000000) (bvslt (index!4383 lt!86110) (size!3754 (_keys!5437 thiss!1248))))) (or ((_ is Undefined!553) lt!86110) (ite ((_ is Found!553) lt!86110) (= (select (arr!3454 (_keys!5437 thiss!1248)) (index!4381 lt!86110)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!553) lt!86110) (= (select (arr!3454 (_keys!5437 thiss!1248)) (index!4380 lt!86110)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!553) lt!86110) (= (select (arr!3454 (_keys!5437 thiss!1248)) (index!4383 lt!86110)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53085 (= lt!86110 e!115044)))

(declare-fun c!31179 () Bool)

(declare-fun lt!86109 () SeekEntryResult!553)

(assert (=> d!53085 (= c!31179 (and ((_ is Intermediate!553) lt!86109) (undefined!1365 lt!86109)))))

(assert (=> d!53085 (= lt!86109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (mask!8468 thiss!1248)) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)))))

(assert (=> d!53085 (validMask!0 (mask!8468 thiss!1248))))

(assert (=> d!53085 (= (seekEntryOrOpen!0 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)) lt!86110)))

(declare-fun b!174217 () Bool)

(declare-fun e!115042 () SeekEntryResult!553)

(assert (=> b!174217 (= e!115042 (Found!553 (index!4382 lt!86109)))))

(declare-fun b!174218 () Bool)

(declare-fun c!31177 () Bool)

(declare-fun lt!86111 () (_ BitVec 64))

(assert (=> b!174218 (= c!31177 (= lt!86111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115043 () SeekEntryResult!553)

(assert (=> b!174218 (= e!115042 e!115043)))

(declare-fun b!174219 () Bool)

(assert (=> b!174219 (= e!115044 e!115042)))

(assert (=> b!174219 (= lt!86111 (select (arr!3454 (_keys!5437 thiss!1248)) (index!4382 lt!86109)))))

(declare-fun c!31178 () Bool)

(assert (=> b!174219 (= c!31178 (= lt!86111 (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174220 () Bool)

(assert (=> b!174220 (= e!115043 (MissingZero!553 (index!4382 lt!86109)))))

(declare-fun b!174221 () Bool)

(assert (=> b!174221 (= e!115043 (seekKeyOrZeroReturnVacant!0 (x!19206 lt!86109) (index!4382 lt!86109) (index!4382 lt!86109) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000) (_keys!5437 thiss!1248) (mask!8468 thiss!1248)))))

(assert (= (and d!53085 c!31179) b!174216))

(assert (= (and d!53085 (not c!31179)) b!174219))

(assert (= (and b!174219 c!31178) b!174217))

(assert (= (and b!174219 (not c!31178)) b!174218))

(assert (= (and b!174218 c!31177) b!174220))

(assert (= (and b!174218 (not c!31177)) b!174221))

(assert (=> d!53085 m!201121))

(declare-fun m!202767 () Bool)

(assert (=> d!53085 m!202767))

(declare-fun m!202769 () Bool)

(assert (=> d!53085 m!202769))

(assert (=> d!53085 m!201133))

(declare-fun m!202771 () Bool)

(assert (=> d!53085 m!202771))

(declare-fun m!202773 () Bool)

(assert (=> d!53085 m!202773))

(declare-fun m!202775 () Bool)

(assert (=> d!53085 m!202775))

(assert (=> d!53085 m!201133))

(assert (=> d!53085 m!202769))

(declare-fun m!202777 () Bool)

(assert (=> b!174219 m!202777))

(assert (=> b!174221 m!201133))

(declare-fun m!202779 () Bool)

(assert (=> b!174221 m!202779))

(assert (=> b!173539 d!53085))

(declare-fun d!53087 () Bool)

(declare-fun lt!86112 () Bool)

(assert (=> d!53087 (= lt!86112 (select (content!149 lt!85654) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115046 () Bool)

(assert (=> d!53087 (= lt!86112 e!115046)))

(declare-fun res!82618 () Bool)

(assert (=> d!53087 (=> (not res!82618) (not e!115046))))

(assert (=> d!53087 (= res!82618 ((_ is Cons!2210) lt!85654))))

(assert (=> d!53087 (= (contains!1155 lt!85654 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86112)))

(declare-fun b!174222 () Bool)

(declare-fun e!115045 () Bool)

(assert (=> b!174222 (= e!115046 e!115045)))

(declare-fun res!82619 () Bool)

(assert (=> b!174222 (=> res!82619 e!115045)))

(assert (=> b!174222 (= res!82619 (= (h!2827 lt!85654) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174223 () Bool)

(assert (=> b!174223 (= e!115045 (contains!1155 (t!7012 lt!85654) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53087 res!82618) b!174222))

(assert (= (and b!174222 (not res!82619)) b!174223))

(declare-fun m!202781 () Bool)

(assert (=> d!53087 m!202781))

(declare-fun m!202783 () Bool)

(assert (=> d!53087 m!202783))

(declare-fun m!202785 () Bool)

(assert (=> b!174223 m!202785))

(assert (=> b!173436 d!53087))

(declare-fun d!53089 () Bool)

(assert (=> d!53089 (= (get!1965 (select (arr!3455 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!464 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173307 d!53089))

(declare-fun d!53091 () Bool)

(declare-fun e!115048 () Bool)

(assert (=> d!53091 e!115048))

(declare-fun res!82620 () Bool)

(assert (=> d!53091 (=> res!82620 e!115048)))

(declare-fun lt!86114 () Bool)

(assert (=> d!53091 (= res!82620 (not lt!86114))))

(declare-fun lt!86113 () Bool)

(assert (=> d!53091 (= lt!86114 lt!86113)))

(declare-fun lt!86116 () Unit!5291)

(declare-fun e!115047 () Unit!5291)

(assert (=> d!53091 (= lt!86116 e!115047)))

(declare-fun c!31180 () Bool)

(assert (=> d!53091 (= c!31180 lt!86113)))

(assert (=> d!53091 (= lt!86113 (containsKey!187 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(assert (=> d!53091 (= (contains!1152 lt!85765 (_1!1629 (tuple2!3237 lt!85671 v!309))) lt!86114)))

(declare-fun b!174224 () Bool)

(declare-fun lt!86115 () Unit!5291)

(assert (=> b!174224 (= e!115047 lt!86115)))

(assert (=> b!174224 (= lt!86115 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(assert (=> b!174224 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!174225 () Bool)

(declare-fun Unit!5335 () Unit!5291)

(assert (=> b!174225 (= e!115047 Unit!5335)))

(declare-fun b!174226 () Bool)

(assert (=> b!174226 (= e!115048 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85765) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(assert (= (and d!53091 c!31180) b!174224))

(assert (= (and d!53091 (not c!31180)) b!174225))

(assert (= (and d!53091 (not res!82620)) b!174226))

(declare-fun m!202787 () Bool)

(assert (=> d!53091 m!202787))

(declare-fun m!202789 () Bool)

(assert (=> b!174224 m!202789))

(assert (=> b!174224 m!201491))

(assert (=> b!174224 m!201491))

(declare-fun m!202791 () Bool)

(assert (=> b!174224 m!202791))

(assert (=> b!174226 m!201491))

(assert (=> b!174226 m!201491))

(assert (=> b!174226 m!202791))

(assert (=> d!52515 d!53091))

(declare-fun b!174228 () Bool)

(declare-fun e!115049 () Option!189)

(declare-fun e!115050 () Option!189)

(assert (=> b!174228 (= e!115049 e!115050)))

(declare-fun c!31182 () Bool)

(assert (=> b!174228 (= c!31182 (and ((_ is Cons!2210) lt!85767) (not (= (_1!1629 (h!2827 lt!85767)) (_1!1629 (tuple2!3237 lt!85671 v!309))))))))

(declare-fun b!174229 () Bool)

(assert (=> b!174229 (= e!115050 (getValueByKey!183 (t!7012 lt!85767) (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!174227 () Bool)

(assert (=> b!174227 (= e!115049 (Some!188 (_2!1629 (h!2827 lt!85767))))))

(declare-fun d!53093 () Bool)

(declare-fun c!31181 () Bool)

(assert (=> d!53093 (= c!31181 (and ((_ is Cons!2210) lt!85767) (= (_1!1629 (h!2827 lt!85767)) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(assert (=> d!53093 (= (getValueByKey!183 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309))) e!115049)))

(declare-fun b!174230 () Bool)

(assert (=> b!174230 (= e!115050 None!187)))

(assert (= (and d!53093 c!31181) b!174227))

(assert (= (and d!53093 (not c!31181)) b!174228))

(assert (= (and b!174228 c!31182) b!174229))

(assert (= (and b!174228 (not c!31182)) b!174230))

(declare-fun m!202793 () Bool)

(assert (=> b!174229 m!202793))

(assert (=> d!52515 d!53093))

(declare-fun d!53095 () Bool)

(assert (=> d!53095 (= (getValueByKey!183 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309))) (Some!188 (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun lt!86117 () Unit!5291)

(assert (=> d!53095 (= lt!86117 (choose!936 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun e!115051 () Bool)

(assert (=> d!53095 e!115051))

(declare-fun res!82621 () Bool)

(assert (=> d!53095 (=> (not res!82621) (not e!115051))))

(assert (=> d!53095 (= res!82621 (isStrictlySorted!327 lt!85767))))

(assert (=> d!53095 (= (lemmaContainsTupThenGetReturnValue!99 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))) lt!86117)))

(declare-fun b!174231 () Bool)

(declare-fun res!82622 () Bool)

(assert (=> b!174231 (=> (not res!82622) (not e!115051))))

(assert (=> b!174231 (= res!82622 (containsKey!187 lt!85767 (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!174232 () Bool)

(assert (=> b!174232 (= e!115051 (contains!1155 lt!85767 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309)))))))

(assert (= (and d!53095 res!82621) b!174231))

(assert (= (and b!174231 res!82622) b!174232))

(assert (=> d!53095 m!201485))

(declare-fun m!202795 () Bool)

(assert (=> d!53095 m!202795))

(declare-fun m!202797 () Bool)

(assert (=> d!53095 m!202797))

(declare-fun m!202799 () Bool)

(assert (=> b!174231 m!202799))

(declare-fun m!202801 () Bool)

(assert (=> b!174232 m!202801))

(assert (=> d!52515 d!53095))

(declare-fun b!174233 () Bool)

(declare-fun e!115054 () List!2214)

(declare-fun call!17640 () List!2214)

(assert (=> b!174233 (= e!115054 call!17640)))

(declare-fun b!174234 () Bool)

(declare-fun res!82624 () Bool)

(declare-fun e!115052 () Bool)

(assert (=> b!174234 (=> (not res!82624) (not e!115052))))

(declare-fun lt!86118 () List!2214)

(assert (=> b!174234 (= res!82624 (containsKey!187 lt!86118 (_1!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!174235 () Bool)

(declare-fun e!115056 () List!2214)

(assert (=> b!174235 (= e!115056 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85661)) (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))))))

(declare-fun b!174236 () Bool)

(assert (=> b!174236 (= e!115052 (contains!1155 lt!86118 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309)))))))

(declare-fun c!31184 () Bool)

(declare-fun b!174237 () Bool)

(declare-fun c!31185 () Bool)

(assert (=> b!174237 (= e!115056 (ite c!31185 (t!7012 (toList!1093 lt!85661)) (ite c!31184 (Cons!2210 (h!2827 (toList!1093 lt!85661)) (t!7012 (toList!1093 lt!85661))) Nil!2211)))))

(declare-fun bm!17636 () Bool)

(declare-fun c!31186 () Bool)

(declare-fun call!17639 () List!2214)

(assert (=> bm!17636 (= call!17639 ($colon$colon!97 e!115056 (ite c!31186 (h!2827 (toList!1093 lt!85661)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))))))))

(declare-fun c!31183 () Bool)

(assert (=> bm!17636 (= c!31183 c!31186)))

(declare-fun b!174238 () Bool)

(assert (=> b!174238 (= c!31184 (and ((_ is Cons!2210) (toList!1093 lt!85661)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85661))) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(declare-fun e!115055 () List!2214)

(assert (=> b!174238 (= e!115055 e!115054)))

(declare-fun b!174239 () Bool)

(declare-fun e!115053 () List!2214)

(assert (=> b!174239 (= e!115053 call!17639)))

(declare-fun d!53097 () Bool)

(assert (=> d!53097 e!115052))

(declare-fun res!82623 () Bool)

(assert (=> d!53097 (=> (not res!82623) (not e!115052))))

(assert (=> d!53097 (= res!82623 (isStrictlySorted!327 lt!86118))))

(assert (=> d!53097 (= lt!86118 e!115053)))

(assert (=> d!53097 (= c!31186 (and ((_ is Cons!2210) (toList!1093 lt!85661)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85661))) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(assert (=> d!53097 (isStrictlySorted!327 (toList!1093 lt!85661))))

(assert (=> d!53097 (= (insertStrictlySorted!102 (toList!1093 lt!85661) (_1!1629 (tuple2!3237 lt!85671 v!309)) (_2!1629 (tuple2!3237 lt!85671 v!309))) lt!86118)))

(declare-fun bm!17637 () Bool)

(declare-fun call!17641 () List!2214)

(assert (=> bm!17637 (= call!17640 call!17641)))

(declare-fun b!174240 () Bool)

(assert (=> b!174240 (= e!115054 call!17640)))

(declare-fun bm!17638 () Bool)

(assert (=> bm!17638 (= call!17641 call!17639)))

(declare-fun b!174241 () Bool)

(assert (=> b!174241 (= e!115053 e!115055)))

(assert (=> b!174241 (= c!31185 (and ((_ is Cons!2210) (toList!1093 lt!85661)) (= (_1!1629 (h!2827 (toList!1093 lt!85661))) (_1!1629 (tuple2!3237 lt!85671 v!309)))))))

(declare-fun b!174242 () Bool)

(assert (=> b!174242 (= e!115055 call!17641)))

(assert (= (and d!53097 c!31186) b!174239))

(assert (= (and d!53097 (not c!31186)) b!174241))

(assert (= (and b!174241 c!31185) b!174242))

(assert (= (and b!174241 (not c!31185)) b!174238))

(assert (= (and b!174238 c!31184) b!174233))

(assert (= (and b!174238 (not c!31184)) b!174240))

(assert (= (or b!174233 b!174240) bm!17637))

(assert (= (or b!174242 bm!17637) bm!17638))

(assert (= (or b!174239 bm!17638) bm!17636))

(assert (= (and bm!17636 c!31183) b!174235))

(assert (= (and bm!17636 (not c!31183)) b!174237))

(assert (= (and d!53097 res!82623) b!174234))

(assert (= (and b!174234 res!82624) b!174236))

(declare-fun m!202803 () Bool)

(assert (=> d!53097 m!202803))

(declare-fun m!202805 () Bool)

(assert (=> d!53097 m!202805))

(declare-fun m!202807 () Bool)

(assert (=> b!174236 m!202807))

(declare-fun m!202809 () Bool)

(assert (=> b!174235 m!202809))

(declare-fun m!202811 () Bool)

(assert (=> bm!17636 m!202811))

(declare-fun m!202813 () Bool)

(assert (=> b!174234 m!202813))

(assert (=> d!52515 d!53097))

(declare-fun d!53099 () Bool)

(declare-fun lt!86119 () Bool)

(assert (=> d!53099 (= lt!86119 (select (content!149 (t!7012 (toList!1093 lt!85652))) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!115058 () Bool)

(assert (=> d!53099 (= lt!86119 e!115058)))

(declare-fun res!82625 () Bool)

(assert (=> d!53099 (=> (not res!82625) (not e!115058))))

(assert (=> d!53099 (= res!82625 ((_ is Cons!2210) (t!7012 (toList!1093 lt!85652))))))

(assert (=> d!53099 (= (contains!1155 (t!7012 (toList!1093 lt!85652)) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86119)))

(declare-fun b!174243 () Bool)

(declare-fun e!115057 () Bool)

(assert (=> b!174243 (= e!115058 e!115057)))

(declare-fun res!82626 () Bool)

(assert (=> b!174243 (=> res!82626 e!115057)))

(assert (=> b!174243 (= res!82626 (= (h!2827 (t!7012 (toList!1093 lt!85652))) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!174244 () Bool)

(assert (=> b!174244 (= e!115057 (contains!1155 (t!7012 (t!7012 (toList!1093 lt!85652))) (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!53099 res!82625) b!174243))

(assert (= (and b!174243 (not res!82626)) b!174244))

(assert (=> d!53099 m!202317))

(declare-fun m!202815 () Bool)

(assert (=> d!53099 m!202815))

(declare-fun m!202817 () Bool)

(assert (=> b!174244 m!202817))

(assert (=> b!173575 d!53099))

(declare-fun d!53101 () Bool)

(assert (=> d!53101 (= (apply!130 lt!85714 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1963 (getValueByKey!183 (toList!1093 lt!85714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7184 () Bool)

(assert (= bs!7184 d!53101))

(assert (=> bs!7184 m!202461))

(assert (=> bs!7184 m!202461))

(declare-fun m!202819 () Bool)

(assert (=> bs!7184 m!202819))

(assert (=> b!173370 d!53101))

(declare-fun d!53103 () Bool)

(declare-fun e!115060 () Bool)

(assert (=> d!53103 e!115060))

(declare-fun res!82627 () Bool)

(assert (=> d!53103 (=> res!82627 e!115060)))

(declare-fun lt!86121 () Bool)

(assert (=> d!53103 (= res!82627 (not lt!86121))))

(declare-fun lt!86120 () Bool)

(assert (=> d!53103 (= lt!86121 lt!86120)))

(declare-fun lt!86123 () Unit!5291)

(declare-fun e!115059 () Unit!5291)

(assert (=> d!53103 (= lt!86123 e!115059)))

(declare-fun c!31187 () Bool)

(assert (=> d!53103 (= c!31187 lt!86120)))

(assert (=> d!53103 (= lt!86120 (containsKey!187 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!53103 (= (contains!1152 lt!85682 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86121)))

(declare-fun b!174245 () Bool)

(declare-fun lt!86122 () Unit!5291)

(assert (=> b!174245 (= e!115059 lt!86122)))

(assert (=> b!174245 (= lt!86122 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!174245 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174246 () Bool)

(declare-fun Unit!5336 () Unit!5291)

(assert (=> b!174246 (= e!115059 Unit!5336)))

(declare-fun b!174247 () Bool)

(assert (=> b!174247 (= e!115060 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85682) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53103 c!31187) b!174245))

(assert (= (and d!53103 (not c!31187)) b!174246))

(assert (= (and d!53103 (not res!82627)) b!174247))

(declare-fun m!202821 () Bool)

(assert (=> d!53103 m!202821))

(declare-fun m!202823 () Bool)

(assert (=> b!174245 m!202823))

(assert (=> b!174245 m!201273))

(assert (=> b!174245 m!201273))

(declare-fun m!202825 () Bool)

(assert (=> b!174245 m!202825))

(assert (=> b!174247 m!201273))

(assert (=> b!174247 m!201273))

(assert (=> b!174247 m!202825))

(assert (=> d!52473 d!53103))

(declare-fun b!174249 () Bool)

(declare-fun e!115061 () Option!189)

(declare-fun e!115062 () Option!189)

(assert (=> b!174249 (= e!115061 e!115062)))

(declare-fun c!31189 () Bool)

(assert (=> b!174249 (= c!31189 (and ((_ is Cons!2210) lt!85684) (not (= (_1!1629 (h!2827 lt!85684)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174250 () Bool)

(assert (=> b!174250 (= e!115062 (getValueByKey!183 (t!7012 lt!85684) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174248 () Bool)

(assert (=> b!174248 (= e!115061 (Some!188 (_2!1629 (h!2827 lt!85684))))))

(declare-fun d!53105 () Bool)

(declare-fun c!31188 () Bool)

(assert (=> d!53105 (= c!31188 (and ((_ is Cons!2210) lt!85684) (= (_1!1629 (h!2827 lt!85684)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53105 (= (getValueByKey!183 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115061)))

(declare-fun b!174251 () Bool)

(assert (=> b!174251 (= e!115062 None!187)))

(assert (= (and d!53105 c!31188) b!174248))

(assert (= (and d!53105 (not c!31188)) b!174249))

(assert (= (and b!174249 c!31189) b!174250))

(assert (= (and b!174249 (not c!31189)) b!174251))

(declare-fun m!202827 () Bool)

(assert (=> b!174250 m!202827))

(assert (=> d!52473 d!53105))

(declare-fun d!53107 () Bool)

(assert (=> d!53107 (= (getValueByKey!183 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!188 (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86124 () Unit!5291)

(assert (=> d!53107 (= lt!86124 (choose!936 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115063 () Bool)

(assert (=> d!53107 e!115063))

(declare-fun res!82628 () Bool)

(assert (=> d!53107 (=> (not res!82628) (not e!115063))))

(assert (=> d!53107 (= res!82628 (isStrictlySorted!327 lt!85684))))

(assert (=> d!53107 (= (lemmaContainsTupThenGetReturnValue!99 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86124)))

(declare-fun b!174252 () Bool)

(declare-fun res!82629 () Bool)

(assert (=> b!174252 (=> (not res!82629) (not e!115063))))

(assert (=> b!174252 (= res!82629 (containsKey!187 lt!85684 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174253 () Bool)

(assert (=> b!174253 (= e!115063 (contains!1155 lt!85684 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53107 res!82628) b!174252))

(assert (= (and b!174252 res!82629) b!174253))

(assert (=> d!53107 m!201267))

(declare-fun m!202829 () Bool)

(assert (=> d!53107 m!202829))

(declare-fun m!202831 () Bool)

(assert (=> d!53107 m!202831))

(declare-fun m!202833 () Bool)

(assert (=> b!174252 m!202833))

(declare-fun m!202835 () Bool)

(assert (=> b!174253 m!202835))

(assert (=> d!52473 d!53107))

(declare-fun b!174254 () Bool)

(declare-fun e!115066 () List!2214)

(declare-fun call!17643 () List!2214)

(assert (=> b!174254 (= e!115066 call!17643)))

(declare-fun b!174255 () Bool)

(declare-fun res!82631 () Bool)

(declare-fun e!115064 () Bool)

(assert (=> b!174255 (=> (not res!82631) (not e!115064))))

(declare-fun lt!86125 () List!2214)

(assert (=> b!174255 (= res!82631 (containsKey!187 lt!86125 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174256 () Bool)

(declare-fun e!115068 () List!2214)

(assert (=> b!174256 (= e!115068 (insertStrictlySorted!102 (t!7012 (toList!1093 call!17561)) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174257 () Bool)

(assert (=> b!174257 (= e!115064 (contains!1155 lt!86125 (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!31191 () Bool)

(declare-fun b!174258 () Bool)

(declare-fun c!31192 () Bool)

(assert (=> b!174258 (= e!115068 (ite c!31192 (t!7012 (toList!1093 call!17561)) (ite c!31191 (Cons!2210 (h!2827 (toList!1093 call!17561)) (t!7012 (toList!1093 call!17561))) Nil!2211)))))

(declare-fun call!17642 () List!2214)

(declare-fun bm!17639 () Bool)

(declare-fun c!31193 () Bool)

(assert (=> bm!17639 (= call!17642 ($colon$colon!97 e!115068 (ite c!31193 (h!2827 (toList!1093 call!17561)) (tuple2!3237 (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31190 () Bool)

(assert (=> bm!17639 (= c!31190 c!31193)))

(declare-fun b!174259 () Bool)

(assert (=> b!174259 (= c!31191 (and ((_ is Cons!2210) (toList!1093 call!17561)) (bvsgt (_1!1629 (h!2827 (toList!1093 call!17561))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115067 () List!2214)

(assert (=> b!174259 (= e!115067 e!115066)))

(declare-fun b!174260 () Bool)

(declare-fun e!115065 () List!2214)

(assert (=> b!174260 (= e!115065 call!17642)))

(declare-fun d!53109 () Bool)

(assert (=> d!53109 e!115064))

(declare-fun res!82630 () Bool)

(assert (=> d!53109 (=> (not res!82630) (not e!115064))))

(assert (=> d!53109 (= res!82630 (isStrictlySorted!327 lt!86125))))

(assert (=> d!53109 (= lt!86125 e!115065)))

(assert (=> d!53109 (= c!31193 (and ((_ is Cons!2210) (toList!1093 call!17561)) (bvslt (_1!1629 (h!2827 (toList!1093 call!17561))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53109 (isStrictlySorted!327 (toList!1093 call!17561))))

(assert (=> d!53109 (= (insertStrictlySorted!102 (toList!1093 call!17561) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86125)))

(declare-fun bm!17640 () Bool)

(declare-fun call!17644 () List!2214)

(assert (=> bm!17640 (= call!17643 call!17644)))

(declare-fun b!174261 () Bool)

(assert (=> b!174261 (= e!115066 call!17643)))

(declare-fun bm!17641 () Bool)

(assert (=> bm!17641 (= call!17644 call!17642)))

(declare-fun b!174262 () Bool)

(assert (=> b!174262 (= e!115065 e!115067)))

(assert (=> b!174262 (= c!31192 (and ((_ is Cons!2210) (toList!1093 call!17561)) (= (_1!1629 (h!2827 (toList!1093 call!17561))) (_1!1629 (tuple2!3237 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174263 () Bool)

(assert (=> b!174263 (= e!115067 call!17644)))

(assert (= (and d!53109 c!31193) b!174260))

(assert (= (and d!53109 (not c!31193)) b!174262))

(assert (= (and b!174262 c!31192) b!174263))

(assert (= (and b!174262 (not c!31192)) b!174259))

(assert (= (and b!174259 c!31191) b!174254))

(assert (= (and b!174259 (not c!31191)) b!174261))

(assert (= (or b!174254 b!174261) bm!17640))

(assert (= (or b!174263 bm!17640) bm!17641))

(assert (= (or b!174260 bm!17641) bm!17639))

(assert (= (and bm!17639 c!31190) b!174256))

(assert (= (and bm!17639 (not c!31190)) b!174258))

(assert (= (and d!53109 res!82630) b!174255))

(assert (= (and b!174255 res!82631) b!174257))

(declare-fun m!202837 () Bool)

(assert (=> d!53109 m!202837))

(declare-fun m!202839 () Bool)

(assert (=> d!53109 m!202839))

(declare-fun m!202841 () Bool)

(assert (=> b!174257 m!202841))

(declare-fun m!202843 () Bool)

(assert (=> b!174256 m!202843))

(declare-fun m!202845 () Bool)

(assert (=> bm!17639 m!202845))

(declare-fun m!202847 () Bool)

(assert (=> b!174255 m!202847))

(assert (=> d!52473 d!53109))

(declare-fun d!53111 () Bool)

(declare-fun res!82632 () Bool)

(declare-fun e!115069 () Bool)

(assert (=> d!53111 (=> res!82632 e!115069)))

(assert (=> d!53111 (= res!82632 (and ((_ is Cons!2210) lt!85581) (= (_1!1629 (h!2827 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(assert (=> d!53111 (= (containsKey!187 lt!85581 (_1!1629 (tuple2!3237 key!828 v!309))) e!115069)))

(declare-fun b!174264 () Bool)

(declare-fun e!115070 () Bool)

(assert (=> b!174264 (= e!115069 e!115070)))

(declare-fun res!82633 () Bool)

(assert (=> b!174264 (=> (not res!82633) (not e!115070))))

(assert (=> b!174264 (= res!82633 (and (or (not ((_ is Cons!2210) lt!85581)) (bvsle (_1!1629 (h!2827 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309)))) ((_ is Cons!2210) lt!85581) (bvslt (_1!1629 (h!2827 lt!85581)) (_1!1629 (tuple2!3237 key!828 v!309)))))))

(declare-fun b!174265 () Bool)

(assert (=> b!174265 (= e!115070 (containsKey!187 (t!7012 lt!85581) (_1!1629 (tuple2!3237 key!828 v!309))))))

(assert (= (and d!53111 (not res!82632)) b!174264))

(assert (= (and b!174264 res!82633) b!174265))

(declare-fun m!202849 () Bool)

(assert (=> b!174265 m!202849))

(assert (=> b!173396 d!53111))

(declare-fun d!53113 () Bool)

(declare-fun res!82634 () Bool)

(declare-fun e!115071 () Bool)

(assert (=> d!53113 (=> res!82634 e!115071)))

(assert (=> d!53113 (= res!82634 (and ((_ is Cons!2210) (t!7012 (toList!1093 lt!85537))) (= (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537)))) key!828)))))

(assert (=> d!53113 (= (containsKey!187 (t!7012 (toList!1093 lt!85537)) key!828) e!115071)))

(declare-fun b!174266 () Bool)

(declare-fun e!115072 () Bool)

(assert (=> b!174266 (= e!115071 e!115072)))

(declare-fun res!82635 () Bool)

(assert (=> b!174266 (=> (not res!82635) (not e!115072))))

(assert (=> b!174266 (= res!82635 (and (or (not ((_ is Cons!2210) (t!7012 (toList!1093 lt!85537)))) (bvsle (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537)))) key!828)) ((_ is Cons!2210) (t!7012 (toList!1093 lt!85537))) (bvslt (_1!1629 (h!2827 (t!7012 (toList!1093 lt!85537)))) key!828)))))

(declare-fun b!174267 () Bool)

(assert (=> b!174267 (= e!115072 (containsKey!187 (t!7012 (t!7012 (toList!1093 lt!85537))) key!828))))

(assert (= (and d!53113 (not res!82634)) b!174266))

(assert (= (and b!174266 res!82635) b!174267))

(declare-fun m!202851 () Bool)

(assert (=> b!174267 m!202851))

(assert (=> b!173480 d!53113))

(declare-fun d!53115 () Bool)

(declare-fun e!115074 () Bool)

(assert (=> d!53115 e!115074))

(declare-fun res!82636 () Bool)

(assert (=> d!53115 (=> res!82636 e!115074)))

(declare-fun lt!86127 () Bool)

(assert (=> d!53115 (= res!82636 (not lt!86127))))

(declare-fun lt!86126 () Bool)

(assert (=> d!53115 (= lt!86127 lt!86126)))

(declare-fun lt!86129 () Unit!5291)

(declare-fun e!115073 () Unit!5291)

(assert (=> d!53115 (= lt!86129 e!115073)))

(declare-fun c!31194 () Bool)

(assert (=> d!53115 (= c!31194 lt!86126)))

(assert (=> d!53115 (= lt!86126 (containsKey!187 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!53115 (= (contains!1152 lt!85753 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!86127)))

(declare-fun b!174268 () Bool)

(declare-fun lt!86128 () Unit!5291)

(assert (=> b!174268 (= e!115073 lt!86128)))

(assert (=> b!174268 (= lt!86128 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!174268 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174269 () Bool)

(declare-fun Unit!5337 () Unit!5291)

(assert (=> b!174269 (= e!115073 Unit!5337)))

(declare-fun b!174270 () Bool)

(assert (=> b!174270 (= e!115074 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85753) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!53115 c!31194) b!174268))

(assert (= (and d!53115 (not c!31194)) b!174269))

(assert (= (and d!53115 (not res!82636)) b!174270))

(declare-fun m!202853 () Bool)

(assert (=> d!53115 m!202853))

(declare-fun m!202855 () Bool)

(assert (=> b!174268 m!202855))

(assert (=> b!174268 m!201459))

(assert (=> b!174268 m!201459))

(declare-fun m!202857 () Bool)

(assert (=> b!174268 m!202857))

(assert (=> b!174270 m!201459))

(assert (=> b!174270 m!201459))

(assert (=> b!174270 m!202857))

(assert (=> d!52509 d!53115))

(declare-fun b!174272 () Bool)

(declare-fun e!115075 () Option!189)

(declare-fun e!115076 () Option!189)

(assert (=> b!174272 (= e!115075 e!115076)))

(declare-fun c!31196 () Bool)

(assert (=> b!174272 (= c!31196 (and ((_ is Cons!2210) lt!85755) (not (= (_1!1629 (h!2827 lt!85755)) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!174273 () Bool)

(assert (=> b!174273 (= e!115076 (getValueByKey!183 (t!7012 lt!85755) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174271 () Bool)

(assert (=> b!174271 (= e!115075 (Some!188 (_2!1629 (h!2827 lt!85755))))))

(declare-fun d!53117 () Bool)

(declare-fun c!31195 () Bool)

(assert (=> d!53117 (= c!31195 (and ((_ is Cons!2210) lt!85755) (= (_1!1629 (h!2827 lt!85755)) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!53117 (= (getValueByKey!183 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) e!115075)))

(declare-fun b!174274 () Bool)

(assert (=> b!174274 (= e!115076 None!187)))

(assert (= (and d!53117 c!31195) b!174271))

(assert (= (and d!53117 (not c!31195)) b!174272))

(assert (= (and b!174272 c!31196) b!174273))

(assert (= (and b!174272 (not c!31196)) b!174274))

(declare-fun m!202859 () Bool)

(assert (=> b!174273 m!202859))

(assert (=> d!52509 d!53117))

(declare-fun d!53119 () Bool)

(assert (=> d!53119 (= (getValueByKey!183 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) (Some!188 (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86130 () Unit!5291)

(assert (=> d!53119 (= lt!86130 (choose!936 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!115077 () Bool)

(assert (=> d!53119 e!115077))

(declare-fun res!82637 () Bool)

(assert (=> d!53119 (=> (not res!82637) (not e!115077))))

(assert (=> d!53119 (= res!82637 (isStrictlySorted!327 lt!85755))))

(assert (=> d!53119 (= (lemmaContainsTupThenGetReturnValue!99 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!86130)))

(declare-fun b!174275 () Bool)

(declare-fun res!82638 () Bool)

(assert (=> b!174275 (=> (not res!82638) (not e!115077))))

(assert (=> b!174275 (= res!82638 (containsKey!187 lt!85755 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174276 () Bool)

(assert (=> b!174276 (= e!115077 (contains!1155 lt!85755 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!53119 res!82637) b!174275))

(assert (= (and b!174275 res!82638) b!174276))

(assert (=> d!53119 m!201453))

(declare-fun m!202861 () Bool)

(assert (=> d!53119 m!202861))

(declare-fun m!202863 () Bool)

(assert (=> d!53119 m!202863))

(declare-fun m!202865 () Bool)

(assert (=> b!174275 m!202865))

(declare-fun m!202867 () Bool)

(assert (=> b!174276 m!202867))

(assert (=> d!52509 d!53119))

(declare-fun b!174277 () Bool)

(declare-fun e!115080 () List!2214)

(declare-fun call!17646 () List!2214)

(assert (=> b!174277 (= e!115080 call!17646)))

(declare-fun b!174278 () Bool)

(declare-fun res!82640 () Bool)

(declare-fun e!115078 () Bool)

(assert (=> b!174278 (=> (not res!82640) (not e!115078))))

(declare-fun lt!86131 () List!2214)

(assert (=> b!174278 (= res!82640 (containsKey!187 lt!86131 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174279 () Bool)

(declare-fun e!115082 () List!2214)

(assert (=> b!174279 (= e!115082 (insertStrictlySorted!102 (t!7012 (toList!1093 lt!85675)) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174280 () Bool)

(assert (=> b!174280 (= e!115078 (contains!1155 lt!86131 (tuple2!3237 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31198 () Bool)

(declare-fun b!174281 () Bool)

(declare-fun c!31199 () Bool)

(assert (=> b!174281 (= e!115082 (ite c!31199 (t!7012 (toList!1093 lt!85675)) (ite c!31198 (Cons!2210 (h!2827 (toList!1093 lt!85675)) (t!7012 (toList!1093 lt!85675))) Nil!2211)))))

(declare-fun bm!17642 () Bool)

(declare-fun call!17645 () List!2214)

(declare-fun c!31200 () Bool)

(assert (=> bm!17642 (= call!17645 ($colon$colon!97 e!115082 (ite c!31200 (h!2827 (toList!1093 lt!85675)) (tuple2!3237 (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31197 () Bool)

(assert (=> bm!17642 (= c!31197 c!31200)))

(declare-fun b!174282 () Bool)

(assert (=> b!174282 (= c!31198 (and ((_ is Cons!2210) (toList!1093 lt!85675)) (bvsgt (_1!1629 (h!2827 (toList!1093 lt!85675))) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(declare-fun e!115081 () List!2214)

(assert (=> b!174282 (= e!115081 e!115080)))

(declare-fun b!174283 () Bool)

(declare-fun e!115079 () List!2214)

(assert (=> b!174283 (= e!115079 call!17645)))

(declare-fun d!53121 () Bool)

(assert (=> d!53121 e!115078))

(declare-fun res!82639 () Bool)

(assert (=> d!53121 (=> (not res!82639) (not e!115078))))

(assert (=> d!53121 (= res!82639 (isStrictlySorted!327 lt!86131))))

(assert (=> d!53121 (= lt!86131 e!115079)))

(assert (=> d!53121 (= c!31200 (and ((_ is Cons!2210) (toList!1093 lt!85675)) (bvslt (_1!1629 (h!2827 (toList!1093 lt!85675))) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!53121 (isStrictlySorted!327 (toList!1093 lt!85675))))

(assert (=> d!53121 (= (insertStrictlySorted!102 (toList!1093 lt!85675) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))) (_2!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248)))) lt!86131)))

(declare-fun bm!17643 () Bool)

(declare-fun call!17647 () List!2214)

(assert (=> bm!17643 (= call!17646 call!17647)))

(declare-fun b!174284 () Bool)

(assert (=> b!174284 (= e!115080 call!17646)))

(declare-fun bm!17644 () Bool)

(assert (=> bm!17644 (= call!17647 call!17645)))

(declare-fun b!174285 () Bool)

(assert (=> b!174285 (= e!115079 e!115081)))

(assert (=> b!174285 (= c!31199 (and ((_ is Cons!2210) (toList!1093 lt!85675)) (= (_1!1629 (h!2827 (toList!1093 lt!85675))) (_1!1629 (tuple2!3237 lt!85666 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!174286 () Bool)

(assert (=> b!174286 (= e!115081 call!17647)))

(assert (= (and d!53121 c!31200) b!174283))

(assert (= (and d!53121 (not c!31200)) b!174285))

(assert (= (and b!174285 c!31199) b!174286))

(assert (= (and b!174285 (not c!31199)) b!174282))

(assert (= (and b!174282 c!31198) b!174277))

(assert (= (and b!174282 (not c!31198)) b!174284))

(assert (= (or b!174277 b!174284) bm!17643))

(assert (= (or b!174286 bm!17643) bm!17644))

(assert (= (or b!174283 bm!17644) bm!17642))

(assert (= (and bm!17642 c!31197) b!174279))

(assert (= (and bm!17642 (not c!31197)) b!174281))

(assert (= (and d!53121 res!82639) b!174278))

(assert (= (and b!174278 res!82640) b!174280))

(declare-fun m!202869 () Bool)

(assert (=> d!53121 m!202869))

(declare-fun m!202871 () Bool)

(assert (=> d!53121 m!202871))

(declare-fun m!202873 () Bool)

(assert (=> b!174280 m!202873))

(declare-fun m!202875 () Bool)

(assert (=> b!174279 m!202875))

(declare-fun m!202877 () Bool)

(assert (=> bm!17642 m!202877))

(declare-fun m!202879 () Bool)

(assert (=> b!174278 m!202879))

(assert (=> d!52509 d!53121))

(assert (=> b!173546 d!52845))

(assert (=> b!173546 d!52847))

(declare-fun d!53123 () Bool)

(declare-fun e!115084 () Bool)

(assert (=> d!53123 e!115084))

(declare-fun res!82641 () Bool)

(assert (=> d!53123 (=> res!82641 e!115084)))

(declare-fun lt!86133 () Bool)

(assert (=> d!53123 (= res!82641 (not lt!86133))))

(declare-fun lt!86132 () Bool)

(assert (=> d!53123 (= lt!86133 lt!86132)))

(declare-fun lt!86135 () Unit!5291)

(declare-fun e!115083 () Unit!5291)

(assert (=> d!53123 (= lt!86135 e!115083)))

(declare-fun c!31201 () Bool)

(assert (=> d!53123 (= c!31201 lt!86132)))

(assert (=> d!53123 (= lt!86132 (containsKey!187 (toList!1093 lt!85816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53123 (= (contains!1152 lt!85816 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86133)))

(declare-fun b!174287 () Bool)

(declare-fun lt!86134 () Unit!5291)

(assert (=> b!174287 (= e!115083 lt!86134)))

(assert (=> b!174287 (= lt!86134 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174287 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174288 () Bool)

(declare-fun Unit!5338 () Unit!5291)

(assert (=> b!174288 (= e!115083 Unit!5338)))

(declare-fun b!174289 () Bool)

(assert (=> b!174289 (= e!115084 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53123 c!31201) b!174287))

(assert (= (and d!53123 (not c!31201)) b!174288))

(assert (= (and d!53123 (not res!82641)) b!174289))

(declare-fun m!202881 () Bool)

(assert (=> d!53123 m!202881))

(declare-fun m!202883 () Bool)

(assert (=> b!174287 m!202883))

(declare-fun m!202885 () Bool)

(assert (=> b!174287 m!202885))

(assert (=> b!174287 m!202885))

(declare-fun m!202887 () Bool)

(assert (=> b!174287 m!202887))

(assert (=> b!174289 m!202885))

(assert (=> b!174289 m!202885))

(assert (=> b!174289 m!202887))

(assert (=> b!173503 d!53123))

(declare-fun d!53125 () Bool)

(assert (=> d!53125 (isDefined!137 (getValueByKey!183 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!86136 () Unit!5291)

(assert (=> d!53125 (= lt!86136 (choose!939 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115085 () Bool)

(assert (=> d!53125 e!115085))

(declare-fun res!82642 () Bool)

(assert (=> d!53125 (=> (not res!82642) (not e!115085))))

(assert (=> d!53125 (= res!82642 (isStrictlySorted!327 (toList!1093 lt!85637)))))

(assert (=> d!53125 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)) lt!86136)))

(declare-fun b!174290 () Bool)

(assert (=> b!174290 (= e!115085 (containsKey!187 (toList!1093 lt!85637) (select (arr!3454 (_keys!5437 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53125 res!82642) b!174290))

(assert (=> d!53125 m!201133))

(assert (=> d!53125 m!201687))

(assert (=> d!53125 m!201687))

(assert (=> d!53125 m!201717))

(assert (=> d!53125 m!201133))

(declare-fun m!202889 () Bool)

(assert (=> d!53125 m!202889))

(assert (=> d!53125 m!202245))

(assert (=> b!174290 m!201133))

(assert (=> b!174290 m!201713))

(assert (=> b!173541 d!53125))

(assert (=> b!173541 d!52829))

(assert (=> b!173541 d!52831))

(declare-fun mapNonEmpty!6959 () Bool)

(declare-fun mapRes!6959 () Bool)

(declare-fun tp!15608 () Bool)

(declare-fun e!115086 () Bool)

(assert (=> mapNonEmpty!6959 (= mapRes!6959 (and tp!15608 e!115086))))

(declare-fun mapValue!6959 () ValueCell!1697)

(declare-fun mapKey!6959 () (_ BitVec 32))

(declare-fun mapRest!6959 () (Array (_ BitVec 32) ValueCell!1697))

(assert (=> mapNonEmpty!6959 (= mapRest!6958 (store mapRest!6959 mapKey!6959 mapValue!6959))))

(declare-fun b!174292 () Bool)

(declare-fun e!115087 () Bool)

(assert (=> b!174292 (= e!115087 tp_is_empty!4081)))

(declare-fun b!174291 () Bool)

(assert (=> b!174291 (= e!115086 tp_is_empty!4081)))

(declare-fun condMapEmpty!6959 () Bool)

(declare-fun mapDefault!6959 () ValueCell!1697)

(assert (=> mapNonEmpty!6958 (= condMapEmpty!6959 (= mapRest!6958 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6959)))))

(assert (=> mapNonEmpty!6958 (= tp!15607 (and e!115087 mapRes!6959))))

(declare-fun mapIsEmpty!6959 () Bool)

(assert (=> mapIsEmpty!6959 mapRes!6959))

(assert (= (and mapNonEmpty!6958 condMapEmpty!6959) mapIsEmpty!6959))

(assert (= (and mapNonEmpty!6958 (not condMapEmpty!6959)) mapNonEmpty!6959))

(assert (= (and mapNonEmpty!6959 ((_ is ValueCellFull!1697) mapValue!6959)) b!174291))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1697) mapDefault!6959)) b!174292))

(declare-fun m!202891 () Bool)

(assert (=> mapNonEmpty!6959 m!202891))

(declare-fun b_lambda!6955 () Bool)

(assert (= b_lambda!6929 (or (and b!173125 b_free!4309 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 lt!85539))) b_lambda!6955)))

(declare-fun b_lambda!6957 () Bool)

(assert (= b_lambda!6945 (or (and b!173125 b_free!4309) b_lambda!6957)))

(declare-fun b_lambda!6959 () Bool)

(assert (= b_lambda!6947 (or (and b!173125 b_free!4309) b_lambda!6959)))

(declare-fun b_lambda!6961 () Bool)

(assert (= b_lambda!6943 (or (and b!173125 b_free!4309) b_lambda!6961)))

(declare-fun b_lambda!6963 () Bool)

(assert (= b_lambda!6949 (or (and b!173125 b_free!4309) b_lambda!6963)))

(check-sat (not b!173651) (not d!53115) (not d!53103) (not d!53035) (not d!52677) (not d!52867) (not bm!17602) (not b!174280) (not b!174036) (not d!53011) (not d!52823) (not b!174014) (not b!173853) (not b!174247) (not b!174223) (not d!52957) (not d!52751) (not b!174213) (not d!52993) (not d!52883) (not b!173723) (not b!174063) (not d!52861) (not d!52715) (not b!174006) (not b!174146) (not b!174157) (not bm!17639) (not b!173899) (not d!53065) (not b!174168) (not b!174276) (not b!173660) (not b!173688) (not b!174192) (not b!173682) (not b!173784) (not d!52855) (not b!174226) (not d!53091) (not b!174112) (not b_lambda!6953) (not b!174115) (not b!174154) (not d!53047) (not b!174170) (not b!174070) (not b!173663) (not b!174255) (not mapNonEmpty!6959) (not b!173903) (not d!53041) (not b!173876) (not d!52829) (not d!53097) (not d!52627) (not b!174043) (not b_next!4309) (not b!174107) (not d!52843) (not d!53085) (not b!173753) (not bm!17605) (not bm!17636) (not b!173677) (not b!173925) b_and!10753 (not b!174023) (not b!173606) (not d!53019) (not b!174064) (not d!53053) (not d!52863) (not b!173638) (not bm!17626) (not bm!17624) (not b!174078) (not b!174106) (not b!173900) (not b!174267) (not b!174232) (not bm!17599) (not b!174256) (not d!52995) (not bm!17632) (not d!52739) (not b!173627) (not bm!17616) (not b!173731) (not b!173935) (not b!173922) (not d!53123) (not b!174184) (not d!52765) (not d!52679) (not d!52781) (not b!173644) (not d!52941) (not bm!17596) (not b!173982) (not d!52973) (not b!174040) (not b!174082) (not b!173996) (not d!52783) (not d!52747) (not b!173756) (not b!174177) (not b!174224) (not d!52647) (not d!53125) (not b!174045) (not d!52817) (not b!173623) (not d!52985) (not b!173998) (not b!173705) (not b!173897) (not b!173692) (not d!53061) (not d!52849) (not b!173738) (not b_lambda!6957) (not b!174253) (not d!53121) (not bm!17615) (not b!173952) (not b_lambda!6959) (not d!53033) (not b!173621) (not d!52945) (not b!173755) (not b!173970) (not b!174110) (not b!173766) (not b!173975) (not d!53051) (not b!174287) (not b!174156) (not b!173942) (not b!173849) (not b!174257) (not b!173940) (not d!53037) (not b!173969) (not b!173728) (not b!173615) (not b!173655) (not b!173830) (not b_lambda!6937) (not d!52737) (not bm!17629) (not b!173734) (not b!173976) (not b!174000) (not b!173815) (not b!174092) (not b!174235) (not b!174059) (not b!174165) (not d!52713) (not b!173931) (not b!173773) (not d!52989) (not b!173961) (not d!52733) (not b!173725) (not b_lambda!6961) (not b!174234) (not b!174265) (not bm!17625) (not b!174118) (not d!52691) (not b!174075) (not b!174244) (not b!173856) (not b!174147) (not b!173653) (not bm!17612) (not b!173605) (not b!173987) (not b!174179) (not d!52955) (not d!52965) (not b!174015) (not b!173612) (not d!52749) (not b!174134) (not b!173947) (not d!52727) (not b!173745) (not bm!17608) (not b!174052) (not d!53109) (not d!52911) (not d!52659) (not b!174138) (not b!174081) (not b!174054) (not d!52625) (not d!53029) (not d!52967) (not d!52909) (not b!174103) (not d!53017) (not b!173844) (not b!173973) (not d!52719) (not b!173950) (not b!173776) (not b!173625) (not b!174145) (not d!52723) (not b!174196) (not b!174094) (not b!174149) (not b!173791) (not d!53077) (not b!174174) (not b!174209) (not d!52641) (not d!52809) (not b!173916) (not d!52933) (not b!173934) (not b!173927) (not b!174025) (not d!52983) (not d!52623) (not b!174176) (not b!173902) (not b!173919) (not d!53009) (not bm!17611) (not b!174053) (not d!52871) (not b!174003) (not b!173938) (not d!52853) (not d!53007) (not b!174211) (not b!173779) (not b!174093) (not b!173861) (not b!174120) (not d!52689) (not b!174121) (not b!173657) (not b!174113) (not b!174068) (not bm!17642) (not b!173628) (not d!52657) (not d!52651) (not d!52869) (not d!52981) (not b!174042) (not b!173892) (not d!52703) (not b!173948) (not b!173799) (not b_lambda!6951) (not d!53119) (not d!53013) (not b!173846) (not d!52913) (not d!52667) (not b!173607) (not b!174065) (not b!174016) (not d!53025) (not d!52707) (not b!173858) (not b!174012) (not b!173883) (not b!174236) (not b!173787) (not d!52959) (not d!52643) (not d!52631) (not d!52701) (not b!174278) (not b_lambda!6955) (not b!174194) (not d!52807) (not bm!17620) (not b!173882) (not b!174186) (not d!52919) (not d!52799) (not b!173811) (not d!52633) (not b!173752) (not b!173789) (not b!174090) (not b!173643) (not d!52947) (not b!174164) (not b!173838) (not b!174108) (not b!173624) (not b!174252) (not b!174037) (not b!173834) (not d!52711) (not b!173877) (not bm!17617) (not b!174231) (not b!173951) (not d!52925) (not b!173679) (not b!173945) (not d!53095) (not bm!17623) (not b!174011) (not bm!17594) (not bm!17633) (not b_lambda!6921) (not b!174072) (not b!173640) (not b!174189) (not d!53099) (not b!173804) (not b!174229) (not b!174290) (not d!52939) (not b!173693) (not b!173826) (not d!52779) (not b!174195) (not d!52845) (not b!174167) (not d!53055) (not b!173823) (not b_lambda!6939) (not b!173610) (not b!174105) (not b!173913) (not b!173747) (not b!173837) (not b!174048) (not b!174089) (not d!52821) (not b!173878) (not b!173639) (not b!173681) (not b!173992) (not b!173984) (not b!173860) (not b!174026) (not b!174047) (not b!173786) (not d!52759) (not d!52865) (not b!173685) (not b!174279) (not b!173891) (not d!52805) (not b!173820) tp_is_empty!4081 (not b!173875) (not b!173733) (not b!173673) (not d!52971) (not b!173862) (not b!173979) (not b!174166) (not d!52897) (not d!52763) (not b!173802) (not b!173817) (not b!173870) (not b!174009) (not d!53067) (not b!174073) (not b!174268) (not b!173603) (not d!52635) (not b!174001) (not b!174141) (not d!52803) (not b!174123) (not b!174245) (not b!174205) (not b!174087) (not b!174152) (not d!52935) (not b!173635) (not b!173971) (not b!173670) (not b!174057) (not d!52693) (not b!173873) (not b!173629) (not d!52661) (not b!174250) (not b!173808) (not b!173806) (not b!173790) (not b!173666) (not b!173757) (not b!173963) (not b!173641) (not d!53049) (not b!173678) (not d!53043) (not d!52987) (not d!52697) (not b!174125) (not b!173904) (not d!52905) (not d!52893) (not b!173874) (not d!53027) (not d!53079) (not b!174061) (not b!173736) (not b!174159) (not b!174084) (not d!53087) (not b!174038) (not d!52637) (not b!174289) (not d!52731) (not b!174182) (not b!174124) (not b!173750) (not d!53081) (not b!173601) (not d!53107) (not d!52801) (not b!174150) (not d!52729) (not b!173726) (not b!173680) (not b!173614) (not d!52921) (not d!52979) (not b!173778) (not d!52645) (not d!53101) (not b!174004) (not b!174050) (not b!174032) (not d!53031) (not b!173781) (not b!174215) (not b!173986) (not d!53039) (not d!52685) (not b!173841) (not b_lambda!6963) (not b!173879) (not b!173676) (not d!52649) (not b_lambda!6935) (not d!53045) (not b!174221) (not b!174191) (not d!52881) (not b!174270) (not b!174275) (not d!52683) (not b!174273) (not b!173989) (not b_lambda!6941) (not b!173885) (not d!52929) (not b!173691) (not b!174028) (not b!174173) (not b!173642) (not bm!17595) (not b!173894) (not b!174162) (not b!174034) (not b!173617) (not b_lambda!6923) (not b!173737) (not b!173648))
(check-sat b_and!10753 (not b_next!4309))
