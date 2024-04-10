; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17730 () Bool)

(assert start!17730)

(declare-fun b!177261 () Bool)

(declare-fun b_free!4383 () Bool)

(declare-fun b_next!4383 () Bool)

(assert (=> b!177261 (= b_free!4383 (not b_next!4383))))

(declare-fun tp!15849 () Bool)

(declare-fun b_and!10883 () Bool)

(assert (=> b!177261 (= tp!15849 b_and!10883)))

(declare-fun b!177256 () Bool)

(declare-fun e!116897 () Bool)

(declare-fun tp_is_empty!4155 () Bool)

(assert (=> b!177256 (= e!116897 tp_is_empty!4155)))

(declare-fun b!177257 () Bool)

(declare-fun e!116898 () Bool)

(declare-datatypes ((V!5187 0))(
  ( (V!5188 (val!2122 Int)) )
))
(declare-datatypes ((ValueCell!1734 0))(
  ( (ValueCellFull!1734 (v!4002 V!5187)) (EmptyCell!1734) )
))
(declare-datatypes ((array!7461 0))(
  ( (array!7462 (arr!3539 (Array (_ BitVec 32) (_ BitVec 64))) (size!3843 (_ BitVec 32))) )
))
(declare-datatypes ((array!7463 0))(
  ( (array!7464 (arr!3540 (Array (_ BitVec 32) ValueCell!1734)) (size!3844 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2376 0))(
  ( (LongMapFixedSize!2377 (defaultEntry!3651 Int) (mask!8587 (_ BitVec 32)) (extraKeys!3388 (_ BitVec 32)) (zeroValue!3492 V!5187) (minValue!3492 V!5187) (_size!1237 (_ BitVec 32)) (_keys!5518 array!7461) (_values!3634 array!7463) (_vacant!1237 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2376)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177257 (= e!116898 (not (validMask!0 (mask!8587 thiss!1248))))))

(declare-fun b!177258 () Bool)

(declare-fun res!84026 () Bool)

(assert (=> b!177258 (=> (not res!84026) (not e!116898))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3304 0))(
  ( (tuple2!3305 (_1!1663 (_ BitVec 64)) (_2!1663 V!5187)) )
))
(declare-datatypes ((List!2253 0))(
  ( (Nil!2250) (Cons!2249 (h!2870 tuple2!3304) (t!7083 List!2253)) )
))
(declare-datatypes ((ListLongMap!2231 0))(
  ( (ListLongMap!2232 (toList!1131 List!2253)) )
))
(declare-fun contains!1197 (ListLongMap!2231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!783 (array!7461 array!7463 (_ BitVec 32) (_ BitVec 32) V!5187 V!5187 (_ BitVec 32) Int) ListLongMap!2231)

(assert (=> b!177258 (= res!84026 (not (contains!1197 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)) key!828)))))

(declare-fun b!177259 () Bool)

(declare-fun res!84028 () Bool)

(assert (=> b!177259 (=> (not res!84028) (not e!116898))))

(assert (=> b!177259 (= res!84028 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177260 () Bool)

(declare-fun e!116896 () Bool)

(assert (=> b!177260 (= e!116896 tp_is_empty!4155)))

(declare-fun e!116900 () Bool)

(declare-fun e!116899 () Bool)

(declare-fun array_inv!2269 (array!7461) Bool)

(declare-fun array_inv!2270 (array!7463) Bool)

(assert (=> b!177261 (= e!116900 (and tp!15849 tp_is_empty!4155 (array_inv!2269 (_keys!5518 thiss!1248)) (array_inv!2270 (_values!3634 thiss!1248)) e!116899))))

(declare-fun b!177262 () Bool)

(declare-fun res!84029 () Bool)

(assert (=> b!177262 (=> (not res!84029) (not e!116898))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!566 0))(
  ( (MissingZero!566 (index!4432 (_ BitVec 32))) (Found!566 (index!4433 (_ BitVec 32))) (Intermediate!566 (undefined!1378 Bool) (index!4434 (_ BitVec 32)) (x!19446 (_ BitVec 32))) (Undefined!566) (MissingVacant!566 (index!4435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7461 (_ BitVec 32)) SeekEntryResult!566)

(assert (=> b!177262 (= res!84029 ((_ is Undefined!566) (seekEntryOrOpen!0 key!828 (_keys!5518 thiss!1248) (mask!8587 thiss!1248))))))

(declare-fun mapNonEmpty!7095 () Bool)

(declare-fun mapRes!7095 () Bool)

(declare-fun tp!15848 () Bool)

(assert (=> mapNonEmpty!7095 (= mapRes!7095 (and tp!15848 e!116896))))

(declare-fun mapValue!7095 () ValueCell!1734)

(declare-fun mapKey!7095 () (_ BitVec 32))

(declare-fun mapRest!7095 () (Array (_ BitVec 32) ValueCell!1734))

(assert (=> mapNonEmpty!7095 (= (arr!3540 (_values!3634 thiss!1248)) (store mapRest!7095 mapKey!7095 mapValue!7095))))

(declare-fun b!177263 () Bool)

(assert (=> b!177263 (= e!116899 (and e!116897 mapRes!7095))))

(declare-fun condMapEmpty!7095 () Bool)

(declare-fun mapDefault!7095 () ValueCell!1734)

(assert (=> b!177263 (= condMapEmpty!7095 (= (arr!3540 (_values!3634 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1734)) mapDefault!7095)))))

(declare-fun mapIsEmpty!7095 () Bool)

(assert (=> mapIsEmpty!7095 mapRes!7095))

(declare-fun res!84027 () Bool)

(assert (=> start!17730 (=> (not res!84027) (not e!116898))))

(declare-fun valid!996 (LongMapFixedSize!2376) Bool)

(assert (=> start!17730 (= res!84027 (valid!996 thiss!1248))))

(assert (=> start!17730 e!116898))

(assert (=> start!17730 e!116900))

(assert (=> start!17730 true))

(assert (= (and start!17730 res!84027) b!177259))

(assert (= (and b!177259 res!84028) b!177262))

(assert (= (and b!177262 res!84029) b!177258))

(assert (= (and b!177258 res!84026) b!177257))

(assert (= (and b!177263 condMapEmpty!7095) mapIsEmpty!7095))

(assert (= (and b!177263 (not condMapEmpty!7095)) mapNonEmpty!7095))

(assert (= (and mapNonEmpty!7095 ((_ is ValueCellFull!1734) mapValue!7095)) b!177260))

(assert (= (and b!177263 ((_ is ValueCellFull!1734) mapDefault!7095)) b!177256))

(assert (= b!177261 b!177263))

(assert (= start!17730 b!177261))

(declare-fun m!205809 () Bool)

(assert (=> mapNonEmpty!7095 m!205809))

(declare-fun m!205811 () Bool)

(assert (=> b!177258 m!205811))

(assert (=> b!177258 m!205811))

(declare-fun m!205813 () Bool)

(assert (=> b!177258 m!205813))

(declare-fun m!205815 () Bool)

(assert (=> b!177257 m!205815))

(declare-fun m!205817 () Bool)

(assert (=> b!177261 m!205817))

(declare-fun m!205819 () Bool)

(assert (=> b!177261 m!205819))

(declare-fun m!205821 () Bool)

(assert (=> start!17730 m!205821))

(declare-fun m!205823 () Bool)

(assert (=> b!177262 m!205823))

(check-sat (not mapNonEmpty!7095) (not b!177262) (not b!177257) b_and!10883 (not start!17730) (not b!177258) (not b_next!4383) (not b!177261) tp_is_empty!4155)
(check-sat b_and!10883 (not b_next!4383))
(get-model)

(declare-fun d!53733 () Bool)

(assert (=> d!53733 (= (array_inv!2269 (_keys!5518 thiss!1248)) (bvsge (size!3843 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177261 d!53733))

(declare-fun d!53735 () Bool)

(assert (=> d!53735 (= (array_inv!2270 (_values!3634 thiss!1248)) (bvsge (size!3844 (_values!3634 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177261 d!53735))

(declare-fun d!53737 () Bool)

(declare-fun e!116924 () Bool)

(assert (=> d!53737 e!116924))

(declare-fun res!84044 () Bool)

(assert (=> d!53737 (=> res!84044 e!116924)))

(declare-fun lt!87596 () Bool)

(assert (=> d!53737 (= res!84044 (not lt!87596))))

(declare-fun lt!87597 () Bool)

(assert (=> d!53737 (= lt!87596 lt!87597)))

(declare-datatypes ((Unit!5420 0))(
  ( (Unit!5421) )
))
(declare-fun lt!87595 () Unit!5420)

(declare-fun e!116923 () Unit!5420)

(assert (=> d!53737 (= lt!87595 e!116923)))

(declare-fun c!31735 () Bool)

(assert (=> d!53737 (= c!31735 lt!87597)))

(declare-fun containsKey!199 (List!2253 (_ BitVec 64)) Bool)

(assert (=> d!53737 (= lt!87597 (containsKey!199 (toList!1131 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248))) key!828))))

(assert (=> d!53737 (= (contains!1197 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)) key!828) lt!87596)))

(declare-fun b!177294 () Bool)

(declare-fun lt!87594 () Unit!5420)

(assert (=> b!177294 (= e!116923 lt!87594)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!147 (List!2253 (_ BitVec 64)) Unit!5420)

(assert (=> b!177294 (= lt!87594 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1131 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248))) key!828))))

(declare-datatypes ((Option!201 0))(
  ( (Some!200 (v!4004 V!5187)) (None!199) )
))
(declare-fun isDefined!148 (Option!201) Bool)

(declare-fun getValueByKey!195 (List!2253 (_ BitVec 64)) Option!201)

(assert (=> b!177294 (isDefined!148 (getValueByKey!195 (toList!1131 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248))) key!828))))

(declare-fun b!177295 () Bool)

(declare-fun Unit!5422 () Unit!5420)

(assert (=> b!177295 (= e!116923 Unit!5422)))

(declare-fun b!177296 () Bool)

(assert (=> b!177296 (= e!116924 (isDefined!148 (getValueByKey!195 (toList!1131 (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248))) key!828)))))

(assert (= (and d!53737 c!31735) b!177294))

(assert (= (and d!53737 (not c!31735)) b!177295))

(assert (= (and d!53737 (not res!84044)) b!177296))

(declare-fun m!205841 () Bool)

(assert (=> d!53737 m!205841))

(declare-fun m!205843 () Bool)

(assert (=> b!177294 m!205843))

(declare-fun m!205845 () Bool)

(assert (=> b!177294 m!205845))

(assert (=> b!177294 m!205845))

(declare-fun m!205847 () Bool)

(assert (=> b!177294 m!205847))

(assert (=> b!177296 m!205845))

(assert (=> b!177296 m!205845))

(assert (=> b!177296 m!205847))

(assert (=> b!177258 d!53737))

(declare-fun b!177339 () Bool)

(declare-fun e!116960 () Bool)

(declare-fun e!116962 () Bool)

(assert (=> b!177339 (= e!116960 e!116962)))

(declare-fun res!84067 () Bool)

(declare-fun call!17939 () Bool)

(assert (=> b!177339 (= res!84067 call!17939)))

(assert (=> b!177339 (=> (not res!84067) (not e!116962))))

(declare-fun b!177340 () Bool)

(declare-fun e!116954 () Unit!5420)

(declare-fun lt!87662 () Unit!5420)

(assert (=> b!177340 (= e!116954 lt!87662)))

(declare-fun lt!87644 () ListLongMap!2231)

(declare-fun getCurrentListMapNoExtraKeys!173 (array!7461 array!7463 (_ BitVec 32) (_ BitVec 32) V!5187 V!5187 (_ BitVec 32) Int) ListLongMap!2231)

(assert (=> b!177340 (= lt!87644 (getCurrentListMapNoExtraKeys!173 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)))))

(declare-fun lt!87646 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87653 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87653 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87642 () Unit!5420)

(declare-fun addStillContains!116 (ListLongMap!2231 (_ BitVec 64) V!5187 (_ BitVec 64)) Unit!5420)

(assert (=> b!177340 (= lt!87642 (addStillContains!116 lt!87644 lt!87646 (zeroValue!3492 thiss!1248) lt!87653))))

(declare-fun +!257 (ListLongMap!2231 tuple2!3304) ListLongMap!2231)

(assert (=> b!177340 (contains!1197 (+!257 lt!87644 (tuple2!3305 lt!87646 (zeroValue!3492 thiss!1248))) lt!87653)))

(declare-fun lt!87651 () Unit!5420)

(assert (=> b!177340 (= lt!87651 lt!87642)))

(declare-fun lt!87658 () ListLongMap!2231)

(assert (=> b!177340 (= lt!87658 (getCurrentListMapNoExtraKeys!173 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)))))

