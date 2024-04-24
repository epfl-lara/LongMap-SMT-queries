; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17460 () Bool)

(assert start!17460)

(declare-fun b!175072 () Bool)

(declare-fun b_free!4327 () Bool)

(declare-fun b_next!4327 () Bool)

(assert (=> b!175072 (= b_free!4327 (not b_next!4327))))

(declare-fun tp!15657 () Bool)

(declare-fun b_and!10815 () Bool)

(assert (=> b!175072 (= tp!15657 b_and!10815)))

(declare-fun e!115575 () Bool)

(declare-fun tp_is_empty!4099 () Bool)

(declare-datatypes ((V!5113 0))(
  ( (V!5114 (val!2094 Int)) )
))
(declare-datatypes ((ValueCell!1706 0))(
  ( (ValueCellFull!1706 (v!3968 V!5113)) (EmptyCell!1706) )
))
(declare-datatypes ((array!7321 0))(
  ( (array!7322 (arr!3476 (Array (_ BitVec 32) (_ BitVec 64))) (size!3777 (_ BitVec 32))) )
))
(declare-datatypes ((array!7323 0))(
  ( (array!7324 (arr!3477 (Array (_ BitVec 32) ValueCell!1706)) (size!3778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2320 0))(
  ( (LongMapFixedSize!2321 (defaultEntry!3613 Int) (mask!8502 (_ BitVec 32)) (extraKeys!3350 (_ BitVec 32)) (zeroValue!3454 V!5113) (minValue!3454 V!5113) (_size!1209 (_ BitVec 32)) (_keys!5461 array!7321) (_values!3596 array!7323) (_vacant!1209 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2320)

(declare-fun e!115579 () Bool)

(declare-fun array_inv!2241 (array!7321) Bool)

(declare-fun array_inv!2242 (array!7323) Bool)

(assert (=> b!175072 (= e!115579 (and tp!15657 tp_is_empty!4099 (array_inv!2241 (_keys!5461 thiss!1248)) (array_inv!2242 (_values!3596 thiss!1248)) e!115575))))

(declare-fun b!175073 () Bool)

(declare-fun e!115576 () Bool)

(assert (=> b!175073 (= e!115576 tp_is_empty!4099)))

(declare-fun b!175074 () Bool)

(declare-fun res!83014 () Bool)

(declare-fun e!115580 () Bool)

(assert (=> b!175074 (=> (not res!83014) (not e!115580))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!540 0))(
  ( (MissingZero!540 (index!4328 (_ BitVec 32))) (Found!540 (index!4329 (_ BitVec 32))) (Intermediate!540 (undefined!1352 Bool) (index!4330 (_ BitVec 32)) (x!19254 (_ BitVec 32))) (Undefined!540) (MissingVacant!540 (index!4331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7321 (_ BitVec 32)) SeekEntryResult!540)

(assert (=> b!175074 (= res!83014 ((_ is Undefined!540) (seekEntryOrOpen!0 key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248))))))

(declare-fun b!175075 () Bool)

(declare-fun e!115578 () Bool)

(declare-fun mapRes!6987 () Bool)

(assert (=> b!175075 (= e!115575 (and e!115578 mapRes!6987))))

(declare-fun condMapEmpty!6987 () Bool)

(declare-fun mapDefault!6987 () ValueCell!1706)

(assert (=> b!175075 (= condMapEmpty!6987 (= (arr!3477 (_values!3596 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6987)))))

(declare-fun b!175076 () Bool)

(declare-fun res!83012 () Bool)

(assert (=> b!175076 (=> (not res!83012) (not e!115580))))

(declare-datatypes ((tuple2!3214 0))(
  ( (tuple2!3215 (_1!1618 (_ BitVec 64)) (_2!1618 V!5113)) )
))
(declare-datatypes ((List!2197 0))(
  ( (Nil!2194) (Cons!2193 (h!2811 tuple2!3214) (t!7005 List!2197)) )
))
(declare-datatypes ((ListLongMap!2147 0))(
  ( (ListLongMap!2148 (toList!1089 List!2197)) )
))
(declare-fun contains!1158 (ListLongMap!2147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!744 (array!7321 array!7323 (_ BitVec 32) (_ BitVec 32) V!5113 V!5113 (_ BitVec 32) Int) ListLongMap!2147)

(assert (=> b!175076 (= res!83012 (contains!1158 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) key!828))))

(declare-fun res!83011 () Bool)

(assert (=> start!17460 (=> (not res!83011) (not e!115580))))

(declare-fun valid!994 (LongMapFixedSize!2320) Bool)

(assert (=> start!17460 (= res!83011 (valid!994 thiss!1248))))

(assert (=> start!17460 e!115580))

(assert (=> start!17460 e!115579))

(assert (=> start!17460 true))

(declare-fun b!175077 () Bool)

(declare-fun res!83013 () Bool)

(assert (=> b!175077 (=> (not res!83013) (not e!115580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175077 (= res!83013 (validMask!0 (mask!8502 thiss!1248)))))

(declare-fun b!175078 () Bool)

(assert (=> b!175078 (= e!115580 (and (= (size!3778 (_values!3596 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8502 thiss!1248))) (not (= (size!3777 (_keys!5461 thiss!1248)) (size!3778 (_values!3596 thiss!1248))))))))

(declare-fun mapNonEmpty!6987 () Bool)

(declare-fun tp!15656 () Bool)

(assert (=> mapNonEmpty!6987 (= mapRes!6987 (and tp!15656 e!115576))))

(declare-fun mapKey!6987 () (_ BitVec 32))

(declare-fun mapValue!6987 () ValueCell!1706)

(declare-fun mapRest!6987 () (Array (_ BitVec 32) ValueCell!1706))

(assert (=> mapNonEmpty!6987 (= (arr!3477 (_values!3596 thiss!1248)) (store mapRest!6987 mapKey!6987 mapValue!6987))))

(declare-fun b!175079 () Bool)

(declare-fun res!83015 () Bool)

(assert (=> b!175079 (=> (not res!83015) (not e!115580))))

(assert (=> b!175079 (= res!83015 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6987 () Bool)

(assert (=> mapIsEmpty!6987 mapRes!6987))

(declare-fun b!175080 () Bool)

(assert (=> b!175080 (= e!115578 tp_is_empty!4099)))

(assert (= (and start!17460 res!83011) b!175079))

(assert (= (and b!175079 res!83015) b!175074))

(assert (= (and b!175074 res!83014) b!175076))

(assert (= (and b!175076 res!83012) b!175077))

(assert (= (and b!175077 res!83013) b!175078))

(assert (= (and b!175075 condMapEmpty!6987) mapIsEmpty!6987))

(assert (= (and b!175075 (not condMapEmpty!6987)) mapNonEmpty!6987))

(assert (= (and mapNonEmpty!6987 ((_ is ValueCellFull!1706) mapValue!6987)) b!175073))

(assert (= (and b!175075 ((_ is ValueCellFull!1706) mapDefault!6987)) b!175080))

(assert (= b!175072 b!175075))

(assert (= start!17460 b!175072))

(declare-fun m!204189 () Bool)

(assert (=> mapNonEmpty!6987 m!204189))

(declare-fun m!204191 () Bool)

(assert (=> b!175076 m!204191))

(assert (=> b!175076 m!204191))

(declare-fun m!204193 () Bool)

(assert (=> b!175076 m!204193))

(declare-fun m!204195 () Bool)

(assert (=> b!175074 m!204195))

(declare-fun m!204197 () Bool)

(assert (=> b!175072 m!204197))

(declare-fun m!204199 () Bool)

(assert (=> b!175072 m!204199))

(declare-fun m!204201 () Bool)

(assert (=> b!175077 m!204201))

(declare-fun m!204203 () Bool)

(assert (=> start!17460 m!204203))

(check-sat (not b!175072) (not start!17460) b_and!10815 (not mapNonEmpty!6987) tp_is_empty!4099 (not b!175076) (not b!175077) (not b_next!4327) (not b!175074))
(check-sat b_and!10815 (not b_next!4327))
(get-model)

(declare-fun d!53457 () Bool)

(declare-fun e!115621 () Bool)

(assert (=> d!53457 e!115621))

(declare-fun res!83048 () Bool)

(assert (=> d!53457 (=> res!83048 e!115621)))

(declare-fun lt!86669 () Bool)

(assert (=> d!53457 (= res!83048 (not lt!86669))))

(declare-fun lt!86672 () Bool)

(assert (=> d!53457 (= lt!86669 lt!86672)))

(declare-datatypes ((Unit!5377 0))(
  ( (Unit!5378) )
))
(declare-fun lt!86671 () Unit!5377)

(declare-fun e!115622 () Unit!5377)

(assert (=> d!53457 (= lt!86671 e!115622)))

(declare-fun c!31358 () Bool)

(assert (=> d!53457 (= c!31358 lt!86672)))

(declare-fun containsKey!192 (List!2197 (_ BitVec 64)) Bool)

(assert (=> d!53457 (= lt!86672 (containsKey!192 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(assert (=> d!53457 (= (contains!1158 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) key!828) lt!86669)))

(declare-fun b!175141 () Bool)

(declare-fun lt!86670 () Unit!5377)

(assert (=> b!175141 (= e!115622 lt!86670)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!140 (List!2197 (_ BitVec 64)) Unit!5377)

(assert (=> b!175141 (= lt!86670 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-datatypes ((Option!195 0))(
  ( (Some!194 (v!3971 V!5113)) (None!193) )
))
(declare-fun isDefined!141 (Option!195) Bool)

(declare-fun getValueByKey!189 (List!2197 (_ BitVec 64)) Option!195)

(assert (=> b!175141 (isDefined!141 (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun b!175142 () Bool)

(declare-fun Unit!5379 () Unit!5377)

(assert (=> b!175142 (= e!115622 Unit!5379)))

(declare-fun b!175143 () Bool)

(assert (=> b!175143 (= e!115621 (isDefined!141 (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828)))))

(assert (= (and d!53457 c!31358) b!175141))

(assert (= (and d!53457 (not c!31358)) b!175142))

(assert (= (and d!53457 (not res!83048)) b!175143))

(declare-fun m!204237 () Bool)

(assert (=> d!53457 m!204237))

(declare-fun m!204239 () Bool)

(assert (=> b!175141 m!204239))

(declare-fun m!204241 () Bool)

(assert (=> b!175141 m!204241))

(assert (=> b!175141 m!204241))

(declare-fun m!204243 () Bool)

(assert (=> b!175141 m!204243))

(assert (=> b!175143 m!204241))

(assert (=> b!175143 m!204241))

(assert (=> b!175143 m!204243))

(assert (=> b!175076 d!53457))

(declare-fun b!175186 () Bool)

(declare-fun e!115649 () Unit!5377)

(declare-fun Unit!5380 () Unit!5377)

(assert (=> b!175186 (= e!115649 Unit!5380)))

(declare-fun b!175187 () Bool)

(declare-fun res!83071 () Bool)

(declare-fun e!115659 () Bool)

(assert (=> b!175187 (=> (not res!83071) (not e!115659))))

(declare-fun e!115651 () Bool)

(assert (=> b!175187 (= res!83071 e!115651)))

(declare-fun res!83067 () Bool)

(assert (=> b!175187 (=> res!83067 e!115651)))

(declare-fun e!115657 () Bool)

(assert (=> b!175187 (= res!83067 (not e!115657))))

(declare-fun res!83075 () Bool)

(assert (=> b!175187 (=> (not res!83075) (not e!115657))))

(assert (=> b!175187 (= res!83075 (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175188 () Bool)

(declare-fun e!115654 () Bool)

(declare-fun e!115652 () Bool)

(assert (=> b!175188 (= e!115654 e!115652)))

(declare-fun res!83068 () Bool)

(declare-fun call!17728 () Bool)

(assert (=> b!175188 (= res!83068 call!17728)))

(assert (=> b!175188 (=> (not res!83068) (not e!115652))))

(declare-fun bm!17725 () Bool)

(declare-fun call!17731 () Bool)

(declare-fun lt!86736 () ListLongMap!2147)

(assert (=> bm!17725 (= call!17731 (contains!1158 lt!86736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17726 () Bool)

(assert (=> bm!17726 (= call!17728 (contains!1158 lt!86736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175190 () Bool)

(declare-fun e!115656 () ListLongMap!2147)

(declare-fun call!17730 () ListLongMap!2147)

(declare-fun +!250 (ListLongMap!2147 tuple2!3214) ListLongMap!2147)

(assert (=> b!175190 (= e!115656 (+!250 call!17730 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))

(declare-fun b!175191 () Bool)

(declare-fun c!31372 () Bool)

(assert (=> b!175191 (= c!31372 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115653 () ListLongMap!2147)

(declare-fun e!115661 () ListLongMap!2147)

(assert (=> b!175191 (= e!115653 e!115661)))

(declare-fun b!175192 () Bool)

(declare-fun e!115650 () Bool)

(assert (=> b!175192 (= e!115651 e!115650)))

(declare-fun res!83070 () Bool)

(assert (=> b!175192 (=> (not res!83070) (not e!115650))))

(assert (=> b!175192 (= res!83070 (contains!1158 lt!86736 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175193 () Bool)

(declare-fun res!83073 () Bool)

(assert (=> b!175193 (=> (not res!83073) (not e!115659))))

(declare-fun e!115655 () Bool)

(assert (=> b!175193 (= res!83073 e!115655)))

(declare-fun c!31373 () Bool)

(assert (=> b!175193 (= c!31373 (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17727 () Bool)

(declare-fun call!17733 () ListLongMap!2147)

(assert (=> bm!17727 (= call!17733 call!17730)))

(declare-fun call!17734 () ListLongMap!2147)

(declare-fun c!31371 () Bool)

(declare-fun call!17729 () ListLongMap!2147)

(declare-fun c!31376 () Bool)

(declare-fun call!17732 () ListLongMap!2147)

(declare-fun bm!17728 () Bool)

(assert (=> bm!17728 (= call!17730 (+!250 (ite c!31376 call!17729 (ite c!31371 call!17732 call!17734)) (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun b!175194 () Bool)

(assert (=> b!175194 (= e!115655 (not call!17731))))

(declare-fun b!175195 () Bool)

(assert (=> b!175195 (= e!115653 call!17733)))

(declare-fun b!175196 () Bool)

(assert (=> b!175196 (= e!115656 e!115653)))

(assert (=> b!175196 (= c!31371 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!53459 () Bool)

(assert (=> d!53459 e!115659))

(declare-fun res!83072 () Bool)

(assert (=> d!53459 (=> (not res!83072) (not e!115659))))

(assert (=> d!53459 (= res!83072 (or (bvsge #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))))

(declare-fun lt!86726 () ListLongMap!2147)

(assert (=> d!53459 (= lt!86736 lt!86726)))

(declare-fun lt!86734 () Unit!5377)

(assert (=> d!53459 (= lt!86734 e!115649)))

(declare-fun c!31374 () Bool)

(declare-fun e!115660 () Bool)

(assert (=> d!53459 (= c!31374 e!115660)))

(declare-fun res!83074 () Bool)

(assert (=> d!53459 (=> (not res!83074) (not e!115660))))

(assert (=> d!53459 (= res!83074 (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53459 (= lt!86726 e!115656)))

(assert (=> d!53459 (= c!31376 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53459 (validMask!0 (mask!8502 thiss!1248))))

(assert (=> d!53459 (= (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) lt!86736)))

(declare-fun b!175189 () Bool)

(assert (=> b!175189 (= e!115654 (not call!17728))))

(declare-fun b!175197 () Bool)

(assert (=> b!175197 (= e!115661 call!17734)))

(declare-fun b!175198 () Bool)

(declare-fun apply!133 (ListLongMap!2147 (_ BitVec 64)) V!5113)

(declare-fun get!1989 (ValueCell!1706 V!5113) V!5113)

(declare-fun dynLambda!476 (Int (_ BitVec 64)) V!5113)

(assert (=> b!175198 (= e!115650 (= (apply!133 lt!86736 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)) (get!1989 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3778 (_values!3596 thiss!1248))))))

(assert (=> b!175198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175199 () Bool)

(declare-fun e!115658 () Bool)

(assert (=> b!175199 (= e!115658 (= (apply!133 lt!86736 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3454 thiss!1248)))))

(declare-fun bm!17729 () Bool)

(assert (=> bm!17729 (= call!17734 call!17732)))

(declare-fun b!175200 () Bool)

(assert (=> b!175200 (= e!115659 e!115654)))

(declare-fun c!31375 () Bool)

(assert (=> b!175200 (= c!31375 (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175201 () Bool)

(declare-fun lt!86725 () Unit!5377)

(assert (=> b!175201 (= e!115649 lt!86725)))

(declare-fun lt!86729 () ListLongMap!2147)

(declare-fun getCurrentListMapNoExtraKeys!164 (array!7321 array!7323 (_ BitVec 32) (_ BitVec 32) V!5113 V!5113 (_ BitVec 32) Int) ListLongMap!2147)

(assert (=> b!175201 (= lt!86729 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86720 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86718 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86718 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86737 () Unit!5377)

(declare-fun addStillContains!109 (ListLongMap!2147 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5377)

(assert (=> b!175201 (= lt!86737 (addStillContains!109 lt!86729 lt!86720 (zeroValue!3454 thiss!1248) lt!86718))))

(assert (=> b!175201 (contains!1158 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) lt!86718)))

(declare-fun lt!86723 () Unit!5377)

(assert (=> b!175201 (= lt!86723 lt!86737)))

(declare-fun lt!86719 () ListLongMap!2147)

(assert (=> b!175201 (= lt!86719 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86727 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86733 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86733 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86738 () Unit!5377)

(declare-fun addApplyDifferent!109 (ListLongMap!2147 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5377)

(assert (=> b!175201 (= lt!86738 (addApplyDifferent!109 lt!86719 lt!86727 (minValue!3454 thiss!1248) lt!86733))))

(assert (=> b!175201 (= (apply!133 (+!250 lt!86719 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) lt!86733) (apply!133 lt!86719 lt!86733))))

(declare-fun lt!86731 () Unit!5377)

(assert (=> b!175201 (= lt!86731 lt!86738)))

(declare-fun lt!86735 () ListLongMap!2147)

(assert (=> b!175201 (= lt!86735 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86721 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86717 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86717 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86722 () Unit!5377)

(assert (=> b!175201 (= lt!86722 (addApplyDifferent!109 lt!86735 lt!86721 (zeroValue!3454 thiss!1248) lt!86717))))

(assert (=> b!175201 (= (apply!133 (+!250 lt!86735 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) lt!86717) (apply!133 lt!86735 lt!86717))))

(declare-fun lt!86728 () Unit!5377)

(assert (=> b!175201 (= lt!86728 lt!86722)))

(declare-fun lt!86724 () ListLongMap!2147)

(assert (=> b!175201 (= lt!86724 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86730 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86730 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86732 () (_ BitVec 64))

(assert (=> b!175201 (= lt!86732 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175201 (= lt!86725 (addApplyDifferent!109 lt!86724 lt!86730 (minValue!3454 thiss!1248) lt!86732))))

(assert (=> b!175201 (= (apply!133 (+!250 lt!86724 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) lt!86732) (apply!133 lt!86724 lt!86732))))

(declare-fun b!175202 () Bool)

(assert (=> b!175202 (= e!115655 e!115658)))

(declare-fun res!83069 () Bool)

(assert (=> b!175202 (= res!83069 call!17731)))

(assert (=> b!175202 (=> (not res!83069) (not e!115658))))

(declare-fun b!175203 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175203 (= e!115660 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17730 () Bool)

(assert (=> bm!17730 (= call!17732 call!17729)))

(declare-fun b!175204 () Bool)

(assert (=> b!175204 (= e!115657 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175205 () Bool)

(assert (=> b!175205 (= e!115661 call!17733)))

(declare-fun bm!17731 () Bool)

(assert (=> bm!17731 (= call!17729 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun b!175206 () Bool)

(assert (=> b!175206 (= e!115652 (= (apply!133 lt!86736 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3454 thiss!1248)))))

(assert (= (and d!53459 c!31376) b!175190))

(assert (= (and d!53459 (not c!31376)) b!175196))

(assert (= (and b!175196 c!31371) b!175195))

(assert (= (and b!175196 (not c!31371)) b!175191))

(assert (= (and b!175191 c!31372) b!175205))

(assert (= (and b!175191 (not c!31372)) b!175197))

(assert (= (or b!175205 b!175197) bm!17729))

(assert (= (or b!175195 bm!17729) bm!17730))

(assert (= (or b!175195 b!175205) bm!17727))

(assert (= (or b!175190 bm!17730) bm!17731))

(assert (= (or b!175190 bm!17727) bm!17728))

(assert (= (and d!53459 res!83074) b!175203))

(assert (= (and d!53459 c!31374) b!175201))

(assert (= (and d!53459 (not c!31374)) b!175186))

(assert (= (and d!53459 res!83072) b!175187))

(assert (= (and b!175187 res!83075) b!175204))

(assert (= (and b!175187 (not res!83067)) b!175192))

(assert (= (and b!175192 res!83070) b!175198))

(assert (= (and b!175187 res!83071) b!175193))

(assert (= (and b!175193 c!31373) b!175202))

(assert (= (and b!175193 (not c!31373)) b!175194))

(assert (= (and b!175202 res!83069) b!175199))

(assert (= (or b!175202 b!175194) bm!17725))

(assert (= (and b!175193 res!83073) b!175200))

(assert (= (and b!175200 c!31375) b!175188))

(assert (= (and b!175200 (not c!31375)) b!175189))

(assert (= (and b!175188 res!83068) b!175206))

(assert (= (or b!175188 b!175189) bm!17726))

(declare-fun b_lambda!7021 () Bool)

(assert (=> (not b_lambda!7021) (not b!175198)))

(declare-fun t!7008 () Bool)

(declare-fun tb!2769 () Bool)

(assert (=> (and b!175072 (= (defaultEntry!3613 thiss!1248) (defaultEntry!3613 thiss!1248)) t!7008) tb!2769))

(declare-fun result!4597 () Bool)

(assert (=> tb!2769 (= result!4597 tp_is_empty!4099)))

(assert (=> b!175198 t!7008))

(declare-fun b_and!10821 () Bool)

(assert (= b_and!10815 (and (=> t!7008 result!4597) b_and!10821)))

(declare-fun m!204245 () Bool)

(assert (=> bm!17726 m!204245))

(declare-fun m!204247 () Bool)

(assert (=> bm!17725 m!204247))

(declare-fun m!204249 () Bool)

(assert (=> bm!17728 m!204249))

(declare-fun m!204251 () Bool)

(assert (=> b!175192 m!204251))

(assert (=> b!175192 m!204251))

(declare-fun m!204253 () Bool)

(assert (=> b!175192 m!204253))

(declare-fun m!204255 () Bool)

(assert (=> b!175201 m!204255))

(declare-fun m!204257 () Bool)

(assert (=> b!175201 m!204257))

(declare-fun m!204259 () Bool)

(assert (=> b!175201 m!204259))

(declare-fun m!204261 () Bool)

(assert (=> b!175201 m!204261))

(assert (=> b!175201 m!204255))

(declare-fun m!204263 () Bool)

(assert (=> b!175201 m!204263))

(declare-fun m!204265 () Bool)

(assert (=> b!175201 m!204265))

(declare-fun m!204267 () Bool)

(assert (=> b!175201 m!204267))

(declare-fun m!204269 () Bool)

(assert (=> b!175201 m!204269))

(declare-fun m!204271 () Bool)

(assert (=> b!175201 m!204271))

(declare-fun m!204273 () Bool)

(assert (=> b!175201 m!204273))

(declare-fun m!204275 () Bool)

(assert (=> b!175201 m!204275))

(declare-fun m!204277 () Bool)

(assert (=> b!175201 m!204277))

(assert (=> b!175201 m!204267))

(declare-fun m!204279 () Bool)

(assert (=> b!175201 m!204279))

(assert (=> b!175201 m!204251))

(assert (=> b!175201 m!204257))

(declare-fun m!204281 () Bool)

(assert (=> b!175201 m!204281))

(declare-fun m!204283 () Bool)

(assert (=> b!175201 m!204283))

(declare-fun m!204285 () Bool)

(assert (=> b!175201 m!204285))

(assert (=> b!175201 m!204271))

(declare-fun m!204287 () Bool)

(assert (=> b!175190 m!204287))

(assert (=> b!175203 m!204251))

(assert (=> b!175203 m!204251))

(declare-fun m!204289 () Bool)

(assert (=> b!175203 m!204289))

(declare-fun m!204291 () Bool)

(assert (=> b!175199 m!204291))

(assert (=> b!175198 m!204251))

(assert (=> b!175198 m!204251))

(declare-fun m!204293 () Bool)

(assert (=> b!175198 m!204293))

(declare-fun m!204295 () Bool)

(assert (=> b!175198 m!204295))

(declare-fun m!204297 () Bool)

(assert (=> b!175198 m!204297))

(declare-fun m!204299 () Bool)

(assert (=> b!175198 m!204299))

(assert (=> b!175198 m!204297))

(assert (=> b!175198 m!204295))

(assert (=> d!53459 m!204201))

(declare-fun m!204301 () Bool)

(assert (=> b!175206 m!204301))

(assert (=> b!175204 m!204251))

(assert (=> b!175204 m!204251))

(assert (=> b!175204 m!204289))

(assert (=> bm!17731 m!204265))

(assert (=> b!175076 d!53459))

(declare-fun d!53461 () Bool)

(declare-fun res!83082 () Bool)

(declare-fun e!115664 () Bool)

(assert (=> d!53461 (=> (not res!83082) (not e!115664))))

(declare-fun simpleValid!147 (LongMapFixedSize!2320) Bool)

(assert (=> d!53461 (= res!83082 (simpleValid!147 thiss!1248))))

(assert (=> d!53461 (= (valid!994 thiss!1248) e!115664)))

(declare-fun b!175215 () Bool)

(declare-fun res!83083 () Bool)

(assert (=> b!175215 (=> (not res!83083) (not e!115664))))

(declare-fun arrayCountValidKeys!0 (array!7321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175215 (= res!83083 (= (arrayCountValidKeys!0 (_keys!5461 thiss!1248) #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))) (_size!1209 thiss!1248)))))

(declare-fun b!175216 () Bool)

(declare-fun res!83084 () Bool)

(assert (=> b!175216 (=> (not res!83084) (not e!115664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7321 (_ BitVec 32)) Bool)

(assert (=> b!175216 (= res!83084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(declare-fun b!175217 () Bool)

(declare-datatypes ((List!2199 0))(
  ( (Nil!2196) (Cons!2195 (h!2813 (_ BitVec 64)) (t!7009 List!2199)) )
))
(declare-fun arrayNoDuplicates!0 (array!7321 (_ BitVec 32) List!2199) Bool)

(assert (=> b!175217 (= e!115664 (arrayNoDuplicates!0 (_keys!5461 thiss!1248) #b00000000000000000000000000000000 Nil!2196))))

(assert (= (and d!53461 res!83082) b!175215))

(assert (= (and b!175215 res!83083) b!175216))

(assert (= (and b!175216 res!83084) b!175217))

(declare-fun m!204303 () Bool)

(assert (=> d!53461 m!204303))

(declare-fun m!204305 () Bool)

(assert (=> b!175215 m!204305))

(declare-fun m!204307 () Bool)

(assert (=> b!175216 m!204307))

(declare-fun m!204309 () Bool)

(assert (=> b!175217 m!204309))

(assert (=> start!17460 d!53461))

(declare-fun b!175230 () Bool)

(declare-fun c!31385 () Bool)

(declare-fun lt!86746 () (_ BitVec 64))

(assert (=> b!175230 (= c!31385 (= lt!86746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115673 () SeekEntryResult!540)

(declare-fun e!115671 () SeekEntryResult!540)

(assert (=> b!175230 (= e!115673 e!115671)))

(declare-fun b!175231 () Bool)

(declare-fun lt!86747 () SeekEntryResult!540)

(assert (=> b!175231 (= e!115671 (MissingZero!540 (index!4330 lt!86747)))))

(declare-fun b!175232 () Bool)

(declare-fun e!115672 () SeekEntryResult!540)

(assert (=> b!175232 (= e!115672 Undefined!540)))

(declare-fun b!175233 () Bool)

(assert (=> b!175233 (= e!115673 (Found!540 (index!4330 lt!86747)))))

(declare-fun d!53463 () Bool)

(declare-fun lt!86745 () SeekEntryResult!540)

(assert (=> d!53463 (and (or ((_ is Undefined!540) lt!86745) (not ((_ is Found!540) lt!86745)) (and (bvsge (index!4329 lt!86745) #b00000000000000000000000000000000) (bvslt (index!4329 lt!86745) (size!3777 (_keys!5461 thiss!1248))))) (or ((_ is Undefined!540) lt!86745) ((_ is Found!540) lt!86745) (not ((_ is MissingZero!540) lt!86745)) (and (bvsge (index!4328 lt!86745) #b00000000000000000000000000000000) (bvslt (index!4328 lt!86745) (size!3777 (_keys!5461 thiss!1248))))) (or ((_ is Undefined!540) lt!86745) ((_ is Found!540) lt!86745) ((_ is MissingZero!540) lt!86745) (not ((_ is MissingVacant!540) lt!86745)) (and (bvsge (index!4331 lt!86745) #b00000000000000000000000000000000) (bvslt (index!4331 lt!86745) (size!3777 (_keys!5461 thiss!1248))))) (or ((_ is Undefined!540) lt!86745) (ite ((_ is Found!540) lt!86745) (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4329 lt!86745)) key!828) (ite ((_ is MissingZero!540) lt!86745) (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4328 lt!86745)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!540) lt!86745) (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4331 lt!86745)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53463 (= lt!86745 e!115672)))

(declare-fun c!31383 () Bool)

(assert (=> d!53463 (= c!31383 (and ((_ is Intermediate!540) lt!86747) (undefined!1352 lt!86747)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7321 (_ BitVec 32)) SeekEntryResult!540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53463 (= lt!86747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8502 thiss!1248)) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(assert (=> d!53463 (validMask!0 (mask!8502 thiss!1248))))

(assert (=> d!53463 (= (seekEntryOrOpen!0 key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)) lt!86745)))

(declare-fun b!175234 () Bool)

(assert (=> b!175234 (= e!115672 e!115673)))

(assert (=> b!175234 (= lt!86746 (select (arr!3476 (_keys!5461 thiss!1248)) (index!4330 lt!86747)))))

(declare-fun c!31384 () Bool)

(assert (=> b!175234 (= c!31384 (= lt!86746 key!828))))

(declare-fun b!175235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7321 (_ BitVec 32)) SeekEntryResult!540)

(assert (=> b!175235 (= e!115671 (seekKeyOrZeroReturnVacant!0 (x!19254 lt!86747) (index!4330 lt!86747) (index!4330 lt!86747) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(assert (= (and d!53463 c!31383) b!175232))

(assert (= (and d!53463 (not c!31383)) b!175234))

(assert (= (and b!175234 c!31384) b!175233))

(assert (= (and b!175234 (not c!31384)) b!175230))

(assert (= (and b!175230 c!31385) b!175231))

(assert (= (and b!175230 (not c!31385)) b!175235))

(declare-fun m!204311 () Bool)

(assert (=> d!53463 m!204311))

(declare-fun m!204313 () Bool)

(assert (=> d!53463 m!204313))

(declare-fun m!204315 () Bool)

(assert (=> d!53463 m!204315))

(assert (=> d!53463 m!204201))

(declare-fun m!204317 () Bool)

(assert (=> d!53463 m!204317))

(assert (=> d!53463 m!204313))

(declare-fun m!204319 () Bool)

(assert (=> d!53463 m!204319))

(declare-fun m!204321 () Bool)

(assert (=> b!175234 m!204321))

(declare-fun m!204323 () Bool)

(assert (=> b!175235 m!204323))

(assert (=> b!175074 d!53463))

(declare-fun d!53465 () Bool)

(assert (=> d!53465 (= (array_inv!2241 (_keys!5461 thiss!1248)) (bvsge (size!3777 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175072 d!53465))

(declare-fun d!53467 () Bool)

(assert (=> d!53467 (= (array_inv!2242 (_values!3596 thiss!1248)) (bvsge (size!3778 (_values!3596 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175072 d!53467))

(declare-fun d!53469 () Bool)

(assert (=> d!53469 (= (validMask!0 (mask!8502 thiss!1248)) (and (or (= (mask!8502 thiss!1248) #b00000000000000000000000000000111) (= (mask!8502 thiss!1248) #b00000000000000000000000000001111) (= (mask!8502 thiss!1248) #b00000000000000000000000000011111) (= (mask!8502 thiss!1248) #b00000000000000000000000000111111) (= (mask!8502 thiss!1248) #b00000000000000000000000001111111) (= (mask!8502 thiss!1248) #b00000000000000000000000011111111) (= (mask!8502 thiss!1248) #b00000000000000000000000111111111) (= (mask!8502 thiss!1248) #b00000000000000000000001111111111) (= (mask!8502 thiss!1248) #b00000000000000000000011111111111) (= (mask!8502 thiss!1248) #b00000000000000000000111111111111) (= (mask!8502 thiss!1248) #b00000000000000000001111111111111) (= (mask!8502 thiss!1248) #b00000000000000000011111111111111) (= (mask!8502 thiss!1248) #b00000000000000000111111111111111) (= (mask!8502 thiss!1248) #b00000000000000001111111111111111) (= (mask!8502 thiss!1248) #b00000000000000011111111111111111) (= (mask!8502 thiss!1248) #b00000000000000111111111111111111) (= (mask!8502 thiss!1248) #b00000000000001111111111111111111) (= (mask!8502 thiss!1248) #b00000000000011111111111111111111) (= (mask!8502 thiss!1248) #b00000000000111111111111111111111) (= (mask!8502 thiss!1248) #b00000000001111111111111111111111) (= (mask!8502 thiss!1248) #b00000000011111111111111111111111) (= (mask!8502 thiss!1248) #b00000000111111111111111111111111) (= (mask!8502 thiss!1248) #b00000001111111111111111111111111) (= (mask!8502 thiss!1248) #b00000011111111111111111111111111) (= (mask!8502 thiss!1248) #b00000111111111111111111111111111) (= (mask!8502 thiss!1248) #b00001111111111111111111111111111) (= (mask!8502 thiss!1248) #b00011111111111111111111111111111) (= (mask!8502 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8502 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175077 d!53469))

(declare-fun condMapEmpty!6996 () Bool)

(declare-fun mapDefault!6996 () ValueCell!1706)

(assert (=> mapNonEmpty!6987 (= condMapEmpty!6996 (= mapRest!6987 ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6996)))))

(declare-fun e!115679 () Bool)

(declare-fun mapRes!6996 () Bool)

(assert (=> mapNonEmpty!6987 (= tp!15656 (and e!115679 mapRes!6996))))

(declare-fun b!175242 () Bool)

(declare-fun e!115678 () Bool)

(assert (=> b!175242 (= e!115678 tp_is_empty!4099)))

(declare-fun mapIsEmpty!6996 () Bool)

(assert (=> mapIsEmpty!6996 mapRes!6996))

(declare-fun mapNonEmpty!6996 () Bool)

(declare-fun tp!15672 () Bool)

(assert (=> mapNonEmpty!6996 (= mapRes!6996 (and tp!15672 e!115678))))

(declare-fun mapRest!6996 () (Array (_ BitVec 32) ValueCell!1706))

(declare-fun mapValue!6996 () ValueCell!1706)

(declare-fun mapKey!6996 () (_ BitVec 32))

(assert (=> mapNonEmpty!6996 (= mapRest!6987 (store mapRest!6996 mapKey!6996 mapValue!6996))))

(declare-fun b!175243 () Bool)

(assert (=> b!175243 (= e!115679 tp_is_empty!4099)))

(assert (= (and mapNonEmpty!6987 condMapEmpty!6996) mapIsEmpty!6996))

(assert (= (and mapNonEmpty!6987 (not condMapEmpty!6996)) mapNonEmpty!6996))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1706) mapValue!6996)) b!175242))

(assert (= (and mapNonEmpty!6987 ((_ is ValueCellFull!1706) mapDefault!6996)) b!175243))

(declare-fun m!204325 () Bool)

(assert (=> mapNonEmpty!6996 m!204325))

(declare-fun b_lambda!7023 () Bool)

(assert (= b_lambda!7021 (or (and b!175072 b_free!4327) b_lambda!7023)))

(check-sat (not b!175201) (not b_lambda!7023) (not b!175143) (not b!175141) (not b!175217) (not bm!17726) (not b!175199) b_and!10821 (not b!175190) (not b!175198) (not mapNonEmpty!6996) (not b!175215) (not b!175204) (not bm!17725) (not bm!17728) (not bm!17731) (not d!53463) tp_is_empty!4099 (not b!175206) (not d!53461) (not d!53459) (not d!53457) (not b!175192) (not b!175216) (not b!175235) (not b_next!4327) (not b!175203))
(check-sat b_and!10821 (not b_next!4327))
(get-model)

(declare-fun d!53471 () Bool)

(declare-fun e!115682 () Bool)

(assert (=> d!53471 e!115682))

(declare-fun res!83089 () Bool)

(assert (=> d!53471 (=> (not res!83089) (not e!115682))))

(declare-fun lt!86759 () ListLongMap!2147)

(assert (=> d!53471 (= res!83089 (contains!1158 lt!86759 (_1!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86757 () List!2197)

(assert (=> d!53471 (= lt!86759 (ListLongMap!2148 lt!86757))))

(declare-fun lt!86758 () Unit!5377)

(declare-fun lt!86756 () Unit!5377)

(assert (=> d!53471 (= lt!86758 lt!86756)))

(assert (=> d!53471 (= (getValueByKey!189 lt!86757 (_1!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!101 (List!2197 (_ BitVec 64) V!5113) Unit!5377)

(assert (=> d!53471 (= lt!86756 (lemmaContainsTupThenGetReturnValue!101 lt!86757 (_1!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun insertStrictlySorted!104 (List!2197 (_ BitVec 64) V!5113) List!2197)

(assert (=> d!53471 (= lt!86757 (insertStrictlySorted!104 (toList!1089 call!17730) (_1!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(assert (=> d!53471 (= (+!250 call!17730 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) lt!86759)))

(declare-fun b!175248 () Bool)

(declare-fun res!83090 () Bool)

(assert (=> b!175248 (=> (not res!83090) (not e!115682))))

(assert (=> b!175248 (= res!83090 (= (getValueByKey!189 (toList!1089 lt!86759) (_1!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(declare-fun b!175249 () Bool)

(declare-fun contains!1160 (List!2197 tuple2!3214) Bool)

(assert (=> b!175249 (= e!115682 (contains!1160 (toList!1089 lt!86759) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))

(assert (= (and d!53471 res!83089) b!175248))

(assert (= (and b!175248 res!83090) b!175249))

(declare-fun m!204327 () Bool)

(assert (=> d!53471 m!204327))

(declare-fun m!204329 () Bool)

(assert (=> d!53471 m!204329))

(declare-fun m!204331 () Bool)

(assert (=> d!53471 m!204331))

(declare-fun m!204333 () Bool)

(assert (=> d!53471 m!204333))

(declare-fun m!204335 () Bool)

(assert (=> b!175248 m!204335))

(declare-fun m!204337 () Bool)

(assert (=> b!175249 m!204337))

(assert (=> b!175190 d!53471))

(declare-fun d!53473 () Bool)

(assert (=> d!53473 (isDefined!141 (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun lt!86762 () Unit!5377)

(declare-fun choose!944 (List!2197 (_ BitVec 64)) Unit!5377)

(assert (=> d!53473 (= lt!86762 (choose!944 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun e!115685 () Bool)

(assert (=> d!53473 e!115685))

(declare-fun res!83093 () Bool)

(assert (=> d!53473 (=> (not res!83093) (not e!115685))))

(declare-fun isStrictlySorted!321 (List!2197) Bool)

(assert (=> d!53473 (= res!83093 (isStrictlySorted!321 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))))

(assert (=> d!53473 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) lt!86762)))

(declare-fun b!175252 () Bool)

(assert (=> b!175252 (= e!115685 (containsKey!192 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(assert (= (and d!53473 res!83093) b!175252))

(assert (=> d!53473 m!204241))

(assert (=> d!53473 m!204241))

(assert (=> d!53473 m!204243))

(declare-fun m!204339 () Bool)

(assert (=> d!53473 m!204339))

(declare-fun m!204341 () Bool)

(assert (=> d!53473 m!204341))

(assert (=> b!175252 m!204237))

(assert (=> b!175141 d!53473))

(declare-fun d!53475 () Bool)

(declare-fun isEmpty!447 (Option!195) Bool)

(assert (=> d!53475 (= (isDefined!141 (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828)) (not (isEmpty!447 (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))))

(declare-fun bs!7249 () Bool)

(assert (= bs!7249 d!53475))

(assert (=> bs!7249 m!204241))

(declare-fun m!204343 () Bool)

(assert (=> bs!7249 m!204343))

(assert (=> b!175141 d!53475))

(declare-fun d!53477 () Bool)

(declare-fun c!31390 () Bool)

(assert (=> d!53477 (= c!31390 (and ((_ is Cons!2193) (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (= (_1!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(declare-fun e!115690 () Option!195)

(assert (=> d!53477 (= (getValueByKey!189 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) e!115690)))

(declare-fun b!175262 () Bool)

(declare-fun e!115691 () Option!195)

(assert (=> b!175262 (= e!115690 e!115691)))

(declare-fun c!31391 () Bool)

(assert (=> b!175262 (= c!31391 (and ((_ is Cons!2193) (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (not (= (_1!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828))))))

(declare-fun b!175261 () Bool)

(assert (=> b!175261 (= e!115690 (Some!194 (_2!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))))))

(declare-fun b!175264 () Bool)

(assert (=> b!175264 (= e!115691 None!193)))

(declare-fun b!175263 () Bool)

(assert (=> b!175263 (= e!115691 (getValueByKey!189 (t!7005 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) key!828))))

(assert (= (and d!53477 c!31390) b!175261))

(assert (= (and d!53477 (not c!31390)) b!175262))

(assert (= (and b!175262 c!31391) b!175263))

(assert (= (and b!175262 (not c!31391)) b!175264))

(declare-fun m!204345 () Bool)

(assert (=> b!175263 m!204345))

(assert (=> b!175141 d!53477))

(declare-fun d!53479 () Bool)

(declare-fun get!1990 (Option!195) V!5113)

(assert (=> d!53479 (= (apply!133 lt!86736 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1990 (getValueByKey!189 (toList!1089 lt!86736) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7250 () Bool)

(assert (= bs!7250 d!53479))

(declare-fun m!204347 () Bool)

(assert (=> bs!7250 m!204347))

(assert (=> bs!7250 m!204347))

(declare-fun m!204349 () Bool)

(assert (=> bs!7250 m!204349))

(assert (=> b!175199 d!53479))

(declare-fun d!53481 () Bool)

(assert (=> d!53481 (= (apply!133 lt!86736 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)) (get!1990 (getValueByKey!189 (toList!1089 lt!86736) (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7251 () Bool)

(assert (= bs!7251 d!53481))

(assert (=> bs!7251 m!204251))

(declare-fun m!204351 () Bool)

(assert (=> bs!7251 m!204351))

(assert (=> bs!7251 m!204351))

(declare-fun m!204353 () Bool)

(assert (=> bs!7251 m!204353))

(assert (=> b!175198 d!53481))

(declare-fun d!53483 () Bool)

(declare-fun c!31394 () Bool)

(assert (=> d!53483 (= c!31394 ((_ is ValueCellFull!1706) (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115694 () V!5113)

(assert (=> d!53483 (= (get!1989 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115694)))

(declare-fun b!175269 () Bool)

(declare-fun get!1991 (ValueCell!1706 V!5113) V!5113)

(assert (=> b!175269 (= e!115694 (get!1991 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175270 () Bool)

(declare-fun get!1992 (ValueCell!1706 V!5113) V!5113)

(assert (=> b!175270 (= e!115694 (get!1992 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53483 c!31394) b!175269))

(assert (= (and d!53483 (not c!31394)) b!175270))

(assert (=> b!175269 m!204295))

(assert (=> b!175269 m!204297))

(declare-fun m!204355 () Bool)

(assert (=> b!175269 m!204355))

(assert (=> b!175270 m!204295))

(assert (=> b!175270 m!204297))

(declare-fun m!204357 () Bool)

(assert (=> b!175270 m!204357))

(assert (=> b!175198 d!53483))

(declare-fun d!53485 () Bool)

(assert (=> d!53485 (= (apply!133 lt!86736 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1990 (getValueByKey!189 (toList!1089 lt!86736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7252 () Bool)

(assert (= bs!7252 d!53485))

(declare-fun m!204359 () Bool)

(assert (=> bs!7252 m!204359))

(assert (=> bs!7252 m!204359))

(declare-fun m!204361 () Bool)

(assert (=> bs!7252 m!204361))

(assert (=> b!175206 d!53485))

(declare-fun b!175295 () Bool)

(declare-fun e!115715 () Bool)

(declare-fun lt!86781 () ListLongMap!2147)

(assert (=> b!175295 (= e!115715 (= lt!86781 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3613 thiss!1248))))))

(declare-fun b!175296 () Bool)

(declare-fun e!115713 () Bool)

(declare-fun e!115714 () Bool)

(assert (=> b!175296 (= e!115713 e!115714)))

(declare-fun c!31406 () Bool)

(declare-fun e!115710 () Bool)

(assert (=> b!175296 (= c!31406 e!115710)))

(declare-fun res!83104 () Bool)

(assert (=> b!175296 (=> (not res!83104) (not e!115710))))

(assert (=> b!175296 (= res!83104 (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175298 () Bool)

(assert (=> b!175298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> b!175298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3778 (_values!3596 thiss!1248))))))

(declare-fun e!115711 () Bool)

(assert (=> b!175298 (= e!115711 (= (apply!133 lt!86781 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)) (get!1989 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17734 () Bool)

(declare-fun call!17737 () ListLongMap!2147)

(assert (=> bm!17734 (= call!17737 (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3613 thiss!1248)))))

(declare-fun b!175299 () Bool)

(assert (=> b!175299 (= e!115714 e!115715)))

(declare-fun c!31403 () Bool)

(assert (=> b!175299 (= c!31403 (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175300 () Bool)

(assert (=> b!175300 (= e!115714 e!115711)))

(assert (=> b!175300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun res!83102 () Bool)

(assert (=> b!175300 (= res!83102 (contains!1158 lt!86781 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175300 (=> (not res!83102) (not e!115711))))

(declare-fun b!175301 () Bool)

(declare-fun lt!86778 () Unit!5377)

(declare-fun lt!86777 () Unit!5377)

(assert (=> b!175301 (= lt!86778 lt!86777)))

(declare-fun lt!86779 () (_ BitVec 64))

(declare-fun lt!86780 () V!5113)

(declare-fun lt!86782 () (_ BitVec 64))

(declare-fun lt!86783 () ListLongMap!2147)

(assert (=> b!175301 (not (contains!1158 (+!250 lt!86783 (tuple2!3215 lt!86782 lt!86780)) lt!86779))))

(declare-fun addStillNotContains!76 (ListLongMap!2147 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5377)

(assert (=> b!175301 (= lt!86777 (addStillNotContains!76 lt!86783 lt!86782 lt!86780 lt!86779))))

(assert (=> b!175301 (= lt!86779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175301 (= lt!86780 (get!1989 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175301 (= lt!86782 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175301 (= lt!86783 call!17737)))

(declare-fun e!115712 () ListLongMap!2147)

(assert (=> b!175301 (= e!115712 (+!250 call!17737 (tuple2!3215 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000) (get!1989 (select (arr!3477 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!476 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175302 () Bool)

(assert (=> b!175302 (= e!115710 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175302 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175303 () Bool)

(assert (=> b!175303 (= e!115712 call!17737)))

(declare-fun b!175304 () Bool)

(declare-fun isEmpty!448 (ListLongMap!2147) Bool)

(assert (=> b!175304 (= e!115715 (isEmpty!448 lt!86781))))

(declare-fun b!175297 () Bool)

(declare-fun res!83105 () Bool)

(assert (=> b!175297 (=> (not res!83105) (not e!115713))))

(assert (=> b!175297 (= res!83105 (not (contains!1158 lt!86781 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53487 () Bool)

(assert (=> d!53487 e!115713))

(declare-fun res!83103 () Bool)

(assert (=> d!53487 (=> (not res!83103) (not e!115713))))

(assert (=> d!53487 (= res!83103 (not (contains!1158 lt!86781 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!115709 () ListLongMap!2147)

(assert (=> d!53487 (= lt!86781 e!115709)))

(declare-fun c!31405 () Bool)

(assert (=> d!53487 (= c!31405 (bvsge #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53487 (validMask!0 (mask!8502 thiss!1248))))

(assert (=> d!53487 (= (getCurrentListMapNoExtraKeys!164 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) lt!86781)))

(declare-fun b!175305 () Bool)

(assert (=> b!175305 (= e!115709 (ListLongMap!2148 Nil!2194))))

(declare-fun b!175306 () Bool)

(assert (=> b!175306 (= e!115709 e!115712)))

(declare-fun c!31404 () Bool)

(assert (=> b!175306 (= c!31404 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53487 c!31405) b!175305))

(assert (= (and d!53487 (not c!31405)) b!175306))

(assert (= (and b!175306 c!31404) b!175301))

(assert (= (and b!175306 (not c!31404)) b!175303))

(assert (= (or b!175301 b!175303) bm!17734))

(assert (= (and d!53487 res!83103) b!175297))

(assert (= (and b!175297 res!83105) b!175296))

(assert (= (and b!175296 res!83104) b!175302))

(assert (= (and b!175296 c!31406) b!175300))

(assert (= (and b!175296 (not c!31406)) b!175299))

(assert (= (and b!175300 res!83102) b!175298))

(assert (= (and b!175299 c!31403) b!175295))

(assert (= (and b!175299 (not c!31403)) b!175304))

(declare-fun b_lambda!7025 () Bool)

(assert (=> (not b_lambda!7025) (not b!175298)))

(assert (=> b!175298 t!7008))

(declare-fun b_and!10823 () Bool)

(assert (= b_and!10821 (and (=> t!7008 result!4597) b_and!10823)))

(declare-fun b_lambda!7027 () Bool)

(assert (=> (not b_lambda!7027) (not b!175301)))

(assert (=> b!175301 t!7008))

(declare-fun b_and!10825 () Bool)

(assert (= b_and!10823 (and (=> t!7008 result!4597) b_and!10825)))

(assert (=> b!175300 m!204251))

(assert (=> b!175300 m!204251))

(declare-fun m!204363 () Bool)

(assert (=> b!175300 m!204363))

(declare-fun m!204365 () Bool)

(assert (=> b!175304 m!204365))

(declare-fun m!204367 () Bool)

(assert (=> d!53487 m!204367))

(assert (=> d!53487 m!204201))

(declare-fun m!204369 () Bool)

(assert (=> bm!17734 m!204369))

(declare-fun m!204371 () Bool)

(assert (=> b!175297 m!204371))

(assert (=> b!175302 m!204251))

(assert (=> b!175302 m!204251))

(assert (=> b!175302 m!204289))

(assert (=> b!175295 m!204369))

(declare-fun m!204373 () Bool)

(assert (=> b!175301 m!204373))

(declare-fun m!204375 () Bool)

(assert (=> b!175301 m!204375))

(assert (=> b!175301 m!204373))

(assert (=> b!175301 m!204295))

(assert (=> b!175301 m!204297))

(assert (=> b!175301 m!204299))

(assert (=> b!175301 m!204295))

(declare-fun m!204377 () Bool)

(assert (=> b!175301 m!204377))

(declare-fun m!204379 () Bool)

(assert (=> b!175301 m!204379))

(assert (=> b!175301 m!204297))

(assert (=> b!175301 m!204251))

(assert (=> b!175306 m!204251))

(assert (=> b!175306 m!204251))

(assert (=> b!175306 m!204289))

(assert (=> b!175298 m!204251))

(declare-fun m!204381 () Bool)

(assert (=> b!175298 m!204381))

(assert (=> b!175298 m!204295))

(assert (=> b!175298 m!204297))

(assert (=> b!175298 m!204299))

(assert (=> b!175298 m!204295))

(assert (=> b!175298 m!204297))

(assert (=> b!175298 m!204251))

(assert (=> bm!17731 d!53487))

(declare-fun d!53489 () Bool)

(declare-fun e!115716 () Bool)

(assert (=> d!53489 e!115716))

(declare-fun res!83106 () Bool)

(assert (=> d!53489 (=> res!83106 e!115716)))

(declare-fun lt!86784 () Bool)

(assert (=> d!53489 (= res!83106 (not lt!86784))))

(declare-fun lt!86787 () Bool)

(assert (=> d!53489 (= lt!86784 lt!86787)))

(declare-fun lt!86786 () Unit!5377)

(declare-fun e!115717 () Unit!5377)

(assert (=> d!53489 (= lt!86786 e!115717)))

(declare-fun c!31407 () Bool)

(assert (=> d!53489 (= c!31407 lt!86787)))

(assert (=> d!53489 (= lt!86787 (containsKey!192 (toList!1089 lt!86736) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53489 (= (contains!1158 lt!86736 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86784)))

(declare-fun b!175307 () Bool)

(declare-fun lt!86785 () Unit!5377)

(assert (=> b!175307 (= e!115717 lt!86785)))

(assert (=> b!175307 (= lt!86785 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 lt!86736) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175307 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175308 () Bool)

(declare-fun Unit!5381 () Unit!5377)

(assert (=> b!175308 (= e!115717 Unit!5381)))

(declare-fun b!175309 () Bool)

(assert (=> b!175309 (= e!115716 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53489 c!31407) b!175307))

(assert (= (and d!53489 (not c!31407)) b!175308))

(assert (= (and d!53489 (not res!83106)) b!175309))

(declare-fun m!204383 () Bool)

(assert (=> d!53489 m!204383))

(declare-fun m!204385 () Bool)

(assert (=> b!175307 m!204385))

(assert (=> b!175307 m!204359))

(assert (=> b!175307 m!204359))

(declare-fun m!204387 () Bool)

(assert (=> b!175307 m!204387))

(assert (=> b!175309 m!204359))

(assert (=> b!175309 m!204359))

(assert (=> b!175309 m!204387))

(assert (=> bm!17726 d!53489))

(declare-fun d!53491 () Bool)

(declare-fun e!115718 () Bool)

(assert (=> d!53491 e!115718))

(declare-fun res!83107 () Bool)

(assert (=> d!53491 (=> res!83107 e!115718)))

(declare-fun lt!86788 () Bool)

(assert (=> d!53491 (= res!83107 (not lt!86788))))

(declare-fun lt!86791 () Bool)

(assert (=> d!53491 (= lt!86788 lt!86791)))

(declare-fun lt!86790 () Unit!5377)

(declare-fun e!115719 () Unit!5377)

(assert (=> d!53491 (= lt!86790 e!115719)))

(declare-fun c!31408 () Bool)

(assert (=> d!53491 (= c!31408 lt!86791)))

(assert (=> d!53491 (= lt!86791 (containsKey!192 (toList!1089 lt!86736) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53491 (= (contains!1158 lt!86736 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86788)))

(declare-fun b!175310 () Bool)

(declare-fun lt!86789 () Unit!5377)

(assert (=> b!175310 (= e!115719 lt!86789)))

(assert (=> b!175310 (= lt!86789 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 lt!86736) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175310 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175311 () Bool)

(declare-fun Unit!5382 () Unit!5377)

(assert (=> b!175311 (= e!115719 Unit!5382)))

(declare-fun b!175312 () Bool)

(assert (=> b!175312 (= e!115718 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53491 c!31408) b!175310))

(assert (= (and d!53491 (not c!31408)) b!175311))

(assert (= (and d!53491 (not res!83107)) b!175312))

(declare-fun m!204389 () Bool)

(assert (=> d!53491 m!204389))

(declare-fun m!204391 () Bool)

(assert (=> b!175310 m!204391))

(assert (=> b!175310 m!204347))

(assert (=> b!175310 m!204347))

(declare-fun m!204393 () Bool)

(assert (=> b!175310 m!204393))

(assert (=> b!175312 m!204347))

(assert (=> b!175312 m!204347))

(assert (=> b!175312 m!204393))

(assert (=> bm!17725 d!53491))

(declare-fun d!53493 () Bool)

(declare-fun res!83112 () Bool)

(declare-fun e!115724 () Bool)

(assert (=> d!53493 (=> res!83112 e!115724)))

(assert (=> d!53493 (= res!83112 (and ((_ is Cons!2193) (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (= (_1!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(assert (=> d!53493 (= (containsKey!192 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) e!115724)))

(declare-fun b!175317 () Bool)

(declare-fun e!115725 () Bool)

(assert (=> b!175317 (= e!115724 e!115725)))

(declare-fun res!83113 () Bool)

(assert (=> b!175317 (=> (not res!83113) (not e!115725))))

(assert (=> b!175317 (= res!83113 (and (or (not ((_ is Cons!2193) (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) (bvsle (_1!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)) ((_ is Cons!2193) (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (bvslt (_1!1618 (h!2811 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(declare-fun b!175318 () Bool)

(assert (=> b!175318 (= e!115725 (containsKey!192 (t!7005 (toList!1089 (getCurrentListMap!744 (_keys!5461 thiss!1248) (_values!3596 thiss!1248) (mask!8502 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) key!828))))

(assert (= (and d!53493 (not res!83112)) b!175317))

(assert (= (and b!175317 res!83113) b!175318))

(declare-fun m!204395 () Bool)

(assert (=> b!175318 m!204395))

(assert (=> d!53457 d!53493))

(declare-fun d!53495 () Bool)

(assert (=> d!53495 (= (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175204 d!53495))

(assert (=> b!175203 d!53495))

(declare-fun d!53497 () Bool)

(declare-fun e!115726 () Bool)

(assert (=> d!53497 e!115726))

(declare-fun res!83114 () Bool)

(assert (=> d!53497 (=> (not res!83114) (not e!115726))))

(declare-fun lt!86795 () ListLongMap!2147)

(assert (=> d!53497 (= res!83114 (contains!1158 lt!86795 (_1!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(declare-fun lt!86793 () List!2197)

(assert (=> d!53497 (= lt!86795 (ListLongMap!2148 lt!86793))))

(declare-fun lt!86794 () Unit!5377)

(declare-fun lt!86792 () Unit!5377)

(assert (=> d!53497 (= lt!86794 lt!86792)))

(assert (=> d!53497 (= (getValueByKey!189 lt!86793 (_1!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))) (Some!194 (_2!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53497 (= lt!86792 (lemmaContainsTupThenGetReturnValue!101 lt!86793 (_1!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (_2!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53497 (= lt!86793 (insertStrictlySorted!104 (toList!1089 (ite c!31376 call!17729 (ite c!31371 call!17732 call!17734))) (_1!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (_2!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53497 (= (+!250 (ite c!31376 call!17729 (ite c!31371 call!17732 call!17734)) (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) lt!86795)))

(declare-fun b!175319 () Bool)

(declare-fun res!83115 () Bool)

(assert (=> b!175319 (=> (not res!83115) (not e!115726))))

(assert (=> b!175319 (= res!83115 (= (getValueByKey!189 (toList!1089 lt!86795) (_1!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))) (Some!194 (_2!1618 (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))))

(declare-fun b!175320 () Bool)

(assert (=> b!175320 (= e!115726 (contains!1160 (toList!1089 lt!86795) (ite (or c!31376 c!31371) (tuple2!3215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(assert (= (and d!53497 res!83114) b!175319))

(assert (= (and b!175319 res!83115) b!175320))

(declare-fun m!204397 () Bool)

(assert (=> d!53497 m!204397))

(declare-fun m!204399 () Bool)

(assert (=> d!53497 m!204399))

(declare-fun m!204401 () Bool)

(assert (=> d!53497 m!204401))

(declare-fun m!204403 () Bool)

(assert (=> d!53497 m!204403))

(declare-fun m!204405 () Bool)

(assert (=> b!175319 m!204405))

(declare-fun m!204407 () Bool)

(assert (=> b!175320 m!204407))

(assert (=> bm!17728 d!53497))

(declare-fun d!53499 () Bool)

(declare-fun e!115727 () Bool)

(assert (=> d!53499 e!115727))

(declare-fun res!83116 () Bool)

(assert (=> d!53499 (=> (not res!83116) (not e!115727))))

(declare-fun lt!86799 () ListLongMap!2147)

(assert (=> d!53499 (= res!83116 (contains!1158 lt!86799 (_1!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))))))

(declare-fun lt!86797 () List!2197)

(assert (=> d!53499 (= lt!86799 (ListLongMap!2148 lt!86797))))

(declare-fun lt!86798 () Unit!5377)

(declare-fun lt!86796 () Unit!5377)

(assert (=> d!53499 (= lt!86798 lt!86796)))

(assert (=> d!53499 (= (getValueByKey!189 lt!86797 (_1!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53499 (= lt!86796 (lemmaContainsTupThenGetReturnValue!101 lt!86797 (_1!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53499 (= lt!86797 (insertStrictlySorted!104 (toList!1089 lt!86735) (_1!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53499 (= (+!250 lt!86735 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) lt!86799)))

(declare-fun b!175321 () Bool)

(declare-fun res!83117 () Bool)

(assert (=> b!175321 (=> (not res!83117) (not e!115727))))

(assert (=> b!175321 (= res!83117 (= (getValueByKey!189 (toList!1089 lt!86799) (_1!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))))))))

(declare-fun b!175322 () Bool)

(assert (=> b!175322 (= e!115727 (contains!1160 (toList!1089 lt!86799) (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))))))

(assert (= (and d!53499 res!83116) b!175321))

(assert (= (and b!175321 res!83117) b!175322))

(declare-fun m!204409 () Bool)

(assert (=> d!53499 m!204409))

(declare-fun m!204411 () Bool)

(assert (=> d!53499 m!204411))

(declare-fun m!204413 () Bool)

(assert (=> d!53499 m!204413))

(declare-fun m!204415 () Bool)

(assert (=> d!53499 m!204415))

(declare-fun m!204417 () Bool)

(assert (=> b!175321 m!204417))

(declare-fun m!204419 () Bool)

(assert (=> b!175322 m!204419))

(assert (=> b!175201 d!53499))

(assert (=> b!175201 d!53487))

(declare-fun d!53501 () Bool)

(assert (=> d!53501 (= (apply!133 (+!250 lt!86719 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) lt!86733) (get!1990 (getValueByKey!189 (toList!1089 (+!250 lt!86719 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))) lt!86733)))))

(declare-fun bs!7253 () Bool)

(assert (= bs!7253 d!53501))

(declare-fun m!204421 () Bool)

(assert (=> bs!7253 m!204421))

(assert (=> bs!7253 m!204421))

(declare-fun m!204423 () Bool)

(assert (=> bs!7253 m!204423))

(assert (=> b!175201 d!53501))

(declare-fun d!53503 () Bool)

(assert (=> d!53503 (= (apply!133 lt!86724 lt!86732) (get!1990 (getValueByKey!189 (toList!1089 lt!86724) lt!86732)))))

(declare-fun bs!7254 () Bool)

(assert (= bs!7254 d!53503))

(declare-fun m!204425 () Bool)

(assert (=> bs!7254 m!204425))

(assert (=> bs!7254 m!204425))

(declare-fun m!204427 () Bool)

(assert (=> bs!7254 m!204427))

(assert (=> b!175201 d!53503))

(declare-fun d!53505 () Bool)

(assert (=> d!53505 (= (apply!133 (+!250 lt!86724 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) lt!86732) (apply!133 lt!86724 lt!86732))))

(declare-fun lt!86802 () Unit!5377)

(declare-fun choose!945 (ListLongMap!2147 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5377)

(assert (=> d!53505 (= lt!86802 (choose!945 lt!86724 lt!86730 (minValue!3454 thiss!1248) lt!86732))))

(declare-fun e!115730 () Bool)

(assert (=> d!53505 e!115730))

(declare-fun res!83120 () Bool)

(assert (=> d!53505 (=> (not res!83120) (not e!115730))))

(assert (=> d!53505 (= res!83120 (contains!1158 lt!86724 lt!86732))))

(assert (=> d!53505 (= (addApplyDifferent!109 lt!86724 lt!86730 (minValue!3454 thiss!1248) lt!86732) lt!86802)))

(declare-fun b!175326 () Bool)

(assert (=> b!175326 (= e!115730 (not (= lt!86732 lt!86730)))))

(assert (= (and d!53505 res!83120) b!175326))

(declare-fun m!204429 () Bool)

(assert (=> d!53505 m!204429))

(declare-fun m!204431 () Bool)

(assert (=> d!53505 m!204431))

(assert (=> d!53505 m!204271))

(assert (=> d!53505 m!204273))

(assert (=> d!53505 m!204271))

(assert (=> d!53505 m!204279))

(assert (=> b!175201 d!53505))

(declare-fun d!53507 () Bool)

(assert (=> d!53507 (= (apply!133 lt!86719 lt!86733) (get!1990 (getValueByKey!189 (toList!1089 lt!86719) lt!86733)))))

(declare-fun bs!7255 () Bool)

(assert (= bs!7255 d!53507))

(declare-fun m!204433 () Bool)

(assert (=> bs!7255 m!204433))

(assert (=> bs!7255 m!204433))

(declare-fun m!204435 () Bool)

(assert (=> bs!7255 m!204435))

(assert (=> b!175201 d!53507))

(declare-fun d!53509 () Bool)

(assert (=> d!53509 (= (apply!133 (+!250 lt!86719 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) lt!86733) (apply!133 lt!86719 lt!86733))))

(declare-fun lt!86803 () Unit!5377)

(assert (=> d!53509 (= lt!86803 (choose!945 lt!86719 lt!86727 (minValue!3454 thiss!1248) lt!86733))))

(declare-fun e!115731 () Bool)

(assert (=> d!53509 e!115731))

(declare-fun res!83121 () Bool)

(assert (=> d!53509 (=> (not res!83121) (not e!115731))))

(assert (=> d!53509 (= res!83121 (contains!1158 lt!86719 lt!86733))))

(assert (=> d!53509 (= (addApplyDifferent!109 lt!86719 lt!86727 (minValue!3454 thiss!1248) lt!86733) lt!86803)))

(declare-fun b!175327 () Bool)

(assert (=> b!175327 (= e!115731 (not (= lt!86733 lt!86727)))))

(assert (= (and d!53509 res!83121) b!175327))

(declare-fun m!204437 () Bool)

(assert (=> d!53509 m!204437))

(declare-fun m!204439 () Bool)

(assert (=> d!53509 m!204439))

(assert (=> d!53509 m!204255))

(assert (=> d!53509 m!204263))

(assert (=> d!53509 m!204255))

(assert (=> d!53509 m!204275))

(assert (=> b!175201 d!53509))

(declare-fun d!53511 () Bool)

(declare-fun e!115732 () Bool)

(assert (=> d!53511 e!115732))

(declare-fun res!83122 () Bool)

(assert (=> d!53511 (=> (not res!83122) (not e!115732))))

(declare-fun lt!86807 () ListLongMap!2147)

(assert (=> d!53511 (= res!83122 (contains!1158 lt!86807 (_1!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86805 () List!2197)

(assert (=> d!53511 (= lt!86807 (ListLongMap!2148 lt!86805))))

(declare-fun lt!86806 () Unit!5377)

(declare-fun lt!86804 () Unit!5377)

(assert (=> d!53511 (= lt!86806 lt!86804)))

(assert (=> d!53511 (= (getValueByKey!189 lt!86805 (_1!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))))))

(assert (=> d!53511 (= lt!86804 (lemmaContainsTupThenGetReturnValue!101 lt!86805 (_1!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))))))

(assert (=> d!53511 (= lt!86805 (insertStrictlySorted!104 (toList!1089 lt!86719) (_1!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))))))

(assert (=> d!53511 (= (+!250 lt!86719 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))) lt!86807)))

(declare-fun b!175328 () Bool)

(declare-fun res!83123 () Bool)

(assert (=> b!175328 (=> (not res!83123) (not e!115732))))

(assert (=> b!175328 (= res!83123 (= (getValueByKey!189 (toList!1089 lt!86807) (_1!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))))))))

(declare-fun b!175329 () Bool)

(assert (=> b!175329 (= e!115732 (contains!1160 (toList!1089 lt!86807) (tuple2!3215 lt!86727 (minValue!3454 thiss!1248))))))

(assert (= (and d!53511 res!83122) b!175328))

(assert (= (and b!175328 res!83123) b!175329))

(declare-fun m!204441 () Bool)

(assert (=> d!53511 m!204441))

(declare-fun m!204443 () Bool)

(assert (=> d!53511 m!204443))

(declare-fun m!204445 () Bool)

(assert (=> d!53511 m!204445))

(declare-fun m!204447 () Bool)

(assert (=> d!53511 m!204447))

(declare-fun m!204449 () Bool)

(assert (=> b!175328 m!204449))

(declare-fun m!204451 () Bool)

(assert (=> b!175329 m!204451))

(assert (=> b!175201 d!53511))

(declare-fun d!53513 () Bool)

(assert (=> d!53513 (contains!1158 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) lt!86718)))

(declare-fun lt!86810 () Unit!5377)

(declare-fun choose!946 (ListLongMap!2147 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5377)

(assert (=> d!53513 (= lt!86810 (choose!946 lt!86729 lt!86720 (zeroValue!3454 thiss!1248) lt!86718))))

(assert (=> d!53513 (contains!1158 lt!86729 lt!86718)))

(assert (=> d!53513 (= (addStillContains!109 lt!86729 lt!86720 (zeroValue!3454 thiss!1248) lt!86718) lt!86810)))

(declare-fun bs!7256 () Bool)

(assert (= bs!7256 d!53513))

(assert (=> bs!7256 m!204257))

(assert (=> bs!7256 m!204257))

(assert (=> bs!7256 m!204259))

(declare-fun m!204453 () Bool)

(assert (=> bs!7256 m!204453))

(declare-fun m!204455 () Bool)

(assert (=> bs!7256 m!204455))

(assert (=> b!175201 d!53513))

(declare-fun d!53515 () Bool)

(assert (=> d!53515 (= (apply!133 (+!250 lt!86735 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) lt!86717) (get!1990 (getValueByKey!189 (toList!1089 (+!250 lt!86735 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248)))) lt!86717)))))

(declare-fun bs!7257 () Bool)

(assert (= bs!7257 d!53515))

(declare-fun m!204457 () Bool)

(assert (=> bs!7257 m!204457))

(assert (=> bs!7257 m!204457))

(declare-fun m!204459 () Bool)

(assert (=> bs!7257 m!204459))

(assert (=> b!175201 d!53515))

(declare-fun d!53517 () Bool)

(assert (=> d!53517 (= (apply!133 lt!86735 lt!86717) (get!1990 (getValueByKey!189 (toList!1089 lt!86735) lt!86717)))))

(declare-fun bs!7258 () Bool)

(assert (= bs!7258 d!53517))

(declare-fun m!204461 () Bool)

(assert (=> bs!7258 m!204461))

(assert (=> bs!7258 m!204461))

(declare-fun m!204463 () Bool)

(assert (=> bs!7258 m!204463))

(assert (=> b!175201 d!53517))

(declare-fun d!53519 () Bool)

(assert (=> d!53519 (= (apply!133 (+!250 lt!86724 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) lt!86732) (get!1990 (getValueByKey!189 (toList!1089 (+!250 lt!86724 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))) lt!86732)))))

(declare-fun bs!7259 () Bool)

(assert (= bs!7259 d!53519))

(declare-fun m!204465 () Bool)

(assert (=> bs!7259 m!204465))

(assert (=> bs!7259 m!204465))

(declare-fun m!204467 () Bool)

(assert (=> bs!7259 m!204467))

(assert (=> b!175201 d!53519))

(declare-fun d!53521 () Bool)

(declare-fun e!115733 () Bool)

(assert (=> d!53521 e!115733))

(declare-fun res!83124 () Bool)

(assert (=> d!53521 (=> (not res!83124) (not e!115733))))

(declare-fun lt!86814 () ListLongMap!2147)

(assert (=> d!53521 (= res!83124 (contains!1158 lt!86814 (_1!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86812 () List!2197)

(assert (=> d!53521 (= lt!86814 (ListLongMap!2148 lt!86812))))

(declare-fun lt!86813 () Unit!5377)

(declare-fun lt!86811 () Unit!5377)

(assert (=> d!53521 (= lt!86813 lt!86811)))

(assert (=> d!53521 (= (getValueByKey!189 lt!86812 (_1!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))))))

(assert (=> d!53521 (= lt!86811 (lemmaContainsTupThenGetReturnValue!101 lt!86812 (_1!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))))))

(assert (=> d!53521 (= lt!86812 (insertStrictlySorted!104 (toList!1089 lt!86724) (_1!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))))))

(assert (=> d!53521 (= (+!250 lt!86724 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))) lt!86814)))

(declare-fun b!175331 () Bool)

(declare-fun res!83125 () Bool)

(assert (=> b!175331 (=> (not res!83125) (not e!115733))))

(assert (=> b!175331 (= res!83125 (= (getValueByKey!189 (toList!1089 lt!86814) (_1!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))))))))

(declare-fun b!175332 () Bool)

(assert (=> b!175332 (= e!115733 (contains!1160 (toList!1089 lt!86814) (tuple2!3215 lt!86730 (minValue!3454 thiss!1248))))))

(assert (= (and d!53521 res!83124) b!175331))

(assert (= (and b!175331 res!83125) b!175332))

(declare-fun m!204469 () Bool)

(assert (=> d!53521 m!204469))

(declare-fun m!204471 () Bool)

(assert (=> d!53521 m!204471))

(declare-fun m!204473 () Bool)

(assert (=> d!53521 m!204473))

(declare-fun m!204475 () Bool)

(assert (=> d!53521 m!204475))

(declare-fun m!204477 () Bool)

(assert (=> b!175331 m!204477))

(declare-fun m!204479 () Bool)

(assert (=> b!175332 m!204479))

(assert (=> b!175201 d!53521))

(declare-fun d!53523 () Bool)

(declare-fun e!115734 () Bool)

(assert (=> d!53523 e!115734))

(declare-fun res!83126 () Bool)

(assert (=> d!53523 (=> (not res!83126) (not e!115734))))

(declare-fun lt!86818 () ListLongMap!2147)

(assert (=> d!53523 (= res!83126 (contains!1158 lt!86818 (_1!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))))))

(declare-fun lt!86816 () List!2197)

(assert (=> d!53523 (= lt!86818 (ListLongMap!2148 lt!86816))))

(declare-fun lt!86817 () Unit!5377)

(declare-fun lt!86815 () Unit!5377)

(assert (=> d!53523 (= lt!86817 lt!86815)))

(assert (=> d!53523 (= (getValueByKey!189 lt!86816 (_1!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53523 (= lt!86815 (lemmaContainsTupThenGetReturnValue!101 lt!86816 (_1!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53523 (= lt!86816 (insertStrictlySorted!104 (toList!1089 lt!86729) (_1!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) (_2!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53523 (= (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) lt!86818)))

(declare-fun b!175333 () Bool)

(declare-fun res!83127 () Bool)

(assert (=> b!175333 (=> (not res!83127) (not e!115734))))

(assert (=> b!175333 (= res!83127 (= (getValueByKey!189 (toList!1089 lt!86818) (_1!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) (Some!194 (_2!1618 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))))))))

(declare-fun b!175334 () Bool)

(assert (=> b!175334 (= e!115734 (contains!1160 (toList!1089 lt!86818) (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))))))

(assert (= (and d!53523 res!83126) b!175333))

(assert (= (and b!175333 res!83127) b!175334))

(declare-fun m!204481 () Bool)

(assert (=> d!53523 m!204481))

(declare-fun m!204483 () Bool)

(assert (=> d!53523 m!204483))

(declare-fun m!204485 () Bool)

(assert (=> d!53523 m!204485))

(declare-fun m!204487 () Bool)

(assert (=> d!53523 m!204487))

(declare-fun m!204489 () Bool)

(assert (=> b!175333 m!204489))

(declare-fun m!204491 () Bool)

(assert (=> b!175334 m!204491))

(assert (=> b!175201 d!53523))

(declare-fun d!53525 () Bool)

(assert (=> d!53525 (= (apply!133 (+!250 lt!86735 (tuple2!3215 lt!86721 (zeroValue!3454 thiss!1248))) lt!86717) (apply!133 lt!86735 lt!86717))))

(declare-fun lt!86819 () Unit!5377)

(assert (=> d!53525 (= lt!86819 (choose!945 lt!86735 lt!86721 (zeroValue!3454 thiss!1248) lt!86717))))

(declare-fun e!115735 () Bool)

(assert (=> d!53525 e!115735))

(declare-fun res!83128 () Bool)

(assert (=> d!53525 (=> (not res!83128) (not e!115735))))

(assert (=> d!53525 (= res!83128 (contains!1158 lt!86735 lt!86717))))

(assert (=> d!53525 (= (addApplyDifferent!109 lt!86735 lt!86721 (zeroValue!3454 thiss!1248) lt!86717) lt!86819)))

(declare-fun b!175335 () Bool)

(assert (=> b!175335 (= e!115735 (not (= lt!86717 lt!86721)))))

(assert (= (and d!53525 res!83128) b!175335))

(declare-fun m!204493 () Bool)

(assert (=> d!53525 m!204493))

(declare-fun m!204495 () Bool)

(assert (=> d!53525 m!204495))

(assert (=> d!53525 m!204267))

(assert (=> d!53525 m!204269))

(assert (=> d!53525 m!204267))

(assert (=> d!53525 m!204277))

(assert (=> b!175201 d!53525))

(declare-fun d!53527 () Bool)

(declare-fun e!115736 () Bool)

(assert (=> d!53527 e!115736))

(declare-fun res!83129 () Bool)

(assert (=> d!53527 (=> res!83129 e!115736)))

(declare-fun lt!86820 () Bool)

(assert (=> d!53527 (= res!83129 (not lt!86820))))

(declare-fun lt!86823 () Bool)

(assert (=> d!53527 (= lt!86820 lt!86823)))

(declare-fun lt!86822 () Unit!5377)

(declare-fun e!115737 () Unit!5377)

(assert (=> d!53527 (= lt!86822 e!115737)))

(declare-fun c!31409 () Bool)

(assert (=> d!53527 (= c!31409 lt!86823)))

(assert (=> d!53527 (= lt!86823 (containsKey!192 (toList!1089 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) lt!86718))))

(assert (=> d!53527 (= (contains!1158 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248))) lt!86718) lt!86820)))

(declare-fun b!175336 () Bool)

(declare-fun lt!86821 () Unit!5377)

(assert (=> b!175336 (= e!115737 lt!86821)))

(assert (=> b!175336 (= lt!86821 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) lt!86718))))

(assert (=> b!175336 (isDefined!141 (getValueByKey!189 (toList!1089 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) lt!86718))))

(declare-fun b!175337 () Bool)

(declare-fun Unit!5383 () Unit!5377)

(assert (=> b!175337 (= e!115737 Unit!5383)))

(declare-fun b!175338 () Bool)

(assert (=> b!175338 (= e!115736 (isDefined!141 (getValueByKey!189 (toList!1089 (+!250 lt!86729 (tuple2!3215 lt!86720 (zeroValue!3454 thiss!1248)))) lt!86718)))))

(assert (= (and d!53527 c!31409) b!175336))

(assert (= (and d!53527 (not c!31409)) b!175337))

(assert (= (and d!53527 (not res!83129)) b!175338))

(declare-fun m!204497 () Bool)

(assert (=> d!53527 m!204497))

(declare-fun m!204499 () Bool)

(assert (=> b!175336 m!204499))

(declare-fun m!204501 () Bool)

(assert (=> b!175336 m!204501))

(assert (=> b!175336 m!204501))

(declare-fun m!204503 () Bool)

(assert (=> b!175336 m!204503))

(assert (=> b!175338 m!204501))

(assert (=> b!175338 m!204501))

(assert (=> b!175338 m!204503))

(assert (=> b!175201 d!53527))

(declare-fun b!175349 () Bool)

(declare-fun e!115747 () Bool)

(declare-fun call!17740 () Bool)

(assert (=> b!175349 (= e!115747 call!17740)))

(declare-fun b!175350 () Bool)

(declare-fun e!115746 () Bool)

(assert (=> b!175350 (= e!115746 e!115747)))

(declare-fun c!31412 () Bool)

(assert (=> b!175350 (= c!31412 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175351 () Bool)

(declare-fun e!115748 () Bool)

(declare-fun contains!1161 (List!2199 (_ BitVec 64)) Bool)

(assert (=> b!175351 (= e!115748 (contains!1161 Nil!2196 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175352 () Bool)

(declare-fun e!115749 () Bool)

(assert (=> b!175352 (= e!115749 e!115746)))

(declare-fun res!83136 () Bool)

(assert (=> b!175352 (=> (not res!83136) (not e!115746))))

(assert (=> b!175352 (= res!83136 (not e!115748))))

(declare-fun res!83137 () Bool)

(assert (=> b!175352 (=> (not res!83137) (not e!115748))))

(assert (=> b!175352 (= res!83137 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53529 () Bool)

(declare-fun res!83138 () Bool)

(assert (=> d!53529 (=> res!83138 e!115749)))

(assert (=> d!53529 (= res!83138 (bvsge #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53529 (= (arrayNoDuplicates!0 (_keys!5461 thiss!1248) #b00000000000000000000000000000000 Nil!2196) e!115749)))

(declare-fun bm!17737 () Bool)

(assert (=> bm!17737 (= call!17740 (arrayNoDuplicates!0 (_keys!5461 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31412 (Cons!2195 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000) Nil!2196) Nil!2196)))))

(declare-fun b!175353 () Bool)

(assert (=> b!175353 (= e!115747 call!17740)))

(assert (= (and d!53529 (not res!83138)) b!175352))

(assert (= (and b!175352 res!83137) b!175351))

(assert (= (and b!175352 res!83136) b!175350))

(assert (= (and b!175350 c!31412) b!175349))

(assert (= (and b!175350 (not c!31412)) b!175353))

(assert (= (or b!175349 b!175353) bm!17737))

(assert (=> b!175350 m!204251))

(assert (=> b!175350 m!204251))

(assert (=> b!175350 m!204289))

(assert (=> b!175351 m!204251))

(assert (=> b!175351 m!204251))

(declare-fun m!204505 () Bool)

(assert (=> b!175351 m!204505))

(assert (=> b!175352 m!204251))

(assert (=> b!175352 m!204251))

(assert (=> b!175352 m!204289))

(assert (=> bm!17737 m!204251))

(declare-fun m!204507 () Bool)

(assert (=> bm!17737 m!204507))

(assert (=> b!175217 d!53529))

(declare-fun b!175366 () Bool)

(declare-fun e!115758 () SeekEntryResult!540)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175366 (= e!115758 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19254 lt!86747) #b00000000000000000000000000000001) (nextIndex!0 (index!4330 lt!86747) (bvadd (x!19254 lt!86747) #b00000000000000000000000000000001) (mask!8502 thiss!1248)) (index!4330 lt!86747) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(declare-fun b!175367 () Bool)

(declare-fun e!115757 () SeekEntryResult!540)

(assert (=> b!175367 (= e!115757 Undefined!540)))

(declare-fun b!175368 () Bool)

(declare-fun e!115756 () SeekEntryResult!540)

(assert (=> b!175368 (= e!115757 e!115756)))

(declare-fun c!31419 () Bool)

(declare-fun lt!86829 () (_ BitVec 64))

(assert (=> b!175368 (= c!31419 (= lt!86829 key!828))))

(declare-fun b!175369 () Bool)

(declare-fun c!31421 () Bool)

(assert (=> b!175369 (= c!31421 (= lt!86829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175369 (= e!115756 e!115758)))

(declare-fun b!175370 () Bool)

(assert (=> b!175370 (= e!115756 (Found!540 (index!4330 lt!86747)))))

(declare-fun d!53531 () Bool)

(declare-fun lt!86828 () SeekEntryResult!540)

(assert (=> d!53531 (and (or ((_ is Undefined!540) lt!86828) (not ((_ is Found!540) lt!86828)) (and (bvsge (index!4329 lt!86828) #b00000000000000000000000000000000) (bvslt (index!4329 lt!86828) (size!3777 (_keys!5461 thiss!1248))))) (or ((_ is Undefined!540) lt!86828) ((_ is Found!540) lt!86828) (not ((_ is MissingVacant!540) lt!86828)) (not (= (index!4331 lt!86828) (index!4330 lt!86747))) (and (bvsge (index!4331 lt!86828) #b00000000000000000000000000000000) (bvslt (index!4331 lt!86828) (size!3777 (_keys!5461 thiss!1248))))) (or ((_ is Undefined!540) lt!86828) (ite ((_ is Found!540) lt!86828) (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4329 lt!86828)) key!828) (and ((_ is MissingVacant!540) lt!86828) (= (index!4331 lt!86828) (index!4330 lt!86747)) (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4331 lt!86828)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53531 (= lt!86828 e!115757)))

(declare-fun c!31420 () Bool)

(assert (=> d!53531 (= c!31420 (bvsge (x!19254 lt!86747) #b01111111111111111111111111111110))))

(assert (=> d!53531 (= lt!86829 (select (arr!3476 (_keys!5461 thiss!1248)) (index!4330 lt!86747)))))

(assert (=> d!53531 (validMask!0 (mask!8502 thiss!1248))))

(assert (=> d!53531 (= (seekKeyOrZeroReturnVacant!0 (x!19254 lt!86747) (index!4330 lt!86747) (index!4330 lt!86747) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)) lt!86828)))

(declare-fun b!175371 () Bool)

(assert (=> b!175371 (= e!115758 (MissingVacant!540 (index!4330 lt!86747)))))

(assert (= (and d!53531 c!31420) b!175367))

(assert (= (and d!53531 (not c!31420)) b!175368))

(assert (= (and b!175368 c!31419) b!175370))

(assert (= (and b!175368 (not c!31419)) b!175369))

(assert (= (and b!175369 c!31421) b!175371))

(assert (= (and b!175369 (not c!31421)) b!175366))

(declare-fun m!204509 () Bool)

(assert (=> b!175366 m!204509))

(assert (=> b!175366 m!204509))

(declare-fun m!204511 () Bool)

(assert (=> b!175366 m!204511))

(declare-fun m!204513 () Bool)

(assert (=> d!53531 m!204513))

(declare-fun m!204515 () Bool)

(assert (=> d!53531 m!204515))

(assert (=> d!53531 m!204321))

(assert (=> d!53531 m!204201))

(assert (=> b!175235 d!53531))

(declare-fun b!175380 () Bool)

(declare-fun e!115766 () Bool)

(declare-fun e!115767 () Bool)

(assert (=> b!175380 (= e!115766 e!115767)))

(declare-fun lt!86837 () (_ BitVec 64))

(assert (=> b!175380 (= lt!86837 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86838 () Unit!5377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7321 (_ BitVec 64) (_ BitVec 32)) Unit!5377)

(assert (=> b!175380 (= lt!86838 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5461 thiss!1248) lt!86837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175380 (arrayContainsKey!0 (_keys!5461 thiss!1248) lt!86837 #b00000000000000000000000000000000)))

(declare-fun lt!86836 () Unit!5377)

(assert (=> b!175380 (= lt!86836 lt!86838)))

(declare-fun res!83144 () Bool)

(assert (=> b!175380 (= res!83144 (= (seekEntryOrOpen!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000) (_keys!5461 thiss!1248) (mask!8502 thiss!1248)) (Found!540 #b00000000000000000000000000000000)))))

(assert (=> b!175380 (=> (not res!83144) (not e!115767))))

(declare-fun b!175381 () Bool)

(declare-fun e!115765 () Bool)

(assert (=> b!175381 (= e!115765 e!115766)))

(declare-fun c!31424 () Bool)

(assert (=> b!175381 (= c!31424 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53533 () Bool)

(declare-fun res!83143 () Bool)

(assert (=> d!53533 (=> res!83143 e!115765)))

(assert (=> d!53533 (= res!83143 (bvsge #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)) e!115765)))

(declare-fun bm!17740 () Bool)

(declare-fun call!17743 () Bool)

(assert (=> bm!17740 (= call!17743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(declare-fun b!175382 () Bool)

(assert (=> b!175382 (= e!115766 call!17743)))

(declare-fun b!175383 () Bool)

(assert (=> b!175383 (= e!115767 call!17743)))

(assert (= (and d!53533 (not res!83143)) b!175381))

(assert (= (and b!175381 c!31424) b!175380))

(assert (= (and b!175381 (not c!31424)) b!175382))

(assert (= (and b!175380 res!83144) b!175383))

(assert (= (or b!175383 b!175382) bm!17740))

(assert (=> b!175380 m!204251))

(declare-fun m!204517 () Bool)

(assert (=> b!175380 m!204517))

(declare-fun m!204519 () Bool)

(assert (=> b!175380 m!204519))

(assert (=> b!175380 m!204251))

(declare-fun m!204521 () Bool)

(assert (=> b!175380 m!204521))

(assert (=> b!175381 m!204251))

(assert (=> b!175381 m!204251))

(assert (=> b!175381 m!204289))

(declare-fun m!204523 () Bool)

(assert (=> bm!17740 m!204523))

(assert (=> b!175216 d!53533))

(declare-fun b!175402 () Bool)

(declare-fun lt!86844 () SeekEntryResult!540)

(assert (=> b!175402 (and (bvsge (index!4330 lt!86844) #b00000000000000000000000000000000) (bvslt (index!4330 lt!86844) (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun res!83151 () Bool)

(assert (=> b!175402 (= res!83151 (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4330 lt!86844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115782 () Bool)

(assert (=> b!175402 (=> res!83151 e!115782)))

(declare-fun b!175404 () Bool)

(declare-fun e!115778 () SeekEntryResult!540)

(declare-fun e!115781 () SeekEntryResult!540)

(assert (=> b!175404 (= e!115778 e!115781)))

(declare-fun c!31431 () Bool)

(declare-fun lt!86843 () (_ BitVec 64))

(assert (=> b!175404 (= c!31431 (or (= lt!86843 key!828) (= (bvadd lt!86843 lt!86843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175405 () Bool)

(assert (=> b!175405 (and (bvsge (index!4330 lt!86844) #b00000000000000000000000000000000) (bvslt (index!4330 lt!86844) (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun res!83153 () Bool)

(assert (=> b!175405 (= res!83153 (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4330 lt!86844)) key!828))))

(assert (=> b!175405 (=> res!83153 e!115782)))

(declare-fun e!115780 () Bool)

(assert (=> b!175405 (= e!115780 e!115782)))

(declare-fun b!175406 () Bool)

(assert (=> b!175406 (= e!115781 (Intermediate!540 false (toIndex!0 key!828 (mask!8502 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!53535 () Bool)

(declare-fun e!115779 () Bool)

(assert (=> d!53535 e!115779))

(declare-fun c!31432 () Bool)

(assert (=> d!53535 (= c!31432 (and ((_ is Intermediate!540) lt!86844) (undefined!1352 lt!86844)))))

(assert (=> d!53535 (= lt!86844 e!115778)))

(declare-fun c!31433 () Bool)

(assert (=> d!53535 (= c!31433 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53535 (= lt!86843 (select (arr!3476 (_keys!5461 thiss!1248)) (toIndex!0 key!828 (mask!8502 thiss!1248))))))

(assert (=> d!53535 (validMask!0 (mask!8502 thiss!1248))))

(assert (=> d!53535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8502 thiss!1248)) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)) lt!86844)))

(declare-fun b!175403 () Bool)

(assert (=> b!175403 (= e!115779 (bvsge (x!19254 lt!86844) #b01111111111111111111111111111110))))

(declare-fun b!175407 () Bool)

(assert (=> b!175407 (and (bvsge (index!4330 lt!86844) #b00000000000000000000000000000000) (bvslt (index!4330 lt!86844) (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> b!175407 (= e!115782 (= (select (arr!3476 (_keys!5461 thiss!1248)) (index!4330 lt!86844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175408 () Bool)

(assert (=> b!175408 (= e!115781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8502 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8502 thiss!1248)) key!828 (_keys!5461 thiss!1248) (mask!8502 thiss!1248)))))

(declare-fun b!175409 () Bool)

(assert (=> b!175409 (= e!115779 e!115780)))

(declare-fun res!83152 () Bool)

(assert (=> b!175409 (= res!83152 (and ((_ is Intermediate!540) lt!86844) (not (undefined!1352 lt!86844)) (bvslt (x!19254 lt!86844) #b01111111111111111111111111111110) (bvsge (x!19254 lt!86844) #b00000000000000000000000000000000) (bvsge (x!19254 lt!86844) #b00000000000000000000000000000000)))))

(assert (=> b!175409 (=> (not res!83152) (not e!115780))))

(declare-fun b!175410 () Bool)

(assert (=> b!175410 (= e!115778 (Intermediate!540 true (toIndex!0 key!828 (mask!8502 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!53535 c!31433) b!175410))

(assert (= (and d!53535 (not c!31433)) b!175404))

(assert (= (and b!175404 c!31431) b!175406))

(assert (= (and b!175404 (not c!31431)) b!175408))

(assert (= (and d!53535 c!31432) b!175403))

(assert (= (and d!53535 (not c!31432)) b!175409))

(assert (= (and b!175409 res!83152) b!175405))

(assert (= (and b!175405 (not res!83153)) b!175402))

(assert (= (and b!175402 (not res!83151)) b!175407))

(assert (=> b!175408 m!204313))

(declare-fun m!204525 () Bool)

(assert (=> b!175408 m!204525))

(assert (=> b!175408 m!204525))

(declare-fun m!204527 () Bool)

(assert (=> b!175408 m!204527))

(declare-fun m!204529 () Bool)

(assert (=> b!175405 m!204529))

(assert (=> b!175402 m!204529))

(assert (=> d!53535 m!204313))

(declare-fun m!204531 () Bool)

(assert (=> d!53535 m!204531))

(assert (=> d!53535 m!204201))

(assert (=> b!175407 m!204529))

(assert (=> d!53463 d!53535))

(declare-fun d!53537 () Bool)

(declare-fun lt!86850 () (_ BitVec 32))

(declare-fun lt!86849 () (_ BitVec 32))

(assert (=> d!53537 (= lt!86850 (bvmul (bvxor lt!86849 (bvlshr lt!86849 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53537 (= lt!86849 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53537 (and (bvsge (mask!8502 thiss!1248) #b00000000000000000000000000000000) (let ((res!83154 (let ((h!2814 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19274 (bvmul (bvxor h!2814 (bvlshr h!2814 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19274 (bvlshr x!19274 #b00000000000000000000000000001101)) (mask!8502 thiss!1248)))))) (and (bvslt res!83154 (bvadd (mask!8502 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83154 #b00000000000000000000000000000000))))))

(assert (=> d!53537 (= (toIndex!0 key!828 (mask!8502 thiss!1248)) (bvand (bvxor lt!86850 (bvlshr lt!86850 #b00000000000000000000000000001101)) (mask!8502 thiss!1248)))))

(assert (=> d!53463 d!53537))

(assert (=> d!53463 d!53469))

(declare-fun d!53539 () Bool)

(declare-fun e!115783 () Bool)

(assert (=> d!53539 e!115783))

(declare-fun res!83155 () Bool)

(assert (=> d!53539 (=> res!83155 e!115783)))

(declare-fun lt!86851 () Bool)

(assert (=> d!53539 (= res!83155 (not lt!86851))))

(declare-fun lt!86854 () Bool)

(assert (=> d!53539 (= lt!86851 lt!86854)))

(declare-fun lt!86853 () Unit!5377)

(declare-fun e!115784 () Unit!5377)

(assert (=> d!53539 (= lt!86853 e!115784)))

(declare-fun c!31434 () Bool)

(assert (=> d!53539 (= c!31434 lt!86854)))

(assert (=> d!53539 (= lt!86854 (containsKey!192 (toList!1089 lt!86736) (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53539 (= (contains!1158 lt!86736 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)) lt!86851)))

(declare-fun b!175411 () Bool)

(declare-fun lt!86852 () Unit!5377)

(assert (=> b!175411 (= e!115784 lt!86852)))

(assert (=> b!175411 (= lt!86852 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1089 lt!86736) (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175411 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175412 () Bool)

(declare-fun Unit!5384 () Unit!5377)

(assert (=> b!175412 (= e!115784 Unit!5384)))

(declare-fun b!175413 () Bool)

(assert (=> b!175413 (= e!115783 (isDefined!141 (getValueByKey!189 (toList!1089 lt!86736) (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53539 c!31434) b!175411))

(assert (= (and d!53539 (not c!31434)) b!175412))

(assert (= (and d!53539 (not res!83155)) b!175413))

(assert (=> d!53539 m!204251))

(declare-fun m!204533 () Bool)

(assert (=> d!53539 m!204533))

(assert (=> b!175411 m!204251))

(declare-fun m!204535 () Bool)

(assert (=> b!175411 m!204535))

(assert (=> b!175411 m!204251))

(assert (=> b!175411 m!204351))

(assert (=> b!175411 m!204351))

(declare-fun m!204537 () Bool)

(assert (=> b!175411 m!204537))

(assert (=> b!175413 m!204251))

(assert (=> b!175413 m!204351))

(assert (=> b!175413 m!204351))

(assert (=> b!175413 m!204537))

(assert (=> b!175192 d!53539))

(assert (=> b!175143 d!53475))

(assert (=> b!175143 d!53477))

(assert (=> d!53459 d!53469))

(declare-fun d!53541 () Bool)

(declare-fun lt!86857 () (_ BitVec 32))

(assert (=> d!53541 (and (bvsge lt!86857 #b00000000000000000000000000000000) (bvsle lt!86857 (bvsub (size!3777 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115789 () (_ BitVec 32))

(assert (=> d!53541 (= lt!86857 e!115789)))

(declare-fun c!31440 () Bool)

(assert (=> d!53541 (= c!31440 (bvsge #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53541 (and (bvsle #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3777 (_keys!5461 thiss!1248)) (size!3777 (_keys!5461 thiss!1248))))))

(assert (=> d!53541 (= (arrayCountValidKeys!0 (_keys!5461 thiss!1248) #b00000000000000000000000000000000 (size!3777 (_keys!5461 thiss!1248))) lt!86857)))

(declare-fun bm!17743 () Bool)

(declare-fun call!17746 () (_ BitVec 32))

(assert (=> bm!17743 (= call!17746 (arrayCountValidKeys!0 (_keys!5461 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3777 (_keys!5461 thiss!1248))))))

(declare-fun b!175422 () Bool)

(declare-fun e!115790 () (_ BitVec 32))

(assert (=> b!175422 (= e!115790 call!17746)))

(declare-fun b!175423 () Bool)

(assert (=> b!175423 (= e!115789 e!115790)))

(declare-fun c!31439 () Bool)

(assert (=> b!175423 (= c!31439 (validKeyInArray!0 (select (arr!3476 (_keys!5461 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175424 () Bool)

(assert (=> b!175424 (= e!115790 (bvadd #b00000000000000000000000000000001 call!17746))))

(declare-fun b!175425 () Bool)

(assert (=> b!175425 (= e!115789 #b00000000000000000000000000000000)))

(assert (= (and d!53541 c!31440) b!175425))

(assert (= (and d!53541 (not c!31440)) b!175423))

(assert (= (and b!175423 c!31439) b!175424))

(assert (= (and b!175423 (not c!31439)) b!175422))

(assert (= (or b!175424 b!175422) bm!17743))

(declare-fun m!204539 () Bool)

(assert (=> bm!17743 m!204539))

(assert (=> b!175423 m!204251))

(assert (=> b!175423 m!204251))

(assert (=> b!175423 m!204289))

(assert (=> b!175215 d!53541))

(declare-fun b!175435 () Bool)

(declare-fun res!83164 () Bool)

(declare-fun e!115793 () Bool)

(assert (=> b!175435 (=> (not res!83164) (not e!115793))))

(declare-fun size!3783 (LongMapFixedSize!2320) (_ BitVec 32))

(assert (=> b!175435 (= res!83164 (bvsge (size!3783 thiss!1248) (_size!1209 thiss!1248)))))

(declare-fun b!175434 () Bool)

(declare-fun res!83166 () Bool)

(assert (=> b!175434 (=> (not res!83166) (not e!115793))))

(assert (=> b!175434 (= res!83166 (and (= (size!3778 (_values!3596 thiss!1248)) (bvadd (mask!8502 thiss!1248) #b00000000000000000000000000000001)) (= (size!3777 (_keys!5461 thiss!1248)) (size!3778 (_values!3596 thiss!1248))) (bvsge (_size!1209 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1209 thiss!1248) (bvadd (mask!8502 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!175436 () Bool)

(declare-fun res!83165 () Bool)

(assert (=> b!175436 (=> (not res!83165) (not e!115793))))

(assert (=> b!175436 (= res!83165 (= (size!3783 thiss!1248) (bvadd (_size!1209 thiss!1248) (bvsdiv (bvadd (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!53543 () Bool)

(declare-fun res!83167 () Bool)

(assert (=> d!53543 (=> (not res!83167) (not e!115793))))

(assert (=> d!53543 (= res!83167 (validMask!0 (mask!8502 thiss!1248)))))

(assert (=> d!53543 (= (simpleValid!147 thiss!1248) e!115793)))

(declare-fun b!175437 () Bool)

(assert (=> b!175437 (= e!115793 (and (bvsge (extraKeys!3350 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3350 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1209 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!53543 res!83167) b!175434))

(assert (= (and b!175434 res!83166) b!175435))

(assert (= (and b!175435 res!83164) b!175436))

(assert (= (and b!175436 res!83165) b!175437))

(declare-fun m!204541 () Bool)

(assert (=> b!175435 m!204541))

(assert (=> b!175436 m!204541))

(assert (=> d!53543 m!204201))

(assert (=> d!53461 d!53543))

(declare-fun condMapEmpty!6997 () Bool)

(declare-fun mapDefault!6997 () ValueCell!1706)

(assert (=> mapNonEmpty!6996 (= condMapEmpty!6997 (= mapRest!6996 ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6997)))))

(declare-fun e!115795 () Bool)

(declare-fun mapRes!6997 () Bool)

(assert (=> mapNonEmpty!6996 (= tp!15672 (and e!115795 mapRes!6997))))

(declare-fun b!175438 () Bool)

(declare-fun e!115794 () Bool)

(assert (=> b!175438 (= e!115794 tp_is_empty!4099)))

(declare-fun mapIsEmpty!6997 () Bool)

(assert (=> mapIsEmpty!6997 mapRes!6997))

(declare-fun mapNonEmpty!6997 () Bool)

(declare-fun tp!15673 () Bool)

(assert (=> mapNonEmpty!6997 (= mapRes!6997 (and tp!15673 e!115794))))

(declare-fun mapValue!6997 () ValueCell!1706)

(declare-fun mapKey!6997 () (_ BitVec 32))

(declare-fun mapRest!6997 () (Array (_ BitVec 32) ValueCell!1706))

(assert (=> mapNonEmpty!6997 (= mapRest!6996 (store mapRest!6997 mapKey!6997 mapValue!6997))))

(declare-fun b!175439 () Bool)

(assert (=> b!175439 (= e!115795 tp_is_empty!4099)))

(assert (= (and mapNonEmpty!6996 condMapEmpty!6997) mapIsEmpty!6997))

(assert (= (and mapNonEmpty!6996 (not condMapEmpty!6997)) mapNonEmpty!6997))

(assert (= (and mapNonEmpty!6997 ((_ is ValueCellFull!1706) mapValue!6997)) b!175438))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1706) mapDefault!6997)) b!175439))

(declare-fun m!204543 () Bool)

(assert (=> mapNonEmpty!6997 m!204543))

(declare-fun b_lambda!7029 () Bool)

(assert (= b_lambda!7025 (or (and b!175072 b_free!4327) b_lambda!7029)))

(declare-fun b_lambda!7031 () Bool)

(assert (= b_lambda!7027 (or (and b!175072 b_free!4327) b_lambda!7031)))

(check-sat (not b!175319) (not d!53519) (not b!175318) (not d!53485) (not d!53481) (not d!53471) (not d!53479) (not d!53489) (not d!53507) (not b_lambda!7023) (not d!53491) (not b!175321) (not d!53505) (not d!53503) (not d!53499) (not b!175436) (not d!53523) (not b!175338) (not b!175312) (not d!53527) (not d!53501) (not b!175336) (not b!175331) (not b_lambda!7029) (not d!53487) (not bm!17740) (not b!175408) (not bm!17737) (not mapNonEmpty!6997) (not d!53517) (not b!175252) (not b!175320) (not b!175332) (not b!175329) (not b!175334) (not b!175269) (not d!53475) (not b!175351) (not d!53473) (not b!175423) (not b!175322) (not b!175381) (not b!175350) (not b!175249) (not b!175333) (not d!53525) (not b!175301) tp_is_empty!4099 (not bm!17743) (not d!53539) (not b!175411) (not b!175295) (not bm!17734) (not d!53513) (not b!175328) (not d!53521) (not b!175298) (not b_lambda!7031) b_and!10825 (not d!53531) (not d!53509) (not b!175270) (not b!175306) (not d!53511) (not d!53515) (not d!53497) (not b!175300) (not b!175435) (not b!175304) (not d!53543) (not d!53535) (not b!175366) (not b!175297) (not b!175352) (not b_next!4327) (not b!175310) (not b!175307) (not b!175302) (not b!175263) (not b!175413) (not b!175248) (not b!175309) (not b!175380))
(check-sat b_and!10825 (not b_next!4327))
