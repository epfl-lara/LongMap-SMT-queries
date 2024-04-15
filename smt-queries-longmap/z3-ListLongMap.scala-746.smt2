; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17384 () Bool)

(assert start!17384)

(declare-fun b!174309 () Bool)

(declare-fun b_free!4315 () Bool)

(declare-fun b_next!4315 () Bool)

(assert (=> b!174309 (= b_free!4315 (not b_next!4315))))

(declare-fun tp!15614 () Bool)

(declare-fun b_and!10755 () Bool)

(assert (=> b!174309 (= tp!15614 b_and!10755)))

(declare-fun res!82653 () Bool)

(declare-fun e!115100 () Bool)

(assert (=> start!17384 (=> (not res!82653) (not e!115100))))

(declare-datatypes ((V!5097 0))(
  ( (V!5098 (val!2088 Int)) )
))
(declare-datatypes ((ValueCell!1700 0))(
  ( (ValueCellFull!1700 (v!3953 V!5097)) (EmptyCell!1700) )
))
(declare-datatypes ((array!7287 0))(
  ( (array!7288 (arr!3460 (Array (_ BitVec 32) (_ BitVec 64))) (size!3761 (_ BitVec 32))) )
))
(declare-datatypes ((array!7289 0))(
  ( (array!7290 (arr!3461 (Array (_ BitVec 32) ValueCell!1700)) (size!3762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2308 0))(
  ( (LongMapFixedSize!2309 (defaultEntry!3604 Int) (mask!8480 (_ BitVec 32)) (extraKeys!3341 (_ BitVec 32)) (zeroValue!3445 V!5097) (minValue!3445 V!5097) (_size!1203 (_ BitVec 32)) (_keys!5446 array!7287) (_values!3587 array!7289) (_vacant!1203 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2308)

(declare-fun valid!992 (LongMapFixedSize!2308) Bool)

(assert (=> start!17384 (= res!82653 (valid!992 thiss!1248))))

(assert (=> start!17384 e!115100))

(declare-fun e!115105 () Bool)

(assert (=> start!17384 e!115105))

(assert (=> start!17384 true))

(declare-fun e!115103 () Bool)

(declare-fun tp_is_empty!4087 () Bool)

(declare-fun array_inv!2233 (array!7287) Bool)

(declare-fun array_inv!2234 (array!7289) Bool)

(assert (=> b!174309 (= e!115105 (and tp!15614 tp_is_empty!4087 (array_inv!2233 (_keys!5446 thiss!1248)) (array_inv!2234 (_values!3587 thiss!1248)) e!115103))))

(declare-fun b!174310 () Bool)

(declare-fun e!115102 () Bool)

(assert (=> b!174310 (= e!115102 tp_is_empty!4087)))

(declare-fun mapNonEmpty!6962 () Bool)

(declare-fun mapRes!6962 () Bool)

(declare-fun tp!15613 () Bool)

(assert (=> mapNonEmpty!6962 (= mapRes!6962 (and tp!15613 e!115102))))

(declare-fun mapValue!6962 () ValueCell!1700)

(declare-fun mapKey!6962 () (_ BitVec 32))

(declare-fun mapRest!6962 () (Array (_ BitVec 32) ValueCell!1700))

(assert (=> mapNonEmpty!6962 (= (arr!3461 (_values!3587 thiss!1248)) (store mapRest!6962 mapKey!6962 mapValue!6962))))

(declare-fun b!174311 () Bool)

(declare-fun e!115104 () Bool)

(assert (=> b!174311 (= e!115103 (and e!115104 mapRes!6962))))

(declare-fun condMapEmpty!6962 () Bool)

(declare-fun mapDefault!6962 () ValueCell!1700)

(assert (=> b!174311 (= condMapEmpty!6962 (= (arr!3461 (_values!3587 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1700)) mapDefault!6962)))))

(declare-fun mapIsEmpty!6962 () Bool)

(assert (=> mapIsEmpty!6962 mapRes!6962))

(declare-fun b!174312 () Bool)

(declare-fun res!82654 () Bool)

(assert (=> b!174312 (=> (not res!82654) (not e!115100))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3242 0))(
  ( (tuple2!3243 (_1!1632 (_ BitVec 64)) (_2!1632 V!5097)) )
))
(declare-datatypes ((List!2218 0))(
  ( (Nil!2215) (Cons!2214 (h!2831 tuple2!3242) (t!7021 List!2218)) )
))
(declare-datatypes ((ListLongMap!2161 0))(
  ( (ListLongMap!2162 (toList!1096 List!2218)) )
))
(declare-fun contains!1157 (ListLongMap!2161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!732 (array!7287 array!7289 (_ BitVec 32) (_ BitVec 32) V!5097 V!5097 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> b!174312 (= res!82654 (contains!1157 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) key!828))))

(declare-fun b!174313 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174313 (= e!115100 (not (validMask!0 (mask!8480 thiss!1248))))))

(declare-fun b!174314 () Bool)

(declare-fun res!82652 () Bool)

(assert (=> b!174314 (=> (not res!82652) (not e!115100))))

(assert (=> b!174314 (= res!82652 (not (= key!828 (bvneg key!828))))))

(declare-fun b!174315 () Bool)

(assert (=> b!174315 (= e!115104 tp_is_empty!4087)))

(declare-fun b!174316 () Bool)

(declare-fun res!82651 () Bool)

(assert (=> b!174316 (=> (not res!82651) (not e!115100))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!554 0))(
  ( (MissingZero!554 (index!4384 (_ BitVec 32))) (Found!554 (index!4385 (_ BitVec 32))) (Intermediate!554 (undefined!1366 Bool) (index!4386 (_ BitVec 32)) (x!19223 (_ BitVec 32))) (Undefined!554) (MissingVacant!554 (index!4387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7287 (_ BitVec 32)) SeekEntryResult!554)

(assert (=> b!174316 (= res!82651 ((_ is Undefined!554) (seekEntryOrOpen!0 key!828 (_keys!5446 thiss!1248) (mask!8480 thiss!1248))))))

(assert (= (and start!17384 res!82653) b!174314))

(assert (= (and b!174314 res!82652) b!174316))

(assert (= (and b!174316 res!82651) b!174312))

(assert (= (and b!174312 res!82654) b!174313))

(assert (= (and b!174311 condMapEmpty!6962) mapIsEmpty!6962))

(assert (= (and b!174311 (not condMapEmpty!6962)) mapNonEmpty!6962))

(assert (= (and mapNonEmpty!6962 ((_ is ValueCellFull!1700) mapValue!6962)) b!174310))

(assert (= (and b!174311 ((_ is ValueCellFull!1700) mapDefault!6962)) b!174315))

(assert (= b!174309 b!174311))

(assert (= start!17384 b!174309))

(declare-fun m!202893 () Bool)

(assert (=> b!174313 m!202893))

(declare-fun m!202895 () Bool)

(assert (=> start!17384 m!202895))

(declare-fun m!202897 () Bool)

(assert (=> b!174309 m!202897))

(declare-fun m!202899 () Bool)

(assert (=> b!174309 m!202899))

(declare-fun m!202901 () Bool)

(assert (=> b!174316 m!202901))

(declare-fun m!202903 () Bool)

(assert (=> b!174312 m!202903))

(assert (=> b!174312 m!202903))

(declare-fun m!202905 () Bool)

(assert (=> b!174312 m!202905))

(declare-fun m!202907 () Bool)

(assert (=> mapNonEmpty!6962 m!202907))

(check-sat (not b!174309) b_and!10755 (not b!174313) (not start!17384) (not b!174316) (not b_next!4315) (not mapNonEmpty!6962) tp_is_empty!4087 (not b!174312))
(check-sat b_and!10755 (not b_next!4315))
(get-model)

(declare-fun d!53129 () Bool)

(declare-fun res!82685 () Bool)

(declare-fun e!115144 () Bool)

(assert (=> d!53129 (=> (not res!82685) (not e!115144))))

(declare-fun simpleValid!145 (LongMapFixedSize!2308) Bool)

(assert (=> d!53129 (= res!82685 (simpleValid!145 thiss!1248))))

(assert (=> d!53129 (= (valid!992 thiss!1248) e!115144)))

(declare-fun b!174371 () Bool)

(declare-fun res!82686 () Bool)

(assert (=> b!174371 (=> (not res!82686) (not e!115144))))

(declare-fun arrayCountValidKeys!0 (array!7287 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174371 (= res!82686 (= (arrayCountValidKeys!0 (_keys!5446 thiss!1248) #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))) (_size!1203 thiss!1248)))))

(declare-fun b!174372 () Bool)

(declare-fun res!82687 () Bool)

(assert (=> b!174372 (=> (not res!82687) (not e!115144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7287 (_ BitVec 32)) Bool)

(assert (=> b!174372 (= res!82687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5446 thiss!1248) (mask!8480 thiss!1248)))))

(declare-fun b!174373 () Bool)

(declare-datatypes ((List!2221 0))(
  ( (Nil!2218) (Cons!2217 (h!2834 (_ BitVec 64)) (t!7026 List!2221)) )
))
(declare-fun arrayNoDuplicates!0 (array!7287 (_ BitVec 32) List!2221) Bool)

(assert (=> b!174373 (= e!115144 (arrayNoDuplicates!0 (_keys!5446 thiss!1248) #b00000000000000000000000000000000 Nil!2218))))

(assert (= (and d!53129 res!82685) b!174371))

(assert (= (and b!174371 res!82686) b!174372))

(assert (= (and b!174372 res!82687) b!174373))

(declare-fun m!202941 () Bool)

(assert (=> d!53129 m!202941))

(declare-fun m!202943 () Bool)

(assert (=> b!174371 m!202943))

(declare-fun m!202945 () Bool)

(assert (=> b!174372 m!202945))

(declare-fun m!202947 () Bool)

(assert (=> b!174373 m!202947))

(assert (=> start!17384 d!53129))

(declare-fun d!53131 () Bool)

(declare-fun e!115149 () Bool)

(assert (=> d!53131 e!115149))

(declare-fun res!82690 () Bool)

(assert (=> d!53131 (=> res!82690 e!115149)))

(declare-fun lt!86145 () Bool)

(assert (=> d!53131 (= res!82690 (not lt!86145))))

(declare-fun lt!86146 () Bool)

(assert (=> d!53131 (= lt!86145 lt!86146)))

(declare-datatypes ((Unit!5339 0))(
  ( (Unit!5340) )
))
(declare-fun lt!86147 () Unit!5339)

(declare-fun e!115150 () Unit!5339)

(assert (=> d!53131 (= lt!86147 e!115150)))

(declare-fun c!31204 () Bool)

(assert (=> d!53131 (= c!31204 lt!86146)))

(declare-fun containsKey!188 (List!2218 (_ BitVec 64)) Bool)

(assert (=> d!53131 (= lt!86146 (containsKey!188 (toList!1096 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(assert (=> d!53131 (= (contains!1157 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) key!828) lt!86145)))

(declare-fun b!174380 () Bool)

(declare-fun lt!86148 () Unit!5339)

(assert (=> b!174380 (= e!115150 lt!86148)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!137 (List!2218 (_ BitVec 64)) Unit!5339)

(assert (=> b!174380 (= lt!86148 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1096 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(declare-datatypes ((Option!190 0))(
  ( (Some!189 (v!3956 V!5097)) (None!188) )
))
(declare-fun isDefined!138 (Option!190) Bool)

(declare-fun getValueByKey!184 (List!2218 (_ BitVec 64)) Option!190)

(assert (=> b!174380 (isDefined!138 (getValueByKey!184 (toList!1096 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828))))

(declare-fun b!174381 () Bool)

(declare-fun Unit!5341 () Unit!5339)

(assert (=> b!174381 (= e!115150 Unit!5341)))

(declare-fun b!174382 () Bool)

(assert (=> b!174382 (= e!115149 (isDefined!138 (getValueByKey!184 (toList!1096 (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248))) key!828)))))

(assert (= (and d!53131 c!31204) b!174380))

(assert (= (and d!53131 (not c!31204)) b!174381))

(assert (= (and d!53131 (not res!82690)) b!174382))

(declare-fun m!202949 () Bool)

(assert (=> d!53131 m!202949))

(declare-fun m!202951 () Bool)

(assert (=> b!174380 m!202951))

(declare-fun m!202953 () Bool)

(assert (=> b!174380 m!202953))

(assert (=> b!174380 m!202953))

(declare-fun m!202955 () Bool)

(assert (=> b!174380 m!202955))

(assert (=> b!174382 m!202953))

(assert (=> b!174382 m!202953))

(assert (=> b!174382 m!202955))

(assert (=> b!174312 d!53131))

(declare-fun b!174425 () Bool)

(declare-fun e!115188 () ListLongMap!2161)

(declare-fun call!17666 () ListLongMap!2161)

(assert (=> b!174425 (= e!115188 call!17666)))

(declare-fun bm!17659 () Bool)

(declare-fun call!17663 () ListLongMap!2161)

(assert (=> bm!17659 (= call!17666 call!17663)))

(declare-fun b!174426 () Bool)

(declare-fun e!115186 () ListLongMap!2161)

(declare-fun call!17662 () ListLongMap!2161)

(declare-fun +!243 (ListLongMap!2161 tuple2!3242) ListLongMap!2161)

(assert (=> b!174426 (= e!115186 (+!243 call!17662 (tuple2!3243 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3445 thiss!1248))))))

(declare-fun b!174427 () Bool)

(declare-fun e!115183 () Unit!5339)

(declare-fun lt!86212 () Unit!5339)

(assert (=> b!174427 (= e!115183 lt!86212)))

(declare-fun lt!86205 () ListLongMap!2161)

(declare-fun getCurrentListMapNoExtraKeys!152 (array!7287 array!7289 (_ BitVec 32) (_ BitVec 32) V!5097 V!5097 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> b!174427 (= lt!86205 (getCurrentListMapNoExtraKeys!152 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86204 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86197 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86197 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86210 () Unit!5339)

(declare-fun addStillContains!107 (ListLongMap!2161 (_ BitVec 64) V!5097 (_ BitVec 64)) Unit!5339)

(assert (=> b!174427 (= lt!86210 (addStillContains!107 lt!86205 lt!86204 (zeroValue!3445 thiss!1248) lt!86197))))

(assert (=> b!174427 (contains!1157 (+!243 lt!86205 (tuple2!3243 lt!86204 (zeroValue!3445 thiss!1248))) lt!86197)))

(declare-fun lt!86213 () Unit!5339)

(assert (=> b!174427 (= lt!86213 lt!86210)))

(declare-fun lt!86211 () ListLongMap!2161)

(assert (=> b!174427 (= lt!86211 (getCurrentListMapNoExtraKeys!152 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86194 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86195 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86195 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86202 () Unit!5339)

(declare-fun addApplyDifferent!107 (ListLongMap!2161 (_ BitVec 64) V!5097 (_ BitVec 64)) Unit!5339)

(assert (=> b!174427 (= lt!86202 (addApplyDifferent!107 lt!86211 lt!86194 (minValue!3445 thiss!1248) lt!86195))))

(declare-fun apply!131 (ListLongMap!2161 (_ BitVec 64)) V!5097)

(assert (=> b!174427 (= (apply!131 (+!243 lt!86211 (tuple2!3243 lt!86194 (minValue!3445 thiss!1248))) lt!86195) (apply!131 lt!86211 lt!86195))))

(declare-fun lt!86199 () Unit!5339)

(assert (=> b!174427 (= lt!86199 lt!86202)))

(declare-fun lt!86206 () ListLongMap!2161)

(assert (=> b!174427 (= lt!86206 (getCurrentListMapNoExtraKeys!152 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86214 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86193 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86193 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86203 () Unit!5339)

(assert (=> b!174427 (= lt!86203 (addApplyDifferent!107 lt!86206 lt!86214 (zeroValue!3445 thiss!1248) lt!86193))))

(assert (=> b!174427 (= (apply!131 (+!243 lt!86206 (tuple2!3243 lt!86214 (zeroValue!3445 thiss!1248))) lt!86193) (apply!131 lt!86206 lt!86193))))

(declare-fun lt!86207 () Unit!5339)

(assert (=> b!174427 (= lt!86207 lt!86203)))

(declare-fun lt!86198 () ListLongMap!2161)

(assert (=> b!174427 (= lt!86198 (getCurrentListMapNoExtraKeys!152 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun lt!86201 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86196 () (_ BitVec 64))

(assert (=> b!174427 (= lt!86196 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174427 (= lt!86212 (addApplyDifferent!107 lt!86198 lt!86201 (minValue!3445 thiss!1248) lt!86196))))

(assert (=> b!174427 (= (apply!131 (+!243 lt!86198 (tuple2!3243 lt!86201 (minValue!3445 thiss!1248))) lt!86196) (apply!131 lt!86198 lt!86196))))

(declare-fun b!174428 () Bool)

(declare-fun Unit!5342 () Unit!5339)

(assert (=> b!174428 (= e!115183 Unit!5342)))

(declare-fun bm!17660 () Bool)

(declare-fun call!17667 () ListLongMap!2161)

(assert (=> bm!17660 (= call!17667 (getCurrentListMapNoExtraKeys!152 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)))))

(declare-fun b!174429 () Bool)

(declare-fun e!115187 () Bool)

(declare-fun e!115189 () Bool)

(assert (=> b!174429 (= e!115187 e!115189)))

(declare-fun res!82713 () Bool)

(declare-fun call!17668 () Bool)

(assert (=> b!174429 (= res!82713 call!17668)))

(assert (=> b!174429 (=> (not res!82713) (not e!115189))))

(declare-fun b!174430 () Bool)

(declare-fun e!115178 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174430 (= e!115178 (validKeyInArray!0 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174431 () Bool)

(declare-fun e!115182 () ListLongMap!2161)

(declare-fun call!17664 () ListLongMap!2161)

(assert (=> b!174431 (= e!115182 call!17664)))

(declare-fun b!174432 () Bool)

(declare-fun e!115179 () Bool)

(declare-fun e!115180 () Bool)

(assert (=> b!174432 (= e!115179 e!115180)))

(declare-fun c!31222 () Bool)

(assert (=> b!174432 (= c!31222 (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174433 () Bool)

(declare-fun lt!86200 () ListLongMap!2161)

(assert (=> b!174433 (= e!115189 (= (apply!131 lt!86200 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3445 thiss!1248)))))

(declare-fun b!174435 () Bool)

(declare-fun e!115181 () Bool)

(assert (=> b!174435 (= e!115180 e!115181)))

(declare-fun res!82715 () Bool)

(declare-fun call!17665 () Bool)

(assert (=> b!174435 (= res!82715 call!17665)))

(assert (=> b!174435 (=> (not res!82715) (not e!115181))))

(declare-fun b!174436 () Bool)

(declare-fun c!31219 () Bool)

(assert (=> b!174436 (= c!31219 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!174436 (= e!115182 e!115188)))

(declare-fun b!174437 () Bool)

(assert (=> b!174437 (= e!115186 e!115182)))

(declare-fun c!31218 () Bool)

(assert (=> b!174437 (= c!31218 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17661 () Bool)

(assert (=> bm!17661 (= call!17665 (contains!1157 lt!86200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17662 () Bool)

(assert (=> bm!17662 (= call!17664 call!17662)))

(declare-fun b!174438 () Bool)

(declare-fun e!115185 () Bool)

(declare-fun get!1968 (ValueCell!1700 V!5097) V!5097)

(declare-fun dynLambda!465 (Int (_ BitVec 64)) V!5097)

(assert (=> b!174438 (= e!115185 (= (apply!131 lt!86200 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3461 (_values!3587 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!465 (defaultEntry!3604 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3762 (_values!3587 thiss!1248))))))

(assert (=> b!174438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))))))

(declare-fun b!174439 () Bool)

(declare-fun res!82716 () Bool)

(assert (=> b!174439 (=> (not res!82716) (not e!115179))))

(assert (=> b!174439 (= res!82716 e!115187)))

(declare-fun c!31217 () Bool)

(assert (=> b!174439 (= c!31217 (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!174440 () Bool)

(assert (=> b!174440 (= e!115181 (= (apply!131 lt!86200 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3445 thiss!1248)))))

(declare-fun b!174441 () Bool)

(declare-fun res!82714 () Bool)

(assert (=> b!174441 (=> (not res!82714) (not e!115179))))

(declare-fun e!115177 () Bool)

(assert (=> b!174441 (= res!82714 e!115177)))

(declare-fun res!82709 () Bool)

(assert (=> b!174441 (=> res!82709 e!115177)))

(assert (=> b!174441 (= res!82709 (not e!115178))))

(declare-fun res!82717 () Bool)

(assert (=> b!174441 (=> (not res!82717) (not e!115178))))

(assert (=> b!174441 (= res!82717 (bvslt #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))))))

(declare-fun b!174442 () Bool)

(assert (=> b!174442 (= e!115180 (not call!17665))))

(declare-fun b!174443 () Bool)

(assert (=> b!174443 (= e!115188 call!17664)))

(declare-fun b!174444 () Bool)

(assert (=> b!174444 (= e!115177 e!115185)))

(declare-fun res!82712 () Bool)

(assert (=> b!174444 (=> (not res!82712) (not e!115185))))

(assert (=> b!174444 (= res!82712 (contains!1157 lt!86200 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))))))

(declare-fun bm!17663 () Bool)

(declare-fun c!31220 () Bool)

(assert (=> bm!17663 (= call!17662 (+!243 (ite c!31220 call!17667 (ite c!31218 call!17663 call!17666)) (ite (or c!31220 c!31218) (tuple2!3243 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3445 thiss!1248)) (tuple2!3243 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3445 thiss!1248)))))))

(declare-fun bm!17664 () Bool)

(assert (=> bm!17664 (= call!17663 call!17667)))

(declare-fun d!53133 () Bool)

(assert (=> d!53133 e!115179))

(declare-fun res!82710 () Bool)

(assert (=> d!53133 (=> (not res!82710) (not e!115179))))

(assert (=> d!53133 (= res!82710 (or (bvsge #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))))))))

(declare-fun lt!86209 () ListLongMap!2161)

(assert (=> d!53133 (= lt!86200 lt!86209)))

(declare-fun lt!86208 () Unit!5339)

(assert (=> d!53133 (= lt!86208 e!115183)))

(declare-fun c!31221 () Bool)

(declare-fun e!115184 () Bool)

(assert (=> d!53133 (= c!31221 e!115184)))

(declare-fun res!82711 () Bool)

(assert (=> d!53133 (=> (not res!82711) (not e!115184))))

(assert (=> d!53133 (= res!82711 (bvslt #b00000000000000000000000000000000 (size!3761 (_keys!5446 thiss!1248))))))

(assert (=> d!53133 (= lt!86209 e!115186)))

(assert (=> d!53133 (= c!31220 (and (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3341 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53133 (validMask!0 (mask!8480 thiss!1248))))

(assert (=> d!53133 (= (getCurrentListMap!732 (_keys!5446 thiss!1248) (_values!3587 thiss!1248) (mask!8480 thiss!1248) (extraKeys!3341 thiss!1248) (zeroValue!3445 thiss!1248) (minValue!3445 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3604 thiss!1248)) lt!86200)))

(declare-fun b!174434 () Bool)

(assert (=> b!174434 (= e!115187 (not call!17668))))

(declare-fun bm!17665 () Bool)

(assert (=> bm!17665 (= call!17668 (contains!1157 lt!86200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174445 () Bool)

(assert (=> b!174445 (= e!115184 (validKeyInArray!0 (select (arr!3460 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53133 c!31220) b!174426))

(assert (= (and d!53133 (not c!31220)) b!174437))

(assert (= (and b!174437 c!31218) b!174431))

(assert (= (and b!174437 (not c!31218)) b!174436))

(assert (= (and b!174436 c!31219) b!174443))

(assert (= (and b!174436 (not c!31219)) b!174425))

(assert (= (or b!174443 b!174425) bm!17659))

(assert (= (or b!174431 bm!17659) bm!17664))

(assert (= (or b!174431 b!174443) bm!17662))

(assert (= (or b!174426 bm!17664) bm!17660))

(assert (= (or b!174426 bm!17662) bm!17663))

(assert (= (and d!53133 res!82711) b!174445))

(assert (= (and d!53133 c!31221) b!174427))

(assert (= (and d!53133 (not c!31221)) b!174428))

(assert (= (and d!53133 res!82710) b!174441))

(assert (= (and b!174441 res!82717) b!174430))

(assert (= (and b!174441 (not res!82709)) b!174444))

(assert (= (and b!174444 res!82712) b!174438))

(assert (= (and b!174441 res!82714) b!174439))

(assert (= (and b!174439 c!31217) b!174429))

(assert (= (and b!174439 (not c!31217)) b!174434))

(assert (= (and b!174429 res!82713) b!174433))

(assert (= (or b!174429 b!174434) bm!17665))

(assert (= (and b!174439 res!82716) b!174432))

(assert (= (and b!174432 c!31222) b!174435))

(assert (= (and b!174432 (not c!31222)) b!174442))

(assert (= (and b!174435 res!82715) b!174440))

(assert (= (or b!174435 b!174442) bm!17661))

(declare-fun b_lambda!6965 () Bool)

(assert (=> (not b_lambda!6965) (not b!174438)))

(declare-fun t!7025 () Bool)

(declare-fun tb!2765 () Bool)

(assert (=> (and b!174309 (= (defaultEntry!3604 thiss!1248) (defaultEntry!3604 thiss!1248)) t!7025) tb!2765))

(declare-fun result!4585 () Bool)

(assert (=> tb!2765 (= result!4585 tp_is_empty!4087)))

(assert (=> b!174438 t!7025))

(declare-fun b_and!10761 () Bool)

(assert (= b_and!10755 (and (=> t!7025 result!4585) b_and!10761)))

(declare-fun m!202957 () Bool)

(assert (=> b!174427 m!202957))

(declare-fun m!202959 () Bool)

(assert (=> b!174427 m!202959))

(declare-fun m!202961 () Bool)

(assert (=> b!174427 m!202961))

(declare-fun m!202963 () Bool)

(assert (=> b!174427 m!202963))

(declare-fun m!202965 () Bool)

(assert (=> b!174427 m!202965))

(declare-fun m!202967 () Bool)

(assert (=> b!174427 m!202967))

(declare-fun m!202969 () Bool)

(assert (=> b!174427 m!202969))

(declare-fun m!202971 () Bool)

(assert (=> b!174427 m!202971))

(declare-fun m!202973 () Bool)

(assert (=> b!174427 m!202973))

(declare-fun m!202975 () Bool)

(assert (=> b!174427 m!202975))

(declare-fun m!202977 () Bool)

(assert (=> b!174427 m!202977))

(declare-fun m!202979 () Bool)

(assert (=> b!174427 m!202979))

(declare-fun m!202981 () Bool)

(assert (=> b!174427 m!202981))

(declare-fun m!202983 () Bool)

(assert (=> b!174427 m!202983))

(assert (=> b!174427 m!202957))

(assert (=> b!174427 m!202971))

(declare-fun m!202985 () Bool)

(assert (=> b!174427 m!202985))

(declare-fun m!202987 () Bool)

(assert (=> b!174427 m!202987))

(assert (=> b!174427 m!202973))

(declare-fun m!202989 () Bool)

(assert (=> b!174427 m!202989))

(assert (=> b!174427 m!202981))

(declare-fun m!202991 () Bool)

(assert (=> bm!17663 m!202991))

(declare-fun m!202993 () Bool)

(assert (=> b!174433 m!202993))

(assert (=> b!174445 m!202963))

(assert (=> b!174445 m!202963))

(declare-fun m!202995 () Bool)

(assert (=> b!174445 m!202995))

(assert (=> d!53133 m!202893))

(declare-fun m!202997 () Bool)

(assert (=> b!174440 m!202997))

(assert (=> b!174444 m!202963))

(assert (=> b!174444 m!202963))

(declare-fun m!202999 () Bool)

(assert (=> b!174444 m!202999))

(declare-fun m!203001 () Bool)

(assert (=> b!174438 m!203001))

(assert (=> b!174438 m!202963))

(assert (=> b!174438 m!202963))

(declare-fun m!203003 () Bool)

(assert (=> b!174438 m!203003))

(assert (=> b!174438 m!203001))

(declare-fun m!203005 () Bool)

(assert (=> b!174438 m!203005))

(declare-fun m!203007 () Bool)

(assert (=> b!174438 m!203007))

(assert (=> b!174438 m!203005))

(declare-fun m!203009 () Bool)

(assert (=> b!174426 m!203009))

(declare-fun m!203011 () Bool)

(assert (=> bm!17665 m!203011))

(declare-fun m!203013 () Bool)

(assert (=> bm!17661 m!203013))

(assert (=> b!174430 m!202963))

(assert (=> b!174430 m!202963))

(assert (=> b!174430 m!202995))

(assert (=> bm!17660 m!202987))

(assert (=> b!174312 d!53133))

(declare-fun d!53135 () Bool)

(assert (=> d!53135 (= (array_inv!2233 (_keys!5446 thiss!1248)) (bvsge (size!3761 (_keys!5446 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174309 d!53135))

(declare-fun d!53137 () Bool)

(assert (=> d!53137 (= (array_inv!2234 (_values!3587 thiss!1248)) (bvsge (size!3762 (_values!3587 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174309 d!53137))

(declare-fun d!53139 () Bool)

(assert (=> d!53139 (= (validMask!0 (mask!8480 thiss!1248)) (and (or (= (mask!8480 thiss!1248) #b00000000000000000000000000000111) (= (mask!8480 thiss!1248) #b00000000000000000000000000001111) (= (mask!8480 thiss!1248) #b00000000000000000000000000011111) (= (mask!8480 thiss!1248) #b00000000000000000000000000111111) (= (mask!8480 thiss!1248) #b00000000000000000000000001111111) (= (mask!8480 thiss!1248) #b00000000000000000000000011111111) (= (mask!8480 thiss!1248) #b00000000000000000000000111111111) (= (mask!8480 thiss!1248) #b00000000000000000000001111111111) (= (mask!8480 thiss!1248) #b00000000000000000000011111111111) (= (mask!8480 thiss!1248) #b00000000000000000000111111111111) (= (mask!8480 thiss!1248) #b00000000000000000001111111111111) (= (mask!8480 thiss!1248) #b00000000000000000011111111111111) (= (mask!8480 thiss!1248) #b00000000000000000111111111111111) (= (mask!8480 thiss!1248) #b00000000000000001111111111111111) (= (mask!8480 thiss!1248) #b00000000000000011111111111111111) (= (mask!8480 thiss!1248) #b00000000000000111111111111111111) (= (mask!8480 thiss!1248) #b00000000000001111111111111111111) (= (mask!8480 thiss!1248) #b00000000000011111111111111111111) (= (mask!8480 thiss!1248) #b00000000000111111111111111111111) (= (mask!8480 thiss!1248) #b00000000001111111111111111111111) (= (mask!8480 thiss!1248) #b00000000011111111111111111111111) (= (mask!8480 thiss!1248) #b00000000111111111111111111111111) (= (mask!8480 thiss!1248) #b00000001111111111111111111111111) (= (mask!8480 thiss!1248) #b00000011111111111111111111111111) (= (mask!8480 thiss!1248) #b00000111111111111111111111111111) (= (mask!8480 thiss!1248) #b00001111111111111111111111111111) (= (mask!8480 thiss!1248) #b00011111111111111111111111111111) (= (mask!8480 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8480 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174313 d!53139))

(declare-fun b!174460 () Bool)

(declare-fun e!115197 () SeekEntryResult!554)

(assert (=> b!174460 (= e!115197 Undefined!554)))

(declare-fun b!174461 () Bool)

(declare-fun c!31230 () Bool)

(declare-fun lt!86222 () (_ BitVec 64))

(assert (=> b!174461 (= c!31230 (= lt!86222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115196 () SeekEntryResult!554)

(declare-fun e!115198 () SeekEntryResult!554)

(assert (=> b!174461 (= e!115196 e!115198)))

(declare-fun d!53141 () Bool)

(declare-fun lt!86223 () SeekEntryResult!554)

(assert (=> d!53141 (and (or ((_ is Undefined!554) lt!86223) (not ((_ is Found!554) lt!86223)) (and (bvsge (index!4385 lt!86223) #b00000000000000000000000000000000) (bvslt (index!4385 lt!86223) (size!3761 (_keys!5446 thiss!1248))))) (or ((_ is Undefined!554) lt!86223) ((_ is Found!554) lt!86223) (not ((_ is MissingZero!554) lt!86223)) (and (bvsge (index!4384 lt!86223) #b00000000000000000000000000000000) (bvslt (index!4384 lt!86223) (size!3761 (_keys!5446 thiss!1248))))) (or ((_ is Undefined!554) lt!86223) ((_ is Found!554) lt!86223) ((_ is MissingZero!554) lt!86223) (not ((_ is MissingVacant!554) lt!86223)) (and (bvsge (index!4387 lt!86223) #b00000000000000000000000000000000) (bvslt (index!4387 lt!86223) (size!3761 (_keys!5446 thiss!1248))))) (or ((_ is Undefined!554) lt!86223) (ite ((_ is Found!554) lt!86223) (= (select (arr!3460 (_keys!5446 thiss!1248)) (index!4385 lt!86223)) key!828) (ite ((_ is MissingZero!554) lt!86223) (= (select (arr!3460 (_keys!5446 thiss!1248)) (index!4384 lt!86223)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!554) lt!86223) (= (select (arr!3460 (_keys!5446 thiss!1248)) (index!4387 lt!86223)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53141 (= lt!86223 e!115197)))

(declare-fun c!31231 () Bool)

(declare-fun lt!86221 () SeekEntryResult!554)

(assert (=> d!53141 (= c!31231 (and ((_ is Intermediate!554) lt!86221) (undefined!1366 lt!86221)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7287 (_ BitVec 32)) SeekEntryResult!554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53141 (= lt!86221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8480 thiss!1248)) key!828 (_keys!5446 thiss!1248) (mask!8480 thiss!1248)))))

(assert (=> d!53141 (validMask!0 (mask!8480 thiss!1248))))

(assert (=> d!53141 (= (seekEntryOrOpen!0 key!828 (_keys!5446 thiss!1248) (mask!8480 thiss!1248)) lt!86223)))

(declare-fun b!174462 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7287 (_ BitVec 32)) SeekEntryResult!554)

(assert (=> b!174462 (= e!115198 (seekKeyOrZeroReturnVacant!0 (x!19223 lt!86221) (index!4386 lt!86221) (index!4386 lt!86221) key!828 (_keys!5446 thiss!1248) (mask!8480 thiss!1248)))))

(declare-fun b!174463 () Bool)

(assert (=> b!174463 (= e!115196 (Found!554 (index!4386 lt!86221)))))

(declare-fun b!174464 () Bool)

(assert (=> b!174464 (= e!115197 e!115196)))

(assert (=> b!174464 (= lt!86222 (select (arr!3460 (_keys!5446 thiss!1248)) (index!4386 lt!86221)))))

(declare-fun c!31229 () Bool)

(assert (=> b!174464 (= c!31229 (= lt!86222 key!828))))

(declare-fun b!174465 () Bool)

(assert (=> b!174465 (= e!115198 (MissingZero!554 (index!4386 lt!86221)))))

(assert (= (and d!53141 c!31231) b!174460))

(assert (= (and d!53141 (not c!31231)) b!174464))

(assert (= (and b!174464 c!31229) b!174463))

(assert (= (and b!174464 (not c!31229)) b!174461))

(assert (= (and b!174461 c!31230) b!174465))

(assert (= (and b!174461 (not c!31230)) b!174462))

(declare-fun m!203015 () Bool)

(assert (=> d!53141 m!203015))

(assert (=> d!53141 m!202893))

(declare-fun m!203017 () Bool)

(assert (=> d!53141 m!203017))

(declare-fun m!203019 () Bool)

(assert (=> d!53141 m!203019))

(declare-fun m!203021 () Bool)

(assert (=> d!53141 m!203021))

(declare-fun m!203023 () Bool)

(assert (=> d!53141 m!203023))

(assert (=> d!53141 m!203019))

(declare-fun m!203025 () Bool)

(assert (=> b!174462 m!203025))

(declare-fun m!203027 () Bool)

(assert (=> b!174464 m!203027))

(assert (=> b!174316 d!53141))

(declare-fun b!174472 () Bool)

(declare-fun e!115203 () Bool)

(assert (=> b!174472 (= e!115203 tp_is_empty!4087)))

(declare-fun b!174473 () Bool)

(declare-fun e!115204 () Bool)

(assert (=> b!174473 (= e!115204 tp_is_empty!4087)))

(declare-fun mapIsEmpty!6971 () Bool)

(declare-fun mapRes!6971 () Bool)

(assert (=> mapIsEmpty!6971 mapRes!6971))

(declare-fun mapNonEmpty!6971 () Bool)

(declare-fun tp!15629 () Bool)

(assert (=> mapNonEmpty!6971 (= mapRes!6971 (and tp!15629 e!115203))))

(declare-fun mapKey!6971 () (_ BitVec 32))

(declare-fun mapValue!6971 () ValueCell!1700)

(declare-fun mapRest!6971 () (Array (_ BitVec 32) ValueCell!1700))

(assert (=> mapNonEmpty!6971 (= mapRest!6962 (store mapRest!6971 mapKey!6971 mapValue!6971))))

(declare-fun condMapEmpty!6971 () Bool)

(declare-fun mapDefault!6971 () ValueCell!1700)

(assert (=> mapNonEmpty!6962 (= condMapEmpty!6971 (= mapRest!6962 ((as const (Array (_ BitVec 32) ValueCell!1700)) mapDefault!6971)))))

(assert (=> mapNonEmpty!6962 (= tp!15613 (and e!115204 mapRes!6971))))

(assert (= (and mapNonEmpty!6962 condMapEmpty!6971) mapIsEmpty!6971))

(assert (= (and mapNonEmpty!6962 (not condMapEmpty!6971)) mapNonEmpty!6971))

(assert (= (and mapNonEmpty!6971 ((_ is ValueCellFull!1700) mapValue!6971)) b!174472))

(assert (= (and mapNonEmpty!6962 ((_ is ValueCellFull!1700) mapDefault!6971)) b!174473))

(declare-fun m!203029 () Bool)

(assert (=> mapNonEmpty!6971 m!203029))

(declare-fun b_lambda!6967 () Bool)

(assert (= b_lambda!6965 (or (and b!174309 b_free!4315) b_lambda!6967)))

(check-sat (not b!174433) (not d!53131) (not b!174440) (not b!174371) (not b_lambda!6967) (not b!174372) tp_is_empty!4087 (not b_next!4315) (not mapNonEmpty!6971) (not bm!17660) (not b!174462) (not b!174444) (not bm!17663) (not d!53129) (not bm!17665) (not b!174382) (not b!174438) (not b!174427) (not b!174426) (not bm!17661) (not d!53133) (not d!53141) b_and!10761 (not b!174430) (not b!174445) (not b!174380) (not b!174373))
(check-sat b_and!10761 (not b_next!4315))