(declare-fun lt!87660 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87647 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87647 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87657 () Unit!5420)

(declare-fun addApplyDifferent!116 (ListLongMap!2231 (_ BitVec 64) V!5187 (_ BitVec 64)) Unit!5420)

(assert (=> b!177340 (= lt!87657 (addApplyDifferent!116 lt!87658 lt!87660 (minValue!3492 thiss!1248) lt!87647))))

(declare-fun apply!140 (ListLongMap!2231 (_ BitVec 64)) V!5187)

(assert (=> b!177340 (= (apply!140 (+!257 lt!87658 (tuple2!3305 lt!87660 (minValue!3492 thiss!1248))) lt!87647) (apply!140 lt!87658 lt!87647))))

(declare-fun lt!87650 () Unit!5420)

(assert (=> b!177340 (= lt!87650 lt!87657)))

(declare-fun lt!87648 () ListLongMap!2231)

(assert (=> b!177340 (= lt!87648 (getCurrentListMapNoExtraKeys!173 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)))))

(declare-fun lt!87652 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87655 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87655 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87654 () Unit!5420)

(assert (=> b!177340 (= lt!87654 (addApplyDifferent!116 lt!87648 lt!87652 (zeroValue!3492 thiss!1248) lt!87655))))

(assert (=> b!177340 (= (apply!140 (+!257 lt!87648 (tuple2!3305 lt!87652 (zeroValue!3492 thiss!1248))) lt!87655) (apply!140 lt!87648 lt!87655))))

(declare-fun lt!87659 () Unit!5420)

(assert (=> b!177340 (= lt!87659 lt!87654)))

(declare-fun lt!87661 () ListLongMap!2231)

(assert (=> b!177340 (= lt!87661 (getCurrentListMapNoExtraKeys!173 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)))))

(declare-fun lt!87663 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87663 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87643 () (_ BitVec 64))

(assert (=> b!177340 (= lt!87643 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177340 (= lt!87662 (addApplyDifferent!116 lt!87661 lt!87663 (minValue!3492 thiss!1248) lt!87643))))

(assert (=> b!177340 (= (apply!140 (+!257 lt!87661 (tuple2!3305 lt!87663 (minValue!3492 thiss!1248))) lt!87643) (apply!140 lt!87661 lt!87643))))

(declare-fun bm!17935 () Bool)

(declare-fun call!17942 () ListLongMap!2231)

(declare-fun call!17940 () ListLongMap!2231)

(assert (=> bm!17935 (= call!17942 call!17940)))

(declare-fun b!177341 () Bool)

(declare-fun e!116959 () ListLongMap!2231)

(assert (=> b!177341 (= e!116959 call!17942)))

(declare-fun b!177342 () Bool)

(declare-fun e!116955 () Bool)

(declare-fun lt!87656 () ListLongMap!2231)

(declare-fun get!2017 (ValueCell!1734 V!5187) V!5187)

(declare-fun dynLambda!483 (Int (_ BitVec 64)) V!5187)

(assert (=> b!177342 (= e!116955 (= (apply!140 lt!87656 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000)) (get!2017 (select (arr!3540 (_values!3634 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!483 (defaultEntry!3651 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3844 (_values!3634 thiss!1248))))))

(assert (=> b!177342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))))))

(declare-fun b!177343 () Bool)

(declare-fun res!84069 () Bool)

(declare-fun e!116951 () Bool)

(assert (=> b!177343 (=> (not res!84069) (not e!116951))))

(declare-fun e!116957 () Bool)

(assert (=> b!177343 (= res!84069 e!116957)))

(declare-fun res!84063 () Bool)

(assert (=> b!177343 (=> res!84063 e!116957)))

(declare-fun e!116956 () Bool)

(assert (=> b!177343 (= res!84063 (not e!116956))))

(declare-fun res!84064 () Bool)

(assert (=> b!177343 (=> (not res!84064) (not e!116956))))

(assert (=> b!177343 (= res!84064 (bvslt #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))))))

(declare-fun bm!17936 () Bool)

(declare-fun call!17938 () ListLongMap!2231)

(declare-fun call!17944 () ListLongMap!2231)

(assert (=> bm!17936 (= call!17938 call!17944)))

(declare-fun b!177344 () Bool)

(declare-fun e!116961 () ListLongMap!2231)

(assert (=> b!177344 (= e!116961 call!17942)))

(declare-fun b!177345 () Bool)

(declare-fun e!116963 () ListLongMap!2231)

(assert (=> b!177345 (= e!116963 e!116959)))

(declare-fun c!31749 () Bool)

(assert (=> b!177345 (= c!31749 (and (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177346 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177346 (= e!116956 (validKeyInArray!0 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177347 () Bool)

(declare-fun res!84070 () Bool)

(assert (=> b!177347 (=> (not res!84070) (not e!116951))))

(declare-fun e!116953 () Bool)

(assert (=> b!177347 (= res!84070 e!116953)))

(declare-fun c!31751 () Bool)

(assert (=> b!177347 (= c!31751 (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177348 () Bool)

(assert (=> b!177348 (= e!116960 (not call!17939))))

(declare-fun b!177349 () Bool)

(declare-fun c!31752 () Bool)

(assert (=> b!177349 (= c!31752 (and (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177349 (= e!116959 e!116961)))

(declare-fun b!177350 () Bool)

(declare-fun e!116952 () Bool)

(assert (=> b!177350 (= e!116952 (validKeyInArray!0 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177351 () Bool)

(declare-fun call!17941 () Bool)

(assert (=> b!177351 (= e!116953 (not call!17941))))

(declare-fun b!177352 () Bool)

(declare-fun e!116958 () Bool)

(assert (=> b!177352 (= e!116953 e!116958)))

(declare-fun res!84071 () Bool)

(assert (=> b!177352 (= res!84071 call!17941)))

(assert (=> b!177352 (=> (not res!84071) (not e!116958))))

(declare-fun b!177353 () Bool)

(assert (=> b!177353 (= e!116951 e!116960)))

(declare-fun c!31750 () Bool)

(assert (=> b!177353 (= c!31750 (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177354 () Bool)

(assert (=> b!177354 (= e!116963 (+!257 call!17940 (tuple2!3305 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3492 thiss!1248))))))

(declare-fun bm!17938 () Bool)

(assert (=> bm!17938 (= call!17939 (contains!1197 lt!87656 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17939 () Bool)

(declare-fun call!17943 () ListLongMap!2231)

(assert (=> bm!17939 (= call!17943 call!17938)))

(declare-fun b!177355 () Bool)

(assert (=> b!177355 (= e!116957 e!116955)))

(declare-fun res!84065 () Bool)

(assert (=> b!177355 (=> (not res!84065) (not e!116955))))

(assert (=> b!177355 (= res!84065 (contains!1197 lt!87656 (select (arr!3539 (_keys!5518 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))))))

(declare-fun b!177356 () Bool)

(assert (=> b!177356 (= e!116962 (= (apply!140 lt!87656 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3492 thiss!1248)))))

(declare-fun b!177357 () Bool)

(assert (=> b!177357 (= e!116958 (= (apply!140 lt!87656 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3492 thiss!1248)))))

(declare-fun b!177358 () Bool)

(declare-fun Unit!5423 () Unit!5420)

(assert (=> b!177358 (= e!116954 Unit!5423)))

(declare-fun c!31748 () Bool)

(declare-fun bm!17940 () Bool)

(assert (=> bm!17940 (= call!17940 (+!257 (ite c!31748 call!17944 (ite c!31749 call!17938 call!17943)) (ite (or c!31748 c!31749) (tuple2!3305 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3492 thiss!1248)) (tuple2!3305 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3492 thiss!1248)))))))

(declare-fun bm!17937 () Bool)

(assert (=> bm!17937 (= call!17941 (contains!1197 lt!87656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53739 () Bool)

(assert (=> d!53739 e!116951))

(declare-fun res!84068 () Bool)

(assert (=> d!53739 (=> (not res!84068) (not e!116951))))

(assert (=> d!53739 (= res!84068 (or (bvsge #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))))))))

(declare-fun lt!87649 () ListLongMap!2231)

(assert (=> d!53739 (= lt!87656 lt!87649)))

(declare-fun lt!87645 () Unit!5420)

(assert (=> d!53739 (= lt!87645 e!116954)))

(declare-fun c!31753 () Bool)

(assert (=> d!53739 (= c!31753 e!116952)))

(declare-fun res!84066 () Bool)

(assert (=> d!53739 (=> (not res!84066) (not e!116952))))

(assert (=> d!53739 (= res!84066 (bvslt #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))))))

(assert (=> d!53739 (= lt!87649 e!116963)))

(assert (=> d!53739 (= c!31748 (and (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3388 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53739 (validMask!0 (mask!8587 thiss!1248))))

(assert (=> d!53739 (= (getCurrentListMap!783 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)) lt!87656)))

(declare-fun bm!17941 () Bool)

(assert (=> bm!17941 (= call!17944 (getCurrentListMapNoExtraKeys!173 (_keys!5518 thiss!1248) (_values!3634 thiss!1248) (mask!8587 thiss!1248) (extraKeys!3388 thiss!1248) (zeroValue!3492 thiss!1248) (minValue!3492 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3651 thiss!1248)))))

(declare-fun b!177359 () Bool)

(assert (=> b!177359 (= e!116961 call!17943)))

(assert (= (and d!53739 c!31748) b!177354))

(assert (= (and d!53739 (not c!31748)) b!177345))

(assert (= (and b!177345 c!31749) b!177341))

(assert (= (and b!177345 (not c!31749)) b!177349))

(assert (= (and b!177349 c!31752) b!177344))

(assert (= (and b!177349 (not c!31752)) b!177359))

(assert (= (or b!177344 b!177359) bm!17939))

(assert (= (or b!177341 bm!17939) bm!17936))

(assert (= (or b!177341 b!177344) bm!17935))

(assert (= (or b!177354 bm!17936) bm!17941))

(assert (= (or b!177354 bm!17935) bm!17940))

(assert (= (and d!53739 res!84066) b!177350))

(assert (= (and d!53739 c!31753) b!177340))

(assert (= (and d!53739 (not c!31753)) b!177358))

(assert (= (and d!53739 res!84068) b!177343))

(assert (= (and b!177343 res!84064) b!177346))

(assert (= (and b!177343 (not res!84063)) b!177355))

(assert (= (and b!177355 res!84065) b!177342))

(assert (= (and b!177343 res!84069) b!177347))

(assert (= (and b!177347 c!31751) b!177352))

(assert (= (and b!177347 (not c!31751)) b!177351))

(assert (= (and b!177352 res!84071) b!177357))

(assert (= (or b!177352 b!177351) bm!17937))

(assert (= (and b!177347 res!84070) b!177353))

(assert (= (and b!177353 c!31750) b!177339))

(assert (= (and b!177353 (not c!31750)) b!177348))

(assert (= (and b!177339 res!84067) b!177356))

(assert (= (or b!177339 b!177348) bm!17938))

(declare-fun b_lambda!7051 () Bool)

(assert (=> (not b_lambda!7051) (not b!177342)))

(declare-fun t!7085 () Bool)

(declare-fun tb!2791 () Bool)

(assert (=> (and b!177261 (= (defaultEntry!3651 thiss!1248) (defaultEntry!3651 thiss!1248)) t!7085) tb!2791))

(declare-fun result!4647 () Bool)

(assert (=> tb!2791 (= result!4647 tp_is_empty!4155)))

(assert (=> b!177342 t!7085))

(declare-fun b_and!10887 () Bool)

(assert (= b_and!10883 (and (=> t!7085 result!4647) b_and!10887)))

(declare-fun m!205849 () Bool)

(assert (=> bm!17937 m!205849))

(declare-fun m!205851 () Bool)

(assert (=> b!177342 m!205851))

(declare-fun m!205853 () Bool)

(assert (=> b!177342 m!205853))

(assert (=> b!177342 m!205851))

(declare-fun m!205855 () Bool)

(assert (=> b!177342 m!205855))

(declare-fun m!205857 () Bool)

(assert (=> b!177342 m!205857))

(declare-fun m!205859 () Bool)

(assert (=> b!177342 m!205859))

(assert (=> b!177342 m!205853))

(assert (=> b!177342 m!205857))

(declare-fun m!205861 () Bool)

(assert (=> bm!17940 m!205861))

(declare-fun m!205863 () Bool)

(assert (=> bm!17941 m!205863))

(assert (=> d!53739 m!205815))

(assert (=> b!177350 m!205857))

(assert (=> b!177350 m!205857))

(declare-fun m!205865 () Bool)

(assert (=> b!177350 m!205865))

(declare-fun m!205867 () Bool)

(assert (=> b!177357 m!205867))

(assert (=> b!177355 m!205857))

(assert (=> b!177355 m!205857))

(declare-fun m!205869 () Bool)

(assert (=> b!177355 m!205869))

(declare-fun m!205871 () Bool)

(assert (=> bm!17938 m!205871))

(declare-fun m!205873 () Bool)

(assert (=> b!177340 m!205873))

(declare-fun m!205875 () Bool)

(assert (=> b!177340 m!205875))

(declare-fun m!205877 () Bool)

(assert (=> b!177340 m!205877))

(declare-fun m!205879 () Bool)

(assert (=> b!177340 m!205879))

(declare-fun m!205881 () Bool)

(assert (=> b!177340 m!205881))

(declare-fun m!205883 () Bool)

(assert (=> b!177340 m!205883))

(declare-fun m!205885 () Bool)

(assert (=> b!177340 m!205885))

(assert (=> b!177340 m!205879))

(declare-fun m!205887 () Bool)

(assert (=> b!177340 m!205887))

(assert (=> b!177340 m!205863))

(assert (=> b!177340 m!205877))

(declare-fun m!205889 () Bool)

(assert (=> b!177340 m!205889))

(declare-fun m!205891 () Bool)

(assert (=> b!177340 m!205891))

(assert (=> b!177340 m!205873))

(declare-fun m!205893 () Bool)

(assert (=> b!177340 m!205893))

(declare-fun m!205895 () Bool)

(assert (=> b!177340 m!205895))

(declare-fun m!205897 () Bool)

(assert (=> b!177340 m!205897))

(declare-fun m!205899 () Bool)

(assert (=> b!177340 m!205899))

(assert (=> b!177340 m!205895))

(declare-fun m!205901 () Bool)

(assert (=> b!177340 m!205901))

(assert (=> b!177340 m!205857))

(assert (=> b!177346 m!205857))

(assert (=> b!177346 m!205857))

(assert (=> b!177346 m!205865))

(declare-fun m!205903 () Bool)

(assert (=> b!177354 m!205903))

(declare-fun m!205905 () Bool)

(assert (=> b!177356 m!205905))

(assert (=> b!177258 d!53739))

(declare-fun b!177374 () Bool)

(declare-fun c!31760 () Bool)

(declare-fun lt!87671 () (_ BitVec 64))

(assert (=> b!177374 (= c!31760 (= lt!87671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116970 () SeekEntryResult!566)

(declare-fun e!116971 () SeekEntryResult!566)

(assert (=> b!177374 (= e!116970 e!116971)))

(declare-fun b!177375 () Bool)

(declare-fun e!116972 () SeekEntryResult!566)

(assert (=> b!177375 (= e!116972 e!116970)))

(declare-fun lt!87670 () SeekEntryResult!566)

(assert (=> b!177375 (= lt!87671 (select (arr!3539 (_keys!5518 thiss!1248)) (index!4434 lt!87670)))))

(declare-fun c!31761 () Bool)

(assert (=> b!177375 (= c!31761 (= lt!87671 key!828))))

(declare-fun b!177376 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7461 (_ BitVec 32)) SeekEntryResult!566)

(assert (=> b!177376 (= e!116971 (seekKeyOrZeroReturnVacant!0 (x!19446 lt!87670) (index!4434 lt!87670) (index!4434 lt!87670) key!828 (_keys!5518 thiss!1248) (mask!8587 thiss!1248)))))

(declare-fun d!53741 () Bool)

(declare-fun lt!87672 () SeekEntryResult!566)

(assert (=> d!53741 (and (or ((_ is Undefined!566) lt!87672) (not ((_ is Found!566) lt!87672)) (and (bvsge (index!4433 lt!87672) #b00000000000000000000000000000000) (bvslt (index!4433 lt!87672) (size!3843 (_keys!5518 thiss!1248))))) (or ((_ is Undefined!566) lt!87672) ((_ is Found!566) lt!87672) (not ((_ is MissingZero!566) lt!87672)) (and (bvsge (index!4432 lt!87672) #b00000000000000000000000000000000) (bvslt (index!4432 lt!87672) (size!3843 (_keys!5518 thiss!1248))))) (or ((_ is Undefined!566) lt!87672) ((_ is Found!566) lt!87672) ((_ is MissingZero!566) lt!87672) (not ((_ is MissingVacant!566) lt!87672)) (and (bvsge (index!4435 lt!87672) #b00000000000000000000000000000000) (bvslt (index!4435 lt!87672) (size!3843 (_keys!5518 thiss!1248))))) (or ((_ is Undefined!566) lt!87672) (ite ((_ is Found!566) lt!87672) (= (select (arr!3539 (_keys!5518 thiss!1248)) (index!4433 lt!87672)) key!828) (ite ((_ is MissingZero!566) lt!87672) (= (select (arr!3539 (_keys!5518 thiss!1248)) (index!4432 lt!87672)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!566) lt!87672) (= (select (arr!3539 (_keys!5518 thiss!1248)) (index!4435 lt!87672)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53741 (= lt!87672 e!116972)))

(declare-fun c!31762 () Bool)

(assert (=> d!53741 (= c!31762 (and ((_ is Intermediate!566) lt!87670) (undefined!1378 lt!87670)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7461 (_ BitVec 32)) SeekEntryResult!566)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53741 (= lt!87670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8587 thiss!1248)) key!828 (_keys!5518 thiss!1248) (mask!8587 thiss!1248)))))

(assert (=> d!53741 (validMask!0 (mask!8587 thiss!1248))))

(assert (=> d!53741 (= (seekEntryOrOpen!0 key!828 (_keys!5518 thiss!1248) (mask!8587 thiss!1248)) lt!87672)))

(declare-fun b!177377 () Bool)

(assert (=> b!177377 (= e!116972 Undefined!566)))

(declare-fun b!177378 () Bool)

(assert (=> b!177378 (= e!116970 (Found!566 (index!4434 lt!87670)))))

(declare-fun b!177379 () Bool)

(assert (=> b!177379 (= e!116971 (MissingZero!566 (index!4434 lt!87670)))))

(assert (= (and d!53741 c!31762) b!177377))

(assert (= (and d!53741 (not c!31762)) b!177375))

(assert (= (and b!177375 c!31761) b!177378))

(assert (= (and b!177375 (not c!31761)) b!177374))

(assert (= (and b!177374 c!31760) b!177379))

(assert (= (and b!177374 (not c!31760)) b!177376))

(declare-fun m!205907 () Bool)

(assert (=> b!177375 m!205907))

(declare-fun m!205909 () Bool)

(assert (=> b!177376 m!205909))

(declare-fun m!205911 () Bool)

(assert (=> d!53741 m!205911))

(declare-fun m!205913 () Bool)

(assert (=> d!53741 m!205913))

(declare-fun m!205915 () Bool)

(assert (=> d!53741 m!205915))

(declare-fun m!205917 () Bool)

(assert (=> d!53741 m!205917))

(assert (=> d!53741 m!205915))

(declare-fun m!205919 () Bool)

(assert (=> d!53741 m!205919))

(assert (=> d!53741 m!205815))

(assert (=> b!177262 d!53741))

(declare-fun d!53743 () Bool)

(assert (=> d!53743 (= (validMask!0 (mask!8587 thiss!1248)) (and (or (= (mask!8587 thiss!1248) #b00000000000000000000000000000111) (= (mask!8587 thiss!1248) #b00000000000000000000000000001111) (= (mask!8587 thiss!1248) #b00000000000000000000000000011111) (= (mask!8587 thiss!1248) #b00000000000000000000000000111111) (= (mask!8587 thiss!1248) #b00000000000000000000000001111111) (= (mask!8587 thiss!1248) #b00000000000000000000000011111111) (= (mask!8587 thiss!1248) #b00000000000000000000000111111111) (= (mask!8587 thiss!1248) #b00000000000000000000001111111111) (= (mask!8587 thiss!1248) #b00000000000000000000011111111111) (= (mask!8587 thiss!1248) #b00000000000000000000111111111111) (= (mask!8587 thiss!1248) #b00000000000000000001111111111111) (= (mask!8587 thiss!1248) #b00000000000000000011111111111111) (= (mask!8587 thiss!1248) #b00000000000000000111111111111111) (= (mask!8587 thiss!1248) #b00000000000000001111111111111111) (= (mask!8587 thiss!1248) #b00000000000000011111111111111111) (= (mask!8587 thiss!1248) #b00000000000000111111111111111111) (= (mask!8587 thiss!1248) #b00000000000001111111111111111111) (= (mask!8587 thiss!1248) #b00000000000011111111111111111111) (= (mask!8587 thiss!1248) #b00000000000111111111111111111111) (= (mask!8587 thiss!1248) #b00000000001111111111111111111111) (= (mask!8587 thiss!1248) #b00000000011111111111111111111111) (= (mask!8587 thiss!1248) #b00000000111111111111111111111111) (= (mask!8587 thiss!1248) #b00000001111111111111111111111111) (= (mask!8587 thiss!1248) #b00000011111111111111111111111111) (= (mask!8587 thiss!1248) #b00000111111111111111111111111111) (= (mask!8587 thiss!1248) #b00001111111111111111111111111111) (= (mask!8587 thiss!1248) #b00011111111111111111111111111111) (= (mask!8587 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8587 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177257 d!53743))

(declare-fun d!53745 () Bool)

(declare-fun res!84078 () Bool)

(declare-fun e!116975 () Bool)

(assert (=> d!53745 (=> (not res!84078) (not e!116975))))

(declare-fun simpleValid!154 (LongMapFixedSize!2376) Bool)

(assert (=> d!53745 (= res!84078 (simpleValid!154 thiss!1248))))

(assert (=> d!53745 (= (valid!996 thiss!1248) e!116975)))

(declare-fun b!177386 () Bool)

(declare-fun res!84079 () Bool)

(assert (=> b!177386 (=> (not res!84079) (not e!116975))))

(declare-fun arrayCountValidKeys!0 (array!7461 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177386 (= res!84079 (= (arrayCountValidKeys!0 (_keys!5518 thiss!1248) #b00000000000000000000000000000000 (size!3843 (_keys!5518 thiss!1248))) (_size!1237 thiss!1248)))))

(declare-fun b!177387 () Bool)

(declare-fun res!84080 () Bool)

(assert (=> b!177387 (=> (not res!84080) (not e!116975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7461 (_ BitVec 32)) Bool)

(assert (=> b!177387 (= res!84080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5518 thiss!1248) (mask!8587 thiss!1248)))))

(declare-fun b!177388 () Bool)

(declare-datatypes ((List!2254 0))(
  ( (Nil!2251) (Cons!2250 (h!2871 (_ BitVec 64)) (t!7086 List!2254)) )
))
(declare-fun arrayNoDuplicates!0 (array!7461 (_ BitVec 32) List!2254) Bool)

(assert (=> b!177388 (= e!116975 (arrayNoDuplicates!0 (_keys!5518 thiss!1248) #b00000000000000000000000000000000 Nil!2251))))

(assert (= (and d!53745 res!84078) b!177386))

(assert (= (and b!177386 res!84079) b!177387))

(assert (= (and b!177387 res!84080) b!177388))

(declare-fun m!205921 () Bool)

(assert (=> d!53745 m!205921))

(declare-fun m!205923 () Bool)

(assert (=> b!177386 m!205923))

(declare-fun m!205925 () Bool)

(assert (=> b!177387 m!205925))

(declare-fun m!205927 () Bool)

(assert (=> b!177388 m!205927))

(assert (=> start!17730 d!53745))

(declare-fun b!177396 () Bool)

(declare-fun e!116981 () Bool)

(assert (=> b!177396 (= e!116981 tp_is_empty!4155)))

(declare-fun mapNonEmpty!7101 () Bool)

(declare-fun mapRes!7101 () Bool)

(declare-fun tp!15858 () Bool)

(declare-fun e!116980 () Bool)

(assert (=> mapNonEmpty!7101 (= mapRes!7101 (and tp!15858 e!116980))))

(declare-fun mapKey!7101 () (_ BitVec 32))

(declare-fun mapValue!7101 () ValueCell!1734)

(declare-fun mapRest!7101 () (Array (_ BitVec 32) ValueCell!1734))

(assert (=> mapNonEmpty!7101 (= mapRest!7095 (store mapRest!7101 mapKey!7101 mapValue!7101))))

(declare-fun b!177395 () Bool)

(assert (=> b!177395 (= e!116980 tp_is_empty!4155)))

(declare-fun mapIsEmpty!7101 () Bool)

(assert (=> mapIsEmpty!7101 mapRes!7101))

(declare-fun condMapEmpty!7101 () Bool)

(declare-fun mapDefault!7101 () ValueCell!1734)

(assert (=> mapNonEmpty!7095 (= condMapEmpty!7101 (= mapRest!7095 ((as const (Array (_ BitVec 32) ValueCell!1734)) mapDefault!7101)))))

(assert (=> mapNonEmpty!7095 (= tp!15848 (and e!116981 mapRes!7101))))

(assert (= (and mapNonEmpty!7095 condMapEmpty!7101) mapIsEmpty!7101))

(assert (= (and mapNonEmpty!7095 (not condMapEmpty!7101)) mapNonEmpty!7101))

(assert (= (and mapNonEmpty!7101 ((_ is ValueCellFull!1734) mapValue!7101)) b!177395))

(assert (= (and mapNonEmpty!7095 ((_ is ValueCellFull!1734) mapDefault!7101)) b!177396))

(declare-fun m!205929 () Bool)

(assert (=> mapNonEmpty!7101 m!205929))

(declare-fun b_lambda!7053 () Bool)

(assert (= b_lambda!7051 (or (and b!177261 b_free!4383) b_lambda!7053)))

(check-sat (not b!177340) tp_is_empty!4155 (not b!177294) (not bm!17941) (not b!177354) (not b!177342) (not d!53737) (not b!177376) (not d!53739) (not b!177355) (not b!177356) (not b!177357) (not bm!17940) (not b_next!4383) (not mapNonEmpty!7101) (not b!177296) (not bm!17938) (not bm!17937) (not d!53741) (not b!177346) (not b!177388) (not b_lambda!7053) (not b!177350) (not d!53745) (not b!177386) b_and!10887 (not b!177387))
(check-sat b_and!10887 (not b_next!4383))
